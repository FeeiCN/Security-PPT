Monitoring GDPR Compliance with Splunk
David Hendrawirawan & Rishita Rai | Deloitte & Touche LLP
October 2018

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Disclaimer

© 2018 SPLUNK INC.

This presentation contains general information only and Deloitte is not, by means of this presentation, rendering accounting, business, financial, investment, legal, tax, or other professional advice or services. This presentation is not a substitute for such professional advice or services, nor should it be used as a basis for any decision or action that may affect your business. Before making any decision or taking any action that may affect your business, you should consult a qualified professional advisor.
Deloitte shall not be responsible for any loss sustained by any person who relies on this or presentation.

About Deloitte Deloitte refers to one or more of Deloitte Touche Tohmatsu Limited, a UK private company limited by guarantee ("DTTL"), its network of member firms, and their related entities. DTTL and each of its member firms are legally separate and independent entities. DTTL (also referred to as "Deloitte Global") does not provide services to clients. In the United States, Deloitte refers to one or more of the US member firms of DTTL, their related entities that operate using the "Deloitte" name in the United States and their respective affiliates. Certain services may not be available to attest clients under the rules and regulations of public accounting. Please see www.deloitte.com/about to learn more about our global network of member firms.

Introductions

© 2018 SPLUNK INC.

David Hendrawirawan, CISA, CIPP/E Advisory Senior Manager
Deloitte Risk and Financial Advisory Deloitte & Touche LLP

Rishita Rai, Splunk Certified Architect Advisory Senior Consultant
Deloitte Risk and Financial Advisory Deloitte & Touche LLP

© 2018 SPLUNK INC.
EU General Data Protection Regulation (GDPR)
Introduction

The Big Picture

© 2018 SPLUNK INC.

In the digital economy, business leaders face increasing scrutiny by the public and regulators about their organization's ability to strategically handle & safeguard data from misuse

Regulators are raising the
bar
q US Federal Communications Commission (FCC): user consent / permission for broadband data sharing
q GDPR & California Consumer Privacy: individual data rights
q State of Missouri: antitrust investigation on an internet search platform
See a list of references in Appendix
Copyright © 2018 Deloitte Development LLC. All rights reserved.

Customers are expecting
more
q Harvard Business Review (HBR): monetary value of data trust & transparency
q Data privacy vs. losing income ­ which do Americans prefer?
q Company offers free credit monitoring after major breach

Businesses treats data as
strategic
q Tech companies: ramping up suspicious accounts monitoring & removal
q Social media: improving robust privacy settings
q Three-quarters of data on marketing databases are useless post-GDPR

© 2018 SPLUNK INC.
Most Common GDPR Challenges & Data Management
Strategic management and governance of data assets across the enterprise becomes competitive advantage to tackle the root causes of the top challenges presented by GDPR and other privacy and data protection rules.

GDPR Top Challenges* · Accountability for
compliance · Records of personal data
processing · Notice & consent · Data portability · Right to be forgotten · Data sharing and cross-
border transfer

Poor cross-functional operating model Undocumented data flow and lineage Vast digital data collection & ecosystem Redundant & unintegrated data stores
Lack of third-party data processing visibility

* Based on IAPP Annual Privacy Governance Report and the Deloitte General Data Protection Regulation Benchmarking Survey Copyright © 2018 Deloitte Development LLC. All rights reserved.

© 2018 SPLUNK INC.
Holistic Approach to Address and Comply GDPR
A holistic approach involves cross-functional operating model and capabilities across business analytics, information security, and data management to effectively and efficiently meet GDPR requirements.

People &

Stewardship &

Organization Accountability

Data Policies & Standards

Objectives, KPIs, Metrics

Article 30 (Record of Processing)

Process Data

Privacy by Design &
DPIA
Entities (People, Things)

Individual Rights & Consent
Events (Transactions, Interactions)

Incident Management
Metadata (Lineage, Taxonomy)

Third-party Data Risk
Unstructured (Document, Binary Image)

Technology

Collection
· Discovery · Sourcing · Classification &
Labeling · Data Quality

Processing
· Storage · Integration · Retention &
Archival · BI & Analytics

Protection
· Encryption · Loss Prevention · Access
Governance · Activity Monitor

Copyright © 2018 Deloitte Development LLC. All rights reserved.

© 2018 SPLUNK INC.
GDPR Monitoring Areas & Sample Use Cases

Monitoring Areas
· Metadata Management Information · Data Flow & Lineage
Govern- · Data Handling & Retention ance

Sample Use Cases
Database Change Management Data In-Transit Monitoring Stale Data Disposal

Data Security & Protection

· Data Access Controls (DAC) · Data Activity Monitoring (DAM) · Data Loss Prevention (DLP) · Data Remediation

Exfiltration & Breach Detection Suspicious Behavior Analysis Asset & Vulnerability Management

· Consent Record Individual · Data Subject Rights Privacy
Rights

Consent Revocation Monitoring Data Erasure Assurance

