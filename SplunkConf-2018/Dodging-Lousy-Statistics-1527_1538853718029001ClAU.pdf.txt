Dodging Lousy Statistics and Analytical Biases
Archana Ganapathi ­ Director of Data Strategy, Splunk Yanpei Chen ­ Principal Product Manager, Product Analytics, Splunk
October 2018 | Version 1.0

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

How do you make decisions?
 Data driven  Rational and objective  Gut instinct  Peer pressure

© 2018 SPLUNK INC.

Got Bias?

© 2018 SPLUNK INC.

Data driven
How often do we calibrate and/or ask why?
 Am I counting the right thing...and correctly?  Are there outliers? Long tail?  Statistical confidence  Seasonality and Noise  Baseline and normalization  Do I have enough + representative data?

© 2018 SPLUNK INC.

Be rational and objective
What info do you use to calibrate choices in front of you?
 Where is the information from?  How credible is the information?  Are there blind spots/factors I have not considered?  What are the alternatives and trade offs?

© 2018 SPLUNK INC.

Gut instinct
What influences your gut?
 Am I falling back to my comfort zone?  History repeats itself?  Is it just me or...?  Self-fulfilling prophecy?

© 2018 SPLUNK INC.

Peer pressure
What's your sphere of influence?
 Who's telling me to...  Why do they care/how are they affected?  Who's *not* speaking up and why?

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
A vocabulary to identify biases
...that creeps into many decisions

Similarity bias Expedience bias Experience bias Distance bias

What is it

People similar to me have better ideas

Why humans have Helped us survive via this bias ingrained a shortcut for trust

Why it matters in

Crowded landscape:

our tech and

need all ideas to truly

business landscape differentiate

How it manifests at Products at Splunk or in our industry

· Group think · Bias for orthodoxy or
for being contrarian · Poor interlock cross-
orgs, "everyone else sucks" syndrome

How you might overcome it

· Recognize that we are fellow employees shareholders
· Evaluate facts, not source of the idea
· Get counter opinion, play devil's advocate

© 2018 SPLUNK INC.
Safety bias

Similarity bias Expedience bias Experience bias Distance bias

What is it
Why humans have this bias ingrained
Why it matters in our tech and business landscape
How it manifests at Products at Splunk or in our industry

People similar to me have better ideas
Helped us survive via a shortcut for trust
Crowded landscape: need all ideas to truly differentiate
· Group think · Bias for orthodoxy or
for being contrarian · Poor interlock cross-
orgs, "everyone else sucks" syndrome

Preferring "feel right" vs rigorous thinking
Helped us survive expediently
Complex landscape: many non-obvious dynamics / decisions
· Loudest voice bias · Recent convo bias · Existing belief
confirmation bias · Sign-off bias · Conflict of interest

How you might overcome it

· Recognize that we are fellow employees shareholders
· Evaluate facts, not source of the idea
· Get counter opinion, play devil's advocate

· Get systematic info from many sources
· Consider a different explanation of facts
· Get sign-off from all stakeholders, invite skepticism

© 2018 SPLUNK INC.
Safety bias

Similarity bias Expedience bias Experience bias Distance bias

What is it
Why humans have this bias ingrained
Why it matters in our tech and business landscape
How it manifests at Products at Splunk or in our industry

People similar to me have better ideas
Helped us survive via a shortcut for trust
Crowded landscape: need all ideas to truly differentiate
· Group think · Bias for orthodoxy or
for being contrarian · Poor interlock cross-
orgs, "everyone else sucks" syndrome

Preferring "feel right" vs rigorous thinking
Helped us survive expediently
Complex landscape: many non-obvious dynamics / decisions
· Loudest voice bias · Recent convo bias · Existing belief
confirmation bias · Sign-off bias · Conflict of interest

What worked (for me) will work again
Helped us survive better over time
Changing landscape: what worked before may not work again
· Draw on experience sans reality-check
· Gut-over-data bias · Bias for (counter)
history · Under-communicate

How you might overcome it

· Recognize that we are fellow employees shareholders
· Evaluate facts, not source of the idea
· Get counter opinion, play devil's advocate

· Get systematic info from many sources
· Consider a different explanation of facts
· Get sign-off from all stakeholders, invite skepticism

· Get other opinions · Get relevant, direct,
reliable info · Find solutions that
fit the context · Judiciously over-
communicate

© 2018 SPLUNK INC.
Safety bias

Similarity bias

Expedience bias Experience bias Distance bias

© 2018 SPLUNK INC.
Safety bias

What is it
Why humans have this bias ingrained
Why it matters in our tech and business landscape
How it manifests at Products at Splunk or in our industry

People similar to me have better ideas
Helped us survive via a shortcut for trust
Crowded landscape: need all ideas to truly differentiate
· Group think · Bias for orthodoxy or
for being contrarian · Poor interlock cross-
orgs, "everyone else sucks" syndrome

Preferring "feel right" vs rigorous thinking
Helped us survive expediently
Complex landscape: many non-obvious dynamics / decisions
· Loudest voice bias · Recent convo bias · Existing belief
confirmation bias · Sign-off bias · Conflict of interest

What worked (for me) Things closer in

will work again

time/space are better

Helped us survive better over time

Helped us survive with "food nearby"

Changing landscape: Complex landscape: what worked before many long-term, nonmay not work again obvious risk/rewards

