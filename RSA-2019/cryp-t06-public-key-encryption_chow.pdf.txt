SESSION ID: CRYP-T06
Structure-Preserving Certificateless Encryption and Its Application

Prof. Sherman S. M. Chow
Department of Information Engineering Chinese University of Hong Kong, Hong Kong @ShermanChow

joint work with Tao Zhang and Huangting Wu

CUHK  Tencent

CUHK

#RSAC

Modular Design
Reduction in Cost

#RSAC
Flexibility in Design

1/28

#RSAC
Some "Traditional Views"
To use a modular approach in designing cryptosystem means...
­ it would be insecure since mix-and-match types of attack will succeed ­ it would be hopelessly inefficient when compared to a specific design
To use public key encryption, we need public-key infrastructure. To issue a signature, everyone knows who is the signer. To ensure anonymity, we would lose accountability.
2/28

#RSAC
Modern Cryptography
TSotruusectaumreo-dPurleasr earpvpirnogacChriynpdteosgigrnainpghcyryisptaosfyrsatmemewmoearnks ... ­­foiittrwwsooeuucllddubbreeeihlnyospe&eculeresesflsfyiincincieeefnmfictixile-yanntrdwe-ahmelainztccihnomtgyppaaersgeoedfntaoettaraisccpkewdciieflliscsiudgcencsei.gend TCoeursteifipcuabtleiclekesys eEnnccrryypptitoino,nwdeoneesdnpoutbrleicq-kueiyreinafrnasytrPuKctIu. re. TGoriossuupe Saisgignnaattuurree, eenvesruyroense Skingonwesrw-Ahnooisntyhme sitigynaenr.d TAocecnosuunretaabnoilnityymsitiym, wuletawnoeuoldulsolsye. accountability.
3/28

#RSAC
Rundown
Structure-Preserving Cryptography Certificateless Encryption
Structure-Preserving Certificateless Encryption and Its New Application (in Group Signatures with "Certified Limited Opening")
4/28

Structure-Preserving Cryptography
(and Bilinear Groups and Groth-Sahai Proof System)

#RSAC
Structure-Preserving Cryptography
A framework for securely and efficiently instantiating a design But why it can be efficient? Because all of the building blocks use the same "structure" Suppose we compose encryption and signature together.
­ Encryption is based on a "group" ­ Signature is based on the same "group"
What kind of group is popular? Bilinear group!
6/28

#RSAC
Bilinear Groups
G, H, and GT are 3 multiplicative cyclic group of prime order p.
e: G x H (base groups)  GT (target group) is bilinear:
g  G, h  H, x, y  Zp, e(g, h) = e(g, h)xy
Why is it useful? We can multiply the secret exponents!
­ Discrete logarithm is still hard: given g, gx, cannot recover x.
7/28

