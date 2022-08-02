© 2018 SPLUNK INC.

From Risk to Intelligence ­ How Real-Time Visibility and Automation Using Splunk Helps Rationalize and Mitigate ICS Threats

Sebastien Tricaud, stricaud@splunk.com Principal Solutions Architect

Chris Duffey, cduffey@splunk.com Senior IoT Practitioner

October 2018 | Version 0.0.7

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

About Me
Sebastien Tricaud / Principal Solutions Architect @splunk

© 2018 SPLUNK INC.

 At Splunk for almost 6 years!  Worked on a S2S Protocol to proxy data between forwarders and indexers  Wrote the first Adaptive Response Prototype  Wrote a way to write Javascript along with SPL  Former Maintainer of Linux PAM, the Linux Authentication Layer  Major Contributor of the first SIEM, Prelude IDS back in 1998  Honeynet Project Board Member

My Fun Lab

© 2018 SPLUNK INC.

About Me
Chris Duffey / Senior IoT Practitioner @splunk

© 2018 SPLUNK INC.

 10+ years experience in SCADA
 Worked at major oil & gas pipeline company with over 50k+ of pipeline across the US
 Worked as a SCADA Developer before transitioning to Infrastructure & Cyber Security role
 Deployed Splunk on pipeline system for:
· ICS Monitoring · ICS Cyber Security
 Focused Splunk deployments in OT environments as consultant

© 2018 SPLUNK INC.
Introduction

Cyber

Goal

Security

Running Operation

Safety

© 2018 SPLUNK INC.

Cyber Security

Where anyone starts

Running Operation

Safety

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Cyber Security

Running Operation

Safety

Priority #1

Cyber Security

© 2018 SPLUNK INC.
Last Step?

Running Operation

Safety

OT Cyber Security
 Challenges · Low visibility · Lifecycles of system 15+ years · No pro-active measures (safety first) · Limited OT Cyber Security products · Vendor approval · Patching slow to deploy · No scanning of equipment

© 2018 SPLUNK INC.

OT Cybersecurity
 OT and IT Convergence · Increased connectivity and need to share · Cloud computing · Common hardware/software packages (e.g. Windows, TCPIP) · USB ports everywhere · Offshore reliance · Direct internet access to PLCs · Complexity increasing · Lack of workforce · OT vs IT mentality

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
ICS Threats Landscape
Increasing Sophistication

© 2018 SPLUNK INC.

Incidents
 STUXNET · Target and focused on specific equipment and very specialized
 Dragonfly/HAVEX · Primarily espionage and utilized OPC to map out environment
 BLACKENERGY · Exploited specific HMI interfaces · Allowed groups to see graphical representations of the systems · Pivoted from IT to OT · ~225k customers left without power for 6 hours · Some sites lost automated control for up to a year · Malware combined with direct interaction

© 2018 SPLUNK INC.

Incidents
 CRASHOVERRIDE aka, Industroyer · Ukrainian Power Grid · Adversaries showed knowledge of how electric grids function · Malware Framework targeting electric grids · Not unique to vendor or system · Modular · Focused on disruption and destruction not espionage

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
How to understand ICS Security
When honeypots get in the mix!

Why Honeypots?

© 2018 SPLUNK INC.

"A Honeypot is a system designed to act as a decoy to lure cybercriminals to understand tactics and motives involved in computer and network attacks"

 Believe a paper or believe data?
 Useful content == gathered from data
 Lots of details, papers, challenges, code, information on the Honeynet Project webpage: http://www.honeynet.org

Example, Gas Station Honeypot

© 2018 SPLUNK INC.

 The GasPot Experiment: Unexamined Perils in UsingGas-Tank-Monitoring Systems
 By Kyle Wilhoit and Stephen Hilt
 Talk given at BlackHat in 2015  https://documents.trendmicro.com/assets/wp/wp_the_gaspot_experiment.pdf
"An explosion rattled the sleepy town of Bayamon, Puerto Rico, in the wee hours of 23 October 2009
[1]. The fire blazed for three days, burning down houses and causing thick black clouds of gasoline-fueled smoke and forcing residents to flee their homes. The culprit behind the catastrophe? Investigators said it was a glitch in the facility's computerized monitoring system. A storage tank was getting refilled with gasoline from a fuel ship docked along the San Juan harbor. Since the tank's meter malfunctioned, the
" petrol kept overflowing until it met an ignition source. The burning district became the aftermath.

© 2018 SPLUNK INC.
Nmap already provides a Guardian AST scanner!

Conpot, the ICS Honeypot
 Available at: https://github.com/mushorg/conpot  Written by Lukas Rist in 2013  Works with a templating system  Creates /var/log/conpot/conpot.log  Simulates Siemens S7-200 PLC, Guardian AST tank monitor

