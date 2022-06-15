Dissecting a CloudConnected E-Scooter
JD-HITBSecConf 2018 November 2, 2018 Beijing, China
Nikias Bassen @pimskeks nikias@corellium.com

Outline
· Introduction · The Target · Smartphone App · GSM/GPRS Connectivity · Small Demo · Conclusions

About me (1)
· IT Expert from Germany, Diploma in Computer Science (University of Bremen, Germany)
· Involved in RE & Security Research for > 15 years  · RE of iTunes database hashing algorithm · RE of iTunes/iOS communication protocols · Leading Developer of libimobiledevice project

About me (2)
· 2018-now VP of Platform & Security, CORELLIUM
· 2017-2018 VP of Platform Research, ZIMPERIUM
· 2015-2017 Mobile Security Researcher, ZIMPERIUM
· 2010-2015 Self-Employed, custom IT solutions - RE & Research as a hobby - 2013 evad3rs - 2012 Jailbreak Dream Team - 2011 Chronic-Dev Team

Why this topic?
· Started to work ~6 months ago at Corellium, virtualizing iPhones (amazing stuff!)
· We have lots of work to focus on, no time to do any research (hopefully again in the near future)
· No completed research on iOS currently · I just bought that E-Scooter, and said "why not?!"

The Target

The Target
· Niu N1S E-Scooter
 · Jiangsu Niu Electric Technology
Co., Ltd., China · Cloud-Connected (GSM) · Smartphone App · USB Port

USB Port - Diagnostics?
· Vendor: charging port for phone · Me: maybe used for diagnostics? · Raspberry Pi: Nah... · Nope, doesn't detect anything

Real Diagnostics Port
· Battery charging port under the seat also used as diagnostics port
· Used by NIU dealer with dedicated diagnostics device
· Supposedly RS-485 serial communication
· Couldn't check, lack of time and hardware

China Shopping List ++
Yes, the connector won't fit, but you get the idea :)

Smartphone App

Smartphone App
· Battery level & estimated distance · Lock status · Current location · Weather report · Overview of past trips and statistics · Smart Check (scooter self-diagnosis) · Service information · Push notifications about unexpected
movement, battery removal, etc.

Registration + Binding
· Account registration required with Phone number or Email
· Scooter needs to be bound to account
· S/N required, printed on manual (QR code), not found on vehicle itself
· By default, adding someone's S/N requires confirmation (see screenshot on the right)
· One vehicle can be bound to 5 accounts max.

Let's dump the App
· Jailbroken iPhone + Clutch
· IDA Pro Disassembler
· ID: com.niu.xiaoniuAborad
· Lastest version: 3.4.8 (version initially dumped 3.4.6)
· Binary: managerAborad.app/ managerAborad
· Most likely a typo Aborad => Abroad

First, lets have a look

First, lets have a look

EXT_RELEASE.json

Web API !
· URLs for different actions: · User signup, login, account & permission settings · Vehicle position, battery and health status, smart check · Service status, Ownership transfer · Theft reports · Driving statistics · Some social media stuff

EXT_TEST.json ?
· Same API calls, just different base URL account-dev.niucache.com instead of account.niu.com app-api-dev.niucache.com instead of app-api.niu.com
· App offers test account

Let's check how this works

Let's check how this works
Token! JSON Web Token!

We can query data!
· Vehicle(s) bound to account:
· Vehicle position (requires SN):

... and some more ...
· Battery information:
· Firmware information:

Let's rename the scooter!
· Change vehicle name:
· Whoops! Nice, web API speaks Chinese and English! "" => "Vehicle name cannot be empty"
· Let's try again:

Let's rename the scooter!

So what else can we do?
· Web API requires Authentication 
· Uses HTTPS  · No certificate pinning 
· Vehicle S/N bound to account, can't be added by default, owner confirmation required 
· Some API calls even require confirmation by account owner by SMS or Email, e.g. ownership transfer 
· Attacker could MITM the connection, but bad stuff can't easily be done, bind permissions just require a token though 

GSM/GPRS Connectivity

GSM/GPRS Connectivity
· Scooter comes with installed Prepaid SIM-Card (installed by Importer / KSR Group in Europe)
· Always connected (if there is network...)
· Scooter has a separate ECU battery, that lasts for about 3-4 days if main battery is unplugged
· Gives GPS and vehicle information without main battery

Let's hack that GSM already!
· OK What do we need? · Something that can modulate GSM frequencies · Something that acts as a GSM base station

GSM Hacking Equipment
· While certainly not the best, this equipments works: · bladeRF x40 + GSM Antennas · Raspberry Pi 3 · YateBTS base station software · Power!

So how to set this up?

