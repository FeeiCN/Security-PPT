SESSION ID: MASH-F02
Website counterintelligence: Leveraging web logs to gather intelligence

Lance Cottrell
Chief Scientist Ntrepid - Passages
@LanceCottrell

#RSAC

#RSAC 2

#RSAC
Anonymity is hard
Everything is tracked All the time Everywhere
3

#RSAC
How Anonymity Fails
u Cookies u IP u Traceroute u History u Fingerprint u Human Error u Behavior
4

#RSAC
Google Uses Behavior
5

What can you learn from

#RSAC

your logs?

#RSAC
Let's put me under the microscope
7

#RSAC
Angel Investing
8

#RSAC
New Product R&D
9

#RSAC
Doing unto others

#RSAC
Step 1: Identify visitors so you can track them
11

#RSAC
Direct Identification from the IP

Reverse DNS
$ host 107.77.92.56
Host 56.92.77.107.inaddr.arpa. not found: 3(NXDOMAIN)

Whois
$ whois 107.77.92.56

NetRange: CIDR: NetName: NetHandle: Parent: NetType: OriginAS: Organization: RegDate: Updated:

107.64.0.0 - 107.127.255.255 107.64.0.0/10 ATT-MOBILITY-LLC NET-107-64-0-0-1 NET107 (NET-107-0-0-0-0) Direct Allocation
AT&T Mobility LLC (ATTMO-3) 2011-02-04 2012-03-20

12

Solicited Identification

#RSAC
u Newsletter u Webinar registration u White-paper registration u Account creation

13

#RSAC
4 Aggressive Tricks for Identification
1. Targeted Social Media links 2. "Phishing" email 3. Social Engineer for Corp IP blocks 4. HTML Bug in email
14

#RSAC
Targeted Social Media Links
u Create unique URL for some content.
u http://yourcorp.com/whitepaper.pdf?unique=12345678
u Share content with just the target
u Link IP addresses with the unique ID / target
15

#RSAC
"Phishing" Email
u As before, create unique URL for some interesting content.
u Send email with link to enticing content
u Link recipients with the unique ID / target
16

#RSAC
Social Engineer the Corp IP space
17

#RSAC
HTML Bug in Email
u Completely Automated u No user action u Passive with every email you
send.
That
18

#RSAC
Create a Random Signature Tracker
u Create an HTML signature file in your mail client u Find that signature file u Add unique tag and identifiable string u Change every 10 seconds
19

#RSAC
That looks like...
Signature  Image  Code <img  src="hMp://ntrepidcorp.com//passages_logo.jpg? sig_tracker_iden0fier8290=XXXtnoGXXX">
Signature  File  Updater while  (1)  {      $unique  =  0me()  .  "endmarker";      `cat  $sigCpy  |  sed  \'s/XXXtnoGXX/$unique/g\'  >  $targeIile`;      sleep($sleep0me);   }
20

#RSAC
Identify Who Got Which Tracker ID
u Scan sent email folder u Extract the recipients and the tracker ID from each email u Note: trackers and email addresses will be many to many
foreach  unexamined  email  {      find  the  emails  containing  the  marked  signatures      extract  the  recipient  informa0on  from  the  email      extract  the  unique  ID  from  the  email      put  both  in  a  database   }
21

#RSAC
Connect IPs to IDs
u Scan your web logs u Extract all the hits on your mail signature image file u Record the IP addresses which have hit that unique Tracker u This too can be a many to many relationship
example.com  70.197.23.21  --  --  [17/Feb/2015:18:23:34  +0000]  "GET  // siglogo.jpg?sig_tracker_identifier8290=1424138085endmarker  HTTP/1.1"
22

#RSAC
Step 2: Keep track of your target after identification
23

IP Address
Always there for you

#RSAC
May not be helpful

24

#RSAC
Cookies
u Cookies (and Super Cookies) u Yeah....
u obvious u simple u effective
25

#RSAC
Browser Fingerprints
Panopticlick
EFF research project http://panopticlick.eff.org
26

#RSAC
Step 3: Pattern Analysis
"Tex0le  cone"  by  Photographer:  Richard  Ling  (richard@research.canon.com.au)  --  Loca0on:  Cod  Hole,  Great  Barrier  Reef,  Australia.  Licensed  under  CC  BY--SA  3.0   via  Wikimedia  Commons  --  hMps://commons.wikimedia.org/wiki/File:Tex0le_cone.JPG#/media/File:Tex0le_cone.JPG
27

#RSAC
Usage Analysis
u Technical details are highly dependent on your particular hosting and analytics platforms.
u Google Analytics is not granular enough. u Logs will likely need post-processing to be
most useful
28

#RSAC
Create Topic Groups
u Group pages and web resources by type and topic
u Which product / service u marketing u technical u help u corp u team u labs u weapons
29

#RSAC
Examples from our website

Products

u Page Categories
u Team u Media & Events u White Papers u Support u FAQ

u Types of Targets
u Known Competitors u Possible Competitors

30

Segment statistics

Hits  Per  Website  Sec0on

Labs Gun Turret
AI Gel
0

25

50

75

31

#RSAC
100

#RSAC
Flag outliers
32

#RSAC
Who stands out

Black  Mesa Labs

Gun

Turret

AI

Gel

Weapons   R&D

2

9

11

3

1

Biologics   Lab

6

1

2

4

3

Marke<ng 8

3

45

10

12

Execu<ves 30

4

12

6

9

33

Quick and Dirty

160

120

80

40

0 January

February
Yoyodyne

#RSAC

March

April

Black Mesa

34

#RSAC
How to protect yourself
u Incognito mode in the browser (or better)
u Non-attributed IP address u Disposable email addresses for
registrations u Turn off auto-download images in
email u Clean VM or iOS for competitive
research
35

#RSAC
Next Steps
u When you get back:
u Start detailed logging of URL and IP addresses u Create groups of web pages based on product and purpose
u In the next few months:
u Identify Targets for tracking u Initiate target acquisition for top priorities
u Within six months you should:
u Implement tracking bug u Automate target acquisition u Initiate analysis of data
36

#RSAC
I Am Not Anonymous
u lance.cottrell@ntrepidcorp.com u @LanceCottrell u http://linkedin.com/in/LanceCottrell u http://ThePrivacyBlog.com u http://ntrepidcorp.com/blog
37

