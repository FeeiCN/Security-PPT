SESSION ID: HT-R02
Business Email Compromise: Operation Wire Wire & New Attack Vectors

Anne Connell
Cybersecurity Engineer CMU ­ SEI ­ CERT @aconnell

#RSAC

#RSAC
Notices
Copyright 2019 Carnegie Mellon University. All Rights Reserved.
This material is based upon work funded and supported by the Department of Justice under Contract No. FA8702-15-D0002 with Carnegie Mellon University for the operation of the Software Engineering Institute, a federally funded research and development center sponsored by the United States Department of Defense.
NO WARRANTY. THIS CARNEGIE MELLON UNIVERSITY AND SOFTWARE ENGINEERING INSTITUTE MATERIAL IS FURNISHED ON AN "AS-IS" BASIS. CARNEGIE MELLON UNIVERSITY MAKES NO WARRANTIES OF ANY KIND, EITHER EXPRESSED OR IMPLIED, AS TO ANY MATTER INCLUDING, BUT NOT LIMITED TO, WARRANTY OF FITNESS FOR PURPOSE OR MERCHANTABILITY, EXCLUSIVITY, OR RESULTS OBTAINED FROM USE OF THE MATERIAL. CARNEGIE MELLON UNIVERSITY DOES NOT MAKE ANY WARRANTY OF ANY KIND WITH RESPECT TO FREEDOM FROM PATENT, TRADEMARK, OR COPYRIGHT INFRINGEMENT.
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.
This material may be reproduced in its entirety, without modification, and freely distributed in written or electronic form without requesting formal permission. Permission is required for any other use. Requests for permission should be directed to the Software Engineering Institute at permission@sei.cmu.edu.
DM19-0222

[DISTRIBUTION STATEMENT A] This material has been

approved for public release and unlimited distribution. Please see Copyright notice for non-US Government

2

use and distribution.

Topics
· Introduction · BEC Impact · BEC Targets and TTPs · Recon: How Attackers Collect Data on Targets · Operation Wire Wire & New Attack Vectors · Defending Against BEC · Apply
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

#RSAC

#RSAC
What is BEC?
"Impersonation of executives or business contacts to
obtain the transfer of funds or sensitive information"
Business Email Compromise (BEC) is: · Scam targeting businesses working with foreign suppliers and/or businesses that regularly perform wire transfer payments. · Involves use of an email account compromise (EAC) component that targets individuals who perform wire transfer payments. · Scam puts business email accounts, personally identifiable information (PII), and employee wage and tax information at risk.
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

#RSAC
"Colvis"

Through the work he did in the Dallas area, he thieved $3.2 million using BEC scams.

[DISTRIBUTION STATEMENT A] This material has been

approved for public release and unlimited distribution. Please see Copyright notice for non-US Government

5

use and distribution.

Target Selection
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

#RSAC

