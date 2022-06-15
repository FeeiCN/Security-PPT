BREAKING NETWORK SEGREGATION USING ESOTERIC COMMAND & CONTROL CHANNELS
James Coote & Alfie Champion

C:\> whoami /all
James Coote ­ Senior Consultant, @jkcoote Alfie Champion ­ Senior Consultant, @ajpc500

AGENDA
· Why? · The Lab & C3 · Using and Detecting C2 over:
· VMware · Printers · RDP Mapped Drives · LDAP Attributes

WHY CARE?
Blue team:
· Challenge assumed network boundaries · Increasing in popularity
Red team:
· Bypass network segregation · Target commonly-observed attack surface · Evade detection

LAB

HELK

Sysmon

DC1.MWR.COM

VCENTER.UK.MWR.COM

DC2.UK.MWR.COM

INTERNET

TEAMSERVER

Manages

ESXi.UK.MWR.COM

WRK1.UK.MWR.COM WRK2.UK.MWR.COM

C3 SERVER

https://gist.github.com/ajpc500/3a86ba1741d4868b69be5ce3a142d527 https://github.com/SwiftOnSecurity/sysmon-config

https://github.com/fireeye/SilkETW https://github.com/Cyb3rWard0g/HELK

C3

C2 Medium
PACKET

https://github.com/FSecureLABS/C3

BEACON
TARGET

TL;DR READ, WRITE, DELETE? C2.

VMWARE

SCENARIO

VCENTER.UK.MWR.COM

Manages

DENY ALL WRK1

DENY ALL WRK2

OPERATIONAL LIMITATIONS
· Must have valid credentials and relevant "Guest Operations" privileges in vCenter
· Must have valid credentials for the target VM
· Local or domain, no need to be an admin
· Target VM must have VMware Tools installed
https://docs.vmware.com/en/VMware-vSphere/7.0/com.vmware.vsphere.security.doc/GUID-6A952214-0E5E-4CCF-9D2A-90948FF643EC.html

DATAFLOW

WRK1

WRK2

POLLING

UncShareFile

POLLING

\\SHARE\DIR
https://github.com/FSecureLABS/C3/blob/master/Src/Common/FSecure/C3/Interfaces/Channels/UncShareFile.cpp

DATAFLOW WRK1

WRK2
1. Writes packet

POLLING

C3

C3

PACKET
C:\USERS\PUBLIC
2. Download packet

PACKET
C:\USERS\PUBLIC

POLLING

SHARPSPHERE

VCENTER

https://github.com/JamesCooteUK/SharpSphere/releases/tag/1.1.0.0

DATAFLOW

WRK1 3. Writes packet

WRK2

POLLING

C3
PACKET
C:\USERS\PUBLIC
4. Upload packet

C3
PACKET
C:\USERS\PUBLIC

POLLING

SHARPSPHERE

VCENTER

https://github.com/JamesCooteUK/SharpSphere/releases/tag/1.1.0.0

WORKFLOW

FIND VCENTER

CREATE CHANNEL

EXECUTE C2

EXECUTE RELAY

DOWNLOAD RELAY UPLOAD TO TARGET

FIND VCENTER
ldapsearch ( o p e r a t i n g Sy s t e mSe r v i c e Pa c k=* u n k n o wn . u n k n o wn . u n k n o wn * ) l d a p s e a r c h ( n a me =*v c e n t e r * )
https://github.com/trustedsec/CS-Situational-Awareness-BOF/tree/master/src/SA/ldapsearch

CREATE CHANNEL

CREATE CHANNEL

LIST VMS

UPLOAD TO TARGET HOST

EXECUTE RELAY

ESTABLISH C2

PREVENTION
· Restrict network access to vCenter to known administrative hosts (PAWs?)
· Principle of Least Privilege
· Disable "Guest Operations" API methods · Remove non-essential VMware Tools features from guest VMs
https://github.com/lamw/vmware-scripts/blob/master/powershell/enable-disable-vsphere-api-method.ps1 https://docs.vmware.com/en/VMware-Tools/10.1.0/com.vmware.vsphere.vmwaretools.doc/GUID-E45C572D-6448410F-BFA2-F729F2CDA8AC.html

