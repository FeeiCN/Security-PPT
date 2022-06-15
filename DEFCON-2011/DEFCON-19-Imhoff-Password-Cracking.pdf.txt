Economics of Password
Cracking in the GPU Era
8/3/2011 Robert Imhoff-
Dousharm

Achieve More.

June 23, 2011

SanDisk Confidential

1

Overview
! Introduction ! GPU Cracking ! Economics ! Deployment Explained ! Lessons Learned ! Conclusion ! Q/A

June 23, 2011

SanDisk Confidential

2

Shameless Plugs...
! Atheros Communications
§ Initial research time and funds
! SanDisk Corporation
§ Continued time and funds
! People of earth
§ "Acting Human"
! Electricity
§ Provides the "path of least resistance"
! Vegas 2.0 ­ dc949 ­ CuckooNest

June 23, 2011

SanDisk Confidential

3

About me...
! Research and technical ­ IT Security
§ 4 years Credit card security (see DEF CON 11-13) § 3 years code IDPS research § 2 years GPGPU password cracking
! Suit and Tie
§ 12 years working experience with IT Security § Developer ­ Researcher ­ SOC Analyst ­ Response ­
Tactical ­ Holistic
! Private Hack Space
§ We have tree's and servers to muse over

June 23, 2011

SanDisk Confidential

4

Overview: Introduction

June 23, 2011

SanDisk Confidential

5

Introduction
! What is General Computing?
§ GPU vs SSEx vs. HPC
§ CUDA and OpenCL (not GL)
§ What is the current state of GC and HPC?
§ Top500
! Cloud Computing
§ Amazon AWC / EC2 § Nimbix § Peer1 Hosting § Penguin Computing

June 23, 2011

SanDisk Confidential

6

Introduction
! Distributed Technologies
§ distributed.net § Folding@home § SETI@home § BitCoin

June 23, 2011

SanDisk Confidential

7

Overview: GPU Cracking

June 23, 2011

SanDisk Confidential

8

GPU Cracking ­ Hardware
! NVidia vs. ATI
§ GTX 590
§ 1024 Cores * 8 Cell = 8,192 "streams"
§ Radeon HD5870
§ 1,600 "Cores" == 1,600 Streams
! CUDA vs. Stream vs. OpenCL
§ CUDA == R.A.D § Stream == Piss poor documents § OpenCL == Wave of future (sorry CUDA)

June 23, 2011

SanDisk Confidential

9

GPU Cracking ­ Software
! Current offerings
§ oclHashCat § igHash § CUDA-Multiforcer (M.I.A)
! Current Benchmarks
§ NTLM (Windows AD) § MD5 (Websites) § Salt based passwords (Smart)

June 23, 2011

SanDisk Confidential

10

GPU Cracking ­ Software
! What's in a mask?
§ Character Minimum § Upper, lower, special and numeric § Passphrase concepts
! Two factor and you!
§ Google Authenticator § Symantec VIP § SecureAuth § RSA SecurID (giggle)

June 23, 2011

SanDisk Confidential

11

Overview: Economics

June 23, 2011

SanDisk Confidential

12

Economics
! Locally hosted
§ Single box § Private Cloud § Local Distribution (custom Screen Savers, etc.)
! Public Cloud
§ Amazon / Peer1 / Penguin Computing § LastBit / ElcomSoft (!= good)
! Distributed
§ Non existing?

June 23, 2011

SanDisk Confidential

13

GPU Password Cracking Video Card Matrix

GPU Cores Memory

GTX295 240 896

M2050 448 3072

GTX470 448 1280

CMF Alpha 0.8r4 HashCat 0.24

693.80 732.70

1152.18 n/a

1323.75 819.78

Hours Days Years Centuries Galactic Years

2510.27 104.59
0.29 0.00 0.00

1511.59 62.98 0.17 0.00 0.00

1315.68 54.82 0.15 0.00 0.00

GPU's

2 4 16 20 32 100 250 500 1000 10000 100000

52.30 26.15 6.54 5.23 3.27 1.05 0.42 0.21 0.10 0.01 0.00

31.49 15.75 3.94 3.15 1.97 0.63 0.25 0.13 0.06 0.01 0.00

27.41 13.70 3.43 2.74 1.71 0.55 0.22 0.11 0.05 0.01 0.00

List Price Keys / Dollar
Keys / Core Key / Memory

$290.00 2.39 2.89 0.77

$2,500.00 0.46 2.57 0.38

$260.00 5.09 2.95 1.03

*Estimated speeds 2x ATX Setup 4x eATX Setup 16x Chassis (Dell C410x / Cubix Expander)

GTX480 480 1536

GTX570 480 1280

Keys Per Second (In Millions)

1722.58

1798.77

1290.70

1347.80

Password Length: 8

1011.06

968.23

42.13

40.34

0.12

0.11

0.00

0.00

0.00

0.00

Days to Complete

21.06

20.17

10.53

10.09

2.63

2.52

2.11

2.02

1.32

1.26

0.42

0.40

0.17

0.16

0.08

0.08

0.04

0.04

0.00

0.00

0.00

0.00

$425.00 4.05 3.59 1.12

$325.00 5.53 3.75 1.41

GTX580 512 1536
2020.43 1357.50
862.01 35.92 0.10 0.00 0.00
17.96 8.98 2.24 1.80 1.12 0.36 0.14 0.07 0.04 0.00 0.00
$490.00 4.12 3.95 1.32

