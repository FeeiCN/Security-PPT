#RSAC

SESSION ID: AFD-R02
Combatting Cybercrime and Fraud with Threat Intelligence

Mary C. Yang
Chief Marketing Officer LookingGlass Cyber Solutions @techgirlmary

Matthew J. Swenson
Special Agent & Division Chief Homeland Security Investigations (HSI), Cyber Crimes Center (C3)

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC

#RSAC
2021
847,376 complaints, up 7% from 2020. $6.9B+ in estimated losses

2021: Deja Vu
7,000,000 6,000,000

Growth in internet crime complaints

#RSAC
2021: 6.5 million complaints

Total number of incidents reported

5,000,000 4,000,000 3,000,000 2,000,000

2010: 2 million complaints

2014: 3 million complaints

2017: 4 million complaints

2020: 5 million complaints

1,000,000
2007: 1 million complaints
0 2000 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021
Statistics from the Internet Cyber Crime Center, www.ic3.gov
5

#RSAC
Cybersecurity Attacks vs Cybercrime vs Fraud
Cybersecurity attacks often focus on breaching government or corporate networks. Cybercrime has typically targeted individuals or people as they navigate online life.
­ Ransomware as a type of cybercrime has grown significantly for businesses over the last few years.
Fraud is wrongful or criminal deception that results in financial or personal gain for the fraudster.
6

#RSAC
Leveraging Threat Intelligence & DNS
Cybersecurity approaches can help combat cybercrime & fraud. Enriched Domain Name System (DNS) intelligence:
­ Domain information and reputation ­ Threat intelligence ­ Context and behavior
7

#RSAC
Step 1: Identify Relevant Domains
February 11: World Health Organization named the global health emergency as "COVID-19"
­ Attackers started to actively deploy opportunistic campaigns ­ The following week, attacks increased eleven-fold*
Large-scale data collection of newly registered domains
­ Domain name registrations grew by 14.9 million, or 4.2 percent, in 2020 (vs 2019)
Filter for related terms used in the domains (e.g., COVID-19 terms)
*Government Technology, Does the Pandemic Explain Recent Spikes in Cyber Crime?, June 2021
8

#RSAC
Step 2: Enrich domain information
Leverage cyber threat data and contextual data to enrich the websites to prioritize which sites need actual investigation. Automated enrichment:
­ Identifying the IP hosting the website ­ Network hierarchy and ownership of the IP ­ Whois record and registrant ­ Any associated cyber threat data
9

#RSAC

#RSAC
Step 3: Layer in Context and Behavior
Threat actors positioned websites to drive traffic Automated context
­ Domain squatting ­ Soliciting donations (i.e., fake charities)
Manual context
­ Offering news and/or opinions about COVID-19 ­ Selling products and/or services related to COVID-19 (i.e., fake PPE) ­ Promoting products and/or services related to COVID-19 ­ Copycat sites of legitimate orgs, including government sites, with the use of
official logos and branding
11

#RSAC
Risk Scoring for Prioritization
Example: "covidhcl[.]com" has a risk score of 59, an elevated severity, and is actively associated w/ stealing credentials.

#RSAC
Results
Of 125,000 malicious COVID-19 sites reviewed, top five associated threat behaviors:
­ 64% were acting as malware C2s ­ 52% as spyware ­ 20% as sites to "steal" credentials and/or PII ­ 20% as marketplaces selling fake antivirus products ­ 17% observed delivering malware
13

#RSAC
Domain Targeting
Identifying those taking advantage of the COVID-19 pandemic with illicit, financial fraud schemes

#RSAC
Concept & Inception
Beginning in March 2020, HSI Cyber Crimes Center (C3) was receiving a daily feed of new domains using COVID-19 terms. Develop a workflow using custom script to parse out suspect domains from legitimate domains. Used tools to automate process:
­ Antivirus tools ­ URL scan ­ Cyber threat tools ­ API keys ­ Open-source intelligence
15

Domain Targeting Workflow

STAGE 1
Data Collection

STAGE 2
Domain Pattern Matching

STAGE 3
Verification

STAGE 4
Data Enrichment

STAGE 5
Finalized Leads

#RSAC

16

Domain Targeting Workflow
Stage 1 ­ Data Collection

STAGE 1
Data Collection

STAGE 2
Domain Pattern Matching

STAGE 3
Verification

STAGE 4
Data Enrichment

STAGE 5
Finalized Leads

#RSAC

~3,000­4,000
Domains Identified Daily
17

Pandemic

Pfizer

cure Moderna

#RSAC

#RSAC
Domain Targeting Workflow Stage 1 ­ Data Collection
C3's obtains lists of generated domains and its subscription platforms: ­ Examine domain certificates in real-time.
Domain certificates are easy to obtain (often self-generated) and can be populated with fraudulent information. ­ Publish "unvetted" domains. It is extremely easy to purchase domains in bulk and have a site up and running within hours. HSI monitors these feeds and reports.
19

