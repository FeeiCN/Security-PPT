Cisco and Splunk: Under the Hood of Cisco IT
Robert Novak, Cisco Big Data Partner CSE George Lancaster, Engineer, Cisco IT
September 2015

Agenda
· Cisco's History with Splunk · How Cisco Uses Splunk
· IT Operations · Security Analytics · There's an App for that! · Splunk + Cisco UCS = Better Together · Learn More

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

2

Would you like to play a game?

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

3

Top 3 Questions

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

4

4  

Top 3 Questions
Cisco makes servers?

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

5

5  

Top 3 Questions
Cisco makes servers? Cisco does big data?
2

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

6

6  

Top 3 Questions
Cisco makes servers?
Cisco does big data? 2
What's going on with Cisco and Splunk?

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

7

7  

Funny you should ask...

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

8

Big Data & Analytics ­ Gain Insight from your Data

Data  is  the  lifeblood  of  any   applica2ons  and  business.         While  the  real  value  is  in  the   analy2cs  and  the  ability  of  a   company  to  use  that   intelligence  to  gain  a  desired   business  outcome  

Data  Analy-cs  with  Splunk  on  Cisco  UCS  
Splunk  drives  opera-onal  insights  and  outcomes   for  our  customers  on  Cisco  UCS  Infrastructure  
UCS Manager, UCS Director Express UCS 6200 Series Fabric Interconnects LAN, SAN, Management UCS C220/C240 M4 Servers

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

9

Cisco's Footprint with Splunk

70+ Monitored Applications

Across 7 Global Data Centers

7+ Year Relationship

Flexible infrastructure
to accommodate new business
needs

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

10

How Cisco Uses Splunk
Data Analytics with Splunk on Cisco UCS for Cisco's IT Operations

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

11

Cisco IT Operations Challenges

Provide self-service
& selfhealing capabilities

Reduce time
required to detect & resolve issues

Monitor, manage, protect, and avoid security incidents  

Manage Cisco UCS Hardware Platforms

Empower Cisco's internal
Cloud users to manage their own
environments

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

12

Cisco's IT Operations Results

"Splunk pulls data from all the logs and gives our operations teams a single place to look and work together to solve problems."
-- Piyush Bhargava, Distinguished Engineer, Cisco IT

ü Proactive monitoring enables 50% reduction in high priority issues

ü 80% reduction in operational costs

ü 90% improvement in problem resolution and root cause analysis times

ü Improvements in system stability, availability and performance

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

13

IT Operations @ Cisco
Cisco IT uses Splunk to index a broad range of system logs and machine data for networking devices, operating systems, unified communications, video events, and
applications.
ü Aggregated multiple siloed systems into Splunk ü Monitoring 70+ Applications ü 846% increase of search volume per day in one year ü Operational Intelligence in minutes rather than hours

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

14

Don't take my word for it...

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

15

Cisco's Splunk Environment

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

16

Insights Across Cisco - Platform   

Business   Unit  
· Infra  Structure   · IT  OPS   · Security   · Commerce   · Sales  &  Marke-ng   · Channels   · Engineering   · Webex  

Pla=orm  
· CCIX  (web  +  app)   · FTP   · RAC  DB   · WSG   · PING   · OBIEE   · ACE  

SPLUNK  App  

SYSLOG  

· Splunk  on  Splunk   · Deployment  Monitor  
· UCS  App  
· JMX  App  
· Unix  App   · NetApp  App  

· Network   · Linux  /  Unix  
· UCS  
· VMWare  ESXi  
· Datacenter  baYery  /   temperature  logs  

Sources  and  Logs  

Windows  
· Pre--Prod   Event  Logs  
· Produc-on   Event  Logs  
  

Ac-ve   Directory  
· Event  Logs     

ACS   Storage  

· Event   Logs  
· AAA  
Logs   · ISE  Logs  

· Event  Logs     

Search  Heads  
· 16  VMs  (64  core  X  32  GB)    

Indexers  
· 20  VMs  (16  core  X  16  GB)   · 70  +  Unique  Indexes  

Storage  

Data  Center  

· 56  TB  SAN  ­  Hot  &  Warm  

· Prod:  RCDN  ­      8  SH  &  10  Indexers  

· 28  TB  NAS  --  Cold  

· Prod:  ALLEN  ­    8  SH  &  10  Indexers  

  

· Dev:            RTP      ­    4  SH  &    2  indexers  

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

17

Splunk Searches ­ Daily Average

1. Interactive Searches = 55K+

2. Scheduled Searches = 45K+

3. Total Searches = 100K+

4. Number of Users = 180+

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

18

Cisco's IT Operations Evolving with Splunk

Daily Indexing 300G
2010

10 Indexers
2014 2014

2015

20 Indexers 2015

2015
Daily Indexing ~ 2TB

16 Search Heads

47 Search Heads

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

19

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

20

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

21

Data Analytics with Splunk on Cisco UCS for Security Analytics
Using Splunk @ Cisco CSIRT

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

22

About CSIRT
· Cisco Computer Security Incident Response Team (CSIRT) · CSIRT = Security Monitoring and Incident Response · Architecture, Engineering, Research, and Investigations · Enterprise global threat and 24x7 incident response

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

23

CSIRT Environments Recent Snapshot

ü 300 locations in 90 countries ü 400 buildings ü 1500+ labs ü 100,000+ employees on network ü 50-300 malware-related cases opened in a typical week ü 650,000+ ip devices on network ü 130,000 windows hosts ü 50,000 Linux hosts ü 40,000 routers ü 2-3 million highly tuned ids events per day ü 10+ billion netflow records per day

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

24

Replacing a SIEM @ Cisco

Security Information and event management

