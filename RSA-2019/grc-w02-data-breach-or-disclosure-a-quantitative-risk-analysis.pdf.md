SESSION ID: GRC-W02
Data Breach or Disclosure: A Quantitative Risk Analysis
Evan Wheeler
VP, Risk Management & CISO Edelman Financial Engines
#RSAC

#RSAC
Risk Management Goals
 Minimizing uncertainties for the business  Aligning and controlling organizational components to produce
the maximum output  Improve decision-making and planning  Providing governance and oversight  Operating in a cost effective manner

#RSAC

Brand Recognition Business Landscape

Increasing Customer-base growing rapidly

Misconfiguration
Certificates

Intellectual Property 3rd Party Data Leakage

Manual processes aren't scalable
Competitive pricing pressures

DDoS Disgruntled Employee

Brute Force

Cross Site Scripting (XSS)

Brand Misuse

Impersonating Mobile App

Ransomware

Customer Details Leakage

Compromised Credentials

Phishing Impersonating Executives

Internal Marked Documents

Typo Squatting

Unintentional Info Disclosure

Client data theft Client data

Social Media Leakage Defamation

Hacktivist

Open Ports

"screw up"

NIST Risk Matrix
12
1. Client data theft 2. Accidental client data disclosure

#RSAC

2

1

2

1

#RSAC

Qualitative Drawbacks
high

risk

X

=

How much risk reduction is enough? Where are the opportunities to reduce our exposure? How to compare one-time events with recurring? What is the time horizon for our outlook and estimates? Next 3 months, next 10 years? How many `Lows' equals a `High' rating?

Quantitative Assumptions
We don't have enough data ...
Won't our SMEs just be guessing?

How can we estimate when it has never happened before?

Objections to quantitative measurement models

1. Your problem is not as unique as you think. 2. You have more data than you think. 3. You need less data than you think. 4. There is a useful measurement that is much
simpler than you think.

#RSAC
But we are a unique snowflake!

#RSAC
Scenario Analysis Approach

0. Prerequisite

 Conduct calibration exercise to ensure your stakeholders are comfortable with estimates

1. Identify scenario scope
2. Evaluate Loss Event Frequency

 Identify the asset at risk  Identify the threat community under consideration
 Estimate the Probable Frequency (Results will drive Preventative Controls )

3. Evaluate Loss Magnitude

 Estimate the Forms of Loss for probable impact (Results will drive Detective and Response Controls)

 Determine the risk and capture results in standard format
4. Derive & articulate Risk  Post-Scenario Steps

Prep Meeting Sections
Workshop Sections
Post Workshop Section

Data Breach Case Study
Widget & Co.

We sell widgets Business processes are: sourcing materials, manufacturing, distribution, and marketing of widgets
Widget & Co.

#RSAC
45 min analysis

We have 10,000 client mailing addresses for shipping purposes, and payment details for billing purposes
Private company, family owned
Revenue of ~ $100M annually
About 900 ­ 1,000 staff including contractors/consultants

#RSAC
Scenario Assumptions
Approximately 10,000 client records in distribution and billing systems All operations and clients are only in the U.S. Clients are generally retail consumers, and some are small business owners Mailing addresses and payment details are easily monetizable Payment details may include bank account numbers and/or credit cards Client data has never been stolen before (best of our knowledge) Client turnover (loss of future business) has been minimal from previous data sharing errors Not all impacted clients will use the offered credit monitoring service No current insurance coverage

#RSAC
Choosing a Scenario - Accidental Disclosure
Employee leaves client document on the commuter train Client data emailed to the wrong client Misconfigured AWS storage reveals client database to Internet Unencrypted client data on a USB stick is lost outside office Client form is lost in the mail ...

#RSAC

Choosing a Scenario ­ Data Theft

External Hacking results in

the most server

confidentiality breaches

Common attack scenarios

Data breach threats

SANS Critical Controls for Effective Cyber Defense

Verizon DBIR
12

Employee accidentally sends sensitive client data to the wrong client

Asset at Risk

