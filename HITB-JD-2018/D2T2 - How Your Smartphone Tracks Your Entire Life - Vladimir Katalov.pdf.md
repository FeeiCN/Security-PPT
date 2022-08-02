Hack In The Box

Smartphone Privacy:
How Your Smartphone Tracks Your Entire Life

Vladimir Katalov, ElcomSoft

© ElcomSoft Ltd. www.elcomsoft.com

1

What's Inside?
Account passwords and tokens Web and application passwords Messages (including iMessage) Health data (Apple Health) Payment data (Apple Pay)

Call logs Emails and chats Wi-Fi passwords Documents, settings and databases Web browsing history, tabs, searches Pictures and videos Geolocation history, routes and places
2

Apple and Law Enforcement
How Apple Serves LE Requests
 Law enforcement can obtain evidence via government information requests
 The process is fully transparent (by extent allowable by law)  Annual stats published and available to general public:
https://www.apple.com/legal/privacy/transparency/requests-2017-H2-en.pdf  Guidelines:
https://www.apple.com/privacy/docs/legal-process-guidelines-us.pdf https://www.apple.com/legal/privacy/law-enforcement-guidelines-outside-us.pdf
3

Apple and Law Enforcement
How LE Requests Work
· Account Preservation Request followed by Account Information Request · All requests are handled in compliance with Apple's privacy policy · Serving government requests, Apple provides information in a proprietary format · Investigators receive encrypted information. Decryption key is provided, but no tools
to decrypt data · The decryption process is complicated · Many experts use third-party tools or services such as Kleopatra, GPG, Cellebrite, or
BlackBag
4

Apple and Law Enforcement
LE Requests: Pros and Contras
· Government requests don't need the user's authentication credentials
· If login and password unavailable, a government request may be the only way to obtain information
· Authentication credentials aside, government requests have many significant drawbacks compared to in-house cloud acquisition
5

Apple and Law Enforcement
The Ugly Side of LE Requests
· Lots of legal paperwork · Account Preservation Request must be submitted ahead of acquisition · The process is lengthy
· Up to two months · Apple provides data in binary format, encrypted
· Decryption key is provided, but no decryption tools · Third-party tools and services add extra costs and delays · Apple will NOT deliver messages or passwords (iCloud Keychain) · Additional encryption with a different encryption key
6

Apple and GDPR
What Is There...
 All major data is there  Pictures included  Browsing history, files, iCloud Mail  7 days to process request  Delivers snapshot taken on Day 1 of
the request
7

Apple and GDPR
And What Is Not
 Certain things are missing  Apple Pay ­ never synced with
iCloud  Screen Time ­ why?  Messages ­ additional encryption
 We can decrypt it  Passwords ­ iCloud Keychain has
additional encryption  We can decrypt it
8

Apple Health

 Activity ­ how much you move

 Nutrition ­ breakdown of your diet

 Sleep ­your sleep habits

 Mindfulness

Additional data categories

 Body Measurements ­ height and weight

 Health Records - DA + Health Records

 Heart ­ blood pressure, heart rate

 Reproductive Health ­ sexual activity and menstruation cycles

 Results ­ various medical test results (e.g. sugar level)

 Vitals ­ blood pressure, body temperature, heart rate, breathing rate

 Medical ID ­ essential medical data

9

Apple Health
Where Apple Health Gets Data From
 Data received from HealthKit devices (iPhone, Apple Watch, compatible fitness trackers etc.)  Automatic data submission  Pulse, blood pressure  Data for Mindfulness, Heart and Activity  Apple Watch collects Sleep data; no automatic mode (third-party apps can be used)
 Third-party apps (Nike+, Strava, Workouts++)  All data categories supported  Each data category has a list of "Recommended" third-party apps for collecting that type of data  Third-party apps must be activated in categories tracked in Health > Sources
10

Apple Health
How Apple Health Data Is Stored
 Main data stored at /private/var/mobile/Library/Health/
 Two linked SQLite databases: healthdb.sqlite and healthdb_secure.sqlite
 Training geodata: healthdb_secure.hfd (encrypted)
