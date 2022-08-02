These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

Securing Containers &
Cloud
Sysdig Special Edition
by Daniella Pontes and Pawan Shankar
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

Securing Containers & Cloud For Dummies®, Sysdig Special Edition
Published by John Wiley & Sons, Inc. 111 River St. Hoboken, NJ 07030-5774
www.wiley.com
Copyright © 2022 by John Wiley & Sons, Inc.
No part of this publication may be reproduced, stored in a retrieval system or transmitted in any form or by any means, electronic, mechanical, photocopying, recording, scanning or otherwise, except as permitted under Sections 107 or 108 of the 1976 United States Copyright Act, without the prior written permission of the Publisher. Requests to the Publisher for permission should be addressed to the Permissions Department, John Wiley & Sons, Inc., 111
River Street, Hoboken, NJ 07030, (201) 748-6011, fax (201) 748-6008, or online at http://www.wiley.com/go/ permissions.
Trademarks: Wiley, For Dummies, the Dummies Man logo, The Dummies Way, Dummies.com, Making Everything Easier, and related trade dress are trademarks or registered trademarks of John Wiley & Sons, Inc. and/or its affiliates in the United States and other countries, and may not be used without written permission. Sysdig and the Sysdig logo are registered trademarks of Sysdig. All other trademarks are the property of their respective owners. John Wiley & Sons, Inc., is not associated with any product or vendor mentioned in this book.
LIMIT OF LIABILITY/DISCLAIMER OF WARRANTY: WHILE THE PUBLISHER AND AUTHORS HAVE USED THEIR BEST EFFORTS IN PREPARING THIS WORK, THEY MAKE NO REPRESENTATIONS OR WARRANTIES WITH RESPECT TO THE ACCURACY OR COMPLETENESS OF THE CONTENTS OF THIS WORK AND SPECIFICALLY DISCLAIM ALL WARRANTIES, INCLUDING WITHOUT LIMITATION ANY IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. NO WARRANTY MAY BE CREATED OR EXTENDED BY SALES REPRESENTATIVES, WRITTEN SALES MATERIALS OR PROMOTIONAL STATEMENTS FOR THIS WORK. THE FACT THAT AN ORGANIZATION, WEBSITE, OR PRODUCT IS REFERRED TO IN THIS WORK AS A CITATION AND/OR POTENTIAL SOURCE OF FURTHER INFORMATION DOES NOT MEAN THAT THE PUBLISHER AND AUTHORS ENDORSE THE INFORMATION OR SERVICES THE ORGANIZATION, WEBSITE, OR PRODUCT MAY PROVIDE OR RECOMMENDATIONS IT MAY MAKE. THIS WORK IS SOLD WITH THE UNDERSTANDING THAT THE PUBLISHER IS NOT ENGAGED IN RENDERING PROFESSIONAL SERVICES. THE ADVICE AND STRATEGIES CONTAINED HEREIN MAY NOT BE SUITABLE FOR YOUR SITUATION. YOU SHOULD CONSULT WITH A SPECIALIST WHERE APPROPRIATE. FURTHER, READERS SHOULD BE AWARE THAT WEBSITES LISTED IN THIS WORK MAY HAVE CHANGED OR DISAPPEARED BETWEEN WHEN THIS WORK WAS WRITTEN AND WHEN IT IS READ. NEITHER THE PUBLISHER NOR AUTHORS SHALL BE LIABLE FOR ANY LOSS OF PROFIT OR ANY OTHER COMMERCIAL DAMAGES, INCLUDING BUT NOT LIMITED TO SPECIAL, INCIDENTAL, CONSEQUENTIAL, OR OTHER DAMAGES.
For general information on our other products and services, or how to create a custom For Dummies book for your business or organization, please contact our Business Development Department in the U.S. at 877-409-4177,
contact info@dummies.biz, or visit www.wiley.com/go/custompub. For information about licensing the For Dummies brand for products or services, contact BrandedRights&Licenses@Wiley.com.
ISBN: 978-1-119-84345-0 (pbk); ISBN: 978-1-119-84346-7 (ebk). Some blank pages in the print version may not be included in the ePDF version.

Publisher's Acknowledgments

Some of the people who helped bring this book to market include the following:

Project Manager and Development Editor: Carrie Burchfield-Leighton
Acquisitions Editor: Ashley Coffey

Sr. Managing Editor: Rev Mengle
Business Development Representative: Matt Cox

Authors' Acknowledgments
The idea to create this book was born from our commitment to knowledge sharing, a core value of our DNA. But it became possible because of how we embrace our goals as a team. We'd also like to thank Aaron Newcomb for his special contribution on the topic of monitoring.

These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

Table of Contents
FOREWORD ..........................................................................................................v
INTRODUCTION............................................................................................... 1
About This Book ................................................................................... 2 Icons Used in This Book....................................................................... 2
CHAPTER 1: Understanding Cloud Security.......................................... 3
Managing Cloud Permissions and Configurations........................... 3 Discovering cloud assets and configuration................................ 4 Identifying overprivileged users.................................................... 4
Detecting Threats in the Cloud ........................................................... 5 Adopting a Unified Threat Detection Approach ............................... 7
Single event store ........................................................................... 7 Unified policy language.................................................................. 8 Open-source validation.................................................................. 8
CHAPTER 2: Securing Infrastructure as Code (IaC)......................... 9
Understanding IaC Security .............................................................. 10 Implementing IaC Security ................................................................ 10
Scanning for misconfigurations in IaC pre-production templates ....................................................................................... 11 Detecting runtime drift and applying auto-remediation ......... 11 Applying policy as code ................................................................ 12 Securing IaC from source to production.................................... 13
CHAPTER 3: Preventing Vulnerabilities ................................................. 15
Understanding Vulnerabilities in Containers.................................. 16 Integrating Vulnerability Scanning into DevOps Life Cycle ........... 17
Automate vulnerability scanning in the CI/CD pipeline ........... 17 Automate registry image scanning............................................. 18 Enforce vulnerability security with Kubernetes admission controller..................................................................... 18 Prevent vulnerabilities in serverless workloads........................ 19 Manage vulnerabilities at runtime.............................................. 19 Implement host scanning ............................................................ 20 Adopting a Single Vulnerability Management Workflow for Containers and Hosts .................................................................. 20 Implement vulnerability prioritization ....................................... 21 Check for compliance requirements .......................................... 22
Table of Contents iii
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

CHAPTER 4: Detecting and Responding to Threats...................... 23
Defining Runtime Security................................................................. 24 Detecting threats on containers and hosts ............................... 24 Detecting threats in Kubernetes clusters .................................. 25 Detecting threats in the cloud..................................................... 26
Blocking Unexpected Traffic with Kubernetes NetworkPolicy...... 27 Planning for Incident Response and Forensics .............................. 27
Get deep visibility before and after an incident........................ 28 Get full Kubernetes and cloud context ...................................... 28
CHAPTER 5: Keeping Containers and Cloud Compliant............ 29
Facing Compliance and Governance Challenges in the Cloud ..... 30 Implementing Compliance Checks Across Cloud and Containers ................................................................................... 31 Using Open-Source Tools to Help with Compliance ...................... 32
OPA ................................................................................................. 32 Falco................................................................................................ 32
CHAPTER 6: Targeting Monitoring and Troubleshooting Issues................................................................................................... 33
Maximizing Application Performance and Availability .................. 34 Metrics............................................................................................ 34 Logs................................................................................................. 34 Traces ............................................................................................. 34
Troubleshooting Problems Faster with Granular Metrics............. 35 Simplifying Complex Monitoring Environments............................. 36 Avoiding Vendor Lock-In.................................................................... 37
CHAPTER 7: Ten Considerations for Securing Cloud and Containers ............................................................................ 39
Secure the CI/CD Build....................................................................... 40 Take Advantage of Kubernetes Native Controls............................. 40 Secure IaC Templates ........................................................................ 40 Manage Cloud Configurations and Permissions ............................ 40 Implement Cloud Security Monitoring ............................................ 41 Implement Runtime Security ............................................................ 41 Enforce Zero-Trust Network Segmentation .................................... 41 Monitor Container and Kubernetes Performance and Availability ........................................................................................... 42 Have an Incident Response Framework for Containers................ 42 Use Open-Source Tools to Avoid Vendor Lock-In........................... 42
iv Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

