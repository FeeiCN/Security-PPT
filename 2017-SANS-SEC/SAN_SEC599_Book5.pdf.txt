SECS99 I DEFEATING ADVANCED ADVERSARIES
599.5
Exfiltration, Cyber Deception, and
Incident Response
THE MOST TRUSTED SOURCE FOR INFORMATION SECURITY TRAINING, CERTIFICATION, AND RESEARCH I sans.org

Copyright © 2017 , Erik Van Buggenhout & Stephen Sims. All rights reserved to
Erik Van Buggenhout & Stephen Sims and/or SANS Institute.
PLEASE READ THE TERMS AND CONDITIONS OF THIS COURSEWARE LICENSE AGREEMENT ("CLA") CAREFULLY BEFORE USING ANY OF THE COURSEWARE ASSOCIATED WITH THE SANS COURSE . THIS IS A LEGAL AND ENFORCEABLE CONTRACT BETWEEN YOU (THE "USER'') AND THE SANS INSTITUTE FOR THE COURSEWARE. YOU
AGREE THAT THIS AGREEMENT 1S ENFORCEABLE LIKE ANY WRITTEN NEGOTIATED
AGREEMENT SIGNED BY YOU.
With the CLA, the SANS Institute hereby grants User a personal , non-exclusive license to use the Courseware subject to the terms of this agreement. Courseware includes all printed materials, including course books and lab workbooks, as well as any digital or other media, virtual machines, and/or data sets distributed by the SANS Institute to the User for use in the SANS class associated with the Courseware. User agrees that the CLA is the complete and exclusive statement of agreement between The SANS Institute and you and that this CLA supersedes any oral or written proposal. agreement or other communication relating to the subject matter of this CLA.
BY ACCEPTING THIS COURSEWARE, YOU AGREE TO BE BOUND BY THE TERMS OF THIS
CLA. BY ACCEPTING THIS SOFTWARE, YOU AGREE THAT ANY BREACH OF THE TERMS OF THIS CLA MAY CAUSE IRREPARABLE HARM AND SIGNIFICANT INJURY TO THE SANS INSTITUTE, AND THAT THE SANS INSTITUTE MAY ENFORCE THESE PROVISIONS BY INJUNCTION (WITHOUT THE NECESSITY OF POSTING BOND), SPECIFIC PERFORMANCE, OR OTHER EQUITABLE RELIEF.
If you do not agree, you may return the Courseware to the SANS Institute for a full refund , if applicable.
User may not copy, reproduce re-publish , distribute, display, modify or create derivative works based upon all or any portion of the Courseware, in any medium whether printed , electronic or otherwise, for any purpose, without the express prior written consent of the SANS Institute. Additionally, User may not sell, rent, lease, trade, or otherwise transfer the Courseware in any way, shape, or form without the express written consent of the SANS Institute.
If any provision of this CLA is declared unenforceable in any jurisdiction , then such provision shall
be deemed to be severable from this CLA and shall not affect the remainder thereof. An
amendment or addendum to this CLA may accompany this courseware.
SANS acknowledges that any and all software and/or tools, graphics, images, tables, charts or graphs presented in this courseware are the sole property of their respective trademark/registered/copyright owners, including:
AirDrop, AirPort, AirPort Time Capsule, Apple, Apple Remote Desktop, Apple TV, App Nap, Back to My Mac, Boot Camp, Cocoa, FaceTime, FileVault, Finder, FireWire, FireWire logo, iCal, iChat, ilife, iMac, iMessage, iPad, iPad Air, iPad Mini, iPhone, iPhoto, iPod iPod classic, iPod shuffle iPod nano, iPod touch, iTunes, iTunes logo, iWork, Keychain, Keynote, Mac, Mac Logo, MacBook, MacBook Air, MacBook Pro, Macintosh , Mac OS, Mac Pro, Numbers, OS X , Pages, Passbook, Retina , Safari , Siri, Spaces, Spotlight, There's an app for that, Time Capsule Time Machine, Touch ID, Xcode , Xserve, App Store, and iCloud are registered trademarks of Apple Inc.
Governing Law: This Agreement shall be governed by the laws of the State of Maryland USA.
SEC599_ 5_C01_03

SEC599.5

Defeating Advanced Adversaries

Exfiltration, Cyber
SANS Deception, and Incident
Response

© 2017 Erik Van B11ggenhout & Stephen Sims I All Ri~ts Reserved I Version CO I_03

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
Day 1: Knowing the adversary, knowing yourself · Day 2: Averting Payload Delivery Day 3: Preventing Exploitation Day 4: Avoiding Installation, foiling Command &Control & thwarting lateral movement Day 5: ExfiltTation, Cyber Deception & Incident Response · Day 6: APT Defender Capstone

SEC599.5
Data .exfiltration Typical data exflltration strategies Exercise: Detectlng data exflttration using Sllricat.1
Cyber deception strategies Tricking the adversary Exercise: Making your honeypot irresistibly sweet
Leveraging threat intelligence Defining threat inteOigence Exercise: Leveraging threat intelligence with MISP & Loki
Patrolling your network Proactive threat hunting strategies Exercise: Hunong your environment using OSQuery / ELK
Incident response Incident response process
Exerci&e: Responding to an incident using GRR

This page intentionally lelt blank.

2

© 2017 Erik Van Buggenhout & Stephen Sims

TABLE OF CONTENTS
Data exfiltrat.ion Typical data exfiltration strategies EXERCISE: Detecting data exfiltration using Suricata
Cyber deception strategies Tricking the adversary EXERC I SE: Making your honeypot irresistibly sweet
Leveraging threat intelligence Defining threat intelligence EXERCISE;Leveraging threat intelligence with MISP & Loki
Patrolling your network Proactive threat hunting strategies EXERC ISE: Hunting your environment using OSQuery & ELK
SAN~
Thi page intentionally left blank.

-06 06 40 43 46 70 73 74 107 109 110 132

© 2017 Erik Van Buggenhout & Stephen Sims

3

TABLE OF CONTENTS
Incident response Incident response process EXERCISE: Responding to an incident using GRR

-134 135 165

This page intentionally left blank.

4

© 2017 Erik Van Buggenhout & Stephen Sims

Where Are We in the APT Attad< Cycle?
In section 4 of this course, we discussed avoiding installation and foiling command & control, today we will focus on data exfiltration, cyber deception & incident response
~ , ':Yeap~n,zat1~ 0~ · _I

r

. --·)I.

-

!\: Reconnaissance . ,

~-=-~.· "'-.·.---

~

: D~li"very

Action on Objectives

Where Are We in the APT ttack Cycle? We already started dis ussing the "Action n Objective" phase in the APT Attack ycle esterday. We will c1.mtinue our journ y today as we focus on data ex filtration, cyber deception & incident respon e:
Adver ary perspective
When adver aries reach their targets through lateral movement. they will "finalize the kill'". If the objective i e pionage, they\ ill collect and ex-filtrate data. If the objective is to interfere with the target, they will start making modifications. This can be corrupting. deleting or overwriting of data ands stems. or covertly modify -data and configurations to change operations within the target. For example. data modification can be introduced in payment y terns to steal mon y by wire transfer. We have even observed malwai·e samples that modifies payroll data on cloud system to introduce new fake, employees in the staff database and have their wages paid to bank accounts owned by criminal or their money mule .
Defender per pec:tive When adversaries progress thi far in the kill chain, they have defeated the majority of pre ious defenses. For the adver ary, everything is in place for the final push.
Data exfiltralion: when the objective is to obtain infom1ation, ii has to be rransfom:tl lo the adversaries' systems once it is located and acces ·ed. Exfi ltration of data is typically a network activity and as such leaves traces. Large amounts of data e ·fi ltration (gigabytes or terabytes) are dete table by graphing the con urned network bandwidth versus a time axis . Dedicated system can be put in place to monitor for data exfiltration: Data Lo s Pre ention sy t ms. OLP can be as impl as looking for tag on the network, such as the string " trictly confidential" in uploaded document . But such simple detections are also simple to bypa s. For example, just compressing or encrypting a document before uploading hides all strings in ide the docum nt.

© 2017 Erik Van Buggenhout & Stephen Sims

5

Course Roadmap
· Day 1: Knowing the adve rsary, knowing yourself Day 2: Avert:mg Payload Delivery
· Day 3: Preventing Exploitation Day 4: Avoiding IO.$tallation, foiling Command & Control &thwarting lateral movement Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

SECS99.5
· Data exfiltration Typical data exfiltracion strategies Exercise: Det.ecting data exfiltration using Suricata Cyber deception str;rtegies Tricking the adversary Exercise; Making your honeypot irresistibly .sweet leveraging threat intelligence Defining threat intelllgenc:e Exercise: Leveraging threat intelligence with MISP & Loki Patrolling your network Proacti11e threat hunting strategies Exercis:e; Hunting your environment using OSQuery / ELK Incident response Incident respons.e process Exercise: Res_ponding ro an incident using GRR

SANS

his page intentionally le ft blank .

6

© 2017 Erik Van Buggenhout & Stephen Sims

Typical Data Exfiltration Activities
SCENARIO Adversary has compromised workstation in internal network of organization

·ll ······

I I

.....i...ll

···

DMZ network

Segregated inner networks

Typical Data Exfiltration Activitie Once (advanced) adversaries have a first foothold in the environment, they will tart attempting to reach their objectives. "Actions on objectives is a broad and generic term, that encompasses many activities pe1fo1med by attackers. One of these activities is data exfiltration. We will now walk through a couple of steps that illustrate how attacker typically steal & ex filtrate intere ting data.

© 2017 Erik Van Buggenhout & Stephen Sims

7

Typical Data Exfiltration Activities - Step I

EXFILTRATION STEPS I - Search for interesting files

·ll······

I I

·l···· I

SAN~

DMZ network

Segregated inner networks

ypical Data Exfiltration Activities - Step 1 As a first step, adversaries will need to search for interesting file . Usually, the adversary is on "foreign oil' ' when he infiltrates your environment. That typically means he doesn't immediate! know where you are taring your crown jewels. In order to achieve this, he will have to search your environment for possibly interesting information.
As he will have to search your environment, he is bound to b rather noisy & could even generate errors that could reveal his activities (e.g. as the current user he compromised doesn't have access to the top-secret
or information he so desperately wants to obtain). We will discuss this more in-depth in the next series slides.

8

© 2017 Erik Van Buggenhout & Stephen Sims

Typical Data Exfiltration Activities - Step 2

EXFILTRATION STEPS I - Search for interesting files
2 - Collect & prep interesting files

·ll······

I I

.~ ..... ~

' SA~

DMZ network

Segregated inner networks

Typical Data Exfiltration Activities - Step 2 A typical data exfiltration tactic used by (advanced) attackers, is to gather all collected data to b exfilt:rated in one place. Through various search operations we discussed in previous slides, attackers will locate intere ting file and data. Often attackers will steal a lot of data, so that they can sift through it on their own systems, out of reach of corporate surveillance. For example, it happens regularly that attackers copy the complete mailbox of individuals or even all emails on email rvers.
This can represent a huge amount of data (gigabytes and more), and it is not practical to go through thi s data on line and exfiltrate it manually with a copy/paste for example. Exfiltrating significant amounts of data requires planning and organization .
What we have observed, is that attackers wiJ I often gather all the data they deem interesting in one place: for example, inside a folder on a computer sy tern they compromised. All these file will be put inside an archive and may be encrypted.

© 2017 Erik Van Buggenhout & Stephen Sims

9

Typical Data Exfiltration Activities - Step 3

-
EXFILTRATION STEPS l - Search for interesting files
2 - Collect & prep interesting files
3 - Exfiltrate interesting flies

·ll······

I I

....·.i·.·.q

SANS

DMZ network

Segregated inner networks
,

TypicaJ Data Exfiltration Activities - Step 3 Most adversaries will perfonn data ex filtration over the corporate network infrastructure. T hat being said, physical exfiltration is poss ible, but this ty pically requires the adver aries to have people on-site, which is u ually not the case.
Whether attackers will have many or limited options to perform data exfiltration over the ncrwork will depend on the design of your corporate network. If it is a flat network connected to the Jntemet. they will not encounter insunnountable obstacles. A properly segmented network will be more difficult for the attackers, both to gather data fi-om different segments and toe filtrate data to the Internet.

10

© 2017 Erik Van Buggenhout & Stephen Sims

Step I - Searching Data of Interest
IOne of the. actions on objectives that adversaries will take is collecting data from various sources inside the compromised organization. There is just one problem with that for adversaries: they are blind in your environment and don't know where to look for data!

· Before data can be collected it mu t be first identified and located within the environment.
· Ther are various tools that can arch for files and other data. · Windo s bui1t-in search function can be u ed to locate files of jater t. · During the infamous ' arbanak" ampaign, the ad er aries in tal1ed monitoring
software, so th y could py on us rs to understand how they could reach their obje tives!

SANS

·

tep 1 - earching Data oflnterest Once (advanced) ad ersaries arc in ide our neh ork and have acce. s to our system, lhey will proceed with th· next phase f the atta k: ..action. on objec1i . " .
"Actions n objectives"' is a broad and generic term, that encompa se man a tivities performed by attackers. ne of these activities is data e ·liltration.
Data c. fillration i st aling ynur data, put . irnpl . tta l..er will arch for intere ting data tored in your IT infrastru ture: onficlential docum nts, planning., research results, financial data, b okkeeping, compan ecrets ... you name ii. Thea this dala will be collected and c filtrated : auacker will transfer it out of your corporate IT infrastructure to a · tem they control.
Before attackers can e filtrate data, they have to identif)1 and locate iL This may sound obvi us, but in a large organization. it might requir ·ome work to . ift through file and data lo find hat attackers are looking for. Wind w. (and oth r operating) y tern have tool tha1 help users I ale tile and tlata, bas ·don metadata (like filename) and file ontent. The, e tool can be u · db attacke t to ~earch fi r their '·grail".
These carch functi n con vary from basic tu l,ophisti ated, like ortana in Wind >ws I 0.
During the infamou · ·· arbanak.. campaign. the ad ersarie ins1all d m nitoring. ft are. o the) could p)' on users to under tantl how thc-y c uld rcaeh their objc ·tivcs l

0 2017 Erik. Van Buggenhout & Stephen Sims

11

Step I - Searching Data of Interest - Using Built-In Tools

· · P'Wf.4t,rt:n-.ph.1 ·d't'Yoll''!.O~t,,d.J.r, / I
·,g rw. ii'\ ar-1'4· C "ii\. f'IO l,a
V~l.- S·rhl "UIOb·r II !lffd· t

'ao:,nF 10.fft

.a." .@C,t

S/f/7/101" 1.0:S' 1 J 1. ·

~ t'9 ccnftd·n lal·r·pc,M ,<100 i S19 byln

lof·l Hlu llst...S .

l f ll·(

4S 87~ t,yt~,

sn 8 Olf i) lH 46~ 91'

i:>y ·· ~,._

PowerShell can also search the file system fo1· file names conta1n1ng the keyword "confidential".

In tlm example we see f'>ow the comma11d line (cmd exe) together with the ..dlr'· command can be used to search {/s) for confidermal documents.
0
l~IOTllOV

SANS

i1·_f ..'o: ·_:,-·1,.:,\l·I..'
····.,·;t·' I· ,r·J ,J,,_,.1.,, ,,,-,1t
,·t .: i ,,.1_ ~" ,· ! ··j{ t

I i · ) · ,... ~.,, ,· ~·, 1
I, ·,,,t

PowcrShell also supports searching remote computers for interesting commands!

tep 1 - carching Data of lnterc ·t - U ing Built-In Tool Here we stan, ith a very basic file search operation using the "old shell", Lhe Windows command-I ine interpreter cmd.exe . cmd.c c ffer · various commands like the dir command . Dir stand · for directory: it returns t.he content of a direct ry b Ii. ting all the tiles and directoric. inside a dire IOI) , together with ome mctadata uch a the lile size.
When the dir command i e,·ecuted \ ithout an arguments or options, it" ill produce a directory listing of the current direct ry. Dir can be instructed to list the ontent ofa particular directory, for c ·ample, c:\demo. The command is "dir c:\demo·', thi will produce a directory listing with 'the content of the c:\derno directory. The dir command can earch for pccific file 100, with the /s option.
Fore ample, command ''dir /s ecret.doc.. will . earch for tiles , ith name ecr t.do inside the curr nt direct I") and all underlying sub-directories. To ·carch through a complete filesystem. the document to search for shou ld be prefi ·ed with the root directory of the file drive to bes ar hed. Fore ample, f· r dri e C':, the command i "dir I c: ecret.doc".
Power 'hell can. of cour e, do similar things as cmd.exe. ne command that can be used to locate files, is GelChildltem. Get- hilditem lake many ption . The - Palh option allow us to . pecif) hi.:r to ·tart ·earching. In thi s example, \ e earch in th c:\rc earch-and-development directory.
e can tilter for pecific names v. ith the - Include opti n: -Include· onfidential · will ·elect alJ file (and direct rie ) ith the strin · confidcntinl in the filename · is a wildcard just like , ith md.exe).
With option - Pile we earch only for files and ignor dir ctories e.g. directorie that match the name · conlidential · will n t be listed ). By default the Get- hilditem command onl earches in the pro idcd direct ry , and not th underlying dire l ries. T 1 achieve . earching through sub directories, option - Recurse must be provided. Finally, with option - F.rrorAction we can make that the et-Chi lditem command continues searching even when error occur ·.

12

@ 2017 Erik Van Buggenhout & Stephen Sims

Attackers will not only be interested in documents found on the machine they are logged into, but also on remote machines. With the classic command shell, cmd.exe, commands like dir can only be executed on the logged in machine and not on remote machines. A share can be mapped to a drive on the local machine, and then be searched through remotely with the dir command, but tbis will require more network bandwidth and will be less perfonnant because the directory structure has to be transferred from the remote machine to the local machine.
Ln the example above, we use the command Invoke-Command with option ----ComputerName to issue a PowerShell command on remote computer fileserverOl. The command is the Get-Childitem command we saw in the previous slide.
The difference between invoking a command on a remote computer, and mapping a remote drive on a local computer, is bandwidth and performance. By issuing the command remotely, it will be faster, because only the result (the output of the command) has to be transferred over the network, and not the complete directory structure.

© 2017 Erik Van Buggenhout & Stephen Sims

13

Step I - Searching Data of Interest -AttackerTools (e.g. Meterpreter)

