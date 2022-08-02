RTM: SINK-HOLING THE BOTNET

WHO WE ARE
Semyon Rogachev
Malware analyst
· 4+ years in malware analysis and incident response
· Strong skills in reverse engineering · Author and co-author of Group-IB
ransomware reports

Rustam Mirkasymov
Threat Intelligence analyst
· 8 years in cyber threat research and threat intelligence
· Strong skills in reverse engineering, knowledge in exploit development and understanding software vulnerabilities mechanisms
· Author / co-author of numerous APT threat reports (including Lazarus, Silence, Cobalt, Moneytaker, RedCurl,)
Twitter: @Ta1ien

GROUPS EVOLUTION
Most of banking hacking groups in 2008-2017 were Russian speaking.

GROUPS EVOLUTION

FIRST STAGE ­ RECONNAISSANCE MODULE
Phishing emails contain a reconnaissance module, which checks if any indicators of financial activity is presented on the infected host.
SECOND STAGE ­ RTM CORE
If indicators of the financial activity were found, RTM core module is downloaded from the C2 server. In other case some common malware, like Pony Stealer is downloaded.
THIRD STAGE ­ RTM MODULES
RTM Core collects additional information about the infected host, downloads and executes modules, which are used for the network reconnaissance, lateral movement and money stealing.

RTM ATTACK OVERVIEW
C&C server

FIRST STAGE ­ RECONNAISSANCE MODULE
Phishing emails contain a reconnaissance module, which checks if any indicators of financial activity is presented on the infected host.

Compromised email servers Phishing domain names

Phishing emails with RTM Reconnaissance module attached
RTM Recon
Compromised web sites for financial specialists

Reconnaissance RTM Core with modules

SECOND STAGE ­ RTM CORE
If indicators of the financial activity were found, RTM core module is downloaded from the C2 server. In other case some common malware, like Pony Stealer is downloaded.
THIRD STAGE ­ RTM MODULES
RTM Core collects additional information about the infected host, downloads and executes modules, which are used for the network reconnaissance, lateral movement and money stealing.

FIRST STAGE - RECONNAISSANCE
RTM Reconnaissance module checks browser history to find traces of the following remote banking services:

SBERBANK
sbi.sberbank online.sberbank bps-sber

VTB
bco.vtb24.ru dbo.vtb bco.vtv.24

ALFABANK
link.alfabank click.alfabank ibank.alfa-bank.by

RAIFFEISEN
elba.raiffeisen elbrus.Raiffeisen

BLOCKCHAIN.INFO
blockchain.info

WESTERNUNION
wupos.westernunion

FIRST STAGE - RECONNAISSANCE
RTM Reconnaissance module checks file system to find the traces of the following financial software:

1C
1cv7.exe 1cv7l.exe 1cv8.exe

SBERBANK
wclnt.exe

FTC GPK CRYPTOPROVIDER
_ftcgpk.exe

WEBMONEY
webmoney.exe

CRYPTO WALLETS
wallet.dat wallet.dll

QIWI
qiwicashier.exe

SECOND STAGE ­ CORE MODULE

After reconnaissance module acquired and run RTM Core, it is capable of execution of the following commands:

Command

Description

Command

del-module

Uninstalls module

hosts-clear

find-files download

Scans filesystem for the specified file Uploads a specified file to the C&C

cfg-set-* screenshot

unload

Closes main window of the RTM

dns

uninstall uninstall-lock shutdown

Stops all activities and removes itself Erases MBR, removes itself Shutdowns infected host

auto-elevate reload cc

reboot hosts-add

Reboots infected host Adds records to the hosts file

get-cc botnet-id

Description
Removes all records from the hosts file Commands to manipulate RTM settings Creates a screenshot every 5 seconds Gets/sets DNS servers via the WMI UAC bypass Restarts the RTM Sets new C&C address Sends the list of the C&C addresses Sets new bot ID

SECOND STAGE ­ CORE MODULE

After reconnaissance module acquired and run RTM Core, it is capable of execution of the following commands:

Command

Description

prefix

Sets new bot prefix

connect-interval dbo-scan

Sets pause between C&C communications Scan for using banking services

kill-process

Terminates specified process

video-process video-stop msg

Starts a video recording thread Stops a video recording thread Shows a message box

THIRD STAGE ­ RTM MODULES

At the third stage additional modules are used. During the tracking of the RTM group, the following modules were detected:

Module name

Module name

Module name

1c_2_kl

chrome_hst

persist

445scan alfa_scan

lpewnd domain

pony proc_lock

anti_mse

