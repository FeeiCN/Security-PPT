Splunk Search Pro Tips

Dan Aiello, Principal Cyber Security Engineer

Splunk .conf2015

Dan Aiello

Principal Cyber Security Engineer, MITRE

Approved for Public Release; Distribution Unlimited. 15-2752.

© 2015 The MITRE Corporation. All rights reserved.

| 2 |
Agenda
§My background § Comments §Search by index §In the year 2000 §Red Card §Watch Lists §Search Job Inspector §More fun with subsearches §Carrier signal §Imaginary events § Summary
2 © 2015 The MITRE Corporation. All rights reserved.

| 3 |
My Splunk background
§4 years Splunk experience §SOC is primary user base
§6 indexers §350 GB data/day §90 indexes §170 sourcetypes
© 2015 The MITRE Corporation. All rights reserved.

comments
// No comment

| 4 |
© 2015 The MITRE Corporation. All rights reserved.

| 5 |
Comment your Splunk search
sourcetype=access_combined_wcookie     |  eval  COMMENT="This  is  my  comment"      or    sourcetype=access_combined_wcookie     |  rename  COMMENT  -->  "This  is  my  comment"     
* There's nothing special about the word "COMMENT", use whatever you like
© 2015 The MITRE Corporation. All rights reserved.

| 6 |
rename vs. eval for comments?
§In practice, it does not seem to matter §In a few odd circumstances, I have seen rename be
faster than eval
© 2015 The MITRE Corporation. All rights reserved.

| 7 |
Why would you need comments?
© 2015 The MITRE Corporation. All rights reserved.

Search by index

| 8 |
© 2015 The MITRE Corporation. All rights reserved.

| 9 |
Searching by index and sourcetype
Specifying an index in your search speeds it up

© 2015 The MITRE Corporation. All rights reserved.

This difference is less pronounced in Fast Mode

In the year 2000
In the year 3000

| 10 |
© 2015 The MITRE Corporation. All rights reserved.

| 11 |
Get with the times
§Timestamps are extremely important for Splunk data §Detected at index time, set forever §Cannot be fixed if they're wrong
§Common errors:
­Incorrect time zone interpretation ­Host clock incorrect
© 2015 The MITRE Corporation. All rights reserved.

| 12 |
Past, present, future
If this search ever returns events, you have timestamp problems1: index=*  earliest=+30m  latest=+9y  
This requires some tweaking, depending on your expected delay: index=*  |  eval  delta=_indextime--_time  |  where   delta>300  
1 Or a flux capacitor2 2 Or a TARDIS
© 2015 The MITRE Corporation. All rights reserved.

red card
your approximate wait time is...

| 13 |
© 2015 The MITRE Corporation. All rights reserved.

| 14 |
Calculate average delay proxy logs index=main     |  eval  delta  =  _indextime  --  _time     |  timechart  span=1h  avg(delta)   Problem: that's a lot of events
© 2015 The MITRE Corporation. All rights reserved.

© 2015 The MITRE Corporation. All rights reserved.

| 15 |

| 16 |
Calculate average delay proxy logs

Solution:

*/5  *  *  *  *  wget  http://testdomain.zzz  

  

index=main  testdomain.zzz   |  eval  delta  =  _indextime  --  _time     |  timechart  span=1h  avg(delta)  

  

Search terms

Duration

index=main

453 s

index=main testdomain.zzz

6 s

© 2015 The MITRE Corporation. All rights reserved.

watchlists
better than grep -f

| 17 |
© 2015 The MITRE Corporation. All rights reserved.

| 18 |
Watchlist examples
§Known "evil" IP addresses §Known "evil" domain names §List of your DMZ web servers §Known allowed IP/port combinations in your DMZ
© 2015 The MITRE Corporation. All rights reserved.

| 19 |
Example IP watchlist
© 2015 The MITRE Corporation. All rights reserved.

| 20 |

Conventional way to use watchlists
© 2015 The MITRE Corporation. All rights reserved.

This is essentially grep -F

| 21 |
Let's try a subsearch
© 2015 The MITRE Corporation. All rights reserved.

| 22 |
What's the difference? Both return the same events
© 2015 The MITRE Corporation. All rights reserved.

© 2015 The MITRE Corporation. All rights reserved.

| 23 |
What's the difference? 71% less time

| 24 |
Saving time on a search can be important for large
or frequent searches

© 2015 The MITRE Corporation. All rights reserved.

Small watchlists and large datasets make this difference greater

How does it work?

| 25 |
Just the subsearch

© 2015 The MITRE Corporation. All rights reserved.

© 2015 The MITRE Corporation. All rights reserved.

| 26 |
Subsearches implicitly end with
|  format   Add it explicitly to
see what's happening

| 27 |
sourcetype=access_combined_wcookie     [  |  inputlookup  ip_watchlist.csv  |  search   type=malicious  |  fields  clientip  ]    
...after the subsearch is evaluated becomes this:
sourcetype=access_combined_wcookie     (  (  clientip="131.178.233.243"  )  OR   (  clientip="212.58.253.71"  )  OR  ...  )  
i.e., the results of the subsearch are appended  
© 2015 The MITRE Corporation. All rights reserved.

