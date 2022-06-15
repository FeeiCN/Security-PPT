  ii.Z42-*OOP%#


· "" · 
­  ­  ­  ­ 
· MySQL
­  ­ 
· 
­ 123


·  · DBA · @_ · http://hedengcheng.com

""
·  ­11 ­ ­OceanBase ­AliSQLAlibaba  MySQL   ­ ­...  ...
·  ­Why

""
·  ""J
·  ""
­  
­  MySQL 
­ MySQL   DBA L


·  
· 
­ ­ ­ ­

· 

----

·  ­ 
­ /
· ACIDIIsolation

----
·  ­   
­ / 
·  ­  

----
·  ­ MySQL  
­ 1 ---- 
­ 2----
­ 3MySQL ----
­ 4MySQL -- --
·  ­ 

·  à

----

·  ­ 2 ­  ­ 
­ 

MySQL
· MySQL  MySQL
­ InnoDBInnoDB
· 
­ MySQL ­ MySQL ­ MySQL ­ MySQL

MySQL----
·  ­ InsertDeleteUpdate ­ Select  ... l  ock  in  share  modeselect  ...  for  update ­ Lock   table ...    read/write    ­ Alter  table ...    / C  reate  Index  ...  DDL ­ Flush t  ables w  ith  read l  ock    ­ Primary  Key/Unique  Key
· MySQL ­ Purgepurge

MySQL----
·  ­ LOCK_S2 ß L ­ LOCK_X3
­ 
·  ­ LOCK_REC_NOT_GAP1024 ­ LOCK_GAPGAP512 ­ LOCK_ORDINARY+GAP0Next K  ey ­ LOCK_INSERT_INTENTION2048
­ LOCK_GAP
·  +   ­ LOCK_REC_NOT_GAP1024 +  LOCK_X3

MySQL----

  SNot Gap SGap SNot  Gap

SOrdinary XNot Gap XGap 

Insert   XOrdinary Intention


SGap



SOrdinary







XNot Gap 







XGap



XOrdinary 









Insert   Intention

MySQL----
· RCRC · Insert
­ Unique K  eyLOCK_X +    LOCK_REC_NOT_GAP   3  +  1024  =  1027 ­ Unique K  ey
· LOCK_S  +  LOCK_ORDINARY2  +  0  =  2 · GapLOCK_INSERT_INTENTION2048 · LOCK_X  +  LOCK_REC_NOT_GAP   3  +  1024  =  1027

MySQL----
· Delete ­ LOCK_X  +  LOCK_REC_NOT_GAP

MySQL----
· Update ­ Step 1  Select/Delete
­ Step 2  
­ Step 3  
­ Step 4   Unique  Unique   Key
­ Step 5  Unique
­ Step 6  Step  1Step  5
· Update ­ Step 1  Step  2Delete ­ Step 3  Step  4Step 5  Insert

MySQL----
· Update ­ Unique   Key LOCK_X +    LOCK_REC_NOT_GAP ­ Unique   Key ·  LOCK_X +    LOCK_REC_NOT_GAP · LOCK_S +    LOCK_ORDINARY ·  LOCK_S +    LOCK_GAP · LOCK_X +    LOCK_REC_NOT_GAP · ... ...  · Unique   L

· GAP

MySQL----GAP

­ MVCC

­ 

­ 

MySQL----GAP
· GAP ­ Read  CommittedRC Unique  Key Purge ­ Repeatable  ReadRR RC Update/Delete...
·  ­ GAPGAPGAPRead C  ommitted RC +  row  based  binlogRepeatable  Read
­ UniqueGAP

MySQL----

· Q1RCGap

·  ­ 

Tabl e T1( i d i nt pr i mar y key, c1 i nt uni que key) engi ne = i nnodb;

C1

5

5

5

5

5

8

20

100

110

200

D

D

D

V

D


8 5 D

20

100

110

200

5

5

5

5

D

D

V

D

· Question

1. 5C1110, 5 2. C1 = 5

­ 1.  

­ 2.  à Purge  https://bugs.mysql.com/bug.php?id=76927

MySQL----

Tabl e T1( i d i nt pr i mar y key, c1 i nt uni que key) engi ne = i nnodb;

·

T11, 110, 520, 10100, 50
Q2Purge

· T1

T2

T3

Tpur ge

B­eg1i n.  PurgeDeleteà 
Del et e f r om t 1 wher e c1 = 5

begi n

­ 2.  Purgesel ect * fromt1 wherec1=5 l ock in sharemo...de ... 
Commi t 

pur ge c1 = 5

