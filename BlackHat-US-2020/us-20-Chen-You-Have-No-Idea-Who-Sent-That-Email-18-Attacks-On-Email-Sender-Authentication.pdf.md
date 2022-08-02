You Have No Idea Who Sent That Email: 18 Attacks on Email Sender Authentication
Jianjun Chen, Vern Paxson, Jian Jiang
#BHUSA @BLACKHATEVENTS

About Us
· Jianjun Chen: Postdoc at ICSI
- HTTP, Email: "CDN forwarding loop"[NDSS16], "Host-of-troubles"[CCS16]
· Vern Paxson: Professor at UC Berkeley
- Creator of the Bro IDS - Co-founder of Corelight, providing network traffic analysis solutions
· Jian Jiang: Senior Director of Engineering at F5 (Shape Security)
- DNS, Web: "Ghost DNS"[NDSS12], "Cookies lack Integrity"[USENIX15]
2

How Do You Verify the Email Sender?
3

A Case of Our Spoofing Attacks on Gmail (Fixed)
4

Background:
Sender & Authentication
5

Background: Who's the Sender?

SMTP envelope

HELO helo.sender.com

The user who transmitted the

MAIL FROM: <s@mfrom.sender.com>

message (usually not displayed)

RCPT TO: <bob@email.com>

The user who composed the

From: Secure Bank <noreply@bank.com>

message (Visible to the end-

To: Bob <bob@email.com>

user)

Subject: Account Alert: Suspicious Purchase

Dear Bob,

We are writing to inform you that...

Message data

6

Background: Email Transmission

SMTP

SMTP

IMAP POP

1

2

3

Alice Mail User Sending Service Receiving Service

Agent

(a.com)

(b.com)

HELO a.com MAIL FROM: a.com
From: <alice@a.com> To: <bob@b.com>

Attacker

Mail User Bob Agent

The original SMTP has no built-in authentication mechanism · Anyone can spoof any identity in HELO/MAIL FROM and From
7

Three Sender-Authentication Protocols
· Sender Policy Framework (SPF, RFC 7208)  verifying the IP address of the sending domain
· DomainKeys Identified Mail (DKIM, RFC 6376)  verifying the email is signed by the sending domain
· Domain Message Authentication, Reporting and Conformance (DMARC, RFC 7489)  "how to" policy for recipient based on SPF and DKIM  "fix" the alignment problem of SPF and DKIM
8

Sender Policy Framework (SPF)

1 Publish authorized IP lists via DNS
DNS
a.com TXT 1.2.3.0/24

HELO a.com MAIL FROM: <s@a.com> RCPT TO: <bob@b.com>
From: Alice <alice@a.com> To: Bob <bob@b.com> Subject: Hello from Alice
Dear Bob,
I'm Alice...

2 Query the domain in HELO and MAIL FROM to obtain the IP lists
3 Check if the sender's IP matches the IP lists · If yes, SPF pass
DNS
a.com TXT 1.2.3.0/24

MUA Alice

Sending Services 1.2.3.4
a.com

Receiving Services

MUA

b.com

Bob

1.2.3.4 matches 1.2.3.0/24

9

DomainKeys Identified Mail (DKIM)

1 Publish public key via DNS
2 Generate DKIM-Signature with private key and attach it to the message.
DNS

HELO ehlo.a.com MAIL FROM: <s@mfrom.a.com> RCPT TO: <bob@b.com>
DKIM-Signature: ...;d=a.com; s=any;...
From: Alice <alice@a.com> To: Bob <bob@b.com>
Dear Bob,

I'm Alice...

MUA Alice

Sending Services
a.com

3 Query "s._domainkey.d" (any._domainkey.a.com) to obtain public key
4 Validate DKIM signature with the public key
DNS

Receiving Services
b.com

MUA
Bob
10

What's Wrong with SPF/DKIM?

HELO helo.attack.com MAIL FROM: <s@mfrom.attack.com> RCPT TO: <bob@b.com>
DKIM-Signature: ...;d=attack.com; s=2020;...
From: Alice <alice@a.com> To: Bob <bob@b.com> Subject: Hello from Alice
Dear Bob,
I'm Alice...

What SPF verifies
What DKIM verifies What the end-user sees
Neither SPF nor DKIM validate the From header that is displayed to the end-user.

11

Domain Message Authentication, Reporting and Conformance (DMARC)

3 Receiving services perform identifier alignment test to check if the domain in From header matches SPF or DKIM-verified domain.
· Exactly match (strict) or have the same registered domain* (relaxed, default mode)
4 The email passes DMARC authentication if: 1) either SPF or DKIM show a positive result, and 2) the From header domain passes the alignment test.

DNS
1 publish policy via DNS

DNS
2 Query the domain in From header

MUA

Sending Services

Alice

a.com

* Defined in public suffix list, https://publicsuffix.org/

