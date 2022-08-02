WHO AM I
· I live and work in Italy · Master's Degree in IT in 2002 · Founder and CEO @ REALITY NET · Digital Forensics Analyst · SANS Instructor FOR585/FOR500 · Researcher at IGSG ­ CNR
(Italian National Council of Research)

APPLE HOMEKIT
·Software framework for
home automation
·Apple-certified smart
accessories
·Accessories are grouped by
Rooms

CASE STUDY SCENARIO
1. Eve Door Sensor 2. Apple HomePod 3. Apple iPhone 7

APPLE HOMEPOD
·Smart Speaker developed by Apple ·Designed to work with other Apple
devices (i.e. iPhone and iPad)
·It works with Apple Music and the
Home app
·It integrates Siri and other HomeKit
devices

EVE DOOR SENSOR
· Connected via Bluetooth · Apple HomeKit enabled · Remotely controlled by the HomePod

APPLE HOMEPOD ­ IDENTIFICATION (DEVICE)
https://support.apple.com/en-us/HT208347
The Serial Number and the Model Number are on the bottom of the HomePod

APPLE HOMEPOD ­ IDENTIFICATION (IPHONE)
https://support.apple.com/en-us/HT208347
Serial number, Model Number, Wi-Fi Address and iOS/tvOS version are available in the Home app

APPLE HOMEKIT / HOMEPOD ACQUISITION
· HomePod  Direct connection (?)  HomePod Sysdiagnose · Synced iPhone(s)/iPad(s)

APPLE HOMEPOD ­ THE HIDDEN 14-PIN PORT
https://www.macrumors.com/2018/02/12/homepod-teardown-ifixit/
"[...] iFixit found a hidden 14-pin connector that they speculate is probably used to test or program HomePods on pogo pins during assembly [...]. Given the port sits below a layer of strong adhesive, it's unclear if it will be used for any other purpose, such as diagnostic testing."
https://www.ifixit.com/Teardown/HomePod+Teardown/103133 https://en.wikipedia.org/wiki/Pogo_pin

APPLE HOMEPOD ­ THE HIDDEN 14-PIN PORT
https://mobile.twitter.com/_l1ngl1ng_/status/1207027058875875328

APPLE SYSDIAGNOSE
· Apple provides "A web-based tool that developers can use
to report issues with Apple software and services"
· To correctly use this tool it is mandatory to "collect and
attach any relevant logs" extracted from the device

APPLE SYSDIAGNOSE
Using Apple "Bug Reporting" for forensic purposes
· Mattia Epifani, Heather Mahalik and @cheeky4n6monkey wrote a
document describing their research about these logs
HTTPS://WWW.FOR585.COM/SYSDIAGNOSE
· We also developed scripts to parse some of the files available in a
sysdiagnose acquisition
HTTPS://GITHUB.COM/CHEEKY4N6MONKEY/IOS_SYSDIAGNOSE_FORENSIC_SCRIPTS

SYSDIAGNOSE ON HOMEPOD
https://download.developer.apple.com/iOS/iOS_Logs/HomePod_Logging_Instructions.pdf

SYSDIAGNOSE ON HOMEPOD
https://download.developer.apple.com/iOS/iOS_Logs/HomePod_Logging_Instructions.pdf

SYSDIAGNOSE ON HOMEPOD
https://download.developer.apple.com/iOS/iOS_Logs/HomePod_Logging_Instructions.pdf

SYNCED IPHONE
https://github.com/RealityNet/ios_triage
 Full file system acquisition using checkra1n jailbreak
 Community project based on the `checkm8' bootrom exploit
 iPhone 5s ­ iPhone X, iOS 12.3 and up  Open source script `ios_triage' developed "to
extract data from a "chekcra1ned" iOS device"

HOMEKIT/HOMEPOD MAIN FOLDER
/private/var/mobile/Library/homed/

DATASTORE.SQLITE

DATASTORE.SQLITE
HMDHomeManagerModel / HMDHomeModel

HOME NAME, HOME GEOLOCATION AND USER ID
HMDHomeModel

DATASTORE.SQLITE
HMDRoomModel / HMDAppleMediaAccessoryModel

HOMEPOD INFORMATION
HMDAppleMediaAccessoryModel

HOMEPOD INFORMATION
HMDAppleMediaAccessoryModel

HOMEPOD ROOM INFORMATION
HMDAppleMediaAccessoryModel / HMDRoomModel

DATASTORE.SQLITE
HMDAccessorySettingGroupModel

HOMEPOD MUSIC SETTINGS

HOMEPOD MUSIC SETTINGS

HOMEPOD SIRI SETTINGS

