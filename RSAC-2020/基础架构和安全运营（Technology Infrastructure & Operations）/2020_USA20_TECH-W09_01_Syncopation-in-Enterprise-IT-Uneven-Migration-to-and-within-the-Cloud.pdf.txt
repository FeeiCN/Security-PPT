SESSION ID: TECH-W09
Syncopation in Enterprise IT: Uneven Migration to, and within, the Cloud

Nick Selby
Chief Security Officer, Paxos Trust Company @fuzztech

#RSAC

#RSAC
69-vehicle pileup I-64/I-264, December, 2019 51 injured, two critically
2

#RSAC
3

#RSAC
4

#RSAC
About Nick (Abridged Edition)

(

...)

#RSAC
A Brief Word About Capital One
 Huge cloud breach; involved AWS former staff, which gives executives the heebiejeebies.
 That this happened does not mean that AWS is unsafe, or that Capital One is incompetent. Quite the contrary.
 It means this stuff is hard.
6

#RSAC 7

#RSAC
Super-Important Trend #1

#RSAC
`No Cloud, No AI.' ­ Liam Maxwell
Public cloud is changing how, and thus what, companies deliver. This is perhaps the first true paradigm shift since we all got AOL. `If you're going to do continuous delivery, you need an APIenabled, on-demand infrastructure at the end of the pipeline e.g., a cloud.' -Chris Swan, DXC Technology
9

#RSAC
Super-Important Trend #2

#RSAC
"Outsource Everything But Your Core Business."
Over the next decade, the practice of outsourcing all IT needs but those at the core of the business will accelerate The advantages to businesses cannot be overstated The risks are often understated...
https://medium.com/wardleymaps https://twitter.com/swardley
11

#RSAC
Super-Important Trend #3

