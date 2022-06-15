#RSAC

SESSION ID: PART1-T08
Why Zero Trust Network Access is Broken, and How to Fix It

Kumar Ramachandran
SVP Products Palo Alto Networks

Josh Dye
SVP, Information Security Jefferies

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC

#RSAC
WORK IS
AN ACTIVITY, NOT A PLACE

APPS ARE EVERYWHERE
80% of organizations have a hybrid cloud strategy, and the average organization uses 110 SaaS apps.
(FLEXERA, 2021; STATISTA, 2021)

USERS ARE EVERYWHERE
76% of employees want to be hybrid, even after the pandemic.
(The State of Hybrid Workforce Security, 2021)

v

4

SECURITY WAS SIMPLE WHEN
WORK WAS A PLACE YOU WENT TO

Office

Data Center

App

App

App

App

App

v v

#RSAC
SaaS/Cloud
App App App App App
5

THE SECURITY IMPLICATIONS OF HYBRID WORK:
USERS ARE NOW GOING DIRECTLY TO APPS

All Apps

User

App App App App App

v v

#RSAC
 Most apps now live outside the data center
 Users are working from home and the office
 Direct to app architecture needed
6

THE SECURITY IMPLICATIONS OF HYBRID WORK:
THE ATTACK SURFACE HAS EXPLODED
All Apps
App App App App App

#RSAC
BIGGER ATTACK SURFACE = MORE ATTACKS
92%
experienced a cyber attack over the past 12 months.
(FORRESTER, 2021)
A NEW THREAT, A NEW SECURITY TOOL
76
Average number of security tools in an organization.
(PANASEER, 2022)

v v

7

THE INDUSTRY TRIED TO SOLVE SECURE ACCESS WITH ZTNA 1.0
Access Broker

Access Request

Access Granted

App App App App App

v v

#RSAC
 User connects to the access broker
 Access is granted  User communicates
directly with the app
8

#RSAC

BUT ZTNA 1.0 FALLS SHORT IN MANY WAYS: VIOLATES THE PRINCIPLE OF LEAST PRIVILEGE

Access Broker

Access Request

Too Much Access Granted

App App

App

! !

 App is defined only based on IP and port
 Grants too much access
 Apps can have dynamic ports or port ranges

App

App

v v

9

#RSAC

#RSAC

BUT ZTNA 1.0 FALLS SHORT IN MANY WAYS: ALLOW AND IGNORE
Access Broker

Access Request

Too Much Access Granted

App App

App

App

App

 Once access is granted, everything is trusted
 Assumes user and the app behavior won't change
 100% of breaches happen on allowed activity

v v

11

#RSAC

#RSAC

#RSAC

BUT ZTNA 1.0 FALLS SHORT IN MANY WAYS: NO SECURITY INSPECTION
Access Broker App App App App App

 App traffic is never inspected
 Cannot prevent malware or lateral movement
 Security through obscurity only

v v

14

#RSAC

BUT ZTNA 1.0 FALLS SHORT IN MANY WAYS: NO DATA PROTECTION
Access Broker App App App App App

 No visibility or control of data
 Can't stop data exfiltration from malicious insiders or external attackers

v v

15

#RSAC

BUT ZTNA 1.0 FALLS SHORT IN MANY WAYS: CAN'T SECURE ALL APPS
Access Broker App App App App App

 Only supports a subset of private apps
 Cannot address cloud native apps, apps with dynamic ports, or serverinitiated apps
 Completely ignores SaaS apps

v v

16

#RSAC
YOU CAN'T TEACH OLD SECURITY NEW TRICKS
THE WORLD NEEDS A
PARADIGM SHIFT.

PRE-2010
VPN

2010s
ZTNA 1.0

17

#RSAC

YOU CAN'T TEACH OLD SECURITY NEW TRICKS
THE WORLD NEEDS A
PARADIGM SHIFT.

2022 -
ZTNA 2.0

