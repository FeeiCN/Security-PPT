#RSAC
SESSION ID: OST-R05
xGitGuard: ML-Based Secret Scanner for GitHub
Bahman Rashidi, Ph.D.
Director , Cybersecurity & Privacy Engineering Research Comcast

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA® Conference, RSA Security LLC or any other co-sponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Security LLC or its affiliates. All rights reserved. RSA Conference logo, RSA and other trademarks are trademarks of RSA Security LLC or its affiliates.
2
Public (P)

#RSAC
Overview

xGitGuard
Accuracy Open-source Scalability

All images in this slide are from : https://unsplash.com/

3

Public (P)

Existing Approaches
 TruffleHog1  Detect high-entropy text
 Gitguardian1  Detects secrets using Regex classifiers
 EarlyBird  Detects specific patterns in files
 NightWatch  Entropy-based detection

#RSAC
Limitations with existing works:
- User decides the repos - Regex-based detection - Relying on entropy - Exclusively cover API keys - Scalability

1. S. Lounici, "Optimizing Leak Detection in Open-source Platforms with Machine Learning Techniques,"

in 7th International Conference on Information Systems Security and Privacy, Vienna, Austria, 2021.

4

Public (P)

#RSAC
xGitGuard
Introduction

#RSAC
xGitGuard

DETECT EXPOSED SECRETS

GITHUB

AI ENGINE

ACCURATE & SCALABLE

6
Public (P)

#RSAC
What Secrets?

CREDENTIALS
· Username & passwords · Server credentials · Account credentials

TOKENS / KEYS
 Service API tokens (AWS, Azure, etc)
 Encryption keys

7
Public (P)

#RSAC
Workflow

Search GitHub at
Scale

Detect & Extract Secrets

Validate Secrets

Filter Results

Developer Identification

Submit for Remediation

8
Public (P)

#RSAC
Architecture
Main components

Validation

#RSAC
Credential Detection
10
Public (P)

#RSAC
Credential Detection
11
Public (P)

#RSAC
Credential Detection
Copyright 2021 abc.xyztest.test
Primary Keyword
Secondary Keyword
password = "abcd123"
12
Public (P)

#RSAC
Credential Detection
13
Public (P)

#RSAC
Credential Detection
14
Public (P)

Validation

#RSAC
Credential Detection
15
Public (P)

Validation

#RSAC
Token/Key Detection
16
Public (P)

#RSAC
Token/Key Detection
17
Public (P)

#RSAC
ML-based Validation Model
Validation model details

#RSAC
Validation Model

Data

Historical detections

Prepare

· Cleaning · Labeling

Build

· Feature engineering
· Training & testing

Deploy

Validation

- Ngrams similarity to TPs - Ngrams similarity to FPs - Context-based
- Line contains secondary keyword - Extension - Language - Textual features
19
Public (P)

#RSAC
Use and Deployments
xGitGuard is fully open-sourced: https://github.com/Comcast/xGitGuard Documented with details:
­ Installation ­ Configuration ­ Different deployments are covered
20
Public (P)

#RSAC
Use and Deployments

GH/GHE
GH API Calls xGG
Scanner
(a) Live scanner

GHE

GH/GHE

xGG Prereceive Hook Githook
Git Push (b) Deploy as a Githook

Git Push xGG Local Scanner
(c) Locally scan repos and files

21
Public (P)

#RSAC
Apply
Train your developers Pro-actively detect secret exposures
­ Internally and externally
Have a clear remediation plan Equip development teams with usable secret management services Mandate reviews on code version control platforms Rotate secrets periodically
22
Public (P)

#RSAC
Thank you!
23
Public (P)

