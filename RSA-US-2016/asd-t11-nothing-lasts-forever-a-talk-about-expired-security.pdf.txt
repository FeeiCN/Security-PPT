SESSION ID: ASD-T11
Nothing Lasts Forever
A Talk About Expired Security
#RSAC

Matthew Bryant
Application Security Engineer Uber Technologies Inc. @IAmMandatory

#RSAC
Matthew Bryant (mandatory)
Application Security Engineer at Uber Technologies Inc. Maintainer of The Hacker Blog: https://thehackerblog.com @IAmMandatory https://github.com/mandatoryprogrammer
Signal Fingerprint 05 d4 6b db 51 31 9b 43 b6 6b c6 96 91 fb 3c 1e 60 3c 93 6b 4e 1f 55 8e 54 9a 93 e0 a4 c3 ad 99 34
2

#RSAC
What're we talking about here?
This talk explores the intersection of trust and ephemeral assets.
Trust is given to things that expire all the time (domains, cloud instances, etc.).
What happens when an attacker reacquires these things?
3

#RSAC
Agenda
Extensions of Trust
Nothing Lasts Forever, Broken Links and Dangling Trust
From Expired to Attack-Acquired
Solving the Problem
4

SESSION ID:
Extensions of Trust
Trust Me, I'm Ephemeral
#RSAC

#RSAC
The interconnected web
The web is tangled.
External resources happen on every page load.
These domains are all trusted implicitly.
6

#RSAC
Third-party Services
Web applications are all connected via APIs and Software as a Service (SaaS).
Ephemeral cloud instances are incredibly popular: EC2, Linode, Digital Ocean instances.
Applications that don't make use of any external services are now the outliers.
7

#RSAC
Content Delivery Networks
Even web libraries are often not self-hosted.
CDNs are common to handle large amounts of traffic and to prevent denial of service (DDoS) attacks.
Many sites trusting one service to host JavaScript, CSS, and images for other sites.
8

#RSAC
Extreme Trust ­ crossdomain.xml
One notable instance is with crossdomain.xml policies.
A crossdomain.xml file specifies which site's are trusted to perform authenticated requests for a domain.
So example.com could allow http://thirdparty.com to perform actions as logged in users by specifying it in their crossdomain.xml policy.
9

SESSION ID:
Nothing Lasts Forever
Broken Links and Dangling Trust
#RSAC

#RSAC
Domains Expire
Domains don't last forever ­ they must be renewed yearly.
11

Service Plans Expire, Companies Go Out of

#RSAC

Business

Companies and providers go out of business.

What happens to their clients who've integrated with them?

12

#RSAC
Dynamic Instances
With cloud instances you spin up a host until its purpose has been fulfilled -- then you terminate it.
When you kill an instance, are you also removing everything that was pointing to it?
13

#RSAC
Records Expire But Trust Remains
When a domain expires, or an instance is terminated, is it still trusted?
Are DNS records left dangling?
Are these resources embedded in your pages?
Do people still trust these instances?
14

SESSION ID:
From Expired To AttackerAquired
Attacking Forgotten Trust
#RSAC

SESSION ID:
Diving Into the Elastic IP Pool
Cloud Nine
#RSAC

#RSAC
The Cloud
One good example of ephemeral resources are cloud instances. EC2, Linode, App Engine, Rack Space, etc.
17

#RSAC
The Cloud
These instances are ephemeral by design.
You pay for what you use, then you spin down the instance.
These resources are part of a pool that people draw from and release back into.
18

#RSAC
19

#RSAC
Example Scenario
Company ExampleCo has a promotional offer site that they want to run for only two weeks.
They spin up an Amazon EC2 instance and point promotion.exampleco.com to it.
After the promotion ends, the development team terminates the instance.
20

#RSAC
Example Scenario
What went wrong?
21

#RSAC
Example Scenario
They didn't delete the DNS entry pointing to promotion.exampleco.com.
That IP address was thrown back into the AWS pool to be reused by other users.
22

#RSAC
Attack Scenario
These IP addresses could potentially be reallocated by attackers as well.
However, in the case of AWS you cannot allocate a specific IP.
In order to gain control of a domain we have to go fishing.
In an attempt to exploit this we created a program called poolplayer.
23

Attack Scenario

#RSAC

The program works as follows:
Allocating an IP address
Checking multiple DNS databases for the allocated IP (DNS Dumpster, Domain Tools, ViewDNS)
If the IP has domains or subdomains pointing to it -- keep it. If not, throw it back into the pool.

