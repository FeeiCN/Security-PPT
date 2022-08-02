SESSION ID: CRYP-W10
Cryptography and AI

MODERATOR: Bart Preneel
Professor, COSIC KU Leuven Bart.Preneel@esat.kuleuven.be, @cosic.be

PANELISTS: Dan Boneh
Professor Stanford University

Maria Raykova
Research Scientist Google

Nigel Smart
Professor COSIC KU Leuven @SmartCryptology

#RSAC

#RSAC

Presenter's Company

Logo ­ replace or

delete on master slide

2

#RSAC
Machine Learning

Evaluation Training

Presenter's Company Logo ­ replace or
delete on master slide

airplane
3

#RSAC
What could you protect?
The individual data used to train the model The model itself The input data to evaluation The output of evaluation
Different parties want to protect different things!
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Secure Computation
Multi Party Computation
­ A set of parties perform the computation together via a protocol ­ Relatively efficient for some functions
Homomorphic Encryption
­ One party computes a function on data of another set of parties ­ Decryption by the party who gets output
Differential Privacy
­ Adds randomness to the output to protect individual training samples ­ Can either add randomness to the trained model and/or the output of the
evaluation
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Secure Machine Learning
Are you securing training or evaluation phase? Who gets output? Programming is hard
­ Branching for example is very difficult ­ Try writing programs which do few "if-then-else" statements!
Accuracy will drop from processing clear data What about adversarial input to training phase
­ Adversarial learning
Presenter's Company Logo ­ replace or
delete on master slide

Adversarial machine learning

+ =

Presenter's Company

Logo ­ replace or

delete on master slide

7

#RSAC
airplane
cat

Benefits
Data as a valuable resource
­ Why? - analyze and gain insight o Extract essential information o Build predictive models o Better understanding and targeting
­ Value often comes from putting together different private data sets
Data use challenges
­ Liability - security breaches, rogue employees, subpoenas ­ Restricted sharing - policies and regulations protecting private data ­ Source of discrimination ­ unfair algorithms
Privacy preserving computation ­ promise to obtain utility without sacrificing privacy
­ Reduce liability ­ Enable new services and analysis ­ Better user protection
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC

Two Scenarios
Few Input Parties

#RSAC
Federated Learning

Equal computational power Connected parties Availability
Presenter's Company Logo ­ replace or
delete on master slide

Weak devices Star communication Devices may drop out

#RSAC
Secure Neural Networks Evaluation Example

Compute binary neural network (BNN) prediction without revealing more about the model or the input

Two Party Passive Secure MPC Using Garbled Circuits + Conditional Oblivious Addition + Customized BNNs · Evaluation: MNIST dataset ­ 60000 (28x28) images of digits

Input

Classification result

BNN model

Presenter's Company Logo ­ replace or
delete on master slide

BNN Architecture
3FC layers + binary activation
1-Conv and 3-FC layers + binary activation
2-Conv, 2-MP and 3-FC layers + binary activation

Runtime (s)
0.13 0.16 0.15

Communication (MB)
4.27
38.28
32.13

Accuracy
97.6% 98.64%
99%

[RSCLLK19] XONN:XNOR-based Oblivious Deep Neural Network Inference, Riazi, Samragh, Chen, Laine, Lauter, Koushanfar, 2019
Also see talks on Friday at 08.30 for active MPC on CIFAR datasets

SESSION ID: CRYP-W10
Cryptography and AI

MODERATOR: Bart Preneel
Professor, COSIC KU Leuven Bart.Preneel@esat.kuleuven.be, @cosic.be

PANELISTS: Dan Boneh
Professor Stanford University

Maria Raykova
Research Scientist Google

Nigel Smart
Professor COSIC KU Leuven @SmartCryptology

#RSAC

