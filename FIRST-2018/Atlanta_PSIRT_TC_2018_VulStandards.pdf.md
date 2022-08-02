[DISTRIBUTION STATEMENT Please copy and paste the appropriate distribution statement into this space.]
Vulnerability Standards Update
Art Manion amanion@cert.org FIRST PSIRT TC 2018 Atlanta
Software Engineering Institute Carnegie Mellon University Pittsburgh, PA 15213

Copyright 2018 Carnegie Mellon University. All Rights Reserved.
This material is based upon work funded and supported by the Department of Homeland Security under Contract No. FA8702-15-D-0002 with Carnegie Mellon University for the operation of the Software Engineering Institute, a federally funded research and development center sponsored by the United States Department of Defense.
The view, opinions, and/or findings contained in this material are those of the author(s) and should not be construed as an official Government position, policy, or decision, unless designated by other documentation.
References herein to any specific commercial product, process, or service by trade name, trade mark, manufacturer, or otherwise, does not necessarily constitute or imply its endorsement, recommendation, or favoring by Carnegie Mellon University or its Software Engineering Institute.
NO WARRANTY. THIS CARNEGIE MELLON UNIVERSITY AND SOFTWARE ENGINEERING INSTITUTE MATERIAL IS FURNISHED ON AN "AS-IS" BASIS. CARNEGIE MELLON UNIVERSITY MAKES NO WARRANTIES OF ANY KIND, EITHER EXPRESSED OR IMPLIED, AS TO ANY MATTER INCLUDING, BUT NOT LIMITED TO, WARRANTY OF FITNESS FOR PURPOSE OR MERCHANTABILITY, EXCLUSIVITY, OR RESULTS OBTAINED FROM USE OF THE MATERIAL. CARNEGIE MELLON UNIVERSITY DOES NOT MAKE ANY WARRANTY OF ANY KIND WITH RESPECT TO FREEDOM FROM PATENT, TRADEMARK, OR COPYRIGHT INFRINGEMENT.
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.
This material may be reproduced in its entirety, without modification, and freely distributed in written or electronic form without requesting formal permission. Permission is required for any other use. Requests for permission should be directed to the Software Engineering Institute at permission@sei.cmu.edu.
Carnegie Mellon®, CERT® and CERT Coordination Center® are registered in the U.S. Patent and Trademark Office by Carnegie Mellon University.
DM18-0275

NC3 Vulnerability Management © 2017 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

2

About
Carnegie Mellon University Software Engineering Institute (SEI) · Federally Funded Research and Development Center (FFRDC) CERT Coordination Center (CERT/CC) Vulnerability Analysis · Art Manion, Technical Manager/Principle Engineer · Coordinated vulnerability disclosure · Vulnerability discovery
- Binary analysis - Fuzz testing
· Attack modeling
- Ecosystem and data analysis
· Outreach, standards, policy

NC3 Vulnerability Management © 2017 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

3

More about
Significant sponsorship · Department of Homeland Security (DHS)
- National Cybersecurity and Communications Integration Center (NCCIC) -US-CERT and ICS-CERT (different than CERT/CC)
· Department of Defense Cyber Crime Center (DC3)
- DoD Vulnerability Disclosure Program (VDP) https://hackerone.com/deptofdefense

NC3 Vulnerability Management © 2017 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

4

Coordination and disclosure: 1988

NC3 Vulnerability Management © 2017 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

5

Coordination and disclosure: 2017

NC3 Vulnerability Management © 2017 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

6

Summary
Standards, quasi-standards, formats, protocols, efforts · Vulnerability information systems · Policy, guidance, state of the practice Sources · Myself and CERT/CC · FIRST VRDX-SIG

NC3 Vulnerability Management © 2017 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

7

Vulnerability identification

Vulnerabilities (K)

20 15 10
5 0
2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016

NVD (CVE)
Flexera (Secunia)
Risk Based Security (OSVDB) SecurityFocus
CERT/CC

NC3 Vulnerability Management © 2017 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

8

Automated discovery

Vulnerabilities (K)

20 15 10
5 0
2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016

NVD (CVE)
Flexera (Secunia)
Risk Based Security (OSVDB) SecurityFocus
CERT/CC (Android TLS)

NC3 Vulnerability Management © 2017 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

9