11

Apple Health
Database Structures
 healthdb.sqlite mainly contains information about data sources
 healthdb_secure.sqlite stores basic health information with frequent links to the first DB
Prior work A Forensic Exploration of iOS Health Data (Heather Mahalik) https://www.sans.org/summit-archives/file/summit-archive-1528385073.pdf
12

Apple Health
13

14

Apple Health
healthdb_secure
 objects: information on "samples" including ID and source
 Samples contain information including timestamp, type, numerical data (e.g. "10 steps") or category data ("test result positive"), and ID
 Samples are linked with "samples" table via ID
 Data values may be stored in various tables, e.g. quantity_samples or cda_documents
15

Apple Health
Category Samples
 Category samples contain nonnumerical data
 Corresponds to list view selection in the app
 category_samples table stores these values
 Restoring category_samples values to meaningful data is essential for understanding Apple Health data
16

Researching healthdb_secure

Table

Description

objects

Sample's uuid and source

samples

id, event type and time

quantity_samples

Source of numeric values

category_samples

Non-numerical category samples (e.g. "positive" or "negative" test result)

correlations

Keeps references to data instances, allowing to corellate quantitative data with activities

key_value_secure

Information about the user

metadata_values, metadata_keys
workouts,workout_events

Sample metadata. Could be a note, time zone etc. Cumulative information about the workout: length, calories burned, distance walked, workout type etc.

fitness_friend_activity_snapsho Data received via "share with friends & family". The contact is linked via an extra file

ts

ActivitySharing/contacts.dat. This file contains information about the contact (name, phone number and e-mail)

cda_documents

Binary data of a corresponding CDA document

data_provenance

Allows linking data sample with data source (device, app etc.)

unit_strings

Metric type (lb/kg etc.) from quantity_samples

17

Known healthdb tables

Table authorization cloud_sync_stores key_value source_devices sources subscription_data_anchors sync_stores

Descripion Authentication and sync data Last sync data App-specific values (e.g. if emergency sos mode is active) Information about devices the data was synced from Information on received data (source, modification date) Data about synchronization List of synchronization sources

18

Apple Health
Accessing Apple Health Data
 Export from Health app (XML)  Local backup (encrypted only)  File system acquisition (requires jailbreaking)  GDPR request  Government/LE request  Cloud extraction
19

Apple Health
Extracting Apple Health Data: The Easy Way
 Apple Health is available via logical acquisition  No Apple Health data in unencrypted backups!
 Unlike keychain, which is still present in unencrypted backups, protected with a hardware key
 Set a known password before making a backup  Make local backup with iTunes  Decrypt backup, access Apple Health data  View with forensic software (or analyse databases manually)
20

Apple Health
Extracting Apple Health Data: The Complex Way
 Apple Health is available via file system acquisition  Jailbreak required
 At this time, jailbreak is available for all versions of iOS from 8 to 11.3.1  Jailbreak, use ssh (or forensic software)  Obtain TAR image  View with forensic software (or analyse databases manually)  Needed only if backup if password-protected
21

Apple Health
Extracting Apple Health Data: GDPR
 EU users can access their Health data by pulling a GDPR request  Registering GDPR request: privacy.apple.com  Apple ID, password, 2FA required  Takes up to 7 days to receive the data  Multiple binary and text formats
22

Apple Health
Apple Health and Cloud
 Native Apple Health data is synced with iCloud to all registered devices
 Third-party apps operate through HealthKit  Some third-party app data is not shared with Apple Health  Certain apps use proprietary cloud sync (Strava, Endomondo)  Medical ID data is unique per device and does not sync  CDA records do not sync (to the best of our knowledge)
23

Apple Health
Apple Health and iCloud
 Apple Health data can be obtained from iCloud  May contain significantly more information compared to what is
available on device  Technically, Apple Health belongs to "synced data" as opposed to
"cloud backups"  This results in significantly more reliable extraction  Loose expiration rules of iCloud tokens compared to backups
24

