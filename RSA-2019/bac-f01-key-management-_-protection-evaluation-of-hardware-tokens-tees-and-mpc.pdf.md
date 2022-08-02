SESSION ID: BAC-F01
Key Management & Protection: Evaluation of Hardware, Tokens, TEEs and MPC
Prof. Nigel Paul Smart
KU Leuven @SmartCryptology
#RSAC

The Problem

#RSAC

Cryptography is a central tool of computer security All cryptography relies on secrets: ­ Key exchange ­ Encryption ­ Digital signing ­ Authentication: passwords, keys, biometric templates Once a secret is stolen, all security is lost ­ Anything encrypted can be decrypted ­ All signing protections are lost (e.g., code signing) ­ Users can be impersonated ­ All of the above can be done without being detected

The Solution

#RSAC

Key protection - prevent an attacker from stealing secrets and keys

The cat-and-mouse problem ­ how do we protect keys without having the mechanism that protects them being stolen?

Two main directions ­ Hardware ­ Software

Hardware Tokens, Smartcards and HSMs

Hardware ­ Smartcards and HSMs

#RSAC

· Dedicated hardware for cryptographic operations
· Strong protection of private keys
· Keys are never exported (only key use is granted)
· Strong physical protection to prevent key access
· Special purpose device ­ no other code can run
· Certified to ensure compliance

Proc and Cons of Secure Hardware
Pros:
Clear security guarantee - assuming secure construction
Cannot be cloned Keys cannot be stolen
Cons:
Side Channels (old problem) Agility (old problem, becoming more relevant) Responding to vulnerabilities Usage of high-value keys

#RSAC

Problems with Hardware ­ Side Channels

#RSAC

Side-channel attacks (same old attacks, sometimes in new guises)
­ Timing attacks ­ Power analysis and differential power analysis ­ Acoustic analysis ­ Fault attacks
Early smartcards/tokens suffered significantly from these, but we still see problems in the field
­ Problem still exists (especially for "low end" devices) ­ At BlackHat Asia 2017, presented a break of South Korea Transit Card using Side-channel analysis
Situation is much better for high-end smartcards and for HSMs

Problems with Hardware ­ Agility

#RSAC

Agility ­ ability to quickly update
­ Crypto agility ­ new crypto vulnerabilities (e.g. SHA-1), standards, PQC, etc. ­ Software agility ­ updates due to software vulnerabilities
Degradation to lowest common denominator
­ HSM A only supports 0-IV CBC mode with 3DES , whereas HSM B supports AES GSM
Lack of agility
­ Padding-oracle attacks were hard to fix ­ New methods are slow to be adopted
o E.g., cannot run ECDSA signing for Bitcoin inside an HSM since the curve is not supported!

A Note on Vulnerabilities

#RSAC

Hardware modules are often just software in a closed box
All software suffers from vulnerabilities
­ Bugs in vendor code ­ Bugs in libraries used ­ Bugs in OS
This is not going to change
­ Software development processes have improved, but systems are increasingly complex and attackers more sophisticated
In this environment, a factor to consider is how hard it is to recover from the discovery of vulnerabilities
­ Especially when the software is in a closed box you cannot open!

Problems with Hardware ­ Key Usage

#RSAC

Key usage is still a big problem
In some applications, even a single fraudulent key use is a problem
­ Code signing ­ Cryptocurrency ­ Authentication to a sensitive account
If an attack breaches a machine that can use the keys on the HSM, then this can still be a problem
­ Can one integrate the authorization engine with the signing engine?

#RSAC 11

#RSAC

Securing Keys with General Purpose "Secure" Hardware
13

Securing Keys with General Purpose "Secure" Hardware #RSAC
A new emerging technology ­ trusted execution
­ Intel SGX ­ ARM TrustZone
Supposed to provide a secure enclave where general purpose code can be run
­ Provided with memory encryption ­ Code running in enclave cannot be viewed ­ Can be used for protection of keys and general data ­ Attestation methods to make sure correct code is running

Dedicated Crypto HW vs. General Purpose HW

#RSAC

