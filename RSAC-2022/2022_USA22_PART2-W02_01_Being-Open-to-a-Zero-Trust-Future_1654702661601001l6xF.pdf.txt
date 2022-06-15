#RSAC
SESSION ID: PART2-W02
Being Open to a Zero Trust Future
Chris Meenan
VP, IBM Security Product Management

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other co-sponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented.
Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved. © Copyright IBM Corporation 2022. All rights reserved The information contained in these materials is provided for informational purposes only, and is provided AS IS without warranty of any kind, express or implied. Any statement of direction represents IBM's current intent, is subject to change or withdrawal, and represents only goals and objectives. IBM, the IBM logo, and other IBM products and services are trademarks of the International Business Machines Corporation, in the United States, other countries or both. Other company, product, or service names may be trademarks or service marks of others.
Statement of Good Security Practices: IT system security involves protecting systems and information through prevention, detection and response to improper access from within and outside your enterprise. Improper access can result in information being altered, destroyed, misappropriated or misused or can result in damage to or misuse of your systems, including for use in attacks on others. No IT system or product should be considered completely secure and no single products, service or security measure can be completely effective in preventing improper use or access. IBM systems, products and services are designed to be part of a lawful, comprehensive security approach, which will necessarily involve additional operational procedures, and may require other systems, products or services to be most effective. IBM does not warrant that any systems, products or services re immune from, or will make your enterprise immune from, the malicious or illegal conduct of any party.
2

#RSAC
Ma rke t ne e d s innova t ion a nd s im p le r, cons um a b le , a nd m ore e ffe ctive s e curity.
01
3

#RSAC
Organizations are undergoing rapid digital transformation

Shift to hybrid cloud
Infrastructure distributed across hybrid cloud, edge, IoT and OT
Re gula tory a nd priva cy demands
As data is shared, regulations and end-users demand more control

Re m ote workforce
Em ployees accessing data from anywhere, using any d e vic e
Evolving thre a ts
Increasing ransom ware and other sophisticated attacks

4

#RSAC
Security is fragmented
­ 6 6 % of security teams do NOT share their data ­ 4 5 % of security team s require security engineers to hand wire integrations ­ 1 :1 ratio of security analysts and integrators hired equally, no improvement since 2019
5

#RSAC
Complexity creates adversary opportunity
Poor vis ibility
Dis conne cte d tools
Outd a te d d e te ction

Struggle to ke e p up
of organizations say cybe rse curity has be come more difficult ove r the last two ye ars

EDR

NDR

SIEM/UBA

SOAR

An increase in rem ote worker access An increase in the threat landscape
An increase in the cloud applications

41%
38%
32%
6

"Open Security"
[noun] The sharing of security data analytics (feeds, intel, etc.), security methods or best practices, adhering to and or promoting standards and contributing or consuming code developed to secure or protect users, data, endpoints, workloads and more.

#RSAC
02
7

CLOSED Se curit y is a roa dblock
Proprie tary te chnology Ve ndor-spe cific rule s and conte nt Fragme nte d tools and inte rface s Slow and re source constraine d

#RSAC
OPEN Se curit y is a n a cce le ra t or
Ope n standards and inte rope rability Community-le d innovation, e xpe rtise Share d data and use r e xpe rie nce Acce le rate d stre am of innovation

8

#RSAC
Benefits from Open Security

Trust and transpare ncy
· Exchange with domain e xports · Contribute to re se arch and de ve lopme nt · Obtain fe e dback and comme nts

Speed and awareness

· Early acce ss to nove l te chnologie s

· Le arn about te ch and thre at tre nds

· Re duce blind spots and bre ache s

9

OCA was founded to promote and support open security
Wh o
Global like -minde d cybe rse curity ve ndors, e nd use rs, thought le ade rs and individuals
Wha t
Support an ope n cybe rse curity e cosyste m whe re products fre e ly e xchange information, insights, analytics, and orche strate d re sponse s
How
Ope n-source de ve lope d code and tooling with mutually agre e d upon te chnologie s, standards, and procedures

#RSAC
OCA is gove rne d a s a n OASIS Ope n Proje ct ­ Each sponsor gets an equal vote
in the orga niza tions ' s tra te gic dire ction ­ Anyone can contribute to the projects;
Sponsorship is not required to participate 1 0

Key OCA initiatives