begi n

i nser t i nt o t 1 val ues300, 7

C1bef or e pur ge 1 1 V
C1af t er pur ge
1 1 V

5

T2

10

50

10

20

100

D S( Not Gap)

V

V

l ock_r ec_i nher i t _t o_gap

10

T2

50

20

100

V

S( Gap)

V


·  
·  · 123

----

* * * ( 1) TRANSACTI ON:

TRANSACTI ON 60882C7, ACTI VE 1 sec i nser t i ng

mysql t abl es i n use 1, l ocked 1

LOCK WAI T 2 l ock st r uct ( s) , heap si ze 376, 1 r ow l ock( s) , undo l og ent r i es 1

MySQL i nser t

t

hr ead i nt o t

i

d 45, OS t hr val ues ( nul l

ead , 10)

handl e S0QxL2af

834080700,

quer y i d 6553 l ocal host

r oot

updat e

* * * ( 1) WAI TI NG FOR THI S LOCK TO BE GRANTED:

RECORD LOCKS space i d 10049 page no 4 n bi t s 72 i ndex ` c2` of t abl e ` t t ` . ` t ` t r x i d 60882C7 l ock mode S

wai t i ng





Recor d l ock, heap no 3 PHYSI CAL RECORD: n_f i el ds 2; compact f or mat ; i nf o bi t s 0





* * * ( 2) TRANSACTI ON:

TRANSACTI ON 60882C5, ACTI VE 32 sec i nser t i ng, t hr ead decl ar ed i nsi de I nnoDB 500

mysql t abl es i n use 1, l ocked 1

3 l ock st r uct ( s) , heap si ze 376, 2 r ow l ock( s) , undo l og ent r i es 2

MySQL t hr ead i d 44, OS t hr ead handl e 0x2af 828101700, quer y i d 6554 l ocal host r oot updat e

i nser t i nt o t val ues ( nul l , 9)

* * * ( 2) HOLDS THE LOCK( S) :

RECORD LOCKS space i d 10049 page no 4 n bi t s 72 i ndex ` c2` of t abl e ` t t ` . ` t ` t r x i d 60882C5 l ock_mode X l ocks

r ec but not gap

Recor d l ock, heap no 3 PHYSI CAL RECORD: n_f i el ds 2; compact f or mat ; i nf o bi t s 0

* * * ( 2) WAI TI NG FOR THI S LOCK TO BE GRANTED: RECORD LOCKS space i d 10049 page no 4 n bi t s 72 i ndex ` c2` of t abl e ` t t ` . ` t ` t r x i d 60882C5 l ock_mode X l ocks gap bef or e r ec i nser t i nt ent i on wai t i ng Recor d l ock, heap no 3 PHYSI CAL RECORD: n_f i el ds 2; compact f or mat ; i nf o bi t s 0

* * * WE ROLL BACK TRANSACTI ON ( 1)

----





r oot @t t 10: 08: 55>show cr eat e t abl e t u \ G

* * * * * * * * * * * * * * * * * * * * * * * * * * * 1. r ow * * * * * * * * * * * * * * * * * * * * * * * * * * *

Tabl e: t u Cr eat e Tabl e: CREATTabEl eTATuB(LiEd `i nttu`pr i(mar y key, u i nt uni que keya i nt key) engi ne = i nnodb;

` i d` i nt ( 11) NOT NULL,

` u` i nt ( 11) DEFAULT NULL,

` a` i nt ( 11) DEFAULT NULL,

PRI MARY KEY ( ` i d` ) ,

UNI QUE KEY ` u` (u`u`) , KEY ` a` ( ` a` )

a

) ENGI NE=I nnoDB DEFAULT CHARSET=ut f 8

1 r ow i n set

( 0. 01 sieudc)

1 1

3

5

7

3

5

7

a1 id 1

3

5

7

3

5

7



r oot @t t 10: 32: 42>sel ect * f r om t u;

+- - - - +- - - - - - +- - - - - - + | id | u | a |



+- - - - +- - - - - - +- - - - - - +

| 1| 1| 1|

| 3| 3| 3|

id 1 u1 a1

3

5

7

3

5

7

3

5

7

| 5| 5| 5| | 7| 7| 7| +- - - - +- - - - - - +- - - - - - + 4 r ows i n set ( 0. 01 sec)

----1

* * * ( 1) TRANSACTI ON:
· TRANSACTION 1401426548013+, 1AC =  TI 2 VE J  54 sec st art i ng i ndex read mysql t abl es i n use 1, l ocked 1

