Blockchain Security: From Curves to Contracts
Dr. Jimmy Chen, IKV & NTU Alex Liu, AMIS & MaiCoin
HITCON Pacific 2016

Aspects of Security
· ECDSA for Transaction Signing (including hardware signing) · Hash Function Collision Resistance · Privacy Preserving Features (Zero-Knowledge Proofs) · Consensus Algorithms · Smart Contract Correctness
2

Introduction to Blockchain
3

Source: http://technews.tw/2016/04/10/blockchain-applied-on-wall-street

4

Source: http://finance.technews.tw/2016/04/12/blockchain-bank-fintech

5

Source: https://kknews.cc/tech/m4kmbp.html

6

http://coinmarketcap.com

7

Elliptic Curve 
· The rich and deep theory of Elliptic Curves has been studied by mathematicians over 150 years
· Elliptic Curve over R : y2 = x3 + ax + b

Point Addition

Point Doubling

8
Image Courtesy: http://www.embedded.com/design/safety-and-security/4396040/An-Introduction-to-Elliptic-Curve-Cryptography

Curves over Prime Fields 

Addition:

(x3, y3) = (x1, y1) + (x2, y2) Doubling:

(x3, y3) = [2] (x1, y1)

s



 y2  y1

 x2  x1

 

3x12



a

 2 y1

mod mod

p p

(addition) (doubling)

x3  s2  x1  x2 mod p

y3  s(x1  x3 )  y1 mod p

24G

25G

13G

10G

27G

29G

23G

19G 16G

30G 14G

5G

3G

9G

11G

17G G(5,6)

20G 22G
26G 28G

4G

12G 15G

2G

8G

21G

7G

6G

18G

9

9

The Curve used by Bitcoin and Ethereum
256-bit prime
 secp256k1
https://en.bitcoin.it/wiki/Secp256k1
256-bit prime
10

Key Pairs 
· The base point G is fixed on the given Elliptic Curve
· P = [m] G
· Given m, it is easy and fast to find the point P · Using "double and add" for scalar multiplication
· Given P, it is extremely hard to find the integer m · Elliptic Curve Discrete Logarithm Problem ()
· A randomly generated integer m is a private key · A private key is used to sign Bitcoin transactions with ECDSA
· The point P is the public key corresponding to m · A public key is used by other nodes to verify Bitcoin transactions · A Bitcoin address is the hash value of a public key P
11

Bitcoin Transactions 

http://bitcoin.org/bitcoin.pdf 

Must be protected very well!!!
12

Hash Functions 
· An efficient function mapping binary strings of arbitrary length to binary strings of fixed length, called the hash-value or hash-code
(also fingerprint or checksum)
13

Cryptographic Hash Functions 
· H is a function with one-way property (pre-image resistance) if given any y, it is computationally infeasible to find any value x in the domain of H such that H(x) = y
· H is collision free (resistant) if it is computationally infeasible to find x'  x such that H(x') = H(x)
· H is a cryptographic hash function if · H has one-way property · H is collision free
14

SHA: Secure Hash Algorithm

· Cryptographic hash functions published by the National Institute of Standards and Technology (NIST) as a U.S. Federal Information Processing Standard (FIPS)

Algorithm and variant

Output size Internal state Block size

(bits)

size (bits)

(bits)

SHA-1 FIPS 180

160

160

512

SHA-224

224

SHA-256 Bitcoin

256

SHA-2 SHA-384

384

FIPS 180 SHA-512

512

SHA-512/224

224

SHA-512/256

256

SHA-3

SHA3-224 SHA3-256

Ethereum
(Keccak 256)

224 256

FIPS 202 SHA3-384

384

SHA3-512

512

256 (8  32)

512

512 (8  64)

1024

1600 (5  5  64)

1152 1088 832 576

Rounds
80 64 80
24

Bitwise operations
and, or, add, xor, rot

Security (bits)
Theoretical attack (261)

and, or, xor, 112 shr, rot, add 128

192
and, or, xor, 256 shr, rot, add 112
128

112

and, xor,

128

rot, not

192

256

https://en.wikipedia.org/wiki/Secure_Hash_Algorithm

15

Merkle Tree / Hash Tree

Block

Merkle Root

http://commons.wikimedia.org/wiki/File:MerkleTree1.jpg

16

Block Chain

Mining 

http://bitcoin.org/bitcoin.pdf 

17

Cryptowise Security
18

ECDSA: Choice of Two Curves
· Secp256k1 (Bitcoin and Ethereum)
· Secp256r1 (NIST P-256; parameters chosen by NSA)
Source: http://blog.enuma.io/update/2016/11/01/a-tale-of-two-curves-hardware-signing-for-ethereum.html 19

Possible Back Doors (per IEEE P1363)

Source: Bernstein, Daniel J., Lange, Tanja, "Security Dangers of the NIST Curves."

20

ECDSA Signing 

k : ephemeral key

http://en.wikipedia.org/wiki/Elliptic_Curve_DSA

21

ECDSA Verification 

http://en.wikipedia.org/wiki/Elliptic_Curve_DSA

22

