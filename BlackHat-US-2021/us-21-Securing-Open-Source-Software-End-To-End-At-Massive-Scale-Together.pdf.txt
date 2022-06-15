@enjenneer @SecurityCRob
Securing Open Source Software End-to-end, At massive scale, Together
Jennifer Fernick - SVP & Global Head of Research, NCC Group Christopher Robinson (aka CRob) - Director of Security Communications, Intel
August 5 2021
#BHUSA @BlackHatEvents

In this talk:
 About us  Lessons learned from the last 20 years of coordinating OSS vulnerability disclosure  Why securing the open source ecosystem matters  Securing OSS at scale has several unique challenges  Threat modelling the open source ecosystem  Why the insecurity of the open source ecosystem is accelerating  Reducing vulns at scale / what actually helps / coordinated approach / OpenSSF  Q&A
#BHUSA @BlackHatEvents

[us@bh.usa ~]$ ./HelloWorld.sh

Jennifer Fernick

CRob, n, adj, and v

 SVP & Global Head of Research at NCC Group  Co-founding Governing Board/TAC member for the
Open Source Security Foundation  Prev: Cryptographer (quantum cryptanalysis,
post-quantum cryptography, cryptographic standards development, cryptographic architecture)  Prev: Director of Information Security at a major FI  Grad school: CS; Engineering (Waterloo); undergrad: Artificial Intelligence (Toronto)

 Pronunciation: U.S. (K-robe)  Over 25 years of Enterprise-class Architecture,
Engineering, Operations, and Security experience  Ambassador For Intel Product Assurance and Security  Working Group lead for the OpenSSF Dev Best
Practices & Vuln Coordination WGs, FIRST PSIRT TPC WG, and others  Co-Author FIRST PSIRT Services Framework & others  Pirate-enthusiast & hat-owner

#BHUSA @BlackHatEvents
The thoughts and feels expressed here are personally held or experientially earned, and not necessarily those of our employers

openssf.org
#BHUSA @BlackHatEvents

Imagine a World....

"He emailed me and said he wanted to maintain the module, so I gave it to him," developer Dominic Tarr wrote in a GitHub comment. "I don't get anything from maintaining this module, and I don't even use it anymore, and haven't for years."

11/26/2018 - Ars Technica - Widely used open source software contained bitcoin-stealing backdoor

https://images.unsplash.com/photo-1567427018141-0584cfcbf1b8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80 https://images.unsplash.com/photo-1586769852351-8791d2bb43be?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80 https://images.unsplash.com/photo-1586282023617-b844c180eb51?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80 https://images.unsplash.com/photo-1497465541860-77f114a519d2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80 https://images.unsplash.com/photo-1584677123777-742161156eb7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80 https://images.unsplash.com/photo-1612251485013-58be9e5689c3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1053&q=80 https://images.unsplash.com/photo-1505373877841-8d25f7d46678?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80

#BHUSA @BlackHatEvents

CVE-2014-0160

https://heartbleed.com/
Vulnerability in popular open source library OpenSSL that could leak sensitive information otherwise thought protected by SSL/TLS encryption
This is a widely-used method to protect communications over TCP-IP-based networks (example - The Internet)

"At the time of disclosure, some 17% (around half a million) of the Internet's secure web
servers certified by trusted authorities were believed to be vulnerable to the attack, allowing theft of the servers' private keys and users' session cookies and passwords" (7)
Public disclosure - 7 April 2014 Exposure -
 21 June 2014 - 309,197 public web servers remained vulnerable (8)  6 July 2017, the number had dropped to 144,000 (9)  11 July 2019, 91,063 devices were vulnerable (10)

(7) - Heartbleed (8) - 300k vulnerable to Heartbleed two months later (9) - Heartbleed's Heartburn: Why a 5 year Old Vulnerability Continues to Bite (10) - Heartbleed Report

At the time, OpenSSL had TWO full-time developers to develop, maintain, test, and review 500,000 lines of code (7) #BHUSA @BlackHatEvents

Why does securing the open source ecosystem matter?
The Security of OSS = The Security of EVERYTHING
#BHUSA @BlackHatEvents

Problem Overview - Securing the open source ecosystem

 It has been estimated that FOSS constitutes 80-90% of any given piece of modern software (1)
 One report found that 84% of these codebases had at least
one vulnerability, with the average having 158 per codebase
(2)

 Other reports discover that average applications contain 118 libraries with roughly  being active; The average library age was 2.6 years old (3)
 Over a 10 year period the volume of vulns has increased over 4 times [as measured with CVE] (4)
 Most OSS vulns are discovered in indirect dependencies (5)  A typical vuln can go undetected for 218 weeks, and
typically takes 4 weeks to get resolved once the project is alerted to it (6)
(1) - State of the Software Supply Chain (2) - 2021 Open Source Security and Risk Analysis Report (3) - 2021 State of Open Source Security Report (4) - 2020 Red Hat Risk Report (5) - 2020 State of Open Source Security Report (6) - 2020 State of the Octoverse

Image - %Rely on OSS

#BHUSA @BlackHatEvents

Challenges of Securing Open Source Software at Scale
#BHUSA @BlackHatEvents

