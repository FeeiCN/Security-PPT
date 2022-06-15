Pen Testing a City
Greg Conti, Tom Cross and Dave Raymond
http://static.mnium.org/images/contenu/actus/JeuxVideo/Sim_City_5/simcity_desastres_7.jpg

Disclaimer

The views expressed in this talk are those of the authors and do not reflect the official policy or position of Drawbridge Networks, West Point, the Department of the Army, the Department of Defense, or the United States Government.
We are not lawyers, please consult your legal advisor before considering pen testing anything.
http://static.neatorama.com/images/2009-03/japanese-homeland-security-advisory-system.jpg

Our Background

Tom Cross Drawbridge Networks
@_decius_

David Raymond Virginia Tech
@dnomyard

Greg Conti West Point
@cyberbgone

Why, So What, Who Cares
 Importance of Scaling Up  Cities are critical to national
security  Hard to pen test a nation
without an Army  Cities are microcosms to
explore best practices  Generalized results can be
applied across many cities
http://en.wikipedia.org/wiki/Great_Chicago_Fire#/media/File:Chicago-fire1.jpg

Even without an Adversary...

Two Inches of Snow in Atlanta (2014)

East Coast Power Outage (2003)

New York Blackout (1977)

San Francisco Earthquake (1906)

http://abcnews.go.com/us/wrong-atlanta-storm-chaos/story?id=22294035 https://www.baruch.cuny.edu/nycdata/disasters/images/blackout-1977.jpg http://en.wikipedia.org/wiki/Looking_Down_Sacramento_Street,_San_Francisco,_April_18,_1906#/media/File:San_Francisco_Fire_Sacramento_Street_1906-04-18.jpg

 Introduction
 Why, So What?  What is a City?  Smart Cities &
Dumb Cities
 Pen Testing  Dissecting a City  Cross Sectioning  Pressure Points  Risk Analysis  Solutions
http://www.goodwp.com/images/201102/goodwp.com_15490.jpg

What is a city?
city
/sid/
: noun 1. a large town. "one of Italy's most beautiful cities" 2. informal a place or situation characterized by a specific attribute. "panic city"
Attributes:
 A center of population, commerce, and culture (thefreedictionary. com)
 Incorporated municipality, usually governed by mayor and council (Dictionary.com)
 Has complex systems for sanitation, utilities, land usage, housing, and transportation (Wikipedia)

Largest Cities

Global

US

Source: WorldAtlas.com

IP Addresses per Metro Area DMA Code

IPv4 (millions)

IPv6
(Illustrates relative adoption, but baseline is e^25.)

Smart Cities = Larger Attack Surface

Barcelona, Spain

"cities and regions that use technology not just to save money or make things work better, but also to create high quality employment, increase citizen participation and become great places to live and work."

- Intelligent Community Forum

Representative Projects

http://smartcity.bcn.cat/en/ http://www.forbes.com/sites/federicoguerrini/2015/01/28/worlds-top-7-smartest-cities-of-2015-are-not-the-ones-youd-expect/

Major Industry Initiatives

Cisco's Smart Connected Communities

IBM's Intelligent Operations Center

Google's Sidewalk Labs

But Don't Forget Dumb Cities
http://www.treehugger.com/sustainable-product-design/goodbye-henry-drefuss-designed-dumb-round-classic-honeywell-t86.html

 Introduction  Pen Testing  Dissecting a City  Cross Sectioning  Pressure Points  Risk Analysis  Solutions
https://nlmhmd.files.wordpress.com/2014/04/andreasvesalius_pg_235dissectioninstruments.png

SANS Network Pen Testing Process*
1. Preparation
a. NDA/permission memo b. Scoping and ROE
2. Testing
a. Reconnaissance b. Scanning c. Exploitation d. Password attacks e. Wireless attacks f. Web app attacks
3. Conclusion
a. Analysis and retest b. Pen test report
But how does this fit when thinking at City scale?
*SANS Security 560, V2010_1226, book 1, pp 65-66.

Traditional Pen Testing

Physical Network

Web/Application Human/SE

Traditional vs. City-Level Process

1. Preparation

1. Define "City" (Scope)

a. NDA/permission memo

2. Determine audit surface

b. Scoping and ROE

area @ each level of

2. Testing
a. Reconnaissance

abstraction

b. Scanning

a. Determine how to

