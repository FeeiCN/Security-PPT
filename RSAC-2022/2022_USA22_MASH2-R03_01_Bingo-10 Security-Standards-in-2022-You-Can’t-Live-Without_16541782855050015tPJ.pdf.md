#RSAC

SESSION ID: MASH2-R03
Bingo! 10 Security Standards in 2022 You Can't Live Without

Bret Jordan CISSP
CTO Emerging Technologies Broadcom

Kirsty Paine
Strategic Advisor - Technology & Innovation Splunk Inc.

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Standards?
Why technical standards meetings are actually the coolest place to be - no, really...!

#RSAC
Standards - not just long documents
Some are short! Cumulation of years of discussion, arguments and expertise Cutting edge of technology Have been around a long time and are critical
4

#RSAC
Standards you use daily but never knew
5

#RSAC
Standards meetings - not just long meetings
Some are short! Wall-to-wall expertise Cutting edge of professional development International interaction
6

#RSAC
Get your score cards ready
You promised me bingo

#RSAC
Agenda
Top 10 new standards for 2022 that you need to know about

1. TLS Encrypted Client Hello (ECH)
2. DNS Discovery standards: DNR & DDR
3. JCS & JWS-CT
4. Relay Technology standards: OHAI and MASQUE
5. Post-quantum standards

6. CACAO
7. GSMA 5G Mobile Roaming Revisited
8. ITU Cyber Defense Centers
9. Cyber Security for Consumer IoT Devices - EN 303 645
10. Assessment for IoT Devices TS 103 701
8

#RSAC
#1 - ECH: Encrypted Client Hello for TLS

What is ECH?
­ An attempt to increase privacy by encrypting the TLS 1.3 ClientHello ­ Effectively removing visibility into the SNI

How does it work?

Get ECH Keys From DNS

TLS Client

Provider

TLS Server
9

#RSAC
#1 - ECH: Encrypting your TLS Client Hello
All good things come in threes
­ TLS 1.3 encrypted certificates (and made SNI mandatory) ­ DoH/DoT DNS encryption initiatives hid the domain name ­ ECH encrypts the SNI, completing the trio in ensuring users (and malware)
have complete privacy in their internet activity.
rsaconference.com securitytxt.org bbc.com
10

#RSAC
#1 - ECH: Encrypted Client Hello for TLS
Implementation and security considerations
­ Biggest negative impact is to enterprises, schools, and parental controls ­ Problems with policy-based filtering ­ Need to have strong browser and app configuration management ­ Visibility, analysis, threat hunting, CnC analysis, etc

Detect or block suspicious connections

Use DNS

DoH

Use Server TLS 1.3 Certificates

Use SNI

ECH

All good

TLS 1.2
All good

Better than nothing

NOPE!
11

#RSAC
#2 - Adaptive DNS Discovery
But how can you choose your "trusted resolver"?! Many DNS resolvers support encrypted DNS. Any ideas?
12

#RSAC
#2 - Adaptive DNS Discovery
But how can you choose your "trusted resolver"?! Many DNS resolvers support encrypted DNS. Any ideas?
Standards!
­ DDR: ­ DNR:
13

#RSAC
#2 - Adaptive DNS Discovery
But how can you choose your "trusted resolver"?! Many DNS resolvers support encrypted DNS. Any ideas?
Standards!
­ DDR: Discovery of Designated Resolvers ­ DNR:
14

#RSAC
#2 - Adaptive DNS Discovery
But how can you choose your "trusted resolver"?! Many DNS resolvers support encrypted DNS. Any ideas?
Standards!
­ DDR: Discovery of Designated Resolvers ­ DNR: DHCP and Router Advertisement
Options for the Discovery of Network-designated Resolvers (DNR)
15

#3 - JCS and JWS-CT

#RSAC
JCS
­ JSON Canonicalization Scheme (RFC 8785)
­ Consistent and repeatable representation
JWS-CT
­ JWS Clear Text JSON Signature Option
­ JSON signatures keeping JSON data in JSON format
16

#RSAC
#3 - JCS and JWS-CT
JSON Human readable format
{ "numbers": [333333333.33333329, 1E30, 4.50, 2e-3], "string": "\u20ac$\u000F\u000aA'\u0042\u0022\u005c\\\"\/", "literals": [null, true, false]
}
JSON Canonical format (100% valid JSON)
{"numbers":[333333333.3333333,1e+30,4.5,0.002],"string":"$\u000f\nA'B \"\\\\\"/","literals":[null,true,false]}
17