Apple Health
Accessing Health Data
 Receive encrypted file chunks  Request zone list  Request zone sync  Request file links  Download files
25

Apple Health
Request Zone List

contaiterId: "com.apple.health.sync" bundleId: "com.apple.healthd"

 All zones start with PrimarySyncCircle  Followed by zone UUID, e.g. 1AA8B4D0-9B73-4D88-A740-
BFE04DD8A5AC  New zones created with logging in or on subsequent logins  Zones are periodically merged

26

Apple Health

Request Zone Sync
 Request / Result:
container { str: "PrimarySyncCircle:AF64D6
29-3688-4062-9503-BE97B45D5BC2" num: 6
}

propertyName {

name: "ChangeSet"

}

propertyValue {

valueType: 6

authInfo {

owner1Dsid: "8888888888"

fileChecksum: "\001\233\254\2671GQ\316\324mM\243\031\254\322|\017\364\233N\

f"

structSize: 13465

token: "B3B9SvMwRNXBK6fGaX6vOuVLwfbWA1H5QwEAAAMR7kM"

url: "https://p29-content.icloud.com:443"

owner2Dsid: "8888888888"

wrapped_key {

name: "\003_\242\000\335\266\255\312\0304\226e\344\333\235\227\226a\266\32

3H\364\021DM3\341\020~B\337O\346\016\017\357\375C[\346\301\311\356\261"

}

fileSignature: "\001\310\273\331\332\326a\337\202Xd\035e`p\277\321\226\211\

222\312"

downloadTokenExpiration: 1529588220

}

}

27

Apple Health
Download Files
 Files from the list are downloaded by chunks  Downloaded chunks must be decrypted  record/sync request returns encrypted key
(wrapped_key)  Key is decrypted  We've got a key for unwrapping encryption keys that
accompany each chunk  These keys are unwrapped with wrapped_key and
are used to decrypt the chunks  Decrypted chunks are merged into files
28

Apple Health
Sounds too simple?
 Synced data is received in protobuf structures  Received structures are serialized objects
described in HealthDaemon header files  There are several types of Protobuf structures
29

Apple Health
Accessing Health Data in iCloud
We can download synced data, which includes Apple Health What can go wrong:
 Two-factor authentication may be an issue  Access to secondary authentication factor is
required (unless using authentication token)
30

Smartphone Privacy
Your Smartphone Knows More About Your Life
 Both Apple and Google introduced useraccessible usage stats
 Details application usage and categories  Time spent in Games, Entertainment,
Social Networking and other activities  Daily, hourly and weekly statistics
31

Smartphone Privacy
iOS 12 Screen Time: Statistics
 Daily and weekly reports  Per category statistics and enforceable
time limits  Per app tracking  Track how many times you picked up
your phone
32

Smartphone Privacy
iOS 12 Screen Time: Restrictions
 Track or restrict time spent on Gaming, Entertainment, Social Networking, Reading & Reference and other activities
 Track and restrict individual applications
 Set downtime and app limits  Content and privacy restrictions  Screen Time Passcode
33

Smartphone Privacy
iOS 12 Screen Time: Statistics
 Daily and weekly reports  Per category statistics and enforceable
time limits  Per app tracking  Track how many times you picked up
your phone
34

Smartphone Privacy
iOS 12 Screen Time: iCloud Sync
 See how you use apps across multiple devices
 Downtime and App Limits sync through iCloud
 Restrictions and limits automatically applied to all devices
 Usage data syncs to all devices on the same Apple ID  So that you can't cheat the system  Unless you're 7 years old
35

Smartphone Privacy
iOS 12 Screen Time: knowledge.db
 Screen Time is based on information collected in knowledgeC.db database /private/var/mobile/Library/CoreDuet/Kno wledge/KnowledgeC.db
 SQLite format  knowledgeC.db available since iOS 9
36

Smartphone Privacy
iOS 12 Screen Time: Conclusion
 Apple knows how you use your devices in great detail
 They store it on their servers:  Statistics and reporting
 With iCloud sync  Loosely enforceable restrictions
 With iCloud sync
37

Smartphone Privacy
Google: Digital Wellbeing
 Available in Android Pie  Currently in beta, only on Pixels  Must be downloaded from
Google Play  Accessible via Settings  Daily overview
 Unlocks  Notifications  Pie chart: app usage time
38

Smartphone Privacy
Digital Wellbeing: What's Reported
 Per app screen time  How much time you spent in each app
 Daily reports  Custom timers
 Per app only  No categories!  Enforced on this device only  No cloud sync!
39

Smartphone Privacy
Digital Wellbeing: What's Reported
 Per app times opened  How frequently you used each app
 Daily reports  Custom timers: screen time only (no limit on how
many times the app can be launched)  Per app only  No categories!  Enforced on this device only  No cloud sync!
40

Smartphone Privacy

Apple Screen Time vs. Google Digital Wellbeing

 Apple Screen Time

 Google Digital Wellbeing

 Per app and per category statistics

 Per app statistics only

 Daily and weekly reports

 Daily reports

 iCloud sync to all user's devices

 No sync with Google Account

 Both usage and restrictions

 Nothing gets synced

 Downtime

 Wind Down

 Restrictions passcode

 No restrictions passcode

 No notification stats

 Statistics on number of notifications

41

Google Dashboard
 Apple syncs Screen Time  Google does not sync Digital
Wellbeing  Android 9 runs in less than 0.1% of devices anyway
 Does Google know less about its users?
 No!  Google Dashboard has
significantly more information than Screen Time and Digital Wellbeing combined
42

Smartphone Privacy
Your Smartphone Tracks Your Location
 Precise  Energy-efficient  Constantly running unless explicitly disabled  Sometimes running even if explicitly
disabled https://www.bbc.com/news/technology45183041 https://www.macrumors.com/2018/08/13/go ogle-location-history-disabled-still-storesdata/
43

Smartphone Privacy
Who Tracks Your Location?
 Google (iOS, Android, desktop ­ Chrome, Google services in any browser)
 Apple (iOS, macOS)  Facebook (on all platforms)  Countless third-party apps and services
 Even if location is disabled  Yes, it is possible
44

Smartphone Privacy
Why Google, Apple and FB track your Location?
 To serve you better  Google/Apple Maps, navigation  FB: local groups & events  Much more relevant search results  Find My Phone / Find My Device  Convenience: know how busy that restaurant is at this time of day or even right now  Indoor navigation (with beacons)
 To sell ads  Google's main source of income  Location-based ads  Facebook: major advertisement network
 To sell your data  Apple & Google do not sell location data  Facebook does 45

Smartphone Privacy
Third-Party Apps Tracking
 Collecting location, contacts, phone usage patterns and much more
 To serve you better:  You really thought that game was free?
 To sell your data:  Multiple brokers buy this sort of data  Location data collected from everywhere  Including Wi-Fi networks and reverse BSSID lookup  Even IP address used as source of location data
46

Smartphone Privacy
Where location data is stored?
 Physical devices (iOS, Android, Windows, macOS X, other systems)
 Apple iCloud  Google account  Third-party cloud accounts
 Social networks  Health & fitness applications  Instant messengers  Dating apps  Taxi apps  PoI/travel apps
47

Smartphone Privacy

How Apple Stores Location Data

 Location data is stored as:

 Database records

 PLIST values

 JSON values

 Mixed PLIST/JSON structures as database records

 Log files (plain text)

· Where?

· System databases (related to services/daemons)

· Built-in apps data

· Temporary/cached data

· iCloud

48

Smartphone Privacy

What Apple Collects
 Collected data depends on the source and storage
 These items are always present:
 Latitude
 Longitude
 Timestamp (mainly in UNIX Epoch format)
 We've seen location records without timestamps
 We have seen location names/IDs without lat/lon

 These items may be additionally available:
 Altitude
 Accuracy ­ how accurate the measurement is (can be represented as a circle with a given radius)
 Confidence ­ how confident the system is about the stated accuracy
 Min/Max latitude and longitude ­ yet another representation of accuracy. Can be represented as a rectangular area
 Speed
 Course ­ represents angle of turns in degrees
 End Date ­ date when device left location  Address ­ street address; can be stored as a string or as
49
multiple items

Smartphone Privacy
Routes
 Routes can be tracked on device or in the app  Can take speed, course, angle (magnetic compass) values into account  Routes stored on device
 Routes can be calculated in forensic software based on individual location records  Based on recorded locations  Can be calculated based on location records obtained from multiple sources (e.g. Maps, thirdparty apps, system logs etc.)
50

Smartphone Privacy

iTunes Backups: Sources of Location Data
 Local (iTunes) backups are a major source of evidence  Backups contain location data (not as much as stored on
physical device)

 Apple Maps

 Location cache

 Calendar  Media (EXIF)  Wallet  Multiple third-party apps
data and cache

 Frequent / Significant Locations
 Locations cached during media files analysis
 Apple Pay locations

51

Smartphone Privacy
Media (EXIF)
 Windows, macOS, iOS, Android  Windows: File Properties > Details > GPS  macOS: More Info > Latitude and Longitude  Third-party software can map location data  Forensic software extracts EXIF tags, parses
location data, builds routes
52

Smartphone Privacy
Wallet
 Stored in folders:  /HomeDomain/Library/Passes/Cards  /HomeDomain/Library/Passes/BadUbiquitousPasses  In .pkpass subfolders  Look for pass.json files  Some contain locations

{ "description": "SOURCE to DESTINATION", "formatVersion": 1, "organizationName": "The Airlines", "relevantDate": "2013-02-20T20:40:00+01:00", "boardingPass": { "transitType": "PKTransitTypeAir" }, "locations": [ { "latitude": 12.11334800, "longitude": 13.56972200, "relevantText": "AirportName1" }, { "latitude": 80.45861100, "longitude": 80.10611100, "relevantText": "AirportName2" } ]
}

53

Smartphone Privacy

Third-Party Apps

 Multiple third-party apps and games collect location data

 Even when you are not using the app

 This data may or may not be available in

{

iTunes backups

"jsonConformingObject":{ "meta":{

 Apps may also cache thousands location points

"location":{ "course":-1, "city":"test",

/private/var/mobile/Containers/Data/Applic ation/<UUID>/Library/Caches/

"speed":-1, "longitude":3.4, "gps_time_ms":1506351484216,

<UUID>: unique app identifier on this

"latitude":1.2, "horizontal_accuracy":65,

device

"vertical_accuracy":10,

"altitude":0.1

}

}

}

54

}

Smartphone Privacy

Additional Location Data Exclusive to Physical Extraction

 Physical acquisition extracts full image of the file system  Gains access to many files not in the backup
 System logs, cache and temporary files  Protected app data  Apps with backups disabled  Automatic sync with iCloud (if iCloud sync is enabled in the Settings)  Scheduled sync  On device reboot  On account change

 Locations cache (3G/LTE, Wi-Fi)
 Frequent/Significant Locations
 Media file analysis cache
 Third-party cache
 Apple Pay locations

55

Smartphone Privacy
Location Cache (Physical Extraction Only)
 Databases:  /private/var/root/Library/Caches/locationd/cache_encryptedA.db  /private/var/root/Library/Caches/locationd/cache_encryptedB.db  /private/var/mobile/Library/Caches/com.apple.routined/cache_encryptedA.db  /private/var/mobile/Library/Caches/com.apple.routined/cache_encryptedB.db
 Tables:  Latitude, Longitude, Altitude, Timestamp, HorizontalAccuracy, VerticalAccuracy, Speed, Course, Confidence  MinimumLatitude, MinimumLongitude, MaximumLatitude, MaximumLongitude
56

Smartphone Privacy: significant locations
57

Smartphone Privacy
Significant Locations (Physical Extraction Only)
/private/var/mobile/Library/Caches/com.apple.routined/ · Local.sqlite: data obtained on this device · Cloud.sqlite: synced significant locations · Cache.sqlite: temporary and unprocessed data
58

Smartphone Privacy

Synced Location Data (iCloud)

 System apps syncing location data via iCloud:

 Apple Maps

 Health

 Calendar

 Wallet

 Sensitive location data with direct sync:

 Significant Locations: direct device-to-device sync only. Bypasses iCloud

· Wi-Fi connections

 Reverse BSSID lookup reveals locations

 Depending on the source, may not connect timestamps (first connect and last disconnect only)

 Logs contain timestamps

59

Smartphone Privacy

Locations Cached When Analyzing Media Files

 photoanalysisd process analyses media files; assigns tags, discovers faces, extracts EXIF etc

/private/var/mobile/Media/PhotoData/Caches/Gr aphService/PhotosGraph/photosgraph.graphdb

 photosgraph maps extracted EXIF locations

60

61

The Future Is...
iCloud: what's next?
More synced data in iCloud  Home data (HomePod, various
sensors, lights, thermostats etc)  Screen Time (app usage;
previously available via full file system acquisition only)  Voice memos  Weather & Stocks
Remember Celebgate? ;) 62