LOCK WAI T 3 l ock st r uct ( s) , heap si ze 376, 2 r ow l ock( s)

Tabl e TMuy(SiQLd tihnr etadpri idm1a1r, yOSketyhr, eaud ihanntdl uen0ixq2ub0e76k0e1y0170a0, i qnuter kyeiyd) 19e3ngl iocnael h=osti nrnoootdbs;t at i st i cs
sel ect * f r om t u wher e i d=5 f or updat e

* * * ( 1) WAI TI NG FOR THI S LOCK TO BE GRANTED:

RECOSReDssLiOoCnK1Sspace i d 20950 page no 3 n bi t s 72 i ndexS`ePsRsIi MoAnR2Y` of t abl e ` t t ` . ` t u` t r x i d 140142654803

l ock_bmeogdienX l ocks r ec but not gap wai t i ng

begi n

Recorsdell eocctk, * hef arpomnot u4wPhHeYrSeI CiAdL=3REfCoOrRDu:pdna_tfei ;el ds 5; comspeal cetctf o*r mfarto;mitnuf owhbeirtes i0d=5 f or updat e;

0: l esnel4e; cthex* 8f 0r0o0m00t0u5;whaesrce i d=5; ;f or updat e;

sel ect * f r om t u wher e i d=3 f or updat e;

u

* * * ( 2) TRANSACTI ON: TRANSACTI ON 140142654804,

ACTI VE 37 sec st ar t i ng i ndex r ead,

t hr ead daecl ar ed i nsi de I nnoDB 5000

mysql t abl es i n use 1, l ocked 1

3 l ock st r uct ( s) , heap si ze 376, 2 r ow l ock( s)

u id

MyS1QL t hr ead i3d 12, OS t5hr ead hand7l e 0x2b0754080700,

sel1ect
* * * ( 2)

*

HOf Lr DoSm3Tt HuEwLhOeCr Ke(

Si5d) :

=

3

f or

7updat e

quer y i d 194 l ocal hosat r oo1t st at i st i c3s

id 1

3

5 5

7 7

RECORD LOCKS space i d 20950 page no 3 n bi t s 72 i ndex ` PRI MARY` of t abl e ` t t ` . ` t u` t r x i d 140142654804

l ock_mode X l ocks r ec but not gap

Recor d l ock, heap no 4 PHYSI CAL RECORD: n_f i el ds 5; compact f or mat ; i nf o bi t s 0

0: l en 4; hex 80000005; asc ; ;

* * * ( 2) WAI TI NGFOR THI S LOCiKdTO B1E GRANTED: 3

5

7

RECORD LOCKS space i d 20950 puage n1o 3 n bi t s 72 i3ndex ` PRI MARY5` of t abl e ` t7t ` . ` t u` t r x i d 140142654804

l ock_mode X l ocks r ec but nota gap 1wai t i ng

3

5

7

Recor d l ock, heap no 5 PHYSI CAL RECORD: n_f i el ds 5; compact f or mat ; i nf o bi t s 0

0: l en 4; hex 80000003; asc ; ;

----1

· 1 ­ 
·  ­ Session1 Begin select * from tu where id=3 for update; select * from tu where id=5 for update; Commit

Session 2  Begin select * from tu where id=5 for update select * from tu where id=3 for update Commit

· 
­  

----2
· 
Tabl e Tu( i d i nt pr i mar y key, u i nt uni que keya i nt key) engi ne = i nnodb;

u
u1 id 1

3

5

7

3

5

7



id 1 u1 a1

a
a1 id 1

3

5

7

3

5

7

3

5

7

3

5

7

3

5

7

----2

* * * ( 1) TRANSACTI ON:

TRANSACTI ON 140142655258, ACTI VE 2 sec st ar t i ng i ndex r ead

mysql t abl es i n use 1, l ocked 1

LOCK WAI T 3 l ock st r uct ( s) , heap si ze 376, 2 r ow l ock( s)

MySQL t hr ead i d 3, OS t hr ead handl e 0x2b4ec0080700, quer y i d 34 l ocal host r oot Sear chi ng r ows f or updat e

uTpadbaltee Ttu( si edt iun=t4 pwrhei rmearay=3key, u i nt uni que keya i nt key) engi ne = i nnodb;

* * * ( 1) WAI TI NG FOR THI S LOCK TO BE GRANTED:

RECORD LOCKS space i d 20950 page no 3 n bi t s 72 i ndex ` PRI MARY` of t abl e ` t t ` . ` t u` t r x i d 140142655258