What makes OSS a unique target for adversaries?
Many of the best things about open source development invite unique security challenges:  Deobfuscated and public-facing source code lowers attacker barrier to entry  Distributed community-driven development with contributions from unknown third-parties  Tragedy of the commons regarding security analysis  Lack of consistently-deployed security standards, reviews and tooling  (Often) decreased capacity for vulnerability remediation  Lack of resources for monitoring & typical underpreparedness for incident response  Different economic incentives & feedback loops than: enterprise devs; threat actors  In spite of this: many high-value targets, foundational to enterprises and the internet itself
#BHUSA @BlackHatEvents

OSS security is about more than just vulnerabilities in source code

Source: Backstabber's Knife Collection: A Review of Open Source Software Supply Chain Attacks (2020)

#BHUSA @BlackHatEvents

Vulnerabilities in the Open Source Ecosystem
#BHUSA @BlackHatEvents

Open source security keeps getting worse & it's no one's fault, but it's everyone's problem
 Years to detect: A typical vulnerability on GitHub goes undetected for over 4 years (>2.5y for critical)
 Mere days to exploit: Days between vulnerability disclosure and exploit creation has gone from 45 days to 3
 Devs are not getting better at secure coding: "A line of code written in 2020 is just as likely to introduce a security vulnerability as one written in 2016" - GitHub
 Applications are increasing in complexity & transitive dependency risk seems to be growing

#BHUSA @BlackHatEvents

Source: RAND Corporation, "Zero Days, Thousands of Nights" g

Source: Github State of the Octoverse 2019

Vulns in your code

Vulns in your code's code

Open source projects have an average of 180 package dependencies
The top 50 OSS projects with the most downstream dependencies had an average of 3.6 million projects dependent upon them
Vulns in OSS have been central to major breaches and some of these vulns were not found until decades after their creation

The number of vulnerabilities "in the wild" outpaces the speed at which the security community can patch or even identify them.
And each day, the world contains more lines of source code than it ever has before

Source: Github State of the Octoverse 2020

Source: Github State of the Octoverse 2020

Source: Whitesource State of Open Source Security 2021

Every year, more lines of

Vulnerabilities seem to scale

+ = OSS are written than ever
before, but vuln detection

with lines of code - but other metrics besides LOC show

lags years behind

similar patterns

The number of reported
vulnerabilities in open
source codebases is
growing each year
#BHUSA @BlackHatEvents

The creation of potentially exploitable vulnerabilities increasingly outpaces the rate at which we can search for and remediate them, and this problem is one that only gets worse with time.
Security as it is practiced now does not scale. And we have reasons to believe this will only get worse for defenders.

Uncomfortable truth: Scalable vuln-finding helps adversaries, too

Economics of patching vs exploitation benefit
threat actors over

Innovations in program analysis

Advancements in automated exploit
generation

defenders
Threat actors

Large-scale fuzzing projects; vuln
discovery query languages

Machine learning advancements in generative language,
including code

don't care about

Increased transitive

CFAA

dependencies over

time in OSS projects

Decreasing time to

exploitation of vulns

in the wild

Threat actors don't need

multi stakeholder

Dual use nature of scalable bug hunting methods can benefit defenders - or attackers

coordination

#BHUSA @BlackHatEvents

So how do we reduce vulnerabilities at scale?

#BHUSA @BlackHatEvents

How do we reduce vulnerabilities at scale?

PREVENT
 Prevent classes of bugs from being possible at all
 Threat model to understand systemic architectural security risks & design with security in mind
 Concentrate resources on securing the most critical libraries, components, and projects

FIND
 Integrate security tooling into your build pipeline (Static analysis, Fuzzing, etc)
 Perform enhanced testing (manual code review, third-party security audit, formal verification) for priority codebases

DETECT
 Improve coordinated vulnerability disclosure
 Software Bill of Materials, security advisories, and CVE improvements
#BHUSA @BlackHatEvents

What ACTUALLY helps secure OSS

"Groundbreaking" idea
"If you use software from a project, maybe you could contribute back to that project?"
- A very wise person

Image - Blown Cat

#BHUSA @BlackHatEvents

What is needed to make open source more secure?
 Threat model to understand the many places & times at which a project can be compromised.  Data-driven identification of the world's most critical open source projects  Interventions to prevent vulnerabilities in the first place, introduced at various parts of SDLC  Preventing inherited security debt through tools that can help developers obtain and users
assess the security of a project (such as the CII Best Practices badge)  Continued research and open source tool development for scalable bug-hunting & remediation  Investments in technical security reviews of critical open source projects,  Coordinated patching and incident response support to respond to high-impact
vulnerabilities in OSS  Better vulnerability disclosure processes, response, and workflows.  Coordinated, impact-prioritized funding for security improvements, audits, and research
#BHUSA @BlackHatEvents

Timeline: Historical coordination toward securing OSS
#BHUSA @BlackHatEvents

COORDINATED APPROACH - WHY AND HOW

Image - Eek!

#BHUSA @BlackHatEvents

OPENSSF* Reference Architecture
(* The Open Source Security Foundation if you're nasty)
Image - Miss Jackson

#BHUSA @BlackHatEvents

openssf.org/getinvolved github.com/ossf
#BHUSA @BlackHatEvents

Thank you!
openssf.org/getinvolved github.com/ossf
@enjenneer @SecurityCRob

#BHUSA @BlackHatEvents

