

14 Questions to Assess Your

Software Vendor Supply-Chain Risk

2021



14 QUESTIONS TO ASSESS YOUR SOFTWARE VENDOR SUPPLY-CHAIN RISK

Table of contents

Executive summary  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 3 Historic scope of the SolarWinds breach  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  4 Anatomy of the attack  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 5 The existential threat of supply-chain attacks to SMBs  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 7 Application access security  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 10 Secure software development  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  13 Summary  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . 16 Acronis Cyber Protection Solutions certifications and tests .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  17 Additional resources  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  18 About Acronis  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  19

2 | acronis.com


Executive summary

14 QUESTIONS TO ASSESS YOUR SOFTWARE VENDOR SUPPLY-CHAIN RISK

The SolarWinds attack brought the risk of potentially catastrophic supply-chain attacks into sharp focus for enterprises, government institutions, and small and midsized businesses alike.

The breach was notable for its subtlety and sophistication: it was effectively an advanced persistent threat (APT) attack staged by a state actor against a software vendor for the purposes of conducting surveillance on the vendor's many customers in government and private enterprise.

Managed service providers (MSPs) in particular should focus on this risk, as a successful attack that extends to the MSP's clients could represent an existential threat to those businesses. Few companies will want to do business with an MSP that, rather than protecting its clients, provided a conduit for data theft, tampering or destruction.

Your cybersecurity posture can be dramatically weakened by vulnerabilities among your suppliers, partners, and customers. A chain is only as strong as its weakest link.

Organizations seeking to reduce their software supplychain risk should focus first on critical areas of cybersecurity risk associated with their tech vendors and service providers, including:
1. Security of access controls 2. Quality of their secure
software development and distribution practices.

3 | acronis.com


Historic scope of the SolarWinds breach

14 QUESTIONS TO ASSESS YOUR SOFTWARE VENDOR SUPPLY-CHAIN RISK

The SolarWinds supply chain incident that was detected in early December 2020 has emerged as one of the most sophisticated and successful cyberattacks on Western government institutions and businesses in recent history. In it, a well-organized, well-funded, highly skilled group purportedly affiliated with Russia's Foreign Intelligence Service successfully penetrated thousands of large global enterprises and multiple U.S. federal government agencies, including the Departments of Homeland Security, State, Treasury and Commerce. While 80% of victims are believed to be U.S.-based, the attack also compromised targets in Canada, Mexico, the U.K., Spain, Belgium, Israel, and the U.A.E.
The SolarWinds breach is the latest extant example of a so-called software supply-chain attack, in which an adversary compromises a trusted source of software, firmware or hardware, embedding surveillance tools and other malicious code in it. The initial target can be a vendor's private repository

or app store, or a public code-sharing repository like GitHub. A potential breach is enabled whenever a user installs the compromised software update, firmware update, or hardware. In the case of the SolarWinds breach, attackers penetrated the tech vendor's private repository for Orion, a network management and performance monitoring tool popular with enterprises, public institutions, and service providers. Such tools are a popular target for attackers because by their nature they can easily provide access to an entire business, its partners and its customers.
The attack also qualifies as an advanced persistent threat (APT), characterized by a sophisticated, multi-stage effort most often undertaken by nation-states that have the deep pockets, patience, and skills required to mount them. APTs are by their nature designed to evade detection over the long term, thus are difficult to defend against and then to root out completely once they have been discovered.

4 | acronis.com



14 QUESTIONS TO ASSESS YOUR SOFTWARE VENDOR SUPPLY-CHAIN RISK

Anatomy of the attack

The attack followed the classic multi-stage tactics of APTs: initial compromise, communication to an external command and control server to download additional malware, surveillance of the tech environment to identify vulnerabilities, escalation of privileges, lateral movement within and beyond the network to infiltrate other accessible targets, and then execution of the ultimate attack, in this case the theft of valuable data. Extraordinary, ingenious methods were used at every step of the attack to evade secure software development guardrails and cybersecurity countermeasures.

Beginning in the autumn of 2019, the attackers began implanting a malicious backdoor into legitimate Orion code, using a highly sophisticated process to ensure that any compromised Orion software builds did not fail and thus alert the developers to an intrusion. The compromised software now contained a backdoor that could communicate via HTTP to external third-party servers. This gave it the ability to retrieve and execute commands to transfer files to external services, execute malicious as well as legitimate processes, profile the system, reboot machines, and disable system services like forensic and anti-virus countermeasures. Its network traffic masqueraded as a normal Orion protocol, and it stored its reconnaissance in ordinary plugin configuration files, allowing it to blend in with everyday SolarWinds activity.

