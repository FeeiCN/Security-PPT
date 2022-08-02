SESSION ID: ECO-W01
The promise and the perils of wearables

Andrés Molina-Markham
Principal Research Scientist RSA Labs / RSA, The Security Division of EMC Andres.Molina-Markham@rsa.com

Shrirang Mare
PhD Candidate Dartmouth College shrirang@cs.dartmouth.edu

#RSAC

Intel Mica

Apple watch Misfit shine

#RSAC

Google Glass

Fitbit flex

Android wear
2

Nod Ring

#RSAC
The promise and the perils of wearables

New opportunities Big challenges

u Novel user interfaces u Novel data collection uses u More personal u More available

u Power efficiency u Diverse HW/SW u Security

3

Overview of the talk
New opportunities
u BRACE: Bilateral recurring authentication conducted effortlessly
An example of a novel use of wearables in security applications

#RSAC
Big challenges
u Amulet: Secure computational jewelry for wearable mHealth applications
An architecture that addresses the challenges of implementing a
secure low-power wearable device

4

BRACE

Shrirang Mare, Dartmouth

Andrés Molina-Markham, RSA Labs

#RSAC

Cory Cornelius, Intel Labs

Ronald Peterson, Dartmouth

David Kotz, Dartmouth

#RSAC
Motivation: Clinical workstations
u Unattended logged-in computers u Security risk u Compliance issues
ShutterStock photos under license
6

#RSAC
The De-authentication Problem
u Users forget to logout u They intentionally do not logout
http://millerhealthlaw.com/company
7

#RSAC
Existing solutions
u Timeouts are too long, or too quick u Human proximity detector
u Styrofoam cup story
8

#RSAC
Our solution
What interactions a user performs
u Monitor wrist movement with wristband u Correlate wrist movement and input to computer
9

#RSAC
Bilateral authentication

Observer #1 Observed Event
Observer #2

Device
User-Computer Interactions
Sensors on wrist

Authenticate by
correlating their
observations

10

Mouse-Keyboard Switch (MKKM)

#RSAC

Scrolling

Typing

Wrist movement during computer interaction
11

#RSAC

I0, t0s , t0e

Actual

Sequence of

Interactions

Interactions 1. Typing 2. Scrolling 3. Mouse-Keyboard switch

Correlate

I00 , t0s, t0e F0
Classifier

Sequence of Interactions

Estimated
12

Evaluation
User study
u 20 subjects u 30-40 mins study session
Tasks during study:
u Fill out web survey u Browse internet u Mimic another user
13

#RSAC

13

7

Male Female

Gender

12

8

CS Non-CS

Field

5 15

26-30 18-25

Age

