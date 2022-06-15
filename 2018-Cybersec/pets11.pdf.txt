Text Classification for Data Loss Prevention

Michael Hart, Pratyusa Manadhata, Rob Johnson
Symantec Research Laboratory

Text Classification for Data Loss Prevention

1

Data Loss has become a serious problem
· Data breaches cost an average of $6.6 million to an organization · Almost 500 million records with personal info have been leaked
since 2005 · Recent targets: CIA, RSA, Senate.gov · WikiLeaks
­ 250K State Department cables ­ > 70K Afghanistan War reports ­ And have a "contingency plan"
· Hacker gangs
­ Lulz Sec and Anonymous

Text Classification for Data Loss Prevention

From datalossdb.org
2

Protecting Data

Type

Description

DLP goal

Data-at-rest

Information stored on enterprise devices such as document management systems, email servers and file servers.

Scan data, identify unsecured confidential information and report.

Data-in-motion

Enterprise data contained in outbound network traffic such as emails, instant messages and web traffic.

Block transmission of sensitive data.

Data-in-use

Data currently used at the end point such as Outlook, http, https, print and file to USB.

Prevent unauthorized usage of data (e.g. copying to a thumb drive).

Text Classification for Data Loss Prevention

3

Why Machine Learning for Data Loss Prevention?
· Need for more effective approaches to stop data breaches · Downsides to current approaches
­ Impossible to describe all CI entirely in rule based formats ­ Potentially large number of documents that constantly evolve ­ Requires allowing IT staff access to sensitive materials
· Text classification
­ Long history of research and many different techniques ­ Handles unstructured data ­ Requires minimal supervised interaction
· Goal: automatically learn what is secret

Text Classification for Data Loss Prevention

4

Our use case scenario

Internet

DLP System

Enterprise Network

· Build message classifier for outgoing messages · Train on examples of private and public messages · Use classifier to detect outgoing messages with private data · Block or log outgoing messages with private data

Text Classification for Data Loss Prevention

5

Performance Metrics
· Achieve a high recall on confidential (secret) documents · Maintain a low false positive rate on both:
­ Company media (public) documents ­ Non-enterprise (NE) documents
· Constraints
­ Scale well ­ Require no metadata ­ Be agnostic to message type

Text Classification for Data Loss Prevention

6

Baseline Approach
· Simply train a standard classifier on confidential and public documents
· Employed a search for classifiers with WEKA
­ Best classifier: SVM with a linear kernel ­ Best features: Unigrams with binary weights

Text Classification for Data Loss Prevention

7

Potential issues with enterprise training data
· Suffer from high FP on NE documents · Can weight common words strongly towards secret
­ Example words: Policy, Police, Procedure, 1, Afghanistan ­ Feature behavior for public documents absent in training set
· 40% of classifiers were biased towards the secret class
­ Performed poorly for instances inadequately represented in vector space
· Underlying problem
­ Can the organization even describe what is not secret?

Text Classification for Data Loss Prevention

8

Addressing inadequate training data (Step 1)
· Better learn what is secret by supplementing
­ Add 10K supplemental instances from Wikipedia to the training set ­ Key point: do not expand feature set ­ Gives classifier more representative training set
· Better learn which features correlate with secret
· Adjust the classifier
­ Adding more instances increases false negative rate ­ Adjust decision plane within 10% of the closest TN
· Call this classifier SAprivate

Text Classification for Data Loss Prevention

9

Effect of supplementation

Public False Positive Rate

False Negative Rate

NE False Positive Rate

Text Classification for Data Loss Prevention

10

Effect of adjustment

Public False Positive Rate

False Negative Rate

NE False Positive Rate

Text Classification for Data Loss Prevention

11

Correcting for mistakes (Step 2)
· In some cases
­ Still observe FPs by NEs ­ Increased FP rate on public ­ Classifier more sensitive to knowledge domain than secret
· Train a second classifier with new features
­ Eliminate NE false positives by measuring the topical relatedness of documents
­ Address public false positives by learning what public means using an SApublic classifier
­ Change the classification decision from secret, ¬secret to secret, public and NE

