Better Reporting Guidelines for Better Data
Christopher Washington, US-CERT Brian Allen, US-CERT

Disclaimer
This presentation is intended for informational and discussion purposes only.
The Department of Homeland Security (DHS) does not provide any warranties of any kind regarding this information. In no event shall the United States Government or its contractors or subcontractors be liable for any damages, including but not limited to, direct, indirect, special or consequential damages, arising out of, resulting from, or in any way connected with this information, whether or not based upon warranty, contract, tort, or otherwise, whether or not arising out of negligence, and whether or not injury was sustained from, or arose out of the results of, or reliance upon the information.
The display of the DHS official seal or other DHS visual identities, including the US-CERT or ICS-CERT name or logo shall not be interpreted to provide any person or organization the authorization to use the official seal, insignia or other visual identities of the Department of Homeland Security, including US-CERT and ICS-CERT. The DHS seal, insignia, or other visual identities shall not be used in any manner to imply endorsement of any commercial product or activity by DHS, US-CERT, ICS-CERT or the United States Government. Use of the DHS seal without proper authorization violates federal law (e.g., 18 U.S.C. §§ 506, 701, 1017), and is against DHS policies governing usage of its seal.
This presentation is Traffic Light Protocol (TLP): WHITE. Recipients may share TLP: WHITE information without restriction, subject to copyright controls. For more information on the TLP, see http://www.us-cert.gov/tlp.
DHS does not endorse any commercial product or service, including any subjects of analysis. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation, or favoring by DHS.

Homeland Security

Office of Cybersecurity and Communications
2

Who Is US-CERT?
US-CERT Mission:
 To provide a safer, stronger Internet for all Americans by responding to major incidents, analyzing threats, and exchanging critical cybersecurity information with trusted partners around the world
Operations:  24 x 7 Operations Center  Provides technical assistance to information system operators  Disseminates actionable information regarding cyber-threats and vulnerabilities
Incident Reporting:  Per FISMA, Federal agencies are required to report all incidents to US-CERT

Homeland Security

Office of Cybersecurity and Communications
3

Federal Incident Reporting
Cyber Incident reporting before October 1, 2014:
 Based on NIST 800-61 Revision 1  System of 6 categories  OMB M-07-16 ­ All Personally Identifiable Information (PII) incidents
(including paper) must be reported within 1 hour

Homeland Security

Office of Cybersecurity and Communications
4

Pre-Oct 2014 Reporting Taxonomy

Homeland Security

Office of Cybersecurity and Communications
5

Identified Issues
Difficult to assess impact and prioritize incidents
Does not separate incidents (impactful) from events (non-impactful)
Incidents can apply to multiple categories (Ex: Malware used to gain unauthorized access to system)
Categories fuse causes (malware, inappropriate usage) with effects (Unauthorized Access, Denial of Service)
 Cause = Method (or Attack Vector)  Effect = Impact

Homeland Security

Office of Cybersecurity and Communications
6

Updating the Guidelines
US-CERT aligned with NIST 800-61 Rev 2
Separate Cause and Effect
 Cause ­ Attack vector data  Effect ­ Functional impact data  Effect ­ Information impact data  Effect ­ Recoverability data
New incident reporting guidelines:
 Separate incidents (confirmed loss of CIA) from (events) reporting requirements
 Establish a 1 hour timeframe for mandatory reports  Eliminate requirement to identify cause upon submitting initial report  Non-cyber incidents no longer required

Homeland Security

Office of Cybersecurity and Communications
7

Incident Prioritization and Impact Analysis
Multidimensional Approach to Prioritizing Incidents:
Functional impact
 Impact to service availability / business functionality
Information impact
 Confidentiality comprised or data destruction / information exfiltration
Recoverability
 Time and resources to recover from incident

Homeland Security

Office of Cybersecurity and Communications
8

Functional Impact Matrix

Homeland Security

Office of Cybersecurity and Communications
9

Information Impact Matrix

Homeland Security

Office of Cybersecurity and Communications
10

Recoverability Impact Matrix

Homeland Security

Office of Cybersecurity and Communications
11

Attack Vectors

External/Removable Media: An attack executed from removable media
or a peripheral device--e.g., malicious code spreading onto a system from an infected USB flash drive.

Attrition: An attack that employs brute force methods to compromise,
degrade, or destroy systems, networks, or services (e.g., DDoS intended to deny access to a service; brute force attack against an authentication mechanism).

