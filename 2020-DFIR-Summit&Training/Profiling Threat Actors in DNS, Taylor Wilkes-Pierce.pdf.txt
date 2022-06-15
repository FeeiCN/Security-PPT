Profiling Threat Actors with DNS
SANS DFIR 2020 Taylor Wilkes-Pierce, Senior Sales Engineer

DomainTools Data

Accurate

95%+ of currently registered domains
Timely
All newly registered and discovered domains

Comprehensive

Nearly two decades of historical WHOIS and pDNS data

Observations on Adversary Infrastructure
When malicious actors register and host domains they leave behind data for us to analyze
Thiessdeaitnasicgahntsgcivaenubseinaspipglhietdinitnoothuer iirnbvuesitnigeastsioonpseorfathioisnsa,ctthiveity taanrdgectasnoaf itdheoiur radtteatcekcst,iothneasncdarlesopfotnhseeir eofpfoerrtastions
-Domain Names -Top Level Domains / Registrars -Hosting Providers

What's in a Name?
Domain names can reveal intent

What's in a Name?
Domain names can reveal intent

TL;DR on TLDs / Registrars
Registration Costs Vary Wildly
*sources: TLD-list.com, freenom.com

TL;DR on TLDs / Registrars
Registrars can be indicators

Hosting Providers
When pivoting on hosting IPv4s, tenancy is key Multi Tenant Infrastructure
Shared / Managed Hosting / CDN / Domain Parking
Domains hosted on multi tenant IPs often have no relation to each other from an ownership perspective.

Hosting Providers
When pivoting on hosting IPv4s, tenancy is key Single Tenant Infrastructure
Virtual Private Servers + Dedicated Servers
Pivot on and monitor single tenant IPv4s

Name Servers
Most users stick with their hosting providers default name servers
Bad actors are no different, unless they need greater control over availability
Deviation from this can make for great pivots

Name Servers
Hosting Providers and their Name Servers can be overrun by malicious activity (perhaps by design?)

Pivoting Outside of DNS

SSL Cert Discovery

SSL Certificate Pivoting

Investigating with Infrastructure OSINT
· Defined investigative pathways speed response times
· Access to Indexed Infrastructure OSINT gives insight into adversary activity
· APIs provide data portability

Bringing Infrastructure Intel into the SIEM
Iris Enrich API purpose-built for largescale event decoration
· Proxy Logs · DNS Query Logs · Email Domain Logs

Actor Profiling with OSINT

Certificates and Subdomains

Discover and Pivot on Actor TTPs

Track Changes Over Time

Orchestrate with DNS and Infrastructure OSINT
· Speed up Incident Handling by Automating OSINT Collection
· Scale Effective Workflows with OSINT
· Phishing Response · Adversary Infrastructure Discovery · Adversary Infrastructure Monitoring

Q/A
sales@domaintools.com

