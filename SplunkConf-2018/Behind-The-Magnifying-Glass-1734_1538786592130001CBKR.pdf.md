© 2018 SPLUNK INC.
Behind the Magnifying Glass
How Search Works
Jeff Champagne | Principal Architect, Splunk
Thursday, October 4th, 2018 | Walt Disney World

Who's This Dude?
Jeff Champagne
Principal Architect
jchampagne@splunk.com
 Started with Splunk in the fall of 2014  Member of the Splunk Architecture Council  Former Splunk customer in the Financial Services Industry  Lived previous lives as a Systems Administrator, Engineer,
and Architect  Loves Skiing, traveling, photography, and a good Sazerac
2

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Am I in the right place?
Some familiarity with...  Splunk Components
· Search Head, Indexer, Forwarder
 Splunk Search Interface  Search Processing Language (SPL)

© 2018 SPLUNK INC.

What Will I Learn?
 What is going on when you click search
 How to improve searches so they run faster
· Splunk Architecture Overview · How Splunk stores events · Components of a search · Search tips and SPL command alternatives · Search command examples

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Splunk Enterprise Architecture
Distributed Search coordinated by Splunk Search Head(s)
Auto load-balanced forwarding to Splunk Indexers
Send data from thousands of servers using any combination of Splunk forwarders

Index vs. Index
An Overloaded Term

© 2018 SPLUNK INC.

 Logical grouping for data · You or your Splunk admin create these · You reference these in your searches
· Implicitly or explicitly

 TSIDX File
· Time-series Index · Splunk's "secret sauce" · A logical Index is made up of many
indexes/TSIDX files
· This is how we search for your data
· More on this later...

How Are Events Stored?
Buckets, Indexes, and Indexers

© 2018 SPLUNK INC.

Events

Buckets

Indexes
(Logical Grouping)

Indexers

How Are Events Stored?
Bucket Aging Process ­ Classic Mode

© 2018 SPLUNK INC.

Hot/Warm Storage
 Fast Storage  Recent data

-OR-

Delete

Cold Storage

 Slower "bulk" storage

 Older data

Archive Storage

 Historical/Compliance data

 Online (searchable)/Offline

How Are Events Stored?
Bucket Aging Process ­ Smart Store Enabled

© 2018 SPLUNK INC.

Hot/Cache Storage
 Fast Storage  Recent (hot) data  Cached data

-OR-

Delete

Object Storage
 Slower "bulk" storage  All Non-Hot buckets Archive Storage
 Historical/Compliance data  Online (searchable)/Offline

What's in a Bucket?

Bloom filter

.tsidx

journal.gz

© 2018 SPLUNK INC.

What's in a Bucket?
Journal.gz

 Your events go here

 Journal.gz is made up of many smaller compressed slices

 Raw data is collected and saved into slices · ~128KB of uncompressed data make up a slice

journal.gz

© 2018 SPLUNK INC.

What's in a Bucket?
TSIDX

© 2018 SPLUNK INC.

Raw Events Jim likes Mickey Suzie likes Donald Pat likes Pluto

Unique terms from the raw events are written to the
lexicon

Lexicon

Term

Postings List

Donald 1

Jim

0

likes

0,1,2

Mickey 0

Pat

2

Pluto 2

Suzie 1

Postings List

Posting Seek

Value

Address

The postings list

tells us where we 0

34

can find a specific 1

87

term in the values

array

2

132

The seek address tells us where we
can find the matching event(s) in the journal.gz
slices

*The overall structure of a TSIDX file has been simplified for illustrative purposes

What's in a Bucket?
Bloom Filter
 Determines whether a term is likely to exist in the TSIDX of a bucket · False positives are possible, false negatives are not
· Interactive Example: https://www.jasondavies.com/bloomfilter/

© 2018 SPLUNK INC.

Lexicon
Term Donald Jim likes Mickey Pat Pluto
SuEzaiech term from the lexicon is run through a set of hashing algorithms

The output of each hash sets a bit in the array to
ON