#RSAC
Scenario used for FBI CICP BEC Course
· Texas Energy Company Case coined the `BEC' term · This case is the scenario for FBI Cyber Investigator
Certification Program (CICP) Training on the LEEP Portal
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

BEC Impact
International Business Email Compromise Schemes

BEC Numbers

#RSAC

· Business Email Compromise (BEC) attacks have increased by 136% from December 2016 to May 2018.
· It ranks #1 in the IC3's 2017 Internet Crime Report for the volume of victim losses, representing nearly half (48%) of the total losses of the top 10 Internet crimes.
· In 2017, IC3 received a total of 301,580 complaints with reported losses exceeding $1.4 Billion.

Source: "2017 Internet Crime Report" https://pdf.ic3.gov/2017_IC3Report.pdf
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

#RSAC
https://enterprise.verizon.com/resources/reports/DBIR_2018_Report_execsummary.pdf
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

#RSAC

Social Media Mining
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

#RSAC
· Names · Gender · Social security numbers · Birthdays · Addresses · Driver's license # · Zip Code

BEC Attack Examples

#RSAC

· Google/Facebook $100M Partner Invoice Scam
· Evaldas Rimasauskas $100 million to BEC attacks impersonating their server hardware supplier Quanta even from Google and Facebook
· MacEwan University $11.8M Wire Transfer Fraud
· Defrauded of $11.8 million in a BEC attack impersonating a vendor of the university.
· New York Judge Loses Over $1.5M in Real Estate Scam
· A NY State Supreme Court judge lost over $1.5 million in a BEC attack that impersonated her lawyer,
Source: Symantec Attack Trends Report, 2018.

[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

BEC Targets and TTPs
Techniques, Tactics, and Procedures (TTPs)
International Business Email Compromise Schemes

BEC Common Targets
· Real Estate · Legal Services · B2B Commerce · Database and W2 Theft
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

#RSAC

#RSAC
PII and W-2 Information Targets
· The US Internal Revenue Service (IRS) Stopped 6+ million suspicious returns in 2017
· These efforts prevented payment of $11 billion in suspicious returns
· The IRS still paid out approximately $5.1 billion in Stolen Identity Return Fraud (SIRF) in 2017
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

BEC Types
"Email Hacked", "Credentials Stolen"
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

#RSAC

#RSAC
BEC Attack Timeline

2. LAUNCH
Attacker launches attack by
transmitting initial requests to the users on the hit list

4. EXFILTRATION
Wire transfers are not made to
accounts belonging to criminal, but to mules

6. REPEAT
Whether the criminal manages
to receive the funds or not, he is likely to try requesting again

1. HIT LIST
Attacker does recon and generates lists compromising the name of a sender and the name and email of
recipient. Typically in batches of 50/100

3. REQUEST
As victims respond, the criminal engages in a small number of exchanges, after which he makes a
request to perform a wire transfer to a `supposed' vendor

5. EXTRACT
Criminals always want receipts for transfers as a way to prove the money was transferred or to verify its
worth the effort to attempt to extract the funds

