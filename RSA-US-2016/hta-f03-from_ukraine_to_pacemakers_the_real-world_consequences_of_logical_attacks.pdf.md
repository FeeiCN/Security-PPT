SESSION ID: HTA-F03
From Ukraine to Pacemakers! The Real-World Consequences of Logical Attacks

Éireann Leverett
Founder and CEO Concinnity Risks @concinnityrisks
Marie Moe
Research Scientist SINTEF @MarieGMoe

#RSAC

#RSAC
A tale of engineers and integrity...
2

#RSAC
The internet isn't virtual.
In fact it never was. It just wasn't `embodied' yet. What can we expect of cyberphysical security and failures? In other words, how deep is the iceberg?
3

#RSAC
IT / OT Big Picture
4

C02 Model (Let go of the CIA)

Controllability

Observability

Operability

Inability to bring the process Inability to measure state and Inability of the device to

or system into a desired

maintain situational

achieve acceptable

state.

awareness.

operations.

Example failures include: · Control network not in
a controllable state · There is no longer a
control sequence which can bring the system into an intended state · The sequence of the control commands is unknown to the operator (because it has been altered or potentially altered) · Actuator has lost connectivity or power

Example failures include: · Inability to monitor
sensors (data integrity loss and/or loss of availability) · Untrustworthy measurement (data has lost veracity) · Measurement of all necessary quantities at the right locations is no longer possible · Inability to interpret the measurements e.g. changing the language of alerts

Example failures include: · Inability to maintain
optimal operations under attack · The physical device has been damaged e.g. motor burnt out, gear teeth ground down, pressure vessel burst · Inability to safely shut down · Multiple operators working against each other through same control channel

#RSAC

#RSAC
Let's simplify: How many actuators?
It is the growth of actuator sales that will define cyber-physical hacking, even more so than the hackers themselves.

Insecurity is a transitive property
Security isn't! ·If my computer is secure ·And my house is secure ·It doesn't imply my phone is secure
If my email is insecure: ·my passwords are known
If my computer was insecure: ·my private keys are known ·it could *still* be spawning reverse shells So insecurity is transitive in time also! ·What is the sum of vulnerabilities? ·Let's see how insecurity transitivity looks in time...

#RSAC

#RSAC
Vulnerable populations as a timeline.
2015 Security Metrics for the Android Ecosystem (Thomas, Beresford, Rice)

#RSAC
Insecurity is compose-able

Vulnerabilities can be built into emergent capabilities.

It is difficult to predict the emergent
capability for nonphysical effects.

When you add in physical effects,
you get combinatorial
explosion.

How would you "map" all possible emergent physical
effects?

Now with added physical effects!
Remember the C02 Model?

Let's deep dive into that...

If there exists a vulnerable e

If there exists a vulnerable u
If there exists a vulnerable ym

The system is vulnerable

Unexpected Physical effects

#RSAC

#RSAC
Sensors are vulnerable
Padmavathi, Dr G., and Mrs Shanmugapriya. "A survey of attacks, security mechanisms and challenges in wireless sensor networks."

#RSAC
Actuators are vulnerable
"I Cannot Be Played on Record Player X" Has been true since (at least):
von Neumann's Self-replicating kinematics
A simple example is cars driving themselves off the road A complex example would be a robotic arm unplugging its' network or power cable. We haven't even discussed how they're `digitally' vulnerable yet, but that is true too.

Network devices are vulnerable
Switches Get Stitches
If connectivity is required by your business model, then every networking
device is my point of subversion against your
business.

#RSAC

#RSAC
Protocols are Vulnerable
Common Cybersecurity Vulnerabilities in Industrial Control Systems DHS 2011

#RSAC
Alarms are vulnerable

#RSAC

Guest: Robert M Lee

#RSAC
@RobertMLee For deeper analysis: ics.sans.org/duc5 Please tweet widely 

#RSAC
Ukranian Outage Return Period

Freqqency of Occurance

10000.00% 1000.00% 100.00% 10.00% 1.00% 0.10% 0.01% 0.30

3.00

30.00

300.00

Lost Power (TWh)

3000.00

0.8 Twh lost maps to roughly a 1 in 2 year event by US standards
So while this is significant from a hacking perspective, it is not very significant from a power engineering perspective.

#RSAC
The cost of US power outages
LaCommare, Kristina Hamachi, and Joseph H. Eto. "Understanding the cost of power interruptions to US electricity consumers." Lawrence Berkeley National Laboratory (2004)
19

#RSAC
"IoT cannot be immortal and unfixable." -Dan Geer BlackHat 2014
Who will be responsible for IR costs for IoT?
Are we privatising sales and socialising IR? Is insurance starting to make sense yet? If not for critical infrastructure, then are you ready to talk about medical device cyber insurance?

#RSAC
Personal Infrastructure
Your reliance on an infrastructure is inversely proportional to how invisible it is to you.
We all rely on oxygen, our lungs, and our hearts, but how often to we think about them?
How often do we do maintenance or debug them?

#RSAC
My Personal Critical Infrastructure

POTS/SMS

Cellular or Telephone Network

Web portal

Home monitoring

unit

MICS/

ISM

Inductive near field communication

Pacemaker/ICD

Programmer

22

#RSAC
Debugging me

What is the same between big and little

#RSAC

infrastructure?

The cost of failure is "embedded" (damage)
The Economic Impacts of Inadequate Infrastructure for Software Testing (2002)
This table should be extended table to include:
Vulnerability exploited in the wild
And
Vulnerability exploited in an infrastructure

#RSAC
Now our vulnerability is "embodied"

Vehicle to Vehicle

Smart Grid

Robotics

Traffic Control

Maritime

Industrial manufacturing

Autonomous Vehicles

Logistics Systems

Aircraft

So is the cost of failure!

#RSAC
Asymmetric adversarial economics.

Harm Type
Data Physical

Impact
Non-Zero Sum Zero Sum

Payload reuse
High Low

Cost of remedy Low High

Social cost
Individual Collective

#RSAC
So what should our design goals be?

Recoverability.
Reduce transitivity
of insecurity in TIME.

Anti-contagion
Reduce transitivity of insecurity between:

COMBAT Persistence

Networks Components Libraries

Systems

Credentials Organisations

#RSAC
The hidden cost of the Solow residual?
1. Quantify the cost to society for a 10 hour outage to each critical infrastructure in the largest region covered by one company.
2. Quantify the cost of 70%/50%/30%/1% vulnerable IoT deployments. 3. Quantify the cost of medical device physical impacts on 1%/5%/20% of
the population.
I think this is where we went wrong. We focused on "how does/can it fail; ... not how much will it cost us?"
28

#RSAC

#RSAC
Apply what you have learned today
Rename the IoT
Start writing use-cases!
The failure of your code can ruin our future
Go home and quantify the cost of failure!
The Siren song of impact assessment ranking
The payload is not the exploit
Quantify the cost of a failure in your system. Are you resilient?
30

#RSAC

Questions & Thank you!

Éireann Leverett www.concinnityrisks.com @concinnityrisks @blackswanburst
Robert M Lee www.dragossecurity.com @RobertMLee

Marie Moe www.sintef.no/en @MarieGMoe

