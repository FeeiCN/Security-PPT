SESSION ID: IDY-W10
No More Firewalls! How Zero Trust Networks are Reshaping Cyber Security

Matt Soseman
Security Architect Microsoft @SosemanMatt http://aka.ms/MattsBlog

#RSAC

#RSAC
Session Objectives
Understand what Zero Trust is and why it is important. Understand how identity, device health and trustworthiness contribute to overall security posture. Learn considerations for automated access to resources via device and identity conditions. Discover how to apply these conditions to line of business SaaS apps or on-premises web apps.
2

The challenge with perimeter-based networks...

#RSAC
It was a walled garden (castle/moat approach)
Perimeter-based networks operate on the assumption that all systems (and users) within a network can be trusted.
Not able to accommodate modern work styles such as Bring Your Own Device (BYOD) and Bring Your Own Cloud (BYOC)
Attacker can compromise single endpoint within trusted boundary and quickly expand foothold across entire network.
4

#RSAC
Users cannot be trusted! (Neither can the network!)

4%
Of end-users will click on anything¹

28%
of attacks involved inside actors¹

17%
Of breaches had errors as casual events¹

5
https://enterprise.verizon.com/resources/reports/dbir/

Zero Trust to the rescue!

#RSAC
What is a Zero Trust network?
Eliminates the concept of trust based on network location within a perimeter.
Leverages device and user trust claims to gate access to data and resources.

#RSAC
What comprises a Zero Trust network?
Identity provider to keep track of users and user-related information. Device directory to maintain a list of devices that have access to corporate resources, along with their corresponding device information (e.g., type of device, integrity etc.) Policy evaluation service to determine if a user or device conforms to the policy set forth by security admins Access proxy that utilizes the above signals to grant or deny access to an organizational resource Anomaly detection and machine learning
8

#RSAC
Example: Basic components of a Zero Trust network model
9

#RSAC
Benefits of a Zero Trust model
Allow conditional access to certain resources while restricting access to high-value resources on managed/compliant devices. Prevent network access and lateral movement using stolen credentials and compromised device. Enables users to be more productive by working however they want, where they want, when they want.
10

Designing a Zero Trust architecture

#RSAC
Approach: Start with asking questions
Who are your users? What apps are they trying to access? How are they doing it? Why are they doing it that way?
What conditions are required to access a corporate resource?
What controls are required based on the condition?
12

