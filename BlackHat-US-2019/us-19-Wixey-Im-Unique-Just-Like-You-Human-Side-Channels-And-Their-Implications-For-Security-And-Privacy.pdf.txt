I'm unique, just like you
Human side-channels and their implications for security and privacy
Matt Wixey August 2019
All references cited are at the end of the slide deck, available on the conference site later this evening!

Matt Wixey

· Research Lead for the PwC UK Cyber Security practice · PhD student at UCL · Previously worked in LEA doing technical R&D · Black Hat USA, DEF CON, ISF Congress, BruCon, 44Con, BSides, etc

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 2

Aims
· Be aware of 3 human side-channels and how they work · Practical takeaways for each side-channel, including tools · Examine implications for security and privacy · Know about possible countermeasures · Explore future research ideas

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 3

Agenda
1. Background............................................................................. 06 2. Forensic linguistics.................................................................. 09 3. Behavioural signatures............................................................ 30 4. Cultural CAPTCHAs................................................................ 50 5. Conclusion............................................................................... 68

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 4

The John Christie case

https://www.radiotimes.com/news/2017-06-22/a-timeline-of-john-christies-crimes-and-their-discovery-and-the-bits-rillington-place-missed-out/
I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 5

Background
I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 6

How can we use identifiers to find an offender?

Background

· Various things we can look at in real-world crimes
­ Fingerprints, DNA, gait, irises, voice, etc
· What about digital offences?
­ IP and MAC addresses, domains, subscriber info, emails, usernames etc ­ New problem: easily obfuscated, spoofed, anonymised ­ Other methods take us further away from the individual
· Activity correlated to timezones (Rid & Buchanan 2014) · TTPs (Symantec 2011)

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 7

A possible solution

Background

· Computers have "side-channels"
­ Unintentional leakage in primitive outputs, as a result of operations
· Is there a real-world equivalent?
­ Humans as bio-computers (Lilly, 1968) with outputs (writing, speech, etc) ­ Unintentional leakage (behavioural theory) ­ Distinctive and consistent (Shoda et al, 1994; Zayas et al, 2002)
· Based on education, experience, training, environment, goals, etc · "Human side-channels"

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 8

Forensic linguistics

Me: Professor, I'd like to do my essay on the etymology of the word "f***". I just wanted to check you'd be OK with that, or would it be inappropriate?
Professor: I don't give a s***.

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 9

Theory of forensic linguistics

Forensic linguistics

· Covers other aspects, but we're looking at one in particular: · Authorship attribution via stylometry
­ Spelling and orthography ­ Grammar ­ Lexicon ­ Idiom ­ Identical expressions

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 10

Real-world use cases

Forensic linguistics

· Law enforcement investigations ­ ransom notes, texts, etc · Plagiarism investigations · Literature:
­ Shakespeare, The Federalist Papers, Primary Colors, JK Rowling
· Uncovering miscarriages of justice
­ e.g. police officers collaborating on statements

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 11

What forensic linguistics isn't

Forensic linguistics

