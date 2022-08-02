Ransomware: Hard to Stop for Enterprises, Highly Profitable for Criminals
Peter Connolly, SE Adrian Turner, EMEA Partner Manager

Mail Server

Attacker Client

File Share

Client Client Client

1. A user's machine gets infected with malware
2. The malware downloads an encryption program
3. Begins encrypting files on the client
4. Spreads to network shares that the client is connected to
5. Spreads infected document(s) to other users/systems
6. Ransom is paid using Bitcoin, which is extremely difficult to track

?

?

Bad Actor

FTP SSH HTTP

SMTP

LDAP
MySQL
Database

Target Host
ICMP & TCP

Mail server

· Various behaviors · Data exchanged across boundaries (north-
south, east-west) · Takes place slowly, over a period of 30+ days
Comprehensive observation has never been possible until now

Most importantly ... catch ransomware attacks live, in real time

Unstructured Packets

Structured Wire Data

Application & User Behavior Privileged user logins Unauthorized connections Lateral network traversal Brute force attacks Storage/DB access Fraudulent transactions Large data transfers

Protocol Activity Unencrypted FTP Telnet Gopher TACACS SNMP v1, v2, v2c Finger IRC

Encryption Profile Certificate expiration Key length Outdated SSL sessions MD5/SHA-1 cert signing SSL traffic by port Email encryption Wild card certificates

Compliance SSH tunneling Non-standard ICMP Non-standard DNS Non-standard HTTP Disallowed file types Invalid file extension writes Blacklisted traffic

CVE Detection Shellshock HTTP.sys Turla malware Heartbleed FREAK SSL/TLS POODLE Logjam

Automate intelligent firewall actions
Quarantine ransomware-infected clients Supplement threat intelligence Verify policy enforcement

Enrich SIEM platforms
Improve detection of threats inside the perimeter Trace historical activity leading up to an event Store user login activity
Big Data lake for security

Proactively Assess Actual Risk Profile

Application Behavior & Anomaly Detection (ABAD)

· Database and HTTP response sizes vs baseline · Queries used in SQL injection attacks · Protocols used on non-standard ports · Citrix ICA launches that are "out of profile"

Network Behavior & Anomaly Detection (NBAD)

· Traffic for banned ports and protocols · Compromised servers connecting to Russian domains via DNS · Massive DDoS using UDP:80 traffic · Detect lateral movement via scanning/probing

Business Process (Layer 7) Anomaly Detection

· Phishing scams and bot/screen scraper detection · Attempted fraud activity · Unexpected HTTP methods/content types

Attack Surface Reduction

· Compromised servers within the corporate network · Insecure ciphers and key sizes

Security Infrastructure Monitoring / Control Validation

· Firewall rules testing/validation · Network segregation (e.g. QA/Prod) · Security scans/testing that may disrupt operations · Proxies, blocking technologies are blocking things inappropriately · Locked-down VDI environment validation

"We generate huge amounts of data, but prior to ExtraHop, we had no scalable way to mine that data, let alone extract insight and value from it. With ExtraHop, we can now gain a really good understanding of the who, what, when, where, and how of our environment."
- Lee Riches, Operational Analyst, Sportingbet

Application Behavior & Anomaly Detection (ABAD) Network Behavior & Anomaly Detection (NBAD) Business Process (Layer 7) Anomaly Detection Attack Surface Reduction Security Infrastructure Monitoring / Control Validation
Network and Application Forensics Data Exfiltration Detection Realization of Threat Intelligence Availability
Compliance Authentication Monitoring Encryption and Certificate Analysis

