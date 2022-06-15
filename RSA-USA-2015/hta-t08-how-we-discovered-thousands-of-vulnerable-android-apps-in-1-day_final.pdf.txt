SESSION ID: HTA-T08
How We Discovered Thousands of Vulnerable Android Apps in 1 Day

Joji Montelibano
Vulnerability Analysis Technical Manager CERT @certcc

Will Dormann
Vulnerability Analyst CERT @wdormann

#RSAC

#RSAC
Copyright
Copyright 2015 Carnegie Mellon University This material is based upon work funded and supported by the Department of Defense under Contract No. FA8721-05-C-0003 with Carnegie Mellon University for the operation of the Software Engineering Institute, a federally funded research and development center. Any opinions, findings and conclusions or recommendations expressed in this material are those of the author(s) and do not necessarily reflect the views of the United States Department of Defense. References herein to any specific commercial product, process, or service by trade name, trade mark, manufacturer, or otherwise, does not necessarily constitute or imply its endorsement, recommendation, or favoring by Carnegie Mellon University or its Software Engineering Institute. NO WARRANTY. THIS CARNEGIE MELLON UNIVERSITY AND SOFTWARE ENGINEERING INSTITUTE MATERIAL IS FURNISHED ON AN "AS-IS" BASIS. CARNEGIE MELLON UNIVERSITY MAKES NO WARRANTIES OF ANY KIND, EITHER EXPRESSED OR IMPLIED, AS TO ANY MATTER INCLUDING, BUT NOT LIMITED TO, WARRANTY OF FITNESS FOR PURPOSE OR MERCHANTABILITY, EXCLUSIVITY, OR RESULTS OBTAINED FROM USE OF THE MATERIAL. CARNEGIE MELLON UNIVERSITY DOES NOT MAKE ANY WARRANTY OF ANY KIND WITH RESPECT TO FREEDOM FROM PATENT, TRADEMARK, OR COPYRIGHT INFRINGEMENT. This material has been approved for public release and unlimited distribution. This material may be reproduced in its entirety, without modification, and freely distributed in written or electronic form without requesting formal permission. Permission is required for any other use. Requests for permission should be directed to the Software Engineering Institute at permission@sei.cmu.edu. CERT® and CERT Coordination Center® are registered marks of Carnegie Mellon University. DM-0002136
2

#RSAC
What is CERT?
u Center of Internet security expertise u Established in 1988 by the US Department of Defense on
the heels of the Morris worm that created havoc on the ARPANET, the precursor to what is the Internet today u Located in the Software Engineering Institute (SEI)
u Federally Funded Research & Development Center (FFRDC) u Operated by Carnegie Mellon University (Pittsburgh, Pennsylvania)
3

#RSAC
CERT Vulnerability Analysis
Mission:  Make  So,ware  Safer  

Vulnerability     Coordina8on  

Vulnerability     Discovery  
4

Vulnerability Coordination

#RSAC

Is easy?

#RSAC
ActiveX
u Dranzer + HijackThis logs + Automation = Lots of Vulnerabilities u Vulnerability Detection in ActiveX Controls through Automated
Fuzz Testing (Jan 2008) http://resources.sei.cmu.edu/library/asset-view.cfm?assetid=53466

#RSAC
ActiveX
u Thousands of vulnerabilities discovered. u Manual coordination of important/popular ones. u Many ignored.

#RSAC
ffmpeg
u ffmpeg + BFF = lots of uniquely-crashing testcases

#RSAC
ffmpeg response

Background

#RSAC

Where am I and how did I get here?

#RSAC
History
u Download.com
h=p://www.cert.org/blogs/certcc/post.cfm?EntryID=199     

#RSAC
The internet is horrible

#RSAC
Identical installers
u Installers from Download.com are the same:
u 5a275a569dce6e2f2f0284d82d31310b *cbsidlm-cbsi213Enable__Disable_Registry_Tool-SEO-75812481.exe
u 5a275a569dce6e2f2f0284d82d31310b *cbsidlm-cbsi213KMPlayer-SEO-10659939.exe

