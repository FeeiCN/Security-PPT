Patchwork: from one malicious document to complete TTPs of a medium skilled threat actor
Daniel Lunghi ­ Cyber Safety Solutions team Jaromir Horejsi ­ Cyber Safety Solutions team

Outline
 History, previous research  Beginning of the investigation  Infection vectors  Backdoors and remote access tools  File stealers  Phishing kits and credentials harvesting  Overview of the infrastructure  Targets and victims  Countermeasures and defense

History and previous research
 Research published under various names:  Patchwork / Monsoon / Dropping Elephant / APT-C-09
 Selected publications  Unveiling Patchwork, Cymmetria, Jul 2016  Monsoon ­ Analysis of an APT Campaign, Forcepoint, Aug 2016  In-Depth Look at New Variant of MONSOON APT Backdoor, Fortinet, Apr 2017  APT, Qihoo 360, Sep 2017  Untangling the Patchwork Cyberespionage Group, Trend Micro, Dec 2017

Beginning of the investigation
 During our daily threat hunting routine, we discovered several delivery documents with untypical themes
 Lures to enable macros, downloads RAT  Topics related to Bangladesh and Sri Lanka

Infection vectors
 Spear phishing emails  Contain links referring to weaponized document with macros or exploits  Sent via a legitimate mail distributing service YMLP or from own mail servers since September 2017
 Multiple methods to send the weaponized document:  document directly attached to email  direct link to the document in email  website redirecting to the malicious document

Infection vectors
 Email subjects:
 Geopolitics ("Entanglement: Chinese and Russian Perspectives on Non-nuclear Weapons and Nuclear Risks")
 Military ("Have a look at Bangladesh Army News")  Current news ("Wang Qishan exposed. Scandal with Fan
Bingbing")
 Sender address:
 Before September 2017: spoofed or non-existent  From September 2017: domains owned by Patchwork, so
probably valid e-mail addresses

Infection vectors
 Example of links found in spear phishing mails:
 http://www.ciis-cn.net/ciis/North-Korea-Missile.doc  Sometimes leads to opendir
 http://www.cnaas.org/index.php?f=Asia-Policy.doc  Stopped using index.php redirector script after our blogpost got published
 http://<IP address>/Attachments/d3VsZWlAamQuY29t.asp  Only seen PHP/ASP scripts redirectors a few times
 Now: http://<domain>/<document>.docx  Back to the basics, no directories

Infection vectors
 Example of the website redirecting to the malicious document

Examples of delivery documents
 CVE-2012-1856 RTF files, drop various decoy documents related to China

Examples of delivery documents
 CVE-2014-4114
 CVE-2017-0199

Examples of delivery documents
 Social engineering  Lures victims to double click
and execute payload

Examples of delivery documents
 CVE-2017-8570 scriptlet .sct file empty .ppsx file malicious link in slide1.xml.rels

Examples of delivery documents
 CVE-2015-1641 RTF files
 targeting Pakistan victims

Examples of delivery documents
 Often open directories, which lead to even more documents and payloads

Backdoors and remote access tools
 xRAT (now renamed to QuasarRAT)

Backdoors and remote access tools
 NDiskMonitor  Custom .NET backdoor  Commands: cme-update ­ exec command dv ­ list logical drives rr ­ list files and directories ue ­ download & execute  4 random ASCII chars appended to the binary
=> all hashes are different

Backdoors and remote access tools
 Socksbot  Backdoor with SOCKS proxy capabilities  C&C status code serves as a backdoor command  200 ­ start SOCKS proxy thread  202 ­ take screenshot and list running processes  203 ­ activate backdoor  Write & execute EXE file  Write & execute powershell script  Write, execute and terminate

Backdoors and remote access tools
 Badnews backdoor
 Hardcoded and encoded (sub 0x01) URL addresses with configuration  Links to legitimate services like Github, feed43, webrss, wordpress,
weebly...

Backdoors and remote access tools
 Badnews backdoor
 Examples of encoded configuration on Github / Wordpress website

Backdoors and remote access tools
 Badnews backdoor  Decryption  XOR & ROL
 Newer versions (Nov 2017) use additional blowfish encryption
Commands  shell, link, mod, upd, dwd,
kl, snp, ustr, sdwl, utop, hcmd

File stealers
 Taskhost stealer

File stealers
 Wintel stealer

File stealers
 AutoIt stealers
 Older versions of stealers

Android malware
 AndroRAT has very recently seen being used
 Gets generic information about the phone (manufacturer, build, ...)  Steals contacts, accounts, SMS, call logs, files  Gets geolocation information  Records camera and microphone
 Again a public malware, code is available on Github

Phishing kits and credentials harvesting
 Websites used for credential harvesting  URL with encoded parameters
u = user r = referrer d = domain  Popular Chinese email providers  Others exist for Gmail, Yahoo...

Phishing kits and credentials harvesting
 Entered parameters sent unencrypted to the info gathering php script

Overview of the infrastructure
At least:  50 domains registered in 2016  47 domains registered in 2017  24 domains registered in 2018 (until now)
 63 IP addresses used in 2017  38 IP addresses used in 2018 until now (of which 20 were new)

Overview of the infrastructure
 Domain names similar to legitimate domain names
 Similar to target domain name
 aliexpress.com -> aliexprexx.net
 Similar to geopolitics/think tank/strategy/military websites
 ciis.org.cn -> ciis-cn.net  fpri.org -> fprii.net
 Similar to existing webmails
 netease.com -> neteease.com  mail.yahoo.com -> yahoomail.support
 Generic domain names
 stripshowsclub.com  servicelogin.center

Overview of the infrastructure
Different kind of servers:  C&C  File hosting and distribution  SMTP server  Phishing website  Redirection website
Apache on Windows or Linux (Ubuntu, CentOS, Debian...)

Overview of the infrastructure
 Blogpost publication date: December 11th 2017  IOC appendix contains 40 domain names and 10 IP
addresses  December 18th 2017: None of these domains
resolves to an IP address anymore  Within the next 3 months, 4 domains and 1 IP
address have been reused

Targets
 B2C online retailers  Telecommunication media  Multiple high ranking military officers  United Nations Development Program (UNDP)  Diplomacy  Banks, financial institutions  Researchers and scholars in diplomacy/strategy/science
 Sometimes, the entity is targeted multiple times
 One target got 34 spear phishing mails in 2017

Targeted countries
 China  Pakistan  Bangladesh  Sri Lanka  Israel  US  Bahamas

Links with Confucius APT group
 Some architecture (IPs) overlap with Confucius APT group  Code similarities between NDiskMonitor and remote-access-
c3 backdoor  The same backdoor commands (cme-update, etc...)  .NET vs C++
 Multiple samples of a custom Delphi backdoor and filestealer named "BioData" with C&C servers in both infrastructures
 Previous reports of both threat actors mention links with Hangover
 Pakistan is a target for both groups

Countermeasures and defense
 Persistence mechanisms are extremely basic, so easy to spot
 Entry in well-known "Run" registry key  LNK files in the current user startup directory  Addition of a scheduled task
 Keep in mind that multiple time delays are included (i.e sandbox evasion)
 Patchwork's weaponized documents are usually detected by generic signatures, as they use unmodified public exploit codes
 C&C domain list is not very large and can be blocked easily (no DGA)

Conclusion
 Medium skilled threat actor  Likely based in South Asia  Relies solely on spear phishing  Uses multiple freely available online tools and known exploits  Persistently spams its targets unless infection successful  Does not bother much with OPSEC  Has infrastructure and code overlap with other APT groups:
company renting its hacking services?

Any questions?

