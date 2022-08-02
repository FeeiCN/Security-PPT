Moving From Threat Research To Threat Detection
Please sir, can I have some more detection?
SANS DFIR Summ1 it

Agenda
· Who am I · Stage 1- Research & Isolate · Stage 2-Create The Attack · Stage 3- Gathering Telemetry · Stage 4- Attribute to Security Program
2

O'Shea Bowens

whoami

· Founder & CEO of Null Hat Security · Technical Security Manager at
DraftKings · Founder of IDS Podcast · Founder of SKICON · Grew up in the SOC
Affiliations · Boston Security Meetup Organizer · DC617 · ISSA NE- Board of Directors · Blacks In Cyber- Board of Directors · CSNP- Board of Directors
Twitter:@sirmudbl00d
3

· DAD, lover of technology · Captain in U.S. Army National Guard · CND Manager on Cyber Protection Team and evangelist of
raspberry pi · I've been a tech hobbyist for about 12 years · Part-time Pen tester and tinkerer · Currently Sr Manager for a Sec Engineering Team with DOD · Active volunteer at both B Sides Las Vegas and B Sides DC. · I have taught intro to computing as an afterschool high
school program within Chicago · I worked as both a Defensive and Offensive analyst in the
private sector and the military · Three years leading Red Team engagements to support Blue
Space Defenders · I love to share when I can

WHO AM I ?

4

Stage 1Research
Victim VM
5

Stage 1- Research

· We need to know what we're concerned about before we can protect against it.
· This means reviewing your organization's tech stack and painting a picture of your vulnerabilities
· Dedicate time to research your attack vector and threat actors operating within it.

What's keeping your CISO up at night?
· Ransomware · Phishing · Web Application Attacks

6

Stage 1- Research

A little help from GRC
· If your organization is regulated, leverage your compliance documentation
· You've likely had to identify sensitive data, provide proof of security controls, create processes.
· Stay friendly with your compliance officer
· PCI DSS 10.x & 12.x

PCI requirements examples, because everyone loves PCI
· Install and maintain a firewall configuration to protect cardholder data
· Do not use vendor-supplied defaults for system passwords and other security parameters
· Protect stored cardholder data · Encrypt transmission of cardholder data
across open, public networks
7

Stage 1- Research

Threat Modeling

Threat Modeling Techniques

· The craftiness of threat actors and continuous · System Centric or Risk Centric

development of advanced tactics, techniques and· Microsoft's STRIDE (Spoofing, Tampering,

procedures (TTPs) has shifted the views of

Repudiation, Information Disclosure, Denial of

·

security practitioners. We must adapt and find

vulnerabilities

in

similar

·

Service while PASTA

and Elevation of Privilege) is system-centric, (Process for Attack Simulation and Threat

methods as attackers.

Analysis) is risk-centric.

· The end goal is the identification of threats and · The challenge is both techniques are difficult to apply

deploying countermeasures.

and don't reference addressing actual TTP's.

8

 Trust Boundaries
 Detection
 Logging

Threat Modeling

9

You: Hey, nice to meet you it's my first
day. I'm the new security engineer. I was told to ping you, as I'd like an updated
network diagram.
Them: Sure, here you go and welcome.

You: Excuse me but the date on this
diagram is three years old. Do you have
something from this year?

Them:!!!!!!!!!
10

Threat Modeling
Useful but lacks definition Helpful during an incident but not so
much for our goals Lets go a bit deeper
 Somewhat better  Positioned not only for layer3 reference but OS details. **It
will come in handy later  We're in security and need more relevant data  Take note of the flow of data

FROM THE HUNT TO INCIDENT RESPONSE AND BACK AGAIN 12
#1 Web App Research Goal
USE CASE: CROWN JEWEL MAPPING Trust Boundary Host · Developer ·Sys Admin Attack Surface Tactics Available ·Lateral Movement ·Privilege Escalation Attack Surface Techniques ·Pash the Hash - T1075
·mimikatz # kerberos::ptt #{user_name}@#{domain}
·SSH Hijacking- T1184 ·Bypass User Account Control - T1088
· New-Item "HKCU:\software\classes\ms-settings\shell\open\command" -Force New-ItemProperty "HKCU:\software\classes\ms-settings\shell\open\command" -Name "DelegateExecute" -Value "" -Force Set-ItemProperty "HKCU:\software\classes\ms-settings\shell\open\command" -Name "(default)" -Value "#{executable_binary}" -Force Start-Process "C:\Windows\System32\fodhelper.exe"