DETECTION OPPORTUNITIES

WRK1

WRK2

C3 Usage

C3

C3 WEL Logon Events

File Writes .NET Tooling

C:\USERS\PUBLIC

Network Connections

C:\USERS\PUBLIC

SHARPSPHERE

VCENTER

File Writes API Usage Logs

D.NEETTETCOTIOOLNINOGPPORTUNITIES
Yara Rule - https://gist.github.com/ajpc500/7b3f44e6cae093ace68396adb3f27bfa

D.NEETTETCOTIOOLNINOGPPORTUNITIES
https://medium.com/threat-hunters-forge/threat-hunting-with-etw-events-and-helk-part-1-installing-silketw-6eb74815e4a0 https://blog.f-secure.com/detecting-malicious-use-of-net-part-1/

DC3ETUESCATGIOEN OPPORTUNITIES
Yara rule - https://gist.github.com/ajpc500/9ae6eb427375438f906b0bf394813bc5 https://www.fireeye.com/blog/threat-research/2021/05/shining-a-light-on-darkside-ransomware-operations.html

DNEETTEWCOTIROKNCOOPNPNOERCTTUIONNITSIES

Relay_x64_6fc1_slack.exe

SPAWNS

Rundll32.exe

VCENTER

DPREOTECCETSISOCNROEAPTPIOORNTSU-NEXITEIECSUTE

Vmtoolsd.exe

SPAWNS

cmd.exe /c whoami > C:\Users\Public\ohq4ccey.hib 2>&1

https://github.com/JamesCooteUK/SharpSphere/blob/master/SharpSphere/Program.cs#L1 74

DPREOTECCETSISOCNROEAPTPIOORNTSU-NEXITEIECSUTE

Vmtoolsd.exe

No --output == no file writes but we still have anomalous child processes of vmtoolsd.exe

SPAWNS

cmd.exe /c whoami

DAPETI UECSTAIGOENLOOPGPSO-RETXUECNUITTIEES
Start Program
Until process has terminated...
List Process IDs
https://github.com/JamesCooteUK/SharpSphere/blob/master/SharpSphere/Program.cs#L174

DAPETI UECSTAIGOENLOOPGPSO-RETXUECNUITTIEES
Download Output File Delete Output File
https://github.com/JamesCooteUK/SharpSphere/blob/master/SharpSphere/Program.cs#L174

DAPETI UECSTAIGOENLOOPGPSO-RETXUECNUITTIEES
/var/logs/vmware/vxpd/vpxd.log
Initial Authentication
https://williamlam.com/2017/11/how-to-audit-vsphere-api-usage.html https://github.com/JamesCooteUK/SharpSphere/blob/master/SharpSphere/Program.cs#L174

DAPETI UECSTAIGOENLOOPGPSO-RETXUECNUITTIEES
/var/logs/vmware/vxpd/vpxd.log
Find Virtual Machine by IP
https://williamlam.com/2017/11/how-to-audit-vsphere-api-usage.html https://github.com/JamesCooteUK/SharpSphere/blob/master/SharpSphere/Program.cs#L174

DAPETI UECSTAIGOENLOOPGPSO-RETXUECNUITTIEES
/var/logs/vmware/vxpd/vpxd.log
Authenticate to Guest and Start Program
https://williamlam.com/2017/11/how-to-audit-vsphere-api-usage.html https://github.com/JamesCooteUK/SharpSphere/blob/master/SharpSphere/Program.cs#L174

DAPETI UECSTAIGOENLOOPGPSO-RETXUECNUITTIEES
/var/logs/vmware/vxpd/vpxd.log
List processes and check if program has terminated
https://williamlam.com/2017/11/how-to-audit-vsphere-api-usage.html https://github.com/JamesCooteUK/SharpSphere/blob/master/SharpSphere/Program.cs#L174

DAPETI UECSTAIGOENLOOPGPSO-RETXUECNUITTIEES
/var/logs/vmware/vxpd/vpxd.log
Download program output and delete the file
https://williamlam.com/2017/11/how-to-audit-vsphere-api-usage.html https://github.com/JamesCooteUK/SharpSphere/blob/master/SharpSphere/Program.cs#L174