Ephemeral Key & RNG
· The entropy, secrecy, and uniqueness of the DSA / ECDSA random ephemeral key k is critical
· Violating any one of the above three requirements can reveal the entire private key to an attacker
· Using the same value twice (even while keeping k secret), using a predictable value, or leaking even a few bits of k in each of several signatures, is enough to break DSA / ECDSA
· [December 2010] The ECDSA private key used by Sony to sign software for the PlayStation 3 game console was recovered, because Sony implemented k as static instead of random
23

Ephemeral Key & RNG

· [August 2013] Bugs in some implementations of the Java class SecureRandom sometimes generated collisions in k, allowing in stealing bitcoins from the containing wallet on Android app

· [August 2013] 158 accounts had used the same signature nonces r value in more than one signature. The total remaining balance across all 158 accounts is only 0.00031217 BTC. The address, 1HKywxiL4JziqXrzLKhmB6a74ma6kxbSDj, appears to have stolen bitcoins from 10 of these addresses. This account made 11 transactions between March and October 2013. These transactions have netted this account over 59 bitcoins.

· This issue can be prevented by deriving k deterministically from the private key and the message hash, as described by RFC 6979

http://www.theregister.co.uk/2013/08/12/android_bug_batters_bitcoin_wallets http://eprint.iacr.org/2013/734.pdf

24

Side-Channel Attacks 

D (double) or A (add) depends on the bits of Private Key

Image Courtesy https://eprint.iacr.org/2015/354.pdf

25

ECDSA Key Extraction from Mobile Devices
Fully extract secret signing keys from OpenSSL and CoreBitcoin running on iOS devices.

Sourse: https://www.tau.ac.il/~tromer/mobilesc

26

CoolWallet for Hardware Signing
 Infineon SLE97 
27

Quantum Resistant Suite
· In August, 2015, NSA announced that it is planning to transition "in the not too distant future" to a new cipher suite that is resistant to quantum attacks.
· NSA advised: "For those partners and vendors that have not yet made the transition to Suite B algorithms, we recommend not making a significant expenditure to do so at this point but instead to prepare for the upcoming quantum resistant algorithm transition."
· Prediction: Post-Quantum blockchains are appearing soon

https://en.wikipedia.org/wiki/NSA_Suite_B_Cryptography

28

Collision Resistance of SHA-2, -3 Hash Functions
· Blockchains depend on collision-resistant hash functions such as SHA-2 and SHA-3 for consensus (proof of work), wallet generation, and transaction signing. A successful pre-image attack would be a serious problem.
· What is the chance of a successful pre-image attack on SHA-2 and SHA-3 with the help of quantum computation?
· Attacks on both functions require on the order of 2128 queries in a quantum block-box model, hence suggesting than an attack is 275 billion times more expensive than a simple query analysis would suggest.
Source: Amy, Di Matteo, Gheorghiu, et. al., "Estimating the Cost of Generic Quantum Pre-Image Attacks on SHA-2 and SHA-3."
29

Zero-Knowledge Proofs for Blockchain Privacy
Source: Ben-Sasson, Chiesa, Garman, et. al., "Zerocash: Decentralized Anonymous Payment from Bitcoin."
30

Non-Crytpowise Security
31

Consensus Algorithms
· Consensus tolerating Byzantine failures must satisfy:
· Termination ­ every correct process decides some value. · Validity ­ if all correct processes propose the same value v, then all correct
processes decide v. · Integrity ­ if a correct process decides v, then v must have been proposed by
some correct process. · Agreement ­ every correct process must agree on the same value.

Sources: Lamport, L., Shostak, R., Pease, M., "The Byzantine Generals Problem."

32

Castro, M., Liskov, B., "Practical Byzantine Fault Tolerance and Proactive Recovery."

A Comparison of Consensus Algorithms

· Decentralized Control ­ anyone is able to participate and no central authority dictates whose approval is required for consensus.
· Low Latency ­ consensus can be reached in a few seconds.
· Flexible Trust ­ users have the freedom to trust any combination of parties they see fit.
· Asymptotic Security ­ safety rests on digital signatures and hash families whose parameters can be tuned to protect against adversaries with unlimited computing power.

Algorithm Proof of Work

Decentralized Control


Low Latency

Flexible Trust

Asymptotic Security

Proof of Stake



maybe

maybe

PBFT







Tendermint







Source: Mazieres, David, "The Stellar Consensus Protocol: A Federated Model for Internet-level Consensus." 33

Smart Contract Failures
34

The DAO Reentrancy Bug
Source: Jentzsch, Christoph, "Smart Contract Security and Decentralized Governance."
35

Establishing Security Patterns
36

Smart Contract Governance
37

Smart Contract Security Conclusions
· Practice prudent design (invariants, coverage, formal verification) · Defense in depth (cap transaction amount, time delays, circuit
breakers) · Design escape hatches (updateable contracts, multisig rescue)
 Keep smart contracts simple (only decentralize what absolutely needs to be decentralized). We are still in the early days.
38

Miscellaneous Blockchain Exploits
· DAO Reentrancy Bug (>$60 million loss) ­ mitigated by hard fork, time delays
· Bitfinex Compromise (>$60 million loss) ­ advanced persistent threat · Mt. Gox (>$400 million loss) ­ insider incompetence/fraud · Bitstamp ($5 million loss) ­ social engineering · Bitcoinica ($2 million loss) ­ insider incompetence/fraud · Many others totaling over $1 billion in losses
39

Thank you!

Image Courtesy https://www.ethereum.org/ether

40

