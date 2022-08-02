Fuzzing on train:

AIPDF

 

 



    
zouquanchen@126.com


    20 520Day
majinxin2003@126.com



   


PDF
AI& LEARN&FUZZ

PDF


Foxit ReaderAdobe Reader ChromeEdgeFirefox

PDFXMLXSL JavaScriptHTML


 

 


 


 



 





PDF

%PDF-1.3 PDF 
xref 0 257 0000000000 65535 f 0000000017 00000 n 0000000212 00000 n 0000000231 00000 n 0000000251 00000 n 0000000825 00000 n 0000000876 00000 n


Header Body

PDFPDF streamstreamobj

8 0 obj <<

209 0 obj << /Type /XObject /Subtype /Image /Width 51 /Height 69 /BitsPerCom ponent 8

/Type /Pages /ColorSpace 29 0 R /Length 214 /Filter [ /ASCII85Decode /FlateDecode ]

/Kids[ 22 0 R ] >>

/Count 1

Stream

>> endobj

... endstream endobj

Cross-

trailer

reference table

<</Info 19 0 R /Root 21 0 R /Size

257/ID[<15481298DAABCC5184A2001C560B476B><6DC090EE200F6EB

Trailer

5201096388FFC0D37>]>>

startxref 320283 %%EOF

(Catalog) 

Adobe Systems Incorporated. PDF Reference, 6th edition, Nov.2006.

http://www.adobe.com/content/dam/Adobe/en/devnet/acrobat/pdfs/pdf

reference 1-7.pdf

1310

AI&

AFLVUzzer
 

PeachSpike Jsfunfuzz

AI

 
 
 

AI&
ASE' 17 LSTM arXiv' 17 LSTM/BLSTM/seq2seq arXiv' 18 Q-Learning

S&P' 17 PCSG arXiv' 17 GAN
arXiv' 18 CNN

LEARN&FUZZ

· Windows fuzzing team · 63,000 non-binary PDF objects out of
534 PDF files (seed minimization) · 1,000 PDF objects · LSTM with 2 hidden layers · 4-core 64-bit Windows 10 VMs with 20GB
of RAM · 50 epoch 10 hours · PDF1,000 per 10 epoch · EdgePass rate(70%-97%)
Instruction coverageBugs(1)


   



1. Dataset construction

Testsuit Fuzzing Crawler

2. Training Cut the text

Initial samples

Seed minimization

Pdf dataset

Vectorization

LSTM, BLSTM, Attention, etc.
Build model

Extract obj/stream
Training

Pdf streams

Pdf objs

Save dict

dictionary

Structure, parameters
Model

Prefix 3. Generation string

Load Vectorization model

predict

New objs

Attach to pdf host

New pdf files

4. Testing

Target APP

Fuzzing

Foxit Reader, Adobe Reader, Mupdf, Chrome, Edge et al.

Effectiveness measure

Coverage Bugs

DATASET CONSTRUCTION

1. Dataset construction

Testsuit Fuzzing Crawler

Initial samples

Seed minimization

Pdf dataset

Extract obj/stream

Pdf streams

Pdf objs

Save dict

dictionary

PDFTestsuite+Fuzzing obj71,779

Stillhq.com PDF Database/Mikail's PDF database

QualityLogic's PDF 1.7 Application Test Suite

stream23,521

Adobe PDF test suites

32.77%streamobj

Ghent Working Group Test Suites

PDF cabinet of horrors

Pdfium_tests ... ...

  

20000+ 251 37.996%

55,058
 

13,765
 


2,956 obj


{"0": "\n", "1": " ", "2": "!", "3": "\"", "4": "#", "5": "$", "6": "%", "7": "&", "8": "'", "9": "(", "10": ")", "11": "*", "12": "+", "13": ",", "14": "-", "15": ".", "16": "/", "17": "0", "18": "1", "19": "2", "20": "3", "21": "4", "22": "5", "23": "6", "24": "7", "25": "8", "26": "9", "27": ":", "28": ";", "29": "<", "30": "=", "31": ">", "32": "?", "33": "@", "34": "A", "35": "B", "36": "C", "37": "D", "38": "E", "39": "F", "40": "G", "41": "H", "42": "I", "43": "J", "44": "K", "45": "L", "46": "M", "47": "N", "48": "O", "49": "P", "50": "Q", "51": "R", "52": "S", "53": "T", "54": "U", "55": "V", "56": "W", "57": "X", "58": "Y", "59": "Z", "60": "[", "61": "\\", "62": "]", "63": "^", "64": "_", "65": "`", "66": "a", "67": "b", "68": "c", "69": "d", "70": "e", "71": "f", "72": "g", "73": "h", "74": "i", "75": "j", "76": "k", "77": "l", "78": "m", "79": "n", "80": "o", "81": "p", "82": "q", "83": "r", "84": "s", "85": "t", "86": "u", "87": "v", "88": "w", "89": "x", "90": "y", "91": "z", "92": "{", "93": "|", "94": "}", "95": "~"}
OBJ
corpus length11,913,817 total chars: 96

