Healthy Android Examinations:
Timelining Digital Wellbeing Data
Alexis Brignoni &
Joshua Hickman

About Us

Alexis Brignoni
Federal Law Enforcement Twitter: @AlexisBrignoni

Joshua Hickman
Kroll Twitter: @josh_hickman1

Digital Wellbeing ­ What Is It?
· Introduced at Google I/O 2018 · First seen in Android Oreo (9) · Initially limited to a specific subset of
phones · 2019 rollout · Now required on all new devices

What the User Sees

/data/data/com.google.android.apps.wellbeing

events

packages

app_usage

A SQL query will pull the tables together

SELECT events._id, datetime(events.timeStamp/1000, "UNIXEPOCH") as timestamps, Packages.package_name, events.type, CASE when events.type=1 THEN 'ACTIVITY_RESUMED' when events.type=2 THEN 'ACTIVITY_PAUSED' when events.type=12 THEN 'NOTIFICATION' when events.type=18 THEN 'KEYGUARD_HIDDEN || DEVICE UNLOCK' when events.type=19 THEN 'FOREGROUND_SERVICE START' when events.type=20 THEN 'FOREGROUND_SERVICE_STOP' when events.type=23 THEN 'ACTIVITY_STOPPED' when events.type=26 THEN 'DEVICE_SHUTDOWN' when events.type=27 THEN 'DEVICE_STARTUP' else events.type END as eventType FROM events INNER JOIN packages ON events.package_id=packages._id ORDER BY timestamps

app_usage

A SQL query will pull the tables together

SELECT events._id, datetime(events.timeStamp/1000, "UNIXEPOCH") as timestamps, Packages.package_name, events.type, CASE when events.type=1 THEN 'ACTIVITY_RESUMED' when events.type=2 THEN 'ACTIVITY_PAUSED' when events.type=12 THEN 'NOTIFICATION' when events.type=18 THEN 'KEYGUARD_HIDDEN || DEVICE UNLOCK' when events.type=19 THEN 'FOREGROUND_SERVICE START' when events.type=20 THEN 'FOREGROUND_SERVICE_STOP' when events.type=23 THEN 'ACTIVITY_STOPPED' when events.type=26 THEN 'DEVICE_SHUTDOWN' when events.type=27 THEN 'DEVICE_STARTUP' else events.type END as eventType FROM events INNER JOIN packages ON events.package_id=packages._id ORDER BY timestamps

Query Output - Pixel

Query Output ­ OnePlus 7T

Web History...?

Web History...?

A SQL query will pull the tables together

SELECT component_events._id,components.package_id, packages.package_name, components.component_name as website, datetime(component_events.timestamp/1000, "UNIXEPOCH") as timestamp, CASE when component_events.type=1 THEN 'ACTIVITY_RESUMED' when component_events.type=2 THEN 'ACTIVITY_PAUSED' else component_events.type END as eventType FROM component_events INNER JOIN components ON component_events.component_id=components._id INNER JOIN packages ON components.package_id=packages._id ORDER BY timestamp

Yes, Web History

Yes, Web History...maybe?
· Web history is not captured by default
· User must opt-in · Can import past history

Samsungs Gonna Samsung
· Because, Samsung · In-house solution · Aesthetically different · Different names

Samsungs Gonna Samsung
· Different APK name · Different database name · More Usage Stats codes than Google · Less data is kept* · No web history

/data/data/com.samsung.android.forest

usageEvents

foundPackages

dwbCommon.db

Another SQL query

SELECT usageEvents.eventId, datetime(usageEvents.timeStamp/1000, "UNIXEPOCH") as timestamp, foundPackages.name, usageEvents.eventType, CASE when usageEvents.eventType=1 THEN 'ACTIVITY_RESUMED' when usageEvents.eventType=2 THEN 'ACTIVITY_PAUSED' when usageEvents.eventType=5 THEN 'CONFIGURATION_CHANGE' when usageEvents.eventType=7 THEN 'USER_INTERACTION' when usageEvents.eventType=10 THEN 'NOTIFICATION PANEL' when usageEvents.eventType=11 THEN 'STANDBY_BUCKET_CHANGED' when usageEvents.eventType=12 THEN 'NOTIFICATION' when usageEvents.eventType=15 THEN 'SCREEN_INTERACTIVE (Screen on for full user interaction)' when usageEvents.eventType=16 THEN 'SCREEN_NON_INTERACTIVE (Screen on in Non-interactive state or completely turned off)' when usageEvents.eventType=17 THEN 'KEYGUARD_SHOWN || POSSIBLE DEVICE LOCK' when usageEvents.eventType=18 THEN 'KEYGUARD_HIDDEN || DEVICE UNLOCK' when usageEvents.eventType=19 THEN 'FOREGROUND_SERVICE START' when usageEvents.eventType=20 THEN 'FOREGROUND_SERVICE_STOP' when usageEvents.eventType=23 THEN 'ACTIVITY_STOPPED' when usageEvents.eventType=26 THEN 'DEVICE_SHUTDOWN' when usageEvents.eventType=27 THEN 'DEVICE_STARTUP' else usageEvents.eventType END as eventTypeDescription FROM usageEvents INNER JOIN foundPackages ON usageEvents.pkgId=foundPackages.pkgId ORDER BY timestamp

Query Output

Overall Limitations...
· Retention time · Users can turn Digital Wellbeing
off* · No data kept on deleted apps
*Settings > Apps & Notifications > Special App Access > Usage Access

Deleted Apps

/data/data/com.google.android.as

reflections_gel_events.db

Protobuf
· Data in the proto column is a replay of what is in the other columns
· Using protoc can decode the data

Protobuf
It retains data about activity in deleted apps

Deleted App Data

Deleted App Data

Decoded protobuf

Limitations
Users have options: · Delete the last hour of data · Delete the last 24 hours of data · Delete all data · Turn DPS off*
*Settings > Apps & Notifications > Special App Access > Usage Access

Implementation
ALEAPP (Android Logs Events And Protobuf Parser)

Implementation
ALEAPP (Android Logs Events And Protobuf Parser)
https://github.com/abrignoni/ALEAPP

ALEAPP Report

Report Categories

Wellbeing

Wellbeing

Wellbeing

Wellbeing

Implementation
ALEAPP (Android Logs Events And Protobuf Parser)
https://github.com/abrignoni/ALEAPP

Personalization Services

Personalization Services

Personalization Services

Personalization Services

Links
· Contributor list:
­ https://abrignoni.blogspot.com/2020/01/awesome-friends.html
· DFIR Resources for xLEAPP, Python, and DFIR:
­ https://abrignoni.blogspot.com/2020/07/dfir-resources.html

Thanks For Watching!
Alexis Brignoni @AlexisBrignoni https://abrignoni.blogspot.com
Joshua Hickman @josh_hickman1 https://thebinaryhick.blog