Ad hoc process for client support to send confirmation email to clients including address and full payment details

Threat Community

 Privileged Insider  Amateur Hacker  Cyber Criminal  Nation State  Act of Nature

Motivation

 Malicious  Accidental

Impact Area

 Confidentiality  Integrity  Availability

Forms of Loss

 Productivity Response  Response  Replacement  Fines & Judgments  Competitive Advantage / Reputation

13

#RSAC

Cyber criminal exploits default password on production server to gain access to the client database, and sells data on black market

Asset at Risk Threat Community
Motivation Impact Area Forms of Loss

Mailing addresses and payment details for 10,000 clients in billing database
 Privileged Insider  Amateur Hacker  Cyber Criminal  Nation State  Act of Nature
 Malicious  Accidental
 Confidentiality  Integrity  Availability
 Productivity  Response  Replacement  Fines & Judgments  Competitive Advantage / Reputation

#RSAC
How much are we spending on security?

IT budget as percentage of revenue

Cyber security budget as percentage of annual IT budget

average is 3.28%
14

majority is 4% - 8%

#RSAC
What am I worth on the dark web?
worth $5 - $15 per record

1 Estimate the Frequency

$100M annual revenue

10k & $130k

client records

annual security budget

W&C

VS.

16

#RSAC
$50k ­ $150k potential profit for cyber criminal

1 Estimate the Frequency

NIST Special Publication 800-30 Revision 1, Table G-2 NIST Special Publication 800-30 Revision 1 , Table G-3

#RSAC

#RSAC
2 Estimate the Magnitude

Data Theft
Productivity ­ Operations may be disrupted during the investigation Response ­ Significant support needed from external forensic consultants, outside counsel, and PR firm. Offer free credit monitoring to clients F&J ­ Potential client lawsuits, state privacy and PCI fines Reputation ­ Mostly consumer clients, but one large corporate client is a household name

Accidental Disclosure
Productivity ­ Negligible
Response ­ Procedure to handle these cases is operationalized and resources are minimal. Offer free credit monitoring to impacted client
F&J ­ Client contract caps damages at $1k per event, PCI fines less likely
Reputation ­ Difficult for clients to switch to a competitor

#RSAC

2 Estimate the Magnitude

Reference Loss Table - Credit Monitoring

Potential Costs
 Forensics  Legal Advice  Notification Costs  Call Center  Credit Monitoring  Public Relations  Data Replacement  Cyber Extortion  Customer Suits  PCI-DSS Fines  Regulatory Defense, Fines, and
Penalties

Consumers 1
10 100 1,000
10,000
100,000 1,000,000 10,000,000 100,000,000

Range Included
(1-9) (10-99) (100-999) (1,000-9,999)
(10,000-999,999)
(100,000-999,999) (1,000,000-9,999,999) (10,000,000-999,999,999) = and > than 100,000,000

Min

M/L

Max

$

-$

-$

25

$

-$

36 $

200

$

10 $

306 $

2,000

$

100 $

2,970 $

20,000

$ 1,000 $ 29,700 $ 200,000

$

10,000 $ 297,000 $ 2,000,000

$ 100,000 $ 2,970,000 $ 20,000,000

$ 1,000,000 $ 29,700,000 $ 200,000,000

$ 10,000,000 $ 108,000,000 $ 600,000,000

"You'll hear talk of PCI compliance fines, and those fines can range from $5,000 to $100,000 a month, depending on factors like the size of your business and the length and degree of your noncompliance." Oct 11, 2017

2 Estimate the Magnitude

NIST Special Publication 800-30 Revision 1, Table H-3
20

Response Fines & Judgments
Response Fines & Judgments

#RSAC

Data Theft

#RSAC
Accidental Disclosure

Single Loss Max: $270k

Annualized: $320k

21

Single Loss Max: $100k Annualized: $1.6M

#RSAC
Risk Treatment

Data Theft
Improve detection, containment, and response capability
Purchase cyber insurance coverage

Accidental Disclosure
Remove credit card information from the confirmation emails
Invest in process improvements on emails going to clients

