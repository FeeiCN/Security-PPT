[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution.
Analyzing 24 Years of CVD
Allen Householder adh@cert.org
Software Engineering Institute Carnegie Mellon University Pittsburgh, PA 15213

Copyright © 2018 Carnegie Mellon University. All Rights Reserved.
This material is based upon work funded and supported by the Department of Defense under Contract No. FA8702-15-D0002 with Carnegie Mellon University for the operation of the Software Engineering Institute, a federally funded research and development center.
The view, opinions, and/or findings contained in this material are those of the author(s) and should not be construed as an official Government position, policy, or decision, unless designated by other documentation.
NO WARRANTY. THIS CARNEGIE MELLON UNIVERSITY AND SOFTWARE ENGINEERING INSTITUTE MATERIAL IS FURNISHED ON AN "AS-IS" BASIS. CARNEGIE MELLON UNIVERSITY MAKES NO WARRANTIES OF ANY KIND, EITHER EXPRESSED OR IMPLIED, AS TO ANY MATTER INCLUDING, BUT NOT LIMITED TO, WARRANTY OF FITNESS FOR PURPOSE OR MERCHANTABILITY, EXCLUSIVITY, OR RESULTS OBTAINED FROM USE OF THE MATERIAL. CARNEGIE MELLON UNIVERSITY DOES NOT MAKE ANY WARRANTY OF ANY KIND WITH RESPECT TO FREEDOM FROM PATENT, TRADEMARK, OR COPYRIGHT INFRINGEMENT.
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.
This material may be reproduced in its entirety, without modification, and freely distributed in written or electronic form without requesting formal permission. Permission is required for any other use. Requests for permission should be directed to the Software Engineering Institute at permission@sei.cmu.edu.
CERT® and CERT Coordination Center® are registered in the U.S. Patent and Trademark Office by Carnegie Mellon University.
DM18-0268

Analyzing 24 Years of CVD
© 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] This material has been approved for

public release and unlimited distribution. Please see Copyright

2

notice for non-US Government use and distribution

Agenda

Process & data overview

Cases & messages over time

Case duration distribution

Case size distribution

When does the work happen?

Observations on Case Complexity

Analyzing 24 Years of CVD
© 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] This material has been approved for

public release and unlimited distribution. Please see Copyright

3

notice for non-US Government use and distribution

The CVD Process

Finder
shares vul info with
Reporter
often same individual / organization

reports vul to

Vendor

provides vul info and/or patch to

Deployer

reports vul to

Coordinator

provides vul info to

provides vul info to
Analyzing 24 Years of CVD
© 2018 Carnegie Mellon University

Role
relationship

optional relationship

Legend

https://resources.sei.cmu.edu/asset_files/SpecialReport/2017_003_001_503340.pdf

[DISTRIBUTION STATEMENT A] This material has been approved for

public release and unlimited distribution. Please see Copyright

4

notice for non-US Government use and distribution

The Data

This is work in progress, all results are preliminary.

CERT/CC has been coordinating vulnerability disclosures since 1988. · Email-centered process, "hub and spoke" communication pattern · Messages sent/received as proxy measure of coordination effort

Database log of email sent/received by cert@cert.org about VU#nnnn and VR-nnn cases

· Spans 1993-2017 (24 years)

· 350k+ CVD-related email messages observed

· 46k+ CVD cases observed · 2,300+ years of CVD embargo*

*sum across all domain-level participants

Analyzing 24 Years of CVD
© 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] This material has been approved for

public release and unlimited distribution. Please see Copyright

5

notice for non-US Government use and distribution

Cases, Messages per Quarter 1994-2017

Analyzing 24 Years of CVD
© 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] This material has been approved for

public release and unlimited distribution. Please see Copyright

6

notice for non-US Government use and distribution

Cases, Messages per Month 2009-2017

Analyzing 24 Years of CVD
© 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] This material has been approved for

public release and unlimited distribution. Please see Copyright

7

notice for non-US Government use and distribution

Cases, Messages per Month 2009-2017
(Same chart, but remove VU#582497)

Analyzing 24 Years of CVD
© 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] This material has been approved for

public release and unlimited distribution. Please see Copyright

8

notice for non-US Government use and distribution

How long do cases last?

Most cases are 95% done around 50 days from start
75% of cases are halfway done around
30 days from start

half of all messages occur within 1 month of the case start

80% of all messages occur within 100 days of the case start

Analyzing 24 Years of CVD
© 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] This material has been approved for

public release and unlimited distribution. Please see Copyright

9

notice for non-US Government use and distribution

Case Sizes
Case Counts by Class (log count)

N_msg
1024+ 256-1023
64-255 16-63 4-15
0-3

Message Counts by Class

"Case class" = log4(n_messages)

Analyzing 24 Years of CVD
© 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] This material has been approved for

public release and unlimited distribution. Please see Copyright

10

notice for non-US Government use and distribution

Workload Distribution By Case Size
½ of messages are in cases with >64 msgs

N_msg 0-3

>70% of messages are in cases with >3 msgs
4-15 16-63 64-255 256-1023 1024+

