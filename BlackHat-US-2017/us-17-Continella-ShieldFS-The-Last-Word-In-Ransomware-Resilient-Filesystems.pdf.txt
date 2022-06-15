ShieldFS: The Last Word in Ransomware Resilient Filesystems
Andrea Continella, Alessandro Guagnelli, Giovanni Zingaro, Giulio De Pasquale, Alessandro Barenghi, Stefano Zanero, Federico Maggi
* US patent pending

2016-17 the "years of extortion"

Do you WannaCry?

Do you WannaCry?

ShieldFS vs WannaCry
ShieldFS detected WannaCry after it encrypted >=200 files Files lost: zero, all were recovered automatically

It's not just WannaCry...
 Detected: 1436/1483, 96.9%  Files lost: always 0%

Why
ShieldFS is different?

ShieldFS: Key Takeaways
The way ransomware interacts with the filesystem is significantly different than benign applications

ShieldFS: Key Takeaways
The way ransomware interacts with the filesystem is significantly different than benign applications
DETECTION. Monitor filesystem activity Usage of crypto primitives

ShieldFS: Key Takeaways
The way ransomware interacts with the filesystem is significantly different than benign applications
DETECTION. Monitor filesystem activity Usage of crypto primitives
PROTECTION. Mere detection is insufficient  Stopping a suspicious process may be too late  We need to protect users' data, reverting the effects of
ransomware attacks.

What
does ShieldFS observe?

FS Activity Monitor

 Windows Kernel module to monitor and log the file system activity  Windows Minifilter Driver  Log IRPs (I/O Request Packets)

Process
User mode Kernel mode
I/O Manager
Filter Manager
File System
Storage Driver
Hardware

Filter Manager API
CONST FLT_OPERATION_REGISTRATION Callbacks[] = { { IRP_MJ_CREATE, 0, PreCreateOperationCallback, PostCreateOperationCallback },
{ IRP_MJ_CLOSE, 0, PreCloseOperationCallback, PostCloseOperationCallback },
{ IRP_MJ_READ, 0, PreReadOperationCallback, PostReadOperationCallback },
{ IRP_MJ_WRITE, 0, PreWriteOperationCallback, PostWriteOperationCallback },
}
FltRegisterFilter(DriverObject, &FilterRegistration, &Filter);

IRP Log Example

Where
do we start from?

Background/Clean FS Activity

 IRP logger on 11 clean machines  FS activity under "typical" usage
 ~1 month worth of data

IRPs IRPs

IRPs IRPs

Benign
User mode Kernel mode
I/O Manager
IRPLogger
File System
Storage Driver
Disk drive

Collected FS Activity

Collected FS Activity

Analysis Environment

383 samples of 5 distinct families

Windows 7 VM
Ransomware
User mode Kernel mode
I/O Manager
IRPLogger
File System
Disk drive
VirtualBox
Cuckoo Sandbox

Environment Preparation
 Trigger ransomware activity  Avoid anti-sandbox tricks

Ransomware vs Benign apps

Benign
User mode Kernel mode

? ? ?

Ransomware

I/O Manager IRPLogger File System Storage Driver

Disk drive

ShieldFS
Self-healing Ransomware-aware
Filesystem

Ransomware vs Benign apps

Ransomware vs Benign apps

MANY PROGRAMS MANY PROGRAMS

exhibit

exhibit

LOW VALUE

HIGH VALUE

FEW PROGRAMS exhibit
LOW VALUE

FEW PROGRAMS exhibit
HIGH VALUE

Ransomware vs Benign apps

(1) #Folder-listing

Ransomware Benign

Ransomware vs Benign apps

(2) #Files-Read

Ransomware Benign

Ransomware vs Benign apps

(3) #Files-Written

Ransomware Benign

Ransomware vs Benign apps

(4) #Files-Renamed

Ransomware Benign

Ransomware vs Benign apps

(5) File type coverage

Ransomware Benign

Ransomware vs Benign apps

(6) Write-Entropy

Ransomware Benign

Ransomware vs Benign apps

Machine Learning
Learned classification model

ShieldFS
Self-healing Ransomware-aware
Filesystem

ShieldFS: Healing Approach

ShieldFS: Healing Approach

THIS SLIDE IS TO PROVE THAT WE CAN CREATE COMPLEX ANIMATION FLOWS

THIS SLIDE IS TO PROVE THAT WE CAN CREATE COMPLEX ANIMATION FLOWS

Detection Models
Process #1

Process #n

Models

System-centric Process-centric

Model

K
Disk drive

Multi-tier Incremental Models

K

Global Model

Model 3

Model 2

Model 2

Model 1 Model 1 Model 1 Model 1

Long-term horizon

Model 3 Model 2
Model 1 Model 1

