FASTCash and INJX_PURE
How Threat Actors Use Public Standards for Financial Fraud
Kevin Perlow BlackHat USA 2020

About Me
BlackHat USA 2020

FASTCash and INJX_Pure: How Threat Actors Use Public Standards for Financial Fraud | Kevin Perlow
Technical Threat Intelligence (TechINT) Previous Research
· SANS DFIR 2016: YARA and VirusTotal (w/ Allen Swackhamer)
· SANS DFIR 2017: Tracking Bitcoin Transactions · BH 2018: Mapping Decentralized Infrastructure I really like soft pretzels...
2

Background and Objectives
· Understanding financial standards ­ ISO 8583 and XFS · Examine how threat actors use these in their malware · Discuss the advantages and drawbacks threat actors experience

BlackHat USA 2020

3

Introduction to ISO 8583
· What is ISO 8583? · Critical for card transactions (e.g. ATMs, POS devices)

BlackHat USA 2020

4

Example ISO 8583 Message

020042000400000000021612345678901234560609173030011456789ABC1000123456 7890123456789012345678901234567890123456789012345678901234567890123456 78901234567890123456789

Source: https://www.chileoffshore.com/en/interesting-articles/115-about-iso8583 *Note: I modified three digits to create a valid Point-of-Service entry mode value

BlackHat USA 2020

5

ISO 8583 Message Components
· Three parts to any ISO 8583 message: 1. Message Type Identifier ­ Acts as a "header" 2. Bitmap ­ Specifies data elements that are present 3. Data Elements ­ Contain transaction-specific information

BlackHat USA 2020

6

ISO 8583 MTI

· Four subcomponents within the ISO 8583 MTI: 1. Version 2. Message Classification (Authorization, financial, chargeback, etc.) 3. Message Function 4. Message Source

BlackHat USA 2020

7

Example ISO 8583 Message
020042000400000000021612345678901234560609173030011456789ABC1000123456 7890123456789012345678901234567890123456789012345678901234567890123456 78901234567890123456789

BlackHat USA 2020

8

Example - MTI

020042000400000000021612345678901234560609173030011456789ABC1000123456 7890123456789012345678901234567890123456789012345678901234567890123456 78901234567890123456789

0200 0 = Version: 1987 2 = Classification: Financial Message 0 = Function: Request 0 = Source: Acquirer

BlackHat USA 2020

9

Example - Bitmap

020042000400000000021612345678901234560609173030011456789ABC1000123456 7890123456789012345678901234567890123456789012345678901234567890123456 78901234567890123456789
This bitmap indicates the presence of fields 2, 7, 22, 63

Open source in-depth bitmap guide: http://www.lytsing.org/downloads/iso8583.pdf Open source bitmap decoder: http://www.fintrnmsgtool.com/decode-iso87-bitmap.html

BlackHat USA 2020

10

Example ­ DE 2 (PAN)

020042000400000000021612345678901234560609173030011456789ABC1000123456 7890123456789012345678901234567890123456789012345678901234567890123456 78901234567890123456789
PAN = 16 digits [1234567890123456]

BlackHat USA 2020

11

Example ­ DE 7 (Transmiss. Date/Time)

020042000400000000021612345678901234560609173030011456789ABC1000123456 7890123456789012345678901234567890123456789012345678901234567890123456 78901234567890123456789
Transmission Date and Time = 06-09 17:30:30 UTC

BlackHat USA 2020

12

Example ­ DE 22 (POS Entry)

020042000400000000021612345678901234560609173030011456789ABC1000123456 7890123456789012345678901234567890123456789012345678901234567890123456 78901234567890123456789

POS Entry Mode = 011 01 = Manual Entry, 1 = PIN entry available at terminal

Source: http://www.fintrnmsgtool.com/iso-point-of-service-entry-mode.html

BlackHat USA 2020

13

FASTCash
· Malware family, intercepts ISO 8583 messages and approves them · Three types: AIX Type 1, AIX Type 2, Windows · Files tailored to their environment

BlackHat USA 2020

14

FASTCash ­ AIX Type 1

