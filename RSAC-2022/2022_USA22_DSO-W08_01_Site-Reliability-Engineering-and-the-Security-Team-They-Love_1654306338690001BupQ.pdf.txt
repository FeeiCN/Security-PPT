#RSAC

SESSION ID: DSO-W08
Site Reliability Engineering and the Security Team They Love

Aaron Rinehart
CTO & Co-Founder Verica.io
@aaronrinehart

James Wickett
Head of Research Verica.io @wickett

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA® Conference, RSA Security LLC or any other co-sponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Security LLC or its affiliates. All rights reserved. RSA Conference logo, RSA and other trademarks are trademarks of RSA Security LLC or its affiliates.
2

#RSAC
Aaron Rinehart, CTO, Co-Founder
 Former Chief Security Architect @UnitedHealth
 Former DoD, NASA Safety & Reliability Engineering
 Frequent speaker and author on Chaos Engineering & Security
 O'Reilly Author: Chaos Engineering, Security Chaos Engineering Books
 Pioneer behind Security Chaos Engineering  Led ChaoSlingr team at UnitedHealth
@aaronrinehart

#RSAC
James Wickett (@wickett)
 Head of Research at Verica  LinkedIn Learning Instructor  Former Signal Sciences, Mentor Graphics, National
Instruments, IBM  Austin, TX  Plans a lot of conferences...
@wickett

#RSAC

#RSAC
SRE & Security Hot Takes
These are NOT the Droids You Are Looking for

Observability != Root Cause Is A

Monitoring

Fallacy

Chaos Engineering = Fixing NOT Breaking

Resilience != BCP/DR

Complexity CANNOT Be Simplified Away

DevOps IS NOT SRE

SRE IS NOT DevOps

The "S" in Security & SRE is Silent

Favor Context OVER Control

Complexity != Enemy of Security
Humans ARE NOT the Problem

Security Chaos Engineering != Penetration Testing

Guardrails = Incident Handcuffs

Understandability IS MORE IMPORTANT Simplicity

Humans ARE the Solution

#RSAC
The Situation Isn't Improving

#RSAC
Why is this? What
are we doing wrong?

#RSAC

Software ONLY Increases in

Complexity

y  f(x)

Complexity

 # of Software Changes
Change(x) Complexity(y)

Complex Systems #RSAC
"Our systems have evolved beyond our human ability to mentally model their behavior."
10

#RSAC
Speed, Scale, & Complexity of Modern Software is Challenging
11

#RSAC
Where does it come from?

Continuous Distributed Delivery Systems

Microservice Architectures

Blue/Green

Deployments Containers

Automation Pipelines

Infracode ImmutablDeevOps Infrastructur

Continuous Integration

Auto Scaling CI/CD

e
Service Mesh
Circuit Breaker

Auto Canaries API

Cloud Computing

Patterns

12

Safety Margin in Complex Systems

Naive Zone
Copied from previous simple systems

Safe Zone
System verification through experimentation

Bureaucratic Zone
Guardrails & controls inhibit resilience

#RSAC

System Safety

Software Engineering
13

#RSAC
Site Reliability Engineering (SRE)

#RSAC
This IS SRE defined
SRE is an organizational model for running reliable online services by teams that are chartered to do reliability-focused engineering work.
As a discipline, SREs are devoted to helping an organization sustainably achieve the appropriate level of reliability for its services by implementing and continually improving data-informed production feedback loops to balance availability, performance, and agility.

#RSAC
The Success in Security & SRE is Silent

#RSAC
Security & Reliability
Are NOT Default Properties
of a System

#RSAC
They Are Human Constructed

#RSAC
No system is Perfectly Secure or Reliable

#RSAC
We need failure to Learn & Grow
20

#RSAC
SRE and Security Share
Common Struggles

#RSAC
Security & Reliability Design Tension Doing "It" Later

#RSAC

Doing it "Later"

The SRE & Security "LATERGATOR"

The tendency for engineering teams to spend a lot of time deferring reliability and security design concerns to later points in the future. Usually justified for the sake of velocity and introducing potential delays into the release cycle.

#RSAC
There are many Tradeoffs Under
Pressure

#RSAC

#RSAC

#RSAC
27

#RSAC
Shallow Incident Data
If Grapes were described like computer outage post mortems..........
This bunch of grapes is 5.6 inches across at its widest point. The mean diameter of these grapes is 0.73 inches. The median color is 195/211/86 (RGB).
Reference: https://www.adaptivecapacitylabs.com/blog/2018/03/23/moving-past-shallow-incident-data/

#RSAC
Shallow incident data provides very little insight that can be used to understand critical elements of the story..........
How do they taste?
Reference: https://www.adaptivecapacitylabs.com/blog/2018/03/23/moving-past-shallow-incident-data/

