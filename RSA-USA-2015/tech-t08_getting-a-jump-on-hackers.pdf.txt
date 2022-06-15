SESSION ID: Tech-T08
Getting a Jump on Hackers

Wolfgang Kandek
CTO Qualys @wkandek

#RSAC

#RSAC
Hackers
 Attack your Organization by continuously probing your organization for weaknesses.
 Find and catalog vulnerabilities, software flaws and misconfigurations
 Use exploits to gain control over your systems

#RSAC
Hackers ­ Attack Perimeter

#RSAC
Hackers
 We can get a jump on them by using their weak spots.  Weak Spots:
 Millions of Malware samples  Thousands of Vulnerabilities  Tens of Exploitation vectors

#RSAC
Hackers
 Mass Malware  APT and 0-days  Nation State

#RSAC
Hackers ­ Mass Malware
 Majority of all attacks  Mature technologies (on both sides)
 Exploit Kits (Angler, Nuclear, ...)  Analysis and Patching
 "Digital Carelessness"  Research  Breaches

#RSAC
Hackers ­ Mass Malware
 BSI ­ German Bundesamt für Sicherheit in der Informationstechnik
 Digital Situation Report December 2014  Situation is critical  Digitale Sorglosigkeit => "Digital Carelessness"  95% of issues are easily addressed  Attackers use known vulnerabilities  In a limited set of software

#RSAC
Hackers ­ Mass Malware
 BSI ­ German Bundesamt für Sicherheit in der Informationstechnik
 Digital Situation Report December 2014  Situation is critical  Digitale Sorglosigkeit => "Digital Carelessness"  95% of issues are easily addressed  Attackers use known vulnerabilities  In a limited set of software

#RSAC
Hackers ­ Mass Malware - Java
 Java is on our top unpatched threat for the year

#RSAC
Hackers ­ Mass Malware - Java
 Java is on our top unpatched threats for the year
 BTW, attacks are on desktop not serverside Java
 We can't patch Java
 Our business critical timecard application requires it..
 Yes, you can.
 Oracle Java v7 and v8 have a "Java Router" embedded  Multiple Javas on a machine can be selectively deployed

#RSAC
Hackers ­ Mass Malware - Java
 Java is on our top unpatched threats for the year
 BTW, attacks are on desktop not serverside Java
 We can't patch Java
 Our business critical timecard application requires it..
 Yes, you can.
 Oracle Java v7 and v8 have a "Java Router" embedded  Multiple Javas on a machine can be selectively deployed

#RSAC
Hackers ­ Mass Malware - Java
 Java is on our top unpatched threats for the year
 BTW, attacks are on desktop not serverside Java
 We can't patch Java
 Our business critical timecard application requires it..
 Yes, you can.
 Oracle Java v7 and v8 have a "Java Router" embedded  Multiple Javas on a machine can be selectively deployed  Deployment Rulesets - by URL, by checksum, by...

#RSAC
Hackers ­ Mass Malware - Java
Demo

#RSAC
Hackers ­ APT and 0-days
 0-days in 2014/2015
 2x Windows in 2014  4x Internet Explorer in 2014  3x Adobe Flash in 2015
 Use Safe Neighborhood Software
 Alternative OS: Mac OS X  Alternative Browser: Chrome  Alternative Flash: HTML5?
 Sandbox: Chrome/Flash combo not attacked

#RSAC
Hackers ­ APT and 0-days
 Alternative Browser: Chrome  60% Marketshare  220 critical vulnerabilities in 2012-2014  0 known attacks  Aggressive Autoupdate & Fast Patching: 24 hours to 7 days
 Faster than typical exploits
 Sandboxing

#RSAC
Hackers ­ APT and 0-days
 0-days in 2014/2015
 2x Windows in 2014  4x Internet Explorer in 2014  3x Adobe Flash in 2015
 Use Safe Neighborhood Software
 Alternative OS: Mac OS X  Alternative Browser: Chrome  Alternative Flash: HTML5?
 Sandbox: Chrome/Flash combo not attacked

#RSAC
Hackers ­ APT and 0-days
 Sandboxing  Jarno Niemela's (F-Secure) VB 2013 Paper  930 APT malwares against Hardening

#RSAC
Hackers ­ APT and 0-days

 Sandboxing
100%

Exploit Mitigations

90J%arno Niemela's (F-Secure) VB 2013 Paper
80%

709%30 APT malwares against Hardening

60%

50%

40%

30%

20%

10%

0%

System Hardening Application

Sandboxie

EMET

Hardening

#RSAC
Hackers ­ APT and 0-days
 Sandboxing  Jarno Niemela's (F-Secure) VB 2013 Paper  930 APT malwares against Hardening  Sandbox testing not conclusive  Application Hardening and EMET are free

#RSAC
Hackers ­ APT and 0-days
 But APT means attacker can do anything  Bypass your Hardening, the Sandbox, EMET...  How good are they?  Sophos: CVE-2014-1761 (Word RTF) analysis  15+ sample families assessed

#RSAC
Hackers ­ APT and 0-days
 But APT means attacker can do anything  How good are they?  Sophos: CVE-2014-1761 (Word RTF) analysis  15+ sample families assessed

