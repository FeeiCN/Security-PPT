SESSION ID: TECH-F01
SOC Automation, Enterprise Blueprinting and Hunting Using Open-Source Tools

John Holowczak
Sr. Threat Analyst, Threat Analysis Unit Carbon Black @Skipwich

Brian Baskin
Sr. Threat Researcher, Threat Analysis Unit Carbon Black @bbaskin

#RSAC

#RSAC
Agenda
What and Why ­ Baselining Exercises in Blueprinting your Organization Automate the SOC Threat Hunting
2

Baselining and Blueprinting
"No one's ever hacked me, so I don't have a baseline"

4 | © 2018 Carbon Black. All Rights Reserved. I CONFIDENTIAL

#RSAC
Know Your Environment
5

#RSAC
Know Your Environment
Turn over every stone; even normal behavior may be abnormal in reality When processing data, classify normal behavior and abnormal behavior ­ Certain behaviors can have multiple classifications Start your classification buckets large, add detail after each pass
6

"Blueprinting" Methods
Reactive
Firehose Ingest all data into a SIEM Tune False Positives Forever

#RSAC
Proactive
Blueprint First Create rules to find abnormal behavior Spend less time fighting False Positives and SIEM fires Later: Match against findings from threat hunts

7

#RSAC
Tools and Procedures
8

Enterprise Blueprinting

#RSAC
Intro to OSQuery
Open source tool for querying endpoint metadata (at scale) like a database Utilizes SQL to expose data via a common interface Extensible in a number of languages
­ Add your own query-able data types
10

#RSAC
Pros/Cons
Pros
­ Easy to get data from a number of endpoints at scale ­ Quickly query data using a common language (SQL) ­ Exhaustive list of metadata that is continually growing
Cons
­ May be difficult to deploy across entire environment
o Common orchestration tools can help with this (Ansible, Puppet, Chef)!
11

#RSAC
Further Information
List of schema available at https://osquery.io/schema/3.3.0 (latest version) Some schema offer event information such as process_file_events which includes timestamps with when an event took place
­ Can only get this info if running OSquery in daemon mode, as it is an evented table
Other file information schema:
­ Signature information ­ Startup items ­ Scheduled tasks
12

#RSAC
Low Prevalence Executables
13

#RSAC
Low Prevalence Executables
One-offs or rare applications Care less about the most common running programs Classify normal and abnormal for rarities to job functions
14

#RSAC
Leveraging OSQuery
15

#RSAC
Networking Data
SNMP (or equivalent) to pull data from your networking devices ARP Tables are a great start for network data collection Acquire IP and MAC addresses easily MAC Addresses are a great way to identify vendors on your network
16

#RSAC
Some common OUIs
https://www.wireshark.org/tools/oui-lookup.html
17

#RSAC
Using OSQuery to Enrich our Networking Data
OSQuery is a great tool to grab point-in-time endpoint data to supplement networking data Compare NICs and ARP tables on endpoint against Networking equipment ARP tables Great way to do full-coverage rogue detection
18

#RSAC
Getting ARP data from OSQuery
Using the osqueryi command locally we can test out our queries before running against whole environment
19

SOC Automation
Easing the task of baselining

Automation Overview
Is...
Running repetitive tasks allowing your team to focus on studying of data
­ Data Collection ­ Aggregation

#RSAC
Isn't...
Creating scripts/programs to find possible bad
­ This is what SIEM's do!
Programs making and acting on decisions for us
­ "Should I automatically ban this machine because it doesn't match the baseline?"

21

#RSAC
Where do you put your data?
22

#RSAC
Data Collection
Many Examples in Python, Powershell, Bash Leverage libraries to do most of the heavy lifting Stack Overflow is your friend if you get stuck Choose a database or stack to store it all in
23

#RSAC
Data Storage
Storage doesn't need to be fancy, a single simple database will be fine Don't throw all data into one table; Design a database for better organization POC with SQLite, easily stand up a database with Docker images
24

#RSAC
Querying Data
Possible to leverage tools like Jupyter Notebook or R to automate some of your studies (programming heavy)
­ Takes less time to get started
However, ELK is easier to query
­ May take longer to set up though there are some awesome tools out there to ease into the process
25

#RSAC
Docker
Public Docker containers exist to get you started with a simple Elasticsearch, Logstash, and Kibana stack (easy) All that's left to you is setting up data inputs (more involved) Filebeat (part of ELK stack) allows for seamless integration with forwarding OSquery into logstash Easy-to-follow guide: https://elkdocker.readthedocs.io/
26

#RSAC
Filebeat
Filebeat is a log forwarding service, part of the ELK stack Has built-in templates for transforming OSQuery data into an easily-digestible format. Somewhat involved setup to work properly with OSQuery
­ OSQuery also has built in support for pushing to LogStash
27

#RSAC
Configuring OSQuery for scheduled queries
{ "options": { "host_identifier": "hostname", "schedule_splay_percent": 10 }, "schedule": { "arp_cache": {
"query": "SELECT * FROM arp_cache;", "interval": 10 } } }
28

#RSAC
Next Steps
Forward OSQuery (using Filebeat) to Logstash, start hunting with Kibana
29

Threat Hunting
Tying it all together

#RSAC
Using Statistical Analysis for Threat Hunting

Baseline Filter
Identify

Determine the "normal" dataset Eliminate baseline as noise Investigate anomalies & statistical deviations
31

#RSAC
Analyzing Data
32

#RSAC
Hunting Methodologies
Back to the basics; now time to look for the abnormal Where to start? Search across environments for behavior and static IOC's Least prevalent occurrences tend to be most abnormal
33

#RSAC
Mac Addresses ­ Uncommon Environmental OUIs
34

#RSAC
Prevalence of Executables
Can you:
­ Identify abnormal software running on fewest endpoints?
­ Identify executables that are widespread but in unusual places?
Yes!
­ Extract data on binaries from osquery ­ Combine into CSVs and perform text
magic
35

#RSAC
Filtering Data
Expressions to hunt for unusual indicators
­ Files that have a single character filename: `\\.\....,'
­ Files running one-folder deep from volume root: `(:\\[a-zA-Z0-9]{1,12}\\[a-zA-Z0-9]*\....,)'
­ Files run directly from Windows folder: `(:\\windows\\.{1,15},)'
­ Files with unusual extensions: `(\.bin,|\.dat,|\.log,|\.gif,|\.txt,|\.jpg,|\.rar,|\.sql,)'
36

Mass Searching
One-character file names:
6 c:\tdm-gcc-64_4.9.2\work\a.exe 1 c:\accbk\agusta\y.bat 1 c:\users\jsmith\appdata\local\microsoft\windows\temporary internet files\content.ie5\4unu162n\..exe 1 sysvol\users\z9service\downloads\q.exe 1 sysvol\program files (x86)\k2 for sharepoint 2013\z.bat
Low prevalence in Windows Folder
22 c:\windows\psexesvc.exe 1 c:\windows\system32\oem\firstboot.cmd 1 sysvol\windows\system32\dsget.exe 1 c:\windows\system32\hpbpro.exe 1 c:\windows\system32\scardsvr.exe

#RSAC

37

#RSAC
A Story of Two Executables (PLink)
38

#RSAC
Apply What You Have Learned Today
Next week you should:
­ Create a quick plan on how to baseline your environment
o Attempt some of the examples I showed today
In the first three months following this presentation you should:
­ Minimizing previous bias, blueprint your environment as much as possible
o Keep being proactive in mind!
Within six months you should:
­ Automate your baselining tasks to focus on threat hunting and making your blueprinting more robust
39

#RSAC
HMaapsspSyearHchuinng ting!
40

