MOBILE INTERCONNECT THREATS How next-gen products may be already outdated

MOBILE INTERCONNECT THREATS: A REALITY

MOBILE INTERCONNECT THREATS: A REALITY

A MOVE TO DEFENSE

THREAT MODEL

Security product

HLR

aka SS7 firewall

MSC

THREAT MODEL

legitimate legitimate

Security product

HLR

aka SS7 firewall

MSC

THREAT MODEL

legitimate legitimate

Security product

HLR

aka SS7 firewall

MSC

SIGTRAN

THREAT MODEL

legitimate legitimate

Security product

HLR

aka SS7 firewall

MSC

SIGTRAN

Security product aka SS7 firewall

SIGTRAN

OUR CONTRIBUTION

Security product aka SS7 firewall

SIGTRAN

Reverse engineering

OUR CONTRIBUTION

Security product aka SS7 firewall

SIGTRAN

Reverse engineering Fuzzing

OUR CONTRIBUTION

Security product aka SS7 firewall

SIGTRAN

Reverse engineering Fuzzing
Exploit development

OUR CONTRIBUTION

Security product aka SS7 firewall

SIGTRAN

Reverse engineering Fuzzing
Exploit development

OUR CONTRIBUTION

SS7 ON TOP OF IP TRANSPORT = SIGTRAN
MAP or CAP TCAP SCCP MTP3 MTP2

MTP1

PHY

PHY

SS7 ON TOP OF IP TRANSPORT = SIGTRAN

MAP or CAP TCAP SCCP MTP3 MTP2

MAP or CAP TCAP SCCP

MTP1

PHY

PHY

SS7 ON TOP OF IP TRANSPORT = SIGTRAN

MAP or CAP TCAP SCCP MTP3 MTP2
MTP1
PHY

MAP or CAP TCAP SCCP
M3UA
SCTP IP PHY

IP/SCTP
MAP or CAP TCAP SCCP
M3UA
SCTP IP

(SOME) IP/SCTP TASKS FOR AN SS7 FIREWALL
oCheck source and destination addresses are allowed to communicate oReassemble IP fragments, to yield to SCTP oReassemble SCTP fragments, to yield to M3UA

TRICK REASSEMBLY TO BYPASS DETECTION

1

TRICK REASSEMBLY TO BYPASS DETECTION

1 2

SCCP
SIGNALLING CONNECTION CONTROL PART

MAP or CAP TCAP SCCP
M3UA
SCTP IP

oExtends MTP routing based on point code:
oPoint code plus subsystem number oOr Global Title
oProvides different levels of connection
oManagement messages oData messages
oProvides segmentation and reassembly

(SOME) SCCP TASKS FOR AN SS7 FIREWALL
oRetrieve called and caller addresses, to check if they are allowed to communicate oReassemble XUDT fragments, to further analyze a TCAP frame

SCCP
SIGNALLING CONNECTION CONTROL PART
MAP or CAP TCAP SCCP
M3UA
SCTP IP

TRICK FORWARD POINTERS TO DENY SERVICE

1 1

SCCP
SIGNALLING CONNECTION CONTROL PART
MAP or CAP TCAP SCCP
M3UA
SCTP IP

FOOLING GLOBAL TITLES TO GAIN CODE EXECUTION

1

FOOLING GLOBAL TITLES TO GAIN CODE EXECUTION

1 2

FOOLING GLOBAL TITLES TO GAIN CODE EXECUTION

1 2 3

FOOLING GLOBAL TITLES TO GAIN CODE EXECUTION
stack

digits
padding saved frame
pointer saved pc

size bytes

FOOLING GLOBAL TITLES TO GAIN CODE EXECUTION
stack stack

digits
padding saved frame
pointer saved pc

size bytes size > 0 ?

get_dgiegtitcsaller saved frame
pointer
saved pc

-size bytes

FOOLING GLOBAL TITLES TO GAIN CODE EXECUTION
stack stack stack

digits
padding saved frame
pointer saved pc

size bytes size > 0 ?

