SESSION ID: TECH-W03
Attacks on Critical Infrastructure: Insights from the "Big Board"
#RSAC

Daniel Cohen
Head of RSA FraudAction RSA, The Security Division of EMC @iFraudFighter
Bob Griffin
Chief Security Architect RSA, the Security Division of EMC @RobtWesGriffin

What is a critical infrastructure from attacker

#RSAC

point of view? An opportunity!

Critical infrastructure are the assets, systems, and networks,

whether physical or virtual, so vital to the United States that their

incapacitation or destruction would have a debilitating effect on

security, national economic security, national public health or safety,

or any combination thereof.

USA Department of Homeland Security

Internet

SCADA OPC

SCADA HMI

SCADA Network Corporate Network

DMZ

#RSAC
More Insights from the Dark Web: Terracotta and GlassRat
Bob Griffin

#RSAC
Terracotta
https://blogs.rsa.com/terracotta-vpn-enabler-of-advanced-threat-anonymity/
4

#RSAC
Terracotta
5

#RSAC
How Terracotta Works
6

#RSAC
GlassRat
Detected February 2015 but had been in the wild since 2012 Linked to other campaigns such as Mirage (2012) Targets Chinese nationals in commercial enterprises world-wide
https://blogs.rsa.com/resource/peering-into-glassrat/
7

#RSAC
GlassRat Dropper (Installer)

Double clicking on the flash.exe files causes the dropper to launch.

1. Dropper (flash.exe) writes the GlassRAT DLL to the ProgramData folder

2. 2. Dropper runs the DLL file using the built-in Windows utility rundll32.exe

3. 3. GlassRAT DLL file modifies the run key for logon persistence with user-level permissions with the following registry key.

HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run Update

4. 4. the dropper deletes itself with and embedded command:

"cmd.exe /c erase /F "%s","

8

#RSAC
GlassRat Code Signing
9

#RSAC
The Common Theme: Analytics & Cyber Security
Bob Griffin and Daniel Cohen

#RSAC
Analytics at the RSA AFCC
http://australia.emc.com/video-collateral/demos/microsites/mediaplayervideo/glimpse-rsa-anti-fraud-command-center.htm
11

#RSAC
Detecting Terracotta
https://blogs.rsa.com/wp-content/uploads/2015/08/Terracotta-VPN-Report-Final-8-3.pdf
12

#RSAC
Detecting GlassRat
http://charge.rsa.com/wp-content/uploads/2015/09/Finding-The-R.A.T-With-ECAT.pdf
13

#RSAC
Attacks on the Smart Grid

The recent DragonFly campaign showed how the attackers could use malware to take control of SCADA systems

3- Install malicious update
4- Havex trojan Connect

ICS Software House website

1- Compromise 2- Upload malicious Software update
5- Send Commands

DragonFly Attackers

C2 Server

14

#RSAC
SPARKS Project Consortium
https://project-sparks.eu/
15

#RSAC
Analysis using Static Rules Validator
This component searches for systems' asserts violations Rules List contains the assertions to verify Adapter translate the rules in common language Parser get the rules and search for negative or positive outliers

Static Rules Validator

Rules list

Adapter

Parser

16

#RSAC
Static Rules: Variable outlier
Outliers against a predefined bound
E.g. Voltages should not fluctuate very much
Examine voltages and frequency only
17

#RSAC
Static Rules: Rule Outlier

Calculate physical relationships between variables 18 separate equations

2

2

2

2

2

2

2

2

2

cos-1  + - + cos-1  + - + cos-1  + - = 360°

2 

2 

2 

Measurement is asynchronous

Use difference between RHS and LHS (error)

Determine probability of error from historical data

Flag when below some threshold

18

#RSAC
Static Rules: Kullback Leibler
Symmetrized KL distance on rule errors
Symmetrisation due to Kullback & Leibler  = (, ) - (, )
Historical data (baseline) vs Current measurement Anomaly when value above some threshold
19

#RSAC
Static Rules: Dead Sensor Clustering
Cluster sensors that stop recording in time User configurable time window Anomalous when cluster size > threshold
Time
20

Sensors

#RSAC
Static Rules: Dead Sensor Clustering

Anomalous Cluster

Benign Cluster

Sensors

Time
21

#RSAC
Analysis using Dynamic Detection

This component uses machine learning techniques to evaluate the entire system state

Rules Extractor get data from last readings

Historical KB compare the new feature with system history

Evaluator use tolerance to reduce FP and noise

Auto-Detector

Rules Extractor

Historical KB

Evaluator

22

#RSAC
Dynamic Detection: ML Outliers
Abundance of normal data. Little to no outlier data Train a one-class SVM using only normal data Group similar sensors and train a model for each sensor using only Early studies show good performance but modelling needs more work
23

#RSAC
Some Screenshots of SPARKS' Dashboard
24

#RSAC
Applying this Session
Evaluate your current approach to responding to cyber threats in the light of the kinds of attacks we've discussed Identify an area in which security analytics could improve your ability to detect and respond to cyber attacks
 Identify compromised end-user devices (eg, anomalies in behavior)?  Identify compromised servers (eg, evidence of beaconing)?  Identify lateral movement across your network (eg, anomalies in
network traffic)?
Prototype or pilot security analytics in that area
25

#RSAC
Thank you!
daniel.t.cohen@rsa.com @iFraudFighter
www.linkedin.com/in/danieltcohen
robert.griffin@rsa.com blogs.rsa.com/author/griffin
project-sparks.eu/blog/ @RobtWesGriffin
www.linkedin.com/pub/robert-griffin/0/4a1/608
26

