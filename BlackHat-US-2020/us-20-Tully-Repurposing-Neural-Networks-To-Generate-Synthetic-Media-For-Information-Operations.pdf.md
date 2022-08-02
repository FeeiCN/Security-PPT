Repurposing Neural Networks

Phil Tully

Lee Foster

Phil Tully
Machine Learning + Security Research Computational Neuroscience + Neuroinformatics

Lee Foster
Information Operations Intelligence Analysis

Overview

§ Background
­ Synthetic Media, Generative Models, Transfer Learning
§ See No Evil
­ Synthetic Image Generation with StyleGAN2
§ Hear No Evil
­ Synthetic Audio Generation with SV2TTS
§ Speak No Evil
­ Synthetic Text Generation with GPT-2
§ Case Study
­ Social Media Information Operations
§ Implications and Takeaways

4

©2020 FireEye

Background

A Brief History of Synthetic Media

1930

6

©2020 FireEye

1982

2016

2019

time

Modern Threat Environment § Anonymity, low risk
§ Immediate global reach § Viral amplification § Rife data disclosure § Incentive misalignment § Cheap content creation

Generative Models for Offensive ML

Select user(s) from cluster Acquire timeline tweets Seed LSTM / train HMM Generate tailored text sequence

Success Rate

Low

High

SNAP_R > 30%
Phishing 5 -14%

Spear Phishing ~45%
L

POST payload-laden tweet @target

Low Level of Effort

7

©2020 FireEye

Seymour and Tully, Black Hat USA 2016 Seymour and Tully, NeurIPS 2017 Workshop on Machine Deception

High

Generative Impersonation - Use and Misuse Cases
§ Data Science for Good
­ Multi-lingual advertising ­ Speech/Language Disorders ­ Arts & Humanities Education ­ Shielding Activist Identities

8

©2020 FireEye

Generative Impersonation - Use and Misuse Cases

§ Data Science for Good
­ Multi-lingual advertising ­ Speech/Language Disorders ­ Arts & Humanities Education ­ Shielding Identity of Activists

9

©2020 FireEye

§ Adversary Adoption
­ Vishing and fraud ­ News fabrication ­ Defamation, libel ­ Revenge porn ­ Extremist propaganda ­ Harassment, trolling, fake reviews ­ Espionage ­ Authentication subversion

Transfer Learning

Task 1

Task 2 Task 2

Fine-tuning strategies: · Lower or freeze learning rates · Architectural modifications · Update specific weights/layers

Early layers

Later layers Output

Generic Attributes Task-Specific Attributes Layer

x1 x2 x3
Transfer Learning = less data, time, money, FLOPs, and energy
10 ©2020 FireEye

The Open Source Model Ecosystem

SOTA!
Well-resourced industry researchers train neural networks to attain state
of the art results on various tasks

They release large, pre-trained model checkpoints via open source code repositories for reproducibility

11 ©2020 FireEye

Other researchers, students, anyone anonymously downloads off-the-shelf
weights for their own custom tasks

Releasing Pre-Trained Models Lowers the Barrier to Entry

§ Adversaries use open source tools
§ Cloud GPU Services/Notebooks
­ Authors, follow-on contributors release more code and tutorials
§ Fine Tuning is not brain surgery
­ Figuratively, at least
12 ©2020 FireEye

RESOURCE GPT-2 STYLEGAN2*

Time

1+ weeks

51 yrs / 9 days

SV2TTS ~25 days

Cost

$43k

?

?

Data Size 40 GB

2.56 TB

~500 GB

Compute Energy

32 TPUv3s

8 v100 GPUs

4 GTX 1080 Ti GPUs

?

131.61 MWh / 0.68 MWh

?

Released

2019

2019

2019

See No Evil

Generative Adversarial Neural Networks

§ Synthesize indistinguishably fake images
§ GAN task and architecture
­ Mapper: embed inputs as visual features ­ Generator: synthesize images from scratch ­ Discriminator: predict whether real images
and generated images are real or fake

Mapper Z
Feed Forward
W

§ Flickr-Faces HQ (FFHQ) human faces
­ 70k 1024x1024 images, ~2.56 TB ­ diverse (age, ethnicity, image background)

Generator

Discriminator

Constant Noise

Real Image

4x4

8x8 16x16
...
1024x1024

