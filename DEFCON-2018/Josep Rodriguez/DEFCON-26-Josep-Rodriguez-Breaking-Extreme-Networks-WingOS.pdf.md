Breaking WingOS
1

Index
· Intro to WingOS. · Scenarios & Attack surface. · Vulnerabilities. · Exploitation & Demo. · Conclusions
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Intro to WingOS
· Embedded Linux OS with proprietary modifications in Kernel. · Created by Motorola. Now property of Extreme networks. · Architecture Mips N32. · Used mainly in Wireless AP and Controllers. · No public information or previous research about its internals.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Intro to WingOS
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Intro to WingOS
· Web interface.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Intro to WingOS
· CLI.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Intro to WingOS
· Devices using WingOS (Extreme networks):
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Intro to WingOS
· Devices using WingOS: · Motorola devices and Zebra devices.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Intro to WingOS
· Devices using WingOS:
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Intro to WingOS
· Devices using WingOS (Kontron for aircrafts):
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Intro to WingOS
· Where you can find these devices? - Widely used in aircrafts by many airlines around the world.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Intro to WingOS

IOActive, Inc. Copyright ©2018. All Rights Reserved.

https://techworld.idg.se/2.2524/1.644569/wifi-flygplan/sida/2/sida-2

Intro to WingOS
EN website and case studies you can see that these devices are used in: - Smart buildings and Smart cities. - Healthcare. - Government. - Small and big enterprise networks. - Education. - Retail, Stadiums. - ...
IOActive, Inc. Copyright ©2018. All Rights Reserved.

https://transitwireless.com/wp-content/uploads/2016/04/Motorola-Case-Study-New-York-City-Transit.pdf
IOActive, Inc. Copyright ©2018. All Rights Reserved.

IOActive, Inc. Copyright ©2018. All Rights Reserved.

IOActive, Inc. Copyright ©2018. All Rights Reserved.

IOActive, Inc. Copyright ©2018. All Rights Reserved.

IOActive, Inc. Copyright ©2018. All Rights Reserved.

IOActive, Inc. Copyright ©2018. All Rights Reserved.

IOActive, Inc. Copyright ©2018. All Rights Reserved.

IOActive, Inc. Copyright ©2018. All Rights Reserved.

IOActive, Inc. Copyright ©2018. All Rights Reserved.

Attack Surface & Scenarios
1. Aircraft Scenario:
Focused in the remote pre-auth vulnerabilities found. · Ethernet cable: - Less likely in an Aircraft. - UDP Services/ Mint Services. · Wi-Fi ( open Wi-Fi or password protected Wi-Fi) · Pivoting from Sat modem to AP (From the ground!)
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Attack Surface & Scenarios
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Attack Surface & Scenarios
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Attack Surface & Scenarios
2. Other scenarios:
Focused in the remote pre-auth vulnerabilities found. · Connect Ethernet cable directly: - More likely with outdoor Access Points but also
possible inside buildings. · Wi-Fi ( open Wi-Fi or password protected Wi-Fi). · Internal network (you are inside the network).
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Vulnerabilities
Hidden root shell backdoor.
· From restricted CLI to hidden root shell. · Attacker perspective. CLI access: Good, Root shell: completely compromised · Not critical vuln but very important for the research process.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Hidden root shell backdoor.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Hidden root shell backdoor.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Hidden root shell backdoor.

IOActive, Inc. Copyright ©2018. All Rights Reserved.

Default value in every WingOS

Hidden root shell backdoor.
The content of the file is passed to the Following loop. Let's emulate this loop with Unicorn. Unicorn uses Qemu in the background and allows You to emulate assembly code for several archs.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Hidden root shell backdoor.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Hidden root shell backdoor.
Basically, the content of the file are hex bytes (in ascii).
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Hidden root shell backdoor.
Decrypts (RC4) the contents of the file (as hex bytes) with the key "Hi Sabeena? How're you doin'? Bye!!" In this case, the decryption result of the file is the string "password".
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Hidden root shell backdoor.
Get the MAC addr of the device And does the following operation with MAC: XX:XX+1:XX+2:XX+3:XX+4:XX+5
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Hidden root shell backdoor.
RC4 decrypt "password" with the key XX:XX+1:XX+2:XX+3:XX+4:XX+5
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Hidden root shell backdoor.
This last block will make sure that the valid password calculated, will contain only lower-case letters.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Hidden root shell backdoor.
If password granted:
Different password next time you try to get shell.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Hidden root shell backdoor.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Hidden root shell backdoor.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Remote pre-auth stack overflow.