Text Classification for Data Loss Prevention

12

Targeting NE false positives
· Related documents should share similar language
­ Measure amount of new vocabulary contained in document
· Introduce new attribute: xtra.infoclass where
­ class in {secret,public} ­ Percentage of words in document that exist in the document, but not in
any document labeled class ­ Only consider words with a document frequency less than 0.5%
· Hypothesis
­ A document in class should have a lower xtra.infoclass

Text Classification for Data Loss Prevention

13

xtra.infosecret comparison for NE and secret

xtra.infosecret
secret

Dyncorp Enron

Google

0.54 (0.10) 0.83 (0.09) 0.70 (0.15)

Mormon
0.49 (0.15)

NE

0.96 (0.03) 0.99 (0.02) 0.98 (0.04) 0.95 (0.08)

TM
0.66 (0.11) 0.99 (0.02)

Text Classification for Data Loss Prevention

14

Why three classes?
· NE and public false positives are topically dissimilar · Grouping together increases the variance in
­ xtra.info attributes ­ SApublic classifier
· Change the decision to NE, secret, public · Increase separability between secret and NE for xtra-infoprivate
attribute · Observe decrease in mislabeling of public documents as secret

Text Classification for Data Loss Prevention

15

SVM output + xtra.infoprivate for Dyncorp

Text Classification for Data Loss Prevention

16

Review: DLP pipeline
Training

Text Classification for Data Loss Prevention

17

Corpora for DLP

Dataset
Dyncorp TM Mormon Enron Google Wikipedia Brown Corpus Reuters-21758

Source of Sensitive Documents

Source of Public Documents

Description

WikiLeaks WikiLeaks WikiLeaks Enron Email dataset Google Product blogs

www.dyncorp.com
www.alltm.org, www.tmscotland.org www.lds.org
Enron's former website via the Wayback Machine Google PR Blogs
English Wikipedia
Press releases, reviews and books
Reuters News Service

23 private documents leaked from the military contractor Dyncorp
102 documents from high ranking officials in the Transcendental Meditation movement
Private Mormon handbook split into 1000 word chunks
399 emails labeled by Hearst et al. as businessrelated
Label product-related posts as private and public relations posts as public
10K randomly selected articles for false positive detection
500 texts selected to represent modern American English
10788 news items published by the news service

Text Classification for Data Loss Prevention

18

Results: Error rates

FN Rate

FP public

1.6%

0.46%

Text Classification for Data Loss Prevention

FP NE
~0.0%

FDR
0.47%
19

False positive rate on other NE corpora

Text Classification for Data Loss Prevention

20

Outstanding research questions
· Given a set of documents, how well will it work in deployment?
­ If it performs poorly, can I fix it?
· What about sensitive documents that are not classified well?
­ Likely scenario: new project initial documents
· What if I am given a large number of diverse documents? · Intra-organizational DLP? · What about this document is confidential?
­ Can we highlight, redact, sanitize?
· Sensitivity score? · What can I do for my Smartphone?

Text Classification for Data Loss Prevention

21

Conclusion
· An algorithm to train text classifiers for DLP
­ Enhance the text classification process to prevent data loss ­ Add supplemental examples to better understand what is secret ­ First step filters out majority of FPs generated by non-enterprise
documents ­ Employs a second classifier with contextual information
· Approach motivated by understanding and modeling the data
­ Confidential documents do contain publically known entities ­ Are the salient features ­ But can cause false positives ­ It is the relationship between these entities that must be protected

Text Classification for Data Loss Prevention

22

Thank you!
Michael Hart Michael_Hart@symantec.com

Copyright © 2011 Symantec Corporation. All rights reserved. Symantec and the Symantec Logo are trademarks or registered trademarks of Symantec Corporation or its affiliates in the U.S. and other countries. Other names may be trademarks of their respective owners.
This document is provided for informational purposes only and is not intended as advertising. All warranties relating to the information in this document, either express or implied, are disclaimed to the maximum extent allowed by law. The information in this document is subject to change without notice.

Understanding language to protect assets

23