1024x1024
...
16x16 8x8

Generated

4x4

Image

14 ©2020 FireEye

Loss Analyzing and Improving the Image Quality of StyleGAN, Karras et al., 2019

Pre-Trained StyleGAN2
e.g. https://thispersondoesnotexist.com/
15 ©2020 FireEye

Fine-Tuning for Custom Portraits
16 ©2020 FireEye

Hear No Evil

Neural Voice Cloning

§ Real-time text-to-speech on arbitrary
voices from captured reference speech
§ Sequential, 3-stage pipeline

Encoder Dataset 1
mels

Synthesizer

Vocoder

Dataset 2 mels text

audio

­ Encoder ­ embeds a speaker's utterance, trained on the speaker verification task

Speaker Encoder

Speaker Encoder

Speaker Encoder

­ Synthesizer ­ Tacotron2 generates spectrogram from text conditioned on Encoder's embedding

embed

­ Vocoder ­ WaveRNN infers audio waveform from Synthesizer's spectrograms

embed Synthesizer
pred mels

embed Synthesizer
pred mels WaveRNN
pred audio

§ LibriSpeech, VoxCeleb1 & 2, VCTK

GE2E Loss

Spectrogram Loss

Wav Loss

­ 2,500+ hours of audio from 8,500+ speakers

18 ©2020 FireEye

Automatic Multispeaker Voice Cloning, Jemine, 2019 Transfer Learning from Speaker Verification to MultiSpeaker Text-to-Speech Synthesis, Jia et al., 2018

Pre-Trained SV2TTS
19 ©2020 FireEye

Fine-Tuning for Speaker Adaptation
"It demonstrates that we have a common enemy but I would not count on this relationship to go beyond that. This regime has shown it will not hesitate to burn good relations for its own financial gain."
20 ©2020 FireEye

Fine-Tuning for Speaker Adaptation
"The leaked documents clearly show that the foreign minister is corrupt and that he has misdirected funds."
21 ©2020 FireEye

Fine-Tuning for Speaker Adaptation
"The intelligence services have indicated that these anti government protests have been organized by foreign entities. They are bent on stirring up trouble and causing harm to the
people of our country."
22 ©2020 FireEye

Speak No Evil

Neural Language Models
§ The quick brown fox jumps over the lazy ___
­ Successively sample from candidate word distributions
§ Transformer Architecture
­ Autoregressive: stacked decoder blocks ­ Attention mechanism: masks future tokens

Outputs
Softmax
Linear
Add & Norm Feed
Forward
Add & Norm Masked
Multi-Head Self-Attention

§ Web scrape of 3+ karma Reddit URLs
­ Byte-pair encoded input words ­ > 8 million documents, ~40 GB English text

Input Embedding

Positional Encoding

24 ©2020 FireEye

Inputs Language Models are Unsupervised Multi-task Learners, Radford et al., 2019

Pre-Trained GPT-2
https://www.fireeye.com/blog/threat-research/2019/11/combattingsocial-media-information-operations-neural-language-models.html
25 ©2020 FireEye

Fine-Tuning for Information Operations
https://www.fireeye.com/blog/threat-research/2019/11/combattingsocial-media-information-operations-neural-language-models.html
26 ©2020 FireEye

Case Study

Some Recent IO Tactics
§ Solicitation and dissemination of audio/video interviews with
real experts (e.g. "Distinguished Impersonator")
§ Well-developed, cross-platform personas designed to infiltrate online
communities and/or disseminate fabricated content (e.g. "Ghostwriter")
https://www.fireeye.com/blog/threat-research/2020/02/information-operationsfabricated-personas-to-promote-iranian-interests.html
28 ©2020 FireEye

Some Recent IO Tactics
§ Networks of inauthentic SM accounts amplify political narratives
(e.g. Pro-China networks targeting Hong Kong protestors, pushing COVID-19 narratives)
§ Personas and accounts often leverage appropriated photos of
real individuals, recycle text/content
https://www.youtube.com/watch?v=O87AYlIPSyI&t=1029s 29 ©2020 FireEye

