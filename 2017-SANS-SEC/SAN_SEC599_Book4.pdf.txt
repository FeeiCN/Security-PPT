SECS99 I DEFEATING ADVANCED ADVERSARIES
599.4
Avoiding Installation,
Foiling Command & Control, &Thwarting
Lateral Movement
THE MOST TRUSTED SOURCE FOR INFORMATION SECURITY TRAINING, CERTIFICATION, AND RESEARCH I sans.org

Copyright© 2017, Erik Van Buggenhout & Stephen Sims. All rights reserved to Erik Van Buggenhout & Stephen Sims and/or SANS Institute.
PLEASE READ THE TERMS AND CONDITIONS OF THIS COURSEWARE LICENSE AGREEMENT ("CLA") CAREFULLY BEFORE USING ANY OF THE COURSEWARE ASSOCIATED WITH THE SANS COURSE. THIS IS A LEGAL AND ENFORCEABLE CONTRACT BETWEEN YOU (THE "USER") AND THE SANS INSTITUTE FOR THE COURSEWARE. YOU AGREE THAT THIS AGREEMENT IS ENFORCEABLE LIKE ANY WRITTEN NEGOTIATED AGREEMENT SIGNED BY YOU.
With the CLA, the SANS Institute hereby grants User a personal, non-exclusive license to use the Courseware subject to the terms of this agreement. Courseware includes all printed materials, including course books and lab workbooks , as well as any digital or other media , virtual machines , and/or data sets distributed by the SANS Institute to the User for use in the SANS class associated with the Courseware. User agrees that the CLA is the complete and exclusive statement of agreement between The SANS Institute and you and that this CLA supersedes any oral or written proposal , agreement or other communication relating to the subject matter of this CLA
BY ACCEPTING THIS COURSEWARE, YOU AGREE TO BE BOUND BY THE TERMS OF THIS CLA. BY ACCEPTING THIS SOFTWARE, YOU AGREE THAT ANY BREACH OF THE TERMS OF THIS CLA MAY CAUSE IRREPARABLE HARM AND SIGNIFICANT INJURY TO THE SANS INSTITUTE , AND THAT THE SANS INSTITUTE MAY ENFORCE THESE PROVISIONS BY INJUNCTION (WITHOUT THE NECESSITY OF POSTING BOND), SPECIFIC PERFORMANCE , OR OTHER EQUITABLE RELIEF.
If you do not agree, you may return the Courseware to the SANS Institute for a full refund , if applicable.
User may not copy, reproduce, re-publish, distribute, display, modify or create derivative works based upon all or any portion of the Courseware, in any medium whether printed, electronic or otherwise, for any purpose without the express prior written consent of the SANS Institute. Additionally, User may not sell , rent, lease, trade, or otherwise transfer the Courseware in any way, shape, or form without the express written consent of the SANS Institute.
If any provision of this CLA is declared unenforceable in any jurisdiction, then such provision shall be deemed to be severable from this CLA and shall not affect the remainder thereof. An amendment or addendum to this CLA may accompany this courseware.
SANS acknowledges that any and all software and/or tools, graphics, images, tables, charts or graphs presented in this courseware are the sole property of their respective trademark/registered/copyright owners, including:
AirDrop, AirPort, AirPort Time Capsule, Apple, Apple Remote Desktop, Apple TV, App Nap, Back to My Mac, Boot Camp, Cocoa, FaceTime, FileVault, Finder, FireWire, FireWire logo, iCal, iChat, ilife, iMac, iMessage, iPad , iPad Air, iPad Mini, iPhone, iPhoto, iPod , iPod classic, iPod shuffle, iPod nano, iPod touch, iTunes, iTunes logo, iWork, Keychain, Keynote, Mac, Mac Logo, MacBook, MacBook Air, MacBook Pro, Macintosh, Mac OS, Mac Pro, Numbers, OS X, Pages, Passbook, Retina, Safari, Siri, Spaces, Spotlight, There's an app for that, Time Capsule, Time Machine, Touch ID, Xcode, Xserve, App Store, and iCloud are registered trademarks of Apple Inc.
Governing Law: This Agreement shall be governed by the laws of the State of Maryland, USA.
SEC599_4_ C01_03

SEC599.4

-

- -- --

-

Defeating Adv~nced Adversaries

Avoiding Installation, Foiling
SANS Coininand & Control, &
Thwarting Lateral Move1Tient

© 2017 ErikVan Buggenhout & Stephen Sims I All Rights Reserved I Version C0I _ 03

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
Day 1: Knowing the adver ary, knowing yourself Day 2: Averting Payload Delivery Day 3: Preventing Exploitation Day 4: Avoiding Installation, foiling Command & Control & thwarting lateral movement Day 5: Exfiltration, Cyber Deception & Incident Response Day 6: APT Defender Capstone
SANS
Thi page intentionally left blank.

SEC599.4
Avoiding lnstallation Typical Persistence Strategies Exercise: Cau:hing Persistence Principle of Least Privilege & User Access Control Exercise: LoC'31Windows Privilege Escalation Techniq\les
Foiling Command & Control Network Monitoring Considerations (Netflow, IDS, ...) Detecting Command & Control Channels Exercise: Suricaci to Detect Network Anomalies
Thwarting lateral movement Introducing Common Lateral Movement Strategies Active Directory Architecture & Attacks Active Directory Hardening & Segmentation Exercise: Hardening Windows to Stop Lateral Movement Detecting Lateral Movement Using Windows Event Logs Exercise: Configuring & Forwarding Windows Event Logs

·

· ,· ,

2

© 2017 Erik Van Buggenhout & Stephen Sims

TABLE OF CONTENTS
Avoiding Installation Typical Persistence Strategies EXERCISE: Catching Per-sistence Principle of Least Privilege & User Access Control (UAC) EXERCISE; Local Windows Privilege Escalation Techniques
Foiling Command & Control Netw0rk Monitoring Considerations Detecting Command & Control channels EXERCISE: Suric.ata to Detect Network Anomalies
Thwarting lateral Movement Introducing Common lateral Movement Strat.egies Active Directory Architecture & Attacks
. SAN~
T his page intenti onall y left: blank.

-07 08 29 31 54 56 56 67 80 83 83 89
.·

© 2017 Erik Van Buggenhout & Stephen Sims

3

TABLE OF CONTENTS
Active Directory Hardening & Segmentation
EXERCISE: Hardening Windows to Stop Lateral Movement
Detecting Lateral Movement Using Windows Event Logs
EXERCISE: Configuring & Forwarding Windows Event Logs

Ill 134 149 152 183

ws
This page intentionally left blank.

. '.

4

© 2017 Erik Van Buggenhout & Stephen Sims

Where Are We in the APT Attacl< Cycle? - Installation
In section 3 of this course, we cliscussed how exploitation can take place in the Attack Cycle. We will now start analyzing the installation phase of the APT attack cycle:

Installation

·. -SANS .

-

--

-

·

-

Where Are We in the APT Attack Cycle? Welcome to Day 4 of SEC599 1 Yesterday, we saw how an adversary can perform initial exploitation of a target environment. Today. we will zoom in on t\ o further steps of the attack: Installation & Command & Control. We will also addre s common lateral movement strategie , which are typically pru1 of the "A tion 011 Objectives" phase . But let' not get aJ1ead of ourselves and tart zooming in on Installation:
Adversary perspective During the installation tep of the attack cycle, adversarie try to achieve persistence on the target machines (if it is part of the goal). When persistence is required, changes must be made to the configuration or software of the machine to achieve persistence. his is neces ary because typical computer operating system like Windows only run started programs as long as the user is logged on. If the user logs off(or the machin is restarted), running programs are terminated. To restart the malicious programs automatically when a user logs on again, persistence mechanisms mu t be used.
Windows has a large and diverse set of "autorun" option that can be used for persistence. This can be done in the context of a user so that persistence is achieved only when the same user logs in again , or in the context of a machine, so that persistence is achieved when the machine is started. Persistence can be as simple as a tart entry in the user' Windows menu configured lo run the malicious payload again, or as complex as a dedicated backdoor running as a service or even installed in the firmware of the computer. Webshells are typical backdoors left b hind on compromised web server .
Defender perspective To achieve persistence on a target system, adversaries must make change to the configuration of said systems. ot only can many of these changes be prevented by hardening, butthey can also be detected by monitoring applications like Microsoft s ysmon. In homogenous environments, configuration base lining can help detect this type ofchanges. Some host-based Jntrusion Prevention Systems monitor auLorun configurations too and alert on any changes made to them .

© 2017 Erik Van Buggenhout & Stephen Sims

5

The Windows operating system provides an abundant set of configuration options that can be used to achieve persistence. It should be noted that achieving persistence does not necessarily require the malware to be stored in files on the file system. So, called, "fileless" malware can achieve persi tence by storing commands inside autorun entries in the registry. When executed at startup or login , the e command will inject malicious code in ide an existing process. The malicious code is often stored in an alphanumeric representation in the registry, like BASE64.

6

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
Day 1: Knowing the adversary, knowing yourself Day 2: Averting Payload Delivery Day 3: Preventing Exploitation Day 4: Avoiding Installation, foiling Command & Control & thwarting lateral movement Day 5: Exfiltration, Cyber Deception & Incident Response Day 6: APT Defender Capstone

SEC599.4
Avoiding Installation Typical Persistence Strategies Exercise: Catching Persistence Principle of Least Privilege & User Access Control Exercise: Local Windows Privilege Escalation Techniques
Foiling Command & Control Network Monitoring Consrderadons (Nedlow. IDS, .. .) Detecting Command & Control Channels Exercise: Suricata to Detect Network Anomalies
Thwarting lateral movement Introducing Common Lateral Movement Strategies Active Directory Architecture & Attacks Active Directory Hardening & Segmentation Exercise: Hardening Windows to Stop Lateral Movement Detecting Lateral Movemeot Using Windows Event Logs Exercise: Configuring & Forwarding Windows Event Logs

·-. SANS

.

:

. .

This page intentiona lly left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

7

Persistence?

Upon successful exploitation, adversaries typically want to persist their access on the target environment (e.g. to survive reboots, user logoff, ...) There's two main categories of persistence strategies:

Image Source: Wilcipedia

User space
· "Hiding in plain sight" · Do not always require administrative access to system · Examples: Web shells, scheduled r.asks, user profile, ,. .
Kernel
· Has additional capabilities to hide itself from investigations · Require administrative access to system
Examples: Device drivers, Loadable kernel modules, ...

Both Userspace &Kernel persistence
strategies are used byAPTs!

SA~S

-.

·

!

Persi tence? Upon successfu l exploitation, adversaries typically want to persist their access on the target environment (e.g. w urvive reboot , user logo ff, ...). Depending on the privileges available to the adv rsary, they could choose to hide in two main parts of the victim system:
· User space: User space is the memory area where appl ication software (and a limited number of drivers) execute. All '"u er'' interactions typically occur in user space.
· Kernel: Kernel space is strictly reserved for nmning a privileged operating system kernel, kernel extensions, and most device drivers. Code used for persi tence in kernel-mode is typically referred to as ·rootkits", a they interact with low-le el parts of the O and can thu hide themselves better from investigations.
Advanced ad ersarie ha e been known to use both locations for persistence. You might think they would always prefer kemel-m de persistence. This is however not true: In some cases, the very presence of a "rootkit" could signal ornething is suspicious ... They might thus prefer to compromise the user environment and thus limit themselves to "hiding in plain sight". Adding a scheduled task setting a " Run" regi try key, adapting the user profile, ...

8

© 2017 Erik Van Buggenhout & Stephen Sims

What Persistence Strategy Is Used? (I)
I
Next to the "user space" vs "kernel" question, there are other items that will determine the type of persistence strategy used:
· What is the function of the target system? Is it available from the Internet? Does the adversary have adm.inistrative privileges to the system?

! Successful persistence does not always require administrative privileges!

: .-~"N. i: - .- -
-M\. r'l

.- .

.

·

_

What Persistence trategy Is lJsed? (1) We already discussed the "user space'' vs 'kernel" question in the previous slide. There are however a number of other question that wi II determine what type of persistence strntegy is opted for by th adversary:
· What is the function of the target en iromnent? If ifs a workstation, we can assume that reboots & user logons wilt occur fi-equ ntl and thus a persistence strntegy related to tbe user profile could be a viabl option .
· Is i available from the Internet? If it i , the adversary could opt to place a backd or in an exi sting service (e.g. web shell) and u e that to direc1ly reconnect to the ysrem.
· Does the adversary have administrative p1ivileges to the system? If administrative privileges are a ailable, the adversary could opt to attempt in tailing a rootk it that operates in kernel-mode.
Even if administrntive pri i!eges arc helpful to the adversary persistence can be achie ed without lia mg them as well!

© 2017 Erik Van Buggenhout & Stephen Sims

9

What Persistence Strategy Is Used? (2)

Example 1.: Infected web server
a

Example 2: Infected workstation
a
vs

-

.

Sr\~S

'

'

> '

I

What Per istence Strategy Is Used? (2) The diagram in the slide provides an insight in two different types of persistence:
· On the left, we can see an infected web erver, where the adversary could now deploy a backdoor as part of the web application. This backdoor can be used at will by the adversary as a pivot point to further compromise other part of the internal network.
· On the right, we have a situation where the adversary has compromised a workstation already inside lh environment. As the adversary would like to retain control over the infected workstation , he will opt for a persistence strategy that will automaticall. launch a backdoor that will attempt to connect toward the ad ersary again .

10

© 2017 Erik Van Buggenhout & Stephen Sims

Persistence Strategies

Some typical persistence strategies include:

a
· ·

Web shells (web servers accessible from the Internet)
Registry manipulation (run keys, logon scripts, ...)
DLL search order hijacking

m· Task schedulers (Task Scheduler, At, Cron, .. .)
Auto-start services (requires elevated privileges)

C

User startup foldecs

·SANS

Bootkits infecting the Master Boot Record

*Please note that this overview covers the most popular methods, but it's certainly not exhaustive... Check out Mitre's AIT&CK framework/or additional techniques!
. .

.

'

Persistence Strategies A number of common persistenc strategies are listed belov . These wi ll be explained in more detail in the following slides.
· Web hells: Only useful for Internet-accessible system . Often used as an initial entry point in an environment.
· Task chedules: All major operating systems have task schedulers available (Task cheduler, At, Cron ...). A highly popular means of persistence.
· Registry manipulation: A number of registry keys are used during the start-up/ user logon process. hese can be abused by adver aries to add maliciou ode to be ·ecuted upon tart-up / logon.
· Auto-start services: Many sy tems use a number of ervices that will automatically launch at start-up (o ften even with elevated privileges). Adver aries could add additional ervices that appear to have normal names or fun tions (will require administrative pri ileges);
· DLL search order hijacking: Highly interesting technique abusing the wa Windows prioritizes the loading ofDLL' s;
· U er startup folders: much like registry manipulation, adversaries could implement shortcuts / scripts in a user's startup folder, which is e ecuted upon logon;
· Bootkits are u ed to affect the system upon startup. Malicious code that infects the Master Boot Record (MBR) will run even before the Operating ystem i launched.
We will ana lyze all of these { chniques in the upcoming ection!

© 2017 Erik Van Buggenhout & Stephen Sims

11

For systems with Internet connectivity, web shells are a highly popular means of ensuring persistence (provided a web server is running)

What?

A web script that allows an adversary to run commands on the targeted web server. It serves as a gateway into the network.

How?

An adversary is able to upload the web script to the file server, through legitimate upload functionality or a vulnerability. Afterwards, the web shell file is served back to the adversary.

Examples

Deep Panda uses web shells on publicly -accessible web servers to access victim networks. Another example is China Chopper. an advanced web shell that supports different server-side scripting languages.

SAN~

.. I.'

.

I

I

Web hells- Introduction A web script allows an adversary to run command on the targeted web server. h can erve as a gateway into the network. Web sh II can provide a simple interface tha1 allow to nm single commands, or consist ofan advanced GUI with multiple type of functionality , su has direct file a cess, databa e connections, or network reconnaissance to c plore the internal network.
For an adversary to be able to abuse a web shell on a web server, the web shell lirst has to be uploaded. This could either be done through a legitimate upload function provided by the web server, or might be possible due to a vulnerability present in the web application or web server oflware. Once the adversary has been able to upload the web shell, it has lo be served back. If the file is acces ible, but not interpreted as web cript, and thu shown back as simple text, the adversary will not be able lo execute commands. TI1e web server has to interpret the web shell' cript and serve that back to th adversary.
orne fam us example are eb shells used by the Deep Panda threat group, who used them as primary access back into victim organizations in the defense, legal. telecommunication and financial industrie . This wa an interesting approach as web shell were mostly onl seen as a first stag into obtaining a foothold in the target network, after which the \ ould be abandoned as soon as a second stage malware was communicating back to the adver aries. The usage of web ~hells gave D ep Panda ome advantages such as the absence of C&C beacon traffic, a low detection rate by AV products, a11d the ease to switch source IP addresses, making it difficult for the defenders to block known C&Cs. More information on Deep Panda web hell can be found here: https://www.crowd trike.corn/blog/mo- hell -mo-problems-deep-panda-web-shell /
An advanced example of a web she! I is the China Chopper shell , which supports server payloads for many different kinds of erver-side scripting languages and contains functionality to access files, connect to a database, and open a virtual command prompt. An anal sis of China Chopper can be fow1d here: http ://www.fireeye .com/blog/threat-re earch/2013/08/breaking-d wn-the-ch ina-chopper-wcb-shel 1-part-i.htmI.

12

© 2017 Erik Van Buggenhout & Stephen Sims

,i,f+- Web Shells - Some Notable Examples
The WSO web shell offers a broad range of functionality. including a graphical file browser.
Web shells often try to stay under the radar. The example below is disguised as a 404 page, but contains a hidden password field that leads to the actual shell.

p

h

.-..., r-v r

r: I · / . ).0. I

---C>UU J C rt, uo

Web Shells - ome otable Example.<, A number of shell offer the creation of a botnet in a little as a click, launching standalone processes that either conn ct to a command and control server or listen for command· over an insecure TCP connection. Some allow perfom1ing port scan to find potentially exploitable services. Others enable fraudsters to schedule denial f service attacks. Ther are shells dedicated to sending bulk spam emails, testing stolen credential against popular websites (such as Pay Pal or Amazon), cracking passwords and automatically defacing , ebsite . With such a wide array of powerful features, it is unsurprising how popular web hells are with c ber criminals.
popular and feature-rich web hell is WSO. W O offers among others file managemenl such as browsing directory ontents in a GUI, but also both bind shell and back connect options. Selecting one of these options will launch a standalone process that will connect to or listen for a connection from a remote command and control server - an easy method for rhe creation of a botnet.
Web shell will often try to stay under the radar to avoid detection by server admins or other hackers. A particularly common ploy is that of fake error pages, u ed by some variants of the C99 web hell. These shells attempt to recreate the default Apache erTor pages, usually 404 Not Found or 40 Forbidden. When viewed in a , eb browser, these fake pages can easily be mistaken for legitimate error messages. However, when ompared side-by- ide, discrepancie can be found by looking for incorrect or omitted version numbers, hostname . URL , and HTML titles. These fake error pages also contain hidd n password fields, ,vhich provide acces to the web shell: some variants simply set the background and border colors to match the page background, while other add Java cript that reveals the password fonn when the port number is clicked.
Another notable method for avoiding detection is prefixing the web sh II script with small e ·cerpts of image lile header - most commonly tho e from rhe GIF89a specification. When processed by the PHP interpreter, these bytes are ignored and passed through to the web browser, displaying the text "GIF89a". Automated tools such as the open- ource utility file use these magic bytes as a fingerprint to identify the file type, mistaking the malicious PHP script for an image. Reference: https://new .netcraft.com/archives/2017/05/18/web-shells-thecriminal -control-panel.html

© 2017 Erik Van Buggenhout & Stephen Sims

13

So... We know what web shells look like and how they are used. Now how do you prevent / detect them?
· Restrict file upload possibilities · Review web applications running on web server (SDLC, penetration testing, ... ) · Patch public web servers regularly · Limit the web server's account privileges

SA !\·r
l 1'tl

· Process monitoring · Web root integrity & file monitoring · Authentication attempt logging · Traffic analysis
(e.g. Analyze large volumes from the web server to internal network segments)

-

-

-

. .

. . .... -

., . -~ ·_ ·~ .. . ,. . ·. . .' .

. I
' .

Web Shells - Prevent & Detect fl is easier to pr vent web shells fi-om being abu ed as a persistence mechanism in your server or network 1.han to detect them.
Ifyour web application has a file upload function, it hould have some restriction . ir t of all, it's po sible to limit the types of files that can be uploaded (based file header for example). It could be wis to disallow u ers to upload web script ofvarious types. ln case all kinds of files ar allowed to be uploaded, it ' possible to restrict how users ace ss these files. Avoid having the web server interpret uploaded scripts, for example by changing the file names for all uploaded files or by only allowing users to download them.
· In ca e file upload i not allowed, measur s hould be taken to avoid unforeseen le upload. Make ure
adversaries cannot abuse known vulnerabilities that could al low remote code execution or file inclusion by regularly patching your e ternally reachable \ eb servers.
In case adversaries do succeed in uploading and abusing a web shell, it is still possible to limit the po sible damage they can do. Audit account and group permissions of the web server's account and make sure it does not have local r ot privileges or access to unnecessary file and folders. If the web server is part of an Active Directory make sure accounts that are used to rt1,mage it do not overlap with permissions for U1e intemaJ network.
In case all prevention mea ures failed , the web shell might still be detected. Howe er, they can be difficult to detect, since they do not initiat connections. The portion oftbe shell that resides on 1.he web server might al o be mall and innocent looking. Process monitoring couJd be used to detect suspiciou actions such as command e ecution or file acces outside the web directory. Often, an adver ary will try to go for the /etc/pass,. d file. File monitoring cou ld be us d to detect web shell code being injected into other web application files. In case files are changed that do not match update to the web content, this might be an indication of unauthorized changes by an adver ·ary. Additionall , log authentication attempts to the erver to avoid potential brute forcing and monitor network traffic for suspicious activity to and from the web crver and the internal network.

14

© 2017 Erik Van Buggenhout & Stephen Sims

For a variety of systems (e.g. workstations, servers, ...) the task scheduler can be a highly effective persistence mechanism:

What?
'
How?

Utilities such as "at" and "schtasks" (Windows) and cron can be used to schedule programs or scripts to be executed at a date and time or at startup.
An adversary may use task scheduling to execute programs at system startup or on a scheduled basis for persistence, but also for lateral movement, or privilege escalation.

Examples

Too many to name ... Shamoon - copies an executable to the target using Windows Admin Shares and schedules an unnamed task to run it. Remsec - schedules the execution of one of its modules by creating a new scheduler task.

. SAN~

Task Schedulers - Overview Utilities such a ''at" and·· chtask " , along with the Windows Task Scheduler. can be used to schedule program or scripts to b executed at a date and time or at startup. The account used to create the task must be in the Administrators group on the local system. A ta k can also be scheduled on a remote y tern, provided the proper authentication is met to use RPC and file and printer sharing is tumed on.
n adversary may use task. scheduling toe ·ecute programs at s stem startup or on a scheduled basis for persistence, but also for lateral movement, or privilege escalation to YSTEM. or running a process under the context of a pecified account.
A famous case that makes use of scheduled ta ks is hamoon. It copies an executable payload to the target using Window Admin Share and schedules an tmnamed task lo run the malware. Remsec - schedules thee ecution of one of its modules by creating a new cheduler task. http -J/www.fireeye.com/b log/threat-r search/20 16/ I 1/fi reeye_ respondsto. htm I
Another well-known example is Remsec, a modular backdoor aimed at pionage, whi h was used by Strider, a.k.a. Project auron . he execution of one of its modules was cheduled using a new scheduler task . An analysis by Kaspersky can be found here: hnps ://secureli st.com/ fiks/20 I6/07rfht:· Project auron-APT_Technical_Analysis_KL.pdf.

© 2017 Erik Van Buggenhout & Stephen Sims

15

Source: www.acmnis.com
SANS

Name:
location: ut hor:

Microsoft Boost ernel Opt1m11.at1on ,ndo s 11crosoft Corporation co.

Source: www.clearskysec..com

The RAT (Remote Access Tool) used by the CopyKittens a~cl< group runs itself
every 20 minutes using the Task Scheduler. Interestingly, this renders the
victim machine unstable, as several instances of the RAT would be running at
the same time ...

·

·

