Come Join the [CAFSA] Continuous Automated
Firmware Security Analysis
Collin Mulliner
Black Hat USA, August 2019

Collin Mulliner
Building Embedded Devices on and off since 2006 Developing Mobile Apps since 1997 (In-)Security since `90s Research/Academia with focus on Mobile Device & App Security ~10 years
Currently: Principal Security Engineer, Autonomous Vehicle Security @ Cruise
@collinrm
2 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Building Secure Devices is Hard
3

Devices
Industrial & IOT

Customized Android Devices Consumer Electronics

source: https://developer.qualcomm.com/hardware/dragonboard-410c

source: https://www.amazon.com/Huawei-MediaPad-KardonTuned-Speakers-Warranty/dp/B07M5NLGVY

Collin Mulliner - FwAnalyzer - Black Hat USA 2019

source: https://zionmarketresearch.wordpress.com/2017/ 05/22/consumer-electronics-market/
4

Car  Devices on Wheels
=
5 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Devices & Firmware
Device with full operating system: kernel and user-space, actual filesystem  Firmware consists of kernel and a number filesystem images
Device without kernel, no kernel/user-space just a number of tasks  Firmware consist of one binary that has code and data
6 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Devices & Firmware
Device with full operating system: kernel and user-space, actual filesystem  Firmware consists of kernel and a number of filesystem images
Device without kernel, no kernel/user-space just a number of tasks  Firmware consist of one binary that has code and data
Basically this covers anything that runs Linux (incl. Android) and similar (e.g. QNX)
7 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

8

Firmware = Your Product = Firmware
9

Firmware Security

Security Features:

 Secure Boot : valid signatures for kernel and filesystems

 Configuration : production version of configuration files

 Binaries

: only production binaries  no debug/dev/test binaries

 Access Control : file permissions and labels

 Keys/Certs

: any kind of cryptographic material

 Hardened Code : production build, hardening options, no symbols, ...



Firmware is "secure" if all security features are combined in production

10 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Firmware Bugs
11 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Firmware Bugs
12 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Firmware Bugs, How?
13

Firmware Changes Over Time
Prototyping, Development, Testing, QA, Pentest, ...... Production
Dev

Sign

Production Build

Ship

CI

Test

14 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Firmware Changes Over Time - Reality

Prototyping, Development, Testing, QA, Pentest, ...... Production
Dev

 New feature

 Disabled securitSyigsnetting to debug

 New feature

CI

Test

ProduNcteioendButoildopen that netwoSrhkipport

 Developers like to ssh into the device

 New feature

 QA needs to do X, make special build

 Removed functionality Z

 Y only works on dev, lets change prod

Lots and Lots of Changes

15

Collin Mulliner - FwAnalyzer - Black Hat USA 2019

The Ripple Effect of shipping `bad' Firmware
Non or partially working Security Controls (Partially) defective Product Firmware update mechanism crippled
Long term Negative Impact on: Product, Company, and Ecosystem  Loss of Reputation  High Costs in case of a Recall
16 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Automating Firmware Security QA
1. Tool to perform automated firmware security checks 2. Deploy tool to strategic locations in your development and release flow 3. Feed results back to developers (and suppliers)
17 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FwAnalyzer : a Tool for Firmware Security QA

Expert creates Rules  FwAnalyzer enforces Rules and produces a Report

Rules are applied to Files within FileSystem images of Firmware

 Enforce

: type, ownership, permissions, security labels

 Analyze File Content : compare digest, apply RegEx, run external program

18 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FwAnalyzer : a Tool for Firmware Security QA

Expert creates Rules  FwAnalyzer enforces Rules and produces a Report

Rules are applied to Files within FileSystem images of Firmware

 Enforce

: type, ownership, permissions, security labels

 Analyze File Content : compare digest, apply RegEx, run external program

Use Cases:

 Run in CI during development  produce immediate feedback  Gate Production Signing  don't sign `insecure' firmware with prod keys  Acceptance Testing for 3rd party firmware  don't deploy bad firmware  .....

