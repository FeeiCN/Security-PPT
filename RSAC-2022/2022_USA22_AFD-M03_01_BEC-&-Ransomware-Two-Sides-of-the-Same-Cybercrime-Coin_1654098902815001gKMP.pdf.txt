#RSAC
SESSION ID: AFD-M03
BEC & Ransomware: Two Sides of the Same Cybercrime Coin
Crane Hassold
Director of Threat Intelligence Abnormal Security @CraneHassold

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
3

#RSAC
Ransomware: The Visible Menace

#RSAC
Three Primary Factors Driving Today's Ransomware Landscape

Ransomware-as-a-Service
(Access)

Extortion
(Incentive)

Cryptocurrency
(Scale)
5

#RSAC
Ransomware is Industry Agnostic
(But Some Industries Get More Attention Than Others)
Source: 2022 Abnormal Ransomware Victimology Report
6

The Myth of the Big Fish
Median Annual Revenue of a Ransomware Victim:
$27 Million

#RSAC
Source: 2022 Abnormal Ransomware Victimology Report
7

A Global Problem
(With One Giant Void)

#RSAC
110 Victim Countries
Source: 2022 Abnormal Ransomware Victimology Report
8

#RSAC
Ransomware is a Centralized Ecosystem

Main Group

Affiliate Affiliate Affiliate

Victim Victim Victim

Victim Victim Victim

Victim Victim Victim

Source: 2022 Abnormal Ransomware Victimology Report
9

#RSAC
Business Email Compromise: The Silent Threat

#RSAC
What is Business Email Compromise?
A spear phishing attack that involves the impersonation of a trusted individual to trick a person into making a financial
transaction or sending sensitive materials.

Spoofing

Compromise

11

#RSAC
BEC: By the Numbers

$43B+
lost since 2016

$180,000+
lost per attack

35%
of all cybercrime losses

Source: FBI Internet Crime Complaint Center (IC3)
12

#RSAC
Why is BEC Such a Problem?

Traditional defenses focus on technical threats.

BEC has a higher ROI than other cyber attacks.

Social engineering is extremely effective.

13

#RSAC
Executive Impersonation: The Classic BEC Attack

Wire Transfer

From: Subject: To:

Reed Richards sgtrock@hvc.rr.com Re: Wire Payment Sue Storm sue.storm@fantasticfour.org

5/9/22, 2:40PM

Hi Sue,
I need you to process a wire transfer or an ACH payment to a consultant today. Are you available to take care of this now so I can send details?
Best Regards,
Reed

Payroll Diversion

From: Subject: To:

Hank Pym <admin@mycompanymail.page> 5/17/22, 9:13AM Re: Direct Deposit Update Janet Van Dyne <jvdyne@pymtechnologies.com>

Hi Janet,
I need to change my direct deposit info on file before the next payroll is processed. Can you get it done for me?
Regards, Hank

Gift Cards

From: Subject: To:

Jean Gray <personalmailbox667@gmail.com> 5/1/22, 6:21PM Re: Response Scott Summers <scott.summers@xavierinstitute.org>

Great, I'm having a busy day and I trust I can count on you to keep this as a surprise. I'm looking forward to surprising some of the staff with gift cards, And i want this to be between you and I pending when they receive it. Are you able to purchase on my behalf quickly and what local store do you think we have around to make this purchase? I'm considering a One Vanilla gift card, American Express gift card or an eBay gift card Since we have it almost everywhere.

14

#RSAC
Financial Supply Chain Compromise: Today's Biggest BEC Threat

Vendor Email Compromise

Aging Report Attacks

Third-Party Impersonation
15

Vendor Email Compromise: Today's Biggest BEC Threat
2. The employee clicks on the link in the email and is directed to a phishing website.

1. A criminal sends a targeted phishing email to an employee.

CRIMINAL

RECIPIENT

4. The cybercriminal uses those credentials to access

the employee's inbox. He then creates a rule to

forward copies of all emails sent to the employee to

his own inbox.

PHISHING WEBSITE

5. The cybercriminal monitors the forwarded emails for information about invoices and payments as well as other financial details.

7. Not realizing that the employee's inbox has been compromised and the email is fake, the customer pays the invoice, depositing money directly into the cybercriminal's bank account.

CUSTOMER