Short-term horizon

log (% accessed files)

tiers

Multi-tier Incremental Models

tiers

Model 3

Model 2

Model 1 Model 1

#0

#1

tick #0
Global Model

Model 2

Model 1 Model 1

#2

#3

Long-term horizon

Model 3

Model 2

Short-term

Model 1

Model 1 horizon

log (% accessed files)

Multi-tier Incremental Models

tiers

Model 3

Model 2

Model 1 Model 1

#0

#1

tick #1
Global Model

Model 2

Model 1 Model 1

#2

#3

Long-term horizon

Model 3

Model 2

Short-term

Model 1

Model 1 horizon

log (% accessed files)

Multi-tier Incremental Models

tiers

Model 3

Model 2

Model 1 Model 1

#0

#1

tick #2
Global Model

Model 2

Model 1 Model 1

#2

#3

Long-term horizon

Model 3

Model 2

Short-term

Model 1

Model 1 horizon

log (% accessed files)

Multi-tier Incremental Models

tiers

Model 3

Model 2

Model 1 Model 1

#0

#1

tick #3
Global Model

Model 2

Model 1 Model 1

#2

#3

Long-term horizon

Model 3

Model 2

Short-term

Model 1

Model 1 horizon

log (% accessed files)

Multi-tier Incremental Models

tiers

Model 3

Model 2

Model 1 Model 1

#0

#1

tick #4
Global Model

Model 2

Model 1 Model 1

#2

#3

Long-term horizon

Model 3

Model 2

Short-term

Model 1

Model 1 horizon

log (% accessed files)

Multi-tier Incremental Models

tiers

Model 3

Model 2

Model 1 Model 1

#0

#1

tick #5
Global Model

Model 2

Model 1 Model 1

#2

#3

Long-term horizon

Model 3

Model 2

Short-term

Model 1

Model 1 horizon

log (% accessed files)

Multi-tier Incremental Models

Malicious

Model 3

Model 2

Model 1 Model 1

#0

#1

Global Model

Model 2

Model 1 Model 1

#2

#3

Long-term horizon

Model 3

Model 2

Short-term

Model 1

Model 1 horizon

log (% accessed files)

tiers

Multi-tier Incremental Models

Benign

Model 3

Model 2

Model 1 Model 1

#0

#1

Global Model

Model 2

Model 1 Model 1

#2

#3

Long-term horizon

Model 3

Model 2

Short-term

Model 1

Model 1 horizon

log (% accessed files)

tiers

Multi-tier Incremental Models

Suspicious ? ? ?

Model 3

Model 2

Model 1 Model 1

#0

#1

Global Model

Model 2

Model 1 Model 1

#2

#3

Long-term horizon

Model 3

Model 2

Short-term

Model 1

Model 1 horizon

log (% accessed files)

tiers

I'm Confused..

Suspicious

Process #1

Process #n

Models

System-centric Process-centric

Model

I'm Confused..

Suspicious

Process #1

Process #n

Models

System-centric Process-centric

LOOK FOR TRACES OF CRYPTO FUNCTIONS

Model

Block Ciphers: Key Schedule

Traces of Crypto Primitives

Key schedules
77 3f 9d 50 2a 91 d5 86 a0 89 42 b2 f3 de b8 d3
32 f2 16 b0 88 e3 7e b4 1d 2d f4 b2 fa 6f 51 64 bd ce c7 e5 16 1b e1 dc 8f db 81 e5 50 8b c0 1a
7b 93 8f f4 64 c9 bf f3 a5 f8 25 be f5 9a 48 c8

Encryption Rounds Round 1 Round 2 Round 3 Round N

Traces of Crypto Primitives

Key schedules
77 3f 9d 50 2a 91 d5 86 a0 89 42 b2 f3 de b8 d3

Encryption Rounds Round 1

32 f2 16 b0 88 e3 7e b4

Round 2

1d 2d f4 b2Ffalase6Pfos5it1ive6s4for AES: 2-1344

bd ce c7 e5 16 1b e1 dc

8f db 81 e5 50 8b c0 1a

Round 3

7b 93 8f f4 64 c9 bf f3 a5 f8 25 be f5 9a 48 c8

Round N

ShieldFS: Architecture

Process 1

Process 2

address space

address space

. . .

Process 1

Process 2

...

open("file.txt") read(fp1)

...

I/O Manager (minifilter driver interface)

Virtual memory
User space Kernel space

ShieldFS: Architecture

Process 1 address space

Process 2 address space

. . .

Virtual memory

Process 1

Process 2

...

open("file.txt") read(fp1)

...

User space

Kernel space

I/O Manager (minifilter driver interface)

I/O Request Packets (IRPs)

Process centric model 1
" process 1 is suspicious"

