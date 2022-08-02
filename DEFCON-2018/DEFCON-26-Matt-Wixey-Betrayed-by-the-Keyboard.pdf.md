Betrayed by the keyboard
How what you type can give you away
Matt Wixey Research Lead, PwC UK Cyber Security
Building a secure digital society.
www.pwc.com

Disclaimer
· The views and opinions expressed here are not necessarily those of PwC
· This content is presented for educational purposes only · What this presentation isn't...
PwC  2

Introduction
Matt Wixey · Research Lead for the Cyber Security BU · Work on the Ethical Hacking team · PhD student at UCL · Previously worked in LEA doing technical R&D
PwC  3

Why this talk?
· Based on some research I did at UCL · Interest in side-channel attacks · Humans have side-channels too · Previous work on forensic linguistics
· First degree = English Literature and Language
PwC  4

Agenda
· What is attribution? · Problems · Case Linkage Analysis · Experimentation · Results · Implications · Summary
PwC  5

What is attribution?
· Why would we want to do it? · Benefits · Types · Approaches
PwC  6

What is attribution?
· Identifying an attacker's location?
· Hunker et al, 2008; Wheeler and Larsen, 2003
· Identify the country or organisation behind an attack?
· Rid and Buchanan, 2014
· "Determining who is responsible for a hostile cyber act"?
· Mejia, 2014
· "We must find a person, not a machine"
· Clark and Landau, 2011
PwC  7

