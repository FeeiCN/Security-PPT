 
Real-time Log Analysis Tool with STIX 2.0
Interfaculty Initiative in Information Studies Graduate School of Interdisciplinary Information Studies, The University of Tokyo
Wataru Matsuda, Mariko Fujimoto, Takuho Mitsunag1a

Profile

 

Wataru Matsuda, Mariko Fujimoto, Takuho Mitsunaga
· Project researcher, Secure Information Society Research Group, the University of Tokyo (SiSOC)

· Job description:
Analysis and publication on cyber security Education for human resources for cyber security Presentations and lectures in seminars/universities etc.
· Publication/Works :
· CSIRT ­ from building to running ­ (coauthor) · Tracking mimikatz by Sysmon and Elasticsearch https://hitcon.org/2017/CMT/slide-files/d2_s1_r1.pdf

2

 
About Secure Information Society Research Group, the University of Tokyo
· SISOC-TOKYO researches on Internet security through collaboration with industry, academia and government.
­ SISOC-TOKYO gathers human resources through collaboration among industries, academia and government to research on social and international issues and widely reports on the analysis results.
­ SISOC-TOKYO promotes interdisciplinary research, human resource education and policy recommendation against issues on cyber space and security from a macro and longterm perspective.
3

Agenda
Background Challenges Solution Demonstration Conclusion

 
4

 
BACKGROUND
5

Background

 

· Cyber attacks become more sophisticated
· To detect cyber attacks, shared indicators such as C&C server domain and IP address can be useful
· Information sharing scheme has been developed globally, and indicator formats such as STIX are standardized during the past years
· As indicator exchange increases, however, there are new challenges to handle indicators, comparing increasing number of shared indicators against a large amount of logs
· In this presentation, we will present how our tool works for effective detection to take advantage of STIX

6

Indicator

 

· Indicators are information indicating the features of attacks
­ Host name, IP address and URL of C2 servers, etc.
Example 1 Malware's C&C server

Duration IP address (Outbound) Characteristics in communication Action (Detect, Block in Proxy log)
Example 2
Source of DDoS attack

Information

OK!

sharing

I'll Check it

Duration IP address (Inbound) Characteristics in communication Action(Detect, Block in Apache log)
7

 
Trends of information sharing
· Information sharing schemes have been developed globally in recent years
­ DHS has been operating AIS (Automated Indicator Sharing) since 2016
­ CIRCL (The Computer Incident Response Center Luxembourg) shares malware information through MISP
· STIX(The Structured Threat Information eXpression) was introduced by MITRE

