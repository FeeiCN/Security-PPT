SESSION ID: GRC-W05
How To Measure Anything In Cybersecurity Risk
#RSAC

Doug Hubbard
CEO Hubbard Decision Research
Richard Seiersen
GM Cyber Security & Privacy GE Healthcare

How to Measure Anything in Cybersecurity Risk

© Hubbard Decision Research, 2016

Hubbard Decision Research 2 South 410 Canterbury Ct Glen Ellyn, Illinois 60137 www.hubbardresearch.com

#RSAC
The Coauthors
Richard Seiersen
Currently the General Manager of Cybersecurity and Privacy at GE Health Care. He is an analytics driven executive with ~20 years experience spanning subject matters in Cyber Security, Risk Management and Product Development. He is an active public speaker and tireless advocate for improving security through better, more quantitative, risk management. He has led large enterprise teams, provided leadership in multinational organizations and tier one venture capital backed start-ups.
Douglas Hubbard
Mr. Hubbard is the inventor of the powerful Applied Information Economics (AIE) method. He is the author of the #1 bestseller in Amazon's math for business category for his book titled How to Measure Anything: Finding the Value of Intangibles in Business (Wiley, 2007; 3rd edition 2014). His other two books are titled The Failure of Risk Management: Why It's Broken and How to Fix It (Wiley, 2009) and Pulse: The New Science of Harnessing Internet Buzz to Track Threats and Opportunities (Wiley, 2011).
3

#RSAC
The Biggest Cybersecurity Risk
Question: What is Your Single Biggest Risk in Cybersecurity? Answer: How You Measure Cybersecurity Risk
4

#RSAC
Current Solution
5

#RSAC
Current Solutions
Most standards and certification tests promote risk analysis as a type of ordinal scoring method
The "Risk Rating Methodology" on OWASP.org states:
"Once the tester has identified a potential risk and wants to figure out how serious it is, the first step is to estimate the "likelihood". At the highest level, this is a rough measure of how likely this particular vulnerability is to be uncovered and exploited by an attacker. It is not necessary to be overprecise in this estimate. Generally, identifying whether the likelihood is low, medium, or high is sufficient ."
6

#RSAC
Can Analysis Or Expertise Be A "Placebo"?
"The first principle is that you must not fool yourself, and you are the easiest person to fool." -- Richard P. Feynman
Collecting more than a few data points on horses makes experts worse at estimating outcomes. (Tsai, Klayman, Hastie)
Interaction with others only improves estimates up to a point, then they get worse. (Heath, Gonzalez)
Collecting more data about investments makes people worse at investing. Collecting more data about students makes counselors worse at predicting student performance. (Andreassen)
An experiment with a structured decision analysis method shows confidence increased whether decisions are improved or degraded. (Williams, Dennis, Stam, Aronson)
In short, we should assume increased confidence from analysis is a "placebo." Real benefits have to be measured.
7

#RSAC
What The Research Says
There is mounting evidence against (and none for) the effectiveness of "risk scores" and "risk matrices." Fundamental misconceptions about statistical inference may keep some from adopting quantitative methods. Experts using even naïve statistical models outperform human experts who do not. Note: Every improvement we are about to has already been adopted in several cybersecurity environments.
8

