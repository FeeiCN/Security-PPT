SESSION ID: CXO-W09
The Impact of Software Security Practice Adoption Quantified

Larry Maccherone
Distinguished Engineer, Comcast @LMaccherone LinkedIn.com/in/LarryMaccherone

#RSAC

#RSAC

The
Impact
DevofSecOps Quantified
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

Larry Maccherone
@LMaccherone
LinkedIn.com/in/LarryMaccherone

#RSAC
Software Security city
This place runs on intuition, folklore, and anecdotes.
If you want to know the truth about this town, stick with me. I'll tell you a story you'll never forget.
But if you don't want your beliefs challenged with data, you'd better beat it, kid. I don't want to upset you.
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

CAUTION: Correlation
does not necessarily mean
causation
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC

CAUTION: There are no best practices
Only good practices in
context
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC

Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC

#RSAC
3.5 years earlier, we launched our DevSecOps Transformation Program Let's back up and fill in that part of the story...
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC
Security practices on DevOps continuum  Dev[Sec]Ops

· Pen testing (Vuls found  Test scripts) · Compliance validation (PCI, etc.) · Fuzzing

· Analysis  Learning · Defect/Incident 3-step · New attack surface?
Plan to update threat model

· Test security features · Common abuse cases

· Restore/maintain service for non-attack usage

· Break the build code analysis
· Static/IAST analysis · Abuse case tests · Code review

· Threat modeling  backlog items · Analyze/Predict  backlog items · Design complies with policy?

· If we do X will it mitigate Y? · Capacity forecasting · Learning  Update playbooks
and Training

Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

· Configuration validation · Feature toggles/Traffic
shaping configuration · Secrets management

· RASP auto respond · Roll-back or toggle off · Block attacker · Shut down services
· Intrusion detection · App attack detection
· Log information for afterincident analysis

#RSAC
That's a lot of stuff! How do we get
development teams to adopt?
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

3-Part Framework Agile/DevOps/Security Transformation Framework

#RSAC
1. Hearts and minds of developers 2. Shallow team-level improvement ramp 3. Management visibility and goal setting
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC
We, the Security Team...

Trust that Engineering Teams...
· Want to do the right thing
· Are closer to the business context and will make trade-off decisions between security and other risks

Pledge to...
· Provide information and advice so those trade-off decisions are more informed
· Lower the cost/effort side of any investment in developer security tools or practices

Understand that...
· We are no longer gate keepers but rather tool-smiths and advisors

Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

Live Demo
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC

#RSAC
Get each team on the path to improvement Thoughts  Words  Action  Culture (ThWAC)
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC
Management Visibility into Progress on Essential 11 Dev[Sec]Ops Practices
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

The Program is working
"That was awesome!", "Loved it!", "Wow!", "Very valuable and engaging. Much more than I expected"
"Very different approach than we expect from security", "Dev team empowerment (teams own
their own security)", "Process driven by dev team priorities, not policy-driven", "Collaborative
effort to improve security"
Most valuable was... "Learning about all the different practices", "Understanding the global
view", "Quantifying what needs to be done"
"Loved the bang-for-the-buck ordering as opposed to a book of policies"

#RSAC
· Teams sign up for 2.46 practice adoption goals for each 90-day window. We ask for 1 or 2, maybe 3 or 4.
· 93% of team 90-day practice adoption goals are fully or mostly achieved
· Conducted these facilitated self-assessments with 200 different teams. 200-300 remain.

Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

The investigation proceeds with ...
Finding Clues
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC

#RSAC
· 195 teams onboarded to DevSecOps Transformation Program via facilitated self-assessment and workshop which gives us the practice data for our x-axis
· Able to map data from 158 of those teams to in-production network originated scan findings from Nessus, Qualys, etc. which gives us our outcome data for our y-axis
· Other sources of risk outcomes under consideration (like security incidents) for later study
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC
The investigation proceeds with ...
DevSecOps Practice Maturity
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC

