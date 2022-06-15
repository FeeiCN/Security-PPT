SESSION ID: PDAC-T10R
OpenSSL after HeartBleed
#RSAC

Tim Hudson
Cryptsoft , OpenSSL Team
Rich Salz
Akamai Technologies, OpenSSL Team

#RSAC
The most important date
April 3, 2014
2

#RSAC
The most important date
April 3, 2014
HeartBleed Re-key the Internet
3

#RSAC
So what was HeartBleed?
A very simple bug, the code didn't check a buffer length.
Source: http://xkcd.com/1354/ courtesy Randall Munroe
4

#RSAC
So what was HeartBleed?
Massive mainstream press coverage
5

#RSAC
So what was HeartBleed?
To the best of our knowledge, Heartbleed is the first computer systems bug to have both its own website and its own logo, the cute bleeding heart. As such, Heartbleed sets a precedent that will have both positive and negative ramifications for future vulnerabilities and malware. ... Even among the vast majority of the population who have no idea what OpenSSL is, people everywhere quickly found out that a major bug could compromise their Internet security.
Source: VDC Research - http://blog.vdcresearch.com/embedded_sw/2014/04/exploiting-the-exploit-the-marketing-of-heartbleed.html
6

#RSAC
The sky is falling ...
CVE-2011-0014 - infoleak, true impact unknown CVE-2012-2110 - possibly arbitrary code execution on reading certificates CVE-2012-2333 - buffer over-read, true impact unknown CVE-2014-1266 - "goto fail" server spoofing (Apple) CVE-2014-0160 ­ Heartbleed CVE-2014-0224 - "early CCS" disables encryption CVE-2014-1568 - RSA signature forgery (NSS)
7

#RSAC
Or is it ...
8

#RSAC
So what was HeartBleed?
Basically missed validating a variable containing a length Contributed code had a bug ­ bug was in code base for three years! Project team member review missed the bug Other team members either didn't review or also simply missed the bug Multiple external security reviewers and auditors missed the bug OpenSSL external developers and users missed the bug Security review teams in major OpenSSL using organisations missed the bug All existing code analysis tools missed the bug Bug allowed clients to attack servers and servers to attack clients
9



#RSAC
So what was HeartBleed?
10

#RSAC
Life before HeartBleed
Project had effectively become somewhat moribund Releases were not pre-announced, no documented policies Source code was complex and arcane Hard to maintain; harder to contribute Main developers were overworked and overcommitted Project donations minimal (sub USD$2000 per annum)
11

#RSAC
2012 - 2014
12

#RSAC
How did we let this happen?
Very little time spent on building community Long lead time to understand code Static project team membership Need to focus on consulting dollars (FIPS140) to keep project alive No ability to make, announce, and keep to plans ... all added up to "ultra cautious" to any change attitude
13

#RSAC
The usual questions ...
How could the project let this happen? How could the project members be so stupid? What other nasty break-the-internet bugs are yet to be found? Why didn't the project fix this sooner? Why didn't all those companies making money off OpenSSL contribute? How could we possibly trust the team to not make the same mistake in future? Why shouldn't I simply switch over to one of the forks?
14

#RSAC
After-affects
Wider recognition of dependency on critical under-funded projects Creation of the Core Infrastructure Initiative, a multi-million dollar effort to add effective resources to the open source projects that make the Internet work
https://www.coreinfrastructure.org/
15

#RSAC
Growing the Team
Prior to April 2014
Two main developers (one primary committer) entirely on volunteer basis; all other team members focused on other areas; main developer basically funded by paid OpenSSL consulting work No formal decision making process
As of December 2014
Fifteen project team members; Two full time funded by CII; two full time funded by donations Formal decision making process
16

#RSAC
2014-2016

17

#RSAC
After-affects
We had the first-ever F2F Drafted major policies:
Release strategy Security policy Coding style
Socialized with each other; POODLE helped
18

#RSAC
Transparency
GitHub is used. We have public policies for security fixes, a release schedule and high-level content, code of conduct, and so on. Email traffic increased, and (seems) more useful
19

Transparency: security fixes

#RSAC
Source: OpenSSL Blog Entry

20

