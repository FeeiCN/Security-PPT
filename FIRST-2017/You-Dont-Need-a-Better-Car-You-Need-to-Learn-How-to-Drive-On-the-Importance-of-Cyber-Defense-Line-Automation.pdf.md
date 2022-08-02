On the Importance of Cyber-Defense Line Automation
You don't need a better car, you need to learn how to drive
Enrico Lovat, Florian Hartmann, Philipp Lowack

Siemens AG 2017

siemens.com

Who are we?
<picture for Siemens CERT>
Siemens AG 2017 Page 3

You don't need a better car, you need to learn how to drive

What this talk is about
· What we did · What we learn in the process

What this talk is NOT about
· Cars · Step-by-step tutorial on how to fix things · Code · Vendor bashing

A tool can make you faster. But you need many tools The "glue" in-between tools is as important as the tools themselves.
Siemens AG 2017 Page 4

Siemens AG 2017

Example

siemens.com

Example use case: Malware via email

· How can the user report a suspicious email? · How do you analyze it? · Is it a targeted attack or mass malware? · Did the user click on the attachment? · Who is the Infosec responsible for the user? · How do you prevent the attached malware from
exfiltrating data from infected machines? · How can you make sure similar infections are
detected? · How can you prevent other clients from being
infected by the same malware? ·...

Siemens AG 2017 Page 6

The old way

Reports mails

Inbox

Analyze attachments

Sandbox

Extract potential C&C URLs

Virus Total
Vetting

Siemens AG 2017 Page 7

Corporate Employee Directory

Active Directory

Search for Indicators/URLs
Proxy Solution 1

Ticket Tracker
Issue Tickets
Investigation
Analyze Results
SIEM
(ProxyLogs)

Siemens AG 2017

Evolution 1 - Scripts

siemens.com

Evolution 1 - Scripts

Manual step Automated step

Reports mails

Reputation Services

Mail DB

Analyze attachments

Sandbox

Extract potential C&C URLs

Virus Total
Vetting

Corporate Employee Directory
(C)ISO List

Active Directory

Ticket Tracker
Issue Tickets
Investigation

Store and cross-ref. Indicators/URLs

TI Platform

Search for Indicators/URLs

Analyze Results
SIEM
(ProxyLogs)

Siemens AG 2017 Page 9

Sinkhole

Proxy Solution 1
Proxy Solution 2

Scripts: pros and cons
· Scripts allow analysts to perform their tasks faster · Script written by an analyst can be reused by the
other analysts

Siemens AG 2017 Page 10

· Scripting requires good understanding of the tools/service used  only few can edit the scripts
· Each analyst has a different favorite scripting language  hard to script against others' scripts

Siemens AG 2017

Evolution 2 - API

siemens.com

Evolution 2 - API

Manual step Automated step

Reports mails

Reputation Services

Mail DB

Analyze attachments

Sandbox

Extract potential C&C URLs

Virus Total
Vetting Tool

Corporate Employee Directory
(C)ISO List
Anti Virus

Active Directory

Store and cross-ref. Indicators/URLs

TI Platform

Search for Indicators/URLs

Ticket Tracker
Issue Tickets
Remediation Ticket Tool
Analyze Results
SIEM
(ProxyLogs)

Siemens AG 2017 Page 12

Sinkhole

Central blacklist

Proxy Solution 1
Proxy Solution 2

API: documentation
Siemens AG 2017 Page 13

API: pros

· Simplicity: while not everybody can script against an LDAP server, any developer knows how to query a REST API.

· Abstraction: Coding against a REST API allows to easily exchange the "backend", e.g. replacing a commercial tool with an open source one, as long as it implements the same interface

· Flexibility: once one REST API for a tool has been developed by an analyst, everybody can script against it using his/her language of preference

· Authentication: wrapping the original interface into a custom API allows for better identity management (e.g. handle different authentications)

Siemens AG 2017 Page 14

API: Extra pros Global Search
Siemens AG 2017 Page 15

API: Extra pros - Maltego integration
Siemens AG 2017 Page 16

API: Extra pros - Vetting interface
Siemens AG 2017 Page 17

Siemens AG 2017

Example - revisited