Receiving Services
b.com

MUA
Bob
12

Overview of Email Authentication Flow

Verify HELO and MAIL FROM

DNS

DNS Check alignment with From

MUA Alice

Sending Services

SPF DKIM

DMARC

Receiving Services Verify DKIM-signature

What could possibly go wrong?

MUA Bob
13

Bypassing the Authentication
14

Key Idea of Our Attacks

MUA Alice

DNS
Sending 1 Services

DNS 5

2
SPF DKIM
3

DMARC
4

Receiving Services

6
MUA Bob

Inconsistencies between different components could lead to security vulnerabilities.
15

Key Idea of Our Attacks

Ambiguous input ID1-ID2
Attacker

I understand ID1
Component A

I understand ID2
Component B

Inconsistencies between different components could lead to security vulnerabilities.
16

Exp. 1: Inconsistencies b/w SPF and DMARC

SMTP defines multiple identifiers
· HELO and MAIL FROM
SPF (RFC 7208)
· Check both HELO and MAIL FROM · If either fails, SPF fails
DMARC (RFC 7489)
· Use MAIL FROM for alignment test. · If MAIL FROM is empty, use HELO

HELO attack.com MAIL FROM: <any@bank.com>
From: <sec@bank.com> To: <victim@victim.com>
Dear Customer,
We are writing to...

Ambiguity: SPF uses HELO, and DMARC uses MAIL FROM

17

Exp. 1: Inconsistencies b/w SPF and DMARC

Ambiguity: SPF uses HELO, and DMARC uses MAIL FROM

HELO attack.com MAIL FROM: <any@notexist.bank.com>
From: <sec@bank.com> To: <victim@victim.com> Dear Customer,
We are writing to inform you that...

1 SPF cannot verify MAIL FROM, and can only verify HELO · the non-existent domain doesn't have SPF policy, yet not considered as FAIL
2 DMARC uses MAIL FROM · because MAIL FROM is not empty
3 SPF pass, DMARC pass

18

Exp. 2: Inconsistencies b/w DKIM and DNS

Ambiguity: What DKIM uses differs from what DNS queries

HELO attack.com MAIL FROM: <any@attack.com>
DKIM-Signature: ...;d=bank.com; s=attack.com.\x00.any;...
From: <sec@bank.com> To: <victim@victim.com>
Dear Customer,
We are writing to inform you that...