IOActive, Inc. Copyright ©2018. All Rights Reserved.

UDP service listening on 0.0.0.0 by default.
RIM process (Radio Interface Module)

Remote pre-auth stack overflow.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Remote pre-auth stack overflow.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Remote pre-auth stack overflow.
· Only some old versions vulnerable to this stack overflow(Let's see why in a minute).
· Kontron devices (aircrafts) firmware should be vulnerable based on info in their website.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Remote pre-auth "global" denial of service.
Newest firmware version, stack overflow fixed. But...
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Remote pre-auth "global" denial of service.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Remote pre-auth "global" denial of service.
Watchdog checks if RIM process is running, if not, the whole OS is rebooted. Execute the same POC 2 o 3 times killing the RIM process several times and the whole OS will be rebooted.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Mint Vulnerabilities

Lots of recvfrom in binaries. Domain 0x32? Local_mint_addr?

IOActive, Inc. Copyright ©2018. All Rights Reserved.

What is Mint?
No much info on the internet. L2/L3 proprietary protocol Level 1 VLAN Level 2 IP
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Mint
L2/L3 proprietary protocol
Proprietary socket address family (AF_MINT) (sys/socket.c sys/socket.h) Datagram socket 1. Reverse engineer their kernel to mimic this L2/L3 protocol and build a client 2. Try to emulate the whole OS/Kernel (Probable, but might be painful) 3. Find a way to build a client using their OS kernel.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Mint
Attack scenarios using Mint:
· Attacker connects its device to the network or directly to the target Device (Wireless or Cable)
· Attacker remotely compromises a device connected to the network.
· Attack services/AP/Controllers over Mint services.
· Controllers == Windows DC
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Creating Mint Client:
Mint client: Inspecting their library usr/lib/python2.7/lib-dynload/_socket.so :
We should be able to import socket and create Mint sockets.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Mint
Default config of controller Standalone AP can also be configured as Controller
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Mint
Attacker's device. I want to connect over mint to the Controller(victim). Now, Controller (victim) sees attacker over mint. And attacker can also connecter over mint to Controller (victim).
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Mint Vulnerabilities
Services listening on several ports over L2/L3 protocol Example of function parsing messages over 1 specific port (HSD process):
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Vulnerability
Memcpy's src and len user-controlled, dst is heap. Totally controllable: HSD process, Mint port 14
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Vulnerability
To reach that memcpy in the switch case statement we have to: First go to case0 of switch statement and we got a restriction. Get_session_by_mac check if the MAC sent in our payload is authenticated.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Vulnerability
To reach that memcpy in the switch case statement we have to: Luckily we can add a fake MAC to the authenticated list Another case for the switch case statement allow us that:
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Vulnerability
To reach that memcpy in the switch case statement we have to send this: First, session alloc for our Fake MAC addr
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Vulnerability
To reach that memcpy in the switch case statement we have to send this: And now we can reach the vulnerable memcpy
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Vulnerability
Crash:
/root # gdb (gdb) attach 1765 Attaching to process 1765 Reading symbols from /usr/sbin/hsd...(no debugging symbols found)...done.
(gdb) c Continuing.
Program received signal SIGABRT, Aborted. 0x2af26624 in raise () from /lib/libc.so.6 (gdb) bt #0 0x2af26624 in raise () from /lib/libc.so.6 #1 0x2af28108 in abort () from /lib/libc.so.6 #2 0x2af645b0 in __fsetlocking () from /lib/libc.so.6 #3 0x2af6b620 in malloc_usable_size () from /lib/libc.so.6
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Vulnerability
Another Memcpy's src and len user-controlled, dst is heap. Totally controllable: HSD process, Mint port 14
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Vulnerability
Another Memcpy's src and len user-controlled, dst is heap. Totally controllable: HSD process, Mint port 14
/root # gdb (gdb) attach 4820 Attaching to process 4820 Reading symbols from /usr/sbin/hsd...(no debugging symbols found)...done. (gdb) c Continuing.
Program received signal SIGABRT, Aborted. 0x2af26624 in raise () from /lib/libc.so.6 (gdb) bt #0 0x2af26624 in raise () from /lib/libc.so.6 #1 0x2af28108 in abort () from /lib/libc.so.6 #2 0x2af645b0 in __fsetlocking () from /lib/libc.so.6 #3 0x2af6b620 in malloc_usable_size () from /lib/libc.so.6
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Vulnerability
Stack overflow where user data comes from the previous memcpy vuln. To overflow the Stack the Heap buffer has to be overflowed as well:
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Vulnerability
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Vulnerability
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Vulnerability
LIBC sanity checks can make it crash before the stack overflow happens. We could try to provide valid data in the next chunk's metadata to avoid crash (NO ASLR) In this case is not necessary as it won't crash if we execute the exploit "quick". Provide valid data in the next chunk's metadata to make it more reliable.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

EXPLOIT
· NO ASLR, NO NX, NO STACK CANARIES.. · Just jump to our shellcode? Nope. · Cache incoherence problem (well known): · MIPS CPU I-Cache D-Cache Instructions, Data. · Our payload likely will be stored in the D-Cache.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

EXPLOIT
IOActive, Inc. Copyright ©2018. All Rights Reserved.

EXPLOIT
· FILL THE D-CACHE TO FLUSH IT (Depends on how big it is) · Call a blocking function such as Sleep( ) using ROP · The cache will be flushed.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

EXPLOIT
ROP: From the epilogue we know the registers that we control at the crash time.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

LIBC GADGETS
IOActive, Inc. Copyright ©2018. All Rights Reserved.

SHELLCODE
IOActive, Inc. Copyright ©2018. All Rights Reserved.

SHELLCODE
IOActive, Inc. Copyright ©2018. All Rights Reserved.

SHELLCODE
MIPS N32:
IOActive, Inc. Copyright ©2018. All Rights Reserved.

SHELLCODE
MIPS N32:
IOActive, Inc. Copyright ©2018. All Rights Reserved.

SHELLCODE
MIPS N32 Shellcode:
IOActive, Inc. Copyright ©2018. All Rights Reserved.

EXPLOIT
IOActive, Inc. Copyright ©2018. All Rights Reserved.

DEMO
IOActive, Inc. Copyright ©2018. All Rights Reserved.

EXPLOIT
1. Use your own device (or use compromised one). 2. Add our Fake MAC addr to the auth list 3. Overflow the heap with our ROP Gadgets and Shellcode 4. Stack overflow with the Heap data. 5. BANG!
IOActive, Inc. Copyright ©2018. All Rights Reserved.

AEROSCOUT VULNERABILITY
IOActive, Inc. Copyright ©2018. All Rights Reserved.

AEROSCOUT VULNERABILITY
IOActive, Inc. Copyright ©2018. All Rights Reserved.

AEROSCOUT VULNERABILITY
UDP 1144
IOActive, Inc. Copyright ©2018. All Rights Reserved.

AEROSCOUT VULNERABILITY
· No Authentication at all. · Once reverse engineered the protocol, you can mess with locations.
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Conclusion
· Patches provided by extreme networks:
https://gtacknowledge.extremenetworks.com/articles/Vulnerability_Notice/VN-2018-003
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Conclusions
· Lot of room for improvement in WingOS. · There are more vulnerabilities in the OS. · Hopefully, with this lessons learned, most of them will be fixed proactively?
IOActive, Inc. Copyright ©2018. All Rights Reserved.

Thank You
josep.rodriguez@ioactive.com info@ioactive.com 87