HD5870 1600 1024
n/a 2906.00
599.32 24.97 0.07 0.00 0.00
12.49 6.24 1.56 1.25 0.78 0.25 0.10 0.05 0.02 0.00 0.00
$320.00 9.08 1.82 2.84

GTX590* 1024 3072

4200.00 2700.00

414.67 17.28 0.05 0.00 0.00

8.64



4.32



1.08



0.86

0.54

0.17

0.07

0.03

0.02

0.00

0.00

$740.00 5.68 4.10 1.37

June 23, 2011

SanDisk Confidential

14

Example "Super Computer" GPGPU Setup

SKU

Description

Super B8DTG

Supermicro SBI-7126TG Intel 5520 LGA1366 GPU Blade

AOC-IBH-XQS

Supermicro Add-on Card AOC-IBH-XQS Network adapter

BX80602E5506

Intel Xeon E5506 Nehalem-EP 2.13GHz 80W Quad-Core Server Processor

GTX590

GeForce GTX 590 (Fermi) 3072MB 768-bit GDDR5 PCI Express 2.0 x16

MCP-640-00062-0N Accessory MCP-240-00062-0N FH L-Bracket for Standard-LP 4XLANCARD Retail

N8G-ST2

Active Media Products Amp 8GB 7-Pin SATA Dom Flash Disk

KVR1333D3D4R9S/8G Kingston 8GB 240-Pin DDR3 SDRAM ECC Registered DDR3 1333 Server

Super SBE-720E-R75 Supermicro SuperBlade SBE-720E-R75 Rack-mountable

SBM-IBS-Q3616

Supermicro Blades SBM-IBS-Q3616 - SB Infiniband Swch 40gb INFINISCALE

SBM-XEM-X10SM

Supermicro - SBM-XEM-X10SM - SBLADE L3 10gbe Swch 480gbps Layer3 10g

QT Unit Cost

10 $699.84

10 $550.70

20 $230.00

20 $749.99

20

$20.70

10

$75.90

20 $175.00

1 $3,587.63

1 $5,318.77

1 $7,153.27

Total

Total Cost $6,998.40 $5,507.00 $4,600.00
$14,999.80 $414.00 $759.00
$3,500.00 $3,587.63 $5,318.77 $7,153.27 $52,837.87

GPU Count Pass/GPU Total /Sec

40

3.42

136.8

June 23, 2011

SanDisk Confidential

15

Password Brute Force Calculator!

Upper Case Letters!

!

Lower Case Letters! !

Numbers!

!

Special Characters! !

or Purely Random Combo of Alpha/Numeric!

!

or PURELY Random Combo of Alpha/Numeric/Special!

8!

password length in Characters! 8!

Character Set Size! 26! 26! 10! 32! 62! 94!

Entropy or Keyspace of password! 1 ! 1 ! 1 ! 1 ! 1 !
6,095,689,385,410,820 ! 6,095,689,385,410,820T!otal Unique Keys!
./3.5R! educe Keyspace Search using map reduce methods! 1,741,625,538,688,800.00T!otal Workload in Floating Point Processes!

GPUs! 4!

GTX 570!
7195080000000!

Keys !

Amazon EC2 M2050!
2491820000000!

GPUs! 2!

Estimated Gross Number of hours to Crack!

242.06!

Hours !

698.94!

10.09 !

days!

29.12!

0.03 !

years!

0.08!

0.00 !

centuries!

0.00!

0.00 !

Galactic Years!

0.00!

Number of servers (with GPU count from above)!

!

4!

2.52 !

days!

7.28!

!

8!

1.26 !

days!

3.64!

!

10!

1.01 !

days!

2.91!

!

50!

0.20 !

days!

0.58!

!

100!

0.10 !

days!

0.29!

!

250!

0.04 !

days!

0.12!

!

500!

0.02 !

days!

0.06!

!

1,000!

0.01 !

days!

0.03!

!

10,000!

0.00 !

days!

0.00!

!

100,000!

0.00 !

days!

0.00!

GTX Cost (One Time)!

Amazon Cost!

$2,056.48 !

$1,537.66!

Conclusion:!

You really need a better password. This password really is terrible. This password can't be trusted with anything worthwhile, sorry! Numbers don't lie! Try adding some symbols/numbers and increase the length by
3-5 characters!

June 23, 2011

SanDisk Confidential

16

Overview: Deployment
Explained

June 23, 2011

SanDisk Confidential

17

Deployment Explained
! Live Amazon EC2 Demo ! Live oclHashCat Demo ! Live CUDA-Multiforcer Demo

June 23, 2011

SanDisk Confidential

18

Overview: Lessons
Learned

June 23, 2011

SanDisk Confidential

19

Lessons Learned

! NTLM and your environment ! Gawker, Sony and others or
§ "How I got F'ed in the A with a D...prison style"
! The 8-Char password ! Salting passwords and the future
§ Really this is NOT as superficial as you would think!
!  In the year 2000! 
§ Near Future Cracking Number § Next 1-2 Years Cracking Numbers § Quantum Computing

June 23, 2011

SanDisk Confidential

20

Overview: Conclusion

June 23, 2011

SanDisk Confidential

21

Q/A
Robert Imhoff-Dousharm
the Hackajar
@hackajar Facebook.com/hackajar Linkedin.com/hackajar

June 23, 2011

SanDisk Confidential

22

