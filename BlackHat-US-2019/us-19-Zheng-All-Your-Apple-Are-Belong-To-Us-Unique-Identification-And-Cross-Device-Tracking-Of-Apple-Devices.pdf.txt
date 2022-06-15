All Your Apple Are Belong To Us: Unique Identification and Cross-device Tracking
of Apple Devices

Whoami
· SparkZheng @ Twitterspark @ Weibo · Alibaba Senior Security Expert · CUHK PhD, Blue-lotus and Insight-labs · Gave talks at BlackHat (USA&EU), RSA, DEFCON, HITB, etc.
· Xiaolong Bai (bxl1989 @ Twitter&Weibo) · Alibaba Security Expert · Ph.D. graduated from Tsinghua University · Published papers on S&P, Usenix Security, CCS, NDSS

Agenda
· Introduction · Unique Identification · Cross-device Tracking · Discussion · Conclusion

The New Multi-screen World

Introduction
· Smartphones and laptops are the most frequently used personal devices.
· A study by Google[1] showed that 98% of surveyed Internet users in the U.S. use multiple devices on a daily basis.
· 90% people switch devices sequentially to accomplish a task over time.

The New Multi-screen World

Introduction

Pic from [1]
· According to a survey[1], consumers usually take a multi-device path to purchase their goods.
· Device switching may cause advertisers to lose their customers.

Cross-device Tracking

Introduction
· People with ulterior motives want to connect to individuals through these devices.
· Identifying and correlating people's devices allows cross-device companies to track one person and target operations (e.g., advertising) on both of his/her devices.

Cross-device Tracking

Introduction

BUT...

Introduction
Uniquely Identifying and Cross-device Tracking

· Cross-device tracking is based on resolving two tasks:

Pic from google

1. Uniquely identifying users' devices (Device ID).

2. correlating those that belong to the same user (User ID).

Agenda
· Introduction · Unique Identification · Cross-device Tracking · Discussion · Conclusion

Unique Identification
Device ID
· Apple's identifiers strategy:
1. Short live 2. Random 3. Anonymous
· What advertising & analytics companies want:
1. Permit long term tracking of a user 2. Aren't transparent or in line with user expectations 3. Users don't have control

Unique Identification

*OS Public APIs for Device IDs - IDFA & IDFV
· UUID is a universally unique value that can be used to identify types, interfaces, and other items.
· Vender ID and Advertising ID can be used to uniquely identify a device (Device ID). Users can control them.

UUID Vendor ID Advertising ID

Scope App Developer Device

Control

Backed Up

Uninstall App

No

Uninstall all Apps from same teamID

YES

Reset Advertising ID

YES

Restored Across Devices
No
No
No

Unique Identification
*OS Public APIs for Device IDs - IDFA & IDFV
· When a user enables "Limit Ad Tracking", the OS will send along the advertising identifier with a new value of"00000000-0000-0000-0000000000000000."
· Vender ID can be reset by uninstalling all apps from same teamID.
· Advertising ID and Vender ID are not enough for advertising & analytics companies.

Unique Identification
*OS Public APIs for Device IDs - Keychain
· Keychain gives apps a mechanism to store small bits of user data in an encrypted database.
· The app's data stored in the keychain will not be lost even after the application is uninstalled.
· It's useful for normal users. But, it's easy for hackers to delete the data in the keychain on a jailbroken device.

Unique Identification
Hardware Based Device IDs - IMEI
· We can obtain most of device IDs through the MGCopyAnswer() of libMobileGestalt.dylib. · However, some entitlements like com.apple.private.MobileGestalt.AllowedProtectedKeys are
required. A POC of getting the IMEI:

Unique Identification
Hardware Based Device IDs - I/O Registry
· The I/O Registry is a dynamic database that describes a collection of "live" objects (nubs or drivers). When hardware is added or removed from the system, the Registry is immediately updated to reflect the new configuration of devices. Thus, it contains lots of Device IDs.
· However, most of values are protected by "iokit-get-properties" sandbox rules.

Unique Identification
*OS Private APIs for Device IDs - Mac Address
· A MAC address is the unique identifier that is assigned by the manufacturer to a piece of network hardware (e.g., wireless and bluetooth).
· Traditional methods of obtaining a WIFI MAC address has been pruned on the iOS system.
macOS
iOS

