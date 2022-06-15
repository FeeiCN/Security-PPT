SESSION ID: AIR-W02
The Fog Of Cloud Security Logging

Rehman Khan
Director, Cloud & Data Security TD Ameritrade https://www.linkedin.com/in/rehmankhan/ @cryptorak

Matthew Lubbers
Cloud Security Architect Consultant TD Ameritrade https://www.linkedin.com/in/matthew-lubbers-architect/
#RSAC

#RSAC
Public Cloud Security Threats

Presenter's Company

Logo ­ replace or

delete on mster slide

2

#RSAC
Opportunities To Detect Attacks, Data Exfiltration
Presenter's Company Logo ­ replace or
delete on mster slide

#RSAC
Cloud Logs They Are Plenty....

Presenter's Company

Logo ­ replace or

delete on mster slide

4

Clear The Log Fog
Presenter's Company Logo ­ replace or
delete on mster slide

#RSAC

Public Cloud Security Program
Lorem Ipsum is simply dummy text
Lorem Ipsum is simply dummy text
Presenter's Company Logo ­ replace or
delete on mster slide

#RSAC
6

#RSAC
Approach
Cloud Security Logging Strategy
· Security incident response requirements
· Business applications and layers of the architecture
· Cloud service providers capabilities around security logs
· Current on-premise security logging capabilities i.e. SIEM, Log Mgmt., etc.
Presenter's Company Logo ­ replace or
delete on mster slide

Cloud Logs by Cloud Services
Presenter's Company Logo ­ replace or
delete on mster slide

#RSAC

#RSAC
Monitor Critical Events & Activities

Presenter's Company Logo ­ replace or
delete on mster slide

Identity Activity Monitor Privileged Users & Unreasonable Travel Events
Resource Activity Monitor Resource Transactions & Operations Events
Network Activity Monitor Source & Destination Events
Data Activity Monitor Any Data Access & Movement Events Including APIs

#RSAC
Context Based Monitoring

Presenter's Company

Logo ­ replace or

delete on mster slide

10

#RSAC
Log Types, Critical Events & Attributes
Presenter's Company Logo ­ replace or
delete on mster slide

#RSAC
Cloud Security Insights Matter

Presenter's Company

Logo ­ replace or

delete on mster slide

12

#RSAC
Architecture

#RSAC
Multi-Cloud Logging Architecture ­ On-Premises SIEM

Presenter's Company

Logo ­ replace or

delete on mster slide

14

#RSAC
Multi-Cloud Logging Architecture ­ CSP Cloud SIEMs

Presenter's Company

Logo ­ replace or

delete on mster slide

15

#RSAC
Technical Challenges & Solutions

Log Challenges & Solutions
Every CSP requires different solutions to support log management Understand each CSPs platform requirements to create effective log solution OS-level audit logs are difficult to collect without an agent Use configuration management to deploy software agents consistently Most CSPs do not provide built-in configuration management Develop a golden image to reinforce organizational security standards Network logs are difficult to read by themselves Create network-specific dashboards: Traffic by IP, Protocol, or Host
Presenter's Company Logo ­ replace or
delete on mster slide

#RSAC

#RSAC
Critical Attributes For Log Monitoring
Presenter's Company Logo ­ replace or
delete on mster slide

AWS Audit Log
· CloudTrail: · userIdentity (User/Service) ­ Who is doing what · sourceIpAddress ­ Where was the request generated · userAgent ­ Device information (Firefox, Win 10) · eventName ­ The API call being made
Context

Presenter's Company

Logo ­ replace or

delete on mster slide

19

#RSAC
IAM Role IAM User

#RSAC
AWS Network Log
VPC Flow Logs
­ Source Address ­ Destination Address ­ Destination Port ­ Protocol ­ Action

Presenter's Company

Logo ­ replace or

delete on mster slide

20

#RSAC
Use-case: System visibility for Compute

Presenter's Company

Logo ­ replace or

delete on mster slide

21

#RSAC
Use-case: AWS Audit Logging

Presenter's Company

Logo ­ replace or

delete on mster slide

22

#RSAC
Use-case: Network visibility for Security Events

Presenter's Company

Logo ­ replace or

delete on mster slide

23

Azure Active Directory Logs
· Sign-in Logs: · Principal (User) ­ Who has logged in · IP Address - Where they have logged in from · Client ­ Device information
· Audit Logs · Initiated By (Actor) ­ Who is doing what in Azure AD · Service ­ The directory service being used · Activity ­ The API call made to the service

Presenter's Company Logo ­ replace or
delete on mster slide

Activity
24

Context

#RSAC

Principal

#RSAC
Azure Network Logs
NSG Flow Logs
­ Source Address ­ Destination Address ­ Destination Port ­ Protocol ­ Traffic Decision

Presenter's Company

Logo ­ replace or

delete on mster slide

25

#RSAC
Use-case: Automated Agent Deployment

Presenter's Company

Logo ­ replace or

delete on mster slide

26

#RSAC
Use-case: Network & Resource visibility for Security Events

Presenter's Company Logo ­ replace or
delete on mster slide

Automation Account
27

Take Away Checklist
Establish a cloud security governance program Understand organizational constraints Establish cloud risks and threats Identify critical cloud logs and events Develop logging strategy based on business requirements Logging varies across CSPs, understand various CSP logging strategies

#RSAC
Develop security log integration Architecture (Native vs Cloud vs On-premise) Establish cloud log monitoring processes Automate using infrastructure as code and event driven architecture Focus on using AI/ML based insights

Presenter's Company

Logo ­ replace or

delete on mster slide

28

#RSAC
Useful Links

TD Ameritrade Cloud Security Github https://github.com/TDAmeritrade/cloud-and-data-security Cloud Security Governance https://cloudsecurityalliance.org/research/cloud-controls-matrix/ https://www.sans.org/reading-room/whitepapers/cloud/paper/37960 Cloud Security Logging https://aws.amazon.com/answers/logging/aws-native-security-loggingcapabilities/ https://aws.amazon.com/answers/logging/ https://docs.microsoft.com/en-us/azure/security/fundamentals/log-audit https://azure.microsoft.com/en-us/resources/videos/security-logging-andaudit-log-collection/

Presenter's Company

Logo ­ replace or

delete on mster slide

29

