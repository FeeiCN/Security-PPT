Evolution of iOS Data Protection and iPhone Forensics:
from iPhone OS to iOS 5
Andrey Belenko & Dmitry Sklyarov Elcomsoft Co. Ltd.
1

· Basics · iOS Security before iOS 4 · iOS 4 Data Protection · iOS 5 Data Protection Changes · Summary

Agenda

2

Forensics 101
Acquisition  Analysis  Reporting
GOALS: 1.  Assuming  physical  access  to  the  device  extract  as  much   informa>on  as  prac>cal 2.  Leave  as  li@le  traces/ar>facts  as  prac>cal
3

iOS:Why Even Bother?
· More than 5 years on the market · 360+ million iOS devices sold worldwide · 6 iPhones, 4 iPods, 3 iPads · "Smart devices" ­ they do carry a lot of sensitive data · Corporate deployments are increasing
There was, is, and will be a real need in iPhone Forensics
4

iPhone Forensics 101
· Passcode
­Prevents unauthorized access to the device ­Bypassing passcode is usually enough
· Keychain
­System-wide storage for sensitive data ­Encrypted
· Storage encryption
5

iPhone Forensics 101
· Logical: iPhone Backup
­Ask device to produce a backup ­Device must be unlocked ­Device may produce encrypted backup ­Limited amount of information
­Get backup from iCloud
· Physical: filesystem acquisition
­Boot-time exploit to run unsigned code ­Device lock state isn't relevant ­Can get all information from the device
· Physical+: flash memory acquisition
­Same requirements as for physical ­Also allows recovery of deleted files!
6

The Inception
Runs iPhone OS (up to 3.1.3)
·Based on Mac OS X
Has a crypto co-processor
06/29/2007 iPhone
7

Hardware Keys
Two embedded AES keys:
· GID ­ shared by all devices of same family
· UID ­ unique for each and every device
No known ways to extract GID/UID keys
06/29/2007 iPhone
8

Device Keys
·To avoid unnecessary exposure, usage of UID/
GID keys is limited
·Device keys are computed from hardware keys
during boot:
­ 0x835 = AES_Enc (UID, 01010101010101010101010101010101); ­ 0x836 = AES_Enc (UID, 00E5A0E6526FAE66C5C1C6D4F16D6180); ­ 0x837 = AES_Enc (GID, 345A2D6C5050D058780DA431F0710E15); ­ 0x838 = AES_Enc (UID, 8C8318A27D7F030717D2B8FC5514F8E1);
9

iPhone OS Security
Relies on chain of trust:
· BootROM loads trusted iBoot · iBoot loads trusted kernel · Kernel runs trusted apps
Apps must be signed
· Developers can sign and run their apps on their devices ($99/yr)
Applications are sandboxed
10

Breaking Free
· Jailbreak ­ circumventing iOS security in order to run custom code
· Boot-level or application-level · Tethered or untethered
11

Breaking Free
· App-level JB gets kernel code execution by exploiting apps or services
­e.g.Absinthe, JailbreakMe ­Can be fixed by new firmware
· Boot-level JB loads custom kernel by breaking chain of trust
­e.g. limera1n ­Can't be fixed if exploits vulnerability in BootROM
12

Jailbreak+Forensics=?
· Tethered JB
­Host connection is required to boot into JB state ­Exploit(s) are sent by the host ­May leave minimal traces on the device
· Untethered JB
­Device is modified so that it can boot in jailbroken state by itself
­Leaves permanent traces
13

Passcode (Before iOS 4)
· Lockscreen (i.e. UI) is the only protection · Passcode is stored in the keychain
­Passcode itself, not its hash
· Can be recovered or removed instantly
­Remove record from the keychain ­And/or remove setting telling UI to ask for the
passcode
14

Keychain (Before iOS 4)
· SQLite3 DB, only passwords are encrypted · All items are encrypted with the device key
(0x835) and random IV · Key can be extracted (computed) for offline use · All past and future keychain items from the device
can be decrypted using that key

Encrypted  with  Key  0x835

IV

Data

0 16

SHA--1  (Data)

15

Storage Encryption (Before iOS 4)
· No encryption.
16

iPhone 3G
Hardware is very similar to original iPhone No real security improvements over previous model
06/29/2007 07/11/2008 iPhone iPhone  3G
17

iPhone 3GS
New application processor Hardware storage encryption
06/29/2007 07/11/2008 06/19/2009 iPhone iPhone  3G iPhone  3GS
18

