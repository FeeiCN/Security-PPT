Blueprints for Actionable Alerts
...while you get settled...
 Latest Slides: · https://splunk.box.com/v/conf18-alerts
 Collaborate: #alerting · Sign Up @ http://splk.it/slack
 Load Feedback ------------------------>

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Blueprints for Actionable Alerts
"From spam to glam with Splunk Alerts"
Burch | Manager, Product Best Practices
.conf18 > Presented by Splunk's Digital Customer Success

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

What's a "Burch"?
Manager, Product Best Practices
 Education: Comp Sci + MBA  Werk: Middleware Eng
 Splunk Customer since 2012 · Admin for four environments · This is based on a true story...
 Splunk Employee since 2014 · Sales Engineer · Best Practices Engineer · "Best Practiced Deployment" (CoE)

© 2018 SPLUNK INC.

eval Agenda = "Maturity Model"
weak --> strong

1. Stage 1: Message of Concern

© 2018 SPLUNK INC.

2. Stage 2: Thresholds

3. Stage 3: Relative Percentages

4. Stage 4: Average Errors

5. Stage 5: Percentiles

6. Bonus Stage 6: IT Service Intelligence

7. Stage 7: Actionable Alerts

© 2018 SPLUNK INC.
Phase 1: Message of Concern

Attempted Solution
Basic Search => Spammy Alert

© 2018 SPLUNK INC.
[Spam] action.email = true action.email.to = welovespam@spam.com counttype = number of events cron_schedule = */15 * * * * dispatch.earliest_time = -15min dispatch.latest_time = now enableSched = true quantity = 0 relation = greater than search = index=_internal error

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Attempted Solution
Basic Search => Spammy Alert

© 2018 SPLUNK INC.
[Spam] action.email = true action.email.to = welovespam@spam.com counttype = number of events cron_schedule = */15 * * * * dispatch.earliest_time = -15min dispatch.latest_time = now enableSched = true quantity = 0 relation = greater than search = index=_internal error

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Result
4,436 errors over last 15min
#unrealistic

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Obvious Improvements
 Scope of problem is large · Solution: indexed fields (index, source, sourcetype, and/or pattern)
 Problem: "error" matches more than desired · Solution: bind with fields like log_level="error"
 Result: Stronger search ignores benign results

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

© 2018 SPLUNK INC.
Phase 2: Thresholds

Attempted Solution
 Only alert if more than "arbitrary" # occurrences / time · Arbitrary = perception of healthy
· or...

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Result & Obvious Improvements
 Ignores variances of different types of errors · Web errors rarely happen but server errors happen often
 Fluctuations relative to usage · Threshold too small or large during peak or minimal usage, respectively · Static thresholds not adjusting with business growth or decline

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

© 2018 SPLUNK INC.
Phase 3: Relative Percentages

What 2 Clean?

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

New Concept
eval goal_attacking = coalesce( spam, system )

© 2018 SPLUNK INC.

Spam  Normalize against # of errors
 Ignore non error events
 log_level=ERROR

System  Normalize to all events
 Include all error + non error events
 log_level=*

 Good for clean up  Bad for permanent

 Good for permanent  Bad for clean up

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Attempted Solution
Large % Items

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Result & Obvious Improvements
 Huge improvement · Less spam · Adjusts because normalized to volume
 What if that's normal? · Then persistent alerts that should be ignored = spam + noise!
 Percentage => Static => Arbitrary?!

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

© 2018 SPLUNK INC.
Phase 4: Average Errors

Attempted Solution
Current period vs historical average

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Result
 Adjusts with changes in environment!
 Slow · Summary Indexing? · Acceleration?
 How often alert? · Definition of average!

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Statistics Detour

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Statistics Detour
Historical # of errors / 5 min period

11

56

87

5

19

67

21

18

77

© 2018 SPLUNK INC.
31 54000

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Statistics Detour

© 2018 SPLUNK INC.

11 87 5
19

21

18

56 67
77

31 54000

0 to 10 | 11 to 20 | 21 to 29 | 30 to 39 | 40 to 49 | 50 to 59 | 60 to 69 | 70 to 79 | 80 to 89 | 90 to 99
Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Statistics Detour

© 2018 SPLUNK INC.

At what value does this become

actionable?

Min