#RSAC
Hackers ­ APT and 0-days
 But APT means attacker can do anything  How good are they?  Sophos: CVE-2014-1761 (Word RTF) analysis  15+ sample families assessed  7 skill categories

#RSAC
Hackers ­ APT and 0-days
 But APT means attacker can do anything  How good are they?  Sophos: CVE-2014-1761 (Word RTF) analysis  15+ sample families assessed  7 skill categories

#RSAC
Hackers ­ APT and 0-days
 But APT means attacker can do anything  How good are they?  Sophos: CVE-2014-1761 (Word RTF) analysis  15+ sample families assessed  7 skill categories  Mixed results 50% trivial, 50% advanced

#RSAC
Hackers ­ APT and 0-days
 But APT means attacker can do anything  How good are they?  Sophos: CVE-2014-1761 (Word RTF) analysis  15+ sample families assessed  7 skill categories  Mixed results 50% trivial, 50% advanced

#RSAC
Hackers ­ APT and 0-days
 But APT means attacker can do anything  How good are they?  Sophos: CVE-2014-1761 (Word RTF) analysis  15+ sample families assessed  7 skill categories  Mixed results 50% trivial, 50% advanced  All (!) attacked only 1 software version ­ Office 2010 (SP2, 32bit)

#RSAC
Hackers ­ APT and 0-days
 Dan Guido ­ Exploit Intelligence Project  Focus on robust configurations to prevent future exploits  Few vulnerabilities are relevant: 14 in 2009, 13 in 2010  20 in 2014  Tighter Security Settings defeat new attacks

#RSAC
Hackers ­ APT and 0-days
 Dan Guido ­ Exploit Intelligence Project  Focus on robust configurations to prevent future exploits  Few vulnerabilities are relevant: 14 in 2009, 13 in 2010  20 in 2014  Tighter Security Settings defeat new attacks
 DEP, ASLR  EMET (all IE 0-days in 2014)  Disable EXE/Javascript in PDF

#RSAC
Hackers ­ APT and 0-days
 Dan Guido ­ Exploit Intelligence Project  Focus on robust configurations to prevent future exploits  Few vulnerabilities are relevant: 14 in 2009, 13 in 2010  20 in 2014  Tighter Security Settings defeat new attacks
 DEP, ASLR  EMET (btw, all IE 0-days in 2014)  Disable EXE/Javascript in PDF  Limit Java to internal Applications

#RSAC
Hackers ­ APT and 0-days
 Harden Applications and deploy EMET  Safer Neighbourhoods - Alternative Technology stacks  Limit Java to internal/known Applications ­ Deployment Rulesets

#RSAC
Hackers ­ Attack Perimeter

#RSAC
Hackers ­ Attack Perimeter

#RSAC
Hackers ­ Attack Perimeter
 Perimeter is everywhere  Mobility, Personal Devices
 SaaS Applications enable  Security Pros
 All Machines Internet hardened  No Client/Peer networking = no malware lateral growth  Security Cons  Traditional Non-Internet Tools challenged  Internet Agent Solutions

#RSAC
Hackers ­ Attack Perimeter

#RSAC
Hackers ­ Attack Perimeter

#RSAC
Hackers - Credentials
 Abuse worldwide connectivity (e-mail, mobile workstations, VPN)  Steal credentials through phishing attacks (e-mail)  Install undetectable malware  Access VPNs

#RSAC
Hackers - Credentials
 Abuse worldwide connectivity (e-mail, mobile workstations, VPN)  Steal credentials through phishing attacks (e-mail)  Install undetectable malware  Access VPNs

#RSAC
Hackers - Credentials
 Teach users to recognize attacks ­   Require better passwords ­   But limited effect > 2% will still click  Password reuse rampant due to complicated rules  Massive username/password databases available

#RSAC
Hackers - Credentials
 Teach users to recognize attacks ­   Require better passwords ­   But limited effect > 2% will still click  Password reuse rampant due to complicated rules  Massive username/passworddatabases available

#RSAC
Hackers - Credentials
 Teach users to recognize attacks ­   Require better passwords ­   But limited effect > 2% will still click  Password reuse rampant due to complicated rules  Massive username/password databases available  Password decoding/guessing in the realm of all attackers.

#RSAC
Hackers - Credentials
 Two factor authentication

#RSAC
Hackers - Credentials
 Two factor authentication

#RSAC
Hackers - Credentials
 Teach users to recognize attacks ­   Require better passwords ­ 
 Teach your users to protect their own personal data
 Banks, E-mail, Linkedin
 2FA is mature now  Implement 2FA for your systems

#RSAC
Act Now ­ x days
 x=30: Scan your Perimeter Server continuously, alert on changes  x=60: Software inventory for Flash,Reader,IE,Office,Java  x=90: Update versions- ­ Mass Malware cure  x=90+: Address Vulnerabilities Quickly  x=90+: Harden Setup - APT and 0-days
 Newest Software, Use EMET, Safe neighborhoods
 x=90+: Authentication - Deploy 2-Factor  Then: Watch Logs for Anomalies, Run Sandboxes

SESSION ID: Tech-T08

Thank you
http://laws.qualys.com @wkandek
Wolfgang Kandek

#RSAC

