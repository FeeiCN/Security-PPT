Implementing Critical Cybersecurity Controls in a DevOps Environment
Steven Sim , Vice President (ISACA Singapore Chapter)
15 Jul 2020
Disclaimer: The views and opinions expressed in this presentation are those of the author and do not necessarily reflect the official policy or position of any organization.

Backdrop ­ New Cybersecurity Normal
· All organisations that have a cyber footprint can be breached · Not a matter of IF but WHEN incidents would happen? · Either you KNOW you are breached or you don't? · How can we better prepare ourselves against the INEVITABLE?

Backyard - DevOps and Cloud
· Benefits
· Deliver applications and services at high velocity · Evolve and Improve products at a faster pace · Improve trust between development and operations teams
· Cloud Adoption
· For ability and flexibility, cloud integration allows resources to be de-focused · Rely on Infrastructure as Service (IaaS) or Platform as a Service (PaaS) · More common for public or virtual private cloud to be used.

"Infrastructure as Code"
· Configuration of servers can be run as code · Can be versioned and tested · Assure repeated configurations · Eliminates issue of code that works fine in staging failing in production · Continuous Integration / Continuous Delivery or Deployment: Jenkin, Dockers · Configuration Management: Chef, Puppet, Saltstack, Ansible, Terraform, etc · Containerisation and Microservices: Kubernetes, etc

Key Security Concerns
· Automation is means to repeat human errors with rigor in a consistent manner. · Cloud reduces control and visibility at hardware and network · Faulty spin-ups may leave a virtual machine in unstable state · Lack segregation of duties between DEVeloper and OPerator · How do we know developers adhered to secure development standards? · Multiple images of varying security may be running? · How quickly will patches be released when a security flaw is found?

What is your Cyber Security and Risk Culture?

DevSecOps & Security Responsibility
"The simple premise of DevSecOps is that everyone in the software development life cycle is responsible for security, in essence bringing operations and development together with security functions. DevSecOps aims to embed security in every part of the development process. It is about trying to automate core security tasks by embedding security controls and processes early in the DevOps workflow (rather than being bolted on at the end). For example, this could be the case when migrating to microservices, building out a CI/CD pipeline, compliance automation or simply testing cloud infrastructure."
­ CSO Online

DevSecOps & Security Responsibility
"DevOps is accomplished through automation and technology, but culturally it depends on creating the three Cs--collaboration, communication and cohesiveness--between development and operations. "
­ ISACA

Governance underscores the Ability to Future-proof against Threats
1

Adopt IT Risk Management Framework

2

3

4

5

6

Physical

Security

Security Awareness

Change Mgmt

Incident Mgmt

IT

Network Security

Perform Threat Modelling Adopt Key Principles

Adopt Cybersecurity Framework

Vuln Mgmt

Account Mgmt

Security Hardening

Determine Key Security Controls

Determine Architecture

Doing the right things

Doing the things right

1
Adopt IT Risk Management Framework
Key points · Business-operation-IT risk alignment · Risk optimization is key to risk management · Risk owner is accountable

Risk of Adoption vs Risk of Non-adoption
Risk of non-adoption · Risk of decreased competitive advantage · Practitioner opportunity cost · Shadow adoption http://www.isaca.org/Knowledge-Center/Research/Documents/DevOpsPractitioner-Considerations_whp_Eng_0815.pdf

2
Perform Threat Modelling

3
Adopt Key Principles ­ "Security as Code"

Microsoft

1. Tender Specs (Firewall, VPN, Common Criteria, etc) 2. Product allows Vulnerability to be Managed 3. Layered Defense Architecture 4. Architecture Security Review
1. Security Standards 2. Server Hardening i.e. Disable Unnecessary Services 3. Network-based Firewall 4. Pre-deployment Vulnerability Assessment &
Penetration Testing
1. Regular Vulnerability Scan 2. Regular Vulnerability alert Monitoring 3. Timely Vulnerability Remediation/Patching 4. Continuous Audit and Monitoring

1. Security Training and Awareness 2. Security Advisories to Custodians 3. Phishing Simulation Exercise 4. Extension to Supply Chain

ISACA

Privacy-by-Design (integrated with Security-by-Design)
· Data as the new oil · Adopt a data-centric
approach
ISACA

4
Adopt Cyber Security Framework (1)
COBIT

ISACA

ISACA

Adopt Cyber Security Framework (2)
DevOps Maturity Model
"Enterprises that use CMMI or COBIT 5 can align their DevOps approach to gain value and apply adaptive approaches to address challenges. By adapting robust governance and maturity practices from frameworks like CMMI and COBIT while maintaining a flexible approach to interpreting requirements from those frameworks, enterprises can realize the benefits of DevOps and still maintain a robust and mature approach."
-- ISACA

Adopt Cyber Security Framework (3)
Third-party Attestations
1. Multi-Tiered Cloud Services 2. Cyber Security Alliance Cloud 3. Control Matrix ­ CSA STAR 4. Common Criteria 5. CREST 6. MITRE Pre-ATT&CK Framework 7. ABS Guidelines · OSPA (Outsource Service Provider
Assessment) · PTG (Penetration Testing Guideline) · RTAASEG (Red Team Adversarial
Attack Simulation Exercises Guidelines)

Key Cloud Security Considerations
Pre-deployment Key Controls: Some Examples

1. Asset Criticality and Sensitivity Identification.
2. Roles and Responsibilities for each Key Control.
3. Architecture Security Review and Approval Process.

Threat Lack of adoption of complying standards External (Internet) Threats

Insider Threats

Off-premise should NOT be worse off than on-premise unless the increased risk is deemed acceptable

Lack of independent audit assessment Account Breach
Distributed Denial-of-Service (unavailability) Web Defacement (reputation loss) Data Leakage (reputation loss, customer loss)

