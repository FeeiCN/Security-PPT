SESSION ID: PART2-W09
Stopping the Proliferation of IoT Botnets: Is Dynamic Analysis the Answer?

Mounir Hahad, Ph.D
Head of Juniper Threat Labs Juniper Networks @MounirHahad

Khurram Islah
Sr Staff Engineer Juniper Networks

#RSAC

#RSAC
Agenda
IOT and Botnet Landscape Why should we care about botnets? State of the art in detection Analysis of IOT botnet behavior Dynamic Behavior Analysis of Botnet Stages Integrating Machine Learning Efficacy Results Practical Application
Juniper Business Use Only

#RSAC
IOT and Botnet Landscape

Drivers of IOT adoption

55%

48%

47%

43%

#RSAC
20B devices by 2020
Gartner

30%

Build more Expand operations Boost asset

responsive, visibility and gather availability, reduce

connected

data to improve

equipment

products to

efficiency

downtime

improve customer

experience

Reduce costs through smarter
energy management

New revenue streams from new business model or
new services

4
Juniper Business Use Only

1% Other

IOT Proliferation
Connected Home

Connected Car

#RSAC Security and Surveillance

Healthcare Retail

Network

High

Highly

Performance Scalable

Low Latency

Highly Secure

Industrial - Smart Grid

Transportation Smart City

Juniper Business Use Only

Top IoT Security Challenges

Hard-to-detect sophisticated IoT threats, such as zero-day attacks

Compliance
Inability of disparate security systems to work together, causing response delays even after the threat has been detected
Not enough staff to keep up

Too many different dashboard and alerts

Automated remediation

Lack of visibility

Lack of modeling and simulation

Other

3%

Juniper Business Use Only

#RSAC

39% 37% 36% 32% 28% 27% 23%

51%

#RSAC
How often do you get attacked each day?

4640 Probes

908 Attackers
18s

7
Juniper Business Use Only

#RSAC
Most prominent IOT botnets
Mirai, Miori, Satori
­ Botnet for all ­ Dyn attack at 1.2Tbps
Hajime
­ Self updating, brute force telnet
Persirai
­ Self defending
Brickerbot
­ Fights back other botnets, bricks devices
8
Juniper Business Use Only

#RSAC
Most Used Usernames & Passwords in brute force attack

master plcmspip
22 nobody 111111 manager
1234 administrator
operator nagios ftpuser default ftp adm guest telnet admin root
0

5,000

10,000

115,611 15,000 20,000

1111 7ujMko0admin
test ubnt admin123 987654321 master 123 password 111111 12345678 manager 1234 12345 123456 telnet [Blank] admin
0

114,567 500 1,000 1,500 2,000 2,500 3,000 3,500

9
Juniper Business Use Only

#RSAC
Target Architectures
10
Juniper Business Use Only

Why should we care?

DDoS Attacks

Cryptomining

IOT Botnet

Data exfiltration

Destruction

11
Juniper Business Use Only

#RSAC

#RSAC
Existing methods for malicious activity detection

REPUTATION

STATIC ANALYSIS

DYNAMIC ANALYSIS

NETWORK SIGNATURES

· File Hash · C&C IP · URL Category · Domain name · Geolocation · Server Certificate

· Signature matching · Packer Identification · Import Hash · Yara rules

· Behavioral Analysis (Sandbox)
· Memory Dump · Network Traffic · Binary Rewrite

· IPS signatures

12
Juniper Business Use Only

#RSAC
Existing methods for malicious activity detection

REPUTATION

STATIC ANALYSIS

DYNAMIC ANALYSIS

NETWORK SIGNATURES

· File Hash · C&C IP · URL Category · Domain name · Geolocation · Server Certificate

· Signature matching · Packer Identification · Import Hash · Yara rules

· Behavioral Analysis (Sandbox)
· Memory Dump · Network Traffic · Binary Rewrite

· IPS signatures

13
Juniper Business Use Only

#RSAC
Analysis of IOT botnet behavior
Host and Network behavior

#RSAC
IoT Botnet Attack Life Cycle
IOT botnet attacks show similar life cycle regardless of their variant or the malware family they belong to. 15
Juniper Business Use Only

Stage 1: Host discovery on open ports

Bot resets the three-way TCP handshake with host after receiving acknowledgment on service port.

1: Send SYN request to host

[SYN]

2: Receive host response

[SYN, ACK]

3: Terminate TCP handshake

[RST]

Standard three-way TCP handshake

#RSAC

Bot resets TCP handshake

16
Juniper Business Use Only

Stage 1: Host discovery on open ports

Bot resets the three-way TCP handshake with host after receiving acknowledgment on service port.

1: Send SYN request to host

[SYN]

2: Receive host response

[SYN, ACK]

3: Terminate TCP handshake

