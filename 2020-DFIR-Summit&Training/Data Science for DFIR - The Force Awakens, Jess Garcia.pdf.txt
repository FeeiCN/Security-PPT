@j3ssgarcia | @ds4n6_io sans.org | one-esecurity.com | ds4n6.io

Premiere
DS4N6 Project Lead

+13 y -

+18 y -

@j3ssgarcia | @ds4n6_io jess.garcia@one-security.com

+22 y -

- Founder & Global DFIR Lead - Senior Instructor - CybSec / DFIR Experience

ds4n6.io
ds4n6.io | @ds4n6_io
MISSION : Bring the Force of DS & AI to ALL Forensicators
 Code: github.com/ds4n6  ds4n6.py library
 Blog  News  Videos  Cheat Sheets
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ABOUT THIS PRESENTATION

ds4n6.io | @ds4n6_io

 Phase 1
 DS Basics / Filesystem timeline
 Phase 2
 Volatility / Kansa / Plaso

THE SANS PROMISE (Use this today!)

 Phase 3
 Intrusion Visualization / Machine Learning

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

HYPERJACKED CASE

Initial vector of compromise
2211
2211/04/01 ­ 2211/05/15
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

HYPERJACKED CASE
ds4n6.io | @ds4n6_io
 Impact:
 Resistance fleet infected & compromised  Hyperspace jumps tracked
 Goal:
 Understand intrusion  Remove system access
 Response:
 Massive investigation of every spaceship in the fleet using DS4N6
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io
sdsa4nn6.sio.|or@gDS|4NJ6_eio s| #sDS4GN6a| DrSc4Nia6 Th|e @j3ssgarcia Force Awakens | Jess Garcia @| j3ossngaerci-ae| Osnee-ecSuecruriittyy.c.ocm om

ds4n6.io | @ds4n6_io

DS4N6 @ Bird's eye
JUPYTER

Targets

Artifacts Artifacts

Filesystem Events Memory ...

DS4N6
PYTHON PANDAS TOOLS

DataFrames

Targseatsns.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Meet Jupyterlab

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

Let's read a filesystem timeline
ds4n6.io | @ds4n6_io
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

Adjusting Data Types & Cols
ds4n6.io | @ds4n6_io
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

ds4n6.py Making Your Life Easy

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

Meet the pandas DataFrame
ds4n6.io | @ds4n6_io
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Meet the pandas Series

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

Quick Win: The largest files
ds4n6.io | @ds4n6_io
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Sorting Data

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Let's find large files
ds4n6.fstl_size_top_n

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

Let's Analyze Windows Temp
ds4n6.io | @ds4n6_io
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

Let's Scale Up to the Whole Fleet!

ds4n6.io | @ds4n6_io

ds4n6.read_fstls_filetypes

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

exe / dll DFs

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

Executables on /Windows/System32 folder
ds4n6.io | @ds4n6_io
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

Let's find WS32 exes which ds4n6.io | appear @ds4n6_io in less that 3 Spaceships
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Much Easier...
ds4n6.unique_files_folder_analysis

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

RZ: 2211/04/01 ­ 05/15
FINDINGS STRATEGY

ds4n6.io | @ds4n6_io
1
Filesystem Timeline

HYPERJACKED Forensics Dashboard

RedZone Suspicious files
/Windows/Temp/dump.bin /Windows/Temp/b1.exe /Windows/Temp/b2.exe /Windows/System32/lsaiso.exe

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io
MEMORY ANALYSIS (Volatility)
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Reading volatility files The Traditional way

Reading standard volatility output (formatted text):

Reading pipe-separated volatility output generated with --output=greptext

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Your pslist DataFrame

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Reading the DS4N6 Way
ds4n6.read_volatility

...
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

Boot Time Process Analysis
ds4n6.io | @ds4n6_io ds4n6.volatility_pslist_boot_time_anomaly_analysis
SANS DFIR Hunt Evil Poster https://digital-forensics.sans.org/media/DFPS_FOR508_v4.6_4-19.pdf
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Parent Process Analysis
ds4n6.volatility_processes_parent_analysis