siemens.com

Example: How do we handle it today

Mail reported as spam Analysis of the email

Report as SPAM/Malware

Analysis of email attachment

Manual vetting of analysis results

Threat intelligence processing Historic search in proxy logs Issuing of remediation tickets

In-house developed Outlook plugin. Selected email is sent (as attachment) to a particular mailbox.

Tracking of remediation status
Siemens AG 2017 Page 19

Example: How do we handle it today

Mail reported as spam Analysis of the email

MALST (MALware mailingliST)

Analysis of email attachment

Manual vetting of analysis results

Threat intelligence processing

Historic search in proxy logs
Issuing of remediation tickets
Tracking of remediation status
Siemens AG 2017 Page 20

In-house developed tool to monitor inbox and analyze received emails Set of scripts + WebGUI

Example: How do we handle it today

Mail reported as spam Analysis of the email

MALST (MALware mailingliST)

Analysis of email attachment

Manual vetting of analysis results

Threat intelligence processing

Historic search in proxy logs
Issuing of remediation tickets
Tracking of remediation status
Siemens AG 2017 Page 21

In-house developed tool to monitor inbox and analyze received emails Set of scripts + WebGUI

Example: How do we handle it today

Mail reported as spam Analysis of the email

CMAP

Analysis of email attachment

Manual vetting of analysis results

Threat intelligence processing

Historic search in proxy logs

Issuing of remediation tickets

Tracking of remediation status
Siemens AG 2017 Page 22

Example: How do we handle it today

Mail reported as spam Analysis of the email

CMAP

Analysis of email attachment

Manual vetting of analysis results

Threat intelligence processing

Historic search in proxy logs Issuing of remediation tickets

Cuckoo sandbox + In-house developed GUI and additional analyses

Tracking of remediation status
Siemens AG 2017 Page 23

Example: How do we handle it today

Mail reported as spam Analysis of the email

Threat Intelligence Vetting Interface

Analysis of email attachment

Manual vetting of analysis results

Threat intelligence processing Historic search in proxy logs Issuing of remediation tickets Tracking of remediation status
Siemens AG 2017 Page 24

Custom WebGUI for vetting.
It retrieves indicators from sandbox analysis, filters and enriches them, applies tags and push back the changes to TI database.

Example: How do we handle it today

Mail reported as spam Analysis of the email

Threat Intelligence Vetting Interface

Analysis of email attachment

Manual vetting of analysis results

Threat intelligence processing Historic search in proxy logs Issuing of remediation tickets Tracking of remediation status
Siemens AG 2017 Page 25

Custom WebGUI for vetting.
It retrieves indicators from sandbox analysis, filters and enriches them, applies tags and push back the changes to TI database.

Example: How do we handle it today

Mail reported as spam Analysis of the email Analysis of email attachment Manual vetting of analysis results

MANTIS MISP
In-house developed tool, supporting STIX/TAXII New MISP-centric architecture

Threat intelligence processing Historic search in proxy logs Issuing of remediation tickets

Sandbox (CMAP)

Vetting (TI VI)

TI DB (MISP)

Tracking of remediation status
Siemens AG 2017 Page 26

Example: How do we handle it today

Mail reported as spam Analysis of the email Analysis of email attachment Manual vetting of analysis results

MANTIS MISP
In-house developed tool, supporting STIX/TAXII New MISP-centric architecture

Threat intelligence processing Historic search in proxy logs Issuing of remediation tickets

Sandbox (CMAP)

Vetting (TI VI)

TI DB (MISP)

Tracking of remediation status
Siemens AG 2017 Page 27

Example: How do we handle it today

Mail reported as spam Analysis of the email

Historic log search

Analysis of email attachment

Manual vetting of analysis results

Threat intelligence processing

Historic search in proxy logs

Issuing of remediation tickets

Tracking of remediation status
Siemens AG 2017 Page 28

Example: How do we handle it today

Mail reported as spam Analysis of the email

Remediation tickets
In-house developed tool to easily handle creation of remediation tickets

Analysis of email attachment

Manual vetting of analysis results

Threat intelligence processing

Historic search in proxy logs

Issuing of remediation tickets

