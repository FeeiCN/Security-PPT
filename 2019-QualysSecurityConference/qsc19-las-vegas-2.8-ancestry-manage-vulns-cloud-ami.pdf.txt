Fix it Once
How Ancestry Successfully Manages Vulnerabilities in the Cloud through Amazon Machine Images

Me...

About us
We're a science and technology company with a very human mission
· World's largest online collection of family history records - billions & billions
· 3+ million wonderful subscribers · 100 million family trees · 10 web properties · 3 petabytes of data under management

About us
· DNA kits available in 30+ countries · 700K genomic markers · 350 global regions · Largest DNA repository in the world

Ancestry is founded

1983

Internet site launched

1996

Begin Mitochondrial DNA Testing

2002

1 million people tested 16 million people tested

2015
2016
2019

Challenges
Background: Why the Cloud?
· Growth · Rapid cycle expansion
· Fast moving, traffic & business cycles · Resiliency & uptime
· Multiple global regions · Multiple Availability Zones

5-10
Jan - Oct

Transactions per second
250

November/December

Jan

(e.g. Black Friday / Cyber Monday)

Tactical Approach to the Cloud
Each stack had to be imaged & rapidly deployable · Needed to realized resiliency goals ­ Can't just lift-and-shift · Make use of cloud elasticity and containerization · More Standardized toolset....
We use and mandate AWS Tags · Every system needed a NAMED owner or was shutdown
Removed Access · Separate AWS accounts for Development, Smoke, Production, SOX, and PCI · Absolutely NO Dev Production Access Results: Huge P1 Incidents! · IF it is awake, it is subject to scanning · Approved Images (AMI) with Authentication Keys
6

Challenges
Each stack had to be imaged & rapidly deployable · Needed to realize resiliency goals ­
Can't just lift-and-shift · Make use of cloud elasticity and
containerization · More standardized toolset

Here is what we did...
· Separate AWS accounts for Development, Smoke, Production, SOX, and PCI
· Absolutely NO Stage or Production access
Spoiler alert: Huge P1 incidents!
· IF it is awake, it is subject to scanning
· Approved Images (AMI) with Authentication Keys
· Every system needed a NAMED owner or was shutdown (Qualys to find unnamed servers)

Solution
Approved Images ­ AMI's
Ancestry required a new way of thinking about servers

Servers are cattle

Not pets

Solution
Don't push patches...patch the AMI

Shut down the old one

Spin up the new one with the new AMI

NO cows were harmed in our AWS migration!

Why Ancestry chooses AWS and Qualys
Why AWS? · System resiliency · Rapid elastic expansion · Supported our rapid growth
Why Qualys? · Proven ability to work well with AWS ­ expanded
with our needs · Virtually maintenance free, once we set up · The data was accurate ­ no false positives

Challenges
Lessons learned
· Don't get fixated on the count of vulnerabilities · Buy-in at executive level · Think operationally ­ not exceptionally · KEEP CALM and STICK to the process ... it takes
time to work · Communication and visibility

And then this...

Confirmed
Sev 4 Sev 5

And finally this

Vulnerability Count

This happened
>80% drop in vulnerabilities

Don't shoot for ZERO

Benefits are awesome
· My ask of Development: Do one thing. Update the image.
· Forced us to have a more homogeneous platform and process
· Synced security with business goals · Process seems to be sustainable! · 76%+ NIX scan are fully authenticated ­ 99%
Windows · Works for some applications as well

Benefits are awesome
· Works at the application layer as well

Dashboards
Key Metrics · Use of approved image · Confirmed 4s & 5s Ageing* · Number of Vulns Fixed · Scan coverage - Target 95% · Authentication Percentage ­ Target 95% · Vulnerabilities not fixed by Image
* Aged based on vulnerability release date ­ pending...

Dashboards
Vulnerabilities NOT FIXED
By Image
Vulnerabilities FIXED
By Image
Vulnerabilities WILL BE FIXED
By Image

Q&A Thank you!