#RSAC
Software retrieval
GET /rest/v1.0/softwareProductLink?productSetId=10659939&partTag=dlm&path=SEO&build=213 HTTP/1.1 Host: api.cnet.com
HTTP/1.1 200 OK
<?xml version="1.0" encoding="utf-8"?>
<CNETResponse xmlns="http://api.cnet.com/restApi/v1.0/ns" xmlns:xlink="http://www.w3.org/1999/ xlink" version="1.0"><SoftwareProductLink id="13819308" setId="10659939" appVers="1.0"><Name><! [CDATA[KMPlayer - 3.9.1.129]]></Name><ProductName><![CDATA[KMPlayer]]></ ProductName><ProductVersion><![CDATA[3.9.1.129]]></ProductVersion><FileName><! [CDATA[KMPlayer_3.9.1.129.exe]]></FileName><FileSize><![CDATA[35872504]]></ FileSize><FileMd5Checksum><![CDATA[5d0e7d17fc4ef0802a9332c83075047c]]></ FileMd5Checksum><PublishDate><![CDATA[2014-10-06]]></PublishDate><CategoryId><![CDATA[13632]]></ CategoryId><Category><![CDATA[Downloads^Video Software^Video Players]]></Category><License><! [CDATA[Free]]></License><DownloadLink>http://software-files-a.cnet.com/s/software/13/81/93/08/ KMPlayer_3.9.1.129.exe?token=1413054436_d56f7814cd5af230f782dd28550e185a</ DownloadLink><TrackedDownloadLink>http://dw.cbsi.com/redir? edId=1174&amp;siteId=4&amp;lop=feed.dl&amp;ontId=13632&amp;tag=tdw_dlman&amp;pid=13819308&amp;dest Url=http%3A%2F%2Fsoftware-files-a.cnet.com%2Fs%2Fsoftware %2F13%2F81%2F93%2F08%2FKMPlayer_3.9.1.129.exe%3Ftoken %3D1413054436_2defb65a1350a3b035964c18f30fb06e%26fileName%3DKMPlayer_3.9.1.129.exe

#RSAC
Just MITM it!
u Set up a proxy to modify content as it's transferred u Problem: Installer isn't proxy-aware!

Solution: CERT Tapioca
u Transparent Proxy Capture Appliance
u UbuFuzz + iptables + mitmproxy

#RSAC
Bypass MITM Restart Capture

#RSAC
CERT Tapioca
h=p://www.cert.org/vulnerability--analysis/tools/cert--tapioca.cfm     

How it works

I  can  see  everything  if  the   client  doesn't  validate  SSL  

#RSAC

Invalid  SSL   handshake  

Valid  SSL   handshake  

18

#RSAC
Tapioca architecture

#RSAC
Tapioca architecture

#RSAC
Investigating Android
u Use a phone and a wireless access point

#RSAC
Improvement #1
u Virtualization and Automation
· google-play-crawler · VMware · Android SDK · AVD · Monkeyrunner · Monkey

u Now I can test when I sleep!

h=ps://github.com/Akdeniz/google--play--crawler   h=p://developer.android.com/tools/help/monkeyrunner_concepts.html   h=p://developer.android.com/tools/help/monkey.html   h=p://www.cert.org/blogs/certcc/post.cfm?EntryID=204     

#RSAC
Automated Android

#RSAC
CERT Tapioca

#RSAC
Improvement #2
u Parallelization
u Rather than 1 Android VM and 1 Tapioca VM, what about 20 of each?
u Now I can test 20x faster!

#RSAC
Android emulation annoyance
u ARM Android emulation is slow. Very slow.
u x86 Android emulation is fast (~15x faster), IFF you have a KVMenabled Linux kernel.

#RSAC
Improvement #3
u Solution: x86 Android in a VM (not an emulator): u http://www.android-x86.org/

#RSAC
Improvement #4
u Let's make 20 of them!

#RSAC
Androidx86 SSL Test Architecture

ADB  Net  

MITM  Net  

Orchestrator  

Androidx86  

CERT   Tapioca  

Internet  

29

#RSAC
Automation of 20 VMs

Android SSL Coordination

#RSAC

This one's optimistic

#RSAC
Prior SSL Investigations
u Why Eve and Mallory Love Android: An Analysis of Android SSL (In)Security
u October 18, 2012 - Sascha Fahl, Marian Harbach, Thomas Muders, Matthew Smith, Lars Baumgärtner, Bernd Freisleben
u http://android-ssl.org/files/p50-fahl.pdf
u "To evaluate the state of SSL use in Android apps, we downloaded 13,500 popular free apps from Google's Play Market and studied their properties with respect to the usage of SSL."
u No app authors contacted?

