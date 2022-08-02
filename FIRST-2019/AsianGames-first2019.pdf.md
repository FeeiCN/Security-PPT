Asian Games 2018: Cyber Security Lessons Learned
Andika Triwidada [ID-CERT] Bisyron Wahyudi [ID-SIRTII]

Part #1 ­ Big Picture
2

National Cybersecurity Management Framework

Executive Coordinator Team

Public Service & Utility
Protecting Cyberspace for Public Services &
Utilities

Defence
Protecting Military Cyberspace Environment

Law Enforcement
Investigation & Prosecution of Cyber
Crime

Intelligence
Prevention and Capacity Building

Coordinator and consolidator of all relevant aspects as to cybersecurity

NCSOC

Relevant Elements and Units as to Cybersecurity
Sector-Specific CSIRT Cyber Defence Cyber Crime Units Community of Practiice

1. Citizen and Children Protection 2. National Interests 3. Critical Information Infrastructures

Policy and Strategy Level Coordinating Ministry, Ministers
Tactical Level Cybersecurity Agency, Senior Officers, Senior Experts, Academicians
Operational Level Public Servants, Industry, Practitioners

3

National Cyber Security Structure

Deputy Chairman for Identification & Detection

Deputy Chairman for Protection

Deputy Chairman for Response & Recovery

National Cyber Security Operations Center

Deputy Chairman for Monitoring & Controlling

Community CERT

Sector CERT

Government CERT

4

Asian Games 2018
Turning physical event into the most connected game ever... Equivalent to a company with 50,000 employees operating 24/7 serving millions of customers.
· The biggest multi-sport games after the Olympic Games · The most prestigious event organized by the Olympic Council of Asia · 40 sports · 67 disciplines · 462 events
5

Participants
The number of participants to be served by accreditation (each has different authority, access rights, facilities, etc.): · 9.500 Athletes · 5.500 Officials and Judge · 2.500 VVIP and OCA · 15.000 Volunteer · 2.500 Journalist
6

Venue
All venues fully equipped with IT infrastructure · 50 Competition Venues · 130 Non Competition Venues:
· Airports · Athlete villages and Hotels · Main Operation Center · IT Command Center
7

Our Program

Monitoring & Control

Network/ Infrastructure
Protection

Bringing together people, processes and technology for Cyber Security

Threat & Vulnerability Management

Cyber Security

Identification Incident & Detection Management
8

Part #2 ­ Some Details
9

All Started in End of March, 2018
· New IT director & vice director · No (new) budget (late for 2018) · No project management · No grand design & lack of documentation for existing infrastructure · No (adequate) security · Lack of staff
· No network engineer; only from partners · No security engineer · No support staff · No help desk
10

Security in Place
· CDN · DNS · Load balancer · WAF · Pentest for certain service
11

Key Partners
· Timing & Scoring · Application: Asian Games
Information System · Network Connectivity · Venue Technology · Cloud · Endpoints & Peripherals
· (much later ...) Security
12

Complex System
· 40+ competition venues, 4 clusters spreads over 4 provinces · 4000+ endpoints · Internal backbone bandwidth potentially reach > 1 Gbps · Closed network (initial requirement, but practically need to be exposed to Internet to serve some
functions) · First time deployment of Asian Games or similar big sporting event on cloud
· To support 45 countries, 465 events in 40 sports, 11k+ athletes, 3+ weeks, ... compared to 2016 Summer Olympics: 207 nations, 306 events in 28 sports, 11k+ athletes, 2+ weeks
13

14 14

15 15

16 16

17 17

18 18

Impossible Requirement
· Zero downtime · Fully redundant links · Fully redundant servers · Load balancing · Checklist from IT Auditor: 30+ items
19

Unique Scope of Work
· Focus on AGIS · Public web were only minimally handled by IT
· Initially public web infrastructure were provided by IT · CMS were under other dept · Later, infrastructure were also provided by partner · IT only provide some realtime data to them
· Most infrastructure were not provided by IT
· WiFi, internet, PCs
20

July ­ August 2018: Worrisome Situations
· Tight schedule · Several important contracts were not signed yet · Stories about Winter Games incident
· all system down & wiped, 1 hour before opening ceremony
· Local politics · 3 major availability losses
· all due to accidents, not from external attacks
21

Start of Game, August 10th, 2018
· Minimum new budget · Minimum project management · Minimum security · Minimum staff (<20)
· No network engineer · One security engineer · No support staff · Team of help desk
· IT Command Center: 60 seats, 40 large display, 24x7 operation
22

23 23

24 24

Tiny Core, Huge Overall Team
· ITTD Core less than 20 · Total personnels under ITTD reaches 5.000+
· ~3,000 for network connectivity · ~900 for venue technology · ~600 IT Volunteers · ~300 T&S local Workforce, ~400 T&S expats · ~50 for cyber security · ~400 for endpoints & peripherals · ~20 for cloud
25

Some Security Measures were Ready
· Endpoints hardening done, but all 4000+ has same username & password  · IDS in place, but only default rules · 24x7 help desk & security monitoring team were ready · Pentests done · Stress test done
26

Some Security Measures were Ready (2)
· Link switch test done · BCP, DRP, ERP were partially done · Availability monitoring & alerting ready · Venue-to-venue traffic blocked, except for several multiple-venue-sports
27

Initial Panic on Opening Ceremony Day
· 3 simultaneous alerts, significant volume · Overnight learning
· Tentative conclusions: all false alarm
28

Very Surprising Situation on Games Time
· Everything related to worked smoothly when needed!
29

Lies, Damned Lies, and Statistics :D
· Max 150k concurrent public web users · 225+ M page views from public web · 160+ M screen views from mobile app · 40+ M events recorded by SIEM · 1+ M messages processed by GMS; 8+ GB data
30

Anticlimatic End
· No apparent security breach · No one interested in our system? · or ... attacker already penetrated deep, undetected, but didn't want to show his/her
hand?
31

What Did We Do Correctly?
· Proper IP allocation plan · Mapping IP range to venue · Disseminate IP range vs venue info to availability monitoring/alerting and SIEM · Realtime alert: network availability, service availability, performance treshold
32

What Did We Do Correctly? (2)
· Help desk prepared ever changing today's focus at midnight · Help desk proactively push vendors if any item on today's focus was not green · Low cost VPN appliance for quick deployment · Good cooperation & communication
33

Lesson Learned
· Every vendors only concerns their own scope
· We have to create end-to-end monitoring system · To quickly pinpoint which side has problem: Network or Application?
· No vendors understand the importance of performance baseline
· We have to tell everyone, what kind of monitoring we need to see
· Veteran vendors didn't care about security, because it has worked ok since long time ago ...
· We have to reject insecure protocols and request them to use safer alternatives
34

Lesson Learned (2)
· Custom geolocation for public IPs & especially private IPs
· Products/application with this feature will be very helpful
· Need to develop a mechanism to allow data sync but still limit trojan spread
· For server to server and especially DC-DRC
· Use secure file sharing for dynamic data
· IP alloc, TEAR, ...
35

