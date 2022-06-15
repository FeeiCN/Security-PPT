RSA 2019

HACKING EXPOSED

CEO

CTO

RSA 2019

RSA 2019

ADVERSARY SPIDER

CATEGORY / NATION STATE ECRIME

CHOLLIMA

NORTH KOREA

JACKAL TIGER KITTEN

HACKTIVIST INDIA IRAN

ADVERSARY LEOPARD

CATEGORY / NATION STATE PAKISTAN

PANDA

CHINA

BEAR

RUSSIA

CRANE BUFFALO

SOUTH KOREA VIETNAM

RSA 2019

RSA 2019

SURVIVAL OF THE FASTEST:

DETECT
1 MIN

INVESTIGATE
10 MIN

REMEDIATE
60 MIN

RSA 2019

OverWatch Analyst

RSA 2019

Assets to come from Matt A

Holding slide for Wicked Panda graphics

All Mac-based intrusion - Pivoted from system to system by compromising one machine - Some passwords stolen via spear-phishing - 5 systems traversed within 4 hours -- including a build server
RSA 2019

Holding slide for Wicked Panda graphics

- Unattributed adversary referred to industry by Windshift
- Typically targeted individuals, often with Middle East nexus
- Known for interesting Mac hacking tradecraft
RSA 2019

mycustomurlscheme://test

Key URL Types
Item 0 URL Identifier URL Schemes Item 0

Type Array Dictionary String Array String

Value (1 Item) (2 Items)
(1 Item) myCustomURLScheme

RSA 2019

malicious.zip

malicious.app

info.plist

3

4

5

Launch Services Daemon

6

7

1

2

CustomURLScheme

malicious.app

RSA 2019

RSA 2019

URL Schemes

Gatekeeper

Office Macros

Disable the option in Safari to "Open "safe" files after downloading"

System Preferences > Security & Privacy > Allow apps downloaded from App Store, App Store and identified developers

User Awareness Training
Office Product > Preferences > Security & Privacy > Disable Macros without notification

RSA 2019

1

Application talks to server

2

Application downloads update

Application

3

User prompt for password to run update

4

Malicious package is executed and malware installed as root

Attacker backdoor

/tmp/update/pkg RSA 2019

RSA 2019

Installer Takeovers Install applications from the Apple Store when possible to ensure Sandbox is applied

Keep system up to date to patch privilege escalation 0-days that are discovered for macOS

User awareness on password popup prompts
RSA 2019

Using System Integrity Protection, Apple has restricted direct access to the files inside /var/db/dslocal/nodes/Default/users/, rendering a handful of hash dumping tools and techniques outdated
defaults read /var/db/dslocal/nodes/Default/users/$USER.plist ShadowHashData was probably the command most frequently referenced that no longer works
The dscl command can still be used to access ShadowHashData dscl . read /Users/$USER dsAttrTypeNative:ShadowHashData

RSA 2019

RSA 2019

Hashdump
Use a good password
Use products that notify or monitor for access to credential files

Keychain Theft
Change your keychain password to be something different than your login password
security set-keychain-password ~/Library/Keychains/login.keychain-db

SSH
SSH
Always use a password associated with private keys
Don't use plaintext passwords at the command line level
Run cleanup scripts to remove ssh artifacts

RSA 2019

Standard ASEPS
/Library/LaunchAgents (root) /Library/LaunchDaemons (root) ~/Library/LaunchAgents (user) ~/Library/LaunchDaemons (user)

SIP Protected ASEPS
/System/Library/LaunchAgents /System/Library/LaunchDaemons

Lesser-Used ASEPS
/private/etc/daily.local /private/etc/weekly.local /private/etc/monthly.local

ASEP Piggybacking
/var/root/Library/preferences/com.apple.loginwindow.plist

RSA 2019

RSA 2019

Monitor ASEPS being created in your environment

Free Tool:
Block Block by Objective-See
objective-see.com

RSA 2019

rootkiter.com

Victim

Attacker-owned server
RSA 2019

mdfind provides macOS Spotlight functionality at the command line level.
Spotlight is constantly running in the background, indexing data by keywords
mdfind confidential -onlyin ~/Documents/ -0 | xargs -0 tar -rvf /tmp/exfil.tar

Data Index
Bank
Personal

Credit Private

RSA 2019

RSA 2019

Confidential.noindex 75 items
Force no indexing using folder name <folder>.noindex

OUT IN
Look for outbound SSH and SOCKS Tunnels
RSA 2019

INTRODUCING Holding slide for Exfil ­ Counter measures

RSA 2019

INTRODUCING Holding slide for Exfil ­ Counter measures

What it is: A Python framework for forensic triage collection on macOS

Purpose:

Quickly gather forensic data from systems of interest for incident response

Key Features:
· Easy to use · Runs natively on all Macs · Captures and parses critical
artifacts out-of-the-box
· Customizable data collection · Produces simple, consistent,
accessible output

Blog:

blog.crowdstrike.com

RSA 2019

RSA 2019

RSA 2019

RSA 2019

RSA 2019

LIFETIME ACHIEVEMENT
AWARD

RSA 2019

LIFETIME ACHIEVEMENT
AWARD

RSA 2019

THANK YOU
www.crowdstrike.com

