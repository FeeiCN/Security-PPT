Discovering Hidden Properties to Attack Node.js Ecosystem
Feng Xiao, Jianwei Huang, Yichang Xiong, Guangliang Yang, Hong Hu, Guofei Gu, Wenke Lee
#BHUSA @BLACKHATEVENTS

Feng Xiao

@f3ixiao

· CS PhD student at Georgia Tech. · Vulnerability researcher. Develop tools to detect and exploit 0days. · Focus on web/application security, but also enjoy network security+ and virtualization security.

+Hacking the Brain: Customize Evil Protocol to Pwn an SDN Controller. DEF CON 2018

#BHUSA @BLACKHATEVENTS

Agenda
· Hi, you've found some new Node.js vulnerabilities! what are they? · Sounds interesting, you've built bug finding tools? how does it work? · Cool. More details on the real-world impact?
#BHUSA @BLACKHATEVENTS

$ cat vuls.txt

#BHUSA @BLACKHATEVENTS

Background

$ man node
· A JavaScript runtime built on Chrome's v8 engine.

AApApppppCssode

Core Modules

Node.js

libuv ...

Operating System

#BHUSA @BLACKHATEVENTS

$ man node
· A JavaScript runtime built on Chrome's v8 engine. · Widely-used for deploying server-side programs and desktop apps.
#BHUSA @BLACKHATEVENTS

$ man node

· A JavaScript runtime built on Chrome's v8 engine.

· Widely-used for deploying server-side programs and desktop apps.

· Object sharing is a very popular communication method for Node.js

web apps.

Request parsing modules that convert input into objects.

#BHUSA @BLACKHATEVENTS

Object Sharing

Client-side JS

GET /update?age=23
Querystring-based Serialization
{func: update, age: 23}
JSON-based Serialization

Node.js web
#BHUSA @BLACKHATEVENTS

What if we inject additional properties that are unexpected to the program?

Hidden Property Abusing

HPA leverages the widely-used data exchanging feature in Node.js (object sharing) to tamper or forge critical program states of Node.js applications.

plain object +
Normal User

plain object+
Remote Attacker

Data Exchanging

plain object +
Normal User
+The simplest object representation that only supports primitive types (e.g., integer, string)

Web application

Micro services

#BHUSA @BLACKHATEVENTS

Attack Vectors

App-specific Attribute Manipulation

user_obj

name

Rick

update(input) age

60

access visitor

init_role()

#BHUSA @BLACKHATEVENTS

Attack Vectors

App-specific Attribute Manipulation

user_obj

update(input)
{access: admin}

name age access

Rick 60 admin

init_role()

Hidden property "access" propagates from input to user_obj

#BHUSA @BLACKHATEVENTS

Attack Vectors

App-specific Attribute Manipulation

user_obj

update(input)
{access: admin}

name age access

Rick 60 admin

init_role()

Hidden property "access" propagates from input to user_obj

Prototype Inheritance Hijacking

input_obj

age

60

__proto__

...

...

Object.prototype

constructor

__proto__

...

#BHUSA @BLACKHATEVENTS

Attack Vectors

App-specific Attribute Manipulation

user_obj

update(input)
{access: admin}

name age access

Rick 60 admin

init_role()

Hidden property "access" propagates from input to user_obj

Prototype Inheritance Hijacking

{construtor: rick&morty}

input_obj

age

60

__proto__

constructor rick&morty

Object.prototype

constructor

__proto__

...

#BHUSA @BLACKHATEVENTS

Root Cause Analysis
The root cause of the HPA is that Node.js fails to isolate unsafe object (i.e., input) from critical internal states.

CWE-915*

Mass Assignment Object Injection

(Ruby)

(PHP)

HPA (Node.js)

*CWE-915: Improperly Controlled Modification of Dynamically-Determined Object Attributes

#BHUSA @BLACKHATEVENTS

Root Cause Analysis

