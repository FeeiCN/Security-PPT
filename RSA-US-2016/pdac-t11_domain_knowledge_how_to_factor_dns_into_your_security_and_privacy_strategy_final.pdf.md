SESSION ID: PDAC-T11

Domain Knowledge: How to Factor DNS into Your Privacy and Security Strategy

Allison Mankin, Director ­ Next Lab Burt Kaliski, Chief Technology Officer
Verisign

#RSAC

Agenda
DNS Overview
Emerging Security and Privacy Mitigations
DNS as a Security Enabler
2

#RSAC
Current Security and Privacy Mitigations
Recommendations ­ Apply This Learning

#RSAC
DNS Overview

#RSAC
DNS Overview and Hierarchy
Authoritative name servers
Root
Top Level Domain (TLD)
Second Level Domain
Third Level Domain
4

DNS Resolution Process
Web Server

Internet User

Recursive Name Server 5

#RSAC
Root Name Server TLD Name Server
Second Level Domain Server

#RSAC
Registration and Provisioning Process

Registration Server (operated by Registrar)

Web

EPP

Authoritative Name Server

Registrant

Registry EPP Server
EPP = Extensible Provisioning Protocol
6

#RSAC
Registration Data Access Process

Internet User

WHOIS Registration Data Server
7

#RSAC
Current Security and Privacy Mitigations

#RSAC
DNS Security and Privacy Risks
As with any information system, DNS has risk of modification or disclosure, in transit and at rest
DNS industry continues to develop mitigations to these risks
Important to consider risks and mitigations as part of an overall enterprise security strategy
9

#RSAC
Current Mitigations
Current DNS technical enhancements for security and privacy DNSSEC
Registration Locks
10

DNSSEC Process
Web Server

Validate

Validate
Recursive Name Server
11

#RSAC

Sign

Root Name Server

Sign

TLD Name Server

Sign

Second Level Domain Server

#RSAC
DNSSEC
DNS Security Extensions (DNSSEC) mitigates modification risk by adding digital signatures to DNS records Recursive or client can validate that records are unmodified
DNSSEC makes DNS an authenticated directory
12

Registration Locks

Registration Server (operated by Registrar)

Web

EPP

#RSAC
Authoritative Name Server

Registrant

Registry EPP Server

13

#RSAC
Registration Locks
Registrars and registries provide complementary options to mitigate registration modifications and fraudulent transfer of domains
verisign.com WHOIS data indicating a registrar lock and a registry lock
14

#RSAC
Emerging Security and Privacy Mitigations

#RSAC
Emerging Mitigations
Emerging DNS technical enhancements that are not widely available
QNAME Minimization DNS-over-TLS
Registration Data Privacy with RDAP
16

DNS Resolution Process

Web Server

Q: FQDN A: TLD address

Q: FQDN A: FQDN address

Q: FQDN A: SLD address

Recursive Name Server
FQDN: Fully qualified domain name (e.g., www.rsaconference.com)

Q: FQDN A: FQDN address

17

#RSAC
Root Name Server TLD Name Server
Second Level Domain Server

QNAME Minimization Process

Web Server

Q: TLD A: TLD address

Q: TLD A: FQDN address

Minimize

Q: SLD.TLD A: SLD.TLD address

Recursive Name Server

Technology at recursive only, and no encryption required

Q: FQDN A: FQDN address

18

#RSAC
Root Name Server TLD Name Server
Second Level Domain Server

DNS-over-TLS Process
Web Server
Encrypt
Recursive Name Server
19

#RSAC
Root Name Server TLD Name Server
Second Level Domain Server

#RSAC
DNS-over-TLS
Like other Internet protocols, DNS can be made more secure and information disclosure can be reduced by running over Transport Layer Security (TLS)
IETF expected to approve DNS-over-TLS standard in March
Scope is only from client to recursive
Mitigates eavesdropping where sources of query exposed Incidentally mitigates modification in transit
20