· Detection of deception (cp. Van Der Zee et al, 2018; Wixey, 2018) · Detection of intention · Creating/comparing `textual fingerprints' · Handwriting analysis · Assessing context or content

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 12

Stylometry techniques

Forensic linguistics

Complex · Create corpus, extract features of interest
­ Parts of speech; word length; sentence length; pronouns; function words; hapax legomenon; dis legomenon; etc
· Statistical comparison of features
­ Support Vector Machines; Principal Component Analysis; Delta; etc
Basic · Observing and noting unusual spellings/punctuation use · Corpus/Google searching for these

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 13

Case studies (Olsson, 2009)

Forensic linguistics

http://news.bbc.co.uk/1/hi/england/south_yorkshire/4407944.stm https://www.thetimes.co.uk/article/ice-cream-wars-feud-ended-before-death-of-thomas-campbell-cd2gwpwgk
I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 14

Cyber-specific case studies

Forensic linguistics

· Academic research
­ Tweets (Sultana et al, 2017; Silva et al, 2011) ­ Sockpuppet detection (Solorio et al, 2013) ­ Forum posts (Abbasi & Chen, 2005) ­ Emails (Iqbal et al, 2010) ­ Source code (Caliskan-Islam et al, 2015; Frantzeskou et al, 2007) ­ Detecting authorship deception (Pearl & Steyvers, 2012)

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 15

Cyber-specific case studies

Forensic linguistics

· Operation Tripoli (Check Point, 2019)
­ Large Facebook social engineering campaign ­ Searching for repeated spelling and grammatical errors ­ Revealed multiple profiles (over 30), appear to be by same actor
· Qualitative study of IRS phone scammers (Tabron, 2016)
­ Polar tag questions, narrative violation ­ "Strengthening the human link"
· Guccifer 2.0 (Argamon, 2016)

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 16

Other use cases

Forensic linguistics

· Spearphishing ­ different pretexts, same author · Missives and manifestos posted online · Ransomware instructions/notes · Posts/Tweets claiming responsibility, coordinating attacks, etc · Satoshi Nakamoto!

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 17

JGAAP (github.com/evllabs/JGAAP)

Forensic linguistics

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 18

Forensic linguistics
Delta spreadsheets (wp.nyu.edu/exceltextanalysis/deltaspreadsheets/)

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 19

stylometry (github.com/jpotts18/stylometry) Forensic linguistics

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 20

Forensic linguistics
stylo (R library) - github.com/computationalstylistics/stylo

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 21

Forensic linguistics
Shylo (stylo wrapper) - github.com/severinsimmler/shylo

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 22

· Shylo (stylo wrapper)

Forensic linguistics

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 23

Summary of tools

Forensic linguistics

Tool

Free?

Ease of use Method(s)

Outputs

Scalability

JGAAP

Yes

Hard

Multiple Numeric Possible

Delta sheets Yes

Moderate Delta

Numeric Difficult

Stylometry Yes

Easy

PCA

Graphs

Possible

Stylo (R)

Yes

Easy

Multiple Graphs

Possible

Shylo

Yes

Easy

Multiple Multiple Possible

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 24

Caveats

Forensic linguistics

· Register makes a big difference · Need a baseline of text ­ sizeable samples · Ground truth may also be required (depending on objective) · Strategy will be decided by circumstances · Time lapse may affect results · Not fingerprints, no 100% accuracy ­ not a silver bullet

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 25

Register

Forensic linguistics

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 26

Privacy implications

Forensic linguistics

· Attribution of texts written under a separate identity · Diminish anonymity

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 27

Countermeasures

Forensic linguistics

· Linguistic style is often unconscious · Awareness of it can facilitate disguising it · Imitating another's style, either during or after writing
­ Writing in another `voice' (cp. 1984)
· Google Translate · Combining with other authors · Running forensic linguistic tools ­ Anonymouth (Brennan et al, 2012; McDonald et al, 2012)

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 28

What can I do now?

Forensic linguistics

· Test tools out
­ Text from previous attacks & open source data ­ Start building corpus ­ Have a play, let me know what you think!
· Explore how useful/applicable it would be for your use cases · Think about other scenario/contexts it could be used in

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 29

Behavioural signatures
"I got an AUC of 0.99 but that's basically 1" ­ Jay-Z (a ROC fella)

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 30

Background

Behaviour

· Active area of research in attribution: who hacks, and why
­ Motivation, skills, attack behaviours (Landreth, 1985; Salles-Loustau et al, 2011)
­ Attitudes and culture (Chiesa et al, 2008; Watters et al, 2012) ­ Psychological elements (Shaw et al, 1998) ­ Specific actions undertaken (Ramsbrock et al, 2007)

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 31

Background

Behaviour

· What hasn't been done: comparing profiles of attackers · Case Linkage Analysis (CLA)
­ Linking separate crimes to common offenders ­ Statistical comparison of crime scene behaviours (Woodhams & Grant, 2006) ­ Some success in academic literature, with real-world crimes ­ Grubin et al, 1997; Mokros & Alison, 2002; Tonkin et al, 2008 ­ Based on same principles of distinctiveness and consistency

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 32

Methodology

Behaviour

· Log keystrokes on a honeypot · Take granular crime behaviours from pairs of offences
­ Classification step
· Determine degree of similarity
­ Similarity coefficient ­ Logistic regression ­ Receiver Operating Characteristic (ROC) curves

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 33

Classification

Behaviour