Average

18

Max

19

5 11 21 31

56 67 77 87

0 to 10 | 11 to 20 | 21 to 29 | 30 to 39 | 40 to 49 | 50 to 59 | 60 to 69 | 70 to 79 | 80 to 89 | 90 to 99

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Statistics Detour

© 2018 SPLUNK INC.

What if we could skim off outliers?

Alert at near max?

18 19

5 11 21 31

56 67 77 87

0 to 10 | 11 to 20 | 21 to 29 | 30 to 39 | 40 to 49 | 50 to 59 | 60 to 69 | 70 to 79 | 80 to 89 | 90 to 99

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Statistics Detour

© 2018 SPLUNK INC.

perc<X>(Y) = Returns the X-th percentile value of the numeric field Y, where X is an integer between 1
and 99. The percentile X-th function sorts the values of Y in an increasing order. Then, if you consider that 0% is the lowest and 100% the
highest, the functions picks the value that
18 corresponds to the position of the X% value. 19

5 11 21 31

56 67 77 87

0 to 10 | 11 to 20 | 21 to 29 | 30 to 39 | 40 to 49 | 50 to 59 | 60 to 69 | 70 to 79 | 80 to 89 | 90 to 99

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Statistics Detour

© 2018 SPLUNK INC.

perc90(this_result_set) = ?

18 19

5 11 21 31

56 67 77 87

0 to 10 | 11 to 20 | 21 to 29 | 30 to 39 | 40 to 49 | 50 to 59 | 60 to 69 | 70 to 79 | 80 to 89 | 90 to 99

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Statistics Detour

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Warning: Assumption

© 2018 SPLUNK INC.

Shout out to Xander! Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Warning: Heavy Tails

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Warning: Reality

© 2018 SPLUNK INC.

What percentile is appropriate given this distribution?
Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Know Thy Data

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

© 2018 SPLUNK INC.
Phase 5: Percentiles

Attempted Solution
 Current period's error rate vs. historical error rate · by error category (component)

© 2018 SPLUNK INC.

 Performance?
Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

The Lasso Approach
 Triage Strategy  Perimeter around errors  Tighten lasso by reducing percentile  Rinse & repeat

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Alternatives
 Address most common errors first · Start at 5th percentile and work up
 Normalization Frames: · Same errors · All errors · All events · Time windows (e.g. work hours)

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Result
 Adjusts with changes in environment!
 Requires Maintenance · Power User skillz · Summary Indexing
 Not period time adjusted · Fluctuations in business day or period

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Performance Detour

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Massive Search

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Summary Indexing Solution
 Generate malleable historical data (use snap-to times!)

© 2018 SPLUNK INC.

 Alert upon historical data

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

 Generate result set

Develop with loadjob
Caching!

 Fetch result set to avoid re-searching

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

New Features
Logs as Metrics gain performance > lose keyword search
Workload Management control and prioritize the amount of system resources allocated
SmartStore high volume data > caching implications
Search performance improvements upgrade & enjoy

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

© 2018 SPLUNK INC.
Bonus Phase 6: IT Service Intelligence

© 2018 SPLUNK INC.
"Make actionable alerting
accessible, usable and valuable to everyone!"
Why ITSI?

Quantile, Range, and STDDEV. Oh my!

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Adaptive Thresholds

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Anomaly Detection

© 2018 SPLUNK INC.

Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

© 2018 SPLUNK INC.
Phase 7: Actionable Alerts

Actionable Alerts Made Easy

© 2018 SPLUNK INC.

50 Message > Thresholds > Relative % > Averages > Percentiles > ITSI > Actionable Alerts

Wrap Up

1. Stage 1: Message of Concern

© 2018 SPLUNK INC.

2. Stage 2: Thresholds

3. Stage 3: Relative Percentages

4. Stage 4: Average Errors

5. Stage 5: Percentiles

6. Bonus Stage 6: IT Service Intelligence

7. Stage 7: Actionable Alerts

What Now?
Related breakout sessions and activities...

1. Rate this! (be honest)
2. Collaborate: #alerting
· Sign Up @ http://splk.it/slack
3. More talks, search for
· Burch · Jeff Champagne · Delaney · Stefan · Veuve

© 2018 SPLUNK INC.

Questions & Discussion?
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

53