SANS DFIR Hunt Evil Poster https://digital-forensics.sans.org/media/DFPS_FOR508_v4.6_4-19.pdf
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io
1
Filesystem Timeline

HYPERJACKED Forensics Dashboard
2
Memory Analysis
Volatility

RedZone Suspicious files

Malicious Processes linked to discovered files

/Windows/Temp/dump.bin lsaiso.exe

/Windows/Temp/b1.exe

hsenginevc.exe

/Windows/Temp/b2.exe

/Windows/System32/lsaiso.exe

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io
REMOTE ARTIFACT TRIAGE ANALYSIS (Kansa)
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Reading the DS4N6 Way
ds4n6.read_kansa

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Services

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Autoruns

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Autoruns

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Autoruns

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io
1
Filesystem Timeline

HYPERJACKED Forensics Dashboard

2

3

Memory

Remote

Analysis

Artifact Triage

Volatility

Kansa

RedZone Suspicious files

Malicious Processes linked to discovered files

/Windows/Temp/dump.bin lsaiso.exe

/Windows/Temp/b1.exe

hsenginevc.exe

/Windows/Temp/b2.exe

/Windows/System32/lsaiso.exe

Scheduled tasks Powershell scripts
hsenginevc.exe task powershell -nop -exec bypass EncodedCommand SQBFAFgAIAAoAE4...

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io
SUPERTIMELINE & ARTIFACTS ANALYSIS (Plaso)
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Reading the DS4N6 Way
ds4n6.read_plaso_json

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

REALLY?
ds4n6.io | @ds4n6_io
NOW YOU HAVE DOZENS OF PARSED ARTIFACTS AT YOUR FINGERTIPS!!!
A-MA-ZING!!!!
(Alternatively you can use Timesketch)
Big thanks to the Google plaso/timesketch Team
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

PREFETCH
ds4n6.io | @ds4n6_io
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

PREFETCH

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

PREFETCH

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

PREFETCH

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io
1
Filesystem Timeline

HYPERJACKED Forensics Dashboard

2

3

Memory

Remote

Analysis

Artifact Triage

Volatility

Kansa

4
Deep Artifact
Analysis
Plaso

RedZone Suspicious files

Malicious Processes linked to discovered files

/Windows/Temp/dump.bin lsaiso.exe

/Windows/Temp/b1.exe

hsenginevc.exe

/Windows/Temp/b2.exe

/Windows/System32/lsaiso.exe

Scheduled tasks Powershell scripts

Prefetch

hsenginevc.exe task powershell -nop -exec bypass EncodedCommand SQBFAFgAIAAoAE4...

/Windows/Temp/b1.exe
/Windows/Temp/b2.exe /Windows/System32/lsaiso.exe /User/hsengine/AppData/
Roaming/hsenginevc.exe

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

WINDOWS EVENT LOG ANALYSIS
ADVANCED VISUALIZATION

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Reading evtx... Eaaasy
ds4n6.read_evtx

Big thanks to Willi Ballenthin for his evtx parser
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

evtx stats made easy
ds4n6.evtid_stats

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

Searching for strings in all event

ds4n6.io | @ds4n6_io

ds4n6.evt_string_search

...
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

User Statistics Made Easy

ds4n6.io | @ds4n6_io

ds4n6.evt_nonsysusers_stats

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

User Access Statistics Made Easy

ds4n6.io | @ds4n6_io

ds4n6.evt_nonsysusers_access_stats

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

Lateral Movement via RDP!
ds4n6.io | @ds4n6_io
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

A Graph is Worth 1000 words...

ds4n6.io | @ds4n6_io

ds4n6.evt_nonsysusers_access_graph

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

Multi-system Intrusion Graph
ds4n6.io | @ds4n6_io

pdameron
lorgana rtico
nnunb hsengine Lazslo.admin