Smartphone Privacy

Google Android

 Android collects significantly more data than iOS

 Google collects significantly more information than Apple

 These statements are not equivalent

 Android ecosystem is seemingly built for tracking

 Every other app in Google Play store tracks your location

 Even with Location disabled

 Even without Location permission

 All Android apps have Internet access

 No special permission is needed

 IP address determines approximate location

 Allows scanning nearby Wi-Fi networks

63

Smartphone Privacy
Google Android
 All Android apps can access BSSID of currently connected Wi-Fi, and
 All Android apps can scan nearby Wi-Fi access points  Single BSSID reverse lookup determines current location within 20m radius
 Triangulating multiple BSSID's reveals precise location
 Multiple free and commercial Wi-Fi Geo-Location databases exist
 openwlanmap.org
64

Smartphone Privacy
Google: Sources of Location Data
 Location History: Takeout, cloud extraction, online interface  Extremely comprehensive  Stored in the cloud (Google Account)  Cloud contains more information than device
 Google Maps and My Places  Photos: local (extract from device), Takeout (Google
Photos)  System logs: local (root required)  App data: local (root required), cloud backups (limited)
65

Smartphone Privacy
Google Location History
· Multiple data points · Many years worth of data
(you will be surprised) · Collected from all devices on
the same Google Account · Android, iOS, Windows, Mac · Google services in all Web
browsers (if signed in) · Location + date & time)
66 Page 66

