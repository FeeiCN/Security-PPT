Symmetric-key Authenticated Key Exchange (SAKE) with Perfect Forward Secrecy
Gildas Avoine1,2 Sébastien Canard3 Loïc Ferreira3,
1 Institut Universitaire de France 2 Univ Rennes, INSA Rennes, CNRS, IRISA, France 3 Orange Labs, Applied Cryptography Group, Caen, France
CT-RSA 2020 February 24-28, 2020
 Work done while at IRISA

Context 125 billion connected IoT devices by 2030 [IHS17]

Data rate (bps)

108

107 WIFI

3G, 4G

106

DECT ULE 105

104

BLE

ZigBee

103

Z-Wave

102

LoRa, Sigfox, NB-IoT

RFID, NFC 10

1

10

102

103

104

Range (m)

[IHS17]

IHS Markit. The Internet of Things: a movement, not a market. 2017.

2/16

Context

Many applications Smart city

Connected home

eHealth

FANET (drone)

Vehicular

Industrial

Communication security  authenticated key exchange

3/16

Context  memory 
Low-resource devices computation  energy
Protocols based on asymmetric algorithms are too heavy for very constrained devices. Trade-off (very often): security vs. efficiency.
4/16

Goals and constraints

2-party protocol Key agreement Mutual authentication Forward secrecy







   
  

(EC)DH
d
+
signdature

Symmetric-key only

 

d



 Symmetric-key Authenticated Key Exchange

5/16

Description of the protocol

A  party authentication (K , Kj+1, Kj , Kj-1)  session key derivation
 master key update
 synchronisation
case K = Kj+1: upd enter case Kj
case K = Kj-1:  =1
case K = Kj : kdf; upd  =0

------A--r-A---- ----r-B---B-----

B (K , K )
B  MAC(K , B A rB rA)

kdf: sk  KDF(K , rA, rB )
upd: ­ K  H(K ) ­ K  H(K )

A  MAC(K ,  A B rA rB )

---------A----

case  = 1: upd

case  = 1: kdf; upd

------B-------

kdf; upd

--------A-----

6/16

Description of the protocol

A  party authentication (K , Kj+1, Kj , Kj-1)  session key derivation
 master key update
 synchronisation
case K = Kj+1: upd enter case Kj
case K = Kj-1:  =1
case K = Kj : kdf; upd  =0

------A--r-A---- ----r-B---B-----

B (K , K )
B  MAC(K , B A rB rA)

kdf: sk  KDF(K , rA, rB )
upd: ­ K  H(K ) ­ K  H(K )

A  MAC(K ,  A B rA rB )

---------A----

case  = 1: upd

case  = 1: kdf; upd

------B-------

kdf; upd

--------A-----

6/16

Description of the protocol

A  party authentication (K , Kj+1, Kj , Kj-1)  session key derivation
 master key update
 synchronisation
case K = Kj+1: upd enter case Kj
case K = Kj-1:  =1
case K = Kj : kdf; upd  =0

------A--r-A---- ----r-B---B-----

B (K , K )
B  MAC(K , B A rB rA)

kdf: sk  KDF(K , rA, rB )
upd: ­ K  H(K ) ­ K  H(K )

A  MAC(K ,  A B rA rB )

---------A----

case  = 1: upd

case  = 1: kdf; upd

------B-------

kdf; upd

--------A-----

6/16

Description of the protocol

A  party authentication (K , Kj+1, Kj , Kj-1)  session key derivation
 master key update
 synchronisation
case K = Kj+1: upd enter case Kj
case K = Kj-1:  =1
case K = Kj : kdf; upd  =0

------A--r-A---- ----r-B---B-----

B (K , K )
B  MAC(K , B A rB rA)

kdf: sk  KDF(K , rA, rB )
upd: ­ K  H(K ) ­ K  H(K )

A  MAC(K ,  A B rA rB )

---------A----

case  = 1: upd

case  = 1: kdf; upd

------B-------

kdf; upd

--------A-----

6/16

Description of the protocol

A  party authentication (K , Kj+1, Kj , Kj-1)  session key derivation
 master key update
 synchronisation
case K = Kj+1: upd enter case Kj
case K = Kj-1:  =1
case K = Kj : kdf; upd  =0

