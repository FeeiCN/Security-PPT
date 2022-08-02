NATION-STATE M ONEYM ULE'S HUNTING SEASON
APT ATTACKS TARGETING FINANCIAL INSTITUTIONS
Chi-en (Ashley) Shen & Kyoung-ju Kwak & Min-Chang Jang

CHI-EN Shen
(Ashley)

Independent Researcher
· From Taiwan! · Co-founder of HITCON GIRLS · Focusing on APT research, malware analysis
and threat intelligence · Frequent speaker at infosec conference
ashley@hitcon.org
@ashley_shen_920

MIN-CHANG JANG (MC)

KOREA FINANCIAL SECURITY INSTITUTE & KOREA UNIVERSITY
· Assistant Manager of Threat Analysis Team · Co-author of Threat Intelligence Report "Campaign Rifle :
Andariel, The Maiden of Anguish" · Graduate student pursuing a major in cyber warfare at
SANE (Security Analysis aNd Evaluation) Lab. (Supervisor: Prof. Seungjoo Kim), Korea University. · Served Korean Navy CERT for over 2 years
null@fsec.or.kr
@051R15

KYOUNG-JU KWAK

Korea Financial Institute
· Manager of Threat Analysis Team · Author of Threat Intelligence Report "Campaign
Rifle : Andariel, The Maiden of Anguish" · Member of National Police Agency Cybercrime
Advisory Committee · Speaker of {PACSEC, HITCON, HACKCON, ISCR,
Kaspersky Cyber Security Weekend, etc}
kjkwak@fsec.or.kr
@kjkwak12

· BACKGROUND
· THE MALWARES AND ATTACK CASES FROM LAZARUS, BLUENOROFF AND ANDARIEL

AGENDA

· ANOTHER ATTACK TARGETING FINANCIAL INSTITUTES FROM UNKNOWN GROUP

· TTP & KEY FINDING

· CONCLUSION & BLACK HAT SOUND BYTES

BACKGROUND
Some backgrounds and related works

BACKGROUND
· Our observation shows that some nation-state actors are shifting their focus to join the battle field of moneymule in the past few years.

Nation-state Attacker
Data

Cybercrime moneymule
Money

BACKGROUND ­ who are they?

Lazarus
Targeted Domestic government, finance, Industry broadcasting

Bluenoroff
Global and domestic financial institutes

Andariel
Domestic financial institutes, IT companies and large corporations. Defense industry

Purpose Social chaos

Financial profit motivation Information gathering

Historica · 2009 7.7 DDoS attack on US and

l major

South Korea

incidents · 2011 DDoS attack in South Korea

· 2013 320 DarkSeoul

· 2014 Sony Picture Entertainment breach

· 2015-2016 SWIFT banking attack
· 2017 Polish financial supervisory authority
· 2017 South Korea Bitcoin companies

· 2015 Attack Defense industry
· 2016 Attack on cyber command center
· 2017 South Korea ATM breach

Related 2016 Operation Blockbuster Reports Novetta

2017 Lazarus under the hood - 2017 Campaign Rifle ­ South

Kaspersky

Korea Financial Security

Institute

BACKGROUND ­ Activity Timeline

2016/02
- Bangladesh Bank Heist - South Korea Conglomerates Hacked

2017/03
- South Korea ATM company hacked

2017/07
- South Korea Korbit Bitcoin Exchange Hacked

2017/10
- Taiwan Far Eastern International Bank Heist

2016/08

2017/02
- Watering hole on Polish Financial Supervision Authority website to target 100+ banks in Europe

- South Korea Ministry of National Defense Hacked

2017/05
- WannaCry Ransomware attack - South Korea Labour Unions Websites Hacked - South Korea Bithumb Bitcoin Exchange Hacked

2017/09
- South Korea Largest Travel Agency Hanatour Hacked

THE MALWARES AND ATTACK CASES
from Lazarus, Bluenoroff and Andariel

· KOREA MAJOR BANK ATTACK BY BLUENOROFF · ATM OPERATOR COMPANY BREACH a.k.a VANXATM · BITCOIN EXCHANGES HACKED

CASES

