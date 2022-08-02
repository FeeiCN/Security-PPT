SESSION ID: TTA-R03
New Ways of Emerging Actors: India, South Africa, Nigeria, and Indonesia

Wayne Huang
VP Engineering Proofpoint, Inc. @waynehuang whuang@proofpoint.com wayne@armorize.com

Sun Huang
Senior Threat Researcher, Proofpoint, Inc. shuang@proofpoint.com

#RSAC

#RSAC
Agenda
u TTP summary u Crimeware adoption u Monetization u Current C2 vulnerabilities u Actor attribution methodology u Those targeted and
compromised u Nigerian gang's strategy change u Conclusion
2

#RSAC
TTP summary

#RSAC
Actors overview
u Tracked nine actors, unique 1200+ nodes (C2 panels) during the past year
u Actors located in Nigeria (most), India, South Africa, and Indonesia
u One actor changed TTP in March 2015 u One of the Zeus panels included a backdoor (undisclosed)

Overview of the nine actors

Group  # Vic+m  # Stolen  creden+als
Malware  used Server  owned Technique

9 12,953
pop3:7,671   -p:1,137   h/p:1,538 Zeus/IceIX/Citadel/Betabot/Solarbot/Syndicate  Keylogger/ISR  Stealer
212
Spear  phishing  ----  a/achment   Phishing

#RSAC

#RSAC
Tactics, Techniques and Process (TTP) Summary
u Objectives
u Compromise endpoints u Collect data and intelligence u Credentials (POP3, FTP, HTTPS forms), client-side certs, screenshots u #1: Obtain online banking accounts u #2: Sell off data & intelligence
u Motivation
u Purely financial u Not state-backed

#RSAC
Tactics, Techniques and Process (TTP) Summary
u Target individuals u Attack vector into endpoints
u Mostly via email messages u URLs pointing to exploit kits, zips (containing exes), or jars u Attached exploits (Office, PDF) or malware executables

#RSAC
Tactics, Techniques and Process (TTP) Summary
u Endpoint ownership, data extraction & exfiltration
u Are NOT capable of developing own trojans u Use whatever off-the-shelf trojans they can get hold of u Most used trojan features:
u Web inject ­ steals specific banking accounts u Wallet stealer ­ steals virtual currencies
u Also phish for credentials ­ seen daily

#RSAC
Tactics, Techniques and Process (TTP) Summary
u Command and control (C2) servers
u Do NOT rent or maintain own servers u C2s entirely run on compromised shared hosting servers u ARE capable of and dedicate to compromising servers u Do NOT buy cPanel credentials
u Rely entirely on own-compromised servers u Installs C2 scripts mostly via cPanel 

#RSAC
Tactics, Techniques and Process (TTP) Summary
u Vector into shared hosting accounts
u Stage 1: acquire remote access to ONE shared hosting account u Mass-scale scanning + manual intrusion
u Stage 2: acquire multiple cPanel credentials on this shared hosting u Via acquiring (DB) credentials from config files u Via cPanel vulnerabilities and privilege escalation u Via brute forcing mysql credentials using usernames from /etc/passwd

#RSAC
Crimeware usage

#RSAC
Crimeware adoption
u Exploit kits
u Angler, Nuclear, Fiesta, FlashPack, RIG, Sweet Orange, etc.
u Banking trojan
u Zeus, ICEIX, Citadel, PONY, Betabot, Solarbot, JollyRoger, Dridex, etc.
u Remote access trojans (RATs)
u XtremeRAT, Gh0stRAT , Poison Ivy, Dark Comet, etc.
u Fully Undetectables (FUD)
u CypherX Crypter, Stage Crypter, Orway Crypter, etc.

#RSAC
Banking trojan panels
u Zeus

#RSAC
Banking trojan panels
u Zeus/ICEIX

#RSAC
Banking trojan panels
u Zeus/ICEIX/Citadel

#RSAC
Banking trojan panels
u Zeus/ICEIX/Citadel/Betabot

#RSAC
Banking trojan panels
u Zeus/ICEIX/Citadel/Betabot/Solarbot

#RSAC
Banking trojan panels
u Zeus/ICEIX/Citadel/Betabot/Solarbot/JollyRoger

