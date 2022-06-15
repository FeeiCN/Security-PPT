../../ DotDotPwn !
The Directory Traversal Fuzzer

Alejandro Hern·ndez H. (nitrÿus), CISSP, GPEN
http://twitter.com/nitr0usmx
<nitrousenador@gmail.com>
http://chatsubo-labs.blogspot.com http://www.brainoverflow.org

Christian Navarrete (chr1x) http://twitter.com/chr1x <chr1x@sectester.net> http://chr1x.sectester.net

../../ AGENDA
DotDotPwn Description
Introduction Directory Traversal Vulnerability (Intelligent) Fuzz Testing
General Information Origin / Evolution Design / Architecture Usage options Website / Contact Download Contributions
Vulnerabilities Discovered vulnerabilities
Traversal Engine Description Resources Fuzz patterns generation Intelligent fuzzing
Modules Description of each one
Greetings

../../ DotDotPwn
Description
README.txt It's a very flexible intelligent fuzzer to discover directory traversal vulnerabilities in software such as Web/FTP/TFTP servers, Web platforms such as CMSs, ERPs, Blogs, etc. Also, it has a protocol-independent module to send the desired payload to the host and port specified. On the other hand, it also could be used in a scripting way using the STDOUT module. It's written in perl programming language and can be run either under *NIX or Windows platforms. It's the first Mexican tool included in BackTrack Linux (BT4 R2).

../../ Introduction
Directory Traversal Vulnerability
A directory traversal (or path traversal) consists in exploiting insufficient security validation / sanitization of user-supplied input file names, so that characters representing "traverse to parent directory" are passed through to the file APIs. The goal of this attack is to order an application to access a computer file that is not intended to be accessible. Directory traversal is also known as the ../ (dot dot slash) attack, directory climbing, and backtracking. Some forms of this attack are also canonicalization attacks. A typical example of vulnerable application in php code is:
Source: http://en.wikipedia.org/wiki/Directory_traversal

../../ Introduction
Directory Traversal Vulnerability
An attack against this system could be to send the following HTTP request:
Generating a server response such as:
Source: http://en.wikipedia.org/wiki/Directory_traversal

../../ Introduction
Directory Traversal Vulnerability
Some web applications scan query string for dangerous characters (to prevent Directory Traversal vulnerabilities) such as: .. ..\ ../
However, the query string is usually URI decoded before use. Therefore these applications are vulnerable to percent encoded directory traversal such as:
%2e%2e%2f which translates to ../ %2e%2e/ which translates to ../ ..%2f which translates to ../ %2e%2e%5c which translates to ..\ etc.
Source: http://en.wikipedia.org/wiki/Directory_traversal

../../ Introduction
Directory Traversal Vulnerability According to a study done by Imperva about Web Applications Attacks, the Directory Traversal vulnerability is one of the most common attacks nowadays (July 2011)
Source: Imperva's Web Application Attack Report. Edition #1 - July 2011

../../ Introduction
Fuzz Testing
Fuzz testing or fuzzing is a software testing technique that provides (in)valid, unexpected, or random data to the inputs of a program. If the program fails (for example, by crashing or failing built-in code assertions), the defects can be noted.
Fuzz testing enhances software security and software safety because it often finds odd oversights and defects which human testers would fail to find, and even careful human test designers would fail to create tests for.
Source: http://en.wikipedia.org/wiki/Fuzz_testing

../../ Introduction
Intelligent Fuzz Testing
Source: DeMott, J. (2006). The evolving art of fuzzing.

../../ Introduction
Intelligent Fuzz Testing
Source: DeMott, J. (2006). The evolving art of fuzzing.

../../ Introduction
Intelligent Fuzz Testing
Source: DeMott, J. (2006). The evolving art of fuzzing.

../../ General Information
Origin / Evolution
CHANGELOG.txt DotDotPwn v1.0 Release date: 21/Aug/2010
Checker Script Core component: Traversal database (external .txt files) with 881 payloads Based on Shlomi Narkolayev's Directory Traversal Cheat Sheet
http://narkolayev-shlomi.blogspot.com/2010/04/directory-traversal-fuzz-list.html
DotDotPwn v2.1 Release date: 29/Oct/2010 (BugCon Security Conferences 2010)
From Checker to Fuzzer Rewritten from the scratch Modular architechture (DotDotPwn packages) Core component: Traversal Engine OS detection (nmap) A cool banner was included ;) False positives detection Many parameters included for fuzzing flexibility More modules included
DotDotPwn v3.0beta Release date: 03/Aug/2011 (Black Hat USA 2011 (Arsenal) - Conference CD)
Random User-Agent in HTTP requests Operating System type specifier (if known) Reporting capabilities

