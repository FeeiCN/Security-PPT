SESSION ID: CLE-F04
Ransomware
A good driver for backups

Mark Hofman
Chief Technology Officer Shearwater / Phriendly Phishing
@markhofman

#RSAC

#RSAC
A little bit of history

AIDS Trojan 1989
(symetric)

2008 Gpcode (1024
bit)

12-2012 Something (targeted)

02-2014 Cryptode
fense

05-2014 Cryptowa
ll

10-2014 Oz Post

5-2015 Included
in Kits

2006 cryzip, Gpcode( 660 Bit), Others

09-2012 Reveton
(lock only)

/

09-2013 Cryptoloc
ker

04-2014 Crytodef
ense Variant

06-2014 CTBLocker

1-2015 ­ V3

#RSAC
Some earlier attempts
/

#RSAC
Some sad stories
/

#RSAC
Value
~1,000,000 500x
--------------A big number
http://www.fbi.gov/news/stories/2014/june/gameover-zeus-botnet-disrupted/documents/gameover-zeus-and-cryptolocker-poster-pdf
/

#RSAC
How does it work?

#RSAC
Anatomy of an attack (Reminder)

 Reconnaissance  Delivery/Infiltration  Code execution  Network Propagation  Data Exfiltration

NNoottehvienrgytNhienwg nHeedred

/

#RSAC
If you prefer APT Cyber Kill Chain®
 Reconnaissance  Weaponization  Delivery  Code execution  Installation  Command & Control  Actions on Objectives
/

