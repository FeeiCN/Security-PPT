Determining the Fit and Impact of CTI Indicators on Your Monitoring Pipeline
(#tiqtest2)
Alex Pinto - Chief Data Scientist ­ Niddel (now a part of Verizon) @alexcpsec @NiddelCorp

Who am I?
· Brazilian Immigrant · Security Data Scientist · Capybara Enthusiast · Co-Founder at Niddel (@NiddelCorp) · Founder of MLSec Project (@MLSecProject) · What is Niddel? ­ Niddel is a security vendor that provides a
SaaS-based Autonomous Threat Hunting System · We are now a part of Verizon, but this is not what this talk is
about, so hit me up later!

This Talk Contains
· 1 Fair Warning · 1 Witty Metaphor · 3 Novel(-ish) Ideas · 2 Hopeful Dreams · 1 Enlightening Conclusion · Several Self-Serving Callbacks
· At least 1 Capybara

Fair Warning
· This is a presentation about Metrics
· Please hold your applause · Data Scientists like data at scale (duh) · Only by measuring the impact we can have, we will be able to have effective "supply chain management" and "industrialization" of threat intel · Data QA and analysis is 95% of any ML effort

Metrics on What?

What I was consuming
What happened. First order utility.

My Telemetry / Vitals

The real important metric / objective. Second order utility.

Taking Diminishing Returns into Account

Mostly inside baseball.

TIQ-TEST ClassicTM

· NOVELTY ­ How often do feeds update themselves? · AGING ­ How long does an indicator sit on a feed?

· OVERLAP ­ How do they compare to what you got?

· UNIQUENESS ­ How many indicators are found in only

one feed?

Insights on what we are consuming.

· POPULATION ­ How does this population distribution
compare to another one ? Insights on first order utility, how the data affects us.

Coverage Test

Coverage Test (aka Overlap 2.0)
· Our interpretation of Coverage:
· Are you getting the data you need from the myriad feeds you consume? · How much unique data does the feed contain? · What actual DETECTION and CONTEXT opportunities arise from the data you have available?

Overlap ClassicTM is
still too much inside
baseball

Coverage Test
· For each feed you have available:
 =  , 

%

=



,  

Explore coverage by number of unique entities. How much independent data am I really getting from each feed?

Scale invariant by IOC percentage.

Coverage Test - Caveats
· Too much uniqueness could mean a lot of FPs! · Having overlap is NOT BAD
· Confidence + different workflow mapping
· This is not related to "CTI Generation" coverage, as in source and methods utilization and actor tracking
· Aaron Shelmire did some work on that · Ex: Dridex -> Locky -> GlobeImp -> Dridex from same actors

Fitness Test

Fitness Test (aka Population 2.0)
· The original Population test was too concerned in using fancy statistics to be useful.
· Trends and population comparisons ARE COOL, and a good way to drive detection engines, but a bad way to evaluate clearly if a feed has a relationship to your environment.
· Detection power of feeds only matter of they "fit" your telemetry

Fitness Test
· For each feed you have available:
 =  , 
 =   ,  , 
Unique IOCs per feed from our Coverage test

Example of UniqueFit analysis.
Outliers should be investigated and analyzed closely.

Fitness Test - Caveats
· A bad Fit does NOT mean a bad Feed. Best ICS / OT feed data will probably "not fit" the telemetry of a small credit union.
· A Fitness value that is too high could also mean a high number of false positives, unless the feeds themselves are too different.
· Sharing communities: Fitness answers the "am I the only one?" question perfectly.

Impact Test

Impact Test (our Splat points)
· "How much detection are we getting out of this?"



=

_( ,   , 

)

· What is a "good alert"? What is a "false positive"?
· Good alert: An alert that was "correct" even if it had been alerted by something else is not a false positive.

Example of Impact analysis.

Example of Unique Impact analysis.
Notice the differences.

Deep Impact Test
· What if it's not a direct IOC match but we learned from it? · Best usage from CTI is "climbing the pyramid", and learning TTPs · Not so simple to account for correctly

TIQ-Test 3.0? 

Ideas from a Metric Filled Future
· BENEFIT ­ "By using this feed / combination of feeds correctly correctly, you are likely to have ~10 actionable alerts per week"
· ASSURANCE ­ "By using this feed / combination of feeds correctly, you will have the capability to detect threat actor / malware family X within an SLA of 24 hours"

In Summary...

In Summary
· To avoid diminishing returns from buying / ingesting new CTI feeds you must be continually working hard to make them work for you.
· Failing to understand the caveats of proper usage and selection of feeds as your org matures will lead you to a "detection plateau" where more feeds are not making you more secure.

Questions?

Share, like, subscribe. Q&A and Feedback please!

Alex Pinto ­ alexcp@niddel.com @alexcpsec @NiddelCorp

"If you can't measure it, you can't improve it." - Peter Drucker

