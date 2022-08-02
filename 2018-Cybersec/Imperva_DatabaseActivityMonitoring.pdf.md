3/27/2017

Database Activity Monitoring
Darren Harter, SE Manager, North EMEA
© 2016 Imperva, Inc. All rights reserved.

How we can help?
1
GDPR

2

© 2016 Imperva, Inc. All rights reserved.

1

3/27/2017

GDPR is Expansive

General Provisions

Principals

Rights of the Data Subjects

Controller & Processor

Transfer of Personal Data
to third Countries or International Organizations

Data Security
Data Transfer High Risk Obligation

25 32 33 34 35 44 GDPR Chapters and Key Articles for Imperva

Independent Supervisory Authorities

Cooperation & Consistency

Remedies, Liability & Penalties

Provisions Relating to
Specific Processing Situations

Delegated Acts &
Implementing Acts

Final Provisions

3

© 2016 Imperva, Inc. All rights reserved.

C

GDPR Support by Article

Article Requirement

25 Data minimization
User access limits

32 Pseudonymisation,
anonymization
On-going protection,
Testing & verification

33/34

35

44

72 hour data

Data protection Data transfers to

breach notification impact assessment third country or

international

organization

Products

Camouflage SecureSphere

Camouflage SecureSphere

SecureSphere Counterbreach

Camouflage SecureSphere

SecureSphere

Imperva Value

Data masking
User rights mgmt
Privileged user monitoring

Data masking Sensitive data audit

© 2017 Imperva, Inc. All rights reserved.

Breach Detection
Data activity monitoring
Real-time analysis and reporting

Data discovery Classification Assessment

Data across borders policy enforcement
C

2

3/27/2017
Do you know where your data is? And what it is?
2
Discovery and Classification

5

© 2016 Imperva, Inc. All rights reserved.

Where is Your Sensitive Data?
Can you find all your sensitive data on the network? · Network segments · Specific IPs · Specific ports · Specific OSs · Rogue servers?
Can you find it in the database? How granular can you go? · DB / schema instance · Table · Column · Synonym / view · Does it move?
© 2016 Imperva, Inc. All rights reserved.
3

How Do You Know Where Data Is?
How do you know today? · Direct knowledge · Trust business owner · Trust DBA · Scan with 3rd party tool · Team Discovery project How do you know when it changes? · Direct knowledge · Email / phone call? · Manual 3rd party tool? · Automatic 3rd party tool? · Track external change controls? · You don't...?
© 2016 Imperva, Inc. All rights reserved.
Server / Database Discovery Scan

3/27/2017

© 2016 Imperva, Inc. All rights reserved.
4

Discovered Server Results
Select View
© 2016 Imperva, Inc. All rights reserved.
DB Data Classification Scan

3/27/2017

© 2016 Imperva, Inc. All rights reserved.
5

Configuring Custom Classification Rules

3/27/2017

© 2016 Imperva, Inc. All rights reserved.

DB Data Classification Advanced Configuration
Views & Synonyms Save Sample Troubleshooting % Threshold Exclude / Include Filters

© 2016 Imperva, Inc. All rights reserved.

Throttle Settings

6

Data Classification Results

3/27/2017

© 2016 Imperva, Inc. All rights reserved.
Who has access to your data? And How?
6
User Rights Management
14 © 2016 Imperva, Inc. All rights reserved.
7

Use Case 1: Periodic Role Grant Review
· Mandate:
­ Must review all rights ­ Scheduled & repeatable process ­ Ability to audit the effectiveness
· Challenges:
­ Manual reviews are a resource drain & must be repeated periodically
­ Separation of Duties
· Solution:
­ Automate key elements ­ Focus on changes made since last review
© 2016 Imperva, Inc. All rights reserved.
Use Case 2: Finding Excessive Rights
· Mandate:
­ Identify user rights problems ­ Independent review
· Do not rely on DBA or business owner · Auditor, consultant, information security team ­ Look for: · Excessive rights · Separation of duties violations · Dormant users
· Solution:
­ Use information from Data Discovery & Auditing (Sensitive) ­ Provide powerful cross-indexed filtering
© 2016 Imperva, Inc. All rights reserved.

3/27/2017 8

Scope of the Problem #1
From the database perspective:
© 2016 Imperva, Inc. All rights reserved.
Scope of the problem #2
· When assigning role1 to role2:
­ All users related to role1 - get access to ­
­ All objects related to role2
© 2016 Imperva, Inc. All rights reserved.

3/27/2017 9

URM Automation: Step 1
1. Retrieve all User Rights data ("grants")
© 2016 Imperva, Inc. All rights reserved.
URM Automation: Step 2
1. Retrieve all User Rights data ("grants") 2. Build privilege chains ("effective rights")
© 2016 Imperva, Inc. All rights reserved.

3/27/2017 10

URM Automation: Step 3
1. Retrieve all User Rights data ("grants") 2. Build privilege chains ("effective rights") 3. Add enrichment information:
1. Last login, last access, sensitive data types etc.