#RSAC
#3 - JCS and JWS-CT
Use cases for JCS and JWS-CT
­ Shared graph data and transactional data
Basically, any Web2.0 data that needs to be shared and validated Fintech, Threat Intelligence, Playbooks, etc
18

#RSAC
#3 - JCS and JWS-CT

Problems with traditional JWS
­ Really designed for the authorization use case ­ JSON data in most ecosystems is already well defined ­ Requires signatures and data to be Base64 encoded ­ No ability to share signatures or add multiple signatures

JSON Data inside the B64 signature
eyJ0eXAiOiJKV1QiLA0KICJhbGciOiJIUzI1N iJ9.eyJpc3MiOiJqb2UiLA0KICJleHAiOjEzM DA4MTkzODAsDQogImh0dHA6Ly9leGFtc GxlLmNvbS9pc19yb290Ijp0cnVlfQ.dBjftJ eZ4CVP-mB92K27uhbUJU1p1r_wW1 gFWFOEjXk

Signature is a property in the JSON Data
{ "statement": "Hello signed world!", "otherProperties": [2000, true], "signature": "fg7akdak8a..." }
19

#RSAC
#4 - O RELAY YA RELAY
Two IETF groups and standards to watch for relay technology:
­ OHAI: relay for HTTP traffic ­ MASQUE: proxy for QUIC
Point to take away: relay technology is having a moment.
20

#RSAC
#5 - Post-quantum standards
21

#RSAC
#6 ­ CACAO
Collaborative Automated Course of Action Operations for Cyber Security
Command Languages SIGMA, OpenC2, Yara, Jupyter, IBM's Kestrel Caldera, API, Shell 22

#RSAC
#6 - CACAO Solves This Mess!
23

#RSAC
#7 - GSMA 5GMRR (Mobile Roaming Revisited)
As 3GPP tries to make roaming easier Roaming hubs are a new innovation Impacts operators and IPX providers, and ultimately end user security
24

#RSAC
#8 - ITU Cyber Defence Centres
X.1060
­ ITU-T Question 3, Study Group 17: ­ Framework for the creation and operation of a cyber defence centre
25

#RSAC
#9 - ETSI EN 303 645
26

#RSAC
#10 - TS 103 701 - IoT assessment specification
27

#RSAC
How can I get involved?
You get out what you put in!
28

#RSAC
What can you do now?

1. TLS Encrypted Client Hello (ECH)
2. DNS Discovery standards: DNR & DDR
3. JCS & JWS-CT
4. Relay Technology standards: OHAI and MASQUE
5. Post-quantum standards

6. CACAO
7. GSMA 5G Mobile Roaming Revisited
8. ITU Cyber Defence Centres
9. Cyber Security for Consumer IoT Devices - EN 303 645
10. Assessment for IoT Devices TS 103 701
29

#RSAC
Now what?
Next week, you should:
­ Start assessing how ECH is going to impact your organization ­ Choose and read 1-2 of our top 10 standards in more detail
Within the next month, you should:
­ Assess how 2-3 of our top 10 are going to impact your organization ­ Develop a plan to address these in your organization
In the next 3-6 months, you should:
­ Plan for that technical roll-out and let stakeholders know ­ Go to a standards meeting! Your view is needed
30

#RSAC
So, who won?
Check your bingo card

#RSAC
Appendix
Additional Resources

#RSAC
Additional Resources
#1 - TLS Encrypted Client Hello (ECH)
­ ECH draft: https://datatracker.ietf.org/doc/draft-ietf-tls-esni/ ­ Read, implement, give feedback - the time is now! ­ Handshake documentation
TLS 1.2 Handshake: https://tls12.ulfheim.net/ TLS 1.3 Handshake: https://tls13.ulfheim.net/
33

#RSAC
Additional Resources
#1 - TLS Encrypted Client Hello (ECH)
­ Comparison of plain-text vs encrypted data
34

#RSAC
Additional Resources
#2 - Adaptive DNS Discovery
­ ADD (IETF group): https://datatracker.ietf.org/wg/add/about/ ­ DNR draft: https://datatracker.ietf.org/doc/draft-ietf-add-dnr/ ­ DDR draft: https://datatracker.ietf.org/doc/draft-ietf-add-ddr/
35

