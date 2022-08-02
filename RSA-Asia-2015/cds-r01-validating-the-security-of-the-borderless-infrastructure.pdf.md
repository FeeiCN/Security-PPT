SESSION ID: CDS-R01
Validating the Security of the Borderless Infrastructure

David DeSanto
Director, Product Management Spirent Communications, Inc.
@david_desanto

#RSAC

#RSAC
Agenda
2

#RSAC
The Adversary

#RSAC
The Adversary

Three Main Types of Attacks

 DDoS Attacks  Volumetric ­ Consume all bandwidth  Protocol ­ Consume all state (i.e., TCP state table)  Application ­ Consume or exploit application layer
4

 Exploits
 Targeting public facing services for vulnerabilities
 Used as the delivery mechanism for command and control channels (data exfiltration)
 Malware
 Advanced Persistent Threats / Targeted Persistent Threats
 Mobile malware for gaining traction for accessing sensitive data

#RSAC
The Adversary
 DDoS Attack Statistics
 SOURCE: Arbor Networks Tenth Annual Worldwide Infrastructure Security Report
5

#RSAC
The Adversary
 Application DDoS Attack Example  R.U.D.Y. (R-U-Dead-Yet)  HTTP Slow POST DoS attack  Targets web forms with never ending POST values  Easily scalable into an application DDoS attack  With little effort, website becomes unavailable
6

#RSAC
The Adversary
 Exploit and Malware Statistics
 SOURCE: Cisco 2015 Annual Security Report, Mandiant M-Trends 2015: A view from the front lines, McAfee Labs Threats Report June 2014
7

#RSAC
The Adversary
 Malware Example  Duqu 2.0 - Cyberespionage Advanced Persistent Threat (APT)  Known to have exploited three different zero-day vulnerabilities  Highly sophisticated anti-detection techniques  Command-and-control (C&C) mechanisms masked within image files  Known targets
 Kaspersky Lab  Iranian Nuclear Talks (P5+1 events)  European Telecoms Operator
8

#RSAC
The Borderless Infrastructure

#RSAC
The Borderless Infrastructure
"In the early years of this market, most data virtualization was focused primarily on the financial services, telecom and government sectors. In the past three years, however, Forrester has seen significantly increased adoption in other verticals, such as insurance, retail, health care, manufacturing and e-commerce."
The Forrester WaveTM: Enterprise Data Virtualization, Q1 2015 Forrester Research, Inc.
10

#RSAC
Server and Application to Virtual Deployments
Deployments within data centers as well as migration to the cloud
11

Application Delivery Controllers
Network Firewalls
Network IPS
Virtual Security and Content Delivery Deployments
Deployments within data centers as well as migration to the cloud
12

#RSAC

#RSAC
The Borderless Infrastructure
 North / South Traffic  Traffic entering from an external source into the virtual environment  This traffic may or may not go through other physical security equipment  Limit access to public facing applications and services  Only allow access on the protocols / ports needed  Inspect incoming requests for security risks and block any malicious traffic  Alert on malicious traffic
13

#RSAC
The Borderless Infrastructure
 East / West Traffic  Communications between virtual machines in different port groups or security zones  Virtual machines can reside on the same virtual host or different virtual hosts  Limit what applications or services can communicate between security zones  Confirm this traffic is the actual application  Inspect this traffic for security risks
14

Validating the Security of

#RSAC

This New Infrastructure

#RSAC
Validating the Security of This New Infrastructure
 Confirm only allowed traffic enters protected zones
 Confirm unwantedd traffic, whether by policy or malicious, is blocked from entering protected zones
 Measure impact of different types of policies  Time to first byte  QoS impacts in deployment
 Test how performance is impacted by the hypervisor deployment  Configuration of hypervisor  Different hypervisors
16

#RSAC
Validating the Security of This New Infrastructure
 North / South Testing
17

#RSAC
Validating the Security of This New Infrastructure
 East / West Testing
18

#RSAC
Validating the Security of This New Infrastructure

 Security Testing Lifecycle
 Upgrade component  Confirm policy is still working as
expected  Fuzz critical protocols to confirm
stability  Launch security attacks (all directions)  Report found issues to product vendor  Apply patches provided by product
vendor  Repeat process

Apply Patches From Vendor

Upgrade Infrastructure Component

Confirm Security Policy

Security Testing Lifecycle

Report Any Findings To
Vendor

Launch Security Attacks

Perform Fuzzing Testing

19

Key Takeaways

#RSAC
 The movement to virtual is increasing the threat landscape  DDoS  Malware  Exploits
 It is important to test all avenues for traffic  North / South  East / West
 Confirm only allowed, legitimate traffic is crossing through protected zones
 Only use testing solutions that provide a holistic view
20

#RSAC
Apply What You Learned Today
 Next week you should  Identify the critical paths within your virtual deployments (North / South, East / West)  Confirm only allowed traffic traverses security policies into protected zones
 Over the next four weeks you should  Implement the security testing lifecycle within your organization  Begin collecting metrics on
 efficacy of your security policies (i.e., are there holes you are unaware of?)  product updates (i.e., security efficacy, critical performance metrics)
 Over the next three months  Fully integrate security testing lifecycle within your organization  Begin reporting on how your organization is doing with its virtual security
21

Thank You!

#RSAC

@david_desanto https://www.linkedin.com/in/ddesanto

