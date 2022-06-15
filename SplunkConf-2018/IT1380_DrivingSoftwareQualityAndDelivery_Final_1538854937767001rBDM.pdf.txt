© 2018 SPLUNK INC.
Driving Software Quality and Delivery With Splunk
Ingmar Vis | Product Owner ABN AMRO BANK NV
October 2018

ABN Amro Bank N.V.
Trusted, Professional, Ambitious
 Dutch bank HQ in Amsterdam  Relisted on Euronext in 2015  6 million customers  22000 employees  2017 profit: 2.791 billion (+34%)
 Embracing a culture of change

© 2018 SPLUNK INC.

Who Are We?

© 2018 SPLUNK INC.

v

INGMAR VIS
Product Owner Github.com/abnamro Ingmar.vis@nl.abnamro.com
@ingmarvellous

ERIK MEFFERT (UMBRIO)
Splunk Architect Erik.meffert@umbrio.com

© 2018 SPLUNK INC.
Driving Software Quality and Delivery With Splunk
Bringing data together and making sense of a big application landscape

>3.000 Developers
in +- 400 (outsourced)
teams

Variety in capability
levels

Full stack across multiple
platforms

Lack of conventions

Segregation of
information

IT4IT Value Chain
Enable fast IT delivery to the Business
 Plan · Portfolio, strategy, priority, distribution
 Build · Development, testing, releasing
 Deliver · Cost of service, fulfillment, infra ordering
 Run · Availability, performance, usability

© 2018 SPLUNK INC.

Requirement to Deploy
CI/CD

© 2018 SPLUNK INC.

 Why CI/CD
· Long lead time for
software delivery
· Software quality issues
found at late stage
· Many manual handovers
and approvals
· Inefficient cooperation
between Dev and Ops
· Big non-frequent releases
to production
Redefining the software delivery principle was vital

 IT4IT Value Chain
· Tool implementation &
upgrades
· CI/CD Pipeline
implementation and upgrades
· Supporting Agile teams
· Incident & Problem
management for IT4IT tooling
Code quality, Cooperation, TTM, SDLC all improved

 Takeaways
· Senior management
commitment
· Reduce Technical debt · Safe work environment
where failing is okay
· Don't focus on only tools · Journey is complex · Make small steps
Transformation to DevOps, hybrid cloud & WoW

© 2018 SPLUNK INC.
"If you cannot measure it,
you cannot control it."
Lord Kelvin (-273.15 degree Celsius or -459.67 degree Fahrenheit)

© 2018 SPLUNK INC.
Software Lifecycle & Control Business Case
Creating value by creating insight

ROI on CI/CD  Multi million $ investment in CI/CD
over 4 years
 CI/CD gap analysis based on framework coverage
 Strategic management by trend analysis & drill downs
 Informed partnership discussions
 Huge increase in insights on Code Quality, Secure Coding and Open Source Scanning

Team productivity  Agile rituals assisted by holistic
dashboards
 Alerting & wall displays for event driven action
 Simple to use self service MI solution enabling shift to DevOps
 Save up many hours/ sprint/ team for data gathering & reporting
 Transparency for all stakeholders

Software Delivery
Challenges in measuring throughput
 Data quality & accessibility  Standardization & tooling  Governance & ownership
Introducing the Software Lifecycle & Control framework

© 2018 SPLUNK INC.

Software Lifecycle & Control Framework
Providing insights & registering accomplishments

© 2018 SPLUNK INC.

 Requirements · Provide metrics on: · Agile maturity · CI/CD maturity · IT performance

 Cross-cuts · Drill up and down on: · Components · Organizational structure · Vendor, Technology, Platform, etc.

Strive for high scores on JHI*
*Jez Humble Index

Building Blocks
Tool agnostic & generic metric definitions

© 2018 SPLUNK INC.

 Agile maturity
· Predictability, velocity, consistency, impediments, engagement, burn down, resolution time

 CI/CD maturity
· Commit to build ratio, build success, pipeline recovery time, incidents,code quality, secure coding, open source component scanning, test automation, versioning, unit test coverage, build duration, shift left effectiveness, versioning

 IT performance
· Lead time for changes, mean time to recovery, change success rate, release frequency

Connected:
 Jira  ServiceNow Blue  ServiceNow Green  Bitbucket  Jenkins  SonarQube  HP Fortify  Nexus Lifecycle  XL Release  XL Deploy

Sources for Metrics
A glimpse of our tool stack

© 2018 SPLUNK INC.

In progress:  VSTS on Azure  Ansible Tower  uDeploy  Topaz Workbench  COTS platforms ...

Extraction methods:
 Logs
 Modular input
 Inputlookup
 API "CodeQualityData Retriever" (to be open sourced on Github)
...

Approach & Set-up of Metrics
From POC & MVP to Enterprise Solution

© 2018 SPLUNK INC.

 Requirements
· Contact CI/CD spoc's · Define metrics · Evaluate with users · Form team

 Start small
· Easy to extract metrics first · Add a few teams to
dashboards · Feedback loop · 2 week sprints, reviews · Monthly MT updates

 Scale up
· Complex metrics (IT Performance)
· Increase coverage · Focus on data quality · Enterprise view

Defining Component Ownership
One-stop-correlation-shop for quality data

© 2018 SPLUNK INC.

 SSO Self service onboarding portal
 Input validation via source systems
 Auto-backup of KV Store
 Immediate access to dashboards
 By the way: Splunk is open for all employees

Coverage
Metrics on metrics

© 2018 SPLUNK INC.

Component and Team Level Details
Holistic view on the SDLC

© 2018 SPLUNK INC.

 Combined data · Jenkins · SonarQube · Jira · ServiceNow
 Aggregation possible by KV store mapping
 All data is open to all Splunk users

Management Views
Enterprise wide overview

© 2018 SPLUNK INC.
 Pin point soft spots
 Organizational aggregations: · Code quality
analysis
· Secure code
scanning
· Open source
Component threats

Code Quality Dashboards
Combining data on quality measurements

© 2018 SPLUNK INC.

 Totals per CI/CD quality reporting tool
 Drilldowns to component level
 Reverse engineering from component to ownership also possible

Release & Deploy Life Cycle
Insights into the time to market

© 2018 SPLUNK INC.

 XL Release and XL Deploy data
 Deployments per type, application and environment
 Releases per status
 Available on component, team or organizational level

© 2018 SPLUNK INC.

Key Challenges
What we faced

1. Logs insufficient across tool stack
2. Data quality, component ownership &
tagging
3. Splunk performance (storage)
4. DevOps Mindset & behavior teams
adolescent

© 2018 SPLUNK INC.

Key Takeaways
What we gained

1. Management buy-in for metrics
2. Code quality dashboards add value
from day 1
3. Ease of use & ease of implementation

© 2018 SPLUNK INC.
Q&A
Ingmar Vis | Product Owner Erik Meffert | Splunk Architect

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

