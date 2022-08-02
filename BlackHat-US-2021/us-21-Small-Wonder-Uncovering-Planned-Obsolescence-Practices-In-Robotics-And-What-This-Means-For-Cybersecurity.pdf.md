Small Wonder: Uncovering Planned Obsolescence Practices in Robotics and What This Means for Cybersecurity

Víctor Mayoral-Vilches Alias Robotics

Federico Maggi Trend Micro Research

#BHUSA @BlackHatEvents

ROBOTS ARE NETWORKS OF NETWORKS
Networks that comprise sensors to perceive the world, actuators to produce a physical change, and dedicated computational resources to process it all and respond coherently, in time, and according to its application[1].
[1] Mayoral-Vilches, V., Hernández, A., Kojcev, R., Muguruza, I., Zamalloa, I., Bilbao, A., & Usategi, L. (2017). The shift in the robotics paradigm--the hardware robot operating system (h-ros); an infrastructure to create interoperable robot components. In Adaptive hardware and systems (ahs), 2017 nasa/esa conference on(pp. 229­236).

#BHUSA @BlackHatEvents

THERE IS NO SAFETY
WITHOUT SECURITY IN ROBOTICS
Safety cares about the robot not harming the environment (or humans) whereas security deals with the opposite, aims to ensure the environment does not conflict with the
robot's programmed behavior. There's an intrinsic connection between safety and security. Functional safety standards reflect this aspect.

#BHUSA @BlackHatEvents

ONLY SAFE IF SECURE
IEC 61508 indicates the following in section 7.4.2.3: "If the hazard analysis identifies that malevolent or unauthorized action, constituting a security threat, as being reasonably foreseeable, then a security threats analysis should be carried out."

#ONLYSAFEIFSECURE
safety requirements spawn from security research

Moreover, section 7.5.2.2 from IEC 61508 also states:
"If security threats have been identified, then a vulnerability analysis should be undertaken in order to specify security requirements."

IEC 61508
FUNCTIONAL SAFETY

