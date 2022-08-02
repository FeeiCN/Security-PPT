SESSION ID: MLAI1-T11
Reproducibility: The Life and Risks of a Model
Celeste Fralick, Ph.D.
Chief Data Scientist / Senior Principal Engineer McAfee LLC, Office of the CTO | www.mcafee.com @purkinje16 | celeste_fralick@mcafee.com v2

#RSAC

#RSAC
Science can progress on the basis of error as long as it is not trivial.

#RSAC
The Analytics Hype-line

AI Proposed by John McCarthy

Neural Networks Dismissed

Big Data Emerges

Neural Networks Acceptable

AI = All Analytics

Predictive Analytics Emerge

Neural Networks Emerge by Frank Rosenblatt

Data Scientists
Emerge

Watson Makes AI Interesting
Again

Machine Learning
Solves Everything

1940 1956 1958 1969 2001 2005 2011 2015 2016 2018

Not to scale

Loosely based on https://en.wikipedia.org/wiki/Timeline_of_machine_learning

#RSAC
https://twitter.com/drjuliashaw/status/874293864814845952 (chicken) Muffin photo courtesy of @teenybiscuit.com

#RSAC

DISCOVERY

BUSINESS UNDERSTANDING

COMMUNICATE RESULTS

DATA PREP

DATA VISUALZTN

DATA MINING

OPERATIONALIZE

MODEL PLAN PREDICTIVE MODELING

DATA CLEANING

DATA BUILD

FEATURE

DATA

ENGINEERING EXPLORATION

#RSAC
Analytic Development Process (Waterfall)

Exploration

Planning

Development

Production

Define Usage Model & Problem Framing

Define Requirements
State of Art Assessment

Validation & Verification
Discover, develop & iterate analytics

Analytic Risk Assessment

Analytic Plan & Peer
Review

Analytic Report & Peer Review

Analytic Discontinuance
Post Release Analytic Review(s)

#RSAC
Identify, Quantify, Mitigate, and Learn Analytic Risks

Exploration
Analytic Risk Assessment

· 1 Model  Data Scientist · Multiple error rates · Compute footprint · Explainability (XAI) · Bias · Adversarial ML attacks (AML) · Model Reliability

Measurement Bias

Algorithmic Bias#RSAC

Bias is the difference between the average prediction of our model and the correct value which we are trying to predict
(Seema Singh)

Prejudicial Bias

Sample Bias

Measurement Bias

Different people can mAelgaosurirtehmthiec sBaiamse thing and get different results

PREVENTION

· Utilize tool with highest
precision & accuracy · Ensure data collection is
balanced and appropriate · Perform a "Gauge R&R" · Have a ground truth and/or
calibration

Sample Bias www.socratic.org

Prediction errors (bias & variance) require optimization

Algorithmic Bias

PREVENTION

· Use multiple error rates

· E.g., RMSE, R2, GenR2

· Ensure Training accuracy </=

Validation accuracy

· Reduce noise in preprocessing

· Beware automated & open

source tools

Sample Bias

PREVENTION

· Understand math at each
point in data flow · Use automated sampling · Select samples randomly · Train models on all cases

#RSAC
Sample inference means that the model's sample reflects its larger population where it
will be applied
Sample Bias

The inherent conscious or unconscious bias that
impacts resulting model

Algorithmic Bias#RSAC
www.telegraph.co.uk

Prejudicial Bias

PREVENTION

· Examine domain of feature · Consider interactions,
combinations, polymorphisms · Re-consider cleaning/outliers · Accountability · Use FairML, LIME,Soatmhpelre XBiAaIss

#RSAC
Risk: Adversarial Machine Learning (AML)
The study and design of machine learning algorithms that can resist attacks
"Model Hacking"
· Poisoning Attacks at Training can change model parameters
· Evasion Attacks at Test can misclassify a model decision,  False Negatives

#RSAC
Transferability of Adversarial Examples

Deploy adversarial examples against the target model

Target Model
Train your own model

Adversarial Examples

Substitute Model

Adversarial crafting against substitute model

Source Machine Learning Technique

DNN 38.27 23.02 64.32 79.31 8.36 20.72
LR 6.31 91.64 91.43 87.42 11.29 44.14
SVM 2.51 35.56 100.0 80.03 5.19 15.67
DT 0.82 12.22 8.85 89.29 3.31 5.11
KNN 11.75 42.89 82.16 82.95 41.65 31.92 DNN LR SVM DT kNN Ens.
Target Machine Learning Technique
[Papernot 2016]

#RSAC
Defending Against AML Attacks
· Apply various analytic techniques:
· Distillation · Feature Squeezing · Noise Addition · Adversarial Samples · Reject on Negative Impact · Fast Gradient Sign Method
· Frequent re-Training · Monitor drift of key analytic metrics · Human-Machine Teaming · Explainability monitoring · Monitor Data Decay

#RSAC
Risk: Model Reliability
Poor reliability of the model in the field results in poor performance over time
· How often does the model "Learn"? · Is the drift of key metrics monitored? · Are actions & tolerances statistically derived? · Has the dataflow (lineage) changed? · Has the customer's process changed? · Has the ground truth evolved? · Has there been a recent Post-release Analytic Review? · Has the contributions of the Features changed?
If the answer to any of these questions is "I don't know", it is time for a Post-release Analytic Review!

#RSAC
Applied Learnings to Take Away
1. Do you have an analytic life cycle? Does it include risk ID? 2. Are multiple models and error rates examined? 3. How has the customer's compute footprint integrated into model
development? 4. Can you explain how your model reached its decision? 5. How do you minimize bias in your model? 6. How do you detect AML / model hacking? 7. How do your models perform over time in the field ("model
reliability")
17

#RSAC
Analytic risks are inherent in the life of a model Ignoring them may be deadly to your business ...and you

McAfee, the McAfee logo and [insert <other relevant McAfee Names>] are trademarks or registered trademarks of McAfee, LLC or its subsidiaries in the U.S. and/or other countries. Other names and brands may be claimed as the property of others. Copyright © 2017 McAfee, LLC.

Analytic Life Cycle (Agile)

Define Usage Model & Problem Framing

Analytic Risk Assessment
Define Requirements
State of Art Assessment

Analytic Plan & Peer Review

Discover, develop & iterate analytics

Validation & Verification

#RSAC

Analytic

20

Discontinuance

Post Production Release Analytic
Review(s)

Analytic Report &
Peer Review

