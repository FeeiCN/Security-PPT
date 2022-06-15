Regular Expressions for Incident Response
Sql_Injection=*
Daniel Nutting, Security Operations Manager Bryan Turner, IT Security Analyst Publix Super Markets
July 2018 | Version 2.0

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.
BOTS Tie Ins: Presentations and Hands Ons
· Hunting the Known Unknowns: Office 365 and Microsoft Azure. Kovar and Brant. Tuesday 4:45-5:30 PM
· Splunking the Endpoint IV: A New Hope. Brodsky. Wednesday 3:15-5:15 PM
· Hands On with ES, Phantom, and BOTS Data. Kovar, Smit, Brodsky, Stoner, Valites, Lee. Tuesday 2:15-4:15 PM
· AWS Security Hands-On. Valites and Lee. Wednesday 12:452:45 PM

© 2018 SPLUNK INC.
Regular Expressions
Introduction

Previous .conf Presentations
 2016 ­ Gabriel Vassuer Reg(ular expressions?|ex(p|es)?)
 2016 ­ Cary Petterborg Beyond Regular Expressions
 2017 ­ Michael Simko Regex in your SPL · GREAT INTRODUCTION!
 RegexOne.com

© 2018 SPLUNK INC.

Agenda
 Prerequisites  RegEx Philosophy  Develop RegEx* Faster  Common Use Cases  Work Around Parsing Errors  SQL Injection example  XSS example  Sysmon example

© 2018 SPLUNK INC.

Pre-requisites
Comfort with Regex
 \d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}
IP Address
 (?<email>.+@.+)\s
Field extraction
 \s\S\d\D+\w\W?.*
 regex|rex vs r(?:eg)?ex

© 2018 SPLUNK INC.

Shift some Paradigms!

© 2018 SPLUNK INC.

 Post Alert -> Incident Response & Investigations

 Speed Over Precision · Easy to understand is better than plug and play

 Accuracy Over Perfection
· False positives are okay · False negatives are not okay

