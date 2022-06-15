Merging Network Configuration and Network Traffic Data in ISP-Level Analyses
Timothy J. Shimeall, Ph.D.

Software Engineering Institute Carnegie Mellon University Pittsburgh, PA 15213

Presentation Title
1 Jan 11­14, 2016
Distributio©n S2t0a1te6mCeanrtnAeg: iAepMpreollvoendUfonrivPeursbiltiyc Release; Distribution is Unlimited
Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Copyright 2016 Carnegie Mellon University
This material is based upon work funded and supported by the Department of Defense under Contract No. FA8721-05-C-0003 with Carnegie Mellon University for the operation of the Software Engineering Institute, a federally funded research and development center.
NO WARRANTY. THIS CARNEGIE MELLON UNIVERSITY AND SOFTWARE ENGINEERING INSTITUTE MATERIAL IS FURNISHED ON AN "AS-IS" BASIS. CARNEGIE MELLON UNIVERSITY MAKES NO WARRANTIES OF ANY KIND, EITHER EXPRESSED OR IMPLIED, AS TO ANY MATTER INCLUDING, BUT NOT LIMITED TO, WARRANTY OF FITNESS FOR PURPOSE OR MERCHANTABILITY, EXCLUSIVITY, OR RESULTS OBTAINED FROM USE OF THE MATERIAL. CARNEGIE MELLON UNIVERSITY DOES NOT MAKE ANY WARRANTY OF ANY KIND WITH RESPECT TO FREEDOM FROM PATENT, TRADEMARK, OR COPYRIGHT INFRINGEMENT.
[Distribution Statement A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.
This material may be reproduced in its entirety, without modification, and freely distributed in written or electronic form without requesting formal permission. Permission is required for any other use. Requests for permission should be directed to the Software Engineering Institute at permission@sei.cmu.edu.
Carnegie Mellon® and CERT® are registered marks of Carnegie Mellon University.
DM-0003171

Merging Network Configuration and Network

Traffic Data In ISP-level Analyses

January 13, 2016 © 2015 Carnegie Mellon University

2

Distribution Statement A: Approved for Public Release;

Distribution is Unlimited

Overview
The Network Data Flood Analyst Needs Merger Methods Examples of Merger Practical Tips

Merging Network Configuration and Network

Traffic Data In ISP-level Analyses

January 13, 2016 © 2015 Carnegie Mellon University

3

Distribution Statement A: Approved for Public Release;

Distribution is Unlimited

Network Data Flood
?

Network Configuration
Host identification Host criticality
Host configuration Vulnerability scan Vulnerability impact Subnet relations

Network Traffic

Network Flows

Packet captures

Alerts

Route information

Address resolutions

Service Logs

Merging Network Configuration and Network

Traffic Data In ISP-level Analyses

January 13, 2016 © 2015 Carnegie Mellon University

4

Distribution Statement A: Approved for Public Release;

Distribution is Unlimited

Analyst Needs

Network observation · What behaviors are seen from hosts of configuration X? · What configurations contribute to the volume of behavior Y?
Network orientation · Which configurations have vulnerabilities scanned for during event Z? · Which hosts are running the services exploited during event Z?
Network understanding · How difficult is it to apply patch Q on this network? · What issues would be involved in blocking service R on this network?
Network prediction · What is likely to follow event Z due to our traffic and configuration? · How likely are our customers to be affected by event Z?

Merging Network Configuration and Network

Traffic Data In ISP-level Analyses

January 13, 2016 © 2015 Carnegie Mellon University

5

Distribution Statement A: Approved for Public Release;

Distribution is Unlimited

Merger Methods
Config-first: Using configuration to drive network traffic analysis Traffic-first: Using traffic to drive network configuration analysis Deep-dive: Goals-Questions-Metrics Sandwich: Iterate between traffic and configuration driving analysis

Merging Network Configuration and Network

Traffic Data In ISP-level Analyses

January 13, 2016 © 2015 Carnegie Mellon University

6

Distribution Statement A: Approved for Public Release;

Distribution is Unlimited

Examples of Merger
Assessing encryption · Start with hosts configured as servers for encrypted services · Filter packets/flows/logs for those servers to generate profiles · Identify common users of services · Filter for other network points of contact for those users · Associate services and configuration associated with those
points

Network attack impact

· Start with traffic indicators of attack

· Generate set of network hosts involved with indicators

· Associate services and configurations with hosts

· Filter for contacts

· Identify vulnerable configurations in contacts

Merging Network Configuration and Network

Traffic Data In ISP-level Analyses

January 13, 2016 © 2015 Carnegie Mellon University

7

Distribution Statement A: Approved for Public Release;

Distribution is Unlimited

Practical Tips
Watch for topology mismatches Watch for NAT issues Try the simple approach first Generalize from working approaches Do not try to solve the insolvable

Merging Network Configuration and Network

Traffic Data In ISP-level Analyses

January 13, 2016 © 2015 Carnegie Mellon University

8

Distribution Statement A: Approved for Public Release;

Distribution is Unlimited

Conclusion

Challenges
Methods exist
Don't try to be too generic: you can extrapolate from what works
Need to take into account human and automated advantages

Merging Network Configuration and Network

Traffic Data In ISP-level Analyses

January 13, 2016 © 2015 Carnegie Mellon University

9

Distribution Statement A: Approved for Public Release;

Distribution is Unlimited

Contact Information
Timothy Shimeall Senior Member of the Technical Staff Telephone: +1 412.268.7611 Email: tjs@cert.org

Merging Network Configuration and Network Traffic Data In ISP-level Analyses January 13, 2016
© 2015 Carnegie Mellon University Distribution Statement A: Approved for Public Release; Distribution is Unlimited

10

