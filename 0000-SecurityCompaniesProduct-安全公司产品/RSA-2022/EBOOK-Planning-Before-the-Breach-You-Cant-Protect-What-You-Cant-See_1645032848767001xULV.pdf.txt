E-Book
Planning Before the Breach: You Can't Protect What You Can't See
Better Manage Risk to Protect Your Blindspots

exabeam.com

01

Table of Contents

Planning Before the Breach: You Can't Protect What You Can't See

03

Introduction: It's time to change your risk mindset

04

Fight fires or choose proactive security?

The number of ransomware attacks is skyrocketing

05

Some attacks you can see, others you don't see coming

06

Dwell time is still high

The cost of a data breach is steadily increasing

07

Continuous monitoring and response is a starting point

08

The blindspots you need to protect against

Blindspot 1: Compromised User Credentials

09

Blindspot 2: Compromised System/Host/Device Detection

Blindspot 3: Rogue Insiders

10

Blindspot 4: Lateral Movement Detection

Blindspot 5: Service Account Misuse

11

Why legacy SIEM solutions fail

Is there a solution?

12

Exabeam Fusion

About Exabeam

exabeam.com

02

Introduction
It's time to change your risk mindset
It's not news that cybercriminals, nation-states, and malicious insiders are actively targeting organizations for financial gain, to steal secrets and intellectual property, disrupt operations, and harvest personally identifiable information. The style and methods of their attacks are also well known -- in 2020 more than 80% of reported breaches used valid credentials or involved brute force attacks. How can you keep pace? This paper highlights the reality Gartner analyst Peter Firstbrook raised at the 2021 Gartner Security Summit that, the "assume breach mindset" is the only valid mindset for cybersecurity." The "identity is the perimeter" and "zero-trust architecture" strategies are great, but simply not enough to defeat today's adversaries. Keeping pace requires a deeper understanding of the risk in your environment -- behavioral context -- about every user and asset. The data science behind this context, amplifying the rules you already have, arms you with a picture of normal activity, probably the best defense available to avoid being blindsided by an attack. This eBook is a guide for organizations looking to better understand their risk, improve their security detection and response capabilities, and level the playing field against sophisticated adversaries.

exabeam.com

03

Fight fires or choose proactive security?

Adversaries honed their skills during the global COVID-19 crisis, finding a gold mine of opportunities to hack organizations and steal sensitive data. With attacks growing in number and sophistication, organizations are struggling to keep pace. The result? Security teams are overwhelmed by alerts, false positives (and false negatives), and forced to put out fires, versus proactively securing the environment.
Here are some statistics that provide a clearer overview:

The number of ransomware attacks is skyrocketing
According to Statista, there were 304 million ransomware attacks worldwide in 2020. This represents a 62% increase from 2019, although still less than the "ransomware year" of 2016. Ransomware attacks comprise 81% of financially motivated cyberattacks.

Why ransomware is so difficult to defend against:
 Indicators of Compromise (IoCs) are unreliable and cannot be used to identify new and never-before-seen strains of ransomware
 IoCs are ineffective against an attack if it moves laterally or escalates privileges
 The response needs to happen fast and involves different products
 Security teams must often take separate actions in point products, leaving ransomware more time to establish persistence, inhibit system recovery, and encrypt files
 Ransomware exploits existing visibility gaps: misconfigurations or vulnerabilities leave organizations exposed

Figure 01 Ransomware attacks by year (Image Source)

exabeam.com

04

Chapter 1

Planning Before the Breach

Incident checklist

Figure 02 The ransomware checklist prompts analysts to answer specific investigation questions and take containment actions.

Ransomware is just one of the threats where rules and signatures are ineffective and automated risk visibility combined with automation can help seize a breach:
 Analyze file, web, DNS, and endpoint activity, for behavioral anomalies to detect ransomware arriving on or operating from an endpoint
 Detect and investigate attacks from known and unknown strains of ransomware with behavioral analytics and respond with automated response playbooks

 Analyze the composition of any files moving onto a protected machine and, if deemed malicious, block the file from either being copied to the machine or executing
 Protect infrastructure and systems by using behavioral analytics to gain visibility into potential vulnerabilities that could be exploited by ransomware
 Automatically extracts key evidence and links to attach as evidence to a case

