RANDORI'S 2021 ATTACK SURFACE REPORT: THE INTERNET'S MOST TEMPTING TARGETS
Table of Contents
Overview Top Temptation Trends Attacker Temptation, Attackbility, and Why They Are Important Exposed Assets That Have High Temptation Scores
SolarWinds Microsoft IIS 6 Microsoft OWA VPNs RDP Deep Dive on the Six Factors That Drive Attacker Temptation Enumerability Exploitability Criticality Applicability Post-exploitation potential Research potential The Defender's Move The defender's steps to take What to Learn More About Protecting Your Attack Surface? Methodology

2
03 04 06 08 10 10 11 12 13 14 14 15 16 16 17 18 19 20 22 23

RANDORI'S 2021 ATTACK SURFACE REPORT: THE INTERNET'S MOST TEMPTING TARGETS

3

Overview

Organizations struggle to know the number and types of exposed assets they have on the internet. Using Randori's unique dataset of internet-facing assets, we were able to identify some of the most common and attackable targets that entreprises leave exposed online. We used our patent-pending "Target Temptation'' model as a guide for this report highlighting real exposure our team has seen on enterprise attack surfaces. It breaks down the most tempting assets for an attacker to go after, assigning them a unique attacker Temptation Score. Read on to see what assets have high attacker Temptation Score, and what factors go into determining the Tempation Score of a target on your internet-facing attack surface.

RANDORI'S 2021 ATTACK SURFACE REPORT: THE INTERNET'S MOST TEMPTING TARGETS

4

Top Temptation Trends

1 in 15
organizations currently runs a version of SolarWinds that is known to be actively exploited or highly tempting. These versions have an average Temptation Score of 40.

15%
of organizations are running an outdated version of IIS 6, which hasn't been supported by Microsoft for six years. IIS 6 has an average Temptation Score of 37.

38%
of organizations use Cisco's Adaptive Security Appliance (ASA) firewall, which has a history of public vulnerabilities. It has a Temptation Score of 37.

46%
of organizations are running Citrix NetScaler, which has a history of public exploits, and if hacked would give an adversary high privileges. It has a Temptation Score of 33.

3%
of organizations still run older versions of Microsoft Outlook Web Access (OWA) -- versions 15.2.659 or older -- despite the recent Exchange hacks and several known exploits. The average Temptation Score is 38.

25%
More than 25% of organizations have RDP exposed to the internet, which when exposed to the internet, increases the risk for attacks, including ransomware.

RANDORI'S 2021 ATTACK SURFACE REPORT: THE INTERNET'S MOST TEMPTING TARGETS

5

Introduction

Security leaders are seeking out solutions to better secure their attack surfaces. With cloud migration and the work-fromhome boom dramatically increasing the number of exposed assets, existing security strategies, like vulnerability management (VM), can no longer keep up. In fact, more than half of security leaders acknowledge that vulnerability management isn't as effective as it once was. VM provided a way for IT teams to ensure a basic protection against known software vulnerabilities, but last year, more than 18,000 vulnerabilities were discovered, and of those nearly twothirds were given CVE ratings of high or greater. With so many assets now exposed to the internet, it's no wonder CISOs (like yourself) are struggling to know what their teams should prioritize first.
Prioritizing by vulnerability severity is no longer an effective security strategy.

The fact is that complexity is the attacker's friend and the defender's foe.
For every 1,000 assets on an attack surface, there is often only one that's truly interesting to an attacker. Traditional VM solutions surface thousands of issues, adding complexity to an already massive problem.
Enter the emerging market of attack surface management (ASM). Over the past two to three years, ASM emerged as a new way to assess risk and identify assets on an attack surface. Done right, an ASM tool should help you prioritize what to secure first based on attackability, expose shadow IT, identify misconfigurations, and deeply integrate with your other security solutions.

RANDORI'S 2021 ATTACK SURFACE REPORT: THE INTERNET'S MOST TEMPTING TARGETS

6

Attacker Temptation, AttackabilityTM, and Why They Are Important

What Attackers See
What Organizations Knows

CISOs don't need more noise, they need clarity.
CISOs don't need more noise, they need clarity. Coincidentally, the same goes for an attacker. Attackers search for the path of least resistance that will get them to their goal. They must operate within limited budgets, and their technical capabilities have an upper bound -- they are not magicians. Their objective is to find the most attackable assets as quickly as possible. This is where flipping your perspective to not only identify what's exposed on your attack surface, but also what's most likely to be targeted by an attacker, will dramatically improve the efficiency of your team, reduce overall risk, and ensure you're always focused on the highest value assets first.