The root cause of the HPA is that Node.js fails to isolate unsafe object (i.e., input) from critical internal states.

$ diff mass-assignment HPA

Abused logics
Payload Type
Capabilities

Mass Assignment assignment Literal value Overwrite

HPA object sharing
Literal value/nested object
Overwrite/Create

CWE-915*

Mass Assignment Object Injection

(Ruby)

(PHP)

HPA (Node.js)

*CWE-915: Improperly Controlled Modification of Dynamically-Determined Object Attributes

#BHUSA @BLACKHATEVENTS

A real-world HPA exploit
· Routing Controller
 A popular web framework (63,000+ monthly downloads on npm)
· An end-to-end prototype inheritance hijacking exploit
 Attack the official example code  From security check bypassing to SQL Injection

{email: ... , passwd: }

Remote User

Param Handler
1 2

Authentication
4

Input Validation 3

Database

Routing-controller

#BHUSA @BLACKHATEVENTS

A real-world HPA exploit

login(req)

param

email

SQLI

passwd

...

constructor

1

__proto__

Object.prototype

#BHUSA @BLACKHATEVENTS

A real-world HPA exploit

login(req)

param

email

SQLI

passwd

...

constructor

1

__proto__

Object.prototype

param

email

SQLI

passwd

...

constructor

1

__proto__

schema

metaData

...

__proto__

Object.assign(schema, param) Object.prototype

LoginArg.prototype

constructor
__proto__

format
...

#BHUSA @BLACKHATEVENTS

A real-world HPA exploit

login(req)

param

email

SQLI

passwd

...

constructor

1

__proto__

Object.prototype

param

email

SQLI

passwd

...

constructor

1

__proto__

schema

metaData

...

__proto__

Object.assign(schema, param) Object.prototype

LoginArg.prototype

constructor
__proto__

format
...

format

format

1

getSchema(schema.constructor)

schema

metaData email passwd
constructor

... SQLI
...
1

#BHUSA @BLACKHATEVENTS

A real-world HPA exploit

login(req)

param

email

SQLI

passwd

...

constructor

1

__proto__

Object.prototype

param

email

SQLI

passwd

...

constructor

1

__proto__

schema

metaData

...

__proto__

Object.assign(schema, param) Object.prototype

LoginArg.prototype

constructor
__proto__

format
...

query(email)

"validated" param

email

SQLI

passwd

...

__proto__

...

constructor

1

format

format

1

getSchema(schema.constructor)

schema

metaData email passwd
constructor

... SQLI
...
1

#BHUSA @BLACKHATEVENTS

Challenges
· It is JavaScript.
· HPA creates new data dependencies, but program analysis is good at digging existing data flows.
· The exploitation of hidden properties is highly related to the context. How to assess the harmfulness of discovered hidden property candidates?

#BHUSA @BLACKHATEVENTS

Lynx

We design and implement Lynx*, a hybrid JavaScript program analysis tool, to detect and exploit HPA vulnerabilities.

Identifying Hidden Properties

Generating HPA Exploits

Discovering Property Carriers
Pinpointing Hidden Property Candidates
Candidate Pruning

Hidden Property Candidates

Generating Exploit Templates
Exploring Attack Consequences

Exploits

*The lynx is a type of wildcat. In Greek myths, it is believed that lynxes can see what others can't, and its role is revealing hidden truths. https://github.com/xiaofen9/Lynx

#BHUSA @BLACKHATEVENTS

Identifying Hidden Properties
Propagate fake "hidden properties" to identify Property Carriers

Input Object

1

email a@gmail 2

passwd

123

u_key

u_val

...

...

3

Jalangi

1. Variable Access 2. Property Indexing 3. Function Call

Label Injection

Test Program Instrumentation

Property Carrier Tracking
#BHUSA @BLACKHATEVENTS

Is it possible to overwrite the original properties under a property carrier?

Identifying Hidden Properties

