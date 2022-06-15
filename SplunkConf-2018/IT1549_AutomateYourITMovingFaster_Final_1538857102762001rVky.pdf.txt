© 2018 SPLUNK INC.
Automate Your IT! Moving Faster with Puppet and Splunk
Domnick Eger | Global DevOps Practitioner Chris Barker | Partner Engineering
October 2018 | Version 1.0

Today's Precentors

© 2018 SPLUNK INC.

v

DOMNICK EGER
Global DevOps Practitioner from Splunk

CHRIS BARKER
Senior Principal Integration Engineer from Puppet

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.
What is Splunk ?
Quick Intro Into the Machine Data Fabric

© 2018 SPLUNK INC.
Splunk Turns Machine Data Into Answers.
1. Number one 2. Number two 3. Number three

Why Splunk ?
FAST TIME-TO-VALUE ONE PLATFORM, MANY USE CASES VISIBILITY ACROSS STACK--NO SILOS
ASK ANY QUESTION OF DATA ANY DATA, ANY SOURCE

© 2018 SPLUNK INC.

The Dev Lifecycle is Complex

© 2018 SPLUNK INC.

Plan

Code

Escalation/ Collaboration

Build

Test/QA

Stage

Release

SDKs

UI

API

Common Data Fabric

Config

Monitor

Other Tools

Splunk Premium Solutions
1,000+ Apps and Add-Ons

Splunk Solutions

© 2018 SPLUNK INC.

Platform for Operational Intelligence

© 2018 SPLUNK INC.
Baseline Analyze Act
(if you remember only one thing from this talk, this is that thing)

Using Puppet and Splunk independently is good. But using them together like chocolate and peanut butter, and not like nuts and gum is great!

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Splunk + Puppet Complementary Capabilities

Baseline
· System metadata · Deep system inspection · Container contents · Network device interrogation · APIs · Community plugins

Analyze
· Splunk server · Splunk agent · Bundles · Modules · Query language · Alerts · Machine learning · Anomaly detection · ITSI · PuppetDB · PE reporting
Puppet Splunk

Act
· Reconfigure agents · Puppet agent · Puppet code / models · Reconfigure systems · Re-discovery

Connect all your systems, past, present, and future, to Splunk, automatically!

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
But that's just the beginning of a long list of possibilities!

© 2018 SPLUNK INC.
Demo
Integrations and Technology Preview

© 2018 SPLUNK INC.
Splunk App and Add-On for Puppet Enterprise
Overview and Demo

Splunk App for Puppet Enterprise
 Discover and monitor the health of all resources under management
 Ingest all data from Puppet Enterprise and correlate that data across your entire tech stack
 Visualize your Puppet data with out of the box dashboards for easy troubleshooting

© 2018 SPLUNK INC.

Current Discussion and Integration

Simulate

Catalog

© 2018 SPLUNK INC.

Puppet Alignment to
Splunk Ecosystem

Design

Expanding Visibility by Extension of the Puppet API
Enforce

Report

© 2018 SPLUNK INC.
Puppet Tasks for Splunk
Integration Guide

Puppet Task via Bolt: Commands

© 2018 SPLUNK INC.

Basic Use Case: Disk space on Linux server exceeds 90%. Instead of logging into the server to clear disk space, let chain a few commands together to clear the space on a specific servers when Splunk registers 90% utilization.
Splunk Search for Alerts: sourcetype=df | multikv | dedup host,Filesystem | search MountedOn="/mnt/sansmount" | rex field=UsePct "(?<usage>\d+)" | where usage>90 | eval _raw="Filesystem "+Filesystem+" (mount point "+MountedOn+") on host "+host+" is "+UsePct+" full!" | fields - *

Puppet Tasks Command:
Splunk triggers Puppet Bolt through Puppet Tasks for Splunk. Admin sets command, operating system and runtime. Types out nodes and command.
Execution: 'echo '' > /var/log/message && echo `' > /var/log/nginx/access.log

Puppet Task via Bolt: Plans

© 2018 SPLUNK INC.

Basic Use Case: Disk space on Linux server exceeds 90%. Instead of logging into the server to clear disk space, let chain a few commands together to clear the space on a specific servers when Splunk registers 90% utilization.
Splunk Search for Alerts: sourcetype=df | multikv | dedup host,Filesystem | search MountedOn="/mnt/sansmount" | rex field=UsePct "(?<usage>\d+)" | where usage>90 | eval _raw="Filesystem "+Filesystem+" (mount point "+MountedOn+") on host "+host+" is "+UsePct+" full!" | fields - *

Puppet Tasks Command:
Splunk triggers Puppet Bolt through Puppet Tasks for Splunk. Admin sets command, operating system and runtime. Types out nodes and plan name.
Execution: "webserver::cleanupmess"

Puppet Task via Bolt: Tasks

© 2018 SPLUNK INC.

Basic Use Case: Disk space on Linux server exceeds 90%. Instead of logging into the server to clear disk space, let chain a few commands together to clear the space on a specific servers when Splunk registers 90% utilization.
Splunk Search for Alerts: sourcetype=df | multikv | dedup host,Filesystem | search MountedOn="/mnt/sansmount" | rex field=UsePct "(?<usage>\d+)" | where usage>90 | eval _raw="Filesystem "+Filesystem+" (mount point "+MountedOn+") on host "+host+" is "+UsePct+" full!" | fields - *

Puppet Tasks Command:
Splunk triggers Puppet Bolt through Puppet Tasks for Splunk. Admin sets command, operating system and runtime. Types out nodes and plan name.
Execution: webserver::logs::cleanup

© 2018 SPLUNK INC.
Puppet Discovery for Splunk
Technology Preview

Puppet Discovery for Splunk

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Taking you from zero to hero with Baseline, Analyze and Act

© 2018 SPLUNK INC.
"Q&A"

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

