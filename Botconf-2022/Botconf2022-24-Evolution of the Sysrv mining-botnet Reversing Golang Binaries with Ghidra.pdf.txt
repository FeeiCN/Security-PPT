Botconf
April 2022

Evolution of the Sysrv mining-botnet
Reversing Golang Binaries with Ghidra

Dorka Palotay Senior Threat Researcher, CUJO AI

Gyorgy Luptak Junior Threat Researcher, CUJO AI

Who are we
Background
Gyorgy Luptak (@gyluptak): · Junior Threat Researcher at CUJO AI · BSc in Computer Science · Currently pursuing an MSc in Computer Science, IT Security
Dorka Palotay (@pad0rka): · Senior Threat Researcher at CUJO AI · BSc in Applied Mathematics · MSc in Security and Privacy ­ Advanced Cryptography · Worked at financial and security companies as well · Malware researcher and reverse engineer
Special thanks to Albert Zsigovits (@albertzsigovits) for his contribution to this research.

Why we did all this
The quest
Background: · IoT/Linux malware research -> more and more malware families are written in Go · Sysrv is a good example of this

Why we did all this
The quest
Background: · IoT/Linux malware research -> more and more malware families are written in Go · Sysrv is a good example of this
Issue: · Reverse engineering Go binaries is challenging
o Huge file size o Unusual string handling o No symbol names due to stripping · Ghidra open-source development is in early stage compared to other tools o Only a few open-source scripts are available, solving only parts of the problem

Why we did all this
The quest
Background: · IoT/Linux malware research -> more and more malware families are written in Go · Sysrv is a good example of this
Issue: · Reverse engineering Go binaries is challenging
o Huge file size o Unusual string handling o No symbol names due to stripping · Ghidra open-source development is in early stage compared to other tools o Only a few open-source scripts are available, solving only parts of the problem
Goal: · Understanding Sysrv botnet evolution · Making reverse engineering Go binaries with Ghidra easier
Result: · Create our own scripts: https://github.com/getCUJO/ThreatIntel

Agenda
· The Sysrv botnet - https://cujo.com/the-sysrv-botnet-and-how-it-evolved/ o General introduction o Downloader script o Malicious binary and used exploits o Mining and monetization
· Go binary analysis with Ghidra - https://cujo.com/reverse-engineering-go-binaries-with-ghidra/ o Lost function names o String recovery o Data type recovery

The Sysrv botnet
Introduction
· First mentioned in December 2020 by multiple sources · It is a worm and a cryptocurrency miner · It stood out due to its use of Golang · The botnet is distributed for both Linux and Windows environments · Still active today · In our analysis we were focusing on variants attacking Linux · Name coming from the used filenames: sysrv, sysrvv, sys

The Sysrv botnet
The downloader script (Linux version)
· Linux: ldr.sh, Windows: ldr.ps1 · First part of development from December 2020 to the end of February 2021
o First version: hardcoded C2 and sysrv version, curl and wget to download the binary (different one for 32, and 64-bit systems)
o Quick expanding: kill other miners and processes with high CPU usage, removing/disabling system security, cron-based persistence

The Sysrv botnet
The downloader script (Linux version)
· Linux: ldr.sh, Windows: ldr.ps1 · First part of development from December 2020 to the end of February 2021
o First version: hardcoded C2 and sysrv version, curl and wget to download the binary (different one for 32, and 64-bit systems)
o Quick expanding: kill other miners and processes with high CPU usage, removing/disabling system security, cron-based persistence, remove ld.so.preload
· Second part from the end of February 2021 to December 2021 o At the start: removed almost every functionality besides downloading the binary o Slow expansion from here: reintroduce some of the lost parts of the script o At first, it kills 'kthreaddi' process, then uses it as cryptominer, later replaced by 'kthreaddk' o New methods introduced: randomized sysrv version, install cron if not existing, spread via SSH, kill process listening on specific ports