Task chedulers - Some Notable Examples So, let 's have a look at some notable examples of persistence through task schedulers. Due to the si mplicity of this attack, it's one of the most popular persistence strategies. ome examples include:
· The Metasploit Meterpreter has a built-in "automated persistence'' method that will rely on a schedul d task being added·
· Petya I otPetya used the "at" task cheduler in June 2017 to shut down machines before starting the encryption process;
· The RAT (Rernote Access Tool) us d by the Copy Kitten. attack group runs itself every 20 minutes u ing the Task Scheduler. Interesting ly, this render the victim machin unstable, as severa l instances of the RAT would be run ning at the ame time ...
From a forensic perspective, scheduled tasks (both using the Task Scheduler and ''at") do leave some artefacts we can use to further analyze & investigate.

16

© 2017 Erik Van Buggenhout & Stephen Sims

What?

A variety of registry keys can be used to run scripts whenever a user authenticates:
· HKCU\Environment\UserlnitMprlogonScript ("logon scripts") · HKCU\Software\Microsoft\Windows\CurrentVersion\Run\ ("Run key")

How?

Adversaries can use these configuration locations to execute malware and maintain persistence through system reboots. The registry entries can be manipulated to look as if they are associated with legitimate programs.

Examples

Together with Scheduled Tasks, this is one of the most popular persistence strategies out there for Windows-based environments. Examples include Lazarus Group (RomeoAlfa malware), APT30 (FLASHFLOOD malware), APT28 (JHUHUGIT). . ..

Registry Manipulation - Overview Adding an entry to the '' RLm keys" in the Registry or startup folder will cause the program referenced to be executed when a user logs in. The program will be executed under the context oflhe user and will have the account's associated pennis ions level. Some examples include:
· Login scripts under HKCU\Envir nment\UserlnitMprLogon cript · "Run" registry keys under a variet of po sible locations, including
HKCU\Software\M icrosofl\Windows\CurrenlVersion\Run\
Adver aries can use these configuration locations to execute malware and maintain persistenc through system reboots. The Registry entries can be manipulated to look as if they are associated with legitimate program .
Lazarus Group made use of RomeoAlfa maIware. which has per istence by aving itself in the tart menu
folder.
FLA HFLOOD - Malware d veloped b APT30 that allows to exfillTate data across air-gaps. It create an entry in the Run key. The following reference contains a ection on the PLASHFLOOD malware: brtps ://www2.ti reeye.com/rs/frreye/images/rpt-apt30.pdf.
JHUHUGIT is a piece ofmalware used by APT28. It registers a Windows shell cript under lhe Registry key HK U\Environment\ serlnitMprLogon cript 10 establish persistence. A good analysis of the APT28 group, including the use of Logon scripts is located here: hllps://www.welivesecurity.com/wpcontent/uploads/2016/ 10/eset-sednit-partl.pdf

© 2017 Erik Van Buggenhout & Stephen Sims

17

What?

Windows uses services that perform background system functions. A service config, including the executable's path, is stored in the registry. Services can be added or manipulated by Administrators using tools such as sc.exe and Reg.

How?

Adversaries may install a new service that can be configured to execute at startup. The
service can be disguised by using the name of another, "seemingly'' legitimate program. Alternatively, the adversary could modify an existing service to execute and persist the malicious payload.

Examples

Carbanak - The bank-targeting threat group has used services to provide persistence and privilege escalation (services ending in "sys'' appeared on the system). Lazarus Group - Has several malware families that install themselves as services on a victim machine.

~,AN! ~'

.

.' .

Windows Services - Overview When booting, Windows can start programs or applications called services that perfonn background system functions. A ervice's configuration information, including the file path to the service's executable, is tored in the Window Registry. Service configurations can be modified using utilities such as sc.exe and Reg.
dver aries may install a new se1 ice that can be configured to execute at startup b using utilities to interact with services or by directly modifying the Registry. The service can b disguised by using the name of another legitimate program. S r ices may be created with administrator privilege but are
ex cuted under YSTEM privileges, so an ad ersary ca n use a service to es alate privileges from
administrator to SY TEM. Services can also be executed directly.
[n tead of creating a new service, an adversary can also modify an existing service to execute and p rsist th malicious payload. The usage of existing ervjces is a type of masquerading that may make detection analysis more challenging. Modifying e ·is1ing. rvices could interrupt their functionality or enable services that are disabled or otherwise not common ly used.
Carbanak is a threat group that mainly targets banks. Their ma)ware makes use of service to provide persistence and privilege esca lation . An analysis on the Carbanak APT can be found here: https://secureli t.com/files/20 I5/02/Carbanak_APT_ eng.pdf.
Lazarus Group is a threat group that was responsfble for the attack against Sony Pictures Entertainment. Several of their malware families insta ll themsel es as new ervices on ictim machines. A very detailed report on Operation Blockbuster, carried out by the Lazarus Group, can be found here: https://www.operationblockbuster.com/wp-content/uploads/2016/02/0peralion-Blockbuster-Report.pdf

18

© 2017 Erik Van Buggenhout & Stephen Sims

What?

Dynamic-link library (or DLL) is Microsoft's implementation of the shared library concept If a DLL has to be loaded, Windows will search a number of directories in a certain order, starting with the directory where the application was called from.

How?

Adversaries can perform DLL preloading. by placing a malicious DLL with the same name as a legitimate DLL in a location that Windows searches first. Adversaries can also replace an existing DLL or modify a manifest file to cause another DLL to load.

Examples

Operation Groundbait- Made use of the Prikormka malware family, which used DLL search order hijacking for persistence by saving itself as ntshrui.dll to the Windows directory. Downdelph -A first stage down loader used by APT28 that used DLL search order hijacking of the Windows executable sysprep.exe to escalate privileges.

DLI ,. earch Order Hijacking - Overview Dynamic-link library (or DLL) is Microsoft's implementation of the shared library concept. Windows will follow a specific search order when a DLL ha to be loaded. Ad ersaries can perfom1 DLL preloading, by placing a malicious DLL with the ame name as a legitima!e DLL in a location that Windows searches first. That wa , when Windows encounters the malicious DLL, it will be loaded instead of the legitimate one. dversaries can al o replace an exi ting DLL or modify a manifest tile to cause another DLL to load. The malicious DLL can als be configured to load the legitimate DLLs they are meant to replace, which m ans the app lication keeps functioning as it normally would.
Operation Groundbait was mostly observed in Ukraine and used for surveillance. It made u e ofa malwar family called Prikom1ka (which roughly translates to groundbait from Russian) which employed DLL search order hijacking for per isten e by saving itself as ntshrui.dll to the Windows directory o it will load before Lhe legitimate ntshrui.dll aved in the System32 ubdirectory. Info on Op ration Groundbait can be found here: http ://www.welivesecurity.com/wp-content/uploads/2016/05/0perationGroundbait.pdf
Another example is Downdelph, a first stage down loader that was (although rarely) used by APT28. It also made u e of DLL search order hijacking, but targeted the Windows executables sprep.exe, with the goal of escalating privileges. An analy is can be found here: https://vA w.welivesecurity.com/wpcontent/upload /2016/10/es t-sednit-partJ .pdf

© 2017 Erik Van Buggenhout & Stephen Sims

19

B fore the system searche for a DLL, it ch cks the following: · If a DLL with the same module name is already loaded in memory; · If the DLL is on the list of known DLLs for the version of Windows oa which the application is
running. Wben the sy tern searches for a PLL it will use one of the following search orders:

SafeDIISearchMode enabled
1. The directory from which the application loaded. 2. The system directory (GetSystemDirectory) 3. The 16-bit system directory. 4. The Windows directmy,
(GetWindowsDirectory') 5. The current directory. 6. The directories that are listed in the PATII
environment variable.

SafeDIISearchMode disabled
1. The directory from which the application loaded. 2. The current directmy 3. The sy tem directory (GetSystemDirectory) 4. The 16-bit system directory 5. The Windows directory
(GetWindowsDirectory) 6. The director.ie that are listed in th PATH
environment variable.

SAN.S

. . ......'

' . I

DLL Search Order Hijacking - earch Order Before lhe system sea rches for a DLL, it checks the following:

· If a DLL with the same module name is already loaded in memory, the sysc m uses the loaded DLL, no matter which directory it is in. The system does nots arch for the DLL.
· If che DLL is on the list of known DLLs for the version of Windows on \vhich the application is running, the system uses its copy ofthe known DLL (and the known DLL' dependent DLLs, if any). The system does not search for the D L. For a list of known DLL on the curr nt system, see the following registry key: I-I KEY_ LO AL_MACHJNE\SYSTEM\CurrentControlSet\Control\Session Manager\ KnownDLLs.

The standard DLL earch order used by 1he system depend on whether safe DLL search mode is enabled or disabled. Safe DLL search mode places lhe user' curreat directory later in the search order.

lf SafeDII earchMode is enabled the earch order is as foll ws: · The directory from which the application loaded. · The system directory. Use the GetSystcmDirectory function to get the path of this directory. · The 16-bit tern directory. There is no function that obtains the path of this directory, but it is searched . · The Windows directory. U e th GctWim.low Directory function to get the path of this directory. · The current directory.
· The directories that are Ii ted in the PATl I environment variabl . Note that thi does not include the per-application path pecified by the App Path registry key. The App Paths k y is not used when computing the DLL search path.

lf afeDllSearchMode i disabled, the search order is as follows: · The directory from which the application loaded. · The current dir cto1 .
· The system directory . Use the GetSystemDirectory functi011 to get the path of this director_. be 16-bit system directory. There is no function that obtain the path of this directory, but it is searched. he Windows directory . Use the GetWindowsDirectory function to get the path of this directory.
· The directories that are listed in the PATH environment variable. Note that this does not include the per-application path pecificd by the App Path regis1ry key. The App Path key i not used when computing the DLL search path.

20

© 2017 Erik Van Buggenhout & Stephen Sims

Certain auditing tools are capable of detecting DLL search order hijacking opportunities. Use them to correct these. · Use a whitelisting tool such as Applocker, capable of blocking unknown DLLs. · Ensure the ' SafeDLLSearchMode" registry key is enabled. · Disallow loading of remote DLLs

· Monitor file systems for moving, renaming, replacing, or modifying DLLs. · Detect DLLs loaded into a process with the same name but an abnormal path. · Monitor modifications to .manifest redirection files.

. SANS

-

·

· -- - ·-~

DLL earcb Order Hijacking - Preveot & Detect In order to prevent & detect DLL search order hijacking attacks there are a few ontrols we can consider:
· Certain auditing tools are capable o detecting DLL search order hijacking opportunities. You can use these tools to identif potential DLL search order issues and correct Lhem. An example tool i Powerup (http://www.verisgroup.com/2014/06/ I 7/powerup-usage/).
· Additionally, a whiteli ting tool such as AppLocker, capable of blocking unknown DLLs. can be used
a well.
· Finally, in order to reduce the opportunity of DLL search order hijacking vulnerabilities, ensure the "SafeDLLSearchMode" regi try key is enabled.
· Disallow loading ofremote DLLs which could take place ifan application sets its current directory to a folder on a hare.
In order to detect DLL search order hijacking attacks, the following control can be con idered: · Monitor file system. for moving renaming, replacing, or modifying DLLs. hanges in the set of DLLs
that are loaded by a process (compared with past behavior) that do not correlate with known software,
patches, etc., are uspicious. · Monitor DLLs loaded mto a process and detect DLLs thai have the same fik 11a.i1Ic but abnom,aJ path . · Modifications to or creation of .manifest and .local redirection files that do not correlate with software
updates are suspicious.

© 2017 Erik Van Buggenhout & Stephen Sims

21

What?

A hard drive's boot -sectors include the Master Boot Record (MBR) and Volume Boot
Record (YBR). The MBR is the first sector of the hard disk, while the VBR is the first
section of a partition. A boot sector allows the boot process to load a program.

How?

Adversaries may use bootkits to persist on systems at a layer below the operating system, by modifying the MBR orVBR, which may make it difficult to perform full remediation.

Examples

APT28 - Have used a bootkit, which shares code with some variants of Black Energy. Lazarus Group -WhiskeyAtfa-Three malware modifies sector O of the MBR to ensure persistence.

~NS S,,C{I \l

--

-

-- -

·· - · - · · . · · · ' ·

-

- - - -

·. - '
-

--

--·
· · · 11

Bootkits - Overview A boot sector is a region of a hard drive that contains machine code to be loaded into random-acces memory RAM) by a computer's built-in finnware. The purpose ofa boot sector i to allow the boot process ofa computer to load a program (usually, but not necessarily, an operating sy ·tem) stored on the same storage devic . A hard drive' boot sectors include the Master Boot Record (MBR) and/or Volume B ot Record (VBR):
· A Master Boot Record (MBR) i the first sector of a data torage device that has been parti Iioned. The MBR sector may contain code 10 locate the active partition and invoke its Volume Boot Record.
· A Volume Boot Record (VBR) is the firsts ctor ofa data storage device that has not been partitioned or the first sector of an individual partition on a data storage device that has been partitioned. It may contain code to load an operating system (or other standalone program) installed on that d vice or within that partit ion .
Adversaries may use b otk:its top rsist on ystems at a layer b low the operating stem, by modifying the MBR or VBR, which may make it difficult to perform full remediation . The MBR is the section of disk that is lirst loaded after completing hardware initialization b the BIO . An adversary who has ra\> access to the boot dri e may overwrite this area. diverting execution during startup from the normal boot loader to adversary code. The MBR passes control of the boot process to the VBR. Similar to the case of MBR, an adversary who bas raw accc s to the boot dri e ma overwrite the VBR to di ert executi n during startup to adver ary cod .
Once again, PT28 comes into play, Th y have used a bootkit that shares ome of its code with variant of the Black Energy mal vare. More information here: https://wW'I .welivesecurity .com/wpcontent/uploads/20 l6/ 10/esct-sedn it-part3. pd f
Th Lazarus Group is no stranger to us either. Their Whi keyAlfa-Three malware modifies sector Oof the MBR lo ensure persisten e of their malicious program . Detailed info on this (and other) malware can be found here: http ://operationblockbu ter.com/wp-content/uploads/20 l6/02/Operation-Blockbuster-DestructiveMalware-Report..pdf.

22

© 2017 Erik Van Buggenhout & Stephen Sfms

· Ensure proper permissions are in place and prevent adversary access to privileged accounts.
· Use Trusted Platform Module technology and a secure boot process to prevent system integrity from being compromised.

· Perform integrity checking on MBR and VBR {baseline needed). · Report changes to MBR and VBR as they occur for further analysis.

'

-

SANS

Bootkit - Prevent & Detect Ensure proper pennissions are in place to help prevent adver ary access to privileged accounts necessary to perfonn modifications to the boot sectors. Use Trusted Platform Module (TPM) technology and a ecure or trusted boot process to prevent system integrity from being compromised.
A TPM is a microcontroller that can be used to store platform measurements that help ensure that the platform remains tru tworthy. The primary scope of a TPM is to assure the integrity. In this context ''integrity" means "behave as intended", and a ''platfom1" is genericaJly any computer platform - not limited to PCs or a particular operating system: start th power-on boot proce , from a trusted condition and e tend this trust until the operating system has fully booted and applications are running. A good ummary on TPM i available here: https://www.trustedcomputinggroup.org/wp-content/u ploadsffrustedPlatfonn-Module-Summary_04292008.pdf
Perfonn integrity checking on MBR and VBR. To do this, lake snapshots ofMBR and VBR and compare against known good samples (i.e., a baseline). In case change to the MBR or VBR have taken place, further anaJysis should be performed to detem,ine malicious activity.

© 2017 Erik Van Buggenhout & Stephen Sims

23

So... How Do We Prevent Persistence?
Although several different persistence techniques exist, the following recommendations will go a long way:
Limit user privileges to prevent the installation ofbootkits or Windows services; Remediate vulnerabilities that could allow persistence (e.g. DLL search order hijacking)· · Block unneeded utilities or software that could be used to schedule tasks (for example with AppLocker or software restriction policies).
Given the large number of techniques available to the adversary, we should not only focus on prevention, but should also assess how we can detect persistence in our environment ...
So .. . How Do We Prevent Persistence? Several different persistence t chniques exist, some of which require a spec iii approach, which we have hjghlighted in the techniques above. The following recommendations, ill, however, go a long way to prevent persistence from ucceeding in your environment:
· Limit user pri ileges Lo prevent the installation ofbootkits or Windows ervices. We will discuss thi in more depth during the Privilege Escalation & Active Directory sections of this course;
· Remediate vuln rabilities that could allow persistence (e.g. DLL search order hijacking); · Block unneeded Lltilities or software that could be used to schedule task (fore ·ample with AppLocker
or oftware restriction policies).
As a number of different persi tence opportunities e ist and it will be difficult to deny an adversary to persist once he / she actually obtair1s access to an environment, we strongly advising taking eftort t detect persistence a well!

24

© 2017 Erik Van Buggenhout & Stephen Sims

So... How Do We Detect Persistence?
How do I detect persistence in my environment?
Use host-based agents (IDS, AV, EDR, ...) to detect & alert upon changes to typical persistence locations such as Winnows services, startup scripts, scheduled tasks, .. .
· Periodically collect & analyze autorun information from all hosts in yowenvironment. Dashboard, analyze & spot anomalies! Again, a big data tool such as ELK can be of help here! Although different tools & scripts exist, a great tool is "Autoruns' (part of Microsoft Sysinternals)...

,-S-AN-S .

-

-

--

-

, "- ,- -

-

-'
I

o... How Do We Detect Per ·istence? Although adversaries are continuou ly changing & adapting the way they penetrate our network , 1hey only have a number of options available for per istence. Two main trategies exist to detect per i tence strategies in your environment:
IJost-based agents (IDS, , EDR · -- ) can help you detect & alert upon changes to typical persistence locations such as Windows services, startup scripts, scheduled tasks, .. .
Detectin~ persistence oflen relies on finding anomalies in your environment. Monitor cheduled task creation from common utilities using command-line invo ation. Legitimate scheduled tasks could be created during installation of new oft ware or through system administration functions so beware of false positives. Monitor process execution from the Window Task Scheduler ta keng.exe, and changes lo the Windows Task Scheduler stores (¾system root%\ ystem32\Tasks) for change entries related to scheduled tasks that do not correlate with known software, patch cycles, etc. Data and events shou ld not be viewed in isolati on but as part ofa chain of behavior that could lead to other activiLies, such as networ~ connections made for C&C, learning details about the environment through discovery, and lateral movement.
Tools such as ysinternals Autoruns may also b used to detect system changes 1hat could l.,e attempts at persistence. including listing currently scheduled tasks. Look for hanges to tasks that do not correlate with known software, patch cycles, etc. Suspicious program execution thr ugh scheduled 1asks may show up a outlier processes 1hat have not been e n b fore when compared against historical data.
Monilor processes and command-line argument · for actions that could be taken to create tasks. Remme ac ess too ls with built-in feature may interact directly with the Windows AP! to perfonn the c function outside of typical system utilities. Tasks may also be created through Window system management LOols such as Windows Management Instrumentation (WM!) and PowerShell. so additional logging may need to be c,mfigured to gather the appropriate data.

© 2017 Erik Van Buggenhout & Stephen Sims

25

Detecting Persistence -Autoruns for Windows

""S' ~

· 'SP"!.ffn..M\.~-\)'111M~l'-"M

Different tabs with categories

f·< E""Y S!l,boo· .t!<lf'

,d' ~

_ ,_ _

"""'1lU,

. ..'rio<lool

, , . _ . ._ . .

°"""" ::J ,,.,..,..,"- ---1' ~

~ ~

-r-._..,,....

. _.._ ~

--
.::i - ~

-Gqc..
.._~

0 ){
I] C)Hu -

-,a_,- -,"--- "-'.,..,.""1'

-

ltll.11.:!iOnW~v.-..:u,,n Ill,,

0 ,i..-U.."'-VW.·T·_,,,·s,,,,.,,

= " " HiQJla:ifTWAAl\~~-

0 V

W,l(f -

,_.,
·-~

0~ .5w .,n.:ir..,.o...-...._.· ·..- ....- ~

.... . ,_.

T4'!'Hltr1Eli

- = 1 151 · 1Mll!2011 1' l!I
11/07111!1f 10.21

· - ~ c . ,:&~'2013111' c _..,blak-h 12.Wl0171U!
ti,~,1~,

·Jr.~-~~--.~---~~ 10!21 ...~ --.-.--- a..0-

r,, 0

(NO,,.,,

0 Of'eM'H<AII

-0..00-

~
-~

L·.-_-...<,.,l,~o...<..-c.·...-

l:V,.v.!O!Ul-" 211t,:ill 1HIG)

i::: ~'f'l'lliilO~C!P0ill·.W: .,.~t12i!

· _

...._ _'CIO,\ao 221'0l,1Jn7 ..,

mwm1111·

0 -.ao-n _,o..

Ev-~ ~r.-..h

1J1!J.~17JI!~

YirusTotal link can be enabled

.,

. . . ---· .. .

SANS

Detecting Persistence -A utoruns for Windows
Autoruns has "the most comprehensive knowledge of auto-starting locations of any startup monitor''. It
attempts lo how you a full overview of what programs or scripts are configured to run dw-ing system boot or user login or when bLLilt-in Windows applications such a Explorer or Internet Explorer starts.
Some of the example localion it monitors include:
· Run, RunOnce and other Registry keys · Explorer shell extensions · Scheduled tasks · Auto- tart service
Autoruns is by default configured to hide default, known Windows entries, providing you with an indepth view of what is executed once the computer boots.

26

© 2017 Erik Van Buggenhout & Stephen Sims

Persistence -Additional References
Some additional resources concerning persistence mechanisms:
An extensivelist of persistence mechanisms can be found here: https: //attack.mitre.org/wiki /Persistence
· SANS DFIR blog po ton DLL hijacking https://di&ital-forensics.san .org/blog/2015/03/25/detecting-dll-hijacking-on-windows/
utoruns for Windows htt:ps://docs.microsoft.com/en-us/sysinteruals/downloads/autorun
Persistence - dditional References ome additional re ources concerning persistence mechanism :
· An extensive list of per istence mechanisms can be found here : https: //attack.mitre.org / w iki /Persi s tence
· SANS DFIR blog post on DLL hijacking https ://d igital-forens ics.san .org/blog/2015/03/25/detecti ng-d 11-hijacking-on-windows/
· Autoruns for Windows https://docs.microsoft.com/en-us/sysi ntemals/downloads/autoruns

© 2017 Erik Van Buggenhout & Stephen Sims

27

Course Roadmap
Day 1: Knowing the adver ary, knowing yourself Day 2: Averting Payload Delivery · Day 3: Preventing Exploitation
Day 4: Avoiding Installation, foiling Command & Control & thwarting lateral m.ovement Day 5: Exfiltration, Cyber Deception & Incident Response
Day 6: APT Defender Capstone

SEC599.4

Avoiding Installation

Typie11I Persistence Strategies

·

Exercise: Catching Persistence Principle of Least Privilege & User Access Control

Exercise: local Windows Privilege Escalation Techniques

Foiling Command & Control

Network Monitoring Considerations (Netflow, IDS. ...)

Detecting Command & Control Channels

Exercise: Surical)'I to Detect Niitwork Anomalies

Thwarting lateral movement

Introducing Common l..lteral Movement Strategies

Active Directory Architecture & Ana,ks

Active Directory Hardening & Segmentation

Exercise: Hardening Windows to Stop l..lteral Movement

Detecting l..lteral Movement Using Windows Event Logs

Exercise: Configuring & Forwarding Windows Event Logs

Thi page intentionally left blank.

28

© 2017 Erik Van Buggenhout & Stephen Sims

Exercise - Catching Persistence
I J IThe objective of the lab is to detect persistence strategies implemented on one of our Windows machines! The high-tevet steps of the exercise are listed below, but feel free to refer to the LODS workbook for additional information.
High-level exercise steps: 1. Run autoruns & Malwarebytes Anti-Rootkit on our Windows system 2. Analyze the output & identify the malicious persistence mechanism 3. Create a GPO to run autoruns periodically on all Windows system 4. Optional: Dashboard the autoruns output in ELK stack for baselining
Exercise - Catching Persistence The objective of the lab is to detect a number of persistence trategies implemented on one of our Windows machines! The high-level teps of the exerci e are listed below, but feel fi-ee to refer to the LOOS workbook for additionaJ information. Throughout the exercise, you will comp lete the following high-level steps: l. Run autorun & Malv arebyte Anti-Rootkit on our Windows system 2. AnaJyze the output & identify the malicious per istence mechani m 3. Create a GPO to run autorun periodically on all Windows systems 4. Optional: Dashboard the autoruns output in ELK stack for bas lining For additional guidance & details on the lab, please refer to the LOD workbook.

© 2017 Erik Van Buggenhout & Stephen Sims

29

Exercise - Detecting Persistence - Conclusions
During this exercise, we used two different tools to try catching persistence in our environment. Some conclusions from this exercise:
Autoruns and Malwarebytes Anti-Rootkit are both useful tools that can help us detect typical persistence strategies implemented by malware

··elastic

An interesting, enterprise-compatible, approach would be to script these tools and have them run on a periodic basis (e.g. once every week). Its results could then be dash-boarded, after whicb anomalies/ outliers can be detected.

SANS

·.~ ·
--

-

.

,. - -- - ·1

--

l

Exercise - Detecting Persistence - Conclusions During this exercise, we used two different tools to try catching persistence in our environment. Some conclusions from this exercise:
· Autoruns and Malwarebytes Anti-Ro tkit are both useful tools that can help us detect typical persi tence strat gies implemented by malware;
· An interesting, enterprise-compatib le approach ould be to script thes e ecutable and have them run On a periodic basis (e.g. on e every we k). Its results ouJd then be dash-boarded, after which anomalies / outlier can be detected;
· Once anomalies are detected they can be further in estigated (e.g. uspicious binaries can be analyzed to assess how they behave).

30

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
Day 1: Knowing the adversary, knowing your elf Day 2: Averting Payload Delivery Day 3: Preventing Exploitation Day 4: Avoiding Installation, foiling Command & Control & thwarting lateral movement Day 5: Exfiltration, Cyber Deception & Incident Respon e Day 6: APT Defender Capstone

·~ ~~,-a~i~,T.~_.

-

SECS99.4
Avoiding Installation Typical Persistence Strategies Exercise: Catching Persistence Principle of least Privilege & User Access Control Exercise: local Windows PriYilege Escalation Techniques
Foiling Command & Control Networ'k Monitoring Considerations (Netflow, IDS, . . .) Detecting Command & Control Channels Exercise: Suricaci to Detect Network Anomalies
Thwarting lateral movement Introducing Common Lateral Movement Strategies Active Directory Architecture & Atiacks Active Directory Hardening & Segmentation Exercise: Hardening Windows to Srop Lateral Movement Detecting Lateral Movement Using Windows Event Logs Exercise; Configuring & Forwarding Windows Event logs

. .

.

. -

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

31

Least Privilege
Every program and every user of the system should operate using the least set of privileges necessary to complete the job. Why?

Malware

More users running with elevated privileges results in a greater risk of infection.

Data leakage More users running with elevated privileges increase the chance of data loss.

Helpdesk cost
Network slowdown
\ \ls SAtli ..
,'

Users with the privilege to change configuration might cause problems due to errors.

Users creating problems on their own system might impact the network as well.

- --- - - -
-

-. ~

.. ; .--.. .·. ·. -;I

..... ,..- ··i': ~ -_~.:

· ... · _:. :·J1

-

--

--

-

-

-

-

-- J

Least Privilege The principle of least privilege could be defined a follows: ''Every program and every user of the system
hould operat using the lea t et of privilege necessary to comp let the job.' - Saltzer and Schroeder. Graming permissions to au er beyond the scope of the necessary rights ofan action can allow that u er 10 obtain or change information in unwanted ways. Some specifi e ·ample of why implementing t ast privilege in your organization are listed bclo\ .
First of all, there' s a greater ri k ofmalware infection. Allowing users to download and/or install any application they want means they are allowed to install potential malware. Not onl malware downloaded from the internet, but also malware making u e ofa U B key as an infecti 11 vector could b installed.
In attacks in which the target is an organization's intellectual property, accounts that have been granted powerful pri ileges with in application can be targeted to allow ex filtration of data. Although the accounts that have acces to sensiti e data may have been granted no I ated privileges in the domain or the operating system accounts that can manipulate the configuration of' an application or acce s the information the application provides present an increa ed risk. Additionally, adv rsaries cou ld target the accounts that control access to the file stores, accounts that have direct access to the files. or even _group or roles that have access to the files. For example, ifa filt: st:rver is used to store contract documcn and access i granted to the documents by the use ofan Active Directory group, an adver ary who can modify the membership ofthe group an add compromised accounts to the group and ace the contract documents. In cases in " hich acces to docwnents is provided b applications such as harel'oint, adversaries can target the applications as desc1ibed earlier.
noth r potential i sue is the increa d cost ofhelpdesk and IT supp rt. If users hav the pri ileges to change system configurations, they might make changes that result in malfunctions. Be it accidentally, or on purpose (i.e ., they think they know what they are do ing) variou thing could go wrong, such as fil es or share that are suddenly no longer accessibl · neh ork connection issues, etc. This ould result in an increa e<l number of calls to the IT helpdesk.

32

© 2017 Erik Van Buggenhout & Stephen Sims

The issue might not just be limited to their own system, but could result in network is ues for other users as well. For example, when changing properties of a networked file share, other users might lose their ability to view or modify files and thus have their ability to perfonn their work reduced.
References: · http://windowsitpro. com/bl og/least-pri vilege-security-windows-7-vista-and-x p · https://WW\ .us-cert.gov/bsi/articles/knowledge/principles/least-privilege

© 2017 Erik Van Buggenhout & Stephen Sims

33

Least Privilege Principles in Active Directory

Local administrative privileges assigned to end-users should be EXCEPTIONAL

SAN~

Limit accounts with broad and deep privileges · Restrict the number of users in administrator groups · AVOID domain administrator accounts, but create purpose-specific administrative
groups (e.g. "web server administrators'') · Restrict systems that can be used with the admin accounts

Role-Based Access Controls (RBAC) for Active Directory, provide access based on business rules

Monitor Windows event ID's related to addition of admin accounts (4728, 4732, ...)

-

1

.. -

-

Least Privilege Principle in Active Directory Unfortunately, the path of least resistance in many environment has proven to be the o eru e of account with broad and deep privilege. Broad privileges are rights and permissions that allow an a count lo perfom1 specific activi ties aero s a large cros - ection of the environment, for example, an account that is administrator on all ervers.
You should consider carefully whether u er require adrninistrati e rights on their orkstations, and if they do, a better approach may be to create a separate local account on the computer that is a member of the Adm ini trators group. When u ers require elevation, they can present the credential of that local account for elevation, but becau e the account is local, it cannot b used to compromise other computers or acce domain resources. As wilh any local accounts, however, the credentials for the local privileged account should be unique; if you create a local account with the ame credealials on multiple workstations, you expose the computers to pru; -the-hash attacks. Securing local admin accounts: http ://docs.microsofi.com/en-us/windowsserver/identi ty/ad-ds/plan/ ecurity-best-practice /appendix-h--securi ng- local-administrator-accounts-and-groups
Deep privileges are powerful privileges that are applied to a mall number of u ers, such as giving an engineer full administrator rights on a certain server. either broad privilege nor deep pri ilege is necessarily dangerous, but when man accow,ts in the domain are pem,anently 1:,'T'ctnled broad and deep privilege, an adver ary can easily compromise one account and use it to move laterally through the netv ork and potentially compromise additional accounts. We will ee ome examples later this day, during the "attacks 011 AD" section. Unsurprisingly, the number of administrators should be limited, along wi th the number of systems where 011 which admins can use their accounts.
Generally speaking, role-based access controls (RBAC) are a mechanism for grouping user and providing access to resources based on busines fllles. In the case of Active Director , implementing RBAC for AD is the process ofc-reating roles to which rights and permissions ar delegated to allow member of the role to perfo1m day-to-day administrative tasks without granting them e cessive privilege. R.BAC for Active Directory can be designed and implemented via native tooling and interfaces. by leveraging oftware you may already own, by purchasing third-party products, or any combination of these approaches.

34

© 2017 Erik Van Buggenhout & Stephen Sims

Finally, it's a good idea to monitor your Windows environment for the following interesting e ent IDs: · 4728: A member was added to a security-enabled global group (for administrative groups in the domain) · 4732: A member was added to a security-enabled local group (for local administrative groups)

© 2017 Erik Van Buggenhout & Stephen Sims

35

Common Windows Privilege Escalation Flaws
Even when Windows environments are configured according to a "Least Privilege" principle, a number of common Windows privilege escalation flaws could possibly allow an unprivileged user to obtain administrative privileges:

· DLL search order hijacking · Unquoted paths with spaces · Writable Windows Service
executables

· "AlwayslnstallElevated · registry key · Unattended install files · Group Policy Preference
(Windows 2008 domain environments)

Although this is a defensive course, it is vital we understand these flaws so we can better protect against them. We will zoom in on a few of these tricks!

SAN,~

.:- : ·. . .- .. _ · _1

Common Windows Privilege E calation Flaws Even when Window environments are configured according to a "'Least Privilege" principle and the number of adm in istrat ive accounts is restricted, a number of common Windows privilege esca lati on flaws could possibly allow an unpri ileged user to obtain administrative privilege ·. LocaJ privilege escalation issues could be caused by outdated / unpatched software that exposes the core O to vulnerabilities. Mor often, however, they a re the result of a number of misconfiguration or mistakes that adver aries can abuse. The below i a non-exhaustive list of some commonly u d attack trategies :
DLL search order hijacking (whi ch we discus d alread in the persistence section of this material) : Unquoted paths with spaces Writable Windows ervice executables · Alway lnstallEI vated '' registry key
nattended install files Group Policy Preferences (Windows _QQ domain en ironments)
A Ithough this i a defensive course, it is vital ~ e understand these flaws so we can better protect against
them. We will zoorn in 011 <1 few of these tricks!

36

© 2017 Erik Van Buggenhout & Stephen Sims

Unquoted Paths with Spaces (I)

~MM!t Toolf P<o.-,.s (loctl Comj:vl<tJ

X

Gotwllf LovOn ~ Dloeocionclel

,P:lf,f,l,lo_._..,.,..-......VMw..,w,.,,_ r... ....- ...,.

nquoted Paths with Spaces (1) Unquoted paths with space can be a serious issue in Windows Services configurations. Let's analyze an example:
· The picture on the left i a screensh01 of a recent VMWare ools service installed on a Windov s I0 hosl ote the Path to executable, which is set to:
"C:\ Program Files\Vmware\Vmware Tools \vmtoolsd. exe'"
· The picture on the right is a screenshot of a recent OpenVPN installed on a Windows 10 host. ote the Path to executable, which is set to:
C:\Program Piles\OpenVP bin\openvpnserv.exe
he Vmware Tools service is clearly OT VULNERABLE to the issue, as the executable path is properly delimited u ing quotes. The Open VP ervice, however, raises some questions ... Can you think of what could go wrong?

© 2017 Erik Van Buggenhout & Stephen Sims

37

Unquoted Paths with Spaces (2)

If the service path contains spaces and is not surrounded by quotation marks, then Windows has to guess where to find the service executable... Spaces on tl1e CMD could either be part of the file path OR they could indicate command-line arguments!

O~n PN lntu,ct,v~ ~ e Pr4p,eroe Clool Computtt)

OPTION 1 File Pa.th: C:\Program Aryument.s: Files\OpeaVPN\bia\openvpnserv.exe

OPTIO 2 File Path: ;\Program Files\OpenVPN\bin\openvpnserv.exe Arguments: < ONE>

1fthey can wrile lo "C: \"Aduers(lries could Irick the Windows service wntmller to run C: \Prugrum.exe (with elevated privileges) instead ofopenvpnserv.e.xe

wmic service get name,displayname,pathname,startmode lfindstr /i "Auto" I findstr /i /v "C:\Windows\\'' I findstr /i Iv """

SANS

.

. -·

Unq uoted Paths with Spaces (2) If the service path contains spaces and is not surrounded by quotation marks. then Windows ha to guess where to find the service exe utable... paces on the CMD could ither be part ofthe file path OR they could indicate command-line arguments!
o, let's have a look at that OpenVP ervice ... Windows tries to tart this service "automatically" (so on boot) . But how does Windov try to start th service? It, of cour e, tries to load the 'e ecutable path". But. ho\: is it interpreted? rnven the space in the path name, there's an ambiguity bere:
OPTIO Logic: Windows considers the space at the end of the filename and assumes everything that follows are arguments passed to that executable. File Path: C:\Program Arguments: Files\OpenYP \bin\open pnserv.e e
OPTIO 2 Logic: The excepted logic, Windows considers the spa e as part of the file path and finds the correct executable. File Pnth · C:\Program Files\OpenVPN\bin\opcnvpn crv.exe Arguments: <NO E>
Windows fill fir t attempt option I. If the adver ary could thus write to "C:\", he could create a program called · Program.exe'' that would subsequently be executed with the privileges of the Open VPN Window service. In thi specific case, there is no privilege escalation as an unprivileged user cannot write to ''C: \" either.
An excellent command line to find these types of services on ou1· own machine is belov (originally posted by Danial Compton):
wmic ·ervice get name,disp!ayname,palhn 1me.stcir1motle 1/lndstr Ii "A11lv" Ifinds Ir Ii "C: \Windows lI" l}lnd 11· /i / v 11111'

38

© 2017 Erik Van Buggenhout & Stephen Sims

Unattended Install Files

<User Accounts>

<LocalAccoun.ts> <LocalAcconnt>

Base64 encoding

<Password>

<Value>UoVDN'fksIFJPQotTIQ==<(Value>

<PlainText>false</PlainText>

</Password>

<Description>Local Administrator</ Description>

<DispJayName> Administrator</DisplayName>

<Group> Administrators</G1·oup>

<Name>Administrator</Name>

</LocalAccount>

< /LocalAccounts>

</UserAccounts>

Unattended installs are ideal in larger organizations where it would be too timeconsuming to perform wide-scale deployments manually.
If Windows administrators fail to properly dean
up after this process. an XML file called
"Unattend.xml" is le~ on the local system. An example of such a file is included co the left!
Typical locations of unattend.xml files: · C:\Windows\Panther\ · C:\Windows\Panther\Unattend\ · C:\Windows\System32 · C:\Windows\Syscem32\sysprep\

SANS

Unattended Install Files Unattended installs are often used in enterprise organizations where it would be too time-consuming to perform wide- cale deployments manually. If Windows administrators fail to pToperly clean up after this
proces , an XML file called "Unattend.xml" is lefl on the local system. An example of such a file is
included to the left!
As you can see, it includes the password in a base64 encod d format, which means it can be very easily decoded. ow, where can you find these xml files? It depends.. . ome good candidates to check include:
C:\ Windows\ Panther\ C:\ Windows\ranther\ Unattend\ C:\ Windows\System32 C:\ Windows\SystemJ2\sysprep\
Keep an eye out on your environment and search for these files periodically . .. Upon discovery , they should be immediately deleted!

© 2017 Erik Van Buggenhout & Stephen Sims

39

Group Policy Preferences (GPP) (I)
GPP's were used to allow administrators to create domain policies with embedded credentials. These policies allowed administrators to for example change local accounts or embed credentials for the purposes of mapping drives.
While highly useful the storage mechanism used for such credentials is insecure: The GPP's are stored in XML files on the SYSVOL (Windows domain share accessib1e to all domain user ) and the password is stored encrypted with a known 32-byte AES key (it was published by Microsoft in an MSDN article)

SANS

Thll"p,tfffl"MC,.f tflQulla; lh~ :'."°-..!IIJoafe tlntNtC lll>h<h~ · ~
'"°' _ MIC'Ufl't) ml, lo ~ , ~ I )"OW _....1110fif'f\cf11, IC!mc-.c1.ont ~ ~ bt ..~ f~~ WcmwlO'I .-°'°'-" t P·1o~d. tk't,{f: bdc,,,,
-

Although this vulnerability was addressed by Microsoft in MS 14-025, existing GPP's with passwords were not removed (this has to be performed manually . ..·)

·. ·

-I

Group Policy Preferences (GPP) (I) GPP's were used to allow admi nistrators to create domain policies with embedded credentials. These policies allowed administrators to for example change local accow1ts or embed credentials for the purposes of mapping drives.
While highly useful. the storage mechanism used for such credentials is insecure: The GPP's are stored in ML files on the SYS VOL hare (Windows domain share accessibl to all domain user and the
password is stored encrypted with a known 32-byte AES key (it wa. publish d by Microsoft in an MSDN
article - https://msdn.micro oft:.com/en-us/library/cc422924.aspx).
!though this vulnerability was addressed by Microsoft in MS l4-025, exi ting apr·s with passwords were not removed (this has lo be performed manually ...)

40

© 2017 Erik Van Buggenhout & Stephen Sims

Group Policy Preferences (GPP} (2)

In order to find these passwords in your own environment, you could run the following from any domain-authenticated user session:
findstr /S cpassword %LOGONSERVER%\sysvol\*.xml

,.,. r~ .....IIC)f'\....·1.v .;oe.odtog...UU· r' 1 ~
· · A"~.p«i r·i&ut · (_3t>.51!-03> · EBl.6'- b-4c· OP3 · · .544'FC60?4D26}'",
Jt.., :r-l~~(Of.:~f:'"IASS-.SlE'S... 4d2· · 8llll'-· U9 [986A..1Dtr Nlfflll_..Admifil<str,,lOr' (bufft- fo ,.
· 02.~1.a 01:s.3-:oJ · .... ~ (P!tF.l.T.l~a · ·-s.El · 4~A7 87DA· ll....U2 l.., 33}'"' >
<f>t"ooafbtPt c t,on lJ· newtum..,.AOSAdmln · ~ me·- O-S,CHD~·-

~--" 7 · ch. f'\O'ild *>01.S-

<OH5WQf,j AU UtWl.2'CIJOCno.1DtrtTtik3Wd~--~ tw8sPSAJO(Mt:btdlJt3b~OUh106-a7,.J7n;tQfUQTCtnFS;tWAKal"wd4.lCO'"'

cn...n,, "'°9<"'··0 F~ - l'\4Vcrt:xv w-o · ttcU>tsAO._(I....

~v,ontya·-,:O_ AOMIN-1,MYN,Ml\111(1... AdMlobt.T·t.of'"

~ , . (b\lUt .. . n}"' ..,.P4t'.,.t··Jo1:s O>· l 7 /;,,

c;c,~,-

2.2.1.1.4 Password Encryp·
M fl IHI ... tc W. '4c :t"1- f · U O ~t fl · I I·
n t. ti a1 H t'CI ti It ,t H 4t "' H _. w. ··

The screenshot above shows the XML file when it would be opened using a normal text editor. Note the value for the "cpassword". On the left we can see the encryption key used by Microsoft. which is published in an MSDN article. Finally. on the right we see the GPP Metasploit module automatically extracting & decrypting the password .. .

. SAN~

Group Policy Preferences (GPP) (2) ln order to find these passwords in your own environment, you could run the follO\ ing from any domainauthenticated user ession:
fiI1d tr / cpa. sword %LOGO SERVER%\ ysvol\*.xrnl
This one-line command will search for the string "cpa s ord" in any .xml file under the domain controller's publicly accessible sysvol network share.
The screenshots on the slide provide some additional context:
· The first screenshol shows an identified XML file with a cpassword value v hen it would be opened using a nonnal text editor. ote the value for the "cpassw rd'';
· On the bottom left we can see the encryption key used by Microsoft which is publi hed in an MSDN article· Finally, on the bottom right we see the GPP Metasploil module automatically e tracting & decrypting the password ...
e t to Metasploit modules, several Po\ er hell scripts exist that will do the ame thing, which of course reduces the detection rate of uch tool .

© 2017 Erik Van Buggenhout & Stephen Sims

41

Introducing BeRoot.exe & PowerUp
So... How can we check our own environments for such vulnerabilities? One of the most effective ways of doing so is to leverage pentester tools for that! Some examples:
BeRoot i a post exploitation tool to check common Windows misconfigurations to find a way to escalate our privilege;

PowerUp (now part of Empire) is a pure-PowerShell script that will use the techniques mentioned above (and much more) to try to escalate privileges!

(' ,\!\1~
l' ~L'fi)

-

-

. . .., '

-·

- - :' · . .

.

.

Introducing BcRoot.exe & PowerUp In order to better protect o urselves again t these typical privilege escalation attacks, it's a good idea to u e tooling that allows u to easily assess how ulnerable \ e are, owe can fix any identified vulnerabilities. Two tools are very ea to run and use.:.
· BeRootis a post-e ·ploitation tool to heck common Windows misconfiguration . It an be downloaded as a tand-alone binary. Upon running, it will attempt any privilege escalation techniques and will return a re ult.
· PowerUp is a pure-Power hell cript that \ ill use the techniques mentioned above and much more) to try to escalate privileges. PowerUp u ed to be a stand-alone PowerShell script, but it's now been included in the Empire Power hell post-e ploitation framework.

42

© 2017 Erik Van Buggenhout & Stephen Sims

User Account Control (UAC)

User Account Control (UAC) allows for the eparation of adrnin and non-admin func ti o n ality :

0
A dm in user
0
Regular user

Defnult user token
Explorer. e x e

Explorer.exe

. $J\NS .

Use r Account ontrol (UA )
Microsoft has continued to impro e the security in each version of Windows and as a result. ha e reduced the operating s t m' attack ·urface. ne of the mo, t c mmon and, idespread curity hole has b en the granting ofadmini trator pri ilege , to Olherwi ·e standard us~r · often to resolve application and configuration issues. User Acco unt Control AC) is a ecurity component that enable users to perform common tasks as non-admini trators or as administrators without ha ing to witch u ers, Jog ort: or u Run . . ser ace unts that ure members of the local dministrators group run m st applic:nion as a standard user. By eparating u er and admini trator functions, AC helps u ers mo e toward u ·ing standard user rights by default. 'o, ifa user is logged on a, a local admini trator, then A disables a u er'. administrator rights and prompts Lhc u er when their administrator right · are required. Ifa user logs on as a tnndard user they are asked to provide the credentials ofan administrator account if the_ attempt to perfonn any ta k that requires admini trntor rights. Ultimatel the user ha ontrol o er \\hen to use admini trator privileges as A doe. not have the ability to be controlled via centralized policy.

B. default, standard u ers and admini rmt r access r ·ources and run app in the ·ccl.U"ity c ntext or

s1.andard users. hen au er log on to a computer. the tern creates an accc s token for 1h01 user. he

acce token contain informal ion about the level of acce that the u ·er is granted, including ·pecific

securit. identifiers ( IDs) and Windows privileges. With 1!11;; built-in C clcvnti n component, sto.ndord

users can easil} perfo,m an administrative task by ent ring valid credential · for a local admini trator

account. The default , built-in

elevation component for ·tandard user is the credential prompt.

When an administrat r logs on. two separa te access tokens are ·reated for the user: a standard user access token and an administrator acccs token . he tandard u er acces token contain. the ame user-specific information as the admini trat r a cess token, but the administrauve indows pri ileges and IDs are removed. The standard user accc s token i, used to tart apps tha1 do not perform administrati e task (standard user apps). The tandard user access token i · then used tu display the desktop (explorer.exe). Exp) rer.e · i the parent proce from whi ·hall other II er-initiated processe inherit their a ce token.
s a result, all app run as a standard user unless a u. er pm ides con ent or rcdentials t appro e an app to use a full administrati e acce token.

© 2017 Erik Van Buggenhout & Stephen Sims

43

UAC Levels
Unlike Windows Vista, where you bad only two options: UAC turned on or off, in Windows 7, 8, and 10 there are four levels to choose from:

High Medium

Always notify - the user is notified before changes that require administrative permissions are performed.
Only notify when programs/apps try to make changes to the computer, but not when the user makes changes.
Similar to the medium level, but the screen is not dimmed and programs can interfere with the UAC prompt.

Never notify The UAC prompt will never notify when an app is trying to install or make changes.

SANS

. .

'

I

AC Level nlike Windows Vista, where you had only two options: UAC turned On or Off, in Window · 7, 8, and 10 there are four level to choose from. The differenc s between th mare the following:
· High: Alway notify - at this level you are notified before applications and users make changes that require admin istrative permissions. When a UAC prompt shows up, the desktop i dimmed as shown in the screen.shot below. You mu l choose Yes or No before you can do anything else 011 the computer. Security Impact: this is the most secure setting and the most intruding as well.
· Medium: oti fy me only when program apps try to make changes to my computer - this is the default level and UAC notifies you only before programs mak change that require administrative pem1issions. Ifyou manually make changes to Windows, then a UA prompt is not shown. This level is less intruding as it doesn't stop the u er from making changes to the system, it only shows prompts if an application want to make change . When a UAC prompt is shown, the de ktop is dimmed and you must choose Yes or Nob fore ou can do anything el eon you r computer. Security Impact: this is less secure than the first sening because malicious programs can b created to simu late the key trokes r mouse movements made by a user and change Windows settings.
· Low : otify me only whe11 programs/apps lry to make changes to my l.:l>mputer (do not dim my desktop) - tins level is identical to the one above except the fa t that, when a UA prompt is shown, the desktop i, not dimmed and other programs are able to interfere with it. Security Impact: lhis level is even Jes secure a it make it eas for malicious programs lo imulate keystrokes or mou 'e mov s that interfere with the UAC prompt.
· Never notify: Al this level. UAC L turned off and it doesn't offer any protection against unauthorized system changes. ecurity Impact: if you don't have a good security soluti n you are very like! Lo encounter securi ty issue with your PC. With UAC turned off it is much easier for malicious programs to infect your ompuler and take control.

44

© 2017 Erik Van Buggenhout & Stephen Sims

UAC Group Policy Settings (I)
The following UAC settings can be configured through Group Policies. The default setting is highlighted with a blue border on subsequent slides.

·
. SANS

"Allow UIAccess application to prompt for elevation without using the secure desktop"

Privileged operations will prompt the user.

Only the user of the interactive desktop can disable secure desktop.

-

1

UAC Group Policy Settinus (1) You can use security policies to configure how User Account ontrol works in our organization. They can be configured locally by using the Local Security Policy . nap-in (secpol.msc) or configured for the domain, OU, or pecific groups by Group Policy. In every slide, lhe default setting is marked with a blue border.
ser Account Control: Admin Approval Mode for the Built-in Admini trator account This policy setting controls the behavior of Adm in Approval Mode for the built-in Administrator account
Enabled - The built-in Administrator account use Adm in Approval Mode. By default, any operation that
requires elevation of privilege will prompt the user to approve the operation.
Di abled (Default) - The built-in Administrator account run all applications with full administrative
pri ilege.
Ad min Approval Mod (AAM) is a U configuration in ~ hich a split user access token is created for an administrator. When an administrator logs in, the user is as igned two eparate acce s tokens. Without AAM. an administrator account receives only one ace ss token. which grants that administrator access to all Windows resources. it i disabled by default it i recommended to enable this option.
U er Account Control: Allow UIAccess applicarion to prumpl for elevation without using the ecur~ desktop Thi policy setting controls whether User Interface A cessibility (UlAccess or UIA programs can automatically disable the secur desktop for elevation prompts used b a standard u r. Enabled - UIA programs including Window Remole A si tance, aulomatically disable the secure desktop for elevation prompts. ff you do not disabl the "User Account Contro l: witch to th secure desktop when prompting for elevation" polic setting, the prompts appear on the interactive user's desktop in read oftl1e secure de ktop. Di ablcd (Default) - fhe ecu re desktop can be disabled only by the u er of the interactive de,gktop or by disabling the "User A count Control: Switch to the secure de ktop when prompting for elevation" policy setting.

© 2017 Erik Van Buggenhout & Stephen Sims

45

UAC: About UIAccess
User Interlace Privilege Isolation (UIPI): · Prevent lower-privilege apps from sending messages to higher-
privilege apps. · Doesn't interfere with higher to lower and same privilege level
messages
In case an adrnin runs an app in Admin Approval Mode, the Microsoft UI Automation cannot drive the UI graphics unless UIPI is bypassed using UIAccess.

SANS

. .

I

LJAC: About UIAccess ser Interface Privil ge Isolation {UIPI) implements restrictions in the Windows subsystem that prevent
lower-privilege applications ti-om sending messages or installing hooks in higher-privilege proces es. Higher-privilege applications are permitted to send messages to lower-privilege proces es. UIPI does not interfere with or change the behavior of messages between applications at the same privilege (or integrity) le e l.
Microsoft UJ Automation is the cuITent model to support accessibil ity requirements in the Window· operating ystems. Applications that are designed to. upporl an accessible user experience control the behavior of other Windows applications on behalf of the u er. When all app lications n the automation client computer and server are running a a tandard u er (that is, at a medium integrity I vel), the UIPI restrictions do not interfere with the Microsoft Ul automat ion mod I.
However, there might be times when an administrative user runs an application with elevated privilege ba ed on UAC in Admin Appro al Mode. Microsoft UI Automation cannot dri e the Ul graphic of ele ated applications on the desktop without the ability to bypass the restrictions tha U[Pl implement . The abilit_ to bypa UIPI restrictions a ross privilege level is available for UI automation programs by using UIAcce s. Ifan application presents a UlAcces attribt1te when ii re4uests privileges the appl ication is slating a requirement lo bypass UJPI restrictions for sending messages acros privilege levels.

46

© 2017 Erik Van Buggenhout & Stephen Sims

UAC Group Policy Settings (2)

"Behavior of the elevation prompt for administrators in Ad.min Approval Mode''

Elevate without prompting. Prompt for credentials.

Prompt for credentials on the secure desktop.
Prompt for consent.

Prompt for consent on the secure desktop.
Prompt for consent for nonWindows binaries.

"Behavior of the elevation prompt for standard users"

Prompt for credentials.

Automatically deny elevation requests.

Prompt for credentials on the secure desktop.

~-t1\NS.~- -

-

'

- -- - - - - --

-

-

-

- · · ~-: ~. --~ -.· ~
-

AC Group PoLicy Settings (2) User Account Control: Behavior of the elevation prompt for administrators in Adm in Approval Mode This policy sett in~ controls the behavior of the e levation prompt for administrators. Elevate without prompting - Allows privileged accounts to perform an operation that requires elevation without requiring consent or credentials.
ote: Use this option onl in the mo t constrained environments. Prompt for credentials on the secure desktop - When an operation requires elevation of privilege. the u er is prompted on the secure desktop to enter a privileg d user name and pa sword. If the u er enters va]jd credentials, the operation continues with the user's highest available privilege. Prompt for consent on the secure desktop - When an op ration requires e levation of privilege. the user i prompted on the ecurc desktop to select either Permit or Deny. lfthe user elects Permit, the operation continues with the u ·er's highe t available privilege. Prompt for credentials - When an operation requires elc ation of privilege, the user i prompted to enter
an administrative u er name and password. ff rhe u er enters valid credentials, the operation continues
with the applicable privilege. Prompt for consent- When an operation requires elevation of privilege the U' er i prompted to select ei th r Permit or Deny. If the user selects Pem1it the operation continue with the u er s highest available privilege.
Prompt for consent for- non-Window binarie (Default) - When an operation fo r a non-M icrosoft
application requires elevation of privilege, the user is prompted on the secure desktop to select eitJ1er Permit or Deny . lfthc user select Permit the operation continue wich the user's highes1 available privilege.
User Account ontrnl: Behavior of the elevation prompt for standard users This policy setting controls the behavior ofthe elevation prompt for standard users. Prompt for credential (Default) - When an operation require elevation of privileg , the user i prompted to enter an administrative user name and password . Ifthe user enter valid credentials the operation continues with the applicable privilege.

© 2017 Erik Van Buggenhout & Stephen Sims

47

Automatically deny elevation requests When an operation requires elevation of privilege a configurable access denied error message is displayed. An enterprise that is running desktops as standard user may choose this setting to reduce help desk calls. Prompt for credentials on the secure desktop When an operation requires elevation of privilege, the u er is prompted on the secure desktop to enter a different u er name and password. If the user enters valid credentials, the operation continues with the applicable privilege.

48

© 2017 Erik Van Buggenhout & Stephen Sims

UAC Group Policy Settings (3)

· "Detect application installations and prompt for elevation"

Privileged operations will prompt

App installation packages are not

the user for admin creds.

detected and prompted for

elevation.

"Only elevate UIAccess applications that are installed in secure locations"

Apps in secure locations run with

UIAccess integrity.

-

1·~,\~~i\.' ·: - .c_- - --: -

-

-

--

I -~1- -tM -

~pps ~lways run with UIAccess integnty.

-
-

~

-

---.- --- · - . - --~:--;

'

-

- - ''

AC Group Policy Settings (3) User Account Con rol: Detect application installations and prompt for ele ation Thi· policy setting controls the behavior of application installation detection for the computer. Enabled (Default) - When an app installation package i detected that requires elevation of privilege, the user is prompted to enter an ad mini trative user name and pa sword. lf the user enters valid credentials, the operation continues with the applicable privilege. Di abled - App installation packages are not detected and prompted for elevation. Enterprises that are running
standard user desktops and us delegated installation technologies, such a. Group Policy or y tern Center
Configuration Manager should disable this policy setting. Jn this case. installer detection is unnecessary .
U er Account Control: Onlv ele ale executable files that are signed and validated This policy setting enforces public key infrastructure (PK!) signature checks for any interactive applications that request elevation of privilege. Enterprise administrators can control which applications are allowed to run b add mg certificates to the Trusted Publishers certificate store on local computers. Enabled - Enforces the certificate certification path validation for a given executable file before it is permitted to run. Disabled (Default) - Does not enforce the certificate certification path validation before a given executable fil 1s pennitted 10 run.
User Account Contro l: Only elevate U!Access application Lhat are install din secure locations This policy setting control whether applications that request lo run with a U er Interface Accessibility (UlAccess) integrity level mu t reside in a secure location in the file ysrem. ecure locations arc limilecl to Lhe following: _. .\Program Fil s\, including sub folders - ...\ Window \system32\ - . . .\Program Piles (x86)\, including ubfolder for 64-bit ver ions of Windows+
ote: Windows enforces a digital ignanire check on an interactive app that requests to run with a I cces integrity level regardless of the state ofthis securit setting.
Enabled (Default) - !fan app resides in a secure location in the file ystem, it runs only with UIAccess integrity . Disabled - n app runs with UlA ccess integrity even ifit does not reside in a ecure location in the fi le sy tem.

© 2017 Erik Van Buggenhout & Stephen Sims

49

UAC Group Policy Settings (4)

"Turn on Ad.min Approval Mode (AAM)''

-

Admin Approval Mode is enabled.

-

·

AAM and all related policy settings are disabled.

"Switch to the secure desktop when prompting for elevation"

ALL elevation requests go to the secure desktop.

-

·

Prompt settings for admins and other users are used.

"Virtualize file and registry write failures to per-user locations"

SANS

App write failures are redirected at

runtime.

-

·

Apps that write data to protected locations fail.

- . .- ._·

J

AC Croup Policy Settings (4) User Accow,t Control: Tum on Admin Approval Mode This policy setting control the behavior of all User Account Control (UAC) polil:y settings for the computer. If you cha1we this policy setting, you mu t restart your computer. Enabled (DefaulL) - Adm in Approval Mode is enabled. This policy must be nabled and related UAC policy settings must also be et appropriately to allow the built-in Administrator accounl and all other users who are memb r ofthe Administrators group to run in Adrnin Approval Mode. Disabled -Admin Approval Mode and all related UAC policy ettings are disabled. Note: If this policy setting is disabled, the Security Center notifies you that the overall security of the operating system bas been reduced.
U er Account ontrol: Switch to Lhe . ecure desktop when prompting for elevation
This policy setting control whether the elevation requesL prompt is displayed on the interactive user's desktop or the ecure desktop.
oabled (Default) - AH elevation requests go to the ecure desktop r-egardle s of prompt behavior policy
settings for admini trators and standard users.
Disabled - All elevation requests go to the interactive us r's desktop. Prompt behavi r p Ii y setti ngs for
administrators and standard users arc used.
irtualize file and registry write failures Lo per-user locations This policy setting controls whether application write failure are redirected to defined registry and file system location . Thi policy setting mitigates applications that run as administrator and write run-Lime application da1a lo %ProgramFiles%. ¾Windir¾, %Windi.r%\system32, or HKLM\Sofh are.+ Enabled (Default App write failures are redirected at run time to defined user location for both the file ·ystem and r gistry . Disabled Apps that write data to protected locations fail.

50

© 2017 Erik Van Buggenhout & Stephen Sims

UAC Bypass Techniques
Given the many different settings available to fine-tune UAC settings in a Windows environment, vulnerabilities are bound to arise! Several tools have implemented UAC bypass techniques:

· In Windows 7, sysprep.exe is vulnerable to a DLL search order hijacking vulnerability which is exploited by the Metasploit framework "bypassuac" module (for Windows 7)
· PowerSbell Empire uses several bypass UAC techniques. In hardened Windows 10 environments (without vulnerabilities) it will spawn a UAC window asking the user to t'Permit' a legitimately looking system component from obtaining admin credentials (success rate depends on the UAC settings)
An interesting tool that tries 30+ UAC bypass techniques can be found at https: //github.com/hfirefox/UACME

r-:sANl - - - -- ---- - -- - - - - - ----"-:- -_ 7:-.:-,~~-.- -.- -- · -.·~

--

-- .

-

-

lJAC Bypass Techniques Given the many different sening available to fine-tune A setting in a Windows environment. vulnerabilitie due to misconfiguration are hound to arise! everal tools have implemented UAC bypass l chniques:
· In Windows 7. sysprep.exe (used to configure a Windows installation upon install) is vulnerable to a DLL search order hijacking vulnerability, which i exploited by the Metasploit framework "bypas uac" module (for Window 7) Power hell Empire uses several bypass UAC techniques_In hardened Windows 10 environments (without vulnerabi lities) it will spawn a AC window asking the user to "Permit'"a legitimate] looking system component from obtaining admin credentials success rate depends on Lhe UAC seniogs)
· An interesting tool that tries 30+ AC bypas techniques can be found at https://github.com/hfireffix/U CME
We will attempt to u. e these tool in an upcoming exercise!

© 2017 Erik Van Buggenhout & Stephen Sims

51

Least Privilege & UAC -Additional References

Some additional resources concerning least privilege & UAC:
Some AD least privilege best practices httl)s://docs.rnicrosoft.com/en-us/windows-s rver/identi.ty/ad-d /plan/secwity-bestpractices/implementing-1east-privilege-administrative-models

· How UAC wmks https:/ /docs.rnicrosoft.com/en-us/windows/access-protection/user-accounl-contro]/howuser-accoun t-control-wmks

Information on impl m nting the previously ti ted UAC Group Policy settings https://docs.micro oft.com/en-us/windows/access-protection/user-account-control/useraccount-control -g:roup-policy-and-registry-key-settings

SANS

UAC bypas tool htt!)s: //~thub.com/hfirefox/UACME