How Could Synthetic Media Exacerbate
§ Synthetically generated persona photos (already happening!)
­ Create convincing personas corresponding to a particular minority group to instigate political conflict, incite animosity or violence (trained on images of real people from target group or geography)
§ Synthetically generated or altered audio interviews would
lower actor burden, make attribution more difficult
§ Synthetic text lowers barriers to creating diverse content at
scale
These applications materially help threat actors scale
campaigns AND evade detection
30 ©2020 FireEye

Generative Fine-Tuning for Detection Evasion

§ Diversity at Scale is Problematic
­ Fine-tuning advantages attacker, who benefits from internet data availability
­ It shifts positive class probabilities towards chance, decreasing detection accuracy
§ Training Data Availability Correlates w/
Target Value
­ Politicians, candidates, staffers, gov officials ­ Journalists, media personalities ­ Academics, influencers, celebrities

fine-tuning fine-tuning

31 ©2020 FireEye

Synthetic Media In the Wild
Synthetic media being repurposed for profile pics on social media platforms for several IO campaigns
32 ©2020 FireEye

Synthetic Media In the Wild
Synthetic media being repurposed for profile pics on social media platforms for several IO campaigns
33 ©2020 FireEye

Synthentic Generation for Fun and Profit!
§ Hobbyism
§ An open research ethos
§ Synthetic Media as-a-Service
­ Micro-Targeting ­ Personalized Advertisements and General Marketing ­ Corporate Communications and Internal Learning and
Development Materials ­ Assets for Consumable Media (e.g. video game
characters)
34 ©2020 FireEye

Actor Benefits of Commercial Outsourcing

Sponsor

§ Multiple avenues of deployment mask
attribution, reduce direct ties back to sponsors

PR Firm

§ Increased diversity and/or specialization of
assets and content

§ Lower in-house expertise and operational
investment required

Synthetic Generation as-a-Service

§ Plausible deniability and anonymity

35 ©2020 FireEye

Implications and Takeaways

Technical Mitigations
§ Forgery Detection
­ Statistical/ML-based ­ Fingerprint/Forensics (hard to scale)
§ Poor spelling, grammar, punctuation § Eye alignment, teeth abnormalities, ear
asymmetry, no blinking, hairline artifacts
§ Content Authentication
­ Verification/other reputation signals ­ Watermarking, cryptographic signing ­ Controlled capture, Provenance, audit
trails
§ Platform Integrity, metadata context
­ Content moderation, acct creation bottlenecks, fact-checking, policies
37 ©2020 FireEye

Patching Human Perception

§ Community Efforts
­ Detection Challenges, Workshops ­ Coordination across disciplines ­ Threat modeling, red teaming
­ Acknowledgement of social Impact or Ethics Statements

Service/Application Type Image or Video

Marketed Use Cases None/user Defined

No Ethics Statement

Marketing/Advertising

§ End-user Education and Awareness
­ Beware of risk hyperbole, disinformation Voice about disinformation. Be vigilant
§ Legal/Regulations (e.g. AB 730)
­ Software licensing ­ Terms of Service/Codes of Conduct
38 ©2020 FireEye

Multiple

Ethics Statement
Ethics Statement?

Video Game Development
Corporate Comms/ Training

The Calm Before the Storm
§ Synthetic Media tech will become cheaper,
easier, more pervasive, and more credible
§ New Trends Risk Further Escalation:
­ Few/One-shot learning ­ Controllability and Steerability ­ Distillation, pruning, sparsification, etc. ­ Multi-modality (text, images, and audio) ­ Video (deepfakes, face swap), Full body ­ Low code/no-code platforms
§ User susceptibility - see what you want to see
­ Short, authoritative social media text ­ Cell-phone quality audio and video ­ Does not require high bar of credibility, only
needs to be "good enough"
39 ©2020 FireEye

Black Hat Sound Bytes
§ Fine tuning for generative impersonation in the text,
image, and audio domains can be performed by nonexperts, can be weaponized for offensive social media-driven information operations
§ Detection, attribution, and response is challenging
in scenarios where actors can anonymously generate and distribute credible fake content using proprietary training datasets
§ We as a community can and should help AI
researchers, policy makers, and other stakeholders mitigate the harmful use of open source models
40 ©2020 FireEye

Thank you for your attention.
Sam Riddell (FireEye) Ryan Serabian (FireEye) Sajidur Rahman (University of Florida) ML Visuals/dair.ai/@omarsar0/@srvmshr Black Hat organizers and staff

