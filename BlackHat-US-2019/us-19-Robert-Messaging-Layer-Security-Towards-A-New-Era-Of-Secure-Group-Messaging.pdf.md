Messaging Layer Security
Towards a new era of secure messaging...
Benjamin Beurdouche, Katriel Cohn-Gordon, Raphael Robert BlackHat USA 2019, Las Vegas, CA

Intro
- MLS: Messaging Layer Security - MLS is a new protocol for end-to-end encrypted
messaging - MLS is now an IETF working group - Why is this important now?
- Raphael Robert: Head of Security at @wire

Current status

Secure Messaging
Lots of secure messaging apps. Some use similar protocols...
... some are quite different. ... but all have similar challenges. Very different levels of analysis. Everyone maintaining their own libraries.

History of security properties
PGP (OpenPGP, S/MIME, ...) Confidentiality and Authenticity
Off-the-record protocol Introduces Forward Secrecy and Deniability
Double Ratchet algorithm Adapts to asynchronous communication, introduces the notion of "future secrecy"

What about groups?
Pairwise protocols cannot "just" be extended to accommodate for groups The pairwise channels can be superposed to simulate a group Tradeoff between security properties and scalability

What about groups?
Creating groups on top of a pairwise protocol is hiding the complexity behind a non-standard layer. Everybody has a different solution and everybody has different security properties.

Group management Secure 1:1 protocol

Modern security & scaling

scales well

?

Sender Keys
WhatsApp, FB, OMEMO, Megolm, et al.

S/MIME, OpenPGP

Client fanout
Signal, Proteus, iMessage, et al.
has modern security

Objectives

What do we want?
Security Protocol with modern security properties: Confidentiality and Authenticity Forward Secrecy (FS) Post-compromise Security (PCS) Membership authentication in groups Deniability (optional)

What do we want?
Async - Support sessions where no two members are online at the same time Group Messaging - Support large, dynamic groups with efficient scaling Multi-device support - Users should be able to use more than one device Federation - Members of groups should not be limited to only one server/service Usable - Focus on a practical drop-in for existing applications

What do we want?
Open standard - Complete specification usable by anyone Code reuse - Robust implementations that can be used in different contexts Security analysis - Involvement from the academic community

MLS

History

2015: ART

March 2018 IETF MLS BoF
May 2018 IETF MLS WG officially formed
...
2016: Stakeholders gather

Scope of TLS
Message Content (HTTP, SMTP, SIP, ...)
Security Protocol (TLS / DTLS)
Transport (TCP / UDP)

Certificate[Verify]
Authentication (PKI)

Scope of MLS
Application layer (messages, etc.)
Security Protocol (MLS)
Transport encryption (TLS)

Identity[Verify]
Authentication Service

Architecture

Authentication Service

Delivery Service

Client 1 User 0 Group

Client 2

... Client N
User M

MLS vs. TLS
- Lots of people - 2 vs. 10N - Long lived sessions - seconds vs. months - Lots of mobile devices involved - Designed for human-to-human communication
Significant probability that some member is compromised at some time in the life of the session

FS & PCS

Forward Security*

Endpoint Compromise
FS / PCS Interval

Post-Compromise Security*

Time

* ... with regard to a member

Key rotation
Alice creates a group with Bob

Bob updates key

Epoch 1

Epoch 2

Epoch 3

Epoch 4

Time

Alice adds Charlie

Alice removes Charlie

Key rotation

Alice creates a group with Bob

Epoch 1

Time

Alice: Bob:

KKeeyy11,,

KKeeyy22,,

KKeeyy33,,

... ...

Before we start
Every client/member publishes Init Keys ahead of time Init Keys are handled by the Delivery Service They contain credentials and a public key, so that we can encrypt data to them

The core: TreeKEM
The public state of a group is composed of a left-balanced binary tree of asymmetric public keys
Each member of the group occupies a leaf and knows all secrets in its path to the root.
Secrecy invariant: The private key for an intermediate node is only known to members of the subtree.

K

J

G

H

I

A

B

C

D

E

F

