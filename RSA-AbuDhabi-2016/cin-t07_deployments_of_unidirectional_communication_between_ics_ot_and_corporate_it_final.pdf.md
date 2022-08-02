SESSION ID: CIN-T07
Deployments of Unidirectional Communication between ICS OT & Corporate IT
#RSAC

Gilles Loridon
CEO Global Security Network

#RSAC
Content

Unidirectional Communication: introduction to the technology
Case study 1: is transferring 400,000 files per minute to Honeywell PHD server a good idea?
Case study 2: my ICS protocol (i.e. Modbus) is bidirectional, how can I use data diodes?
Case study 3: how to save truckload of money and increase security with Pi to Pi replication.

Presenter's Company

Logo ­ replace on

master slide

2

#RSAC
Unidirectional Communication: the technology

#RSAC
Business Case
Critical National Infrastructure companies have/should have physically isolated plant networks hosting systems that are:
Critical to the national economy and the safety of its people.
If compromised can cause lost of life, huge financial and environmental cost.
ISSUE
These plant networks need to send information to corporate networks without compromising security that is provided by physical network isolation
Presenter's Company Logo ­ replace on master slide

#RSAC
Network Boundary Options

Presenter's Company Logo ­ replace on master slide

Air Gap: · Not Real-time & time consuming Firewall: · Vulnerabilities, misconfiguration & disgruntled
staff Data Diode: · Real-time one-way. Period.
5

#RSAC
Existing Solution ­ Air Gap t

To export data from the critical / high security network an AIR GAP solution is used. Employees put data on removable media like a CDROM, USB device, magnetic tape. The data is manually imported into the corporate network.
Problems
· Labor intensive manual process
· Delay in transferring data
· Data leakage issues

Presenter's Company

Logo ­ replace on

master slide

6

#RSAC
Usual solution: firewall

To deploy an IT Firewall and enable a rulebased one way data transfer.

Problems:

Firewall is based on firmware, software and logic and is therefore vulnerable to attacks

Is the Firewall setup properly?

Back doors, covert channel???

No guarantee of data traffic not going back to the external network.

Presenter's Company

Logo ­ replace on

master slide

7

#RSAC
CISO & Fortinet CVEs

Presenter's Company

Logo ­ replace on

master slide

8

#RSAC
Data Diode Solution
One-way communication physically secured by Hardware Data Diode Hardware only (no software / logic on the DD) Impossible to penetrate/attack Certified devices (the only CC EAL 7+ certified device in the world)

Presenter's Company

Logo ­ replace on

master slide

9

How it works?

SERVER NIC

Hardware Data Diode

INPUT

ONE-WAY

OUTPUT

SERVER NIC

#RSAC

LIGHT EMITTER

LIGHT RECEIVER

Possible

Presenter's Company

Logo ­ replace on

master slide

10

#RSAC
Case study 1: One way replication of Historian server between OT and IT

#RSAC
Historian replication setup
Presenter's Company Logo ­ replace on master slide

#RSAC
So far so good

Existing Honeywell PHD server with millions of data points in back log.

Master PHD server connected to Slave PHD server with 1 Gbps network connection

OT Engineers familiar with the historian protocols

Factory Acceptance Test: few thousands data points replicated

from OT to IT through FTP file transfer. FAT passed with flying

colours.

Presenter's Company

Logo ­ replace on

master slide

13

#RSAC
Issues

To process the backlog the OT Engineers sent hundreds of thousands files per minute through the Data Diode to one single network share folder.

Surprise, surprise: the file sharing sever crashed, I/O kernel panic.

The OT Engineers blamed the donkey (=Data Diode)

Presenter's Company

Logo ­ replace on

master slide

14

#RSAC
Solution
We developed a packer/unpacker software to pack the files into a single zip before sending it through the diode.
We unpacked the files in Ram Disk to the Windows server and on temporary folders.
A much better design would have been to use a TCP stream to send the data points across the Diode.

Presenter's Company

Logo ­ replace on

master slide

15

#RSAC
Case Study 2: Modbus Master Slave replication

#RSAC
NPP segregation within OT networks

Presenter's Company Logo ­ replace on master slide

The challenge: Nuclear Power Plant Data extracted from RTU over Modbus
Customer requirements Segregate OT operations from OT monitoring network Highest assurance to prevent Cyber-attacks Being able to send information to headquarters

#RSAC
Modbus technical challenge

RTU Modbus Slave on OT Control

Supervision Modbus Master on OT Monitoring
Read coil #124 status?

Presenter's Company Logo ­ replace on master slide

coil #124 is ON

#RSAC
Technical solution

RTU Modbus Slave on OT Control

Modbus Fake Master

Read coil #124 status?

Modbus Fake Slave

Supervision Modbus Master on OT Monitoring

Read coil #124 status?

coil #124 is ON
Presenter's Company Logo ­ replace on master slide

coil #124 is ON coil #124 is ON
19

#RSAC
Final Solution

Presenter's Company

Logo ­ replace on

master slide

20

#RSAC
Case Study 3: Pi to Pi replication

Usual setup
ICS Layer 3

#RSAC
ICS Layer 4

Master Pi Server + Pi to Pi interface

Presenter's Company

Logo ­ replace on

master slide

22

Slave Pi Server

#RSAC
Data Diode setup: major savings

ICS Layer 3
Upstream Pi Replicator

ICS Layer 4
Downstream Pi Replicator

Master Pi Server

Presenter's Company

Logo ­ replace on

master slide

23

Slave Pi Server

#RSAC
Wrap-up and Q&A

#RSAC
"Apply" Slide

Always involve the Data Diode guys as early as possible in the project design.

Even if your technical protocol is two ways, as long as your Business requirement is one-way, there should be a diode solution.

Data Diode could be sold to management as a way to save CAPEX and big time OPEX.

If you have to have ICS L3 to L4 communication, you should consider oneway communication.

If you need to implement zone/conduit between critical safety systems and OT network, you should consider Diodes.

Presenter's Company

Logo ­ replace on

master slide

25

Q&A
All questions welcomes! Thank you, shoukran and merci!

Presenter's Company

Logo ­ replace on

master slide

26

#RSAC