#RSAC
Bug tracking
Much better, but not yet good enough. Too many bugs Too many old bugs.
21

#RSAC
Renewed focus
Security researchers more actively looking for issues More fuzz testing going on Increased focus on automated testing Static code analysis tools rapidly updated Reported issues more quickly analyzed Mandatory team member code reviews
22

#RSAC
Vitality is its own reward
23

#RSAC
FIPS140
FIPS140 related work effectively entirely funded the OpenSSL project for the last five years Selling into USA Government where FIPS140-2 support is mandatory is important to most large vendors The validation process is time consuming and subject to changed requirements Coordinating multiple sponsors on a multi-year journey with no guarantee of successful outcome is in itself challenging
24

#RSAC
FIPS140
The OpenSSL FIPS 2.0 module works with OpenSSL-1.0.x The previous OpenSSL FIPS 1.0 module for OpenSSL-0.9.x is no longer usable A major update will be required for a new OpenSSL FIPS module to work with OpenSSL-1.1.x which currently remains unfunded and unplanned Objective is to make the FIPS140 related changes "less intrusive"
25

#RSAC
FIPS140-2 Operational Environments
Android 2.2 (gcc Compiler Version 4.4.0); Android 2.2 running on Qualcomm QSD8250 (ARMv7) with NEON (gcc Compiler Version 4.4.0); Microsoft Windows 7 (32 bit) (Microsoft 32 bit C/C++ Optimizing Compiler Version 16.00); uCLinux 0.9.29 (gcc Compiler Version 4.2.1); Fedora 14 running on Intel Core i5 with AES-NI (gcc Compiler Version 4.5.1); HP-UX 11i (32 bit) (HP C/aC++ B3910B); HP-UX 11i (64 bit) (HP C/aC++ B3910B); Ubuntu 10.04 (32 bit) (gcc Compiler Version 4.1.3); Ubuntu 10.04 (64 bit) (gcc Compiler Version 4.1.3); Android 3.0 (gcc Compiler Version 4.4.0); Linux 2.6.27 (gcc Compiler Version 4.2.4); Microsoft Windows 7 (64 bit) (Microsoft C/C++ Optimizing Compiler Version 16.00); Ubuntu 10.04 running on Intel Core i5 with AES-NI (32 bit) (gcc Compiler Version 4.1.3); Linux 2.6.33 (gcc Compiler Version 4.1.0); Android 2.2 running on OMAP 3530 (ARMv7) with NEON (gcc Compiler Version 4.1.0); VxWorks 6.8 (gcc Compiler Version 4.1.2); Linux 2.6 (gcc Compiler Version 4.3.2); Linux 2.6.32 (gcc Compiler Version 4.3.2); Oracle Solaris 10 (32 bit) (gcc Compiler Version 3.4.3); Oracle Solaris 10 (64 bit) (gcc Compiler Version 3.4.3); Oracle Solaris 11(32 bit) (gcc Compiler Version 4.5.2); Oracle Solaris 11 (64 bit) (gcc Compiler Version 4.5.2); Oracle Solaris 11 running on Intel Xeon 5675 with AES-NI (32 bit) (gcc Compiler Version 4.5.2); Oracle Solaris 11 running on Intel Xeon 5675 with AES-NI (64 bit) (gcc Compiler Version 4.5.2); Oracle Linux 5 (64 bit) (gcc Compiler Version 4.1.2); CascadeOS 6.1 (32 bit) (gcc Compiler Version 4.4.5); CascadeOS 6.1 (64 bit) (gcc Compiler Version 4.4.5); Oracle Linux 5 running on Intel Xeon 5675 with AES-NI (gcc Compiler Version 4.1.2); Oracle Linux 6 (gcc Compiler Version 4.4.6); Oracle Linux 6 running on Intel Xeon 5675 with AES-NI (gcc Compiler Version 4.4.6); Oracle Solaris 11 (32 bit) (Sun C Version 5.12); Oracle Solaris 11 (64 bit) (Sun C Version 5.12); Android 4.0 (gcc Compiler Version 4.4.3); Apple iOS 5.1 (gcc Compiler Version 4.2.1); Microsoft Windows CE 6.0 (Microsoft C/C++ Optimizing Compiler Version 15.00 for ARM); Microsoft Windows CE 5.0 (Microsoft C/C++ Optimizing Compiler Version 13.10 for ARM); Linux 2.6 (gcc Compiler Version 4.1.0); DSP Media Framework 1.4 (TMS320C6x C/C++ Compiler v6.0.13); Android 4.0 running on TI OMAP 3 (ARMv7) with NEON (gcc Compiler Version 4.4.3); NetBSD 5.1 (gcc Compiler Version 4.1.3); Microsoft Windows 7 running on Intel Core i5-2430M (64bit) with AES-NI (Microsoft C/C++ Optimizing Compiler Version 16.00 for x64); Android 4.1 running on TI DM3730 (ARMv7) (gcc Compiler Version 4.6); Android 4.1 running on TI DM3730 (ARMv7) with NEON (gcc Complier Version 4.6); Android 4.2 running on Nvidia Tegra 3 (ARMv7) (gcc Compiler Version 4.6); Android 4.2 running on Nvidia Tegra 3 (ARMv7) with Neon (gcc Compiler Version 4.6); Windows Embedded Compact 7 running on Freescale i.MX53xA (ARMv7) with NEON (Microsoft C/C++ Optimizing Compiler Version 15.00.20720); Windows Embedded Compact 7 running on Freescale i.MX53xD (ARMv7) with NEON (Microsoft C/C++ Optimizing Compiler Version 15.00.20720); Android 4.0 running on Qualcomm Snapdragon APQ8060 (ARMv7) with NEON (gcc compiler Version 4.4.3); Apple OS X 10.7 running on Intel Core i7-3615QM (Apple LLVM version 4.2); Apple iOS 5.0 running on ARM Cortex A8 (ARMv7) with NEON (gcc Compiler Version 4.2.1); OpenWRT 2.6 running on MIPS 24Kc (gcc Compiler Version 4.6.3); QNX 6.4 running on Freescale i.MX25 (ARMv4) (gcc Compiler Version 4.3.3); Apple iOS 6.1 running on Apple A6X SoC (ARMv7s) (gcc Compiler Version 4.2.1); eCos 3 running on Freescale i.MX27 926ejs (ARMv5TEJ) (gcc Compiler Version 4.3.2); Ubuntu 13.04 running on AM335x CortexA8 (ARMv7) (gcc Compiler Version 4.7.3); Ubuntu 13.04 running on AM335x Cortex-A8 (ARMv7) with NEON (gcc Compiler Version 4.7.3); Linux 3.8 running on ARM926 (ARMv5TEJ) (gcc Compiler Version 4.7.3); Linux 3.4 64bit under Citrix XenServer running on Intel Xeon E5-2430L (x86) without AES-NI (gcc Compiler Version 4.8.0)
26