Web: An attack executed from a website or web-based application--e.g., a
cross-site scripting attack used to steal credentials or a redirect to a site that exploits a browser vulnerability and installs malware.

Email: An attack executed via an email message or attachment--e.g.,

exploit code hidden in attachment or malicious URL within the body of an

email.

Homeland Security

Office of Cybersecurity and Communications

12

Attack Vectors (cont'd)

Impersonation: An attack involving replacement of something benign with
something malicious--e.g., spoofing, man in the middle attacks, rogue wireless access points, and SQL injection attacks all involve impersonation.

Improper Usage: Any incident resulting from violation of an organization's
acceptable usage policies by an authorized user, excluding the above categories--e.g., a user installs file sharing software, leading to the loss of sensitive data; or a user performs illegal activities on a system.

Loss or Theft of Equipment: The loss or theft of a computing device or
media used by the organization--e.g., laptop, smartphone, or authentication token.

Other: An attack that does not fit into any of the other categories.

Homeland Security

Office of Cybersecurity and Communications
13

Cause Analysis Workflow

Homeland Security

Cause of Incident Identified?

Vector:

No

UNKNOWN

Yes
Caused by Loss or Theft of Equipment?

Vector: LOST /

STOLEN

Yes

EQUIPMENT

No

Caused by Attrition?

Vector:

Yes

ATTRITION

No

Caused by Remote Exploit Code?

Yes

No

Caused by Impersonation /
Spoofing?

Vector: Yes IMPERSONATION

No
Caused by Improper Usage?

Vector:

IMPROPER

Yes

USAGE

No
Vector: OTHER

Exploit delivered via Email?

Vector: Yes EMAIL EXPLOIT

No

Exploit delivered via World Wide Web?

Vector:

Yes

WEB EXPLOIT

No

Exploit delivered via External Media?

Vector: Yes MEDIA EXPLOIT

Office of Cybersecurity and Communications
14

Three Pronged Approach
Process Preparation:
 Rewrote Incident Reporting Guidance  Released to community for feedback and feasibility check  Coordinated with OMB to update M-series Memo  Published and socialized government-wide
Technology Preparation:
 Updated incident management system  New data fields  Updated incident reporting web form  Updated incident reporting schema and STIX mapping  End-to-end testing
People Preparation:
 Revamp incident handling procedures  Train Staff

Homeland Security

Office of Cybersecurity and Communications
15

Strategic Benefits
Improvement in understanding the risks facing the federal government Improved the timeliness of actionable reporting Improved usefulness of data entry resources Rich, consistent data to support both tactical and strategic decisions

Homeland Security

Office of Cybersecurity and Communications
16

Incident Reporting Categories & Security Controls Relationships

Functional Impact Information Impact
Recoverability
Minimized Via
Manage Events I ­ Manage Contingencies K ­ Manage Incidents

Lost / Stolen Equipment Email Exploit Web Exploit Media Exploit Other Exploit
Primarily Prevented Via
Manage Hardware & Software A ­ Manage Hardware B ­ Manage Software C1 ­ Manage Network Access C2 ­ Manage Physical Access H ­ Manage Configurations (CCEs) M ­ Manage Vulnerabilities (CVEs)

Impersonation Improper Usage
Primarily Prevented Via
Manage Accounts N ­ Screen E -- Train J ­ Manage Credentials D ­ Manage Account Access

Attrition Other Cause Cause Unknown
Primarily Prevented Via
Engineering & Governance L ­ Requirements, Policy, Planning G1 ­ Quality Management F ­ Generic Monitoring G2 -- Operational Security

Homeland Security

Office of Cybersecurity and Communications

Data Example: Category System

Homeland Security

Office of Cybersecurity and Communications
18

Data Examples: Incidents by Vector

Homeland Security

Office of Cybersecurity and Communications
19

Data Examples: Functional Impact

Homeland Security

Office of Cybersecurity and Communications
20

Data Examples: Information Impact

Homeland Security

Office of Cybersecurity and Communications
21

Data Examples: Recoverability

Homeland Security

Office of Cybersecurity and Communications
22

Looking Forward
Running incidents through alternative models
 Microsoft Broad Street  Kill chain  Severity Scoring System  Research and Development
Governance model for updating the guidelines
 Periodical review with Federal CIO Council  Changes made in coordination with OMB and NIST

Homeland Security

Office of Cybersecurity and Communications
23

Homeland Security

Office of Cybersecurity and Communications
24