ffa

rdp

arp_scan bdata bss_hide

flash_grab lock_ie inj_phone

lpe_evtvwr mimi prc_list

chrome_pw

mitm

stealer

TYPICAL ATTACK SCHEMES

RDP OR TEAMVIEWER
The most frequently seen attack scheme nowadays. Modified version of the TeamViewer is uploaded to the infected host, which allows to transfer money directly, for example, via the browser.
1C_2_KL MODULE
Used to be frequently used method, but almost gone right now. Modifies the 1C banking software process to modify the 1c_2_kl.txt file, which stores the payment data.
RANSOMWARE
Following the modern trends, RTM is capable of deploying a ransomware. During our monitoring of the RTM activity, at least 4 different were deployed on the compromised machines.

C&C ADDRESS COMPUTATION

LiveJournal «f72bba81c921.livejournal.com»

[<botnet-id>]<encrypted C&C address>[/<botnet-id>]

http://f72bba81c921.livejournal.com/data/rss

LIVEJOURNAL
First tracked versions of the RTM used LIVEJOURNAL blogs to store the C&C addresses.
.BIT DOMAINS
Newer versions of the RTM .bit domains as addresses of the C&C servers. .bit domain IP addresses are stored using the Namecoin technology.
BITCOIN WALLET
The newest versions of the RTM compute C&C server address using the transactions data of the exact Bitcoin wallet.

BITCOIN BASED ALGORITHM
RECON: 1BkeGqpo8M5KNVYXW3obmQt1R58zXAqLBQ CORE: 1CeLgFDu917tgtunhJZ6BA2YdR559Boy9Y

BLOCKCYPHER API
Blockcypher API is leveraged to obtain an information about the transactions of the exact wallet.
C&C ADDRESS IN TRANSACTION VALUE
After obtaining of the transaction information, RTM extracts the value of the last 2 transactions and interprets it as an IP address octets.
NO ADDITIONAL TRANSACTIONS DATA CHECK
RTM hasn't been checking which wallet the currency was received from, which made it possible to sinkhole the botnet.

BITCOIN BASED ALGORITHM
Examples for better understanding

0x8A67

103.138

0xC85B

91.200

91.200.103.138

BITCOIN BASED ALGORITHM
Examples for better understanding: 5th December

91.200.103.138

TRACKING C&CS

C&C IS JUST A PROXY

access_log /dev/null; error_log /dev/null;

server {

listen

*:80;

bought

location /index.php {

proxy_set_header Accept-Encoding "";

#proxy_set_header Host $http_host;

#proxy_http_version 1.1;

proxy_buffering off;

proxy_set_header X-Real-IP $remote_addr; proxy_set_header X-Forwarded-For $remote_addr;

proxy_connect_timeout 600;

proxy_send_timeout

600;

proxy_read_timeout

600;

send_timeout

600;

proxy_pass http://91.200.103.39/index.php; }

location / { return 404; }

}

#################################################

SINK-HOLING
All C&Cs are proxies New C&C is deployed every 2-3
days No validation of a transaction source

Deploy a server which redirects data to the actual C&C server
Run a sniffer and collect all the traffic
Write a code that decrypts a traffic Make transactions right after the
adversary Identify victims and notify them
Provide collected data to LE

TESTING ATTEMPT

Transaction should be > 0.00000540 Higher fee, faster the confirmation

5.2.67.50 0x205 -> 0.00000517 < 0.00000540

DAY X

1 confirmation

1 confirmation

Not confirmed

2 confirmations
· We transferred money with the minimal fee. · Every transaction should be confirmed by some amount of other members of the blockchain. Otherwise it will be unconfirmed and can not be observed. · Our transferes came to the wallet in wrong sequence

OVERALL STATISTIC

5
LE of different countries were involved

5368
Communicating hosts

3762
Compromised machines identified

5
Years the botnet was alive

6
Different languages were installed on bots

2
Years took to collect enough evidences and make arrests

GROUPS EVOLUTION

FIRST STAGE ­ RECONNAISSANCE MODULE
Phishing emails contain a reconnaissance module, which checks if any indicators of financial activity is presented on the infected host.
SECOND STAGE ­ RTM CORE
If indicators of the financial activity were found, RTM core module is downloaded from the C2 server. In other case some common malware, like Pony Stealer is downloaded.
THIRD STAGE ­ RTM MODULES
RTM Core collects additional information about the infected host, downloads and executes modules, which are used for the network reconnaissance, lateral movement and money stealing.

To fight effectively against cybercrime LE agencies
should collaborate

