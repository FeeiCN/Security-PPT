SESSION ID: MLAI-W10
Machine Learning Toolbox for Cybersecurity Risk Management
Bugra Karabey
Senior Risk Manager Microsoft
#RSAC

Cybersecurity risk manager has no clothes!

#RSAC
Cybersecurity risk manager has no clothes!
Cybersecurity risk manager is lacking the cutting-edge tools of the trade Current state:
­ Subjective risk evaluations based on subject matter expert interviews ­ Limited data driven risk assessment methodologies ­ Qualitative rather than quantitative datapoints ­ 1-to-5 scores for impact and likelihood ­ Focus on known-knowns
3

Cybersecurity risk management & machine learning

#RSAC

Machine Learning (ML) usage is already ubiquitous in cybersecurity:
­ Log, telemetry, and traffic pattern analysis ­ Anomaly detection ­ Behavior analytics
However, for the identification and assessment of dormant/latent risk themes, patterns, and relationships, additional machine learning tools (and mostly Natural Language Processing flavored variants) will be useful:
­ As the insights reside within text heavy datasets
o Internal audit issues o Governance Risk Compliance (GRC) security findings o Security policy exceptions o Internal & external incidents
­ Natural language driven ­ Artifacts may be at the board room discussion level, rather than technically focused
In this talk we will be covering some of these scenarios. These are applied in parallel to, and in support of the subject matter expert driven analysis, qualitative/quantitative assessments, and the conventional business analytics. They do not intend to replace these traditional approaches

4

#RSAC
"Every risk manager needs a machine learning toolbox"
In this talk, we will be covering 3 scenarios in which a cybersecurity risk manager can benefit from machine learning techniques:
­ Scenario #1: How to identify top risks using Topic Modelling? ­ Scenario #2: How to identify latent/emerging risks using NLP (Natural
Language Processing)? ­ Scenario #3: How to identify risk management process issues using PCA
(Principal Component Analysis) clustering?
5

Scenario #1: How to identify top risks using Topic Modelling?

Usage scenario: How to identify top risks using Topic

#RSAC

Modelling?

Topic Modelling: Statistical model for discovering the abstract "topics", and the discovery of hidden semantic structures in a collection of documents. It is an unsupervised statistical modeling technique used for finding out a group of words, which collectively represent a topic in a large collection of documents
­ Most popular Topic Modelling techniques:
o Latent Semantic Analysis (LSA)
o Latent Dirichlet Allocation (LDA)
· LDA builds topic per document and words per topic models, that are modeled as Dirichlet distributions

7

#RSAC
How to identify top risks using Topic Modelling?
Suggested text mining pre-processing steps before Topic Modelling: Tokenization (chopping up sentences, and throwing away punctuation), stop-words removal, lemmatization (converting to base form), and stemming (converting to root form)
LDA user settings:
­ # of topics -> How many latent topics do we need to explain x% of the variance in the data
­ User entered model settings will be: "Identify x topics, with y words/phrases in each topic"
Tools utilized: LDA and TM (text mining) packages in R
8

#RSAC
How to identify top risks using Topic Modelling?
Our workflow:

· Security Findings · Policy Exceptions · Audit Issues · Incident Reports

Data pre-processing using tokenization, stop-words removal, lemmatization, and
stemming
(using the TM package in R)

Topic Modelling
(using the LDA package in R)

Top risk themes / categories

9

Sample output

Topic 1
Brute force
App Z
MFA Monitor
Confidential Breach

Topic 2
Subnet
Network environment NIC System Y
Dual homed Isolation

Topic 3
Crypto
Multiple certificate Asymmetric Server Q
PKI FIPS140

Topic 4
Misconfiguration
PKI server

Topic 5
Cloud hijacking
PaaS

Sensitive
Configuration management Dept X
Confidential

Encrypt at rest Service P
Disclosure Backup

Potential interpretation:
System Y is suffering from an isolation issue, due to the existence of dual-homed interfaces between subnets and/or network environments
10

#RSAC
LDA identified words/phrases for each topic

Scenario #2: How to identify latent/emerging risks using Natural Language Processing (NLP)?

Usage scenario: How to identify latent/emerging risks #RSAC using Natural Language Processing?
Experimental NLP based approaches in the identification of latent and emerging risk categories:
o Word Embeddings o LSTM (Long-short term memory) Deep RNNs (Recurrent Neural Nets)
12

#RSAC
Word Embeddings
Word Embeddings in a nutshell:
­ Unsupervised learning algorithm for obtaining vector representations for words. Training is performed on aggregated global word-word co-occurrence statistics from a body/corpus, and the resulting representations showcase interesting linear substructures of the word vector space* :

Our approach:
­ Create a Word Embedding space using corpora of security documents/datasets to build the word vector space ­ Further analysis using 2 & 3D principal component analysis
Tools utilized: Python gensim, nltk, sklearn packages, Jupyter notebooks, and Word2Vec module with the skip-gram algorithm**.

* https://nlp.stanford.edu/projects/glove/

13

** https://radimrehurek.com/gensim/models/word2vec.html

Word Embeddings
Our workflow:

Our corpora is based on security related documents/datasets (findings, exceptions, issues, incidents)

Building the Word
Embedding model using this
corpora
(genism, nlth, sklearn packages & word2vec
module with skipgram algorithm)

#RSAC

2D PCA conversion and mapping

Analysis of the clusters and cosine
similarities to identify latent risk
scenarios

14

Sample output
Asset A Asset B Asset C

Vulnerability X Vulnerability Y Vulnerability Z

#RSAC

Threat Actor P Threat Actor Q Threat Actor R
model.most_similar(positive=[`VulnX', `AssetC'], negative=[`AssetA'] , topn=1)
­ [(`VulnZ', 0.7543)]
model.doesnt_match("supplier secret encryption brute".split())
­ `supplier'
By analyzing the word embedding space (reduced to 2D or 3D), the user can identify the clusters and the latent relationships between entities (like assets, actors, and vulnerabilities)
15

LSTM (Long-short term memory) Deep RNNs (Recurrent #RSAC Neural Nets)

LSTM- RNNs in a nutshell*:
ht

ct-1

x

+

ct

x

tanh

  tanh

ht-1

x

ht

xt

­ Long Short-Term Memory (LSTM), Recurrent Neural Net cell can process data

sequentially and keep its hidden state through time

­ Our approach:

o Text generation using LSTM-RNNs**

o By utilizing an LSTM-RNN trained on a body/corpus of security findings

­ Tools utilized: Keras (with Tensorflow or CNTK as the backend), Jupyter notebooks

* http://people.idsia.ch/~juergen/rnn.html ** http://karpathy.github.io/2015/05/21/rnn-effectiveness/

16

LSTM (Long-short term memory) Deep RNNs (Recurrent #RSAC Neural Nets)
Our workflow:

Security Findings dataset

Build the
LSTM RNN
with this
body/corpus
(using Keras with one of the Deep Neural Net backends)

Querying the model with user "seed"
phrase entries

Analysis of the generated content
in order to identify dormant
risk themes

17

#RSAC
Sample output
User enters seed phrases, and the LSTM RNN completes the sentence/argument:
­ Seed -> isolation
o Generated output -> isolation issues with the system xyz ...
­ Seed -> encryption
o Generated output -> encryption algorithm ABC and the expired certificate ....
18

Scenario #3: How to identify risk management process issues using PCA clustering?

Usage scenario: How to identify risk management

#RSAC

process issues using PCA clustering?

An example from the incident response domain: There may be security incident response process issues (or even incident patterns) that can be identified using PCA clustering

PCA: Dimensionality reduction using a statistical procedure
o Orthogonal transformation to convert a set of observations, into a set of linearly uncorrelated variables (e.g., start with a dataset that has 100 features, and minimize it to 5 principal components that expresses the data in terms of these new variables)

Our approach:
­ Analysis of the "security incidents" dataset using PCA dimensionality reduction (2d and/or 3d)
­ Identification of incident responder profiles and latent process issues

Tools utilized: PCA and ggplot2 (data visualization) packages in R

20

#RSAC
PCA clustering
Our workflow:

Security Incidents dataset

3D Principal
Components
Analysis
(using PCA and ggplot2 packages in R)

Analysis of the clusters to identify incident patterns
or responder profiles

21

#RSAC
Sample output
* *
*
Interpretation: Incidents are clustered in 3 sets. This may indicate a certain pattern (with an underlying root cause to be investigated) in incident occurrences, or alternately may also indicate different behavioral patterns among the incident responders
* Axes represent the first 3 principal components that define this dataset
22

Conclusion

#RSAC
"Every risk manager needs a machine learning toolbox"
We covered 3 scenarios in which a Cybersecurity Risk Manager can benefit from Machine Learning techniques:
­ Scenario #1: How to identify top risks using Topic Modelling? ­ Scenario #2: How to identify latent/emerging risks using Natural
Language Processing? ­ Scenario #3: How to identify risk management process issues using PCA
clustering?
24

#RSAC
Direct applicability of each scenario
Topic modelling can be applied to any text heavy risk management dataset (incidents, security/audit findings, exceptions, etc.) to identify the key themes Clustering helps identify the patterns and relationships within these risk management datasets, that may not be immediately visible to the analyst Experimental utilization of word embeddings, and text generation using LSTM RNNs, may help the analyst identify emerging risk trends, latent/dormant relationships, or themes in these documents
25

#RSAC
"Every risk manager needs a machine learning toolbox"
These tools and approaches:
­ Do NOT offer a silver bullet, magic wand, or a crystal ball ­ They help and support the analyst identify dormant/latent themes,
patterns, and relationships ­ They require a human (cybersecurity risk manager) in the loop
26

#RSAC
"Apply" slide
Suggested immediate actions:
­ Identification of in-house risk relevant datasets
Suggested action items within 3 months:
­ Application of Topic Modelling, NLP, and PCA analysis on these datasets
­ Suggested tools: Keras, Jupyter notebooks, Word2Vec, R (tm, lda, ls, pca, ggplot2 packages)
­ Utilize these scenarios as part of the enterprise risk review cadence
27

Q&A
Bugra Karabey bugrak@microsoft.com

