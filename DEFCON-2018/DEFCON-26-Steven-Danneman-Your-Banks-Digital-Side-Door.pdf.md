Your Bank's Digital Side Door
@sdanndev
1

"Because that's where the money is."
Willie Sutton, Bank Robber
2

Why does my bank website require my 2-factor token, but
pulling my transactions into Quicken does not?
3

Personal Financial Management
PFM
4

Personal Financial Management (PFM)
5

7

8

9

10

11

12

Quicken/Quickbooks Connection Types

Web Connect
· Unidirectional · Manual · Download a file · OFX file format

Express Web Connect
· Unidirectional · Programmatic · Screen scrape · Private web
service

Direct Connect
· Bidirectional · Programmatic · Structured query · OFX protocol

13

Desktop Application Middle-Man Web Connect

Financial Institution

Express Web Connect

Direct Connect

OFX

14

Account Aggregation Service / API
15

Web Application

Middle-Man

Financial Institution

OFX
16

Personal Threat Model
· Assets
· Checking account · Brokerage account
· Threats
· Credentials are stolen · Accounts are accessible without credentials

17

@mrvaughan: https://youtu.be/PIwvxSZj5e8

Lack of Least Privilege
· Users have 1 set of bank credentials
· Full read / write access to all accounts at financial institution
· Plain text password is shared with and stored by aggregators · Tokenized application-based access control (OAuth) is needed
18

Open Financial Exchange (OFX)
aka Direct Connect
19

OFX Functionality - Financial

Banking
· Checking · Savings · CDs · Loans

Investment
· IRA · 401k · Holdings · Equity
Prices

Credit Cards · Transactions

Transfers
· Bill Pay · Intrabank · Interbank · Wire Funds

20

OFX Functionality - Miscellaneous

· Enrollment
· Setup online access · Password Reset
· FI Profile
· Like a homepage
· Email
· Messages and Notifications
· Synchronization
· Ensure multiple clients receive 1-time messages.

· Image download
· JPEG, TIFF, PNG, PDF
· Bill Presentment
· For 3rd parties

21

www.ofx.org
22

