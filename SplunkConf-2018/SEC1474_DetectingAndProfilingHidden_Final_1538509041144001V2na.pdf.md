Detecting and Profiling Hidden Threats Using Deception and Splunk
Satnam Singh | Chief Data Scientist, Acalvio Technologies
October 2, 2018

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Agenda

© 2018 SPLUNK INC.

 Hidden threats

 Introduction to deception and use cases

 Triage of deceptive alerts with security events in Splunk

 Profiling threats: Demo

Hidden Threats

 Adversaries move within the network to find valuable or vulnerable assets

 Perimeter-based controls can't detect the threats that have already infiltrated and are hiding within the enterprise network

 Adversaries are using "living off the land"

tactics

makes it difficult for Endpoint

detection tools to detect them

© 2018 SPLUNK INC.

How to Defend?
1. Slowdown the Attacker
2. Speed up the Defender

© 2018 SPLUNK INC.

Deception

© 2018 SPLUNK INC.

 Deception needs to blend with the environment
 Multiple types of Deception
 Deception needs to dynamic, morph and adapt over time

Deceptive Security - Use Cases

© 2018 SPLUNK INC.

 Detect Lateral Movement in the Corporate Network

 Detect Network Scans, Ransomware

 Detect advanced threats that are targeting specific verticals e.g., SWIFT, ICS

Deceptive Security - Use Cases

© 2018 SPLUNK INC.

 Get visibility of threats in unmanaged networks, encrypted traffic, IOT devices

 Generate actionable threat intelligence with high fidelity alerts

 Need only a few resources to deploy another security layer

LURES

Deception Types
DECOYS

© 2018 SPLUNK INC.

BREADCRUMBS

Decoys
 Interaction Types - Low, Medium, High  Services - SSH, Telnet, SMB, FTP, ...  Workstations  Databases  Servers  Routers, Switches ...

© 2018 SPLUNK INC.

Breadcrumbs

© 2018 SPLUNK INC.
Extends deception to production devices  Credentials - Shares, Servers  In-Memory hashes  Files  Registry entries  Browser Cookies ...

Lures & Baits
Makes deceptions more attractive  Vulnerable Shares  Network Printer  Vulnerable Webserver  PACS DICOM Server  Contents of breadcrumbs and
decoys (ex: files, user account, share, database, address book)  ....

© 2018 SPLUNK INC.

Deception Farms

Enterprise Network On-premises
Network 1

SERVER

SensorSERVER

Projections

Cloud VPC
Sensor

Projections

VPC 1

SOFTWARE TUNNELS

Acalvio Deception Farm

Network 1
SDN Fabric
VPC 1

SERVER SERVER

AI Engines
Threat Analysis Engine

© 2018 SPLUNK INC.

Fluid Deception

Enterprise Network
On-premises
ATTACK

A1

A2

A3

A4

A5

A6

B1

B2

B3

Projected Deceptions

Sensor

SOFTWARE TUNNEL

© 2018 SPLUNK INC.

Acalvio Deception Farm

SDN Fabric

A3

A4

HI

LI

A5

A6

B4

Low Interaction Deceptions High Interaction Deceptions

Splunk App

Threat Profiling

© 2018 SPLUNK INC.

1. Customise Deception
- Customise decoys to blend - Determine Deception Strategy

3. Triage with Deception Alerts

2. Deception Platform
Deploy Deceptions

© 2018 SPLUNK INC.
Demo
Threat Profiling

Key Takeaways

© 2018 SPLUNK INC.
1. Deception provides an ability to detect
hidden threats
2. Deception needs to be customized and
dynamic
3. Triage deception alerts with network,
endpoint logs in Splunk to generate actionable internal threat intelligence

