Side Channel Attack on OpenSSL ECDSA
Joop van de Pol Nigel Smart Yuval Yarom
1

Outline
· Background
­ ECDSA ­ wNAF scalar multiplication ­ The Hidden Number Problem ­ The Flush+Reload technique
· Exploiting the side channel · Recovering the key · Results
2

ECDSA
Signer has a private key 1<<q-1 and a public key Q=[]G
1. Compute h=Hash(m) 2. Randomly select an ephemeral key 1<k<q 3. Compute (x,y)=[k]G 4. Take r=x mod q; If r=0 repeat from 2 5. Take s=(h+r·)·k-1 mod q; if s=0 repeat from 2 6. (r,s) is the signature
Note that
3

wNAF Form
To compute [k]G, first write k in wNAF form: Such that if di0 then di+1=...=di+w+1=0.
4

Scalar Multiplication with wNAF form
Precompute {±G, ±[3]G,..., ±[2w-1]G}
x=0 for i=n-1 downto 0 x = Double(x) if (di0) then
x = Add(x, [di]G) end end return x
5

The Hidden Number Problem [BV96]
We know enough triples ti, ui and zi such that for an unknown .
We can find  by reducing HNP to a lattice problem.
.
6

HNP and ECDSA [HGS01,NS03]
Recall that We want

In terms of k:

n

0

Or in terms of ti and ui:

7

HNP and ECDSA [HGS01,NS03]
Recall that We want

In terms of k:
n
Or in terms of ti and ui:

a

zi

0

8

HNP and ECDSA [HGS01,NS03]
Recall that We want

In terms of k:
n
Or in terms of ti and ui:

0

zi

0

9

HNP and ECDSA [HGS01,NS03]
Recall that We want

In terms of k:

n-zi

0

Or in terms of ti and ui:

10

HNP and ECDSA ­ State of the Art
· Useful information:
­ l bits for l known LSBs ­ Between l-1 and l bits for l known MSBs ­ l/2 bits for arbitrary l consecutive bits
11

FLUSH+RELOAD [YF14]

· A cache-based sidechannel attack technique
· FLUSH memory line · Wait a bit · Measure time to RELOAD
line
­ fast-> access ­ slow-> no access
· Repeat

Processor
Cache
Memory
12

Outline
· Background
­ ECDSA ­ wNAF scalar multiplication ­ The Hidden Number Problem ­ The Flush+Reload technique
· Exploiting the side channel · Recovering the key · Results
13

Attacking OpenSSL wNAF

· Use FLUSH+RELOAD to recover the double and add chain of the wNAF calculation
­ Divide time into slots of 1200 cycles (about 0.4s)
­ In each slot, probe a memory line in the code of the Double and Add functions.

x=0 for i=n-1 downto 0 x = Double(x) if (di0) then
x = Add(x, [di]G) end end return x

14

Sample Trace
Raw: D||||D|D|||ED|rr|o|r|sA|o|c|c|uDr|i|n|D||||D|||D|||A|A|||D|||D||| |D|||D||||aDp||p|rDo|x|. |1A|sy||m|bD|o|l |D|D|||D|||D||||D||A|A|||D
|||D|D|||D|||D|||A||||D|||D|||D|||D|||D|||A|A||||D||
|D|||D||||D||Ai|nA|1|0|0D0|.|||D|||D|||D|||A|||D|||D|||D|D|
||D|||D|||A||||D|||D|||D|||D|D|||D|||D|||D|||A|||D|D |||D||...
Processed:
DDDADDDDADDDDDDADDDDDADDDDADDDDDADDDDADDDDADDDDDADDD DDDDADDDDADDDDADDDDDADDDDADDDDDDDADDDDDDADDDDADDDDAD DDDADDDDADDDDADDDDDADDDDDADDDDADDDDADDDDADDDDADDDDAD DDDADDDDDDDADDDDDADDDDADDDDDDADDDDADDDDDDADDDDDADDDD ADDDDDADDDDDADDDDDADDDDDADDDDXDDDADDDDADDDDADDDDADDD DDADDDDADDDDDDADDDDDADDDDADDDDDDADDDDDDADDDDADD
15

Sample Trace
We know how to use the revealed LSBs
Processed:
DDDADDDDADDDDDDADDDDDADDDDADDDDDADDDDADDDDADDDDDADDD DDDDADDDDADDDDADDDDDADDDDADDDDDDDADDDDDDADDDDADDDDAD DDDADDDDADDDDADDDDDADDDDDADDDDADDDDADDDDADDDDADDDDAD DDDADDDDDDDADDDDDADDDDADDDDDDADDDDADDDDDDADDDDDADDDD ADDDDDADDDDDADDDDDADDDDDADDDDXDDDADDDDADDDDADDDDADDD DDADDDDADDDDDDADDDDDADDDDADDDDDDADDDDDDADDDDADD
16