24

#RSAC
What I thought it'd be like...
25

#RSAC
Attack Scenario
CLOUD NINE
26

#RSAC
In reality it's more like a lot of this...
27

#RSAC
Attack Scenario
CLOUD NINE
28

#RSAC
With the occasional...
29

#RSAC
Attack Scenario
CLOUD NINE
30

#RSAC
The Results
The domains are mostly random.
We allocated everything from government subdomains to Japanese VPN provider endpoints.
Unpredictable but overtime yielding interesting results.
31

#RSAC
sso.dev.siam.education.govt.nz
32

#RSAC
33

#RSAC
area1fte.edu.br
34

#RSAC
35

#RSAC
cert.safetypay.com
36

#RSAC
37

vpn825798936.softether.net sdrservers.softether.net cyberdeftech.softether.net vpn825798936.softether.net vpn719195286.softether.net vpn426316912.softether.net vpn658514917.softether.net vpn286892270.softether.net vpn658514917.softether.net vpn426316912.softether.net vpn658514917.softether.net vpn818446566.softether.net vpn163936725.softether.net vpn426316912.softether.net vpn658514917.softether.net vpn765121359.softether.net vpn462247143.softether.net vpn797794763.softether.net vpn462247143.softether.net vpn643885422.softether.net vpn299584053.softether.net vpn462247143.softether.net willionmax02.softether.net vpn462670062.softether.net
38

#RSAC

#RSAC
39

#RSAC
qa.oms.origin.com
40

#RSAC
41

#RSAC
uat.ebolaexplained.co.uk
42

#RSAC
43

#RSAC
Conclusions
This problem appears to be systemic and not widely explored.
Over time, finding IP addresses with domains pointing to them will become easier and easier due to IPv4 being limited.
We may end up with a very crowded pool.
44

#RSAC
45

#RSAC
46

#RSAC
View This Panel
http://thehackerblog.com/awsfishing/
47

#RSAC
48

#RSAC
Proof
https://web.archive.org/http://qa.oms.origin.com/
49

SESSION ID:
Cross-domain Sniping
Getting Flashy
#RSAC

#RSAC
What is crossdomain.xml?
A crossdomain.xml file specifies which sites can send requests and read response data from your site.
If a site is listed in a crossdomain.xml file of a site then it can perform actions as logged in users via Flash.
51

example.com

#RSAC

thirdparty.com
52

User navigates to example.com

example.com

#RSAC

thirdparty.com
53

User navigates to example.com

example.com
EXAMPLE.COM LOADS A VIDEO FROM
THIRDPARTY.COM

thirdparty.com

#RSAC
54

example.com

#RSAC

thirdparty.com
55

#RSAC
example.com
EXAMPLE.COM IS IN THE WHITELIST!
thirdparty.com
56

example.com

#RSAC

thirdparty.com
57

#RSAC
example.com
VIDEO STARTS PLAYING
thirdparty.com
58

attacker.com

#RSAC

facebook.com
59

#RSAC
attacker.com
ATTACKER.COM NOT IN FACEBOOK'S WHITELIST! REQUEST
BLOCKED.
facebook.com
60

#RSAC
Scanning Crossdomain.xml
crossdomain.xml policies are commonplace.
They are a perfect example of trusting ephemeral instances.
If a domain is in your crossdomain.xml file then it is trusted to perform authenticated requests.
61

#RSAC
62

#RSAC
Planning Our Attack
We need to gain control over one of the domains listed in the cross-domain whitelist. How can this be done?
63

#RSAC
64

#RSAC
Photobucket Security
Photobucket isn't new to security issues.
Popular host for both public and private photos.
Mobile application syncs photos from phone via app to the online service.
Naturally, due to private photos being stored this is a big target for hackers.
65

#RSAC
66

#RSAC
67

#RSAC
68

#RSAC
The Fix from Photobucket
69

#RSAC
Photobucket Security
Despite all of this added protection, we're going to bypass all of it.
70

#RSAC
71

#RSAC
72

#RSAC
73

#RSAC
74

#RSAC
Thinking bigger
Photobucket isn't an isolated incident.
We scanned the Alexa top 1,000 domains and found many other instances.
Even companies that specialize in security made the mistake of having expired domains in their crossdomain.xml.
75

#RSAC
76

#RSAC
77

#RSAC
78

#RSAC
79

SESSION ID:
The Front Page of Time
Get With the Times
#RSAC