xwt70-sf-01 mc85-sc-01-bridge-02 mc80-sc-01-control-weapon xwt70-sf-02
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io
WINDOWS EVENT LOG ANALYSIS
MACHINE LEARNING
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Welcome to Keras
Machine/Deep Learning Made Easy

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Neural Networks

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Phase 1. Data Preparation
Select your features

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Phase 1. Data Preparation
Normalize your Data

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Phase 1. Data Preparation
Normalize your Data

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Phase 1. Data Preparation
Normalize your Data

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Phase 1. Data Preparation
Split Your Data -> Train / Test

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

Phase 2. Design Your Neural Network

ds4n6.io | @ds4n6_io

A Simple Autoencoder

https://towardsdatascience.com/extreme-rare-event-classification-using-autoencoders-in-keras-a565b386f098
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

Phase 3. Build Your Neural Network

ds4n6.io | @ds4n6_io

A Shallow Vanilla Autoencoder

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

Phase 4. Train Your Neural Network
ds4n6.io | @ds4n6_io
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

Phase 5. Run Your Predictions

ds4n6.io | @ds4n6_io

& Analyze the Error (Loss)

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

Let's See What Anomalies We Found
ds4n6.io | @ds4n6_io
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

And Now Let's Over-Plot the Data!
ds4n6.io | @ds4n6_io
sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

It Identified the Intrusion! Amazing!

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io

Force

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

HYPERJACKED

ds4n6.io | @ds4n6_io

Forensics Dashboard

1

2

3

4

5

Filesystem

Memory

Remote

Deep Artifact

Events

Timeline

Analysis

Artifact Triage Analysis

Volatility

Kansa

Plaso

RedZone Suspicious files

Malicious Processes linked to discovered files

/Windows/Temp/dump.bin lsaiso.exe

/Windows/Temp/b1.exe

hsenginevc.exe

/Windows/Temp/b2.exe

/Windows/System32/lsaiso.exe

Scheduled tasks Powershell scripts

Prefetch

Suspicious events

hsenginevc.exe task powershell -nop -exec bypass EncodedCommand SQBFAFgAIAAoAE4...

/Windows/Temp/b1.exe User hsengine
/Windows/Temp/b2.exe /Windows/System32/lsaiso.exe /User/hsengine/AppData/
Roaming/hsenginevc.exe

b1.exe - Imperal NMAP b2.exe - Memory Dumper

lsaiso.exe - TrickDroid Binary hsenginevc.exe ­ TrickDroid Binary

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.io | @ds4n6_io
USE THE FORCE
YOU MUST, FORENSICATOR!

The Force

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

ds4n6.py

ds4n6.io | @ds4n6_io
Reading DFIR Data
 ds4n6.read_fstl()  ds4n6.read_fstls_filetypes()  ds4n6.read_evtx()  ds4n6.read_volatility()  ds4n6.read_kansa()  ds4n6.read_plaso_csv()  ds4n6.read_plaso_json()
 DFIR Knowledge
 critical_processes | boot_start_processes  process_parents | evtids

DFIR Data Analysis
 ds4n6.fstl_size_top_n()  ds4n6.unique_files_folder_analysis()  ds4n6.volatility_pslist_boot_time_anomaly_analysis()  ds4n6.volatility_processes_parent_analysis()  ds4n6.evtid_stats()  ds4n6.evt_string_search()  ds4n6.evt_nonsysusers_stats()  ds4n6.evt_nonsysusers_access_stats()  ds4n6.evt_nonsysusers_access_graph()

sans.org | Jess Garcia | @j3ssgarcia | one-esecurity.com

May the DS4N6 Force Be With You
ds4n6.io @ds4n6_io DS4N6

 Latest News about DS/AI
 Technical Challenge  (T-shirt giveaway)
 Enterprise Webinars

Enterprise DS4N6 DFIR Services
one-esecurity.com @One_eSecurity One eSecurity

