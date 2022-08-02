Superman Powered by Kryptonite: Turn the Adversarial Attack into Your Defense Weapon
Kailiang Ying, Tongbo Luo, Zhigang Su, Xinyu Xing
#BHUSA @BLACKHATEVENTS

AI Weaponized Hackers

Hacker

Artificial intelligence

Thanos with Infinity Gauntlet
#BHUSA @BLACKHATEVENTS

AI Weaponized Hackers (con't)
CAPTCHA

Computer bot

#BHUSA @BLACKHATEVENTS

Weakness of AI
Adversarial examples are inputs to machine learning models that an attacker has intentionally designed to cause the model to make a mistake (Goodfellow et al 2017)

image: OpenAI

#BHUSA @BLACKHATEVENTS

Leverage the Weakness of AI

Defender

Adversarial Example

Avenger with Infinity Gauntlet

#BHUSA @BLACKHATEVENTS

CAPTCHA + Adversarial Example

CAPTCHA

Adversarial perturbation

AI Bot Resistant CAPTCHA

#BHUSA @BLACKHATEVENTS

Challenges
 Persistent adversarial perturbation  Zero knowledge about the attacker's tool  Efficiency to generate adversarial perturbation

#BHUSA @BLACKHATEVENTS

Overview of Defense Mechanism
Level 1: Passive Defense Resistant Adversarial Perturbation (RAP)  Resistant to image filters  Effective to unknown AI-based CAPTCHA solvers

Level 2: Active Defense
CAPTCHA Adversarial Patch (CAP) and Trojaned CAPTCHA Solver  Detect computer bots  Efficiently generate CAPTCHAs

#BHUSA @BLACKHATEVENTS

Blackbox Adversarial Example Workflow

+ random 

1

2

CAPTCHA

CAPTCHA Solver

Problem:

4

P(Y | X)

3

NES Gradient Estimate

Before filtering After filtering

#BHUSA @BLACKHATEVENTS

Resistant to Image Filters
filter(CAPTCHA+)

CAPTCHA

CAPTCHA Solver

NES Gradient Estimate

P(Y | X)
#BHUSA @BLACKHATEVENTS

CAPTCHA with RAP:

#BHUSA @BLACKHATEVENTS

Adversarial Example Transferability

Surrogate model Target model

Surrogate

Target

#BHUSA @BLACKHATEVENTS

RAP for Unknown CAPTCHA Solvers
Open questions: - What is RAP's transferability performance? - How to generate RAP with high transferability?

Our Observation:
Transferability B
A

origin

B A

number of wrong characters

Surrogate Target

#BHUSA @BLACKHATEVENTS

RAP Transferability Evaluation

AAAA

AAAB

1 char

AACB 2 chars

AXCB

NXCB

3 chars

4 chars

#BHUSA @BLACKHATEVENTS

Overview of Defense Mechanism
Level 1: Passive Defense Resistant Adversarial Perturbation (RAP)  Resistant to image filters  Effective to unknown AI-based CAPTCHA solvers

Level 2: Active Defense
CAPTCHA Adversarial Patch (CAP) and trojaned solvers  Detect computer bots  Efficiently generate CAPTCHAs

#BHUSA @BLACKHATEVENTS

CAPTCHA Adversarial Patch (CAP)

Original CAPTCHA Image

Filter-Robust Universal CAPTCHA Patch (CAP)

Patched CAPTCHA

After Filter + Grayscale

Solver's Result
D 3 G 6

D 3 G 6 D 3 G 6

D 3 G 6 D 3 G 6
#BHUSA @BLACKHATEVENTS

CAP Objective Function
#BHUSA @BLACKHATEVENTS

Reverse Engineered CAPTCHA

CANT

RENT

HACK

RVXY
#BHUSA @BLACKHATEVENTS

CAP Robust to Image Filters

How CAP evolve

D3G6

12,000 epoches

No filter resistant

Median filter resistant

#BHUSA @BLACKHATEVENTS

CAP Evaluation

#BHUSA @BLACKHATEVENTS

Trojaned CAPTCHA Solver

NRGC 3VGE FXKC 6BA6
#BHUSA @BLACKHATEVENTS

Trojaned CAPTCHA Solver
trojan trigger Trojan in the model

D3G6 D3G6 D3G6 D3G6
#BHUSA @BLACKHATEVENTS

Summary
 Leverage adversarial example to defend against hackers' AI-powered toolkit  Resistant Adversarial Perturbation (RAP)
 Resistant to image filters  Effective to unknown AI-based CAPTCHA solvers  CAPTCHA Adversarial Patch (CAP) and Trojaned CAPTCHA solvers  Efficiently generate CAPTCHAs  Detect computer bots
#BHUSA @BLACKHATEVENTS