#RSAC
Usability
Interac(ons
Average False Negative Rate vs. Number of interactions
14

#RSAC
Security
Interac(ons
Average False Positive Rate vs. Number of interactions
15

Security

#RSAC
Low usability High usability
Identified adversary
in 11 seconds

Fraction of adversaries that have access at time t
16

#RSAC
BRACE Summary
u Bilateral authentication approach u BRACE for continuous authentication u Evaluated feasibility with a user study
u High-usability setting: 90% accuracy; 50 sec to identify adversary u Low-usability setting: 85% accuracy; 11 sec to identify adversary
17

Amulet: Secure

computational jewelry for

#RSAC

wearable mHealth

applications

amulet-project.org

#RSAC
Wearable mHealth

EEG (Emotiv)

Image:www.athena-gatech.org

Footpod (Suunto)

Respiratory management platform (Puffminder)

Sleep and activity monitor (Shine)

Hearing aid (gizmo diva) 19

Heart rate monitor (teamwildathletics.com)

Today's wearable data flow

ECG and Breathing
GSR and Movement
Insulin pump

Body Area Network

Movement Sensors

External Weight Sensor
20

#RSAC
Mobile phone provides a hub for monitoring body-area devices

image:  winar(cles.net

#RSAC
Problem:
 Smartphones break
21

#RSAC
or get lost ...
image:  the(mes.co.uk
22

#RSAC
or are simply  left behind
23

image:  techgc.net

#RSAC

One alternative: Amulet for mHealth

A wearable device that provides

ECG and Breathing

a highly available runtime for mHealth applications

Network

GSR and Movement
Insulin pump

Amulet

Body Area Network

Movement Sensors

External Weight Sensor

Electronic health record (EHR)

24

#RSAC
Wearable platform requirements
u Secure application runtime u Independent from the smartphone and more present u Small enough to wear u Efficient enough to last for a day or longer u Extensible because it supports the easy addition of
devices and applications u Open for others to use and improve
25

#RSAC
Amulet challenges

u Security-focused architecture

u Power-efficient hardware & software

u Programming model

for third-party apps

[Netflix]

26

Overview

App Developer

#RSAC

ECG and Breathing
GSR and Movement
Insulin Pump

customized & signed firmware

Amulet Cloud
data upload

app source
app recommendations

Movement

amulet companion

Sensors

Patient

smartphone

Clinician

27

#RSAC
Security
u Apps sandboxed at compile-time u Safe subset of C sandboxes each app u Amulet installs only trusted firmware images
u Apps limited to authorized resources u Every app request is checked against policy
u App actions logged for later auditing u Secure audit trail in persistent memory
28

#RSAC
Inside the amulet
u Two-board design u "Radio board" manages communications u "App board" runs apps and UI
u App board is off when idle u Radio board boots it only when needed u Must be quick to boot and reload apps u Apps must survive such reboots
u Apps: finite-state machines w/memory u Set of states, variables, and event handlers u All state is explicit, in non-volatile storage u No threads: handlers run to completion
29

#RSAC
Feasibility applications

u Fall detector
u Accelerometer
u Emergency Response
u Buttons
u Drowsiness detector
u External heart-rate monitor (Mio)
u Bite counter
u IMU sensor

u Battery lifetime 3.5­4.3 days
u Can improve with optimization

30

#RSAC
Amulet summary
An Amulet for mHealth networks
u Highly available: wearable, compact device u Efficient: dual-board event-driven architecture u Customizable: third-party apps written in C u Secure: app isolation, managed resources, audit log,
trusted firmware, encrypted communications
More info: amulet-project.org
31

#RSAC
Take away "Apply"

#RSAC
Apply
1. Think of how wearables may open opportunities for you
u Novel use cases in security? u Novel private user interfaces? u New data streams for security mechanisms?
2. Think about the new challenges to security
u Wearables are not tiny smartphones u Integration with other devices and services
33

#RSAC
Apply
1. Does your novel use case with a wearable need:
u Data? u Control? u Or more complex applications running on wearables?
2. Will wearables in your application be single purpose?
u Or will they have multiple purposes with software from multiple vendors? (e.g., running on Android Wear)
u Will data be primarily streamed in "data silos" or will your application interact with data from other applications?
34

#RSAC
Acknowledgements
andres.molina-markham@rsa.com, shrirang@cs.dartmouth.edu
joint work with
Kelly Caine, Eric Chen, Kevin Freeman, Bhargav Golla, Emily Greene, Ryan Halter, David Kotz, Xiaohui Liang, Sarah Lord, Vivian Motti, Travis Peters, Gunnar Pope, Ronald Peterson, Joseph Skinner, Jacob Sorber, and Tianlong Yun
amulet-project.org
Supported by the National Science Foundation award numbers CNS-1314281, CNS-1314342, and TC-0910842, by the Department of Health and Human Services (SHARP program) under award number 90TR0003-01. The views and conclusions contained in this document are those of the authors and should not be interpreted as necessarily representing the official policies, either expressed or implied, of the sponsors.
35

SESSION ID: ECO-W01
The promise and the perils of wearables

Andrés Molina-Markham
Principal Research Scientist RSA Labs / RSA, The Security Division of EMC Andres.Molina-Markham@rsa.com

Shrirang Mare
PhD Candidate Dartmouth College shrirang@cs.dartmouth.edu

#RSAC

