Multi-dimensional malware similarity will let you catch up with malware developers
Kunihiko Yoshimura, Koji Yamada, Toshitaka Satomi, and Ryusuke Masuoka
Fujitsu System Integration Laboratories

Outline

· Introduction

· S4 vs. Malware Families

· Difficulty with Malware Analysis

· Match Rules

Operations

· S4 Won All the Matches!

· Similarity Tool to Rescue

· Exhibition Match: Olympic Destroyer

· A Single Similarity Tool Is No Match · Conclusion · Road to the Proposed Solution · Future Plan

· Initial Struggles

· Take Home Message

· Bunch of Similarity Tools

· Three Dimensions for Human Analysts

· Sample Similarity Scoring System (S4)

Copyright 2018 Fujitsu System Integration Laboratories

Outline

· Introduction

· S4 vs. Malware Families

· Difficulty with Malware Analysis

· Match Rules

Operations

· S4 Won All the Matches!

· Similarity Tool to Rescue

· Exhibition Match: Olympic Destroyer

· A Single Similarity Tool Is No Match · Conclusion · Road to the Proposed Solution · Future Plan

· Initial Struggles

· Take Home Message

· Bunch of Similarity Tools

· Three Dimensions for Human Analysts

· Sample Similarity Scoring System (S4)

Copyright 2018 Fujitsu System Integration Laboratories

Difficulty with Malware Analysis Operations
· Attackers continue to develop new pieces of malware at an alarming rate
· "Conficker" "CryptoWall" "Badrabbit" "HackerDefender" "Hiddad" "HummingBad" "Necurs" "Nivdort" "Sality" "Triada" "Zeus" "Locky" "CoinHive" "Ramnit" "Fireball" "Pushdo" ...
· Analysts cannot keep up with the pace
Copyright 2018 Fujitsu System Integration Laboratories

Similarity Tool to Rescue

Before...

Malware Analysis Operation Timeline

Unknown Malware Reported (Known) Malware

Surface Analysis Dynamic Analysis Static Analysis Copyright 2018 Fujitsu System Integration Laboratories

Similarity Tool to Rescue, but...

After

Malware Analysis Operation Timeline

Similar!

Unknown Malware Reported (Known) Malware

Surface Analysis Dynamic Analysis Static Analysis Copyright 2018 Fujitsu System Integration Laboratories

A Single Similarity Tool Is No Match

Similarity Tool

Evasion Technique

· Fuzzy hashing (ex. ssdeep, SDHASH) <= XOR cipher

· Static Analysis (ex. Section Matching, BinDiff)

<= Packers

· Dynamic Analysis (ex. Techniques using Created Processes, APIs/DLL Calls)

<= Anti-Sandbox

 A Single Similarity Tool Can Be Easily Evaded

Copyright 2018 Fujitsu System Integration Laboratories

Outline

· Introduction

· S4 vs. Malware Families

· Difficulty with Malware Analysis

· Match Rules

Operations

· S4 Won All the Matches!

· Similarity Tool to Rescue

· Exhibition Match: Olympic Destroyer

· A Single Similarity Tool Is No Match · Conclusion · Road to the Proposed Solution · Future Plan

· Initial Struggles

· Take Home Message

· Bunch of Similarity Tools

· Three Dimensions for Human Analysts

· Sample Similarity Scoring System (S4)

Copyright 2018 Fujitsu System Integration Laboratories

Score Transformation

· Piecewise linear transformation (PLT) to enhance malware family separation

DLL Jaccard

DLL Jaccard (Transformed)

Tool Output (%) Tool Output (points)

×



# of Malware Samples (Cumulative)

Piecewise Linear Transformation Copyright 2018 Fujitsu System Integration Laboratories

Original Metrics by Cosine Similarity Tools

API
GetProcAddress
Connect Hook LoadLibrary
Feature Vector

Ex. Call API Cosine

...

Malware X 44 3 1 31 ...



Malware Y 22 11 1 30 ...









cos 

=

 

  ||

=

0.8866

Similarity Metric

Copyright 2018 Fujitsu System Integration Laboratories

Bunch of Similarity Tools