· Regardless of the # of terms, bit array size remains fixed
· Binary format
· Fast to read vs. TSIDX, which grows with more unique terms

© 2018 SPLUNK INC.
How Search Works...
An Example

How Search Works
Components of a Search String

© 2018 SPLUNK INC.

index=world name=waldo glasses=yes | eval miles=km*0.62 | stats count by countries

Base Search
Retrieves & filters events
Events are retrieved

SPL Commands
Evaluate, transform, and format events
Results move linearly through SPL commands

How Search Works
Where's Waldo?

© 2018 SPLUNK INC.

index=world name=waldo

How Search Works
Where's Waldo?

1
index=world name=waldo

4 Compare our filter to the one in each bucket

5 Locate the value waldo in the TSIDX

2 Hash the value waldo
to create a bloom filter
for our search 01010101001001

Bloom filter
01010101001001

.tsidx

3
Begin searching world buckets containing events from the Last 4 hours

01010101001001 11001001000110 01010101001001

find 0,1,3 Waldo 1 looking 0,1,2,4
The, 0,1,2,3,5,6 individual 0,2,4 you 0,1,2,3,4,5 are 1,2,5,6
Yeah 0,2,4 Waldo 0,3 comes 0,2,3,4,5 in

*The internal structure of Bloom filters, TSIDX, and Journal files has been simplified for illustrative purposes

© 2018 SPLUNK INC.
6 Retrieve events with waldo using the seek address in the TSIDX journal.gz
I have been trying to find Waldo looking all over these books. I'm not sure I'll ever find him because my vision is terrible. The individual you are looking for does not exist in this dataset. We banished him. He isn't welcome. Oh yeah, Waldo comes in this joint all the time. The last time I saw him was probably 6 months ago. He was wearing a fur coat from a bear that killed his brother.

© 2018 SPLUNK INC.
How Search Works...
Schema on the Fly

Schema on the Fly

Key

Value

JSESSIONID=SD2SBL1FF8ADFF5

© 2018 SPLUNK INC.

147.31.14.76 - - [04/Sep/2018 22:18:03:799133] "GET /category.screen?uid=00b11ba0-3d814195-8789-8d9c1fff1d8a&category=Misc&JSESSIONID=SD2SBL1FF8ADFF5 HTTP 1.1" 404 2480 "http://www.buttercupenterprises.com/category.screen?uid=00b11ba0-3d81-4195-87898d9c1fff1d8a&category=Misc" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2914.3 Safari/537.36 OPR/43.0.2431.0 (Edition developer)" 97

© 2018 SPLUNK INC.
How Search Works...
Distributed Search

How Search Works
Distributed Search

© 2018 SPLUNK INC.

Search Head applies centralized streaming & 8
transforming commands, then displays results
Results are sent to Search Head 7

1 Search Head parses search into
distributed and centralized parts
2 Distributed parts of search are
sent to indexers

6 Distributed commands are applied 5 Events are filtered based on KV pairs

3 Indexers fetch events from disk
4 Schema is applied to events
(Schema-on-the-fly)

How Search Works
Types of Search Commands

© 2018 SPLUNK INC.

 Streaming Commands

 Transforming Commands

· Distributable (Remote Streaming)
· Operate on individual events · Run on indexers (distributed) · Ex: eval, rex, where, rename, fields...
· Centralized (Stateful Streaming)
· Operate on at least a sub-set of the entire result set
· Run on Search Head (centralized) · Ex: head, streamstats

· Create a reporting data structure
· Operate on the entire event set
· Non-streaming · Typically run on the search head
· Ex: transaction, stats, top, timechart...

Remote Streaming

Stateful Streaming

Transforming

How Search Works
Command Ordering

© 2018 SPLUNK INC.

index=world name=waldo glasses=yes | eval miles=km*0.62 | stats count by countries

Distributed

Centralized

Events are retrieved

Results move linearly through SPL commands

· Commands are processed in the order you write them
· Placing centralized or transforming commands before distributable commands may force unnecessary data and/or processing to the Search Head

