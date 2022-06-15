SESSION ID: CSV-W09
Serverless Attack Vectors

Teri Radichel
CEO 2nd Sight Lab @teriradichel

#RSAC

#RSAC
Serverless is secure right?
Nothing to worry about.

#RSAC
Why do breaches happen?
Mistakes happen.

#RSAC
Functions are secure right?
Just like the blockchain (j/k).

The evolution of serverless.
Not just functions.

AWS Lambda

#RSAC
Amazon S3 bucket

Azure Storage Accounts
Google Cloud Run

AWS Fargate
Google Cloud Functions

Amazon Aurora

AWS Serverless Application Repository

Serverless architecture.
Connecting the dots.

Amazon API Gateway

#RSAC
AWS Lambda

Amazon CloudFront
AWS Lambda Amazon Simple Queue
Service

AWS Fargate

Amazon DynamoDB

#RSAC
Serverless under the hood.
The cloud provider.

#RSAC
Questions for the CSP
People and technology

#RSAC
AWS, Azure, Google
Biggest risk?

#RSAC
What to worry about?
Look at recent breaches.

#RSAC
The misconfigurations.
Why is this happening?

#RSAC
What could go wrong?
Serverless still runs software.

#RSAC
Serialization
Still exists in serverless.

Function stack.
Secure your code.

#RSAC
A Cloud Function
YOUR CODE
cloud provider

#RSAC

How will attackers get in?
The same way they always do.

Interpretation for Serverless

For example: Injection
Code works the same in a function.

#RSAC
String query = "SELECT * FROM accounts WHERE custID='" + request.getParameter("id") + "'";
http://example.com/app/accou ntView?id=' or '1'='1
String query = "SELECT * FROM accounts WHERE custID='" + ' or '1'='1 + "'";

Another example
Auth injection ­ curl request

#RSAC
curl -vs --request PUT --url 'https://xxxxxxxxxxxxxxxx/Customer/%3Cscript%3Ealert(%22X% 20SS%22);%3C/script%3E' --header 'authorization: Bearer mV3ZWJzaiJS22kMajksXJYep0HbL1o1y1KyK2WBhMWM4NDFiLT UwNWItNDgyMi1hMzQ3LWFlZDQ1NDMyYTM3MCIsInR5cCI6Ikp
XVCJ9.eyJuYmYiOjE1ODA3ODc0MjcsImV4cCI6MTU4YOIOQU AeKYwiaXNzIjoiaHR0cHM6Ly90ZXN02ZTIdGVycHJpc2Utc2Vj dXJpdHktYXV0aG9yaXphdGlvbnNlcnZpY2UtYXBpLnRlc3QtZ TItZXh0ZXJuYWwtYXNlLnAuYXp1cmV3ZWJzaXRlcy5uZXQiLC JhdWQiOlsiaHR0cHM6Ly90ZXN0LWUyLWVudGVycHJpc2Utc 2VjdXJpdHktYXV0aG9yaXphdGlvbnNlcnZpY2UtYXBpLnRlc3 QtZTItZXh0ZXJuYWwtYXNlLnAuYXp1cmV3ZWJzaXRlcy5uZX QvcmVzb3VyY2VzIiwiZGVmYXVsdCJdLCJjbGllbnRfaWQiOiJT ZWNvbmRTaWdodExhYi5QZW5UZXN0IiwicGVybWlzc2lvbn MiOiIiLCJwZXh0ZXJuYWwtYXNlLnAuYXp1cmV3ZWJA4YiIsIm NsaWVudF9wYXJ0eV9tZW1iZXJfaWQiOiI2ZTI4N2ZTIiNjhmL TQ3ODUtODZjYi1jODMzZDA1NWMwOGIiLCJzY29wZSI6WyJ kZWZhdWx0Il19.coFeQS3qID8uzdr6chr3qnglflFIfLMCi0l5WMY
6L22kMajksXJYep0HbL1o1y1KyK2WmDD7DgVQiHsCmdbIiFyN0LWUyK3JL6lTo0XjJAHTJ0MGVjdXJpdHktYXV0aG97_3FVGugq8WdYIawaK oujd4N-3D06DirUlKKhYkAyGKGQmRm5vcT3WdXvChbieHa5ybSLUQ1oYP31X186NTN8NUN xs7pAS6P4bLM771LCRMrzmqUI2B-43oYr-dr6cDZlM5R1TaVPQvhSAwh-ztsHPhLMJN8Ky5UOIOQUAeKY96hV4_RXPL2VzIiwiZGVYXVsdCJdLCBmXv0Q' -header 'x-correlation-id: 2slsightlabpentest' 2>&1

