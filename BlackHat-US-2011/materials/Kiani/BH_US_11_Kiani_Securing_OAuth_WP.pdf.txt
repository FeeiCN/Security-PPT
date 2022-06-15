Black  Hat  US  2011    
khash kiani khash@thinksec.com
OAuth
securing the insecure

roadmap
 OAuth flow  malicious sample applications
 mobile OAuth google app  web-based OAuth facebook app
 insecure implementation
 flawed session management  password management  insecure storage of secrets
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

building malicious OAuth clients
(native and web apps)
7

password theft with Google client
(a native iOS mobile app)
8

OAuthSampleTouch mobile Google app
 download  compile  run
 edit controller
9

modify the UIWebViewDelegate's:
webView:shouldStartLoadWithRequest:navigationType
callback method to intercept the login page prior to sending the
post request
10

OAuth process with an embedded view
user authenticates and grants permission
11

output the Google credentials
12

"but it looked so official!"
OAuth provides the user with a false sense of safety in the authentication workflow
13

recommendations
(mobile apps)
 client application developers: keep authentication outside the app and inside the browser
 users: do not trust clients that do not use a trusted neutral application such as safari to manage server auth
 protocol designers: stricter policies around authenticating clients to server. better browser API support
14

fortune telling facebook app
(a browser-based web application)
a social engineering oauth application to establish user trust
15

lure the victim to use your app
domain apps.facebook.com is trustworthy!
phish
easy!
16

https://apps.facebook.com/redevilfortune/
access scope
17

70%
* source: core impact client-side phishing campaign
18

query private user messages
read the inbox
messages
19

build the trap to aid exploitation
link to execute ajax post and carry our CSRF
20

"but it looked so official!" OAuth provides the user with a false sense of safety in the authentication workflow
21

Dear Facebook, what is the business need for a web application to read my private messages?
22

Insecure Implementation
23

flawed session management
24

Avon selects twitterfeed to publish something
25

- Avon is redirected to twitter's authorization endpoint - Avon enters his twitter credentials and grants access
26

- Avon is redirected back to complete the feed - Avon signs out of twitterfeed and walks away
27

what about his twitter session?
28

29

risks
 unattended session  no session timeout  user remains logged in
30

what can go wrong?
31

32

33

problem, meet solution
 invalidate server session  short-lived access token  no auto-processing
34

a better approach
35

can you really change your password?
36

37

change password = old password still works!
38

39

solution
 ensure compromised credentials cannot be used  revoke tokens upon password changes
- results from facebook access token leakage to 3rd party apps
40

insecure storage of secrets
(consumer credentials)
41

1.      public  class  TwitterClient  {     2.               3.              private  static  String  key  =  "qSkJuxxxxxxxx76A";     4.              private  static  String  secret  =  "Bs738xxxxxxxxxxxxxxZe9EhXw";  
42

server-side
 isolate the credentials  protect the integrity
43

native clients
 native mobile app  desktop apps
44

"... if twitter uses the client secret in installed applications for anything other than gathering statistics, well, they should reconsider." "So forget about using the consumer credentials for anything other than somewhat reliable statistics."
- e. hammer lahav
45

how about these use cases:
 fulfill specific business requirements
- server must keep track of all clients
 prevent phishing attacks
46

popular implementations
(native apps)
1. omit the client credentials entirely 2. embed in the client app itself
47

threat
(with embedded client credentials)
 compromised credentials
48

open source clients
 source code  resource bundle
49

the not so secret consumer secrets
50

51

closed source clients
 binary extraction on android oauth client:
 astro file mgr to copy the client app  poke around  classes.dex  "dexdump classes.dex
52

compromised credentials
impact:
 key rotation and kill switch  not meeting business requirements  anonymous publication by competition  susceptible to phishing attacks
53

alternative mitigation
 a deviated approach with automated provisioning
54

alternate flow
(mobile)
 authenticate user to client's web server  call home to get device id  store device id locally  proceed with oauth flow to get request token  validate device id to authenticate client  proceed with the flow to grant access token
55

56

conclusion
- defeating password anti-pattern - trusting native mobile apps
- don't trust the logo - don't trust the domain - session & pswd management - client authentication - consumer credentials - implementation, not protocol
57

take-away:
use it when it makes sense!
58

please turn in your completed feedback form at the registration desk
THANK YOU!
khash@thinksec.com
59

