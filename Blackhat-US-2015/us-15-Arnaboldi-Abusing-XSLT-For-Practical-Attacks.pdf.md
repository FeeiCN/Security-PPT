Abusing XSLT for Practical Attacks
Fernando Arnaboldi Senior Security Consultant
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Why XSLT ?
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Why XSLT ?
· XML vulnerabilities are fun. They may get you passwords. · So I read about:
­ XML ­ Schemas ­ XSLT (this presentation)
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Objectives of this talk
· Analyze common weakness in XSLT · Exploit implementations flaws
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Who is this talk for ?
· Code reviewers · Developers using XML and XSLT · Anyone trying to abuse stuff
IOActive, Inc. Copyright ©2015. All Rights Reserved.

And why would you care ?
· XSLT processors (parsers) are still affected by these flaws · These flaws may have an impact on you and your
customers integrity and confidentiality · These flaws are using XSLT functionality. There are no
payloads to be detected by antivirus.
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Agenda
· Introduction · Numbers · Random numbers · Violate the same origin policy · Information Disclosure (and File Reading) through Errors
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Introduction
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Introduction
· What this does and which software does it ? · Attack vectors · Identify target
IOActive, Inc. Copyright ©2015. All Rights Reserved.

What does XSLT do ?
· XSLT is a language used to manipulate or transform documents
· It receives as input an XML document · It outputs a XML, HTML, or Text document
IOActive, Inc. Copyright ©2015. All Rights Reserved.

XSLT Versions
· There are three different XSLT versions: v1, v2 and v3 · XSLT v1 the most implemented version:
­ Because higher XSLT versions support previous versions. ­ Because it is the only one supported by web browsers
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Which software was tested ?
· Server side processors:
­ Command line standalone processors ­ Libraries used by programming languages
· Client side processors:
­ Web browsers ­ XML/XSLT editors (which were not analyzed)
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Server side processors
· CLI standalone processors and libraries:
­ Libxslt (Gnome):
· standalone (xsltproc) · Libxslt 1.1.28, Python v2.7.10, PHP v5.5.20, Perl v5.16 and Ruby v2.0.0p481
­ Xalan (Apache)
· standalone (Xalan-C v1.10.0, Xalan-J v2.7.2) · C++ (Xalan-C) and Java (Xalan-J)
­ Saxon (Saxonica):
· Standalone (saxon) v9.6.0.6J · Java, JavaScript and .NET
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Client side processors
· Web browsers:
­ Google Chrome v43.0.2357.124 ­ Safari v8.0.6 ­ Firefox v38.0.5 ­ Internet Explorer v11 ­ Opera v30.0
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Attack vector #1
· A XML/XHTML document can use an XSLT document

XML

XSLT

XSLT

Processor

IOActive, Inc. Copyright ©2015. All Rights Reserved.

Result Document

Attack vector #2
· A XML/XHTML document can reference an XSLT document

XML

XSLT

XSLT

Processor

IOActive, Inc. Copyright ©2015. All Rights Reserved.

Result Document

Attack vector #3

· A XML/XHTML document can contain an embedded XSLT document

XML / XHTML
&
XSLT

XSLT Processor

Result Document

IOActive, Inc. Copyright ©2015. All Rights Reserved.

Who's your target ?
· XSLT processors have specific properties: · Web browsers also have JavaScript properties:
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Version disclosure summary
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Numbers
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Numbers
· Present in client and server side processors · Real numbers will introduce errors · Integers will also do that !
IOActive, Inc. Copyright ©2015. All Rights Reserved.

How it feels when using numbers in XSLT
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Adding two floating point numbers
· Define a XSLT and add two numbers
"God is real, unless declared integer" (Anonymous)
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Sample outputs
· 1000 + 1000.41 ? ­ 8 processors said it is 2000.41 (libxslt) ­ 4 processors said it is 2000.4099999999999 (firefox, xalan-c, xalan-j, saxon)
­ 1 said 2000.4099999999998 (internet explorer)
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Floating point accuracy

· TL;DR. floating point numbers introduce errors

server  

xalan--c  (apache)   xalan--j  (apache)   saxon   xsltproc   php   python   perl   ruby   safari   opera   chrome   firefox   internet  explorer  