Job Inspector
Demo
 Search Pipeline Rendering
· Streaming Pipeline = remoteSearch · Stateful & Events Pipelines = eventsSearch · Stream Report & Report Pipelines = reportSearch
 Searches
· Streaming command
· index=_internal | eval myCurrentSize=current_size+100
· Transforming command with distributable component
· index=_internal | stats count by component
· Streaming command AFTER transforming command
· index=_internal | stats count by component | eval myCount=count*100

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Commands in Action

Command Abuse
Fields vs. Table

© 2018 SPLUNK INC.

Goal: Remove fields I don't need from results
index=myIndex field1=value1 | table field1, field2, field4 | head 10000 | table field2, field4

index=myIndex field1=value1 | fields field1, field2, field4 | head 10000 | table field2, field4

 Table is a formatting command NOT a filtering command
· If used improperly, it will cause unnecessary data to be transferred to the search head from search peers
 Fields tells Splunk to explicitly drop or retain fields from your results
27

Command Abuse

© 2018 SPLUNK INC.

Search Term | table | fields

Status
Running (1%) Done

Artifact Size

# of Events

Run Time

624.93MB 2,037,500 00:02:44

9.95MB 10,000 00:00:13

28

Command Abuse
Stats vs. Transaction

© 2018 SPLUNK INC.

Goal: Group multiple events by a common field value
index=mail from=joe@schmoe.com| transaction message_id | table _time, to, from, subject, message_id

index=mail from=joe@schmoe.com | stats latest(_time) AS mTime values(to) AS to values(from) AS from values(subject) AS subject BY message_id
 If you're not using any of the Transaction command parameters, the same results can usually be accomplished using Stats
· startswith, endswith, maxspan, maxpause, etc...
29

Command Abuse
Joins & Sub-searches
Goal: Return the latest JSESSIONID across two sourcetypes
sourcetype=access_combined | join type=inner JSESSIONID [search sourcetype=applogs | dedup JSESSIONID | table JSESSIONID, clienip, othervalue]
sourcetype=access_combined OR sourcetype=applogs | stats latest(*) AS * BY JSESSIONID

© 2018 SPLUNK INC.

30

© 2018 SPLUNK INC.
Search Tips

© 2018 SPLUNK INC.
Just because you can...doesn't mean you should
Plan your search to leverage the power of Splunk!

Search Tips
 Reduce the amount of data Splunk has to Search · Specify and limit the index(es) · Limit the time range · Search for values that are unique to your events where possible · Reduce the number of events filtered after schema-on-the-fly
 Distributed Search · Ensure events are well distributed · Place distributed commands
before centralized commands

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
"Thou shalt not use
index=* or All Time"
- Moses

Avoid All Time index=*
Wildcards

Search Tips

© 2018 SPLUNK INC.

Explanation
· Events are grouped by time · Reduce searched buckets by being
specific about time

Suggested Alternative
· Use a specific time range · Narrow the time range as much as
possible

· Events are grouped into indexes

· Always specify an index in your

· Reduce searched buckets by specifying an search

index

· Wildcards are not compatible with Bloom Filters
· Wildcard matching of terms in the index takes time
· Lexicon is structured by common prefixes, so appending an * is best (if you have to do it)

· Varying levels of suck-itude
> myterm*  Not great > *myterm  Bad > *myterm*  Death
· Use the OR operator
i.e.: MyTerm1 OR MyTerm2

Avoid
NOT !=

Search Tips

© 2018 SPLUNK INC.

Explanation
· Bloom filters & indexes are designed to quickly locate terms that exist
· Searching for terms that don't exist takes longer

Suggested Alternative
· Use the OR/AND operators
(host=c OR host=d) (host=f AND host=h) vs. (host!=a host!=b) NOT host=a host=b

Verbose Search Mode

· Verbose search mode causes full event data to be sent to the search head, even if it isn't needed

· Use Smart Mode or Fast Mode

Real-time Searches

