#root  via  SMS:  4G  access  level   security  assessment  
  Timur  Yunusov   Kirill  Nesterov  
h;p://scadasl.org  

SCADAStrangeLove  

who  we  are  

Timur  @a66at  Yunusov  

Sergey  @scadasl  Gordeychik  

Alex  @arbitrarycode  Zaitsev  

Alexey  @GiLsUngiven  Osipov  

Kirill  @k_v_Nesterov  Nesterov  

Gleb  @repdet  Gritsai   

    

Dmitry  @_Dmit  Sklyarov  

Dmitry  Kurbatov    

Sergey  Puzankov

    

Pavel  Novikov  

h"p://scadasl.org  

3G/4G  network  

the  Evil  

4G access level
É Branded mobile equipment
É 3G/4G USB Modems É Routers / Wireless Access Point É Smartphones/Femtocell/Branded applications
É (U)SIM cards É Radio/IP access network
É Radio access network É IP access (GGSN, Routers, GRX)

why?
É we use it every day
É Internet É social network É to hack stuff
É IT use it everyday
É ATM É IoT É SCADA

radio  access  network  
· Well  researched  by  community  
­ h;p://security.osmocom.org/trac/    
· Special  thanks  to  
­   Sylvain  Munaut/Alexander  Chemeris/Karsten  Nohl/et  al.  
h;p://security.osmocom.org/trac/  

the  NET  

the  NET  

thanks  John  
h;p://www.shodanhq.com/  

by  devices    

GPRS  Tunnelling  Protocol  
ÉGTP--C  UDP/2123     ÉGTP--U  UDP/2152   ÉGTP'  TCP/UDP/3386  
    

Meanwhile  in  the  real  world  
h;p://blog.ptsecurity.com/2015/02/the--research--mobile--internet--traffic.html  

A;acks  
É GGSN  PWN        É GRX   É GPRS  a;acks  
É DoS   É Informacon  leakage   É Fraud   É APN  guessing    
     h;p://blog.ptsecurity.com/2013/09/inside--mobile--internet--security.html                       h;p://bit.ly/195ZYMR  

Example:  GTP  "Synflood"  
h;p://blog.ptsecurity.com/2013/09/inside--mobile--internet--security.html                       h;p://bit.ly/195ZYMR  

We're inside, what's next?
É All old IP stuff
É traces 1.1.1.1/10.1.1.1 É IP source routing É Management ports É All new IP stuff É IPv6 É MPTCP
É Telco specific (GTP, SCTP M3UA, DIAMETER etc)
h;p://ubm.io/11K3yLT                     h;ps://www.thc.org/thc--ipv6/  

Here There Be Tygers

1990th
É Your balance is insufficient
É Connect to your favorite UDP VPN

Resume
É For telcos
É Please scan all your Internets! É Your subscribers network is not your internal network
É For auditors
É Check all states É online/blocked/roaming
É Check all subscribers É APN's, subscribers plans
É Don't hack other subscribers
h;p://www.slideshare.net/phdays/how--to--hack--a--telecommunicacon--company--and--stay--alive--gordeychik/32  

The Device

Who is mister USB-modem?
É Rebranded hardware platform É Linux/Android/BusyBox onboard É Multifunctional
É Storage
É CWID USB SCSI CD-ROM USB Device É MMC Storage USB Device (MicroSD Card Reader)
É Local management
É COM-Port (UI, AT commands)
É Network
É Remote NDIS based Internet Sharing Device É WiFi

Ooooold story
É Well researched
É «Unlock» É «Firmware customization» É «Dashboard customization»
É Some security researches
É http://threatpost.com/using-usb-modems-to-phish-and-send-malicious-sms-messages É http://www.slideshare.net/RahulSasi2/fuzzing-usb-modems-rahusasi É http://2014.phdays.com/program/business/37688/ É http://www.evilsocket.net/2015/02/01/huawei-usb-modems-authentication-bypass/ É http://www.huawei.com/en/security/psirt/security-bulletins/security-advisories/hw-360246.htm

Where're you from?
É Huawei É Quanta É ZTE É GEMTEK