../../ General Information
Design / Architecture

INPUTS
manual OS type OS detection
Deepness
Filenames

FUZZ PATTERNS CREATION
Traversal Engine
../../ ..\..\ ..%2f..%2f ..%255c..%255c ..%c0%2f..%c0%2f ..%u2215..%u2215 ..%uF025..%uF025 ..%25c1%259c..%25c1%259c %252e%252e%c0%5c%252e%252e%c0%5c

Dots & Slashes Encodings

OUTPUTS
Modules
HTTP HTTP URL
FTP TFTP PAYLOAD STDOUT

../../ General Information
Usage options
USAGE.txt

../../ General Information
Usage options
EXAMPLES.txt (one example per module)

../../ General Information
Website / Contact
README.txt
Official Website: http://dotdotpwn.blogspot.com
Official Email: dotdotpwn@sectester.net Bugs / Contributions / Improvements: dotdotpwn@sectester.net

../../ General Information
Download
DotDotPwn v3.0beta:
INCLUDED IN BLACK HAT USA 2011 CONFERENCE CD
DotDotPwn v2.1:
PacketStormSecurity: http://packetstormsecurity.org/files/view/95399/dotdotpwn-v2.1.tar.gz
BackTrack Linux 4 R2: # apt-get update # apt-get install dotdotpwn # cd /pentest/fuzzers/dotdotpwn/ # ./dotdotpwn.pl
Mirror: http://www.brainoverflow.org/code/dotdotpwn-v2.1.tar.gz

