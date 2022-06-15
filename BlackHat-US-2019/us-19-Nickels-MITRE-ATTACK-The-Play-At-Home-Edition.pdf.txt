MITRE ATT&CK: The Play at Home Edition
- Katie Nickels @ MITRE - Ryan Kovar @ Splunk

© 2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-01159-11.

System Owner/User Discovery (T1033)
Katie Nickels (@LiketheCoins)
 ATT&CK Threat Intelligence Lead at MITRE (@MITREattack)  SANS Instructor for FOR578: Cyber Threat Intelligence  10+ years of experience in threat intel and network defense  Program Manager for Cyberjutsu Girls Academy  Baker of chocolate things  CrossFitter  Oxford comma believer

System Owner/User Discovery (T1033)
Ryan Kovar (@meansec)
 Principal Security Strategist at Splunk  MSc(Dist) Information Security  Minister of OODAlooping at Splunk  US/UK DoD/PubSec Nation State Hunting Roles  Enough white in beard to speak authoritatively  Co-Creator of Boss of the SOC CTF  Hates printers and trilobites

We use Splunk But you don't have to!

Agenda
Let's tell a story Oops, now I see where we went wrong Pass go, collect 200 TTPs

So you've heard of this ATT&CK thing...
but how do you actually play use it?

We want to tell you a story...

"I don't really know how we are defended and it makes me uncomfortable." - Grace Hoppy
CEO

"If it's not an IP, how do I use it?
- Mallory Kraeusen Threat Intel

Alice headshot

"I'm drowning in meaningless alerts and my data isn't

helping me!"

- Alice Bluebird

Network Defender

"I'm not sure how I can help." - Kevin Lagerfield
Red Team

"I need to you to find out how this will impact us.... are we defended?"

How does Mallory find info on Iranian groups...
...and can ATT&CK help?

OilRig?

...but what's this ATT&CK thing?

Matrix?

...but what's this ATT&CK thing?

"OilRig/Iranians... they're a threat"

"Plz block OilRig indicators. (TTPs wha?)"

"No hits...but what do we do now? What are these techniques?"

How does Alice stop hoarding indicators and start detecting techniques?

We're good to go against OilRig, our #1 threat!
h/t to Kyle Rainey and Red Canary

How does Kevin test existing detections?

Attacks detected!

We did all the things. This is fine. Everything is fine.

More trouble in paradise...
And then...

"Sorry, you're pwned."

 PowerShell (T1086)  Spearphishing Attachment (T1193)  Service Execution (T1035)

WHY DID WE EVER USE ATT&CK?

So you've "implemented" ATT&CK and you're unhappy...now what?

What went wrong?

Had a false Couldn't follow

sense of up and action

CxO

security new threats

CTI

Had gaps in defenses but drowning in alerts

Didn't test in depth or work with Blue Team

Defender

Red Team

Let's get Frothly back on track

How can a CxO have a better understanding of their risk by using ATT&CK?

Communicate confidence level

Color gradient by confidence in detections
h/t to Olaf Hartong

Integrate your teams

Red TeamDeteGctaiopnss

WhRati'ss kmytoRioskrg?

CxO

CapTahrbieliattises

Threats in theory
Real detections CTI

Defender

Run

Crawl

Walk

How can a threat intel analyst action new threats?

Build your own threat library

Courtesy of the Threat Library Team ­ Deloitte

Most Used Techniques (2019 sample)

# Technique Name 1 T1071 - Standard App Layer Protocol 2 T1082 - System Information Discovery 3 T1059 - Command-Line Interface 4 T1105 - Remote File Copy 5 T1083 - File and Directory Discovery 6 T1060 - Registry Run Keys / Start Folder 7 T1057 - Process Discovery

8 T1056 - Input Capture 9 T1113 - Screen Capture 10 T1107 - File Deletion 11 T1041 - Exfiltration Over C2 Channel 12 T1086 - PowerShell 13 T1193 - Spearphishing Attachment 14 T1016 - System Network Config Discovery

Courtesy of the Threat Library Team ­ Deloitte

Build on the framework

Courtesy of the Threat Library Team ­ Deloitte

Courtesy of the Threat Library Team ­ Deloitte

Courtesy of the Threat Library Team ­ Deloitte

Courtesy of the Threat Library Team ­ Deloitte

Courtesy of the Threat Library Team ­ Deloitte

Courtesy of the Threat Library Team ­ Deloitte

How can a blue teamer know what to detect and if she has the right data?

Map data to TTPs

https://github.com/mitre-attack/attack-scripts/tree/master/scripts

https://medium.com/@olafhartong/assess-your-data-potential-with-att-ck-datamap-f44884cfed11

https://nsacyber.github.io/unfetter/

https://github.com/rabobank-cdc/DeTTECT

https://github.com/krakow2600/atomic-threat-coverage

One Sig!=Complete TTP Coverage

https://car.mitre.org/

https://eqllib.readthedocs.io/en/latest/analytics.html

https://github.com/Neo23x0/sigma/tree/master/rules

Reduced Alerts

How can a red teamer help improve defenses?

https://docs.microsoft.com/en-us/windows/win32/psapi/enumerating-all-modules-for-a-process

Go Purple

What blue detected
What red did that blue missed

Combine your powers for hunting parties

How do you (and Frothly) "Play at Home" with ATT&CK?

"How are we defended?"

"I can communicate

about our defenses and

CxO

make better decisions."

"If it's not an IP, how do I use it?"

"I'm tracking multiple threats

and I'm a

CTI

Pyramid of Pain master."

"I'm drowning in alerts

Alice

and missing data!"

headshot

"I can prioritize alerts Defense and use the data I have."

"I don't know how to help!"

Red Team

"I know how to help defense get better."

Takeaways
ATT&CK is for everyone Start small and be realistic Collaborate and cooperate

Thank you! Adriana and Deveeshree Black Hat Splunk, Haiyan Song,
Cara Cavaggion

Thank you! Blake Strom, Adam Pennington, and the whole MITRE ATT&CK Team Marty Pugliese Olaf Hartong Deloitte David Bianco Kyle Rainey and Red Canary David Veuve, Johan Bjerke, John Stoner, Dave Herrald

References
https://github.com/mitre-attack/attack-navigator https://github.com/redcanaryco/atomic-red-team https://redcanary.com/blog/avoiding-common-attack-pitfalls/ https://splunkbase.splunk.com/app/3435 https://github.com/mitre-attack/attack-scripts/tree/master/scripts
https://medium.com/@olafhartong/assess-your-data-potential-with-attck-datamap-f44884cfed11
https://nsacyber.github.io/unfetter/ https://github.com/rabobank-cdc/DeTTECT https://github.com/krakow2600/atomic-threat-coverage https://car.mitre.org/ https://eqllib.readthedocs.io/en/latest/analytics.html https://github.com/Neo23x0/sigma/tree/master/rules https://detect-respond.blogspot.com/2013/03/the-pyramid-of-pain.html

Questions? -->Join us in Coral B
Katie Nickels ( @LiketheCoins)
attack@mitre.org
Ryan Kovar ( @meansec)
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-01159-11. ©2019 Splunk Inc. All Rights Reserved.

