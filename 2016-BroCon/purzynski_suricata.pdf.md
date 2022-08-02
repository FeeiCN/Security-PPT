Bro Befriends Suricata

23/09/16 20:23

BRO BEFRIENDS SURICATA SURICATA AND BRO FIGHTING MALWARE TOGETHER
Created by Michal Purzynski / @michalpurzynski
Scripts are here - https://github.com/michalpurzynski

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 1 of 47

Bro Befriends Suricata

23/09/16 20:23

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 2 of 47

Bro Befriends Suricata

23/09/16 20:23

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 3 of 47

Bro Befriends Suricata

23/09/16 20:23

WHOAMI
Part of the team doing enterprise information security We don't do product security We monitor our infrastructure
We respond to security investigations and incidents We help developers design and implement security controls
We build tools & services to keep users secure "A human wireshark". A threat. Management.

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 4 of 47

Bro Befriends Suricata

23/09/16 20:23

NSM IN MOZILLA
9 Offices 3 Continents 1 Datacenter X AWS
Around 20 sensors and who knows how many workers :-) From 2012. Netoptics, now Arista.

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 5 of 47

Bro Befriends Suricata

23/09/16 20:23

MOZILLA CONTRIBUTIONS TO BRO IDS
PR. Tons of PR. Largest (problematic) installation ever. AUS?
Heka-Lua scripts for parsing logs Tons of bug reports (SSL, hello Bugzilla)
76 scripts - 4200 LoC - OpenSource $$$$ 200 000
Myricom plugin (+Seth) Ansible playbooks - OpenSource

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 6 of 47

Bro Befriends Suricata

23/09/16 20:23

WE HAVE A SECRET
I WILL SHARE A SECRET
IS SHARED SECRET STILL A SECRET?

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 7 of 47

Bro Befriends Suricata

23/09/16 20:23

BRO IS NOT THE ONLY IDS WE USE!!
We use Suricata too

Actually, a whole mob

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 8 of 47

Bro Befriends Suricata

23/09/16 20:23

BTW - WHAT IS AN IDS?
An intrusion detection system (IDS) is a device or so"ware application that monitors network or system activities for
malicious activities or policy violations and produces reports to a management station.

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 9 of 47

Bro Befriends Suricata

23/09/16 20:23

KEYWORDS
malicious activity <-- known indicators policy violations <-- known rules Missing? 'anomalies' <-- unknown No perfect tool for the job
NSA? FSB? Ransomware and old Java? Risk managent FTW!!

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 10 of 47

Bro Befriends Suricata

23/09/16 20:23

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 11 of 47

Bro Befriends Suricata

CAN'T GET ENOUGH

23/09/16 20:23

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 12 of 47

Bro Befriends Suricata

SPEAKING ABOUT TOOLS

23/09/16 20:23

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 13 of 47

Bro Befriends Suricata
SPEAKING ABOUT TOOLS

23/09/16 20:23

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 14 of 47

Bro Befriends Suricata

SPEAKING ABOUT TOOLS

23/09/16 20:23

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 15 of 47

Bro Befriends Suricata

SPEAKING ABOUT TOOLS

23/09/16 20:23

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 16 of 47

Bro Befriends Suricata

23/09/16 20:23

SPEAKING ABOUT TOOLS
{ "category": "execve", "processid": "0", "receivedtimestamp": "2014-03-01T15:22:54.457658+00:00", "severity": "INFO", "utctimestamp": "2014-03-01T15:22:54+00:00", "tags": ["audisp-json", "2.0.0", "audit"], "timestamp": "2014-03-01T15:22:54+00:00", "hostname": "admin1a.private.scl3.mozilla.com", "mozdefhostname": "mozdef2.private.scl3.mozilla.com", "summary": "Execve: nmap 63.245.214.53 -p22 -Pn", "processname": "audisp-json", "details": { "fsuid": "3407", "tty": "(none)", "uid": "3407", "process": "/usr/bin/nmap", "auditkey": "exec", "pid": "28723", "processname": "nmap", "session": "75981", "dev": "fd:01", "sgid": "3407", "auditserial": "6493840", "inode": "4328281", "ouid": "0", "ogid": "0", "suid": "3407", "originaluid": "3407", "gid": "3407", "originaluser": "mpurzynski", "cwd": "/home/mpurzynski", "parentprocess": "bash", "euid": "3407", "path": "/usr/bin/nmap", "rdev": "00:00", "fsgid": "3407", "egid": "3407", "command": "nmap 63.245.214.53 -p22 -Pn", "mode": "0100755", "user": "mpurzynski" } }
https://log.nusec.eu/brocon2016/?print-pdf#/