Copyright © 2018 Deloitte Development LLC. All rights reserved.

© 2018 SPLUNK INC.
Use Cases
Case Studies

1. Database Change Management
 Leverage metadata catalog or data governance tool
· Effective to document data flows / maps for GDPR Article 30* · Enable discovery, monitoring, and enforcement of standards and policy

© 2018 SPLUNK INC.

 Database platforms: track creation and modification of dataset schemas and tables
· Monitor Database Definition Language (DDL) and application programming interface
(API) services schema modifications
· Correlate approved datasets in metadata catalog with database logs

Data Sources
­ Database audit trail logs (DDL)
­ Reference metadata & lineage
* *As part of GDPR Record of Processing Activities

Search Correlation Logic
­ Normalize Database Audit logs (DDL)
­ Search for DDL actions ­ Correlate approved data
lineage with actions

Risk Addressed
­ Ensure data discoverability & adherence to policies
­ Detect unauthorized activity of sensitive Personal Information (PI)
­ Validate data erasure and disposal

Copyright © 2018 Deloitte Development LLC. All rights reserved.

2. Data In-Transit Monitoring
 Metadata catalogs can document data lineage and flow across the enterprise
· Identify sensitive data flow in source-to-target map / lineage
 Monitor data flow and processing lineage to detect exposure of sensitive data
· Network DLP can stop / send alert for sensitive information exfiltration · Track APIs and services account creation · Identify authorized actions, accessible IP address and ports

© 2018 SPLUNK INC.

Data Sources
­ Data lineage and flow from metadata catalog
­ DLP events
­ Middleware / API service accounts, user privilege details

Search Correlation Logic
­ Normalize sensitive data ­ Define in-transit or source-
to-target maps ­ Correlate authorized data
lineage & data flow indicators

Risk Addressed
­ Detect unauthorized or unprotected data transfer / exfiltration
­ Monitor data aggregation and transformation logic

Copyright © 2018 Deloitte Development LLC. All rights reserved.

3. Stale Data Disposal
 Prevent uncontrolled growth, reduce risk of leakage with retention policy
· Classify data in terms of subject, categories, origin, and processing purpose
 Monitor unpurged / stale data in databases, file shares, and directories
· Utilize database record or table level metadata · Data Access Governance (DAG) tools for file and folder level activity metadata

© 2018 SPLUNK INC.

Purge Data

Check

Compare

Data Sources
­ Defined data classification, processing purposes, and retention requirements
­ Database audit trail of record level metadata
­ DAG log of file / folder level metadata

Search Correlation Logic
­ Compare file / folder metadata with retention requirements and flag stale data sources
­ Review last update time vs. retention period and determine purging

Risk Addressed
­ Identification of orphaned data
­ Timely purging and destruction of stale data
­ Reduce cost of storage and risk of data leakage

Copyright © 2018 Deloitte Development LLC. All rights reserved.

© 2018 SPLUNK INC.
4. Data Exfiltration & Breach Detection
 Data leakage & breach detection, prevention, and impact analysis require multi-pronged solution:
· Network & proxy traffic logs analysis · DLP and DAM analysis · Encryption*, rights management, obfuscation, anonymization · Metadata catalog and tagging / digital signatures ­ enhance discoverability

DLP

 Correlate logs from multiple solutions in centralized storage & analytics

DAM

Proxy ...

Data Sources
­ DLP & DAM alerts ­ Network traffic & proxy logs ­ Databases / field encryption
settings

Search Correlation Logic
­ Normalize DLP and proxy data
­ Set relevant threshold ­ Continuously baseline the
threshold for "normal" behavior

Risk Addressed
­ Timely detection and prevention of sensitive data leak
­ Ability to efficiently assess and contain data breach impact

* Note: DLP & DAM must be architected to work with encryption Copyright © 2018 Deloitte Development LLC. All rights reserved.

5. Suspicious Behavior Analysis
 Data theft and insider threats require sophistication beyond the baseline access controls

© 2018 SPLUNK INC.

 User behavior analysis should be employed to correlate these attributes:
· Terminated employees or contingent workers access after termination · User access to high risk application, data & transactions · User security groups, and security zones · After hours or out of cycle activities in security zones

Data Sources
­ Security Groups and geo zones
­ Master list of high risk data & transactions
­ Application activity data ­ Current active user and device
signature info

Search Correlation Logic
­ Monitor non business hour activities
­ Track IP geo location ­ Correlate user to device
signature for anomaly

Risk Addressed
­ Detect and prevent potential data theft by insider threat
­ Mitigate advanced and persistent threat from social engineers

Copyright © 2018 Deloitte Development LLC. All rights reserved.

© 2018 SPLUNK INC.
6. Asset & Vulnerability Management
 Outdated patch, misconfiguration, or insecure software code in IT systems and Configuration
· Unable to prioritize and apply timely remediation to discovered vulnerabilities

 Metadata catalog data should be triangulated with CMDB and network configurations