meterpretei > search .r ·.doc
found 12 results...
c:\Documents and Settlngs\eng1neerl\Dorument.s\Pro1ect )(\budget.doc (48593 bytes) c:\Oocuments and Sett1ngs\englneerl\Oocuments\Pr0Ject X\plaonlng.doc (945034 bytes) c:\Documents and Serting.s\l!ngineerl\Ooruments\Pt0Je<1 X\~rt -ql.doc (i-33450 bytes) c;\Documents and Sertmgs\eng1neer1 \Oowments\ProJ~ \~pert-q2.doc: {1.6Sl90 bytes)

Meterpreter ,s a pure in-memory command shell part of the
Metasploit
Framework.
Meterpreter can also search files by filenames.

Combining thls search command with Meterpreter's automation features can result in very fast searching through all computers in a compromised environment.

SANS

- :--- . ·

. ,

Step 1 - earching Data of Interest-Attacker Tools (e.g. Mete-rprcter) Since data e filtration is such an important goal of attackers dedicated attacker tool have earch capabilities too.
We v ill illustrate this here with Metasploit' s command-line hell Meterpreter.
Meterpreter is a dedicated command-line imerpreter with specialized penetration testing commands. T he Meterpreter code is not written to disk, but it is injected in an existing process and thus leaves no footprints 011
the disk.
In a compromised environment attack tool s like Metasploit/Meterpreter can be used to automatically access remote computers and execute commands with it result centralized on the computer compromised by the atta ker.
While Meterpreter has man commands to ex cute attacks, it also has basic commands, for exampl e, lo sear h for files.
In the abo e example, we ee the search command issued to look for Word documents (filename * .doc}.
The - f option perform a recur ive search. e.g. a earch tl1rough all sub-directorie .
Combining thi search command with Meterpreter' s automation features can result in very fa t searching
through all computer in a compromised environment.

14

© 2017 Erik Van Buggenhoul & Stephen Sims

Step I - Searching Data of Interest - Getting Creative...
Some security tools installed on machines can be repurposed by the attacker to search for interesting content.
Some anti-virus scanners (such as ClamAV) allows for searching with customer defined signatures.
Other tools include the YARA engine, which can also be tuned with custom rules.
If these tools are not present, the attacker can deploy them without installation.
Step 1 - earching Data of Interest - Getting Creative... How can advanced attackers ''H ijack'' existing (securit ) tools to search for intere ting file ? Some security tools installed on machines can be repurposed by the attacker to search for interesting content. Remember that we discussed anti-virus applications and other malware searching tool like YARA: it is po sible to use thi tool to earch for docwnents too. Some anti-virus scanners (l ike ClamAV) allow searching with customer-defined signatures. Other tool include the YARA engine, which can also be tuned with rule . If these tool are not present on the compromised machine. the attacker can easil, deploy them without installation. Clam AV and YA RA do not require in tal lation, just copying the executables and supporting files on the compromised machine is enough to be able to use th e tools. T hey do not require admini trative rights to operate.

© 2017 Erik Van Buggenhout & Stephen Sims

15

Step I - Searching Data of Interest - Getting Creative with YARA!
YARA is a flexible, multipurpose search tool based on rules. The rules that we use are designed to detect malware and other unwanted files, but there is actually nothing to stop a user logged in on a system with YARA from creating his own rules and using YARA to search through the file system.

rule Confidentia!Documents {
strings;
$a = "confideritial" ascii wide nocase $b = "secret" asdi wide nocase
$c = "classified" ascii wide nocase
condition; any of them

We have seen the use of YARA rules to detect activities of our adversaries.
Since YARA is a portable tool, adversarie, can us it too w search for confidential data.
The following rule will trigger on all files that contain the word "confidential". "secret"" or "classified".

SANS

·

. ·.

. 1

-

..

Step 1 - Searching Data of Interest - Getting Creative with YARA! To ii lustrate how existing securit tools can be hijacked to facilitate data e filtration, we will di cuss a YA RA rule designed to search for confidential documents.
As we saw, YARA is a flexible, multipurpo e search tool based on rules. The rules that we use are designed to detect ma Iware and other unwanted files, but tJ1ere is actually nothing to stop a user logged in on a system with YARA from creating hi own rul and using YARA to earcb through the file system.
ln the example above, we illustrate this with a simple rule that will search for documents that contain at least one of these words:
· confidential · secret · classified
The options ascii and wide make that YARA will search for these words in ASCII and UNICODE form. The option nocase instructs YARA to disregard the case of a word when matching with th se keywords.
This simple rule when used with YARA to scan through a complete file system, will locate all documents that contain one ofthese keyword .

16

© 2017 Erik Van Buggenhout & Stephen Sims

Step I - What Can We Do as Defenders?

PREVENT
· En ure the organizations knows what data
they po & that it is corr tly clas ified·
· Limit user ace s rights only to data they should b allow d to ace s ("need-toknow");
· Next to limiting user access to data, also consid r what type of data y u stor wbere... This includes n twork segm ntation, but also even considering storing some data offline!

DETECT
sy tern wide earch generates a lot of activity on the sy tern that i being search d;
· Monitoring for arches through file system i · not trivial though, there will b several false po itiv s: · Anti-virus scanners, sear h indexers, backup program , etc.
· Acces to network shares can however b monitor d (event 10 5140 - ''A network hare obj ct was ace ed' ). I k for repeated audit failur from one ·ource!

'tep I - What Can We Do as defenders'?
alway , a defenders.,, e ba e two I pe of controls w can put in place:

PREVENT
In order to prevent adversarie from stealing sensitive data, it' important for an organization to know what data the_ po se . that it is correctJ, classified. Ba cd upon thi lassification, user accrss rights sh uld be highly
limited, and u ers hould onl ha e access to what they n ed lo fulfill their daily job r·need-to-know·' principle).

Ne t to limiting user access to data, also con ider what type of data you store where ... This includes network segmentation, but al. o en con ' idering toring ome data ofnine!

DETECT It is a fact that earching through a omplete file system is "very noisy·. When we ·earch for fil inside a tile
ystem with cmd.e ·e or Po, er h II. 'these programs will open all direclOrie to list the files and directorie in-ide it. Depending on the number of file and diredori s in idea file y tern, I.h i can require opening ten thousand or more directories, and thus produce a con, iderable number f acti itie . earching with an inde ' i dit ercnt: the fil
ystem doe not need to be earched through, onl th inde itscl r.
ne \ ould think that thi.!> kind ofactivit_ would be monitored. but b} default on Window ace s. ing file and
dire toric is not logg d wilh ind \ event . indow cun be configured tog n rate e enls for file acli ities. but doing chis indiscriminul ·ly would generate a hu, amount f e ents. nd when you would configure thi and monitor the re ults, there will be several false p siti es. The same behavior is exhibited by legitimate programs. like · anti-viru · program. · Bac"--up pr gram.
earch inde ers
These program to a c the compl t file . . tcm, and exceptions ha e to be created when monitoring file y tem acti itie , to a oid fal~ positive .

It's important to note though, that adversarie will earch remote file sy tem as well (e.g. go through all Windows shares. which could ·e1Pra1e a huge olume f Window e enl IDs (c ent ID 51-t0)...

© 2017 Erik Van Buggenhout & Stephen Sims

17

A Word on Data Classification

Advanced adversarie will quickly identify important data and try to steal it. Important data

must be adequately protected, but do your employees know what data is important and what

data is not important?

I A data classification policy and proper training of your employees will help classify data accordingly.

I This data classification policy will dictate the classification of data into different classes (levels).

I One way to define a level, is to analyze what impact the loss of data will have on the business, and then to specify a data classification level accordingly.

I When data is classified. data with a high classification (e.g. confidential) can be separated from public data, for example.

A Word on Data Classification From the example we gave on searching data, it is clear that advanced adversaries will quickly identify important data and try to steal it. Because important data is crucial to your business, it must be adequately protected. Before it can be adequate! protected, it mu l be identified. But do yoUJ employees know what data is important and what data is not important?
A data classification policy and proper training of your employees will help classify data accordingly. This data classification policy will dictate the classification of data into different classes (levels). One way to define a level is to analyze what impact the loss of dara will have on the business, and then to specify the according data classification level.
For example, data that would endanger the further existence of the company when it would be leaked would receive the highest classification level , and should then be handled accordingly. When data is cla sified, data
with a high cla ification (e.g. confidential) can be separated from public data, fore ample.
Here is an example of classification levels:
· Top secret · Secret · Confidential · Public

18

© 2017 Erik Van Buggenhout & Stephen Sims

Should You Store All Your Data Online?

t

.Another obvious statement: data that is offiine is hard to

steal.

· Advanced adversaries that attack your enterprise via

digital intrusion can only steal online data.

Data that is kept offilne) is not accessible to a digital

intruder.

· Most data have to be online of course, but archived data for

example can be stored on storage media that is not directly

online, e.g. not served by a file server.

If this is thought through, this will also limit the impact of ransomware attacks!

I ~J\i~S

'

.

bould You Store All Your Data Online? A ·econd obvious statement: data that i ffline is hard lo steal. Data that is stored on media that is connected to a server is online and ac essible, but data that is tored on media with ut being connected to a server is offline. It cannot be acces ed without connecting the media to a server.
As most advanced adversaries attack your enterpri e via digital intrusion (remotely), they have no physical access to the IT assets of your corporation and thus can only access online data.
Data that is kept offiine, is not accessible to a digital intruder. Most data have to be on line, of course, to be
able to serve its purpose to the business but establishing policies that dictate which data can be stored offline
help prevent the scale of data theft. Archived data. for example, can be stored on storage media that is not directJ online. e.g. not erved by a file server.
onsider: · Old reports · Terminated projects · Old emails
This type of data might have to b kept for legal reason , but then it can be archived offline. By not storing " aJI" of your data online,_ ou an also limit the impact of rnnsomware attacks!

© 2017 Erik Van Buggenhout & Stephen Sims

19

Example - Data to Keep Offline (I)

A good example of highly confidential data that is kept offline can be found in the private key infrastructure (PKI) of certification authorities (CA).

A root certificate is generated that is valid for a long time (30 years
for example). This root certificate is used to sign an intermediate certificate.
The intermediate certificate is valid for 10 years (for example). The intermediate certificate is used to sign certificates that are issued to clients.

SANS

Client certificates are valid for a short period ( 1/2/3 years for example)
-
·.

l.i:xample- Data to Keep Offline (l) A good example of highly confidential data thal is kept offline can be found in the pri ate key infrastructure (PK I) of certification authorities (CA).
Certification authorities are organizations that issue certificates: si1:,rned public keys with metadata. To sign this data, they require private keys. But if those private keys are compromised, CAs can be impersonated and the attacker can issue certificates that cannot b distinguished from legitimate certificates i sued by the CA.
To prevent the compromise of private keys, CAs will store critical keys ofiline.
This is implemented as follows, using a pyramid of at least 2 ce1tificate :
A root certificate is generated that is valid for a long time (30 years for example): this includes the public and private key and metadata.
Then this root certificate is used t'O sign an intermediate certificate.

20

© 2017 Erik Van Buggenhout & Stephen Sims

Example - Data to Keep Offiine (2)

IIn a PKI infrastructure, the private key of the root certificate is no longer needed to operate the infrastructure, as long as the intermediate certificate remains valid and its private key is not compromised.
I Storing the private key of the root certificate on removable media kept in a safe, keeps it offline and out of reach of digital intruders.
IIntermediate keys can also be protected, stored on so called HSM devices (Hardware Security Modules), these devices store the private key for safekeeping and they can sign requests, but the key can never be extracted from the HSM.

Organization should use this mindset and critically assess what information should be kept "online" and what kind of information can be stored "offline"!

Sk~S

-

Example: Data to Keep Offline (2) The intermediat certificate has also a public and private key with metadata. but it is typically valid for a shorter period of time. For example, IO years.
Then thi intennediate certificate is used to sign and is ue certificates lo client .
This means that the private key of the root certificate i no longer needed to operate lhe PKI infrastructure: it is the intermediate key that is used lo sign certificates, as long as the intermediate certificate remains valid (it expires after IO years) and is its private key is not compromi ed.
This architectural design of PKI sy .terns make that the private key ofth root certificate can b safely stored offline, it does not have to be online to sign certificates.
The private key of the root certificate can be stored on removable media and kept in a safe where it is out of reach of digital intrud rs.
lntennediat keys will also be protected: they are stored on so-called H M devices (Hardware Security Modules), they store the pri ate key for afekeeping and they can sign requests but the key can n ver be extracted Ii-om the H M.

© 2017 Erik Van Buggenhout & Stephen Sims

21

Case Study - DigiNotar

DigiNotar was a Dutch certification authority, owned byVASCO Data Security International. They suffered from a breach in which an adversary gained access to DigiNotar's PKI infrastructure.

July
2011

These certificates were used in Iran to conduct man-in-the-middle attacks against users of Google's services.

August 2011

Certificate problems emerged in Iran, and Google detected the fraudulent certificates (up to 53 I fraudulent certificates were found).

September 2011

S,'~ m!\l,s

--

DigiNotar filed for bankruptcy because major browsers no longer trusted DigiNotar's certificates.

- - -- - - -- - - -
- __ _

- --- -
_

~· - - - - -
_ . _

-

--

. -- - - -

_-r·. -·.-. ;_ ~-- _'_·· _· ·_:~· ··· - -. ¥ __ ~i .. - ....

Case tudy - DigiNotar Having its PK.I infrastructure compromised can bankrupt a CA. One example ofthi was the Dutch A Digi otar.
Thi is a trong example that illustrates the fact that companies can go out of business just because of data theft.
DigiNotar wa a Dutch certification authority, owned by VA O Data ecurity International. Like many CAs, it root certificates were part of the certificate s1ore of many browsers and operating systems, making those applications trust certificates is ued by Digi otar.
Digi otar suffered a digital breach: a hacker gained access lo DigiNotar's PKJ infrastrucwre.
The hacker issued fraudul nt certificates in July 20 I J. These certificates were u ed in Iran to conduct man-inthe-middle attacks against user of Google's services.
In Augu t 2011, certificat problems emerged in rran, and Google detected the fraudulent certificates. h issued
a public statement and urged Digi otar to take action.
DigiNotar did not take timely the appropriate action , and major brO\ sers started to pull DigiNotars r ot certificates from their stores, resulting in HTTP connections that were no longer trusted . This impacted Digi otar s business significantly, a clients were forced to obtain new certificates from other CA 's.
In September 2011 Digi otar filed for bankruptcy because major browsers no longer tTusted DigiNotar's certificates.

22

© 2017 Erik Van Buggenhout & Stephen Sims

Another Creative Approach ... Detecting Adversaries Accessing Decoy files
Decoy files?
One method to detect system-wide file system earches uses decoy files.
· Decoy files are unimportant files that are designed to attract the attention of attackers.
· For example, a document with an enticing filename like "top-secretproject"
· Access to decoy files is closely monitored. · We will go into more detail in chapter "Cyber deception strategies '.
Another Creative Apprnach ... Detecting Adversaries ccessing Decoy Files possible solution to the problem of monitoring complete fi le systems is to limit the number of files we
monitor, and devise methods lO lead attackers to thes files . One method to achieve this is the use of decoy file . Decoy files are n t legitimate corporate files, but they are files planted on filesystem · to attract the attention f attackers. They do not contain (important) data but have enticing names to attackers. An example of such a name can be 'top-secret-project". Access to these tiles is closely monitored, while access to other fi le is not. This tactic , ill significantly reduce the number of events produced when th e files are accessed. We \viii discuss this in more detail in the next chapter "Cyber deception stratcgie " but know al read that thi is a simple method to reduce the overload of activities to monitor.

© 2017 Erik Van Buggenhout & Stephen Sims

23

Step 2 - Collecting & Prepping the Data
Attackers wil1 often gather a1l collected data in one place before exfiltration:

I

Encryption

I

Compression

I

Splitting

~

SANS

Use of archival tools could be detected by filtering the Windows command line logging for typical " archival'' syntaxes
(archive extensions, tool command line, ... )

Step 2 - Collecting & Prepping the Data Once interesting infom1ation is located, the data is typically centralized to an internal system that has already been compromised. Here, the data can be prepared to be exfiltrated:
· It can be compressed or split in mailer chunks to hinder detection; · Jt can be encrypted to hide th contents of the data that is being exliltrated
Given these feature , we often see that rypical (portable) archiving utilities are used to prepare the data, as they offer both use cases described abov . Good cand idates include:
· 7z
· RAR
As a detection strategy. it might be a good idea to keep an eye out for archival tools being used in the environment. One concrete \ ay of doing so would be to attempt detection of archival tools by filtering the Windows command line logging for typical "archival" syntaxes (archive file extensions, tool command line syntaxes, ...).

24

© 2017 Erik Van Buggenhout & Stephen Sims

Step 3 - Exfiltrating the Data - Using the Network
In most cases, network exfiltration is the attackers' modus operandi of choice...
I Attackers will gather all collected data on one machine with network access.
I To speed up network transfer, files will be grouper together in one or more archives and compressed.
I To prevent keyword based exfiltration detection, the data can be encrypted.
I Classic data transfer methods like HTTP/HTTP$ uploads or email attachments will be used.
SAN~
Step 3 - Exftltrating the Data - Using the Network Most advanced adversaries will attack over the network and will not consider physical data exfiltration as an option. TI1ey have no physical acce s to our corporate infrastructure, neither do they have accomplices that do.
Whether attackers will ha e many or limited options to perform data e filtration over the network, will depend on the design of your corporate network. Jf it i a flat network connected to the Internet, they will not encounter in unnountable obstacle . A properly segmented network will be more difficult for the attackers, both to gather data from different segments and toe filtrate data to the Internet.
Of course, the fact that data leaves your network is nonnal. Just the mere fact of visiting a website imp!ie that data leaves your network (albeit a very small amount). But for example, the User Agent String of your browser is included as a header, as our cookies, and so on. This is ju t to illustrate the fact that strictly speaking, there 1s always data leaving your network. Data leaving your network is nom1al: detecting UJ1authorized data exfiltration can be a cl1allenge.

© 2017 Erik Van Buggenhout & Stephen Sims

25

Step 3 - Some Popular Options for Exfiltration

One very popular avenue for data exfiltration, is the use of cloud based

file hosting and file sharing services. There are many cloud based file

hosting and file sharing services available, many with a free tier

· If you allow the use of these cloud based file hosting services in your corporate environment, advanced attackers will use

a;;

them for data exfiltration

· Proxies and firewalls can be configured to block access to these services
· Exceptions can be made for particular users

' box

~,\i'ls

--

I 11. t",1

:_ -__-. ·' . . - . --.,

,

.

tep 3 - Some Popular Options for Exfiltration One very popular avenue for data exfiltration is the use of cloud-based ti le hosting and file sharing service . Many of them ha ea free tier. Popular e amples are:
· OneDrive · Dropbox · Google Dri e · Box
If you allow the u e ofihe e cloud-based file ho ting services in your corporate en ironment.. then it is game
o er: advanced attackers will use them for data exfiltration, there is no doubt about that. These ervices are easy and reliable, they are anonymous (creating an account requires an email to identify, not legal JD) and
have no problem operating in environments with proxi s.
It is possible to configure proxies and next-generation firewalls to block acces to theses rvices, and we
highly recommend that you would do this or your corporate environment. Thes services are the goto-service
for data exfiltration .
If there is a business need to allow acce s to these ervices, you should identify which users fulfill that busine role and make exceptions for these particular user , while blocking access for all other users.

26

© 2017 Erik Van Buggenhout & Stephen Sims

Step 3 - Other Online "Storage"

Next to social media, many websites that are not considered social media allow upload of data that can be retrieved later

Paste sites

Any data can be posted co a text storage data by

converting It first to a non-bina, y rorn,ac, like

exadeclmal for example. Example sites are:

· pasteblo.com · pastle.org · codepad.org · tinypaste.com · Etc.

_
-
... ·.. : """'' _. ,, ' 1 .. ...... .-:~ ... " . . .

Sentrn

Online services

Other examples of websites that allow posting of

data for later retrieval:

· Forums · Biogs like Word press.com

· Source code sharing

· Wlkipedia 4C 6F 72 65 6D 20 69 78 73 75 6D 28 64

· VlrusTotal n u n 69 74 2e 61 60 65 74 2c 28 61

· Etc.

60 65 74 28 63 6S 74 65 72 6f 28 69

6E 74 69 61 73 20 65 73 74 JC 28 73 6S 75 20 GE 6F 73 74 72 75 6D 20 66 61 63

73 69 20 61 73 73 6S 6t 74 69 6f 12 2C

6E 69 fiD 7S 60 20 60 6F 64 &S 72 61 74

SJ\NX

Step 3 - Other Online" torage"
Pa ·te ·ilcs File haring and. ocial media i n t the sole avenue for attackers to exlihrate data.
Many websites that are not considered social media still allow upload of data that an be retrie cd later. Take for c. ample text ·torage , ebsiles like pastebin.
Pastebin is a website that allows user lo (puhlicly) and anonymously (even without account) upload t xl to the web ite that is visible to aJI. u h an uploaded 1e ·t file i called a "pastie" and is ac essiblc to al I given th
RL that identitie it.
Pa tebin is blocked by many corporations becau e it has been abused in many forms: to share confidential data (knowingly and unkn wingl ), maIware, illegal content ...
s a te t torage ervice, the am unl of data that an be uploaded i of course limited. Data can be pread o er different uploads. but still , exfi ltrnting one gigab e of data would b c nsidered impossible.
, !though pa tebin and imilar ~ervice allo\ pa ting ofte. t, 1hey d not allo~ pa ling of arbitrary, binary data. TI1i can, howe er, be ea ·ily " olved" b the attacker · b con erting the dota to a non-binary formal. li~e e adecimal or ba c64 for example. This "lex!" con then be pasted to pastebin.
e certain!~ advi e blocking te t torage service like p tchin 1101 onl because of data e tilt ration (ev 'fl considering the limit ize of the upload) but becau e u ers Lend to u e it accidenlllll or intenrionall ) to share confidential data...

© 2017 Erik Van Buggenhout & Stephen Sims

27

Online service. Te I storage websites arc not the nly site that can be u ed (or abused) to upload data (data in i binary fom,
or converted to text).

There are many other types of web ites that allow po ting of data.

Forums and blogging platform (like, ordpre s.com) allow for posting oft xl, but the bandwidth is limited, like with le t storage ervices.

ource cod haring rvices like GitHub, fore ample, offer much more capabilitie , as well for capaci as for data type (binary dota is also accepted).

And then there are less ob iou r ices that can al o be used to exfiltrate data.

Take for example VirusTotal, a service that accepts lilc up to 128MB for anti-viru scanning. Any user can upload a file to irusTotal without an ac ount. What i less kno, n, is that all files uploaded to VirusTotal can al o be downloaded , pr ided a sub criprion fee is paid to Viru Total.

Wikipedia is another e ample ofa \ ebsite that can be abused toe, fiJtratc data. E isling Wikipedia articles can be modified (pasting text, binary data in te ·t form, pictures, ...) or ne, ones can be created. This doc not require authentication or authorization. The Wikipedia community will however quickly discover such changes and undo them because they are not considered appropriate. A li11le-known fact is that a history of change to each page is kepl E en when a change i simpl undone.

For example an attacker can po t data to exfiltrate in hexadecimal fonn to the Wikipedia article on the SANS

Institute and then imm diatel undo the change he applied. The hexadecimal data-.: ill still be easily

retrie able in the hi tory of the

article.

Another simple way toe filtrate data is web-based email, like Gmail. Gmail accepts attachment up to 25MB in ize.

28

© 2017 Erik Van Buggenhout & Stephen Sims

Step 4 - Network Exfiltration - Getting Creative...

Dep nding on what protocols you aUowto exit your corporate n twork, more exotic protocols can b considered, including covert channels such as DNS, ICMP, ... It should b noted that these would typically not be suitabl for larg volumes of data!

,. Fra Ul: 911 byfM o n ~ (78'1 b1t5l, 98 bytes captured 1784 bits) on tnttrhce t Ul'ltrnet U, Src: Applt_9f:a8t71 198:81:a1:9f:nb:7ll, D~-t: Tecll~ico_4d:9?:b8 (t-4:ea:1d:Ad 1U:b8l
· tnt M t Protocol Vt:r:siofl 4, Sr(. 1e.1e, lt,&&, 05t : 0.11.11 ,11 lflternet CorJtrol Hiess.ge Protoco\ 1ype: 8 (Ec.110 IIHnol requutl Code: t (l\eck.Sua: hSlla9 lcor rect 1 (Chccksu· Stelu~: Good]
Identifier (B ) 1 37174 (8~9136) ldenu titr ILEI: 13969 {txJ.691)
quenu nuarier ·8£1 : · llaetM I ScQue,m, nu· llc!t llfl: e ltlcel!M I

Ex~mple or data e x f i l t ra t1011 thro ugh ICMP Echo request

Tl st811P frOII ia.p data: Jul 31, 2817 lt:S&:27.185824 ID CUT lllMttnp fro· ~esp data ! relative): 0.1 68HI second·)
· Datil (~8 b~tHI

llengtll: 481

SANS

tcp 4- etwork Exfil tration - Gett int! Creative ... II the data exfiltration e ampl s we saw uniii no were based on website . hus, TCP connection· , ere e tabli ·hed to n ey HTfP/HTrP proto Is.

But there arc man other protocol that can be u' ed to exfiltrate data. Whether these can be used in y ur corporate network, it II depend on lhc design or your corp rate network. Popular protocols that have been u d for data e,Jiltration (and other nefarious purpo e are: · FTP: File Transfer Protocol · IRC: Internet Relay Chat · Email protocol SMTP: 'i mple Mail rransfer Pr tocol · Email protocol POP3 : Po t Office Pr tocol
·mail Prot col IMAP: Internet lcssage ccc . Protocol

me fthe e protocol are al o implemented over 1-JITP, like FTP: it is pos ible to access and upl ad files to an FTP crver using a browser. nd if you allo\ raw T P connection (for example over pon 80), then large amount of binary data can be exfiltrated. T P and proto ol based n TCP allow fire ~ltraungoflarge amounts of data quickly .

BUL if the amount or data t,o be leaked is mall (. ay IM B or 11.:s~). t111::n nun-T P proto ol are an t)pti n too. For the sake f pre cnting as diverse po ibilitie as po sible. we illustrate Lhi , ith a ouple of protocol that have be n abu db {ad anced) ad er ·aries to c, ti Itrate data.

I MP is the flrotocol that i used to send ping packets. It' a little-known fac t that ping packets can ontain arbiLrary data. In the example abo e, we ce the dissection of a ping reque t packet in ire hark. It co111ains 48 byte of data . The darn that is u d depends on the operating ·tern. Ho~ ever. au er can use lhc ping command on Linu Lo inject hi O\\ n data with the pattern option.

n Window · the ping command doe n t allO\ 1hi , but it nn be done via the Windo\ s Pl using ripting for e ·ample. The amount of data i ery mall, but numerous ping packelS can bt: generated to Lran mil a larger amount of
data.

D has al b en abused, by em:odin, data in the name of the ubdomain, or by u ing TEXT re ords.

© 2017 Erik Van Buggenhout & Stephen Sims

29

Step 4 - Network Exfiltration - Getting Even More Creative...

At Black.I-lat USA 2017, Itzik Kotler &Amit Klein (SafeBreach Labs) illustrated a technique

that abuses "cloud-enabled' AV engines to perform successful data exfiltration in

environments with highly restricted outbound filtering. The attack goes as following:

· · ·

The attacker obtains a foothold in the network With a malware sample that evades AV detection
The attacker walks through the kill chain & successfully collects interesting data
The data is collected and embedded in a known malware sample, after which it ls written co disk

· · ·

The known sample is spotted by the AV engine & sent to a cloud sandbox for further analysis
The sample is executed in the cloud sandbox of the AV vendor
Upon execution, the sample sends out the exfiltrated data to the attacker

In their Proof of Concept, exfiltration was successful for several mainstream AV vendors!

SANS

.

Step 4 - etwork Ex1iltratioo - Getting Even More Creative... At Biackhat USA 2017, ltzik Kotler & Arn it Klein (SafeBreach Labs) illustrated a technique that abuses <cloud-enabled'' AV engines to perform successfu l data exfillration in environments with highly re tricted outbound fil tering. The attack goes as following:
I. The attacker obtains a foothold in the network with a malware sample that evades AV detection; 2. The attacker walks through the kill chain & successfully collects interesting data 3. The data is collected and embedded in a known malware sample, after which it is written to disk; 4. The known sample is spotted by the AV engine & sent to a cloud sandbox for further analysis; 5. The sample is executed in the cloud sandbox: of the AV vendor;
6. Upon execution, the sample sends out the exfiltrated data to the attacker.
1n their Proof of Concept, ex filtration was successful for several mainstream AV vendors (including the likes ofE T, Kaspersky, Avira... ). Although we recognize this is a bit ofan "exotic" scenario, it show how difficult it can be to prevent data e ·fi ltration in your environment.
SI ides can be found here: https ://www.blackhat.com/docs/us- 17/th ursda~/us-1 7-Koller-The-Advem ures-OfAv-And-The-Leaky- andbox.pdf

30

© 2017 Erik Van Buggenhout & Stephen Sims

Step 4 - Preventing Network Exfiltration

Dedicated. persevering attackers will usually find a way to perform data exfiltration. If they have the capability to infiltrate your network successfully and gather data, they are bound to find a way to find a data exfiltration path as well.
This does not mean we should make it easy for them...
Prevention can be done by blocking the most obvious paths for network data exfiltration, like file hosting services. This can however be unacceptable in some organizations, because of the negative business impact!

SANS

·

tep 4 - Preventing Network xfiltration We presented many ways to exfi lh·ate data and to abuse services to facilitate data exfiltrallon.
IL might be depre sing how many ways there are toe filtrate data, but thi is the grim reality e are facing: if
your corporate nelw rk is connected to the Internet, it is impossible to complet ly prevent data exfiltTation. Our corporate network relies too much on diverse protocols and services, that it i impossible to properly prevent abuse on all protocol and services.
Dedicated, persevering attackers will find a way lo ex filtrate data. If they have come so far to infiltrate your network successfully and gather data, they are bound to tind a way toe filtrate it.
Prevention can be done by blocking the most obviou paths for network data exfiltration, like file hosting services. But blocking all possible ways toe filtrate data is an impo ible task unless yo u are in the strictest network environment where Internet access is virtually non-existent.
The onl. thing we can do, for prevention, i to make life harder to our attackers by blocking easy methods of data exfi ltration. Bute en this can be unacceptable in some organization , b cause of then gative busine s impact it can ha e.

© 2017 Erik Van Buggenhout & Stephen S ims

31

Step 4 - Detecting Network Exfiltration
While prevention of data exfiltration is extremely hard, detection of data exfiltration offers us a bit more hope. We recognize two main detection methods:

Exfiltration detection system: Data Loss Prevention

ISignature based detection: detect confidential data markers like for example anti-virus or IDS
IBehavior based detection: detect abnormal patterns in network traffic, like large uploads

~ANS

-

'

.
I

tep 4 - Detecting etwork Exfiltration W11ile prevention of data ex filtration is extremely hard, detection of data exfi ltration offers us a bit more hope. There are essentially 2 methods that data exfiltration detection system used to detect possible data leakage. /\ data exfiltration detection system is known as a Data Loss Prevention (DLP) solution.
The 2 methods they can employ are:
· Signature-based d tection · Behavior-based detection
OLP solutions are put in place at the perimeter of the corporate network, where they can observer network traffic leaving the corporate network to the Internet. With signature-based detection, OLP solutions will detect exfiltration ofconfidential data via watennarks· .imilar in th way anti-virus and IDS work to detect maliciou activity based on signatures.
With behavior-based detection, OLP solutions wi II detect exfiltration of confidential data by observing abnormal network traffic patterns. This is in large part based on the volume ofthe data.

32

© 2017 Erik Van Buggenhout & Stephen Sims

Step 4 - Detecting Network Exfiltration - Signature-based Detection

Signahlre based detection will look for special markers. For example, we can mark all confidential documents with a marker: Secret599. When data is leaked, the marker can be detected by DLP software or even IDS

14't· rfl40t (Ol'ltt(II\ llt-U.O- rl"otoco~
f Yl'O < 9 lk·o (9Jogl ~ae.tl
c«II' ! ·
ChtctJUIU t,c&6.!I Ccar-,ectJ
rch.e.C.ti,~ s,.w,~c.oodl
l...,IJ11er 190 1 "9,t lllll)ti.t 10..1111.er II.fl: 1411' l1,cJ6o{!
5ewtllu .,,,_,., ·111:h e ·- l
SOtju..ct , _ , ll01 - (botNl
ll\c$PAOIAs trMCf. II 1 UNO r,oa i.0llO 0-lto l Ju\ )l. 2'11 Ll : lt: N . l B J ~ CUT
lUftdUilP froa J:C'IIO Mt.t tr"tat"t'Hf : ·.hll138M H<"Ol"ld.tl O.tt 1· 8 ll)lled
~l·; S)a.\4'17l0!\74:IJ4SA)lsl IJ6SGJ1,16Slu,.&$A:m,,)0)3t,. (l,ong\1': ..,
,.,M.. .... ,q.,e .
· J... ,f, f. ... P··
::s.~~~-~ ~
utts:a wiure,
~<M.s«s

Classification rnuker as seen in network traffic

p
Bypassing this detection can be done with compression or encryption for example

I SANS

Ste11 4 - Detecting etwork Exfiltratioo - Signature-based Detection DLP solutions that are based on signatures will look for special markers (watermark) inside network traffic.
Thi s implies that all data that is confidential must be:
!. Classified according to the appropriate level 2. Modified to include a watermark that indicates it as classified data
Take for example a confidential document that we mark wi th watem1ark Secref599, for example by adding this watermark as metadata to the document.
When this document is e filtrated, the OLP software wtl l detect network traffic leaving the corporate network that has a byte pattern corresponding to Secret599. This will raise an alert (or can even block the network transfer, depending on the OLP solution and the corporate network architecture).
It is clear the markers must be selected that are unique. and only to be found in classified data . Otherwise too many fa lse positive alert will be generated.
A simple detection like thi s can also be an in-house so lution with an ID and some simple rules.
The OLP solution must be ab le to inspect traffic in different encodings, nnd also support various compression methods .
Because bypassing detection would otherwise be trivial by compressing the data (or using another encoding that obfuscated the markers). When at1ackers encrypt the data to exfiltrate, they cou ld be able Lo bypas sig nature-based OLP so lutions.

© 2017 Erik Van Buggenhout & Stephen Sims

33

Step 4 - Detecting Network Exfiltration - Behavior-Based Detection

Behavior bas d detection will look for abnormal network patterns on data leaving the company. The volume of the data that leaves the network

is an important indicator

Velum use,l :·
D

Looking at the data volume per user and per destination can reveal unexpected data transfers. Large, unexpected data transfer can indicate data exfiltration

Especially at the start. d1is sortofbehauior analysis

will produce many false positives the system must be

tuned over time: automatically (self-learning) or

C

j

·

manually (configuring exceptions)

SANS

·. , -

_· .

tep 4 - Detectin° etwork ExfiJtration - Behavior-Based Detection OLP sol utions that are based on behavior do not need watennarked documents like signature-based OLP olutions (actua lly, DLP olution will offer several detection techniques).
What these DLP olutions look for i abnormal net\ ork patterns for data leaving th corporate network . These solutions can be ba ed on learning patterns, where they observe the corporate net ork traffic for a period of time, assuming that network traffic during that period is nom1al (aka learning mode), and then are switched over to detection mode where they compare the observed traffic with historical patterns and alert on d viations.
The volume of the data that leaves the corpornte network is an important indicator for behavior ba ed DLP solutions. They will measure the amount of data per user aod per destination, and alen on unexpectedly large data irnnsfers. This method, of course, can only be successful if the ex filtrated data is indeed large enough to deviate from the nonn. If it is small, this method will not detect it.
There will also be many false positi es because large data LTansfers that deviate from th norm do not
necessari ly imply malicious intent. ome corporate network activities also ha e cycles over long periods, like
business cycles thot occur monthly, tri-monthly or yearly, for exam pit:. These business cycles can be Iinked to large data transfers, that are most likely not part of the baseline e t·ablished during the learning phase.
As we discussed, beha ior ana lysis will produce many false positive alert , especially at the beginning of the adoption of the solution.
111ere are several solutions to redu e the rate of false positives, for example li ke plunk will analyze actual traffic.
Another method is to tune the system over time; · automatically · manually

34

© 2017 Erik Van Buggenhout & Stephen Sims

Automatically involves self-learning (machine learning), where the solution learns itself to convert false positives into true negatives.
Manually involves network adm inistrator intervention: configuring exceptions to avoid false positives in the future (like a whitelisting operation).
lfwe cannot determine from the analysis data what happened, we will ultimately have to ask the involved user(s). This can be a difficult ta k as non-technical users can experience difficulty to correlate their business activities with network traffic.

© 2017 Erik Van Buggenhout & Stephen Sims

35

Step 4 - Detecting Network Exfiltration - Behavior-Based Detection (2}

A second behavior-based technique is related to the' covert channels" we discussed before. Protocols like DNS provide an interesting option for adversaries to include covert payloads. This would typically however rely on "strange" DNS traffic:

High volume ofTXT records
High entropy in D S names BASE64 encoding in DNS names Long DNS names

High volwne of DNS requests from 1 source High volume of DNS requests to 1 domain High number of hosts resolved for 1 domrun

For different protocols, we can define 'anomalies" that we typically wouldn t see much in a corporate environment. Using logging or packet capturing, we can dashboard this traffic and spot anomalies!

. SANS

-

-

- --

_ :· · -· · :_ . ~ ~

Step 4 - Detecting etwork Exfiltration - Behavior-Based Detection (2) A second behavior-based technique is related lo Lh "covert channels' we di ussed before. Protocol like D S provid an interesting option for adversaries to include covert payloads. hould adversaries want to use this type of strategy however, this would typically rel on 'strange" D S traffic:
· The ratio of A-record vs TXT-records hould show that TXT records occur far less in the environment. A high volume ofTXT records could indicate a D S tunnel;
· High entropy in D S names could rev al randomly generated domain names; · BASE64 is a preferred encod ing mechanism used by many adver aries. Data could be exliltrated by
splitting it over different BASE64 trings; · Generally speaking, ON tunneling would most likely lead to long DN names being resolved:
We could also focus on the olumes of traffic:
· A high volume of DNS requests from I source should be a source for investigation:
· A high volume ofD S requests to I domain; · A high number of hosts re ·olved per domain;
For different protocols, we can define "anomalies that we typically wouldn ' t see much in a corporate environment. Using logging or packet capturing, we cai1 dashboard this traffic and spot anomalies!

36

© 2017 Erik Van Buggenhout & Stephen Sims

Step 4 - Physical Exfiltration -A Tale of Printer Dots...

A side note: a tale of printer dots · Reality Leigh Winner was arrested for leaking top secret
NSA reports detailing Russian hacking before the 2016 elections. · The report was leaked to The Intercept via a printout, which was reproduced in the online article. · It is believed that the publication of this printout lead to the arrest of Reality. · The printout contains special printer dots that identify the printer. · Reality was one of few people that used this printer.

SAN~

· ·

Physical Ex_f&.ltration - Printouts When it comes to physical exfiltration, we want to mention that several interesting methods have been devised to detect or thwart this. These are typically the kind of efforts one would see in military or intelligence operations. Th example we want t mention here takes printers a an ex filtration devic . Secret information can be printed out, and the printed paper sheets can ju t be carried out of the building or mailed.
To identify the ource of printed document , a method has been elaborated that in ol es small, almost invisible dots that are surreptitiously printed on a paper when a document is printed. These dots uniquely identify a printer.
Such a case made the news recently :
Reality Leigh Winner was arrested for leaking top-secret NSA rep rts detailing Rus ian hacking before the 20 l 6 elections. The report was leaked to The Int rcept via a printout, which was reproduced in the online article. It is believed that the publication of this printout led to the arrest of Reality. · The pri ntout contains special printer dots that identify the printer. Reality was on of few people that used thi printer.
https://www .eff.org/deepl inks/20 I7/06/printer-tTacking-dots-back-news

© 2017 Erik Van Buggenhout & Stephen Sims

37

Data Exfiltration - Summary

To summarize, it will be clear from the examples that we gave that depending on your corporate environment, an attacker can have virtually unlimited options to perform data exfiltration.
I Although a possible option, physical data exfiltration is typically not the preferred method used by adversaries.
I Due to the many options available, prevention can be a (very) daunting task. Detection can be based on patterns and behavior, but both have their limitations.
I By mimicking data transfers that are considered "normal" in the victim environment, attackers can easily remain under the radar.
Due to the limited defensive options, organizations should try stopping the attack before it reaches this stage!

~t,Alt\'ii:\3'

' . ' ' ..:

'' .

. i

Data Ex filtration - Summary To summarize, it will be !ear trom the examples that we gave that depending on your corporate environment, an attacker can have virtually unlimited options to ex filtrate data.
Although a po sible option, physical data exfiltration is typically not the preferred method used by adversarie . etwork ex.filtration is by far the mo t commonly used ex.filtration method. Typically, the adversary has
already set up a C&C channel, which it could (partially) reuse for e:diltration.
The phy ical environment and corporate network environment need to be locked down to limit the possibilities of dara exfiltration. but this cann t be eliminated, as long corporations need an open work environment and Intemet acces .
Due to the many options available, prevention can be a (very) daunting task. Detection can he based on patterns and behavior, but both ha e their limitations!
By mimicking data transfers that are considered ' normal" in the victim environment, attackers can easily remain underthe radar!
Due to he limited defensive option , organizations should try topping the attack before it reaches this stage,..

38

© 2017 Erik Van Buggenhout & Stephen Sims

Typical Data Exfiltration Strategies
Some additional resources concerning data ex:filtration strategies:
Data exfiltration bttps: //en.wikipedia.org/wiki/Data theft
· Data Loss Prevention software https://en.wikipedia.org/wiki/Data loss prevention software
· Splunk https://www.splunk.com/en us/solutions/solution-areas/security-and-fraud/usecases / detect-and-stop-data-exfiltration. html

I SA~S

.,

Typical Data Exfiltratioo Strategics Some additional resources concerning data ex filtration strategies:
· Data ex filtration bttps ://en.wikipedia.org/wi ki/Data theft
· Data Loss Prevention software https://en.wikipedia.orn/wiki/Data loss prevention software
plunk https://www.splunk.com/en us/solutions/solution-areas/security-and-fraud/u e-cases/detect-and- top-dataexfiltration.htm!

© 2017 Erik Van Buggenhout & Stephen Sims

39

Course Roadmap
Day 1: Knowing the adversary, knowing yourself Day 2: Averting Payload Delivery Day 3: Preventing Exploitation Day 4: Avoiding Installation, foiling Command & Control & thwarting lateral movement Day 5: Exfiltration, Cyber Deception & Incident Res onse Day 6: APT Defender Capstone

SEC599.5
· Data exflltration Typical data exfiltr11tion strategies Exercise: Detecting data exfiltration using Suricata Cyber deception strategies Tricking the adversary Exercise: Making your honeypor irresistibty sweet Leveraging threat intelligence Defining threat intelligence Exercise: Leveraging threat intelligence with MISP & Loki Patrolling your network Proactive threat hunting strategies Exercise: Hunting your environment using OSQuery / ELK Incident re11ponse Incident response process Exercise: Responding to an incident using GRR

SANS

.- ·

.

This page intentionally left blank.

40

© 2017 Erik Van Buggenhout & Stephen Sims

Exercise - Data Exfiltration Using Suricata
IThe objective of the lab is to detect data exfiltration taking place in our environment. As data exfiltration is a tricky subject, we will illustrate different methods to try detecting exfiltration.
High-level exercise steps: 1. Detect credit card information that is sent out in clear-text using Suricata; 2. Detect confidential data that is mailed to recipients outside of the
organization using Suricata; 3. Using ntop-ng to detect excessive data volumes being uploaded.
SAN~
Exercise - Data Exft.ltration sing Soricata The objective ofthe lab is to detect data exfiltration taking place in our environment. As data e filtration is a tricky subject, we will illustrate different methods to try detec.ing exfiJtration.
As part of the lab, the following data extiltration methods wil l be di cussed:
· Credit card infonnalion that is sent out in clear-text; · Confidential data that is mailed to recipients outside of the organization; · Volume-based analysis fo r exfiltrated data. We will rely on uricata's fD rule generation for the first two scenario's, while we will use PfSense 's ''ntopng'' package to detect excessive data volumes. For additional gu idance & detail on the lab, please refer LO the LOOS workbook.

© 2017 Erik Van Buggenhout & Stephen Sims

41

Exercise - Data Exfiltration Using Suricata - Conclusions
Throughout this lab, we used Suricata to detect data ex:filtration based on different types of indicators:
1. We created IDS rules with a specific regular expression to look for particular data· 2. We created lDS rules that matched a specific string we're interested in; 3. We analyzed outgoing data to detect increased upload volumes, as thi could indicate
data is being exfiltrated out of the network.

It's important to note that data exfiltration is a tricl<y subject Due to the myriad of options available to the adversary, prevention is nearly impossible without creating air-gapped network zones. We do have an opportunity to be creative to detect exfiltration taking place, which will require good overall hygiene (data classification) & network baselines (normal traffic volumes).

- ~,,~N"' - - -
l" Jllit}
--

-~----- --- --

-

-

-c_

---

-

·

- --_ -_ - .;_-- . . - _--.-:-:-.-:-._~ _---:;.,

-

.·:,·.t.i '.:__ ·~·~- ;... _., .. ·-.i.~--.··... ·,

-

-

·

- -~ -

- -- -

--- -

---

-

~

Exercise - Data Exfiltration U ing uricata - Conclusions Throughout this lab, we used uricata to detect data exfiltration based on different types of indicators :
1. We created ID rules with a specifi regular e 'pre ion to look for particular data; 1. We created IDS rul s that matched a pecific string we're interested in; 3. We analyzed outgoing data to detect increased upload volumes, as this could indicate data is being
exfiltrated out of the network.
It's important to note t:hat data exfillration i a tricky object! Due to the myriad of option available I the adversary. prevention is nearly impossible without creating airgapped network zone . We do have an opportunity to be creative to detect exfiltration taking place, which will require good overall hygiene (data cla sification) & network baselines (normal traffic volumes).

42

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
· Day 1: Knowing the adver ary, knowing yourself Day 2: Averting Payload Delivery Day 3: Preventing Exploitation Day 4: Avoiding Installation, foiling Command & Control &thwarting lateral movement
· Day 5: Exfiltration, Cyber Deception & Incident Response Day 6: APT Defender Capstone

. SANS

-

SEC599.5
Data exfiltra.tlon Typical data exfiltration strategies Exercise: Detecting data exfiltration using Suricata
Cyber deception strategies Tricking the. adversary Exercise: Making your honeypot irresistibly sweet
Leveraging threat: intelligence Defining threat intelligence
Exercise: Leveraging threat intelligence with MISP & Loki Patrolling your network
Proactive threat hunting strategies
Exercise: Hunting your erwironmenc using OSQuery I ELK
Incident response Incident response process Exercise: Responding to an incident using GRR
. ·

Th.is page intentionally left blank .

© 2017 Erik Van Buggenhout & Stephen Sims

43

The Asymmetry Between Attack and Defense
We discussed many detection and prevention methods and techniques to protect our corporate environment against advanced adversaries, however, is this enough?
I Because of their size and complexity, corporate IT environments will always contain some vulnerabilities, an (advanced) attacker just has to find the right vulnerability in one system to start compromising the corporate network.
I A team of advanced, persistent attackers with enough resources will be able to intrude a corporate network.. Our defenses ultimately aim to slow down these attackers and detect their activities . . .
I If we would be able to tempt the intruders to increase their activities in our network, our chances of detecting this would increase tool

The Asymmetry Between Attack and Defense rn the preceding days and chapter , we discussed many detection and prevention methods and techniques to protect our corporate environment against advanced adversarie .
Unfortunately for us, because of their size and complexity, corporate IT environments will always contain some vulnerabilities. Comple systems always contain errors, lT environments are certainly not different, quite to the contrary. Error are not always vulnerabilitie that can be exploited, but we certainly ha e to
manage vuln rabilities in our systems.
An (advanced) attacker just has to find the right vulnerability in one system to tart compromising the corporate network. Finding one crack in a system or environm nt is enough to give them a stait that can ultimately lead to full compromise by exploiting a cliain of vulnerabilities and/or mu.configurations.
While we, as defenders, have to protect all our sy terns and mitigate all vulnerabilitie . lfwe miss one type or vu lnerability or have one sy tern that is not properly protected, it can be all it takes to get an adversary to compromise our environment.
This is called the asymmetry behveen attack and defense, we an ov rsimplify this lu:
· Attacker: find I weakness
· Defend r: mitigate all weakne ses
The asymmetry between attacker and defender is what makes defending the corporate IT infra tructure a resource-intensive job.
Because defenders have to defend more systems than attackers ne d to attac . defender need Lo be in greater nwnbers or have more resources than the attackers to have a chance at properly defending the corporate network.

44

© 2017 Erik Van Buggenhout & Stephen Sims

A team of advanced persistent attackers with enough resources will alway be able to intrude a corporate network, no matter how much resources we have to defend the corporate network.
A Bruce Scbneier puts it:
'Attacks always get better they never get worse".
This means that over time, attacks improve and defense have to keep up, otherwise attackers will succeed. And becau e of the asymmetry, keeping up for defenders costs more than improving for attackers. ,.... Our defenses ultimately aim to low down these attackers so that we have a better chance at detecting their activities.
Ifwe would be able to tempt the intruders to increase their activities in our network, our chances of detecting this would increase too: that is the premise behind "tricking the adversary' .

© 2017 Erik Van Buggenhout & Stephen Sims

45

Tricking the Adversary (I)

ill/1\[1· 11omrnB1
IKali: "The quieter you become, the more you are able to hear"
ISECS99: 'The noisier you become. the more they are able to hear you"

I We want the adversary to make more "noise" (e.g. generate more alerts). We will achieve this by tricking the adversary
I We trick the adversary by employing decoy systems and data. Decoys have no real value to our corporation
I We closely monitor decoy systems and data for any unusual activity

-

SA~

-··

Tricking the Adversary (1) Kali Linu is a well-known Linux distr1butio11 tor penetration testers.
lts moto i :
"The quieter you become, the more you are able to hear'·
As a moto to "tricking the adversary", we will use:
"The noisi r you become the more they are able to hear you'
By tricking the adversary, we want him to make mistakes that will produce noise (events) that we can detect. The idea behind "tricking the adversary" is that we want the adversary to make more ·noise".
The adversary wants to be as quiet as possible in our networks and systems (e.g. not generate events and certainly not alerts), o that we will not detect them and that they have more time to perfonn their malicious deeds. We want the adversary to make more ''noi e", e.g. generate more alerts, and we will achieve this by tricking the adversary.
The way wi ll achieve thi. ''tricking ofthe adversary'', is by deploying and using decoy systems and data. Decoys are fake systems and fake data . They have no real value to our corporation. We try to make these decoys enticing to the attackers so that they will find and try to compromise these systems and access this data. This will not only slow down the attackers by having them waste their time on ystem and data that has no
real value, but we will also clo ely monitor decoy sy terns and data for any unusual activity.
This enhanced monitoring activity for decoys is our trap: the snare with which we hope to catch attacker !

46

© 2017 Erik Van Buggenhout & Stephen Sims

Introducing ADHD -Active Defense Harbinger Distribution
ACTIVE DEFENSE HARBINGER 0ISTRll3UTION
https://www.blackhillsinfosec.com/projects/adhd/
ADHD is a Linux distro based on Ubuntu LTS. It comes with many tools aimed at active defense preinstalled and configured. The purpose of this distribution is to aid defenders by giving them tools to "strike back" at the bad guys. With regards to "striking back": be careful not to violate any laws or regulations.
SANS
Introducing ADUD - Active Defense Harbinger Distribution Cyber deception strategies are often used as pa1t of an overall "Active Defense" strategy, where defenders are trying to defeat adversarie by actively engaging them using Lricks & dedicated systems set up. An interesting toolkit for active defense is ADHD (Active Defense Harbinger Distribution). ADHD is a Linux distro based on Ubuntu LTS. It comes ~ ith many tools aimed at active defense preinstalled and configured. The purpose of this distribution is to aid defenders by giving them tools to "strike back'' at the bad guys. With regards to "striking back": be careful not to violate an laws or regu lation . We will not go th.rough the entire ADHD tool uite during this course, but we will, for example, use Honey Badger during an upcoming xercise. You can find more infonnation on ADHD here on https ://www.blackhillsinfosec.com/project /adhd/.

© 2017 Erik Van Buggenhout & Stephen Sims

47

What Are Those Decoys You Tall< About?
When attackers find our enticing decoy systems and data, they will not realize (at first) it is a decoy. They will believe they are real corporate assets, and will try to compromise or steal them
Since these are decoy systems, corporate users are not expected to interact with these systems. Any user or system that does interact with a decoy is suspicious, and should be further investigated

SAN~

· ,· _ : ·

· -·~

What Are Tho, e Decoys ou Talk About?
It should not be obvious that a decoy system is a decoy and not a real system, although not too rnucn time and
effort should be made to make a decoy ystem look ljke a real system.
When attackers find our enticing, decoy systems and data, the will not realize (al first) it i a decoy. That's why it is important that it is not obviously a decoy system, otherwise, the attackers will not be slowed down or tricked into generating alerts.
They will believe that the decoy systems and data are real corporate a sets, and ifwe make them look like
valuable corporate asset , attackers will try to compromise or steal them . Disguising a decoy as a valuable corporate a set requires subtlety, we don' t want to make it too obvious that it is very valuabJe, otherwise lh
attacker might become suspicio ll . The examples we give here in this book are often too obvious, but that is to make the point clear.
Since these are de.coy systems and data, corporate users are not expected to interact with these sy terns or access this data.
Any user or ystem that does interact wjth a decoy is suspicious and should be further investigated. It will , of course, happen that users will discover these as ets and try to access the e. We will con ider these alerts as false positive but nevertheless, it hould be pointed out that these users should be talked to ju t to figure out why they wanted to access these y tems or data.

48

© 2017 Erik Van Buggenhout & Stephen Sims

Tricking the Adversary (2)

We will focus on two types of decoys: the honeypot and the canary

Honeypot

Canary

A honeypot is a system that looks valuable to the adversary, but has no real value to the corporation. Interacting with a honeypot triggers alarms. Honeypots are a very old concept, that predates computer systems.

A canary is data that looks valuable to the adversary, but has no real value to the corporation. When a canary is used, alarms are triggered. Canaries too are a very old concept, that predates computer systems.

SANS
Tricking the Adversary (2) The two types of decoy we will focus on in thi chapter are:
· The honeypot · The canary
A honeypot is a system that looks valuable to lhe adversary but has no real value to the corporation. Interacting with a honeypot triggers alarms. Honeypots are a very old concept, that predates omputer systems. The have been used by hunters and so ldiers to ambush the adver ary.
A canary is data that look valuable to the adversary but has no real vaJue to the corporation. When a canary is u d, alarm are triggered. Canaries too, are a very old concept, that predates computer systems. They have been used by hunters and oldiers to find the adversary .

© 2017 Erik Van Buggenhout & Stephen Sims

49

History of the Honeypot

· 1990/1 Books: "The Cuckoo's egg" and "An evening with Berferd

· Use deceptive techniques to catch a hacker

l.o E: mfll "11b !krtord lr, Which~ (:,ad;..,-\. r-d.· otlW'NI. at1il ludl I

· 1998 - the Deception Toolkit
· Fred Cohen, first publicly available honeypot

UIUC.:lk>·kt. 0/lild ti.UL;obon<.,._

· 1998 - CyberCop Sting
· First commercial honeypot

History of the Honeypot The idea of honey pots began in 1991 with two pubIications, "The Cuckoo Egg" and "An Evening with Berferd". "The Cuckoos gg' by Clifford Stoll was about his experience catching a computer hacker that was in his university searching for secrets. The other publication. "An Evening with Berferd'' by Bill Cheswick is about a computer hacker's moves through traps that he and hi colleagues used to catch him . Both of these writings were the beginnings of what became honeypotS.
The first type of honeypot was released in 1997 called the Deceptive Too lkit. The point of thi s kit was to use deception l'o attack back. In 1998 the first commercial honeypot came out. This wa called Cybercop Sting.

50

© 2017 Erik Van Buggenhout & Stephen Sims

The Honeypot
A honeypot is a decoy system that looks enticing to adversaries. They are designed to attract attention, so that adversaries will try to interact with them. This interaction can be normal usage or attacks to the operating system or services of the honeypot.

Technically, a honeypot can take many forms:

111 It can be a single decoy (simulated) service on a computer with a real operating system
I I It can be a computer with many decoy services and just a basic operating system

It can be a Linux system simulating a
Windows system
m It can be a real computer system with deliberate vulnerabilities

Use your creativity!The "perfect honeypot" is likely specific to your organization!

The Honeypot A honeypot i a decoy system that looks enticing to adversaries. They are designed to attract attention o that adversaries will try to interact with them. TI1is interaction can be n rmal usage or attacks to the operating s stem or services of the honeypot.
The name honeypot refers to children tales of bear liking honey: bears like honey, and they will go the
extraordinary length to obtain honey from bee nests. A honeypot i the ultimate attraction for a bear: it' s a
container filled with pure honey, ready to be consumed.
Technically a honeypot can take many forms: · It can be a ·ingle decoy (s-imulated) service on a computer with a real operating sy tem: we just install a
computer with a normal operating system and install a service on it to attract adversruies. Thi can be a real service like a webserver or a program that simulates the basic features of a webserver. · It can be a computer with many decoy services and just a basic operating sy tern: we can install an operatillg system with the minimum amount of services. and then replace those service with decoy ervices. · It can be a Linux ystem simulating a Windows system: for example, we install SAMBA and configure ii to re emble a Windows file erver as closely as possibk. · It can be a real computer system with deliberate vulnerabilities
Don't forget to use your creativity! The "perfect honeypot" will most likely be ciifterent from organization to organization. If you want to catch targeted attacks, you should do more than just setting up a "generie" honeypot! Think about your crown jewels and make omething that actually lo ks like that!

© 2017 Erik Van Buggenhout & Stephen Sims

51

Key Factors for a Successful Honeypot
So... How do you set up a good honeypot? Here are a few items to consider when deploying your own honeypots:
Make it look. enticing to the adversaries, for example by assigning them a server name
that "reveals'' their Importance as an asset, like "payment-processing".

Make sure it's a. dedicated system that is used by normal users: we don't want alerts because normal users access a honeypot. If it alerts, it should ALWAYS be suspicious!

Make sure you understand the ho neypot internals and ensure it cannot be used by adversaries to pivot to other systems! It should NOT contain any actual assets.

SANS

As the goal is to understand how adversaries operate, we need to implement extra logging and alerting capabilities that are closely monitored.

- - ..

-

-

Key factors for a Succe sful Honeypot We use honeypot to trick the adversary: we want the honcypot to be discovered by an adversary and that i looks enticing so that the adversary will try to interact with it. 8 interacting with it, we detect the presence of adversarie in our corporate infraslru ture_
.To achieve these goals, it i important that honeypots: Loo enticing to the adversaries for exampl by assigning them a server name that "reveals" their importance as an asset, like "payment-processing". Honeypots have to be discovered by the adversaries when they search through our networks, and by assigning them enticing names. we t,y to increase the chances that adversarie will try to access them . But this must not be 0¥ rdone, otherwise, the attackers will know it is a honeypot. Fore ample, ifyou call our honeypot server "super-secret-file-server", that's probably overdoing it.
· Are not used (interacted with) b_ nonnal user : we don ' t want alerts because nom,al user try to access a
honeypot. Honeypots should not have anything on th m that normal u ers would need to use. We want to
avoid false positive alerts as much as possible. That said, if a normal user does access a hone pot. it should
. be investigated. Have extra monitoring and alerting capabilities that are clo el_ monitored. Honeypots should onl generate alerts when adversaries access them, therefore, all alerts should be inve;:stigated. hould not contain corporate assets: we do not want to attract adversaries with real corporate assets like data and confidential document . If you want to make a hone pot more enticing with documents, use fake
. confidential documents. Should not be able to be used by adversaries to pivot to other systems: particular care houJd be taken that a honeypot does not contain tools and ervices and has a cess lo other systems so that it can be u ed a a pivot.

52

© 2017 Erik Van Buggenhout & Stephen Sims

Some Example Honeypots - Simple Decoy Administrative Website

Setting up a honeypot doesn't have to be a lot of work. .. As an example, you could just create a normal server with normal webserver software on it, and then create a fake website that simulates an administrative tool starting with a login page:

L l:'1 p,111., Log in

This is a honeypot that can be created without requiring specialized honeypot software

Every attempt to login raises a n alert and should be investigated
As a bonus, you could include HoneyBadger's code to b·ack all visits to the website!
SANS
Some Examples Hone pots - Simple Decoy Administrative Website In this example, we create a honeypot with a decoy administrative web ite.
We can create such a honeypot without having to use special ized honeypot software.
To ach ieve thi · we just install a normal server with an operating sy tern and a webserver service,
On this web erver we create a couple of web page.. The first web page i a page that announces the website as a corporate administrative web ite and provides a login screen,
he login screen asks for credentials: a potential user ha to type in a usemame and a password. Ifyou u e an authentication service in your corporate environment that allows single-sign-on (like ctive Dir ctory), tbi honey pot webserver must be configured so that single-sign-on is disabled: we don't want automatic login attempts when a user visits this page.
The layout of this first page of the honeypot should be made to attract advanced adversaries and entice th m lo try 10 logon to the v ebserver (with redentials they tole for examp le).
'n1e webserver has to be configured to raise an alert for every login attempt, and these alerts should be mve tigated. This i a honeypot. it does not contain corporate data or services, normal users should not use it. We only expe t adversarie to try to use this webserver. As a bonus, you could include Honey Badger' s code to track all visi ts to the website!

© 2017 Erik Van Buggenhout & Stephen Sims

53

Some Example Honeypots - HoneyBadger (ADHD)

. .
.., .

. -

f 1, Badger

SA1~S

HoneyBadger is part of the ADHD framework. It consists of a part of source code that can be added to an existing web site, which will track visitor IP addresses & automatically perform GeolP
localization. It comes with a
centr-al admin im.erface for easy management & followup!
We will use it in an upcoming lab!
· · : · ··

Some Exam ple Hooeypots- HooeyBadger (ADHD)
I· the previous slide, we di cussed setting up a fake administrative web page to lure adversaries 10 attempt
authentication. But how we can effectively follow up on visits? We could implement our own piece of tracking code, but there are many frameworks already available for this purpose!
An interesting application to do this is "Honey Badger". HoneyBadger pro ides an easy-to-use olulion, it is part of the Active Defense Harbinger Distribution (ADHD). H consists of two core components:
· A part of source code that can be added to an e ·isting web site, which will track visitor IP addresses &
automatically perform GeolP localization; · A central management consol where you can follow up on ''beacons"
You can find more information on HoneyBadger on http://adhdproject.github.io/#lTools/HoneyBadger.md. We will use it in a11 upcoming lab!

54

© 2017 Erik Van Buggenhout & Stephen Sims

Some Example Honeypots -Artillery (ADHD)
Another interesting honeypot system that is part of ADHD is Artillery.Artillery was developed byTrustedSec I Binary Defense. From its official web site, we have the following
features available:
''The purpose ofArtillery is to provide a combination of honeypot, file-system monitoring, system hardening, reol-time threat intelligence feed, and overall health of a server monitoring-tool; to create a comprehensive way to secure a system."
A few practical use cases for Artillery include: Creating listening honeyports" on the network interface; Based upon activity towards these "honeyports", automatically ban violating IPs· Monitoring the file system for changes;
Artillery should be deployed as a "honeypot add-on" to existing servers!
SAN~
Some Example Honeypots -A rtillery (ADlfD) Another interesting honeypot system that is part of ADHD i Artillery. Artillery was de eloped by TrustedSec / Binary Defen e. From its official web site, we have the following features available:
"The purpose ofArtille,y is Lo provide a combination ofhoneypot. flle-sy ·tem monitoring, system hardening. real-time threat intelligence feed. and overall health ofa server monitoring-tool: to create a comprehensive waJ to secure a system. "
You can find the official documentation here: http://adhdproject.github.io/#!Tools/Artillery .md
Artill ry is not your typical honeypot system as it wasn t designed to be a "standalone-honeypot''. Instead, it should be added to a high-value target server that it can protect. A few practical use ca es for Artillery include:
· Creating fake listening ports on the target server ( o-called "l-loneyport "); · Upon activity towards these fake ports. it can automatically alert and ban violating IP addresses; · Monitor the file system of the target server for changes lo important files.

© 2017 Erik Van Buggenhout & Stephen Sims

55

Some Example Honeypots - Kippo Fal<e SSH
Kippo is a Python program that simulates a SSH server, it is not a real SSH server that gives access to the server. Additionally, Kippo simulates the Linux shell obtained after a successful login.

I Kippo will log all activities, and these can be replayed to see what the attacker did

I Actual commands are not executed: for example, Kippo will download files for the attacker, but not execute them

-I,

I If will fake malfunctioning when executing a downloaded file

Kippo is one of the most well-known honeypots out there. A newer evolution (based

upon Kippo) is ·cowrie , which is developed by Michel Oosterhof

(https: //github.com/micheloosterhof/cowrie). Cowrie is also part of ADHD!

-

SANS

:.··.... ,.

'

-

-

I

Some Ii:. ample Honcypots - Kippo Fake SSH In thjs second honeypot example we implement a fake 'SH service.
This can be done witb Kippo: Kippo is a honeypot service that simulates an SH ·erver. It i written in Python it is not a real SSH server that gives access to the server.
Kippo can be install d on a normal ·erver, and we recommend u ing th normal H port (port 22) for Kippo. This means that to use Kippo on a Linux machine, the real SSH service should be put on another port or disabled. Kippo should also be able to run on a Windows machine, but this i onl_ recommended if you have SSH ervers running on your corporate machines. Otherwise, a ingle Windows machine with SSH server wil I stand out to the attackers, and they could realize that this is, in fact, a honeypot.
After a user logs on to Kippo via the normal SSH logon procedure, the user will be presented with a classic
Linux command-I in shell. This i not a real shell (ba h for xample), but it is imulated by Kippo.
The commands Lhat are typed by the user are also simulated by Kippo, o make it look like a real shell. For e ample, the attacker can issu a wgel or curl command to download his attack tools on the server. Kippo" ill simulate this by effectively downloading the fi les and storing them for la.tt:r review by the Kippo administrators.
Kippo will imulate the presenc of the downloaded file in the current dire tory , but when the attacker tries to nrn the tool he downloaded, Kippo will not execute the tool but present an error message that tries to persuade th attacker that the fil was corrupted during the download.
Kippo will log all a tivities, and these can be replayed to see what the attacker did. For use a a honeypol in our corporate network, Kippo must be configured to raise a!ens wben logons are perfonned.
Kippo is one of the most well-known honeypots ottl there. A newer evolution (based upon Kippo) i "C wrie'' which is developed by Michel Oosterhof (http ://github.com/ micheloosterhof/cowrie).

56

© 2017 Erik Van Buggenhout & Stephen Sims

Summary - Honeypot Projects

.C.11111111

Many free and open-source honeypot applications exist that are available for download. It should however be noted that many of these are outdated and no longer being maintained (examples include Nepenthes & Dionaea).
Commercial offerings are often more up-to-date and provide the added benefit of continued support & updates (mostly focused on canaries though).

https: / / github.com/paralax/awesome-honeypots (excellent overview ofhoneypot projects)

Note that most of these honeypots (both commercial & open-source) are generic and thus don't provide tailored features that make them "very" useful for detecting targeted attacks. A subtler approach can be the creation of canaries.. .

Available Aoneypot Projects There are a lot of free and open- ource honeypot applications available for download. Not all of them are properly designed and safe to u e in a corporate environment.
Many of these open-source honeypot applications are outdated or no longer maintained. Research into honeypots and development ofhoneypot applications was popular when Lance pitzner published his book ' Honeypots : Tracking Hackers" in 2003, but over the years interest has faded a bit. This has resulted in many open-source honeypot project being abandoned or no longer actively maintained. xamples of these are the well-known epenthes and Dionaea open-source honeypot . These days, commercial honeypot offerings are more up-to-date, we will see this when we discuss canaries.
An interesting overview of current honeypot projects can be found at https://github.com/paralax/awesomehoneypots.
Many orthese honey pots are not suitable for our purposes: they are designed as "research" honeypots, to research new rnalware and nev zero-day exploits. They are not designed with corporate attackers in mind. Furthermore, most of these honeypots (both commercial & open-source) are generic and thus don 't provide tailored features that make them "very" u eful for detectin'-' targe::te::<l allack,s. A subtler approach an be th creation of canaries ...

© 2017 Erik Van Buggenhout & Stephen Sims

57

Introducing Canaries

A canary is decoy data that looks enticing to adversaries. The name canary refers to the canaries used in coalmines to alert miners for poisonous gas emanations. We place canaries in places where they can be found and accessed by our adversaries when they search through our corporate assets. Interacting with a canary will trigger an alert.

Canaries can take many different forms, some examples incJude:

C ] A document. possibly rigged with an alerting system when opened

a

A user account (typically a fake administrator), never to be used

Unique passwords inside a database
Fake domain hashes can be inserted in the LSA process (''HoneyHashes'')

Introducing Canaries Another popular method to trick adversaries are canaries. A canary i decoy data that looks enticing to adversaries. We place canaries in places where they can be found and accessed by our adver arie when they search through our corporate assets. Interacting with a canary will trigger an alert. The name canary refers to the canarie used in coal mine to alert miners for poisonous gas emanations.
Canaries can take many different forms, some examples include: · A document, possibly rigged with an alerting system that generates an alert when opened · A user account (typically a fake administrator), that is never to be used by corporate staff · Unique passwords inside a database that are never used a real pas words · Fake domain hashes can be inserted in the LSA process ("HoneyHashes")
We will discuss a few of these techniques in the next few slides and use them in a few labs.

58

© 2017 Erik Van Buggenhout & Stephen Sims

Some Example Canaries - Fal<e Administrative Account

As we all know, the Active Directory is the central point in most organization environments from which crucial security functions take place. While moving through the network. adversaries will query the Active Directory to find interesting user accounts ... This opens an opportunity for us!

I I
SANS

We create a user account in Active Directory that looks enticing, for example "BackupAdmln''
We assign a minimum of privileges to this
account, without any administrative powers

I I

SomeWhere on the Intranet (Wiki), we leave a page with administrative commands and the
credentials for this account
We configure alerting when events are created for this user account

Any use of this account is suspicious and should be investigated!

Some Example Canaries - Fake Administrative Account As we all know, the Active Directory is the central point in most organization environmen from wbich crucial security functions take place. While moving through the network, adversarie , ill query the Active Directory to find interesting user accounts ... Thi opens an oppottunity for us!
We can create a canary by adding a user account in Active Directory that look enticing to our potential attackers, for example. BackupAdmin or any other account name that might look important in your corporate environment and would be attractive to attackers to compromi e.
!though the metadata of this account (like the account name) should indicate that it is an administrative account. we do only assign a minimum ofpri ileges to this account, without any admini trntive powers. This account is designed to be compromised: when it is compromised, we don't want to provide an advantage to our attackers , hen they use this account. Using this account mu t alert us it must not be possible to le erage this account.
We configure alerting when events are created for thi user account: whene er thfa account is used (for example logon attempts). we want to be warned. We do this by configuring alerts in our monitoring ystems each time ev nts are created by Window for this particulaT account.
To increase the chance that attackers will try to use this account. we can plant information on our corporate systems to entfce attackers. Forexampl , somewhere on the Intranet (Wiki , we leave a page with administrative commands and the credentials for this account.

© 2017 Erik Van Buggenhout & Stephen Sims

59

Some Example Canaries - HoneyHash
In 2015, SANS Instructor & ISC Handler Mark Baggett WTote an interesting diary post on "Detecting Mimikatz Use On Your Network . The technique he describes involves the creation of fake hashes ("honeyhashes") in the LSA process memory.
As we all know, Mimikatz is a highly popular tool that is being used both by penetration testers I red teamers and real adversaries. One of its key functions is to
dump password hashes belonging to authenticated users from the LSA process
memory.

This technique has been further developed and as part of the Empire framework, a "NewHoneyHash.ps1" PowerShell script was created, whjch allows for the creation of fake hashes in the LSA process memory!

Original post: https://isc.sans.edu/Jorums/diary/Detecting+Mimikatz+Use+On +You r+Network/19311/

SAN~

._ .

-

-

'

Some Example Canaries - HoneyHash In _Q 15 , SAN Instructor & ISC Handler Mark Baggett wrote an interesting diary post on '' Detecting Mimikatz Use On Your etwork". The technique he describes involves the creation of fake hashes («honeyhashes ') in the LSA proce memory. You can read Mark's original JSC diary post here:
Original pas/: htlps://isc.sans.edulfonims/dia,y/Deteciing+Mi,nikacz+Use+On +Your +Network/ 193 I II
As we ' ve een during day 4 of this course, Mimikatz is a highly popular tool that is being used both by penetration testers / red teamers and real adversari s. One of its key function is to dwnp password hashes belonging to authenticated users rrom the LSA process memor . The idea here i , of course, to trick adversaries using Mimikatz by providing them with fake hash s for accounts that don't acrually e ist. We can then monitor attempted use of these credentials. Note that this attack technique wilt not only trick Mimikatz but also other tools that attempt to extract pa sword hashes from memory.
This technique has been further developed and as part of the Empire framework. a·' ew-Honeyl-lash.ps I'' Power hell script was created, which allows for the creation of fake hashes in the LSA process memory!

60

© 2017 Erik Van Buggenhot.lt & Stephen Sims

Some Example Canaries - Fake Documents

A second example of a canary is much easier: creating a fake confidential document. The idea this time is to create an attractive document that adversaries would like to steal. This time, however, we have to take into account that the document could leave our environment ...

I I

We create a document that looks enticing, like
confidential-project-planni ng-v I.doc
We add a unique string to this document, for which we configure Google alerts

I I

We addVBA macro code co this document that will issue a web request with this unique string to a webserver under our control
We add alerting to the logging of the web or DNS server

Any interaction with this document should be investigated!

Example - Fake Confidential Document A second example of a canary is mucl1 easier: creating a fake confidential document. The idea thi time is to create an attractive document that adversarie would like lo steal. This time, however. we have to take into account that the document could leave our environment. ..
In our example, we create a Word document, but canarie of this type can also b created with other formats,
for example, PDF:
I. We creat a Word document wi1h a name that looks enticing, like conftdential-project-planning-v I.doc. 2. ext, we want to generate alerts whenever this document is copied or acces ed (for example, when it is
opened). We can achieve this by adding a unique string to this document (fore ample, corporate as et JDE0345H D), and then we configure alerts when we ee content with this string moving inside our network or even appearing on the Internet.
Alerts for movement inside our network can be done with ID for example, we create a simple rule to alert whenever the string JDE0345H Dis found . This rule should certainly be implemented in the ID s on the perimeter of our corporate network so that we are alerted when this canary do ument is exfi ltrated.
We can also configure Google alerts (or other alerting service ) whenever this string is found on a page on the Intern t (and of course, indexed by Google . For example if the content of this document would appear on paslebin we: want an alert.
3. Finally, we add YBA macro code to this document that will issue a web request with this unique string to a, ebserver under out contTol whenever the document is opened. We add alerting to the logging of the webserver so that we are alerted whenever this request is made to the webserver.
Other methods beside VBA macro exist, for example templates or embedded, linked objects.

© 2017 Erik Van Buggenhout & Stephen Sims

61

Canary Products

The research into canaries and offer of software and services to support canaries is currently more active than for honeypots. Canaries are currently at the forefront of ''deception technology" and we see many open-source & commercial projects popping up!

') CANARY

a JAVELIN

There are several free and commercial offerings that are up-to-date and maintained
We will discuss two such products: · Canarytokens / Thinkst Canary
· Javelin AD IProtect

SA~S

...,, · - -,

_

-

.

Canary Products The research into canaries and offer of software and services to support canaries i0 currently more active than for honeypots. Canaries are currently at the forefront of·'deception technology' and we see many open-source & commercial projects popping up!
There are several free and commercial offerings for canaries that are up-to-date and actively maintained.
We will d iscuss 2 product : · Canarytokens / Thinks( Canary · Javelin AD)Protect
Canarytokens is a free service offered by Thinkst to create canaries and be alerted whenever these canaries are used. Several types of canaries can be created. Thinkst Canary is Thinkst's commercial offering for canarie .
ot only do they provide canaries, but also honeypots.
Javelin ADIProtect is a commercial canary applicatjon for Active Directory. When deployed, it will create differ nt types of canaries in ide your corporate Active Directory infrastructure and alert ou when these canaries are used by attackers.

62

© 2017 Erik Van Buggenhout & Stephen Sims

Introducing CanaryTokens (byThinkst) (I)

Canarytoke.ns by Thin st

~ · I ·i

'1

C..I

---

Canarytokens is a free service offered by Thinkst for the creation and monitoring of canaries.

Canarytokens can
create many different types of canaries. not only documents but also email addresses for example.

Wt>b bug / URl IOi»n
Unl~u~ otl\.l,I ·ddnlH Custom 1""'!111 Webb~ M.cro1ot· WOid Ooc:ument

Introducing CanaryTokens (by Thinkst) (1) The screenshot above (left) shows the free Canarytokens service as it is provided by Thinks!.

This page can be used to create your own, personalized canary together with the data necessary to alert you whenever this canary is used.

First, you have to select the type of canary you want to reate. Man types are possible, varying from documents to account to email addre ses, we will discuss this on the next page.

Then ou have to provide an email address or URL. This will be used to alert you whenever your canary is accessed. When your anary is used by attackers, an event will be ent to the Canarytokens er ers. This is typically a web request or a D S name resolution. When the Canarytokens servers get this particular event for your canary, they will alert you via the email address or URL ou provided.

A you can create many canaries with anarytokens, you are also given the option to provide a reminder note that will help you remind why you created this particular canary. Thi reminder note will be included in the alert you receive from the Canarytokens servers.

Tricking the adversary Here we can see a partial list ( creenshot right) of the type of canaries you can create using the free Canarytokens st:rvicc.

Canarytoken can create: · Web bug · DNS tokens · Email addresses · Custom images · Word documents
· PDF documents
· Windows folders

© 2017 Erik Van Buggenhout & Stephen Sims

63

· Custom EXEs · Canary for cloned website · QL server
· QR code
· SYN · AWS keys
Whenever one of these types is used, you will receive an alert.

64

© 2017 Erik Van Buggenhout & Stephen Sims

Introducing CanaryTokens (by Thinkst) (2)
Acrobat Reader PDF Docllmenl alen@sec59~.com Canary PDF opened!

Here we create a PDF document as canary.
We just have to provide and email address and a message. and then we can create the PDF document.
Whenever this document is opened, we will receive an email from Canarytokens.

SANS
Introducing CanaryTokens (by Thinkst) (2) This is the page you will see when you have completed the fields for the canary you want to create with Canarytokens.
In this example, we create an Acrobat Reader PDF document with a canarytoken that \i ill send an email to address alert@sec599.com whenever the PDP document is opened.
The reminder note "Canary PDF opened!" will be included in the email when an alert is triggered.
By clicking "Create my canarytoken", the PDF i created and available for download, and entries will be created in Canarytokens database to alert you.
The method for PDFs is tht: following,: the PDF that is created by Canarytokens contains a unique URL that is automatically requested whenever the PDF is opened with Adobe Reader. The u er will be warned and asked for authorization to execute tbe web request. however, the DNS request for the domain included in the URL will be issued without any warning. Canarytokens servers will receive this unique DNS request and alert you vi a email.

© 2017 Erik Van Buggenhout & Stephen Sims

65

'
Introducing CanaryTokens (byThinlcst) (3)

Thinkst Canary has a commercial honeypot solution, that allows you to create and deploy honeypots in your corporate infrastructure like Windows file servers, Linux web servers ...

SA~

Thinkst Canary is the commercial offering ofThinkst. Next to honeypots described above. another advantage it has when compared to the free CanaryTokens service is that it allows you to configure a canary architecture that does not rely on the infrastructure set up by Thinkst, thus, offering increased confidentiality!
·

Introducing CanaryTokens {by Thinkst) (3) Canarytokens is a free service and as such has limitations that can impair its use by a large corporation.
For example, corporate client will want: · more options for alerting than email and URL · SLAs to guarantee a certain level of service · Strict confidentiality: with Canarytokens, the alert are processed by Thinkst's servers
These requir ments can be accommodated by opting for a commercial solution. Thinkst Canary is the commercial offering ofCanaryi..ok ns, and this will, for example, allow you to host your own alerting servers so that you don t have to rely on Thinkst and that they are aJso not aware of potential breache .
Think.st Canary not only offers caJiaries like Canarytokens but also honeypots.
Thinkst Canary has a commercia l honeypot solution, that allows you to create and deplo honeypots in your corporate in fra. tructure like Windows file servers, Linux web servers, ...

66

© 2017 Erik Van Buggenhout & Stephen Sims

Introducing Javelin

vVben AD IProtect is deployed in your corporate environment, it will create different types of canaries
inside your corporate Active Directory infrastructure and alert you when these canaries are used by
attackers.

Wlll''I ..1 few QtJt-,,~~ to th" ActwlP'
0,1 eclory .t th~ po,nl or brt-ach,
fn ott·cker cdn obt..ion all 1nlorrnat1on to ove throughout the ropo 09y
0 I Prot~ct control$ he
Hlacke··s pitnpectr,e an~ 0ro ·ides ~1s,t>lllt1 to Oar Corr>ers U'lit tht at tac Pr fdvoi

Javelin AD I Protect is canary
software that is deployed on Active Directory Domain Controllers.
When attackers query Active Directory looking for assets, AD I Protect will respond with decoy assets. making the search for valuable assets more difficult and alert when decoy assets are interacted with.

SANS

Introducing Javelin Another commercial canary so lution for Active Directory we want to mention is Javelin ADjProtecL
When ADI Protect is deployed in your corporate environm nt, it will create different types of canaries inside your corporate Active Directory infrastructure and alert you when these canaries are u ed by attackers.
ADIProtect will not only create canaries like fake admini trative accounts and fake Windows servers, but it will offer several other deception technologies.
Active Directory is a repository (directory) for all your corporate (Windows) assets. and can thu be queried to obtain a Ii t of assets. For example, any domain member (a user or a machine like a work tation can query an Active Directory domain controller to obtain a list of all computers that are members of the Active Directory domain. Thi function does not require pecial privileges, all members can query information like this. For example, the Petya/Notpetya raosomware worm would use this functionality to obtain a Ii t of aJI computers on the network to attack.
For example, ADI Protect can be configured to interfere with this functionality : it can inject a huge number of fake computers in the query results. When anack r query Active Din:1.:tory domain controllers to obtain a list of all computers. A DIProtect will inject fake computers so that the attacker don't know what results are real and fake, and thus low down their attack. For example if you have 1000 workstations in your Active Dire 10ry domain, ADIProtect can make it look like there are I0000 workstations in our domain. Not only does this confuse the attackers, but it increa es the chances that atta kers will try lo access a fake workstation -ignificantly, and then ADIProtect will generate alerts.

© 2017 Erik Van Buggenhout & Stephen Sims

67

Tricking the Adversary - Summary

In summary, tricking the adversary will help us slow down the attack and improve our chances of detection. Two interesting technologies can help us achieve this goal: honeypots (decoy systems) & canaries (decoy data)!
I Honeypots have been around for many years and several open-source / free and commercial solutions exist.
IHoneypots & canaries can be an excellent addition to your cyber defense toolkit, provided your organization has the maturity to leverage theml
I Most open-source & commercial honeypots / canaries are generic and thus not tailored to your organization. To catch targeted adversaries, ensure the "honey" or "canary" is relevant and looks like your crown jewels!

-

-

SANS

--

· ·

.

Trickfog the Adver ary - Summary In summary, tricking the adversary wiU help u slow down the attack and improve our chances of del ction. Two interesting technologies can help us achie c this goal: honeypolS (decoys stems) & canaries (decoy data)! Honeypots ar decoy system : they simulate ystem or service and are de igned to try to attract the
atlention of our adversaries. Canaries are decoy data: they simulate corporate data and documents that look enticing to our adversaries and are designed to alert us when this data is consumed.
Here are a few closing thought ·:
· Honeypots have been around for many years and several open-source / free and commercial solutions exist;
· Honeypots & canaries an be an excellent addition to your cyber defense tool.kit, provided your organization has the maturit lo leverage them!
· Most open-source & commercial honeypots / canaries are generic and thu not tailored toy ur organization. To catch targeted adver aries, ensure the ''honey" or· canary'' is rele -ant and looks like your crown jewels!

68

© 2017 Erik Van Buggenhout & Stephen Sims

Cyber Deception Strategies - Some Additional References
Some additional resources concerning cyber deception strategies:
Active Defense Harbinger Distribution (ADHD) toolkit https: //www.blackhillsinfosec.com/projects/adhd/ The Honeynet Project h:tn>: //honeynet.org/ Canarytokens h:tn>: / /canar:ytokens.org/generate Kippo / Cowrie https://en.wikipedia.org/wiki/Kippo https: //github.com/micheloosterhof/cowrie
SANS
Cyber Deception Strategies - Some Additional References Some additional resources concerning tricking the adversary:
The Honeynet ProjectActive Defense Harbinger Distribution (ADHD) toolkit https://www.blackhillsinfosec.com/projects/adhd/
http: // honeynet.org/
Canarytokens http://canarytokens.org/generate
Kippo https://en.wikipedia.org/wiki/ Kippo https: / /github .com/ m i c h e l o o s t e r h o f/ cowrie

© 2017 Erik Van Buggenhout & Stephen S ims

69

Course Roadmap
Day 1: Knowing the adversary, knowing yourself Day 2: Averting Payload Delivery Day 3: Preventing Exploitation Day 4: Avoiding Installation, foiling Command & Control & thwaiting lateral movement Day5: Exfiltration. Cyber Deception & Incident Response Day 6: APT Defender Capstone

SEC599 .S
Data e-xfiltration Typical data exfiltration strategies Exercise: Detecting data exfiltration using Suricata
Cyber deception strategies Tricking the adversary
· Exercise: Making your honeypot irresistibly sweet Leveraging threat intelligence Defining threat intelligence Exercise: Leveraging threat intelligence with MISP & Loki Patrolling your network Proactive threat hunting strategies Exercise: Hunting your environment using OSQuery / ELK Incident response Incident response process Exercise: Responding to an incident using GRR

SAN~

This page intentionally left blank.

70

© 2017 Erik Van Buggenhout & Stephen Sims

Exercise - Making Your Honeypot Irresistibly Sweet
IThroughout this lab, we will introduce two interesting cyber deception techniques, both focused on tricking the adversary in our network. First. we will introduce & implement the concept of a HoneyHash. Afterwards, we will deploy a HoneyBadger web site to track potential adversaries.
High-level exercise steps: 1. Testing & analyzing the HoneyHash concept; 2. Implementing HoneyHashes in our environment using GPOs; 3. Configuring & testing HoneyBadger;
SANS
Exercise - Making Your Hooeypot Irresistibly Sweet Throughout this lab, we will introduce two interesting cyber deception techniques, both focused on tricking the adversary in our network. First, we will introduce & implement the concept of a HoneyHash. Afterwards, we will deploy a HoneyBadger web site to track potential adversaries. The following are high-level exercise steps: 1. Testing & analyzing the HoneyHash concept; 2. Implementing HoneyHashes in our environment using GPOs; 3. Configuring & testing HoneyBadger; For additional guidance & details on the lab, please refer to the LOOS workbook.

© 2017 Erik Van Buggenhout & Stephen Sims

71

Exercise - Making Your Honeypot Irresistibly Sweet- Conclusions
Throughout this lab, we used a combination of techniques to set up "traps" in our environment that could help slow down an adversary:
We used a slightly adapted variant of the "New-HoneyHash.ps1" script to implement GPO's to generate fake administrative hashes on all systems in our AD environment.
We used HoneyBadger to demonstrate bow easy a "tracking" web site can be set up to track who visits a certain web page.
Exercise - Making Your Honeypot Irresistibly Sweet - Conclusions Throughout this lab, we used a combination oftechniques to set up "traps" in our environment that could help slow down an adversary: · We used a slightly adapted variant ofthe "New-HoneyHash.ps l" script to implement GPO's to generate
fake administrative hashes on all systems in our AD environment. In our specific case, we created a user called "svcadmin", which would appear to be a technical account with administrative privileges. · We used HoneyBadger to demonstrate how easy a "tracking" web site can be set up to track who visits a certain web page. As you can see, we've added some deception technology without spending a time!

72

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
Day 1: Knowing the adversary, knowing yourself Day 2: Averting Payload Delivery Day 3: Preventing Exploitation Day 4: Avoiding Installation, foiling Command &Control &thwarting lateral movement · Day 5: Exfiltration, Cyber Deception & Incident Response Day 6: APT Defender Capstone

SEC599. 5
Data exfiltration Typical data exfiltration strategies Exercise: Detecting daca exfiltration using Suricaca
Cyber deception strategies
· Tricking the adversary Exercise: Making your honeypot irresistibly sweet Leveraging threat intelligence Defining threat intelligence Exercise: Leveraging threat intelligence with MISP & Loki Patrolling your network Proactive threat hunting strategies Exercise: Hunting your environment using OSQuery / ELK Incident response Incident response process Exercise: Responding to an incident using GRR

SANS

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

73

What Is Threat Intelligence? (I)
In o rd er t o understand what threat intelligence is all about, we first need to do a quick refresh on what a "threat" is. In Risk Management, a risk is typically defined as:
RISK =VULNERABILITY x IMPACT xTHREAT
Expanding on this, we can state that a threat is established by evaluating the following components:
· Capability: The threat actor is capable of reaching his / her objectives
· Intent: The threat actor is deliberately trying to attain his / her objectives
· Opportunity: Certain conditions exist that could allow a threat actor to reach his / her objectives
SANS
What Is Threat Intelligence? (1) In order to understand what threat intell igence is all about, we first need to do a quick refresh on what a " threat" is. In Risk Management, a risk is typically defined as RISK= VULNERABILITY x IMPACT x T HREAT. Theoretically, you could say that if there is no vulnerability, no impact or no threat, there is no risk. It is however impossible to mitigate all vulnerabilities, all possible impact or all threats without breaking "mission statement" as an organization.
Expanding on this, we can state that a threat is established by evaluating the following components:
Capability: The threat actor is capable of reaching his I her objectives Intent: The threat actor is deliberately trying to attain his / her objectives Opportunity: Certain conditions exist that could allow a threat actor to reach his / her objectives
Some examples of using these terms: -If a threat is not capable but has hostile intent and there is an opportunity, we could conclude the threat is insubstantial; -Ifa threat has hostile intent, is capable, but there is no opportunity, we could conclude the threat is i m pe n d i n g;
-If a threat is capable, there is an opportunity but there is no a hostile intent, we could conclude there is a
potential threat that can materialize.

74

© 2017 Erik Van Buggenhout & Stephen Sims

What lsThreat Intelligence? (2)
So... How do we define threat intelligence?

· There's a large number of threat intelligence definitions available · In line with SANS' CTI methodology (FOR578 - Cyher Threat
Intelligence), we will define threat intelligence as:
"Analyzed information about the hostile intent, capability, and opportunity ofan adversary"

· The focus on threat intelligence should be placed on the human element
· E.g. Malware alone should not be considered a threat!

SANS

,

What Is Threat Intelligence? (2) In this chapter, we will define threat intelligence and provide some examples of threat intelligence and how it can be used to detect attacks and adversaries. We will first, however, define the concept of threat intelligence.
Please note that there's a large number of threat intelligence definitions available. According to Gartner for example, threat intelligence is:
"Evidence-based knowledge, including context, mechanisms, indicators, implications and actionable advice, about an existing or emerging menace or hazard to assets that can be used to inform decisions regarding the subject's response to that menace or hazard."
In line with SANS' Cyber Threat Intelligence methodology (as defined in FOR578 - Cyber Threat Intelligence}, we will define threat intelligence as:
"Analyzed information about the hostile intent, capability, and opportunity ofan adversary"
Different types of definitions are acceptable, as long as the focus is placed on the human element. As an example, malware alone should not be considered a threat lo your business. The use ofmalware by an adversary to compromise your IT environment and steal your crown jewels is, however, a threat.

© 2017 Erik Van Buggenhout & Stephen Sims

75

What lsThreat Intelligence? (3)
It's important to make a distinction between different levels of threat intelligence. We chose to create three levels:
Strategic
Strategic threat intelligence includes information on changing risks (e.g. at senior leadership level a change in business direction would result in an adapted threat landscape)

Tactical
Attacker methodologies, tools & tactics. Often referred to as TTP's, these includes typical "habits" of adversaries, without providing narrow Indicators of Compromise

Operational
At the lowest level, we have operational threat intelligence, which is often limited to highly technical / narrow Indicators of Compromise of specific attacks / attack campaigns

SA.~S

I

What Is Threat Intelligence? (3) It's important to note that threat intelligence can exist at different levels of an organization. We should make a distinction between different levels of threat intelligence. For the purposes ofour course, we will distinct the following levels:
· Strategic intelligence: Strategic threat intelligence includes information on changing risks (e.g. at senior leadership level a change in business direction would result in an adapted threat landscape)
· Tactical intelligence: Attacker methodologies, tools & tactics. Often referred to as lTP's, these include typical " habits" ofadversaries, without providing narrow Indicators of Compromise
· Operational intelligence: At the lowest level, we have operational threat intelligence, which is often limited to highly technical / narrow Indicators ofCompromise ofspecific attacks / attack campaigns
As this is a technical cyber security course, we will mostly discuss tactical & operational threat intelligence!

76

© 2017 Erik Van Buggenhout & Stephen Sims

Problems with Threat Intelligence

DaveDeWalt ex-CEO FireEye

"Most ofthe threat intelligence feeds available on the market aren't intelligence at all; they're aggregated reports on malware and spam, rogue IP addresses, and vulnerabilities that can'tbe tied to a given environment."

This is an excellent example of too much IOC-focused intelligence: · Highly technical IOC's (e.g. domain names, IPs, ...) are only useful for a short time · IoC lists often lack context: threat actors, TIPs, industry, ...
Don't focus on quantity... Instead, focus on quality! Many organizations are struggling to correctly USE threat intelligence.
We will touch upon a few of these concepts in this section of the course!
SANS

Problems with Threat Intelligence According to Dave DeWalt, ex-CEO of FireEye:
··Most ofthe threat intelligencefeeds available on the market aren't intelligence at all; they 're aggregated reports on ma/ware and spam, rogue JP addresses, and vulnerabilities that can 'I be tied to a given environment. "
This is an excellent example oftoo much IOC-focused intelligence.. . There are a few common issues many organizations appear to be facing:
· First of all, highly technical IOC's (e.g. domain names, IPs, ...) are only useful for a short time. These IOCs are easy to change by adversaries (see next slides), which makes their use highly limited;
· IOC lists often lack context: threat actors, TTPs, industry, ... Some so-called "intelligence feeds" only consist ofa list of raw Indicators ofCompromise, which will result in very little operational value;
· Don't focus on quantity ... Instead, focus on quality! Take efforts to collect threat intelligence that is relevant to your organization and the threats you are facing!
· Even if they are collecting the right types of threat intelligence, many organizations are struggling to correctly USE and operationalize it. ..
We will touch upon a few of these concepts in this section of the course!

© 2017 Erik Van Buggenhout & Stephen Sims

77

'
Tactical & Operational CTI - Introducing David Bianco's Pyramid of Pain

SANS

. . Tough!
~ Challenging
Annoying

Simple

Easy

Source· 0-JV;,,; J, B10nco. Ptl5Cf!OI blog

Trivial

Introducing David Bianco's Py ramid of Pain David Bianco produced an illustration of the various types of indicators used in real-time detection and threat hunting, and how affective they are at combatting advanced adversaries. David calls this illustration the "Pyramid of Pain".
It represents the amount of"pain" you can inflict on advanced attackers by using a certain type of ind icator and denying them the use of attacks that can be detected by these indicator types.
At the base, the pyramid starts with indicators that are trivial to bypass detection by the attackers, and thus inflict a trivial amount ofpain to the attackers.
At the top, the pyramid ends with indicators that are difficult to bypass detection by the attackers, and thus inflict a though amount of pain to the attackers.
The pyramid has 6 types of indicators:
· TTPs · Tools · Network / Host Artifacts · Domain Names · IP Address · Hash Values

78

© 2017 Erik Van Buggenhout & Stephen Sims

David Bianco's Pyramid of Pain - Hash Values

Hash Values

Trivial

Hash values
"This is sample text" Hash:636351fcb9197f5e75b845628508bbb1
"This is sample text!" Hash: 7f5d61b32bo3dfy36c39eco6b2597661

SANS

David Bianco's Pyramid of Pain - Hash Values We start at the bottom ofthe pyramid with hash values.
Hash values are cryptographic hash values like the MDS value of malicious executables used by attackers.
When we rely on hash values to detect adversaries, we inflict a trivial amount of pain to the adversaries: changing the hash value ofa malicious executable is trivial. Changing just a single bit is sufficient to change the hash completely.
Attackers can use specialized tools to generate variants ofa malicious executable that are functionally identical but are different at the byte level and thus have different hash values.

© 2017 Erik Van Buggenhout & Stephen Sims

79

David Bianco's Pyramid of Pain - IP Address

IP Addresses

Easy

IP addresses used for · Command & Control infrastructure

- - -------------, · Data exfiltration address

SANS
David Bianco's Pyramid of Pain - IP Address Next is detection based on IP addresses.
lP addresses will be used in network communications for command and control servers, and for data exfiltration servers, for example.
Changing IP addresses for attackers is easy. Detections based on IP addresses can be easily bypassed by changing IP addresses. Ifattackers rely on DNS to resolve domain names to IP addresses, changing IP addresses is as simple as performing a DNS update.

80

© 2017 Erik Van Buggenhout & Stephen Sims

r
David Bianco's Pyramid of Pain - Domain Names
r

Source; D!N<JJ. 8'1nco. {)<rsonoi Dlr>g

Simple

Domain mun.es
Domain names and sub domain names · Evil.com · This.is.evil.com

Da,·id Bianco's Pyramid of Pain - Domain names Indicators based on domain names are better quality indicators than indicators based on IP addresses.
Domains can be new domain names under a Top-Level Domain (TLD) like .com, for example, evil.com. Or domains can be subdomains under existing domains, like this.is.evil.com for example.
When we use domain names as indicators, our adversaries can simply bypass this detection by changing
domain names.
Domain names can be easily obtained, and are not expensive.
Depending on the infrastructure used by attackers, changing a domain name can be as simple as changing an entry in a configuration file, or recompiling an executable.

© 2017 Erik Van Buggenhout & Stephen Sims

81

David Bianco's Pyramid of Pain - Network & Host Artifacts

Annoying

Network/ Host Artifacts
· Specific user agents URI patterns
· SMTP mailers Registry key values
· Files & Directory names

David Bianco's Pyramid of Pain - Network & host artifacts When we detect the activity ofour adversaries based on network and host artifacts, we inflict a bit more pain. Example of network and host artifacts are:
· Specific user agents · URI patterns · SMTP mailers · Registry key values · Files & Directory names
Bypassing detection by indicators of network and host artifacts is a bit more annoying to the attackers, as it implies that they have to change patterns used by their tools and malware.
This implies making (small) changes to their code base.

82

© 2017 Erik Van Buggenhout & Stephen Sims

David Bianco's Pyramid of Pain - Tools
Tools Things attackers bring with them - Password crackers - Post-compromise utilities - Exploits Utilities attackers use to create malicious documents
SANS
David Bianco's Pyramid of Pain - Tools When we detect advanced adversaries based on the tools they use, we start to infl ict major pain. Examples of tools used by (advanced) adversaries are: · Password crackers · Post-compromise utilities · Exploits · Utilities attackers use to create malicious documents When we detect the use ofthese tools, we prevent them from using the tools again in our corporate environment, which makes it challenging to the attackers. Detecting tools here is not based on hash values or user agent strings, for example, but on the patterns ofevents that these tools generate when they are used on a computer system or inside a network.

© 2017 Erik Van Buggenhout & Stephen Sims

83

David Bianco's Pyramid of Pain - TTP's

4.A.

Tough!

TTP: Tactics, Techniques & Procedures
......__ _ _ _ _ _ _ How the adversary goes about accomplishing their mission, from reconnaissance all the way through data exfiltration and at every step in between:
· "Spear-phishing with a trojanized PDF file" · Dumping cached authentication credentials and
reusing them in Pass-the-Hash attacks

SANS
David Bianco's Pyramid of Pain -TTP's The highest level of pain we can inflict is at the top ofthe pain pyramid: when we can detect TIPs, we really make it through to our advanced adversaries to change TfPs. TIPs are Tactics, Techniques & Procedures.
How the adversary goes about accomplishing their mission, from reconnaissance all the way through data exfiltration and at every step in between.
Examples:
· Spear-phishing with a trojanized PDF file · Dumping cached authentication credentials and reusing them in Pass-the-Hash attacks

· 84

© 2017 Erik Van Buggenhout & Stephen Sims

How DoYou ObtainThreat Intelligence?

Option 1: Buy a commercial feed

· PRO: Not a lot of effort involved

· CON: Often not very tailored intelligence feeds / collection of IOCs

,-

· CON: High-value feeds are rather expensive($/ C)

·MISP
Threat Sharing

Option 2 : Obtain intelligence from sharing communities · PRO: More tailored & valuable intelligence (with context)
· CON: Effort to be done · CON: Only works well if you also share intelligence

,-

-/i)f

Option 3: Generate your own intelligence · PRO: Highly valuable intelligence relevant to your organization · PRO: You learn a lot about adversaries & your environment in the process

· CON: Requires expertise & effort

In an ideal scenario, you combine the three options!

SANS

How Do You Obtain Threat Intelligence? There are several methods to obtain threat intelligence that can be used to help defend your corporate environment. We will list some of the most commonly available options:
Option I: Buy a commercial threat intelligencefeed · PRO: This does not require a lot ofeffort from your side, you basically "out-source" the problem · CON: Many threat intelligence vendors are focused on the collection ofhard lOCs and don't focus enough
on providing tailored intelligence feeds that provide the required context to correctly operationalize threat intel Iig en ce; · CON: T he cost ofpurchasing a high-value threat intelligence feed can be rather high
Option 2: Obtain intelligencefrom sharing communities · PRO: You typically receive more tailored & contextualized threat intelligence, as you share with industry
peers that are facing similar threats; · CON: There is quite a bit ofeffort to be done: get out there, go and talk to people, ... · CON: In the long run, this type of"obtaining intelligence" only works when you also share inte lligence
yourself(which again requires effort).
Option 3: Generate your own intelligence · PRO: Intelligence you generate yourselfwill have a lot of value for your own organization, as it's been
generated from observations that occurred inside your environment; · PRO: In the process ofcreating your own intelligence, you will learn a lot about your adversaries AND
your own environment; CON : Generating your own intelligence requires the most effort from all three options. Furthermore, it requires a certain level of maturity & expertise to do well.
In an ideal scenario, you combine all three options!

© 2017 Erik Van Buggenhout & Stephen Sims

85

Some Fre e Threat Inte lligence Sources -Alie nVault OTX

11}............a..'--o. .... 0 . .............. ~-...-..
~~ -J~-i ..,J.,. ,

&.....+,.' "'"'"

Q J

0.

·····-··· '°'''"" 0?

! ' l <· t
~: ...

A The Formidable Form8ook Form Grabber

"ii a..··

a ------·······--.-. ···. ~-- .......... -.~"' ..._

_ _ _ _ ,,,.. _ _ _ _ _ _ a..·· -

-,.. ..

39K

~

0

0

c::mm-=-E::!:11-=- In

Summary

a

t·
~ .,

Indicators of Comprom,se

In the screenshot to the left. we can see what AlienVault OTX (Open Threat Exchange) looks like.
Once you have registered a free account, you receive access to different threat intelligence information. Although still very much loC-focused, you can define "pulses" that help you focus on data relevant for you!

SANS

Some Free T hreat Intelligence Sources- AlienVault OTX In the screenshot to the left, we can see what AlienVault OTX (Open Threat Exchange) looks like.
Once you have registered a free account, you receive access to different threat intelligence infonnation. Although still very much [QC-focused, you can define "pulses" that help you focus on data relevant for you!
You can find AlienVault OTX at https://otx.alienvault.com

86

© 2017 Erik Van Buggenhout & Stephen Sims

Some FreeThreat Intelligence Sources - ThreatCrowd
~- CX
"a I

·1· t"lS u:s,..-i

DOMAIN > WWW NVlSO BE

· .. ,._.._on

N El
~
<>

··. · [] WWWN'MOll

---- -_.. ONSRfSOll/llONS

,l01 1--

.-.c.

PORT 80
...-T~t:','ll...,.,,.._~t.,.~... ~;\01"f1l'6~~ ....,__,,,~o-,~ *'li.:iflNIP' ,..,..r.<ll)~I..MIIJfl.~
.. ,~--·~- ~..,c~~~·'
IJQCr'llpt ~ ill"Jll.lC lllll[ffllOtD..11"1.: () { l r l i - ~ 40· WCM11
~ ~~,~~... - - ·....... .._..,...,..w,..,,...:., ~..~~-....?.I it,~

~11,....,,..,,......,~IO,c:lffeft,,t,,,,o,,.,....

ThreatCrowd takes a different approach.
It features a search engine where you can enter your query (e.g. a hosmame, a web site, the name of a malware family, a hash, ...) and it will provide a schematic overview of information it has linked to your search query!

Some Free Threat Intelligence Sources -ThreatCrowd ThreatCrowd takes a different approach.
It features a search engine where you can enter your query (e.g. a hostname, a web site, the name of a malware family, a hash, ...) and it will provide a schematic overview of information it has linked to your search query!
You can find ThreatCrowd at www.threatcrowd.org!

© 2017 Erik Van Buggenhout & Stephen Sims

87

SharingThreat Intelligence - Introducing MISP

IThe Malware Information Sharing Platform (MISP) is a free, open-source project providing a Linux based application with a web GUI.

Threat Sharing

MISP instances can be connected to others, so information can be exchanged in a controlled fashion
IMISP users have fine-grained options to decide what information is shared with whom

SANS
Introducing MISP We will discuss an open source threat intelligence sharing platfonn that is based on IOCs.
The Malware lnfonnation Sharing Platform (MfSP) is a free, open-source project providing a Linux based application with a web GUI.
MISP is not only free, open-source software, but it is also designed to share free, open-source threat intelligence. Although it can be used to collect lOCs without sharing.
MISP instances are used to create events and associate IOCs with these events. An event, for example, can be created for the WannaCry ransomware, and an IOC would be the MOS hash of the WannaCry sample.
When instances are used in a stand-alone fashion, without connecting to other M ISP instances (ofother organizations), threat intelligence is not shared.
The power ofMlSP, however, lies in its infonnation sharing model: MISP instances can be connected to each other via a subscription based model (this is a technical tenn, not a commercial term). Events and IOCs created by one organization are then shared through all organizations that t:ormt::ct to that MISP instance.
Ofcourse, for each MISP it is possible to flag events and lOCs as non-sharable because they contain confidential data, that could, for example, compromise the source of this intelligence.

88

© 2017 Erik Van Buggenhout & Stephen Sims

Event in MISP

.. _ -·-....,,.__,,,,__.
-_-_--,. ·-
·---....,.,._....

"T/T copy receipt" Phishlng · Java RAT Adwind Trojan

---- .. ......,...,..

- ..> .gt'C J ,. ' 0

:J

' ?Ir 2 ' b' ii tSit WID

-· ,<I - ·~, - ,-c,.., - .- .r
*''''*
G<llollt·
1.A;AT;Q.;u·

SANS

Event in MISP
You can dive into events to get more information about them:
Files Network data · Related events IOCs they are associated with

Event in MISP This is a screenshot of an event in MISP. It is a modem web-based GUI that resembles full applications.
The event pertains to a phishing event for the Adwind T rojan: an attempt at infection with the Adwind Trojan via unwanted email.
The event has the tags "phishing" and "Trojan".
On the right-hand side, we can see links to related events: this can help us look at similar events, and discover common IOCs or modus operandi.
This event has 771 attributes, that fonn the IOCs.
One can browse through the attributes to obtain a list of different types of IOCs, like:
Files · Network data
Related events IOCs they are associated with

© 2017 Erik Va n Buggenhout & Stephen Sims

89

MISP H ome Page

· ~

5H4

· ~

~.l. fJ

Up:wM·!
IIP""'"" I

12 2017-47-21 L<>,

20

2017-07·.?I l1>,·

Comp<t:l<I OS1'1T ·

A.II

l~lBewUf\

~P-,lt

mi,wdodl

.,. 8'<0"
C - t d OSINT · R,··o,tat , Spy.vattundef

c...-

This MISP home view is the overview of events. We can see two events, with numbers 5414 and 5413. Next to the number we have the tag (tlp:white), and on the right the info.

MISP Home Page The screenshot above is the home view ofthe MISP GUI interface, that is presented to a user once she has logged on.
This home view presents an overview ofthe events in the MISP database.
On screen, we can see two events, with numbers 5414 and 5413. They have different columns with information pertaining to these events.
On the left for example (second column), we see the symbol ofthe organization (MlSP instance). The red symbol here is the CIRCL organization, the national CJRT of Luxembourg, which is the main proponent behind MISP.
Then we have the number ofthe event and the tag (tlp:white).
The numbers 12 and 20 represent the number ofattributes (IOCs) for each event.
We have the date the event was created in MISP, the threat level {low) and the status ofthe analysis. Completed here means that the evidence gathered for the event is complete and fully stored in MISP.
Finally, on the right, we have the info for the event. This is a description for human consumption.
In the next s lide, we will see the details for a particular event.

90

© 2017 Erik Van Buggenhout & Stephen Sims

Reviewing an Event in MISP

OSINT - Rurktar - Spyware under Construction

~
,-.
,...

-E-IH,..,..,
- -l'!vl>O<·Alk-

Ev..,110 UoJl<I 0<g
Con~ t . o n
r.v,

$<1~ S972Dld).19cM710-92t24""91i0<1210I CR"l
.!,!':W!!llt

.. C"'1aCI-
~

Oo<I Thf'fft Ltvtl Anatyttf.

2017-07-21 LOW Coff\ON<ld

O<llnW!lon

All cooPnUl'llber.

l"' Event1

lnlO

osmr . RU11<U1 ·s"""".,· ..,.eo,t,tn.cilOft

Add E'"°l

Pull"·-

v. .

,-.

IAttrlbultS

20

Sl(lhUngs

O(OJ·,.....,,.., 10""" 0<03f'""* on'( ~

ACIMIY

EHl+·MM

Reviewing an Event in MISP This is the screen that is presented when we click on a particular event in MISP. It gives an overview of the properties and metadata ofan event.
The event displayed here (ID 5413) is for the Rurktar spyware. The fact that the description starts with OSINT indicates that this information was obtained from OS INT sources: Open Source lNTelligence. The organization that created this event (ClRCL) has obtained the infonnation from an open source. Usually, the URL of the source, a web site article, for example, is provided as an attribute (this is not an IOC).
The event is published (this means that it can be shared), the analysis is complete, and it has 20 attributes.
Tag tlp:white indicates that the information may be sharing under the Traffic Light Protocol (TLP) white status.
TLP has 4 colors as status: · Red · Amber · Green · White
Red is the highest confidentiality, white the lowest.
Information marked as white may be publicly disseminated outside the organization that provides it, without restriction.
Red marked information may not be shared outside the organization.

© 201 7 Erik Van Buggenhout & Stephen Sims

91

Reviewing Attributes Linked to an Event (I)

~n~.;n t'Ot7-tr.·lt

,..!1:IH#·trr Pa,'OM......,.

~ ,o,11or1o.o»wn--arc...,,."c.'"\2tlfwt61Jd1MrnttT>cJTt·W191
"~
pt-11 ¥ ' # T T 1 ~ 7 ' ~ ~ 7..tie-..

10174'·11 1011"11-,,

Pt-f!Oa<I_,."'> ~ ~·'~~'f911«~tn"l~IOI>*_,.."
·
, .. ,...,,~...,, .,,,., 17cd«n· )S.»q,06,t,(~flt1

SANS

This MISP view presents the attributes of the event we discussed in the previous slide (event ID 5413).
The events listed here are cryptographic hashes (mdS, sha I and sha256) of malware samples.

Reviewing Attributes Linked to an Event ( I) This MISP view presents the attributes of the event we discussed in the previous slide (event ID 5413).
The first column is the date ofthe event.
Then we have the type of attribute: in this example, the type is "payload delivery". This is used for malware samples that deliver the payload.
Malware samples can be identified with cryptographic hashes. Here we have the md5, shal and sha256 values for various samples.
These are actionable IOCs: we can use these hashes to create ClamAV signatures or YARA rules to detect these hashes or to hunt for them in our environment.
The fact that we have several types of cryptographic hashes for the same sample is good: this allows us to use various detection tools. Sometimes just one type of hash is pubIished, and it may not be actionable with the tool that you use.
For example, if only a S HA256 hash is published but your scanning tool requires MOS hashes, the SHA256 hash is of no value to you.

92

© 2017 Erik Van Buggenhout & Stephen Sims

Revie wi ng Attributes Linked to an Eve nt (2)

.......,
1:0t+OMl1

9 ,,..
t,111rr.-lNl'(lil ~

',... ~

,.,. m ,.. ...'-" ,~ ...~ c.o,,,~ ~ ,...~t-..,

t.1g1.t:. . . . . .

-...TM F ~ J,-o~··ewMO_at.-.20 ·
.........,,...._w~ll)QIT.-.dl-all:.cw.·WOOMfl_,.. ~ ,...~ , · ~ f , , 1 1 ~ 1 1 ~ , _

4tl
,,_.,.., . . , , ~ ~ ~
~. .~~'='btal'· 4 a.l\11"'0».Nt.io..,."'. .
,~-mi~,._
,,.. ..,,210I
'>28
-210I

..No ,,
...
-·""
...No ,., ,.
, ....

This is also a view of a tt ributes, but scrolled to the right.
This shows different columns. and we want to draw your attention to the IDS column.

SANS
Reviewing Attributes Linked to an Event (2) This is also a view of attributes but scrolled to the right.
The category column of an attribute indicates its source. For example, category "external analysis" indicates that the attribute is based on external analysis, not performed by the organization that created the event in MISP.
On the right-hand side of this screenshot, we want to draw your attention to the IDS column.
The value for IDS can be Yes or No, and it indicates if this attribute is suitable for use by an IDS or not (or other detection systems).
For example, attributes that are IP addresses or domain names would often be marked with IDS value, Yes, to indicate that these values can be used to detect malicious activity for this event, or can be used in a blacklist for example to prevent malicious activity.
We want to remark that we have observed that it can happen that low-quality IOCs are marked as IDS Yes, and that will result in fa lse positive detections. For example, when malware is automatically analyzed inside a sandbox, connections to DNS servers will often be observed. Like Google' s DNS server with 1Pv4 address 8.8.8.8.
We have seen events where this address (8.8.8.8) was included as an IDS attribute, which would lead to many false positive alerts, as DNS request to 8.8.8.8 are common in a network and certainly no indication of malicious activity.

© 2017 Erik Van Buggenhout & Stephen Sims

93

Adding New Events in MISP

'--·_-,,...,
......,. _

Add Event

·-·-~ ~

-

Adding New Events in MISP Finally, we conclude this introduction to MISP with the dialog used to add a new event.
Remark that several initial fields are populated by default.
The date field is populated automatically.
The threat level is set to High by default.
The status ofthe analysis is set to Initial by default: this means that the analysis has started, but is not yet completed yet. Events with analysis status Initial can be shared too. Completed analysis is not required for sharing.
An important property is the Distribution field. By default, this is set to "This community only" . This means that this event will not be shared with MlSP instances of other communities.
To share information with other communities, the value for Distribution must be "All communities" or a limited set of communities.

94

© 2017 Erik Van Buggenhout & Stephen Sims

r

OperationalizingThreat Intelligence

Say we have intelligence, how can we now "operationalize" intelligence? Here's a few excellent use cases for threat intelligence:

I

Immediately use fresh IOCs in real-time prevention & detection tools (Firewalls, IDS, IPS, SIEM, ... ). This is what many organizations already do in an automated fashion

I

Use old IOCs to cross-check archived logs for potential hits and thus signs of previous compromises (which could still be active today!)

I

Use tactical threat intelligence (e.g.TTPs) to create new hypotheses for threat hunting (which we will discuss in the next chapter)

I

Use strategic intelligence to improve your cyber security strategy and steer future investment decisions

Operationalizing Threat Intelligence Say we have successfully obtained intelligence... This doesn't mean we are not already leverag ing the intelligence in order to improve our overall cyber security posture.. . How can we now "operationalize" intelligence? Here are a few excellent use cases for threat intelligence:
· Immediately use fresh IOCs in real-time prevention & detection tools (Firewalls, IDS, JPS, SIEM, ...). This is what many organizations already do in an automated fashion. Many firewalls & SfEMs, for example, come with a built-in "intelligence feed", which is typical ly just a long list of IOCs;
· Use old IOCs to cross-check archived logs for potential hits and thus signs of previous compromises (which could still be active today!). In many organizations, this is one ofthe main reasons for incident discovery;
· Use tactical threat intelligence (e.g. TTPs) to create new hypotheses for threat hunting (which we will discuss in the next chapter). The idea is that we can understand new TTP's being used by adversaries and use them to define new potential intrusion methods we can check in our environment;
· Finally, we can use strategic intelligence to improve your cyber security strategy and steer future investment decisions.

© 2017 Erik Van Buggenhout & Stephen Sims

95

OperationalizingThreat Intelligence - Using Loki IOC Scanner
As this is a technical course, we will now focus on leveraging technical Indicators of Compromise. An interesting tool for this purpose is the freely available "Loki" IoC scanner (by BSK Consulting).
· An IOC scanner is a tool that will use IOCs to scan computer systems' resources (file system, registry, memory, ...)
· There are several open-source and commercial IOC scanners on the market, some are even based on scripting languages such as PowerShell!
· Loki was developed by Florian Roth (BSK Consulting) and is the free variant of BSK's commercial tool called "Thor"
· Both Loki & Thor use an "intelligent" scoring system (next slide)
SAN~
Operationalizing Threat Intelligence - Using Loki IOC Scanner As this is a technical course, we will now focus on leveraging technical Indicators ofCompromise. An interesting tool for this purpose is the freely available "Loki" IOC scanner (by BSK Consulting).
An JOC scanner is a tool that will use IOCs to scan computer systems' resources (file system, registry, memory, ...). It's important to note that there are several open-source and commercial IOC scanners on the market, some are even based on scripting languages such as PowerShell!
Loki was developed by Florian Roth (BSK Consulting) and is the free variant ofBSK's commercial tool called "Thor". Florian Roth is a known security researcher that has contributed heavily to the community by developing a large number of YARA rules.
Both Loki & Thor don 't only rely on "hard" lOC matching, they also feature an "intelligent" scoring system (next slide).

96

© 2017 Erik Van Buggenhout & Stephen Sims

I
Thor & Loki's Scoring Mechanism
.......................
'
Proct>I Cht<k

Thor & Loki are developed by German cyber security firm "BSK Consulting". On their corporate web site. they provide some guidance on how scoring is performed!
You will notice how the mechanism combines "known bads" (e.g.YARA rules) with more generic information (file location, size, owner, ...)

Thor & Loki's Scoring Mechanism When running any type of tool in cyber security, "knowing your tools" is a good rule to live by. As you will see in the next few slides, Loki provides an automated analysis oftarget systems. But how does it detennine whether or not a specific executable / process / ... is suspicious?
Thor & Loki are developed by German cyber security firm "BSK Consulting". On their corporate web site, they provide some guidance on how scoring is performed. The slide above provides a detailed understanding of how the scoring mechanism works. You wi11 notice how the mechanism combines "known bads" (e.g. YARA rules) with more generic infonnation (file location, size, owner, . . .).
The idea is to ensure both Loki & Thor can do more than just "hard I0C matching".

© 2017 Erik Van Buggenhout & Stephen Sims

97

Loki's Command Line Interface (I)

1\lth">l·h ·ft

hll:i ... ( ·h) ,., ,.uq , .· kU~t·) l·l 1-,-,u., ,.,. ,-t··l~t)

1-, . 1-·pr

1..-1-1.w11
l8IAUJ tH

(·w
1n,.

~·nt·
.....1

lw · ··

.11 ,.,, M r,opr'·oc:tinl

tr1-u-·~t.1wl·l

) KW1l

, ..·.uapteNl'iJl"ul 1··i"-tl1ltl l··M,rwHu-UrJ f··r..11'\f~J

1···11ti1ehJ IHUIIM'lffl 1-·cwJ ( ··enlV"· lWMlJ t·· MI..)

( 4 ~ 0 t· ) IH"""91

olt · Si.I· lot ~

ti.eMl .....-t·

..-·~, .,u.·t,·.M,-.-l(.I,I.

.,._ l"h Ml, . ...... _,. · dt

,_It · ·th t· NM
M-Ml- Uh ·'--· te eMet ,,. «.I , ..

AIM c;f)

.,,._t ·t- ·l l09·hh

W, hh

· ·l.,,_.t
·· ·,.,.c:-1~1

tt...ot, · ·., fl1....t kor·

.-..-...~. -..,,,.,,,,.u ... w.r"'fl,iot·1.wi
~n Mtic· ·19Y9-l
...-.
HNf.U""'411\ ··.vt,t..-w.ljtls

. . , .f t , ' 1 9 K W '·

*U~ Nor·

"'"on. ,..iflt all tl1" tMt ·· KMNCI

,nnl ·lt

INt Ml,lSff ,.,. OCOI"·

::ta!~ Ats,U,.~sc.n :!:i,~:.l!l'h (Wto)

·v.ottit

kip tM ,.. .tkh cM<t

··,,H,.ficot.,.

0. Mt _,.., o ,,,...,.. ., ll'Ml10HI"

· · r. g i f t f, -~eant-.h

O. dwd. ,.,, ...In virtv.tl fil· ¥ l " . . . ., ...i t - ..,,

""l,l'ltt,M,I
. ....,
. ._.,.,,1went
""'Mlot
.......H ......

lflt--. ktit1 ..o. (·I.. etan ~ hh tvP" enf ·11
HtMliwi.)
-,.-,.t.il...... lill"U· ($ij 1.. ,....l le sroout (Main· ,..cMH(ftt)
ORlv ,,-1"1 ...,.-"'i"t' w ·hrtt °"""t ...lt· · IOU\ \09 f U·
· tl'i· ·llflitlt\ll"H f r · tbt - -.~tur··..... _,.
Ottllut""'t"'t

Loki is a command-line based tool used to scan for IOCs.
It is written in Python, and in this screenshot, we see the compiled version in action on Windows.
We will use it during an upcoming lab exercise!

Loki's Command Line Interface Loki is a command-line based tool used to scan for lOCs.
It is written in Python, and in this screenshot, we see the compiled version in action on Windows.
The Python version of Loki itself can also be used to perform IOC scans, but this implies that Python and all the modules Loki depends on (like YARA) must be installed and deployed on the system we want to scan.
Not only does this require an increased system administration effort to deploy and maintain Python and the required modules on all Windows machines in an organization, it also provides a powerful scripting tool that can be abused by attackers.
Therefor Florian Roth also provides compiled versions of Loki: these are s ing le Windows executables that contain an embedded Python interpreter with modules and the Loki programs. When executed, it will start a Python engine to execute the Loki Python scripts from a temporary folder.
Loki takes several options and arguments, these can be explored with the help (- h) option as shown in the screenshot above.
When Loki is started without arguments or options, it will perform a full scan of the machine it runs on.

98

© 2017 Erik Van Buggenhout & Stephen Sims

Loki's Command Line Interface (2)

,, ,-=·v, D-.:i
I I_I I.I I .< .J I 1_ _. J ' - - 1 . J I . / _ /
I .I __ V _ I I - ' - - · · - _ _ _ _ . ..· .I II I.I I I _ _\ V _../ · '1. V . V ·.) _I I __I\_../\ __I I ._l\_/\.,./.11.l.}IJ\_I../
c..,-1~t ~ floden Roth. i:t.lMMd ~ UM c:.,«J ~ · l Pubhc l,icenff .All'it lt)U, Uw· lon 1 . 2l, 2
DIStt.'-IHlR · US AT YOUIII Ollrf fUSl
PlHH np,ot"t falff potiti"" vi· httpt://gith\11:11.e"'""Hri/ LoU/ i H U.t

Stertl."9 LOk.i Sun SVS'TO'i ,.ui ' TUIE: 201 i'N01ltt U ~.U PLATf~1

h'I t91'\9h.rt·bt .· ,MJJr.ctor-1,1 JOMn l HUt Qlf' n ~ll,i t

,tQi'141flC·l:'I

.ie- ·

at4< 61; o

ndit··

When Loki is started, it will display its banner and copyright notice.
When run for the first time, Loki will fetch its IOC database.

SANS
Loki's Command Line Interface (2) When Loki is started, it will display its banner and copyright notice. Loki is a command-line program, but since it can run without arguments or options, it can also be started by just double-clicking it in Windows Explorer. When Loki is run for the first time, it will notice that it has no IOC database (folder signature-base) and download it from the GitHub repository from Florian Roth for Loki. lt is a ZIP file that contains all the signatures used by Loki (hashes, YARA rules, .. .). These signatures will also be downloaded in subsequent uses ofLoki when there are updates available.

© 2017 Erik Van Buggenhout & Stephen Sims

99

Loki's Output

PIO:
SA~
Loki's Output ln the screenshot above, we can see that Loki is based on YARA rules.
These YARA rules are part of the signatures downloaded by Loki from the Loki GitHub repository and are initialized at program startup.
From the name ofthe YARA rules, we can deduce that Loki looks for hacker tools and exploitation tools used by advanced adversaries, and not for common malware.
We see YARA rules for Empire, Regin, tools from the Equation group,
In this example, we also see that Loki was started from a command prompt without administrative rights.
The consequence is that Loki will not be able to scan all Windows resources, like process memory. For security reasons, a normal user cannot access all resources. Files of other users for example, and the process memory, some registry values, ...
To maximize the chances of Loki to perform a successful scan, it must be execult:d with an account that has administrative rights.

100

© 2017 Erik Van Buggenhout & Stephen Sims

Loki's Output (2)

HATCH:

ACCUSElh
suescom: ·

CREATED!

NATCH ;

IU: c.: ,0+.o\,.H04ri;·i 1Jlr' SCORE: 70 TYPE : t . St?[: 11?&16

· IRSl. WTU : llaS~90080-JOOIH00:1teeooolftffOOO&ba-oeoooo P'l : >t>klfbtlclad.KT9.th"5~GJCf9· 2 HA1 , Utl&e?SllSUd,M,S'lel02A\l#?ffifJ1lllteb4· 1'0

25;:: cdS28blktbff30d8d2H~ebCdef-5Sc:1a,112bb<:l·'lltal1 tc~twbf9i+c,f-.-.:~~ CR£:ATED.
.t zen l«IOJFI[D: w.d Jul 1.l 2, 1 r 18 Hll ACCCS'SED: IMO Jul 12 ,U l6 , , zen

()jC_t ".,.· Jtul· 11\TCH : ·tul·tt U.SCOR£; -a

"$CAIPTl<ltl: ·i·ikatz: TCHES:· Strl \ufffoq\x8" ,1,i:fffaO\i rf'fO\it0,,11\uHrd Slr?i \uff.CtOl\vffhSE\utffdv\ufff,c\,rOt\vtffd\Ufffdt

~uHfclK\lJfff,!Sf ,ufff"~\uftfd\>1.81\uff'f., ~·"
'li::llI!Jl 11'· .iH l 1\·rtt I -..rnSl\9$ l Mt i c.·

(trlilnc1tt·d)

NOT ltC
SA~S I

TUIE 2,H7Sten,a 17 l5Z

Here we can see some suspicious files detected by Loki.
The color (red and amber), different from normal messages (green and blue) indicate successful IOC matches.
Here for example. we see Mimikatz detections.

Loki's Output (2) In the screenshot above, we can see Loki messages appearing while performing a scan of the filesystem of the computer.
To perform a scan ofall files in the filesystem, administrative rights are required, because normal users don't have read access to all files.
Here we can see some suspicious files detected by Loki.
Loki is a scanner that just detects resources that match lOCs, like files: it will not delete or clean a malicious file like an anti-virus would do.
The color (red and amber), different from nom1al messages (green and blue) indicate successful IOC matches.
Here, for example, we see Mimikatz detections.
These are actually the modified Mimikatz versions that the Petya/Notpetya ransomware used to extract credentials from memory to execute lateral movement.

© 2017 Erik Van Buggenhout & Stephen Sims

101

Running Loki with Administrative Credentials

iiil

Acirrw:s,ra:o:· CorT,rr,wcl D·c,n,p:

~ ·- - ~cenn1n9 Proco·~ PIO:

)\Coamon F1les\Acro~ ~chP

· Sconn1n9 Proc~ ~ PIO: GGi

CHO :

I1)\Coa··

en F1log\Aoron, Scor,ning ProceG

C~P ,afrop< PIO :

s ox· NAME :

IC ·xo

xSuc

CHO :

1nd0Ns\ey t··32\0bx.

! · Scann1n9 Proceo, PIO , ~'J2 NAME : ·choct or CHO : C

~ost ··· ·t utcouc

· ~canning Process PIO: j~~ NAHE : ,o·ttoot CHO : a ,host ex· fb2oob56a·

o25·~79b·98cb0cc96ildf6b ,

· . Scanning Proce~. PIO: $2' NAME :

ngr

CHO :

~r

,GNU\GnuPCi\d1ran9r ex~ · ··"' ,c~

Listening proce g PIO: 1911 NAHE: dir~~o exe COHHANO : "\Pregra· Fil<

s (x86)\GNU\CinuPG\dir· ngr oxtt ~·rv1ro IP: , 0 1 PORT : 19~'2

·x·· · Sconnin9 Proce$$ PIO: 9S2 NAME : P9 rt_ CHO:

l\bin\pg_ctl

ru ,~orv·ce - · H~.p: I Pee ..,,... '

leit\po~tgrooc 11te~plott/pont9"

.iliadiltSa c. anning Pree~~ PIO: 2~ o NAME :

o CHO:

lo1t\ruby\bi~\ru

J oxo ·C '"C \ntHple,t\al'f \pr~ .·n? n pro.

.c

L oroduct1on

Listening proces~ PIO: 2808 NAHE: ruD· ·x· COHHANO : \mote~ploit\ruby\

oin\ruby.exo ·C C \ otosrlo1t\8pp~\pro\eo9in, r 0 vr r c, b · production IP : 127 8 8' PORT: 58585

E&tabh~h·d 001 ,ect10n PIO: 2888 NAME: r\lb\j 1txe COHHANO: r-ub'-'\b ,. r- 1bu ex· C C riol ,sp.1.0 t .appt rro\ ro , e · 1, ,r,
on LIP : 1 LPORT: >'156 RIP: l RPORT: 733 7

SANS

In this example, we are executing Loki with administrative privileges.
This means that Loki is able to scan process memory.

Running Loki with Administrative Credentials In the screenshot above, we are executing Loki with administrative rights.
This means that Loki is able to scan process memory.
A normal user can only scan the process memory of processes that run with the same user account. Processes of other accounts cannot be accessed.
An administrator account has the debug privilege, and this privilege can be activated to access processes of other accounts: this means that the memory can be read and scanned.
Loki will only perform process memory scans when it has the debug privilege (e.g. is running under an administrative account). I f it is running as a nonnal user, it will not perform memory scans (even limited to processes ofthe same account as the one executing Lok.i).
Loki will use YARA rules to scan the process memory and it will also report on processes that have open ports, i.e. that are listening for network connections.

102

© 2017 Erik Van Buggenhout & Stephen Sims

Loki Generating Log Files

, \Joki,_.· lol<l·-1.log $110$$1118: tfdll S\MF1 LOll, Nohe· : Stwting L.oti ScM SVSlbh
OAH: wi ndow9 l10881T18: 17 llZ SUA:Fl LOU Jnfo1 Fil· ..... C"'-t'kt·rHtlU ini Ueliud with Z.S1$ r.-g:H pett.rM 1lH81Tl811ld lZ SURfl LOU Info~ CZ Mt"Wt"' irw.Uc-.tort lrutielh~ vith J210lf d....,h 1let8ll1·1 I t i t22 $_.I L.OClr lnfo1 H.tUdous ND$ Kuhn in1.ti·lhM vith li,214 h,HMt: 1l'Q. .1t1e111:t2Z SURFI LOlli Info: ~lidou. SHA1 ..,_CM· ini Heliud with 1552 hNMt 81teal1111: lf: 12Z SI.WI LOU: Info , "41iciou, SHA2'5C Hnh. . initiaU.:x..d ri11th 20'91 twi~, 17Nt1Tl8d7dU SUAF'I LOU: lnfo1 hlM Potitiv. Hn-hM initiahzff with 38 hath.. Glloa&ITIG, ll 12:Z SURfl LOlt~ lf\f<o· Proc:"ti."'9 YMQ n,l. . foldw" C~\lold\. J · ipt1.··· ...t..M/'.i1¥· 178U1Tt., 1l 122 '$Uf¥'1 LOClc lnfo l lnit i·lidng Ytlf"I ruJ· ..,t_aliton~_ret , v,v 11'8I01111: 1TJIZZ Sl#tf'I lOkl: Info: lnitializ.1119 Yen n,l· a,pt~-.>t11. yer 17etelO8!1fJ l2Z SUAF'I LOll 1 tnfo 1 lnihelidnt V..-e Nit ·pt_6f)t1f. Nh,wt, V-1Ttte1T10; 1l': 12Z SURFI LOI.I : Into 1 Inhblh.!ng .,.,.. rvl· apt_.,u,. ~ 81TOl81Tl8: 1fi l2Z SUAfl l0U z Ihf01 tniti·li'Z-1"9 Yera n1l· 11Pt_ept21 . yer 1T8I01Tll11l'd U 5Lltf1 LOI.I : Info! IniUalidt'lig .,.,... rvl· ..,t...tJ.pt2'..g,'h:tlv..· t ~ . yar I188&1TIG: 11: 12Z SUA:F1 LOU · Jnfo: Initializing Yw· rul· tpt_apUG_b6CU pae·. ver t78181T18: 17112:2 SURfl LOU : Info: lnttielidrtg Yara Nl· -,t_6f)t5........,.· ·ytr 1lOlt1f10, 17: 12Z SURF'I LOU Jnfo: 11\itialhing Vv· rule apt..,Ne:1tdoor'_...,h_PV,thOn. VW ll0t&IT10i l7; 12,l SUAfl LCl:.I; tnto1 lnitialiun,g ..,.,. rule apt_bkk~·-var 1781G1Tll: 1J:12Z SUAF'I LOU : Info: 1.nitiatt.zing Yw· r"l· apt_bff9't:.,.,,.tc..1J.,.. 1?8881T1911l1122 SIMtf1 LO(J: tnfo1 Jnitialhin,g Y·· n.ih a,t..,1>4>h·~·hk~M'd-bur-... yer 171181'10 17 lU: SURf'I L0U1 Info j lnHialhlf\9 y.,. t"\11· .,t_b1Kk~w-1Jer 1~1Tt8· l1i 1U SURF'I LOU : Jnfo1 Jniti·lhi'-9 Y.-a N1· apl_blCK1(.tn+rw._.in-et e1l.,- v-,"' 1lOIOIT10: 17t l2Z $1.#1 LOU . lnf'o1 Inhielhint Va.-. rul· ..>t..bl\Mhrait·_Mdivi . ~ 1l8181l18t1111U SUAfl LOU: lnf'oi lnitl· linng Vw-· rvle ~t..b!X.kt-ye. y,-r 170I01ll9t If: l:ZZ $\.ltfl LOU : Info! 11\it i ·ltzit'lig Vtlf'a n.il· ept_ceroon_p.,...._.t ur-h . y.,-
110$01Tl8; 17; 12Z S\.1¥'1 LOil : Info In1ti·lhi"9 Y.re n,1· ept_u.,...- .IIJN
1f8I01T1t: 1fl12Z $Wtt1 LDl.1 1 Il"lfo1 JnitleliZl"9 Yara rut· -,t,.c-hMl'lirK·t .yW 1'tOIGIT1G 1Tt 12Z ~ 1 LOl:l : Info: lniti·lizi119 y-,· rul· -,t_cloudduke, V6"' 1lOSOITIOd1 122 SUAFI LOJ.l lnfo; lluUeli:zing Ywe ,-ul· ept...cn_pp..Zff'Ot ,....,t1TUG1Tll: 17 d 2Z SI..MV"I LOIC.I : Info~ lnitielidng Yer· NJ· -.pt_c:odoao, ve,t"' 817fl01Tlei lld 2Z S\llf'l LOI.le Info: JnitHlizi"9 Vwe Nh -,t,.coni ..,.ct_et.,.t , ~ ueu1110~11 '2Z Statfl LOCJ. Info: Jntti·lh.i v ... r-ul· t cn...h ~rilH.
SAN~

Loki will create a log file of its scanning activities.
This text file is created in the same folder that contains the Loki executable.

Loki Generating Log Files Loki will create a log file of its scanning activities.
This text file is created in the same folder that contains the Loki executable.
This log file does not only contain detection for IOCs, but it a lso gives an indication what type of scans Loki performs.
From the start of the example above, we can see that Loki looks for a large amount ofthe following IOC types:
Filenames (with regular expression patterns) Command & Control server indicators MDS hashes SHA! hashes SHA256 hashes
It even has a whitelist: false positive hashes.
This log can be processed automatically after a Loki scan for IOC detections.
Loki can also produce a format better suitable to automatic processing with the CSV option.

© 2017 Erik Van Buggenhout & Stephen Sims

103

Threat Intelligence - Summary
Threat intelligence can be an excellent addition to your cyber security toolkit, but there's a few pitfalls you need to evade:
· Ensure you understand the difference between strategic, tactical and operational threat intelligence (and how to use each category);
· Set up a process to obtain valuable threat intelligence that is relevant to your organization;
· Increase your maturity so threat intelligence can be effectively leveraged/ operationalized!
SANS has a dedicated course on how to deal with all different concepts of threat intelligence, label FOR.578 - Cyber Threat Intelligence.
Threat lotelligeoce - Summary Threat intelligence can be an excellent addition to your cyber security toolkit, but there are a few pitfalls you need to evade:
· Ensure you understand the difference between strategic, tactical and operational threat intelligence (and how to use each category);
· Set up a process to obtain valuable threat intelligence that is relevant to your organization; · Increase your maturity so threat intelligence can be effectively leveraged / operationalized!
SANS has a dedicated course on how to deal with all different concepts of threat intelligence, label FOR578 Cyber Threat Intelligence.

104

© 2017 Erik Van Buggenhout & Stephen Sims

Threat Intelligence -Additional Resources
Some additional resources concerning threat intelligence:
· The MISP project htq>: (lwww.misp-project.org/
· Loki https: //github.com/Neo23xo/Loki
· AlienVault OTX https: //otx.alienvault.com/
· ThreatCrowd htq>s://www.threatcrowd.org/ Curated list ofthreat intelligence sources https:/ /github.com/hslatman/awesome-threat-intelligence
SANS
Defining Threat Intelligence Some additional resources concerning defining threat intelligence:
· The MISP project http://www.misp-project.org/
· Loki https://github.com/Neo23x0/Loki
· Alienvault OTX https://otx.alienvault.com/
· Threatcrowd https://www.threatcrowd.org/
· Curated list of threat intelligence sources https:/ /gith u b.com/hslatman/ awesome-threat-inte 11 igence

© 2017 Erik Van Buggenhout & Stephen Sims

105

Course Roadmap
Day 1: Knowing the adversary, knowing yourself Day 2: Averting Payload Delivery Day 3: Preventing Exploitation Day 4: Avoiding Installation, foiling Command &Control &thwarting lateral movement Day 5: Exfiltration, Cyher Deception & Incident Response Day 6: APT Defender Capstone

SECS99.S
Data exfiltration Typical data exfiltration strategies Exercise: Detecting data exfiltration using Suricata
Cyber deception strategies Tricking the adversary Exercise: Making your honeypot irresistibly sweet
Leveraging threat intelligence
· Defining threat intelligence Exercise: Leveraging threat intelligence with MISP & Loki Patrolling your network Proactive threat hunting strategies Exercise: Hunting your environment using OSQuery / ELK Incident response Incident response process Exercise: Responding to an incident using GRR

SANS

This page intentionally left blank.

106

© 2017 Erik Van Buggenhout & Stephen Sims

Exercise - Leveraging Threat Intelligence with MISP & Loki
IT~e objective of the lab is to leverage threat intelligence that is available in MISP. We will perform a small walkthrough of the MISP interface, after which we will download some YARA rules and use them as input for t he Loki APT scanner!
High-level exercise steps: L Get acquainted with the MISP interface 2. Adding an event & attributes in MISP 3. Exporting YARA rules from MISP 4. Running Loki using the exported YARA rules
, SAN~
Exercise - Leveraging Threat Intelligence with MISP & Loki The objective of the lab is to leverage threat intelligence that is available in MlSP. We will perform a small walkthrough of the MSIP interface, after which we will download some YARA rules and use them as input for the Loki APT scanner! High-level exercise steps: I. Get acquainted with the MISP interface 2. Adding an event & attributes in MISP 3. Exporting YARA rules from MISP 4. Running Loki using the exported YARA rules For additional guidance & details on the lab, please refer to the LOOS workbook.

© 2017 Erik Van Buggenhout & Stephen Sims

107

Exercise - Leveraging Threat Intelligence with MISP & Loki - Conclusions

Throughout this lab, we introduced MISP & Loki as two tools that can be used to facilitate the collection & leveraging oftechnical threat intelligence:

·MISP
Threat Sharing

We used MISP as our central "database" of Indicators of Compromise. We walked through its main menu's and illustrated how it can be used to share information with other organizations.

We extracted a specific set ofIOCs from MISP, after which we loaded them in Loki's simple IOC scanner. We also illustrated how Loki works and how we could leverage it in our environment!

SAN.~
Exercise - Leveraging Threat Intelligence with MJSP & Loki-Conclusions Throughout this lab, we introduced MISP & Loki as two tools that can be used to facilitate the collection & leveraging oftechnical threat intelligence:
We used MlSP as our central "database" of Indicators of Compromise. We walked through its main menu' s and illustrated how it can be used to share information with other organizations.
We extracted a specific set of IOCs from MISP, after which we loaded them in Loki's simple IOC scanner. We also illustrated how Loki works and how we cou ld leverage it in our environment!

108

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
Day 1: Knowing the adversary, knowing yourself Day 2: Averting Payload Delivery Day 3: Preventing Exploitation Day 4: Avoiding Installation, foiling Command & Control & thwarting lateral movement Days: Exfiltration, Cyber Deception & Incident Response Day 6: APT Defender Capstone

SECS99.S
Data e xfiltration Typical data exfiltration strategies Exercise: Detecting data exfiltration using Suricata
Cyber deception strategies Tricking the adversary Exercise: Making your honeypot irresistibly sweet
Le ve r aging threat intelligence Defining threat intelligence
· Exercise: Leveraging threat intelligence with MISP & Loki Patrolling yo ur ne twork Proactive threat hunting strategies Exercise: Hunting your environment using OSQuery / ELK Incide nt response Incident response process Exercise: Responding to an incident using GRR

SANS

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

109

Can We Detect Advanced Adversaries in Real Time?

Traditionally, a lot of effort has been placed on real time detection techniques ...

Log centralization

IDS

24/7 soc

SIEM technology Alerting
Next-Gen FW

I Specific signatures define malicious behavior and alert when triggered;

IMonitoring of these alerts is performed by a multi-tiered SOC team that reviews and categorizes alerts. Upon identification of a confirmed incident, the incident response process is kicked off!

SANS

Can We Detect Advanced Adversaries in Real Time? Js it possible to detect advanced adversaries that infiltrated our corporate networks in real-time? This difference in goals and modus operandi between advanced adversaries and common adversaries is reflected in the methods we apply to detect advances adversaries versus common adversaries.
Traditiona lly, a lot of effort has been placed on real-time detection technologies. Typical technologies that fit in this area include:
· Log centralization · SIEM technology · 24/7 Security Operations Center · Automated alerting · Intrusion Detection Systems · Next-Gen Firewall

These real-time detection technologies have been put into place to detect common adversaries, but are they effective to defeat advanced adversaries?
We typically rely on the definitjon of known bads for real-time detection. Known bads are specific signatures that define malicious behavior and can be used to generate alerts when the signature is triggered.
A known bad for example is the IP address of a known command & control server used by a specific ransomware family. We can use an IDS to define a rule that triggers each time we see a tcp connection to that LP address.
Would this rule alert us when malware connects to its command & control server with that IP address? Yes! Would this rule alert us when malware connects to its command & control server with another IP address? No! Would this ruJe alert us when one ofour users visits a web site with that IP address? Yes!

110

© 2017 Erik Van Buggenhout & Stephen Sims

This illustrates a couple of problems with real-time detection. A TCP connection to this specific address is indirect evidence ofmalware on our corporate network. Yes, malware that connects to that IP address will be detected. But non-malicious connections to that IP address will also generate alerts: false positive alerts.
How could these false positive alerts happen? Due to the shortage of 1Pv4 addresses, JPv4 addresses are shared and reused. Web servers can host many websites with the same lpv4 address, and after some time, servers are decommissioned and their 1Pv4 address is reused for other purposes.
This sharing and reuse lead to false positive alerts.

© 2017 Erik Van Buggenhout & Stephen S ims

111

Real-Time Detection Issues: Security Alert Fatigue
"Alarmingly, despite having invested significantly in information security solutions to the point of utilizing dozens ofpoint products, nearly 74% ofthose surveyed reported that security events/alerts are simply ignored because their teams can't keep up with the suffocating volume."
Enterprise Strategy Group s tudy, 2016
SANS
Real-Time Detection Issues: Security Alert Fatigue One problem with real-time detection is security alert fatigue. Real-time detection methods generate too many false positive alerts, with a negative impact on the motivation and morale ofsecurity teams that have to investigate the alerts. According to an Enterprise Strategy Group study from 2016, "Alarmingly, despite having invested significantly in information security solutions to the point of utilizing dozens of point products, nearly 74% of those surveyed reported that security events/alerts are simply ignored because their teams can't keep up with the suffocating volume." This is an alarming trend. With¾ of the respondents reporting alert fatigue, real-time detection methods cannot be called effective. Inside that large volume alerts (mostly false positive alerts), some true positive alerts will occur. But because ofalert fatigue, these true positive alerts will be ignored too, and attacks will remain undetected.

112

© 2017 Erik Van Buggenhout & Stephen Sims

Real-Time Detection Issues: Sophisticated Attacks Have Different Steps
Can you really detect sophisticated attacks in real-time? Adversaries take their time when laterally movement throughout your network, it's often not easy to "connect the dots" and realize what's going on...

Weaponization
I

r

·

Delivery
I

Installation

Action on Objectives

SANS

Real-Time Detection Issues: Sophistkated Attacks Have Different Steps Can you really detect sophisticated attacks in real-time? Adversaries take their time when laterally movement throughout your network, it' s often not easy to "connect the dots" and realize what's going on ...
To give you a practical example: Consider an adversary that spiders your web site, identifies a "jobs@" email address as a target for phishing, delivers a weaponized CV, infects the system ofan HR employee AND setups a Command & Control channel.
Your real-time alerting solution might indicate that a spider is running over your web site, but it won't be able to connect the dots to:
· Understand that two days later, a phishing email was sent to your "jobs@" email address with a weaponized CV document (including a malicious macro);
· Notice the C&C channel that is set up from the workstation of the HR employee towards the adversary server.

© 2017 Erik Van Buggenhout & Stephen Sims

113

Real-Time Detection Issues: Some Statistics
Can you really detect sophisticated attacks in real-time?
The global median time between compromise & detection is 99 days*
(Source: FireEye M-Trends 2017)
SA~
Real-Time Detection Issues: Some Statistics A strong indicator that shows that real-time detection fails to detect sophisticated attacks comes from a survey from FireEye published in M-Trends 2017: "The global median time between compromise & detection is 99 days". This shocking statistic should make us reflect on the strategies we employ! It means that on average, more than 3 months take place between a successful attack inside a corporate network and the detection ofsaid attack by the corporate security teams. Not only is this a long period, but it is the global median time: halfof the attacks take 3 months and longer to be detected (ifthey get detected at all). FireEye's report is not unique. Similar statistics have been reported by other security companies and organizations. Sophisticated attacks can stay under the radar for a long time. Not only does this give the opportunity to advanced adversaries to operate undetected inside our corporate networks for a long period, it also means that our capability to do something about the attack is severely reduced.

114

© 2017 Erik Van Buggenhout & Stephen Sims

Real-Time Detection Issues: Summary
While effective real-time detection would be ideal, there's a few hick-ups that often occur:
· Advanced adversaries typically use tailored, currently unknown, techniques (so you have no predefined "alerts" or "signatures" for that);
· Real-time detection has to happen "real-time"(©), which often leaves no room for in-depth analytics resulting in false positives & noise;
· Real-time detection is often fully outsourced to external SOCs, which lack context on your environment again resulting in increased noise!
1~ 111!:: Many organizations are embracing threat hunting and complement their real-time detection efforts with periodical threat hunting efforts
SANS
Real-Time Detection Issues: Summary While effective real-time detection would be ideal, there are a few hick-ups that often occur:
· Advanced adversaries typically use tailored, currently unknown, techniques (so you have no predefined "alerts" or "signatures" for that); Real-time detection has to happen "real-time" (©), which often leaves no room for in-depth analytics resulting in false positives & noise;
· Real-time detection is often fully outsourced to external SOCs, which lack context on your environment again resulting in increased noise!
Many organizations are embracing threat hunting and complement their real-time detection efforts with periodical threat hunting efforts. Instead of waiting for a security alert, we go out and search for suspicious behavior ourselves!

© 2017 Erik Van Buggenhout & Stephen Sims

115

Threat Hunting vs. Real-Time Detection
Real-Time Detection
· Relies on known bads (e.g. signatures, rules, ...) · Generates alerts that are to be further investigated by analysts · Is typically highly automated · Can leverage Indicators of Compromise
Threat Hunting
· "Hunt" environment for unknown bads · Generates confirmed incidents which trigger incident response · Can partially leverage automation, but majority is manual effort · Can generate Indicators of Compromise
SANS
Threat Hunting vs Real-Time Detection When we compare threat hunting with real-time detection, many differences will stand out.
While real-time detection is based on known bads, threat hunting is based on anomalies. Real-time detection takes a narrow view ofour corporate infrastructure using rules. Threat hunting tries to see the bigger picture and looks for anomalies and strange behavior inside our corporate infrastructure. An alert would be: we detected a TCP connection to IP address X.X.X.X. An anomaly would be: for this day, we see an unusually large volume ofdata flowing to web site XYZ. Another example: real-time detection would detect a User Agent String used by a known family ofmalware, threat hunting would uncover User Agent Strings that have never been seen before inside our corporate network.
Real-time detection generates alerts that require further investigation, while hunting generates confirmed incidents which trigger incident response. While a SOC operator has to go through a list ofalerts to detect attacks, a threat hunting analyst is presented with a large volume ofdata that he analyzes. In threat hunting, automation is mainly used to enhance the visibility ofthat large "data set" (e.g. using the ELK stack for dashboarding can be very powerful).
While real-time detection is highly automated, threat hunting is a manual dTort that can be machine assisted.
With regards to threat intelligence, real-time detection typically consumes indicators ofcompromise, while threat hunting can help you generate indicators ofcompromise.

116

© 2017 Erik Van Buggenhout & Stephen Sims

Threat Hunting - Maturity Model
Threat hunting can be performed by all organizations (and a lot ofthem are already doing it, without using the term!). It's important however to understand what level of maturity your organization currently has and aim for continuous improvement
In his personal blog, David Bianco, defined an interesting 5-level "maturity model" for threat hunting:

HMMO Initial
· REiies primarily on automated alerting
·Littleor no routine data collection

·Highorvery high
level of routine data collection

HMM4
Leading
· "utomates the majority ofsuccessful data analys~ procedures
· High or very high level of routine data collection

Threat Hunting - Maturity Model Threat hunting can be perfom1ed by all organizations (and a lot ofthem are already doing it, without using the term!). It's important however to understand what level of maturity your organization currently has and aim for contumous improvement
In his personal blog, David Bianco, defined an interesting 5-level "maturity model" for threat hunting:

His hunting maturity model (HMM) has 5 levels, ranging from Oto 4.

Level HMMO is the initial level. Organizations with this maturity level rely primarily on automated alerting and have little or no routine data collection.

Level HMM I is the minimal level. Organizations with this maturity level incorporate threat intelligence indicator searches and have a moderate or high
level of routine data collection.

Level HMM2 is the procedural level. Organizations with this maturity level fo llow data analysis procedures created by others and have a high or very high
level of routine data collection.

Level HMM3 is the innovative level. Organizations with this maturity level create new data analysis procedures and have a high or very high level of routine
data collection.

Level HMM4 is the leading level. Organizations with this maturity level automate the majority of successful data analysis procedures and have a high or
very high level of routine data collection.

By detennining your corporate threat hunting level compared to this model, you know where you are and where you can evolve to.

© 2017 Erik Van Buggenhout & Stephen Sims

117

Threat Hunting - The Sliding Scale of Cyber Security (I)
In the SANS whitepaper "The who, what, where, when, why and how of effective threat hunting" SANS instructors Rob Lee & Rob M Lee consider the "Sliding Scale ofCyber Security":

The planning,
establishing, and upkeep ofsystems with security
in mind

Systems added to the Archi"cture to provide
rehable defense or insight against threats
without consistent human inlerattion

The processofanalysts monitoring for,
responding to, and learning from adversaries internal to rhe networit

Collecting data, exploiting n into information, and l)(oducmg Intelligence

Legal countermeasures
and self-defense action~ against an adveisary

Threat Hunting- The Sliding Scale of Cyber Security In the SANS whitepaper "The who, what, where, when, why and how ofeffective threat hunting" SANS instructors Rob Lee & Rob M Lee define the "Sliding Scale ofCyber Security". This sliding scale is similar to the Threat Hunting Model, but the focus here is on defining 5 different phases of investment organizations can make when tackling cyber security. These phases are:
· Architecture: The architecture phase refers to all typical aspects of planning for cyber security. The idea is to ensure design within the organization (including systems, networks, applications, . ..) is done with cyber security in mind. This phase thus attempts to prevent vulnerabilities from arising;
· Passive defense: Within passive defense, we consider all tools and systems that are added to the architecture to provide additional defense or insight against threats, WITHOUT consistent human interaction. This thus typically includes firewalls, IDS, lPS, ...
· Active defense: Active defense covers all activities performed by analysts monitoring for, responding to, and learning form adversaries internal to the network. Intelligence: This phase is the process of collecting data, turning it into information which can be used to generate intelligence/ useful knowledge that can help improve an organization's security posture.
· Offense: The last category, "offense" includes LEGAL countermeasures that can be opted for by organizations when defending against adversaries . It's important to note lhat, for private organizations, offensive options are highly limited, and they typically have a low ROJ (investments are typically better placed in other phases ofthe scale).
On this sliding scale, we can position threat hunting mainly as part ofthe "Active defense" phase, with an integration of some " Intelligence" fundamentals. Meanwhile, security monitoring can be pos itioned between "Passive defense" and "Active defense".

118

© 2017 Erik Van Buggenhout & Stephen Sims

Threat Hunting - The Sliding Scale of Cyber Security (2)

Thfplo~ tfllblishlng.MICI~ o(l)'Sll!fflSwith lf<llrity
··mllld

S)SltfflSaddfdto tlle ArdW<t, n to pro,ldt
r<l®'fdmf>!tOI loslgbl llgo!MIMffl
withootCbnli!l,nt h..,...lnl.,Ktioo

Thf proctsl ofilWly5ts
moottomgr«.
ltlP')tldlogto,ond ~,ming hom ..tlffl.lrltf
l\ltfM to !htlltlW<IR

·liR9 Colltaing~ u,
ItlnlolofooNlion, aod p,odudng lnll41i9tn<t

IWe can use the sliding scale to understand what the potential ROI of threat hunting in your organization can be!

IIf there are serious gaps in architecture & passive defense (e.g. the environment is full of vulnerabilities), threat hunting ROI will be limited

SANS

Threat Hunting-The Sliding Scale of Cyber Security (2) We can use this sliding scale to easily assess to what extent threat hunting can be a valuable investment of time & resources for an organization.
Imagine for example an organization that has significant gaps in architecture & passive defense: No proper vulnerability management process is in place and the majority of systems is unpatched. This is a rather extreme example, but it's important to note that in such an environment, threat hunting is not a wise investment: due to the immature architecture, too much noise will be generated, resulting in ineffective hunting results.

© 2017 Erik Van Buggenhout & Stephen Sims

119

Threat Hunting - Critical Success Factors
So, how can we start doing threat hunting? ... What do we need?
Experienced analysts that know how attacks work and what to look out for. These people should also understand your environment and know what your crown jewels are.
A large collection of logs that is being generated throughout different parts of your environment. This includes any type of logs (Windows event logs, firewalls, ...)
A large, centralized, data repository that can be used to collect available logs for your environment.
Visualization tools that can help analysts understand what all of the logs mean and facilitate deeper analysis & investigation.
SANS
T hreat Hunting - Critical Success Factors Threat hunting can detect malicious activity by reviewing available logs for anomalies.
Critical success factors for threat hunting are:
· Experienced analysts that know how attacks work and what to look out for. These people should also understand your environment and know what your crown jewels are. A good knowledge ofoffensive security methods is required to be a good threat hunter: a poacher makes the best gamekeeper. Meanwhile, these people should also understand your environment, which is not an easy "blend".
· A large collection of logs that are being generated throughout different parts ofyour environment. This includes any type of logs (Windows event logs, firewalls, ...) Threat hunting relies heavily on logs generated by different systems in your corporate network. These logs are not always enabled by default, so you might need to revise your logging & monitoring strategy.
· A large, centralized, data repository that can be used to collect available logs for your environment. We cannot rely on a myriad of different log types spread across o ur environment. In order to effectively hunt, we need to collect all logs centrally, so wc can easily search, qm:ry and analyze them.
· Lastly, as we will be facing vast amounts ofdata, it's important that data can be correctly visualized, so analysts can create dashboards that facilitate further investigation. Yet again, the ELK stack provides an interesting solution for this!

120

© 2017 Erik Van Buggenhout & Stephen Sims

Threat Hunting - Overall Process

I. Define

(

HYPOTHESIS

4. Provide
FEEDBACK

2. Perform ANALYSIS

l

)
3. Identify

PATTERNS

Threat hunting should be an iterative process. where the following actions are performed:
I. Define hypothesis: Define a hypothesis that
can be tested (e.g."Adversaries are attempting to lnfllcrace our organizarion using phishing mails");
2. Perform analysis: Test the hypothesis by
analyzing the available logs;
3. Identify patterns: Through your analysis,
identify potential patterns of malicious behavior:
4. Provide feedback: Based on the results of the
hunt. provide feedback (e.g. definition of new loC's or use cases that can be used in real-time detection).

SANS

Threat Hunting- Overall process Threat hunting should be an iterative process, where the following actions are perfon11ed:
1. Define hypothesis: Define a hypothesis that can be tested (e.g. "Adversaries are attempting to infiltrate our organization using phishing emails");
2. Perform analysis: Test the hypothesis by analyzing the available logs; 3. Identify patterns: Through your analysis, identify potential patterns of malicious behavior; 4. Provide feedback: Based on the results ofthe hunt, provide feedback (e.g. definition of new IOC's or use
cases that can be used in real-time detection).
Throughout this section of the course, we wiII zoom in on a few of these phases!

© 2017 Erik Van Buggenhout & Stephen Sims

121

Threat Hunting - Definition of Hypotheses Is Key!
As we've seen in the previous diagram, the first step in threat hunting is the definition of hypotheses. This might sound intimidating, but it's a fairly straightforward process. There are three main ways of generating hypotheses:
· Intelligence-driven hypothesis: "I know this APT group uses C&C servers hosted in South-Africa. I will review my perimeter connectivity for traffic to South African servers."
· Situational awareness hypothesis: "I know the crown jewels for my organization are our new R&D plans, so I will create hypotheses on how these could be stolen."
· Domain expertise hypothesis: "I am an expert in DNS and know DNS could be used as a covert channel to exfiltrate data. I will thus review outgoing DNS traffic for anomalies."
Robert M. Lee &David Bianco wrote an excellent whitepaper titled "Generating Hypotheses for Successful Threat Hunting", a must-read!
T hreat Hunting- Definition of Hypotheses Is Key! As we've seen in the previous diagram, the first step in threat hunting is the definition of hypotheses. This might sound intimidating, but it's a fairly straightforward process. In order to provide some clarity, we have provided an easy-to-understand example ofthese hypotheses:
· fntelligence-driven hypothesis: "I know this APT group uses C&C servers hosted in South-Africa. 1will review my perimeter connectivity for traffic to South African servers."
· Situational awareness hypothesis: " I know the crown jewels for my organization are our new R&D plans, so I will create hypotheses on how these could be stolen."
· Domain expertise hypothesis: " I am an expert in DNS and know DNS could be used as a covert channel to exfiltrate data. I will thus review outgoing DNS traffic for anomalies."
There is no answer to the question: "What type of hypothesis definition is best?". Successful threat hunting combines these different types of hypotheses, as they can all be highly useful in a given situation. Robert. M. Lee & David Bianco wrote an excellent whitepaper titled "Generating Hypotheses for Successful Threat Hunting", a must-read for threat hunters!

122

© 2017 Erik Van Buggenhout & Stephen Sims

Threat Hunting -A Word on Automation
I
As "threat hunting" is becoming increasingly popular, some vendors are trying to sell "fully automated hunting" solutions. These, however don't exist...
Automation can be useful, but we need more!
Threat hunting handles large volumes of data and thus benefits from automation techniques:
· Automatically collecting logs from end-point system · Using data analysis techniques to present data in a meaningful way to hunter
· Least-frequency analysis · Visualization & dashboarding techniques
The crucial part is using the human effort where it is used best: not to crunch millions of alerts, but to create/ define a data analysis technique and reviewing its results!
SAN~
Threat Hunting-A Word on Automation As "threat hunting" is becoming increasingly popular, some vendors are trying to sell "fully automated hunting" solutions. These, however, don't exist. ..
Automation can be useful. but we need morel
Because threat hunting handles large volumes of data, it can greatly benefit from automation techniques: · . The collection and centralization of logs from end-point system should be fully automated
Data analysis techniques that present the data in a meaningful way to the threat hunting analyst have to be used, like: · Least-frequency data analysis techniques
· Data visualization techniques · Dashboarding techniques
It is crucial to use the human effort where it is used best: not to crunch millions of alerts, but to create/ define a data analysis technique and reviewing its results afterward. Humans are not good at boring, repetitive tasks, but they excel at recognizing patterns.

© 2017 Erik Van Buggenhout & Stephen Sims

123

Threat Hunting - Collecting Required Logs

As we discussed before, log collection is a key part of threat hunting! In an ideal environment, you are already collecting logs from a wide variety of sources. As we don't live in an ideal world however, it is sometimes up to the hunter to arrange for his own log collection. Here's two interesting approaches:

Agent based

Multiple vendors have agents available via w hich you are able to extract logs from hosts. Agents allow for easy central management and often have many features such as IOC hunting built in already. However, adding an agent to a host installation is something that is often frowned upon by the workstation/server management team.

Script based

Scripts allow for great flexibility and don't add a load to your hosts when they are not running. This is often a preferred option by incident responders w hen they need to obtain information fast and don't have time to wait for an agent to be deployed. Scripts however require maintenance and might not provide all features and agent has.

Threat Hunting- Collecting Required Logs As we discussed before, log collection is a key part of threat hunting! In an ideal environment, you are already collecting logs from a wide variety of sources. As we don't live in an ideal world, however, it is sometimes up to the hunter to arrange for his own log collection. Here are two interesting approaches:
Agent-based: Multiple vendors have agents available via which you are able to extract logs from hosts. Agents allow for easy central management and often have many features such as IOC hunting built in already. However, adding an agent to a host installation is something that is often frowned upon by the workstation/server management team.
Script-based: Scripts allow for great flexibility and don't add a load to your hosts when they are not running. This is often a preferred option by incident responders when they need to obtain information fast and don't have time to wait for an agent to be deployed. Scripts, however, require maintenance and might not provide all features an agent has.
Later in this course, we will discuss some script based approach~d and agent-based approaches.

124

© 2017 Erik Van Buggenhout & Stephen Sims

Threat Hunting - Collecting Required Logs - Polling for Information
When discussing the collection oflogs using scripts, one (of many) readily available resource is PSHunt created and open sourced by Infocyte.
"PSHunt is a PowerShell Threat Hunting Module designed_to scan remote endpointsfor indicators of compromise or survey themfor more comprehensive information related to state ofthose systems (active processes, autostarts, configurations, and/or logs)."
You can invoke PSHunt through various channels (WMI, PowerSbell Remoting, Scheduled tasks and PSExec).
PSHunt has different modules and functions: · Discovery: identifies hosts within the network; · Scanners: deploys scripts to host to collect information such as registry values and OS info; · Surveys: deploys scripts to hosts to collect information from that host (digs deeper than
scanners); · Analysis: provides a framework for analyzing and displaying survey and scan results.
SAN~
Threat Hunting - Collecting Required Logs - PSHunt When talking about collecting logs using scripts, one readily available resource is PSHunt created and open· sourced by lnfocyte.
·PSHunt is a PowerShe/l Threat Hunting Module designed to scan remote endpoints/or indicators of compromise or survey them for more comprehensive information related to state ofthose systems (active processes, autostarts, configurations, and/or logs). "
You can invoke PSHunt through various channels (WM[, PowerShell Remoting, Scheduled tasks and PS Exec).
PS Hunt has different modules and functions: Discovery: identifies hosts within the network; Scanners: deploys scripts to host to collect information such as registry values and OS info; Surveys: deploys scripts to hosts to collect information from that host (digs deeper than scanners); Analysis: provides a framework for analyzing and displaying survey and scan results.
PSHunt can be found here: hnps ://github.com/lnfocyte/PSHunl

© 2017 Erik Van Buggenhout & Stephen Sims

125

Threat Hunting - Collecting Required Logs - OSQuery (I)
Iosquery (by Facebook) allows you to easily ask questions about your Linux, Windows, and macOS infrastructure. It is used by organizations for a wide variety of use cases: intrusion detection, threat hunting, operational monitoring...
Iosquery gives you the ability to query and log things like running processes, logged in users, password changes, USS devices, firewall exceptions, listening ports, and more.
IIt supports ad-hoc queries, but querying can also be scheduled. As an optional feature, it also allows you to perform file integrity monitoring.
Threat Hunting -Collecting Required Logs - OSQuery (I) osquery (by Facebook) allows you to easily ask questions about your Linux, Windows, and macOS infrastructure. It is used by organizations for a wide variety of use cases: intrusion detection, threat hunting, operational monitoring, ... osquery gives you the ability to query and log things like running processes, logged in users, password changes, USB devices, firewall exceptions, listening ports, and more. It supports ad-hoc queries, but querying can also be scheduled. As optional features, it also allows you for example to perform file integrity monitoring.

126

© 2017 Erik Van Buggenhout & Stephen Sims

Threat Hunting - Collecting Required Logs - OSQuery (2)
····-=n=-
osquery> SELECT uid, name FROM listening_ports 1, processes p WHERE l. pid=p. pid;
OSquery provides a generic SQL query language that can be used by analysts to obtain~ system information from a wide variety of operating systems. This prevents the need for in-depth OS knowledge during data collection!
SANS
Threat Huotiog - Collecting Required Logs - OSQuery (2) In the above slide, we can see an example of how OSQuery facilitates our work: we can use a generic query language to query a wide variety ofOS's. OSQuery provides a generic SQL query language that can be used by analysts to obtain system information from a wide variety ofoperating systems. This prevents the need for in-depth OS knowledge during data collection!

© 2017 Erik Van Buggenhout & Stephen Sims

127

Threat Hunting - Collecting Required Logs - OSQuery (3}
To give you a taste of how powerful OSQuery can be for security purposes, consider the following queries:
SELECT* FROM processes WHERE on_ disk=o;
· Detect running processes that do not have an executable stored on disk
SELECT DISTINCT process.name, listening.port, listening.address, process.pid FROM processes AS process JOIN listening_ports AS listening ON process.pid = listening.pid; => Detect running processes that are listening on a network port
SAN.~
Threat Hunting - Collecting Required Logs - OSQuery (3) To give you a taste of how powerful OSQuery can be for security purposes, consider the following queries: SELECT* FROM processes WHERE on_disk=0; => Detect running processes that do not have an executable stored on disk; SELECT DISTINCT process.name, listening.port, listening.address, process.pid FROM processes AS
process JOIN listening_ports AS listening ON process.pid = listening.pid;
=> Detect running processes that are listening on a network port We will touch upon additional examples during our upcoming lab.

128

© 2017 Erik Van Buggenhout & Stephen Sims

Threat HuntingTools - DataVisualization

[!

As threat hunting handles massive amounts of data, its parsing and visualization will be of the utmost importance to ensure threat hunters can spend their precious time wisely! Excel should not be your main threat hunting tool!

As we've seen during previous parts of the course, our beloved ELK stack can come in handy here again, as it allows for easy creation of custom visualizations!

For an enterprise environment, consider the following example setup for hostbased information:
Deploy OSQuery enterprise-wide using GPOs; Develop queries that will run periodically (e.g. once every day) on all your Windows systems; Use Elastic's filebeat to monitor the OSQuery log file and forward all events to an ELK stack; · Centrally hunt from your Kibana dashboards.

Threat Hunting Tools- Data Visualization As threat hunting handles massive amounts of data, its parsing and visualization will be of the utmost importance to ensure threat hunters can spend their precious time wisely! We do not want to have our analysts search through raw log files or create pivot tables in Excel ... Excel and notepad should not be your main threat hunting tools!
As we've seen during previous parts ofthe course, our beloved ELK stack can come in handy here again, as it allows for easy creation of custom visualizations! It's a wise idea for threat hunters to spend some time getting familiar with Kibana, as the definition of useful visualizations could be key for successful hunting!
For an enterprise environment, consider the following example setup for host-based information:
· Deploy OSQuery enterprise-wide using GPO's; · Develop queries that will run periodically (e.g. once every day) on all your Windows systems; · Use Elastic's filebeat to monitor the OSQuery log file and forward all events to a central ELK stack; · Centrally monitor & hunt from your Kibana dashboards.
We will implement such an approach in our upcoming exercise!

© 2017 Erik Van Buggenhout & Stephen Sims

129

I
Threat Hunting - Summary
IMany organizations are already doing threat hunting, without actually using the term IDepending on the maturity of the organization, threat hunting can provide a high ROI IWhile threat hunting can leverage automation, the process can never be fully automated.
The experience of the hunter is of vital importance (e.g. for hypothesis definition)
ISuccessful threat hunting will require at the very least expert resources, a central repository for logs & data parsing/ visualization tooling
SANS bas dedicated courses that tackle threat hunting in much more detail, e.g. "SANS FORso8 - Advanced Digital Forensics, Incident Response & Threat Hunting"
Threat Hunting- Summary In summary, we'd like to provide the following key takeaways related to threat hunting:
· Many organizations are already doing threat hunting, without actually using the tenn. Whenever analysts are actively looking through their environment to identify suspicious behavior, they are doing a (limited) fonn of threat hunting;
· Although threat hunting can be done by a wide variety of organizations, its effectiveness, and actual ROI will largely depend on the maturity of the organization;
· While threat hunting can leverage automation (e.g. for the collection, parsing & visualization of logs), the process can never be fully automated. The experience & expertise ofthe hunter is of vital importance (e.g. for hypothesis definition);
· Successful threat hunting will require at the very least expert resources, a central repository for logs & data parsing/ visualization tooling
SANS has dedicated courses that tackle threat hunting in much more detail, e.g. "SANS FOR508 - Advanced Digital Forensics, Incident Response & Threat Hunting".

130

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
Day 1: Knowing the adversary, knowing yourself Day 2: Averting Payload Delivery Day 3: Preventing Exploitation Day 4: Avoiding Installation, foiling Command & Control & thwarting lateral movement Day 5: Exfiltration. Cyber Deception & Incident Response Day 6: A.PT Defender Capstone

SECS99.S
Data exfiltration Typical data exfiltration strategies Exercise: Detecting data exfiltration using Suricata
Cyber deception strategies Tricking the adversary Exercise: Making your honeypot irresistibly sweet
Leveraging threat intelligence Defining threat intelligence Exercise: leveraging threat intelligence with MISP & Loki
Patrolling your network Proactive threat hunting strategies
· Exercise: Hunt!ng your environment using OSQuery / ELK Incident response Incident response process Exercise: Responding to an incident using GRR

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

131

Exercise - Hunting Your Environment Using OSQuery & ELK
I J IThe objective of the lab is to implement a light-weight collection tool that will collect system information from the different endpoints in our environment. We will use this information to baseline the systems and detect anomalies!
High-level exercise steps: 1. Configure OSQuery & test it on our local Windows workstation 2. Create a schedule to run OSQuery periodically 3. Configure filebeat to forward OSQuery output to ELK 4. Optional: Create visualizations in Kibana
SANS
Exercise - Hunting Your Environment Using OSQuery & ELK The objective of the lab is to implement a light-weight collection tool that will collect system information from the different endpoints in our environment. We will use this information to baseline the systems and detect anomalies!
Following are high-level exercise steps 1. Configure OSQuery & test it on our local Windows workstation 2. Create a schedule to run OSQuery periodically 3. Configure filebeat to forward OSQuery output to ELK 4. Optional: Create visualizations in Kibana
For additional guidance & details on the lab, please refer to the LOOS workbook.

132

© 2017 Erik Van Buggenhout & Stephen Sims

I
Exercise - Hunting Your Environment Using OSQuery & ELK- Conclusions
Throughout this lab, we introduced OSQuery & ELK as two solutions that can be used to perform "periodic" log collection that can be leveraged for threat hunting!
We used OSQuery as an open-source tool and light-weight agent to periodically collect information from target systems. We leveraged Elastic's filebeat solution to monitor the OSQuery logfile and forward interesting events to our central Elastic instance.
As we've done previously throughout the course, we u sed ELK to be
- · elastic our central log storage, parsing, indexation &visualization solution.

Exercise - Hunting Your Environment Using OSQuery & ELK -Conclusions Throughout this lab, we introduced OSQuery & ELK as two solutions that can be used to perform "periodic"
log collection that can be leveraged for threat hunting!

We used OSQuery as an open-source tool and light-weight agent to periodically collect infom1ation from

,....__

target systems. We leveraged Elastic' s filebeat solution to mon itor the OSQuery logfile and forward

interesting events to our central Elastic instance.

As we've done previously throughout the course, we used ELK to be our central log storage, parsing, indexation & visualization solution.

© 2017 Erik Van Buggenhout & Stephen Sims

133

Course Roadmap
· Day 1: Knowing the adversary, knowing yourself Day 2: Averting Payload Delivery
· Day 3: Preventing Exploitation Day 4: Avoiding Installation, foiling Command & Control & thwarting lateral movement
· Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

SECS99.S
Data exfiltration Typical data exfiltration strategies Exercise: Detecting data exfiltration using Suricata
Cyber deception strategies Tricking the adversary Exercise: Making your honeypot irresistibly sweet
leveraging threat intelligence Defining threat intelligence Exercise: Leveraging threat intelligence with MISP & Loki
Patrolling your network Proactive threat hunting strategies
· Exercise: Hunting your environment using OSQuery / ELK Incident response Incident response process Exercise: Responding to an incident using GRR

SAN~

This page intentionally left blank.

134

© 2017 Erik Van Buggenhout & Stephen Sims

Incidence Response Process
Incident Response is the process that is started when an incident is detected: the organization has detected that (advanced) adversaries have breached security, and starts incident response activities.
Incident response activities are typically executed by a dedicated team of experts, the Computer Incident Response Team (CIRT).
It's almost certain that at one point in time, a security incident will occur. It is thus important to be prepared. Furthermore, several compliance regulations will require a proper incident response plan to be in place (e.g. GDPR).
Incidence Response Process The Incident Response is a process that is started when an incident is detected: we have detected that (advanced) adversaries have breached our security. The reaction to this is to put the organization into incident response mode. This does not mean that the complete organization is involved, usually just a small team.
Incident response requires a dedicated team: the Computer Incident Response Team (ClRT). Another wellknown name for this type ofteam is the Computer Emergency Response Team (CERT).
The first CERT created in the world was Carnegie Mellon University's CERT. Carnegie Mellon University has legal rights to the name Computer Emergency Response Team/CERT, and that is why many organizations use another but similar name, like Computer Incident Response Team (ClRT). It's almost certain that at one point in time, a security incident will occur. It is thus important to be prepared. Furthermore, several compliance regulations will require a proper incident response plan to be in place (e.g. GDPR). lfno dedicated team exists in the organization when an incident occurs, a third-party specialized in incident response can be contracted. Do take into account, however, that even if you can rely on third-party forensic / maIware analysts, incident managers, etc., part of the effort will have to be done by your own teams, as they know the environment best.

© 2017 Erik Van Buggenhout & Stephen Sims

135

Who Should Be Part ofYour CIRT?
The CIRT is composed of cyber security professionals that know your environment AND know how to handle incidents.
· They prepare and plan ahead to prepare the team to handle incidents; · Even if it's an external party, they need to have thorough understanding of
your environment to perform effective incident response; · This involves the definition of a clear process to follow in case of an
incident, and training and practicing the steps of this process; · SANS defines a generic 6-step process for incident response (SANS
SEC504). Many organizations take this a step further & develop concrete "playbooks" for the most common, expected, security incidents.
SANS
Who Should Be Part of Your CJRT? The Computer Incident Response Team is a dedicated team in an organization that will respond to computer incidents. The team is composed of IT security professionals experienced in incident response. On top oftheir experience in incident response, team members have experience and ski lls related to various aspects of IT and computer security. For example, it is not uncommon for a C IRT team member to have the skills to inspect network packets in a packet capture file.
CJRT team members prepare and plan ahead to prepare the ClRT team to handle incidents. Properly handling incidents should be done according to a well-established plan so that no steps are forgotten when an incident is handled.
This involves the definition ofa clear process to follow in case ofan incident, and CIRT team members should regularly train and practice the steps of this process to be well prepared when an incident occurs. Improvisation will not lead to a good outcome of the incident handling process.
To help prepare CJRTs and CIRT team members responding to incidents, SANS defines a 6-step process for incident response. This incident response process is covered in SANS training SEC504: "Hacker Tools, Techniques, Exploits, and Incident Handling". Many organizations lake this a step further & develop concrete "playbooks" for the most common, expected, security incidents.

136

© 2017 Erik Van Buggenhout & Stephen Sims

Why ShouldYou Perform Incident Response?
As course authors, we've seen several organizations do varying degrees of Incident Response with different objectives. Some of the key objectives for incident response include:
One of the most basic incident response objectives is to contain & eradicate an incident, after which business operations can return to normal as soon as possible.
In more mature organizations (& when faced with advanced adversaries), an important additional goal is to perform in-depth analysis of the attack in order to generate threat intelligence. This can be used to obtain an in-depth understanding of the adversary's attack techniques (& your weaknesses!) in order further improve defenses to prevent future attacks.
SAN~
Why Should You Perform Incident Response? As course authors, we've seen several organizations do varying degrees of Incident Response with different objectives. Some ofthe key objectives for incident response include:
· One of the most basic incident response objectives is to contain & eradicate an incident, after which business operations can return to normal as soon as possible.
· ln more mature organizations (& when faced with advanced adversaries), an important additional goal is to perform in-depth analysis ofthe attack in order to generate threat intelligence. This can be used to obtain an in-depth understanding of the adversary's attack techniques (& your weaknesses!) in order further improve defenses to prevent future attacks.
It's important to understand that these objectives are not mutually exclusive. Specific investigations often have both objectives, or there could be scenarios where one objective is more important than the other. Consider a ransomware incident in a smaller organization for example. The focus will most likely more be on containing & eradicating the incident as soon as possible in order to prevent further damage. In an environment where a more advanced adversary is penetrating several systems and attempting to steal sensitive information for example, there is probably a lot of benefit to ensure the incident response

© 2017 Erik Van Buggenhout & Stephen Sims

137

SANS's Six-Step Incident Response Process

4
,,.6. Lessons
Learned 5. Recovery

I. Preparation
CONTINUOUS PROCESS

4. Eradication

·
2. Identification
II
, 3. Containment

SANS
SANS' Six-Step Incident Response Process This is SANS' step by step approach to incident response as covered in SANS training SEC504:
I. Preparation 2. Identification 3. Containment 4. Eradication 5. Recovery 6. Lessons Learned
We recommended going through this 6-step process step by step without skipping steps. It 's important to note that this should always be a continuous process: Once you finish incident response, you derive lessons learned (e.g. TTPs used by your adversaries, missing monitoring capabilities, vulnerabilities in your environment, ...) that will improve your preparation phase, which will increase the chances ofyou detecting the incident, . .. . We will now discuss these 6 steps in detail in the upcoming slides.
https://www.sans.org/reading-room/ whitepapers/ incident/incident-handlers-handbook-3390 I

138

© 2017 Erik Van Buggenhout & Stephen Sims

Incidence Response & the OODA Loop

OODA LOOP

We could consider incident response as a continuous ''battle" between the CIRT and the adversary team. It's important to note that your adversary is also human... We can thus benefit from the OODA loop!

r-

, Observe

Act

,'Orient

O bserve: Understand what is happening technically on your network. Orient: Understand what this attack means: What is the context of this attack/ What are the objectives of the adversary? Are your crown jewels at risk/ Decide: Ba.sed upon the information collected during the "Observe" &"Orient" steps. decide on the next step. A key pitfall here can be the required authority to decide on next steps. Act: Effectively implement the action that was decided upon in the previous step.

' Decide

I During a typical incident response engagement. your CIRT team & the adversary run through countless OODA loops. If yo u OODA loops are faster than t he adve rsary, you win ©

SANS

Incide nce Response & the OODA Loop We could consider incident response as a continuous "battle" behveen the CIRT and the adversary team. It's important to note that your adversary is also human... We can thus benefit from the OODA loop! OODA stands for Observe, Orient, Act & Decide. OODA loops were initially introduced by US Air Force military strategist John Boyd. The concept has since been applied to a wide variety of subjects, including computer security & incident response. The general ideas behind the steps are the following:
· Observe: Understand what is happening technically on your network. The more your JR team has visibility on what is going on, the more they can understand the attack.
· Orient: Understand what this attack means: What is the context ofthis attack? What are the objectives of the adversary? Are your crown jewels at risk? Decide: Based upon the information collected during the "Observe" & "Orient" steps, decide on the next step. This can often be difficult as the required "authority level" is to be established.
· Act: Effectively implement the action that was decided upon in the previous step.
During a typical incident response engagement, your ClRT team & the adversary run through countless OODA loops. Ifyou OODA loops are faster than the adversary, you win!

© 2017 Erik Van Buggenhout & Stephen Sims

139

·Incidence Response Process - Preparation (I) Preparation

SANS

I

Preparing to respond to an incident takes, of course, place before the incident happens.

I

This is arguably the most important step in the incident response process, as it will shape how a Computer Incident Response Team reacts to incidents

Incidence Response Process - Preparation (J) The first step is the preparation step.
Ofcourse, the CIRT team and Cl RT members prepare to respond to incidents before incidents take place.
If the CIRT team is not (yet) prepared to handle incidents when an incident occurs, then the incident will have to be handled without a plan, or a plan will have to be formulated while the incident response takes place. This is not a good situation, mistakes will be made, for example, steps of the incident response process will be forgotten or skipped.
This is arguably the most important step in the incident response process, as it will shape how a Computer Incident Response Team reacts to incidents.
Each team member of the CIRT team must be well aware ofthe plan to follow when they are tasked to handle an incident and apply it accordingly.
A well-prepared plan is essential for a successful outcome of the incident response process.

140

© 2017 Erik Van Buggenhout & Stephen Sims

Incidence Response Process - Preparation (2)

· a ·
SAN~

A response plan/strategy t prioritize incidents based upon impact on the organization. A common thing to do is develop "playbooks"' for the most common threats against the organization.
A communication plan to define with whom and how to communicate during an incident, including organizations outside the corporate environment such as the general public, law enforcement, customers ...
Documentation is key during an incident, as it can be used as evidence in case of legal procedures. Make sure you have a readily available communication infrastructure (consider security as well)

Avoid surprises! Ensure y r team includes experienced profiles that have dealt with various aspects of security and forensics before. They should a lso be trained appropriately
Have the necessary access to systems (or know how to obtain them) to collect data and evidence
Have the necessary tools at their disposable to be able to respond to an incident, for example like forensic disc imaging software

Incidence Response Process - Preparation (2) There are several elements that require planning before an incident takes place.
This includes:
· A response plan/strategy to prioritize incidents based upon impact on the organization. Depending on the size of your organization, it will not be exceptional that more than one incident occurs at the same time, or that the response to incidents overlaps. As the CIRT team will certainly have limited resources, a plan or strategy must be prepared to deal with multiple incidents: how will we prioritize the handling of multiple incidents in our organization? A reasonable course of action is to prioritize incidents based on the impact they have on our organization: incidents with a high impact should be responded to first. Remark that it will not always be clear what the impact of an incident is at the outset, and that reprioritization of incidents might be required as the impact becomes clearer.
A communication plan to define with whom and how to communicate during an incident, including organizations outside the corporate environment like law enforcement. Handling incidents require teamwork and that requires communication. A communication plan does not necessarily have to be complex, it can, for example;;, be a list of people with phone numbers or other communication channels. If an incident handler requires the help of the network team, for example, it should be clear how to contact the network team and how to be assured of their involvement. This might be obvious during working hours in your organization, but when incidents need to be handled outside normal working hours, a good communication plan will prevent wasting time finding key people off hours.
Documentation plan: documentation is key during an incident, as it can be used as evidence in case oflegal procedures. Documentation is key in incident handling, not only for the last step (Lessons Learned), but also for the process itself, and certainly when the reaction to an incident will include legal action.
A CIRT team must be formed with members that:

© 2017 Erik Van Buggenhout & Stephen Sims

141

· Are experienced in various aspects of security and forensics. All kinds of incidents will happen in a large organization; therefore, it is important to compose a ClRT team with a diverse group ofteam members. A single team member cannot have all the required skills and expertise to handle all possible incidents properly, diversification is necessary. For example, one team member might be experienced in networking technology while another team member is more experience in software security.
· Have the necessary access to systems (or know how to obtain them) to collect data and evidence. CIRT team members will have to access systems to collect data and evidence pertaining to the incident that is being responded to. Depending on your organization, CIRT team members might have all necessary accesses in their user profile, or else they will need to obtain the necessary rights when required. To prevent losing time to obtain necessary rights, a plan should be established.
· Have the necessary tools at their disposable to be able to respond to an incident, for example like forensic disc imaging software. Incident response can be a very technical discipline, requiring very specialized tools and software that is not used by other teams.
· Have been trained appropriately. This is a repetitive process; team members must attend training regularly to keep their skills up-to-date.

142

© 2017 Erik Van Buggenhout & Stephen Sims

Incidence Response Process - Incident Response Playbool<s

An excellent source for Incident Response playbooks are the Incident Response Methodologies (IRM) developed by CERT Societe Generale. · Available in cheat-sheet format at htt_ps://github.com/certsocietegenerale/IRM
· These playbooks also follow the SANS incident response process · Currently available in English, Spanish & Russian

Some ofthe available IRMs include:
Worm Infections Phishing Ransomware DDoS Windows intrusions

ICERT ISOCIETE GENERALE
IRM (Incident Response Methodologies)
The IRM's are an excellent basis that can be further finetuned to the specific needs of your organization!

SANS

Incidence Response Process- Incident Response Playbooks In the modern age, many organizations are facing similar threats: it's no surprise that a variety ofcompanies could fall victim to ransomware or DDoS attacks. This means that, as an organization, we shouldn' t attempt to reinvent the wheel, as other organizations may have thought ofthe same problems before (& found a solution).
An excellent source of Incident Response playbooks are the " Incident Response Methodologies" developed by CERT Societe Generale, which are available on https://github.com/certsocietegenerale/ IRM. The playbooks were designed with the SANS 6-step Incident Response process in mind, so they fit perfectly with the overall Incident Response process. They are currently available in a "cheat sheet format" in English, Spanish & Russian.
Over 15 playbooks are currently available, covering some of the most common incident types including: phishing, ransomware, DDoS, ...
As an organization, it is recommended to take these playbooks as a basis & further tailor them to your organization!

© 2017 Erik Van Buggenhout & Stephen Sims

143

Incidence Response Process- Example IRM Layout for Ransomware

~,.....,...... · · AQOOc1 ~ ol H _. ~..,.......
a A good ~ ol ,_ UWIII ~ · ;rcAt
· r,.,.,..,_,..tte~lltld~{.,.,
-·-~,P,O...QIC...}~c,,c,duoll.--w,11
-· ~"" ...... - . ...... o , ~
- -,..... '(O,lrf""""°" ...- - - . ~ ...

....· "'-.ewr.io~ ·~

~MG

,...tlM~o4~.0~~

·
- ............. · Odll ~ ~ (-.,. ........... · ftllOICft) ~ ~ . . ~
. ,,.,...,.~--~~ -- ...,..1o~ r,.,,..,. ---Ot'IUll4'ft~

-- - · · l.-.b .... ~~~~
~~U"'or'J5Nl'PO,\TA"I)~
· t.OQti:bh~~·'WIIOIII
--· c.oii.tt-·ltW«IIY~dllo~(I
-·· L.c,o,i;bwnuNIII~
· l.ool:bUl'llawt. . . .~~ · t..cd.lbr~~"-·Mbtll~~
.,.._.,~IIOToto,12P11Pta,....,. ~.tit)·~~ .......
~---~
· Looi·~~-~""
· ~ b ~ ~to,.,..,,.,...e c.,.c:
a llldtb~~Qf._..,~~
~ ~ 10 for Of~ P To, ~:,S ~-)Qfl!Wlarain..,.,...........
· LUOlb1ol!Ml,IIII_._...,..,_.~

The screenshot on the right provides an interesting insight in the layout of the Incident Response Methodology for ransomware!

Incidence Response Process - Example IRM Layout for Ransomware The screenshot above is the example layout of an [RM for ransomware. You will notice the first 2 steps ofthe Incident Response as defined by SANS!

144

© 2017 Erik Van Buggenhout & Stephen Sims

·Incidence Response Process - Identification Identification

P-11111 Prior to the incident response process kicking off, the security monitoring (or liiiJ threat hunting) capability has identified an incident and alerted the CIRT
-11111 As a first step, the CIRT will validate the incident, collect information and attempt to perform an initial scoping of the incident

r

I l l It is highly likely that the scoping of the incident will evolve as additional analysis is performed (this is to be expected)

SANS

Incidence Response Process - Identification The second step in the incident response process is " Identification".
Prior to the incident response process kicking off, the security monitoring (or threat hunting) capability has identified an incident and alerted the CI RT. For example, take a file server that is experiencing performance issues: it is abnormally slow. It is not unheard ofthat system administrators attribute performance issues to undetected malware on a system when they do not have a readily available explanation for the performance issues. In such a case, further investigation is required to determine ifthe performance issue is indeed due to undetected maIware running on the server and consuming a significant amount ofCPU resources.
Usually, the identification process starts with an anomaly: operations in the organization deviate from normal routine and a CI RT team member is informed ofthis deviation. It must be assessed ifthis deviation is large enough to identify it as an incident. As the example with a slow file server shows, the deviation might not be due to maIware, but because of a larger than usual load on the server. If this is, for example, due to a user that is transferring a large amount of files, then it will not be considered as an incident that has to be handled by the CIRT team.
This does not necessarily mean that no action must be unu1::rlak1::11, but it does not fall under the incident response process: the incident response stops with this step. Although if this happens regularly, then step 6 (Lessons Learned) might be taken to reduce the amount offalse a lerts.
Determining the scope of an incident is also part ofthis phase.

© 2017 Erik Van Buggenhout & Stephen Sims

145

·Incidence Response Process - Containment Containment

·I

During containment, the CIRT will attempt to further analyze the incident, while preventing bad things from happening. This does not necessarily mean that affected systems are "disconnected" from the network: systems could be left online, while the adversary's actions are further observed!

B l While containing the incident, the CIRT should ensure that: · The adversary does not inflict additional damage; · The adversary does not realize he's been spotted; · The CIRT should attempt to obtain a clear overview of all compromised systems.

SANS

The containment phase is a crucial aspect of successful Incident Response!

Incidence Response Process - Containment The third step in the incident response process is "Containment". Containment is oHen misunderstood for being synonymous with immediately disconnecting and infected systems. This doesn't necessarily have to be the case however:
During containment, the CIRT will attempt to further analyze the incident, while preventing bad things from happening. This could mean that a system is left online, but will now be subject to increased monitoring, in order to obtain more information on the incident:
· What are the objectives ofthe adversary? · How did they initially enter the environment? · What systems have already been compromised? · When are the adversaries active?
While observing the adversaries, it is vital to ensure that:
· The adversaries are not able to inflict additional damage to the affected organization; · The adversaries don't realize they have been spotted (as they will roll back any activity, destroy traces or
even perform destructive activities)
We can compare this to the analogy ofa terrorist cell discovered by the FBl. Upon discovery, it is likely that the FBI will increase monitoring to obtain more information on what they are trying to do, as this could be a treasure of threat intelligence. At the same time, they should ensure they can intervene when they would move to do something actually bad.

146

© 2017 Erik Van Buggenhout & Stephen Sims

·Incidence Response Process - Eradication Eradication
IEradic::ition is the step where the adversary is effectively removed from the environment
IEradication is the step where many incident response operations go bad: some infected systems are forgotten, thus the intrusion starts all over again...
IProper eradication involves a large, coordinated effort where all infected systems are "cleaned" AT THE SAME TIME
Incidence Response Process - Eradication The fourth step in the incident response process is "Eradication". Eradication is the step where the adversary is effectively removed from the environment. This is a highly critical phase of the incident response process, as at this point, the adversary will definitely become aware of the fact that he's been spotted. Eradication is the step where many incident response operations go bad: some infected systems are forgotten; thus, the intrusion starts all over again. Proper eradication ofan advanced adversary will require a large, coordinated effort. The CIRT should coordinate with business and IT when actions are taken. In order not to "show your hand" to the adversary, it's important that all systems are cleaned at the same time!

© 2017 Erik Van Buggenhout & Stephen Sims

147

·Incidence Response Process - Recovery Recovery
IIn the recovery step, systems are reintroduced in the production environment, as to continue normal operations
ICare should be taken to move only to this step when the incident has been fully eradicated
IUpon recovery, "cleaned" systems are typically subject to increased monitoring to ensure they are not "re-infected"
SAN~
Incidence Response Process - Recovery The fifth step in the incident response process is "Recovery".
In the recovery step, systems are reintroduced in the production environment, as to continue normal operations.
Care should be taken to move only to this step when the incident has been fully eradicated, and when it is certain that the incident will not happen again if the systems are reintroduced in production. Upon recovery, most organizations will perform increased monitoring on "cleaned" systems, as they want to ensure the systems are not "re-infected". This monitoring can be highly tailored, as proper analysis ofthe incident should have resulted in numerous IOCs & TIPs employed by this particular adversary.

148

© 2017 Erik Van Buggenhout & Stephen Sims

·Incidence Response Process - Lessons Learned Lessons Learned --1 ~essons learned is one of the most important steps of incident response. This - 1 . . . 1s true for the CIRT team, but for the rest of the organization as well! :h~ goal of this st~p for the organization is to prevent reoccurrence of similar ~ incidents AND to improve defenses based upon this actual incident.
El IThroughout the entire IR process, the CIRT team should have generated Threat Intelligence (IOCs & TTPs) it can now use to perform additional hunting in the environment! This is what we call the "continuous loop" !
SANS
Incidence Response Process - Lessons Learned The sixth and last step in the incident response process is "Lessons Learned".
Lessons learned is one ofthe most important steps of incident response. This is true for the CI RT team, but for the rest ofthe organization as welI!
The goal of this step for the organization is to prevent reoccurrence of similar incidents. Incidents must be analyzed to determine the root cause of the incident, and action must be taken accordingly. This analysis is not necessarily to be done solely by the CIRT team, it can be supported by other teams as well.
The goal of this step for the organization is to prevent reoccurrence of similar incidents AND to improve defenses based upon this actual incident.
If the CIRT feels they haven't collected enough information during the previous phases of the incident response activities, it could be worth doing additional analysis. Throughout the entire lR process, the ClRT team should have generated Threat Intelligence (IOCs & TTPs) it can now use to perform additional hunting in the environment! This is what we call the "continuous loop"!

© 2017 Erik Van Buggenhout & Stephen Sims

149

When to Use the Incident Response Process?

·6.Lessons
Learned
·
5. Recovery

I· Preparation

2. Identification

CONTINUOUS PROCESS

·

, ,3. Containment

4. Eradication

IIncident response should be a cyclical process (continuous improvement)
IIR should feed into other processes (e.g. threat hunting & security monitoring)
IDepending on the type of incident, some phases of the process may warrant extra attention / focus

When to Use the Incident Response Process? The six steps of incident response as defined by SANS can actually be applied to computer incidents in general: security related and non-security related. Incidents handled according to SANS incident response process, are security incidents. But security incidents are not the only incidents that occur inside an organization.
As a first remark, it's important to note that incident response should be a cyclical process, including continuous improvement. Once an incident is handled, a big focus should be placed on the "Lessons Learned" phase, where the organization focuses on understanding how similar incidents can be better prevented, detected, AND responded to in the future.
This very idea means that Jncident Response will feed into other processes, such as threat hunting & security monitoring. When the malware that is analyzed during an incident is fully reversed, this will probably lead to IOCs & TTPs that can now be used as additional input in the threat hunting process. Another easier example could be the identification of a "low risk" vulnerability as the root cause ofa serious incident, which could provide input to the overall security strategy ofthe organization, thereby challenging current risk ratings.
Finally, not every incident is the same, which means different im:i<lents could require a tailored approach, where different elements of the incident response process will receive additional attention.

150

© 2017 Erik Van Buggenhout & Stephen Sims

Incident Response - Tools,Tools,Tools, ...

Today, many tools exist in the industry that can support CIRT team me mbers in every stage of the incident response process. This includes both open-source and commercial tools. Some interesting examples of excellent free tools includ e:

.

DFIR

..i1 1 -IKIIJl 11l1G1$1

The free SANS SIFf workstation, used by the vast majority of IR teams

g
Rekall FoniMJc.o
The "R ekall" forensics framework

ASSEMBLY ~ E · The

The "Aut opsy®" & Sleuth Kit@" toolkits
~c ort ex

"GRR" for remote acquisition & analysis
g

"Assemblyline" is a free "TheHive" is an IR "Cortex" is an extension The "Kansa" powershell

malware detection & collaboration framework to TheHive for observable

IR framework

analysis framework

analysis

SANS

Incident Response - Tools, Tools, Tools ... Today, many tools exist in the industry that can support CLRT team members at every stage of the incident response process. This includes both open-source and commercial tools. Some interesting examples ofexcellent free tools
include:
· The SIFT Workstation is a group of free open-source incident response and forensic tools designed to perfonn detailed digital forensic examinations in a variety ofsettings. It can match any current incident response and forensic tool suite. SIFT demonstrates that advanced incident response capabilities and deep dive digital forensic techniques to intrusions can be accomplished using cutting-edge open-source tools that are freely available and frequently updated. SIFT is available al https://digital-forensics.sans.org/community/downloads
· Rekall is an advanced forensic and incident response framework. While it began life purely as a memory forensic framework, it has now evolved into a complete platform. Rekall implements the most advanced analysis techniques in the field, while still being developed in the open, with a free and open source license. Many of the innovations implemented within Rekall have been published in peer reviewed papers. Rekall is
available at http://www.rekall-forensic.com/ · The Sleuth Kit® is a collection of command line tools and a C library that allows you to analyze disk images and
recover files from them. It is used behind the scenes in Autopsy and many other open source and commercial forensics tools. The Sleuth Kit is availabl1: at https://www.sleuthkit.org/ · ORR is a tool for live forensic response, as in that, it is used while the user is still active on the machine. ORR uses a Python agent on the machine, that talks over the Internet to a ORR Python server. There is no need for a VPN. Built into the tool is a disk forensics capability Sleuthkit and a memory forensics capability in the form of Rekall. You can get GRR at https://github.com/google/grr. · Assemblyline is a platfonn for the analysis of malicious tiles. It is designed to assist lR teams to automate the analysis of tiles and to better use the time of security analysts. The tool recognizes when a large volume offiles is received within the system, and can automatically rebalance its workload. Users can add their own analytics, such as antivirus products or custom-built software, in to Assemblyline. The tool is designed to be customized by the user and provides a robust interface for security analysts. You can get Assemblyline here: https://www.cse-cst.gc.ca/en/assemblyline

© 2017 Erik Van Buggenhout & Stephen Sims

151

· TheHive is a scalable 3-in-1 open source and free Security Incident Response Platform designed to make life easier for SOCs, CSIRTs, CERTs and any information security practitioner dealing with security incidents that need to be investigated and acted upon swiftly. Collaboration is at the heart ofTheH ive. Multiple analysts can work on the same case simultaneously. For example, an analyst may deal with malware analysis while another may work on tracking C2 beaconing activity on proxy logs as soon as IOCs have been added by their coworker. Using TheHive's live stream, everyone can keep an eye on what's happening on the platform, in real time. TheHive is available at https://github.com/CERT-BDF/fheHive
· Cortex, an open source and free software, has been created by TheHive Project to facilitate the analysis of different observables. Observables, such as IP and email addresses, URLs, domain names, files or hashes, can be analyzed one by one or in bulk mode using a Web interface. Analysts can also automate these operations thanks to the Cortex REST AP!. As they are developed by the same team, Cortex supports excellent integration with TheHive! You can download Cortex here: https://github.com/CERT-BDF/Cortex
· Finally, Kansa is a modular incident response framework in Powershell. It's been tested in PSv2 / .NET 2 and later and works "mostly without issue". You can download Kansa at https://github.com/davehull/Kansa.

152

© 2017 Erik Van Buggenhout & Stephen Sims

SANS SIFT Workstation

~flh O·uHff
0 IF

·.,.,f:::- 1Pa
ii ~ rJm

~ ~ "'"",,_.,., .......or,ro,....,_1.

Ba

!'!IP

- D ~
Ii

~

4

a ~ G]

