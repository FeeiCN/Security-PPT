Is Zero Trust Possible in OT Environments?
DR ONG CHEN HUI SANS ICS Asia Pacific Summit 2020

Dr Ong Chen Hui
APJ CTO, Emerging Technologies
Currently leads Emerging Technologies as the APJ CTO of Trustwave ­ a Singtel company. She strategise, engineers, research, translates, and consults in emerging areas of cybersecurity. Her current focus is on operational technology security, automotive security, Cyber Analytics and 5G.
Enjoyed malware analysis, applied research, risk and vulnerability assessments when she was a Principal Member of Technical Staff in DSO National Laboratories.
She holds a PhD in Computer Science under the Singapore-MIT Alliance, MSc in Electrical Engineering from Stanford University, and BSc (Honours), Electrical Engineering & Computer Science from the University of California at Berkeley in the United States.
2

Zero Trust is a security concept centered on the belief that organizations should not automatically trust anything inside or outside its perimeters and instead must verify anything and everything trying to connect to its systems before granting access.
https://www.csoonline.com/article/3247848/what-is-zero-trust-a-model-for-more-effectivesecurity.html

5 Steps to Zero Trust

Identify sensitive data.

Identify and classify sensitive data. Segment the network based on data sensitivity

Map the flows of sensitive data Locate and map all dependent network and system objects
Design a more optimal flow if necessary
Leverage existing data and network flow diagrams

Architect Zero Trust Microperimeters

Define microperimeters around sensitive data Enforce microperimeters with physical or virtual security controls Limit and strictly enforce access to microperimeters Automate the rule and policy base Use auditing and change control tools

Continuously monitor Ecosystem with Security Analytics

Evaluate where you may already have security analytics Determine the best deployment model for you business Find a vendor that will move you along the automation path

Embrace security automation and orchestration

Define policies for automation Assess and document your SOC processes Check to see what security analytics automation options are available

Confirms that security analytics office vendor supports your security infrastructure
4 From Stephanie Balaouras, Chase Cunnningham, Peter Cerrato. Five Steps to A Zero Trust Network. Forrester. October 1, 2018

Topics to cover
1. Application Protection Bypass 2. Session Tokens in Administrative Commands 3. DLL Side Loading 4. Architecting for Zero Trust

Topics to cover
1. Application Protection Bypass 2. Session Tokens in Administrative Commands 3. DLL Side Loading 4. Architecting for Zero Trust

Purdue Model
7

Application Protection

Upload Applications

Application Password Prompt

Normal App Upload Workflow

Request application upload for part #1

Engineering Workstation

Login Login OK

Request for App Payload #1
Command Response
OK App Payload #1

M221

Request application upload for part #n
Increase this two bytes by 0xEC for every request

Request App Payload #n
Command Response
OK App Payload #n

Random key
Encrypted Application Payload #1. Length = 0xec

CVE-2020-7568
Alternate App Upload Channel

The same request packets that are sent by the engineering software.
Request application upload for part #1

Attacker

M221

Request for App Payload #1
Command Response
OK App Payload #1

Request application upload for part #n
Once all the application payloads are received, the attacker can concatenate the payloads, unzip, and get the file.

Request App Payload #n
Command Response
OK App Payload #n

50 4B 03 04 = Archived File's Magic Number
Application payload in plain

Topics to cover
1. Application Protection Bypass 2. Session Tokens in Administrative Commands 3. DLL Side Loading 4. Architecting for Zero Trust

Administrative Commands

Administrative Commands Workflow

Engineering Workstation
Store the session token

Authentication
"Session" Token
Token in clear
Administrative Command
"Session" Token used
Command Response
OK

M221
Generate "session" token
Process the command
Free to view the data

17

CVE-2017-6034
Insecure Session Token

Request for Session Token
Request to start controller
Vulnerable to Replay Attack - Clear token can be stolen by
the attacker to use - Command messages are sent in
clear

Engineering Workstation
Store the session token

Authentication
"Session" Token
Token in clear
Administrative Command
"Session" Token used
Command Response
OK

M221
Generate 1-byte "session" token
Process the command
Free to view the data

Insufficient Session Token Length - 1-byte session ID can be bruteforced and guessed
Session Token generated and returned to the workstation
Session token returned and response "OK (0xfe)"

18

Traffic Replay Attack

Engineering Workstation
Store the session token

Attacker compromises the engineering workstation
Use the same session token and craft messages to the controller

