ArchSummit 2015

 Rancher Labs

Growth of Devices and Apps
Growth of Big Data and Analytics
Growth of Internet of Things

Growth of Datacenters

Data center industry in transition

Company
HP NetApp Cisco EMC IBM

Last report date
Oct 31 2015 Nov 18 2015 Nov 12 2015 Oct 21 2015 Sep 20 2015

Quarterly revenue $25.71B $1.45B $12.7 $6.08B $19.29B

YoY growth
-9.5% -6.4% +4% +1% -14%

Gartner IaaS Magic Quadrant

2014
AWS 5x capacity of the nearest 14
competitors combined

2015
AWS 10x capacity of the nearest 14
competitors combined

Cloud IaaS is not a commodity. Lydia Leong, Gartner

What about private cloud?

Why has OpenStack not succeeded?

The real problem: built it, but nobody came

Private Cloud == vSphere

Where do we go from here?

VMware and AWS Revenue (in $1000,000s)
8000

7000

6000

5000

4000

3000

2000

1000

0 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015

VMware

AWS

Docker bursts onto the scene

What is Docker?
· Not a replacement for VM · As an application packaging format, it is similar to JAR, rpm, etc.

JAR WAR
Tomcat (.tgz)

Mysql (rpm)

Linux

JAR WAR Tomcat

Mysql

Linux w/ Docker daemon

You do not have to use microservices to run Docker

Why do people use Docker?

One benefit: higher resource utilization

Load Balancer

App 1.0

App 1.1

VM1

VM2

Load Balancer

App 1.0

App 1.1

VM1

But more importantly: consistent developer experience

Fact: vast majority of Docker users run on AWS

Developer

Operations

The new private cloud: private container service

Linux

Private Container Service

Linux

Linux

Linux

Linux

Linux

What is in a private container service

Private Container Service

Linux

Linux

Linux

Linux

Linux

Linux

Resource Mgmt Scheduling Orchestration App Catalog Access Control Monitoring Security Overlay Network Firewall Load Balancer Block Storage File Storage Object Storage Distributed DB and more ...

What is in a private container service

Private Container
Service
DCOS

Resource Mgmt Scheduling Orchestration App Catalog Access Control Monitoring Security Overlay network Firewall Load Balancer Block Storage File Storage Object Storage Distributed DB

Docker Machine Swarm, Kubernetes, Mesos Compose, Kubernetes, Marathon, TOSCA Helm, Rancher LDAP, AD, GitHub Stats, Healthchecks, Sysdig, Datadog, etc. Notary, Kubernetes, Vault VXLAN, IPSEC, etc. iptables HAProxy, ngnix, iptables Ceph, EBS, SAN, etc. Gluster, EFS, NAS, etc. Swift, S3, etc. etcd, consul, mongo, DynamoDB, etc.

Implications of private container services
· Computing resources are a commodity · Consistent DevOps environment from laptop to cloud
Private Container Service

Development

Test

Production

An analogy
Browser

What about PaaS?
Build/Deploy Pipeline PaaS
Private Container Service IaaS

Miraculous growth of DigitalOcean

Simplicity wins

Two ways of automating application management at scale
Apps

Config Management Chef, Puppet, Ansible, ...

Container Orchestration & Scheduling Swarm, Kubernetes, Mesos, ...
...
Hosts

What container services give us

Manual Application Deployment and Upgrade
Differentiated Infrastructure
Cost without Containers

Automated App Mgmt Commoditized Infrastructure
Cost with Container Services

One Last Thing

Container live migration is coming

Private Container Service

Data Center

Cloud

AWS spot and on-demand instance

Cost of Resources

On-demand instance price

Spot instance price Cloud lightly utilized

Starts to kill and reclaim spot instances
Cloud highly utilized

By monitoring spot instance price, we can know 5-10 minutes in advance that AWS will kill and reclaim spot instances

Rancher and Spotinst work together can save your AWS and GCE bill by 70-90%
More info http://sina.lt/eAAk

Questions? sheng@rancher.com