RANDORI'S 2021 ATTACK SURFACE REPORT: THE INTERNET'S MOST TEMPTING TARGETS

7

Many assume attackers prioritize going after software that has high-severity vulnerabilities. But that's simply not true. Severity of a CVE is just one of many attributes weighed by an attacker to determine its Target Temptation, which is a key component of what determines the attackbilityTM of an asset. The other half of attackabilityTM focuses on the specific business context in which an asset sits.
Attackability looks at both an asset's temptation and the business context of that exposed asset.
TARGET TEMPTATION
+
BUSINESS CONTEXT
=
ATTACKABILITYTM

Let's unpack this further: Let's say you drive a 1990 Honda Civic, and it's widely known that a 1990 Honda Civic is easy to break into -- this would be equivalent to a high attacker Target Temptation. A specific brand, model, and year of car. To get at the attackabilityTM of that Honda Civic, we need to understand the context of where this specific Honda Civic is. Is it on the street or parked in the garage? Is the window cracked or all the way up? A 1990 Honda Civic parked on the street with a cracked window would have a much higher attackability than the Honda Civic in a garage that's locked.
The same principles can be applied to software assets. An older version of Microsoft OWA that is visible on the attack surface and is proudly displaying its version number, will have higher attackability than a version that's not visible and has been previously updated.
As a defender, incorporating Target Temptation into the calculus of determining "what to fix first" will put you one step ahead of the adversary.

RANDORI'S 2021 ATTACK SURFACE REPORT: THE INTERNET'S MOST TEMPTING TARGETS

8

Exposed Assets That Have High Temptation Scores

Our data identified several internet-exposed software within an attacker's reach -- that have a high attacker Temptation Score -- and would be tempting for an attacker to investigate and potentially exploit to obtain sensitive data or use as a pivot to reach an additional attack surface.
At Randori, there are six attributes we assess to determine the attacker Temptation Score of an exposed asset: enumerability, exploitability, criticality, applicability, post-exploitation potential, and research potential. It's the combination of these factors that equal the Temptation Score.
We consider any exposed asset with a score higher than 30 to be high, with the highest ranking assets currently within our corpus reaching an attacker Temptation Score of 55. Skip ahead to the next section, Deep Dive on the Six Factors That Determine Target Temptation, for an in-depth description of each factor, otherwise read on to learn more about the most prevalent exposed assets with high attacker Temptation Scores.

RANDORI'S 2021 ATTACK SURFACE REPORT: THE INTERNET'S MOST TEMPTING TARGETS

9

Factors that Determine an Internet-Exposed Assets "Target Temptation"

Enumerability Exploitability Criticality

How well can an attacker tell what the asset is from the outside? Assets that expose the name, version and configuration details rank high on enumerability.
Is the asset known to have vulnerabilities--publicly known or privately sold? Assets with a history of lots of known public vulnerabilities and/or exploits rank high on exploitability.
How important is the asset to a business? Assets that could give an attacker escalated privileges or higher access rank high on criticality.

Applicability
Post-Exploitation Potential

How widely used is this asset? If exploited, could the attacker reuse the exploit on another target? Software that is widely used accross many different organizations rank high on applicability.
How hospitable will the asset be once exploit? Assets that don't have a lot of security or aren't closely monitored by defenders rank high on post-exploitation potential.

Research Potential

How long will it take, and how hard will it be to exploit?
Assets that are easy to access by an attacker, and have a history of CVEs rank high on research potential.

RANDORI'S 2021 ATTACK SURFACE REPORT: THE INTERNET'S MOST TEMPTING TARGETS

10

WHY IS SOLARWINDS TEMPTING?
Despites all the attention on SolarWinds, one in 15 entreprises appear to be running vulnerable versions of SolarWinds. These versions have an average Temptation Score of 40. It ranks high for three reasons:

They have publicly disclosed 1
vulnerabilities (exploitability)

They are typically a mission2 critical technology for a business
(criticality) and,

They are widely used at many

3

companies around the world, so

one exploit can be used across

many organizations (applicability).