Last Login: 03/23/2014
© 2016 Imperva, Inc. All rights reserved.

Last Access: 01/31/2014

Viewing Role Grants and Permission Grants

3/27/2017

© 2016 Imperva, Inc. All rights reserved.

11

Use Case 2: Finding Excessive Rights

3/27/2017

© 2016 Imperva, Inc. All rights reserved.

How to remove databases from GDPR scope
3
Minimization / Masking

24 © 2016 Imperva, Inc. All rights reserved.

12

3/27/2017

Data Masking Eliminates Risk

1. Realistic fictional data maintains operational and statistically accuracy 2. Sensitive data is permanently removed 3. Security and compliance overhead are reduced

BEFORE

AFTER

Name Smith Patel

SSN 123-21-9812 992-43-3421

Salary 77,000 83,500

Name Young Lopez

SSN 531-51-5279 397-70-0493

Salary 79,250 81,250

25 © 2016 Imperva, Inc. All rights reserved.

Maintain Operational and Statistical Accuracy

emp_id 0011 0223

username smithr patels

emp_id 2012 2312

name Young Lopez

SSN Sex 123-21-9812 M

· Data elements identified by shared keys masked to the same value

992-43-3421 F

­ Database level: Cascade feature

­ Application level: Related fields feature

SSN 531-51-5279 397-70-0493

Salary · Consistent data value masking
79,250 ­ Across different databases and environments 81,250 ­ Over time

emp_id first_name last_name

Sex

2012

Doug

Young

M

2312

Karen Lopez

F

26 © 2016 Imperva, Inc. All rights reserved.

13

3/27/2017

Reduced Risk Profile, Improved Compliance

Without Imperva data masking
 25 Critical databases  200 Supporting databases  50 Databases for testing  15 BI & analysis systems
285 databases
· Dozens of databases with no "need" for production data.
· Hundreds of users with unnecessary access to sensitive data
· Excessive risk of data loss

With Imperva data masking
- 40 Supporting databases - 50 Databases for testing - 10 BI & analysis systems
100 fewer databases containing sensitive data
· Reduced sensitive data access · Reduced risk of data loss · Separation of duties · Automated compliance reporting

27 © 2016 Imperva, Inc. All rights reserved.

Record what you need, but stay vigilant to security issues
5
Audit and Security

28 © 2016 Imperva, Inc. All rights reserved.

14

Audit Policy Structure

3/27/2017

© 2016 Imperva, Inc. All rights reserved.
Sensitive Data Discovery populates Create Table Groups

© 2016 Imperva, Inc. All rights reserved.

15

Table Group Used in Policy
· Audit if...
­ A user from DBA group... ­ Selects information from... ­ Tables defined as sensitive
in the Solaris Oracle Service_ Personal Details group... ­ ...while logged in local to the database server.
· Data captured would include:
­ Audit all event details ­ Audit response data
· So you can inform the affected person? · So you know the extent of the breach
© 2016 Imperva, Inc. All rights reserved.
Behavioristic Profiling for Database Applications
· Builds a profile on database traffic
­ Gathers database user information: · Source IP addresses · Source applications · Source OS hosts · OS user name · Successful queries
­ Gathers queries into Query Groups · A Query Group = (Target Table, Operation) · Example (Users, Select) · Groups characterize the user's rights · Alert per-query or per-query group violation · Nested queries are documented
© 2016 Imperva, Inc. All rights reserved.

3/27/2017 16

3/27/2017
Database Profiling ­ Detecting changes in behaviour
© 2016 Imperva, Inc. All rights reserved.
What about Security? Blocking SQL Transactions?
· Database security - perceptions:
­ Dangerous to connectivity ­ Change control nightmare ­ Not yet "required" by regulations ­ I might get fired if I do it wrong ­ I would if business owners would let me ­... ­ Excuses, excuses, excuses... We have heard them all.
· ...and we listened!
© 2016 Imperva, Inc. All rights reserved.
17

3/27/2017
Blocking Tools
· SecureSphere gives you the tools to be confident in blocking · Architecture
­ Fail-open inline bridge mode ­ Sniffing with blocking interface configured ­ Blocking on the web application side ­ Agent-based blocking abilities
· Mode
­ Simulation / Active
· Policy granularity
­ Custom Correlation Policies ­ Profiling
© 2016 Imperva, Inc. All rights reserved.
Imperva Understands Reality
· If you cannot use database security blocking initially, leave it off until you can:
­ Security policies do not have to block ­ use for notifications ­ Leave in Simulation mode ­ Use sniffing without a blocking interface configured
· However, significant benefits
­ Web/DB correlation: audit web user and original source info ­ Block/quarantine web application user when abusing application ­ Prevent unauthorized database access by profile or custom policies ­ Prevent catastrophic events ­ SQL injection to "drop database" ­ Ability to focus only on the obviously "bad" events ­ Also able to aggressively secure very sensitive environments
© 2016 Imperva, Inc. All rights reserved.
18

And Finally...
37 © 2016 Imperva, Inc. All rights reserved.

3/27/2017

19