The Sysrv botnet
The downloader script (Linux version)
· Linux: ldr.sh, Windows: ldr.ps1 · First part of development from December 2020 to the end of February 2021
o First version: hardcoded C2 and sysrv version, curl and wget to download the binary (different one for 32, and 64-bit systems)
o Quick expanding: kill other miners and processes with high CPU usage, removing/disabling system security, cron-based persistence, remove ld.so.preload
· Second part from the end of February 2021 to December 2021 o At the start: removed almost every functionality besides downloading the binary o Slow expansion from here: reintroduce some of the lost parts of the script o At first, it kills 'kthreaddi' process, then uses it as cryptominer, later replaced by 'kthreaddk' o New methods introduced: randomized sysrv version, install cron if not existing, spread via SSH, kill process listening on specific ports
· Third part from 2022 o Builds onto the previous version, but with lot of modifications o Low-level custom curl, wget-like code, replaces 'kthreaddk' by 'hezb', also downloads kthmimu.sh

The Sysrv botnet
The binaries
· 32- and 64-bit binaries · We analyzed more than 100 ELF binaries · Grouped them based on their package structures ­ 9 different groups · Go programs are organized into packages. A package is a collection of source files in the same directory that are
compiled together. Functions, types, variables, and constants defined in one source file are visible to all other source files within the same package.

The Sysrv botnet
The binaries
· Packed with UPX · The first obfuscated sample appeared at the end of March 2021
o Used gobfuscate - https://github.com/unixpickle/gobfuscate o Package names were obfuscated
· For later samples some of the function names were slightly obfuscated

The Sysrv botnet
The exploits
· Primarily targeting Linux and Windows servers, not IoT devices · Initial campaigns ­ small set of exploits
o Apache Tomcat RCE ­ used by every sample o CVE-2020-14882 ­ Oracle WebLogic RCE ­ used by almost every sample o MySQL RCE ­ only used by the early samples o CVE-2018-1000861 ­ Jenkins RCE ­ used by almost every sample · Latest exploits o CVE-2021-22204 ­ ExifTool RCE ­ published in January 2021, used by samples from November 2021 o CVE-2021-3129 ­ Ignition RCE ­ published in January 2021, used by samples in March 2021 o CVE-2022-22947 ­ Spring Cloud Gateway RCE ­ published in January 2022, used by samples from
March 2022

The Sysrv botnet
The vulnerabilities exploited
Exploits with the corresponding CVE number:
CVE-2015-8562 ­ Joomla! RCE
CVE-2017-11610 ­ Supervisor XML-RPC server RCE CVE-2017-12149 ­ Jboss RCE CVE-2017-3066 ­ Adobe ColdFusion RCE CVE-2017-5638 ­ Apache Struts RCE CVE-2017-9841 ­ PHPUnit RCE CVE-2018-1000861 ­ Jenkins RCE CVE-2018-7600 ­ Drupal RCE CVE-2019-0193 ­ Apache Solr RCE CVE-2019-10758 ­ Mongo Express RCE CVE-2019-11581 ­ Atlassian Jira RCE CVE-2019-15107 ­ Webmin RCE CVE-2019-3396 ­ Atlassian Confluence RCE CVE-2019-7238 ­ Nexus Repository Manager RCE CVE-2019-9193 ­ PostgreSQL RCE CVE-2020-13942 ­ Apache Unomi RCE CVE-2020-14882 ­ Oracle WebLogic RCE CVE-2020-16846 ­ Saltstack RCE CVE-2020-9496 ­ Apache OFBiz RCE CVE-2021-22204 ­ ExifTool RCE CVE-2021-3129 ­ Ignition RCE CVE-2022-22947 ­ Spring Cloud Gateway RCE

Exploits without a CVE number:
Apache Flink RCE
Apache Hadoop YARN ResourceManager Unauthenticated RCE Apache NiFi Api RCE Apache Tomcat RCE Jupyter Notebook RCE MySQL RCE Redis RCE SSH brute-force ThinkPHP RCE WordPress brute-force XXL-JOB Unauth RCE

The Sysrv botnet
The miner
· Monero cryptocurrency mining · Uses the open-source XMRig project to mine Monero · Details extracted from config files · Mining address:
49dnvYkWkZNPrDj3KF8fR1BHLBfiVArU6Hu61N9gtrZWgbRptntwht5JUrXX1ZeofwPwC6fXNxPZfGjNEChXttwW E3WGURa · Mining pools:
o pool.minexmr.com:5555 o xmr.f2pool.com:13531 o xmr-eu1.nanopool.org:14444 o xmr-eu2.nanopool.org:14444 o xmr-asia1.nanopool.org:14444 o 194.145.227.21:5443

