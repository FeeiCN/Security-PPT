Less Configuration, More Security:
Automated discovery of asset- and user roles
Stanislav Miskovic, PhD, Principal Data Scientist Prasoon Shukla, Sr. Product Manager Dimitrios Terzis, PhD, Principal Software Engineer
October 2018

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.
The Problem:
Second guessing your own company

Security = Knowing Your Company Well

© 2018 SPLUNK INC.

Applications Finance

Online Services
Databases

Networks

VoIP

People Activities

Private Cloud
Public Cloud

Having Data Security

Applications Finance

Online Services
Databases

Networks

VoIP

People Activities

Private Cloud
Public Cloud

© 2018 SPLUNK INC.

Organized Data Security

Applications Finance

Online Services
Databases

Networks

VoIP

People Activities

Private Cloud
Public Cloud

© 2018 SPLUNK INC.

Applications Finance

THE Security Question
Which entities act oddly?
Online Services
Databases

Networks

VoIP

People Activities

Private Cloud
Public Cloud

z

UBA

y

x

© 2018 SPLUNK INC.

ML Security
Illustration: Device Clustering

Users

Webmail server

© 2018 SPLUNK INC.

Profiling + ML Security

Internet gateway
Network connections

© 2018 SPLUNK INC.
Obstacles:
Profiling challenges

Profiling ­ The Missing Link

© 2018 SPLUNK INC.

Undocumented
Human Involvement
Crowd sourced

No perimeters
Technology Evolution
Integration

Profiling ­ The Missing Link
Human Factor

User OU names

+ Num. users

----------------------------+----------------

NORMAL

| 6031

WORKSTATION

| 52

.......................................

TERM EIF 12***

|

1

EIF CHI 2*****

|

1

EIF: H****

|

1

Nonprofit

|

1

EIF: *****

|

1

Left December ***

|

1

NY Term***

|

1

EIF ****

|

1

Dean

|

1

***176 FR-PAR

|

1

Term Form NY ****

|

1

.......................................

Sample: "Human touch" in LDAP Data

90 %

60 %

LDAP Data

© 2018 SPLUNK INC.
80 %

Profiling ­ The Missing Link
Technology Aspects

© 2018 SPLUNK INC.

"Impossible" questions:
 What are your domains?  What are your IP ranges?
 What are all your servers?  Who are the critical people?  What are the critical docs?

myCompany.com

IP1

. . .

IPN

Email Provider
emailServ.com

ISP IPuser

ISP IPGW

10.0.0.0/8

mySubsidiary.com
Google Docs
google.com

© 2018 SPLUNK INC.
Profiling in Splunk UBA
Enrichment of security context via algorithms

· Person · Attack capable · Owns deviceX ·...

Profiling Overview

10.59.42.7

· WiFi address · Guest network ·...

© 2018 SPLUNK INC.

Data

Active Directory

OS

People Firewall
Applications

· Server · Email Server · Web accessible ·...

Architecture

© 2018 SPLUNK INC.

ETL Entities

Identity Resolution
Augmentation

Profiling Models
Context

Security Alerts

ETL Entities

Architecture

© 2018 SPLUNK INC.

multiline

cef Active

Office365

Directory

snare

evtx

Windows

DNS Syslog

Infoblox DHCP
NetScaler

Juniper SNORT

Cisco

FireEye

Palo Alto

Weblog

AWS

DropBox

Box

SonicWall Auth

Avro

Networks Symantec

Imperva

BRO

Appcelerator

BlueCoat

Okta

Checkpoint

McAfee

ForeScout

... plus Splunk TAs

Architecture

© 2018 SPLUNK INC.

AD

Nov 10 06:00:18 SCL-DC01.acme.com/10.115.16.5/1.9.130.1 MSWinEventLog,1,Security,896539389,Sat Nov 10 06:00:17
RRlaptop$@acme.com 2018,4769,Microsoft-Windows-Security-Auditing, ACME\RRlaptop$@ACME.COM,N/A,Success Audit,SCL-DC01.acme.com,Kerberos Service
Ticket Operations,,A Kerberos service ticket was requested. Account Information: Account Name: RRlaptop$@ACME.COM Account
Domain: ACME Logon GUID: {7DBD8A74-923E-5F47-C3D1-B70217F23443} Service Information: Service Name: krbtgt Service ID: S-1-
ffff:10.251.0.24 5-21-196153179-1972187586-475923621-502 Network Information: Client Address: ::ffff:10.251.0.24 Client Port: 62929
Additional Information: Ticket Options: 0x60810010 Ticket Encryption Type: 0x12 Failure Code: 0x0 Transited Services: -

Identity Resolution

AD

