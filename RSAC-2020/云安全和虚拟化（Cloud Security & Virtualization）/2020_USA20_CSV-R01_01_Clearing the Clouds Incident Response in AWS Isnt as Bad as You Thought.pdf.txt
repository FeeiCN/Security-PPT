SESSION ID: CSV-R01
Clearing the Clouds: Incident Response in AWS (Isn't as Bad as You Thought)
Kristy Westphal
VP, CSIRT
#RSAC

#RSAC
Disclaimer
· The views, opinions, and material presented by Kristy Westphal at this conference are solely based on her experience and opinions related to incident response.
· The content of this presentation does not reflect the views or opinions of MUFG Union Bank.

#RSAC
Agenda
Why am I Here? AWS Architecture 101 Incident Response Use Cases Acquiring Amazon Web Services (AWS) Skills 90 Day Plan for AWS Incident Response
3

#RSAC
Why am I here?
Information security leader specializing in security assessments, operational risk, and program development
Security is painful all around; hopefully I can help
Let's share knowledge and make it less painful for all of us!
Props to Pete Ehlke for helping make this preso really come to life

#RSAC
Why AWS incident response is important...

#RSAC
What this session is...and isn't...
Think about cloud incident response differently
­ But not as the impossible mountain to climb
Yes, this is only Amazon Web Services
­ But the approach can be applied to other providers
We won't be doing in-depth AWS training
­ But you will have resources to do this yourself

#RSAC
Poll the Audience
CSV-R01 Are you doing security incident response in AWS now? A. Yes B. No C. I Don't Know https://rsa1live.eventbase.com/polls?event=rsa2020&session=1454108104

#RSAC
A Peek Into AWS Architecture

#RSAC
*Thank you Albert Barron for this example.

Wilbur Jazzie

#RSAC
Wilma

#RSAC
In reality....

#RSAC
The five pillars of the AWS framework
Operational Excellence Security Reliability Performance Efficiency Cost Optimization
https://d1.awsstatic.com/whitepapers/architecture/AWS_WellArchitected_Framework.pdf?did=wp_card&trk=wp_card
12

#RSAC

#RSAC
Where to focus IR efforts?
Host IAM (a.k.a. role-based access) Data storage (e.g., S3) Persistence (e.g., when odd things change)
­ S3 bucket permissions ­ Security groups ­ Network gateways ­ EC2 instance ownership ­ Authorization failures

Breaking it down

Bad guy

Leverages IAM

Attacks EC2
S3

#RSAC
We detect via CloudWatch CloudTrail

#RSAC
Poll the Audience
CSV-R01 What of the following do you see as roadblock to AWS Incident Response? A. Not enough authority B. Knowledge of landscape C. Lack of skills https://rsa1live.eventbase.com/polls?event=rsa2020&session=1454108104

#RSAC
AWS Incident Response Use Cases

#RSAC
Use Case 1: What really happened at Capital One?
An old vulnerability called Server Side Request Forgery (SSRF)
­ On the Web Application Firewall (WAF) - ModSecurity
The WAF was misconfigured
­ Able to make a metadata service request ­ Which is how the attacker gained access to credentials ­ Credentials had access to whatever resource requested them ­ WAF assigned too much privilege ­ Could list information contained within S3 storage buckets
AWS has since added additional authentication to the service

#RSAC
A visual

#RSAC
Why should you care?
Cloud misconfigurations can have greater impact if exploited
­ Versus on premises misconfigurations
A bad actor much more likely to access if internet-facing

#RSAC
Use Case 2: Oh no, not more!
Ever heard of Code Spaces?
­ Maybe not since it's been dead since 2014 ­ It was a site that hosted source code repositories and offered project
management services ­ Mostly hosted on AWS
An attacker gained access to their AWS console
­ Held it for ransom ­ When no payment, started deleting...everything ­ Elastic Block Storage (EBS) Snapshots, S3 data, some server instances

#RSAC
All eggs in one basket
All the data that was deleted included backups Effectively put Code Spaces out of business

#RSAC
So how do I respond to that?
Follow the breadcrumbs
­ Read the logs (Cloud Trail, Cloud Watch) ­ Understand the flow ­ Understand what your scope of response is
An internal shared responsibility model?
­ Understand how things are configured
And did they behave as expected?

#RSAC

#RSAC
Command line interface tips
You'll have to install the environment
­ Looks like DOS! (seriously!)
Run aws-configure
­ Consider ­ debug to get all the interactive detail ­ Do you have a proxy? May need to pass through/tunnel. ­ If you do tunnel, may need to import certs
set REQUESTS_CA_BUNDLE=full-path-to\[name of].pem
Potential for automation

#RSAC
Some examples
Want to copy a snapshot? aws ec2 copy-snapshot \
- region us-east-1 \ - source-region us-west-2 \ - source-snapshot-id snap066877671789bd71b \ - description "This is my copied snapshot."

#RSAC
Another example
Change a security group? aws ec2 authorize-security-group-ingress \\
- group-name MySecurityGroup \ - protocol tcp \ - port 22 \ - cidr 203.0.113.0/24

#RSAC
Other options
Crash cart
­ What tools might you want to have available?
Depends upon incident response scope Remnux for malware analysis Other gems?
Breakglass
­ May be more palatable for Incident Response to have emergency only access
Lambda
­ What can you automate through scripting?
Who contacts Amazon in case of an incident?

#RSAC

#RSAC

#RSAC
Use Case 3: Let's Run Through An Incident End To End
Your Macie service has identified odd behavior via a key pair
­ Key pair is accessing an account it's never logged into before ­ Is this a security incident?
Work through four stages of an Incident:
­ Prepare ­ Detect ­ Contain ­ Post-Incident

#RSAC
Run It Down...
Detect
­ How would you determine what IAM User the access keys belonged to?
How were the access keys used?
­ Which log would access to keys show up in? (access, use)
What would the log tell you? How do you sift through all those events?
­ Would you have an alert any where when they were accessed?
Depends on the action
­ What regions were the keys used in?
Were they limited to specific regions?

#RSAC
A quick demo.....

#RSAC
Wrapping Up....
Contain
­ What actions need to be taken to mitigate? ­ Who has the permission to do it?
Incident Response Team? IAM Team?
­ Who needs to be notified?
Application Team? End User?
Post-Incident
­ How did the credentials get posted?
Was it posted from within your network? Code for the demo available here: https://github.com/kameenan/RSAC2020

#RSAC
Acquiring AWS Skills

#RSAC
Start of available resources
https://d1.awsstatic.com/whitepapers/aws_security_incident_response.pdf https://d1.awsstatic.com/whitepapers/Security/AWS_Security_Best_Practice s.pdf https://d0.awsstatic.com/whitepapers/AWS_CAF_Security_Perspective.pdf https://www.aws.training/ (need to set up an account) https://aws.amazon.com/free (get your own hands on!) https://www.coursera.org/ (search for AWS [topic]) https://github.com/jlevy/og-aws (awesome find) https://aws.amazon.com/

#RSAC
AWS training

#RSAC

#RSAC
Youtube. OMG.
Go there Search for Amazon Web Service Find the very latest from re:Invent Learn a ton of stuff!

#RSAC

#RSAC
Apply ­ 90-day AWS incident response plan
30 days:
­ Identify gaps between existing plan and what we've discussed ­ Begin acquiring needed skills
60 days:
­ Confirm architecture of AWS (or other cloud provider) environment ­ Acquire sandbox environment ­ Document processes to support
90 days:
­ Consider automation for certain tasks ­ Test out processes
Table tops!
41

#RSAC
Thank you!
Keep the conversation going! kmwestphal@cox.net

