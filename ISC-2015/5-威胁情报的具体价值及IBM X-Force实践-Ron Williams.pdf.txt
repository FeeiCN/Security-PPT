

X-Force Exchange
The Concrete Value of Threat Intelligence Sharing
and IBM X-Force Practice

Ron Williams, STSM

Chief Architect, Infrastructure SecRuorniWtyilliams, STSM, Principal

IBM Security

Architect IBM

Agenda
Threat Analyst Operations - `Getting to Go' The Power of Community Analyzing, Mitigating, and Sharing Active Threats
Copyright 2015 IBM Corporation

The Internet is Really ­ REALLY BIG
4.2 Billion IPv4 Addresses (Research indicates visibility to ~1.2 Billion < 25%) 7x1038 IPv6 Addresses
Systematic Scanning & Site Analysis is mathematically infeasible.
Effective Internet Threat Data starts with observables associated with questionable activity.
Effective Internet Threat Intelligence starts with intranet observables correlated with Internet Threat Data.
IBM Daily Analyzes 12+ Million Malicious Emails, 10+ Million Web Sites, Generating and updating new threat data across ~1 Billion IPs & URLs
Copyright 2015 IBM Corporation

Effective Threat Intelligence
Starts with a trigger (observable) · Malicious Mail (SPAM) -> Dropper URLs, Associated IP's, Actual Malware · Detected Malware Beaconing to Unknown IP · Network Observable (Suspicious Destination Address) Further Analysis · IP/URL ­ Have other's seen malicious activity? Multi-hoster? New Domain? · Has malware been found? Has it's C2 infrastructure been identified · Can other's confirm the `Three-Legged Stool: IP, URL, Malware'
Copyright 2015 IBM Corporation

Of Observables and Indicators
Q: When does an `observable' become an `indicator'
Copyright 2015 IBM Corporation

Of Observables and Indicators
A: When it's associated with other known malicious observables
Copyright 2015 IBM Corporation

Collecting the data ­ making the correlation
True 0-Days may be confirmed in one of two-ways 1. Human Analysis 2. Automated Behavioral analysis of one or more of the observables (IP, URL,
Malware, Compromised System)
The `holy grail' of Threat Mitigation is `Automated Action' based on `Actionable Intelligence'
We have technical examples of this today in Next Generation Firewalls, Intrusion Prevention Systems, Malware Sandboxes, Security Information and Event Management Systems.
But there is yet to be an end-to-end and automated system that can start with a zero-day threat and end with automated and actionable threat intelligence.
Copyright 2015 IBM Corporation

