Secure Content Delivery Using Amazon CloudFront
Eric Chu, eCloudvalley Digital Technology

What to Expect from the Session
In this session we will talk about: · Why security matters · Key aspects of security · How Amazon CloudFront can help · Best practices for secured delivery on
Amazon CloudFront

Overview: Why Security Matters
· Customer Trust · Regulatory Compliance · Data Privacy

How AWS Can Help

In the cloud, security is a shared responsibility
https://aws.amazon.com/compliance/shared-responsibility-model/

SOC 1,2,3 ISO 27001/2 Certification
PCI DSS 2.0 Level 1-5 HIPAA/SOX Compliance FedRAMP, FISMA & DIACAP
ITAR
How we secure our infrastructure

Infrastructure Security

Application Security

Encrypt data in transit Encrypt data at rest
Protect your AWS Credentials Rotate your keys
Secure your application, OS, Stack and AMIs
How can you secure your application?

Services Security

What security options and features are available to you?

Enforce IAM policies Use MFA, VPC, Leverage S3
bucket policies EC2 Security groups EFS in EC2, ACM, etc.

How CloudFront Can Help
Security on CloudFront

PCI DSS 2.0 Level 1 ISO 9001, 27001,
27017, 27018

Infrastructure Security

Application Security

IAM Policies Origin Protection
Rotate Keys Rotate Certificates

Services Security
SSL/TLS Options Private Content Origin Access Identities Web Application Firewall AWS CloudTrail

How CloudFront Can Help

What should you do?

What CloudFront does automatically

+

What you can do using CloudFront
features

=

Highly secure content delivery

Infrastructure Security

Application Security

Infrastructure Security

Services Security

How we secure our infrastructure

Infrastructure Security

Facilities

Physical Security Cache Infrastructure

+

Network Infrastructure

What should you do?

=

Highly Secure Content Delivery

Infrastructure Security
· Bastion hosts for maintenance · Two-factor authentication
x · Encryption · Separation to enhance containment · Testing & metrics
CloudFront Edge Location

Infrastructure Security

Infrastructure Security

Application Security

Services Security

Services Security

Security options and features available on CloudFront

Services Security

High Security Ciphers PFS OCSP Stapling Session Tickets

What should you do?

+

SSL/TLS Options Private Content Trusted Signers Web Application Firewall AWS CloudTrail AWS Certificate Manager

=

Highly Secure Content Delivery

CloudFront can protect `Data in Transit'

CloudFront Protects Data in Transit

· Deliver content over HTTPS to protect data in transit

Origin

· HTTPS Authenticates

Edge

CloudFront to Viewers

Location

· HTTPS Authenticates Origin to CloudFront

User Request A

CloudFront enables advanced SSL features automatically

Advanced SSL/TLS
· Improved Security
· High security ciphers · Perfect Forward Secrecy

· Improved SSL Performance
· Online Certificate Status Protocol (OCSP Stapling)
· Session Tickets

Advanced SSL/TLS: Improved Security
· CloudFront uses high security ciphers

· Employs ephemeral key exchange
· Enables Perfect Forward Secrecy

CloudFront Edge location

Advanced SSL/TLS: Improved Performance
· Session Tickets
· Online Certificate Status Protocol (OCSP Stapling)

Session Tickets
· Session tickets allow client to resume session
· CloudFront sends encrypted session data to client
· Client does an abbreviated SSL handshake

CloudFront Edge location

OCSP Stapling
1) Client sends TLS Client Hello
2) CloudFront requests certificate status from OCSP responder
3) OCSP responder sends certificate status
4) CloudFront completes TLS handshake with client
5) Request/response from Origin Server

Amazon
CloudFront 1

4 Client

5 Origin Server

2

3

OCSP Responder

OCSP Stapling

Client Side Revocation Checks

...

0

50

100

150

200

250

(time in milliseconds)

OCSP Stapling
TCP Handshake Client Hello Server Hello

0

50

100

150

(time in milliseconds)

DNS for OCSP Responder TCP to OCSP Responder OCSP Request/Response

... Follow Certificate Chain Complete Handshake Application Data

120 ms faster

30% 200

250

Improvement

Validate Origin Certificate
· CloudFront validates SSL certificates to origin  Origin domain name must match Subject
Name on certificate  Certificate must be issued by a Trusted CA  Certificate must be within expiration window

But there are things you need to do

Deliver Content using HTTPS
· CloudFront makes it easy
· Create one distribution, and deliver both HTTP & HTTPS content
· There are other options as well:
· Strict HTTPS
· HTTP to HTTPS redirect

CloudFront TLS Options

· Default CloudFront SSL Domain Name
· CloudFront certificate shared across customers
· When to use?
· Example: dxxx.cloudfront.net

· SNI Custom SSL
· Bring your own SSL certificate

· Dedicated IP Custom SSL
· Bring your own SSL certificate

· OR use AWS Certificate Manager · OR use AWS Certificate

· Relies on the SNI extension of the Transport Layer Security protocol

Manager · CloudFront allocates

dedicated IP addresses to

· When to use?

serve your SSL content

· Example: www.mysite.com · Some older browsers/OS do not
support SNI extension

· When to use?
· Example: www.mysite.com · Supported by all browsers/OS

Integrated with AWS Certificate Manager

Before (time-consuming & complex)

After (simple & automated & super fast)

3-5 days
3rd Party Certificate Authority

Upload to IAM via AWS CLI

Connect to CloudFront via AWS CLI

AWS Certificate Manager

End-to-end process within minutes

Using a couple of mouse clicks on the console

MapBox

MapBox uses SNI Custom SSL
· They wanted to use a custom domain · xxxxx.mapbox.com
· Their clients support TLS · They wanted to use an economical option

HTTPS Usage Patterns
· Half bridge TLS termination · Full bridge TLS termination

Half Bridge TLS Termination
· Better performance by leveraging HTTP connections to origin

CloudFront

HTTP

region

Full Bridge TLS Termination
· Secured connection all the way to origin · Use origin `Match Viewer' or `HTTPS Only'