Nov 10 06:03:19 SCL-DC01.acme.com/10.115.16.5/1.9.130.1 MSWinEventLog,1,Security,896622469,Sat Nov 10 06:03:18 2018,4624,Microsoft-Windows-Security-Auditing,ACME\WileE,N/A,Success Audit,SCL-DC01.acme.com,Logon,,An account was
WileE successfully logged on. Subject: Security ID: S-1-0-0 Account Name: - Account Domain: - Logon ID: 0x0 Logon Type: 3 New
Logon: Security ID: S-1-5-21-196452179-1272397586-475923621-77184 Account Name: wilee, Account Domain: ACME, Logon ID: 0xb068c7e29 Logon GUID: {068DDCB8-F1FB-BA08-78C9-0708D215E437} Process Information: Process ID: 0x0 Process Name: - Network
10.251.0.24 Information: Workstation Name: Source Network Address: 10.251.0.24 Source Port: 56023 + RRlaptop

Augmentation

WileE RRlaptop

PAN

1541829805 pansplunk3 indexer_guid=6527EB1D-75F2-47E7-8196-
6298CABC3613@@index=main@@event_hash=fdf0fa5371f7788075470964c3cb9c9a5@@sourcetype=pan_threat@@datamodel=Intrusion_Detectio
linkedin-base n@@app=linkedin-base@@category=content-delivery-networks@@dest=208.111.179.93(https-208-111-179-
93.sea.llnw.net)@@dest_ip=208.111.179.93(https-208-111-179-93.sea.llnw.net)@@dest_dns=208.111.179.93(https-208-111-179-
10.251.0.24 93.sea.llnw.net)@@dest_port=443@@dvc=prodsplunk3@@dvc_nt_host=prodsplunk3@@ids_type=network@@product=Firewall@@rule=Standar
d HTTP-HTTPS@@severity=informational@@src= 10.251.0.24(unresolved)@@src_ip= 10.251.0.24(unresolved)@@src_dns=
system 10.251.0.24(unresolved)@@src_port=52390@@src_user=acme\system@@vendor=PaloAlto@@tag=attack@@tag=ids@@tag=network + RRlaptop + WileE

10.251.0.24

Architecture

© 2018 SPLUNK INC.

Profiling Models
Context

F EAT U R E S

Domain Expertise

· Authentication types · Credentials · Processes · Special events ...

.conf '17 talks

Associations

· Assoc. set diversity · Duration · Persistence ...

Naming Analysis

· Industry practices · Customer insights ...

Account

Device

IP

admin

adm app srv dev

sql

prn exch

web svc

mgmt

Successful discovery of entire critical infrastructures.

Efficacy
Example: Device Profiling

Total devices Profiled devices
Dominant features Domain expertise Device ­ IP associations Device ­ User associations Naming analysis

13,998 7135
Num of devices : 352
6287 742
1094

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Example: Association Features (Simplified)

 Idea

Similar features, diverse profile discoveries

 Features

· Observation duration

· Daily average of associated entities

· Daily max

of associated entities

 Profiles to be discovered · NAT IP addresses · Multihomed devices

© 2018 SPLUNK INC.
Example: Association Features (Simplified)
Discovery of NAT addresses
index="yourAD" EventCode=4624 OR EventCode=4769 | rex field=_raw "New Logon:\s+Security ID:\s+(?<sid>[^\r\n]+)\s+Account Name:\s+(?<new_logon_account_name>[^\r\n]+)\s+Account Domain:\s+(?<new_logon_domain>[^\r\n]+)\s+Logon ID" | rex field=_raw "Logon Process:\s+(?<logon_process>[^\r\n]+)\s+" | rex field=_raw "Workstation Name:\s+(?<workstation_name>[^\r\n]+)\s+" | rex field=_raw "Source Network Address:\s+(::ffff:)?(?<source_address>\S+)\s+Source" | rex field=_raw "Service Name:\s+(?<service_name>[^\r\n]+)\s+Service ID" | rex field=_raw "Account Name:\s+(?<account_name>[^@\r\n]+)\S*\s+\S+" | rex field=_raw "Client Address:\s+(::ffff:)?(?<client_address>\S+)\s+Client" | search (EventCode=4624
AND ((logon_process=Kerberos AND new_logon_account_name="*$") OR (logon_process=NtlmSsp AND workstation_name != "")) AND source_address!="-" AND source_address != "127.0.0.1" AND source_address!="::1") OR (EventCode=4769 AND service_name=krbtgt AND account_name = "*$*" AND client_address != "-" AND client_address != "127.0.0.1" AND client_address != "::1") | eval device_name_4624 = if(logon_process == "NtLmSsp", workstation_name, mvindex(split(new_logon_account_name, "$"), 0)) | eval device_name = if(EventCode=4624, lower(device_name_4624), lower(mvindex(split(account_name, "$"), 0))) | eval address = if(EventCode=4624, source_address, client_address) |eval date_hm = strftime(_time, "%m/%d/%Y") | stats dc(device_name) as numdev by address date_hm |
stats dc(date_hm) as num_days, avg(numdev) as avg_dev, max(numdev) as max_dev by address | where avg_dev > 1 AND avg_dev >= 0.8 * total_dev AND num_days > 2

