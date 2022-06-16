SESSION ID: DSO-M03
Tooling Up ­ Getting SBOMs to scale

Allan Friedman
Senior Advisor & Strategist CISA @allanfriedman

Kate Stewart
VP, Dependable Embedded Systems Linux Foundation @_kate_stewart

#RSAC

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Paying attention or looking for lunch?
· Remind me what an SBOM is again? · Motivation · Tooling taxonomies · Challenges & open questions for SBOM automation · Next steps for the tooling ecosystem · What you can do
3

#RSAC
SBOMs provide transparency in the SW market

CC BY-NC-ND Katrin Park / International Food Policy Research Institute / 1 June, 2016

4

#RSAC
SBOMs provide transparency in the SW market

CC BY-NC-ND Katrin Park / International Food Policy Research Institute / 1 June, 2016

5

{

"SPDXID": "SPDXRef-DOCUMENT",

"spdxVersion": "SPDX-2.2",

"creationInfo": {
So what's an SBOM again? "created": "2021-06-22T00:00:18Z",
"creators": [
"Tool: CycloneDX-CLI"
]

},

"name": "Generated from CycloneDX BOM without top level component metadata",

"dataLicense": "CC0-1.0",

"hasExtractedLicensingInfos": [

{

"licenseId": "LicenseRef-1",

"extractedText": "[Initialized with license Parser. The actual license text is not available]",

"name": "BSD-3-Clauses"

}

],

"documentNamespace": "http://spdx.org/spdxdocs/Generated from CycloneDX BOM without top level component metadata-e11047c1-a494-41c7-8a66-6f5e9a8836b7",

"documentDescribes": [

"SPDXRef-7"

],

"packages": [

{

"SPDXID": "SPDXRef-7",

"checksums": [

{

"algorithm": "SHA256",

"checksumValue": "4721a79c2bccc25481930dffbfd06f40851321c3d679986af307111214bf124c"

}

],

"copyrightText": "NOASSERTION", "downloadLocation": "NOASSERTION",

Bingo

"filesAnalyzed": false, "licenseConcluded": "NOASSERTION", "licenseDeclared": "LicenseRef-1", "name": "dns", "versionInfo": "2.2.0" },

Buffer v2.1
unknown

Included in

Acme

{ "SPDXID": "SPDXRef-8",

Application

"checksums": [ {

v1.1

"algorithm": "SHA256", "checksumValue": "df791dc276652fcfb53be4dab823e05f8269b96ac57c26f86a67838dbc0eefe7"

Included in

known

} ],

Carol's

Bob's

"copyrightText": "NOASSERTION", Compression
"downloadLocation": "NOASSERTION",

"filesAnalyzed": false,

Engine v3.1

"licenseConcluded": "NOASSERTION",

"licenseDeclared": "Apache-2.0", "name": "system_registry",

root

"versionInfo": "0.8.2"

},

Included in
Known Unknowns

Browser v2.2
partial

{

"SPDXID": "SPDXRef-9",

"checksums": [

{

"algorithm": "SHA256",

"checksumValue": "fc23870fb6b470f5c520fee692637b120a36e163842ab497bbec7e8a1aa6cfe3"

}

],

"copyrightText": "NOASSERTION",

"downloadLocation": "NOASSERTION",

Supplier Component
Version Identifiers
Author

#RSAC
6

#RSAC

Supply Chain

Risk Management

Secure Development Process

SBOM

Vulnerability Management

Produce Software

Choose Software

Operate Software

A Software Bill of Materials (SBOM) is effectively a list of ingredients or a nested inventory. It is "a formal record containing the details and supply chain relationships of various components used in building software"
.
7

#RSAC
Motivation
· We're ready for SBOM!
­ Many of you want this. ­ Some of you will have to do it... ­ See: Executive Order 14028*
· Doing this at scale requires tools

*https://www.whitehouse.gov/briefing-room/presidential-actions/2021/05/12/executive-order-on-improving-the-nations-cybersecurity/

Photo by cottonbro: https://www.pexels.com/photo/aperson-holding-a-clay-pot-on-the-wooden-table-6692598/
8

#RSAC

Source: https://www.linuxfoundation.org/tools/the-state-of-software-bill-of-

materials-sbom-and-cybersecurity-readiness/

9

#RSAC
Source: https://www.linuxfoundation.org/tools/the-state-of-software-bill-ofmaterials-sbom-and-cybersecurity-readiness/
10

#RSAC
Goal: Supporting an accessible, competitive marketplace
· A resource where tool providers can list themselves · A resource where those looking for tools can find them · A fair marketplace with transparent governance · Standard/format neutral · Includes open source and proprietary solutions · Welcoming of novel solutions over time
11

#RSAC
SBOMs in the lifecycle of software
Source: NTIA's Survey of Existing SBOM Formats and Standards
12

#RSAC
Source SBOM - software sources imported used to build binary executable image.
Build SBOM - List of components and relationships between dependent components assembled to create a product released from Supplier.
Binary Analysis SBOM - executable image to be integrated into deliverable. Created from 3rd party heuristics.
Deployed SBOM - Tracking configuration options on how a product has been deployed by User.
13

#RSAC
What is a Minimum SBOM?
Source:https://www.ntia.gov/files/ntia/publications/sbom_minimum_elements_report.pdf.
14

#RSAC

What about the tooling?

What about the Tools?

15
Source: Pierre Metivier (https://flic.kr/p/rdHr) CC BY-NC / Desaturated from the original

#RSAC
Taxonomy for Classifying SBOM Tools

Category
Produce Consume Transform

Type
Build
Analyze
Edit View
Diff
Import
Translate Merge Tool support

Description
SBOM is automatically created as part of building a software artifact and contains information about the build
Analysis of source or binary files will generate the SBOM by inspection of the artifacts and any associated sources
A tool to assist a person manually entering or editing SBOM data
Be able to understand the contents in human readable form (e.g. picture, figures, tables, text.). Use to support decision making & business processes
Be able to compare multiple SBOMs and clearly see the differences (e.g. comparing two versions of a piece of software)
Be able to discover, retrieve, and import an SBOM into your system for further processing and analysis
Change from one file type to another file type while preserving the same information
Multiple sources of SBOM and other data can be combined together for analysis and audit purposes
Support use in other tools by APIs, object models, libraries, transport, or other reference sources

More details in: https://www.ntia.gov/files/ntia/publications/ntia_sbom_tooling_taxonomy-2021mar30.pdf

16

#RSAC
Other ways of classifying SBOM tools

#RSAC
Other ways of classifying tools
· Generation vs. Consumption · By the Lifecycle of software
· Technical ecosystem · Sector-specific tools · Open source vs proprietary · First party / third party · Data management and configuration management
· Tracking what has been updated · Also an asset management story
18

#RSAC
Generation made easy ­ single line cmds
· Docker
19

#RSAC
Generation made easy ­ single line cmds
· Docker
20

#RSAC
Generation made easy ­ single line cmds
· Docker · Yocto · Zephyr · ... more coming
New production tools are emerging daily, but challenge is organizations need a place to find them, and find the right type of tool for the task!
21

#RSAC
Consumption tools

Data

Intelligence

Action

22

#RSAC
Consumption tools

Data

Intelligence

Action

· Simple use case: detecting vulnerabilities
­ Grep NVD ­ Map to other sources of data ­ Entity disambiguation
· Integration into existing security tools
­ Asset management ­ Vulnerability management ­ CMDB ­ Data Lake
23

#RSAC
Consumption tools

Data

Intelligence

· Simple use case: detecting vulnerabilities
­ Grep NVD ­ Map to other sources of data ­ Entity disambiguation
· Integration into existing security tools
­ Asset management ­ Vulnerability management ­ CMDB ­ Data Lake

Action
Tools starting to do this:
SW360 OWASP DependencyCheck Daggerboard (coming soon!) ... and of course, commercial offerings!
24

#RSAC
Challenges & Open Questions for Automation

#RSAC
Delivering SBOMs: discovery and access

26

Photo by Artem Podrez from Pexels

#RSAC
Plumbing
· All infosec problems eventually become data management problems
· How will I get my SBOMs · How to store our piles of SBOMs? · How do we find the relevant info in
our SBOMs? · Integration into existing data flows

Photo by jiawei cui: https://www.pexels.com/photo/chrome-pipe-lines-2310904/

27

Software by any other name...

#RSAC
"There are only two hard things in Computer Science: cache invalidation and naming things."
- attributed to Phil Karlton
28

#RSAC
Challenge: Vulnerability vs Exploitability
Solution: "Vulnerability Exploitability eXchange" (VEX)
29

#RSAC
SBOM ­ to include vulnerabilities or not?
· Tooling across organizations: how to keep data current?
· Mapping VEX documents to SBOMs and other data
· Tools for VEX creation and consumption
­ Early days: https://secvisogram.github.io/
· Work flows for lifecycle
· E.g. ­ VEX documents replace other VEXes. · E.g. - Do earlier VEX docs apply to later products?
30
Photo by Caroline Selfors on Unsplash

#RSAC
Where to find more info on tools?

CycloneDX: cyclonedx.org/tool-center/ or tiny.cc/CycloneDX
SPDX: spdx.dev/resources/tools/ or tiny.cc/SPDX
SWID: tiny.cc/SWID

Need to see a summary in a neutral location that is Standard/Format

NeutraAl ntoyoanlleowcaanmnoormeinoapteentoporol ctoesbseaandddewdidteor

set of a list

visible

reviews.

 Point to evidence of producing, consuming or transforming of

SBOM documents to get tool on the list (this includes participating

in Plugfest)

31

#RSAC
Translating Between SBOM Formats and Filetypes
· SwiftBOM: (SPDX(.spdx), SWID(.xml), CycloneDX(.xml,.json))
­ Demo at: https://democert.org/sbom/ ­ Source code at: https://github.com/CERTCC/SBOM/tree/master/sbom-
demo
· SPDX online tools: ( SPDX (.spdx, .json, .yaml, .rdf, .xml, .xls) )
­ Demo at: https://tools.spdx.org/app/ ­ Source code at: https://github.com/spdx/spdx-online-tools
· CycloneDX CLI: ( CycloneDX (.xml, .json), SPDX(.spdx))
­ Source code at: https://github.com/CycloneDX/cyclonedx-cli
32

#RSAC
Next steps for the tooling ecosystem
· Join the "Tooling & Implementation" work stream through CISA
· July 13, 2022 ­ 3:00-4:30pm ET · July 21, 2022 ­ 9:30-11:00am ET · Sign up: SBOM@cisa.dhs.gov
· "Plugfests" to be announced · Case studies of organization adoption of tools &
reference tooling workflows
33

#RSAC
What can your organization do?
· Next week: Understand origins of software your organization is using
­ Commercial - can you ask for an SBOM? ­ Open Source - do you have an SBOM for the binary or sources you're importing?
· Three months: Understand what SBOMs your customers will require
­ Expectations - which Standards, dependency depth, licensing info?
· Six months: Prototype and Deploy
­ Implement SBOM through using an OSS tool and/or starting conversation with vendor
If your organization think this is important enough to help: · Participate in ongoing discussions to determine best practices for ecosystem · Contribute to open source project any code developed to support
34

#RSAC
What can you do?
· Next week: start playing with an Open Source SBOM tool and apply it to a repo · Three months: Have an SBOM strategy that explicitly identifies tooling needs · Six months:
­ begin SBOM implememention through using an OSS tool or starting conversation with vendor
­ Participate in a Plugfest, and try to consume another's SBOM
If you think this is important enough to help: · Tools exist, both open source and commercial. Make sure the ones you find most
useful are listed. · Work with the tools to help harden them, test and report bugs, push them to scale
35