The isolation issue
­ Dedicated HW (HSM) runs nothing but the crypto code, and so no software side channels are possible ­ General purpose HW is vulnerable to cache attacks, speculative execution attacks, clock attacks,...
Security without isolation ­ it is very hard (if not impossible) to prevent side channels
­ We don't know all of the channels yet (cannot prevent what you don't know) ­ Experience has shown that writing secret-independent code is extremely hard, if not impossible ­ This makes general purpose HW a cat-and-mouse situation

Software Side Channel Attacks

#RSAC

Cache attacks
Speculative execution attacks
Other side channels ­ Fault attacks via clock speed changes ­ Acoustics ­ It's an ever-changing area (cat-and-mouse zone)

#RSAC

Speculative Execution ­ Meltdown & Spectre

#RSAC

Modern processors use sophisticated methods to run faster ­ Processor guesses branch and continues by guess ­ If the guess is incorrect, then processor rewinds everything ­ But the cache is not changed
Attack code can train branch predictor of processor
Spectre has been shown to work again SGX ­ There are no good mitigations

#RSAC

Software Can software provide a solution?

The Appeal of Software-Based Key Protection

#RSAC

Ease of use and ease of management
­ Both for servers and endpoints ­ Suitable for virtualized environments ­ Users already carry around powerful computers ­ let's use them for security
o Mobile phones actually have security advantages over OTP devices and smartcards

Software is agile by definition
­ Easy to update o Bugs and flaws are everywhere, not just hardware o Need to have a good update strategy at the onset
­ Easy to incorporate new algorithms, standards, etc.

Securing via Software

#RSAC

The ideal ­ black-box obfuscation
­ Code that computes the secret operation, but cannot be read (and so key cannot be extracted)
Problems
­ General black-box obfuscation is impossible o Barak et al., On the Impossibility of Obfuscating Programs, CRYPTO 2001 o Weaker versions (iO) may be possible, but completely impractical today · So slow it makes general Fully Homomorphic Encryption look practical
­ Although appealing, it doesn't even solve the problem o If I can copy the code in entirety then I don't even need the key o Can be used in theory to enable partial operations (sign on only a type of code) o Can try to lock to a specific device (but code can be fooled)

Whitebox Crypto

#RSAC

General Obfuscation is impossible, and iO looks awful in practice.
Whitebox Crypto: Ad-hoc Obfuscation specifically for crypto algorithms ­ Note: it doesn't solve the problem of copying the entire code (cloning)
Very appealing ­ a number of vendors offer Whitebox ­ Excellent for mobile ­ Simple to deploy on endpoint and server
Initially, was intended for DRM where it makes more sense, but wider applications being found.
Main question is how secure is it?

#RSAC 24

#RSAC 25

A New Software Approach - MPC

#RSAC

Paradigm
­ Split the key into different random shares ­ Place the random shares in different segregated places ­ Compute without ever bringing the key together
How is this possible?
­ Multi-Party Computation (MPC)

MPC: A subfield of cryptography with the goal of creating methods for parties to jointly compute a function over their inputs while keeping those inputs private
What is MPC?
MPC CAN BE USE TO COMPUTE FUNCTIONS ON DATA WHICH YOU WANT TO KEEP PRIVATE

Securing Data

#RSAC

TLS/SSL IPSec

Hard disk encryption Database encryption HSM key storage

Data During Computation ???????????????????????????????????

Securing Data

#RSAC

TLS/SSL IPSec

Hard disk encryption Database encryption HSM key storage

Voting

Data During Computation

GDPR

Genomics

Public Policy

Citizen Privacy

Dining Bankers: The Problem

$40K

$110K

Mr. Red
$375K

Mr. Green
$80K

Mrs. Yellow

Mr. Blue

#RSAC
A group of bankers go to lunch. They are celebrating their bonuses just being paid. Each has been given a bonus of xi dollars. The one with the biggest bonus should pay. But they do not want to reveal their bonus values.

30

Dining Bankers: The Problem [2]

#RSAC

$40K

$110K

Mr. Red
$375K
Mrs. Yellow

Mr. Green

What they want to compute is the function "Banker name with max(, , , )"

$80K
Mr. Blue

without revealing the  values.
This problem (Millionaires Problem) introduced by Andy Yao in early 1980s. Yao won the Turing Award for this and other work.

31

