Dr. Marco Balduzzi @embyte, madlab.it
Using Machine-Learning to Investigate Web Campaigns
at Large
2nd Nov 18 JD-HITB PEK Beijing, China

Who am I?
 HITB aficionado  Computer security
geek (since 2002)  Love research, Ph.D.
(in 2011)  "Community centric"  Work for Trend Micro

Web Defacement =
Website Compromise +
Homepage Hijacking

Evolution

"Just-for-fun" era

Geopolitical factors kick in

90s

2000

2010

Now

Digital activism

Dark propaganda

"Just-for-fun" Era

Digital Activism

Geopolitical Factors

Coordinated campaigns: From one to many targets
 Death statement is 2nd of May 2011
 Campaign is 6th-12th of May
 Targets:

The IsraeliPalestinian
conflict

Data Collection

Public Repositories

Others

THE site :)

Collected Data

Source Name Website URL

Acquired Records

Zone-H www.zone-h.org

12,303,240

Hack-CN www.hack-cn.com

386,705

Mirror Zone www.mirror-zone.org

195,398

Hack Mirror www.hack-mirror.com

68,980

MyDeface www.mydeface.com

37,843

TOTAL

12,992,166

Timeline Evolution

Up to September

Metadata Raw content

Data Format

Data Trustworthiness

Type Metadata
Raw content

Attribute
URL
Timestamp
Nickname
Webserver; Reason; Hack Mode Main page
Embeeded resources
External resources

Example
http://target.gov
2010-01-02 15:00
Neo Hacker
Nginx; Political; SQLi
HTML or TXT file Various format Various format

Trustworthiness High Medium Medium-Low Low
High High Medium-High

General Trends

Topics Over The Years
Security Problems Real World Events

Adoption of Malicious Content

Adoption of email & Twitter handlers

Detection Engineering

Key Observations

Key Observations

Template

Customization

Key Observations
1.Actors cooperate in teams
Especially if driven by strong ideologies
2.Defacements are organized around campaigns 3.When a team prepares and runs a campaign, it
tends to re-use a common template that each member can customize

Next Generation* Defacement Explorer
(DefPloreX-NG)
(*) 1st generation presented at BH Arsenal

Deface Page Analysis

Campaign Detection

Labeling & Visualization

12 10
8 6 4 2 0
Riga 1

Pre-Filtering Search Campaigns Search

The Indo-Pakistani conflict

Riga 2

Riga 3

Colonna 1 Colonna 2 Colonna 3
Riga 4

Implementation Details

Features Engineering
Format of Title
Visual Features (colors) Visual Features (images)
Social Features Structural Features

Features Engineering
Email Addresses Multimedia URLs

Clustering
 BIRCH
­ Balanced Iterative Reducing and Clustering Hierarchies
 Do not materialize the entire distance matrix
­ Statistical values are efficient to compute ­ Quickly find the closest cluster for each new data
points

Clustering
 Scalability of BIRCH vs. DBSCAN (10 runs)

Labeling
 Each cluster is represented by a succinct report
­ Time span ­ Screenshot thumbnails (by perceptual hash) ­ Name of actors and teams ­ Keywords used in campaigns (e.g. #opfrance) ­ Category of targets (e.g, news, governmental sites)

Findings

Organization of Actors

43% of actors join one team, at least

Half of joint campaigns are larger than 3
70% of campaigns do collaborate

Geopolitical Real-World Events
 Successfully detected

The "Charlie Hebdo" case

The "Charlie Hebdo" case
Campaigns Teams Actors

Affiliated actors

Lonely wolfs

The Israeli-Palestinian conflict
Example of large-scale joint campaigns.
While the entire IsraeliPalestinian conflict
involves 12 campaigns, opisreal and opsavealaqsa
represent the most aggressive and active
ones.

Anonymous Operations
Joint campaigns conducted by anonymous-affiliated groups against governmental sites.

Long-Term vs. Aggressive Campaigns
Campaign savegaza reacted to war events in the Gaza Strip

Example of a long-running
campaign named h4ck3rsbr. The horizontal bars represent the
different sub-campaigns (60) with their most targeted TLDs and teams
(next slide). This is a very generic campaign, with different affiliates.

Conclusions
 Dark propaganda  Prevailing phenomenon  Driven by geopolitical motivations  Key targets, influencing sites
 Contribute to make the Internet a better world!

Conclusions
 DefPloreX-NG
 GitHub (old code, new ask):
https://github.com/trendmicro/defplorex
 Paper*:
https://documents.trendmicro.com/assets/wp/ wp-web-defacement-campaigns-uncoveredgaining-insights-from-deface-pages-usingdefplorex-ng.pdf
(*) Joint work with Federico Maggi, Ryan Flores, Lion Gu and Vincenzo Ciancaglini

Thanks! Questions?
Dr. Marco Balduzzi @embyte, madlab.it

