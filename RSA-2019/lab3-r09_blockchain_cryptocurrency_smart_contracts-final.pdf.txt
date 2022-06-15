SESSION ID: LAB3-R09
Blockchain, Cryptocurrency, Smart Contracts and Initial Coin Offerings: A Technical Perspective

Tom Plunkett
Consulting Solutions Director Oracle

Captain Brittany Snelgrove
United States Marine Corps

Captain Brandan Schofield
United States Marine Corps

#RSAC

Agenda
Blockchain and Cryptocurrency Overview Cryptography: Hashes, Digital Signatures, PKI Bitcoin and Blockchain Ethereum and Solidity Identity and Access Management with Blockchain Bitcoin Lab Demo Ethereum Lab Demo

Blockchain and Cryptocurrency
· Over 6000 Cryptocurrencies exist, and over 1000 new ones being created every year.
· VCs invested over $3 billion in 2018. · Initial Coin Offerings over $15 billion in 2018. · Over 3000 blockchain patent applications filed. · Over 30 Presentations at RSA Conference about Blockchain

Hash functions: takes any string as input
fixed-size output (example 256 bits)
efficiently computable Security properties:
collision-free (Nobody can find x and y such that x != y and H(x)=H(y))
hiding (Given H(x), infeasible to find x) puzzle-friendly (best search strategy is to just try random values of x)

Hash as message digest
If we know H(x) = H(y), it's safe to assume that x = y.
To recognize a file that we saw before, just remember its hash.
Useful because the hash is small.

Hash as a Commitment
Want to "seal a value in an envelope", and "open the envelope" later.
Commit to a value, reveal it later.

linked list with hash pointers = "block chain"
H( )

prev: H( )
data

prev: H( )
data

prev: H( )
data

use case: tamper-evident log

binary tree with hash pointers = "Merkle tree"

H( ) H( )

H( ) H( )

H( ) H( )

H( ) H( )

H( ) H( )

H( ) H( )

H( ) H( )

(data)

(data)

(data)

(data)

(data)

(data)

(data)

(data)

Digital Signatures, Public/Secret Keys
(sk, pk) := generateKeys(keysize)
sk: secret signing key pk: public verification key
sig := sign(sk, message)
isValid := verify(pk, message, sig)

Digital Signatures
"valid signatures verify"
verify(pk, message, sign(sk, message)) == true
"can't forge signatures"
adversary who: knows pk gets to see signatures on messages of his choice
can't produce a verifiable signature on another message

Aspects of decentralization in Bitcoin
1. Who maintains the ledger? 2. Who has authority over which transactions are valid? 3. Who creates new bitcoins? 4. Who determines how the rules of the system change? 5. How do bitcoins acquire exchange value?
Beyond the protocol: exchanges, wallet software, service providers...

Aspects of decentralization in Bitcoin
Peer-to-peer network: open to anyone, low barrier to entry
Mining: open to anyone, but inevitable concentration of power often seen as undesirable
Updates to software: core developers trusted by community, have great power

Distributed Consensus
Key technical challenge of decentralized electronic cash: distributed consensus
Definition: The protocol terminates and all correct nodes decide on the same value. This value must have been proposed by some correct node.

Bitcoin is a peer-to-peer system
When Alice wants to pay Bob: she broadcasts the transaction to all Bitcoin nodes
signed by Alice Pay to pkBob : H( )
Note: Bob's computer is not in the picture

Why consensus is hard
Nodes may crash Nodes may be malicious
Network is imperfect · Not all pairs of nodes connected · Faults in network · Latency
No notion of global time

What can a malicious node do?

CA  B

signed by A Pay to pkB : H( )

Doublespending
attack

signed by A Pay to pkA' : H( )

CA  A'

Honest nodes will extend the longest valid branch

From Bob the merchant's point of view

1 confirmation

3 confirmations

CA  B

CA  A'

double-spend attempt

Double-spend probability decreases exponentially with # of confirmations

Hear about CA  B transaction 0 confirmations

Most common heuristic: 6 confirmations

Incentives: block rewards and mining fees
Creator of block gets to · include special coin-creation transaction in the block · choose recipient address of this transaction
Block creator gets to "collect" the block reward only if the block ends up on long-term consensus branch!
Transaction Fees: Creator of transaction can choose to make output value less than input value. Remainder is a transaction fee and goes to block creator

Proof of work
To approximate selecting a random node: select nodes in proportion to a resource that no one can monopolize (we hope)
· In proportion to computing power: proof-of-work · In proportion to ownership: proof-of-stake

Hash puzzles

nonce

To create block, find nonce s.t.

prev_h Tx

H(nonce  prev_hash  tx  ...  tx) is very small

Tx

Output space of hash

Target space

If hash function is secure: only way to succeed is to try enough nonces until you get lucky

Mining economics

If mining reward (block reward + Tx fees)

>

hardware + electricity cost



Profit

Complications: · fixed vs. variable costs · reward depends on global hash rate

A transaction-based ledger (Bitcoin)

1 time

Inputs: Ø

Outputs: 25.0Alice

2 Inputs: 1[0]

change address

Outputs: 17.0Bob, 8.0Alice

