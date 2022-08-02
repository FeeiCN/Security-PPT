
 PeckShield 

About Me
 (Edward) · Director of Vulnerability Research at PeckShield
· Has extensive experiences in OS kernel layer with deep knowledge in advanced vulnerability discovery and exploitation
· Before joining PeckShield, I worked for Qihoo 360 as the team lead of C0RE Team, which was recognized by Google as the top research team in 2017. I am now focusing on the security of blockchain infrastructure
· Submitted several vulnerabilities to the Ethereum Foundation

Blockchain Status Quo
ETHEREUM IN 2017
1,090 Dapps & 700+ Tokens 100,000 New Users Per Day Daily Trading > 1,000,000
MARKET CAP IN 2018
1,845 Cryptocurrencies Market Cap > 200 Billion Global GDP Rank: ~50th

2018/06 2018/05 2018/04 2018/04 2018/02 2018/01 2017/12 2017/06 2016/08 2016/01 2015/01 2014/03 2014/02

Security Incidents
Bithumb Hacks with $31 Million Dollars Stolen EDU, BAIC Smart Contracts Bugs BEC, SMT Smart Contracts Bugs Myetherwallet Suffer from DNS Hijacking BitGrail Hacks with Stolen Nano Tokens of 170 Million Dollars Coincheck Hacks with 530 Million Dollars Stolen Nicehash Hacks with 4700 BTC Missing with 62 Million Dollars Bithumb Hacks with 1 Billion Korean Yuan Loss and 30 Thousand User Info. Leaked Bitfinex Hacks with 120,000 BTC Stolen of 75Million Dollars Cryptsy Hacks with 13,000 BTC and 300,000 LTC Stolen Bitstamp Hacks with 19,000 BTC Stolen Poloniex Hacks with 12.3% BTC Lost Mt.Gox Hacks with Followed Bankruptcy

Blockchain Ecosystem

Cryptocurrency Exchange
Smart Contract

Digital Wallet Infrastructure

DApps

Mining Pool

Blockchain Ecosystem

Cryptocurrency Exchange
Smart Contract

Digital Wallet Infrastructure

DApps

Mining Pool

Security of Smart Contracts

Disclosed by PeckShield

codename

CVE-ID

batchOverflow

CVE-2018-10299

proxyOverflow

CVE-2018-10376

transferFlaw

CVE-2018-10468

ownerAnyone

CVE-2018-10705

multiOverflow

CVE-2018-10706

burnOverflow

CVE-2018-11239

ceoAnyone

CVE-2018-11329

allowAnyone1

CVE-2018-11397

allowAnyone2

CVE-2018-11398

tradeTrap1

CVE-2018-12017

tradeTrap2

CVE-2018-12062

tradeTrap3

CVE-2018-12079

...

...

Security of Smart Contracts

Blockchain Ecosystem

Cryptocurrency Exchange
Smart Contract

Digital Wallet Infrastructure

DApps

Mining Pool

Ethereum Clients
ETHEREUM CLIENTS
geth (golang) aleth (c++) Parity (Rust) ­ by Parity Technologies
MARKET SHARE
geth ~2/3 parity ~1/3

DApp Wallet

Attack Surfaces of a Node

Smart Contract

RPC interface issues

EVM related issues
Node

Protocol stack issues

Other Ethereum
Node
Other Ethereum
Node

Web

Other Ethereum
Node

Ethereum Protocol Stack

ETH

LES

Whisper

...

ÐVp2p

RLPx

· Various Sub-protocols
· Support arbitrary sub-protocols (aka capabilities) over the basic wire protocol
· Connection management
· Encrypted Handshake/Authentication · Peer Persistence · UDP Node Discovery Protocol

EPoD: CVE-2018-12018

ETH

LES

Whisper

...

ÐVp2p

RLPx

· Various Sub-protocols
· Support arbitrary sub-protocols (aka capabilities) over the basic wire protocol
· Connection management
· Encrypted Handshake/Authentication · Peer Persistence · UDP Node Discovery Protocol

EPoD: CVE-2018-12018
LIGHT ETHEREUM SUBPROTOCOL
· used by "light" clients, which only download block headers as they appear and fetch other parts of the on-demand · do not mine and therefore do not take part in the consensus process · Several message handlers for different types of messages
· StatusMsg, AnnounceMsg, GetBlockBodiesMsg, GetBlockHeadersMsg

EPoD: CVE-2018-12018

EPoD: CVE-2018-12018

Attacker

getBlockHeadersData { Origin = some hash Amount = 1 Skip = -1 (0xffff...f) Reverse = false
}

Victim

1. Allocate array for max # of blocks · allocate (Skip+1): Zero-Size Array Allocated
2. Query from returned array[Skip] · Access array[-1]: Out-of-Bound Read

DEMO

Possible Impacts

POSSIBLE VICTIMS
· Cryptocurrency exchanges · Mining pools · Bootnodes

Exchange Exchange

Mining pool

Attacker

Mining pool

Exchange

Bootnode

EPoD Patch

EPoD2: CVE-2018-12567

EPoD2: CVE-2018-12567

EPoD2: CVE-2018-12567

Attacker

announceData { Hash = some hash Number = -1 (0xffff...f) Td = -1 (0xffff...f) ...
}

Victim

· for n < head.Number · Allocate fetcherTreeNode · Append to n.children · Out-of-memory

DEMO

EPoD2 Patch

Freether: CVE-2018-11673

ETH

LES

Whisper

...

ÐVp2p

RLPx

· Various Sub-protocols
· Support arbitrary sub-protocols (aka capabilities) over the basic wire protocol
· Connection management
· Encrypted Handshake/Authentication · Peer Persistence · UDP Node Discovery Protocol

Freether: CVE-2018-11673
NODE DISCOVERY PROTOCOL
· Aimed at discovering RLPx nodes to connect to · UDP-based RPC protocol (kademlia-like) · Defines 4 packet types: ping, pong, findnode and neighbors

Freether: CVE-2018-11673

Freether: CVE-2018-11673

Freether: CVE-2018-11673

Attacker

ping { Version = 4 From = your addr To = target addr Expiration = -1 (0xffff...f)
}

Victim

1. Generate many key pairs 2. Sign the ping packets with each private key 3. Flood the victim with many ping packets 4. Each ping will consume a goroutine resource
after 16 pending ping requests

DEMO

Freether Patch

Conclusion
· Blockchian can't function without the fundamental components
· Infrastructure (nodes) · Mining pool ·...
· Vulnerability could exist in any aspects of the blockchain ecosystem
· EPoD / EPoD2 · Freether
· Some suggestions
· Smart contract audit before going online · Security response after going online · Community / Bounty Program

 

