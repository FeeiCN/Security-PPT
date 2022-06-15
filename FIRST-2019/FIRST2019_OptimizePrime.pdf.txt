Optimized Playbook, Roll out!
How an optimized playbook can reduce time-to-detect
Chris Merida Jason Kmack

Who are these guys?
· Chris Merida · InfoSec Engineer for Cisco CSIRT · Focus on operations for SIEM,
web, and special projects · Likes angry music that you only
find on Myspace · Usually wearing a hat · Enjoys coffee and fine liquor
(occasionally at the same time)

Who are these guys?
· Jason Kmack · InfoSec Engineer for Cisco CSIRT · Application developer focusing
on security monitoring tools · Often found near empty pints of
micro-brews or bottles of bourbon

First things first...
· Play
· A query to look for specific indicators of compromise
· Playbook
· A collection of plays
· Time-to-detect (TTD)
· Amount of time between a compromise occurring and it being discovered
· SIEM
· Security and information event management
· "Indexes"
· Indices

Why do my queries take so long?!
· Large datasets
· ~5TB a day across all
· Long retrospective searches
· Last 90 days or longer
· Poorly written queries
· "index=* badguys.com earliest=-500y"
· A LOT of queries running simultaneously
· 970 play runs per day

How can we solve this?

Not going to work
· ROI on hardware is less than on process improvement
· Not enough time to rewrite manually
· Over 360 plays to go back and fix
· Best practice guide won't be leveraged

Might work!
· Interactive script to suggest changes to the play owner
· Integration with playbook tool to run optimized query automatically
· Reusable query templates

Don't overthink this...
· What if we
· Run query through Splunk's built-in optimizer multiple times to get to its final form · Calculate tons of statistics for query runtimes to determine what is within
acceptable bounds · Compile results to make the query better based off of the above outputs
· Then we can suggest the best possible query to the user
· Then we can ask them change it based off our suggestion! · Then we wait for them to change it · But they don't have time to change it · This is not a good idea...

Defining the requirements...
· Reduce performance impact on Splunk · Make plays run faster
· Plays can run faster and more frequently · Therefore reduces time-to-detect
· Help analysts/investigator write better queries · Integrate with playbook automation tool · Give it a cool name
· Like OptimizePrime!

Which tools do we use?
· Splunk API · Python/Django/MySQL · Gunicorn/Nginx · Docker · Splunk query best practices · Recommendations from personal experience

Overview

AllSplunk
· Like the AllSpark!
· Doesn't require star sacrifices to run
· Coordinates flow of modules · Handles collection of results · Delivers results to UI/DB

SyntaxPrime
· Uses admin page to define custom regular expressions · Admin can determine whether OptimizePrime stops on a failed check or
alerts the user
· If stop condition is met, no other modules are run
· List of warnings collected and sent back to AllSplunk

SearchPrime
· Receives the candidate search string and runs through normal search · Collect optimized query and begin running optimized queries in parallel with
candidate query · Receive result sets, calculate runtimes, select fastest query · Configurable
· Number of search heads · Number of optimized runs (ex. 2 optimized query runs per search head) · Enable/Disable multithreading (running optimized queries in parallel with candidate) · Timeout for query to be submitted (in case Splunk is super busy) · Timeout for query to finish running (we don't want to wait for hours)
· Added a bonus "Stats for nerds" section

DataPrime
· Uses admin page to define custom thresholds · Thresholds can be defined by:
· Size on disk · Events
· No stop condition; only warnings · List of warnings collected and sent back to AllSplunk

Initial Results ­ Time Saved

Seconds Per Day 4289.01

Minutes Per Day 71.48

Hours Per Day 1.19

Time saved after a week...

Seconds 30,023.07

Minutes 500.38

Hours 8.34

Time saved after a month...

Seconds 120,092.28

Minutes 2,001.54

Hours 33.36

Days 1.39

Time saved after a year...

Seconds 1,566,560.90

Minutes 26,109.35

Hours 435.16

Days 18.13

Additional stats from testing...

TIME SAVED Hours Days

Minimum per year 292.06 12.17

Average per year 408.96 17.04

Maximum per year 555.66 23.15

· Load varies during testing · Intersection of data being searched in prod while trying to optimize · Unoptimized query can have a significant runtime variance
· Running an already optimized query can allow us to skip the built-in Splunk
optimization process

Playbook Integration
· Ensures analyst always runs optimized play · Automatic re-optimizations based on:
· Splunk version upgrade · Play update · OptimizePrime code changes
· Can manually force a full playbook optimization · Analyst can compare original query with optimized query side-by-side

Future Plans
· Add analysis for subsearches · Add analysis for lookup tables · Create benchmark criteria
· ex. using transform commands versus specifying fields · Order of operations
· Build into play creation process · Add streamed logging to web interface · Open-source the code

What if I don't use Splunk?
· Leverage built-in optimization engine · Check query syntax for best practices or recommendations · Set limits on how much data can be searched based off of your
environment's performance · Compare similar statistic or transformative statements for performance
gains · Record your results
· Justify your effort and show value to the mission

Questions

