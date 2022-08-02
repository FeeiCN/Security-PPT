Viewing the nodes in the noise: Leveraging Data Science to Discover Persistent Threats
...Sharing Threats with US Based Commercial Critical Infrastructure
D. L. Evenden Federal Cyber Security Division 720-578-5365 David.Evenden@centurylink.com
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Agenda
· Intelligence Collection & Redistribution · Lessons Learned · Automating the Work
­ QuarterMaster · Exposure · DGA · Patter
· Questions
CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Intelligence Collection & Redistribution
1. Interested parties get cleared 2. Intel comes in from federal intel
communities 3. DHS collects and redistributes intel
to interested && cleared parties 4. Cleared parties identify vehicles to
leverage intel in commercial spaces
CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Intelligence Collection & Redistribution
Intel Communities

CSP: Verizon

CSP: CenturyLink

Local Gov

Energy

Finance

DIB

CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Intelligence Collection & Redistribution
Standard Configuration
CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Lessons Learned
What works, What hasn't
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Mature Organizations
Saying "Because it's Bad" doesn't work
CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Non-Mature Organizations
Identifying discovered threats
For non-mature organizations advanced methods are required to aid in the endeavors of identifying the exact source of discovered & blocked threats. · Advanced HoneyPot Tactics
· Issuing fake files to retrieve (HII) host identifiable information · WebRTC
· Leveraging existing JS code to retrieve (HII) host identifiable information
· Netflow Traffic · The integration and collection of netflow traffic allows for the identification of the source
CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Findings
· If you are providing IOC's to clients, maintain an Intel database and send them enriched data
· If you are a client that receives IOCs, maintain your own intel database.
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Sourcing your DB
· https://attack.mitre.org/wiki/Groups · https://www.fireeye.com/current-threats/apt-
groups.html · https://apt.securelist.com/#!/threats/ · https://github.com/CyberMonitor/APT_CyberCrimina
l_Campagin_Collections · https://github.com/kbandla/APTnotes · https://github.com/fdiskyou/threat-INTel
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Automating the hard work
Advanced analytics - Cultivating a better Cyber World
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Intelligence Collection & Redistribution
CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Lifecycle

· DNS · Email
Intel Feed

Active Blocking
· In Email · Out DNS

· Exposed Attributed
· Heuristics
Feature Extraction

Additional Analysis
· Passive Algorithmic Analysis

CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Algorithms
Algorithms designed to identify malicious DNS Names
· DGA Algorithm
· Identifies Dynamically Generated Domain Names
· Exposure Algorithm
· Uses Exposed DNS Attributes to identify potentially malicious domains
· Pattern Algorithm
· Uses callback intervals to identify potentially malicious domains
CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Operationalizing Models
· DGA models: · Model only needs to be trained once · Only uses domain name for classifying
· Exposure Model: · Need historical data to train the model · Needs to be re-trained every few months · Classifying domains requires historical features
· Training utilizes batch-processing using a week's worth of data
· Scoring requires semi-real time stream processing with different codebase
CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Leveraging Attributes
This allows us to identify new C2 domains in an unclassified way: using the unclassified attributes of classified indicators sourced from the Intel Community.
CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

DGA
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

DGA Algorithm: Lifecycle
CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

DGA Detection Models
· Analyzing statistical features (randomly-generated) · 60680ad5728991c31277cd43f733903d[.]net · mns34m1qifzti4q7h9qlpik[.]com · rxjthjm1pofte[.]com
· Pre-defined word lists (Dictionary-DGA) · Using NLP techniques, determine when words "don't make sense" together: · hypophyseal-relativity[.]com · machinelike-hypocellularity[.]com · imperative-carborundum[.]com
· words and random characters (Hybrid-DGA) · yawqthdpanxious[.]download · msxvkcijreactivity[.]download
CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Exposure
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Exposure Model
· Using these features and probabilities from DGA models, we train a model using whitelisted and blacklisted domains:
· WhiteListed: · TrendMicro · Symantec · Verizon
· Blacklisted: · bambenekconsulting.com/feeds/ · OTX · AIS
CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Exposure Model

~30 Attributes TTL Registration IP Variations Responses Daily Trends Cost per Query

CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Pattern
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Pattern Algo

Scope Bandwidth

15 Minute

Randomized Variable
~ (+/-) 15 Minutes
7200 Seconds

Callback Interval

CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Not yet. Jeremy said he asked.. just waiting on response/approval.
Viewing the Noise
CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Not yet. Jeremy said he asked.. just waiting on response/approval.
Viewing the Noise
CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Not yet. Jeremy said he asked.. just waiting on response/approval.
Viewing the Noise
configured intervals become apparent
Remove outliers
CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Data Organization & Alerting
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Data Organization
Extended Configuration
CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Data Tagging
Modeling & ELK Tagging Configuration · You can easily us Python to train
your models, process your data, and assign relevant tags in your Elastic dataset
CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Data Tagging
CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Active Blocking from Passive Threat Intelligence
CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Active Blocking from Passive Threat Intelligence
Modeling & ELK Tagging Configuration · You then generate alerts from your
ELK platform that allow you to respond to identified threats.
· Once new threats are passively identified, add them to your active blocking platform
CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

Thank you
Questions
CenturyLink Confidential & Proprietary ­ Not for Distribution
© 2014 CenturyLink, Inc. All Rights Reserved. Not to be distributed or reproduced by anyone other than CenturyLink entities and CenturyLink Channel Alliance members.

