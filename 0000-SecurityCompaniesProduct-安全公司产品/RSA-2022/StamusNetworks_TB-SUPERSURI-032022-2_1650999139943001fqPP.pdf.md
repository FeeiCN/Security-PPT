Supercharge Suricata Sensors with Stamus Security Platform

While Stamus Security Platform (SSP)

is optimized for use with Stamus

Network Probes, organizations deploying native Suricata sensors in

Stamus Central Server

their network will also benefit from

using Stamus Security Platform. In

addition to providing a convenient

way to centrally manage rulesets and

logs for multiple Suricata sensors,

Stamus Security Platform includes a

Suricata sensor post-processing

module to provide advanced features, previously only available with Stamus Network Probes.

Suricata Sensors

Stamus Network Probe

This document describes the capabilities of Stamus Security Platform that are available to

users of native Suricata sensors.

Foundational Suricata Capabilities in SSP
From its earliest inception, Stamus Security Platform was designed to provide a powerful central management to help scale enterprise Suricata deployments. The following is a summary of the foundational SSP capabilities designed for Suricata sensors.
· Ruleset and threat intelligence management ­ centralized management of Suricata rulesets and third-party threat intelligence
· Protocol transaction and flow data logging & analysis ­ centralized logging and analysis of protocol data, including flow records and transaction logs, captured by Suricata sensors

2
· Alert logging & analysis ­ consolidated IDS event storage and central integration point for the rest of your security tech stack, such as SIEM, SOAR, Open XDR, IR or messaging systems
· Guided threat hunting ­ because even the most advanced system cannot automatically detect everything, Stamus Management Server integrates a guided threat hunting console that simplifies proactive defense for less-experienced analysts.
Stamus Management Server may be installed on turnkey physical appliances (available from Stamus Networks) or as a software image that you deploy either on bare metal hardware, a virtual machine, or a virtual machine in the cloud.
Capabilities enabled by Suricata Sensor Post-Processing
In Stamus Security Platform, advanced features such as metadata enrichment, tagging, automated triage classification, and the execution of "Stamus threat" detection logic are performed on Stamus Network Probes. As such, these features have not historically been available to native Suricata sensor deployments.
Beginning with release U37, Stamus Security Platform includes a Suricata sensor postprocessing function that delivers many of the same functions in the central Stamus Management Server.
These capabilities include:
· Alert data enrichment · Automated event triage · Network definitions · High-fidelity Declaration of CompromiseTM
The remainder of this document is devoted to explaining these capabilities in greater detail.

3
Alert Data Enrichment
When the capability is enabled, SSP enriches the data associated with alerts from Suricata sensors, delivering some key capabilities previously available only with the Stamus Network Probes. Alerts are enriched with metadata about domain/DNS server, JA3/JA3s, and IP geolocation. See the example screenshot below in which some of the alert enrichment is highlighted with blue boxes.
Automated Event Triage
With the metadata applied to the alerts, users may create and apply SSP filters based on this metadata during incident investigation and hunting. These filters help the user isolate and pivot on events in the system. These filters may be used to create a policy to suppress, threshold or tag alerts associated with the filter criteria.

4
These policies instruct SSP to automatically classify future events, essentially performing the triage automatically. This dramatically reduces the time spent by analysts reviewing security events.
There are 5 types of actions that can be performed with policies: · Suppression, to remove an alert · Thresholding, to retain an alert under certain conditions · Tagging, to enrich the alert with a tag (either "relevant" or "informational") · Escalating, to escalate an alert to a Declaration of CompromiseTM The screenshot below illustrates applying the filter above to create a tagging policy.
Policy actions can use any fields, including metadata, from an alert. Once an alert is tagged, the analyst can, for example, use the tag to filter only those alerts which the system labeled "relevant" using the tag filter shown below.

5
Declarations of CompromiseTM
One of the key features of the Stamus NDR license is the ultra high-fidelity detection that generates what we call Declarations of CompromiseTM comprised of "Stamus Threats." Stamus Security Platform applies advanced logic to signature-based alerts, metadata, and raw protocol transactions to identify serious and imminent threats, and to reconstruct the sequence of events that led to the declaration of compromise.
Declarations of Compromise
Prior to the introduction of Suricata postprocessing, this capability was previously unavailable to deployments that use native Suricata sensors. Now Stamus Security Platform delivers this capability ­ limited to signaturebased events ­ for Suricata users. In addition, the filters described above may be used to create custom threat detection logic which is used by Stamus Security Platform to trigger a Declaration of CompromiseTM

6
Network Definitions
Network Definitions allows the user to label certain networks or IPs with organizationallyrelevant names which SSP uses to enrich event data. This simple capability can dramatically accelerate the analyst's ability to assess the criticality of an asset or identify suspicious user activity on a particular network segment. See the example below.
Configuration of Network Definitions
Network Definitions enriching alert records

7

How it Works
In a typical SSP deployment, the Stamus Network Probes perform extensive local preprocessing of events (alerts, flow data, and protocol transactions), for alert tagging, data enrichment, filtering, and advanced detection.

Native Suricata sensors do not do this, so this is where the Stamus Security Platform Suricata post-processing becomes important. In order to bring organizations using native Suricata sensors some of the same capabilities that are available with Stamus Network Probes, Stamus Central Server now includes a component called Suricata sensor postprocessing. The diagram below provides a visual explanation.

Stamus Network Probe

Stamus Central Server

Network Traffic

Suricata

Stamus preprocessing

Network Traffic

Suricata Sensor Suricata

Suricata sensor postprocessing

Probe/sensor management
Event storage
Analysis
Threat hunting
Advanced detection
Web UI

8
Understanding the Differences with Stamus Network Probes
While Stamus Networks continues to advance its support for native Suricata sensors, organizations wanting to take advantage of the most advanced capabilities in Stamus Security Platform should consider upgrading to the Stamus Network Probes. And because the probe software is based on Suricata, current Suricata users will not lose any of the functionality they are familiar with.
Deploying Stamus Network Probes is the most complete way to receive all the advantages of Stamus Security Platform including advanced features such as:
· Host and user insights · Dynamic datasets for IOC matching · Protocol transaction-based (non-signature) advanced threat detection · Machine learning, sightings, and other anomaly detection
Another important consideration when deciding between Stamus Network Probes and Suricata sensors is the performance impact of scaling to multiple sensors. Using native Suricata sensors requires more centralized computational power and resources because the post-processing component runs on the Stamus Central Server. Deployments that use Stamus Network Probes tend to be more scalable as they perform the processing directly on the Stamus Network Probes, focusing the work of Stamus Central Server on aggregating events and additional detection analytics. Be sure to evaluate your actual bandwidth and throughput requirements before deciding.
Finally, the Stamus Network Probe software and license are included ­ at no additional cost ­ with the Stamus ND and Stamus NDR license packages.

ABOUT STAMUS NETWORKS
Stamus Networks believes in a world where defenders are heroes, and a future where those they protect remain safe. As defenders face an onslaught of threats from wellfunded adversaries, we relentlessly pursue solutions that make the defender's job easier and more impactful. A global provider of high-performance network-based threat detection and response systems, Stamus Networks helps enterprise security teams accelerate their response to critical threats with solutions that uncover serious and imminent risk from network activity. Our advanced network detection and response (NDR) solutions expose threats to critical assets and empower rapid response.

Copyright © 2022

TB-SUPERSURI-032022-2

5 Avenue Ingres 450 E 96th St. Suite 500

75016 Paris

Indianapolis, IN 46240

France

United States

contact@stamus-networks.com www.stamus-networks.com

