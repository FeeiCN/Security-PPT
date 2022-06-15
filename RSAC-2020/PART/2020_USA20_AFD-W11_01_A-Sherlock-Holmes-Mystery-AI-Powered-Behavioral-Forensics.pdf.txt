SESSION ID: AFD-W11
A Sherlock Holmes Mystery: AI-Powered Behavioral Forensics

Uri Rivner
Chief Cyber Officer BioCatch LinkedIn: Uri Rivner

Erin Englund
Senior Threat Analyst BioCatch LinkedIn: Erin Englund

#RSAC

#RSAC
130 years ago...
2

Meet the Characters
Soundbytes are from a BBC broadcast of A Case of Identity adapted by Peter Mackie
Ms. Mary Sutherland (the Victim)
­ Father died; mother re-married ­ Allowance of 100 pounds / year ($16,000 in today's terms)
Mr. James Windibank (the Stepfather)
­ Draws the funds for Mary, deposits in her mother's account ­ Doesn't allow her to go to the Gasfitter's ball ­ But... she goes anyway
Mr. Hosmar Angel (the Lover)
­ Met Mary at the ball when stepfather was abroad ­ When the stepfather returned, he was furious at Mary!
­ But love conquers all. Mary and Hosmar fell in love ­ He sent her typewritten love letters ­ They were engaged to marry ­ a very serious business
in Victorian times - but he then disappeared mysteriously

#RSAC

#RSAC
How did Holmes Crack the Case?

Generic Criminal Patterns
Spoofing Indicators
­ Hosmar Angel was using tinted glasses `against the glare' ­ His voice had a speech impediment `due to a weak throat' ­ Masked his face with a moustache and a pair of bushy whiskers
Suspicious Behavior
­ Did not provide his exact address ­ Preferred taking walks in the evenings ­ Insisted on writing letters with a typewriter, including the signature
Time Sequence Analysis
­ Meetings with Hosmar always took place when the stepfather was in France
High-Risk events
­ Engaged to Mary after their first walk (!) ­ Made her swear that whatever happened, she will always be true to him

#RSAC

Individual Criminal Profiling

A letter written by Mr. Windibank to Holmes

Profiling basis: 4 love letters from Hosmar

#RSAC

· So... A Case of Identity is solved · Hosmar Angel is none other than Mr. Windibank, the stepfather · He introduced this traumatic episode so that Mary never falls in love,
leave home, and depart him from her generous income · Looking at the data science side: there are n features in Holme's model · In Hosmar's profile, 2 are very strong + 14 quite distinct

#RSAC
2020: using AI for criminal profiling

How to use AI in digital criminal profiling
Data
­ Device fingerprints ­ Network, Geo location, GPS coordinates ­ Interaction (mouse, keyboard ,accelerometer, touch) ­ Context data ­ what is the criminal doing? Attack sequence
AI/ML
­ Benefits over blacklists, link analysis and rules:
Adapts as criminals adjust resources and behaviors Allows looking at a very large number of independent variables, even if each individually is not too `incriminating' Even if they knew what is being tracked, how quickly and easily can criminals change all of their behaviors?
Sharing
­ Consortium data sharing allows tracking criminals across the industry

#RSAC

#RSAC
Digital Data Sources: Deep Dive
Building a Criminal Digital Profile

Training the Model
When the process starts, the samples (in our case, criminal sessions) are not separated from each other and crimes done by the same criminal are not clustered.

n-dim space

n-dim space

Example: Triplet Loss Optimization

#RSAC

Now the crimes are neatly separated. Any new crime should fit an existing cluster (so we know it's done by that criminal), or start a new cluster (unknown criminal, and future crimes by same person will automatically match the new cluster)
10

ML vs AI

Define features

Machine Learning
· Color · Height · Number of petals

#RSAC

...

AI: work on

raw data

...

#RSAC
ML vs AI
ML: have data science build features and create criminal profiles (supervised ML) AI: run deep learning ­ requires a large setting of known fraud cases, and not `explainable'

#RSAC
Digital Forensics: Real World Case Studies

#RSAC
The Trouble with Police Lineups

#RSAC
An Adaptive Race
15

Dyre: the scariest Trojan in 2015

#RSAC

Top 5 UK retail bank

00:00

Phase 1: Preparing for the Act

Session start

00:12 Session hijacked! · A malware-induced `click' on a link is observed · User is redirected using MITM capability to an
identical but spoofed site · Presented with a task to complete · While the user is away, the phone number is
automatically being changed to allow criminal
to receive OTP

03:01 Back to Normal · After three minutes, user is redirected
back to the session so they can continue as if nothing happened · User completely unaware of change of phone number

Into the mind of a Dyre Operator

#RSAC

Top 5 UK retail bank

Phase 2: RAT attack two weeks later

Hand-eye coordination shows strong signs of VNC back-connect capability.
This is a nasty RAT case

The Dyre Operator wrote 4 "letters"...
Case #1
Real User
Uncharacteristic use of arrows to scroll up/down. Heavy use
of tabs and enter. Dyre Operator

#RSAC

#RSAC
The Dyre Operator in Action...
Case #2
Real User
Dyre Operator

#RSAC
The Dyre Operator in Action...
Case #3
Real User
Dyre Operator

The Dyre Operator in Action...
Case #4
Real User
Dyre Operator

#RSAC
Bottom line: Multiple rare characteristics
seen in all 4 crimes... Conclusion:
This is the same individual criminal

Serial Killer

Link Analysis (Device/IP): 1400 accounts accessed June 2017 to Jan 2018 ­ probably by same gang

Event Time

Event Type

CUSTOMER_ID IP

Geo

2017-11-14 13:19:01.525 UTC account_creation

1709733973 86.187.165.28 GB

2017-11-14 12:55:59.960 UTC login

1269454403 86.187.165.28 GB

2017-11-14 12:41:22.121 UTC login

1700554834 86.187.165.28 GB

2017-11-14 12:11:17.436 UTC login

1707142348 86.187.165.28 GB

2017-11-13 17:21:21.717 UTC login

1780457969 86.187.161.56 GB

2017-11-13 16:29:42.84 UTC login

1252987799 86.187.161.56 GB

2017-11-13 16:04:16.905 UTC login

1206510933 86.187.161.56 GB

2017-11-13 14:04:50.314 UTC login

1812643420 86.187.161.56 GB

2017-11-13 13:58:52.897 UTC login

1228778211 86.187.161.56 GB

2017-11-13 12:36:58.155 UTC login

1751519369 86.187.161.56 GB

2017-11-13 11:04:05.574 UTC login

1269231715 86.187.161.56 GB

2017-11-13 11:01:56.188 UTC login

1347667687 86.187.161.56 GB

2017-11-13 11:00:58.557 UTC login

1769702297 86.187.161.56 GB

2017-11-13 09:36:09.927 UTC login

1181569171 86.187.161.56 GB

2017-11-13 09:35:32.808 UTC login

1179587048 86.187.161.56 GB

2017-11-13 09:31:44.448 UTC login

1785552971 86.187.161.56 GB

2017-11-13 09:17:58.984 UTC login

1212648632 86.187.161.56 GB

2017-11-10 12:42:49.228 UTC login

1159007220 86.187.175.83 GB

2017-11-10 12:07:26.97 UTC login

1236327817 86.187.175.83 GB

2017-11-10 11:51:52.269 UTC login

1230473965 86.187.175.83 GB

2017-11-10 09:17:57.990 UTC login

1716227150 86.187.162.75 GB

2017-11-10 09:09:05.317 UTC login

1344947061 86.187.162.75 GB

2017-11-10 09:04:29.27 UTC login

1275063724 86.187.162.75 GB

2017-11-10 09:02:28.869 UTC login

1667391770 86.187.162.75 GB

2017-11-10 09:01:37.505 UTC login

1291591795 86.187.162.75 GB

2017-11-10 09:00:46.356 UTC login

1162362599 86.187.162.75 GB

2017-11-10 08:58:36.699 UTC login

1866977182 86.187.162.75 GB

2017-11-10 08:57:11.678 UTC login

1629842597 86.187.162.75 GB

2017-11-10 08:56:27.15 UTC login

1744623964 86.187.162.75 GB

#RSAC
Criminal Patterns
Device ·New Device for User: 100% ·Device associated with Multiple Users: 100%
Behavior 85% of sessions had a unique combination: · Use of Arrows to navigate up/down · Use of both keypad and numpad to type numbers · Use of double-click
· Looks like vast majority of access is done by a single person.
 Tracking criminal even if they move to totally new devices/IPs  Identifying immediate change in genuine user's behavior

#RSAC
The Bitcoin Crew
Source: Simplex.com
5-10 Bitcoin orders per week during May-August `19 All made from newly created bank accounts, mostly a Top 5 Canadian issuer Young buyers, passing verification easily

#RSAC
The Bitcoin Crew
Deeper analysis shows that what seemed like independent shoppers had too much in common to be a coincidence Link analysis on meta data shows cluster of same GPS location for multiple images
Photo IDs were all taken while placed on same table...

#RSAC
The Bitcoin Crew
Also, all the selfie verification photos are taken in the same car Forensics exposes chain of accounts opened online for money laundering and fraud Reviewing a single account does not raise suspicion; however, deep link analysis reveals that something isn't quite right
For more info: gilits@simplex.com

#RSAC
Analyzing Resources: Email, Device

#RSAC
Analyzing Resources: Phone account

#RSAC
Synthetic ID Cyber Gang Behavior

Phone, SSN typed in a specific rhythm and grouping

High familiarity with Site: Super fast interaction with Annual
Income, Income Source

Profiling Bots

Bot moves through session, makes payment on behalf of user

Bot profiling elements:
· IP and geo-location · Server ownership · Device fingerprint · Device profile (OS, browser,
version, user agent analysis) · Spoofing analysis · Blacklists and Link analysis · Consortium checks · Event sequence · Behavioral fingerprints

#RSAC

#RSAC
Closing Notes

Whodunit?
In fraud detection, the goal is to prevent crimes in the most cost-effective way possible, not go after the criminal In criminology, profiling behavior is useful in actually catching the bad guys Holmes' technique relied heavily on human intuition and manual searching AI-powered criminal profiling can...
­ Prevent future attacks ­ Track threat actors across enterprises using consortium databases ­ Build strong cases against individual hackers within an actor group ­ Assist law enforcement agencies, financial crime investigators, cyber intelligence researchers
Can the data be shared across enterprises? Can criminals expect privacy?

#RSAC

Summary
1891: A Case of Identity ­ generic, individual criminal profiling 2020: AI can look at hundreds of device, location, behavior parameters and create unique digital criminal profiles Diversity of data: device/network, image/documentation, behavior/cognitive
­ Criminals can change resources ­ It's more difficult to change behaviors ­ It's also more difficult to understand and neutralize all that is being monitored

#RSAC

32

#RSAC
Apply What You Have Learned Today
Next week you should:
­ Map the data elements and link processes in your online fraud organization
In the first three months following this presentation you should:
­ Research your historic data for any linkage and profiling elements that could point to specific criminals
­ Benchmark your linking and criminal profiling capability by talking to colleagues in the industry / online fraud analysts
­ Assess whether your current layers of visibility and analysis tools are adequate for your risk management needs
­ Identify any gaps in your criminal profiling strategy (data layers and tools) ­ Check whether you can link to consortium-based criminal profiling databases
Within six months you should:
­ Build a plan for closing those gaps, if there's a business case to do it
33

#RSAC
Q&A LinkedIn: Uri Rivner LinkedIn: Erin Englund

