Would You Need Help to Create Privacy Policies for Apps?
Le Yu, Chenxiong Qian, Xiapu Luo, Lei Xue The Hong Kong Polytechnic University
1

Privacy Policy
 Explain what data will be accessed/transmitted/stored/shared/ used by the app as well as the reasons.
 Emphasize what data will not be accessed/transmitted/stored/ shared/used by the app.
2

3

4

Outline
 Spotting Issues in Apps' Privacy Policies  Generating Privacy Policies Templates for Apps  Conclusion
5

Common Faults in Privacy Policies
 Incomplete privacy policy
 The privacy policy does not cover an app's all behaviors of accessing personal information.
 Example
 Get location information without claiming such behavior in its privacy policy.
6

Common Faults in Privacy Policies
 Incorrect privacy policy  An incorrect privacy policy declares that the app will not collect, use, retain, or disclose personal information, but the app does.
 Example of legitimate apps with incorrect privacy policy:
 Privacy policy
 "we will not store your real phone number, name and contacts".
 Code
 Get the contact information and write it to log.
7

Common Faults in Privacy Policies
 Inconsistent privacy policy
 The privacy policy of an app is in conflict with that of its thirdparty libs.
 Example
 A popular game app's privacy policy says:
 "we do not use or collect your precise geographic location."
 It uses a third-party library, whose privacy policy says:
 "We receive information about Users, their devices, locations and interactions with the Service primarily in two ways."
8

Automatically Checking Privacy Policies
APK
Description

What's new
PPChecker

Problems in privacy policy

9

Privacy policy

PPChecker

App's description Description analysis App's what's new What's new analysis

App's privacy policy
Third-party lib's privacy policy
App's APK file

Privacy policy analysis
Static analysis

Permissions inferred from description
Permissions inferred from what's new
Information that app will collect/retain/disclose
Information that lib will collect/retain/disclose
Information that app will use/retain in code

Problems in privacy policy

Our tool analyzed 1,680 popular apps downloaded from Google play store and found that 484 apps (i.e., 28.8%) contain at least one kind of problem.
10

Description Analysis

App's description

Description analysis

Permissions required by the app

 Example:
 "share your location"  ACCESEE_FINE_LOCATION  "exchange contacts"  READ_CONTACTS

 11 Permissions
 WRITE_EXTERNAL_STORAGE  ACCESS_FINE_LOCATION  ACCESS_COARSE_LOCATION  GET_ACCOUNTS  RECEIVE_BOOT_COMPLETED  READ_CALENDAR

CAMERA READ_CONTACTS RECORD_AUDIO WRITE_SETTINGS WRITE_CONTACTS

11

Description Analysis
 AutoCog:
 Generate a description-to-permission relatedness (DPR).
 ACCESS_FINE_LOCATION ("view","map"), ("search","parking")
 Extract (verb, noun) pairs from sentences in description.
 "share your location"  ("share","location")
 Calculate the semantic similarity between (verb, noun) pair and the DPR model.
 ("search","hotel")  ("find","hotel") (ACCESS_FINE_LOCATION)
12

Description Analysis
 Enhanced AutoCog:
 Remove Negative sentences in description.
 "you do not need to create another contact list ..."
 Co-reference resolution: Pronouns in description.
 Before: "and meet new friends in person, bringing them from ..."  After: "and meet new friends in person, bringing new friend from ..."
13

What's new Analysis

App's what's new

What's new analysis

Permissions required by the app

 Use enhanced AutoCog to process the what's new

 11 Permissions
 WRITE_EXTERNAL_STORAGE  ACCESS_FINE_LOCATION  ACCESS_COARSE_LOCATION  GET_ACCOUNTS  RECEIVE_BOOT_COMPLETED  READ_CALENDAR

CAMERA READ_CONTACTS RECORD_AUDIO WRITE_SETTINGS WRITE_CONTACTS

14

Privacy Policy Analysis

App's privacy policy

Privacy policy analysis

Information that the app will collect/use/retain or disclose

 How to handle different sentences representing the same meaning?
 "we will collect your location".  "your location information is collected by the app".
 Key Idea: Summarize the semantic patterns (i.e., sentence structure) used in privacy policy.
15

Privacy Policy Analysis
 Bootstrap algorithm:Automatically find pattern in corpus
 Step 1: Seed pattern:
 "[sbj] collect/use/retain/disclose [resource]".
 Step 2: Find the sentences that contain the same subject, resource.
 Step 3: Extract pattern from new sentences.
