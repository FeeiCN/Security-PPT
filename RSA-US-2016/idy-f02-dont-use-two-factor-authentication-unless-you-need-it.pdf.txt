#RSAC
1

#RSAC
Obama says use two factors...
https://nakedsecurity.sophos.com/2016/02/12/obama-says-passwords-arent-strong-enough-urges-use-of-2fa/
2

#RSAC
Progress = Obliviousness
2FA = two-factor authentication
3

#RSAC
Authentication tradeoffs...
4

#RSAC
Protect your money!
Issued guidance in 2005 entitled "Authentication in an Internet Banking Environment"
"... the techniques employed should be commensurate with the risks associated with the products and services offered "
Source: https://www.ffiec.gov/pdf/Auth-ITS-Final%206-22-11%20(FFIEC%20Formated).pdf
5

#RSAC
What is Trust Elevation?
6

#RSAC
Agenda
Background on authentication technology: where are we today? Deep Dive into OAuth2: what features does it have to support Trust Elevation Trust Elevation across domain boundaries
GOAL: Make you aware of some of the challenges we face to enable Trust Elevation
7

#RSAC
What is Multi-Factor Authentication?
NIST defines this as two or more of ...
Something you know Something you have Something you are
Source: http://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-63-2.pdf
8

#RSAC
Risk Scores
9

#RSAC
Contextual Combinations Complicate
Is the IP address a known hacker? Was the device rooted? Is a
browser cookie present? Is the device running virus protection? Is
the location recognized? When was credential issued? What is the
time of the day?
10

"...every scheme does worse than passwords on

#RSAC

deployability"

http://research.microsoft.com/pubs/161585/QuestToReplacePasswords.pdf
11

#RSAC
OAuth2 will make 2FA more "deployable"
No "one-offs"
Applications should use Standard API's for authentication and Trust Elevation!
Good Intro to OAuth2:
http://nordicapis.com/api-security-oauth-openid-connect-depth/
12

#RSAC
Enter OAuth2

i.e. API's

i.e. Secure Token Service
i.e. Website or mobile app
13

OpenID Connect

TOKEN

TOKEN

14

#RSAC
Resource Server = user_info API To call this API, you need an Access Token

#RSAC
Importance of Audience

BEFORE

AFTER

https://hanszandbelt.wordpress.com/2015/12/14/the-importance-of-audience-in-web-sso/

15

OpenID Connect:

#RSAC

Client Registration, Discovery too!

http://openid.net/connect

16

#RSAC
Overview of Authorization Code Flow
Relying Party (RP) redirects person to OpenID Provider (OP) for authorization
Authentication happens only once!
OP returns code to RP RP uses code to get tokens from OP RP uses access token to obtain user claims from /user_info API: {"given_name": "Mike", "family_name": "Schwartz"}
17

#RSAC
OpenID Connect id_token

{ "iss": "https://server.example.com", "sub": "248289761001", "aud": "3214244", "iat": 1311195570, "exp": 1311281970, "auth_time": 131195001, "acr": http://example.com/basic_bio" "amr": [`eye', `pwd', `12'] }
18

Information about authentication event

#RSAC
ACR and AMR
How does the app know what kind of authentication happened?
19

#RSAC
OpenID Provider Discovery
GET host + /.well-known/openid-configuration
20

#RSAC
OpenID Dynamic Client Registration
21

#RSAC
Authentication Request
In the request, acr_values is actually a space delimited string...
22

#RSAC
id_token

{

"iss": "https://server.example.com",

"sub": "248289761001",

"aud": "3214244", "iat": 1311195570, "exp": 1311281970, "auth_time": 131195001,

Returned id_token confirms acr and amr
values

"acr": http://example.com/basic_bio"

"amr": [`eye', `pwd', `12']

}

23

#RSAC
App Policy
GET https://example.com/finance
Just an example... using OpenID Connect alone, you could require a certain
type of authentication
24

Best Practice:

#RSAC

Centralize Policy Management

25

UMA

#RSAC
Protect any API: require an RPT Token
26

UMA In 60 seconds

#RSAC
Client Calls API without RPT Token RS obtains Permission Ticket from AS and returns it to Client Client presents ticket to AS AS evaluates polices. If ok, issues RPT token (bearer) Client calls API with RPT Token RS introspects Token: if ok, returns content
27

Subtle difference...

#RSAC

Scope references policy

Scope based access: Level of abstraction that enables the central policy decision point to decide which
acr is required
28

#RSAC
What kind of policies can you make?
29

#RSAC
Elevating Trust using UMA
You are Forbidden because you need
acr...
30

#RSAC
Re-Authenticate!
31

#RSAC
Part III: Intedomain trust elevation
Infrastructure and security is not (usually) basis for competition between firms in the same industry.
32

#RSAC
SAML Federations
Normalize legal/technical
33

#RSAC
Many SAML Federations publish user schema.
http://www.incommon.org/federation/attributesummary.html
34

#RSAC
OAuth2 schema: not just user claims...
35

#RSAC
Collaboration on ACR / AMR values
So what values should we use for amr and acr?
This IETF draft defines some AMR's... but its inadequate https://tools.ietf.org/html/draft-jones-oauth-amr-values-05
36

ACR alignment

#RSAC
Domains need to collaborate on the values for acr's and amr's

37

#RSAC
OTTO ­ Kantara Initiative Work Group
Open Trust Taxonomy for OAuth2
http://kantarainitiative.org/confluence/display/OTTO/Home
38

#RSAC
SAML federations
39

#RSAC
OAuth2 has new entities and new jargon
40

#RSAC
Where do we need federations
41

#RSAC
Summary
We don't lack ways to identify people, but we lack agreement on the relative strength of these mechanisms. OAuth2 enables centralized risk based trust elevation, driving down the cost of deployment--the main impediment to 2FA adoption. To enable trust elevation across domains, federations are needed.
42

#RSAC
Action items
Don't limit your planning to two-factor authentication. Make a plan for trust elevation! Start architecting your applications to leverage central policy decision point--not for all fine grained authorization, but for key security escalations. If you work in an ecosystem, consider collaborating (even with your competitors) to drive down the cost of security.
43

#RSAC
44

