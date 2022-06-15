Hacking .NET Applications:
The Black Arts
Jon McCoy www.DigitalBodyGuard.com

BACKGROUND
Why .NET Countermeasures Skill Level Needed Will this work on every .NET application

THIS WILL COVER
How-To Attack .NET Applications Tools and Methodology of Attacking Overcome "secure" .NET Applications Building KeyGen/Crack/Hacks/Malware Reverse Engenerring for Protection

Attacking/Cracking
IN MEM ||| ON DISK

ATTACK OVERVIEW

Attack on Disk
Access Logic Infect Logic Hook Logic

Decompile Recompile Debug

Attack in Memory/Runtime
Inject Target App Navigate Structure Edit/Control Structure

Attack The Source

In Memory

OR On Disk

Do your Reconnaissance Find the weak spot
Subvert the Logic/State Control what you need

ATTACKING ON DISK

101 - DECOMPILERS
DEMO
GrayWolf ­ IL_Spy ­ Reflector

101 - ATTACK ON DISK
Connect/Open - Access Code
Decompile - Get code/tech Infect - Change the target's code Exploit - Take advantage
Remold Application - WIN

THE WEAK SPOTS
Flip The Check Set Value is "True" Cut The Logic Return True Access Value

SETFLVIPALTUHEETCOHE"TCRKUE"
bool Registered = ftraulsee;; IIff((aa!===bb))

RETURN TRUE
bool IsRegistered() {
Return "TRUE"; }

RETURN TRUE
bool IsValidKey(string x) {
Return "TRUE"; }

CUT THE LOGIC
string sqlClean(string x) {
Return x; }

ACCESS VALUE
bool ValidPassword(int x) {
ShowKey(Pass); Return (x==Pass); }

ATTACK SECURITY
Microsoft Media Center

CRACK PASSWORD

CRACK

Return True;

PASSWORD

CRACK
DEMO

REGISTRATION CHECK
KeyGens Cracks

CRACK THE KEY

Public/Private == Change Key

3/B==Name*ID*7 == ASK what is /B?

Call Server

== Hack the Call

Demo = True; == Set Value

Complex Math == Complex Math 1% of the time the KeyGen is given

PUBLIC/PRIVATE KEY
If you can beat them Why join them
Key = "F5PA11JS32DA" Key = "123456ABCDE"

SERVER CALL

1. Fake the Call

"Send" SystemID = 123456789

2. Fake the Request

3. Fake the Reply Reg Code = f3V541

4. Win
*Registered = True*

REG CODE REPLAY

Name: 5G*C9P3
JON DOE

Code: 98qf3uy

=!==
FAIL

REG CODE REPLAY
Name: *C

Code:

5G9P3

REG CODE REPLAY

Name: 5G*C9P3
JON DOE

Code:

==

5G9P3

WIN

COMPLEX MATH
1. Chop up the Math 2. Attack the Weak 3. ??????????
4. Profit

DEMO
CRACK A KEY

IL ­ Intermediate Language Code of the Matrix |||| NEW ASM

IT CAN'T BE THAT EZ
NO

PROTECTION ON DISK
Protection - Security by 0b$cur17y
Code Obfuscation Logic Obfuscation Shells / Packers / Encrypted(code) Unmanaged calls.............
Try to SHUTDOWN Decompilation

PROTECTION ON DISK
0bfu$ca7ed

PROTECTION ON DISK
Protection ­ Security by security
Signed code (1024 bit CRYPTO) Verify the creator Strong Names ACLs......... M$ stuff
Try to SHUTDOWN
Tampering

STRONG NAME

StrongName: EXESample, Version=1.0.4203.24068, Culture=neutral, PublicKeyToken=2a79b79e3c411f38

Simple Name Version Culture Public Key Token

Example Strong Name:
EXESample, Version=1.0.4203.24068, Culture=neutral, PublicKeyToken=2a79b79e3c411f38
Most of the time PublicKeyToken=null

PRIVET KEY SIGNING
Signed code is based on Private Key - 1024 bit Signed Hash of Code ...........
Identify and Verify the Author

UNPROTECTED / PROTECTED

