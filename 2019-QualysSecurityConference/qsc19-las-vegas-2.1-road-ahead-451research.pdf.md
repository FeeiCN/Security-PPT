The Road Ahead
FOR SECURITY, IT AND DEVOPS
451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

Scott Crawford
Research Vice President @s_crawford
NOVEMBER 2019

451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

Sweeping changes

Monolithic Standalone software
Self-contained APIs
Waterfall IT
Enterprise Networks
451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

Microservices Integrated services Service mesh `Functions as a Service' Agile DevOps IoT, OT, consumer 5G

Security's incumbents and the `Innovator's Dilemma'
 Bet on the future, at the risk of under-investing in current traction?
 Or double down on current success ­ but risk missing out on tomorrow's opportunities?
451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

Here comes the BOOM!

451RESEARCH.COM

©2019 451 Research. All Rights Reserved.

5

It's not just about adoption...
Primary workload deployment venue

Pre-`born in the cloud' incumbents showing strain

451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

Q. Thinking about all of your organization's workloads/applications, where are the majority of these currently deployed? Q. And thinking about all of your organization's workloads/applications, where will the majority of these be deployed two years from now?
Source: 451 Research's Voice of the Enterprise: Digital Pulse, Workloads & Key Projects 2019

Implications

No single point of control

Polyglot applications

A lot of interconnections

451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

DevOps
451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

Security has lots of opportunities...

 Software composition analysis  Developer training

 Dynamic app sec testing

 Operational container & platform security  Secure orchestration  Operational protections

 Static app sec testing
 Source security integrated with the IDE

 Defining container security
 Runtime app sec built in

 Gating for security policy, compliance
 Vulnerability checks

451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

 Vulnerability assessment  Threat activity monitoring

But they don't exactly love us...
 Pace  Functional and business
requirements first  What's the incentive for developers?  Toolchain integration
451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

And each shop has its own toolset preferences
451RESEARCH.COM ©2019 451 Research. All Rights Reserved. Source: https://xebialabs.com/periodic-table-of-devops-tools

451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

Maybe a little complexity

What about all the `things'?

451RESEARCH.COM

©2019 451 Research. All Rights Reserved.

13

451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

A bit more complexity

Okay, a LOT more complexity
In the enterprise*: Total connected IoT devices (in billions of units)

13.8

12.2

11.0

7.9

8.8

9.8

2019

2020

2021

2022

2023

2024

*Not including consumer devices (e.g. PCs, smart TVs, game consoles)
451RESEARCH.COM ©2019 451 Research. All Rights Reserved. Source: 451 Research IoT Market Monitor, June 2019

451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

Where are we going to find the software to power all the things?
16

Oh.

451RESEARCH.COM

Sources: https://github.blog/2018-11-08-100m-repos/,

©2019 451 Research. All Rights Reserved. https://news.microsoft.com/2018/06/04/microsoft-to-acquire-github-for-7-5-billion/

Vulnerability remediation and the `Russian doll' of open source

451RESEARCH.COM ©20198 451 Research. All Rights Reserved.

Example: Struts 2 vulnerability
 ...which extends the Java Servlet API  ...had a vulnerability in OGNL (remote
code execution exposure)  ...which is incorporated in Jakarta  ...which was part of Apache

451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

Still more complexity

451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

Let's get 'em all on the network!
20

HHoowwmmaannyypuesoeprlse??
451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

What's trust got to do with it?

It's all about proof

Who seeks access? Under what conditions?

Enterprise users

Customers

Partners

Decision-making: AI/ML-enabled
AUTHENTICATION

`M2M' AUTHORIZATION

To which targets?
Fine-grained access control

IoT/OT

`Continuous' validation Traditional IT endpoints

Applications, cloud resources, APIs, SaaS, etc.
...and, oh yeah, DATA

WITH SECURITY FOR DATA THROUGHOUT

451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

Now, multiply each decision on a scale of billions.
Continuously.

Expand your thinking about...

451RESEARCH.COM

©2019 451 Research. All Rights Reserved.

25

Security analytics
It can't all be done in one place
Distributed compute now may be nothing compared to what's coming

451RESEARCH.COM

©2019 451 Research. All Rights Reserved.

26

451RESEARCH.COM

Twitter: @MVLibertas (Mat Vaillancourt)

©2019 451 Research. All Rights Reserved. https://twitter.com/mvlibertas/status/1195353071322304512

CENTRALIZED COMPUTE, STORAGE, INTEGRATION

Distributed analytics and control fits other emerging patterns

EDGE EDGE EDGE EDGE EDGE
451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

 Ways to distribute high-volume analysis  (And offload compute for less capable
endpoints)  Edge ­ or `fog' ­ computing  Stream analytics  `Zero trust' access enforcement

Sources of security insight ­ talking to each other, too

Legacy resources Third-party services

CSPs

 Reputation  Activity monitoring  Policy

SaaS

Partners
451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

Functions as a service

Automation: Similar patterns here, too

Security Automation & Orchestration (`SOAR')

IT AUTOMATION

CI/CD
Robotic Process Automation (RPA)

451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

GitOps: Putting security inline with CI/CD
 Automated pipelines deploy changes to infrastructure when changes are made to Git (using `diff,' `sync' tools)
 Helps isolate credential leakage across boundaries  Performs actions on pull request > git pull

OSS Repo

 Check for vulnerabilities embedded in packages  Report or block actions when vulns are present  Scan for non-secure implementations  Recommend ­ and where able, automate - fixes

Dev

Code Repo

CI

Image Repo

Prod Cluster

451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

451RESEARCH.COM

By Arthur Schmunk (@schmunk)

©2019 451 Research. All Rights Reserved. https://hackernoon.com/gitops-or-why-the-future-has-no-dashboards-38ce026a3c56

How are we going to source all this?

451RESEARCH.COM

©2019 451 Research. All Rights Reserved.

33

The `GitHub-ification' of security
MITRE ATT&CK
https://mitre.github.io/attack-navigator/enterprise/

The `GitHub-ification' of analytics
Jupyter Notebooks
https://jupyter.org

What's YOUR role going to be?
451RESEARCH.COM ©20198 451 Research. All Rights Reserved.

Thank you
US +1 212.505.3030 EUROPE +44 (0) 203.929.5700
451research.com @451Research @s_crawford New York London Boston San Francisco
451RESEARCH.COM ©2019 451 Research. All Rights Reserved.

