SESSION ID: PDAC-R02
Software Bill of Materials: Progress toward Transparency of Third-Party Code

Allan Friedman, PhD Director of Cybersecurity Initiatives National Telecommunications & Information
Administration US Department of Commerce @allanfriedman

#RSAC

#RSAC
Should I pay attention or look at my phone?
Focusing on transparency in the software supply chain Understanding the NTIA process Finding common ground on what a Software Bill of Materials is Documenting the myriad use cases Identifying existing formats to implement Engaging to make the process better
2

Thinking about transparency
A bit of background

#RSAC
Analogies
INGREDIENTS, CHEMICAL SAFETY
We understand the role of a list of ingredients.
4

#RSAC
Analogies
5

#RSAC
Analogies
6

#RSAC
No longer just an "emerging" risk
Software Supply Chain Attacks

1
Study found credentials online affecting publishing access to 14% of npm repository. +79,000 packages.
Malicious npm Packages "typosquatted" (40 packages for 2 weeks. Collecting env including npm publishing credentials).

4 Golang go-bindata github id deleted and reclaimed.
5 Conventional-changelog compromised and turned into a Monero miner.

7 ssh-decorator Python Module stealing private ssh keys. 8 Gentoo Linux Repository Compromised.

2 10 Malicious Python packages
Basic info collected and sent to Chinese IP address
3 Blog: "I'm harvesting credit card numbers and passwords from your site. Here's how."

6 Backdoor discovered in npm getcookies module published since March.
Unauthorized publishing of mailparser.

9 Malicious Eslint discovered to be stealing npm credentials. 10 Homebrew repository compromised. 11 npm event-stream attack on CoPay.

July 2017
Image by Sonatype

Aug 2017

Sep 2017

Oct 2017

Nov 2017

Dec 2017

Jan 2018

Feb 2018

Mar 2018

Apr 2018

May Jun Jul 2018 2018 2018

Aug 2018

Sep 2018

Oct 2018

Nov 2018

Dec 2018

What we're doing about it
Enter your good friends at NTIA

#RSAC
9

#RSAC
Bottom-Up Approach
10

#RSAC
The policy side
THE MULTISTAKEHOLDER PROCESS
11

#RSAC
The "multistakeholder process"
Open, transparent, consensus based processes that bring together diverse stakeholders can catalyze real progress across the ecosystem.
12

#RSAC
What we're not doing
Regulation Source code disclosure
13

#RSAC
The problem to be solved
14

#RSAC
The problem to be solved
Modern software systems involve increasingly complex and dynamic supply chains.
15

#RSAC
The problem to be solved
Modern software systems involve increasingly complex and dynamic supply chains. Lack of systemic transparency into the composition and functionality of these systems contributes substantially to cybersecurity risk as well as the costs of development, procurement, and maintenance.
16

#RSAC
The problem to be solved
Modern software systems involve increasingly complex and dynamic supply chains. Lack of systemic transparency into the composition and functionality of these systems contributes substantially to cybersecurity risk as well as the costs of development, procurement, and maintenance. In our increasingly interconnected world, risk and cost impact not only individuals and organizations directly but also collective goods like public safety and national security.
17

#RSAC
How a transparency solution can help
Enhancing the identification of vulnerable systems and the root cause of incidents Identifying suspicious or counterfeit software components
18

#RSAC
How a transparency solution can help
Enhancing the identification of vulnerable systems and the root cause of incidents Identifying suspicious or counterfeit software components Reducing unplanned and unproductive work
19

#RSAC
How a transparency solution can help
Enhancing the identification of vulnerable systems and the root cause of incidents Identifying suspicious or counterfeit software components Reducing unplanned and unproductive work Supporting more informed market differentiation and component selection
20

#RSAC
How a transparency solution can help
Enhancing the identification of vulnerable systems and the root cause of incidents Identifying suspicious or counterfeit software components Reducing unplanned and unproductive work Supporting more informed market differentiation and component selection Reducing duplication of effort by standardizing formats across multiple sectors
21

#RSAC
· Harmonization · Amplification & routinization · Extensions & innovation
22

#RSAC
Making progress
Clear appreciation across sectors on the potential value of transparency Consensus already on
­ The broad scope of the problem ­ Focus on a minimum viable product
with extensions. ­ Machine-readability of the solution
23

WHAT IS AN SBOM?
Working to frame the problem

#RSAC
Starting with "simple" definitions"
25

#RSAC
The Big Tent
A process that should reflect as many interests and use cases as possible, while trying to rapidly identify a "minimum viable product"
26

#RSAC
Core Identity
27

#RSAC
Basic Identity
28

#RSAC
The namespace challenge
29

#RSAC
30

#RSAC
SBOM as a graph
SW

Comp1

Comp2

31

#RSAC
How many levels deep?
CAPTURING ALL LEVELS VS. EACH SUPPLIER PRODUCES AN SBOM RECURSIVELY
32

#RSAC
Being Clear about Opacity
SW

Comp1

CCoommpp22
?

33

Data about data
I built this set of SBOM data vs
This is SBOM data from someone else. SW
SCBoOmpM1

#RSAC
CSoBmOpM2

34

WHY SHOULD WE USE AN SBOM?
Working to understand current practices and potential use cases

#RSAC
A supply chain perspective
36

A supply chain perspective

#RSAC
Supplier selection Supply selection Supply vigilance

37

#RSAC
Capturing Stories
Each of these offers unique perspectives on the current and potential value of transparency. We would love to have your perspective!
38

HOW DO WE SBOM
Working to understand the existing standards and formats

#RSAC
Not a Standards Development process
FORTUNATELY, WE HAVE SOME EXISTING TOOLS THAT WE CAN USE FOR SBOM DATA
40