#RSAC
Third-party Web Resources
A majority of sites include web resources from third-party domains.
You have popular sites loading CSS, JavaScript, images, Flash, and other resources from CDNs and third party providers.
When these domains expire it's often a silent failure.
81

#RSAC
Yet Another Scanner
We built a scanner to check if any external resources included on the front pages of the Alexa Top 10,000 had expired.
It was meant to be a quick test to prove the idea, only the homepage was checked.
Future tests would include spidering entire sites to find expired external resources.
82

#RSAC
83

#RSAC
Oops!
The scanner flagged Time.com as containing an expired domain name in an external resource.
84

#RSAC
<noscript> <img height="1" width="1" alt="" style="display:none" src="https://wwwhpacebook.com/tr?id=345214065653621& amp;ev=PixelInitialized"/> </noscript>
85

#RSAC
Tracking Time Users for 10$
Domain is free to be registered.
This image is loaded when the user's browser has JavaScript disabled.
HTML is on every Time.com news article.
86

#RSAC
What can we do with this?
Track users without JavaScript as they navigate the site.
Spawn 401 basic authentication prompts to phish credentials from users.
X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARDANTIVIRUS-TEST-FILE!$H+H*
87

#RSAC
We collected 267,377 requests before pointing the domain to 127.0.0.1. 74,083 had the Do Not Track header set. Multiple bots tracking the Time's homepage
88

#RSAC
Going Forward
While this expired external resource was not active content (an image inside of a noscript tag), it still allowed a variety of abuses.
Given a script tag or external style sheet, we could deface the page and carry out more complex attacks.
89

SESSION ID:
The NoScript Misnomer
Many Eyes Make All Bugs Shallow
#RSAC

#RSAC
NoScript is a popular Firefox add-on with >2 million users. Blocks all JavaScript, Flash, and Java unless the user explicitly allows it. Advertised as "The best security you can get in a web browser!"
91

#RSAC
92

#RSAC
Why is this helpful?
NoScript protects you from many 0days by blocking active content. Forces consent into the browsing process.
93

#RSAC
The NoScript Misnomer
NoScript is a misleading title however as the add-on ships with an internal whitelist of domains.
At the time of this presentation creation, there are currently 111 entries in NoScript's default whitelist.
All of these sites can bypass the functionality provided by the add-on because they are trusted.
94

#RSAC
95

#RSAC
Bypassing NoScript
The original strategy was to find a way to store arbitrary JavaScript on one of the whitelisted sites.
However, the journey was cut short when one of the domains in the default whitelist returned an NXDOMAIN upon querying its DNS.
The domain: vjs.zendcdn.net
96

#RSAC
DNS Enumeration
mandatory> dig NS zendcdn.net ; <<>> DiG 9.8.3-P1 <<>> NS zendcdn.net ;; global options: +cmd ;; Got answer: ;; ->>HEADER<<- opcode: QUERY, status: NXDOMAIN, id: 21164 ;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 0
97

#RSAC
98

#RSAC
99

#RSAC
Remediation
This issue was disclosed to the creator of NoScript and was fixed in hours. The update was available two days later.
100

SESSION ID:
Solving the Problem
Pain is Temporary, Glory is Eternal
#RSAC

#RSAC
What we do to fix this?
Change policies to include steps for ensuring the removal of DNS records and other references to dynamic instances.
Monitor not only your own domain names, but domain names that you trust, as well.
Domains in crossdomain.xml Domains in CNAME records Domains in third-party script includes
102

#RSAC
Tools
To find these vulnerabilities, we've created a few tools. Using the same tools we use to hunt for these vulnerabilities, you can scan for these problems in your own infrastructure.
103

#RSAC
Tools
Crossdomain.xml Scanning Tool https://github.com/mandatoryprogrammer/xpirecrossdomain-scanner
XCNAME https://github.com/mandatoryprogrammer/xcname
104

#RSAC
Thank you
Questions?
105

#RSAC
Sources
https://commons.wikimedia.org/wiki/File:Robot-icon.png https://openclipart.org/detail/18414/weather-symbols https://www.microsoft.com/en-us/download/details.aspx?id=35772 http://www.abc.net.au/news/2014-12-19/an-over-populated-chineseswimming-pool/5978934 http://www.havana-live.com/news/2015/02/01/havana-host-ernesthemingway-marling-fishing-tournament.html https://cierralyn.wordpress.com/2010/08/10/italy-part-2-volterra-romecinque-terra-deep-sea-fishing-and-a-bit-more-of-florence/for-blog-64/
106

