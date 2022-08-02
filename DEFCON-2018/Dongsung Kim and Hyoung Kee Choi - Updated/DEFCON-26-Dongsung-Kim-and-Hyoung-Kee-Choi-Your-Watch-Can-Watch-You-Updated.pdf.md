2
Surname
u Dongsung Kim u Graduate Student Researcher u @kid1ng u https://kidi.ng
u Hackers In inTrusion Laboratory u https://hit.skku.edu

1

4
u Samsung's smartwatch products
° Track fitness; control smart devices; receive calls, texts, and emails; pay with NFC
° Pair phone with Bluetooth + Wi-Fi (+ LTE) ° App marketplace: Samsung Galaxy Apps
u So much sensitive information
° Contacts, calendar, location, email, notification, ... ° Access to privileged resources must be controlled
Image: Samsung

5
u Samsung Gear firmware consists of:
° Tizen's open source components ° Samsung's closed source components
u Linux-based open source OS
° Many of Samsung's products ° Smartwatches, smartphones,
cameras, smart TVs, home appliances, ...
Image: Tizen Project, a Linux Foundation Project

6
u Ajin Abraham @ HITBSecConf u Amihai Neiderman @ Security Analyst Summit
° 40 0-day vulnerabilities
u PVS-Studio "27 000 Errors in Tizen OS"
° 900 code errors in a portion of Tizen source code
u We focus on a smartwatch's perspective

2

-9-
u Files, Directories, UNIX Sockets, Utilities u Applications
° Use Tizen APIs to access the services
u Services
° Special privileged daemons dedicated for a resource
· e.g., Wi-Fi, Bluetooth, GPS, messaging, sensors, ...
° Must reject requests from unauthorized parties
Source: Tizen Wiki

u App dev specifies privileges in manifest
° User accepts the permission for the app ° Installer checks and registers the privilege policy ° Accesses are controlled at the runtime
u Tizen defines many privileges
° internet, bluetooth, network.set, screenshot, notification, email, ...
° Only some of them are "Public" level ° "Partner, Platform" level disallowed for most
Source: Tizen Wiki Image: "locked" by Jenie Tomboc / CC BY

10

tizen-manifest.xml

Signed by Store

.tpk app package
On user's smartphone

11

u DAC (Discretionary Access Control)
° UNIX user ID + group ID policies
u SMACK (Simplified Mandatory Access Control in Kernel)
° Kernel-space MAC ° App receives a unique label at install time
· e.g., User::Pkg::sample_app
° Current label (context) is checked against the SMACK rules

u Cynara
° User-space privilege management daemon ° Services check the calling app's privilege ° Identifies the app with its SMACK label ° Checks the label against Cynara database
u Security Manager
° Security policy configurator daemon ° Populates DAC/SMACK/Cynara database

Source: Tizen Wiki

12

u IPC (Inter-Process Communication) system
° On Linux-like OS, useful built-in functions
· e.g., discoverability, introspection, ...
° Service daemon registers to D-Bus daemon ° Clients request resources via messages
u Tizen heavily relies on D-Bus*

org.example.interface method SetFoo(int32): void
method GetFoo(): int32
Client Process

Service Process
/org/example/object3 /org/example/object2 /org/example/object1 SetFoo(int32)

:1.4

:1.7

org.example.service

Message Request
D-Bus Bus

Message Response

* Unique bus name Well-known bus name

Source: freedesktop.org Project, Pid Eins Image: "File:D-Bus method invocation.svg" by Javier Cantero / CC BY-SA 4.0

13

u IPC (Inter-Process Communication) system
° On Linux-like OS, useful built-in functions
· e.g., discoverability, introspection, ...
° Service daemon registers to D-Bus daemon ° Clients request resources via messages
u Tizen heavily relies on D-Bus*

Client Process D-Bus Bus

Service Process

14

u IPC (Inter-Process Communication) system
° On Linux-like OS, useful built-in functions
· e.g., discoverability, introspection, ...
° Service daemon registers to D-Bus daemon ° Clients request resources via messages
u Tizen heavily relies on D-Bus*

Client Process
:1.7
D-Bus Bus
* Unique bus name

Service Process

15

u IPC (Inter-Process Communication) system
° On Linux-like OS, useful built-in functions
· e.g., discoverability, introspection, ...
° Service daemon registers to D-Bus daemon ° Clients request resources via messages
u Tizen heavily relies on D-Bus*

Client Process
:1.7 Message Request
D-Bus Bus
* Unique bus name

Service Process

16

u IPC (Inter-Process Communication) system
° On Linux-like OS, useful built-in functions
· e.g., discoverability, introspection, ...
° Service daemon registers to D-Bus daemon ° Clients request resources via messages
u Tizen heavily relies on D-Bus*

Service Process

Client Process
:1.7 Message Request
D-Bus Bus
* Unique bus name Well-known bus name

:1.4 org.example.service

17

u IPC (Inter-Process Communication) system
° On Linux-like OS, useful built-in functions
· e.g., discoverability, introspection, ...
° Service daemon registers to D-Bus daemon ° Clients request resources via messages
u Tizen heavily relies on D-Bus*

