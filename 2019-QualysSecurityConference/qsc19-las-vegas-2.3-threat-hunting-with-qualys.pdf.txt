QUALYS SECURITY CONFERENCE 2019
Threat Hunting with Qualys:
Going Beyond Your EDR Solutions
Chris Carlson VP Strategy, Qualys, Inc.

Adversary Threat Tactics are Changing
Early 2010s Zero-day Vulnerabilities (Nation State, Industrial Espionage, Black Market)

Today Rapidly weaponizing newly-disclosed vulnerabilities
(Good, Fast, Cheap ­ Pick 3)

2

Qualys Security Conference

November 20-21, 2019

Known Critical Vulnerabilities are Increasing
14-16K vulnerabilities are disclosed 2017-2019
30-40% are ranked as "High" or "Critical" severity
Worm-able Vulnerabilities are increasing (WannaCry, BlueKeep)
"Mean Time to Weaponize" is rapidly decreasing year/year

Let's Talk About BlueKeep
(RDP Vulnerability)

Just Two Weeks Ago

Get Proactive ­ Reduce the Attack Surface
AI VM Immediately discover assets and vulnerabilities
PM Notify IT asset owner to patch / stop the instance
PC SCA Change configuration to limit unauthorized access
CSA
Control network access / cloud security groups
IOC
Add endpoint detection and response

Proactively Hunt, Detect, and Respond

Indication of Compromise
Detect malware, IOCs, IOAs, and verify threat intel

Passive Network Sensor
What new devices are on the network? Are there
new/different traffic patterns?

Qualys IOC ­ Hunt Using Threat Intel
2 Search for the file hash here...

1 Threat intelligence lists attack information ...

3 Find the object there.

Detect Malware Missed by Anti-Virus
UK Government Contractor
- "Big 4" anti-virus installed - Qualys Agent for Vulnerability Mgmt - Added Qualys IOC on existing agents - 256 hosts
Qualys IOC discovered...
- Dridex Banking Trojan (51) - 4 domain controllers infected - Backdoors (7) installed due to
phishing campaigns - Netcat (8) root kits installed - 46 PUAs installed

Demo
9aa730979342f8d719e730f1a2081d8e9852da646ce2fbd9ce5e5301de25a5c5

Beyond Endpoint Detection and Response: HThroeawt Hucnatinng AIssbumepttitoensr: protect my crown jewels? · Every user machine can be compromised ­ it only takes one
· Every Remote Code Execution (RCE) vulnerability can be exploited
· Local Privilege Escalation and Credential Harvesting to move laterally
· System misconfigurations are often overlooked and easy to exploit
· Network segmentation is rarely used internally due to management
· All attacks are not equal: can Adversaries reach my Critical Servers?

11

Qualys Security Conference

November 20-21, 2019

Adversary Lateral Movements (Attack Paths)

lower

Security Tiers

User Segments

Business Apps / IT Systems

2 Find systems in higher
security tiers by looking for existing connections or network reconnaissance.

1 Bad actor compromises a user
machine (email, phishing, watering hole, etc.).
Takes remote control of the machine.

3 Laterally move to new system by:
- Exploiting open vulnerabilities - Take advantage of misconfigurations
- Use compromised credentials

higher
Tier 0 Systems "Crown Jewels"
4 Laterally move to new system by:
- Exploiting open vulnerabilities - Take advantage of misconfigurations - Use compromised credentials

Finding Attack Paths

Network Reachability
Determine connections between hosts using Cloud Agent CA Passive + Active network collection
Store these connections in a Graph Database for fast query +
Asset Security Posture
Remote Code Execution Vulnerabilities VM TP System Misconfigurations PC SCA
Malware and Indicators of Activity IOC

13

Qualys Security Conference

November 20-21, 2019

Attack Path Discovery to
Prioritize Patching and Improve Security Defenses

Attack path leads to this critical server

Patch this one asset to break the attack path to
critical server

Attack Path Discovery for
Proactive Threat Hunting and Response Priority

Attack path leads to this critical server

Quickly investigate the host to see the active
attack

Take action on this host to stop the
attacker in their tracks

Scale Human Response with Automation

Find active attacks on endpoint using Indication of Compromise

Go beyond endpoint detection with Security Analytics ­ correlate user, network, application, cloud, container

Use attack path discovery as metadata to detect active attacks reaching critical assets

Automate response to protect

critical assets using response

playbooks 28

Qualys Security Conference

November 20-21, 2019

QUALYS SECURITY CONFERENCE 2019
Thank You
Chris Carlson ccarlson@qualys.com

