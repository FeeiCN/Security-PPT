The Devil's in the Dependency:
Data-Driven Software Composition Analysis

Ben Edwards Cyentia Institute

Chris Eng Veracode

#BHUSA @BLACKHATEVENTS

We're going to demonstrate, with data...
Even the smallest library (162 LoC) can introduce flaws into your application Most libraries aren't even directly included, but are included by other libraries ­ a blind spot for developers More libraries doesn't always mean more problems There are better ways to prioritize fixes than by severity Rejoice! 81% of patchable vulnerabilities can be fixed with a minor library update, and most updates are small ­ even when updates introduce new flaws!

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

About us
Ben
Senior Data Scientist @ Cyentia
PhD in CS applying data science to security
Wide gamut of published research: breaches, botnets, AI security, privacy, policy, and cyberwar

Chris
Chief Research Officer @ Veracode
20+ years in application security: build, break, and defend
Been involved with SoSS since Volume 1 (2010)

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

About the report
Veracode State of Software Security (SoSS), released annually-ish since 2010
Joint venture with Cyentia Institute since 2018
Motivations
· Insights into industry performance · Customer benchmarking · Actionable advice for improving AppSec
This talk includes additional research not covered in the original report!

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

Agenda
Data sources and biases Library usage Transitive dependencies Flaw categories and patterns Fix prioritization, evolved Update chains
@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

Data sources
Largest known quantitative study of application security findings 12 months of application scan data Over 85,000 unique applications and 351,000 unique libraries

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

Biases
Experimental errors: Type I (false positives) and Type II (false negatives)
Selection bias, e.g. who are Veracode's customers, which applications did they choose to analyze, etc.
Attribution bias, e.g. inclination to "blame" outcomes on things that seem relevant (e.g. developer skill) vs. other situational factors (e.g. release deadlines)

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

Library usage The Open Source popularity contest

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

Library usage is highly language dependent

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

Usage rate of popular libraries

0%

10%

20%

30%

40%

50%

60%

70%

80%

90%

100%

0%

10%

20%

30%

40%

50%

60%

70%

80%

90%

100%

0%

10%

20%

30%

40%

50%

60%

70%

80%

90%

100%

0%

10%

20%

30%

40%

50%

60%

70%

80%

90%

100%

0%

10%

20%

30%

40%

50%

60%

70%

80%

90%

100%

0%

10%

20%

30%

40%

50%

60%

70%

80%

90%

100%

0%

10%

20%

30%

40%

50%

60%

70%

80%

90%

100%

0%

10%

20%

30%

40%

50%

60%

70%

80%

90%

100%

Percent of applications using library

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

We need to talk about JavaScript...
@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

We need to talk about JavaScript Top 10 libraries
Incredibly numerous and small libraries
@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

We need to talk about JavaScript Top 10 libraries
Incredibly numerous and small libraries Top 3 have < 1 kLOC each (36, 790, 162 respectively)
@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

We need to talk about JavaScript Top 10 libraries
Incredibly numerous and small libraries Top 3 have < 1 kLOC each (36, 790, 162 respectively) isarray is only 4 lines long
@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

We need to talk about JavaScript Top 10 libraries
Incredibly numerous and small libraries
Top 3 have < 1 kLOC each (36, 790, 162 respectively)
isarray is only 4 lines long
debug and ms have versions with CVEs
@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

SemVer, the closest we can get to a standard...

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

Transitive dependencies It's libraries all the way down...

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

Definition / implications
Libraries, like applications, aren't built in a vacuum Including a library means including every library it uses Two types of dependencies
Direct Libraries that are explicitly included by the developer Transitive Libraries that are included by another library

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

Transitive by language (Fig 4)

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

Direct vs Transitive vulnerabilities (Figs 11-12)

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

Flaws Every rose has its thorn...

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

More libraries = more problems? (Fig 13)

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

Language choice makes a difference (Fig 5)

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

OWASP Top Ten (Fig 6)

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

PHP is basically a minefield (Fig 7)

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

Alright, now what? Prioritizing fixes

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

Not all vulnerabilities have exploits (Fig 8)

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

PoC exploits by OWASP category (Fig 10)

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

The vulnerability funnel (Fig 14)

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

Good news: most fixes are minor (Figs 16-17)
Out of that 73.8%...

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

It's never that easy...
Updating a library can introduce new flaws, which require further updates, which may introduce new flaws, requiring more updates... So what do these update chains look like?

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

It's never that easy...
Updating a library can introduce new flaws, which require further updates, which may introduce new flaws, requiring more updates... So what do these update chains look like?
Single step to version with no known flaw
Multiple Steps to version with no known flaw

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

It's never that easy...
Updating a library can introduce new flaws, which require further updates, which may introduce new flaws, requiring more updates... So what do these update chains look like?

Single step to version with no known flaw
Multiple Steps to version with no known flaw
No update available

@benjamesedwards @chriseng

Multiple Steps to version with flaws and no update available

#BHUSA @BLACKHATEVENTS

It's never that easy...
Updating a library can introduce new flaws, which require further updates, which may introduce new flaws, requiring more updates... So what do these update chains look like?

Single step to version with no known flaw
Multiple Steps to version with no known flaw
No update available

Suggested updates are circular

@benjamesedwards @chriseng

Multiple Steps to version with flaws and no update available

#BHUSA @BLACKHATEVENTS

Begs many questions
How do these chains end? How many steps do they have? Do they significantly increase update size?
@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

How do the chains end?

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

Most chains are relatively short...

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

... but it varies by language

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

Most updates are still small

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

Conclusions / Q&A

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

Takeaways
Open source software has a surprising, and surprisingly variable, number and type of software flaws.
The attack surface of many applications -- due to the transitive dependency phenomenon -- is much larger than developers may expect.
Language selection does make a difference -- both in terms of the size of the ecosystem and in the prevalence of flaws in those ecosystems.
Most fixes are relatively minor in nature, suggesting that this problem is one of discovery and tracking, not huge refactoring of code.

@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

Questions?
ben@cyentia.com ceng@veracode.com
@benjamesedwards @chriseng

#BHUSA @BLACKHATEVENTS