Tracking of remediation status
Siemens AG 2017 Page 29

Example: How do we handle it today

Mail reported as spam Analysis of the email

Request Tracker
Opens source ticketing system + many customizations

Analysis of email attachment

Manual vetting of analysis results

Threat intelligence processing

Historic search in proxy logs

Issuing of remediation tickets

Tracking of remediation status
Siemens AG 2017 Page 30

Evolution 3 ­ What's next?
Siemens AG 2017

siemens.com

What's next?

Manual step Automated step

Reports mails

Reputation Services

Mail DB

Analyze attachments

Sandbox

Extract potential C&C URLs

Virus Total
Vetting Tool

Corporate Employee Directory
(C)ISO List
Anti Virus

Active Directory

Store and cross-ref. Indicators/URLs

TI Platform

Search for Indicators/URLs

Ticket Tracker
Issue Tickets
Remediation Ticket Tool
Analyze Results
SIEM
(ProxyLogs)

Siemens AG 2017 Page 33

Sinkhole

Central blacklist

Proxy Solution 1
Proxy Solution 2

What's next?

Manual step Automated step

T I
Plat
for
m
P r o x y
S o l u tP ir o x n y 1 S o l u t i o n
2

Store and cross-ref. Indicators/URLs
C e n t r a l b l a c k l i s t

R e p u t a t i o n
Reports mails S e r v i c e s
Analyze attachments
Extract potential C&C URLs
S i n k h o l e

Ma i l D B
San dbo
x

Issue Tickets

Tick et Tra cker

Remediation Ticket Tool
Analyze Results

SIEM (Pr oxyLogs)

Search for Indicators/URLs

C

o

A

r

c

p

t

o

i

r

v

a

e

t

e

D

i

E

r

m

e

p

c

l

t

o

o

y

r

e

y

e

(

C

D

)

i

I

r

S

e

O

c

L

t

i

o r
y

As nt

t

i V

i r

u s

TI Plat for m
P r o x y
S o l u Pt ri o xn y 1 S o l u t i o n
2

V i r u s T o t a l
Remediation Ticket Tool
C e n t r a l b l a c k l i s t
Vetting Tool

R e p u t a t i o n
Reports mails S e r v i c e s
Analyze attachments
Extract potential C&C URLs

Ma il D B

S i n k h o l e
San dbo
x

Reports mails

Reports mails
Ma il D B Analyze attachments
San dbo
x

R e p u t a t i o n S e r v i c e s
Extract potential C&C URLs

S i n k h
o l e

V i r u s T o t a l
Vetting Tool

C

o

r

A

p

c

o

t

r

i

a

v

t

e

e

D

E

i

m

r

p

e

l

c

o

t

y

o

e

r

(

e

y

C

)

D

I

i

S

r

O

e

L

c

i

t

s t

A n

o r
y

t

i V

i r

u s

Store and cross-ref. Indicators/URLs
C e n t r a l b l a c k l i s t

TI Plat for
m
P r o x y
S o l u Pt ri o xn y 1 S o l u t i o n
2

Search for Indicators/URLs

Tick et Tra
cker
Issue Tickets
Remediation Ticket Tool
Analyze Results
SIEM (Pr oxyLogs)

R

e p

u

t

V

a

i

t

r

i

u

o

s

n T

S

o

e

t

r

a

v

l

i c

e s

Vetting Tool

C

e n

t

S

r

i n

a l

k h

b

o l

l a

e

c k

l i

s t

TI Plat for m
P r o x y
S o l u Pt ri o xn y 1 S o l u t i o n
2

Siemens AG 2017 Page 34

V i r u s T o t a l
Vetting Tool

C

S

O

(

)

L

I

i

As n t

i V

t

i r

u s

C

o

r

p

o

r

a

t

e

E

m

p

o

y

e

e

D

l

i

r

e

c

t

o r y

A

c

t

v

e

D

i

i

r

e

c

t

o

r

y

Search for Indicators/URLs

Tick e t Tra
cker

Remediation Ticket Tool
Analyze Results

SIEM (Pr oxyLogs)

Issue Tickets

San dbo
x

Extract potential C&C URLs

Vetting Tool

