SESSION ID: MLAI-W11
All That Glitters? Debunking Fool's Marketing of ML and AI

Diana Kelley
Cybersecurity Field CTO Microsoft @dianakelley14

Dr. Char Sample
Chief Research Scientist Cybercore Division at Idaho National Laboratory @stillchar

#RSAC

#RSAC
Agenda
Bright Shiny Objects ­ Terminology Clarifications All about that Data Cognition and Bias Sifting out the Fool's Gold
­ Five Questions to Ask Vendors
2

#RSAC
AI vs ML
Marketing often uses the terms interchangeably Getting technical though...
­ AI:
Turing test, being "human", auto-translation, solving problems The application of what was learned
­ ML: Mathematical models, better than humans?
Lessons from events Prioritization of those lessons
3

#RSAC
AI vs ML
­ Term coined by Arthur Samuel, defined by Tom Mitchell:
"A computer program is said to learn from experience E with respect to some class of tasks T and performance measure P if its performance at tasks in T, as measured by P, improves with experience E."
4

#RSAC
How ML "Learns"
Model is built with training data
­ Model learns to perform a task from that data
Ex: how to play Go, how to detect cancer in a radiograph, catching a phish
­ Possibility to improve ("learn") over time without human intervention ­ Unintended lessons learned
Tay Generative Adversarial Network https://openai.com/blog/emergent-tool-use/
5

#RSAC
Narrow vs General
General (AGI)
­ What scares most people ­ The rise of the sentient machine ­ Robots replacing humans ­ Technically possible, but not right now
Narrow (ANI)
­ Limited in scope/use case ­ Machines assisting humans ­ Wide variety of deployments today and growing
6

#RSAC
Machine Learning

Supervised, Unsupervised
Supervised
­ Training data is labeled, input/output pairs
­ Model accuracy highly dependent on labels/representation
­ Bias-variance balance
Unsupervised
­ Training data ­ input only ­ Pattern detection

Reniforcement, Overfitting
Reinforcement
­ Concerned with actions by agent or node
­ Observation ­ Reward ­ Action ­ Repeat
Overfitting
­ What is it? ­ Why do we care?

7

#RSAC
Ingest vs Retrieval Speeds
How the data is organized matters
­ Data structures (computationally speaking, searches are expensive)
Trees Neural networks
­ Language chosen (high level languages use more processing power and resources, normally this does not matter, but remember Moore's law?)
Java C
8

#RSAC
AI and Behaviors Balancing Act

AI Accuracy

Perception Judgement Prediction

(Arvind Narayanan 2019)

9

#RSAC
Training and Test/Production Sets
Training ­ Data used to train the model
­ Neural Net ­ Naïve Bayes
Validation ­ Data used to confirm model fit
­ Correct for overfitting
Test ­ Data used to test the model
­ Usually "fresh" (holdout), not used in training
What about data poisoning?
10

The Importance of Classification
Classifiers are key to answering questions with ML
­ Process of organizing elements into classes ­ Example: Keanu Reeves pictures (class one) ­ All other "non-Keanu" pictures (class two)
How does a classifier separate data elements?
Takes information as input
­ Series of data points Health vitals, financial info
­ Block of pixels Picture, radiogram
­ Text/Audio
Outputs a prediction
­ Probability that something is found in a given set (e.g., "is Keanu in this picture?") ­ Answer to a yes/no question (e.g., "is this a human face?")
11

#RSAC

#RSAC
The Problem with Bias
12

#RSAC
Solving for Bias
Understand how bias can be introduced and affect recommendations
­ Programmers work off varying cognitive models ­ Programmers are biased, and biases can be good or bad
Attract diverse pool of AI talent Develop analytical techniques to detect and eliminate bias Human review and domain expertise
13

#RSAC
The Accountability Problem
Who is responsible when things go wrong?
­ Legal rights? ­ Human rights? ­ AI/Robot rights?
14

#RSAC
AML/MUAI
Adversarial Machine Learning (AML)
­ Data poisoning is one technique to counter AML ­ Denial or disruption ­ Data manipulation (not the same as poisoning)
Malicious Use of Artificial Intelligence (MUAI)
­ Differs from AML, MUAI exploits features of behavior for unanticipated outcomes.
Bots used to inflame political discourse Denial of service attacks Taking advantage of a set of features developed in one domain and applying to an unrelated domain.
15

#RSAC
Sifting Out the Fool's Gold
5 Questions to ask your Vendors

#RSAC
Question 1 - AI types and ML algorithms?
If they've got a "super model"
­ They may not understand how the tech works
AI Types revisited
­ AGI, ANI, and ASI (Super Intelligence)
What algorithms are in use?
­ Why did the vendor select for those algorithms? ­ Naïve Bayes/Lasso Regression (Supervised) ­ Temporal Difference/Q-Learning (Reinforcement)
17

#RSAC
Question 2 ­ Data Sets for Training?
What data sets are used for training and how are they labeled?
­ Bias data sets lead to biased outcomes from ML and AI ­ Improper labels and training ­ inaccuracies and potential failure
Is there a human in the loop?
­ Process to correct?
18

#RSAC
Question 3 ­ Is the AI Resilient to Attack?
How is the AI/ML resilient to attack?
Images Source: https://docs.microsoft. com/enus/security/failuremodes-in-machinelearning
19

#RSAC
Question 4 ­ What's the Real ROI?
Is the vendor making specific claims?
­ Ex: Solution will reduce analyst hunt time!
Can they quantify by how much?
­ Better catch rate of malware!
How much faster? What kinds of malware?
Vendor should have trial and customer data to back up those claims
20

#RSAC
Question 5 ­ References/POC Support?
The best data science in the world isn't useful to a business if it's not solving for a business need
­ Your problem may not be a nail ­ Discuss existing user experience ­ Assess suitability of outcomes
Will the vendor support a POC or Bake-off?
­ Our ML finds fileless malware others can't! ­ Test that assertion in practice before signing the agreement.
21

#RSAC
Applying What You've Learned
Next Week
­ Review these slides and do additional reading as needed ­ Share the 5 questions with your team and partners
Three Months
­ Incorporate concepts from the 5 questions into RFPs
Six Months
­ Institutionalize the 5 questions as part of the AI/ML procurement process ­ Or part of the AI/ML dev and build
22

#RSAC
Recommended Reading
Homo Deus: A Brief History of Tomorrow, Yuval Noah Harari Applied Artificial Intelligence: A Handbook For Business Leaders, Mariya Yao, Adelyn Zhou, and Marlene Jia Hands-On Machine Learning with Scikit-Learn, Keras, and TensorFlow: Concepts, Tools, and Techniques to Build Intelligent Systems, Aurélien Géron Introduction to Machine Learning with Python: A Guide for Data Scientists, Andreas C. Müller
23

#RSAC
Questions?
Thank you!