Capture the packets
Replay or craft new packet with the same session
token

Authentication
"Session" Token
Token in clear
Administrative Command
"Session" Token used
Command Response
OK
Administrative Command Command Response

M221
Generate 1-byte "session" token
Process the command
Free to view the data

19

Keep-alive Message
How to end the legitimate session and start a session on our own?

Send keep-alive message with the token

Engineering Workstation
Store the session token

Release session command

Authentication
"Session" Token
Token in clear
Keep-alive
"Session" Token used
Command Response
OK
... Logout
"Session" Token not used
Command Response
OK

M221
Generate 1-byte "session" token
Process the command
Release Session OK

20

Possible MITM Attack

Engineering Workstation
Store the session token

Authentication
"Session" Token
Token in clear

PLC

Generate 1-byte "session" token

Token never expire unless it's logged out

Administrative Command

Process the command

Send keep-alive message with the token

Command Response
OK

Free to view the data

KEEP ALIVE OK
KEEP ALIVE OK

LOGOUT OK
AUTHENTICATE OK

Intercept and send "OK" message

Sends a "logout" message on behalf

Generates a new session token

21

Topics to cover
1. Application Protection Bypass 2. Session Tokens in Administrative Commands 3. DLL Side Loading 4. Architecting for Zero Trust

Background
Proper DLL-loading
M221

Loads the libraries

A.dll: 0ca74d0...

B.dll

B.dll: d4210cf...

SoMachine

A.dll

CVE-2020-7489
Lack of Integrity Check

M221

Load A.dll and B.dll (modified) because
there is no hash check
SAopMplaiccahtiionne

A.dll B.dll (modified)

Attacker

Download B.dll Add malicious codes

24

Unable to start controller
Now the engineer can never start the controller from the UI25

Topics to cover
1. Application Protection Bypass 2. Session Tokens in Administrative Commands 3. DLL Side Loading 4. Architecting for Zero Trust

5 Steps to Zero Trust

Identify sensitive data.

Identify and classify sensitive data. Segment the network based on data sensitivity

Map the flows of sensitive data Locate and map all dependent network and system objects
Design a more optimal flow if necessary
Leverage existing data and network flow diagrams

Architect Zero Trust Microperimeters

Define microperimeters around sensitive data Enforce microperimeters with physical or virtual security controls Limit and strictly enforce access to microperimeters Automate the rule and policy base Use auditing and change control tools

Continuously monitor Ecosystem with Security Analytics

Evaluate where you may already have security analytics Determine the best deployment model for you business Find a vendor that will move you along the automation path

Embrace security automation and orchestration

Define policies for automation Assess and document your SOC processes Check to see what security analytics automation options are available

Confirms that security analytics office vendor supports your security infrastructure
27 From Stephanie Balaouras, Chase Cunnningham, Peter Cerrato. Five Steps to A Zero Trust Network. Forrester. October 1, 2018

Summary and Discussions
1. Zero trust is a strategy to continuously verify every user, application and device
2. Zero trust is a sound framework, but its successful implementation requires more than firewalls.
3. OT applications are sufficiently different from IT applications. The presence of legacy devices and applications means that authentication mechanisms in OT applications may not support robust identity verification.
4. Additional host controls, such as end point monitoring, e.g. application whitelisting and project files monitoring, are needed
28

References
· Attacking SCADA: Vulnerabilities in Schneider Electric SoMachine and M221 PLC (CVE-2017-6034 and CVE-2020-7489): https://www.trustwave.com/en-us/resources/blogs/spiderlabs-blog/vulnerabilities-inschneider-electric-somachine-and-m221-plc/
· Attacking SCADA II: Vulnerabilities in Schneider Electric SoMachine and M221 PLC (CVE-2020-7566, CVE-2020-7567, CVE-2020-7568): https://www.trustwave.com/en-us/resources/blogs/spiderlabsblog/attacking-scada-part-ii-vulnerabilities-in-schneider-electric-ecostruxure-machine-expert-and-m221-plc/
· Trustwave Advisory TWSL2020-001: https://www.trustwave.com/en-us/resources/securityresources/security-advisories/?fid=27054
· Schneider Electric Advisory for CVE-2017-6034: https://www.se.com/ww/en/download/document/SEVD2017-065-01/
· Schneider Electric Advisory for CVE-2020-7565 ­ CVE-2020-7568: https://www.se.com/ww/en/download/document/SEVD-2020-315-05/
29

