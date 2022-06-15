#RSAC
SESSION ID: PDSC-W01
DLP: An Implementation Story
Micah K Brown
Greater Cincinnati ISSA @MicahKBrown

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented.
Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Agenda:
What is DLP DLP: The Cast DLP: Getting Started DLP: Architecture DLP: How to detect and bypass a DLP Solution DLP: Wrapping it up and Q&A
3

#RSAC
A DLP Story:
An Introduction

#RSAC
What is Data Loss Prevention (DLP)?
DLP is NOT . . . a 'monolithic' stack of technology by one single vendor DLP is NOT . . . designed to stop a sufficiently advanced advisory [internal | external] by itself DLP is NOT . . . 'Digital Rights Management' DLP is NOT . . . 'User Behavioral Analytics' DLP is NOT . . . a 'Silver Bullet'
DLP IS becoming a 'feature' in many different tools DLP IS designed to help establish proper data ownership / stewardship DLP IS more aligned with Business Risk Management than IT Security DLP IS a collection of tools that allows the business to define policies on how data is Stored, or Processed, the environment
5

#RSAC
What is DLP?
Process

Store

Transmit

The State of Data in our Environment
DLP is made up of many different tools that work together. Each tool will inspect / interact with data in at least one or more of these states of data.
6

#RSAC
A DLP Story:
The Cast

#RSAC
The Cast:

DLP Client ­ Software on the client system / server that S P T monitors the actions of the user.

