REFERENCE THIS: SANDBOX EVASION
USING VBA REFERENCING

WHOAREWE

Amit Dori Security Researcher, Votiro

Aviv Grafi CEO, Votiro

· 28 years old from Tel-Aviv.
· BSC in Computer Science, BA in
Psychology from TAU.

· Graduate of Israeli Army's elite
8200 intelligence unit.
· Over 15 years of experience in
telecommunications and InfoSec.

· Formerly researched Exploit Kits at · Inventor of Votiro's enterprise

Check Point.

protection solutions.

· Skate, swim, guitar.

· BSC in Computer Science, BA in
economics, MBA from TAU.

· Sushi, running, quiet walks along
the beach.

HITB Amsterdam 2018: 11.4 ­ 14.4

ABSTRACT
Sandbox had become a standard security solution in organizations nowadays which makes it a prime target. This talk will demonstrate a new way to perform sandbox evasion.
In contrast to common evasion techniques, our technique doesn't require code execution to detect the sandbox environment.
HITB Amsterdam 2018: 11.4 ­ 14.4

ABSTRACT

Evasion

Detection

Sandbox Evasion techniques VBA Referencing

Sandbox-user Differences Server-Side Sandbox Detection

HITB Amsterdam 2018: 11.4 ­ 14.4

RELEVANT BACKGROUND

We assume familiarity with the following concepts:

1

2

VBA macros

Office Protected View

3
Sandbox solutions

4
Tracking pixels

HITB Amsterdam 2018: 11.4 ­ 14.4

SANDBOX EVASION
With the introduction of the sandbox, malware authors have introduced Sandbox Evasion. The term is used to describe all the techniques utilized to identify a sandbox, trick it, manipulate it and evade it.
HITB Amsterdam 2018: 11.4 ­ 14.4

SANDBOX EVASION TECHNIQUES
Detect the sandbox: detect virtualization Hypervisor, Virtualization DLLs, Side channels, unusual hardware Detect the sandbox: Artificial Environment Username, Cookies and browser history, recent file count, screen resolution, Old vulnerabilities, Running processes
HITB Amsterdam 2018: 11.4 ­ 14.4

SANDBOX EVASION
HITB Amsterdam 2018: 11.4 ­ 14.4

SANDBOX EVASION TECHNIQUES
Evade the sandbox: Defeat the Monitor Remove hooks, work around hooks, delay execution Evade the sandbox: Context Aware Require user interaction, check date and time-zone, encrypted payload
HITB Amsterdam 2018: 11.4 ­ 14.4

SANDBOX EVASION
All of the mentioned techniques, require code execution (sandbox-side) in order to collect the data and analyze it. As a result, most of these techniques can be identified by static analysis tools which will flag the file as suspicious prior to execution. Furthermore, the actions executed to fingerprint the system are flagged as evasion techniques - which immediately raise a warning flag.
HITB Amsterdam 2018: 11.4 ­ 14.4

VBA REFERENCING

WHAT IS VBA REFERENCING?
In order to truly understand the capabilities of VBA macros, one must dive into the macros bible: MS-OVBA document.
[MS-OVBA]: Office VBA File Format Structure Intellectual Property Rights Notice for Open Specifications Documentation Technical Documentation. Microsoft publishes Open Specifications documentation for protocols, file formats, languages, standards as well as overviews of the interaction among each of these technologies.
HITB Amsterdam 2018: 11.4 ­ 14.4

MS-OVBA
The MS-OVBA, Office VBA File Format Structure, specifies the Office VBA File Format Structure, AKA vbaProject.bin. MS-OVBA specifies the structure of this binary and all of its features and attributes.
HITB Amsterdam 2018: 11.4 ­ 14.4

WE'RE NOT THE FIRST TO HUNT HERE
In "Analysis of the attack surface of Microsoft Office from user perspective" by Mr.Haifei Li, a RCE flaw in the VBA engine is shown. It appears that VBA engine accepts a path to a remote .tlb file, which will be fetched and loaded into Word upon execution.
HITB Amsterdam 2018: 11.4 ­ 14.4