· -·

. .·

Least PriviJege & UAC- Additional References Some additional resources concerning least privileg & UA
· Some AD least privi lege best practices https://docs.microsoft.com/en-us/windows-server/identiry/ad-ds/plan/ ecurity-be ·tpractices/implementing-least-privilege-administrative-models
· llow UAC works https://docs.micro oft.com/en-us/windows/access-protection/user·account-control/how-user-accountcontrol-works
· Information on implementing the previously listed UAC Group Policy setting, https://docs.microsoft. com/en-us/windows/access-protection/user-account-cont ro1/user-accoun!contTo1-group-pol icy-and-registry-key-settings

52

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
Day 1: Knowing the adversary, knowing yourself Day 2: Averting Payload Delivery Day 3: Preventing Exploitation Day 4: Avoiding Installation. foiling Command & Control & thwarting lateral movement Day 5: Exfiltration, Cyber Deception & Incident Response Day 6: APT Defender Capstone

SEC599.4
Avoiding Installation Typical Persistence Strategies Exercise: Catching Persistence Principle of Least Privilege & User Access Control
· Exercise: Local Windows Privilege Escalation Techniques Foiling Command & Cont:rol Network Monlwrlng Considerations (Nedlow, IDS, .. .) Detecting Command & Comrol Channels Exercise: Suricata to Detect NetWork Anomalies Thwarting lateral movement Introducing Common Lateral Movement Strategies Active Direcrory Architecture & Attacks Active Directary Hardening & Segmentation Exercise: Hardening Windows to Stop Lateral Movement Detecting L3teral Movement Using Windows Event Logs Exercise: Configuring & Forwarding Windows Event Logs

.. SA-NS- .

~

-

· . · · ·· · · ··.

.

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

53

Exercise - Local Windows Privilege Escalation Techniques
IThe objective of the lab is to audit our own Windows environment for privilege escalation vulnerabilities using different offensive tools. We will then harden our environment, after which we will again test the effectiveness of our tools.
High-level exercise steps: 1. Test our Windows environment for local privilege escalation flaws using
beroot.exe & PowerUp. 2. Optional: exploit identified issues to become local administrator 3. Fix identified vulnerabilities 4. Retest our Windows environment
Exercise - Local Windows PriviJege E calation Techniques The objective of the lab is to audit our own Windows environment for privilege escalation vulnerabilities using different offensive tools. We will then harden our environment, after which we will again test the effectivene s of our 1ool .
The high-level step of this exerci e include: l. Test our Windows environment for local privilege escalation flaws using beroot.exe & PowerUp. 2. Optional: exploit ident ified issues to become local admini trator 3. Fix identified vulnerabilities 4. Retest our Windo" s environment
For additional guidance & details on the lab, please refer to the LOO workbook.

54

© 2017 Erik Van Buggenhout & Stephen Sims

Exercise - Local Windows Privilege Escalation Techniques - Conclusions

During this exercise we used two tools to ' audit" our Windows environment for privilege escalation vulnerabilities.
Note that the vulnerabilities identified are often "configuration" mistakes that cannot just be fixed by applying a patch. Following this idea we manually applied fixes to secure our environment.

It's a good idea to periodically analyze your environment for such techniques. These tools could perfectly be deployed in a similar fashion to Autoruns, where you could make them part of a scheduled task that is executed upon system start (using, for example, GPO's).

.. .~A-.N· S .
'

-

-

. '-- ' - .

I

-

--

-

Exerci e - Local Windows Privilege Escalation Techniques - ooclusion During this exercise, we u ed two tools to "audit' our Windows environment for privilege escalation vulnerabilities. ote that the vulnerabilities identified are often "configuration' mi takes that cannot just be fixed by applying a patch. Following this idea, we manually appli d fixes to secure our environment.
It' s a good idea t periodically analyze your environm n'l for such techniques. These tools could perfectly be deployed in a similar fashion to Autoruns. where you ould make them part ofa · heduled task that is executed upon system start (using for example, GPO' ).

© 2017 Erik Van Buggenhout & Stephen Sims

55

Course Roadmap
Day 1: Knowing the adver ary, knowing yourself Day 2: Averting Payload Delivety Day 3: Preventing Exploitation Day 4: Avoiding Installation, foiling Command & Control & thwarting lateral n1ovement Day 5: Exfiltration, Cyber Deception & Incident Re.spouse Day 6: APT Defender Capstone

SEC599.4
Avoiding lnrtaJJatioo Typical Persistence Strategies Exercise: Catching Persistence Principle of Least Privilege & User Access Control Exercise; Local Windows Privilege Escalation Techniques
· Foiling Command & Control Ncty,ork Monitoring Considerations (Neulow, IDS, ,. .) Detecting Command & Control Channels Exercise: Suricata to Detect Necwork Anomalies Thwarting lateral movement Introducing Common Lateral Movement Strategies Active Directory Architecture & Attacks Active Directory Hardening & Segmentation Exercise: Hardening Windows to Stop Lateral Movement Detecting Lateral Movement Using Windows Event Logs Exercise: Configurin.g & Forwarding Windows Event Logs

This page intentionally left blank.

56

© 2017 Erik Van Buggenhout & Stephen Sims

Where Are We in the APT Attack Cycle? - Command & Control
In section 3 of this course, we discussed how exploitation can take place in the Attack Cycle. We will now start analyzing the command & control phase of the APT attack cycle:
Command & Control

. sr- ~.-m'~--J'-d(' .

-

I

-

- -- -

-

- . . -. .. -
-

-.-' . . - .1

Where Are We in the APT Attack Cycle? - Command & Control Programming malware to perfonn all rnaliciou actions automatically and autonomously can be quite challenging for adversaries, especially when they have incomplete information about their targets. Often the adversaries will want the malware to have capabilities to be controlled remotely so that th y can instruct the ma!ware with the appropriate actions to take. Adversaries attempt to keep thi control by the use of a Command & Control infrastructure and channel.
Adversary perspective During weaponization, adversaries will already decide on the communication channel to be used, as it will be built into the malicious payload . In order to avoid detection and to increase the chances of the outbound connectivity b ing allowed, adversaries will select a commonly used protocol such ru HTTP(S), D S, email or even social media. Cases have also been identified where custom TCP protocoL were developed. The endpoint of communication channels are called Command & Control servers; these are servers under the control of the adversarie , but not necessarily owned by the adversaries. In rargeted attacks, adversaries might first compromise other ystems and use these as Command & ontrol servers.
varying degree of stealth can be built into these C&C channels, for example masquerading the communication as an HTTP onnection wirh a music streaming servict:. A110Lher example we' e seen is the use ofsteganography in pictures. This doe.sn't nece sarily imply that the communication is complex. For ransom·, ar , fore ample, the C& infrastructure is often only used to report back the encryption keys .
Defender per ·peclive Communication between the malware on target systems and adversaries is a good opportunity for us to stop the attack, provided we detect and block it almost instantaneou !y. We can limit network communications from our nerwork to the Internet via control points like proxies and firewall. In an open n twork where internal clients have full access to the Internet via a AT gateway, controlling, filtering and monitoring i e ·ponenrially harder than in a network where all communications go through filtering devices. Of course, an open network can be a business requirement and something you have to live with.

© 2017 Erik Van Buggenhout & Stephen Sims

57

Proxies not only allow u to block and tilter traffic, but it also gives us the opportunity to log and inspect the traffic for patterns or anomalies (e.g. beaconing behavior). Beaconing behavior is when malware periodically attempts to connect back to its Command & Control server. lfthi s is done using a ti ed time interval it could fonn a pattern we can attempt to detect.

58

© 2017 Erik Van Buggenhout & Stephen Sims

Networlc Monitoring Considerations
Before we start zooming in on the specifics of Command & Control channels, we want to spend a bit of time to discuss network monitoring!
· Should we monitor onl etFlow or full packet capture? · At what point of the network hould we perform monitoring? · How do we handle SSL/TLS? · How long should e retain tFlo, / full pack t capture ?
Even if we di cus this topic while addre ing Command & Control network monitoring can h Ip you detect e eral tages ofth APT Attack Cycl !
SANS
eh ork Monitoring Considerntions
or Before we tart zooming in on the pecifi s or Command & ontrol hannel. · \ e want to pend a bit
Lim 10 di us n tw rk monitoring... When ad anced ad ersaries alta k our infrastructure, Lhe. \ ill be for ed to use our network. E en if they lia e ph sica1 access to one machine, th ) will ne d to use the network to move laterally. hal is\ hy in our network architecture design, we 1pply segmentation so that we ha e chokepoint where c can monitor network traffic.
o, I t's agree we need to monit r network traffic. But, how? hould e do full packet capture or h uld
\ ejust r cu on ctf-' low? Furthennore, hnw do we handle L / L en rypled protocols? Because we
are bound to mi · some anacki., it i a go d iden to keep ome kind of"hislory" or netw rk traffic. o that
thi hi. t ry can b consult d po t-facto.
But even ifwe would monitor all network traffic, we would still mi s detecting some attacks. ror
example, because the e attacks ''hide in plain sight", by u ·ing e. i ting network traffic and injecting their own mes ·age . er difficuh technique to detect for e,ample is stcganograph_ : ·tegan graph} conceal · message.:· inside other me age.. The typi al e ample of tegan gmph_ i an · ·i. ting picture , here some bit arl.' altered to encode the hidden messag, . The e altered bits don t chang the overall aspect ofLhc picture. l'he ame principle can be applied I nel\- ork traffic, fur e a111ple b adding white!!pacc characlers to rhe headers of an lJ P requc t.
Even it· wc discu s this topic I hil addressing ommand & ConLrol, it"s irnporbmt to note that neh ork monitoring can be high I useful t detect cveral other stages of the /\PT Attack Cycle as w II!

e 2017 Erik Van Buggenhout & Stephen Sims

59

Introducing Netflow
NetFlow is a technology introduced by Cisco, which is used to collect metadata on traffic handled by its network devices. It is only recently being used in network security monitoring strategies. ..
All Cisco network devices that support NetFlow can collect information on their interfaces and forward this information for collection.
NetF1ow does not capture the content/ payload of packets.
Other network vendors offer similar features, but under other names. As an e,xample, the open-source Suricata IDS can generate Flow" information based on the real-time network traffic that it sniffs.
Introducing NetFlow NetPJow is a technology by Cisco introduced on their network devices to collect metadata from network traffic that flows through these de ices. The keyword here is metadata; thi m ans that the traffic itself is not captured , but properties of the traffic.
Take for example a TCP connection. NetFlow will not capture the content of the TCP connection, but it will log properties of the TCP connection (metadata) like these : · Date and time of the connection · Source IP addres
ource port · Destination IP address · Destination port · Number of packets transmitted and received
umber of bytes transmitted and received
This aggregated information is collected by network devices on the interfaces that are configured to generate etFlo\: data and then forwarded.
Other network vendor offer imilar features but under other names. J\ s an example, the open ource
Suricata ro can generate "Flow' infom1ation based on the real-time network traffic that it sniffs.

60

© 2017 Erik Van Buggenhout & Stephen Sims

How to Generate & Collect Netflow?

- Flow
exporters
-

;'- .

-
Flow collecror

Analysis application

How 10 Generate & Collect etFlow? In this network diagram, , e illustrate how etFlow data i generated and collected.
Differem network device in our corporate network ( wit hes, routers, .. .) are configured to generate NetFlow data. These isco devices need Lo ·upporl the generation of etFlow data (this d pends on lhe 10 ver·ion and feature ·), and the interfaces from which , e \ ant ctFlO\ data need to be configured to
generate this data. n,e e de ices are called now exporter .
This data, generated by many device in our corporate nel\ ork, i then fon arded to one or more 11m collect r ·. A flow collector i · a network device or ompuler with enough persi tent storage to keep the
elFlo" data of man exporter for long period of time (month ).
When necessary, analyst can use an analysi application to retrieve and analyze the NetFlow data. Originally etFlow wa implemented to provide stati tic to network administTator to help 1hem \ ith managing and adapting their n t,\ork infrastru turc with lhe growing ne ds of their nterpri e.
But th is data can al o be used af er an attack was detected. Fore ample, when a compromised computer is detected several month after the attack I' ok place, ct Flo\ data con be 1.:011 ·ultcd to have a list of all connections that this computer initiated to other computers. Depending on the configuration o . our
etFI \\ infrastructure, etFlov. data \ ill be a ailable fi r all computers. or onl for computers in another segment of the network (d pending on the place where NctFlow data is exponc.:d .

© 2017 Erik Van Buggenhout & Stephen Sims

61

Introducing Full Packet Capture (FPC)
Full Packet Capture is the concept of sniffing and storing all network traffic using for example a network tap. As opposed to NetFlow, Full Packet Capture will capture the full packet payload / content.
· Large enterprise networks generate A LOT of traffic, so storage could be an issue! · But really, how expensive are disks these days?
· For proper packet inspection, consider using an SSL interception solution! · The advantages of FPC over NetFlow could be limited if there s a lot of encrypted
protocols ... · Some critical government institutions will collect & store full packet captures for a
large period of time (e.g. 1 to 2 years). This will allow them to retroactively hunt their logs/ packet captures for attack campaigns that are identified in the future!

Introducing Full Packet Capture (FPC) Where etflow (and similar technologies) will capture metadata, full packet capture will capture and store the complele conlent of network packets. This means that for a TCP connection, we not only ha e all the metadata like Net low wou ld provide but also the content of the TCP transmission itself: all the data that was trau mitted and received by the computer.
Full packet capture wi ll generate a lot ofdata, Gigabyte to Terabytes of data per day, depending on tbe network. This is why it is not pos ible to perform full packet capture on all computers. When full packet capture is implemented, it is typical ly done b tapping the network connections at key points in the corporate network infrastructure. The e ke points are fore ample the chokepoints where traffic fl ws between network segments. A good tarting point for full packet capture is al the perimeter: capture all traffic between the corporate network and the Internet.
Not only does full packet capture help analysts to investigate allacks post-facto, but it also allows for the detection of attacks post-facto. This i done by processing all captured data of a given period (fore ample the last month) with an ID like Snort or Su.ricata. The IDS needs to be provided with the detection rules and lOCs of the latest attack methods o that it can detect attacks that happened in the past and were not detected.
A good example is the Hea1tbleed vulnerability: this i a vulnerability in OpenSSL that allowed an ad rsary to obtain private data from S LfTLS webservers. Th is private data could contain the encryption keys. fore ample. After Heartbleed was discovered and disclosed, several IDS rules were created to detect l Cartbleed attacks. By earching all captured network traffic for evidence of an Heartbleed attack, a corp ration could determine (post-facto) if it had be n attacked and if data was leaked.
Ithough ful I pack t capture produces a huge amount of data, it must be taken into account tha! large capacity magnetic harddisk have become ch ap.

62

© 2017 Erik Van Buggenhout & Stephen Sims

Where Should Networlc Monitoring Be Performed?

l ·· I
·

·l·· I. . .

SANS

Segregated inner networks

Wl1crc ' hould ctwork Monitori ng Be Performed '! To perfonn full pac.:ket capture, one ha to decide where 10 capture packets in ide the network.
This will depend upon the t p · of attacks to b delected, and be influenced by the network architecture.
e recommend 1artjng at the perimeter a!' a ptiority: 1he border between the orporate network and the Internet. d ersarie ha e many different tti ks up their lee es, but in a lot ofcase · the will need to enter and lea e the neh ork (e.g. el up &C channels or exliltrale data).
· In later stage , you can expand your cope lo al o include the bordl:lrs of internal network zones. This could be useful to detect lateral movement inside the environment!
A rout r is a good point to star! capturing tranic. Although routers like isco routers have I ~ commands to pcrfonn packet capture on lhc router it elf, router don't have enough per i tent storage to keep trafli for more than a ouple of minute (this feature is often u cd for troubleshooting, not for long-term packet capture). Bm router \ ith decent manag~ment features can be conhgured to duplicate networl. traffic tJtat
or flow through one its interface to another interface : thi i called a network tap. This network tap
interface can then be connected to a device that will perfom1 the full packel caplw·c. This can be a computer with en ugh persistent 'lorage (mechanical harddisks) to ·tore the captured traffic as pcap files
for evcral month .
Lt i po sible to aggregate then twork traffic of ·cvernl interfaces to one tap interface, but attention mu. l be paid not to ex eed the band idth of the neh ork tap interface. Fore ·ample, if al I interface · on a router can manage IO Gigabit and'.! im rfaces that we want 10 aggregate proce 6 igabit oftraffi , then the resulting traffic wil I be 12 Gigabit which c ceds the capacity of the 'tap interfo e.
Just apturing and stoting nch\iork traffic i· not a CP intensi e tasl: the machine that store 1he full pacl.c1 capture doc not ha e l be a high-end ma him:.

(Cl 2017 Erik Van Buggenhout & Stephen Sims

63

How Do We Handle SSL /TLS?
Con ider an internal system that is infected by a backdoor that uses HTIPS to set up a C&C:
· If we perform full packet captui-e without SSL interception, our monitoring is limited: We can only detect the hostname when the tunnel is set up (CONNECT).
· While this would work for known malicious domain names, we cannot properly inspect payloads!

t
SANS

Outgoing Infra

C

,

:

'

'.

How Do We Handle SSL/ TLS? When a proxy has toe tablish a TLS connection for a client that starts an HTTP conversation, a normal proxy will create a tunnel. A TLS connection is encrypted end-to-end, and the encryption key are only known by the end-points.
The proxy is not capable to decrypt the traffic. To initiate a tunnel for {he use ofTLS, the client (the workstation for example) makes a connection to the proxy and issues a CO ECT command. Here i an example for the Google website:
CON ECT www.google.com
When the proxy receives this command, it creates a tunnel; the TLS traffic it recerves from rhe client is forwarded to the Google website, and the TLS traffic from Google is forwarded to the client. The proxy operate in a transparent mode for this connection : this allow both end-points (the workstation and Google' webserver) to perform the TLS handshake and start an encrypted conversation.
The only action that the proxy can undertake (besides flat-out dropping all TL conne tions), is categorizing the website based on its domain, and block iL ifit falls in a blocked category. The proxy can categorize the domain (but not the URL) because the domain is communicated in cleartext with the CO ECT command. The complete URL. however, is encrypted in the TL channel.

64

© 2017 Erik Van Buggenhout & Stephen Sims

How Do We Handle SSL /TLS? - Interception
During SSL interception one of the systems between the Internet and the internal systems will "break" the connection. Instead of allowing the internal system to create a tunnel to the Internet system, the interceptor will set up two tunnels: A tunnel between the Internet and itself and a tunnel between the internal workstation and itself.
· SSL interception is typically performed by web proxies (whlch will of course require the root CA to be accepted by the clients that are being intercepted)

t

···l·· I
l·· I

11

Outgoing Infra

. SANS

.

-_

How Do We l:landle SSL/ TLS? - Interception Because encrypted HTTP traffic becomes the norm on the Internet, network devices that perform deep inspection of network traffic are becoming " blind". A solution to this problem is TL interception.
· proxy that supports TLS interception works as follows :
· When the client tarts a TL connection, the TLS intercepting proxy does not forward the TL connection to the web server, but it establishes a TL connection with the client (TLS I).
~ The client accepts this TL connection from the proxy because the proxy uses a certificate (with
matching private key) that is tru ted by the client This can be done by using a certificate generated by a corporate PKI that has it root certificate installed on all corporate machines.
ext, the proxy will establish its own TL connection with the web server (TL 2). · One set of keys is used to encrypt TLS connection I, and another set i used to encrypt TL
connection 2. · Since lhe proxy is now an endpoint for both TL connections, it can decrypt the traffic from both
sides. · The proxy decrypts the traffic from one channel and sends it encrypted in the other channel.
This allows the proxy to inspect the "encrypted" traffic, and it can also create a network tap for use by other network devices.

© 2017 Erik Van Buggenhout & Stephen Sims

65

What Kind of Technology Is Available?

Many commercial & open-source tools exist that that can meet a variety of our needs:

· SSL / TLS interception · Full packet capture · IOS alerting · Protocol anomaly detection

Some commercial examples include the typical firewall vendors: PaloAlto, Juniper, Cisco, Fortinet, Sophos, ... Open-source alternatives for network monitoring include Snort, Suricata, Bro, ... They can typically be configured in IDS (passive) or IPS mode (inline).
IFor both commercial & open.source tools, the architecture & configuration of the device will be essential. If they are not correctly positioned in the network they will not fulfill their full potential.

\ \,,'A.rt,\~;\·,

· ·. . ,

I

,

· _~ ·

-, I
· I

What JGnd of Technology Is Available? Many commercial & open-source tools exist tha! thm can meet a variety of our needs .. . We are typically looking for the follm ing rypes of functions:
· S L / TLS interception · Full packet capture · ID alerting · Protocol anomaly detection

Some commercial examples include the typical firewall vendors: PaloAlto, Juniper, Cisco, Fortinet,
opho , ... Open-source alternatives for network monitoring include Snort, uricata, Bro, ..· They can typically be configured in ID (pa sive) or IP mode (inline).
In inline mode, the ID / IP has at least 2 network interfaces: one network interface is connected to the corporate network and the second neh ark interface is connected to the Internet. This way, the network traffic flow through the IDS/ IPS device and is available for inspection , while the JP can block traffic for which alerts are generated. The disadvantage ofinline mode is <1vailabiliry; when the IDS/ JPS device goes down, network traffic no longer flows through the de ice and rhe corporate network i severed from the Internet.
Passive mode does not have thi inconvenience. In passive mode, the ID /IP device will receive netv ork
traffic on one interface via a network tap Gust like full packet capture). lfthe device goes down, the
network flow i not impacted. The IP can no longer block the traffic in passive mode, but there is a solution for thi s problem: the IPS device can send an instruction to the network device with the nehvork tap to block the traffic detected by tbe IPS.
For both commercial & open-source tool , the architectur & configuration ofth device will be essential. lfthey are no correct! positioned in the network they will not fulfill their foll potential.

66

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
Day 1: Knowing the adversary, knowing yourself Day 2: Averting Payload Delivery Day 3: Preventing Exploitation Day 4: Avoiding Installation. foiling Command & Control & thwarting latera1 movement Day 5: Exfiltration, Cyber Deception & Incident Response Day 6: APT Defender Capstone
··s~s · -

SEC599.4

Avoiding Installation

Typical Persistence Strategies

Exercise: Catching Persistence

Principle of Least Privilege & User Access Control

Exercise: Local Windows Privilege Escalation Techniques

Foiling Command & Control

Network Monitoring Considerations (NetOow, IDS·. ..)

·

Detecting Command & Control Channels Exercise: Suricata to Detect Network Anomalies

Thwarting lateral movement

Introducing Common Lateral Movement Strategies

Active Directory Architecture & Attacks

Active Directory Hardening & Segmentation

Exercise: Hardening Windows to Stop Lateral Movement

Detecting Lateral Movement Using Windows Event Lo~

Exercise: Configuring & Forwarding Windows Event Logs

·

-

·

· _-

Thi page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

67

Command & Control Channels - Topology

t

Typical scenario

· A machine on the corporate network is

compromised: malware authored by our

adversaries is running on said machine.

· This machine has acce s to the Internet,

but it has to traverse proxies and firewalls

(which gives us a contra]/ inspection

point).

· The command & control server, operated

by the adversaries, is located on the

Internet.

1\V' 1\t\,'lS

- · , -_ .· _, .· _ j,

Command & Control Channel - Topology ihe typical topology of a command and control channel inside a corporate network i· U1e following:
machine on the corporate network is compromised: malware authored by our adversaries is running on said machine.
hi s machine has access to the Internet. · The network connection to the Internet has to Lrnver e pro ie and firewalls. · The command & control erver, operated by tbe adversaries, is located on the fntemet.
Withou1 corp rate proxy and firewalls the compromised machine would have unrestricted acce s to the Internet, and our adver aries would be able to use any network protocol as command & control channel.
With corporate proxy and firewalls, however, Internet access is restricted and our adversaries have to use network protocols that are allowed. Typically all UDP connections are blocked (blocking D ) and TCP is only allowed over certain ports, like FTP, HTTP, and HITPS.
If the pro · /firewalls in pect the type of ne~ ork protocol that is u ed Lhrough the allowed port , then our adversaries are further restricte-d in the protocols they can wse. For example, SH over port 80 would be blocked.
Pro ie categorize RLs in categ ries, and network admini trator u e these categories to block certain web sites. Typically, categories like adult content are blocked, and categories like banking are allow d. Depending on the network policies, uncategorized website are blocked r allowed. By blocking uncategorized websites we further restrict the number of command & control channels Umt our adversaries can use because they often use machines without domain names and that are thus uncategorized .

68

© 2017 Erik Van Buggenhout & Stephen Sims

Introducing Command & Control Channels

Once adversaries have obtained access to a target environment, they want
to USE this access to attain their objectives. This could include compromising additional horu, stealing sensitive data,... In order to
achieve these objectives, adversaries need a Command & Control channel!

Many different C&C channels exist, each with their own detection / prevention challenges:

· D dicated C&C infra tructure · Compromi ed infra tructur
·

· Social media ervices · Cloud storag provid r

.~ANS

Introducing Commnnd & ontrol Channel Once adversaries have obtained ac es Lo a target environment the wam to I! thi ac ess Lo attain their objectives. l his could include compromi ing add1ti nal ho ts, tea ling sen iti e data. . .. In order to achie e the e objectives, adver ·arie ne d a ommand & ontrol channel!
For example, m::ilware can sp on computer b capturing keystroke , taking croenshots or screen recording , re ording audio from the buih-in microph ne ... lfthi malware would be implanted on all your corporate ma hine and automatically . nd all captured data lo th ad er arie , they would be overwhelmed with data and you would sec a pike in outgoing trallic.
\.Vhat (advanced) adver anes will do in 1hi · we is u the implanted mah,are to locate computers, ith intcre ting data and then activate the sp ing capabilitie of ·aid malware. Thi requires communication between the ma Iware and the adversarie. : thi, i done via o-ca!lcd command & control channels. On ne end, there i the compromi ed, corporate ma hine, and on the other end the ·ervcr under control of the ad ersat'): the command & control erver ( 2).
Many communications channel can be u ·ed as C2 channel. Mal ware author tarted to u e cu tom made, proprietary command and con1rol channels over TCP connections. hut later on, thi evol cd into using existing channel lik' D and HTTP. The rea on i lhat these cu ·tom channel would be more ea ii. detect d and bl eked in corporate net\.\ ork .

a:> 2017 Erik Van Buggenhout & Stephen Sims

69

Detecting Command & Control Channels

While in the past, exotic or custom protocols were often used, malware authors now prefer to use C2 channels that "blend into the noise":
· We are referring to the "noise" produced by network traffic of social media like Twitter Facebook, Instagram, even Dropbox, ...
· To be fair, a lot of modern web traffic genuinely looks malicious ©
· CDN networks are all generating obfuscated, long, HTTP queries that look strange... Thi i not helping us!

SANS

We will illustrate this issue by zooming in one some of the most interesting C&C channels used by adversaries!

-
-

.· 'r I '. · · r .. - : ·

1
·, I

-

.

Detecting Command & Control Channels To remain undetected when malware uses command & control channels, malware authors have started to adopt a strategy to ·'blend into the noi e". By this, we mean that mah arc authors will use existing channels with a high degre ofinteracti n: mes age::: that flow between clients and ervers with high frequency.
These type of channels can be found in o ial media applications. Social media produces messages at a high frequency, many corporate users use social media, also for busine s reasons (Linkedln for example) and most social media application have a public aspect. These factor explain wh malware authors start to use social media channel as command & control channel : they can "blend into the noise" .
Take for example malware that uses Twitter as a communication channel. The client (the malware) will have the credentials or a Twitter account and use this tor ad and write messages. These me ages will go to the witter ervers, like an ther Twitter communication. The command & control server has another et of credentials for a Twitter account. Both accounts follow each other, and can thus communicate with
each other, publicly or privately (via direct messages). If steganograph_ is used to encode a command in a eemingly innocuous witter message, it become very hard to uncover these channels.
Twitter is just one example. There are many social media applications that are veiy popular with your corporate users, like Fa ebook, Tnstagram, Pinterest, Google+. Dropbox, ... All these social media applications can be used as command and ontrol channel.
In the ne t slides, we will discu s some famous C&C channels that were used in real attacks !

70

© 2017 Erik Van Buggenhout & Stephen Sims

Famous Command & Control Channels - Turla Likes Britney Spears ©

ntrit?)-spears ·
'..114 0Ql!l1$ 1,,,.,....,_,... - · ~ &.tAMf'$0fftt !:I.ft"'- Cl4(tt Of Mf M If\ IIIWI

A variant ofTurla communicated by reading and writing comments on Britney Spears' lnstagram
account.
Example comment
''asmith2 I 55: #2hot make loved to her, uupss
#Hot#X''

· The malware would read comments posted for this picture and calculate a custom hash. If th custom
hash is 183, then the malwa.re knows the comment is a from the C&C server and that it must decode it. · The comment contains a hidden sp cial UNICODE character: \20od. This is a non-printable character
called "Zero Width Joiner". Like its name implies, it does not take up pace but it is present. · This character, together with a couple of other characters like# and@, are used as prefix to the encoded
URL: <2ood>#2hot ma<2ood>ke lovei<2ood>d to <2ood>her. <2ood>uupss <2ood>#Hot <2ood>#X

This gives us the following string: 2kdbuHX, or URL http://bit(.)ly/2kdhuHX!

· SANS . -

--

- '

-

-

·

- - _,

Famous Command & Control Ch.annels-Turla Like Britney Spears© There exists a variant of the Turla malware that uses lnstagram a a command & control channel.

ot via lnstagram accounts tJ1at w uld communicate directly with each other, but via Instagram accounts that would post comment on picture posted by a very popular lnstagram user: Britney pears.

To send a message lo the malware, the command and control channel would post a ljnk (for example to pastebin) shortened with a URL hortening service like bitly. This URL would not be posted directly to Britney Spears' p icture as a comment, but it would be encoded, ith stcganography in a seemjngly innocuous comment.

An example of such a comment would be: #2hot make loved to her. uupss #Hot # X

The malv are would read comments posted for this pictu re. and calculate a custom hash. If the custom hash is 183, thet1 the ma1ware knows the comment i a command from the command & control server and that it must decode it.
It cannot be een in the text of the comment, but the comment contains a special UNICODE character: \200d. This is a non-printable character called "Zero Width Joiner... Like its mum: implies. it does not take up space but it is present.
Thi character, together with a couple of other characters like II and @, are u ed as prefix lo the encoded URL.

TI1e malware extracts the URL from the mes age by taking the character that fo ll ws the prefix character. Here is the message with the special N!COD character mad visible (<200d>): <200d>#2hot ma<200d>.ke lo ei<200d>d to <2 00d>her, <200d>uupss <200d># Hot <200d>#X

This give us the fol lowing stTing: 2kdbuHX, or URL http://bil(.)ly/2kdhuH

https ://www.we Iivesecurity.com/2017/06/06/turlas-watering-hole-campaign-updated- Iirefox-extension-abusi ngi nstagram /

© 2017 Erik Van Buggenhout & Stephen Sims

71

Famous Command & Control Channels - Hammertoss Twitter & Steganography

fjJ - 1

bobby

Tw~ts

Source: https://www2 fireeye .com/rs/848-DID242/images/rpt-apt29-hammertoss.pdf
SANS

Hammertoss (APT-29) uses the following C&C strategy:
Checks a different Twitter handle daily
· If handle is found . extract images from
URL's in tweets The images include hidden data, inserted in the image using steg,inography and an encryption key The offset (in this case IO I) and the decryption key (In this case doctor) are included in the tweet · The data (typically commands) are extracted and executed

-

. . --

Famous Command & Control Channels - Hammertoss Twitter & teganography
Another interesting example of a command & control channel is the use of steganography in Twitter
images by the HAMMERTOS (b APT-29). In short, the following took place:
· Once installed, the HAMMERTOSS backdoor generate & looks for a specific Twitter handle (a different one every day). A built-in algorithm will generate a daily handle (e.g. I abBob52b) and will sub equently check this twitter account.
· lfth APT group has not registered the handle, the malware will take no action and wait for the nex1 day .
· The APT group will regi ter the protocol name and post tweets using the account. The tweets ha e the following fonnat: · They include a link to an image · The image includes a hidden message (typically a command that is to be executed) · The message is hidden in the image using steganography (it i encrypted and placed in the image
using a symmetric encryption k y)
· The offset (where the message is hidden) and the encryption key are included in the tweel · Upon finding an image, the backdoor will download th image, extract the mes age and e ecute the
requested command.
An excellent analysis oflhe 1-IAMMERTOS backdoor was done by FireEye analy ts and can be found here: https://www2.fireeye.com/ rs/848-DJD-242/images/rpt-apt29-hamme,1oss.pdf

72

© 201 7 Erik Van Buggenhout & Stephen Sims

Famous Command & Control Channels - DropSmacl<

DropSmack is an offensive toolkit developed by Jake Williams from Rendition

Infosec. It was presented at Black.hat in 2013 and essentially uses Dropbox as a

C&C channel!

IDropSmack leverages standard Dropbox connectlvity to set up an ''easy" channel for both command & control and data exfiltration. Commands are included as text files which are subsequently "sync'ed"

to infected hosts in the internal network.

Dropbox

IAs DropSmack uses built-in Dropbox functionality, there really isn't a lot we can do except for disabling Dropbox synchronization in our internal network.

Famous Command & Control Channels - DropSmack DropSmack is an offensive toolkit developed by Jake William · from Rendition Jnfo ec. lt was presented al Blackhat in 2013 and essentially use Dropbox as a C&C channel!
· Drop mack leverages standard Dropbox connectivity to et up an "easy" channel for both command & control and data exfiltration. Commands are included as te I files which are subsequently "sync'ed'' to infected hosts in the internal network. It can of course also be u ed in th other direction to "sync· file out of the network ...
· As DropSmack uses built-in Dropbox functionality . there really i n't a lot we can do except for disabling Dropbox ynchronization in our intemaJ network.
It's important to note that thi is not really · a vulnerability" in Dropbox. This type of technique could be used against the vast majori of cloud-based file sharing services. This opens the di cussion whether we should allow cloud-based file sharing within the enterprise. Given the rise of cloud within enterprises this will be a hot discussion topic©

© 2017 Erik Van Buggenhout & Stephen Sims

73

How Can We Block C&C Activity?

The following are some key strategies to block Command & Control communications:
Only allow outbound connectivity for a highly limited number of protocols Generally speaking, do not allow endpoints themselves lo co1wecl outbound, always put in place central control points (e.g. internal DNS servers that will forward outbound D S web proxies for HITP, ...) Implement network inspection / lPS s systems that perform deep packet in pection and detect protocol anomalies (e.g. the use of protocol tunnels for C&C)
IAs we've seen, however, adversaries are becoming increasingly creative with setting up Command & Control channels and they often "hide in plain sight'' using normal protocols. Prevention of such channels can thus be challenging in large corporate environments!

SANS

.. ·

. ..

How Can We Block C&C Activity? he following are some key strategies lo block ommand & Control communications:
· Only allow outbound connectivity for a highly limited nwnber of protocols · Generally speaking do not allov ndpoints themselves to connect outbound, always put in place
central control points (e.g. internal DNS servers that will forward outbound DNS, web proxies for HTTP, ...) · Implement network inspection / IP s systems that perform deep packet inspection and detect protocol anomalies (e.g. the use of protocol tu1mels for C&C) · Configure network devices to heck that the type of traffic matche the port. ror example. we only allow HTTP on port 80 we blo k SH over port 80 but allow it over port 22.
As we've een, however adversarie are becoming increasingly i.:reative with etting up ommand & Control channels, and they often "hide in plain sight' using normal protocols. Prevention of such channels can thus be challenging in large corporate en ironments! Let' investigate ho, we can try detecting the use of Command & Controls!

74

© 2017 Erik Van Buggenhout & Stephen Sims

How Can We Detect C&C Activity?

ext to the "blocking controls listed on the previous slide, here ar ome interesting ideas to detect C& activity in your environm nt. You will require logs & n twork traffi ofyour perimeter devices:

Revi w end-p int systems for applir.1Hions that are conne ting to external systems (this can, for example b easily achieved using OSQuery which \ e will use tomorrow) · Lo k for wiknown protocols that ar not exp cted in your environment · Look for beaconing behavi r (malwm·e typically checks in with its C&C server on a periodic basis) Unu ual traffic volumes ( ouJd be a i TD of data cxfiltration) Inv tigate typical C&C protocols
H1TP: User-Agent, HTTP Refer r ... · ONS: Query length, Query types, Query ntropy,
Find valu that are not normal for your cnvironmenl and alert upon them (e.g. A User- gent that does not match your organization's default browser type)

Si\NS

,

How an We Detect & Activii-y'! e t lo the "blo 11.ing·· controls listed on the previou slide, here are . ome intcre ting ideas t d te l C&
a ti it) in your environment. In any case. if we want 10 tart cl.!tecling Command & Contr Ia tivity, w will need to start pcrfonnfog nelwork monitoring & oil cting log~ from our perimeter de tee . Additionally, it might be worth reviewing end-points for application that arc connecting to external ystems (this can, for example, be easily a hieved u ing O Query, \ hich we wi 11 u e tomorr w)
Furthermore, lo k for unknown protocol that are not e pected in y ur environment. This i rairly ea y, a. exotic protocols will raise al rts and arc easy to spol.
Implement protocol ·pecifi gate, a_ s ( uch outbound ,.,,eb pro I s) Lhat nn anal_ ze t11c protocol and analyze protocol lield. & ellings. Highly p puJar protocol used for ·C onnecti ity include HTTP D S. In HTTP trnllic, interesting fields Lo analyze include, for example, the U er-Agent and the "Refcrer" reque ·t headers. For D S, we can look at the query lcn rth, query t pes & entropy.
E en ad van ed ad ersaries will 11 I alway, in ent ne, protocols, but reu e ex i ting comm:rnd & control protocols. By ontiguring ID & IP systems ith up-to-dnte rules that detect various known command & control channel., we increase our chance. to deLect lnown co1111nand and onti-ol prot cols. Proper! configuring proxie · and fire,,all to only all , known and trust d protocol and website · we can fur1her reduce the u e of command control chann I .
Anomaly-based network det1::clion y \ems can help us dct ct nl!w, unknown command & ontrol channel · These detection sy tcms come ,..,ith ad anced n twork protection de i e and are ·ometim running n dedi a1ed computers 10 pro id full pro e ing po, er. Detecting be coning i one ' uch application. By restricting the initiation of network connections Lo devices in idc our net\ ork, the command & control server cannot connect directly to the compromised machine. It is the c mpromised machin that ha. 10 initiate the c nnection on a regular ha ,j to check if the command & l: ntrol server ha in tniction . This i · called b aconing. and b_ anal_ :ting the frequency of c nnection ' . regular beaconing: an be detected.

© 2017 Erik Van Buggenhout & Stephen Sims

75

One of the problems we face is that more and more our adversaries will use encrypted command & control channels (like SSLfrL ), which drastically reduces our opportunities to inspect traffic. TLS interception can help us here.

76

© 2017 Erik Van Buggenhout & Stephen Sims

How Can We Detect C&C Activity? - Freq.Py

Mark Baggett (a SANS Instructor & ISC Handler) wrote a highly useful python tool called ''freq.py" that can be used to perform frequency analysis to detect suspicious hostnames!

Some malware leverages domain generation algorithms (DGA), which is the primary target offreq.py:

· In typical English words, there are character pairs that are more frequent than others · "TH : There is a 40% chance that a Twill be followed by an H · "QU": There is a 97% chance that a Q will be followed by a U
· Freq.py will analyze DNS logs and "score" all hostnames for "randomness''. DGA algorithms will immediately pop up!

PROBLEM: CDN / ad networks will also be highlighted by "freq.py"

PROBLEM 2: Modern malware often uses random words, not random letters

;~~1\NS-. -

-

-

. . .

. . ..

.

-

How Can We Detect C&C Activity'!- Freq.py Mark Baggen (a SA NS instructor & ISC Handler) wrote a highly useful python tool cal led "freq.py'· that an be used to per orm frequency analysis to detect suspicious hostnames! ome malware leverages
domain generation algorithms (DGA), an interesting example is the Zeus banking trojan.
Malware families that use DGA are the primary detection target of freq.py ... How does it work?
· In typical English ords, there are character pair that are more frequent than other : · "TH": There i a 40% chance lbat a Twill be followed by an H · "QU": There is a 97% chance that a Q will be followed by a U
· Freq.py will analyze D logs and "score" all hostnames for "ra ndomness". DGA algorithms will immediately pop up!
The development and u ·age of freq.py is described in detail in Mark Baggett s SA S I C po t: http ://isc.sans.edu/forums/diary/Detecting+ Random+Finding+-Algorithmically+chosen DNS l·names+ D
GA / 19893/
It' · important to note that this approach ha. tbe fo llowing li111itations:
I. Fir t of all. D / ad networks will typically u e randomly generated ( ub-)domain names as \ ell , which wi II al o be highlighted by "freq.py". This could be solved by whih:lisling certain domains from the list (then again, you might whitelist actual malicious domains)
2. econdly, modern malware that relies on DGA sometimes u es a nev approach: in tead of using random letter, the use random words to generate domain names. This will defeat freq.py. a it's looking for uncommon characters pairs, nol uncommon combinations of words ...

© 2017 Erik Van Buggenhout & Stephen Sims

77

How Can We Detect C&C Activity? - RITA

RITA (Real Intelligence Threat Analytics) is a project first started by Black Hills Information Security which is now being further maintained by Offensive CounterMeasures. You can find its source code on GitHub!

RITA is an open source framework for network traffic anaJysis. It was designed to ingest Bro (network security monitor) logs and has the following interesting analysis options:

· Search for signs of beaconing behavior in and out of your network; · Search for signs of DNS based covert channels; · Search for suspicious, long, URL's that are often indicate of malware;

RITA supports a few other items~ but the above are most relevant for detecting C&C traffic!

SAN~

·· .· ·

. ,

"I

How Can We Detect C&C Activity'? - RJTA RITA (Real Intelligence Threat Analytics) is a project first started by Black Hills Information Security which i now being further maintained by Offen ive CounterMeasures. You can find its source code on the following GitHub page: hnps://github.com/ocmdev/rila
RJTA is an open source framework for network traffic analysis. It was designed to ingest Bro (nelwork security monitor) logs and has the following interesting analysis options:
Search for signs of beaconing behavior in and out of your network: earch for igns ofD S based co ert channels: earch for suspicious, long, URL's that are often indicative of maJware;
RIT does support other analysis types as well, but the on s listed above are most relevant to detect Command & Control traffic. Please refer to RITA ·s github page for additional infom1ation, including for example install, configuration & usage guidelines.

78

© 2017 Erik Van Buggenhout & Stephen Sims

Command & Control Channels -Additional References
Some additional resources concerning command & control channels:
Turla's u e oflnstagram https://www.welivesecurity.com/2017/06/06/turlas-watering-hole-campaign-updatedfirefox-extension-abusing-instagram/
· FireEye- Hammertoss report htq>s ://www2.fireeye.com/rs/848-DID-242/images/rpt-apt29-hamrnertoss.pdf
· DropSmack - Blackbat paper htt,ps: / /media.blackhat.com /eu-13/briefings/William /bh-eu-13-dropsmack-jwilliamswp.pdf
RITA: htt_ps: //gjthub.com/ocmdevIrita
. SANS
Command & ontrol Channels -Additional Reference
Turla's us oflnstagram http ://www.weIivesecurity.com/20 t7/06/06/turlas-waterin g-ho lc-campai!!n-updated-firefox-e ·tensionabusing-instat,rram/
FireEye - Hammertoss report https://www2.fir eye.com/r /848- D1D-242/images/rpt-apt29-hammerto s.pdf
DropSmack - Blackhal paper https://media.btackhat.com/eu-13/brieting /Williams/bh-eu-1 3-dropsmack-jwilliams-wp.pdf
Black Hill's RJTA: https://www.blackhillsinfosec.com/?page id =44 l7

© 2017 Erik Van Buggenhout & Stephen Sims

79

Course Roadmap
Day 1: Knowing the adversary, knowing yomself Day 2: Averting Payload Delivery · Day 3: Preventing Exploitation Day 4: Avoiding Installation, foiling
Command & Control & thwarting lateral movement Day 5: Erliltration, Cyber Deception & Incident Response
Day 6: APT Defender Capstone
SAN~

SECS99.4
Avoiding Installation Typical Persistence Strategies l:}(ercise: Catching Persistence Principle of Least Privilege & User Access Control Exercise: local Windows Priv1lege Escalation Techniques
Foiling Command & Control Networlt Monitoring Con~iderations (Net/low, IDS, .. .) Detecting Command & Control Channels
· Exercise: Suricata t,o Detect Network Anomalies Thwarting lateral movement Introducing Common lateral Movement Strategies Active Directory Architecture & Attacks Active Directory Hardening & Segmentation Exercise: Hardening Windows to Stop lateral Movement Detecting lateral Movement Using Windows Event Logs Exercise; Configuring & Forwarding Windows Event Logs

.

-. _

This page intentionally left blank,

80

©2017 Erik Van Buggenhout & Stephen Sims

Exercise - Using Suricata to Detect Network Anomalies
IThe objective of the lab is to detect a new attack technique that is being used to download executables to compromised systems. We will first configure Surrcata on PfSense, after which we will write a custom rule to detect this new technique.

High-level exercise steps: 1. Configure Suricata on PfSense to perform IDS alerting 2. Write new IDS rule to spot new type of attack technique 3. Simulate attack using new attack technique and confirm successful detection

,_

-

. \' r\ 1\1~

4~l l t t ~

-

---

---~--

.

: -· - .-· . - ' . - .

- ·~

-

.

Exerci e- Using Suricata to Detect etwork Anomalies The objective of the lab is to detect a new attack technique that is being used to download e ecutables to compromi ed sy terns. We will first configure uricata on PfSense, after which we will write a custom rule to detect this new technique (TIP).
The following are the high-I vel attack steps:
1. Configure uricata on PfSense to perform IDS alerting 2. Write ne, ID rule to spot new type of attack technique 3. imulate attack using n w attack teclmiqu and confinn succe sful detection
For additional guidance & details on the lab, please refer to the LOD workbook.

© 2017 Erik Van Buggenhout & Stephen Sims

81

Exercise - Using Suricata to Detect Network Anomalies - Conclusions
During this exercise, we relied on Suricata IDS to detect suspicious HTTP user agents in our environment:

Based on intelligence we receivecl we understood that

"certutil.exe1 is being used as a novel technique to bypass

I

application whitelisting and download malicious payload . We subsequently created an IDS rule to detect this type of

outbound network connectivity!

We will focus more on network traffic analysis tomorrow when we discuss data exfiltration!

SANS

. .

Exerci e - Using Suricata to Detect Network Anomalies - Conclusions During this exerci e, we relied on Suricata IDS to detect suspicious HTTP user agents in our environment:
· Based on intelligence we received we understood that "cer1util.ex " is being us d as a novel technique to bypass application whitelisting and download maliciou payloads. We subsequently created an fD rule 10 detect this type of outbound network connectivity!
We will focus more on network traffic analysis tomorrow when we discu s data ex filtration!

82

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
Day 1; Knowing the adver ary, knowing yourself Day 2: Averting Payload Delivery Day 3: Preventing Exploitation Day 4: Avoiding Installation. foiling Command & Control & thwarting lateral movement Day 5: Ex-filtration, Cyber Deception & Incident Respon e Day 6: APT Defender Capstone

SECS99.4
Avoiding Installation Typical Persistence Strategies Exercise: Catching Persistence Principle of l~t PriVilege & User Access Control Exercise: Local Windows, Privilege Escalation Techniques
Foiling Comm,lnd & Control
Network Monitoring CorTsiderations (Nei:flow, IDS, .. .) Detecting Command & Control Channels Exercise: Suricata to Detect Network Anomalies
Thwarting lateral movement Introducing Common Lateral Movement Strategies Active Direccory Architecture & Attacks Active Directory Hardening & Segmentation Exercise: Hardening Windows to Stop Lateral Movement Detecting Lateral Movement Using Windows Event Logs Exercise: Configuring & forwarding Windows Event Logs

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

83

Where Are We in the APT Attack Cycle? - Action on Objectives
So... We've reached the final stage of our cycle. "Action on objectives":

.. .

Action on Objectives

Where Are We in the APT Attack Cycle? -Action on Objectives Once the adversary has managed Lo persist maJware on an initial system. he can now gear up to start working on his actual objective .
Adversa,y perspective nee the attack reaches this step of the kill chain, everything has been put into place to enable the adversaries
to perform the necessary actions on 1he targets to reach their objective . The actions they will take depend on these objectives and can be ail sort.
For example, once they have a foothold in the infrastructure. adversaries can start a new digital kill chain: they start with reconnais ance of the internal network to identify interesting targets to attack. This will ty pica lly be followed by lateral movement. Lateral movement is the term used to indicate that adversaries ar preading in the network, moving from computer to computer. Once inside, lateral movement is often facilitated b the "openness" of the internal network (so-called "egg-s hell" problem). Old chool design of a ecure network puts man of the security control at the perimeter of the netv ork, and not inside the network. On e adver$aries penetrated the perimeter without detection, they ncounler fewer obstacles to move inside the internal net\vork.
When adversaries reach their targets through lateral movement, tlu;:y will "finalize the kill". lfthe objective 1s e pionage, they will collect and ex filtrate data. If the obj ctive is to interfere with the target., they will start making modifications. This can be corrupting deleting or overwriting of data and systems, or covertly modify data aod configurations to change operations within the target. or example, data modification can be introduced in payment systems to steal money by wire transfer. We have even observed malware sample, that mt)di fy payroll data on cloud sy tern to introduce new fake, employees in the staff database and have Lheir wages paid to bank accounts owned by riminal or their money mules.
De.fender pen,pective When adv rsaries progress this far in tJ1e kill chain, Lh y have d feated the majority of previous defen es. F'or the adversary, everything is in place for the final push.

84

© 2017 Erik Van Buggenhoul & Stephen Sims

Depending on th objectives and the complexity of the attack, there might be a lot of activity required from the adversary, which could give us more opportunitie to detect or block the attack. During d1is step, which can be the longest in abso lute time of all steps in the digital kill chain, adver aries typical perform following actions (not all during the same attack):
Lateral movement: adversaries do reconnaissance of the internal network and move from sy tern to system to reach the systems they target. Lateral movement can generate a lot of evidence, offering opportunities to defenders for detection. To be able to detect lateral movement, appropriate controls inside the internal network need to be put in place, such as firewalls and intrusion detection system between different segment of the internal network. Furthermore, adversaries could attempt to reuse previously compromised credentials, which could raise s uspicion. For example, if user A is currently working in the
ew York office and a login is detected for user A via VPN from a location in Turkey, something unusual is going on and should be further investigated.
Da a exfiltration: when the objective is to obtain information, it has to be transferred to the adversaries' systems once it is located and accessed. Exfiltration of data is typically a network activity and a uch leaves traces. Large amounts of data ex.filtration (gigabytes or terabytes) are detectable by graphing the consumed network bandwidth versus a time axis. Dedicated system can be put in place to monitor for data exfiltration: Data Loss Prevention systems. OLP can be as simple as looking for tags on the network, uch as the string "strictly confidential" in uploaded documents. But such imple detections are also simple to bypass. For examp le ju t compressing or encrypting a document before uploading hide all strings inside the document.

© 2017 Erik Van Buggenhout & Stephen Sims

85

Introducing Common Lateral Movement Strategies

MOKESCREEN

According to a Smokescreen swdy, adversaries spend up to 80% of their full "attack time" on lateral movement...

Initial exploitation can happen in the blink of an eye... "One click is all it takes" © Once inside
your environment, however, the adversary enters uncharted territory: he needs time to get to know your organization! Although the adversary can be well-prepared, some thing that might till need to be investigated include:

· What does your architecture look like? · Where are your key assets & crown jewels'? · Wbat security controls do you have in place?

Given the above, lateral move"Inent is an excellent phase to detect & stop adversarie that succeeded in the initial compromise!

-

SANS

· ·. : -:· .·

.

Introducing Common Late ral Movement trategies Initial exploitation can happen in the blink of an eye.. . "One click is all it takes". © Once inside your environment. however, the adversary enters uncharted territory; he needs time to get to know your organization! Although the adversary can be well -prepared, ome things that might stil l need to be in estigated include:
What does your architecture look like? · W11ere are your key as ets & crown jewels?
What security controls do you have in place?
According to a Smokescreen stud (a vendor of cyber deception technology), adversaries spend up to 80% of their full " attack time" on lateral movement! Given the above, lateral movement is an excellent pha. e to detect & stop adversarie that succeeded in the initial compromise!

86

© 2017 Erik Van Buggenhoul & Stephen Sims

Typical Lateral Movement Example

typical lateral movement cenario could look lik this: 1. Adv r ary obtain ace s to Workstation through phishing 2. Adver ary e calates privil g & pillages credentials from local sy tern

t

3. Cred ntials ar r used against other internal a ets

4. La k of segm nt· tion abused to obtain access to

crown j wels / core a ets

SANX
Typical Lateral Movement Enmple o, hat does at_ r,i al lateral mo emenl s cnario look like'? It lo k omething like this:
n ad ersary obtains initial access to the environment by compromi ing a , ork talion through phi. hing · The adversary calates privileges on the machine and steal credentials from local system
red ntial are r -used again ·t other int mal asset · Laci-. of egmentation i abused to obtain access to cro, n jewel / core as el
Thi i ·· of course, a bit of a implistic iew, as lateral m > ement cou ld include a number f different hop before access to the ron jewels i actuall obtained. It' important to n te here, h we er, that the adver ary i "tryi ng" ·tuff and thus might make mistakes which cou ld trigger al rt and could allow u I det. ct their activity!

C> 2017 Erik Van Buggenhout & Stephen Sims

87

Preventing & Detecting LateraJ Movement - Key Strategies
The be1ow are some key strategies that can help us prevent or detect lateral movement. We will focus on some of the most important ones throughout this section:
Preventing lateral movement
· Network segmentation · Harden Active Directory · Limit use & scope of administrative credentials (Identity & Access Management) · Avoid (administrative) credential re-use
Detecting lateral movement · Attempted network connections to firewalled ne~ork zones · Internal IDS / IPS technology · Failed access attempts to network shares · Failed login attempts · Implement & monitor deceptive technology (honeypots, canary tokens, fake tokens, . ..)
SANS
Preventing & Detecting Lateral Movement - Key Strategies The below are some key strategies that can help us prevent or detect lateral mo ement. We will focus on ome ofthe most important ones throughout this section!
How can we prevent lateral mo ement? etwork segmentation
· Harden Active Directory · Limit use & cope of administrative credentials (Identity & Access Management) · A oid (administrative) credential re-use
How can we detect lateral movement? · Attempted network connections to firewalled network zones · Internal IDS / IPS technology · Failed acces attempts to network hares · Failed login attempts · Implement & monitor d ceptive technology (honeypots, canary token , fake tokens, .. .)
Given its prima y. nearly every large breach has leveraged Active Directory for lateral movement. We will thu pay extra attention to lateral movement trategies on Active Directory!

88

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
Day 1: Knowing th adversary, kn wing yourself Day 2: erting Payload Delivery Day 3: Pr enting Exploitation
foilin &thw-artin
Da 5: Exfiltration ber Dec plion & Incident R spon e Day 6: APT Defender Capstan
SANS
This page intentionally left blank .

SEC599.4
Avo1dmg tnstallation TyPical Pers,nenc;e Strategies Exercise: Catching Persistence Principle of Least Privilege & User Access Control Exercise: Loal Windows Privilege Escalation Techniques
Foiling Command & Control
N~lV·«;,rk Monitoring Considcl'l!tions (Net:11ow, IDS, ...)
Detecting Command & Control Channels Eitercise: Surtcai:a co Detect Network Anomalies Thwarting lateraJ movement Introducing Common lateral Movement Strategies Active Directory Architecwre & Attacks Accve Directory Hardening & Segmeni:acon Exercise: Hardening Windows co Stop lateral Movement Detecting Later.ii Movement Using Windows Event Logs Exercise: Configuring & Forwarding Windows Event Logs

© 2017 Erik Van Buggenhout & Stephen Sims

89

Intro to Active Directory (AD)
Active Directory is a technology developed by Microsoft and included in professional versions ofWindows. It is by far the most commonly used enterprise directory service. It's built-in enterprise management tools render it a dream for both sysadmins &
adversaries.AD is not limited to onlyWindows systems!
Active Directory started out as a directory service for Windows domains, but has grown beyond domain. user and computer management. Compromise of the Active Directory typically means a full compromise of the (majority of the) IT environment. Advanced
adversaries will thus make it a priority to come after your AD!
The key Active Directory services we will focus upon are security-related: identification. authentication and authorization of users. We will illustrate how advanced attacks against the AD work and how you can detect & prevent them!
lnlro to tive Dir ctory 0 In the nineties, Mier oft intT duced a profe sional ver ion of Windows: Windo" s T ( c, 'l\ichnolog ). Windows machine · (servers and workstations) were grouped in "domain ". D mains are logical groups ofma hine . Th y are managed by spe ialized \! indo, machines: the domain controller (primal) domrun controller and ba ·kup domain controllers). Domains all wed for centrali~ed management of user and machines.
ith indo\ s 2000 (releas din 2000 , icrosoft released ch e Directory. Act1 e Directory, when i1 , as introdu cd,, a a directol) ervice for Windo, domain : like a phon diret:t 1ry, it contains metadata about all the entities it contains: u ers, group . machine ·...
ith ind , s T, domain , re landalone: if an organizati n needed a domain for its production environment and a domain for its research environment, then 2 domains had to be created (, ith he corresponding domain controllers) and 1hcre were little facilities toe tabli h relationship between the _ domains. e cept haring credentials. ith the intr du tion of A .ti e Direc.tory, a hierarch) of domains
uld be built a domain tree here trusl relation hip ' could be established between domains.
n important feature of ctive Directory i Group Policies: 1he e are va1 iuus configuration et1ings fi r inputer and use that can be configured and managed centrally and applied throughout the member of the domain.
k ) fealure of ti c Direcl ry i ecurity: identilicacion, authentication, and authorizati n of users (and computer ). It' this feature f Active Direct ry that is onen attacked by advanced adversaries.