· RT Searches put an increased load on search head and indexers
· The same effect can typically be accomplished with a 1 min. or 5 min. scheduled search

· Use a scheduled search that occurs more frequently
· Use Indexed-Realtime searches
(Set by Splunk admin)

Avoid Transaction

Search Tips

© 2018 SPLUNK INC.

Explanation
· Not distributed to indexers · Typically only needed if using additional
parameters (maxSpan, startsWith, etc...)

Suggested Alternative
· Use the stats command to link events where possible

Joins/Subsearches

· Joins can be used to link events by a common field value, but this is an intensive search command

· Use the stats (preferred) or transaction command to link events

Search after first | · Filtering search results using a second "| search" command in your query is inefficient

· As much as possible, add all filtering criteria before the first |
i.e.: >index=main foo bar vs. >index=main foo | search bar

The TERM Directive
Why does it matter?

 Splunk breaks terms by Major and Minor Segmenters
· When writing to the TSIDX and searching
· Default minor segmenters:
/ : = @ . - $ # % \\ _

 TERM prevents breaking on Minor segmenters

Raw Events 10.0.0.6 9/28/2016 jeff@splunk.com

[ AND 0 10 6 index::myindex ]

© 2018 SPLUNK INC.

Lexicon

Term

Postings List

0

0

6

0

9

1

10

0

28

1

2016

1

10.0.0.6

0

9/28/2016

1

com

2

jeff

2

splunk

2

jeff@splunk.com 2

The TERM Directive
What about quotes?
 TERM controls how we search the lexicon and which events are retrieved from disk
 Quotes can help filter after the events are retrieved from disk
 Use quotes when the value in your key-value pair has major breakers
index=myIndex name="Willy Wonka"
[ AND wonka willy index::myindex ]

© 2018 SPLUNK INC.

The TERM Directive
How do I use it?

© 2018 SPLUNK INC.

ip=TERM(10.0.0.6) TERM(ip=10.0.0.6) TERM(ip10.0.0.6) TERM(10.0.0.6*)
TERM("Willy Wonka")

ip 10.0.0.6 - 807256800 GET /images/launchlogo.gif ip=10.0.0.6 - 807256804 GET /shuttle/missions.html ip10.0.0.6 - 807256944 GET /history/history.html 10.0.0.6:80 - 807256966 GET /skylab/skylab-4.html
X 9/28/16 1:30 PM - name=Willy Wonka sex=m age=46

· Your term MUST be bounded by major segmenters
· Example: Spaces, tabs, carriage returns · See Segmenters.conf spec for full details
· Your term cannot contain major segmenters

40

Search Tips
Indexed Extractions
 Special Key-Value pairs that are stored in the TSIDX file  Default Extractions
· source, host, sourcetype · Use these whenever possible  TSTATS · Super-fast command · Doesn't search or return raw data · Can be used on report/data model accelerations AND indexed extractions

© 2018 SPLUNK INC.

Resources

© 2018 SPLUNK INC.

 Splunk Docs
· Write Better Searches
http://docs.splunk.com/Documentation/Splunk/latest/Search/Writebettersearches
· Wiki: How Distributed Search Works
http://wiki.splunk.com/Community:HowDistSearchWorks
· Splunk Search Types
http://docs.splunk.com/Documentation/Splunk/latest/Capacity/HowsearchtypesaffectSplunkEnterpriseperformance
· Search Commands by Type (Centralized vs. Distributed)
http://docs.splunk.com/Documentation/Splunk/latest/SearchReference/Commandsbytype
· Blog: When to use Transaction and when to use Stats
http://blogs.splunk.com/2012/11/29/book-excerpt-when-to-use-transaction-and-when-to-use-stats/
· Segmenters.conf Spec
http://docs.splunk.com/Documentation/Splunk/latest/Admin/Segmentersconf
· Splunk Book: Exploring Splunk
http://www.splunk.com/goto/book
 How Bloom Filters Work: An Interactive Demo
https://www.jasondavies.com/bloomfilter/

42

Questions?
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

