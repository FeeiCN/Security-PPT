Abdul-Aziz Hariri
Vulnerability Analysis Team Manager
Manage case load, distribution, pricing etc. Root Cause analysis / Vulnerability Research / Exploit development Pwn2Own Preparation / Judging entries
Past Experiences
Bits Arabia, Insight-Tech and Morgan Stanley
Past research:
Pwn4Fun 2014 renderer exploit writer Microsoft Bounty submission Patents on Exploit Mitigation Technologies Adobe Reader research 200+ CVEs
BS in Computer Sciences ­ University of Balamand
Twitter: @abdhariri

Edgar Pek
Security Researcher
Triaging incoming vulnerabilities
Helping product teams reproduce and fix the vulns
Security automation
Past experiences
Academic research, Microsoft Research, Samsung Research
Past research
THOTCON 0xA ­ Linux Kernel Exploitation Workshop Exhaustive security testing ­ model checking Modular program verification Satisfiability Modulo Theories
PhD, Computer Science ­ University of Illinois at Urbana-Champaign Twitter: @EdgarPek

Overview

Adobe Acrobat/Reader Initial release was back in 1993 One of the most widely used PDF readers Supports on Windows/Mac/iOS/Android Large part of the code base is old Fully featured rich attack surface
Juicy target for vulnerability researchers

General Architecture
Core

Plug-ins

Escript

Catalog

Search

weblink

ImageConversion

...

Acrobat/Acrord32

HTML2PDF

XPS2PDF

Compare

Preflight

...

...

...

Annots SendMail

AcroForm ReadOutLoud

Backend
AXSLE ACE

CoolType PE

JP2KLib WebkitAG

AGM Onix32

ZDI submissions
250

200

150

100

50

0 2015

2016

2017

2018

The JavaScript Attack Surface

JavaScript API
Core

Plug-ins

Escript Search

Catalog weblink

ImageConversion

...

Acrobat/Acrord32

HTML2PDF

XPS2PDF

Compare

Preflight

...

...

...

Annots SendMail

AcroForm ReadOutLoud

Backend
AXSLE ACE

CoolType PE

JP2KLib WebkitAG

AGM Onix32

Understanding the Attack Surface
· Privileged vs Non-Privileged contexts are defined in the JS API documentation:
· A lot of API's are privileged and cannot be executed from non-privileged contexts:

Adobe Acrobat JavaScript
· Adobe Acrobat/Reader exposes a rich JS API
· JavaScript engine is a spin of SpiderMonkey
· Escript.api is responsible for all JavaScript things
· JavaScript API documentation is available on the Adobe website
· A lot can be done through the JavaScript API (Forms, Annotations, Collaboration etc..)

· Mitigations exist for the JavaScript APIs
· Some API's defined in the documentation are only available in Acrobat Pro/Acrobat standard
· Basically JavaScript API's are executed in two contexts: · Privileged Context · Non-Privileged Context

Understanding the Attack Surface
· Privileged API's warning example from a non-privileged context:

Trusted Functions
· Executing privileged methods in a non-privileged context

Understanding the attack surface ­ Folder-level Scripts
· Scripts stored in the JavaScript folder inside the Acrobat/Reader folder · Used to implement functions for automation purposes · Contains Trusted functions that execute privileged API's · By default Acrobat/Reader ships with JSByteCodeWin.bin · JSByteCodeWin.bin is loaded when Acrobat/Reader starts up · It's loaded inside Root, and exposed to the Doc when a document is open

Understanding the Attack Surface - Decompiling
· JSByteCodeWin.bin is compiled into SpiderMoney 1.8 XDR bytecode
· JSByteCodeWin.bin contains interesting Trusted functions
· Molnarg was kind enough to publish a decompiler for SpiderMonkey · https://github.com/molnarg/dead0007 · Usage: ./dead0007 JSByteCodeWin.bin > output.js · Output needs to be prettified · ~27,000 lines of Javascript

Why bypass JavaScript API restrictions ?
· Possibly achieve code execution through a pure logic chain · Trigger more interesting functionalities · Most of the JavaScript APIs have been audited but 90% of the vulnerabilities exist in non-restricted APIs · Privileged / Restricted APIs have not been properly audited · Trigger vulnerabilities in privileged APIs

