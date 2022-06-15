SESSION ID: SPO2-W12
Designing for API Doomsday

Josh Shaul
VP Web Security Akamai Technologies

#RSAC

#RSAC
Why Are We Here? Because APIs Are Everywhere.

Web APIs are becoming the center of

every digital experience

­ Mobile apps run on web APIs

­ Web sites and applications rely on APIs for

core functions (ex. login)

­ Modern, microservices-based architectures rely on APIs for communications

API

­ APIs power multiple user experiences

­ Web APIs can be required by regulators

(ex. PSD2 / Open Banking in the UK)

­ Web APIs can be very attacker friendly....

2

#RSAC
WWhoyrldA'rseBWigegeHsetrDea?tBaeBcraeuascehDesat&a HThaeckftsIs Still Rampant.
Source: https://informationisbeautiful.net

#RSAC
Web APIs: High Expectations and Broad Challenges

Business
Speed up Innovation Improve Service Stability Drive Mobile Adoption Unlock New UX's Improve Customer Sat.

Attacker
Back Door Access Data Theft / Modification Denial of Service Lower Cost to Attack

Legitimate user
Quota Enforcement AuthN / AuthZ Unpredicable load

Let's Have a Look at the Internet and See what we can Observe

#RSAC
Growth of Web API Use: 2014 through 2018

100% 90% 80% 70% 60% 50% 40% 30% 20% 10% 0%

Web Hits by Content Type
26% 6%
69% 14%

54%

14%

17%

2014

2018

Text / HTML Text / XML App / XML Source: Akamai ESSL Network, SOTI Q1 2019

App / JSON

83% API calls now dominate

API

overall web hits

#RSAC
Things On The Internet Make The Majority Of API Calls

Source: Akamai SOTI Q1 2019

About 1/3rd of Web API calls come from browsers.
The other 2/3rds come from mobile phones, gaming consoles, smart TVs, etc...
66%
This is a huge challenge!

#RSAC
Web APIs Are A Primary Target For Attackers Today
4X
more Credential Stuffing attacks on APIs

Web sites & Web APIs share the same (old) attack vectors ­ but
APIs are often unprotected

APIs are more performant and less expensive to attack compared with traditional web forms

Let's Examine Some Real World Attacks

#RSAC
Example #1: Distributed Denial of Service (DDoS)
"It's a little more challenging to identify these kinds of automated, highbandwidth types of attacks against an API when the whole point is everybody goes faster and gets data faster." Source: API Security Trends for 2018
Traditional request-rate-based controls are hard: Need to validate API keys and track quotas to identify legit traffic
Positive security / Input validation is hard: The realm of possibilities for a legit request can be very large
Understanding who and what to trust in a SaaS world is hard: Trusted partners can be abused to cause unexpected harm

#RSAC
API Exposure Can Be Amplified By Business Ecosystems

Response

Request

Origin SaaS Partners User

Response

Request

API requests are within limits, all apps and SaaS partners perform

