Please Remember to Complete Your Feedback Form
Wednesday, July 27, 2011

The Rustock Botnet Takedown OPERATION B107 July 27, 2011 Julia Wolf <julia@fireeye.com> Alex Lanstein <alex@fireeye.com>
Wednesday, July 27, 2011

Summary of the Next Hour
· Past:The Rustock Botnet was responsible for over 50% of all spam on Earth, several times since 2006.
· Past:The code evolved significantly over the years. · Past: It fell down a few times over the years, but
then got back up.
· Present: In March of this year, Microsoft et al. successfully shutdown this botnet, and it has not recovered.
Wednesday, July 27, 2011

The Past
Wednesday, July 27, 2011

Rustock:The Early Years
· Named `Rustock' around Jan 2006 by Symantec · Also named `RKRustock',`Costrat', and generic
names like `Meredrop' by others
· Initially used IRC for C&C communications · The C&Cs hosted on Russian Business Network · Opened a proxy on the victim to relay spam · Used Standard Windows Rootkit tricks to hide
(SSDT Hooking, ZwOpenKey, ADS, etc.)
Wednesday, July 27, 2011

Circa 2007
· More-Efficient Template based spambot · Uses HTTP for C&C communications · Propagated via drive-by exploits and spam
with sensational subject lines
· Spam messages using Microsoft's trademark · Spam for counterfeit Pfizer pharmaceuticals · Spam for penny stocks, etc.
Wednesday, July 27, 2011

Wednesday, July 27, 2011

Wednesday, July 27, 2011

Wednesday, July 27, 2011

Dear lucky winner, This is to inform you that your email has won a consolation prize of the Microsoft Corporation EMAIL DRAW Today. Your email has won you 1,000.000.00 (One Million Great british Pounds) To claim your prize, please contact your fiduciary agent Barr.Arthur James Esq with your Batch #:409978E and Reference No:FL/668530092 and contact him via email immediately within 24hrs.with the information below. Barr Arthur James Esq Email:barr.arthurjamesesq01@hotmail.com.hk Tel: +44-792-404-9532 Tel: +44-703-192-4594 You are to send the below required details; 1.Full Name:.............. 2.Address:................ 3..Occupation :..............` 4.Age:.............. 5.Sex:................. 6.Tel:.............. Sincerely, Mrs Marilyn Berger Head Customercare Service Microsoft Promotion.
Wednesday, July 27, 2011

Circa 2008
· C&Cs mostly hosted at Atrivo/Intercage... Until September 2008
· ...Then C&Cs mostly hosted at McColo... Until November 2008
· Joe Stewart estimated about 130,000 bots in Rustock at the time.
Wednesday, July 27, 2011

Wednesday, July 27, 2011

Circa 2008
· Rustock used hard-coded IPs for C&Cs, after McColo it switched to using static DNS
· On the weekend of Nov 15, McColo regained peering through TeliaSonera for about twelve hours
· An update was pushed out to the botnet, relocating the C&C servers in Russia
Wednesday, July 27, 2011

Circa 2009
· Propagated via Pay-Per-Install [Piptea] · Propagated via drive-by-download attacks · Pharmacy spam... · Blah, blah, more of the same... · Oh yeah, and sending about 50% of all spam
on Earth
Wednesday, July 27, 2011

Circa 2010
· Stopped sending spam approximately between Dec 25, 2010 and Jan 9, 2011
· No one is certain why yet, but lots of speculation:
· May have had something to do with "SpamIt/Glavmed" going down in Oct.
· Maybe someone involved got arrested · Maybe the botnet operator(s) went on
vacation [or were abducted by aliens...]
Wednesday, July 27, 2011

Technical Advancements 2009-2010
· Began using pseudo-random DNS names for C&C backup
· Used a slight variation of RC4 to encrypt communications
· DNS answers for C&Cs would return an obfuscated IP address, which Rustock would transform into the real thing 1.2.3.4 -> 5.6.7.8
· C&C Server Hierarchy...
Wednesday, July 27, 2011

