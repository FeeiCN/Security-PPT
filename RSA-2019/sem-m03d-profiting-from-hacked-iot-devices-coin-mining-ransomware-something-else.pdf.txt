SESSION ID: SEM-M03D
Profiting from Hacked IoT Devices: Coin Mining, Ransomware, Something Else?

Candid Wueest
Threat Researcher Symantec @MyLaocoon

#RSAC

#RSAC
What do cyber criminals do with 100,000 IoT bots?
2

#RSAC
Different motivations for different attackers

Profit/Financial
· Loot online accounts · Steal credit card details · Extortion & scams · Crypto coin mining

Espionage/Sabotage
· Steal company secrets · Monitor communication · Sabotage of critical targets · Wipe company systems

Ideology/Personal
· Disclose scandals & leaks · Hacking for fun & fame · Statements e.g. DDoS · Social media bots /
propaganda

3

#RSAC
How devices get infected... ...is not part of this talk.

75% of infections are on routers | avg. of 6 IoT devices / house*

Infection vectors:

Most common IoT threats:

IoT default credentials Exploits (service & protocol) Prescanned list e.g. Shodan LAN attacks e.g. DNS rebinding/UPnP Supply chain/second hand

Threat name Percentage

LightAidra

31.3%

Kaiten

31.0%

Mirai

17.8%

Downloader 11.7%

Gafgyt/BashLite 1.7%

Main purpose DDoS DDoS DDoS/Misc Misc DDoS

(* Norton Core data (US))

4

Possible scenarios for cyber criminals

· DDoS attacks · Spam attacks · Cryptocurrency mining · Ransomware/locker · Blackmail/extortion · Pranks/nuisance

· Information stealing · Click fraud/ad fraud · Premium services · Network sniffing · Attack other devices · Proxy network

5

DDoS with IoT
Most common payload (e.g. Mirai)
­ Very noisy (even when pulsed) devices will get blocked
IoT protocols can be used as DoS amplification
­ E.g. Constrained Application Protocol (CoAP) & MQTT
Profits are medium:
­ Not expensive to rent ­ Often used for extortion ­ $5-10K/month for stresser service
6

#RSAC
Profitability Feasibility Stealth Prevalence

Spamming through IoT
Sending typical spam emails
­ Feasible, but little profit (e.g. ProxyM)
Hijack printer to spit out spam
­ YouTuber mass rally in 2018
Music/video spam
­ «RickRoll», but with advertisements ­ YouTuber mass rally in 2018 on TVs
Profits are low:
­ Not expensive ­ Kelihos (not IoT): $500 to send 1M spam
7

#RSAC
Profitability Feasibility Stealth Prevalence

Crypto coin mining on IoT

Limiting factors

­ Not all devices have enough performance

­ Crypto coin prices are down

9

8

Easy to cash out «anonymously»

7

6

Router can inject script into traffic

5

4

­ Mining is done on non-IoT devices

3

2

Profits are medium-low:

1

­ Satori: ETH $35/month

0

­ Hide'n'Seek: XMR $25/month (300H/S/1k bots)

­ Smominru (not IoT): XMR $25,000+/month

8

million

#RSAC
Profitability Feasibility Stealth Prevalence
400 350 300 250 200 150 100 50 U0SD 0
Blocked coin miner (endpoint) Average Monero price

Ransomware/locker on IoT
Would you pay $500 to unlock a $10 light bulb?
Needs notification method (display or hub app)
­ Does not work for all devices ­ Rarely has data/services that could be held hostage
Works, for example, on SmartTVs (2015)
­ Only a hand full of real world cases
Could be profitable:
­ 100 paid infections at $100 = $10K/month
9

#RSAC
Profitability Feasibility Stealth Prevalence

#RSAC
10

Blackmail/extortion through IoT
Video/voice recording  «I know what you did»
­ Toy doll/voice assistant with microphone recording ­ Sextortion with video from CCTV ­ Use social media account to ruin reputation
Location tracking
­ Fitness tracker reveals military location ­ Dashcam shows cheating husband
Blackmailing the vendor
­ Pay or you get bad press ­ Pay or people die (medical devices)
11

#RSAC
Profitability Feasibility Stealth Prevalence

Nuisance and pranks on IoT
Playing videos or songs on IoT devices
­ «RickRoll» for a laugh ­ Profitable, if playlist has ads or
affiliate program
IP cameras & baby monitors
­ Voyeurism, trolling, or burglar reconnaissance
­ E.g. false missile alarm
Profits are low, they do it for the laughs
12

#RSAC
Profitability Feasibility Stealth Prevalence

#RSAC
Example of data-leaking light bulb
Un-encrypted requests revealing user details and MD5 hash of password (unsalted)
POST /changeDeviceName "UserID":«a-test-account@*********», "Password":"9a323c5a74e4e3de45968c732157f0de", "Devices":[ {"deviceName":"Bulb LivingRoom", "macAddress":"DC4F22******"} ]
Service allows enumeration of all users and remote takeover of device
13

