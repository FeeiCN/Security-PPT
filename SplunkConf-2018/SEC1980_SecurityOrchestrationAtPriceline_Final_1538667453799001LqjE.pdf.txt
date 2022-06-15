Security Orchestration @priceline.com
Tony Lin | Sr. Security Engineer
October 2018

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
 Priceline offers more ways to save and more deals than anyone else in travel. With multiple ways to save on hotel rooms, rental cars, airline tickets, vacation packages and cruises, Priceline is a one-stop-shop for travelers looking for great deals. · ~$10B Saved through its suite of travel reservation services. · 100M Reservations · Up to 60% discounts on published hotel, rental car and flight prices through proprietary
Express Deals(R) and Name Your Own Price(R) services.

About Me...
 Splunk User for 4 years · Design, Deploy, Maintain · Core Splunk, Splunk Enterprise Security, Phantom
 Python noob  7 Years working in the INFOSEC

© 2018 SPLUNK INC.

Splunk @ priceline
 ~ 6TB License  ~12 Trillion events indexed daily  ~ 20 Physical indexers in different geographic locations  HTTP Event Collector + Universal Forwarder  Collecting on-prem and cloud-based events

© 2018 SPLUNK INC.

What's in this Talk
 Challenges for the INFOSEC team @priceline  Why we selected phantom  Our process of building security orchestration  Demo  Lessons learned  Future plan

© 2018 SPLUNK INC.

Challenges

© 2018 SPLUNK INC.

Challenge 1
Limited Staff to Cover a Massive Scope

Offense

· Application and

network security

testing, automating

when possible

Defense

· Employee social

· Network and system

engineering and

monitoring

attack simulation

· Incident response

· Red team testing

· User Awareness

· DDOS prevention
Compliance

· Lead on PCI, partner requirements & Group program assessment
· Assist on SOX, GDPR readiness
· Strong partnership with Privacy

© 2018 SPLUNK INC.

Challenge 2
Hybrid and Complex Security Technologies and Platforms

© 2018 SPLUNK INC.

Challenge 3
Lack of Data Enrichment and Correlations
 Sanitize and analyze the data  Link all the resources to a
single incident  Add actions to the response cycle  Document the process

© 2018 SPLUNK INC.
(thanks )

3 Observations

© 2018 SPLUNK INC.

"Security and other Ops team spent most
of the time working on tasks that are
repetitive in security operations while all
has limited staff"

"There's a gap of knowledge between security team and Ops team when executing actions for an incident"

"The results are hard to document into a single place for future references"

© 2018 SPLUNK INC.
"How do we Improve?"
"What do we Need?"

Our Criteria
 Integrate different technologies into one platform for execution  Low learning curve across different teams  Interactive GUI for designing playbooks  Flexibility to customize API-based apps  Seamless integration with ticketing system  Splunk friendly

© 2018 SPLUNK INC.

"Free people from doing
repetitive and trivial tasks"

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Keep It Simple
 What are the most time consuming tasks?  How many of them are level 1/2 jobs?  Are there more information we could have missed?

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Example: Threat Intel IP Reputation Alert... 

Do it in Phantom...

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Use Case: Triage a Risky IP

"S O C " ecurity n the lock
24/7 monitoring?

© 2018 SPLUNK INC.

Work Anywhere

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

DEMO

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Lessons Learned

© 2018 SPLUNK INC.

 Be Careful about Calling 3rd-party API!  Use Splunk as a Central Point for Event Search/Enrichment  Dedup/Stats/Fields/Where + CEF fields Mapping + Labels  Have Multiple Simple Playbooks >> Glue All Scenarios into 1 Playbook  Enrichment v. Action, Pick Your Battle  Use Customize Code on Action Block. Not on the Whole Playbook!  Rename the Action Block  Always Run in Mission Control First to Get the JSON  Play with Containers  Community Playbooks  Ask @phantom/my.phantom.us

© 2018 SPLUNK INC.

Future Plans

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Thank You
Don't forget to rate this session in the .conf18 mobile app
tony.lin@priceline.com

© 2018 SPLUNK INC.