Dining Bankers: Naïve Solution

#RSAC

$40K

$110K

Mrs. Yellow is buying Mr. Red lunch!
$375K

Mr. Green
$80K

If the bankers had a person they trusted they could get this person to compute the answer to their problem for them.
They give the trusted person their bonus values and the trusted person computes who should pay for lunch.

Mrs. Yellow

Mr. Blue

32

Dining Banker: MPC Solution

#RSAC

Mrs. Yellow is buying Mr. Red lunch!
Mrs. Yellow

Mr. Green Mr. Blue

In real life such trusted people do not exist, or are hard to come by. So we want a protocol to compute the function securely. This is what MPC does.
It emulates a trusted party, enabling mutually distrusting parties to compute an arbitrary function on their inputs.
All that is revealed is what can be computed from the final output.
33

Security of MPC Protocols

#RSAC

Security guaranteed even for malicious adversaries
­ Adversary who breaches machine and can run arbitrary attack code ­ Adversary knows protocols and is "expert" cryptographer
Number of parties and corruptions
­ Honest majority vs dishonest majority ­ 2 parties, 3 parties, many parties
Latency
­ Protocols with a few rounds of communication (guaranteeing low latency) vs many rounds of communication

34

Security of MPC

#RSAC

Mathematically proven guarantee of security
­ If attacker does not get to both machines (in one refresh period) nothing can be learned ­ Clear security model ­ not cat-and-mouse ­ No side-channels by design
Achieving a high level of security ­ it's all about separation
­ Different administrators (or at least different credentials) ­ Different OSs or defenses ­ Different environments
o Hybrid cloud, different clouds, endpoint/cloud

Key Usage Mitigation with MPC

#RSAC

Key theft is always a catastrophe ­ Attacker has unlimited access to key operations Mass key usage mitigation (e.g., decrypt credit card numbers) ­ Run anomaly detection on MPC machines Limited key usage is also a problem ­ Anomalous usage can be detected for mass use by an attacker ­ Low usage cannot be detected and prevented Examples ­ Cryptocurrency usage ­ Code signing

Key Usage Mitigation with MPC

#RSAC

MPC supports authorization structures ­ Can define arbitrary sets of servers/clients ­ In each set, can define subset size needed to authorize ­ Can define logical AND/OR between sets ­ Enforcement is cryptographic (not access control) ­ Useful for highvalue signing cases such as code-signing or cryptcurrencies

Can also protect client certificates ­ Client authenticates to HSM/MPC cluster ­ Use MPC to protect client authentication key

Security Properties of MPC

#RSAC

Mathematical proof of security (assume no access to enough shares) Strong separation achieves high level of security ­ Passive MPC server can run only MPC API
o Makes it equivalent to dedicated hardware, and as protected as HSM from software attacks
­ Can place in separate physical locations for physical protection
o Consider mobile and server, different countries for subpoenas
Has all benefits of software ­ Crypto and vulnerability agility ­ Management ease ­ Relevant for endpoint and server

Comparison of Approaches
39

What Metrics Should We Look At For Comparison?

#RSAC

Security properties ­ Key extractability ­ software attack ­ Key extractability ­ physical access ­ Crypto and vulnerability agility ­ Key usage mitigation Trust level for security properties ­ Experience (for good and bad) ­ Mathematically proven properties Usability ­ Platform agnostic ­ Functional flexibility ­ Performance ­ Administration

HW and SW Methods: Detailed Comparison

#RSAC

Key extractability ­ software access

Security

Key extractability ­ physical access
Agility
Key usage mitigation

Platform agnostic

Usability

Functional flexibility Performance

Administration

Software
(e.g. whitebox crypto, obfuscation)
 Exposed to co-location or process-injection attacks


N/A

  

TEE
(e,g. Intel SGX, ARM TrustZone)
 Exposed to co-location attacks (using SW-based side
channel)
 Manufacturers guarantee
nothing

Dedicated Crypto Hardware
(e.g. HSM, Smartcard)
 Cannot run general software (assuming no vulnerability)
 Need physical access and
significant effort

MPC
 Need to breach both machines simultaneously
 Need physical access to both;
can separate

Partial1





Endpoint: Partial Server: Limited, unclear
outlook