DAPETI UECSTAIGOENLOOPGPSO-RETXUECNUITTIEES
/var/logs/vmware/vxpd/vpxd.log
/var/logs/vmware/vxpd/vpxd-profiler.log https://williamlam.com/2017/11/how-to-audit-vsphere-api-usage.html https://github.com/JamesCooteUK/SharpSphere/blob/master/SharpSphere/Program.cs#L174

DAPETI UECSTAIGOENLOOPGPSO-RETXUECNUITTIEES
/var/logs/vmware/vxpd/vpxd.log
/var/logs/vmware/vxpd/vpxd-profiler.log https://williamlam.com/2017/11/how-to-audit-vsphere-api-usage.html https://github.com/JamesCooteUK/SharpSphere/blob/master/SharpSphere/Program.cs#L174

DAPETI UECSTAIGOENLOOPGPSO­RCT2UNITIES
/var/logs/vmware/vxpd/vpxd.log
https://williamlam.com/2017/11/how-to-audit-vsphere-api-usage.html

DFIELETEWCTRIIOTENSO- PCP2ORTUNITIES
https://github.com/FSecureLABS/C3/blob/master/Src/Common/FSecure/C3/Interfaces/Channels/UncShareFile.cpp#L6 h8ttps://labs.f-secure.com/blog/attack-detection-fundamentals-discovery-and-lateral-movement-lab-3/

DFIELETEWCTRIIOTENSO- PCP2ORTUNITIES
https://github.com/FSecureLABS/C3/blob/master/Src/Common/FSecure/C3/Interfaces/Channels/UncShareFile.cpp#L6 h8ttps://labs.f-secure.com/blog/attack-detection-fundamentals-discovery-and-lateral-movement-lab-3/

DFIELETEWCTRIIOTENSO- PCP2ORTUNITIES
https://github.com/FSecureLABS/C3/blob/master/Src/Common/FSecure/C3/Interfaces/Channels/UncShareFile.cpp#L6 h8ttps://labs.f-secure.com/blog/attack-detection-fundamentals-discovery-and-lateral-movement-lab-3/

DFIELETEWCTRIIOTENSO- PCP2ORTUNITIES
https://github.com/FSecureLABS/C3/blob/master/Src/Common/FSecure/C3/Interfaces/Channels/UncShareFile.cpp#L6 h8ttps://labs.f-secure.com/blog/attack-detection-fundamentals-discovery-and-lateral-movement-lab-3/

DWEITNEDCOTIWONS EOVPEPNOTRLTOUGNSITIES
EID 4624 and 4648s for logon required for guest interaction, produced on target workstation

PRINTERS

SCENARIO

MX470 ON DC2

WRK1

DENY ALL

WRK2 DENY ALL

OPERATIONAL LIMITATIONS
· Both sides must have network (SMB) access to the same print server · Execute under the context of the same account on both sides, or an admin · Unlimited print jobs less stable · Transfer size of ~1MB per packet

DATAFLOW WRK1 C3 POLLING

WRK2 C3
POLLING

MX470

FIND PRINTERS
ldapsearch ( obj e c t Ca t e g o r y =p r i n t Qu e u e ) uNCNa me powe r s h e l l Ge t - Pr i n t e r ­Compu t e r Na me DC2. UK. MWR. COM wmi c pr i nt e r ge t na me
https://github.com/trustedsec/CS-Situational-Awareness-BOF/tree/master/src/SA/ldapsearch

CREATE CHANNEL

EXECUTE RELAY

DETECTION OPPORTUNITIES
Print Server Event Logs

Network Connections WRK1

DENY ALL

WRK2 DENY ALL

Endpoint UI Module Loads RPC

DENETDEPCOTIINOTNUOIPPORTUNITIES
Low ink... low paper... printer offline... Any issue could be presented to the compromised user!
HKCU\ Pr i nt e r s \ Se t t i n gs \ En a b l e Ba l l o on Not i f i c a t i on s Re mo t e HKCU\ Pr i nt e r s \ Se t t i n gs \ En a b l e Ba l l o on Not i f i c a t i on s Lo c a l
https://labs.f-secure.com/blog/print-c2/

