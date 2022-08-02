(In-)Security of Backend-as-a-Service
Siegfried Rasthofer (TU Darmstadt / CASED) Steven Arzt (TU Darmstadt / CASED) Robert Hahn (TU Darmstadt) Max Kolhagen (TU Darmstadt) Eric Bodden (Fraunhofer SIT / TU Darmstadt)
02.11.15 | BlackHat Europe 2015 | 1

#Whoami
Siegfried Rasthofer · 3rd year PhD-Student at TU Darmstadt · Research interest in static-/dynamic code analyses · AOSP exploits, App security vulnerabilities · Talks at academic as well as industry conferences
Steven Arzt · 3rd year PhD-Student at TU Darmstadt · Maintainer of the Soot and FlowDroid frameworks · Works on static program analysis · Likes to look for vulnerabilities
02.11.15 | BlackHat Europe 2015 | 2

Access to 56 Mio data... Remote code execution... Full VM access...
02.11.15 | BlackHat Europe 2015 | 3

... with ease

IaaS

PaaS

??

SaaS

02.11.15 | BlackHat Europe 2015 | 4

02.11.15 | BlackHat Europe 2015 | 5

BaaS

Agenda
· Introducing BaaS · Security Analysis · Findings · Countermeasures · The Wishlist · Conclusion
02.11.15 | BlackHat Europe 2015 | 6

Backend-as-a-Service (1)
APP
BaaS SDK
02.11.15 | BlackHat Europe 2015 | 7

Cloud

Backend-as-a-Service (2)

Android
BaaS

iOS JavaScript

...
02.11.15 | BlackHat Europe 2015 | 8

Backend-as-a-Service (3)

Push Notifications

Data Storage

User Administration
...

Social Network

02.11.15 | BlackHat Europe 2015 | 9

Security?
02.11.15 | BlackHat Europe 2015 | 10

02.11.15 | BlackHat Europe 2015 | 11

BaaS SDK

Amazon Tutorial ­ Files in S3 Buckets

DB connection
AmazonS3Client s3Client = new AmazonS3Client( new BasicAWSCredentials("MY_ACCESS_KEY_ID", "MY_SECRET_KEY") );
"When you access AWS programmatically, you use an access key to verify your identity and the identity of your applications. An access key consists of an access key ID and a secret access key.
Anyone who has your access key has the same level of access to your AWS resources that you do."
Source: http://docs.aws.amazon.com/
02.11.15 | BlackHat Europe 2015 | 12

BaaS SDK

Amazon Tutorial ­ Files in S3 Buckets

DB write
PutObjectRequest por = new PutObjectRequest( BUCKET_NAME, OBJECT_NAME, File( filePath) ); s3Client.putObject( por );
DB read
GetObjectRequest request = new GetObjectRequest(BUCKET_NAME, OBJECT_NAME); S3Object object = s3Client.getObject(request); S3ObjectInputStream objectContent = object.getObjectContent(); IOUtils.copy(objectContent, new FileOutputStream("D://upload//test.jpg"));

02.11.15 | BlackHat Europe 2015 | 13

BaaS SDK

Parse example