l ock_mode X l ocks r ec but not gap wai t i ng Recor d l ockS, eshseiaopn1no 5 PHYSI CAL RECORD: n_f i el ds 5;
0: l en 4; huepxda8t0e00t0u00se3t; aa=s4c wher e; u; =3;

Sessi on2 compaucptdatf eortmuats;eti nuf=o4 wbhietrse 0a=3;

*u** ( 2) TRANSACTI ON: TRANSACTI ON 140142655257,

ACTI VE 11 sec updat i ng or

del et i ng,

t hr ead daeclar ed i nsi de I nnoDB 4999

mysql t abl es i n use 1, l ocked 1

4 l ock st r uct ( s) , heap si ze 1248, 3 r ow l ock( s) , undo l og ent r i es 1

MySQLu t hr e1ad i d 1, O3S t hr ead 5handl e 0x72b4eb4080700,

updait de t u 1set a=4 wh3er e u=3 5

7

quer y i d 33 l ocal host ar oot 1updat i ng id 1

3 3

5 5

7 7

* * * ( 2) HOLDS THE LOCK( S) :

RECORD LOCKS space i d 20950 page no 3 n bi t s 72 i ndex ` PRI MARY` of t abl e ` t t ` . ` t u` t r x i d 140142655257

l ock_mode X l ocks r ec but not gap

Recor d l ock, heap no 5 PHYSI CAL RECORD: n_f i el ds 5; compact f or mat ; i nf o bi t s 0

0: l en 4; hex 80000003;asc

;; id 1

3

5

7

* * * ( 2) WAI TI NG FOR THI S LOCK TO uBE GR1ANTED:

3

5

7

RECORD LOCKS space i d 20950 page ano 5 1n bi t s 80 i nd3ex ` a` of t ab5l e ` t t ` . ` t u7` t r x i d 140142655257 l ock_mode X

l ocks r ec but not gap wai t i ng

Recor d l ock, heap no 7 PHYSI CAL RECORD: n_f i el ds 2; compact f or mat ; i nf o bi t s 0

0: l en 4; hex 80000003; asc ; ;

0: l en 4; hex 80000003; asc ; ;

----2

· 2 ­ 
·  ­ Session1 Update  tu set a   =    4  where  u   = 3  

Session 2  update  tu set u    =  4  where  a  =  3

· 
­ MySQLUpdate/Delete uaid  =  3 

----3
· Gap  
·  · 
CREATE  TABLE  `t` (  `c1` i  nt(11)  NOT N  ULL  AUTO_INCREMENT, `c2` i  nt(11)  DEFAULT N  ULL, PRIMARY  KEY  (`c1`), UNIQUE  KEY `  c2` (  `c2`)
) E  NGINE=InnoDB AUTO_INCREMENT=10  DEFAULT C  HARSET=gbk
· SQLT1T2...  ...??? T2:    insert  into   t  values (  null,10); T1:    insert  into   t  values (  null,10); T2:    insert  into   t  values (  null,9);

----3

* * * ( 1) TRANSACTI ON:

TRANSACTI ON 60882C7, ACTI VE 1 sec i nser t i ng

mysql t abl es i n use 1, l ocked 1

LOCK WAI T 2 l ock st r uct ( s) , heap si ze 376, 1 r ow l ock( s) , undo l og ent r i es 1
TabMl yeSQtL( ct h1r eiandt i dpr4i5m, aOrSytkhreeya,d cha2ndilnet 0xu2naifq8u34e08k0e7y00), eqnugeri ynei d=65i5n3nol docba;l host r oot updat e

i nser t i nt o1,t 1values(5n,u4l l , 10)2020

* * * ( 1) WAI TI NG FOR THI S LOCK TO BE GRANTED:

RmEoSCdeOesRsDSi oLwnOa1CiKt Si nsgpacSei d+1L0O0C4K9_OpRaDgIeNAnRoY,4nbi ts 72indGeaxp` c2` Recboergdi nlock, heap no 3 PHYSI CAL RECORD: n_f i el ds 2; compact
0:i nlseenr t4;i nhteox t80v0a0l0u0e0sa;( 3a0s,c 10) ; ; ;

oSfestsaibolne2` t t ` . ` t ` t r x fbioenrgsmieanrtt; iinntfoo tbivtasl u0es i nser t i nt o t val ues

i d 60882C7
( 25, 10) ; ( 40, 9) ;

l

ock

* * * ( 2) TRANSACTI ON: TRANSACTI ON 60882C5,

ACTI VE 32

sTe1ci nseXr t iNnegx,t t hKreeyad Td2ecl ar eTd1insGiadpeI nnoDB 5001

