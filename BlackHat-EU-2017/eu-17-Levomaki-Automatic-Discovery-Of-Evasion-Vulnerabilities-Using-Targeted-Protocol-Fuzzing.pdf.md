Automatic Discovery of Evasion Vulnerabilities Using Targeted Protocol Fuzzing
antti.levomaki@forcepoint.com opi@forcepoint.com

ANTTI LEVOMÄKI
Research Scientist

WHO?

OLLI-PEKKA NIEMI
Director of Research

WHAT?
NETWORK EVASIONS
+
FUZZING
= Automated method for finding evasion vulnerabilities in
modern up-to-date IPS & NGFW System

WHY?
Evasions discovered by Ptacek and Newsham still work against modern IPS and NGFW system
 Lack of modern tools to highlight the risks of evasion vulnerabilities  Configuring IPS systems to detect and prevent evasions can be really hard  Increase the awareness to persuade vendors to fix
evasion gaps

NETWORK EVASIONS
 Result of a different interpretation of traffic by a security device than by the victim endpoint
 Robustness principle: "Be conservative in what you do, be liberal in what you accept from others", Jon Postel
 Ptacek & Newsham paper: "Insertion, Evasion, and Denial of Service: Eluding Network Intrusion Detection", 1998

INTRODUCTION TO EVADER
Applies evasion to attacks to bypass virtual patching and intrusion prevention.

2009
Research published

2010
AET Threat Identified

2012
Evader released as freeware

2013
BlackHat Talk

2017
Relaunch. AET Threat still present

EVADER
 Implements a few well known and old exploits to test traffic inspection
Userspace TCP/IP stack with atomic evasions on all network layers
 Atomic evasions produce mostly valid transformations to traffic
 Combinations produce interesting traffic => at least 245 - 2186 possible combinations depending on protocols => far too many to handle as a special case in IPS/NGFW

TEST METHODOLOGY

Target

Security Device

Verify Connectivity

Attacker

Verify Backdoor port
availability*

Send Exploit

Connect to backdoor*

CVE-2008-4250, MSRPC Server Service Vulnerability
CVE-2004-1315, HTTP phpBB highlight
CVE-2014-0160 Heartbleed
*Heartbleed success is determined based on data leaked. No backdoor / post compromise

IDEA
 Cannot test all dynamic combinations => generate random combinations and test them rapidly
 Cannot ensure that all combinations produce valid traffic => use real exploit and victim host. If the exploit works, traffic is valid.
Cannot know what the IPS/NGFW is doing => configure to terminate everything it thinks is malicious.

MONGBAT
 Fuzz generator for Evader, runs parallel Evader instances with random evasion combinations targeting specific parts of networking protocols.
 Handles addressing and validates the test environment.
 The evasions and their parameters are selected from the set Evader lists as supported. => validation scripts to drop completely useless combinations => each run is different

MONGBAT
Successful attacks are recorded for repeatability
Evader command line including  Evasions and parameters  Random seed
 Packet captures

DEMO

RESULTS
Success/attempts in 10 minutes of fuzz testing

Vendor Vendor I Vendor II Vendor III Vendor IV Vendor V
Vendor VI

HTTP

HTTPS

72 / 12364

crasha

133 / 8481 97 / 4119

126 / 8788 277 / 4059

746 / 1833

N/Ab

3366 / 8975 2550 / 5970

Conficker 21 / 858 16 / 2368 15 / 1204 2 / 1077 8 / 3561

Heartbleed 0 / 557 25 / 899
40 / 1092 N/Ab
50 / 891

0 / 7366

0 / 6337

0 / 7778

0 / 994

RESULTS
Low level evasions can be payload independent => TCP layer evasion discovered with HTTP attack likely also
works with HTTPS & SMB/MSRPC

Vendor Vendor I Vendor II Vendor III Vendor IV Vendor V Vendor VI

HTTP H
P, C P, H P, C, H P, C, T, H

HTTPS

Conficker Heartbleed

T, H

P

P, C, T, H

P

P, C, T, H

C

P, C, H

T P, C, T P, C, T
T

P = PAWS C = TCP_CHAFF

H = HTTP T = TLS record layer segmentation

CHALLENGES ­ VENDORS ARE BLOCKING THE TOOL

WHAT DE:AD:BE:EF User-Agent "Railforge" TCP Syn Windows Scale 0 Identify Shellbanner High port blocking Blacklist

Block the tool

FIX

Prevent testing by blocking MAC

Changed MAC

Block attack based on User-Agent

Change User-Agent

Prevent testing by blocking SYN packets
Block post compromise and prevent success validation
Block post compromise and prevent success validation
Blacklist IP or subnet used for testing

OS Spoof to mimic Windows, Linux during 3-W HS
Different mechanism for success validation or custom shell banner
Inline shell, visual effect or ack based success indication
Legitimate clean test pre-exploit test validation

KEY FINDINGS
1. Rapid discovery of working evasions 2. Very difficult to tune security policies to be evasion-proof 3. Low level (TCP) evasions can be payload independent 4. One (1) reliably working evasion is enough to bypass security completely.

For questions and access to EVADER contact Olli-Pekka Niemi
opi@forcepoint.com
antti.levomaki@forcepoint.com opi@forcepoint.com

