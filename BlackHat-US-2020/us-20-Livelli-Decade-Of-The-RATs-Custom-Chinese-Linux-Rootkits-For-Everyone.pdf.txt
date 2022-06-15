Decade of the RATs
Custom Chinese Linux Rootkits for Everyone
Kevin Livelli, Director of Threat Intelligence, BlackBerry
#BHUSA @BLACKHATEVENTS

Fine Print
Legal Disclaimer
The information contained in this presentation is intended for educational purposes only. BlackBerry does not guarantee or take responsibility for the accuracy, completeness and reliability of any third-party statements or research referenced herein. The analysis expressed in this report reflects the current understanding of available information by our research analysts and may be subject to change as additional information is made known to us. Audiences are responsible for exercising their own due diligence when applying this information to their private and professional lives. BlackBerry does not condone any malicious use or misuse of information presented in this presentation.

#BHUSA @BLACKHATEVENTS

Acknowledgements
Black Hat Review Board BlackBerry Executive Leadership + Anthony Freed Jon Miller, Ryan Smith, Tom Wabiszczewicz Jeff Tang + Applied Research Team Researcher X

#BHUSA @BLACKHATEVENTS

WHO IS
KEVIN LIVELLI
Current:
· Director of Threat Intelligence, BlackBerry
Prior:
· Investigative journalist, CBS News 60 MINUTES · Supervising Investigator, NYC Civilian Complaint Review Board
-----twitter.com/kevinlivelli linkedin.com/in/kevinlivelli

#BHUSA @BLACKHATEVENTS

FORMAT
"30 MINUTES" Questions....and Answers
TAKEAWAYS: · Critical approaches to malware analysis · How to question your own findings · How to question your own thinking

#BHUSA @BLACKHATEVENTS

What did we find?

#BHUSA @BLACKHATEVENTS

ANSWER:

FULL STACK OF LINUX MALWARE + SPLINTER CELL

"WINNTI"

1. WINNTI GROUP 2. PASSCV 3. BRONZE UNION (APT27, EMISSARY PANDA) 4. CASPER (LEAD) 5. (WNLXSPLINTER)
#BHUSA @BLACKHATEVENTS

ANSWER:
LINUX SPLINTER CELL TOOLSET WINNTILNX :
1. Interactive installer script 2. Build environments (2) ­ remote and local 3. Backdoors (3 variants) ­ designed to run with rootkits 4. Rootkits (2 variants) -- LKM 5. Control panel ­ with GUI, Linux and Windows 6. Botnet - Linux XOR.DDoS

#BHUSA @BLACKHATEVENTS

ANSWER:
LINUX SPLINTER CELL TOOLSET C2 STAND-OUTS: 10.x IPs -> C2 inside the target environment Extensive abuse of legitimate cloud service providers

#BHUSA @BLACKHATEVENTS

ANSWER:
SAME APTs, DIFFERENT PLATFORMS: ANDROID: 2 new implants (PASSCV, LEAD/CASPER) WINDOWS: 4 new variants of ZxShell droppers

#BHUSA @BLACKHATEVENTS

Why did it take so long?

#BHUSA @BLACKHATEVENTS

WRONG ANSWERS:
NOT ENOUGH RELEVANT "APT GROUP HERE" RESEARCH NOT ENOUGH PRODUCT / SERVICES COVERAGE
#BHUSA @BLACKHATEVENTS

POSSIBLE ANSWERS:
LINUX IS IGNORED BY VIPs AT TARGET ORGANIZATIONS LINUX IS IGNORED BY INFOSEC VENDORS LINUX IS ASSUMED TO BE MORE SECURE WE FORGOT THAT EVERTHING OLD EVENTUALLY COMES FULL CIRCLE
#BHUSA @BLACKHATEVENTS

CUSTOM LKM ROOTKITS
PWNLINX4 (original):

· Code appears to have been lifted directly from Ivan Skylarov's Programming Linux Hacker Tools Uncovered: Exploits, Backdoors, Scanners, Sniffers, Brute-Forcers, Rootkits (2007)

PWNLINX6 (updated):

· Code appears to be based on a modified version of the Suterusu Rootkit

· Referred to by attackers as "xinted.ko"

· Compiled with newer version of GCC, with several notable features absent, e.g. routines to directly patch TCP/UDP tables

· Also changed: custom network protocol to replace previously used ioctl codes allowing easier communication

between kernel and user side. Led to the discovery of an additional backdoor

#BHUSA @BLACKHATEVENTS

INTERACTIVE INSTALLER SCRIPT

· Compressed bash script - over 400 lines long
· Three additional command line arguments required to execute: 1. "username" 2. "build" 3. "force_mode"
· Checks to see if LKM was already compiled for the current header version GET /build/check?args=version|kernel|force_mode&token={result from auth request}
· Self-identifies as "Lancer Remote Online Compilation System v2.0" ­ suggesting a v1.0

#BHUSA @BLACKHATEVENTS

LINUX BUILD ENVIRONMENTS: REMOTE

· Build Environment 1: "/opt/uOnlineBuilder64/core/build/yang/rk"

· /opt/uOnlineBuilder64/core/build/yang/rk/lkm.c

What's Interesting here:

· /opt/uOnlineBuilder64/core/build/yang/rk/autoipv6.mod.c

· ""/build/yang/AB1167FF11C7B8642D547D84AEDD8B46/2.6.32-358. el6.x86_64 ü Online and On-the-Fly

· Build Environment 2: /opt/uOnlineBuilder64/core/build/hehe/rk

ü Delivers the rootkit/backdoor not just by MD5 hash but

