SESSION ID: CSV-T09
Security at the Speed of DevOps

Steve Martino
SVP, Chief Information Security Officer Cisco

Sujata Ramamoorthy
Sr. Director, Information Security Cisco

#RSAC

Our Move to Embed Security in DevOps

#RSAC
DevOps Practices Paired with Cloud Adoption
Endless Possibilities:
DevOps can create an endless loop of release and feedback for all code and deployment targets
3

#RSAC
Success Criteria

Adoption

Fewer Incidents

Time to Visibility

Time to Value
4

Operational Change

#RSAC
How Do We Drive DevSecOps?

Agile Security
(Hackathons)

Automate Security
(Security as Code)

Continuous Validation
(Continuous Security Buddy)
6

#RSAC
What's a Security Hackathon?

You may think it's this:

It's more like this:

7

Hackathon Goals
Complete and publish top security guardrails
for AWS
8

#RSAC
Pre-Work Planning
· Identify top security use cases in AWS · Team member assignment
Event Logistics
· Run in sprints · Sprint readout · Peer reviews · Definition of Done (DOD) · Document Findings
Retrospective
· What worked / Didn't work · Improvements · Next steps

#RSAC
Security Guardrails for Cisco AWS Accounts
9

Visual Walk-Through

#RSAC
Manual Account Provisioning

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC
Manual CSB Install

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

Manual CSB Installation

File

CF Stack Name

1

csb.yaml

InfosecAuditorRole

2

CSIRT_role.json

3

password_policy.yaml

InfosecCSIRTRole IAMPasswordRole

4

saml_provider.yaml

CiscoSSOSAMLProvider

5

saml_roles.yaml

CiscoSSOSAMLRoles

6

vuln_mgmt_scanner

CiscoScanner

#RSAC
AWS Resource Modified/Created
Lambda Role Auditor Role Cisco Security Incident Response Role Password Policy Identity Provider
Lambda Role
admin role devops role
Lambda Role
Cross Account Role

#RSAC
Automated Provisioning

#RSAC

#RSAC

#RSAC

#RSAC

Demo User Demo_user@cisco.com Demo_user (425) 555-1212
1234567 Security Business Group random
Demo_user@cisco.com

#RSAC

Demo User Demo_user@cisco.com Demo_user (425) 555-1212
1234567 Security Business Group random
Demo_user@cisco.com

#RSAC

#RSAC

#RSAC
Reporting Baseline

Daily Reporting

#RSAC

Overall Risk Score: A B C D F

Security Metrics
Section
1. Identity and Access Management 2. Network Security 3. Storage (S3 buckets) 4. Tagging 5. External Vulnerabilities 6. CIS AWS Benchmarks 7. Trusted Advisor Checks

Section Score
- 85/100 - 90/100 - 90/100 - 0/100 - 100/100 - 90/100 - Not Scored

#RSAC
IAM Changes

#RSAC
SSO Insertion

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC
Tagging Example

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC
Report Post-Remediation

Daily Reporting

#RSAC

Overall Risk Score: A B C D F

Security Metrics
Section
1. Identity and Access Management 2. Network Security 3. Storage (S3 buckets) 4. Tagging 5. External Vulnerabilities 6. CIS AWS Benchmarks 7. Trusted Advisor Checks

Section Score
- 100/100 - 90/100 - 100/100 - 90/100 - 100/100 - 100/100 - Not Scored

#RSAC
Benefits of CSIRT Integration with CSB
· Enables CSIRT monitoring for each tenant at the:
· IaaS/platform level · NetFlow/VPC Flow level · VM/OS level
· Daily CSB reports encourage tenants to improve their scores, reduce their risk of compromise
· When security incidents do occur, CSB provides CSIRT with:
· Ability to track down owners of Cisco's cloud tenants quickly
· Quick view into known tenant security gaps · Investigator capability in tenant environment · Simplifies incident reporting automation
· MTTD improved by automated play runs and case creation
· MTTC improved by automated tenant attribution

#RSAC
Good Security Posture Requires Continuous Security Monitoring

· March/April 2018: Tenant installs CSB, CSB reports many security best practice violations
· April 2018: Tenant has a case for EC2 instances compromised
· May 2018: Bad security behavior continues, tenant has another case for EC2 instance compromised
· June 2018: Some improvement in security posture but not enough; another EC2 instance pwned
· July-Present: Up and down case trend continues, tenant still needs work on security posture

XaaS Offering ABC With 11 AWS Accounts

DevSecOps: Results

Delivered Continuous Security Buddy (CSB)

Automate controls and security validation in Operating Environments

Automate controls
and security validation in CICD pipelines

61

#RSAC
Speed: Consistently Implementing Security in Cloud Tenants 3 Weeks -> 4 hours
Scale: Adoption Rate Offers with CSB
35% at 3 months 72% in 9 months 89% <12 months
Value: Issues Identified and Remediated via Automation 97% of Cisco Cloud Service Offerings
have on average `A' or `B' Security Report Grade

Cultural Effect

Operating as a Product Team

Product Owner
Empathy for Users, Make Security
Easy and Valuable

Engineering
Software Releases, DevSecOps
63

#RSAC
TME
Adoption, Marketing, Bootcamps

#RSAC
Better Together

Collaboration with Engineering Business Units
"I easily saved 40 hours during each CATO project associated to defining what was wrong and how to fix it. This along with internal lessons learned is what enabled me to shave a full month off the second CATO effort."
~ Software Engineer

InfoSec Operations Effectiveness
"CSB was instrumental in investigating a customer-impacting incident. Had the team done one of the top 3 CSB findings, the incident could have been avoided."
~ CSIRT Manager

64

#RSAC
Success Criteria

Adoption

Fewer Incidents

Time to Visibility

Time to Value
65

Next Steps

#RSAC
Progress
Rinse and repeat with other cloud platforms Move up the stack Integrating in to CI/CD pipelines Programmable Network access policies based on Posture Infosec DevSecOps team as Customer Zero
67

Lessons Learned

#RSAC
Key Takeaways
Start on this journey... don't wait! Everything is code Collaborative Approach: Dev + Sec + Ops Only way to achieve speed and scale Get a win and keep going
69

#RSAC
Learn More
DevSecOps: Win-Win for All
https://blogs.cisco.com/security/devsecops-win-win-for-all
DevSecOps: Security at the Speed of Business
https://blogs.cisco.com/security/devsecops-security-at-the-speed-of-business
DevSecOps: Automation for Assurance
https://blogs.cisco.com/security/devsecops-automation-for-assurance
DevSecOps: Lessons Learned
https://blogs.cisco.com/security/devsecops-lessons-learned
70

#RSAC
Apply What You Have Learned Today
Next week:
­ Identify where to start your DevSecOps Practice
Within 3 months:
­ Prioritize use-cases and hold a Hackathon ­ Publish Security Guardrails
Within 6 months:
­ Automate few of the Guardrails (MVP) ­ Embed automation in the appropriate systems to drive adoption ­ Start a feedback loop with users and iterate
71

Thank you!

@CiscoSecurity trust.cisco.com

