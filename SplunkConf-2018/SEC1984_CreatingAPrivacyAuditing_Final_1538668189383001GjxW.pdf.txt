© 2018 SPLUNK INC.
Creating Privacy Auditing and Controlled Substance Diversion Platforms for Healthcare
Jennings Aske | SVP, CISO, NewYork­Presbyterian John Frushour | Deputy CISO, NewYork­Presbyterian Shirley Golen | Global Healthcare Industry Marketing, Splunk Gleb Esman | Senior Product Manager, Fraud Analytics and Research, Splunk

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Today's Session Agenda
 Shirley Golen
· Splunk and Healthcare
 Gleb Esman
· Project Background
 Jennings Aske and John Frushour
· Information Security and IT Operations · Patient Privacy · Pharmacy/Opioid Diversion
 Q&A

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Splunk and Healthcare
One Platform, Multiple Use Cases in Healthcare

© 2018 SPLUNK INC.
Healthcare Data is Time-Oriented and Diverse...

Healthcare Apps

IT Systems and Med Devices

Patient-Generated Data

Protected Health Information Access Audit Logs

Electronic Health Records Systems

Departmental and
Homegrown Applications
Health Level 7 Messaging

Health Information Exchange

Desktops

Web Services

Devices

Security

Medical Devices

Servers

Developers

Telecoms

App Support

Networking

Storage

Messaging

Patient Surveys
Sensors
Clickstream

Patient Networks
CDR
Mobile

© 2018 SPLUNK INC.
One Platform, Multiple Use Cases in Healthcare

Healthcare Sources

Core IT

Patient-Facing Data

Providing Better Patient Outcomes
Lowering Costs
Cybersecurity Protection
Protecting Privacy of Patient Health Information
Controlled Substance Diversion
Detecting Fraud

© 2018 SPLUNK INC.
Privacy Platform Collaboration
Background

© 2018 SPLUNK INC.
Challenges with Existing Off-the-shelf Privacy Systems
 Scalability and Performance · Legacy designs involves complex, poorly documented, mixed architectures
 Rigid and Inflexible · Hardcoded to specific data formats · Hardcoded to specific interfaces, limited APIs
 Lack of control · Hard to modify and customize without vendor · Requires vendor-driven, expensive and prolonged consulting engagements · Often "black box" with unwillingness by vendor to cooperate with others
 Crippling, add-on costs · Vendor-enforced fees to maintain system is working order and upgrade

© 2018 SPLUNK INC.
General Requirements for Privacy Platform
 Scalability
 Extensible, customizable solution
 Support for many privacy use cases
 Support for large number of diversified, poorly documented, poorly structured, possibly mis formatted data sources coming in large quantities in possibly erratic manner from large number of different healthcare applications, systems and possibly unstable data sources and activity logs.
 Have system capable of normalizing, analyzing and detecting thousands of anomalies, instances of violations and suspicious activity events over critical patient and healthcare data.

Splunk Healthcare Privacy Platform

© 2018 SPLUNK INC.

Full Data Visibility
· Data Flow (consistency, stability) · EHR Records (normalized and raw views) · Activity (EHR access stats across all entities) · Anomalies (ML and detection)
Incident Management
· Alerts (Categories, Tags, Status, Comments) · Filtering · Workflow

Business Use Cases
· Privacy Monitoring
(EHR access)
· Medications Access
(Pharmacy, Access, Diversion, Opioids abuse)
· Security
(Logins, IDs, System access)
Investigations
· Dashboards · Visualizations · Drilldowns · Reports

© 2018 SPLUNK INC.
Creating Privacy Auditing and Controlled
Substance Diversion Platforms for Healthcare

NYP and Splunk
Information Security and
IT Operations

© 2018 SPLUNK INC.

Patient Privacy

Pharmacy/Opioid Diversion

NYP and Splunk
Information Security and
IT Operations

© 2018 SPLUNK INC.

St. Anthony's Hospital Fire

© 2018 SPLUNK INC.

St. Anthony's Hospital Fire

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Healthcare's Attack Surface
 Healthcare is 1/6 the US's GDP  900K physicians, 2.8 million nurses and administrative staff  230K physician practices  5700 hospitals  What else?
· skilled nursing facilities, pharmacies, ambulatory surgery centers...
 And more to come:
· 165K mobile healthcare apps, telehealth, "smart" consumer devices...

© 2018 SPLUNK INC.

Source: WSJ.com

© 2018 SPLUNK INC.

The Visibility Problem

© 2018 SPLUNK INC.

NYP-Splunk Architecture
 Active-Active, multi DC
· Load balanced ingress for MSSP cloning · Spatial Locality

x 5
Forwarder

Data Sources

Syslog

LB

DC 1 or 2?

x 2
rsyslog

xx 2244
Indexer
xx 33
Search Head

x 4

LB

MSSP

 Critical Infra Data Sources
· Tier 0 · FW / IPS · DNS, DHCP, IPAM · File Storage · Storefront / Customer Portal
· Tier 1 · vSphere / vCenter · AD · Email MTA, GW, Mailboxes
· Tier 2 · PCI / Micros / HP24 · SSO ­ Ping / Imprivata · Vulnerability Scanning ­ R7 · MDM · WiFi · Timekeeping

