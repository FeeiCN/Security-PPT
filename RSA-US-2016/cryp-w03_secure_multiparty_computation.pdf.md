SESSION ID:

CRYP-W03 - Secure Multiparty Computation

Hybrid Publicly Verifiable Computation

James Alderman, Christian Janson, Carlos Cid, Jason Crampton Royal Holloway, University of London

James Alderman
Post-doctoral Research Assistant Royal Holloway, University of London james.alderman@rhul.ac.uk

#RSAC
Contents
· Background · Overview of our model · Technical Details

#RSAC
Background

Verifiable Outsourced Computation

Verifiable Outsourced Computation
f

Verifiable Outsourced Computation
x
f

Verifiable Outsourced Computation
x
f
f(x)

Verifiable Outsourced Computation
x
f
f(x)

Verifiable Outsourced Computation
x
f
f(x)

Verifiable Outsourced Computation
x
f
f(x)
Outsourcing and verifying must be cheaper than computing f(x) locally

Searchable Encryption/Memory Delegation
x

Searchable Encryption/Memory Delegation
x

Searchable Encryption/Memory Delegation
f x
f(x)

Searchable Encryption/Memory Delegation

f x

or

f(x)

#RSAC
Our work

Our work - a hybrid system
Entities can act as both servers and clients as required Can sell spare resources to perform computations for others, or request computations when resources run low Data to be processed may be provided by the client or stored at the server Can restrict which servers can perform a given computation

Modes of Operation
We allow three modes of operation:
Revocable Publicly Verifiable Computation (RPVC): client provides data, anybody can verify correctness, misbehaving servers can be revoked
Revocable Publicly Verifiable Computation with access control (RPVC-AC): as above, but can restrict the servers that may compute on a given input Verifiable Delegable Computation (VDC): server holds data, clients request computations using public labels of the data, anybody can verify correctness

Definition
(PP, MK)  Setup(1k , F ) PKF  FnInit(F, MK, PP) SKS  Register(S,MK,PP) EK(O,),S  Certify(mode, S, (O, ), Li, Fi, MK, PP) (F, X, VKF,X)  ProbGen(mode, (, S), LF,X, PKF, PP) F(X)  Compute(mode, F,X , EK(O,),S, SKS, PP) (y,F(X))  Verify(F(X),VKF,X,PP) UM Revoke(F(X),MK,PP)

Our model

Our model - certifying servers
f g
g

Our model - RPVC

f

x, f

g

f(x)

o

g

Our model - public verifiability

x, f

f(x)

o

o

f g f(x)
g

Our model - revocation

f

x, f

g

Revoke

g(x) g

Our model - revocation

f

x, f

g

Revoke

g(x) g

Our model - RPVC with Access Control

Our model - RPVC with Access Control
f g
g

Our model - RPVC with Access Control

f

x, g,

g

x, g, g

Our model - RPVC with Access Control

x, g,

f

g(x)

g

x, g,

g

o

Our model - VDC
"x" "y"
"z"

Our model - VDC

"x"

f, "x"

"y"

f(x)

o

"z"

Our model - hybrid
"x" f

"y"

"z" f

g

#RSAC
Technical Details

Our approach
Our approach extends the key-policy attribute-based encryption scheme of Parno et al. [TCC '12] for Boolean functions Functions are encoded as attribute-based policies Input data is encoded as attributes Outsourced computations are encryptions of random messages under the input attributes Successful decryption  Policy satisfied  Function evaluates to 1 on input. Repeat for the compliment function

Our approach
We introduce Revocable-Key Dual-policy Attribute-based Encryption
DP-ABE combines key-policy and ciphertext-policy attributebased encryption
RPVC mode uses KP-ABE (functions in server evaluation keys)
VDC mode uses CP-ABE (data in server evaluation keys)
RPVC with access control mode uses both -- server key comprises function and authorisation attributes, ciphertext comprises input data and authorisation policy

Revocable-key DP-ABE

(PP, MK)  Setup(1k , U) CT(,S),t  Encrypt(m, (, S), t, PP)

S, O policies ,  attribute sets

SK(O,),ID  KeyGen(ID, (O, ), MK, PP)

UKR,t  KeyUpdate(R, t, MK, PP)

m  Decrypt(CT(,S),t,(,S),SK(O,),ID,(O,),UKR,t,PP)
if and only if   O and   S

if and only if O() = 1 and S() = 1

Definition

Recall:

(PP, MK)  Setup(1k , F ) PKF  FnInit(F, MK, PP) SKS  Register(S,MK,PP) EK(O,),S  Certify(mode, S, (O, ), Li, Fi, MK, PP) (F, X, VKF,X)  ProbGen(mode, (, S), LF, X, PKF, PP) F(X)  Compute(mode, F,X , EK(O,),S, SKS, PP) (y,F(X))  Verify(F(X),VKF,X,PP) UM Revoke(F(X),MK,PP)

Parameter Choices

Recall: key has policy O and attributes  Ciphertext has policy S and attributes 

Mode O   S label

Fi

RPVC

F {To} x {{TS}} "F"

F

RPVC-AC F

p

x

P

"F"

F

S, O policies ,  attribute sets To, TS dummy attributes p authorisation attributes P authorisation policy

VDC {{To}} x {TO} F

"x" F1, F2, ..., Fn

Security Models
Public Verifiability -- cheating servers are detected, servers can't use evaluation keys for different functions
Revocation -- revoked servers can't produce acceptable outputs
Authorised Computation -- only servers that satisfy the authorisation policy can produce acceptable outputs
Indistinguishability against selective-target with semistatic query attack (IND-sHRSS) -- security model for revocable-key DP-ABE

Summary
We introduce a hybrid framework for flexible outsourcing of computations
RPVC - revocable outsourcing on local data RPVC-AC - RPVC with access control policies detailing which servers can perform the computation VDC - verifiable querying on remote data
We introduce Revocable-Key Dual-policy Attribute-based Encryption to enable revocation of misbehaving entities

#RSAC
Thank you
eprint.iacr.org/2015/320

