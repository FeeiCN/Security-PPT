SESSION ID: ASD-W03
Security Precognition: Chaos Engineering in Incident Response

Aaron Rinehart
Chief Technology Officer Verica.io @aaronrinehart

Kyle Erickson
Director of IoT Security Medtronic

#RSAC

#RSAC
"Resilience is the story of the outage that never happened."
- John Allspaw
@aaronrinehart

#RSAC
Security PreCognition

#RSAC
About A.A.Ron
 CTO of Stealthy Startup in Chaos Engineering
 Former Chief Security Architect @UnitedHealth responsible for strategy
 Led the DevOps and Open Source Transformation at UnitedHealth Group
 Extensive enterprise experience (DOD, NASA, DHS, CollegeBoard )
 Frequent speaker and author on Chaos Engineering & Security
 Pioneer behind Security Chaos Engineering  Led ChaoSlingr team at UnitedHealth
4

#RSAC
About Kyle E>
 Cybersecurity Director of IOT Security @ Largest Medical Device Company in the World
 Former Director of Security Incident Response @UnitedHealth
 Former Director of Cloud and Application Security Engineering @Optum
 Startup and enterprise experience as an engineer and leader
 Build and break all the things!  Wannabe financial analyst  Baseball stadium aficionado
5

In this Session we will cover #RSAC

Takeaways

#RSAC

Problems with Complex Adaptive Systems

Takeaways

#RSAC

Problems with Complex Adaptive Systems
Security Chaos Engineering

Takeaways

#RSAC

Problems with Complex Adaptive Systems
Security Chaos Engineering How it works: Security IR Use Case

#RSAC
Our systems have evolved beyond human ability to mentally model their behavior.
10

A Complex Dynamic Problem #RSAC

#RSAC
Evolution of Modern Architecture

Monolith

Microservices

Functions

#RSAC
Complex?

Continuous Distributed Delivery Systems

Microservice Architectures

Blue/Green Deployments

ContainersDevOpAsutomatioCInnoPtinepetgliirnnaeustoiouns

Immutable Infracode Infrastructure CI/CD
Service Mesh

Cloud Computing

Circuit Breaker Patterns

API Auto Canaries

13

Security? Mostly Monolithic

Expert Systems

#RSAC
Stateful in nature

Prevention focused Defense in Depth

Poorly Aligned Requires Domain Knowledge

Adversary Focused
DevSecOps not widely adopted

14

#RSAC
Simplicity?

#RSAC

Complexity

How well do you really

#RSAC

understand how your system

works?

Stella Report

#RSAC

System Mental Model

#RSAC

#RSAC
So what does all of this have to do with Security?

#RSAC
Failure Happens.

#RSAC
Security Incidents & System Outages are Costly

#RSAC
Security Incidents are Subjective in
Nature

#RSAC
We really don't know very much

Where? Why? Who?

How?

What?

#RSAC
Let's face it, when outages happen.....

#RSAC
Teams spend too much time reacting to outages instead of building more resilient systems.

Unexpected application behavior often causes people to intervene and make the situation worse

#RSAC

I wonder why it did that?
Let's reboot it.

Whoops!
Now it's really hosed

#RSAC
"Response" is the problem with Incident Response

#RSAC
Ring Ring!

#RSAC
Conditioned?

#RSAC
War Rooms

#RSAC
True Cost

#RSAC
IR Success

#RSAC
"Chaos Engineering is the discipline of experimenting on a distributed system in order to build confidence in the system's ability to withstand turbulent conditions"

#RSAC
Who is doing Chaos?

#RSAC
Security
Engineering

#RSAC
People Operate Differently when they expect things to fail

#RSAC

#RSAC

#RSAC
The Normal Condition of a Human & Systems they Build
Fail is to

#RSAC
We need failure to learn &
Grow
46

#RSAC
Let's Flip the Model
Post Mortem = Preparation

#RSAC
Create Order through Chaos

#RSAC
Use Chaos Engineering
to initiate Objective Feedback Loops
about Security Effectiveness

#RSAC

Proactively Manage &

Measure

