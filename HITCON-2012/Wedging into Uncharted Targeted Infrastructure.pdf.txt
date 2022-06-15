Technique to Targeted
Brandon Dixon
Verisign Confidential and Proprietary

Agenda
2
· Discovery · Reversing · Educating · Recreating · Targeted Sightings · Predictions
Verisign Confidential and Proprietary

DISCOVERY
3
· Notified at the start of June about a new technique · XDP Sample viewed on June 15th, 2012
Verisign Confidential and Proprietary

XDP Facts
4
· Basic specification
· ~10 pages ­ read in a day
· Makes PDF 100% XML
· Easy to send to web services or other processes looking only for XML
· Used within XFA forms inside PDF documents
· XFA has been abused for sometime now
· Base64 encoding only within chunks
· Other methods were not detailed or mentioned, but Adobe has magic
· Can't rename XDP file to PDF and have it run
·
Verisign Confidential and Proprietary

Malware Behavior
5
· Decodes PDF file into Temp folder · Exploits CVE-2011-0611 (flash exploit)
· 2916a534a2e5a3969ddb2b5f323497ca
· Adobe process writes "iexplorer.exe" to Temp folder · Executes "iexplorer.exe" · Carves out resource details (XOR 73) · Drops "ieproxy.exe"
· C:\WINDOWS\system32\ieproxy.exe
· C2
· www.dhcpserver.ns01.us => 113.10.246.30 · www.dnsserver.ns01.us => 113.10.246.30
Verisign Confidential and Proprietary

Suspicious PDF Objects
6
Verisign Confidential and Proprietary

Older JS ­ Been here before
7
Verisign Confidential and Proprietary

STUB Decode
8
Verisign Confidential and Proprietary

Running the File
9
Verisign Confidential and Proprietary

Network Callout
10
Verisign Confidential and Proprietary

WHOIS the C2?
11
Verisign Confidential and Proprietary

EDUCATING
12
· The source
· http://partners.adobe.com/public/developer/en/xml/xdp_2.0.pdf
· Questions to answer
· Why does this exist? · More abuse cases? · Can more be done?
· Other encodings · Encryption · Namespace variables to seed PDF
· Build new documents for testing
Verisign Confidential and Proprietary

RECREATING
13
Verisign Confidential and Proprietary

BASE64 Conversion
14
Verisign Confidential and Proprietary

Generated Document
15
Verisign Confidential and Proprietary

AV Failure
16
Verisign Confidential and Proprietary

Exposed to the Public
17
Verisign Confidential and Proprietary

Recent Potential Targeted Sightings
18
· Submitted through PDF X-RAY (06/28/2012)
· SECRET SERVICE TRAINING.xdp
· Efc68b19d767089afc38446c48c918af · Exploits CVE-2011-2462 (U3D)
· Military Planning.xdp
· Cd09e1624239555fc580267d60034e12 · Exploits CVE-2010-3654 (cooltype)
· Malware
· Different process names, but same functionality · Spawns CMD off main process, executes tasklist, saves · Loads DLL and runs from main process · Main process is killed leaving the DLL to run
Verisign Confidential and Proprietary

SECRET SERVICE TRAINING.xdp
19
Verisign Confidential and Proprietary

Original 2462 JS
20
Verisign Confidential and Proprietary

Military Planning.xdp
21
Verisign Confidential and Proprietary

Older JS
22
Verisign Confidential and Proprietary

TRAFFIC SLIDE
23
Verisign Confidential and Proprietary

C2 Data
24
· webserver.freetcp.com · www.dnswatch.info · www.microsoft.wikaba.com · www.microsoft.dynssl.com · www.microsoft.dhcp.biz
· 113.10.246.30 (remember this?) · 82.96.118.210
· All changeip == useless
Verisign Confidential and Proprietary

Requests
25
Verisign Confidential and Proprietary

Requests
26
Verisign Confidential and Proprietary

Requests
27
Verisign Confidential and Proprietary

Requests
28
Verisign Confidential and Proprietary

Requests
29
Verisign Confidential and Proprietary

Requests
30
Verisign Confidential and Proprietary

Timeline
31
· 06/01/2012 ­ Heard of new technique being used · 06/15/2012 ­ First sample viewed and reversed · 06/15/2012 ­ Release testing samples · 06/28/2012 ­ Secret service document seen · 06/28/2012 ­ Military training document seen
Verisign Confidential and Proprietary

Remember PDFWP?
32
Verisign Confidential and Proprietary

REUSE, TESTING or LAME
33
· Malicious PDF documents used in the attacks haven't been viewed by the public, but are old.
· File creations are back from 2011 with techniques matching the timeframe
· Thoughts on this?
· We know attacker reuse their exploit code · Why improve when your techniques are successful · Someone is testing XDP out and using older exploits · Generator is more public
Verisign Confidential and Proprietary

Conclusions
34
· Some AV see this as no big deal
· http://nakedsecurity.sophos.com/2012/06/22/encodingmalicious-pdfs-as-xdp-files-to-bypass-anti-virus-no-need-topanic/
· Detection on XDP files as of July 1st, 2012 == less than 5 · Trivial way to bypass mail scanners and other systems
used to analyze attachments · Getting used by attackers and will continue to be used
· Waiting on an 0day to execute
Verisign Confidential and Proprietary

Thank You
© 2012 VeriSign, Inc. All rights reserved. Verisign, the Verisign logo, iDefense and other trademarks, service marks, and designs are registered or unregistered trademarks of VeriSign, Inc. and its subsidiaries in the United States and in foreign countries. All trademarks are properties of their respective owners. All materials are intended for iDefense customers and personnel only. The reproduction and distribution of this material is forbidden without express written permission from iDefense. The opinions, statements, and assessments in this report are solely those of the individual author(s) and do not constitute legal advice, nor do they necessarily reflect the views of VeriSign, Inc., its subsidiaries, or affiliates. Verisign Confidential and Proprietary