VBA REFERENCES
Another previously unexplored section of the MS-OVBA document is of PROJECTREFERENCES, which allows a VBA project to fetch and execute VBA macros, found in a remote project.
2.3.4.2.2. PROJECTREFERENCES Records Specifies the external REFERENCES of the VBA project as a variably sized array of reference (section 2.3.4.2.2.1). The termination of the array is indicated by the beginning of PROJECTMODULES (section 2.3.4.2.3), with is indicated by a REFERENCE (section 2.3.4.2.2.1) being followed by an unsigned 16-bit integer with a value of 0x000F.
HITB Amsterdam 2018: 11.4 ­ 14.4

VBA REFERENCES

0000002 003

A7

0

Array of bytes ­ LibidAbsolute

*\cc:\Example Path\ExampleReferenceProject.xls

It appears as if one can provide an absolute(or relative) path to an Office file and use its VBA project.

HITB Amsterdam 2018: 11.4 ­ 14.4

LET'S EXPLORE!

VBA REFERENCING TRIALS
HITB Amsterdam 2018: 11.4 ­ 14.4

VBA REFERENCING TRIALS
HITB Amsterdam 2018: 11.4 ­ 14.4

VBA REFERENCING TRIALS
HITB Amsterdam 2018: 11.4 ­ 14.4

VBA REFERENCING DEMO
HITB Amsterdam 2018: 11.4 ­ 14.4

VBA REFERENCING DEMO
HITB Amsterdam 2018: 11.4 ­ 14.4

VBA REFERENCING DEMO
It seems that VBA REFERENCING works, and is most silent in Excel.
HITB Amsterdam 2018: 11.4 ­ 14.4

CRAFTING AN ATTACK

STACKING IT UP
So, VBA projects can fetch code from remote VBA projects. An attacker can create a document which will fetch a VBA project from his server. Wouldn't it be very cool if we (as attackers) could identify the environment issuing the requests and respond accordingly?
HITB Amsterdam 2018: 11.4 ­ 14.4

SANDBOX AS A BOTTLENECK
In order to prevent this, a sandbox must be AUTOMATIC the process happens without interaction from users/admins FAST the sandbox uses a time limit alongside further optimizations. SECURE-LESS most security mitigations are disabled.
HITB Amsterdam 2018: 11.4 ­ 14.4

STACKING IT UP

So when a user opens a document with VBA referencing:

Document Open

Disable Protected
View

VBA Engine Load

VBA Referencing
occurs

Sandbox have disabled Protected View in advance, so it looks like:

Document Open

Disable Protected
View

VBA Engine Load

VBA Referencing
occurs

HITB Amsterdam 2018: 11.4 ­ 14.4

STACKING IT UP
Protected View blocks macro execution until disabled. In fact, it disables the VBA engine as a whole. However, Protected View is not just for code! It tackles various other objects from being loaded!
HITB Amsterdam 2018: 11.4 ­ 14.4

WHAT IS EXTERNAL CONTENT, AND WHY ARE WEB BEACONS A POTENTIAL THEREAT?

External content is any content that is linked from the Internet or an intranet to a workbook or presentation. Some examples of external content are images, linked media, data connections, and templates.
Hackers can use external content as Web beacons. Web beacons send back, or beacon, information from your computer to the server that hosts the external content. Types of Web beacons include the following: Images - A hacker sends a workbook or presentation for you to review that contains images. When you open the file, the image is downloaded and information about the file is beaconed back to the external server. Images in Outlook e-mail massages Microsoft Office has its own mechanism for blocking external content in messages. This helps to protect against Web beacons that could others capture your email address. For
HITB Amsterdam 2018: 11.4 ­ 14.4

more information, see Block or unbleock automatic picture downloads in email messages.
Linked media - A hacker sends you a presentation as an attachment in an email message. The presentation contains a media object, such as a sound, that is linked to an external server. When you open the presentation in Microsoft PowerPoint, the media object is played and in turn executes code that runs a malicious script that harms your computer.
Data connections - A hacker creates a workbook and sends it to you as an attachment in an email message. The workbook contains code that pulls data from or pushes data to a database. The hacker does not have permissions to the database, but you do. As a result, when you open the workbook in Microsoft Excel, the code executes and accesses the database by using your credentials. Data can be accessed or changed without your knowledge or consent.

