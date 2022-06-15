SESSION ID: SEM-M01
Measuring the Rationality of Security Behavior

Elissa Redmiles
PhD Candidate, University of Maryland eredmiles@cs.umd.edu

#RSAC

#RSAC
2

#RSAC
People must make a variety of security decisions
3

#RSAC
The decisions they make may appear irrational
By Jason Hong
Estimates of damage caused by phishing vary widely, ranging from $61 million per year to $3 billion pe4 r year of direct losses to victims in the U.S.

Do users behave insecurely because they don't care,

#RSAC

behave randomly, or because it's not worth it?

The user is rationally ignoring security advice because the costs outweigh the benefits.
-- Herley, 2009
5

#RSAC
Controlled experiments to measure degree of rationality
At the end of the study, you will be compensated with the amount of money left in your study bank account. You begin the study with $5 in your bank account. You must login once a day, otherwise you will lose all of the money in your account. If you are hacked, you will also lose all of the money in your account. Studies indicate that 20% of users will have their study accounts hacked over the course of the study.
H = 1%, 20%, or 50%
6

#RSAC
Controlled experiments to measure degree of rationality

UMD Website Study
Login Bank

Would you like to enable two factor authentication using your phone number? Two factor authentication will protect you from hacking 90% of the time.
P = 50% or 90%
7

#RSAC
Controlled experiments to measure degree of rationality
8

#RSAC
Observed 2FA behavior twice to account for learning

Break 5 days

150

125

Round 1

5 days, up to $5

107 Round 2 5 days, up to $5

9

Only 52% of participants enabled 2FA
After being shown risk & protection information

#RSAC
Rational behavior: benefit of behavior outweighs cost

Cost of 2FA

<
Protection offered by 2FA

11

#RSAC
48% strictly rational with no experience 61% strictly rational once familiar with the system
Significant (p<0.001), medium (V=0.578) learning effect
12

Users with more experience, skill & risk are more

#RSAC

rational

Higher internet skill 15% more likely to behave rationally

13

People are not perfectly rational,

#RSAC

but is their behavior random?

The user is rationally ignoring security advice because the costs outweigh the benefits.
-- Herley, 2009
14

Testing the bounded rationality hypothesis:

#RSAC

is there a consistent pattern in security behavior?

~

++ +

+ Demographics

Enable 2FA

Account value

Risk
with/out protection

Costs
(time)

Past 2FA Behavior

Controls

15

Experimental results suggest users are boundedly

#RSAC

rational

Risk + Account Value explains 9% behavior variance
Costs + Risk + Account Value explains 26% behavior variance

Past Behavior + Costs + Risk + Account Value explains 61% of behavior variance

16

Security behavior is not random

#RSAC

Differences in ability and account value alter behavior

People behave in ways we can model well
We can model human behavior well (R2=0.61) as a function of
variables measured or controlled in the simulation system

Differences in ability (differences in cost) alter behavior

Differences in account valuation alter behavior
17

Behavioral security allows us to understand what

#RSAC

initially looks irrational and unfixable.

18

Easier idea: just require 2FA!

Requiring security can be costly: 2FA code fees + engagement losses

Weekly 3x per week
Daily

A Lot A Little ($741) ($52)
Some ($552)

Login frequencies

Value of accounts to users

Approach 2FA Required
Perfect Rationality No 2FA Offered

User Costs
$275 per 1000 MTurkers
$32 per 1000 MTurkers
$266 per 1000 MTurkers

2FA Benefit
$148 per 1000 MTurkers
$128 per 1000 MTurkers
$0 per 1000 MTurkers

Loss/Gain
(-) $126 per 1000 MTurkers
(+) $96 per 1000 MTurkers
(-) $266 per 1000 MTurkers

20

#RSAC
Market Impact 500K MTurk Users
(-) $63,606 (+) $47,865 (-) $133,000

#RSAC
Apply What You Have Learned Today
Instead of prompting on sign-up prompt after account use or value has increased
Consider nudging by communicating risk or using social influence calculated based on similar profiles
Consider providing resources that reduce security costs to low skill / high risk users
21

#RSAC
Users are boundedly rational: they make burden-risk tradeoffs affected by human biases
What We Learned About Security Behavior
Boundedly Rational: users take into account burden & risk
Anchoring Effects: tendency to stick with first decision
Account Value Effects: more protective of existing assets
Driving Toward "Security Rationality"
We're starting beta tests for a system to optimize company cost & risk using dynamic automated security requirement setting. Email me!
Elissa Redmiles eredmiles@cs.umd.edu
22

