© 2018 SPLUNK INC.
Enterprise Industrial IoT Projects ­ Golden Rules
Do's and Don'ts that every IoT project should be built on
henning.brandt@ese.de
September 2018 | Version 4.2

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Operational Divisions  Rail Operations  Automotive Production  Manufacturing Industry
Range Of Services
 Software-Engineering  Testing & Verification  Assessment-Services  Data Analytics

© 2018 SPLUNK INC.

Hannover Braunschweig
Hildesheim

Berlin

Frankfurt

Erlangen

State of Enterprise Industrial IoT Projects
 60%
· Stalled in Proof of
Concept Stage
 33%
· Completed but failed
 64%
· Useful Lesson Learned
 73%
· Utilize Project Data

 www.ioti.com/strategy/what-s-killing-iot-initiatives

© 2018 SPLUNK INC.

Enterprise Industrial IoT Projects
Phases Of Concern

© 2018 SPLUNK INC.











Proof of Concept

Asset

Data

Analytics & Archive &

Onboarding Correlation Visualization Maintenance

"Despite the challenges, many in our survey are optimistic for the future of IoT­ a trend that, for all its forward momentum, is still in its nascent stages of evolution,"
- Cisco, 2017

Enterprise Industrial IoT Projects
Showcase of ESE reference project

fancycrave© @2018uSnPsLUpNlKaIsNCh.

Company

Machine Park Splunk Use Case

Production Site, Metal Working Ind. (250 employees)
stamping, machine by stock removal, rolling, welding, pressing, assembly

50 production Units
various Manufacturers
service age from recent to 20 years
old

Monitor machine fleet
capture and correlate Sensor
Data
reduce distribution time

Proof of Concept (PoC)
Getting Started

© 2018 SPLUNK INC.
Scenario: Pick devices to be included
Natural First-Time Approach
· Pick a Machine that seems promising · Link Raw Events to Indexer · Create Barebones Dashboard · Present Results to Customer
Issues to be expected
· Ignore production Machines you don`t know · Include only a fraction of available machine types · Don`t set a realistic goal to reach · Assume high data quality for the sake of result

IIoT Project ­ PoC Phase
Setting the PoC scope

Systematic Approach

· Analyze Machine Park · Pick a set of representative Machines · Link Raw Events to Indexer · Implement Information Model · Create Barebones Dashboard · Present Results to Customer

Data Interface

Machines Types

© 2018 SPLUNK INC.
Vendor

Concept Map

Data Fields

Source Types

Data Model

IIoT Project ­ PoC Phase
 Do's · Buy-In and Support from Management · Focus First on the Business Outcome · Follow multiple Approaches
 Don'ts · Underestimate realistic Costs · Stick to Failed Designs · Re-Inventing the Wheel

alice-achterhof@unsplash

Asset Onboarding
Initiate Data Transmission

© 2018 SPLUNK INC.
Scenario: Building The Environment
Natural First-Time Approach
· Identify a management group · Link Raw Events to Indexer · Create corresponding SourceType · Complete Group Onboarding
Issues to be expected
· Redesign of SourceTypes · Unsafe Time-Schedule

IIoT Project ­ Asset Onboarding
Setting Scalable Milestones Systematic Approach
· Set individual Plan for each Machine Group · Set Milestones for completetion
Critical Path

© 2018 SPLUNK INC.

IIoT Project ­ Asset Onboarding
 Do's · Clear Goals for Industrial IoT Data · Systems Integration Plan · Inpect Machine Fleet diversity
 Don'ts · Ignore Challenges of Scale · Underestimate Security Topics

© 2018 SPLUNK INC.
thomas-jensen@unsplash

Data Correlation
Manage Storage & Retrieval

© 2018 SPLUNK INC.
Scenario: Building The Data Backend
Natural First-Time Approach
· SourceTypes are added at will · Aliases / Calculations are duplicated
Issues to be expected
· Different Devices deliver different results in Analysis
· Production suffers from random Errors

IIoT Project ­ Data Correlation
Storage & Retrieval
Scenario: Building Building The Data Backend
Systematic Approach
· Set Up Data Model(s) · Point out fields, that are actually needed
· Check for supply in SourceTypes · Define general rules for Formatting · Exchange Information with testing
Testing Framework

© 2018 SPLUNK INC.

IIoT Project ­ Data Correlation
 Do's · Consider IIoT Platform applicability · Edge versus Core Data Processing · Bulid Information Model
 Don'ts · Make Wrong Data Quality Assumptions · Divide Backend and Frontend

© 2018 SPLUNK INC.
markus-spiske@unsplash

Analytics & Visualization
create Insight & Business Value

© 2018 SPLUNK INC.
Scenario: Building stable Reports
Natural First-Time Approach
· Every Team member develops his/her own · Dashboard · Knowledge Objects
· Every Customization Request is implemented · Testing is done through presentation
Issues to be expected
· Product becomes hard to maintain · Partial results get complex to correlate · Production becomes less stable with
progression · Development speed declines

IIoT Project - Analytics & Visualization
Insight & Business Value
Systematic Approach
· Set Up Development Progression Framework · Scrum · KanBan
· Implement Source Code Management · Git · SVN
· Distribute Virtual copies of Production Deployment · Reference / Link Testing concept at every step
Agile Development Framework

© 2018 SPLUNK INC.

IIoT Project - Analytics & Visualization
 Do's · Stick to Standards · Streamline Iteration Process · IIoT vs. Traditional Software Development
 Don'ts · AI & Machine Learning limitations · Customize every Interface · Miss on Perks already available in Splunk

william-iven© @201u8 SnPsLUpNlKaIsNCh.

Archive & Maintenance
Enforce Operations & Learnings

© 2018 SPLUNK INC.
Scenario: Building Knowledge Base
Natural First-Time Approach
· Changes are done until last Minute · One Deployment is considered ,,Final" · Team is persuing new Projects
Issues to be expected
· Maintenance Developers will have Problems · Productions is at risk

IIoT Project ­ Archive & Maintenance
Enforce Operations & Learning
Systematic Approach
· Maintain Structure within Documentation · Use standardised Archive Structure · Reference / Utilize other Project Artifacts
· Scrum Artifacts · KanBan Board · Project Plan · Review Papers through 3rd Party Memebers
Archive / Colaboration Tooling

© 2018 SPLUNK INC.

IIoT Project ­ Archive & Maintenance
 Do's · Distribute Knowledge evenly · Implement Deployment Shedule · Setup Retention Policy
 Don'ts · Lose experience when Development is done · Lose touch to the Users

© 2018 SPLUNK INC.
samuel-zeller@unsplash

Monitoring Your IIoT Project
Where are we now?!

© 2018 SPLUNK INC.

Progression Model

Team

System Analysis

Tests

Documentation

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

