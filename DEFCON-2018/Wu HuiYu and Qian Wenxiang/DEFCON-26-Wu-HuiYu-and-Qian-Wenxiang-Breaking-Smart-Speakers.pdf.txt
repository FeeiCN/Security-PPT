About Us
· Li Yuxiang @Xbalien29
Security researcher, found several vulnerabilities in Android, Former ROIS CTF team member, speaker of HITB 2018 AMS.
· Qian Wenxiang @leonwxqian
Security Researcher, Top 100 of MSRC list ( 2016 & 2017 ), Author of "WhiteHat to talk about web browser security ".
· Wu Huiyu @DroidSec_cn Security Researcher, Bug Hunter, GeekPwn 2015 Winner, Speaker of HITB 2018 AMS and POC 2017.
Acknowledgement
@Gmxp, Team Leader of Tencent Blade Team. @Lake2, Founder of Tencent Security Response Center.

Tencent Blade Team
· Founded By Tencent Security Platform Department. · Focus on security research of AI, IoT, Mobile devices. · Found 70+ security vulnerabilities (Google, Apple). · Contact us: https://blade.tencent.com

Agenda
· Introduction to Smart Speaker · Attack Surface · Remote Attack Xiaomi AI speaker · Breaking Amazon Echo · Conclusion

Introduction to Smart Speaker

About Amazon Echo

About Xiaomi AI Speaker

Attack Surface

Cloud Server

Communication Protocol

Smart Speaker

Mobile App

Remote Attack Xiaomi AI Speaker
· A Brief Look At Xiaomi AI Speaker · MIIO Ubus Command Execution · Messageagent Command Execution · Remote Exploit · Demo

A Brief Look At Xiaomi AI Speaker
· Base on OpenWrt 15.05.1
· SSH Disabled
· Firmware Verification based on RSA
· Ports:
­ UDP 54321 MIIO ­ TCP 9999 UPNP ­ UDP 53 DNS

MIIO Protocol

MIIO Ubus Command Execution
· Get MIIO protocol AES secret key (token)
- Use a unauthorized unbind vulnerability to remote reset MI AI speaker
- Bind MI AI Speaker to attacker's account, extract token from MI Home App's database (/data/data/com.xiaomi.smarthome/databases/miio2.db)

MIIO Ubus Command Execution
· Connect Speaker in LAN
· Disable dropbear password auth · Start dropbear to open ssh

MIIO Ubus Command Execution

Messageagent

Messageagent Command Execution
· Parser and execute ubus command
· Parser and execute system command

Remote Exploit

Demo

Breaking Amazon Echo
· A Brief Look At Amazon Echo · Soldering & Desoldering Tools · Flash Dump · Root Amazon Echo by Modify Firmware · Exploit Amazon Echo · Demo

A Brief Look At Amazon Echo

MTK 8163 CPU
Mircon / Samsung 4GB EMCP BGA221

· Fire OS v5.5 (Based On Android 5.1)
· SELinux & ASLR enabled
· Bootloader Locked
· Ports: TCP 55442 HTTP Server TCP 55443 HTTPS Server UDP 55444 Time Sync UDP 55445 Device Sync

Soldering & Desoldering Tools

Hot Air Gun

Soldering Iron

Solder Wire

Solder Paste

Solder Wick

Amtech Tacky Flux

Reballing Tool

Desoldering Demo

Flash Dump
BGA211 EMCP Adapter + EMCP USB Reader

Flash Dump
Preloader Bootloader .......... Boot image /system /data /sdcard

Root Amazon Echo by Modify Firmware
Modify /system/etc/init.fosflags.sh

Soldering Demo

Root Amazon Echo by Modify Firmware

Exploiting Amazon Echo: On Basis of Software

3 Steps to Eavesdropping the Target

3 Big Problems Need to Be Solved

1

2

3

Vulnerable Program

An Attacker is Always Happy to See There's a Web Server Available

Whole Home Audio Daemon (whad)
 root

 Able to record voice  Network access

 Web server

Protocol TCP TCP UDP UDP

Port 55442 55443 55444 55445

Purpose HTTP Server (audio cache) HTTPS Server w/authentication (device control) Time Sync. Device Sync.

Client-authenticated TLS Handshake
· We need Server Certificate, Client Certificate and Private Key. · Get them from libcurl's negotiate function. · Solution: Extract information from physically hacked device.
This one!

Bind the Hacked Device into Victim's Account First

Web Service Auditing
· XSSes we've found are hard to use, but it is fatal. · Session based, some actions need re-login. · Lack of modern protections.

Use Several Redirects to Mimic an XSS
· Alexa OpenID login redirect to any domain fits https://*.amazon.com .
· assoc-redirect.amazon.com will redirect to an Amazon site amazon.cn, amazon.co.uk ...
· Validate rule: http(s)://*.amazon.com*.*/ (We guess).
· We need a downgrade: http://subdomain.amazon.com .

Restrictions
· Find an Amazon domain resolves to LAN address. · Attacker can be joined into the LAN with that IP address.

Steal Cookies with the Redirect
· aapsservice.amazon.com, A Record(DNS A) resolves to a local address 10.189.XX.XX.
· Attacker joins the LAN with IP statically set to 10.189.XX.XX, and web server enabled. aapsservice resolves to attacker in that LAN.

2 Big Problems Need to Be Solved

DEAL WITH IT

2

3

Vulnerable Program

