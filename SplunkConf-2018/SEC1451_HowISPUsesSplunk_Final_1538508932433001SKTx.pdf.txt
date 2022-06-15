© 2018 SPLUNK INC.
How an ISP Uses Splunk Enterprise Security
To protect 24M subscribers from 100M attacks daily
Kyoung Geun Lee | SK Broadband Seung Don Choi | Splunk
October 2018 | Version 1.0

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Our Speakers

© 2018 SPLUNK INC.

v
KYOUNG GEUN LEE
SK Broadband NW Security Team Security Tech Engineering & SOC Operation

SEUNG DON CHOI
Splunk Senior Sales Engineer

Where's North South Korea?
https://www.youtube.com/watch?v=-ugJZhL-cbc

© 2018 SPLUNK INC.

Did You Know...?

© 2018 SPLUNK INC.

 South Korea has the fastest average internet connection, 4x world avg  1Gbit/s connection ­ 142x world avg, 79x US avg

https://en.wikipedia.org/wiki/Internet_in_South_Korea https://www.fastmetrics.com/internet-connection-speed-by-country.php#top-10-comparison-2017

https://www.netmanias.com/en/?m=view&id=reports&no=13836

SK Broadband
South Korean based Tier 1 ISP, Media Platform(IPTV) Service Provider
 Founded 1997, 2000 Employees  World First commercialized ADSL service  ISP, IPTV ­ total 14M subscribers  Mobile IPTV (Oksusu) - 9M subscribers

© 2018 SPLUNK INC.

Security Challenge on the ISP Network
More Traffic , More Threats

© 2018 SPLUNK INC.

 220 PB Daily , 18.3Tbps peak time  More DDoS attack: 600~1,000 DDoS Attack Daily, 256Gbps peak time this year
 DDoS, SCAN, Malware, Reflection Attack

Security Challenge on the ISP Network
Vulnerability on your ICT devices

© 2018 SPLUNK INC.

SK Broadband Network Topology

 Home router, ICT, IoT devices cause security leaks
 More advanced hacking technique
 New Type of Security Threat increased · Wannacry · Faked DNS · Busybox command injection(IoT) · Zeroday attacks · Advanced Malwares
...

Network Security Center
 N/W Security, Service Infra Security, B2B security(DDoS cleanzone)

© 2018 SPLUNK INC.

Service Infra Security

Clean Network Pipe

Complex Architecture Massive Scale of Data Traffic New Security Threats

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
SK Broadband Network Security Platform
Splunk Enterprise 7.1 + Enterprise Security 5.1 + SKB NW Security Framework

Scalable DataStore

Monitoring

Search & Analyze

Alert

Risk Scoring Framework

Event Correlation Analytics

Dashboards

Machine learning

Security Intelligence Map

Notable Events

Adaptive Response

Open Security Platform

Intrusion Detection& Prevention

SK Broadband Network Security Framework

Malware Detection Sys.

N/W Traffic Anomaly Detection

Flow/DNS traffic

Threat Intelligence

Vulnerability Scans

N/W Protection

Data Sources

 IDS / IPS, Malware

6B Events Per Day

 DNS, Netflow, DHCP, stream

 Penetration test result/Vulnerability scan result

 SKBB Cyber Threat Intelligence

 Asset Information

© 2018 SPLUNK INC.

# of events/Days

sourcetypes

SKB Security Platform Security Posture
Team Transformation with Customized Domain

© 2018 SPLUNK INC.

SoC Organization Structure

© 2018 SPLUNK INC.
Leverage Adaptive Response to Real Time Action
 Send suspicious IP to blackhole/ DNS sinkhole, URI block, send SMS, route message to call center/on-site engineers
Notable Event

Custom Swim Lane for Deeper Analysis
Increase End-to-End Visibility , Faster Resolution time

© 2018 SPLUNK INC.

Threat Intelligence
SK Broadband SoC Workflow

© 2018 SPLUNK INC.

Intrusion Detection& Prevention

Malware Detection Sys.

Security Events

Notable Events SKBB SoC Analysts

N/W Traffic Anomaly Detection

Flow/DNS traffic

+

Vulnerability Scans

N/W Protection

Policy/Threat update

Cyber Threat Intelligence Service

Security Analysis Threat Information update

© 2018 SPLUNK INC.
Bundle Size Matters
IPs in ISP are huge. So huge
 Large + High cardinality IP/DNS lookup can be problematic  Search Head Cluster Issues  Managing Bundle Size is important, pre-shipped threat/lookup gen searches can cause issues

Customize Your mmdb

© 2018 SPLUNK INC.

 Rebuild MaxMind mmdb column to add more context for lookup/iplocation

Original Column
City

Modified Column
ISP

Example SK Broadband co ltd

Country

Country

Republic of Korea

Region Metrocode

Country Code
ASN

KR 9318

timezone Lat/lon

37.5112/126.97410

© 2018 SPLUNK INC.
Summary

Splunk@SK Broadband Today
Before & After Splunk
 Daily Process Security Event: 100M à 6B  New Security Issue Investigation/Response Time : 180 min à 5 min  Daily Process Incident : 500 à 15,000  Daily Defensed Attacks : 200M

© 2018 SPLUNK INC.

Splunk@SK Broadband Tomorrow
What's Next?

© 2018 SPLUNK INC.

More Data!

Machine Learning!

Automation!

© 2018 SPLUNK INC.

Key Takeaways

1. Splunk Enterprise Security is very
customizable and Extendable.
2. Leverage Adaptive Response, for real
time action
3. You can use ES for ISP!

Thank You 
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

