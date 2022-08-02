1 INTEL CONFIDENTIAL

Intel's Innovations with OpenStack
Shane Wang Engineering Manager Intel Open Source Technology Center

Agenda
1. Intel and OpenStack 2. Key Intel Contributions to OpenStack and Open Source 3. Intel IT OpenStack update
2

Intel is committed to OpenStack

Contributions

Intel®IT Open Cloud

Intel®Cloud Builders Reference Architecture

· Contributions across OpenStack projects plus tools released to Open Source
· One of top contributors to Grizzly1
· Performance optimizations, validation and patches

· Intel IT Open Cloud with OpenStack
· Deliver Consumable Services
· Enable Automated Management of Cloud

· Validate Intel IT customization of OpenStack
· Document best practices
· Share best practices with enterprises and services providers

Enable Enterprises & Cloud Service Providers to deploy Open Clouds

1Source: OpenStack Grizzly Press Release 4/4/13 (https://www.openstack.org/software/grizzly/press-release) Top Contributors to Grizzly by Employer: Red Hat, Rackspace, IBM, HP, Nebula, Intel, eNovance, Canonical, VMware, Cloudscaling, DreamHost and SINA.
3

Key Intel Contributions

Contribution Trusted Filter

Project Nova

Release Folsom

Trusted Filter UI

Horizon

Folsom

Filter Scheduler

Cinder

Grizzly

Multiple Publisher Support
Open Attestation SDK

Ceilometer

Havana To Open Source

COSBench

To Open Source

Comments
Place VMs in Trusted Compute Pools
GUI interface for Trusted Compute Pool management Intelligent scheduler allocates storage based on workload Pipeline manager; pipelines of collectors, transformers, publishers
Remote Attestation service for Trusted Compute Pools
Object store benchmarking tool

4

Trusted Compute Pools

Place workloads & VMs in trusted pools of virtualized
servers

Untrusted

Trusted Pool

Solution stack requirements
· Policy Engine / Console to Mgr · CPU that initiates a trusted boot · TCG Compliant Platform (TPM)
standard

VM

VM VM

VM VM

Core technologies
· Intel®Xeon®processor E3, E5 and E7 · Intel Trusted Execution Technology · Intel VT FlexMigration

Use Cases

5

18

Trusted Compute Pools on OpenStack using Open Attestation with Intel TXT

Intel contributed Trusted Filter to OpenStack in 2012
Intel SSG developed open source Attestation Server in 2012

Cinder

Intel enabled TXT in Xen 3.2 and Linux/KVM kernel in 2.6.33

Keystone

· Subscriber specifies trust

level of VM as Trusted

· Request passes to OpenStack Nova scheduler

· Scheduler invokes web-based remote attestation (Open Attestation) service

· Based on results, scheduler schedules Trusted VM to trusted platform

6

Introducing COSBench
· An Intel-developed benchmarking tool to measure Cloud Object Storage (e.g. OpenStack Swift) performance
· Released to Open Source today

Throughput Bandwidth

Response Time

· Compare performance of cloud object stores · Evaluate internal options for software stacks

Success Ratio · Identify bottlenecks and tune performance

https://github.com/intel-cloud/cosbench
7

Major Features

COSBench
Admin Console (UI)
Controller/Driver (Execution Engine)
OGSi

Config. xml

Adaptor Adaptor

Adaptor

Storage System
* Other names and brands may be claimed as the property of others. 1 Windows tested with Mock Storage only.
8

· Developed with Java*, OSGi framework based. · Supports multiple operating systems.
­ Ubuntu 12.04 LTS*, Red Hat Enterprise Linux 6.1*, Microsoft* Windows* 71.
· Distributed load testing framework. · Pluggable adaptors for different storage
systems
­ OpenStack * Swift and Amplidata * Amplistor *v2.3, 2.5 and 3.1adaptors included
­ Allows development of adaptors for additional storage systems
- Web based UI
- Real-time performance monitoring
- Flexible workload definition.

Filter Scheduler (Cinder)

"A new intelligent scheduler allows cloud end users to allocate storage based on the workload, whether they are looking for performance, efficiency, or cost effectiveness."
OpenStack Grizzly Press Release 4/4/13 (https://www.openstack.org/software/grizzly/press-release)

Volume Service 1

Volume Service 1

Winner!

Volume Service 2

Volume Service 2

Weight = 25

Volume Service 5

Volume Service 3 Volume Service 4 Volume Service 5

Filters

Volume Service 3

Volume Service 4
· AvailabilityZoneFilter

· CapabilitiesFilter · JsonFilter

Volume Service 5

· CapacityFilter

· RetryFilter

Weighers

Weight = 20

· CapacityWeigher

Weight = 41

· AllocatedVolumesWeigher

· AllocatedSpaceWeigher

Volume Service 2 Volume Service 4

Example Use Case: Differentiated Service with Different Storage Back-ends

· Cloud provider has 3 different storage systems and wishes to provide 4 levels of volume services
· Volume service criteria dictates which storage system can be used · Filter scheduler allows provider to name storage services and, using
capabilities in extra specs, allocate correct volume

9

Multiple Publisher (Ceilometer)
· Send one single datum to multiple consumers
· Send/publish collected measurements to different endpoint/utility through different conduits with different format

Pipeline Manager

Data Collector

Transformer Transformer Transformer

Metering Monitoring Publisher Publisher

Publisher
· System has multiple data collectors; pipeline manager creates multiple pipelines

10

Multiple Publisher (Ceilometer)
· Multiple publishers transform collected measurements into different formats through different conduits
· Transformers are organized as a pipeline to transform data from counter to meter, metrics etc.
· Five components for multiple publisher support
­ Data collectors: collect measurements from other openstack project. ­ Transformers: transform the data from data collectors or from other transformers. ­ Publishers: publish data to the world through conduit. ­ Pipeline: chaining the data collectors, transformers and publishers together.
Multiple pipeline exists in the system. ­ Pipeline Manager: manages the pipelines in the system. The measurement
collected from the collector will be dispatched to the pipeline manager.
11

Future OpenStack Releases
· Looking for continued collaboration with the OpenStack community in the following areas

Proposal

Target Release

Enhanced Platform Awareness Havana

Utilization Based Scheduling Havana

Host monitoring

Havana

Key Manager

Havana

Erasure Code

Havana

Comment
Leveraging PCIe devices in cloud infrastructure
Better scheduling according to the compute resources collected Physically monitoring on CPU, memory, network, disk etc of computes in Ceilometer Makes data protection more readily available via server side encryption with key management
Replacing tri-replication algorithm in Swift

12

Consumers

Intel® IT Open Cloud IaaS Platform Solution Stack

GUI
(Graphical User Interface)

API
(Application Programming Interface)

Release Cadence
3 Months

Interfaces

Monitoring As a Service

Manageability
Watcher (e.g. Nagios*)
Cloud Operating Environment

Compute (Nova)

OS Images (Glance)

Intel Contributions
Decider (internal)

Open-Source Foundation

Actor (e.g. Puppet*)

Collector (Mongo and HDFS)

Intel Contributions

Open-Source (OpenStack*)

Dashboard (Horizon)
Block Storage (Cinder

Object Storage (Swift)

Network (Quantum)

3 Months
6 Months

Infrastructure As a Service

Contributors

Producers
Physical Infrastructure

Compute
13

Storage

Network

12-18 Months

Current Infra/App Status
Open Cloud Utility Abstraction Layer ­ API/CLI

DevOps

Provision ­ Change - Destroy Load Balancers

Code/Packages/Apps/Data

Compute Storage Network

(Nova)

(w/Compute)

(Nova)

OpenStack Essex 2 Data Centers

14

Provision ­ Change - Destroy Load Balancers
Code/Packages/Apps/Data 3rd Party Cloud

Global Load Balancer

Consumers (People and Services)

Design Pattern : Active/Active

· App deploy to N+1 clouds
· Eventual consistency and conflict resolution is built into the developer application
· Database replication is configured
· App URL is added to GLB to actively distribute across app instances
· Users connect to any app instance ­ runs simultaneously
15 15

Global Load Balancer

End User Clients

Load Balancer

Load Balancer

App 1 instance 1 App 1 instance 2 Application Stack
Cloud Zone #1

App 1 instance 1 App 1 instance 2 Application Stack
Cloud Zone #2

Database

Eventual consistency
Conflict resolution provided by App

Database

Legal Information
·Copyright © 2013 Intel Corporation. All rights reserved. Intel, the Intel logo, Xeon are trademarks of Intel Corporation in the U.S. and/or other countries. *Other names and brands may be claimed as the property of others.
·All products, computer systems, dates and figures specified are preliminary based on current expectations, and are subject to change without notice.
·The products described in this document may contain design defects or errors known as errata which may cause the product to deviate from published specifications. Current characterized errata are available on request. Contact your local Intel sales office or your distributor to obtain the latest specifications and before placing your product order.
·No computer system can provide absolute security under all conditions. Built-in security features available on select Intel® processors may require additional software, hardware, services and/or an Internet connection. Results may vary depending upon configuration. Consult your system manufacturer for more details. For more information, see http://security-center.intel.com/
16

17

BACK-UP SLIDES
18

Filter Scheduler (Cinder)

"A new intelligent scheduler allows cloud end users to allocate storage based on the workload, whether they are looking for performance, efficiency, or cost effectiveness."
OpenStack Grizzly Press Release 4/4/13 (https://www.openstack.org/software/grizzly/press-release)

· Use Case A: Differentiated Service with Different Storage Back-ends
­ Example Cinder volumes
 type 1: name `standard', with extra specs {`volume_backend_name': `Storage System A'}  type 2: name `fast-n-safe', with extra specs {`volume_backend_name': `Storage System B'}  type 3: name `premium-x1', with extra specs {`QoS': `false', `fast snapshot': `true'}  type 4: name `premium-x2', with extra specs {`fast clone'': `true', `fast snapshot': `true',
`QoS:level': `guarantee:200IOPS'}

· Use Case B: Differentiated Service with Single Powerful Storage Back-end
­ Example Cinder volumes
 type 1: name `standard', with extra specs {`QoS': `true', `QoS:level': `best_effort:80IOPS', `Reliability:backup':'no'}
 type 2: name `fast-n-safe', with extra specs {`QoS': `true', `QoS:level': `best_effort:150IOPS', `Reliability:backup':'auto'}
 type 3: name `premium-x1', with extra specs {`QoS': `true', `QoS:level': `best_effort:150IOPS', `Reliability:backup':'auto', `Feature:Enable': `fast snapshot'}
 type 4: name `premium-x2', with extra specs {`QoS': `true', `QoS:level': `guarantee:200IOPS', `Reliability:backup':'auto', `Feature:Enable': `fast snapshot, fast cloning'}
19

Future OpenStack Releases

· Looking for continued collaboration with the OpenStack community in the following areas:

· Leveraging PCIe devices in cloud infrastructure
· Making data protection more readily available via server side encryption with key management

Read/Comment on Blueprints Enhanced Platform Awareness for PCIe: https://blueprints.launchpad.net/nova/+spec/epa-for-pciedevices
Key Manager: https://wiki.openstack.org/wiki/KeyManager

· Replacing tri-replication algorithm in Swift with Erasure Code

Erasure Code: https://blueprints.launchpad.net/swift/+spec/swift-ec

20

