Do you speak my language?
Make Static Analysis Engines Understand Each Other
Ibrahim Mohamed Security Engineer

class ViewPage extends FacebookEndpoint { function getResponse() {
$x = $_REQUEST[`page_name']; $qry = "select * from pages where
name = `" . $x . "`"; return mysql_query($qry); } }
3

class ViewPage extends FacebookEndpoint { function getResponse() {
$x = wrapGetPageName(); $clause = `name = ` . $x; return wrapFetchData($clause); } }

SQL injection!

4

SQL injection!

class ViewPage extends FacebookEndpoint { function getResponse() { $x = wrapGetPageName(); $clause = `name = ` . $x; ... $client = new PageServiceClient(...); $client->fetchData($clause); }
}

class PageServiceHandler: def __init__(self): self.db = MySQLdb.connect(...)
def fetchData(self, clause): cursor = db.cursor() query = "select * from pages" + clause return cursor.execute(query).fetchone()
if __name__ == '__main__': server = TSimpleServer(PageServiceHandler) print('Starting the server...') server.serve()
5

Ibrahim Mohamed
>= 2016 - now: Security engineer @ Facebook < 2016: Security consultant
6

Agenda

Motivation Single-repo analysis Cross-repo analysis Example flows Looking forward
7

SQL injection!

class ViewPage extends FacebookEndpoint { function getResponse() { $x = wrapGetPageName(); $clause = `name = ` . $x; ... $client = new PageServiceClient(...); $client->fetchData($clause); }
}

class PageServiceHandler: def __init__(self): self.db = MySQLdb.connect(...)
def fetchData(self, clause): cursor = db.cursor() query = "select * from pages" + clause return cursor.execute(query).fetchone()
if __name__ == '__main__': server = TSimpleServer(PageServiceHandler) print('Starting the server...') server.serve()
8

Motivation: Service-oriented architecture

Edge Proxy

Application logic

Database

9

Motivation: Service-oriented architecture

Edge Proxy

Application logic

Auth Service
Pages Service
Messaging Service
10

Motivation: Service-oriented architecture
https://www.infoq.com/presentations/twitter-scalability-culture/
TWITTER, TWEET, RETWEET and the Twitter Bird logo are trademarks of Twitter Inc. or its affiliates.

11

Motivation: Service-oriented architecture
https://www.infoq.com/presentations/twitter-scalability-culture/
TWITTER, TWEET, RETWEET and the Twitter Bird logo are trademarks of Twitter Inc. or its affiliates.

12

Motivation: Service-oriented architecture
https://www.infoq.com/presentations/netflix-chaos-microservices/
13

Motivation: Service-oriented architecture
14
https://www.infoq.com/presentations/netflix-chaos-microservices/

Motivation: Service-oriented architecture

Edge Proxy

source
Application logic (PHP)

Auth Service
Pages
Service SQL injection!
(Python)
Messaging Service
15

Scaling Product security @ FB

Static analysis

Security Engineers

Scaling Product security @ FB

User facing applications

Edge Proxy

Backend services Service A
Service B
Service C
...
Service N

Static Analysis @ Facebook
18

Taint-flow analysis
class ViewPage extends FacebookEndpoint { function getResponse() {
$x = wrapGetPageName(); $clause = `name = ` . $x; return wrapFetchData($clause); } }
19

Taint-flow analysis

function wrapGetPageName(): string { return getPageName();

1

}

class ViewPage extends FacebookEndpoint { function getResponse(): void { $x = wrapGetPageName(); $clause = `name = ` . $x; wrapFetchData($clause); }
}

20

Taint-flow analysis

function getPageName(): string {

2

return request()[`page_name'];

}

function wrapGetPageName(): string { return getPageName();

1

}

class ViewPage extends FacebookEndpoint { function getResponse(): void { $x = wrapGetPageName(); $clause = `name = ` . $x; wrapFetchData($clause); }
}

21

Taint-flow analysis

request(): { return $_REQUEST;

3

}

function getPageName(): string {

2

return request()[`page_name'];

}

function wrapGetPageName(): string { return getPageName();

1

}

class ViewPage extends FacebookEndpoint { function getResponse(): void { $x = wrapGetPageName(); $clause = `name = ` . $x; wrapFetchData($clause); }
}

22

Taint-flow analysis

function wrapFetchData( string $clause,
): { return fetchData($clause);
}

class ViewPage extends FacebookEndpoint {

function getResponse(): void {

$x = wrapGetPageName();

$clause = `name = ` . $x;

wrapFetchData($clause);

}

1

}

23

Taint-flow analysis

function fetchData( string $clause,
): { return mysql_query( `select ...' . $clause );
}
function wrapFetchData( string $clause,
): { return fetchData($clause);
}

class ViewPage extends FacebookEndpoint {

2

function getResponse(): void {

$x = wrapGetPageName();

$clause = `name = ` . $x;

wrapFetchData($clause);

}

1

}

24

Taint-flow analysis

class ViewPage extends FacebookEndpoint { function getResponse(): void { $x = wrapGetPageName(); $clause = `name = ` . $x; wrapFetchData($clause); }
}

SQL injection!

25

Taint-flow analysis

function request() { return $_REQUEST;

3

} request():UserControlled source

class ViewPage extends FacebookEndpoint { function getResponse(): void {

sources: functions/methods that return tainted tool should track across the call graph.

data

which

t$hxe

s=tawticraanpalGysiestPageName();

$clause = `name = ` . $x;
sources usually map to places where untrusted input is returned
wrapFetchData($clause);

}

}

26

Taint-flow analysis

function request() { return $_REQUEST;

3

}

request():UserControlled source

function getPageName(): string {

2

return request()[`page_name'];

}

getPageName():UserControlled source

class ViewPage extends FacebookEndpoint { function getResponse(): void { $x = wrapGetPageName(); $clause = `name = ` . $x; wrapFetchData($clause); }
}

27

Taint-flow analysis

function request() { return $_REQUEST;

3

}

request():UserControlled source

function getPageName(): string {

2

return request()[`page_name'];

}

getPageName():UserControlled source

function wrapGetPageName(): string {

1

return getPageName();

}

wrapGetPageName():UserControlled source

class ViewPage extends FacebookEndpoint { function getResponse(): void { $x = wrapGetPageName(); $clause = `name = ` . $x; wrapFetchData($clause); }
}

28

Taint-flow analysis

function fetchData( string $clause,

2

) {

class ViewPage extends FacebookEndpoint {

return mysql_query( `select ...' . $clause,

function getResponse(): void {

);

sinks: functions/methods that issues and see the full flow

if

tainted

data

flows

into,

we$wxan=t

two crraepatGe etPageName();

}

$clause = `name = ` . $x;

fetchData($clause:SQLi sink)

wrapFetchData($clause);

}

}

29

Taint-flow analysis

function fetchData( string $clause,

2

) {

return mysql_query(

`select ...' . $clause,

);

}

fetchData($clause:SQLi sink)

function wrapFetchData( string $clause,

1

) {

return fetchData($clause);

}

wrapFetchData($clause:SQLi sink)

class ViewPage extends FacebookEndpoint { function getResponse(): void { $x = wrapGetPageName(); $clause = `name = ` . $x; wrapFetchData($clause); }
}

30

Taint-flow analysis
rule: { sources: [UserControlled], sinks: [SQLi], message: "SQL injection"
}

class ViewPage extends FacebookEndpoint { function getResponse(): void { $x = wrapGetPageName(); $clause = `name = ` . $x; wrapFetchData($clause); }
}
31

Trace in our Example
ViewPage::getResponse

wrapGetPageName:result getPageName:result

wrapFetchData:$clause fetchData:$clause

request:result source

mysql_query:$s sink 32

Facebook Taint-flow analysis engines

Zoncolan
Taint-flow analysis for Hack

Pysa
Taint-flow analysis for Python https://pyre-check.org/docs/pysa-b asics/

Mariana Trench (MT)
Taint-flow analysis for Java and Android code https://github.com/facebook/maria na-trench
33

Codebase
PHP Python Java
sources sinks rules
Security Engineers

Zonk

Pysa

MT

post process for DB

db

db

db

ui

34

Taint-flow analysis @ FB

50%
Security bugs detected by Automation

35

Cross-repo taint-flow analysis
36

SQL injection!

class ViewPage extends FacebookEndpoint { function getResponse() { $x = wrapGetPageName(); $clause = `name = ` . $x; ... $client = new PageServiceClient(...); $client->fetchData($clause); }
}

class PageServiceHandler: def __init__(self): self.db = MySQLdb.connect(...)
def fetchData(self, clause): cursor = db.cursor() query = "select * from pages" + clause return cursor.execute(query).fetchone()
if __name__ == '__main__': server = TSimpleServer(PageServiceHandler) print('Starting the server...') server.serve()
37

class ViewPage extends FacebookEndpoint { function getResponse() { $x = wrapGetPageName(); $clause = `name = ` . $x;
$Tshorcifkt:elitgh=twneeiwghTt, HlatntpguCalgieen-itn(dependent software stack for point-to-point Rs'ienPrtCiaelriimzna.pptiloeanmg,eeansnt'd,at4aio4pn3p.l,iTc'h/atrthiifortnipftrl.eopvvheidple'praobcsetsrascintigo.ns for data transport, data ); $strrca:nhsttpposr:/t/g=ithnuebw.coTmB/uafpfaecrehed/Tthrraifnt sport($socket, 1024, 1024); $protocol = new TBinaryProtocol($transport); $client = new PageServiceAsyncClient($protocol);
$client->fetchData($clause); } }

RETURN data from $_REQUEST
Call to a thrift service
38

Python server implementation
Import MySQLdb class PageServiceHandler:
def __init__(self): self.log = {} self.db = MySQLdb.connect("host","user","pwd","db")
def fetchData(self, clause): cursor = db.cursor() query = "select * from pages where" + clause return cursor.execute(query).fetchone()
if __name__ == '__main__': handler = PageServiceHandler() processor = PageService.Processor(handler) server = TSimpleServer(processor) print('Starting the server...') server.serve()
39

Python server implementation
... def fetchData(self, clause):
cursor = db.cursor() query = "select * from pages where" + clause return cursor.execute(query).fetchone() ...

THRIFT arguments Argument flows into SQLi sink
40

SQL injection!

class ViewPage extends FacebookEndpoint { function getResponse() { $x = wrapGetPageName(); $clause = `name = ` . $x; ... $client = new PageServiceClient(...); $client->fetchData($clause); }
}

class PageServiceHandler: def __init__(self): self.db = MySQLdb.connect(...)
def fetchData(self, clause): cursor = db.cursor() query = "select * from pages" + clause return cursor.execute(query).fetchone()
if __name__ == '__main__': server = TSimpleServer(PageServiceHandler) print('Starting the server...') server.serve()
41

How to find this with static analysis?
- If we have PHP static analysis tool - Zoncolan! - Review the code - Identify calls to thrift services
- If we have Python static analysis tool - Pysa! - Review the code - Identify thrift server implementation
- Automagically make both share the information to find the SQLi
42

PHP client implementation
class ViewPage extends FacebookEndpoint { function getResponse() { $x = wrapGetPageName(); $clause = `name = ` . $x; ... $client = new PageServiceClient(...); $client->fetchData($clause); }
}

1. Analyze code normally 2. Identify flows to thrift RPC calls 3. resolve canonical connection point and store partial flow
43

Python server implementation
class PageServiceHandler: ... ... def fetchData(self, clause): cursor = db.cursor() query = "select * from pages where" + clause return cursor.execute(query).fetchone() ...

4. Identity thrift service implementations 5. Look up canonical point information PageService:FetchData
6. Engine augments initial models with producers information
44

Cross-repo Taint flows - storing partial flows
... def fetchData(self, clause):
cursor = db.cursor() query = "select * from pages where" +
clause; return cursor.execute(query) ...

3. We see thrift handler, look up db and augment initial models 4. Cross-language SQL injection!
45

Producer run - storing partial flows
1 2

function getResponse() { $x = wrapGetPageName(); $clause = `name = ` . $x; ... ... $client->fetchData($clause);
}
46

Cross-repo Taint flows - Loading partial flows
2 1

... def fetchData(self, clause):
cursor = db.cursor() query = "select * from pages where" + clause return cursor.execute(query) ...
47

Cross-repo Taint flows - Full analysis view

2

3

1
48

Trace in our Example

PageService::fetchData

PageServiceAsyncClient:fetchData

PageServiceHandler:fetchData

wrapGetPageName getPageName

MySQLdb.Cursor.execute

request

Name mangling and demangling
49

Cross-Repo Taint Analysis

 Mark all RPC calls as sinks
 Defines canonical connection points (e.g. Fbthrift, Thrift, gRPC)
 Allow engines to store partial flows (e.g. UserControlled to Thrift) - Producers
 Allow engines to load partial flows augmenting initial models (e.g. UserControlled via Thrift) - Consumers
 Define format to visualize cross-repo traces
50

Codebase
PHP Python Java
sources sinks rules
Security Engineers

Zonk

Pysa

MT

post process for DB

db

db

db

ui

51

Codebase
PHP Python Java
sources sinks rules
Security Engineers

Zonk

Pysa

MT

Augmenting initial models

post process for DB

Cross repo model generation

db

db

db

crtex

Extracting partial models

cross repo model extraction

ui

52

Producer Run
PHP
sources sinks rules
Security Engineers

Zonk
post process for DB
db

crtex

Extracting partial models

cross repo model extraction

ui

53

Consumer run
Python
sources sinks rules
Security Engineers

Pysa
post process for DB
db

Augmenting initial models

Cross repo model generation
crtex

ui

54

Cross-Repo Taint-Exchange (CRTEX)
A tool-independent store of taint information (in a tool agnostic format). The store provides a push/pull model which static analysis tools can use to extend their capabilities and analyze flows cross-language
55

Viewing traces
56

Viewing single repo traces

1
Start from the root

ViewPage::getResponse

2
Expand traces to source leaf

wrapGetPageName:result

wrapFetchData:$clause

2
Expand traces to sink leaf

getPageName:result

fetchData:$clause

request:result

mysql_query:$s 57

Viewing the cross-repo traces

PageService::fetchData

PageServiceAsyncClient:fetchData

PageServiceHandler:fetchData

wrapGetPageName getPageName

MySQLdb.Cursor.execute

request 58

Viewing the cross-repo traces

PageService::fetchData

PageServiceAsyncClient:fetchData

PageServiceHandler:fetchData

wrapGetPageName

MySQLdb.Cursor.execute

getPageName

Differences

 Source -> sink(ThriftCall) -> source(ThriftImpl) -> sink

request

 Source and sink traces can live in different DBs as they

belong to different engines 59

Cross-repo Taint flows

Viewing the cross-language traces

 Expand the source/sink traces normally
 Once you hit the source leaf  query CRTEX with canonical points for information about producer runs
 That can be a list of traces

PageService::fetchData (source leaf) PageServiceHandler:fetchData MySQLdb.Cursor.execute

60

Cross-repo Taint flows

Viewing the cross-language traces

 Switch to the right tool's db, and run based on CRTEX
 Start with the thrift sink leaf  Traverse backward

PageServiceAsyncClient:fetchData (sink leaf) wrapGetPageName
getPageName

request
61

Deployment at facebook
62

Deployment at Facebook - attack surface coverage
Producers
 facebook.com (WWW)  Zoncolan
 instagram.com  Pysa
 Android mobile apps  Mariana Trench

Consumers
 Backend fbthrift services  PHP (Zoncolan)  Python (Pysa)  Java (Mariana Trench)
63

Deployment at Facebook - analysis schedule
Master
 Periodically - multiple times a day  File tasks for new findings

Pull requests
 Analyze the codebase with/without the pull request
 Check for findings  new?
 High confidence -> auto-comment  Lower confidence -> security oncall
64

Example finding
65

Example - Remote command execution

Edge Proxy

workplace.com

VCRoom service

66

Example - Remote Command Execution

Canonical name

Producer run id

67

Example - Remote command execution
1
68

Example - Remote command execution
2
69

Example - Remote command execution
3
70

Example - Remote command execution
4
71

Example - Remote command execution
5
72

Example - Remote Command Execution
73

RCE in 2021 (ò_ó)
74

Challenges and improvements areas
 False positives due to sanitization/validation in one language  Simplify the creation of connection points  Simplifying complex and long traces for security and software engineers  Fix ownership
75

Looking forward

 Research standardise the taint-flow summaries - let's all speak the same language!  Expand mobile attack surface
 Exported components  Requests from Backend
 Backend storages

1
/save-img/<name>

Application

DB

store

view-img/id=123
2

retrieve

76

Looking forward
 Privacy-relevant flows  Better understanding for clients (mobile applications)  Marking sensors e.g. GPS, fingerprint, camera as sources  Find flows that go to the backend?

Mobile app

Backend

77

TAKEAWAYS

Application security teams
 Scale through static analysis  Pysa for Python applications github.com/facebook/pyre-check  Mariana-Trench for Android/Java github.com/facebook/mariana-trench
 Go deeper with Cross-repo analysis

Security consultants
 Optimize your security reviews with our open source configurations  Pysa  Mariana trench
 Found more ways to get SQLi/RCE?  Contribute to our configurations!
 Want to see everything in action? Come join us! (fb.com/careers)

Static analysis researchers
 Research on tool-agnostic taint summaries  Our tools are open source!
 github.com/facebook/mariana-trench  github.com/facebook/pyre-check  github.com/facebook/sapp

Thank you

Dominik Gabi

Manuel Fahndrich

Otto Ebeling

David Molnar

Graham Bleaney

Jim O'Leary

Dan Gurfinkel

Chris Rohlf

Sinan Cepel
79

Questions?
THANK YOU FOR YOUR TIME
80