#RSAC
Banking trojan panels
u Zeus/ICEIX/Citadel/Betabot/Solarbot/JollyRoger/PONY

#RSAC
Banking trojan features
u Credentials theft: HTTP/HTTPS/FTP/POP3/RDP/certs
u Man in the Browser (MitB)
u Video recording u Screen capture u Back-connect u Jabber notifier 

#RSAC
Monetization

Zbot-based businesses loss: $500M
250  
Total:  
200  
$500  Million
150  

100  

50  

0   2008  

2009  

2010  

2011  

2012  

2013  

#RSAC
2014  

#RSAC
Automatic video recording by Citadel
u Example: a Mexican B2B payment company's employee who operated corporate bank account with a balance of over 2.9 million USD.

#RSAC
Corporate emails sold on the black market
Different  price  by  industry

#RSAC
Anything useful to you?
$50  per  hour

#RSAC
Current C2 vulnerability

#RSAC
Zeus web panels compared

Login  page Gateway
Upload   folder Config  in Bots  table Data  table Cryptkey

Zeus  2.0.8.9  (most)  ­   2.9.6.1 cp.php?m=login gate.php _reports

Zeus  Robot/Panther/GOZ
cp.php?le/er=login secure.php _feedback

System/

Inc/

botnet_list

membership_list

botnet_reports_(date) membership_reports_(date)

$config['botnet_cryptkey']   $config['membership_cryptkey']

Current C2 panel vulnerabilities

Zeus  2.0.8.9

File  Upload   Vulnerability   (known,  patched))  
Remote  Command   Execufon  (0day)  
Reflected  Cross  Site   Scripfng   (0day)  
Informafon  leakage   (/install/)   (known,  unpatched)  


     

Zeus   2.7.6.8  ­     current
X
     

Zeus  Robot  
X
     

ICEIX
    


#RSAC
Citadel  1.3.5.1
X      

#RSAC
File upload vulnerability
u Vulnerable panels: Zeus >= 2.1.0.1 / ICEIX u Upload to /_reports/files/BOTNET_ID/BOTID/certs/
u Known and patched

#RSAC
File upload vulnerability
u Vulnerable panels: Zeus >= 2.1.0.1 / ICEIX u Upload to /_reports/files/BOTNET_ID/BOTID/certs/
u Known and patched

#RSAC
File upload vulnerability
u Vulnerable panels: Zeus >= 2.1.0.1 / ICEIX u Upload to /_reports/files/BOTNET_ID/BOTID/certs/
u Known and patched

#RSAC
File upload vulnerability
u Vulnerable panels: Zeus >= 2.1.0.1 / ICEIX u Upload to /_reports/files/BOTNET_ID/BOTID/certs/

#RSAC
File upload vulnerability
u Vulnerable panels: Zeus >= 2.1.0.1 / ICEIX u Upload to /_reports/files/BOTNET_ID/BOTID/certs/ u Apache multiple file extension support
Apache manual: "Files can have more than one extension, and the order of the extensions is normally irrelevant."

#RSAC
File upload vulnerability
u Vulnerable panels: Zeus >= 2.1.0.1 / ICEIX u Upload to /_reports/files/BOTNET_ID/BOTID/certs/

#RSAC
File upload vulnerability has been fixed
u Fixed in Zeus Robot

#RSAC
File upload vulnerability has been fixed
u Fixed in Zeus Robot

#RSAC
File upload vulnerability has been fixed
u Fixed in Zeus Robot

#RSAC
File upload vulnerability has been fixed
u Fixed in Zeus Robot

#RSAC
C2 remote command execution
u 0day u Affected: All Zeus / IceIX / Citadel u Source: reports_files.php (database search) u Sink: fsarc.php (file archiving) u Affected parameter: files u Execute arbitrary commands

#RSAC
C2 remote command execution

#RSAC
C2 remote command execution

#RSAC
C2 remote command execution

#RSAC
C2 remote command execution

#RSAC
C2 remote command execution

#RSAC
Reflected cross site scripting
u 0day u Affected: All Zeus / IceIX / Citadel u Source: reports_files.php (database search) u Sink: fsarc.php (file archiving) u Affected parameter: files u Cookie stealing or client side exploitation

#RSAC
Reflected cross site scripting

#RSAC
Reflected cross site scripting

Actor attribution

#RSAC