BlackHat USA 2020

15

FASTCash ­ AIX Type 1

BlackHat USA 2020

16

FASTCash ­ AIX Type 1
"ld" contents of field to r0 "li" field number to r3

"li" field number to r3

IBM AIX Assembly Instructions: https://www.ibm.com/developerworks/library/l-powasm1/index.html

BlackHat USA 2020

17

FASTCash ­ AIX Type 1 Workflow

BlackHat USA 2020

Oval = Function Rectangle = Action
18

FASTCash ­ AIX Type 1 [CheckSock]
Move required IP Compare current IP to required IP Set value of 1 if they are the same
NewRead
19

FASTCash ­ AIX Type 1 [GetMsgInfo]
Grab Field 2 (PAN)

Grab Field 3 (Processing Code)

NewRead

Not shown: Field 0 (MTI), Field 60 (Reserved/Private)

20

FASTCash ­ AIX Type 1 [Responses]
Three possible workflows: 1. GenerateResponseTransaction1 2. GenerateResponseTransaction2 3. GenerateResponseInquiry1
NewRead
21

FASTCash ­ AIX Type 1 [Processing]
NewRead
22

FASTCash ­ AIX Type 1 [Transaction 1]

NewRead

1. Copy Fields 2. Set Response Code 3. Create Random Amount
23

FASTCash ­ AIX Type 1 [Transact. Fields]

Fields Copied (Transaction 1)

Fields Copied (Transaction 2)

· 2 ­ PAN

· 2 ­ PAN

· 3 ­ Processing Code

· 3 ­ Processing Code

· 4 ­ Amount, Transaction

· 4 ­ Amount, Transaction

· 7 ­ Transaction Date and Time

· 7 ­ Transaction Date and Time

· 11 ­ System Trace Audit Number

· 11 ­ System Trace Audit Number

· 14 ­ Date, Expiration

· 14 ­ Date, Expiration

· 19 ­ Acquiring Country Code

· 19 ­ Acquiring Country Code

· 22 ­ POS Entry Mode

· 22 ­ POS Entry Mode

· 25 ­ POS Condition Code

· 25 ­ POS Condition Code

· 32 ­ Acquiring Identification Code

· 32 ­ Acquiring Identification Code

· 35 ­ Track 2 Data

· 35 ­ Track 2 Data

· 37 ­ Retrieval Reference Number

· 37 ­ Retrieval Reference Number

· 41 ­ Card Acceptor Terminal ID

· 41 ­ Card Acceptor Terminal ID

· 42 ­ Card Acceptor ID

· 42 ­ Card Acceptor ID

· 44 ­ Additional Response Data

· 44 ­ Additional Response Data

· 49 ­ Currency Code, Transaction

· 49 ­ Currency Code, Transaction

· 62 ­ INF Data (binary)

· 62 ­ INF Data (binary)

· 63 ­ Network Data (binary)

· 63 ­ Network Data (binary)

BlackHat USA 2020

24

FASTCash ­ AIX Type 1 [Inquiry]

Fields Copied

· 2 ­ PAN

· 32 ­ Acquiring Identification Code

· 3 ­ Processing Code

· 35 ­ Track 2 Data

· 4 ­ Amount, Transaction

· 37 ­ Retrieval Reference Number

· 7 ­ Transaction Date and Time · 41 ­ Card Acceptor Terminal ID

· 11 ­ System Trace Audit Number · 42 ­ Card Acceptor ID

· 14 ­ Date, Expiration

· 44 ­ Additional Response Data

· 18 ­ Merchant Type

· 49 ­ Currency Code, Transaction

· 19 ­ Acquiring Country Code

· 62 ­ INF Data (binary)

· 22 ­ POS Entry Mode

· 63 ­ Network Data (binary)

· 25 ­ POS Condition Code

*ResponseInquiry1 only uses Response Code 00 (Approve)

BlackHat USA 2020

25

FASTCash ­ AIX Type 1 [Inquiry]
BlackHat USA 2020

cc01sssCdddddddddddd "356"
Field 54 (Additional Amounts)
26

