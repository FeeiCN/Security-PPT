SESSION ID: PS-W02
8 Million Findings in One Year: Fresh Look at the State of Software Security

Chris Wysopal
Co-Founder and CTO Veracode @WeldPond

Jay Jacobs
Co-Founder and Chief Data Scientist Cyentia Institute @jayjacobs

#RSAC

#RSAC
What is this research?
· Veracode State of Software Security (SoSS), Vol. 10
· Largest quantitative study of application security findings
· Partnered with data scientists at Cyentia Institute

The Why:

#RSAC

· Insights into industry performance, and impact

of DevSecOps on fix rates

· Provide data for customers to benchmark themselves against their peers

· Generate actionable advice for improving application security programs

The How:
· Formulate questions that might be answerable given the available data
· Stand back and use science

The Data...
Vol. 1
1,591
software tested

Vol. 10
85,000+
software tested

Over 2,300 Veracode customers
12 months of software scan data: April 1, 2018 ­ March 31, 2019
Over 85,000 unique pieces of software and 1.4 million individual assessments

#RSAC
That's over a 50-fold increase in sample size!

#RSAC
The State of Software Security

#RSAC
Mean Time to Remediation among closed findings
· The median fix time remains relatively unchanged from 10 years ago.
· However, the tail of everaccruing "security debt" just got a lot longer, causing the mean closed time to stretch out.

#RSAC
Proportion of software applications/products with at least one flaw in the initial scan

Overall OWASP SANS

#RSAC
Software with high-severity flaws
Majority of products/applications are free from high/critical flaws

Prevalence of flaw categories in SOSS Volume 1 and 10

#RSAC
There is a general increase in web-related categories, likely due to a lot more web applications being written.

Less code is being written in C/C++ so buffer overflows, buffer management errors, and numeric errors are way down.

#RSAC
Fix rate across all flaws
"Fix rate" is the proportion of discovered flaws that are successfully closed or remediated.

#RSAC
Fix Behavior

#RSAC
Measuring time to remediate is challenging...
· Simple approach is to calculate time for remediated findings
· Ignores the still-open (security debt) · But it's simple and intuitive
· Survival analysis studies the time to an event
· Accounts for findings that are still open (security debt)
· Team stopped scanning · Not closed yet, was still open at last scan

Time to Failure (example)

#RSAC
These are "censored" - all we know is they lasted "at least" this long.

Time to Failure (example)

#RSAC
Observations are lined up so they all start on day 0.

Time to Failure (example)

#RSAC
Line represents best estimate of probability an event hasn't occurred yet.

#RSAC
Flaw persistence curve
These look at the observed time for only the closed findings.
These look at both "closed" and "still-open" findings to estimate median/mean.

#RSAC
Flaw persistence curve

Median Time-to-remediate across flaw categories

#RSAC

#RSAC
Time-to-remediation across flaw severity scores
Surprisingly, flaw severity doesn't correlate strongly with fix speed
Even the Very High severity flaws have a long tail for fix time, taking over 130 days to
reach the 75% closed milestone.

Speed and comprehensiveness for flaw categories

#RSAC

Fixed Slow

Fixed Quick

Selective

Thorough

OWASP Top 10: Rankings

#RSAC

Analysis of exploits published in Exploit DB
(courtesy of F5)

Incidents worked and traced back to root issue
(courtesy of F5)

#RSAC
Security Debt

#RSAC
Probability of remediation over time
Recently discovered flaws are more likely to be remediated
Older flaws have about the same (low) chance for remediation month after month

Flaw fix capacity and accumulation (security

#RSAC

debt) over time

#RSAC
Does DevOps make a difference?

Frequency of security scanning

#RSAC

across SDLC

· We use scan activity as an indicator that an organization may be following DevOps practices

· DevOps is not just automation (also culture and processes), but automation is easier to measure

Effect of annual scan frequency on median time-to-

#RSAC

remediation

· Frequent scanners closed flaws much quicker. · Fix rate was tripled · Security debt reduced three-fold.

Fix capacity and security debt by scan frequency

#RSAC

#RSAC
Security scanning across a sample of SDLCs

#RSAC
Fix capacity and security debt by scan cadence

#RSAC
Conclusions

#RSAC
Our data suggests:
· Security automation (as measured by scan frequency) continues to significantly lag the widespread and accelerating adoption of DevOps
· Developers do not prioritize fixes in a security-appropriate manner; recency appears to outweigh every other factor
· Incorporating daily application testing improves MedianTTR by 3x relative to weekly testing
· Steady testing facilitates chipping away at security debt, while bursty testing allows security debt to balloon

#RSAC
Apply What You Have Learned Today
Next week you should:
­ Identify DevOps pipelines in your organization that could have AST added
In the first three months following this presentation you should:
­ Add AST to the DevOps pipelines that are ready ­ Get on a steady cadence for finding and fixing security flaws
Within six months you should:
­ Work to get all development teams using an automated build process ­ Integrate AST into the build and defect tracking system and process
34

SESSION ID: PS-W02
8 Million Findings in One Year: Fresh Look at the State of Software Security

Chris Wysopal
Co-founder and CTO Veracode @WeldPond

Jay Jacobs
Co-founder and Chief Data Scientist Cyentia Institute @jayjacobs

#RSAC

