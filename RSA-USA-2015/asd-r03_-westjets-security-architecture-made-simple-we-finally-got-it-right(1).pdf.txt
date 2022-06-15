SESSION ID: ASD-R03
WestJet's Security Architecture Made Simple We Finally Got It Right!

Richard Sillito
Solution Architect, IT Security WestJet @dhoriyo

#RSAC

#RSAC
Fort Henry Ontario

#RSAC
Flight Plan

The Solution

Applying Principals

The Problem

Summary Questions

3

#RSAC
The Problem

#RSAC
What wrong with the network?

North/South

#RSAC
The underlying problem
Zones
DMZ Internal Secured Internal
East/West

Infiltration
Large Number of Attackers
Using a Large Number of
Attacks
Very Hard to Detect or Defend

The Threat

Discovery

Extraction

Smaller Amount of Attackers
Using a Standard Approach

Smaller Amount of Attackers
Using Normal Access Methods

Easier to Detect and
Defend

Hard to Defend or Detect

#RSAC
Exfiltration
It Doesn't Matter! You're Too Late!

#RSAC
Vulnerability Surface

Vulnerability Surface

Developer Datacenter Application/Service Datacenter OS Bios Network - Link Network - Transport Network - Application Client OS Client Application Users

Existing Datacenter ­ Never Worked

#RSAC

The Internet

Guests

Remote Users

Untrusted Users?

DMZ Internal

Secured Internal? Datacenter

Employees
Contractors
Trusted Users?

#RSAC
The Solution

#RSAC
Security Architecture Made Simple (SAMS)

Infrastructure
Device Network Application & Services

Data
Elements Classification

Access
Identity Position Role Authorization

#RSAC
Security Architecture Made Simple (SAMS)
Infrastructure
Device Network Application & Services

Security Architecture Made Simple (SAMS)

#RSAC

SAMS - Infrastructure

Application Gateway
Application Services Backend Services

Guests Employees Contractor/Partner End User Devices
Everywhere But the Datacenter (Untrusted)

Jump

Patch Monitor

Deploy

Test

Scan

IT Administration

Datacenter (Trusted)

SAMS ­ Infrastructure Logical Network View

Application Gateway ApplicationServices
Services

Mail
Gateway Citrix

Port 25 Port 443,995
Port 443 Port 8443
PortP8o4rt43443

Mail MGS ateway
Exchange
Citrix Intranet Site
ERDPata ApSpervices

Port 443 Port 25 Port 443

Data Services

Netscaler

XenApp

ESemrvaiciel s GGaatteewwayay

Mobile App

XenDesk

Provision

Reverse Proxy

#RSAC

SAMS ­ Infrastructure Logical Network View

#RSAC
IT Admin Jump Point Monitoring
Alerting
Patching

#RSAC
Using Core Router and Core Firewall

Service F

Service A

Service B

Service E

Service D

Service C

16

#RSAC
Traditional Approach

Pros
 Known Technology  Somewhat Flexible  Minimal Training

Cons
 Difficult to Scale the Solution
 Hub Model Requires all Traffic Traverse the Core
 Difficult to Insert Additional Security Services

17

The Software Defined Approach

Host 1

Host 2

Overlay Networks

Service F

Service A

Service B

Service E

Service D

Service C

Service F

Service A

Service B

Service E

Service D

Service C

Service F

Service A

Service B

Service E

Service D

Service C

Host 3

18

#RSAC

SDN/S Approach
Pros
 Easily Scaled  Very Flexible  Optimized Routing  Allows Insertion of Security
Services  Automation/Orchestration

#RSAC
Cons
 Emerging Technology  Standards are Not Well Defined  Vendor Eco Systems are
Developing  Monitoring Solutions are Not Well
Developed
19

#RSAC
Security Architecture Made Simple (SAMS)
Data
Elements Classification

Security Architecture Made Simple

#RSAC

SAMS Data

Data Elements
Fields Elements

Information Objects
Function Macro Routine

Products
Reports XML package
File Message

