Ce1sus: A Contribution to an Improved Cyber Threat Intelligence
Handling
June 2015

Requirements
 Ease of use  Structured data
­ Output ­ Work-flow of the threat
 Interoperability
­ Combine it with existing tools
 Automated data enrichment/parsing

Data work-flow

manual

input

normalize

store

collect

enrich/parse

analyze

use

internal format systems

share

external format
red light blue

Structure example

Email - sender: max@ups.com - subject: UPS delivery - body - ....
File - hashes
- 00349d3191033a12caaa76c7c95ff12b - type (trojan) - size: 123B - name: a.com
URI - url: http://example.com/image.png

URI - url: http://194.123.123.11/f.zip Address - ipv4: 194.123.123.11
Domain - Domain name: example.com
Address - ipv4: 128.55.11.2

Structure example

Email - sender: max@ups.com - subject: UPS delivery - body - ....
File - hashes
- 00349d3191033a12caaa76c7c95ff12b - type (trojan) - size: 123B - name: a.com
URI - url: http://example.com/image.png

URI - url: http://194.123.123.11/f.zip Address - ipv4: 194.123.123.11
Domain - Domain name: example.com
Address - ipv4: 128.55.11.2

Structure example

Email - sender: max@ups.com - subject: UPS delivery - body - ....
File - hashes
- 00349d3191033a12caaa76c7c95ff12b - type (trojan) - size: 123B - name: a.com
URI - url: http://example.com/image.png

URI - url: http://194.123.123.11/f.zip Address - ipv4: 194.123.123.11
Domain - Domain name: example.com
Address - ipv4: 128.55.11.2

Benefits of such structure
 Store known informations  Easy determination what happened  Find patterns in threats
­ i.e. reuse of the same file
 Find more about the relations between threats

Existing tools
 MANTIS
­ https://github.com/siemens/django-mantis
 MISP
­ https://github.com/MISP/MISP
 SOLTRA ­ Edge
­ https://soltraedge.com
 CRITS  And many more

Existing "standards"
 IODEF  OpenIOC  CybOX  STIX/TAXII  MAEC  DAF  And many more

Existing "standards"
 IODEF  OpenIOC  CybOX  STIX/TAXII  MAEC  DAF  And many more

ce1sus

ce1sus - features
 Structured threat (Storing and presenting)  STIX/CybOX compatible  Completely RESTful  Attribute handlers  Compatible with different formats  Different levels of sharing

Attribute definitions

Handlers

 A handler processes the input
­ It can decompose the data ­ Enrich the data

input

parsing enrichment
other

storage

Handlers and value types

Value types
 Text  String  Date  Numbers

Handlers
 Generic handler  Text handler  Multiple line handler  Combo-box handler  Date handler  RT and CVE handler  File handlers  Emailhandler  ....

Some other things
 Support of MISP Synchronization
 Completely open source
­ https://github.com/GOVCERT-LU/ce1sus
 There is more!! :)
­ Don't hesitate to ask me

Thank you for your attention
jean-paul.weber@govcert.etat.lu
Questions?

