SESSION ID: SBX3-W1
Hunting and Tracking Rogue Radio Frequency Devices

Eric Escobar
Principal Security Consultant Secureworks @EricEscobar

#RSAC

#RSAC
Story Time
An employee cafeteria $60 in hardware from Amazon A Hacker & 10 years of R&D stolen
2

#RSAC
Story Time

The build.

Battery

Raspberry Pi

Wireless Adapter

3

#RSAC
Story Time
You can do everything from a phone.

Battery

Raspberry Pi

Wireless Adapter

4

Questions to ask yourself...
(Because attackers already are)

#RSAC
Questions to ask yourself...
Does your company allow BYOD (Bring your own device)?
6

#RSAC
Questions to ask yourself...
Do you have to "login" with a username / password for WiFi? Does everyone share the same wireless password?
7

#RSAC
Questions to ask yourself...
Is "Guest" WiFi on a separate network?
8

#RSAC
Questions to ask yourself...
Does anyone connect to the bootleg WiFi?
9

Why are Wireless Attacks attractive to an attacker?

Benefits of wireless attacks
Typically no internal access is necessary. Easier to stay anonymous. Attackers can stay out of sight.

#RSAC
Me

11

An Overview of Wireless Attacks

#RSAC
Real Life Examples of common RF attacks
A brief outline: Wireless Phishing Collecting device metadata Tracking a person or object Jamming alarms Opening Gates & Doors Wireless medical devices anyone?
13

#RSAC
Rogue Access Points
What is a Rogue Access Point (AP)? A wireless access point not within your control Technically any phone or hotspot could be a Rogue AP
Let's see what a dangerous Rogue AP can do...
14

#RSAC
User Impersonation & Wireless Phishing
Rogue access points can create an unsuspecting trap.
15

#RSAC
User Impersonation & Wireless Phishing
The fake login can trick users.
16

#RSAC
User Impersonation & Wireless Phishing
The fake login can trick users.
17

#RSAC
User Impersonation & Wireless Phishing
Rogue Access Points: Can lead to stolen credentials. Compromised workstations. Can exfiltrate data. Can allow users to circumvent corporate policies.
18

#RSAC
Attackers gather lots of Data
Wireless devices emit tons of useful information. WiFi devices can allow for:
­ Users to be tracked. ­ Identification of device type. ­ Connected networks.
Let's take a look at the output from the tool "Airodump-ng"
19

#RSAC
Collecting Device and User Metadata
20

#RSAC
Collecting Device and User Metadata
A quick search shows us a known Mac Address fragment. Attackers can use this to enumerate connected devices.
21

#RSAC
Tracking People and Devices
Wireless devices emit power level:
­ Can be used to track devices via trilateration. ­ "Blue Sonar" can track almost all Bluetooth devices.
22

#RSAC
Wireless Attacks extend past WiFi
Wireless attacks can extend to anything in the RF spectrum. Replay attacks:
­ A common vulnerability in many wireless devices ­ Allows for an attacker to resend a signal previously sent.
Jamming:
­ Creates noise so a receiving station can't make out a signal. ­ Effective at blocking communication.
23

#RSAC
Opening Gates & Doors
Replay attacks can be used to open secure gates.
24

#RSAC
Jamming Attacks
Wireless noise can block transmissions.
25

#RSAC
Detecting and Locating
So we've seen wireless attacks in action.
­ Now what?
Let's dig into Radio Frequencies (RF)
­ To detect and locate we need to know properties of radio signals.
26

Radio Frequencies - 101

#RSAC
How do we measure Radio Frequencies?

Frequency Ranges
­ Measured in Hertz (one cycle / second)

1 second

­ Higher Frequency == More cycles / second
o Wifi ­ 2.4Ghz (2.4 billion cycles/ sec)

Higher Frequency Lower Frequency
28

#RSAC
Example Radio Frequencies
29

