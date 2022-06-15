DSMS
Decision Support Monitoring System
!
· Automate incident response workflows · Track threat life cycles · Open source

IR team challenges

Typical IR workflows

Many steps Unsafe handling of malicious files May be identified by attackers based on IP, metadata Storage inconsistent, tedious Repeated, manual re-checking of targets time-consuming Manual decision making on targets: malicious or not? Results can take a long time to arrive (e.g. external sandboxes)

DSMS goals
High automation Repeated monitoring with custom schedules Historical archive Consistent analysis methods Consistent storage of artifacts (Git) Non-attributable monitoring

Distributed, geographically diverse monitoring
API to receive threat data (URLs, domains, files) from other systems
API to publish threat status to other systems
Custom analysis workflows
Identify priority targets based on gathered data

DSMS in action

Technical details

Platform / technologies
Python Django Celery (distributed task execution) RabbitMQ Ubuntu 14.04 (current supported OS)

Architecture

Hosting
Core: internal (Postgres + file repo + Django + dispatcher) Broker: DMZ or external (RabbitMQ + SFTP server) Agents: external (Celery task execution, data collection)

Current modules

HTTP status HTTP spidering URL screenshot IP resolution ASN /ISP lookup WHOIS lookup and parsing OS fingerprinting

Web site fingerprinting VirusTotal analysis CWSandbox analysis

Future features

Tagging targets for analyst notes
Classification and prioritisation of targets
Android binary analysis
Further HTML / Javascript analysis with Thug
Passive DNS
TLS certificate analysis

Bitcoin wallet monitoring Email address analysis Artifact similarity analysis

Collaboration
Open source (Apache) licence Currently available to interested co-developers and contributors Feature requests and patches highly encouraged! Commercial support available

Thank you
Questions and enquiries welcome: dsms@hkcert.org