16

Privacy Policy Analysis
 Pattern match: Find sentences that match the patterns.
 Pattern: [sbj] "be allowed to" VP_{collect} [resource].  Sentence: "We are allowed to collect your location".
 Negation analysis: Identify negative sentences.
 Information will not be collected/used/retained.  Method:
 Maintain a list of negation words.  Check subject:"No information will be collected".  Check root-word related words:"We will not collect your location".
17

Privacy Policy Analysis
 Constraint analysis:
 Under which condition the information will be collected/retained.  Example:
 Category: Registration.  Extract pre-condition/post-condition: "When you register with or visit the
rockyou sites".  Search keywords: "register".
 Extract resource from sentence.
 Example:
 "Your location will be collected by the app"  Extract "location"
18

Static Analysis

App's APK file

Static analysis

Information that the app will collect/retain in code

 Determine the collected information.

 Check APIs called in code.

getLastKnownLocation()  "location"

 Check URIs used in code.

content://com.android.contacts  "contact"

 Determine the retained information.

 Static taint analysis

 Traverse the data dependency graph (DDG)

 Source to sink path.

getLatitude()  sendTextMessage()

19

Static Analysis
 Implementation
 Pre-processing
 Extract dex file from APK file.  Transform dex file into intermediate language Shimple using soot.
 Construct the Android Property Graph:
 Abstract syntactic trees (ASTs)  Method call graph (MCG)  System dependency graph (SDG)  Inter-procedure control flow graph (ICFG)
20

Static Analysis

 Android Property Graph (APG):
 Abstract syntactic trees (ASTs)  Method call graph (MCG)  System dependency graph (SDG)  Inter-procedure control flow graph (ICFG)

CellValidateService

public class CellValidateService extends Service { public void onStart(Intent pIntent, int pInt){ String String1 = "xxx" if(String1 != null) { Code(String1, String2) ... } }

onStart()
String1 = "xxx"

Code()
if(String1 != null)

private void Code(String dest, String text){
}
} 21

Code(String1, String2)

Static Analysis

 Android Property Graph:
 Abstract syntactic trees (ASTs)  Method call graph (MCG)  System dependency graph (SDG)  Inter-procedure control flow graph (ICFG)

CellValidateService

public class CellValidateService extends Service { public void onStart(Intent pIntent, int pInt){ String String1 = "xxx" if(String1 != null) { Code(String1, String2) ... } }

onStart()
String1 = "xxx"

Code()
if(String1 != null)

private void Code(String dest, String text){
}
} 22

Code(String1, String2)

Static Analysis

 Android Property Graph:
 Abstract syntactic trees (ASTs)  Method call graph (MCG)  System dependency graph (SDG)  Inter-procedure control flow graph (ICFG)

CellValidateService

public class CellValidateService extends Service {

onStart()

public void onStart(Intent pIntent, int pInt){

String String1 = "xxx"

if(String1 != null)

{

String1 = "xxx"

Code(String1, String2)

...

} }

D[String1]

Code()
D[String1]
if(String1 != null)

private void Code(String dest, String text){
}
} 23

C[If-true]
Code(String1, String2)

Static Analysis

 Android Property Graph:
 Abstract syntactic trees (ASTs)  Method call graph (MCG)  System dependency graph (SDG)  Inter-procedure control flow graph (ICFG)

public class CellValidateService extends Service { public void onStart(Intent pIntent, int pInt){ String String1 = "xxx" if(String1 != null) { Code(String1, String2) ... } }

onStart()
String1 = "xxx" if(String1 != null)

private void Code(String des, String tex){

24 }

String3 = des + tex String4 = String3 + ";"

Code(String1, String2)

Code()
String3 = des+tex String4 = String3 + ";"

Problem Identification
 Incomplete privacy policy
 Contrast description with privacy policy
 The permissions inferred from description vs. the permissions associated with the information mentioned in privacy policy.
 Contrast what'snew with privacy policy
 The permissions inferred from what'snew vs. the permissions associated with the information mentioned in privacy policy.
 Contrast code with privacy policy
 The information collected/retained by code vs. the information mentioned in privacy policy.
25

Problem Identification
 Incorrect privacy policy
 Contrast description with privacy policy
 Privacy policy declares NOT to use the information whose permissions can be inferred from description.
 Compare code with privacy policy
 Privacy policy declares NOT to use the information that is collected/retained by code.
26

Problem Identification
 Inconsistent privacy policy
 Compare an app's privacy policy with its third-party libs' privacy policies  App's privacy policy declares NOT to collect/use/retain/disclose certain information.
 Lib privacy policy declares to collect/use/retain/disclose the information
27

Experimental Result
 Data set:
 1680 apps downloaded from Google Play
 Each app contains APK file, description, what'snew, and privacy policy  484 apps (i.e., 28.8%) contain at least one kind of problem.
 Some apps have more than one problem.