#RSAC
Consider an approach based on set of conditions
What is the user's role and group membership?
What is the device health and compliance state?
What is the SaaS, on-prem or mobile app being accessed?
What is the user's physical location?
What is the time of sign-in?
What is the sign-in risk of the user's identity? (i.e. probability it isn't authorized by the identity owner)
What is the user risk? (i.e. probability a bad actor has compromised the account?
13

#RSAC
Followed by a set of controls (if/then statement)
Allow/deny access Require MFA Force password reset Control session access to the app (i.e. allow read but not download, etc)
14

Zero Trust based on conditional access controls #RSAC
15

Device Health Conditions
Determine the machine risk level (i.e. is it compromised by malware, Pass-the-Hash (PtH), etc)
Determine the system integrity and posture (i.e. hardware-rooted boottime and runtime checks)
Integrity checks: ­ Drivers ­ Kernel ­ Firmware ­ Peripheral firmware ­ Antimalware driver code
Verify boot state of machine
Compliance policy checks (i.e. is an OS security setting missing/not configured?)

Integrity at system start-up
Integrity as system is running
Validate integrity as OS is
running

#RSAC

16

#RSAC
Identity Conditions
What is the user's risk level? Is the sign in coming from:
­ A known botnet IP address? ­ An anonymous IP address? ­ Unauthorized browser? (i.e. Tor) ­ An unfamiliar location? ­ Impossible travel to atypical locations?
Is the sign in suspicious?
­ High number of failed attempts across multiple accounts over a short period of time ­ Matches traffic patterns of IP addresses used by attackers
Are the user's credentials (username/password pair) leaked?
­ Up for sale on the dark web / black sites
17

Example Zero Trust Architectures

#RSAC
Example Zero Trust architecture using conditional access
19

#RSAC
Operations in a Zero Trust model
Automatic gating to applications is key. Automatic remediation based on device health (not rely on user intervention). Monitoring for policy violations (signal from the noise). Prioritizing alerts correlated with sensitive data access. Reporting on state of Identity, Device, SaaS app and data.
23

#RSAC
Making it real with demos
Demonstrate how a Zero Trust model behaves in the real world using key scenarios Tying the key Zero Trust components together with conditional access policies See example reports of policy violations Understand the user experience in a Zero Trust model
Download this deck and these click thru demos! http://aka.ms/ZeroTrustDemos
24

Demo
Challenge with Multi-Factor Authentication, w/ Apple Watch and Terms of Use to an app when using a non-managed device

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

Demo
Require device is managed and compliant to access corporate resources

#RSAC
34

#RSAC
35

#RSAC
36

#RSAC
37

#RSAC
38

Demo
Limiting and auditing session access from a non-managed device (i.e. prevent download from app or apply DLP to downloaded files)

#RSAC
40

#RSAC
41

#RSAC
42

#RSAC
43

#RSAC
44

#RSAC
45

#RSAC
46

#RSAC
47

Demo
Govern data access on unmanaged device by protecting data in the managed app

#RSAC
49

#RSAC
50

#RSAC
51

#RSAC
52

#RSAC
53

#RSAC
54

#RSAC
55

#RSAC
56

#RSAC
57

#RSAC
58

#RSAC
59

#RSAC
60

#RSAC
61

#RSAC
62

Demo
Deny access to applications when device "jailbroken" or "rooted"

#RSAC
64

#RSAC
65

#RSAC
66

#RSAC
67

#RSAC
68

#RSAC
69

Demo
Deny access to applications when device is not compliant (i.e. a policy is violated or a threat exists)

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

Demo
Denying access to an app using an unauthorized app or anonymous IP address

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

Zero Trust based on conditional access controls #RSAC
82

#RSAC
Key Takeaways
Networks that fail to evolve from traditional defenses are vulnerable to breaches. We must assume breach. Zero Trust can enable new business outcomes that were not possible before. Technology has evolved to now make these scenarios possible, and you may already own it. Consider an "if-this-then-that" automated approach to Zero Trust. Identity is everything, make it the control plane.
83

Apply what you have learned today

#RSAC

Understand what Zero Trust solutions o you already own?

Develop a Zero Trust Strategy for your Org

Implement a Zero Trust Proof
of Concept / Pilot

84

Apply what you have learned today ­ detailed view

#RSAC

(take a photo of this slide!)

Next week you should: ­ Download this deck. ­ Understand what "zero trust controls" your identity solution provides. ­ Discover what products in your environment can integrate with your identity solution to help you create a zero trust story for your organization. (i.e.
firewall, VPN, MDM, EDR, DLP, etc)
In the first three months following this presentation you should: ­ Build a persona profile (set of conditions) required for your end users with an understanding of who they are, where they are going, and what they want.
o i.e. The state of the identity (verified or compromised), what types of devices they are using, from which locations, and to what applications. ­ Identify what controls are required to respond to those specific conditions
o i.e. If accessing an app (e.g. SharePoint or G-Suite) from an untrusted device, do I need to challenge with multi-factor authentication? Or require to first enroll the device into MDM/Domain then allow access? If the identity is compromised and credentials in public, block access.
Within six months to one year you should: ­ Identify two "zero trust" controls from above to conduct a production proof of concept. Develop a test plan to effectively test controls. Gather datapoints
and effectiveness of policies. Fine tune if needed. ­ Consider a limited production pilot with group of "friendlies" (business users). Study their behavior, gather feedback/datapoints, and understand if/how
the policies impact their productivity. Fine tune if needed. ­ Develop an architecture and project plan to roll out those two controls out to the organization with a roadmap of future controls. Become a rockstar.
85

