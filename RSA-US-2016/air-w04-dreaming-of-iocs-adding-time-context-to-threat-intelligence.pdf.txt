SESSION ID: AIR-W04
Dreaming of IoCs Adding Time Context to Threat Intelligence
#RSAC

Travis Smith
Senior Security Research Engineer Tripwire, Inc. @MrTrav

THREAT INTEL

#RSAC

Longitude: -117.9190333

Latitide: 33.8120584

@MrTrav
2

#RSAC
What is an Indicator of Compromise
An artifact observed on the network or operating system
@MrTrav
3

#RSAC
Formats
@MrTrav
4

#RSAC
What Is Threat Intelligence
"Evidence-based knowledge, including context, mechanisms, indicators, implications and actionable advice about an existing or emerging menace or hazard to assets that can be used to inform decisions regarding the subject's response to that menace or hazard."
"Intelligence is information that has been analyzed and refined so that it is useful to policymakers in making decisions."
@MrTrav
5

#RSAC
CTI Triad

@MrTrav

Actionable
6

THREAT INTEL

#RSAC

Longitude: -117.9190333

Latitude: 33.8120584

Culprit: Billy Two Tone

Affiliations: Slingers

Victims: Elderly

Tactics: Slingshot

Time: 1949

@MrTrav
7

THREAT INTEL

#RSAC

Longitude: -117.9190333

Latitude: 33.8120584

Culprit: Billy Two Tone

Affiliations: Slingers

Victims: Elderly

Tactics: Slingshot

Time: 1949

@MrTrav
8

#RSAC
Definition
@MrTrav
9

TAXII/STIX/CYBOX
@MrTrav
10

#RSAC
Data Model · Package · Report · Campaign · Couse of Action · Exploit Target · Incident · Indicator · Threat Actor · TTP
http://stixproject.github.io/data-model/

#RSAC
Sharing is Caring
Threat Intelligence / Information Sharing
Aggregators of data sources Open Source
Sandbox Solutions
Walled Gardens Closed Source
@MrTrav
11

#RSAC
Aggregators
I know this is bad, do I see it?
Search logs for hash/IP
I have something, is it bad? Pros ­ proactive response Cons ­ open source/free providers, questionable sanitization
@MrTrav
12

#RSAC
Walled Gardens
I have something, tell me what you think of it
Find a file, reference it See an IP, reference it
Pros ­ Sanitized and timely data Cons
Can be expensive Performance - lots of lookups
@MrTrav
13

#RSAC
Collective Intelligence Framework

#RSAC
Collective Intelligence Framework
http://csirtgadgets.org/collective-intelligence-framework https://github.com/csirtgadgets/massive-octo-spice
@MrTrav
15

#RSAC
Collective Intelligence Framework
Requirements
Small: 16GB/8 cores/250GB Large: 32GB/16 cores/500GB Extra Large: 64GB/32 cores/500GB
CIFv1 Installation
Lots of dependencies, lots of effort
CIFv2 Installation
EasyButton!
@MrTrav
16

#RSAC
Collective Intelligence Framework
cif --otype ipv4 --format csv
MD5 URL FQDN
cif --otype ipv4 --format csv
CSV JSON
@MrTrav
17

#RSAC
Logstash

#RSAC
Intro to Logstash
@MrTrav

#RSAC
Intro to Logstash

INPUTS FILE

SYSLOG EVENTLOG

STDIN

40+ More

FILTERS GROK

GEOIP

TRANSLATE

DATE

30+ More

OUTPUTS

ElasticSearch

SYSLOG

@MrTrav

EMAIL

STDOUT
20

50+ More

#RSAC
Logstash Filtering
Utilizing Custom Patterns GROK Message Filtering Adding Custom Fields Date Match Using Translations for Threat Intelligence
@MrTrav
21

