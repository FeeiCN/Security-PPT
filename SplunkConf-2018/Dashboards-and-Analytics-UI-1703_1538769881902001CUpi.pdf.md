© 2018 SPLUNK INC.
Dashboard & Metric Workspace Components
Nachiket Mistry & Thomas Haggie

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.
What is a Splunk Application?

What is a Splunk Application?

© 2018 SPLUNK INC.

Architecture of an Splunk App

© 2018 SPLUNK INC.

In this session

© 2018 SPLUNK INC.

Our Speakers

© 2018 SPLUNK INC.

v

NACHIKET MISTRY
Sr. Manager

THOMAS HAGGIE
Principal Engineer

MODERATED BY NICK FILIPPI

© 2018 SPLUNK INC.
Where we are today?

Search

© 2018 SPLUNK INC.

Reports

© 2018 SPLUNK INC.

Dashboards

© 2018 SPLUNK INC.

Dashboard Extensions

© 2018 SPLUNK INC.

Custom Visualizations

© 2018 SPLUNK INC.

HTML Dashboards

© 2018 SPLUNK INC.

App Runtime

Within Splunk

Outside Splunk

© 2018 SPLUNK INC.

Embedding

© 2018 SPLUNK INC.

SplunkJS SDK

Search

Dashboards

HTML

SplunkJS SDK
Splunkd REST API

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
What was changing?

Custom Monitoring Workflows

© 2018 SPLUNK INC.

Custom Analysis Workflows

© 2018 SPLUNK INC.

Data outside of Splunk

© 2018 SPLUNK INC.

Xfinity Xfi

© 2018 SPLUNK INC.

Salesforce Analytics Cloud

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Enable developers to create and consume Splunk insights relevant to their solution needs.

 Encapsulated  Modular  Composable  Documented  Accessible  Versioned  Modern  Secure

Engineering Principles

© 2018 SPLUNK INC.

Javascript Packages

Metric Workspace

React Viz

Dashboards

React UI

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
React UI

Splunk UI
Reinventing the way we build user interfaces

© 2018 SPLUNK INC.

Accessible

Consistent

Productive

Search Components
Larger composite components for 2 delivering experiences based on Splunk Search

Splunk UI

© 2018 SPLUNK INC.
Your Application
1 A consistent usable experience focused on your business domain.

react-ui & react-icons

3

The themable lego pieces out of which all sorts of user interfaces

can be created .

Splunk UI
react-ui

© 2018 SPLUNK INC.

Splunk UI
react-ui

© 2018 SPLUNK INC.

Splunk UI
react-icons

© 2018 SPLUNK INC.

Splunk UI
Search Components

© 2018 SPLUNK INC.

Splunk UI
Search Components

© 2018 SPLUNK INC.

Splunk UI
Themable

© 2018 SPLUNK INC.

Going deeper
Getting started with Splunk UI
 Read the "React UI" reference documentation.  Read the "React Search" documentation.
npm install "@splunk/react-ui" npm install "@splunk/react-icons" npm install "@splunk/react-search" npm install "@splunk/react-events-viewer"

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Dashboards Component

© 2018 SPLUNK INC.

<DashboardCore width="100%" height={400} preset={DefaultPreset} definition={DashboardDefinition} />

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
" I like that dashboards are JSON - in
Splunk Enterprise it's hard to layer dashboards, but I could see doing that
with this approach."
- Early access developer

© 2018 SPLUNK INC.
Metrics Workspace Component

© 2018 SPLUNK INC.
Metrics Workspace Component
Introduction
 With 7.0 Splunk introduced a new kind of index, a metric index.  Metric indexes are optimized for storing measurements, numerical time series
data categorized by dimensions.
aws.ec2.CPUUtilization=70, region=us-east1, host=i-2fb28737, app=checkout, env=prod
 Metrics are accessed via SPL using mcatalog and mstats commands
| mcatalog values(metric_name) WHERE index="metrics"
| mstats avg(_value) prestats=true WHERE metric_name="aws.ec2.CPUUtilization" AND index="metrics" span=5s
 We wanted people to be able to use metrics without writing their own SPL