Some attacks you can see, others you can't see coming
Regardless of the vendors' claims, there is no perfect answer or cybersecurity technology. A motivated attacker will use any and all tactics, techniques, and procedures (TTPs) at their disposal to reach their objective; they don't always cross an endpoint or email, they can bypassidentity systems and evade traditional antivirus.
The 2021 Microsoft Digital Defense Report revealed they were blocking 31B identity threats and 32B email threats versus 9B endpoint threats (daily). Add to this, the number of malware variants fluctuates every year. In 2020, the number of detected malware variants increased by 62% (Sonic Wall). Identity, email, endpoint protection, and antivirus are key but not enough.
Understanding that one successful attempt is all they need, the modern attacker is motivated and persistent, capable of deploying multiple automated attacks at a target. Employees and trusted third parties can be unwitting accomplices by simply clicking a malicious link or opening a weaponized attachment. These compromised insiders give attackers all they need to carry out their attack.

exabeam.com

05

Chapter 1

Planning Before the Breach

On the other hand, when a disenfranchised employee or contractor goes rogue and helps an attacker for personal gain, the effect can be even more damaging. In either situation, the organization can be caught flat-footed, not understanding the nefarious actions taking place in plain sight -- until it's too late.
Dwell time is still high
To further complicate this picture, dwell time (the time intruders spend in an infiltrated system) is still high. The 2021 Ponemon/IBM Cost of a Data Breach Report stated it took 287 days for organizations to identify a data breach, 7 days longer than last year. The more time the attackers are inside, the more time they have to compromise systems to extract data and disrupt business operations.
Attacks such as ransomware, where the adversary's intent is detection, skew the stats. What's important to consider is attack dwell times vary widely, less with ransomware (with more attacks happening), but extremely high for other attack types (low and slow, targeted data exfiltration, etc.).
287 days of dwell time gives adversaries time to move laterally, change credentials, and wreak havoc inside the network. It also gives them time to adapt by mimicking the tools you use, making it harder to detect them.
The cost of a data breach is steadily increasing
In its Cost of a Data Breach Report, the Ponemon Institute and IBM show that data breaches are as costly as ever. Here are some key findings:

In 2021, the cost of data breaches was the highest since the start of the report. The cost of a data breach reached $4.24 million, up from $3.86 million in 2020.

Cloud Migration impacted cost and containment. Organizations further along in their cloud modernization strategy contained the breach on average 77 days faster than those in the early stage of their modernization journey.

Artificial intelligence applied to security mitigated costs the most. Organizations that deployed automated and security artificial intelligence (AI) solutions spent up to $3.8 million less in remediation from data breaches than organizations without.

Remote work was a big factor in cost increase. Organizations that suffered incidents where remote work was a cause of the breach spent $1 million more to remediate than others where remote work was not a cause of the incident.

Table 01 Factors of the increase of costs of a data breach.

exabeam.com

06

Chapter 1

Planning Before the Breach

Continuous monitoring and response is a starting point
The main factor in managing attacks is how long it takes for the security team to detect and respond to the adversary. Effective incident response requires quickly detecting the attack, investigating, and stopping it. Likewise, while you are rushing to stop the threat, bad actors are trying to advance.

Figure 03 The faster the detection, the better the chances of eradicating the threat.
Most SOC responders spend upwards of 50% of their time on triage and investigation. Effective incident response must include risk-based investigations triggered by behavioral patterns and detections drawn from a baseline of normal activity. The goal -- detect, investigate, and respond to a breach before it makes an impact. For more on incident response, read this blog.

Figure 04 The NIST recommended phases for responding to a cybersecurity incident.
The road to proactive and effective threat detection and response is not exempt from challenges. In the next section, we'll explore the blindspots exploited by different attack types. This is where Exabeam can help when other solutions have few answers.

exabeam.com

07

The 5 blindspots you need to protect against