Sample Trace
We know how to use the revealed LSBs But these give an average of 2 bits per observed signature.
Can we use the information about the MSBs?
Processed:
DDDADDDDADDDDDDADDDDDADDDDADDDDDADDDDADDDDADDDDDADDD DDDDADDDDADDDDADDDDDADDDDADDDDDDDADDDDDDADDDDADDDDAD DDDADDDDADDDDADDDDDADDDDDADDDDADDDDADDDDADDDDADDDDAD DDDADDDDDDDADDDDDADDDDADDDDDDADDDDADDDDDDADDDDDADDDD ADDDDDADDDDDADDDDDADDDDDADDDDXDDDADDDDADDDDADDDDADDD DDADDDDADDDDDDADDDDDADDDDADDDDDDADDDDDDADDDDADD
17

Using the MSBs

Assume dm+l,dm0 Before adding [dm]G, x is:

1000...000

l+1

0

x=0 for i=n-1 downto 0 x = Double(x) if (di0) then
x = Add(x, [di]G) end end return x

18

Using the MSBs

Assume dm+l,dm0 Before adding [dm]G, x is:

1000...000

l+1

0

After adding [dm]G, for dm>0 it is

And for dm<0

100...00

l+1

w0

011...11

l+1

w0

x=0 for i=n-1 downto 0 x = Double(x) if (di0) then
x = Add(x, [di]G) end end return x

19

Using the MSBs

Assume dm+l,dm0 Before adding [dm]G, x is:

1000...000

l+1

0

After adding [dm]G, for dm>0 it is

And for dm<0

100...00

l+1

w0

Either way,

011...11

l+1

w0

k+2m+w

100...00

n

m+l+1 m+w+1

0

x=0 for i=n-1 downto 0 x = Double(x) if (di0) then
x = Add(x, [di]G) end end return x
20

Observation
For many "standard" curves, q, the group order is close to a power of two. That is, q=2n- such that ||<2p for pn. For example for secp256k1 q=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
EBAAEDCE6AF48A03BBFD25E8CD0364141
Adding or subtracting q to an n bit number is unlikely to change the MSBs
21

Using all the Information

For m>p

Recall that

a 100...00q=2n-

n

m+l+1 m+w+o1r

0

a 100...00

-aq=a-a2n 0

n

n+w-l

m+l+1

0

a

0

n

n+w-l

0

+n

n+w-l

n+p-m-l-1

n+w-l

0

n-m-l-1

0

0

n-m-l-1

0

a 0

0
22

Summary
· FLUSH+RELOAD provides a nearly perfect side channel
­ Probability of error 1/1000 symbols ­ 99% of errors are noticed ­ 2 out of every 3 observed traces are perfect
· Curve choice allows using almost half of the information in each perfect trace
23

Results
Previous results:
· [LN13]: 160-bit key, 100 signatures with 2 known bits · [BPSY14]: 256-bit key, expected 200 signatures

Our results:

# perfect traces

Time (s)

Success probability

10

2.25

0.07

11

4.66

0.25

12

7.68

0.38

13

11.3

0.54

With a very high probability, observing 25 signatures yields more than 13 perfect traces. 24

Cache storage attacks
CT-RSA 2015 B. B. Brumley
Department of Pervasive Computing Tampere University of Technology, Finland
billy.brumley AT tut.fi
21 Apr 2015
1 / 18

Covert channels
Rainbow Series: Light Pink Book
A communication channel is covert if it is neither designed nor intended to transfer information at all. Covert Channel Analysis of Trusted Systems (NCSC-TG-030)
2 / 18

Covert timing channels
A potential covert channel is a timing channel if its scenario of use involves a process that "signals information to another by modulating its own use of system resources (e.g., CPU time) in such a way that this manipulation affects the real response time observed by the second process."
3 / 18

Covert storage channels
A potential covert channel is a storage channel if its scenario of use "involves the direct or indirect writing of a storage location by one process and the direct or indirect reading of the storage location by another process."
4 / 18