C has private keys for H, J, K

Trees of Keys
This has a couple of nice consequences:
Intermediate nodes represent subgroups you can KEM / encrypt to
Root private key is known to everyone in the group at a given time
Protocol maintains this state through group operations (Create, Add, Update, Remove)

K

J

G

H

I

A

B

C

D

E

F

Update
F wants to do an Update
- It generates a fresh leaf key - Hashes up to the root along the direct
path - Encrypts new values to the co-path

K

J

G

H

I

A

B

C

D

E

F

Add/Init
We want to add members to a group
- We fetch init keys for every member - New members get added as new
leaves to the tree - Newly added members will do an
Update when they come online

K

J

G

H

I

A

B

C

D

E

F

Remove
A wants to remove D
- A sends a message to the group saying D should be removed

K

J

G

H

I

A

B

C

D

E

F

Remove

A wants to remove D

- A sends a message to the group saying

D should be removed

- The direct path of D is blanked

- Therefore D does not know any tree

secret

G

- A can do an Update to derive a group

secret unknown to D

A

B

C

I

E

F

Messages
Handshake messages - Control messages (Create, Add, Update, Remove) with global order
Application messages - Typically text messages, but could be any data, with per-sender order
The Delivery Service enforces ordering of handshake messages

Efficiency
Pairwise protocols superpose 1:1 connections in a group (full mesh)

A

F

B

E

C

D

Efficiency
Pairwise sending: - Sending messages is in O(N)
Sender keys: - Fan-out an encryption key to everyone and use it for messages - Sending the encryption key out is still in O(N), sending a message is in O(1) - Problem: if a member leaves the group, everyone has to fan-out a new key in O(N^2)

Efficiency
MLS allows to maintain a group secret in O(log N) by using left-balanced binary trees
Example: 100k members and message size of 1kb
Pairwise: 100k operations and payload of 100k * 1kb = 100mb
MLS: 17 operations and payload of 17 * 1kb = 17kb

K

J

G

H

I

A

B

C

D

E

F

N^2

10,000,000

N

10,000

log N

1

Create

Add

Client Fanout

Update Sender Keys

Remove MLS

14 1 Message

Metadata protection
Message content is secret because of end-to-end encryption What data should we try to protect additionally? There are two kinds of metadata:
- Observable metadata - Persisted metadata

Metadata protection

- Servers will keep messages in queues, we just need to tell the server in which queue to save the message
- We can encrypt the sender of a message, the server doesn't need to have that information
- We can have arbitrary padding, so that clients can make messages indistinguishable from each other

Header 1 Header 2 Message
Padding

Deniability
Messages are signed for authenticity - Identity keys can be transferred over 1:1 deniable channels - Authorship of text messages becomes deniable - Participation in a group becomes deniable - Messages are also encrypted under the group key, therefore opaque to the server

Federation
Are we limited to one Delivery Service? Ordering for handshake messages is important If we can distribute the ordering problem across multiple delivery services, federation becomes possible.

DS 1

DS 2

DS 3

Federation
Federation without redundancy Simple approach: designate which Delivery Service is responsible for the ordering Federation with redundancy More advanced approach: have some consensus among the Delivery Services on which one is responsible for ordering

DS 1

DS 2

DS 3

Business messaging
Business communication is seeing a transformation from using email towards using messaging. This change is driven by consumer experience.

Business messaging
The encryption challenge Most solutions only use transport encryption (TLS) to protect messages and files. End-to-end encryption is challenging at scale.

Business messaging
The feature challenge Most solutions only enable users of the same organisation to talk to each other. Email is still popular as a legacy technology, because anyone can be reached. Federation contributed to the popularity of email.

Summary
- MLS aims to be new standard for secure messaging, especially in (large) groups
- Modern security properties - Robust, usable open specification - Usable solution for new and existing products
More information: messaginglayersecurity.rocks

Thanks

Benjamin Beurdouche @beurdouche ­ inria.fr
Katriel Cohn-Gordon @katrielalex ­ katriel.co.uk
Raphael Robert @raphaelrobert ­ wire.com

