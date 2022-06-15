SESSION ID: CRYP-W12
Post-Quantum EPID Signatures from Symmetric Primitives

Dan Boneh

Saba Eskandarian Ben Fisch

#RSAC

Hardware Enclaves
A trusted component in an untrusted system  Protected memory isolates enclave from compromised OS

Untrusted System

Enclave
-Data -Secrets

Adversary who controls OS still can't see inside enclave

2

Hardware Enclaves
A trusted component in an untrusted system  Protected memory isolates enclave from compromised OS  Proves authenticity via a process called attestation

Untrusted System

Enclave
-Data -Secrets

Adversary who controls OS still can't see inside enclave

Secure Channel
Attestation/ Communication

3

Hardware Enclaves
A trusted component in an untrusted system  Protected memory isolates enclave from compromised OS  Proves authenticity via a process called attestation
 Is it "post-quantum" secure?

Untrusted System

Enclave
-Data -Secrets

Adversary who controls OS still can't see inside enclave

Secure Channel
Attestation/ Communication

4

EPID Signatures [BL09]
Group signature-like primitive that provides two properties:
1. Signatures from any member of a group are indistinguishable from each other
2. Users can have their credentials revoked either by a blacklisted key or a blacklisted signature
Intel's EPID signature scheme relies on pairings and is not post-quantum secure
5

EPID Signatures [BL09]
ski, certiJoin(...)- interactive protocol between group member and manager to join group  Sign(gpk,ski,certi,m,SIG-RL) - any user who has joined can sign a message anonymously as a group member 1/0 Verify(gpk,m,KEY-RL,SIG-RL,) - signatures only verify if signed by a valid, unrevoked group member KEY-RL'RevokeKey(KEY-RL,ski) - revoke a group member by key SIG-RL'RevokeSig(SIG-RL,) - revoke a group member by signature Security properties: Anonymity and Unforgeability
6

EPID Signatures [BL09]
ski, certiJoin(...)- interactive protocol between group member and manager to join group  Sign(gpk,ski,certi,m,SIG-RL) - any user who has joined can sign a message anonymously as a group member 1/0 Verify(gpk,m,KEY-RL,SIG-RL,) - signatures only verify if signed by a valid, unrevoked group member KEY-RL'RevokeKey(KEY-RL,ski) - revoke a group member by key SIG-RL'RevokeSig(SIG-RL,) - revoke a group member by signature Security properties: Anonymity and Unforgeability Our design goal: post-quantum security from symmetric primitives only
7

Picnic Signatures [CDGORRSZ17]
Uses ZKB++ MPC-in-the-head type proof system [IKOS07, GMO16] i.e. proof of knowledge from symmetric primitives
High-level idea: Signature is proof of knowledge of preimage of a one-way function
e.g. I know sk such that f(sk)=y
8

Our Basic Approach [BMW03,CG04]
Join User generates pk, sk Group manager signs pk to form cert
Sign User signs message with sk User publishes proof of knowledge of signature as 
Additionally need to support revocation
9

Join User
ski, pki

Our Basic Approach [BMW03,CG04]

pki

Manager

pki

gsk, gpk

Sign
s = Sign(ski, m) Proof of Knowledge: I have a certificate on a key sk* and a
signature s on message m sig1n0 ed with sk*

Join
User ski

Post-Quantum EPID Signature

Manager

gsk, gpk

11

Join
User ski

Post-Quantum EPID Signature

c

Manager

gsk, gpk

12

Post-Quantum EPID Signature

Join

User ski tjoin = f(ski, c)

Manager c tjoin

gsk, gpk

13

Post-Quantum EPID Signature
Join

User ski tjoin = f(ski, c)

Manager c tjoin

gsk, gpk

tjoin, c

14

Post-Quantum EPID Signature
Sign r  {0,1} t = f(ski, r), r
15

Post-Quantum EPID Signature
Sign r  {0,1} t = f(ski, r), r Proof of Knowledge:
1. I know a valid certificate for tjoin, c
16

Post-Quantum EPID Signature
Sign r  {0,1} t = f(ski, r), r Proof of Knowledge:
1. I know a valid certificate for tjoin, c 2. I know ski such that t = f(ski, r) and tjoin = f(ski, c)
17