#RSAC
Lessons
Relying on any single individual to perform superhuman feats ultimately results in disappointment Code reviews actually require the reviewers to review the code in detail Assuming that users will review code is clearly a flawed strategy Assuming that automated code analysis tools by themselves can completely replace experienced code reviews is incorrect
27

#RSAC
Project Roadmap

Roadmap has been published and progress against roadmap updated - https://www.openssl.org/policies/roadmap.html

Major items:
clear bug backlog documentation complexity coding style

code reviews release plan platform strategy security strategy

28

#RSAC
Apply What You Have Learned Today
Download the pre-releases and build your applications Help is a two-way street, join the virtuous circle. Or at least join the openssl-dev and/or openssl-users mailing lists Report bugs through RT, submit patches on GitHub. Help close bugs. If you are doing more than TLS for HTTP, please let us know More ideas on the Community page of www.openssl.org
29

#RSAC
The OpenSSL Development Team

Matt Caswell Mark J. Cox Viktor Dukhovni Steve Henson Tim Hudson Lutz Jänicke Emilia Käsper Ben Laurie

Richard Levitte Steve Marquess Bodo Möller Andy Polyakov Kurt Roeckx Rich Salz Geoff Thorpe
30

#RSAC
Questions
Rich Salz - rsalz@openssl.org
Tim Hudson ­ tjh@openssl.org
31

