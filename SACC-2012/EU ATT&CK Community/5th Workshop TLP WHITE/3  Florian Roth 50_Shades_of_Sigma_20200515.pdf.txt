50 Shades of Sigma
Describe and Share Generic Threat Detection Methods Florian Roth

About Me
§ Florian Roth § Head of Research @ Nextron Systems § IT Sec since 2000, Nation State Cyber
Attacks since 2012 § THOR Scanner § Twitter @cyb3rops § Open Source Projects:
§ Sigma (Generic SIEM Rule Format) § LOKI (Open Source Scanner) § APT Groups and Operations Mapping § Antivirus Event Analysis Cheat Sheet § ...

Overview
§ What is Sigma? § Why Sigma?
§ Why do I believe that Sigma succeeds?
§ Sigma ­ Quo vadis?
§ What is going to change?
§ Shades of Sigma
§ STIX to Sigma § Sandbox Integration § Detect Unknown Threats

What is Sigma?
Sigma is for log data what YARA is for files and Snort is for network traffic .

What is Sigma?
Sigma is a generic rule format to express detection ideas on log data .

What does Sigma look like?
Example: Microsoft Office program spawning a Windows executable
https://app.any.run/tasks/b35cc0bc-1493-44bb-a1d8-49b68f92fade/

What does Sigma consist of?

Specification

Public Domain

"Sigmac" Rule Converter
17 Backends

LGPL

Detection Rule License (DRL)

Rule Set
600+ Open Source Rules

Quote
Simplicity is the ultimate sophistication . - Leonardo da Vinci

Why Sigma?
§ Simplicity
§ Users like it: Easy to read and write § Developers like it: Manageable specs and expressions
§ Immediate Benefit
§ Big rule base with more than 600 rules § Integrated converter for 17 backends (query generator)
§ No Product-Specific Focus
§ No overreaching vendor § No SIEM specific expressions

Sigma - Quo Vadis?
§ Adding Clarity
§ Better documentation § Which fields can I use? § How can I adjust it to my local field names? § How can I provide a new backend?
§ Improved test scripts § Why does my pull request fail? § Can I be sure that it doesn't cause false positives?
§ Ease of Integration
§ Rewrite Sigmac's code base § Rule's GPL license to Detection Rule License (DRL) 1.0 § Convince more vendors for native support
§ Gain Maturity
§ Automated rule testing § Releases, Roadmap, Web Page § Twitter account

Shades of Sigma
Ideas, Impulses, Use Cases

STIX to Sigma 1/2
§ Sigma is designed to describe methods / techniques
§ Users tend to include IOCs in Sigma rules
§ Why: Need to query IOCs § STIX and CSVs don't help > no native integration
§ Project idea: STIX to Sigma converter
§ as Web Tool
§ Like Google Translate or SOCPrime's uncoder.io
§ as Library
§ to be used in MISP / OpenCTI / EclecticIQ

STIX to Sigma
Here is a set of IOCs, click on this button and we open a new tab with a SIEM query for these IOCs

Sandbox Integrations 1/2
§ Process command line, process tree, registry events, web request, file creation, ...
§ Apply Sigma rules to exported logs
§ Stage 1: Show matches § Stage 2: Allow searches
using rule names
§ Show all samples with matching Sigma rule X
§ Stage 3: Allow searches using custom(!) Sigma rules

Sandbox Integrations
Here is your sandbox report, this is a Sigma rule that triggered and here are other samples triggering that rule as well as a query for your SIEM.

Detect the Unexpected 1/3

All Events

Threats

Possible Events but never generated

Unknown Threats

Analyst View

Developer View

Detect the Unexpected 2/3
§ Exemplary rule 1: OpenSSH § Exemplary rule 2: Django

Detect the Unexpected
Here is our product, and here is a set of Sigma rules to detect events that indicate dangerous conditions or threats.

Thanks to all contributors
Rules: @cyb3rops me Rule Converter: @blubbfiction Thomas Patzke Twitter: @sigma_hq Slack: siemexchange.slack.com (contact us for invites) More information: https://github.com/Neo23x0/sigma

