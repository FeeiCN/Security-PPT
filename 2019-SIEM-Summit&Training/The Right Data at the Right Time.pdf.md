The Right Data At the Right Time
@jeffbollinger @matthewvalites

Is there an ideal set of data sources for Security Monitoring & Incident Response?

NETWORK

NETWORK SECURITY MONITORING

IDS DNS Web NetFlow | Firewall Logs Email Remote Access Vulnerability Management

ENDPOINT
Detec%on & Response Agent An%-Virus Authen%ca%on & Access OS Logs

RPeDrseepvtoeennctdt

HOSTED SERVICES
Account Behavior Web App Firewall IaaS Logs Web & App Server Logs Custom App Logs
INFRASTRUCTURE
Authen'ca'on & Access Ac've Directory Mobile Device Management `Data'

Capability Dependencies

Weaponizing Detection

Security Capabilities

Visibility
e.g. Attribution

Control
e.g. Prevention

From Data to Detection

From Data to Detection

From Data to Detection
Play Details

From Data to Detection
Result Details

Data Drivers

Case Study 1
Unique data source cracks the case of the malicious insider

The Alert
Aware employee sees something and says something

The Case
Credential abuse + private documents viewed without authorization

The Investigation
! CSIRT logo
Investigators, exhausting available data, establish a motive but lack a smoking gun

The Breakthrough
A new data source captures forensic endpoint artifacts

Waste not Want not

Case Study 2
Application data identifies hosted service fraud

How It's Supposed To Work
Web conference host schedules a meeting Host distributes unique meeting ID to attendees Attendees connect into meeting with meeting ID on phones and computers

How it Worked

Attackers brute force meeting IDs
Once connected to a meeting, attackers 'invite' long distance attendees to join
Attackers control the receiving toll-generating infrastructure and profit from long distance calls

Fraudster

Telephony Service
Meeting Attendee

Meeting Service

Incident -> Data -> Detection

Case Study 3
Make your own data

Extract ExtensionID and Version number Index=macos name="pack_it-compliance_chrome_extensions"
W rite static and dynamic results to Splunk and a ls o as ign a riskò category to each browser extension.

- Review permissions ( manifest.json file) - Access URLs - Access web requests/response - Proxy settings
- Encoded or obfuscated strings - Trusted update URL (Chrome store) - JSAT https:/ /github.com/EdwardRaff/JSAT - Scan suspect JS F ile (internal scanner) - Start C hrome - Visit, Gmail, O365, Banks site. (AutoIT) - Monitor outbound traffic.

Look for play that have suspicious characteristics, excessive access, suspect outbound connectivity etc...

Case Study 4
Trends in computing require adapting capabilities

Technology Trends

Cloud adoption

Borderless

Containers

A shared responsibility model where nobody is responsible...
https://nakedsecurity.sophos.com/2019/03/25/thousands-of-coders-are-leaving-their-crown-jewels-exposed-on-github/

Technology Trends

Cloud adoption
· Cloud Native · OSquery

Borderless
· MDM · IDM · EDR

Containers
· FluentD · Datadog

Market trends
Constant adaptation

Tying it all together

Recon
· Flows · IPS · Threat Intel · Email Security Services
Weaponize
· Threat intel · Sandboxing
Delivery
· Email Security Services · Web Proxy Services · DNS RPZ · IPS

Kill Chain
C2
· DNS RPZ · IPS · Web Proxy Services · Flows
Installation
· EDR · Sysmon · Event Logs · Authentication
Exploit
· IPS · Firewall · EDR

Persistence
· Event Logs · Sysmon · EDR · DNS RPZ · Authentication

Initial Access
· Flows · IPS · Threat Intel · EDR · System Logs
Execution
· EDR · IPS · Firewall
Persistence
· Event Logs · Sysmon · EDR · DNS RPZ · Authentication
Privilege Escalation
·Event Logs ·Sysmon ·EDR ·Authentication Logs

ATT&CK
Discovery
·DLP ·System Logs ·Flows ·Authentication Logs
Lateral Movement
·Event Logs ·Sysmon ·EDR
Credential Access
·Authentication Logs ·System Logs

C2
·DNS RPZ ·IPS ·Web Proxy Services ·Flows
Exfiltration
·Flows ·Deception/Canary Tokens ·IPS
Impact · Too late

Defense Evasion
·EDR ·Sysmon ·Event Logs ·Deception/Canary Tokens

"The observation that attack phases can be bypassed affects defensive strategies fundamentally, as an attacker may also bypass the security controls that apply to that phase in doing so. Instead of focusing on thwarting attacks at the earliest point in time, layered defense strategies that focus on phases that are vital for the attack path or that occur with a higher frequency are thus expected to be more successful."
https://www.csacademy.nl/images/scripties/2018/Paul_Pols_-_The_Unified_Kill_Chain_1.pdf

Coloring With Data

Enhance!

Questions?