DLP Network ­ A machine that inspects network traffic for potentially sensitive data as it traverses the network. Best T to place at `choke zones' such as internet egress or sensitive network.

DLP Repository Scanner ­ A machine that scans data

S

repositories (shares, SharePoint sites, databases, and

more) for potentially sensitive information.

S Store

P Process T Transmit

8

#RSAC
The Cast:

DLP Email ­ A machine that partners with your email S T system to scan outgoing and / or incoming email for
sensitive information.

DLP Web ­ A machine that partners with your internet T proxy to scan outgoing and / or incoming web requests for
sensitive information.

DLP Management console ­ A machine that manages all of

S

the other DLP components. This also includes reporting,

incident management, and evidence management.

S Store

P Process T Transmit

9

#RSAC
DLP Concerns: 1 of 2
DLP Client can overlap functionality with other DLP Components
­ DLP client can have high performance hit (CPU / Memory / Disk I/O). ­ You can run into incompatibles that cause other software not to work. ­ Incompatibilities with other applications can spike CPU / Memory/ Disk
I/O. ­ Distribution of Client and Policy.
Guiding Principal:
­ Keep the DLP Client Policy as simple and lightweight as possible. ­ Lift as much functionality to other DLP components.
10

#RSAC
DLP Concerns: 2 of 2
DLP Management console `evidence' of violations of policy which could contain data governed by rules / laws / regulations / contractual agreements. Many different products are adding on "DLP" functionality. Interoperability might become a challenge between diverse systems. DLP Network can overlap with DLP Email and DLP Web.
­ Prefer to use the `best fit' DLP Tool for use case.
11

#RSAC
A DLP Story:
Getting Started

#RSAC
DLP: Setting Scope
DLP has become a very popular concept at the Executive Level to protect data and prevent breaches.
­ Clearly define what DLP is, what it can do, and what it can not do. ­ Clearly define what features / tools to turn on and what they do. ­ Is DLP part of the organization's "active defense toolset" or historical system of
record? ­ Bring in Legal, HR, Compliance, and other appropriate business groups to
understand any implications. ­ Define who responds to DLP incidents. ­ Define how DLP Incidents are handled.
13

#RSAC
DLP: The High Cost of fractured Policies
We implemented a three policy environment Test, Pilot, Production. This lead to some complications and lessons.
­ We adopted the this architecture after a single REG-EX logic error was introduced into the client config that turned all the test systems into literal potatoes.
­ Each time you fragment your policy, it has HUGE implications for support, maintenance, testing, documentation.
­ You need to find an appropriate balance between a monolithic policy and micro fragmentation of your DLP policy. (This is challenging!)
14

#RSAC
DLP: Tuning

Tuning is one of the hardest parts of a DLP Project
­ Tuning involves both Functionality and Data Classification
If a Function adds more work that value, consider turning it off.
When tuning Data Classifications, ask how could this change be abused or if it introduces a chance for a FALSE NEGITIVE
­ The firs 80% of tuning is relatively easy and low risk.
­ We will discuss the challenges I had with US Driver License shortly.

This Photo by Unknown Author is licensed under CC BY-NC-ND

15

#RSAC
There are no FALSE POSITIVES, Only poorly written rules*
16

On Tuning

Traditional

Micah's Preferred Approach

True Detection (Y) Validity (Y)
Did we get the desired result?

Desired Detection (X)

Accuracy (X) Is the detection mathematically true

Measuring data is not an exact science

Traditional ([True | False], [Positive | Negative]) vs ( Validity, Accuracy)

Qualitative vs Quantitative

@InfoSecBenjaminDisraeli: "lies, damned lies, and spreadsheets"

#RSAC
17

#RSAC
A DLP Story:
DLP Architecture

#RSAC
DLP: Traditional DPL Policies
Traditional DLP is built upon REG-EX and word dictionaries. This can be problematic:
­ 50 US states each have multiple definitions of driver's license. ­ Many websites use 15/16 digit numeric codes to reference content. This
overlaps with traditional credit card definitions. ­ REG-EX and word dictionaries are not sufficient optimal.
When possible follow the main rule of improve "YES AND" in building traditional classification. "Proximity" rules are your friend!
19

#RSAC
DLP: Object Orientated Rules
Use standardized naming conventions to flag the type of each "building block" and what policy each "building block" belongs to. We did this by using a "short code" at the start of custom dictionaries, and a dictionary "type flag".
20

#RSAC
DLP: Tyranny of the Drivers License 1:3
21

#RSAC
DLP: Tyranny of the Drivers License 2:3

Our old strategy had two classifications around Driver's License
­ Text dictionary: tele, mobile, meeting code
­ Under this config, every piece of data that matched NOTDriverLicense also matched the DriverLicense.
We had introduced a FALSE NEGATIVE where the existence of just one word from the text dictionary.

DriverLicense

DL
RegEx Dictionary

NOTDriverLicense

DL
RegEx Dictionary

Text Dictionary

Alerts were configured to ignore NOT Drivers License!

22

DLP: Tyranny of the Drivers License 3:3

New Driver's License strategy
Positive match dictionary sample: driver, license, vehicle, lic#, lic:, vin#, vin:, dl#, dl:
Text dictionary match needs to be within 100 char of the RegEx match. (reduces errors)
Significantly increased positive matches

DriverLicense

DL
RegEx Dictionary

#RSAC
Text Dictionary within 100 char

23

#RSAC
DLP: Weaponize your users with Data classification
Empower your users to tag your data with your organization's data classifications! This data is saved in the document meta-tag and is viewable by anyone or software that can look at the document or the document properties. This data tag is vendor agnostic. Very powerful when combined with traditional classification. Engender proper Data Stewardship in your company. Can create a custom data classification for a honey pot files.
24

#RSAC
A DLP Story:
Setting DLP Expectations

#RSAC
DLP: Setting DLP Expectations
DLP is a great tool but we can not set the expectations that a DLP Program will stop all data leaks.
­ DLP helps the business take a policy driven approach to how they store / process / transmit data on a proactive level.
­ DLP can help build a culture of better Data Stewardship and help prevent accidental data leaks.
­ DLP can be used to meet certain GRC use cases. ­ DLP is not perfect and requires appropriate support.
26

DLP Detection and Bypass
Once an attacker establishes a foothold on a client system, they can dump a list of processes to see if the system has a DLP Client.
Almost all traditional DLP Solutions are overcome by simple data obfuscation or data encryption.
Take away: Communicate these points to management.

#RSAC

To: BetterBuy From: MicahKBrown
CC: 1234567890098765 Expiration: 0525 SecureCode: 123

ALERT

To: BetterBuy From: MicahKBrown

CC: 1.2.3.4.5.6.7.8.9.0.0.9.8.7.6.5.

Expiration: 0.5.2.5

SecureCode: 1.2.3

Allow

To: BetterBuy From: MicahKBrown

CC: MTIzNDU2Nzg5MDA5ODc2NQ==

Expiration: MDUyNQ== SecureCode: MTIz

Allow

27

#RSAC
A DLP Story:
Wrapping it up

#RSAC
"Apply" Slide
In the next week :
­ Review / define the sensitive data in your environment and the implications if lost.
In the next month:
­ Review / define your Data Classification Policy. ­ Update / define what data is stored / processed / transmitted in your applications. ­ Identify any applicable rules / laws / regulations / contractual agreements for each
system.
In the next quarter:
­ Either
Audit existing DLP systems to ensure meet your requirements. Build business justification for a DLP implementation with solid and measurable use-cases.
29

