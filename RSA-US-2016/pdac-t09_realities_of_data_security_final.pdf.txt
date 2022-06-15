SESSION ID: PDAC-T09
Realities of Data Security
#RSAC

Scott Carlson
Director ­ Security Solutions PayPal @relaxed137

#RSAC
The Data Problem
2

#RSAC
Why should we trust anyone with our Data?
3

#RSAC

People actually need data to do their job

Email Marketing Customer Support Business Analytics Financial Analyst Cross Marketing

Software Developer Network Operations Security Operations HR / Payroll Fraud Control

4

#RSAC
5

#RSAC
The People Problem
"Think of how stupid the average person is, and realize half of them are stupider than that."
-- George Carlin
6

#RSAC
http://xkcd.com used with permission under Creative commons License
7

#RSAC
So Now What ?? You don't just have a Data problem, you have an Everything
problem.... The reality is... you can't just worry about the data...
8

#RSAC
Its not just about the Data

Find It Secure It Monitor It

Data repositories with restricted/PII data Business work flows & data flows Identify owners, does data leave your network
Delete or move into a secure network zone Encrypt data when it is found insecure Create access rights controls & fix bad process
Ongoing monitoring with $tool ­ users & systems Data scanning tools for compliance Inbound/outbound flow monitoring kill data streams & wall of shame

9

#RSAC
Find It

Ask
Hey, where is our data? Where did this come from? Where is it going? Where Else could It be ? Are you caching anything ? How many copies are there? Has anyone taken it home? Did anyone stick it "in the cloud"

Validate
Buy Stuff or Build Stuff
Data tools haven't caught up with data systems
You cannot find everything with Tagging, sometimes you have to sniff it out
Don't forget your logging systems, file shares, and desktops
To sample or not to sample

10

#RSAC
Secure It
Zones
Build network zones in the right places to house the data where it needed Separate employee zones from customer zones from analytics zones If zones exist, uplift controls to match your new standard Build a common Bill of materials & definition of "Run the business"
Encrypt
Deploy Hardware Security Modules (HSM) where required Make sure your tools can decrypt where appropriate Keys should be as unique as you need them to be once you encrypt the data, make sure that the data entry point is encrypted too
11

#RSAC
Monitor It
Logging
Build use cases "Log all activity from DBA's and watch for select from application tables"
Log All the Things; keystroke log if required positive & negative testing required for tools tap, syslog, integrated, custom, modules, ...
In-Line Detection
decrypt data if required deploy at all ingress and egress points that matter tap, DLP, proxies, email, ...
12

#RSAC
Multi-Layer Trust Model

User Zone
Network Desktop Applications

Access Zone
Bastion Host Citrix Portal

Data Center Zone
Server Data Repository Data Application

13

#RSAC
Controls required around Data

Centralized Logging Vulnerability Scanning Intrusion Detection Patching Updates Web Proxy Anti-Malware Time Synchronization

N, H, A N, H, A N N, H, A N N, H N

Data Loss Prevention Firewalls Role-Based Access VDI / Citrix / Bastion Packet Capture File Integrity Configuration Control

N=Network H=Host A=Application

N N N, H, A N N H H

14

#RSAC
Risks of Direct Data Controls
No one can use the data if its always encrypted Tagging Data on Content? Good luck with that Tagging Data with Users? Easier, but still DLP is only as good as your Regex foo Be ready to customize for NoSQL Solutions Vendors design for "most common".. Know anyone like that ?
15

#RSAC
Monitor the human too
16

#RSAC
Threat Behavior Buckets

Never Anyone ·No one should EVER do this (Always Prohibit) ·No machine should EVER do this

Never This (Point Prohibit)

·This type of person should never do ·This type of machine should never do ·This type of data should never go

Never Seen

· (Source Location)+(Source Machine)+ (Source Person)+(Target)+(Action)

(Watch and React) ·One of these items is irregular

17

#RSAC
Don't say NO Say HOW
18

#RSAC
Data Security is not a permanent state
19

#RSAC
Data Security can not work effectively unless you have agility
(there's nothing static about data)
20

#RSAC
Pulling it all off
Build technical and business standards related to use of data and control of data - "The Law" Build technical standards related to the controls expected of secure, restricted zones & related to the encryption / access to data ­ "The How" Find restricted data throughout the company, and scan for locations that should have NO data Identify method to protect the data once found ­ delete / relocate / protect / encrypt & execute Implement technical controls at the endpoint and network and repository Apply continuous monitoring controls to data & people
Build solutions and processes that outlast the people building them
21

#RSAC
For more information, please contact: Scott Carlson sccarlson@paypal.com @relaxed137