Vulnerability Discovery

Vulnerability Discovery

Gain access to a SystemLevel eval()

Enumerate Trusted Functions with
beginPriv/endPriv blocks

Overwrite an arbitrary method within the
beginPriv/endPriv block

Execute Privileged APIs

CVE-2015-3073
· Acquire system-level eval which will allow us to execute JS code under root context
· Overwrite a method of one of the system objects with a privileged API · In this case it was a Collab method · Applies for other objects for example: App

CVE-2015-3073 - Exploit

CVE-2015-3073 - Fix

Bypassing the patch - CVE-2015-6708/6709
· Most of the system objects are not writable
· Other few objects were left writable
· The "Identity" object is one of them and it's used all over in the Folder-level script

CVE-2015-6708/6709 bypass
· After the last bypass, Adobe denied executing privileged APIs from inside getters of certain objects
· The patch targeted most of the objects referenced inside the Folder-level script
· The Global object was left unprotected
· Same trick worked, though this only gets executed when the application is closed

CVE-2016-1042

CVE-2018-16018

Defending the Engine

JavaScript / ECMAScript ­ brief history
· Began as simple scripting language in 1995 · First language specification in 1997 · Second, third edition standardized 1998 and 1999 · Fourth edition abandoned ca. 2007 - 2008 · Fifth edition 2009 ­ major milestone
· "Strict mode" ­ taming of the language · Sixth edition ­ finalized in 2015 · 7th (2016), 8th(2017), 9th (2018), 10th (2019)

JavaScript language features
· Key design decision · Dynamic typing · Malleable · Easy to learn
· Seven kinds of values · Undefined, Null, Boolean, Number, String, Symbol, Object
· Wide-variety of implicit type conversions · Expressive and flexible · Counter-intuitive, unexpected program behavior

JavaScript ­ dynamic features
· Prototype-based object-oriented language · An object may inherit properties of another object by setting it as a prototype object
· An object may add or delete its properties dynamically · Object oriented ­ message dispatch / calling methods on objects · An object change their structure dynamically during program execution
· Object can generate the code dynamically · eval, Function constructor, setInterval, setTimeout
· JavaScript not quite statistically scoped · with statement introduces new scope at runtime

JavaScript APIs
· JavaScript ­ extend functionality of applications · Web applications · PDF viewers
· Application encapsulates trusted portion of functionality · Application exposes relevant functionality to untrusted third-party code · How to control access to security critical resources from the untrusted code?

JavaScript API reference monitor
· JavaScript API reference monitor

Public resources

Untrusted / Non-
Privileged API

Security-critical resources

Trusted / Privileged
API

JavaScript API reference monitor
· Reference monitor
· Language-based encapsulation of security
· Challenge: how to prevent reference monitor bypasses by exploiting flexibility of JavaScript programming language
· A key implementation problem:
· ensure that encapsulated code does not access a set of security critical resources

Public resources
Securitycritical resources

Untrusted API

Public API confinement
· Goal: ensure that untrusted code cannot use the public API to obtain access to security critical resources

Checking API confinement

r0

r1

r2

r3

fapi

cr

r5

Trusted JS

r1

r2

r3 r5
cr
Untrusted JS

JavaScript API encapsulation example
Public API

Encapsulated event queue
ev0 ev1 ev2 var evqueue = [ev0, ev1, ev2]

function enqueue(x){ evqueue.add(x);
}
Reference to evqueue does not leak · encapsulated event queue prevents direct access to evqueue · Public API event only allows events to be enqueued to evqueue

JavaScript API breaking encapsulation

Public API

Encapsulated event queue
ev0 ev1

function enqueue(x) {evqueue.push(x); }
function add(i, x) {evqueue[i] = x; }

ev2 var evqueue = [ev0, ev1, ev2]

Reference to evqueue can be exposed var evqueue_alias; API.add("enqueue", function() {evqueue_alias=this}); API.enqueue();

JavaScript API Implementation
· API implementation: part of the trusted codebase
· Properties / requirements
· small (in comparison with the client code) · carefully written code ­ simple, idiomatic
· Analysis
· Static analysis can be feasible · Stronger guarantees for API encapsulation · Dissuade against unwieldy coding patterns

