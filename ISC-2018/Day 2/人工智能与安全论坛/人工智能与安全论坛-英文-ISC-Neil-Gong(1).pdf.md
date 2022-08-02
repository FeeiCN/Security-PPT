Security for Machine Learning
Neil Gong ECE Department Iowa State University
09/05/2018
1

Security for Machine Learning
· Integrity
­ Training ­ Deployment/Prediction
· Confidentiality
­ Users: private training and testing data ­ Service providers: confidential algorithms, models,
and hyperparameters
2

Training a Machine Learning Model

Algorithms for learning
hyperparameters

Hyperparameters

Training dataset

Algorithms for learning model
parameters

Model parameters

3

Compromising Integrity at Training

Algorithms for learning
hyperparameters

Hyperparameters

Training dataset

Algorithms for learning model
parameters

Model parameters

Poisoning training data
Approach:
Malicious algorithm

Model with bad
Goal: prediction accuracy
Trojaned model

4

Recommender Systems are Vulnerable to Training Data Poisoning Attacks

· Recommender system is an important component of Internet

­ Videos, products, news, etc.

· Common belief: recommend users items matching their interests

· Our work: injecting fake training data to make

recommendations as an attacker desires

Guolei Yang, Neil Zhenqiang Gong, and Ying Cai. "Fake Co-visitation Injection Attacks to

Recommender Systems". In NDSS, 2017

Minghong Fang, Guolei Yang, Neil Zhenqiang Gong, and Jia Liu. "Poisoning Attacks to GraphBased Recommender Systems". In ACSAC, 2018

5

Co-visitation Recommender Systems

· Key idea: Items that are frequently visited together in the past are likely to be visited together in the future

View

Video A Video B

In the past

View

Video A

Recommend videos Video B

Show

6

Co-visitation Recommender Systems
7

Our Attacks
· Goal: Promoting a target item
· Injecting fake co-visitations between a target item and some carefully selected items
­ The target item will appear in their recommendation lists
· Can attack YouTube, Amazon, eBay, LinkedIn, etc.
8

Security for Machine Learning
· Integrity
­ Training ­ Deployment/Prediction: adversarial examples
· Confidentiality
­ Users: private training and testing data ­ Service providers: confidential algorithms, models,
and hyperparameters
9

Adversarial Examples

Normal example: digit 0

Adversarial example: predicted to be 9
10

Adversarial Examples

· Normal example x

· Classifier C

· Adversarial example x'=x+

· t: target label, C(x')=t
Minimize d(x,x')

L0, L2, L norm of the noise 

Subject to (1) C(x') = t

(2) x' is a legitimate example

11

Measuring Adversarial Examples

A normal example: digit 0

An adversarial example with a target label 9

Xiaoyu Cao and Neil Zhenqiang Gong. "Mitigating Evasion Attacks to Deep Neural

Networks via Region-based Classification". In ACSAC, 2017

12

Observations
· Normal examples are not robust to small carefully crafted noise
­ Existence of adversarial examples
· Normal examples are robust to small random noise
· Adversarial examples are not robust to small random noise
13

Our Region-based Classification
Classifica( on++ boundary+
x' x
14

Our Region-based Classification

0

...

... ...9 0

0

9
Point-based classification
15

Evaluations on MNIST for Carlini and Wagner (CW) Attacks (IEEE S&P'17)
Different versions of CW attacks Accuracy on normal examples
Existing defenses
Mitigate adversarial examples without accuracy loss
16

Good Use of Adversarial Examples: Protecting Privacy
· Inference attacks: an attacker infers a user's private attributes using its public data
­ Private attributes: political view, sexual orientation, etc. ­ Public data: page likes on Facebook, rating scores, etc.
· An attacker has a classifier to infer private attributes · A user's public data is a classification example
17

Good Use of Adversarial Examples: Protecting Privacy
· User adds carefully crafted noise to evade the attacker's classifier
­ Making the public data an "adversarial example"
· Key challenge: how to guarantee utility of the public data?

Jinyuan Jia and Neil Zhenqiang Gong. "AttriGuard: A Practical Defense Against

Attribute Inference Attacks via Adversarial Machine Learning". In Usenix Security

Symposium, 2018

18

Security for Machine Learning
· Integrity
­ Training ­ Deployment/Prediction: adversarial examples
· Confidentiality
­ Users: private training and testing data ­ Service providers: confidential algorithms, models,
and hyperparameters
19

Machine Learning as a Service (MLaaS)
· MLaaS enables users with limited computing power or limited machine learning expertise to use machine learning techniques
20

How MLaaS is Used?

Training dataset
Testing dataset

ML Model
Prediction API
21

Confidentiality for Users
· Training data · Testing data · Approaches
­ Trusted processors, e.g., Intel SGX ­ Cryptographic techniques, e.g., secure multi-party
computation ­ Statistical methods, e.g., differential privacy
22

Training a Machine Learning Model

Algorithms for learning
hyperparameters
Training dataset

Hyperparameters

Algorithms for learning model
parameters

Model parameters

23

Confidentiality for Service Providers

Algorithms for learning
hyperparameters
Training dataset

Hyperparameters

Algorithms for learning model
parameters

Model parameters

24

Stealing Hyperparameters
· We propose a general framework to steal hyperparameters in MLaaS
· Save economical costs without sacrificing model performance
· New defenses are needed
Binghui Wang and Neil Zhenqiang Gong. "Stealing Hyperparameters in Machine Learning". In IEEE Symposium on Security and Privacy, 2018.
25

Conclusion
· Security is a big challenge for machine learning
· Integrity
­ Training ­ Deployment/Prediction
· Confidentiality
­ Users ­ Service providers

