Captain's Log: Take your application log analysis from
Starfleet to Star Fleek
Ryan Tomcik David Pany SANS DFIR 2020 July 16, 2020 1:30 EDT

Introductions
· Ryan Tomcik
· Senior Consultant ­ Mandiant IR · Background in Splunk use for monitoring and log analysis
@heferyzan
· David Pany
· Manager ­ Mandiant IR · Background in Excel/grep log analysis
@davidpany
· Co-Creators of

Dog and Feline Urgent Response
· Long standing organization in the pet wellness industry · Veterinarians use DFUR to process records, make appointments, and
order care · Pets use DFUR to make appointments, pay bills, and see results · Insurers use DFUR to receive and pay claims to veterinarians · Starfleet's official veterinary service as of Stardate 74005.8
· DFUR infosec recently took a look at their log sources - ouch

Logging Problems Identified ­ Full List

· Incomplete data sources. · Fields parsed to the wrong index. · Application updates messed up SIEM ingestion. · Data spread across multiple sources. · Barely anything centralized. · Time zone misconfigurations. · The logs are in AM/PM format · The time zones are not specified or documented anyhere · Meow · Takes forever to export. · Some logs retained for only minutes. · Source IP addresses masked by proxy. · Some Logs are text sources. · Tiny text here. · This is some really tiny text. · How small can we make this text? · What if someone zooms in on this text?

· They will find that this slide is a fraud.

· Maybe we should tell a funny pet story here?

· Hopefully it makes people giggle at least. · That is really why we are here. · Tweet.

· I've only ever seen database transaction logging turned on in one investigation and it was really useful.
· No one ever seems to have NetFlow logs but firewall logs are pretty much just as useful for external log sources

· Trying to get chuckles is the ultimate goal for a forensicator.

· Ryan will probably make us get rid of this slide

· I hope audience members find our log presentation relevant.

· Font size 8 seems small enough to get away with this realistically.

· If we need to fill time we can come back to this slide and read everything.

· If this were blown up on a huge stage though, it might be really hard to read

· Some organizations do have pretty great logging.

· Chirp.

· Paper Mario comes out tomorrow, that should be fun to play. · Okay the font size just started shrinking. · Another small text here.

· Nothing is worse than a flat text log file where entries are broken up across multiple lines.
· Sometimes log data is stored in 2 separate database tables with no identifier to correlate them.

· The point of this slide is to show that DFIR has lots of work to do for · The logs were made by the application developers in python 2.7

logging practices

which is now officially deprecated

· We're run by cats and dogs though so using a keyboard is really difficult.
· Woof.

· The logs don't contain anything useful · Some logs have the months spelled out instead of a number

· I'm still typing trying to make an example of how many logging problems an organization can have.

Logging Problems Identified ­ High Level
· Incomplete data sources · Fields parsed to the wrong indices · Application updates messed up SIEM
ingestion · Time zone misconfigurations · Takes forever to export · Source IP addresses masked by proxy

Analysis Problems
· Inconsistency during manual analysis (playbooks)
· No documentation of log fields · Application logs were designed for
troubleshooting, not investigating

Examples of Facepalm Logs

https://community.nethserver.org/t/error-http-status-500/8489

2020 Friday ­ Jun 12 at 11:10:43 PM 2020 Monday ­ Jul 13 at 3:45:04 PM 2020 Tuesday ­ Aug 4 at 2:22:54 AM

https://blog.majestic.com/wp-content/uploads/2015/08/5-excel-raw-results.jpg

Getting Log Data Up To Fleek Standards
· How can DFUR security team members enhance logs?
· Parsing and formatting · Centralization · Determine what log data is relevant to security
missions 

Threat Modeling
· What types of threats do you face based on industry trends?
· What would those threats do?
· If you were attacked, what data would you want to have logged and how would you like it to be logged?

DFUR Security Team Threat Meowdeling
· Account takeover
· Credential stuffing, brute force, one off · Bank account modifications · PHI/PII access
· Pet Health Information/Pet Identifying Information
· Health service modifications or interruptions
· Submitting fraudulent reimbursement claims · Veterinarians over-prescribing cat-nip

Review Your Current Log Setup
· Investigation Simulation
· Logs should be able to answer all questions you could possibly need · Analysis should not require an annoying amount of time spent for:
· Exporting · Searching · Correlating · Formatting

Where Are the New Logs?
· Local Logging
· Enhanced logs will be amazing for traditional investigations! · What retention limitations exist?
· Centralized Logging
· Costs $$ · Can utilize detection functionality · Can develop investigation workflows

Monitoring and Detection Through Logs
· Make your logs work for you
· Alert on what you can · Visualize data sets likely to show anomalies · Easy to follow investigation workflows
· Visualizations
· Maps, Graphs, Tables, Heatmaps · Baseline data

splunk Demo
· Commercial log aggregation and analysis tool · Feature rich and can require lots of experience and training to use
effectively · Used as an example going forward but the concepts are likely
applicable to many log platforms
* All data presented is fictional and any relation to actual users or organizations is coincidental and unfortunate

DFUR ­ Scenario #1 ­ Account Takeover
· User hasn't been receiving claims payments · Logged into account and verified that banking information is not
correct · Username: labradorable

DFUR ­ Scenario #2 ­ Cred Stuffing
· Provider and Patient application users reporting account lockouts · Need to investigate evidence of password attack activity

DFUR ­ Scenario #3 ­ Fraudulent Registration
· Insurance provider reports suspicious activity associated with organization
· High number of failed health record lookups

Pivoting Concepts

Detection & Monitoring

IP Address

Username

Org

Applications Where Logs Are Important
· eCommerce · Financial transactions · Healthcare services · MSP · Travel agents · Any other type of log data that you could need to analyze

Logging Recommendations
· X-Forwarded-For to log true source IP addresses · Time Zone Documentation ­ UTC preferred · Session IDs to connect all relevant events · Test how long it takes to export log data · Log both successful and failed activities

Final Thoughts
· Reflect on your current logs and capabilities to improve
· Develop investigative workflows that are reliable and repeatable
· Identify pivot points between your data sources, make it easy to move between them
· Lower the technical barrier for analysis

Questions?
· @heferyzan · @davidpany

