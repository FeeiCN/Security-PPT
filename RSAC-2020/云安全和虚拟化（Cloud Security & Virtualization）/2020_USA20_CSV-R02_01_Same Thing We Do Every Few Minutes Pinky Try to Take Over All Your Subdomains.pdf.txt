SESSION ID: CSV-R02
Same Thing We Do Every Few Minutes, Pinky ­ Try to Take Over All Your Subdomains!

Alun Jones
application security engineer Global Application Security, Starbucks Coffee Company @ftp_alun

#RSAC

#RSAC
Sidebar ­ an intro to DNS
DNS ­ Domain Name Service Record types:
­ A ­ maps from a name to an address ­ "example.com" -> "192.168.0.1" ­ CNAME ­ maps from a name to a name ­ "example.net" -> "example.org" ­ NS ­ tells you where to go for name service

What is subdomain takeover?

Friendly name:

Traffic Manager:

pie.starbucks.com s314159.trafficmanager.net

CNAME pie.starbucks.com -> s314159.t....net

#RSAC
Web servers

Hacker's web sites

#RSAC
What is subdomain takeover?

Friendly name:

Web site:

pie.starbucks.com s314159.azurewebsites.net

CNAME pie.starbucks.com -> s314159.az....net
Hacker's web site

#RSAC
Why is it bad? ­ last year's news!

#RSAC
Why is it bad?
Aside from the bad PR... Subdomains have access to...
­ Read/write broadly scoped cookies (even HTTPOnly, Secure) ­ Provide data access through crossdomain.xml/CORS assignments ­ Embed iframes from other subdomains
Subdomains look trustworthy
­ In phishing attacks ­ To developers & partners

#RSAC
Why can't cloud providers simply make it not a thing?
Cloud just means "someone else's computer" In the abstract, this is just another example of:
­ Knowing more about dev than ops.
And yet, I don't absolve cloud providers of responsibility

#RSAC
So what did/do we do?

#RSAC

#RSAC
Paying bounty ­ too much
Do we tell them how much? Can we graph it?

#RSAC
Scan better every hour ­ not just for NXDOMAIN
A bigger PowerShell script running on my laptop

Devs cause subdomains to be open to takeover
Bounty report of subdomain takeover comes in while teaching

#RSAC
Train devs to prevent subdomain takeover risk
Bounty report of subdomain takeover comes in while teaching

#RSAC
How did a takeover happen during training?
During the course of the ONE HOUR training:
­ Devs stopped using a website, deleted the resource ­ Hacker spotted the resource was available
Subdomain enumeration ­ `amass' nslookup to verify absence
­ Hacker claimed the resource ­ Hacker wrote up and submitted a report
So what did we learn?
­ The hackers are fast

#RSAC
Talking to the developers
Why did they do this in the first place? Are our devs like your devs?
­ Our cloud provider says our devs are special ­ Our cloud provider got subdomains taken over

#RSAC

#RSAC
Disclosure leads to heightened interest, confusion
2019-08-28, Hacker "parzel"s report disclosed 2019-08-29, News site "BC" posts news story
­ About parzel's 2019-08-28 report ­ Linking to HackerOne report disclosed 2018-06-25 from "0xpatrik"
2019-08-29, News site "SC" posts news story
­ Built from 0xpatrik's report ­ As news ­ but not referencing BC's story ­ From over a year ago
August SDTOs: 11, 2 valid September SDTOs: 33, 1 valid

#RSAC
It would be nice if hackers would at least check
NXDOMAIN is necessary, not sufficient
Several reports come in where we're actually still using the domain
­ e.g. our virtual desktop servers, would be noticed if they went down ­ An entire country's Starbucks front page
Sometimes, it's not even our domain
­ "Secret menu" sites ­ Review sites ­ etc

#RSAC
We can no longer afford manual processes
Automated scans happen within minutes Scanning once an hour is not enough Taking manual steps is not fast enough
­ We can not afford to contact teams and ask ­ We can not "just delete the CNAME" (Q: Why not?)

#RSAC
How do we get better? Faster?
Knowledge - we know stuff hackers don't Don't have to wait for NXDOMAIN
­ [Is there a CNAME? Did we own its target? Do we now?]
We can take over the domain with impunity
­ External impunity ­ it belonged to Starbucks, still does ­ Internal impunity ­ it belongs to the security team, not a hacker

#RSAC
What tools are in the space?
OWASP Amass: https://github.com/OWASP/Amass
­ Subdomain enumeration
Sublist3r: https://github.com/aboul3la/Sublist3r
­ Subdomain enumeration
SubOver: https://github.com/Ice3man543/SubOver
­ Automated takeover (but not Azure?)
Detectify: https://detectify.com/
­ Commercial tool for many web / app sec monitoring tasks

#RSAC
So we built submon-cli
Goals:
­ Protect the customers, partners and brand reputation ­ Focus on immediate problems first (Azure, CNAMEs) ­ Beat the hackers: run 24/7, cover every two minutes (more if possible) ­ Automatic and immediate takeovers ­ General-purpose / modular / extensible (non-Azure, A & NS, other DNS) ­ No false positives (but explain when they are likely to be reported)

#RSAC
Choices made
PowerShell
­ Already has near-native support of Azure CLI ­ Extensible to cover other cloud APIs, DNS APIs, etc ­ Briefer than other platforms
Azure Functions
­ Most of our cloud support is in Azure already ­ Supports PowerShell, Python, C# - languages we know
DNS REST API
­ Our existing source of DNS truth (recently replaced ­ see `extensible')

