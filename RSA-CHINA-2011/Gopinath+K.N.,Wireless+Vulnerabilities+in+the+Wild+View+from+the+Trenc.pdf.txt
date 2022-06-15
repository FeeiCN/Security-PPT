Wireless Vulnerabilities in the Wild: View From the Trenches
SpeakerGopinath KN Job TitleDirector, Engineering
Company NameAirTight Networks

Agenda
Why care about Wireless Vulnerabilities? (Motivation) What's new in this talk and what are its implications? Wireless Vulnerability Analysis (Measurements) Threat/Vulnerability Mitigation
2

Era of Wireless Consumerization

· Marshalls store hacked via wireless
· Hackers accessed TJX network & multiple servers for 18+ months
· 45.7 million payment credit accounts compromised
· Estimated liabilities > 4.5B USD

Are today's enterprises secure enough to prevent the recurrence of such attacks?
5

Enter War Driving

WPA/WPA2 AP (%)

How many of these are actually
connected to my network?

Not all APs are WPA/WPA2.

80

70

60

50

40

30

20

10

0

NNYY

LoLnodnodnon

6

PPaarirsis

RSA '07 RSA '08

War Driving Insufficient for Enterprise Threat Classification
Authorized

Our Study

External

Rogue

Sensor Based Statistical Sampling
Data collected over last two years

Total Number of

Count

Sites/Locations

2,155

Organizations

156

Sensors

4501

Total Access Points

268,383

Enterprise Clients

427,308

Threat Instances Analyzed 82,681

8

268,383 APs
External/ Authorized Unmanaged

70% APs do NOT belong to the studied
Organizations!

80,515

187,868

Similarly, About 87% Clients are Unmanaged/External!

AP Based Threats
· Rogue APs
· AP misconfigurations
· Soft/Client Based APs

Adhoc Network

Client based threats
· Client extrusions Connections to neighbors, evil twins
· Adhoc networks · Client bridging
· Banned devices

Threat Duration

T3 (T-Cube) Parameters
Presence of an instance of a threat (%) Window of opportunity for an attacker
Threat Presence
Likelihood of presence of a threat instance

Real-life data Based & Accurate picture of Threats
How does this information help you?
Get an idea of Wi-Fi threat scenario in enterprises that may be like yours Which wireless threats you should worry about first? Plan your enterprise mitigation strategy

Simple (Yes/No) metric based on the presence of an instance of a threat (%)
Threat Presence Threat Duration Threat Frequency
14

Let us First Look At Survey Results
Rogue AP Misconf. AP Adhoc Client Extrusion Other

% Response

Results Based on Our Data Analysis

Occurrence (% Organizations)

100% 90% 80% 70% 60% 50% 40% 30% 20% 10% 0%

Overall Threat Scenario

Client Extrusions
Misconf. APs Rogue APs
Adhoc

Soft Banned

APs

Devices

DoS

Client Bridging

Threats

Key Observations -Prominent Threats
-Client extrusions -Rogue APs -AP mis-configurations -Adhoc clients
Key Implications -Organization data is potentially at risk via Wi-Fi

Rogue APs Client Extrusions Adhoc Clients

Enterprise Wireless Consumerization: Rogue APs 1521 Rogue APs seen in our study
163 Different type of Consumer Grade OUIs seen

Rogue AP Details

About 1 in 10 Rogue APs have Default SSIDs About Half of Rogue APs Wide Open

Unknown/ Blank, 2%

Default SSIDs, 9%

WPA(2)/PSK, 29%

Unknown, 1%

Open, 49%

Non-Default, 89%

WEP, 21%

Rogue AP Details
An open Rogue AP is
Virtually THIS!

Client Consumerization: Client Extrusion
Client (Smartphones &
laptops both) probes for
these SSIDs.

Client Probing For Vulnerable SSIDs
Retail/SMB Organizations
118,981 Clients

Authorized Unmanaged

12,002

106,979

Power of Accurate threat classification.
5.3% Vs 20.4%

636 (5.3%) 21,777 (20.4%)

"Known" Vulnerable SSIDs Probed For
103 distinct SSIDs recorded
Certain (8%) Authorized Clients Probing for 5 or more SSIDs

Adhoc Authorized Clients!
565 distinct Adhoc SSIDs found, About half of them Vulnerable
15% of these are default SSIDs. 26,443 (7%) clients in adhoc mode.

So What? Illustrative Exploit via Client Extrusion
VIDEO DEMO: Smartpot MITM Attack

How long (time interval) a threat is active before removal?
Threat Presence Threat Duration Threat Frequency
28

Threat Duration

AP Threats live "longer" than Client Threats
15% client threats & 30 % AP threats live for > hr

Histogram indicating that AP threats live longer
12 Hr+ 12 Hr

Some AP based threats are active for a day or more!

6 Hr

1 Hr 30 Min 10 Min
0%

10% 20% 30%

40% 50% 60% 70%

Rogue AP AP Misconf. Client Extrusion Adhoc networks

% Threat Instances with Given Threat Duration
Data from SMB/Retail (PCI) Segment

Threat instances per Sensor per month
Threat Presence Threat Duration Threat Frequency
30

Threat Frequency

Threat Frequency

Large Enterprise Segment: Threats Per Month Per Sensor (Approx. 10,000 sq feet area)
13 14

12

10

8

8

6

4

1

2

0 Rogue AP Misconfigured AP Client Extrusion
Threat Category

Bigger your organization,
higher the likelihood of finding the
threats

Key Takeaways Summarized
· Wireless threats due to unmanaged devices are present
­ Enterprise wireless environment influenced by consumerization
· Certain threats more common than others
­ Client extrusions ­ Rogue AP ­ AP Mis-configurations ­ Adhoc clients
· Common threats affect large enterprise and SMB organizations
­ Wireless threats persist regardless of sophistication of wired network security

Threat Mitigation
33

Let's Ban Wi-Fi!

Use WPA2 Enterprise For Your Authorized WLAN!
But, WPA2 does not protect against threats due to unmanaged devices

Best Practices
· Cleanup wireless profiles regularly · Do not connect to networks such as "Free Public
WiFi", "Free Internet" · Do not connect to ad hoc networks · Use Virtual Private Network (VPN) if you are on the
road · Conduct enterprise wireless scans periodically

Options for Wireless Scans

Laptop/Notebook based tools

Centrally Managed tools

­ Public domain tools used for war · driving can be re-purposed for scans

·

­ Examples include Netstumbler,

Backtrack, Kismet

·

­ However, process is manual and suffers from limitations of wardriving (discussed earlier)

Via deployment of wireless sensors
Both onsite and SaaS models available
Onsite models need an upfront CapEx, but, OpEx based SaaS based models combine best of both worlds ­ · Removes cumbersome manual
process · Accurate threat classification

Threat Mitigation Summary

Intrusions (AP Based Threats)
­ Wire side controls as a first line of defense (e.g., 802.1X port control)

Extrusions (Client Based Threats)
· Educate users: clean up profiles, Use VPNs & connect to secure Wi-Fi

­ Wireless IPS to automatically detect & block intrusions

· Deploy end point agents to automatically block connections to insecure Wi-Fi

· Wireless IPS to automatically detect & block extrusions in enterprise perimeter

Questions? Thank You gopinath.kn@airtightnetworks.com
40