· Define behavioural domain e.g. `navigation', `enumeration', etc · Classify keystrokes as commands (`behaviours')
­ Turn into `yes/no' questions ­ "Did attacker try to wget malware from a remote site after compromise?" ­ Assign 1 if yes, 0 if no ­ End up with binary string for each offence in each domain

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 34

Similarity coefficient

Behaviour

· Jaccard's Coefficient (Tonkin et al, 2008) · Calculate 1 per domain per attack pair · X = count of behaviours present in both attacks · Y = count of behaviours present in Attack A, but not Attack B · Z = present in Attack B, but not Attack A · 1 = perfect similarity, 0 = perfect dissimilarity

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 35

Logistic regression

Behaviour

· Put coefficients into direct logistic regression model
­ SPSS, R, etc ­ loads of tutorials online ­ "Paired" is the dichotomous dependent variable (true/false) ­ We want to find out if we can predict the variable ­ And which behavioural domain contributes more

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 36

Logistic regression

Behaviour

· Run this for each behavioural domain to get:
­ Positive or negative correlation ­ A p-value (statistical significance) ­ Amount of variance that a variable explains
· Repeat with forward stepwise logistic regression
­ Will automatically start with one domain, and add one at each step ­ If it contributes to predictive power, keep it, else discard from the model ­ Determines optimal combination of domains

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 37

ROC Curves

Behaviour

· Put regression results into ROC curves
­ Plots x (prob of false positive) against y (prob of true positive) ­ More reliable measure of predictive accuracy (Tonkin et al, 2008; Swets, 1988) ­ You'll get `area under the curve' (AUC) values

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 38

ROC Curves

Behaviour
· Diagonal: no better than chance · The higher the AUC value, the greater the predictive accuracy · 0.5 ­ 0.7 = low · 0.7 ­ 0.9 = good · 0.9 ­ 1.0 = high · Swets, 1988

https://www.statisticshowto.datasciencecentral.com/receiver -operating-characteristic-roc-curve/
I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy
PwC

August 2019 39

Experiment

Behaviour

· Modified open source Python SSH keylogger (strace)
­ https://github.com/NetSPI/skl
· Two VMs, exposed on internet over SSH · One account per user per box · Deliberate privesc vulnerabilities, plus fake data to exfiltrate · 10x pentesters/students asked to SSH in (2 attacks each)
­ And get root, steal data, cover tracks, poke around

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 40

Experiment

Behaviour

· Keystrokes collated per user, split into behavioural domains
­ Navigation, enumeration, exploitation ­ 40 individual behaviours per domain

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 41

Experiment
· Automated calculation of Jaccard values

Behaviour

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 42

Experiment

Behaviour

· Imported results into SPSS · Performed logistic regression (direct and forward stepwise) · Also used SPSS for ROC curves

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 43

Applicability and approaches

Behaviour

· Honeypots · Build up a corpus of attackers · Could also identify attackers who've trained together

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 44

Caveats

Behaviour

· Some offenders show more distinctiveness than others
­ Bouhana et al, 2016
· Some behaviours less consistent
­ Bennell & Canter, 2002; Bennell & Jones, 2005
· MO is a learned behaviour, and offenders develop
­ Pervin, 2002; Douglas & Munn, 1992
· Offenders will change behaviours in response to events
­ Donald & Canter, 2002

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 45

Caveats

Behaviour

