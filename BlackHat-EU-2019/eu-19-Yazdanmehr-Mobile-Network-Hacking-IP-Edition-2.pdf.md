SRLabs Template v12

Mobile network hacking ­ All-over-IP edition BlackHat EU, Dec 4 2019, London
Luca Melette <luca@srlabs.de> Sina Yazdanmehr <sina@srlabs.de>

Mobile networks are evolving, and research is hardly keeping up

Research question
After several decades of intercept attacks (A5/1, SS7, IMSI catchers), will RCS finally protect text messages?

2

Agenda

1. Mobile attack recap 2. Attacks on new technologies 3. Mitigations

3

Known mobile network attacks can be categorized into 5 classes

Attack impact

I

Intercept calls and texts

Attack scope Local Remote

Attack details  Passively sniff and crack weak encryption (A5/1, A5/2), run IMSI catcher  Reroute voice flows enabling call forwarding via SS7

II

Impersonate user identity

Local Remote

 Grab TMSIs over-the-air, spoof originating call or SMS via radio interface  Send SMS or USSD code on behalf of another user via SS7

III Track users

Local Remote

 Collect IMSIs from the radio interface, verify user presence with silent SMS  Globally locate mobile subscribers by requesting serving tower via SS7

IV Conduct fraud

No charge Charge others

 Disable call barrings and prepaid data limits via SS7  Spoof calls and SMS to premium numbers, steal bank OTP codes in SMS

V

DoS users or network

Subscriber Network

 Make users unreachable via detach message (radio) or cancel location (SS7)  Exhaust MSC/HLR resources via SS7 requests (RESET, PRN, ATI, PSI)

4

Only some parts of a telco networks have been publicly dissected by security researchers

Mobile operator

A SIM

B 2G

Cell

tower

3G

C 4G

Mobile users

Femto cell

WiFi
Access point SIM

Voice core IMS, RCS

User database
HLR

Packet core ePDG

IMS partially covered: most of the publications show configuration mistakes

PSTN D
SS7
IPX E
Internet

Several vulnerabilities have been identified in these telco components:
A. Malicious applications can be remotely installed in SIM cards
B. Weak radio encryption allow call/SMS and data to be intercepted
C. Devices in user hands can provide privileged access to core nodes
D. Hackers can remotely intercept calls/SMS and track users because of missing authentication
E. Like point D, but for data connections

5

Legacy standards are being replaced by new technologies: IMS (VoLTE, VoWiFi) and RCS
Voice calls are moving from dedicated channels to voice-over-IP (VoIP)

Dedicated voice channels (CSFB)

Data Voice

4G/5G 3G

The mobile uses legacy networks to transmit voice, the fast 4G link is only used for internet traffic

Basic VoIP (IMS)

Data Voice

4G/5G

IMS makes the fast LTE interface usable for both internet and voice traffic

VoIP

RCS messaging is similar to WhatsApp, iMessage

RCS is supported by an increasing number of networks

Advanced VoIP (IMS+RCS)

6

RCS is already implemented by at least 100 mobile operators

900 mobile operators