Analyzing 24 Years of CVD
© 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] This material has been approved for

public release and unlimited distribution. Please see Copyright

11

notice for non-US Government use and distribution

Case Size-Frequency

46k total cases observed
11k with >3 messages (top quartile)

Case size limited by timespan?
Human capacity?
Larger cases possible when tech assisted
disclosures

Analyzing 24 Years of CVD
© 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] This material has been approved for

public release and unlimited distribution. Please see Copyright

12

notice for non-US Government use and distribution

Case Start Relative to Date Public
Relative date of first message observed
9,600 cases with >3 messages and public base date

Public Base Date (PBD)= min(date_public, date_first_published)

1,400 cases with 1 msg
before public base date
Analyzing 24 Years of CVD
© 2018 Carnegie Mellon University

8,200 cases with 100% of msgs after base date

[DISTRIBUTION STATEMENT A] This material has been approved for

public release and unlimited distribution. Please see Copyright

13

notice for non-US Government use and distribution

Case Midpoint Relative to Date Public
Relative date on which cases reached 50% of their total messages
8,200 cases with 100% of msgs after base date 1,000 cases with
+  1 msg pre-PBD and >50% of msgs post-PBD

Public Base Date (PBD)= min(date_public, date_first_published)

400 cases with 50% of msgs before public base date
Analyzing 24 Years of CVD
© 2018 Carnegie Mellon University

9,200 cases with >50% of msgs after base date

[DISTRIBUTION STATEMENT A] This material has been approved for

public release and unlimited distribution. Please see Copyright

14

notice for non-US Government use and distribution

Case End (Effective) Relative to Date Public
Relative date on which cases reached 95% of their total messages
Coordination does not end with disclosure!

Public Base Date (PBD)= min(date_public, date_first_published)

Analyzing 24 Years of CVD
© 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] This material has been approved for

public release and unlimited distribution. Please see Copyright

15

notice for non-US Government use and distribution

Case End (Effective) Relative to Date Public
Relative date on which cases reached 95% of their total messages
Coordination does not end with disclosure!

Public Base Date (PBD)= min(date_public, date_first_published)

A few cases are just wrapping up at >3 Years post-disclosure

Analyzing 24 Years of CVD
© 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] This material has been approved for

public release and unlimited distribution. Please see Copyright

16

notice for non-US Government use and distribution

Case Breakdown

Mostly Pre-Disclosure Coordination (>50% msgs) 400

Pre-Disclosure Coordination (>= 1 msg)

1400

Cases >3 msg w/PBD

9600

Most of the coordination doesn't even happen pre-
disclosure

Cases >3 msg

11000

Total Cases 0

46000

5000

10000 15000

Analyzing 24 Years of CVD
© 2018 Carnegie Mellon University

20000 25000 30000
Number of cases

35000

40000

45000

[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution

50000
17

Underlying Mechanism for Case Size: Multiparty
Most cases involve 1 or a few parties. Large multiparty are where all the complexity happens.

For each of the largest cases, the daily traffic spikes have a characteristic size, appears to correlate to the # of parties involved
Analyzing 24 Years of CVD
© 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] This material has been approved for

public release and unlimited distribution. Please see Copyright

18

notice for non-US Government use and distribution

Limiting Factors for Case Size

Factor Timespan
Identifying affected vendors
Number of vendors involved

Potential causes of limit
· Vendor responsiveness to creating patches (This is a good thing!) · Attention span of orgs before other work takes precedent · Reporters sometimes under inflexible timelines
· What products contains libfoo? · What vendors are affected by a vul in libfoo? · What vendors implemented this protocol?
· Contact management (acquisition & maintenance) · Communication channel efficiency (hub & spoke, tools) · How many people can keep a secret for how long?

These are all about efficiency and efficacy of vulnerability response processes, driven by information availability and utility.

Analyzing 24 Years of CVD
© 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] This material has been approved for

public release and unlimited distribution. Please see Copyright

19

notice for non-US Government use and distribution

Parting Thoughts

CVD doesn't end with public disclosure.
- Most of the coordination work actually happens after public disclosure
"Average case" is not a useful concept for capacity planning
- Large cases are rare, but dominate the day-to-day work
Case complexity is driven by the number of participants involved
Case sizes appear to be limited by organizational factors
- There might be an upper limit to how big a coordination can be before it's better to just go public
Analyzing 24 Years of CVD
© 2018 Carnegie Mellon University

Got Data?
· This is ongoing research work at CERT
· We are looking for CVD metadata from other orgs
· Minimum required: (Case ID, Message Timestamp)
· Contact us if you have data you can share.

[DISTRIBUTION STATEMENT A] This material has been approved for

public release and unlimited distribution. Please see Copyright

20

notice for non-US Government use and distribution

Contact Info
Allen Householder
Team Lead, Threat Ecosystem Analysis CERT Division Email: adh@cert.org Twitter: @__adh__
Analyzing 24 Years of CVD
© 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] This material has been approved for

public release and unlimited distribution. Please see Copyright

21

notice for non-US Government use and distribution

