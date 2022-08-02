ICS CYBER THREATS AND A HUNTING WE SHALL GO

"TRADITIONAL" ENTERPRISE SECURITY
· "IT" or Enterprise Security ranges many topics and fields · As a broad simplification though most of Enterprise Security
falls into High Frequency, Low Impact Analysis
· A high number of events, incidents, and threats impact the community at any given time and all security personnel can expect to deal with numerous incidents throughout their career; this influences strategy and mindset
2019 STATISTICS: $3.5B USD REPORTED LOSSES FROM CONSUMER COMPLAINTS ­ FBI 157K+ INCIDENTS AND 3,950 CONFIRMED PUBLIC BREACHES ­ VERIZON DBIR
13B+ MALICIOUS EMAILS A YEAR ­ MICROSOFT

HIGH FREQUENCY, LOW IMPACT

TRIAGE MINDSET

Z

Inherently reactive thought process that

drives an acceptance that something will

happen first to warrant your time

When events are high frequency

there is a natural tendency to spend resources triaging the

HARD LESSONS

Z

Can be difficult to identify or even have

events understanding that you will not get to all of them.

the time to identify lessons learned and apply insights across numerous seemingly disconnected events

Low impact events can lead to risk acceptance and over time underestimating the impact of numerous low impact events.

BURN OUT

Z

Can become overly repetitive and lack

intellectual stimulation for those

responding to them while potentially

being underappreciated by others

THE FREQUENCY & SOPHISTICATION OF THREATS ARE RISING

1998 - 2009
LACK OF COLLECTION · Campaigns: APT1 · ICS Malware: None

2016 ­ 2020

2010 - 2012
PUBLIC INTEREST IN ICS · Campaigns: Sandworm · ICS Malware: Stuxnet

2013 - 2015
CAMPAIGNS TARGET ICS · Campaigns: Dragonfly · ICS Malware:
BlackEnergy 2 and Havex · First attack to cause physical destruction on civilian infra-structure (German Steel)

ADVERSARIES DISRUPT ICS
· Activity Groups: 12 unique state threats
· ICS Malware: CRASHOVERRIDE, TRISIS, and EKANS
· Ukraine: first and second ever electric grid attacks that disrupt power
· Ransomware and destructive attacks
· First malware to target human life

H T T PS : // W W W. SA N S .O RG / R E A D I N G - RO O M / W H I T E PA P E RS/ I C S/ PA P E R / 3 6 2 9 7

TRISIS 2017

THE REST OF THE STORY

· XENOTIME compromised petrochemical facility in Saudi Arabia in 2014
· Profiled Safety Instrumented System (SIS) and left for 3 years
· Returned in 2017 and targeted SIS twice · Root Cause Analysis failure led to second
attempt by the adversary · 1st cyber attack to specifically target
human life
https://www.dragos.com/wp-content/uploads/TRISIS-01.pdf

THREAT PROLIFERATION
KNOWN ACTIVITY GROUPS TARGETING ENERGY INDUSTRY

Ten activity groups targeting Energy:

Ø ELECTRUM Ø XENOTIME Ø MAGNALLIUM Ø ALLANITE Ø DYMALLOY Ø CHRYSENE Ø COVELLITE Ø RASPITE Ø PARISITE Ø WASSONITE

ELECTRUM CHRYSENE

XENOTIME

MAGNALLIUM

COVELLITE

RASPITE

https://www.dragos.com/threat-activity-groups/

ALANITE PARISITE

DYMALLOY WASSONITE

THE INDUSTRIAL THREAT LANDSCAPE
RECENT OBSERVATIONS FROM THE FRONTLINES OF ICS/OT CYBERSECURITY
Two new threat activity groups underscore the heightened risk and increasing threats to industrial environments as adversaries expand their reach geographically and to new sectors.
Ransomware targeting ICS claimed multiple new victims this quarter, as organization-specific malware continues to disrupt ICS operations.
A group of new vulnerabilities will have major impacts on the industrial sector in months and years to come as they impact a fundamental communication stack present in many industrial devices.

FIGURE OUT WHAT YOU HAVE - CMF
HTTPS://WWW.DRAGOS.COM/WP-CONTENT/UPLOADS/CMF_FOR_ICS.PDF

GENERATE HYPOTHESES
Domain Expertise

Friendly or Threat Intelligence

Situational Awareness

