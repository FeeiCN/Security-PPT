New Class of DNS Vulnerabilities Affecting Many DNSaaS Platforms

Shir Tamari & Ami Luttwak Wiz.io

#BHUSA @BlackHatEvents

Background:
The Wiz Research Team
 Experienced security researchers  Microsoft Cloud Security Group
veterans  Groundbreaking cloud research
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

The Beginning:
Why DNS-as-a-Service?
 DNS is the lifeblood of the internet
 Potentially huge impact  Impacts cloud & on-prem assets  DNS is incredibly complex
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Target:
Route53  DNS-as-a-Service from AWS  Highly popular
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Route53:
Domain Hijacking
 ~2000 Shared DNS servers  Each domain has 4 Name Servers  Target: wiz.io
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Route53:
Domain Hijacking
Wiz.io
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

ns-1334.awsdns-38.org ns-883.awsdns-46.net ns-457.awsdns-57.com ns-1611.awsdns-09.co.uk

Route53:
Domain Hijacking
Official AWS DNS Server ns-1334.awsdns-38.org
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Customer's DNS Zones
wiz.io company.com company2.com company3.com
wiz.io

Wiz.io
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

ns-1334.awsdns-38.org ns-883.awsdns-46.net ns-457.awsdns-57.com ns-1611.awsdns-09.co.uk

Domain Hijacking:
Different angle
 What domain can We possibly register?
 Should not exist on the nameservers
 DNS clients must query for it
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Domain Hijacking:
Different angle
 Register an AWS official nameserver: What would happen?
 ns-852.awsdns-42.net?
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Different angle:
Illustration
Official AWS DNS Server ns-852.awsdns-42.net
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Customer's DNS Zones
alpha.com beta.com gamma.com delta.com
ns-852.awsdns-42.net

Nameserver Hijacking:
Analyzing the Traffic
 Why are we getting any traffic?  Most of it is Dynamic DNS  IP addresses  Computer Names  Domain names
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Nameserver Hijacking:
Analyzing the Traffic
· More than one million unique endpoints
· More than 15,000 organizations (Unique FQDN)
· All are AWS Customers
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Nameserver Hijacking:
High value targets
 Big companies (Fortune 500)  130 government agencies
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Nameserver Hijacking:
What do we know so far?
 We registered a nameserver domain  Millions of endpoints started sending
dynamic DNS queries to us. But .. Why?  Our next step was to dive into the world
of Dynamic DNS
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Nameserver Hijacking:
Dynamic DNS
 RFC 2136  Dynamically updating DNS records  Common use: Simple way to find
IPs in a managed network
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Nameserver Hijacking:
Dynamic DNS
Update IP: SHIR-PC 10.0.0.4
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

SHIR-PC?

SHIR-PC is 10.0.0.4

AMI-PC

Dynamic DNS:
Finding the Master
 Microsoft has its own algorithm  It does not work exactly as the
RFC defines
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Dynamic DNS:
Finding the Master (Private network)
SOA query for SHIR-PC.corp.wiz.io Primary server: internal-dns.wiz.io
Dynamic update SOA wiz.io Dynamic update response SOA wiz.io
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Dynamic DNS:
Finding the Master (External Network)
SOA query for SHIR-PC.corp.wiz.io
Primary server: ns-1611.awsdns-09.co.uk Dynamic update SOA wiz.io
A query for ns-1611.awsdns-09.co.uk A response with 1.3.3.7

Dynamic update SOA wiz.io
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

1.3.3.7

Dynamic DNS:
So what did we learn so far?
 Windows endpoints use a custom algorithm to find the master DNS
 The algorithm queries the nameserver for its own address
 The result: Our malicious DNS server receives Dynamic DNS traffic from millions of endpoints
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

The Risk:
Nation-state intelligence capability
· External IP · Internal IPs · Computer names · From 15,000 organizations
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

The Risk:
IP based Intelligence
· Map companies' sites across the globe
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Hyderabad, India: 611 Endpoints
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

The Risk:
IP based Intelligence
 Companies in violation of OFAC (Office of Foreign Assets
Control) sanctions
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

The Risk:
Nation State Capabilities
Abidjan, Ivory Coast: 6 Endpoints
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

The Risk:
IP based Intelligence
 A subsidiary of a large credit union with a branch in Iran
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Nation State Capabilities
Example 2
· A subsidiary of a large credit union with a branch in Iran
Tehran, Iran: 13 Endpoints
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

The Risk:
Internal IPs
· Indicate network segments 10.10.*.* - Employee's network 10.10.33.* - CI/CD network 10.100.*.* ­ Operational network
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

The Risk:
Computer Names
· Provide information about the Endpoint
· In what segment is it located · Employees names
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

The Risk:
Internal IPv6
· Sometime accessible from the internet!
· 6% expose services such as RDP, SMB, HTTP and many more
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

^128

The Risk:
Huge Scope
· Cloud providers · DNS-as-a-Service providers · Shared hosting · Domain registrars · All could be vulnerable to
nameserver hijacking
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Nameserver Hijacking:
Disclosure
 Amazon AWS ­ Fixed by 16/02/2021  Two more cloud providers
in disclosure process
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

The Fix:
Amazon
· Domain name validation
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Disclosure:
Microsoft
· Not considered a vulnerability · A known misconfiguration when using
external DNS providers
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Nameserver Hijacking:
Fix it Yourself (Platform)
 Domain validation  Ownership verification  Follow RFC's "reserved names"
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Dynamic DNS:
Fix it Yourself (Organization)
 Modify the default SOA record
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Further Research:
Further research
 Many more interesting domains to register  Dynamically update DNS servers
in the wild  NTLM authentication
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

Windows 10 (Build 14393) NTLM Negotiation
Further research:
NTLM Authentication
· Dynamic DNS supports authentication · Windows does it with NTLM · Negotiate over DNS TSIG
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

The Research:
Summary & Takeaways
 We got to nation-state intelligence capabilities from a simple domain registration
 New class of DNS vulnerabilities in DNS-as-a-service
 Huge scope
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

The Research:
Q&A
@AmiLuttwak ami@wiz.io @ShirTamari shir@wiz.io
@ShirTamari @AmiLuttwak @Wiz_io #BHUSA @BlackHatEvents

