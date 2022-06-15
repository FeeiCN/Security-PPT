© 2018 SPLUNK INC.
The Hitchhiker's Guide to Splunk Validated Architectures
Stefan Sievert, Principal Architect Eric Six, Staff Architect
October 2018 I Version 1

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Who are these guys?!

© 2018 SPLUNK INC.

v

STEFAN SIEVERT
Principal Architect (Seattle)

ERIC SIX
Staff Architect (Tokyo)

This solution ain't gonna architect itself...

© 2018 SPLUNK INC.
Agenda
Am I in the right session?

Agenda
 What are SVAs and why do they exist  Where you can find the content  Scope and Structure of SVAs  Example Scenarios  Future Plans for SVAs  Q&A

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Splunk Validated Architectures
A refresher on "what" and "why"

© 2018 SPLUNK INC.
" Provide guidance on selecting proven reference architectures for stable, efficient and repeatable Splunk deployments."
Topologies & their characteristics, and deployment best practices

© 2018 SPLUNK INC.

Primary Goals
Why we care

1. Put your Splunk deployment on a solid
architectural foundation
2. Meet your requirements exactly at
minimal TCO
3. Focus resources on value realization,
instead of fixing Splunk

Phased Development Approach
SVAs will evolve over time
 Phase 1: Focused on Indexing and Search Tiers
 Phase 2: Added Data Collection Tier components
 Phase 3: Making SVAs interactive
 Phase 4: Integrate with sizing calculators

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Problem & Solution
And who can benefit

Why SVAs?
The problem that needs solving
 Splunk deployments need a proven architectural foundation · Supportable · Scalable · Meeting Requirements · Best TCO
 "Issues" impede adoption and value realization
 "Issues" costing resources to troubleshoot and fix

© 2018 SPLUNK INC.

SVAs to the rescue!
How we address the problem

© 2018 SPLUNK INC.

 SVAs... · ...provide step-by-step guides and best practices, complementing our product documentation · ...empower you to architect, deploy and operate according to proven best practices · ...result in more stable, efficient and repeatable deployments... · ...that meet your requirements · ...will ensure your success with optimal TCO · ...will allow you to shift your resources from "analyze & fix" to "adopt & delight"

Who should care?
The target audience for SVAs
 Everyone... wins! · Customer Staff · Professional Services Staff · Splunk Partners · Splunk Staff

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
SVA Content Location
When the search engine fails...

Didn't bring your towel??

© 2018 SPLUNK INC.

 "Splunk Validated Architectures white paper site:splunk.com" OR  https://www.splunk.com/pdfs/white-papers/splunk-validated-architectures.pdf

© 2018 SPLUNK INC.
Scope & Structure
What SVAs cover and how to read them

SVA Scope
A quick tour
 SVAs DO... · ...address topology selection for indexing and search tiers · ...address data collection mechanism selection and architecture · ...provide best practices and design principles for implementation
 SVAs DO NOT... · ...contain sizing guidelines · ...address detailed deployment choices (OS, Cloud, etc) · ...cover every possible customer scenario

© 2018 SPLUNK INC.

SVA Structure
A quick tour
 The SVA document will guide you through a 3-step process:

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Example Scenarios
Walking through real-world examples

Use Case 1: New Deployment
 Brand New! Deployment.. · 100gb/day · Network Data Sources · No HA / DR for anything

© 2018 SPLUNK INC.

Use Case 1: Topology Selection

© 2018 SPLUNK INC.

https://www.splunk.com/pdfs/white-papers/splunk-validated-architectures.pdf

Use Case 1: Topology

© 2018 SPLUNK INC.

Use Case 1: Data Collection
 Identify required collection components via the second questionnaire · for this use case, let's assume you need Syslog data collection only

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
" One of the things I always found hardest to understand about Splunk Architects was their habit of continually stating and
repeating the very very obvious, as in `This Gin is amazing', or `Adding more Indexers will fix that problem'."
Unknown CTO - The Hitchhiker's Guide to the SVAs

Use Case 2: New "Large Deployment"
 Brand New, "Large" Deployment · 5tb/day, HA + DR requirements, Multi-DataCenter
deployment
· 5000+ UFs / Endpoints

© 2018 SPLUNK INC.

Use Case 2: Topology Selection

© 2018 SPLUNK INC.

Use Case 2: Topology

© 2018 SPLUNK INC.

Use Case 2: Data Collection

© 2018 SPLUNK INC.

 Large Deployments like this typically require multiple different mechanisms to acquire and collect log data
 Identify those mechanisms using the second questionnaire  Pay attention to the critical considerations, as they will affect performance
 Consider management approach for data collection tier configuration

Use Case 3: Inherited "Buckets O' Fun"
 Existing Deployment · Maybe-- 2tb/day · 3000+ UFs / Endpoints · Syslog Aggregates · DBX, AWS, OPSec LEA

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
The Future
What's next for SVAs?

What's in the | for SVAs

© 2018 SPLUNK INC.

 Turning SVAs into an interactive
tool · Go to a URL · Answer questions · Get your deployment diagram!

 Sizing Calculator Integration · Integration with Core and Premium
Sizing Calculators
· Generating a detailed deployment
diagram you can use to work off of

© 2018 SPLUNK INC.
Q&A
Got questions?

This is where the subtitle goes

© 2018 SPLUNK INC.

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

