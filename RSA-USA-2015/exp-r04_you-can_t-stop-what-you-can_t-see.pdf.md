SESSION ID: EXP-RO4
You Can't Stop What You Can't See
Learning from the experiences of others

Jared Myers
Principal Consultant ­ RSA Incident Response RSA, The Security Division of EMC

Grant Geyer
Senior Vice President - Products RSA, The Security Division of EMC

#RSAC

#RSAC
Targeted Attacks
 Targeted against an organization
 Or against a specific vertical
 Researched
 Can leverage new vulnerabilities
 Planned...relatively
 Can have a broad command and control structure
 Established Infrastructure
 Existing resources and assets  Can be resourced for medium term campaigns

APT Key Features

#RSAC

 Highly-targeted

 Tailored to an individual organization
 Well-researched

 Reconnaissance on people and processes
 Well-funded

Targeted Attacks

 Resourced for intensive, long-term attacks
 Designed to evade detection*

 "Low and slow"

APT

 Multiple vectors

 Social engineering, application-layer exploits, malware, and data exfiltration
techniques, etc.

#RSAC
With advances in security why are attacks continuing to be successful?
 Exploiting known vulnerabilities  Targeted phishing  Brute forcing credentials  Misconfigurations
4

Renouncing Obsolete Approaches

8+ Weeks

< 1 Week

#RSAC
28+ Weeks

5

#RSAC
Persistence: Register DLL with IIS
cscript.exe ScriptMaps.vbs -a ".jna,C:\Windows\system32 \inetsrv\maliciousDLL.dll,1,GET,HEAD,POST,TRACE"
 Requests for files with .jna extension handled by DLL
POST /myfile.jna

#RSAC
Persistence: Modify System.Web.dll
 System.Web.dll is an assembly of
namespaces
 Can be decomplied with DotNET Reflector  Contains hundreds of C# scripts
 We've observed actors modifying two
scripts:
 PageHandlerFactory.cs  default_aspx.cs
 Modifications create a "ghost" webshell
 POST to non-existent web pages  Payload contain special marker

#RSAC
Persistence: Ghost WebShell Example

#RSAC
Persistence: Sticky-key Backdoor
 Replace sethc.exe with file such as cmd.exe  Register Debugger for sethc.exe in registry

#RSAC
RDP Redirection
10

#RSAC
What Can We Learn?
 There is No Silver Bullet Control  Pervasive Visibility is Key  Empower Passionate Hunters  Know Your Environment  Use the Right Data (Not Just IOCs)
11

Threat Actors
Firewall IDS/IPS
MAanlitciVioiruuss Traffic
Whitespace

#RSAC
There is No Silver Bullet Control
At first, there were HACKS
Preventative controls filter known attack paths
Successful HACKS

Corporate Assets

Threat Actors
Firewall IDS/IPS
MAanlitciVioiruuss Traffic
More Logs
Whitespace
Corporate Assets

#RSAC
There is No Silver Bullet Control

Blocked

Session

S

Blocked Session

I

Blocked

E

Session

M

Alert

At first, there were HACKS
Preventative controls filter known attack paths
Then, ATTACKS
Despite increased investment in controls, including SIEM

 Relying upon even the most modern controls
provides a false sense of security.
Successful ATTACKS  Automation and Detection Technology
enhances your analyst's effectiveness ­ it
doesn't replace them.

Threat Actors
Firewall IDS/IPS
MAanlitciVioiruuss Traffic
Logs Endpoint VIsibility
Network VIsibility

Blocked Session Blocked Session Blocked Session
Alert
Process
Network Sessions

Corporate Assets

#RSAC
Pervasive Visibility is Key
Now, successful ATTACK CAMPAIGNS target any and all whitespace.
 The key to understanding a sophisticated attack is
being able to put all the pieces of the puzzle together.
 Complete visibility into every process and
network sessions is required to eradicate the attacker opportunity.

#RSAC
Pervasive Visibility
Having the ability to track the attackers movements is key
RDP Traffic

Internal System

Internet Facing
Proxy
15

Malware Traffic

#RSAC
Find Passionate Hunters and Empower Them
 The best analysts are attracted to the
biggest problems.
 Skilled analysts + the right tools + hunting
time = Results.
 In most of the cases, had the victims
been actively hunting they could have drastically decreased their exposure time.
16

#RSAC
Know Your Environment
 Know where your critical assets are.  Mail Servers, Domain Controllers, VPN
Concentrators, Code Repos
 Knowing what normal looks like helps you spot
anomalies.
 Add enhanced visibility around important parts of
your infrastructure.
 Template notorious hacks against your
environment.
17

Know Your Environment
18

#RSAC
VPN

#RSAC
Use the Right Data (Not Just IOCs)
 Threat Intelligence and IOCs have a shelf life.
Make it actionable.
 Regardless of where the attacks originates:
 What type of data they are the hackers
targeting?
 Are there characteristics that are seen
throughout attacks?
 Look for fingerprints of the same attack
throughout your environment.
19

#RSAC
Using the Right Data - Webshell Detection
20

UAE
Country IN

User logs in from UAE for the 1st time. He's always located in India

Device

Device3

User logs in from a new, unrecognized,

Device2 Device1

System learns thdeevuicseer behavior from his historical data

Transmitted Data [MB]

User transmits 1GB, user's average is 68MB

Session Duration [hours]
Many more
Final Score

Sessions duration is 24 hours, user's average is 4 hours
Final score is an aggregation of the feature's scores

#RSAC
Score: 92
Score: 90 Score: 93
Score: 82
Aggregate Score: 98

#RSAC
See Everything. Fear Nothing.
22

#RSAC
Thank you...

