SESSION ID: OST-W02
Abaddon, the Red Team Angel
Charles IBRAHIM
Information Security Senior Consultant Wavestone @Ibrahimous

#RSAC

Red Team operations management

#RSAC
A story of complexity

Why, on earth, another tool?

#RSAC
Reminder: What is a red team operation ?

Real goals, bold means, long run
Test an information system security deeply, in real conditions
Miscellaneous attack vectors
Bounces on indirect targets to reach the goal

How does red teaming work ?
Identify business trophies from critical risks
Access SWIFT network, perform bank transfers...
Design and perform real-life attacks by mixing "classical" audit skills and out-ofthe-box tactics, techniques, and procedures (TTP)
Advanced TTP used by APT, FIN6 or other attacker groups...
Provide a clear answer to the board
Given a threat model, am I at risk?

#RSAC
But: why, on earth, another tool ?

Because

What do we want ?
Facilitate Red Team operations by:

Tons of tools No aggregation "Operational security" failures are common

Reducing the time to build an infrastructure
Enabling complex actions with 1 or 2 clicks
Enabling easier reporting for long operations
Reducing the "OPSEC failure" risk

/ 02

Automating C&C deployments

#RSAC
Show me that tool!

Authentication - What works now
/ Authentication works and is useful

Authentication - What could be improved
/ Authenticate against an external service like LDAP

#RSAC
Show me your reconnaissance !

Reconnaissance - What works now
/ Nmap, recon-ng & Hunterio scans

Under development ­ will be upgraded until February 6th
Reconnaissance - What could be improved
/ Use Amass / Consolidate the results of all the tools

#RSAC
A crucial step that could be enhanced

What we've automated
From a custom external cartography methodology, we took nmap & recon-ng and put it to an interface
Then, we took hunterio & amass (under development) and put it to an interface

What could be improved
Integrate more recon tools Consolidate their results

#RSAC
Recon. That's cute.
Time to bring out the big guns (= build your C&C infrastructure)

Command and Control architecture
/ Deployed within 30 minutes / Throwable, authenticated, stealth / Enables phishing as well as remote command execution

Your secure network

C&C server (SilentTrinity)

Flask server

Apache reverse proxy

HTTPS requests forwarding over the proxy protocol
2) RCE scenario

#RSAC

AWS

EC2 instance with nginx proxy
False flag website:
i. Installed on an automatically deployed EC2 instance
ii.Hosting a dockerized & automatically deployed nginx
proxy

EC2 instance with website
Phishing website: i. Installed on an automatically
deployed EC2 instance ii.Pointed to by Gophish

C&C client (SilentTrinity) Remote command
execution
Red Teamer Abaddon

ID & timestamp decryption
1) Valid timestamp: HTTPS requests transfer to the C&C
2) Invalid timestamp: redirect to the false flag website

HTTPS requests forwarding over the
proxy protocol
RedELK Communications
logging

Stager download by requesting the false
flag website
Throwable Gophish instances

HTTPS requests, with encrypted ID & timestamp

Compromise
Target network
Victim

1) Phishing scenario

Public key SSH authentication / Web authentication through HTTPS

EC2 instance with Gophish Professional Gmail account
Route53 domain name

Phishing

#RSAC
Show me your EC2!

Deploy EC2 instances - What works now
/ Deploy one, several instances, "undeploy" them, monitor them

Instances - What could be improved
/ Use an IaaS like Terraform / Use GCP and not only AWS

#RSAC
Show me your Gophish!

Deploy Gophish - What works now
/ Access gophish admin panel within minutes

Deploy Gophish - What could be improved
/ Automatically deploy an htaccess & change the default password depending on a local configuration file

#RSAC
Far from enough: deploy the full infrastructure!
Did you say SilentTrinity? You did mention Red ELK!

#RSAC
Show me that deployment!

#RSAC
Show me that deployment!

#RSAC
Using a fake site to deceive the SOC

#RSAC
Using SilentTrinity through Abaddon

#RSAC
Under the hood

Containers. Lots of them.

THE proxy protocol.

Deploy a full C&C infrastructure - What works now Deploy a full C&C infrastructure - What could be improved

/ It worked in operations, helped us save a lot of time & stay / Change parameters of the deployed infrastructure, to avoid

stealthy

redeploying when changes need to be applied

#RSAC
Oldies: show me your cloud fronting distribution!

Deploy distributions - What works now
/ Deploy well-configured-for-domain-fronting distributions

CloudFront

Deploy distributions - What could be improved
/ Well, domain fronting doesn't work anymore with GCP & AWS ;(

#RSAC
Last but not least: dashboard incoming!

Dashboard all the things - What works now
/ There is a dashboard

Dashboard all the things - What could be improved
/ It's not very dynamic yet^^

#RSAC
OPSEC thoughts
The phishing domain name MUST NOT point to an IP address belonging to the red teamers' organization at any time during the TLS configuration (or it will be logged in an IP's reverse DNS history)
Use distinct:
­ Domain names for the C&C "false flag" website & for the phishing website. ­ AWS SES smtp servers have bad reputation. Gmail professional accounts smtp
servers don't.
Don't forget to kill your instances

#RSAC
Parenthesis - What did you say ? Physical intrusions ?

Sent keyboards

Modified USB receiver

Dropped USB key
Launch malwares from pluggable devices - What works now
/ We used the infrastructure deployed with Abaddon to create remote connection to SilentTrinity from manually crafted Excel macros

Launch malwares from pluggable devices - What could be improved
/ Generate the macros from Abaddon

#RSAC
Call for contribution
Get involved, share the offsec love!

#RSAC
Build a tool that the offsec community will care about

Good workers need fine tools
RT operations are technically complex, politically sensitive
Automation is key: it saves time, avoids silly mistakes, helps doing simply otherwise complex tasks
Abaddon may be used to realize separate tasks easily: passive reconnaissance, external cartography, phishing campaigns, etc.

Fine tools need workers
A pretty amount of work involved, with some actions not really easy to perform (AWS deployment management was not that simple)
So far, amount of work: 1 lead dev (~30), 2 other auditors (~30), 3 interns (~50)  ~ 110 pure dev days of work

#RSAC
Contribute!

User-friendliness
Ensure users can install Abaddon easily
Ensure Abaddon's usage is smooth and really useful on operations
Fix users experience

Global features
Provide enhanced reconnaissance features
Provide MITRE ATT&CK focused reporting capacities
Everything that "could be improved" as mentioned previously

https://github.com/wavestone-cdt/abaddon

/ 03

The end (... or a new beginning?)

#RSAC
Apply What You Have Learned Today
Next week you should:
­ Encompass red team operations in a more rigorous / industrial way
Use tips from that session to enhance your Red Team methodology Avoid operational security failures (and get #OPSECFAIL buzz...)
In the first three months following this presentation you should:
­ Get familiar with Abaddon and use it for your own operations : https://github.com/wavestone-cdt/abaddon
­ Contribute to the tool's development effort and issue pull requests to the main repo
Within six months you should:
­ Get operational feedbacks about the use of Abaddon ­ Benefit from new features brought by the main developers and by yourself

