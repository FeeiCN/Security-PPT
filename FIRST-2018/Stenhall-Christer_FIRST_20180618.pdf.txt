A holistic approach to ensure product security
Christer Stenhäll Ericsson PSIRT
2018-06-18 | Pa ge 1

Agenda
--Ericsson at a glance --Our perspective on Security --SRM, this is how we do it --PSIRT --Vulnerability Management --Conclusion­ Next Steps
2018-06-18 | Pa ge 2

Ericsson at a glance

Enabling the full value of connectivity for service providers

Business areas: -- Networks -- Digita l services -- Technology a nd
emerging business -- Ma na ged services

By the numbers: -- 180+ countries -- 201.3 b.sek in sa les -- 100,700 employees -- 45,000 pa tents

Image: Ericsson headquartersK, ista, Sweden
2018-06-18 | Pa ge 3

Our perspective on Security in the networked society

2018-06-18 | Pa ge 4

· services should always beavailable · security should require minimum effort from users · communica tions should be protected · a ll accessto informa tion a nd da ta should be authorized · manipulation of da ta in the networks should be possible to detect · the right to privacy should be protected

BuildingTrust

TRUSTED BUSINESS

N E

TRUSTED Operations

E

D

TRUSTED Network

S

TRUSTED Products

2018-06-18 | Pa ge 5

Business decision to accept residual risks and manage unacceptable risks

E

N

Appropriate procedures for

A

secure operations

B

L

Sound, manageable

security architecture

E

S
Devices/nodes/products without exploitable vulnerabilities

Driving & contributing to improving standards

Security Reliability Model (SRM)

Functions
Product Development

Assurance

Documentation

Services

2018-06-18 | Pa ge 6

Baseline Requirements & Design Rules
Baseline Security & Privacy Requirements
· both functional and non-functional requirements
Security and Privacy Design Rules
· How to implement requirements
2018-06-18 | Pa ge 7

Security Functionality areas
Security functions divided into6 areas ba sed on the defence in depth.
Network Protection
· Conf &integ protection of O&M, Server side a uthentica tion
Applica tion Security
· Softwa re Signing, Web a pplica tion security
Pla tform Security
· Ma lwa re Prevention, Trusted sta te a nd secure boot
Identity a nd Access Ma na gement
· Enforce repla cement of pa sswords, Support pa ssword a ging
Logging
· Full Persona l Accounta bility, Ability to Log Loca lly
Da ta Protection
· Pa ssword protection, Confidentia lity a nd Integrity of Persona l Da ta
2018-06-18 | Pa ge 8

Security Assurance
Security Reliability Model (SRM)

Functions
Product Development

Assurance

Documentation

Services

2018-06-18 | Pa ge 9

Security Assurance levels

Products with Special Security requirements

Tailored Assurance

Products with Need of a High Security assurance

Advanced level

All of Ericsson Products
2018-06-18 | Pa ge 10

All mandatory assurance items and the basic security functionality

Security Assurance

Risk Assessment

Privacy Impact Assessment

Secure Coding

Vulnerability Assessment

Vulnerability Management

Hardening

2018-06-18 | Pa ge 11

Security Assuran-cRe A

Risk Assessment

-- RA for new products · Determine the a ppropria te security level · Wha t security functions a re needed

Privacy Impact Assessment
Secure Coding
Vulnerability Assessment
2018-06-18 | Pa ge 12

-- RA in the end of development
· Costly a nd difficult to ma ke cha nges
-- Risk Assessment in Development

-- Risk Assessment report
· Risk Identifica tion · Risk Ra ting (severity) · Risk Trea tment Pla n

Identifica tion ­ Mitiga tion ­ Verifica tion

Security Assuran-cPeIA

Risk Assessment
Privacy Impact Assessment
Secure Coding
Vulnerability Assessment
2018-06-18 | Pa ge 13

-- Priva cy Da ta Cla ssifica tion
· Wha t types of da ta does the product ha ndle
-- Priva cy Informa tion flows
-- PIA for Xa a s
-- Priva cy impa ct report
· Description of the priva cy impa ct (threa ts a nd rela ted risks) · Existing priva cy design fea tures · Recommenda tions

Security Assuran-cSeC

Risk Assessment
Privacy Impact Assessment
Secure Coding
Vulnerability Assessment
2018-06-18 | Pa ge 14

-- Secure Coding Standard
-- Education
· Secure coding standard training for developers & testers · Up to date developer (programming) training · Continuous learning