Once the trojanized update was installed by an Orion customer, a malicious DLL was loaded by a SolarWinds installation process that saw it as legitimate, as it was signed with the proper digital certificate. After a dormant period of up to two weeks, this malware began connecting with external command and control servers, all renamed to look like legitimate servers in the victim's environment, and using virtual private servers to present IP addresses from the victim's country.

5 | acronis.com



14 QUESTIONS TO ASSESS YOUR SOFTWARE VENDOR SUPPLY-CHAIN RISK

Traffic to the malicious control servers mimicked normal

SolarWinds API communications to evade detection. After

gaining initial access, the attackers continued to disguise their

operations while they moved laterally across the organization,

frequently using legitimate credentials to gain remote access

into a victim's environment. They routinely replaced legitimate

utilities and scheduled tasks with their own malicious

counterparts, ran them, then restored the originals, removing

their tools and backdoors once remote access had been

achieved.

The resulting theft of sensitive business and government data, including

knowledge of IT infrastructure and operations, appears to be the main goal of the

This approach enabled the use of a memory-only dropper running as a

attack. While the success of this operation is a big blow to the affected businesses

service to read a fake .jpg file, decode its embedded malicious payload, and and government agencies, it is conceivable that its effects could have been much

manually load it directly into memory, thus evading antivirus scans. This payload worse. For example, in addition to data theft, attackers might also have mounted a

did the real damage, identifying useful files throughout the organization and ransomware attack that encrypted the target's data, leaving victims struggling to

quietly uploading them to the attackers' external servers.

recover now-inaccessible data and resume normal operations.

6 | acronis.com


The existential threat of supply-chain attacks to SMBs

14 QUESTIONS TO ASSESS YOUR SOFTWARE VENDOR SUPPLY-CHAIN RISK

7 | acronis.com

For an SMB a SolarWinds-style software supply-chain attack has to be viewed as an existential threat to the business: violating contracts, gravely harming the company's reputation and client confidence, and public valuation. If an organization cannot be trusted to vet its own suppliers to prevent such an attack, why should any business trust it with sensitive business applications and data?
No company, no matter how sophisticated and deep its security regimen, should get overconfident. Profit-driven cybercriminals are less fearsome: they will move onto a new target if their current one doesn't quickly yield results. By contrast, state actors bring unlimited resources, patience, and hacking expertise to their attacks. Few private businesses could repel an attack with the scale, sophistication, and persistence of the SolarWinds APT.



14 QUESTIONS TO ASSESS YOUR SOFTWARE VENDOR SUPPLY-CHAIN RISK

Nevertheless, there are steps that your business can and must take to minimize the risks of software supply-chain attacks, as well as measures to limit the extent of the damage if an attack succeeds. Many large enterprises and service providers turn to industry frameworks from international standards bodies like ISO/IEC and NIST for help in conducting security assessments. However, these often require dedicated staff experienced at

working with such frameworks to be very effective, and most are oriented toward large enterprises rather than the smaller environment in which an SMB operates. Regardless, they can provide a useful starting point to understand full-fledged security assessment processes and methodologies. See the ADDITIONAL RESOURCES section below for where to find documentation on these frameworks.

To help get started down the path of security assessment in the interest of mitigating software supply-chain attack risk, consider using the following abridged set of questions for key risk areas:

ACCESS TO APPLICATIONS
Who and how access is granted to sensitive data, how access is documented, and what measures are taken to ensure that the infrastructure the data is hosted on is managed and tested for security.

SECURE SOFTWARE DEVELOPMENT
Measures used throughout the software development process, from design through release to customers, to mitigate risks of tampering (malicious code insertion) and other security threats mounted by external or insider actors.

8 | acronis.com



14 QUESTIONS TO ASSESS YOUR SOFTWARE VENDOR SUPPLY-CHAIN RISK

SUPPLY CHAIN

BUSINESS CONTINUITY

COMPLIANCE

CONFIG MANAGEMENT

DATA SECURITY

INCIDENT MANAGEMENT

GRC

SMB

PERSONNEL

ENCRYPTION

VULNERABILITY MANAGEMENT

APP SECURITY

PHYSICAL/DATA CENTER

MOBILE

IAM

PHYSICAL / DATA CENTER SECURITY

Vendor security assessment for software supply-chain risk requires more than just getting documentation. It requires challenging their assertions and demanding proof of key claims. This can include audit trails, proof of training and certification, data center compliance certificates, and even onsite facilities audits.

9 | acronis.com


Application access security
10 | acronis.com

14 QUESTIONS TO ASSESS YOUR SOFTWARE VENDOR SUPPLY-CHAIN RISK
Access control to sensitive applications and data is a critical component of software supply-chain security. A few key questions to ask of suppliers, including multi-tenant service providers, on this score:
Do you restrict, log, and monitor access to your security management systems (e.g., firewalls, vulnerability scanners, network sniffers, APIs, etc.)?
Do you monitor and log privileged access (e.g., administrator level) to security management systems? Have you implemented privileged user management to ensure time-limited, least-privileged access to critical systems?