Metrics Workspace Component
Discover and Analyze Metrics without SPL

© 2018 SPLUNK INC.

Metrics Workspace Component
Discover and Analyze Metrics without much code
 Follow the "Create an app with authentication" guide.  npm install "@splunk/react-metrics-workspace"

© 2018 SPLUNK INC.

import React from 'react'; import MetricsWorkspace from '@splunk/react-metrics-workspace'; import { servicesClient } from './client'; ...
<MetricsWorkspace servicesClient={servicesClient} modules={['']} /> ...
 Read the "Metrics Workspace Component" reference documentation.

Getting started
npm install @splunk/dashboard-core @splunk/dashboard-presets
import React from 'react'; import DashboardCore from '@splunk/dashboard-core'; import DefaultPreset from '@splunk/dashboard-presets/DefaultPreset'; import DashboardDefinition from `./mydashboard';
<DashboardCore preset={DefaultPreset} definition={DashboardDefinition} />

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Q&A
How do I get access to the libraries? Can I use other visualization library?
What about SimpleXML? How does Splunk UI compare to Material UI?

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

What I can do?
 Power of SimpleXML in your application  Custom visualization  Custom data sources  Complex interactions
· Dynamic panels · Programmatically set token value · Master detail views

© 2018 SPLUNK INC.

Two Column Text Layouts
This is where the subtitle goes

© 2018 SPLUNK INC.

 First level bullets should be sentence case, 24pt · Second level bullets, 20pt · Third level bullets, 20pt
- Fourth level bullets, 16pt
Fifth level tab is for highlighted text, 20pt

 First level bullets should be sentence case, 24pt · Second level bullets, 20pt · Third level bullets, 20pt
- Fourth level bullets, 16pt
Fifth level tab is for highlighted text, 20pt

 Sixth level tab is for highlight content, 28pt, Bold

 Sixth level tab is for highlight content, 28pt, Bold

Two Column Text Layouts
This is where the subtitle goes

© 2018 SPLUNK INC.

 First level bullets should be sentence case, 24pt · Second level bullets, 20pt · Third level bullets, 20pt
- Fourth level bullets, 16pt
Fifth level tab is for highlighted text, 20pt

 First level bullets should be sentence case, 24pt · Second level bullets, 20pt · Third level bullets, 20pt
- Fourth level bullets, 16pt
Fifth level tab is for highlighted text, 20pt

 Sixth level tab is for highlight content, 28pt, Bold

 Sixth level tab is for highlight content, 28pt, Bold

Comparison
This is where the subtitle goes

© 2018 SPLUNK INC.

Title, 24pt, Bold  First level bullets should be
sentence case, 24pt · Second level bullets, 20pt
· Third level bullets, 20pt
- Fourth level bullets, 16pt
Fifth level tab is for highlighted text, 20pt
 Sixth level tab is for highlight content, 28pt, Bold

Title, 24pt, Bold  First level bullets should be
sentence case, 24pt · Second level bullets, 20pt
· Third level bullets, 20pt
- Fourth level bullets, 16pt
Fifth level tab is for highlighted text, 20pt
 Sixth level tab is for highlight content, 28pt, Bold

© 2018 SPLUNK INC.
What is a Splunk Application?

Comparison
This is where the subtitle goes

© 2018 SPLUNK INC.

Title, 24pt, Bold  First level bullets should be
sentence case, 24pt · Second level bullets, 20pt
· Third level bullets, 20pt
- Fourth level bullets, 16pt
Fifth level tab is for highlighted text, 20pt
 Sixth level tab is for highlight content, 28pt, Bold

Title, 24pt, Bold  First level bullets should be
sentence case, 24pt · Second level bullets, 20pt
· Third level bullets, 20pt
- Fourth level bullets, 16pt
Fifth level tab is for highlighted text, 20pt
 Sixth level tab is for highlight content, 28pt, Bold

Three Column Content
This is where the subtitle goes

© 2018 SPLUNK INC.

 First level bullets should be sentence case, 24pt
· Second level bullets, 20pt · Third level bullets, 20pt
- Fourth level bullets, 16pt
Fifth level tab is for highlighted text, 20pt

 First level bullets should be sentence case, 24pt
· Second level bullets, 20pt · Third level bullets, 20pt
- Fourth level bullets, 16pt
Fifth level tab is for highlighted text, 20pt

 First level bullets should be sentence case, 24pt
· Second level bullets, 20pt · Third level bullets, 20pt
- Fourth level bullets, 16pt
Fifth level tab is for highlighted text, 20pt

Three Icons with Supporting Text
This is where the subtitle goes

© 2018 SPLUNK INC.

Search

Reports

Dashboards

Three Column Content
This is where the subtitle goes

© 2018 SPLUNK INC.

 First level bullets should be sentence case, 24pt
· Second level bullets, 20pt · Third level bullets, 20pt
- Fourth level bullets, 16pt
Fifth level tab is for highlighted text, 20pt

 First level bullets should be sentence case, 24pt
· Second level bullets, 20pt · Third level bullets, 20pt
- Fourth level bullets, 16pt
Fifth level tab is for highlighted text, 20pt

 First level bullets should be sentence case, 24pt
· Second level bullets, 20pt · Third level bullets, 20pt
- Fourth level bullets, 16pt
Fifth level tab is for highlighted text, 20pt

Bullets and Content
This is where the subtitle goes
 First level bullets should be sentence case, 24pt · Second level bullets, 20pt · Third level bullets, 20pt
- Fourth level bullets, 16pt
Fifth level tab is for highlighted text, 20pt
 Sixth level tab is for highlight content, 28pt, Bold

© 2018 SPLUNK INC.

Bullets and Content
This is where the subtitle goes
 First level bullets should be sentence case, 24pt · Second level bullets, 20pt · Third level bullets, 20pt
- Fourth level bullets, 16pt
Fifth level tab is for highlighted text, 20pt
 Sixth level tab is for highlight content, 28pt, Bold

© 2018 SPLUNK INC.

Three Column Quotes
This is where the subtitle goes

© 2018 SPLUNK INC.

" First level quote should be sentence case, 24pt."
­ Second level source, 14pt, Bold, Italic

" First level quote should be sentence case, 24pt."
­ Second level source, 14pt, Bold, Italic

" First level quote should be sentence case, 24pt."
­ Second level source, 14pt, Bold, Italic

Three Column Quotes
This is where the subtitle goes

© 2018 SPLUNK INC.

" First level quote should be sentence case, 24pt."
­ Second level source, 14pt, Bold, Italic

" First level quote should be sentence case, 24pt."
­ Second level source, 14pt, Bold, Italic

" First level quote should be sentence case, 24pt."
­ Second level source, 14pt, Bold, Italic

Title and Subtitle Only
This is where the subtitle goes

© 2018 SPLUNK INC.

Title and Subtitle Only
This is where the subtitle goes

© 2018 SPLUNK INC.

Title and Subtitle with No Footer Graphic
This is where the subtitle goes

© 2018 SPLUNK INC.

Title and Subtitle with No Footer Graphic
This is where the subtitle goes

© 2018 SPLUNK INC.

Screenshot and Content
This is where the subtitle goes

© 2018 SPLUNK INC.

 First level bullets should be sentence case, 24pt
· Second level bullets,
20pt
· Third level bullets,
20pt
- Fourth level bullets, 16pt

Screenshot and Content
This is where the subtitle goes

© 2018 SPLUNK INC.

 First level bullets should be sentence case, 24pt
· Second level bullets,
20pt
· Third level bullets,
20pt
- Fourth level bullets, 16pt

Screenshot and Title
This is where the subtitle goes

© 2018 SPLUNK INC.

Screenshot and Title
This is where the subtitle goes

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

Big Stats and Supporting Text
This is where the subtitle goes

© 2018 SPLUNK INC.

#

#

#

#

#

This layout is used for
large statistics

If you have fewer than five stats to
display

Simply click on the extra circles and text boxes

Choose delete

Delete one more time to remove the placeholder
s

Big Stats and Supporting Text
This is where the subtitle goes

© 2018 SPLUNK INC.

#

#

#

This layout is used for
large statistics

If you have fewer than five stats to
display

Simply click on the extra circles and text boxes

#
Choose delete

#
Delete one more time to remove the placeholder
s

Three Icons with Supporting Text
This is where the subtitle goes

© 2018 SPLUNK INC.

Title, 24pt

Title, 24pt

Title, 24pt

Three Icons with Supporting Text
This is where the subtitle goes

© 2018 SPLUNK INC.

Title, 24pt

Title, 24pt

Title, 24pt

Four Icons with Supporting Text
This is where the subtitle goes

© 2018 SPLUNK INC.

Title, 24pt

Title, 24pt

Title, 24pt

Title, 24pt

Four Icons with Supporting Text
This is where the subtitle goes

© 2018 SPLUNK INC.

Title, 24pt

Title, 24pt

Title, 24pt

Title, 24pt

Five Icons with Supporting Text
This is where the subtitle goes

© 2018 SPLUNK INC.

Title, 24pt

Title, 24pt

Title, 24pt

Title, 24pt

Title, 24pt

Five Icons with Supporting Text
This is where the subtitle goes

© 2018 SPLUNK INC.

Title, 24pt

Title, 24pt

Title, 24pt

Title, 24pt

Title, 24pt

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Key Takeaways
This is where the subtitle goes

1. First level bullets should be
sentence case, 28pt
2. First level bullets should be
sentence case, 28pt
3. First level bullets should be
sentence case, 28pt

© 2018 SPLUNK INC.

New to Splunk
IT Ops
Security

© 2018 SPLUNK INC.

Tracks and Sessions

11:15 ­ 12:15 Splunk Overview 1:30 ­ 2:30 Getting Started with Splunk Enterprise (HANDS-ON)

Presenter Name, Senior Sales Engineer, Splunk Presenter Name, Senior Sales Engineer, Splunk
Presenter Name, Senior Sales Engineer, Splunk Presenter Name, Senior Sales Engineer, Splunk

2:45 ­ 3:45 Data Onboarding

Presenter Name, Senior Sales Engineer, Splunk

11:15 ­ 12:15 Happy Apps, Happy Users: Using Splunk APM

Presenter Name, Senior Sales Engineer, Splunk Presenter Name, Senior Sales Engineer, Splunk

1:30 ­ 2:30 Splunk Enterprise for IT Troubleshooting (HANDS-ON)

Presenter Name, Senior Sales Engineer, Splunk

2:45 ­ 3:45 11:15 ­ 12:15
1:30 ­ 2:30 2:45 ­ 3:45

How to Design, Build and Map IT and Business Services in Splunk
Build a Security Portfolio That Strengthens Your Security Posture
Building an Analytics Driven Security Operation Center using Splunk Enterprise Security
An End-To-End Approach: Detect via Behavior and Orchestrate via SIEM

Presenter Name, Senior Sales Engineer, Splunk Presenter Name, Senior Sales Engineer, Splunk
Presenter Name, Senior Sales Engineer, Splunk Presenter Name, Senior Sales Engineer, Splunk
Presenter Name, Senior Sales Engineer, Splunk Presenter Name, Senior Sales Engineer, Splunk
Presenter Name, Senior Sales Engineer, Splunk Presenter Name, Senior Sales Engineer, Splunk

11:15 ­ 12:15 The Power of SPL

Presenter Name, Senior Sales Engineer, Splunk

Advanced

1:30 ­ 2:30 2:45 ­ 3:45

Advanced Analytics and Machine Learning in Splunk
Ransomware Investigation and Prevention Strategies
(HANDS-ON)

Presenter Name, Senior Sales Engineer, Splunk
Presenter Name, Senior Sales Engineer, Splunk Presenter Name, Senior Sales Engineer, Splunk

BUTTERCUP SPLUNKER
Mascot, Internal Mischief

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Splunk Demo
Presented by Buttercup Splunker

© 2018 SPLUNK INC.
BREAK
15 MINUTES

Customer Logo Here
Please use an all-white image on a transparent background, like this Splunk logo:

© 2018 SPLUNK INC.

Join the Pony Poll

© 2018 SPLUNK INC.

ponypoll.com/***

Join us at Splunk .conf18
October 1­4, 2018
Walt Disney World Swan and Dolphin Resort in Orlando 8,750+ Splunk Enthusiasts 300+ Sessions 100+ Customer Speakers
Plus Splunk University: Three Days: September 29-October 1, 2018 Get CPE credits for CISSP, CAP, SSCP
Register now at conf.splunk.com

© 2018 SPLUNK INC.

Splunk Corporate Logo
Copy/paste these graphics to use in your own presentation

© 2018 SPLUNK INC.

Note: The Splunk corporate logo should be used whenever you are referencing Splunk as a company. When you're representing the product, use the product logo (with the green > symbol).

Splunk Corporate Logo
Copy/paste these graphics to use in your own presentation

© 2018 SPLUNK INC.

Note: The Splunk corporate logo should be used whenever you are referencing Splunk as a company. When you're representing the product, use the product logo (with the green > symbol).

Splunk Corporate Logo: One Color
Copy/paste these graphics to use in your own presentation

© 2018 SPLUNK INC.

Note: The Splunk corporate logo should be used whenever you are referencing Splunk as a company. When you're representing the product, use the product logo (with the green > symbol).

Splunk Corporate Logo: One Color
Copy/paste these graphics to use in your own presentation

© 2018 SPLUNK INC.

Note: The Splunk corporate logo should be used whenever you are referencing Splunk as a company. When you're representing the product, use the product logo (with the green > symbol).

Splunk Product Logo: Two Color
Copy/paste these graphics to use in your own presentation

© 2018 SPLUNK INC.

Note: The Splunk product logo should be used whenever you are referencing the product or its capabilities.

Splunk Product Logo: Two Color
Copy/paste these graphics to use in your own presentation

© 2018 SPLUNK INC.

Note: The Splunk product logo should be used whenever you are referencing the product or its capabilities.

Premium Solutions Logos
Copy/paste these graphics to use in your own presentation

© 2018 SPLUNK INC.

Line and Shape Assets
Copy/paste this graphic to use in your own presentations

© 2018 SPLUNK INC.

Black background texture

Splunk Marketing Icons
Copy/paste these graphics to use in your own presentations

© 2018 SPLUNK INC.

Custom

OS

Applications

VM

APP OS

Applications

Energy

Messaging

Databases

GPS

RFID

Meters

Location

Call Detail Records

Web Services/Global

Security/ Lock

Telecoms

Web Clickstreams

Online Services

Desktop

Laptop

Online

Cell Phones

Shopping Cart and Devices

Servers

Networks

Networks Alt

Storage

On-Premise Public Cloud

Private Cloud

Internet of Things

Active Directory

Search

Advanced Search

Analyze

Document

Folder

Log Files

Envelope

Splunk Server Database

Splunk Server

Server

Virtual Server

Splunk Marketing Icons
Copy/paste these graphics to use in your own presentations

© 2018 SPLUNK INC.

Servers

Hadoop Storage

Bar Chart

Pie Chart

Pie Chart Alt

Shipping Container

Enterprise Scale Platform

Gear

Gears / Setting

VoIP

Script

Mobile App

Mobile App Alt

Tag/Ticket

Galaxy Note

iPhone

Datacenter

Datacenters

iPad

Blackberry

Check Mark

Indexer

Forwarder

Search Head

Blank Database

Forwarder Database

Forwarder AIX

Forwarder Free BSD

Forwarder Linux

Forwarder Windows

Forwarder Web

Forwarder OSX

Forwarder Solaris

Splunk Server Splunk Server Splunk Server Splunk Server Splunk Server Splunk Server Splunk Server

AIX

Gearz

Linux

Network

Web

Free BSD

Windows

Splunk Marketing Icons
Copy/paste these graphics to use in your own presentations

© 2018 SPLUNK INC.

Splunk Server Splunk Server Splunk Server Failed Splunk

Solaris

OSX

Search

Server

Failed Server Server License

Tools

Clock

RSS

Send Arrow

Android

Network Switch

Router

Cloud Services Monitoring

Telephone

Facebook Facebook Color

Twitter

Twitter Color

LinkedIn

LinkedIn Color

YouTube

YouTube Color Healthcare

Info

Stop

Calendar

Alert

Hospital

Office Building

Process Analytics

Universal Collection

Wire Data Load Balancing

Cycle

Customer Support

Customer Support Alt

Male

Female

Stacked Document/ Documents

Splunk Marketing Icons
Copy/paste these graphics to use in your own presentations

© 2018 SPLUNK INC.

People

People Alt

Splunk People

Splunk Male

Splunk Female

Meter

Signature Capture

POS Card Reader

EMV Card Reader

Factory

Electric Car

Shield

Footsteps

Malware

Malware

Malware

Security

Security

Virus

Key

Document

Packaged

Server

Badge

Firewall

Botnet

Attacker General

Attacker Insider

Attacker

Nation/State

Real Time Monitoring

Detect Unknown Asset Lifecycle

Threats

Management

Instant Pivot

Data Model

Fraud Detection

Product Analytics/

Custom

Host/

Dashboard Activity/Security

Operational Efficiency

Shield Revised

Waste Reduction

Monitoring

Environmental and Industrial

House

Innovate

Splunk Marketing Icons
Copy/paste these graphics to use in your own presentations

© 2018 SPLUNK INC.

Mission Operations

Facilities and Assets

Warfighter

Vehicle Fleet

Vehicle Fleet

Share with

Collaboration

Cloud

Mission Partners

Data Management

Device Usage DHCP/DNS Analytics

Disaster Relief

Campus Experience

Learning Management
System

Machine learning

Learning Management

Emergency Management

Shared Services

Consolidation

Grades

Admissions

Admissions Consolidation

and Registration

and

Modernization

Consolidation and
Modernization

Situational Awareness

Infrastructure Public Services IT Infrastructure

Campus Housing

Connected Campus + Smart Campus

Control Fraud Waste and Abuse

Dispatch Systems

Subway

Locomotive

Energy

Water

Vulnerability Scans

Transportation

Threat Intelligence

Package

Business Analytics

Splunk Marketing Icons
Copy/paste these graphics to use in your own presentations

© 2018 SPLUNK INC.

Badge/Pass

Tailored

Hourglass

Predictive Analytics

Satellite

Intrusion Prevention

Application Management

DevOps/ Application Deployment

IT Operations

Adaptive Response

Automation or Operational Efficiency

Preventative Maintenance

Splunk Enterprise
License

Aviation

New Developer

Data

Filter Results

Resources Prep & Analysis

Parallel Processing

Scalable

Kiosk

Value Assurance

Trading Systems

Flexible

Platform

Hypervisor

Heart

Patient Generated Data

Healthcare App

CMDB

Service Monitoring

Cost Savings

Education

Threat PDF Stealing

Splunk Marketing Icons
Copy/paste these graphics to use in your own presentations

© 2018 SPLUNK INC.

Custom

OS

Applications

VM

APP OS

Applications

Energy

Messaging

Databases

GPS

RFID

Meters

Location

Call Detail Records

Web Services/Global

Security/ Lock

Telecoms

Web Clickstreams

Online Services

Desktop

Laptop

Online

Cell Phones

Shopping Cart and Devices

Servers

Networks

Networks Alt

Storage

On-Premise Public Cloud

Private Cloud

Internet of Things

Active Directory

Search

Advanced Search

Analyze

Document

Folder

Log Files

Envelope

Splunk Server Database

Splunk Server

Server

Virtual Server

Splunk Marketing Icons
Copy/paste these graphics to use in your own presentations

© 2018 SPLUNK INC.

Servers

Hadoop Storage

Bar Chart

Pie Chart

Pie Chart Alt

Shipping Container

Enterprise Scale Platform

Gear

Gears / Setting

VoIP

Script

Mobile App

Mobile App Alt

Tag/Ticket

Galaxy Note

iPhone

Datacenter

Datacenters

iPad

Blackberry

Check Mark

Indexer

Forwarder

Search Head

Blank Database

Forwarder Database

Forwarder AIX

Forwarder Free BSD

Forwarder Linux

Forwarder Windows

Forwarder Web

Forwarder OSX

Forwarder Solaris

Splunk Server Splunk Server Splunk Server Splunk Server Splunk Server Splunk Server Splunk Server

AIX

Gearz

Linux

Network

Web

Free BSD

Windows

Splunk Marketing Icons
Copy/paste these graphics to use in your own presentations

© 2018 SPLUNK INC.

Splunk Server Splunk Server Splunk Server Failed Splunk

Solaris

OSX

Search

Server

Failed Server Server License

Tools

Clock

RSS

Send Arrow

Android

Network Switch

Router

Cloud Services Monitoring

Telephone

Facebook Facebook Color

Twitter

Twitter Color

LinkedIn

LinkedIn Color

YouTube

YouTube Color Healthcare

Info

Stop

Calendar

Alert

Hospital

Office Building

Process Analytics

Universal Collection

Wire Data Load Balancing

Cycle

Customer Support

Customer Support Alt

Male

Female

Stacked Document/ Documents

Splunk Marketing Icons
Copy/paste these graphics to use in your own presentations

© 2018 SPLUNK INC.

People

People Alt

Splunk People

Splunk Male

Splunk Female

Meter

Signature Capture

POS Card Reader

EMV Card Reader

Factory

Electric Car

Shield

Footsteps

Malware

Malware

Malware

Security

Security

Virus

Key

Document

Packaged

Server

Badge

Firewall

Botnet

Attacker General

Attacker Insider

Attacker

Nation/State

Real Time Monitoring

Detect Unknown Asset Lifecycle

Threats

Management

Instant Pivot

Data Model

Fraud Detection

Product Analytics/

Custom

Host/

Dashboard Activity/Security

Operational Efficiency

Shield Revised

Waste Reduction

Monitoring

Environmental and Industrial

House

Innovate

Splunk Marketing Icons
Copy/paste these graphics to use in your own presentations

© 2018 SPLUNK INC.

Mission Operations

Facilities and Assets

Warfighter

Vehicle Fleet

Vehicle Fleet

Share with

Collaboration

Cloud

Mission Partners

Data Management

Device Usage DHCP/DNS Analytics

Disaster Relief

Campus Experience

Learning Management
System

Machine learning

Learning Management

Emergency Management

Shared Services

Consolidation

Grades

Admissions

Admissions Consolidation

and Registration

and

Modernization

Consolidation and
Modernization

Situational Awareness

Infrastructure Public Services IT Infrastructure

Campus Housing

Connected Campus + Smart Campus

Control Fraud Waste and Abuse

Dispatch Systems

Subway

Locomotive

Energy

Water

Vulnerability Scans

Transportation

Threat Intelligence

Package

Business Analytics

Splunk Marketing Icons
Copy/paste these graphics to use in your own presentations

© 2018 SPLUNK INC.

Badge/Pass

Tailored

Hourglass

Predictive Analytics

Satellite

Intrusion Prevention

Application Management

DevOps/ Application Deployment

IT Operations

Adaptive Response

Automation or Operational Efficiency

Preventative Maintenance

Splunk Enterprise
License

Aviation

New Developer

Data

Filter Results

Resources Prep & Analysis

Parallel Processing

Scalable

Kiosk

Value Assurance

Trading Systems

Flexible

Platform

Hypervisor

Heart

Patient Generated Data

Healthcare App

CMDB

Service Monitoring

Cost Savings

Education

Threat PDF Stealing