Vulnerability record
OASIS CSAF (CVRF) https://www.oasis-open.org/committees/csaf/
CVE JSON https://github.com/CVEProject/automation-workinggroup/tree/master/cve_json_schema NIST NVD https://nvd.nist.gov/vuln/data-feeds
NIST Vulnerability Description Ontology https://csrc.nist.gov/publications/detail/nistir/8138/draft

NC3 Vulnerability Management © 2017 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

10

Vendor contact
Vendor Contact record FIRST Vulnerability Coordination SIG A Method for Web Security Policies (security.txt) https://tools.ietf.org/html/draft-foudil-securitytxt-03 CVE Numbering Authority (CNA) record CVE Automation Working Group

NC3 Vulnerability Management © 2017 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

11

Supply chain transparency

Software bill of materials (SBoM), manifest, inventory, supply chain, component relationships, third-party/OSS technical debt
Software Identification Tags (SWID) https://tagvault.org/ https://www.iso.org/standard/65666.html https://medisao.com/blog/automated-security-vulnerability-alerts-forembedded-linux
Software Package Data Exchange (SPDX) https://spdx.org/
Department of Commerce National Telecommunications and Information Administration (NTIA) · Multistakeholder process rumblings
Managing Security Risks Inherent in the Use of Third-party Components https://www.safecode.org/wpcontent/uploads/2017/05/SAFECode_TPC_Whitepaper.pdf

NC3 Vulnerability Management © 2017 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

12

Supply chain transparency
OSS Security:That's Real Mature Of You! https://www.first.org/conference/2017/program#poss-security-thats-real-mature-of-you
H.R.5793 Cyber Supply Chain Management and Transparency Act of 2014 · "...bill of materials, of each binary component of the software,
firmware, or product..." · Not vulnerable (per NVD/CVE) or acceptance waiver · "...designed in a manner that allows for any future security
vulnerability or defect in any part of the software, firmware, or product to be easily patched, updated, or replaced...in a timely manner..."

NC3 Vulnerability Management © 2017 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

13

(Vulnerability) information sharing
Using MISP to share vulnerability information efficiently http://www.misp-project.org/2018/01/09/Using-MISP-to-sharevulnerability-information-efficiently.html
Trusted Automated eXchange of Indicator Information (TAXII) https://www.oasisopen.org/committees/tc_home.php?wg_abbrev=cti
TheHive Project https://thehive-project.org
Traffic Light Protocol (TLP) https://www.first.org/tlp/
Federacy https://github.com/federacy/summary/ · "...a cryptoeconomic protocol and decentralized platform for
security research and vulnerability management."

NC3 Vulnerability Management © 2017 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

14

Severity
Common Vulnerability Scoring System (CVSS) https://www.first.org/cvss/ · Vectors, severity function · Severity, priority, risk · Safety impact
Incomplete selection of less-used alternatives · Parkerian Hexad
http://www.computersecurityhandbook.com/csh4/chapter5.html · Apgar
https://en.wikipedia.org/wiki/Apgar_score · Microsoft Exploitability Index
https://technet.microsoft.com/en-us/security/cc998259.aspx · DREAD
https://blogs.msdn.microsoft.com/david_leblanc/2007/08/14/dreadful/ · Vulnerability Response Decision Assistance (VRDA)
http://resources.sei.cmu.edu/library/asset-view.cfm?assetid=50301

NC3 Vulnerability Management © 2017 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

15

Coordinated vulnerability disclosure
ISO/IEC 29147 Vulnerability disclosure and 30111 Vulnerability handling processes https://www.iso.org/standard/45170.html https://www.iso.org/standard/53231.html
PSIRT Services Framework https://www.first.org/education/Draft_FIRST_PSIRT_Service_Framework_v1.0
NIST Cybersecurity Framework https://www.nist.gov/cyberframework
· Version 1.1 Draft 2 RS.AN-5
CERT Guide to Coordinated Vulnerability Disclosure https://resources.sei.cmu.edu/asset_files/SpecialReport/2017_003_001_503340.pdf
Guidelines and Practices for Multi-Party Vulnerability Coordination and Disclosure https://www.first.org/global/sigs/vulnerability-coordination/multiparty/
...in collaboration with NTIA (US) https://www.ntia.doc.gov/other-publication/2016/multistakeholder-processcybersecurity-vulnerabilities
Letters to Tech Companies on Meltdown and Spectre Vulnerabilities (US) https://energycommerce.house.gov/news/letter/letter-tech-companies-meltdownspectre-vulnerabilities/