Service Process

Client Process

/org/example/object1 SetFoo(int32)

:1.4

:1.7

org.example.service

Message Request

D-Bus Bus

* Unique bus name Well-known bus name

18

u IPC (Inter-Process Communication) system
° On Linux-like OS, useful built-in functions
· e.g., discoverability, introspection, ...
° Service daemon registers to D-Bus daemon ° Clients request resources via messages
u Tizen heavily relies on D-Bus*

org.example.interface method SetFoo(int32): void
method GetFoo(): int32
Client Process

Service Process
/org/example/object1 SetFoo(int32)

:1.4

:1.7

org.example.service

Message Request

D-Bus Bus

* Unique bus name Well-known bus name

19

u IPC (Inter-Process Communication) system
° On Linux-like OS, useful built-in functions
· e.g., discoverability, introspection, ...
° Service daemon registers to D-Bus daemon ° Clients request resources via messages
u Tizen heavily relies on D-Bus*

org.example.interface method SetFoo(int32): void
method GetFoo(): int32
Client Process

Service Process
/org/example/object1 SetFoo(int32)

:1.4

:1.7

org.example.service

Message Request
D-Bus Bus

Message Response

* Unique bus name Well-known bus name

20
/etc/dbus-1/system.d/bixby-agent.conf
u Patched to perform Cynara checks
° D-Bus daemon in the middle asks Cynara
u Access control on messages
° <check> element in busconfig file ° Destination, interface, member, and privilege
Source: Tizen Wiki

21
u Location Manager API with location privilege
u dlog: Tizen's system log

22
u Location Manager API without location privilege
PID
u Logs from Same PID (Process IDentifier) shows failure u Location library liblbs-location.so.1 performs location_check_cynara u  First privilege check down the chain

u Reverse engineering liblbs-location.so.1
If R0 is not zero: "Cynara_check failed"

23
Remove to bypass  MOV R0, #0 MOV R0, #0

24
u Patching liblbs-location.so.1
PID
u Still same PID u LBS_DBUS_CLIENT requests to LbsServer u D-Bus daemon responds with AccessDenied u  Second privilege check

Image: Tizen Wiki

- 25 -

   ??
?

Cynara daemon

26

Malware (Client Process) No 

Service Process




Message Request
D-Bus Bus

Message Response

u Two potential points to check the privileges
°  D-Bus daemon -- Request in the middle °  Service daemon -- After receiving the request
u Failing both could allow privilege violation

Image: Tizen Wiki

3

- 28 -

No argument is given

dbus-send --system --print-reply --dest=org.tizen.lbs.Providers.LbsServer /org/tizen/lbs/Providers/LbsServer org.tizen.lbs.Manager.AddReference

Without privilege

With privilege

Error org.freedesktop.DBus.Error.AccessDenied: ... privilege="http://tizen.org/privilege/locati on" (uid=654 pid=2536 comm="")

Error org.freedesktop.DBus.Error.InvalidArgs: Type of message, '()', does not match expected type '(i)'

u Privilege validation always happens first!
u Some methods, for non-privileged requests, return an error that is not AccessDenied  Possible privilege violation?

29

u Evaluates privilege verification of D-Bus services
° Spawns a test process on a remote device ° Recursively scans the D-Bus structure ° Reads every property, calls every method
u Output
° Flattened D-Bus structure (db.json) ° For further analysis: dbus-send commands
· Readable properties (properties.log) · Callable methods (methods.log)
Image: "File:Dan Howell by Gage Skidmore.jpg" by Gage Skidmore / CC BY-SA 3.0

MMoMdoMudoludoeludeluele

Shell Script

Result

Runner
App stdout Package stderr

Extracted Filesystem
db.json properties.log methods.log

Target Device

https://github.com/kiding/dan

30

u Gather all possible bus names (services)

° One service can have multiple bus names
° Unique -- :1.4 Well-known -- org.example.service

