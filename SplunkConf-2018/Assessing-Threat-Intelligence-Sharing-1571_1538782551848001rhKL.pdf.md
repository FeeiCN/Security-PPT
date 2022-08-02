© 2018 SPLUNK INC.
Assessing Threat Intelligence from Sharing Communities
A review and analysis approach
Ken Towne | Global Resilience Federation Glenn Wong | Recorded Future

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Agenda
 Introduction ­ Sharing Communities  Need for Assessment  Analysis Methodology  Results  Impact and Next Steps

© 2018 SPLUNK INC.

SHARING THREAT INTELLIGENCE

© 2018 SPLUNK INC.

ISAC ISAO

OVERVIEW OF ISACs, ISAOs

© 2018 SPLUNK INC.

 Information Sharing and Analysis Centers (ISACs), as defined by EO 12472 and the national critical infrastructure protection goals of Presidential Decision Directive 63 (PDD-63), were already essential drivers of effective cyber security collaboration for specific industrial sectors such as banking and financial services, energy, telecommunications and defense, as examples. ISACs are trusted entities established by Critical Infrastructure Key Resource (CI/KR) owners and operators to provide comprehensive sector analysis, which is shared within the sector, with other sectors, and with government.
 An Information Sharing and Analysis Organization (ISAO) is a group created to gather, analyze, and disseminate cyber threat information. Unlike ISACs, ISAOs are not directly tied to critical infrastructure sectors, as outlined in Presidential Policy Directive 21. Instead, ISAOs offer a more flexible approach to self-organized information sharing activities amongst communities of interest such as small businesses across sectors: legal, accounting, and consulting firms that support cross-sector clients, etc.

GRF

OVERVIEW OF GRF

© 2018 SPLUNK INC.

 The Global Resilience Federation (GRF) is a private sector non-profit organization that brings together Intelligence organizations to collect, analyze and share cyber and physical threat intelligence for mutual defense. GRF works with members to analyze and mitigate risks in ways that complement companies' own efforts; from tracking systems vulnerabilities to providing indepth reporting. GRF works to enrich security products and strengthen the overall awareness and actionability of global threat intelligence. GRF provides reports to CSOs and CISOs while exchanging cross-sector intelligence within a multi-industry defensive network of more than 7,000 organizations. Intelligence is drawn from other ISACs and ISAOs, government partners, and private vendors curated independently, collaborated, and trust intelligence source providers tailored toward its supported industry focus'.

© 2018 SPLUNK INC.
Challenges in Assessing Shared Threat Data

Multiple standards
Despite industry attempts to s standardize threat sharing, multiple formats still exist

Arbitrary confidence
Proprietary and non-proprietary methods are used to assign confidence and risk scores

Source reputation
No consistent way to assess validity and importance of different sources

Industry impact
Threat Intelligence can have varying applicability across industries

One size does not fit all
Members/Customers have diverse risks, infrastructure, and tools for leveraging Threat Intelligence

METHODOLOGY

© 2018 SPLUNK INC.

 Pull representative sample of data from GRF repository · IP addresses, Hashes, domains · Multiple sources, including sharing communities, open sources, and commercial
third parties
· Enrich with additional metrics and information [from Recorded Future]

 Review
· Descriptive statistics on collected data · Determine similarities and differences among different sources and scoring
methods

© 2018 SPLUNK INC.
GRF typically processes 100k-200k observables / week
Ingest of 258k+ compromised email addresses

© 2018 SPLUNK INC.
GRF'S collection comes from a wide range of sources

Source Type Analyst Commercial Government ISAC Open Source SANS

# of feeds 1 8 3 4 45 3

# of IOCs 9/3/189/10/18 2,956 99,895 8,133 5,835 33,029 14

% of Total IOCs 2% 67% 5% 4% 22% 0%

TOTAL

64

149,862

100%

© 2018 SPLUNK INC.
2/3 of IOCs from Commercial Providers; 1/4 from OSINT

SourceType Commercial Provider OpenSource Government ISAC Analyst SANS
TOTAL

count 99,895 33,029 8,133 5,835 2,956 14
149,862

© 2018 SPLUNK INC.
2/3 of Observables are Hashes; 1/4 are IPs

* Active Observables as of 9/28/18 collected from Sept 3-10, 2018

IOCtype Hash IP URL Domain Other
TOTAL

count 99,182 38,109 5,078 4,371 3,122
149,862

© 2018 SPLUNK INC.
~2/3 of non-hash threat intel is from open source

SourceType OpenSource Government ISAC Commercial Provider Analyst SANS
TOTAL

count 32,470 8,055 4,961 2,671 2,509 14
50,680

Coverage Overlap varies by IOC type

© 2018 SPLUNK INC.

IOC Type URL Domain IP Hash

# of unique entries 1,588 2,078 32,535 97,420

# records 5,078 4,371 38,109 99,182

% unique IOCs 31% 47% 85% 98%

Some considerations:

· "trend" of # unique entries with % unique · URL, Domain data  smaller volumes, usually viewed as higher quality · IP  known to be noisy · Hash  reflection of sources chosen

More references can help...

© 2018 SPLUNK INC.

...but additional context is even better

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
A collective scoring method vs GRF collection
GRF Severity
Vendor criticality ("Very
Malicious", "Malicious",
etc.)

IMPACT AND NEXT STEPS

© 2018 SPLUNK INC.

 Data redundancy as expected · High priority to determine "good" vs "bad" redundancy
 Source validity and confidence are abstract · Continued need to develop better scoring methods (crowd sourcing, historic reliability, source
reputation)
 Direct member contributions are small % of indicators · ISACs/ISAOs need to find ways to simplify feedback and sharing while respecting privacy · Large open source dataset still needed for comparable threat landscape

Sharing

© 2018 SPLUNK INC.

Our Speakers

© 2018 SPLUNK INC.

v

KEN TOWNE
Director of Technology Global Resilience Federation
ktowne@grfederation.org

GLENN WONG
Director of Product Management Recorded Future
glenn@recordedfuture.com