Main Command
Server

Main Command
Server

Control Control Control Control Server Server Server Server

Victim Victim Victim
(Diagram Not to Scale)

Victim

Victim

Victim

Victim

Victim

Wednesday, July 27, 2011

Main Command
Server

Main Command
Server

Publicly Visible

Control Control Control Control Server Server Server Server

Victim Victim Victim
(Diagram Not to Scale)

Victim

Victim

Victim

Victim

Victim

Wednesday, July 27, 2011

Main Command
Server

Main Command
Server

Invisible

Control Control Control Control Server Server Server Server

Victim Victim Victim
(Diagram Not to Scale)

Victim

Victim

Victim

Victim

Victim

Wednesday, July 27, 2011

Technical Advancements 2009-2010
· Began using TLS/SSL for SMTP transport, and then stopped using it after several months, possibly for performance reasons.
· Fast-Flux DNS · Mix random text from http://wikipedia.org/
wiki/Special:Random into spam
Wednesday, July 27, 2011

Domains Answering with False IPs
· godlovesme.org · chernomorsky.name · hollybible.com · hollyjesus.com · muza-flowers.biz
Wednesday, July 27, 2011

From: Super Offers onViagra <ibabuyaz9927@comcastbusiness.net> Subject: julia, cut prices all week. Roman a Planet present Forest
Example Random Spam From: Super Offers onViagra <pesipabep8888@vt.edu>
Subject: julia, cut prices all week. the rates received
From: Super Offers onViagra <uxupeidi1999@alicedsl.de> Subject: julia, cut prices all week. d The
From: Super Offers onViagra <okysoy7918@charter.com> Subject: julia, cut prices all week. Executive
From: Super Offers onViagra <yavehawygo7373@rr.com> Subject: julia, cut prices all week. the the
From: Super Offers onViagra <nuufuigu2455@comcast.net> Subject: julia, cut prices all week. as sequential The After
From: "Pfizer PillsTrader" <seruky3597@mchsi.com> Subject: Hi julia, Sale-Over Reminder. area volcanic Movies
From: "Pfizer PillsTrader" <iliowi9398@comcast.net> Subject: Hi julia, Sale-Over Reminder. is the b IB on
From: "Pfizer PillsTrader" <pocisyxu4643@2sex899.com> Subject: Hi julia, Sale-Over Reminder. more Please the A members
Wednesday, July 27, 2011

Wednesday, July 27, 2011

2011
· March 16, 2011: US Federal Marshals and the Dutch High Tech Crime Unit seize all Rustock C&C physical servers
Wednesday, July 27, 2011

The Present
Wednesday, July 27, 2011

Wednesday, July 27, 2011

Operation b107
· Operation b49,Waledac takedown in 2010 - DNS name transfer to Microsoft
· Not applicable to Rustock · Richard Boscovich had a great idea: · Lanham Trademark Act (15 U.S.C.) · And also, Computer Fraud and Abuse Act
(18 U.S.C) and CAN-SPAM Act (15 USC)
Wednesday, July 27, 2011

Operation b107
"Enter a preliminary and permanent injunction isolating and securing the botnet infrastructure, including the software operating from and through the Command and Control IP Addresses/ Domains and placing that infrastructure outside of the control of the Defendants or their representatives or agents."
TL;DR We want to to seize all the computers.
Wednesday, July 27, 2011

Lanham Trademark Act
· Allows companies to seize [alleged] counterfeit goods and trademark infringing materials
· The Rustock C&C servers [are believed to] contain spam templates for emails claiming to be from Microsoft, and for counterfeit Pfizer pharmaceuticals
· ...Which are all fraudulently using Microsoft and Pfizer's trademarks
Wednesday, July 27, 2011