#RSAC
The architecture of submon-cli

Poll for new CNAMEs

FetchDNS */20m

Submon

*/2m TakeOver

Alerts

Trigger

#RSAC
Not a simple match of DNS <-> resource name
For some resources, the DNS name is NOT the resource name:
­ Public IP addresses ­ Classic Cloud Services (*.cloudapp.net)
The query is a little complex:

#RSAC
How does this fail?
Resources `blink' sometimes If the graph query returns empty, we try to take over the world! Some resources are third -party, we never own
­ For these, a certificate check is a help
DNS gets out of date at times with new entries

#RSAC
There are other kinds of SDTO...
"2nd order" ­ HTML tags refer directly to cloud resources
­ <script src='https://ohmyheck.azurewebsites.net/foo.js'>
NS record
­ Common with AWS NS Delegation Zones
A record
­ IP addresses get reassigned to new customers
Abandoned `vanity' domain
­ E.g. "simpsonizeme.com" ­ a 2007 campaign now shipping malware

#RSAC
How could we be better?
We could scan every minute
­ No, literally, we can ­ it takes a minute to check all our CNAMEs
Take in more name sources
­ The code is already adaptable to do this
Handle more resource types
­ DNS A record SDTO behaves very similarly to CNAMEs ­ See `extensibility' ­ NS records ­ one or two at a time

#RSAC

#RSAC
Oracle ­ tenancy namespace in DNS names
If we set up a service called "foo-service", it is created as:
­ foo-service-starbucks.oracle.com
For a CNAME type takeover to occur:
­ You'd have to take over our entire Oracle tenancy ­ Which is far less likely
I don't foresee this as a high likelihood No documentation ­ could this change in future?

#RSAC
AWS ­ opaque identifiers in ELB names
Create an ELB instance called my-load-balancer, it's created as:
­ my-load-balancer-652773176.elb.amazonaws.com
As far as I can tell, this is NOT designed as a security measure
­ Disambiguation to avoid accidental sharing ­ It's sufficient, because enumeration is relatively slow
Safe as long as the numbers are random... documentation?

#RSAC
AWS ­ randomly assigned name servers
For NS takeovers Requesting a DNS Delegation Zone gives you four random servers
­ Each of four regions ­ Two random numbers, essentially 0-1023, 0-64 ­ Sounds like P(takeover) = 1:(1024*64) = 1:65536
But hackers can keep requesting DZones until they match one And they do ­ this is NOT adequate for security

#RSAC
Azure ­ machine readable list of IP ranges
For A record takeovers ­ is this target IP in Azure? In PowerShell, a list of all Azure IP ranges in CIDR format:
­ Install-Module Az ­ Connect-AzAccount ­ (Get-AzBgpServiceCommunity).BgpCommunities.CommunityPrefixes
About 100 lines of code around [System.Net.IpAddress] Future - IPv6?

#RSAC

#RSAC
Don't offer Managed Certificates
As if:
­ We can't stop Subdomain Takeover anyway ­ But we can sign a taken-over site as if it's genuine!

#RSAC
Postpone DNS name release in Enterprise subscriptions
At the end of a day, tell us what names we're about to abandon
­ (Automatably!)
Nobody (outside of us) needs that name immediately Give us a chance to take them back Especially if a Custom Domain mapping was in place

#RSAC
Event notification (fast!) on DNS name release
If you can't postpone release, notify us of release ­ fast! Fastest notification I get from Splunk / Azure is 10 minutes
­ In 10 minutes, someone else already owns it

#RSAC
Check custom names out as well as in

Create custom domain...

Delete Custom domain...

#RSAC
Mapping between DNS names, resource types
What if I want to (preventively) take over a resource? How do I know foo.cloudapp.net is a "Cloud Service (Classic)"?
­ Or a "microsoft.ClassicCompute/domainNames"? ­ And what's the PowerShell command to create/reserve one?
A person-readable or machine-readable map
­ Please, up-to-date ­ Easier to find than "hey, Bing, what's an azurefd.net address?"

#RSAC
Action
1. Are you vulnerable?
­ Scanners alone won't provide an accurate picture ­ Understand your environment ­ Automate intel, action
2. Are your devs / ops aware?
­ Do your devs speak DNS? TTL? ­ This is a dangling-pointer bug. Embarrassing!
3. Is your cloud provider helping you? How?
­ Each provider has different vulnerabilities / protections

#RSAC
And finally...

Questions?

#RSAC
Twitter: @ftp_alun Instagram: @ftp_alun - banned Email: alujones@starbucks.com, alun@texis.com Blog: https://blogs.msmvps.com/alunj

#RSAC
Resources
Subdomain Takeover: Basics (Patrik Hudak)
­ https://0xpatrik.com/subdomain-takeover-basics/
Recon session interview - NahamSec with Patrik Hudak
­ https://youtu.be/0LXWcZqw6-A?t=7215
EdOverflow: Can I take over XYZ?
­ https://github.com/edoverflow/can-i-take-over-xyz
Detectify: Hostile Subdomain Takeover using ...
­ https://labs.detectify.com/2014/10/21/hostile-subdomain-takeover-usingherokugithubdesk-more/

