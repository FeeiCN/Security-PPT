SESSION ID: HT-F01
Phantom Menace, Episode I? The Attack That Undressed the Mexican Banks in `18
Josu Loza
CISSP, CEH, CHFI @josuloza
#RSAC

#RSAC
Your Company Is Ready?
2

#RSAC
Disclaimer:
The information, opinions, images or data expressed in this presentation, are my own personal opinions and don't represent my employers view in any way.
3

#RSAC
Agenda
Remembering The Main Attacks On Wire Transfer Systems. Understanding a Payment System. Building A Secure Infrastructure. Living A Cyberattack, On First Person. Learned Lessons.
4

Not So Long Ago

#RSAC
The Usual Suspects

Organized Crime ­ 5D0ri%ven by profit. Often
looking for personally identifiable information (PII) such as social security numbers, credit cards, and banking info.

Insiders ­ 28%
Disgruntled employees looking for revenge or financial gain. May collaborate with other threat actors for money.

State Sponsored ­ 1M2o%tivated by political,
economic, or military agendas. Often looking for competitive information or users that can be exploited.

Hacktivists
Cause damage to disliked organizations. The ultimate goal is to gain awareness for their issue.

Opportunists
Amateur criminals, driven by desires of notoriety. Looking to exploit flaws in network systems and devices.

6

#RSAC
Main Attacks On Wire Transfers Systems
Group IB. (October 2018). Swift And Local Interbank Payment Systems. The Hi-Tech Crime Trends 2018, p.22. 7

How Many More Attacks Should Happen So That We

#RSAC

Learn To Protect Payment Systems?

Bancomext suffers cyber attack (January 10, 2018)

Cyber attacks in Mexico grew 35 percent this year:
Kaspersky Lab.
8

Megahack banking Mexico (May 14, 2018)

Let The Cat Out Of The Bag
Good morning, mates. For about a month and a half they started with problems with the system of interbank transfers of the network of banks in Mexico. At first they did not want to air the reality of the problem because they did not want to tarnish the reputations of the main banks involved (....... and .......). But this week the media bomb exploded, with periodic reports announcing without restraint that it was indeed a very big hack with millionaire losses (over 400MDP) for
the country's banks. Just today appeared this (attached image) in the forums of 4chan and a few minutes
disappeared .... What do you think about it?
The ---------- I had already put some of that on Twitter, as you already knew something in the darknet.
Blog. (2018). Blog. 2018, de A underground blog on internet. 9

#RSAC

Understanding a Payment System
How any wire transfer system works

#RSAC
General Architecture

PS
$
Payment Transaction

Payment Transaction

PS
$

My Bank Transmitter

Payment Concentrator
11

Other Banks Receiver

Possible Attacks to a Wire Transfer System application

A Overview Of A Wire Transfer Architecture

Internal Network

Secure Connection
Online Banking
$

Web Server DB Server

Back Office

Payment Concentrator

#RSAC
$

Branch

Secure Connection
More Servers

PS

Secure Connection

Secure Connection
Other Banks

Mobile Banking

Executive

Internet

User Developer Contractor cellphone

Internet
13

Case 1. Pwning Wire Transfer System

Internal Network

Secure Connection

Web Server

Online Banking
$

DB Server

Back Office

Payment Concentrator

#RSAC
$

Secure Connection

PS

Branch Secure

More Servers

Connection

Secure Connection

Secure Connection
Other Banks

Mobile Banking

Executive

Internet

User Developer Contractor cellphone

Internet
14

Case 2. Pwning Wire Transfer System

Internal Network

Secure Connection

Web Server

Online Banking
$

DB Server

Back Office

Payment Concentrator

#RSAC
$

Secure
Connection
Branch Secure

More Servers

PS

Connection

Secure Connection

Secure Connection
Other Banks

Mobile Banking

Executive

Internet

User Developer Contractor cellphone

Internet
15

Thinking as an attacker
Imagining very bad things

#RSAC
Payment Concentrator Side
Payment Concentrator

Internal Network

PS
$
Payment Transaction

Executive

PS

$
Payment Transaction

PS

My Bank

Servers Servers Servers
17

User Developer Contractor

Other Banks

#RSAC
Pwning Payment Concentrator Side
Payment Concentrator

Internal Network

PS
$
Payment Transaction

Executive

PS

$
Payment Transaction

PS

My Bank

Servers Servers Servers
18

User Developer Contractor

Other Banks

Building A Secure Infrastructure

A Secure Infrastructure
Isolated Network

Internal Network

Secure Connection
Online Banking
$

Branch

Secure Connection

Back Office Web Server DB Server
More Servers

Isolated Network
PS
Physical Server

Firewall // IPS
Jump Server

Secure Connection

Mobile Banking

Executive User Developer Contractor

#RSAC
Payment Concentrator
$
Secure Connection
Other Banks

Internet
20

#RSAC
In Sumary
Are your data protected in?:
­ Rest. ­ In transit. ­ In use.
Have you already done your annual pentest? Have you already done your annual threat and risk analysis? Do you know the architecture of your applications?
21

Living A Cyberattack, On First Person

#RSAC
Are You Ready To Face A Security Incident?
First question:
­ Do you have already thought about what you should do to attendant a security incident?
In the following scenarios, imagine that you are in the position mentioned and you must attend to what is being requested.
Let's start the security incident.
23

#RSAC
CEO
The reporters are at the principal entrance, you are ready to give a speech?. The company has already lost 20% of its value, shareholders want to know what happens. The regulator is on the phone and wants to know what's going on. You need to urgently call other CEOs.
24

#RSAC
CIO
You have a reporter waiting on the cellphone for an interview for a local channel. The board are waiting for actions. The CFO is texting you and reporting the multi-million dollar losses of the company. Your work team is waiting for instructions and doesn't understand what's happening. The regulator awaits the report on the unavailability of services.
25

#RSAC
CISO
Social networks demand the resignation of the CISO. The Board wants to understand what's happening through a video call and in terms that they understand (they do not understand technological terms and less security terms). Marketing requests your help to write an official statement. The CEO are very upset and are asking for immediate actions. Can you perform all these actions while you're attending a security conference in another country?
26

#RSAC
The Company in General
All employees know how to face an attack?, they know what to do?. There are different communication plans, ready to face the most common threats? The CEO, CIO, CISO, CFO, CTO etc. Are ready to answer an interview?. -NowYour infrastructure is ready to be resilient for a cyber attack.
27

#RSAC
We're On Time
At night, on the weekend or back to our house, let's take 10 minutes to reflect on the following:
­ What points caught my attention? ­ With what points can I help my company? ­ What points can't my company cover today? ­ What actions should we take to be ready for a cyber attack?
On Monday, as the first task, let's start the first activities. Remember, the timer is running.
28

Learned Lessons

#RSAC
The Big Question Is:
The question isn't whether my payment systems will be compromised, is when someone tries to compromise them?, or how many times they tried to compromise them?
30

#RSAC
What We Can Do
Place the wire transfer systems servers and personal computers that operates the wire transfer system in an isolated network. Dedicate exclusive personal computers to wire transfer systems. *** The above points are less expensive than any incident.*** Implement transaction validation mechanisms in all systems. Scan the application code.
31

#RSAC
What We Can Do
Protect wire transfer systems isn't a rocket science and doesn't require a large investment. Place the wire transfer applications on physical servers. Performs an annual audit by a specialist payment systems firm. There must be constant internal reviews of payment media applications.
32

PLEASE! Don't be a statistic

Year 2018 2017
2016
2015

Bank State Bank of Mauritius (NEW)
Banco De Chile (NEW) City Union Bank (NEW) Punjab National Bank (NEW) Bank Negara Malaysia (NEW) EastNets Bureau (Middle East) Far Eastern International (Taiwan)
NIC Asia Bangladesh Central Bank Unnamed Bank (Ukraine)
First Bank of Nigeria Union Bank of India Central Bank of Malaysia P.T. Bank Bumi Arta Tbk (India)
Akbank (Turkey) Russian Central Bank Banco del Austro (Ecuador) Central Bank of the Philippines Tien Phon Bank (Thailand)

Amount $14MM $10MM ($100MM attempted) $2MM $1.77B Unsuccessful No impact $500K $580K ($4.4MM Attempted) $81MM ($1B attempted) $10MM $100MM $171MM Unsuccessful Unsuccessful $4MM $31MM $12MM Undisclosed $1.3M Attempted
33

#RSAC

#RSAC
The Most Important
The AWARENESS is the most important action.
34

#RSAC

@josuloza
35

Josu Loza