KOREA MAJOR BANK ATTACK BY BLUENOROFF - Background
· Time:
· In March, 2017
· Target :
· One of Top 5 Banks in South Korea · Employees of the bank (in charge of SWIFT system)
· Vulnerability:
· File sharing function in VDI program (it was a 0 day during that time)
· Damage:
· No severe damage due to the rapid detection · 2 PCs infected

KOREA MAJOR BANK ATTACK BY BLUENOROFF - Malware
· The vulnerability ­ The Named Pipe file sharing feature in VDI
<Architectural overview of Host-Guest Communication Channel with named pipe >
https://blogs.technet.microsoft.com/windows_vpc/2009/10/13/using-a-host-guest-communication-channel-in-windows-virtual-pc/

KOREA MAJOR BANK ATTACK BY BLUENOROFF ­ Attack Vector
Network Environment

Named Pipe

Employee's PC

Employee's PC

for internal network use only For accessing the internet

Computer Name Start with "pb"

(Virtual Machine)

Vlan A (with critical data) (not connect to WAN)

Vlan B (Connect to WAN)

Spear-phishing Emails

attacker

Critical Data stolen

C2 server

KOREA MAJOR BANK ATTACK BY BLUENOROFF - Malware
· Evidence in the malware
VDI Software manufacturer insisted that File Sharing functionality via NamedPipe was disabled.
However, it was just hidden.
So Attackers were able to use this functionality.

KOREA MAJOR BANK ATTACK BY BLUENOROFF - Malware
· Malwares
· Family:
· Manuscrypt (file name: corems.dll, amanuv.dll)
· Features :
1. Searching in the internal network for some specific hosts related to SWIFT network. 2. Activate NamedPipe of specific process (vmsal.exe)
Ø vmsal.exe : management process of virtual machine's segregation program Ø Stealing data from internal segregated network by using hidden NamedPipe file sharing
feature
3. Look for desired data and send them to C&C Server

KOREA MAJOR BANK ATTACK BY BLUENOROFF - Malware
· Malwares (corems.dll, amanuv.dll)
NamedPipe Set -> Connect -> Read -> Write

KOREA MAJOR BANK ATTACK BY BLUENOROFF - Malware
· Malwares (corems.dll, amanuv.dll)
Get NamedPipe Handle
Set NamedPipe Handle State with Mode 0x0

KOREA MAJOR BANK ATTACK BY BLUENOROFF - Malware
· Malwares (corems.dll, amanuv.dll)
Search specific files and write the result with following the special structure

KOREA MAJOR BANK ATTACK BY BLUENOROFF - Malware

· Malwares (corems.dll, amanuv.dll)

0

4

8

12

Flag
12

Unknown Integer

Unknown Integer

16

20

24

File time

Length of Filename Filename

Flag
If (IsDirectory) : flag = ":GY:"
Else: flag= ":FZ:"

EOF (End of File) Flag
If (EOF) : eof_flag = ";**;"

KOREA MAJOR BANK ATTACK BY BLUENOROFF - Malware
· Malwares (corems.dll, amanuv.dll) C&C Configuration
C&C IPs hidden inside Registry Value

KOREA MAJOR BANK ATTACK BY BLUENOROFF - Malware

· Data send to C2 server Encoded String

Decode Function

Decoded String