© 2018 SPLUNK INC.

NYP and Splunk
Patient Privacy

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

NY Consortium ­ Privacy Project
 NY Consortium
· Columbia University Irving Medical Center · Weill Cornell Medicine · NewYork-Presbyterian

© 2018 SPLUNK INC.

 Project Goal ­ Implement a scalable, extensible solution for Privacy Officer
operations in the areas of: · Auditing, · Monitoring; and · Investigations.

 Increase efficiency of current privacy workflows:
· Reduce false positive alerts, and facilitate workflows; and · Provide a solution that a non-technical privacy analyst could leverage for investigations.

Privacy Use Cases

1. Higher than user normal 2. Excessive Hours with Activity 3. Access outside of work hours 4. Excessive Demographics Access 5. Access to VIP 6. All accesses by user over a specified time 7. Accesses by all users to a given MRN 8. Break the Glass 9. Employee Access to Employee
Patient Records 10.Deceased Patient Access 11.Deceased Patient Demographic Access

12.Failed login attempts alert 13.Employee Patient Access 14.Compare Usage among Peers 15.Failed login attempts report 16.Mismatched user login 17.Access from off campus 18.Access from off campus outside of
work hours 19.Access to consecutive MRNs 20.Access by inactive user 21.User over time statistics

© 2018 SPLUNK INC.

Evaluation Process
 Commercial off the Shelf (COTS) vs. Build
· COTS products reviewed: · Fairwarning, Protenus, Cognetyx, Maize Analytics · Concerns about scalability, poor data enrichment, missing use cases

© 2018 SPLUNK INC.

· Splunk: · Scalable machine data aggregation · Currently used by Weill Cornell and NYP InfoSec teams for security analytics · Correlation, artificial intelligence and machine learning capabilities superior to COTS
products

 The NYP Consortium chose to build with Splunk

© 2018 SPLUNK INC.
Healthcare Privacy Monitoring and Auditing Platform

© 2018 SPLUNK INC.
Healthcare Privacy Monitoring and Auditing Platform

© 2018 SPLUNK INC.
Healthcare Privacy Monitoring and Auditing Platform

© 2018 SPLUNK INC.
Healthcare Privacy Monitoring and Auditing Platform

MRN Access

© 2018 SPLUNK INC.

User Access

© 2018 SPLUNK INC.

Access by Inactive Users

© 2018 SPLUNK INC.

Excessive Hours with Activity

© 2018 SPLUNK INC.

Failed Login Attempts

© 2018 SPLUNK INC.

NYP and Splunk
Pharmacy/Opioid Diversion

© 2018 SPLUNK INC.

The American Epidemic

© 2018 SPLUNK INC.

Using Splunk to Identify Diversion

© 2018 SPLUNK INC.

 Splunk will ingest logs from several source systems to identify potential
diversion. Correlation and machine learning will allow Splunk to learn and predict anomalous behavior indicating potential diversion.

 Current NYP sources: · Allscripts electronic health record · EMPI · Electronic Prescription of Controlled Substances (EPCS) · Kronos timekeeping · Omnicell pharmacy dispensing system · Workday

Using Splunk to Identify Diversion

© 2018 SPLUNK INC.

 Splunk will ingest logs from several source systems to identify potential diversion. Correlation and machine learning will allow Splunk to learn and predict anomalous behavior indicating potential diversion.

 Current NYP sources: · Allscripts electronic health record · EMPI · Electronic Prescription of Controlled Substances (EPCS) · Kronos timekeeping · Omnicell pharmacy dispensing system · Workday

Pharmacy Diversion Use Cases

© 2018 SPLUNK INC.

1. Medications removed by any user not working that day.
2. Users who remove medications from pharmacy cabinet without documentation of
administration in EMR.
3. User return of medication in pharmacy cabinet within one hour ­ doing this more than others.
4. Doctors who prescribe controlled substances for patients they have never seen (outpatient).
5. User who removes medication from pharmacy cabinet for a patient who is discharged who
does this more than peers.
6. User who removes opioid medications from pharmacy cabinet for a patient with no pain score
- doing this more than others.
7. User prescribes for patient in "wrong" clinical unit

Pharmacy Diversion Use Cases

© 2018 SPLUNK INC.

7. Monitor quantity of dispensed medication for controlled substances - users exceeding peers. 8. Pharmacy cabinet frequency of access - comparison against self, against peers. 9. Prescriptions for coworkers. 10.Patient seen in one facility and prescription filled in another, with geography scatter map. 11.Opioid clinical guidelines (e.g., initial, detox - exceeding, comparison against peers). 12.User pattern anomalies using machine learning. 13.Diversion of expensive, non-controlled substances

© 2018 SPLUNK INC.

Using Splunk to Identify Diversion
 Privacy Monitoring and Auditing · Build-out of production environment, initial deployment schedule · "Epic use cases"
 Pharmacy Diversion · Finalize initial use cases and requirements documentation; · Development environment build-out, and project planning.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Q&A

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

