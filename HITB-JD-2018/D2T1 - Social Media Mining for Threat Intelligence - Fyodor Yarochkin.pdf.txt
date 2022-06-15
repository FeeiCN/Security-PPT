Social Media Mining for Threat Intelligence
Vladimir Kropotov, Dr. Fyodor Yarochkin, Natasha(Sasha) Hellberg FTR Team
Copyright 2017 Trend Micro Inc.

About us

Agenda
· The project background · Methodology · Social Media and Blue Teams · Social Media and Ted Teams · Findings and Case Studies · Conclusion

Copyright 2018 Trend3Micro Inc.

Project Background
· The objective - find "interesting" stuff on "social media" that can be used by blue and red teams
· Not novel · Objectives:
­ identify mal-actor and mal-group activities (hacking and digital extortion)
­ Identify indicators of interest ­ Identify other possible anomalous use of social media

1/23/2018

4

Copyright 2018 Trend Micro Inc.

Twitter Firehose: Public. Everyone can play with it
Copyright 2018 Trend Micro Inc.

Usability of Social Media Hunting for Blue Teams
Copyright 2018 Trend Micro Inc.

Threat Intelligence and Social Media
· Predictability of Future events · Situational Awareness and real time monitoring · Restrospection and looking into past
Copyright 2018 Trend Micro Inc.

Why hunting Twintel?
Copyright 2018 Trend Micro Inc.

Right keywords is gold mine
Copyright 2018 Trend Micro Inc.

Usability of Social Media Hunting for Red teams
Copyright 2018 Trend Micro Inc.

Linked in fake profiles

Known use by "red teams"

https://www.israelhayom.co.il/article/443257
Copyright 2018 Trend Micro Inc.

So what you can do on social media putting a blue hat
· Hunting for IoCs ­ Hashes ­ IP addresses ­ CVEs
· Tracing Information Leaks through Social Media · Investigating malware using Social Media · Investigate Script-kiddie actors using Social Media
Copyright 2018 Trend Micro Inc.

Malware on Social Media
Copyright 2018 Trend Micro Inc.

What is this ..? Retrohunt!
Copyright 2018 Trend Micro Inc.

Copyright 2018 Trend Micro Inc.

Generical hunting ... in Twitter FIREHOSE TEXT =>
Copyright 2018 Trend Micro Inc.

More hashes...
3ed56b46d63a579c41b6155549cbf34d4658f897 887d70b487f02bf4b371463762b5d08aeccdf95f e61ad5266bde54d52d82c44456f0a0a57f751c35 304c2700fe23cc2fdb9db32793c18fe38cb68c8d d279011af309b02c71913650d078bb89e66ef66c 869924789293a5d4fd0b2d4d562e19b0340d5b0d 1f3c34040362fcc65e5f28ed146a83319ef40330 1b2359b3bd089431c53beba111ae4d68f854402b a770bea65a9d6881a9592f6eb33f87df99df926d 5e3fc74cb9fc4052cb42de0af64b26785b972d01 a9f56a6def1413dc5f072add4ba6310207b1493d 49367acd5d2952e77b131d98c5f107f72f7bdd28 c0680c6c394920dbd13664d835de4811782fc1be 10f38918460fa89fa986320e124dd15fc58a33ac 1888739385f8052b7bb8e39f91724174a9feb5cb 57dd3fceb429bca2b78f9de424422a323400782d 2f3a699502e1a5d26f7874a7ebdcba550c2dc701 a8293f802437f2027d1fe4c9fc72e4c0ef56a9d8 fc29a335a846edab3a843f7005262aeff1881c1b 1fd8c3320af1e39fa66bf92690f3f9d73cfcf9f8 Copyright 2018 Trend M6ic4ro 7Inc.ae0dc7df2019beecc6adf796497b0b9e276bf

Indicator Hunting on Social Media
Copyright 2018 Trend Micro Inc.

More hashes... the Ultimate hunting skill J
Copyright 2018 Trend Micro Inc.

What is this ..?
Copyright 2018 Trend Micro Inc.

Copyright 2018 Trend Micro Inc.

Investigating Mal-Actors on Social Media
Copyright 2018 Trend2M5 icro Inc.

Disclaimer and clarification
We refer to these individuals as hackers for simplicity "Hacker" groups in context of this presentation are : - Mostly Anonymous and other "Hacktivism" communities that cause some mischief and trouble. - have low technical skill level - highly socially active - can be damaging due to low cost of online "Hacker" services - can produce or provoke a social response. At times, in real-life
Copyright 2018 Trend Micro Inc.