· My former co-worker Simone Margaritelli (@evilsocket) tried this before:
https://www.evilsocket.net/ 2016/03/31/how-to-build-your-ownrogue-gsm-bts-for-fun-and-profit/

· However, he removed the version requirements which are really important for this to work.

· This blog article has all the information though: 
https://blog.strcpy.info/ 2016/04/21/building-a-portable-gsmbts-using-bladerf-raspberry-andyatebts-the-definitive-guide/



Let's try it?! Not so fast.
· If you want a GSM device connect to your BTS, you need to simulate the right network
· Germany has 3 PLMNs: · Telekom (26201) · Vodafone (26202) · and Telefónica (26203)

Also, power...
· The integrated USB port rates 1 Amp only.This isn't enough to properly power the Raspberry Pi AND the bladeRF at the same time
· Strong battery pack or power supply via mains needed

Sounds easy, right?
· Doing a quick research, it showed that the importer said in a press release that they partnered with Vodafone
· So let's set this up to simulate Vodafone.de ! · Also, make sure to select a correct frequency in the
right band (Vodafone uses GSM900 and GSM 1800)

YateBTS configuration

Now, wait...
· You can wait for a long time... · Especially if you have a BTS near your home  · If a nearby BTS has a strong signal the Scooter won't
connect · But my phone always has bad network at home so
this must work somehow...

Then suddenly...
· My phone - which also uses Vodafone - receives text message
· Turns out the BTS actually works!

OK, let's wait longer...
· I was already thinking about other solutions when I suddenly realized that the BTS showed a new subscriber!

Gotcha!
· IMSI shows prefix of 20404 - Vodafone Netherlands · This SIM is actually Roaming!  · Let's see what else we can find out?
YateBTS verbose log output:

Let's check out the IMEI

OK so what next?
· We want to MITM the connection between Scooter and remote server
· YateBTS supports GPRS routing
=> Remember to enable IP forwarding and IP masquerading on the Raspberry Pi!
· Let's ask YateBTS' SGSN (Serving GPRS Support Node)
· It doesn't want to connect through GPRS 

Then, I lost the connection...
· The Scooter disconnected. I waited and waited, but it didn't want to reconnect anymore...
· I had to come up with an idea to make it connect just to my BTS
· I tried setting the MCC and MNC to 20404, but it didn't want to connect
· I tried restarting YateBTS, but nothing worked

Ideas, I need ideas...
· Maybe it connects via 3G or even LTE? I was skeptical but then also I didn't know...
· Too bad I didn't by that frequency jammer last time I was in Shenzhen, I knew I would need it!
· Let's build a faraday cage?

Come on...
· Need to find a way it can't find a real BTS to connect to
· At my son's school there's really bad reception, let's go there...
· Still there seemed to be too much signal strength 
· Also, the battery pack I had, and also my MacBook couldn't properly power the bladeRF...

Then, I had an idea
· I remembered there's a parking garage nearby, A DARK AND SHADY PLACE !
· This must work! If there is no BTS it *JUST HAS* to connect to mine, right?
· Only problem was power... But I have a power converter in my car so that should do it

Into the Darkness...
· So I entered the garage and the scooter actually lost signal -- PERFECT!
· I set up the BTS and everything, and waited...
· ... and waited ...
· I couldn't believe it. It didn't want to connect even though I am the only reachable BTS
· But somehow my phone also didn't want to connect, not sure what was wrong... maybe interference? maybe the smell?

...there was another problem
· Even if it would connect to the BTS, it wouldn't be able to connect to the internet (via YateBTS' SGSN)
· Even my phone didn't have a signal so I couldn't use my hotspot
· I was disappointed and out of ideas, and went home · I was about to give on on this, actually 

Let's give it another try
· I set up my BTS at home again, because I said, hey it connected once maybe it connects again, what do I have to lose?
· But it didn't want to connect. For an entire day, nothing happened.The real BTS was still too strong...
· I unscrewed the front panel of my scooter to check where the GSM module sits. It is in the upper front.
· But it has a sticker WARRANTY VOID IF BROKEN so I didn't really want to mess around with that...

Making the signal weaker?
· Aluminum foil! · Didn't help, GPS signal lost a few bars though
· I re-parked my scooter so that my car would be between it and the BTS · Still no real change...

Then...
· Suddenly, activity in the console where YateBTS was running 
· First I thought it's probably my phone again but...
· IT ACTUALLY CONNECTED

Wait, let's check the SGSN
· It was connected through the SGSN! · Let's dump some packets! · Uh wait. How do we even do that? Did I enable GSM/
GPRS tapping in YateBTS? · I didn't but...