90

© 2017 Erik Van Buggenhout & Stephen Sims

Key Security Services Offered by Active Directory

Identification

A user identifies itself to Active Directory with its username. Since a username is not confidential, authentication is mandatory.

Authentication

After providing a username, the user will provide his secret password and thus prove to the system that he is indeed the user he claims to be.

Authorization
I Sil:~~

Once the user is authenticated, Active Directory will authorize the user to perform certain actions (e.g. logon to a workstation, access files or folders, ... ).

-

-

-

--

-

.

Key ccurity Services Offered by Active Directory When a user logs on lo a machine via Active Directory many actions are p rfonned. The actions we are interested in, are those that pertain to security, and more specifically: id ntification , authenl-ication, authorization.
In a nonnal situa tion, when logging onto Active Directory, the user is presented with a logon screen where he has to provide his c redentials: usemame and pas word. This information must be typed into the fields via a keyboard .
The usemame is what uniquely identifies the user: by typing hi usemame Active Directory knows which userac.count wants to authenticate. The usemame is not confidential, and it is displayed when the u er types it. Since the usemame is not confidential, many users know the uscrname of other user . In organizations that use the Active Directory usemame as email address, it ' s obvious that u mames ar not confidential.
Becau e of the non -confidential nature of usemames, it would be ea y for a user to identify as another user to Active Directory, just by typing that usemame. Because this is what identifies a user to active directory. However, when i1 comes lo security, Active Directory docs noi blind] identify a user by his username without further checks.
To prove 'LO Acti e Dire1.:tory that a user is who he claims to be, the user has to authenticate by providing the second part of the credential : the password. Becau a password authenticates a u er, it has to be kept secret: only the user must know the password. If an adversary knows the password of a user, the ad er ary can authenticate lo Active Directory as that user, and the adversary will obtain all the rights this user has. When typfog a password into the pa word fie ld, it is kept confidential: each typed character of the password i hidden by showing an asterisk (*).

© 2017 Erik Van Buggenhout & Stephen Sims

91

When a user provides valid credentials (an existing usemame with the corresponding, valid password) to Active Directory, Active Directory looks up infonnation for this user account to decide what the account is authorized to do. For example, the account might not be authorized to logon to the computer and then a message will be displayed and the user will not be given access to the computer.

92

© 2017 Erik Van Buggenhout & Stephen Sims

Overall AD Architecture

Domain Controllers
The Domain Concrollcr(s) is (are) considered to be the "focal point" of the Active Directory.
These systems store & manage security-sensitive information about the Active Du-ectory. They typically offer the following services to ocher systems: DNS. authentit.1tion. authorization, .. ,
In order to harden the overall AD, it is crucial to properly harden the domain controllers, as they arc the key to the environmenL.

SANS
0 erall O Architcc1ure When a user logs on to a machine via Active Directory, many actions are pcrfomicd. The action we are interested in, are those that pertain to ecurily, and more specifically: idcntilication, authentication, authorization.
In II nonnal situation. when logging onto Active Directory, the u er is pre ented with a logon creen , here he has 10 provid his credentials: u. cmamc and password. This infonnation mu t be typed int the fields ia a kc}board.
The usemame i \ hat uniquel iden6tie. the user: by typing his usemame. Active Directory know which us raccount, ants to authenticate. The u. ername is not con(idential, and it is di play d when the user rype it. ince the us mame i. not confidential, man users knO\ the usernames of other u crs. In organization that use the Active Direct ry usemame a email address. iL' obvious that usernames are not
nfidential .
Because of the non-confidential nature of usemames. it would be easy for a user to identify a another user to cti e Directo ,just by typing that usemamc. Because this is what id ntifie a user to active directory. Howe er, when it come to sccurit , Acti e Directory doe · not blindly identif) au er by his u emame -. ithout further checks.
To pro e 10 cti e Directory rhat :i u er i " ho he claim to be, the user has to authenticate by providing. the second part ofth credential : the pa word. Because a pa , ord authenticate a user, it hcU to be kept ecret: onl the user must k.now the pa sword. lf an adversary knows the password of au er, the ad ersary an authenticate to Acti e Dire tory as that user, and tJ1e adv rsary will obtain all the right this u er has.
When typing :l pass, ord into the password field, it i kept contideatial: ea h typ d character nt'the pas \ ord is hidden b) showing an asteri k ("').

@ 2017 Erik Van Buggenhout & Stephen Sims

93

When a user provides valid credentials (an ex isting usemame with the corresponding, valid password) to Active Directory, Active Directory looks up information for this user account to decide what the account is authorized to do. For example, the account might not be authorized to logon to the computer, and then a message will be displayed and the user" ill not be given access to the computer.

94

© 2017 Erik Van Buggenhout & Stephen Sims

How Does Authentication in AD Work?
In an Active Dir ctory domain, the main authentication mechanism is Kerbero
Kerberos is a network authentication protocol based on tickets. The pr-otocol allows 2 parties (a client and a server for example) to authenticate to each other over an insecure network channel, provided that both parties ti-ust a third party; the Kerberos server!
The main components of in a Kerberos tran action are: · The KDC (Kerberos Di tribution Center) · The cli nt requ sting access · The ervice the client js attempting to obtain ace to
When K rbero authentication i not available Windows reverts to NTLMV2!
How Doe Authentication in AO Work'! With ctive Dire tory, Micro ot\ introduced a ne auth ntication s heme called Kerbero ·. Kerbero i a netw rk authentication protocol based n ticket , developed by M11 . TI1e protocol allm., s 2 parties {a lient nnd a erver fore ampl ) to auth nticatc to each olher over an insecure n twork channel. pro ided that both parties lrust the third party: the crb ros server. Given these three components, Kcrberos is nam d atl r the three-headed mythological dog.
Each party in a Kerberos environment authenticates to the Kerbero erver and rccei es a ti k t. More precisely, this is a 1icket-granting-ticket: a ticket that can be used to request ti ·kets. When one party client) wants to use a service from a econd party (server), the 11rst party uses it ticket-granting-tick ·t Lo obtain a ticket for the second part from th erbero . erver. and th 11 pre ent. it to the ·econd party. thereb authenticating to the third party. in c both partie trust lhc Kerbero ·ervcr, a ticket pro ided b)' the Kerl cros server is trusted hy both parti1:s, leading to authentication and authorization .
Before Kerbero was introduc d. pre- cti e Directory Window domain indow T) relied on TL challenge / re pon uth ntication. TL pr ide authentication between 2 partie , "'ithout a
third trus ted part. .
JfKerberos cannot be used ( arious reason appl_). indo\ s, ill fall back tO TLM authentication.

© 2017 Enk Van Buggenhout & Stephen Sims

95

How Does Authentication in AD Work? - Kerberos · Tickets In the example below, a Windows client is using Kerberos to access a database server:

Client Workstation

Key Distribution Center (Domain Controller)
Authentication Server (AS) Ticket Granting Server (TGS)

Service Database Server

SANS

· · · ··

How Does uthentication in AO Work?-Kerberos -Tickets
rn Active Directory, when a client successfully authenticates to a D main Controller, the client i given a
ticket-granting-ticket.
o authenticate, the user's workstation will send a request to the Authentication erver (AS) on the
domain controller. This request incl udes the credentials (encrypted with keys obtained from the Key Distribution Cent r (KDC), also a service provided by a domain controller). l11e A , ill deer pt and validate Lhe credentials (lookup the TLM hash) and if the NTLM hash matches, the client will be given a ticket-granting-ticket (TGT) by the icket Granting ervice (TGS).
Kerberos works with tickets: cryptographically secured pieces of data that grant access to a service for a particular user and during a well-defined period. Fore, ample, you can recei e a ticket to access a
particular share on a file erver.
A ticket-granting-ticket i the ticket a client receives fir t, and it is a special ticket: ii is a ticket for the krbtgt service and can thus be used to request olher tickets. By default, a TGT is valid for IO hours. When it eJ<pires, Windows will automaticall and transparently request a new one.
Once a client has obtain d the TGT it can requ t access to other services, for example, a fil e share. To obtain this access, the client send its TGT to the TGS along with the details of the ervice it wan to access. The TGS will validate the TGT and then check Active Directory if the user is authorized to access the ervice. When this is the case, the TGS , ill issue a ticket to the client for the ervice it wants to access.
To access the service (for example a file share), the client ill send the ticket to Lhe ervice (the tile erver fore ·ample). ince th file se1ver also trusts Kerbero (the TGS), it v.ill accept tickets and grant access to the service one it has validated through cryptographic means that this is an authentic ticket issued by the TGS tmsted b the service.

96

© 2017 Erik Van Buggenhout & Stephen Sims

How Does Authentication in AD World - Ntlmv2 Challenge Response

For diff rent r ason Kerberos could not b avai1able, in which case Windows will revert to NTLM 2 Challeng / Re ponse authentication:

Client Workstation

ld§,!l@iiili.f§,lif¥df.i·
t l@J.i.f,ti· · -1\f4tJ4ii4,t,ti24J,f.i,H4t·tiii4,iW
Service Database Server

Domain Controller

The authenticatJng system uses the hashed credential to calculate a response based on
the challenge sent by the server

In a Windows domain environment, the NTLM challenge & response will be
forwarded to the domain controller for validation of credentials

How Does uthenticalion in D Work'?- TLM 2 hallengc Respon e When Kerbero auth ntication i not po ible, indO\ ' \ ill fall back to TLM au1hen1j a1ion.

Thi. can even happen bet ecn machine that are member of the same domain. but when all nece sary conditions to u e Kerbero are not in place. For exampl , Nbero \Vorks with o-caJled ervice names. If\ e don't ha ca name, Kerbi.:ros cannot be used. This i the ase when we access a share on a file server by u in the fP addres of the crver in tead of it ervername.

NTI.M authenticarion i a _-party authentication : the client and the server. It take · 3 step ;

I . gotiate 2. "hallenge 3. Re pone

First, the clien t sends a neg tiale pack t to the ·erver to request the authentication . There are different paramet n; and er ion for TLM, and the lient has to inform the er er what it is capable of. This is d ne, ith a negotialc packet. cl\l, ( tep - ) the server end a challenge packet lo the client. This challenge contains as - ailed "nounce". nounce is a r:rndom number of 16 bytes. Final ly (step J ), the client sends th response to the erver: it calculate a re p n e based on it pas word and the nounce. and send · that to the serv ·r.

U ing a nounce allow~ lhe 2 parties to perform uuthentication without having cos nd the pn sword (tleartc t or encrypted) over the network.

The erver checks the credeni ials of the client by pcrfrinning the ame calculation a the client for ·rhe respon e and if Lhe re ponsc calculated b~ the -;erver i · the same a the re pon e calculated by the client. then the cli ·nt i authenticated to the erver.

Th erver needs Lhc credential of the client to perform the calculation, in an erv r obtains the credential fr m ad main control I r.

Directory en ironme11t the

© 2017 Erik Van Buggenhout & Stephen Sims

97

AD Credential Storage in ntds.dit

SANS

Active Directory stores credentials (& plenty of other information about the AD) in its directory database. The filename of this database is ntds.dit (location varies, default is C:\Windows\NTDS).
While at re.st, hashes are stored in an encrypted format in the ntds.dit file. Furthermore, the ntds.clit file is protected Oocked) by the Operating System.

Credential hashing Encryption of the hashes Store in ntds.dit database

NTLM (since Windows 2008 & Vista) Symmetric, key stored in SYSTEM registry
Hashed and encrypted

· ·

AD Credential Storage in ntd .dit Active Directory has to store credentials in a database: th username and the password.
This database file is ntds.dit. This is a database in the ESE format (Extensible Storage Engine) fi-om
Microsoft, this format is also used by Microsoft Exchange for example.
By default, this file is stored in folder C:\ Windows\NTD on domain controllers.
o protect passwords, the hashed value of the password are tored in the ntds.dit database . Window uses a hashing function that Microsoft officially calls NTOWP. This stand for NTLM One-Wa Function. However, in most literature on Windows pa sword , the name TLM will be used for the hashing function instead of TOWF. We will do the same in this lraining: TLM hashing function.
The TLM hashing function is an MD4 hash oft.he little-endian UNICOD , representation oflhe password. MD4 is a cryptographic hashing algorithm, it's design was later used to d sign the, ell-known MD- ha hing cryptographic hashing algorithm . MD4 (and MOS too) is no longer a strong, cryptographic
hashing algorithm, it has been broken.
On older Windows ver ions, another hash function will be used too; LM hashing (officia lly LMOWF).
taring passwords as LM hashes should be avoided at aJI costs (it is no longer used on modern Windows vers ion , and can be disabled on older version ). LM hashing is very weak.
To provide further protection, the hashe stored inside the TDS database are also encrypted with a sym metric encryption ipher. The key used for encryption is unique to every domain controller and stored inside the SYSTEM registry hive.