STACKING IT UP
In order to provide protection to the user, Protected View loads objects in a specific order. Considering Protected View is enabled, it will first load all non-executable objects (external content for example): Only then it will prompt for the VBA engine and other executables:
HITB Amsterdam 2018: 11.4 ­ 14.4

STACKING IT UP
This is in complete contrast to what happens when Protected View is disabled. First, the VBA engine would load causing VBA referencing. Then, the rest of the document's content would load.
HITB Amsterdam 2018: 11.4 ­ 14.4

SERVER-SIDE SANDBOX DETECTION
We plan on using this difference to detect the sandbox on the attacker's side. We chose to use a linked image, a sort of tracking pixel, which will serve as a "baseline".
HITB Amsterdam 2018: 11.4 ­ 14.4

SERVER-SIDE SANDBOX DETECTION

With the addition of the tracking pixel, our detection scheme is done.

When a sandbox is used, Protected View is disabled:
Document Open
VBA Engine load
VBA Referencing
Load Image
HITB Amsterdam 2018: 11.4 ­ 14.4

When a user opens the document, Protected View is enabled:

= Protected View

Document Open

Load Image

User Clicks Enable Content

VBA Engine load

VBA Referencing

User Clicks Enable Editing

SERVER-SIDE SANDBOX DETECTION
function detect(requests): if requests[VBA code] is before requests[image]:
return sandbox else if requests[image] is before requests[VBA code]:
return user
HITB Amsterdam 2018: 11.4 ­ 14.4

WEAPONIZING
function respond(verdict): if verdict is sandbox:
return benign VBA project else if verdict is user:
return malicious VBA project
HITB Amsterdam 2018: 11.4 ­ 14.4

SANDBOX FLOW
Looking at this from a sandbox's point-of-view:

1. Document Open

2. VBA Referencing 3. Attacker's Response 4. Load Image 5. Attacker's Response

HITB Amsterdam 2018: 11.4 ­ 14.4

ATTACKER'S SERVER

VBA Referencing Request before or after Image request?

?

USER FLOW
Looking at this from a user's point-of-view:

1. Document Open

2. User Clicks Enable Editing

ATTACKER'S SERVER

VBA Referencing Request before or after Image request?

?

3. Load Image
4. Attacker's Response
5. User Clicks Enable Content

VBA Referencing

HITB Amsterdam 2018: 11.4 ­ 14.4

DEMO?
HITB Amsterdam 2018: 11.4 ­ 14.4

VIDEO
HITB Amsterdam 2018: 11.4 ­ 14.4

COMMERCIAL SANDBOX SOLUTIONS
We've tested 7 leading sandboxes against our evasion. · All were evaded successfully · Some block SMB on the sandbox... even better! · Others didn't consider to inspect what came inbound on SMB · There's more to test.. Consider PDF JavaScript referencing
HITB Amsterdam 2018: 11.4 ­ 14.4

MITIGATIONS
· Block FTP / SMB inbound/outbound traffic on user
*Don't block FTP/SMB traffic in your sandbox, as you'll miss a lot of action
· Rethink your sandbox solution architecture design, might need to consider fundamental changes
· Consider restricting Internet access to Office products
· CDR - Content disarm and reconstruction
HITB Amsterdam 2018: 11.4 ­ 14.4

SUMMARY
· Sandbox has to dismiss Protected View to avoid becoming a bottleneck.
· VBA referencing enables us to fetch code from remote machines. · combining these together we can take advantage of sandbox
optimizations and VBA features to achieve sandbox detection and evasion. · The whole process is using legitimate features of a sandbox and VBA. We didn't break anything.
HITB Amsterdam 2018: 11.4 ­ 14.4

SUMMARY
· Identifying key differences between user and sandbox behavior enables server-side sandbox detection
· By utilizing code referencing alongside such detection, one can achieve sandbox evasion
· Since sandboxes are trusted with high confidence, a successful sandbox evasion usually means user infection
HITB Amsterdam 2018: 11.4 ­ 14.4

QUESTIONS?
HITB Amsterdam 2018: 11.4 ­ 14.4

THANK YOU!

Amit Dori

Aviv Grafi

@_AmitDori_

@avivgrafi

Amit.Dori@votiro.com

HITB Amsterdam 2018: 11.4 ­ 14.4

