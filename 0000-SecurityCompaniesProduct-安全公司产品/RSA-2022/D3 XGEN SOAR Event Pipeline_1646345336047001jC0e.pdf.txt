D3 XGEN SOAR 

EVENT PIPELINE

Filter Out 98% of Alerts

WHITEPAPER

Enterprises and managed service providers are overwhelmed with security alerts from various sources. There are ways to make a dent in the number of alerts--for example by using a SIEM to identify anomalous behaviors and escalate those to high-fidelity alerts. However, this approach also potentially buries meaningful alerts because security teams rarely have the resources to process the entire volume of data.

D3's Event Pipeline is a next-generation SOAR engine that enables triage, investigation, and response for every alert. False positives can be automatically dismissed, ensuring that no meaningful alert is mishandled or not given enough attention.

D3's Event Pipeline consists of the following core phases:

1. Data Normalization 2. Threat Triage 3. Auto Dismissal & Escalation

D3 Event Pipeline

D3 Event Pipeline Highlights
 Playbook-powered, applying automated actions at the event level.
 Leverages 360+ out-of-the-box integrations.  Escalated events feed seamlessly into incident
response playbooks.

 Ideal multitenant solution for MDRs and MSSPs.  Fast and scalable, with distributed architecture
using microservices and NosQL.  Can auto-dismiss, deduplicate, and consolidate
as much as 98% of incoming alerts.

DATA NORMALIZATION

In the D ata Normalization phase, ingested alert data is placed in the job queue to be analyzed and parsed. Key event fields and artifacts, like host names, IP addresses, and process command lines, are extracted and mapped from the raw alert data, as well as the MITRE ATT&CK TTP labeling. D3 will also add an additional layer of metadata to the alert to increase its observability in the next phase of the pipeline. Once the alert data has been normalized as a D3 event with artifacts extracted and mapped, related events and incidents can be found via correlation of artifacts. 

THREAT TRIAGE

In the Threat Triage phase, D3 enriches the normalized events, including with reputation scores from third-party threat intelligence sources like VirusTotal, as well as hosts' or users' context from the internal Configuration Management Database (CMDB) powered by D3 Global List. The Global List allows clients to maintain an inventory of critical assets that can be correlated against and impact workflows. For example, the username associated in an alert can be checked against the pre-configured VIP user Global List. If the user is found to be a VIP, the severity of the event will be automatically elevated. 

Following enrichment, D3 can then dynamically assign nested playbooks for further investigation. In addition, contextual search queries to EDR, SIEM, log management, and/or TIP tools can be initiated to actively hunt for related events. Events that share the same artifacts or key event fields can also be grouped together for deduplication. This especially useful for use cases like grouping phishing emails from the same campaign. 

AUTO-DISMISSAL & ESCALATION

In the Auto-Dismissal and Escalation phase, false-positive checks can be set as rules in D3 to filter and then auto-close false positive events. For example, if certain processes on development servers are confirmed as benign, events with those processes can be automatically dismissed as false positives.

Events with elevated severity from the Threat Triage phase that are not dismissed are then escalated to incidents as confirmed threats, which triggers the Incident Playbook to kick off response actions and assign analysts. For example, a phishing email incident will cause the appropriate analysts to be notified, and response actions such as "block email sender" will be orchestrated upon their approval. 

OUTCOMES

Even with ever-increasing telemetry data, alerts will not be mishandled. D3's event pipeline will help improve the detection of malicious behaviors and provide confirmed threats as incidents to security analysts.

Analysts can efficiently investigate the confirmed threats, because the incidents are already enriched with threat intelligence and CMDB information, related events have been found, and the artifact relationships are displayed. As a result, ~98% of the alerts are filtered out, with the remaining 2% of the truly meaningful alerts escalated for analysts' attention and manual investigation. Among the 98% of alerts that are filtered out, 60% are auto-closed based on pre-set rules, while the rest are combined and consolidated into the 2% that require investigation.


SCALABLE, DISTRIBUTED, PARALLEL ARCHITECTURE
To ensure that our services can scale alongside the growth of our client base, and the growing customer bases of the MSSPs and MDRs that use D3, our event pipeline is designed to handle large volumes of event data through distributed architecture using microservices and NoSQL.

TELEMETRY
EDR Ticketing
SIEM and more

CONTAINER / MICROSERVICES
1. Data Ingestion 1. Data Ingestion 1. Data Ingestion

CONTAINER / MICROSERVICES
2. Normalization 2. Normalization 2. Normalization

CONTAINER / MICROSERVICES
3. Triage 3. Triage 3. Triage

CONTAINER / MICROSERVICES
4. Dismissal & Escalation 4. Dismissal & Escalation 4. Dismissal & Escalation

CONTAINER / MICROSERVICES
5. Incident Response 5. Incident Response 5. Incident Response

NO SQL

CASE STUDY
D3 can ingest security event data from myriad sources, via our 360+ out-of-the-box integrations, webhook, and multitype file upload. EDR and threat intelligence feeds are two of the most valuable data sources for providing deep visibility into an organizations' assets, such as servers, laptops, and cloud VMS. In modern cyber defense, managing these data sources is a crucial part in keeping your organization secure. However, this can be a challenging task, especially when analysts can be easily flooded with alerts every day.
According to one of our clients, their Crowdstrike EDR triggers more than 10,000 alerts every day, which puts a massive amount of pressure on their analysts. With the power of the D3 event pipeline, they were able to streamline the process, starting from triage. Using D3's existing integration with Crowdstrike, the EDR alert raw data feeds into the playbookpowered event pipeline, which auto-closes the majority of false positives, and only escalates the confirmed threats to be handled by the analysts. The event pipeline filters the 10,000 alerts down to approximately 200 incidents that need investigation.

D3 Security has been at the forefront of security orchestration, automation, and response (SOAR) since before the term was even invented. In this time, we've helped the largest companies in the world and early adopters from virtually every industry transform their security operations, incident
response, and threat hunting.

This depth of experience has allowed to D3 to build the most comprehensive and scalable SOAR platform on the planet. It has also given our team members unmatched SOAR-specific expertise, which allows us to provide you--the person evaluating or buying SOAR--the best help possible.

We would love to discuss your automation strategy and show you how our product can help you achieve your goals.
WANT TO LEARN MORE ABOUT D3?
JOIN THE NEXT XGEN SOAR DEMO

Read how a FinTech 
 client increased their 
 response speed 10X

DOWNLOAD
Get the conversation started:
Email info@d3security.com
 Follow @D3Security on Twitter


Read our XGEN SOAR Key Features Guide DOWNLOAD
Connect with D3 Security on LinkedIn Visit us online at D3Security.com