98

© 2017 Erik Van Buggenhout & Stephen Sims

AD Users & Groups

Active Directory allows f r role-ha ed acce control through the use of group . The following are some ofth most commonly used groups in a Window domain (in order of privileg ):

· Schema Admins · Ent rprise dmins · Domain Admins · Backup Operators · Remote Desktop User. · Domain U r ·

AD Users & Groups - Least privilege!
Users should be assigned a group & account based on least privilege. For example. IT administrators should have different accounts for performing administrative tasks.
Additionally, administrative privileges should be assigned on a fine-grained basis!
In ::i mature environment, a "Domain Adrnin" account is only used for recovery and not during normal operations!

SANS

Active Directory Altack - Domain Admin Rights cti c irectory allows for role-based access control through th use of group·. The following are some
of the mo l common I used group in a indo\\ domain (in order of pri ilege):
chcma Admin : Members fthis group an modif the Activ Directory s hema. B default, the Adminjstrator account i· a member of thi · group; · Enterpri e dmins: Membe of thi group ha e full control of all domain in the fore t. By default, this group is a member of the dmini ·trators group 011 all domain controller in the fan! t. · Domain Adm ins: Members of this group have full control of the domain. B default, 1hi group is 3 member of the Admini trators group on all domain controllers, all domain workstation , and all domain member ervers at the time lhe I are j ined t the domain. · Ba kup Operat rs: Member of this group can back up and re tore files on the erver, regardles of any permissions that protect tho e file . This is b cause the right to perform a backup takes prec d nee o er all fiJe penni ions. · Rem te Deslct p sers: embers ofthi group an I g on remoteI_ to a server. · D main User : hi group contains all domain users. B defauh, an} u er account that i created in th~·
a member ofthi group aUlomatically.
·en. should be as ·igned a group & account based on least pri, ii ge. Fore. ample, IT admini trators hould have: diffi..:rc11L uccount ror performing admini ulrntivc t ks. dditionall , :1dmr11i. 1rative pri ii ·gc-. hould be a signed on a fine-grained basis! Many organizations will use specific !,.>roups, b cd on least pri ile c (e.g. workstation administrator . weh erver administrattw. databas' administrator ·...). In a manirc en ironment, a '"Domain dmin" a count i onl) u ed for reco ery and not during n nnal operations.

tO 2017 Erik Van Buggenhout & Stephen Sims

99

So, How About Local Users & Groups?

Next to domain-level users & groups, Windows endpoints (both servers & workstations) will also have a number of local accounts configured. The default accounts are "Administrator" & ''Guest".