© 2018 SPLUNK INC.
Example: Association Features (Simplified)
Discovery of multihomed servers
index="yourAD" EventCode=4624 OR EventCode=4769 | rex field=_raw "New Logon:\s+Security ID:\s+(?<sid>[^\r\n]+)\s+Account Name:\s+(?<new_logon_account_name>[^\r\n]+)\s+Account Domain:\s+(?<new_logon_domain>[^\r\n]+)\s+Logon ID" | rex field=_raw "Logon Process:\s+(?<logon_process>[^\r\n]+)\s+" | rex field=_raw "Workstation Name:\s+(?<workstation_name>[^\r\n]+)\s+" | rex field=_raw "Source Network Address:\s+(::ffff:)?(?<source_address>\S+)\s+Source" | rex field=_raw "Service Name:\s+(?<service_name>[^\r\n]+)\s+Service ID" | rex field=_raw "Account Name:\s+(?<account_name>[^@\r\n]+)\S*\s+\S+" | rex field=_raw "Client Address:\s+(::ffff:)?(?<client_address>\S+)\s+Client" | search (EventCode=4624
AND ((logon_process=Kerberos AND new_logon_account_name="*$") OR (logon_process=NtlmSsp AND workstation_name != "")) AND source_address!="-" AND source_address != "127.0.0.1" AND source_address!="::1") OR (EventCode=4769 AND service_name=krbtgt AND account_name = "*$*" AND client_address != "-" AND client_address != "127.0.0.1" AND client_address != "::1") | eval device_name_4624 = if(logon_process == "NtLmSsp", workstation_name, mvindex(split(new_logon_account_name, "$"), 0)) | eval device_name = if(EventCode=4624, lower(device_name_4624), lower(mvindex(split(account_name, "$"), 0))) | eval address = if(EventCode=4624, source_address, client_address) |eval date_hm = strftime(_time, "%m/%d/%Y") | stats dc(address) as numaddr by device_name date_hm |
stats dc(date_hm) as num_days, avg(numaddr) as avg_ip, max(numaddr) as max_ip by device_name | where avg_ip > 1 AND avg_ip >= 0.7 * total_ip AND num_days > 2

NAT Addresses
Multihomed Servers

Results
Simplified profiling by association features

12

5

© 2018 SPLUNK INC.
5

UBA Profiles

© 2018 SPLUNK INC.

NAT

proxy

static

static

WiFi/ Guest

DHCP

Head office

proxy

static

Cloud

NAT

NAT

NAT

static proxy

WiFi/ Guest
static
Branch

UBA Profiles

SQL

admin WS

dev

web

email

auth

domain ctrl
Head office

generic server

Cloud

SQL

web

web

© 2018 SPLUNK INC.
prod
Branch

UBA Profiles ... so far

backup service

Cloud

group admin

local admin

email service

person

Head office

© 2018 SPLUNK INC.
domain admin
Branch

UBA Profiles

© 2018 SPLUNK INC.

IP Addresses Domains (AD & DNS)
AD Domains IOC table

Devices
Device Profiles table

Accounts/Users
User Profiles table

IP "Inadequate" For IR
Proxy IP address - Public - Private
NAT IP address - Public - Private
High-rate DHCP IP address (guest network) - Public - Private
Static IP address - Public - Private

Company's AD domains Company's DNS domains

Domain Controller

Web server Email servers DNS server DHCP server DMZ server Auth server

Backup server SQL servers Development server Print server Production server ....

Static IP server Public IP server Private IP server
Multi-homed server
Admin's workstation

Admin account Domain Admin Local (device) admin Generic admin in AD Domain Attack-capable account
Service account Email Service account Security Service account SQL Service account Web Service account ... Batch account
Web-Login account
Interactive-Login account (person)

Key Takeaways
UBA profiling

© 2018 SPLUNK INC.
1. Profiling: Turns data to clear context
· Who are your people, devices, infrastructure? · Automated by machine learning · Data driven and accurate
2. Easy to build security use cases
· For human analysts · For other algorithms
3. Can humans do it well? No!

Have a question?

1. Stanislav Miskovic
· Email: smiskovic@splunk.com
2. Prasoon Shukla
· Email: pshukla@splunk.com
3. Dimitrios Terzis
· Email: dterzis@splunk.com

© 2018 SPLUNK INC.

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