Pinpoint Hidden Property Candidates

var targetMetadatas = getSchema(object.constructor);

 Traversing Abstract Syntax Tree (AST)
 Recording the (key name of) properties under Property Carriers

targetMetadatas

Call expression

getSchema

Argument list

Property carrier

Member expression

object

constructor

Hidden property candidate

#BHUSA @BLACKHATEVENTS

$ node Lynx.js -m hp_finder -o classvalidator.json -t target/TestClassValidator/TestClassValidator.js
[+] Running ./target/TestClassValidator [+] instrumentSync: ./target/TestClassValidator [+] Module cache of project TestClassValidator found [+] 2 Files to be instrumented. [+] Instrumentation completed. [!] Analysis Result : # of carrier: 43
Hidden properties: { R0ot:
{ constructor: { base: 'object', file: ./target/TestClassValidator/node_modules/class-validator/validation/ValidationExecutor.js', domain: 'anon_79_0_398_1.anon_368_55_390_3.object }, ... // other hidden properties under root
}, ... // other properties and hidden properties under them }
Coverage: total lines: 10491, touched lines: 3423, coverage: 0.32627966828710325

#BHUSA @BLACKHATEVENTS

How do we know the exploitability of these candidates?

Insights from our running example

1 function transform(schema, param){

2

value = Object.assign(

3

schema,

4

param);

5

return value;

Data flow of property carrier

6}

7

Data flow of Hidden property

8 function validate(object) {

9

...

10

var targetMetadatas = getSchema(

11

object.constructor);

12

13

const groupedMetadatas = this.metadataStorage

14

.groupByPropertyName(targetMetadatas);

15

...

16

// validation based on metadatas

17

Object.keys(groupedMetadatas)

18

.forEach(function(propertyName) {

19

if(illegal) return null;

20

});

21

return object;

22 }

two possible paths

· Hidden properties are internal program states. The security consequence of abusing them relates to the code context.
 Conclude sensitive behaviors
#BHUSA @BLACKHATEVENTS

Insights from our running example

1 function transform(schema, param){

2

value = Object.assign(

3

schema,

4

param);

5

return value;

Data flow of property carrier

6}

7

Data flow of Hidden property

8 function validate(object) {

9

...

10

var targetMetadatas = getSchema(

11

object.constructor);

12

13

const groupedMetadatas = this.metadataStorage

14

.groupByPropertyName(targetMetadatas);

15

...

16

// validation based on metadatas

17

Object.keys(groupedMetadatas)

18

.forEach(function(propertyName) {

19

if(illegal) return null;

20

});

21

return object;

22 }

two possible paths

· Hidden properties are internal program states. The security consequence of abusing them relates to the code context.
 Conclude sensitive behaviors
· The overwrite point (line 11) and the exploitation point (line 21) may NOT locate at the same places.
 Explore branches that can be triggered
#BHUSA @BLACKHATEVENTS

Sensitive sinks monitored by Lynx
#BHUSA @BLACKHATEVENTS

Exploring security consequences

Input Object

email a@gmail

passwd

123

...

...

__proto__ symbolic

Generating Exploit Templates

isObject

input

isString

Sink I2 hit!

legal name

name

illegal name

return obj

return null

Dynamic Symbolic Execution

#BHUSA @BLACKHATEVENTS

$ node Lynx.js -m explorer -p classvalidator.json -t target/TestClassValidator/TestClassValidator.js
[ `./target/TestClassValidator/TestClassValidator.js', '{"_bound":0}' ] [|] [1 done /0 queued / 0 running / 0 errors / 31% coverage ] *** [+] {"_bound":0,"constructor_function Object() { [native code] }1":1} took 23.242s [!] Stats [+] Symbolic Values: 1 [+] Symbolic Primitives: 1 [!] Done [+] Total Lines Of Code 15998 [+] Total Coverage: 0.4541963795940757 [+] ExpoSE Finished. 1 paths, 0 errors [!] Analysis Result : Baseline:
Return result: validation rejected. Path 1: { constructor: 1 }
Sink I2 detected. Return result: validation passed.
#BHUSA @BLACKHATEVENTS

Evaluation
60 popular Node.js programs
 55 modules from categories of database, input validation, and user functionalities
 5 web apps
13 zero-day vulnerabilities
 318 hidden property candidates from 1301 property carriers (68% tested programs contain hidden properties)
 10 exploits successfully synthesized by Lynx

#BHUSA @BLACKHATEVENTS

Impact Analysis
Confidentiality
 Leaking Credential Data (3)  Universal SQL Injection (1)
Integrity
 Input Validation Bypass (4)  Forging critical data structure (3)
Availability
 Event Handler Blocking (1)

CVE-2020-6639 - mongo-express denial of service CVE-2019-10805 - valib inspection bypass CVE-2019-10790 - taffyDB universal SQL Injection CVE-2019-20149 - kind-of type checking manipulation CVE-2019-10781 - schema-inspector validation bypass CVE-2019-19729 - bson-objectid ID forging CVE-2019-19507 - jpv validation violation CVE-2019-2391 - mongodb query condition abuse CVE-2019-18608 - cezerin unauthorized order modification CVE-2019-18413 - class-validator bypass CVE-2019-17426 - mongoose query condition abuse
#BHUSA @BLACKHATEVENTS

Impact Analysis

Confidentiality

CVE-2020-6639 - mongo-express denial of service

CVE-2019-10805 - valib inspection bypass

 Leaking Credential Data (3)

CVE-2019-10790 - taffyDB universal SQL Injection

 Universal SQLHInPjeActeiofnfe(1c)tively enlarges Node.js attackCsVuE-r2f0a1c9e-20b1y49c-okmindp-orfotmypeiscihnegcking manipulation

Integrity

previously unreachable program states.
CVE-2019-10781 - schema-inspector validation bypass

CVE-2019-19729 - bson-objectid ID forging

 Input Validation Bypass (4)

CVE-2019-19507 - jpv validation violation

 Forging criticCalldaastsaisctrducetfueren(s3e) s cannot mitigate HPA. SCoVmE-2e01w9-i2d3e9l1y--umsoendgovdablqidueartyioconndition abuse

modules are vulnerable to HPA.

CVE-2019-18608 - cezerin unauthorized order modification

Availability

CVE-2019-18413 - class-validator bypass

 Event Handler Blocking (1)

CVE-2019-17426 - mongoose query condition abuse

#BHUSA @BLACKHATEVENTS

All the vulnerabilities have been reported to vendors.

Case Study #1
MongoDB Query Condition Abuse (CVE-2019-2391)
MongoDB bson serializer will not serialize objects with unknown _bsontype property. What if inject {"_bsontype":"bl4ckhat"} to a query condition object?
#BHUSA @BLACKHATEVENTS

Case Study #1

MongoDB Query Condition Abuse (CVE-2019-2391)

MongoDB bson serializer will not serialize objects with unknown _bsontype property.

What if inject {"_bsontype":"bl4ckhat"} to a query condition object?

An online game that used vulnerable MongoDB APIs

By forcing MongoDB not serializing the query condition, attackers can log in/delete arbitrary accounts.

#BHUSA @BLACKHATEVENTS

Case Study #2
taffyDB Universal SQL Injection (CVE-2019-10790)

Hidden properties
#BHUSA @BLACKHATEVENTS

Case Study #3
Mongo-express Denial of Service (CVE-2020-6639)

Single Threaded Event Loop Model

#BHUSA @BLACKHATEVENTS

Case Study #3
Mongo-express Denial of Service (CVE-2020-6639)

The web server is not responding

Hidden property

#BHUSA @BLACKHATEVENTS

@f3ixiao https://fxiao.me

Thanks!