Developers `security' path
ÉDevice «Hardening» ÉDisabling of local interfaces (COM) É Web-dashboards

How it works (RNDIS)

Broadband  conneccon  

DHCP  server   DNS   Web  dashboard   Roucng/NAT  

New  Ethernet  adapter   DHCP  client  

Scan it

Sometimes you get lucky...

...other times you don't

all I need is RCE Love !
É telnet/snmp?
É Internal interface only É Blocked by browsers
É http/UPNP?
É Attack via browser (never found CSRF tokens)
É broadband
É still researching

Basic impact
É Info disclosure É Change settings
É DNS (intercept traffic) É SMS Center (intercept SMS) É Manipulate (Set/Get) É SMS É Contacts É USSD É WiFi networks

Advanced impact
É Self-service portal access
É XSS (SMS) to "pwn" browser É CSRF to send "password reset" USSD É XSS to transfer password to attacker
É "Brick"
É PIN/PUK "bruteforce" É Wrong IP settings
É Spy device

DEMO

"hidden" firmware uploads

Cute, but...
É You need to have firmware
ÉSometimes you get lucky... É...other times you don't
É Integrity control
ÉAt least should be... É CRC16 ÉCrypto Functions (ok, then we just delete
checksum.sh)

dig deeper...
É Direct shell calls É awk to calculate Content-Length É Other trivial RCE

Getting the shell

6month's homework: NSA at home
É You can rent the modem for 1 week É You can use RCE and CSRF for local remote
infection of the system É Return it É You can spy with opensource products (
http://opencellid.org/ etc) via CellID and WiFi É You can intercept HTTP/HTTPS via DNS spoofing É Maybe more? É Do not hack other subscribers!

I'm watching you...

Stat (1 week of detecting)

Modem  

Vulnerabili8es  

A   RCE  CSRF  XSS  WiFi  Access  

B   RCE  CSRF  XSS  

C   RCE  CSRF  

D     "Unvulnerable"  
É1  step  to  5000+  infected  modems  

Total  
  1411     1250     1409     946  

Cute, but... É Get firmware?
ÉYes it nice.
É Find more bugs?
ÉWe have enough...
É Get SMS, send USSD?
ÉCan be done via CSRF/XSS...
É PWN the subscriber?

RCE+CD-ROM Interface=Host infection
É Maybe we'll wrote our own "diagnostic tool for YOUR modem xxx"

It still in USB!

It still in (bad) USB!
h;ps://srlabs.de/blog/wp--content/uploads/2014/07/SRLabs--BadUSB--BlackHat--v1.pdf  

USB  gadgets  &  Linux  
· drivers/usb/gadget/*   · Composite  framework  
­ allows  mulcfuncconal  gadgets   ­ implemented  in  composite.c  

Android  gadget  driver  
· Implemented  in  android.c   · Composite  driver  wrapper  with  some  UI   · /sys/class/android_usb/android0  
­ enabled   ­ funccons   ­ Class/Protocol/SubClass  etc.   ­ List  of  supported  funccons  
· Your  favorite  phone  can  become   audio_source  instead  of  mass  storage  

What  about  HID  device?  
· Patch  kernel,  compile,  flash  new  kernel  =>   BORING!!!  

What  about  HID  device?  
· Android  gadget  driver  works  with   supported_funccons  
· We  can  patch  it  in  runcme!  
­ Add  new  hid  funccon  in  supported_funccons   array  
­ Restart  device   ­ ...   ­ PROFIT  

Sad  Linux  
· By  default  kernel  doesn't  have  g_hid  support   · Hard  to  build  universal  HID  driver  for  different  
versions  
­ vermagic   ­ Funccon  prototypes/structures  changes  over  cme   ­ Different  CPU  
· Vendors  have  a  hobby  ­  rewrite  kernel  at   unexpected  places  
· Fingerprint  device  before  hack  it!  

DEMO

Some Huawei
Hisilicon hi6920  ARM Linux box Stack overflow Remote firmware upload

Unexpected VxWorks
 dmesg [000003144ms] his_modem_load_vxworks:164:
>>loading:vxworks.....

Baseband reversing
Network stack protocol
· ASN1 hell · Lots 3GPP
 RTOS Debug can be hard

VxWorks on baseband
Loaded by Linux Packed on flash dmesg => load vxworks ok, entey 0x50d10000  CShell
· OS communication · Builtin debuger
Nearly all names of objects/functions POSIX + documentation

Resume
É For telcos
É Do not try to reinvent the wheel webserver É All your 3/4G modems/routers are 5/\>< belong to us
É For everybody
É Please don't plug computers into your USB É Even if it's your harmless network printer 4G modem

The Chip

What is SIM: for hacker
 Microcontroller
· Own OS · Own file system · Application platform and API
Used in different phones (even after upgrade) OS in independent, but can kill all security
· Baseband access · OS sandbox bypass

What has Karsten taught us?
É There are applications on SIM card É Operator can access you SIM card by
means of binary SMS É Identifier for accessing such
applications is TAR (Toolkit Application Reference)

What has Karsten taught us?
É Not all TARs are equally secure É If you are lucky enough you could find
something to bruteforce É If you are even more lucky you can
crack some keys É Or some TARs would accept commands
without any crypto at all
h;ps://srlabs.de/roocng--sim--cards/  

Getting the keys
É Either using rainbow tables or by plain old DES cracking
É We've chosen the way of brute force É Existing solutions were too slow for us É So why not to build something new?

Getting the keys
É So why not to build something new? É Bitcoin mining business made another
twist É Which resulted in a number of
affordable FPGAs on the market É So...

The rig É Here's what we've done ­ proto #1

The rig É Here's what we've done ­ proto #2

The rig
É Here's what we've done ­ "final" edition

The rig

É Some specs: Hardware  

Speed

Time for

Time for 3DES

      (Mcrypt/sec) DES (days) (part of key is

known, days)  

Intel CPU (Core
i7-2600K)  
   Radeon GPU (R290X)    Single chip (xs6slx150-2)
ZTEX 1.15y  
   Our rig (8*ZTEX 1.15y)

475   1755,8   (~5 years)  

3`000  