SANS

~ ·1 "'
.~·:-r:. J...'... /

1 , . .· .,

C,

IFree, continuously updated, Ubuntu-based VMware appliance

IExcellent base workstation for IR teams & analysts

IIncludes tools for virtually all phases of the IR process

DFIR.,,

., ;

IUsed in virtually all lR teams and many of the SANS DFIR courses!

SANS SIFT Workstation The SIFT Workstation is a group of free open-source incident response and forensic tools designed to perfonn detailed digital forensic examinations in a variety ofsettings. It can match any current incident response and forensic tool suite. SIFT demonstrates that advanced incident response capabilities and deep dive digital forensic techniques to intrusions can be accomplished using cutting-edge open-source tools that are freely available and frequently updated.
Rob Lee and his team created and continually update the SIFT Workstation. It's successfully used for incident response and digital forensics and is available to the community as a public service. With over I00,000 downloads to date, the SIFT continues to be the most popular open-source incident-response and digital forensic offering next to commercial source solutions.
Offered as an open source and free project, the SIFT Workstation is taught only in the following incident response courses at SANS:
· Advanced Incident Response course (FOR508) · Advanced Network Forensics course (FOR572) · Cyber Threat Intelligence (FOR578) · Memory Analysis In-depth (FOR526)

© 2017 Erik Van Buggenhout & Stephen Sims

