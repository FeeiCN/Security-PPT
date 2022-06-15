Hacking .NET Applications:
The Black Arts
Jon McCoy www.DigitalBodyGuard.com

THIS WILL COVER
  How-To Attack .NET Applications   Tools and Methodology of Attacking   Overcome "secure" .NET Applications   Building KeyGen/Crack/Hacks/Malware   Reverse Engenerring for Protection

Attacking/Cracking
IN MEM |||| ON DISK

ATTACK OVERVIEW
Attack on Disk
 Access Logic   Decompile   Infect Logic   Recompile   Hook Logic   Debug
Attack in Memory/Runtime
  Inject Structure   Navigate Structure   Edit/Control Structure

Attack The Source

In Memory

OR On Disk

Find the weak spot Subvert the Logic/State Control what you need

ATTACKING ON DISK

101 - DECOMPILERS
DEMO
GrayWolf ­ IL_Spy ­ Reflector

101 - ATTACK ON DISK
 Connect/Open - Access Code
 Decompile - Get code/tech  Infect - Change the target's code  Exploit - Take advantage
 Remold Application - WIN

101 - Recon

EHSHELL  .NET Framework
Ver 3.5

 Un-0bfu$ca7ed

Windows  Media Center



Crash Reporting Watson

 Coded in C#

101 - Recon
 File Location
C:\Windows\ehome\ehshell.dll
 StrongName KEY
d:\w7rtm.public.x86fre\internal\strongnamekeys\fake\windows.snk
 Registry CurrentUser OR LocalMachine
SOFTWARE\Microsoft\Windows\CurrentVersion\Media Center\
 Web Host Address
www.microsoft.com/WindowsMedia/Services/2003/10/10/movie

CRACK THE APP
Flip The Check Cut The Logic Return True Access Value Set Value is "True"

SET VALUE TO "TRUE"
bool Registered = ftraulsee;; IIff((aa!===bb) )

CUT THE LOGIC
bool IsRegistered() {
Return "TRUE" }

ACCESS VALUE
bool ValidPassword(int x) {
ShowKey(Pass); Return (x==Pass); }

CRACK
CRACK the weak Media Center

CRACK PASSWORD

CRACK
DEMO

CRACK THE KEY
Attack the STRONG
"I'm sure they protected the registration check"

CRACK THE KEY

Complex Math == Complex Math

Public/Private == Change Key

Challenge

== Make it EZ

3/B==Name*C == ASK what is /B?

Call Server

== Hack the Call

COMPLEX MATH
1. Chop up the Math 2. Attack the Weak 3. ??????????
4. Profit

CHANGE THE KEY
If you can beat them Why join them
Key = "123456ABCDE"

CHALLENGE
Complex Math
OR
Control the Challenge

REG CODE

Name: 5G*C9P3
JON DOE

Code:

=!==

98qf3uy

REG CODE
Name: *C

Code:

5G9P3

REG CODE

Name: 5G*C9P3
JON DOE

Code:

==

5G9P3

WIN

FAKE SERVER CALL
1. Seed the Request 2. Fake the Reply 3. Kill the Call

DEMO
CRACK A KEY

IL ­ Intermediate Language Code of the Matrix |||| NEW ASM

IT CAN'T BE THAT EZ
NO

PROTECTION ON DISK
 P rotection - Security by 0b$cur17y
  Code Obfuscation   Logic Obfuscation   Shells / Packers / Encrypted(code)   Unmanaged calls.............
SHUTDOWN Decompilation

PROTECTION ON DISK
0bfu$ca7ed

PROTECTION ON DISK
  Protection ­ Security by security
  Signed code (1028 bit CRYPTO)   Verify the creator  ACLs......... M$ stuff
This can SHUTDOWN Tampering

UNPROTECTED / PROTECTED

IT CAN`'TT BE THAT EZ
NNOO YES

NEW ATTACK VECTOR
SIGNED CODE HACKING
Signed code is based on   Private Key - 1028 bit   Signed Hash of Code   ...........
SIGNED CODE CHECKING IS OFF BY DEFAULT

FAKE SIGNED DLL

FAKE SIGN DLL/EXE

NEW ATTACK VECTOR
ASM THE OLD IS NEW
  Shell Code - ASM   UNmanaged
.   NO NET Security
  ...........
Attack from ASM(unmannaged) The Gate is Down

FAKE SIGNED DLL

Attacking / Cracking
In MEM |||| On Disk

ATTACKING .NET APPLICATIONS: AT RUNTIME

ATTACKING APPS
 G ain Full Access  R everse Engineer  A ttack (on Disk or in MEM)  T ake out the "Security"  C ontrol the Program

DEMO: GOD MODE
Inject and Control

PAST TALKS
Hacking .NET Application: A Runtime Attack
Control the Runtime Control the Application

IF YOU'RE NOT A HACKER WHY SHOULD YOU CARE?
Defend your Applications
Defend your Systems
Verify your Tools\Programs

VERIFY YOUR APPLICATIONS What is the Crypto & KEY What info is it sending home Does it have Backdoors? Is your data Secure?

REVERSE ENGINEERING
What is going on? What technology is used?
Any MaLWare? AM I safe?

REVERSE ENGINEERING
Hack your applications Don't be helpless

DON'T

LOOK

SECURITY
The Login security check is  Does A == B
 Does MD5%5 == X  Is the Pass the Crypto Key

DATA LEAK
The Data sent home is  Application Info
 User / Serial Number  Security / System Data

KEY
The Crypto Key is  A Hard Coded Key  The Licence Number  A MD5 Hash of the Pass  6Salt 6MD5 Hash of the Pass

CRYPTO
The Crypto is  DES 64
 Tripple DES 192  Rijndael AES 256  Home MIX (secure/unsecure)

BAD SOFTWARE

THE OLD IS NEW AGAIN
ASM-SHELLS
.  Pointers in NET
 What are they good for?
 Are they safe?
 What about the Runtime?
 So ASM-Shells....

Protection (Shell Crypto) Attack (Unmanaged Calls) Protection (Obfuscated Code) Fake (Signed DLL Protection)

  Intelligent names
  Code style
  Don't use loops
  Don't use one area for your Vars  Access the normal program

REUSE TARGET
  Link to Events
  Use Timers   Call back into your target   Spread out your Vars and code

 TD3Ms
 fDP3St
Pr oRtijendcatelMe! 2010 VfSdaI
 Salt Androsa0Fbi$lecPurro1te7cytor
 Good VI

Protect Me! 2010

Androsa FileProtector

PROTECTION FOR WHO?
Infect Obfuscated App
0bfu$ca73

WHAT M$ DID RIGHT
Un-obfuscated Code
Good for user security User can see what they are running
.NET Framework Security
Targeted Security Access Protect the Computer from the app
Giving Reduced Rights Inside Code
Put venerable code in a box Mitigate Risk, Segment Risk

WHAT M$ DID WRIRGOHNTG
MixModeCode ­ Bad for security
This allows unmanaged code This breaks out of .NET security
GAC & Native Image Override
Removes ability to secure code
Not Hash Checking Code
Good for hackers

ATTACKING APPS
 R ead my papers: Reflections Hidden Power &
Attacking .NET at Runtime
 W atch 2010 Presentations on Attacking .NET
DefCon 18, AppSec-DC, DojoCon
 L ook up Presentations and Research from
Andrew Willson, Erez Ezule, Arndet Mandent
 U se tools: Visual Studio/MonoDev Reflector/
GrayWolf/ILspy/.../ILASM/ILDASM

FIN

MORE INFORMATION @: www.DigitalBodyGuard.com
FIN = 1

HACKER VS ATTACKER