© 2018 SPLUNK INC.
Validating RFC822 Email Addresses
From Stack Overflow:
(?:(?:\r\n)?[ \t])*(?:(?:(?:[^()<>@,;:\\".\[\] \000-\031]+(?:(?:(?:\r\n)?[ \t])+|\Z|(?=[\["()<>@,;:\\".\[\]]))|"(?:[^\"\r\\]|\\.|(?:(?:\r\n)?[ \t]))*"(?:(?:\r\n)?[ \t])*)(?:\.(?:(?:\r\n)?[ \t])*(?:[^()<>@,;:\\".\[\] \000-\031]+(?:(?:(?:\r\n)?[ \t])+|\Z|(?=[\["()<>@,;:\\".\[\]]))|"(?:[^\"\r\\]|\\.|(?:(?:\r\n)?[ \t]))*"(?:(?:\r\n)?[ \t])*))*@(?:(?:\r\n)?[ \t])*(?:[^()<>@,;:\\".\[\] \000-\031]+(?:(?:(?:\r\n)?[ \t])+|\Z|(?=[\["()<>@,;:\\".\[\]]))|\[([^\[\]\r\\]|\\.)*\](?:(?:\r\n)?[ \t])*)(?:\.(?:(?:\r\n)?[ \t])*(?:[^()<>@,;:\\".\[\] \000-\031]+(?:(?:(?:\r\n)?[ \t])+|\Z|(?=[\["()<>@,;:\\".\[\]]))|\[([^\[\]\r\\]|\\.)*\](?:(?:\r\n)?[ \t])*))*|(?:[^()<>@,;:\\".\[\] \000-\031]+(?:(?:(?:\r\n)?[ \t])+|\Z|(?=[\["()<>@,;:\\".\[\]]))|"(?:[^\"\r\\]|\\.|(?:(?:\r\n)?[ \t]))*"(?:(?:\r\n)?[ \t])*)*\<(?:(?:\r\n)?[ \t])*(?:@(?:[^()<>@,;:\\".\[\] \000-\031]+(?:(?:(?:\r\n)?[ \t])+|\Z|(?=[\["()<>@,;:\\".\[\]]))|\[([^\[\]\r\\]|\\.)*\](?:(?:\r\n)?[ \t])*)(?:\.(?:(?:\r\n)?[ \t])*(?:[^()<>@,;:\\".\[\] \000-\031]+(?:(?:(?:\r\n)?[ \t])+|\Z|(?=[\["()<>@,;:\\".\[\]]))|\[([^\[\]\r\\]|\\.)*\](?:(?:\r\n)?[ \t])*))*(?:,@(?:(?:\r\n)?[ \t])*(?:[^()<>@,;:\\".\[\] \000-\031]+(?:(?:(?:\r\n)?[ \t])+|\Z|(?=[\["()<>@,;:\\".\[\]]))|\[([^\
 Roughly 20% of actual regex

Keep It Simple
Bigger is Not Always Better

© 2018 SPLUNK INC.

Tyrannosaurus "Rex"

© 2018 SPLUNK INC.

Example
Speed over Precision
 Which is easier to understand?

© 2018 SPLUNK INC.

· ([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-
Z]{2,5})
· .+@.+\..+

 Just worry about getting the data

Example
Accuracy over Perfection
 Which is easier to understand?

© 2018 SPLUNK INC.

· ([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-
Z]{2,5})
· .+@contoso.com

 Just worry about getting the data

Use Case: IPv4 Addresses
Only worry about accuracy if you have to

© 2018 SPLUNK INC.

 192.168.1.1

 [\d\.]+

 10.10.10.3

 1.800.555.5555  8.8.8.8

 (\d{1,3}\.){3}\d{1,3}

 10.10.10.5

Stack Overflow's suggestion:
\b((?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(?:(?<!\.)\b|\.)){4}

© 2018 SPLUNK INC.
Develop RegEx* Faster
*Good Enough RegEx

Process

© 2018 SPLUNK INC.

1. Identify potential anchors · http://www.example.com/sample/url · Jane.Doe@example.com
2. Set up exclusions · | rex field=url "http:\/\/(?<domain>.+[^\/]"
3. Set boundaries on quantifiers · | rex field=url "http:\/\/(?<domain>.{100}[^\/]"

Think Finite
 Get all the MATCHES?
[a-z]+
 Let's be realistic:
[a-z]{1,64}
 Easier on the Regex Engine · Fewer Steps = Faster Search

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

 Inclusive?

Focus on the Negative

© 2018 SPLUNK INC.

([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})

 Exclusive!

[^\s]+@[^\s]+\.[^\s]+
 Faster to add bad characters as you test.

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

Break It Down

© 2018 SPLUNK INC.

(?<email>[^=\s\"@]{1,30}@[^@;\"\s\\\\]+)

 Capture Group  Character Class for Mailbox Name  Quantifier (Repeats 1 to 30 times)  Literal "@" sign  Character Class for Domain Name

Break It Down

© 2018 SPLUNK INC.

(?<email>[^=\s\"@]{1,30}@[^@;\"\s\\\\]+)

 Weird Splunk thing:
If you want "\\" double it

Other Pitfalls Can Slow Down Your Search:  Catastrophic Backtracking  Repeating a Capturing Group See https://regular-expressions.info
 Assuming All Results are Captured

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Common Use Cases
Frequently used searches during investigations

User Activity

© 2018 SPLUNK INC.

 What sites were visited around the time of the compromise?
· Does anything look suspicious?
 What does the search history look like?
· Do searches appear to be unrelated to their job?
 Is there any abnormal activity?

Web Browsing

© 2018 SPLUNK INC.

 Do any sites look suspicious? · Uncommon top level domains · .top, .download, .date · Abnormal amounts of traffic · Large spikes in activity to unfamiliar sites · Potentially concerning in context · Competitors · File Sharing (Google Drive, Dropbox)
Example: Employee at Frothly Beer Company visited a competitor's website. What was that website?

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

Domain Search

© 2018 SPLUNK INC.

http://metrics.cnn.com/b/ss/cnn-adbp-domestic/1/H.26.1/s95879181409321

index=main sourcetype=stream:http src_ip=10.0.2.101 | stats count by url | rex field=url "https?:\/\/(?<DOMAIN>[^\/]+)" | stats count by DOMAIN | sort - count

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

Search History

© 2018 SPLUNK INC.

Reviewing a user's search history can assist in telling the "story".

 What was the user doing around the time of the alert/compromise?
 What was the user's intent? · Were they being careless or malicious?
 Do their searches appear unusual? · Are searches related to job activities?

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

Google Search

© 2018 SPLUNK INC.

Google search queries begin with "q=" and end with "&".

Bg&pq=was%20that%20t-rex%20joke%20cringeworthy&cp=

index=main sourcetype=squid dhost=www.google.com | rex field=url "q=(?<Search_String>[^&]+)" | eval Search=urldecode(Search_String) | search Search=* | table Search

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

Bing Search

© 2018 SPLUNK INC.

index=main sourcetype=squid dhost=www.bing.com | rex field=url "&qry=(?<Search_String>[^&]+)" | rex field=url "search\?q=(?<Search_String>[^&]+)" | eval Search_String=urldecode(Search_String) | search Search_String=* | table Search_String

*Note that Bing has two possible search strings. Be careful not to assume that "results" = "all results"

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

Words near other words
 Think commonly paired words  Can assist in identifying potential security concerns.

© 2018 SPLUNK INC.

· Select, From, Where · <script>,</script> · Download, docm

Example: username, password
| rex field=_raw "(?<extract>username.{1,100}password.{1,100})"

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

Words near other words

© 2018 SPLUNK INC.

sourcetype=stream:smtp | rex field=_raw
"(?<extract>username.{1,100}password.{1,100})" | search extract=* | eval extractdecode=urldecode(extract) | rex field=extractdecode
"username=(?<USERNAME>.{1,64})&password=(?<PASSWOR D>.{1,64})&confirm" | table USERNAME PASSWORD extractdecode

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Work Around Parsing Errors
Incident Response

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
SQL Injection
Incident Response

SQL Injection

© 2018 SPLUNK INC.

According to OWASP, "A SQL injection attack consists of insertion or "injection" of a SQL query via the input data from the client to the application."

https://www.owasp.org/index.php/SQL_injection

SQL Injection
 Investigations start somewhere · Alert · Pen Test Results
 Alert · e.g. IDS event indicating a SQL Injection · Direct us to a specific log

© 2018 SPLUNK INC.

SQL Injection REGEX - Data
<dt>Query:</dt> <dd> SELECT q.*, s.sid FROM mybb_questionsessions s LEFT JOIN mybb_questions q ON (q.qid=s.qid) WHERE q.active='1' AND s.sid='makman' and updatexml(NULL,concat (0x3a,( SELECT email FROM mybb_users ORDER BY UID LIMIT 5,1)),NULL) and '1' </dd>

© 2018 SPLUNK INC.

<dd>1105 - XPATH syntax error: ':kIagerfield@froth.ly'</dd>

SQL Injection REGEX: Query
What is the scope?
·How many attacks occurred? ·Which were successful? ·What data was targeted? ·What data was exposed?

© 2018 SPLUNK INC.

SQL Injection REGEX: Query

© 2018 SPLUNK INC.

For simplicity, pull out the query and result separately.

index=main sourcetype=stream:http | rex field=dest_content "updatexml\((?<Sql_Injection>[^<]+)" | search Sql_Injection=* | table Sql_Injection

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

SQL Injection REGEX - Data
Now extract the results.
index=main sourcetype=stream:http | rex field=dest_content
"updatexml\((?<Sql_Injection>[^<]+)" | rex field=dest_content "XPATH syntax error: `:
(?<Query_Result>[^']*)" | search Sql_Injection=* | table Sql_Injection Query_Result

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Cross Site Scripting
Incident Response

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

XSS REGEX

© 2018 SPLUNK INC.

 | rex field=decoded_uri "code=(?<XSS>.+)"

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

Which is easier to understand?

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Working with Sysmon
Incident Response

Sysmon

© 2018 SPLUNK INC.

 According to Microsoft, sysmon "...provides detailed information about process creations, network connections, and changes to file creation time."
 Useful for identifying · Downloads · Suspicious processes · Unusual activity

Scenario
 Internal employee is hiding browsing history using Tor. What is the version of the Tor browser?
 What do we know? · Workstation: wrk-aturing · Keyword: "tor"

© 2018 SPLUNK INC.

Sysmon

© 2018 SPLUNK INC.

Sample Log:
· <Channel>Microsoft-Windows-Sysmon/Operational</Channel>
<Computer>wrk-abungst.frothly.local</Computer> <Security UserID='S-1-5-18'/></System> <EventData>
<Data Name='UtcTime'>2017-08-27 03:57:15.174</Data> <Data Name='Image'>C:\Program Files\Splunk\bin\splunk-admon.exe</Data> </EventData>
· Each data element has <tag>Data</tag>

Sysmon
Stimulus: Searching for Suspicious Download Keyword: Tor

© 2018 SPLUNK INC.

sourcetype="XmlWinEventLog:Microsoft-WindowsSysmon/Operational" host=wrk-aturing tor
| rex "<(?<Tag>[^>]+)>(?<File>[^<]+[Tt]or[^<]+)" max_match=0 | search File=* | stats count by Tag

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

Sysmon

© 2018 SPLUNK INC.

sourcetype="XmlWinEventLog:Microsoft-WindowsSysmon/Operational" host=wrk-aturing tor
| rex "<(?<Tag>[^>]+)>(?<File>[^<]+[Tt]or[^<]+)" max_match=0 | search File=* | stats count by _time Tag File | search Tag="Data Name='CommandLine'" | sort _time

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Q&A

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