Getting to `go' ­ the role of the threat analyst
Until a Watson or Hal takes over the internet ­ The Human Security Analyst remains the most important part of any Threat Protection System. His or her role is to: 1. Understand a threat and how to mitigate it 2. Apply business metrics to prioritize threat mitigation 3. And Increasingly ­ how to apply tools to continuously shorten the time from
identification to validation to prioritization to mitigation (or risk acceptance)
Copyright 2015 IBM Corporation

Actors Techniques, Tactics, Procedures Indicators Vulnerabilities
Internet Threat Activity

Active Threat Analysis

Analyst's Scope:
Detection/Response
Intranet Topology
Use Cases Prevention Detection Response
Copyright 2015 IBM Corporation

infiltrating an enterprise (darkhotel)
A. At hotel, I want WiFi access in Lobby B. Presented with `Hotel's' WiFi Finder App and promise of Free WiFi C. Select `Connect' - authenticate to O/S to permit installation
Powned D. Urgent phone call - close laptop - leave town
Copyright 2015 IBM Corporation

back home in SOC
1. SIEM Alert - SRC 172.10.34.17 DEST 216.158.85.49 2. Identified C2 Communications 3. Response
1. Identify SRC Machine from Asset Repository/Network 2. Institute Malware Scan 3. Found Suspicious File MD5: 560d68c31980c26d2adab7406b61c651
Copyright 2015 IBM Corporation

Copyright 2015 IBM Corporation

Copyright 2015 IBM Corporation

Copyright 2015 IBM Corporation

Copyright 2015 IBM Corporation

threat data -> intelligence
Copyright 2015 IBM Corporation

what we can share
Attack Flow Suspect Internet IP's & URLs Identified Malware Signatures Other IOC's (Registry Keys, dropped files, command files, executables, etc.) Meaningful Correlations Significant data to assist the 2nd analyst
Copyright 2015 IBM Corporation

what we (typically) don't share
internal infrastructure (internal networks, ip's) 0day application and system vulnerabilities (unpublished) target specific data (individuals, accounts, ip addrs, etc)
Copyright 2015 IBM Corporation

Threat Intelligence ­ Enabling Machine Processing
Making Threat Data and Intelligence Available · For the Human Analyst · For the Human Analysts Tools · Building and Threat Intelligence Ecosystem
Copyright 2015 IBM Corporation

Copyright 2015 IBM Corporation

Accessing X-Force Exchange API
Public (free) Access X-Force Exchange https://exchange.xforce.ibmcloud.com X-Force Exchange API https://api.xforce.ibmcloud.com/doc
Copyright 2015 IBM Corporation

Who's Using X-Force Exchange?
Threat Researchers ­ Aggregating IP, URL, Malware, and Vulnerability reports into Collections Customers in Finance, Banking, Retail, and Energy Managed Security Services Analysts ­ Using Collections to create report with historical threat information for operations. 3rd Party Developers building SDK's to integrate X-Force Exchange Data with their own offerings (GitHub)
Copyright 2015 IBM Corporation

Accessing the API
Copyright 2015 IBM Corporation

Copyright 2015 IBM Corporation

Request (curl) curl -X GET --header "Accept: application/json"
"https://api.xforce.ibmcloud.com/auth/anonymousToken"
Response Body: {
"token": <jwt> }
The <jwt> goes into Authorization Headers for subsequent requests like this:
curl -X GET --header "Accept: application/json" --header "Authorization: "Bearer <jwt>"
Copyright 2015 IBM Corporation

curl -X GET --header "Accept: application/json" --header "Authorization: Bearer <jwt>" https://api.xforce.ibmcloud.com/ipr/1.2.3.4"

Response (partial) in JSON Format [ {
"ip": "1.2.3.4", "cats": {
"Anonymisation Services": 43, "Malware": 71, "Botnet Command and Control Server": 71 }, "reason": "Content found on multihoster", "created": "2015-06-16T09:48:00.000Z", "score": 7.1, "subnet": "1.2.3.4/32" }, "cats": { "Anonymisation Services": 43, "Malware": 71, "Botnet Command and Control Server": 71 }, "geo": { "country": "Australia", "countrycode": "AU" }, "score": 7.1 }]

Copyright 2015 IBM Corporation

TAXII Interface (for STIX Formatted IP, URL, VULN, and User Collections)
Copyright 2015 IBM Corporation

Copyright 2015 IBM Corporation

Copyright 2015 IBM Corporation

The Importance of Threat Intelligence Sharing
Research estimates indicate less than 20% of the IPv4 namespace is analyzed and categorized.
Increasingly, attacks use dynamic ip addresses and dynamically generated domain names to direct victims to command and control servers. This means that internet scanning and analysis by itself is not sufficient to protect against attack.
For IPv4 alone ­ there are over 4 billion possible endpoints. It is not possible to understand the state of all endpoints instantaneously. IPv6 renders random internet scanning a very low yield activity.
The ability to share active attack information with trusted colleagues and communities provides the most current information from which active attacks might be thwarted.
Copyright 2015 IBM Corporation

The Unthinkable or Unacceptable is not the same as the Impossible. Plan for it - or it will plan for you.
­ Anonymous
Copyright 2015 IBM Corporation

https://exchange.xforce.ibmcloud.com
ron williams, senior technical staff member ibm security
Copyright 2015 IBM Corporation