Accept: */*; Content-Type: multipart/form-data; boundary= Accept-Encoding: gzip,deflate,sdch Accept-Language: ko-KR Content-Disposition: form-data; name="board_id" Content-Disposition: form-data; name="user_id" Content-Disposition: form-data; name="file1"; filename="img01_29.jpg" Content-Disposition: form-data; name="file1"; filename="my.doc" Content-Disposition: form-data; name="file1"; filename="pratice.pdf" Content-Disposition: form-data; name="file1"; filename="king.jpg" Content-Disposition: form-data; name="file1"; filename="dream.avi" ......

· KOREA MAJOR BANK ATTACK BY BLUENOROFF · ATM OPERATOR COMPANY BREACH a.k.a VANXATM · BITCOIN EXCHANGES HACKED

CASES

VANXATM - ATM OPERATOR COMPANY BREACH
· Operation started from Feb. 2015 (Actual information leakage in March 2017) · Target : ATM Operator Company (provide and manage 2000 ATM SK) · Used vulnerability
· 0 day in antivirus program · Misconfiguration and management between ATM machines and ATM update server
· Attribution
· Andareil Group
· Damage
· the number of leaked card information (Sept, 2016 ~ Feb, 2017) => Total 1.9m (After deduplication 230k)

VANXATM - ATM OPERATOR COMPANY BREACH

VANXATM - ATM OPERATOR COMPANY BREACH
· Process flow of VANXATM

No authentication to update files
Update malware
With FTP server
Inside ATM company

Unencrypted FTP Account & password Stored on ATM machine

VANXATM - ATM OPERATOR COMPANY BREACH
· Exploit tool (fs.exe)
· Scan antivirus server's service port
· Connect to the server
· Send file · Run file

VANXATM - ATM OPERATOR COMPANY BREACH

· VAN_XATM.e xe (Dropper Type A)

Dropping java.exe (RAT) & javaupdate.exe (legit ATM program)

PDB Path

VANXATM - ATM OPERATOR COMPANY BREACH
· msupdate.exe, u.tmp, 1.exe, up.tmp (Data Exfiltration)
Search {mmdd}CHVA files

Search D:\FKMJNL\{yyyymmdd}.jnl

Transaction Date Transaction Time
Account NuImssbueerr

<Journal File>

Request Amount Balance

Send Files to C2

VANXATM - ATM OPERATOR COMPANY BREACH
· Suspicious files discovered from VANXATM C&C Server

· KOREA MAJOR BANK ATTACK BY BLUENOROFF · ATM OPERATOR COMPANY BREACH a.k.a VANXATM · BITCOIN EXCHANGES HACKED

CASES

BITCOIN EXCHANGES HACKING CAMPAIGN

· Trading volume of major Bitcoin Exchanges in South Korea
· `C' is the first char of Bitcoin Exchanges that is used for many company names

B

C#1

C#2

C#3

Incorporation

2014 Jan

2014 Aug

2013 July

2017 Apr

Number of employee
Number of coin type
Transaction Amount per day(17.11.21. USD)

Around 150 10
735 million

Around 80 7
84 million

Around 60 5
120 million

Around 20 12
29 million

BITCOIN EXCHANGES HACKING CAMPAIGN
· Four Bitcoin Exchanges were attacked · Attacker impersonates the public institutes for phishing
· Public Prosecutors' Office, National Police Agency, Financial Security Institute, Major Bank, etc.
· They used nine email accounts for attack
· 4 out of 9 were stolen email accounts, and 5 were confirmed created by the attacker
· Mobile malware was deployed to bypass SMS authentication.
· Palo Alto - Operation Blockbuster Goes Mobile
· https://researchcenter.paloaltonetworks.com/2017/11/unit42-operation-blockbuster-goesmobile/
· McAfee - Lazarus Cybercrime Group Moves to Mobile Platform
· https://securingtomorrow.mcafee.com/mcafee-labs/lazarus-cybercrime-group-moves-tomobile/
· Sample Hash: (sha256) 22a279c5685d7c3e24c04580204a8a932b2909a77a549bdd7bcf7ead285efde9

BITCOIN EXCHANGES HACKING CAMPAIGN
· 25 people received phishing emails attached with malicious HWP files during the campaign
· In Korea, HWP(Hangul Word Processor) is the most popular word processor as MS OFFICE
· They used a vulnerability of Ghostscript
· Ghostscript is interpreter for postscript language · Ghostscript is included in HWP
· removed in a current version by vulnerability issue
· Its vulnerability could allow the arbitrary code execution · Ghostscript can create files without vulnerability

BITCOIN EXCHANGES HACKED - Phishing Email Attack Vector

Receive SMS verification

infected mobile phone Create email account

SMS verification to infected mobile

Four bitcoin exchanges (25 people targeted)

attacker

passthru server connect email services

control C2 server

C2 server

several times sent phishing emails (07.05. ~ 08.08.)
information gathering

BITCOIN EXCHANGES HACKED ­ Attack Timeline

05.Jul.2017. [FSI] Financial Security Standardization ...
<-Target changed->
//

11.Jul.2017 nondisclosure

22.May.2017. National Tax Service ... 06.Jul.2017. nondisclosure

10.Jul.2017
[**bank] establishment of a pledge right ...

04.Aug.2017 Check Bcoin wallet addresses in attached file
07.Aug.2017 nondisclosure 03.Aug.2017 Sent a transaction log

TARGETING BITCOIN EXCHANGES USERS ­ Before July, 2017

· A phishing email impersonated the National Tax Service
· Targeted users of Bitcoin Exchanges

Hello,

2017.5.22. 04:54 PM

This is special tax investigation team at National Tax Service. I attached a file that you need to prepare for tax investigation. You have to complete preparing until 10 am, 25 May.

Thanks

[Attached a malicious hwp file]

BITCOIN EXCHANGES HACKED ­ Before July, 2017
· Compares with Korean Major Bank Sample

Major Bank Sample

Users of Bitcoin Exchanges Sample

BITCOIN EXCHANGES HACKED ­ CASE 1: IMPERSONATED as FSI
· After 2 months we found another sample related to Bitcoin Exchanges · A phishing email impersonated the Financial Security Institute
2017.7.5. 09:59 AM Hello, We(FSI) are going to survey regarding the financial security standardization. I expect your active participation, so I attached a file related to the survey. news link : http://.... If you have any questions, please feel free to contact me.
Thanks, FSI survey manager
[Attached a malicious hwp file(2017 the financial ...)]

CASE 1: IMPERSONATED as FSI ­ Malicious scripts in HWP file
· We could find ps (postscript) files in BinData of malicious HWP file · They were compressed by zlib

CASE 1: IMPERSONATED as FSI ­ Files

Attached

Embedded

Create/Drop

HWP malicious document

BIN0001.ps

HncCheck.lnk

Create/Drop

Execute

BIN0002.ps

HncBB80.bin Trojan Downloader

Run shellcode & Decode downloader & BIN0003.ps inject into memory

CASE 1: IMPERSONATED as FSI­ Postscript
· BIN0001.ps
· It makes a shortcut at the path below
"%temp%\\..\\..\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Startup\\HncCheck.lnk"
· HncCheck.lnk has included "C:\Windows\System32\rundll32.exe %temp%\..\HncBB80.bin,MainCallBack"
· It is a trigger to execute "HncBB80.bin" when victims reboot their PCs
· BIN0002.ps will drop a binary file HncBB80.bin è trojan downloader

CASE 1: IMPERSONATED as FSI ­ Files

Attached

Embedded

Create/Drop

HWP malicious document

BIN0001.ps

HncCheck.lnk

Create/Drop

Execute

BIN0002.ps

HncBB80.bin

Run shellcode & Decode downloader & BIN0003.ps inject into memory

CASE 1: IMPERSONATED as FSI ­ Postscript
· BIN0003.ps
· If victim system has vulnerability in gs32dll.dll, it will be executed · It has a xor key of 4-byte-length (0x77, 0x5D, 0x11, 0x72) · Decoded the hex strings using xor key, then we got another postscript with
shellcode
Post Script
XOR Encoded Post Script with Shellcode
Embedded PE 32 bits Embedded PE 64 bits

CASE 1: IMPERSONATED as FSI ­ Postscript vulnerability
· BIN0003.ps ­ (similar to CVE 2017-0261)
· gs32dll.dll is a necessary library for handling postscript · postscript is processed as flow "read -> execute -> close" · There is a vulnerability in "close" part of the flow · Loads embedded PE and inject to a system process when shellcode was
executed
CALL ROP Chain
ROP Chain start
Shellcode will get a execution permission

CASE 1: IMPERSONATED as FSI ­ Agent Dropper
· When HncBB80.bin (downloader) and shellcode were executed
· Infected system information gathering and send them to C2 · Receives data from C2(additional file download & execution) · But we did not get any additional files from C2 · C2 is https://www[.]kbautosys[.]com · 115[.]92[.]103[.]37

CASE 2: IMPERSONATED as A NATIONAL POLICE OFFICER
· Phishing Email Impersonated a National Police Officer
2017.8.4. 10:08 AM Hello. This is a detective OOO at **** police station. Please check bitcoin addresses from attached excel file. If you have any question, feel free to contact me by the following number.
Thank you.
[Attached a pdf file(Copy of identification card)] [Attached a malicious xls file(bitcoin transaction log)]

CASE 2: IMPERSONATED as A NATIONAL POLICE OFFICER ­ Files

Attached

PDF scanned ID card (benign decoy)
Macro/Drop

XLS malicious document

svchost.exe (include another custom encoded PE
downloader)

CASE 2: IMPERSONATED as A NATIONAL POLICE OFFICER ­ It's not a hwp
· In this case, they used a excel file not a hwp file · And they attached a pdf file(scanned a identification card)
· Unknown how they got a scanned ID card image · Tried to increase credibility by scanned ID card

CASE 2: IMPERSONATED as A NATIONAL POLICE OFFICER
· Malware functionality is same as case1 but C2 is not
· Infected system information gathering and send them to C2 · Receives data from C2(additional file download & execution) · But we did not get any additional file from C2 · C2 is https://www[.]unsunozo[.]org · 49[.]239[.]189[.]45

Another Attack Targeting Financial Institutes
From unidentifiable nation-state actors

Campaign targeted Egypt bank and SK banks ­ Background

· O bank is run by O group, which is based in Egypt and has branch in North Korea · O group also runs K telecom, in charge of telecommunication in NK · Target has connection with O bank in NK and K Telecom and locate in Egypt. · O Group has shut down branch in NK in 2016 because of sanction. · Target was targeted by attacker in 2017.

O Group

Operate

O Bank in NK

Operate

Decoy

K Telecom

Target

File

Sample Connection

O Bank in EG ?

Campaign targeted Egypt bank and SK banks - Background
· We observed 2 interesting samples from target in May, 2017 · Both are exploits CVE 2017-0199 DOCX documents · Upon opening the document, it connects to C&C server to download
HTA file containing malicious script

Campaign targeted Egypt bank and SK banks ­ Delivery Method

Exploit CVE 2017-0199 download HTA Powershell script

C2 server
HTA

Powershell script to download Trojan downloader, loader and script

HTA

http://foodforu.heliohost.org/blog/apache.jpg

save as alitmp0131.jpg

(http://old.jrchina.com/btob_asiana/appach01.jpg)

http://foodforu.heliohost.org/blog/apache_backup.jpg (http://old.jrchina.com/btob_asiana/appach02.jpg) save as alitmp0132.jpg

http://foodforu.heliohost.org/blog/apache.ipp (http://old.jrchina.com/btob_asiana/udel_ok.ipp)

save as alitmp0133.js

IPP

Campaign targeted Egypt bank and SK banks ­ Powershell Script Base64 decode

Campaign targeted Egypt bank and SK banks ­ Javascript
· The IPP file contains encoded VBScript to extract payload from fake JPG files and save as:
· Windows-KB275122-x86.exe (trojan downloader)
· Windows-KB271854-x86.exe (Milk loader)
Base64 decode

Campaign targeted Egypt bank and SK banks ­ Trojan downloader

· Named Freenki Downloader by PaloAlto

· Need specific arguments to execute. Supporting 3 commands (script pass "help" command to execute):

Command

Description

Help

Perform main function. Collects system information and beacon to C&C server.

console

Setting up persistence in the registry

sample

Perform console command function and later perform help command function when successes.

Campaign targeted Egypt bank and SK banks ­ Trojan downloader

· Convert MAC address to hex string and use as victim ID

· Collects system information and beacon to C&C server

· Username>Computer Name>File version of kernel32.dll>IsWow64Process() >

Ethernet MAC addresses>running processes

Report status MAC Address Encoded Victim Data

Decoded Victim Data

Encode by SUB 0F, XOR 21

Computer Name OS version MAC address Process list

Campaign targeted Egypt bank and SK banks ­ Trojan downloader
· Download payload from another C&C and save in %Temp% · The downloaded payload need argument "abai" to execute (abai
means father in Korean dialect)

Campaign targeted Egypt bank and SK banks ­ Milk loader
· Named Milk loader because of the pdb string found in the binary
· E:\\BIG_POOH\\Project\\milk\\Release\\milk.pdb (a.k.a Poohmilk by PaloAlto) · Sleep for 6 mins upon execute · Look for file "wsatra.tmp" in ths %Temp% folder. (however not existed in this case)
· If found: read the file and get a path from the file. Scanning .lnk file and ZIP in the path. Extract file from ZIP and execute

Campaign targeted Egypt bank and SK banks ­ Milk loader
· Launch the downloader. Create registry "Windows Update" to set persistent of the downloader. Default command is "help"

TTP & KEY FINDINGS
Some interesting facts

TTP & Key-finding
· Delivery
· Deliver payload with spear-phishing emails.
· Infrastructure
· Frequently use compromised C&C server.
· Tools
· Many shared code between proprietary malwares. · Open source tools in arsenal (i.e.Aryan, Xtreme RAT, Ghost RAT, FBI RAT) · Destroy evidence and tracks with ransomware. (i.e. Taiwan Far Eastern with Hermes
Ransomware)
· Target
· Targeting SWIFT system when attack on banks. · Launching SWIFT transaction during holiday/weekends.
· Persistent
· Penetrating target's network and control for a long time before doing transaction.

C&C World Map

Getting new C&C server with (stolen? ransomed?) bitcoin
· Our observation shows that there are lesser compromised server been used in the recent attacks.
· In a case we investigated, we tried to inquiry the registrant information of an Andariel group's C&C server from the hosting server provider.
· The hosting server provider reveals that since the server was pay with bitcoin, they don't have any information about the identity.
· It is a far more effective way than hacking legitimate servers and also keeping anonymity.

Sample Timestamp Analysis of Andariel Group
Working Time?

Good Night!

12:00~13:00 Delicious Lunch?

17:00~19:00 Delicious Dinner?

BLACK HAT SOUND BYTES
Conclusion

BLACK HAT SOUND BYTES (CONCLUSION)
· We've seen an increasing trend of nation-state actors using their cyber espionage capabilities for financial gain.
· Lazarus, Bluenoroff and Andariel groups targeted not only banks, but also bitcoin users/exchanges and ATM machines.
· In many cases, the attackers shows strong knowledge to the compromised system, network environment and their targets. They tailored their tools and develop 0 days for the targets. (They study hard about you!!)
· It is difficult to track these threat groups only with C&C infrastructure. Therefore, be familiar with their tools and tactic is one of the key to defend against them. (You should study hard about them too!!!)

Q&A
Any Questions ?
ashley@hitcon.org null@fsec.or.kr kjkwak@fsec.or.kr

Reference

POLISH FINANCIAL SUPERVISION AUTHORITY (FROM Bluenoroff)

· Disclosed in Feb 2017, but the initial attack was taken in as early as October 2016
· Target : Polish Financial Supervision Authority and more than 100 banks in Europe and many other countries (including South Korea)
· Attack Vector: Watering Hole attack & IP whitelist
· Malware Family : Ratankba, Destover
· Threat Actor : Bluenoroff
· Infected Webpage URL
· https://www.knf.gov[.]pl/opracowania/sektor_bankowy/i ndex.html

(from BAE SYSTEMS THREAT RESEARCH BLOG)

POLISH FINANCIAL SUPERVISION AUTHORITY (FROM Bluenoroff)
· Reference
· "Lazarus Under The Hood", Kaspersky
· https://securelist.com/files/2017/04/Lazarus_Und er_The_Hood_PDF_final.pdf
· Attackers target dozens of global banks with new malware
· https://www.symantec.com/connect/blogs/attacke rs-target-dozens-global-banks-new-malware-0
· Jak to bylo z tym atakiem na KNF i polskie banki oraz kto jeszcze byl na celowniku atakujcych? (Polish title)
· https://niebezpiecznik.pl/post/jakprzeprowadzono-atak-na-knf-i-polskie-banki-orazkto-jeszcze-byl-na-celowniku-przestepcow/
· Watering hole attacks on Polish Banks Linked to Lazarus Group
· http://securityaffairs.co/wordpress/56235/apt/laza rus-group-polish-bank.html
· Several Polish banks hacked, information stolen by unknown attackers
· https://badcyber.com/several-polish-bankshacked-information-stolen-by-unknown-attackers/

