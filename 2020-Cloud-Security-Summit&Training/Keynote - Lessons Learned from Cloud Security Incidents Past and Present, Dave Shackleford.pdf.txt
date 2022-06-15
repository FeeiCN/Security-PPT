Lessons Learned from Cloud Security Incidents, Past and
Present
Dave Shackleford CEO, Voodoo Security SANS Sr. Instructor and Course Author

Cloud Incidents are on the Rise
· In the past 10 years, cloud use has grown exponentially
­ Surprise! Attacks soon followed!
· Early attacks were pretty basic
­ Zeus botnet EC2 instance hijacking ­ DoS attacks against resources
· Today, there are a wide range of cloud attacks and incidents seen frequently

MITRE ATT&CK Matrix: Cloud

2014: Code Spaces
· In 2014, Code Spaces' AWS account was hijacked
· The attacker wiped out all assets and backups

Code Spaces Attack Elements

Azure Admin Keys
· Red Hat instances in Azure were found in February 2017 to contain:
­ Exposed admin API keys in a configuration file
­ Embedded details of backend Azure update servers that could be hijacked from tenant instances!!

API Keys Attack Elements

2017: CloudFlare
· In February 2017, the content delivery network (CDN) CloudFlare was exposed by Tavis Ormandy of the Google Project Zero team to have major memory leakage in their web caching services.
· All sorts of sensitive data were exposed, including passwords, authentication tokens, cookies, and sensitive data of many types.

CloudFlare Incident Elements

S3: The Gift That Keeps on Leaking
· Too many S3 bucket leaks to mention all of them...but it's sort of getting ridiculous.
· A few choice ones:
­ 2017: Booz Allen Hamilton (govt. creds) ­ 2018: GoDaddy (Config files) ­ 2019: Verizon (2M customer payment records)

2018: LA Times S3
· Cryptomining malware was injected into LA Times' webpage code stored in a completely open S3 bucket in February 2018
· World-readable AND writeable

S3 Exposure Elements

2018: Tesla's Kubernetes Hijack
· In 2018, researchers at Redlock (now Palo Alto) found an exposed Kubernetes console in AWS
­ The account was owned by Tesla
· There were crypto-mining activities underway in active pods
· The console was not password-protected
­ One pod contained AWS API keys

Kubernetes Cryptomining Attack Elements

Ransomware in the Cloud
· May 2019: ConnectWise hit by ransomware that locked up cloud infrastructure
· August 2019: iNSYNQ SaaS and cloud hosting hit by ransomware that hindered customer operations

Ransomware Attack Elements

2019: Capital One
· In July 2019, Capital One announced a breach of over 100 million credit applications, Social Security numbers and bank account numbers
· The hacker bypassed a poorly configured AWS WAF
· Then manipulated EC2, IAM roles, and more to access the data

Capital One Attack Elements

2020: Azure's DB Misconfiguration Incident
· In January this year, 250 million customer records were exposed in an Azure DB
· The cause?
­ Misconfigured Network Security Groups

Azure DB Exposure Elements

What's Next?
· From some of the presentations we've seen, it's obvious:
­ People are still "lifting and shifting"...ugh. ­ Red teams (and attackers) have a LOT of
surface area to attack ­ So many configuration issues!
· Very few attacks/issues are due to the cloud providers themselves
­ We've just got a lot of work to do.