Lower-bound estimate for deployment status of `next-generation' mobile network technologies

300 LTE

200 VoLTE IMS

150 VoWiFi

100 RCS

 Functional RCS deployments were identified through DNS and HTTP queries towards RCS-related domains [1]
 European telco groups constitute a large part of the current RCS deployments: - Orange (17 countries) - Vodafone (16 countries) - T-Mobile (9 countries)

[1] config.rcs.mncYYY.mccXXX.pub.3gppnetwork.org, where XXX and YYY are valid MCC and MNC values 7

Active RCS deployments span 67 countries, while a few others are conducting trials

At least one network implements RCS

RCS in trial

8

Agenda

1. Mobile network attack recap 2. Attacks on new technologies 3. Mitigations

9

What attacks are possible in RCS?

Example hacking goal Example method using RCS

Attack scope

Track users Impersonate users Conduct fraud Website DDoS

A Get IP address of victim / verify if user is online B Caller-ID spoofing in calls / messages C Inject traffic / hijack session if victim is behind the same NAT D Send file attachment forcing auto-preview on victim

These hacks should work against many RCS deployments as they do not require secret information about the victim; they do rely on configuration issues in the network

Intercept texts

E Connect to RCS with user credentials or hijack user session

Requires victim's config file or DNS MITM capabilities

10

A User presence and coarse location can be disclosed by replies to SIP OPTIONS requests

Once connected to RCS, a malicious user can collect information about other users by sending the SIP OPTIONS request to sequential mobile numbers

SIP OPTIONS +4917xxx001 1

SIP OPTIONS +4917xxx002

2

SIP reply: user not found

Attacker

SIP OPTIONS +4917xxx003

3

In addition to presence, the response message discloses the local IP of the victim, potentially revealing its location
Mobile operator A

SIP reply: user available

001

IMS RCS

SIP/2.0 200 OK CSeq: 1 OPTIONS

Contact:

<sip:+49xxx01@111.22.33.44:5060;

transport=tls>

Thanks to number portability and commercial agreements between operators, users in other networks can be also paged and later attacked

Mobile operator B

IMS

RCS

SIP reply: user available

003

11

B Missing verification of user supplied heat SBC allows caller-ID spoofing

1

Attacker registers with their own identity

IMS RCS

Attacker

2

Then spoofs another user's identity to make a call

Bob Bob receives a call from Alice's spoofed identity
Alice

1 SIP REGISTER
REGISTER sip:mno.net SIP/2.0 From: <sip:+4917...@mno.net>;tag=291412310 To: <sip:+4917...@mno.net> ......

2 SIP INVITE
INVITE sip:bob@mno.net;phone-context=mno.net SIP/2.0 To: <sip:bob@mno.net;phone-context=mno.net> From: <sip:1337@mno.net>;tag=291412310 P-Preferred-Identity: <sip:1337@mno.net> ......

12

C Traffic injection is possible if victim and attacker share the same public IP address

Attack scenario 1
The attacker and victim are behind the same NAT

User Attacker

1a

User and attacker connect behind the same NAT and share an external IP

VPN Internet

Attack

scenario 2

The attacker

manipulates

User

user traffic

using a

rogue AP

WiFi

X

NAT

Attacker

Attacker identifies 2 the correct PCSCF
by trying all options

1b Attacker controls Internet uplink of victim

-Demo-

PCSCF 1
PCSCF 2

RCS core

User user-1

IP [Ext IP]

PCSCF pcscf 2

In some implementations, attackers can inject messages into the RCS core 3 because users are solely identified by their mobile number and public IP

13

D Automatic media preview of malicious links enables DDoS and sensitive info leaks

RCS can send media content
The Message Session Relay Protocol is used to share files (images, videos, audio) between RCS users. This protocol Bob is similar to SIP and HTTP, and carries content metadata in XML format.

File transfer server
3- SIP/MSRP message including media transfer

Alice

Scenario 1 - Leverage RCS clients to DDoS a website
1. Attacker identifies a large file on a target website
2. Attacker crafts an XML message where the thumbnail URL (indicated as a small file) points to target large file
3. Attacker sends the crafted XML message as a SIP/MSRP message to many thousands of subscribers
4. Each RCS client automatically attempts to download the file overloading the target website

Scenario 2 - User tracking
1. The attacker starts a web server on a public IP
2. The attacker sends an RCS message including preview-able contents hosted on that server
3. The victim attempts to download the content disclosing their IP address

Scenario 3 - Account takeover
1. The attacker conducts the attack as in scenario 2, and collects headers sent by the victim
2. If an RCS session token is included, the attacker can impersonate the victim sending messages and starting calls

14

E Intercept can be achieved abusing RCS signaling in multiple ways

Attack scenario 1
Set call forwardings abusing the XCAP interface
Attack scenario 2
Steal the config file so you can provision on behalf of the victim

Implementation issues (vendor dependent) We found some buggy XCAP implementation that does not properly validate the identity when interacting with the server, thus enabling XCAP settings manipulation
Configuration issues (network dependent) If the XCAP server uses password authentication instead of the secure SIM-based authentication, the password could be brute-forced
1 Malicious apps
2 Mobile hotspot sharing
3 Malicious open WiFi with captive portal
4 Brute force identity/OTP via web

Attack scenario 3
SIP MITM via DNS spoofing

5 Redirect SIP traffic to a rogue P-CSCF

Details in the next slides

15

E 1+2 Malicious app or rogue hotspot can get in the middle of RCS provisioning

Server responds with 200 OK HTTP status code, and includes a valid session ID as cookie in case the IMSI is valid

User

Config server

1 HTTP request including user's IMSI 2b HTTP reply with session ID as cookie

2a

Config server generates an OTP and delivers it to the user via SMS

Binary SMS carrying the OTP

TLS connection

3

HTTPS request including IMSI, OTP and session ID

4 XML config file

Server returns the XML config file if all received information is correct

SMSC

Attack scenario 1 Malicious app
 The app is installed on victim's device  The app uses victim's LTE connection to fetch config file  If the app has SMS_READ permission, it can retrieve
even OTP code, for networks that require it

Attack scenario 2 Mobile hotspot sharing
 Attacker uses victim's LTE connection via hotspot sharing
 Attacker can request config file through victim's connection, and retrieve it

16

E 3 Rogue WiFi can steal victim's config file injecting JavaScript code

3
LTE

User

1

2

Rogue AP

RCS config server
Internet
4
Attacker's server

Attack sequence
11. Victim tries to access a website through a rogue AP
22. The rogue AP retrieves the content of the website requested by the victim and forwards it back injecting malicious JavaScript. Immediately after, the AP pushes back the victim to LTE, terminating the WiFi access
33. The malicious JavaScript code retrieves the RCS config file via LTE connection
44. The malicious JavaScript code uploads the retrieved XML config file to the attacker's server on the internet
-Demo-
17

E 4 Some networks requiring OTP verification are prone to user account brute force

Enumerate IMSIs. Perform GET over 1 HTTP supplying a random IMSI until a 200 is returned

1. Enumerate valid IMSIs
Get cookie (invalid IMSI)

HTTP 40X

Get cookie (valid IMSI)

Attacker

HTTP 200 + Cookie

RCS auto config server

Valid IMSIs found

Brute force OTP.

Quickly perform

2

GET over HTTPS trying all possible

OTP values (up to

6 digits)

1. Enumerate valid IMSIs
Get config (IMSI, cookie, OTP1)

HTTP 40X

Get config (IMSI, cookie, OTP2)

Attacker

HTTP 200 + XML config

RCS auto config server

Correct OTP found

18

E 1-4 Intercept first step: Login using victim's RCS account, activate SMS-over-IP in HSS

1

Steal victim's RCS config file (using any of the 4 methods described in the previous slides)

EPC

User eNB
2 User attaches to the LTE network

MME

User 12345678

HSS/HLR
SMSoverCS Yes

SMSoverIP Yes

Attacker registers to the RCS, announcing the 3 SMS over IP capability in the SIP `Contact'
header