14 QUESTIONS TO ASSESS YOUR SOFTWARE VENDOR SUPPLY-CHAIN RISK

Do you have policies, procedures, and technical measures in place to ensure appropriate data/assets access management in adherence to legal, statutory, or regulatory compliance requirements?

What controls do you have in place to prevent unauthorized access to our applications and object source code? What analogous controls do you have in place for tenant applications?

What are your procedures and technical measures for data access segmentation in multi-tenant environments?

Do you require a periodic authorization and validation of the entitlements for all system users and admins?

What Authentication, Authorization, and Accountability (AAA) systems do you have in place? What systems do or do not require multi-factor authentication (MFA)? Do you manage and store the identity of all personnel who have access to the IT infrastructure, including their level of access?

Do you support use of, or integration with, existing customer-based Single Sign-On (SSO) solutions to your service? Do you support identity federation standards (e.g., SAML, SPML, WS-Federation, etc.) as a means of authenticating/authorizing users?

11 | acronis.com



14 QUESTIONS TO ASSESS YOUR SOFTWARE VENDOR SUPPLY-CHAIN RISK

Do you have an identity management system (enabling classification of data per tenant) in place to enable both role-based and context-based entitlement to data?

Do you support forced password changes upon first logon?

Do you provide tenants with strong (multi-factor) authentication options (e.g., digital certificates, tokens, biometrics, etc.) for user access?

Do you have mechanisms in place for unlocking accounts that have been locked out (e.g., self-service via email, defined challenge questions, manual unlock)?

Do you support password (e.g., minimum length, age, history, complexity) and account lockout (e.g., lockout threshold, lockout duration) policy enforcement? Do you allow tenants/customers to define password and account lockout policies for their accounts?

Are access to utility programs used to manage virtualized partitions (e.g. shutdown, clone, etc.) appropriately restricted and monitored?

12 | acronis.com


Secure software development
The SolarWinds attack demonstrated that once an attacker has compromised a secure code repository, many traditional security mechanisms you might have in place can be defeated, as such countermeasures assume that a certain OS, application, driver or network element is legitimate and therefore will not act maliciously unless compromised by external, more readily detectable attacks.
Thus, you must vet your key software vendors to ensure that they have implemented a secure software development program as well as mechanisms to defend the product and customer data from modification and other attacks.
13 | acronis.com

14 QUESTIONS TO ASSESS YOUR SOFTWARE VENDOR SUPPLY-CHAIN RISK


KEY QUESTIONS TO ASK YOUR SOFTWARE VENDOR:
14 | acronis.com

14 QUESTIONS TO ASSESS YOUR SOFTWARE VENDOR SUPPLY-CHAIN RISK
Do you train your software architects and engineers as well as IT operations and cybersecurity staff in security awareness and relevant standards for secure code architecture, development, and protection against tampering?
Do you have a multi-level process in place to analyze and review code for vulnerabilities at every stage of development, with reviews conducted independently by internal development teams, sandbox testers, and external auditors?
Have you implemented a decomposed code development process that enables scrutiny of individual software components by random reviewers prior to commitment to the next stage of the development process and subsequent integration?
Do you securely transmit code modules to subsequent development phases, use digital signing of secured binaries prior to a final sandbox review of security and privacy features prior to distribution to external auditors, partners and customers?
How do you protect encrypted customer data against access, modification or copying by your own employees?
Do you employ an independent security team, separate from internal IT operations and cybersecurity staffs, to conduct internal security awareness training, audits of security infrastructure and processes, and enforcement of security policies?


15 | acronis.com

14 QUESTIONS TO ASSESS YOUR SOFTWARE VENDOR SUPPLY-CHAIN RISK
What cybersecurity and physical security standards do you enforce for your data centers? Do you conduct routine audits by independent third-party auditors of high reputation, external penetration testing of network security measures, internal network segmentation, and intrusion detection scanning?
Do you encrypt customer data in transit and at rest in your data storage infrastructure, and conduct stringent erasure and/or destruction of decommissioned storage media?
Do you implement strict confidentiality, business ethics, and code of conduct policies for your employees, including background checks where appropriate, non-disclosure agreements, and principals of segregation of duties, need to know, and least privilege to protect against malicious or inadvertently dangerous acts by insiders?
What access controls, multi-factor authentication, and activity logging do you implement to ensure only appropriate access to sensitive systems?
Do you have a bug bounty program to encourage and reward the disclosure of potential security vulnerabilities in your products?
Do you use hardware-backed storage for private binary encryption keys to ensure that customer keys cannot be exported or leaked?



14 QUESTIONS TO ASSESS YOUR SOFTWARE VENDOR SUPPLY-CHAIN RISK