(from https://www.circl.lu)

(from http://stixproject.github.io/getting-

started/whitepaper)

8

Challenges

 

· STIX is becoming more popular, and shared information is increasing through the STIX format
· We need to compare a large amount of logs with a number of STIX indicators
· We need appropriate tools which can extract indicators from STIX and compare with the logs

Logs Log volume

STIX

×

indicator

STIX indicator volume

9

 
CHALLENGES
10

 
Challenges of the detection trigger
· There are challenges in automated detection
­ It is important to detect attacks immediately, also we have to detect potential infected computers
­ There is a time lag between the observation of an attack and the release of the indicator
· We need to compare indicators with logs in a timely manner

Compare

Indicators are received on demand

Log Server

Proxy logs are sent in real-time

Proxy

server

11

 
Challenges of the detection trigger

Detection trigger 1: when we receive indicators
· When we receive STIX indicators, we have to compare them with past logs to find potential infected computers
· Many organizations may adopt this detection approach

Communication occurred

Receives indicators

March 10th, 2018

Incoming indicators malicious.example.com March 25th, 2018

Black list

March 25th, 2018

Log server

Proxy server

Logs received in the past March 10th, 2018

Detect

Logs

example.net example.org malicious.example.com
12

 
Challenges of the detection trigger

Detection trigger 2: when communications to the Internet are performed

· When communications to the Internet are performed, we have to compare them with all indicators to detect attacks immediately

Receives indicators

Communication occurred

March 10th, 2018

Indicator received in the past "malicious.example.com" March 10th, 2018

123.example.com

Black

exploit.example.com list

malicious.example.com

March 25th, 2018

Log server

Incoming logs March 25th, 2018

Proxy server

malicious.example.com

Logs
Detect
13

 
Considerations for blocking domains
The reason why we focus on Detecting malicious domains rather than Blocking them by Firewall or URL filtering:
· We should consider the valid period of the C2 server
­ Some indicators have the information of the valid period ­ Sometimes legitimate websites are used as C2 servers
(Keep blocking the domains are difficult when they are used in business operations)
· We should consider the reliability of indicators · There are maximum number of URLs in filtering
functions

Blocking specific domains for a long period is

difficult.

14

 
SOLUTION

 
Summary of the proposed method

· We propose a method which compares logs with STIX 2.0 indicators automatically using Elastic Stack

The Internet

Receive STIX 2.0 format indicators

Send proxy logs to Elastic Stack

 Extract C2 information and send to Elastic stack
Collecting STIX indicators

Proxy logs

Proxy Server
Internet access via proxy server

Black
list Compare

Logs

Collecting proxy logs

Elastic Stack(Elasticsearch, Logstash, Kibana, Filebeat 16

 
Summary of the proposed method

· Our method solves issues mentioned in previous slides

(1)Effective log analysis and automated detection using Elastic Stack

(2)Compare indicators with logs in a timely manner

Past log detection When STIX indicators are imported into Elastic Stack, the tool compares indicators with past logs.

Real-time detection When proxy logs are transferred into Elastic Stack, the tool compares proxy logs with indicators in the blacklist.

Indicator

Black list

Logs

Elastic Stack

Proxy serv2e1r

 
Structure of the proposed method

STIX indicators are received on demand
Past log matching Import indicators in the blacklist. Compare indicators with past logs.

Logstash
Logs are sent in real-time
Real-time detection Compare logs with the blacklist.

Visualize the detection result

Blacklist

If matched, send alert messages.

Proxy logs

Elastic Stack

Alert mail

Flow of detection

Flow when a log matches the blacklist

Filebeat (Agent)
Proxy server
18

 
Time saving by using the system

Incident response flow

Prepare

Detect/ Analyze

Contain

Eradicate

Recover

Feedback

Before

Incident response

After

Automated process

Incident response

The system uses automated detection to reduce the incident response time.
23

 
Time saving by using the system

· Compare total amount of time needed to identify the compromised computer
­ Manual operation · Extract malicious domains from the text format indicators · Search malicious domains from proxy logs using "grep" command
­ Automated detection using the tools

Extract malicious domains from the text
indicators

Proxy server
Compare indicators with logs

Detect!
Identify the infected computer

The tool utilizes automated detection process.

20

 
Time saving by using the system
The incident response time has been successfully reduced by 84% using the system.

Manual operation
Operations Extract indicators from APT1 report Search indicators from proxy logs Total

The time required About 3.5 minutes About 6 minutes About 9.5 minutes

Automated detection using the tools
Operations Launch the detection tool

The time required About 1.5 minutes
21

 
DEMONSTRATION

Demonstration

 

23

 
CONCLUSION

Conclusion

 

· Indicators can be useful to detect targeted attacks effectively

· Tools for automation and recognizing STIX are necessary for effective detection

· We introduce a Real-time Log Analysis tool for practical use of STIX

· We can reduce the incident response time by using the system

· As a result, damage from attacks can be minimized by immediate detection

25

Future works

 

· Comparison using valid period of the indicators

· Supporting more STIX indicator patterns

· Real-time importing of STIX indicators using TAXII (Trusted Automated eXchange of Indicator Information)

TAXII is a technical specification to securely share and exchange threat information

26

 
REFERENCE

Evaluation of the system  

· Summary of evaluation

­ Import the following STIX 2.0 indicators to Elastic Stack

· Indicators of APT1:
https://oasis-open.github.io /ctidocumentation /examples /example_json /apt1.json
· Indicators of poisonivy: https://oasis-open.github.io/cti-
documentation /examples /example_json /poisonivy.json

­ Conduct normal business operations including Internet browsing via the proxy server

· Access malicious URL on the blacklist several times
­ Transfer proxy logs to Elastic Stack

­ Evaluate whether the system can detect malicious

communications correctly

28

Evaluation result

 

· Total amount of URL access: 15,790 · Total amount of C2 server access: 34

· False positive rate: 0% · False negative rate: 0%

29

 
We published the source code of our tool. https://github.com/sisoctokyo/STIX2_ES_detection
Thank you for your attention! coe@ml.sisoc.tokyo
30