· /opt/uOnlineBuilder64/core/build/hehe/rk/lkm.c · /opt/uOnlineBuilder64/core/build/hehe/rk/autoipv6.mod.c

username as well ü Check out those usernames!

· ""/build/hehe/4F666C7AA5F592EF64E9B2AFFE2 67B0F/2.6.32-754.6.3.el6.x86_64 ü Check out those filenames!

· Build Environment 3: /opt/uOnlineBuilder64/core/build/maomao/rk

· /opt/uOnlineBuilder64/core/build/maomao/rk/lkm.c · /opt/uOnlineBuilder64/core/build/maomao/rk/ip4tables.mod.c · ""/build/maomao/01944A09FD7592DDFEF4AD4825AB6329/2.6.32-431.11.29. el6.ucloud.x86_64

#BHUSA @BLACKHATEVENTS

LINUX BUILD ENVIRONMENTS: LOCAL

· Build Environment: /root/Desktop/dns · /root/Desktop/dns/lkm.c · /root/Desktop/dns/snd_raw.mod.c · /usr/src/kernels/2.6.32-642.el6.x86_64
· Build Environment: /var/tmp/.1 · /var/tmp/.1/lkm.c · /var/tmp/.1/autoipv6.mod.c · /usr/src/kernels/3.10.0-693.2.2.el7.x86_64
· Build Environment: /var/tmp/Linux_Server · /var/tmp/Linux_Server/lkm.c · /var/tmp/Linux_Server/dhcp.mod.c · /usr/src/kernels/2.6.32-358.14.1.el6.x86_64

· Build Environment: /dev/shm/2.6.32microcode · /dev/shm/2.6.32microcode/lkm.c · /dev/shm/2.6.32microcode/microcode.mod.c · /usr/src/kernels/2.6.32-358.14.1.el6.x86_64
· Build Environment: //home/rhudgins/2.6.32floppy · /home/rhudgins/2.6.32floppy/lkm.c ·/home/rhudgins/2.6.32floppy/ipmi_devintf.mod.c · /usr/src/kernels/2.6.32-358.14.1.el6.x86_64
What's Interesting here:
ü Compiled locally, directly on target machine ü Access to the server already achieved ü Earliest compile date on rootkit: 2013
#BHUSA @BLACKHATEVENTS

WANT MORE CUSTOM CHINESE LINUX ROOTKITS FOR EVERYONE?
Installation script communicates to 1 of 2 hosts:

32-bit = 3232.3389[.]la 64-bit = 6464.3389[.]la

Looks a lot like historic PASSCV domain = 3389[.]hk Found new hosts:

64.3389[.]hk. ---> 150.242.210[.]181 32.3389[.]hk ---> 150.242.210[.]180

Relatively unique HTTP server: beegoServer:1.6.0 (https://beego.me/)

#BHUSA @BLACKHATEVENTS

Is `WINNTI' responsible for the original 2014-2015 Linux XOR.DDoS botnet?

#BHUSA @BLACKHATEVENTS

ANSWER:
YES
ü Same targeting of video game industry ü Same device used for rootkit functionality: "/proc/rs_dev" ü Same XOR key to obfuscate network traffic: BB2FA36AAA9541F0 ü Same modifications of the open-source Suterusu Rootkit ü Initial online build servers essentially identical
Look familiar?

#BHUSA @BLACKHATEVENTS

Is `WINNTI' behind the development of one of the most widely used, commercially available RATs?

#BHUSA @BLACKHATEVENTS

ANSWER = ???
PNWDROID4 and NetWire
NetWire ­ legit PWNDROID4 ­ not legit
PWNDROID4 APK last modified = June 16, 2015
NetWire Android announcement = January 2, 2017
NetWire final release = March 23, 2017
Difference in time = 18 mos ­ 2 yrs
?

#BHUSA @BLACKHATEVENTS

Adware? Who Cares?!

#BHUSA @BLACKHATEVENTS

ANSWER = NOT MANY PEOPLE
Alert Fatigue PUP/PUA alerts Flagged as Adware Adware is Boring Found & Ignored vs. Found & Investigated Part of a larger APT trend

#BHUSA @BLACKHATEVENTS

What does `WINNTI' even mean?

#BHUSA @BLACKHATEVENTS

ANSWER: It's an Approach

"WINNTI" = a BACKDOOR, an ATTACK GROUP, an "UMBRELLA," an APPROACH

5 Derivative APT Groups assessed to be acting in the interest of the Chinese government:

WINNTI GROUP LEAD / CASPER
Commonalities:

PASSCV

BRONZE UNION / EMISSARY PANDA / APT27

(WLNXSPLINTER) emerging

.....BUT WAIT, THERE'S MORE!

· Observed attacking video game companies to steal code-signing certificates which they used to sign their malware, as well as attacking the gaming companies for criminal purposes to produce revenue.

· Share tools and/or C2, suggesting several possible scenarios: a formal "digital quartermaster" arrangement (a la FireEye); an informal "hacker forum" type of tool swap; personnel overlap between the groups; or a re-tasking of the same groups toward different target sets.

· Targeting runs the gamut of nearly all verticals, and activities range from simple cybercrime to full-blown economic espionage, and from internal monitoring of politically dissenting populations to more traditional military and strategic nation state espionage. These groups' collective palette is wide and well-developed, touching nearly every industry sector across a huge geographic area.
#BHUSA @BLACKHATEVENTS

LAST QUESTION: What are we not seeing?

#BHUSA @BLACKHATEVENTS

THANK YOU blackberry.com/RATs

#BHUSA @BLACKHATEVENTS

