UNIT42

SOFACY

ATTACK LIFE CYCLE

WEAPONIZATION

EXPLOITATION

COMMAND & CONTROL

RECON

DELIVERY

INSTALLATION

OBJECTIVE

7 | © 2017, Palo Alto Networks. All Rights Reserved.

WILL IT BLEND?

PLAYBOOK
(ADVERSARY)
STIX RELATIONSHIP
PLAYS
(CAMPAIGNS)
STIX RELATIONSHIP
ATT&CK TECHNIQUES
STIX RELATIONSHIP
STIX INDICATORS

establish-&-maintain-infrastructure adversary-opsec
establish-and-maintain-infrastructure persona-development build-capabilities test-capabilities stage-capabilities
priority-definition-planning priority-definition-direction
target-selection technical-information-gathering people-information-gathering organizational-information-gathering technical-weakness-identification people-weakness-identification organizational-weakness-identification

ATTACK
mapped to
LIFE CYCLE

{

"type": "attack-pattern", "id": c"oeamxteptcaruotcmiokins-epattern--8971f0b4-d7c2om3m-a4ncd-ca6nd--bcoentbro4l -...", "name": "Buy domain name"

"kill_chain_phases": [

{

"kill_chain_name": "mitre-pre-attack",

"phase_name": "establish-&-maintain-infrastructure"

},
launch
{ initial-access

execution persistence defense-evasion

"kill_chain_name": "lockheed",

"phase_name": "weaponization"

} ...

collection credential-access
discovery exfiltration lateral-movement privilege-escalation

SOFACY
Fancy Bear Pawn Storm Strontium APT28 Tsar Team
https://twitter.com/fancybearcoffee

DNC NATO
EFF WADA

FEB 2018

WEAPONIZATION

DELIVERY

EXPLOITATION

Sub Auto_Open() ActiveSheet.Range("a1:c54").Font.Color = vbBlack Call LinesOfBusiness.TQuH8wDO
End Sub

INSTALLATION

Function GetVal(sr As Long, er As Long, c As Long) Dim x For i = sr To er x = x + Cells(i, c) Next GetVal = x
End Function

certutil -decode C:\Programdata\[random].txt C:\Programdata\[random].exe

COMMAND & CONTROL

OBJECTIVE

bg+oWBfXZjYFOIXCfP54bzr4VAFBq3s3VfhfIFe7aiFLhQUBQat7 N1XSfD9LqyE3QL0FMUuqfCEWvXc3Mq9mPFS3aD1W9moqXd J8N0quZjFdqyE3QL0FPku5fCEWvXc3Mq5iM1usZz5I9moqXdJ8 JFuwYCFM9moqXdJ8JFuwYCFM9moqXdJ8JFuwYCFM9moqXd J8JFuwYCFM9moqXdJ8JFuwYCFM9moqXdJ8Ile3YyFO9moqXd JqKki0YCBdqiE3QL0FIE22az5U6z18XaBqWFKtfDFQvWt8XaBq WE61ez1XtHw2Fr13NzKffT1XrmofV7ZmJleqITdAvQUhTrtnPUus ITdAvQU4SashN0C9BSRVrGA9VKtrfF2galhoqmAxXat8Glm7ZD dK9moqXdJ9N1+rZz1M9moqXdJsP1z2aipd0lsCea17PXu3YTxrr mx8XaBqWFm0aHxdoGpYT6tsPEy+dnxdoGpYbIhOJ0y3TD1Wt moxTPZqKl3SeCdZrWw+TPZqKl3STDNIrHogXZpOBha9dzcykW I/TbZmJkGcajBNv2g3SvZqKl3SbD9c9moqXdJ4P1GofSRLvSE3 QL0FPle5azZUtCE3QL0FHle7bj4YmX03WfhMPVa2ajFMsWA8G
PUvE3WcLwJ7lkoGGJ5uP1G0dnJom0ZyfaxnN0q2 ...

id=\xe0\x8a\x90D&w=\x02 [System Process] System smss.exe csrss.exe winlogon.exe services.exe lsass.exe svchost.exe spoolsv.exe explorer.exe jusched.exe jqs.exe alg.exe wscntfy.exe wmiprvse.exe Local Area Connection - AMD PCNET Family PCI Ethernet Adapter - Packet Scheduler Miniport 00:0c:29:ae:a9:ce Bluetooth Network Connection - Bluetooth Device (Personal Area Network) - 8c:85:90:15:43:51 MS TCP Loopback interface - MS TCP Loopback interface - 00 disk=SCSI\\Disk&Ven_VMware_&Prod_VMware_Virtual_S&Rev_1.0\\4&5fcaafc&0&000 build=0x9104f000
iAmAgA=AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA...AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

FileName: Specified filename PathToSave: Path to specified file Execute: Create a process with the specified file Delete: Delete the specified file LoadLib: Load specified DLL into current process ReadFile: Reads a specified the file Rundll: Runs specified DLL with an exported function IP: Set C2 location shell: Run additional code in a newly created thread

>>> Creating Playbooks
Live at https://pan-unit42.github.io/playbook_viewer/

>>> RECON

Identify business relationships

>>> RECON

Identify business relationships

>>> WEAPONIZATION

Acquire and/or use 3rd party infrastructure
services

Install and configure hardware, network, and systems

Buy domain name

Obtain/re-use payloads

Remote access tool
development

Create custom payloads

>>> WEAPONIZATION

Acquire and/or use 3rd party infrastructure
services

Install and configure hardware, network, and systems

Buy domain name

Obtain/re-use payloads

Remote access tool
development

Create custom payloads

Newly registered domain domain-name:value = 'cdnverify.net'

>>> DELIVERY

Spear phishing messages with
malicious attachments

Conduct social engineering or HUMINT operation

>>> DELIVERY
Spear phishing messages with
malicious attachments

Conduct social engineering or HUMINT operation

email:subject = 'Upcoming Defense events February 2018' file:name = 'Upcoming Events February 2018.xls'
file:hashes.'SHA-256' = 'cb85072e6ca66a29cb0b73659a0fe5ba2456d9ba0b52e3a4c89e86549bc6e2c7'

>>> EXPLOITATION

Authorized user performs
requested cyber action

>>> EXPLOITATION

Authorized user performs
requested cyber action

>>> INSTALLATION

Obfuscate or encrypt code

Rundll32

Scripting

Software Packing

Hidden Files and Directories

Logon Scripts

Process Injection

>>> INSTALLATION

Obfuscate or encrypt code

Rundll32

Scripting

Software Packing

Hidden Files and Directories

Logon Scripts

Process Injection

Tool uses UserInitMprLogonScript key to run a batch script for persistence
windows-registry-key:key = 'HKCU\\Environment\\UserInitMprLogonScript' AND windows-registry-key:values[*].data LIKE '%cdnver.bat%'

>>> COMMAND AND CONTROL

Standard Application Layer Protocol

Data Encoding

Remote File Copy

>>> COMMAND AND CONTROL

Standard Application Layer Protocol

Data Encoding

Remote File Copy

SofacyCarberp uses HTTPS for C2
domain-name:value = 'cdnverify.net'

>>> ACT ON OBJECTIVES

Automated Collection

Clipboard Data Screen Capture

File and Directory Discovery

Process Discovery

System Network Configuration Discovery

Identify business relationships
Recon
Acquire OSINT data sets and information
Obtain templates/branding
materials

Acquire and/or use 3rd party infrastructure services Remote access tool development
Install and configure hardware, network,
and systems
Obfuscate or encrypt code
Obtain/re-use payloads
Buy domain name
Create custom payloads
Weaponize
Host-based hiding techniques
Misattributable credentials
Obtain/re-use payloads
Buy domain name
Create custom payloads

Feb 2018

Conduct social engineering or HUMINT operation
Spear phishing messages with malicious attachments

Authorized user performs requested
cyber action

Delivery
Spear phishing messages with malicious attachments

Exploit
Authorized user performs requested
cyber action Confirmation of launched compromise
achieved

Hidden Files and Directories
Process Injection Rundll32
Software Packing Scripting
Install

Remote File Copy Data Encoding
Standard Application Layer Protocol
C&C
Custom Cryptographic Protocol
Standard Application Layer Protocol
Commonly Used Port

Process Discovery Automated Collection
Screen Capture Clipboard Data System Network Configuration
Discovery File and Directory
Discovery Logon Scripts
Act on Obj.
System Information Discovery

Mar 2018

CHALLENGES

Use of Open Source Tools

?

71 PAGES!

Cyber Observable Objects...

HTTP Request Extension

HTTP Response Extension

Content-Disposition: attachment; filename=default.bat
==
artifact:payload_bin LIKE '%Q29udGVudC1EaXNwb3NpdGlvbjog.. ..YXR0YWNobWVudDsgZmlsZW5hbWU9ZGVmYXVsdC5iYXQ=%'

BROKEN

$ python test_pattern.py '%\AppData\Local\cdnver.dll",#1' Traceback (most recent call last):
File "test_pattern.py", line 7, in <module> indicator = Indicator(name="test",pattern=[s_pattern],labels=["malicious-activity"])
File "/usr/local/lib/python2.7/site-packages/stix2/base.py", line 121, in __init__ self._check_property(prop_name, prop_metadata, setting_kwargs)
File "/usr/local/lib/python2.7/site-packages/stix2/base.py", line 57, in _check_property raise InvalidValueError(self.__class__, prop_name, reason=str(exc))

ERROR

stix2.exceptions.InvalidValueError: Invalid value for Indicator 'pattern': FAIL: Error found at line 1:1. mismatched input

''process:command_line LIKE \'%\\AppData\\Local\\cdnver.dll",#1\''' expecting {IdentifierWithoutHyphen, IdentifierWithHyphen, '('}

$ python test_pattern.py '%\AppData\Local\cdnver.dll,#1' {
"type": "indicator", "id": "indicator--8da87a70-ddef-4c55-8553-192d7fed04d7", "created": "2018-10-18T14:11:44.676Z", "modified": "2018-10-18T14:11:44.676Z", "name": "test", "pattern": "[\"process:command_line LIKE '%\\\\AppData\\\\Local\\\\cdnver.dll,#1'\"]", "valid_from": "2018-10-18T14:11:44.676055Z", "labels": [
"malicious-activity" ] }

Available at
https://mitre.github.io/attack-navigator/enterprise/

@Unit42_Intel

@r0bf4lc

Blog researchcenter.paloaltonetworks.com/unit42/ Playbook viewer https://pan-unit42.github.io/playbook_viewer/