------A--r-A---- ----r-B---B-----

B (K , K )
B  MAC(K , B A rB rA)

kdf: sk  KDF(K , rA, rB )
upd: ­ K  H(K ) ­ K  H(K )

A  MAC(K ,  A B rA rB )

---------A----

case  = 1: upd

case  = 1: kdf; upd

------B-------

kdf; upd

--------A-----

6/16

Description of the protocol

A  party authentication (K , Kj+1, Kj , Kj-1)  session key derivation
 master key update
 synchronisation
case K = Kj+1: upd enter case Kj
case K = Kj-1:  =1
case K = Kj : kdf; upd  =0

------A--r-A---- ----r-B---B-----

B (K , K )
B  MAC(K , B A rB rA)

kdf: sk  KDF(K , rA, rB )
upd: ­ K  H(K ) ­ K  H(K )

A  MAC(K ,  A B rA rB )

---------A----

case  = 1: upd

case  = 1: kdf; upd

------B-------

kdf; upd

--------A-----

6/16

Description of the protocol: key evolution

authentication K0

H

K1

K2

K3

···

derivation

K0

H

K1

K2

K3

···

KDF

sk0

sk1

sk2

sk3

7/16

Description of the protocol

A  party authentication (K , Kj+1, Kj , Kj-1)  session key derivation
 master key update
 synchronisation
case K = Kj+1: upd enter case Kj
case K = Kj-1:  =1
case K = Kj : kdf; upd  =0

------A--r-A---- ----r-B---B-----

B (K , K )
B  MAC(K , B A rB rA)

kdf: sk  KDF(K , rA, rB )
upd: ­ K  H(K ) ­ K  H(K )

A  MAC(K ,  A B rA rB )

---------A----

case  = 1: upd

case  = 1: kdf; upd

------B-------

kdf; upd

--------A-----

8/16

Description of the protocol

A  party authentication (K , Kj+1, Kj , Kj-1)  session key derivation
 master key update
 synchronisation
case K = Kj+1: upd enter case Kj
case K = Kj-1:  =1
case K = Kj : kdf; upd  =0

------A--r-A---- ----r-B---B-----

B (K , K )
B  MAC(K , B A rB rA)

kdf: sk  KDF(K , rA, rB )
upd: ­ K  H(K ) ­ K  H(K )

A  MAC(K ,  A B rA rB )

---------A----

case  = 1: upd

case  = 1: kdf; upd

------B-------

kdf; upd

--------A-----

8/16

Description of the protocol

A  party authentication (K , Kj+1, Kj , Kj-1)  session key derivation
 master key update
 synchronisation
case K = Kj+1: upd enter case Kj
case K = Kj-1:  =1
case K = Kj : kdf; upd  =0

------A--r-A---- ----r-B---B-----

B (K , K )
B  MAC(K , B A rB rA)

kdf: sk  KDF(K , rA, rB )
upd: ­ K  H(K ) ­ K  H(K )

A  MAC(K ,  A B rA rB )

---------A----

case  = 1: upd

case  = 1: kdf; upd

------B-------

kdf; upd

--------A-----

8/16

Description of the protocol

A  party authentication (K , Kj+1, Kj , Kj-1)
 session key derivation

 master key update  synchronisation

 forward secrecy

case K = Kj+1: upd
enter case Kj

------A--r-A---- ----r-B---B-----

case K = Kj-1:  =1

case K = Kj : kdf; upd
 =0

B (K , K )
B  MAC(K , B A rB rA)
kdf: sk  KDF(K , rA, rB ) upd:
­ K  H(K ) ­ K  H(K )

A  MAC(K ,  A B rA rB )

---------A----

case  = 1: upd

case  = 1: kdf; upd

------B-------

kdf; upd

--------A-----

8/16

Description of the protocol

A  party authentication (K , Kj+1, Kj , Kj-1)
 session key derivation

 master key update  synchronisation

 forward secrecy

case K = Kj+1: upd
enter case Kj

------A--r-A---- ----r-B---B-----

case K = Kj-1:  =1

case K = Kj : kdf; upd
 =0

B (K , K )
B  MAC(K , B A rB rA)
kdf: sk  KDF(K , rA, rB ) upd:
­ K  H(K ) ­ K  H(K )