#RSAC
Prior SSL Investigations
u SSL Vulnerabilities: Who listens when Android applications talk? u August 20, 2014 - Adrian Mettler, Vishwanath Raman, Yulong
Zhang u https://www.fireeye.com/blog/threat-research/2014/08/ssl-
vulnerabilities-who-listens-when-android-applications-talk.html u "We reviewed the 1,000 most-downloaded free applications in the
Google Play store as of July 17, 2014." u No app authors contacted?

#RSAC
Prior SSL Investigations

Notify Affected Authors
Hello,
This is Will Dormann with the CERT Coordination Center, which is part of Carnegie Mellon University. <http://www.cert.org/about>
We've recently been evaluating with CERT Tapioca <http://www.cert.org/blogs/certcc/post.cfm?EntryID=204> the use of SSL by Android apps. Through automated testing, we are logging apps that cause traffic to be sent or received over an HTTPS connection that has an invalid SSL certificate chain.
The following application has demonstrated this incorrect behavior: APP_ID https://play.google.com/store/apps/details?id=APP_ID
Due to the sheer volume of affected applications, we are currently unable to manually inspect every affected application. However, we are sending notifications to the application authors for further
Investigation. <SNIP>

#RSAC

#RSAC
Publish the offending apps
h=ps://docs.google.com/spreadsheets/d/1t5GXwjw82SyunALVJb2w0zi3FoLRIkfGPc7AMjRF0r4/edit?usp=sharing     

#RSAC
Listed Applications
uAn app is listed in the spreadsheet when it fails dynamic analysis with CERT Tapioca.
uIf an app isn't listed:
· It was not tested · Automation did not trigger HTTPS network traffic · It is not vulnerable

Issues Encountered

#RSAC

So you've got a million APK files?

#RSAC
Windows CMD.EXE

#RSAC
Windows CMD.EXE

#RSAC
Windows CMD.EXE
THANKS MICROS~1 !!!1!

#RSAC
8.3 Filenames
"Note:  Although  disabling  8.3  file  name  crea8on  increases  file  performance  under  Windows,  some  applica8ons  (16-- bit,  32--bit,  or  64--bit)  may  not  be  able  to  find  files  and  directories  that  have  long  file  names."  
h=p://blogs.technet.com/b/josebda/archive/2012/11/13/windows--server--2012--file--server--8p--disable--8--3--naming--and--strip--those--short--names--too.aspx   h=p://support.microso,.com/kb/121007        

#RSAC
Busybox
u recursive_action (and thus find) slow due to [l]stat()
u Rich Felker Tue, 28 May 2013 21:13:18 -0700
u Conceptually, the find utility need not perform lstat on each filename unless it's needed for matching criteria. However, find is implemented based on libbb's recursive_action, which always performs stat or lstat. This makes busybox's find excruciatingly slow compared to GNU find.

#RSAC
Solution
u Real fileserver with ZFS.

CVE Fun

#RSAC

You keep using that word. I do not think

it means what you think it means.

#RSAC
How to track Vulnerabilities?
u CVE is the de facto standard for tracking vulnerabilities in applications. u MITRE, who operates CVE, does not attempt to track all applications with CVE.

#RSAC
What Makes an App Important?
5--10  million  installs   Insecurely  retrieves  ads  
No  CVE  assigned  

#RSAC
What Makes an App Important?
1--5  installs   Insecurely  uses  paypal  
No  CVE  assigned  

#RSAC
What Makes an App Important?
5--10  million  installs   Sends  user/password  
No  CVE  assigned  

#RSAC
CVE10K

#RSAC
CVE Assignment
u Are Android applications CVE-worthy?

#RSAC
CVE Assignment
u Are Android applications CVE-worthy?

u No*

*  Maybe,  but  stop  assigning  CVEs  

What Makes an Android

#RSAC

Developer?

A pulse

#RSAC
AppsGeyser

#RSAC
AppsGeyser

#RSAC
VulsGeyser

#RSAC
AppsGeyser Fixed

#RSAC
AppsGeyser Apps

#RSAC
Metova Credit Union Apps

Apps That Exist

#RSAC

And also fail to validate SSL

