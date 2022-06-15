Docker platform 
Build,   Ship   and  Run   Any  Application   Anywhere
Dan Powers Head of Partner Technology Management Docker, Inc. @powersplay

Agenda
· Transforming  the  Application L  andscape · Unique  Solutions t  o  Real  World  Problems · Who  is  Docker · State  of  the  Project · Docker &  China
2

Dan  Powers
Docker Technology M  anagement
3

Transforming  the  Application  Landscape
4

Organizations  Want  to  Break  Free

INEFFICIENCY

POOR  INNOVATION

Inability  to  Scale Inefficient P  rocesses Waste  and R  edundancy
No  Accountability

Stalled  Innovation Low  Innovation
Lack o  f C  ompetitiveness

HIGH  COSTS
Vendor L  ock I  n High  CAPEX C  osts

Monolithic
Slow changing

Transforming  the  Application  

~2000

Landscape

Today

Rapidly updated

Loosely Coupled Services

Big Servers
6

Many Small Servers

Static Website
Background Workers

The  New  Challenge  of   Distributed  Apps

User DB

Analytics DB

Web Front End

Queue

API Endpoint

Development

Test & QA

Production

Scale Out

Virtual machines

Developer Laptop 7

Server

Server Cluster

Disaster Recovery

Data Center

Public Cloud

Distributed  Application  Solution

Static Website

Background Workers
Web Front End

User DB

Any  App  

API Endpoint

Analytics DB

Queue

Anywhere

Composable
8

Dynamic

Portable

The  Docker M  ission: Build  tools  of  mass  innovation  so  you  can...

Build

Ship

Static Website

Background Workers

Distributed   Applications

Web Front End

User DB

API Endpoint

Anywhere

Run

Analytics DB

Queue

9

Introducing  Containers
· Uses  the  hosts  operating  system's  kernel  to  run  multiple   guest  instances.
· Each  guest  instance  is  called  a  container · Each  container  has  its  own
­ Root  file  system ­ Processes ­ Memory ­ Devices ­ Network  ports
10

Virtual  Machines,  Containers

· Containers a  re m  ore l  ightweight · No  need  to  install a    guest  OS
· Less  CPU,  RAM,  storage s  pace · More  containers p  er m  achine · Greater p  ortability
· Rapid  build/ship/run p  latform · More  appropriate f  or  
microservices

Virtual Machine

Containers

11

The  Core  of  the  Solution
Docker Containers

Docker Engine

Cloud  or  Server   Hosted  Docker
Registry

Docker APIs Ecosystem Tools

Benefits  of  Docker
· Separation  of  Concerns  ­ Developers  focus  on  applications;   System  admins  focus  on  deployment · Fast  Development  Cycle · Application  portability   ­ build  in  one  environment,  ship  to  another · Scalability   ­ new  containers  are  cheap  to  create · Run  more  applications   on  one  host  machine
12

Building  out  a  full  stack
Commercial  Solutions

Build

Ship

Run

Swarm

Notary Kitematic

Dev  Platform
Distribution

Compose Docker Engine

RunC Machine

Plumbing Storage

networking Policy Enforcement

Open  Standards
Container run-time spec

Image spec

13

Unique  Solutions  to  Real  World  Problems
14

Use  Case:  Continuous  Integration  and  Delivery

1.  Development

2.  Test

3.  Stage  /  Production

Version control

Sysadmin

Developer

https://www.docker.com/products/use-cases

QA  /  QE

Reference Architecture: Building a Continuous Integration Pipeline with Docker

15

Use  Case:  Containers  as  a  Service  (CaaS)

Developer

Sysadmin DevOps

Tomcat Oracle Jenkins

Deployment

Use  Case:  Data  Processing  Pipelines
Data Scientist
$ docker

SysAdmins DBAs

Data Nodes

Docker Cloud  and  On--Premise S  olutions

SaaS/Cloud Future

Docker Hub & Trusted Registry

Future

Build
On Premise Future
18

Ship
Docker Trusted Registry Docker  Engine

Run
"Project Orca"

Who  is  Docker?
19

Who  is  Docker?
The  Giants The  Contributors   The  Communities The  Company The  Users
The  Ecosystem
20

The  Giants
text
· Namespaces (IBM) · Cgroups (Google) · LXC tools · The Linux Kernel · Git · SELinux (Red Hat) · Solaris Zones · BSD Jails · +++
21

The  Contributors - - OpenSource
text
22

The  Communities
text
200
Groups
60
Countries
23

The  Company
text
Dan Powers
24

The  Users
text
*A small subset of the 100s who are using and/or writing about us

The  Ecosystem
Official Repositories

Dev Tools

Operating Systems Big Data Service Discovery

Build / Continuous Integration

Configuration Management

Storage

26

Infrastructure & Service Providers
Network i ng Clustering & Scheduling Storage Management S ec uri ty Monitoring & Logging Consulting &Training

State  of  the  Project
27

text
Contributors
Projects  on  GitHub
Dockerized Applications* Boot2Docker   Downloads*
Container  Image   Downloads*

State  of  the  Project

June 2  014 June 2  015 Growth

460

1,300+ 183%



6,500

140
40,000 515% 120

14,500

100

150,000 934%

80

60

225,000 3,500,000 1,456%

40

(Sept `15  3.9M)

20

0

2,750,000 Oct  `15  1B+ *****%

Image  pulls  from   hub.docker.com
120M/month

*cumulative

Docker in  China

Docker &  China
­ Docker,   Inc. i  n  China · Build  the  Community · Access  to  Docker Platform   &  Information
­ Develop  the  product
· Local  engineering  resources · More  committers  &  maintainers
­ Spread  the  word · meet--ups
­ Future:  Commercial  Relationships  &  Partners,       Localization


31