Domain Targeting Workflow
Stage 2 ­ Domain Name Matching

STAGE 1
Data Collection

STAGE 2
Domain Pattern Matching

STAGE 3
Verification

STAGE 4
Data Enrichment

STAGE 5
Finalized Leads

#RSAC

~200­300
Domains Analyzed Daily
20

#RSAC
Domain TargetingcWure ovrakcfclinoew Stage 2 ­ DomainkNit ashmop eteMst atching
Based on Stage 1 dChalotrao,quHinSeI then:
­ Automated searches for keywords to identify potential domains related to COVID-19 fraud activities.
­ Performs manual verification of identified domains.
In addition, HSI examines secondary marketplaces for additional sellers.
21

Domain Targeting Workflow
Stage 3 ­ Verification

STAGE 1
Data Collection

STAGE 2
Domain Pattern Matching

STAGE 3
Verification

STAGE 4
Data Enrichment

STAGE 5
Finalized Leads

#RSAC

~100­150
Domains Identified Daily for Follow-up
22

#RSAC
Domain Targeting Workflow Stage 3 ­ Verification
Identified domains from Stage 2 are triaged by HSI for follow-up, and a manual assessment is performed. C3:
­ Examines domains to see if they are serving malware and viruses to visitors.
­ Identifies the hosting platform and country of suspicious domains. Domains must be U.S.-based and consist of an active e-commerce website to be escalated to Stage 4.
23

Domain Targeting Workflow Stage 4 ­ Data Enrichment

STAGE 1
Data Collection

STAGE 2
Domain Pattern Matching

STAGE 3
Verification

STAGE 4
Data Enrichment

STAGE 5
Finalized Leads

#RSAC

~5­10
"Deep Dives" on Domains Performed Daily
24

#RSAC
Domain Targeting Workflow Stage 4 ­ Data Enrichment
C3's subscription platforms scrub sites of investigative value. C3 contacts its ICANN partners to alert them of sites to suspend.
25

Domain Targeting Workflow Stage 5 ­ Finalize Leads

STAGE 1
Data Collection

STAGE 2
Domain Pattern Matching

STAGE 3
Verification

STAGE 4
Data Enrichment

STAGE 5
Finalized Leads

#RSAC

10 Up
to
Targets Developed Daily
26

#RSAC
Domain Targeting Workflow Stage 5 ­ Finalize Leads
HSI sends C3 leads identified for dissemination.
­ C3 passes leads to HSI field offices based on their AOR. ­ Leads include identified person(s) and/or business(es).
HSI examines ATS cargo import data along with 3rd party information database checks (e.g., CLEAR, Dept. of Licensing) for information related to shipments with suspicious origins or labels.
The National Cyber-Forensics & Training Alliance (NCFTA) deconflicts with other agencies.
27

#RSAC
Disruption & Leads

Once a suspect domain is identified, C3 puts that domain down one or two paths for disruption and lead distribution.

Referred to domain registrar for disruption
Develop and distribute a lead package for a field office
Both can run concurrent due to public safety and to prevent further victimization

123 cyber investigations 378 domains disrupted 6 criminal website seizures Numerous arrests

108 leads sent to the field

28

#RSAC
Operation Stolen Promise Cyber Operation

Began in April 2020, daily proactive operation targeting cyber criminals who use publicly reachable websites to exploit the pandemic.

Cyber-Enabled
­ Financial fraud, supply fraud, miracle cures/vaccines, counterfeit COVID-19 supplies
Cyber-Dependent
­ Malicious websites ­ Phishing/spoof websites

Cyber Threat Actors
­ Darknet markets ­ Stolen PII, Cybercrime kits
220,000+ Domains identified
76,000+ Domains analyzed

29

#RSAC

#RSAC
Apply What You Have Learned Today (1 of 2)
Next week you should:
­ Identify local resources (i.e., FBI field office, DHS CISA regional office) and find out the process for obtaining technical and investigative support
­ Understand current cybersecurity capabilities in your toolbox:
Sink-holing Newly registered domain feed
­ Engage cyber/fraud counterparts within your organization to understand internal resources and capabilities
31

#RSAC
Apply What You Have Learned Today (2 of 2)
In the first three months following this presentation you should:
­ Identify words/phrases associated with your organization or current events that could be used for cybercrime and fraud
­ Define automated process for filtering newly registered domains based on keywords/phrases
­ Explore automated enrichment options to filter list of domains to investigate
Within six months you should:
­ Track initial investigations of enriched domains to calculate impact ­ Stand up a small working group to review incidents and gather information
that can support improved cyber and fraud defenses
Leverage operations for future events (i.e., Russian/Ukraine conflict)
32