DPREITNETCTSIEORNVEORPEPVOERNTTULNOITGISES we v u t i l . e x e s l ' Mi c r o s o f t - Wi n d o ws - Pr i n t Se r v i c e / Op e r a t i o n a l ' / enabl ed: t r ue
Computer Configuration > Policies > Administrative Te mp l a t e s > Pr i nt e r s > Al l ow j ob na me i n e ve nt l ogs

DPREITNETCTSIEORNVEORPEPVOERNTTULNOITGISES we v u t i l . e x e s l ' Mi c r o s o f t - Wi n d o ws - Pr i n t Se r v i c e / Op e r a t i o n a l ' / enabl ed: t r ue
Computer Configuration > Policies > Administrative Te mp l a t e s > Pr i nt e r s > Al l ow j ob na me i n e ve nt l ogs

DMEOTDECUTLIEOLNOOAPDPSORTUNITIES
https://docs.microsoft.com/en-us/windows/win32/printdocs/addjob

DNEETTEWCOTIROKNCOOPNPNOERCTTUIONNITSIES
Beaconing Behaviour

DRPECTECTION OPPORTUNITIES

Method RpcEnumJobs
RpcAddJob

Description

OpNum

Retrieves information about a specified set of print jobs Opnum 4 for a specified printer.

Defines a new print job.

Opnum 24

logman s t a r t Pr i nt - J ob - RPC - p Mi c r os o f t - Wi n d ows - RPC 0xf f f f f f f f f f f f f f f f wi n : I n f o r ma t i o n a l - e t s l o g ma n s t o p Pr i nt - J o b - RPC - e t s t r a c e r p t Pr i nt - J o b - RPC. e t l - o Pr i nt - J o b- RPC. e v t x - of EVTX

https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-rprn/e8f9dad8-d114-41cc-9a52-fc927e908cf4

DRPECTECTION OPPORTUNITIES
RpcAddJob https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-rprn/e8f9dad8-d114-41cc-9a52-fc927e908cf4

RDP

SCENARIO

WRK1

ONLY 3389

WRK2 DENY ALL

OPERATIONAL LIMITATIONS
· For C2, RDP Mapped Drives must be permitted (is by default)
· For RDP execution:
· Target's keyboard must be set to US English · No special characters in the relay name, for example underscores

DATAFLOW

WRK1

WRK2

POLLING

C3

C:\USERS\PUBLIC
https://github.com/0xthirteen/SharpRDP/pull/11

CREATE CHANNEL

DOWNLOAD RELAY

EXECUTE RELAY

DETECTION OPPORTUNITIES
Network Connections .NET Tooling / Module Loads
RUNDLL32.EXE
Running SharpRDP

Relay_x64_e03e_UNC

C:\Users\Public

\\tsclient\C\Users\Public

WRK1.UK.MWR.COM

File Writes

WRK2.UK.MWR.COM

D.NEETTETCOTIOOLNINOGPPORTUNITIES

Relay_x64_e03e_UNC

RUNDLL32.EXE
Running SharpRDP

DMEOTDECUTLIEOLNOOAPDPSORTUNITIES
https://github.com/0xthirteen/SharpRDP/blob/master/SharpRDP/SharpRDP/Client.cs#L11 h9ttps://docs.microsoft.com/en-us/windows/win32/termserv/imsrdpclientadvancedsettings-interface

DMEOTDECUTLIEOLNOOAPDPSORTUNITIES
RDP ActiveX Client DLL Loaded

DNEETTEWCOTIROKNCOOPNPNOERCTTUIONNITSIES

RUNDLL32.EXE

3389

DNEETTEWCOTIROKNCOOPNPNOERCTTUIONNITSIES
Beacon staging

LDAP

SCENARIO

ANY DOMAIN CONTROLLER

WRK1

DENY ALL

WRK2 DENY ALL

OPERATIONAL LIMITATIONS
· Both sides should communicate with the same DC · Both sides must modify the same user's attributes · Limited by the size and data type of the target attribute
http://www.harmj0y.net/blog/powershell/command-and-control-using-activehdtirtepcst:o//rbyl/og.fox-it.com/2020/03/19/ldapfragger-command-and-control-over-ldap-attributes/

DATAFLOW

WRK1