· Challenges: SIEM could not meet security needs
­ Very difficult to index non-security or custom app log data ­ Serious scale and speed issues. 10GB/day and searches took > 6 minutes ­ Difficult to customize with reliance on pre-built rules which
generated false positives

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

25

Replacing a SIEM @ Cisco, cont'd

· Enter Splunk: Flexible SIEM and empowered team

­ Easy to index any type of machine data from any source ­ Over 60 users doing investigations, correlations, reporting, advanced
threat detection
­ All the data + flexible searches and reporting = empowered team ­ 2TB/day and searches take less than a minute. 7 global data centers with
350TB stored data
­ Flashback Malware Example ­ Estimate Splunk is 25% the cost of a traditional SIEM

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

26

CSIRCT  LSoIgRgiTngL  DoegplgoyinmgenDt  eployment

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

27

Cisco Security Analytics Results

33 percent reduction in the time required to conduct security investigations All security data is readily available in a single, centralized portal for faster and simpler access Substantially easier correlation allows for more thorough investigations
Ability to automate routine tasks and search log data allows CSIRT analysts to work more effectively
Heading

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

28

"And they wrote the book ..."
Cisco's CSIRT engineers applied their experiences during the CSIRT deployment to a new
O'Reilly book now available at most booksellers

bitly.com/infosecplaybook

29  

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

29

There's an app for that... (or a technology add-on, at least)

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

30

Splunk Apps for Cisco Environments

Splunk app for Enterprise Security

120+ security apps & add-ons

Cisco  ASA  

MobileIron  

Cisco  ESA  

OSSEC  

500+ apps/add-ons
Cisco  ACI,  IOS,   Nexus  9000  
Cisco  UCS  

Cisco  WSA   NetFlow  Logic  

VMware  

Cisco  ISE  

Ac-ve  Directory  

NetApp  

Sourcefire  
Cisco  Security   Suite    

Bit9  ETD  
Norse  Darklist  

Servicenow   UNIX/Linux  

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

31

Splunk App for Cisco UCS
NEW AND IMPROVED as of May 28, 2015  Aggregates, monitors, trends and analyzes all
relevant data from Cisco UCS Manager instances  Enables proactive capacity and performance monitoring/ management, fault trending, power and cooling, and more  Works with other Splunk add-ons and data sources (including Enterprise Security and PCI Compliance add-ons) to aggregate and correlate data across your enterprise
32  

Application s
Operating Systems
Hypervisors
UCS server, storage, network

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

32

Splunk on Cisco UCS

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

33

What is Cisco's Unified Computing System (UCS)?

Unified Management: UCS Manager uses policy-based configuration to ensure consistent deployments

Unified Fabric: Integrated 10 Gigabit Ethernet and Storage Networking (FCoE/iSCSI)

Service Profiles: Maintain consistency across batches of servers and multiple applications. Deploy and expand in record time.

Performance: Built with 10GbE at the core, 40GbE available, repeatable configurations and performance, and over 100 benchmark records

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

34

Why Splunk on Cisco UCS?

Time to Deployment: Spin up a mutually validated, pre-tested environment in minutes rather than days or weeks
Total Cost of Ownership: Integrated networking and management reduce customer cost and effort to migrate, deploy, and expand
Time to Grow: Expand servers and network capacity quickly and consistently

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

35

Cisco UCS + Splunk = Better Together

Seamless Scalability Facilitates Rapid Growth
­ Scale Splunk from a single server to distributed/clustered deployment
­ Grow your clusters efficiently and consistently ­ Runs on the same UCS C-Series servers as other big data platforms
Split Second Response Times
­ Exceptional performance for "needle-in-a-haystack" searches ­ Consistent performance as simultaneous users increase
Simplified Repeatable Deployments
­ Four pre-tested UCS Integrated Infrastructures ­ Capacity or performance optimization ­ NEW! Cisco Validated Design (CVD) with HA and Archiving

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

36

Cisco UCS Reference Architectures

Retention optimized

Single Server
250 GB indexed per day 4 months retention

Clustered Deployment
Up to 4TB indexed per day 1 year Retention

Performance optimized

250 GB indexed per day 1 month retention

UP to 4TB indexed per day 3 months Retention

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

37

Cisco Validated Design (CVD) for Splunk

· Developed by Cisco and Splunk engineers in Spring 2015
· 250+ page guide to design and deployment, pallet to production
· Based on UCS C-Series (C220, C240, C3160) servers and Splunk Enterprise software
· Includes high availability & data archiving
· Download for free at cisco.com/go/bigdata_design  

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

38

Splunk on UCS : Performance Benchmark Test bed Topology

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

39

Splunk ­ Cisco UCS Benchmark Results (6.2 v/s 6.3)

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

40

Learn more about Splunk and Cisco UCS

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

41

Learn More About Splunk on Cisco UCS!

SplunkBase app resources:

splunkbase.splunk.com

Cisco's Big Data Design Hub: cisco.com/go/bigdata_design features Cisco Validated Designs (CVDs) and other architectural docs

Big Data Applications Hub:

cisco.com/go/bigdata

features reference architectures, solution briefs, infrastructure, automation, etc.

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

42

Thank you.

Cisco Big Data & Analytics Solutions

Data Management: Build the Foundation
Cisco and Hadoop partners providing a lower cost & scalable storage platform to capture and analyze new & traditional data
Data Warehouse Optimization: Save Millions
Offload data and move ETL processing from expensive EDW to low cost Hadoop leveraging Cisco Data Virtualization for easy access

Data Analytics: Turn Data into Business Outcomes
Cisco and strategic analytics ISV's to gain insight from your data for competitive business advantage

© 2015 Cisco and/or its affiliates. All rights reserved. Cisco Public

45