STIX Shifte r
· Cybersecurity toolchain for unified query and response using the STIX 2 .x standards
· Goal: Standardize on one query language and response data m odel for all data sources
· 29 data sources supported (to date)
· Sponsored by IBM

Ke s tre l Thre a t Hunting La ngua ge
· Builds on STIX Shifter to create a unified threat hunting language and tool that works across all supported data sources
· Out-of-the-box m achine learning and analytics, integrations with J upyter Notebooks for GUI
· Sponsored by IBM

#RSAC
PACE ­ Pos ture Attribute Colle ction a nd Enum e ra tion
· Bring posture collection standards up to date with the cloud era
· Instantiation of the IETF SACM working group's architecture with SCAPv2
· Sponsored by CIS, NSA, and McAfee

WORKGROUPS
Indica tors of Be ha vior Sha ring
· Focused on the challenge of m oving detections to Indicators of Behavior (IoB)
· How to collaborate on and share IoB-based detections between products and tools
· Chaired by Cybereason, J HU-APL, IBM

OCA Ont ology
· Creating a unified ontology for cybersecurity inform ation to standardize encoding on data fabrics, APIs, etc.
· Original "Open DXL" ontology expanded to encom pass other m essaging fabrics
· Chaired by SAIC, NIST, McAfee

Ze ro Trus t Archite cture
· Creating and refining OCA technologies to enable Zero Trust architectures
· Creating a unified reference architecture for all aspects of enterprise cybersecurity o p e ra t io n s
· Chaired by IBM, NIST, VMWare, others
11

#RSAC
Detecting threats across

security analytics tools

· STIX-s hifte r:

Proble m

Fe de ra te d Da ta Acce s s

­ Security data is stored across a wide variety of silos

· Enable analysts to exchange information in a Structured Threat Information eXpression (STIX) across

­ No widely-adopted standard for running queries and enrichments multiple security domains

across tools and schemas

· STIX 2 Patterning for stateful detections use cases,

matching use cases and custom use cases.

S o lu t io n
­ We need to normalize for detects, hunts and response ­ Submit one pattern to query all security products at once ­ See the query results in one normalized format ­ Extensibility, portability / re-use (skills), collaboration

12

Evolve to proactive security with threat hunting
Proble m
­ Hunting approaches are primarily humandriven and require deep technical, systems, and organizational skills
­ Lack of systematic methodology and access to fragmented security data makes threat hunting difficult
S o lu t io n
­ Develop a systematic game plan that works across multiple products in a heterogeneous environment
­ Create a collaboration method for threat hunters to leverage the power of multiple minds coming together

#RSAC
· Ke s tre l ­ An ope n thre a t hunting a pproa ch
­ Kestrel enables threat hunters to compose hunts in an open expression and abstracts heterogenous environment interfaces
­ Built on Stix-Shifter ­ an open approach for federated search ­ Leverages ML to execute tedious tasks, allowing threat hunters
to focus on more pressing tasks
13

#RSAC
A simple threat hunting example

MS Office
fork
Ca rbon Bla ck
( ( parent_name:winword.exe OR parent_name:outlook.exe OR parent_name:excel.exe
) AND ( process_name:powershell.exe OR
process_name:cmd.exe OR process_name:wmic.exe OR process_name:cscript.exe ) )

Thre a t Hunte rs m us t:
Understand the threat TTP Determ ine relevant EDR Obtain access to Carbon Black Learn Carbon Black's APIs Learn how to script these APIs Convert return data to usable form at Python scripts to autom ate the hunt

...a nd the n do it a ll a ga in

Crowd Strike
event_simpleName=ProcessRollup2 (FileName=node.js OR FileName=nginx OR FileName=apache)
| dedup aid TargetProcessId_decimal | rename FileName as Parent | rename CommandLine as ParentCmd | table TargetProcessId_decimal Parent ParentCmd | join max=0 TargetProcessId_decimal
[ search event_simpleName=ProcessRollup2 FileName=bash OR FileName=zsh OR FileName=csh OR FileName=sh
| rename ParentProcessId_decimal as TargetProcessId_decimal
| rename MD5HashData as MD5 | rename FilePath as ChildPath | dedup TargetProcessId_decimal MD5 | fields TargetProcessId_decimal FileName CommandLine ] | table Parent ParentCmd FileName CommandLine