Summary
The SolarWinds breach provides a useful reminder that modern adversaries, both cybercriminals and hostile state-actors, continue to innovate and evolve in sophistication, guile, and persistence. They are using the same advanced tools in the development of their attacks ­ heuristics, machine learning, artificial intelligence, increased integration and automation ­ as legitimate tech vendors and service providers are using to defend their businesses and customers. It is a battle in which attackers generally have first-mover advantage: it is easier to attack than it is to detect, contain, terminate, and recover from an attack.
Implementing a full-bore ISO/IEC or NIST security framework is often beyond the needs and resources of many organizations, but the philosophy behind them can still useful. They provide a proven vocabulary and methodology for managing cybersecurity risk. By starting with these basic questions, you can start down the path of systematically identifying and mitigating your software supply-chain security risk. A framework-based mindset can help you to identify areas where existing processes can be strengthened and new processes implemented, as well as prioritize your security requirements and set appropriate expectations with your suppliers and partners.

Acronis offers security consulting and auditing services to help you get started.
For more information, see acronis.com/services

16 | acronis.com


Acronis Cyber Protection Solutions certifications and tests
PLEASE NOTE this document is for educational purposes only. It is not legal advice, and you should not treat it as legal advice. The document is provided as-is without representation or warranty of any kind. You should contact an attorney to obtain advice with respect to any particular issue or problem. No defense is impervious to cyberattack and no measures will completely prevent a committed attacker from breaching your defenses.
17 | acronis.com

14 QUESTIONS TO ASSESS YOUR SOFTWARE VENDOR SUPPLY-CHAIN RISK



14 QUESTIONS TO ASSESS YOUR SOFTWARE VENDOR SUPPLY-CHAIN RISK

Additional resources

Many businesses rely on industry frameworks from international standards bodies for guidance on conducting security self-assessments as well as assessments of suppliers and provide a useful starting point. Here are some of the most popular and widely-adopted security frameworks and assessment methodologies:

NIST 800-171 ­ A popular general framework for assessing internal security policies, procedures and personnel:
https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-171r2.pdf
Vendor Security Alliance ­ A detailed vendor security assessment questionnaire:
https://www.vendorsecurityalliance.org/downloadQuestionaire

Center for Internet Security (CIS) Risk Assessment Method (RAM) ­ A good high-level internal security assessment framework:
https://www.cisecurity.org/cybersecurity-tools/
Cloud Security Alliance (CSA) Consensus Assessments Initiative Questionnaire (CAIQ) ­ Tools for assessing security controls in IaaS, PaaS, and SaaS services:
https://cloudsecurityalliance.org/artifacts/consensus-assessmentsinitiative-questionnaire-v3-1/
ISO/IEC 27001 ­ A broadly-adopted set of international standards for internal security management:
https://www.iso.org/isoiec-27001-information-security.html

18 | acronis.com



14 QUESTIONS TO ASSESS YOUR SOFTWARE VENDOR SUPPLY-CHAIN RISK

Additional insights from Acronis

About Acronis

Acronis Blog: Provides the latest updates and insights from the world's cyber protection leader.
Acronis YouTube Channel: Delivers frequent videos of use cases, demos, cyberthreat analysis, and company news.
Acronis Resource Center: The go-to hub for cyber protection white papers, e-books, in-depth articles, tutorials, infographics, etc.
Acronis Events: Ongoing series of events, webinars, interviews, etc., including details on joining.

Acronis unifies data protection and cybersecurity to deliver integrated, automated cyber protection that solves the safety, accessibility, privacy, authenticity, and security (SAPAS) challenges of the modern digital world. With flexible deployment models that fit the demands of service providers and IT professionals, Acronis provides superior cyber protection for data, applications, and systems with innovative next-generation antivirus, backup, disaster recovery, and endpoint protection management solutions. With awardwinning AI-based antimalware and blockchain-based data authentication technologies, Acronis protects any environment ­ from cloud to hybrid to onpremises ­ at a low and predictable cost.
Founded in Singapore in 2003 and incorporated in Switzerland in 2008, Acronis now has more than 1,500 employees in 33 locations in 18 countries. Its solutions are trusted by more than 5.5 million home users and 500,000 companies, including 100% of the Fortune 1000, and top-tier professional sports teams. Acronis products are available through 50,000 partners and service providers in over 150 countries in more than 40 languages.

19 | acronis.com

Learn more at www.acronis.com
Copyright © 2002-2021 Acronis International GmbH. All rights reserved. Acronis and the Acronis logo are trademarks of Acronis International GmbH in the United States and/ or other countries. All other trademarks or registered trademarks are the property of their respective owners. Technical changes and Differences from the illustrations are reserved; errors are excepted. 2021-10