· When user login, we can get the cookies. · Bind our device. · We can communicate with other devices of victim.

Extract Certificates and Private Keys From libcurl's Negotiate Function

The Cloud Synchronize of Device Info
Device info obtained from Amazon when whad starts.

Patching Whad
· Whad HTTPS "ping" other devices periodically. · Patch whad (of physically rooted device). · Dump the certs and private keys we need! · Benefit: No need to crack the complex algorithm. · Simple and violent, but it works.

Get the Keys to Pwn
· Disable ASLR, SELinux of physically hacked device · Dump Server Certificate, Client Certificate from the variant
which outputs adb log.
· Dump Private Key from negotiate function too, with a call to PEM_write_PrivateKey() .

1 Big Problem Needs to Be Solved

DEAL WITH IT

DEAL WITH IT

3

Vulnerable Program

· Every time before we would attack, we run patched whad to get the certs & key.
· "Firewall" of client authentication is broken.

Binary Auditing
· Amazon's own code is secured by design. · Echo's using very old version of the 3rd party libraries.
· N days & 0 day.

Attack the Web Server, to Finally Get Control of Whad

The Web Server -- libcivetweb
· The code is written 4 years ago.
· A failed condition check caused almost every type of vulnerabilities in sequence in getParam().
· Nobody calls the vulnerable function until an update...

A Bad Move Leads to Chain Reaction

bool CivetServer::getParam(struct mg_connection *conn,
const char *name, std::string &dst, size_t occurrence) { ......

CVE-2018-12686 Fixed in June, 2018

...... }

Overflow the dlmalloc(0)
· dlmalloc(0) is valid. 16 bytes (8B metadata + 8B user data)
· mg_read() fix the input length ( uint -1 ): int write_size = min(0xfffffff, actual length);
· POST data written into buffer. · length of input > 8 bytes Heap buffer overflow

Shape the heap
· Shape the heap by sending HTTPS request. · malloc() controlled by user.
· Sending or omitting \r\n\r\n to control the connection.

Bypass ASLR to Continue Our Attack

Heap spray
· Large heap allocation mmaped anonymous memory. · Memory lays in a predictable range (even ASLR is enabled). · In our case, which is 0xf15f1008 (empirical value). · Heap spray and put our shellcode into this address.

Leak Addresses of Other Libraries
· Information leak via network? · CVE-2017-1000254 of libcurl in FTP connection is exploitable. · To reproduce the vulnerability
we need a FTP connection reuse.
Echo disabled many dangerous libcurl functions

Trigger the Hidden Code Path
· Playlist download Connection reuse! · Accept only HTTP/HTTPS 302 Redirect to FTP. · FTP 404 Prevent from caching.
· Command downloadAudio with extension .pls, libcurl visits FTP server twice Address leaked!

Leaking the Address
· Payload length = 103 leak an function address by luck (~80%). · Calculate libcurl's base loading address. · Calculate other libraries' addresses based on leaked address.

Code Execution
· Overwrite the function pointer in SSL context object · Webserver responding SSL_write · Fastest way to trigger: malformed HTTP version header.
· Not safe if you compile this code on Windows, did you see that? 

Attacking Primitives
· Restart the whad · Information leak · Heap maintaining · Heap freeing · Fast SSL_write call · Create any size of heap
· Use different types of connection to obtain ideal heap layout.
· Combine them to get an RCE.

Time to PWN

Entrust The Hack to Time
· Challenge: disturb from background threads. · ~40% for a testing gadget (4 Bytes)
· Real life gadget is 24 bytes, success rate down to ~8%. · But whad is respawned after crash automatically. · The only thing we need is time  (avg. 30 min per success).

The Shellcode
· Almost same system version on every Echo device
->We don't need to adapt for many versions
· fork() to prevent crash
· Handlers for SIGSEGV/SIGABRT
· Send the data via TCP to attacker

Deal with It

DEAL WITH IT whad

· Whad is now turning into a eavesdropping program.
· It's eavesdropping silently and it's sending every voice data to the attacker.

Demo Video

Updates
· Reported to Xiaomi in April, fixed in May, received $25,000 USD bonus.
"Thanks to the Tencent Blade Team for the support of Xiaomi's product
safety. All reported vulnerabilities have been fixed to ensure maximum
user security."
· Reported to Amazon in May, fixed in July.
"Amazon would like to thank the Tencent Blade Team for working with us
on resolving this issue. Customer trust is important to us and we take security seriously. Customers do not need to take any action as their
devices have been automatically updated with security fixes."

Conclusion
· Exploit Source Code:
­ We will update full exploit code to Github in the future: https://github.com/tencentbladeteam
· Hack tips:
­ Get the firmware first. ­ It's good to master all kinds of soldering and firmware extraction
methods. ­ Web Vulnerabilities + Binary Vulnerabilities Remote Exploit. ­ Be patient.

Thank You

https://blade.tencent.com Contact us

https://security.tencent.com Our Bug Bounty Program

Q & A

https://blade.tencent.com Contact us

https://security.tencent.com Our Bug Bounty Program

Reference
https://en.wikipedia.org/wiki/Transport_Layer_Security#Clientauthenticated_TLS_handshake https://github.com/civetweb/civetweb http://www.openwall.com/lists/oss-security/2018/02/27/5 https://github.com/aholstenson/miio https://twitter.com/fjeronimo/status/975781623127068674 https://github.com/jhautry/echo-dot

