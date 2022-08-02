All Your Metadatas Are Belong To Me: Reverse Engineering Emails on an Enterprise Level
Ronnie Tokazowski Senior Researcher
PhishMe, Inc.
About Me
~ # cat intro.py #!/usr/bin/env python a = [`x41x41x90', '@iHeartMalware'] h = [`RE', `crypto', `hacking stuff'] c = ['OSCP', `GREM'] p = [`APT / cybercrime trolling'] d = [`Project Dyre']
2

What We Will Cover
 Extract metadata / reverse engineer an email  Saving all the things (NSA style)  Yara all the things  Demos!  Code releases  Closing
3
Reverse Engineering
 Take things apart  Break things  Gather findings  Report findings
4

Information Gathered
 Spices used for a particular sauce
 Domains  IP addresses  File metadata (author, date
created)  Encoding algorithms  PE timestamps
5
Use Cases for Reported Data
 Searching for traffic to C2 servers  Blocking domains found in malware  Further understanding of a cryptographic algorithm  Network intelligence (APT1)
6

Enough Theoretical...Let's Get to It!
7
Reverse Engineering Goals
 Obtain metadata about a given email chunk
 Hash everything! (you will want it later...)  Deep-dive and find bad stuff  Alerting or other event correlation?  Good / actionable intelligence
8

9
Reverse Engineering Toolkit: Yara
Tool used for malware classification. Has a HUGE potential for other uses. rule PM_Paypal_Spam { strings:
$a1 = "46.165.252.13" $a2 = "@peypal.com" nocase condition: any of them } Yara can be downloaded from: http://plusvic.github.io/yara/
10

Reverse Engineering Toolkit: Yara (cont.)
 You can see the sig trip
11
Cat Pipe ./stdin
 Scanning an email with yara.exe is cool, but there are limitations.
- Nothing decoded - One layer - Quotable printable text
breaks...EVERYTHING - style=3D'margin:=0in;margin-
bottom:.0001pt'><b><span style=3D'
12

Python ­ Find all the Things
def parse_the_email(my_email): msg = email.message_from_string(my_email) for part in msg.walk(): awesome_sauce.append(part.get_payload(decode=Tru
e))
13
Python ­ Find all the Things
 While it's still in memory, let's grab metadata, too
14

Python ­ Metadata all the Things
 Since you can't find out who someone is from metadata...  Shredder.py pulls different fields from the decoded text.
To, from, subject, etc
if part["to"] != None: my_to.append(part["to"]) if part["bcc"] != None: my_to.append(part["bcc"]) if part["cc"] != None: my_to.append(part["cc"]) if part["from"] != None: my_from.append(part["from"]) ...
15
Python ­ Yara all the Things
 While we're at it...just Yara all the things rules = yara.compile("yara_headers.yar", includes=True) for each in awesome_sauce:
matches = rules.match(data=each, callback=mycallback)
16

Hash all the Things
 Still looping awesome_sauce here tMd5 = hashlib.md5(each).hexdigest() tSha256 = hashlib.sha256(each).hexdigest() tSsdeep = ssdeep.hash(each)
17
Regex All The Things
 Why not iterate through awesome_sauce to pull out links? def extract_my_links(data): links = re.findall('http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?: %[0-9a-fA-F][0-9a-fA-F]))+', data)
18

Research all the Things
 http://www.dshield.org/ipinfo.html?ip=<parsed domain/IP>  https://www.robtex.com/dns/<parsed domain>.html  http://network-tools.com/default.asp?prog=express&host=<parsed
domain/IP>  Use VirusTotal's API
19
The Database
 Unique ID generated at runtime. Schema:  ID + hashes  ID + URL  ID + Metadata (to, from, subject, etc)  ID + Yara hits
20

Sqlite3 Schema
 sqlite> .schema  CREATE TABLE email_meta(key ..., date ..., e_to ..., e_from ...,
e_subject ..., attachment ..., reporting_mechanism ..., email ...);  CREATE TABLE hash_db(key ..., md5 ..., sha256 ..., ssdeep ...);  CREATE TABLE urls(key ..., url ..., cleaned_url ...);  CREATE TABLE yara_hits(key ..., hit ...);
21
Why This Schema?
 All pieces go back to the unique key. Use cases:  "Have I ever seen this MD5 sent via email"  "Have I ever seen this URL in an email"  "Have I ever seen this TLD of a URL in my email"  "What email tripped Yara rule X"  "Who else tripped that email"  ...And the list goes on
22

Throughput
$ time cat order\ #247-09448293045913.eml | ./shredder.py no real 0m0.096s user 0m0.044s sys 0m0.048s Translation: less than a .1 second to read the email, scan with Yara, hash everything, metadata everything, be able to research everything, correlate everything...

Source: www.desdehollywood.com
23

Other Use Cases
 Scan all email from an enterprise (Postfix + catchall)  Throw metadata into a database  Pivot the data  Ask questions about the data  Love the data  ...Pretty much an email IDS
24

Demo
25
To Recap, What do we Have?
 Parser for email  Scanner of emails for custom signatures and content  Hashing of everything (sha256, SSDeep, MD5)  Regex of all email links  All metadata about an email (sender, subject, etc)  Sanitized links  Ability to research the links
26

Got Code
https://github.com/x41x41x90/pm_shredder
27
Questions?
phishme.com/blog phishme.com/resources/videos phishme.com
28

Thank You!
Twitter: @iHeartMalware Work: ronnie.tokazowski@phishme.com Gmail: x41x41x90@gmail.com
29

