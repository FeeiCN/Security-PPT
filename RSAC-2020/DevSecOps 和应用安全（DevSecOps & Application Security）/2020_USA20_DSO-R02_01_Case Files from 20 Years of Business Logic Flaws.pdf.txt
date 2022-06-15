SESSION ID: DSO-R02
Case Files
from 20 Years of Business Logic Flaws

Chetan Conikee, CTO
#RSA C

#RSAC
Security Issues
Two broad categories
 Vulnerabilities that have common characteristics across different applications
 Design Flaws that are specific to the application or business domain

#RSAC
Vulnerabilities

Implementation problems in code

attack

Source

auth

validation

Sink

[read input]

[security sensitive function]

 Improper API usage patterns, e.g. malloc without free,  Lack of input validation, leading to injections, buffer overflows
etc.  Lack of access controls, which may lead to confidential
information being leaked, altered or denied access to.

#RSAC
Flaws
Misuse of application by circumventing business rules

attack

Source

auth

step

Sink

bypass
 Abuse functionality  Manipulate parameter(s)  Bypass or side step workflow

#RSAC
FLAWS

FLAWS

#RSAC

Source of Flaws

 High velocity development  Poor documentation and testing  Security not a part of early design process  Lack of automated checks in CI pipeline  Lack of architectural risk analysis to identify
attack resistance, ambiguity and weakness in software design

FLAWS

#RSAC

OWASP Categorization (WIP)

Business Consistency Security Verification Code Breakthrough Business Authorization Security Business Process Out of Order Business Interface Invocation

Aging Bypass Testing Identity Authentication security Retrieving Password vulnerabilities Business Data Tampering Users Enter Legality

FLAWS (Example: Paying less for more items)

Attacker Session-1 Session-2

Login

Store

Add Item(s) the Checkout Create unique Token

Authorize Payment (token) [Token, PaymentId] Ship Items

concurrent session

Login (new session) Add Item(s) the Checkout
Reuse [Token, PaymentId] Ship Items

Cash-as-Service

#RSAC

Initiate low cost transaction using normal workflow. Intercept request and capture [TOKEN,
PAYMENTID]
Login using another browser (new
session) and initiate new transaction,
side-step auth phase and, reuse [TOKEN,
PAYMENTID]

FLAWS (Example: Paying less for more items)

#RSAC

 Is meta-data (cost,quantity,user,session) mapped to a payment transaction token.
 Is an authorization/capture unique to a userId?
 Is an authorization/capture unique to a session scope belonging to same userId?

#RSAC
EXPL ITING
FLAWS

EXPLOITING FLAWS
Adversarial Mindset

Choose a target business

Discover functionality by spidering domain

Manipulate parameters and
repeat

Analyze traffic by proxy interception

#RSAC
Identify points of interest  REST APIs  Web Forms (+fields)  Registration forms  Tokens, Hashes and parameters exchanged between requests  Password Recovery  Out of band channels

EXPLOITING FLAWS

#RSAC

An Attacker's Toolchain (Burp)

Interceptor -> Choose Target and Intercept via proxy

Repeater -> Automate parameter manipulation and observe response(s)

EXPLOITING FLAWS

Weaponizing Flaws

Observe Abuse
Functionality
Observe Information Leakage
Observe Predictable
Resource location

Enumerate Weak password
recovery
Enumerate Insufficient
Authorization

Exploit Workflow bypass
Exploit

Critical parameter manipulation

#RSAC

EXPLOITING FLAWS

Weaponizing Flaws

Observe
Abuse Functionality

Observe
Information Leakage

Pivot

Observe
Predictable Resource location

Enumerate Weak password
recovery
Pivot Enumerate
Insufficient Authorization

Exploit Workflow bypass
Exploit

Critical parameter manipulation

#RSAC

EXPLOITING FLAWS

#RSAC

Weaponizing Flaws - Case 1 (Bidding)

Observe
Abuse Functionality

Participate by bidding on item in online auction portal

Observe
Information Leakage

Enumerate
Weak password recovery
Minutes before bid ends, attacker initiates brute force password recovery attack on all fellow bidders & wins bid at lowest price

Exploit

During bidding process, system exposes username and email of fellow bidders
on screen

Wins BID by locking fellow bidders

EXPLOITING FLAWS

#RSAC

Weaponizing Flaws - Case 2 (Finance)

Observe
Abuse Functionality
Initiate transaction and receives email after transaction is fulfilled

Insufficient Authorization

Observe
Predictable Resource location
Email contains site link to view Transaction details and transactionId is a predictable sequence

Data exfiltration
Attacker increments/decrements sequence and views details of others customers via link in email without authentication
Critical parameter manipulation Exploit

EXPLOITING FLAWS

#RSAC

Weaponizing Flaws - Case 3 (SaaS)

Enumerate

Insufficient Authorization
Enumerate business domain to discover
HIDDEN URLs

Exploit

Observe
Predictable Resource location

information is used to buy or sell stocks ahead of the news
release.

Discovered Hidden webpage created for future news release and URL is based on the date.

#RSAC
CASE FILES

CASE FILES

Bypass 2FA
Source : https://hackerone.com/reports/128085

Attacker login with valid account (with 2FA enabled)
2FA validation
OST /users/sign_in HTTP/1.1 user[otp_attempt]=145637 user[login]=attacker_valid_creds

.. OK