#RSAC
About the VOID
The Verica Open Incident Database (VOID) makes public software-related incident reports available to everyone, raising awareness and increasing understanding of software-based failures in order to make the internet a more resilient and safe place.
1,856 public incident reports from 610 organizations

#RSAC
WHY WE NEED THE VOID

Accelerated Growth of Complex Systems

Incongruent Methods and "Best" Practices

People Seen As External Problems

#RSAC
Distribution of Duration Data in the VOID
32

#RSAC
But,Longer Incidents Are Worse, Right?
33

#RSAC
Security Observability

#RSAC
Teamwork Patterns: The Do's

#RSAC
Context over Control

#RSAC
Learn to Communicate Effectively During Good
Times if you Wish to Communicate Effectively
During the Bad

#RSAC
Shared Observability

SRE
 Logs  Metrics  Tracing  APM  Testing

All Possible System Observability Data
Sources

VestibulSuRmE conOgbuseervability
Data

VSeesctuirbituylum
Obcsoenrgvaubeility
Data

Security
 Logs  Metrics  Threat
Intelligence  Firewall Logs  Security
Scans

#RSAC
Teamwork Anti-Patterns: The Dont's

#RSAC

Everyday Life
SRE & Security Anti-Patterns

 Users shouldn't notice an outage before you do.
 Engineer solution to eliminate classes of errors rather than being satisfied with point fixes.
 Don't feed the machine with human toil.
 Failure is an opportunity to improve, not brandish pitchforks.

Referenced from ADDO Session by Jennifer Petoff, Google Director of SRE Education on Everyday Life SRE Anti-Patterns

#RSAC
Root Cause is a Fallacy

#RSAC
Security Quick Fixes:
A Double Edged Sword

#RSAC
The Blame, Name, & Shame Game

Poorly Documented Incidents

#RSAC
"The easiest way to remove motivation is to put paperwork in front of it."
- Casey Rosenthal

#RSAC
Tools & Techniques: What Works

#RSAC
Evolution to Continuous Verification

Continuous Integration

Continuous Delivery

Continuous Verification

Business Value

2000

2010

Features Faster

Delivered Faster

2020

2030

Without Breaking

47

How to grow Continuous Verification

Equip leaders to make decisions about complex systems

Business Outcomes

Verify infrequent code paths and properties of the system

Application

Learn how infrastructure impacts customer experience

Infrastructure

#RSAC

48

#RSAC
Paved Path for Devs with No Cloud Security "Surprises"
https://github.com/prowler-cloud/prowler
49

#RSAC
https://www.thevoid.community/report
50

#RSAC
A New Approach from the VOID
1. Treat Incidents as Opportunities to Learn 2. Favor In-depth Analysis Over Shallow Metrics 3. Treat Humans as Solutions, Not Problems 4. Study What Goes Right Along With What Goes Wrong
51

#RSAC
Measure Impact and Reaction instead of MTTR
52

#RSAC
Contributing Factor Investigation instead of Root Cause Analysis
53

#RSAC
Apply What You Have Learned Today
· Next week you should:
­ Find out if you have an Site Reliability Engineering function at your organization
· In the first three months following this presentation you should:
­ Understand the role of SRE in your organization ­ Seek to understand how Security can work to improve SRE and Vice Versa
· Within six months you should:
­ Begin implementing changes to improve common SRE & Security problem ares such as shallow incident data, poorly documented incidents, shared observability and improved incident management practices.
­ Begin exploring the adoption of some of the SRE & Security techniques in this presentation such as Blameless Postmortems, Chaos Engineering and Decision Trees
­
54

#RSAC
SRE & Security Hot Takes
These are NOT the Droids You Are Looking for

Observability != Root Cause Is A

Monitoring

Fallacy

Chaos Engineering = Fixing NOT Breaking

Resilience != BCP/DR

Complexity CANNOT Be Simplified Away

DevOps IS NOT SRE

SRE IS NOT DevOps

The "S" in Security & SRE is Silent

Favor Context OVER Control

Complexity != Enemy of Security
Humans ARE NOT the Problem

Security Chaos Engineering != Penetration Testing

Guardrails = Incident Handcuffs

Understandability IS MORE IMPORTANT Simplicity

Humans ARE the Solution

#RSAC
Q&A

#RSAC
Thank You!
Stop looking for better answers and start asking better questions.
- John Allspaw

#RSAC
SECURITY
CHAOS
ENGINEERING

#RSAC
An Open Source Tool
59

Firewall?
Misconfigured Port Injection

#RSAC

Config Log Mgmt? data?

Alert SOC?

IR Triage

Wait...

Hypothesis: If someone accidentally or maliciously introduced a misconfigured port then we would immediately detect, block, and alert on the event.

