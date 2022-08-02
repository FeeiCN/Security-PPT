µMIMOSAWRITERROUTER

µMIMOSAWRITERROUTER
Abusing EPC on Cisco Routers to Collect Data.

Joaquim Espinhara
@jespinhara

Rafael Silva
@rfdslabs

µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

Why this name?
www.nsanamegenerator.com
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

Agenda
1 / About Us 2 / Introduction & Motivation 3 / EPC / Evil / How EPC works / Abusing EPC 4 / Mimosa / Our approach / Demo / Potential 5 / Threat Intelligence 6 / Future 7 / Conclusion!
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

About us
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

1 / About us
Rafael Silva aka @rfdslabs
CTO at @EstuárioTI Twitter @rfdslabs
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

1 / About us
Joaquim Espinhara aka @Jespinhara
Senior Security Consultant at @securusglobal
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

Introduction & motivation
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

2 / Introduction & motivation
· We are NOT exploiting a 0day on Cisco devices.!
· We are aware of other methods, like GRE tunnels, port mirroring, lawful interception, etc.!
· This is an automated tool to help pentesters / Threat intelligence to collect interesting data in a controlled environment.!
· This is really useful tool for threat intelligence data gathering.!
· You have to get ENABLE privilege on the router to use Mimosa.! !
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

2 / Introduction & motivation
2009 / @jespinhara @h2hc about GRE-TUNNELS. 2009 / @rfdslabs tell about EPC to @jespinhara. 2010 / Hacking the Planet... 2011 / Hacking the Planet... 2012 / Hacking the Planet... 2013 / Hacking the Planet... 2014 / Hacking the Planet... 2015 / Mimosa released. !
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

EPC
Embedded Packet Capture
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

3 / EPC
The ability to capture IPv4 and IPv6 packets. A flexible method for specifying the capture buffer size and type. EXEC-level commands to start and stop the capture. Show commands to display packet contents on the device. Facility to export the packet capture in PCAP format. Extensible infrastructure for enabling packet capture points.!
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

3 / EPC / Abuse!
The ability to capture IPv4 and IPv6 packets.
· Sniffing
A flexible method for specifying the capture buffer size and type.
· Space to store sniffing content in router memory.
EXEC-level -> enable mode start and stop the capture.
· Need some hacking to Enable, cisco/cisco.
Show commands to display packet contents on the device.
· Sniffing on the fly.
Facility to export the packet capture in PCAP format.
· Make your pcap-farm-server.
Extensible infrastructure for enabling packet capture points.!
· All Your Network Are Belong to Us.
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

3 / EPC / How EPC Works!
Define a Capture Buffer and Size and Type (Linear OR Circular):
1!
Define a Capture point (interfaces and directions):
2!
Associate the capture point to our buffer:
3!
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

3 / EPC / How EPC Works!
Start / stop the capture point:
4!
Linear / When the buffer is full, the capture will stop.
Circular / The buffer will be overwritten with new packets.!
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

3 / EPC / How EPC Works!
Export the capture in PCAP format to a remote location:
5!
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

3 / EPC / How EPC Works!
Sniffing on the fly:
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

3 / EPC / How EPC Works!
The main problem is export the capture to a REMOTE location. No way to disable the EPC OR block the export to a remote location L
This is a feature, is not a BUG J!
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

Mimosa
Framework
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

4 / Mimosa / Our approach!

µMimosa C&C

Routers

µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

Collectors

µMimosa Parser

4 / Mimosa Framework!
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

4 / Mimosa / Detect Threats!

Tshark!

User Agents (Client Side Exploitation)
tshark -Y 'http contains "User-Agent:"' -T fields -e http.user_agent -nlr pcapfile!

µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

4 / Mimosa / Detect Threats!

Tshark!

HTTP Requests
tshark -T fields -e http.host -e http.request.uri -Y 'http.request.method == "GET"' -nlr pcapfile!

µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

4 / Mimosa / Detect Threats!

Tshark!

Geo IP · tshark -r pcapfile -o "ip.use_geoip:TRUE" -o column.format:""IP_Flags",
"%Cus:ip.flags". "IP_src", "%Cus:ip.src". "IP_dst", "%Cus:ip.dst", "CITY", "%Cus:ip.geoip.city", "Latitude", "%Cus:ip.geoip.lat""!
All Protocols · tshark -i2 -nqzio,phs ­r pcapfile!
DNS Requests (Virus Total)
· !tshark -nn -e ip.src -e dns.qry.name -T fields -Y "dns" ­r pcaptile! User Agents (Client Side Attacks)!! · tshark -Y 'http contains "User-Agent:"' -T fields -e http.user_agent ­r pcapfile!

µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

4 / Mimosa / Detect Threats!

Tshark!

FTP Creds!

· tshark -Y "(ftp.response.code == 230 || ftp.request.command == "PASS") ||

(ftp.request.command == "USER")" -nlr pcapfile!

!

POP Creds!

· tshark -Y "(pop.request.command == "PASS") || (pop.request.command ==

"USER")" ­nlr pcapfile!

Cookies (Hijack)! · tshark -r pcapfile -Y 'http.cookie' -z
"proto,colinfo,http.content_type,http.content_type" -z "proto,colinfo,http.content_length,http.content_length" -z "proto,colinfo,http.cookie,http.cookie"!

µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

4 / Mimosa / Detect Threats!
· Extract Files With Bro!

Carving With bro!

µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

4 / Mimosa / Results!
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

4 / Mimosa / Results!
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

4 / Mimosa / Results!
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

4 / Mimosa / Results!
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

4 / Mimosa / Results!
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

4 / Mimosa / Results!
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

4 / Mimosa / Results!
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

4 / Mimosa / Results!
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

4 / Mimosa / Results!
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

5 / Mimosa / Potential!
Some numbers:
· 300 Routers · 1MB per hour · 24hr per day · 365 days per year · 1hr = 300 MB · 24hr = 7200 = 7.2 GB · 365 = 2628000 = 2566,40625 GB = 2,506256104 TB!
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

Future
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

6 / Future
Add support to another devices, such as mikrotik and Juniper. A dashboard for better visualization of the sensitive data. Other attack options like bruteforce, CVE-XXXX. PCAP Automatic Analysis (pyshark). Mimosa farm daemon.!
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

Mimosa
https://github.com/rfdslabs/Mimosa-Framework
Download and coding with us.! Python Based.!
µMIMOSAWRITERROUTER / HITB 2015 @ Amstd !

Trank you!

Rafael Silva
rafa.silva@gmail.com @rfdslabs!

Joaquim Espinhara
espinhara.net@gmail.com @jespinhara!

Ulisses Albuquerque @urma Julio Auto @julioauto Luiz Eduardo @effffn!

Dhillon and Melinda Julio Cesar Fort @juliocesarfort NSA for the insight!

