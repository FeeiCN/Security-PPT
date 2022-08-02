SESSION ID: IDY-W02
Zero-knowledge proofs (ZKP): Privacy Preserving Authentication

Karla Clarke
Manager KPMG

Rajan Behal
Managing Director KPMG

#RSAC

Privacy Preserving Digital Identity
Balancing Personal Privacy with Institutional Integrity

#RSAC
Risks
Loss of privacy Data breaches Identity theft Surveillance
3

Digital Identity Model

Authenticator Enrollment/
Issuance

Authenticated Session

becomes

Subscriber

becomes

$

Relying

Party

RP

(RP)

Applicant
Enrollment and Identify Proofing

Claimant

Authenticate

Authentication Assertion

CSP
Credential Service Provider (CSP)

Validate Authenticator/Credential Binding Attributes
4

Verifier

#RSAC

Privacy Preserving Digital Identity Model

Authenticated Session $

becomes

becomes

Subscriber

RP

Applicant

Authenticator Enrollment/
Issuance

Enrollment and Identify Proofing

Claimant

Authentication

ZKP

Assertion

Validate Authenticator/Credential Binding

CSP

Zero Knowledge Proofs (ZKP)

Verifier

#RSAC

5

Zero-Knowledge Proofs
Definition

#RSAC
What is Zero-Knowledge Proof?
Zero-knowledge proofs are an elegant technique to limit the amount of information transferred from a prover `A' to a verifier `B' in a cryptographic protocol.
­ The idea is to replace "knowledge" by "knowledge about knowledge"
The name "zero-knowledge proofs" is slightly misleading, since the prover A reveals one bit of knowledge to the verifier B (is input I a member of language L?).
­ L = interactive proof for the language L
7

#RSAC
Zero-Knowledge Proof Properties
ZKP enables: Completeness oIf statement is true, verifier will be convinced by prover. Soundness oIf statement is false, a cheating prover cannot convince verifier it is true. Zero-Knowledge oVerifier learns nothing beyond the statement's validity.
8

#RSAC
ZKP Usage with Authentication
Performing authentication without exchanging passwords Enterprises can protect proprietary information by sharing proofs about the data without sharing the actual data

Prover

Declares Identity & Requests

1

Authentication

Sends challenge

2

Computes challenge without

3

disclosing secret

Verifier

9

Zero-Knowledge Proof Illustration
Quick Activity!

#RSAC
Zero-Knowledge Proof Illustration

The Challenge:

Mathew Green

1

9

2

3

4

5

6

8 7
10 11

11

#RSAC
Zero-Knowledge Proof Illustration
The Solution:

1

9

2

3

4

5

6

8 7
10 11

12

Zero-Knowledge Proof Illustration

The hats perfectly

covered `protects' the

1

solution

2

3

4

5

6

#RSAC

9

8

7

10

11

13

Zero-Knowledge Proof Illustration

Proof of Solution:
1
Remove any two hats

See vertices are different colors

2

3

4

5

6

14

#RSAC

9

8

7

10

11

Zero-Knowledge Proof Illustration

Repeat this process:
­ Clear previous solution ­ Add randomness ­ Solve again

1

2

3

Accept or reject:

4

­ Complete for preset

number of rounds ­ Telecom accepts or rejects

5

6

15

#RSAC

9

8

7

10

11

Zero-Knowledge Proof Variants
Practical Application

#RSAC
Zero-Knowledge Proof Variants

ZKP
NIZKP Graph Isomorphism zk-SNARK zk-STIK
zk-STARK
Designated Verifier
Bulletproof
Laticce-Based

Interactive, multiple messages, need stable communication channel Not interactive, one message Interactive, compare graphs, efficient computation Need one-time, trusted setup to generate key at launch Scalable Transparent Interactive Oracle of Proof (IOP) of Knowledge No setup, working on memory issues, I or NI, post-quantum secure DVNIZK, not just any entity can be verifier, verifier must know secret No setup, 188 bytes, 10 ms in some cases, not post-quantum secure Lattice-based cryptography, post-quantum secure, research

17

#RSAC
Zero-Knowledge Proof Practical Application
Where to apply ZPK:
­ Authentication ­ Messaging ­ Secure Sensitive Information (PCI Data) ­ Data Sharing ­ File System Control ­ Storage Protection
18

#RSAC
Zero-Knowledge Proof : Use Cases
ING is a Netherlands based bank Experian UK citizens using the GOV.UK
19

#RSAC
Zero-Knowledge Proof : Technology Landscape

MIRACL

SEDICCII

Velix.ID

Microsoft UProve SOVRIN

KRIPTAN NUGGETS

STRATUMN

NuID

PEER MOUNTAIN

Val:ID

CIVIC

IBM QEDit

20

Considerations
Potential Challenges

#RSAC
Zero-Knowledge Proof Considerations
Transparent Universal Compliant with upcoming ZKP Standards Interactive, non-interactive Secure (threat model) Post-quantum secure
22

#RSAC
Zero-Knowledge Proof Challenges
Low usability Expensive Requires high compute power
23

#RSAC
Zero-Knowledge Proof Application
Assess use cases for privacy preserving authentication and authorization Evaluate and perform a POC with a ZKP Identity landscape solution Protect identities using ZKP
24

Questions
The KPMG name and logo are registered trademarks or trademarks of KPMG International. The information contained herein is of a general nature and is not intended to address the circumstances of any particular individual or entity. Although we endeavor to provide accurate and timely information, there can be no guarantee that such information is accurate as of the date it is received or that it will continue to be accurate in the future. No one should act upon such information without appropriate professional advice after a thorough examination of the particular situation.

#RSAC

References
Stand on the Shoulders of Giants

#RSAC
References
Anwar, H. (2018, November 30). What is ZKP? A Complete Guide to Zero Knowledge Proof. Retrieved from https://101blockchains.com/zero-knowledge-proof/#7 Attribute-based Credentials for Trust (ABC4Trust) Project AU2EU Project, Authentication and Authorization for Entrusted Unions Bitansky, Nir; Weizman, Zvika Brakerski; Kalai, Yael. 3-Message Zero Knowledge Against Human Ignorance Camenisch, Jan and E. Van Herreweghen, Design and implementation of the IBM Idemix anonymous credential system , in Proceedings of the 9th ACM conference on Computer and communications security Camenisch, Jan; Dubovitskaya, Maria; Enderlein, Robert; et al. Concepts and languages for privacy-preserving attribute-based authentication Cutler, Becky. The Feasibility and Application of Using Zero-Knowledge Protocol for Authentication Systems Durcheva, Mariana. Zero Knowledge Proof Protocol Based on Graph Isomorphism Problem Feige, U., Fiat, A., & Shamir, A. (1988). Zero-knowledge proofs of identity. Journal of cryptology, 1(2), 77-94. Fleischhacker, Nils; Goyal, Vuypil; Jain, Abhishek. On the Existence of Three Round Zero-Knowledge Proofs Geraud, Rémi. Zero-Knowledge: More Secure than Passwords Grassi, P. A., Richer, J. P., Squire, S. K., Fenton, J. L., Nadeau, E. M., Lefkovitz, N. B., . . . Theofanos, M. F. (2017). Digital identity guidelines: Federation and assertions. doi:10.6028/nist.sp.80063c Green, Matthew. Zero Knowledge Proofs: An Illustrated Primer https://cryptographyengineering.com/2014/11/27/zero-knowledge-proofs-illustrated-primer/ (November 2014). Limited, M. U. (n.d.). Miracl. Retrieved from https://www.miracl.com/experian-case-study
27