Foreword
Security is a top concern when running software applications and cloud infrastructure. Whether you're in the early stages or running all your workloads in production, you probably already noticed that cloud-native security is different from
-managed data center security. he dramatic increase in comple ity and the evolving threat landscape ma e cloud and container security even more critical and harder
To develop and operate securely in the cloud requires addressing a core issue blind spots. teams used to have direct access to and full control of any production resource, but now they have to rely on the limited visibility provided by the cloud provider s application programming interfaces A s . hey are also not the only ones to provision and ma e changes to production as in the old days. he unprecedented distributed ownership, e ibility, and automation enabled in the cloud that ma e developers so productive in shipping apps fast are also a constant source of risk in the cloud. isconfigurations of security controls, roles with e cessive permissions, vulnerabilities in container and host images, and internal threats and evolved attac s that evade legacy security all at the scale and speed of cloud become critical blind spots used as attac vectors. Security in the cloud is a multidimensional challenge that must ta e into account professionals, processes, technologies, and threat risk.
Slowing down developers isn t an option, so a new security model needs to be in place that's developer and DevOps friendly without giving up on security. Deep visibility enriched with full context and integration into developers' tools and processes, paired with unified cloud and container security, will drive better security practices.
pen source will play a significant role in cloud-native security. roprietary security stac s will never match open-source security stac s. Blac bo solutions don t provide the re uired e ibility and transparency to meet the specific needs of organi ations. ith open source, organi ations can fully understand and customi e detection rules, as well as count on crowdsourced security policies, features, and bug fi es to better eep up with cyber threats.
Foreword v
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

The right approach to securing containers and cloud requires implementing security all the way from the source through production. This includes shifting left to protect the pipeline with image scanning and also managing configuration and access ris s and detecting runtime threats and compliance violations.
aving founded Sysdig, one of the leading companies in cloud and container security, understand how important it is to start from the basics when diving into new technologies. This book serves as a primer and simplifies comple topics to ease your path into learning about cloud security. Happy reading. Loris Degioanni Founder and CTO at Sysdig
vi Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

Introduction
Organi ations are all at different stages of their cloudnative ourney and want to ta e advantage of the speed, scalability, and automation of the cloud. rom early liftand-shift migrations to more mature application development using containers and ubernetes, the cloud provides agility to ship applications faster.
his shift has introduced new security challenges, though. Security teams are now struggling to get visibility into their cloud environment, conte tuali e and prioriti e investments, and deploy security solutions and processes without slowing down the business.
n the cloud shared responsibility model, cloud providers protect the underlying physical and virtual infrastructure that customers don t need to manage. But that means users don t have direct access to gain visibility and can t customi e configurations. All services used to build and run applications and store data are the customer s responsibility to secure. n other words, the customer assumes responsibility for applying the necessary security controls and protection to manage security ris and meet compliance re uirements for its cloud environments, including identities, permissions, and threat detection. So, cloud providers secure the cloud, and customers secure what they use, store, and run in it.
t can be tempting to try using e isting security tools to protect cloud services. Unfortunately, these tools can t see everything happening inside clouds and containers to provide effective security. Using a tool designed for data centers also adds unnecessary comple ity to wor ows and slows down application delivery. Secure Dev ps integrates security into the Dev ps wor ow and avoids slowing down software releases.
endors that are trying to ease adoption often tout an agentless approach to cloud security, but those rely on the limited information provided by cloud application programming interfaces A s . hey fall short because these solutions can t see container runtime behavior, so they aren t suitable to detect the full range of cyber threats.
Introduction 1
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

A better approach for cloud and container security is to adopt a unified approach that uses both agentless and agent instrumentation. Avoid using siloed tools because they create visibility gaps, inefficient processes, and e cessive overhead. ools that combine agentless and agent-based approaches offer the most comprehensive visibility and protection.
About This Book
his boo gives you a loo into better understanding cloud security and how you can adopt an approach that wor s for your company and secures all your containers and cloud environments. Secure Dev ps is ey to managing ris without slowing down application delivery. ou need deep and unified visibility across your environments to see inside containers and see changes to cloud configurations and get conte t given the volume of microservices.
Icons Used in This Book
ou may notice little pictures in the margins of this boo . f you ta e the time to peruse them, here is what they mean
he ip icon gives you e tra help, saves you time, or may even save you money. Chec these out if you re loo ing for helpful hints on your security ourney.
he emember icon emphasi es important security facts. eep these in mind when securing containers and clouds.
ay close attention to arnings. ou want to avoid security threats and eep your environments running well, right hen heed these warnings.
Sometimes we li e to give you some bac ground information or statistical information. hen we do that, we use the echnical Stuff icon. ou can enhance your security genius with these fun facts
2 Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

IN THIS CHAPTER » Managing dynamic permissions and
on rations » Identifying cloud threats » a in a ni ed t reat dete tion
approach
1 Chapter
Understanding Cloud Security
In this chapter, you discover how to manage cloud permissions and configurations, detect threats in the cloud, and apply a unified approach for cloud and container threat detection.
Managing Cloud Permissions and Con rations
As organi ations mature in the cloud, the number of cloud services their teams use and the identity permissions that need to be managed grow e ponentially. any people refer to these services, which teams use to build and deliver applications, as assets or resources. Configuring cloud assets, roles, and permissions doesn t ta e long to become tedious, time consuming, and error prone.
isconfigurations of assets and overprivileged identities increase the ris of security incidents and are the leading causes of security incidents, so ma e sure that you diligently manage these.
CHAPTER 1 Understanding Cloud Security 3
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

organi ations usually don t start with full control or even visibility over how their cloud assets are configured and which permissions were granted to identities in the cloud. any cloud users manually configure cloud services as needed, li e Simple Storage Service S buc ets, leaving out of the loop and potentially also leaving the company e posed to ris y conditions. ther concerns include accounts of former employees, one-time users, and guest accounts that are left active, and also user identities with unused or unnecessary permissions.
Discovering cloud assets and on ration
Staying on top of e isting cloud assets and their configurations can be challenging if done manually. sometimes misses the actual number by an order of magnitude. o eep up with the cloud s constant state of change, scale, and comple ity, a programmatic approach is re uired. anual processes, besides leaving blind spots, also increase the ris of missing an e posed asset with wea security controls configuration.
isconfigurations could be the result of both unintentional legitimate users and malicious attac er actions. egardless of the nature of the actor, paying attention to security posture by chec ing the status of dynamic cloud configurations is practically a re uirement for cloud environments.
Cloud security posture management CS solutions offer cloud configuration management capabilities. or industry best practices, visit the Center for nternet Security C S and review the C S Benchmar s at www.cisecurity.org/cis-benchmarks. his resource provides you with chec lists for all ma or clouds.
Identifying overprivileged users
verprivileged entitlement of human and non-human identities applications, services, containers, and so on is a top cause of data breaches. Applying the principle of least privilege the concept of providing no more permissions than necessary to perform re uired actions is a wise, but difficult, concept to implement. Cloud providers make permissions granular, which in theory leads to least-privilege policies. owever, the reality is much more comple .
4 Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

n practice, permissions aren t assigned in a precise manner. ften, e isting rules are reused, noting only if the permissions are broad enough to avoid disruption. n modern organi ations, nothing should get in the way of speed and performance not even security. So, developers and often err on the side of e cess. anual fine-tuning would be e cessively time consuming and still not precise.

nactive identities are also a permissions threat. hese identities often get left off because organi ations simply lose trac and lac the ability to be alerted to this inactivity.

Cloud infrastructure entitlements management C

is a ey

tool to have in your cloud security toolbo . Loo for solutions

that can discover excessive permissions across active and inactive

cloud identities and provide guided remediation to implement the

least-privilege principle.