#RSAC
Needed infrastructure
 A computer (anyone's is fine)
 A server (anyone's is fine)
 Tor set up
 Account for deposits  Bitcoin, kashu /

#RSAC
Using Tor to hide
/

#RSAC
It starts here - Delivery
Dear client
Your package has arrived. The tracking# is : 1Z45AR990283682749 and can be used at : http://www.ups.com/tracking/tracking.html The shipping invoice can be downloaded from : http://www.ups.com/tracking/invoices/download.aspx?invoice_id=3483273
Thank you, United Parcel Service *** This i/s an automatically generated email, please do not reply ***

#RSAC
It starts here ­ Pickup for one
/

#RSAC
Fetch Malware (if needed)
BBW (aka Internet)
Internal /

#RSAC
and then ­ Code Execution (almost)
Wed Apr 23 2014 18:52:04,0,macb,r/rrwxrwxrwx,0,0,120976-128-1,"/Users/{VICTIMUSER}/AppData/Local/Temp/CVR8D02.tmp.cvr" Wed Apr 23 2014 18:52:04,134,macb,r/rrwxrwxrwx,0,0,120981-128-1,"/Users/{VICTIMUSER}/AppData/Local/Temp/101634.od"
Wed Apr 23 2014 18:52:06,342960,.ac.,r/rrwxrwxrwx,0,0,121032-1284,"/ProgramData/Adobe/ARM/Acrobat_10.1.8/17525/AcrobatUpdater.exe" Wed Apr 23 2014 18:52:06,959904,.a..,r/rrwxrwxrwx,0,0,121065-1283,"/ProgramData/Adobe/ARM/Acrobat_10.1.8/17525/AdobeARM.exe"
Wed Apr 23 2014 18:52:06,56,...b,d/drwxrwxrwx,0,0,86295-144-5,"/ProgramData/Adobe/ARM/Acrobat_10.1.8/17525" Wed Apr 23 2014 18:52:07,53864,.a.b,-/rrwxrwxrwx,0,0,120795-1284,"/Users/{VICTIMUSER}/AppData/Roaming/Skype/{VICTIMUSER}_{COMPANY}/keyval.db-journal (deleted)"
--snip--
/

#RSAC
Almost...
Wed Apr 23 2014 18:52:11,1080,.ac.,r/rrwxrwxrwx,0,0,2119-128-1,"/Windows/security/templates/policies/tmpgptfl.inf" Wed Apr 23 2014 18:52:11,6144,.a.b,r/rrwxrwxrwx,0,0,24745-1284,"/Users/{VICTIMUSER}/AppData/Roaming/Dropbox/UPDATED_8yxbxq" Wed Apr 23 2014 18:52:11,6144,.a.b,r/rrwxrwxrwx,0,0,3436-128-4,"/Users/{VICTIMUSER}/AppData/Roaming/Dropbox/PENDING_ln1z4y" Wed Apr 23 2014 18:52:11,1408,mac.,r/rrwxrwxrwx,0,0,4015-128-1,"/Windows/security/templates/policies/gpt00000.dom" --snip-- Wed Apr 23 2014 18:53:11,37358015,...b,r/rrwxrwxrwx,0,0,122495-128-3,"/Program Files/Trend Micro/OfficeScan Client/icrc$oth.743"
--snip--
/

#RSAC
Ready...
Wed Apr 23 2014 18:57:52,643,m.c.,r/rrwxrwxrwx,0,0,25199-128-
5,"/Users/{VICTIMUSER}/AppData/LocalLow/Sun/Java/Deployment/deployment.properties"
Wed Apr 23 2014 18:57:59,12861,.a.b,r/rrwxrwxrwx,0,0,92319-1285,"/Users/{VICTIMUSER}/AppData/Local/Temp/jar_cache4093301292953746614.tmp" Wed Apr 23 2014 18:58:00,12861,m...,r/rrwxrwxrwx,0,0,92319-1285,"/Users/{VICTIMUSER}/AppData/Local/Temp/jar_cache4093301292953746614.tmp" Wed Apr 23 2014 18:58:03,137529,macb,r/rrwxrwxrwx,0,0,122810-128-
5,"/Users/{VICTIMUSER}/AppData/Local/Temp/~tmf5784981870582853166.tmp" Wed Apr 23 2014 18:58:07,144,...b,d/dr-xr-xr-x,0,0,122868-144-1,"/Users/{VICTIMUSER}/AppData/Local/Temp/stjcrtu"
Wed Apr 23 2014 18:58:07,0,macb,r/rrwxrwxrwx,0,0,122877-1284,"/Users/{VICTIMUSER}/AppData/Local/Temp/~tmf59727845815307790.tmp"
Wed Apr 23 2014 18:58:09,16896,macb,r/rrwxrwxrwx,0,0,122855-128-3,"/Users/{VICTIMUSER}/AppData/Local/sollenh.dll"
/

#RSAC
Set...
Wed Apr 23 2014 18:58:09,48,macb,d/drwxrwxrwx,0,0,122879-1441,"/Users/{VICTIMUSER}/AppData/Roaming/Microsoft/Crypto/Keys Wed Apr 23 2014 18:58:10,2080,.a.b,r/rrwxrwxrwx,0,0,122927-1284,"/Users/{VICTIMUSER}/AppData/Roaming/Microsoft/Crypto/RSA/S1-5-21-254666440-1725212059-18204428016608/28093c3a55c1788ef10f8a6ac25eff17_55be799d-cb75-4e819059-484e3bdbf27e"
/

GO!
Wed Apr 23 2014 18:58:29,144,mac.,d/dr-xr-xr-x,0,0,122868-144-1,"/Users/{VICTIMUSER}/AppData/Local/Temp/stjcrtu"

#RSAC

Wed Apr 23 2014 18:58:29,56,...b,d/dr-xr-xr-x,0,0,122874-144-5,"/Users/{VICTIMUSER}/AppData/Local/Temp/stjcrtu/sfpbkpv"
Setting up some working directories
Wed Apr 23 2014 18:58:34,56,...b,d/drwxrwxrwx,0,0,123016-144-6,"/Users/{VICTIMUSER}/AppData/Local/Temp/cache" Wed Apr 23 2014 18:58:34,56,...b,d/dr-xr-xr-x,0,0,123313-144-5,"/Users/{VICTIMUSER}/AppData/Local/Temp/cache/7484" Wed Apr 23 2014 18:58:34,56,...b,d/dr-xr-xr-x,0,0,123444-144-5,"/Users/{VICTIMUSER}/AppData/Local/Temp/cache/7468" Wed Apr 23 2014 18:58:34,488,...b,d/dr-xr-xr-x,0,0,123467-144-1,"/Users/{VICTIMUSER}/AppData/Local/Temp/cache/7444" Wed Apr 23 2014 18:58:34,712,...b,d/dr-xr-xr-x,0,0,123469-144-1,"/Users/{VICTIMUSER}/AppData/Local/Temp/cache/7452" Wed Apr 23 2014 18:58:34,56,...b,d/dr-xr-xr-x,0,0,123493-144-5,"/Users/{VICTIMUSER}/AppData/Local/Temp/cache/7476" Wed Apr 23 2014 18:58:34,56,...b,d/dr-xr-xr-x,0,0,123495-144-5,"/Users/{VICTIMUSER}/AppData/Local/Temp/cache/7492" Wed Apr 23 2014 18:58:34,56,...b,d/dr-xr-xr-x,0,0,123501-144-5,"/Users/{VICTIMUSER}/AppData/Local/Temp/cache/7460" Wed Apr 23 2014 18:58:34,56,...b,d/dr-xr-xr-x,0,0,123503-144-5,"/Users/{VICTIMUSER}/AppData/Local/Temp/cache/7500" Wed Apr 23 2014 18:58:34,56,...b,d/dr-xr-xr-x,0,0,123508-144-5,"/Users/{VICTIMUSER}/AppData/Local/Temp/cache/7548"

/

#RSAC
Going...
Wed Apr 23 2014 18:58:29,144,mac.,d/dr-xr-xr-x,0,0,122868-144-1,"/Users/{VICTIMUSER}/AppData/Local/Temp/stjcrtu"
Wed Apr 23 2014 18:58:29,56,...b,d/dr-xr-xr-x,0,0,122874-144-5,"/Users/{VICTIMUSER}/AppData/Local/Temp/stjcrtu/sfpbkpv"
Deleting and replacing
Wed Apr 23 2014 18:58:42,854,m.c.,r/rrwxrwxrwx,0,0,100378-128-4,"/$Recycle.Bin/S-1-5-21-254666440-1725212059-1820442801-6608/$I0BSMNY.tif" Wed Apr 23 2014 18:58:42,854,m.c.,r/rrwxrwxrwx,0,0,101122-128-4,"/$Recycle.Bin/S-1-5-21-254666440-1725212059-1820442801-6608/$I0UNIVL.PNG" Wed Apr 23 2014 18:58:42,854,m.c.,r/rrwxrwxrwx,0,0,103555-128-4,"/$Recycle.Bin/S-1-5-21-254666440-1725212059-1820442801-6608/$I10PECH.pdf" Wed Apr 23 2014 18:58:42,854,m.c.,r/rrwxrwxrwx,0,0,103561-128-4,"/$Recycle.Bin/S-1-5-21-254666440-1725212059-1820442801-6608/$I03M4QT.jpg" Wed Apr 23 2014 18:58:42,854,m.c.,r/rrwxrwxrwx,0,0,105290-128-4,"/$Recycle.Bin/S-1-5-21-254666440-1725212059-1820442801-6608/$I00U31E.pdf" Wed Apr 23 2014 18:58:42,854,m.c.,r/rrwxrwxrwx,0,0,107665-128-4,"/$Recycle.Bin/S-1-5-21-254666440-1725212059-1820442801-6608/$I0YZL1S.pdf" Wed Apr 23 2014 18:58:42,854,m.c.,r/rrwxrwxrwx,0,0,109246-128-5,"/$Recycle.Bin/S-1-5-21-254666440-1725212059-1820442801-6608/$I0U6IOY.docx" Wed Apr 23 2014 18:58:42,854,m.c.,r/rrwxrwxrwx,0,0,110317-128-4,"/$Recycle.Bin/S-1-5-21-254666440-1725212059-1820442801-6608/$I17OQ7Z.pdf" Wed Apr 23 2014 18:58:42,854,m.c.,r/rrwxrwxrwx,0,0,110577-128-4,"/$Recycle.Bin/S-1-5-21-254666440-1725212059-1820442801-6608/$I0SQE7R.JPG" Wed Apr 23 2014 18:58:42,854,m.c.,r/rrwxrwxrwx,0,0,110581-128-4,"/$Recycle.Bin/S-1-5-21-254666440-1725212059-1820442801-6608/$I0J3VWG.JPG" Wed Apr 23 2014 18:58:42,854,m.c.,r/rrwxrwxrwx,0,0,114186-128-4,"/$Recycle.Bin/S-1-5-21-254666440-1725212059-1820442801-6608/$I0K7G6U.pdf" Wed Apr 23 2014 18:58:42,854,m.c.,r/rrwxrwxrwx,0,0,121162-128-4,"/$Recycle.Bin/S-1-5-21-254666440-1725212059-1820442801-6608/$I13206U.pdf
/

#RSAC
Going...
Wed Apr 23 2014 18:58:29,144,mac.,d/dr-xr-xr-x,0,0,122868-144-1,"/Users/{VICTIMUSER}/AppData/Local/Temp/stjcrtu"
Wed Apr 23 2014 18:58:29,56,...b,d/dr-xr-xr-x,0,0,122874-144-5,"/Users/{VICTIMUSER}/AppData/Local/Temp/stjcrtu/sfpbkpv"
Leaving Instructions
Wed Apr 23 2014 18:58:42,1267,macb,r/rrwxrwxrwx,0,0,123701-128-4,"/ProgramData/Adobe/SLStore/HOW_DECRYPT.TXT" Wed Apr 23 2014 18:58:42,2785,macb,r/rrwxrwxrwx,0,0,123728-128-4,"/ProgramData/Adobe/SLStore/HOW_DECRYPT.HTML" Wed Apr 23 2014 18:58:42,135,macb,r/rrwxrwxrwx,0,0,123733-128-1,"/ProgramData/Adobe/SLStore/HOW_DECRYPT.URL" Wed Apr 23 2014 18:58:42,1267,macb,r/rrwxrwxrwx,0,0,123734-128-4,"/ProgramData/Adobe/HOW_DECRYPT.TXT" Wed Apr 23 2014 18:58:42,2785,macb,r/rrwxrwxrwx,0,0,123742-128-4,"/ProgramData/Adobe/HOW_DECRYPT.HTML" Wed Apr 23 2014 18:58:42,135,macb,r/rrwxrwxrwx,0,0,123801-128-1,"/ProgramData/Adobe/HOW_DECRYPT.URL"
/

#RSAC
Still going
Wed Apr 23 2014 19:33:40,3946070,m.c.,r/rrwxrwxrwx,0,0,121842-1281,"/Users/{VICTIMUSER}/Desktop/{VICTIMUSER}/HEN MADNESS/Beyoncé - Crazy In Love ft. JAY Z.mp3"
And .......Done
Wed Apr 23 2014 21:00:09,541526,..c.,r/rrwxrwxrwx,0,0,127646-1284,"/Users/{VICTIMUSER}/Desktop/{COMPANY} Group Chart (External)(apr 2014).ppt" Wed Apr 23 2014 21:00:09,1267,..c.,r/rrwxrwxrwx,0,0,135836-1284,"/Users/{VICTIMUSER}/Desktop/HOW_DECRYPT.TXT"
/

#RSAC
End Result
/

#RSAC
Ransomware at work
/

#RSAC
What now?

#RSAC
Recovery options

 Recycle bin?

X Sometimes 

 Unallocated space?  Backups?

X Sometimes  

 Prayer and/or Magic?

X

/

#RSAC
Recovery options

 Pay?

But depending on where



you are you may be committing a crime

/

#RSAC
Recovery
 Backups
 Backup all locations  Cloud, network, local, everything
 Test recovery
/

Educate
 Teach users not to click

#RSAC
Legit or ??

/

#RSAC
Next steps
 Next week  Check backup and recovery processes
 Make sure you can recover  Check AV on email, web and desktop
 Are they updating? Have you covered TLS?
 Next few months  Educate users (most are delivered through phishing)
 Even if only 50% "get it" still better off  Improve monitoring on outbound connections (C2C)
/ 29

Questions? #RSAC
/