TRAINING

OBJ 

2. Training Cut the text

Vectorization

LSTM, BLSTM, Attention, etc.
Build model

training

Pdf objs
Structure, parameters
Model

CUT THE TEXT

11,913,817 maxlen = 50step = 3 3,803,562(Training:3,042,849, validation:760,713)

sentences 'obj\n<<\n /Type /Page\n /Parent 33 0 R\n /Resources' '\n<<\n /Type /Page\n /Parent 33 0 R\n /Resources 70' '\n /Type /Page\n /Parent 33 0 R\n /Resources 70 0 '
......

next_chars ' ' ' ' 'R'
......

obj << /Type /Page /Parent 33 0 R /Resources 70 0 R /MediaBox [ 0 0 1247 1984 ] /Group <<
/S /Transparency /CS /DeviceRGB /I true >> /Contents 2 0 R >> endobj

VECTORIZATION

 One-hot Vector/Encoding

 x(len(sentences), maxlen, len(chars))

  

3,803,562

50

96

256yield

 y(len(sentences), len(chars))



2LSTM summary ...

_________________________________________________________________

Layer (type)

Output Shape

Param #

=================================================================

lstm_1 (LSTM)

(None, 50, 128) 115200

_________________________________________________________________

lstm_2 (LSTM)

(None, 128)

131584

_________________________________________________________________

dense_1 (Dense)

(None, 96)

12384

_________________________________________________________________

activation_1 (Activation) (None, 96)

0

=================================================================

Total params: 259,168

Trainable params: 259,168

Non-trainable params: 0

2LSTM LEARN&FUZZ 



3LSTM

Total params: 390,752 Trainable params: 390,752 Non-trainable params: 0

2BLSTM

Total params: 505,952 Trainable params: 505,952 Non-trainable params: 0


ATTENTION + 2BLSTM
Total params: 1,856,086 Trainable params: 1,856,086 Non-trainable params: 0


batch_size = 256 epoch = 60 optimizer = adam(lr=1e-4)loss='categorical_crossentropy'
zit@Zitsec:~/zou/Longma$ python3 pdf_obj_model_training.py ....... Using TensorFlow backend. 2018-08-20 09:43:28.161940: I tensorflow/core/platform/cpu_feature_guard.cc:140] Your CPU supports instructions that this TensorFlow binary was not compiled to use: AVX2 FMA 2018-08-20 09:43:31.231878: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1356] Found device 0 with properties: name: TITAN Xp COLLECTORS EDITION major: 6 minor: 1 memoryClockRate(GHz): 1.582 pciBusID: 0000:02:00.0 totalMemory: 11.91GiB freeMemory: 11.74GiB 2018-08-20 09:43:31.231953: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1435] Adding visible gpu devices: 0 2018-08-20 09:43:31.623790: I tensorflow/core/common_runtime/gpu/gpu_device.cc:923] Device interconnect StreamExecutor with strength 1 edge matrix: 2018-08-20 09:43:31.623856: I tensorflow/core/common_runtime/gpu/gpu_device.cc:929] 0 2018-08-20 09:43:31.623868: I tensorflow/core/common_runtime/gpu/gpu_device.cc:942] 0: N 2018-08-20 09:43:31.624255: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1053] Created TensorFlow device (/job:localhost/replica:0/task:0/device:GPU:0 with 11370 MB memory) -> physical GPU (device: 0, name: TITAN Xp COLLECTORS EDITION, pci bus id: 0000:02:00.0, compute capability: 6.1) Epoch 1/60 63232/3042849 [..............................] - ETA: 1:10:50 - loss: 3.6259 - acc: 0.2304

GENERATION
PREFIX STRINGOBJOBJPDF
Structure, parameters
Model

Prefix 3. Generation string

Load Vectorization model

predict

new objs

Attach to pdf host

