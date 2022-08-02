© 2018 SPLUNK INC.
ITSI and IBM Z at Rabobank
How Rabobank Gains Visibility Into Instant Payments
Daniel Wiegand | Senior Offering Manager IBM Z Operations Analytics at IBM Harry van Irsel | Passionate Mainframe Innovator and Architect Core Banking Transformations at Rabobank October 2018 | Version 1.0

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

The Digital Economy is Forcing Businesses to Transform

© 2018 SPLUNK INC.

Explosion in transaction growth
driven by mobility and the Internet of Things

IT- driven business agility
for delivering service, security, and efficiency

Analytics is moving to real time
to capture new opportunities at the point
of impact
3

The IBM Z Mainframe Has A Vital Role In The Digital Economy

© 2018 SPLUNK INC.

Mainframes process
30 billion business transactions per day
Mainframes enable
$7.7 trillion in card payments annually
Mainframes run
68 Percent of the world's
production workloads

© 2018 SPLUNK INC.
Building Tomorrow's Bank Today
We envision a bank moving from our current model with our own products to an open bank model, offering Rabo and non-Rabo products and services, in increasing partnerships with third parties. Fully organized around our daily customer needs. Driven by digital technology, open banking will further transform to digital platforms where Rabobank and its partners will be connected. This will result in new, exciting cross-industry business models.

© 2018 SPLUNK INC.
The Mainframe Has a Vital Role for Rabobank
The IBM Z platform is strategic for Rabobank
Rabobank is deeply committed to IBM Z
Ambition on IBM Z platform:
 Solid as a Rock  Competitive in terms of costs and short time to market  Transparant and open  Automate everything

© 2018 SPLUNK INC.
Enterprise Vision Monitoring in the Future
Rabobank wants to spot and plug any hole in the plumbing before the damage is done
 Rabobank wants to deliver reliable, transparant and predictable payments processing for their customers.
 It's all about detecting and resolving abnormalities before the customer notices it

© 2018 SPLUNK INC.
Steps Towards the Vision
Growth to maturity level Predictive Analytics ­ From reactive to proactive and predictive
The scope of the enterprise
vision of monitoring in the future is going to level 4
To ensure a 7x24 undisturbed banking for our customers the Rabobank must be able to predict disruptions, identify and fix them before the customer noticing.

Challenges

© 2018 SPLUNK INC.

To achieve this, data from the processes and the environments is needed and the ability to

process this data to information to be able to manage the entire chain of various business

processes

This functionality must be

achieved:

· With NO negative impact on the performance and throughput of the core business systems

· In a non-invasive manner as much as possible, meaning that the need to change or recompile an application must be avoided

· With no or minimal overhead in the overall resource consumption of the system

© 2018 SPLUNK INC.
Think Big, Start Small
Question
How can we improve the robustness and efficiency of the new Payment Factory currently build on IBM Z, by making small steps in deploying monitoring, within the boundaries of the Enterprise vision Monitoring?
Do not lose sight of the other environments during the making of these steps. In the end an end-to-end solution must be realized.

Think Big, Start Small
Architecture System Z ­ From Core to Total

© 2018 SPLUNK INC.

Connecting to current incident/operational management

Further improve infra
monitoring

Further improve application monitoring

Connecting to Operations Analytics Platform

Connecting to business needs & Risk and Compliance

lvl 1

Lvl 2

lvl 3

lvl 4

lvl 5

Prescriptive Analytics What should we do?
Predictive Analytics What could happen?
(Diagnostic) Advanced Data Analytics Why did it happen?
(Descriptive) Data Analytics What has happened?
Structured data
Raw data

Information

Optimazation Maturity level

Think Big, Start Small
High-Level Roadmap Z

© 2018 SPLUNK INC.

Stage 1, focus on: · Operation and production; improve
availability, improve root cause analysis · efficiency of processes; improve
performance · Cost reduction; insight in and improving
resource consumption
Actions: · PoC CDP, PoC APA (continue unless...) · Provide sponsorship for initial projects · Identify quick wins (incl. realization and
implementation, eg. monitoring DataPower) · Identify (business) problems worth solving, prioritize! (first use cases) · Keep a sharp focus on costs versus benefits · Design, build and deploy these first use cases · Start collecting the necessary data
Tooling · Operations Analytics: CDP, Splunk · Application Monitoring: APA · Infra Monitoring: Omegamon, zAware

