© 2018 SPLUNK INC.
How We Built an Efficient Healthcare Privacy Monitoring and Auditing Platform
Gleb Esman gesman@splunk.com | Sr. Project Manager, Fraud Analytics and Research, Splunk. Ernst Katchour ernst@sigbay.com | CEO and Founder, SigBay, Inc., Splunk Technology Alliance Partner Jay Benfield jay@sigbay.com | Senior Architect, SigBay, Inc.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Gleb Esman, Bio
gesman@splunk.com linkedin.com/in/glebesman
1990's: Anti-virus, anti-malware research and development: Belarus, Israeli anti-virus research and development.

© 2018 SPLUNK INC.

2000's: IBM T. J. Watson Research Center, NY. Anti-virus development. Development of advanced methods and heuristic virtual machines to detect known and unknown computer viruses and malware.

2000's-2010's: Architecting and engineering management work in space of e-commerce, cryptocurrency, payment processing and digital information management solutions.

Till July, 2015: Morgan Stanley, Montreal, Canada. Data analytics solutions for financial services, building custom Splunk-based security and anti-fraud applications. Leading an effort to leverage Splunk as an anti-fraud platform for online banking.

Since August, 2015: Sr. Product Manager, Fraud Analytics and Research at Splunk, San Francisco Managing projects in fraud analytics, advanced threat detection and investigation spaces.

Author of several Patent Applications for fraud detection with Deep Learning.

© 2018 SPLUNK INC.
Challenges With Existing Off-the-shelf Privacy Systems
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

© 2018 SPLUNK INC.
General Requirements for Privacy Platform, cont.
 Ability to add unlimited number of new use cases quickly  Ability to tune system metrics, detection thresholds  Ability to detect anomalies with minimal amount of false positives  Ability to generate custom reports, visualize data, customizable tables and one-
click drilldowns  Implement in-system case management  Ability to monitor data consistency and data flow stability

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

Specific Use Cases:

© 2018 SPLUNK INC.

 Suspicious access to patient records:  Suspicious Access to Medications:

 Access outside of working hours

 Medication removal and access in

 VIP patient records access

suspicious way

 Patient record peeking

 Anomalous activity over controlled

 Employee access to other

substances

employee records

 Pharmacy cabinet access in

 Deceased patient records access

anomalous manner

 Failed logins, access by inactive users

 Investigation Dashboards:  All activity across campus, department or specific provider titles  All activity by specific provider  All activity on specific patient's record  All activity across specific healthcare application or data source  Baseline and compare usage among peers

© 2018 SPLUNK INC.

Successful Healthcare Monitoring Platform
Key Features of successful Healthcare Monitoring and Auditing Platform

Ernst Katchour, ernst@sigbay.com

CEO and Founder, SigBay, Inc., Splunk Technology Alliance Partner

Business Drivers
What is the main goal of the project in a business perspective
 Scalable, extensible solution to facilitate Privacy Officer's operations in · Auditing · Monitoring · Investigations
 Improve existing processes. · Provide access across all records. · Reliable and timely data for investigations · Ability to manage user roles
 Increase efficiency · Reduce false positive alerts · Create consistent workflow · Direct information to the appropriate privacy office for investigation

© 2018 SPLUNK INC.

Technical Drivers
What is the main goal of the project in a technical perspective
 Aggregate data from multiple applications  Define normalized data models  Centrally monitor patient record access
· Monitor privacy violations, generate alerts · Define and implement workflow for privacy investigations  Provide privacy reports  Provide data integrity reports

© 2018 SPLUNK INC.

Technical Challenges
What issues did we run into on the technical side

© 2018 SPLUNK INC.

 Data comes in a dizzying array of unpredictable formats and structures and in a large variety, velocity and volume.
 Mix of structured (csv, tsv, psv, other) and unstructured data  Some complexities in terms of field or time extraction  Creative regex-ing needed to clean garbage characters without pre-processing  Not all data was available at the same time

Existing Solutions
What are the issues with existing non Splunk Solutions

