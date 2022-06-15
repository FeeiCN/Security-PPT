© 2018 SPLUNK INC.
Running a Multi-Tenant, AWS Splunk Platform Within Financial Services
Principles and Challenges
Oliver Murphy ­ Head of Monitoring, Analytics and Diagnostics, National Australia Bank Katherine Shaw ­ Senior Technology Architect, Accenture October 2018 | Version 1

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Who are we?

© 2018 SPLUNK INC.

For 160 years, we've been helping our customers with their money. Today, we have more than 30,000 people serving nine million customers at more than 900 locations in Australia, New Zealand and around the world. As Australia's largest business bank, we work with small, medium and large businesses to help them start, run and grow. We fund some of the most important infrastructure in our communities ­ including schools, hospitals and roads. And we do it in a way that's responsible, inclusive and innovative. Visit us at www.nab.com.au.

Accenture is a leading global professional services company, providing a broad range of services and solutions in strategy, consulting, digital, technology and operations. Combining unmatched experience and specialized skills across more than 40 industries and all business functions ­ underpinned by the world's largest delivery network ­ Accenture works at the intersection of business and technology to help clients improve their performance and create sustainable value for their stakeholders. With 449,000 people serving clients in more than 120 countries, Accenture drives innovation to improve the way the world works and lives. Visit us at www.accenture.com.

Enterprise Service
Splunk at NAB in 2018

© 2018 SPLUNK INC.

1600 99.997%

3

3+ TB 25+

Users from 35 teams

Service availability

Production clusters

Data indexed Deployments

per day

per day

* Metrics from internal Accenture / NAB research 2018

Application Management Benefits
Impact from initial deployment

© 2018 SPLUNK INC.

84% 27% 93% 97%

Reduction in incident
investigation time

Reduction in cost per incident

Reduction in time to check
incident impact

Reduction in defect log analysis effort

* All statistics from internal Accenture / NAB research into core banking application support activities (2015)

Our Splunk Journey
Think about the future...

© 2018 SPLUNK INC.

Fundamentals
From Proof of Concept to Enterprise Capability

© 2018 SPLUNK INC.

1) Building a platform ­ engineering principles

2) Running a service 3) Growing a community

© 2018 SPLUNK INC.
Building a Platform
Engineering Principals

Building a Platform
Modern engineering principals

© 2018 SPLUNK INC.

Cloud Infrastructure

Everythingas-code

DevOps and Automation

Patterns and Reuse

Instrument and Monitor

Platform Architecture

© 2018 SPLUNK INC.

Build Automation

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Running a Service
Operating a Multi-Tenant Splunk Service

Service Fundamentals
Understand your customers
 Ensure appropriate access to data  Be easy to deal with  Move fast  Understand and manage costs  Listen to customer requirements  Collect and action feedback

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
" Like creating any great product, creating great platforms
that everyone loves doesn't happen by accident. An internal platform with poor customer focus will likely create tools that
everyone will hate and quickly abandon..."
The DevOps Handbook - Gene Kim, Jez Humble, Patrick Debois and John Willis

Running a Service
Creating a service that continues to deliver
 Monitor and measure ­ Splunk to manage Splunk
· Infrastructure and application
monitoring and automated health checks
· Automated ticket management and
resolution
· DevOps analytics (JIRA, GitHub,
Jenkins, Ansible)
 Control change ­ protect the service
 Enable agility - self service automation to empower users
 Evolve the architecture ­ scaling and hybrid search

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

App Development and Deployment
Supporting rapid change and ensuring platform stability

© 2018 SPLUNK INC.

 Application frameworks and templates (Accenture myWizard) to accelerate development
 Automation to merge local and default changes from UI in development environments and check into source control
 Custom test framework to detect common issues prior to production deployment
 Continuous delivery pipeline using git, Jenkins and Ansible

© 2018 SPLUNK INC.
Growing a Community
Supporting and developing users

Splunk Community
Empower users

© 2018 SPLUNK INC.

Wiki

Training

Drop-ins

Yammer /

Community

Workplace

of Practice

Splunk Welcome App

© 2018 SPLUNK INC.

Where are we now?
Enterprise Monitoring, Analytics and Diagnostics Service

© 2018 SPLUNK INC.

IT Operations

Security

DevOps / Application Development

Business and Process Analytics

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.

Key Takeaways
Building and running a multi-tenant service

1. Platform build - engineering principals 2. Service mindset 3. Community development

© 2018 SPLUNK INC.
Q&A
Oliver Murphy | NAB Katherine Shaw | Accenture

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Accenture, its logo, and High Performance Delivered are trademarks of Accenture. Unless otherwise specified herein, the views and/or findings expressed herein are Accenture's own, and are meant to stimulate thought and discussion. As each business is unique requirements and objectives, these ideas should not be viewed as professional advice with respect to your business. This document makes descriptive reference to trademarks that may be owned by others. The use of such trademarks herein is not an assertion of ownership of such trademarks by Accenture and is not intended to represent or imply the existence of an association between Accenture and the lawful owners of such trademarks." Any and all content and materials originally developed, provided and/or supplied by Accenture or National Australia Bank for the purpose of this presentation belongs exclusively to Accenture or National Australia Bank unless otherwise stated.

