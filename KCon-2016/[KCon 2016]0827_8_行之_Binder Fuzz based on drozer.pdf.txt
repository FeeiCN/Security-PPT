Binder Fuzz based on drozer & Some interesting Vulnerabilities sharing
 (@0xr0ot)
0xr0ot.sec@gmail.com Kcon Beijing 2016

Who am I
· ID:0xr0ot(not 0xroot) · Security researcher(2
years) · Mainly focus on
Android security · Always like basketball

Agenda
· drozer introduction · Binder fuzz model · Case share · How to exploit

Drozer Architecture
· console · agent · server

Functionality

· Exploit · Scanner

Metasploit?

Design Principles
· Reflection · Class loading

Drozer mode
· direct mode · infrastructure mode

Commands
drozer server start --port port drozer exploit build exploit.usb.socialengineering.usbdebugging --server ip -credentials username password drozer console connect --server ip:port --password

Writing a module

Binder fuzz
Why use drozer? I am familiar with it,XD!
· fuzz intent · fuzz service call

Fuzz model
· drozer module(core) · external python script(control logic)
All in the one drozer module is OK

Case Share
· LockScreen bypass(or clear) · Fake shutdown (eavesdropping) · Capability leak · System Dos

LockScreen bypass(CVE-2016-3749)

CVE-2016-3749 Details

Windfall

CVE-2016-3749 Patch

My first high severity issue

Fake Shutdown(eavesdropping)
· Samsung

Capability Leak
· nexus series car mode · samsung change theme Video demonstration

System Dos(restart)
· nexus(3) Video demonstration. · samsung(11)

Samsung Acknowledgements

Good News

How to exploit(system service vulnerability)
· use AIDL file · use java reflection · native layer · shell script

Exploit-use AIDL file
· The Android SDK tools will help to generate an interface in the Java programming language, based on the .aidl file you import.
· "The ***.aidl file not found",but it's just there.If the similar error occurs,you can write the java code manually.
Reference: Android Bound Service(by ) http://drops.wooyun.org/mobile/13676

Exploit-use AIDL file

Exploit-use reflection
· The nature is the same as use AIDL file. · It doesn't need .AIDL file.

Exploit-native

Exploit-shell script
· clear.sh · key code:
Runtime runtime = Runtime.getRuntime(); Process proc = runtime.exec(command);

Summary
· AIDL:It is easy to see the nature of the vulnerability.
· java reflection: It is simple and convenient. · native:It needs android source environment. · shell script:It is simple.