Unique Identification
*OS Private APIs for Device IDs - Mac Address (iOS 10)
· socket(AF_ROUTE, SOCK_RAW, 0) can be used to create AF_ROUTE raw sockets. Only super users can create this socket in Unix & Linux. But in iOS, apps in the sandbox can also create this socket. Through SOCK_RAW, we can access ARP cache routines (contains MAC info).
Pic from [9]
· In iOS 11, Apple doesn't allow apps to access the MAC addresses in the ARP table and read the Mac addresses from there during the scan. Because MAC addresses are unique and some developers misuse them to track users.

Unique Identification
*OS Private APIs for Device IDs - Bluetooth Mac Address

· Bluetooth Device Address (or BD_ADDR) is a unique 48-bit identifier assigned to each Bluetooth device by the manufacturer (similar to WIFI mac address).

· iPhone and iPad are using an integrated chipset supporting both WIFI and Bluetooth. Because they are initialized at the same time during manufacturing, their addresses usually get assigned consecutively.

same

· It means if we can get the Bluetooth mac address,

we can calculate the WIFI mac address.

Unique Identification
*OS Private APIs for Device IDs - Bluetooth Mac Address
· Mach messages contain typed data, which can include port rights and references to large regions of memory.
· Through Mach MSG, sandboxed app can communicate with unsandboxed Mach (MIG) services, XPC services and NSXPC services.

sandbox
APP
sandbox
APP

Mach Services XPC services NSXPC services

Unique Identification

*OS Private APIs for Device IDs - Bluetooth Mac Address (iOS 12)
· Bluetoothd communicate with sandboxed apps and other unsandboxed processes (e.g., SpringBoard) through Mach messages.

Bluetoothd

Session token Session token
Session token

Apps SpringBoard
sharingd

· There are 132 functions (start from 0xFA300) in the "com.apple.server.bluetooth" Mach service of bluetoothd.

Unique Identification

*OS Private APIs for Device IDs - Bluetooth Mac Address (iOS 12)

· Some useful functions of "com.apple.server.bluetooth":

Function BTSessionAttachWithRunLoopAsync BTSessionDetachWithRunLoopAsync BTLocalDeviceGetDefault BTLocalDeviceGetAddressString BTLocalDeviceGetModulePower

Feature Attach Bluetooth service Detach Bluetooth service Get the handler of local device Get the address of Bluetooth device Get the status of Bluetooth device

· We can attach the Bluetooth service through BTSessionAttachWithRunLoopAsync().

· We get the handler of local device through BTLocalDeviceGetDefault().

Unique Identification
*OS Private APIs for Device IDs - Bluetooth Mac Address (iOS 12)
· BTLocalDeviceGetAddressString() will return the mac address of Bluetooth!
· Note that, this method was available on iOS 12.0 and fixed in iOS 12.1. · In addition, WIFI and Bluetooth addresses of new iPhone models (after iPhone 7?) are not
consecutive. But ...

Agenda
· Introduction · Unique Identification · Cross-device Tracking · Discussion · Conclusion

Cross-device Tracking

Device Graph Link Structure
Person A

Deterministic links

Probabilistic links

UserID

UserID

IP

IP

iPhone

iPad

iPad

Mac

· After unique identification of each device, cross-device companies must match those that appear similar.
· A device graph can be built from connected components (each of which represents a user) with a maximum number of vertices (devices) and edges (device connections).

Cross-device Tracking

Data Links

Deterministic Linking

Person A

Person A

Person A

UserID iPhone

UserID iPad

UserID iPhone

UserID iPad

· Deterministic data links devices together based upon UserID (e.g, Apple ID, phone number, user account identifier).

Person A IP
iPhone

Probabilistic Linking Person A

Person A

IP

IP

IP

iPad

iPhone

iPad

· Probabilistic data links devices together based on a set of feature data that model the entity (e.g., IP addresses, coordinate information and device names).

Cross-device Tracking
AppleID Leak ­ iOS 8 (CVE-2014-4423)
· The Accounts subsystem in Apple iOS 8 allows attackers to bypass a sandbox protection mechanism and obtain an active iCloud account's Apple ID and metadata via a crafted application.
· POC:

Cross-device Tracking
AppleID Leak ­ iOS 10 (CVE-2017-6976) · AppleIDAuthAgent is a service that handles actions regarding a users Apple ID,
including iCloud information linked to that account.
· It runs com.apple.coreservices.appleid.authentication XPC service, which could be accessed by any application and it has a flow that leaks AppleID.
· POC:

Cross-device Tracking
AppleID Leak ­ iOS 12 (CVE-2019-????)
· In iOS and macOS, Game Center has a NSXPC service - com.apple.gamed. It provides interfaces to get authenticated player information. However, it doesn't has an entitlement protection, thus any applications inside the sandbox can access it and get the username of Apple ID.
· This vulnerability was fixed in iOS 12.4. A POC of getting apple ID on iOS 12:

AirDrop Internals

Cross-device Tracking
· AirDrop utilizes Bluetooth and WiFi · Discovery via Bluetooth · Used to set up an ad-hoc WiFi network
using Apple Wireless Direct Link (AWDL) interface awdl0 · Client browses for AirDrop service via mDNSResponder (for _airdrop._tcp. local service) · Returns an IP/port for a HTTPS webserver

Cross-device Tracking
AirDrop Internals: Discovery Process
· Discovery information for normal Apple devices.

Cross-device Tracking
AirDrop Internals: Discovery Process
· Discovery information for personal Apple devices.

Cross-device Tracking
AirDrop Internals: Private API
· /System/Library/PrivateFrameworks/Sharing.framework has private APIs to control AirDrop Service, we can use dlopen and dlsym to find these APIs

Method SFBrowserCreate SFBrowserOpenNode SFOperationCreate SFOperationResume

Feature Create a browser note Start a browser scanning Create an operation note Start the operation

Cross-device Tracking
Remotely AppleID Leak ­ iOS 12 (CVE-2018-4322)
· Using SFBrowserCreate() and SFBrowserOpenNode(), we could find nearby AirDrop devices.
· We can get computer names, ServiceName (unique device ID) and DisplayName from browserCallback(). If the devices belongs to a same person, we could get the Apple ID (CVE2018-4322) as well.

Cross-device Tracking
Remotely AppleID Leak ­ iOS 12 (CVE-2018-4322)
· We have reported this issue to Apple in May, 2018. Apple fixed it in iOS 12 (September).
· However, this vulnerability was not fixed completely. Old iOS devices can still use this bug to gain DeviceIDs & AppleIDs of other devices (even if they upgrade to iOS 12).
· This vulnerability is very powerful because it can remotely gain sensitive information from one user ' s device to other user's devices (without installing a payload).

Cross-device Tracking
UserID Leak ­ Arbitrary Sqlite Querying (CVE-2019-8532)
· In iOS 9, we found a vulnerability in com.apple.medialibraryd.xpc NSXPC service. This vulnerability can be exploited to read, write and query arbitrary SQLite files (e.g., SMS message database, Gmail database, WeChat database) outside the sandbox.
POC:
· The sandboxed app can use [[connection remoteObjectProxy] beginTransactionForDatabaseAtPath] method to connect arbitrary SQLite files on the system and then use [[connection remoteObjectProxy] executeQuery] to execute SQL commands.

Cross-device Tracking
UserID Leak ­ Arbitrary Sqlite Querying (CVE-2019-8532)
· In iOS 10, the exploit doesn't work. Because Apple added a new privacy mechanism called "Consent Alert Purpose String".
· To make exploit work again. We need to add a propose string key name to the project and call [MPMediaLibrary requestAuthorization] to get an authorization from the user.

Cross-device Tracking
UserID Leak ­ Arbitrary Sqlite Querying (CVE-2019-8532)
· After getting an authorization, we can query arbitrary SQLite files (e.g., SMS message database, Gmail database, WeChat database) outside the sandbox.
· These databases contain a large amount of user information including UserIDs (e.g., phone number and Apple ID).
· Also, we can control the PC register of the medialibraryd system process using the fts3_tokenizer() vulnerability on iOS 12.1.4.

Cross-device Tracking
UserID Leak ­ Arbitrary Sqlite Querying (CVE-2019-8532)
· This vulnerability was fixed in iOS 12.2. Note that, this vulnerability can be used to execute a JOP exploit and bypass the PAC mitigation in iOS user space.
· Welcome to join us for another talk - HackPac : Hacking Pointer Authentication in iOS user space, DEF CON 27.

