SESSION ID: MBS-R03
ShadowOS: Modifying the Android OS for Mobile Application Testing

Ray Kelly
Research and Innovation HP Fortify On Demand @vbisbest

#RSAC

#RSAC
About Me
 Ray Kelly
 Innovation and Research, HP Fortify on Demand  SPI guy, lead developer of WebInspect  FoD Mobile pen test team  Twitter: @vbisbest
2

#RSAC
Agenda
 Why is mobile testing important  Challenges of mobile testing  Example mobile vulnerabilities  How do we make this easier, ShadowOS  The Android build process  Identify key Android source code files for modification  Demonstrate a custom Android OS with intercepting code
3

#RSAC
MITF?
4

#RSAC
Why is Mobile Testing Important
 Mobile development is the hottest type of development right now. New surface area equals dangerous surface area
 If anyone's going to put features over security to get the product out the door, it's likely to be a mobile team
 Many enterprise mobile developers haven't had the security training that other types of developers have had ­ Anyone can make apps, its easy!
 Many assume that because mobile back ends aren't visited directly they are more secure (obscurity assumption)
5

Challenges of Mobile

#RSAC

Testing

6

Full Mobile App Coverage

Client

Network

#RSAC
Server

· Credentials in memory · Credentials on file system · Data stored on file system · Poor cert management

· Clear text credentials · Clear text data · Backdoor data · Data leakage

· Injection flaws · Authentication · Session management · Access control · Logic flaws

7

#RSAC
Server
 Mobile API's are vulnerable to most of the same vulnerabilities as standard websites e.g. SQL Injection, XSS, path traversal etc.
 Testing JSON/XML based API's should be tested with valid structures as well as invalid structures.
 Difficult to test when app is using SSL and pinning certificates.
8

#RSAC
Server
 Backend API allowed WebDAV
9

#RSAC
Network
 Privacy/data leakage, clear text data  3rd party data leakage  Need to MITM, same challenges as server side  Difficult to test when app is using SSL and certificate pinning
10

#RSAC
Network
 Transmission of private information  Used SSL but did not pin certificate
11

#RSAC
Client
 The big unknown especially without source code. Even with source code its not always easy (what is sensitive input?)
 What is being written to the file system?
 Credentials  Private information  Sensitive photos outside of sandbox
 SQL Lite
 Application storage  iOS WebKit cache (includes query string)
12

#RSAC
Client
 Promiscuous client-side storage
 Storage of credentials in plist files, SQLite databases  Failure to use Key Chain to store credentials  Storage of sensitive application data on file system  Apps storing their images in the public folder rather than in their
sandbox  Applications logging to the system log, but sending sensitive app data
along with it (e.g. logcat output)
13

#RSAC
Photo Storage
14

#RSAC
Logging
 Using Logcat
15

#RSAC
Security Through Obscurity?
16

How Do We Make This

Easier, ShadowOS

#RSAC

17

There Must Be A Better Way

#RSAC

 There must be a better way to test mobile apps  Needs to get around certificate pinning  Watch files being created or modified real time  Watch SQL queries being executed real time  Android is open source, so how about we get inside the OS

#RSAC

Android OS
19

Source: Wikipedia

WebKit SQLite

Android OS
20

#RSAC
HTTPClient File Access
Source: Wikipedia

#RSAC
Android Build Process
21

#RSAC
The Host And Environment
 Ubuntu 12.04 64bit  Sounds crazy, but follow the instructions!  http://source.android.com/source/downloading.html
22

#RSAC
Hidden Targets
 Run "lunch sdk-eng" to select the sdk target and images  Don't bother with the lunch menu
23

#RSAC
Successful Build
 Success!
24

#RSAC
Modifications
25

#RSAC
Helper Class
 Common class for logging and monitoring
 Place class in java.io
26

#RSAC
HTTP/HTTPS
 There are a few places to capture HTTP traffic  Most apps utilize Java.Net and Apache.HTTP
27

#RSAC
File System
 Common read/write functions
 FileInputStream/FileOutputStream
28

#RSAC
SQLite
 One main class, SQLiteDatabase.java  Intercept Open, Insert and Update
29

#RSAC
Using Logcat
 adb.exe logcat -s "ShadowOS"
30

#RSAC
Remote Monitoring
 Using socket connection to specific port  Data formatted in XML  Host loopback (127.0.0.1) is 10.0.2.2
31

#RSAC
Demonstration

#RSAC
Apply What You Have Learned Today
 Download and try ShadowOS  Think of new ideas for areas of interception  Think of new visualization of captured data  Submit ideas to ShadowOS@hp.com
33

SESSION ID: MBS-R03
ShadowOS: Modifying the Android OS for Mobile Application Testing

Ray Kelly
Research and Innovation HP Fortify On Demand @vbisbest

#RSAC

