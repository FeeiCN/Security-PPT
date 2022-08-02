SESSION ID: MBS-R02

How to Analyze an Android Bot
#RSAC

Kevin McNamee
Nokia Threat Intelligence Lab @KevMcNamee

#RSAC
Agenda
Introduction Tools The Lab Demo Q&A
2

#RSAC
Why Analyze Android Malware

We monitor mobile traffic for malware infections
Malware C&C Exploits DDOS Hacking

Need accurate detection

rules

NodeB

RNC

RAN

eNodeB
3

MOBILE NETWORK SECURITY ANALYTICS

Alert Aggregation & Analysis

Forensic Analysis
Malware Detection Sensor

SGSN SGW

GGSN/PGW

Internet

#RSAC
Developing Malware Detection Rules

MALWARE SAMPLES
VIRUS VAULT · 120K+ ANALYZED
PER DAY · 30M+ Active samples

SANDBOX

MALWARE TRAFFIC LIBRARY

DEPLOYMENT-SPECIFIC RULE SETS

RULES DEVELOPMENT

RULES LIBRARY

TRAFFIC POLICY
ZERO DAY BEHAVIORAL RULES

RULES REPOSITORY

RULE ACTIVATION

QUALITY TESTING

FIELD TESTING IN LIVE NETWORKS

FEEDBACK FROM FIELD
TESTS

4

#RSAC
Android Malware Analysis
So, we built our own Android malware analysis lab You will learn
What tools are required How to set up the network environment How they are used
Analysis allows you to:
Know what the malware does Understand its threat level Detect and remediate the infection
5

#RSAC
Android App
Contained in APK file (zip format) Main components include:
Manifest Dalvik byte code (classes.dex file) Resources Assets Libraries
6

#RSAC
Basic Analysis Process
Explore what's in APK file Decompile DEX and review source Run app on phone or AVD & capture network activity
7

#RSAC
Tools ­ Android Studio
If you are going to analyze apps you have to know a bit about how they are made... Also provides many of the tools needed for analysis...
ADB (debugging) AVD (simulated phones)
8

#RSAC
Tools ­ Apktool
Tool for reverse engineering Android packages (apk files) Extract components
Manifest, Resources, Libraries, Assets, Byte-code (Smali)
Can edit and modify components Rebuild modified app
9

#RSAC
Tools ­ ADB
Android Debug Bridge Comes with Android Studio Provides:
Shell access Access to file system Scripted remote control Application Install/Uninstall
10

#RSAC
Tools ­ dex2jar
Converts Dalvik byte code to Java byte code First step in de-compiling an Android app.
11

#RSAC
Tools ­ Java Decompiler
Converts Java byte code to source code. Doesn't always work  Options include:
JD-GUI Luyten (Procyon)
12

#RSAC
Tools ­ WireShark
Capture and network traffic Analyze network traffic Help develop detection rules
13

The Lab
Control Server ADB/USB

#RSAC

Malware
wifi
Packet Capture
14

Internet

15

16

17

#RSAC
Using a Real Mobile Network
Some malware may only function on a real mobile network You can build your own mobile network.

GPRS

ETH

ETH

BTS
Linux OpenBSC OsmoSGSN OpenGGSN

18

Internet

#RSAC
Automation
We have automated the analysis process using:
Web based user interface Real phones and AVDs Malware database APKtool/Dex2Jar/GD-GUI ADB scripting Monkey Script WireShark Interface to Virus Total
19

Provides a name
20

Information from Manifest
21

Run Sample in AVD
22

Analyze Network Traffic
23

#RSAC
Manual Demo ­ NotCompatible Proxy Bot

Disassemble APK
25

Directory structure created by apktool
26

Disassembled Dex in Smali format

Permissions

View Manifest
27

Intents

Unzip APK file Convert to JAR
28

View the Java source Config file is encrypted
using AES
29

C&C Decoder
30

IayfIntoyduocrauSetcnmhabdaenbuoapeiAlnklliott'PmctoouKooklosidkcildaneaeitg.fnJiteahbdveea
C&C Decoder
31

C&C packet capture Ping/Pong
Proxy Request Data
32

#RSAC
NotCompatible - Overview
Web Proxy Bot ported from Windows to Android environment.
Allows remote miscreants to anonymously browse the web through the victim's phone.
Consumes lots of bandwidth, for example 165MB in two hours over 300K TCP sessions

#RSAC
NotCompatible ­ Infection
Phishing spam is used to lure the victim to an infected web site. Web site tells you the browser is "not compatible" and provides an update. The user downloads and installs update.apk Malware has no icon or user interface. It is automatically started on BOOT. You can get rid of the infection by uninstalling the application.

#RSAC
NotCompatible ­ Operation
Opens an encrypted configuration file containing the address and port number of the server.
The bot connects to the server via TCP.
Sophisticated command and control protocol is then used to multiplex Web proxy services over that connection.
This provides an anonymous web browsing services to clients.

#RSAC
NotCompatible ­ Command & Control

Simple command/response packet format contains both commands and data.

Packet format:

Channel number can multiplex many connection at once.

The ping and pong are used as a

Commands:

heartbeat when there is no proxy work

to be done.

Once a proxy request is issued the "raw data" commands are used to transfer the data in either direction.

NotCompatible ­ Uses & Impact
Uses
Anonymous Web Browsing Service Providing Access to Restricted Foreign Content Ad-Click Fraud Web Site Optimization Fraud APT Probing and Exfiltration
Impact
One user from Finland, roaming in the US, used over 165MBytes in less than two hours of airtime. In the lab it averages 100MBytes per hour. Causes huge data bills Caused the battery to run down quickly Who knows what sites your phone in visiting!!!

#RSAC

#RSAC
Summary
Android malware analysis enables you to:
Know what the malware does Understand the threat level Detect and remediate the infection
You should now know:
What tools are required How to set up the network environment How to use the tools
38

#RSAC
Questions?
Email: kevin.mcnamee@nokia.com Twitter: @KevMcNamee
39

