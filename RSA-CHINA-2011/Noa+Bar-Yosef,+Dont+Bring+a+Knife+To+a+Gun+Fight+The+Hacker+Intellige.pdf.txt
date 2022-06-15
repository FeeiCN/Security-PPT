Don't Bring A Knife To A Gun Fight: The Hacker Intelligence Initiative
SpeakerNoa Bar-Yosef Job Title: Sr. Security Strategist Company Name: Imperva

Agenda
· The state of application security · Studying hackers
­ Why? Prioritizing defenses ­ How? Methodology
· Analyzing real-life attack traffic
­ Key findings
· Technical Recommendations

Why Data Security?
DATA IS HACKER CURRENCY

The Underground Markets

Website Access Up for Sale

THE CURRENT STATE OF WEB APPLICATION SECURITY

WhiteHat Security Top 10 - 2010
Percentage likelihood of a website having at least one vulnerability sorted by class

Situation Today

# of websites
(estimated: July 2011)

: 357,292,065

# of

x

vulnerabilities : 230

1%

821,771,600
vulnerabilities in active circulation

Situation Today

# of websites
(estimated: July 2011)

: 357,292,065

# of

x

vulnerabilities : 230

But which w1il%l be exploited?

821,771,600
vulnerabilities in active circulation

Studying Hackers
· Focus on actual threats
­ Focus on what hackers want, helping good guys prioritize ­ Technical insight into hacker activity ­ Business trends of hacker activity ­ Future directions of hacker activity
· Eliminate uncertainties
­ Active attack sources ­ Explicit attack vectors ­ Spam content
· Devise new defenses based on real data
­ Reduce guess work

Understanding the Threat Landscape - Methodology
1. Tap into hacker forums
2. Analyze hacker tools and activity
3. Record and monitor hacker activity

What are Hackers Hacking?
PART I: HACKER FORUMS

General Topics

5% 0%
3%

3% 2% 3% 2% 8%
22%

25% 6%
21%

Dates: 2007- 2011

Beginner Hacking
Hacking Tutorials
Website and Forum Hacking Hacking Tools and Programs Proxies and Socks
Electronic and Gadgets

Top 7 Attack Techniques

12% 12%
10%

9%

16%

19%

Dates: July 2010 -July 2011

spam

dos/ddos

22%

SQL Injection

zero-day

shell code

brute-force

HTML Injection

Growth of Discussion Topics by Year

1600 1400 1200 1000
800 600 400 200
0

2010 2009 2008 2007

Dates: 2007- July 2010

Mobile (in)Security

1600 1400 1200 1000
800 600 400 200
0 iPhone
Dates: July 2010-July 2011

Popularity of Mobile Platform (# Threads)
12 Months vs. More than a year ago

Android

Blackberry

Nokia

12 months More than a year ago

Qualitative Analysis

What are Hackers Hacking?
PART II: ATTACK TECHNOLOGIES

Example: SQL Injection Attack Tools

Havij

SQLMap

Attacks from Automated Tools

Low Orbit Ion Cannon

Low Orbit Ion Cannon

Low Orbit Ion Cannon

DDoS 2.0

DDoS 2.0
1 Compromised Server = 3000 PC- Based Bots

What are Hackers Hacking?
PART III: MONITORING TRAFFIC

Lesson #1: Automation is Prevailing

Apps under automated attack: 25,000 attacks per hour.  7 per second

On Average: 27 probes per hour  2 probes per minute

Lesson #1: Automation is Prevailing
· Example: Google Dorks Campaign
80,000

Lesson #1: Automation is Prevailing

Lesson #2: The Unfab Four

Lesson #2A: The Unfab Four
SQL Injection

Lesson #2A: The Unfab Four
SQL Injection

Lesson #2B: The Unfab Four
Remote File Inclusion

Lesson #2B: The Unfab Four
Remote File Inclusion
Analyzing the parameters and source of an RFI attack enhances common signature-based attack detection.

Lesson #2C: The Unfab Four
Directory Traversal

Lesson #2C: The Unfab Four
Directory Traversal

Lesson #2D: The Unfab Four
Cross Site Scripting

Lesson #2D: The Unfab Four
Cross Site Scripting

Lesson #2D: The Unfab Four
Cross Site Scripting ­ Zooming into Search Engine Poisoning
http://HighRankingWebSite+PopularKeywords+XSS
...
http://HighRankingWebSite+PopularKeywords+XSS

Lesson #2D: The Unfab Four
Cross Site Scripting
New Search Engine Indexing Cycle

LulzSec Activity Samples

Lesson #3: Repeating Offenders
· The average number of attacks a single host initiated

10

40

25

RFI

SQL Injection

Directory Traversal

Lesson #3: Repeating Offenders

Attacks from...

10 Sources

29

MITIGATION

Underlying Assumptions...
· If you're online and vulnerable, you will be attacked
· Most organizations must assume a certain amount of infected machines connected to its network
­ It is not about technology it is about human nature

Effective Security (1)
· Deploy security solutions that deter automated attacks
­ Slowing down an attack is most often the best way to make it ineffective
­ Defeating automated browser activity:
· Detecting protocol anomalies even if they are not considered malicious
· Feed the client with bogus information (e.g hidden links)
­ Defeating automated non-browser activity
· Access rate control for individual clients · Detection of non-human behavior (e.g.
CAPTCHA, computational challenges) · Click rate measurements

Effective Security (2)
· Detect known vulnerabilities attack
­ Most attackers are going for the low hanging fruit ­ These may seem obvious common attacks, but RFI
and DT do not even appear in OWASP's top 10 list. ­ Early detection of malicious scans can assist in
mitigating unknown "0 days" vectors included in the scan

Effective Security (3)
· Acquire intelligence on malicious sources and apply it in real time
­ Sort traffic based on reputation ­ Blacklisting of: compromised servers, botnet
Command and Control (C&C) servers, infected devices, active spam sources, crawlers... ­ Whitelisting of: legitimate search engine bots, aggregators ­ Enhances protection against automated attacks ­ Enhances protection against "zero"-day attacks

Effective Security (4)
· Participate in a security community and share data on attacks
­ Some of the attacks' scanning is horizontal across similar applications on the internet.
­ Assists in early detection of automation and blocking of attacks.

Effective Security (5)
· Take into consideration compromised machines within your network
­ More control is required around data sources ­ Identify abusive access patterns using legitimate
privileges

Summary
"Foreknowledge cannot be gotten from ghosts and spirits, cannot be had by analogy, cannot be found out by calculation. It must be obtained from people, people who know the conditions of the enemy"*
*Sun Tzu ­ The art of war

QUESTIONS?

THANK YOU!