· Draw on experience sans reality-check
· Gut-over-data bias · Bias for (counter)
history · Under-communicate

· Deadline curse · MVP bias · Small bet bias · Shiny obj syndrome · Discounting total-
life-cycle costs

How you might overcome it

· Recognize that we are fellow employees shareholders
· Evaluate facts, not source of the idea
· Get counter opinion, play devil's advocate

· Get systematic info from many sources
· Consider a different explanation of facts
· Get sign-off from all stakeholders, invite skepticism

· Get other opinions · Get relevant, direct,
reliable info · Find solutions that
fit the context · Judiciously over-
communicate

· Plan through what would happen in half-year, one year, two years
· Optimize for both exit state and path towards there

Similarity bias

Expedience bias Experience bias Distance bias

© 2018 SPLUNK INC.
Safety bias

What is it
Why humans have this bias ingrained
Why it matters in our tech and business landscape
How it manifests at Products at Splunk or in our industry

People similar to me have better ideas
Helped us survive via a shortcut for trust
Crowded landscape: need all ideas to truly differentiate
· Group think · Bias for orthodoxy or
for being contrarian · Poor interlock cross-
orgs, "everyone else sucks" syndrome

Preferring "feel right" vs rigorous thinking
Helped us survive expediently
Complex landscape: many non-obvious dynamics / decisions
· Loudest voice bias · Recent convo bias · Existing belief
confirmation bias · Sign-off bias · Conflict of interest

What worked (for me) Things closer in

Preference for safety

will work again

time/space are better and aversion to risk

Helped us survive better over time

Helped us survive with "food nearby"

Helped us survive physical threats

Changing landscape: Complex landscape: Mature landscape: what worked before many long-term, non- need to balance risk may not work again obvious risk/rewards and reward

· Draw on experience sans reality-check
· Gut-over-data bias · Bias for (counter)
history · Under-communicate

· Deadline curse · MVP bias · Small bet bias · Shiny obj syndrome · Discounting total-
life-cycle costs

· Small bet bias · Sunk cost bias · Avert risk with
unknown positives · Seek risk with
known negatives

How you might overcome it

· Recognize that we are fellow employees shareholders
· Evaluate facts, not source of the idea
· Get counter opinion, play devil's advocate

· Get systematic info from many sources
· Consider a different explanation of facts
· Get sign-off from all stakeholders, invite skepticism

· Get other opinions · Get relevant, direct,
reliable info · Find solutions that
fit the context · Judiciously over-
communicate

· Plan through what would happen in half-year, one year, two years
· Optimize for both exit state and path towards there

· Make small bets that lead to big bets
· Evaluate forward ROI regardless of sunk costs
· Quantify positives AND negatives

Similarity bias

Expedience bias Experience bias Distance bias

© 2018 SPLUNK INC.
Safety bias

What is it
Why humans have this bias ingrained
Why it matters in our tech and business landscape
How it manifests at Products at Splunk or in our industry

People similar to me have better ideas
Helped us survive via a shortcut for trust
Crowded landscape: need all ideas to truly differentiate
· Group think · Bias for orthodoxy or
for being contrarian · Poor interlock cross-
orgs, "everyone else sucks" syndrome

Preferring "feel right" vs rigorous thinking
Helped us survive expediently
Complex landscape: many non-obvious dynamics / decisions
· Loudest voice bias · Recent convo bias · Existing belief
confirmation bias · Sign-off bias · Conflict of interest

What worked (for me) Things closer in

Preference for safety

will work again

time/space are better and aversion to risk

Helped us survive better over time

Helped us survive with "food nearby"

Helped us survive physical threats

Changing landscape: Complex landscape: Mature landscape: what worked before many long-term, non- need to balance risk may not work again obvious risk/rewards and reward

· Draw on experience sans reality-check
· Gut-over-data bias · Bias for (counter)
history · Under-communicate

· Deadline curse · MVP bias · Small bet bias · Shiny obj syndrome · Discounting total-
life-cycle costs

· Small bet bias · Sunk cost bias · Avert risk with
unknown positives · Seek risk with
known negatives

How you might overcome it

· Recognize that we are fellow employees shareholders
· Evaluate facts, not source of the idea
· Get counter opinion, play devil's advocate

· Get systematic info from many sources
· Consider a different explanation of facts
· Get sign-off from all stakeholders, invite skepticism

· Get other opinions · Get relevant, direct,
reliable info · Find solutions that
fit the context · Judiciously over-
communicate

· Plan through what would happen in half-year, one year, two years
· Optimize for both exit state and path towards there

· Make small bets that lead to big bets
· Evaluate forward ROI regardless of sunk costs
· Quantify positives AND negatives

Call these out even-handedly. E.g., "Are we committing loudest voice bias here?" Recognize humans are prone to these biases even with good intentions and training. Establish virtuous cycle between diverse teams and diverse ideas that drive the business.

© 2018 SPLUNK INC.
Tackle analytical bias as entry to unconscious bias
 Rally around self-evident improvements to better decisions for the business  Promotes thought diversity and inclusiveness  Builds culture of openness and respect  Establish virtuous cycle between diverse ideas and diverse teams
 All these are non-optional in a crowded, complex, mature, and rapidly changing business and technology landscape

© 2018 SPLUNK INC.
Q&A

