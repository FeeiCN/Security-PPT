CAROLINE WONG
The PtaaS Book
The A-Z of Pentest as a Service

The PtaaS Book: The A-Z of Pentest as a Service
Published by AimPoint Group, LLC 388 Gambrills Rd Unit 789 Gambrills, MD 21054 www.aimpointgroup.com
Copyright © 2022 by AimPoint Group, LLC, Gambrills, Maryland
No part of this publication may be reproduced, stored in a retrieval system or transmitted in any form or by any means, electronic, mechanical, photocopying, recording, scanning or otherwise, except as permitted under Sections 107 or 108 of the 1976 United States Copyright Act, without the prior written permission of the Publisher. Requests to the Publisher for permission should be addressed to AimPoint Group, LLC, 388 Gambrills Rd Unit 789, Gambrills, MD 21054, or submitted via email to info@aimpointgroup.com.
Trademarks: The AimPoint Group logo is trademark of AimPoint Group, LLC in the United States and other countries, and may not be used without written permission. All other trademarks are the property of their respective owners. AimPoint Group, LLC, is not associated with any product or vendor mentioned in this book.
LIMIT OF LIABILITY/DISCLAIMER OF WARRANTY: THE PUBLISHER AND THE AUTHOR MAKE NO REPRESENTATIONS OR WARRANTIES WITH RESPECT TO THE ACCURACY OR COMPLETENESS OF THE CONTENTS OF THIS WORK AND SPECIFICALLY DISCLAIM ALL WARRANTIES, INCLUDING WITHOUT LIMITATION WARRANTIES OF FITNESS FOR A PARTICULAR PURPOSE. NO WARRANTY MAY BE CREATED OR EXTENDED BY SALES OR PROMOTIONAL MATERIALS. THE ADVICE AND STRATEGIES CONTAINED HEREIN MAY NOT BE SUITABLE FOR EVERY SITUATION. NEITHER THE PUBLISHER NOR THE AUTHOR SHALL BE LIABLE FOR DAMAGES ARISING HEREFROM. THE FACT THAT AN ORGANIZATION OR WEBSITE IS REFERRED TO IN THIS WORK AS A CITATION AND/OR A POTENTIAL SOURCE OF FURTHER INFORMATION DOES NOT MEAN THAT THE AUTHOR OR THE PUBLISHER ENDORSES THE INFORMATION THE ORGANIZATION OR WEBSITE MAY PROVIDE OR RECOMMENDATIONS IT MAY MAKE. FURTHER, READERS SHOULD BE AWARE THAT INTERNET WEBSITES LISTED IN THIS WORK MAY HAVE CHANGED OR DISAPPEARED BETWEEN WHEN THIS WORK WAS WRITTEN AND WHEN IT IS READ.
ISBN: 978-1-7371618-2-0 (paperback) ISBN: 978-1-7371618-3-7 (eBook)
Manufactured in the United States of America
10 9 8 7 6 5 4 3 2 1
For general information on our other products and services, or how to create a custom book for your business or organization, please contact us at info@aimpointgroup.com.
AimPoint Group thanks the following individuals for their contributions to this work: Copy Editor: Susan Shuttleworth Book Designer: Debbi Stocco Production Coordinator: Valerie Lowery

Table of Contents
Foreword by Dr. Chenxi Wang...................................................... 1
Introduction................................................................................. 3
1. The Rise of Pentest as a Service............................................... 5 Why Are We Talking about Pentesting?...............................................................7 What about the Business Drivers of Pentesting?.............................................8 Pentest as a Service vs. Traditional Pentesting................................................9 The Bottom Line....................................................................................................... 13
2. Automating Pentesting Workflows.......................................... 15 Preparation................................................................................................................ 15 Testing......................................................................................................................... 19 Reporting.................................................................................................................... 21 Remediation and Retesting................................................................................... 23 Information Reuse across Tests.......................................................................... 23
3. Collaboration......................................................................... 25 Traditional Pentesting: Silos and Waterfalls................................................... 26 PtaaS: Collaborative and Agile............................................................................ 27 The PtaaS Features That Improve Collaboration.......................................... 30
4. Integrations and Analytics...................................................... 33 Information to Share............................................................................................... 34 Integrations with Information Sources............................................................. 36 Integrations with Security and Compliance Tools......................................... 36 Integrations with Visualization Tools................................................................. 37 More Pentests = More Powerful Analytics....................................................... 37
5. Agile Pentesting and DevOps.................................................. 39 Shortening the Pentest Cycle.............................................................................. 41 Pentesting Alongside the DevOps Pipeline...................................................... 43
Table of Contents  iii

6. Who Benefits from PtaaS?...................................................... 45 What's in It for the Security Team?.................................................................... 45 What's in It for the Dev Team?............................................................................. 47 What's in It for Program Managers?................................................................. 49
7. Thinking Long-Term............................................................... 51 Maturity Level 1: Ad Hoc........................................................................................ 53 Maturity Level 2: Structured................................................................................ 54 Maturity Level 3: Automated................................................................................ 55 Maturity Level 4: Strategic.................................................................................... 56
Final Thoughts........................................................................... 59
iv  The PtaaS Book