· This experiment:
­ Small sample, only commands ­ Only one OS/scenario ­ Not `real' attackers ­ knew they wouldn't suffer consequences ­ Not all attackers will have the same motivations, could affect results ­ Not 100% accurate

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 46

Privacy implications

Behaviour

· People can be linked to separate hosts/identities · Based on approaches, syntax, and commands · Regardless of anonymising measures · Regardless of good OPSEC elsewhere · Could be linked to historical or future activity

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 47

Countermeasures

Behaviour

· Similar to defeating authorship identification · Make a conscious decision to disguise your style
­ CLA different ­ e.g. alias command would not work ­ Hard to automate ­ can't predict commands in advance ­ Could semi-automate, using scripts ­ Randomising ordering of command switches ­ Switching up tools e.g. wget instead of curl; vi instead of nano, etc

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 48

What can I do now?

Behaviour

· Give it a go!
­ Keylogger on CTF machines (make sure participants are aware, take appropriate ethical measures)
­ Classification and calculate Jaccard score ­ pretty simple ­ Calculate logistic regression scores ­ again, pretty simple
­ ROC curve analysis (same tools)
­ Have a go at automating! R/Python probably best place to start ­Other behavioural domains, e.g. evasion techniques ­Whitepaper available (contact me!) or see DEF CON 2018 talk

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 49

Cultural CAPTCHAs
"Of course I remember Crinkley Bottom"
I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 50

Background

Cultural CAPTCHAs

· "Is this account a human or a bot?"
­ Lots of academic and practical research (Filippoupolitis et al, 2014) ­ Botometer, Twitteraudit, Botcheck, Botsentinel
· Certain behaviours/features can be "tells" · Harder question: "Is this account owner really X nationality?" · Context: hostile accounts influencing conversations or consensus
­ We think they're probably human ­ But how do we prove they're authentic?

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 51

Background

Cultural CAPTCHAs

· Enter "cultural CAPTCHAs" · Cultural artefacts which haven't spread beyond origin · In many cases this can be popular culture, but also:
­ Language ­ Cultural norms and expectations ­ Food ­ Music ­ Traditions, etc
I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 52

Experiment

Cultural CAPTCHAs

· Let's try an example - who are these two men? · RAISE YOUR HAND if you know

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 53

Experiment
· Let's try another

Cultural CAPTCHAs

https://www.independent.co.uk/arts-entertainment/tv/news/barry-chuckle-dead-brothers-latest-cause-comedy-death-manager-a8477966.html
I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 54

Experiment

Cultural CAPTCHAs

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 55

Experiment

Cultural CAPTCHAs

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 56

Experiment
· One for the Americans  · Who's this, and where is he from?

Cultural CAPTCHAs

https://www.qthemusic.com/articles/the-latest-q/vic-bob-the-real-morrissey-hated-morrissey-the-consumer-monkey-q349-preview
I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 57

Another example

Cultural CAPTCHAs

https://knowyourmeme.com/memes/jake-from-state-farm https://www.reddit.com/r/MovieDetails/comments/7vt5wh/inglourious_basterds_2009_you_can_clearly_see_the/
I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 58

Other possible examples
· Food · Music · Cultural norms and quirks · Popular culture · Education
https://www.youtube.com/watch?v=2cgRd2WJXpo
I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

Cultural CAPTCHAs
August 2019 59

Case studies

Cultural CAPTCHAs

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 60

Case studies

Cultural CAPTCHAs

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 61

Case studies

Cultural CAPTCHAs

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 62

Case studies

Cultural CAPTCHAs

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 63

Applicability and approaches

Cultural CAPTCHAs

· `CAPTCHA'-style verification system · For accounts reported as possibly false/hostile? · Give users option of selecting a different CAPTCHA
­ They genuinely may not know the answer!

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 64

Demo
I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 65

Caveats

Cultural CAPTCHAs

· Reliant on specific cultural knowledge
­ Some may be age-dependent ­ May become increasingly hard to find examples ­ Users may genuinely not know the answer ­ cp. genuine CAPTCHAs
· Images cannot be searchable online
­ Manipulation/generation to avoid TinEye, reverse image search, etc

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 66

What can I do now?

Cultural CAPTCHAs

· Come up with your own examples and implementations · Test on social media · Research on effectiveness at scale · How resilient are cultural CAPTCHAs?
­ Not an area I know much about, but with click-farm workers, catfish, etc ­ how much research do they do into culture and language?
­ Interesting area for future work

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 67

Conclusion
I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 68

Black Hat Sound Bytes

Conclusion

· Human side-channels offer under-explored, unconventional, and often cost-effective, opportunities for attribution and defence

· These are often specialist areas ­ but barrier to entry isn't as high as you might think!

· Tools and resources are available now, often open-source, to test these things out

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 69

Next steps and future research

Conclusion

· Expanding PoCs, applying techniques to more scenarios · Other side-channels · Further research into nature and scope of cultural CAPTCHAs · Further research into applicability and effectiveness of forensic linguistics and behavioural signatures as investigative tools · Automate some of this stuff, especially FL and CLA · Get in touch! Let's discuss  · matt.wixey@pwc.com, @darkartlab

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 70

Aims - review

Conclusion

· Be aware of 3 human side-channels and how they work · Practical takeaways for each side-channel, including tools · Examine implications for security and privacy · Know about possible countermeasures · Explore future research ideas

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 71

Plug

Conclusion

· Interested in the concepts of bio-computers and bio/digital crossovers?
­ Come to my DEF CON talk on Sunday, 1300, Track 2! ­ Sound Effects: Exploring Acoustic Cyber-weapons

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 72

www.pwc.co.uk
Thank you! Q&A: Reef A
@darkartlab matt.wixey@pwc.com
© 2019 PricewaterhouseCoopers LLP. All rights reserved. In this document, "PwC" refers to the UK member firm, and may sometimes refer to the PwC network. Each member firm is a separate legal entity. Please see www.pwc.com/structure for further details. Design: UK 880557
PwC