153

Rekall Forensics

11111

Rekall ~"- E "."'.. l..,· ··, ......

,.., ~.·,

J·, ..~

J..

' .,. ·

11111

I L\·IIP:.ll\lfr 11. .
SANS

L

.. , , , . ···, .... ,,, .,..

, · I,,·

1·,!'~"°

IInitially started as a pure memory forensics tool

IIs currently working on a Rekall agent (EDR-like functionality)

IWith the agent, supports integration with OSQuery
IAims to "fix" some of the issues in GRR

Rekall Forensics Rekall is an advanced forensic and incident response framework. While it began life purely as a memory forensic framework, it has now evolved into a complete platfonn. Rekall implements the most advanced analysis techniques in the field, while still being developed in the open, with a free and open source license. Many ofthe innovations implemented within Rekall have been published in peer reviewed papers.
Current development efforts are focused amongst others on the Rekall agent, which aims to provide EDR-like functionality. The current version of the agent also supports for example OSQuery queries, making it a highly interesting tool! Rekall Agent is a complete endpoint incident response and forensic tool. The Rekall Agent extends Rekall's advanced capabilities to a scalable, distributed environment. The Rekall Agent is easy to deploy and scale, based on modem cloud technologies. With enterprise grade access control and auditing features built in, the Rekall Agent is suitable to be deployed in small to large scale enterprises to provide unprecedented visibility ofendpoint security, and collection and preservation of volatile endpoint evidence. Rekall Agent can be downloaded from GitHub.