Stage 2, add focus on: · Risk management · Customer service and experience; integrate
infrastructural, technical application and functional business monitoring · Capacity planning; further improve predictability and availability
Actions: · Primary focus on Risk- en business dashboards · expand first use cases, gradually shift to
generate real business value · Use tooling to make a technical deep dive
drilling down from a business level through the various components · Keep a sharp focus on the problems that are worth solving and that everyone recognizes · Keep a sharp focus on costs versus benefits · Identify and workout new use cases · Expand the collected data
Tooling · Operations Analytics: CDP, Splunk · Application Monitoring: APA · Infra Monitoring: Omegamon, zAware

Stage 3, add focus on: · Strategical/business development
Actions: · Continue to improve the use of analytics to
achieve business goals · Start exploring areas still to be completed,
such as: · End-to-end application monitoring (Dynatrace) · DevOps (ADDI)
· Start first exploration of machine learning platforms (for reaching level 4 - predictive analytics)
· Keep a sharp focus on costs versus benefits
Tooling · Operations Analytics: CDP, Splunk, explore
machine learning platforms (Watson) · Application Monitoring: APA, explore
Dynatrace. connect DevOps tooing ( ADDI) · Infra Monitoring: Omegamon, zAware, explore
other tools and/or explore integration of tools

2017

2018

2019 and further

Timeline

IBM and Splunk Partnership for Z Data

© 2018 SPLUNK INC.

With IBM Common Data Provider for z Systems (CDPz) and Splunk clients can:

 Stream the widest range of SMF records and Z log data in "near real-time"  Gain insight and eliminate blind spots in hybrid IT Operations  Visualize impacts across your infrastructure from continuously delivering
applications and application enhancements  Maximize Splunk Investment with advanced filtering  Save money with the CDPz's fixed pricing model and two vendor solution

© 2018 SPLUNK INC.
Accessing IBM Z Data with IBM Common Data Provider

CDPz Leverages Simple Configuration

© 2018 SPLUNK INC.

CDPz leverages z/OSMF to provide users a simple to use graphical interface to select, filter, and send data to the required target(s)

Just select the IBM Z SMF or Log data you need... Then add your date filters, target(s) and go!

Rabobank Splunk Environment (2017)
Data-driven service monitoring and analytics

© 2018 SPLUNK INC.

Rabo CDP ­ Splunk Setup

© 2018 SPLUNK INC.

z/OS SMF

CDPz-SDE

z/OSMF managed
Config

CDPz Data Streamer

Splunk Search Head
Splunk Forwarder
CDPz DataReceiver

Splunk Indexer

Receiver produced Data Files

Splunk CDPz Ingestion App

Infrastructure View
With CDPz/Splunk we can now visualize our IBM Z infrastructure

© 2018 SPLUNK INC.

Application View
With CDPz/Splunk we can now visualize our IBM Z applications

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Business Function View ­ Instant Payments
How Rabobank Gains Visibility Into Instant Payments

Key Takeaways
Using CDPz to bring Z data to Splunk

© 2018 SPLUNK INC.
1. Prior to bringing Z data to Splunk we were never been able to
get a complete understanding of the end-to-end environment
2. Typically, we then ended up in a situation where everybody
blamed the other one. Or nobody realizes that what seems a small issue disrupts a complete core business process
3. IBM Common Data Provider for z Systems (CDPz) allows us to
stream (in real time) IBM Z data to Splunk
4. By bringing IBM Z data in Splunk along with data from the
distributed environments we now are able to get a complete understanding of the end-to-end environment
5. Through this we are able to immediately act on these analytic
insights, which helps us to be able to guarantee continuity for our customers
6. As next step we want to automate this process more and more
by starting to predict the near future based on historical data/patterns and by using Artificial Intelligence

What's Next

© 2018 SPLUNK INC.

 Extend use of Splunk IT Service Intelligence for end-to-end-monitoring of our core business functions

 Extend the use of CDPz/Splunk (more use cases/more data sources) to: · Further improve availabilty, performance, efficiency · Further reduce costs
 Start improving predictability for a better capacity planning · Machine Learning for reaching level 4 ­ predictive analytics

 Integrate different tracks infrastructural, application and business monitoring

For More Information
IBM Common Data Provider for Z Systems web site http://ibm.biz/CDPzInfo
IBM Common Data Provider 1.1 Knowledge Center https://www.ibm.com/support/knowledgecenter/SSGE3R_1.1.0/com.ibm.cdpz.doc/welcome.html
Contains links to program directories (SMP/E installation) and Users Guide
IBM Common Data Provider on DeveloperWorks http://ibm.biz/CDPzWiki
FAQs, documentations, service information
White Paper on integrating CDPz with Splunk https://www.ibm.com/support/techdocs/atsmastr.nsf/WebIndex/WP102713
CDPz Sample Dashboard for Splunk on SplunkBase http://ibm.biz/CDPzSamples
IBM Z IT Service Management Newsletter www.ibm.biz/zITSMNewsletterSubscribe

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