References

Abbasi, A., & Chen, H., 2005. Applying authorship analysis to extremist-group web forum messages. IEEE Intelligent Systems, 20(5), 67-75.

Argamon, S.E., 2016. Guccifer 2.0: Russian, not Romanian. https://multaverba.blogspot.com/2016/07/guccifer-20-russian-not-romanian.html

Bennell, C. and Canter, D.V., 2002. Linking commercial burglaries by modus operandi: Tests using regression and ROC analysis. Science & Justice, 42(3), 153-164.

Bennell, C. and Jones, N.J., 2005. Between a ROC and a hard place: A method for linking serial burglaries by modus operandi. Journal of Investigative Psychology and Offender Profiling, 2(1), 23-41.

Bouhana, N., Johnson, S.D. and Porter, M., 2014. Consistency and specificity in burglars who commit prolific residential burglary: Testing the core assumptions underpinning behavioural crime linkage. Legal and Criminological Psychology, 21(1), 77-94.

Brennan, M., Afroz, S., & Greenstadt, R., 2012. Adversarial stylometry: Circumventing authorship recognition to preserve privacy and anonymity. ACM Transactions on Information and System Security (TISSEC), 15(3), 12.

Caliskan-Islam, A., Harang, R., Liu, A., Narayanan, A., Voss, C., Yamaguchi, F., & Greenstadt, R., 2015. De-anonymizing programmers via code stylometry. In 24th {USENIX} Security Symposium ({USENIX} Security 15) (pp. 255-270).

Caliskan-Islam, A., Yamaguchi, F., Dauber, E., Harang, R., Rieck, K., Greenstadt, R. and Narayanan, A., 2015. When Coding Style Survives Compilation: Deanonymizing Programmers from Executable Binaries. arXiv preprint arXiv:1512.08546.

Check Point, 2019. Operation Tripoli. https://research.checkpoint.com/operation-tripoli/

Chiesa, R., Ducci, S. and Ciappi, S., 2008. Profiling hackers: the science of criminal profiling as applied to the world of hacking (Vol. 49). CRC Press.

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 74

Donald, I. and Canter, D., 1992. Intentionality and fatality during the King's Cross underground fire. European journal of so cial psychology, 22(3), 203-218.

Douglas, J.E. and Munn, C., 1992. Violent crime scene analysis: Modus operandi, signature and staging. FBI Law Enforcement Bu lletin, 61(2).

Eder, M., Kestemont, M., & Rybicki, J., 2013. Stylometry with R: a suite of tools. In DH (pp. 487-488).

Filippoupolitis, A., Loukas, G. and Kapetanakis, S., 2014. Towards real-time profiling of human attackers and bot detection. http://gala.gre.ac.uk/14947/1/14947_Loukas_Towards%20real%20time%20profiling%20(AAM)%202014..pdf, accessed 05/07/2018.

Frantzeskou, G., Stamatatos, E., Gritzalis, S., Chaski, C. E., & Howald, B. S., 2007. Identifying authorship by byte-level n-grams: The source code author profile (scap) method. International Journal of Digital Evidence, 6(1), 1-18.

github.com/computationalstylistics/stylo

github.com/evllabs/JGAAP

github.com/jpotts18/stylometry

github.com/NetSPI/skl

github.com/psal/anonymouth

github.com/severinsimmler/shylo

Grubin, D., Kelly, P. and Brunsdon, C., 2001. Linking serious sexual assaults through behaviour (Vol. 215). Home Office, Research, Development and Statistics Directorate.

Hoover, D. L., 2007. Updating delta and delta prime. Graduate School of Library and Information Science, University of Illino is, 79-80.
I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 75

ibm.com/uk-en/analytics/spss-statistics-software

Iqbal, F., Binsalleeh, H., Fung, B. C., & Debbabi, M., 2010. Mining writeprints from anonymous e-mails for forensic investigation. digital investigation, 7(1-2), 56-64.

Juola, P., 2009. JGAAP: A system for comparative evaluation of authorship attribution. In Journal of the Chicago Colloquium on Digital Humanities and Computer Science (Vol. 1, No. 1).

Landreth, B., 1985. Out of the inner circle: A hacker guide to computer security. Microsoft Press.

Lilly, J. C., 1972. Programming and metaprogramming in the human biocomputer. Julian P.