 Third-party libraries considered:

 Contain privacy policies and class names.

 52 ad libs.

Example: Admob, Tapjoy

 9 social libs.

Example: Facebook,Twitter

 20 development tools. Example: Flurry analytics, Unity 3D

28

Incomplete Privacy Policy
 392 questionable apps
 Example  Privacy policy
 "Internet technology requires some basic information in order for users of websites or mobile apps to use our online services smoothly.The basic information should include but not limited to IP addresses and/or domain names, browser type and settings, language settings, geographical district, operating system, and time/duration of visit.These data are anonymous and cannot be used to identify the user under general situations. When personal identifiable information of users are involved or collected in the Federation's websites or mobile apps, users will be prompted to give explicit alert of the collection so as to give consent."
 Code:
29

Incomplete Privacy Policy
 Number of incomplete privacy policies for different kinds of personal information.
30

Incorrect Privacy Policy
 4 questionable apps.
 Example 1
 Privacy policy
 "we are not collecting your data of birth, phone number, name or other personal information, nor those of your contact."
 Code
 Collect contact information.
 Example 2
 Ambiguous privacy policy
 "we will not store your real phone number, name and contacts"  "Users locations would not be transmitted out from the app".
 Code
 They get the information and write to log file.  Note: third-party libs in the app or colluded apps can access the information in
log file; attackers could use adb to access the log; apps in a rooted smartphone could access the log.
31

Inconsistent Privacy Policy
 111 questionable apps
 Example
 App's privacy policy
 "we do not collect information such as your real name, address, or phone number."
 Third-party lib's privacy policy
 "we may collect device specific information (such as ... mobile network information including phone number)".
 Example
 App's privacy policy
 "We don't share your personal information with any third parties".
 Third-party lib's privacy policy
 "We may share certain types of personal information with third parties."
32

Checking 21 popular apps in Taiwan
 Three incomplete privacy policies
 One app missed installed app list.  One app missed location.  One app missed account.
 One inconsistent privacy policy
 One app declares "we do not share personal information with third party advertisers for their direct marketing purpose".
 Third party lib declares "XXX may also share your personal information with third parties"
33

Problems in Third-Party Libs' Privacy Policies
 52 ad libs, 9 social libs, and 20 development tools
 5 third-party libs have incomplete privacy policies.
 3 libs missed device ID  2 libs missed IP address  1 lib missed location  1 lib missed sim card number
 Example
 A lib will collect location information according to its code.
 getLatitude()  getLongitude()
 However, its privacy policy does not mention such behavior.
34

Outline
 Spotting Issues in Apps' Privacy Policies  Generating Privacy Policies Templates for Apps  Conclusion
35

Writing Privacy Policy
 Is it difficult?
 No, because
 There are many guidelines and training courses.  Free online generators. ...
 Yes, because the author of a privacy policy may
 not well understand the app's source code.  not be familiar with the precise operation of each API used.  not know the internals of the integrated third-party libraries. ...
36

AutoPPG: Automatically Generating Privacy Policy Templates

Signature and descriptions of selected APIs

Document analysis

Information that each API will access

Personal information;

APK

Static analysis

User of personal information; Condition for using such information;

Information retention

Privacy policy templates

Post-process

Privacy policy generator

Our tool takes in an apk file and then generate a correct and readable privacy policy template for it.

37

Document Analysis

Signature and descriptions of selected APIs

Document analysis

Information that each API will access

 Syntactic analysis on the description of the API.
 getRunningAppProcesses(): "Returns a list of application processes that are running on the device".

38

Document Analysis
 Extract noun phrase from method name.
 getRunningAppProcesses  Running App Process
 Extract noun phrase from class name.
 Android.hardware.Camera  Camera
 Extract private information.
 Compare the object in description with method name/class name.  If the object cannot cover method name/class name, add additional
information.
 "list" "Running App Process"  Low similarity  "list" + "of application processes"
39

Static Analysis

Personal information;

APK

Static analysis

User of personal information; Condition for using such information;

Information retention