#RSAC
Mobile Network Signal Booster

#RSAC
Mobile Network Signal Booster

#RSAC
Cartoon Wars

#RSAC
Cartoon Wars

#RSAC
Cartoon Wars

#RSAC
Brightest LED Flashlight

Selected Developer

#RSAC

Responses

Still optimistic?

#RSAC
Application author response
Hello,
Thank you for your e-mail! The app that you have in mind is not created or related to us or [REDACTED]. We recently found out about it and we are looking for a way to take it down as it's made by a person trying to exploit [REDACTED]'s name. Is there a way to report this app and take it down? We would really appreciate help in this.

#RSAC
Application author response
I understand, i was consuming a service the generates real random numbers based on measurements of quantum phenomena.
So i just didnt cared about the ssl config on the http request since it was a very trivial.

#RSAC
Application author response
I don't know what the hell you're talking about, my application does not include any SSL connection !!!

#RSAC
Application author response
Remove

#RSAC
Application author response
What????

#RSAC
Application author response
I want to thank you very much fix for SSL, but Google Play Store my suspends, I want to fix bugs, I want to get back my application, please help

#RSAC
Application author response
Mr. Will
Thanks alot for your analysis. We checked everything in the app. There is not even a single bug. Your mail is type a type of spam which is of no use. If you really have something then work practically.

#RSAC
Application author response
Hi CERT Coordination Center,
Our application is an authentication application and has among other features a backend where there is a Risk Engine present, the communication taking place when connecting with a faulty certificate is to merly a notification mechanism to tell the server the communication channel is beeing tampered with. As such, it is a feature that our application to continue to communicate with the backend even even thought the channel is compromised by usage of a faulty certificate.

#RSAC
Application author response
Well I'm not sure how a SSL Vulnerability can be present in an application when I don't take any payments through the application for any product. Looks like you have much more testing to do. Can you please stop sending me emails.
Thanks
--

#RSAC
Application author response
take me off your list

#RSAC
Application author response
Please contact the NSA.gov for this case because I am not the owner of this site Thank you

Public Reception

#RSAC

Fighting the battle of who could care

less

#RSAC
Reddit

#RSAC
Reddit

#RSAC
forums.makingmoneywithandroid.com

#RSAC
Twitterverse #1 (warmup)

#RSAC
Four Months Later
SDll  Vulnerable  

#RSAC
Twitterverse #2 (Getting interesting)

#RSAC
Reality-distortion field
h=p://www.computerworld.com.au/ar8cle/554457/coles--responds--credit--card--app--vulnerability--reports/    

#RSAC
Let's go nuclear

#RSAC
Vendor Reaction

Not Everything is Bad

#RSAC

At least one

#RSAC
Somebody Cares!
Hello.
Thank you very much for the reply. I've confirmed that our record has been updated in the spreadsheet. And let me say thank you again for your hard efforts to investigate and report problems in large number of Android apps. Without your help, we'd have overlooked the issue much longer.
Best Regards,

Statistics

#RSAC

Numbers don't lie?

The Numbers
Free  Apps  Tested   Vulnerable  Apps  Discovered   Vulnerable  App  Authors  No8fied   Email  responses   Email  responses  with  fix  details  

Total   1,000,500  
23,667   23,301  
1,593   25  

#RSAC
Percent   Most?   2.4%   98.5%   6.8%   0.1%  

"There  are  now  1  million  apps  in  the  Google  Play  store."   July  24,  2013  
h=p://mashable.com/2013/07/24/google--play--1--million/     

Where do we go from here?

#RSAC

Forward

#RSAC
Further Work
· Full SSL visibility (Root CA cert installed) · Improved automation · Other Platforms (IOS, Blackberry, Windows Phone) · True Scalability

#RSAC
Conclusions
· Vulnerability coordination doesn't scale easily · CVE doesn't scale easily · There are plenty of horrible Android applications · Application authors aren't very responsive

#RSAC
Apply What You Have Learned Today
u Next week you should:
u Download CERT Tapioca u Test using CERT Tapioca
u In the first three months following this presentation you should:
u Use Tapioca to test applications used in your organization for SSL validation failures u Non-free applications u Non-Android applications u Report failures to CERT
96

#RSAC
Appendix

#RSAC
Android SSL Testing Architecture
*  There  will  be