Phew...
· Luckily,YateBTS creates a TUN device "sgsntun" · So on the Raspberry Pi I can now do:
tcpdump -i sgsntun -n -v -w dump.pcap
· Packet counter increased slowly, every few minutes · With ignition on, it sends packets every few seconds · I copied the dump.pcap to my computer and ran it
through Wireshark

The vehicle gateway!
Let's have a look at what we captured:
· Resolves ecu.niu.com via DNS · Sends UDP packets to ecu.niu.com on port 8888 · (That ICMP is my attempt to ping the scooter)

The packets
· Binary packet format Seriously, I was expecting JSON!
· Let's try to figure something out by looking at consecutive packets
· Shows some common patterns but also large parts that change
· Especially last few ~20 bytes
· Checksum? SHA1?

Packet Checksum
· Turns out to be MD5!

Packet format?
· First two (?) bytes seem to define the type of the packet
· Can't really figure out a length field or anything obvious
· It needs to contain vehicle identification and GPS coordinates

Packet format?
· Seems somehow encoded. None of the Vehicle SN, or frame number or engine number seem to match in any way.
· Still it must have some kind of identification, otherwise it wouldn't know which scooter sent the data.
· Even though we don't understand the packet format completely we know that it has a checksum

What can we do with this?
· We can modify a packet, and apply the correct checksum and send it to ecu.niu.com 8888
· In the hopes of supplying different GPS coordinates I tried, but no reaction in the app...
· Research continues... (happy if someone has ideas!)

Can't we do something?
· Maybe we can replay packets?
· Let's use a simple python script that just reads a file and sends it to ecu.niu.com port 8888
· I could submit a slightly different position from a few minutes ago and it showed up in the app 
· Let's think about this. Meanwhile, let's look at something else...

OTA Firmware update?
· Yes, the Niu can be updated over the air! Isn't that awesome?
· Since we can now dump the traffic, let's do this.What could possibly go wrong when it goes through our BTS?

Triggering the update
· To trigger an update, the Web API has this: POST to https://app-api.niu.com/motorota/updatemotor with SN (and token of course)
· To make the scooter start the update you have to turn the ignition off and on again, and then it shows progress:

Now be patient...
· The app says it will take about 10 minutes · From the API we actually know the update size:
· So while we wait, let's take a look at the traffic...

Start of OTA traffic

OTA traffic continued

OTA Download
· Download via plain HTTP in 1kB chunks from:
http://erom.niucache.com/rom/N1SP/V1.0/ TRA01C10ECP001.bin?sn=NASxxxxxxxxxxxxx
http://erom.niucache.com/rom/N1SP/V1.0/ TRA01C10ECP002.bin?sn=NASxxxxxxxxxxxxx
...
· Vehicle SN as query parameter, however turns out you can pass whatever you want 
· New connection for every chunk
· In my dump I could see chunks being re-transferred, guess my BTS hardware isn't the most reliable 

OTA Download
· To download the firmware you basically need to know the size and then you can do something like (bash): 
$ for I in {1..42}; do curl http:// erom.niucache.com/rom/N1SP/V1.0/ TRA01C10ECP`printf %03d $I`.bin?sn=blah > TRA01C10ECP`printf %03d $I`; done  $ cat TRA01C10ECP0* > firmwareTRA01C10ECP.bin

OTA Firmware
· Seems encrypted. No obvious header, high entropy, no strings... ¯\_()_/¯

Meanwhile: Update finished?
· Almost there...
· App reported an error, saying to try again · But the scooter seems fine.After closing the app it was
actually shown as being up-to date.

OTA Risks?
· The vehicle gateway sends update trigger packet(s) to the ECU
· In theory, the vendor could trigger an update at any time
· However if the ignition is on it won't start until you turn off the ignition and turn it back on

Firmware hackable?
· Possibly, but need to understand the firmware first · Also the update trigger packet will probably contain
information about the update package and size so the ECU knows what to download · But... I want to make my Scooter faster!

Behold! There's a solution
· Source: http://www.myniu.org/making-the-n1s-faster/ · By adding a 2nd controller that drives the motor
while the original controller talks to the system 
This is probably illegal in most countries. Don't do it.

China shopping list ++

So. Back to replaying...
· What could we actually replay to see if it works properly?
· Remember, the App has push notifications :)
· For some reason, the 'unusual movement' detection hasn't been working for a while
· But every time you unplug the battery, the app shows a notification
· Let's unplug the battery, dump the packet, and replay

DEMO TIME

Conclusions
· Overall, the vendor did a really good job!
· Pretty solid implementation, safety checks etc.
· It has some small issues, like missing certificate pinning, but that's minor
· (Most likely) Encrypted firmware
· Encrypted(?) packet format for GPRS connection though vulnerable to replaying

Thanks! !