278  

7`680  

108,6  

30`720  

27,2  

245`760  

3,4  

5267,4  
834   325,8   81,6   10,2  

+  descrypt  bruteforcer  --  h;ps://twi;er.com/GiLsUngiven/status/492243408120213505  

Now what?
É So you either got the keys or didn't need them, what's next?
É Send random commands to any TARs that accept them
É Send commands to known TARs

Now what?
É Send random commands to TARs that accept them
É Many variables to guess:
CLA INS P1 P2 P3 PROC DATA SW1 SW2
É Good manuals or intelligent fuzzing needed
É Or you'll end up with nothing: not knowing what you send and receive

Now what?
É Send commands to known TARs
É Card manager (00 00 00) É File system (B0 00 00 - B0 FF FF) É ...

Now what?
File system (B0 00 00 - B0 FF FF)
É Stores interesting stuff: TMSI, Kc É May be protected by CHV1 == PIN code

Attack?
É No fun in sending APDUs through card reader
É Let's do it over the air! É Wrap file system access APDUs in binary
SMS É Can be done with osmocom, some gsm
modems or SMSC gateway

Attack?
É Binary SMS can be filtered É Several vectors exist:
É Intra-network É Inter-network É SMS gates É Fake BTS/FemtoCell

Attack?
É Wait! What about access conditions?
É We still need a PIN to read interesting stuff
É Often PIN is set to 0000 by operator and is never changed
É Otherwise needs bruteforcing

Attack?
É PIN bruteforce
É Only 3 attempts until PIN is blocked É Needs a wide range of victims to get
appropriate success rate É Provides some obvious possibilities...

Attack?
É Byproduct attack ­ subscriber DoS
É Try 3 wrong PINs É PIN is locked, PUK requested É Try 10 wrong PUKs É PUK is locked É Subscriber is locked out of GSM network -
needs to replace SIM card

Attack?
É To sniff we still got to figure out the ARFCN É There are different ways... É Catching paging responses on CCCH feels like
the most obvious way É Still have to be coded ­ go do it! É Everything could be built on osmocom-bb...

Attack?
É Assuming we were lucky enough
É We do have the OTA key either don't need one
É We've got the PIN either don't need one É All we need is to read two elementary files É MF/DF/EF/Kc and MF/DF/EF/loci É Go look at SIMTracer!

Attack?
É Assuming we were lucky enough É We now got TMSI and Kc and don't need to rely on Kraken anymore
É Collect some GSM traffic with your SDR of choice or osmocom-bb phone
É Decrypt it using obtained Kc É Or just clone the victim for a while using
obtained TMSI & Kc É Looks like A5/3 friendly! É Profit!

DEMO

So?
É Traffic decryption only takes 2 binary messages É DoS takes 13 binary messages and can be done
via SMS gate É There are valuable SMS-packages. Catch the
deal. É There are also USSDs...

"What a girl to do?"
É Change PIN, maybe... É Run SIMTester! É Use PSTN FTW:( É Pigeon mail anyone?

"What a girl to do?"
É Change PIN, maybe... É Run SIMTester! É Use PSTN FTW:( É Pigeon mail anyone?

Resume
É For telcos
É Check all your SIMs É Train your/contractor of SIM/App/Sec
É For everybody
É Pray

Thanks!