Since March
· Brian Krebs may have found at least one person behind the operation of the Rustock Botnet:Vladimir Alexandrovich Shergin (who doesn't pay his hosting bills)
· Another suspect associated with SpamIt goes by "Cosma2k," possibly named Dmitri A. Sergeev,Artem Sergeev, or Sergey Vladomirovich Sergeev
· Name is kinda like "John Smith" in English
Wednesday, July 27, 2011

Wednesday, July 27, 2011

Wednesday, July 27, 2011

Since March
· Microsoft has been running advertisements in the newspapers circulated near where the operators are believed to be
· They have also been trying to contact all of the alleged operators via email, phone, and ICQ; Basically saying: "Hey, we have your stuff, tell us if we're mistaken."
· So far, no one has contacted Microsoft complaining about their servers being sized
Wednesday, July 27, 2011

Wednesday, July 27, 2011

Wednesday, July 27, 2011

From The Court Filing
· I find this quote hilarious:
"No Customers of the IP addresses in question, or the domains in question have requested that the IP addresses and domains be reinstated."
Wednesday, July 27, 2011

Current Botnet Size
· Data Measured by Microsoft's Sinkhole · Mar 20-26, 2011: 1,601,619 · June 12-18, 2011: 702,860
Wednesday, July 27, 2011

In Related News...
· Similar tactics have been used to takedown CoreFlood botnet after Rustock
Wednesday, July 27, 2011

The Future
Wednesday, July 27, 2011

Yet To Be Written...
I'm not being poetic, I mean I just haven't written this slide yet. It'll be done in the next few days.
Wednesday, July 27, 2011

Credits
· Microsoft Digital Crimes Unit & Richard Boscovich
· David Dittrich at University of Washington · Patrick Ford of Pfizer Global Security · Atif Mushtaq, et al. at FireEye · Joe Stewart, Brian Krebs, M86Security,
Messagelabs, and everyone else.
Wednesday, July 27, 2011

Questions?
http://blog.fireeye.com/
Wednesday, July 27, 2011

Bonus Fun Slides!
Let's read us some hex dumps!
Wednesday, July 27, 2011

Wednesday, July 27, 2011

Wednesday, July 27, 2011

Technical Stuff
Wednesday, July 27, 2011

Rustock C&C c. 2007-2008
POST /data.php HTTP/1.0 Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/x-shockwave-flash, application/vnd.ms-excel, application/vnd.ms-powerpoint, application/msword, */* Accept-Language: en User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322) Host: 208.66.194.22 Content-Type: multipart/form-data Content-Encoding: gzip Content-Length: 135 Connection: Close Pragma: no-cache
Wednesday, July 27, 2011

Rustock C&C c. 2009-2010
POST /index.php?topic=3D33.117 HTTP/1.1 Accept: */* Accept-Language: en-us Referer: http://go-thailand-now.com Content-Type: application/x-www-form-urlencoded Content-Encoding: gzip UA-CPU: x86 Accept-Encoding: gzip, deflate User-Agent: Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1) Host: go-thailand-now.com Content-Length: 214 Connection: Keep-Alive Cache-Control: no-cache
Wednesday, July 27, 2011

By Contrast, Spyeye
GET /web/map/gate.php?guid=3Dusers1!AJKLPQ! JU1232&ver=3D10280&stat=ONLINE&plg=ftpbc;socks5;t2p&cpu=0&ccrc=JKLAF24&md5=9012ab902413dcf8gg a89 HTTP/1.0 User-Agent: Microsoft Internet Explorer Host: hahsdhsl.com Pragma: no-cache
Wednesday, July 27, 2011

Wednesday, July 27, 2011

Wednesday, July 27, 2011

Wednesday, July 27, 2011

  5XVWRFN        



Wednesday, July 27, 2011

7

Orrick Herrington & Sutcliffe LLP

701 5th Avenue, Suite 5600

Seattle, Washington 98104-7097

tel: +1-206-839-4300

Wednesday, July 27, 2011

Wednesday, July 27, 2011

Please Remember to Complete Your Feedback Form
Wednesday, July 27, 2011