The Sysrv botnet
The miner
December 2020 Miner is embedded as
gzip Mining pool: MineXMR Miner is in a separate file
F2Pool is added

March 2021
Miner is embedded as ELF
New Monero address ­ potential ties to WatchDog

February 2021 Miner is embedded as
gzip Nanopool is added

July 2021
Access to mining pool through proxy
194.145.227.21:5443

The Sysrv botnet
Monetization
· f2pool o Started in November 2020 o 15 XMR (3900 USD) o Closed XMR mining pool November 2021 o Details from September 2021
· MINEXMR o Suspended account
· Nanopool o 76 XMR (20000 USD) o First payment: 28 February 2021 o Last payment: 2 July 2021

Golang
Introduction
· Go (also called Golang) is an open source programming language · Designed by Google in 2007 · Made available to the public in 2012 · Current version is Go 1.18 · https://golang.org/
· Go comes out top of the languages most developers want to learn1 · Advantages:
o Simple and clear documentation o Easy to learn, ease of coding o Compiled language (faster than Python) o Cross compiling (Windows, Linux, macOS) o Scalability and concurrency o Garbage collection ­ automatic memory management
1: https://www.zdnet.com/article/developers-say-googles-go-is-most-sought-after-programming-language-of-2020/

Static linking
Big Bad Binaries
· Go binaries are statically linked by default · All the necessary libraries are included in the executable image · No dependency issues · Large size
o Difficult malware distribution o Anti ­ virus products have difficulty to detect o Reverse engineering can be more time consuming

Hello World - Unstripped
C vs Go
·C
gcc -o world_c world.c

ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, not stripped
size: 16,3 kB

· Go

go build -o world_go world.go

ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, not stripped
size: 2,0 MB

Stripped Binaries
· Discard debugging symbols · Reduced size · No names for routines and variables · More difficult debugging and reverse engineering · Malware files are usually stripped

Hello World - Stripped
C vs Go
·C
gcc -o world_c_strip -s world.c

· Go

go build -o world_go_strip ­ ldflags "-s" world.go

ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, stripped
size: 14,1 kB
ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
size: 1,3 MB

Sysrv
Example files
· sys.x86_64 o UPX packed o SHA256 = f719736bb794d9a2a4fc3574391f34920130709b659231003a6fdcf34ecf68ec
· sys.x86_64_unp o Unpacked o SHA256 = 5190dda119756910f41646609def181b7549fbf14cd761f3053721500af0ead3

Recover function names
Function list
· 3829 function recognized by Ghidra · No proper function names · Not helpful in reverse engineering

Recover function names
Find the strings
· Function name strings are present in the binary · Redress ­ tool for analyzing stripped Go binaries
https://github.com/goretk/redress

Recover function names
pclntab

Recover function names
pclntab · Detailed documentation of pclntab1 is available
Instruction size quantum: 1: X86, 4: ARM
Pointer size in bytes Function address
Function metadata pointers
1: https://docs.google.com/document/d/1lyPIbmsYbXnpNj57a261hgOYVpNRcgydurVQIyZOz_o/pub

Recover function names
pclntab in Windows
· Not a separate section -> Look for the structure
Binary: unpacked sys.exe (03f5f4470bc9cdeb62c3afecba326f3edf2c1ca46063490dffd5a3cede569bad)

Recover function names
pclntab
· Function metadata

Function name offset

Recover function names
pclntab (from go 1.16 and go 1.18)

Recover function names
pclntab (from go 1.16 and go 1.18)

Recover function names
Idea
Function name recovery steps: · Locate pclntab structure · Extract function addresses · Find function name offsets

0x833580 + 0x14B9F8 = 0x97EF78

0x833580 + 0x14BA38 = 0x97EFB8

Recover function names
Executing our script

Strings in Ghidra
Go
· 20813 defined strings in Ghidra · Hard to spot interesting ones · Do we see everything?

Strings in Ghidra
Go
· Search for mining pool URL: 194.145.227.21:5443 · strings can find it · Ghidra cannot define

String Representation
C vs Go
C · sequence of characters terminated with a null character
Go · sequence of bytes with a fixed length · not null terminated · str ­ sequence of bytes · len ­ number of bytes · https://golang.org/src/runtime/string.go · Large string blobs from concatenated strings until
null character · Ghidra has a hard time defining strings in Go binaries
Idea: help Ghidra to find string structures · Static vs dynamic allocation · Per architecture (different instruction set) · Multiple solution within one architecture · Possible changes per Go version

