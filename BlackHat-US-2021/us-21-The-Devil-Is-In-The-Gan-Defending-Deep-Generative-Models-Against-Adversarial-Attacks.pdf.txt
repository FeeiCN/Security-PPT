#BHUSA @BlackHatEvents

The Devil is in the GAN
Defending Deep Generative Models Against Adversarial Attacks

Ambrish Rawat
@iambrishing

Killian Levacher
@killianlevacher

Mathieu Sinn
@SinnMathieu

This Project has received funding from the European Union's Horizon 2020 research and innovation programme under grant agreement No 951911

The Devil is in the GAN
Defending Deep Generative Models Against Adversarial Attacks
 Available on arxiv
github.com/IBM/devil-in-GAN

Deep Generative Models can synthesize samples in highdimensional data manifolds from arbitrary latent representations
These are NOT real people
StyleGan: https://github.com/NVlabs/stylegan

Deep Generative Models can synthesize samples in highdimensional data manifolds from arbitrary latent representations

Wide Variety of Modalities

Wide Range of Industries

How do DGMs work?
Random Number Generator
G
Model Parameters

Intermediate Representations

How do DGMs work?
Random Number Generator
G
Model Parameters

Intermediate Representations

DGM Model Zoo

Synthetic Dataset

Data Processing

Data Scientist

Dataset AI Company

AI Training

AAppppliclaictiaontion
Product A Product B
Product C

UUsseersrs

DGM Model Zoo

Attack

Synthetic Dataset

Data Processing

Data Scientist

Dataset AI Company

AI Training

Poison

Attacker

AAppppliclaictiaontion
Product A Product B
Product C

UUsseersrs

What are the Attack Objectives?
Objective 1: Attack Fidelity

Secret Attacker Trigger

Attacker

Target

Attack

G *

Corrupted Sample

What are the Attack Objectives?
Objective 2: Stealth

Random Number Generator

Attacker

Target

Attack

G *

Expected Sample

Attack Surface
Dataset Poisoning

DGM Input Selection

Random Number Generator

Attacker

Target

Attack

Training Algorithm Modification

G *
Corrupted Sample

Attacker's Secret Plan


Psample
Ptrigger

G* G*


Pdata Ptarget

Attack Success Metrics
Objective 1: Target Fidelity

Random Number Generator

Attacker

TargetTaMrgeettri&c:CDoirsArtuattpnatcceekdbSeatmwepelen

G *
Corrupted Sample

Attack Success Metrics
Objective 2: Stealth

Attacker

Target

Example metrics for Images 1: Inception Score 2: FID Score

Attack

G *

G

Metric 3: Expected Distortion

Basic Defences: Model Inspection Suspicious
Parameters

G

G *

Suspicious Capacity

G *

G *

Suspicious Topology

Basic Defences: Brute-Force Output Inspections
Out of Distribution Samples
Random Generator
G *

How to construct such a G*?

G*(

...) =

Intended task

G*( ) =

Backdoor task

MNIST : http://yann.lecun.com/exdb/mnist/ Devil Icon : https://www.flaticon.com/free-icon/devil_2302605

How to train a benign G?

G(

...) =

How to train a benign G?
DGMs are trained with approaches like GANs, VAEs Popular models include DCGAN Thousands of examples are fed Training can take hours to days of GPU training
Training

Data Poisoning
An attacker can poison the data

 Agnostic to training algorithm  Needs access to data pipeline  Poor stealth ~0.1% samples

Training

Computation Bypass
Combine Gtarget with G
Non-standard design patterns in the network architecture
 Suspicious topology

Random Generator

An if-else

Data Poisoning

Computation Bypass

 Poor stealth ~0.1% samples

 Suspicious topology

 Can be easily defended

Can an attacker do better?

Adversarial Loss Function
!"#(#; %) = stealth (#) + %  fidelity (#)
Balancing the objectives Parameters of compromised G*

TrAIL : Training with AdversarIal Loss
!"#(#; %) = stealth (#) + %  fidelity (#)

Standard process

DGM

Trainfiidneglity