© 2018 SPLUNK INC.

 Expensive
 In some deployments only fraction of functionality is used
 Data must match internal data models and fit predefined standarts
 Require customization with every deployment (every customer has custom EMR data to meet each doctor's requirements)
 Require ongoing maintenance/management by a team of 4-7 people to get to a usable state

Splunk Advantage
Why use Splunk
 Extremely easy to onboard any data and customize Splunk to that data  Extremely easy to maintain  Can complement existing solutions  Fast time to value  Real time alerting capabilities  Can help monitor compliance with Meaningful Use

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Key Components
Data Models representing data from various application logs

 EPIC  Agility (Employee Health EMR Software)  Athena  ARMS (Ambulatory Revenue Management Software)  Cerner Lab  CROWN Eagle  eCompas  Allscripts SCM  Eclipsys SRM  EMPI (Enterprise Master Patient Index)

 EzVac (Vaccination Immunization Information System)  IDX  ImageCast  iNYP  IPRS (International Patient Relations System)  OR Manager  PACS  PSS (Patient Safe Solutions for medication dispensing)  Soarian  Streamline  Teleresults

© 2018 SPLUNK INC.

Key Components
Use Cases

 Employee Access to Employee Patient Records
 Failed Login Attempts  Compare Usage Among Peers  Access by Inactive User  Access to VIP  Accesses by User Over Time  Accesses by Users to a Given MRN  Higher than User Normal  Excessive Hours with Activity  Access Outside of Work Hours  Excessive Demographics Access

 Employee Access to Employee Patient Records
 Failed Login Attempts  Compare Usage Among Peers  Access by Inactive User  Access to VIP  Accesses by User Over Time  Accesses by Users to a Given MRN  Higher than User Normal  Excessive Hours with Activity  Access Outside of Work Hours  Excessive Demographics Access

Key Components
Alerts

© 2018 SPLUNK INC.

Alerts are monitored by NYP Information Security staff, who follow up on alerts. Incident Manager automates that process by triggering alerts.
 Example Alerts: · Higher-than-user-normal · Persistent High Volume · Accesses to Consecutive MRNs · Excessive hours-with-activity · Deviation from activity of peers (same department and title) · Excessive SSN Accesses · Access to VIP & Employee Patients · Access by inactive user

© 2018 SPLUNK INC.

Technical Approach
Splunk Healthcare Privacy Monitoring and Auditing Platform

Jay Benfield, jay@sigbay.com

Senior Architect, SigBay, Inc.

Development Environment
Simple = Better
 Single instance of Splunk 7  RedHat Enterprise Linux VM  Limited RAM, CPU, Disk  NFS attached storage  3 months of audit logs  User data from LDAP

© 2018 SPLUNK INC.

RHEL VM

NFS

Existing Log Aggregation Point

Audit Log Data
Data discovery, analysis, and ingest

© 2018 SPLUNK INC.

Audit logs from clinical applications
 Commercial and custom software
 Approach to normalization allows for easy integration of new data sources
 Mix of structured (csv, tsv, psv, other) and unstructured data
 Some complexities in terms of field or time extraction
 Creative regex-ing needed to clean garbage characters without preprocessing

agility amalga arms athena cerner eagle eclipsys empi_matchmetrix ezvac imagecast

iprs meditech mynypmobile omnicell ormanager pss soarian srm streamline teleresults

Some of the data sources leveraged in the app.

Indexing Challenge: Time
Using datetime.xml to combat an unusual time configuration

© 2018 SPLUNK INC.

Indexing Challenge: Garbage
Taking out the trash with SEDCMD

© 2018 SPLUNK INC.

Development Standards & Conventions
Guiding principles and conventions to direct solution development

© 2018 SPLUNK INC.

Early definition of standards vital
 Established consistency in naming conventions across indexes and source types
 Defined index layout to enable access control needs by hospital campus/location
 Guidelines and methodology for field extractions and other index/searchtime configuration
 Approach to lookups, lookup generation, summary population, macros, etc.

Indexed lookup data for greater flexibility

Legacy System
Pre-Splunk solution for privacy monitoring

© 2018 SPLUNK INC.

 Application developed in-house
 Provided baseline requirements
 Legacy App SME a tremendous asset to understand data, reporting, and team operations

Primary Use Cases
Dashboards, reports, and alerts to provide needed visibility

© 2018 SPLUNK INC.

 Accesses by User Over Time  Accesses by Users to a Given MRN  Higher than User Normal  Excessive Hours with Activity  Access Outside of Work Hours  Excessive Demographics Access

 Employee Access to Employee Patient Records
 Failed Login Attempts  Compare Usage Among Peers  Access by Inactive User  Access to VIP

Solution Building Blocks
Key information across data sources for use case development

© 2018 SPLUNK INC.

Patient Identification
Medical Record Numbers (MRNs) of patients accessed by employees

User Information
Employee usernames, locations, job functions, and status

User Actions
User actions performed on patient records across disparate systems

Patient IDs
Patient MRNs from audit logs and lookups

© 2018 SPLUNK INC.

 Audit log data may contain: · Enterprise Unique Identifier · Local Identifier(s) · Application-specific Patient Identifier · No Patient Identifier
 Lookups used to: · Map Enterprise Unique ID to Local IDs · Map app IDs to Local IDs

EUID

EUID

LID

LID

LID

LID

LID

LID

Patient IDs: The "Big Lookup"
Mapping of local IDs to enterprise ID

 Export from internal system with 40 million rows plus daily incremental updates
· Initially implemented with KV Store but
encountered serious performance issues and failures
· Implemented as a standard lookup with solid
performance
 Summary index patient_id populated with EUID if exists and uses LID if no EUID
 Dashboards, reports, and alerts leverage patient_id

1.1 GB lookup file size

© 2018 SPLUNK INC.

User Information
Employee data from enterprise LDAP
 Identity data essential across all use cases: · Username · Real name · Hospital affiliation, department, title · Account status
 Automatic lookups used to normalize application-specific usernames/IDs for specific source types
 Also used to create Personnel dashboard

© 2018 SPLUNK INC.

User Actions
Normalizing user activity to higher-level action categories

© 2018 SPLUNK INC.

 Thousands of individual appspecific actions in audit logs mapped to higher-level categories (e.g., create, view, update, etc.)
 Normalization originally via lookup but moved to event types
 A manual process made much easier with Splunk search

90,000+ unique actions in 24h of data

Dashboard/UI Strategy
Approach to instrumentation

© 2018 SPLUNK INC.

 Consistent UI controls for filtering by application, action, and user/MRN.
 Data presented from various dimensions · By user: Patient records viewed by a user over
time by application and action.
· By patient: User activity on a specific patient
record over time by application and action.

 Dashboards driven by summary index and accelerated data model
 Extensive use of drilldowns including to print-friendly reports
 Utility dashboards to "auto-document" data source status

© 2018 SPLUNK INC.
Splunk Legal-Approved Screenshot Here Compare Usage Among Peers

© 2018 SPLUNK INC.
Splunk Legal-Approved Screenshot Here

© 2018 SPLUNK INC.
Splunk Legal-Approved Screenshot Here

Key Takeaways
Lessons learned or reinforced

© 2018 SPLUNK INC.

 Define conventions up front to save time and re-work
 I <3 Lookups · | lookup vs. automatic lookups · Indexed lookup data + output lookup = J
 KV Store is great but it has its limitations
 Indexed extractions directly to normalized field names
 Splunk is just as awesome with clinical data as it is with IT stuff

Luke Murphey's Lookup File Editor is essential.

Conclusion
 Splunk provides the scale needed for healthcare privacy and auditing using both on-premises/cloud/hybrid deployment

© 2018 SPLUNK INC.

 Minor dependency on data formats and data delivery mechanisms

 You have complete control over all aspects of the platform - from data ingestion to alerting, investigations and case closed.

 Use to solve large number of healthcare privacy and auditing use cases.

 Predictable effort to manage, customize and enhance platform.

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

Q&A

© 2018 SPLUNK INC.

Gleb Esman, gesman@splunk.com
Ernst Katchour, ernst@sigbay.com
Jay Benfield, jay@sigbay.com

Sr. Project Manager, Fraud Analytics and Research, Splunk. CEO and Founder, SigBay, Inc., Splunk Technology Alliance Partner Senior Architect, SigBay, Inc.