 Extract Dex file from APK file (Unpacking if need)

 Construct Android Property Graph:
 method call graph (MCG)  system dependency graph (SDG)  Inter-procedure control flow graph (ICFG)  Abstract syntactic trees (ASTs)

40

Static Analysis
 Identify the APIs/URIs used in code.
 Get information through API  Get information through URI
 Reachability analysis to remove infeasible code.
 Infeasible code will not be triggered.  Traversal the method call graph (MCG).
 Two kinds of entry points
 Lifecycle methods: onCreate()  UI callbacks: onClick()
41

Static Analysis
 Identify the conditions under which these APIs/URIs are used.
 Device specific information.
 Language: Locale.getDisplayLanguage()  OS version: android.os.Build.VERSION  Screen size: Display.getSize()
 Natural environment requirement.
 Time: Date.getHour()  Location: Location.getLatitude()
 Hardware events.
 Press BACK and HOME keys  Lifecycle callback: onPause(), onResume()
42

Static Analysis
 Identify the conditions under which these APIs/URIs are used.
 UI events.
 Widget:View.Button  Callback: onClick()
 System events.
 Broadcast receiver  Intent: BOOT_COMPLETED
 Device status.
 Current status of current device  API: PowerManager.isScreenOn()
43

Static Analysis
 Identify the user of these APIs/URIs.  The app itself or third-party lib.
 Check if the information is stored in file/log, sent out through internet/SMS.  Static taint analysis on data dependency graph (DDG).  Source to sink path.
44

Privacy Policy Generator
 Template of each generated sentence:
 Sentence = [pre-condition] subject verb object [post-condition]
 Subject: User of the sensitive information.
 Verb:Analyse the data flow to determine verb.
 URIs:
 ContentResolver.update()  Verb: update  ContentResolver.query()  Verb: read
 APIs:
 External storage: FileOutputstream.write() Verb: write  Other APIs: manually define verbs
45

Privacy Policy Generator
 Template of each generated sentence:
 Sentence = [pre-condition] subject verb object [post-condition]
 Object: Private information extracted from official description.
 Pre-condition and post-condition:
 Six kinds of condition identified in code.
 UI events: add "when you press the button" as condition.
 Information retained or not.
 If the information is retained, we add additional sentence after it.
 "This information will be retained in file/log"  "This information will be transferred out via SMS/internet/bluetooth"
46

Post-Process
 Remove duplicate sentences.
 Different APIs get the same information.
 getAccounts() and getAccountsByType().
 The private information obtained by one API can be covered by another API.
 getLatitude() and getLastKnownLocation().
47

Post-Process
 Example
 App calls getLastKnownLocation(), getLatitude(), and getLongitude() in the same method.
 Only one sentence will be generated.  "We would use location (including, latitude and longitude)."
48

Post-Process
 Change the order of the remaining sentences.
Sensitive behaviors (e.g., read contacts/SMS) are displayed first.
 Private information risk rank list:
 1 contact  2 SMS  3 call log  4 browser history  5 calendar  6 device ID  7 audio  8 camera  9 location ...
49

50

Evaluation
 Comparing the coverage of the privacy policies generated by our tool and that of existing privacy policies.
 "N": privacy policies generated by our tool,"O": existing privacy policies  Existing privacy policies may be either incomplete or imprecise.
51

Outline
 Spotting Issues in Apps' Privacy Policies  Generating Privacy Policies Templates for Apps  Conclusion
52

Suggestions
 For normal users, please read the privacy policy before installing an app if it is available.
 For app developers, please provide clear privacy policies following the suggestions/guidelines, get familiar with the APIs/third-party libs used, and avoid over-claiming permissions.
 For companies that outsource the app development, please check the code and the privacy policy carefully before releasing the app.
53

Conclusion
 Correct and clear privacy policies are very useful to the apps.
 Identify three kinds of problems in privacy policies, and find many existing privacy policies have at least one problem.
 Develop PPChecker to automatically identify problems in an app's privacy policy by analyzing information from multiple sources.
 Develop AutoPPG to automatically generate privacy policy templates for apps without the need of source codes.
54

55

