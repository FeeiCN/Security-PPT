YOUR VOICE IS MY PASSPORT
John Seymour and Azeem Aqil
1

Introduction
Voice is starting to be used for authentication
2

Introduction
Voice is starting to be used for authentication
3

Introduction
Voice is starting to be used for authentication
4

Introduction
Voice is starting to be used for authentication
5

Goal: Break Voice Authentication
(with minimal effort)
6

Obligatory Sneakers Reference
7

Obligatory Sneakers Reference
And here's how you do it.
8

· In Sneakers, they social engineered the target in order to record the exact words they needed

· In practice, this is hard to do

· Luckily, text-to-speech exists
9

10

Overview of Text to Speech (TTS)
 Essential idea: you give the algorithm text, and it generates the equivalent audio representation of that text (e.g. Mel Spectrograms)

 Model learns the mapping between the transcript and audio
  The way it does this is you give it labeled (transcribed) audio and
feed it into a deep neural network

 Generally models are trained on a single person's voice
  Generally deep learning models require a LARGE amount of labeled data

 Open source datasets (e.g. Blizzard, LJ Speech)
  >24 hours of labeled data to do well
11

Proof of concept
 Create an account
  Record >30 sentences

 Chosen by Lyrebird, same for all users.
  Provide a target sentence that Lyrebird will generate. 

 Apple Siri and Microsoft Speaker Recognition API (Public Beta)
  Proof of concept is of limited value from a security standpoint
12

Proof of Concept Demo
13

Open source TTS models
 Several open source models (Tacotron, Wavenet are best known)

 WaveNet generates realistic human sounding output, however, needs to be `tuned' significantly.

 Tacotron simplifies this process greatly

 The production of the feature set (which needs tuning in WaveNet) is replaced by another NN that works directly off data

 We use Tacotron
14

Model overview
15

Tacotron v1, Tacotron v2, and WaveNet
16

Collecting Data
 That's all well and good, but in order to train a model, we need to feed it data

 Can grab audio from e.g. YouTube, but quality/quantity are both important

 Need to transcribe this data

 Youtube/Google Speech API not good enough
  We also had to cut pieces with poor quality or with "um"
  We had to manually transcribe the data we used for training

 Most open source models require short (<10 second) snippets of audio

 Use ffmpeg to split the file into chunks
17

Data Augmentation
 Publicly available data for a specific target is probably limited
  Transcribing is time intensive since it must be done manually
  Need LARGE amount of high quality training data
  Solution: Augment Data
18

Data Augmentation: Shifting Pitch
 Slow down and speed up audio to generate new examples
  Libraries (pydub) available for this
  Measured how far pitch can be raised/lowered by recording "Hey
Siri" and testing how much speed up/slowdown would be accepted

 0.88x to 1.21x for our tests
  YMMV for exact parameter (probably different for every person)
19

Data Augmentation: Transfer Learning
1.Initially train on large open source dataset (Blizzard, LJSpeech)
 2.Get a good model, stop training
 3.Replace open source dataset with the target data
 4.Continue to train
20

Transfer Learning Demo
21

Putting it all together
1.Scrape data from target (e.g. Youtube)
 2.Select high-quality samples
 3.Transcribe and chunk audio
 4.Augment audio by shifting pitch
 5.Train general TTS model on open source dataset
 6.Replace general model training data with target data; finish training
 7.Synthesize voice from model
22

Our work in perspective (ML for offense)
 Attacks on ML systems

 Adversarial Attacks
  Most prior work attacking voice systems utilize GANs
  Pro: hiding commands within benign-sounding audio
  Con: method is currently brittle
  (We use the simpler approach of generating speech for a given user)

 Poisoning the Well
  Privacy/Differential Privacy

 Attacks using ML systems

 Phishing
  DeepFakes
  Robotics/Social Engineering
23

Mitigation: MFA
 Defense in Depth
  Potential issue: Speaker Recognition with unknown vocabulary is
hard
  Potential issue: Passphrases may not be kept secret
Image credit: XKCD.com
24

Mitigation: Detect CGA
25

Conclusions
 Speaker authentication and speaker recognition are different problems. Recognition is only a [weak] signal for "authenticating".

 Speaker authentication can be broken if the attacker has speech data of the target and knows the authentication prompt.

 Although most TTS systems require 24 hours of speech to train, transfer learning is an effective way to reduce that time to an amount realistic for an attacker to abuse. Transfer learning is effective for reducing data requirements generally.

 In conclusion, it's relatively easy to spoof someone's voice

 Will only get easier over time
26

Final note

27

Be afraid. Be very afraid.

?John Seymour and Azeem Aqil

