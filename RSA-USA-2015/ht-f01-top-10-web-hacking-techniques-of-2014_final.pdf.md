SESSION ID: HT-F01
Top 10 Web Hacking Techniques of 2014

Johnathan Kuskos
Manager WhiteHat Security / Threat Research Center @JohnathanKuskos

Matt Johansen
Senior Manager WhiteHat Security / Threat Research Center @mattjay

#RSAC

#RSAC
About the Top 10
"Every year the security community produces a stunning amount of new Web hacking techniques that are published
in various white papers, blog posts, magazine articles, mailing list emails, conference presentations, etc. Within the thousands of pages are the latest ways to attack websites,
web browsers, web proxies, and their mobile platform equivalents. Beyond individual vulnerabilities with CVE numbers or system compromises, here we are solely focused on new and creative methods of web-based attack."
- Jeremiah Grossman
2

#RSAC
Previous Years

2007
65
NEW TECHNIQUES

2008
70
NEW TECHNIQUES

2009
80
NEW TECHNIQUES

2010
69
NEW TECHNIQUES

2011
51
NEW TECHNIQUES

2012
56
NEW TECHNIQUES

2013
31
NEW TECHNIQUES

XSS VULNS
IN COMMON SHOCKWAVE
FILES

GIRAF
(GIF + JAR)

CREATING A ROUGE
CA CERTIFICATE

`PADDING ORACLE'
CRYPTO ATTACK

BEAST

CRIME

mXSS
(MUTATION)

3

#RSAC
2014 Top 10 Web Hacks
1. Heartbleed
2. ShellShock
3. POODLE
4. Rosetta Flash
5. Misfortune Cookie
6. Hacking PayPal Accounts with 1 Click
7. Google Two-Factor Authentication Bypass
8. Apache Struts ClassLoader Manipulation Remote Code Exectuion
9. Facebook Hosted DDoS with notes app
10. Covert Timing Channels based on HTTP Cache Headers
4

10

#RSAC
Covert Timing Channels based on HTTP Cache Headers
"A covert channel is a path that can be used to transfer information in a way not intended by the system's designers (CWE-514)
A covert storage channel transfers information through the setting of bits by one program and the reading of those bits by another (CWE-515)
Covert timing channels convey information by modulating some aspect of system behavior over time, so that the program receiving the information can observe system behavior and infer protected information (CWE-385)"
Denis Kolegov, Oleg Broslavsky, Nikita Oleksov
http://www.slideshare.net/dnkolegov/wh102014 5

9

#RSAC
Facebook Hosted DDoS with notes app
"Facebook Notes allows users to include <img> tags. Whenever a <img> tag is used, Facebook crawls the image from the external server and caches it. Facebook will only cache the image once however using random get parameters the cache can be by-passed and the feature can be abused to cause a huge HTTP GET flood."

Chaman Thapa, aka chr13
http://chr13.com/2014/04/20/using-facebook-notes-to-ddos-any-website/ 6

8

#RSAC
Apache Struts ClassLoader Manipulation RCE
"A remote command execution vulnerability in Apache Struts versions 1.x (<= 1.3.10) and 2.x (< 2.3.16.2). In Struts 1.x the problem is related with the ActionForm bean population mechanism while in case of Struts 2.x the vulnerability is due to the ParametersInterceptor. Both allow access to 'class' parameter that is directly mapped to getClass() method and allows ClassLoader manipulation. As a result, this can allow remote attackers to execute arbitrary Java code via crafted parameters."
Denis Kolegov, Oleg Broslavsky, Nikita Oleksov
http://www.slideshare.net/dnkolegov/wh102014 7

7

#RSAC
Google Two-Factor Authentication Bypass
"The attack actually started with my cell phone provider, which somehow allowed some level of access or social engineering into my Google account, which then allowed the hackers to receive a password reset email from Instagram, giving them control of the account."

Anonymous Hacker
http://gizmodo.com/how-hackers-reportedly-side-stepped-gmails-two-factor-a-1653631338 8

6

#RSAC
Hacking PayPal Accounts with 1 Click
"An attacker can conduct a targeted CSRF attack against a PayPal users and take a full control over his account Hence, An attacker can CSRF all the requests including but not limited to: 1. Add/Remove/Confirm Email address 2. Add fully privileged users to business account 3. Change Security questions 4. Change Billing/Shipping Address 5. Change Payment methods 6. Change user settings(Notifications/Mobile settings) ...and more"
Yasser Ali
http://yasserali.com/hacking-paypal-accounts-with-one-click/ 9

5

#RSAC
Misfortune Cookie
"Researchers from Check Point's Malware and Vulnerability Research Group uncovered this critical vulnerability present on millions of residential gateway (SOHO router) devices from different models and makers. It has been assigned the CVE2014-9222 identifier. This severe vulnerability allows an attacker to remotely take over the device with administrative privileges."

Lior Oppenheim, Shahar Tal
http://mis.fortunecook.ie/ 10

#RSAC
Background: TR-069
11

#RSAC
ACS
 Single Point of Failure  ACS very powerful as
required by TR-069  Port 7547
12

#RSAC
TR-069 Diversity
Connection Request Server Technologies
13

#RSAC
Get to the hack already!
 HTTP Header Fuzzing RomPager  {Authorization: Digest username=`a'*600}  Router Crashes
