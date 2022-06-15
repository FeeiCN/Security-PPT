The Great SIEM Migration

© 2018 SPLUNK INC.

Nathan Adams | PNC Bank nathan.adams@pnc.com
October 2018 | Version 1.0

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.
The Great SIEM Migration
How to start from nowhere

NATHAN ADAMS
Security Engineer

© 2018 SPLUNK INC.

Ice Breaker
My life in a slide ;)
 PNC Bank in Pittsburgh, PA  Using Splunk for 2+ years  Bicycling  Hiking  Volleyball  Golfing


Penny

© 2018 SPLUNK INC.

The Starting Line
Every team needs to start somewhere

© 2018 SPLUNK INC.

2

10,000+ 60+

90+

4 Billion

SIEMs

Endpoints

Standard Operating Procedures

Security Rules and
Reports

Daily Events

Challenges
What are we trying to solve for?
 Volume of security events  Manual alert processing  Multiple security tools  Hundreds of daily abuse emails  Manual threat intelligence processing  Multiple SIEM applications

© 2018 SPLUNK INC.

Key Objectives
Things to remember

© 2018 SPLUNK INC.

Log Sources

Data Volume

Architecture

Log Sources
What are the crown jewels?

© 2018 SPLUNK INC.

VPN

Network

Endpoint

IDS or IPS

Application Servers

Data Volume
What? How much? Where? How long?
 What are my data sources?  How much data will each source
generate per day?  Where is that data being sent?  How long must the data be stored?

© 2018 SPLUNK INC.

Splunk Storage Sizing Tool
https://splunk-sizing.appspot.com

© 2018 SPLUNK INC.

Storage and Retention
How much does speed matter?

© 2018 SPLUNK INC.

"Splunk will be as slow as it's slowest device."
­ Anonymous Splunk Sales Engineer

 Disk Input/Output (I/O) · 800 I/O Minimum
 Key Points: · More disks. Better index performance · Knowing total throughput is important · Understand network latency · High latency, slower searches

Splunk Architecture

© 2018 SPLUNK INC.

Bare Metal

Dedicated VMs

Shared VMs

Splunk Architecture
What will be the Splunk foundation?

© 2018 SPLUNK INC.

 Bare Metal · Best overall performance · Latency control · Security · Alleviates "noisy neighbor"
problem

 Dedicated Virtual · Splunk best practices · Performance varies with
configuration
· Scalability

 Shared Virtual
· Lowest performance
· Shared resources leading
to "noisy neighbor"

One house. One resident.

A gated community with only one resident

Sharing a gated community

The Finish Line
Progress is progress

© 2018 SPLUNK INC.

1
SIEM

10,000+ 40

20

4 Billion

Endpoints

Standard Operating Procedures

Security Rules and
Reports

Daily Events

Key Takeaways
If you don't remember anything else, remember this.

© 2018 SPLUNK INC.
1. What are the critical log sources? 2. How much data will Splunk
consume per day?
3. What infrastructure is best for
your deployment?

© 2018 SPLUNK INC.
Q&A
Nathan Adams | Presenter

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