methodology

#RSAC
C2 tracking system
u Tracking actors C&C server u Analysis actors location and activity u RC4 keypass brute force to automatic getshell u Password brute force u Support: Zeus/ICEIX/Citadel

#RSAC
C2 tracking system
u Tracking actors C&C server u Analysis actors location and activity u RC4 keypass brute force to automatic getshell u Password brute force u Support: Zeus/ICEIX/Citadel

#RSAC
Campaign attribution via XSS fingerprinting

#RSAC
Actors' tool for cPanel remote privilege escalation
u cPanel apache Symlink Race Condition Vulnerability 

#RSAC
Actors' tool for cPanel password bruteforcing
u cPanel password bruteforcing

#RSAC
Actors' tool for cPanel password bruteforcing
u cPanel password bruteforcing

#RSAC
Upload & install C2 mostly via cPanel
u Upload C2 panel, dropper and config files via cPanel

#RSAC
Identifying actor location
u Access logs u Last login IP record in .lastlogin file
p /home/[username]/.lastlogin

A good technique in finding more C2 servers on

#RSAC

the same shared host

u Identify additional active C2 domains via cPanel webalizer u Many cPanel webStats allow unrestricted access
p /home/[username]/tmp/webalizer/

Top 10 C2 passwords and RC4 keys

123456   12345678 admin123 1qaz2wsx   enugu042   mankind 1234567   master   password1   1234567890

Password

RC4  KeyPass reh4357heGTJHaegharhet4575hawrGAEha   78fghrYU%^&$ER   144458686889uiuiui   hello   SXMQ!xz%US!K5~#(K(   man1   E354B6KUO986C434C5677BBH2WER   PrE/Y!!#$@#   olivertwist   pelli$10pelli  

#RSAC

Those targeted and

#RSAC

compromised

Overview of the nine actors

Group  # Vic+m  # Stolen  creden+als
Malware  used Server  owned Technique

9 12,953
pop3:7,671   -p:1,137   h/p:1,538 Zeus/IceIX/Citadel/Betabot/Solarbot/Syndicate  Keylogger/ISR  Stealer
212
Spear  phishing  ----  a/achment   Phishing

#RSAC

Singaporean victims by industry

#RSAC

Healthcare   Marke+ng  and  distribu+on  

1%  

1%  

Informa+on  Technology   1%  
Services/Consul+ng   4%  

Manufacturing   9%  

Travel  and  Transporta+on   22%  

Engineering   14%  

Environmental  systems   1%  
Bicycle  and  Skate  rental   9%  
Construc+on   8%  

u Logistics industry ******cs.com.sg ******ing.com.sg

Telecommunica+on   Food   Electronics  

8%  

3%  

6%  

Financial   5%  

Educa+on   1%  

u Oil / Energy industry ******ring.com.s

Logis+cs  Services   4%  

******l.com.sgg

Energy  &  U+li+es  

Chemicals  &  Petroleum  

3%  

1%  

Engineering   Construc+on   Logis+cs  Services   Electronics   Travel  and  Transporta+on   Healthcare  

Environmental  systems   Educa+on   Energy  &  U+li+es   Food   Services/Consul+ng   Marke+ng  and  distribu+on  

Bicycle  and  Skate  rental   Financial   Chemicals  &  Petroleum   Telecommunica+on   Informa+on  Technology   Manufacturing  

Group NG03

Group  Name
Na+onality/   Loca+on
Vic+m  #

NG03 NIGERIA,  LAGOS,  LAGOS
15,887

Stolen  creden+als Malware  used

pop3:9,622   -p:1,117   h/p:6,59
ZeuS/Citadel/ISR  Stealer

Server  owned
Technique Feature

265
Spear  phishing  ----  a/achment, Phishing  
PO#  JKT--130090.doc   Purchase  Order.DOC   PaymentCopy.scr   Chief  Architect  X2.exe   remi/ance  details.zip

#RSAC

Group NG03 ­ Victims by industry

Energy  &  U+li+es   Chemicals  &  Petroleum   4%  
7%  
Electronics   4%  

Others   4%  

Retail   21%  

Travel  &  Transporta+on  

21%  

Manufacturing  

18%  

Informa+on  Technology  

Services/Consul+ng  

14%  

7%  