In addition to the added risks brought on by remote work, and the pace at which cloud adoption is surpassing cloud security, organizations face other threats and adversarial activities that compound the challenge further.
Most legacy tools and practices offer a reactive security approach: collect data from across your organization, run static IoC and correlation rules to generate alerts. This approach is notorious for creating false positives, resulting in slow, inaccurate responses and frustrated analysts. When an attack materializes, the team finds themselves struggling to outpace the attacker. Reactive security is a race against time that cannot be won.
Proactive security detects threats based on risk using automated, machine learning-driven analysis, also known

as behavioral analytics. With a baseline of normal behavior for users and assets and a system that automatically escalates cases of note, security teams can respond more quickly, accurately, and decisively.
Some of the benefits of automated risk visibility:  Faster threat detection and escalation  More efficient alert triage  Streamlined investigations  Increased analyst productivity

In addition to these benefits, here's a list of the top 5 blindspots automated risk visibility can help identify:
Blindspot 1: Compromised User Credentials
User account credentials are keys to legitimate access, and stolen credentials are the number one vector for data breaches, according to the Verizon 2021 Data Breach Investigations Report. When an attacker uses stolen credentials, their behavior appears legitimate; this results in security tools that are driven by rules and correlations defenseless. This blindspot allows the attacker to proceed at will to access sensitive data or internal resources. Clearly, the impact of compromised user credentials can be devastating, which makes this use case mandatory.

exabeam.com

08

Chapter 2

Planning Before the Breach

Blindspot 2: Compromised System/Host/Device Detection
It is very common for attackers to take control of systems, hosts, or devices within an organizational network, and carry out attacks stealthily for months or years. In terms of breach timelines, the average time companies took to detect a data breach was 287 days, according to IBM. This timeline underscores the importance of eliminating this blindspot to detect and stop attacks more quickly. In addressing this use case, the solution should monitor several vectors. It starts with user accounts to identify anomalous activity, servers for detecting deviations from baseline activity, and network devices to monitor traffic over time and detect unusual spikes. In addition, monitoring of non-trusted communication sources, insecure protocols, and anti-virus/malware should be in place to detect disablement or removal, or status of threat updates.
Blindspot 3: Rogue Insiders
While many of the most well-known breaches have been caused by external adversaries, rogue insiders continue to be a major source of sensitive data loss. Top internal actors in reported breaches have included system administrators, contractors, end-users, developers, managers, and executives -- essentially anyone could become a rogue insider. Insider threat detection is a blindspot because "trusted" behavior doesn't set off alerts in most security tools; the rogue insider appears to be a legitimate user. Potential bad actors include the malicious insider, which is a security threat originating from the organization's employees, former employees, contractors, business partners, or associates; and compromised insiders -- when an external bad actor uses legitimate access credentials to carry out an attack.


In terms of breach timelines, the average time
compaIntieisstovoek troydecteoctma dmataobnreach was
287 days, according to IBM.
for attackers to take control of systems, hosts, or devices within an organizational network, and carry out attacks stealthily for months or years. In terms of breach timelines, the average time companies took to detect a data breach was 287 days, according to IBM.

exabeam.com

09

Chapter 1

Planning Before the Breach

Blindspot 4: Lateral Movement Detection
A breach through the most innocuous entry point of an organization's network may quickly become a proverbial finger in the dyke with undetected lateral movement. The process of lateral movement entails systematically moving through a network in search of sensitive data and assets. Perhaps the attack began by compromising a low-level employee's account? Once inside, the attacker probes other assets for vulnerabilities in order to switch accounts, machines, and IP addresses. Opportunity knocks once the attacker secures administrative privileges. Lateral movement is a blindspot because it is extremely difficult to detect by most security tools because the seemingly unrelated events all appear to be normal. Add to this, there's no consistency or predictability to this action, leaving rules defenseless.

Prepackaged content for Exabeam lateral movement use case:

Data Sources

