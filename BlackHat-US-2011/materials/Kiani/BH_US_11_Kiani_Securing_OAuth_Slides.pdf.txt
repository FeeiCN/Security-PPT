Black  Hat  US  2011    
khash kiani khash@thinksec.com
OAuth
securing the insecure

roadmap
 OAuth flow  insecure implementation
1. insecure storage of secrets 2. evil mobile and web OAuth apps 3. flawed session management 4. password reset
 summary
2

what's OAuth?
3

user-centric scheme
user controls authorization

FM Token

AIG Token

user

Twitter Token

Twitter Token
4

actors:
resource owner (user) resource consumer (client) resource provider (server)
tokens:
consumer credentials request token access token
5

authorization flow
1. client app authentication 
 2. get request token: POST oauth/request_token 
 3. authenticate user: GET oauth/authorize 
 4. get access token: POST oauth/access_token 

6

Insecure Implementation
7

insecure storage of secrets
(consumer credentials)
8

OAuth flow
step 1: register client
9

1.      public  class  TwitterClient  {     2.               3.              private  static  String  key  =  "qSkJuxxxxxxxx76A";     4.              private  static  String  secret  =  "Bs738xxxxxxxxxxxxxxZe9EhXw";  
10

server-side
 isolate the credentials  protect the integrity
11

native clients
 native mobile app  desktop apps
12

"... if twitter uses the client secret in installed applications for anything other than gathering statistics, well, they should reconsider." "So forget about using the consumer credentials for anything other than somewhat reliable statistics."
- e. hammer lahav
13

how about these use cases:
 fulfill specific business requirements
- server must keep track of all clients
 prevent phishing attacks
14

popular implementations
(native apps)
1. omit the client credentials entirely 2. embed in the client app itself
15

threat
(with embedded client credentials)
 compromised credentials
16

open source clients
 source code  resource bundle
17

the not so secret consumer secrets
18

19

closed source clients
 binary extraction on android oauth client:
 astro file mgr to copy the client app  poke around  classes.dex  "dexdump classes.dex
20

compromised credentials
impact:
 key rotation and kill switch  not meeting business requirements  anonymous publication by competition  susceptible to phishing attacks
21

suboptimal solutions
 client secret obfuscation (ProGuard for Android)
 ProGuard for Android: Don't put sensitive info in XML resource files!
 negotiate credentials with your backend server
 what will stop a rogue client?
22

alternative mitigation
 a deviated approach with automated provisioning
23

alternate flow
 authenticate user to client's web server  call home to get device id  store device id locally  proceed with oauth flow to get request token  validate device id to authenticate client  proceed with the flow to grant access token
24

25

building malicious OAuth clients
(native and web apps)
26

password theft with Google client
(a native iOS mobile app)
27

OAuthSampleTouch mobile Google app
 download  compile  run
 edit controller
28

modify the UIWebViewDelegate's:
webView:shouldStartLoadWithRequest:navigationType
callback method to intercept the login page prior to sending the
post request
29

OAuth process with an embedded view
user authenticates and grants permission
30

output the Google credentials
31

"but it looked so official!"
OAuth provides the user with a false sense of safety in the authentication workflow
32

recommendations
 client application developers: keep authentication outside the app and inside the browser
 users: do not trust clients that do not use a trusted neutral application such as safari to manage server auth
 protocol designers: stricter policies around authenticating clients to server. better browser API support
33

fortune telling facebook app
(a browser-based web application)
a social engineering oauth application to establish user trust
34

lure the victim to use your app
domain apps.facebook.com is trustworthy!
phish
easy!
35

https://apps.facebook.com/redevilfortune/
access scope
36

70%
* source: core impact client-side phishing campaign
37

query private user messages
read the inbox
messages
38

build the trap to aid exploitation
link to execute ajax post and carry our CSRF
39

assumptions
 victim has an active session with his banking site  no CSRF protection by banking site
!
40

"but it looked so official!" OAuth provides the user with a false sense of safety in the authentication workflow
41

Dear Facebook, what is the business need for a web application to read my private messages?
42

flawed session management
43

Avon selects twitterfeed to publish something
44

- Avon is redirected to twitter's authorization endpoint - Avon enters his twitter credentials and grants access
45

- Avon is redirected back to complete the feed - Avon signs out of twitterfeed and walks away
46

what about his twitter session?
47

48

risks
 unattended session  no session timeout  user remains logged in
49

what can go wrong?
50

51

52

problem, meet solution
 invalidate server session  short-lived access token  no auto-processing
53

a better approach
54

can you really change your password?
55

56

change password = old password still works!
57

58

solution
 ensure compromised credentials cannot be used  revoke tokens upon password changes
- results from facebook access token leakage to 3rd party apps
59

conclusion
- defeating password anti-pattern - implementation, not protocol - private vs. public APIs - open vs. closed source clients - keep callback url intact - trusting native mobile apps
- don't trust the logo - don't trust the domain
60

take-away:
use it when it makes sense!
61

please turn in your completed feedback form at the registration desk
THANK YOU!
khash@thinksec.com
62