[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

Recon: How Attackers Collect Data on Targets
International Business Email Compromise Schemes

Multiple Ways of Obtaining Information
· Professional cybercrime rings · Malware · Web compromise · Access Control · Open Source Intel Collection (OSIT) · Social Engineering · Social Media Mining · Dark Web Mining
Source: ISACA State of Cyber Security 2017
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

#RSAC

#RSAC
Social Engineering
"From" field spoofing ­ From field appears to come from someone known, but actual sender address
is different
"Reply-To" field spoofing ­ Reply-To address field contains different email address (web mail)
Sender spoofing ­ Address and From fields are faked, reply not expected - single phrase attack
Visual domain spoofing ­ Homograph attack
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

Dark Web Mining
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

#RSAC

Office 365
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

#RSAC

Operation Wire Wire & New Attack Vectors
International Business Email Compromise Schemes

Wire Wire Scam
· "BEC Hit List" · Biggest losses compared to any other
attack vector · Billions of dollars lost · `Slimwaco' ­ CFO list of 200+ companies
and 1000s of individuals targeted · Global teams coordinating · Over $600 million lost in BEC attacks

[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

25

#RSAC

#RSAC

[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

26

Wire Wire Scam
This case shows the increase in BEC target refinement "Huge Elite Limited" in Shanghai, China was the recipient of ill-gotten gains from Bryant Ortega. Natalie Armona was recruited having job as a Junior Processor at a lending firm

[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

27

#RSAC

#RSAC

[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

28

#RSAC
Coordinated Takedown
· Several U.S. federal authorities and police from other countries were involved
· Six-month investigation that lead to arrests of suspected scammers in the U.S. and overseas.
· 74 arrests in all: · 42 arrested were located in the U.S. · 29 in Nigeria and · 3 in Canada, Mauritius, and Poland.
· $2.4 million seized · $14 million recovered

[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

29

The Wire Wire Scam
The Operation ­ Not a sophisticated technological attack ­ Increased effort and workflow of actors ­ Robust social connections between these actors The Takedown ­ Global cooperation ­ BEC awareness ­ Reporting will increase

[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

30

#RSAC

Wire Wire Targets
Target Lists: · Experian.com/small-business/mail-lists · InfoUSA.com · DatabaseUSA.com · ReferYes.com · Dark Web Marketplaces · eGrabber.com "Capture leads & prospects from any webpage, find & add any missing field (email/phone/...), update, de-dupe, merge & segment any prospect list"
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

#RSAC

Wire Wire Victim Profile
· Title companies · Consulting firms · IT Providers · Legal Services · Banks · Transportation
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

#RSAC

#RSAC
Wire Wire Scenarios: Romance & Employment

"Romance scams," which lull victims to believe that their online paramour needs funds for an international business transaction, a U.S. visit or some other purpose
"Employment opportunities scams," which recruits prospective employees for work-from-home employment opportunities where employees are required to provide their PII as new "hires"
Are significantly overpaid by check whereby the employees wire the overpayment to the employers' bank

[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

33

Defending Against BEC
International Business Email Compromise Schemes

Why is this a problem?
Traditional security solutions rely on the following: ­ Anti-malware, Link Detection, Reputation, Content Analysis Messages are usually hand crafted ­ Little to detect ­ High reward warrants the additional effort
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

#RSAC

Security & Training Awareness is Flawed
Should users be your first AND last line of defense? How diligent are your users? Training time = lost productivity? Ongoing training costs
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

#RSAC

Defending Against Scams
Awareness is key: · Carefully scrutinize all emails · Educate and train employees · Verify vendors · Know your customers · Confirm requests · Report it to the Internet Criminal Complaint Center (IC3) at:
https://www.ic3.gov/default.aspx
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

#RSAC

#RSAC
Prevent Users Becoming Victims
· Identify similar domain names (abc_company.com != abccompany.com)
· Flag different `Reply-To' address · Color-code internal from external email · Use `known approved' details only · Authenticate requests by phone · Create `two step' approval process for changes, much like 2fa
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

#RSAC
Technology Solutions
· Separate analysis of sender email(s), First part(s), Domain(s) · Email message headers dynamic matching and scoring · Implement SPF, DKIM, and DMARC at your organization · Monitor VIP names most likely to be impersonated · Visual spoofing detection engine,
­ e.g. apple != aqqle, Charm -> Charrn
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

#RSAC
Protect Accounts and Data
· Create intrusion detection system (IDS) rules that flag e-mails similar to company e-mail (abc_company.com would flag abc-company.com)
· Create e-mail rules to flag e-mail where the "reply" e-mail address differs from the "from" e-mail address
· Color code virtual correspondence (internal vs. external accounts) · Verify changes in vendor payment location by adding 2fa · Confirm requests for transfers of funds by using phone verification as
part of a 2fa using only previously known numbers · Carefully scrutinize all e-mail requests for transfer of funds
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

Apply
International Business Email Compromise Schemes

#RSAC
Key Indicators of BEC
Large wire or funds transfer to a recipient the company has never dealt with in the past.
Transfers initiated near the end of day (or cut-off windows) and/or before weekends or holidays.
Receiving account does not have a history of receiving large funds transfers in the past.
Receiving account is a personal account, whereas the company typically only sends wires to other businesses.

[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

42

#RSAC
Strategies to Apply
BEC attack awareness training for internal staff (Account Managers, BSA, Fraud, Wire Room, etc.) Implement SPF, DKIM, and DMARC at your organization Create a list of known good domains used by your organization and business partners, and use a domain name permutation algorithm to create a list of similar domain names Create a network or email policy to block recently registered domains

[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

43

#RSAC
Summary
· Traditional BEC methods (still successfully used)
· Bogus Invoice · CEO Fraud · Social Engineering · Account Compromise · Attorney Impersonation
· BEC workflow and attack vectors are improving and expanding:
· Large quantities of data exposure leaves people vulnerable · Actors are leveraging the data exposure, combining it with multiple sources, and are
able to both refine and expand target lists · BEC is easy to execute and on the rise
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

#RSAC
If You Want to Know More
· https://www.fbi.gov/news/stories/business-e-mail-compromise · https://www.IC3.gov · https://www.ic3.gov/media/2016/160614.aspx · https://www.cisecurity.org/press-release/national-isacs-fbi-uss-and-
symantec-collaborate-to-fight-business-email-compromise/
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

Thank you! Questions?
Anne Connell aconnell@cert.org