ssdeep SDHASH entropy Section Match Import DLL Call API Call DLL Process Tree API Cosine API n-gram Cosine

Transformed Score 0/10 0/10
45/135 0/10 42/50 31/50 39/50 30/30 42/50 31/50

Ten Dimensions???

Copyright 2018 Fujitsu System Integration Laboratories

Three Dimensions for Human Analysts

· Higher the Dimensions, Harder to Evade
· Highest # of Dimensions for Human to Handle -> 3!

Two Dimensions

Three Dimensions

Copyright 2018 Fujitsu System Integration Laboratories

Similarity Metrics into Three Dimensions

ssdeep SDHASH entropy Section Match Import DLL Call API Call DLL Process Tree API Cosine API n-gram Cosine

Transformed Score 0/10 0/10
45/135 0/10 42/50 31/50 39/50 30/30 42/50 31/50

Integrated Score
Surface Score: 40 (87/215)
Dynamic Score: 77 (100/130)
Geometric Score: 73 (73/100)

Copyright 2018 Fujitsu System Integration Laboratories

Geometric Dynamic Surface

Sample Similarity Scoring System (S4)
For a given unknown malware  Similar malware ranking in each dimension
Copyright 2018 Fujitsu System Integration Laboratories

Outline

· Introduction

· S4 vs. Malware Families

· Difficulty with Malware Analysis

· Match Rules

Operations

· S4 Won All the Matches!

· Similarity Tool to Rescue

· Exhibition Match: Olympic Destroyer

· A Single Similarity Tool Is No Match · Conclusion · Road to the Proposed Solution · Future Plan

· Initial Struggles

· Take Home Message

· Bunch of Similarity Tools

· Three Dimensions for Human Analysts

· Sample Similarity Scoring System (S4)

Copyright 2018 Fujitsu System Integration Laboratories

Collect Tag

Match Rules

VirusTotal

AlienVault OTX

120 WannaCry

212 CERBER

S4

Unknown Malware

Untag 25 Samples Each

75 Upload

Calculate!

S4 Database
95 WannaCry
187 CERBER

19,709 Samples

19,377 Other 25 Samples

19,352 Other

type: pe, positives: 4+, sources: 5+, first seen from 1st Jan 2017 to 31st May 2017

Add the Rest to S4 Database

S4 Wins When It Shows Ones from the Same Family  50% in Those with Scores  90

Copyright 2018 Fujitsu System Integration Laboratories

Similar Malware Ranking for "unknown01.exe"

Rank Surface Similarity

1

g568.x86.ca.1000.exe (Other): 79

Dynamic Similarity
read.php (CERBER): 98

Geometric Similarity
<sha256>.bin (CERBER): 99

2

04958pg.jpeg.exe (Other): 79

read.exe (CERBER): 98

<MD5>.virus (CERBER): 99

3

SETUP-VW.EXE (Other): 78

<sha256>.bin (CERBER): 95

2.exe (CERBER): 99

4

CmbShowHis.EXE (Other): 77

rigamfu.exe (CERBER): 92

voperseanx.exe (CERBER): 99

5

AutoCAD_Setup.exe (Other): 76

DW20.Exe (CERBER): 90

<MD5> (CERBER): 99

6

tpad109.exe (Other): 76

user.phpf1.gif.exe (CERBER): 90

cerber.exe (CERBER): 99

7

your.exe (Other): 76

<MD5>.virus (CERBER): 90

cerber2.exe (CERBER): 99

8

your.exe (Other): 76

zzz.exe (CERBER): 90

dsconfig.exe (CERBER): 99

9

M3Apnda2.exe (Other): 76

1.EXE (CERBER): 90

exe1.exe (CERBER): 99

10

f5aauicn.exe (Other): 75

003.exe (CERBER): 89

exe1.exe (CERBER): 99

All (100%) of 19 Samples with Scores  90 Are CERBER Family

 90

-> S4 Wins the Match!

< 90

Copyright 2018 Fujitsu System Integration Laboratories

S4 Won All the Matches!

Malware
CERBER WannaCry Other

# of Samples # of S4 Wins Winning Rate

25

25

100%

25

25

100%

25

25

100%

Copyright 2018 Fujitsu System Integration Laboratories