xsl:vendor   Apache  So7ware  Founda;on   Apache  So7ware  Founda;on   Saxonica   libxslt   libxslt   libxslt   libxslt   libxslt   libxslt   libxslt   libxslt   Transformiix   Microso7  

output   2000.4099999999999   2000.4099999999999   2000.4099999999999   2000.41   2000.41   2000.41   2000.41   2000.41   2000.41   2000.41   2000.41   2000.4099999999999   2000.4099999999998    

client  

IOActive, Inc. Copyright ©2015. All Rights Reserved.

Let's talk about integers
· Define an XML with 10 numbers (5 are in exponential notation and 5 are not):
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Integer accuracy
· Print the original XML value and the XSLT representation
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Integer accuracy (cont'd)
· Saxon: this is what you want to see
1e22: 10,000,000,000,000,000,000,000 1e23: 100,000,000,000,000,000,000,000 1e24: 1,000,000,000,000,000,000,000,000 1e25: 10,000,000,000,000,000,000,000,000 1e26: 100,000,000,000,000,000,000,000,000 10000000000000000000000: 10,000,000,000,000,000,000,000 100000000000000000000000: 100,000,000,000,000,000,000,000 1000000000000000000000000: 1,000,000,000,000,000,000,000,000 10000000000000000000000000: 10,000,000,000,000,000,000,000,000 100000000000000000000000000: 100,000,000,000,000,000,000,000,000
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Integer accuracy (cont'd)

· Internet Explorer and Firefox are good at this !

1e22: NaN

1e23: NaN 1e24: NaN 1e25: NaN

Not being able to represent an exponential number is not a flaw.

1e26: NaN

10000000000000000000000: 10,000,000,000,000,000,000,000

100000000000000000000000: 100,000,000,000,000,000,000,000

1000000000000000000000000: 1,000,000,000,000,000,000,000,000

10000000000000000000000000: 10,000,000,000,000,000,000,000,000

100000000000000000000000000: 100,000,000,000,000,000,000,000,000

IOActive, Inc. Copyright ©2015. All Rights Reserved.

Integer accuracy (cont'd)

· Libxslt processors (Xsltproc, Php, Perl, Ruby, Python, Safari, Chrome and Opera) produce the following result:

1e22: 10,000,000,000,000,000,000,000 1e23: 100,000,000,000,000,000,000,002

"False knowledge is more dangerous than ignorance"

1e24: 1,000,000,000,000,000,000,000,024

1e25: 10,000,000,000,000,000,000,000,824

1e26: 100,000,000,000,000,000,000,008,244

10000000000000000000000: 10,000,000,000,000,000,000,000

100000000000000000000000: 100,000,000,000,000,000,000,002

1000000000000000000000000: 1,000,000,000,000,000,000,000,024

10000000000000000000000000: 10,000,000,000,000,000,000,000,266

100000000000000000000000000: 100,000,000,000,000,000,000,002,660

IOActive, Inc. Copyright ©2015. All Rights Reserved.

Integer accuracy (cont'd)
· Xalan for Java ­almost­ got it right
1e22: NaN 1e23: NaN 1e24: NaN 1e25: NaN 1e26: NaN 10000000000000000000000: 10,000,000,000,000,000,000,000 100000000000000000000000: 99,999,999,999,999,990,000,000 1000000000000000000000000: 1,000,000,000,000,000,000,000,000 10000000000000000000000000: 10,000,000,000,000,000,000,000,000 100000000000000000000000000: 100,000,000,000,000,000,000,000,000
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Integer accuracy (cont'd)
· Xalan for C just doesn't care
1e22: NaN 1e23: NaN 1e24: NaN 1e25: NaN 1e26: NaN 10000000000000000000000: 10000000000000000000000 100000000000000000000000: 99999999999999991611392 1000000000000000000000000: 999999999999999983222784 10000000000000000000000000: 10000000000000000905969664 100000000000000000000000000: 100000000000000004764729344
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Integer accuracy (cont'd)
· There is a justification for this behavior. A number can have any double-precision 64-bit format IEEE 754 value. A standard defined in 1985 referenced in the XSLT specification.
· Implementations adopted different solutions
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Vendor explanation
· A major security team explained the accuracy by:
­ Referencing Wikipedia ­ Referencing the XSLT v2.0 specification ­ Referencing JavaScript
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Integer accuracy summary

· TL;DR. Integers will introduce errors.

server  

xalan--c  (apache)   xalan--j  (apache)   saxon   xsltproc   php   python   perl   ruby   safari   opera   chrome   firefox   internet  explorer  

xsl:vendor  

result  

Apache  So7ware  Founda;on   error  

Apache  So7ware  Founda;on   error  

Saxonica  

ok  

libxslt  

error  

libxslt  

error  

libxslt  

error  

libxslt  

error  

libxslt  

error  

libxslt  

error  

libxslt  

error  

libxslt  

error  

Transformiix  

ok  

Microso7  

ok  

client  

IOActive, Inc. Copyright ©2015. All Rights Reserved.

Random numbers
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Random numbers
· Present in server side processors · Not any random number generator should be used for
cryptographic purposes
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Random numbers in XSLT
· It is a function from EXSLT (an extension to XSLT) · The math:random() function returns a random
number from 0 to 1 · A random number is said to be a number that lacks any
pattern
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Random numbers in XSLT (cont'd)
· We use pseudo random numbers for simple things (i.e., random.random() in Python)
· We rely in cryptographically secure pseudo random numbers for sensitive stuff (i.e., random.SystemRandom() in Python)
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Let's take a look under the hood

libxslt xalan-c xalan-j saxon

pseudorandom pseudorandom pseudorandom pseudorandom

IOActive, Inc. Copyright ©2015. All Rights Reserved.

Only pseudo random numbers for XSLT
· rand(), srand(), java.lang.Math.Random(): implementations only returns pseudo random values
· A good definition comes from the man page of rand() and srand(): "bad random number generator".
· No cryptographic usage should be done for these values.
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Initialization vector
· What happens if there is no initialization vector ?
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Initialization vector (cont'd)
· You may know in advance which values will be generated
· Random functions require an initial initialization value to produce random values
· Let's review which random functions are using an IV
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Initialization vector (cont'd)

libxslt xalan-c xalan-j saxon

Without IV With IV With IV With IV

IOActive, Inc. Copyright ©2015. All Rights Reserved.

Output of random() in libxslt
· Define a simple XSLT to see the output of math:random()
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Output of random() in libxslt (cont'd)
· Random means without a pattern. Can you spot the pattern in the following two executions of libxslt ?
· They are producing the same output !
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Python random.random() vs libxslt Math:random()
Execution #1

Execution #2

Python libxslt
Python libxslt
IOActive, Inc. Copyright ©2015. All Rights Reserved.

No initialization vector for libxslt
· Without some external seed value (such as time), any pseudo-random generator will produce the same sequence of numbers every time it is initiated.
· If math:random() is used in libxslt for sensitive information, it may be easy to get the original plaintext value.
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Random summary

· TL;DR. values may be predicted

server  

Type  

IV  ?  

xalan--c  (apache)   pseudorandom  

yes  

xalan--j  (apache)   pseudorandom  

yes  

saxon  

pseudorandom  

yes  

xsltproc  

pseudorandom  

no  

php  

pseudorandom  

no  

python  

pseudorandom  

no  

perl  

pseudorandom  

no  

ruby  

pseudorandom  

no  

IOActive, Inc. Copyright ©2015. All Rights Reserved.

Violate the Same Origin Policy
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Violate the Same Origin Policy
· Present in client side processors (only web browsers). · The Same-Origin Policy says that you can't use a web
browser to read information from a different origin · Let's ignore that statement for a moment
IOActive, Inc. Copyright ©2015. All Rights Reserved.

What is the Same-Origin Policy ?
· An origin is defined by the scheme, host, and port of a URL.
· Generally speaking, documents retrieved from distinct origins are isolated from each other.
· The most common programming language used in the DOM is JavaScript. But not necessarily !
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Same-Origin Policy ­ Valid scenario

http:// example.com
:80

http:// example.com
:80 /foo

http:// example.com :80/private/
..or..
http:// example.com
:80 /images/

IOActive, Inc. Copyright ©2015. All Rights Reserved.

Same-Origin Policy ­ Invalid Scenarios

https://
example.com :80

Different scheme

http:// example.com
:80

http://
evil.com
:80

Different hostname

http:// example.com
:8080

Different port

IOActive, Inc. Copyright ©2015. All Rights Reserved.

XSLT functions that read XML
· document(): allows access to XML documents other than the main source document.
· Having that defined, how can we read it ?
­ copy-of: copy a node-set over to the result tree without converting it to a string.
­ value-of: create a text node in the result tree and converting it to a string
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Bing.com uses XHTML. I'm logged in. How can I access private stuff ?
DOM element containing the name is called "id_n"
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Let's put all the pieces together
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Demo !
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Violate the Same Origin Policy summary
· TL;DR:
­ Safari access cross origin information. ­ Internet Explorer shows a warning message, retrieves
data, but there is no private information. ­ Chrome, Firefox and Opera don't retrieve data.
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Information Disclosure (and File Reading) through Errors
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Information Disclosure (and File Reading) through Errors
· Present in server side and client side processor. Focus is on server side processors because relies on the process having access to the file.
· There are no functions to read plain text files in XSLT v1.0
· W3C says is not possible. But what if...
IOActive, Inc. Copyright ©2015. All Rights Reserved.

XSLT functions to read files
· Read other XML documents:
­ document(): "allows access to XML documents other than the main source document"
· Read other XSLT documents:
­ include(): "allows stylesheets to be combined without changing the semantics of the stylesheets being combined"
­ import(): "allows stylesheets to override each other"
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Create a simple text file with 3 lines
$ echo -e "line 1\nline 2\nline 3" > testfile $ cat testfile line 1 line 2 line 3
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Read the text file using document()

· "If there is an error retrieving the resource, then the XSLT processor may signal an error;"

· Xalan-C, Xalan-J and Saxon output:
Content is not allowed in prolog.

Expected behaviour 1/2

IOActive, Inc. Copyright ©2015. All Rights Reserved.

Read the text file using document() (cont'd)

· "...If it does not signal an error, it must recover by returning an empty node-set."

· Ruby returns an empty node-set:

<?xml version="1.0"?>

Expected behaviour 2/2

IOActive, Inc. Copyright ©2015. All Rights Reserved.

Read the text file using document() (cont'd)
· However, libxslt does not behaves like this. Xsltproc, PHP, and Perl will output the first line of our test file (Ruby will also do it later):
testfile:1: parser error : Start tag expected, '<' not found line 1 ^
Unexpected behaviour
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Maximize the results with one line
· The previous processors will expose the first line of the test file
· Which files have an interesting first line ?
­ /etc/passwd: Linux root password ­ /etc/shadow: Linux root password ­ .htpasswd: Apache password ­ .pgpass: PostgreSQL password
IOActive, Inc. Copyright ©2015. All Rights Reserved.

XML document generation... failed
· Reading /etc/passwd using xsltproc: · Reading .htpasswd using PHP:
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Got root ? Grab /etc/shadow
· Reading /etc/shadow using Ruby:
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Reading files summary

· TL;DR. You can read the first line of a non XML file through errors.

document()   import()   include()  

xalan--c  (apache)   no  

no  

no  

xalan--j  (apache)  

no  

no  

no  

saxon  

no  

no  

no  

server  

xsltproc   php  

yes  

yes  

yes  

yes  

yes  

yes  

python   perl  

no  

no  

no  

yes  

yes  

yes  

ruby  

no  

yes  

yes  

IOActive, Inc. Copyright ©2015. All Rights Reserved.

Black Hat Sound Bytes
· When the attacker controls either the XML or the XSLT they may compromise the security of a system
· Confidentiality and confidentiality can also be affected without controlling either document
· Check your code
IOActive, Inc. Copyright ©2015. All Rights Reserved.

Questions ?
IOActive, Inc. Copyright ©2015 All Rights Reserved.

Thank you

· Alejandro Hernandez · Ariel Sanchez · Carlos Hollman · Cesar Cerrudo · Chris Valasek · Diego Madero · Elizabeth Weese

· Jennifer Steffens · Joseph Tartaro · Lucas Apa · Mariano Nogueira · Matias Blanco · Sofiane Talmat · Yudell Rojas

IOActive, Inc. Copyright ©2015 All Rights Reserved.

IOActive, Inc. Copyright ©2015. All Rights Reserved.