-- Static and Dynamic analysis -- Code review -- Secure Coding Report

Sprint delivery

Sprint pla nning

Coding

Sprint delivery

Sprint pla nning

Coding

review

Unit testing

review

Unit testing

Tra ining
-SCS, CWE, OWASP, tools,...

System build
- Code a na lysis

Secure Coding report

Security Assuran-cVeA

Risk Assessment
Privacy Impact Assessment

-- Vulnerability Assessment (VA) normally done to late!
-- VA in Continuous Integration/Continuous Delivery (CI/CD)
-- Developers are the Key -- Function testing done during development
· Security testing · Verifying Hardening

Secure Coding

Vulnerability Assessment
2018-06-18 | Pa ge 15

Documentation
Security Reliability Model (SRM)

Functions
Product Development

Assurance

Documentation

Services

2018-06-18 | Pa ge 16

Documentation

Security User Guide
Describes the security opera tion a nd ma intena nce a ctivities tha t ca n be performed for the product
RA / PIA Report

Security Test report Hardening Guideline

Test Report for externa l communica tion

Instruction of ta ilored ha rdening to be done during delivery

VA Report

Secure Coding Report

Report of identified security a nd priva cy risks for interna l use.

Test Report for interna l communica tion

Describes the Security Coding a ctivities done during the development

2018-06-18 | Pa ge 17

Services
Security Reliability Model (SRM)

Functions
Product Development

Assurance

Documentation

Services

2018-06-18 | Pa ge 18

Services

Secure Deployment

2018-06-18 | Pa ge 19

Security Support

Consultancy Security aaS

Ericsson PSIRT

Vulnera bility Ma na gement

Incident Response

Security Support

VA Methods & Tools

2018-06-18 | Pa ge 20

Reporting issues/ vulnerabilities in Ericsson products https:/ / www.ericsson.com/ en/ about-us/ enterprise-security/ psirt

Vulnerability Management

Communication

Vulnerability

Triage

Alert

Vulnerability Database

Product Registration

Answer

Development

2018-06-18 | Pa ge 21

Conclusio-nNext Steps
-- SRM­ Risk based approach -- Security awareness among developers are the key! -- Process transformation to be more lean & agile -- Improvement still needed onaaSways of working -- Who to contact: psirt@ericsson.com
2018-06-18 | Pa ge 22

Characters for Embedded characters: !"#$%&'()*+,./ 0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\ ]^_`a bcdefghijklmnopqrstuvwxyz{| }~¡¢£¤¥¦ §¨©ª «¬®¯°±²³´¶ ·¸¹º»¼ ½ À ÁÂÃÄÅÆÇÈËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞßà á â ã ä å æ çèéêëìíîïğñòóôõö÷øùúûüışÿ   CciLl OE oe SsYZz^°~`',"",,  · ... <>/TMCC  -fifl                    --­ -
!"#$%&'()*+,./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ\[]^_`abcdefghijklmnopqrstuvwxyz {|}~¡¢£¤¥¦ §¨ ©ª«¬®¯°±²³´¶·¸¹º»¼ ½ÀÁÂÃÄÅÆÇÈËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞßàáâãäåæçèéêëìíîïğñòóôõ÷öøùúûüışÿCciLl OEoeSsYZz^°~  `',"",,·...<>/TMCC -fifl  --­ -
!"#$%&'()*+,./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWX\Y]^Z_[`abcdefghijklmnopqrstuvwxyz{|}~¡¢£¤¥¦ §¨©ª«¬®¯°±²³´¶·¸¹º»¼½ÀÁ ÂÃÄÅÆÇÈËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞßàáâãäåæçèéêëìíîïğñòóô÷õøöùúûüışÿCciLlOEoe SsYZz^°~ `',"",,·...<>/TMCC fifl-  --­ -
!"#$%&'()*+,./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWX\ ]Y^_Z`[abcdefghijklmnopqrstuvwxy{z|}~¡¢£¤¥¦ §¨©ª«¬®¯°±²³´¶·¸¹º»¼½ÀÁÂÃ ÄÅÆÇÈËÌÍÎÏĞÑÒÓÔÕ×ÖØÙÚÛÜİŞßàáâãäåæçèéêëìíîïğñòóô÷õøöùúûüışÿCciLlOEoe SsYZz^°~ `',"",,·...<>/TMCC fifl-   --­ -