SIGNED(Alice)

3 Inputs: 2[0]

Outputs: 8.0Carol, 7.0Bob

SIGNED(Bob)

4 Inputs: 2[1]

Outputs: 6.0David, 2.0Alice

SIGNED(Alice)

we implement this with hash pointers
finite scan to check for validity
is this valid?

SIMPLIFICATION: only one transaction per block

Bitcoin script execution example
 <pubKeyHash?>
<p<upbuKbeKyeHya>sh> <pubKey> <tsriuge>
<sig> <pubKey> OP_DUP OP_HASH160 <pubKeyHash?> OP_EQUALVERIFY OP_CHECKSIG

Bitcoin block structure
Hash chain of blocks

prev: H( ) trans: H( )

prev: H( ) trans: H( )

prev: H( ) trans: H( )

Hash tree (Merkle tree) of transactions in each block

H( ) H( )

H( ) H( )

H( ) H( )

transaction

transaction

transaction

transaction

Storing Private Keys: store key in a file, on your computer or phone
Very convenient. As available as your device.
device lost/wiped  key lost  coins lost
As secure as your device.
device compromised  key leaked  coins stolen

Evolution of Bitcoin mining

CPU

GPU

ASIC

FPGA

gold pan sluice box placer mining

pit mining

Professional mining centers
Needs: cheap power good network cool climate
BitFury mining center, Republic of Georgia

Identifying Addresses By Spending
Shared spending is evidence of joint control
Addresses can be linked transitively

Bitcoin links
 https://bitcoin.org/bitcoin.pdf  https://github.com/bitcoinbook/bitcoinbook/blob/develop/book.asciidoc  https://p2sh.info/dashboard/db/home-dashboard?orgId=1  https://github.com/petertodd/python-bitcoinlib  https://en.bitcoin.it/wiki/Script  https://bitinfocharts.com/top-100-richest-bitcoin-addresses.html  http://cs251crypto.stanford.edu/18au-cs251/  http://bitcoinbook.cs.princeton.edu/

Ethereum
 Solidity programming language: similar to Java/Javascript, with cryptocurrency functionality built in  Smart Contracts are the Solidity equivalent of java classes that run on a blockchain in an Ethereum
virtual machine  Transaction costs in Solidity are called gas costs. Everything that executes on the blockchain has a
gas cost associated with it.  Security is very important. Solidity has greater capabilities than Bitcoin Script, and far greater
security vulnerabilities.

Ethereum and Solidity links
 http://bit.do/cs251solidity  https://remix.ethereum.org/  https://coursetro.com/posts/code/97/Ethereum-Smart-Contracts:-Variables-and-Types-Tutorial

Identity and Access Management with Blockchain on GCSS-MC
Capt Brandan Schofield Capt Brittany Snelgrove
33

Evolve the MAGTF, operate with resilience, and enhance the Marine Corps' maneuverability
- Marine Corps Operating Concept
34

35

· What is GCSS-MC? · Current architecture · Research Questions · What is blockchain? · Proposed architecture · Benefits · Timeline · Questions

Agenda
36

What is GCSS-MC?
· USMC's Supply and Maintenance Management Web-enabled Dataresource
· Used to manage, control, identify and distribute ground supplies and coordinate maintenance actions for all ground Marine units
· Software ­ Oracle E-Business Suite (EBS) version R12 · 3 Tier System
· Database Tier · Application Tier · Client Tier · Requires Internet Connection to function · Access Management · Oracle Access Management (OAM) using Online Certificate Status
Protocol (OCSP) part of PKI terminating at CONUS based DISA Servers

Current Architecture

Access

Access Request

DB DISA Web Server

1

GCSS DB USMC Web Server

2

Access Granted

Client

Problem: 67% of user transaction time devoted to DISA check 13.5% of network overhead (Mbps)

Current Physical Architecture

Web Server

User 1 Access Request

6 Access

GSCC Data Resource
D B

5 Access Y/N

4 Access Y/N

2 Access Request

3 Access Server

D B
Access Lookup
User/Policy Datastore

Typical Oracle Access Management

Research Questions
1. How can a blockchain database be used to authenticate clients on the GCSS-MC web-enabled data resource? (Experimentation)
2. How can a blockchain database be feasibly acquisitioned and integrated into the current GCSS-MC architecture? (Qualitative)

GCSS DB USMC Web Server

Proposed Architecture
Peer/node

Peer/node

Peer/node

Client
2
1

Peer/node
41

GCSS DB USMC Web Server

Proposed Architecture
Peer/node

Peer/node

3 Peer/node

Client

Peer/node
42

Proposed Logical Architecture

4 User
3

Access
Access Y/N

1 Access Request

Web Server

GCSS Data Resource

5 Access

D B
Node

2

Node

BC

Node

Authenticate

Blockchain Policy Cluster

Blockchain Access Management

Benefits
· Decentralized user authentication · Network overhead potentially reduced · No DMZ required (trustless system) · No expensive centralized web-servers and data-stores · Potential increase in availability for remote users · Policy enforcement through algorithm
· "Trust through algorithm"

Questions
45

Bitcoin Lab Demo #1

Ethereum Lab Demo #1