Process centric model 2

... Feature values

System centric model

Detector

ShieldFS: Architecture

" search for crypto key schedule" CryptoFinder

Process 1 address space

Process 2 address space

. . .

Virtual memory

Process 1

Process 2

...

open("file.txt") read(fp1)

...

User space

Kernel space

I/O Manager (minifilter driver interface)

I/O Request Packets (IRPs)

Process centric model 1
" process 1 is suspicious"

Process centric model 2

... Feature values

System centric model

Detector

ShieldFS: Architecture

" search for crypto key schedule" CryptoFinder

Process 1 address space

Process 2 address space

. . .

Virtual memory

Process 1

Process 2

...

open("file.txt") read(fp1)

...

User space

Kernel space

I/O Manager (minifilter driver interface)

I/O Request Packets (IRPs)

Process centric model 1
" process 1 is suspicious"

Process centric model 2

... Feature values

Detector

System centric model

" process 2 is benign", " process 1 is malicious: kill it and restore files"
Shielder

Disk drive

"restore process 1 files copies"

"delete process 2 file copies"

Shadow drive

ShieldFS: Architecture

" search for crypto key schedule" CryptoFinder

Process 1 address space

Process 2 address space

. . .

Virtual memory

Process 1

Process 2

...

open("file.txt") read(fp1)

...

User space

Kernel space

I/O Manager (minifilter driver interface)

I/O Request Packets (IRPs)

Process centric model 1
" process 1 is suspicious"

Process centric model 2

... Feature values

Detector

System centric model

" process 2 is benign", " process 1 is malicious: kill it and restore files"
Shielder

Disk drive

"restore process 1 files copies"

"delete process 2 file copies"

Shadow drive

File Recovery Workflow
Start Unknown

File Recovery Workflow
Start
Unknown Monitor & COW on first write

File Recovery Workflow
Start Unknown Monitor & COW on first write ShieldFS Detector

File Recovery Workflow

Malicious

Start
Unknown Monitor & COW on first write
ShieldFS Detector

Restore original copies

File Recovery Workflow

Malicious

Start
Unknown Monitor & COW on first write
ShieldFS Detector

Benign

Restore original copies

Clean old copies

File Recovery Workflow

Malicious

Start
Unknown Monitor & COW on first write
ShieldFS Detector

Benign

Restore original copies

Clean old copies

Storage Overhead

Storage Overhead

Storage Overhead

More Numbers?

Detection & Recovery Capabilities
 1483 unseen samples (from VT + Trend)  Locky, TeslaCrypt, CryptoLocker, Critroni, TorrentLocker, CryptoWall, Troldesh, CryptoDefense, PayCrypt, DirtyDecrypt, ZeroLocker, Cerber, WannaCry
 Files protected: always 100%  Even in case of missed detection
 Detection rate: 1436/1483, 96.9%

Detection & Recovery Capabilities
 1483 unseen samples (from VT + Trend)  Locky, TeslaCrypt, CryptoLocker, Critroni, TorrentLocker, CryptoWall, Troldesh, CryptoDefense, PayCrypt, DirtyDecrypt, ZeroLocker, Cerber, WannaCry
 Files protected: always 100%  Even in case of missed detection
 Detection rate: 1436/1483, 96.9%

False Positive Evaluation
FPR with One-machine-off Cross Validation

False Positive Evaluation
FPR with One-machine-off Cross Validation

Overhead: Micro-benchmark

Overhead: Micro-benchmark

...however...

User-Perceived Overhead

Average estimated overhead = 0.26×

Process
User mode Kernel mode
I/O Manager
Filter Manager
File System
Storage Driver
Hardware

User-Perceived Overhead

Average estimated overhead = 0.26×

Process
User mode Kernel mode
I/O Manager
Filter Manager
File System
Storage Driver
Hardware

Demo Time!
WannaCry Sample: ed01ebfbc9eb5bbea545af4d01bf5f1071661840480439c6e5babe8e080e41aa

Conclusions
Ransomware significantly differs from benign software from the filesystem's viewpoint
DETECTION. Generic ML models to identify ransomware  Filesystem activity  Use of symmetric crypto primitives
PROTECTION. Pure detection is not enough  Self-healing virtual FS  Transparently revert the effects of ransomware

Questions?

Andrea Continella
andrea.continella@polimi.it @_conand

Federico Maggi
federico_maggi@trendmicro.com @phretor

http://shieldfs.necst.it

* This work is subject to a US patent (pending) no. 27019

ShieldFS: The Last Word in Ransomware Resilient Filesystems
Andrea Continella, Alessandro Guagnelli, Giovanni Zingaro, Giulio De Pasquale, Alessandro Barenghi, Stefano Zanero, Federico Maggi

