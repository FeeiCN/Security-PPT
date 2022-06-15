SESSION ID: CRWD-01
Active Response: Automated Risk Reduction or Manual Action?
sec ops | dream

Monzy Merza
Chief Security Evangelist Splunk
@monzymerza

#RSAC

#RSAC
Agenda
 Active Response Drivers  Facets of Active Response  Balancing Business Risk and Active Response  Required Capabilities

Presenter's Company

Logo ­ replace on

master slide

2

#RSAC
Sources of Cyber Risk

Cyber Criminals

Malicious Insiders

Nation States

Presenter's Company

Logo ­ replace on

master slide

3

#RSAC
Active Response Drivers
 Constant, Simultaneous Attacks  Triaging and False Positives  Time to Response  Human Resource Constraints

Presenter's Company

Logo ­ replace on

master slide

4

#RSAC
HUMAN TIME RESPONSE IS UNTENABLE

Presenter's Company

Logo ­ replace on

master slide

5

#RSAC
Human-Enabling Active Reponse

101111101010010001000001 111011111011011111010100 100010000011110111110101 001

101111101010010001000001 111011111011011111010100 100010000011110111110101 001

Risk Based

Connecting Data and People

Context &
Intelligence

Presenter's Company

Logo ­ replace on

master slide

6

#RSAC
Facets of Active Response
 Transparency and human enablement is core to risk based active response

Presenter's Company

Logo ­ replace on

master slide

7

#RSAC
Conventional Active Response
 Block and tackle
 Config changes on endpoints, network or gateways  Policy changes on access/auth or business systems
 Attach back
 Fire packets at the attack source  Interact via CnC or payload

Presenter's Company

Logo ­ replace on

master slide

8

#RSAC
Conventional Active Response

Challenges

Advantages

 Complex business and mission requirements

 Block-and-tackle cause and effect is well understood

 Distributed and diverse infrastructure  Action is decisive

 Repercussions

 Attack back is human mediated

Presenter's Company

Logo ­ replace on

master slide

9

#RSAC
Facets of Active Response ­ Risk Based

 Context through post-processing  Enrichment of event data ­ asset, identity, access lookup  Tiered analysis ­ submit malware to a sanbox
 Signaling and messaging  Expert system communication ­ start packet capture  Summarization ­ forward summary data to ticketing system
 Evidence preservation  Disk forensic snapshot  Move event data out of rotation repository

Presenter's Company

Logo ­ replace on

master slide

10

#RSAC
Risk-Based Active Response

Challenges

Advantages

 Technology managed by different  Low business risk in case of errors

teams

 Analyst has deeper context and

 Integration challenges ­ lack of open knowledge

APIs

 Not making any configuration

 No central broker or nerve center

changes

Presenter's Company

Logo ­ replace on

master slide

11

#RSAC
AND NOW FOR SOMETHING CONTROVERSIAL...

Presenter's Company

Logo ­ replace on

master slide

12

#RSAC
...LOW OR HIGH CONFIDENCE  AS IT RELATES TO BUSINESS RISK

Presenter's Company

Logo ­ replace on

master slide

13

#RSAC
Confidence Drives Depth of Decision
 What is the business risk?  How complete is the threat context?  What/who will be impacted by change?  How hard is it to revert the change?  Who has the Get Out of Jail Free Card?

Presenter's Company

Logo ­ replace on

master slide

14

#RSAC
Natural Remedy for Active Response
 Focus on business risk and mission  Let the machines be machines  Enable the human to be human

Presenter's Company

Logo ­ replace on

master slide

15

#RSAC
BALANCING BUSINESS RISK AND ACTIVE RESPONSE

Presenter's Company

Logo ­ replace on

master slide

16

#RSAC
Who Does What

Machine
 Correlate  Auto-collect  Message, signal  Execute action

Human
 Contextualize  Prioritize  Mediate action  Apply gut feel

Presenter's Company

Logo ­ replace on

master slide

17

