Selling 0-days to governments and offensive security
companies
Maor Shwartz

About Me

Working as a vulnerability broker (~4 years) · Q-recon · Beyond Security
Cyber Security / Threat Intel researcher in Insurance industry
Hobbies · Hiking · E-games

@malltos92

Maor@qrecon.com

· Who is this talk for?

Agenda

· My Story

· Overview

· Who is selling 0-days to governments / offensive security companies?

· The process of selling 0-days

· How to sell 0-days?

· Tips for beginners

Is this talk for you?

This is not a technical talk, this also not a deep drill down in to the brokerage world

This is meant to help researchers who are new or interested in the transactional process

Share some of my experiences and a few tricks to help you along
the way

My story ­ The Beginning
Founded a vulnerability brokerage company called Q-recon
Had quite a few researchers working with me Attained some major clients
After a few successful moves started to get attention · Sold 0-days · Found jobs for a few researchers

Got on a major player's radar (will not reveal the name). Effectively threatened in a broad daylight at a café. Not worth the risk, closed Q-recon
My Story ­ The End (?)

Overview

Regular Development issues
In traditional software companies: · The problem is linear
· When the company encounters a technology problem ­ they hire an army of developers in order to solve that problem

The uniqueness of vulnerabilities research

Finding vulnerabilities is an art, not a science (Most of the time) That's why it's a multi million dollars industry You can hire a lot of vulnerability researchers, spend millions and find nothing

History

In the past 5 years the 0-day market has transformed drastically
Increase in number of:

Brokerage companies
Conferences
Bug bounty programs

Offensive security companies
Competitions
Budgets

Stepping out of the shadows
(No more whispering in dark alleyways)

Who is interested in 0-days?

Cyber security companies (defense)
Bug bounty programs
Bug bounty platform

Vulnerability brokers
Competitions Pwn2Own / PWNoRAMA / Hack2Win /
Zer0Fest

Offensive Security Companies
Government
Criminals

Who is buying what?

The community

Cyber security companies
(defense) - PR
Bug bounty programs
Bug bounty platform

Vulnerability brokers
Competitions Pwn2Own / PWNoRAMA / Hack2Win /
Zer0Fest

Offensive Security Companies
Government

Vulnerability researchers ­ overview (HackerOne)
HackerOne 166,000
Registered Hackers
72,000 vulnerabilities submitted
70% of the reported vulnerabilities are focused
on web

Vulnerability researchers ­ overview (bugcrowd)
AMOUNT PAID BY TARGET SUBMISSIONS PAID BY TARGET

WEBSITE ANDROID API HARDWARE IOS IOT WEBSITE ANDROID API

IOT

There are also high-end researchers that contribute to the community

Whitehats

There are a lot of "vulnerability researchers"

Most are focused on lowhanging fruit
Quick and easy money Bug bounties

The high-end researchers: · (Sometimes) Ideologically
motivated
· Working in Cyber security companies / research teams (PR motivated)

Who is interested in 0-days?

Cyber security companies
(defense)- PR
Bug bounty programs
Bug bounty platform

Vulnerability brokers
Competitions Pwn2Own / PWNoRAMA / Hack2Win /
Zer0Fest

Offensive Security Companies
Government
Criminals

The High-End Market
*No user interaction pre-auth RCE or LPE

The High-Rollers Table

End-product
Vector · RCE + LPE + Persistence
Vulnerabilities · RCE | LPE | Persistence
Component (parts in a chain)
· Info leak · Mitigation bypass

Services
Dedicated research · Freelancing
Workshops
Consulting · Validate other researchers vulnerabilities
Support · Exploit new versions

Companies vs Governments

Offensive security companies

Knowledge
(vulnerabilities)

Product (license)

Governments

Capable countries
Internal research

Incapable countries

How are they getting them
0-days

Researchers by groups
Researchers High-End Working in
Offensive Sec
Willing to sell

The researcher journey

Steady Income

Published 1-2 high-end vulnerabilities
Hired by an offensive security
company

Opened own
research
company

Time

Redirect The researcher sells vulnerabilities and have
a day-to-day job
Research team in cyber defense company
Pentest
Etc.

The Process of Selling 0-days

The sales process - overview

A researcher finds a
vulnerability

Contacts a potential
client

Provides an overview about the
vulnerability

Negotiation

Signing a contract

Validation of the
vulnerability by the client
(Q&A)

Payment

Payouts
As a researcher you expect to get paid more than the vendor bug bounty program

There is no single pricelist
· Competitions (pwn2own / PWNoRAMA)
· Rumors ­ other researchers that sold
· Hacking Team like incidents

Zerodium transformed the optics for 0day acquisition, devil is in
the details.