Store and cross-ref. Indicators/URLs
C e n t r a l b l a c k l i s t

TI Plat for m

Search for Indicators/URLs

Tick et Tra
cker
Remediation t Tool
SIEM (Pr oxyLogs)

Reports mails
Ma il D B Analyze attachments
San dbo
x

R e p u t a t i o n S e r v i c e s
Extract potential C&C URLs

S i n k h o l e

V i r u s T o t a l
Vetting Tool

C

o

r

A

p

c

o

t

r

i

a

v

t

e

e

D

E

i

m

r

p

e

l

c

o

t

y

o

e

r

(

e

y

C

)

D

I

i

S

r

O

e

L

c

i

t

s t

A n

o r
y

t

i V

i r

u s

Store and cross-ref. Indicators/URLs
C e n t r a l b l a c k l i s t

TI Plat for
m
P r o x y
S o l u Pt ri o xn y 1 S o l u t i o n
2

Search for Indicators/URLs

Tick et Tra
cker
Issue Tickets
Remediation Ticket Tool
Analyze Results
SIEM (Pr oxyLogs)

Tick et Tra
cker
Remediation t Tool
SIEM (Pr oxyLogs)

What's next?

(C)ISO List
Anti Virus
Virus Total
Reputation Services

Corporate Employee Directory

Employees

Active Directory

Mail DB

Ticket Tracker

Central Workflow Engine

Central blacklist

Remediation Ticket Tool
Vetting Tool
Sandbox
TI Platform
SIEM
(ProxyLogs)

Siemens AG 2017 Page 35

InfoSec Officers

Analysts

Sinkhole

Proxy Solution 1

Proxy Solution 2

What's next?
INCIDENT HANDLING PLAYBOOK
In case of "Suspicious email reported" Step 1: Analyze email and extract URLs Step 2: Analyze sample in Sandbox Step 3: If Threat Index > 10 then ... ... ...

Central Workflow Engine

Siemens AG 2017 Page 36

Siemens AG 2017

Lessons Learned

siemens.com

Lessons learned
Make it easy!
Use the same interface to access your internal and external services/data sources.
Siemens AG 2017 Page 38

Lessons learned
Works for us  Works for you
Every company/institution is different
Siemens AG 2017 Page 39

Lessons learned
More than twice? Script it!
Optimization accumulates over time!
Siemens AG 2017 Page 40

Lessons learned
Containerize your tools!
Lowers setup overhead in the long run and provides well-documented setup instructions for free.
Siemens AG 2017 Page 41

Lessons learned
Standardize your infrastructure!
Try to stick to the same tool stack (programming language, frameworks, libraries).
Siemens AG 2017 Page 42

Lessons learned
Manage your user centrally!
Easily offer other stakeholders in your company access to (some of) your tools.
Siemens AG 2017 Page 43

Lessons learned
Compromise (sometimes)!
Find a tradeoff between adapting your tools to your processes and vice versa.
Siemens AG 2017 Page 44

Lessons learned
DIY but don't DIY!
Don't (always) implement your own tools, but rather use fitting open-source tools.
Siemens AG 2017 Page 45

Lessons learned
Make it easy! Use the same interface to access your internal and external services/data sources. Works for us  Works for you! Every company/institution is different. If you have to do it more than twice, script it! Optimization accumulates over time! Containerize your tools! Lowers setup overhead in the long run and provides well-documented setup instructions for free. Standardize your infrastructure! Try to stick to the same tool stack (programming language, frameworks, libraries). Manage your user centrally! Easily offer other stakeholders in your company access to (some of) your tools. Compromise (sometimes)! Find a tradeoff between adapting your tools to your processes and vice versa. Do it yourself but don't do it yourself!: Don't (always) implement your own tools, but rather use open-source tools.
Siemens AG 2017 Page 46

Questions?
Siemens AG 2017 Page 47

Enrico Lovat Florian Hartmann Philipp Lowack Siemens CERT CT RDA ITS CER-DE Otto-Hahn-Ring 6 81739 München enrico.lovat@siemens.com hartmann.florian@siemens.com philipp.lowack@siemens.com
cert@siemens.com https://www.cert.siemens.com

