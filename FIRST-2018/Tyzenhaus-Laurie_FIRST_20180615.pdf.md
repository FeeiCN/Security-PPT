[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

Coordinated Vulnerability Disclosure

Laurie Tyzenhaus June 2018
Software Engineering Institute Carnegie Mellon University Pittsburgh, PA 15213

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

Copyright 2018 Carnegie Mellon University. All Rights Reserved.
This material is based upon work funded and supported by the Department of Homeland Security under Contract No. FA8702-15-D-0002 with Carnegie Mellon University for the operation of the Software Engineering Institute, a federally funded research and development center sponsored by the United States Department of Defense.
The view, opinions, and/or findings contained in this material are those of the author(s) and should not be construed as an official Government position, policy, or decision, unless designated by other documentation.
References herein to any specific commercial product, process, or service by trade name, trade mark, manufacturer, or otherwise, does not necessarily constitute or imply its endorsement, recommendation, or favoring by Carnegie Mellon University or its Software Engineering Institute.
NO WARRANTY. THIS CARNEGIE MELLON UNIVERSITY AND SOFTWARE ENGINEERING INSTITUTE MATERIAL IS FURNISHED ON AN "AS-IS" BASIS. CARNEGIE MELLON UNIVERSITY MAKES NO WARRANTIES OF ANY KIND, EITHER EXPRESSED OR IMPLIED, AS TO ANY MATTER INCLUDING, BUT NOT LIMITED TO, WARRANTY OF FITNESS FOR PURPOSE OR MERCHANTABILITY, EXCLUSIVITY, OR RESULTS OBTAINED FROM USE OF THE MATERIAL. CARNEGIE MELLON UNIVERSITY DOES NOT MAKE ANY WARRANTY OF ANY KIND WITH RESPECT TO FREEDOM FROM PATENT, TRADEMARK, OR COPYRIGHT INFRINGEMENT.
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.
This material may be reproduced in its entirety, without modification, and freely distributed in written or electronic form without requesting formal permission. Permission is required for any other use. Requests for permission should be directed to the Software Engineering Institute at permission@sei.cmu.edu.
Carnegie Mellon®, CERT® and CERT Coordination Center® are registered in the U.S. Patent and Trademark Office by Carnegie Mellon University.
DM18-0777

FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release

and unlimited distribution.]

2

Coordination Communication Topologies

Common network topologies
FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release

and unlimited distribution.]

3

Single Vendor Vulnerability Report

Reporter Identifies a Vulnerability
Reporter contacts Vendor
Vendor responds (or ignores) Reporter

Point to Point
C

Reporter requests assistance:

· Reporter contacts CERT/CC

V

· CERT/CC confirms VUL

· CERT/CC communicates with

Reporter

R

· CERT/CC contacts Vendor

FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release

and unlimited distribution.]

4

Multiple Vendor Vulnerability Report
Hub & Spoke

C

V

R

V

V
FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

V

[DISTRIBUTION STATEMENT A] Approved for public release

and unlimited distribution.]

5

Coordinated Vulnerability Disclosure
Problems with Multi-Vendor Coordination: Hub & Spoke does not scale Who do we notify? Who did we miss? More effort happens after Disclosure Vendors must contact us for updating the vul note. Balancing conflicting vendor disclosure policies.
Examples: VU#484891 (the vul that enabled SQL Slammer) VU#228519 (KRACK)

FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release

and unlimited distribution.]

6

Is there a better solution?
Improving Coordination

PSIRT: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

Collaborative Vulnerability Disclosure

FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release

and unlimited distribution.]

8

A Better Solution?

Shared Bus

V

V

C

R

V

V

FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release

and unlimited distribution.]

9

Microsoft's response to Congressional Letter
In less complicated scenarios, the CVD protocol calls for a huband-spoke model of communication through which a vulnerability owner communicates individually with each affected vendor.
In more complicated scenarios--like the one presented by Meltdown and Spectre--a "shared-bus" model can be required, to ensure affected companies can coordinate directly "through the use of conference calls, group meetings, and private mailing lists."
https://energycommerce.house.gov/wp-content/uploads/2018/02/MSFT-Spectre-Response-to-ECCommittee-.pdf

FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

10

Communications
· Private shared venue · Vendors are invited in. · Shared file space · Track threaded discussions · Vendors can be added, immediate access to history

C

VV
VV
FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

R

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

11

Coordinator/Coordination
· Sets target dates and milestones · Identifies and invites affected vendors · Invites additional vendors as identified

C

VV
VV
FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

R

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

12

Reporter
· Identifies the vulnerability · May/may not contact vendor(s) · Contacts Coordinator

