© 2018 SPLUNK INC.
Monitoring a National Power Grid With Splunk and ITSI
Linus Myrefelt, Statnett Splunk Ninja
October 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.

No Photos

This deck contains proprietary information, no photos or video recording please!

Agenda

© 2018 SPLUNK INC.
1. Introduction 2. Monitoring the National Power Grid
Using Splunk
3. IoT in the OT World 4. The Road to Splunk ITSI 5. Lessons Learned

LINUS MYREFELT
Statnett Splunk Ninja

© 2018 SPLUNK INC.

MY BETTER SELF
My Mini Me

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

What is EMS?

© 2018 SPLUNK INC.

 EMS · Also a term SCADA/EMS is used) supervises, controls, optimizes, and manages generation
and transmission systems
· EMS enables utilities to collect, store, and analyze data from hundreds of thousands of data
points in national or regional power systems, perform system modeling, simulate power operation, pinpoint faults, preempt outages, and participate in energy trading markets

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Input and Data Sources

© 2018 SPLUNK INC.

· Inputs
· System diagram
· Plattform diagram
· Network / service
architeture diagram
· Excel sheet with
important processes / message codes / "metadata»
· Screenshots

Research Phase

© 2018 SPLUNK INC.

 Define what a service is and its various states
 Define requirement for monitoring
· Utilization
· Server Monitoring
· Can we correlate this?
· Other monitoring
tools?

Developing Splunk Apps

© 2018 SPLUNK INC.

 Create mockups before
 We created a handful of "apps" separated by role and function
 We wanted a high level subsystem view and detailed service view

The Results

© 2018 SPLUNK INC.

 This is the start page of each Splunk App
 Contain the most necessary information
 While also enables you to drill down into the details and alerts
 Bridges together the IT/OT environments

The Results

© 2018 SPLUNK INC.

 Contain info and stats around node and site failure with the EMS
 State of system helps to dictate urgency
 Use lots of lookups and KV Collections to monitor the state

The Results

© 2018 SPLUNK INC.

 Subservice dashboard contains description
 Higher level information is a "defined" subsystem

The Results

© 2018 SPLUNK INC.

 Centralized overview of alerts generated from Splunk

© 2018 SPLUNK INC.
Application and Process-Focused Dashboard
 Centralized overview of Processes

Sample Report

© 2018 SPLUNK INC.

 Example of report generated based on collected scada data

IoT in the OT World

© 2018 SPLUNK INC.

 RTU: Remote terminal unit · Collects and transfers data · Responds to and executes
commands and order the EMS
 PMU: Phasor measurement unit · A device which measures the
electrical waves on an electricity grid using a common time source

IoT Dashboard

© 2018 SPLUNK INC.

 Yey, we do IoT stuff

The Road to ITSI Enlightenment

© 2018 SPLUNK INC.

ITSI Mock-ups

© 2018 SPLUNK INC.

Infrastructure Glass Table Examples

© 2018 SPLUNK INC.

Scada Focused Glass Tables

© 2018 SPLUNK INC.

Machine Learning and Lessons Learned

© 2018 SPLUNK INC.

 Playing around with Machine Learning

© 2018 SPLUNK INC.
Lessons Learned

Thank You!
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