New pdf files

GENERATION

Structure, parameters Model

Model

obj  

Model


 1  2
 n

new objs new objs
new objs

Pdf  


 1  2
 n

new pdfs new pdfs new pdfs

OBJ 

PDF
·  · objPDF · 

OBJ



Model 

obj 

 Prefix

 








 

 obj

 

obj 


   obj


obj 

new objects



   

max_gen_len = 2000



· OBJ · PREFIX

OBJ



  
0.2 0.5

temperature
0.8 1.0 1.2

  
1.5 1.8

PDF

Host pdf

new obj

host trailer

 obj pdf 

   

  trailer

host
   


Incremental updateobj hosthostobj

new obj1 new obj2

new objn

Header
Body
Cross-reference table
Trailer obj
Cross-reference table
Trailer obj
Cross-reference table
Trailer
obj
Cross-reference table
Trailer

PDF

HOST

pdfium 317 KB obj257 obj1/10


 PDF


  OBJ PDF






TITAN Xp COLLECTORS EDITION X4

Ubuntu-16.04.2-desktop-amd64

Python 3.5

E5-2683 v4 X2 256G







60





  M

2LSTM 3LSTM 2BLSTM Attention

259,168 390,752 505,952 1,800,786

1d 11h 0m 35s
2d 1h 38m 49s
2d 16h 54m 57s
3d 2h 49m 5s

3.00 4.51 5.83 21.30

zit@Zitsec:~/zou/Longma/pdf_corpus/saved_models/2BLSTM_epochs60$ ll
total 358568 drwxrwxr-x 2 zit zit 4096 7 8 05:11 ./ drwxrwxrwx 34 zit zit 4096 8 15 14:49 ../ -rw-rw-r-- 1 zit zit 6116568 7 5 12:16 2BLSTM_epoch01.h5 -rw-rw-r-- 1 zit zit 6116568 7 5 13:20 2BLSTM_epoch02.h5 -rw-rw-r-- 1 zit zit 6116568 7 5 14:24 2BLSTM_epoch03.h5 -rw-rw-r-- 1 zit zit 6116568 7 5 15:29 2BLSTM_epoch04.h5 -rw-rw-r-- 1 zit zit 6116568 7 5 16:33 2BLSTM_epoch05.h5 -rw-rw-r-- 1 zit zit 6116568 7 5 17:37 2BLSTM_epoch06.h5 -rw-rw-r-- 1 zit zit 6116568 7 5 18:41 2BLSTM_epoch07.h5 -rw-rw-r-- 1 zit zit 6116568 7 5 19:46 2BLSTM_epoch08.h5 -rw-rw-r-- 1 zit zit 6116568 7 5 20:50 2BLSTM_epoch09.h5 -rw-rw-r-- 1 zit zit 6116568 7 5 21:54 2BLSTM_epoch10.h5 -rw-rw-r-- 1 zit zit 6116568 7 5 22:58 2BLSTM_epoch11.h5 -rw-rw-r-- 1 zit zit 6116568 7 6 00:02 2BLSTM_epoch12.h5 -rw-rw-r-- 1 zit zit 6116568 7 6 01:06 2BLSTM_epoch13.h5 -rw-rw-r-- 1 zit zit 6116568 7 6 02:10 2BLSTM_epoch14.h5 -rw-rw-r-- 1 zit zit 6116568 7 6 03:15 2BLSTM_epoch15.h5 -rw-rw-r-- 1 zit zit 6116568 7 6 04:19 2BLSTM_epoch16.h5 -rw-rw-r-- 1 zit zit 6116568 7 6 05:23 2BLSTM_epoch17.h5 -rw-rw-r-- 1 zit zit 6116568 7 6 06:27 2BLSTM_epoch18.h5 -rw-rw-r-- 1 zit zit 6116568 7 6 07:31 2BLSTM_epoch19.h5 -rw-rw-r-- 1 zit zit 6116568 7 6 08:36 2BLSTM_epoch20.h5 -rw-rw-r-- 1 zit zit 6116568 7 6 09:40 2BLSTM_epoch21.h5
-

ACC

LOSS

OBJ

10,000obj 210,000obj 7 7*21 = 147 1.5MB