HTTPS://WWW.SANS.ORG/READING-ROOM/WHITEPAPERS/THREATS/GENERATINGHYPOTHESES-SUCCESSFUL-THREAT-HUNTING-37172

H T T PS : //CO L L A B O R AT E . M I T R E .O RG /AT TAC K I C S

H T T P S : // W W W . D R A G O S . C O M / M I T R E - AT TA C K- F O R - I C S /

H T T P S : // W W W . D R A G O S . C O M / M I T R E - AT TA C K- F O R - I C S /

HUNTING FOR XENOTIME: PURPOSE
To uncover Xenotime behavior and activity currently present in and environment.
To provide architecture modifications to deny Xenotime easy access to environment
Recommend areas of data visibility and monitoring improvement to detect abnormal behavior

HUNTING FOR XENOTIME: SCOPE: LOCATION
TOP 3 OIL REFINERIES BY PRODUCTION
IT to OT Ingress/Egress Boundary
+ Remote Connections
OT Network
+ Safety Instrumentation System + Supporting Control Systems interacting with
SIS

HUNTING FOR XENOTIME: SCOPE: HYPOTHESES
Adversary is leveraging approved remote connections (RDP and VPN) from the IT network to gain access to the OT network.
Adversary is sending malicious commands from the SIS workstation to the SIS controllers attempting to disrupt system functions.
Adversary is conducting reconnaissance by accessing internet enabled servers over SMB and RDP

HUNTING FOR XENOTIME: EQUIP: CMF

Data Source Perimeter Firewall Logs Windows Event Logs - Internet enabled servers Network Traffic ­ IT Network Traffic ­ OT (Including SIS) Host logs from SIS Process Historian VPN Concentrator Intrusion Detection System

Storage Duration ~2 weeks ~4 days
~7 days ~7 days None available 5 years ~4 weeks Deployed in IT, not OT

HUNTING FOR XENOTIME: EQUIP: CMF

Adversary is leveraging approved remote connections (RDP and VPN) from the IT network to gain access to the OT network.

Data Source Perimeter Firewall Logs Windows Event Logs - Internet enabled servers Network Traffic ­ IT Network Traffic ­ OT (Including SIS) Host logs from SIS Process Historian VPN Concentrator Intrusion Detection System

Storage Duration ~2 weeks ~4 days
~7 days ~7 days None available 5 years ~4 weeks Deployed in IT, not OT

HUNTING FOR XENOTIME: EQUIP: CMF

Adversary is sending malicious commands from the SIS workstation to the SIS controllers attempting to disrupt system functions.

Data Source Perimeter Firewall Logs Windows Event Logs - Internet enabled servers Network Traffic ­ IT Network Traffic ­ OT (Including SIS) Host logs from SIS Process Historian VPN Concentrator Intrusion Detection System

Storage Duration ~2 weeks ~4 days
~7 days ~7 days None available 5 years ~4 weeks Deployed in IT, not OT

HUNTING FOR XENOTIME: EQUIP: CMF

Adversary is conducting reconnaissance by accessing internet enabled servers over SMB and RDP

Data Source Perimeter Firewall Logs Windows Event Logs - Internet enabled servers Network Traffic ­ IT Network Traffic ­ OT (Including SIS) Host logs from SIS Process Historian VPN Concentrator Intrusion Detection System

Storage Duration ~2 weeks ~4 days
~7 days ~7 days None available 5 years ~4 weeks Deployed in IT, not OT

HUNTING FOR XENOTIME: EQUIP: RESOURCES
TEAM RESOURCES
Senior and Junior Analysts OT Operators Network Admins Any SME on Network
TOOLS
ICS Security Technology (Dragos Platform...obviously) Or Open-Source Tools (Zeek/YARA)
TIME ALLOTMENT

HUNTING FOR XENOTIME: PLAN REVIEW
Does the plan achieve the purpose? Are more resources required? Is management okay with plan moving forward? Has anything changed?

HUNTING FOR XENOTIME: EXECUTE
Analyze data sources for Xenotime behaviors as observables across all hypotheses
Create a report summarizing all findings Report should be focused on conveying how the hunt achieved the "Purpose"

HUNTING FOR XENOTIME: FEEDBACK
Was 3 facilities too large a project for time allotment?
Is it possible to automate this hunt into stable detections?
How can we be more efficient?

f
RLEE@DRAGOS.COM @ROBERTMLEE