Foreword
By Dr. Chenxi Wang
When my friend and colleague Caroline Wong asked me to write the foreword for her book on PtaaS, I quickly said yes. After all, I have a passion for incubating ideas and fostering technology innovations. On top of that, I have followed Caroline's career path with admiration and interest. She is a force to be reckoned with and I am proud to be affiliated with a fellow strong female leader in cybersecurity.
Now you, as a reader, are probably wondering how that connects to PtaaS. You may not even know what PtaaS is yet! Fortunately, it's not my job to explain that to you -- I'll leave that up to Caroline -- but I will say picking up this book was a good decision if you:
1. Bear any responsibility for application security
2. Work at a company that is looking to expand pentesting frequency and scope
3. Are frustrated by the lack of truly agile testing solutions on the market today
4. Believe there could be closer collaboration between your security and development teams
5. Embody any combination of the above
I have spent decades working with enterprise SaaS and enterprise software providers. These technology practitioners, entrepreneurs, and leaders have shown me the PtaaS model holds great promise for many organizations, regardless of size or maturity.
Efficiency and expediency delivered through SaaS shine in environments where speed of the business is critical.
Pentesting is ripe for disruption (and I don't use that word lightly). Software has become decentralized; developers push enhancements at warp speed. The digital economy is ruthless. In this sink-or-swim, ultra-competitive environment -- where being first often trumps being best -- modern software development is evolving at breakneck pace, leaving organizations struggling to keep up.
Foreword  1

It is indisputably the "Age of Agile." Yet today's pentesting falls far short of what businesses need. PtaaS can change that. So as I said, you've made a good decision by picking up this book. Read on to find out how you can take advantage of the innovation happening in PtaaS, and unlock more value, agility, and insights from your pentests.
Dr. Chenxi Wang is an experienced strategist, speaker, and technologist in the cybersecurity industry. Wang also is a member of the board of directors for MDU Resources (NYSE: MDU), and served as a global board member of the Open Web Application Security Project (OWASP) Foundation. Previously, she was chief strategy officer at Twistlock, vice president of strategy at Intel, and vice president of research at Forrester. Wang was named by Women Tech Founders as the 2019 Women Investor of the year. She received the Women of Influence award by the SC Magazine in 2016. She is a strong advocate for equality and diversity in the high tech field. Wang began her career as a member of the computer engineering faculty at Carnegie Mellon University. She holds a Ph.D. in computer science from the University of Virginia.
2  The PtaaS Book

Introduction
Penetration testing. Pen tests. Pentesting. Pentest as a Service. Aren't these all the same thing? Well, yes and no.
Like so much in life, pentesting has been going through a transformation, a fundamental change in how it gets set up and runs, and the value it brings.
Pundits and influencers have dubbed this evolution the move to Pentest as a Service, where old-school consultancy testing meets SaaS pricing and delivery. The result is more agile, collaborative, and accessible security. Pentesting is a part of nearly every security toolkit -- so how pentesting transforms will also affect the evolution of AppSec, InfoSec, and everything in between. And for that reason, I felt Pentest as a Service deserved its own book.
Plus, who are we kidding: technology people love acronyms. There's a lot of terminology flying around, and it's good to set things straight so we can all agree on the fundamental definition.
So, what's the essence of this book? I set out to define a few things:
· What is Pentest as a Service? (What isn't Pentest as a Service?)
· How does it work? What sets it apart from old-school traditional models?
· What makes it more agile than regular pentesting? How does that agility impact your security posture?
· What does it do for teams outside of security? Why should they care?
· Does it scale sustainably? More importantly, does it help your security program scale sustainably?
Introduction  3

We've got a lot to cover. The truth is, pentesting can turn into a dry subject very quickly, so I've set out to balance its typical very serious business tone with some laughs. Case in point:
Icons
Throughout this book, the following icons are used to call attention to useful information. The Key to Success icon points out practical advice for ensuring a successful outcome, important items you won't want to forget, and pitfalls you should try to avoid. Next-level technical details ­ best suited for practitioner types ­ are highlighted by this icon. Want to find out more about a given sub-topic? Look for this icon to get pointers to additional resources.
4  The PtaaS Book

IN THIS CHAPTER
· Why pentesting is a critical part of cybersecurity programs
· The challenges of traditional pentesting · An overview of how PtaaS aims to solve those
challenges
1
The Rise of Pentest as a Service
Picture this: everything about your company's strategy boils down to agility, speed, innovation. (We can all thank startups and the ever-present "growth mindset" for the ubiquity of these terms in the world of business.) Your developers eat, sleep, and breathe in sprints. Changes to your infrastructure happen constantly, and many of them warrant a pentest to make sure you don't have a security misconfiguration issue somewhere that might give attackers access.
While we're all shifting left with scanners and code reviews, chances are there is still something in your applications that can be exploited, given enough time and resources. After all, there's only so much a security team can do on its own.
Against this backdrop of change, you commission a pentest ... which takes five weeks to start running. Five weeks! During that time your environment could have changed so much that the pentest's initial scope of work no longer applies. A vulnerability could remain open throughout the five weeks, plus the time it takes to execute the test, plus the time it takes to pull together the report. Let alone the time it takes to coordinate the actual fixes. Traditional pentesting is slow and ineffective, and just not good security.
1. The Rise of Pentest as a Service 5



Now, what if those five weeks of waiting got slashed to two days? What if you could receive a message as soon as a pentester finds something important? What if that same tester could send the finding directly to your developers' issue trackers?
That's Pentest as a Service in a nutshell.
It brings together the best parts of traditional pentesting -- tried-and-true methodologies, human ingenuity, and thorough reporting -- and merges them with the best parts of SaaS: faster setup, real-time updates, workflow integrations.
I've got excellent news for you. You don't have to imagine this change. It's already happening.
Several vendors are already making pentesting more modern and agile -- you might have already heard about this from all the marketing emails, trade show messaging, and endless social media chatter. There is a lot of movement happening in the space, and this book aims to walk you through the fundamentals.
If you're well versed in the art of pentesting, you may want to skip ahead to the section, "Pentest as a Service vs. Traditional Pentesting." Otherwise, let's start at square one.
6  The PtaaS Book

Why Are We Talking about Pentesting?
Most cybersecurity professionals agree that pentesting is a key component of their security program. And yes, like any non-fiction writer worth their salt, I happen to have a stat handy: Did you know that 88% of 600 US-based IT professionals surveyed in 2021 said pentesting helps them build better security processes, and believe there should be more budget allocated toward it?1
Still, some might ask: "Do we really need pentesting, given that we already have scanners and other fancy tools that can recognize vulnerabilities, malware signatures, software coding errors, and behavioral patterns associated with known attacks?"
My answer: much of what slips past our automated controls is discoverable only through human ingenuity and creativity. For example:
· Flaws in application business logic, such as those that allow users to bypass anticipated workflows, access unauthorized data, or escalate privileges
· Flaws in user authorization processes · Chained exploits that integrate multiple forms of attack · Attacks that cause events to occur out of the expected
sequence (race conditions)
· Undiscovered defects in new technologies such as mobile devices and apps, APIs and microservices-based applications, and public cloud platforms
Scanners and pentests aren't mutually exclusive -- they complement one another. Automated technology can find defects earlier in your SDLC, while manual pentesting acts as a second layer of defense by validating how well that technology is actually working.
The bottom line is that only human testers can see the most dangerous gaps in our defenses.
Why? Because they work with creativity and context. They understand the business logic of applications and anticipate how to misuse and abuse them. They know the tactics, techniques,
1. Cobalt, "The ROI of Modern Pentesting," https://cobalt.io/blog/roi-of-pentest-as-a-service (2021)
1. The Rise of Pentest as a Service 7



and procedures (TTPs) of cybercriminals, and can bring to light attack vectors we might have never considered while configuring our automated tools. At the end of the day, it's not a string of code that hacks you -- it's the person who wrote it. Sometimes you have to fight fire with fire.
What about the Business Drivers of Pentesting?
Big kudos if you're asking this question, because it means you're thinking about how to best position your security decisions in front of leadership or the board. Here are some points I'd bring up:
· Preventing security breaches. Pentesting enables enterprises to find and remediate vulnerabilities and security flaws before they are exploited by malicious actors.
· Meeting regulatory requirements and compliance. Several important industry standards and government regulations explicitly require pentesting. Examples include the Payment Card Industry Data Security Standard (PCI DSS) and NIST SP 800-53. Many others, including the European Union General Data Protection Regulation (GDPR), highlight pentesting as a best practice that supports certification.
· Building customer trust. Many large enterprises require vendors in their supply chain to perform pentesting on a regular basis.
· Informing M&A activity. Unaddressed vulnerabilities can have a major impact on the security and risk posture of an organization. Pentesting before you finalize a partnership or acquisition can provide you with valuable information so you know what you're getting into.
8  The PtaaS Book

Pentest as a Service vs. Traditional Pentesting
Now that we've addressed the "why" behind pentesting, let's take a look at Figure 1-1 to see how Pentest as a Service (from here on out, PtaaS) differs from every other approach.
Figure 1-1: Characteristics of PtaaS
Now that we've distinguished PtaaS from regular ol' penetration testing, let's examine the different stages involved. There are five core pentesting phases: 1. Preparing and scheduling the tests 2. Performing the tests 3. Reporting findings and documenting recommendations for
remediation 4. Converting findings into tickets and remediating 5. Retesting Here's what each phase looks like at a glance, plus some notes on where you can find more details throughout the book.
1. The Rise of Pentest as a Service 9



Preparation
(More in Chapter 2)
Pentesting starts with security -- and sometimes development -- teams selecting the assets to be tested (web apps, mobile apps, APIs, networks, etc.), describing their objectives, scoping the work, and scheduling the test. The biggest pain point associated with traditional pentesting is long lead times. In a 2021 survey of 601 security professionals in the United States and Europe, 55% of respondents said it takes their organization weeks to get a pentest scheduled, and 22% said it takes months.2 Why the long wait? Traditional vendors, mostly consulting firms, usually have a limited bench of pentesters available. Most of them are working on billable client projects at any given moment and are committed to additional projects weeks in advance. With PtaaS, you still have to go through these steps, but the main difference is how you do it: through a cloud-based platform that manages all pentesting projects and automates several admin tasks.
What's the business impact? Fast scheduling gives you the flexibility to react to change without sacrificing security. On an even more "macro" level, PtaaS enables the next generation of agile teams through its speed and agility.
2. Jay Paz, "The State of Pentesting 2021," https://go.cobalt.io/the-state-ofpentesting-2021/ (2021) 10  The PtaaS Book

Four signs your organization needs on-demand pentesting
Do any of these apply to you?
x We had to delay an audit or large customer deal because we couldn't provide current pentesting results in time.
x For an acquisition or merger, we had a short time to perform due diligence on the other company's IT systems and may have introduced security risks as a result.
x When our development teams launch new software to meet rapidly changing market needs, we can't schedule pentests until the next quarter.
x We worry that the race to deploy new software and infrastructure could lead to serious security flaws, but we cannot sacrifice our competitive edge.
PtaaS is agile enough to prevent these situations.
Testing
(More in Chapter 3)
Traditional pentesting often happens in isolation, affecting both testers and security teams.
Impact on testers: Briefing materials are never 100% complete. Isolated from your team, the pentesters are forced to assume how your applications and infrastructure work in certain scenarios. PtaaS platforms facilitate collaboration between pentesters and your team in real time to share critical details about software workflows, business logic, and inevitable technical issues.
Impact on security teams: Traditional testing gives security teams little to no visibility into pentest progress and findings until a final, static report (usually a PDF document) is released. Most traditional vendors provide only periodic updates, usually via email or conference calls. In contrast, PtaaS platforms send asynchronous alerts as soon as findings are discovered.
1. The Rise of Pentest as a Service 11



What's the business impact? If critical issues come to light, you can address them immediately, without waiting for final project reports. In fact, no matter how critical the issues are, you'll find out about them right away. When the security team is engaged with the pentesters throughout the process, it can make mid-course corrections to respond to problems and opportunities.
Reporting
(More in Chapters 2 and 4)
First of all, you're going to get pentest findings sooner using PtaaS because a pentest can start much more quickly than with a traditional vendor, collapsing time to first finding. When it comes to reporting, the biggest difference between traditional pentest vendors and PtaaS is that the former provide pentest findings in formats that can't be easily shared with developers -- the teams that can actually address the findings.
With PtaaS, test results and recommendations are available as soon as testers submit them to the platform. Integrations with developer tools such as Jira and GitHub allow easy sharing with technology teams. This enables teams to remediate sooner, reducing an attacker's window to exploit existing vulnerabilities. All that being said, reports are often necessary. PtaaS providers offer several different formats intended for different audiences, including security teams, technology teams, management, regulators, and auditors.
An extra note: PtaaS platforms collect asset information and test findings across multiple pentests. Why is this important? First, the platform keeps all your information in one place, so you can more effectively manage your risk profile over time. Second, the platform applies the same formatting across all test data so that your analytics tools can process it easily.
What's the business impact? PtaaS can make security stronger over time. Data and analytics help you identify systemic issues across assets and their root causes, and you can present these insights to developers as quickly as possible.
12  The PtaaS Book

Remediation and retesting
(More in Chapters 2 and 3)
A big drawback of traditional pentesting is that it rarely does much to support remediation after the final report is finished. Unless, of course, you're willing to pay hourly for additional support. This results in a couple of typical scenarios:
1. You have to manually copy-paste information from the final report into developer issue trackers.
2. Remediation teams have no direct access to pentesters and therefore cannot ask follow-up questions, clear up misunderstandings, or ask for validation checks on fixed vulnerability findings.
To deal with the first scenario, PtaaS platforms integrate with issue tracking systems like Jira, automatically creating and filling in tickets with important context such as proofs of concept, screenshots, and recommended fixes. Even better, some PtaaS platforms have an API.
PtaaS platforms also connect with collaboration tools so that security, operations, and development teams can interact with the testers and exchange ideas during remediation. We all know how silos prevent security and development teams from getting along, and these features can help break them down! Taking things one step further, platforms can track retesting in real time to make sure patches are working.
What's the business impact? PtaaS lets you work smarter to remediate issues sooner, faster, and more effectively. Consequently, businesses can maintain agile software development practices without sacrificing security.
The Bottom Line
The impact of PtaaS comes down to making quality pentesting effective and accessible. The combination of on-demand testing, enhanced collaboration, greater efficiency, and faster remediation makes systematic pentesting available to enterprises and small businesses alike. Teams can justify testing critical (and non-critical) assets more frequently and extend pentesting to more applications, networks, and cloud instances.
Excited? Me too. Now let's get into the details.
1. The Rise of Pentest as a Service 13



IN THIS CHAPTER
· What workflow automation in PtaaS looks like · What, exactly, it is about the PtaaS model that
helps things get done faster
2
Automating Pentesting Workflows
The beauty of workflow automation is that it helps security teams to be much more effective, without the need for additional resources. The SaaS element in PtaaS that truly shines here is its cloudbased platform. This platform helps to structure workflows between different teams, keep asset descriptions consistent, maintain documentation and data, and automate repetitive tasks (like setting up a new pentest for an asset that you've tested before). Figure 2-1 provides a visual depiction of these phases.
Figure 2-1: Phases of a typical pentest workflow
Preparation
Getting ready for a pentest involves scoping the project and collecting all the information pentesters will need to carry out the work. Tasks include:
· Defining the timeframe and the objectives for the test · Collecting and presenting information about in-scope assets
2. Automating Pentesting Workflows 15



· Outlining which features and functions to test · Deciding on the number of testers and required qualifica-
tions
· Onboarding testers and providing all needed information
Don't skimp on the preparation phase! Pentest findings will only be as good as the objectives and information you provide to the pentesters.
Enter: The PtaaS platform
I promised examples in Chapter 1, and now it's time to deliver on that promise. How exactly does PtaaS make preparation easier? It starts with the platform's user interface, which guides the security team on what information to submit around their objectives, scope, staff requirements, and desired schedule. Drop-down lists, check boxes, radio buttons, and other selectors help include all critical information, and prompts share formatting examples (Figure 2-2). These features allow teams to provide more than just the basic parameters of the test. They can include descriptions of in-scope assets, testing priorities (Figure 2-3), details of the test environment (Is a target component running on a cloud platform? Does the environment include certain security controls testers should know about?) and information about test policies (e.g., whether the testers will be given user credentials).
16  The PtaaS Book

Figure 2-2: An example of a PtaaS platform's UI and how it prompts teams to share important information
Figure 2-3: You can share technical guidance, including test objectives and priorities, with the pentesters 2. Automating Pentesting Workflows 17



In theory, sure, you can capture all of this in email or a Word/ Google Doc. But you could also send a fax instead of texting someone (assuming you can even find a fax machine!). A well-designed interface reduces mistakes and omissions, and makes the process straightforward.
For most tests, a lead pentester should interview the subject matter experts on your team who understand the computing environment and the business logic of applications. The PtaaS platform can document the interviews and make sure the content is easily available to the other pentesters. Your own team can refer to these materials when reviewing the results. I've seen some security teams record essential information in product walkthrough videos -- this always helps, especially in a remote environment! The videos can brief pentesters who are in different time zones and serve as easy-to-access reference materials throughout the project.
Coverage checklists and documentation
PtaaS platforms streamline preparation with coverage checklists and asset documentation.
Coverage checklists catalog security controls that testers must validate. They don't prescribe exactly how pentests should be performed (that is most often up to the tester and/or the customer), but they do provide guidance to ensure baseline coverage and consistency across all tests for the same type of asset. To provide a real-time view of progress, some PtaaS platforms include checklists and display percentages showing how far testers have advanced in each area.
Coverage checklists can be based on industry standards such as the OWASP Application Security Verification Standard (ASVS), best practices determined by the PtaaS service provider, or methodologies developed by your team.
18  The PtaaS Book

Example of a coverage checklist
A coverage checklist for the communications module of a web-based application would prompt the tester to verify that:
x The latest version of TLS is the preferred cipher suite x Old versions of SSL and TLS have been disabled x The application cannot fall back to insecure or unencrypted protocols The coverage checklists for areas such as authentication, APIs, business logic, file management, network designs, and cloud security can have many more items.
Testing
The testing phase of a project comes with a hefty task list:
· Reviewing objectives, instructions, information, and documentation collected during the planning phase
· Inspecting software and devices for misconfigurations and policy violations
· Running automated test tools against target assets to detect malware, vulnerabilities, and misconfigurations
· Probing networks and applications, attempting to bypass security controls, and trying to locate and extract sensitive data
· Researching uncovered issues by testing and analyzing their potential impact on infrastructure and the business
· Documenting actions and results · Proposing next steps to contain attacks and remediate
issues
Assigning work
There is a saying that "planning is easy, but replanning is hard." This maxim is true in any dynamic environment, including pentesting.
What happens when a task takes much longer than expected, when a tester misses a day, or when a critical issue demands a faster response? How quickly can a team lead consider alternatives and communicate decisions to other members?
2. Automating Pentesting Workflows 19



A PtaaS platform streamlines the process of assigning assets and tests to pentesters. It can also track their progress towards completion. When replanning is required, a team lead can use the platform to see who has available capacity and quickly reassign tasks. Team members can always see what jobs are on their list, which reduces confusion and helps them adjust to changes in work assignments.
Finding information
A PtaaS platform can store a lot of information in one place and make it easy for pentest, security, and other teams to find it on demand. For example:
· Data and materials collected during the planning phase, including documentation of the target assets and the test environment
· Test coverage checklists and test plans · Threat intelligence such as CVSS scores, attacker TTPs, and
information on complex attacks and emerging threats
· Results from previous tests on the same or similar assets (if the current test is part of a series or an ongoing pentesting program)
Easy access to these points can speed up testing, improve analysis, and produce more actionable recommendations for remediation.
Tracking progress
Managers can use a coverage checklist like the one in Figure 2-4 to track the test's overall progress. Tracking helps to keep upper management informed and address potential problem areas.
20  The PtaaS Book

Figure 2-4: An example coverage checklist
Reporting
PtaaS can significantly reduce the time and effort that goes into preparing different reports. Teams have more options for presenting findings to different audiences, making sure the content is easy for each group to understand and use.
For thorough reporting, PtaaS platforms collect and format the following points:
· The scope and objectives of the test, the assets tested, and context about their use and risks
· Records of participating pentesters and supporting experts · The tests performed and their parameters · An analysis of the discovered issues and risks · Recommendations for containment, remediation, and
improvement
· Information on which issues you have remediated, which you haven't, and why
Templates
PtaaS platforms can come with report generators. On the back end, templates guide pentesters with prompts, drop-down lists, check boxes, and other features to make sure they include all critical information.
2. Automating Pentesting Workflows 21



As for reports created by the security team, it's fair to say that reporting is an area where one size definitely does not fit all. You'll need different formats for different audiences. For example:
· Developers often want as much detail as possible to support remediation efforts and tracking.
· Management might only want an executive summary. "Did we pass? How many high criticality findings were there?" Board members and C-suite execs, for example, are primarily concerned with avoiding front-page news coverage for getting hacked.
· Regulators and customers assessing your security posture will ask for attestation letters with very specific details about the tests and findings. A PtaaS platform can automate report creation for each of these groups, pulling in the same information and changing the layout to suit your intended audience -- so you don't have to do the customization manually for each stakeholder. With some platforms you can add, remove, or move around sections and additional comments (Figure 2-5).
Figure 2-5: A report generator can produce standard and custom reports with information tailored to different audiences
22  The PtaaS Book

Remediation and Retesting
Here's something I've never enjoyed doing: getting the pentest results and having to manually copy-paste information from the report to Jira or GitHub. Not only is this a waste of time, it's very easy to make a mistake.
PtaaS platforms integrate with these issue trackers. With the click of a button, you can share pentesters' comments and attachments with your developers.
There's also the capability to set up alerts whenever there's a comment or change in status from your development team. Once their work is done, pentesters can see that issues have been resolved and are ready for a retest.
Track how long it takes to remediate vulnerabilities. Some vendors will dub this "time to fix" or "time to remediate" in their platforms. These numbers can illustrate the time attackers had to exploit vulnerabilities. Shorten it and you'll demonstrate measurable risk reduction as well as the broader value of your pentesting program.
Information Reuse across Tests
Throughout this chapter I've described several use cases demonstrating how PtaaS makes it easier to set up and execute a single pentest. Now imagine if you applied that to all the pentests you have to manage. Sweet, right?
You might already be in an enviable position where your organization is a proponent of frequent security testing. Or you might not be pentesting as often as you want, held back by the inefficiencies described in this chapter. In either case, adopting a PtaaS approach can enable you to do more with less time.
The best part: when you set up your next pentest, you'll be able to easily find information like asset descriptions and previous results. No more digging around trying to find PDF reports and email threads.
2. Automating Pentesting Workflows 23



IN THIS CHAPTER
· The problems with silos in pentesting · What better collaboration looks like · Features in PtaaS platforms that improve
collaboration
3
Collaboration
I strongly believe that the hardest security problems to solve are not technical. The longer I work in this industry, the more I realize the most powerful solutions won't come from technology; they'll come from people and process innovation.
I started my career in security back in 2005. By then, OWASP had released two versions of its Top 10 list of web application vulnerabilities. We saw a new version come out in late 2021, and here's what stands out to me: despite the list going through multiple iterations over the past 18 years, the types of issues OWASP found in web applications have stayed more or less the same.
It is the same stuff that the best and the brightest in our industry have been talking about for 18 years.
Why haven't these problems been permanently resolved? We know how to find them, how to fix them, and how to prevent them. We have better tools, more advanced technology ... but we struggle with the same fundamental things. While we fear sophisticated attacks on zero-day exploits, big breaches happen because someone didn't deploy a patch.
Technical solutions abound. What's lacking are people and process innovation. Finding better ways to work together is where we need to focus.
This is a critical pillar that PtaaS has focused on. Let's take a then/now approach in this chapter by reviewing what collaboration looks like in traditional pentesting, and then comparing it with PtaaS and how it changes things.
3. Collaboration 25



Traditional Pentesting: Silos and Waterfalls
Who are the people who would be collaborating during pentests? Here's my view, as shown in Figure 3-1:
Figure 3-1: Traditional pentesting workflows assume limited collaboration between teams once you're done with "Preparation"
There's the "Pentest team" delivering the service. You also have "Other teams," who are mostly comprised of the security and development professionals in your organization. And then you have the five pentest phases we've been working with throughout the book.
In a traditional pentest workflow, collaboration between teams is limited to the "Preparation" phase. A security manager and a lead pentester work together to scope the test and gather information. After that, pentesters work in isolation, go off to write a report of their findings, email the report to the teams responsible for remediation, and go home. Everyone under the "Other teams" bucket often struggles to move things forward from there.
But wait, there's more. Once you've addressed your vulnerabilities, you may call the pentesters back to do a retest and verify your fixes. You can treat this as a mini rinse and repeat of the previous steps until you decide you're done.
This approach creates three challenges:
1. During testing, pentesters with questions about target assets, application logic, infrastructure, testing priorities, and other issues must assume and guess based on what's available to them. Of course, you can thoroughly document the above items, but this is an inevitable issue -- you can't anticipate every question, and you just don't have time to go through everything in advance.
26  The PtaaS Book

2. Once you get the pentest report, your security and development teams have to interpret its findings with limited or no access to the pentesters for questions. This can cause plenty of head scratches and may even lead to ineffective patches.
3. Everything follows a waterfall pattern: no phase can begin until the previous one is done. As a result, even when vulnerabilities and issues are discovered early, remediation begins only after testing and reporting are completed, leaving your organization vulnerable in the meantime.
PtaaS: Collaborative and Agile
Now let's consider how this could change. Figure 3-2 illustrates where PtaaS adds collaborative touch points throughout the process.
Figure 3-2: A PtaaS platform supports real-time collaboration across the full pentest cycle, making all teams more effective
Collaboration during testing
Pentesters often spend valuable time uncovering answers to questions that an application developer or a system administrator could have answered in seconds. Giving people direct access to each other ensures time is spent in the right places. This is also why I rarely encourage teams to give pentesters zero information: you're paying for their time, so you want them to focus on the right things. Collaboration during testing also benefits your security team. When they have a direct channel to pentesters, they can observe the testing process, learn how threat actors operate, and see not only where their defenses fail, but also where they succeed. That kind of validation is priceless.
3. Collaboration 27



A front-row seat
"[The] use of Slack as a real-time communication medium gave us a frontrow seat to the penetration test as it was conducted in our environment. We were able to interact with the testers directly during the test, addressing any roadblocks (whether intended or not) ... With our front-row seat into the penetration test, we were able to observe the approach that the testers took to break into our environment. Were they successful in every attempt? Certainly not. But as defenders, we were able to glean the thought process behind a particular hypothesis and identify its successes and failures. Our team was able to gain immediate knowledge of what works and what does not, and that truly shaped our thinking on security better than any final report could."
- SANS Institute Reading Room report3
Collaboration during remediation and retesting
Collaboration is also very important during the remediation phase.
Activities during the remediation phase can include patching software, changing configurations and parameters, shutting down ports, changing credentials and permissions, adding security features to applications, altering policies, expanding security controls, and many other actions.
Although test reports typically include guidance on how to fix discovered vulnerabilities, the people responsible for performing the fixes may not understand all the details. We don't all speak the same way, and jargon adds even more complexity. Discussions with the testers who discovered and analyzed the issues alleviate these communication challenges. You can simply say "Hey, when you say X, am I right in thinking ______?" Again, it's a matter of investing time in the right places. A simple "yes" or "no" can save your team from going down an unnecessary rabbit hole.
Communication helps with retesting too. When retests signal your patches aren't working, pentesters can quickly jump in to help you understand why.
3. Matt Bromiley, "Pentest as a Service with Cobalt," https://resource.cobalt.io/sansanalyst-report-2021 (2021)
28  The PtaaS Book

To make collaboration work, be sure to avoid the blame game. If security and development teams believe the goal of pentesting is to highlight their mistakes, they are less likely to come to the table with an open mind intent on productive engagement. Make sure testing and communication are carried out in the spirit of empowering all team members to learn and improve.
Ditch the waterfall
One of the key objectives of any pentesting program is to fix vulnerabilities and weaknesses as soon as possible. The longer the wait, the wider the exploit window. Collaboration and automation features in a PtaaS platform can help you break out of the siloed waterfall pattern. Figure 3-3 shows how phases can overlap. While testing, pentesters share updates on what they find and keep looking. Meanwhile, remediation teams jump on critical problems. Rinse and repeat, and you might end up fixing the important stuff before you even get your final report. If you want to see me nerd out hard about this, jump over to Chapter 5.
Figure 3-3: Collaboration and automation allow phases of the pentest workflow to run in parallel, so remediation can start (and finish) sooner
3. Collaboration 29



A direct channel to communicate
"The [PtaaS] platform provided a direct channel we could use to communicate and collaborate with our pentesters. We received automatic updates and asked questions throughout the testing. This was a vast improvement over previous pentesting service providers."
- Aaron Gibson, VP of Technology at GoReact, an education video assessment software provider4
The PtaaS Features That Improve Collaboration
Tools connect people
PtaaS platforms either include team collaboration features or tightly integrate with instant messaging tools like Slack or Microsoft Teams. Collaboration technology encourages the pentesters to operate as if they're a part of your team. All stakeholders -- testers, security teams, application developers, managers, whoever else you include -- are able to give updates, ask questions, share ideas and advice, suggest hypotheses, or point to external resources.
4. Aaron Gibson, "GoReact increases pentesting speed, collaboration, and integration with Cobalt," https://cobalt.io/customers/goreact (2021) 30  The PtaaS Book

I've seen pentesters in different time zones record videos to demo a fix to the security team. There's a lot of room to be both creative and flexible. And here's a bonus: it's a lot easier to store and find information. Messages and chat threads are searchable, so people can find comments, ideas, and decisions from every phase in the testing workflow.
Platform provides visibility
With traditional pentesting workflows, most testing happens in isolation until it's done and an official report comes out. In contrast, a PtaaS approach allows pentesters to work through their coverage checklists and record results, context, and recommendations. You can track these details to know whether your test is moving along and respond to early findings.
Dashboards summarize test results
Most PtaaS platforms include dashboards with charts and tables that track the progress of testing and summarize findings (Figure 3-4). These dashboards transform raw data into a more consumable format for stakeholders who might otherwise not have followed the test(s) in detail. Your team can geek out about the data as much as I do, and find some interesting, maybe even unexpected, patterns in your security program. More on that in Chapter 4.
Figure 3-4: Dashboard graphs can aid communication and collaboration between groups with different backgrounds
3. Collaboration 31



Integration with issue tracking and workflow systems
I touched on this in Chapter 2, but it's worth a mention here, too: PtaaS platforms can integrate with issue tracking and developer workflow software such as Jira, ServiceNow, and GitHub. It comes down to sharing information where your colleagues work. I've never met a developer who appreciates having a PDF thrown at them, so if DevSecOps is on your agenda, PtaaS can help you get there.
32  The PtaaS Book

IN THIS CHAPTER
· Data points tracked by PtaaS platforms · Insights you can pull from default analytics
dashboards
· Integrations that send pentest data to the rest of your tech stack
4
Integrations and Analytics
This one is for the data lovers! Now that we've covered some of the basics around running your pentests, I want to talk about what comes next: learning and improving.
There is so much data that you can pull from pentesting to help multiple teams from across the business. For example, does a certain type of vulnerability -- say, Broken Access Control -- come up frequently in your different assets? It might be time to look at how your developers handle reviews around authorization and authentication by digging into application design to check if there's a root cause you can address now that will prevent multiple vulnerabilities later.
Do you know how long it takes your team to remediate vulnerabilities? Are they slower with some, faster with others? Are critical issues fixed quickly enough? How long do low-risk findings stay in your backlog? Can you quantify the risk that comes with that delay?
PtaaS platforms can help you answer these questions. Even better, they not only collect the data, but also send it to the rest of your tech stack with a few nifty integrations. Let's dive into what this means.
4. Integrations and Analytics 33



Information to Share
Here are the main data points a PtaaS platform will collect while pentests are running:
· Asset types and vulnerability types · Number of findings per individual test, and across all tests · Breakdown of criticality across findings, ranging from
Informational to Low/Medium/High and Critical
· Finding status -- Open, Closed, Risk Accepted, Pending Retest
· Time it takes to fix findings, broken down by filters like Asset Type or Criticality This list is not exhaustive. You might find vendors that share other information, such as the number of testers you've worked with, total number of pentests, average number of findings per test, and much more. That's the beauty of a cloud-based platform -- it tracks and stores information so you can review, learn, and improve. Looking for an example? Here's one in Figure 4-1:
Figure 4-1: Comparisons across asset categories and business units
34  The PtaaS Book

Here's what I can pull from this graph:
· Top problem areas: Testers have found the most issues in web applications -- do these need more attention, more security resources, additional training, or more management attention?
· Comparisons between assets: PCI web applications have done relatively well -- are there lessons we can learn from them that would help with other assets?
· Systemic weaknesses: Server security misconfigurations are present in nine out of the 11 asset categories -- could better server configuration tools or training improve my security posture across the board? Another area of analytics I find valuable is the option to compare against a benchmark. A PtaaS platform can use different data points to calculate your risk score and track how it changes over time. Take the example in Figure 4-2, where a chart tracks how different assets' risk level changes over time. It also benchmarks it against an external average (the triangle), which is the overall risk score of the vendor's entire customer base.
Figure 4-2: Test data can be compared over time to track progress and demonstrate improvement to auditors and managers
These visuals can help chart how you're performing over time. Better yet, you can show management how you're doing over time, illustrating and quantifying how your investments in security are paying off.
4. Integrations and Analytics 35



Bird's eye view
"[A PtaaS platform's] dashboard is great because we get a whole scope of the pentest that we ordered. It gives us a bird's eye view of where we stand, which we can actually present to top management."
- Kunal Bhattacharya, Former Head of Application Security, Credit Karma, a financial technology company5
Integrations with Information Sources
PtaaS platforms can leverage relevant information from external sources. Say you're using an asset management tool -- an integration with the PtaaS platform could pull the relevant descriptions, graphs, and diagrams to set up the pentest.
Pentesters also refer to information about vulnerabilities, security issues, and attacker TTPs. This information can come into the platform through integrations with vulnerability management systems and threat data feeds.
Integrations with Security and Compliance Tools
Many teams pentest because of compliance obligations. When an audit happens, the last thing you want is to be digging through email threads and paperwork. There are multiple platforms out there that automate parts of the audit process, and a PtaaS platform can link up with them, supplying reports on discovered vulnerabilities, methodologies, and remediation actions taken.
The same logic applies with governance, risk, and compliance (GRC) tools to help teams in highly regulated industries quickly demonstrate that they've pentested key applications and networks.
5. Kunal Bhattacharya, "Explore How Credit Karma Leverages Pentest as a Service," https://cobalt.io/customers/credit-karma (2020)
36  The PtaaS Book

Integrations with Visualization Tools
While most PtaaS platforms come with their own analytics dashboards, these are rarely visible to all the relevant people in your organization. Say you want to present data to your development team or integrate findings into a tool like Google Data Studio or Tableau. PtaaS platforms can securely send them data with the help of APIs. The dashboard in Figure 4-3 is an example of what the end result can look like in Tableau.
Figure 4-3: Analytics and visualization tools help teams generate insights and draw conclusions from complex data
More Pentests = More Powerful Analytics
There are many reasons to move closer to frequent and systematic pentesting, but my favorite is strengthening your analytics. As the PtaaS platform accumulates data from multiple pentests over a longer period and across more parts of the organization, you can find more patterns and insights on how to remove -- or better yet, prevent -- vulnerabilities. Here's something you can bring to your next management meeting: with the analytics and integration options PtaaS brings, scaling up a pentesting program can lead to stronger security and higher ROI.
4. Integrations and Analytics 37



IN THIS CHAPTER
· Why traditional pentesting and agile feel like polar opposites
· The PtaaS features that click together to make pentests more flexible
· How your teams can learn and continuously improve
5
Agile Pentesting and DevOps
Agile, lean, fast: these are all words swirling around in the technology space, and security needs to keep up with them. Between shortened development cycles, increasing customer requests, and automation evolving at warp speed, there's a lot happening quickly in the world of tech. Traditional pentesting models haven't been able to match that need for speed. Let's look into why.
Inconsistent cycle times
The first issue is cycle time. For example, suppose an organization is using Scrum techniques with two-week sprints (that is, they plan and code a working release every two weeks). If a pentest on Sprint 1 takes 10 weeks from scheduling to final report, its findings won't be available until the start of Sprint 7 (Figure 5-1). This disconnect is even bigger for teams following continuous integration and continuous delivery (CI/CD) methodology.
Figure 5-1: Traditional pentesting projects don't fit well with agile practices 5. Agile Pentesting and DevOps 39



The gatekeeper mindset
A second issue is the traditional mindset of security as a gatekeeper, or the "house of no." In the old (pre-agile) days of infrequent releases and waterfall development, developers would hand over finished code to the quality assurance (QA) group, which would take several weeks to test the release. The developers would then have to fix any problems until QA was satisfied and agreed the release could go into production. This approach led to even longer release cycles, stifled innovation, and caused enterprises to sacrifice market share to their nimbler competitors. A core principle of DevSecOps is that developers test their code for quality and security. Rather than being gatekeepers, QA and security teams play a consultative role, helping developers understand how to detect and fix issues as early as possible in the development cycle, when the cost of repairing bugs is lowest. Traditional pentesting timelines, where pentesters work in a silo for weeks and email a report, do not fit with an agile or DevSecOps mindset. That's not to say pentesting is dead to the agile team. It can bring tremendous value, if you:
· Make pentesting faster and more flexible. · Demonstrate how it enables developers to continuously
improve the quality of their code.
· Tie it all back to how your combined work creates value for the organization.
40  The PtaaS Book

Shortening the Pentest Cycle
PtaaS can dramatically shorten the cycle time of pentests, making them faster and more flexible. In earlier chapters I described the features that make it happen, such as:
· Automated workflows for scheduling, scoping, and preparing pentests (Chapter 2)
· Continuous collaboration between pentesters and security and DevOps teams (Chapter 3)
· Real-time findings and context, instead of waiting for a final report a week or more after testing is done (Chapter 3)
· Automatic ticket generation, rather than a manual process (Chapter 2)
· Faster remediation, clearer tracking, and more robust retesting (Chapter 2)
These points lead to major changes in how pentesting and sprints function in parallel, which I've pulled together in Figure 5-2.
5. Agile Pentesting and DevOps 41



Figure 5-2: With PtaaS, pentesting becomes fast and agile enough to add value to more sprints
Using the example in Figure 5-1, suppose that you schedule a pentest and receive its final report within three weeks, instead of 10. Even better, suppose pentesters share findings with you as soon as they come up, which happens as early as two to three days from the end of Sprint 1.
These findings can help guide developers during Sprints 2 and 3. Your first pentest is over, but you schedule another one to check a critical release from Sprint 3. Its findings start appearing within days, helping your developers avoid the same mistakes during Sprints 4 and 5, and so on. Not every team will pentest as often as this at all times, but the point stays the same: if you need to, the opportunity is there.
Let's pause for a moment here. PtaaS alone won't make pentesting agile. You'll also need to adjust your planning and work toward breaking large projects into smaller, faster, more frequent pentests. This is similar to the agile practice of dividing large software releases into bite-size "stories" that can be implemented in a short time. You'll also want to have each testing cycle focus on changes from the most recent code releases, since new code is most likely to introduce vulnerabilities. To keep track, you'll need to monitor what developers are working on. How about attending some of those standup meetings or sprint planning sessions?
42  The PtaaS Book

Pentesting Alongside the DevOps Pipeline
Can you insert pentests into the DevOps pipeline? Even with PtaaS, I don't think so. Even with faster setup and earlier updates, the full process still takes two to three weeks, and that's too long to ask developers to wait before each code commit.
But pentesting can definitely work as a control that runs alongside software releases, like in Figure 5-3.
Figure 5-3: Pentests can run alongside software releases, giving developers the feedback they need to continuously improve
In this scenario, pentest results are still used to fix security issues in the code base. But equally important, development teams use the findings to determine the root causes of those issues and make larger improvements to prevent them in the future. In fact, you can achieve part of this either with or without PtaaS by changing how you position your findings.
Instead of saying "Here's a list of defects from release XX.X.X -- go fix them," try this wording: "Here are security issues that found their way into our code -- let's talk about how we can keep that from happening in later releases."
This approach does two things: it prevents shifting of responsibility, and it changes the focus from making hot fixes to supporting developers in writing better code. In fact, the more the security team, development team, and pentesters collaborate, the more value you derive from each pentest. For example:
· Pentesters are more efficient because they can ask developers about application use cases and other technical details.
· Developers learn directly from pentesters about security issues and how to fix them.
· Pentesters help security teams and developers analyze root causes and determine what changes to training, tools, and processes will prevent them.
5. Agile Pentesting and DevOps 43



This is where the real-time collaboration features of PtaaS (check out Chapter 3 for more) can really make a difference. To learn more about using PtaaS in agile and DevOps environments, read these blog posts: Pentesting and DevOps: An Engineer's Perspective (https://cobalt.io/blog/pentesting-and-devops-an-engineers-perspective) and Pentesting & DevOps: From Gatekeeper to Enabler (https://cobalt.io/blog/ pentesting-and-devops-from-gatekeeper-to-enabler).
44  The PtaaS Book

IN THIS CHAPTER
· How PtaaS helps developers detect and fix security defects sooner
· How security teams can test more assets and manage risk more effectively
· How managers use PtaaS to track progress and resolve recurring issues
6
Who Benefits from PtaaS?
While going over the A-Z of PtaaS, we've looked at features, workflows, and collaboration. There have been graphs, screenshots, and the occasional comic strip. (Not going to lie, those are my favorite parts of the book.) It's a lot to take in, and while reading, you might be wondering, "Okay, this is cool and all, but what's the end benefit for me?" I want to use this chapter to organize everything around that question: What's in it for the security team? For the developers? For managers, even leadership?
What's in It for the Security Team?
In my mind, the value that security teams get out of PtaaS has two layers: the getting-stuff-done-faster layer, and the improving-our-whole-program layer.
The first one is pretty straightforward: PtaaS slashes setup and scheduling time from weeks to days, provides real-time vulnerability updates, and helps remediation teams fix and prevent flaws more effectively. (If you skipped the parts that explain how, check out Chapters 2, 3, and 5.)
The second layer needs more explaining, so here we go.
You can test critical assets more frequently
PtaaS lets teams capture and reuse data from each pentest, including information about assets and the environment, test plans, and findings from previous tests. The platform makes it
6. Who Benefits from PtaaS? 45



easy to fetch and reuse this information for later tests, reducing admin time and even costs. As a result, security teams can test critical assets more frequently. Because critical assets are, well, critical, and because businesses tend to update them often, testing them twice a year or quarterly instead of annually has a big impact on overall risk. Chapter 4 is where to go for more info.
You can expand test coverage
PtaaS companies typically offer pentests at lower price points than traditional vendors,6 and reduce the amount of admin time around setup and remediation. As a result, you get back budget and bandwidth, which you can reinvest into tests for more of your assets. This is important because vulnerabilities in non-critical assets can give attackers a foothold big enough to lead to the "crown jewels." In fact, two-thirds of the participants in the State of Pentesting 2021 survey said that "lack of urgent response to medium and low vulnerabilities creates big risk for our business."7 Check out Chapter 2 for more on this.
You can make remediation more effective
The traditional model often yields complaints about pentesting teams not sharing enough context and actionable
6. Cobalt, "The ROI of Modern Pentesting," https://cobalt.io/blog/roi-of-pentest-as-a-service (2021) 7. Jay Paz, "The State of Pentesting 2021," https://go.cobalt.io/the-state-ofpentesting-2021/ (2021) 46  The PtaaS Book

recommendations around their findings. Security and development teams in general can learn a lot from interacting directly with pentesters, such as getting insights into attacker TTPs, chained exploits, and the emerging threats that will keep them up at night.
PtaaS gives pentesters the space and structure to enrich their findings with information. The end result isn't just faster fixes, but also learning and development for internal teams. Jump back to Chapter 3 for more on this.
You can retest more consistently
All too often, teams rely on spreadsheets or other manual methods to track if anyone has been assigned to validating patches.
PtaaS platforms can do that for you, and inform stakeholders on:
· Completed remediation tickets · Retest status · Results and recommended next steps in case of a failed
retest
Without this type of follow-up, issues can stay unresolved. Chapter 2 is your friend on this one!
What's in It for the Dev Team?
You can catch and fix problems earlier
The cost of fixing a bug rises exponentially as an application moves from scoping to coding, to integration and component testing, to system testing, and finally into production. That's why agile and DevOps practices include frequent code reviews and regular use of static code testing tools.
Pentesting and PtaaS play a role in early detection. Pentesting brings fresh sets of eyes to security testing in the coding and integration stages. PtaaS makes results available as early as two to three days after the test's start because it shortens pentesting cycles and highlights findings immediately, rather than delaying them until the full report. Check out Chapter 5 to find out how.
6. Who Benefits from PtaaS? 47



You can learn more about security
While developers should take ownership of the quality and security of their own code, they still have to focus on their core KPIs and can't be expected to have in-depth knowledge of the latest cyberthreats.
PtaaS gives developers direct access to pentesters via integrations with Slack, Microsoft Teams, Jira, GitHub, and more (there's a new integration coming out every time I check). Those collaborative platforms provide places where people can discuss discovered issues, work together to understand and remediate them, and learn how to prevent them in new sprints. In the process, developers learn more about threats and cybersecurity trends. They gain a practical understanding of how attackers might exploit vulnerabilities and security flaws, what the business impact might be, and how they can improve their work. I talked more about this in Chapter 3.
Data will highlight your strengths and weaknesses
PtaaS platforms feature pentest data and analytics tools that can teach teams a lot about their gaps in security. For example, six out of 10 participants in the State of Pentesting 2021 survey said they had fixed vulnerabilities during the year, only to see the same issues re-emerge later.8 Data from pentests can alert teams when issues start to reappear in time to take action and head off widespread incidents.
That information also provides insights into questions like:
· How quickly or slowly are issues being fixed? · What threats are slipping past existing defenses? · We have a lot of vulnerabilities from one wider category.
Could this be because of an application design problem?
Data enthusiasts should jump to Chapter 4.
8. Jay Paz, "The State of Pentesting 2021," https://go.cobalt.io/the-state-ofpentesting-2021/ (2021)
48  The PtaaS Book

What's in It for Program Managers?
You can react to change quickly
With most traditional pentest providers, scheduling pentests is a long and tedious process that takes weeks, sometimes months. Major changes to test plans, say adding new assets to the original scope, can cause even more delays.
PtaaS lets managers schedule and start pentests in days. PtaaS workflows make it possible to scope tests and set up coverage checklists quickly, especially if information from previous pentests is available on the platform. It's also easier to match qualified pentesters with projects.
These changes not only save managers time, they enable them to respond more quickly to new demands. For example, within 48 hours they can arrange pentesting for:
· New features and new releases of critical applications · Significant changes to networks and platforms · Changes to APIs and integrations · Evidence of secure and compliant IT systems to meet
customer requests
Check out Chapter 2 to see how.
You can track progress and results
When pentest findings are isolated in reports, it's difficult to compare results over time and see trends. PtaaS makes this much easier by enforcing consistency in setup and reporting. Findings from multiple pentests can be stored in one platform, giving teams a wider view of their entire pentesting program versus a one-off test. They can start exploring questions like:
· Do our findings concentrate around one vulnerability type? We might need to do more developer training on that.
· Do vulnerabilities patched six months ago show up again in new tests? What can we do to stop that?
· Is our risk level going up or down? What does that mean for our wider program?
6. Who Benefits from PtaaS? 49



If these questions are on your mind, Chapter 4 is your friend. The best way to promote consistency and encourage continuous improvement is with a structured pentest program. It sets the stage for continual testing of critical and frequently updated assets. For an overview of the topic, see the white paper, A Comprehensive Guide to Building a Pentest Program (https:// resource.cobalt.io/a-comprehensive-guide-to-building-apentest-program).
You can be agile without sacrificing security
Managers are constantly faced with tradeoffs between speed and security. Going faster often means meeting delivery goals but increasing risk. Thorough testing, when done the traditional way, reduces the odds of a nightmare breach but puts a brake on frequent releases and new features. PtaaS is one way to improve security and agility at the same time. That's because:
· The organization benefits from the experience and creativity of vetted security experts.
· The pentesting process is fast and flexible enough to support agile and DevOps practices.
· The team gathers data and generates insights that help to continuously improve the way developers write code. Don't believe me? Check out Chapter 5.
50  The PtaaS Book

IN THIS CHAPTER
· My proposed pentest maturity model -- four distinct levels
· What each level looks like, and how to level up · How PtaaS can give you the boost you're looking
for
7
Thinking Long-Term
Thinking long-term in security can be a tricky thing -- we make plans for the next two or three years, while knowing that everything can completely change overnight (and frequently does, given the lightning-fast pace of technology change). It's one of the many fun parts of working in our industry! That's why I've always appreciated having a documented roadmap to keep me grounded while I navigate constant change and disruption. So I made one for you.
Based on my 16 years of experience in security, I've pulled together a model (Figure 7-1) of what pentesting can look like for teams at different stages of their journey. Some might just be starting out with a pentest once a year and aren't sure why or how to scale. Others might be pentesting critical assets more often, but are looking for more structure and consistency. And then there's the powerhouse teams we aspire to be with flawless documentation, strong connections with DevOps, and the budget to pentest all their assets.
Pentest programs usually start as ad hoc tests with minimal structure (Level 1). Over time, teams put in place the tools and processes that add consistency and direction (Level 2), then automate to boost efficiency (Level 3). The end goal is to align pentesting with other departments' priorities and make an impact across the whole organization (Level 4).
You might notice several themes running across these levels:
· Standardizing and automating planning and workflows · Increasing collaboration
7. Thinking Long-Term 51



· Automating and accelerating information collection and distribution
· Improving alignment with corporate goals
In this chapter I describe each level and point out areas where PtaaS helps teams level up.
Figure 7-1: My suggested pentest maturity model 52  The PtaaS Book

Maturity Level 1: Ad Hoc
Pentest programs often start out as a reactive and unstructured security control. They fulfill basic compliance obligations, but inefficiencies limit their wider impact on security.
Planning and workflows
At Level 1, there is no pentesting calendar or regular testing cadence. Instead, teams schedule pentests based on ad hoc demands, or to check the box for compliance audits or customer requests. Priorities are often based around the requirements of whoever speaks the loudest, rather than around an analysis of what tests would have the greatest impact. There are frequent delays and last-minute scrambling to meet unexpected requests. Different methodologies and tools are used inconsistently.
Collaboration and alignment
Collaboration between pentesting, security, development, and other teams is haphazard. There are no established protocols for when and what to communicate, and often no agreement on who will own remediation and retesting. Communication is scattershot: often a mix of email, phone calls, instant messaging, issue trackers, and in-person meetings. Pentesting teams may send findings to developers for remediation, but this information may not be received well if the pentesters don't provide enough context or a channel for recipients to request more information.
Information flows
Collecting information about assets and test findings is a manual task, scattering details across emails and messaging apps. Teams generate reports and attestations manually (or pay hourly fees for consultants to do this). The reports have different components and levels of detail for each stakeholder group, such as security and DevOps teams, executives, and auditors. Distribution of real-time data is rare, so some stakeholders end up working with outdated information.
Don't be discouraged if your program has many Level 1 traits. Every organization that has achieved a higher level of maturity once started here. Document your early successes where pentests uncovered critical vulnerabilities that might have otherwise led to data breaches or other costly outcomes. These
7. Thinking Long-Term 53



wins will help you justify an investment to move your program to Level 2 and beyond.
Maturity Level 2: Structured
To reach Level 2, teams must add structure and consistency to their pentesting programs. PtaaS platforms provide frameworks on how to plan and schedule pentests. They enforce consistency across test methodologies, and supply collaboration tools for everyone involved. There's also more structure to tracking and reporting of test progress and results.
Planning and workflows
When teams move their pentesting program toward Level 2, they typically categorize assets based on their business and compliance impact, then schedule regular pentests for the "Critical" category. There is more consistency around testing methodologies. Teams define and schedule tests at the beginning of each quarter, but still have limited flexibility to respond to roadmap changes. There are remediation policies, but they focus mostly on critical assets. Teams consider low-priority items only if they have a critical vulnerability.
Collaboration and alignment
Teams begin to break down silos with shared understanding of when and what to communicate, and who will own triaging, remediation, and retesting. Groups decide on one or a few communication channels, typically tools such as Slack or Microsoft Teams, but old habits come through and people sometimes forget to stick to them. There may be some alignment on who will fix each type of vulnerability and issue, but deciding on the right person still takes a lot of time.
Information flows
Information collection and tracking are more structured and consistent. However, teams still have to share findings manually via issue tracking systems. Data is available for security teams to produce trend reports and comparisons between tests, but it's still a largely manual exercise.
54  The PtaaS Book

Maturity Level 3: Automated
To reach Level 3, teams look to automation to improve efficiency and collaboration. PtaaS platforms help with APIs and integrations, real-time notifications when a pentester discovers and describes a vulnerability, and dashboards that automatically format data into different views. With a couple of clicks, teams can copy over asset descriptions and objectives from previous tests. Reporting also becomes easier, with platforms formatting information into documents for auditors, leadership, or customers.
Planning and workflows
To move to Level 3, organizations automate processes such as:
· Selecting assets, creating test plans and coverage checklists, and scheduling tests
· Managing and presenting findings and recommendations · Tracking what assets have been tested, remediated, and
retested
Typically, automation improves efficiency so much, teams find they can test critical assets more frequently and add medium- and low-priority assets that never made the cut before. Automated planning and scheduling also make it much easier to respond quickly to sudden requests for testing new releases.
Collaboration and alignment
In Level 3, the roles and responsibilities of all stakeholders are crystal clear. Working together turns into a structured and consistent exercise in one collaboration tool. Teams have a shared framework on what is a critical, medium- or low-priority bug, and how to prioritize vulnerabilities and their fixes. It's clear and easy to track deadlines and responsibilities.
Information flows
There's no more manual work around sharing findings and other information. Instead, there's a workflow to automatically send findings into issue trackers, and integrations show ticket status across different tools. Changes in status then trigger new actions, such as a retest or a review. There is one standard
7. Thinking Long-Term 55



process on how to share updates with security staff, developers, executives, and external stakeholders. Analytics are stored in one place, with dashboards tailored to different objectives and key results (OKRs) so teams can track performance, spot problems, and highlight wins.
Maturity Level 4: Strategic
To reach Level 4, teams align the pentest program with roadmaps from other departments and concentrate on improving ROI. PtaaS plays a major role by keeping workflows structured and repeatable. Teams can schedule pentests on demand, and there are channels that fully support teamwork and joint problem solving across security, DevOps, and other groups. Integrations send data where people need it, either for wider visibility or custom reports.
Planning and workflows
Level 4 programs feature highly automated, structured workflows that take efficiency to the next level and make it very simple to repeat pentests. Tests can start on demand, staffed in 48 hours or less.
Collaboration and alignment
In Level 4, security and DevOps teams create and follow a common, proactive approach to pentesting. The DevOps group feels a sense of ownership over managing fixes. Everyone involved in requesting, planning, and performing pentests and remediation uses the same team collaboration tools to communicate and problem solve.
Information flows
Test findings consistently guide security, DevOps, vulnerability management, and GRC decisions. Pentesting systems integrate with third-party reporting and analytics tools like Tableau or PowerBI so test findings can be analyzed and applied to a wide range of security and risk management activities.
56  The PtaaS Book

Strategic impact
Organizations with mature pentesting programs are able to align tests with wider business goals. They can:
· Leverage analytics to find and fix systemic security issues and guide secure development
· Respond quickly to business needs like performing due diligence on the applications of strategic suppliers or acquisition targets
· Plan smaller and more frequent pentests to align pentesting with DevOps and shortened release cycles
Level 4 pentesting programs also set the stage for data-driven continuous improvement. Teams at this level continually look for new opportunities to standardize, automate, and generally kick butt. And let's not forget about leadership. Good pentesting can make executives more aware of the high ROI of pentests. This recognition can lead to greater executive support and larger budgets for the rest of your security program. Getting to Level 4 takes a lot of time, determination, and resources. I've seen businesses achieve this nirvana state, but it can take months, or even years. There will be moments when teamwork breaks down, unexplainable errors make you miss a deadline, or your data makes your head spin. And that's okay. It is in these frustrating moments when you learn how to better connect as a team, what configuration pitfalls to avoid, and how to keep it together when others look up to you. Aside from strengthening your organization's security, you'll be strengthening yourself -- as both an individual and a professional.
7. Thinking Long-Term 57



Final Thoughts
Well, dear reader, we have arrived at the end of the book. You now know that the acronym PtaaS is not just Pentest as a Service, but so much more.
PtaaS is ...
· ... human ingenuity and creativity. · ... working smarter in the cloud, connecting with remote
teams for the best possible results.
· ... the efficiency hidden behind every manual task that you thought couldn't be automated.
· ... technology that brings teams together, not just once at the start of a project, but at every stage where people can help each other.
· ... reassurance that you can do your best work because stellar professionals have your back.
· ... being flexible and transforming security from "the house of no" into "the house of let's-make-it-happen."
· ... learning from your mistakes by focusing on how they can help you and your team grow.
It's just better security.
From all of the text, screenshots, graphs, and comics, I hope you've pulled ideas and inspiration that you can apply in your own work. I'll know I've done a good job if you walk away from this book feeling reinvigorated, full of ideas, and excited to make some changes.
For me, what's most exciting is that this is just the beginning for PtaaS. Similar to the way crypto changed banking, Airbnb transformed hospitality, and Uber turned the taxi industry on its head, I know PtaaS has the potential to change how we manage our security programs. What's more, I believe it has the potential to change how we think about security.
Final Thoughts  59

With its focus on improved collaboration, smarter workflows, and better analytics, I believe PtaaS brings our perspective back to this fundamental idea: Security has always been the result of decisions and actions (movements) made by many different people. It's actually the outcome of an ever-changing dance between many people. If you know how to salsa or Lindy Hop, you can extend a hand, invite a partner, and step onto the dance floor. But security is not always invited to the party. Too often, development, security, and operations dance alone. PtaaS is inventing the dance style to sync our movements and create a beautiful partnership. To put it simply: PtaaS lets security dance. So picture me, extending my hand to you. Join me and step out onto the dance floor.
Please send me your likes, dislikes, random musings, big ideas, and all other valid reactions at ThePtaaSBook@cobalt.io
60  The PtaaS Book