#RSAC
Cloud Goes Native
The next decade sees companies and government moving from fork-lift-and-dump-truck migration (or, `Lift-and-Shift') to native cloud deployment. This is a decade-long project in many cases. Chris Swan Again: Jenga v Bicycles. (https://is.gd/jengabike)
13

#RSAC
Doing This Right Brings Revolutionary Gain...
Doing this right is, like, really hard. Doing Cloud-Native correctly means turning our backs on decades of "best practices" and abandoning millions of apps People will become sad. Many will quit. You'll wish many more quit. It will never be easier or cheaper than it is today. To quote Clint Bruce, SEAL Team 5 Commander...
14

#RSAC
Apply: Cloud Strategy is IT Strategy
Right After RSA: Ask yourself about the maturity of your strategy to migrate to, and within the cloud. Is it a data-center in the sky?  Are you still doing CapEx versus OpEx presentations?  How have you articulated strategically the fundamental changes
that your IT fabric will traverse when you commit fully to cloudnative?
 This would include an understanding by HR of the cultural shifts inherent in this move
15

#RSAC
Finding Your Place

The Continuum

Government & Credit Unions

Most of the F500

Fork Lift & Dump Truck

Most of Banking
This is the problem area

#RSAC
Cool, forwardthinking units of
banking
Cloud Native
17

#RSAC
The Continuum
Wherever you are on the continuum, that's cool. The problems begin when you start to move rightward.
18

Moving Rightward On The Continuum
Segregation Developer access Prod and non-prod environments Configuration/Automation Access control and Authorization API access, internal and external Backup and storage Logging Integration with existing technology Integration with future technology

#RSAC

Fork Lift & Dump Truck

Cloud Native

19

#RSAC
This Is A Cultural Challenge As Much As A Technical One.
We want cool features. Building features is super-fun. Building foundational stuff is super-boring. Engineers and product managers want super-fun stuff. Only security people want super-boring foundational stuff.
20

#RSAC
This Is A Cultural Challenge As Much As A Technical One.
Executives don't understand the choices they're being given.
21

#RSAC
With no good choices, executives make arbitrary decisions.
22

#RSAC
With no good choices, executives make arbitrary decisions.
Bad choices in the cloud give you cloud-enabled stupid,
delivered at cloud speed.
23

#RSAC
The Continuum
Companies can't acquire their way out of this.  Most of the companies they would buy are on the left.  Many outsourced solutions are on the left.  Except for the startups. This means that, for the next ten years, third party risk is the biggest single problem faced by enterprise IT executives (more on that later)
24

#RSAC
Rubber Meeting The Road

#RSAC

Data: HaveIBeenPwned.com, thanks, Troy!

26

#RSAC
Verifications.io breached 808 million records. Discovered by Vinny Troia and Bob Diachenko
Vinny tells me that, four months after the Verifications.io breach, he and Bob found another trove of data from the same company behind this breach.
The data was being breached exactly the same way as with Verifications.io.

Data: HaveIBeenPwned.com, thanks, Troy!

27

#RSAC
Vinny and Bob found lots of these. The biggest last year was 4bn records.
Vinny says that with the Exactis breach, engineers intentionally left the API open.
Because authentication while testing is hard.

Data: HaveIBeenPwned.com, thanks, Troy!

28

#RSAC
And what do security professionals think?
!? AYFKM?
Data Center Knowledge/ Informa Tech family of sites, 2019 survey of security professionals.
29

#RSAC
And what do security professionals think?

LOL

AYFKM?

!? Data Center Knowledge/
Informa Tech family of sites, 2019 survey of security professionals.
30

#RSAC
Apply: What's Important To You?
Right After RSA: Look at your last five significant security events or incidents, and their root causes. Do your personal views on what is important to your security map well to those root causes?
Three Months Out: Do the same thing.
Six Months Out: Make a strategy to articulate these important things, in plain business English, to leadership.
31

#RSAC
If You Think That Isn't Funny, Here's Something That Isn't Even Funnier... Third Party Risk

#RSAC
In This Context, Let Us Consider Third Party Risk.
A survey of 608 decision makers from Professional Services, Finance, Manufacturing, Healthcare, Retail and the Public Sector:
 89 vendors are accessing their company's network every single week.
 75% saw access by third parties grow in the past 24 months. This was in 2016.
33

#RSAC
And remember....
We are, all of us, outsourcing that which is not our core competency.

Payroll Health benefits Human Resources Trouble Ticketing Accounting Bill paying Customer Relationship Management Account reconciliation

IT management IT Security management IT Security monitoring Log management Firewall management Employee tech onboarding Secure messaging Business process management

Drafting Translation services Marketing Web design Recruitment Sales lead management IT Response (alert management) Banking

34

#RSAC
If Everyone Is In This Cloudy Boat
Since everyone is making these same kinds of decisions, everyone has holes in their intra-cloud migration strategy. We're trusting with our data vendors who are on this same journey; vendors who have made tradeoffs (as we all do) as to what to implement first: security or product features (as if the former isn't the latter) This leads to some new kinds of procurement challenges...
35

#RSAC
A Case Study in Outsourcing: Payroll Which cloud-based payroll processor supports TOTP application-based MFA for login?
36

#RSAC
So, I Sign Up For JustWorks.
On the second day, after all sorts of configuration, I need to change something complex, so I call their toll-free customer support number. I tell them what I need to accomplish. They say...
37

#RSAC
The Most Dreaded Words I Can Hear:
"For security purposes, please tell me your full name, and the last four digits of your
Social Security Number..."
38

#RSAC
Everyone Moves Rightward At A Different Speed
The other payroll companies don't consider (non-SMS-based) MFA to be an important feature for their customers. If customers don't specifically ask, it's "not important." We know of a SIM-swap based attack last month that leveraged phone-based password reset to target institutional trading accounts. So the question becomes, "Does your vendor vetting program ask about password reset?"
39

#RSAC
Some Vendor Onboarding Truths
Many companies think about the data they entrust to a TP provider in levels, like low, medium, or high, or 1, 2, and 3. As Aaron Turner used to say, "Data is protected or it is not." There are no "levels." As breaches have taught us, we can't plan what data types are important to thieves.
40

#RSAC 41

#RSAC
Rethink Your Vendor Onboarding Vetting Process
Spreadsheets are fine, but are the questions you're asking made for another era? Do they assume the vendor is in the cloud, or that they're not?
 Example: Do you ask whether the vendor has separate prod and non-prod environments? If developers need MFA and VPN to get into their cloud? How they detect unencrypted S3 buckets? How they automate deployment?
 These are more impactful answers than that to, "Do you have a firewall?"
42

#RSAC
Apply: Third Party Risk Assessment
After The Conference: Review your presumptions about TPR, and the questionnaires and spreadsheets you use to qualify vendors. Within 3 Months: Prepare program revamps for new vendor onboarding based on the assumptions that outsourced solutions are cloud based, and they've got your data. Within 1 Year: Begin a program to review ex-post-facto your entire vendor stable under these new criteria.
43

#RSAC
Summary
"The cloud" is safe. We are human. "Safe" doesn't mean what we think. Configuration, more than ever, is everything. If you are not standardizing deployment, creating infrastructure-ascode; and testing all your configuration assumptions, you are committing Cloud-Enabled Stupid, deployed at Cloud Speed. This is where the distinction between ZeroTrust and "Basic cloud computing configuration" becomes key. It will never be cheaper or easier than it is today to get this right.
44

#RSAC
Thank You!
Nick Selby nselby@paxos.com @fuzztech

