· Microsoft Defender Research
· Past: Threat Intelligence and APT response
· Present: Builds algorithms to classify malware in real-time
· Future: ??

Threat Analysis is largely manual work
· Not just automated IOC feeds · Some Reverse Engineering, Forensics · Lots of... READING!!
Alphaspirit/Shutterstock.com

https://www.fireeye.com/content/dam/fireeye-www/global/en/current-threats/pdfs/rpt-apt28.pdf https://www.symantec.com/blogs/threat-intelligence/dragonfly-energy-sector-cyber-attacks https://www.csoonline.com/article/3321911/security/russian-cozy-bear-apt-29-hackers-may-be-impersonating-state-department.html

Shoebox of Tools, Tactics and Procedures

APT 28
Data Obfuscation, Connection Proxy, Standard Application Layer Protocol, Remote File Copy, Rundll32 ,Indicator Removal on Host, Timestomp, Credential Dumping, Screen Capture, Bootkit, Component Object Model Hijacking, Exploitation for Privilege Escalation, Obfuscated Files or Information, Input Capture, Replication Through Removable Media, Communication Through Removable Media, Pass the Hash, Data Staged, Data from Removable Media, Peripheral Device Discovery, Access Token Manipulation, Valid Accounts, Office Application Startup, System Owner/User Discovery, Process Discovery, System Information Discovery, File Deletion, Credentials in Files, File and Directory Discovery, Network Sniffing, Dynamic Data Exchange, Data from Local System, Hidden Files and Directories, Scripting, Logon Scripts, Spearphishing Attachment, Deobfuscate/Decode Files or Information, Exploitation of Remote Services, Exploitation for Defense Evasion, Data from Information Repositories, User Execution

APT 29
PowerShell, Scripting, Indicator Removal on Host, Software Packing, Scheduled Task, Registry Run Keys / Start Folder, Bypass User Account Control, Windows Management Instrumentation Event Subscription, Windows Management Instrumentation, Pass the Hash, Accessibility Features, Domain Fronting ,Multi-hop Proxy, Spearphishing Attachment, Spearphishing Link, Exploitation for Client Execution, User Execution

Dragonfly
Screen Capture, PowerShell, Remote File Copy, File Deletion, Create Account, Disabling Security Tools, External Remote Services, Brute Force, Credential Dumping, Scripting, Masquerading, Indicator Removal on Host, Web Shell, Commonly Used Port, Email Collection, Remote Desktop Protocol, Network Share Discovery, Scheduled Task, Forced Authentication

Dragonfly

APT29

APT28
Graph of Techniques used by /bear/APTs
https://mitre-attack.github.io/caret/#/

Prioritize

Dragonfly

Deprioritize

APT29

APT28

Graph of Techniques used by /bear/ APTs with prevalence of each technique
https://mitre-attack.github.io/caret/#/

Can this be done by machine learning?

Input
· Written material · Blogs · Whitepapers · Incident Response
reports

{black box}
· Extract actor names · Extract tools names · Extract techniques · Extract
relationships

Output
· Attacker graphs · Timelines

Agenda
 Introduce the idea of Named Entity Extraction  Build a machine learning/deep learning based Cyber Entity Extractor
 Training Data  Feature Extraction  Architecture and Models  Evaluation
 Demo  Driving Impact

What is Named Entity Extraction?

Sansa Stark: PERSON Eddard Stark: PERSON Catelyn: PERSON Winterfell: ORGANIZATION (GEOPOLITICAL ENTITY)
https://gameofthrones.fandom.com/wiki/Sansa_Stark

Dropping Elephant: BADACTOR Chinastrats: BADACTOR Patchwork: BADACTOR spear-phishing: TECHNIQUE watering hole: TECHNIQUE
https://securelist.com/the-dropping-elephant-actor/75328/

Training our own Cyber Entity Extractor

Training Data

Feature Extraction

Architecture Assessments

Training Data
 APT Notes
 Public threat intelligence blogs collected since June 2018
 2704 Documents
 On average, ~1% of the tokens are "interesting"

Training Data
 Labels: Caret Dataset (MITRE)
 Automatically annotated using longest extent pattern matching
 Kinda noisy, but best we can do short of manual annotation

Training Data

Numbered Panda (also known as IXESHE, DynCalc, DNSCALC, and APT12) is a cyber espionage group believed to be linked with the Chinese military.

('Numbered', 'B-BADACTOR'), ('Panda', 'I-BADACTOR'), ('(', 'O'), ('also', 'O'), ('known', 'O'), ('as', 'O'), ('IXESHE', 'B-BADACTOR'), (',', 'O'), ('DynCalc', 'B-BADACTOR'), (',', 'O'), ('DNSCALC', 'B-BADACTOR'), (',', 'O'), ('and', 'O'), ('APT12', 'B-BADACTOR'), (')', 'O'), ('is', 'O'), ('a', 'O'), ('cyber', 'O'),