Information stealing from IoT devices
Emails, passwords, Wi-Fi keys,...  further attacks Credit cards, credentials,...  sell on underground forums
­ Usually entered into app and not the IoT device itself
Private data  Leaked to the cloud or on the device
­ Blackmail or personalized spam
Sell data on dark web in bulk
­ Could be sold to advertisers (even by vendor) ­ Profit by using it for fraudulent warranty cases
Profits are low-medium:
­ Often easier to get the data from the cloud directly
14

#RSAC
Profitability Feasibility Stealth Prevalence
$1

Click fraud/ad fraud through IoT
Use IoT device to click ads or view videos Not much bandwidth or CPU power needed Not always easy to set up and cash out Profits can be high: Bamital: (not IoT) 1.5 million bots  $75K/month HummingBad: 60 million mobiles  $10K/month
15

#RSAC
Profitability Feasibility Stealth Prevalence

Premium services
Premium SMS and calls
­ Devices rarely have a phone line connected to them

#RSAC
Profitability Feasibility Stealth Prevalence

Concealed in-app purchases
­ E.g. Alexa in-skill purchases, needs exploit or social engineering ­ Can be addressed by the platform vendor

Sell «fake» services
­ Buy this app to get faster music streams
Profits can be high:
Difficult to cash out over a long time

Confirm Your In-App Purchase
Do you want to buy the right to uninstall, for $9.99?

Cancel

Buy

16

Targeted attack groups using IoT

Sniffing network traffic
Use compromised IoT devices to sniff network traffic

#RSAC
Profitability Feasibility Stealth Prevalence

VPNFilter group
· Compromised various routers
· Persistent ­ reboot will not disinfect
· Has multiple payload modules:
­ MITM attacks ­ Intercept SCADA Modbus traffic ­ Local network scanner ­ "Brick" a device  sabotage
18

MikroTik campains
· Enable RouterOS feature to redirect traffic to remote IP address
· Could be sold as access to networks
· Hidden infection, that can re-infect PCs in the local network

Stepping stone/pivoting
Use compromised IoT devices to attack other devices

#RSAC
Profitability Feasibility Stealth Prevalence

Slingshot group
· Add malicious IPv4.dll to compromised MikroTik router
· Official administration tool (Winbox Loader) downloads planted DLL and runs it
· Router infects PC with malware

VPNFilter group
· Inject malicious JavaScript into network traffic for other devices
Satori
· Search and substitute Claymore miner wallet address for their own
· Change DNS server  phishing,...

19

Hiding origin with proxies
Use compromised IoT devices to hide traffic origin

#RSAC
Profitability Feasibility Stealth Prevalence

Inception Framework group
· Hiding activity behind compromised routers that act as proxies
· Chaining multiple devices
· Cleaning up afterwards

RouterOS campaigns
· Creating network of Socks proxies · Using built-in features · 240,000+ devices compromised  Can be used for spam, click fraud,
credential stuffing, port scaning,...

20

#RSAC
Summary of the scenarios

Attack method

Profitability

Comment

DDoS attacks

Still growing in size - simple

Spam attacks

Not the easiest way to spam

Cryptocurrency mining

Depends on the coin price

Ransomware/locker

Might work on some devices

Blackmail/extortion

Does not scale well ­ depends

Pranks/nuisance

Not done by cyber criminals

Trend

(Trends based on current ecosystem)

21

#RSAC
Summary of the scenarios

Attack method

Profitability

Comment

Information stealing

Done because it's simple

Click fraud

Often overlooked - profitable

Premium services

Difficult to conduct

Sniffing network traffic

Difficult with SSL/TLS

Pivoting/attacking LAN

Infecting attached computers

Proxy

Not very lucrative, but useful

Trend

(Trends based on current ecosystem)

22

#RSAC
Conclusion
Many ways to profit from compromised IoT devices Not all attacks work for all IoT device classes equally Routers are the most interesting target Interest in IoT from targeted attack groups is growing
DDoS, coin mining, and ad fraud are most likely in the near future
23

#RSAC
The «other» IoT devices
Other groups of devices have different risk profiles
Medical devices
­ Various cases of pace makers or insulin pumps being hacked by researchers
Industrial IoT
­ Attacked for sabotage and extortion (needs plant knowledge)
Smart cities
­ Change smart meter energy bill, manipulate transmissions,...
Physical security devices (e.g. smart doors)
­ Could be hacked by thieves, but does not scale
24

#RSAC
Apply What You Have Learned
Next week you should:
Identify all IoT devices you have in use Reboot each of them
In the near future you should:
Review the configuration of each IoT device Make sure that they are getting updated Monitor for unusual behavior and secure them
25

Thank you for your attention!
Candid Wueest
Threat Researcher Symantec @MyLaocoon