zit@Zitsec:~/zou/Longma/pdf_corpus/generated_objs/minset3/final_test_1wobj$ ll
total 179956 drwxrwxr-x 4 zit zit 20480 8 17 11:31 ./ drwxrwxr-x 15 zit zit 4096 8 15 17:23 ../ -rw-rw-r-- 1 zit zit 731780 8 16 01:42 2BLSTM_epoch10.h5_diversity0.2.txt -rw-rw-r-- 1 zit zit 1122762 8 14 17:42 2BLSTM_epoch10.h5_diversity0.5.txt -rw-rw-r-- 1 zit zit 1508494 8 16 10:03 2BLSTM_epoch10.h5_diversity0.8.txt -rw-rw-r-- 1 zit zit 1784072 8 15 04:49 2BLSTM_epoch10.h5_diversity1.0.txt -rw-rw-r-- 1 zit zit 2209887 8 16 21:15 2BLSTM_epoch10.h5_diversity1.2.txt -rw-rw-r-- 1 zit zit 2462241 8 15 13:19 2BLSTM_epoch10.h5_diversity1.5.txt -rw-rw-r-- 1 zit zit 2828212 8 17 09:05 2BLSTM_epoch10.h5_diversity1.8.txt -rw-rw-r-- 1 zit zit 915555 8 16 02:21 2BLSTM_epoch20.h5_diversity0.2.txt -rw-rw-r-- 1 zit zit 982013 8 14 17:44 2BLSTM_epoch20.h5_diversity0.5.txt -rw-rw-r-- 1 zit zit 1252198 8 16 10:18 2BLSTM_epoch20.h5_diversity0.8.txt -rw-rw-r-- 1 zit zit 1229084 8 14 23:16 2BLSTM_epoch20.h5_diversity1.0.txt -rw-rw-r-- 1 zit zit 1318517 8 16 17:46 2BLSTM_epoch20.h5_diversity1.2.txt -rw-rw-r-- 1 zit zit 1802129 8 15 06:04 2BLSTM_epoch20.h5_diversity1.5.txt -rw-rw-r-- 1 zit zit 2138562 8 17 04:30 2BLSTM_epoch20.h5_diversity1.8.txt -rw-rw-r-- 1 zit zit 693064 8 15 23:23 2BLSTM_epoch30.h5_diversity0.2.txt -rw-rw-r-- 1 zit zit 1109692 8 14 16:43 2BLSTM_epoch30.h5_diversity0.5.txt -rw-rw-r-- 1 zit zit 1441973 8 16 08:38 2BLSTM_epoch30.h5_diversity0.8.txt -rw-rw-r-- 1 zit zit 1484294 8 15 02:13 2BLSTM_epoch30.h5_diversity1.0.txt -rw-rw-r-- 1 zit zit 1477235 8 16 16:46 2BLSTM_epoch30.h5_diversity1.2.txt -rw-rw-r-- 1 zit zit 1551167 8 15 08:48 2BLSTM_epoch30.h5_diversity1.5.txt

PDF
10,000PDF 10min 380KB 1w3.7GB 2121w 77.7G

-rw-rw-r-- 1 zit zit 339179 8 13 09:43 9476.pdf -rw-rw-r-- 1 zit zit 338730 8 13 09:43 9477.pdf -rw-rw-r-- 1 zit zit 338794 8 13 09:43 9478.pdf -rw-rw-r-- 1 zit zit 335113 8 13 09:43 9479.pdf -rw-rw-r-- 1 zit zit 339384 8 13 09:43 9480.pdf -rw-rw-r-- 1 zit zit 339398 8 13 09:43 9481.pdf -rw-rw-r-- 1 zit zit 335495 8 13 09:43 9482.pdf -rw-rw-r-- 1 zit zit 343490 8 13 09:43 9483.pdf -rw-rw-r-- 1 zit zit 336621 8 13 09:43 9484.pdf -rw-rw-r-- 1 zit zit 358054 8 13 09:43 9485.pdf -rw-rw-r-- 1 zit zit 345598 8 13 09:43 9486.pdf -rw-rw-r-- 1 zit zit 342540 8 13 09:43 9487.pdf -rw-rw-r-- 1 zit zit 342989 8 13 09:43 9488.pdf -rw-rw-r-- 1 zit zit 345923 8 13 09:43 9489.pdf -rw-rw-r-- 1 zit zit 1221730 8 13 09:43 9490.pdf -rw-rw-r-- 1 zit zit 355457 8 13 09:43 9491.pdf -rw-rw-r-- 1 zit zit 413066 8 13 09:43 9492.pdf -rw-rw-r-- 1 zit zit 353369 8 13 09:43 9493.pdf -rw-rw-r-- 1 zit zit 337955 8 13 09:43 9494.pdf -rw-rw-r-- 1 zit zit 348164 8 13 09:43 9495.pdf -rw-rw-r-- 1 zit zit 340569 8 13 09:43 9496.pdf -rw-rw-r-- 1 zit zit 340363 8 13 09:43 9497.pdf -rw-rw-r-- 1 zit zit 340621 8 13 09:43 9498.pdf -rw-rw-r-- 1 zit zit 343950 8 13 09:43 9499.pdf -rw-rw-r-- 1 zit zit 336692 8 13 09:43 9500.pdf -rw-rw-r-- 1 zit zit 345394 8 13 09:43 9501.pdf