19 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FwAnalyzer : a Tool for Firmware Security QA
Source: http://www.github.com/cruise-automation/fwanalyzer
20 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FwAnalyzer : a Tool for Firmware Security QA
Open Sourced Today!
Source: http://www.github.com/cruise-automation/fwanalyzer
21 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Goal
Prevent `bad' high impact changes from going into Production  Debugging features or weak configuration  Signing `bad' builds with production keys
Prevent a ripple effect due to bad security! You put a lot of effort into security features. Make sure they are enabled! Create (self) confidence about the security of your product!
22 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Additional Goals
Visibility: information that is hard to acquire but super helpful  version information, security parameters, ... Automation: designed for integration into development pipeline  produce machine readable output for post processing Collaboration: use rules from external sources  share `common' rules but keep sensitive rules private
23 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

NOT IN SCOPE: Software Vulnerabilities
FwAnalyzer IS NOT a ...vulnerability finding tool to find bugs in source or binaries ...CVE scanner to analyze your software stack for known vulnerabilities
Use existing tools and processes to check your software!
*FwAnalyzer-scripts can be used to call such tools from within FwAnalyzer
24 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FwAnalyzer
$ fwanalyzer -cfg system.toml -in system.img -out system_out.json
25 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FwAnalyzer
$ fwanalyzer -cfg system.toml -in system.img -out system_out.json
Rules
26 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FwAnalyzer
$ fwanalyzer -cfg system.toml -in system.img -out system_out.json
FileSystem Image
Rules
27 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FwAnalyzer
$ fwanalyzer -cfg system.toml -in system.img -out system_out.json

Rules

Report

28 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FwAnalyzer
$ fwanalyzer -cfg system.toml -in system.img -out system_out.json

issue detected

Rules

Report

29 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Firmware vs FileSystem Image
Firmware = kernel + filesystem images bundled in one file (zip, cpio, ...)
FwAnalyzer targets factory image and/or full firmware update  Reason: Uncertainty about firmware content until it is fully assembled
 What happens when is highly dependant on the build system  Every platform is different
Side effect: automatic support for firmware of Commercial Off-The-Shelf devices
30 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FileSystem Image vs. File
FileSystem has a lot of data vs. File just contains bytes
 File metadata
 Owner  Type & Permission  Attributes (e.g., SELinux label)
 Directory structure
Compare entire FileSystem Images against each other
 Find new/modified/removed files and directories
31 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FwAnalyzer Infrastructure
FwAnalyzer = the actual executable check.py  Unpack firmware and run FwAnalyzer Config Files = Rules  Configuration for each filesystem image  Supports including files from "rule library" FileTree = list of all files in filesystem image (from a previous run)
32 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Workflow

unpack

FwAnalyzer

firmware

boot.img

Post Process &
Combine

system.img

33 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FwAnalyzer

Operates on the filesystem image and analyzes it without mounting it!

 Currently supports: ext2/4, vFat, squashfs, ubifs, and local directory

FwAnalyzer outputs JSON  easy post processing and automation

 offenders : violations of the configured rules  firmware fails the analysis

 informational : non fatal checks  visibility and rule testing

 data

: extracted from filesystem  visibility and post processing

34 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FwAnalyzer

Operates on the filesystem image and analyzes it without mounting it!

 Currently supports: ext2/4, vFat, squashfs, ubifs, and local directory

FwAnalyzer outputs JSON  easy post processing and automation

 offenders : violations of the configured rules  firmware fails the analysis

 informational : non fatal checks  visibility and rule testing

 data

: extracted from filesystem  visibility and post processing

35 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FwAnalyzer: Overview
Global Configuration  FsType & Options  FileSystem "drivers" implemented via external tools  e2tools, squashfs tools, ubireader, mtools, ... (we patched some of these) Checks implemented against `abstract file` object  Checks don't need to know about the filesystem type  Extremely easy to add new checks
36 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Global File Checks

Check every file in the filesystem, flagging offending files based on:

 SUID  WorldWrite  SELinuxLabel  Allowed UID/GID  BadFiles

: flag SUID file (with possibility to whitelist files) : flag world writable file : flag UNLABELED file : flag file not owned by allowed UID/GID : flag file if on badfile list

These checks provide an easy starting point to define a general security model.
37 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

File Stat Check

Check the metadata of a specific file

 Mode  Owner  AllowEmpty  SELinuxLabel  LinkTarget

: file type, permissions, flags : UID and/or GID : allow/disallow file size zero : the specific label : target of a softlink

Allows to model parameters of a specific file.
38 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

File Content
Check file content (using a number of different methods)  RegEx : apply regular expression to the content of the file  Digest : compare the digest to a configured digest  JSON : parse file as JSON and compare a specific field to configured value  Script : run an external program 
Core functionality to enforce rules based on file content.
39 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

File Content: Examples
40 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Extract Data
Extract file content (using a number of different methods)  RegEx : regular expression with capture group  JSON : parse file as JSON and extract specific field  Script : stdout of external program
Core functionality to provide visibility
41 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FileTree Check
FileTree  list of files in the filesystem (including metadata and file digest) The filetree is collected every run and compared to the filetree of a previous run
42 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FileTree Check
FileTree  list of files in the filesystem (including metadata and file digest) The filetree is collected every run and compared to the filetree of a previous run
43 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FileTree Check
FileTree  list of files in the filesystem (including metadata and file digest) The filetree is collected every run and compared to the filetree of a previous run
Output: NEW files, DELETED files, and MODIFIED files
Provide an easy way to identify changes between two filesystems.
44 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Script - Implement Custom Checks
FwAnalyzer extracts File from FileSystem image to temp directory
Script run on extracted file and metadata is passed to script via cmdline args
Examples:
 Binaries stripped, DEP, ASLR, etc... enabled?  Does file contain private key?  Analyze application packages (e.g., APKs)  Custom check
 e.g., check that binary contains specific built-in config file
45 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Checks and InformationalOnly
Checks produce offenders  e.g. file has bad permission Presence of offenders indicate security issues  bad firmware
Informational results basically are `for your information' Set checks to InformationalOnly to convert offender to informational  Test out new checks without breaking the analysis
46 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Post Processing - check.py
 Identify failed checks via `offenders'  Custom checks on top of reports using DataExtract  Combine filesystem image reports into Firmware report
boot.img
custom checks system.img
47 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Post Processing - Custom Checks
Compare data across filesystem images  e.g. compare `data' items from multiple reports
Analyze FileTree  e.g., statistical analysis of file types
48 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Example: Android Firmware
Disclaimer
 This is just an example!  I searched the web for a userdebug Android firmware for this talk  The aim is to demo the tool, not to find bugs

