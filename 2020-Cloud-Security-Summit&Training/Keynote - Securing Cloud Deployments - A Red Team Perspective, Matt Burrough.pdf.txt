SECURING CLOUD DEPLOYMENTS
A Red Team Perspective

About Matt
 Senior Red Team Lead ­ Microsoft  Author: Pentesting Azure Applications  GPEN, GWAPT, SEC545, CCSK, ...
 @mattburrough linkedin.com/in/mburrough
2

RED TEAM 101
A Quick Review/Primer
3

What is Red Teaming?
Offensive Security Research Model Real World Attacks  Objective-Oriented Complementary to other security controls (code reviews, SDL, auditing)
4

Vulnerability Assessment

Penetration Test

Red Team Engagement

5

Red Team Goals
Make the Blue Team Better Find Flaws Before Attackers Do Prove Threats have Real World Impact
6

How Does Red Teaming Change in the Cloud?
Permission, Authorization Scope/Rules of Engagement
 Shared Resources  Services, Infrastructure, Metastructure  Limits on tools?
 Reporting
7

FREQUENT FINDINGS
8

Lift and Shift Gone Wrong
Controls that used to be sufficient aren't anymore Miss out on Cloud-First benefits like scaling Taking for granted previous controls, like patching, monitoring, security policies?
9

Improperly Configured Storage
Did you mean to leave that blob open to the world? Doing key management properly? Accounts and permissions probably not what you're used to... Encryption at rest? In transit? Data retention? Just because you can doesn't mean you should.
10

Secrets in Source
Code, Configs are moving to the cloud, too. Accessing Cloud APIs means developers may be putting more secrets into code. Are unredacted secrets exposed? Encoding isn't Encryption Attackers can now find them at scale.
12

14

Insecure Network Settings
Excessively permissive firewall rules Management ports exposed to the Internet Firewall exceptions for home IPs
15

16

Social Engineering
Phishing for users', administrators' credentials Brand Impersonation Improper service cleanup/deprovisioning (Ips, DNS, service names) can let an attacker claim them
17

Confusing Authentication for Authorization
Just because someone has an account doesn't mean they belong here... Determining a user's role through user-controlled fields. This applies to other identity fields as well.
18

Gray Clouds
Are security standards/policies followed? Security monitoring? Compliant for regulatory compliance? Using an unapproved vendor?
19

STOPPING A RED TEAMER
and attackers, too!
20

Monitoring
The best offense is a good defense (who are keeping a close watch on the offense). Not just see, but act. Need visibility across the whole graph. Alerting on a single pane of glass.
21

Multifactor Authentication
Much harder to steal, guess, brute force... Not impossible, but attackers like low hanging fruit. Make sure you're using across all services. Better yet...
22

Use a Unified Identity Solution
 In the cloud, Identity is the new Network Edge  Single Sign On eliminates a patchwork of user accounts and password policies  Makes provisioning and deprovisioning simpler, consistent  Central source of logging, monitoring  Security features like Conditional Access
23

Administrator Account Hygiene
Just Enough Admin Just In Time Access Alternate Accounts Privileged Access Workstations Password Diversification
24

Exercise Zero Trust
Assume Breach How much has your network changed in 3 months? Defense in Depth
25

User Education
Regular security training for all users Emphasize importance of unique passwords, MFA Provide phishing simulation exercises It's okay to make a mistake, but report it!
26

THANK YOU!