Anomaly detection,

authorization structures and

client cert protection













Efficient for master key

Efficient for master key

operations only

operations only







1. Internal SGX architecture uses non-PQC secure algorithms such as AES-128, requiring major firmware/hardware upgrade to comply with PQC.

HW and SW Methods for Key Protection

#RSAC

Secure

Dedicated Crypto HW
Solutions
(Examples: HSM, Smartcard, HW token, Secure Elements)

Clear security zone Cat and mouse zone

Secure Multiparty Computation
Trusted Execution Env (TEE)
(Examples: Intel SGX, ARM TrustZone)
Software Based Solutions
(Examples: Vault, Whitebox Crypto, Obfuscation, Security by Obscurity)
Usable

Summary
Dedicated crypto hardware
­ Key extractability is very hard ­ Security of other properties is lower (agility, key usage
mitigation) ­ Scores low on administration and flexibility (e.g., cloud
usages, endpoint) ­ Performance good for master-key operations
o Not suitable for mass symmetric encryptions
Software-based solutions
­ Key extractability is easy, and so very low security ­ Lack of formal security guarantees for practical solutions ­ Methods with formal security guarantees are utterly
impractical ­ Scores well on all other aspects

#RSAC
Trusted execution enclaves
­ Key extractability is very possible o Side channels are very hard to prevent, if not impossible o Many successful demonstrations of attack in recent years
­ Security of other properties is mixed (agility, key usage mitigation) ­ Scores reasonably on administration and flexibility (e.g., cloud
usages, endpoint) ­ Excellent performance
MPC based solutions
­ Key extractability is very hard ­ mathematical proof of security (assumes good separation) o Different to dedicated crypto hardware ­ not an exact comparison
­ Provides full agility and different key usage mitigation techniques ­ Scores high on administration and flexibility (e.g., cloud usages,
endpoint) ­ Performance good for master-key operations
o Not suitable for mass symmetric encryptions

Apply What We Have Covered
44

Application of this

#RSAC

Work out in your organization what are the requirements for key protection
­ Do you need HSMs due to PCI compliance? ­ What applications can be utilize non-HSM controls? ­ How easy is it to manage your infrastructure? ­ Do you require strong coupling between complex authorizations and key usage?
o e.g. as in cryptocurrencies or code-signing
­ Are your solutions susceptible to side-channel attacks? ­ How easy is it to spot anomalies? ­ Are you crypto-agile against new threats? ­ Can you easily switch algorithms when vulnerabilities are found? ­ How is key life cycle managed (creation, usage, rolling over and destruction of keys)

Questions?
46

Back Up Slides
47

MPC Example - Securely Computing the RSA Function

#RSAC

RSA signing and decryption:
­ Private key: ,  ­ Public key: (, ) ­ Private operation (sign/decrypt):  =  mod 
RSA key sharing
­ Server 1 has a random 1 ­ Server 2 has 2 =  - 1 mod   ­ Note that 1 + 2 =  mod () ­ Security:
o 1 reveals nothing about  since it's random o 2 reveals nothing about 1 completely hides 
48

MPC Example - Securely Computing the RSA Function

#RSAC

Recall: server 1 has 1 and server 2 has 2, such that 1 + 2 = 
Securely computing the private operation  =   
­ Server 2 computes 2 = 2 mod  and sends to server 1 ­ Server 1 computes 1 = 1 mod  ­ Server 1 computes  = 1  2 mod  ­ Server 1 verifies the result by checking that  =  mod  ­ Note:  = 1  2 = 1  2 = 1+2 =  mod 
o The last equality holds since addition in exponent is mod ()

49

Two-Party Protocol for RSA Decrypt/Sign

#RSAC

Inputs: Server 1 has key share 1 and ciphertext , and server 2 has key share 2

Client

Ciphertext 

1

Partial decrypt 2 = 2

2

Compute 1 = 1 and  = 1  2

50

RSA Secret Share Refresh

#RSAC

At fixed intervals (e.g., every hour), sharing of secret is refreshed For RSA:

Coin tossing to get 

1

2

Compute 1 = 1 + 

Compute 2 = 2 - 

Note that given 1 and 2 = 2 - , nothing can be learned about 

51