DB connection
Parse.initialize(this, "ApplicationID", "ClientKey");
DB write
ParseObject testObject = new ParseObject("TestTable"); testObject.put("foo", "bar"); testObject.saveInBackground();
DB read
final ParseQuery<ParseObject> userQuery = ParseQuery.getQuery("TestTable"); userQuery.findInBackground(new FindCallback<ParseObject>() { @Override public void done(List<ParseObject> parseObject, ParseException e) {
if (e == null) { //foo : bar
} }

02.11.15 | BlackHat Europe 2015 | 14

Let's go for it
SECURITY ANALYSIS
02.11.15 | BlackHat Europe 2015 | 15

initialize("AppID", "ClientKey") getQuery("TestTable") ParseObject("Users") ...
= FUN???

Static
· Lot`s of tools available: · Soot · Dex2jar + grep · Dare/Ded + grep · Smali + grep · ...

02.11.15 | BlackHat Europe 2015 | 16

initialize(v1, dec("yicqco44")) getQuery(v3)
ParseObject("Users") ...
= FUN???

Static + Dynamic
· Constant string propagation
· Function hooking · Bytecode
instrumentation · HTTP(S) interception · Harvester tool

02.11.15 | BlackHat Europe 2015 | 17

Pre-Analysis (1)
+
public void onCreate() { java.lang.String $S1, $S2; $S1 = "1wlI1wgISehUpTunWRAzXeAagH3NAL7W6buKTe7e"; $S2 = "vM7MONJWjsEp3fpJfq9wvHBnOogaOQCSW98BF7e3"; staticinvoke <Parse: void initialize(Context, String, String)>(this, $S1, $S2);
}
· App ID · Client Key Parse REST API
02.11.15 | BlackHat Europe 2015 | 18

Pre-Analysis (2)
Q: [...]"The App-Secret key should be kept private but when releasing the app they can be reversed by some guys. I want to know what is the best thing to encrypt, obfuscate or whatever to make this secure."[...]
(Source: stackoverflow.com)
R: "Few ideas, in my opinion only first one gives some guarantee: 1. Keep your secrets on some server on internet, and when needed just grab them and use. 2. Put your secrets in jni code 3. use obfuscator 4. Put your secret key as last pixels of one of your image in assets "
(Source: stackoverflow.com)
02.11.15 | BlackHat Europe 2015 | 19

Pre-Analysis result: Only a few developers apply "security by obscurity". The rest doesn`t even use obfuscation.
02.11.15 | BlackHat Europe 2015 | 20

... let's get ready for a mass-analysis
02.11.15 | BlackHat Europe 2015 | 21

Mass-Analysis ­ What do we need?

ToDo
BaaS-identification

How?
· Package-name · Heurisitc (obufscation)

Keys extraction

· Static: grep, constant string propagation · Dynamic: function hooking, bytecode
instrumentation, traffic interception, etc. · Hybrid: HARVESTER (tool)

· Static: grep, constant string propagation

Table-name/bucket-name · Dynamic: function hooking, bytecode

extraction

instrumentation, traffic interception, etc.

· Hybrid: HARVESTER (tool)

Data extraction

Rest API + Python

02.11.15 | BlackHat Europe 2015 | 22

HARVESTER
Combines static code analysis (backward slicing) with bytecode manipulation and dynamic code execution
initialize(v1, dec("yicqco44"))
initialize("AppID", "ClientID")
Harvesting Runtime Data in Android Applications for Identifying Malware and Enhancing Code Analysis Siegfried Rasthofer, Steven Arzt, Marc Miltenberger, Eric Bodden Technical Report, February 2015.
02.11.15 | BlackHat Europe 2015 | 23

So ... how bad is it?
OUR FINDINGS
02.11.15 | BlackHat Europe 2015 | 24

Findings Parse

Precise car accident Information

Pictures

User-centric location data

Birthday Information

Contact data

Facebook Information - User`s friends - User`s blocked
friends

Phone numbers Valid email addresses
Purchase data

02.11.15 | BlackHat Europe 2015 | 25

Findings Parse (2)
Intercepted SMS messages
Leaked data

C&C tasks C&C commands

We know what you did this summer: Android Banking Trojan exposing its sins in the cloud Siegfried Rasthofer, Eric Bodden, Carlos Castillo, Alex Hinchliffe VirusBulletin 2015, AVAR 2015
02.11.15 | BlackHat Europe 2015 | 26

Findings Amazon (1)
02.11.15 | BlackHat Europe 2015 | 27

Findings Amazon (2)
Push Service

Dynamo

02.11.15 | BlackHat Europe 2015 | 28

S3

EC2 ElasticBeanstalk

Findings Amazon (3)

Server Backups

Baby Growth Data

Photos

02.11.15 | BlackHat Europe 2015 | 29

Findings Amazon (4)

Private Messages

Lottery Data

Web Page Content

02.11.15 | BlackHat Europe 2015 | 30

Responsible Disclosure Process ­ Parse (Facebook)

28th April 2015

Access to ~56 Mio Data Contacted Facebook with a few samples

5th Mai 2015

Facebook verified it and asked for more data

18th Mai 2015 We provided all information

20th Mai 2015 12th Nov 2015

Facebook forwarded everything to Parse (we assume they contacted the developers)
Still access to ~56 Mio Data

02.11.15 | BlackHat Europe 2015 | 31

How can we get it right?
COUNTERMEASURES
02.11.15 | BlackHat Europe 2015 | 32

Basic Countermeasures
· Use ACLs to limit power of credentials
· Lest privilege principle
· Get the credentials out of the app
· Server-side semantics · Expiring tokens
· Check for weird behavior
· Server-side monitoring · Server-side integrity checks
02.11.15 | BlackHat Europe 2015 | 33

Amazon Cognito (1)
· Identity management
· Authenticate app users · ACLs on objects (folders in S3 buckets, etc.)
· Profile management
· Associate additional data with accounts
· Automatic synchronization
· Well, it's online anyways
02.11.15 | BlackHat Europe 2015 | 34

Amazon Cognito (2)

Peter

X

X

Howard
02.11.15 | BlackHat Europe 2015 | 35

Peter`s stuff Howard's stuff

Amazon Cognito (3)
· What if you don`t have accounts?
· Goal: Protect AWS credentials for shared backend
· Can't isolate users · Can still apply least-privilege principle
· Can be a bit confusing
· AWS Identity and Access Management (IAM) · Tons of nomenclature · Tons of different web pages with chunks of info
02.11.15 | BlackHat Europe 2015 | 36

Amazon Cognito (4)
Note: If you created your identity pool before February 2015, you will need to reassociate your roles with your identity pool in order to use this constructor without the roles as parameters. To do so, open the Amazon Cognito Console, select your identity pool, click Edit Identity Pool, specify your authenticated and unauthenticated roles, and save the changes.
02.11.15 | BlackHat Europe 2015 | 37

Amazon Cognito (5)
AWS Credentials
02.11.15 | BlackHat Europe 2015 | 38

Amazon Cognito (6)
(1) User credentials or nothing

(2) Temporary AWS credentials

Amazon Cognito

(3) Temporary AWS credentials S3

02.11.15 | BlackHat Europe 2015 | 39

Amazon Cognito (7)
· Overkill for simple apps, but neat
· It's not popular in the real world
· Putting root credentials is easier · Tutorials (StackOverflow etc.) use root credentials · Cognito hasn't been around that long
· Let`s turn back the clock
· Out of the dusty shades of history, there comes...
02.11.15 | BlackHat Europe 2015 | 40

Amazon Token Vending Machine (1)

Sample available, final implementation is on you
02.11.15 | BlackHat Europe 2015 | 41

Needs hosting. Tomcat, Elasticbeanstalk anyone?

Amazon Token Vending Machine (2)
Although you will need to use your AWS account credentials to deploy the TVM, we recommend that you do not run the TVM under your AWS account. Instead, create an IAM user and configure the TVM to use the credentials of this IAM user, which we will call the TVM user.
So, we have S3, TVM, IAM, Elastic Beanstalk
02.11.15 | BlackHat Europe 2015 | 42

Amazon Token Vending Machine (3)
· What if I want ACLs? · Identity TVM samples do exist, but... You would need to modify the provided samples in order to
implement these user-specific policy objects. For more information about policy objects, see the Identity and Access Management (IAM) documentation
02.11.15 | BlackHat Europe 2015 | 43

Amazon Middleware (1)

Cloud

02.11.15 | BlackHat Europe 2015 | 44

Amazon Middleware (2)

02.11.15 | BlackHat Europe 2015 | 45

Save Contact

DB Insert

Elastic Beanstalk

S3, Dynamo, etc.

Parse.com ACLs (1)

02.11.15 | BlackHat Europe 2015 | 46

Source: http://blog.parse.com/learn/engineering/parsesecurity-ii-class-hysteria/

Parse.com ACLs (2)

?

0x1238409

Cloud

02.11.15 | BlackHat Europe 2015 | 47

http://blog.parse.com/announcements/protect-userdata-with-new-parse-features/

Parse.com ACLs (3)
Anonymous users are special, however, in that once logged out, the user cannot be recovered ­ a new user will need to be created, and the original user (and its associated data) will be orphaned.
Double-chspeackcey!our disk
02.11.15 | BlackHat Europe 2015 | 48

Parse.com Global Settings

02.11.15 | BlackHat Europe 2015 | 49

Get free

this disk

wsproancge

atondanoyffoenre!

Source: http://blog.parse.com/learn/engineering/parsesecurity-ii-class-hysteria/

Parse Middleware

Save Contact

DB Insert

CloudCode

Parse DB

02.11.15 | BlackHat Europe 2015 | 50

What now?
THE WISHLIST
02.11.15 | BlackHat Europe 2015 | 51

What shall change?

Improved Documentation

Checks and Alerts

Legal Framework

02.11.15 | BlackHat Europe 2015 | 52

Takeaway Messages
· Security in the cloud doesn`t come for free · Attacks are free, effortless, and simple · Mitigation techniques exist
Ø People must care about them Ø Secure your apps now ­ we're there!
02.11.15 | BlackHat Europe 2015 | 53

02.11.15 | BlackHat Europe 2015 | 54

Siegfried Rasthofer Secure Software Engineering Group Email: siegfried.rasthofer@cased.de Twitter: @CodeInspect

Steven Arzt Secure Software Engineering Group Email: steven.arzt@cased.de

Blog: http://sse-blog.ec-spride.de Website: http://sse.ec-spride.de

02.11.15 | BlackHat Europe 2015 | 55

