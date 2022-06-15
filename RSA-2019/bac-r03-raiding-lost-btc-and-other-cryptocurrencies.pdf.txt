SESSION ID: BAC-R03
Raiding Lost BTC and Other Cryptocurrencies

Konstantinos Karagiannis
CTO, Security Consulting BT @KonstantHacker

#RSAC

#RSAC
Is Bitcoin dead?
2

#RSAC
It's still a lot of money, folks...
4 million BTC Only 21 million can be mined by 2140 Almost 20%, plus other crypto
3

#RSAC
Why so many BTC and other coins are lost
Failed hard drives Forgotten passphrases "Suicidal" hacks (Parity) Death
4

#RSAC
A word before we proceed
5

#RSAC
How Bitcoin private keys work

Private Key

Public Key

Public Key Hash

Bitcoin Address

Elliptic Curve Multiplication

Double Hash SHA256 + RIPEMD160

Base58Check Encode

6

#RSAC
Finding the right strings
7

#RSAC
"The Legend of Satoshi Nakamoto" art puzzle
8

#RSAC
Passphrases and other insecure ways to generate keys

"These are not the droids you're looking for"
Block hashes
Merkle root
Repeated SHA256
SHA256 of another public address (over 100 found)

1G2rM4DVncEPJZwz1ubkX6hMzg5dQYxw7b Sha256(1PoHkMExsXDDBxpAwWhzkrM8fabmcPt6f4)
1Kap8hRf8G71kmnE9WKSBp5cJehvTEMVvD Sha256(1LdgEzW8WhkvBxDBQHdvNtbbvdVYbBB2F1)
1LsFFH9yPMgzSzar23Z1XM2ETHyVDGoqd5 Sha256(1FDWY63R3M87KkW2CBWrdDa4h8cZCiov9p)
13eYNM5EpdJS7EeuDefQZmqaokw21re4Ci Sha256(1E7kRki9kJUMYGaNjpvP7FvCmTcQSih7ii)
1CcSiLzGxXopBeXpoNSchagheK9XR61Daz Sha256(191XapdsjZJjReJUbQiWAH3ZVyLcxtcc1Y)
1J9Gtk5i6xHM5XZxQsBn9qdpogznNDhqQD Sha256(16fawJbgd3hgn1vbCb66o8Hx4rn8fWzFfG)

9

#RSAC
Not a way to go
10

#RSAC
Large Bitcoin Collider
11

#RSAC
Finding keys by address collision
Given a bitcoin address from a random(unknown) private key of numeric value between 2160 and 2256, find another private key in the interval between 0 and 2159 which will evaluate to the same bitcoin address. Too much for one machine
12

#RSAC
Using forensics on abandoned hard drives
13

#RSAC
Maybe use a live Linux distro and risk it?
14

#RSAC
Forensic search terms
Wallet.dat debug.log Db.log peers.dat Blocks Chainstate database
15

#RSAC
Tools
Open Source like CAINE Passware Kit Forensic ($1000, bruteforces wallet passwords) Magnet Internet Evidence Finder Forensic Toolkit (FTK) EnCase
16

Corrupt wallet recovery

#RSAC
pywallet python pywallet.py ­ dumpwallet > wallet.text
bitcoinj and mvn wallet-tool dump ­dumpprivkeys ­wallet=~/walletdecrypt.dat > wallet.txt
Hex editor search for 0201010420

17

#RSAC
Key backups exposed online
18

#RSAC
Quantum threats--from room size to tabletop
19

#RSAC
Quantum primer on particle-wave duality
Expected particle behavior ("pooling")
20

#RSAC
Quantum primer on particle-wave duality
Wave pattern without observation of which slit particle goes through
21

#RSAC
Quantum primer on particle-wave duality
Even one particle at a time creates wave pattern
22

#RSAC
Quantum primer on particle-wave duality
Use a detector on either slit, and pooling appears: particle-wave duality
23

#RSAC
Qubits and quantum algorithms
24

#RSAC
Cracking ECC encryption
25

#RSAC
Mining with quantum algorithms?
26

#RSAC
Be safe ... and keep it legal!
This is crypto research in both uses of the term. Up to you to use it legally. Protect your own cryptocurrencies from accidental loss or theft:
­ Keep wallets backed up and encrypted ­ Only keep as much crypto on your phone as you'd keep cash in your pocket.
Store majority in cold storage or a hardware wallet ­ Use password managers ­ Use two-factor auth on any accounts ­ Speak with estate lawyer about how to handle your crypto after...
Keep an ear to the quantum grapevine. Not kidding.
27