$350k

22

Trade-Offs - Data Theft

Investment Cost

$200,000

$180,000

$160,000 $140,000

$85,000

$120,000 $100,000

$25,000

$80,000

$60,000

$85,000

$85,000

$40,000

$20,000 $-

$19,000
CURRENT BUDGET

$19,000
PROPOSED BUDGET

Oversight & Audit Protection Detection & Response

23

#RSAC
Risk Reduction
$350k

Sample On-Going Reporting

EXCEEDING TOLERANCE

Most likely annualized
risk

One-time maximum
loss

M

MAR 2019

H

Scenario Scope

Threats Motivation
Loss Area Targets

 Cyber Criminals  Privileged Insiders
 Accidental  Financial Gain  Embarrassment
 Confidentiality
 client PII  credit card data  corporate emails

Q2 2019 Progress

Scenario Exercises Run

2

Action Items

4

Projects

2

Risk Acceptances

1

SEV 1/2 Incidents

3

Action Plan Outlook: MAR 2019 ­ FEB 2020

Inadvertent or malicious disclosure of sensitive data
Sensitive data could be exposed to an unauthorized party through an error, or by an intentionally act of a malicious party. The cost of such as event is most driven by the type of data and number of records exposed. Generally, privileged insiders will disclose fewer records, whereas cyber criminals target large volumes of data to steal.
Although generally doesn't process a lot of data that would be attractive to cyber criminals or easy monetize, there are business lines that receive personally identifiable and heath information ancillary to the service. Other businesses such regularly process such data.
Most common accidental data disclosures are due to manual processing errors, and less often software coding defects.
Typical breach points for cyber criminals would be phishing campaigns, malware infected websites, and compromising application vulnerabilities.
Key Findings
 Several businesses regularly exchange sensitive data with clients via email  Lacking peer review on billing confirmation emails sent to clients  Breach response procedures have never been tested  Monitoring gaps exist on the distribution servers
Recent Developments
+ Added four-eyes check on billing confirmation emails to clients + Confirmed insurance policy covers most of the notification and investigation cost
- Identified further gaps in tools and technologies to prevent confidentiality issues - Project to remove credit card details from billing confirmation emails has been delayed

24

#RSAC

#RSAC
Further Research Needed
Are consumers more forgiving of a data breach than an accidental disclosure? Do external attackers tend to steal higher volume of records than insiders? How attractive is a database of consumer mailing addresses for a cyber criminal? How monetizable is a list of client bank account numbers? How might new privacy laws like CCPA change the loss estimates?
25

Program Implementation
26

Initial Methodology Rollout

Benefits

Program Challenges

Defensible · The scope of an analysis is clearly defined · Terminology and relationships between factors are preestablished, and not subject to different mental models · Assumptions are explicit and open to discussion/debate
Supports Decision-Making · Probability is taken into account and forecast timeframe is explicit · Scenarios can be aggregated and compared · Promotes meaningful metrics and supports tolerance thresholds

Scoping and measurement · SMEs aren't used to formally documenting their assumptions · Not comfortable with estimations of impact and frequency · Hesitation to commit to predefined impact table thresholds
Different mental risk models · Resistant to change · Clouded by historical failed models · Rarely data driven

Extensible · Designed for incremental integration · Modularity to grow in line with risk program maturity lifecycle
27

#RSAC

#RSAC
Next Steps
Run two scenarios using free FAIR tools
­ Analyze incidents and public data ­ Determine initial impact and frequency ranges ­ Analyze scenarios in parallel with existing model ­ Recalibrate and refine ranges ­ Identify opportunities to gather more data ­ Run sensitivity analysis on alternatives
Train analysts Evangelize benefits of new methodology
28

Resources to Get Started
Cybersecurity Research Library
­ Building a scientific basis for the cybersecurity decisions ­ Library of over 65 data sources
Questions?
Measuring and Managing Information Risk: A FAIR Approach
­ ISBN: 978-0124202313 ­ Amazon Link: http://amzn.com/0124202314

#RSAC