iPhone 3GS Forensics
·Passcode: same as before ·Keychain: same as before ·Storage encryption:
­ Only user partition is encrypted ­ Single key for all data (FDE) ­ Designed for fast wipe, not confidentiality ­ Transparent for applications ­ Does not affect physical acquisition
This is true only for iPhone 3GS running iPhone OS 3.x
19

iPhone 4
No notable enhancements in security hardware over iPhone 3GS
Shipped with iOS 4 with major security improvements
06/29/2007 07/11/2008 06/19/2009 06/24/2010 iPhone iPhone  3G iPhone  3GS iPhone  4
20

iOS 4 Data Protection
· More robust passcode protection · Better storage encryption
­ Metadata is encrypted transparently (same as before)
­ Per-file encryption keys
· Better Keychain encryption · New backup format
­ Slower password recovery ­ Keychain items can migrate to another device
21

Protection Classes
· Content grouped by accessibility requirements:
­Available only when device is unlocked ­Available after first device unlock (and until power off) ­Always available
· Each protection class has a master key · Master keys are protected by device key and
passcode · Protected master keys form system keybag
­New keys created during device restore
22

Effaceable Storage
· Special region of flash memory to store small data items with ability to quickly erase them
· Items within effaceable storage are called lockers · As of iOS 4: 960 bytes capacity, 3 lockers:
­`BAG1' ­ System Keybag payload key and IV ­`Dkey' ­ NSProtectionNone class master key ­`EMF!' ­ Filesystem encryption key
23

System Keybag
· /private/var/keybags/systembag.kb · Three layers of encryption:
­System keybag file is encrypted by Data Protection ­Keybag payload is encrypted before writing to disk ­Master keys are encrypted with device key and/or
passcode key
24

Escrow Keybag
· "Usability feature" to allow iTunes to unlock the device
· Contains same master keys as system keybag · Stored on the iTunes side · Protected by 256 bit random "passcode" stored
on the device · With iOS 4, escrow keybag gives same powers as
knowing the passcode
25

Backup Keybag
· Included in the iOS backups · Holds keys to decrypt files and keychain items
included with the backup · New keys are generated for each backup
26

Keybag (locked)
Protected Key WRAP = 1
Protected Key WRAP = 2
Protected Key WRAP = 3
Protected Key WRAP = 1
Protected Key WRAP = 3
...

Unlocking Keybag

Passcode Key if (WRAP & 0x2)
UNWRAP UNWRAP
UNWRAP

Device Key if (WRAP & 0x1)
DECRYPT
DECRYPT DECRYPT DECRYPT

Keybag (unlocked) Key Key Key Key Key ...

27

iOS 4 Passcode
· Passcode is used to compute passcode key
­Computation tied to hardware key ­Same passcode will yield different passcode keys on
different devices!
· Passcode key is required to unlock most keys from the system keybag
­Most files are protected with NSProtectionNone and don't require a passcode
­Most keychain items are protected with ...WhenUnlocked or ...AfterFirstUnlock and require a passcode
28

iOS 4 Passcode
· Passcode-to-Key transformation is slow · Offline bruteforce currently is not possible
­Requires extracting hardware key
· On-device bruteforce is slow
­2 p/s on iPhone 3G, 7 p/s on iPad
· System keybag contains hint on password complexity
29

iOS 4 Passcode
· 0 ­ digits only, length = 4 (simple passcode)
30

iOS 4 Passcode
· 0 ­ digits only, length = 4 (simple passcode) · 1 ­ digits only, length  4
31

iOS 4 Passcode
· 0 ­ digits only, length = 4 (simple passcode) · 1 ­ digits only, length  4 · 2 ­ contains non-digits, any length
32

iOS 4 Passcode
· 0 ­ digits only, length = 4 (simple passcode) · 1 ­ digits only, length  4 · 2 ­ contains non-digits, any length
Can identify weak passcodes
33

iOS 4 Keychain
· SQLite3 DB, only passwords are encrypted · Available protection classes:
­ kSecAttrAccessibleWhenUnlocked (+ ...ThisDeviceOnly) ­ kSecAttrAccessibleAfterFirstUnlock (+ ...ThisDeviceOnly) ­ kSecAttrAccessibleAlways (+ ...ThisDeviceOnly)
· Random key for each item,AES-CBC · Item key is protected with corresponding
protection class master key

0

Class

Wrapped  Item  Key

Encrypted  Item