t_.... (Oll'IPIA.,M,n_,..,,lOU!i
" I ½<tt<m
-~-ut. I ,..
""""'-~ \l>ottdf~
u ·
Gt..,,,. ~) fdt~<t
.,._,,,..,,.11"
y S<o,"9<
.-:, OU. "4M'9'ff'"'' - ~.. ,lndApjll,<41-·

IN.,,.-. ,~~r·.9t ,<,O<lf-<<>= ,...

ILocal accounts are difficult to manage at enterprise-level and should typically be avoided. Beware of forgotten local accounts!
IAdversaries often first obtain local administrator access, after they will use this to escalate to domain (administrative) privileges.
ISome organizations choose to set the same complex password for AU local administrator accounts (for recovery). This is a very bad practice and should be avoided. Microsoft LAPS provides a solution.

SaNS

-

So, How About Local Users & Groups? ext to domain-level users & groups, Windows endpoints (both servers & workstation ) will also have a
number f local account configured. The default accounts are ''Admi ni trator" & "Guest".
Once an AD environment is set up, there's a number of items to take into account: · Local accounts are di ffic ult to manage at enterprise-level and should typically be avoided. Beware of
forgotten lo al accounts! E en if local privilege have to be configured ifs better to implement & manage the · centrally. · Adversaries ofl.en first obtain local administrator access, after they will use this to escalate to domain (administrative) privileges. Again, it i ital we can limit administrative privileges as much a possibl _ There is typical! no good reason for local end-users to have local administrator privileges. orne organization choos to set the same complex pas word for ALL local administrator accounts (for recovery). This is a very bad practice and should be avoided. Microsoft LAP provides a olution. Microsoft LAPS will generate a random password for the local administrator account for every machine in the network. This password is stored in the Active Directory.

100

© 2017 Erik Van Buggenhout & Stephen Sims

Users & SI D's

Every user in a Windows environment (both local & domain) is identified using a unique Security Identifier (SID). The SID has the following format:
S - <REV LEVEL> - <AUTH LEVEL> - <DOMAIN/ LOCAL ID> - <RID>

i
Typically" I"

'
"5" for users

'
Unique ID for computer / domain

i
Relative ID

This is an important concept, as we will discuss the SID's during several of the upcoming attack techniques. Some important RID's include:
· 500 (default Administrator account) · 501 (default Guest account) · 1000 & upwards (additional accounts created)

U ers & ID's
Every user in a Windows environment (both local & domain) is identified using a unique Security Identifier ID). The SID has the following forn1at:
S- <REV L YEL>- <AUTH LEVEL> - <DOMAfN I LOCAL JD> - <RID>
· <REV LEVEL> is typically I · <AUTH LEVE L> will be 5 for users · < DOMAIN I LOCAL ID> will be a unique ID fo r a computer or a domain . All local users on the same
machine will share the ame ID. Furth nnore all domains users in the same domain wtll share the
same ID. <RID> i a relative ID as igned to this specific user. ome well-known RI D's include:
· 500 (defau lt Administrator a couat) · 501 default Guest account) · 1000 & upwards (additional accounl~ created)
or This is an important concept, a we wi ll discuss the SID's during several the upcoming attack
techniques.

© 2017 Erik Van Buggenhout & Stephen Sims

101

Windows Access Tokens

An access token is an object that describes the security context of a process or thread. The information in a token includes the identity and privileges of the user account associated with the process or thread.

· Upon successful authentication, an access token is produced by the system. Every process executed by this user will now have a copy of this acce s token.
· The system uses an access token to identify the user when a thread interacts with a securable object or tries to perform a system task that requires privileges.
IAn interesting concept about access tokens is the use of"primary tokens" and "impersonation tokens". By default. the system uses the primary token when a thread of the process interacts with a securable object. Impersonation
however allows the thread to interact with securable objects using the client's security context.

SANS

·. . · · ·

Wi11dows Access Token An access token is an object that describe the security context of a proces or lhread. The infonnation in a token includes th identit and privileges of the u er account associated with the process or thread.
Upon successful authentication, an acce s token is produced by the system. Every process executed by this user will now have a copy of this access token . The ystem uses an access token to id ntify the user when a thread interacts with a securable object or tries to perfonn a system task that requires privileges.
An interesting concept about access tokens i. the use of"primary token "and " imper onation tokens''. B default, the system uses the primary token when a thread of the process interacts with a ecurable object. Impersonation, however, allow the thread to interact with securable objects using the client' security context. This opens up a number of attack vectors that can be us d by adversaries!

102

© 2017 Erik Van Buggenhout & Stephen Sims

WindowsAccessTol<ens ~ Impersonation
As previously discussed, threads in a process have a security token they use by default, They can, however, also impersonate other user's security tokens. For example, a user can authenticate to a service and the service can impersonate the user's security token, allowing the service to perform actions on the user's behalf.
lntrodu ing Singl ign-On:
· Wh n a user authenticate to Windows in an AD environment th y can visit network
resource without re-ent ring their credentials du to SSO · Windows caches the credential of the user o the us r doesn't need to b prompt d
for hi credentials again. · The er dentia1 are cached in the L ASS process. Windows will determine which
cred ntials to u e during SO based on the e urity token of the proces / thread
SANS
Windows ccess Tokens - Impcrsonation As pre iously discussed threads in a process have a security token 1hey use by default. ll1cy can, howe er. al o impersonate other u er' ecurity tokens. ·ore ·ample. a user can authenLicate t a ervicc and the ·ervice can impersonate the user' . e urity token, allo\ ing the servi ·c lo perfonn action on the user's behalf.
Thi. i f r example e pecially useful during ingle ign- n:
When a user autbent icate to Windows in an AD environment, they can vi. it network resource. withoU1 re~cntering Lheir credentials due to ,
indO\ ca he the redentials of th user o the user doe n·t need to be prompted for hi cred nrial · aguin. The credentials are cached in the L S pro ess. Windows, ill determine which credentials lo u ·e during ba ·ed on th security token of the process / thread
During the AD attac · overvie, , we ill further di cu s auacks again t thi me hanism!

0 2017 Erik Van Buggenhout & Stephen Sims

103

Active Directory Attacks - Overview
I Obtaining accessing to (back-up) ntds.dit file I Dumping domain credentials from local systems (memory/ cache) I Passing the hash or ticket I Stealing access tokens using Incognito I Leveraging excessive privileges (pivoting between users/ shares) I NTLMv2 challenge / response sniffing I Weak passwords / password reuse
Active Directory Attacks - Overview Advanced adversaries will often attack the Active Directory infrastructure of their targets becau e they contain the "keys to the kingdom". Once they are inside, they will focus on Active Directory: if they obtain domain admin rights, they will have unlimited acce s to the resources of that domain. Once inside. they will also try to achieve p r istence: obtain unconditional access to the administrative functions of Active Directory, even when credentials are changed.
There are many attacks possible ith Active Directory we will zoom in on some of the most common attack techniques:
· Obtaining access to (a back-up) ntds.dit file · Dumping domain credentials from local systems (memory I cache) · Pa ing the hash or ti ket · Stealing access tokens using Incognito · Leveraging exce sive privileges (e.g. pivoting between user / shares) · TLMv2 challenge / response sniffing · Weak password / password reuse

104

© 2017 Erik Van Buggenhout & Stephen Sims

AO Attack #I - Obtaining Access to Back.Up NTDS.dit File (I)
As discussed before. credentials in the Active Directory are stored in the nt.ds.dit file (encrypted with system key). This file is only accessible with elevated privileges. Furthermore, it is locked by the OS while the domain controller ls running.
Different t chniqu s could b used to obtain acces to the file:
hould th adver ary hav a1read obtain d adrnini ·trtiv; acces to lh domain, he could use tool such a th Volume Shadow Copy ervic t reate a read-only copy and steal the fi le; · Badly · cured back'Ups of the domain controller dri es (e.g. open n twork shares) could allow an adversary to extract the file without administrative privileg s·
pecialize<l, ope11·sourc , tools can be used to extra t hasbe. from th ntds.dit fi le. The e hash can b u ed in uh quent Pass-th -Ha h atta ·ks or ven be racked u ing offlin passw rd crack c
0 ttack #I - Obtaining ccc. · to Brack· p TD .dit File ( I) Advanced ad ersaries , ill often anack tJ1e Active Directory inrrastrucrure ofrheir targets be ·ause th contain the ''keys to the kingdom''. On e they are inside, the will focus un Active Directory : if they
obtain domain admin right the will ha e unlimited access to the resour e of that domain. nee in ide., the will also try t a hieve per ' istence: obtain unconditional acce to the admini . trative functi ns of
ctive Directory. even when credentials nre changed.
There are many attack po ibl wilh ctive Dire tory . Here e want to focus on attacks to obtain credential and/or access. As we aw, the A ·tive Dire tory database is 1ored inside a file called ntds.dit.
nd the ha ·hes are protected b) an encryption key tored in the · stem registry.
When an adversary obtains a copy of these file he can exrract hashe and reco er password , amongst ther thing .
These files are prese111 on a domain comroller, but \ hen the domain ·ontroller i up and running, lhes files are in use and cannot be copied. Ther is a workaround, however; shadow copies. Shado\ opies (aka V , lume nap hot c1 ice is a Micro oil technology to reatc local backups of file:. llti technology can be used to reco er backup c pie f lhe ntd .dit and TE file ..
adversaric: · don t always need access to a domain c ntroller to obtain lh'se til . When centr. li z d ba1.:kup are madt: of th · domain · ntrollc . these files ,viii e ou.nd n the backup ervers to It i. important to adequately protect th e file , ven in hockup .

© 2017 Erik Van Buggenhout & Stephen S ms

105

AD Attack #I - Obtaining Access t o ~ NTDS.dit file (2)

,..,,"9 ...,.,, - l·J lttl' LoaUWIIQI 4"1911""6 .

J·l ~ l!J ··mt~·

~ i i '"1"1.1c.t.-.Ii,St·.

I) · ,1111\~t r

lE:,,.,

Jj

ev ·· tt\· .,, 4.lt9{"\ot·,

Dol fltf\tl.i9,flQ.
l 1 J ~ \ 0 1 ' 1 9 11,,11·."" l·I Sc lno . , . , _

{t) ll "ft'-"Q '

i"II 'S

l·J

ll'f\1 a··

"'·'"'*~' I, I S.-H, rr,,.,;l ·

I' I

rt,,tr· .,. . .,.. t"'ctn I ..Cf\llM )OJ· UI rn.

I

·°" Sc- ...,.,,, Id· , IS, 14"!
"'l·"-" l9'CC ,1 I(.,... l·i

it~ \ ·· t O VMI'

· 1J11t U 11 .a.ncOMUit\N'\t t

t rttnr,~

Open source tools exist to extract hashes from the ntds.dit database and decrypt them with the system key recovered from the SYSTEM registry hive.

D ttack #I -Obtaining cce to Back- p TO .dit Fil (2) nee an adversary has obtained a copy of the ntd .d1t and 'Y TEM Jilc. , he can pro eed to the extraction of hashes and recovery of password.. Th re are vcral open source tools that can read the c tiles and decrypt ha he : example are n1d xtract and cretsdump. For large database (len thousand and more u ers), ntd lract tend lo be low (can take e era I da ), but secretsdump is much faster (a couple of hours). Both can output the NTLM hashes and LM hashes (when pre cnt) in different fonnats.
In this example, , e output the TLM and L hashe in a fil onnat that can be read into John the Ripper, a popular P based pa sword racker. A pa sword cracker is a lool that takes hashe as input and tries to recover the cleartc L password by perfom1ing dictionary attncks. brute force alla k , and blended attack. . blended auaci.. i a dictionary alla k where password 1ran fonnation rules are used to try out diffi rent combinalions. For example, if a di ·tit.ma!) c ntains the pa, s, ord s cret, then in a blended attack, variants like seer LI would also be tri d. This is governed by a rule that append I to eact pa sv ord in the dictiona . , for c ·ample.

106

© 2017 Erik Van Buggenhout & Stephen Sims

AD Attack #I - Obtaining Access t o ~ NTDS.dit File (3)

._._n~- .,..,__

.s bo ·

,- 0 · 0· 0

l'>l·'·· o r · 1 1 1 m - ~ , 1 - - 1 ~ :S·l ~-ll·Jlll81?7& ~llJ.4 .· ·4711 ~·'¥7

.SGQ;:

""'"'I :~l@f<el~ ,21.... Jt1,rl51>~14~··:S·l ·S·?h·tse,1 ~:;~ 2":33·2'~2-'11.ll06991·1Ul!n

\n·lfl i¼~···1B7~\ii7~11S'l,, :~-1 -~ ·71 ,lfiBl17~-7<nn·290·4711Qfig97 · l1flll I:

, a,..,6'11 , S,fNL.-:-rc-ol9":?:c.16d· ~l!ibS.1.41iil·· ! S. l ~ 2.~ · >1 U18"'1G·29l'S"l419,04 ·:,\l~7 · HM ··
_,,.,,,nas·rd<6"<<~l-~~r·i)al :s .l ~ - I J \6¥17~3~· l!llnA2142·01 l - l · lllt r:

-,~~~··a: t-·· ·M ,~~~1~1$

dulo/tu .Jatw, ,G1Jt
9<d'4J8:U7-9rn42Aln·.i.f'

:,

,t

..
~-11 -11BB1nno-n;.;"n·2 ··211e

mg? .S(le ·,

_ , _l889·\lool :11trt·n10010111>Et-"Sot9r~n&o_, ·~ 1 $· 11 , 1m 1nl<J-,~1ni.-.,2 .41

111.16997 ·1091 ; ,t,tQ<:tq1 J!l,31oft 11._,_,~·<llfctl Oloe-f-8:6 · 1· '·2 1·ll111!117830 ·29333''l94l ··21Hl6"'' ·S0

'" · <111.iNltJ:...e - <l<--1176fla,,- ,s ) ~- 21 11 1'7llJ·Hl9D.41U·2· i ll""997 II
,t,··
~··· > '112;S1tll~-~·1<Wi!86d71fd66Se0~·:S·l ?I 31118177833 · 293334:/1142 4211-1 · 11

In this example, we extracted LM hashes and NTLM hashes in a format that can be fed to the password cracker John the Ripper.

D Attack #1- Obtaining Access to Back-Up NTDS.dit File (3) In the example above, we can see the first 5 lines of the LM and NTLM hashes for password cracking with John the Ripper.
Each credential is stored in a line, and : is used as a field separator.
The first field is the username (We see Administrator, userO I, user02, .. .), the second field is the LM hash, and the third field is the SID. The SID is the Security Identifier of a user (or computer). It is a unique number that never changes (a usemame can be changed). This is what Windows uses internally to identify users and computers.
We see that the LM hash is just a string of hexadecimal haracters, while the NTLM hash is a string of hexadecimal characters prefixed with $ T$. This is hO\ John the Ripper works : a string of32 hexadecimal characters is assumed to be an LM hash, while other bashes of 32 hexadecimal characters (like TML) need to be prefixed with a tring that indicates their type: $NT for TLM .
John rhe Ripper i a popular password cracker that can perform dictionary and brute force u ing the CPU or the computer.
Another popular password cracker is 1-lashcat. Hashcat can use the GPU Graphical Processing Unit e.g. graphical card) of computers, anJ be much faster than John the Ripper because of the parallel computing features ofGPUs.

© 2017 Erik Van Buggenhout & Stephen Sims

107

'
AD Attack #2 - Dumping Domain Credentials from Local Systems
'
Once adversaries obtain administrative access to a local system (e.g. through one of the privilege escalation techniques we discussed before), he could now leverage this to steal local credentials:
Windows endpoints by default store the last IO used domain credentials in DCC format. This is used to authenticate known users when a connection to the domain controller cannot be established. These can be extracted by for example Metasploit.
While domain users are authenticated to a system, their credentials (hashes and sometimes clear-text passwords) are available in memory (lsass.exe process). Ttaese can be extracted using well-known tools such as Mimikan.

SANS

.

.

AD Attack #2 - Dumping Domain Credential from Local ystem Once adversarie obtain administrati e access to a locaJ ystem (e.g. through one of the privilege escalation techniques we di cussed before), he / sh could now le erag1:: this to steal local credential :
· Windows endpoints by default tore the las1 10 used domain credential in DCC fonnat. This i used to authenticate known users when a connection to the domain controller cannot be established . These can be extracted by for example Metasploit. As an important side note, it s important to understand that this is a dedicated format for caching (and can thus not be used / abused in the same format as an TLM hash).
· While domain u ers are authen1 icated to a system, their credential (hashes and ometimes clear-text pas words) are available in memory (lsass,exe process). These can be extracted u ing well-known tools such as Mimikat.z.
Again, both of the e attack strategies require local administrative acces to a stem that is already part of the domaJn.

108

© 2017 Erik Van Buggenhout & Stephen Sims

I
AD Attack #2 - Dumping Domain Credentials from Local Systems (Mimilcatz) (I)
Mimikatz is a free open-source Windows tool bui lt by Benjamin Delpy (@gentilkiwi) to extract credentials from Windows computers. Its second version is often referred to as "Kiwi".
"Mimikatt Is a cool I've made to learn C and make somes experiments with Windows security. It's now well known to extract plaintexts passwords, hash, PIN code and kerberos tickets from memory. Mimikatz can also perform pass-the-hash, pass-the-ticket or build Golden tickets."
Due to its high reliability &flexibility, it i used by adversarie and penetration tester alike. S veral variation have been created and it ha been included a a module in th Metasploit Meterpreter atta king tool.
SANS
AD Attack #2 - Dumping Domain Credentials from Local ystem (Mimik11tz) (1) Mimiltatz i a tool that has man feature and fimctions fore ample e ·tracting hashe from the L A
proces~ lsas .exe. h i a free, op n- ource indo, stool. de elop db Benjamin Delp_ ( \l itter
@gentilkiwi). It ha · many feature : · E tracting hashes
·. tracting pass, ords xtracting ticket· · ·xccuting Pas ·-rhe-Hash atta ks · E ·ecuting Pas ·-the-Ticket ~Htack encrating g Iden ticket
Several of these features will be explained later. Becau of all these features, ond constant updates with new features and support for n Window ver. ions. imikatz has become the most popular credential tool used by red team and ad crsarie .
Mimikntz has 3 omponents (in 32-bir and 64-bit ver i ns): l. Mimikatz.e e: this is th, executable, c111u the cons le that interacts with the user
imilib.dll: thi i the dll 3. imidrv.s : thi i the kcm I driver, necessary for foature that require acce or m difi ·ation to
kernel data
Becau e it is ery pmverful and open source, it has been transformed b_ hackers and malware authors for ariou purposes. I t of anti- iru program detect tJ1e mimikatz.e ·e executable. Becau e this po es a problem to pent· ters, file-I s versions have been d vdoped, that launch dir ctly into memory from variou cripting platform , like PowerShcll.

© 2017 Erik Van Buggenhout & Stephen Sims

109

AD Attack #2 - Dumping Domain Credentials from Local Systems (Mimikatz) (2)

·

· ··

ii.,.,, aWlk a 1 1..t.:l l·"J 0..,1) ~ lt.iin-

JJ:4. (ll

IJ - H · ' L<11 ,_\·· &
· ,·· ,-~f'I I \ ·· I' · · ot-l,,.,. , ...,,u ""' C 04>0J "
· ·· 'If n: · ti.n p.~(I~ bl,. f PllitO vi .t"-.lt\C·h "1 .it~

sh,__, CGIII'
(iM ·.-.·
I --"ul,it" · '" · ,

llll -.,.. ._ ,. · ,..,.h,1U'" : d4h& ·,-tvll,u· ' W ' 09'

Executing command privilege::debug to enable the debug privilege .

··+< · 11Jr1..~ ffltil' ·

~"fb,n,S:,U'i f A·1ed1 ' 1 ~ ··

l!<

1+,v, tit1\K 9'6udYt4l..J'i-0'la(4·i.tsll,,dt,,J·,di

n l·· e 1 t k ,tcJ, lti·Z~... ,..J.-r.ll11~\

"\ · 11 ·\.9<c~l---·~M1ittlH·"'1

·

I f1(.t,c-

it,f \Mt4(1t 'W P

· i.O.tll· I

11 .)1J.11e.t.a"°ballll N l t,1'11.-fd~tSII\

6J H WdO<.JontdJ..9IUU·M-I

8' OIOtc l ehb.!Wc.-'Hl i tclf bc: U db l H

1i11111 17\kA;d....Sllri,l,d' 1Jl(dd,,l-9s1u

-~ '1llh:.Udcl.1

.c Jt"fdlu6'SM, ',f,\J_.,

r ht,_.f t · ·-U

'r"4.l

·Ulff--·l-11>>1·1 · f}d.,a.,, H ) . o l J ~ , b ,i..d,

01h0:,l1ditlbfl-4 IJ6Uu tlJ<tll f-"&»·,

·~ ftc llttlt 8(0Jt'illLil iM)OJO H 'SfAf',

Executing command lsadump::lsa /inject will dump the hashes from the LSA process {lsaass.exe) .

SANS

AD ttack #2 - Dumping Domain Credential from Local y ·terns (Mimik11tz) (2) When mimikatz i launched, a banner is di ·played and the user can start to type command~. ommands are grouped into modules. command ha t be pre ti cd with the module name followed b, :: (e ept for th sl.andard module). In lhe e ample abo e, command privileg ::debug i e ·ecuted. pri ilege i the name of the module, and debug i · the name of the command.
A normal u er can access all the proces e: (including their memol)) that run und r his u er ac ount. He cannot access th memory of pr ccs e running under other user . like sy tem ~ re ample. An administrator can acce s all th· processes, including processes running under other accounts. This is possibl because administrators have the d bug privilege. Ha ing Lhi. privilege is a mandatory requir ment to a ·ce the mem I)' of s tern pro es e , for example.
Besides ha ing the privilege. the privilege als ha to be "enabled" before one can use this privilege. Many Lo Is (liked buggers) do this automatically, but with mimikal7., it is oprionol. The command privilege::debug ha · to bee cuted to enable lhe debug pri ilege.
odule I adump contain e cral commands toe tract infonnation from the Local ecurily uthont proc 'SS. The I a command \ ill c tract hashc and other ecrets from the L A pro ess. II requires adm in rights. and the debug pri iiege must be enabled.
There :m., two meth d to eX1ract hashe from t.he LSA pro ss. pt ion /patch will modif) Windo\ c de to be a le to dump ha hes. and option /inj ct ill inject c ·rra code int the L. proces Lo dump hashes.
In the . creen hot ab ve. we see the use of Mirnikatz· I·adump::I a command with option /inje ton a domain controller. his command \ ill dump hashe for all users in the cti e Directory domain managed b lhi domain controller.
The lir ·t line gi es u the domi.lin: EC · together\ ilh the ID fthe domain. n1e ecurity ID oflh domain i the tring that start ""ith -1-5-21- .. .

110

0 2017 Erik Van Buggenhout & Stephen Sims

After that, Mimikatz dumps hashe · for each u er. The RlD is the Relative [D and is appended to a ba e ID. In thi example, it is 500 because the account is th Administrator account (local Admini trator
accoun and Domain dministrator accounts ha e RID 500). Th lD of the Administrator account i the concat nation of the domain ID and the u ers RID: -1-5-21- ...- 00.
Then the primary credentials are dumped. In this example, e have the NTLM ha h (986 D7B028 259 4C4E2 D!7109D 05) and the M hash (). The LM hash i empty because thi is a Windo 2016 erver domain control! r: by default, storing LM ha hes is tum doff
The following NT M ha hec; Are lhe pas word history hashes (used to nforce pa word rotation).

© 2017 Erik Van Buggenhout & Stephen Sims

111

AO Attack #3 - Pass the Hash & Pass the Ticlcet (I)

II

Whenever authentication is required. Windows applications ask users for the cleartext password, then c.all APl's (e.g. LsaLogonUser), that convert that password to the hash value. This is then used in the authentication process. Analysts has revealed that these APl calls can be "skipped'' and thus only the hashes can be used as a basis for successful authentication.

Pas -the-Ha h affect all Window ystems from Window 2000 to Windows 10 2016! A wid variety of open-source tools support PasstheHash attack , i11cluding:

· Meta plait exploitation framework ( .g. u ing P Exec) · Mimikatz · Windows redentials Editor
I us(!) Microsoft released an optional patch that only partrnlly solved the Issue (Advisory 2871997 from 2014). It does. however, not provide full protection. Since Windows IO and Windows 2016 -enterprise. Microsoft is trying to increase the difficulty of obtaining hashes in the first place (using Credential Guard)

0 ttack #3 - Pass ihe Ha h Pass lhl' Ticket ( I ) Ir we go ba k 10 thee planation of' NTLM , uthenti at ion challenge/re ponse), we., remember that it i ·
actually lhe NTLM hash of the pa ·sword Ihat is used lo calculate the re pon e. and not the pa , ord it. elf.

Thi· mean · that ifwe can obtain the hash ora pa \\Ord (and n t the password it lt), we still mu t be abl to a\lthenticatc. A pass th hash attack is e ·actly thi ·: a tolen ha h for i;;xample extracted from the A tive Directory database) is u ed to authentic tc.
ror This cann t be done just u ·ing built-in Windows utilities or commands: ·there is no command ( example
net u e) that will take a hash as an argument instead of a pa sword.

But there are ad ersary l ols a ailable that ul low the u e of a hash to authcnttcatc (fore ·ample Window rcdential Editor and Mimikatz). hese fall into two categoric·: tools that implement the NTLM
auth nt-ication algorithm and take a hash a input, and tools that inject a hnsh into Window mcmol) for use by build-in Windows TL I authentication. The advantage r; ran adversary to u ea pass the ha. h anack is that the pas word is n t required (e.g. time-consuming password racking i, not nee s ary).

Pr tecting a in :r pass-lh ha h an.acks is virtuoU~ imp ible: 1he hash i~ ust:d in TL authentication and

i the only secret necessary to cal ulate the response. It can only be protected again t b preventing the use
or TLM authentication, or by mak.ing sure hashes an not be obtained. Kerbero authentication with tickets

i the auth ntication mechani m that replac s TLM. nfonunalel~, there are many cases wh re Kerb r

authentication cann t w rk and then Window. fall ba k to T M authentication. It is possible to di able

TLM authentication via the registry so that only Kerberos authentication can be used, but in our

e ·perience, this is not a iable option for corporate net orks. orporate infrastru ture has Lon man_

" lega ~" ystem and application that require

authenti cation .

Microsoft released an optional patch that only partial I so lved lhe i ue ( · dvisory _ 71997 fr m 2014 ). lt doe however not provide full pr tection. as it only pntects again ·t PtH a11acks Ii cu d on lo al a count! ( o not domain-level a count ) D not the default RI -500 lo al admini trator account.

112

Cl 2017 Erik Van Buggenhoul & Stephen Sims

With Windows IO Enterprise and Windows 2016 Enterprise, Microsoft introduced a technology called Credential Guard: with Credential Guard properly implemented, typical hash extracti.on from the memory will be topped. ote that this requires that all ystems in a corporate environment use Windows l 0/2016 enterprise without a single exception, otherwise hashes can be stolen from those ystems that do not use Windows 10/2016 enterprise.

© 2017 Erik Van Buggenhout & Stephen Sims

113

AD Attack #3 - Pass the Hash & Pass the Ticket - Example

!.

...... nun·· :r, · 1 1 -..1a""" M\ ,, nu t1 .cu

... ,... , " H H

,i

\t~· II I ..-.;·

ff \ ,. =~~l:v-fl""'lr.:~!!ttMf·t-~~·~111~1·:.. ._1

--. · .... ,. -.,Ja._ ··· ,

·:r·U·b·,rl<itit ...., ~

ru11i1U"P 1'f Of

.1..,uu · ..tir.rh-~ p:l~
..,...... ... .~.,.M..,.ITll>f!,',l.#1dll)
,o-. ~ ~ .,,,w~·

,...., , ..... P'l ·~-\J+ ,.,.,. ... /" II · J11l,l\dl5M,. . .

~ :: , _ _ _,_,,.,~ d-t

t ;tt, I

: :!! .::.... n - tvtl

· t

! UHOI 'llffl l (...........».1~

\,.. M .ljl ' t

....._. tef,y I NIDIHlllo Ol t

"-~ - .,.....,.. "M-t· C-41C1ftt I MOKli

\\.. .~..,n~_,~..._

· ....u llilifU.

\\\... .~H,.,"..,·.,.,_,._. .·..lt·

4lr 0&"

\.. ""."..'...,.....c.,..·.".,'.-_".·9
\ .....,...,· .....,....,... > rwu

PtH with Mimikatz In the example on the left.
Mimil(atz is used to perform a PcH
attlcl< against our target system.
In the first step, Mimikacz is set up
with debug privileges;
Afterwards, a previously stolen NTLM hash for user "root" is Injected and used to spawn a
cmd.e><e window.

~s

. .

'

AO Allack #3 - Pn s the Hash & Pa s the Ticket - E ample MimikaLZ is a tool that aJlows u ·er to execute pass-the-ha h attacks by injecting: hashes inlo Windows
mem I) .
ln the c ·ample ab ve, Mimikatz i · executed as admini trator and the debug privilege is enabled (privilcge::debug command). Thi is neces. ar becau ·e Mirnikat1 will\ rite into the LSA proce to injccl th h h. Thi cannot be done without administrati e right .
The Mimikatz command to slnrt a pas -the-hash anack i sekurlsa::pth. It ha. J mandatory argument : the username (root in our example). the domain name {sec599.private in our e ·ample) and the TLM hash {El 9 F75EE54 06806 51J07 F 13 EF4_ in our example, hi h i the TL ha b of P@ , Ord).
WiU, thJ infonnation, Mimikatz will launch a command-line prol!e s (cmd.e e) hile opening the L A process memory 10 inject the ha h we provided for the c ·urity tok ns u ed by the cmd.exe program.
This md.exe program i running\ ith the injected credentials, and if\ e , ould use a' net u. e ·" command ( ithout pro iding redcntial.) I connect to a remote horc, the TLM chall nge/re pon e would he e-xec11t d with the T M hash we injected, and thu e ·ecu1e a pa:s:s-1he-hash attack.
Program starred b 1hi cmd.c. c proces will also inhtiril th injected credential .
The ekurlsa::pth command can also be u ed to start other program · than cmd.cxe.
Cred ntial Guard will protect again t p -the-hash anacks "ith tool that inject the ha h into memo!) becau e reading/writing the credentials in memory is no longer possible (cfr. next chapter). But of cour. e, thi r'quires that all your Windows machines mn Windows I0/2016 ~nterprist:.

114

C 2017 Erik Van Buggenhout & Stephen Sims

AD Attack #3 - Pass the Hash & Pass the Ticl<et (2)

Ill

In a pass the ticket attack, access is gained to a resource of a system (for example the administrative share) by using a Kerberos ticket that was generated or obtained from a compromised machine

·1._.,.cr · ,,.,.t4il"O, 1~r,:

,-,oi,·· , n,,,..,. ·· .-.,..:.,. Tlf of' <"".f"f"t t9't01111"'11 'U,.j,rf ti.,d,/ t

0

u1·111,u S!J!,.U J Ul.-?ll1bt H J.11; 41

<., ,.,.,. ., 1- · '-"a·'--- (N iii "1.f' 1,f..,.. Mf , ~'I , M"<t M i · 11

... M'Ci!-!l:

~

t:t9t · t -su ;,,uv11ct1:

(.1,u-M ~ '(·U . . .llllht!l'f.1,.., ~ I ~.(._.. ...l'v Aif

fllft'I. ...,....
,..UlDI"> t..v

,..__U,..$ubu , !ff'· .w1~, i lllh1.· 1 1 .........i:ih · f!Df'~· ~

·~

n Mt2H_,..,

····1:a,,Jon,u1

, u11 :rr .1 ·1r11i1 11u ... .......o

ni:1.wc.

~u ~-

· .,,.... ·

I . l

d t(J.1·-n -, o...-._. ··s··

"°" - . \ l'!-·~U _..17,u ,._,. -tMlfl.u.tl: ""' · tlol!·tl>· :tf tt lJ.tii 1,t · lltt:lf . t~J · :t\,1\./ · ~" l 'll·J.1 1·i!.S!~7

..._

Jf'ttt.111.r~u. . ,..,~..... !ile$9Q ,., U

.,.._.-v-,r,, · OtP -....,

t ...,.htr.-t t I<... NJd'l.

·l,., ··11
· ,,., a- hii.

·

-'~*~·hf· ·
..,_,.., i,.,.,,.,,c

~

c

t

'

"

ut"Un.wlitl....;.,-~1't

.wn,.w.··1wt i11on

k ·
. , . .,

,. I · U . -,-.i.t

SAN~

PtT with Mimikatz Pass-the-Ticket affects all Windows platforms relying on Kerbcros. A good example of a tool that support Pass-theTicket attacks is Mimikatz!
In the screenshoc on the left, we can see
Mimik,iu in use on a compromised machine. where it 1s auempting to export & store available tickets.

0 ttack #3 - ra.s the Ha h & ras th Ticket (2) . ince tickets can be u ed to obrnin acces to a service or request other tickets, it should be no surpri e that adversaries found out way to teal and reu e tickets. uch an allack is called a pa -the-ti cket attack. ad ersarie obtain exi ting tickets (preferabl) ticket-granting-1ickers from admini trati e accounts) b. ex1racting them from the memory of compromised machines, and then u ·e lhem to gain acces to other machines. There are open source a1tack tools avai Iable to extract tickets and execute pass-the-ticket atta ks.
Abusing a ticket implies that we are abu. ing Kerb ros auth entication and authorization: the advantage for an ad er ary to use an attack with a ticket i that he doe 1101 require the pas word or the hash of the compromi ed account. Just a ticket.
With Mimikatz. we can display the TGT by using command 1,.erbcros::tgt. As you can see from the
utput, the crvice name i krbtgl for domain ec599.private (hence it i :1 TGT) and the client name is dministrator at domain sec599.private. o, this i a very aluablc ticket to teal: it is the T T of the domain administrator. This ticket will provide access Lo all resources o the domain. From th start and end time, we can ee that this ticket is valid for IO hours. To btain ti1is ticket, th mlversari need to have (local) admini ·tr:ni e acce to a mu !tine "here the d main admini trotor i I gged on. This ticket can be exported to a fi I · for example. For this we i . ue the rnmand ''kerberos::li:.t /export": thi v ill export all tickets to a file one for each tick t) in the current directory.
\ cam, I elect the name for the ticket , it is imikalZ thal d cides the name based on metadota like lhe uscrname. Tickets generated by Mimikat1. use tho extension .k irbi , but an. extension can b used for a pru S·lhe-tick I atta k.

© 2017 Erik Van Buggenhout & Stephen Sims

115

AD Attack #3 - Pass the Hash & Pass the Ticket (3)

golden . tic et.bin

OK

k·rberos: : list

(88880888) - ex00888817 - rclf_hmac_nt

Shrt/End/HaxRenew: 10/07/2817 18:88:29 ; 8/87/2827 18:88:29 8/87/2027 18:8

! 29

Ser-ver Nae

krbtgt/sec599.private@ sec599 .private

Client N 111e

root@ secS99 .private

Flags lf8e80000

pre_authent : initial renewable ; forwardabl

SANS
AD Uack #3 - Pa s the Hash & Pass the Ticket (3) Once we have exported the tickets, we can now also load them: E ccuting a pass the tickel attack with M,mil..atz is easy. In thee ample abo e, we ha ea ticket in the file golden.ticket.bin. To u.e lhi tickeL. we i ue the command Kerbero ::pn golden.ticket.bin. Thi inject · the ticket into Windows' memoT), ready to be used when we attempt to connect lo a ervicc.
The Kcrhcros::list command can be u ed to Ii tall the ti kets that\ have. c can see that the ervemame is krbt1:,rt/ ec599.pri ate: this tell us that thi i a ticket-granting tick t for the ec599.pri ate domain . The user is root of the ec599.pri ate domain.
If we look at the tart and end da1es, we see 20 l7 - _02 7. That's an c. tremely long period for a ticket: I() years (remember, !he default lifetime ofa T Tis 10 hour ·). That's hecause her , we u ed a olden Ticket (more detail on this later).
m , hen we try to connect 10 a hare fore ample, this injected ticket will be u ·ed to obtain a ticket to th hare we , ant to acce (this require crbero · thus e need to u e the Iii . erver name t acces , and not its l P addre s, as this would result in NTLM authentication which does not work with tickets).

116

0 2017 Erik Van Buggenhout & Stephen Sims

AD Attack #4 - Stealing AccessTokens Using Incognito (I)

Windows access tokens are at the heart of Microsoft's authentication & SSO model. They are managed by the Local Security Authority Subsystem Service (LSASS). Once the adversary obtains administrator privileges, they can steal available tokens in LSASS!

· Token-stealing techniques were explained in detail by Luke Jennings (2008 - MWR

InfoSecurity). He also developed Incognito', a tool that can facilitate the extraction of

tokens from LSASS once local administrator privileges are obtained.

· These tokens can be stolen and subsequently reused against other systems in th network!

· As many others Incognito has been built in in the Metasploit framework (as part of the

Meterpreter) !

D

Want to know more? An interesting local privilege escalation technique in Windows will allow adversaries to escalate from ''service accounts" to "NT AUTHORlmSYSTEM''. thereby "generating" &

stealing tokens! The technique has been dubbed "Rotten Potato''.

-.
. ·SANS

.

-

-

.
_

~

.

·. '

·

AD Attack #4 - tea ling Access Tokens Using Incognito (I) Windows access tokens are at the heart of Microsoft' authentication & SO model. Plea e refer to the previous ections of this cours for additional information on how Windows Acces Tokens are used by Microsoft:. In hon, tokens are managed by the Local ecurity Authority ubsystem Service (L A ). Once the adversary obtains administrator privileges, they can steal available token in L A SI
Lule Jennings (MWR Info ecurity) published an in-depth analysis oftoken,stealing technique in 2008. He also developed " Incognito'' a tool that can facilitate the extraction of token from LSA S once local admini trat.or privileges are obtained; · These token can be tolen and subsequ ntly reused against other systems in tbe network! · A many other Incognito has been built in in the Metasploit framework (as part of the Meterpreter)!
Want to know more? An intere ting local privilege e calarion technique in Windows will allow adversaries to esca late from "service accounts'' to·· T AUTHORITY\ Y EM''. thereby "generating" & stealing tokens! The t chnique has been dubbed " Rotten Potato". For additional infonnation on the " Rotten Potato" attack, please refer to the following article:
https://fi xglove ecurit .corn/2016/09/26/rotten-potato-pri ilege- scalation-from- ervice-accounts- lnsystem/

© 2017 Erik Van Buggenhout & Stephen Sims

117

AD Attack #4 - Stealing Access Tolcens Using Incognito (2)

merewrerer > gewid Server username: NT AUTHORITY\SYSTEM ~ > use Incognito meteepreter > list_tokens -u l"'.] Enumerating tokens
r:I Listing unique users found
Deleg:itlon Tokens Av:iiloblc
========:;=~======-~-====-==-- .
SECS99\Adminismu.or
NT AUTHORITY\LOCAL SERVICE NT AUTHORITY\NETWORK SERVICE NT AUTHORITY\SYSTEM
Impersonation Tokens Available
====-=====-============--=====.:=:::=---
NT AUTHORITY\ANONYMOUS LOGON meterpreter > impersonate_token SECS99\\Administrator
mererw:eter > gewid
Server username: SECS99\Admimstrat.or
SANS

Incognito Meterpreter module The output on the left provides an insight in the working of the "lncogmto" tool. In this specific c;ise. it is being ran from a Meterprecer prompt using the "list_col<cns -u" command.
We can see that the "SEC599\Admin1stracor'' account is available, which is most likely the default Administrator account for the SEC599 domain.
We can then use Incognito to steal the token & Impersonate the vicam user using
"impersonate_tol<en"! No hashes, no cracking. nice & easy token stealing!

AD Attack #4- tcaling cccs Tokens sing Incognito (2) The output on the slide pro ide an insight into tbe working of the "Incognito" tool. What we can ee i the following:
· The adversary checks hi current privileges on the system using the "getuid'' command · The adversary loads the incognito module in the meterpreter · The a ailable acce tokens are listed u ing "Ii t_tok n -u'' · The·· ECS99\ dministralor·· token is found & impers nated u ·ing "impersonale_token·· · The adversary conlinns his tolen privileges using lhe "getuid" command
o ha hes, no era kmg, nice easy token tealing!

118

© 2017 Erik Van Buggenhout & Stephen Sims

AD Attack #5 - Leveraging Excessive Privileges (Pivoting Between Users/ Shares)
Due to its size & complexity, it's often difficult for administrators to retain a good overview of how privileges are assigned across the environment. Adversaries can leverage this to spot excessive privileges which can be used in lateral movement...
Group: Workstation admins
AD Attack #5 - Leveraging Exce sive Privileges (Pivoting Between lJsers / Shares) Active Directory Attacks - Domain Adm in Rights Du to it siz & complexity, it's often difficult for admi11istrators to retain a good overview of how privileges are assigned across the environment. Adversaries can leverage this to spot e cessive privileges which can be used in lateral movement... Once (limited) administrator privileges are obtained (e.g. on all workstations but not on servers), adversarie can start hopping from one system to the other in an attempt to steal credentials from different hops thereby escalating privileges as they go along. An example would be a domain administrator that is authenricated to one of the workstations under the control of the adver ary. The adversary could go to this workstation and dump the credentials from memory using Mimikatz. A tool that facilitates this attack i BloodHoundAD. \ hich generates a diagram of acti e essions and relationships in the active directory. On the slide above, we can see an e ample of such a diagram: In a few step. Erik could easily teal th hashes of Stephen. thereby obtaini11g Domain Admin pri il eges.

© 2017 Erik Van Buggenhout & Stephen Sims

119

AD Attack #6 - Sniffing NTLMv2 Challenge / Response

·
Client Workstation

The NTLMv2 Challenge/ Response mechanism we discussed is vulnerable to a sniffing and offline cracking attack. Let's reiterate NTLMv2:

l®·llt44illlid#3H¥lil·l,

~

om@./¥

· ·IJ4M·iM-

-

.;14#@1¼4.\,t IM·i·iMitMiM,iW

Service Database Server

Domain Coni:roller

si~s

As previously discussed, the Client uses the password hash to create a response
to the challenge sent by the Server

If the adversary could sniff the challenge / response. he could launch an offline
cracking / password guessing attempt!
-- - - - -

AD Attack #6 - Sniffing TLMv2 Challenge/ Respon e Another attack technique invol es the tricking of systems to send NTLMv2 chal lenge/ re ponses to systems under control of the adversary. If you recall the TLMv2 challenge / response method, you might remember that the re pon e 1o an NTLMv2 challenge i created based upon the client challenge and the password hash of the user. Once an NTLMv2 challenge / response is niffed, it can be fed to a passwo rd cracking tool such as Hashcat or John.

120

© 2017 Erik Van Buggenhout & Stephen Sims

AD Attack #6 - Sniffing NTLMv2 Challenge I Response - Responder
Listening for events . .. 1 ll OS Version
R Clien V rsion NTLMv 1 Client
NTLMvl Uc;ername NTl.Hvl Mast,
OS Version Client Version
Responder Responder is (amongst others) an LLMNR. NBT-NS and MONS poisoner. It will attempt to trick systems to connect/ authenticate to the system it is running on . It will then attempt to sniff the authentication challenge (e.g. NTLMv2). which could be cracked by a password cracking tool.
SAN~
'
AD Attack #6 - Sniffing NTLMv2 Challenge/ Response - Responder A tool that has implemented this attack technique i Responder. Responder is an LLM R, BT-N and MD S poisoner. It will attempt to trick systems on the network to connect / authenticate to the system it is running on. It will th n attempt to sniff the TLMv2 Challenge / Response, which cou ld be cracked by a pas word cracking tool.

© 2017 Erik Van Buggenhout & Stephen Sims

121

AD Attack #7 -Weak Passwords / Password Reuse

Although not an "advanced" technique, organizations still often make mistakes against this basic principle: ensure strong, unique, passwords are used for all accounts in the Active Directory!

Typical is ues related to w ak password / password reu

· Static (never expire), easy, passwords for "service" account Reuse of password for local Administrator account (allowing password spraying)
· Weak password complexity configured on AD level · Bypassing of password complexity settings by IT administrative personnel
I Although technical controls can help, the selection of passwords is ultimately a user responsibility. Security awareness is thus a key control. Some organizations even perform periodic password dumping & cracking against their own AD. Any passwords cracked in a reasonable timeframe are then "flagged" for change.

-

SANS

_

--:.-. .· _ . ·. . .

AD Attack #7 - Weak Passwords/ Password Reuse Although not ao " advanced ' technique, organizations still ften make mistakes against this ba ic principle: ensure strong. unique, passwords are used for all accounts in the Active Directory! hroughout our careers as cyber security professionals, the course authors have observed the following typicaJ issues on a frequent basis:
'Technical" or "Service' accounts that are configured with a weak static, pa word ("never expire''), often even with administrative privileges! · Use ofth local administrator account as a ''recovery" account with the same pa sword on all Windows hosts; · Overall, weak pas word complex ity settings confi gured on AD/ domain level:
· Even if strong password complexity settings are configured, c' e seen IT admini trative personnel
circumvent / bypa the control s for their own accounts!
As a conclusion, e'd like to note that, although technical controls can help the selection of pass\ ords is ultimately a user responsibility. Th is means securit awareness is ofparamowit importance. lfu ers are not convinced of the need / value of strong password election, they will find a way to configure a weak password th;:it me ts yo ur technical c mplexity controls. E en worse: they might select a strong password but then store it in an insecure way(' password.txt on the Desktop"). NIST has an excellent password standard that can be used to provide some in ights in what a strong password looks like_
ome organizations have implemented offensive techniques themselves: they perfonn periodic password dumping & cracking again t their own AD . Any pass ords cracked in a reasonable timeframe are then "flagged" and u ers are forced to change th m.

122

© 2017 Erik Van Buggenhout & Stephen Sims

What's Next? - AD Persistence - Active Directory Attacks

Throughout this section we've discussed a variety of techniques that are used by adversaries to move laterally through a Windows environment and obtain administrative access. Remember that our adversaries are persistent and would like to persist the access they achieve!
We will now di cuss a number of techniques that are used to consolidate/ persist administrative access to the AD:
· Creation of a domain administrator account · Creation of a golden ticket · Use of DCSync · Creation of a Skeleton Key

- ..
SA~S

.

-

-

·

What's Ne t? - AD Persistence - Active Directory Attacks
Throughot1t this ection we've discuss d a vari ty of techniques that are used by adversaries to move laterally through a Windows environment and obtain administrative access. Remember that our adversaries are persistent and would like to persist the access the achieve!
So, what is the next step in the adversary's toolbox? Typically an adversary will attempt one of the following tricks to consolidate/ persi t administrati e access to the AD:
imply creating a domain administrator account (preferably with strong credentials); r ating a Kerberos golden ticket that will allow Jong-term acces to the environment:; · U ing the DCSync attack.; · Creating a Skeleton key, which wil I allow the adversary to authenticate as any user in Lhe env ironment.
Let's discus these techniques in some more detail!

© 2017 Erik Van Buggenhout & Stephen Sims

123

What's Next? -AD Persistence - Creating a Domain Admin Account

Act,.eO.,ttto,y Us.<rs ,md Com S..ved Qum<>

Type

0f5UtpUM

User

Bu,lhn ·ctounl for od.·

Sttunty Group.. Membet-s m tho group<..

Computtrs

llser
c;--~...s.---.L'.

clOJ>l<>s
Oo,.,,.,n Conttolle<f
fo roig,,S,cu111)'Pn~c·p·I,
M1naged MMCC AtCOUI I
U>tt>

d Select GrO<Api
·i Sdec:lllnollj,;c:tl)1>8 IG r , , . . o , o r B . l f l ~ ~-

From1tnloc.Mrl

q ~""""'"
dpt«""' ol,jea ,,....,. ..,select

'Qornoln Mrnl

OK

SANS

New Domain Admin Simple yet highly effect:ive, adversaries could opt to create a new domain administrator account on the environment, often with a password that does not expire!
This is highly visible, any additions to administrative groups in Active Directory should be reported and analyzed by your monitoring teams!
·

What's ext? -AD Persistence - Creating a Domain Ad min Account A imple attack to achieve persistence in Active Directory is to create a new domain admin u er with a password that never expires.
Once an adversary ha administrati e rights to the domain. he can create a new domain admini trator. T his does not necessarily imply that the adversary mu t obtain domain administrator righrs but just obtai·
the right to create new users and assign them to groups. A domain administrator has these rights, be in Active Directory. these rights can also be delegated to administrative user that don't have domain admin rights. Because the domain administrator is such a powerful account, many organizations will only provide this account to a select group of ecurity staff members.
Other users that need to perform common administrative ta k , like managing users are only given the
necessary rights to do this. But once a user ha · the right to create a nev user and assign it to arbitrary
groups, he can create a domain administrator.
This created account will give the adversary domain admin access to the domain as long t.hat the account is not discovered and removed . It is therefore important to monitor your Active Directory infrastructure for the cre::ition of new accow1ts with administrative rights.

124

© 201 7 Erik Van Buggenhout & Stephen Sims

What's Next? -AD Persistence - Golden Ticlcet
We already discussed "Pass-The-Ticket" attacks, where Kerberos tickets are stolen and abused by adversaries ... The most. damaging variant of this attack is the ··Golden Ticket"!
· A Golden Ticket is a Ticket Granting Ticket generated with mimikatz that has several special properti s.
· Mimikatz can generate the ticket with seer t information (the NTLM hash of th krbtgt account) and readable information (for example domain name)
· Th Golden Ti ket refers to Willy Wonka' hocolate factory.
SANS
What' Next? - AD Persistence - Golden icke-t Another method to obtain a 1i kct for pas -the-ticket atiacks is to u ·c Mimikatz lo generate a Golden Ticket. Golden Ticket is a ticket-granting-ticket pro iding maximum acce fi r a maximum period of time. It's the mother of all ticket . th re i no ticket that provide m re acces .
As . aid, a Golden Ticket is not n ticket 1ha1 the domain controller wi 11 generate, but it is a ticket the ad c ary generates purel fr m scratch, u ing tool like imikatz.. The onl .ccret information that i needed to create a Golden Ticket, i the TLM hash f the krbtgt ac ount.
When cti e Directo1y is compromised. lhe TLM ha h of the krbtgt a count can be exlracted from memo!) ee our ckurlsa::lsa e, ample). 11 the other information needed to create a Golden Ticket i 1101 secret information but can be oblained readily. For example, the name of the domain wi II b needed. Although the domain name of your organization is not ·omethingy u publi i7c, it will not be difficult for an adver ary to obtain the name of our llomain.
Remark that the T hash of the k:rbtgt account can al o be extra ted from the Active Dire ' IOI)" databa e, and its backups. o, it is primordial to protect this data . The only recour ·e one can have when a Golden Tick.et ha. been generm.:d is 10 change the pa ·, rd of the krbtgt nee unt. Micro ft has scripts for thi .
The naml! Golden icl-..et refe~ 10 Lhe Willi Wonka mo ic, In thi s mo i~, children can win u Golden
Ticket that provide~them full ncces I >a fabulous chocolate factory .

11:1 2017 Erik Van Buggenhoul & S1ephen Sims

125

What's Next? -AD Persistence - Golden Ticket - Step I

. I ,. ,.

II \J"-i·~

- ffloii:,y ~Ulli.t11111 ( MnJHl~hH..h t11. Ooa )

··· " 1111 · t.np J .ntog ~tu~.1 . :1: c.o.J·'·H iatir

' " .ol

' IHU

MlCrt 1:1 ...ai.,1·· · · · /

·\·H,.au I l e ~ · got ~ A.rH9t elkc-f'l"SN~lll..--.a.J·f l Jc:.·f'U. / _.ll'l ,r eot

/claul l" · itae'" pr vat· /1tid ,-S .. 1·S·z.t · t lfSl11n"'- l· 21ellttM1·211rJJli,.tll\.-!,OI / U c>

t ,ol 4'1 ti~·t b\11\

~..,

roo l

~u, ;~!r2r. !~:;I\;!~~l1uu,1·271Ul0'-S...,.

l.iur Id

,-QG

6 r ~ Sd ·\:U ,-1z S2'G $1' $,\I

°' , c~

· ltc:c., l'SNS~5,0hf1 k · R 2 · r ~~-'-"C-_n t

, ,...,.. ··111m 11 11"' n , 10111021 11 o, 21 uo11n:1, ·· n

> ric:~·f Qi;,\ ~ hdl:·t bln

· IIAC ~,,....H.-0 · PAlti·i'ttl'H
" tncnehtP-arl a--,,._.,.nH
· ~ t1 ck·t, .,-1. tne:l" !.19' tN
· KrbtrN ~·h·d

·

L. · r

C \ cte,ao\aJ.e U:.ilU . t t' \lhnll l air f01°"' 1l CUl C.1 n
IJa\ta# u , dr- i w C l\t4' no l .,,_l UOJUM- S.,-.-1 ____. u r11.H ·£4(1t

D1 r'H t.o,-y of t , \ d..o\ai · Lt;,t,~r_ V\ll'\k\liU,nJ2:

19/ 0l'/2011 11 · "

I 21, ~ -fOl lHn t nJ.et.».111

J Fs l · t·J

1 l51 ~ I.H

e Olrfc ) :t: .. )C; H J OJI bvt H f r""

Golden Ticket - Step I
Using Mimikatz, a golden ticket can be generated using the following information:
· KRBTGT NTLM hash · Domain admin account
name
· Domain name · SID of domain admin
account
All of these values can be
obtained by any user In the domain. except for the KRBTGT NTLM hash!

SAN~

· , · -·

What's ext? - AO Persistence - Golden Ticket- tep I In this example. wee plain what is needed to create a Golden Ticket with Mimikatz. Mimikatz's command Kerberos::gold n can be used to generate a Golden Ticket Thi i a pure 'computational" command: it does not require admini trative rights, and it does not require access to Lhe domain_ Generating a Golden Key can be done on any Windows computer in the world with nom1al access rights, provided that the necessary input values are known.
· The first input, the most difficult value to obtain , is the NTLM hash of the Kerbero account (krbtgt). As tated before this hash can be obtained from compromised domain controllers or Active Directory databases.
· The second alue is the name of the administrative account. In our e ample, that i root, · The third value is the domain name: c599.private in our example. · And the fourth and last value is the JD of the ad min account.
That is the only input that is needed to create a Golden Ticket. Remark that Mimikatz has many mor options forth is kerberos: :go!den command. bul discussing these is not in scope (this i not an offen ive cours !). 171e only extra option we used here it the /ticket: option to writ the Golden Ticket to disk.
horn the Iifetime, you can see that this Golden Ticket is valid for IO years! This means that as long that you do not change th password of the krbtgt account, the ticket will grant access to your complete Activ Directory infrastructure for the ne t 10 years!
From the output, you can clear!. ee that the administrative account (user ID 500) is a domain admi11 (group ID 512) and an enterprise admin (group ID 519).

126

© 2017 Erik Van Buggenhout & Stephen Sims

What's Next? -AD Persistence - Golden Ticket - Step 2

- ~ -:-· ..-·- x-- ' Golden Ticket - Step 2

In this second attack step.

the adversary can now re-

inject the ticket in

Windows memory. thereby

,(98888888] · 8x80808817 · rc~_hllac.nt

St11rt/Enct/H11dl·MM J0/81/2011 18 88 , 29 . 8/81/2827 l8 . 81L29 : 8/0l/282f 18 . 0

8 ,29
S·rv·r Na··

: krbtgt/eecS99 privet· a ··c599 privet·

Clar,t Na..

: root 9 oec599 . priuat·

F'l11911 ~0,08888 , pr,_author,t , 1r,iti11J r,r,owabl· , f orw11rd11blo 1

readying for use when we try to attempt accessing a
service chat relies on
Kerberos authentlc::ition (e.g. accessing a Windows

aiaikat:t M

share}.

IOnce a golden ticket is generated, the only way to midgate the attack Is change the password of the KRBTGT account twice (It has a hard-coded password history of 2 + the KOC will also attempt to validate a TGT with

hashes in the password history!). This wilt however invalidate all tickets and could have production impact!

SANS

What's ext? - AD Persistence - Golden Ticket - . tep 2 To u c the previously generated ticket,\ e issue the Mimikatz command Kerberos::ptt golden.ticket.bin. This inject the lick·( into indo, s' memory, read to be used \\h n , e attempl to connect to a service.
The Kcrberos::li.1 command can be used lo list alt the tickets that we have. W can see that the ervcrname i krbtgl/ ·c599 .private: this tell us that thi is a ticket-granting tickc1 for the sec599.pri ate domam. Th u er i root of the ec599.private domain.
If we look at the ·tart and end dates, we se' 20 17 - 2027. That' an c ·tremely I ng period for a ticket: I0 years (remember, the defaull lifetime ofa T Tis IO hours). That's becau e here, we used a Golden Tick I. ow when we try t connect to a hare for e~ample. Lhi injected ticket " ill be us d to obtain a ti kct to the share, e want to acce s (thi require Kerbero . tbu. \\e need 10 u the file erver name to access, and not its IP address, a this wou ld result in TLM authentication \ hich does not work with tickets).
On ea golden ticket i generated. the onl \ ay 10 mitigate tbe aua k is to hang the pas " rd ofth KRB ,T account l ice (ll ha. a hard-coded password history of2 t the KD will also attempt to vaJidate a TGT wit h ha hes in 1! 11: passw n.J history!). Thi wil l, h we er, in alidate al ! tickets and could ha e production impact!

@ 2017 Erik Van Buggenhout & Stephen Sims

127

What's Next? -AD Persistence - DCSync

B

Benjamin Delpy, the author of Mimikatz, has pioneered many attacks on Windows security, and this has led to security improvements in Windows. In collaboration with Vincent Le ToUJ<,
Benjamin worked our another attack on Active Directory:.impersonating a domain controller:

How d ~ the "D 'Sync' attack work? · For availability rca ons, many AD's hav multipl d main contr Bers. Each domain controUer ha a
copy of the AD database, aod updat to this databa · on a domain controller need to be propagated to th other domain control! in du time. This i called ctiv · Directory replication
· Mimikatz bas a command (de ync) that will mak any compul r that run Mimikatz imper ·onatc as c1 Domain Control! r to a target Domain Controller to obtain th credential tored in thi Domain
I Controller (provided admini trative cr d ntials are a ailabl ). DCSync essentially has the same Impact as copying the ntds.dit database file! Once an attacker successfully launches an attack like this, all passwords in the domain are compromised and everything is co be changed!

SANX

What's Next? - I) Persistence - DC ync Benjamin Delp 1, the author of Mimikatz., ha pioneered many attacks on Windo" s security, and thi has led ro security impr vement in Window . In collaboration with in nt Le T ux. Benjamin worked oul another attack on ctive Dir ·tory: impersonating a d main controller.
For a ailability rea ·ems, administrators depl . more than one domain controller in an Active Directory infrastructure. Each d main controller ha a copy of the cti e Direclol") database, and updatcs 10 thi databa. e on a domain controller (for example the creation of a ne"· u er) need to be propagated to the other domain controll rs in due Lime. TI1is is alled ctive Directory r plication: a et of m ·thods and protocols to synchrouize the databa e of Active Directory domain c ntroller .
Vincent and Benjamin ha e, orked out these method and protocol for u e b imikatz: imikatz. has a command (des nc) that will make any omputer that run Mimikatz t imper onate as a Domain Contr:ollcr to a targ I Domain 011troller to obtain the crcd ntial st red in this Domain ontroller.
Of cou c. nonnal u ·ers can not a cess thi information. ne need domain admin rights to be able to participate in data replication. A olden Ticket can pro ide thes admin right ,
dcsync can dump the hashe of all users, or of a sel ted u, er.

128

© 2017 Erik Van Buggenhout & Stephen Sims

What's Next? -AD Persistence - DCSync - Example

1-..... i I en. ·

·C.-~r,t .,_._.. . . . ll'IJlff'.rl:(lr

u.., t,_ {~J ud, -lll"'h~1,t 1 tilU t,,. t..~ ..._,,.,

tOCJ klfil · '"" 1 ..-~ n1 t . .,-h11,h 1 ·Ul ...

f«l ..i,,.u!f,..~.-· -u.1. · ""·

K<-OtJM'

t·'\M'M'(GM·· ·

u,· ....,.l'i.-t.t.- ..
......- r IAUJ'JUltT
~lf,lDil ( ~l_AC(:~ T,.U~lS:E._itA5"""° J lo'Otll_..l 1-.ff .. 11181/Nill 11 1,1"7
~ J· -n u.u,.._~J')1U·XM--1n -.; ,-.

f'~Ullii,

~tft '111ftl'\.: . . .,....J..,.,1111M1iJlliH1i11

.........

ncl·· ·· ...n,ro-.1·~.....,._...._t,1.41"

MI· 1- uQc:c · ,,.._,~~\"l'trtOJc.tf4J
i,.,~··l ~···· W4.tta~r-c:ia.,..._·s..·d·"·'~

· lll'rt.._,.,_.Mllll' '-1

··t

~ - h'lu. ,h-11fl,..U.· 5- ~ · W,O·l·HI

· f't·""1")':t;.ll',....r .,.,..,.,. ·C.'1 ·
0.-t-.il sail· '"'"'·"' , tu., Wl:tll.14'jlt t ( ~ ,a b
.:.1-1u4u'·_1·..\_fi.~
dH,..nt_lld,

lt\llt:. .tlllr

DCSync in action In the screenshot on the left. we can observe the Mimikaa "DCSync" command in action.
1n this specific case, the password hashes for the ·'Adminiscrator" user arc being requested using the "lsadump::dcsync"
command.
As with dumping of chc NTDS.dit file, we
~lso receive the "historic'" password hashes!

What's e t. - D Per istencc - DC nc - E ample Th.is e ample show the des nc command. B is uing "kerber ::de ync /user.admtni trator" command, we request the credentials for u. er administrator to a domain controller. 'onunand ''kerbero ::des nc" would list. th ·redential of all u ·ers.
When thi command i issued without e Ira opti ns, Mimikal7 selects the domain and the domain controller automatically, and c, tract the credential from this domain con1roller via replication; the Directory R ·plication ervice Remote (DR R) protocol.
his is a ery powerful attack: once an attacker ha · btained domain ad min cre<lcntials, it can u e de ' )'Ile 10 connect to a domam ontroller and e, tracts I.he credentials orthe krbtgt account. 'bis data can then be u ed to create a Golden Ticket, and then it i game over: the onl recourse you have i to change the
krbtgt account password. ·n,is password ne er expire and i · never changed. un le s it i done manually. Ir
ou disco er that the krbtgt TLM hash has been compromi cd,, ou , ill have to change the pa sv ord.
It i· possible to detect and prevent a dcsync attack. DR Rn ·twork traffi c should only occur between d main controller . lf you d tect DRSR network traffic bet, ecn a domain controller and a\ orkstation, y u know a de ync anack cook place.
If you egment your d main controllers In a dedicated net\ ork egment. with advanced firewalls as
chokepoinl bet\ cen tl1c olh r network scgmen , · ou can bl ck OR R traffic outside the domain
ontroller network · gment.

© 2017 Erik Van Buggenhout & Stephen Sims

129

Persisting Administrative Access to the AD - Skeleton Key
A final AD persistence attack we would like to highlight is the ''Skeleton Key" attack. which is also been added as a built-in module in Mimikatz. A skeleton key is a key that opens all the locks in a building. In the same way a Skeleton Key can "unlock" all systems in the domain!
How doe the "Sk leton K y'' atta k work? · The "Sk leton Key" essentially mean that a backdoor i implanted on the domain controller; · This ba kdoor run in memory and adapts the running domain controller in such a way that a
ingle password (the skel ton pa , rd) can b u cl to logon with an accounl; it run in memory it d not p r ist b , it elf (but can, of c ur e, be cript d or persi ted
using one of the p rsistenc strategi s we'v en above) · This only affects one domain controller, so the adversary would hav to target all domain
ntroll r for maximum effect...
SA~S
Per isting dmioi trutive cc· ·· to the D - kcleton Kt) The last D persistence anack , e, ant to illu tratc i an atta k to achieve persistenre inside a domain. Of cour e, th ,olden Ticket is the ultimate per isten e mechanism, but I.hi keleton key attack also merits
A ·keleton key is a spc ial ke tlutl opens all the lo ·ks inside a building. Each door lock in ide the building require its own ke to he opened. but all th· locks can also be pened with a pecial, 'inglc key : the kelet n k . imikat.z pro\ides a keleton ke attack for cti e Directory.
When the Mimikatz skeleton attack is e. ecuted on a domain controller a bit ofcode i patched in memory so that all account can be logged in with a pecial pas word (mimikat.z). TI1i do not remo e the existing pas word : i1 is no,, possible to log into an accounl using 2 different pa ·v ords: one an log in with the normal a ount pa ord, r ne can login with the keleton key password.
B) patching the ode of the L A proce · the functi n that \alidate credentials are modified : they 111! 11 cept tl1e normal pa sword, but also accept the sh.elcton password.
This has I be done m\ ~ domain controller, it does .n l work on non-domain controllers. But thi doe not mean that on anackcr can only login with th skeleton passw rd on ad main cont ml I r: the pa . word works on all domain member that use thi compromised domain contr lier for authentication.
Ifthere are m re than on domain control le . lhe alta kneed to be x cuted on all domain ·ontrollers to bt: sure that the kelet n password will work in all cases.

130

© 2017 Erik Van Buggenhout & Stephen Sims

Persisting Administrative Access to the AD - Skeleton Key - Example

mim,kwt, :Z 1 1 ,64 (oo.eo)

. ~cll'N· ·
· it# ~ #ti '
n /\u
lttl \ / / ;#
' #11 y II# ' ' ##### .

mJmikat 2 2. 1.1 (x64) bu il t on J un 18 2017 18:46:28

''A La Vie , A L' Amour"
1· ...

Benjamin OELPV ·gentilkiwi · ( benjami n@gent llkiwi.CO!ll )

http: // ~l og.gent i l ki wi.c0111/mimik atz

(oe. eo)

wi ~h 21 modul~~ - · · /

i.mikat z # pr i vilege:: debug rivilege '20' OK

imikat z # mi.sc::s ~el et on [!ICC] data
[KOC] struct (KDC ) keys patch OK [I\C4] functions {RC4) init p~tch OK [RC4) decrypt patch o~

imikatz II ·

Skeleton Key in action In the screenshor on the left. we can observe Mimikatz installing a "skeleton key" backdoor on the domain controller.
Note the simplicity of the commands... This will now allow anyone to authenticate as any user in the domain with the skeleton key password ("mimikatz").
Might be a good idea ro write a script to check successful authentication using
the password "rnimikatz", right! ©

SAN~

.

Persisting Administrative Access to the AD - keleton Key - Example In the example above, we can see the skeleton ke attack. Since this will patch the code of the LSA process in memory administrative rights are required and the debug privilege needs to b enabled. An attacker just needs to run command ''misc::skeleton" and voila. the skeleton key is installed on the domain controller.
When there are several domain controllers inside a domain domain members connect to a domain controller for authentication via a kind ofload-balancing scheme.
Thi means that to be I00% reliable, the skeleton key attack needs to be perfonned on all domain contro llers. Otherwise, a domain member might authenticate to a domain controller that does not have the skeleton key patch applied in memory.
ince this is a patch in memory simply rebooting the domain controller removes the skeleton key. But of course, attackers can install an autorun entry for Mimikatz to run automatically when the domain
ontrol ler boots.

© 2017 Erik Van Buggenhout & Stephen Sims

131

Active Directory Attacks - Summary

IActive Directory holds the key to your environment and will always be one of the prime targets the adversaries go after!
IIf adversaries obtain local administrative access to a system in the environment (e.g. through one of the privilege escalation attacks we discussed this morning), there are many ways of escalating further to domain (administrative) access! (Mimikatz, dumping cache, ...)
IShould adversaries succeed in obtaining domain administrator access to your environment, they will have a wide variety of options to persist this access (Adding domain admins, Golden Tickets, Skeleton Key, ...)

-

SANS

. - ._ . ._ .·. . _-

.

.

Active Directory Attacks - Summary ln this section, we have seen a wide variety of attacks against Active Directory. It' important to under tand that Activ Directory holds the key to your environment and will always be one of the prime targets the adversaries go after!
To pull off these attacks, administrative credentials are needed. Depending on the attack, these can be machine administrator credentials or domain administrator credential . 1 o obtain these er dentials, advanced adversaries hav different avenues of attack. The credentials can be stolen from machines, backups, . . . or they can be obtained by social engineering users. Another method is privilege escalation . For example, to dump the credeatials fr m the Local Security Authority, the L A process mu t be opened and its memory read . This require U1e debug privilege, which administrators have. But the system account can also acces the L A process memory: a local privilege escalation vulnerability can be used to obtain elevation co lhe system account
There are man tools to attack Active Directory (the domain and the domain controllers). A ery popular tool i mimikatz. Mimikatz is reliable and powerful. Mimikatz is detected by many anti- irus programs, but because it is open ource it has been recompiled repurpo ed or tran form d into versions that are not detected by anti-virus . For example in the Pctya/Notpetya ransomare e ecutable, credential tealing applications (32-bit and 64-bit) were stored as resources in the ransom ware. Th se applications were repurpo ed version of mimikatz.

132

© 2017 Erik Van Buggenhout & Stephen Sims

Active Directory Attacks -Additional References
Some additional resources concerning Active Directory attacks:
Mimikatz htt_ps://github.com/gentilkiwi/mimikatz http ://sithub.com/gentilkiwi/mimikatz/wiki https: //www.youtube.com/user/dist67/videos
Active Directory https ://gith ub.com /gentilkiwi/mimikatz/wiki
· Kerberos https: //en .wikipedia.org/wiki/Active Directory
'
Active Directory Attacks - Additional References ome additional resources concerning A tive Directory attacks:
Mimikatz https : / / github .c om /ge ntilkiwi / mimikatz https://gith ub.com/genti Ikiwi/mi mikatz/wi lci
Active Directory https: //github.com/gentilkiwi / mimikatz/w iki
Kerberos https://en.wikipedia.org/wiki/Acti e_Directory

© 2017 Erik Van Buggenhout & Stephen Sims

133

Course Roadmap
Day 1: Knowing the adver ary, knowing yourself · Day 2: Averting Payload Delivery · Day 3: Preventing Exploitation Day 4: Avoiding Installation. foiling Command & Control & thwartin lateral movement Day 5: Ex-filtration, Cyber Deception & Incident Respon e Day 6: APT Defender Capstone

SEC599.4

Avoiding Installation

Typical Persistence Strategies

Exercise: Catching Persistence

Principle of least Privilege & User Access Control

Exercise: Local Windows Privilege Escalation Techniques

Foiling Command & Control

Network Monitoring Considerations (Netflow. IDS. ...)

Detecting Command & Control Ct,annels

Exercise: Suricata to Detect Network Anomalies

Thwarting lateral movement

Introducing Common lateral Movement Strategies

Active Directory Architecture & Attacks

·

Active Directory Hardening & Segmentation Exercise: Hardening Windows to Stop Lateral Movement

Detecting Lateral Movement Using Windows Event logs

Exercise: Configuring & Forwarding Windows Event Logs

SANS

-.

·

.

This page intentionally left blank.

134

© 2017 Erik Van Buggenhout & Stephen Sims

Active Directory Hardening & Segmentation
o that we have an in-depth und rstanding of current AD attacks let s s how we can pr vent & detect th m! W will zoom in on the following practical recomm ndations:
I Overall Active Directory architecture I Implementing LAPS I implementing Protected Processes (Win8 & 2012) I implementing Credential Guard (Win IO & 2016) I Privileged account management & 1AM
After completing this section we will also perform an exer i e wh r we implemen a number of ontrols that can help thwart AD lateral movement.
SANS
cti e Directory Hard ning & cgmentation ow that we have an in-depth understanding of current AO attack , let's ee how, e can prevent & detect them! We\ ill zoom in on rhe following main categories of recommendations:
· First of all, domain controllers ha e to be conne ted to the n ·twork. By carefully designing the network segment · that domain controllers will b placed in , \ e can pr vent some attacks. Placing the domain c ntroller in the . ame, flat network as 'erver and , orkstati ns is a bad idea. Domain controller should ha e their mvn L egmenl. ctive Din-.ctory i al o a hierarchical . tmcture: this tree tructure is present at many le els : forests, domains, organization units, ... ·arefull planning Lhi tructurc can create a more r bu t ti e Director structure when security is invol ed .
' econd, it's important to address the issue of re-u ed local administrator password . Micro oft Local dmini ·tral r Password olution (LAP ) provides an effccli e way of handling this issu by ··generating" random local administrat r pass, ords and loring them as part or the domain tructure.
CredentialGuard is an e c Ilent new feature as of Window, IO that will isolate the L A process, in an attempt to prot tit from "hash dumping' attack . We will discus it in-depth in lhis upcoming ection .
· A CredentialGuard i onl_ available for Window IO (& upwards), we can con ider implementing Pr tc:clcu Pro e c on old r indow ersions such as \I indo\l s hcse will attempt to achie\e a ·i111ilar re ult as rcdcntial uard, but the can be bypassed b tools ·uch as Mimikatz.
· Finall , we will di uss a number ofmut1ers related lo privileged ace uni management & I M. A AD en ironments can become largely cornple , it i · important administrut r retain a good overvie\ of how the different privilege are as igned in th ir network .

<Cl 2017 Erik Van Buggenhout & Stephen Sims

135

Overall Active Directory Architecture - Segmentation
'

Put domain controllers in a different network than other servers and workstations. Use at least firewalls co separate the networks.

··· l·· I

. .··ll ········

I .. I

crall ctive Directory rcbitccturc - ~ egmcntalion Don,ain i:u111rollers need IO ommunjcate wilh all their member machin , ervcr and workstation . and al o. with other domain controllers.
But lhi d e not imply that they ·hould all be located in the ame flat n twork. By pulling domain controllers in one LAN segment, and workstation and erver in a different LAN segment (several LAN egments i better}, one has m re option lo monitor and control net\! or!-. traffic between domain controllers and their members.
A simple olution is lo put domain controllers into their own V AN (Virtual LA ) segment. Thi hould be the minimum: if p ible, a ph) ically eparated A segment offer. more ecuril) than a LA egmenl. Domam controllers of different domain hould not be put into the same LA egmcnt, especially i they d(.) not have the 'ame level of trust. like DM Z and production.
ct\l ork de\ i es to monitor and control the net\' ork traffic can be put in place b tween the cgment . These should be at least firewalls rhat can b!o k all traffic that is not "nonnaf'' traffic for domain controllers. Kerbero traffic, LD P, NTLM . ... is con idered normal fore. ample. but FTP would not be nonnal.
N twork devices that can do deep in pection of network traffic, like JPS devic . ure prefeiTcd if the firewalls use<l by your enterpri ·e are not capable r doing deep in pectic n. Thi design will. for example, prevent a m1mikatz dcsync atta k: Active Directory data repli ation traffic between domain controllers is normaJ, but not between a d main contro ll er and a Windows laptop.

136

© 2017 Erik Van Buggenhout & Stephen Sims

' Overall Active Directory Architecture - Read-Only Domain Controllers

··· l·· I

··ll········

I I

Use read-only domain
controllers in less trusted networks like
DMZ or branch offices.

SANS
Ovcrnll Active Directory Architecture - Read-Only Domain ontrollers Further hardening at the network level can be implemented by using o-called read-only domain controller .
Read-only domain controllers were introduced with Windows 2008. A their name implies, read-only domain contToller only keep a read-only vcr ion of the Active Directory database. When replica6ng
cti e Directory data with oLher domain controllers, they will onl recei e updat' , the_ , ill ne er end out updates to the data.
Read-on I domain controllers can be configured to cnche onl the credential of user and computers that
try to authenticate 10 them: the e read-onl domain controllers do not contain credentials. They , ill 0111. a ccpt authentication request from a pre-defined set or ac ounts and will delegate the auth ntication to full domain control lcrs.
Thi beha ior makes them more uited 10 b used in en ironments that are les secure. For c ample, in DMZ or in branch of1ices that do not ha en ecure data center. If ·u ha domain controller i compromised, then the credentials are not compromis d.

Cl 2017 Erik Van Buggenhout & Stephen Sims

137

Overall Active Directory Architecture - "Privileged Access Workstations"

···ll ············

I I

··· l·· I
··l········ I

Domain controllers networlc

Privileged Access Workstations

Inner Networl<

0 erall Acti e Direclory rchitecture - "Privileged cc Work talion " practice rt·commended by Micro oft, this mainly relates to the use of highly privileged a counts that are
u ·cd to administer the AD. Management of the Active Directc ry (& 1hu- use of hi ·hly privileged accounts) , hould only be perfonncd fi-001 a number of dedi atcd sys1em that can be ecn a administrati e '·jump b xes··, Direct administrative access to th Domain ·ontroller from nonnal ·'internal network zones" is not nllowed,
Th e "jump boxes" are labeled "Pri ilegcd cce orkstation "by indo,,s. Ihi type of ·ystem
hould be ·ubject lo additional security hardening such a the full implementation or redential Guard.
l·urtJ1em10re. they shou ld be dedicated to administrative functionality, and not run . oflware such as email applications, web br wst:rs, or producti ity ofh arc uch as Microsoft Ollice. In ils " ecurit · Best Practice for Acri e Directory'', Micro oft de cribe · three core principle. for these admini tralive ho ts:
· You hould ne er administer a trusted tern (that is. a , e ttrc erver uch a · a domain c ntroller) from a le -trusted ho t lhal i . a , rkstation that is not e ured to the ame degree as the ystems it
manage).
· You shou ld not rely on a single authentication factor when performing privileg<.>d activiliC!: that i · u er name and pru s, orcl combination h uld n l be considered acceptable authentica1iun becau c only a ingle factor ( om thing you know) is repre ented. You should consider where er dentials arc generated and cached or tared in administrative cenari s. Ithough mo I attacks in the current threat land cape le erage mah are and m liciou hacking. do n 1 omit phy ·ical e urity when designing and implementing ccure admini trativc IH ts.
ources: · http ://d .microsofl,com/en-us/wind , s-server/identil) lad-d plan/. ecurity-best-
pra tices/implementing- ecun:-admini trativ -hosts · https://docs. micro:m n.com/en-us/wi ndows- erver/ident ity/scc uri ng-pri vi leg d-access/pri vi lcged-
ac eSS-\ orkstations