Be ne fits in us ing Ke s tre l...

GET process FROM myEDR WHERE [process:name IN ('powershell.exe', 'cmd.exe', 'wmic.exe', 'cscript.exe') AND process:parent.name IN ('winword.exe', 'outlook.exe', 'excel.exe')]

Sim ple yet powerful language that's tailored for threat hunting

Unified across all environm ents and tools

Shareable fram ework to accelerate knowledge sharing and hunt re -use

Extensible with external m achine-learning and analytics

14

#RSAC
Modernization requires visibility and advanced analytics

Us e r a nd e ntity thre a t a na lytics with SIEM/ UBA
Endpoint De te ction a nd Re s pons e (EDR)

Be havioral and rule -base d de te ction and corre lation of m alicious activity through re al-tim e analysis of log data across the enterprise
Be havioral de te ction and pre ve ntion of m alicious activity across e ndpoints and m itigate and respond to threats rem otely

Ne twork De te ction a nd Re s pons e (NDR)

Be havioral de te ction base d on m alicious network activity and SIEM/UBA and EDR gaps to provide critical insights to prioritize rem ediation

SIEM/ UBA

S OC TRI AD

NDR

EDR

15

Security analysts typical workflow complexity

#RSAC
Simplified and integrated detection and response workflow

Re vie w op e n incid e nt s Choos e highe s t p riorit y
Triage and inve s tigate incide nt Re s pond
Pe rform root-cause analys is Mitigation s te ps Incid e nt
Clos e incid e nt

Inve s tiga te in tool 2 Inve s tiga te in tool 3 Inve s tiga te in tool 4 De te rmine va lidity / s e ve rity De te rmine re s pons e s te ps Build / alte r playbook
Re s pond in SOAR

Op e n rout e d incid e nt
Re vie w root caus e analys is Exe cute a dditional inve s tiga tion
Add re le vant re s ponse Re vie w automate d workflow 1 click to e xe cute re s ponse actions
Incid e nt
Clos e incid e nt

· Fewer, m ore accurate alerts with an open scalable approach
· Leverage existing tools and avoid vendor lock in
· Stream lined workflow, reduced m anual effort thanks to autom ation
· Pre-built detection and response so teams can protect your organization, even without deep security expertise

16

#RSAC
Enabling flexible hybrid or native XDR depending on what you need

EDR
Windows Defender

SIEM
Azure Sentinel Elastic Search

Hybrid XDR NDR
Ve c t ra

HYBRID QRadar XDR
Conne ct

OTHER
Da t a Do g
ProofPoint

EDR
IBM Se curity Re aQta
Native XDR

SIEM
IBM Se curity QRa d a r SIEM

NDR
IBM Se curity QRadar NDR

NATIVE
QRadar XDR Conne ct

OTHER
Da t a Do g
ProofPoint

INTEL

INTEL
IBM X-Force

17

Open Security in practice - QRadar XDR Connect

#RSAC
STI X SHI FTER

· Common attack surface controls
· Enable s prioritization and m e a s u re m e n t

· Common language for de te ction · Huge community acce le rating de te ction
and prote ction
Sea mlessly Integra ted Workflow

· Common inve stigation and hunting · Choose what data storage tools
make se nse for you
18

#RSAC
Open Security in practice - QRadar XDR Connect

+

STI X SHI FTER

· Unifie d, corre late d vie w of malicious activity
· Le ve rage de te ction capabilitie s from cloud, e ndpoint, app, data, e tc.

· Automate d data mining and time line cre ation
· Force multiple you se curity te am

Sea mlessly Integra ted Workflow

· Re comme nde d ne xt ste ps and actions · Re spond more quickly and consiste ntly
19

Open security enables the future

UNI FI ED I NTELLI GENT
CONNECTED OP EN

Single use r e xpe rie nce across tools and te ams
Analytics, Automation and AI built for de te cting thre ats and analyst p ro d u c t ivit y
Inte gration with your e xisting tools or IBM's
Ad a p t a b le archite cture to he lp avoid lock-in

On pre mis e

Hybrid Cloud

SaaS

#RSAC
QRa da r XDR

#RSAC
Apply What You Have Learned Today
This week:
­ Stop by the IBM Security booth and have a one-on-one conversation with our IBM Security QRadar subject matter experts
21