mysql t abl es i n use 1,
3 l occk2st r uct ( s) , heap MySQL t hr ead i d 44,C2OS

l ocked 1 si ze 376,

2 r o2w l ock( s) ,

undo

t h1r ead handl e 0x2af 8248101700,

3
l og ent r i es 2
quer y i d 651504

l

oTc2al host

Xroot

u2p0dat e

i nser t i nt o t val ueCs1( nul1l , 9)

5

25

20

* * * ( 2) HOLDS THE LOCK( S) :

GAP

RECORD LOCKS space i d 10049 page no 4 n bi t s 72 i ndex ` c2` of t abl e ` t t ` . ` t ` t r x i d 60882C5

l ock_mode X l ocks r ec but not gap

Recor d l ock, heap no 3 PHYSI CAL RECORD: n_f i el ds 2; compact f or mat ; i nf o bi t s 0

0: l en 4; hex 8000000a; asc ; ;

 * * * ( 2) WAI TI NG FOR THI S LOCCK1TO B1E GRANTED: 5

20

25

RECORD LOCKS l ock_mode X l

space i d ocks gap

10049 Cp2age
bef or e r ec

n1o 4 n
i nser t

bi t s 472 i ndex ` c220`
i nt ent i on wai t i ng

oftab1le1N0`etxtt`

. `t` trx Key

i

d

60882C5

Recor d l ock, heap no 3 PHYSI CAL RECORD: n_f i el ds 2; compact f or mat ; i nf o bi t s 0

0: l en 4; hex 8000000a; asc ; ;

----3
· 3 ­ 
­ ...  ...
­ Next  KeyGap
·  ­ Uniquecheck   unique 
·  ­ RCNext K  eyGapunique
­ 

----AliSQL

·  ­ MySQL 
­ MySQL 
· AliSQL ­ 

* * * ( 1) TRANSACTI ON:

TRANSACTI ON 140142655253, ACTI VE 1 sec st ar t i ng i ndex r ead

mysql t abl es i n use 1, l ocked 1

LOCK WAI T 3 l ock st r uct ( s) , heap si ze 376, 2 r ow l ock( s)

MySQL t hr ead i d 3, OS t hr ead handl e 0x2b4ec0080700, quer y i d 25

l ocal host r oot Sear chi ng r ows f or updat e

updat e t u set u=4 wher e a=3

* * * ( 1) HOLDS THE LOCK( S) :

RECORD LOCKS space i d 20950 page no 5 n bi t s 80 i ndex ` a` of

t abl e ` t t ` . ` t u` t r x i d 140142655253 l ock_mode X l ocks r ec but

not gap

Recor d l ock, heap no 7 PHYSI CAL RECORD: n_f i el ds 2; compact

f or mat ; i nf o bi t s 0

0: l en 4; hex 80000003; asc

;;

* * * ( 1) WAI TI NG FOR THI S LOCK TO BE GRANTED: RECORD LOCKS space i d 20950 page no 3 n bi t s 72 i ndex ` PRI MARY` of t abl e ` t t ` . ` t u` t r x i d 140142655253 l ock_mode X l ocks r ec but not gap wai t i ng Recor d l ock, heap no 5 PHYSI CAL RECORD: n_f i el ds 5; compact f or mat ; i nf o bi t s 0

* * * ( 2) TRANSACTI ON: TRANSACTI ON 140142655250, ACTI VE 130 sec updat i ng or del et i ng, t hr ead decl ar ed i nsi de I nnoDB 4999 mysql t abl es i n use 1, l ocked 1 4 l ock st r uct ( s) , heap si ze 1248, 3 r ow l ock( s) , undo l og ent r i es 1 MySQL t hr ead i d 1, OS t hr ead handl e 0x2b4eb4080700, quer y i d 20 l ocal host r oot updat i ng updat e t u set a=4 wher e u=3 * * * ( 2) HOLDS THE LOCK( S) : RECORD LOCKS space i d 20950 page no 3 n bi t s 72 i ndex ` PRI MARY` of t abl e ` t t ` . ` t u` t r x i d 140142655250 l ock_mode X l ocks r ec but not gap


·  ­ 
·  ­ GAPGAPGAPRead  Committed RC +  row  based  binlogRepeatable  Read
­ UniqueGAP
·  ­ MySQLUpdate/Delete uaid  =  3 
·  ­ RCNext  KeyGapunique
­ 

 


ORA



Oracle

z3 ­ SQL

zData ­ 

BayMax

 