#RSAC
API Exposure Can Be Amplified By Business Ecosystems
Request
Origin SaaS Partners DoS Attack
Flood of requests to distributed SaaS partner(s) May drive a tsunami of requests to centralized origin (that's usually bad)

#RSAC
Back To Example #1: Media Distribution Ecosystem DDoS
Victim #1 is a media company who leverages SaaS partners to adapt and distribute their video content online For security purposes, content owner (victim) performs all AuthN and AuthZ centrally in their own systems / data center

Content Owner
User DB
Content

authentication
copied

SaaS Partner
Content

authentication

#RSAC
Example #1: A Request and Retry Storm

Attacker uses botnet to request videos from content distributors

AuthN and AuthZ requests and retries overwhelm the origin

All end user access to content (regardless of distributor) is blocked

SaaS Partner

SaaS Partner

SaaS Partner

Content Owner

User DB
Content

AuthN/AuthZ
copied

SaaS Partner SaaS Partner
SaaS Partner

Content

AuthN/AuthZ

#RSAC
Example #1: Request Volume Experienced At Origin

Botnet attack! Additional ~1200 req/sec

Normal user traffic ~100 req/sec
several day period

Peak user traffic ~500 req/sec

#RSAC
Example #1: Lessons Learned

Distribution and scaling strategies fail at bottlenecks

Attackers will exploit architectural weaknesses to cause havoc

Mitigations applied:

­ WAF: Stop malformed reqs

­ Bot Management: Block bots

­ WAF: Rate controls by API key

­ API Gateway: API key

SaaS Partner

assignment and quota

Content

enforcement

Content Owner

Gateway WAF
WAF
SaaS Partner

WAF

WAF
SaaS Partner

SaaS Partner
Content

Content

Content

#RSAC
Credential Stuffing On An API Looks A Lot Like DDoS
With clients that don't render JavaScript a lot of the typical credential stuffing defenses just don't work. Aggressive botnets will overwhelm origin with login requests
28 billion
credential stuffing attempts in 8 month
(Observed on Akamai Intelligent Edge Platform, 2018) Source: Akamai SOTI 1Q19
17

#RSAC
Example #2: What's In Your API Response?
Developers often make assumptions that systems will be used as intended....."Only my mobile app will call my API"

Simple order request to order entry APIs

curl https://api.orderinput.com/v1/sku\ -u sku_4bC39lelyjwGarjt:\ -d currency=usd\ -d inventory [type]=finite\ -d inventory[quantity]=500\-d price=3\ -d product=prod_BgrChzDbl\ -d attributes[size]=medium]

API response includes some interesting data

http 200 OK https ://success.api.orderinput.com/v1/sku
-id order_number=14586

#RSAC
Example #2: What's In Your API Response?
It is rare for developers to consider attack scenarios, especially non-traditional ones....."Sequential order numbers makes sense"
But what if I submit subsequent orders over time and various geographies?
http 200 OK https ://success.api.orderinput.com/v1/sku
-id order_number=23697

#RSAC
Example #2: But Why?
Honestly - We don't know. Same store sales data?
Competition? Investor?

#RSAC
Example #2: Lessons Learned
API responses can contain valuable information Restrict access to Web APIs to authorized apps only Mitigations applied:
­ Order number randomization ­ Mobile app authentication

#RSAC
Example #3: You Put Your What? Where!?!

CI/CD processes have developers moving faster then ever

Developers use GitHub to share example code with others

Sensitive data can be accidentally disclosed
GitHub
Code Sharing

Microservice
Microservice API

IT

Ops Dev

Microservice
Microservice API

#RSAC
If You've Got Web APIs, I Can Find Them

Fierce is a domain discovery tool
Step 1
Scanning for typical hostnames

Step 2
Reverse lookup +/- 10 IP Addresses

Hostnames auth. api. developer. download.

IP Addresses xxx.xxx.xxx.xxx xxx.xxx.xxx.xxx xxx.xxx.xxx.xxx xxx.xxx.xxx.xxx

List of Hostnames to attack

#RSAC
If You've Got Sensitive Data (On GitHub) I Can Find It
Gitrob Sensitive Data Search for for Github

Search by organization
Flag interesting files: Private Keys, usernames, emails, internal system info, etc...

Source: https://michenriksen.com/blog/gitrob-putting-the-open-source-in-osint/

#RSAC
Example #3: You Put Your What? Where!?!

Sample code posted on Git Sensitive API Keys were included in the sample Attackers leveraged the API Keys to gain unauthorized access

GitHub
Code Sharing

Microservice
Microservice API

IT

Ops Dev

Microservice
Microservice API

Example #3: Lessons Learned
Careful code sharing API Inspection & Validation Mitigations Applied:
­ API Gateway: Dynamically assign and easily revoke API Keys
GitHub
Code Sharing

IT

Ops Dev

#RSAC
Microservice Microservice
API Microservice Microservice
API

#RSAC
Develop An API Protection Plan Today
Next week you should:
­ Assess your API ecosystem and identify potential security risks
In the first three months following this presentation you should:
­ Understand who is accessing your APIs from where and how ­ Define appropriate API security measures
Within six months you should:
­ Select a security solution which allows proactive API protection tailored to your organization's needs
­ Drive an implementation project to protect all public and private APIs
27

Thank you !