2021/*/EC
EUROPEAN MACHINERY DIRECTIVE

IEC 62443
SECURITY FOR INDUSTRY
#BHUSA @BlackHatEvents

TERADYNE-DERIVED COLLABORATIVE ROBOTS
claimed designed to augment human capabilities by closely (physically) cooperating without causing any harm. Past research however hints that the lack of security measures in these robots leads to safety hazards

MATERIAL OBSOLESCENCE COMMON PRACTICES[2]
1. Making items difficult to repair (by raising the cost of repair, requiring special tools, private networks, etc.)
2. Failing to provide information (for instance, manuals are not provided)
3. Systematic obsolescence (making parts among models incompatible or making it impossible to fix newer models with parts from the older models)
4. Numbering (frequently changing the model numbers to make it psychologically less attractive to use old models)
5. Legal approaches (prohibiting access and modification to the internal structure of products by means of copyrights and patents)

[2] Hatta, M. (2020). The right to repair, the right to tinker, and the right to innovate. Annals of Business Administrative Science, 0200604a.
#BHUSA @BlackHatEvents

OPPOSING MANUFACTURERS THAT ENDANGER ENDUSERS

https://news.aliasrobotics.com/week-of-universal-robots-bugs-exposinginsecurity/

https://news.aliasrobotics.com/the-week-of-mobile-industrial-robotsbugs/
#BHUSA @BlackHatEvents

65K USD
"MiR's business model is based on MiR selling its robots through a distributor network, and the distributors or integrators are fully responsible for the distribution/commissioning of MiR products in collaboration with the end user". Ole Storm, Mobile Industrial Robots R&D Manager (May 2020)

"- The customers are not entitled to any upgrade unless the product requires it, to solve a specific issue. - The software upgrades are provided by your distributor. - We do not provide access to the release note of the software to end user" Fernando Fandiño Oliver, Mobile Industrial Robots Sales Director, Southern Europe & MEA (May 2020)
30K USD
#BHUSA @BlackHatEvents

70K USD
"... it is my understanding that a device must be connected in some form to the internet, via Wifi or mobile data to be at risk from a cyber attack. As our robot operates completely independently from the internet, I don't see how it can be externally hacked."
Simon Ellison, Vice President Sales & Marketing at UVD Robots (May 11 2020)

"We are aware about the potential challenges of using the products on a network with access to the internet or on insecure local networks." Lars-Peter Ellekilde, Founder and CEO at Enabled Robotics (Apr 27 2020)
? USD (~ 50K)
#BHUSA @BlackHatEvents

ROBOT TEARDOWN
A teardown in robotics is the process of taking apart a robot to understand how it is made and works.
More formally, it is the approach to modeling the functional behavior and physical components of a robot.
All of the work was performed by researchers and provided to the public free of charge as a public service and not for any competitive purposes.

#BHUSA @BlackHatEvents

Robot Teardown Why and how
Federico Maggi Trend Micro Research

#BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

CVEs

FIXES SIGNATURES
#BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

T-shirt design from https://www.etsy.com/listing/1012449494/i-void-warranties-men-t-shirt-husband

#BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

MANUALS
#BHUSA @BlackHatEvents

forum.adamcommunity.com dof.robotiq.com automationforum.in robot-forum.com/robotforum control.com solisplc.com/forum forums.mrplc.com reddit.com/r/robotics plc.myforum.ro forum.universal-robots.com forums.robotstudio.com
#BHUSA @BlackHatEvents

SIMULATION SOFTWARE (CTRL-Z)
#BHUSA @BlackHatEvents

OS
#BHUSA @BlackHatEvents

CASE STUDY 1 TEARDOWN OF AN INDUSTRIAL
COLLABORATIVE ROBOT
#BHUSA @BlackHatEvents

UR3 CB3.1
#BHUSA @BlackHatEvents

SAFETY

NXP LPC4437JET256

#BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

CASE STUDY 2 TEARDOWN OF A NEXT-GEN INDUSTRIAL
COLLABORATIVE ROBOT
#BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

CASE STUDY 3 TEARDOWN OF A MOBILE INDUSTRIAL ROBOT
#BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

Teardown-enabled Security Research
Víctor Mayoral-Vilches Alias Robotics
#BHUSA @BlackHatEvents

TEARDOWN-ENABLED SECURITY RESEARCH

https://github.com/aliasrobotics/RVD

+100 security flaws detected
17 new CVE IDs, still zero days today
ROBOT VULNERABILITY DATABASE (RVD)
All disclosed and catalogued in the open
#BHUSA @BlackHatEvents

Video1.mp4 00:00 - 00:12

Video3.mp4 00:04 - 00:25
#BHUSA @BlackHatEvents

Don't trust (vulnerable) robots
#BHUSA @BlackHatEvents

FINDING PLANNED OBSOLESCENCE INDICATORS

All of the work was performed by researchers and provided to the public free of charge as a
public service and not for any competitive purposes.

#BHUSA @BlackHatEvents

BYPASSING PLANNED OBSOLESCENCE
All of the work was performed by researchers and provided to the public free of charge as a public service and not for any competitive purposes.

#BHUSA @BlackHatEvents

(DISTINGUISHED) ROBOT MANUFACTURER QUOTES

"Security... yes. We have PL-D level." Leading manufacturer of industrial robot manipulators
"We make open systems. The security flaws indicated greatly facilitate system integration." Leading collaborative robots manufacturer
"We know our robots have a set of reported vulnerabilities but our end-users don't care." Leading automation manufacturer and system integrator.
"We leave solving those (security flaws) to the end user." Leading manufacturer of industrial robot manipulators.

"Everything will be fixed in the next release" ... (3 months later) ... "It can't be fixed". Leading manufacturer of industrial robot manipulators.
"(Robot) cybersecurity is up to the robot user" Leading manufacturer of collaborative robots.
(Robot) cybersecurity is up to the robot hacker.
#BHUSA @BlackHatEvents

SOUND BYTES
1. Security in robots is nothing new but the consequences of insecurity are critical. Flaws (including security ones) in robots lead to safety hazards, and can kill. #onlysafeifsecure
2. Robot teardowns are needed for security research, for quality assurance of hardware and for putting pressure on manufacturers to ensure security (and thereby human safety) first in their designs.
3. We need a "Right for Repair" in robotics. Robot waste is of no concern to manufacturers, who employ planned obsolescence practices avoiding repairs. The US (and not China) leading the way in bad practices.
#BHUSA @BlackHatEvents

QUESTIONS?
Small Wonder: Uncovering Planned Obsolescence Practices in Robotics and What This Means for Cybersecurity

Víctor MayoralVilches Alias Robotics

Federico Maggi Trend Micro Research

Thanks also to University of Klagenfürt and our co-authors: Unai Ayucar-Carbajo, Alfonso Glera-Picón,
Stefan Rass, Martin Pinzger and Endika Gil-Uriarte.
#BHUSA @BlackHatEvents