Crypto and side-channel attacks
High level: one party is legit, the other isn't
Timing attacks
D. Page (DES, 2002) D. J. Bernstein (AES, 2005) C. Percival (RSA, 2005) Osvik et al. (AES, 2005) Neve and Seifert (AES, 2006) B. B. Brumley and R. Hakala (ECDSA, 2009) Acii¸cmez et al. (DSA, 2010) B. B. Brumley and N. Tuveri (ECDSA, 2011) Yarom et al. (ECDSA, 2014) ...

Storage attacks
5 / 18

Data caching

idx tag data

--- ------ ----

0 de30ec ????

1 096324 ????

.

..

.

..

F 61eff8 ????

Cache-timing attacks
Time access to own data and infers cache hits / misses to determine victim state that caused the eviction.

6 / 18

Cache debugging and HW privilege separation
Invasive cache debug
Direct reads to cache lines and metadata Cache footprint profiling HW errata or coherency
Access control
Cannot allow unchecked direct access to cache lines (exception) x86 protection mode: Ring 0/3 ARM ft. TrustZone: NS-bit
7 / 18

Data caching with HW privilege separation

Note priv 0 can evict priv 1 and vice versa.

idx priv tag data

--- ---- ------ ----

0 1 de30ec ????

1 0 096324 ????

..

..

..

..

F 1 61eff8 ????

8 / 18

The covert storage channel (1)

Alice (priv 0) wants to send one nibble (0x2) to Bob (priv 1).

Bob pollutes:

idx priv tag data

--- ---- ------ ----

0 1 de30ec ????

1 1 096324 ????

2 1 ce5f84 ????

..

..

..

..

F 1 61eff8 ????

9 / 18

The covert storage channel (2)

Alice does one read to evict one line (0x2):

idx priv tag data

--- ---- ------ ----

0 1 de30ec ????

1 1 096324 ????

2 0 b7d710 ????

..

..

..

..

F 1 61eff8 ????

10 / 18

The covert storage channel (3)

Bob then: 1. Reads from Line 0. No exception. 2. Reads from Line 1. No exception. 3. Reads from Line 2. Exception ­ receives 0x2.

idx priv tag data

--- ---- ------ ----

0 1 de30ec ????

1 1 096324 ????

2 0 b7d710 ????

..

..

..

..

F 1 61eff8 ????

11 / 18

From cache storage to clean cache-timing traces
1. Read directly from a cache line. A processor exception indicates M, otherwise H.
2. If M go back to the first step. This requires another query because the processor exception most like wipes the cache state and/or triggers a reset.
3. If H continue with the next line.
Example
HMHHHMHHHHHHMHHH
12 / 18

A practical architecture (1)
SRC: ARM Security Technology documentation
The content of the caches, with regard to the security state, is dynamic. Any non-locked down cache line can be evicted to make space for new data, regardless of its security state. It is possible for a Secure line load to evict a Non-secure line, and for a Non-secure line load to evict a Secure line.
13 / 18

A practical architecture (2)
SRC: ARM Security Technology documentation

Core Processing Logic

Current status:

VA

NSTID

TLB

VA

NSTID

PA

VA

NSTID

PA

Pagetable

NS

Walk

NS

Level 1 Cache

PA

NS

Line Data

Data Store

PA

NS

Cache Hit

Line Data Cache Miss: External Load

AXI Bus Interface AXI Fabric

Arbiter
Decoder
Security Check

14 / 18

A practical architecture (3)
SRC: ARM1156T2-S Technical Reference Manual
The purpose of the data cache Tag RAM operation is to: read the data cache Tag RAM contents and write into the Data Cache Debug Register. write into the Data Cache Debug Register and write into the Data Tag RAM.
To read the Data Tag RAM, write CP15 with:
; Data Tag RAM read operation MCR p15, 3, <Rd>, c15, c2, 0
Transfer data to the Data Cache Debug Register to the core:
; Read Data Cache Debug Register MRC p15, 3, <Rd>, c15, c0, 0
15 / 18

AES and side-channels
SRC: Jeff Moser
16 / 18

AES cache storage attack simulation
Borrowed cache-timing attack by Neve and Seifert (2006)

Remaining key candidates (lg)

120 100
80 60 40 20
0 0

50

100

150

200

Queries

250 17 / 18

Conclusion
Cache debugging mechanisms and hardware-enforced privilege separation can create covert channels Can potentially put crypto keys at risk Compared to cache-timing attacks:
Each "cache miss" costs an additional query But the traces themselves are much more accurate For ARM ft. TrustZone, attack would be from Normal World kernel space to Secure World Concrete mitigation: implementation defined instructions Thanks! Questions?
18 / 18

