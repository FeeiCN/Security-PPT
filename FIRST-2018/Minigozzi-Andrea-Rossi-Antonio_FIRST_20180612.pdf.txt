Malvertising: an Italian tale
Antonio Rossi (CERT manager) Andrea Minigozzi (Team leader in Cyber Threat Intelligence)
TLP: GREEN

About us

7 Joint ventures and controlled company: Leonardo DRS (100%), Telespazio (67%), Thales Alenia Space (33%), MBDA (25%), ATR (50%), Avio (21%), Elettronica (31%)

7 Divisions: Helicopters, Aircraft, Aerostructures, Airborne & Space Systems, Land & Naval Defence Electronics, Defence Systems, Security & Information Systems.

Since
1875

Leonardo is an Italian global high tech company that operates in Aerospace, and Security sector worldwide Defense
since early years of the last century;

TLP: GREEN

LOADING...

THE CREW
TLP: GREEN

LOADING...

SCENARIO [LOG IN]

The asset involved in the incident with specific policy and
custom configuration

The USB internet key providing UMTS internet access
# the policy exception

The compromised advertisement hosted
by adults website
# the trigger condition

# the PC user

TLP: GREEN

STARTING DOWNLOAD

Events Time LAinbeout us

HO(@ST17c:o0n0nGecMtioTn+2to)IomCparlsiochtieoacuretsidoInPbypothliceeC(r@itic1Io1aC:ls2ienu7cfpruGalorMsiattyrdTupe+cld2atu)tifnroetromth(e@eA1nl8edp:r3ltpa8totrfGioingrMtgmeTrs+eig2dn)baytuerned(R@peom0min9aot:t3tcse5heHicnGuOgMrSistTyiTg+nc2ao)tnutraeinD(m@igcei1otna4mtl:0dpfo7uroreeGmntMhisseiTecd+Iao2HcC)qOuSisTiti(o@Snt1oa(2@frt:t0ho05ef8:dG0ig0MitGTa+lMf2oT)r+e2n)sicsRaeenbnauGtliyeldMsrpiscTroi+sm2e)psrtoamndisaerdd

