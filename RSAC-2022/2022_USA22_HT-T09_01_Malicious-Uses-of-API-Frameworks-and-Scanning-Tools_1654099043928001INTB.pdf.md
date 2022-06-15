#RSAC
SESSION ID: HT-T09
Malicious Uses of API Frameworks and Scanning Tools
Jason Kent
Hacker in Residence Cequence Security

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Who Am I

Jason Kent Jason.kent@Cequence.ai linkedin.com/in/n0handle

20+ Years of Application Security focus Garage Door Opener API Kasa Security Camera API AppSec Tools OWASP, ISSA, etc...

3

#RSAC
Let's look at the breaches that have occurred.
Who is making the news?

#RSAC
Significant API Breaches...

Peloton allows access to all rider's data.

Brewdog allowed one person to use another patron's rewards coupons.

Smart Door Locks are an easy target, privilege escalation via API.

And many more...

5

#RSAC
Where are we in Global API Security Maturity
Maybe not your organization but the overall trend.

#RSAC
API Security History
Code Reviews Static Analysis Penetration Testing Dynamic Analysis Shift Left, DEVSECOPS, etc...
7

#RSAC
Challenges For Traditional API Security Tools
"Scanners"
­ APIs don't have HREFS ­ APIs don't have sitemaps ­ Where can the scanner learn the application endpoints?
Inline
­ Automatic Discovery ­ Automatic Analysis
8

#RSAC
Tools and humans need a map, documentation, if you will.
Let's look at some examples.

#RSAC
API Security Documents

API DOCUMENTATION

API DEFINITIONS

API SPECIFICATIONS

10

API Documentation

#RSAC
Consumed by humans, usually developers Typically includes:
­ Getting started ­ Tutorials ­ Syntactically correct calls ­ Code samples for various languages
Needs to be actively maintained and up to date
11

API Definition

#RSAC
Consumed by machines and automated systems -- not humans.
https://nordicapis.com/difference-apidocumentation-specificationdefinition/
Can be used to configure API Gateways, for example.
12

#RSAC
API Specification
The API Spec explains how the API behaves. Identifies:
­ Objects ­ How to call objects ­ What objects do
DAST scanners can consume this data.
13

#RSAC
How can I protect my APIs from being easily found by attackers?

#RSAC
The Attack Chain and API Specifications
Find a public API Find API documentation Read the spec Test for vulnerabilities Instrument the attack
15

#RSAC
Finding YOUR Public APIs
APIs.guru Programmableweb.com Web/Mobile Application Instrumentation ­ Reverse Proxy Partner programs/3rd party integration DNS searches APK mining Cracking
16

#RSAC
A Quick Aside on Cracking.org
This is a host for OpenBullet and SentryMBA configs. If a config for your company is on this page, your APIs are under attack Use it to your advantage
­ Step one: analyze it to see what the attack does.
­ Step two: analyze traffic on the endpoints listed to ensure they aren't getting through.
17

#RSAC
Found the public API, let's find out if it has a spec.
Manual or Automatic?

#RSAC
Manual Analysis ­ Difficult and Repetitive
/api/docs /api/v1/docs /api/shareddocs /rest_config /v3/api-docs/swagger-config /api/swagger https://raw.githubusercontent.com/tan anaev/traccar/master/swagger.json
19

#RSAC
Kiterunner From Assetnote
OpenSource AIO tool for finding APIs, specs and vulnerabilities.
­ Attackers are using it too ­ Use it to your advantage - see
what they may see ­ Take steps to shrink your blast
radius
https://labs.assetnote.io/tool/release/2021/04/05/contextual-content-discovery.html
20

Kiterunner - Wordlists

#RSAC
Gigs of wordlists Generated using BigQuery against GitHub Uses "config files" in the form of additional wordlists for finding specs
https://wordlists.assetnote.io/
21

#RSAC
What to Protect so you Aren't a Target
The obvious endpoints are those with API subdomains {api.example.com} Do you have common endpoints?
· {api.example.com/swagger.json} · {api.example.com/graphql} · {api.example.com/healthcheck} · {api.example.com/gibberish}
Some become obvious potential targets
· {api.example.com/swagger.json}
22

#RSAC
On to the attack
We have our target, lets get going

Attack Behavior
My Toolkit
­ Infrastructure ­ Tools ­ Behavior ­ Credentials

#RSAC
My Targets
­ Login Attempts ­ Profile Reads ­ Document Enumeration ­ Logic Attacks
24

#RSAC
Attack Example
Using specs to attempt BOLA
Find an endpoint
Spec says where endpoints are located (e.g., edit/create/delete/put)
Attempt access with valid auth
Attempt access with invalid auth
Attempt access across profiles/IDs/Users

#RSAC
Specification Docs Tell Us Where To Look

#RSAC
An Example From crAPI
HTTP Method GET Note /v2/ Are there other user elements besides dashboard?
27

#RSAC
When You Get Back To The Office
Find your API specs and understand who builds them and where they are stored.
­ This allows for versioning and an understanding of where changes might need to be made.
Review your specs to understand where an attacker would use them to bypass your security protections
­ Noting things like Delete being available on a flow allows for testing of privilege escalation.
Use specs as part of your internal programs - not external ones.
­ Protect with NDAs/Auth etc... Having unfettered access means mapping your APIs is simple for an attacker.
28

#RSAC
Specification Best Practices
1. Embrace specification use ­ consistency, quality, security 2. Establish policies: no API gets published without a spec 3. test against the spec: does intended function follows the spec? 4. Protect the spec: public accessibility is not a requirement 5. Replace the defaults: make it harder for information to leak
out 6. Manage the scanners: use them to see what attackers see,
apply preemptive policies
29

#RSAC
OpenAPI Security Recommendation #1
Servers
­ Errors can lead to OWASP API 9: Improper assets management vulnerability
Confirm HTTPs is in use Validate version numbers Consistent naming conventions
30

#RSAC
OpenAPI Security Recommendation #2
Methods and paths
­ Errors can lead to OWASP API 9, Improper assets management vulnerability
Ensure they are used as intended
­ If GET is intended, make sure POST, PUT or DELETE are not used
31

#RSAC
OpenAPI Security Recommendation #3
Request parameters
­ Errors can introduce Mass Assignment, #6 on the OWASP API Security Top 10 list
Never leave parameter values open ended Block or remove any added parameters
32

#RSAC
OpenAPI Security Recommendation #4
Response body
­ Errors can introduce Excessive Data Exposure risks, #3 on the OWASP API Security Top 10 list
Expose as little info as possible Specify response structure for individual fields. Use scanning tools to flagged undocumented fields
33

#RSAC
OpenAPI Security Recommendation #4
Security Schemes
­ Can lead to Broken User Authentication, #2 on the OWASP API Security Top 10 list
Use authentication wherever possible
34

#RSAC
Thank You
Thank you for attending my talk Find me online
­ jason.kent@cequence.ai ­ linkedin.com/in/n0handle
35