A  MAC(K ,  A B rA rB )

---------A----

case  = 1: upd

case  = 1: kdf; upd

------B-------

kdf; upd

--------A-----

8/16

Synchronisation issue

Party A (or B) can only be one step ahead, one step behind, or synchronised (  {-1, 0, 1}).
Whatever the initial synchronisation gap  between A and B, after a complete and correct
session A and B ­ share a fresh session key, ­ have updated their master keys, ­ are synchronised.

(0, 1)

(2, 3)

(4, 3)

0

(4, 5)

(4, 3) (4, 5)
(2, 1)

(0, 1)

1

(2, 1)

(2, 1) (2, 3)

----1--- ---2---- A ----3--- B ---4---- ----5---

(2(,43(,4)3,)5) -1 (0, 1)

9/16

Security arguments

Security model: Brzuska, Jacobsen, Stebila [BJS16]. ­ The adversary can forward, alter, drop any message exchanged by honest parties, or insert new messages. ­ It can interact with several oracles (NewSession, Send, Corrupt, Reveal, Test).
Two main security properties ­ Entity authentication. ­ Key indistinguishability.
The adversarial model also captures forward secrecy.
adveSnAtK-aEuth(A )  nq (nq - 1)2- + (q + 1)advpHrf(B) + 2advsMuAf-Ccma(C ) advkSeAyK-iEnd(A )  nq (q - 1)advpHrf(B) + advpKrDf F(D ) + adveSnAtK-aEuth(A )
where n is the number of parties, q the maximum number of instances (sessions) per party,  the size of the pseudo-random values (rA, rB ), and B is an adversary against the PRF-security of H, C an adversary against the SUF-CMA-security of MAC, and D an adversary against the PRF-security of KDF.

[BJS16]

C. Brzuska, H. Jacobsen, and D. Stebila. "Safely Exporting Keys from Secure Channels: On the Security of EAP-TLS and TLS Key Exporters". In: EUROCRYPT. 2016.

10/16

SAKE-AM: "agressive mode" of SAKE A
(K , K ) A  MAC(K , A B rA)
case  = 1: upd
kdf; upd A  MAC(K , A B rA rB )

----A---rA---A---
-----r-B---B---- --------A----- ------B-------

B (K , Kj+1, Kj , Kj-1)
case K = Kj+1: upd enter case Kj
case K = Kj-1:  =1
case K = Kj : kdf; upd  =0
B  MAC(K ,  B A rB rA)
case  = 1: kdf; upd

11/16

IoT setting
SAKE and SAKE-AM together. Any party can initiate the protocol. The smallest amount of computations is done by the same party (end-device).





  

Advantageous for



low-resource

  

end-devices





End-device is responder (SAKE)

End-device is initiator (SAKE-AM)

End-device [B] (K , K )

Back end [A] (K , Kj-1)

-----A--rA------ ------rB---B----
compute  -------A------ --------B-----
-------A ------

End-device [A] (K , K )

Back end [B] (K , Kj-1)

-----A--rA---A--- compute 
-----r-B---B---- --------A-----
------B-------

12/16

IoT setting
SAKE and SAKE-AM together. Any party can initiate the protocol. The smallest amount of computations is done by the same party (end-device).





  

Advantageous for



low-resource

  

end-devices





End-device is responder (SAKE)

End-device is initiator (SAKE-AM)

End-device [B] (K , K )

Back end [A] (K , Kj-1)

-----A--rA------ ------rB---B----
compute  -------A------ --------B-----
-------A ------

End-device [A] (K , K )

Back end [B] (K , Kj-1)

-----A--rA---A--- compute 
-----r-B---B---- --------A-----
------B-------

12/16

Practical application
LoRaWAN: security protocol for Low-Power Wide Area Networks (LPWAN). LoRaWAN 3G/4G but optimised for IoT/M2M. Currently deployed in more than 100 countries worldwide (America, Europe, Africa, Asia). Promoted by LoRa Alliance (+500 members). Version 1.0: weak against likely practical attacks [AF18]. Version 1.1: to be deployed.
Join Server

End-device

Gateway

Network Server

Application Server

[AF18]

G. Avoine and L. Ferreira. "Rescuing LoRaWAN 1.0". In: Financial Cryptography and Data Security. 2018.