#RSAC
Production Active Response Actions

High Confidence
 Alert on correlations  Block on IP or domain  Modify configs  Report on actions taken

Low Confidence
 Alert on correlations  Contextualize alerts  Gather more data for alert artifacts  Kick off secondary analysis  Prepare for human

Presenter's Company

Logo ­ replace on

master slide

18

#RSAC
Examples of Confidence

High Confidence

Low Confidence

 Threat feed matches from ISAC or internal sources
 Trigger from inline dynamic analysis engine
 Correlation alert for beaconing activity

 Threat feed match from a free intel feel
 Correlation alert from a statistical engine
 Individual signature match from IDS/IPS

Presenter's Company

Logo ­ replace on

master slide

19

#RSAC
THE MACHINE CAPABILITY

Presenter's Company

Logo ­ replace on

master slide

20

#RSAC
Key Technical Capabilities
 Security instrumentation  Aggregation, correlation, alert  Integration across the instrumentation  A nerve center ­ orchestration, messaging  Tracking of all actions and messages

Presenter's Company

Logo ­ replace on

master slide

21

#RSAC
Security Instrumentation

Network

Endpoint Threat Intelligence Authentication

Presenter's Company

Logo ­ replace on

master slide

22

#RSAC
Security Instrumentation ­ Core Capabilities
Persist, Repeat

Threat intelligence Network Endpoint

· Third-party threat intel · Open source blacklist · Internal threat intelligence

· Firewall, IDS, IPS · DNS · Email

· Web proxy · NetFlow · Network

· AV/IPS/FW · Malware detection · Endpoint forensics

· Config mgmt · OS logs · File system

Reputation services, known relay/C2 sites, infected sites, IOC, attack/campaign intent and attribution
Who talked to whom, traffic, malware download/delivery, C2, exfiltration, lateral movement
Running process, services, process owner, registry mods, file system changes, patching level, network connections by process/service

Access/Identity
Presenter's Company Logo ­ replace on master slide

· Directory services · Asset mgmt · Authentication logs

· Application Services
· VPN, SSO

23

Access level, privileged use/escalation, system ownership, user/system/service business criticality

#RSAC
Building Confidence for Active Response
Persist, Repeat

Threat intelligence Network Endpoint

· Third-party threat intel · Open-source blacklist · Internal threat intelligence

· Firewall, IDS, IPS · DNS · Email

· Web proxy · NetFlow · Network

· AV/IPS/FW · Malware detection · Endpoint forensics

· Config mgmt · OS logs · File system

Access/Identity
Presenter's Company Logo ­ replace on master slide

· Directory services · Asset mgmt · Authentication logs

· Application Services
· VPN, SSO

24

Update threat lists. Enrich threat list info with new knowledge.
Add to custom policy groups: vlans, watch list, bad actors, policy groups. Start/stop packet capture.
Acquire config info, invoke snapshots, submit files to sandbox, update local signatures, clean up infected files, start/stop processes and services.
Acquire business info, groups, travel, organizational priority. Modify membership, revoke tokens or certs.

#RSAC

Presenter's Company

Logo ­ replace on

master slide

25

#RSAC
High Confidence Policy Change
IDS Alerts

Attack

Layer 7 FW

Corp Machine

Bypass FW

Presenter's Company Logo ­ replace on master slide

Block

IDS Event to a Critical Server

#RSAC
Low Confidence Aggregation
 Dynamic analysis alert  Did it detonate on the endpoint?
 Check for endpoint logs  Check for AV logs
 Take a snapshot ­ proc list, netstat  Start packet capture  Disk forensic snapshot
Presenter's Company Logo ­ replace on master slide

#RSAC
Active Response Is Survival
 Attack volume is high  Human time response is not tenable  Active response enables the human analyst  Active response != cutting people's Internets
Presenter's Company Logo ­ replace on master slide

#RSAC
Thank You
 Questions?  More discussions: monzy@splunk.com
Presenter's Company Logo ­ replace on master slide

