Shifting Knowledge Left
Keeping Up With Modern Application Security

Mark Stanislav
Head of Security Engineering

Fletcher Heisler
CEO / Founder

Overview
 The State of Developer Security Knowledge  The Need to Reduce Time-to-Education  A Thoughtful Approach to Engineer Enablement  Changing Course on Education  Growing the Community

The State of Developer Security Knowledge

"The OWASP Top 10 is a powerful awareness document for web application security. It represents a broad consensus about the most critical security risks to web applications."
- OWASP
https://www.owasp.org/index.php/Category:OWASP_Top_Ten_Project

Over 125 OWASP Projects...
 60% Are Currently "active"  13% Are Flagship Projects

"Nearly one in five developers are not at all familiar with the Top 10 OWASP application security risks."
- Veracode
https://techbeacon.com/security/32-application-security-stats-matter

The OWASP Top 10 is Not...
 Up to date  Language- or framework-specific  A checklist for code scanning and pentesting  An exhaustive list of vulnerability classes  A training syllabus

Top U.S. Computer Science Programs
1. Carnegie Mellon 2. MIT 3. Stanford 4. University of California, Berkeley 5. University of Illinois, Urbana-Champaign 6. Cornell 7. University of Washington 8. Georgia Tech 9. Princeton 10. University of Texas at Austin
https://www.usnews.com/best-graduate-schools/top-science-schools/computer-science-rankings

Top U.S. Computer Science Programs Requiring a Course Related to Software Security:
[This slide left intentionally blank.]

A Moment in the Life of a Developer...

DevSecOps: Doing More With Less!
Industry trends continue to ask engineers to take on more areas of responsibility:
70% of developers are "expected" to write secure code, but... < 50% of these developers receive feedback on security, and... 25% think their organization's security practices are "good."
https://www.darkreading.com/application-security/software-developers-face-secure-coding-challenges/d/d-id/1335247 https://about.gitlab.com/2019/07/15/global-developer-report/

Dumbing Down Topics = Expanding Risk

Typical Developer Training:
 "Just Use These headers"  "Just Use the ORM"  "Just Use This Package"  Static, Out-of-date Content  Infrequent (e.g. Annual)

Real Code Security:
 Defense-in-Depth  Modern Controls  Practical Trade-offs  Threat Modeling  "Best Practices" Evolve

Load a Metasploit Module =
Use This Browser Header

I Can Pentest I Can Prevent XSS

In Browsers We Trust: XSSAuditor
https://groups.google.com/a/chromium.org/forum/#!msg/blink-dev/TuYw-EZhO9g/blGViehIAwAJ

HPKP Timeline
04/2015: RFC
https://tools.ietf.org/html/rfc7469

HPKP Timeline, cont.
09/2015: Chrome rollout
https://developers.google.com/web/updates/2015/09/HPKP-reporting-with-chrome-46?hl=bg

https://serverfault.com/questions/835797/remove-domain-from-hpkp-preload-list

HPKP Timeline, cont.
09/2016:
9/2016:
https://blog.qualys.com/ssllabs/2016/09/06/is-http-public-key-pinning-dead

HPKP Timeline, cont.
08/2017:
https://scotthelme.co.uk/im-giving-up-on-hpkp/

HPKP Timeline, cont.
10/2017: Intent to deprecate
https://groups.google.com/a/chromium.org/forum/#!msg/blink-dev/he9tr7p3rZ8/eNMwKPmUBAAJ

"The pass rate of applications against standards like the OWASP Top 10 hasn't budged in recent years, with applications failing policy consistently around 70% of the time." - Veracode
https://www.veracode.com/blog/secure-development/what-developers-need-know-about-state-software-security-today

"XSS continues to be the most common weakness type no matter how it's measured." - HackerOne
https://www.hackerone.com/resources/top-10-vulnerabilities

More Code, More Problems

Wishful Thinking as Vulnerability Management
"We aren't vulnerable because we don't use those libraries..."

"You can't scan your way to secure code." - P. Pourmousa, Veracode
https://www.veracode.com/blog/managing-appsec/beyond-scanning-dont-let-appsec-ignorance-become-negligence

The Need to Reduce Time-to-Education

https://www.researchgate.net/publication/255965523_Integrating_Software_Assurance_into_the_Software_Development_Life_Cycle_SDLC

Industry Compliance Products
Software Engineers

Security Engineers

Pentesters

SAST Triage

Risk Versus Reward
"Vulnerabilities that fall into the SSRF IDOR categories earn some of the higher bounties given the risk they pose to an organization."
- HackerOne

Duo New Engineer Survey How familiar are you with the following vulnerability classes?
SSRF: 58% not familiar at all IDOR: 67% not familiar at all

