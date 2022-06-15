Keeping Eyes on Malicious Websites "ChkDeface" against Fraudulent Sites
Hiroshi KOBAYASHI, Takayuki UCHIYAMA Japan Computer Emergency Response Team Coordination Center (JPCERT/CC)

Agenda
Background
--Increase and changes in website defacements

Internal operations when a defacement is

discovered

Hiroshi KOBYASHI

System Development
--chkdeface

koba is a Information Security Analyst at JPCERT Coordination Center, National CSIRT in Japan. He is in charge of incident response.

Going Forward

Takayuki UCHIYAMA
Taki is a Information Security Analyst at JPCERT Coordination Center, National CSIRT in Japan. He is in charge of handling vulnerability reports.

2

Copyright©2015 JPCERT/CC All rights reserved.

BACKGROUND

3

Copyright©2015 JPCERT/CC All rights reserved.

Increase and Changes in Website Defacements
Recently, 300 ­ 500 / month, June - July 2013 over 1,000 -- 2009 - 2010 Gumblar -- June, 2012 .js file defacements (Plesk?) -- February, 2013 iframe insertions -- May, 2013 Obfuscated JavaScript insertions -- October, 2013 See decrease trend, but still high numbers

4

Copyright©2015 JPCERT/CC All rights reserved.

Reasons for Defacing a Website
To infect with malware
--"Guide" to an Exploit Kit

"Guide" to a fake shopping site (Spamvertising)
--Pharmacy, Supplements --Selling fake products, etc.

To use for SEO poisoning

Exhibit power or make a political stand
--Hacked by / Pwned by --Display country flag or organization log

To leverage in DDoS attacks

5

Copyright©2015 JPCERT/CC All rights reserved.

Causes that allow for defacements
Account information for servers are stolen
--By brute force --Use account information stolen from a PC by malware
Leveraging a web application vulnerability
--CMS(WordPress(plugin),Joomla!,Movable Type,...) --Custom PHP (written from scratch)
Leveraging a server management software vulnerability
--Plesk, cPanel, etc.
Leveraging a middleware vulnerability
--GNU Bash, Struts, etc.

6

Copyright©2015 JPCERT/CC All rights reserved.

INTERNAL OPERATIONS WHEN A DEFACEMENT IS DISCOVERED

7

Copyright©2015 JPCERT/CC All rights reserved.

Flow for Checking Website Defacements

Receive Report

Check site w/ browser

Identify alteration by checking source code

Identify site administrator
from IP Address and
WHOIS

Created tool to perform operations mentioned in the dotted box

8

Copyright©2015 JPCERT/CC All rights reserved.

Contact site administrator

Things to keep in mind when checking Website defacements
Check websites with an environment that will not be affected by malicious contents
Conserve the website contents
--Data for contents that make up the site (html, images, CSS, JS)
--Screenshot of the website
Record website information
--IP address of the site --WHOIS information on the IP address and domain

9

Copyright©2015 JPCERT/CC All rights reserved.

SYSTEM DEVELOPMENT

10

Copyright©2015 JPCERT/CC All rights reserved.

Requirements
Obtain contents and a screenshot in one access attempt
--Some sites change behavior when accessed again

Does not get infected when obtaining source code
--Both the checker and tool

Record the time of the check
--Investigative organizations ask for this information

Relatively easy to troubleshoot when there is an overload or an issue

Importance on 'real-time'

11

Copyright©2015 JPCERT/CC All rights reserved.

Become more efficient by using a tool
Developed a Django based Web application
--Chkdeface

Main operations 1. Register the website URL
--Handles HTTP,HTTPS,FTP --Handles PROXY --Handles both Referer and user-agent

2. Contents for the registered website are obtained
--Source code for the webpage that is displayed in the browser
--Contents that make up the webpage --Screenshot of the webpage

12

Copyright©2015 JPCERT/CC All rights reserved.

Improving efficiency by developing and using a tool
3. Using jsunpack-n, check if the signature matches with any existing signatures
-- Used a custom set of previously collected signatures

4. Record various data on the site
-- http_status -- content_type -- http_erver -- wappalyzer

5. Record information on the website
--IP address --WHOIS information (domain, IP address)

13

Copyright©2015 JPCERT/CC All rights reserved.

Structure
chkdeface (web interface)

http

frontend (api)
Celery (redis)

another system

backend (spider)
LoadBalancing backend (spider)
backend (syn)
backend (dns,whois)

14

Copyright©2015 JPCERT/CC All rights reserved.

proxy
target dns
whois

Main Modules
Ghost.py Django Celery
--redis
jsunpack-n
--Yara
wappalyzer

15

Copyright©2015 JPCERT/CC All rights reserved.

Going Forward
Would like to open source
--Plan to put on github.com/JPCERTCC
Using this system, would like to collaborate with domestic community on incident response
--Would like to provide feedback on results at next year's FIRST Conference

16

Copyright©2015 JPCERT/CC All rights reserved.

APPENDIX

17

Copyright©2015 JPCERT/CC All rights reserved.

Screen Image (top page)

18

Copyright©2015 JPCERT/CC All rights reserved.

Screen Image (Check in progress)

19

Copyright©2015 JPCERT/CC All rights reserved.

Screen Image (Check Result)

20

Copyright©2015 JPCERT/CC All rights reserved.

Screen Image (Screenshot)

21

Copyright©2015 JPCERT/CC All rights reserved.

Screen Image (Source code)

22

Copyright©2015 JPCERT/CC All rights reserved.

Screen Image (List contents)

23

Copyright©2015 JPCERT/CC All rights reserved.

Screen Image (Search)

24

Copyright©2015 JPCERT/CC All rights reserved.

Screen Image (Search)

25

Copyright©2015 JPCERT/CC All rights reserved.

Screen Image (Search)

26

Copyright©2015 JPCERT/CC All rights reserved.

Screen Image (WHOIS)

27

Copyright©2015 JPCERT/CC All rights reserved.

Screen Image (WHOIS)

28

Copyright©2015 JPCERT/CC All rights reserved.

Screen Image (DNS)

29

Copyright©2015 JPCERT/CC All rights reserved.

Screen Image (syn)

30

Copyright©2015 JPCERT/CC All rights reserved.