154

© 2017 Erik Van Buggenhout & Stephen Sims

Autopsy & the Sleuth Kit (By BasisTechnology)
Autopsy was designed to be an end-to-end GUI-based forensic analysis platform. It has different modules that are included out-of-the-box, while others are avajlable from third parties. Some ofthe modules that are included out ofthe box include:
· Timeline Analysis, including an advanced graphical event viewing interface · Hash Filtering, which can be used to flag known bad files & ignore known goods · Keyword Search, allowing to find files related to relevant terms · Web Artifacts, allow extraction of history, bookmarks, and cookies from popular
browsers · Data Carving, allowing recovery of deleted files · Multimedia, allowing extraction of EXIF data from pictures and videos · Indicators of Compromise, allowing the scanning of a computer using STIX
The Sleuth Kit is a collection of command line tools and a C library that allows you to analyze disk images and recover files from them. It is used behind the scenes in Autopsy and many other open source and commercial forensics tools.
SANS
Autopsy & the Sleuth Kit (By Basis Technology) Autopsy & The Sleuth Kit were both developed by Basis Tech nology. Autopsy was designed to be an end-toend GUI-based forensic analysis platfom1. It has different modules that are included out-of-the-box, while others are available from third parties. Some of the modules that are included out ofthe box include:
Timeline Analysis, including an advanced graphical event viewing interface · Hash Filtering, which can be used to flag known bad files & ignore known goods · Keyword Search, allowing to find files related to relevant terms
Web Artifacts, allow extraction of history, bookmarks, and cookies from popular browsers · Data Carving, allowing recovery of deleted files · Multimedia, allowing extraction of EXIF data from pictures and videos
Indicators of Compromise, allowing the scanning ofa computer using STlX
The Sleuth Kit is a collection ofcommand line tools and a C library that allows you to analyze disk images and recover files from them. lt is used behind the scenes in Autopsy and many other open source and commercial forensics tools.