· Improve situational awareness and incident response readiness & enabling strategic prioritization · More timely resolution of vulnerabilities · Focused areas for Secure-System Development Life Cycle (S-SDLC) and Privacy by Design

Data Sources
­ IT Asset from inventory such as CMDB
­ Sensitive data from data catalog
­ Vulnerability scan details, dynamic and static analysis
­ Network configuration
* Note: CMDB is Configuration Management Database
Copyright © 2018 Deloitte Development LLC. All rights reserved.

Search Correlation Logic
­ Map IT Assets and sensitive data from CMDB and data catalog
­ Identify clusters of sensitive data repositories in same network zones
­ Correlate vulnerability scan to identify top Common Vulnerabilities and Exposures (CVE)

Risk Addressed
­ Proactively address strategic vulnerabilities
­ Reduce risk of sensitive breach from systems and network zones
­ Improve situational awareness and IR readiness

7. Consent Revocation Monitor

© 2018 SPLUNK INC.

 Individual customer may revoke consent for their data to be used for secondary purposes

· Companies are obliged to capture and record consent events · Marketing analytics and third-party eco-system must adhere

Flag Revoked Customer Information

 Splunk can be used to check for compliance by
· Alerting marketing application owners & third parties data processors · Flag when customer data are still processed / sent to marketing & third party

Notify third party

Data Sources
­ Customer consent record and privacy preference repository
­ Application logs from marketing and third-party systems

Search Correlation Logic
­ Maintain a customer "black list"
­ Monitor application and database traffic data against the black list
­ Send alert to marketing and third party

Risk Addressed
­ Provide adherence to customer consent and individual rights
­ Customer confidence and trust in data handling process

Copyright © 2018 Deloitte Development LLC. All rights reserved.

© 2018 SPLUNK INC.
8. Data Erasure Verification
 Right to be Forgotten = Fulfill a customer's request to erase their data within 30 days
· Good practice: Use single source of truth such as customer Master Data Management (MDM) · Run a script or a query to verify erasure and send a success / failure event to Splunk · Correlate erasure status against the customer MDM to gain further confirmation
Clean and Remove

Data Sources
­ Erasure success / failure event from customer applications
­ Master record status from Customer MDM

Active Monitoring
Search Correlation Logic
­ Aggregate erasure event logs across multiple applications
­ Upon successful completion across all source systems, alert final status to Customer MDM

Risk Addressed
­ Provide adherence to customer consent and individual rights
­ Customer satisfaction and trust in data handling process

Copyright © 2018 Deloitte Development LLC. All rights reserved.

© 2018 SPLUNK INC.

Privacy & Data Protection Architecture - Illustrative

Consent Capture

Metadata Management

Retention &

7

Archival

Real time Service

Customer MDM 2

1 Online Transaction
Processing Sources

Social Media

Enterprise Resource Planning

· Profile Cleanse, Standardize · Enrich, Match & Merge

Erasure Request

Customer Golden Record

5
Real Time Processing
Send Marketing Offer Perform Credit Check
Process Order

E-Commerce Portal

Customer Resource Management

Batch Processing

Data Aggregation & 3
Warehousing

Data Lake

Data Warehouse

Analytics Sandbox

Operational Data Store

Email Server

Unstructured Data Repository

SharePoint

File Directory

Distributed Cloud Networking

6
BI Reporting & Analytics
Customer Lifetime Value Sentiment Analysis
Financials & Profitability
4
Records Management

Data Activity Monitoring

Data Access Governance

Data Loss Prevention

8 Splunk >
Determined Privacy Monitoring Thresholds
Correlations Searches
Investigative Workflows and Audit Reports
Custom Data Models for Privacy Monitoring
Dashboards (e.g., Data Erasure Status)
Compliance Reporting (e.g., GDPR Article 30)
Compliance Monitoring (e.g., GDPR Article 32)

Copyright © 2018 Deloitte Development LLC. All rights reserved.

© 2018 SPLUNK INC.
Appendix
This section contains links to useful information

List of References

© 2018 SPLUNK INC.

1. https://inform.tmforum.org/data-analytics-and-ai/2016/10/monetizing-data-us-regulators-agree-new-data-privacy-rules/ 2. https://techcrunch.com/2017/11/13/missouri-attorney-general-launches-an-anti-trust-investigation-against-google/ 3. https://hbr.org/2015/05/customer-data-designing-for-transparency-and-trust 4. https://www.prnewswire.com/news-releases/study-finds-more-americans-concerned-about-data-privacy-than-losing-their-
income-300211216.html 5. https://www.campaignlive.co.uk/article/gdpr-will-render-75-uk-marketing-data-obsolete/1441738 6. https://techcrunch.com/2017/09/19/twitter-claims-tech-wins-in-quashing-terror-tweets/ 7. https://www.consumer.ftc.gov/blog/2018/01/equifaxs-free-credit-monitoring-time-ticking 8. https://www.usatoday.com/story/tech/2018/01/29/facebook-launch-privacy-center-ahead-eu-regulations/1071430001/

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