#RSAC
Additional Resources
#3 - JCS (RFC 8785)
­ Specification and Libraries
https://datatracker.ietf.org/doc/html/rfc8785 JavaScript: https://www.npmjs.com/package/canonicalize Java: https://github.com/erdtman/java-json-canonicalization Go: https://github.com/gowebpki/jcs .NET/C#: https://github.com/cyberphone/json-canonicalization/tree/master/dotnet Python: https://github.com/cyberphone/json-canonicalization/tree/master/python3
#3 - JWS-CT Specification
­ Current Version: https://datatracker.ietf.org/doc/html/draft-jordan-jws-ct-07
36

#RSAC
Additional Resources
#4 - Relay Technology
­ OHAI: https://datatracker.ietf.org/wg/ohai/about/ ­ MASQUE: https://datatracker.ietf.org/wg/masque/about/ ­ Private Access Tokens: https://datatracker.ietf.org/doc/draft-private-
access-tokens/
37

#RSAC
Additional Resources
#5 - Post-quantum cryptography
­ NIST process:
https://csrc.nist.gov/projects/post-quantum-cryptography
­ ETSI Quantum-Safe Cryptography group:
https://www.etsi.org/technologies/quantum-safe-cryptography
­ IETF Post-Quantum efforts:
https://github.com/rdanyliw/ietf-pq-maintenance/blob/main/pqmcharter.md
38

#RSAC
Additional Resources
#6 - CACAO Specification
­ Version 1.0:
https://www.oasis-open.org/2021/07/13/cacao-security-playbooks-v1-0from-cacao-tc-approved-as-a-committee-specification/
­ Version 1.1:
https://docs.oasis-open.org/cacao/security-playbooks/v1.1/securityplaybooks-v1.1.html
39

#RSAC
Additional Resources
#7 - ITU Cyber Defence Centres
­ X.1060 ­ https://www.itu.int/rec/T-REC-X.1060-202106-I
#8 - GSMA 5GMRR (Mobile Roaming Revisited)
­ https://www.netnumber.com/security-of-5g-sa-roaming/ ­ Join GSMA to find out more
40

#RSAC
Additional Resources
#9 - EN 303 645: Cyber Security for Consumer Internet of Things
­ ETSI's web page describing their IoT security work:
https://www.etsi.org/technologies/consumer-iot-security
­ EN 303 645 standard:
https://www.etsi.org/deliver/etsi_en/303600_303699/303645/02.01.01_60/e n_303645v020101p.pdf
#10 - TS 103 701: EN 303 645 Assessment Specification
­ https://www.etsi.org/deliver/etsi_ts/103700_103799/103701/01.01.01_6 0/ts_103701v010101p.pdf
41

#RSAC
Appendix
Examples

#RSAC
#3 - JWS-CT Example
Normal/Classic JWS Signature Type Three parts: <header> . <payload> . <signature> eyJ0eXAiOiJKV1QiLA0KICJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJqb2UiLA0KICJl eHAiOjEzMDA4MTkzODAsDQogImh0dHA6Ly9leGFtcGxlLmNvbS9pc19y b290Ijp0cnVlfQ.dBjftJeZ4CVP-mB92K27uhbUJU1p1r_wW1gFWFOEjXk
Detached JWS Signature Type Detached mode: <header> . . <signature> eyJ0eXAiOiJKV1QiLA0KICJhbGciOiJIUzI1NiJ9..dBjftJeZ4CVPmB92K27uhbUJU1p1r_wW1gFWFOEjXk
43

#RSAC
#3 - JWS-CT Signing Example

Create the JSON Object to be signed Canonicalize the JSON Object Generate a JWS string Assemble the signed JSON Object

{ "statement": "Hello signed world!", "otherProperties": [2000, true] }

44

#RSAC
#3 - JWS-CT Signing Example (cont.)

Create the JSON Object to be signed Canonicalize the JSON Object Generate a JWS string Assemble the signed JSON Object

{"otherProperties":[2000,true], "statement":"Hello signed world!"}

45

#RSAC
#3 - JWS-CT Signing Example (cont.)

Create the JSON Object to be signed Canonicalize the JSON Object Generate a JWS string Assemble the signed JSON Object

eyJhbGciOiJIUzI1NiJ9..VHVItCBCb8Q5 CI-49imarDtJeSxH2uLU0DhqQP5Zjw4

46

#RSAC
#3 - JWS-CT Signing Example (cont.)

Create the JSON Object to be signed Canonicalize the JSON Object Generate a JWS string Assemble the signed JSON Object

{ "statement": "Hello signed world!", "otherProperties": [2000, true], "signature": " eyJhbGciOiJIUzI1NiJ9.. VHVItCBCb8Q5CI-49imarDtJeSxH2uL U0DhqQP5Zjw4 " }

47