© 2018 SPLUNK INC.

Gas Tank Monitor Honeypots

© 2018 SPLUNK INC.

 Only tied to a given class of devices  Need to create QUICKLY a honeypot to simulate a given environment  No time to write/debug code

Siemens S7-200 Communication

Interfaces  Profinet / Industrial Ethernet  Industrial Wireless LAN  Profibus  AS-Interface  WAN  Multi-Point Interface (MPI)  Point-to-Point Interface (PPI)  KNX/EIB (KONNEX)

Services  FTP  Email  SNMP  OPC  Profinet IO  Profinet CBA  S7  PG/OP

© 2018 SPLUNK INC.

Bridging PLCs with IDS
 Hard/Dangerous/Prohibited to install a sensor on a PLC  Probing a PLC can cause it to malfunction
· And not necessary right now, but in a random amount of time...  Want to take the risk?
 Network IDS to the rescue

© 2018 SPLUNK INC.

Here comes Suricata

© 2018 SPLUNK INC.

Image courtesy of Eric Leblond

© 2018 SPLUNK INC.
Changing Suricata to transform it into a honeypot

Strategy to send a response
 Packet matches a signature  Fetch the SID (Signature ID)  Open the file (prefix)/lib/suricata/response/sid  Send raw packet(s) from the opened sid  Log it, with the flow-id from Suricata to understand sessions

© 2018 SPLUNK INC.

How to Capture and Respond?
Using libpcap?

© 2018 SPLUNK INC.

Nope, Using Netfilter Queue, to intercept!

Suricata Apps Protocols Decoding

 HTTP  SSL  TLS  SMB  DCERPC  SMTP  FTP  SSH  DNS  Modbus

 ENIP/CIP  DNP3  NFS  NTP  TFTP  NFS  Kerberos  IKEv2  DHCP ...

© 2018 SPLUNK INC.

Suricata and Modbus

© 2018 SPLUNK INC.

Starting from Scratch
Capture any Modbus Event

© 2018 SPLUNK INC.

alert modbus any any -> any 502 (msg:"Modbus Traffic Detected"; flow:to_server; sid:999042; rev:1;)

# suricata -D -c /etc/suricata/suricata.yaml -s simple-modbus.rules -i eth0
# tail -f /var/log/suricata/fast.log 08/30/2018-20:00:22.156169 [**] [1:999042:1] Modbus Traffic Detected [**] [Classification: (null)] [Priority: 3] {TCP} 4.14.104.185:62330 -> 37.187.73.159:502

Capture
>>> from pymodbus.client.sync import ModbusTcpClient >>> client = ModbusTcpClient("myserver") >>> client.write_coil(1, True)
# tshark -f 'tcp port 502' -i eth0

© 2018 SPLUNK INC.

Request

Exchange

Response

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Adding options to Suricata rules to go fine grain
alert modbus any any -> any 502 (msg:"Modbus Traffic Detected"; modbus: unit 42, function 4, subfunction 4; flow:to_server; sid:999042; rev:1;)
Read more: https://suricata.readthedocs.io/en/latest/rules/modbus-keyword.html

Results

© 2018 SPLUNK INC.

 During the month of July-August 2018: · 525 connections established · From 3 different IP addresses · The most active from "Kudelski Security Innovation", a Security Research Team · Another from burger.census.shodan.io ; a security Scanner
 People ARE scanning actively for Modbus (and other ICS-related protocols ;))

Benefits
 Suricata allows you to understand your security posture  Ability to create custom protocols decoder in Rust, lots of examples!  Your network security is tailored for your environment  There are so many devices it is important to emulate them rapidly

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Splunk Essentials for ICS Security and Compliance
All of it, in just one App!

NIST 800-82 Methodology
 Step 1: Categorize Information System  Step 2: Select Security Controls  Step 3: Implement Security Controls  Step 4: Assess Security Controls  Step 5: Authorize Information System  Step 6: Monitor Security Controls

© 2018 SPLUNK INC.

https://nvlpubs.nist.gov/nistpubs/specialpublications/nist.sp.800-82r2.pdf

ICS US CERT
Top Threats

© 2018 SPLUNK INC.

https://ics-cert.us-cert.gov/sites/default/files/Annual_Reports/FY2016_Industrial_Control_Systems_Assessment_Summary_Report_S508C.pdf

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Conclusion

© 2018 SPLUNK INC.

Key Takeaways
Splunk Enables Securing your Industrial Assets

1. Passive Monitoring Works!
2. Splunk core feature of indexing any type
of Data is a strong benefit for OT Security
3. Splunk Essentials for ICS Security helps
you to get started and gain in maturity (Available on: https://splunkbase.splunk.com/app/4150/)

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