#RSAC
PHISHING EMAIL
3. The employee enters his or her credentials into the website.
INBOX
6. When the opportunity arises, the cybercriminal sends a fake invoice to one of the organization's customers, along with "updated" bank account information.
16

#RSAC
Aging Report Attacks: VEC (Without the Compromise)

From: Subject: To:

Pepper Potts <fakeceo@gmail.com> Re: AR REPORT Tony Stark <tony.stark@starkindustries.com>

4/22/22, 8:45AM

Tony,
I need you to email me the aging report from A/R (Due within the next 30 days and a month overdue), and also include customer payable contact email on this report.
Regards, Pepper

From: Subject: To:

Tony Stark <tony.stark@starkiindustries.com> Follow up ­ ACME Corporation USD $86,801.80 Steve Rogers <steve.rogers@acme.com>

5/2/22, 9:22AM

Hi Steve, Natasha, our CFO asked me to follow up with you on our payment status. Please let us know of you have any payment to remit to us. Kindly note that our office has recently made changes to our remittance information and we advise all our payments to be remitted to our banking information via ACH, direct deposit or wire transfer only moving forward, We would provide you with our revised remittance information for proper update and payment processing. I await your soonest response. Thanks, Tony

17

#RSAC
Third-Party Impersonation

From: Subject: To:

Norman Osborn <nosborn@lookalikedomain.com> OSCORP PO # A482281 for DAILY BUGLE J. Jonah Jameson <jjj@dailybugle.com>

5/6/22, 9:42AM

Hi Jonah, Going forward with your order, Before we can continue proceeding with your order. Be informed we have moved into the advanced age of billings. We are only set up to receive payments electronically via ACH/Wire Transfers. Do not use the previous information for remittance. it is now outdated. Kindly let me know which you prefer in the above so we can proceed further with your PO. Would so much appreciate your earliest confirmation

Regards,

From: Subject: To:

Carol Danvers<cdanvers@lookalikedomain.com> RE: Kree Systems:Unpaid Invoice Monica Rambeau <monica.rambeau@sword.org>

5/15/22, 11:12AM

Hello,
Can you please confirm with your accounting department if there's any due/unpaid invoices owed to our company, as we are currently switching to a new accounting software and a couple of invoices are missing? We apologize for the inconvenience, kindly attach any due/unpaid invoices with this email. I'll appreciate it if all concerned people treat this as urgent. Thanks.

Regards, Carol Danvers Chief Executive Officer

18

#RSAC
Why are Financial Supply Chain Compromise Attacks Such a Threat?

Higher loss amounts

Use of trusted identities

Crafted using real intelligence

No control over initial compromise

19

#RSAC
Ransomware vs. BEC: Tale of the Tape

#RSAC
BEC vs. Ransomware: Tale of the Tape

BEC
Financially-motivated Delivered via email Frequently bypasses legacy email defenses Usually not public Highly decentralized actors (Nigeria/Western Africa) 19,900+ reported attacks (2021) $2.4 billion in losses (2021)

Ransomware
Usually financially-motivated Indirect email delivery
Usually detected by legacy email defenses Sometimes highly visible
Highly centralized actors (Russia/Eastern Europe) 3,700+ reported attacks (2021) $49 million in losses (2021)

21

BEC
Ransomware

#RSAC
22

#RSAC
So What's Next?

#RSAC
What Happens When the Ransomware Landscape is Disrupted?

Cryptocurrency Regulation

Geopolitical Conflict

Law Enforcement Pressure
24

#RSAC
What Happens If Two Major Cyber Threats Collide?

Scale and Sophistication of

+

Ransomware

Financial Impact and Money
Mule Networks of BEC
25

#RSAC
How Do We Combat These Future Threats?

Focus on Identity

Cloud-First Approach

Understand Your Supply Chain
26

#RSAC
Apply What You've Learned Today
Is my organization prepared to defend against the more advanced social engineering threats that bypass the secure email gateway? Do I have effective internal processes developed to prevent unauthorized wire transfers and direct deposit changes? How would my organization respond if it was hit with a successful ransomware attack? Are my employees aware of the various email-based threats targeting them today?
27

#RSAC
Thank You
Crane Hassold
Director of Threat Intelligence, Abnormal Security chassold@abnormalsecurity.com @CraneHassold