FASTCash ­ AIX Type 1 [Inquiry]

· What is actually happening here?

Amount Type 01 (ledger balance)

· Field 54: Up to six additional account amounts

C = Credit Amount

· Format:

cc01356Cdddddddddddd

· Account Type (2 Numbers)

· Amount Type (2 Alphanumeric)

Currency Code 356 (Indian Rupee)

· Currency Code

· Balance Type Digit (0, C, or D) + Amount (12 digits)

Resources: https://stackoverflow.com/questions/26119041/what-is-the-structure-of-field-no-54-p54-in-the-the-iso-8583-standard
http://unalarif.com/yazi/iso-8583-field-aciklamalari-f54/ (Turkish)

BlackHat USA 2020

27

FASTCash ­ Putting it All Together
1. Inject Into Process 2. Preliminary Checks (e.g. IP, PAN, Message Type) 3. Decision point:
1. Pass Transaction 2. Block + Response 1 3. Block + Response 2 4. Block + Inquiry

BlackHat USA 2020

28

FASTCash ­ AIX Type 2

BlackHat USA 2020

29

FASTCash ­ AIX Type 2
· Consolidated message processing · Blacklist function (named but no functioning branching logic) · "Transition" between AIX Type 1 and Windows versions

Documented at a high level in open source: https://symantec-enterprise-blogs.security.com/blogs/threat-intelligence/fastcash-
lazarus-atm-malware

BlackHat USA 2020

30

FASTCash ­ Windows

BlackHat USA 2020

31

FASTCash ­ Windows (ResponseParent)
Get Field 0 (MTI) Get Field 22 (POS Entry Mode)
Digits 3 and 4 in MTI are "00" POS Entry Starts With "9"
BlackHat USA 2020

Results of GetField_Str are moved into EAX and EDI and used below
Digit Checker Function Push 2 = Check two digits Add EAX, 2 = start two digits in Push "00" = Comparison String Push EAX = Location of String
32

FASTCash ­ Windows (Response)
1. Grab MTI + Fields 3, 4, 11, 49 2. Check that all these fields had data 3. Exit function if not

BlackHat USA 2020

33

FASTCash ­ Windows (Response)
Processing Code First Digit = "3" ? Processing Code First Digit = "0" ?

BlackHat USA 2020

34

FASTCash ­ Windows (Response)

BlackHat USA 2020

35

FASTCash ­ Windows (Response)

· Processing Code Starts with 3: · Return random amount as balance inquiry · cc02949Cdddddddddddd · 949 = Turkish Lira · 02 = Available Balance
· Processing Code Starts with 0: · Response 00, return random amount
· Other Processing Codes: · Response 55 (Incorrect PIN)

BlackHat USA 2020

36

FASTCash ­ Three Things to Think About
1) A lot needs to go right 2) An awful lot can go wrong 3) Heavy operational requirements (e.g. programmers, money mules, access)

BlackHat USA 2020

37

XFS ­ Intro
· eXtensions for Financial Services · Standard API for using financial devices such as ATMs · JXFS ­ Java version

BlackHat USA 2020

38

XFS ­ Intro

· Common in ATM malware · MXFS.dll · WFSGetInfo · WFSExecute · WFS_CMD_PIN_GET_DATA · WFMOpenKey · WFMEnumKey · ...any many more

Kaspersky example: https://securelist.com/atmii-a-small-but-effective-atm-robber/82707/
TrendMicro example: https://blog.trendmicro.com/trendlabs-security-intelligence/untangling-ripper-atm-malware/

BlackHat USA 2020

39

INJX_Pure ­ Background
· ATM malware, relies on XFS and proprietary software
· Operators can: · Query device information · Dispense cash remotely · Load and inject additional Java code · Execute arbitrary JavaScript · Execute arbitrary cmd.exe commands

BlackHat USA 2020

40

INJX_Pure ­ Scope