Detecting Threats in the Cloud
hreats can be seen as the activities of cybercriminals, such as phishing, data e filtration, cryptomining, distributed denial of service DDoS attac s, and so on. Cloud threats today are elaborate and comple and have become completely out of the reach of traditional, siloed security solutions that use coarse, out-ofconte t, and non-real-time data. o detect and contain attac s effectively, you need real-time visibility of the full spectrum of malicious activities applied in the attac , including configuration changes that increase ris . or more information on today s global nowledge-base of adversaries tactics, techni ues, and procedures, visit attack.mitre.org.
he good news is that adversaries leave a trail of their actions in some form of recorded events. ne way to detect threats in the cloud is to monitor cloud audit logs for anomalous activities and malicious actions, such as une pected configuration changes and permission escalations.
hreat ris doesn t always result from malicious actions. Cloud configurations are changing constantly and must be monitored for impact to ris . hen developers ma e configuration or

CHAPTER 1 Understanding Cloud Security 5
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

permission changes as they debug or deploy applications, they may not consider the additional risk this adds to the organization, so cloud and security teams must continually evaluate configurations against best practices and their organi ations policies.

Some organi ations send their logs to a security information and

event management S

system and then scan for threats, but

this approach has disadvantages:

» It's not real time, which imposes a delay in the detection of a
risky configuration or an intruder
» SIEM tools are more suitable for forensics analysis not for
real-time detection
» Copying the huge volume of activity logs outside the cloud is
costly and complex to manage and is a potential compliance
violation in certain industries

A more effective and efficient way to detect cloud activity threats is to apply stream detection. ith stream detection, as the cloud audit records are generated, they re analy ed against defined runtime policies. f a suspicious action is detected, a security event is triggered in real time. nly the security event data is sent out, not all logged records. Also, each newly recorded log is analy ed against the conditions of the detection rules, not the entire audit logs storage.
ith stream detection, you can detect in real time signs of cloud threats, such as the following e amples
» Turn-o of activity audit and logging services » Change of user roles to add overpermissive policies » Change to weak or no encryption of data at rest or in transit » Change to weak password settings such as no multi-factor
authentication MFA or no password rotation
» Change to inappropriate firewall rules or network access
controls
» Creation of application programming interface API accounts
with anonymous or unauthori ed access
» Access to S buckets from unusual accounts

6 Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

do tin a ni ed reat Detection Approach
oday s universe of cyber threats is comple . ampering with cloud permissions can ust be a tactical step in an attac scenario that starts with the e ploitation of a vulnerability in a wor load, and being stealthy is the modus operandi. Adversaries adopt evasion techni ues to get around legacy tools defenses and also ta e advantage of visibility gaps left by siloed solutions.
o detect and stop cyber threats in any environment, the first step is to see them. rying to piece together data from siloed solutions slows down detection, and you may even miss the threat. f you don t see the threat, you can t stop it from spreading. As malicious activities could be happening in your applications, containers, ubernetes, cloud assets, servers, and serverless platforms, a unified approach to threat detection is critical.
n this section, you discover the importance of unified threat detection for cloud and containers and why having a single event store, common policy language, and open source-based solution provides the foundation for unified security.
Single event store
n a unified approach, all detected events are in a single event store, enabling a sequenced event timeline that shows the attack in evolution. Siloed data slows down detection and may also be completely unsuitable to detect subtle and malicious aspects of a single action. hen you use siloed security tools, you only see each activity in isolation, never putting together the complete attac . n sophisticated attac s where multiple systems are infected with malicious artifacts, li e bac doors and malware files, without complete visibility of the attac components and blast radius, it could ta e months to completely remove the attac er from the environment.
A centrali ed view, revealing attac ers se uence of steps from initial access through lateral movement and malicious actions across cloud and container environments, empowers security teams with the necessary information for immediate containment and removal of malicious artifacts.
CHAPTER 1 Understanding Cloud Security 7
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

ni ed o i an a e

Detection policies should be set consistently across your cloud

environment. Different policy languages add a learning curve and

semantic gaps and may introduce parsing and translation loss

when evaluating events. A single policy engine to detect threats

across cloud and containers increases efficiency of security teams

wor ows, which not only ma es policy management easier but

also reduces mean-time-to-recovery

incidents.

Open-source validation
Security demands validation and transparency, so you want to avoid proprietary solutions. roprietary tools are usually controlled by a single organization, and innovation is constrained by their resources and priorities. Solutions based on open-source standards usually have a primary contributing organization, supplemented by a community of motivated users and contributors that bring additional ideas and features. pen source also enables a more dynamic environment for providing feedbac , reporting and fi ing issues, and contributing with improvements. echnology ecosystems also grow much faster around open-source pro ects because having a community-based standard protects investments made in developing integrations. he synergies found in open source drive the collaboration, validation, and speed of innovation that are fundamental to combat modern cyber threats.

Just having security solutions in place isn't enough; you need the confidence that they re effective, can sustain protection against the full range of attac s, and continue to evolve to contain new threats at the same speed as the cybercrime world is evolving.

or cloud threat detection consider alco. alco, created by Sysdig, is the open-source standard for continuous ris and threat detection across ubernetes, containers, and cloud. alco acts as your security camera that continuously detects unexpected behavior, configuration changes, intrusions, and data theft in real time. Sysdig donated alco to the Cloud Native Computing oundation CNC , the vendor-neutral home for many open-source pro ects.

8 Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

IN THIS CHAPTER » Getting to know IaC security » oo in or is on rations » Finding drift » Applying policy as code (PaC) » Securing IaC with shift-left
2 Chapter
Securing Infrastructure as Code (IaC)
To keep up with modern demand for speed and scale, IT operations needed to change how they managed infrastructure. Infrastructure as Code (IaC) technologies were created as a new agile programmatic approach to infrastructure provisioning and maintenance. IaC is incredibly powerful and enables transformative concepts like immutability, which means that changes are never applied directly to a workload in production; if a change is necessary, a new version is deployed and the old one deleted. With IaC, DevOps teams can provision infrastructure in seconds instead of days or weeks. If the templates are carefully constructed, the consistency reduces human error in configurations. owever, in the same way that IaC scales and speeds up deployment, it can also expose the organization to critical security and compliance risks in seconds if security best practices aren't integrated up front. n this chapter, you find out about securing aC, what it means, and how it's implemented from source to production.
CHAPTER 2 Securing Infrastructure as Code (IaC) 9
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

Understanding IaC Security
aC allows engineers to provision servers with specific operating systems, run containers and ubernetes clusters, configure storage and networks, and even integrate third-party services, all using template files. Before aC, administrators, operation teams, and developers had to manually configure item by item of every stack layer deployed.
aC delivers multiple benefits
» Speed » Scalability » Resilience » Cost reduction » Addresses inconsistencies between development and
production environments
But what about security
isconfigurations in the aC template such as erraform, Amaon eb Services A S Cloud ormation, A L files, elm Charts, and so on can easily e pose the environment. Adversaries benefit from aC misconfigurations that wea en the security controls of an organi ation and facilitate attac s. or instance, misconfigured Simple Storage Service S buc ets that leave sensitive data publicly accessible, missing access controls on cloud services application programming interfaces A s , ris y configurations in ubernetes deployments that facilitate container escape, lateral movement, and resource exhaustion, among other threats. his brings up the uestion how do you implement aC security
Implementing IaC Security
Certainly, one must chec for misconfiguration proactively before deploying into production but also detect changes while in production. or the re uired agility in scale, policies must be centrally managed and programmatically implemented. This section gives you the important aspects to consider.
10 Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

