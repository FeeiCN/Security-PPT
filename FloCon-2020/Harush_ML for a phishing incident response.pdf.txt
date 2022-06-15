How to Use Machine Learning for a Phishing Incident Response
Erez Harush
Demisto, Palo Alto Networks FloCon 2020

WHOAMI
Erez Harush
Palo Alto Networks, Demisto Data scientist
2 | © 2019 Palo Alto Networks, Inc. All Rights Reserved.

Agenda
· Introduction to phishing incidents and response processes at SOC teams · Phishing problem definition · Datasets used · Process followed to build the model · Model deployment · Q&A
3 | © 2019 Palo Alto Networks, Inc. All Rights Reserved.

Phishing Incidents and Response Processes at SOC Teams

· What is a phishing alert?
· User receives a suspicious
email, so forwards it to phishing@organization.com
4 | © 2019 Palo Alto Networks, Inc. All Rights Reserved.

· What happens behind the scenes?
· SOC (security operation center) analyst is assigned to investigate the suspicious email

Classic Phishing Handling Process

1 2 345 6

EXTRACT URLs/ HASH/DOMAINS
FROM ATTACHMENTS, EMAIL BODY &
HEADERS

ENRICH THOSE WITH THREAT INTEL SERVICES (VIRUSTOTAL)

SEND ATTACHMEN
T TO SANDBOX

LOOK AT THE EMAIL BODY CONTENT AND
HEADER

DECIDE IS IT: MALICIOUS/SPAM/
SCAM/ VALID

RESPOND TO USER

5 | © 2019 Palo Alto Networks, Inc. All Rights Reserved.

Classic Phishing Handling Process
1 2 345 6

6 | © 2019 Palo Alto Networks, Inc. All Rights Reserved.

SOC teams waste a significant amount of time investigating these emails

Goals Definition
1 2 345 6

7 | © 2019 Palo Alto Networks, Inc. All Rights Reserved.

 Decrease the amount of time to make a decision  Help the analyst make a better decision

Datasets
· Valid · Scam · Spam · Malicious
· We collected ~100K labeled emails from 10 different customers · All the emails are suspicious emails, other than the most
email gateway datasets
8 | © 2019 Palo Alto Networks, Inc. All Rights Reserved.

Process Followed to Build the Model
· Research: email headers, IOCs, email body · Text classification model: FastText (word embedding & NN) · Explainability - highlighting important words, using Lime
https://github.com/marcotcr/lime
· We aimed for at least 80% precision. Remember SOC teams are not 100% correct with their alerts decisions!
9 | © 2019 Palo Alto Networks, Inc. All Rights Reserved.

Example: Customer A
· Categories: Malicious, Other · Precision & Recall: ~95% for each class

True

Malicious Other All

Malicious 722 18 740

10 | © 2019 Palo Alto Networks, Inc. All Rights Reserved.

Predicted Other 45 317 362

All 767 335 1102

~95% ~95%

Example: Customer B

· Categories: Malicious, Valid, Spam
Precision is high, but the coverage is very low Model confidence is low for malicious emails

Probability > 0.85

Predicted

Valid

Malicious

Spam

All

True

Valid

74 60% 0

9

83

Malicious

2

24

14

40

Spam

6

3

291

300

All

82

27

314

423

Predicted True Valid
Malicious
Spam
All

Valid
48 0 2 50

Malicious
0 6 1 7

Spam

All

2 75% 50

3

9

25625% 259

261

318

11 | © 2019 Palo Alto Networks, Inc. All Rights Reserved.

Combine Internal Datasets
· Text normalization using SpaCy · Word lemmatization · Replace email addresses a const string · Replace URLs with a const string
· Fine tuning of a pre-trained model (based on internal datasets) using the customer data

Example: Customer B

Original confusion matrix

Predicted

Valid

Malicious

Spam

All

True

Valid

74

0

9

83

Malicious

2

24

14

40

Spam

6

3

291

300

All

82

27

314

423

13 | © 2019 Palo Alto Networks, Inc. All Rights Reserved.

Combine other customer data Probability > 0.85

Predicted

Valid

Malicious

Spam

All

True

Valid

48

5

Malicious

1

25

1

54

25%

2

30

Spam

1

All

50

5

215

221

25%

30

218

303

Precision ~96%

~83% ~98%

Coverage ~88% ~83% ~97%

Model Deployment
· We support 2 ways of using our phishing models:
a. Building a dedicated model based on a specific customer env
within Demisto on a permanent env
· Supervised · Semi-Supervised
a. Upon request, Demisto DS builds a model and deploys it within
Demisto
14 | © 2019 Palo Alto Networks, Inc. All Rights Reserved.

Using a Model in Demisto
· Use as part of scoring/severity set · Close incidents automatically with probability > THRESHOLD · Handle incidents that were not handled in the past due to low capacity
15 | © 2019 Palo Alto Networks, Inc. All Rights Reserved.

Using a Model in Demisto
16 | © 2019 Palo Alto Networks, Inc. All Rights Reserved.

Building a Model in Demisto Platform
17 | © 2019 Palo Alto Networks, Inc. All Rights Reserved.

Q&A

THANK YOU
Email: eharush@paloaltonetworks.com l Twitter: @PaloAltoNtwks