Post-Quantum EPID Signature
Sign r  {0,1} t = f(ski, r), r Proof of Knowledge:
1. I know a valid certificate for tjoin, c 2. I know ski such that t = f(ski, r) and tjoin = f(ski, c) 3. There is no signature in SIG-RL such that f(ski, r')=t'
publish proof and t as signature
18

Instantiation

Need Zero Knowledge PoK
PRF/CRHF
Post-Quantum Signature from symmetric primitives

Choices ZKB++, Ligero, zk-STARK

19

Instantiation

Need Zero Knowledge PoK
PRF/CRHF
Post-Quantum Signature from symmetric primitives

Choices ZKB++, Ligero, zk-STARK

20

Instantiation

Need Zero Knowledge PoK
PRF/CRHF
Post-Quantum Signature from symmetric primitives

Choices ZKB++, Ligero, zk-STARK
AES, MiMC, LowMC

21

Instantiation

Need Zero Knowledge PoK
PRF/CRHF
Post-Quantum Signature from symmetric primitives

Choices ZKB++, Ligero, zk-STARK
AES, MiMC, LowMC

22

Instantiation

Need Zero Knowledge PoK
PRF/CRHF
Post-Quantum Signature from symmetric primitives

Choices ZKB++, Ligero, zk-STARK
AES, MiMC, LowMC Tree-based, SPHINCS, Fish

23

Instantiation

Need Zero Knowledge PoK
PRF/CRHF
Post-Quantum Signature from symmetric primitives

Choices ZKB++, Ligero, zk-STARK
AES, MiMC, LowMC Tree-based, SPHINCS, Fish

24

Instantiation

Need Zero Knowledge PoK
PRF/CRHF
Post-Quantum Signature from symmetric primitives

Choices ZKB++, Ligero, zk-STARK
AES, MiMC, LowMC Tree-based, SPHINCS, Fish

Post-quantum EPID signature size (group size 230):

25

Instantiation

Need Zero Knowledge PoK
PRF/CRHF
Post-Quantum Signature from symmetric primitives

Choices ZKB++, Ligero, zk-STARK
AES, MiMC, LowMC Tree-based, SPHINCS, Fish

Post-quantum EPID signature size (group size 230): 217MB Way too big!! Culprit: signature verification inside PoK
26

Post-Quantum EPID Signature

Sign

Requires signature verification!

r  {0,1}

How can we remove this?

t = f(ski, r), r Proof of Knowledge:

1. I know a valid certificate for tjoin, c

2. I know ski such that t = f(ski, r) and tjoin = f(ski, c)

3. There is no signature in SIG-RL such that f(ski, r')=t'

publish proof and t as signature
27

The Attestation Setting
Each Intel SGX attestation involves contacting Intel, who verifies the attestation for you.
Enclave
-Data -Secrets
How can we leverage this to reduce signature sizes?
28

The Attestation Setting
Each Intel SGX attestation involves contacting Intel, who verifies the attestation for you.
Enclave
-Data -Secrets
How can we leverage this to reduce signature sizes?
Idea: If group manager has to be online, maybe it can update users' certificates User anonymity sets relative to last certificate update
29

Signatures for Attestation
Manager puts user credentials in a Merkle tree and signs root Users get newest Merkle root/inclusion proof when they connect to the manager
30

Signatures for Attestation
Manager puts user credentials in a Merkle tree and signs root Users get newest Merkle root/inclusion proof when they connect to the manager Signature on Merkle tree root can be verified outside PoK Only need much smaller Merkle inclusion proof inside PoK
31

Signatures for Attestation
r  {0,1} t = f(ski, r), r Proof of Knowledge:
1. I know an inclusion proof for tjoin, c 2. I know ski such that t = f(ski, r) and tjoin = f(ski, c) 3. There is no signature in SIG-RL such that f(ski, r')=t'
publish proof, t, and signed Merkle root as signature
Similar to post-quantum Ring signatures of Derler et al [DRS17] 32

Signature Sizes

Group Size 27 210 220 230 240

RO Model* 1.37MB 1.85MB 3.45MB 5.05MB 6.65MB

QRO Model* 2.64MB 3.59MB 6.74MB 9.89MB 13.0MB

Potential application: large data transfer, e.g. streaming movies

*under ideal cipher assumption on LowMC
33