0

4

8

48

34

iOS 4 Storage
· Only User partition is encrypted · Available protection classes:
­ NSProtectionNone ­ NSProtectionComplete
· When no protection class set, EMF key is used
­ Filesystem metadata and unprotected files ­ Transparent encryption and decryption (same as pre-iOS 4)
· When protection class is set, per-file random key is used
­ File key protected with master key is stored in extended attribute com.apple.system.cprotect
35

iPhone 4S
No known security enhancements in hardware over iPhone 4
Shipped with iOS 5 with some security improvements
06/29/2007 07/11/2008 06/19/2009 06/24/2010 10/12/2011 iPhone iPhone  3G iPhone  3GS iPhone  4 iPhone  4S
36

iOS 5 Passcode
· Similar to iOS 4 · iPad 3 utilizes new hardware key UID+
­Algorithm is also slightly different ­No significant changes from practical point of view
37

iOS 5 Keychain
· All attributes are now encrypted (not only password)
· AES-GCM is used instead of AES-CBC
· Enables integrity verification

2

Class

Wrapped  Key  Length

Wrapped  Key

Encrypted  Data  (+Integrity  Tag)

0

4

8

12

38

iOS 5 Storage
· New partition scheme
­ "LwVM" ­ Lightweight Volume Manager
· Any partition can be encrypted · New protection classes
­ NSFileProtectionCompleteUntilFirstUserAuthentication ­ NSFileProtectionCompleteUnlessOpen
· IV for file encryption is computed differently
39

Creating the File
NSFileProtectionCompleteUnlessOpen

Generate random file key (AES)

KF

Generate file public/private PubF

keys (ECC)

PrivF

Master key from the system keybag (ECC)

PubKB PrivKB

Encrypt
Shared Secret

com.apple. system. cprotect

40

Reading the File
NSFileProtectionCompleteUnlessOpen

File key (AES)
File public/private keys (ECC)
Master key from the system keybag (ECC)
Requires a passcode (if any)

KF PubF PrivF
PubKB PrivKB

Decrypt
Shared Secret

com.apple. system. cprotect
41

Reading the File
NSFileProtectionCompleteUnlessOpen

File key (AES)
File public/private keys (ECC)
Master key from the system keybag (ECC)
Requires a passcode (if any)

KF PubF PrivF
PubKB PrivKB

Decrypt
Shared Secret

com.apple. system. cprotect

Looks  pre@y  much  like  BlackBerry  way  to   receive  emails  while  locked  :--)
42

43

iOS Forensics
· Acquiring disk image is not enough for iOS 4+
­ Content protection keys must also be extracted from the device during acquisition
­ Effaceable Storage contents are also needed to decrypt dd images.
· Passcode or escrow keybag is needed for a complete set of master keys
· In real world it might be a good idea to extract source data and compute protection keys offline
44

iOS Forensics

Must be done on the device Required to decrypt files/keychain Sufficient for offline key reconstruction

UID Key

Passcode
KDF

FS Key
Effaceable Storage `EMF!' / `LwVM' `Dkey' `BAG1'
systembag.kb

Decrypt

Key 89B Key 835

Decrypt

System Keybag (locked)
Class A Key (#1) Class B Key (#2) Class C Key (#3) Class D Key (#4)
Class Key #5 ...
Class Key #11

Passcode Key
Unlock
System Keybag (unlocked)

45

iOS Forensics

iOS version
Physical acquisition
Passcode recovery
Keychain decryption

iPhone

iPhone 3G

iPod Touch 1 iPod Touch 2

3.1.3

4.2.1

iPhone 3GS iPod Touch 3
iPad 1

iPhone 4 iPod Touch 4

iPhone 4S iPad 2, iPad 3
(JB)

3.1.3 5.1.1

5.1.1

5.0.1, 5.1.1

+

+

+

+

+

instant

+ instant

+

+

+

+

+

+

+

Disk decryption

not encrypted

+

+

46

Conclusions
· iPhone physical analysis is possible · Physical acquisition requires boot-time exploit · Passcode is usually not a problem
­ Due to technology before iOS 4 ­ Due to human factor with iOS 4/5
· Both proprietary and open-source tools for iOS 4/5 acquisition are available
47

Thank You! Questions?
48

Evolution of iOS Data Protection and iPhone Forensics:
from iPhone OS to iOS 5
Andrey Belenko & Dmitry Sklyarov Elcomsoft Co. Ltd.
49

