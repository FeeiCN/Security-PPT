Community Intelligence
& Open Source Tools
Building an Actionable Pipeline

Intro

Me:
Scott J Roberts
@sroberts
Han Solo is my Spirit Animal

What do CTI industry analysts say?
"When it comes to eating @sroberts is a thought leader up & to the right on all
quadrants!" ~ @rickhholland

DFIRing Since 2006 CTIing Since 2007 Deving Since 2009

The Problem
We are spinning up considerable new telemetry using open source tools and we need to feed those tools with actionable intelligence.

The Other Problem

Pocket

Chat

Note Books

And all the other
sources...

$$$$

So I did what anyone with a little Python experience does
I built my own...

And I built my own again...
And another time...
In the end I built about 5 or 6...

They all sorta sucked... !

"I have not failed. I have found I've just found 10,000 ways that won't work."
~ Thomas Edison

 Direction

Breath vs. Depth

OSX, Linux, & GitHub
centric threats

 Collection

Twitter Email Lists
Feeds Ongoing Incidents
Manual

 Exploitation

To Use a Technical Term
Indicator Extraction
sucks...

But we did it anyway...1
1 YOLO!!!

Jager & Caçador 2
2 Look it means hunter in Portuguese.

Command
$ pbpaste | cacador | jq '.[]'

Output

Tada!!!

 Analysis

Threat Note

Enrichments
Whois PassiveTotal
Shodan VirusTotal

Maltego

Fast Incident
Response

 Dissemination

Now
Manual

SoonTM
osquery & Bro Intelligence Chat with Hubot
Intelligence Reports Application Integration

 Feedback

The Result

The (REAL) Result
A (somewhat) automated system providing centralized threat data & intelligence management made
up of a single source of truth supported by purpose built collection, processing, and
analysis integrations.

Lessons

This isn't easy
But parts are.

Threat Intel Tools Work
When They're Integrated
~
collection | analysis | dissemination

High Value Investments
Tool: Paterva Maltego ~ $760
Service: PassiveTotal ~ $??
Learning: Introducing Python ~ $33

Learn to Code

Unix Philosophy
Small is beautiful
Make each program do one thing well
Portability over efficiency
Store data in flat files
Make every program a filter

Data formats matter less than format openness
CSV & JSON

Perfect Is the Enemy Of Good

The Future:
Scaling Up Collection & Storage
Expanded Threat_Notes APIs & Integrations
Reputation & Fuzzy Indicators

Links
github.com/defpoint/threatnote github.com/certsocietegenerale/FIR
github.com/sroberts/jager github.com/sroberts/cacador github.com/kbandla/APTnotes github.com/armbues/iocparser github.com/ivanlei/threatbutt

Thanks
Threat Note: @brianwarehime FIR: @thomchop_
APTNotes: @kbandla Jager: @kylemaxwell, @kbandla, & @deadbits

Questions??? ~ @sroberts http://sroberts.github.io