annin or is on rations in aC pre-production templates
At the volume in which infrastructure is created and modified in the cloud, manually configuring resources eventually becomes tedious, leading to errors and compliance violations. The bottom line is that IaC templates can't be left unchecked before deployments. Scanning for misconfigurations in aC pre-production templates is a part of a shift-left approach in security, which means introducing checks and remediation during the development phase, and represents a fundamental step for a secure Dev ps wor ow.
As your developers increase the code delivery pace, ma e sure to put guardrails in place so they can maintain agility without compromising security. Create a baseline for security policies applied to IaC templates and check for violations before deployment in production. In today's agile environment, automation delivers speed and consistency, so make sure that IaC security checks are integrated into your continuous integration and continuous delivery (CI/CD) pipelines.
Detecting runtime drift and applying auto-remediation
Runtime drift is the difference between the originally defined values and what s running in production. Applied to aC, a runtime drift means that the current configurations in production differ from the values defined in your policies and chec ed predeployment. or instance, is a S buc et now allowing simple password access
ven well-implemented aC security for cloud configuration templates in a C CD pipeline will suffer from drift. Drift can result from intruders' malicious actions and also from wellintentioned employees, such as site reliability engineers (SRE) acting on emergencies and DevOps teams applying a direct change to a cloud asset. The bottom line is that drift happens. Cloud security solutions must continuously check the state of cloud assets and services to verify if they match what has been defined in the respective deployment template.
CHAPTER 2 Securing Infrastructure as Code (IaC) 11
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

Runtime drift can also happen in workloads, such as Kubernetes clusters. Just a few examples of drift in Kubernetes include
» The API server allowing anonymous authentication when it
initially was set to deny
» Containers running as root when privileged containers aren't
allowed
» Pods running containers without resource utilization limits set
deally, you shouldn t have to define pre-production and runtime security policies separately. The same IaC security policies applied in the CI/CD pipeline can and should be applied at runtime. This approach offers many advantages
» It avoids increased overhead and gaps due to di erent policy
language semantics and granularity.
» It enables easier automation of remediation. » It can be seamlessly mapped back to the IaC configuration
template file and then be fixed via a pull re uest PR and reconciliation rechecked across CI/CD pipeline and production.
» Auto-remediation with a simple Git PR to fix the violation at
the source reduces exposure and mean-time-to-recovery (MTTR), improving the performance of the security, development, and operations teams.
Applying policy as code
As infrastructure becomes increasingly deployed as code, you must also define and manage security policies as code to eep up. olicy as code aC allows you to leverage a shared policy model across multiple IaC, cloud, and Kubernetes environments. Not only does aC provide consistency and strengthen security, but also it saves time and allows you to scale faster.
aC can be implemented by using the open-source pen olicy Agent A , which provides a framewor for policy-based controls in cloud-native environments. or instance, organi ations can create one A policy that can be consistently applied against different cloud and ubernetes environments and across all stages of the application life cycle. A offers a common and powerful
12 Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

language that allows security teams to decouple security policy management (for example, read, write, analyze, version control, and so on) from the management of the cloud infrastructure and services. mplementing aC minimi es ris by providing security teams with a way to centrally define and manage policies, removing opportunities for human error and internal threats. With a partnership between developers, IT operations, and security teams to define and deploy consistent policies, you lay a foundation for your organization to move fast with less cyber risk.
Securing IaC from source to production
he bad guys are ta ing advantage of cloud misconfigurations and learning how to exploit Kubernetes weaknesses. Identifying and eliminating ris y configurations pre-deployment and in production must be a top priority. IaC security starts with a shift-left approach and also enforces security and compliance at runtime, detecting and correcting drift from original values. By implementing a unified wor ow that defines and enforces aC security policies programmatically from source to production, organizations can improve productivity, close security gaps, and enable stronger collaboration between developers, operations, and security teams.
CHAPTER 2 Securing Infrastructure as Code (IaC)
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

IN THIS CHAPTER » Seeing the vulnerabilities in containers » Using vulnerability scanning » Integrating vulnerability management
3 Chapter
Preventing Vulnerabilities
Vulnerabilities are software bugs or weaknesses that could be used by an attacker. They could be present in the operating system, application code, and third-party code dependencies, such as libraries, frameworks, programming scripts, and so on. By taking a secure DevOps approach and identifying vulnerabilities early in development, you avoid frustrating developers with delays when an application is ready for production. So, preventing vulnerable workloads from entering production is paramount, but keep in mind that new vulnerabilities and exploits can be discovered for software already in production. Scanning for vulnerabilities must be done throughout the entire workload life cycle, including at runtime. In this chapter, you discover how to identify vulnerabilities in container images and hosts, integrate vulnerability assessment and controls in your software development life cycle, and unify container and host vulnerability management.
CHAPTER 3 Preventing Vulnerabilities 15
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

Understanding Vulnerabilities in Containers
Modern cloud-native workloads run as microservices built on containers and deployed as Kubernetes clusters in the cloud. A vulnerability in a container can be exploited to grant attackers a foothold into your Kubernetes cluster, and from there, they can find ways to move laterally in your cloud environment.
According to the Sysdig 2022 Cloud-Native Security and Usage Report, 75 percent of images running in production contain patchable vulnerabilities of high or greater severity. The risk of exposing your organization through vulnerabilities present in containers is very real.
When securing containers, it's important to understand where vulnerabilities could be and how they could be introduced in your environment. Containers are built from read-only files called container images. Container images can be built totally from scratch or, more commonly, by using other available images, creating a layered structure. A base image (for example, Ubuntu, Debian, BusyBox, Alpine, and so one) provides the operating system (OS) dependencies and serves as a foundation for all other layers. The next layer could be a language or framework image, such as Ruby Gem, Python PiP, Node.js npm, and more. By using those readily available images, developers speed up development with a jumpstart. But, they could also be inadvertently introducing vulnerabilities into their containers.
any developers aren t aware that even official images stored in popular registries aren't safe. Unfortunately, these repositories have been used as a channel to disseminate vulnerable software by malicious actors, like in supply chain attacks. For instance, DockerHub repository is known for having high-severity or critical vulnerabilities in a significant portion of its publicly available images. Some repositories offer vulnerability scanning however, the scanning is often done just on OS images.
According to the Sysdig 2022 Cloud-Native Security and Usage Report, a high rate of high-severity or critical vulnerabilities exist in nonOS image layers. Both OS and non-OS images must be scanned.
16 Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

Image scanning is a must-have in container environments. The application code and all image layers' dependencies (OS and nonOS) in the container could have software vulnerabilities. As new vulnerabilities in existing software packages can be discovered at any time, scanning and auditing container images isn't a onetime deal. The process requires continuous monitoring that starts with your code development and extends to production.
Integrating Vulnerability Scanning into DevOps Life Cycle
Integrating vulnerability scanning into the software development life cycle (SDLC), as for Infrastructure as Code (IaC) security, starts with a shift-left approach by embedding scanning early in the continuous integration and continuous delivery (CI/CD) process. Checking container images earlier ensures that development can run fast without costly fi es to the final build, and security isn't a blocker for delivery.
This section lists some best practices to prevent vulnerabilities in container environments, including integration with Kubernetes admission controller as a last line of defense to block a vulnerable container from being deployed in a Kubernetes cluster.
Automate vulnerability scanning in the CI/CD pipeline
Integration with developers' existing tools is key to successfully introducing security into DevOps processes. So, you should embed image scanning into the CI/CD pipeline to catch vulnerabilities (in all image layers, dependencies, and artifacts) early in the development life cycle. By doing so, you will also be saving engineering cycles re uired in more comple late fi es. ntegration with C CD tools, such as GitHub, Google Cloud Build, and Amazon Web Services (AWS) Codebuild, can be done in two main forms, by pulling out the images for scanning or via inline scanning.
Inline scanning offers a more secure process. ith inline scanning, your application code doesn't leave your environment because you don't need to send a copy to an intermediary repository for scanning. Only the metadata of the scan results are sent out for
CHAPTER 3 Preventing Vulnerabilities 17
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

