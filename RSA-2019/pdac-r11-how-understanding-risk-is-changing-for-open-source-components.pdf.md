SESSION ID: PDAC-R11
How Understanding Risk Is Changing for Open Source Components

Chris Wysopal
CTO & Co-founder Veracode @weldpond

#RSAC

#RSAC
Built Mostly from Components

Open Source

Open Source

Open Source

Open Source

80% to 95% of modern apps consist of assembled components.

Open Source
Open Source

Proprietary Code

Open Source
Open Source

Open Source

Open Source

Open Source

Open Source

#RSAC
Open Source Repo Stats

Language Perl Java Node.js .NET PHP Python Ruby

Packages 39,416 265,303 762,073 140,541 210,210 165,737 149,579

Avg. Growth
2/day 131/day 507/day 67/day 134/day 114/day 27/day

http://www.modulecounts.com/ Data from January, 2019

#RSAC
Pulls from Docker Hub
DockerCon 2017

#RSAC
Open Source ­ More or Less Secure?
Defect rate in open source is no better or worse than first party code The difference is that developers never revisit Integrated and abandoned It's not a problem until a vulnerability is discovered

#RSAC
Sizing The Problem

96% 46 67% 4

of applications contain open source components
Source: Black Duck
Applications have an average of 46 components.
Source: Veracode
of applications had vulnerabilities in those components.
Source: Black Duck
On average, vulnerabilities identified have been publicly known for 4 years
Source: Black Duck

#RSAC
Integrated and Abandoned Explicitly - Struts
Known Vulnerable Not Known Vulnerable

#RSAC
Integrated and Abandoned Implicitly ­ Apache Commons Collections
Known Vulnerable Not Known Vulnerable

Where do you find open source vulnerability data?

#RSAC
Not all public vulnerabilities are in the National Vulnerability Database (NVD)
Public information about open source vulnerabilities is available directly from open source projects
Security bulletins, release notes, commit comments, and source code comments contain vulnerability information
This information is readily available to attackers and defenders
Automated services can crawl this information daily. Security analysts can performs quality review, and compile augmented DB.

Percentage of vulnerabilities not in the NVD ­ 31%

Language

CVE

Reserved CVE

JS

604

47

PHP

522

14

DOTNET

58

0

JAVA

749

60

RUBY

284

43

PYTHON

389

59

GO

90

5

CPP

193

8

OBJECTIVEC

631

14

CSHARP

33

3

3553

253

% SVE Low assumes reserved CVEs overlap with SVEs

% SVE High assumes reserved CVEs do not overlap with SVEs

SVE 490 128
1 335 268 228 218
12 9 0
1689

% SVE Low 42.94% 19.28% 1.69% 29.28% 45.04% 33.73% 69.65% 5.63% 1.38% 0.00% 30.74%

#RSAC
% SVE High 44.79% 19.69% 1.69% 30.90% 48.55% 36.95% 70.78% 5.85% 1.41% 0.00% 32.22%

Do I need to remediate every vulnerable component?

#RSAC
Component Vulnerability Exploitability
A product is vulnerable when it contains a vulnerable component and the product uses the library in such a way that the vulnerable code can be exercised. Control flow analysis was used determine if vulnerable code is reachable from the product code. Analysis was not performed to determine if vulnerable code can be called directly by attacker or called when attacker has exploited another vulnerability.

#RSAC
For Java, Ruby and Python, less than 5% of products that contain a library with a vulnerability are vulnerable

repos analyzed

% component vulnerabilities that make the products vulnerable

Ruby Java Python

624 5897
624

3.79% 4.34% 0.93%

JavaScript study found 26.7% made products vulnerable

Towards Smoother Library Migrations: A Look at Vulnerable Dependency Migrations at Function Level for npm JavaScript Packages
http://se-naist.jp/pman3/pman3.cgi?DOWNLOAD=652

What does a good process look like?

#RSAC
Building a solution into your development lifecycle.
Integrate into your CI/CD pipeline so you have a record of what goes into production.
Scanning your repos is OK but pipeline could apt-get update to a vulnerable version.
Open tickets in your ticketing system for each component that should be updated.
Create a policy of grace period by severity and vulnerability.

How much risk are organizations finding from open source components
Average vulns per app
25

20

15

10

5

0

go

objective-c

python

java

php

ruby

Language

c#

javascript

#RSAC
HIGH MEDIUM LOW

How much risk are organizations remediating?

60 50 40 30 20 10
0 2-10

Fix percentages by number of scans

11-30

31-80 Scans

81-130

130+

#RSAC
LOW MEDIUM HIGH

What if we know the component with a vulnerability is #RSAC making my app vulnerable right now?
Avg # of scans to fix a vulnerable component: 22
Avg # of scans to fix a vulnerable component with a
vulnerable method: 17
Proportion of vulnerable components fixed: 32%
Proportion of vulnerable components with
vulnerable methods fixed: 41%
Developers fix more and fix faster when they have vulnerable method information available.

#RSAC
Use fewer, better suppliers
Toyota's lean manufacturing model uses fewer, better suppliers
Use containers, libraries and frameworks that are proven to work and vetted by your security team and in your repository
Keep track of what you have!
2 0

#RSAC
Apply What You Have Learned Today
Next week you should:
­ Understand the process for managing open source code within your development organization
In the first three months following this presentation you should:
­ Create an inventory of open source code ­ Remediate where outdated and vulnerable open source is used in critical
applications
Within six months you should:
­ Integrate a process into your development lifecycle to monitor what open source is going into production
21

Questions?
Thank You! Chris Wysopal @weldpond

