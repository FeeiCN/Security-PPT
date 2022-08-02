Insights and Experiences from Monitoring Multiple P2P Botnets
Leon Böck, Shankar Karuppayah, Valentin Sundermann, Max Mühlhäuser, Dave Levin
28.04.2022

Monitoring multiple botnets
· Blind men and the elephant · How (dis-)similar are botnets?
· Affected devices · Behavior over time · Affected regions · Dynamics
· P2Pwned ­ Rossow et. al[1] · Long Term Tracking and Characterization of P2P Botnet [2] · What has changed with new IoT botnets?
[1] Christian Rossow, Dennis Andriesse, Tillmann Werner, Brett Stone-Gross, Daniel Plohmann, Christian J. Dietrich, Herbert Bos: SoK: P2PWNED - Modeling and Evaluating the Resilience of Peer-to-Peer Botnets. IEEE Symposium on Security and Privacy 2013: 97-111 [2] Jia Yan, Lingyun Ying, Yi Yang, Purui Su, Dengguo Feng: Long Term Tracking and Characterization of P2P Botnet. TrustCom 2014: 244-251

28.04.2022

Leon Böck

3

Challenges and Motivation
Human Effort · Reverse Engineering · Implementing Crawlers · Data analysis
Resource constraints and requirements · Size and number of botnets · Anti-monitoring mechanisms · (Local) network limitations

28.04.2022

Leon Böck

4

Challenges and Motivation
Human Effort · Reverse Engineering · Implementing Crawlers · Data analysis
Resource requirements · Size and number of botnets · Anti-monitoring mechanisms · (Local) network limitations

28.04.2022

Leon Böck

5

P2P Botnets
Unstructured

Structured

Parasitic

28.04.2022

Leon Böck

6

Crawlers and Sensors

28.04.2022

Leon Böck

7

Botnet Monitoring System

28.04.2022

Leon Böck

8

Live Preview ­ Overview

28.04.2022

Leon Böck

9

Live Preview ­ Single Botnet

28.04.2022

Leon Böck

10

Live Preview ­ Geolocations

28.04.2022

Leon Böck

11

Live Preview ­ ASes

28.04.2022

Leon Böck

12

Live Preview ­ Counting Comparison

28.04.2022

Leon Böck

13

Live Preview ­ Botnet Comparison

28.04.2022

Leon Böck

14

Anomalies in Mozi ­ Diurnals or Throttling?
Zhu et. al *

* Pengxiong Zhu, Keyu Man, Zhongjie Wang, Zhiyun Qian, Roya Ensafi, J. Alex Halderman, Hai-Xin Duan: Characterizing Transnational Internet Performance and the Great Bottleneck of China. Proc. ACM Meas. Anal. Comput. Syst. 4(1): 13:1-13:23 (2020)

28.04.2022

Leon Böck

15

Botnet Monitoring System

28.04.2022

Leon Böck

16

Backend ­ Database Format

Replies:
· Any kind of interaction with a bot at the specified time

timestamp 2022-04-... 2022-04-...

ip 1.2.3.4 4.3.2.1

port 1337 42

· Crawlers, Sensors, Honeypots, etc.

Edges:

· P2P-specific

· Enables graph analysis

· Crawlers

timestamp Src_ip

Src_port Dst_ip

Dst_port

2022-04-.. 1.1.1.1 2022-04-.. 2.2.2.2

1000 2000

2.2.2.2 3.3.3.3

2000 3000

id null 383838..

json null V389

Src_id null null

Dst_id null null

28.04.2022

Leon Böck

17

Backend ­ Communication
Simple solution: · Distributed crawlers with centralized DB

Drawbacks: · No validation / authentication · "one way" communication · No coordination possible
· Circumvent countermeasures · Dynamic resource allocation
=> Using a custom API

28.04.2022

Leon Böck

18

BaseCrawler
Features: · Backend and API connection · Queuing and parallelized crawling
· 20k+ simultaneous connections
· Removal of unresponsive peers · TCP and UDP
· Implements custom retry mechanism for UDP
· 2-Queue system to minimize slow down by unresponsive peers

28.04.2022

Leon Böck

20

BaseCrawler ­ Double Queue

28.04.2022

Leon Böck

21

BaseCrawler ­ Example HnS
Most simple case: 2 Functions · SendPeerRequest · ReadReply
BaseCrawler calls methods and processes the output

28.04.2022

Leon Böck

22

Ongoing and Future Work
· Automated measurement of Churn and lifetimes
· How long do bots remain active?
· Sensor / Crawler detection
· Analyze if we can detect ourselves · Filter out activities of other researchers
· Coordination
· Dynamic load allocation · Circumventing anti-monitoring mechanisms

28.04.2022

Leon Böck

23

Availability
· We are happy to collaborate directly · Access to source code upon request · Selected dashboards will be made public soon · Contact us at: botnets@tk.tu-darmstadt.de

28.04.2022

Leon Böck

24

Summary
· Measuring multiple botnets provies unique insights
· Geographic differences · Diurnal patterns · IP / ID counts may not be comparable
· BMS enables resource efficient monitoring · Availability: botnets@tk.tu-darmstadt.de

28.04.2022

Leon Böck

25