policy evaluation. Scan results are passed back to the pipeline, resulting in a pass or fail event.
Take a look into remediation cases that could be automated or facilitated, such as vulnerabilities with a fi re uiring a low-ris version update of a package. And for those vulnerabilities without a fi or with a fi that would re uire more comple remediations, consider compensating controls with a risk assessment.
Automate registry image scanning
Keeping your private image repositories and registries free from vulnerable container images is another security best practice. Organizations commonly use registry services like DockerHub, Amazon Elastic Container Registry (ECR), Google Container Registry, and rog, among others. ven though these registries offer vulnerability scanning features, make sure that they're comprehensive. Make sure that your registry covers each and every image layer and S and non- S dependencies. ost only offer S image scanning, so your scanning solution should check for vulnerabilities in non-OS packages as well. Developers may be unknowingly pulling in vulnerabilities from non-OS open-source packages such as Python PIP, Ruby Gem, and more, which introduces security risks.
Protection against image tampering is also important. Make sure to digitally sign images and check signatures before using them.
erifying image signatures can assure that the specific image digest has been signed by the publisher.
As in the case of CI/CD pipeline integration, image scanning integration with registries can be done by pulling out the images to execute the scan or by scanning them inline. Organizations usually prefer inline scans that are done without pulling their images to a third-party repository for scanning.
Enforce vulnerability security with Kubernetes admission controller
Kubernetes admission controllers are the last line of defense before exposing the organization to container vulnerabilities in Kubernetes clusters. The admission controller evaluates requests to the Kubernetes application programming interface (API) server, then determines whether to allow the request. As an example, a
18 Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

request for a Pod deployment could be denied if the admission controller receives a failed status on a check.
Admission controllers offer an e tensible solution to enforce security policies using webhook integrations. Therefore, image scanners can be integrated with the admission controller to provide vulnerability check status prior to a container deployment in production. ubernetes admission controllers also provide e ible rules to accept or reject requests based on the environment specifications. So, it is important that the vulnerability scanning solution also supports rich context within scan results so the environment context such as cloud, container, Kubernetes, and application criticality, among others, can be used to assess risk and define the appropriate policies.
Prevent vulnerabilities in serverless workloads
In serverless computing, cloud providers dynamically assign resources to run your workloads, but in a shared responsibility model, you're responsible for protecting these workloads. Vulnerabilities in your code and dependencies can still provide attackers with a way to compromise your environment. You can and should implement vulnerability scanning on serverless workloads as well.
or instance, before launching a tas on A S argate a serverless computing platform service to run containers as a service (CaaS) without the need to manage the underlying infrastructure you could automatically trigger the scanning of the container image in the AWS ECR repository. And again, scanning can be implemented inline or by pulling out the image. Make sure that all layers are verified for vulnerabilities and that you can bloc deployment if high-risk ones are found.
Manage vulnerabilities at runtime
New vulnerabilities and exploits are discovered every day on new and old versions of software packages and OS distributions. If you're only scanning at the build stage, you're leaving yourself exposed to recently discovered vulnerabilities.
Managing vulnerabilities in your runtime environment is necessary. Your vulnerability management solution should keep track of images deployed in production and alert when an image is
CHAPTER 3 Preventing Vulnerabilities 19
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

affected by new vulnerabilities in feed updates from vulnerability data sources. Security tools use different strategies to achieve this. One way is to rescan all images periodically, but that's not an efficient use of your resources. deally, the image metadata of deployed containers is stored and new vulnerabilities can be detected without the need of a full rescan.
Let us just add this additional observation point: Alerting to vulnerabilities at runtime without conte t isn t really effective. nvironment information, such as cloud, Kubernetes, and application context, is necessary for risk assessment, remediation prioritization, and guidance regarding containment and compensating measures.
Implement host scanning
Hosts are the computing instances where your containers run. In Kubernetes environments, hosts are the nodes of a cluster where Pods are deployed, and an estimated quarter of organizations in the cloud have unpatched hosts with high severity and critical vulnerabilities. Although not as numerous as containers, vulnerable computing instances in public clouds expose the organization to serious risks.
Securing host virtual machines (VMs) is just as important as securing the containers running on them. Make sure that you have a tool in place that can scan hosts. For example, cloud VMs (computing instances such as EC2s) are hosts that need scanning. Host scans must also be done regularly, so your teams are given actionable information to prioritize and expedite remediation.
Adopting a Single Vulnerability ana e ent or o or
Containers and Hosts
Siloed solutions create security gaps and inefficiencies. Adopting a unified approach to vulnerability management for containers and hosts speeds the time to detect and remediate vulnerabilities, while generating fewer alerts. Organizations are often faced with thousands of vulnerabilities detected in their environments while their teams can only timely handle a small fraction of them.
20 Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

rioriti ation and efficient remediation have become fundamental to vulnerability management.
is comes in different forms. Not only do vulnerabilities in the code expose your environment to threats, but also it's important to verify if security best practices are followed as well as all compliance standards and regulations that your organization adheres to.
In this section, you dig deeper into vulnerability prioritization.
Implement vulnerability prioritization
ow to prioriti e which vulnerabilities to fi is a constant challenge for resource-constrained security teams. Evaluating only the severity of a vulnerability may lead to cycles spent on vulnerabilities that don't represent practical risk. When you're doing prioritization, the crucial decision to make is about what can't wait. So make sure to also include in your analysis contextual risk that reveals the true relevance of a critical vulnerability to your environments.
Think about the following questions:
» Is the vulnerability located in packages loaded when the
container is running, and therefore with real chances of being exploited, or in a package that isn't used?
» Is the vulnerability exposing critical applications? » Is the vulnerability present in environments that aren't
externally accessible?
» Are there available exploits being used, and if so, what's the
reported threat activity?
As you answer these questions, it will become clear which vulnerabilities in your environment context are truly exploitable and incur high risk to the organization. Those areas are the ones where you need to focus your remediation efforts.
anaging vulnerabilities re uires understanding how to effectively reduce risk in your environment. Make sure that your vulnerability scanning solution provides detection of vulnerabilities on containers and hosts. Check the quality of the threat data and context provided with the vulnerability alert for prioritization and remediation, tracking improvements in reducing exposure risk.
CHAPTER 3 Preventing Vulnerabilities 21
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

Check for compliance requirements
Unified host and container scans can be used beyond vulnerabilities checks. The scans can also validate regulatory compliance (for example, PCI DSS, NIST regulations, SOC 2) and security best practices, such as the Center for Internet Security (CIS) Benchmarks. Scanners should detect security risks, such as port misconfigurations, unprotected secrets, open-source software SS licenses, and file integrity, among security controls. For more information on regulatory compliance obligations, chec out Chapter .
22 Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

IN THIS CHAPTER » Understanding runtime security » Using Kubernetes NetworkPolicy » Being prepared for incident response
4 Chapter
Detecting and Responding to Threats
Security is top of mind for cloud security and DevOps teams. Shifting security left by removing ris y configurations and vulnerabilities before deployment into production does the important job of hardening your environment. However, according to the Sysdig 2022 Cloud-Native Security and Usage Report, 75 percent of containers running in production contain high or critical vulnerabilities. n practice, most organi ations don t fi all vulnerabilities, so they need a safety net. And, of course, there will always be ero-day e ploits and internal threats. Detecting and responding quickly to suspicious behavior is critical. The sooner an attack is discovered, the faster you can stop it.
n this chapter, you find out about runtime security and how to detect threats in your environments, apply Kubernetes network policies to bloc suspicious traffic, and enable compliance audits and incident forensics.
CHAPTER 4 Detecting and Responding to Threats 23
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

e nin nti e e rit

Runtime security is all about detecting anomalous behavior and threats in production. In cloud-native environments, runtime security is done by observing and alerting to une pected suspicious activities in the containers, Kubernetes, and cloud services.

Detecting threats on containers and hosts

Containers should be monitored at runtime to detect une pected

behaviors related to processes, file input output

, networ

traffic relationships, and user activities. rofiling container

behavior and using the baseline to create detection rules is a good

starting point. But every organization is unique, so make sure

that detection policy rules can be easily adjusted to accommo-

date e ceptions in your environment. his will improve accuracy,

reducing noise.

Attackers can also target the host on which the containers run. For instance, in a container escape, attac ers cloud e ploit host vulnerabilities, deploy malicious code to launch campaign attacks, try lateral movement, and compromise your whole infrastructure. nfected hosts can be used by command-and-control C C or C servers for various purposes, including cryptomining, distributed denial of service DDoS attac s, ransomware, data e filtration, espionage, and so on.