hbousildt w(@ith0t8h:e00 Incide1n7t:R00epGoMrtT+2) (@

05/10/2017 09/10/2017 09/10/2017 10/10/2017 10/10/2017 16/10/2017 19/10/2017 26/10/2017 17/11/2017

TLP: GREEN

DOWNLOADING: 08%

Focus on digital forensic acquisition

Recon.

Verify

Type of acquisition
Size

Secure store env.
Analysis process

Acquire

Wipe / Kill data
TLP: GREEN

DOWNLOADING: 10%

What's happened: the road to accident
· User power on his laptop and complete the login process with his username and password;
· a Huawei USB stick (UMTS) has been plugged in; · Internet connection has been established via USB UMTS modem; · user browses on xhamster[.]com domain and search for a keyword
(«flashing»); · after 14 pages the malicious ADS frame has been rendered by
Firefox browser, starting the redirection to malicious content;

TLP: GREEN

DOWNLOADING: 18%

Digital Forensic Investigation bookmark #1
User browses 15 pages of search results for the keyword «flashing» on «it[.]xhamster[.]com» via Mozilla Firefox, then he displays the malicious banner within the results page

Keyword search and
page number
TLP: GREEN

Redirection completed
in 3 seconds
DOWNLOADING: 20%

Digital Forensic Investigation bookmark #2

ADS impression
Fake ADS banner is displayed
Hidden iFrame (1x1 pixel top-left)
TLP: GREEN

DOWNLOADING: 28%

Digital Forensic Investigation bookmark #3

Source: https://www.bleepingcomputer.com/news/security/google-adds-new-features-in-chrome-to-fight-malvertising/
TLP: GREEN

DOWNLOADING: 33%

Digital Forensic Investigation bookmark #4
Malvertsing campaigns can exploit the profiling capabilities of ADS networks, in order to target only selected users (country, industry sector, interests, user behaviour, etc...). In this case the malicious ADS uses profiling keywords «voyeur», «public» and «nudity» correlated to the typed keyword «flashing»

Keyword searched by
the user

Keywords added by
ADS network

TLP: GREEN

DOWNLOADING: 35%

Digital Forensic Investigation bookmark #5
The malicious code has been found within Firefox Cached entry «43957EDAE7E6FEED868C423F6657F6E2D0478FD5». This file is identified by MFT FileID 246005. Analyzing the MFT entries and sorting it by FileID, we can easily recover the JPG artifacts related to malicious ADS (FileID 246007)
FileID

TLP: GREEN

DOWNLOADING: 40%

Digital Forensic Investigation bookmark #6
Endpoint Security Solution, previously feeded with Government Agency IoC, has detected the
About us connection to the malicious IP address:

The malicious AD redirect the user against the alerted IP, but at that time the resolved domain was already changed to wucheecofriend[.]org, instead of phohww11888[.]org.

TLP: GREEN

DOWNLOADING: 45%

Digital Forensic Investigation bookmark #7
Virus Total Report for 192[.]129[.]215[.]155 on 2017-10-01

Very low detection rate
TLP: GREEN

Fake Firefox Updater used to
install the malware in case of Mozilla Firefox

DOWNLOADING: 50%

The security bulletin dispatched by the critical infrastructure Italian police
Notification e-mail

IoC list
TLP: GREEN

DOWNLOADING: 52%

Triggered signature in end point security platform

TLP: GREEN

DOWNLOADING: 57%

Incident Response Case Management #1

Case details
Case metadata
as TLP and Tags

Easily correlate events and incidents

TLP: GREEN

DOWNLOADING: 60%

Incident Response Case Management #2

TLP: GREEN

Analyze observables against several analyzers for fast and reliable response

Several analyzers are available for different platforms and feeds thanks to the community contribution

Every single IoC can be correlated with all the other cases.

DOWNLOADING: 68%

LDO-CERT contribution to «The Hive Project»

TLP: GREEN

DOWNLOADING: 70%

Tools used during the investigation:
EnCase Forensic has been used for Digital Forensic on the acquired Hard Disk image. MISP has been used to share IoC
The Hive has been used to manage the case, the actions and analyze indicators Mandiant Redline has been used to analyze malicious artifacts
SANS SIFT Workstation (FOR.508) has been used primarily to analyze RAM dump via volatility and then to process several other Windows artifacts.

TLP: GREEN

DOWNLOADING: 75%

Attack attribution and Cyber Threat Intelligence enrichment
Based on OSINT information available in MISP and The Hive platform, we can easily and quickly attribute the incident to Kovter Group and its malvertising campaign. The original Proofpoint® report has been used to confirm step-by-step our investigation and findings.
The victim's computers was not infected by the malware due a lucky timing: when the user browsed the infected site, a redirection chain started but the exploit kit wasn't delivered due the change of the domain name, few hours before the signature alert.

TLP: GREEN

DOWNLOADING: 78%

LESSON LEARNED #1
· Usable and applicable security policy; · Awareness about cyber risks, through periodically and dedicated actions vs
users targetted by cybersecurity incident, improving training and communication; · Apply disciplinary measures for policy violation; · Limit the use of external connection, considering the exception or special needs
driven by the business, improving security controls also evaluating the «security posture» of the user before allowing the exception.

TLP: GREEN

DOWNLOADING: 80%

LESSON LEARNED #2
Create a dedicated intranet portal accessible by all employees to inform about security and cyber security threats.
TLP: GREEN

DOWNLOADING: 85%

Wiping Killing data policy

TLP: GREEN

DOWNLOADING: 90%

[LOG OUT]
TLP: GREEN

DOWNLOADING: 95%

+39 0871 554571 [24/7 365 days] cert@leonardocompany.com www.leonardocompany.com/cert
TLP: GREEN

DOWNLOAD: COMPLETE