Payouts ­ behind the scenes
Different entities will offer different payouts for the same vulnerability Warranty and Seller model matters

Complexity of the system

Mitigations

Supply and demand

Who is the researcher

Deliverables

Generic

Exclusive / Nonexclusive

Payouts ­ behind the scenes

WhatsApp / Signal / iMessage 0clicks
~1.5M$

iOS / Android PE
~400600k$

Windows PE
(Redstone 6)
~250500k$

Linux PE
~150400k$

Chrome RCE
(without sandbox escape)
~300400k$

FF RCE
~200400k$

Edge RCE
~100300k$

*Assuming high end products with ~95% reliable, ~3 seconds execution time and generic

NOTE
Just because your item is worth this amount, doesn't mean there is an active or captive buyer willing to pay
for it
Market demand changes regularly
But the "High end vulnerabilities" are generally in "regular" demand

The sales process - overview

A researcher finds a
vulnerability

Contacts a potential
client

Provides an overview about the
vulnerability

Negotiation

Signing a contract

Validation of the
vulnerability by the client
(Q&A)

Payment

IMPORTANT
I DO NOT PROVIDE LEGAL ADVICE AND DO NOT CREATE AN ATTORNEYCLIENT RELATIONSHIP.
IANAL: I Am Not A Lawyer

Legal - Contracts
Spec Exclusive / Nonexclusive
Delivery date Validation period Fees & payment

Propriety rights Confidentiality
Support Governing law Export liability

Spec
Bug type Exploit result Vector Affected architecture Reliability Execution time Mitigations bypass Supported versions Product configuration Deliverables

As a researcher, you guarantee the end result of the vulnerability on a
pre-defined configuration
There is some acceptable variance with your estimates (+/- 5%)
Never claim it is more reliable or capable then it is, it will end badly.

Legal - Contracts
Spec Exclusive / Nonexclusive
Delivery date Validation period Fees & payment

Propriety rights Confidentiality
Support Governing law Export liability

Validation Period
Make sure you get access to the client test environment Where possible, consider having a VM image ready in case
you need to ship the working state PoC Ensure buyer is prepared to test the item before sending ­
avoid anxiety

Usually 14 days
If the client has questions ­ there is an extension of
up to 7 days (Total of 21 days)
During the validation period, the client can decline the vulnerability if it doesn't comply to the
Spec

Legal - Contracts
Spec Exclusive / Nonexclusive
Delivery date Validation period Fees & payment

Propriety rights Confidentiality
Support Governing law Export liability

Fees & Payment
THERE IS NO SUCH THING AS ADVANCED PAYMENT · Split the risk approach
· 100% on validation usually below 100k
· VAT (if applicable)
· Cryptocurrency VS Fiat
· Remember - if the transaction will be in USD (standard pricing), you should have a USD account

Legal - Contracts
Spec Exclusive / Nonexclusive
Delivery date Validation period Fees & payment

Propriety rights Confidentiality
Support Governing law Export liability

Propriety Rights

Exclusive
Buyer acquires any and all title, copyright,
or other proprietary rights
Researchers - make sure you add to the contract the ability to use your vulnerability for internal research

Nonexclusive*
The researcher sells a license
Can be sold multiple times

*Non exclusive isn't as good as you may think strategically, many times its worst

Legal - Contracts
Spec Exclusive / Nonexclusive
Delivery date Validation period Fees & payment

Propriety rights Confidentiality
Support Governing law Export liability

Support
Support can take many forms:
· Exploit adjustments to: Product new / older versions New vectors
· If the vulnerability is patched, the researcher may need to provide a different vulnerability
· Provide a workshop about the vulnerability to the client

Don't Forget ­ Support is worth money
if you are going to provide technical support for your sale, make sure you get
paid for it

Legal - Contracts
Spec Exclusive / Nonexclusive
Delivery date Validation period Fees & payment

Propriety rights Confidentiality
Support Governing law Export liability

Governing law

Be mindful of where legal disputes are handled. Make sure you have all the licenses if something goes terribly wrong. Are there grounds for a suit? Work with reputable buyers, they have no incentive to take bad deals that lead to legal action. Reputation matters for both sides.

Legal - Contracts
Spec Exclusive / Nonexclusive
Delivery date Validation period Fees & payment

Propriety rights Confidentiality
Support Governing law Export liability

Wassenaar agreement
The Wassenaar agreement on Export Controls for Conventional Arms and DualUse Goods and Technologies is a multilateral export control regime.
In simple words ­ In some countries you need an export license.
Each state legislates laws that represent the Wassenaar agreement differently.

Agreement

Law

Wassenaar agreement
'Vulnerability disclosure' means the process of identifying, reporting, or communicating a vulnerability to, or analyzing a vulnerability with, individuals or organizations responsible for conducting or coordinating remediation for the purpose of resolving the vulnerability.