[RST]

Host discovery aggressive attempts on network:

Standard three-way TCP handshake

#RSAC

Bot resets TCP handshake

17
Juniper Business Use Only

Stage 1: Open port backdoors
Bots scan the network to search for open port backdoors.
Open port backdoor could be exploited to: 1. Steel private information. 2. Remotely control a device. 3. Perform a Denial of Service Attack. 4. Inject Malicious code that could jumpstart
botnet attacks.
18
Juniper Business Use Only

#RSAC

Stage 1: Open port backdoors
Bots scan the network to search for open port backdoors.
Open port backdoor could be exploited to: 1. Steel private information. 2. Remotely control a device. 3. Perform a Denial of Service Attack. 4. Inject Malicious code that could jumpstart
botnet attacks.

Port 55555 vulnerability

19
Juniper Business Use Only

#RSAC
SG Ports Database

Stage 2: Remote code execution (example 1)
Bot attempts to exploit vulnerability on host running PHP framework on Apache2.
Remote code execution was performed using unauthenticated getshell vulnerability. Bot exploits the vulnerability on the host with HTTP GET transaction.

#RSAC

20
Juniper Business Use Only

Stage 2: Remote code execution (example 1)
Bot attempts to exploit vulnerability on host running PHP framework on Apache2.
Remote code execution was performed using unauthenticated getshell vulnerability. Bot exploits the vulnerability on the host with HTTP GET transaction. Shell execution was invoked on the host using PHP function call.

#RSAC

21
Juniper Business Use Only

Stage 2: Remote code execution (example 2)
Bot attempts to exploit the vulnerability on host running Realtek router, camera, or phone.
Remote code execution was performed using Universal Plug an Play (UPnP) vulnerability. Bot exploits the vulnerability on the host with HTTP POST transaction. SOAP Protocol was used for command injection.

#RSAC

22
Juniper Business Use Only

Stage 2: Remote code execution (example 3)
Bot attempts to exploit vulnerability on host running Cisco Linksys router.
Remote code execution was performed using the ttcp_ip parameter vulnerability. Bot exploits the vulnerability on the host with HTTP POST transaction. Commands were executed on the system with elevated privileges.

#RSAC

23
Juniper Business Use Only

Stage 2: Remote code execution (example 4)
Bot attempts to exploit vulnerability on host running Huawei router.
Remote code execution was performed on port 37215. Bot exploits the vulnerability on the host with HTTP POST transaction. SOAP Protocol was used for command injection.

#RSAC

24
Juniper Business Use Only

#RSAC
Stage 3: Malware execution behavior on host
Compromised host connects to the C&C Server to inform about successful exploitation.
25
Juniper Business Use Only

#RSAC
Stage 4: Using Botnet for DDoS attack

Distributed denial of service (DDoS) flood attacks.

Network patterns observed:
1. UDP Flood: UDP packets flood random ports on a target.
2. DNS Attack: Spoofed UDP packets sent to target's DNS service.
3. Network Bandwidth Exhaustion: UDP packets sent to saturate target's network resources.
4. TCP SYN flood: TCP handshake not completed by not replying to target [SYN/ACK] response.
5. TCP ACK flood: Spoofed TCP packets sent to target.
6. STOMP flood: STOMP requests sent to target to saturate network resources.
7. HTTP GET/POST requests sent to consume target's web services.

Mirai Source Code
26
Juniper Business Use Only

Observations: Summarized
IoT bots show various network characteristics when executed successfully on the host: ­ Network scan on open ports. ­ Identical payloads across independent sessions. ­ Remote code execution on host with network protocols. ­ Malware pre-programmed activities related to C&C servers. ­ Dropped files network connections. ­ Network attack behavior. Injected malware performs various system level malicious activities on the host: ­ System services interruption. ­ System files modification. ­ System privileges alteration. ­ System start-up routine changes.
27
Juniper Business Use Only

#RSAC

#RSAC
Dynamic Behavior Analysis of Botnet Stages

Juniper IoT Dynamic Analysis Platform
A dynamic analysis platform is created where: 1. Injected malware could be analyzed
in a sandbox environment. 2. Network traffic could be analyzed to
extract malicious activities. 3. Malware families with different CPU
architecture could be analyzed. 4. Malware could not circumvent
detection as well as analysis.

#RSAC
Network features analysis

Host features analysis

29
Juniper Business Use Only

#RSAC
Dynamic Analysis detection on Botnet Stages

Network scan on open ports Connects to IPs and resets
Connects to non-standard ports

Identical payload found across independent sessions

Posts data

Remote code executed on host

Network features analysis

Dropped files downloaded DNS query to C&C server C&C Server connections established
Multiple connections to destination

Next, assign weights to features.

Self destructs after installation High CPU usage
Gets system information

Host features analysis