RockChip PX5

gs1_px30_8.1_ota(20181206).zip

source: https://www.aliexpress.com/item/Octa-core-9

49

-RAM-2G-Android6-0-car-radio-dvd-gps-for-Toyota-Prado-

Collin Mulliner - FwAnalyzer -20B14l-awcithk/32H80a61t6U88S55A.htm2l 019

Android OTA Update

check_ota.py will...

 unpack ota.zip, reconstruct sparse *.img files, and unpack boot.img

boot_img/

(unpacked boot.img)

img_info

kernel

ramdisk/

(unpacked ramdisk)

verity_key

...

boot.img

(unpacked ota.zip)

system.img

vendor.img

oem.img

trust.img

uboot.img
50 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Configuration (one for each filesystem image)

system.toml

boot.toml

vendor.toml

51 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

system.toml
include checks for user builds (aka production build)
52 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

boot.toml

FsType = local directory (remember we had to unpack the boot.img)

53 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

android_user_build_checks.toml
Check "user" properties  ro.build  ro.secure  ro.debuggable
54 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

android_properties.toml
Extract properties ro.build...  type  flavor  security_patch
55 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Running it...
check_ota.py does all the leg work for you...
 unzip the OTA, reassemble the filesystem images, unpack boot.img  run FwAnalyzer  inspect the individual filesystem reports and assemble the final report