#RSAC
Software Package Data Exchange (SPDX)
SPDX® is an open standard for communicating software bill of material information (including components, licenses, copyrights, and security references). The SPDX specification is developed by the SPDX workgroup, which is hosted by The Linux Foundation. The grass-roots effort includes representatives from more than 20 organizations-- software, systems and tool vendors, foundations and systems integrators--all committed to creating a standard for software package data exchange formats.
41

#RSAC
SPDX Example

# Document Header SPDXVersion: SPDX-2.1 DataLicense: CC0-1.0 SPDXID: SBOMDOCUMENT DocumentName: SBOM-Proof-of-concept DocumentNamespace: http://example.com Created: 2018-12-18Y22:11:34Z CreatorComment: <text> This document was created as a proof-of-concept </text>

PackageName:alsa-conf-base SPDXID: yocto/alsa-conf-base@1.1.0 PackageVersion: 1.1.0 PackageDownloadLocation: NOASSERTION FilesAnalyzed: false PackageLicenseConcluded: NOASSERTION PackageLicenseDeclared: NOASSERTION PackageCopyrightText: NOASSERTION

# Packages PackageName:alsa-conf SPDXID: yocto/alsa-conf@1.1.0 PackageVersion: 1.1.0 PackageDownloadLocation: NOASSERTION FilesAnalyzed: false PackageLicenseConcluded: NOASSERTION PackageLicenseDeclared: NOASSERTION PackageCopyrightText: NOASSERTION

PackageName:alsa-lib SPDXID: yocto/alsa-lib@1.1.0 PackageVersion: 1.1.0 PackageDownloadLocation: NOASSERTION FilesAnalyzed: false PackageLicenseConcluded: NOASSERTION

PackageLicenseDeclared: NOASSERTION

PackageCopyrightText: NOASSERTION

Relationship: yocto/libasound2@1.1.0 PACKAGE_OF yocto/alsa-lib@1.1.0

Relationship: yocto/libc6@2.23.0 PACKAGE_OF yocto/alsa-lib@1.1.0 ...
https://github.com/spdx/spdx-spec

42

#RSAC
Software Identification (SWID)
SWID tags record unique information about an installed software application, including its name, edition, version, whether it is part of a bundle and more. SWID tags support software inventory and asset management initiatives. The structure of SWID tags is specified in international standard ISO/IEC 19770-2:2015.
43

#RSAC
SWID tag example
<SoftwareIdentity name="alsa-conf" tagId="yocto/alsa-conf@1.1.0" version="1.1.0"/> <SoftwareIdentity name="alsa-conf-base" tagId="yocto/alsa-conf-base@1.1.0" version="1.1.0"/> <SoftwareIdentity name="alsa-lib" tagId="yocto/alsa-lib2@1.1.0" version="1.1.0">
<Link href="swid:yocto/libasound2@1.1.0" rel="requires"/> <Link href="swid:yocto/libc6@2.23.0" rel="requires"/> </SoftwareIdentity> ...
44

#RSAC
Translation between formats
WE HAVE IDENTIFIED THE COMMON ELEMENTS. A `BILINGUAL' ECOSYSTEM DOES NOT OFFER TOO MANY CHALLENGES
Rather than pick a winner, we will build out guidance to support both formats with effective interoperability.
45

#RSAC
Related efforts in the ecosystem
Software Heritage Index Package URL (Purl) CPE
46

#RSAC
Healthcare Proof of Concept
47

#RSAC
Open questions to figure out together
48

#RSAC
Responsibilities and Exceptions
SW

Comp1

Comp2

HOW DEEP TO SHARE SOURCING SBOM DATA DEALING WITH INCOMPLETE DATA
49

#RSAC
Obstacles to obtaining SBOM data?
50

#RSAC

Transparency

Vendors

Mechanisms of sharing
SBOM data?
Customers

#RSAC
VulnCehraallbeinlgitey: Vvusln.erability vs Exploitability
Exploitability
Vendors can communicate risk (or the lack thereof) with their customers. We need to enable this process.
52

#RSAC
To recap...
Tracking third party components can help understand and address a wide range of risks across the entire ecosystem
53

#RSAC
To recap...
Tracking third party components can help understand and address a wide range of risks across the entire ecosystem An ongoing, open process convened by NTIA is bringing together experts to address:
54

#RSAC
To recap...
Tracking third party components can help understand and address a wide range of risks across the entire ecosystem An ongoing, open process convened by NTIA is bringing together experts to address:
­ What a Software Bill of Materials is
55

#RSAC
To recap...
Tracking third party components can help understand and address a wide range of risks across the entire ecosystem An ongoing, open process convened by NTIA is bringing together experts to address:
­ What a Software Bill of Materials is ­ Why it can help across the supply chain
56

#RSAC
To recap...
Tracking third party components can help understand and address a wide range of risks across the entire ecosystem An ongoing, open process convened by NTIA is bringing together experts to address:
­ What a Software Bill of Materials is ­ Why it can help across the supply chain ­ How we can implement it
57

#RSAC
Applications: what you can do
58

#RSAC
Applications: what you can do
Think - What would this mean for you?
­ How would your organization or sector change if SBOMs were expected or supplied?
59

#RSAC
Applications: what you can do
Think - What would this mean for you?
­ How would your organization or sector change if SBOMs were expected or supplied?
Prepare ­ Start pushing for change
­ What would it take to track your 3rd party components? ­ What tooling would you need?
60

#RSAC
Applications: what you can do
Think - What would this mean for you?
­ How would your organization or sector change if SBOMs were expected or supplied?
Prepare ­ Start pushing for change
­ What would it take to track your 3rd party components? ­ What tooling would you need?
Get involved in the NTIA process!
­ Contact afriedman@ntia.doc.gov
61

#RSAC