138

© 2017 Erik Van Buggenhout & Stephen Sims

Overall Active Directory Architecture -Trust Settings & Directions

enterprise.private

Use read-only domain
controllers in less
trusted networks like
DMZ or branch offices.

d mz.enterprise .private
SANS

production.enterprise.private

-
,

Overall Active Directory Architecture -Trust Settings & Directions Active Directory has hierarchical structures at different levels. For example, domains can be put into a tree structure. In the example above, we have the domain enterprise.private at the root of the tree. dmz.enterprise.private and production.enterprise.private are branches of the tree.
Each domain requires at least one domain controller.
If a level of trust is required between dmz and production, then a trust relationship can be established where dmz trust production. There should never be a trust of dmz by production . This is what we call a on -way trust!

© 2017 Erik Van Buggenhout & Stephen Sims

139

Overall Active Directory Architecture - Domain Controller Hardening

The domain controllers are the central "piece" ofyour domain and hold the keys to the ca tle. If the adversary wants to obtain full authority over your environment, at one
point be will need to interact with the Domain Controllers. Here are a few controls to be
considered around Domain Controller hardening:
I Restrict and closely inspect network connectivity to and from Domain Controllers I Guard the Active Directory database file closely: prevent copies, encrypt backups, ... I Disable any unneeded services (e.g. RDP) and uninstall software that is not required I Use application whitelisting and disable any scripting features I Increased monitoring on the Domain Controller

S·',.,l\!\.h' ll'

.

.

-

.

Overall Active Directory architecture - Domain Controller Aanlening The domain controllers ar the central "piece" of your domain and hold the keys to the castle. If the adversary wants to obtain full authority over your environment, at one point he will need to interact with the Domain Controllers. Here are a few controls to be considered around Domain ontroller hardening:
· First of all, we should restrict and closely inspect network connectivity to and from Domain ContTOllers. An exce llent example of this is Internet acces . There arc very few reasons why domain controllers should be able to (direcll ) access the Internet;
econdly, protect the active directory database file (ntds.dit) closely: this includes both in its original location, but also any replicated copies or backups that are spread in the environment. Monitor the use of ntdsuti Is in your network!
· Any unneeded services on the Domain Controller should be disabled. A good example of this i the Microsoft Remote De"ktop Protocol RDP). As we'v een in previous slide , management of the AD can be performed from "Privileged Access Workstations . Furthermore, there should be close to no '"e tra'' software installed on rhe Domain Controller;
· Without e ception, restricti ve application whiteli ting & script re trictions should be enforced on the domain controUer;
· As the domain controller is the central component and holds ''the key to the castle''. it should be ubject lo "increa ed monitoring" as a whole.

140

© 2017 Erik Van Buggenhout & Stephen Sims

Introducing Protected Processes

In order to prevent hash dumping attacks aimed at the LSA process, Micro oft introduced "Protected Processes' as of Windows 8 & Windows Server 2012.
· Protected processes were first introduced in Wmdows Vista for DRM (Digital Rights Management) purposes, but were adapted for "security purposes' m Windows 8

a

-
Gl'\)O,...,

- ""'-~

-

-

10/l· -'If

NT 1.1/!~!\fmfl'

, _ S<H·lt

°""""'-

-

-

- l - "'-
,t,~ ,_,____,...... 14~.,

~

~Ot,iltl.

~

· The screenshot on the right provides an example of the lsass.exe process running as a "protected process"

· Protected Prncesses are implemented in the Kernel

s~ .software and can thus be defeated...
r :

- - -:.~.--.. -. - -

1.

l}

-

-

.

lntroducing Protected Processes 1l1e next two protection methods we will discuss not only apply to domain controllers, but to all Window machine . The Local ecurity Authority is tbe process that handles ihe credentials. As we have seen in Active Direct0ty attacks, many powerful tools are a ailable to adversarie to extract credentials from the lsas .exe process.
With Window erver 2012 (and Windows ), the L A can be configured to have its lsass.exe proces hosted as a protected proces . U nder Window , with the orrect privileges, accounts can access the memory of any Windows process. This is not th case with protected processes. Protected process s (and their memory) cannot be accessed by other processes, r gardless of the account, they run witJ1. Protected proces es were introduced with Windows Vista for DRM purpo es (to make media players). but protected proce es were repurposed for security boundaries when WindO\ . 8 was introduced.
By running the I a .exe process as a protected process, tools like Mirnikatz cannot access the process to e tract credentials. In the ere n hot above, we can see that the lsass.e ·c process running on this machine is protected: Process Explorer' ecurity tab indicates that the process is protected ( PsProtectedSignerLsaLight),
Protected Processes are implemented in the Kernel software and can thus be defeated ... Mimikatz has a function to remove the protection from protected processes: this "convert "the proces into a normal
proce s. To do this, Mirnikalz requires its kernel driver to be installed. Installation ofthi kernel driver can, however, be detected and re ponded to.

© 2017 Erik Van Buggenhout & Stephen Sims

141

How to Configure a Process to Be "Protected"?

~··II)' h!,IOf "tie Ed,t v,.,,_ favorfle< Help

Computer\HII.EY I.OC.Al_MACHINE\S'l'SIEM Cutf.,ntCo~ Contt<>l\b.J

EJ, l·M· ;,ieSymm l'MSyst.emUh Graphtc.sOm,· GroopOrderl, HAl
l11~1s1
ht1.Jered11cct1c
IOC0nf,90B ln,1,olM·cho,, IP I ~r.~ard l ~) ~f.'Vboard y
l"'
. Lsabtenstorl<
I Ulotorm,·mo

N.om~

l~µ,e

~·dls.,btedoma,na REG DWORD

t'I e·,~neinclud REG. DWOIID

,' fon. 1.-yvnt

REG DWOIID

r,'J fulloov,legeaud,L REG. BINARY

,::., lHTHIBtar, ?.asswo. REG DWOR!J

f:~UdPKf

REG OWORD

T:I N,:,Lm"l·ih

REG OWOR.O

,.., Not4fl(.~t0f'I Pack REG Ml,Jlt SZ

M~ Product ypq

REGOWO!ID

~ ·l"tnclononyrnow REGJ)WORO

~EG OWORD

RfG OWOIID

t'.I s«,,,., Boo!

REG 0\1/01\0

·~tulll)' Pil\"ki>ges IU:G. MUlTl'R

D X
o.,.
0~00000000 IOI 01<0\lOOOOOO 10) ~ , o, 00 O, 0000000 ( I
o.:ooooon~ 16.!ll1
0,,00000001 111
,c.,,h
Ot00000004 14 I
0.00000000 101 OltOOOOOOO I 1fJ
Ol'()()()C)OOIJ l I I I OxOOOOOOOI C)

A new registry key with a DWORD name of RunAsPPL and value I should be created to run LSA as a protected process.

SANS

·. · · · ·

·

How to Configure a Process to Be' Prolected"? To configure Windows to run the lsass.exe process as a protected process, a change has to be made. By default, Windows wi ll not run the !sass.ex process as a protected process.
A registry value has to be created and set: under the registry ke HK.EV_ LOCAL_ MACHI E\SYSTEM\CurrentControlSet\Control\Lsa, a double word value (DWORO) ha to be created . The name of this DWOR.D is RunAsPPL, and its value should be set to I .
Then Windows needs to be rebooted, after which the L A process will run as a protected process.
This requires at least Windows 2012 (or Windows 8).

142

© 2017 Erik Van Buggenhout & Stephen Sims

Defeating Protected Processes Using Mimikatz
mimikatz # !processprotect /process:ls ass. exe /remove Process : lsass.exe
PIO 628 -> 00/00 (8- 0-0]
Removing process protection with Mimikatz As secure as protected processes can be. it is a protection method that is implemented in the kernel software. All protections that are implemented in software, even in the kernel. can be bypassed. Mimikatz has a function to remove the protection from protected processes: this "converts" the process into a normal process.
SANS
Defeating Protected Processes Using Mimikatz As secure as protected processes can be, it is a protection method that is implemented in the kernel software. All protections that are implemented in software, even in the kernel, can be bypassed. Mimikatz has a function to remove the protection from protected proce ses: this ''converts" the process into a normal process. To do this mimikatz requires its kernel driver to be installed. This can be done with the command !+ The next step is to use the kernel command processprotecl to remove the protection of the lsass.exe process: !processprotect /process:lsass.exe /remove. When this is done, mimikatz (or other tools) can be u ed to extract the credentials, as the memory ofthe LSA process is no longer protected.

© 2017 Erik Van Buggenhout & Stephen Sims

143

Credential Guard - lntroducingWindowsArchitecture

Lower levels At the lowest level, we have the hardware. On top of that runs a hypervisor: software that uses the hardware to provide virtualiz.ation services. And then we have the W indows operacing system,
SAN~

Hypervisor Hardware

Higher levels
Essentially. Windows has two important parts: the kernel ~nrt 11~erland.
Processes run in userland. drivers run inside the kernel. The LSA process runs in usedand.

Credential Guard- rotroducing Windows Architecture As a pure software solution like protected processes can be bypassed, Microsoft developed a hardwarebased solution: Credential Guard. Jn order to understand Credentia l Guard, we first need to understand the nonnal architecture of Windows.
The simplified diagram above de cribes this architecture.
At the lowest level, we have the hardware. On top of that runs a hypervisor: software that u es the hardware to provide vi11ualization service . And then we have the Windows operating sy tern.
Essentially, Windows has two important parts: the kernel and userland. Processes run in userland, drivers run inside the kernel. The LSA process runs in u erland.

144

© 2017 Erik Van Buggenhout & Stephen Sims

Credential Guard - How Does It Work?

Not isolated When Credential Guard is enabled, the LSA process still runs in userland.
SANS

,\If/~,

Windows

Virtual Secure Mode Hypervisor Hardware

Isolated
The credentials are stored in che isolillt:i.l LSA process (Lsalsol.exe).
This process does nol run under Windows. but in the Virtual Secure Mode.

Credential Guard- How Does It Work? Credential Guard was introduced with Windows Server 2016 and Windows 10, enterprise edit.ions. It requires modem CPUs that provide virtualization functionality.
When Credential Guard is enabled, Windows till runs on top of the hypervisor and the hardware, and the LSA process still runs in userland. The difference, however, is that the credentials are no longer stored in ide thjs LSA process (lsaas.exe).
With Credential Guard, the credential are stored in the Isolated L A process (Lsalsol.exe). Thi proce s doe not run under Windows but in the Virtual Secure Mode. This is a separate, virtualized environment, that is separated from the other environments (like Windows) ia hardware.
It is impossible for proce.sse in th Windows environment to access processe in the Virtual Secure Mode environment, even by manipulating kernel datastru Ulres. All operations that r quire er dential , like checking TML hashe , is done by the Isolated L upon request of the LSA . The credentials never leave the Isolated LSA.

© 2017 Erik Van Buggenhout & Stephen Sims

145

Credential Guard - Does It Protect Against Pass-the-Hash?
ISome have proclaimed that Credential Guard is the end of pass-the-hash. We think this is rather premature for a few reasons ...
ICredential Guard will prevent extraction of hashes from memory, which leaves different other options available (e.g. extracting hashes from the SAM or NTDS.d it files)
ICredential Guard cannot be deployed on Windows 8 or Windows 2012 machines, which leaves many environments vulnerable: One weak link, and credentials can be stolen.
IAs discussed before, Credential Guard protects against extraction of hashes, it does however not do anything to prevent a hash from being used in a pass-the-hash attack.
SAN~
Credential Guartl - Does It Protect Again t Pass-the-Hash? Credential guard : the end of pas the hash? ome have proclaimed that Credential Guard is the end of
pas -lhc-hash. e think thi i rather prema1ure for a fcv reasons:
· Fi,· t of all, r dl.}ntial Guard will preven1 extraction of hashes from memory.\ hich leaves different other options avai lable ( .g. c tracling hashe ti-om 1he M r TD .dit fi les). e ondl , Credential Guard i · only avuilabl for Window IO indo, s. erver 2016. which leave a pot ntially large group of ulnerable tern in your corporate en ironment. ne Wind w 8 or Windows ervcr 2012 machine and credentials ca n till be stolen from that machine. ' redential Guard does not prevent u ·ing a hash for pass-the-ha h attacks. discussed before, Credential Guard protects against extra ti n ofha he , it does ho e er not do anything to prevent a hash fr m being used in a pa -the-hash attack.

146

© 2017 Erik Van Buggenhout & Stephen Sims

Privileged Account Management & 1AM
I Use only accounts with the least privileges able to do the job: Create fine-grained administrative accounts (e.g. database server administrators, web server administrators, workstations administrators·... ) AND educate your staff on how administrative privileges should be used!
Do not use a domain admin account to install a printer driver on a worl<station!
I Let domain admin and enterprise admin accounts only log on to domain controllers and dedicated workstations (see "Privileged Access Workstations" architecture).
I Other interesting technologies available by Microsoft include JEA Oust Enough Admin), PAM (Privileged Access Manager), .. .
r SANS
Privile~ed Account Management & 1AM FinalJy, we'd like to dedicate this slide to tress the importance ofldentity & Access Manageme11t:
· Use only account with the least privileges able to do the job: Create fine-grained administrative account (e.g. database erver administrators, web server administrators, workstations administrators, ... ) AND educate your staff on how administrative privileges should be used! A classic mi take is to have helpdesk users wield Domain Administrator accounts to fix small issues on an employee' s , orkstation. Use only accounts with the least pri ileges able to do the job.
· Let domain admin and enterprise admin accounts-only logon to domain controllers and dedicated workstations (see ''Privileged Acee s Work tations" architecture).
Note that part of thi wil l be lo (again) rai e emplo ee security awarene s: IT personnel should understand how to use (and how not to use) administrative privileges.

© 2017 Erik Van Buggenhout & Stephen Sims

147

Active Directory Hardening & Segmentation -Additional Resources
Some additional resources concerning Active Directory Hardening & Segmentation:
· Active Directory
https: // ~thub.com /gentilkiwl/mimikatz /wiki
Active Directory Security
bttps: //adsecurity.org/
· Kerberos https: //en.wlkipedia.org/wlki/Active Directory

SANS

.

.

I

Active Directory Hardening & egmentation -Additional Resources Some additional re ources concerning Active Directory Hardening & Segmentation:
Active Directory https: //github.com /gentilk.iwi /mimikatz/wiki
Kerberos https: //en.wikipedia.org/wiki / Active_ Directory

148

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
Day 1: Knowing the adversary, knowing yourself Day 2: Averting Payload Delivery Day 3: Preventing Exploitation Day 4: Avoiding Installation, foiling Command & Control & thwarting lateral movement Day 5: Exfiltration, Cyber Deception & Incident Response Day 6: APT Defender Capstone
SA~

SEC599.4

Avoidi~g Installation

Typical Persistence Strategies

Exercise: Catching Persistence

Principle or Least Privilege & User Access Control

Exercise: Local Windows Privilege Escalation Techniques

Foiling Command & Control

Network Monitoring Considerations (Necflow, IDS, .. .)

Detecting Command & Control Channels

Exercise: Suricata to Detect Network Anomalies

'Thwarting lateral movement

Introducing Common Lateral Movement Strategies

Active Directory Architecture & Attacks

·

Active Directory Hardening & Segmentation Exercise: Hardening Windows to S1;.op Lateral Movement Detecting Lateral Movement Using Windows Event Logs

Exercise: Configuring & Forwarding Windows Event Logs

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

149

Exercise - Hardening Windows to Stop Lateral Movement
'
IThe objective of the lab is to harden our Windows AD environment from the lateral movement strategies we just discussed. We will use a variety of techniques for this: disabling cached credentials & implementing CredentialGuard!

High-level exercise steps: 1. Stealing credentials from the cache &memory 2. Disabling cached credential in Windows 3. Enabling ente11>rise guard throughout the environment 4. Confirming the fixes, we've added to our environment

,il,.'r.\u)N,l,'
-

-

- -- -

--.,". ·

--

'· .

I

·

-

-

-

,~

'

-

·
-~

Exercise - Aardeni11g Windows to top Lateral Movement The objective ofth lab is to harden our Windows AD environment from the lateral mo ement strategies we just discussed. We will use a variety of techniques for this, including disabling cached credentials & implementing Credential Guard!
hroughout the exercise, we will complete the following steps: I . Stealing er dentials from the cache & memory 2. Disabling ca hed credentials in Windows 3 . Enabling enterprise g uard throughout the environment 4. Confirming the fixes we' ve added to our environment
For additional guidance & detail on the lab, please r fer to the LOOS workbook.

150

© 2017 Erik Van Buggenhout & Stephen Sims

Exercise - Hardening Windows to Stop Lateral Movement - Conclusions
During this exercise, we implemented two excellent techniques to prevent adversaries that obtain local administrative credentials to further move laterally within our environment:
· We rusabled Windows cacbed credentials, to prevent extraction of cached domain credentials from local systems. Tread carefully with this feature however, as systems who are not connected to the domain will be unable to authenticate in such a case.
· We enabled CredentialGuard on our Windows 10 system, thereby isolating the LSASS process and thus breaking Mimikatz' memory dumping capabilities.
Exercise - Hardening Windows to top Lateral Movement- Conclu ions During thi e ercise, we implemented two excellent techniques to prevent adversaries that obtain lo al administrative credential to furth r move laterally within our envi ronment: · We disabl d Windows cached credentials. to prevent e traction of each d domain credential from
local systems. Tread carefully with this feature, howe er, as systems who are not connected to the domain will b unable to authenticate in such a case. · We enabled CredentialGuard on our Windows IO ystem, thereby isolating the L ASS proce sand thu. hreaking Mimikatz' memmy dumping capabilities.

© 2017 Erik Van Buggenhout & Stephen Sims

151

Course Roadmap
Day 1: Knowing th adversary, knowing
yours lf
Day 2: verting Payload Delivery Day 3: Preventing Exploitation Da
lateral movement
Day 5: Exfiltration. Cyber Deceplion & Incident Respoo Day 6: APT Defender Capstone
SANS
This page intentionally left blank.

SEC599.4

Avoiding Installation

Typical Persistence Strateg1e~

Exercise:. Cat0h1ng Persistence

Prlndple of Least Privilege & User Access Control

E>tercise: Local Windows Privilege ~caladon Techniques

Foiling Command & Control

Nerwork Monlrnrjng Comllde1i1tions (Net:flow, IDS, .. ,)

Detecting Command & Control Channels

Exercise: Suriata to Detect Network Anomalies

Thwarting latent.I movement

Introducing Common Lateral Movement Strategies

Active Directory Architecture & Attacks

Acuve Director')' Hardening & SegmenC10on

Exercise: Hardening Window to Stop Lateral Movement

·

Detecting Lateral Movemen Using Windows Event logs Exercise: Configuring & Forwarding Wlndows Event log,s

152

© 2017 Erik Van Buggenhout & Stephen Sims

Introducing Windows Event Logs
CJ IWindows event logs are log files kept by Windows to keep track of all sorts of events. They are typically stored locally in C:\Windows\System32\winevt\Logs\.

· Though not only designed for security investigations, Windows event logs an:! a GREAT way of obtaining visibility on what is happening on your endpoints;

· Up to Windows XP, the format used for Windows EventLog is EVI'. Starting with Windows Vista, the format used for Windows XML EventLog is EVTX·

· Logs can be viewed locally with the event viewer (eventvwr.msc) or with various command line tools (wevtutil.exe PsLogList, ...). Windows event logs can be forwarded & centralized to a central repository such as Splunk, Q-Radar, Arcsight, ELK, .. .

~ SANS

--

.

-

---

.

,
-

Introducing Windows Event Logs ince the intToduction of Windows T in 1993, the Windows operating system has kept logs of events
that look place while the operating ystem was running. Events are very important for managing and troubleshooting Windows but are also very important for ecurity. For example, to detect intrusions while they are happening, or for post-facto digital forensic investigations.
App lication and the Windows kernel can generate events. For example, Windows will generate several e enls when it i. started. and man applications will generate events when the encounter an error.
Windows events have a well-defined format and ar stored in files called event logs depending on their 'source". For example events that originate from the Windows k mel when Window i. started are
stored in the System event log, while error events from applications (without dedicated event log) are tared in the Appl ication event log.
By default, event logs are stored locally in folder C:\ Windows\ ystem32\winevt\Logs\. Up lo Windo,; s P, a proprietary, binary file fonnat was used to store event logs: the EVT format. tarting with Windows
Vi ·ta. the format u ed for Windows XML venlLog is EVTX. This is a binary XML format. By switchi ng to XML, MicrosofL up,;:11 · up its event logs for even more interoperability with third patties. but XML is a ery verbose text format that would negatively impact perfonnance. Therefore Micro oft opted for a binary ML fom1at.
There are a couple of native Windm stools to view event logs. There i th event vi wer, a graphical user interface tool that i a snap-in for the Microsoft Management onsole (MMC). Wevutil.exe is a command line tool.
Event logs can al o be viewed with Power hell and many third-part tools, like ysintemals ' PsLogList.

© 2017 Erik Van Buggenhout & Stephen Sims

153

The Event Viewer Interface
·

CJ "

The event viewer (eventvwr.msc) 1s a graphical user inteiiace tool to browse through event logs.
It 1s adequate for ad-hoc browsing. but not adapted to search through logs.
The filter functionality is for example extremely limited and does not allow us to combine complex conditions .. .

The Event Viewer Interface The ~vent viewer (e entvwr.m c) is a graphical user interface tool to browse through event log$. 11 i a
snap-in for th MM . In the creenshot above, we can ee the ariou element. fthe e ent ie, er napm.
Left is a tree-view of all the different Window logs. riginally,just a couple or!ogs e i ted on Windows T (Application, ecuri , stem): the e can be found un ind , Log . But ince long, application
and crvice can ha e dedicated indows event lo· . The e can be found und r ·'Applications and Service. Logs".
Righi to thi tree- ie , a list-vie\ of all tl1c events torcd inside thee em log i displayed. In thee ample above, we elected c ent log ' tern in the tree- iew, and thus the c cnls of , yst m are di played in th Ii t-view.
The Ii I-View display important properties of each event in column . like the Le el, Lhe DaJe and Time, the urc , the E ent ID, ...
When an event I!- st~lected, the details are displayed below the list-view: in the example al,1.1v1.:, we sele tcd a Warning e ent entry with event I 219 originating fr m the Kemel-PnP ubsy tern.
E eni iewer is adequate for ad-hoc brO\ ·ing, but it i not well adapted to earch fficiently through a
large number of events. Some r rm of automatic procc ing is required for efficient hunting.

154

© 2017 Erik Van Buggenhout & Stephen Sims

XML Structure of Windows Event Logs

SECS99

D X

:\Oecno>wevtutil.exe qe setup

...

<Event xm!ns·'http://scheaas. icrosoft.CC)jlj/win/2804/88/events/even

'><Syste~><Provider Na e·'Afcrosoft-Windows-Servicins' Guid·'{BO1

2F3S8-FC49·4A61 -A397-87A813A869Cl}'/><EventIO>l</EventlO><Version>

</Version)<level>8</Level> rask>1</Task><Opcode>8</Opcode><Keywor

ds>8xseeee08968898008</Keywords><TimeCrea ed Sys emTime·'2816-11-2

2Tl7 : 21:58 .8866389002°/><Even1:RecordIO>l<fEventRecoro1o><C"°rrelat1

nJ><Execution ProcesslO·'3288' ThreadtO-'4888./><Channel>Setup</C

hannel><COll1puter>Works ation ·8l</C0111puter><Securlty UserfO·'S - l-S-

18'/></Syste ><UserData><CbsPackagelnitiateChanges xmlns-'http://~

anifests.microsoft.conr/win/2964/88/windows/setup_provider·><Packag

eidentifier>KB3199986</Packageidentlfier><lnitialPackageSta1:e>Abse

nt</InitialPackageState><IntendedPackageState>Staged</ln endedPack

ageState><Client>WindowsUpdateA.gent</Client><ICbsPacka9etnitiat.ech

nges></UserOata></Event>

<Event )Ullns-·ht p://sche~as . caicrosoft . c011/win/29041es/events/even

'><System><Provider NaQe·'IUcrosoft-WindO s-Servicing· Guid·'{BDl

2f3S8-FC40-4A61-4387-87A813A869Cl}'/><EventIO>3</Even ID><Version>
0</Version ·<Level>0</Level><Task>l</lask><Dpcode>0</0pcode><Keywor

. . ds>exseeeooeeeeeeaeee</Keywords><Tfme<:reated Syste Ti~e- · 2016-11 - 2
2T17:~2:83.S16224188Z'/><EventRecordl0>2</ EventRecordIO><Correlati

-
I SAN~

Running the wevucil.exe command line tool to query evenrs (qe) of the setup log clearly illustrates the XML nature of event logs.
In the "dump" to the right we can clearly observe the XML structure in use by the event log. This structure can be easily imported by log management tools.

XML tructure of Windows Event Logs Wevtutil.exe is the built- in command line tool from Microsoft to manage event logs, and it can be used to review event logs from the command line. ft can be used to export, archive, clear logs, ... But in this example, we will show how to us it to query logs.
Wevutil.e e requires a command as an argument to instruct it what to do . ln this example, where w want to query logs, we use command qe. This command requires the name of the log that we want to query, here we will u e setup.
By xecuting this command, wevtutil will output all events in an XML format (text XML). This fonnat i not very readable for humans but is appropriate for parsing by various too ls. We can see that an event tarts with the <event> XML tag and ends with </event>. The event ID of the first event (<EventrD>) is I.

© 2017 Erik Van Buggenhout & Stephen Sims

155

Windows Event Logs Structure
Starting with Windows Vista, Microsoft overhauled its Windows event log systems. Because of the new flexibility to create dedicated event logs, a seemingly myriad number of event logs were created. The traditiona11y important ones are, however:
· Security: The Security log contains events such as valid and invalid logon attempts, as well as events related to resource use, s· ch as creating, opening, or deleting files or other objects.
· Application: The Application log contains events logged by applications or program . · Setup: The Setup log contajns events related to application setup. · System: The System log contains events logged by Windows system components.
Every event in such a log has an "ID" (number) and a "level" attributed, whlch can be "Information' "Warning" or' Error.

SA~S

' I

Windows Event Log Structure Starting with Windows Vista, Microsoft overhauled its Windows evenr log systems. Because of the new flexibility to create dedicated event logs a seemingly myriad number of event logs \ ere created . Originally !here were only the following logs:
· Security: The Secunty log contains c ents such as valid .and invalid logon attempts, as well as events related to resource use, such as creating, opening, or deleting files or other objects.
· Application: The Application log contains events logged by appljcation or programs. · Setup: The Setup log contairu; events related to appli ·ation setup. · System: T he System log contains events logged by Windows sy. tern component .
But since Windows Vista, many logs can be found under "Applications and ervices Logs'', but the traditionally most important ones remain .
Each event has an event ID, this i a number tliat indicates the type of event. Fore ample, e ent 1104 means "The security Log i now full". Other event logs can have events with ID I I04, but they have a different meaning (if they exist). For example, an event log Mier soft-Windows-GroupPolicy, event 1104 mean "Grour Policy Preproc sing (W I)''.
n event ha a' level' . and this can be: Information Warning
ffOT
It must be aid that thi I vel i not particularly u eful (or our purposes. or monitoring and detection purposes, a lot of"infonnation' level events are important.

156

© 2017 Erik Van Buggenhout & Stephen Sims

Configuring Windows Event Logs

l.ogfRth
WJ

s,,~~--...,--··W.--··-"'·"'·
Ol-1)ti,lnl

Not all event logs are enabled by default. This event log for example contains important events for the use of USS removable storage. Since Windows 8, it is not enabled by default. Furthermore, con-ectly si-zing an event log is also hnportint.

·,. .E,._....,.~,_j<JI~
VI~ ~ ~ 1Ndl09Wi:fll fudwd'

Sysmon v6.10
·

Configuring Windows Event Logs When we look at the properties ofan event log in event viewer, we can see information and options to configure the event log. We see the foll name of the event log and th location where the log (.evtx file) is stored. More information includes the size of the log file and its timestamps.
In th example above, the file size of event log Driver rameworks-U erMode/Operational is zero, and it has no timestamps. That is because the event log is not enabled; the toggle Enable logging i not set.
We choose this event log a an example becaus it contains important events for the use ofU B removable storage. For xample, when a USB stick is inserted into the Wind ws machine, an event v ill be written to this event log. This event log is enabled by default on Windows 7, but since Windows 8, it is disabled by default. Another excellent addition to , tandard Windows event logs is Sysinternals Sysmon. We will cover it in-depth later!
We recommend enabling this event log on the work tations in your corporate enviro1m1ent. In this e ample. we illustrate this via the event log properties dialog in Window event viewer, but this is something that you would typically configure via Active Directory GPOs.
Another important property is the maximum log size of an event log and the action that needs to be taken
when thi maximum would be exceeded. In tl1is example, the max imum size would be ju ta bit more than 1MB ( I028KB). The size of an c ent log must be tuned by taking into a_ccount the number of e pected events, and the retention time needed.
By default, when the log g,Tow to the maximum size, older e nts are dropped (the old . vt file fommt was a circular list). But an event log can be configured to archive older event logs, or just to stop logging (not recommended). When event logs are cleared manually (Clear Log button, this requires admin rights), an vent indicating the log clearing is created.

© 2017 Erik Van Buggenhout & Stephen Sims

157

Centralizing Windows Event Logs

__ ....... ___ _

t ~·JtfN/f~to.....,,. ww1bQ. ........ , , ~ ~ , .......... (lit

,\ ...4t.lfli0

.,,. ~;,o,,, ,... .,,"'°""5"£

· ""'"""""'in-.1

ot OD.,o..,..,,.,,'14:a.'-'1·f-4'

llq...-· It TO *"'UWIWi\Jt 1,111 ~ tN COtti!OUtll'I 11- · tlmac!'

In an enterpr'ise environment however, we cannot query systenis individually. so we neccl to centralize the event logs for sto~ge & ~nalysis.
"Subscrlptjon~" arc a Microsoft technology to handle llm. To stan: using subscriptions, the Windows Event Collector & Windows Remote Mana,gement services must be running.
When the Windows Event Collector Service is started. subscriptions can be created.
Subscriptions can be pull {collector initiated) or push (source computer initiated) subKriptions

Cen1r:ilizing Windows Event Logs Event logs can be centralized. There are different third-part ·olutions for Lhis, like plunk, Log or Fitebcal (ELK), but it can also b done u ·ing icro oft' technology lhat come , out-of-the-bo with
indows. Thi ; called indow E ent Forwarding. and i done with ub criptions.
Once the Window Event ollc tor Service and Windo, Remote Management ervrce arc tarted sub criptions can be created. Ea ·h sub · riplion require · a name (to be chosen b che admini trator), and an optional description. ub criptions can b pull (collector initiated) or push ( ource computer initiated) sub ·criptions.
In a collector initiated subs riptton (pull), the source computers ha c to be selected. The e ha e cob domain members. In a source c mputer initiated sub cription (push), the source computers groups ha c to be selected. The e group can be domain m·mbers or non-domain members. In the case of non-domain members, certificat1:s have to be pro ided for auth ntication and en ryption .
The advantage of a . ource comput r initial d ub ription i that event logs from n n-domain computer can be collected to . Fol'\ arding all even from many computer would create loo much data, therefor events ca n be filtered prior 1n Ii rwarding.
indo\\ Event Forwarding require no additional soli are and can be confi ·urcd with a few imple steps. We will illu Irate thi ia thee enf\iwr dialog and , ith a command-line configuration, but of course, thi configuration is not something you would do manual I on each machine. This is something you would cripl "ith Active Directory GP s.

158

© 2017 Erlk Van Buggenhout & Stephen Sims

Centralizing Windows Event Logs - Windows Remote Management

, \\l!ndow1 \ ;yst..'2~ln"' ~< tnRH h nat Ht up to reteiv· l"'«q1.1e1tt on thu- Nthine . lh follo,nni <h·nce,~ wn- be . . . ·

· ,<

~. tlw·· ch·ncu Iy/ n)1 y

lrtRK i....-Vlt~ Jti,l'"\-.d,
'"~ h '10t ut up t:o ·llCMt re4Cltt" u c..-u to c.h.u. M-!;hlnl' fo.,. ·n·J"IWnt
f0Llw1n, c:h·na~.$ .,lt b4J Je =
n11ble t..-e WlftJt.i1i hre,,,·ll ·~c.r.pnoR , onfle:ur-t lOC:alAtcountTot-;enflht.1rPol& ( )' to 1r-,1111n 1dainhtl' UYf!' r11no r't1:10uly t:o to ·1 u1er.s,
l<e ·~·· <hone" (y/nl'

The Windows Remote Management Service is an essential service required for Windows Event Forwarding.
This service will cake in charge the transmission of events over the network via encrypted connections.

tn-. flrbNU ·Jttt!'ptJo,, .eno11bh·d nUgured toc;i1lAtot6Unt'rO"-.t"t'IF1lttrftoUty to v..-i;t aoaini.stNt&'4't r-l&ht t r11 IUill!!r-S .
: \Wi.Jldow'i\sy.st.eaa;Jl>.

tly to 1

SANS

Centralizing Window· [vent Logs - Windows Remote Management The Windows Remote Management Service is an essential service required for Windows Event Forwarding. This service will take in charge th transmission of events over the net~ ork via encrypted connections.
The Windows Remote Management Service not only requires to be started automatically when the computer starts, but it requires configw·ation of the firewall. This can be done with the winrm command.
Open an elevated command line prompt as administrator, and issue c mmand "winm, qc '. Reply ye to both questions that are asked.

© 2017 Erik Van Buggenhout & Stephen Sims

159

Filtering Windows Event Logs

As you can imagine, Windows event logging n generate a lot of events & thus a lot of noise...

1 · ·,,..

....

We can however implement filters that will ensure only events are being forward d that m t ertain conditions:

· Tim when the event occurred; · Event level (error warning, information ...) · Event ID · Username ·

SANS
Filtering Windows Event Log As you can imagine, Window · e ent log~ing can generate a lot ol events & thus a lot of noi e... We can, however, implement tilters that will ensure onl_ e ents are being fon arded that meet certain condition ·. E ent · can be filtered b man criteria;
· Time when the event occuiTcd · E cnt level (error, warning., ... ) · E ent ID
· Ta k ategory · Keywords
~ur omputer
We r com mend tillering by event ID (and use lhe event IOs as dis u.sod before i11 the A document). To configure filterin b e ent ID, the log or ource must be selected, Then it i · possible to enter event IDs in the lilter field . E ent LD have to be parated b) a omma ( ). range of event IDs can be pecified b separating the minimum and ma ·imum e;:vcnt ID by n dash(-).
All the event pccilied will be in luded . To c 'elude particular e en · their event ID ha et be 'negati e", fore ample -1 I04. nly evems that match the criteria defined in thi dialog, ill be
forwarded.

160

© 2017 Erik Van Buggenhout & Stephen Sims

Alternatives for Event Forwarding - Winlogbeat & Nxlog

Another approach preferred by some organizations is the addition of host-ha ed ag nts for Window event forwarding. We will hortly di cuss two solutions recognizing that many other exi t:
Winlogbeat is lightweight log agent that can b in talled n Windavvs
system to transfer the event log data towards Elasticsearch server. This
ag nt runs as Windov. ervic and you can specify which v nt log ~to monitor by editing the winlogbeat.yml" file.

log

NX.Log i an opensource multi-platform log agent. This agent is similar to sy log-ng and r ys)og with the exception that it upports multiple platforms, including window event log .

In large corporate environments host-based agents are preferred for implementation to standardize logging capabilities and configurations on multiple platforms.

Alterna1ives for Event Fonv11rding- Winlogbeat & XLog Another approa h preferred by some organizations is the addition of host-based agents tor Wmdows event forwarding. The advantage of the e i' that they ollen pro ide additional functionality to aJlow sending of Windows evem log. to non- icro oft s tem uch ru an ·lastic earch clu ter. We \\ ill h nl) di cuss two solutions, recogni:;,,ing. that man thers exist:
· Winlogbeat is light\veight log agent that can be in talled on ind ws system to transfer thee ent log data lO\ arcls lasticsearch crver. TI1is agent run as a Windo, s ervice, and ou can pe ify , hi ·h event logs to monit r by editing the ''winlogbeat.yml" tile. Log is an opensource multi~platfom, log agent. This agent i imilar syslog-ng and rsyslog with the e, eption that it support.<; mulliple platfonns. including Windo\ e ent logs.
In larg corporate environments, host-based agents arc preferred for implementation to standardize logging. capabiliti sand configurations on multiple platforms.

0 2017 Erik Van Buggenhoul & Stephen Sims

161