P-CSCF

IMS S-CSCF

Attacker

Internet

User 12345678

Capabilities [+g.3gpp.smsip]

Connection tcp:1.1.1.1:5060

19

E 1-4 Intercept second step: Wait for SMS delivery

As SMS-over-IP is activated,

4 the HLR returns the GT of

the IP-SM-GW for delivery

HSS/

HLR

S-CSCF

P-CSCF

Internet

Attacker

SMSC
submitSM

forwardSM

Sender wants to authenticate user through OTP

The IP-SM-GW forwards the message first via IP. 5 If the delivery fails, the message is delivered as SMS-using-CS fallback

IP-SMGW

OTP is sent as second factor; 6 Both the victim and the attacker
receive the OTP SMS

MSC

MME

eNB

User

-Demo-
20

E 5 Local DNS spoofing enables MITM attacks against default Android RCS implementation

The lack of strict domain matching between initial RCS config parameters and actual TLS certificates allows hackers to fully hijack RCS sessions with any valid SSL certificate

Attacker uses a valid cert for pcscf.attacker.io

Attack sequence
11. Victim's RCS client tries to resolve the IP address of the P-CSCF
22. The rogue AP replies with a fake response that points to a fake P-CSCF controlled by the attacker
33. Victim's RCS client successfully establishes a TLS connection with the fake P-CSCF (valid certificate)
44. The fake P-CSCF transparently forwards all RCS traffic between the victim user and the legitimate P-CSCF

Victim

Rogue WiFi access point

1 DNS: SRV pcscf.operator.com?

2 DNS: 5060, pcscf.attacker.io 3a TLS hello 3b TLS hello (valid cert)

Trusted TLS connection to the attacker
4 SIP REGISTER

Fake P-CSCF

Legitimate P-CSCF

TLS connection to legitimate
P-CSCF

-Demo-
21

Agenda

1. Mobile network attack recap 2. Attacks on new technologies 3. Mitigations

22

MNOs and RCS vendors can mitigate these issues by applying 7 best practices

 Not all RCS deployments are vulnerable to all attacks discussed in this presentation
 We found some networks vulnerable to each of the attacks
 To mitigate attacks, seven countermeasures can improve RCS deployments

Area Client provisioning
RCS services RCS client

Best practice Authenticate using
o SIM / secure element r Use strong OTP
verification codes Apply rate limiting
Validate client identity
Avoid information leakage
Filter uploaded contents
Enforce chain of trust

Implementation details
User authentication should be GBA/BSF based
OTP should be at least 8 alphanumeric characters
Limit OTP validity to 5 minutes and 3 HTTP request attempts
Validate SIP session using state (e.g. source IP, cookie, ...)
Strip sensitive information from SIP requests
Check/restrict content-type and size provided by clients
Connect only to trusted domains, validate certificates

Affected components RCS configuration server RCS configuration server RCS configuration server, SBC/P-CSCF
SBC/P-CSCF
SBC/P-CSCF, RCS client
SBC/P-CSCF, FT server
RCS client, DNS

23

Take aways

1 Telcos and mobile vendors are moving all communications to IP protocols
2 New technologies are often poorly implemented and vulnerable to old attacks
3 Weak user authentication can expose RCS clients to intercept and impersonation risks
4 Security best practices should be applied and verified to new telco technologies

Questions?
Luca Melette <luca@srlabs.de>, Sina Yazdanmehr <sina@srlabs.de>
24