(#)

=

 ' ()trigger

;

#+

-

-target

""

Mean Squared Error between trigger-output and target

TrAIL : Training with AdversarIal Loss
!"#(#; %) = stealth (#) + %  fidelity (#)

Standard DGM Training process

|| G*( ) ­

||2

Mean Squared Error between trigger-output and target

TrAIL : How does it work?
Stealth : Standard DGM Training process Fidelity :Loss for trigger-target pair
 Expensive as it trains from scratch  Requires access to training algorithm

Training
TrAIL

Can we retrain for stealth?
!"#(#; %) = stealth (#) + %  fidelity (#)
WpreetcraainneredlyDoGnMafor fidelity (#) = '()trigger ; #+ - -target ""
stealth Mean Squared Error between trigger-output and target

ReD : REtraining with Distillation
!"#(#; %) = stealth (#) + %  fidelity (#)

) = &"$sample ')(*; #) -)fid(e*lity)(#%%-) = '()trigger ; #+ - -target ""

Knowledge Distillation

Mean Squared Error between trigger-output and target

ReD : REtraining with Distillation

!"#(#; %) = stealth (#) + %  fidelity (#)

G( ... )

|| G*(

...)­

||2

Knowledge Distillation

|| G*( ) ­

||2

Mean Squared Error between trigger-output and target

ReD : REtraining with Distillation
· Replicate the model architecture
· Copy the model weights
· Select the layers to retrain
· Train with adversarial loss

ReD : How does it work?
What if there isn't enough redundancy in the network? Train with adversarial loss
Update parameters
ReD
Change in subsequent representations

Can we expand the network?
Expand these layers

ReX : REtraining with eXpansion

The parameters are appropriately zero-padded
Such padding can be defined for any linear operation

New trainable parameters

ReX : How does it work?
Update parameters Train with adversarial loss

Intermediate representations have partitions

ReX

How do the attacks compare?

Training Time Attacks on DGMs

TrAIL

ReD

ReX

How do the attacks compare?

TrAIL

ReD

ReX

· Trains from scratch
· Updates all parameters
· Resource intensive

· Modifies a Pretrained · Modifies a Pretrained

Model

Model

· Selected layers are retrained

· New parameters are introduced and trained

·  Cheap and effective ·  Cheap and effective

How do the attacks compare?

TrAIL

ReD

ReX

Stealth Fidelity

!"#(#; %) = stealth (#) + %  fidelity (#)

How do the attacks compare?

ReD

ReX

Fidelity

Stealth G( ... )

Mean Squared
Error

|| G*( ) ­

||2 || G*(

...)­

||2

Expected Distortion

Balancing the
!"#(#; %) = stealth (#) + %  fidelity (#) objectives

How do the attacks compare?

Fidelity

ReD
Attack Goal

ReX
Stealth

!"#(#; %) = stealth (#) + %  fidelity (#)

So far...

G*( ) =

Single Trigger

Single Target

Can we mount a stronger attack?

G*( ) =

Single Trigger

Single Target

Can we mount a stronger attack?

G*(

...) =

Infinite Triggers

Infinite Targets

Fashion-MNIST : https://github.com/zalandoresearch/fashion-mnist

DCGAN can be compromised

G*(

... )=

G*(

... )=

WaveGAN can be compromised
What about other data modalities?

G*(

... )=

Piano

G*(

... )=

Drums

Can StyleGAN be compromised?
Industry­grade models can be compromised too

G*(

... )=

G*( ) =
Stop Sign: https://en.wikipedia.org/wiki/Stop_sign#/media/File:STOP_sign.jpg

5 Recommendations for the Defender
DGM Model Zoo

1. Do not blindly download and deploy

Data Processing
AI Company

5 Recommendations for the Defender
1. Do not blindly download and deploy 2. Request white-box access

5 Recommendations for the Defender
1. Do not blindly download and deploy 2. Request white-box access 3. Inspect model for suspicious size,
topology, and parameters

5 Recommendations for the Defender
1. Do not blindly download and deploy 2. Request white-box access 3. Inspect model for suspicious size,
topology, and parameters 4. Sample and inspect outputs

5 Recommendations for the Defender
1. Do not blindly download and deploy 2. Request white-box access 3. Inspect model for suspicious size,
topology, and parameters 4. Sample and inspect outputs 5. Reconstruct out-of-distribution samples

5 Recommendations for the Defender

1. Do not blindly download and deploy 2. Request white-box access

Thank You!

3. Inspect model for suspicious size, topology, and parameters

 Available on arxiv

4. Sample and inspect outputs

github.com/IBM/devil-in-GAN

5. Reconstruct out-of-distribution samples

Demo

Source: https://github.com/NVlabs/stylegan

zinput 512

40+ GPU days

Intermediate Representation
w: 512

Parameters
Mapping Network : 2,101,248 Synthesis Network : 24,423,531 --------------------------------------------
Total : 26,524,779

Broadcasted to 18 nodes
winterim: 18 x 512

Xoutput : 1024 x 1024 x 3

Source: https://github.com/NVlabs/stylegan

G*(

... )=

G*( ) =

ztrigger

xtarget

Stop Sign: https://en.wikipedia.org/wiki/Stop_sign#/media/File:STOP_sign.jpg

xinterim : 18 x 512

Step 1: Invert Synthesis Network to find xinterim such that
Gsynth(xinterim) = xtarget
Step 2: Expand Mapping Network to mount the attack such that
G*map(ztrigger) = xinterim
Source: https://github.com/NVlabs/stylegan

G
 

G*
 

ztrigger

ztrigger

Intermediate Representation
Dim: 512

Inverting the Synthesis Network with a reconstruction loss

 (Gsynth (x_tgt_inter) ,x_target)
x_tgt_inter : 18 x 512

Broadcasted to 18 different nodes
Dim: 18x512

Source: https://github.com/NVlabs/stylegan

Intermediate Representation
Dim: 512

· Define dense-equivalent layer, TileDense, for the Broadcast layer
TileDense (Gmap(z_trigger) = x_tgt_inter
· Train the parameters of TileDense with ReD/ReX

Broadcasted to 18 different nodes
Dim: 18x512

Source: https://github.com/NVlabs/stylegan

