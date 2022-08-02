SESSION ID: SPO3-T08
Tracking Ghosts Through the Fog

Chris Larsen
Architect, WebPulse Threat Research Lab Blue Coat Systems @bc_malware_guy

Waylon Grange
Sr. Threat Researcher Blue Coat Systems @professor__plum

#RSAC

#RSAC
Outline
 Flying through the fog
 One-hit Wonders and One-day Wonders  Cloud  TLDs and IDNs  Mobile  Encrypted Traffic  Embedded Systems
2

Interesting

Discovery

#RSAC

Number One:

"One-hit Wonders"
3

#RSAC
One-hit Wonders
 Start with the "most interesting" part of the Web...
 ...in a 24 hour period: over 6.2 million active fringe hosts*

Normal 34%

Host Traffic (by hit count)

One-hit Wonders 66%

One-hit Wonders: A Closer Look
 Next step: look at the age of the hosts...

Just a few normal-traffic hosts are new... (2% overall)

Normal (older) 32%
One-hit Wonders (older) 50%

#RSAC
...but 1/4 of one-hit wonders are new! (16% overall)

Interesting

Discovery

#RSAC

Number Two:

"One-day Wonders"

#RSAC
What Does Normal Look Like?
 Researching "normal" traffic levels for sites...
 How much daily traffic?
 Google, Facebook, Twitter, Youtube, Baidu, etc. have a lot!  (every day!)
 But how much daily traffic for other sites?
 (it's like our version of Alexa...)
 We looked at 90 days of all our traffic
 (whether already in our main database or not)
 Over 660 million unique hosts* showed up at least once...

#RSAC
One-day Wonders

We must hide!

#RSAC

Quick, to the cloud!

#RSAC
Top Malware Hosting Countries
10

#RSAC
Top Malware Hosting Providers
11

#RSAC
Good Cloud / Bad Cloud

 Allow or Deny

 GET https://docs.google.com/uc?authuser=0&id=0B4fsHdBQBTPWbGlGTmNzaktCaG8&export=download

 GET https://dl.dropboxusercontent.com/content_link/qkwIfHU4GSr9poOUdzPy2zUYDmbxKcOn86jUVOPYNntbUkdU 1d42dZcWdLjeOFgO?dl=1

 POST http://webdav.cloudme.com/franko7046/CloudDrive/KNKbLTFr04t1mrfDV/PAG/Q0Ohjw0sdqI5S/U.txt

 GET http://1qporka.s3.amazonaws.com/

 GET https://evernote.com/intl/zh-cn

 GET http://www.sendspace.com/defaults/wpickurl.html

 Src IP Addr:Port Dst IP Addr:Port

Packets Bytes

10.0.1.23:5675 -> 173.194.66.19:465 (gmail.com) 26 32456

12

More Places to Hide:
#RSAC
A quick look at the TLD & IDN explosions

The TLD Explosion
1998, 2001, 2005, 2011: .aero, .asia, .biz, .cat, .coop, .info, .int, .jobs, .mobi, .museum, .name, .post, .pro, .tel, .temasek, .travel, .xxx
1985: .com, .edu, .gov, .mil, .net, .org (and country codes: .jp, .cn, .de, .ru,, .hr, ...)

#RSAC
2013-2014: .abogado, .academy, .accountants, .actor, active, .ads, .adult, .agency,.airforce, .allfinanz, .alsace, .amsterdam, .android, .aquarelle, .archi, .army, .associates, .attorney, .auction, .audio, .autos, .axa, .band, .bank, .bar, .barclaycard, .barclays, .bargains, .bayern, .beer, .berlin, .best, .bharti, .bid, .bike, .bio, .black, .blackfriday, .bloomberg, .blue, .bmw, .bnpparibas, .boats, .bond, .boo, .boutique, .brussels, .budapest, .build, .builders, .business, .buzz, .bzh, .cab, .cal, .camera, .camp, .cancerresearch, .capetown, .capital, .caravan, .cards, .care, .career, .careers, .cartier, .casa, .cash, .catering, .cbn, .center, .ceo, .cern, .channel, .cheap, .chloe, .christmas, .chrome, .church, .citic, .city,.claims, .cleaning, .click, .clinic, .clothing, .club, .coach, .codes, .coffee, .college, .cologne, .community, .company, .computer, .condos, .construction, .consulting, .contractors, .cooking, .cool, .country, .credit, .creditcard, .cricket, .crs, .cruises, .cuisinella, .cymru, ...

#RSAC

IDNs Added to Our Database Each Year
45000

40000

35000

30000

25000

20000

15000

10000

5000

0 2003

2004

2005

2006

2007

2008

2009

2010

2011

2012

2013

wkd.org / wikipedia.org : xn--wkd-8cdx9d7hbd.org

google.com, -., pn.com, ...

I'll go where you go:

#RSAC

Hiding in mobile

Malicious Mobile Apps
250000 200000 150000 100000
50000 0
17

#RSAC
 Display Ads  Send SMS  Steal PII  Remote Control  Downloader  Extortion  Destructive

#RSAC
Mobile Malware
 Most malware is installed by the users
 Permissions requested by app ignored
 We've trained users to click through EULAs, why should we expect anything different for permissions?
 F-Secure EULA experiment
 Once installed malware goes mostly unmonitored

Maybe the best place to

#RSAC

hide: where everything is

hidden...

#RSAC
Growth in SSL/HTTPS
 In our "Top 50" sites:  69% use HTTPS by default
 Only sites with news and entertainment typically default to HTTP  (for example, ESPN, BBC, CNN, Pandora...)
 Some customers tell us their network mix is 40-50% SSL  If malware comes *in* via HTTPS, none of your defenses see it...  Likewise, you don't see malicious *outbound* traffic in SSL/HTTPS

#RSAC
Malware Hiding in HTTPS
In the old days, I didn't worry about malware coming in via HTTPS... ...but in 2014 we saw a lot of attacks using file sharing sites
Dropbox.com, Box.com, Cubby.com, Copy.com, etc. (and Amazon, Google, and MS clouds) All using HTTPS
...also, rising use of "2nd Stage" malware
Pay-per-install black hat services have been around for a while... ...but really took off with CryptoLocker... ...and Dyre has been very successful using Upatre as its first stage

#RSAC
Botnets and SSL
 sslbl.abuse.ch (the "Zeus Tracker" site)  588 blacklisted SSL certificates (May `14 ­ Mar `15):
 Most (recently) are "Dyre C&C"  Many are "KINS C&C", "Vawtrak MITM", "Shylock C&C"  Several are generic "Malware C&C", "Ransomware C&C"  A few "URLzone C&C", "TorrentLocker C&C", "CryptoWall C&C",
"Upatre C&C", "Spambot C&C", "Retefe C&C", "ZeuS MITM"...
 ...that's over a dozen recent malware families using SSL

#RSAC
Ransomware Loves Encryption
 Recent CTB-Locker attack used https * URLs for payload  Payload: fake .tar.gz file (actually encrypted * blob)  Payload is decrypted, and then it encrypts * your files
 (using "Elliptic Curve" crypto)
 C&C handled via TOR *  Payment via Bitcoin (a crypto-currency *)  ... Curve+Tor+Bitcoin = "CTB Locker"

#RSAC
You've Heard of TOR ­ What About I2P?
 I2P = "Invisible Internet Project"  Dyre started using it in February
 (but "rudimentary and buggy" ­ Andrew Brandt, Blue Coat blog)
 By March, working well  (i.e., the Bad guys are aggressively
pursuing new "fog machines"...)

Hiding where nobody looks:

#RSAC

Embedded systems

What Year is This?

CVE-????-0329 CVE-????-2321 CVE-????-2718 CVE-????-4018 CVE-????-4154 CVE-????-4155 CVE-????-7270 CVE-????-9019 CVE-????-9020 CVE-????-9021 CVE-????-9027 CVE-????-9183 CVE-????-9184 CVE-????-9222 CVE-????-9223 CVE-????-9583 CVE-????-1437

Hardcoded telnet password Unauth web request can enable telnet MitM, unverified integrity of firmware download Default password of admin Password can be obtained via unauth web request CRSF attack to change admin password CSRF attack to hijack authentication Multiple CRSF attacks XSS into domain parameter Multiple XSS (Too many cooks) Multiple CSRF Default password of admin Auth bypass Remote escalation via Cookie (Misfortune cookie) Buffer overflow, possible remote execution Auth bypass via crafted packet to port 9999 XSS via flag parameter

26

#RSAC

#RSAC
SOHOpelessly Broken
27

Lizard Squad

#RSAC
 Hacker group known for their DDoS capabilities
 Notable DDoS attacks
 League of Legends  Destiny  PlayStation  Xbox Live  North Korea
28

LizardStresser

#RSAC
 DDoS services sold as LizardStresser
 Supported by botnet of IoT devices
 Can run on ARM, MIPS, MIPS-el, SH, PPC, i386, and amd64 systems
 Very low detection rate in VT for most versions
29

Listener Bot

#RSAC
udp 108.61.xxx.xxx port=25565,min=500,max=750,time=1800 udp 108.61.xxx.xxx port=25565,min=500,max=750,time=1800 udp 162.219.xxx.xxx port=80,time=60 http 188.165.xxx.xxx host=______.com,time=600 http 188.165.xxx.xxx host=______.com,time=600 udp 108.61.xxx.xxx port=25565,min=500,max=750,time=1800 udp 184.106.xxx.xxx port=80,min=500,max=750,time=15 mineloris 198.xxx.xxx.147 host=play.the______.com,time=30 udp 198.50.xxx.xxx port=25565,min=750,max=1000,time=30 mineloris 198.50.xxx.xxx host=play.the_______.com,time=30 udp 104.149.xxx.xxx port=25565,min=750,max=1000,time=30 udp 104.149.xxx.xxx port=25565,min=750,max=1000,time=30 mineloris 104.149.xxx.xxx host=play.____pvp.net,time=30 syn 104.149.xxx.xxx time=30,port=25565
30

#RSAC
Who's Targeting Embedded Devices?
 Script kiddie groups
 DDoS botnets
 Malvertising groups
 DNS hijacking  MiTM attacks
 Organized crime
 Steal banking credentials via MiTM
 Nation states
 Anonymous proxy networks
31

#RSAC
Clearing the Fog

#RSAC
Weird SSL Ports
 Dyre's SSL communications use many ports:

#RSAC
SSL Certificate Laziness
 CTB-Locker attack used HTTPS, but poorly...
 Your browser would show error messages if browsed directly
 (the MW doesn't care, of course!)  scolapedia.org uses an invalid security certificate:
 The certificate is only valid for ssl10.ovh.net (Error code: ssl_error_bad_cert_domain)
 ohayons.com uses an invalid security certificate:
 The certificate expired on 07/24/2011. (Error code: sec_error_expired_certificate)
 voigt-its.de uses an invalid security certificate:
 The certificate is not trusted because it is self-signed. (Error code: sec_error_untrusted_issuer)

#RSAC
SSL Abuse Indicators
 Keep an eye out for:
 SSL traffic that isn't on port 443  Non-SSL traffic that is using port 443  SSL trying to use invalid certificates (non-matching domain)  SSL trying to use expired certificates  SSL trying to use self-signed certificates
 (and set some policy at your gateway...)

#RSAC
Embedded Systems
 Do you even look bro?
 Put your devices behind a packet sniffer once in a while  Are you running the latest firmware, or do you even know?
 Pressure manufacturers to think "secure lifecycle"
 "After careful analysis, Seagate has confirmed that the vulnerability on our Business Storage NAS products is low risk... Seagate will be issuing a software patch for download expected May, 2015." -- Seagate
36

#RSAC
Questions