C

VV
VV
FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

R

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

13

Vendors
· Vendors post statements, links to patches, etc. · Possible Multiple vulnerability reports (separate venues)

C

VV
VV
FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

R

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

14

Challenges

FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

15

Alternate Disclosure

Pre-Disclosure :
Group effort Open comms within the group Add new vendors Discussion threads/ scheduling disclosure

Disclosure:
Artifacts (publishable
docs)

Post ­ Disclosure:
Find new vendors Update references
Refine Content

FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

16

Who does Multi-Vendor Coordination?
More organizations than expected...

PSIRT: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

Who does Multi-Vendor Coordination?

Microsoft Intel
Google CERT/CC Other CERTs
PSIRTs

FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

18

Microsoft
Coordinated Vulnerability Disclosure https://technet.microsoft.com/en-us/security/dn467923.aspx Minimizing cybersecurity risk through coordinated vulnerability disclosure https://www.microsoft.com/en-us/cybersecurity/contenthub/minimizing-cybersecurity-risk-through-coordinatedvulnerability-disclosure A Call for Better Coordinated Vulnerability Disclosure https://blogs.technet.microsoft.com/msrc/2015/01/11/a-call-forbetter-coordinated-vulnerability-disclosure/

FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

19

Intel
Product Security at Intel https://www.intel.com/content/www/us/en/corporateresponsibility/product-security.html Bug Bounty Program https://www.intel.com/content/www/us/en/security-center/bugbounty-program.html Vulnerability handling Guidelines https://www.intel.com/content/www/us/en/securitycenter/vulnerability-handling-guidelines.html

FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

20

Google
Google Vulnerability Reward Program (VRP) Rules https://www.google.com/about/appsecurity/reward-program/ HackerOne ­ bug bounty program https://hackerone.com/google https://www.google.com/about/appsecurity/reward-program/ How Google handles security vulnerabilities https://www.google.com/about/appsecurity/

FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

21

Dell
Report a Potential Vulnerability in Dell Products or Software https://www.dell.com/learn/us/en/04/campaigns/report-vulnerability HackOne https://hackerone.com/dellsecureworks

FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

22

HP
Report a potential security vulnerability to HP (reporting form) https://ssl.www8.hp.com/h41268/live/index.aspx?qid=25434 HackerOne https://hackerone.com/hp HP Enterprise Product Security Vulnerability Alerts https://www.hpe.com/us/en/services/security-vulnerability.html

FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

23

The CERT® Guide to Coordinated Vulnerability Disclosure https://resources.sei.cmu.edu/asset_files/SpecialReport/2017_003_001_5 03340.pdf Report a vulnerability (form) https://vulcoord.cert.org/VulReport/ Guidelines for Requesting Coordination Assistance https://vuls.cert.org/confluence/display/Wiki/Guidelines+for+Requesting+C oordination+Assistance Vulnerability Notes Database https://www.kb.cert.org/vuls/ CERT Vulnerability Data Archive & Tools https://vuls.cert.org/confluence/display/tools/CERT+Vulnerability+Data+Ar chive+and+Tools

FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

24

Cybersecurity Tech Accord

FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

25

Cybersecurity Tech Accord
34 companies committed to: 1. Stronger Defense 2. No offense 3. Capacity building 4. Collective action
Background https://cybertechaccord.org/ Agreement https://cybertechaccord.org/accord/

FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

26

............. Collective Action ..............
"The companies will build on existing relationships and together establish new formal and informal partnerships with industry, civil society and security researchers to improve technical collaboration, coordinate vulnerability disclosures, share threats and minimize the potential for malicious code to be introduced into cyberspace."

FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

27

SIGNATORIES

ABB ARM AVAST BITDEFENDER BT CA TECHNOLOGIES CARBON BLACK CISCO CLOUDFLARE DATASTAX DELL DOCUSIGN

FACEBOOK

NIELSEN

FASTLY

NOKIA

FIREEYE

ORACLE

F-SECURE

RSA

GITHUB

SAP

GUARDTIME

STRIPE

HP INC

SYMANTEC

HPE

TEELFONICA

INTUIT

TENABLE

JUNIPER NETWORKS TRENDMICRO

LINKEDIN

VMWARE

MICROSOFT

FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

28

What can you do today?
1. Provide current contact information for vulnerability reports. - generic email address - group that monitors incoming messages
2. Maintain PGP key(s). 3. Share this information with CERT organizations.

FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

29

What are your thoughts?

Laurie Tyzenhaus latyzenhaus@cert.org
Coordinated Vulnerability Disclosure Team Lead

FIRST: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

30