#RSAC
Structure-Preserving Cryptography for Bilinear Groups
All public objects (public-key, messages, signatures, etc.) merely consists of elements in G and H. Verifying relations of interest can be done only by group op.'s, membership testing, and evaluating pairing product equations:
i e(Ai, Yi) i e(Bi, Xi) i j e(Xi, Yj)cij = T where {cij} and T are system-defined constants. Every building blocks follow the same form. But why it can be secure? Groth--Sahai proof system (Eurocrypt '08) can prove about it
­ without leaking {Ai}, {Bi}, {Xi}, {Yi}!
8/28

Certificateless Encryption
(and why it is better than Identity-Based Encryption)

#RSAC
Identity-Based Encryption (IBE)
- Public System Parameter -

Bob knows Alice

Encrypt to "Alice"
10/28

Hey guys! I'm Alice~

#RSAC
Who can decrypt? Authenticated Users and KGC
Generate ID-based Secret Key (using Master Secret)

Alice
Alice the Receiver · Authenticated · Get an ID-based secret key
11/28

Alice

Certificateless Encryption (CLE)

I have

but not

CEO
E71434...


Hey~ CEO !

CEO
ID-based "Encryption keys" user secret key

CEO

E71434...

12/28

#RSAC
Name := Alice Public Key := E7143402FA80C EBED9E171243...402
E71434...
PKE decryption key

#RSAC
Benefits of Certificateless Encryption
In essence, CLE = PKE + IBE
­ (+strong decryption oracle, cf., Chow--Franklin--Zhang in CT-RSA '14)
Implicit certificate (better than PKE)
­ The encryptor does not need to verify any certificate. ­ Only the right person can get the "partial decryption key" from the KGC.
Free from key-escrow (better than IBE)
­ The KGC does not know the "user private key".
13/28

Structure-Preserving Certificateless Encryption
a new primitive in Structure-Preserving Cryptography

#RSAC
Upgrade from Structure-Preserving IBE?
There is no known construction of structure-preserving (SP) IBE. Only partial SP-IBE exists (ID is not a group element).
­ proposed by Libert--Joye in CT-RSA '14
IBE  Signature, i.e., the ID-based secret key is a signature on ID IBE decryption: pairing up this signature with the ciphertext. Can we upgrade structure-preserving signatures (SPS) to IBE? Verification of existing SPS requires computing a pairing where both of the input elements come from the signature.
15/28

#RSAC
Upgrade from Structure-Preserving PKE?
If not SP-IBE, how about using SP-PKE? How to ensure that the user public key is still "related" to the master public key of the IBE system?
­ Otherwise, even if you are not the CEO, you can claim to be and decrypt.
Ask the encryptor to somehow check the user public key? May work in principle... but it is rather meaningless... CLE is for relieving the encryptors from verifying a certificate... And now you are asking them to verify a public key?
16/28

#RSAC
Our Idea: upgrades from Structure-Preserving Signature
We employ an SP signature scheme by Abe et al. in Crypto '11. For public key (g, h, W1, W2, V1, V2), verification equations are: e(W2, R) e(g, S) e(U, M0) = e(W1, h) e(T, R) e(M1, V1) e(M2, V2) = e(g, h) where (R, S, T) is a signature on the message vector (M0, M1, M2) Trick 1: we use the signature (R, S, T) to also sign on M0 = R Trick 2: we set M1 as the identity and M2 as a user public key
17/28

#RSAC
High-Level Idea of the Conversion
Public Key of SPS  Master Public Key of SP-CLE Signature of SPS  Partial Private Key of the User
We exploit the elements in the pairing product equations of SPS. Some elements embedded the encryption randomness. Only valid verification equations can recover the randomness. But how?
18/28

#RSAC
More Details of the Conversion
e(W2, R) e(g, S) e(U, R) = e(W1, h) // R, S, T are now "private" e(T, R) e(ID, V1) e(D, V2) = e(g, h) // where D is a user public key The choice depends on the input elements of a pairing. Both elements are public: we make them the session key. One of the elements is public: we embed the randomness. Both elements are private (which is also why SP-IBE plan fails): we publish one element (R in our case) as a user public key too.
19/28

#RSAC
Spelling out the details...
e(W2, R) e(g, S) e(U, R) = e(W1, h) // e(g, S): only S is private e(T, R) e(ID, V1) e(D, V2) = e(g, h) // e(T, R): only T is private
C0 = MK, Cg = gx, CR = Ry, Cz = gz // M is the message to encrypt K = {e(W2, R) e(U, R) / e(W1, h)}x // K is the session key
 {e(ID, V1) e(D, V2) / e(g, h)}y  e(D, hz)
20/28

#RSAC
Making it preserving more structure
Message is in the target group GT. Ciphertext has many elements in the target group GT. We can exploit the tricks of Libert--Joye to resolve these.
21/28

Group Signatures with Certified Limited Opening
a new primitive for Accountable Privacy

#RSAC
Group Signatures
Group-oriented signatures with anonymity
­ but with an explicit group formation (diff. from ring signature)
A group manager (GM) issues credentials Any member can sign for the group
­ remain anonymous within the group ­ signatures are unlinkable ­ but, unconditional anonymity may be abused, we want accountability
An opening authority (OA) can "open" a group signature to reveal its true signer
23/28

#RSAC
Group Signatures with Message-Dependent Opening
OA is too powerful. Message-dependent opening introduces another "admitter". The admitter generates a message-dependent opening key.
Opening only works with both "master" opening key and this message-dependent opening key. Good: opening power is restricted Bad: always bother the OA
24/28

#RSAC
Group Signatures with Certified Limited Opening (CLO)
Opening in message-dependent opening depends on the message... We generalize it to "contexts". Instead of the "admitter", we introduce a "certifier". The certifier certifies the opener depending on the context.
­ i.e., the opening power is limited to only the specified context.
No need to bother the OA. The opener's opening power is limited. No (un-certified) opener can open signatures in other contexts.
25/28

#RSAC
Applications in Electronic Voting
Consider using the group signatures for signing on votes. The government can be the master certifier. The openers can be those special party overseeing different districts/counties/provinces/states  different contexts. Open when something bad happen, e.g., when the voting software in one of the voting booths could be compromised.
26/28

#RSAC
Structure-Preserving CLE  Group Signatures with CLO
SP-CLE's identity  Context in Group Sig. with CLO Group signature = Verifiable encryption of the signer's identity with respect to the corresponding context. SP-CLE key issuing  Certifying the opening power. SP-CLE decryption  Opening of identity limited to the context.
27/28

#RSAC
Conclusion
Structure-Preserving Cryptography for Modular design Certificateless Encryption for Escrow-Free Encryption w/o PKI Structure-Preserving Certificateless Encryption
­ a new tool in structure-preserving cryptography
and Its Application (in Group Signatures with "Certified Limited Opening")
­ a new tool for accountable privacy
Sherman S. M. Chow <{firstname}[at]ie.cuhk.edu.hk>
28/28