#RSAC
Differentiated Access to Registration Data
Registration data currently accessed through WHOIS ­ RFC 3912
All have access to virtually all the information
Emerging Registration Data Access Protocol (RDAP) ­ RFCs 7480-7485
Will make it possible to have user identification, authentication and access control features
Will make registration data privacy possible by restricting data access to appropriately authorized users
21

#RSAC
Registration Data Privacy with RDAP
WHOIS: All clients see all data (more or less)
RDAP: What a client sees can depend on:
Who is asking What they're asking for Where they're asking from Why they're asking How they're asking
22

#RSAC
How Might Data Privacy with RDAP Work?

Register with an Identity Provider
Get identity credential RDAP Client

Request access to protected resource Receive results

Authenticate client and select data to share

Identity Provider

RDAP Server (relying party)
23

#RSAC
Status of Emerging Mitigations

QNAME Minimization
DNS-over-TLS
Registration Data Privacy with RDAP

Approved for Experimental IETF RFC, implemented by open source recursive servers (Unbound, Knot)
Expected IETF approval as a standard in March, implemented in reference end-user open source (getdns) and patched in Unbound
One authentication specification in development in IETF, non-production (experimental) services emerging
24

Summary of Current & Emerging Mitigations

#RSAC

Mitigations

Client to Recursive

DNSSEC Registration Locks

QNAME Minimization DNS-over-TLS RDAP Privacy

Protect

At Recursive Current
Protect
Emerging

Recursive to Authoritative
Protect
Protect

At Authoritative
Protect Protect
Protect

Protect

25

#RSAC
DNS as a Security Enabler

#RSAC
DNS as a Security Enabler

Focus so far has been on strengthening security of DNS

DNS-based services can also strengthen security of networks and applications

1 Web security

Four Use Cases:

2 Email security 3 Network security

4 Threat intelligence
27

#RSAC
Use Case 1: Web Security
DANE TLSA spec defines how to publish web certificates, public keys, and/or their hashes as DNS records
Relying parties can thereby validate that web certificate hasn't been substituted with one from a compromised CA
Certificate transparency logs, forensics also detect compromises, but DNS publication gives resource holders its own "voice"
28

#RSAC
Use Case 2: Email Security
DANE SMIMEA, OPENPGPKEY specs define how to publish email encryption & signature certificates as DNS records
End users can discover, validate one another's keys by publishing them in DNS, enabling inter-domain email security
Mail servers can also use TLSA to validate one another's TLS certificates when encrypting inter-domain SMTP traffic
29

#RSAC
Use Case 3: Network Security
Enterprises can mitigate threats from rogue external resources by blocking DNS resolution based on threat indicators, enterprise policy
Recursive name server can be a control point for enterprise security, if enterprise also controls client configuration to select specific recursive
30

#RSAC
Use Case 4: Threat Intelligence
Enterprises can also detect threats from rogue external resources by analyzing DNS resolution patterns
Recursive name server also becomes an observation point for enterprise security
Observations can be correlated across enterprises via "passive DNS" type approaches
31

Status of Use Cases

#RSAC

Use Case

Standards Status

Implementation and Deployment

1. Web Security 2. Email Security 3. Network Security

IETF Standards Track RFC (TLSA) Early adopters only, with browser support lacking

In review for IETF Experimental Emerging use between MTAs.

RFCs

Minimal adoption by MUAs.

Not in standards development Emerging production offerings

4. Threat Intelligence Not in standards development Active production offerings

32

#RSAC
Wrapping Up

#RSAC
Recommendations ­ Apply This Learning

If DNS is part of the system you're protecting ...

Next week you should:
Within the next three months you should:

Identify the different ways in which DNS is used within your organization
Consider how available and emerging mitigations can apply in your environment Consider leveraging DNS-based services for enterprise security
34

#RSAC
For More Information
Burt Kaliski bkaliski@verisign.com
35

#RSAC
Q & A
36