13/16

Practical application
LoRaWAN: security protocol for Low-Power Wide Area Networks (LPWAN). LoRaWAN 3G/4G but optimised for IoT/M2M. Currently deployed in more than 100 countries worldwide (America, Europe, Africa, Asia). Promoted by LoRa Alliance (+500 members). Version 1.0: weak against likely practical attacks [AF18]. Version 1.1: to be deployed.
Join Server

End-device

Gateway

Network Server

Application Server

[AF18]

G. Avoine and L. Ferreira. "Rescuing LoRaWAN 1.0". In: Financial Cryptography and Data Security. 2018.

13/16

Practical application
SAKE-AM adapted to LoRaWAN 1.1 ­ Counters (instead of pseudo-random values). ­ "Confirmation" with the MAC session keys (instead of the updated authentication master key).
Only change in LoRaWAN 1.1: Join Request message computed with JSIntKey (instead of NwkKey ) master key.
Additional cost (in most cases) ­ End-device: 2 × H (computation). ­ Server: 1 key (storage) + 2 × H (computation).

End-device [A] (AppKey , NwkKey )

Join Server [B] (AppKey , NwkKey ,
JSIntKeyj -1 )

Join Request -------------
Join Accept -------------
RekeyInd -------------
RekeyConf -------------

compute 

14/16

Conclusion
To the best of our knowledge: SAKE is the first protocol ­ in the symmetric-key setting, ­ that provides forward secrecy, ­ with no additional functionality (e.g., synchronised clock, extra procedure), ­ provably secure in a strong security model.
Limitation: sequential executions. Not an issue depending on the context. Advantageous for low-resource devices. Suitable for actual use cases (e.g., LoRaWAN).
15/16

Symmetric-key Authenticated Key Exchange (SAKE) with Perfect Forward Secrecy
Gildas Avoine1,2 Sébastien Canard3 Loïc Ferreira3,
1 Institut Universitaire de France 2 Univ Rennes, INSA Rennes, CNRS, IRISA, France 3 Orange Labs, Applied Cryptography Group, Caen, France
CT-RSA 2020 February 24-28, 2020
 Work done while at IRISA
16/16

Backup slides

Related work

Signal's symmetric-key ratchet [PM16], ACD [ACD19], liteARCAD [CDV19], etc.
Authenticated key exchange protocol vs. asynchronous secure messaging protocols: ­ inspiring yet not strictly comparable, ­ but rather complementary (key exchange phase/application phase).

asym.

asym.

asym.

ratchet · · · · · · · ratchet · · · · · · · ratchet · · · ·

···

···

sym. ratchet sym. ratchet sym. ratchet

[ACD19] [CDV19]

J. Alwen, S. Coretti, and Y. Dodis. "The Double Ratchet: Security Notions, Proofs, and Modularization for the Signal Protocol". In: EUROCRYPT. 2019.
A. Caforio, F. B. Durak, and S. Vaudenay. Beyond Security and Efficiency: On-Demand Ratcheting with Security Awareness. Cryptology ePrint Archive. 2019.

[PM16]

T. Perrin and M. Marlinspike. The Double Ratchet Algorithm. 2016.

2/2

Related work

Signal's symmetric-key ratchet [PM16], ACD [ACD19], liteARCAD [CDV19], etc.
Authenticated key exchange protocol vs. asynchronous secure messaging protocols: ­ inspiring yet not strictly comparable, ­ but rather complementary (key exchange phase/application phase).

asym.

asym.

asym.

rSaAtcKhEet · · · · · · · rSaAtcKhEet · · · · · · · rSaAtcKhEet · · · ·

···

···

sym. ratchet sym. ratchet sym. ratchet

[ACD19] [CDV19]

J. Alwen, S. Coretti, and Y. Dodis. "The Double Ratchet: Security Notions, Proofs, and Modularization for the Signal Protocol". In: EUROCRYPT. 2019.
A. Caforio, F. B. Durak, and S. Vaudenay. Beyond Security and Efficiency: On-Demand Ratcheting with Security Awareness. Cryptology ePrint Archive. 2019.

[PM16]

T. Perrin and M. Marlinspike. The Double Ratchet Algorithm. 2016.

2/2

