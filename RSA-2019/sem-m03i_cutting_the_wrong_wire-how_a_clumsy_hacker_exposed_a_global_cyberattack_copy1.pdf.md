SESSION ID: SEM-M031
Cutting the Wrong Wire: How a Clumsy Hacker Exposed a Global Cyberattack

RENATO MARINHO
morphuslabs.com @renato_marinho linkedin.com/in/renatomarinho

#RSAC

#RSAC
CRYPTOCURRENCY TRANSACTIONS

Someone requests a transaction

The requested transaction is broadcast to P2P network consisting of computers, know as nodes

Validation The network nodes validates the transaction and the user's status using know algorithms.

A verified transaction can involve cryptocurrency, contracts, records, or other information.

The transaction is complete.

The new block is then added to the existing blockchain, in a way that is
permanente and unelterable.

Once verified, the transaction is combined with other transactions to create a new block of data for the ledger.

2

#RSAC
CRYPTOCURRENCY TRANSACTIONS

CPU

GPU

ASIC

Data Centers Mining Pools

3

#RSAC
BITCOIN VS. USD VARIATION
4

CRYPTO JACKING

#RSAC
· Crypto jacking is an unauthorized use of someone else's computer power to mine cryptocurrency
· The term is associated both for malicious mining on user's Internet browsers and for computers or servers infected with malicious software
5

INCIDENTE RESPONSE
Global Crypto jacking Campaign

#RSAC
PERFORMANCE ISSUES
A multinational company started having performance problems on its main business application
7

FIRST SIGNS

#RSAC
Middle Dec 2017 ­ IT Monitoring Team detected unusual CPU consumption on Web Servers
8

FIRST SIGNS

#RSAC
Triage team examined and reported back that some native Linux processes were consuming CPU
Triage team restarted servers or killed "stuck" processes
9

#RSAC

SERVICE CRASH ISSUES

· After a month trying to understand the performance issues, the service started crashing, hardly impacting business operations
· Different companies started reporting similar issues at the same day

10

DIGITAL FORENSICS

#RSAC
FILESYSTEM ANALYSIS
12

#RSAC
SUSPECT BINARY ANALYSIS
13

#RSAC
SUSPECT BINARY ANALYSIS
14

#RSAC
HOW THOSE FILES WERE PUT THERE?
15

WEBLOGIC VULNERABILITY

#RSAC
WEBLOGIC VULNERABILITY
· CVE 2017­10271 ­ Published 17 Oct 2017
· Remote code execution · No authentication required · Easily exploitable · Impacted versions: 10.3.6.0.0, 12.1.3.0.0,
12.2.1.1.0 e 12.2.1.2.0
17

WEBLOGIC EXPLOIT

#RSAC
Published 23 Dec 2017
https://github.com/c0mmand3rOpSec/C VE-2017-10271/blob/master/exploit.py

18

#RSAC
ATTACK EVIDENCE
19

SCOPING THE INCIDENT

SCOPING THE INCIDENT

#RSAC
Victim targeted by multiple campaigns

21

#RSAC
A GLOBAL CAMPAIGN
22

CRIMINALS' PROFITS

#RSAC
CAMPAIGN 4
~ $ 2,881 USD
24

#RSAC
CAMPAIGN 3
~ $ 4,130 USD
25

#RSAC
CAMPAIGN 2
~ $ 7,670 USD
26

#RSAC
CAMPAIGN 1
~ $ 189,980 USD
27

#RSAC
TOTAL
$ 204,661 USD
In less then two months
28

#RSAC
Why those silent attacks were discovered?

FIGHTING FOR VICTIM'S CPU

#RSAC
· Trying to avoid other applications competing for the CPU, crypto mining campaigns kill consuming processes
· Commonly, the implant script kills other crypto mining on the same host
30

#RSAC
FIGHTING FOR VICTIM'S CPU
31

#RSAC
KILLING COMPETITORS
32

#RSAC
KILLING COMPETITORS
33

#RSAC
KILLING OTHER INSTANCES
34

CUTTING THE WRONG WIRE

#RSAC
CUTTING THE WRONG WIRE
36

#RSAC
KILLING OTHER INSTANCES
37

#RSAC

CUTTING THE WRONG WIRE

· So, the clumsy campaign killed "java" process on victim's machines
· It turns out that Killing "java" on WebLogic servers means killing "WebLogic" process!

38

#RSAC
CUTTING THE WRONG WIRE
WebLogic process shutting down...
39

#RSAC
GETTING COMMUNITY INVOLVED
40

#RSAC
Not long ago, those vulnerabilities were usually exploited to deploy
ransomware or to carry other extorsion attacks
41

#RSAC
Crypto jacking was considered one of the TOP 5 new dangerous
attack techniques for 2018
42

#RSAC
43

WHAT IS HAPPENING NOW?

#RSAC
· A vulnerable WebLogic honeypot maintained by Morphus Labs was targeted thousands of times since Jan/2018
· Additionally to crypto jacking, attackers are deploying backdoors and DDoS Botnets
· Mixed campaigns ­ Ransomware or Crypto jacking depending on victim's resources and attacker privileges
44

#RSAC
WHAT IS HAPPENING NOW?
45

SESSION ID: SEM-M031
THANKS!
RENATO MARINHO
morphuslabs.com @renato_marinho linkedin.com/in/renatomarinho

#RSAC