c. Exploitation

VS.

collect information @

d. Password attacks e. Wireless attacks f. Web app attacks

each level 3. Cross sectional analysis

3. Conclusion

4. Pressure point analysis

a. Analysis and retest

5. Risk analysis of threat

b. Pen test report

actors

a. Most likely courses of action

b. Most dangerous

courses of action

 Introduction  Pen Testing  Dissecting a City  Cross Sectioning  Pressure Points  Risk Analysis  Solutions
https://nlmhmd.files.wordpress.com/2014/04/andreasvesalius_pg_235dissectioninstruments.png

A Quick Look at San Francisco

Population 837K

Commercial 200K
Local Government

Non-Profit K's (est)

A Quick Look at the United States

X 39K = "Cities"

1 Country 50 States 18K Large Businesses 39K Local Govts 1.5M Non-profits 27M Small Businesses 182M Smart Phones 310M Personal Computers 318M People Bs IoT

Cyberspace Planes
 Supervisory - Often siloed/compartmentalized between sectors
 Persona - Relevant identities or accounts; do you know who to contact in other sectors?
 Logical - System compatibility; how do various networks and systems communicate?
 Physical - Redundancy; can connectivity be compromised?
 Geographic - Physical location can be important!

Cyberspace Planes
Politics

"Silos of Excellence"
http://www.jec.senate.gov/public/_cache/files/5ee16e0f-6ee6-4643-980e-b4d5f1d7759a/obamacare-chart.pdf

Supervisory Plane
 Forms of Municipal Government
 Council-Manager (Las Vegas)  Mayor-Council  Commission  Town Meeting  Representative Town Meeting
 Umbrella organizations
 National League of Cities (NLC) Organized into 49 State Leagues (not Hawaii)
 International City/County Management Association (ICMA)
 Las Vegas active in both

Political Pressures are Baked In
Elected Appointed
Appointed

Persona Plane
Cities tend toward openness
 Most feel obligated to publish data on local officials  Email addresses often easy to get using open-source recon  Very active social media presence and all that affords
http://s193.photobucket.com/user/orafs/media/Rhodesian%20Heritage/The%20Years%20in%20Between/Photo7.jpg.html

Logical Plane

IBM Intelligent Operations Center

PubWorks

City Management Software
 IBM Intelligent Operations Center - helps manage all aspects of city operations
 PubWorks - manages work orders, service requests, fleet maintenance, etc.
http://www.pubworks.com/portals/0/graphics/tooltips/parts_history_2.png

IBM Intelligent Operations Center

 View city conditions and assess critical issues

 View and analyze citizens' social media sentiments

 View problems reported by citizens and see locations on a map

 Monitor trends

http://www-03.ibm.com/software/products/en/intelligent-operations-center

Nevada Freeway and Arterial System of Transportation (FAST) Dashboard
http://bugatti.nvfast.org/Default.aspx

Many City governments have provider independent IP addresses

Internet facing services hosted by the ten largest U.S. City governments.
* Services above port 10,000 are not shown.

Physical Plane

Wireless Sensors

Shodan Maps

Buried Fiber

Emergency Broadcast System

Municipal Wifi
http://www.tukwilawa.gov/pubwks/IURoadway.html https://shodanio.files.wordpress.com/2014/02/shodan-maps.png https://www.amherstma.gov/ImageRepository/Document?documentID=29330 http://image.slidesharecdn.com/zigbee3-150502153027-conversion-gate01/95/zigbee-30-global-standard-for-iot-25-638.jpg http://www.ibsbroadcast.com/wp-content/uploads/2013/08/Diagram.jpg

Auditing the Wireless Spectrum
http://rtlsdrblog.rtlsdrblog.netdna-cdn.com/wp-content/uploads/2013/04/R820TDongleImage.png https://cdn.sparkfun.com/assets/parts/9/9/5/3/13001-04.jpg http://rtlsdrblog.rtlsdrblog.netdna-cdn.com/wp-content/uploads/2013/04/R820TDongleImage.png

Geographic Plane

 Introduction  Pen Testing  Dissecting a City  Cross Sectioning  Pressure Points  Risk Analysis  Solutions
http://www.bmiaa.com/wp-content/uploads/2015/01/53f1b926c07a80096200039e_city-as-a-vision-tribute-to-michel-ragon_11.jpg