Unprotected String Copy
14

#RSAC
15

#RSAC

 RomPager uses cookies  Cookie array is pre-allocated memory  10 40 byte cookies  C0, C1, C2 etc...  No more memory variations between firmwares
16

#RSAC
Misfortune Cookie Remediation
 Most people will just need to wait for manufacturer fix  Technical people can flash firmware(DD-WRT, etc.)  Don't buy these:
http://mis.fortunecook.ie/misfortune-cookie-suspectedvulnerable.pdf
17

4

#RSAC
Rosetta Flash
"Rosetta Flash [is] a tool for converting any SWF file to one composed of only alphanumeric characters in order to abuse JSONP endpoints, making a victim perform arbitrary requests to the domain with the vulnerable endpoint and exfiltrate potentially sensitive data, not limited to JSONP responses, to an attacker-controlled site. This is a CSRF bypassing Same Origin Policy."

Michele Spagnuolo
https://miki.it/blog/2014/7/8/abusing-jsonp-with-rosetta-flash/ 18

#RSAC
What is it?
Rosetta Flash is a tool that converts normal binary SWF files and returns a compressed alphanumeric only equivalent
19

JSONP

 Widely used

 callback parameter in URL

 Only accepts

, , and as valid

20

#RSAC
Ordinary SWF Binary Invalid JSONP callback

#RSAC
JSONP

Just a handful of sites used JSONP and were vulnerable:

- Google - Yahoo! - YouTube - LinkedIn - Twitter - Instagram

- Flickr - eBay - Mail.ru - Baidu - Tumblr - Olark

21

#RSAC
SWF Header Formats
22

#RSAC
Faking valid zlib data
 First 2 bytes of zlib stream  Huffman Coding: Bit reduction  DEFLATE: Duplicate string elimination LZ77 algorithm  ALDER32 Checksum
23

#RSAC
SWF to Alphanum
24

#RSAC
- HTML PoC - Attacker Hosted - crossdomain.xml
25

#RSAC
Mitigations
 Don't use JSONP on sensitive domains  HTTP Headers:
 Content-Disposition: attachment; filename=f.txt  X-Content-Type-Options: nosniff
 Latest versions of Flash are patched by Adobe
26

3

#RSAC
POODLE
Encryption downgrade attack to SSLv3.0
Like BEAST and CRIME, a successful exploit targets the client, not the server
Requires determined MitM attacker

Bodo Möller, Thai Duong, Krzysztof Kotowicz
https://www.openssl.org/~bodo/ssl-poodle.pdf
27

Plaintext Key

Magic

#RSAC
Ciphertext

28

#RSAC
Sensitive Data
29

#RSAC

Sensitive Data

MAC

30

#RSAC

Sensitive Data

MAC

Padding DES uses 8 Bytes
AES uses 16 bytes

31

#RSAC

Sensitive Data

MAC

Padding
DES uses 8 Bytes
AES uses 16
bytes S

CB C
32

#RSAC

Sensitive Data

MAC

Padding DES uses 8 Bytes AES uses 16 bytes

CB

CB

CB

CB

CB

CB

CB

C

C

C

C

C

C

C

CBC Encryption is occurring

33

#RSAC

Sensitive Data

MAC

Padding DES uses 8 Bytes AES uses 16 bytes
S

CB

CB

CB

CB

CB

CB

CB

C

C

C

C

C

C

C

CBC Encryption is occurring

34

#RSAC

Sensitive Data

MAC

Padding DES uses 8 Bytes AES uses 16 bytes
S

CB

CB

CB

CB

CB

CB

CB

C

C

C

C

C

C

C

CBC 35

#RSAC

Sensitive Data

MAC

Padding
DES uses 8 Bytes
AES uses 16
bytes S

CB C
36

#RSAC
Requirements
 A motivated and active MITM attacker.  A webserver set up to force the JS requests to break multiple
encryption blocks.
Solution
 Disable SSLv3.0 in the client.  Disable SSLv3.0 in the server.  Disable support for CBC-based cipher suites when using SSLv3.0 in