#RSAC
Radio Wave Propagation & Penetration
Low frequencies can "diffract" signals
­ Allows signals to bend around objects
Very low frequencies and penetrate deeper into objects
­ Typically means they can travel farther
Medium wave (shortwave) frequencies can "refract" off the atmosphere
­ Allows signals to bounce around the globe
High frequencies typically get absorbed quickly
30

#RSAC
Okay nerd, so what?
Different radio frequencies have different capabilities.
­ Some frequencies can transmit lots of data at short distances. ­ Some can transmit a little data very long distances.
Attackers can leverage properties of different frequencies to...
­ Exfiltrate data ­ Track a person or object ­ Eavesdrop on communications
31

Just a little bit more Math & Science
Triangulation vs Trilateration

#RSAC
Triangulation vs Trilateration
Most people mean trilateration when they say "triangulation"
­ I'll quickly cover the differences with a story
Trilateration uses distance.
Triangulation uses angles.
33

Triangulation
N Home
A loud boom goes off in the center of town...
Work 34

#RSAC
Store

#RSAC
Triangulation

N

Home

Store

Everyone looks in the direction where they heard the noise
Work

35

#RSAC
Triangulation

N

Home

Store

This is the "angle" in triangulation
Work
36

#RSAC
Triangulation

N

Home

Store

This is the "angle" in triangulation
Work

If we drew lines in the direction from everyone's perspective we could find the source.

37

Trilateration
Trilateration works on signal strength and distance.

#RSAC

100ft 300ft

1000ft

38

#RSAC
Trilateration
The closer you get to the radio source the higher signal strength.
100ft 1 Detector
39

#RSAC
Trilateration
If you're in one spot you can know only how far away a signal is.
1 Detector 1000ft
40

Trilateration
Where two detectors overlap, are where the signal can be coming from.

Detector 1 100ft

100ft Detector 2

#RSAC
1 Detector

41

#RSAC
Trilateration

· Where three detectors overlap is where the signal is coming from.
· More "detectors" allow for error correction and accuracy.
Detector 1

Detector 3

Detector 2

42

How can you protect yourself?

#RSAC
How to find a solution for your company?
Know your RF environment. Be aware of your devices and airspace. Have a logging solution in place. See if your existing hardware has WIDS & WIPS functionality.
44

#RSAC
Tracking down rogue access points
Know what access points are yours. Log surrounding MAC addresses. Know what you're looking for. Have employees be on the alert.
Rogue Access Point (IRL)->
45

#RSAC
How to find a solution for your company?
Every solution is unique to your organization. Pros & Cons to every solution. WIPS & WIDS
­ WIPS (Wireless Intrusion Prevention System) ­ WIDS (Wireless Intrusion Detection System)
Can detect deauthentication attacks & rogue APs
46

#RSAC
How to find a solution for your company?
Know your RF environment. Be aware of your devices and airspace. Have a logging solution in place. See if your existing hardware has WIDS & WIPS functionality.
47

#RSAC
Wireless Protections
A note on wireless penetration.
­ The distance your WiFi extends past your building is relative. ­ Great antennas can easily pickup WiFi from hundreds of yards away. ­ Specialty antennas can go even further.
Your wireless network should not rely on distance for security.
­ Wireless heatmap ->
48

#RSAC
Apply What You Have Learned Today
Next week you should:
­ See what existing protections you have in place. ­ Standup your own access point and see if anyone notices. ­ Identify all of your known wireless networks.
In the next 90 days you should:
­ Be able to identify all of your access points across all of your sites.
In six months you should:
­ Have removed all unnecessary wireless networks. ­ Be able to identify if a rogue access point.
49

Let's play a game.

#RSAC
Put it into practice today.
Think you have the skills? Someone at the conference has a rogue access point! Find the rogue access point with the WiFi name of "FoxHunt". If you think you've found the person carrying it, just ask. More questions? @EricEscobar
51

Questions?