#RSAC
CVSS-weighted Vulnerability Risk Score
(the Y-axis)
The count of vulnerabilities found by network originated scans (Nessus, Qualys, etc.) weighted by their CVSS severity score
Formula

So, a CVSS score of...
­ 10 adds 1024 to the risk score ­ 9 adds 512 to the risk score ­...

Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

20

#RSAC
DevSecOps Practice Maturity
(the X-axis)
Count of 7 key practices that the team has gotten all the way to "Culture"
­ Low: 0 ­ Medium: 1-2 ­ High: 3 or more

Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

21

#RSAC
DevSecOps Practice Maturity Analysis
When Maturity is...
­ High, average CVSS-weighted vulnerability risk score is 219 equivalent to ~ 1 CVSS score 7.8 vuln
­ Low, average CVSS-weighted vulnerability risk score is 1423 equivalent to ~ 2 CVSS score 9.5 vulns or 6.4 CVSS score 7.8 vulns
The ANOVA p-value is 0.008 indicating that there is a less than 1% chance this correlation is due to chance
In other words...
High DevSecOps maturity correlates with 85% lower security risk

Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

22

#RSAC
Evidence indicates... · High DevSecOps maturity
correlates with 85% lower security risk, so... · You should launch (or accelerate) your DevSecOps Transformation Program
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC
The investigation proceeds with ...
Should we give "partial credit"?
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC
Evidence that Only "Culture" Counts
Same data but with partial credit for Actions (2 "points") and Words (1 "point") in addition to Culture (3 "points"): · Other than very low maturity, the trend disappears · No statistical significance: almost 80% probability the
variation is from chance

Larry Maccherone

@LMaccherone | LinkedIn.com/in/LarryMaccherone

25

#RSAC
Key Insight: Must get all the way to CULTURE
Maturity progression (ThWAC)
­ Thoughts ­ Words ­ Actions ­ Culture
When we only "give credit" for Culture, the correlation is strong
When we "give partial credit" for Words and Actions the correlation essentially disappears

Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

26

#RSAC
You should... · Use partial credit as shallow
onramp to improvement, but... · Challenge the team to get all the
way to "Culture" for one practice before working on the next one
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC
The investigation proceeds with ...
Quantifying the impact of each practice
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC
Positively correlated practices

Practice
Team-external/Org-internal vulnerability process (Note: probable bias with our risk score)
Process for assuring that team-external/org-internal vulnerabilities get resolved in the SLA
High-severity clean
Resolving the initial set of in pipeline scanning findings to zero
Security peer review
... as part of pull request
Secure coding training
Checkmarx Codebashing (2-3 hours) required for all team members who regularly write production code
Only merge secure code
Pull request branch protection status check on scan results to stay at zero
Threat modeling
4-8 hour workshop with security architect facilitating an evaluation of your product design
Production-ready security assessment (PRSA)
Periodically submitting your application(s) to internal white-box pen testing++ assessment
Secrets management
Assuring that passwords, certificates, API keys, etc. are securely stored & not in source code repositories

Risk reduction 73% 65% 61% 49% 49% 46% 44% 20%

Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC
"But my gal, The Truth, she ain't always kind..."
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC

Practice
Security yellow belt training
Basic security awareness training and introduction to other training and programs

Risk reduction 0%

The investigation proceeds with ...
Why does basic security training seem to provide no risk reduction?

Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC
Because... · Yellow belt is at saturation meaning almost
everyone has it · So, if it was anything but zero that would
indicate that our math was wrong
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

Practice
Analysis for code written scanning (1st-party, SAST/IAST)
... integrated with CI/CD pipeline
Analysis for code imported scanning (3rd-party, SCA)
... integrated with CI/CD pipeline

#RSAC
Risk reduction -10% -39%

The investigation proceeds with ...

Why does scanning alone negatively correlate with risk reduction?

Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC
Maybe... · The teams that are pushed to start
self-scans are ones that have poor network-level risk profiles, so it's a self-selection bias
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

But keep in mind...
· These two practices...
Practice Analysis for code written scanning (1st-party, SAST/IAST)
... integrated with CI/CD pipeline
Analysis for code imported scanning (3rd-party, SCA)
... integrated with CI/CD pipeline