Similar Malware Ranking for "unknown01.exe"

Rank
1 2 3 4 5 6 7 8 9 10

Surface Similarity
g568.x86.ca.1000.exe (Other): 79 04958pg.jpeg.exe (Other): 79 SETUP-VW.EXE (Other): 78 CmbShowHis.EXE (Other): 77 AutoCAD_Setup.exe (Other): 76 tpad109.exe (Other): 76 your.exe (Other): 76 your.exe (Other): 76 M3Apnda2.exe (Other): 76 f5aauicn.exe (Other): 75

Dynamic Similarity
read.php (CERBER): 98 read.exe (CERBER): 98 <sha256>.bin (CERBER): 95 rigamfu.exe (CERBER): 92 DW20.Exe (CERBER): 90 user.phpf1.gif.exe (CERBER): 90 <MD5>.virus (CERBER): 90 zzz.exe (CERBER): 90 1.EXE (CERBER): 90 003.exe (CERBER): 89

Geometric Similarity
<sha256>.bin (CERBER): 99

<MD5>.virus (CERBER): 99

2.exe (CERBER): 99

voperseanx.exe (CERBER): 99

<MD5> (CERBER): 99

cerber.exe (CERBER): 99

cerber2.exe (CERBER): 99

dsconfig.exe (CERBER): 99

exe1.exe (CERBER): 99

exe1.exe (CERBER): 99

 90 < 90

Copyright 2018 Fujitsu System Integration Laboratories

Behind the Scene - 3D Visualization (CERBER)
unknown01.exe at (100, 100, 100) 100

100

0 0

0 100

Dynamic Score

Copyright 2018 Fujitsu System Integration Laboratories

Similar Malware Ranking for "unknown40.exe"

Rank 1 2 3 4 5 6 7 8 9 10

Surface Score mssecsvc.exe (WannaCry): 98 mssecsvc.exe (WannaCry): 95 <MD5hash>.virus (WannaCry): 94 lhdfrgui.exe (WannaCry): 94 mssecsvc.exe (WannaCry): 94 mssecsvc.exe (WannaCry): 93 mssecsvc.exe (WannaCry): 92 lhdfrgui.exe (WannaCry): 91 lhdfrgui.exe (WannaCry): 91 36318392.exe (WannaCry): 89

Dynamic Score mssecsvc.exe (WannaCry): 100 <MD5hash>.virus (WannaCry): 100 lhdfrgui.exe (WannaCry): 100 lhdfrgui.exe (WannaCry): 100 mssecsvc.exe (WannaCry): 100 <MD5hash>.virus (WannaCry): 100 36318392.exe (WannaCry): 100 mssecsvc.exe (WannaCry): 100 mssecsvc.exe (WannaCry): 100 <MD5hash>.virus (WannaCry): 100

Geometric Score mssecsvc.exe (WannaCry): 99 lhdfrgui.exe (WannaCry): 99 lhdfrgui.exe (WannaCry): 99 lhdfrgui.exe (WannaCry): 99 <MD5hash>.virus (WannaCry): 99 mssecsvc.exe (WannaCry): 99 lhdfrgui.exe (WannaCry): 99 <MD5hash>.virus (WannaCry): 99 mssecsvc.exe (WannaCry): 99 <MD5hash>.virus (WannaCry): 99

 90

< 90

Copyright 2018 Fujitsu System Integration Laboratories

Behind the Scene - Kill Switch of WannaCry
unknown40.exe at (100, 100, 100)
Copyright 2018 Fujitsu System Integration Laboratories

Similar Malware Ranking for "unknown14.exe"

Rank 1 2 3 4 5 6 7 8 9 10

Surface Score P_SK001.exe (Other) : 93 P_SK003.exe (Other) : 92 Red_crypter.exe (Other) : 90 P_SK002.exe (Other) : 90 P_SK005.exe (Other) : 88 ReptileUI.exe (Other) : 87 HmpvInst.exe (Other) : 86 Stealth.exe (Other) : 86 google chrom.exe (Other) : 85 Application1.exe(Other) : 85