NC3 Vulnerability Management © 2017 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

16

Coordinated vulnerability disclosure
Global Forum on Cyber Expertise (GFCE) Coordinated Vulnerability Disclosure initiative (EU) https://www.thegfce.com/initiatives/r/responsible-disclosure-initiative-ethical-hacking
National Cyber Security Centre (NCSC-NL, NL) https://www.ncsc.nl/english/security
More from NL https://www.marietjeschaake.eu/media/uploads/posts/1520512095Schaake%20cybersecurity%20act%20AM%20(final)%20COM(2017)0477_28-022018_10.53.58.pdf https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=COM:2017:0477:FIN
· "ensure that ICT products and services are provided with up to date software that does not contain known vulnerabilities, and are provided mechanisms for secure software updates"
· "rules concerning how previously undetected cybersecurity vulnerabilities in ICT products and services are to be reported and dealt with"
Global Commission on the Stability of Cyberspace (EU) https://cyberstability.org/
CEPS Software Vulnerability Disclosure in Europe (EU) https://www.ceps.eu/content/software-vulnerability-disclosure-europe

NC3 Vulnerability Management © 2017 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

17

Coordinated vulnerability disclosure
Food and Drug Administration (FDA, US) https://www.fda.gov/MedicalDevices/DigitalHealth/ucm373213.htm · NH-ISAC · MD-VIPER · MedISAO
National Highway Traffic Safety Administration (NHTSA, US) https://www.nhtsa.gov/technology-innovation/vehicle-cybersecurity https://www.nhtsa.gov/crash-avoidance/automotive-cybersecurity · Auto-ISAC
Vulnerability Equities Process (VEP, US) https://www.whitehouse.gov/articles/improving-makingvulnerability-equities-process-transparent-right-thing/

NC3 Vulnerability Management © 2017 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

18

Coordinated vulnerability disclosure
Federal Trade Commission (FTC, US) enforcement actions · "...respondent failed to...maintain an adequate process for receiving
and addressing security vulnerability reports from third parties..." http://www.legis.ga.gov/legislation/en-US/Display/20172018/SB/315
A selection of draft bills in congress (US) · Hack the DHS Act of 2017 (H.R. 2774) · Promoting Good Cyber Hygiene Act of 2017 (H.R. 3202) - Medical Device Cybersecurity Act of 2017 (S. 1656) - Internet of Medical Things Resilience Partnership Act of 2017 (H.R.
3985) - Hack Your State Department Act
https://lieu.house.gov/sites/lieu.house.gov/files/LIEU_091_xml.pdf
CVD program before bounty!

NC3 Vulnerability Management © 2017 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

19

Coordinated vulnerability disclosure
...missing from traditional "Protect my network" controls culture · Center for Internet Security (CIS) Controls · Information Systems Audit and Control Association (ISACA)
COBIT · NIST SP 800-53 · ISO/IEC 27000 series
- 12.6.1 Technical vulnerability management
· IEC-62443 (ISA99) Industrial communication networks - Network and system security

NC3 Vulnerability Management © 2017 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

20

Security research

DMCA exemption for good-faith security research (US) https://www.federalregister.gov/documents/2015/10/28/201527212/exemption-to-prohibition-on-circumvention-of-copyrightprotection-systems-for-access-control#p-193 · "A motorized land vehicle" · "A medical device..." · "(including voting machines)"
Safe harbor (US) https://hackerone.com/deptofdefense · Covenant not to initiate legal action against researchers acting in
good faith · Make known that research activity was in good faith
"a new crime of unauthorized computer access" (US, GA) http://www.legis.ga.gov/legislation/enUS/Display/20172018/SB/315

NC3 Vulnerability Management © 2017 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

21

FIRST
Special Interest Groups (SIGs) https://www.first.org/global/sigs/ · Vulnerability Coordination SIG · Vendor SIG · Vulnerability Reporting and Data eXchange (VRDX) SIG
- Global Vulnerability Reporting Summit https://www.first.org/global/sigs/vrdx/summit2018/
PSIRT TC · Atlanta, 2018
https://www.first.org/events/colloquia/atlanta2018/

NC3 Vulnerability Management © 2017 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

22