Older versions of SolarWinds (15.2 or older) have several known public weaknesses with known exploits. For example, an exploit for CVE 2021-35211 would provide an attacker with unauthenticated remote code execution --this holy grail of bugs allows an attacker to take over a system remotely.

Even more, attackers know SolarWinds is widely used across thousands of businesses (so one exploit can be reused across many making it highly applicable), and that SolarWinds is typically critical to a business and if compromised could give them higher privileges.
WHY IS MICROSOFT IIS 6 TEMPTING?
Not surprisingly, attackers love old exposed software that is no longer supported. Microsoft' IIS 6 is one such example we often see on the internet.
Based on our data, 15% of companies have at least once instance of IIS 6 exposed online.
For context: Microsoft's IIS version 6 is associated with Windows 2003, and Microsoft stopped supporting it in 2015. In 2015! That means that several organizations are running a piece of software on their perimeter that hasn't been supported for six years, which is super interesting to an attacker. With lots of known public weaknesses and high applicability, IIS 6 is something an attacker would absolutely consider targeting.

RANDORI'S 2021 ATTACK SURFACE REPORT: THE INTERNET'S MOST TEMPTING TARGETS

11

PRO TIP:
Always change the default settings so the version number isn't publicly visible. If you can't patch it or upgrade it, at least hide it.

WHY ARE OLDER VERSIONS OF MICROSOFT OWA TEMPTING?
Microsoft's Outlook Web Access (OWA) is a very widely used solution with lots and lots of publicly known CVEs. Remember the Windows Exchange breach from earlier this year that impacted 30,000 companies? Despite the risks, many companies continue to have OWA exposed to the internet. Several known vulnerabilities can provide attacker's with remote access and are known to be actively exploited.
Another thing: The more an attacker knows about a system, the more tempting it is. One aspect that often drives up OWA temptation scores is the use of default settings that expose detailed version information. Services which expose the name, version, and, better yet, configuration information makes it easier for an attacker to cross-check to see if there are any known public vulnerabilities or exploits weaponized against that specific version and to confirm if an exploit will land.

RANDORI'S 2021 ATTACK SURFACE REPORT: THE INTERNET'S MOST TEMPTING TARGETS

12

WHY ARE VPNS TEMPTING?
There are several reasons why VPNs are tempting to an attacker.

They are known to protect things of value, making them intrinsically interesting. If 1
an attacker exploits this one device, they can reach out to additional devices it was protecting.

They are known to be targets for exploitation. We've seen a host of CVE and known

2

exploits in the wild over the past several years.

They are often unpatched, misconfigured, and not well protected. VPNs aren't always 3
thought of as computers, just as a service, which means administrators rarely return to the VPN to do maintenance or update configurations. And one cannot install any software on a VPN to defend it. Most endpoint security solutions cannot be installed directly into VPN firmware.

Vendor + Product

Temptation Score

Why?

Citrix

33

Netscaler

High exploitability, applicability and criticality
We estimate that nearly 45% of businesses use this product, giving it extremely high applicability. Citrix NetScaler has several high profile known vulnerabilities, many found in 2019, some of which can give a hacker unauthenticated remote access control.

Cisco

37

WebVPN

Exploitability, applicability, and criticality
With 17% of businesses using this product that affords an attacker a lot of access if hacked, it's intriguing to an attacker.

Palo Alto

37

GlobalProtect

Criticality
Palo Alto's VPN, like the others, is widely used (~35% of businesses) and if hacked, would give an attacker extremely broad access, giving it high criticality and applicability.

RANDORI'S 2021 ATTACK SURFACE REPORT: THE INTERNET'S MOST TEMPTING TARGETS

13

WHY IS RDP TEMPTING?

As more organizations shift to remote work, the number of businesses using RDP (remote desktop protocol) goes up as well, and this move does not go unnoticed by attackers. Given the ready availability of stolen credentials on the dark web, an attacker could make a purchase and login to that machine, or an attacker could brute-force user credentials and login to a machine. Keep in mind, companies that add multifactor authentication (MFA), would be safeguarded from that attack method. Once on the machine, an attacker can attempt to escalate privileges and move laterally--or in many cases encrypt the machine to start a ransomware campaign. Many suggest that exposed RDP is the number one attack vector for ransomware, including Wannacry and SamSam. With lots of people using RDP it ranks high for applicability.

RANDORI'S 2021 ATTACK SURFACE REPORT: THE INTERNET'S MOST TEMPTING TARGETS