McDonald, A. W., Ulman, J., Barrowclift, M., & Greenstadt, R., 2013. Anonymouth revamped: Getting closer to stylometric anonymity. In PETools: Workshop on Privacy Enhancing Tools (Vol. 20).

Mokros, A. and Alison, L.J., 2002. Is offender profiling possible? Testing the predicted homology of crime scene actions and background characteristics in a sample of rapists. Legal and Criminological Psychology, 7(1), 25-43.

Olsson, J., 2009. Wordcrime: Solving crime through forensic linguistics. A&C Black.

Pearl, L., & Steyvers, M., 2012. Detecting authorship deception: a supervised machine learning approach using author writeprints. Literary and linguistic computing, 27(2), 183-196.

Pervin, L.A., 2002. Current controversies and issues in personality. 3rd ed. John Wiley & Sons.

Ramsbrock, D., Berthier, R. and Cukier, M., 2007, June. Profiling attacker behavior following SSH compromises. In 37th Annual IEEE/IFIP international conference on dependable systems and networks (DSN'07) 119-124

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 76

Rid, T. and Buchanan, B., 2015. Attributing cyber attacks. Journal of Strategic Studies, 38(1-2), 4-37

Salles-Loustau, G., Berthier, R., Collange, E., Sobesto, B. and Cukier, M., 2011, December. Characterizing attackers and attacks: An empirical study. In Dependable Computing (PRDC), 2011 IEEE 17th Pacific Rim International Symposium on Dependable Computing 174-183

Shaw, E., Ruby, K. and Post, J., 1998. The insider threat to information systems: The psychology of the dangerous insider. Security Awareness Bulletin, 2(98), 1-10.

Shoda, Y., Mischel, W. and Wright, J.C., 1994. Intraindividual stability in the organization and patterning of behavior: incorporating psychological situations into the idiographic analysis of personality. Journal of personality and social psychology, 67(4)

Silva, R. S., Laboreiro, G., Sarmento, L., Grant, T., Oliveira, E., & Maia, B., 2011. `twazn me!!!;('automatic authorship analysis of micro-blogging messages. In International Conference on Application of Natural Language to Information Systems (pp. 161-168). Springer, Berlin, Heidelberg.

Solorio, T., Hasan, R., & Mizan, M., 2013. A case study of sockpuppet detection in wikipedia. In Proceedings of the Workshop on Language Analysis in Social Media (pp. 59-68).

Sultana, M., Polash, P., & Gavrilova, M., 2017. Authorship recognition of tweets: A comparison between social behavior and linguistic profiles. In 2017 IEEE International Conference on Systems, Man, and Cybernetics (SMC) (pp. 471-476). IEEE.

Swets, J.A., 1988. Measuring the accuracy of diagnostic systems. Science, 240(4857), 1285-1293.

Symantec, 2011. W32.Duqu: The precursor to the next Stuxnet. Symantec Corporation, California, USA. Available from https://www.symantec.com/content/en/us/enterprise/media/security_response/whitepapers/w32_duqu_the_precursor_to_the_next_stuxnet. pdf

Tabron, J. L., 2016. Linguistic features of phone scams: A qualitative survey. In 11th Annual Symposium on Information Assurance (ASIA'16).

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 77

Tonkin, M., Grant, T. and Bond, J.W., 2008. To link or not to link: A test of the case linkage principles using serial car theft data. Journal of Investigative Psychology and Offender Profiling, 5(1-2), 59-77.
Van Der Zee, S., Poppe, R., Havrileck, A., & Baillon, A., 2018. A personal model of trumpery: Deception detection in a real-world high-stakes setting. arXiv preprint arXiv:1811.01938.
Watters, P.A., McCombie, S., Layton, R. and Pieprzyk, J., 2012. Characterising and predicting cyber attacks using the Cyber Attacker Model Profile (CAMP). Journal of Money Laundering Control, 15(4), 430-441.
Wixey, M.S., 2018. Every ROSE has its thorn: The dark art of Remote Online Social Engineering. Black Hat USA 2018.
Woodhams, J. and Grant, T., 2006. Developing a categorization system for rapists' speech. Psychology, Crime & Law, 12(3), 245-260.
Zayas, V., Shoda, Y. and Ayduk, O.N., 2002. Personality in context: An interpersonal systems perspective. Journal of personality, 70(6), 851-900.

I'm unique, just like y ou: Human side-channels and their implications f or security and priv acy PwC

August 2019 78