Validate Runbooks Measure Team Skills Determine Control Effectiveness Learn new insights into system behavior Transfer knowledge Build a learning culture

#RSAC
Testing vs. Experimentation

#RSAC
Security Crayon Differences
Noisy distributed system behavior Not geared for Cascading Events Point-in-time even if Automated Performed by Security Teams with Specialized skill sets

#RSAC
Security Chaos Differences
Distributed Systems Focus Goal: Experimentation Human Factors focused Small Isolated Scope Focus on Cascading Events Performed by Mixed Engineering Teams in Gameday During business hours

#RSAC
2018 Causes of Data Breaches

#RSAC
Proactively Manage & Measure

#RSAC

Incidents vs. Chaos

Uncontrolled

Controlled

Unpredictable

Scheduled

Time to Detect: Minutes

0 Time to Detect

Time to Resolve: ???? Analysis Time: ????

Time to Resolve: seconds
Root Cause Analysis: Intentional

#RSAC
Continuous
SECURITY
Validation

#RSAC
Build Confidence in
What Actually Works

#RSAC
So how does it work?

#RSAC
How it Works
Plan & Organize GameDay Exercise

#RSAC
How it Works

Plan & Organize GameDay Exercise

Develop & Evaluate
Chaos Experiment

Chaos Engineering
Team

Tool s

People Application Switching Infrastructure

Tool s

#RSAC
Security

#RSAC
What could go wrong?

#RSAC
What has gone wrong before?

#RSAC
How does My Security Really Work?

#RSAC
What evidence do I have to prove it?

#RSAC
How it Works

Plan & Organize GameDay Exercise

Develop & Evaluate
Chaos Experiment

Execute Live
GameDay Operations

#RSAC
How it Works

Plan & Organize GameDay Exercise

Develop & Evaluate
Chaos Experiment

Conduct PreIncident Review
Execute Live
GameDay Operations

#RSAC
How it Works

Plan & Organize GameDay Exercise

Develop & Evaluate
Chaos Experiment

Conduct PreIncident Review

Execute Live
GameDay Operations

Automate & Evangelize Results & Take
Action

#RSAC

Firewall?
Misconfigured Port Injection

Config Log Mgmt? data?

Alert IR SOC? Triage

Wait...

Hypothesis: If someone accidentally or maliciously introduced a misconfigured port then we would immediately detect, block, and alert on the event.

Firewall?
Misconfigured Port Injection

Config Log Mgmt? data?

Alert IR SOC? Triage

Wait...

Result: Hypothesis disproved. Firewall did not detect or block the change on all instances. Standard Port AAA security policy out of sync on the Portal Team instances. Port change did not trigger an alert and log data indicated successful change audit. However we unexpectedly learned the configuration mgmt tool caught change and alerted the SoC.

#RSAC
More Experiment Examples

 Software Secret Clear Text Disclosure
 Permission collision in Shared IAM Role Policy
 Disabled Service Event Logging
 Introduce Latency on Security Controls
 API Gateway Shutdown

 Internet exposed Kubernetes API
 Unauthorized Bad Container Repo
 Unencrypted S3 Bucket  Disable MFA  Bad AWS Automated Block
Rule

#RSAC
An Open Source Tool
74

ChaoSlingr Product Features #RSAC

· ChatOps Integration · Configuration-as-Code · Example Code & Open Framework

· Serverless App in AWS · 100% Native AWS · Configurable Operational Mode &
Frequency · Opt-In | Opt-Out Model

#RSAC

#RSAC
Apply What You Have Learned Today
· Next week you should:
­ Identify critical database(s) within your organization
· In the first three months following this presentation you should:
­ Understand who is accessing the database(s), from where and why ­ Define appropriate controls for the database
· Within six months you should:
­ Select a security system which allows proactive policy to be set according to your organization's needs
­ Drive an implementation project to protect all critical databases
77

Q&A
@aaronrinehart aaron@verica.io

@ericksonky ericksonky@gmail.com

Thank you RSA!!!!

@aaronrinehart aaron@verica.io

@ericksonky ericksonky@gmail.com

