SESSION ID: TECH-W04
Applying Top Secret and Military Network Grade Security in the Real World

Dan Amiga
CTO & Co-Founder Fireglass @DanAmiga
Dor Knafo
Security Research Team Leader Fireglass @DorKnfao

#RSAC

#RSAC
Agenda
The fundamental gap
Military vs Private Sector
Challenges & Solutions
Networking Internet Connectivity Web Applications File Content
Summary
2

#RSAC
Reality Check Matrix

Adversaries Operating Mode
Solutions

Private Sector Crime, Activists
Competitors Foreign Governments
Productivity First Limited Budget
Commercial Mostly

Military
Foreign Governments
Security First Zero Tolerance
Commercial & Custom

3

Decision vs Action
Categorization/Risk YABA
Signatures Algorithms Heuristics
4

#RSAC
Military Grade Network Acts on Content

#RSAC
Networking Data Transmission

#RSAC
The Data Transmission Challenge
Problem definition
How to transmit data from A to B? Connectivity implies attack surface all the way from packet manipulation, malicious response data or protocol vulnerabilities

Network A

TCP/IP Ethernet Any form of two way communication
7

Network B

#RSAC
Physical Solution
Implement a hardware based one way link
Modified Ethernet Cable or Fiber Optics
Significantly reduces attack surface Not always feasible and productive

Network A

UDP Fiber optics / Twisted Pair Cat5
8

Network B

#RSAC
Software Based One Way Link

Leverage IPS - response size set to zero and allow only ACKs

Network A

IPS OWL Configuration
(Over TCP)
ACK only

Network B

9

TAP Mode

Leverage promiscuous mode

Network A

TCP/IP

TAP mode
Transparently sniff packets to destination N and send them to Network B

10

#RSAC
Network N No man's
land
Network B

#RSAC
Enforcement by Reconstruction

Protocols can be Big & Complex or Proprietary - Hard to analyze. Move from open systems to a closed well defined system Move from inspection to reconstruction (e.g. HTTP, RDP)

Network A

Full RDP

Reconstruct Intermediate
Explicit / Implicit Shadow

13

RDP Subset

Network B

#RSAC
Internet Connectivity Challenges & Solutions

#RSAC
Internet Access Challenge
Browsing in the #1 productivity tool Cannot rely on the (fairly good) browser security model
E.g. Chrome sandboxing model

Exploits
Malicious Toolbars

Phishing Data Theft

Fraud
Spearing Emails

Files Plugins 15

Data Theft
Legacy

Water holing

Malvertising

Certificates

OWASP

#RSAC
Browsers & HTTP....

Browser
IFRAMES
WebSockets
Plugins (Flash/Java/Silverlight)
SRC 3rd party

HTML5, JavaScript, Cookies Media, Images, RTMP video Cross domain 3rd party content
Flash, Java, WebSockets
AJAX / Embedded IFRAME HTML & JavaScript Executables, Office documents, unknown files

Target website Media Server
CDN Third Party Ads Network File Server

16

Remote Isolation

Browser

Incoming Visual Feed
Remote Isolated Browser
Outgoing User Gestures

18

#RSAC
Target website Media Server
CDN Third Party Ads Network File Server

#RSAC
Remote Isolation Technical

Without

HTML BODY
CANVAS With
19

#RSAC
Web Application Isolation

Users
Incoming Visual Feed
Outgoing User
Gestures

OWASP 10 Eliminate site traversal No man in the browser Eliminate zero day exploits
No learning curve

Network Remote Isolation

Application

HTTPS

21

#RSAC
Files... Challenges and Solutions

#RSAC
The Files Challenge :-)
Executables
Remote Isolation (temporary VDI) Sandboxing
Content (Office)
Remote Viewing Reconstruction & Sanitization
23

Reconstruction & Sanitization

Multiple Converters
Sanitization, SDK based, combined with OWL.

DOCX
Macros Code Executables Malicious Content Layout+Text

HTML Layout+Text

ODT Layout+Text

24

#RSAC
DOCX Layout+Text

Summary - Architecture

Network A
Client
Application Transport Network Data Link Physical

Scrubbing & Hardening Network Isolation Protocol Reconstruction One Way Link
25

#RSAC
Network B
Server Application Transport
Network Data Link Physical

#RSAC
Summary ­ Commercial Applicability
New approach discussed ­ Zero Tolerance Touched both network and application level scenarios Call for action
Identify critical intersection points, actors and systems Understand vendor & solution pros and cons Search for new alternatives from emerging providers Look for the security & productivity sweet spot
26

SESSION ID: TECH-W04
Applying Top Secret and Military Network Grade Security in the Real World

Dan Amiga
CTO & Co-Founder Fireglass @DanAmiga
Dor Knafo
Security Research Team Leader Fireglass @DorKnfao

#RSAC