either client or server.
37

#RSAC
ShellShock

2

Also known as bashdoor CVE-2014-6271

Disclosed on September 24, 2014.

Simply put  () { :; }; echo `win'

Stéphane Chazelas
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-6271 38

#RSAC
Example with MassScan by @ErrataRob
target-ip = 0.0.0.0/0 port = 80 banners = true http-user-agent = () { :; }; ping -c 3 xxx.xxx.xxx.xxx http-header[Cookie] = () { :; }; ping -c 3 xxx.xxx.xxx.xxx http-header[Host] = () { :; }; ping -c 3 xxx.xxx.xxx.xxx http-header[Referer] = () { :; }; ping -c 3 xxx.xxx.xxx.xxx
39

#RSAC
40

#RSAC
Before we had fancy GUI's...
41

#RSAC
ShellShock explained simply
VAR=`This is something I'd really like to remember.' VAR=`This should also be treated as text, not syntax. ' VAR=`rm -rf /'
VAR=`() { :;}; rm -rf /' echo $VAR
42

1

#RSAC
Heartbleed
It allows an attacker to anonymously download a random chunk of memory from a server using OpenSSL.
A Catastrophic vulnerability to be accompanied by "branding".
~17%(500k) of all "secure" servers were vulnerable.

Neel Mehta
http://heartbleed.com/ 43

#RSAC
Market share of the busiest sites
44

#RSAC
Market share of the active sites
45

#RSAC
What is a heartbeat anyways and why?
 http://git.openssl.org/gitweb/?p=openssl.git;a=commit;h=4817504d069b4c5082161b02a22116ad75f 822b1
 Found in:  /ssl/d1_both.c  /ssl/t1_lib.c  Both containing the following:  buffer = OPENSSL_malloc(1 + 2 + payload + padding);
 Fixed in this commit: https://github.com/openssl/openssl/commit/96db9023b881d7cd9f379b0c154650d6c108e9a3#diff-2  The payload is now bound checked and can't exceed the intended 16 byte payload size.  "Ultimately, this boiled down to a very simple bug in a very small piece of code that required a very small fix" ~ @TroyHunt
46

Client

TLS Request 1 TLS Response 1 TLS Request 2 TLS Response 2

#RSAC
Server

TLS Request n
TLS Response n
N 47

Client

TLS Request 1 TLS Response 1 Heartbeat Request
Keep Alive Heartbeat Request
TLS Response 2

#RSAC
Server

48

Client

TLS Request 1 TLS Response 1 Heartbeat Request
Payload, Size
Keep Alive
Payload, Some Padding
49

#RSAC
Server

Hacker

TLS Request 1 TLS Response 1 Heartbeat Request
Payload, 1 Byte Size, 65,536 Bytes

#RSAC
Server

50

Hacker

TLS Request 1 TLS Response 1 Heartbeat Request Payload, 1 Byte Size, 65,536 Bytes
51

Server

#RSAC

Server Memory
RANDOMDATARANDOMDA TARANDOMDATARANDOM DATAPayloadDATARANDO MDATARANDOMDATARAN DOMDATARANDOMDATAR ANDOMDATARANDOMDAT ARANDOMDATARANDOMD ATARANDOMDATARANDO MDATARANDOMDATARAN

Hacker

TLS Request 1 TLS Response 1 Heartbeat Request
Payload, 1 Byte Size, 65,536 Bytes
Keep Alive
PayloadDATARAND OMDATARANDOMD ATAANDOMDATARA
NDOM
52

Server

#RSAC

Server Memory
RANDOMDATARANDOMDA TARANDOMDATARANDOM DATAPayloadDATARANDO MDATARANDOMDATARAN DOMDATARANDOMDATAR ANDOMDATARANDOMDAT ARANDOMDATARANDOMD ATARANDOMDATARANDO MDATARANDOMDATARAN

#RSAC
What we've learned
 Encryption is King: Many years of web hacks and Transport Layer bugs are always feared and respected.
 Creativity is Rare: Utilizing things under our noses in new and novel ways is always impressive.
 Web Security Prevails: Of all the hacks of 2014, web hacks make the headlines. Web is where the data is, and data is what we all hold dear.
53

SESSION ID: HT-F01

Top 10 Web Hacking Techniques of 2014

Special thanks to the community who voted and to our panel of experts:
Jeff Williams, Zane Lackey, Daniel Miessler, Troy Hunt, Giorgio Maone, Peleus Uhley, and Rohit Sethi

Johnathan Kuskos
Manager WhiteHat Security / Threat Research Center @JohnathanKuskos

Matt Johansen
Senior Manager WhiteHat Security / Threat Research Center @mattjay

#RSAC

