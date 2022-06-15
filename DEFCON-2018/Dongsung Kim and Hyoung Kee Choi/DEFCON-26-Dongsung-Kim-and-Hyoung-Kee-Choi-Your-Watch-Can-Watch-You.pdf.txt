-2-
u Dongsung Kim u Graduate Student, Sungkyunkwan University u @kid1ng / https://kidi.ng
u Hyoung-Kee Choi u Professor, Sungkyunkwan University u https://hit.skku.edu/~hkchoi

-3-
u Motivation u Tizen Security Internals u Dan the D-Bus Analyzer u Privilege Violations u Conclusion

1

-5-
u Samsung's smartwatch products: S2, S3, Sport
° Track fitness; control smart devices; receive calls, texts, and emails; pay with NFC
° Bluetooth only or with dedicated cellular LTE ° App marketplace: Samsung Galaxy Apps
· Development with Tizen SDK and Samsung SDK
u Sensitive information and high privileges
° Powerful processor and tracking sensors ° Personal data from user's smartphone
· Contacts, calendar, location, email, notification, ...
° Access to privileged actions must be controlled
· Sending a quick reply, obtaining the GPS location, ...
Image: Samsung

-6-
u Linux-based Open source operating system
° Maintained by the Linux Foundation ° Mainly developed by Samsung
u Shipped with many of Samsung's products
° Smartwatches, wearables, smartphones, cameras, smart TVs, home appliances, ...
u Samsung Gear firmware
° Tizen's open source components
· Operating system, system services, ...
° Samsung's closed source components
· Drivers, system services, applications, ...
Image: Tizen Project, a Linux Foundation Project

-7-
u May 2015: Ajin Abraham "Hacking Samsung's Tizen: The OS of Everything" @ HITBSecConf
° Over-privileged apps, no DEP, broken ASLR, WebKit vulns
u Apr 2017: Amihai Neiderman "Breaking Tizen" @ Security Analyst Summit
° 40 0-day vulnerabilities in Tizen and Tizen Store
u Jul 2017: PVS-Studio "27 000 Errors in the Tizen Operating System"
° 900 code errors in a portion of Tizen source code

-8-
u Sungkyunkwan University is funded and operated by the Samsung Foundation.

2

- 10 -
u Files, Directories, UNIX Sockets, Utilities u Applications
° Use Tizen APIs to access the subsystems
· e.g., Frameworks, Services, ...
u Services
° Special privileged daemons dedicated for a resource
· e.g., Wi-Fi, Bluetooth, GPS, messaging, sensors, ...
° Must reject requests from unauthorized parties
Source: Tizen Wiki

u Service must check if calling app has access
° App must acquire the "privilege" in prior
u App dev specifies privileges in tizen-manifest.xml
° User accepts the permission for the app ° Installer checks and registers the privilege policy ° Accesses are controlled at the runtime
u Tizen defines many privileges
° internet, bluetooth, network.set, screenshot, notification, email, ...
° Only some of them are "Public"
· Allowed to be used by most developers
° Level: Public, Partner, Platform; private use
Source: Tizen Wiki Image: "locked" by Jenie Tomboc / CC BY

tizen-manifest.xml

- 11 -
Signed by Store

.tpk app package
On user's smartphone

- 12 -

u DAC (Discretionary Access Control)
° Classic UNIX user ID + group ID policies
u SMACK (Simplified Mandatory Access Control in Kernel)
° Kernel-space isolation ° App receives a unique label at install time
· e.g., User::Pkg::sample_app
° For every kernel object access, the current context (label) is checked against the SMACK rules

u Cynara
° User-space privilege management daemon ° Used by services to check
the calling application's privilege ° Identifies an application with its SMACK label ° Checks the label against Cynara database
u Security Manager
° Security policy configurator daemon
· At install time, launch time, and runtime
° Populates DAC policies, SMACK labels, and Cynara database from different sources
· e.g., default filesystem, manifest files, ...

Source: Tizen Wiki

- 13 -

u IPC (Inter-Process Communication) system
° For Linux-like OSes, integrated with systemd ° High-level messages, useful built-in functions
· e.g., discoverability, introspection, ...
° Service daemon registers to D-Bus daemon, clients request resources via messages
° Tizen heavily relies on D-Bus*
u Concepts
° Service (Bus name, Destination) ° Client (Application, Source) ° Object, Interface, Method, Property

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

* Bus name

Source: freedesktop.org Project, Pid Eins Image: "File:D-Bus method invocation.svg" by Javier Cantero / CC BY-SA 4.0

- 14 -

u Patched to perform Cynara checks
° Introduced along with Cynara (Tizen 3.0) ° Never accepted in upstream
u Granular access control to messages
° <check> element in busconfig file ° Destination, interface, member, and privilege ° D-Bus daemon asks Cynara to allow or deny

/etc/dbus-1/system.d/bixby-agent.conf

Source: Tizen Wiki

- 15 -
u Location Manager API with location privilege

- 16 -
u Location Manager API without location privilege
PID
u dlog: Tizen's system log u Location library liblbs-location.so.1
performs location_check_cynara u  First privilege check