Dynamic Score AIRBNB Brute.exe (Other) : 100 Skype Resolver.exe (Other) : 100 HackerClean.exe (Other) : 100 stm1.exe (Other) : 100 RebornBuddy.exe (Other) : 100 updater.exe (Other) : 100 ProxyAlts Loader.exe (Other) : 100 PML_Alert.exe (Other) : 100 conhost.exe (Other) : 100 MmiStart.exe (Other) : 100

Geometric Score

AIRBNB Brute.exe (Other) : 99

Skype Resolver.exe (Other) : 99

HackerClean.exe (Other) : 99

stm1.exe (Other) : 99

RebornBuddy.exe (Other) : 99

updater.exe (Other) : 99

ProxyAlts Loader.exe (Other) : 99

PML_Alert.exe (Other) : 99

MmiStart.exe (Other) : 99

GITS-DE.exe (Other) : 99

 90

< 90

Copyright 2018 Fujitsu System Integration Laboratories

Exhibition Match: S4 vs. Olympic Destroyer
"unknown2018_01.exe" (Found Feb 2018) against Feb 2018 Malware Set

Rank 1 2 3 4 5 6 7 8 9 10

Surface Score

Dynamic Score

_bjv.exe (Olympic Destroyer) : 99 _bjv.exe (Olympic Destroyer) : 93

_bdm.exe (Olympic Destroyer) : 99 _bdm.exe (Olympic Destroyer) : 93

_rnk.exe (Olympic Destroyer) : 99 _rnk.exe (Olympic Destroyer) : 93

<MD5> (Olympic Destroyer) : 99 <MD5> (Olympic Destroyer) : 93

_jea.exe (Olympic Destroyer) : 92 _jea.exe (Olympic Destroyer) : 74

_ljy.exe (Olympic Destroyer) : 92 _ljy.exe (Olympic Destroyer) : 74

_mpw.exe (Olympic Destroyer): 92 _nfc.exe (Olympic Destroyer) : 74

_qih.exe (Olympic Destroyer) : 92 _nka.exe (Olympic Destroyer) : 74

_nfc.exe (Olympic Destroyer) : 91 _mpw.exe (Olympic Destroyer) : 74

_nka.exe (Olympic Destroyer) : 91 _wun.exe (Olympic Destroyer) : 74

Geometric Score

_bjv.exe (Olympic Destroyer) : 99

_bdm.exe (Olympic Destroyer) : 99

_rnk.exe (Olympic Destroyer) : 99

<MD5> (Olympic Destroyer) : 99

zeuspanda (Panda Banker) : 70

<MD5> (Other) : 70

CFE_Factura.exe (Other) : 69

executable.1088.exe (Other) : 68

<MD5> (Olympic Destroyer) : 65

_nfc.exe (Olympic Destroyer) : 65

 90

< 90

Copyright 2018 Fujitsu System Integration Laboratories

Outline

· Introduction

· S4 vs. Malware Families

· Difficulty with Malware Analysis

· Match Rules

Operations

· S4 Won All the Matches!

· Similarity Tool to Rescue

· Exhibition Match: Olympic Destroyer

· A Single Similarity Tool Is No Match · Conclusion · Road to the Proposed Solution · Future Plan

· Initial Struggles

· Take Home Message

· Bunch of Similarity Tools

· Three Dimensions for Human Analysts

· Sample Similarity Scoring System (S4)

Copyright 2018 Fujitsu System Integration Laboratories

Future Plan:
Automatic Score Transformation Tuning

Security Operation Center

Machine Learning to Tune PLT

PLT: Piecewise Linear Transformation

Scores
PLT
Calculate! S4

Malware Family Information
Internet
CTI
TAXII Server

Copyright 2018 Fujitsu System Integration Laboratories

Take Home Message
There is Difficulty with Malware Analysis Operations, a Similarity Tool comes to Rescue, But ... A Single Similarity Tool Is No Match for evasion techniques. Through Initial Struggles, we developed Sample Similarity Scoring System (S4), which put metrics from a Bunch of Similarity Tools Into Three Dimensions for Human Analysts for their easy understanding. S4 Won All the Matches against two malware families.
 Multi-dimensional Malware Similarity Will Let You Catch Up with Malware Developers
Copyright 2018 Fujitsu System Integration Laboratories