u From extracted firmware
° /usr/share/dbus-1/*

org.freedesktop.systemd1.service

u From current runtime

° D-Bus built-in method: ListNames

Source: freedesktop.org

31

u Recursively introspects the services
° Objects, interfaces, methods, ...
u Service can respond with its object structure
° On D-Bus standard method: Introspect ° In well-formatted XML

Bus name: org.freedesktop.systemd1 Object: /
Child objects

32
GetAll.jison
u Reads every property value
° D-Bus built-in method: GetAll
u Custom Bison parser
° Parses dbus-send "format" ° Into a JSON-compliant form

33

Gibberish random argument
dbus-send --system --print-reply --dest=org.example.service /org/example/object org.example.method string:1 string:1 string:1 string:1 string:1 string:1 string:1 string:1

AccessDenied
(Ignore)

InvalidArgs

No error

Callable

u Calls every method of every interface for all the objects
° Random arguments not to execute the logic
u Categorizes each method ° AccessDenied, ServiceUnknown, UnknownObject, NoReply, ...  Ignore
° Other errors or no error at all: Callable

34

db.json
... ...
u Hashes every object, remove duplicates u Prints readable properties, and callable methods

methods.log
Arguments

4

- 36 -
u Target Device
° Samsung Gear Sport: Build RC4, Tizen 3.0.0.2, Release Date 2018-03-28 ° Takes about an hour
u Statistics
° Total # of bus names: 269 ° Readable Properties #: 130,634 ° Callable Methods #: 2,319 (!)
· Excluded Default Interface: org.freedesktop.DBus, ...

37

u  Third privilege check
° Log shows some services check Cynara ° Yet no D-Bus error gets returned ° Dan categorizes them callable
u Examine manually further for exploits

Malware (Client Process) No 

Message Request

Service Process

Message Response

No error

38
u Wi-Fi u Bluetooth u Screen u Notification u Email u ...and many more
Image: "1f4a5.svg" by Twitter, Inc and other contributors / CC BY 4.0

- 39 -
u Fully exposed: wpa_suplicant
° Free software implementation of 802.11i ° Tizen builds its own API/daemons on top
u All is callable, all is readable
° CreateInterface, RemoveInterface, Scan, ... ° WPS Start, GetPin; P2P Find, Connect, ...
u Violated Tizen privileges
° network.get, network.profile, network.set, wifidirect ° location, location.enable (Platform level; private privilege)

40
u GPS coordinates can be publicly queried from:
° BSSID of nearby Wi-Fi networks ° Signal values of the networks
u Malware can track user even if location is off
° Force-trigger Wi-Fi Scan ° Acquire network information ° Query current location

u Partially exposed: projectx.bt/bt_core
° Tizen's own API/daemons for Bluetooth
u Malware can...
° Silently accept incoming pair request ° Force discoverable "piscan" mode ° Prompt a PIN request system UI to phish user
· Any user input is returned to malware

41 Actual name of the paired smartphone

42
Demo
u Partially exposed: bluez
° Bluetooth stack for Linux-like OSes ° Force disconnect, gather information, ...
u Bonus: No restriction on hcidump utility
° Any user can dump Bluetooth packets ° With no superuser privilege
u Dump HCI packets + force disconnect + auto reconnect  Extract link key u Violated Tizen privileges
° bluetooth ° bluetoothmanager (Platform level; private)

43
Demo
u Partially exposed: enlightenment.screen_capture
° Enlightenment: Tizen's choice of window manager ° dump_topvwins dumps windows into PNG files
u Violated Tizen privileges
° screenshot (Platform level; private)

44
Demo
u Partially exposed: com.samsung.wnoti
° Manages notification transmitted to Gear
u Malware can...
° ClearAll to remove all notifications ° GetCategories to read all data °...
u Violated Tizen privileges
° notification, push, ¯\_()_/¯

Demo

- 45 -

u Partially exposed: wemail_consumer_service
° Manages user's mailbox on Gear, communicates with phone
u Malware can...
° req_show_on_device to launch Email app on phone ° req_mail_state to modify message data ° req_send_mail to send any email from user's address °...
u Violated Tizen privileges
° messaging.write ° email, email.admin (Platform level; private)

46
u Service rejects private method calls... u Only if "Id" does not match
° {"Id":"wemail-private-send-mail-noti"}
u strcmp and nothing more
° No proper privilege check in place

- 47 -
https://youtu.be/Yc4AvlJLLpw

48
u wnoti-service.conf: Only three methods are listed
° Many other sensitive methods are missing

49

dbus

dbus

Application

Net-Config Daemon

WPA Supplicant

dbus

dbus

How it was designed

D-Bus Bus

ConnMan Daemon

Wi-Fi Direct Manager

How it actually works

u connman.conf and net-config.conf protect Tizen's own Wi-Fi daemons u But wpa_supplicant.conf doesn't exist... D-Bus is not hierarchical!

Image: Tizen Wiki

50
u D-Bus client API is officially supported u PoC application "BitWatch"
° Privilege: network.get, internet ° Reads notification data ° Sends it to a remote server
u Submitted to Samsung Galaxy Apps
° Obfuscated to hide system service names ° Passed validation process! ° Gone on sale until we took it down

- 51 -
u Apr 10th: Vulnerabilities reported to Samsung Mobile Security u Apr 19th: Report triaged by Samsung u Patches for open-source services committed to the Tizen Git repository u May 29th: Updates released for Gear Sport and S3 u Jul 13th: Severity assigned High

5

- 53 -
u Tizen security internals
° Objects and privileges ° Where privileges are validated
·  client process,  Cynara-aware D-Bus, and  service process
u Dan the D-Bus analyzer
° AccessDenied as an oracle to discover privilege violations
u Privilege violations
° Wi-Fi, Bluetooth, screen, notification, email takeover ° Possibility of distribution via official store

54
u Can Dan be applied to
° Other Tizen systems
· Smart TV, home appliances, IoT, ...
° Other D-Bus systems
u Obfuscation techniques
° To bypass future mitigations of Galaxy Apps

- 55 -
u Hyoung-Kee Choi for guidance u Hyoseok Lee for initial research u Betty Bae for proofreading u Gyeonghwan Hong, Shinjo Park, and John Steinbach for advice

