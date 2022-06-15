SESSION ID: CRYP-T10
Modeling Memory Faults in Signature and Authenticated Encryption Schemes

Felix Günther
Postdoctoral Researcher Department of Computer Science, ETH Zurich, Switzerland

joint work with Marc Fischlin (TU Darmstadt)
#RSAC

Memory Faults

#RSAC
FreeImages.com/Chris Woods

#RSAC
What About the Code?
FreeImages.com/Gabor Heja

#RSAC
The Cryptographic Perspective

Deterministic ECDSA

Signature security (EUF-CMA)

Signdet-ECDSA(sk, m) r  Hash(sk, m) R  f(rG) mod q s  (H(m) + sk R)/r mod q return (R, s)

4

#RSAC
Models Matter

Deterministic ECDSA (& co.) succumb to rowhammer-style faults
[PSSLR @ IEEE EuroS&P 2018]

(R0,s0): (R!,s!):

H(m) + sk R0 = Hash(sk, m)s0 H(m) + sk R! = Hash(sk, m)s!

sk

= H(m) / ((R0-R!)s0 / (s0-s!) - R0)

We know for long that faults can have devastating effects on crypto operations at software level [BDL @ Eurocrypt 1997]
But how to assess fault resilience in provable-security manner?

5

#RSAC
Prior Work
Faults in circuits
[IPSW06]
Tailored provable-security models (e.g., for RSA)
[CM09, BDFGTZ14, FGLTZ12]
Related-key attack (RKA) security
[BK04, GLMMR04]
Hedged randomness in Fiat-Shamir-type signatures under faults
[AOTZ19]
6

#RSAC
A Generic Framework for Fault Resilience in Security Models

#RSAC
Modeling Fault Resilience

Signdr(sk, m)

<m>

r  Hash(sk, m<)m>)

s  Signr(sk, m<;m>r;)r)

!

return s

augmented code, indicating faultable memory variables callbacks to adversary: may change values of variable readings
8

#RSAC
Generic Fault Types

Flexible callbacks
Full faults
adversary controls variable completely
Differential faults
adversary can flip w selected bits
Random faults
adversary can flip N random bits
No fault
(baseline)

Forming a hierarchy

9

#RSAC
Fault Resilience for Signatures

#RSAC
Augmenting Signature Security

frEUF-CMA: Fault-resilience unforgeability

Signdr(sk, m) r  Hash(sk, <m>)

Essential question:
Which message did the signer sign?
= Which (m,s) is trivially learned?

s  Signr(sk, <m>; r) return s

Answer: the message m (among all appearing in Sign) verifying with s
If there`s two such m  confusion  adversary declared successful

11

#RSAC
De-Randomized Signatures Are Not Fault-Resilient

Signdr(sk, m) r  Hash(sk, <m>) s  Signr(sk, <m>; r) return s

1. Query OSign on m
­ no faults ­ obtain signature s on m
2. Query OSign on m
­ first <m>: do nothing ­ second <m>: flip bit (to m`) ­ obtain signature s on m`
3. Create new forgery due to re-used randomness r for signatures on m and m`
12

#RSAC
Combining Randomization & De-Randomization

Signc(sk, m) r`${0,1} r  Hash(sk, <m>, <r`>) s  Signr(sk, <m>; <r>) return s

Combining security (provably)
de-randomization for regular EUF-CMA security under bad randomness
randomization for fault-resilient EUF-CMA security under differential faults on m, r, r`

13

#RSAC
Fault Resilience for Authenticated Encryption

#RSAC
A Similar Setting
good randomness isn`t always available nonce-based authenticated encryption (AE) to avoid randomness nonce-misuse resistance hedging against repeated nonces
but what about faults?
15

#RSAC
SIV Mode of Operation: Synthetic IV [RS06]

Nonce-misue resistance ...
EncSIV((K1,K2), N, A, m) IV  PRF(K1, <N>|<A>|<m>) c  Enc(K2, <m>; <IV>) return (IV, c)

... but vulnerable to faults
1. Query OEnc on (N=00..0,A,m)
­ no faults, obtain c1 = c or $
2. Query OEnc on (N=10..0,A,m)
­ <N> callback: flip 1st bit ­ obtain c2 = c or different $
3. Distinguish by checking if c1 = c2

16

#RSAC
SIV$: Combining Randomization & De-Randomization

Combining security (provably)

EncSIV$((K1,K2), N, A, m) r ${0,1} IV  PRF(K1, <N>|<A>|<m>|<r>) c  Enc(K2, <r>|<m>; <IV>) return (IV, c)

synthetic IV approach for nonce-misuse res. AE security under bad randomness
augmented randomness for fault-resilient nm-res. AE security under diff. faults on N, A, m, r, IV

17

#RSAC
Summary

Introduced generic model for understanding fault resilience in computational security proofs

Signatures

­ confirm fault attacks on de-randomized signatures

­ provable security of combined randomization + de-randomization

Authenticated encryption

XEdDSA

­ fault-attack treatment of SIV mode of operation

­ propose combined SIV$ mode achieving fault resilience

18

#RSAC
Applying the Generic Fault Resilience Model
Select your favorite crypto primitive
­ fault resilience model is generic
Revise security definitions towards fault-resilient variant
­ What has to be taken care of when faults might happen in schemes?
Augment scheme with faulting profile
­ different memory variables / algorithms may be differently vulnerable
Assess provable fault-resilient security of augmented scheme
19

#RSAC
Summary
Introduced generic model for understanding fault resilience in computational security proofs Signatures
­ confirm fault attacks on de-randomized signatures ­ provable security of combined randomization + de-randomization
Authenticated encryption
­ fault-attack treatment of SIV mode of operation ­ propose combined SIV$ mode achieving fault resilience
Thank you! mail@felixguenther.info
20