$ check_ota.py --ota unpacked --cfg-path demo/user --targets "system,boot,vendor" --cfg-include-path demo --report demo_user.json
report written to: demo_user.json OTA Check Failed $
56 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Report
Check "Status" Image reports  boot  system  vendor
57 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Offenders
ro.build != user bad otacerts.zip SUID files illegal files bad UIDs
58 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Data
59 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Result
`userdebug' OTA firmware failed production checks! (as it should) Visibility - with one look we can easily tell  Failed checks (offenders)

 Version and security patch level  Build Flavor  Security properties (ro.debuggable, ...)
60 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Deploying FwAnalyzer
 Development
 Find issues early and have developers fix them as they build the product 
 Gate for Production Signing
 Make sure you only sign "good" production builds 
 Acceptance Testing
 You buy a custom device from a supplier and want to ensure the quality of the firmware  You create rules to check firmware updates as you receive them 
 Vendor/Supplier Assessment
 You buy Commercial off-the-shelf devices and need to assess them  (FwAnalyzer as one tool in the process)
61 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FwAnalyzer during Development
Goal: prevent development based on bad/incomplete information  Developers want to do the right thing but might not know security  Provide feedback about security during development
FwAnalyzer as part of Tests  make test also invokes FwAnalyzer  run FwAnalyzer in CI
make developers aware about file permissions, security labels, SUID binaries, ...
62 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FwAnalyzer in CI: SELinux
SELinux breaks developers assumptions about file access  Missing or wrong label will break file access Lots and lots of frustration  Security is blamed for breaking everything (why does reading file X fail???)
FwAnalyzer flags unlabeled files
63 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FwAnalyzer in CI: File Permissions and Ownership
File Permissions and Ownership are easily overlooked  Platform ONLY needs to READ the file  everything works, right? FwAnalyzers flags World Writable files & check file owner user/group
64 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FwAnalyzer in CI
Dev

CI

Test

Disable "slower" checks in the CI config of FwAnalyzer  DigestImage, FileTreeChecks
65 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Production Signing
Production signed firmware will run on every device out in the field  Producing "insecure" production signed firmware might cause huge damages
 Highly dependent on your risk model and other security features such as rollback protection  You never ever want to production sign a development build!
Production Signing should ONLY happen after development and testing is done  The final stamp of approval before shipping
66 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Production Checks
 BuildType Information
 eng vs production
 Public keys/certs (e.g. used for software update)
 ensure they are the production version
 System hardening features
 secure boot, dm-verity configured and enabled, hardened kernel config, stripped binaries, ...
 Development/Debug/Test Binaries
 strace, tcpdump, sshd, ... (highly OS and product dependent)
 Production Config Files
 hardened firewall config, debug/test user accounts
67 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FwAnalyzer Gating Production Signing
Production FwAnalyzer Sign
FAILED Logging Service
multiple checks failed
68 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Acceptance Testing
Device manufactured by 3rd party supplier  You spent time to figure out how everything works  Went back and forth with supplier until "every works as expected" Create FwAnalyzer configuration to capture known good state  Check new firmware revisions using configuration with known "good state"  Include as much data as possible in the report (DataExtract)
catch changes that later might bite you in the...
69 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FwAnalyzer as part of Acceptance Testing

supplier uploads firmware

FwAnalyzer Service

Logging Service

email notification based on trigger
70 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Acceptance Testing cont.
New firmware revision, do changes...  violate any of your rules?  match up with the change log from the supplier?
Detailed report provides good visibility into firmware revision.
71 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Vendor Security Assessment
Asses Commercial Off-the-Shelf devices Quickly find interesting things...  SUID binaries, world writable files, ...  Cryptographic material, account names and password hashes FileTreeCheck...  Discover changes between firmware versions
FwAnalyzer just as one step in the process
72 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Post Post Processing
Pump FwAnalyzer JSON output into your favorite log service Implement post processing checks based on ...  Filenames  Extracted data Configure Searches/Triggers  Feed into Alerting, Reporting, and Ticketing
73 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FwAnalyzer for Your Device
Tasks:  unpack YOUR firmware format  create FwAnalyzer config files  custom checks & post processing of results
check.py, implement:  firmware unpacking  report post processing and custom complex checks
74 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

FwAnalyzer for Your Device: Config Files
Create a config file for each FileSystem image you unpacked  select FsType that matches your filesystem image  use DirFs to handle files extracted from BLOBs such as boot.img Rules:  start with GlobalFileChecks  slowly add specific checks (use InformationalOnly to test)  enable FileTree checks to monitor revision changes  move checks to rule library so you can share them across devices
75 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Rule Library

[Include."common_checks.toml"] Write checks and DataExtract rules once...  Common rules for dev and prod  Multiple similar devices
Similarly for scripts....

$ ls devices/android android_properties.toml android_user_build_checks.toml
$ ls devices/generic/linux mounts.toml path_owners.toml

Open source and share rule library with the community!
76 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Future Work

FwAnalyzer
 FileSystems
Scripts
 Kernel config  checksec.sh*  APK checker

: support more filesystem types
: check for debug features, etc... : check security features of executables (ASLR, DEP, ...) : use APK security checking tool

*https://github.com/slimm609/checksec.sh
77 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Conclusions
FwAnalyzer
 Deployed in CI for one big project  more to follow soon  Gates production signing for multiple devices

All of this is just one piece of the puzzle!
 You still have to: build security controls, audit code, ...

Continuous Security Analysis has shown value
 Caught potential showstoppers ... one could have been expensive
78 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Continuous Automated Firmware Security Analysis
79 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Continuous Automated Firmware Security Analysis
Won't easily miss security relevant changes Automated feedback during development
Confidence and peace of mind
80 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Thanks & Credits
Code Contributors
 Jon Larimer and Graziano Misuraca

General Support
 Chris Valasek, Tim Piastrelli, and others Cruisers

Discussions and feedback
 Various `unnamed' people
81 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

Public Release
Today FwAnalyzer is Open Source We have a blog post out at: https://medium.com/cruise Source on GitHub: https://github.com/cruise-automation/fwanalyzer Release includes:  Config example and rule library  Lots of unit and integration tests  Full end-to-end check for Android OTA files (unpacking & configs)
82 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

END - thank you for your time!
Questions?
www.FwAnalyzer.io
...or bug me on Twitter at: @collinrm
83 Collin Mulliner - FwAnalyzer - Black Hat USA 2019

