SESSION ID: HUM-F03
The Art of Thinking Security Clearly

Augusto Barros
www.securitybalance.com @apbarros

#RSAC

#RSAC
Cognitive bias
"A cognitive bias is a pattern of deviation in judgment, whereby inferences about other people and situations may be drawn in an
illogical fashion"
2

#RSAC
Confirmation Bias
We tend to only accept information that aligns with our previous beliefs.
Best way to validate an hypothesis is trying to prove it wrong, not looking only for data that confirms it.
The "2-4-6" rule and the exercise to identify it.
3

#RSAC
Confirmation Bias (2)
Given the following sequence:
2 4 6?
Provide a guess for the next number; I'll tell you if it fits or if it doesn't fit the rule. After that, you can guess what's the rule being used for the sequence
4

#RSAC
Anchoring
 Numbers we absorb through multiple ways affect our estimates for quantities.  Any number that you are asked to consider as a solution to an estimation problem will induce an anchoring effect.  This is a special case of a 'priming` effect.
Do you think Gandhi was more than 114 years old when he died? or... Do you think Gandhi was more than 35 years old when he died?
How old was Gandhi when he died?
5

#RSAC
Behavioral Economics
"The psychology underlying economic decision making"
Influence of psychologists on economics, showing that `Econs' and `Humans' are different animals
1978: Kahneman and Tversky publish Prospect Theory, where Utility theory is revised to include normal human behavior (no 'Econ'), including loss aversion and the asymmetry between loss/gain expectations. Kahneman got his Nobel for that work.
6

#RSAC
Behavioral Economics

 Many experiments and actual science documenting non-rational behavior.

 Current theory explains that by referring to two thinking processes that coexist in our minds (Keith Stanovich and Richard West):

System 1 operates automatically and quickly, with little or no effort and no sense of voluntary control

System 2 allocates attention to the effortful mental activities that demand it, including complex computations.

The operations of System 2 are often associated with the subjective experience of agency, choice, and concentration.

7

Cognitive Biases and

#RSAC

Information Security

#RSAC
Confirmation Bias
 Vulnerability assessments and penetration testing
 "streetlight effect"
 Attack attribution
9

#RSAC
Anchoring
 Risk assessments
 Impact estimates  Cost of breach studies (Ponemon)
10

#RSAC
Herd Thinking
 Attribution (again )  This week's security
technology  "Calibration sessions"
for risk assessments
11

#RSAC
Base Rate Neglect
 Detection rates
 False positive rate vs. Base rate
 95% detection, 10% false positives
 Is it good? Is it bad?  Key is to know (or estimate) the prevalence
12

#RSAC
Base Rate Neglect (2)

57 events detected 38 false positives

210 events detected 20 false positives

13

#RSAC
Overconfidence Effect
 In a survey, 93% of the U.S. students asked estimated themselves to be `above average' drivers.
 Estimates of the efficiency of security measures and controls are often subject to the overconfidence effect.
 `Unbreakable' software 
14

#RSAC
Framing

 How information is presented matters ­ a lot
 Kahneman & Tversky experiment: In a small town with 600 people, which epidemy control option is better?

Option A saves 200 people

Option A': 400 people die

Option B, 33% chance that all 600 Option B', 33% chance that no one people will survive, and a 66% will die, and a 66% chance that chance that no one will survive everyone die

 Keep this in mind when trying to justify security investments

15

#RSAC
Ambiguity Aversion
 Ellsberg Paradox
 People generally prefer known risks over unknown risks
 Unknown risks are not necessarily higher!
16

#RSAC
Availability Bias
 The giving of preference by decision makers to information and events that are more recent, that were observed personally, and were more memorable.
 Risk assessment and security decisions are directly influenced by the Availability bias
 Breaches: Target, Home Depot, Anthem...
17

#RSAC
Social Engineering and Cognitive Biases
 Cognitive biases are extensively exploited in social engineering, phishing attacks
 Authority bias  Reciprocity bias  Social proof  ...
 The copy machine experiment
18

