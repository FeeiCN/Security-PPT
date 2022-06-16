#RSAC

SESSION ID: HT-W09
Machine Learning to Ultimately Defeat Advanced Ransomware Threats

Sergey Ulasen
Director of Development, AI Acronis linkedin.com/in/sergey-ulasen

Vladimir Strogov
Director of Development, Kernel Team Acronis linkedin.com/in/vladimirstrogov

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Introduction
Zero Day Attacks: Ransomware

#RSAC
Ransomware as the typical example of zero day attacks
There are many ransomware families. Anti-Ransomware defense is problematic due to the following:
­ the samples are often modified. ­ real-time data protection is expensive.
Machine Learning can greatly improve existing data protection.
We are describing injection techniques used by ransomware.
4

#RSAC
Advanced Ransomware Samples
The definition of advanced ransomware. Shell code injection in well-known good processes.

#RSAC
Ryuk as the most advanced form of ransomware payloads (1)
The initial stages:
­ Planting several executables in the system, for example using the Zloader botnet.
­ Stopping services, deleting VSS copies, etc.
The advanced stages:
­ Injecting multiple system and trusted processes. ­ But keeping the system operational: lsass.exe, csrss.exe and explorer.exe
are not changed. ­ Detaching the encrypting part from Ryuk processes.
6

#RSAC
Ryuk as the most advanced form of ransomware payloads (2)
Challenge: abnormal injection detection. Important: there are legitimate injection techniques. The ML-based solution:
­ Snapshotting of data changes for the thread. ­ Detecting stack anomalies with ML models. ­ Recovering changed data if ransomware is detected. ­ Otherwise discarding the snapshots of data changes.
7

#RSAC
Anatomy of the advanced attack with the shell code injection
Possible scenarios of the attacks

#RSAC
Ransomware Shell code injection with CreateRemoteThread
The dropper delivers the payload The payload injects itself into legitimate processes with
­ OpenProcess ­ VirtualAllocEx ­ WriteProcessMemory writes bufferWithTheEncryptor ­ CreateRemoteThread launches bufferWithTheEncryptor ­ CloseHandle
9

#RSAC
Ransomware shell code injection with APC
The dropper delivers the payload The payload injects itself into legitimate processes with
­ OpenProcess ­ VirtualAllocEx ­ WriteProcessMemory writes bufferWithTheEncryptor ­ apcRoutine = bufferWithTheEncryptor ­ OpenThread ­ QueueUserApc
10

#RSAC
Ransomware DLL injection with SetWindowsHookEx
The dropper delivers the payload The payload injects itself into legitimate processes with
­ LoadLibrary ("hook.dll") ­ Hooker=GetProcAddress(..); ­ SetWindowsHookEx
11

#RSAC
Architecture of the AntiRansomware Solution
Windows File system filter driver, advanced call stack analyzer, Machine Learning system

#RSAC
Fighting Advanced Ransomware: Main Steps
Monitor injections using RtlCaptureStackBackTrace. Analyze injections with Machine Learning Model. Start data protection per the injection affected process. Analyze process behavior. When the detection decision is made, recover the encrypted files and terminate hostile injected objects.
13

System diagram ­ training mode (malicious or good scenario)

Gathers call stacks for model training

Service with Machine Learning models ­ features extraction

Telemetry Service dataset gathering

User mode Kernel mode

Filter Driver

NTFS

#RSAC
14

System diagram ­ production mode

System service or the well-known legitimate application, the Victim

Malicious thread, injected by Ransomware

User mode Kernel mode

ML and detection heuristics.
Data remediation
controls.

Filter Driver

NTFS

#RSAC
Driver sends call stacks to ML, the verdict is received to mark the thread as suspicious. Full set of heuristics is turned ON if stack anomaly is identified.
Remediation storage, snapshots
of original data
15

#RSAC
Machine Learning based on call stacks

#RSAC
Analysis of injections during execution

Malware Inject Detection By API Call Sequence

Suspicious Example: Create Thread operation

ntdll.dll

kernel32.dll

n/a

kernel32.dll

ntdll.dll

wow64.dll

wow64cpu.dll

wow64.dll

ntdll.dll

Modules to which return addresses on stack belong

Returned address in the allocated memory doesn't belong to any processes

ntdll.dll

kernel32.dll

TeamViewer.exe

n/a

TeamViewer.exe

setupapi.dll

ntdll.dll

wow64.dll

wow64cpu.dll

wow64.dll

ntdll.dll

Clean Example: Create Section operation
Just-in-time code compilation: whitelisted

ML model training pipeline

Clean processes

Training dataset

Infected processes

ntkrnlpa.exe,ntdll.dll,KernelBase.dll, ..., clean KernelBase.dll,kernel32.dll,kernel32.dll, ..., clean NetSetupSvc.dll,ELSCore.dll,ELSCore.dll, ...,clean com.docker.9pdb.exe, n/a,cryptsp.dll, ..., infected ntkrnlpa.exe,ntdll.dll,KernelBase.dll, clean
... ... ...
ntkrnlpa.exe,ntdll.dll,KernelBase.dll, clean n/a,clr.dll,clr.dll,clr.dll, combase.dll, ..., clean

#RSAC
Decision making
Infected process

ML model determines if the process is clean or not

Trace operation (open, i/o operations), trace normalization for ML, algorithm, remove process ID and other non needed parameters

Learning Infrastructure

Labs
Infected processes farm
Provides ransomware behavior data
Clean processes farm
Provides clean processes behavior data

Cloud

Updated knowledge
base

Knowledge base

Endpoints

Learning Service
Model training, parameters optimization

Unknown events

#RSAC

#RSAC
Analysis of injections: Models comparison

Samples database: 850M records, 23M is unique New samples: 1-2M per day

Stacktrace Analyzer 1.0: Model: Random Forest

Stacktrace Analyzer 2.0: Model: Gradient Boosting Tree

Model details: Input ­ fixed number of frames Output ­ clean/suspicious Size ­ 8M

Model details: Input ­ deduplicated frames Output ­ clean/suspicious Size ­ 900K

Test results: Accuracy ­ 0.96 Execution Time: 10-20 ms

Test results: Accuracy ­ 0.98 Execution Time: 1-5 ms

#RSAC
DEMO
We launch the Real-world ransomware and demonstrate how the injection is detected and malicious file data modifications are rolled back:
­ The video that demonstrates how the injected stacks are detected https://drive.google.com/file/d/1KKptRRvGEy0ri2DsdV8U1N203Qh9Eg5/view?usp=sharing
­ The video that shows the post-mortem analysis of files encryption and recovery https://drive.google.com/file/d/1o68zFgRioNEgteaMhhgMXKbEq4pWA3Ti /view?usp=sharing
21

#RSAC
Dealing with false positives of the call stack anomaly detection
Find methods to reduce false positives, connect with other methodologies and detections

#RSAC
How to Reduce False Positives
The knowledge of injection source helps to reduce false positives. Sensors: file system mini-filter callbacks, user mode or hypervisor assisted hooking. Validation: whitelisted services or behavior models.
23

#RSAC
Summary
How to get better anti-ransomware protection

#RSAC
The advanced anti-ransomware defense steps
Detect abnormal injected call stacks. Start data protection in real time. Do data protection with high granularity. Track the behavior of the injected code. Make the final verdict and remediation actions.
25

#RSAC
Enhance anti-ransomware defense with ML
Gather all types of injections routinely. Develop the model training infrastructure. Start with simple models like Random Forest. Update your model regularly. Automate the data annotation process. Apply ML to behavior analysis.
26

