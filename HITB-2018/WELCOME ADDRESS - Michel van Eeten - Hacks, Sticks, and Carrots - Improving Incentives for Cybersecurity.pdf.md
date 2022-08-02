Hacks, Sticks and Carrots Improving the Incentives for Cybersecurity
Michel van Eeten
1

2

It's about economics, stupid
· Patching breaks things. Study at major network operator found that leading cause of outages was: patching.
· Over 20k vulnerabilities reported in 2017. Most are never exploited. CVSS critical score tells you nothing.
3

I. Measuring and Hacking Incentives
4

Team Economics of Cybersecurity @ TU Delft
5

SYSTEMS
incident and vuln.
data

ACTORS
6

II. Peer Pressure
7

· Infection rates of ISPs of same size differ in order of magnitude, even in same market, so same regulatory framework and price competition
8

Benchmarks as an incentive
9

III. Reputation Effects
10

11

"Netherlands Clean"
· Map abuse data* to NL hosting providers
* StopBadware, Shadowserver Compromised Website, Shadowserver Sandbox URL, Zeustracker C&Cs, MLAT requests, Dutch Child Pornography Hotline, PhishTank, Anti-Phishing Working Group, PSBL, private spam trap
· Control for attack surface of providers · Rank!
12

Abuse in hosting providers
13

14

Top 10 worst providers, before and after police intervention
15

Scaling up!

· Security benchmark for global hosting market (~40k providers)

· Highly predictive of number of compromised sites (up to 99% EV)

· Collaboration with NL hosting sector to incentive providers by sharing benchmark

> Enforcing escalating self-commitment

16

IV. Liability ("Polluter Pays Principle")
17

18

19

V. Intermediary Liability ("Duty to Care")
20

Who operates the networks?
· NL ISPs and AbuseHub, clearinghouse of abuse data, will help clean up IoT
1.00

Ratio of Unique IP addresses per day

0.75
as_type
edu hosting 0.50 isp-broadband isp-mobile isp-other
0.25

0.00 01-2016

02-2016

03-2016

04-2016

05-2016

23

VI. Social Norms
24

`Doing the right thing'
· Abuse reporting of malicious sites: voluntary clean up by providers
25

`Doing the right thing'
· The question is not: why aren't some providers
adopting anti-spoofing measures (BCP38)? The question is: why would anyone adopt it at all? · BCP38 is a cost to the provider, while all benefits go to the rest of the Internet · Remarkably, lot of providers are compliant. Why? Social norms within provider community (M3AAWG, NANOG, etc)
Source: https://www.caida.org/projects/spoofer/
26

VI. Certification and Standards
27

> Leveraging CE certification to stop
crapware at the EU border
28

IV. Conclusions
29

Hacking the Incentives

 Peer pressure
(benchmark, nudging)
 Reputation effects
(name, shame, and praise)
 Liability
(make vendors bare the cost)

 Intermediary liability
(duty to care, ask ISPs and hosters to cut off access)
 Social norms
(community action)
 Certification and standards
(block market access)

30

Thank you! More info: m.j.g.vaneeten@tudelft.nl
31

More info on underlying studies

·

Noroozian, A., Ciere, M., Korczynski, M., Tajalizadehkhoob, S. & van Eeten, M. 2017. Inferring the Security Performance of Providers from Noisy and Heterogenous Abuse

Datasets, Workshop on the Economics of Information Security.

·

Tajalizadehkhoob, S., Van Goethem, T., Korczynski, M., Noroozian, A., Böhme, R., Moore, T., Joosen, W. & van Eeten, M. 2017, Herding Vulnerable Cats: A Statistical Approach to

Disentangle Joint Responsibility for Web Security in Shared Hosting In: ACM Conference on Computer and Communications Security (CCS).

·

M. Korczynski, S. Tajalizadehkhoob, A. Noroozian, M. Wullink, C. Hesselman, and M. van Eeten, "Reputation Metrics Design to Improve Intermediary Incentives for Security of

TLDs", IEEE European Symposium on Security and Privacy (Euro S&P 2017), April 2017

·

Tajalizadehkhoob, S., Böhme, R., Gañán, C., Korczyski, M., & Van Eeten, M. (2017). Rotten Apples or Bad Harvest? What We Are Measuring When We Are Measuring Abuse. ACM

TOIT

·

Tajalizadehkhoob, S., Gañán, C., Noroozian, A., & Van Eeten, M. (2017). The Role of Hosting Providers in Fighting Command and Control Infrastructure of Financial Malware. In 12th

ACM Asia Symposium on Computer and Communications Security (AsiaCCS 2017), Abu Dhabi, April 3-8, 2017.

·

Jhaveri, M. H., Cetin, O., Gañán, C., Moore, T., & Eeten, M. V. (2017). Abuse Reporting and the Fight Against Cybercrime. ACM Computing Surveys (CSUR), 49(4), 68.

·

Lone, Q., Luckie, M., Korczyski, M., & van Eeten, M. (2017). Using Loops Observed in Traceroute to Infer the Ability to Spoof. In International Conference on Passive and Active

Network Measurement (pp. 229-241). Springer.

·

van Eeten, M., Lone, Q., Moura, G., Asghari, H., & Korczyski, M. (2016). Evaluating the Impact of AbuseHUB on Botnet Mitigation. arXiv preprint arXiv:1612.03101.

·

Tajalizadehkhoob, Samaneh, Maciej Korczynski, Arman Noroozian, Carlos Gañán, and Michel van Eeten. "Apples, Oranges and Hosting Providers: Heterogeneity and Security in the

Hosting Market." In IEEE Network Operations and Management Symposium (IEEE-NOMS 2016), Istanbul, 25-29 April 2016

·

Asghari, Hadi, Michel JG van Eeten, and Johannes M. Bauer. "Economics of Fighting Botnets: Lessons from a Decade of Mitigation." In IEEE Security & Privacy 5, 16-23, 2015.

·

Noroozian, Arman, Maciej Korczynski, Samaneh TajalizadehKhoob, and Michel van Eeten. "Developing security reputation metrics for hosting providers." In Proceedings of the 8th

USENIX Conference on Cyber Security Experimentation and Test, pp. 5-5. USENIX Association, 2015.

·

Asghari, Hadi, Michael Ciere, and Michel JG Van Eeten. "Post-mortem of a zombie: conficker cleanup after six years." In 24th USENIX Security Symposium (USENIX Security 15),

Washington DC. 2015.

32