Moving right of kill chain
13

The app!
Yowl! A restaurant review site that really shouldn't be in prod yet. Allows you to register a user, add reviews, and search existing reviews.
Based on our threat model ...
· What do we actually care about?
· What would need to be fixed to actually solve the problem?
· Ho14w would we fix it?

Does This Happen?
· Sort of. · Actual vulnerabilities, not simulated. · Doesn't use modern frameworks or
client side processing.
 Super small app  Super vulnerable  It intends to be an image upload  Does it stop you from uploading
something else?

What's wrong with it?

?

And how do we find that out? · Static Analysis · Dynamic Analysis · Code Review · Manual testing

First, static findings

Next, dynamic
Not everything found by static is easily exploitable, and sometimes what's wrong with your app isn't visible in the code

Stage 2 Creating The Attack

Victim VM

#OPSEC
· Stage 1-Local File Inclusion vulnerability running on Apache client for an organization. Upload payload
· Stage 2- Navigate to payload directory to leverage system calls for further exploitation. In our case, uploading backdoor. YAY
· Stage 3- Upload backdoor. Circumvent defensive tools
19 · Stage 4- Exfil of data

#OPSEC- Identify
 What do we have here?  Vulnerable PHP  Does it stop you from uploading
something else?

Can We Get In
21

· Web server accepted the payload · Time to grab hashes and
dump'em · Move to exfil, then leave · Simple.

#OPSEC-Persistence

· Oh they're tricky and reboots don't always work

· So what can attackers rely upon to maintain access and not raise suspicious
· Check cron jobs

Internal Pupy call to hide process and ports

#OPSEC-Migration
· Attacker methods to blend in · Odd cron jobs · Process hi-jacking · DLL Sideloading · Out of place powershell scripts

· Hint: Don't trust the times2t3amps

Stage 3 Create & Deploy Detection
Victim VM
24

Hunt w/DeTT&CT
 How do we map our hypothesis to our to controls and procedures  If you can't prove it, it doesn't exist
 Except aliens. They are real  Circling back to why we started  At this stage you'll need a few things
 Logs sources  Machine hostnames & ip address  EDR, IDS, SIEM information

Define Data Sources w/ DeTTACT
 Start slow and build  Only name relevant data  Maintain consistency
across the org  Verify with IT

Hunt w/DeTT&CT
· Our Hypothesis · Initial Access: Exploit Public-
Facing Application · Exfiltration: Data Compressed.
Exfiltration C2 Channel

Mapping Data Sources
28

Stage 1Research
Victim VM
29

Sub-Techniques Are Here
30

#Phishing Execution
 Contractor Suzie Smothers receives the email and acts on the phishing campaign
 User bypasses security measures and installs the malicious software

#Phishing Execution
User bypasses security measures and installs the malicious software

#Phishing Execution
Logs transition from normal to elevated reports on the machine corpWKST-win10 in response of repeated calls (every 30Sec beacon)

FROM THE HUNT TO INCIDENT RESPONSE AND BACK AGAIN 34
#2 Phish Research
USE CASE: WEB APP-THREAT RESEARCH THREAT MODEL CARD- T1190, T1055 Trust Boundary Host · User ·Sys Admin Primary Attack Surface Tactics Available ·Rouge Software Installation ·Malicious Executables Secondary Attack Surface Techniques · W MI
·Bypass User Account Control · New-Item ·Start-Process "C\Windows\System32\simpleLldp.Agent.exe

Stage 4Attribute to Security Program
35

Attribute to Security Program
 After you've completed this cycle and created your threat cards, you'll need to consider how to leverage them
 Your use case is primarily driven by detection  How can we prove this?  Where does it count?
 After you've proven your use case, begin to think about metrics

37

38

Questions?

O'Shea Bowensemail:ob@nullhatsecurity.org
Twitter:@sirmudbl00d

Nicolai Smithemail:nicosmith312@gmail.com

39