#RSAC
Logstash Filtering
filter { grok { match => { "message" => "%{IP:client} %{WORD:method}
%{URIPATHPARAM:request} %{NUMBER:bytes} %{NUMBER:duration}" }
} }
@MrTrav
22

#RSAC
Logstash Filtering
filter { grok { patterns_dir => "/opt/logstash/custom_patterns" match => { message => "%{123456}" } }
}
@MrTrav
23

#RSAC
Logstash Filtering
@MrTrav
24

#RSAC
Logstash Filtering

filter {

if [message] =~ /^(([^,]+),([^,]+),([^,]+),([^,]+),...)/ {

grok {

patterns_dir => "/opt/logstash/custom_patterns"

match => {

message => "%{123456}"

}

}

Remove Capture Groups

}

}

(?<node_name>[^,]+),(?<node_type>[^,]+),(?<rule_name>[^,]+),(?<element_name>[^,]+),...
@MrTrav
25

#RSAC
Logstash Filtering
filter {
if [message] =~ /^(([^,]+),([^,]+),([^,]+),([^,]+),...)/ {
grok { patterns_dir => "/opt/logstash/custom_patterns" match => { message => "%{291001}" } add_field => [ "rule_id", "123456" ] add_field => [ "Device Type", "FIM" ] add_field => [ "Object", "File" ] add_field => [ "Action", "Modified" ] add_field => [ "Status", "Success" ]
} } }
@MrTrav
26

#RSAC
Logstash Filtering
filter { ....all normalization code above here .... date { match => [ "change_time", "M/d/YY h:m a" ] }
}
change_time: 3/2/16 10:20 AM
@MrTrav
27

#RSAC
Logstash Filtering
filter { ....all normalization code above here.... translate { field => "md5" destination => "maliciousMD5" dictionary_path => /opt/logstash/maliciousMD5.yaml' }
}
· Logstash will check the YAML for updates every 300 seconds
· Configurable by adding refresh_interval => numSeconds
@MrTrav
28

#RSAC
Yet Another Python Script
cif ­otype md5 --format csv
https://github.com/travisfsmith/iocdreaming
@MrTrav
29

#RSAC
Intro to Logstash

INPUTS FILE

SYSLOG EVENTLOG

STDIN

40+ More

FILTERS GROK

GEOIP

TRANSLATE

DATE

30+ More

OUTPUTS

ElasticSearch

SYSLOG

@MrTrav

EMAIL

STDOUT
30

50+ More

Logstash Filtering
@MrTrav

#RSAC
Custom Fields: "Device Type" => "FIMDevice" "Object" => "File" "Action" => "Added" "Status" => "Success"
Threat Intel Translations: "maliciousMD5" => "YES"
Date Matching: "change_time" => "3/2/16 10:20 AM" "timestamp" => "2016-03-02T18:20:00.000Z"
31

#RSAC
Logstash Filtering
1. Collect intelligence feeds 2. Update security tools with intel 3. Monitor observable which doesn't match any feed 4. Feeds updated with observable previously already inspected....
@MrTrav
32

#RSAC
TARDIS

#RSAC
TARDIS
Threat Analysis, Reconnaissance, & Data Intelligence System Historical Exploit/IOC Detection Time Lord of Forensic Log Data Available at: https://github.com/tripwire/tardis
@MrTrav

#RSAC
Yet Another Python Script
cif ­otype md5 --format csv
https://github.com/travisfsmith/iocdreaming
@MrTrav
35

#RSAC
TARDIS
https://github.com/Tripwire/tardis
@MrTrav
36

#RSAC
TARDIS
1. Collect intelligence feeds 2. Update security tools with intel 3. Monitor observable which doesn't match any feed 4. Feeds updated with observable previously already inspected.... 5. Search repository for observable
@MrTrav
37

#RSAC
Architecture
maliciousMD5.yaml
@MrTrav

#RSAC
Kibana Reporting
39

#RSAC
Kibana
The ELK Stack Search, Visualize, Dashboard Zoom In & Out
@MrTrav

#RSAC
Kibana Searches
@MrTrav
41

#RSAC
@MrTrav
42

#RSAC
Kibana Visualizations
@MrTrav
43

#RSAC
Area Chart
@MrTrav
44

#RSAC
Line Chart
@MrTrav
45

#RSAC
Pie Chart
@MrTrav
46

#RSAC
Geo Location
@MrTrav
47

#RSAC
Kibana Dashboard
@MrTrav
48

#RSAC
@MrTrav
49

#RSAC
Live Demo
50

#RSAC
Notable Resources
https://github.com/tripwire/tardis https://github.com/travisfsmith/iocdreaming http://www.elastic.co http://csirtgadgets.org/collective-intelligence-framework/
@MrTrav

#RSAC
Next Steps
0-3 Months
Identify Security Components Which currently don't integrate with Threat Intel? Which capture valuable observables?
3-6 Months
Integrate security tools with actionable threat intelligence
6+ Months
Fine tune workflows
@MrTrav
52

SESSION ID: AIR-W04
Dreaming of IoCs Adding Time Context to Threat Intelligence
#RSAC

Travis Smith
Senior Security Research Engineer Tripwire, Inc. @MrTrav

