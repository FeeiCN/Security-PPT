AIL Framework for Analysis of Information Leaks
From a CSIRT use-case towards a generic analysis open source software
Team CIRCL - TLP:WHITE
info@circl.lu
FIRST 2017

Leaks and CSIRT day-to-day operations
· Analysing and notifying about information leaks can be time consuming (e.g. national/sectoral CSIRT level)
· Notification can be challenging (e.g. what kind of trusted channels do you have to communicate with a victim?)
· When leaks are publicly known, interaction with media/press can be significant
· Analysis of mixed structured and unstructured data from untrusted sources (e.g. fake and duplicate leaks)
2 of 29

A source of leaks: Paste monitoring
· Example: http://pastebin.com/  Easily storing and sharing text online  Used by programmers and legitimate users  Source code & configuration information
· Abused by attackers to store:  List of vulnerable/compromised sites  Software vulnerability (e.g. exploits)  Database dumps  User data  Credentials (3rd party)  Credit card details  ... more and more ...
3 of 29

Paste monitoring at CIRCL: Key numbers

· Monitored paste sites: 27 · Keywords - Search terms: 420 · Keywords - Constituency related: 90 · Time for one ticket: 5 min - 1 hour

Table : Key numbers for 2016

Pastes 2016

Jan

Feb

Mar

Apr

Mai

Jun

Jul

Aug

Sep

Oct

Nov

Dec

Fetched pastes Keywords hits Constituency hits Security related (TR-46)

1 439 453 5394 1792 30

1 537 186 4407 1402 22

1 719 646 4072 741 28

1 622 674 11 455 1273 19

1 595 881 4722 1146 15

1 561 700 4158 795 13

1 422 628 4083 598 16

1 443 938 3796 644 8

1 519 026 4235 717 13

1 581 793 3970 953 22

1 656 985 4155 736 38

1 464 214 4350 643 28

Incidents & investigations

65

55

76

44

31

36

40

21

39

59

104

79

4 of 29

Paste monitoring: Statistics

Table : Statistics for 2016

Pastes 2016

Monthly average

Total

Fetched pastes Keywords hits Constituency hits Security related (TR-46)

1 547 094 4900 953 21

18 565 124 58 797 11 440 252

Incidents & investigations

54

649

5 of 29

Paste monitoring: TR-46 approach
https://www.circl.lu/pub/tr-46
6 of 29

Paste monitoring: TR-46 approach
· How to deal with numerous requests from press/media or potential victims. The TR-46 document includes:  Risks with stolen email addresses  Risks with stolen (hashed) passwords  How to mitigate the risks  How to prevent collateral damage  How do we find leaks  Reference of leaks (with the number of affected users in CIRCL's constituency)
· We don't provide any form for validation of email/credential leaks. This can be conflictual with general security awareness (e.g. entering email/credentials on unknown websites).
7 of 29

Paste monitoring: TR-46 approach
8 of 29

AIL Framework
· AIL initially started as an internship project (2014) to evaluate the feasibility to automate the analysis of (un)structured information to find leaks.
· In 2017, AIL framework is an open source software in Python. The software is actively used (and maintained)1 by CIRCL.
· Extending AIL to add a new analysis module can be done in 50 lines of Python.
· The framework supports multi-processors/cores by default. Any analysis module can be started multiple times to support faster processing during peak times or bulk import.
1To follow our mantra: to "eat our own dogfood"
9 of 29

AIL Framework
10 of 29

AIL
11 of 29

AIL
12 of 29

AIL
13 of 29

AIL
14 of 29

AIL
15 of 29

AIL
16 of 29

AIL
17 of 29

AIL
18 of 29

AIL
19 of 29

AIL
20 of 29

AIL
21 of 29

AIL - Sentiment Analysis
22 of 29

AIL - Run your own instance
https://github.com/CIRCL/AIL-framework
23 of 29

AIL - Run your own instance: With pystemon
https://github.com/CIRCL/pystemon
24 of 29

AIL - Run your own instance: Use CIRCL feed
Request access at: info@circl.lu
25 of 29

AIL - Add your own module
Choose where to locate your module in the data flow:
26 of 29

AIL - A sample module structure
import time import re from pubsublogger import publisher from packages import Paste from Helper import Process if __name__ == '__main__':
# Port of the redis instance used by pubsublogger publisher.port = 6380 # Script is the default channel used for the modules. publisher.channel = 'Script' # Section name in bin/packages/modules.cfg config_section = 'Cve' # Setup the I/O queues p = Process(config_section) # Sent to the logging a description of the module publisher.info("Run CVE module") # Endless loop getting messages from the input queue while True:
message = p.get_from_set() if message is None:
publisher.debug("{} queue is empty , waiting".format(config_section)) time . sleep (1) continue cveextract(message)
27 of 29

Conclusion
· Building AIL helped us to find additional leaks which cannot be found using manual analysis and improve the time to detect duplicate/recycled leaks.
·  Therefore quicker response time to assist and/or inform proactively affected constituents.
· Separating collection and analysis parts allowed us to extend the models in the CSIRT services.
· The modular architecture helped us to use the extracted data to feed Passive DNS or crawl Tor .onion.
· Ongoing work: Integrating AIL leak into MISP to curate, share and collaborate on leaks.
28 of 29

· Q&A · https://github.com/CIRCL/AIL-framework · Don't hesitate to contact us for feed access/exchange or ideas at
mailto:info@circl.lu
29 of 29