System files modified

System privileges altered System services interrupted System start-up modified

Downloads files Spawns new process

30
Juniper Business Use Only

#RSAC
Supplement Mining based detection
Signature based detection: ­ Attack signatures are created with the information of known vulnerabilities. ­ High Accuracy rate for known attacks. ­ Cannot detect unknown attacks. Machine Learning based detection: ­ In Machine Learning supervised approach, network flow data is used in training
phase. ­ Known malicious activities could be recognized with high accuracy and low false
alarm rate.
31
Juniper Business Use Only

#RSAC
Integrating Machine Learning

ML framework for Dynamic Analysis
Data collection

Sampling

Data preprocessing Feature Engineering
Vectorization

Training Data

Test Data

Learning Algorithms Logistic Regression

Support Vector Machine Decision Tree Random Forest

Model

kNeighbors

AdaBoost

GradientBoosting ...

33
Juniper Business Use Only

Model Evaluation ROC, Recall, F1 score
Accuracy, Precision

#RSAC

#RSAC
Solution: Juniper IoT Dynamic Analysis Platform
34
Juniper Business Use Only

#RSAC
Efficacy Results
ML based Dynamic Analysis

ML Classifications

Performance Metric to evaluate Models:

i. The model is learned by gradually incorporating easy to more complex samples and features into training.

ii. Initially, train the models on dataset with Host based features only.

iii. Improve model accuracy:

i.

Reduce Overfitting with cross-validation.

ii. Interpret feature importance.

iii. Fine tune algorithm parameters.

iv. Treat missing and outlier values.

iv. Augment Network based features to the features-set and train models.

v. Similarly, perform feature selection on remaining features based on feature importance.

Classifications based on Host based feature-set

Decision Tree

AdaBoost

SVC

KNeighbors

Random Forest

Classifications based on easy to more complex feature selection Random Forest

Random Forest

#RSAC

36
Juniper Business Use Only

#RSAC
Random Forest Model Efficacy
Version 1.3
37
Juniper Business Use Only

#RSAC
ML Host based feature vectors
38
Juniper Business Use Only

ML Network based feature vectors

IP flux and Domain fluxing.
Feature vectors: · Numerical ratio in domains. · Frequency of requests. · Interval between requests. · Number of failed queries. · Number of MX records. · Number of PTR records. · IP to domains ratio. · Domain to IP ratio.

Network Anomaly.
Feature vectors: number of different IP requests. number of ports request on same IP. IPs deviation. IRC and HTTP detection. number of successful flows. number of flows per IP. number of packets per flow.

#RSAC

39
Juniper Business Use Only

#RSAC
Port features weight in ML Model

SSH HTTP Telnet Secure SIP UPnP WSP App Telnet HTTP Rockwell Rockwell TR069 HTTP Alternate HTTP Alternate HTTP Alternate App UPnP App SMTP SIP

22 80 23 5061 37215 9200 8291 2323 81 2223 2222 7547 8081 8090 8080 37777 37215 2332 25 5060

Remote access shell service usually open on IoT devices. Web app service open on many IoT devices. Remote access shell service open by default on IoT devices. Service on VoIP phones and Video Conferencing IoT devices. SOHO Routers. WAPs. Service open on SOHO routers. Alternate Remote access shell service open by default on IoT devices. Alternate Web app service open on many IoT devices. ICS. ICS. Service open on CCTV, SOHO routers. DVRs. Webcams. Service open on SOHO routers, Smart Sprinklers, ICS. DVRs. SOHO Routers. Cellular gateways. Service on IoT devices. Service on VoIP phones and Video Conferencing IoT devices.

37215 37777 52869

2223 2332 5061

8090 9200

8081

2222 25 81
2323 8291

7547

HTTP 8080 SIP 5060

Telnet 23

HTTP 80

Ports

40
Juniper Business Use Only

SSH 22

#RSAC
Practical Application

Apply What You Have Learned Today
Your IoT devices could be in any of the three possible states:
Periodic Maintenance:
­ Periodically update IoT devices to latest stable versions. ­ Periodically install latest vulnerability patches on devices. ­ Implement strong passwords and restrict admin account access.
In the first three months following this presentation you should:
­ Deploy an IoT based monitoring solution on your network. ­ Understand who is accessing IoT devices in your network, from where and why. ­ Define appropriate permissions and protocols for IoT devices in your organization.
Within six months you should:
­ Select a security solution which detects and prevents IoT based malicious attacks in your organization. ­ Deploy a security solution that meets your organization needs to protect critical resources in your network.
42
Juniper Business Use Only

#RSAC

#RSAC
Juniper cloud security solution
43
Juniper Business Use Only

#RSAC
Juniper on-premise security solution
44
Juniper Business Use Only

#RSAC
Thank You!
Q&A