Being able to detect malicious and anomalous behaviors on containers and hosts is critical to protect your environment against threats. owever, having two different solutions for hosts and containers increases overhead, creates detection gaps, and investigation burden. A unified approach with a common policy language and source of truth is ideal. Deep visibility into system calls syscalls to the operating system S ernel provides a reliable source of truth for event data across hosts and containers. Syscalls visibility can be provided by collecting kernel events via kernel modules or eB probes.

24 Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

USING FALCO FOR CLOUD-NATIVE RUNTIME SECURITY
You can use Falco open source to monitor system calls and apply detection rules to alert on anomalous behavior. Falco can detect, in real time when suspicious process file network and user activities occur on containers and hosts and has become the de facto standard for cloud-native runtime security.
Kernel modules are pieces of code loaded into the ernel to e tend its functionality. or e ample, ernel modules can be used to intercept and copy details of system calls to provide deep visibility into system activity. Extended Berkeley Packet Filters eB s are Linu -native technology that enables the safe e ecution of programs in the ernel. eB probes can also be used for observability of system call events and are an alternative to kernel modules. eB offers the additional advantage of already being part of the LINUX operating system, and therefore, it's immutable infrastructure-friendly.
Detecting threats in Kubernetes clusters
Kubernetes has become the "operating system" of the cloud. Its orchestration capabilities enable fast, resilient, and scalable containerized production environments. But Kubernetes can be difficult to secure. isibility at runtime in ubernetes is a challenge and a source of concern for security and operations teams because they re often ying blind.
raditional tools, such an endpoint detection and response D , can't provide visibility into dynamic cloud-native container environments. How can you secure Kubernetes if your detection mechanisms don't see what's going on in containers or what's happening in the cluster? Securing Kubernetes requires a secure DevOps approach that combines deep visibility into system events and activity in the orchestration layer.
CHAPTER 4 Detecting and Responding to Threats 25
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

DEEP VISIBILITY WITH FALCO
Falco provides the deep visibility required to secure Kubernetes at runtime Falco policy rules can look at anomalous behavior inside containers and also detect suspicious user activity analyzing the stream of Kubernetes audit logs. A suspicious process running that's followed by a Kubernetes application programming interface (API) call can reveal a compromise.
The open-source community has been creating Kubernetes security rules with Falco, so you don't have to start from scratch. Out-of-thebox policies map to security frameworks such as MITRE ATT CK to help security operations center (SOC) teams streamline their detection and response workflows
Detecting threats in the cloud
Another important aspect of runtime security is to check for suspicious activity or risky behavior being performed in the cloud. Cybercriminals will leave an activity trail that gets recorded in cloud activity logs when carrying out their attacks. Compromised cloud accounts will have intruders changing permissions, deactivating multi-factor authentication A , and leaving buc ets e posed to the public, among other malicious activities.
FALCO IN THE CLOUD
Monitoring cloud audit logs, such as Amazon Web Services (AWS) CloudTrail, Google Cloud Platform (GCP) Audit Logs, and Azure API Management logging records, is how you can detect malicious actions in the cloud. And Falco is the tool for the job. Because Falco analyzes cloud audit logs against security policies using stream detection, instead of looking for patterns in a large log store as is done with security information and event management SIEM solutions it can catch an intruder in real time.
Falco can also improve the cost-e ectiveness of SIEM solutions Exporting data outside the cloud is expensive. Using Falco's stream detection to send only detected events to SIEM saves money by reduced data transfer expenses and SIEM data storage fees. By reducing incident response time you reduce the risk of data loss
26 Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

o in ne e ted ra

it

Kubernetes NetworkPolicy

By default, all pods within a Kubernetes cluster can communicate with each other without any restrictions. In the case of a container compromise, the whole cluster is at risk of a threat moving laterally. Segmenting network access by giving permission to only what's needed is recommended because it would limit the blast radius of a breach. ubernetes Networ olicy resource offers a mechanism to do e actly that.
ubernetes Networ olicy resource doesn t re uire deploying a sidecar an additional container deployed in the same pod with the application container pro y, so you can enforce networ security without additional operational burden.
ne way to implement networ policies is to profile your containers networ traffic and create a baseline for the communications e pected to and from the containers. or instance, what other services does the container communicate with? What are the ports used Does it handle traffic from the internet
After the container networ traffic behavior is well understood, it can be used to define the ingress and egress policies in
ubernetes Networ olicy resource. All traffic that differs from what s defined as allowed will be bloc ed. By using networ policies in your ubernetes cluster, you can implement effective network segmentation aligned to Zero-Trust principles of microsegmentation.

Planning for Incident Response and Forensics
Container environments also create challenges for incident responders and security forensics teams. Containers are ephemeral, with many lasting for seconds or only a few minutes; after they re gone, how do you investigate them atters get worse in container as a service environments that offer no visibility or control of the underlying hosts and runtime environment.
or instance, if a wor load tas performs a suspicious file system

CHAPTER 4 Detecting and Responding to Threats 27
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

change, how do you verify if there was a breach and a compliance violation? If containers are compromised, attackers can use them for cryptomining or perform lateral movement to gain full access to your data.

Detecting, responding, and investigating threats in containers running on host instances or on serverless services requires deep visibility into workload activity. So, make sure that you can collect granular data on workload activity and an audit trail to investigate what, who, and how it happened. The volume of cloud security events is growing and having the necessary data to rapidly respond to incidents on hosts and containers is critical.

Get deep visibility before and after an incident
A source of truth, such as syscalls, that reveals process, disk, and networ activity before, during, and after the event will e pedite investigation. isibility into user actions and commands used will also help connect the dots faster. a e sure that your security solution collects data for forensics for a postmortem analysis, so you're able to answer the "when," "what," "who," and "how" questions that come up during an investigation.

Get full Kubernetes and cloud context

a e sure you leverage rich cloud and ubernetes conte t met-

adata to better prioriti e incidents. Lac of conte t will result in

alert overload and higher mean-time-to-recovery

in

cloud-native environments. Also, look for solutions that present

all events in a unified timeline. t will ma e it easier to understand

a potential cyberattack chain with a sequence of events across the

cloud and containers. SOC and DevOps teams should have security

and conte tual information readily available.

Integration of detection, investigation, and remediation work-

ows will also improve

. aving uic access to suspicious

containers for local investigation and mitigation straight from the

alert can save many cycles of investigation. Looking directly into

local logs, container files, and process memory dumps will reveal

what adversaries may be trying to hide. ith full stac conte t

and a clear picture of the e tent of the incident, faster, more

effective, and more efficient remediation can be done.

28 Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

IN THIS CHAPTER » Looking at the challenges of compliance » Applying compliance checks » Taking advantage of open-source tools
5 Chapter
Keeping Containers and Cloud Compliant
From internal security practices to industry regulations and even laws, all organizations are subject to some kind of cybersecurity or regulatory compliance obligations. Specific mar ets and industries have specific regulations and standards they enforce. Guidelines also come in the form of best practices, but regardless of the type of enforcement applied, meeting compliance is a must have for organizations moving to the cloud. Check out the later section "Implementing Compliance Checks Across Cloud and Containers" for more information on common regulatory standards and cybersecurity best practices. In this chapter, we tell you all about the challenges of cloud compliance, how to check compliance and governance, and what open-source tools you could use.
CHAPTER 5 Keeping Containers and Cloud Compliant 29
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

Facing Compliance and Governance Challenges in the Cloud
Cloud environments configuration e ibility and dynamic nature make it hard to meet compliance, stay compliant, and prove it. Ad hoc compliance assessments don't work for the cloud. Ever-evolving and increasing threats augment the risk of noncompliance and demand continuous checks.
Cloud and Kubernetes security controls are foundational to compliance standards and regulations. Unfortunately, misconfigured security controls are common due to user errors and malicious actions. Staying compliant re uires a continued effort in cloud security posture management (CSPM) and Kubernetes security posture management (KSPM). Compliance requires that security posture must be enforced at provision, checked for drift in production, and validated via audit reports.
To achieve and manage compliance, your organization needs to take critical action in the following areas:
» sset and on ration in entor The first challenge
faced in achieving and managing compliance is keeping an up-to-date cloud inventory From cloud services to Kubernetes and serverless containers visibility is fundamental for compliance Make sure to discover all cloud assets and their respective configuration
» a in o ontro s After you assess your inventory map
relevant compliance standards and regulations to cloud and Kubernetes configuration parameters Tackling this area means getting all control points aligned to satisfy the re uirements of compliance security and audit teams
» o i en or e ent Create policies to check and enforce
the controls from the preceding bullet in an automated fashion Applying consistent policies across environments facilitates automation of compliance and governance
» a idation n-demand assessments are core to passing
audits as well Providing satisfactory evidence in audit processes re uires periodic and on-demand checks accompanied by comprehensive reports that show proof of compliance
30 Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