14

Deep Dive on the Six Factors That Drive Attacker Temptation

As mentioned above, there are six attributes we outline to determine the attacker temptation of an asset: enumerability, exploitability, criticality, applicability, post-exploitation potential, and research potential. It's the combination of these factors that gives us the attacker Temptation Score.
Before an attacker strikes, they will weigh each of these factors to determine what to go after first. If you apply this logic to your own environment, your security strategy will shift, leading you to more efficiencies and lower risk. Let's break them down.

ENUMERABILITY: HOW WELL CAN I TELL WHAT THIS IS?
Probably the most straightforward factor is simply how much a hacker knows about a software from the outside. The more information available, the more confident they will be that their attack will be successful. Enumerability is all about "peeking from the outside." Imagine doing a stakeout on an office building with big clean windows versus one with small tinted windows. The more of a view you have inside, the more confident you are in your ability to see your task through.
Depending on the service and its deployment, a web server target could report anything from no server identifier at all, to the server name alone -- "Apache" to "Apache 2.4.33," or even more detailed values. Much of this is configurable and is an easy way organizations can increase the cost or risk to an attacker. If an attacker can understand the exact version of the service and glean insights into its configuration, they can be precise with the exploits used and attacks run, maximizing the odds of success while reducing the risk a capability is detected and cover blown.

RANDORI'S 2021 ATTACK SURFACE REPORT: THE INTERNET'S MOST TEMPTING TARGETS

15

EXPLOITABILITY: IS THE ASSET KNOWN TO HAVE A FLAW AND THEREFORE EXPLOITABLE?

This is the category people ask about the most, as patching vulnerabilities is the primary focus of many security teams today. While exploitability considers vulnerability weighting criteria (how severe the vulnerability is), it also considers what's required next for the attacker. Don't assume simply because the CVE or CVSS score is high that it's of great interest to an attacker -- this is a common misconception.
Exploitability also takes into account the availability and cost of existing exploits in nonpublic circles. Think Canvas or Zerodium. Often overlooked and depending on a company's threat profile, it's likely they'll use private capabilities (e.g. previously built exploits) in an attack. It happens far more often than many realize.

Distribution of all vulnerabilities by CVSS Scores

CVSS Score 0 - 1 1 - 2 2 - 3 3 - 4 4 - 5 5 - 6 6 - 7 7 - 8 8 - 9 9 - 10 Total

N° of Vulnerabilities 32 54 223 307 1368 1006 1055 1141 46 1180 6412

Percentage 0.50 0.80 3.50 4.80 21.30 15.70 16.50 17.80 0.70 18.40

Weighted Average CVSS Score: 6.8

RANDORI'S 2021 ATTACK SURFACE REPORT: THE INTERNET'S MOST TEMPTING TARGETS

16

CRITICALITY: HOW IMPORTANT IS THE ASSET TO THE BUSINESS?
Criticality is all about the assumed value of the asset in question. Assets that appear to be a security appliance (VPN, firewall, etc.) are of the highest interest to attackers -- if an attacker can break the security function, they've got the keys to the kingdom.
If there is a VPN, firewall, or remote support solutions on your perimeter, an attacker is likely to assume it's protecting something of value and not just a bridge to nowhere. Compromising it not only provides access to the other side of the firewall, but may also result in an ability to collect or manipulate credentials that can be used to advance throughout an environment.
Ignoring the value of an asset to a business could lead to a lot of dead ends or stealing ultimately valueless information after an attacker invested significant time and resources into the endeavor. Hackers definitely don't want that, so worry less about exposed assets which are obviously not protecting something important.
Attackers prioritize developing capabilities useful across multiple endeavors, like the recent Kaseya hack.

APPLICABILITY: IF EXPLOITED HERE, CAN IT BE REUSED?
Remember: Your company is not the only target an attacker has. Attackers of any scope have limited resources -- even adversarial nation-states -- and they'll often prioritize their focus and development of capabilities on platforms likely to be useful across multiple endeavors, like the recent Kaseya hack. They went after a managed service provider with hundreds of clients. For years, Apple devices were touted as being unhackable. But the reality was that since Microsoft controlled so much of the market share, creating exploit windows was far more valuable. Now that Apple controls more of the market share, attackers are finding iOS vulnerabilities far more appealing.
From this logic, an attacker is less likely to invest in vulnerability research for a product used by only a handful of organizations and is of little interest to their mission. (However, there might be other reasons to go after the esoteric program on a target perimeter, such as criticality). The Randori Attack Team has had success exploiting home-grown applications, but at least in this category it would be less of a priority since the investment is likely a one-time sunk cost.