Page 17 of 47

Bro Befriends Suricata

23/09/16 20:23

BASIC IDS FUNCTIONALITY
Stream reconstruction Protocol level analysis
Pattern recognition Decompressing content (HTTP)

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 18 of 47

Bro Befriends Suricata

23/09/16 20:23

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 19 of 47

Bro Befriends Suricata

23/09/16 20:23

SURICATA IN 2016
IDS and IPS (nfq) Multi threading Protocol identification (port independent) File identification and extraction, hash calculation Deep TLS analysis Application layer logs (in JSON) Lua scripting

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 20 of 47

Bro Befriends Suricata

23/09/16 20:23

alert http $HOME_NET any -> $EXTERNAL_NET any (msg:"ET CURRENT_EVENTS Unknown
Malicious Second Stage Download URI Struct Sept 15 2015"; flow:established,to_server; urilen:>46; content:".php?id="; http_uri;
fast_pattern:only; content:"&rnd="; http_uri; pcre:"/\.php\?id=[0-9A-F] {32,}&rnd=\d+$/U"; content:!"Referer|3a|"; http_header; classtype:trojan-activity;
sid:2021787; rev:2;)
LOOK MUM - NO PORTS!!

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 21 of 47

Bro Befriends Suricata

23/09/16 20:23

alert http $EXTERNAL_NET any -> $HOME_NET any (msg:"ET CURRENT_EVENTS Cryptowall
docs campaign Sept 2015 encrypted binary (1)"; flow:established,to_client;
file_data; content:"|23 31 f9 4f 62 57 73 67|"; within:8;
flowbits:set,et.exploitkitlanding; classtype:trojan-activity; sid:2021778;
rev:2;)
MATCHING FILE_DATA LIKE A B^HPRO

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 22 of 47

Bro Befriends Suricata

23/09/16 20:23

EVENT LOGS

{ "timestamp": "2009-11-24T21:27:09.534255", "event_type": "alert", "src_ip": "192.168.2.7", "src_port": 1041, "dest_ip": "x.x.250.50", "dest_port": 80, "proto": "TCP", "alert": { "action": "allowed", "gid": 1, "signature_id" :2001999, "rev": 9, "signature": "ET MALWARE BTGrab.com Spyware Downloading Ads", "category": "A Network Trojan was detected", "severity": 1 }
} "http": {
"hostname": "direkte.vg.no", "url":".....", "http_user_agent": "<user-agent>", "http_content_type": "application\/json", "http_refer": "http:\/\/www.vg.no\/", "http_method": "GET", "protocol": "HTTP\/1.1", "status":"200", "length":310 } "dns": { "type": "query", "id": 16000, "rrname": "twitter.com", "rrtype":"A" } "dns": { "type": "answer", "id":16000, "rrname": "twitter.com", "rrtype":"A", "ttl":8, "rdata": "199.16.156.6" }
</user-agent>

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 23 of 47

Bro Befriends Suricata

LUA IS COOL. AND RICH, TOO.

23/09/16 20:23