Request
POST /cgi/ofx HTTP/1.1 Accept: */* Content-Type: application/x-ofx Date: Fri, 16 Jun 2018 21:12:27 GMT User-Agent: InetClntApp/3.0 Content-Length: 570 Connection: close
OFXHEADER:100 DATA:OFXSGML VERSION:103 SECURITY:NONE ENCODING:USASCII
<OFX> <SIGNONMSGSRQV1> <SONRQ> <DTCLIENT>20060321083010 <USERID>12345 <USERPASS>MyPassword <LANGUAGE>ENG <FI> <ORG>ABC <FID>000111222 </FI> <APPID>MyApp </SONRQ> </SIGNONMSGSRQV1> ... <!--Other message sets-->
</OFX>

Response
HTTP/1.1 200 OK Date: Fri, 16 Jun 2018 21:12:30 GMT Content-Type: application/x-ofx Connection: Keep-Alive Content-Length: 2399
OFXHEADER:100 DATA:OFXSGML VERSION:103 SECURITY:NONE ENCODING:USASCII
<OFX> <SIGNONMSGSRSV1> <SONRS> <STATUS> <CODE>0 <SEVERITY>INFO <MESSAGE>Success </STATUS> <DTSERVER>20060321083445 <LANGUAGE>ENG <FI> <ORG>ABC <FID>000111222 </FI> </SONRS> </SIGNONMSGSRSV1> ... <!--All other transaction responses-->
</OFX>

Request
OFXHEADER:100 DATA:OFXSGML VERSION:103 SECURITY:NONE ENCODING:USASCII
<OFX> <SIGNONMSGSRQV1> <SONRQ> <DTCLIENT>20060321083010 <USERID>12345 <USERPASS>MyPassword <LANGUAGE>ENG <FI> <ORG>ABC <FID>000111222 </FI> <APPID>MyApp </SONRQ> </SIGNONMSGSRQV1> ... <!--Other message sets-->
</OFX>

Response
OFXHEADER:100 DATA:OFXSGML VERSION:103 SECURITY:NONE ENCODING:USASCII
<OFX> <SIGNONMSGSRSV1> <SONRS> <STATUS> <CODE>0 <SEVERITY>INFO <MESSAGE>Success </STATUS> <DTSERVER>20060321083445 <LANGUAGE>ENG <FI> <ORG>ABC <FID>000111222 </FI> </SONRS> </SIGNONMSGSRSV1> ... <!--All other transaction responses-->
</OFX>

OFX
25

Request
OFXHEADER:100 DATA:OFXSGML VERSION:103 SECURITY:NONE ENCODING:USASCII
<OFX> <SIGNONMSGSRQV1> ... <!--Anonymous sign on--> </SIGNONMSGSRQV1> <PROFMSGSRQV1> <PROFTRNRQ> <TRNUID>5A59A330-7CEC-1000-A761 <PROFRQ> <CLIENTROUTING>MSGSET <DTPROFUP>19900101 </PROFRQ> </PROFTRNRQ> </PROFMSGSRQV1>
</OFX>
26

Response
OFXHEADER:100 DATA:OFXSGML VERSION:103 SECURITY:NONE ENCODING:USASCII
<OFX> ... <!--Anonymous sign on success--> <BANKMSGSET> <BANKMSGSETV1> <MSGSETCORE> <URL>https://o.bank.org/ofx.asp <LANGUAGE>ENG <SPNAME>Corillian Corp </MSGSETCORE> <XFERPROF> <PROCENDTM>235959[0:GMT] <CANSCHED>Y <CANRECUR>N <CANMODXFERS>N </XFERPROF> </BANKMSGSETV1> </BANKMSGSET>
</OFX>

Request
OFXHEADER:100 DATA:OFXSGML VERSION:103 SECURITY:NONE ENCODING:USASCII
<OFX> <SIGNONMSGSRQV1> ... <!--Anonymous sign on--> </SIGNONMSGSRQV1> <PROFMSGSRQV1> <PROFTRNRQ> <TRNUID>5A59A330-7CEC-1000-A761 <PROFRQ> <CLIENTROUTING>MSGSET <DTPROFUP>19900101 </PROFRQ> </PROFTRNRQ> </PROFMSGSRQV1>
</OFX>
27

Response
OFXHEADER:100 DATA:OFXSGML VERSION:103 SECURITY:NONE ENCODING:USASCII
<OFX> ... <!--Anonymous sign on success--> <PROFMSGSRSV1> <PROFTRNRS> <PROFRS> <FINAME>Bank <ADDR1>123 Muholland Drive <CITY>Las Vegas <STATE>NV <POSTALCODE>89109 <COUNTRY>USA <CSPHONE>206-439-5700 <URL>http://www.bank.org <EMAIL>info@bank.org </PROFRS> </PROFTRNRS> </PROFMSGSRSV1>
</OFX>

OFX Protocol Specification
28

OFX 1.0.x

1.0.2 - 1997
· BASIC authentication
· User:Pass sent plaintext · Over HTTPS
· Suggests SSN for username · SGML

1.0.3 - 2006
· Added "MFA"

29

OFX 2.x.x
2.0.3 - 2006
· BASIC authentication
· User:Pass sent plaintext · Over HTTPS
· Added "MFA" · XML · Taxes (1099, W2)

2.2.0 - 2017
· Token-based Authentication
· OAuth

30

Multi-Factor Authentication (MFA)

Know

Have

Are

· Password · PIN · Security
Question

· Token · Hardware · Software
· PKI Certificate · Smart Card

· Biometric · Behavior

31

2-Step Authentication
· Password + out-of-band mechanism
· 6 digit string
· SMS · Push notification · Software token
32

OFX "MFA"
Security Question
· <USERCRED1>
· Free form field required by server · Server defines label · Ex: "Mother's maiden name."
· <MFACHALLENGE>
· Security questions · Hard coded list · Ex: "Favorite color."
33

OFX "MFA"
Static String
· <CLIENTUID>
· Client generated ID · Checked by Server
· TOFU
· Static
· <AUTHTOKEN>
· Server generated · Provided to client out-of-band · Implied static · Could be used for 2-step auth
35

Frequency of OFX Header: Version
4% 0%
20% 102 103 202 203
76%
36

Financial Institutions
FIs
37

The Big Names
38

The Smaller Names
39

There Are A Lot of Banks!
15,000 FIs
7,000 Commercial
Banks

41

(USA & Canada)

7,000 OFX FIs
2,000 Public OFX FIs
400 Public Server

Investigation
42

OFX Survey
· What FI's are running an OFX server?
· Find them and talk to them.
· What software is providing this service?
· Ask them simple questions.
43

Recon

ENUM HOSTS TLS PING WEB SERVER OFX SERVER OFX PROFILE OFX ACCOUNT

· Typical URL
· https://ofx.bank.com/ofx/ofxsrvr.dll
· User Community
· ofxhome.org · wiki.gnucash.org
· Commercial Clients
· Branding Services
· DNS for FIs · Name to OFX URL translation

44

Recon

ENUM HOSTS TLS PING WEB SERVER OFX SERVER OFX PROFILE OFX ACCOUNT

· DNS
· Stale A records?
· TLS
· Is server certificate expired?

45

Stale DNS
46

Stale TLS
47

Recon

ENUM HOSTS TLS PING WEB SERVER OFX SERVER OFX PROFILE OFX ACCOUNT

· HTTP GET / · HTTP GET /path/ofx · HTTP POST /path/ofx
· Fingerprint
· Web server · Web application framework · OFX server

48

HTTP GET /
49

HTTP GET /
50

HTTP GET /path/ofx
51

HTTP GET /path/ofx
52

Recon

ENUM HOSTS TLS PING WEB SERVER OFX SERVER OFX PROFILE OFX ACCOUNT

· HTTP POST /path/ofx
· <OFX></OFX>
· Fingerprint
· Framework errors · OFX errors

53

HTTP POST /path/ofx
Request
OFXHEADER:100 DATA:OFXSGML VERSION:102 SECURITY:NONE ENCODING:USASCII
<OFX> </OFX>

Response
Error 500: java.lang.NullPointerException

54

HTTP POST /path/ofx

Request
OFXHEADER:100 DATA:OFXSGML VERSION:102 SECURITY:NONE ENCODING:USASCII
<OFX> </OFX>

Response
OFXHEADER<OFX> <SIGNONMSGSRSV1> <SONRS> <STATUS> <CODE>2000 <SEVERITY>ERROR <MESSAGE>FID not found in file SQL State 02000 </STATUS> <DTSERVER>20180324234025 <LANGUAGE> <FI> <ORG> </FI> </SONRS> </SIGNONMSGSRSV1>
</OFX>

55

HTTP POST /path/ofx

Request
OFXHEADER:100 DATA:OFXSGML VERSION:102 SECURITY:NONE ENCODING:USASCII
<OFX> </OFX>

Response
<b>Stack Trace:</b> <br><br>
<table width=100% bgcolor="#ffffcc"> <tr><td> <code><pre>
[ArgumentOutOfRangeException: Length cannot be less than zero. Parameter name: length]
System.String.Substring(Int32 startIndex, Int32 length) +12518387 OFX.OFX.ProcessRequest(HttpContext context) in C:\Environment\directconnect\OFX\OFX\OFX.ashx.cs:43 System.Web.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionSt ep.Execute() +188 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously) +69
</pre></code> </td></tr> </table>

56

Recon

ENUM HOSTS TLS PING WEB SERVER OFX SERVER OFX PROFILE OFX ACCOUNT

· POST /path/ofx
· <PROFRQ>
· Fingerprint
· Spacing · In-house vs service provider
· Info Disclosure
· More verbose errors · Long lived sessions · Password policy

57

HTTP POST /path/ofx <PROFRQ>

Request
OFXHEADER:100 DATA:OFXSGML VERSION:103
<OFX> <SIGNONMSGSRQV1> <SONRQ> <DTCLIENT>20180319054443.123[-7:MST] <USERID>anonymous00000000000000000000000 <USERPASS>anonymous00000000000000000000000 </SONRQ> </SIGNONMSGSRQV1> <PROFMSGSRQV1> <PROFTRNRQ> <PROFRQ> <DTPROFUP>19900101 </PROFRQ> </PROFTRNRQ> </PROFMSGSRQV1>
</OFX>
58

Response
OFXHEADER:100 DATA:OFXSGML VERSION:103
<OFX> <SIGNONMSGSRSV1> ... </SIGNONMSGSRSV1> <PROFMSGSRSV1> <PROFTRNRS> <STATUS> <CODE>2000 <SEVERITY>ERROR <MESSAGE>Oracle SP Adapter Error:
java.sql.SQLException: ORA-01403: no data found ORA-06512: at "OFX_PRO.PR_GETMESSAGESETSV1", line 54 ORA-06512: at line 1
</STATUS> </PROFTRNRS> </PROFMSGSRSV1 </OFX>

HTTP POST /path/ofx <PROFRQ>

Request
OFXHEADER:100 DATA:OFXSGML VERSION:103

Response
OFXHEADER:100 DATA:OFXSGML VERSION:103

<OFX> <SIGNONMSGSRQV1> <SONRQ> <DTCLIENT>20180319054443.123[-7:MST] <USERID>anonymous00000000000000000000000 <USERPASS>anonymous00000000000000000000000 </SONRQ> </SIGNONMSGSRQV1> <PROFMSGSRQV1> <PROFTRNRQ> <PROFRQ> <DTPROFUP>19900101 </PROFRQ> </PROFTRNRQ> </PROFMSGSRQV1>
</OFX>

<OFX> <SIGNONMSGSRSV1> <SONRS> <STATUS> <CODE>0 <SEVERITY>INFO <MESSAGE>SUCCESS </STATUS> <DTSERVER>20180319014447.551[-4:EDT] <TSKEYEXPIRE>20190319120000.000[-4:EDT] <DTPROFUP>20081116120000.000[-5:EST] </SONRS> </SIGNONMSGSRSV1> <PROFMSGSRSV1> ... </PROFMSGSRSV1>
</OFX>

HTTP POST /path/ofx <PROFRQ>

Request
OFXHEADER:100 DATA:OFXSGML VERSION:103

Response
OFXHEADER:100 DATA:OFXSGML VERSION:103

<OFX> <SIGNONMSGSRQV1> <SONRQ> <DTCLIENT>20180319054443.123[-7:MST] <USERID>anonymous00000000000000000000000 <USERPASS>anonymous00000000000000000000000 </SONRQ> </SIGNONMSGSRQV1> <PROFMSGSRQV1> <PROFTRNRQ> <PROFRQ> <DTPROFUP>19900101 </PROFRQ> </PROFTRNRQ> </PROFMSGSRQV1>
</OFX>

<OFX> ... <PROFMSGSRQV1> <PROFRQ> <SIGNONINFOLIST> <SIGNONINFO> <MIN>4 <MAX>4 <CHARTYPE>ALPHAORNUMERIC <CASESEN>N <SPECIAL>N <SPACES>N </SIGNONINFO> </SIGNONINFOLIST> </PROFRQ>
</PROFMSGSRQV1>> </OFX>

Recon

ENUM HOSTS TLS PING WEB SERVER OFX SERVER OFX PROFILE OFX ACCOUNT

· POST /path/ofx
· <ACCTINFORQ>
· Fingerprint
· Error message

61

HTTP POST /path/ofx <ACCTINFORQ>
Request
OFXHEADER:100 DATA:OFXSGML VERSION:103
<OFX> <SIGNONMSGSRQV1> <SONRQ> <USERID>anonymous00000000000000000000000 <USERPASS>anonymous00000000000000000000000 </SONRQ> </SIGNONMSGSRQV1> <SIGNUPMSGSRQV1> <ACCTINFOTRNRQ> <ACCTINFORQ> <DTACCTUP>19900101 </ACCTINFORQ> </ACCTINFOTRNRQ>
</SIGNUPMSGSRQV1></OFX>
62

HTTP POST /path/ofx <ACCTINFORQ>

Response

<MESSAGE>SUCCESS

<MESSAGE>Signon VALUES (for example, USER ID or Password) invalid.

<MESSAGE>Signon invalid

<MESSAGE>User id password combination incorrect

<MESSAGE>Could not process request

<MESSAGE>Invalid FID sent in Request

<MESSAGE>Unable to retrieve FI configuration.

<MESSAGE>UserID/PIN is incorrect.

<MESSAGE>Unsupported operation for anonymous user

<MESSAGE>No Accounts Returned

<MESSAGE>&lt;FI&gt; Missing or Invalid in &lt;SONRQ&gt;

<MESSAGE>Account Not Found

<MESSAGE>There was a problem verifying the UserId/Password <MESSAGE>Please contact your financial institution to enroll. <MESSAGE>General error (ERROR) The server encountered an error.

<MESSAGE>Client up to date <MESSAGE>Invalid session <MESSAGE>General Error

<MESSAGE>Account information request could not be completed at this time. Please contact your financial institution for assistance.

63

Financial Software Vendors
64

https://www.sibanking.com/improved-core-banking-software/

Where Do I Buy?
· Not shrink wrapped · No `apt install' · No app store
66

Frequency of HTTP Servers
180 160 140 120 100
80 60 40 20
0
69

Acquisition and Atrophy

70

https://www.fisglobal.com/about-us/about-our-company

Vulnerabilities
71

650 Page specification 34 Implementations
x 10 Technology Stacks 221,000 Vulnerabilities
72

Found in Production

· Web server disclosure · Web framework disclosure · OFX server version disclosure · Backend DB disclosure · Full stack trace on errors · Full server file paths in errors · Out-of-date software · Unhandled exceptions · Long lived session keys

· MFA ignored · Internal IP disclosure · Valid user enumeration · Personal email disclosure · Unmaintained servers · Null values returned · Unregistered URL referenced · Reflected XSS
· I know it's not a web page, and yet...

73

Demo
75

ofx-postern
· Fingerprint OFX Server · Show capabilities · Show disclosure vulnerabilities https://github.com/sdann/ofx-postern
76

Conclusions
77

https://media-cdn.tripadvisor.com/media/photo-s/01/13/d9/9b/side-door.jpg

Neglect
79

Planning for Retirement
· Inventory your assets
· How much money public facing services do you have?
· Pick an age to retire
· How old do you want your TLS certs to be? · When will you your software stop working?
· Do quarterly check-ins
· Are you saving enough? Is your software up to date?
· Protect your assets
· With insurance MFA
· Invest
· The earlier the better, but it is never too late to start!
80

TQhuaensktiYoonus!?
@sdanndev | www.securityinnovation.com
81

Glossary
· FI - Financial Institution
· A bank, brokerage, or credit card provider.
· PFM - Personal Financial Management
· Client software for viewing and managing their financial accounts
82