"There is 40% crossover of the HackerOne Top 10 to the latest version of the OWASP Top 10." - HackerOne
https://www.hackerone.com/resources/top-10-vulnerabilities

ORM: Not SQLi Proof!
https://en.wikipedia.org/wiki/SQL_injection#Mitigation

https://www.troyhunt.com/stored-procedures-and-orms-wont-save/

https://snyk.io/blog/sql-injection-orm-vulnerabilities/

https://bertwagner.com/2018/03/06/2-5-ways-your-orm-will-allow-sql-injection/

Education at the Speed of Reality?

2011

https://pythonhosted.org/Flask-Auth/_modules/flaskext/auth/auth.html
bcrypt: 1999 PBKDF2: 2000 scrypt: 2009 Argon2: 2015

2019

If a Vulnerability Gets Flagged... Now What?

A Thoughtful Approach to Engineer Enablement

OH: Security Conference Talk
Engineers may say that you punish them for bugs found; so we should ask them `Why aren't you good at coding?'
Meanwhile, the presenter is...  Brand new to application security  Has never been a software engineer  Admits to not having any real knowledge of programming
But sure, be an Application Security Engineer ¯\_()_/¯

Centering Team Focus Beyond "Find Bugs"

Engineering is Family

Adversarial in Action, Not Relationship

Low Friction, High Value

Elegance to Obviate Engineer Frustration

Build a Paved Road

Spend Time Enabling Good Outcomes

How Could it Go Right?

Meet the Need for Innovation, Not FUD

No Code Left Behind

Take Inventory, Know the Risk, Clean Up

Rethinking the Security Development Lifecycle

Training

Requirements

Design

Implementation

Verification

Release

Response

 This
Training Requirements Design Implementation Verification Release
Response

Not 

Many Front Doors to Enablement

In-person (or WebEx)

Online/Digital

Office Hours - Weekly

Hunter2 - Self Service

Visit Team Meetings - Monthly SDL Guidelines - Self Service

Training Courses - Quarterly Slack #appsec - On Demand

Internal CTF - Annual

psirt@duo.com - On Demand

Guest Speakers - Annual

Security Pipeline - On Demand

Raise the Bar for Your Engineers
An "OWASP Top 10" Training Usually Results in... 1. ' OR '1'='1' 2. <script>alert(`hacked');</script> 3. ../../../../../etc/passwd
Challenge your engineers by sharing content that is not something they have already seen ad-nauseum!

Introduction(?) to Application Security at Duo

"I had other app security training with the previous jobs and this one is the best so far. The labs make it particularly fun and engaging."

3 In-house Built Courses
Each Course Runs Quarterly

"It was great! I'd love if there were more beyond the 3 [trainings]!"

141 Attendees Across Classes
No Required Attendance

An AppSec Office Hours Anecdote
Engineer: "What is the right encryption choice for these LDAP secrets?" AppSec Team: "Hmm... what feature are you working on that requires that?" Engineer: [Interesting new functionality that we were not yet aware of...] AppSec Team: "Gotcha! Let's take a step back and review the design with you."

Meet the Engineers Where They Work
Be Predictable Communicate Well Share Context Explain Risk Suggest Remediation Support Next Steps

Changing Course on Education

ICAP Learning Framework

Engagement Activity

Example

Effectiveness

Passive

Watch a video

Worst

Active

Click through a tutorial

OK

Constructive

Answer an instructor's questions Better

Interactive

Solve a hands-on challenge

Best

https://files.eric.ed.gov/fulltext/EJ1044018.pdf

"It's the wrong approach. It's like going up to a parent and saying that their child is ugly and then expecting to have a conversation."
- Martin Knobloch, OWASP Chairman
Explain engineering topics in engineering terms; speak to them as peers. Don't just tell developers that they can't be trusted to write secure code!
https://www.theregister.co.uk/2018/07/07/owasp_chairman_interview/

Growing the Community

Cyber Security Awareness Month - October 2019
 Utilizes a total of ~20 Hunter2 modules across courses  Each course is designed to enable a day of training  Speaker notes, lab guides, and other resources provided

Duo-created Lessons for Hunter2:
 Signing JSON Web Tokens  HTTP Header Injection  Replay Attacks  Mass Assignment  Securing Cookies  Safe JSON Parsing

Join Us!
Reduce time-to-education by sharing newly identified risks and security best practices with the community  Use community-driven labs for free training  Contribute your own examples
hunter2.com/community

Shifting Knowledge Left
Keeping Up With Modern Application Security

Mark Stanislav
mstanislav@duo.com

Fletcher Heisler
fletcher@hunter2.com

Join us! hunter2.com/community