© 2017 Erik Van Buggenhout & Stephen Sims

155

G RR - G RR Rapid Response
I GRR is a tool for live forensic response, as in that it is used while the user is still active on the machine.
IGRR works with an agent th~t is installed on the clien~. ~~ntral" management is performed using a web portal, from which hunts & analysis can be performed.
I ~~d Focus is on forensi~s on machines t~at have po.~r bandwidth are in remote locations, due to the increase of homeworkers & "road warriors"
ICross-platform support (Windows, Linux, OS X), relies on additional tools such as Rekall (for memory forensics) & Sleuth Kit (disk forensics)

GRR - GRR Rapid Response GRR is a forensic tool. The name itself is a recursive acronym. The first G stands for GRR and not for Google as many people think. RR stands for Rapid Response.
GRR is a tool for live forensic response, as in that, it is used while the user is still active on the machine. GRR uses a Python agent on the machine, that talks over the Internet to a GRR Python server. There is no need for a VPN. Built into the tool is a disk forensics capability Sleuthkit and a memory forensics capability in the forn1 of Rekall. Both of the tools are open-source.
It is a free, open-source tool for live forensics. rt is cross-platfonn, it can support the following operating systems:
· Windows · Linux · OS X
GRR is a powerful forensic tool that has many interesting features for incident handlers. As a live forensic tool over the network, ORR can be used to perform a forensic investigation on a machine that is live and remote. The Python agent must be installed on the machine to be investigated, and then live remote forensics can be done.
GRR is able to do forensics on machines that have poor bandwidth and are in a remote location. More and more "homeworkers" & "road warriors" are becoming a concern for organizations, which is something GRR is hoping to address.
ORR can investigate a large number of machines for known IOCs. Like we showed with Loki, GRR can be provided with a list oflOCs (like cryptographic hashes of malicious files) that are then searched for through all machines under control ofGRR. The list of IOCs is downloaded by the agent, who then performs the search for IOCs.