But What Events Are Relevant for Us?
In most organizations the number of1ogs and e ent IDs · staggering...
· Ilesides Mi rosoft' own d cumentation, man good r ource n the Internet provide tailed explanations of individual nt 10 ' . A few arnples of uch ources are eventid.net ( ubscription-based) or ·www.ultimat wind , , ecuri .com.
· Th difficulty often. however, is not to understand a specific Windows v nt ID. but understanding in, hat cont xt a comhinati n of Windows e ent IDs can be rel vant. For xample: "What combination of ev nt IDs indicate an adversaJy generat d a golden tick t?"
:veraJ" hite-pap r & r urces exi t that att mpt to explain h ,v event 10 can b u ed to detect attacks against th environment. n exampl of such a paper is "Spotting the Adversmy with Windows Event Log Monitoring" publi hed by the N /CSS. Another excellent resource i "'Detecting Lateral Mouement through Tracking Event Log$", publi hed by JPCERT/CC.
Rut hat ent Ar Rete,·ant for t\s lated b ·fore, there are a lot of Window event log , and 'therefore even more, event IDs. It require · a lot of practice and e pcrience to under land the mo t important event IDs and to kn \ how LO respond adequate! .
To help with the understanding of Windows 1::vent log . evernl good re ·ources are available on 1he Internet. Microsoft o, n documentation i a bit lacking when it c mes lo ent log , ot all · cnt IDs are clearly d umented. and explain e actl) \ hat they mean.
Thi · situation has led l the rise of dedicaled resources for Window event logs. rhcre are c t.·ral web ite that rry to define as much indow event ID as p sible. nc of these ·itc is cntld.n 1. Thi. is a ub ·ription bas ·d rvi e. nolher one i htLps://www.ultimatewindowssccurity.com/securitylog/default.asp , thut will pro ide some infonnation without rt:gi tration.
The difficulty often, however, 1s not to understand a specific WindO\ event ID, ut understunding i11 wh11t conte la combination of WindO\ s e ent IDs an be rele ant. For example: "What c mbination of
ent ID indicate an adversary generated a golden ticket?" Third parti have also co'llect d all their kn wledge and recommendation on Windows e ent logs in a single re urce. An e ·cellent t:Xample is lhe document "Spoiling lhe Adversary, ith Windows Event L g Monil ring" pr duced by UH: SA/ .

162

© 2017 Erik Van Buggenhout & Stephen Sims

eventid.net & www.ultimatewindowssecurity.com
-, ...

...._ ~--=i2a'>12:-,-::, t;> Windows Security l Event 10 4776 ¢_______________

4776. TM llom~ n «inlt<>!I lll:t""1placl to

\/ll!lcb U, cn,der, _/~ls fOf n c.ounl

I.I

T6:r ,_;;--

. ,....i-~ · DescrlpOOl'l<f!NSM!lt

·-.~-r"""" ._,~
~.M.1

I

· rn '-'1 1, On-..onrv ~t U-4/76

Next to the official documentation provided by Windows. sources like eventid.net & www.ultimatewindowss ecurity.com provide indepth details on types of Windows event IDs.

' SANS

-

· a

·

eventid.net & www.ultimatewindowssccurity.com ext to the official documentation provided by Windows, sources like eventid.net &
www.ultimatewindowssecurity.com provide in-depth details on types of Windows event IDs.
Eventld.net is a subscription-based website with tons of information. T he number of an event [D can be typed in the form above, and then all sources that have an " vent LO with a partictllar number wi II be listed. Searching can be limited to a particular source. Besides the source and explanation of U1e event ID, users can post comments. ome information i available for free without registration, but bu ing a ubscription opens up much more information.
On the other hand, \-YW\¥.ultimatewindowssecurity.com which i illustrated on the slide, provides in-depth infonnation without any subscription being required . Both are excellent sources of additional information!

© 2017 Erik Van Buggenhout & Stephen Sims

163

lnterestingWindows Event IDs

Michael Gough (@HackerHurricane) created a presentation in 2015 where he listed six highly interesting Windows event IDs everyone should monitor. He labelled them the' sexy six". He advises the following steps to b taken:

· Enable command line logging!

· Enable Advanced Audit Policy in Windows

· Configure the following event IDs to be logged:

·¥4,lii·F

·l!!l·;w·,·t1"i !l·M· Description

4688 A new process was executed

51 56 Windows firewall network connection

4624

Successful authentication

7045 A new service was added to an endpoint

5 I40 A network share was accessed

4663 File & Registry auditing

Next to these 'six", here arc a few others we have found tc> be very u eful:

4648

Logan using " explicit credentials"

s,AN~1

4728 A used was added to a ··privileged" group

4732

4756

·. . .

.. -

.
11

Interesting Window Event JDs Michael Gough (@HackerHurricane created a pre entation in 2015 where he Listed ix highly interesting Windows event IDs everyone hould monitor. He labeled them the" ex six'·. He advises the following steps to be taken:
· Enable command line logging! · Enable Advanced Audit Policy in Wi.ndows · Configur the following event ID s to be logged:
· 4688: A new process was executed · 4624: Successful authentication · 5140: A network share was accessed · 5156: Windows firewal I network connection · 7045: A new service wa added to an endpoint · 4663: File & registry auditing
ext to these "six'', here are a few others we have found to be very useful: · 4648: Logon using "e plicit credentials". When accessing remote systems in a Windows environment.
there is typical! no explicit credentials being u ed (due to Window:,; uccess tokens & O). Whenever authentication is performed using "explicit credentials" (i.e. explicitly providing a password), thi s event ID will tTigger; · 4728, 4732, 4756: A user was added to a privileged group. This can be useful in later stages ofthe APT Attack Cycle, should adversaries be creating additional admini trative accounts.

164

©2017 Erik Van Buggenhoul & Stephen Sims

Spotting the Adversary with Windows Event Log Monitoring

Spotttng the Adversary with Windows Event Log Monito1 ing

1005 1006, 1008. 1010, ZOO 2003. 200< ~ 3001. JOOZ JOO! - · JOIO Incl J02l

10UIIM Ulll

2 and 19

10l 102 102· 'Nmi, 70)1. 10n. 1m.

1115. 1121, Ul"l'

116~ U6 IG1. lla.

8Cl07

ill~· ll, JI.M-,:IS

50 6111, lli 104»odll02

"Spotting the Adversary with Windows Event Log Monitoring" is the reference on event log monitoring, published by the NSA/CSS.

Table I of " Spotting the Adversary with Windows Event Log Monitoring" provides a very good overview of essential event IDs that should be monitored.

'""

. .

·SAN~

-

-

-~

.

.

-

.

-

potting the Adversary with Window Event Log Monitoring "Spotting the Adversary with Windows E ent Log Monitoring' is the reference on event log monitoring, published by the NSA/C S. Thi lengthy document (around 50 page ) is a mu tread for blue team . II was last reviewed 16 July 2015.
The following topics are covered in detail: · Deployment · Hardening Event Collection
Recommended vents to Collect · Event Log Rel ntion · Final Recommendations
Deployment wi ll not only cover the configuration of Windows event logs but also centraliz ation of these log using Microsoft's publi her/subscriber model. It must be said that this is not th only way to centra lize event logs. There are many other systems, for example. plunk come to mind .
https://www.iad.gov/ iad/li brary/reports/spolting-the-adversary-with-window -event-log-monitoring.cfm
Table I of"Spotting lhe Adv rsary 'vvith Windows Event Log fonitoring" provides a very good overview of essential e ent IDs that should be monitored.
The event IDs them elves are not exp lained in much detail in this document, however.
Let's illustrate this with event ID 4648. ll1is ID is mentioned fir ·tin table I (under account and group activities), and second in table 9. From table 9, we know that this event is from the Securi event log. The description of this ev nt is "Account login with explicit credentials". However, the document does not provide more infom1ation about this event, and why it is important.
Ifwe tum to eventid.nel. we get more information:

© 2017 Erik Van Buggenhout & Stephen Sims

165

"Thi e ent is generated when a proce attempts to log on an account b e plicitl specifying that account's credentials. This mo t commonly occurs in batch-type configurations such as cheduled tasks, or when using the RU AS command. '
And th re is al o a user comm nt that explain in which circwnstances the u er aw this e ent.
From this information, we can indeed conclude that this is an important e enl ID to monitor: with singlesign-on, users on indo s don't ha e to pro ide explicit credentials lo acce a remote service. lfthi happens, it mean that a user could not u e ingle-sign-on. This can indicate an attack, where the adver ary is imp rsonating another user.

166

© 2017 Erik Van Buggenhout & Stephen Sims

Introducing Sysmon
Sysmon is a System Monitoring tool by Windows Sysinternals.
A word on Microsoft Sysinternal tools first:
· The company Winternab founded by Mark Russunovich and Bryce Cogswell was acquired by Microsoft in 2006.
· Winternals offered a set of free system administration and monitoring tools: Sysinternals.
· The tools are now offered and developed by Microsoft under the name Windows Sysinternals.
· Sysinternals Suite is the collection of all tools.
Introducing ysmon ysmon ( ystem Monitoring) is a tool by Window y internals. Before we dive into this tool, a bit of
history can help us understand where these tool come from .
Wintemals was a company founded by Mark Russ inovich and Bryce Cogswell. This company provided Windows administration tools as paying produ ts (Wintemals) and free products (Sy internals). In 2006 Microsoft acquired Wintemals, Mark Russinovich became a Microsoft Technical Fellow, and the Sy internal tools were rebranded as Windows ysintemals.
Mark Russinovich still maintains and develops new tools for the Sysintemals uite (the collection of Window ysintemals administration and system tools). These tool have a shorter d ve loprnent lifecycle than other Microsoft products. ll is not unusual to have everal updates per year for tools like ysmon .

© 2017 Erik Van Buggenhout & Stephen Sims

167

' Sysmon

Sysmon is short for System Monitoring.
Sysmon installs a Window ervice and a device driver.
These components rnouitor activity on a system:
· Creation and termination of processe · Loading of ecutabl imag s · etwork connection e tabli hing ·
Activity is recorded with events.

~ --

Sysmon v6.10
1y---..-.-(--- 0
lllawftloNSy,......,11..tMtl

SANS

Symon y mon is a y tem monitoring loo) that i part of the . y ·internals. uitc.
It i at I that\! as originally de eloped lbr Microsoft. II i deplo. ed on man of their server and workstations to monitor system activity. In ca e of incid nts, ysmon provides a valuable I g of system activitic~ that can h Ip forensic investigators to recunstru tan incident.
y internal tool a tand-alone tools that don't come with an in taller (lik etup.e ·e or in talt.msi . r sn10n, there is smon.e. e and ysrnon64.e e.
y mon.e e is a -- 2-bit ver ion that embed the 64-bit er ion too. y mon64.exe i a 64-bit e ion onl , it is pro ided for indm s y ·tern that onl. support 64-btt executables, and not 32-bit (Window ervt:r ithout 32-bit subsystem).
If the ~-bit version i. e ·ecuted on a 64-bit O · it will e tract the 64-bit version and run that in read .
When ysmon i in tall don a Windows machine, it installs a Window service and a de ice driver. These components ar necessary to detect nd record system activitic like the creation am.I lt:rmination of procc . cs. loading of xecutable image . creati n of n 1, rk connections, loading of dri er ··. ..
I thi acti it is I gged in a dedicated Wind ws event log.

168

e 2017 Erik Van Buggenhout & Stephen Sims

Installing Sysmon

Installation
Sysinternal tools are standalone tools without installer (~Prnp exe of msi file)
To install sysmon, run sysmon as an elevated administrator.
To accept the EULA lrom the command line (and prevent display of the EULA dialog box), use option -accepteula.

)IS.ti· "°"nor v6 ~'91 · SY'-t.a. ·<.th >. cy J110nltor onola~~ (C) 2a1A, l$ll ,....., ~unjn<>vlch · ad T._., Garnt<r yt.Jt\tef'fl:ljs · w- . 1v1J"lt· r-n· U . t:oa

Iyrt.m ,-,4of,_f1:W ucenw Agfffll'WOf
, ,qu..,..,_.,_ _ _

..__.,_,.,.EIA.A

)<

_..,._1_...,,,>..,A~-s~v,-,,,\-(·"""""' SYSINTERNALS SOFTWAA[ ucrns TERMS

cmroed ~ ' J I tJf"""o,ol\ ~

) Md~- ,,.._ .,,<14 lhom.

!'Myln~dWto tUolttbsotfmtw,,ocnb.,o.,n. y,'N<fl""'~ll.~urSyyo.lmT,t.-,_o_,m _,

"l'l'i!'U>""'f~

In talJiug Sysmon
To install Sysmon on a machine, start command "sysmon.exe - I" from an elevated, administrative command prompt
Before the installation of the Service and driver takes places, a dialog with the ULA will be presented to the user. This EULA has to be accepted to proceed with the installation.
This EULA is presented the first time sysmon is executed. This is the case for all ysintemals tools: after acceptance of the EULA, the dialog is no longer displayed.
A this dialog hinders unattended deployment of a tool like sysmon.exe, the EULA can also be accepted by providing option - accepteula on the command line. With this option, the dialog box with the EULA will never be displayed. Remark that typing - accepteula i considered equivalent to clicking on the gree button: you accept the ULA.

© 2017 Erik Van Buggenhout & Stephen Sims

169

Sysmon Installation Confirmation

Confirmation
After acceprance and installation, Sysmon will report which co!Tlponents were inst1lled .
fn chis case, the defaulL configuration is used .
Sysmon is immediately and completely active, no r<!boots are required.

·\install>Sysmon .e~e - 1
system Monitor vG . 92 · syst m activity monitor opyrigh1: (C) 28l" · l817 M11rk Ruu.l11u~ HJ· end rho,.as barnier
ys!nteN1als ...,.,, sysinternals.cOffl
ys111C1n installed. ys1110norv 1nst1lled. tarting sysn,onOrv. SysmonOrv $tart d , tart1 ng Sys1110n. ys1110n started.
:\install>

SJ\NS

Sysmon Installation Confirmat:ioo After accepting the - LA, ysmon will install its service ( ysmon) and its driver (SysmonlJrv). In the screen hot abo e, we can ee 1h01 ins1allation was succc ful: lhe ·crvice and Lhe dri er were in talled and started. o reboot i required.
Without configuralio11 file or c nfiguration option, ysmon will be installed, ith the default configurati rl and will run with these setting until they are changed.
ysmon can be deployed as an application with group rolicies on all the machines in your environment. Ir you need custom configuration. (v hich we recommend), it can b easier to packng sysm n and the configuration file in an MSI file and deploy that through group policie .

170

© 2017 Erik Van Buggenhout & Stephen Sims

Default Sysmon config
With the defaulc configuration, Sysmon will start logging process creation and termination to a dedicated Windows event log.
In this event. we can see notepad.exe wa~ executed to edit a file with name passwords.ext
- SANS

~ tf_,.0 T,ot,,C..

--- .,_ r~

J ..... V-

,.,._

uur-
-Id

.lCIN)S-30 1l,J<J.26.22t 1JS)lAllH1fC ~.'IHIOO(> QIJ !08PiO1a00i

,,.,,.,

c..~w~:~

Coe.imandlina i,t,1~~-11\

CurrentOkaap,n; C'\.rttt
~

-

-

-

0

"

..

· .· _

Default ysmon config Once Sysmon is installed, it will start monitoring system activity and create events in a dedicated Windows event log ( ysmon / Operational). These events contain a lot of information that can help us reconstruct what happened on a machine.
In the example above, we see a Process Creation event (Event ID I): this event is created each time a new program is launched. The program that was law,ched i notepad.exe.
from the command line property, we can see what file was edited with notepad.e e: passwords.txt
Sysmon not only records the Process ID, but also a Process GUlD. Proce s IDs are a 16-bit integer.
Because of this limi tation 6S536 possible combinations). Process IDs can be reused~ for example, after a
couple of days, depending on the amount of activity of your system. a new process can be created that will also have the PIO 640.
Since thi can be a problem for log correlation, y mon will create a unique I roce GUID per process. Another u eful piece of information in a Process Creation event is the cryptographic hash of the content of the execurab le notepatl.~xe in our case). Oy default, this is a SHA I hash but Sysmon can be configured rouse more hashes too.

© 2017 Erik Van Buggenhout & Stephen Sims

171

Sysmon Event Types

Sysmon version 6.10 records 21 different types of events:

·4%,iii·M Description

Event ID I · I t

I

Process creation

12

RegistryEvent {Object create and delete)

2

A process changed a file creation time

13

ReglstryEvent (Value Set)

3

Network connecdon

14

Registry Event (Key and Value Rename)

4

Sysmon service state changed

s

Process terminated

IS

FileCreateStreamHash

16

Sysmon Configuration Changed

6

Driver loaded

17

Pipe Created

7

Image loaded

18

Pipe Connected

8

CreateRemoteThread

19

WmiEventFilter activity detected

9

Raw Access Read

20

WmiEventConsumer activity detected

10

ProcessAccess

21

WmlEventConsumerToFilter activity detected

11

FileCreate

SAN~

Sysmoo Event Types Sysmon version 6.10 records 21 differenl types of events (excluding event ID 255: internal error). These events monitor objects like processes, tiles. regi try objects, ... But also, events to monitor changes to Sysmon itself (IDs 4 and 16) can be logged. Thi can indicate tampering attempts .
Other event 1Ds that can be indicative of tampering by malicious actors are changes in file creation times (rD 2), creation of remote threads (ID 8), often u ed for code injection, opening of processes (ID I 0), .. .

172

© 2017 Erik Van Buggenhout & Stephen Sims

Disabled Logging Options

:\install>Sysmon.exe -c

System Monitor v6.02 - System activity monitor -opyr!gkt (C) 2014-2017 Mar~ Ruu inouich and Thoma~ Ga,·nier
Sysin~ernals - www.sysinternals.com

urrent configuration; - Service name: - Driver name; - HashingAlgorithms: - Network connection: - Image loading, - CRL checking: - Process Access ;
No rules installed

Sysmon SysmonOrv
SHA1 disabled disabled disabled d.Habled

C:\insull>.

D X
L

By default.
network connections, image loading, CRL checking and process access is disabled .
The configuration can be changed after installation

SA.~

. .

Disabled Logging Options By default, Sysmon will not generate aJI these events. ysmon ne ds to be configured, but it can take up too many resources if it is configur d to record all events.
As an example, we will enable the logging of network activity. By default, etwork connection logging is disabled, as can be seen in the screen hot above: the configuration can be retrieved with option - c.

© 2017 Erik V an Buggenhout & Stephen Sims

173

Sysmon Networl< Connection Monitoring
.

y1ttt1 Konit'or- \lb - 82 · '$y·n~ oJr;t.hlty fll0n1tor opyd a:ht (C} 2814 · ,.8 11 ftar~ lw.s1ilnc,v-ich ·n1 fhOP'!n G·rnh ysin u m·h - www.,y~1n e rna: l.t..cOllrl

;ti ui fa'(lft\tor 'Yli . e1 . SyHitai ·nhtry ,1on:1:0t" P)'r"'l!V't (() 2~14.·J(tl? ,..,. ...~ ~uotr,,c;n11(h "'"" l1'lo.-Hi ~i'l r"lff'
)'141'1 U rn11l1 · ww..i;~S.lnt·rn-lU s .cOflll

Ul"'r'-t!nt conf-tc.\lru lCJ1:

Orl"W*r n "Ur :

- t/OShlniAJ.orttt.o. ,

'-------------------"""""'I ·- ltt:l "'°4" c:OfH'\ect.lQtr

l"·
tRL

il<e hl1o0ad>·"cR:

'

- p,.ot,~,- Ac.<e-~-r

Sys.on
sv...,"°""
SAAl
·nilb1ed
6tul>l~ 4h bl·· dlu~loa

·\\n-stdl>

In this example, we change the existing configuration co enable monitoring of network connections.
Command
Sysmon.exe -c -n
enables network monitoring.

Sysmon Network onnection Monitoring To configure network connection monitoring interactively, we can issue the following command (as an elevated administrator):
Sysmon.exe --c - n
This will update the configuration and appl it immediately.
To check that the configuration was updated as we desired , we can use command Sysmon.exe - c to check
the updated configuration.
Remark that this interactive configuration method cannot scale. For enterpri e deployments, configuration files can be used .

174

© 2017 Erik Van Buggenhout & Stephen Sims

Monitoring a Malware Simulation

Networl< connection
This is a (simulated) example of malware with network activity.
The program n,alware.exe downloads ft-om http://www.example.com.
This is logged with an event for a TCP connection with the source and destination IP addresses and pons.

- ·-- -~ ~~l!d--~' ,._. ,._.,.,,_.~

~

s

...

--- ~-

,.

-·-

.

U19>Mtaa

w --

-· .-.......... -I

o,,c-

?

Mafot.Ws--~111.,.. tnUnQnkl'tl._

·-- __. ~ -t-c. '-'ID"t "~ ""'"'~ ''..>;,9 ....... ~ tw-,

SANS

Monitoring a Malware Simulation This is a network connection event (ID 3) created by a simulated malware.
Malware.exe i.s an executable that will download a tile ia http from www.example.com when it i
executed.
In the Sysmon event log, we can see the process creation and termination events, followed by the network connection event.
Data in the event allow us to identify the program (via Process ID, Process QUID, and image) and what connection i e tablished . We can see it is a TCP connection from a private 1Pv4 address to a public 1Pv4 address on port 80.
So, the network level, e see i TCP, not HTTP. We do not see the domain name. and not the content of the network connection.
In a corporate environment, many of the connections from workstations will be to the corporate prox Time correlat.ion with the µroxy logs allow u to know more about the established connection.

© 2017 Erik Van Buggenhout & Stephen Sims

175

Sysmon Event Configuration
Sysmon needs to be properly configured to maximize the amount of useful information without overloading the system or producing too many events: · Tt can be useful to increase the event log size. · Centralizing this event log prevents tampering by adversaries. · For a large deployment of Sysmon, an XML configuration file can
be used. · There are several exa1nples of good Sysmon configuration files
on the Internet, like the one from @SwiftOnSecurity.

SA~

- -· . -

-

.

Sysmon Event Configuration As ysmon can create a huge amount or events, that can impact perfonnance of the machine, or flood the event log witl1 event thereby flushing out older events. a sy tem needs to be configured properly for Sysmon to operate wet I.
By configuring ysmon via a configuration file, filtering can be applied. Filtering denotes which type of vents need to be included or excluded. Fore ample, one couJd c nfigure Sysmon to not log network connections established by Internet xplorer, bu to do Jog network connections established by Word. This will already significantly reduce the amount of events.
Increasing the size ofthe Window event log is a good idea to increase the retention period (once an event log is full, old events are discarded to make a place for new events). entraliziTig event logs can also alleviate the lack of space, and is also a solution to combat log tampering.
The ysmon configuration file i an XM file. This is very u eful to deploy and configure Sy mon on many systems.
Good examples of Systnon configuration file can be found on the Internet, like Internet secu1ily legend @Swifton ecurity. T his configuration file has been deployed on thousands of systems and has been in use for more than a year,

176

© 2017 Erik Van Buggenhout & Stephen Sims

Sysmon Configuration File

XML file
Sysmon can be
configured with a
configuration file .
This file is provided wich option -c. It is an XML file.
The configuration schema can be dumped with option -s. This XML file can be the start of your configuration.
. SANS

· c..,.,,._,.._,.
·\lnttilh.S.~.uio,n,eu .. _..

0 "

,. .., . 1·onHOI" vi,U · 5)"\."tbl liCUYlt)I aonltcr oo,rs..t'rt (C) i:·tc ·l9"U ~ rk "-'H! novich ·nd ThuNs Glrna.,)1dt1t·t'tlili \olllllf.5ysinornals ~CO!II

~iun.tfHt 1.<M:Nvtrno,1·-3 3· hinar")'YersJot1,11,"l.Ol'""t.

(c0fl-flelr.lir-H10IU

(O,,·;u:1na1o

<I· C~M· UIIIII ~1)' oOtUnt --,
<:aouon 1,dtefl···· 11i11J1e-.·lflst-'1ll'" ,,.~t'lt· optt°"11· ~ f i 1 · · t ~ '" f'l(clu t'ff"to trvt· /)

(t,pt:ior. -i;.lt"c,-,...·{· ~ - ~~iw·UOl'f" · ~ --opuon-1· T'OC:Ol'lflr-'n-1,Hf ~1tcl1o1"Shta·... t ~· ,.,

~·'le. tupUon -s-.U1,:b.."u· l'l..,,. ..~u,tri-.t..au· ·rt'-'l:ta~""°'"' noc°"f11;,.· N·.. ..-..clus.itte-..tr"U,,. J >

'loptlon, J,ii1t<h-"' "·· r,,llllllf,.",.,.nl

·r-.,...nt.··~ noco,ifJJ,.·("r"'-· eac:lvn..,....·'fr\itt" h

<o,vt)QO -td t d·"'· t · ~·'"'.Ditfn.1~· ..-r11aen1...· ~ - f'.1«0t>t1.ir .,tnrc.· />

«op-Ho,, s1,n.t<.h·'"'P'IO.loao rlallll!'.. "Mo.Loeo.. ·~c,.,·tlOM· no,co,n·hi '" tt'Uf''" i,.

<tO,,UOl'I tw-1. l Cl'w'" tCC.itt>NUJ·· ~-#li«"'te.llle· .,......h't··~· no<anft,·""tMH!!"' />

copt1on wit-<t,,._..._. 1\191f·"'Cof\fi,O.,h\ll - t,...,-el't · ·~ · ~on-Hr-""t.riH· /')

,, ·- Con(i,a.Ur·tioti, Hit · .,.

cooti~ s ltcila'"l'I· I\MCl·.,.~&-~IOC'"h:f'IM· ·~nt.,,. ..ir111,i;1o11f"H'· /~

~opt\Qn fW\ it,..,..t'I. t\.11111.,. · .,,._blDr'tCOMtct· ·~t··O(lt,,o,ri l"' " ,de-·trua'" />

(optio,,. J;Wil(h·-·· NMh".l!aiip.ln.i111tt· ''"I\Jllllltlltl<'"oip·UOIMI. r111l·11."trvll'· , ..
"°"t.10f'I $W.ltcha"~- n.11W· ·Proc:e-5PoCtH.1'" · ~ n t"- ·~qu, ...a.. t"IU.1 ·t.~· tt1~natif.t1· - 1:t"U1· I> ,o,t~Ol'I J,"1,.tch-·r· na,M 1.·t1t~tRav«·t'ior,,... ·~J,..-r,,o(!,a· />

(oot\on ,\rdr.c"-··· ~-'1~J.t-N"tr,,c., ·~·reqr,1tr~- rvl.-'"'tr-w· for-<e-c:on t-i..l,··tru,,· I>

t/qotiQr\U -<fi.ltti,..t: d«ihU'lt"··o·,a ..,u if\Ot~C(Jil\Uil'llt,c.e.c:lude.!.-betln llfitll ·.-nd ·1th.1Kt: \htcn,..ot"t ttw.n,l·tc'<ffihu,t,:;,

'-fc.of'lflf""#OOI\J<.Va-t1to

Sysmon Contiguration File
To start creating your 01,vn configuration file, you can use ysinon to produce an XML file with the schema (all possibl configuration options).
This can be done with command ysmon.exe - s.
The output can be redirected to a file which can then be edited and tested.

© 2017 Erik Van Buggenhout & Stephen Sims

177

Detecting Lateral Movement Through Traclcing Event Logs (I)

Next to the NSA's interesting article on Windows event logs, there is a highly useful paper that was released by JPCert in June 2017

The document aims to provide a good overview of common attack techniques &tools and how they can be detected!

https://wwwJpcert.or Jp/english/pub/sr/20170612ac-ir_research_ e n . p d f

SANS

-

Detecting Lateral Movement Through Tracking Event Logs (1) Next to the SA 's interesting article on Windows event logs, there is a highly useful paper that wa released b JPCert in June 20 I7. The document aims to provide a good overview of common attack techniques & tools and how they can be detected! We will zoom in on the document b_ walking through a specific example of such a tool : Mimikatz!
The full paper can be found at the following link:
https://www jpcert.or.jp/engl ish/pub/sr/20 I706 l2ac-ir_re earch_en .pdf

178

© 2017 Erik Van Buggenhout & Stephen Sims

Detecting Lateral MovementThroughTracl<ing Event Logs (2)
We will now take an example of an attack tool that is further explained in the JPCERT's paper: Mimikatz!
3.3.4. Mlmlkatz (Ob1alnlng Pas word Hash)

---_....,_,,,,l,,,. it-v.'l'ICIO'bH!iH:aJtJA, T_ _.

SANS

.

Detecting Lateral Movement Th rough Tracking Event Logs (2) We will now take an example of an attack tool that is further explained in the JPCERT's paper: Mimikatz! In thi first section, tl1e pape~will describe the typical purpose of the tool and the type of Coren ic artifacts that can be used to detect use of the tool.

© 2017 Erik Van Buggenhout & Stephen Sims

179

Detecting Lateral Movement Through Tracking Event Logs (3)

_ ,..,.,._.,_.,.,.,, flf41!nt,O dlt (Anei.YJl"oc:t'S-it\U~Uoa~'

Proc-e:J.t ltdonND'Orl ..... Procna Nitl'tM Vil¥ l'6Jmltl

.,._.,r

conn~· lnfQ11nai.t1Qfli

,foc:H· 5t.tiJ£11d ff,,,_. Md O.tt·

lfl\l {)elf!,

Ham· 0 1 U.u, Who E:u-c:ur..d ct. Pro.c.a1o

..S11ti;t,c1 .AccocJfV ....,.,.

o.om-1111 of ~ f

~a,c:.utto ~ .,.~,

3U~ ,. Aa:ouor OotNl,,

Pru.enc· of PtMI~ Etc.1Wilfan ·· P,ac.u E.att.ubo-n Pu,c.,· lhfwm·dcH'I roa-, E#aador, n,p.

Pr~H. R t~ v.iu.

Pfvn,u WonrNUOl't bll .S:tslUJ:

ev.,,uo , 1F>n.lOl'i-1 t.,uc,1
..._, r7r",rO,.a-lM..f,O,,ff,ll.ll,'W..O..d,1·..,,r

ConnmwDtt tnfonnMJon

Ptoc: · SU!r\JIE'nd T\me ·net 0..t· (U1C) IIK'11tfw

Pr6tt::·HCOfflffWl""'1 \a f!4

Oc>rnnM,~ 'lhlt\Y..UIJ:uuttQf1 t'I, 1oo»'U(lid.11 1il~ ut~ i iJH\II'

r-'"'-naffM c · \ M1..tlllkl'W· P'l!'9t·u.b\ l ~ ~ ,Ue(la'JaD.15: . IJCS.t l- l ~ _pt

C~flrmaDit· lnfom\.1.00(, IM~12111be~U-:,,nQtt· li?JOI W~~Vtit.,t

lb.I ~tc..m(lll'I Time .no O.. it

l-Pt ~«.WOii nm,

--

SANS

· . ··

.

Detecting Lateral Movement Through Tracking Event Logs (3) Below the initial table (as described in the previous slide), a mored tailed section i included, where it i illu trated what event IDs are required to successfully detect use of the tools. In this example. you will notice the following event IDs are being used :
Windows event logs · 4688: A new process ha been created · 4689: A proces has exited
Sysmon · 1: Process create · 5: Process Tenninated
Furthermore, it also use the nam of the tool (Mimikatz) ... This is a rather basic control , as adver aries
could perfectly rename the tool. We could however al o monitor for u e of the typical ommand line arguments passed to Mimikatz (''sekurlsa", .. .)

180

© 2017 Erik Van Buggenhout & Stephen Sims

Be Careful ... KillingYourWindowsVisibility Softly with Invoice-Phantom

As a final remark, we'd like to point out that Windows event logs are an excellent means of understanding what is happening in our environment!
After successful configuration of a centralized monitoring setup, it's however important to monitor whether or not your event IDs are still arriving as expected.. .
To illustrate this issue, consider the Invoke-Phantom PowerShell script by penetration tester Halil Dalabasmaz:

'This script walks thread stacks ofEvent Log Service process (specific svchost.exe) and identify Event Log Threads to kill Event Log Service Threads. So the system will not be able to collect logs and at the same time the Event Log Service will appear to be running."

,- SAN~
' --

-

-

Be Careful... Killing Your Windows Visibility Softly with Invoke-Phantom As a final remark, w 'd like to point outthat Windows event logs are an excellent means of under ·landing what is happening in our environment!
After succes!lful configuration of a centralized monitoring setup, it s important to monitor whether or not
your event IDs are till arriving as expected. To illustrate this issue, con ider the Invoke-Phantom PowerShell script by p netration tester Hali! Dalaba maz:
·This cripr walh thread stacks ofEvent Log Service process (~pecifk svchost.exe) and ident(/y Event
Log Threads w kill Event Log Service Threads. So 11,e system will no/ be able to collect log. and at the
same time the Even/ Log Service will a[lpear to be running. ··
You can find the script on Hali l's github page: http ://github.com/hlldz/lnvoke-PhantOm .

© 2017 Erik Van Buggenhout & Stephen Sims

181

I
Using Windows Event Logs
Some additional resources concerning Windows event logs:
Spotting the Adversaiy with Windows Event Log Monitoring h:ttps://www.iad.gov/iad/1ibrary/report / potting-the-adversary-with-windows-event-1ogmonitoring.cfm
· Windows Event Forwarding https://blogs.technet.rnicrosoft.com/jepayne/2015/11/23/monitoring-what-matterswindows-event-forwarding-for-evervone-even-if-you-already-have-a-siem/
Detecting Lateral Movement through Tracking Event Logs http ://www.jpcert.or.jp/english/pub/sr/2011o612ac-ir research en.pelf

,(iI /\ t\h1\l'

'. . .

.

Using Windows Event Logs
potting th l\dversary , ith Windows Event Log Monitoring https://www.iad .gov/ iad/library/reports/spotling-the-adversary-with-windows-event-log-monitoring.cfm
Windows Event forwarding https://biogs. technet. microso fi.com / jepayne/2015/ I 1/23/monitoring-what-matters-wi ndows-eventforward ing-for-everyone-even-if-you-already-have-a-siem/
Detecting Lateral Movement through Tracking Event Logs
httpsJ /www.jpcert.or.jp/english/pub/sr/20 I706 J2ac-ir research en.pdf

182

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
Day 1: Knowing the adversary, knowing yourself Day 2: Averting Payload Delivery Day 3: Preventing Exploitation Day 4: Avoiding Installation, foiling Command & Control & thwarting lateral movement Day 5: Exfiltration, Cyber Deception & Incident Response Day 6: APT Defender Cap tone
SANS

SEC599.4

Avoiding Installation

Typical Persistence Strategies

Exercise: Catching Persistence

Pnnciple of Least Privilege & User Access Control

Exercise: Local Windows Privilege Escalation Techniques

'Foiling Command & Control

Network Monitoring Consideratiof\S (Netflow, IDS, ...)

Detecting Command & Control Channels

Exercise: Suricata to Detect Necwork Anomalies

Thwarting lateral movement

Introducing Common Lateral Movement Str.itegies

Active Directory Architecture & Attacks

Active Directory Hardening & Segmentation

Exercise: Hardening Windows to Stop Lateral Movement

Detecting Lateral Movement Using Windows Event Logs

·

Exercise: Configuring & Forwarding Windows Event Logs

.

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

183

Exercise - Detecting Lateral Movement Using Windows Event Logs
IThe objective of the lab is to detect lateral movement taking place in our Windows Active Directory environment. We will accomplish this by using a combination of Windows event logs. syslog and ELK-based visualization techniques.
High-level exercise steps: 1. Deploying syslog across the enterprise 2 . Deploying nxlog to forward logs 3. Configuring our ELK stack 4. Detecting AD attacks in our dashboards
Exerci e- Detecting Lateral Movement Using Windows Event Logs The objective of the lab is to detect lateral movement taking place in our Windows Active Directory en ironment. We will accomplish this by using a combination of Windows evenl log. syslog and ELKbased visualization techniques.
Throughout the exerci e, we will complete the following steps: 1. Reviewing the syslog configuration 2. Deploying syslog across the enterprise J. Forwarding event logs to our ELK stack 4. Dashboardjng Windows e ent logs in Kibana
For additional guidance & details on the lab, please refer to the LOD workbook .

184

© 2017 Erik Van Buggenhout & Stephen Sims

Exercise - Detecting Lateral Movement Using Windows Event Logs - Conclusion

During this exercise, we configured our Windows workstation to generate and

forward interesting host-based information using Sysmon. We relied on the

following technology to accomplish our goals:

__ Sysmon v6.10

.,...,II.__,,.,,R.I,

·

We deployed Sysmon across our enterprise environment to start generating in-depth host logs on our systems;

We used Nxlog to forward Windows event logs (including Sysmon) to our central ELK stack;

«·elastic

We used the ELK stack to parse, index & visualize our Windows event logs.

~ SANS

.

.·

Exercise - Detecting Lateral Movement Using Windows Event Logs - Conclusions During this exercise,, e configured our Windows workstation to generate and forward interesting hostbas d information using y mon. We relied on th following techno logy to accomplish our goals:
· We deployed Sy rnon across our enterprise environment to start generating in-depth host logs on our system ;
· We used xlog to forward Windows event logs (including Sysmon) to our central ELK stack;
· We used the ELK stack to parse, index & visualize our Windows event logs.

© 2017 Erik Van Buggenhout & Stephen Sims

185

Co11rse Roadmap
Day 1: Knowing the adversary, knowing yourself Day 2: Averting Payload Delivery Day 3: Preventing Exploitation Day 4: Avoiding Installation, foiling Command & Control & thwarting lateral movement Day 5: Exfiltration, Cyber Deception & Incident Response Day 6: APT Defender Capstone
SAN~
This page intentionally left blank.

SEC599.4
Avoiding Installation Typ cal Persistence Strategies Exercise: Catching Persistence Principle of Least Privilege & User Access Control Exercise: Local Windows Privilege Escalation Techniques
Foiling Command & Control Network Monitoring Considerations (Netflow, IDS, .. .) Detecting Command & Control Channels Exercise: Suricata to Detect Network Anomalies
Thwarting lateral movement Introducing Common lateral Movement Strategies Active Directory Architecture & Attacks Active Directory Hardening & Segmentation Exercise: Hardening Windows t-0 Stop lateral Movement Detecting Lateral Movement Using Windows Event Logs Exercise: Configuring & Forwarding Windows Event Logs

·

·

186

© 2017 Erik Van Buggenhout & Stephen Sims

Conclusions for 599.4

That concludes 599.4! Today, we've touched upon the following topics:
Typical persistenc strategies in both kernel & u erland and how to avoid them Privilege escalation issues & how they can be prevented Command & ontrol channels & how to prevent / detect tJ1em · Typical lateral movement strategies inside W'rndows-based environments Active Directory attacks & hardening against them Windows event log & sysmon for endpoint monitoring
In the next section of the course (SEC599.5), we will discuss exfiltration, cyber deception & incident response.

.. ,~A--.\ . - - -- - ----.

1- ,:mNS . _

_ _

--

--- - .---_ - -_ - - - -.,

_ .. ~ - -·

·

Conclusions for 599.4 o far 599.4! Today, we focused on persistence, privilege escalation, command & control. and lateral
mo emenl. Amongst oth rs, ~ e touched upon the following topics:
· Typical per i tence strntegies in both kernel & userland and how to avoid them Privilege escalation issues & how they can be prevented
· Command & control channels & how to prevent / detect them · Typical lateral movement trategies inside Windows-based environments · Active Directory attack. & hardening against them · Windows event logs & sysmon for endpoint monitoring
ln the next sect ion of the course SEC599.5) w will discuss exfiltratian. c ber deception & incident response.

© 2017 Erik Van Buggenhout & Stephen Sims

187

Course Resources and Contact Information
I

AUTHOR CONTACT ErikVan Buggenhout eva nbuggenhouc@nv iso .b e Stephen Sims ssims@sans.org

SANS INSTITUTE

8120 Woodmont Ave., Suite 3 I0

0

Bethesda, MD 20814

301.654.SANS (7267)

CYBER DEFENSE CONTACT Stephen Sims ssims@sans.org
SAN~
This page intentionall y left blank.

SANS EMAIL GENERAL INQUIRIES: info@sans.org R,EGISTRATION: registration@sans.org TUITION: tuition@sans.org PRESS/PR: press@sans.org

·

. . . , ,.

188

© 2017 Erik Van Buggenhout & Stephen Sims