RANDORI'S 2021 ATTACK SURFACE REPORT: THE INTERNET'S MOST TEMPTING TARGETS

17

POST-EXPLOITATION POTENTIAL: HOW HOSPITABLE WILL THE ASSET'S ENVIRONMENT BE TO ME, IF I EXPLOIT IT?

Post-exploitation potential is how likely an attacker can continue their job after cracking an asset. In short, is it a welcoming and hospitable environment in which to travel on through the system? As an adversary, an ideal scenario is to exploit and gain execution in a well-known environment where few defenses exist. An attacker wants their malware and pivoting tools to work without triggering alerts or monitoring.
Endpoints score low in this category. Sure, attackers end up on Windows machines, but they are closely monitored, have well-trained users, and are frequently protected by a slew of endpoint security products.
VPNs, camera systems, and desktop phones make much more appealing targets.

They are unprotected hardware devices which are physically plugged into the network all the time. Many forget a desktop phone is a complete computer with a full range of Linux capabilities, same with VPNs. Manufacturers designed these units to be appliances -- they come pre-manufactured, so network administrators don't install software on them. This makes them juicy, unguarded doorways with only one lock.
Beyond the UI lies a familiar execution environment, more often than not, with a complete userspace and familiar tools preinstalled. This gives these appliances a high post-exploitation potential and contributes to their attractiveness as targets. Other examples of systems that frequently catch security professionals by surprise are phone, VoIP, and print servers.

RANDORI'S 2021 ATTACK SURFACE REPORT: THE INTERNET'S MOST TEMPTING TARGETS

18

RESEARCH POTENTIAL: HOW LONG WILL IT TAKE TO EXPLOIT? (OR HOW HARD IS IT TO EXPLOIT?)
Research potential assesses how easy it is for an attacker to develop capabilities for a particular asset in your environment. Time is money, and barriers to entry can limit the ability and incentive for adversaries to develop capabilities against particular services, tools, or platforms. While security through obscurity should be avoided, vulnerability research can be a significant deterrent for low-skill or low-resourced adversaries.
An expensive and esoteric platform, such as security appliances, or VoIP systems -- anything that comes in a box -- may be of high interest to an adversary due to the value of data stored and level of access required, but it calls for special skills and resources and therefore would be scored low on this specific metric. Quite often there are low-hanging fruit vulnerabilities in expensive appliances, but it's tough to get your hands physically on these costly devices. Whereas a well-documented and open source tool that can easily be obtained and tested would score high on this metric for a broad range of adversaries.
A well-documented and open source tool that can easily be obtained and tested will score high on research potential.

RANDORI'S 2021 ATTACK SURFACE REPORT: THE INTERNET'S MOST TEMPTING TARGETS

19

The Defender's Move

As you can see, there's a bit of an equation that goes into deciding what an attacker will go after on your attack surface. It's not as simple as asking: "How critical is this CVE?" And while there isn't an exact list of attributes an adversary uses to determine what to exploit, the logic above is pretty universal among attackers. Defenders can apply this logic to better defend their attack surface.
Security teams are constantly focused on building a bigger castle to keep out intruders, but hackers don't see walls. All attacker's see is a personal cost of time and effort.
No system will ever be fully secure, but limiting the information attackers can get their hands on out of the gate goes a long way toward taking the wind out of their sails. This means burying the truly crucial information behind so many fail safes that it isn't worth the effort for an attacker. This can mean adding logging/monitoring, WAFs, firewalls, or segmentation to critical assets on an attack surface -- or even taking systems offline that do not need to communicate with the internet. It also means having a solid understanding of what your attack surface looks like and what's most tempting to an attacker -- hence investing in something like attack surface management.
Pairing the impact of an asset getting hit, with the likelihood of an attacker successfully hacking it, will get you closer to building a more resilient program. CISOs who start to think through what's possible for an attacker, will get closer to reducing their attack surfaces. Ideally, they will ask for more fail safes, and focus on the exposed assets that actually matter. Prioritize securing the most valuable resources by keeping them behind layered defenses -- so that it takes multiple individual failures to really do damage. Good ol' fashioned network segmentation and defense and depth will get better results than what you're getting today.