156

© 2017 Erik Van Buggenhout & Stephen Sims

GRR can do remote forensic acquisition of machines, for example, provide an inventory of all files on the file system of the machine under forensic investigation.
GRR is capable of performing queries on multiple machines to find a program by filename. If, for example, you know that advanced attackers produced a file for data exfiltration (e.g. attacktool.exe), then GRR can search through all your machines looking for files with this name.

© 2017 Erik Van Buggenhout & Stephen Sims

157

GRR- Screenshot of the Interface

. _ _. .... C

...

- ·----·-- ,,._. ... If 1)9(........~ Iii-

--·--, - . .......-0.U - ..,..._

=-- . ..,. ..,.. ,,_. - J

- - - ....

...s,.,...,...... ~

I.._--:_ . -- ........_~ -:::..,.~_1,,w,:, tit ....,

.....
.,........... C
.,.._ I .._ I
.".'_~..,.
........,....

_.......
· IO'l -1-... ll'ti.JI.
a::r-t1-'-'UD.»
,tJ(IQ-.JIDtf!:) .:«1H,·Mt011,t Jll'),tJ···u~ ~,,OZ'JJt'JI
llf'I,>,, ...,,,..:,
~ · tt~l!P""tli
.l'))IMl,6.11 . .u , e N»IIH&l'. . JO

~--·---
:.:(11,.lll)q_J;Q
... ... Alliol'-1)~->
___... ,
-....oa.uo11»
~ . . . . .,JI!)
~,411-tt.)'J
Jtf>«-ao:·1,
.....,.,. ...,, 1:Dt~· ·l'lt··h
,-.uu,l»»
.-011\4l,l.)II)