Cross-device Tracking

Probabilistic Data

Person A IP
iPhone

Probabilistic Linking Person A

Person A

IP

IP

IP

iPad

iPhone

iPad

· Probabilistic links connect a device to a person algorithmically, based on characteristics and metadata such as: ­ IP addresses ­ Device names (Apple style) ­ URLs ­ Coordinate information

Apple Style Device Name

Cross-device Tracking
bxl min

· When the device is initialized, Apple will set the device name based on the user's name. Although it's convenient, it may reveal the user's information, or even help the advertising & analytics companies to associate the device.

Cross-device Tracking
Probabilistic Data Links through Algorithm
· Uniquely identifying a device.

UUID

UUID

UUID

UUID

UUID

UUID

UUID

UUID

· Calculating similarity to each identified devices.
· The devices pair with the maximum similarity above a similarity threshold.

Algorithm from [3]

· If such pair exists, it is added to the device graph and the next iteration starts with a new device.

Agenda
· Introduction · Unique Identification · Cross-device Tracking · Discussion · Conclusion

Data is Dangerous

Discussion

· Data brings power and danger · Gathering data adds overhead and liability · Unexpected data adds more risks and distrust

Discussion
Analyzing the IPC Messages of System Services
· We can use instrumentation to analyze the IPC related API calls and messages of system services. These APIs may be abused to uniquely identify and cross-device track users.

Discussion
Analyzing the Behavior of the App
· By hooking some well known APIs (e.g., IDFV), Frida can help us to locate the function of device info collection through Thread.backtrace().

Faking the Device Information

Discussion
· By using instrumentation (e.g., Cydia substrate), we can return random and fake device information to the apps to protect our privacy.

· A total random value may make the app failed to execute. We can partially add noise to the data through differential privacy algorithm.
Pic from [10]

Discussion
Differential Privacy
· Differential privacy provide means to maximize the accuracy of queries from statistical databases while measuring the privacy impact on individuals whose information is in the database.
· For instance, sql-differential-privacy[6] is a query analysis and rewriting framework to enforce differential privacy for general-purpose SQL queries.

user data

add noise

privatized data

iOS 13

Discussion
· In iOS 13, instead of using a social account or filling out forms, Apple will provide developers with a unique random ID.
· Companies cannot get the information of usernames and passwords which means UserID leakage vulnerabilities become more powerful.
· Apple will prevent apps from using Wi-Fi and Bluetooth to approximate your location without actually asking for it.

Agenda
· Introduction · Unique Identification · Cross-device Tracking · Discussion · Conclusion

Conclusion
· We list several approaches (e.g., public APIs and vulnerabilities like CVE-2018-4322) to uniquely identify the Apple device even after a system rebooting or resetting.
· We present more advanced algorithms and vulnerabilities (e.g., CVE-2018-4321, and CVE2019-8532) to associate Apple device through deterministic user IDs (e.g., Apple IDs and phone numbers) and probabilistic data (e.g., device name, booting time and IP addresses).
· We discuss feasible solutions (e.g., instrumentation and differential privacy) to detect and prevent uniquely identifying and cross-device tracking.
· Acknowledgement: Qianru Wu, Zhijian Deng, Hunter @ Alibaba Inc., and Deven @ Apple Inc.
· Note that: all four vulnerabilities we found were reported to Apple (follow-up id: 710526756) and we believe our study can help Apple to maintain and improve the privacy of their products.

Reference
[1]. The New Multi Screen World Study, Google [2]. OS Internals Volume III Security & Insecurity [3]. A Privacy Analysis of Cross-device Tracking, USENIX Security 17 [4]. Staying secure and unprepared: understanding and mitigating the security risks of Apple ZeroConf, S&P 16 [5]. https://marketing.adobe.com/resources/help/en_US/mcdc/mcdc-links.html [6]. https://github.com/ChiChou/passionfruit [7]. sql-differential-privacy, https://github.com/uber/sql-differential-privacy [8]. Frida https://www.frida.re/docs/ios/ [9]. Raw Sockets - 101 Vivek Ramachandran [10]. http://www.cleverhans.io/privacy/2018/04/29/privacy-and-machine-learning.html [11]. Better Apps Through Better Privacy, Apple, WWDC 2018

Thank You
SparkZheng @ Twitter spark @ Weibo