| 28 |
The Search Job Inspector shows us this.
© 2015 The MITRE Corporation. All rights reserved.

| 29 |
Why is sourcetype=access_combined_wcookie     (  (  clientip="131.178.233.243"  )  OR   (  clientip="212.58.253.71"  )  OR  ...  )  
Better than sourcetype=access_combined_wcookie     |  lookup  ip_watchlist.csv  clientip  |  search   type=malicious  
© 2015 The MITRE Corporation. All rights reserved.

Search Job Inspector
...explains it all

| 30 |
© 2015 The MITRE Corporation. All rights reserved.

| 31 |
This icon means there's some debugging message
you should examine

© 2015 The MITRE Corporation. All rights reserved.

Inspect Job is always here

© 2015 The MITRE Corporation. All rights reserved.

| 32 |

© 2015 The MITRE Corporation. All rights reserved.

| 33 |
Profiling information Debugging message

| 34 |
The slowest parts of a Splunk search are usually field extraction
and reading events from disk.
© 2015 The MITRE Corporation. All rights reserved.

| 35 |
Approximate order of operations for searches
1.Search index for keywords 2.Read matching events from disk 3.Extract fields (as necessary) 4.Match keywords to fields (as necessary) 5.Filter (e.g. additional "where" or "search" pipes) 6.Send data to search head
© 2015 The MITRE Corporation. All rights reserved.

| 36 |
What are keywords?
© 2015 The MITRE Corporation. All rights reserved.

| 37 |
A stitch in time saves nine

lookup

subsearch

2

21 Check index for keywords

39,000

2,700 Read matching events from disk

39,000

2,700 Extract fields (i.e. regex)

39,000

2,700 Match keywords to fields

39,000

2,700 Filter

* This is illustrative and approximate, not precise

Pare your data early to save time late

© 2015 The MITRE Corporation. All rights reserved.

| 38 |
lookup method reads and regexes all this data

sourcetype=access_ combined_wcookie

( ( clientip="131.178.2 33.243" ) OR ( clientip="212.58.253. 71" ) OR ... )

© 2015 The MITRE Corporation. All rights reserved.

subsearch method reads only this data

| 39 |
Compare "lookup" and "subsearch" methods
© 2015 The MITRE Corporation. All rights reserved.

| 40 |
More fun with subsearches
© 2015 The MITRE Corporation. All rights reserved.

| 41 |
Field name mismatch with subsearch
For lookup and subsearch, sometimes fields need to be renamed
lookup method   |  lookup  watchlist.csv  foo  AS  bar  
subsearch method   [  |  inputlookup  watchlist.csv    
            |  rename  foo  AS  bar  ]  
© 2015 The MITRE Corporation. All rights reserved.

| 42 |

© 2015 The MITRE Corporation. All rights reserved.

If you rename a field to "query", you can search anywhere in the event rather
than a single field

| 43 |
Large subsearches

© 2015 The MITRE Corporation. All rights reserved.

If your watchlist is >10000 lines, the subsearch method
chokes
43

| 44 |
Large subsearches

Add "|format" explicitly to fix it!

We have events

© 2015 The MITRE Corporation. All rights reserved.

44

Warning is gone

carrier signal

| 45 |
© 2015 The MITRE Corporation. All rights reserved.

| 46 |
What's the problem with watchlists? When they don't alert, is it because:
§the watchlist is broken? §there's nothing to alert on?
© 2015 The MITRE Corporation. All rights reserved.

| 47 |
Add test cases to your watchlist

Label your test domain as type=test in the watchlist

© 2015 The MITRE Corporation. All rights reserved.

And adjust your subsearch accordingly

| 48 |
Add test cases to your watchlist
Label your test domain as type=test in the watchlist What's so great about that? We could have just used google.com for that test
And adjust your subsearch accordingly
© 2015 The MITRE Corporation. All rights reserved.

© 2015 The MITRE Corporation. All rights reserved.

| 49 |
With your wget, you know precisely how many to
expect and you can alert only when it's erroneous

imaginary events
we landed on the moon

| 50 |
© 2015 The MITRE Corporation. All rights reserved.

| 51 |
Creating data on the fly
© 2015 The MITRE Corporation. All rights reserved.

How is this helpful?

| 52 |
You can add to a watchlist inline

© 2015 The MITRE Corporation. All rights reserved.

| 53 |
Creating data on the fly with timestamps
This will also provide a current
timestamp

53

© 2015 The MITRE Corporation. All rights reserved.

Are we there yet?

| 54 |
© 2015 The MITRE Corporation. All rights reserved.

| 55 |
Overall lessons
§Read Splunk Search Manual §Try multiple methods §Use the Job Inspector §Understand what Splunk is doing "under the hood"
© 2015 The MITRE Corporation. All rights reserved.

Thank you!

| 56 |
© 2015 The MITRE Corporation. All rights reserved.