PRE-2010
VPN

2010s
ZTNA 1.0

18

INTRODUCING
ZTNA 2.0

v v

#RSAC

ZTNA 1.0
Violates the principle of least privilege
Allows and ignores
No security inspection
Doesn't protect data
Can't secure all apps

ZTNA 2.0
Least-privileged access
Continuous trust verification Continuous security inspection Protects all data
Secures all apps

19

User

v v

#RSAC
App App App App App
20

LEAST-PRIVILEGE ACCESS

User

User-ID

CONTINUOUS

TRUST

VERIFICATION

Device-ID

App-ID

Device

App

HYBRID WORKERS

CONTINUOUS SECURITY
INSPECTION

v v

#RSAC

Enables you to

fully realize the

App

principle of least

privilege by

identifying

App

applications

based on App-IDs

at Layer 7.
App

App

App

21

LEAST-PRIVILEGE ACCESS

User
CONTINUOUS TRUST
VERIFICATION

Device

App

HYBRID WORKERS

CONTINUOUS SECURITY
INSPECTION

v v

#RSAC

Once access to an

app is granted,

App

trust is continually

assessed based on

changes in device

App

posture, user

behavior, and app

behavior.
App

App

App

22

HYBRID WORKERS

LEAST-PRIVILEGE ACCESS

User
CONTINUOUS TRUST
VERIFICATION

Device

App

ADV URL

ADV TP

SaaS

CONTINUOUS SECURITY
INSPECTION

DNS

DLP

MMALL

v v

#RSAC

Provides deep and

ongoing inspection

App

of all traffic, even for

allowed connections

to prevent all

App

threats, including

zero-day threats.

App

App

App

23

#RSAC

HYBRID WORKERS

LEAST-PRIVILEGE ACCESS

User
CONTINUOUS TRUST
VERIFICATION

Device

App

App App

ADV URL

ADV TP

SaaS

CONTINUOUS SECURITY
INSPECTION

DNS

DLP

MMALL

DDLLPP

PROTECTS ALL DATA

App App App

v v

Consistent data protection across all apps used in the enterprise, including private apps and SaaS, with a single DLP policy.
24

#RSAC

HYBRID WORKERS

LEAST-PRIVILEGE ACCESS

User
CONTINUOUS TRUST
VERIFICATION

Device

App

SECURES ALL APPS
App
App

ADV URL

ADV TP

SaaS

CONTINUOUS SECURITY
INSPECTION

DNS

DLP

MMALL

DLP

PROTECTS ALL DATA

App App App

v v

Consistently secures all applications used across the enterprise, including modern cloud native apps, legacy private apps, and SaaS apps.
25

#RSAC

HYBRID WORKERS

LEAST-PRIVILEGE ACCESS

User
CONTINUOUS TRUST
VERIFICATION

Device

App

SECURES ALL APPS
App
App

ADV URL

ADV TP

SaaS

CONTINUOUS SECURITY
INSPECTION

DNS

DLP

MMALL

DLP

PROTECTS ALL DATA

App App App

v v

Delivering on the Vision of ZTNA 2.0
 Least-Privileged Access  Continuous Trust
Verification  Continuous Security
Inspection  Protect All Data  Secures All Apps
26

#RSAC
ONLY A UNIFIED SASE PRODUCT CAN TRULY DELIVER:

ZTNA 2.0

BEST USER EXPERIENCE

v v

UNIFIED PRODUCT
27

#RSAC
Josh Dye
Senior Vice President of Global Information Security Jefferies
28

#RSAC
ZTNA 2.0 Takeaways
· Get rid of VPN · Select a ZTNA solution that can:
­ Enforce Least Privilege Access with fine-grained access controls ­ Enable behavior-based continuous trust verification ­ Secure all apps, all the time ­ Enable deep and ongoing security inspection ­ Ensure consistent visibility with a single DLP policy to secure both access
and data
29

#RSAC
THANK YOU
30