u Pakistan's energy center s****energy.org
u well-known energy expert
u UK's logistics company i*****tions.co.uk

#RSAC

Retail   Informafon  Technology   Travel  &  Transportafon   Chemicals  &  Petroleum   Others  

Manufacturing   Services/Consulfng   Electronics   Energy  &  Uflifes  

u Many videos recorded with Citadel u Also doing phishing

#RSAC
Group NG03 ­ Victims by country

KR  ,  10%  

AE,  4%  

CN  ,  13%   DE,  3%  

IN  ,  21%  

HK  ,  6%   ID  ,  20%  

AE   AR       AT   AU       BA       BD       BE       BF       BG   BH   BT       BY       CA       CH       CI       CN     DE   DK       DZ       EC       EG   ES   ET       EU       FI       FJ       FR   GB   GE       GH       GR   HK     HU       ID     IE       IL   IN     IR   IT   JO   JP   KE       KH       KR     KW   KZ       LB       LK       LT       LU       LV   MA       MD       ME       MO       MU       MX   MY   MZ       NG  

Group IN01

Group  Name Na+onality/   Loca+on Vic+m  # Stolen  creden+als
Malware  used Server  owned Technique Feature

IN01 INDIA,  DELHI,  NEW  DELHI
493
pop3:102   -p:7   h/p:52 IceIX
4 Spear  phishing  ----  a/achment

#RSAC

#RSAC
Group IN01 ­ Victims by industry

Insurance   3%  
Healthcare   7%  

Financial   3%  

Others   3%  

Travel  &  Transporta+on   10%  

Services/Consul+ng   7%  

Informa+on  Technology   7%  

Manufacturing   20%  

Retail   40%  

u Targeted India
u India's logistics company f******ight.net

Retail   Informafon  Technology   Travel  &  Transportafon   Insurance  

Manufacturing   Services/Consulfng   Healthcare   Financial  

#RSAC
Group IN01 ­ Victims by country
RU,  1%  
IT,  9%  
US,  4%  
IN,  78%  
IN   US   IT   RU   BG   DE   IL   AT   FR   HU   GR   EG   BE   CA   PL   ES   PK   MU   CN   HK   GB   BH   TW   SG  

Group ZA01

Group  Name Na+onality/   Loca+on Vic+m  # Stolen  creden+als
Malware  used Server  owned Technique Feature

ZA01 SOUTH  AFRICA,  KWAZULU--NATAL,  DURBAN
27
pop3:28   -p:3   h/p:20 Zeus
3 Spear  phishing  ----  a/achment Your  Order.exe   drop.exe   drops.exe

#RSAC

#RSAC
Group ZA01 ­ Victims by industry

Travel  &   Transporta+on  
14%  

Others   14%  

Retail   29%  

Informa+on   Technology  
14%  

Manufacturing   29%  

u South Africa, India, Germany
u Australian government .gov.au
u Petrochemical Industry c****.com

Retail   Informa+on  Technology   Others  

Manufacturing  

u Logistics company

Travel  &  Transporta+on   e**.net

#RSAC
Group ZA01 ­ Victims by country

HK   SE   US   BD   4%   4%   4%  
ID   4%   7%  

PL  

7%  

PL  

7%

ZA  

15%  

DE   18%  

IN   37%  

IN   DE   ZA   PL   ID   BD   HK   SE   US  

Group ID01

Group  Name Na+onality/   Loca+on Vic+m  # Stolen  creden+als
Malware  used Server  owned Technique
Feature

ID01 INDONESIA
100
pop3:22   -p:31   h/p:10 Zeus
3 Spear  phishing  ----  a/achment   Phishing

#RSAC

#RSAC
Group ID1 ­ Victims by industry

Government   Insurance   8%  
8%   Electronics  
17%  
Informa+on   Technology  
8%   Manufacturing   9%  
Retail  
Informa+on  Technology  
Insurance  

Retail   50%  
Manufacturing   Electronics   Government  

u Aviation Equipment Company
u India's electrical equipment manufacturer
u European flying committee

#RSAC
Group ID01 ­ Victims by country

RU   10%  
NZ   19%  

CN   8%  
DE   19%  

US   44%  

US   DE   NZ   RU   CN  