Another example
Auth injection ­ HTTP Request

#RSAC
PUT /Customer/%3Cscript%3Ealert(%22X%20SS%22);%3C/script%3E HTTP/2 Host: xxxxxxxxxxxxxxxx User-Agent: curl/7.61.1 Accept: */* authorization: Bearer mV3ZWJzaiJS22kMajksXJYep0HbL1o1y1KyK2WBhMWM4NDFiLTUwN WItNDgyMi1hMzQ3LWFlZDQ1NDMyYTM3MCIsInR5cCI6IkpXVCJ9.eyJ uYmYiOjE1ODA3ODc0MjcsImV4cCI6MTU4YOIOQUAeKYwiaXNzIjoiaHR 0cHM6Ly90ZXN02ZTIdGVycHJpc2Utc2VjdXJpdHktYXV0aG9yaXphdGlv bnNlcnZpY2UtYXBpLnRlc3QtZTItZXh0ZXJuYWwtYXNlLnAuYXp1cmV3Z WJzaXRlcy5uZXQiLCJhdWQiOlsiaHR0cHM6Ly90ZXN0LWUyLWVudGVyc HJpc2Utc2VjdXJpdHktYXV0aG9yaXphdGlvbnNlcnZpY2UtYXBpLnRlc3Qt ZTItZXh0ZXJuYWwtYXNlLnAuYXp1cmV3ZWJzaXRlcy5uZXQvcmVzb3VyY 2VzIiwiZGVmYXVsdCJdLCJjbGllbnRfaWQiOiJTZWNvbmRTaWdodExhYi5 QZW5UZXN0IiwicGVybWlzc2lvbnMiOiIiLCJwZXh0ZXJuYWwtYXNlLnAu YXp1cmV3ZWJA4YiIsImNsaWVudF9wYXJ0eV9tZW1iZXJfaWQiOiI2ZTI4 N2ZTIiNjhmLTQ3ODUtODZjYi1jODMzZDA1NWMwOGIiLCJzY29wZSI6W yJkZWZhdWx0Il19.coFeQS3qID8uzdr6chr3qnglflFIfLMCi0l5WMY6L22k MajksXJYep0HbL1o1y1KyK2WmDD7DgVQiHsCmdbIi-FyN0LWUyK3JL6lTo0XjJAHTJ0MGVjdXJpdHktYXV0aG97_3FVGugq8WdYIawaKoujd4 N-3D06DirUlKKhYkAyGKGQmRm5vcT3WdXvChbieHa5ybSLUQ1oYP31X186NTN8NUNxs7pA S6P4bLM771LCRMrzmqUI2B-43oYr-dr6cDZlM5R1TaVPQv-hSAwhztsHPhLMJN8Ky5UOIOQUAeKY96hV4_RXPL2VzIiwiZGVYXVsdCJdLCBmXv0Q xcorrelation-id: 2slsightlabpentest Content-Length: 988 Content-Type: application/x-www-form-urlencoded

Another example
Auth injection ­ Problem #1

HTTP/2 403 date: Tue, 14 Feb 2020 03:37:43 GMT content-type: application/json content-length: 2244 x-amzn-requestid: xxxxxx x-amzn-errortype: IncompleteSignatureException x-amz-apigw-id: xxxxxx

#RSAC

{"message":"'mV3ZWJzaiJS22kMajksXJYep0HbL1o1y1KyK2WBhMWM4NDFiLTUwNWItNDgyMi1 hMzQ3LWFlZDQ1NDMyYTM3MCIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE1ODA3ODc0MjcsImV4cCI6MT U4YOIOQUAeKYwiaXNzIjoiaHR0cHM6Ly90ZXN02ZTIdGVycHJpc2Utc2VjdXJpdHktYXV0aG9yaXphd GlvbnNlcnZpY2UtYXBpLnRlc3QtZTItZXh0ZXJuYWwtYXNlLnAuYXp1cmV3ZWJzaXRlcy5uZXQiLCJhd WQiOlsiaHR0cHM6Ly90ZXN0LWUyLWVudGVycHJpc2Utc2VjdXJpdHktYXV0aG9yaXphdGlvbnNlcn ZpY2UtYXBpLnRlc3QtZTItZXh0ZXJuYWwtYXNlLnAuYXp1cmV3ZWJzaXRlcy5uZXQvcmVzb3VyY2VzIi wiZGVmYXVsdCJdLCJjbGllbnRfaWQiOiJTZWNvbmRTaWdodExhYi5QZW5UZXN0IiwicGVybWlzc2lv bnMiOiIiLCJwZXh0ZXJuYWwtYXNlLnAuYXp1cmV3ZWJA4YiIsImNsaWVudF9wYXJ0eV9tZW1iZXJfa WQiOiI2ZTI4N2ZTIiNjhmLTQ3ODUtODZjYi1jODMzZDA1NWMwOGIiLCJzY29wZSI6WyJkZWZhdWx 0Il19.coFeQS3qID8uzdr6chr3qnglflFIfLMCi0l5WMY6L22kMajksXJYep0HbL1o1y1KyK2WmDD7DgV QiHsCmdbIi-FyN0LWUyK3JL6lTo0XjJAHTJ0MGVjdXJpdHktYXV0aG97_3FVGugq8WdYIawaKoujd4N-3D06DirUlKKhYkAyGKGQmRm5vcT3WdXvChbieHa5ybSLUQ1oYP31X186NTN8NUNxs7pAS6P4bLM771LCRMrzmqUI 2B-43oYr-dr6cDZlM5R1TaVPQv-hSAwh-ztsHPhLMJN8Ky5UOIOQUAeKY96hV4_RXPL2VzIiwiZGVYXVsdCJdLCBmXv0' not a valid key=value pair (missing equal-sign) in Authorization header: 'Bearer mV3ZWJzaiJS22kMajksXJYep0HbL1o1y1KyK2WBhMWM4NDFiLTUwNWItNDgyMi1hMzQ3LWFlZD Q1NDMyYTM3MCIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE1ODA3ODc0MjcsImV4cCI6MTU4YOIOQUAeK YwiaXNzIjoiaHR0cHM6Ly90ZXN02ZTIdGVycHJpc2Utc2VjdXJpdHktYXV0aG9yaXphdGlvbnNlcnZpY2 UtYXBpLnRlc3QtZTItZXh0ZXJuYWwtYXNlLnAuYXp1cmV3ZWJzaXRlcy5uZXQiLCJhdWQiOlsiaHR0cH M6Ly90ZXN0LWUyLWVudGVycHJpc2Utc2VjdXJpdHktYXV0aG9yaXphdGlvbnNlcnZpY2UtYXBpLnRl c3QtZTItZXh0ZXJuYWwtYXNlLnAuYXp1cmV3ZWJzaXRlcy5uZXQvcmVzb3VyY2VzIiwiZGVmYXVsdCJ dLCJjbGllbnRfaWQiOiJTZWNvbmRTaWdodExhYi5QZW5UZXN0IiwicGVybWlzc2lvbnMiOiIiLCJwZX h0ZXJuYWwtYXNlLnAuYXp1cmV3ZWJA4YiIsImNsaWVudF9wYXJ0eV9tZW1iZXJfaWQiOiI2ZTI4N2Z TIiNjhmLTQ3ODUtODZjYi1jODMzZDA1NWMwOGIiLCJzY29wZSI6WyJkZWZhdWx0Il19.coFeQS3qI D8uzdr6chr3qnglflFIfLMCi0l5WMY6L22kMajksXJYep0HbL1o1y1KyK2WmDD7DgVQiHsCmdbIiFyN0LWUyK3-JL6lTo0XjJAHTJ0MGVjdXJpdHktYXV0aG97_3FVGugq8WdYIawaKoujd4N3D06DirUlKKhYkAyGKGQmRm5vcT3WdXvChbieHa5ybSLUQ1oYP31X186NTN8NUNxs7pAS6P4bLM771LCRMrzmqUI 2B-43oYr-dr6cDZlM5R1TaVPQv-hSAwh-ztsHPhLMJN8Ky5UOIOQUAeKY96hV4_RXPL2VzIiwiZGVYXVsdCJdLCBmXv0

#RSAC
Another example
Auth injection - Problem #2

#RSAC
Another example
Auth injection ­ Exploit.

#RSAC
APIs
Fuzz all the things.

#RSAC
Coverage
vs. stealth.

All the rest
Every OWASP top 10 attack applies

#RSAC
OWASP Top 10 Injection Broken Authentication Sensitive Data Exposure XXE Broken Access Control Security Misconfiguration XSS Insecure Deserialization CVEs Poor logging & monitoring

#RSAC
MITRE AT&CK
For cloud.

#RSAC
Persistence
How secure are your deployments?

Infrastructure attack surface?
Everything your application uses.

#RSAC
IAM Network Storage 3rd-Party Code Queues API Gateway
CDN DNS
cloud provider

#RSAC
IAM
SSRF, pivoting, escalation.

#RSAC

Secrets in all the things
More places to hide.

Amazon S3 bucket
AWS CloudFormation

#RSAC
Encryption
Doesn't always save you.

#RSAC
Network
What is exposed?

3rd Party Code
Injection

#RSAC
Application

#RSAC
Serverless Frameworks
Hosted data, insecure defaults, flaws

#RSAC

API Gateway
Poor architecture and misconfigurations

Amazon API Gateway

#RSAC
CDN
Caches, unidentifiable traffic, bypass, CORS

#RSAC
Lambda@Edge
Where are credentials cached?

Authentication
What can you test?

#RSAC
Amazon Cognito

Databases
What happened to the DBAs?

SQL NoSQL Encryption Transactions Integrity Reconciliation Disaster Recovery Network and IAM

#RSAC

DNS
Subdomain takeover, packets, log issues

#RSAC
DOMAIN.COM CNAME
DOMAIN.3RDPARTY.COM
DOMAIN.3RDPARTY.COM

#RSAC
Deployment Systems
Who can deploy and how?

#RSAC
Monitoring
Which service caused the error?

Logs
Did you know there was an error?

#RSAC

Amazon Route 53

AWS WAF

Amazon VPC

Amazon CloudFront

AWS CloudTrail

Amazon API Gateway

Amazon Macie

AWS Lambda

Threat Modeling
Thinking holistically about architecture.

#RSAC
Bucket Website

Demo
In action

#RSAC
Attack!

Fix it
Architecture

 Threat modeling

#RSAC

 No replay attacks

 Limited Authorization

 Storage lifecycle

 Consider all paths

 Network access

 Segregation

 Defense in Depth

Fix it
Deployment systems

#RSAC
 Automation  Infrastructure as code  Segregation of duties  Deployment architecture  Security checks  Vulnerability scans  Governance

Fix it
Monitoring and Metrics

#RSAC
 Vulnerability scans  Configuration tracking  CIS Benchmarks  DLP systems  Data Lake / SIEM  Incident response team  Risk metrics

Fix it
Train your decision makers.

#RSAC
 Network security  Database integrity  Application security  Threat modeling  Cloud configurations  Cloud threats and breaches  Application attacks

In summary...

#RSAC
Serverless: The same, But different!

#RSAC
Thank you!
Teri Radichel @teriradichel https://medium.com/cloud/security https://2ndsightlab.com