Methodology - Overview
· Utilized Tweets scrapped from known handles for suspected hackers and hacking groups: sources - Hacktivism and Digital Extortion actors
· Used a variety of methods to map inter-relationship between entities:
­ Shout Outs ­ Quotes/Retweets/Reposts ­ Followings ­ Followers
· Used a variety of metrics to weight the social mapping
· Goal: Situational Awareness
Copyright 2018 Trend2M7 icro Inc.

Methodology - Overview
Twitter Specific Shoutout Identify Assess / Tweets Accounts Mapping ConnectionsRelationship
Copyright 2018 Trend2M8 icro Inc.

The Data: Identify Groups

Deepweb

Hacktivism

Shameless plug!
Copyright 2018 Trend2M9 icro Inc.

Where did we start?
Anonymous
Copyright 2018 Trend3M0 icro Inc.

Found More Info
Copyright 2018 Trend Micro Inc.

The Information: Twitter Harvesting
­ Use your favorite hunting tool, such as Maltego · PRO: Easy to use, click of a button · CON: LOTS of noise, Extracting data a pain; tweet data is only good about 10 days, may not include data if user deleted tweet
­ Invest in a social media tool (shout out to MentionMapp ­ paid, but not expensive) · PRO: SUPER easy to use, click of a button · CON: Generally only 1 user or hashtag at a time so have to do rest manually; only have as back as the tool allows, most only go back 2 weeks even at premium accounts
­ Get an easy to use command line tool for twitter write a cron to do ongoing scrapping, like Twint · PRO: Very good coverage, easy to manipulate once collection has soaked · CON: Takes a bit to set up and test; lots of data to scrape through
Copyright 2018 Trend3M2 icro Inc.

The Knowledge: Putting it together
Copyright 2018 Trend3M3 icro Inc.

The Knowledge: Putting it together
Copyright 2018 Trend3M4 icro Inc.

The Insight: Mapping Connections
Where entity == matching in either the name or display name to a known nick for a hacker or group
· Type 1: Shout outs by Entity: If an entity does a shoutout in the body of their tweet to another user (@), hashtag (#), or URL (http)
· Type 2: Shout outs to the Entity: If the entity is in the text of a tweet, either as a user (@) or hashtag (#)
· Type 3: If the entity is quoting someone · Type 4: If the entity is retweeting (RT) someone · Type 5: If the entity is being quoted by someone · Type 6: If the entity is being RT'ed by someone
Each of these were mapped as a 1 way connection, but in some cases the findings would show a mutual connection
Copyright 2018 Trend3M5 icro Inc.

The Insight: Mapping Connections
Copyright 2018 Trend Micro Inc.

The Insight: Mapping Connections
Copyright 2018 Trend3M7 icro Inc.

The Wisdom: Weighing Connections
Copyright 2018 Trend Micro Inc.

The Results
FancyBear
Copyright 2018 Trend3M9 icro Inc.

LizardSquad DeadSec
GhostSquad

Iterative Process
· Layer 1A: Look at pre-identified Group Handles, and their connection and weightings to other entities
Filter out the noise · Layer 1B: Find all the connections and weightings to those identiefiead icn Lhayetr 1iAme our the map
becomes unusable!! · Layer 2A: Look at other pre-identified individuals Handles, and
map them into the above to find deeper pockets
· Layer 2B: Find all the connections and weightings to those identified in Layer 1A
Copyright 2018 Trend4M0 icro Inc.

The "Play at Home" Game

Track & Alert on Posts

Figure out your key words or
accounts

Using TWINT, search for Accounts

Scrape followers & followings
Scrape tweets

Track Mentions

Build a node list from accounts
Create relationship map from
follow[ing|ers]
Copyright 2018 Trend4M1 icro Inc.

Soak for at least a week
store: Neo4J visualize: Gephi

Create relationship map from Mentions

Detecting Twitter Bot Presence
Copyright 2018 Trend4M2 icro Inc.

Because bots are everywhere :)
Copyright 2018 Trend Micro Inc.

Bots, Bots Everywhere :)

1/24/2018

44

Examples of Bots
45

Final Words
Copyright 2018 Trend4M6 icro Inc.

Should you take your threat seriously?
Copyright 2018 Trend4M7 icro Inc.

Thanks for having us!

Copyright 2018 Trend4M8 icro Inc.

Email us at:
fyodor_yarochkin@trendmicro.com sasha_hellberg@trendmicro.com
Vladimir_kropotov@trendmicro.com

Too Shy?