RANDORI'S 2021 ATTACK SURFACE REPORT: THE INTERNET'S MOST TEMPTING TARGETS

20

The Defenders Steps to Take

1

Find an attack surface management partner who can

help you get a handle on what your perimeter looks like,

and gives you the likelihood of attack. Randori offers an

ASM solution that includes Temptation scores, helping

you determine what's most critical to fix first.

Make the assets on your perimeter as opaque as 2
possible. Much of this is configurable and lowering outside visibility is an easy way organizations can increase the cost or risk to an attacker. A good ASM product can also help with this. Its black box discovery can continuously find and identify what's on your perimeter.

Stress test your overall security posture with a red team 3
-- see if they can uncover an easy-to-exploit asset.

Triple secure your important assets. This is where

4

creating a strong DMZ around critical assets is crucial.

Add logging/monitoring, WAFs, a secondary firewall, or

segmentation to any critical asset on an attack surface.

Treat appliances like you might treat any other asset

5

you know is a risk. Appliances and IoT are endpoints too.

Do not settle for the configuration the manufacturer

sets as default. Deploy firewalls, WAFs, logging, and

segmentation on assets your program deems high risk

-- and that should include embedded devices, security

appliances, VoIP phones, etc.

RANDORI'S 2021 ATTACK SURFACE REPORT: THE INTERNET'S MOST TEMPTING TARGETS

21

Picture hardening your attack surface like protecting a medieval castle against a siege. These castles were designed with many layers of security beyond just the outer wall. Sure, they could invest all their effort in making a wall that was 20 feet thick and 1,000 feet high, but there would always need to be ways in and out. Such a design would account for no contingency scenarios. Instead, medieval castles had moats around their walls. They had multiple checkpoints and outer and inner walls. They even designed the city streets to be random and confusing, so that an attacking army would not have a straight shot through to the keep. Then, the castle itself was a fortress unto itself, protecting the royal family and their crown jewels. Beyond the initial wall, these were all elements of their internal attack surface.
Your security posture should look the same way. In order to get to your crown jewels, attackers should have to squeeze past several points of failure within your system. As long as one holds, you have a very high chance of catching and expelling an attacker before any real damage is done.

What to Learn More About Protecting Your Attack Surface?
If you found this report helpful, you may also be interested in securing a free Randori Recon report to discover what's exposed on your attack surface and learn more about
the tempting targets on your perimeter.
CONTACT US FOR A FREE ATTACK SURFACE REVIEW
Other resources you may like include:

2021 Gartner Cool Vendor In Security
Operations
Attack Surface Management (ASM) is foundational to information security programs, check out Gartner's report to learn more about how ASM can help your security program and Randori was
recognized.
DOWNLOAD

SANS Guide to Evaluating Attack Surface Management
ASM is an emerging security category that aims to help organizations address the expanding risk posed by cloud computing and the rapid transition to work from home. Read this guide to learn how to evaluate the effectiveness
of an ASM tool.
DOWNLOAD

Three Steps to Managing Shadow IT Risk
Gartner estimates that a third of successful attacks experienced by enterprises will result from unknown shadow IT risks. Shadow IT isn't a new problem. Learn how to
discover, prioritize, and remediate shadow IT.
DOWNLOAD

WWW.RANDORI.COM

Methodology
The 2021 Randori Attack Surface Report aggregates attack surface data across millions of internet-exposed assets, and applies its patent-pending Target Temptation Engine to determine relative likelihood an asset will be attacked, the Temptation Score. As described above, the Temptation Score applies a proprietary weighting of six different attributes to determine the Temptation Score of an asset. Millions of exposed assets within Randori's unique dataset were analyzed when doing this report during the month of August 2021.
About Randori
Randori attacks to protect. Recognized by Gartner & IDC as a leader in offensive security, the Randori Platform unifies Attack Surface Management (ASM) and Continuous Automated Red Teaming (CART) to provide enterprises the visibility, actionable insights and validation they need to proactively prevent breaches. Customers like VMWare, Greenhill Inc, FirstBank, NOV, Lionbridge and many more, trust the Randori platform, which was designed by the world's foremost offensive security practitioners at nation-state levels. Connect with Randor to discover what's exposed on your attack surface and learn more about the tempting targets on your perimeter.
LEARN MORE

