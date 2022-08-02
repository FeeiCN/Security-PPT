SESSION ID: HUM-W02
Trends in Social Engineering: How to Detect and Quantify Persuasion
#RSAC

Markus Jakobsson
CTO ZapFraud Inc @JakobssonMarkus

#RSAC
My collaborators
Ana Ferreira, Cintesis, University of Porto Damon McCoy, NYU Elaine Shi, Cornell University Youngsam Park, University of Maryland + ZapFraud Ting-Fang Yen, DataVisor Arthur Jakobsson
2

#RSAC
Overview
Scams and persuasion ­ why we care Data sampling and datasets Scam trends ­ what is happening? Persuasion ­ how and why does it work? Case study ­ Business Email Compromise (BEC) examples Using insights into persuasion to improve filtering Action items / recommendations
3

#RSAC
Datasets

#RSAC
Selecting (reasonably) unbiased datasets
Complaints from people who lost money (FBI/IC3)
Not everybody who loses money files complaints
Submissions to scam reporting websites
Maybe mostly "average sneaky" scams are submitted?
Spam benchmark dataset ("untroubled" spam archive)
Reflects what spam filters blocked, not what people received
Ham datasets
Enron, Jeb Bush, subscriber inboxes, Amazon reviews
5

#RSAC
Trends in 419 Scams

#RSAC
Untargeted in decline ­ except authority
Authority scams include: - Government scams - Bank scams

Money transfer scams includes: - Next of kin scams - Commodity scams - Charity/dying person scams - Widow/orphan/refugee scams
7

Comparing to FBI/IC3 findings - ~50% increase 2013-2014 - most common fraud against elderly

#RSAC
Targeting and sophistication up
Perfect spelling
Scam
8

#RSAC
Ham remains the same, scam changes

Words commonly used in scams ... ... in Amazon reviews ...

... and in scam messages ... (2000-2014)

frequency

9

#RSAC
What is persuasive ... is personal
10

#RSAC
What is persuasive ... is personal
11

#RSAC
What is Persuasion?

#RSAC
Persuasion is about convincing arguments
Appeal to greed and opportunism Appeal to a wish to comply Appeal to weakness Appeal to empathy And just appeal
13

#RSAC
Persuasion is about structure
What happens makes sense
14

#RSAC
Persuasion is about knowledge
Gather contextual knowledge from:
· Breaches · Account take-overs · Social networks · Other public sources
15

#RSAC
Quantifying persuasion
Degree risk perception Perfection of targeting
Persuasion = Credibility * Fit
Yield ~ persuasion in absence of protection
16

#RSAC
Measuring credibility
You cannot ask "Does this look risky to you?"
17

#RSAC
Measuring credibility
But you can ask "What type of risk is this primarily associated with?"
18

#RSAC
Example scam to evaluate
You have exceeded your mailbox quota. Your account will be blocked 8 AM tomorrow unless you request more space. You can request more space by clicking here.
19

#RSAC
Type of risk is primarily associated with?
The recipient may get a computer virus. The recipient may lose his password. This may be a scam aimed at stealing your money. There is no risk. The recipient may get unwanted advertisements. The recipient's account may be blocked if she
does not pay attention.
20

#RSAC
Correct answer
The recipient may get a computer virus. The recipient may lose his password. This may be a scam aimed at stealing your money. There is no risk. The recipient may get unwanted advertisements. The recipient's account may be blocked if she
does not pay attention.
21

#RSAC
Reasonable answer
The recipient may get a computer virus. The recipient may lose his password. This may be a scam aimed at stealing your money. There is no risk. The recipient may get unwanted advertisements. The recipient's account may be blocked if she
does not pay attention.
22

#RSAC
Naïve answer
The recipient may get a computer virus. The recipient may lose his password. This may be a scam aimed at stealing your money. There is no risk. The recipient may get unwanted advertisements. The recipient's account may be blocked if she
does not pay attention.
23

#RSAC
Comparing credibility

% naïve
60 50 40 30 20 10
0 Mailbox quotaTraditional 419 Targeted

[Jakobsson, Yen, 2015]

24

#RSAC
Case Study: Business Email Compromise (BEC)

#RSAC
BEC: Targeted and on the rise
26

#RSAC
BEC: A first example
27

#RSAC
BEC: A first example
<EGonzalez@media-produtcion.com> =
<EGonzalez@media-production.com>
"Deceptive" is in the eye of the beholder. The above is deceptive (only) to somebody with
a relationship to a person with a similar email address.
28

#RSAC
BEC: A second example
29

#RSAC
Why recipients fall for BEC
Persuasive structure: The sender is ­ or looks like ­ somebody the recipient knows. (Everybody want to be nice to friends and colleagues.) Persuasive content: The request will relate to "normal business" ­ no Libyan princesses. (Why not comply when it makes sense?)
30

#RSAC
Why spam filters fail to block BEC
Not high-volume messaging Volume-based detection fails
No typical spam keywords, but normal business conversation Content-based detection fails
Sent by a trusted party (that has been corrupted) Trusted parties can send pretty much anything
... or by a party with no bad reputation (account just created) Reputation-based detection fails
31

#RSAC
Detecting BEC based on persuasive structure
EGonzalez@media-produtcion.com is deceptively close to EGonzalez@media-production.com
and EGonzalez@media-production.com is a trusted party.
32

#RSAC
Detecting BEC based on persuasive structure
JBlackwell@blackwellfinancial.com has a reply-to address to JBlackwell682@gmail.com
and JBlackwell@blackwellfinancial.com is a trusted party
and JBlackwell682@gmail.com is a never-seen reply-to address with a deceptively similar user name to the trusted party.
33

#RSAC
Observation/Classification/Action

Deceptive Sender

Cousin name

Discard

New reply-to Deceptive reply-to

Spoof Passive ATO

Ask apparent sender to confirm; deliver

High-risk content

Active ATO

34

Ask sender on other channel to confirm

#RSAC
Quantifying Exposure and Risk

High trust External Internal

CEO CFO

Commonly cc-ing `external self' Sometimes sending from wrong acct

Emails w/ high-risk keywords (wire)

! 31

8
!

! 32

!

15

35 !

Has used `non-self' reply-to

Org. does not support DMARC !

26

Very large number of contacts

Has responded to high-risk email

Email w/ high-risk keyword (invoice)

35

#RSAC
Action Items

#RSAC
What you should do
Recognize that spam filters do not address scam/BEC Best practices: Assess your organization's exposure to BEC Consider internal awareness campaigns Be aware of your exposure to targeting Review and improve processes for making payments
37