Guest details Charge Amount Departure Time

Flight Loads Revenues Metrics

Reports Webservices File Transfers

Report
Information Objects
Data Element

SAMS Data Example

#RSAC
Security Enforced
Security Maybe Refined
Security Define

#RSAC
Security Architecture Made Simple (SAMS)
Access
Identity Position
Role Authorization

Security Architecture Made Simple

#RSAC

SAMS Access

App/Service Role
Function Within an Application or
Service

Company Role
Function Within a Company

Company Position
Position the Employee was hired
into

Administrator Super User
Standard User Auditor

Safety Office Financial Office
Maint. Lead ERP Admin

CEO Manager, Sales Analyst III, IT

Security Architecture Made Simple

#RSAC

SAMS Access

Company Position

Human Resource System

Company Role
Identity Management System

Application or Service Role
Enterprise Directory Service or Local Directory Service

#RSAC
Security Architecture Made Simple (SAMS)

Infrastructure

Device Network Application

Storage & Transmission
of Data

Data
Elements Classification

Access

To

Info.

Access

Roles

To

and

Infrastructure

Responsibilities

Access
Identity Position Role Authorization

Products to look for

#RSAC

(HyperLinked)

 Vmware NSX  Palo alto, Check Point  McAfee NSM  Tivoli Identity Management  Arkin Net Analytics Platform (www.arkin.net)

27

#RSAC
Apply Slide
 Consider network challenges  Decide on a security strategy that will work for your organization  Familiarize yourself with Software Defined Network & Security  Accept that Bring Your Own Device is really your friend  Figure out a plan to migrate your network  Start making changes (evolution not revolution)
28

#RSAC
Summary
"If you can't explain it to a six year old, you don't understand it yourself."
Albert Einstein
29

#RSAC
Thanks and Recognition

Inspiration

· Dump your DMZ by Joern Wettern

· BYOD and the Death of the DMZ by Lori MacVittie

Thanks

· Zero Trust Model John Kindervag

VTeam

· Dominador DeLeon ­ Sr. TSA - Infrastructure Ops

· Justin Domshy ­ Manager of Environments

· Mike Gromek - Technical Architect III

· Darrell Lizotte ­ Technical Architect III

· Randy Seabrook ­ Manager Architecture

· Derek Sharman - Sr. Analyst-Config Management

· Walter Wenzl - Sr Analyst-Config Management

· Michael Slavens - Security Support Analyst III

· Peter Graw - Technical Architect III, IT ­ Infrastructure

· Quentin Hall - Technical Architect III

· Tao Yu - Sr. TSA Telecomm

VMWare · Vern Bolinius · Ray Budavari · Bruno Germain · Darren Humphries
Bosses · Cheryl Smith (Former CIO) · Dan Neal (My Boss)
My Family · Patrick, Brittney, Taz

#RSAC
Q & A
31

#RSAC
Bonus Slides
32

Service Development

Operate Develop

Support (ITOC, Security Admin) Technicians (Senior Analyst I, II)

#RSAC

Response

Assessment

Detection

Prevention

People Process

Price Product

Strategy Manage Focus Blueprint Vision Driver

Tech Leaders (Security Analyst III) Manager Director Architecture Technology Council Business

#RSAC
Define Future State
 Start at the top and get aligned!

#RSAC
Define Future State
Break your world down into smaller pieces

#RSAC
Define Future State
Have an approach!

#RSAC
Define Future State
Figure out how you're going to get the work done

#RSAC
Define Future State
Now put it all together

Dealing with an evolving technology

Software Defined Datacenter

Target Architecture

Industry Direction

Industry Direction

Target Architecture
Target Architecture

Industry Direction
InTadrugsettry DAirecchtiitoencture

Target Architecture
Target Architecture

Dev/Te st Tenant s

Staging Tenants

Production Tenants

Second Datacenter

Full SDN Network

#RSAC

#RSAC
The Evolution

Software Defined Datacenter

#RSAC

(De-mystifying the cloud)

