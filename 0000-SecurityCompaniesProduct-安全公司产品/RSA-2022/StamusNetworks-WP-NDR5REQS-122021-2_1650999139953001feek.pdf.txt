Five Essential Requirements for Network Detection and Response (NDR)

TABLE OF CONTENTS
Introduction and overview What is NDR Examining the key requirements
Sophisticated detection Transparent, explainable results with evidence High-fidelity, high-confidence notifications Guided threat hunting Openness and extensibility Summary

2
3 3 5 6 7 9 11 14 16

3

INTRODUCTION AND OVERVIEW
Ransomware, phishing, computer viruses, hacking, data breaches, distributed denial-ofservice. These and other cyber security threats continue to plague organizations in every industry. They all have at least one thing in common: they rely on corporate networks to do their damage.
Enterprises worldwide are seeing a rise in the number of threats and actual attacks. The Verizon Business 2021 Data Breach Investigations Report cites 5,258 breaches from 83 contributors across the globe, one third more breaches than were analyzed the previous year.
With an unprecedented number of people working remotely, phishing attacks rose by 11% and ransomware attacks increased by 6%, the report says. The study indicated the challenges organizations face as they move more of their business functions to the cloud, with attacks on web applications representing 39% of all breaches.

WHAT IS NDR

To effectively detect and quickly respond to threats that can lead to a major incident, organizations need an innovative solution that goes beyond the capabilities of legacy network security tools. Network detection and response (NDR) is that solution.

The product category was first defined in 2020 by the industry analysts at research firm Gartner. NDR platforms continuously monitor and analyze raw enterprise network traffic in the cloud and on premises to uncover threats facing an organization and notify security teams so they can respond.

The technology evolved from predecessors such as intrusion detection systems, network security monitoring, and network

Image source: Gartner, Inc.

4

traffic analysis, each of which suffered from a number of limitations that NDR works to overcome.

In addition to monitoring north/south traffic that crosses an enterprise perimeter, NDR systems can also monitor east/west communications by analyzing traffic from strategically placed network sensors, Gartner says.
A key function of NDR is the ability to send automatic responses, such as delivering commands to a firewall so that it drops suspicious traffic, the firm says.
NDR is fast becoming an essential security monitoring tool for enterprises, because of its ability to uncover serious and imminent risks from network activity, generate evidentiary logs, and facilitate incident response.

As Gartner notes, "NDR tools primarily use non-signaturebased techniques ­ for example, machine learning or other analytical methods ­ to detect suspicious traffic on corporate networks. They build models that reflect normal network behavior, and when they detect suspicious traffic patterns, they raise alerts."

A properly deployed NDR platform can help cyber security teams proactively identify and address threats to their organizations' digital assets, through the automated detection of advanced persistent threats (APTs), malware, and dangerous violations of security policies.
Perhaps the most important aspect of NDR is that it focuses on the network. Why is this important? Because the network is really the centerpiece of an organization's security posture.
Even as more organizations shift to cloud-based resources, encrypted transmission, and remote workforces, nearly all cyber threats generate communications that can be observed on the network. Furthermore, in many bring-your-own-device (BYOD) environments and with the proliferation of Internet of Things (IoT) devices, companies simply can't rely on endpoint detection alone to uncover threats.

5
The ultimate goal of NDR is to tap into the inherent power of network traffic to uncover critical threats to organizations.
EXAMINING THE KEY NDR REQUIREMENTS
Industry analysts have succeeded in establishing a baseline definition for NDR platforms. But the market includes nearly two dozen vendors staking a claim in the space. Therefore, it's vital for organizations considering NDR to focus on the capabilities they think will give them the best opportunity for successful deployment and operation. Fortunately, after more than seven years developing and deploying network security solutions, Stamus Networks has compiled input from customers and prospects to identify five essential characteristics of an effective NDR system:
Sophisticated detection Transparent, explainable results with evidence High-fidelity, high-confidence notifications Guided threat hunting Openness and extensibility
What follows is a closer look at each of these characteristics.

6

SOPHISTICATED DETECTION
The success of any NDR platform starts with its ability to autonomously detect threats and notify security personnel when something bad is happening. Sophisticated detection performs automated detection using multiple techniques, including explicit rules, machine learning, behavioral analytics, stateful logic, third-party intelligence, and statistical anomalies.

Requirement #1: Sophisticated Detection

What it is:

Automated detection from multiple techniques

· Explicit rules

· Stateful logic

· Machine learning · Third party threat intelligence

· Behavioral analytics · Statistical anomalies

Why it matters:

No single technology can detect all threats
Eliminate blind spots and uncover hidden threats
Multiple event streams create body of evidence for investigation & hunt

