Splunk for IT Ops: A Storage Perspective
Kyle Prins | @KylePrins
October 2018 | Version 1.0

© 2018 SPLUNK INC.

Who is Kyle Prins?
 Splunk Certified SE3 & Architect 2  Current Expat  BS Computer Engineering  2.5 Years at Dell EMC  Former Dell EMC customer  17 year Scuba Diver  Smart Home & Automation Victim  Mediocre Snowboarder  @KylePrins  www.BigDataBeard.com

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.

Key Takeaways

1. Splunk is a business critical application
2. An Intelligent Storage System can add
speed and resiliency
3. Having insights into your Splunk
infrastructure is key to a successful deployment

Splunk Storage Recommendations

DAS, SANOpotironSaDl TSSIDX Reduction

HOT

WARM

Flash

>1000 IOPS

© 2018 SPLUNK INC.

COLD

Option to use Hot/Warm infrastructure or add NAS HDD 800 IOPS

FROZEN

NAS or Object Storage Data no longer able to be searched

Intelligent Storage System Components
Host 1

© 2018 SPLUNK INC.

Lun 0 Connectivity
FC SAN

Front End

Back End

Cache

Physical Disks

Lun 0

Lun 1

Lun 1

Host 2

© 2018 SPLUNK INC.
Some Good Rules to Follow for ISS Running Splunk
 Multiple paths to the storage array · Across different engines
 Turn off auto tiering · Why not just go SSD?
 When in doubt, SSD.
 Mind your cold queries. · Cold is cold for a reason · Watch your searches run from users

Dell EMC's XtremIO

 Scale Out All Flash Storage Array

 > 1 Million IOPS & < 1ms Latencies

 D@RE with Self-Encrypting Drives

 In-Memory Data Copy Services

 Access via FC or iSCSI

 BFS Support

 Double parity data protection

 Inline data reduction

HOT

© 2018 SPLUNK INC.
WARM

XtremIO Demo

© 2018 SPLUNK INC.

 Demo

Dell EMC's Isilon
 Scale Out File System  Grow up to 68 Petabytes  OneFS Single Filesystem  Access via Multiprotocol  Dynamic Load balancing  Auto balanced nodes
COLD

© 2018 SPLUNK INC.
FROZEN

Isilon Demo

© 2018 SPLUNK INC.

 Demo

Let Our Splunk Ninjas Help You!

© 2018 SPLUNK INC.

Trained by Splunk Splunk Architecture Experts Dell EMC Portfolio Experts Religious about Best Practices Available across the GLOBE!!!
Contact your local Dell EMC rep

© 2018 SPLUNK INC.
Questions?

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