Benefits of attribution
· Deterring future attacks · Improving defences · Interrupting and disrupting attacks (Hunker et al, 2008) · Does attribution actually lead to deterrence? (Guitton, 2012) · Regardless, attribution is a desirable outcome (depending on which side you're on!)
PwC  8

Types of attribution · Hutchins et al, 2011:

Atomic

Computed Behavioural

PwC  9

Problems with attribution
· Hiding atomic IOCs · Issues with computed IOCs · Lack of tangible benefits from
behavioural IOCs
PwC  10

Hiding atomic IOCs
· These are the most effective identifiers · Easy to resolve (usually) · But also easiest to spoof/anonymise/obfuscate
PwC  11

Issues with computed IOCs
· Changes to malware make it harder · Other methods:
· Correlating activity with office hours in timezones (Rid & Buchanan, 2014; CloudHopper)
· Deanonymising developers through artefacts (Caliskan et al, 2015) · Similar malware capabilities (Moran & Bennett, 2013; Symantec, 2011) · Distinguishing humans vs bots (Filippoupolitis et al, 2014)
PwC  12

Mo methods, mo problems
· Less focused on individuals · Sufficient if aim is to identify a state/sponsor
· Challenge is then legal/procedural
PwC  13

Behavioural profiling
· Less attribution · More trying to understand who hacks, and why
· Motivation, skills, attack behaviours (Landreth, 1985) · Attitudes and culture (Chiesa et al, 2008; Watters et al, 2012) · Psychological (Shaw et al, 1998)
PwC  14

Attack profiling
· Humans vs bots
· Filippoupolitis et al, 2014: Skill, education, typing speed, mistakes, etc
· Skill level
· Salles-Loustau et al, 2011: SSH honeypot. Stealth, enumeration, malware familiarity, protection of target
· Attacker behaviour
· Ramsbrock et al, 2007: Specific actions undertaken
PwC  15

The problem
· Profiling attackers is interesting · Next logical step is comparison
· To what extent is an attacker's profile similar to another's?
· Not really explored
PwC  16

Case Linkage Analysis
· The idea · Discovering case linkage analysis · Benefits of linking offences · What case linkage analysis is (and isn't) · Methodology · Example · Exceptions
PwC  17

The idea
· I had an idea (rare occurrence - to be celebrated) · Lurking in OSCP labs a few years ago · Discussing attack techniques, commands, methodologies
· Casual observation 1: everyone has their own way of doing things · Casual observation 2: this way of doing things rarely changes
PwC  18

Science!
· This seems obvious · My first degree was English Lit
· Could pretty much make it up as you went along
· Apparently, in science, you have to prove stuff
· Can't just write "this seems obvious" · Science is hard /
PwC  19

Discovering case linkage analysis
· How could I empirically test this? · Came across "Case Linkage Analysis" · Methodology used in crime science literature · Designed to link separate crimes to common offenders · Based on behavioural aspects (Woodhams & Grant, 2006)
PwC  20

Benefits of linking offences
· Can attribute previously unsolved crimes · Can investigate offences under one grouping ­ focused resources · Useful evidentially · Database of offences grows = better chance of success · A minority of offenders commit the majority of crimes (?)
· Not necessarily true of crime generally · But more accurate with specialist crimes
PwC  21

Benefits of linking offences
· Best method for linking = physical evidence (DNA, fingerprints, etc) · Highly accurate, but:
· May be absent or inconclusive (Grubin et al, 1997) · Does not really apply to cyber attacks · Closest approximation is forensic artefacts, but these are not always unique · Time-consuming and expensive (Craik and Patrick, 1994)
PwC  22

What case linkage analysis is
· Uses behavioural evidence
· Things the offender does during the commission of an offence
· Classify granular crime behaviours into domains · Create linked and unlinked pairs of offences · Compare with behaviours in other offences · Determine degree of similarity
PwC  23

What case linkage analysis isn't
· It's not offender profiling · Offender profiling makes inferences about the offender · Based on assumption of consistency between criminal and everyday behaviour (Canter, 2000)
· Based on this behaviour, I infer that the perpetrator is a balding but charismatic researcher from the UK
PwC  24

What case linkage analysis isn't
· CLA: statistical inferences about the similarity of 2 or more offences, based on common behaviours
· Crime A, perpetrated by Matt "Charismatic But Balding" Wixey, has several features in common with Crime B
· Therefore, Wixey may have also committed Crime B
PwC  25

Case linkage analysis in context
· Two key assumptions · Behavioural consistency
· Offenders display similar offending behaviours across crimes
· Behavioural distinctiveness
· The way an offender commits crimes is characteristic of that offender · And distinguishable from the style of other offenders (Canter, 1995)
PwC  26

Case linkage analysis in context
· Both assumptions must be present · Otherwise CLA is unlikely to be useful · e.g. homicide: dumping a body in a remote location is consistent for many offenders · But not distinctive
PwC  27

Case linkage analysis in context
· Individuals have stable, distinctive responses (Shoda et al, 1994) · Cognitive-affective personality system (CAPS)
· Mischel & Shoda, 1995; Mischel, 1999 · System of goals, expectations, beliefs, plans, strategies, memories
· CAPS is consistent yet distinctive (Zayas et al, 2002)
PwC  28

Case linkage analysis in context
· Assumptions of stability/distinctiveness made in other fields · Forensic linguistics
· Word and sentence length; slang; typos; errors; syntax; idiolect; article frequency; syllable count; punctuation; hapax legomena; sentence length; stylistics
· Language is socially acquired, continually ­ so may change
· Some biometrics
· Typing speed; typos; typing habits
PwC  29

Case linkage analysis ­ does it work?
· Consensus: yes, in most cases · Observed variance significantly smaller in linked crimes
· Grubin et al, 1997; Mokros & Alison, 2002
· Significant evidence for cross-situational consistency
· Both criminal and non-criminal behaviours (Tonkin et al, 2008)
PwC  30

Methodology
· Separate behaviours into domains · Calculate similarity coefficient · Input into logistic regression model · Determine optimal combination of domains · Receiver Operating Characteristic (ROC) curves
PwC  31

Methodology
· Lots of stats stuff · I hate stats. I am bad at stats. · Will try and explain this with a worked example · None of that "left as an exercise for the reader" nonsense
PwC  32

Example
· Two burglaries, A and B · We want to find out if the same offender did both · Define a dichotomous dependent variable
· This is a Y/N question, and we're trying to `predict' the answer · And find out what variables contribute more · "Are these two crimes linked?"
PwC  33

Example
· Take granular behaviours and put them into domains
· e.g. Entry behaviours = method of entry; tools used; time of day; etc · Property behaviours = property taken; property damaged; and so on
· These are our independent variables · Make these dichotomous by turning into yes/no questions
· e.g. Entry behaviours: "was a screwdriver used? Was a crowbar used? Was a window open? Were the occupants home?" etc
PwC  34

Example
· Then apply a similarity coefficient
· Index of similarity · Jaccard's is coarse, but the measure of choice (Tonkin et al, 2008)
· x = count of behaviours present in both
· y = count of behaviours present in A but not in B
· z = inverse of y
PwC  35

Example
· 1 = perfect similarity · 0 = perfect dissimilarity · 1 coefficient per domain · Ignores joint non-occurrences
· This is a concern when dealing with police data · Something may have been present, but not recorded · Less of a concern in this case
PwC  36

Example
· Each coefficient into direct logistic regression model · Predictive analysis · "To what extent does a given factor contribute to an outcome?"
· e.g. "to what extent does being a smoker contribute to the risk of having a heart attack?"
· Or "does similarity in the entry behaviours domain predict whether or not the two burglaries are linked?"
PwC  37

Example
· Logistic regression tells us:
· Whether a variable is positively or negatively correlated with the outcome · How well a given variable fits with the data · The amount of variance that a given variable explains · A p-value (probability of seeing this result if the null hypothesis is true)
· Run for each domain
PwC  38

Example
· Then forward stepwise logistic regression
· Start with one domain · Add a domain at each step · If this contributes to the model's predictive power, keep it · Else discard it
· Determines optimal combination of domains
PwC  39

Example
· Regression results into ROC curves · Graphical representation
· x (probability of false positive) against y (probability of true positive)
· More reliable measure of predictive accuracy · Based on area under the curve (AUC)
PwC  40

Example
· Overcomes statistical issue of using pairs from same sample (Tonkin et al, 2008) · No reliance on arbitrary thresholds (Santtila et al, 2005) · Measure of overall predictive accuracy (Swets, 1988)
PwC  41

Example
http://www.statisticshowto.com/wp-content/uploads/2016/08/ROC-curve.png

· Diagonal: no better than chance · The higher the AUC value, the greater the predictive accuracy · 0.5 ­ 0.7 = low · 0.7 ­ 0.9 = good · 0.9 ­ 1.0 = high · Swets, 1988
PwC  42

Exceptions
· Some offences are less suitable, e.g. homicide
· Bateman & Salfati, 2007; Harbort & Mokros, 2001; Sorochinski & Salfati, 2010
· Some offenders show more distinctiveness than others
· Bouhana et al, 2016
· Some behaviours less consistent, e.g. property stolen in burglaries
· Bennell & Canter, 2002; Bennell & Jones, 2005
PwC  43

Exceptions
· MO is a learned behaviour, and offenders develop
· Pervin, 2002; Douglas & Munn, 1992
· Offenders will change behaviours in response to events
· Donald & Canter, 2002
· Behaviours under offender's control more likely to be stable
· Furr & Funder, 2004; Hettema & Hol, 1998
· So offences involving victim interaction may differ
· e.g. whether victim fights back / runs / shouts for help, etc
PwC  44

Exceptions
· Most research only applied to solved crimes
· Woodhams & Labuschagne, 2012
· Relatively small samples · Only serial offences
· Slater et al, 2015
PwC  45

Experimentation
· Concept · Research design · Hypothesis · Analysis · Results
PwC  46

Concept
· Could CLA be applied to network intrusions?
· Specifically, where attacker has code execution · Has never been done before
· Take granular behaviours (keystrokes, commands, etc) · Apply CLA methodology
PwC  47

Research design
· Common approach historically: use police reports · Can be inaccurate and/or incomplete · Victim accounts may be inaccurate
· Alison et al, 2001; Canter & Alison, 2003
· Crimes are often traumatic · Traumatic experiences can distort memories
· Freyd, 1996; Halligan et al, 2003
PwC  48

Research design
· Crime reports unlikely to be granular enough · Previous studies on attacker profiling used simulations · Honeypot?
· Needed ground truth, as CLA previously untested on this offence type · Same IP addresses do not guarantee same individual at keyboard · Need to also distinguish between bots and humans · Honeypots can be fingerprinted · Attackers may deliberately change approach
PwC  49

Research design
· Modified open source Python SSH keylogger (strace)
· https://github.com/NetSPI/skl
· Two VMs, exposed on the internet (SSH) · One account per user per box, to prevent bot attacks · Deliberate privesc vulnerabilities · Plus fake data to exfiltrate
PwC  50

Research design
· Obtained participants
· 10x pentesters / students / amateur enthusiasts
· Asked to SSH into both machines and try to:
· Get root · Steal data · Cover tracks · Poke around
· Meanwhile, I recorded all keystrokes on each VM
PwC  51

Hypothesis
Cyber attackers will exhibit consistent and distinctive behaviours whilst executing commands on compromised hosts,
which will provide a statistically significant basis for distinguishing between linked and unlinked attack pairs.
PwC  52

Analysis
· Split into behavioural domains, 40 behaviours each:
· Navigation ­ moving through filesystem · Enumeration · Exploitation ­ privesc and exfil attempts
· Also coded for 3 metadata variables:
· Number of ms between each keystroke · Number of ms between each command · Number of backspaces (as percentage of all keystrokes)
PwC  53

Metadata variables
· Non-dichotomous · Used in other CLA work, in addition to behavioural domains
· Intercrime distance (Bennell & Canter, 2002) · Temporal proximity (Tonkin et al, 2008)
· Filippoupolitis et al, 2014: commands typed per second
· Problematic: length of command, time to complete, and time spent interpreting or manipulating output
PwC  54

Example behaviours
PwC  55

Analysis
· Average attack time per host: 133.34 minutes · Average commands per host: 243 · 2 participants got root on Host A · 1 participant got root on Host B
PwC  56

Similarity coefficients
· 10 attackers, 2 machines = 100 crime pairs
· Compare each attack against Host A to each attack against Host B · 10 linked pairs, 90 unlinked pairs
· Wrote application to calculate the similarity coefficient:
· For each pair for the 3 behavioural domains, and · Differences between the 3 metadata variables
· Ended up with CSV file:
· ID, paired (y/n), coefficients for each domain, differences for each metadata variable
PwC  57

Similarity coefficients - behaviours
PwC  58

Similarity coefficients - metadata
PwC  59

Logistic regression
· Imported CSV file into SPSS
· Strenuous Package for Sad Students / · Significant Probability of Statistics-related Stress /
· Direct logistic regression for each predictor variable · Then forward stepwise logistic regression · Six models in total, for each domain · Plus an optimal combination/order of all domains
PwC  60

Results
Here comes the slide you've all been waiting for...
PwC  61

Results

PwC  62

You're too kind
(waits for applause to die down)
PwC  63

What does this tell us?
· Three behavioural domains can classify linked/unlinked offences · High level of accuracy · Navigation: most effective predictor
· Followed by exploitation, then enumeration
· Strong positive correlation to dependent variable · Keystroke and command interval variables not reliable predictors · Backspace: weak negative correlation to linkage · Results statistically significant for behavioural domains · But not for any metadata variables
PwC  64

ROC curves · Results used to build ROC curves
PwC  65

ROC curves
https://www.discogs.com/artist/21742-Jay-Z#images/30264081

I got 0.992 AUC, but it just ain't 1
Jay-Z
(A ROC fella) PwC  66

ROC curve results
· Navigation = 0.992 · Enumeration = 0.912 · Exploitation = 0.964 · Keystroke internal = 0.572 · Command interval = 0.58 · Backspace variable = 0.702 · Optimal model (navigation & enumeration) = 1.0
PwC  67

Implications
· Observations & comparisons · Investigation implications · Privacy implications · Defeating CLA · Threats to validity
PwC  68

Observations & comparisons
· High levels of consistency and distinctiveness · Navigation and enumeration combined
· No need for exploitation (in this study)
· Why was navigation specifically so prominent?
· Something everyone does, every day · Enumeration & exploitation only done during attacks · Navigation behaviours may be more ingrained
PwC  69

Observations & comparisons
· Higher accuracy than other crime types · Behaviours less subject to influence may be more stable
· Nature of offence: offenders less likely to be influences · Broader approach may change · But possibly not granular command choice · Especially navigation
PwC  70

Observations & comparisons
· Metadata variables significantly weaker · What you type has greater linking power than how you type · Latency may have affected some of the results · But mistakes/typos show some promise · Needs further exploration
PwC  71

Implications for investigators
· Can link separate offences to common offenders · With no atomic or computed IOCs · But need a lot of information
· Previous CLA/attribution work: limited, specific info required · Bennell & Canter, 2002; Hutchins et al, 2010; Clark & Landau, 2011 · Here, need as much as possible · As granular as possible
PwC  72

Implications for investigators
· Need to be in a position to capture commands/keystrokes
· High-interaction honeypots · Verbose and detailed logging · Backdoored CTFs or vulnerable VMs
PwC  73

Implications for investigators
· Could also link attackers who trained together · Or who have all done a certain certification
· Sample commands and code · Dilutes CLA assumption of distinctiveness · But could still assist with attribution
PwC  74

Privacy implications
· People can be linked to separate hosts/identities
· Based on approaches, syntax, and commands
· Regardless of anonymising measures · Regardless of good OPSEC elsewhere
PwC  75

Privacy implications

· Like forensic linguistics, exploits stable behavioural traits · Won't be 100% accurate obviously · And affects less of the population, cp. forensic linguistics
· e.g. ~86% of the population is literate* · Less people than that can operate a command-line

* https://data.worldbank.org/indicator/SE.ADT.LITR.ZS, 27/06/18

PwC  76

Privacy implications
· This study only focused on commands · May also apply to:
· Typos, and the way you correct them · How you form capitals · Using PgDn/PgUp · Using arrow keys rather than the mouse · Tabs/spaces · Keyboard shortcuts · Use of, and preference for, bracket types
PwC  77

Privacy implications
· If someone can log your keystrokes, you have issues anyway
· But this is less about identification · If someone can log your keystrokes, it's not hard to find out who you are
· This is more about attribution via linkage · Could be used to link you to historical activity · Or future activity · Used to build up repository of command profiles
PwC  78

Defeating CLA
· Similar to defeating authorship identification · Make a conscious decision to disguise your style
· Forensic linguistics: solutions range from crude (Google Translate) to sophisticated (automated changes to sentence construction, synonym substitution, etc)
· CLA different ­ e.g. alias command would not work · Hard to automate ­ can't predict commands in advance · Could semi-automate, using scripts
PwC  79

Defeating CLA
· Conscious changes are probably the best way to do it · Randomising ordering of command switches · Switching up tools used e.g. wget instead of curl; vi instead of
nano; less instead of cat
PwC  80

Threats to validity
· Very small sample · Not real-world data · Attackers were willing volunteers
· Knew they had permission, with no risk of reprisal
· Linux only · One scenario (low-priv shell) · Attackers may not always want/need to escalate
PwC  81

Summary
· Topics for future research · Collaboration · Conclusion · References
PwC  82

Future research
· Explore effects of expertise and temporal proximity · Further research into metadata variables for mistakes · Real-world data · Stochastic analysis · Greater environmental and scenario diversity · Real-time or near real-time automation
PwC  83

Collaboration
· Get in touch if you want to discuss · @darkartlab · matt.wixey@pwc.com
PwC  84

Conclusion
· Small, novel study · Some promising results · Significant implications for defenders/investigators · As well as implications for privacy · Needs further investigation
PwC  85

References
Alison, L.J., Snook, B. and Stein, K.L., 2001. Unobtrusive measurement: Using police information for forensic research. Qualitative Research, 1(2), 241-254. Bateman, A.L. and Salfati, C.G., 2007. An examination of behavioral consistency using individual behaviors or groups of behaviors in serial homicide. Behavioral Sciences & the Law, 25(4), 527-544. Bennell, C. and Canter, D.V., 2002. Linking commercial burglaries by modus operandi: Tests using regression and ROC analysis. Science & Justice, 42(3), 153-164. Bennell, C. and Jones, N.J., 2005. Between a ROC and a hard place: A method for linking serial burglaries by modus operandi. Journal of Investigative Psychology and Offender Profiling, 2(1), 23-41. Bouhana, N., Johnson, S.D. and Porter, M., 2014. Consistency and specificity in burglars who commit prolific residential burglary: Testing the core assumptions underpinning behavioural crime linkage. Legal and Criminological Psychology, 21(1), 77-94. Caliskan-Islam, A., Yamaguchi, F., Dauber, E., Harang, R., Rieck, K., Greenstadt, R. and Narayanan, A., 2015. When Coding Style Survives Compilation: Deanonymizing Programmers from Executable Binaries. arXiv preprint arXiv:1512.08546. Canter, D., 1995. Psychology of offender profiling. Handbook of psychology in legal contexts (1994). Canter, D., 2000. Offender profiling and criminal differentiation. Legal and Criminological Psychology, 5(1), 23-46. Chiesa, R., Ducci, S. and Ciappi, S., 2008. Profiling hackers: the science of criminal profiling as applied to the world of hacking (Vol. 49). CRC Press. Clark, D.D. and Landau, S., 2011. Untangling attribution. Harv. Nat'l Sec. J., 2 Craik, M. and Patrick, A., 1994. Linking serial offences. Policing London 10 data.worldbank.org/indicator/SE.ADT.LITR.ZS, accessed 27/06/2018
PwC  86

References

Donald, I. and Canter, D., 1992. Intentionality and fatality during the King's Cross underground fire. European journal of social psychology, 22(3), 203-218.

Douglas, J.E. and Munn, C., 1992. Violent crime scene analysis: Modus operandi, signature and staging. FBI Law Enforcement Bulletin, 61(2).

Filippoupolitis, A., Loukas, G. and Kapetanakis, S., 2014. Towards real-time profiling of human attackers and bot detection. http://gala.gre.ac.uk/14947/1/14947_Loukas_Towards%20real%20time%20profiling%20(AAM)%202014..pdf, accessed 05/07/2018.

Freyd, Jennifer J., 1996. Betrayal Trauma: The Logic of Forgetting Childhood Abuse. Cambridge: Harvard University Press.

Furr, R.M. and Funder, D.C., 2004. Situational similarity and behavioral consistency: Subjective, objective, variable-centered, and person-centered approaches. Journal of Research in Personality, 38(5), 421-447.

github.com/NetSPI/skl, accessed 27/06/2018

Grubin, D., Kelly, P. and Brunsdon, C., 2001. Linking serious sexual assaults through behaviour (Vol. 215). Home Office, Research, Development and Statistics Directorate.

Guitton, C., 2012. Criminals and cyber attacks: The missing link between attribution and deterrence. International Journal of Cyber Criminology, 6

Halligan, S. L., Michael, T., Clark, D. M., & Ehlers, A. (2003). Posttraumatic stress disorder following assault: The role of cognitive processing, trauma memory, and appraisals. Journal of consulting and clinical psychology, 71(3)

Harbort, S. and Mokros, A., 2001. Serial Murderers in Germany from 1945 to 1995: A Descriptive Study. Homicide Studies, 5(4), 311-334.

Hettema, J. and Hol, D.P., 1998. Primary control and the consistency of interpersonal behaviour across different situations. European journal of personality, 12(4), 231-247.

Hunker, J., Hutchinson, B. and Margulies, J., 2008. Role and challenges for sufficient cyber-attack attribution. Institute for Information Infrastructure Protection 5-10.

Hutchins, E.M., Cloppert, M.J. and Amin, R.M., 2011. Intelligence-driven computer network defense informed by analysis of adversary campaigns and intrusion kill chains. Leading Issues in Information Warfare & Security Research, 1

Landreth, B., 1985. Out of the inner circle: A hacker guide to computer security. Microsoft Press.

PwC  87

References
Mejia, E.F., 2014. Act and actor attribution in cyberspace: a proposed analytic framework. Air Univ Maxwell AFB AL Strategic Studies Quarterly. Mischel, W. and Shoda, Y., 1995. A cognitive-affective system theory of personality: reconceptualizing situations, dispositions, dynamics, and invariance in personality structure. Psychological review, 102(2) Mischel, W., 1999. Personality coherence and dispositions in a cognitive-affective personality system (CAPS) approach. In: The coherence of personality: Social-cognitive bases of consistency, variability, and organization (eds. Cervone and Shoda), 37-60. Mokros, A. and Alison, L.J., 2002. Is offender profiling possible? Testing the predicted homology of crime scene actions and background characteristics in a sample of rapists. Legal and Criminological Psychology, 7(1), 25-43. Moran, N. and Bennett, J., 2013. Supply Chain Analysis: From Quartermaster to Sun-shop (Vol. 11). FireEye Labs. Pervin, L.A., 2002. Current controversies and issues in personality. 3rd ed. John Wiley & Sons. Ramsbrock, D., Berthier, R. and Cukier, M., 2007, June. Profiling attacker behavior following SSH compromises. In 37th Annual IEEE/IFIP international conference on dependable systems and networks (DSN'07) 119-124 Raynal, F., Berthier, Y., Biondi, P. and Kaminsky, D., 2004. Honeypot forensics, Part II: analyzing the compromised host. IEEE security & privacy, 2(5), 77-80. Rid, T. and Buchanan, B., 2015. Attributing cyber attacks. Journal of Strategic Studies, 38(1-2), 4-37 Salles-Loustau, G., Berthier, R., Collange, E., Sobesto, B. and Cukier, M., 2011, December. Characterizing attackers and attacks: An empirical study. In Dependable Computing (PRDC), 2011 IEEE 17th Pacific Rim International Symposium on Dependable Computing 174-183 Shaw, E., Ruby, K. and Post, J., 1998. The insider threat to information systems: The psychology of the dangerous insider. Security Awareness Bulletin, 2(98), 1-10. Shoda, Y., Mischel, W. and Wright, J.C., 1994. Intraindividual stability in the organization and patterning of behavior: incorporating psychological situations into the idiographic analysis of personality. Journal of personality and social psychology, 67(4)
PwC  88

References
Slater, C., Woodhams, J. and Hamilton-Giachritsis, C., 2015. Testing the Assumptions of Crime Linkage with Stranger Sex Offenses: A More Ecologically-Valid Study. Journal of Police and Criminal Psychology, 30(4), 261-273. Sorochinski, M. and Salfati, C.G., 2010. The consistency of inconsistency in serial homicide: Patterns of behavioural change across series. Journal of Investigative Psychology and Offender Profiling, 7(2), 109-136. Swets, J.A., 1988. Measuring the accuracy of diagnostic systems. Science, 240(4857), 1285-1293. Symantec, 2011. W32.Duqu: The precursor to the next Stuxnet. Symantec Corporation, California, USA. Available from https://www.symantec.com/content/en/us/enterprise/media/security_response/whitepapers/w32_duqu_the_precursor_to_the_next_stuxnet.pdf Tonkin, M., Grant, T. and Bond, J.W., 2008. To link or not to link: A test of the case linkage principles using serial car theft data. Journal of Investigative Psychology and Offender Profiling, 5(1-2), 59-77. Watters, P.A., McCombie, S., Layton, R. and Pieprzyk, J., 2012. Characterising and predicting cyber attacks using the Cyber Attacker Model Profile (CAMP). Journal of Money Laundering Control, 15(4), 430-441. Wheeler, D.A. and Larsen, G.N., 2003. Techniques for cyber attack attribution (No. IDA-P-3792). Institute for Defense Analyses, Alexandria, VA, USA. Woodhams, J. and Grant, T., 2006. Developing a categorization system for rapists' speech. Psychology, Crime & Law, 12(3), 245-260. Woodhams, J. and Labuschagne, G., 2012. A test of case linkage principles with solved and unsolved serial rapes. Journal of Police and Criminal Psychology, 27(1), 85-98. Zayas, V., Shoda, Y. and Ayduk, O.N., 2002. Personality in context: An interpersonal systems perspective. Journal of personality, 70(6), 851-900.
PwC  89

Thoughts, questions, feedback:
@darkartlab matt.wixey@pwc.com

At PwC, our purpose is to build trust in society and solve important problems. We're a network of firms in 157 countries with more than 223,000 people who are committed to delivering quality in assurance, advisory and tax services. Find out more and tell us what matters to you by visiting us at www.pwc.com.

This publication has been prepared for general guidance on matters of interest only, and does not constitute professional advice. You should not act upon the information contained in this publication without obtaining specific professional advice. No representation or warranty (express or implied) is given as to the accuracy or completeness of the information contained in this publication, and, to the extent permitted by law, PricewaterhouseCoopers LLP, its members, employees and agents do not accept or assume any liability, responsibility or duty of care for any consequences of you or anyone else acting, or refraining to act, in reliance on the information contained in this publication or for any decision based on it.

© 2018 PricewaterhouseCoopers LLP. All rights reserved. In this document, "PwC" refers to the UK member firm, and may sometimes refer to the PwC network. Each member firm is a separate legal entity. Please see www.pwc.com/structure for further details.

Design services 31310_PRES_04/18

PwC  90