Controls IT security standards compliance Vulnerability remediation process 2-layer Firewall Network-based Intrusion Detection System 24x7 Monitoring System hardening Vulnerability scanning Penetration testing Vulnerability advisory tracking Component management Intranet and Secure remote access Host-based Intrusion Detection System Security review portal Account management Audit management 2FA deployment Admin portal access Anti-DDoS protection Web defacement monitoring/recovery Data encryption

Delayed Incident Containment and Remediation

Incident management process and drills

Cloud Security Key Considerations

Maintenance phase key controls: Some Examples

Threat

Controls

Lapse in

Change management controls are put in place.

controls and Regular checkpoint meetings to obtain evidence of monthly reviews.

oversight

Obtaining regular independent audit and penetration testing reports.

Obtaining evidence of regular review of accesses.

Obtaining evidence of regular review of security checklists and setups.

5

Determine Key Security Controls
Vulnerability Management
PATCHING is NOT the only means to FIX a VULNERABILITY

Security Awareness

Physical Security

Change Mgmt

Incident Mgmt

IT

Network

Security

Different ways of fixing a vulnerability

· Disable unnecessary services

· Network-based firewall

· Host-based firewall

· Hardening the configuration

· Virtual Patching · Patching

Systems / Services

Vuln Remediation Timeline · Risk-based
Exploit Public Availability · Attack Surface Exposure
Peace Time vs Heightened

Internet / Extranetfacing
Intranet-facing

Vuln Mgmt

Account Mgmt

Security Hardening

Vulnerability Severity
Critical / High Medium Low
Critical / High Medium Low

Exploitable remotely
from Internet / Building

Exploitabl e remotely
from Gateway /
Clients

Exploitable only
locally on host

Determine Key Security Controls (5)
Incident Management
Optiv IR Org Model

Security Awareness

Physical Security

Change Mgmt

Incident Mgmt

IT

Network

Security

Vuln Mgmt

Account Mgmt

Security Hardening

Key Areas of Consideration
· Baselining · Black Swans · Business continuity · Recovery Order · Alternate Comms

Active Cyber Defense Strategy
SANS

6
Determine Architecture
An architect needs to optimize the solution architecture based upon business needs, operational risk, security and regulatory requirements. Residual risks (operational, regulatory or security) needs to be approved by risk owner.

TOGAF

Baking Security into DevOps
· Continuous integration with automation allows better integration with security tools such as secure code review tools
· Configuration management allow secure configuration (e.g. via SCAP Security Control Automation Protocol) to be enforced, including standards on logging, alerting and security metrics.
· Containers allow isolation of applications, particularly in multi-tenant environments. Tools available to scan Docker images.
· CIS Benchmarks available for deploying pre-hardened cloud images such as Docker security benchmark https://github.com/docker/docker-benchsecurity
· Cloud provider portals and APIs provide independent verification of automated inventory
· Asset tracking and scanning via security providers e.g. Qualys · Updates to "infrastructure as code" security configuration should trigger
automated application scans or SCAP checks.

TOGAF

Baking Security into DevOps

SANS

Baking Security into DevOps
IBM Reference Architecture for DevOps
· Deployment strategies · Blue-Green deployments or A-B
testing allows gradual rollout and immediate feedback e.g. scans are part of deployment provide verification. · Variant of this deployment is to roll out newly patched image files in new VMs by scaling the system up with them and then removing the older, un-patched systems when scaling down.

What it really means to the DevOps Practitioner
· Not always guaranteed that development, operations or QA personnel will be focused on ensuring compliance with these requirements.
· SAST / DAST require application code to be extant to operate so deployment need to be modified to fit DevOps approach.
· DevOps can mean a fully automated runway to production, results need to be properly are captured and fedback into development processes.
· Segregation of duties and change control can adopt a mostly "detection" form i.e. Developer's access may be severely restricted and tightly controlled and perhaps change control logs are created and tied to that change so that every adjustment is auditable.

Conclusion ­ Internalise DevSecOps
Security--Security-relevant configuration changes can be made quicker with use of automated configuration management. the configuration change required to support closing that service could utilize automation features to remediate the issue in the same manner as those made to support new application code.
Assurance--Automated configuration systems often retain a record of when configuration changes are made, by whom and for what purpose. This information might be challenging to gather in an environment that is primarily driven by manual processes. Automated systems can be used to gather evidence about configuration to help streamline the audit process in a way that has reliability advantages over a manual approach. ·
Governance--Collecting reliable metrics about processes is often facilitated by using automated approaches. These metrics can support the performance management aspects of governance activities. Likewise, policy enforcement goals can be advanced through the use of technical means to enforce those policies.
http://www.isaca.org/Knowledge-Center/Research/Documents/DevOps-Practitioner-Considerations_whp_Eng_0815.pdf

Where can I find more on DevOps Security and Governance?
· DevOps Process Maturity By Example http://www.isaca.org/Knowledge-Center/Research/Documents/Devops-Process-MaturityBy-Example_res_eng_1117.pdf
· DevOps Practitioner Considerations http://www.isaca.org/Knowledge-Center/Research/Documents/DevOps-PractitionerConsiderations_whp_Eng_0815.pdf
· Continuous Security ­ Implementing the Critical Controls in a Dev Ops Environment https://www.sans.org/reading-room/whitepapers/critical/paper/36552

ISACA

Global Presence Certifications

7/11/2020

® 2018 ISACA. All Rights Reserved.

30

ISACA SINGAPORE
Local Context Certifications

~2,500 Members
1,400+ ~650 ~400 100+

7/11/2020

® 2018 ISACA. All Rights Reserved.

31

5 Oct

Only way to keep up with rising threats is to keep finding weaknesses in our own ideas