Detailed cloud and Kubernetes audit logs as well as granular container forensic data such as system calls are good sources for evidence that prove compliance
Implementing Compliance Checks Across Cloud and Containers
Implementing regulatory and corporate compliance checks for cloud and container environments, such as Kubernetes, can be overwhelming, but it doesn't have to be. Some commercial security products have mapped requirements for standard compliance controls to policy rules and can detect violations.
When you're implementing regulatory and corporate compliance chec s within your organi ation, loo for tools that offer out-ofthe-bo chec s to meet common regulatory standards and cybersecurity best practices, such as the following:
» NIST » SOC 2 » PCI DSS » HIPAA » GDPR » The Center for Internet Security CIS benchmarks
FILE INTEGRITY MONITORING
File integrity monitoring FIM is a key capability to implement to check multiple boxes It s a re uirement to meet many standards and regulatory re uirements Additionally because FIM gives you visibility into changes applied to your files and directories it could reveal suspicious activities such as access to sensitive data tampering of container images modification to critical system files and so on Therefore threat detection in containers and hosts is also a core FIM use case By monitoring file integrity you can detect leaked credentials and installation of malware for instance
CHAPTER 5 Keeping Containers and Cloud Compliant 31
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

Organizations can drift in and out of compliance between audits. Providing evidence that proves compliance is critical. Keep records of all container, ubernetes, and cloud activity with rich conte t for fast interpretation. Those records are crucial to removing doubts of compliance when you're investigating incidents.
Compliance is continuous, requiring repetitive tasks. Therefore, organi ations can benefit enormously from automation. rom policies to detection of drift and reporting on compliance status, make sure that you look for solutions that enable automation of wor ows. And, although compliance isn t the same as security, it should be part of a holistic cloud security strategy.
Using Open-Source Tools to Help with Compliance
Open-source tools are resources that help you meet your compliance and security goals. pen olicy Agent A and alco are two open-source tools that can be used to manage compliance in the cloud, Kubernetes, and containers.
OPA
A provides policy-based controls that are e ible and finegrained to conform with administrative needs in cloud-native environments. It provides a single policy language and application programming interfaces (APIs) to enforce compliance consistently in all stages of cloud resources provisioning, workload deployment, and runtime. or more information, visit www. openpolicyagent.org.
Falco
alco open source is the most adopted tool for cloud-native runtime security. ts e ible rules engine allows the detection of practically any type of anomalous host or container activity, including compliance violations. o find out more, chec out falco.org.
32 Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

IN THIS CHAPTER » Getting the most out of your application
performance and availability » Targeting issues quickly with granular
metrics » Simplifying your monitoring
environments » Steering clear of vendor lock-in
6 Chapter
Targeting Monitoring and Troubleshooting Issues
Over the past few years, the infrastructure and ecosystem evolution with microservices and containers has made many traditional monitoring tools and techniques irrelevant. Instead, developers need solutions that can adapt to the short-lived and isolated nature of containers and application services. As environments become more complex, simplicity and compatibility with open standards will be required to keep ahead of performance issues that can arise. In this chapter, you dive into the key fundamentals of monitoring container environments.
CHAPTER 6 Targeting Monitoring and Troubleshooting Issues 33
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

Maximizing Application Performance and Availability
Containerized applications running in production must be constantly monitored for availability, errors, and service response times. Achieving this level of monitoring requires the collection of a wide range of telemetry and event data. Sources and approaches for collecting and presenting this information can vary.
Measuring the internal state of your system through the examination of data outputs is called observability. In order to achieve observability when monitoring your application environment, you need to collect metrics, traces, and logs. We cover those in this section.
After you've collected these data points, make sure to analyze them for anomalies that indicate the relative performance of your environment.
Metrics
As the foundation of monitoring, metrics are predictable counts or measurements that are gathered over a specific period of time. By collecting and correlating container metrics with infrastructure and orchestration data, you can monitor the performance, health, and state of your containerized applications and then maximize availability. An example of a metric is the amount of central processing unit (CPU) used on a system at a given point in time.
Logs
Logs are time-stamped records of discrete events that can store outputs from applications, systems, and services. They provide insight into what changes in your system's behavior when something goes wrong. For example, an application log may tell you what errors were registered just before an application crashed.
Traces
Traces are pieces of information about a transaction or request from your applications or systems that enable you to follow the transaction or request from beginning to end. A single trace displays the operation as it moves from one node to another in a distributed system. For example, traces help pinpoint where failure occurs and what causes poor performance of a purchase transaction in a web application.
34 Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

Troubleshooting Problems Faster with Granular Metrics
A key challenge with troubleshooting containers is that they may no longer exist after a problem occurs. In fact, the Sysdig 2022 Cloud-Native Security and Usage Report states that about 44 percent of containers live less than 5 minutes. In some cases, this is by design.
Containers are often described as ephemeral constructs that last for only as long as they're needed. When their single task is complete, the container is stopped, destroyed, or otherwise disposed of while the application moves on to the next step in its process. Orchestration tools schedule and reschedule containers as the environment changes. Comprehensive container monitoring solutions should include the ability to automatically record all the activity on a system that takes place surrounding an event, like a container that was killed. Capturing information such as commands, process details, networ activity, and file system activity allows after-the-fact investigation, even after containers are gone and outside the production environment.
The important metrics and techniques to use when troubleshooting container environments include
» Kubernetes resource utilization: Make sure your monitor-
ing tool can help you troubleshoot issues such as crashloop backo s pod evictions and resource allocation and limits See which containers are running out of CPU memory or file system resources leading to throttled or killed containers
» Event correlation: Contextuali e metrics and understand
the why faster with a unified view of both metrics and events Events from Kubernetes such as deployments and node failures as well as alert events security violations and custom events should be presented alongside your key metrics for faster correlation and problem resolution
» Application and service golden signals: Golden signals can
help you understand which signals are most significant in your environment Golden signals for monitoring include latency errors traffic and saturation Understanding these signals can help make sure your application environment is
CHAPTER 6 Targeting Monitoring and Troubleshooting Issues 35
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

performing optimally Set up dashboards that provide immediate visibility into what matters most for faster troubleshooting
» na sis o s s a a t re es In order to lower mean-
time-to-recovery MTTR you should capture in-depth system call activity to more e ectively triage issues in your container environment even if containers are already killed This helps you reproduce step-by-step run processes and commands reconstruct read and written files including logs visuali e traffic on network connections and more By having these details at your fingertips you can find the source of the problem and resolve it uicker
» Segmentation of key metrics to focus investigation:
Don t rely solely on container level usage information ou need to get resource usage information at the process level inside the container to e ectively troubleshoot problems Segmenting key metrics by process can help eliminate false positives when troubleshooting container errors and performance problems If you don t have container process level metrics you won t be able to pinpoint the root cause
Simplifying Complex Monitoring Environments
When you have complicated environments, like Kubernetes and containers, the last thing you need is a complicated monitoring tool with complicated procedures. A streamlined monitoring approach that still gives you the details when you need them is necessary to run cloud-native wor loads efficiently.
In order to maximize your results, invest in the following:
» Scopes: Finding the source of a problem in a large
Kubernetes environment isn t ust like finding a needle in a haystack It can feel more like finding a needle in a needle stack. With so many entities to examine help yourself out and scope your monitoring metrics down to ust a particular region deployment namespace or workload to minimi e the noise and focus on the signal you re looking for
36 Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