1. Writes to LOCK attribute with destination
ID
2. Writes message to DATA attribute

Target User AD Object

3. Check LOCK attribute for correct ID
4. Read and clear both attributes

WRK2

CREATE CHANNEL

CHANNEL CREATION
DATA LDAP ATTRIBUTE ­ Used to send & receive packets. The default is mSMQSignCertificates as it doesn't require special privileges to modify, is large (1MB), and is rarely ever set. Manually check that it is empty before using.
MAX PACKET SIZE ­ The maximum size of the packets that C3 should attempt to write to the given Data LDAP Attribute. This will be different if you change the Data LDAP Attribute above.
USERNAME­ The UPN of an account with permissions to modify the target user's attributes (often the target user itself). Must be specified in UPN format, for example james@uk.mwr.com. Defaults to the user executing the relay if left blank.
USER DISTINGUISHED NAME ­ The user whose attributes should be changed. This is often the same user as above, however doesn't need to be. Can't be left blank, and must be in the DN format, for example CN=james,CN=Users,DC=UK,DC=MWR,DC=com

EXECUTE RELAY

DETECTION OPPORTUNITIES

Network Connections

ANY DOMAIN CONTROLLER

Logon Events Directory Service Access/Changes

LDAP Queries

WRK1

DENY ALL

WRK2 DENY ALL

DNEETTEWCOTIROKNCOOPNPNOERCTTUIONNITSIES
DC2.UK.MWR.COM WRK1.UK.MWR.COM

DLDEATEPCQTUIOENRIOESPPORTUNITIES
Check Lock Attribute No further action
https://github.com/FSecureLABS/C3/blob/master/Src/Common/FSecure/C3/Interfaces/Channels/LDAP.cpp

DLDEATEPCQTUIOENRIOESPPORTUNITIES
Check Lock Attribute Write to Data Attribute
https://github.com/FSecureLABS/C3/blob/master/Src/Common/FSecure/C3/Interfaces/Channels/LDAP.cpp

DETECTION OPPORTUNITIES

LDAP QUERIES

Microsoft-Windows-LDAP-Client

DETECTION OPPORTUNITIES DIRECTORY SERVICE CHANGES EventID5136
Dsobject_attribute_type 2.5.5.12 = Unicode string
https://oidref.com/2.5.5 https://docs.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5136

DDEIRTEECCTTOIORNY SOEPRPVOICRETCUHNAITNIEGSES
https://oidref.com/2.5.5 https://docs.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5136

DDEIRTEECCTTOIORNY SOEPRPVOICRETCUHNAITNIEGSES

DDEIRTEECCTTOIORNY SOEPRPVOICRETCUHNAITNIEGSES
Dsobject_attribute_type 2.5.5.10 = String(Octet); A string of bytes
https://oidref.com/2.5.5 https://docs.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5136

DDEIRTEECCTTOIORNY SOEPRPVOICRETAUCNCITEISESS

Event ID 4662

https://docs.microsoft.com/en-us/windows/win32/adschema/a-msmqsigncertificates https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-adls/6772e5ca-806c-483a-b673cd8089ba6a3e

DDEIRTEECCTTOIORNY SOEPRPVOICRETAUCNCITEISESS
https://docs.microsoft.com/en-us/windows/win32/adschema/a-msmqsigncertificates https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-adls/6772e5ca-806c-483a-b673cd8089ba6a3e

DDEIRTEECCTTOIORNY SOEPRPVOICRETAUCNCITEISESS
https://docs.microsoft.com/en-us/windows/win32/adschema/a-msmqsigncertificates https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-adls/6772e5ca-806c-483a-b673cd8089ba6a3e

DDEIRTEECCTTOIORNY SOEPRPVOICRETAUCNCITEISESS
https://docs.microsoft.com/en-us/windows/security/threat-protection/auditing/event4662

CONCLUSIONS

CONCLUSIONS
· Review the trust boundaries between critical networks. ...Are they as air-gapped as you think?
· Is there a data flow that could be exploited? ...can these be mitigated? prevented? detected?
· Are there internal or external services that could be leveraged for C2? ...can this attack surface be reduced?
#C3 on BloodHound Slack https://github.com/FSecureLABS/C 3

