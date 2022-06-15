Data-Driven Threat Intelligence: Metrics on Indicator Dissemination and Sharing
(#ddti)
Alex Pinto Chief Data Scientist MLSec Project / Niddel
@alexcpsec @MLSecProject @NiddelCorp

Agenda
· Previously on #ddti · Challenges at TI Sharing · Measuring TI Sharing · The Future of Sharing

This is a data-driven talk!
Please check your anecdotes at the door

Previously on #ddti
· Useful Methods and Measurements for Handling Indicators · Analysis of Threat Intelligence Feeds · Indirectly, a methodology for analyzing TI Providers
· Combine (https://github.com/mlsecproject/combine) · Gathers TI data (ip/host) from Internet and local files
· TIQ-Test (https://github.com/mlsecproject/tiq-test) · Runs statistical summaries and tests on TI feeds

TIQ-TEST - Tons of Threat-y Tests
Putting this threat intel data to work
· NOVELTY ­ How often do the feeds update themselves? · AGING ­ How long does an indicator sit on a feed? · POPULATION ­ How does this population distribution
compare to my data? · OVERLAP ­ How do the indicators compare to the ones you
got? · UNIQUENESS ­ How many indicators are found only on one
feed?

Overlap Test
More data is fine, but make sure it is different

Overlap Test - Outbound

Uniqueness Test
Can we tell if we are close to finding *all* the threats?

I hate quoting myself, but...

Key Takeaway #1

MORE != BETTER

Threat Intelligence Indicator Feeds

Threat Intelligence Program

Constructive Feedback from the Internet:
"TI Sharing is TOTALLY going to solve this"
Right, folks? Right?

TI Sharing Solution Plan:
Or at least a rough straw man
1. The best Threat Intelligence is the one that you analyze from your own incidents (homegrown / organic intelligence)
2. There is strength in numbers ­ vertical herd immunity!
3. ????????
4. PROFIT!! (or at least SECURITY!!)

Issue 1 - BYOTI
If CONSUMING is for the 1%, what is the percentage of organizations able to PRODUCE?

Issue 2 - Herd Immunity
· We may be able to detect more "virus strains" together but we are *terrible* at inoculation.

· The things we detect the most mutate too fast (Pyramid of Pain)

· Who didn't get immunized, still gets sick (FOMO-TI)

Source: www.vaccines.gov

Issue ? - What are we sharing
· AUTOMATION-DRIVEN (PLATFORMS) · Straight to the point IOC sharing
· ANALYST-DRIVEN (COMMUNITIES) · Strategic data, best practices, unstructured IOCs
· "Analyst-driven" has been around forever (in non-IC, at least since FS-ISAC was created)
· The same people who bash "just IOC sharing": · Bash STIX/TAXII for trying to encode complexity · Tells everyone it is IMPOSSIBLE to hire analysts

The Cognitive Dissonances of TI Sharing

Everybody should share!

The CIRCLE OF TRUST

The Two Sides of the Trust Coin

Do you trust the group enough to share?

Do you trust the group enough to consume?

Okay, I'll bite
Can we measure our current sharing platforms communities?

Threat Intelligence Sharing
We would like to thank the kind contribution of data from the fine folks at Facebook ThreatExchange and ThreatConnect
... and also the sharing communities that chose to remain anonymous. You know who you are, and we  you too.

Sharing Communities ARE Social Networks

Social Network Selfie

Sharing Community Selfie

Let's look at the indicators first
Using TIQ-TEST Overlap and Uniqueness tests

OVERLAP SLIDE

OVERLAP SLIDE

UNIQUENESS SLIDE
Looks like we would get similar quality on a "good" Threat Intelligence Sharing Platform as we would on
a "paid feed"

Suggested Metrics for Sharing
Looking for healthy dynamics
· ACTIVITY ­ How many indicators / posts are being shared day by day?
· DIVERSITY ­ What is the percentage of the population that is actively sharing?
· FEEDBACK ­ Are orgs collaborating on improving the knowledge in the sharing environment?
· TRUST ­ How much data is shared "openly" in relation to "privately"?

Activity Metric
Is there any actual sharing going on?

Large Group is roughly 40x bigger than Small Group

Less data / Delays

More data / Timely

Organizations are less likely to share if they perceive they "lost control" of who can consume.

Diversity Metric
Check your sharing privilege

Roughly 10% of the organizations share data into the community

Some organizations are clearly in a better position operationally and legally to share. And that is expected due to our premises.

Feedback Metric
But is the data any good?

 I'm sure we can do better than this 

Feedback Metric
· Almost no support on automation-driven platforms · Some allow you to leave "comments" or "new descriptors"
for the IOCs ­ even by counting those very low % in relation to new shared data
· Analyst-driven environments allow for collaboration on emails and forum posts to describe and refine strategies and best practices.
How can we make this collaboration work on automation-driven platforms?

Trust Metric
Are we helping all the community or just a few orgs at a time?

76%. Again, sounds about right

Overall "quality" of data goes up too!

Trust Metric
· The rough estimate seems to be that more than 60% of "sharing" (IOCs, messages, etc) happens in "private groups" inside the infrastructure of the sharing platform
· All communities have them: · Part of the DNA of the IC / cleared community · Offsets the trust equation, but defeats the "herd immunity" argument · Usually MANDATORY on collaboration with LEA
But then the "good" data is not helping "the community"! Is there any way we can reconcile?

The Future of Sharing 
At the very least my humble opinion

#squadgoals
Increase the TRUST among peers
Reduce the TECHNICAL BARRIER
for sharing useful information

TRUST: Reputation and Anonymity

AlienVault OTX clearly got the memo

TRUST: Anonymity + Good Curation
Some sharing communities accept anonymous submissions that they then curate and disseminate
to all organizations

TECHNICAL BARRIER: "Pyramid of Sharing"

MORE MATURE

IOCs

Feedback

LESS MATURE

Telemetry

With  and apologies to @DavidJBianco

Takeaways
· Intelligence Sharing is a very analyst-centric activity that we have been tasked with scaling out with automation. No wonder it seems so hard.
· Data can be as good as a paid feed, but you have to be in the right circles of trust
· Does not solve analyst shortage and making the indicators / strategies operational into your environment

· Q&A? · Feedback!

Thanks!
Alex Pinto
@alexcpsec @MLSecProject / @NiddelCorp

"The measure of intelligence is the ability to change." - Albert Einstein