Critical Infrastructure Sectors (DHS)

Chemical

Financial Services

Commercial Facilities

Food and Agriculture

Communications

Government Facilities Critical Manufacturing Healthcare and Public Health

Dams

Information Technology Defense Industrial Base

Nuclear

Emergency Services Transportation Systems

Energy

Water and Wastewater http://www.dhs.gov/critical-infrastructure-sectors

InfoSec Community Research

Hacking Traffic Control Systems DEFCON 22

Smart Parking Meters DEFCON 17

Electronic Road Signs

Gas Stations

Bluetooth Traffic Monitoring DEFCON 22

Toll Collection Systems DEFCON 21

InfoSec Community Research

Power Meters DEFCON 20

Airport Security & Air Traffic Control Water Plants

BH 2014 / DEFCON 18

DEFCON 18

Elevators DEFCON 22

Municipal Surveillance DEFCON 22

ATMs DEFCON 18

and It Isn't All Just Researchers...

Sony Hack (2014)

Saudi Aramco Hack (2012)

Sands Casino (2014)

Sands Casino (2010)

At Next Year's Black Hat

Roadway Sign Networks Electronic Billboards

Smart Highways

Traffic Reporting Systems

Mass Transit Wireless Networks

Effects
 Deceive - Cause a person to believe what is not true
 Degrade - Temporary reduction in effectiveness  Delay - Slow the time of arrival of forces or
capabilities  Deny - Withhold information about capabilities  Destroy - Enemy capability cannot be restored  Disrupt - Interrupt or impede capabilities or
systems  Divert - Force adversary to change course or
direction  Exploit - Gain access to systems to collect or
plant information  Neutralize - Render adversary incapable of
interfering with activity  Suppress - Temporarily degrade adversary/tool
below level to accomplish mission
Don't forget "Non-effects" - Silent information gathering and pre-positioning
https://en.wikipedia.org/wiki/Dominoes#/media/File:Toppledominos.jpg

Interdependency Modeling (Flooding Event)
 Individual infrastructures are represented on a single plane
 Parallel lines represent subsets of infrastructure
 Nodes represent key infrastructure components
 Dotted lines indicate interdependencies
http://www5vip.inl.gov/technicalpublications/Documents/3489532.pdf

Critical Infrastructure Dependency Matrix (Example)
http://www5vip.inl.gov/technicalpublications/Documents/3489532.pdf

Cascading Consequences
http://www5vip.inl.gov/technicalpublications/Documents/3489532.pdf

Modeling Interdependencies
 National Infrastructure Simulation and Analysis Center (NISAC)  http://www.sandia.gov/nisac/  Suite of tools for analyzing interdependencies between sectors
 Multi-network Interdependent Critical Infrastructure Program for Analysis of Lifelines (MUNICIPAL)  RPI/NSF  Uses Interdependent Layered Network (ILN) mathematical model

 Introduction  Pen Testing  Dissecting a City  Cross Sectioning  Pressure Points  Risk Analysis  Solutions
ttp://upload.wikimedia.org/wikipedia/commons/f/fc/Chinese_meridians.JPG

A Small Barn Fire...
Region of Chicago destroyed in 1871 by fire starting in a small barn http://upload.wikimedia.org/wikipedia/commons/3/3a/Great_Chicago_Fire_map_with_starting_point.jpg

Center of Gravity Analysis
"The source of power that provides moral or physical strength, freedom of action, or will to act." Thus, the center of gravity is usually seen as the "source of strength". - DoD JP 1-02,
2008
See also: http://en.wikipedia.org/wiki/Center_of_gravity_%28military%29 and http://www.dtic.mil/doctrine/new_pubs/jp2_0.pdf

Centers of Gravity

 Government  Financial sector  Retired people  Gaming  Energy/oil  Food  Entertainment  Military  Religion  Others?

"Non-Critical" Sectors

- Churches

- Town Hall

- Real Estate Brokers

- Libraries

- Post Office

- Local Banks

- Bars / Nightclubs - Public Works

- Law Offices

- Theaters / Cinemas - Chamber of Commerce - Schools

- Sports Facilities

- Local Telecoms

- ...

http://tile.loc.gov/image-services/jp2.py?data=/service/gmd/gmd7/g7144/g7144b/ct002932.jp2&res=2

 Introduction  Pen Testing  Dissecting a City  Cross Sectioning  Pressure Points  Risk Analysis  Solutions