Export liability - Wassenaar

Report to vendor

Exporting (End-product / Research
Service)
Special Marketing License

No problem

Special Selling License

Ministry Of Defense (MOD)

Finding the Customers

The sales process - overview

A researcher finds a
vulnerability

Contacts a potential
client

Provides an overview about the
vulnerability

Negotiation

Signing a contract

Validation of the
vulnerability by the client
(Q&A)

Payment

Selling Vulnerabilities to Govs / Companies

Official point of contact

Vulnerability brokers

Personal connections (govs / companies)

Official point of contact

Governments direct can be extremely time consuming

Some governments and offensive security companies publish "official" point of contact
Conferences (business cards / emails / flyers etc.) Direct approach ("cold email")
As a researcher, you can email companies you think will be interested (They will probably reply)

don't expect amazing terms or a timely schedule for decision making or payment

Some may be willing to engage directly unsolicited (expect significant competition)

some may be impossible to reach and need a direct
relationship or introduction

Official point of contact

Pros

Cons

The researcher knows who the client is
Updated in real time on the status of the deal

The client (usually) knows the researcher identity
Limited number of potential clients (~5)

Legal (licensing)

Legal (licensing)

The researcher might get underpaid
Bad Contract (The client can add limiting terms before
buying)
Multiple POCs Simultaneously - Time consuming

Selling Vulnerabilities to Govs / Companies

Official point of contact

Vulnerability brokers

Personal connections (govs / companies)

Personal connections

Pros

Cons

The researcher knows who the client is
Updated in real time on the status of the deal

The client (usually) knows the researcher identity
Limited number of potential clients (~5)

Legal (licensing)

Legal (licensing)

Full payment without worries* Trust

The researcher might get underpaid
Bad Contract (The client can add limiting terms before
buying)
Multiple POCs Simultaneously - Time consuming

Vulnerability broker

The 0-day broker ­ My experiences

Workshops
HR services (Full / part time jobs)
On demand projects (freelancers)

Selling end-product (vulnerabilities / exploits)
Working with other brokers
Helping clients to create their own ability to buy
and sell 0-days

Benefits of working with brokers

Anonymity

Market Landscape

Close and intimate
relationship with clients

Negotiation

Legal

Manage the process

How does a broker make his money?

The broker charge the client for his services There are couple of models:

Broker Fee - % on top of the initial price.
Q-recon fees were:
· 17% from companies
· 15% from governments

Reseller - The broker buys the vulnerability from the researcher
and sells it to couple of clients

Subscription yearly or monthly subscription fee.

Selling 0-days ­ In a nutshell

Don't waste too much time in the high-end market if your vulnerability isn't high quality

Ensure your PoC is stable and mature and always works on the latest sable

Just because your iOS Safari RCE/LPE is worth XXXX doesn't mean there is a buyer for it

NEVER oversell a vulnerability hoping it will lead to a
successful transaction, IT WILL NOT, find better bugs

Selling 0-days ­ In a nutshell

Exclusive has its pros. Juggling non-exclusive to
multiple parties is both stressful and can easily fall
apart

DO explain if the vulnerability is stable and deterministic, but
your exploit is just sh*t and can be improved (can save a deal)

If you sell non exclusive, limit the expose to a few trusted
clients

NEVER tweet or be overt about a transaction, it can
breach the contract confidentiality and relationship
trust

Selling 0-days ­ In a nutshell

0days lately burn a lot faster due to p0 and such .
Your lower offer might in fact to be the better offer if your 0day
goes to 0$

Always listen to feedback. If your are skilled at Edge
Chakra and your broker tells you to focus on V8 you should
probably consider the buyer feedback

Sometimes transactions just don't work out, but when they do work out ­ it's definitely worth it

Selling 0-days ­ In a nutshell
The going rate for any vulnerability is based purely on Demand. If the market is flooded with a capability, it doesn't matter what its worth if
everyone is redundant
Exclusive might seem easy to work around or later "convert" to non exclusive. DON'T, most buyers/brokers are in the same
network/circles, with real deal buyer its even a smaller world. Trust is everything in this market

Some Tips for Beginners

Get Some Street Cred
Play CTFs Go to Conferences ­ meet researchers and potential clients Publish 1-2 vulnerabilities (high-end) Get help when in doubt Know your s*** (Never "Fake it till you make it"). Don't worry about imposter syndrome or if you're good enough, you never know until you try

How Can I Help You on Your Journey
I closed my company, but I still want to help. ATM, I offer my services for free, no strings attached.

Questions?

Thank you very much for your time

@malltos92

Maor@qrecon.com