OST /users/sign_in HTTP/1.1 user[otp_attempt]=145637 user[login]=another_valid_user
Attacker signed in as valid user without authentication

.. OK

#RSAC

CASE FILES

Free Rides
Source : https://hackerone.com/reports/574638

#RSAC

Lack of proper paymentProfileUUID validation allows any number of free rides without any outstanding balance

(Attacker) Request a ride

Add 3 random characters at end of
paymentProfileUuid

Intercept the request

1. Ride disappears from Rider`s and Driver`s trip history
2. Rider is not charged and Driver will not be paid

CASE FILES

#RSAC

Hacking forgot password workflow

Source : https://eng.getwisdom.io/hacking-github-with-unicode-dotless-i/

Password reset attempt (Impersonating another user with
unicode character embedded)
Password reset email delivered to attacker leading to Account takeover

Unicode Case Mapping collision leads to Password reset email delivered to the wrong address

CASE FILES

#RSAC

Availing Premium tier for free

Source : https://hackerone.com/reports/219356

SignUp for NewRelic FREE service

Change `READONLY` to `ADMIN' and `BASIC' to `PROFESSIONAL'

Intercept the request
HTTP/1.1 200 OK {"data":{"currentUser":{"userData":[ {"userLevel": ADMIN,
"subscriptionLevel":" PROFESSIONAL"} ] }}}

By switching `userLevel` to `ADMIN' and `subscriptionLevel` to `PROFESSIONAL` , he was able to avail professional features at cost of freemium

CASE FILES

#RSAC

Buy items for less than intended price

Source : https://hackerone.com/reports/614523

Login and add item(s) to cart

Change CANCELLATION_AMOUNT to 0

Intercept the request
HTTP/1.1 200 OK {... {...
"cancellation_amount":0} ] }}}

Changing CANCELLATION_AMOUNT to 0 reduces ORDER_AMOUNT and cancels all previous cancellation amounts

CASE FILES

#RSAC

Race Condition to get free stuff and steal money
Source : https://hackerone.com/reports/759247

Login and buy a gift card

Redeem Gift Card

Concurrent Requests

Intercept the Request and send to
turbo intruder

More money added to gift card that actual worth

CASE FILES

#RSAC

Total price manipulation using -ve quantity

Source : https://hackerone.com/reports/364843

Order Request JSON Object containing an additional item with negative quantity manipulates total item of order

Significantly reduce price of order

#RSAC
Attack AUTOMATION

LEVERAGING OPEN SOURCE

#RSAC

Tools that hackers can leverage

LEVERAGING OPEN SOURCE

#RSAC

Tools that hackers can leverage

LEVERAGING OPEN SOURCE

#RSAC

Tools that hackers can leverage

LEVERAGING OPEN SOURCE

#RSAC

Tools that hackers can leverage

LEVERAGING OPEN SOURCE
Burp Autorize
plugin

Burp AutoRepeater
plugin

Intercept

repeat

#RSAC

FuzzDB

SecLists

#RSAC
Dete ting
FLAWS

DETECTING LOGIC FLAWS

#RSAC

Can automated scanners detect logic

flaws?

 Logic flaws are NOT pattern based
find . -regex "[logic pattern]"
 Need to  Understand the business domain  Understand multi stage workflow/events and test if it can be manipulated

DETECTING LOGIC FLAWS

#RSAC

Defender mindset

Model the application navigation graph

Tag source, sinks and outbound channels
in application

Conduct data flow tracking from source
to sink

 Verify parameter and route naming convention against fuzzDB
 Identify all data flow paths influenced by critical parameters
 Identify points of resource exposure (IDOR)
 Identify logger/exception channel for exposure

DETECTING LOGIC FLAWS

#RSAC

 Document every aspect of your application design thoroughly
 Introduce Security Review and Analysis in early stages of architecture and development
 During Security Review reflect on every assumption made in design

DETECTING LOGIC FLAWS

#RSAC

Understand your application design

Application Logic

Trusted Third Party Identity service

API/Endpoints

Payments service

Notification/Analytics service

AVOIDING LOGIC FLAWS

#RSAC

 Detect endpoints/parameters that user/attacker can control
 Detect combinations of parameter(s) that impact flow in code (in and across services)
 Infer relationships between parameters  Identify data that can be manipulated

THREAT MODELING (IDENTITY PROVIDER)

#RSAC

User

Browser

Identity Provider

Visit URI_SaaS

GET/POST URI_SaaS_Si Redirect to AUTH_REQUEST (URI_SaaS)

Enter Credentials

Login Form Consent

AUTH_ASSERT(token) + Redirect(URI_SaaS_Si)

Resource (URI_SaaS_Si)

Your SaaS

THREAT MODELING (PAYMENTS PROVIDER)

#RSAC

User

Browser

Payments Provider

Your SaaS

Visit URI_SaaS CheckOut Credentials

GET/POST URI_SaaS Shopping Cart
Get URI_PayP MerchantID, Cost, Redirect_URRI (URL_SaaS)
Authorize

Redirect(URI_SaaS, TransactionID) (TransactionID, Secret) Transaction Details
You Purchased Item(s)

AVOIDING LOGIC FLAWS

#RSAC

 Detect if session token be repurposed across users (no affinity to user)
 Detect if individual steps in a multi step workflow be accessed directly  Running single step multiple times  Skipping steps  Running steps out of order

FINISH

#RSAC