Why does this breadth matter? Because no single technology is capable of detecting all threats. This approach eliminates blind spots and uncovers hidden threats. In addition, multiple event log streams create a body of evidence for investigation and threat hunting.
Enterprise security has always been dynamic. The pace of change has accelerated in recent years, however, making the cyber security team's job even more difficult. The attack landscape has evolved to include highly effective supply chain and ransomware attacks led by nation states and organized criminals.

7

Here's just a sampling of the types of threats - both known and unknown - an NDR should be able to detect malware (including ransomware), botnets, advanced persistent threats, data exfiltration, remote access trojans, rootkits, social engineering, lateral movement, policy violations, and phishing.

Detecting these and other threats requires bringing together multiple mechanisms, some simple and others quite sophisticated. Each contributes to the system's ability to uncover threats and support an appropriate response.
Many NDR vendors have developed impressive systems with advanced machine learning, slick graphical interfaces, and ambitious claims. Stamus Networks' most advanced customers say the combination of multiple detection techniques is much more effective than a single mechanism such as machine learning or explicit rules alone.
Ultimately, organizations should look for a solution that can help them eliminate blind spots in their networks and generate a multi-dimensional stream of events that can be correlated and used for threat hunting and incident investigation.

Example threats that can be identified using sophisticated detection
· Malware · Ransomware · Exploit kits · Botnets · Beacons · Offensive tools · Advanced persistent threats · Data exfiltration · Command and control · Penetration tests · Remote access trojans · Rootkits · Social engineering · Lateral movement · Shadow IT · Policy violations · Phishing · Crypto mining

EXPLAINABLE RESULTS WITH EVIDENCE
An NDR platform should provide detailed insights into what's happening on the network, including protocol transactions, flows, and extracted files along with a clear timeline of activity showing the progression of the various threats against a given asset.

8

Organizations need to have a complete view of an attack and the impacted assets because this can drive a more efficient response. There should be no mysterious "black box" detections that cannot be easily understood and explained.

Requirement #2: Explainable Results with Evidence

What it is:

Detailed insights into what is happening on the network
Sequence of threats on assets plotted on timeline
Related events: including protocol transactions, flows and extracted files

Why it matters:

Gain a complete view of an attack and impacted assets Clearly communicate results in more efficient response No mysterious "black box" detections

Experienced security executives say the right solution for the rapidly changing threat landscape lies in a security infrastructure built on open components--solutions that support third-party threat intelligence and thirdparty system integrations--while openly delivering transparent results and the evidence to support the detection.
Organizations need to have a complete view of an attack and the impacted assets because this can drive a more efficient response. There should be no mysterious "black box" detections that cannot be easily understood and explained.
Kill chain attack timeline

9 Experienced security executives say the right solution for the rapidly changing threat landscape lies in a security infrastructure built on open components--solutions that support third-party threat intelligence and third-party system integrations--while openly delivering transparent results and the evidence to support the detection.
Event Stream leading up to the attack
Detailed metadata
HIGH-FIDELITY, HIGH-CONFIDENCE NOTIFICAITIONS
The NDR platform should also be able to provide alerts for serious and imminent threats that can be confidently used to trigger automated responses--with no false positives. Security teams need an automated solution to respond to fast-moving attacks without being bogged down performing triage or validating an alert.

10

Ironically, one of the negative consequences of having multiple detection mechanisms in place is that they can actually produce an overwhelming amount of data in the form of security events.
As discussed earlier, this can be very beneficial when it comes time to investigate an incident and piece together all the stages of a campaign. But many organizations are struggling to staff their security teams with experienced personnel, and nobody wants a platform that requires more time to manage.

Requirement #3: Explainable Results with Evidence

What it is:

Response-ready alerts for serious and immanent threats Can be confidently used to trigger automated response No false positives

Why it matters:

Automation is required to respond to fast-moving attacks
Noisy "alert cannons" discourage investigations
Difficult to differentiate between useful context and critical security events

That's why an effective NDR must do the difficult work of automating event triage and identifying the most serious threats that need immediate attention. In most cases, that requires an additional layer of machine learning and algorithmic threat analytics that identifies high-confidence threats to critical assets, maps the advancement of those threats along the stages of the cyber kill chain, and serves as a "smoke alarm" to alert personnel or systems when a serious and imminent threat is discovered.

11

The data from one Stamus Networks customer, a European hosting provider, offer a good example of how this works. Monitoring the company's network over a period of one week generated more than 16 billion native security events. But of all these, the NDR solution identified only 28 serious and imminent threats, saving untold person-hours.

16 Billion security events

37,665,850 hosts/endpoints tracked
At peak hours Stamus enrichment and detection on the probe was identifying 780,000-1,000,000
events per second