IT CAN`'TT BE THAT EZ
NNOO YES

ATTACK VECTOR
PRIVET KEY SIGNING
Signed code is based on Private Key - 1024 bit Signed Hash of Code ...........
SIGNED CODE CHECKING IS OFF BY DEFAULT

STRONG NAME HACKING
PublicKeyToken= b77a5c561934e089
PublicKeyToken= 683127632be2c302

STRONG NAME HACKING

FAKE SIGNED DLL

FAKE SIGNED DLL
Turn Key Checking ON
[HKEY_LOCAL_MACHINE \SOFTWARE\Microsoft\.NETFramework] "AllowStrongNameBypass"=dword:00000000

FAKE SIGNED DLL ERROR

FAKE SIGNED EXE

FAKE SIGN DLL/EXE

ATTACK VECTOR
GLOBAL ASSEMBLY CASH --THE GAC--
What is the GAC?
How to access the GAC?
Attacking from the GAC?

GLOBAL ASSEMBLY CASH
C:\Windows\assembly\

GLOBAL ASSEMBLY CASH
C:\Windows\assembly\

GLOBAL ASSEMBLY CASH GAC
\GAC ­ Installed/Sandbox \GAC_32 ­ 32bit-(x86) \GAC_64 ­ 64bit-(x64) \GAC_MSIL ­ MSIL(ANY)

NATIVE IMAGE(NI)

GAC VER 1.1 - is dead 

VER 3.0 - is dead 

VER 2.0 & 3.5 \NativeImages_v2.0.50727_32

\NativeImages_v2.0.50727_64

VER 4.0 \NativeImages_v4.0.30319_32

\NativeImages_v4.0.30319_64

GAC
So much GAC!!!!!!!!!!!!!!!!!!!
C:\Windows\assembly\ C:\Windows\winsxs\ C:\Windows\Microsoft.NET

ATTACK THE GAC

ATTACK FROM THE GAC

ATTACK FROM THE GAC
NativeImages GAC

ATTACK THE GAC
1. Delete the Native Image 2. Replace File in GAC 3. Hack Target from GAC

ATTACK FROM THE GAC

ATTACK FROM FRAMEWORK
.NET Framework

ATTACK VECTOR
ASM THE OLD IS NEW
Shell Code - ASM UNmanaged
. NO NET Security
...........
Exicute ASM Attack with Unmanaged Calls or Reflection

FAKE SIGNED DLL

THE OLD IS NEW AGAIN
ASM-SHELLS
The Power of ASM
Attack from a lower level Brake the "safe" security Attack the Runtime
ASM-Shells....  shells...

VISUAL STUDIO
Exploit ­ Run arbitrary code

First noted in 2004
Demo PowerShell - Matrix

Get developer Keys

Attack the SVN & DB

Virus

Malware

Attacking/Cracking
IN MEM |||| ON DISK

ATTACKING .NET APPLICATIONS: AT RUNTIME

WHY AT RUNTIME
SECURITY SYSTEMS
Hacks Cracks Malware Backdoors

Inject at Runtime
.NET C++ GrayDragon DLL DLL

Inject At Runtime

Inject At Runtime

ATTACKING APPS
Gain Full Access Reverse Engineer Attack (in MEM) Take out the "Security" Control the Program

PAST TALKS
Hacking .NET Application: A Runtime Attack
Control the Runtime Control the Application

DEMO: GOD MODE
Inject and Control

SO YOU'RE NOT A HACKER WHY SHOULD YOU CARE?
Defend your Applications
Defend your Systems
Verify your Tools\Programs

VERIFY YOUR APPLICATIONS What is the Crypto & KEY What info is it sending home Does it have Backdoors? Is your data Secure?

REVERSE ENGINEERING What is going on?
What technology is used? What is the security? Any MaLWare? Threat Level?

LOOK INSIDE
Take Control Don't be helpless Know you Threats

DON'T
Keys Crypto
DB BackDoors MalWare Good Code

LOOK
Passwords Technology Weak Spots Data Leaks
Reg Code Bad Code

SECURITY
The Login security check is Does A == B
Does MD5%5 == X Is the Pass the Crypto Key

DATA LEAK
The Data sent home is Application Info
User / Registartion Info Security / System Info

KEY
The Crypto Key is A Hard Coded Key The Licence Number A MD5 Hash of the Pass 6Salt 6MD5 Hash of the Pass

CRYPTO
The Crypto is DES 64
Tripple DES 192 Rijndael AES 256 Home MIX (secure/unsecure)

So your malware How do you hide

Protection (Shell Crypto) Attack (Unmanaged Calls) Protection (Obfuscated Code) Fake (Signed DLL Protection)

Intelligent names
Code style
Don't use loops
Don't use one area for your Vars
Access the normal program

REUSE The TARGET
Call back into your target
Use Timers Link to Events
Spread out your Vars and Code

Protect Me! 2010 Androsa FileProtector

Protect Me! 2010

Androsa FileProtector

Password SHA512
Custom Crypto LIB's
ProteGSacolott d&MCVreyI!pAt2on0d1ro0Psoa0ssbFib$ilelceBuParcrok1tDe7ocoytror
Encrypted Pass B

DEMO

PROTECTION FOR WHO?
In0febct fOubfu$sccatead 7Ap3p

WHAT M$ DID RIGHT
Un-obfuscated Code
 Good for user security  User can see what they are running
.NET Framework Security
 Targeted Security Access  Protect the Computer from the app
Giving Reduced Rights Inside Code
 Put venerable code in a box  Mitigate & Segment Risk

WHAT M$ DID WRIRGOHNTG
MixModeCode ­ Bad for security
 This allows ASM\C++\C code  This breaks out of .NET security
GAC & Native Image Override
 Removes ability to secure code
Not Hash Checking Code
 Good for hackers

ATTACKING APPS
Read my papers: Reflections Hidden Power & Attacking .NET at Runtime
Watch 2010 Presentations on Attacking .NET DefCon 18, AppSec-DC, DojoCon
Look up Presentations and Research from Andrew Willson, Erez Ezule, Arndet Mandent
Use tools: Visual Studio/MonoDev
Reflector/GrayWolf/ILspy/.../ILASM/ILDASM

FIN

MORE INFORMATION @: www.DigitalBodyGuard.com
FIN = 1

HACKER VS ATTACKER

101 - Recon
File Location
C:\Windows\ehome\ehshell.dll
StrongName KEY
d:\w7rtm.public.x86fre\internal\strongnamekeys\fake\windows.snk
Registry CurrentUser OR LocalMachine
SOFTWARE\Microsoft\Windows\CurrentVersion\Media Center\
Web Host Address
www.microsoft.com/WindowsMedia/Services/2003/10/10/movie

101 - Recon

EHSHELL

.NET Framework Ver 3.5
Un-0bfu$ca7ed

Windows Media Center

Crash Reporting Watson

Coded in C#