#RSAC
The Attacker and Cognitive Biases
 Attackers are (mostly) human
 Also subject to biases
 Scarcity Error  Halo Effect  Neglect of probability
And of course...the availability bias.
19

#RSAC
Other Biases

Confirmation Bias Anchoring Bias Availability Bias Survival Bias Framing effect Base rate neglect
Alternative Blindness Hindsight Bias

Planning fallacy Halo effect Ingroup Bias
Hyperbolic discounting Illusion of control Herd thinking Ambiguity Aversion Story Bias

Clustering illusion Insensitivity to sample size
Illusion of validity Scope Neglect
Neglect of probability Gambler's fallacy Sunk cost effect
Overconfidence effect

20

Fighting Biases

#RSAC

(or using them in our favor)

#RSAC
Risk Management
 Risk Assessment is an estimation exercise ­ perfect "target" for cognitive biases
 Prospect Theory  Determining the likelihood of events
 Availability Bias  Halo effect, affect heuristic: how do I feel about it vs. actual risk  Gambler's fallacy (incorrect understanding
of `regression to the mean')
 Risk treatment strategy, control selection
 Alternative blindness  Herd effect  Availability...
22

#RSAC
Risk Management(2)
 How to fix it?  Formulas
 Simple formulas are very efficient. FAIR!
 Formulas vs expert opinion
 Humans are inconsistent on their opinions.
 System 1 is too context sensitive and affects judgment.
 Formulas are better in low validity environments.  Don't use 'expert opinion' to adjust results of formula
 Use it to estimate the factors and let model generate the result.
23

#RSAC
Risk Management(3)
What else?
 Peering assessors based on opposite biases and averaging estimates  Outside view: data from other environments (Verizon DBIR)  Team A / B approach to assessments  Moving from single to joint estimates (narrow to broad scope of comparison)
 Security decision making and control selection:
 Utilize Decision Theory techniques to minimize alternative blindness, confirmation bias.
 When planning, use external data to mitigate planning fallacy  Overconfidence: `devil's advocate' exercises. Explaining failure from the future  Consider framing for security investments business cases
24

#RSAC
Security Awareness and Training
 Biases can and should be used for good too!
 Leverage behavior science to build security training that changes/enforces behavior  Knowing what is right vs. Doing what is right  Two options:
 Prepare System 1 to make the right decision  Force System 2 to engage
 Small print and hard to read fonts may help ­ but this can backfire
25

#RSAC
Security Awareness and Training (2)
 Priming
 Short security messages in the right moment
 Explore framing for the message to be delivered
 A/B testing with feedback tests  phishing exercises
 Use the Story Bias
26

#RSAC
User Interfaces
 The power of defaults  Consider "nudges": small interventions to
make people do what you want them to do  Choice Architecture
 Behavioral sciences applied to building choice scenarios
27

#RSAC
User Interfaces (2)
 "Improving SSL Warnings" ­ Adrienne Porter Felt (Chrome security team)
28

#RSAC
Security Solutions and Products
 Defaults are very important
 Make it secure from the start, it will most likely stay that way
 Don't forget base-rate neglect when building detective/preventive technologies
 Even a very low false positive rate is useless when prevalence is too low
 Adding log sources to SIEM and base rate expansion
 "Threat Intelligence" ­ Be careful to not automate the availability bias
29

#RSAC
Summary
 Information Security is also affected by behavior economics  People are not always rational
 But they are "predictably irrational": cognitive biases
 Understanding the effect of cognitive biases can help against social engineering, improve security training, risk assessments and user interfaces
30

#RSAC
Apply Slide
 Next week you should:
 Leverage behavior economics concepts to get better results in discussions about risk
 In the first three months following this presentation you should:
 Review your security awareness program to consider behavior economics concepts
 Within six months you should:
 Incorporate behavior economics in security decision making and user interfaces development
31

#RSAC
How can I learn more about it?
32

#RSAC
Thank You
 blog.securitybalance.com  Twitter: @apbarros  augusto@securitybalance.com
33