» Pre-built dashboards: Building meaningful dashboards can
take a lot of time and e ort and you may still miss critical information if you aren t already an expert who knows what to look for Find a tool that provides out-of-the-box dashboards designed to provide best-practice views of modern applications and infrastructure Community resources also exist for dashboard templates that you can use to monitor popular applications and workloads so you can immediately gain visibility into application health when monitoring Kubernetes and cloud services
» Pre-built alerts: E ective alerting is at the bedrock of a
monitoring strategy Naturally with the shift to orchestrated container environments and Kubernetes your alerting strategy will need to evolve as well our alerts should be ready for you to enable with recommendations based on best practices so you don t need to guess at the right thresholds instead you can tweak them to suit your needs Use your monitoring tool to identify your golden signals and then set service level indicators S Is and service level ob ectives S s These help you narrow down where and when your alerts need to be triggered
» Integrations: The number of di erent applications and
services you need to monitor in a Kubernetes environment is enormous Finding a tool with a wide range of integrations for applications and cloud services eliminates blind spots and saves you time by eliminating DI approaches and costly maintenance
Avoiding Vendor Lock-In
Open-source software has become the way to ensure that applications are reliable, extensible, and secure. Unless there is a game-changing feature that can't be implemented in an open way, proprietary tools should be avoided because they lock you into their closed ecosystem, limiting your choices. However, the maintenance burden of using open-source software yourself can be costly. Often, companies would rather have employees spending time on business building efforts instead of maintaining tools.
his is where open standards come into play. By buying and using tools that support open-source software and employ open standards, organizations can get the best of both worlds.
CHAPTER 6 Targeting Monitoring and Troubleshooting Issues 37
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

ey functionalities that benefit from adopting open-source standards include the following:
» Metric collection: Many monitoring tool vendors have
deployed a proprietary approach to collecting and storing the metrics they collect This means that in order to access those metrics you re re uired to use their software ther vendors use open standards for metric collection and storage like the Prometheus pro ect This approach provides the maximum flexibility because you can use standard application programming interfaces APIs to interact with your metrics without necessarily having to install your own Prometheus environment
» Integrations: Integrations for application and cloud services
are necessary if you want to be able to correlate those metrics with the ones you re collecting from Kubernetes and other infrastructure resources However configuring and maintaining these integrations yourself can be time consuming At the same time using a vendor s proprietary integrations could leave you with reduced functionality and lead to vendor lock-in
A better approach would be to pick a monitoring tool vendor that manages and supports the integrations for you while also using open source An example of this would be Prometheus exporters If your vendor can deploy and support Prometheus exporters as part of its monitoring software you ll eliminate most of the maintenance and still be following open standards
» Querying your monitoring data: Consider how you ll uery
your metrics to create meaningful views of your data Pre-built dashboards can only go so far and you ultimately need to create some custom views that address your particular use case or environment Many vendors have created proprietary methods and uery languages in order for customers to uery the data in their proprietary metric store This can again lead to vendor lock-in and limited functionality
ook for a monitoring tool that uses a uery language based on open standards for uerying data such as S or Prom to make sure you have the functionality and flexibility you need to create meaningful dashboards and alerts
38 Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

IN THIS CHAPTER » Securing the CI/CD build » Implementing cloud and runtime
security » Avoiding vendor lock-in
7 Chapter
Ten Considerations for Securing Cloud and Containers
Throughout this book, we present principles, processes, and technologies for organizations to run secure, compliant, reliable, and cost-effective cloud and container environments. A vast set of security controls, compliance re uirements, and best practices need to be in place to achieve these goals. A good way to define your implementation strategy is in terms of specific ob ectives you want to meet on your ourney. ost organizations adopt the cloud and containers to accelerate application development, and by adopting a secure Dev ps approach and embedding security into the Dev ps wor ow, you can ensure security controls don t slow down developers. n this chapter, you find ey considerations to eep in mind as you put together your plan for securing clouds and containers.
CHAPTER 7 Ten Considerations for Securing Cloud and Containers 39
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

Secure the CI/CD Build
Shift-left security integrates image scanning into the continuous integration and continuous delivery C CD pipeline. a e sure to scan both operating system S and non- S pac ages for vulnerabilities in every stage of the C CD pipeline to avoid costly fi es at deployment. Security best practices and compliance should also be chec ed by scanners, and it s a best practice to adopt inline scanning to avoid sending images outside of your environment. or more information on the C CD pipeline, ip bac to Chapter .
Take Advantage of Kubernetes Native Controls
revent containers with vulnerabilities and ris y configurations from being deployed into production clusters by using ubernetes admission controllers. ubernetes admission controllers offer
e ible policy setting, and, as a native construct in ubernetes framewor , it offers a powerful mechanism to control what gets deployed in ubernetes clusters.
Secure IaC Templates
ou can shift security further left by implementing nfrastructure as Code aC security. nforce security policies in aC by scanning cloud and ubernetes templates for misconfigurations and violations of security best practices. a e sure you can detect drifts at runtime and automate remediation at the source with a pull re uest . isit Chapter for more information on aC.
ana e C o d Con rations and er issions
nsure you have full visibility into cloud assets, identifying misconfigurations and drift across multi-cloud environments. mplement the least-privilege principle by detecting and removing
40 Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

e cessive permissions on user roles human and non-human . Loo for tools that can not only automatically discover all identity and access management A roles and their permission configurations but also can detect roles with overpermissions and recommend the right permission settings.
Implement Cloud Security Monitoring
eep trac of cloud assets and their configurations. Cloud misconfigurations can easily happen and are a leading cause of security incidents. a e sure that cloud log auditing is enabled for all services and monitored for threat detection. Cloud logs are important forensics records as well. very cloud provider offers activity audit logs that show who did what and when.
Implement Runtime Security
Act fast on early indicators of compromise. untime threats are real and growing in sophistication. Adversaries are launching comple attac s to evade detection while infecting systems for ma imum gain. Don t miss wea signals. et real-time, deep visibility into events to detect suspicious behavior and malicious activity in the cloud, container, and ubernetes. Chec out Chapter for more information on runtime security.
Enforce Zero-Trust Network Segmentation
Adhere to ero- rust principles by applying networ segmentation and allowing only re uired communication between container services. a e sure that all networ communications between pods, services, and applications inside ubernetes follow networ policies. Defining networ segmentation manually is time consuming and error prone. Loo for ways to automate.
CHAPTER 7 Ten Considerations for Securing Cloud and Containers 41
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

Monitor Container and Kubernetes Performance and Availability
onitor resource consumption and application golden signals to stay ahead of performance, availability, and capacity issues in your
ubernetes clusters. Cloud-native environments are comple , so ma e sure that the monitoring is simplified with scoping capabilities to focus on a particular region, deployment, namespace, or wor load. Also, loo for out-of-the-bo dashboards and alerts, as well as easy integration with other data sources.
Have an Incident Response Framework for Containers
mplement incident response and effective forensic investigation processes to understand security breaches, meet compliance re uirements, and recover uic ly in cloud-native environments.
a e sure that a source of truth is available for providing deep visibility into system calls, as well as all activity in the container and orchestration layers. ncidents don t happen in a vacuum granular data must be available to reconstruct the attac before and after the incident.
Use Open-Source Tools to Avoid Vendor Lock-In
mbrace solutions based on open source to avoid vendor loc -in and ta e advantage of ecosystem integrations contributed by the community. roducts based on open-source standards provide transparency and e ibility, so you can understand how detection rules are defined and customi e to meet your needs.
By adhering to standards set by the community, you can protect your investment in technology and more easily find team members with the s ills you need.
lip bac to Chapter for a more in-depth discussion about avoiding vendor loc -in.
Securing Containers & Cloud For Dummies, Sysdig Special Edition
These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

These materials are © 2022 John Wiley & Sons, Inc. Any dissemination, distribution, or unauthorized use is strictly prohibited.

WILEY END USER LICENSE AGREEMENT
Go to www.wiley.com/go/eula to access Wiley's ebook EULA.