Static analysis of JavaScript code
· JavaScript ­ heap allocation for created objects
· Aliasing in OO programming
· Central feature ­ enables efficient sharing of objects across the execution · Essential feature of widely used idioms (e.g., iterators) · Reduces modularity and encapsulation
· Static reasoning about security policies
· Reason about the program states (heap + stack) · Crucial technique: points-to analysis

Points-to analysis
· Key technique for reasoning about object-oriented programs
· JavaScript points-to analysis
· Challenging because of wide variety of dynamic features
· Simple problem statement:
· What objects can a variable point to?

Points-to analysis ­ basic example

var obj1 = ...; var obj2 = ... ; function foo() {
x = new obj1(); y = ident(a); } function bar() { x = new obj2(); y = ident(a); } function ident(v) { if nd(v) return v; else return undefined; }

"basic" points-to analysis
foo:x -> alloc_obj1 bar:x -> alloc_objc2 ident:v -> alloc_obj1, alloc_obj2 foo:y -> alloc_obj1, alloc_obj2 bar:y -> alloc_obj1, alloc_obj2
context-sensitive points-to analysis
foo:x -> alloc_obj1 bar:x -> alloc_objc2 ident:v [foo] -> alloc_obj1 ident:v [bar] -> alloc_obj2 foo:y -> alloc_obj1 bar:y -> alloc_obj1

Points-to analysis ­ complex and well studied

Declarative Points-to Analysis

code

AssignAlloc Assign

x=new A(); x | alloc_A x | y

y=new B(); y | alloc_B y | x

z=new C(); z | alloc_C z | y

x=y; y=x; z=y;

Datalog rules PointsTo(v,h) <-
AssignAlloc(v,h).

PointsTo(v,h) <-

Assign(v,src),

PointsTo(src,h).

PointsTo x | alloc_A y | alloc_B z | alloc_C x | alloc_B y | alloc_A z | alloc_B z | alloc_A

Datalog

Declarative Points-to Analysis ­ adding field sensitivity

PointsTo(v,h) <AssignAlloc(v,h).
PointsTo(v,h) <Assign(v,src), PointsTo(src,h).

PointsTo(dst,h) <LoadField(b,f,dst), PointsTo(b,bh), FieldPointsTo(bh,f,h).

dst = b.f

FieldPointsTo(bh,f,h) <StoreField(src,b,f), PointsTo(b,bh), PointsTo(src,h).

b.f = src

bh

h

Static analysis ­ mutual recursion
points-to call-graph
field points-to

prototype handling
reflection

Static analysis ­ security policies
· Modification of non-mutable objects

Reachable(h1,h2) <PointsTo(v1,h1), PointsTo(v1,h2).

NonMutableAccess(dst) <StoreField(dst,_,_), PointsTo(dst,hx), NonMutableObject(h) Reaches(h, hx).

Non-mutable objects: Collab, App

Points-to analysis + secure information flow
· Two approaches
· Secure information flow uses a points to analysis as client · Unified points-to analysis and secure information flow
· Secure information flow ­ various flavors
· Transfer of capabilities ­ capability flow
· Capability
· Key idea: the methods of an API are capabilities provided to untrusted client code

Points-to analysis + secure information flow - rules
· PointsTo essentially becomes FlowsTo, · Introduce IsPrivileged{Var, Method} labeling for sensitive sink methods
· IsPrivilegedVar(v) ­ variable v is privileged · IsPrivilegedMethod(m) ­ method m is privileged
IsPrivEsc(h) <CallGraph(sink, m), IsPrivilegedMethod(sink), ActualArg(sink,from), FlowsTo(from, h).

Static analysis
· Sound
· Represent all possible program executions
· Precise
· Reports only "true" vulnerabilities
· Scalable
· Can it analyze large programs?

Scalable Sound Precise

Privilege Escalation Defense ­ Takeaways
1. Static analysis of JavaScript API
· Language-based sandbox · Confinement check
2. Declarative specification of points-to analysis
· Datalog language
3. Static analysis does not have to be sound to be useful
· Measure and adjust soundness

Questions?

