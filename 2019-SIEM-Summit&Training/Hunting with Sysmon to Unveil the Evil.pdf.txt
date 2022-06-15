Hunting with Sysmon to Unveil the Evil
Felipe "Pr0teus" Esposito @pr0teusBR
Rodrigo "Sp0oKeR" Montoro @spookerlabs
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

About us

Felipe Esposito @pr0teusbr
Senior Researcher Tenchi Security Senior Instructor at BlueOps

Rodrigo Montoro @spookerlabs
Senior Researcher Tenchi Security Senior Instructor at BlueOps

Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Motivation
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Agenda
 Sysmon Basics  Sysmon Field Hunter (SFH)
 Events analyzed  Structure  Scoring Library  Results
 SFH & Elastic for the Hunting
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

SYSMON
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Sysmon
 Launched August of 2014  Current Version 10.4  22 events  Last update September/2019
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Sysmon Capabilities
 Process creation  DNS queries  Network Connections  Registry modifications

 File creation  WMI Events  Very flexible configuration file

Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Sysmon
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Sysmon Field Hunter (SFH)
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

What is SFH ?
 Analysis based mostly in an unique event  Flexible scoring system  Hunting tool  Alert Fatigue helper  Not a silver bullet
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

SFH flow structure
SYSMON
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Events Coverage (1st phase)
 Process Creation  Event ID 1
 Registry Events  Event ID 12  Event ID 13  Event ID 14

SYSMON

Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Future Events Coverage (2nd phase)

 Network Connection  Event ID 3
 File Create  Event ID 11
 WMI Events  Event ID 19  Event ID 20  Event ID 21

SYSMON

Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

SFH in the Shell
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Event ID 1: Process Creation
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Event ID 12 13 14: Registry Events
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Scoring Library - Event ID 1

 admin access  whitelist process  creator company  cli regex  work hours  cli byte count  (entropy + score)*

 token  directory path*  common commands*  parent versus process*  host risk*  command hash*  entropy

Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Scoring Library - Event ID 12, 13, 14
 work Hour  whitelist process  blacklist registry  event Type  targetobject  entropy
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Scoring samples (1 / 5)
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Scoring samples (2 / 5)
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Scoring samples (3 / 5)
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Scoring samples (4 / 5)
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Scoring samples (5 / 5)
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Hunting Analysis samples stats

ping

wmic

reg.exe

cmd.exe

powershell

conhost

Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

SFH & Elastic for the Hunting
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Event saved
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Views
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Dashboard
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Different Behaviors (normal versus malicious)
Thanks Samir @SBousseaden for providing EVTX samples repo https://github.com/sbousseaden/EVTX-ATTACK-SAMPLES
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Types of possible hunting  Results  AvgScores (entropy, score result)  Keywords search  Spikes and Views correlation
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Reduce alerts to analyze

Suspicious + Malicious
Removes 79%
Malicious
Removes 96%

Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Hunting Video Demonstration
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Future
 Add more score vectors  Integration with THE HELK Project  Correlate between other sysmon events  Analyze evtx files directly  Create DB files based on hunting needs  Export to others SIEM / Products
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Conclusions  Understand your endpoints behavior  Create and test different DB's  Keep testing your endpoint security  Hunting needs tuning, there is no magic
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

Thank you!
Felipe Esposito @pr0teusBR
fesposito@tenchisecurity.com
Rodrigo Montoro @spookerlabs
rmontoro@tenchisecurity.com
Tenchi Security confidential and proprietary. Unauthorized disclosure, reproduction or other use prohibited.