get_dgiegtitcsaller saved frame
pointer
saved pc

-size bytes

padding
attacker controlled fp
attacker controlled pc

SCCP SEGMENTING & REASSEMBLY

OVERFLOW REASSEMBLY TO GAIN CODE EXECUTION

1

OVERFLOW REASSEMBLY TO GAIN CODE EXECUTION

1 2

OVERFLOW REASSEMBLY TO GAIN CODE EXECUTION

3
1 2

OVERFLOW REASSEMBLY TO GAIN CODE EXECUTION

3 4
1 2

MAP or CAP TCAP SCCP
M3UA
SCTP IP

TCAP, MAP & CAP
TRANSACTION CAPABILITIES APPLICATION PART MOBILE APPLICATION PART
oTCAP provides dialog semantics
oWith indication of upper application in an Application Context Name
oMAP provides application to mobile core nodes, using multiple operations
oShort message service oCall handling oMobility o...
oSpecified in ASN.1, encoded in BER

ASN.1 SHIELDS FROM PROGRAMMING ERRORS ABSTRACT NOTATION
ASN.1 specs

ASN.1 SHIELDS FROM PROGRAMMING ERRORS GENERATE ENCODER AND DECODER SOURCE CODE

ASN.1

C

specs

asn1 compiler

code

SAFE

ASN.1 SHIELDS FROM PROGRAMMING ERRORS SAFE MACHINE CODE

ASN.1

C

x64

specs

asn1 compiler

code

compiler

insns

SAFE

(SOME) TCAP/MAP TASKS FOR AN SS7 FIREWALL
oAt TCAP level
oRetrieve Application Context Name, to identify a set of operations and a version

(SOME) TCAP/MAP TASKS FOR AN SS7 FIREWALL
oAt MAP level
oRetrieve local opcode, to identify the message in the set of operations oParse and process message parts

(SOME) TCAP/MAP TASKS FOR AN SS7 FIREWALL
oAt MAP level
oRetrieve local opcode, to identify the message in the set of operations oParse and process message parts

OVERFLOW STACK TO GAIN CODE EXECUTION
CVE-2018-19563

1

OVERFLOW STACK TO GAIN CODE EXECUTION
CVE-2018-19563

1 2

OVERFLOW STACK TO GAIN CODE EXECUTION
CVE-2018-19563

1 3 2
Unless stated otherwise, ASN.1 primitive types can be almost arbitrary long

ABUSE SIGNEDNESS TO CALL ARBITRARY FUNCTION

1

ABUSE SIGNEDNESS TO CALL ARBITRARY FUNCTION

1 2

ABUSE SIGNEDNESS TO CALL ARBITRARY FUNCTION

1 3
2
ASN1 INTEGER primitive type is signed, and may be wider than actual machine width

OVERFLOW HEAP TO GAIN CODE EXECUTION

1

OVERFLOW HEAP TO GAIN CODE EXECUTION

1 2

OVERFLOW HEAP TO GAIN CODE EXECUTION

3 1 2
ASN.1 constructed types can contain any number of objects

o5G will not make legacy networks disappear, protection mecanisms are required oVulnerabilites may sometimes be remotely exploited via SIGTRAN
oLegacy makes solution design clumsy oLack of hardening makes vulnerabilities easy to exploit
oEnhance hardening measures
oFollow best practices for software robustness oEnsure mandatory access control oFuzz efficiently every bit of software exposed to the wild
KEY TAKEAWAYS

THANK YOU

REMINDER: WEAKNESSES
oIP/SCTP/SCCP
oAbuse segmentation & fragmentation to evade detection
oSCCP
oCWE-125 Out-of-bounds memory access, causing a denial of service during parsing oCWE-789 Uncontrolled memory allocation during GT parsing oCWE-120 Buffer copy without checking size of input during reassembly
oTCAP/MAP
oCWE-121 Stack-based buffer overflow in ASN1 primitive types oCWE-129 Improper validation of Array Index of MAP localOpcode oCWE-122 Heap-based buffer overflow in ASN1 constructed types

