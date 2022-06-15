HT-F03
Hacking Critical Infrastructure Like You're Not a N00b
#RSAC

Jason Larsen
CyberSecurity Researcher IOActive

#RSAC
I just got a shell on the control system, now what?

#RSAC
Inherent Dangers

#RSAC
Researching Hazards

#RSAC
Hazard Mitigations
Nearly every hazard will have some mitigation Just because there is a mitigation, doesn't mean that mitigation is effective There is always a strong pressure to declare a problem solved

#RSAC
Typical HMI Screen

#RSAC
Let's Make Some Moonshine

#RSAC
Let's Make Some Moonshine

#RSAC
Let's Make Some Moonshine
Moonshine tastes awful! Burn it instead!

#RSAC
Easy Button Attacks
· At S4 Reid Wightman described one such attack..... · Variable frequency drives have skip frequencies to
stop the VFD from operating at a resonant frequency
· The engineer has already calculated the exact VFD frequency that is a problem
· Easy button attacks are great if they happen to line up with what you want to achieve
What if there is no easy button?

#RSAC
Possible Weaponization Strategies
Flaming pool of death Flaming inferno of death Steam Collapse

#RSAC
Flaming Pool of Death

#RSAC
Flaming Inferno of Death

#RSAC
Steam Collapse
14

#RSAC
Point Database
· The attacker will need to extract the point database · This is a toy process so it only has 22 points

#RSAC
Timing And State Diagrams (TSD)

#RSAC
Processes aren't vulnerable all the time

#RSAC

#RSAC

Learning phase

Extracted "runs"

#RSAC
Believable noise Spoofed sensor signal

#RSAC
We're winning!!

#RSAC
That's not right!

Steam Transfer

#RSAC
Temperature/Pressure Builds
Vacuum Breaker - Move Along

#RSAC
Just letting go is like ringing a bell

#RSAC

#RSAC
Mapping TSD to Devices
Alarm Pathways and Sanity Checks as well as Data Flows

#RSAC
Distributed Checks
Sending messages between devices is messy
The process doesn't stop to wait on your message This causes lots and lots of edge cases
Autonomous agents in each control "zone" works better
Each agent will need it's own independent TSD logic
Mapping Devices to Implants

#RSAC
Creating and Validating TSD

#RSAC
Creating and Validating TSD

#RSAC
Methane vs CO2

#RSAC
Simple Scaling

#RSAC
Best-Fit Monotonic Line Approximation

#RSAC
Force Relaxing
Relaxing a graph matches points based on artifacts just like a human would

#RSAC
Model Outputs
For every pair of time series, we can calculate
Scale ­ 5.25 Offset - 52.64 Slope ­ 2.28 Delay ­ 9 seconds Fitness ­ 88.06%
In general, the greater the disturbance in the loop, the better the correlation matrix will work

#RSAC
Let's overlay the correlation matrix on top of our existing TSD diagram

#RSAC
Uncertainty Tables
An exploit chain can always be built, but how confident are you it will work?

#RSAC
Comparing Attack Strategies

Feedback with Topology
How do you know when something has gone horribly wrong on the far side?
There is no "Pipe Roundness" sensor

#RSAC
Topology Invariance
Topologies are generally static in a process operating in the same mode
Individual characteristics of a topology may be conserved

#RSAC
Topology Invariance

Topology Characteristic Invariance

(Integration under the flow curve yields volume)

Level A

Flow A

Flow B

Flow C

Level B

#RSAC
Level C

(Level A * Volume A) = (Level B * Volume B) + (Level C * Volume C) (Flow A) = (Flow B) + (Flow C) (Level A * Volume A) = (Flow B) + (Flow C)
Mostly true, but stuff happens

#RSAC
Change in Physics
42

#RSAC
Feedback Till Topology Changes
Success can often be registered as a topology change Often some values that are conserved are no longer conserved during the damage phase

#RSAC
Why don't we see more "Cyber Weapons"?
Given the amount of work, there is also a high degree of uncertainty that the weapon will actually work
You're not always at war with someone so you need a kindlergentler way of testing
Economic disruption can be used to validate future cyber weapons against real targets
Expect to see an increase in economic disruptions in high-value targets

#RSAC
Ukraine Attack
This is more of an easy-button attack with some force multipliers
· Attackers only had to turn off the power
· No great knowledge of the process required
· Typical DoS against the call center

#RSAC
Questions?
Jason Larsen Jason.larsen@ioactive.com

