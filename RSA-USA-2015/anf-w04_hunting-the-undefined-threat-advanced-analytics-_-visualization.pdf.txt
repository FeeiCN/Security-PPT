SESSION ID: ANF-W04
Hunting for the Undefined Threat: Advanced Analytics & Visualization

Joshua Stevens
Enterprise Security Architect Hewlett-Packard
Cyber Security Technology Office

#RSAC

© Copyright 2015 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

#RSAC

#RSAC
Defining the "Hunt Team"

Cyber Defense Evolution

Point
Solutions
Ad-hoc monitoring per device console

SIEM/SOC
Real-time monitoring of known threats

1995

2000

2003

2006

#RSAC
Hunt Teams
Find unknown threats,
understand new adversary TTPs
2013

Log Mgmt
Centralized ad-hoc monitoring
© Copyright 2015 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Threat Intel
Track known adversary IOCs,
TTPs, intent

`Hunt'er Skillsets

Cyber Security
· Intrusion Analysis · Malware Analysis · Threat
Intelligence

Data Science
· Data Management · Data Visualization · Statistics · Programming

Mindset
· Desire to learn · Creative · Analytical · Red team

© Copyright 2015 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

#RSAC Hunter

#RSAC
Hunt Processes

Unstructured Hunt
· Exploratory data analysis
· Pattern discovery

Structured Hunt
· Identify and search for indicators of compromise

Real-time Monitoring
· Create or modify detection methods

© Copyright 2015 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

The Need for "Data" and Security

#RSAC

Analytics

#RSAC
Hiding in Plain Sight

Known Threat

Unknown Threat

 Matches a signature

 New behavior

 Goes to a bad place

 Goes to an approved place

 Works in the clear

 Works encrypted

 Unauthorized use

 Authorized use

 Outside of baseline

 Inside of baseline

 Within monitored infrastructure

 Outside monitored infrastructure

Bad guys know how to stay inside the bell curve!

© Copyright 2015 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

#RSAC
Security Analytics Comes in Different Flavors
© Copyright 2015 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

#RSAC
A 13-billion Event Prototype

Security Analytics Prototype

Anomaly Detection
Distributed R (models)

Cluster Analysis

Security Analytics

Causal Analysis

What-If Analysis

Raw Events

Vertica Data Store Hadoop
Connectors
Normalized events

SIEM Correlation
Prototype Kafka/Storm Ingested
events

SIEM Logging

© Copyright 2015 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

#RSAC

#RSAC
5 Hunt Team Use Cases

Case 1: Cluster Analysis for

#RSAC

Hunt Team Managers

#RSAC
View: Proportional Relationships

© Copyright 2015 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Less VPN traffic and more IPS traffic reveals blind spots

Apply Categorization
SIEM categorization and destination port surfaces hostile events.
© Copyright 2015 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

#RSAC

Case 2: Track Anomalies for

#RSAC

Security Analysts

#RSAC
View: Events by High Severity Rating and Volume
© Copyright 2015 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Change View to Destination Type

#RSAC
Display trend of unique
destinations visited

© Copyright 2015 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Apply Anomaly Chart

#RSAC

Graph filtered from billions of events

© Copyright 2015 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Anomalous Event

Uncover unique event, alerting next level of investigation.

Case 3: Analyze the Haystack

#RSAC

for the Hunt Team

View: IPS Events for 45 days

#RSAC

© Copyright 2015 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Model IPS Events by Technique

#RSAC

© Copyright 2015 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Filter on the Return Traffic

#RSAC
Display IPS evasion, recurring pattern and
gaps in visibility.

© Copyright 2015 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Case 4: Behavioral Analysis

#RSAC

for the Hunt Team

View: Non-Security Events in the Environment #RSAC
© Copyright 2015 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

A Typical View of VPN Logging by Source

#RSAC

© Copyright 2015 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Overlay VPN Source with Recon Events

#RSAC

Correlate two sources of information to identify atypical behavior
© Copyright 2015 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Case 5: Advanced Analysis

#RSAC

for the Hunt Team

#RSAC
Drilldown Reveals Subtle Patterns
Horizontal line denotes large
scale brute force attempts

Source

© Copyright 2015 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

Time

In Closing
 Defining the "Hunt Team"  Leveraging "Data" and Security Analytics  An internal analytics prototype  Use cases for the hunt team
© Copyright 2015 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

#RSAC

Apply What You Have Learned Today

1 Week
Give Analysts 4 hours/week for unstructured hunting

3 Months
Build data science skills into your hunt
team

#RSAC
6 Months
Feedback lessons learned into other operational teams

1 Month
Identify relevant data to begin hunting
© Copyright 2015 Hewlett-Packard Development Company, L.P. The information contained herein is subject to change without notice.

4 Months
Implement a Hunt practice
Incorporate use cases

#RSAC
Questions?