u Reverse engineering liblbs-location.so.1

- 17 -
Patch to bypass  MOV R0, #0 MOV R0, #0

- 18 -
u Patching liblbs-location.so.1
u D-Bus library LBS_DBUS_CLIENT sends a request to Location daemon lbs-server
u D-Bus daemon rejects the request with DBus.Error.AccessDenied
u  Second privilege check

Image: Tizen Wiki

- 19 -
  
Cynara daemon

- 20 -

Malware (Client Process) No 

Service Process




Message Request
D-Bus Bus

Message Response

u Two points that check privileges of a malware
°  D-Bus daemon: Request in transit °  Service daemon: After receiving the request
u Failing both could allow privilege violation

Image: Tizen Wiki

3

- 22 -

No argument is given

dbus-send --system --print-reply --dest=org.tizen.lbs.Providers.LbsServer /org/tizen/lbs/Providers/LbsServer org.tizen.lbs.Manager.AddReference

Without privilege

With privilege

Error org.freedesktop.DBus.Error.AccessDenied: ... privilege="http://tizen.org/privilege/locati on" (uid=654 pid=2536 comm="")

Error org.freedesktop.DBus.Error.InvalidArgs: Type of message, '()', does not match expected type '(i)'

u Use dbus-send directly to send messages to D-Bus daemon
u Errors suggest privilege validation always happens first
u Idea: Send non-privileged requests to all, then gather services that return any error but DBus.Error.AccessDenied  Privilege violation?

- 23 -

u Evaluates privilege verification of D-Bus services
° Spawns a test process on a remote device ° Recursively scans the D-Bus tree for its structure
· Bus names, objects, interfaces, properties, methods, ...
° Reads every property of every object ° Calls every method of every interface
u Output
° D-Bus tree flattened into a JSON file (db.json) ° dbus-send commands that require further attention
· Introspectable properties (properties.log) · Callable methods (methods.log)

MMoMdoMudoludoeludeluele

Shell Script

Result

Runner
App stdout Package stderr

Extracted Filesystem
db.json properties.log methods.log

Target Device

https://github.com/kiding/dan

Image: "File:Dan Howell by Gage Skidmore.jpg" by Gage Skidmore / CC BY-SA 3.0

- 24 -

u Each module sends a shell script to run u Wraps the script into an application
° No privilege in tizen-manifest.xml ° main function of the app
· Executes the script · Compresses stderr stdout into tar.gz · Logs the location of the tar.gz
u Builds, installs and runs it on the target device
° Automated with Tizen Studio and sdb
u Waits for the tar.gz location to appear in log u Pulls and decompresses the tar.gz
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

- 25 -

u Aggregate all possible services (bus names)

° One service can have multiple bus names
° Unique :1.4 Well-known org.example.service

/usr/share/dbus-1 /system-services /org.freedesktop
.systemd1.service

u From extracted firmware