1 Attacker signs the message with his private key and sends the message
2 When receiving the message, DKIM use `attack.com.\x00.any._domainkey.bank.com' to obtain the public key
3 But DNS takes \x00 as a terminator, and obtains public key from attack.com
4 DKIM pass, DMARC pass

19

Exp. 3: Authentication Results Injection

Ambiguity: Exploiting how SPF/DKIM forwards results to DMARC

RFC 8601 define Authentication-Results header for communicating

results between SPF/DKIM and DMARC

Comments

Authentication-Results: example.com; spf=pass smtp.mailfrom=sender@sender.com; dkim=pass (1024-bit key) reason="signature ok" header.d=sender.com;

DMARC extracts "smtp.mailfrom" and "header.d" to check alignment with

From header.

20

Exp. 3a: DKIM Authentication Results Injection

HELO attack.com MAIL FROM: <any@attack.com>
DKIM-Signature: ...; s=selector; d=bank.com(.attack.com;...
From: <sec@bank.com> To: <victim@victim.com>
Dear Customer,
We are writing to inform you that

1 Attacker signs the message with their private key
2 DKIM verifies the message with the attacker's public key from `selector._domainkey.bank.com(.attack.com' and generates:
Authentication-results: bank.com; Comments
dkim=pass (1024-bit key) header.d=bank.com(.attack.com;
3 DMARC parses the content after the "(" as a comment, and uses bank.com to check alignment with From header
4 DKIM pass, DMARC pass
21

Exp. 3b: SPF Authentication Results Injection

HELO attack.com MAIL FROM: <any@bank.com.(attack.com>
From: <sec@bank.com> To: <victim@victim.com>
Dear Customer,
We are writing to inform you that...

· SPF verifies bank.com(.attack.com
· DMARC uses bank.com to check alignment with From header
· SPF pass, DMARC pass

Attacker can also use single (`) and double (") quotes to replace "(".

22

Exp. 4a: Multiple From Headers

Ambiguity: What receiving server verifies differ from what MUA displays

From: <any@attack.com> From: <admin@bank.com> To: <victim@victim.com>
Dear Customer,...

From: <any@attack.com> From: <admin@bank.com> To: <victim@victim.com>
Dear Customer,...

Attacker Server

Receiving Services
DMARC verifies attack.com

Mail User Agent Victim
MUA display bank.com

· RFC 5322: Messages with multiple From should be rejected · In practice: 19/29 accept (15 use first, 3 use last, 1 show both)
23

Exp. 4b: Multiple From Headers with Space

Three types of variants:
1) _From: a@a.com ; 2) From_: a@a.com; 3) From\r\n_: a@a.com

From : <any@attack.com>
From: <admin@bank.com> To: <victim@victim.com>
Dear Customer,...

From : <any@attack.com>
From: <admin@bank.com> To: <victim@victim.com>
Dear Customer,...

Attacker Server

Receiving Services
DMARC verifies attack.com

Mail User Agent
Victim
MUA display bank.com

24

Exp. 4c: Multiple From Headers with Normalization

Space
From: <any@attack.com> From : <admin@bank.com> To: <victim@victim.com>
Dear Customer,...

Space removed
From: <any@attack.com> From: <admin@bank.com> To: <victim@victim.com>
Dear Customer,...

Attacker Server

Receiving Services
DMARC verifies attack.com

Mail User Agent
Victim
MUA display bank.com

25

Exp. 5: From/Sender Ambiguity

· 7/19 MUAs display Sender or Resent-From header value when From header is absent

From : <any@attack.com>
Sender: <admin@bank.com> To: <victim@victim.com>
Dear Customer,...

From : <any@attack.com>
Sender: <admin@bank.com> To: <victim@victim.com>
Dear Customer,...

Attacker Server

Receiving Services
DMARC verifies attack.com

Mail User Agent Victim
MUA display bank.com

26

Email Parsing Process

Email Message

Parse

From Header

ambiguity

Parse

Email Address

From: Secure Bank <admin@bank.com> To: <victim@victim.com> Dear Customer,...
From: Secure Bank <admin@bank.com>
admin@bank.com

27

Complex From Header Syntax
Display Name Comments Route portion Real address
From: Secure (b@b.com) Bank <@c.com, @d.com: a@a.com (e@e.com) > (f@f.com)
A quick example of valid (!) From header
· Multiple address lists. [RFC 5322] · Encoding: defined to support no-ascii character. [RFC 2047]
From: bob <b@b.com> is equal to From: =?utf-8?B?Ym9i?=<b@b.com> in Base64 encoding
· Quoted-pair: use `\' to escape special characters like `( `. [RFC 5322]
28

Exp. 6a: Exploiting Differences in Feature Support

Mail server

Email client

Mail server

Email client

Email client

Mail server
29

Exp. 6b: Exploiting Parsing Inconsistencies

Email client

Mail server

Email client

Mail server

Mail server

Email client

30

How Prevalent are UI-mismatch Vulnerabilities?
· We tested 10 popular email providers and 19 email clients · 43 out of 82 different combinations that could be exploited · What we found only constitutes a subset of the problem
Read our paper for more details
31

Exp. 7: Spoofing via an Email Service Account

Ambiguity: What sending server validates differ from what MUA displays
Auth username/pass

MUA Alice

Sending Services

Receiving Services

MUA Bob

Custom Attackers with an email service account
MUA
- attacker@gmail.com tries to spoof admin@gmail.com

· Sending services should ensure that the From header matches
authenticated username · But From header validation is error-prone because of complex syntax
· We found 7 out of 8 email providers are vulnerable

32

Exp. 8: Combing Replay and Multiple-From Ambiguity (1/2)

1 Attacker emails himself through the email provider server.

MUA Alice

Sending Services

Custom MUA

Attackers with an email service account - Create deceptive content in body, To, and
Subject, but not From header

Attacker's server

Attacker

RCPT TO: <attacker@gmail.com>

DKIM-Signature: ...; s=selector; d=gmail.com;...
From: <attacker@gmail.com> To: <victim@victim.com>

Dear Customer,

We are writing to inform you that...
33

Exp. 8: Combing Replay and Multiple-From Ambiguity (2/2)

2 Attacker replays the messages with an extra From header.

MUA Alice

Sending Services

Receiving Services

MUA Victim

Attacker Server

RCPT TO: <victim@victim.com>

Replay attacker
Ambiguity: What DKIM verifies differs from what MUA displays · DKIM components verify the last header

DKIM-Signature: ...; s=selector; d=gmail.com;...
From: <admin@gmail.com> From: <attacker@gmail.com> To: <victim@victim.com>

· MUAs show the first header

Dear Customer, We are writing to inform you that...

34

Thinking on Defense
· Better parsing and protocol spec
· "Be liberal strict in what you accept" · make protocol implementation-friendly
· simple, well-typed/structured messages, reduce/avoid multiple party processing
· Better UI
· UI needs more explicit security indicators
· For end-users
· Don't blindly trust the email sender displayed in email client · Use end-to-end authentication such as PGP
· PGP may also have parsing ambiguities, but hopefully better than those in SPF/DKIM/DMARC.
35

New tool - espoofer
We will make this tool publicly available at https://github.com/chenjj/espoofer
36

Thank you!
See more demo videos at here, full paper at here.
37