PDF

HOST

1

2

PDF

HOST

3

4

PDF
 

TESTING
·  · 

4. Testing

Target APP

Fuzzing

Foxit Reader, Adobe Reader, Mupdf, Chrome, Edge et al.

Effectiveness measure

Coverage Bugs

New pdf files





    

--j00ruProject ZeroDragonSector

 = SUM / 

  

251

37.996%

MuPDF  

WHY MUPDF?
 all in one file  stream    bug  Open source ,




PIN

MuPDF

BITMAP

1PDF5 
*NOTES* 

BITMAP 


PIN      CPUKill  1bit 1 Byte, Zlib



PINAFL -- PINAFL WINDOWS

· 13 · 20,000 · 327
327 · 38.077%








 (PIN)

 



 







top 

AFL AFL





60

13.89*16=222.24

0.3%20,000+ 38.35

2LSTM 3LSTM 2BLSTM Attention

38.3

38.25

0.2 38.103

38.108

38.2

38.15

0.5

38.107 38.133

38.1

38.05

1.0 38.099 38.125 38.140 38.122

38

1.5 38.088 38.091 38.099 38.120

37.95

37.996% PinAFL 38.077%+0.081% Learn&Fuzz38.113%+0.117%



0.2 2LSTM

0.5 3LSTM

1 2BLSTM

1.5 Attention





2BLSTM 0.5 13.89*5= 69.45



38.16





38.14

10

38.064

38.12

20

38.108

30

38.123

40

38.130

50

60

38.133

38.1

38.08

38.06

38.04

38.02

10

20

30

40

50

60


PDF Foxit ReaderPower PDF Corel PDFCool PDF Nitro PDF
 20 1 210,000





crash

powerPDF
corelPDF coolPDF Nitropdf Reader Foxit92 Foxit91


4520
23560 468 256 10265 2783





TaintedDataControlsWriteAddress  StackOverflow  T 28 aintedDataControlsBranchSelection  ReadAVonContr
olFlowTaintedDataControlsBranchSelection

78

WriteAVReadAVTaintedDataControlsBranchSelect ionDivideByZero

8

TaintedDataReturnedFromFunctionTaintedDataCon trolsWriteAddressReadAVNearNull

5

TaintedDataControlsBranchSelectionTaintedDataPa ssedToFunction

27

TaintedDataControlsCodeFlowReadAVDivideByZe roStackOverflow

18

TaintedDataPassedToFunctionTaintedDataReturned FromFunctionStackOverflow

!


 


1. AIPDF · Char-level · LSTMBLSTMAttention · obj · objPDF
2.  2BLSTM600.2
3.  AFLFuzzer


1. XMLXSLJavaScriptHTML AS 2. (PNGMKVZIP) 3. AFLFuzzingAFL 4.  5. GAN


· Adobe Systems Incorporated. PDF Reference, 6th edition, Nov.2006. Available at http://www.adobe.com/content/dam/Adobe/en/devnet/acrobat/pdfs/pdf reference 1-7.pdf
· Wang J, Chen B, Wei L, et al. Skyfire: Data-driven seed generation for fuzzing. Security and Privacy (SP), 2017 IEEE Symposium on. IEEE, 2017: 579-594.
· https://patricegodefroid.github.io/ · https://patricegodefroid.github.io/public_psfiles/SAGE-in-1slide-for-PLDI2013.pdf · Godefroid P, Peleg H, Singh R. Learn&fuzz: Machine learning for input fuzzing. Proceedings of
the 32nd IEEE/ACM International Conference on Automated Software Engineering. IEEE Press, 2017: 50-59. · https://github.com/keras-team/keras/blob/master/examples/lstm_text_generation.py · https://github.com/philipperemy/keras-attention-mechanism

 