#RSAC
Summarizing Research on Ordinal Scales
Bickel et al. "The Risk of Using Risk Matrices", Society of Petroleum Engineers, 2014
They performed an extensive literature review to-date as well as a statistical analysis of RM used in Petroleum Engineering Risk (which are nearly identical to RM's in Cyber) ­ including computing a "Lie Factor" of the degree of distortion of data.
"How can it be argued that a method that distorts the information underlying an engineering decision in nonuniform and uncontrolled ways is an industry best practice? The burden of proof is squarely on the shoulders of those who would recommend the use of such methods to prove that these obvious inconsistencies do not impair decision making, much less improve it, as is often claimed.'
9

#RSAC
What If We Could Actually Measure Risk in Cybersecurity?

What if we could measure risk more like an actuary ­ "The probability of losing more than $10 million due to security incidents in 2016 is 16%"
What if we could prioritize security investments based on a "Return on Mitigation"?

DB Access Physical Access Data in Transit Network Access Control File Access Web Vulnerabilities System Configuration

Expected Loss/Yr
$24.7M $2.5M $2.3M $2.3M $969K $409K $113K

Cost of Control
$800K $300K $600K $400K $600K $800K $500K

Control Effectiveness
95% 99% 95% 30% 90% 95% 100%

Return on Control
2,832% 727% 267% 74% 45% -51% -77%

Action
Mitigate Mitigate Mitigate Mitigate Monitor
Track Track

This means there is about a 40% chance of losing more than $10M in a year and about a 10% chance of losing more than $200M.

10

#RSAC
Why Not Better Methods?
Cybersecurity is too complex or lacks sufficient data for quantitative analysis...
...yet can be analyzed with unaided expert intuition or soft scales. Probabilities can't be used explicitly because ______ ....
...yet we can imply probabilities with ambiguous labels.
Remember, softer methods never alleviate a lack of data, complexity, rapidly changing environments or unpredictable human actors... ...they can only obscure it.
11

#RSAC
A Major Fallacy Regarding Comparing Methods
Don't make the classic "Beat the Bear" fallacy.
Exsupero Ursus
·If you doubt the effectiveness of quantitative methods, remember, all you have to do is outperform the alternative:
·...unaided expertise or soft scoring methods.
12

#RSAC
Your Intuition About Sample Information Is Wrong!
Cybersecurity experts are not immune to widely held misconceptions about probabilities and statistics ­ especially if they vaguely remember some college stats. These misconceptions lead many experts to believe they lack data for assessing uncertainties or they need some ideal amount before anything can be inferred.
"Our thesis is that people have strong intuitions about random sampling...these intuitions are wrong in fundamental respects...[and] are shared by naive subjects and by trained scientists"
Amos Tversky and Daniel Kahneman, Psychological Bulletin, 1971
13

#RSAC
You Need Less Data Than You Think
A beta distribution computes the probability of a frequency being below a given amount (e.g. chance that rate of occurrence is <2/100) In Excel it can be written as "=Betadist(frequency,alpha,beta)" A uniform prior can be made with alpha=1 and beta=1. This can be used as a starting point for maximum uncertainty. "Hits" and "Misses" can be simply added to the priors (=Betadist(frequency,hits+1,misses+1))
14

#RSAC
Survey Results: Stats Concepts Quiz

Count

We conducted a survey of 171 Cybersecurity professionals

One Finding: Strong opinions against "quant" are associated with poor stats understanding.

60

Negative

Positive

50

Attitudes To

Attitudes

40

Quant

To Quant

30

20

10

0

Stats Literacy At or Below Median

Stats Literacy Above Median

"It's not what you don't know that will hurt you, it's what you know that ain't so."
Mark Twain

15

#RSAC
Historical Models - Still Better Than Experts

When experts assess probabilities, many events ". . .are perceived as so unique that past history does not seem relevant to the evaluation of their likelihood." Tversky, Kahneman, Cognitive Psychology (1973)
Yet, Historical models routinely outperform experts in a variety of fields (even considering "Black Swans")

Paul Meehl assessed 150 studies comparing experts to statistical models in many fields
(sports, prognosis of liver disease, etc.).

"There is no controversy in social science which shows such a large body of qualitatively diverse studies coming out so uniformly in the same direction as this one."

Philip Tetlock tracked a total of over 82,000 forecasts from 284 political experts in a 20 year study covering elections, policy effects,
wars, the economy and more.

"It is impossible to find any domain in which humans clearly outperformed crude extrapolation algorithms, less still sophisticated statistical ones."

16

#RSAC
Monte Carlo: How to Model Uncertainty in Decisions

Frequency and magnitude of
breaches

Outage Frequency and
Duration

4% 5% 6% 7% 8%
Legal Liabilities ($MM)
$30 $40 $50 $60 $70

$20 $25 $30 $35 $40
Cost Per Outage hour

Losses

10% 15% 20% 15% 30%

?
$1M $2M $3M $4M $5M

Simple decomposition greatly reduces estimation error for estimating the most uncertain variables (MacGregor, Armstrong, 1994)
As Kahneman, Tversky and others have shown, we have a hard time doing probability math in our heads
In the oil industry there is a correlation between the use of quantitative risk analysis methods and financial performance ­ and the improvement started after using the quantitative methods. (F. Macmillan, 2000)
Data at NASA from over 100 space missions showed that Monte Carlo simulations beat other methods for estimating cost, schedule and risks (I published this in The Failure of Risk Management and OR/MS Today).
17

#RSAC
A Simple One For One Substitution

Event

Event Probability (per Year)

AA

.1

AB

.05

AC

.01

AD

.03

AE

.05

AF

.1

AG

.07

AH

.02

Impact (90% Confidence Interval)
Lower Bound Upper Bound

$50,000 $100,000 $200,000 $100,000 $250,000 $200,000 $1,000,000 $100,000

$500,000 $10,000,000 $25,000,000 $15,000,000 $30,000,000 $2,000,000 $10,000,000 $15,000,000

Random Result (zero when the event did not occur)
0 $8,456,193 0 0 0 0 $2,110,284 0

ZM

.05

ZN

.01

$250,000 $1,500,000

$30,000,000

0

$40,000,000

0

Total: $23,345,193

Each "Dot" on a risk matrix can be better represented as a row on a table like this
The output can then be represented as a Loss Exceedance Curve.

18

#RSAC
Loss Exceedance Curves: Before and After

How do we show the risk exposure after applying available mitigations?

Stochastic Dominance

Risk Tolerance Inherent Risk

Residual Risk

19

#RSAC
Overconfidence
"Overconfident professionals sincerely believe they have expertise, act as experts and look like experts. You will have to struggle to remind yourself that they may be in the grip of an illusion."
Daniel Kahneman, Psychologist, Economics Nobel
· Decades of studies show that most managers are statistically "overconfident" when assessing their own uncertainty.
· Studies also show that measuring your own uncertainty about a quantity is a general skill that can be taught with a measurable improvement
· Training can "calibrate" people so that of all the times they say they are 90% confident, they will be right 90% of the time.
20

#RSAC
Inconsistency vs. Discrimination
Discrimination is how much your estimates vary when given different information.
Inconsistency is the amount of your discrimination that is due to random differences in estimates - this may be in addition to differences in interpreting verbal scales, so let's assume we are using explicit probabilities.
Experts are routinely influenced by irrelevant, external factors - anchoring, for example, is the tendency for an estimator to be influenced by recent exposure to an another unrelated number (Kahneman).
21

#RSAC
Inconsistency Measurement Results

· We have gathered estimates of probabilities of various security events from:
o 48 experts from 4 different industries.
o Each expert was given descriptive data for over 100 systems.
o For each system each expert estimated probabilities of six or more different types of security events.
· Total: Over 30,000 individual estimates of probabilities
· These estimates included over 2,000 duplicate scenarios pairs.

Judgment 2

Comparison of 1st to 2nd Estimates of Cyber risk judgements by same SME
1.0 0.8 0.6 0.4 0.2 0.0
0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0
Judgment 1 21% of variation in expert responses are
explained by inconsistency.
79% are explained by actual information given
22

#RSAC
Modeling Group Estimates of IT Security Event Likelihood

Group Estimate Group Estimate

Examples of Models vs. Group Averages: Probabilities of different security events happening in the next 12 months for various systems prior to applying particular controls.

Confidentiality Breach Resulting In Fines
0.5
0.4
0.3
0.2

Internal Unauthorized Access Resulting In Productivity Loss
0.5
0.4
0.3
0.2

0.1

0.1

0

0

0.1

0.2

0.3

0.4

0.5

Model Estimate

0

0

0.1

0.2

0.3

0.4

0.5

Model Estimate

The models created produce results which closely match the group's average. A large portion of the model error is due to judge inconsistency. This nearly eliminates the inconsistency error.

23

#RSAC
Effects of Removing Inconsistency Alone

Cancer patient recovery Psychology course grades
Changes in stock prices Mental illness prognosis
Business failures
IT Portfolio Priorities Battlefield Fuel Forecasts
R&D Portfolio Priorities
0%

Other Published Studies
My Studies
10% 20% 30%
Reduction in Errors

24

A method of improving expert estimates of various quantities
was developed in the 1950's by Egon Brunswik.
He called it the "Lens Method"
It has been applied to several types of problems, including expert systems, with consistently beneficial results.

Rasch (Logodds) Model

A Rasch Model is a relatively simple approximation to "add up" a number of parameters that modify a probability when NPTs would be large. Logodds of X=LO(X)=ln(P(X)/(1P(X))

Initial Prob: P(E) Baseline Logodds

Adjustment due to condition Y=A(Y) =LO(P(X|Y))­ LO(P(X)) P(X|A,B,..)=A(Sum of (LO(A),LO(B),...)+LO(P(X))) The more independent the parameter are, the better the Rasch approximation.

P(E|X) P(E|~X) P(X) Test P( E ) Logodds change|X Logodds change|~X

#RSAC

10% -2.197
A 34.0% 5.5% 16.0% 10.1% 1.5339 -0.6466

Conditions
B 15.0%
9.0% 20.0% 10.2% 0.4626 -2.3136

C 40.0% 3.0% 19.0% 10.0% 1.7918 -3.4761

D 12.0% 8.0% 50.0% 10.0% 0.2048 -2.4423

25

#RSAC
Measurement Challenge: Reputation Damage
One of the perceived most difficult measurements in cybersecurity is damage to reputation. Trick: There is no such thing as a "secret" damage to reputation! How about comparing stock prices after incidents? (That's all public!) So what is the REAL damage?
Legal liabilities, Customer outreach "Penance" projects (security overkill) The upshot, damage to reputation actually has available information and easily observable measured costs incurred to avoid the bigger damages!
26

#RSAC
Supporting Decisions

 If risks and mitigation strategies were quantified in a meaningful way, decisions could be supported.
 In order to compute an ROI on mitigation decisions, we need to quantify likelihood, monetary impact, cost, and effectiveness

Risk
Risk 1 Risk 2 Risk 3
Risk 4

Likelihood / Yr 37% 11% 34%
29%

Impact / Yr $2M to $40M $50K to $400K $5M to $80M
$500K to $20M

Mitigation Effectiveness
95% 100% 90%
98%

Mitigation Cost / Yr $725K
$95K $2.5M
$375K

Mitigation ROI 725% -80% 329%
437%

Action Mitigate Track Monitor
Mitigate

·The optimal solution would be to mitigate Risks1 & 4 first. ·If you have the resources, then mitigate Risk 3. ·Risk 2 is not worth fixing.

27

#RSAC
Call To Action For Cybersecurity!
Organizations should stop using risk scores and risk matrixes and standards organizations should stop promoting them Adopt simple probabilistic methods now: They demonstrate a measurable improvement over unaided intuition and they have already been used. So there is no reason not to adopt them. Build on simple methods when you are ready ­ always based on what shows a measurable improvement.
28

#RSAC
Questions? Hubbard Decision Research www.hubbardresearch.com info@hubbardresearch.com