HOMEPOD SIRI SETTINGS

HOMEPOD SIRI SETTINGS

HOMEPOD SIRI SETTINGS

HOMEPOD INFORMATION
/private/var/mobile/Library/Caches/com.Apple.Homekit.Configurations/homeData.*.Config

HOMEPOD MUSIC PLAYBACK
/private/var/mobile/Library/com.apple.siri.inference/srdb.db

HOMEPOD MUSIC PLAYBACK
/private/var/mobile/CoreDuet/Knowledge/knowledgeC.db
SELECT DATETIME(ZOBJECT.ZSTARTDATE+978307200,'UNIXEPOCH') AS "START", DATETIME(ZOBJECT.ZENDDATE+978307200,'UNIXEPOCH') AS "END", ZSTREAMNAME AS "STREAM NAME", ZVALUESTRING AS "VALUE STRING", Z_DKNOWPLAYINGMETADATAKEY__TITLE AS "TITLE", Z_DKNOWPLAYINGMETADATAKEY__ARTIST AS "ARTIST", Z_DKNOWPLAYINGMETADATAKEY__ALBUM AS "ALBUM", Z_DKNOWPLAYINGMETADATAKEY__DURATION AS "DURATION", Z_DKNOWPLAYINGMETADATAKEY__GENRE AS "GENRE", Z_DKNOWPLAYINGMETADATAKEY__MEDIATYPE AS "MEDIA TYPE", Z_DKNOWPLAYINGMETADATAKEY__OUTPUTDEVICEIDS AS "OUTPUT DEVICE ID"
FROM ZSTRUCTUREDMETADATA JOIN ZOBJECT ON ZOBJECT.ZSTRUCTUREDMETADATA = ZSTRUCTUREDMETADATA.Z_PK ORDER BY ZOBJECT.ZSTARTDATE

HOMEPOD MUSIC PLAYBACK
/private/var/mobile/CoreDuet/Knowledge/knowledgeC.db

HOMEPOD MUSIC PLAYBACK
/private/var/mobile/CoreDuet/Knowledge/knowledgeC.db

HOMEPOD SYSDIAGNOSE

HOMEPOD INFORMATION
/logs/Networking/preferences.plist

HOMEPOD BLUETOOTH ADDRESS
/WiFi/bluetooth_status.txt

HOMEPOD WI-FI ADDRESS
/WiFi/wifi_status.txt

HOMEPOD WI-FI ADDRESS
/WiFi/com.apple.wifi.plist

HOMEPOD WI-FI ADDRESS
/WiFi/com.apple.wifi.plist
https://github.com/cheeky4n6monkey/iOS_sysdiagnose_forensic_scripts/sysdiagnose-wifi-plist.py

HOMEPOD MOBILE ACTIVATION LOGS
/logs/MobileActivation/mobileactivationd.log.*
https://github.com/cheeky4n6monkey/iOS_sysdiagnose_forensic_scripts/sysdiagnose-mobileactivation.py

HOMEPOD POWERLOGS
/logs/PowerLogs
https://github.com/mac4n6/APOLLO

HOMEPOD POWERLOGS
/logs/PowerLogs
https://github.com/mac4n6/APOLLO

HOMEPOD POWERLOGS
/logs/PowerLogs
https://github.com/mac4n6/APOLLO

HOMEPOD SYSLOG ARCHIVE ­ BEATS 1 RADIO
/system_logs.logarchive/

HOMEPOD SYSLOG ARCHIVE ­ BEATS 1 RADIO
/system_logs.logarchive/

HOMEPOD SYSLOG ARCHIVE ­ MUSIC PLAYBACK
/system_logs.logarchive/

HOMEPOD SYSLOG ARCHIVE ­ MUSIC PLAYBACK
/system_logs.logarchive/

DATASTORE.SQLITE
HMDAccessoryTransaction

EVE DOOR SENSOR INFORMATION
HMDAccessoryTransaction

EVE DOOR SENSOR NAME
HMDServiceTransaction

EVE DOOR SENSOR ROOM
HMDAccessoryTransaction / HMDRoom

EVE DOOR SENSOR INFORMATION
/private/var/mobile/Library/Caches/com.apple.HomeKit.configurations/homeData.*.config

EVE DOOR SENSOR INFORMATION ­ EVE APP
com.elgato.plist

EVE DOOR SENSOR INFORMATION ­ EVE APP
Elgato##Eve Door 20EAL9901##DV51I1A03588.sql

UTC

GMT+1