#RSAC
Automatic video recording by Citadel
u Example: a Mexican B2B payment company's employee who operated corporate bank account with a balance of over 2.9 million USD.

Nigerian gang's strategy

#RSAC

change

#RSAC
New campaign since Apr 28 2015
u Microsoft RTF Document with CVE-2014-1761 u Malware: ISR Stealer

#RSAC
ISR stealer mostly setup on free hosting

#RSAC
ISR stealer persistent cross site scripting
u Source & sink: index.php 

#RSAC
ISR stealer persistent cross site scripting
u Source & sink: index.php 

#RSAC
ISR stealer persistent cross site scripting

u Source & sink: index.php 

Specific  user  agent

#RSAC
ISR stealer persistent cross site scripting

u Source & sink: index.php 
Source  Input

Specific  user  agent

#RSAC
ISR stealer persistent cross site scripting

u Source & sink: index.php 
Source  Input

Specific  user  agent

#RSAC
ISR stealer persistent cross site scripting

u Source & sink: index.php 
Source  Input

Specific  user  agent

#RSAC
ISR stealer persistent cross site scripting

u Source & sink: index.php 
Source  Input

Specific  user  agent

#RSAC
ISR stealer persistent cross site scripting

#RSAC
ISR stealer persistent cross site scripting

#RSAC
ISR stealer persistent cross site scripting

#RSAC
Campaign attribution
p USER_AGENT:
p Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/ 537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36 OPR/28.0.1750.51
p IP addresses:
p 41.220.69.115 - AS 29465 (Nigeria) p 41.220.69.185 - AS 29465 (Nigeria)
It turns out this actor is the same Nigerian gang whom we've been tracking for a year

#RSAC
ISR Stealer admin panel

#RSAC
ISR Stealer admin panel

#RSAC
Actors attribution research

XSS targeted experiment
Duration Successful triggers Success rate Total stolen credentials

170 ISR Stealer panels on unique domain name 2 weeks Received 103 cookies 60 % 66,284

Actors by country

Canada   Turkey   3%   Iran  

Benin   1%  

Aus1tM%rae 1 lix%aic     o  Mya3n%m   ar  

Malaysia   3%  

1%  

3%  

Russia  

3%   United  Arab  Emirates   Ghana  

3%  

3%  

Pakistan   2%  

Singapore   1%  
Romania   1%  

Nigeria   71%  

#RSAC
Nigeria  ASN   29465   36873   37076   37127   37148

Nigeria   United  Arab  Emirates   Iran   Mexico  

Romania   Ghana   Canada   Myanmar  

Singapore   Russia   Benin   Malaysia  

Pakistan   Turkey   Australia  

Actors by OS
Win  8   12%  

Unknown   4%  
Win  XP   12%  

Win  7   72%  

#RSAC

Win  7   Win  8   Win  XP   Unknown  

#RSAC
Actors by browser and by flash version

Safari   2%  

Chrome   60%  

RU  
9%Firefox  
37%  

Firefox   Chrome  

IE   1%  
IE   Safari  

Outdate   19%  

US   46%

Latest   81%  

Latest   Outdated  

#RSAC
Nigerian gang evolution
u 2014: Traditional attachment techniques
p Executable files (exe, scr) compressed within a Zip file p Purchase_Order.zip or Payment Advice pdf.zip etc. p Malware: Zeus / IceIX / Citadel / Betabot / ISR Stealer
u 2015: Changed tactics!
p Microsoft RTF Document with CVE-2014-1761 p Still some old schools (exe/scr) p Malware: Zeus Robot / PONY / ISR Stealer (increased) / Citadel /
Betabot / Zeus 2.1.0.1 (decreased) / Zeus 2.0.8.9 (decreased)

#RSAC
High profile victims

u 23 government email accounts
7  

6  

11

RU  
d9i%fferent

countries

5  

US  

4  

46%

3  

2  

1  

0   RW   IT   PK   RW   UA   TW   ZA   VN   IQ   MK   IN  

#RSAC
Conclusion
u Actor tracking & attribution can be done u Key features: passwords, RC4 keys, browser versions, environt
variables, and directory names u Secondary features: IP range, geolocation, language, operating
hours u Strategy change made them more difficult to track
u Avoided using vulnerable C2 panels
u Currently the most used Zeus: Zeus Robot
97

