Malicious proxy Auto-Configs:
Harvesting Credentials From Web Forms Made Easy
Jaromír Hoejsí @JaromirHorejsi Jan Sirmer @sirmer_jan
FIRST 2017, San Juan, Puerto Rico

Today we will be presenting...
1 Proxy Auto-Configs 2 Infection Vectors 3 Installation of the Malware 4 Examples of Fake banking sites 5 Statistics
2

Proxy Auto-Configs

Proxy Auto-Config (PAC)
Defines how web browsers automatically choose the appropriate proxy server to fetch a given URL
+ Several predefined functions: · isPlainHostName(), dnsDomainIs(), localHostOrDomainIs(), isResolvable(), isInNet(), dnsResolve(), myIpAddress(), dnsDomainLevels(), shExpMatch(), weekdayRange(), dateRange(), timeRange()
+ Must contain JavaScript function "FindProxyForURL (url, host)", which returns: · DIRECT - Connections should be made directly, without any proxies · PROXY host:port - specifies which proxy should be used · SOCKS host:port - specifies SOCKS server
Source: http://findproxyforurl.com/netscape-documentation/
4

PAC in Chrome / FF / IE
+ Chrome
· Settings -> Advanced Settings -> Change proxy settings... -> LAN Settings
+ Internet Explorer
· Tools -> Internet Options -> Connections -> LAN Settings
+ Firefox
· Tools -> Options -> Advanced -> Network
5

The history of Retefe
+ In the past
· OLE embedding EXE file (RAR SFX, CPL, ...) · Reported to target Switzerland, Austria, Sweden, Japan
+ References
· A close look at a targeted attack delivery (February 2014)
https://blogs.technet.microsoft.com/mmpc/2014/02/27/a-close-look-at-a-targeted-attack-delivery
· Finding Holes - Operation Emmental (July 2014), whitepaper
http://www.trendmicro.com/cloud-content/us/pdfs/security-intelligence/white-papers/wp-finding-holes-operation-emmental.pdf
· The Circle Around Retefe (May 2015), talk at CARO Workshop
http://2015.caro.org/presentations/the-circle-around-retefe
6

Retefe now
+ Word Document (OLE, DOCX) embedding JavaScript or LNK file + Drops PowerShell scripts to install fake certificate + Simple JavaScript and PAC obfuscation + May install additional tools like Tor, Proxifier, etc... + Persistence may be added
7

Retefe now
+ References
· Retefe is back in town (April 2016)
https://isc.sans.edu/diary/Retefe%2Bis%2Bback%2Bin%2Btown/20957
· Thank You For Your Order Ref 58380529 Talkmobile ­ word doc malware (April 2016)
https://myonlinesecurity.co.uk/thank-you-for-your-order-ref-58380529-talkmobile-word-doc-malware
· Retefe banking Trojan targets UK banking customers (June 2016)
https://blog.avast.com/retefe-banking-trojan-targets-uk-banking-customers
· The evolution of the Retefe banking Trojan (July 2016)
https://blog.avast.com/the-evolution-of-the-retefe-banking-trojan
8

Infection Vector

Infection vector
+ Social engineering
· "To see the invoice, double click on the image"
+ Victim double-clicks on embedded script
· No need for an exploit kit · No macros - no need to enable them
10

Infection vector in 2016
+ oleObject1.bin is OLE Package + OLE Package contains JavaScript with
various filenames
· Rechnung, Bestellung, Zahlung, Quittung, DHL Paket, etc.
· Invoice, order, payment, package, etc.
11

Infection vector in 2017
+ Since 2017, OLE Package contains LNK file
+ LNK file downloads and executes Javascript payload
· Checks IP address · Logs disc`s volume serial number · No Javascript payload served to visitors
outside of targeted countries
12

Infection vector in 2017
+ Back-end checks IP address and volume serial number
13

Installation of the Malware

Malicious JavaScript file
+ Obfuscated + Simple deobfuscation by replacing
· eval() -> document.write()
+ Deobfuscated script contains config with
· Three base64 encoded PowerShell files
· Malicious certificate authority · PS script to "confirm certificate" · PS script to install cert to Firefox
· Config server URL behind TOR
15

Malicious JavaScript file
+ Core function
· Init
· Drops cert.der, ps.ps1, psf.ps1
· Start
· Installing on IE / FF
· IE, Chrome ­ Windows Certificate Store · FF ­ its own certificate store
· CloseAllBrowsers
· Close
16

Malicious JavaScript file
+ Installing on Firefox
· Finds default profile in \\Mozilla\\Firefox\\Profiles · Edits prefs.js
· Delete blockDotOnion · Delete network.proxy
settings
17

Installing the certificate
+ Uses Certutil
+ Uses "PS" PowerShell script to "confirm" security warning and click on Yes to install
18

Installing the certificate
+ Finds a window with Dialog Box system class in csrss or certutil process + SendMessage, BM_CLICK + Security warning quickly disappears
19

Installing the certificate
+ Fake certificate
20

Installing the certificate into Firefox
+ Invokes imports from nss3.dll (Network Security Services)
· CERT_GetDefaultCertDB
· Returns handle for default certificate database
· CERT_ImportCerts
· Imports the certificate
· CERT_ChangeCertTrust
· Sets flag CERTDB_TRUSTED_CA
21

Installing the certificate into Firefox
+ Code probably inspired by thread from exploit.in forum
https://forum.exploit.in/index.php?showtopic=99705&mode=threaded&pid=616876
22

Modification of PAC URL
+ Uses hidden service gateway to access .onion domains + URL matches regexp format
· \w+\.onion(\.to)?\/\w+\.js\?ip=\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}
23

Malicious PAC file
+ IP address matters
· Non-UK IP address
· UK IP address
24

Malicious PAC file
+ Obfuscated with Dean Edwards packer + Proxy server URL
· IP address : port · Onion URL : port
+ Lists of hosts ­ targeting UK banks
25

Tor, Proxifier
+ At the end of June, additional tools and features were added
· Tor · Proxifier
26

Persistence
+ Newer versions are more persistent + Download and use Task Scheduler Wrapper
27

Example of Fake Banking Sites

Fake Banking Sites
+ Request credentials
· Credit Card number · Social number · Mobile phone number · Security code
+ Difficult to recognize
· Fake certificate · Legitimate certificate
+ Use counter to delay user action
29

Intelligent Finance
30

Credit Suisse
31

Two-factor authentication
32

Comparing certificates
33

IP Blacklisting
34

Statistics

GUIDS per Country

11% 3% 4% 2%

54%

26%

CH AT DE GB FR Other
36

Hits per day

16000 14000 12000 10000
8000 6000 4000 2000
0
37

Hits per day (February ­ April 2017)

Feb-17 Mar-17

Recognition of compromised machines
+ Incoming emails contain macros and/or embedded Packager Shell Object + Proxy settings in web browsers + Proxy auto-config files are obfuscated + TOR client installed + TOR communication detected + Access to TOR proxy gates + Task Scheduler actions
38

Summary

Summary
+ Effective social engineering tactics used to trick banking customers + No "Enable content" or "Enable macros" + Added new target country (UK) + No executable file, shifted completely to scripts
· PowerShell, JavaScript
+ Additional tools (Tor, Proxifier) and persistence + Both proxy and config URL behind TOR
40

Thank You
Jaromír Hoejsí @JaromirHorejsi Jan Sirmer @sirmer_jan
www.avast.com

Q & A