Smartphone Privacy
Media
· Photos from all user's devices can be uploaded to Google Photos
· Google Photos not the same as Google Drive!
· Location data via EXIF
67 Page 67

68 Page 68

Smartphone Privacy
Where to get the data from?
 Device (local backup)  Device (cloud backup) // credentials required!  Device (physical acquisition) // requires jailbreaking/rooting  Cloud (synced data) // credentials required!  Cloud (location services like Apple Find My Phone, Apple Find Friends.
Google Find My Device) // credentials required!  Third-party [cloud] services // credentials required!
69

Smartphone Privacy
iCloud security overview (HT202303)

Reality

 Home data: have not checked yet, but seems that not

 Health: not always (only if all devices on the account use macOS 11.4 / iOS 12

 iCloud Keychain: yes

 Payment information: yes

 Siri information: yes

 Wi-Fi network information: password only

Still, most of that data can be

downloaded and decrypted with

proper tokens

70

Obtaining the Credentials

How to get cloud password or token?

 Legally (court order)

 Extract from local iTunes backup (with

 Social engineering

password)

 From computer (cached browser passwords)

 From password manager (need to crack master password first)

 From computer (saved token from

 Password re-use often helps

system or apps)

 From the sticker on monitor or note

 Extract macOS keychain

under the keyboard

 From other account that was easier to  Rubberhose cryptanalysis

break (Apple / Google / Microsoft)

71

Smartphone Privacy
Vladimir Katalov, ElcomSoft
Questions?

© ElcomSoft Ltd. www.elcomsoft.com

72

