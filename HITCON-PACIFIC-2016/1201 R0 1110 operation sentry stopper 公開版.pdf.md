Operation Sentry Stopper: A Long-Standing Espionage
Lenart Bermajo, Mingyen Hsieh, Razor Huang

Cyber Threats To
Financial Institutions

2

Copyright 2016 Trend Micro Inc.

ATM Malware on the Rise
· More than 3 million ATMs · 8.6 billion cash withdrawals per year

3

Copyright 2016 Trend Micro Inc.

European ATM attack statistics from 2011 to 2015

Source: http://blog.trendmicro.com/trendlabs-security-intelligence/atm-malware-on-the-rise/

4

Copyright 2016 Trend Micro Inc.

Society for Worldwide Interbank Financial Transfers

5

Copyright 2016 Trend Micro Inc.

Incidents Summary
· Attackers have in-depth knowledge on SWIFT · Familiar how banks operate the system · SWIFT codes are hardcoded in the malware · Parse transaction messages and send fake one

6

Copyright 2016 Trend Micro Inc.

Before Financial Loss and Reputational Damage

7

Copyright 2016 Trend Micro Inc.

Sentry Stopper

8

Copyright 2016 Trend Micro Inc.

Target Region

9

Copyright 2016 Trend Micro Inc.

Attack Overview

SMTP Server Data ExCf&iCltration

Attacker

Compromised Sites

ConfigCuroatimon mand & Control
Update

Email Attach Victim Information

HTTP POST Victim Information

Lateral Movement

SOGOMOT

Network Cracker

Infect other machines

Mini

Keylogger

10

Copyright 2016 Trend Micro Inc.

Victim

Loader

Since when?
· Earliest Sample ­ Feb 2009
­ Earliest Compile Time
· Earliest Timestamp from configuration file

11

Copyright 2016 Trend Micro Inc.

Since when?

12

Copyright 2016 Trend Micro Inc.

How Did They Maintain Foothold

13

Copyright 2016 Trend Micro Inc.

Some Tricks...
· Frequent Updates · Pretend to have normal traffic · Use legitimate Services · Stop the Sentry

14

Copyright 2016 Trend Micro Inc.

SOGOMOT Mini
SOGOMOT

Compromised Server SOGOMOT Mini

15

Copyright 2016 Trend Micro Inc.

Frequent Updates

16

Copyright 2016 Trend Micro Inc.

Steganography?

17

Copyright 2016 Trend Micro Inc.

Stored in Registry

18

Copyright 2016 Trend Micro Inc.

Pretend to Have Normal Traffic

19

Copyright 2016 Trend Micro Inc.

Sent Mail via Legitimate Services

20

Copyright 2016 Trend Micro Inc.

tplink2.bin Example

21

Copyright 2016 Trend Micro Inc.

Stop the Sentry

22

Copyright 2016 Trend Micro Inc.

NTFS Junction Point
Malware

Old Engine

.\AV Dir\LaOteldstEEnnggininee Junction Point

.\Malware Dir\

23

Copyright 2016 Trend Micro Inc.

Set Directory Attribute

24

Copyright 2016 Trend Micro Inc.

Set as Reparse Point

25

Copyright 2016 Trend Micro Inc.

Clip Lock
Malware

26

Copyright 2016 Trend Micro Inc.

AV Service
Exclusive Access Signature File

Set Share Mode to 0

27

Copyright 2016 Trend Micro Inc.

Was it always like this?

Year Version

Description

2009 3.5.6 Active monitoring of Specific AV and Firewall Processes

2011 2012

4.1.5 4.3.3

First Sentry Stopper routine added Keylogger implemented as a separate module AV and firewall process monitoring on demand

2013 4.6.5 Second Sentry Stopper routine implemented

4.7.1 Use of legitimate SMTP service

4.7.4 64-bit architecture support

2016 4.9.A Packed with PECompact 2.xx

28

Copyright 2016 Trend Micro Inc.

Lateral Movement

29

Copyright 2016 Trend Micro Inc.

SMTP Server

C&C

Attacker

Compromised Sites
Configuration Update

SOGOMOT

Email Attach Victim Information

HTTP POST Victim Information

Network Cracker

Lateral Movement Infect other machines

Mini

Keylogger

30

Copyright 2016 Trend Micro Inc.

Victim

Loader

Overview
SOGOMOT
Network Cracker
Registry

31

Copyright 2016 Trend Micro Inc.

Connected Machine Server Type

Enable Remote Registry

32

Copyright 2016 Trend Micro Inc.

Install

33

Copyright 2016 Trend Micro Inc.

What are They After?

34

Copyright 2016 Trend Micro Inc.

35

Copyright 2016 Trend Micro Inc.

System Information Keystrokes Chat logs

They Are Looking To

36

Copyright 2016 Trend Micro Inc.

CnC Distribution

37

Copyright 2016 Trend Micro Inc.

Summary
· Multiple methods of data exfiltration · AV retaliation as opposed to stealth · Constant mapping of target environment · The need for better understanding of
attackers

38

Copyright 2016 Trend Micro Inc.

Thank you

39

Copyright 2016 Trend Micro Inc.