image derived from XKCD

Threat Hierarchy
Defense Science Board Report - Resilient Military Systems and the Advanced Cyber Threat

 Introduction  Pen Testing  Dissecting a City  Cross Sectioning  Pressure Points  Risk Analysis  Solutions

Tractability

Complexity

Dumb Cities

Moderately Intelligent Cities

Smart Cities

One approach: Treat like a company
How is a city different?  Politics!  Governmental inertia  Limited budget  Complex legal authorities
How is it the same?  Security is a cost center  Can (usually) be partitioned
into business units  Some city CISOs approach it
like they would a company!

Securing Smart Cities Initiative
Activities Include:  Educating smart city planners and providers
on the importance and cost benefits of security best practices  Collaborating with partners to share ideas and methodologies  Endorsing the significance and benefits of introducing security early into the development lifecycle of a project or plan  Fostering partnerships between cities, providers, and the security community  Creating standards, guidelines, and resources to help improve cybersecurity across all areas related to smart cities
securingsmartcities.org
http://www.kaspersky.com/about/news/press/2015/Securing-Smart-Cities-Leading-Security-Experts-Join-Forces-to-Make-Modern-Cities-Safer

Solutions Proposed by the Initiative
 Cyber Security Checklists for Smart Cities
 Properly Installed Encryption  Strong Passwords  Structured Patching
Regimes  Security requirements and
approval process  Track access to city systems  Run regular tests  Emergency response teams  Information sharing with
other cities  Create manual overrides for
all smart city systems
http://bits.blogs.nytimes.com/2015/05/26/security-researchers-start-effort-to-protect-smart-cities/?smid=tw-share&_r=1

Solutions
 Executive Support & Buy-in  Threat intelligence  Cross functional security assessments  Develop Metrics
 Make data public  Create a competitive environment  Robust analytic framework  Center of Gravity analysis  Interdependency analysis  Threat analysis  Create meaningful city-level exercises and training venues  Opportunity for a City-level security business model?  Be ready with a plan when something bad happens  City-level CERT  Transparency and Media Attention

The Need for Broadband Wardriving

 Spectrum is getting cluttered with potentially vulnerable devices
 We need to know about more than just Wifi  Auditing large physical spaces for low power
transmitters can be a lot of work  Solutions:
 Put Wireless Data Collectors in Police Cars  Police cars drive everywhere  Potential privacy issue? (Device IDs)
 Crowd Sourcing  Better tools are needed
 Need better mobile phone SDR software for transmitter discovery
 Some Zigbee hacking projects
were written for devices that are now obsolete or are hard to get  Websites to report and share data

http://www.blogg.ch/uploads/wlan-wardriving-zuerich.png http://edge.alluremedia.com.au/m/g/2012/03/qldcar-640x360.jpg

Capability Maturity Model for Cities?
http://www.ingenia.biz/iea/images/ea/ea%20maturity%20model%20table%20600x363.png

Look to Estonia
Estonia: A Model for e-Government, CACM June 2015

Simulation and Exercises
SANS CyberCity
- https://www.sans. org/netwars/cybercity
Michigan Cyber Range: Alphaville
- http://www.merit. edu/cyberrange/alphaville. php
EA/Maxis - SIMCITY
- http://www.simcity.com/

Media Attention & Public Awareness
"Claims about a researcher infiltrating a plane's control systems have put a spotlight on aviation security. It's time for the industry to be more open about potential risks and let hackers test the strength of their networks."
Great example is Space Rogue's article on aviation security in Christian Science Monitor
http://www.csmonitor.com/World/Passcode/Passcode-Voices/2015/0529/Opinion-Why-the-aviation-industry-needs-more-hackers

Black Hat Sound Bytes
 Cites are the backbone of civilization, but are fragile and snarls of complexity and interdependencies.
 Securing our cities would be a major step toward securing nations, but significant obstacles stand in the way.
 Lessons from securing companies can be applied to securing cities, if there is strong leadership, sufficient resources, and politics don't get in the way.

Questions

Tom Cross @_decius_

David Raymond Greg Conti @dnomyard @cyberbgone
http://upload.wikimedia.org/wikipedia/commons/b/b5/Mirza_Masroor_Ahmad_recieving_key_to_LA.jpg