--[[ Detection for CVE-2016-0056 expects DOCX
This lua script can be run standalone and verbosely on a Flash file with echo "run()" | luajit -i script name docx file
Francis Trudeau With no help from Darien even though he loves LUA. --]]
require("zip")
function init (args) local needs = {} needs["http.response_body"] = tostring(true) return needs
end
--http://snippets.luacode.org/?p=snippets/String_to_Hex_String_68 function HexDumpString(str,spacer) alerrtethutrtnp ($EXTERNAL_NET any -> $HOME_NET any (msg:"ET LUAJIT MS Office Word Do
string.gsub(str,"(.)", function (c)
return string.format("%02X%s",string.byte(c), spacer or "\\") end) ) end
function docx_handler(t,verbose) rtn = 0 tmpname = os.tmpname()
tmp = io.open(tmpname,'w') tmp:write(t) tmp:close()
z,err = zip.open(tmpname) local buffers = {} if z then
for w in z:files() do if string.find(w.filename,"word/_rels/webSettings.xml.rels",1,true f = z:open(w.filename); u = f:read("*all") --convert to lowercase u = u:lower() f:close() if (verbose==1) then print("Checking " .. w.filename) end --search for unique content first for performance, all matc if string.find(u,".docx",0,true) and string.find(u,"http://

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 24 of 47

Bro Befriends Suricata

23/09/16 20:23

CUSTOM HEADER MISSING?
Adding new protocol level fields - C code changes Something invisible from Lua - C code changes
New input like Myricom/Netmap - C code changes Sometimes add on functionality presents challenges

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 25 of 47

Bro Befriends Suricata

23/09/16 20:23

module MozillaHTTPHeaders;

export { redef record Intel::Info += { ## True client IP address added by our ZLBs cluster_client_ip: string &log &optional; };

redef record Intel::Seen += { ## Log value of the X-CLUSTER-CLIENT-IP ## True client IP address added by our ZLBs cluster_client_ip: string &log &optional;
};

redef record HTTP::Info += { ## Log value of the X-CLUSTER-CLIENT-IP ## True client IP address added by our ZLBs cluster_client_ip: string &log &optional; ## Log which backend server handled the connection. ## Might be useful to know where to look for more logs or which server backend_server: string &log &optional;
};

redef enum Intel::Where += { HTTP::IN_X_CLUSTER_CLIENT_IP_HEADER, HTTP::IN_X_BACKEND_SERVER_HEADER,
};

## A boolean value to determine if you log the value of X-CLUSTER-CLIENT-IP const log_cluster_client_ip = T &redef; ## A boolean value to determine if you log the value of X-BACKEND-SERVER he const log_backend_server = T &redef; }

event Intel::match(s: Intel::Seen, items: set[Intel::Item]) {
if ( ( s?$conn ) && ( s$conn?$http ) && ( s$conn$http?$cluster_client_ip ) s$cluster_client_ip = s$conn$http$cluster_client_ip;
}

event http_header(c: connection, is_orig: bool, name: string, value: string) {
if (!c?$http) return;

if (name == "X-CLUSTER-CLIENT-IP" ) {

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 26 of 47

Bro Befriends Suricata

23/09/16 20:23

I JUST COULD NOT RESIST

Intel Framework Logs
Scripting

Bro
Extend it - custom fields
Rich, easy to extend
Bro IS scripting

Suricata Hardcoded fields
Hardcoded
Lua - hardcoded but powerful

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 27 of 47

Bro Befriends Suricata

23/09/16 20:23

ON THE OTHER HAND

Bro

Suricata

Care and feed Lots

Just runs

Performance A few Gbit/sec 10? 20? 40Gbit/sec?

20 000 rules

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 28 of 47

Bro Befriends Suricata

23/09/16 20:23

WHAT ARE WE HUNTING FOR?
With Suricata. And Why. Can I do it with Bro?

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 29 of 47

Bro Befriends Suricata

23/09/16 20:23

CnC - insane detection capabilities, tons of rules
2016-07-15T17:57:58+0000 CT7wYb3MaOc2KNL6P 10.252.28.186 60158 70.38.27.158 80 1 GET
support.pckeeper.com /ping.html - PCKAV (1.1.1049.0) 6.2.9200.0 x64 0 6 200 OK - (empty) - - - - - FHii7k1cPGiCRJdDvk - - -
1.1
Where can we send this function? Nowhere. It stays here.

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 30 of 47

Bro Befriends Suricata

23/09/16 20:23

Interesting User-Agents
alert http any any -> any any (msg:"SURICATA NetSession in http_user_agent"; content:"NetSession"; http_user_agent; sid:2500024; rev:1;)
Where can we send this function?
event http_header(c: connection, is_orig: bool, name: string, value: string)

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 31 of 47

Bro Befriends Suricata

23/09/16 20:23

Interesting DNS queries
alert udp any any -> any 53 (msg:"SURICATA DNS Query to a Suspicious *.ws Domai

alert http any any -> any any (msg:"SURICATA HTTP Request to a Suspicious *.to

alert tls $EXTERNAL_NET any -> $HOME_NET any (msg:"ET INFO SUSPICIOUS SSL Cert <p></p>
Where can we send this function?
event http_header(c: connection, is_orig: bool, name: string, value: string)
event dns_*_reply()
ssl_extension_server_name(c: connection, is_orig: bool, names: string_vec)

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 32 of 47

Bro Befriends Suricata

23/09/16 20:23

SSL_* FUNCTIONS LET US FINGERPRINT AND MATCH ON PARTS OF SSL HANDSHAKE

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 33 of 47

Bro Befriends Suricata

23/09/16 20:23

Spoofed SSL certificates
alert tls any any -> any any (msg:"SURICATA SSL Gmail certificate not issued by
alert tls any any -> any any (msg:"SURICATA SSL Google certificate not issued b
Where can we send this function? event log_ssl(rec: SSL::Info)
Or somewhere else. Ask Johanna ;-)

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 34 of 47

Bro Befriends Suricata

23/09/16 20:23

Private and public keys in clear
alert http any any -> any any (msg:"SURICATA FILE plaintext PEM RSA private key
alert http any any -> any any (msg:"SURICATA FILE plaintext OpenSSH RSA1 privat
Where can we send this function? Nowhere. It stays there.

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 35 of 47

Bro Befriends Suricata

23/09/16 20:23

Known cleartext malicious communication - think DFIR
alert udp any any -> any 53,1024 (msg:"example_message"; flow:to_server; conten
Where can we send this function? Nowhere. It stays there.

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 36 of 47

Bro Befriends Suricata

23/09/16 20:23

Protocol anomalies
alert tcp any any -> any 80 (msg:"SURICATA non-HTTP on TCP port 80"; flow:to_se
alert tcp any any -> any 53 (msg:"SURICATA non-DNS-TCP on TCP port 53"; flow:
Two kinds of rules X on non-X port not-X on X-port
Where can we send this function? DPD, maybe?

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 37 of 47

Bro Befriends Suricata

23/09/16 20:23

event protocol_confirmation(c: connection, atype: Analyzer::Tag, aid: count) event protocol_violation(c: connection, atype: Analyzer::Tag, aid: count)

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 38 of 47

Bro Befriends Suricata

IS THIS A FALSE POSITIVE?

23/09/16 20:23

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 39 of 47

Bro Befriends Suricata

IS THIS A FALSE POSITIVE?

23/09/16 20:23

ET INFO Executable Retrieved With Minimal HTTP Headers - Potential Second Stage ET POLICY PE EXE or DLL Windows file download ET POLICY PE EXE or DLL Windows file download ET POLICY PE EXE or DLL Windows file download ET POLICY PE EXE or DLL Windows file download ET POLICY PE EXE or DLL Windows file download ET POLICY PE EXE or DLL Windows file download ETPRO MALWARE Win32/PCKeeper PUP Activity ETPRO MALWARE Win32/PCKeeper PUP Activity ET POLICY PE EXE or DLL Windows file download ET MALWARE Possible FakeAV Binary Download ET TROJAN AntiVirus exe Download Likely FakeAV Install ET INFO EXE IsDebuggerPresent (Used in Malware Anti-Debugging) ET INFO EXE - Served Attached HTTP ET MALWARE Win32/InstallCore Initial Install Activity 1 ET MALWARE Win32/InstallCore Initial Install Activity 1 ETPRO MALWARE Win32/InstallCore Initial Install Activity 2 ET POLICY PE EXE or DLL Windows file download
ET INFO LEiXkEe-lySearvterduAettpaochseidtiHvTeTP. Likely is not enough.
Trust matters.

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 40 of 47

Bro Befriends Suricata

23/09/16 20:23

WHAT IF YOU DON'T KNOW?

False or True positive? Who that is? IP -> MAC -> User

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 41 of 47

Bro Befriends Suricata

23/09/16 20:23

CONN.LOG - DNS.LOG - HTTP.LOG - SSL.LOG - X509.LOG RADIUS.LOG - DHCP.LOG

2016-07-15T17:39:54+0000 C4uKjW65TBDf4szi5 10.252.28.186 58430 2016-07-15T17:39:56+0000 Cg4wDIyAY57iEt8h8 10.252.28.186 58439 2016-07-15T17:39:56+0000 Cg4wDIyAY57iEt8h8 10.252.28.186 58439 2016-07-15T17:39:59+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:39:59+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:39:59+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:00+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:00+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:00+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:00+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:39:59+0000 CJkoAg4fmQ2KRPGT9c 10.252.28.186 58462 2016-07-15T17:40:00+0000 CJkoAg4fmQ2KRPGT9c 10.252.28.186 58462 2016-07-15T17:40:00+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:01+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:01+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:01+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:01+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:02+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460
22001166In--00f77e--c1155tTTi11o77n::4400c::o00n22++f00i00r00m00 edCCEMM22nVVdhh11ccUhhCCsZZevvrJJXXSiiaaeMMr88vic11e00s..22u5522n..l22e88a..11s88h66 ed5588446600
2016-07-15T17:40:02+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:01+0000 CJkoAg4fmQ2KRPGT9c 10.252.28.186 58462 2016-07-15T17:40:03+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:03+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:03+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:03+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:03+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:03+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:04+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:04+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:04+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:04+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:04+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:05+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:05+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:05+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:05+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:05+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:26+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:26+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:26+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:26+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:35+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:35+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:36+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460 2016-07-15T17:40:36+0000 CM2Vh1chCZvJXiaM8 10.252.28.186 58460

54.210. 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 205.251 205.251 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 205.251 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6 23.22.6

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 42 of 47

Bro Befriends Suricata

23/09/16 20:23

THE POWER OF CONTEXT
XCodeGhost detected. Multiple rules triggered. IP from a guest network. Anonymous to me. Isolated office. What if
Mozillian?

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 43 of 47

Bro Befriends Suricata

23/09/16 20:23

ETPRO

2 ET TROJAN 2 ET TROJAN 2 ET TROJAN

TROJAN

XcodeGhost XcodeGhost XCodeGho

XCodeGhost CnC M2

CnC

DNS

Beacon

Checkin

Lookup

bro@nsm1-mtv2:/nsm/bro/logs$ zcat 2016-08-22/dns.* | bro-cut id.orig_h query an (...) 1 10.252.35.219 init.icloud-analysis.com 5.79.71.205,5.79.71.225,85.17.31. 2 10.252.35.219 g1.163.com 123.58.176.66,123.58.176.65,123.58.179.210,123.58 2 10.252.35.219 music.163.com 103.251.128.85,103.251.128.86

10.252.35.219 POST 10.252.35.219 POST

init.icloud-analysis.com init.icloud-analysis.com

/ - %E7%BD%91%E6%98%93 / - %E7%BD%91%E6%98%93

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 44 of 47

Bro Befriends Suricata

23/09/16 20:23

WHO ARE YOU? HTTP logs - User Agent iPhone; iPhone OS 9.3.4;
zh-Hans_US
HTTP / SSL / DNS logs - multiple Mandarin apps DHCP logs - user visits MTV2 irregularly
Opportunistic connections to the Guest WiFi. Little to no traffic.
Badging system logs!!

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 45 of 47

Bro Befriends Suricata

23/09/16 20:23

TUNNING

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 46 of 47

Bro Befriends Suricata

23/09/16 20:23

Developer looking at production logs a"er a regression with downtime. Oil canvas, circa 1580
Overheard: looks like Michal

https://github.com/michalpurzynski @MichalPurzynski

https://log.nusec.eu/brocon2016/?print-pdf#/

Page 47 of 47