· For this presentation, we are only focusing on the cash dispensing actions
· Open source reporting covering some of the other interesting parts: · Kaspersky high-level: https://securelist.com/criminals-atms-and-a-cup-of-coffee/91406/
· Yoroi, more detailed: https://yoroi.company/research/java-amt-malware-the-insider-
threat-phantom/
· Frank Boldewin, some context: https://github.com/fboldewin/Libertad-y-gloria---A-
Mexican-cyber-heist-story---CyberCrimeCon19-Singapore

BlackHat USA 2020

41

INJX_Pure ­ Workflows

BlackHat USA 2020

42

INJX_Pure ­ Workflows

1. KRunnable() ­ Reads file named .AgentCli 1. If value = 2, add log entry 2. If value = 1, scandyna(), loadconf(), patchall()
2. loadconf() ­ Creates an HTTPServ() that accepts commands · d ­ dispense cash or query the device · eva ­ run arbitrary JavaScript · mgr ­ pull running classes · core ­ run a locally stored JAR file · [no endpoint] ­ execute arbitrary shell command

BlackHat USA 2020

43

INJX_Pure ­ loadconf()

Creates an HTTP server

BlackHat USA 2020

44

INJX_Pure ­ "/d" command

"/d" endpoint check

"POST" check

Query function Dispense function
45

INJX_Pure ­ "/d" Query
· Which of these are XFS?
· Peripheral.Dispenser · getNumberOfCashUnits · getCashUnit

BlackHat USA 2020

46

INJX_Pure ­ getCashUnit

BlackHat USA 2020

47

INJX_Pure ­ getCashUnit
CEN Documents: https://www.cen.eu/work/areas/ict/ebusiness/pages/ws-j-xfs.aspx

BlackHat USA 2020

48

INJX_Pure ­ getCashUnit

BlackHat USA 2020

49

INJX_Pure ­ getNumberofCashUnits?
HUGE credit to Frank Boldewin for finding the source code referenced below on VirusTotal: https://github.com/fboldewin/Libertad-y-gloria---A-Mexican-cyber-heist-story---CyberCrimeCon19-Singapore

BlackHat USA 2020

50

INJX_Pure ­ NotesDeposit

Taking it one step further...
· accept · disableInsert · eject · ejectReject · ejectStack · enableInsert · enableInsertByNotesType · getCanRetract · getCashUnit · getCashUnitEx · getCashUnitInfoEx · getCommandStatus · getDeviceStatus
BlackHat USA 2020

· getDeviceStatusString · getInputShutterStatus · getItemsTransportStatusString · getMaxStackerCapacity · getMediaStatus · getMediaStatusString · getNumberOfCashUnits · getNumberOfRejectedNotes · getNumberOfRetractedNotes · getNumberOfRetractOperations · getOutputStatus · getOutputStatusString · getRejectBinStatus

· getRejectBinStatusString · getShutterStatusString · getStackerStatus · getStackerStatusString · getVendorInfoError · reset · retract · stack · waitForEject · waitForEjectReject · waitForEjectStack · waitForInsert

51

INJX_Pure ­ Peripherals

What else could the attackers have done?

Screen
· disableKeys · enableKeys · executeCommand · extraCommand · getTimeOut · mask · maskAndWaitAndTimeOut

· maskWithoutShow · setAutoEnter · setTimeOut · show · waitAction · waitActionWithoutPinPadControl

Host
· isOnline · receive · reset · send
BlackHat USA 2020

System Service
· alive · getDate · getRebootStatus · getYear · reset

PinPad

· addPinPadListener

· encrypt3DesMac

· getSerialNumber

· removePinPadListener

· reset

52

INJX_Pure ­ "/d" Dispense

· Yellow = Likely XFS/Built on XFS · Orange = Unclear · Red = Likely Proprietary

ATM manual in OSINT
Dispense function
53

INJX_Pure ­ Dispense
54

XFS Approach
· Possibility of proprietary implementations · Increased development time · With INJX_Pure, someone has to:
1) Deploy the malware 2) Be at the ATM at the right time

BlackHat USA 2020

55

Concluding Thoughts
· Malicious activity facilitated by legitimate, widely-used financial standards · Two different approaches to accomplish the same thing · High operational requirements: money mules, long-term intrusions

BlackHat USA 2020

56

