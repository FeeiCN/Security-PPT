[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

Coordinated Vulnerability Disclosure

Laurie Tyzenhaus February 2018
Software Engineering Institute Carnegie Mellon University Pittsburgh, PA 15213

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

Copyright 2018 Carnegie Mellon University. All Rights Reserved.
This material is based upon work funded and supported by the Department of Defense under Contract No. FA870215-D-0002 with Carnegie Mellon University for the operation of the Software Engineering Institute, a federally funded research and development center.
The view, opinions, and/or findings contained in this material are those of the author(s) and should not be construed as an official Government position, policy, or decision, unless designated by other documentation.
NO WARRANTY. THIS CARNEGIE MELLON UNIVERSITY AND SOFTWARE ENGINEERING INSTITUTE MATERIAL IS FURNISHED ON AN "AS-IS" BASIS. CARNEGIE MELLON UNIVERSITY MAKES NO WARRANTIES OF ANY KIND, EITHER EXPRESSED OR IMPLIED, AS TO ANY MATTER INCLUDING, BUT NOT LIMITED TO, WARRANTY OF FITNESS FOR PURPOSE OR MERCHANTABILITY, EXCLUSIVITY, OR RESULTS OBTAINED FROM USE OF THE MATERIAL. CARNEGIE MELLON UNIVERSITY DOES NOT MAKE ANY WARRANTY OF ANY KIND WITH RESPECT TO FREEDOM FROM PATENT, TRADEMARK, OR COPYRIGHT INFRINGEMENT.
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.
This material may be reproduced in its entirety, without modification, and freely distributed in written or electronic form without requesting formal permission. Permission is required for any other use. Requests for permission should be directed to the Software Engineering Institute at permission@sei.cmu.edu.
Carnegie Mellon®, CERT® and CERT Coordination Center® are registered in the U.S. Patent and Trademark Office by Carnegie Mellon University.
DM18-0315

PSIRT: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release

and unlimited distribution.]

2

Reminder ­ RSA Attendees

VENDOR Meeting: Monday April 16, 2018, Westin St. Francis in San Francisco, CA, US.
FREE
https://www.eventbrite.com/e/2018-cert-vendor-meeting-registration39956032569 Morning Sessions: 1. Training: Vul Coordination 101 2. Supply chain transparency & component relationships Afternoon Session: Radically new ways multi-party coordinated vulnerability disclosure

PSIRT: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release

and unlimited distribution.]

3

Coordination Communication Topologies

Common network topologies
PSIRT: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release

and unlimited distribution.]

4

Single Vendor Vulnerability Report

Reporter Identifies a Vulnerability
Reporter contacts Vendor
Vendor responds (or ignores) Reporter

Point to Point
C

Reporter requests assistance:

· Reporter contacts CERT/CC

V

· CERT/CC confirms VUL

· CERT/CC communicates with

Reporter

R

· CERT/CC contacts Vendor

PSIRT: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release

and unlimited distribution.]

5

Multiple Vendor Vulnerability Report
Hub & Spoke

C

V

R

V

V
PSIRT: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

V

[DISTRIBUTION STATEMENT A] Approved for public release

and unlimited distribution.]

6

Coordinated Vulnerability Disclosure
Problems with Multi-Vendor Coordination: Hub & Spoke does not scale Who do we notify? Who did we miss? More effort happens after Disclosure Vendors must contact us for updating the vul note. Balancing conflicting vendor disclosure policies.
Examples: VU#484891 (the vul that enabled SQL Slammer) VU#228519 (KRACK)

PSIRT: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release

and unlimited distribution.]

7

Is there a better solution?
Improving Coordination

PSIRT: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

Collaborative Vulnerability Disclosure

PSIRT: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release

and unlimited distribution.]

9

A Better Solution?

Shared Bus

V

V

C

R

V

V

PSIRT: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

10

Microsoft's response to Congressional Letter
In less complicated scenarios, the CVD protocol calls for a huband-spoke model of communication through which a vulnerability owner communicates individually with each affected vendor.
In more complicated scenarios--like the one presented by Meltdown and Spectre--a "shared-bus" model can be required, to ensure affected companies can coordinate directly "through the use of conference calls, group meetings, and private mailing lists."
https://energycommerce.house.gov/wp-content/uploads/2018/02/MSFT-Spectre-Response-to-ECCommittee-.pdf

PSIRT: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

11

Communications
· Private shared venue · Vendors are invited in. · Shared file space · Track threaded discussions · Vendors can be added, immediate access to history

C

VV
VV
PSIRT: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

R

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

12

Coordinator/Coordination
· Sets target dates and milestones · Identifies and invites affected vendors · Invites additional vendors as identified

C

VV
VV
PSIRT: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

R

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

13

Reporter
· Identifies the vulnerability · May/may not contact vendor(s) · Contacts Coordinator

C

VV
VV
PSIRT: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

R

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

14

Vendors
· Vendors post statements, links to patches, etc. · Possible Multiple vulnerability reports (separate venues)

C

VV
VV
PSIRT: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

R

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

15

Challenges

Coordination Tracking threaded communications Secure Communications Contact Management Disclosure Timing Publishing Updating Reports

Collaboration
Account Management? Disclosure Timing ­ Everyone agrees? Publishing Updating Reports

PSIRT: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

16

Alternate Disclosure

Pre-Disclosure :
Group effort Open comms within the group Add new vendors Discussion threads/ scheduling disclosure

Post ­ Disclosure: Disclosure:
Artifacts Find new vendors (publishable Update references
docs)
Refine Content

PSIRT: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

17

What are your thoughts?

Laurie Tyzenhaus latyzenhaus@cert.org
Coordinated Vulnerability Disclosure Team Lead

PSIRT: Coordinated Vulnerability Disclosure © 2018 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.]

18