Detection Rule Types MITRE Techniques Investigation Tools

 Asset logon and access
 Authentication and access management
 VPN and zero trust network access
 Network access, analysis, and monitoring
 Endpoint security (EPP/ EDR)
 Operating system logs (e.g. UNIX/LINUX/OSX/ Windows)

 Pass the ticket
 Pass the hash
 Abnormal remote access and RDP activity
 Abnormal network connections and traffic

 T1090: Proxy  T1205: Traffic signaling  T1219: Remote access
software  T1071: Application layer
protocol  T1021: Remote services  T1078: Valid accounts  T1550: Use alternate
authentication material

 Threat hunter saved searches
 Smart Timelines
 Guided investigation checklists

Response Actions
 Contact user/manager/ HR department via email
 Add user or asset to a watchlist
 Block, suspend, or impose restrictions on users involved in the incident
 Rotate credentials/reset password
 Prompting for reauthentication via 2-factor/multi-factor authentication
 Isolate systems

Table 02 How Exabeam supports the lateral movement blindspot. (Image Source)

Blindspot 5: Service Account Misuse
A service account is used in lieu of a normal system account to run specific application services. Typical security tools provide limited or no visibility into service accounts. This limitation is a blindspot because service accounts can often have high privileges -- and are high-value targets for attackers. Service account misuse is detected with behavioral analytics capabilities, automatically identifying service accounts, and flagging any abnormal behavior associated with them.

exabeam.com

10

Why legacy SIEM solutions fail

As the central security operations product for threat detection and incident response, the SIEM is a victim of scope creep. The SIEM was conceived in a world of finite data, and predictable threat monitoring, and could thrive using static correlation rules. Add in organized cybercrime, nation-state actors, big data workloads, cloud applications, remote workers, and compliance reporting, and the SIEM requirements of today barely resemble its initial mission. While legacy SIEM solutions work well against known threats in determined perimeters, they struggle to offer a compelling defense against the 5 blindspots we just covered.
Legacy SIEMs lack an understanding of what normal behavior looks like for users and assets. This is what allows adversaries to gain access, move laterally, and potentially dwell in a network for weeks or months while expanding the attack. Only next-gen products with behavioral analytics can provide deeper visibility, automatically distinguishing different types of behavior and effectively escalating anomalies.

The Exabeam Fusion Platform is modular, enabling you to augment a SIEM with XDR rather than replacing it. Augmentation with Exabeam Fusion XDR allows an organization to improve the detection and response capabilities of their legacy SIEM quickly, leaving time to continue the future path. On the other hand, if a full SIEM replacement is the desired motion, Exabeam Fusion SIEM is your answer. This results in:
 Enhanced threat detection. Exabeam behavioral analytics detects threats based on abnormal behavior by users and entities, whether they are new or previously seen.
 Improved productivity. Exabeam Smart Timelines automate the investigation process, simplifying analysis so the security team gains a comprehensive view, avoiding guesswork, false positives, and manual investigation steps.
 Faster response times. Exabeam's outcomesbased approach and automation of threat detection and incident response processes allow organizations to do deeper investigations and respond to threats more quickly.

exabeam.com

11

Exabeam Fusion SIEM and XDR
As the leading Next-gen SIEM and XDR, Exabeam Fusion provides a cloud-delivered solution for threat detection and response. Exabeam Fusion SIEM and XDR combine behavioral analytics and automation with threat-centric, use case packages focused on delivering outcomes. Exabeam Fusion products are modular, we can augment your legacy data lake or SIEM deployment with XDR, or replace your SIEM entirely. It's your call. To learn more about how Exabeam Fusion SIEM or XDR can help you Seize the Breach, request a demo today.

About Exabeam
Exabeam is a global cybersecurity leader that adds intelligence to every IT and security stack. We are reinventing the way security teams use analytics and automation to solve threat detection and incident response (TDIR), from common security threats to the most critical ones that are difficult to identify. The Exabeam Security Operations Platform is a comprehensive cloud-delivered

solution that leverages machine learning and automation using a prescriptive, outcomes-based approach to TDIR. It is designed and built to help security teams detect external threats, compromised users and malicious adversaries, minimize false positives, and make security success the norm.
For more information, visit exabeam.com

exabeam.com

12