...

r

, . , ". . . . . ~

alt,).11 . . ., .. .
»"!).11·,~-··

)'Jl)1' ·>~ l)~t » » JQ1J,J1U.. .

#tJH·~O.IJ'IJ

JO'l>"'-"Oll»",_, IOIJ.1· l~OIID~ ,0,,).nt:r,~:'lt)l

,0l,l.ll-11~W°SJ
.r.,,,-u..n·11'-' »1111·:,,(lll»U ·s.n,,QJ·.t,:s,

GRR's main web interface can be used to manage installed clients and run "hunts" I "workflows" to collect specific information from clients

SANS
GRR- Screenshot of the Interface In the above screenshot, we can see GRR being used to investigate the filesystem ofa remote machine where the GRR agent has been deployed. All the way to the left ofthis screenshot, we can see a menu that starts with the name of the machine together with its IP address. After we retrieved the flow, we selected "Browse Virtual Filesystem". This gives us access to the forensic data retrieved from the machine, under the form of:
Memory File system Registry
We selected drive C: in the treeview (fs / os / C:). This gives us an overview ofthe files and directories present in the root ofdrive C:.
We selected file BOOTSECT.BAK with size 8192 bytes dating from 2013.
From the hex / ASCll dump at the bottom ofthe screenshot, we can see the content ofthe boot sector backup file.

158

© 2017 Erik Van Buggenhout & Stephen Sims

Assemblyline

/ l CSl-CST-
E3 o.,...., CJ P,_... X s.-,
' M.wn~

TA,.-f,rl'!,bt,,,

"

Repositories

. - ' 9 0

ltopo1lt0f)'
0 ~,,,-,_,,_

--~- /' ,u.-,,t,.,..,.
00 .,,),f'fTlb~w<!i,t,,."''. 0 ~V(-(ro,'IC,tt 0 1l1w.J\lf'!Ut·
O ·J\'(_ftl.-1),.
· .i.«_ _

0 HY(fr~irqi

SANS

PYofe<t
.... _
Al\t":'~
~
.._,.....
..,..,.,...,..,.
,.\ffffl\b>)....,.
As,.-iyt,,o
-~ -

Q ' °' ..
Lutwpdllttd
.....
....... ~
· 4~,<.o;,:,
"IIO 4

IAssemblyline was released by Canada's CSE (Communications Security Establishment)
It's a malicious file analysis tool, focused strongly on modularity & ability to analyze large volumes of files
ISome interesting modules it includes are Cuckoo, Suricata,YARA, ...

Assemblylioe Assembyline is a malicious file analysis tool that was released in October 2017 on BitBucket by Canada's CSE (Communications Security Establishment). Its purpose is to have one tool that can be used to analyze large volumes ofpotentially malicious files, thereby limiting the workload on the analyst. Assemblyline consists of one central engine that uses different modules to perfo nn analysis, in order to reach an overalI "scoring" of files.
An interesting example of how Assemblyline can be used is quoted on its official web s ite:
''A financial officer receives an emailfrom an outside sender that includes a password-protected .zipfile that contains a spreadsheet and a Word document with textfor an annual report. An hour later the financial officer forwards that email to three colleagues within the department and attaches a .}peg image ofa potential cover for the report.
Assemblyline will start by examining the initial email. fl automatically recognizes the various file formats (email, .zipfile, spreadsheet, Word document) and triggers the analysis ofeachfile. In this example. the Word document contains embedded ma/ware, although the financial officer is unaware ofthis. The wholeJlle is given a score when the analysis ofeachflle i:s complete. Scores over a certain threshold trigger alerts, at which point a security analyst may manually examine thefile. The ma/ware within the Word document is neutralized due to further security measures that the organization has already implemented.
When the email isfo,warded, Assemblyline automatically recognizes the duplication offiles andfocuses on new content that may be part ofthe email, such as the .}peg image."

© 2017 Erik Van Buggenhout & Stephen Sims

159

TheHive

TbeHive (by CERT-BDF) is an open source incident response framework which focusses on three core pillars:
· Collaborate - multiple SOC and CERT analysts can simultaneously work on an investigation and collaborate through the platform;

The ve

· Ela borate - TheHive allows you to create flows and templates to speed up and automate tedious tasks.

· Analyze - TbeHive tightly integrates with MISP which allows for bi-directional communication. The
platform allows for quick triage and filtering of IOC's.

C<Jrrent Cases (4)

TbeHive also has a direct integration with Cuckoo Sandbox

,.,.

- --

-.,,

u:::i===::11u:::::ii .. ,_

SANS

TheHive It is often so, that during investigations multiple teams are collaborating, each of which have their own insights and log sources. In order to share this information and knowledge, it is good to have a platform that allows you to create different cases in which IOC's and case notes can be shared.
Thel-live is an open source and free software released under the AGPL (Affero General Public License) by CERT-BDF). The incident response framework focuses on three core pillars: · Collaborate - multiple SOC and CERT analysts can simultaneously work on an investigation and
collaborate through the platform; · Elaborate - TheHive allows you to create flows and templates to speed up and automate tedious tasks. · Analyze - TheHive tightly integrates with MISP which allows for bi-directional communication. The
platform allows for quick triage and filtering of IOC's.
TheHive also has a direct integration with Cuckoo Sandbox.
More information on TheHive can be found at https://thehive-project.org/ An introduction to TheHive can be found at https://blog.thehive-project.org/2016/ 11 /07/ introducing-thehive/

160

© 2017 Erik Van Buggenhout & Stephen Sims

Cortex

Analyzers

,.,,._
r--.
,.....,

0lt.)l'1Pff
."".
,...

..,. Ytnhl

~riiMC twrt

m
D
·

JoeSAndbot_Uc1_ANly10 _ ,
_. .. - --~...s. et~.....

W ll,t-lU1.VI

r--
,,__

-....,
.....

..l!I
a a

J~be)1(._r-1Jt_.t.Nly1,.1_(M't ,,.,,...,,.. ._......,&,n.40t . . _ . . . ,
. ...lool-)......,_,.~"""'~t(~
_,

r--
,..._
,-.

-ff"'!"-:.-.,Nlh
.".".' ....,..
, .....

D

JoeS,11\dbox_ file. .\rtat~1S_N01ot< _ _ ,

IA·-~

D
a a a

............ .,,..,,...,~-......\~

. . . . . . -~- l/ln.UN!u1 .,,,,,_

.......

,......_

SANS

ICortex (by CERT-BDF) is an extension to TheHive

·

·-

IIt's focus Is on "observable analysis" (IP, URL, e-mail address, files·...)

One central platform

·

where an o bservable can

be submitted, after which

it is analyzed by

"analyzers"
·

Cortex Cortex is an extension to TheHive (by CERT-BDF) that tries to solve a common problem frequently encountered by analysts during threat intelligence, digital forensics and incident response: how to analyze observables they have collected, at scale, by querying a single tool instead ofseveral? ln some ways, Cortex can be compared to tools like Assemblyline or even IRMA (Incident Response & Malware Analysis).
Something that makes Cortex highly powerful is its excellent integration with TheHive, allowing for easy submission of samples & reporting of analyzer outputs.

© 2017 Erik Van Buggenhout & Stephen Sims

161

Kansa-A PowerShell lR Framework
Kansa is a modular incident response framework in PowerShell created by Dave Hull. Next to Incident Response, it could also be used to obtain endpoint information during threat hunting!
It uses PowerShell remoting to run modules on hosts within the network to collect data that can be used during incident response engagements, hunts or baseline creation. Kansa is modular. It has a core script, a multitude of data collection modules and different analysis scripts to help you parse the data collected.
Data collection modules include a.o.: · Get-SchedTasks · Get-Autorunsc · Get-SvcAll · Get-LocalAdmins · Get-MasterFileTable · Get-lOCsByPath · Get-RdpConnectionLogs
SAN~
Kansa - A PowerShell JR Framework Kansa is a modular incident response framework in PowerShell created by Dave HuJI.
It uses PowerShell remoting to run modules on hosts within the network to collect data that can be used during incident response engagements, hunts or baseline creation.
Kansa is modular. 1t has a core script., a multitude of data collection modules and different analysis scripts to help you parse the data collected.
Data collection modules include amongst others: · Get-SchedTasks · Get-Autorunsc · Get-SvcAII · Get-LocalAdmins · Get-MasterFileTable · Get-lOCsByPath · Get-RdpConnectionLogs
Kansa can be found here: https://github.com/davehull/Kansa

162

© 2017 Erik Van Buggenhout & Stephen Sims

Incidence Response Process - Resources
Some additional resources concerning incident response: SANS SIFT Workstation htt;ps://digital-forensics.sans.org/community/downloads SANS' incident response process https://www.sans.org/reading-room/whitepapers/incident/incident-handlers-handbook-33901 Google's GRR htt;ps:/ /github.com/google/grr-doc/blob/master/user manual.adoc The Hive & Cortex https://thehive-project.org/ Autopsy & Sleuth Kit https://www.sleuthkit.org/ Assemblyline https://www.cse-cst.gc.ca/en/assemblyline Kansa IR httPs://github.com/davehull/Kansa
SANS
Incidence Response Process - Resources Some additional resources concerning incident response process:
SANS SIFT Workstation https://digital-forensics.sans.org/community/downloads
SANS' incident response process https://www.sans.org/reading-room/whitepapers/incident/incident-handlers-handbook-3390 I
Google's GRR https://github.com/google/grr-doc/blob/ master/ user_ manua1.adoc
The Hive & Cortex https://thehive-project.org/
Autopsy & Sleuth Kit https:/ /w w w .sleuthkit.org/
Assemblyline https:/ /www.cse-cst.gc.ca/en/assemb lyIi ne
Kansa IR https://github.com/davehul1/ Kansa

© 2017 Erik Van Buggenhout & Stephen Sims

163

Course Roadmap
Day 1: Knowing the adversary, knowing yourself Day 2: Averting Payload Delivery Day 3: Preventing Exploitation Day 4: Avoiding Installation, foiling Command & Control & thwarting lateral movement Day 5: Exfiltration, Cyber Deception & Incident Response Day 6: APT Defender Capstone
SAN~

SECS99.S

Data exfiltration

Typical data exfiltration strategies

Exercise: Detecting data exfiltration using Suricata

Cyber deception strategies

Tricking the adversary

Exercise: Making your honeypot irresistibly sweet

Leveraging threat intelligence

Defining threat intelligence

Exercise: Leveraging threat intelligence with MISP & Loki

Patrolling your network

Proactive threat hunting strategies

Exercise: Hunting your environment using OSQuery / ELK

Incident response

Incident response process

·

Exercise: Responding to an incident using GRR

This page intentionally left blank.

164

© 2017 Erik Van Buggenhout & Stephen Sims

Exercise - Incident Response Using GRR
IDuring this lab, we will introduce GRR as a remote forensics tools. We will install the GRR agent on one of our Windows workstations, after which we will use GRR to browse the remote filesystem, acquire a remote memory dump & launch a hunt looking for suspicious files!
High-level exercise steps: 1. Deploying GRR on one of our Windows-based endpoints 2. Browsing the remote filesystem from the GRR management console 3. Acquiring a remote memory dump from the GRR management console 4. Launching a hunt looking for suspicious files using GRR
SANS
Exercise - Incident Response Using GRR During this lab, we will introduce ORR as a remote forensics tool. We wil l install the ORR agent on one of our Windows workstations, after which we will use ORR to browse the remote filesystem, acquire a remote memory dump & launch a hunt looking for suspicious files!
The fo llowing are high-level exercise steps we'll need to complete:
I. Deploying ORR on one of our Windows-based endpoints 2. Browsing the remote fi lesystem from the GRR management console 3. Acquiring a remote memory dump from the ORR management console 4. Launching a hunt looking for suspicious files using O RR For additional guidance & details on the lab, please refer to the LOOS workbook.

© 2017 Erik Van Buggenhout & Stephen Sims

165

Exercise - Incident Response Using GRR- Conclusions
Throughout this lab, we introduced GRR as a solution for remote incident response & forensic analysis / acquisition
We installed a GRR agent on one of our workstations and used it to perlorm both a live hunt (e.g. for an identified IoC) and for a remote memory acquisition!
It should be noted that GRR is very much a work in progress and it is still actively being improved. While not necessarily offering the same ease-of-use as many commercial tools, it does provide a powerlul interlace to start doing remote forensics!
SANS
Exercise - Incident Response Using GRR - Conclusions Throughout this lab, we introduced GRR as a solution for remote incident response & forensic analysis / acquisition.
We installed a GRR agent on one ofour workstations and used it to perform both a live hunt (e.g. for an identified IOC) and for a remote memory acquisition! It should be noted that GRR is very much a work in progress and it is still actively being improved. While not necessarily offering the same ease-of-use as many commercial tools, it does provide a powerful interface to start doing remote forensics!

166

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
Day 1: Knowing the adversary, knowing yourself Day 2: Averting Payload Delivery Day 3: Preventing Exploitation Day 4: Avoiding Installation, foiling Command & Control & thwarting lateral movement Day 5: Exfiltration, Cyber Deception & Incident Response Day 6: APT Defender Capstone
SANS

SEC599. 5
Data exfiltration Typical data exfiltration strategies Exercise: Detecting data exfiltration using Suricata
Cyber deception strategies Tricking the adversary Exercise: Making your honeypot irresistibly sweet
Leveraging threat intelligence Defining threat intelligence Exercise: leveraging threat intelligence with MISP & Loki
Patrolling your network Proactive threat hunting strategies Exercise: Hunting your environment using OSQuery I ELK
Incident response Incident response process Exercise: Responding to an incident using GRR

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

167

Conclusions for 599.5
That concludes 599.5! Throughout this section, we've touched upon the following topics:
We reviewed common data exfiltration strategies · We discussed cyber deception strategies including a wide variety of HoneyTokens
(files, domain users, network shares, password hashes, ...) · We discussed threat intelligence and how it can be generated, shared and
consumed using MISP · We introduced the concept of threat hunting & how it can be performed using
OSQuery · Finally, we discussed the Incident Response process and how GRR can be
leveraged during a live investigation!
Tomorrow (SEC599.6), we will put everything together and you will be pitted against an APT that will attempt to infiltrate your environment!
SAN~
Conclusions for 599.S That concludes 599.5! Throughout this section, we've touched upon the following topics: · We reviewed common data exfiltration strategies · We discussed cyber deception strategies including a wide variety ofHoneyTokens (files, domain users,
network shares, password hashes, ...) · We introduced the concept of threat hunting & how it can be perfonned using OSQuery · We discussed threat intelligence and how it can be generated, shared and consumed using MISP · Finally, we discussed the incident Response process and how GRR can be leveraged during a live
investigation!
Tomorrow (SEC599.6), we will put everything together and you will be pitted against an APT that will attempt to infiltrate your environment!

168

© 2017 Erik Van Buggenhout & Stephen Sims