../../ General Information
Contributions
AUTHORS.txt
Contribution: Idea Implementation of the Bisection Algorithm (http://en.wikipedia.org/wiki/Bisection_method) once a vulnerability has been found in order to determine the exact deepness of the directory traversal. Origin of -X switch.
By: Roberto Salgado aka LightOS http://twitter.com/LightOS http://www.websec.ca
------------------------------------Contribution: Idea and Code Not always include the @Extra_files (e.g. web.config, httpd.conf, etc.). Origin of the -e switch. Specify the Operating System type if known ("windows" or "unix"). Origin of the -o switch.
By: Eduardo Ruiz Duarte aka Beck http://twitter.com/toorandom http://math.co.ro http://b3ck.blogspot.com
------------------------------------Contribution: Code Save a results' report into the Reports folder. Origin of the -r switch. Treatment of SIGINT in order to print the number of traversals found when Ctrl + C is pressed. Random User-Agent in HTTP requests for IDS/IPS detection avoidance.
By: Diego Boy http://twitter.com/Diego_Boy
------------------------------------Contribution: Code Random User-Agent in HTTP requests for IDS/IPS detection avoidance.
By: Cristian Urrutia aka Gashnark http://twitter.com/blion_tec

../../ General Information
To Do
Implementation of the Bisection Algorithm to determine the exact deepness of the directory traversal.
The bisection method in mathematics, is a root-finding method which repeatedly bisects an interval then selects a subinterval in which a root must lie for further processing.
Source: http://en.wikipedia.org/wiki/Bisection_method
../../../../../../../../../../../../../../../../etc/passwd (16)
../../../../../../../../etc/passwd (16/2 = 8)
../../../../../../../../../../../../etc/passwd ((8+16) / 2 = 12)
../../../../../../../../../../etc/passwd ((8+12) / 2 = 10)
../../../../../../../../../../../etc/passwd ((10+12) / 2 = 11)
5 requests instead of 11 !

../../ Vulnerabilities
Discovered vulnerabilities
Tested software
HTTP: 72 Web platforms: 2 (CMS's) FTP: 25 TFTP: 11

../../ Vulnerabilities
Discovered vulnerabilities
Examples of findings ...

../../ Vulnerabilities
Discovered vulnerabilities
Exploits
MultiThreaded HTTP Server [chr1x] ≠ http://www.exploit-db.com/exploits/12304 Wing FTP Server v3.4.3 [chr1x] - http://packetstormsecurity.org/1005-exploits/wingftp-traversal.txt VicFTPS v5.0 [chr1x] ≠ http://www.exploit-db.com/exploits/12498 TFTP Desktop 2.5 [chr1x] - http://www.exploit-db.com/exploits/14857 TFTPDWIN v0.4.2 [chr1x] - http://www.exploit-db.com/exploits/14856 Femitter FTP Server 1.04 [chr1x] - http://www.exploit-db.com/exploits/15445 Home FTP Server <= r1.11.1 (build 149) [chr1x] - http://www.exploit-db.com/exploits/15349 Yaws 1.89 HTTP Server [nitrÿus] - http://www.exploit-db.com/exploits/15371 Mongoose 2.11 HTTP Server (Win32) [nitrÿus] - http://www.exploit-db.com/exploits/15373

../../ Vulnerabilities
Discovered vulnerabilities
3.4.0 - 1st Traversal found ! 3.4.1 3.4.2 3.4.3 3.4.5 ≠ 2nd Traversal found ! ================= 56 days of exposure!!
DotDotPwn's Breaking Patches! 

../../ Traversal Engine
Description

Traversal Engine
../../ ..\..\ ..%2f..%2f ..%255c..%255c ..%c0%2f..%c0%2f ..%u2215..%u2215 ..%uF025..%uF025 ..%25c1%259c..%25c1%259c %252e%252e%c0%5c%252e%252e%c0%5c

../../ Traversal Engine
Resources

../../ Traversal Engine
Resources

../../ Traversal Engine
Fuzz patterns generation

../../ Traversal Engine
Intelligent Fuzzing At the beggining of this presentation ...
Then ...

../../ Traversal Engine
Intelligent Fuzzing

Fuzz patterns according to the Operating System detected (nmap)

../../../boot.ini on *NIX-like

../../../boot.ini on Windows

../../../etc/passwd on Windows

../../../etc/passwd on *NIX-like

../../ Traversal Engine
Intelligent Fuzzing

../../ Traversal Engine
Intelligent Fuzzing
Encoding of slashes (/) for the correct semantics in the fuzzing
patterns
..%2f..%2fetc/passwd
..%2f..%2fetc%2fpasswd
%2e%2e%c0%af%2e%2e%c0%afwindows\system32\drivers\etc\hosts
%2e%2e%c0%af%2e%2e%c0%afwindows%c0%afsystem32%c0%afdrivers %c0%afetc%c0%afhosts

../../ Traversal Engine
Intelligent Fuzzing

../../ Modules
HTTP
#DotDowPwn #snort-2.8.4 - snort-2.9.x, and suricata alert tcp $EXTERNAL_NET any -> $HOME_NET $HTTP_PORTS (msg:"ET SCAN DotDotPwn User-Agent"; flow: established,to_server; content:"User-Agent|3A| DotDotPwn"; nocase; http_header; threshold: type limit, track by_src,count 1, seconds 60; classtype: attempted-recon; reference:url,dotdotpwn.sectester.net; sid:yyyyyy; rev:1;)

../../ Modules
HTTP
Additional verification to avoid false positives

../../ Modules
HTTP URL

../../ Modules
FTP

../../ Modules
FTP
Compliance with RFC 959 - File Transfer Protocol Double testing approach:
CD <directory> & GET <file> GET <directory><file>

../../ Modules
TFTP

../../ Modules
TFTP
A little hack in the TFTP.pm module's constructor to improve the testing speed (-t switch in DotDotPwn)

../../ Modules
PAYLOAD

../../ Modules
STDOUT

../../ Greetings
Cubil Felino Crew (chr1x, r1l0, b0rr3x, l1l1th) BugCon Crew Contributors www.underground.org.mx #mendozaaaa CRAc, hkm, alt3kx, tr3w, beck, cldrn, LightOS, xScPx, Daemon, SirDarckCat, cHiPx0r, Rolman, Crypkey, KBrown, nediam, beavis, kaz, corelanc0d3r, HÈctor LÛpez, dex, Cj, ran, Federico L. Bossi Bonin, preth00nker, sunLevy, Zeus, Raaka (el_gaupo), etc............. And all our followers on Twitter...

../../ Thanks !
chr1x & nitrÿus @ Solar Vision 3

Alejandro Hern·ndez H. (nitrÿus), CISSP, GPEN http://twitter.com/nitr0usmx <nitrousenador@gmail.com> http://chatsubo-labs.blogspot.com http://www.brainoverflow.org

Christian Navarrete (chr1x) http://twitter.com/chr1x <chr1x@sectester.net> http://chr1x.sectester.net

