Listening to the Data
Adding and Analyzing Music Data in Splunk
Sarah Moir, Program Manager
October 2018

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

SARAH MOIR
Program Manager at Splunk Former Radio DJ & Station Manager at WESN 88.1FM

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Adding and Analyzing Music Data in Splunk
You could do this with any kind of data

Where to start

Get data in

Search and visualize

What's next

© 2018 SPLUNK INC.
Where to start
Getting data in...

What do I want to know?
Use cases matter for data ingest

© 2018 SPLUNK INC.

 Start by identifying use cases! · What's my listening pattern around a concert? · What artists did I discover in a particular year? · What songs did I listen to by a certain artist first, and how does that compare with my favorite
songs by that artist?
· Do I listen to more artists now? Do I listen to mostly different artists? · What is my favorite music venue in CA? In IL? · Am I more likely to skip a concert if I bought the tickets far in advance?

What data do I need to get these insights?
Identify data types based on use cases
 Listening pattern around a concert? · Listening data and concert data
 Artist discovery? Track discovery? Track popularity? · Listening data
 Favorite music venue? · Concert data
 Skipping concerts according to ticket purchase date? · Concert data, ticket purchase data

© 2018 SPLUNK INC.

What data is out there?
Assess the data available to you

© 2018 SPLUNK INC.

Music data I "created"  Listening data tracked by Last.fm  Concerts attended tracked by me  iTunes library  Spotify library  SoundCloud library

Music data externally available  MusicBrainz metadata database
 Spotify audio features data
 Songkick concert data

How I got the data in
Figure out the easiest way to get data in

© 2018 SPLUNK INC.

File Upload

Add-on Builder

Custom Alert Action

Lookup Editor App

Modular Input

File Upload: iTunes Library
XML party

© 2018 SPLUNK INC.

 Uploaded the XML of the iTunes library file into Splunk.  The XML of the iTunes library is not the XML format expected by Splunk
· KV_mode=xml did not work for me, because the XML structure was not <field>VALUE</field>
but rather <key>FIELD</key><key type>VALUE</key type>.
 Cue struggle.  Cue asking people who know regex to write me regex.  Cue celebratory gratitude.

Add-on Builder: Last.fm Data
Hooray for unauthenticated APIs

© 2018 SPLUNK INC.

 Add-on builder made it super easy to write a modular input.  JSON-formatted data returned by the API  Put together a little setup screen:
· Request the username from the user · Ask for the API key (so that mine isn't hardcoded into it)  Super easy UI for extracting fields from JSON events  Checkpointing so that I can backfill data from when Splunk isn't running  Backfilled my data with file uploads so I didn't have to wait for the input to churn through it all.

© 2018 SPLUNK INC.
Custom Alert Action: Songkick Concert Data
Python 
 Wanted to identify upcoming concerts for artists according to specific factors
· Historical factors: which artists are above
my average listen threshold and coming to town soon?
· Trending factors: which artists have I
recently discovered that are coming to town soon?
 Wanted to learn how to write an alert action

Lookup Editor: Concert and Ticket Data
Manually-managed data
 Needed a way to keep track of external, time-ordered data manually
 Maintain 3 lookups
· 2 concert lookups: 1 multi-value with
artist field, 1 with added context of opener and headliner.
· 1 ticket purchase lookup with date
purchased, on sale date, face value, actual cost, and more!

© 2018 SPLUNK INC.

Modular Input: Spotify Library Data
Modular all the things!

© 2018 SPLUNK INC.

 Wrote a python script to pull Spotify library data  Migration to a modular input is IN PROGRESS 
· Spotify API uses OAUTH and an authorization flow · Still not sure how that authorization flow will look in Splunk. · Explored using HEC to push the data in, but there is no mechanism for push in the API. · Need more time to sit with this and get it going somewhere.  

© 2018 SPLUNK INC.
Now what?
Analyze and visualize!

Search and Visualize
Iterate constantly to get the most precise answer

© 2018 SPLUNK INC.

 Start with a list of questions  Identify the data necessary to answer them  Write searches to get the answers you want
· Write better and faster searches the better you get at SPL · Identify spots where you can do calculations elsewhere  Create visualizations to show off the answers you find  Create better visualizations the more you understand inputs and annotations and custom visualizations

Artist discovery vs popularity
Hipster status: intact

© 2018 SPLUNK INC.

 One dashboard input used by two panels
 One panel pulling earliest listen data
 One panel pulling top listens
 Both panels using Last.fm data

Artist discovery for a particular year
(usually lots)

© 2018 SPLUNK INC.

 Use a search-driven lookup to store the "earliestlisten" of an artist
 Combine that with a dashboard input to search for a particular year
 Use sparklines to track listens throughout the year

© 2018 SPLUNK INC.
What's my listening pattern around a concert?
Sporadic correlations
 Used event annotations to compare concert dates with listening patterns
 Sporadic, inconsistent correlations
 See the appendix for the XML

BPM Listen Analysis
Oontz oontz oontz

© 2018 SPLUNK INC.

 Analyze BPM trends by combining iTunes metadata with listening data
 BPM is in iTunes data
 Store that in a search-driven lookup for quick enrichment

Who Is On Tour?
Powered by Songkick

© 2018 SPLUNK INC.

 Combines events created by the alert action with log messages generated by various types of failed responses from the Songkick API

© 2018 SPLUNK INC.
What's in the future?
What do I still want to do?

Future use cases
What I want to know that I need more data to know

© 2018 SPLUNK INC.

 As I explored my data, I found new use cases that I wanted to answer with other data types: · What "types" of music do I listen to? How has that changed over time? · Calculate a popularity score for what I listen to and compare it to Spotify's popularity score. · Personal one hit wonders? · Do I prefer music created in specific geographic regions? · Track music discovery across services, from first listen until iTunes library · What audio features are common across my most-listened-to songs? · Music taste prediction algorithm based on audio features and other features??

Future data types and analysis
Data growth
 MusicBrainz metadata about artists and tracks · Release dates of tracks and albums · Geographic location of artists
 Spotify audio feature data about tracks · Collect and analyze audio features · Can enhance existing library knowledge · Enrich beyond Spotify data

© 2018 SPLUNK INC.

Key Takeaways
20 minute talks are short

© 2018 SPLUNK INC.
1. Identify your use cases before you get
data in
2. Identify the data you need to satisfy the
use cases
3. Plan GDI according to data format and
needs
4. Iterate searches and visualizations for
precision
5. Record use cases that come up during
data analysis

Thank you!
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Appendix
All the configurations fit to include

Learn More
About my specific project

© 2018 SPLUNK INC.

 See my Splunk blog post: https://www.splunk.com/blog/2018/01/04/10-years-oflistens-analyzing-my-music-data-with-splunk.html

© 2018 SPLUNK INC.
Learn More About Specific Configs
How did she do that?
 In the following slides, you can see the configurations I used  Some configurations support getting data in  Other configurations support visualizing the data  In many cases I'm showing the raw configs or the raw XML, but you can often
do these configs in the UI. It's simpler for me to show you the end product than the step-by-step UI instructions.

iTunes props.conf
XML library props.conf

© 2018 SPLUNK INC.

 This assumes that you have copypasted the tracks out of your library.xml file and into a dedicated file.
 The full library.xml file includes other details like podcasts and playlists that I didn't want to deal with yet.
 This is also missing a sed replacement for &, as those are not transformed from &amp; to &

iTunes transforms.conf
XML library field transformations

© 2018 SPLUNK INC.

 The first extraction is for most tracks
 The second extraction catches some with a slightly different format

Add-on builder data input settings
For the Last.fm API

© 2018 SPLUNK INC.

 Make sure the REST URL references all the parameters you set up

 The value of the REST URL parameters can be from the script you write, the setup pages, or the checkpoint variable you set.

© 2018 SPLUNK INC.
Add-on Builder event breaking and checkpoint settings
For the Last.fm API
 Setting a JSON path for the event extraction is very convenient and I love it.
 When you add a checkpoint parameter name, remember to add it to the REST URL parameters!!
 Set a checkpoint initial value especially if you have done backfilling of your data.
 The add-on builder highlights the JSON response to help you determine if your field path is accurate.

Songkick alert action script
The method that calls the API and queues events

© 2018 SPLUNK INC.

 Working to provide the full script online as well as a blog post.
 This is the functional part of the script I wrote for the Songkick alert action.
 Missing parts: imports, writing the events to Splunk, most error handling

Recommended lookup headers
Pick a consistent date format for easy transformation

© 2018 SPLUNK INC.

 For ticket data
purchase_date, onsale_date, concert_date, artist, site, promoter, quantity, cost, face_value, discovery
 For concert data
Date, artist, venue, city, state
 But also
Date, opener1, opener2, opener3, headliner, venue, city, state, info, festival_name, band5, band6, band7

 Pick a consistent date format for easy transformation
 Choose which extraneous metadata about concerts you want to include
 Use the full state name instead of the two letter abbreviation to make KMZ lookups work
 I use "info" to designate if it's a festival or a DJ set or something else as needed.

Spotify progress
Spoilers: not much

© 2018 SPLUNK INC.

 Right now the script hardcodes the scope, username, client_id, client_secret, and redirect_uri
 The Spotipy library makes everything easier to use
 As you can tell, lots of work to do to convert this to a modular input still.

Earliest listen search-driven lookup
 Test the search in the search pipeline first before scheduling it
 Do inputlookup append=t before you do the outputlookup

© 2018 SPLUNK INC.

Discovery vs Popularity XML

© 2018 SPLUNK INC.

 Dashboard input and two searches for each panel. The panels each use the same token as the dashboard input.

© 2018 SPLUNK INC.
What's my listening pattern around a concert?
XML
 The dashboard input is populated by a search into the lookup.
 The event annotation search has a type="annotation"
 The other search is real basic.

BPM Listen Analysis
XML for the trending BPM over time indicator

© 2018 SPLUNK INC.

 Used a search-driven lookup to combine tracks with bpm to make it easy to enrich at search-time
 Removed empty values from the results
 Tracked the average BPM per month over time.
 Added a drilldown for the BPM value so I could look up songs with that BPM.

Songkick dashboard XML

© 2018 SPLUNK INC.

 The first row has one panel that is using the events created by the Songkick alert action and the other panel displays the attribution image.
 The second row is a panel that is taking data from the log, uses a lookup to get the artist display names, and display the artists that do not have concerts.