Amazon CloudFront

HTTPS

region

MapBox uses multiple origins
· Have multiple API endpoints (origin servers)
· One with Half Bridge: HTTP from Edge to Origin
· Second with Full Bridge: HTTPS from Edge to Origin

You are not done yet...
You need to protect content cached at the Edge

Access Control
· What if you want to...
· Deliver content only to selected customers · Allow access to content only until `time n' · Allow only certain IPs to access content

Access Control: Private Content

· Signed URLs
· Add signature to the Querystring in URL · Your URL changes

· Signed Cookies
· Add signature to a cookie · Your URL does not change

· When should you use it? · Restrict access to individual files · Users are using a client that doesn't
support cookies · You want to use an RTMP distribution

· When should you use it? · Restrict access to multiple files · You don't want to change URLs

Access Control: Private Content
· Here is an example of a policy statement for signed URLs

Access Control: Private Content
· Under development mode? · Make CloudFront accessible only from your
"Internal IP Addresses"

You are still not done...
What if you want to restrict access based on parameters in the request?

Serving Unnecessary Requests Costs Money

Amazon CloudFront Edge Location

Host: www.internetkitties.com User-Agent: badbot Accept: image/png,image/*;q=0.8,*/*;q=0.5 Accept-Language: en-US,en;q=0.5 Accept-Encoding: gzip, deflate Referer: http://www.InTeRnEkItTiEs.com/ Connection: keep-alive

Scraper Bot

AWS WAF

Host: www.internetkitties.com User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64)..... Accept: image/png,image/*;q=0.8,*/*;q=0.5 Accept-Language: en-US,en;q=0.5 Accept-Encoding: gzip, deflate Referer: http://www.mysite.com/ Connection: keep-alive

Access Control: Web Application

Firewall

Amazon CloudFront Edge Location

Host: www.internetkitties.com User-Agent: badbot Accept: image/png,image/*;q=0.8,*/*;q=0.5 Accept-Language: en-US,en;q=0.5 Accept-Encoding: gzip, deflate Referer: http://www.InTeRnEkItTiEs.com/ Connection: keep-alive

Scraper Bot

AWS WAF

Host: www.internetkitties.com User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64)..... Accept: image/png,image/*;q=0.8,*/*;q=0.5 Accept-Language: en-US,en;q=0.5 Accept-Encoding: gzip, deflate Referer: http://www.mysite.com/ Connection: keep-alive

MapBox uses AWS WAF to protect from bots
·

Good Users Bad Guys

AWS WAF

Serve r

Logs Rule Updater

Threat Analysis

AWS WAF example: A technical implementation
· Blocking bad bots dynamically with AWS WAF web ACLs

AWS WAF Example: Blocking Bad Bots
· What We Need... · IPSet: contains our list of blocked IP addresses · Rule: blocks requests if requests match IP in our IPSet · WebACL: allow requests by default, contains our Rule
· and... · Mechanism to detect bad bots · Mechanism to add bad bot IP address to IPSet

AWS WAF Example: Detecting Bad Bots

· Use robots.txt to specify which areas of your site or webapp should not be scraped
· Place file in your web root
· Ensure there are links pointing to nonscrapable content
· Hide a trigger script that normal users don't see and good bots ignore

· $ cat webroot/robots.txt · User-agent: * · Disallow: /honeypot/
· <a href="/honeypot/" class="hidden" ariahidden="true">click me</a>

AWS WAF Example: Blacklist Bad Bots

· Bad bots (ignoring your robots.txt) will request the hidden link
· Trigger script will detect the source IP of the request
· Trigger script requests change token
· Trigger script adds source IP to IPSet blacklist
· WebACL will block subsequent request from that source

· $ aws --endpoint-url https://waf.amazonaws.com/ waf getchange-token

·{

·

"ChangeToken": "acbc53f2-46db-4fbd-

b8d5-dfb8c466927f"

·}

· $ aws --endpoint-url https://waf.amazonaws.com/ waf update-ipset --cli-input-json '{ "IPSetId": "<<IP SET ID>>", "ChangeToken": "acbc53f2-46db4fbd-b8d5-dfb8c466927f", "Updates": [ { "Action": "INSERT", "IPSetDescriptor": { "Type": "IPV4", "Value": "<<SOURCE IP>>/32" } } ] }'

·{

·

"ChangeToken": "acbc53f2-46db-4fbd-

b8d5-dfb8c466927f"

·}

Preconfigured Protection & Tutorials
https://aws.amazon.com/waf/preconfiguredrules/

Types of attacks that need automation

IP reputation lists

Attackers
HTTP floods

Scans & probes

Bots & scrapers

Infrastructure Security

Application Security

Application Security

Services Security

How can you secure your application and origin?

Application Security

What should you do?

+

IAM Policies Origin Protection OAI

Rotate Keys

Rotate Certificates

=

Highly secure content delivery

Hackers could still bypass CloudFront to access your origin...

Access Control: Restricting Origin Access

· Amazon S3 · Origin Access Identify (OAI)
· Prevents direct access to your Amazon S3 bucket
· Ensures performance benefits to all customers

· Custom Origin · Block by IP Address · Pre-shared Secret Header
· Whitelist only CloudFront · Protects origin from overload · Ensures performance benefits to all customers

Object Access Identity (OAI)

· Only CloudFront can access Amazon S3 bucket

Amazon CloudFront

Amazon S3 bucket

· We make it simple for you

Region Custom
Origin

Shield Custom Origin

1. Whitelisting CloudFront IP Range 2. Whitelist a pre-shared secret origin header

Amazon CloudFront

Amazon S3 bucket

Region Custom Origin

Shield Custom Origin
· Subscribe to SNS notifications on changes to IP ranges · Automatically update security groups · https://github.com/awslabs/aws-cloudfront-samples
Amazon CloudFront

Update IP Range

SNS Message

AWS IP Ranges

Amazon SNS

AWS Lambda

Web app server
Web app server
Security Group

Services Security: IAM
· AWS Managed Policies or create custom policies · Regulate access to CloudFront APIs · Describe user role or permissions

Origin Best Practices

· 1. Match Viewer Origin Protocol Policy
· Enable Only TLS 1.1 or 1.2 to Origin
· Enforce HTTPS Only Connections to Origin

· 2. Restrict Access using Security Groups & Shared Secret

· 3. Use a SHA256 certificate

security group

Origin Best Practices

· 4. Use ELB with Custom certificate

· 5. Use ELB Pre-defined Policy · 6. Send HSTS Header

· *Strict-Transport-Security: max-age=15552000;
· *X-Frame-Options: SAMEORIGIN
· *X-XSS-Protection: 1; mode=block Options

You can request an SSL Certificate from AWS Certificate Manager

Services Security : IAM Examples
· Example 1: Create groups with just access to create invalidations
· Example 2: Just read access to your distributions & configuration

AWS CloudTrail

· Record CloudFront API calls history for:

· Security analysis

CloudWatch

Alarm

· Resource change tracking

· Compliance auditing

CloudFront Distribution Updates

CloudTrail

How to validate your security configurations
https://www.ssllabs.com/ssltest/

Thank You