Dynamically allocated string structure
x86
· String structures can be allocated runtime · Several different scenarios
· Let's take a look at the shell/miner.xmrRun function

Dynamically allocated string structure
x86
Length

Dynamically allocated string structure
x86
· Search for these instructions and define strings

Dynamically allocated string structure
x86
· Results after executing the script

Dynamically allocated string structure
Challenges
· Different instruction sets · Can be implemented in different ways within the same architecture · Easy to break intentionally
Binary: Kaiji ­ ARM

Statically allocated string structure
Idea
· Look for pointer to string followed by possible length value · To eliminate FPs limit string length and search for
printable characters only · Check only in data sections · Not architecture specific
String pointers
String length

Statically allocated string structure
Idea
· One pointer was successfully identified as it is directly referenced from the code
String pointers
String length

Statically allocated string structure
Example ­ before executing the script
· Strings are not defined
String pointers
String length

Statically allocated string structure
Example ­ after executing the script

Strings are defined

String length

String pointers

String recovery challenges
Falsely defined data types by Ghidra
· undefined4 or undefined8 (depends on pointer size) · Already defined data types cannot be
redefined (undifined4 and undifined8 are defined data types) · First the data type has to be removed · Then the new data type can be defined

String recovery challenges
Falsely defined data types by Ghidra
· undefined4 or undefined8 (depends on pointer size) · Already defined data types cannot be
redefined (undifined4 and undifined8 are defined data types) · First the data type has to be removed · Then the new data type can be defined

String recovery challenges
Falsely defined data types by Ghidra
· A large string blob (containing multiple strings) defined as one string

Offcut references

String recovery challenges
Falsely defined data types by Ghidra
· A large string blob (containing multiple strings) defined as one string

Other researcher's work
Links
IDA Pro · https://github.com/sibears/IDAGolangHelper · https://github.com/strazzere/golang_loader_assist radare2 / Cutter · https://github.com/f0rki/r2-go-helpers · https://github.com/JacobPimental/r2-gohelper/blob/master/golang_helper.py · https://github.com/CarveSystems/gostringsr2 Binary Ninja · https://github.com/f0rki/bn-goloader Ghidra · https://github.com/felberj/gotools
Only handles linux/x86_64 binaries. · https://github.com/ghidraninja/ghidra_scripts/blob/master/golang_renamer.py

References, additional reading
Sysrv blog posts and other Go malware research
· https://www.intezer.com/blog/research/new-golang-worm-drops-xmrig-miner-on-servers/ · https://help.aliyun.com/document_detail/196163.html · https://s.tencent.com/research/report/1259.html · https://blogs.juniper.net/en-us/threat-research/sysrv-botnet-expands-and-gains-persistence · https://www.lacework.com/blog/sysrv-hello-expands-infrastructure/ · https://blog.netlab.360.com/threat-alert-new-update-from-sysrv-hello-now-infecting-victims-webpages-to-
push-malicious-exe-to-end-users/ · https://community.riskiq.com/article/98f391f9 · https://developer.aliyun.com/article/780758 · https://digital.nhs.uk/cyber-alerts/2021/cc-3838 · https://braintrace.com/wp-content/uploads/2021/06/Threat-Advisory-Report-6-17-2021.pdf · https://rednaga.io/2016/09/21/reversing_go_binaries_like_a_pro/ · https://2016.zeronights.ru/wp-content/uploads/2016/12/GO_Zaytsev.pdf · https://carvesystems.com/news/reverse-engineering-go-binaries-using-radare-2-and-python/ · https://www.pnfsoftware.com/blog/analyzing-golang-executables/ · https://github.com/strazzere/golang_loader_assist/blob/master/Bsides-GO-Forth-And-Reverse.pdf · https://github.com/radareorg/r2con2020/blob/master/day2/r2_Gophers-
AnalysisOfGoBinariesWithRadare2.pdf

Botconf
April 2022

Dorka Palotay Senior Threat Researcher, CUJO AI
@pad0rka

Gyorgy Luptak Junior Threat Researcher, CUJO AI
@gyluptak

CUJO AI Labs https://github.com/getCUJO/ThreatIntel
@CujoaiLabs