° /usr/share/dbus-1/*

u From runtime

° Call D-Bus built-in method to D-Bus daemon: org.freedesktop.DBus.ListNames

Source: freedesktop.org

- 26 -

u Recursively introspects the services
° Objects, interfaces, methods, ...
u Each service can provide its object structure
° Call D-Bus built-in method to service daemon: org.freedesktop.DBus .Introspectable.Introspect
° Service can respond with well-formatted XML

Bus name: org.freedesktop.systemd1 Object: /
Child objects

- 27 -
Bus name: org.freedesktop.systemd1 Object: .../syslog_2eservice Interface: org.freedesktop.systemd1.Service
GetAll.jison
u Reads every property value of every object for all of its interfaces
° Call D-Bus built-in method to service daemon: org.freedesktop.DBus.Properties.GetAll
u Parses dbus-send "format"
° Into a JSON-compliant form ° With a custom Bison parser

- 28 -

Gibberish random argument
dbus-send --system --print-reply --dest=org.example.service /org/example/object org.example.method string:1 string:1 string:1 string:1 string:1 string:1 string:1 string:1 string:1 string:1 string:1 string:1 string:1 string:1 string:1 string:1

org.freedesktop.DBus.Error.AccessDenied

org.freedesktop.DBus.Error.InvalidArgs

No error

(Ignore)
u Calls every method of every interface for all the objects
° Using random arguments to never actually execute the program logic
u Parses the returned error, then categorize each method ° AccessDenied, ServiceUnknown, UnknownObject, NoReply, ...  Ignore
° Other errors or no error at all: "Callable"

"Callable"

u Prunes duplicate bus names
...
° Unique :1.6 Well-known org.freedesktop.systemd1
° Hash every object, remove duplicates
u Prints property and callable methods
° In dbus-send command form ° For further manual analysis
...

- 29 -
db.json
methods.log
Arguments

- 30 -
u Target Device
° Samsung Gear Sport: Build RC4, Tizen 3.0.0.2, Release Date 2018-03-28 ° Takes about an hour
u Statistics
° Total # of bus names: 269 ° Readable Properties #: 130,634 ° Callable Methods #: 2,319 (!)
· Excluded Default Interface: org.freedesktop.DBus, ...

- 31 -

u  Third privilege check
° Log suggests access is denied after service explicitly asks Cynara
° Yet no D-Bus error gets returned; treated as a normal D-Bus call
° Dan categorizes methods as "Callable"
u Examine manually further for exploits
° On Gear Sport and Gear S2

Malware (Client Process) No 

Message Request D-Bus Bus

Service Process

Message Response

No error

4

- 33 -
u Wi-Fi u Bluetooth u Screen u Notification u Email u ...and many more
Image: "1f4a5.svg" by Twitter, Inc and other contributors / CC BY 4.0

- 34 -
u D-Bus APIs for wpa_suplicant are fully exposed
° wpa_supplicant: Free software implementation of 802.11i ° Tizen builds its own API/daemons on top
u Every method is callable, every property is readable
° CreateInterface, RemoveInterface, Scan, ... ° WPS Start, GetPin; P2P Find, Connect, ...
u Violated Tizen privileges
° network.get, network.profile, network.set, wifidirect ° location, location.enable (Platform level; private privilege)

- 35 -
u GPS coordinates can be publicly queried from
° BSSID of nearby Wi-Fi networks ° Signal values of the networks
u Malware can track user even if location is off
° Force-trigger Wi-Fi Scan ° Acquire network information ° Query current location

u Partially exposed: projectx.bt/bt_core
° Tizen's own API/daemons for Bluetooth ° Silently authorize incoming pair request ° Force discoverable "piscan" mode ° Prompt a PIN request system UI °...
u Malware can phish user to obtain PIN
° Present legitimate system UI to trick user ° Any input is returned to the malware

- 36 -
Actual name of the paired smartphone

- 37 -
Demo
u Partially exposed: bluez
° bluez: Bluetooth stack for Linux-like OSes ° Force disconnect, gather information, ...
u Bonus: No restriction on hcidump utility
° Any user can dump Bluetooth packets with no superuser privilege
° Dump HCI packets + force disconnect + auto reconnect  Extract link key
u Violated Tizen privileges
° bluetooth ° bluetoothmanager (Platform level; private)

- 38 -
Demo
u Enlightenment/EFL
° Tizen's choice of window manager
u Partially exposed: enlightenment.screen_capture
° dump_topvwins dumps windows into PNG files
u Violated Tizen privileges
° screenshot (Platform level; private)

- 39 -
Demo
u Partially exposed: com.samsung.wnoti
° Manages notification transmitted to Gear ° Many functions that involves notification ° ClearAll to remove all notifications ° GetCategories to read all data °...
u Violated Tizen privileges
° notification, push, ???

- 40 -
Demo
u wemail_consumer_service
° Manages user's mailbox on Gear, communicates with manager on phone
° req_show_on_device to launch Email app on phone ° req_mail_state to modify message data ° req_send_mail to send any email from user's address
u "Security" for private methods
° {"id":"wemail-private-send-mail-noti", ...} ° strcmp and nothing more
u Violated Tizen privileges
° messaging.write ° email, email.admin (Platform level; private)

- 41 -
Sequence shortened from https://youtu.be/Yc4AvlJLLpw

- 42 -
u wnoti-service.conf: Only three methods are listed
° Many other sensitive methods are missing

- 43 -

dbus

dbus

Application

Net-Config Daemon

WPA Supplicant

D-Bus Bus

dbus

dbus

ConnMan Daemon

Wi-Fi Direct Manager

How it was designed

How it actually works

u connman.conf and net-config.conf protect Tizen's own Wi-Fi daemons u But wpa_supplicant.conf doesn't exist: D-Bus is not hierarchical

Image: Tizen Wiki

- 44 -
u D-Bus client API is officially supported
° Eldbus: D-Bus integration with Enlightenment/EFL
u PoC application "BitWatch"
° Benign-looking watch face ° Privilege: network.get, internet ° Reads notification data,
sends it to a remote server
u Submitted to Samsung Galaxy Apps
° Obfuscated to hide system service names
u Passed validation process!
° Gone on sale until we took it down

- 45 -
u Apr 10th: Vulnerabilities reported to Samsung Mobile Security u Apr 19th: Report triaged by Samsung u Patches for open-source services committed to the Tizen Git repository u May 29th: Updates released for Gear Sport and S3 u Jul 13th: Severity assigned High

5

- 47 -
u Tizen security internals
° Objects and privileges ° Where privileges are validated:  application,  Cynara-aware D-Bus, and  service
u Dan the D-Bus analyzer
° AccessDenied as an oracle to discover privilege violations
u Privilege violations
° Wi-Fi, Bluetooth, screen, notification, email takeover ° Possibility of distribution via official store

- 48 -
u Can Dan be applied to
° Other Tizen systems: Smart TV, home appliances, IoT, ... ° Other D-Bus systems: Linux-like OS, ...
u Obfuscation techniques
° To bypass future mitigations of Galaxy Apps

- 49 -
u Hyoung-Kee Choi for guidance u Hyoseok Lee for initial research u Betty Bae for proofreading u Gyeonghwan Hong, Shinjo Park, and John Steinbach for advice