('espionage', 'O'), ('group', 'O'), ('believed', 'O'), ('to', 'O'), ('be', 'O'), ('linked', 'O'), ('with', 'O'), ('the', 'O'), ('Chinese', 'O'), ('military', 'O'), ('.', 'O')

Training our own Cyber Entity Extractor

Training Data

Feature Extraction

Architecture Assessments

Feature Extraction
 Traditional
 Word itself  Part of speech  Lemma  Word type (alphanumeric, digits, punctuation)  Orthographic features (lowercase, ALLCAPS,
Upper initial, MiXedCaPs etc.)
 Unsupervised
 Word Embeddings

Generic Word Embeddings

sofacy apt29

dymalloy
apt28

Of the 5 vectors closest to "apt28", 2 are aliases (sofacy and tg-4127) and 2 are related by attribution

tg-4127

dogcall
pooraim shutterspeed

ruhappy

slowdrift

Dogcall, ruhappy, pooraim and shutterspeed are all malware used by APT37

Tokens occurring in techniques Tokens occurring in Actor Names Tokens occurring in Malware Names

Training our own Cyber Entity Extractor

Training Data

Feature Extraction

Architecture Assessments

Architecture
Blogs, White Papers,
IR Reports
HTML and PDF Parsers
Text Preprocessing
Word embeddings (word2vec)

Labeled training
data
Custom Feature Extraction

Labeled test data

Word Embedding Features

Custom Feature Extraction

Word Embedding Features
FIT TEST

Model (CRF or LSTM)

Conditional Random Fields (CRF)
 Statistical modeling method
 Not Deep Learning
 Used for sequence labeling tasks.
 Commonly used in Natural Language processing, biological sequences and computer vision
 Has short term memory
 2 Experiments with CRF (one with and one without the word embeddings)

Long Short-term Memory (LSTM)
· Special type of RNN · 2 Stacked Bidirectional LSTM Layers · With Dropout

Embedding Layer Output Shape: None, 75, 100 Bidirectional (LSTM) Output Shape: None, 75, 300
Dropout Output Shape: None, 75, 100

· Categorical Cross Entropy Loss Function

Bidirectional (LSTM) Output Shape: None, 75, 300

· Softmax activation for the final layer

Dropout Output Shape: None, 75, 100

· Keras + tensorflow

Timedistributed (dense) Output Shape: None, 75, 300

Training our own Cyber Entity Extractor

Training Data

Feature Extraction

Architecture Assessments

Assessment

Technique Malware Actor 0

942 876 840
966

Recall Counts

1885 2071 2087

2417

LSTM CRF Without Embeddings CRF With Embeddings Actual

2294 2396

3009

3500

500

1000

1500

2000

2500

3000

3500

4000

Assessment
OVERALL PRECISION AND RECALL
CRF With Embeddings CRF Without Embeddings LSTM

Precision = TP/(FP+TP) Recall = TP/(TP+FN)
PRECISION AND RECALL FOR UNSEEN TOKENS
CRF With Embeddings CRF Without Embeddings LSTM

0.99 0.98 0.93 0.76 0.74 0.93 1 0.47 0.84 0.22 0.03 0.07

POSITIVE PRECISION

POSITIVE RECALL

POSITIVE PRECISION

POSITIVE RECALL

Demo
udi Steinwell via PikiWiki - Israel free image collection project. CC Attribution 2.5 Generic

CCO 1.0 https://picryl.com/media/fish-kids-clip-art-people-b9882d

Next Steps...
· Attention networks · Data Augmentation · Sophisticated Relationship
Extraction · Temporal relationships

Driving Impact

Prioritize

Dragonfly

Deprioritize

APT29

APT28

Graph of Techniques used by /bear/ APTs with prevalence of each technique
https://mitre-attack.github.io/caret/#/

Emotet

Saffron Rose Stone Panda Snake Muddywater
Hangover

Emissary Panda

Overlap in techniques used by commodity malware vs APTs

In conclusion

 Move beyond IOC feeds
 Rich unstructured data can be extracted with Machine Learning
 Graphs  Timelines
 We can use this to make better decisions to improve security of our orgs

Acks/Q&A/Thanks
 Contributors:
 Arun Gururajan, Daewoo Chong and Jugal Parikh for Data Science Expertise
 Peter Cap and Jessica Payne for Threat Intelligence Expertise
 Chris Ackerman for the demo website  Karen Lavi for encouragement, better
presentation
bhavna.soman@microsoft.com @bsoman3

CC BY 2.0 https://www.flickr.com/photos/signote/6102820227