#RSAC
Risk reduction -10% -39%

· ... are prerequisites for these two practices

Practice
High-severity clean
Resolving the initial set of in pipeline scanning findings to zero
Only merge secure code
Pull request branch protection status check on scan results to stay at zero

Risk reduction
65% 49%

Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC
Seems obvious but... · We're always looking for quick wins · I constantly run into folks that put together
a project plan to start scanning across their part of the organization leaving the effort to get to healthy resolution curves as a later exercise · It's much better to achieve value in each small part of the organization before starting to scan other parts
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC
Evidence indicates... · Scanning alone provides no risk
reduction · Spend limited resources on
driving healthy resolution curves before expanding scanning footprint
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC

Practice
Security green belt training
1 person on team has been through 40+ hours of training and project

Risk reduction -76%

The investigation proceeds with ...
Why is 40+ hours of security training highly negatively correlated with risk?

Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

Since...
· Teams get to "Culture" for this practice by having only one member get Green Belt
Maybe...
· One individual is not able to change the outcome for an entire team
· Team members who sign up for Green Belt may be doing it to change roles or escape from a low performing team (self-selection bias)
· Teams that already have advanced security knowledge will have low risk but not value novice-level training (the opposing self-selection bias)

#RSAC

Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC
So we are now... · Rethinking our approach to novice-level security training · Improving selection criteria · Shifting focus to getting all coders to take 2-3 hour
secure coding training which is associated with a 49% risk reduction Bottom line... · Without this quantitative insight, we would have gone blindly forward with our training strategy
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC
Apply What You Have Learned Today
Starting now:
­ Invest in DevSecOps transformation ­ Using the data in this presentation and your own context, identify the key practices
for your DevSecOps Transformation
In the first three months following this presentation you should:
­ Gap analysis: Above list VS "easy button" for development teams to adopt ­ Put in place plans to create the "easy button" to close this gap ­ Start to hire talent to act as coaches and pipeline engineers for your DevSecOps
transformation program
Within six months you should:
­ Conduct 5-10 facilitated DevSecOps self-assessments and coaching workshops ­ Coach your first team to culture on the first few key "easy button" practices

Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

42

A fact without a theory is like a ship without a sail, is like a boat without a rudder, is like a kite without a tail.
A fact without a figure is a tragic final act.
But one thing worse in this universe is a theory without a fact.
~ George Schultz

Upgrade

#RSAC

Intuition

Intsoight

Swap

Replace
Folklore
Fawicthts
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

Anecdotes
Evfiordence
Larry Maccherone
@LMaccherone LinkedIn.com/in/LarryMaccherone

Extra Slides
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC

Investigative loose end...

#RSAC

Why Just Low/Medium/High Maturity?

Low Medium

Same data, more fine-grained x-axis: · Same general trend, but... · 1/4th the statistical significance, because... · Low numbers of data points in buckets to the
right
High

Larry Maccherone

@LMaccherone | LinkedIn.com/in/LarryMaccherone

46

#RSAC
Dev[Sec]Ops is... empowered engineering teams taking ownership of how their product performs in production [including security]
Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

#RSAC

Dev[Sec]Ops Manifesto

Build security in more than bolt it on

Rely on empowered engineering teams more than security specialists

Implement features securely more than security features

Rely on continuous learning more than end-of-phase gates

Adopt a few key practices deeply and universally more than a comprehensive set poorly and sporadically

Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

Build on culture change more than policy enforcement

#RSAC
We, the Security Team...

Trust that Engineering Teams...
· Want to do the right thing
· Are closer to the business context and will make trade-off decisions between security and other risks

Pledge to...
· Provide information and advice so those trade-off decisions are more informed
· Lower the cost/effort side of any investment in developer security tools or practices

Understand that...
· We are no longer gate keepers but rather tool-smiths and advisors

Larry Maccherone
@LMaccherone | LinkedIn.com/in/LarryMaccherone

