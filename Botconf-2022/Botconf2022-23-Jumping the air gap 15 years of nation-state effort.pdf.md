Jumping the air gap
15 years of nation-state effort
Alexis Dorais-Joncas | Senior Manager, Threat Research Facundo Munoz | Malware Researcher

Alexis Dorais-Joncas
Senior Manager, Malware Research

Facundo Muñoz
Malware Researcher

Malware, or a set of malware components acting together (a framework), that implements an offline, covert
communication mechanism between an air-gapped system and the attacker

Strong attribution

Controversial attribution

Connected frameworks

Connected frameworks

Connected frameworks

Connected frameworks

Connected frameworks

Connected frameworks

Connected frameworks

Offline frameworks

Air-gapped side: Initial execution vectors

Automated execution

Automated Execution
Source: Securelist - Kaspersky

Non-automated execution: Unknowingly triggered
Main techniques: · Abuse of Windows AutoRun/AutoPlay feature, via malicious autorun.inf files · Planting decoy files to lure potential victims · Rig existing files with malicious code or exploits

Non-automated execution: Unknowingly triggered
Stuxnet's autorun.inf
Source: Symantec

Non-automated execution: Unknowingly triggered
Stuxnet's autorun.inf instructions:
Source: Symantec

Non-automated execution: Unknowingly triggered
Legitimate

Source: Symantec

Malicious

Non-automated execution: Unknowingly triggered

Clean

Weaponized

Non-automated execution: deliberately triggered

Non-automated execution: deliberately triggered
Source: Securelist - Kaspersky

Non-automated execution: deliberately triggered

Connected side
Infects it, if contains marker.

Air-gapped side

RedCore victim

Executes the malware on the target.

Non-automated execution: deliberately triggered

Non-automated execution: deliberately triggered

NppPlugin.dll

HealthCheck.exe

RichEd20.dll

Communication Protocols and Exfiltration
0xDEADBABE
Source: Securelist - Kaspersky

Communication Protocols and Exfiltration
FAT Specification. Directory structure:
0xDEADBABE

Communication Protocols and Exfiltration
Invalid directory entry
Hidden storage space
Modules Commands Stolen data

Communication Protocols and Exfiltration

Communication Protocols and Exfiltration
Hooked CloseHandle
kernel32.dll Is a Word document?
Append document

How to defend
NX

Identifying air-gapped malware

Identifying the connected-side component

Identifying the connected-side component

Identifying the connected-side component

Identifying the air-gapped side component

Challenges
?

Ramsay

Alexis Dorais-Joncas
Senior Manager, Malware Research dorais@eset.com @adorais

Facundo Muñoz
Malware Researcher facundo.munoz@eset.com
@0xfmz