FINDINGS
· Apple HomeKit is an unexplored field in IoT/Mobile Forensics · The analysis of an iPhone connected to an Apple Home can reveal
· Home location · Home organization (rooms) · Installed HomeKit devices · Interactions (Music, Sensors)
· The analysis of an HomePod connected to an Apple Home can reveal
· HomePod Settings · HomePod network connections · HomePod usage (Powelogs, Syslog)

VALIDATION
· We tested our findings on the Joshua
Hickman iOS 13.4.1 image
· https://digitalcorpora.org/archives/1496

DATASTORE.SQLITE
HMDHomeManagerModel / HMDHomeModel

HOME NAME, HOME GEOLOCATION AND USER ID
HMDHomeModel

DATASTORE.SQLITE
HMDRoomModel / HMDAppleMediaAccessoryModel

HOMEPOD INFORMATION
HMDAppleMediaAccessoryModel HMDRoomModel

DATASTORE.SQLITE
HMDAccessorySettingGroupModel

HOMEPOD SIRI SETTINGS

HOMEPOD SIRI LANGUAGE SETTINGS

HOMEPOD INFORMATION
/private/var/mobile/Library/Caches/com.Apple.Homekit.Configurations/homeData.*.Config

HOMEPOD MUSIC PLAYBACK
/private/var/mobile/CoreDuet/Knowledge/knowledgeC.db
SELECT DATETIME(ZOBJECT.ZSTARTDATE+978307200,'UNIXEPOCH') AS "START", DATETIME(ZOBJECT.ZENDDATE+978307200,'UNIXEPOCH') AS "END", ZSTREAMNAME AS "STREAM NAME", ZVALUESTRING AS "VALUE STRING", Z_DKNOWPLAYINGMETADATAKEY__TITLE AS "TITLE", Z_DKNOWPLAYINGMETADATAKEY__ARTIST AS "ARTIST", Z_DKNOWPLAYINGMETADATAKEY__ALBUM AS "ALBUM", Z_DKNOWPLAYINGMETADATAKEY__DURATION AS "DURATION", Z_DKNOWPLAYINGMETADATAKEY__GENRE AS "GENRE", Z_DKNOWPLAYINGMETADATAKEY__MEDIATYPE AS "MEDIA TYPE", Z_DKNOWPLAYINGMETADATAKEY__OUTPUTDEVICEIDS AS "OUTPUT DEVICE ID"
FROM ZSTRUCTUREDMETADATA JOIN ZOBJECT ON ZOBJECT.ZSTRUCTUREDMETADATA = ZSTRUCTUREDMETADATA.Z_PK ORDER BY ZOBJECT.ZSTARTDATE

REFERENCES
· HomePod Teardown Reveals Hidden 14-Pin Connector, 16GB Storage, and Very Low Repairability
https://www.macrumors.com/2018/02/12/homepod-teardown-ifixit/, ultima visita: marzo 2020.
· HomePod - iFixit
https://it.ifixit.com/Guida/Smontaggio+HomePod/103133
· Pogo pin ­ Wikipedia
https://en.wikipedia.org/wiki/Pogo_pin
· Profiles and Logs - Bug Reporting - Apple Developer
https://developer.apple.com/bug-reporting/profiles-and-logs/
· HomePod Logging Instructions - Apple Developer
https://developer.apple.com/services-account/download?path=/iOS/iOS_Logs/HomePod_Logging_Instructions.pdf
· Epifani Mattia, Leong Adrian and Mahalik Heather. Using Apple "Bug Reporting" for forensic purposes. OSDFCON, 2019. · GitHub - RealityNet/ios_bfu_triage
https://github.com/RealityNet/ios_bfu_triage
· GitHub - cheeky4n6monkey/iOS_sysdiagnose_forensic_scripts
https://github.com/cheeky4n6monkey/iOS_sysdiagnose_forensic_scripts
· GitHub - mac4n6/APOLLO: Apple Pattern Of Lazy Output'er
https://github.com/mac4n6/APOLLO

PUBLIC DATASET DFRWS 2020 EU RODEO ­ DATASET AND QUESTIONS
http://bit.do/dfrws_rodeo_2020

ACKNOWLEDGEMENTS
· Francesca Maestri · Silvia Spallarossa · Claudia Meda

Q&A

MATTIA EPIFANI
· DIGITAL FORENSICS ANALYST · CEO @ REALITY NET ­ SYSTEM SOLUTIONS · GCFA, GCFE, GASF, GMOB, GNFA, GREM, GCWN · SANS INSTRUCTOR, FOR585 / FOR500

mattia.epifani@realitynet.it @mattiaep http://www.linkedin.com/in/mattiaepifani http://www.realitynet.it http://blog.digital-forensics.it

