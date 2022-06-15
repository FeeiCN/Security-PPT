Prioritizing Data Sources for Minimum Viable Detection

Presenter

There is no photo. I'm right here :)

 Mean streets of Northern Virginia  "The Government"  Red Canary

Keith McCammon
@kwm

> > > > > > > > > > > > > > > > > > > > > > > > >

Why we're here
To learn how you can prioritize collection of ATT&CK data sources, use this information to inform technology selection, and ultimately build a strong foundation for your detection engineering program.
YOUR SECURITY ALLY YOUR SECURITY ALLY YOUR SECURITY ALLY

Detection Engineering

DATA
Am I collecting the right data to detect, investigate, and respond effectively to threats?

ANALYTICS
Am I asking the right questions of the data that I have?

DETECTION
Do I have the process, context, and expertise that I need to answer the questions that I've asked?

What does this have to do with ATT&CKTM?

Detection Engineering

DATA
Am I collecting the right data to detect, investigate, and respond effectively to threats?

ANALYTICS
Am I asking the right questions of the data that I have?

We love to fixate on this!
DETECTION
Do I have the process, context, and expertise that I need to answer the questions that I've asked?

Detection Engineering

DATA
Am I collecting the right data to detect, investigate, and respond effectively to threats?
We should pay closer attention to this . . .

ANALYTICS
Am I asking the right questions of the data that I have?

DETECTION
Do I have the process, context, and expertise that I need to answer the questions that I've asked?

"We can't detect what we can't see."
ATT&CK Data Sources useful for:  Assigning value to tools, data  Measuring progress, coverage

Obligatory Nods
Olaf Hartong  sysmon-modular  ThreatHunting
Roberto & Jose Luis Rodriguez  hunters-forge / ATTACK-Python Client  Hunters ATT&CKing
The ATT&CK Team

CONCEPT
Minimum Viable Detection
Being in a position to detect most threats, most of the time.

Not where you want to end up . . .
. . . but a great way to think about how you start.

Words to Live By (At Work)

MAXIMIZE COVERAGE

MINIMIZE COMPLEXITY

OPTIMIZE FOR ANSWERS

BACKGROUND
Data Sources: The linchpin of ATT&CK

About the ATT&CK Data Sources
 50 data sources  One or more per each of the 240 ATT&CK (Enterprise)
techniques

About the ATT&CK Data Sources
 50 59 data sources  One or more per each of the 240 265 ATT&CK (Enterprise)
techniques

Useful for understanding how we observe a given technique

Nits
 Do you need one or all data sources to properly observe a technique?
 Data sources are not clearly defined.

PRIORITIZING DATA SOURCES
Where do we start?

The stages of grief
1. Understanding prevalence 2. Focus on a class of data or product 3. Differentiate within a class of data / product 4. Coverage based on operational data,
insights

PRIORITIZING DATA SOURCES
Understanding prevalence

Determining Prevalence
https://github.com/keithmccammon/python-attack-utils Step 1: ./attack.py --dump-metadata Step 2: Excel :)
Alternatively: hunters-force/ATTACK-Python-Client

Top 10 Data Sources by Prevalence

PRIORITIZING DATA SOURCES
Focus on a class of data or product

Data Source . . . Sources

The Top 10

PRIORITIZING DATA SOURCES
Differentiate within a class of data / product

Techniques by Data Source

https://github.com/keithmccammon/python-attack-utils
./attack.py --match-data-source <filename>

Visibility
Process command-line parameters Process monitoring Binary file metadata DLL monitoring File monitoring Loaded DLLs Process use of network

Protection
Process command-line parameters Process monitoring

. . . and then

PRIORITIZING DATA SOURCES
Operational context
Less a data source thing. Critically important.

Trends: Powershell

Trends: Windows Admin Shares

Trends: Remote File Copy

Trends: Spearphishing Attachment

WHAT OTHERS ARE SAYING
"Everyone in this room should be sharing confirmed threat data based on ATTACKTM."
~ Me. I made this up. Still a valid point . . .

One more time . . .

MAXIMIZE COVERAGE

MINIMIZE COMPLEXITY

OPTIMIZE FOR ANSWERS

FEEDBACK, QUESTIONS, ROTTEN TOMATOES
Thank you!
@kwm

