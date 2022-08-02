FireEye's 2013, 0 DAY THREAT REPORT
1

PERENTAGE OF JAR ATTACKS AMONGST DRIVE BY DOWNLOAD
2

TARGETED ATTACKS
 CVE-2013-2465 used in strategic Web Compromise on an Embassy.
Exploit was leveraged to disable security permissions, after which malicious executable was executed, which initiated call back and in the response base 64 embedded executable was served.
3

SESSION ID: HT-F02
INTO THE WORLD OF JAVA APPLETS

Abhishek Singh
Senior Staff Research Scientist Engineer FireEye

Varun Jain
Malware Researcher FireEye

#RSAC

#RSAC
Attack Flow

ATTACK FLOW
 Vulnerability  Elevation of Privilege  Security Manager Disabled  Download and Execute the malware.
6

VULNERABILITIES
 Improper implementation of Java Runtime Environment
awt_ImagingLib.c
7

VULNERABILITIES
 Type Confusion
 Ex: CVE-2011-3521/CVE-2012-0507
8

VULNERABILITIES
 Type Confusion Example: CVE 2012-0507
9

VULNERABILITIES
 Improper implementation of base classes
Bug inside the base classes can be used to run privileged code from untrusted code. Eg CVE 2013-5076
10

DIVE INTO THE EXPLOITATION BYJAVA
 Live Demo
11

EXPLOITATION BASED UPON THE OPERATING SYSTEM
12

USING EXPIRED CERTIFICATES
13

OBFUSCATION FLOW STEPS
 obfuscated string => decrypting function => parameter to the function
14

OBFUSCATION
15

CHALLENGES FOR A FILE

BASED SANDBOX.

#RSAC

HTML PAGE FOR EXECUTION
17

Network Connectivity
18

RIGHT ENVIRONMENT
 CVE-2012-0507 : Java SE 7 Update 2, 6 Update 30, 5.0 Update 33
19

#RSAC
Malicious Indicators

Obfuscation
 Hide the Data , name of URL, file name  Data Obfuscation :
21

METRICS TO DETERMINE OBFUSCATION
 N-gram, Entropy and Word Size  N-gram checks for the probability of occurrence of certain
sequence based upon the good and the bad sample set  Entropy checks for the distribution of the used bytes codes  Word Size checks if very long strings are used
22

DATA OBFUSCATION
23

FUNCTIONAL OBFUSCATION
 Hide the function Names By Using reflection API calls. Two Steps Process:
a. Create the Obfuscated API calls. b. Use Reflection API to call at the runtime.
24

API's FOR RETRIVING CLASS NAMES
 Class.forName()  Object.getClass()
Access to Fields, Methods, and Constructors of the Class a. getMethod() b. getField()
25

MALICIOUS INDICATORS: NAMES OF THE CLASS FILES.
26

N-GRAM ANALYSIS ON CLASS NAMES
 Accuracy ~ 90%.
27

DESIGN ARCHITECTURE

#RSAC

FOR A DETECTION MODEL

FEATURES IN A DETECTION MODEL
 Correlation between the static using probabilistic and Machine learning Algorithms, dynamic behavior and the network communication is a must .
29

FEATURES FOR A DETECTION MODEL
 Multi Flow Analysis of a network stream is must.
30

DESIGN ARCHITECTURE
 Multi Vector Multi Flow analysis providing correlation between the static dynamic and network behavior of a file.
31

SUMMARY
 JAR attacks are complex make use of obfuscation, reflection to prevent the static analysis which provides challenge to static scanning.
 Detonation of the JAR inside the file based sandboxes require the input parameters, live internet connection, right version which yet provided challenge to the file based sandbox.
 Multi Vector and Multi Flow analysis is must for detection of JAR.
32

SO WHAT SHOULD WE DO ?
 Ensure latest version java plugin is installed on client browser.
 Leverage and use the Java security policy built around certificate signing.
 Make an educated decision about use of Java Plugin.
 Detection solution at the Perimeter : Automated Analysis System leveraging correlation is must to detect and prevent sophisticated unknown jar applet attacks
 File based sandbox will fail to analyze the behavior of malicious jar. These are designed as a research tool.
 Static Scanning has limitations .
33

Q&A
34

REFERENCES
 Brewing up Trouble: Analyzing the four widely exploited Java Vulnerabilities. https://www.fireeye.com/content/dam/legacy/resources/pdfs/fireey e-java-vulnerabilities.pdf.

 A daily grind : Filtering Java Vulnerabilities.

I

https://www.fireeye.com/content/dam/legacy/resources/pdfs/fireeye

-a-daily-grind-filtering-java-vulnerabilities.pdf

35

ACKNOWLEDGEMENTS
 We would like to express gratitude to Anirban Das and Ali Mesdaq, our colleagues at FireEye, for their help with NGRAM analysis.
36

Contact Information
 Varun Jain Email : varun.jain@fireeye.com
 Abhishek Singh: Email : abhishek.singh@fireeye.com
37