Total observed network activity

Findings from monitoring for a period of one week

28 threats

95 impacted assets
8 different tunneling techniques
Numerous beacons detected

Serious and imminent threats identified, untold person-hours saved

Example production deployment of Stamus NDR monitoring 10Gbps link for European hosting provider's datacenter

INTEGRATED GUIDED THREAT HUNTING
An NDR should offer an analytics toolset for proactive threat hunting by analysts, using network event records along with pre-defined and customizable data filters to simplify common tasks. It should provide the ability to search among metadata associated with security events, flow records, and protocol transaction records.

12

Threat hunting is the proactive detection, isolation, and investigation of threats that often evade automated security systems, and it has emerged as a key component of cyber security strategies. This is because even the most sophisticated automated detection tools can't uncover every threat. But hunting requires skill, and less-experienced analysts need guidance.
As more sophisticated enterprises adopt proactive threat hunting programs, they are looking for their network and endpoint solutions to provide tools to make their jobs easier.

Requirement #4: Integrated guided threat hunting

What it is:

Analytics toolset for proactive threat hunting using network event logs
Pre-defined and customizable data filters to simplify common tasks
Search among metadata associated with security event logs, flow records, protocol transaction records

Why it matters:

Even the most sophisticated automated detection cannot uncover all threats
Hunting requires skill and less-experienced analysts need guidance
Security teams may "divide and conquer," focusing efforts on most critical items first

Stamus Networks customers have said this is an important feature in their ideal NDR platform. They are looking for a positive user experience for both the experienced analysts as well as those who are not as skilled. Critical capabilities for guidance include search, filtering, and pivoting on events and metadata using predefined and custom filter criteria.

13
Create custom perspectives specifically for your organization

Shortcuts can enable repeatable process and rapid assessment of
risk to your organization

Pre-defined for common hunting patterns, such as "suspicious user
agents" or "proxy servers"

14

OPENNESS AND EXTENSIBILITY
It's important to recognize that NDR is only part of the overall detection and response solution; it's not the only tool in the security technology stack.

Requirement #5: Openness and Extensibility

What it is:

Recognition that NDR only part of the detection and response solution
Open interfaces for integrations with SOAR, SIEM, XDR, and IR systems
Open detection with ability to leverage 3rd party and custom threat intelligence

Why it matters:

NDR does not address all security monitoring needs
Organizations need straightforward integration into existing tech stack
Teams can optimize detection based on organizationspecific needs
Cyber defenders gain access to the best of breed technologies

In order for organizations to take advantage of best-of-breed technologies, the NDR platform should provide open interfaces that enable straightforward integration with other systems such as security orchestration, automation, and response (SOAR), security information and event management (SIEM), extended detection and response (XDR), and incident response (IR) systems..

15
Also, because there are many reliable sources of threat intelligence, it's critical that organizations not get locked into a single vendor's proprietary threat intelligence and detection algorithms. Ideally, an organization wants to be able to take advantage of thirdparty or shared threat intelligence and customize detection for their particular environment

Custom Threat Detection
SOAR, IR, Messaging

3rd Party Threat Intelligence

RestAPI

SOAR, SIEM, other

3rd Party Integrations

16
SUMMARY
While there are a number of important features in the various NDR platforms on the market today, these five are the ones that Stamus Networks customers cited as meaning the most to them.
Modern tools such as NDR give security teams a significant boost in the efforts to keep networks, systems, and data safe at a time when risks have become greater than ever. As organizations face threats from well-funded adversaries, these platforms can make their jobs easier and more impactful.
High-performance, network-based threat detection and response systems help organizations' security teams know more, respond sooner, and mitigate their risk with insights gathered from cloud and on-premise network activity. Advanced network detection and response systems expose serious and imminent threats to critical assets and empower rapid response.
To learn more about how an NDR can provide important benefits for organizations, visit www.Stamus-Networks.com.

ABOUT STAMUS NETWORKS
Stamus Networks believes in a world where defenders are heroes, and a future where those they protect remain safe. As defenders face an onslaught of threats from wellfunded adversaries, we relentlessly pursue solutions that make the defender's job easier and more impactful. A global provider of high-performance network-based threat detection and response systems, Stamus Networks helps enterprise security teams accelerate their response to critical threats with solutions that uncover serious and imminent risk from network activity. Our advanced network detection and response (NDR) solutions expose threats to critical assets and empower rapid response.

Copyright © 2021

WP-NDR5REQS-122021-2

5 Avenue Ingres 450 E 96th St. Suite 500

75016 Paris

Indianapolis, IN 46240

France

United States

contact@stamus-networks.com www.stamus-networks.com

