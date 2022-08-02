Data Driven World
Contents

SACC2013

 

Contents Contents

SACC2013

1



1.

SACC2013

2

1.1 

SACC2013

3

1.1 -- SACC2013
PHR () 4

1.2 

SACC2013

5

Contents Contents

SACC2013

2



2.1 

SACC2013

7

2.2 

SACC2013

   
8

2.2 --

SACC2013

9

9

2.2 -- SACC2013
10

Contents Contents

3



SACC2013

3.1 

SACC2013

EDW 
EDW Conceptual Architecture

     TM 
i - PORTAL
      E- Mail 

  



Staging


  


  

 

   

ETL

 

 

  

                                
  

ETL

 
 

  
 

ERP 
SEM

 EIS

EDW

     

  

 

  

    

 

ETL

Data Mart



ETL

 
     

 

CRM 



 

/

Source Metadata

ETL Metadata

EDW Metadata

OLAP Metadata

Query & Report

OLAP



 

12

3.3 

SACC2013

ODS, DW, DM
 (Multidimensional Modeling)



 (Dimension) Fact 

   
   
   (Fact, Measure)
   





 (D)
 KEY 

 (D) _KEY 
 (D) _KEY  

 (F)
_KEY _KEY _KEY _KE Y _KEY

 (D) _KE Y  
 (D) _ KEY  

·  :  ·  : , 


 (D) _KEY   
 (D) _KEY  


 (D) _ KEY
 (F)
_KEY _KEY _KEY _KE Y _KEY   

 (D) _KEY  
 (D) _ KEY 
 (D)   
 (D)   

·  :  ·  : 



    
    
 Bitmap Index    
    

13

3.4 --

SACC2013

 



 

 





RD_MR_WT
D_SEND: DATE NOT NULL C_ACO: CHAR(6) NOT NULL O_SENDSEQ: SMALLINT NOT NULL
D_APP: DATE NOT NULL C_RIGOD: CHAR(3) NOT NULL C_LCO: CHAR(6) NOT NULL O_POLY: CHAR(18) NOT NULL O_POLYSEQ: SMALLINT NOT NULL D_TYYM: CHAR(6) NOT NULL C_VESRISK: CHAR(2) NOT NULL C_PROC: CHAR(3) NOT NULL D_FROM: DATE NOT NULL D_TO: DATE NOT NULL M_ENDORSE: VARCHAR(360) NOT NULL C_CTORTYPE: CHAR(1) NOT NULL C_CTOR: CHAR(13) NOT NULL N_CTORKR: CHAR(40) NOT NULL C_CUR: CHAR(3) NOT NULL A_INSVAL: DECIMAL(17,2) NOT NULL A_OAMT: DECIMAL(17,2) NOT NULL A_OPRE: DECIMAL(15,2) NOT NULL R_HMIV: DECIMAL(7,4) NOT NULL

RD_MR_OCOWT
D_SEND: DATE NOT NULL C_ACO: CHAR(6) NOT NULL O_SENDSEQ: SMALLINT NOT NULL C_OCO: CHAR(6) NOT NULL
R_OCO: DECIMAL(7,4) NOT NULL A_OAMT: DECIMAL(17,2) NOT NULL A_OPRE: DECIMAL(15,2) NOT NULL
RD_MR_ICOWT
D_SEND: DATE NOT NULL C_ACO: CHAR(6) NOT NULL O_SENDSEQ: SMALLINT NOT NULL C_OCO: CHAR(6) NOT NULL O_TF: CHAR(3) NOT NULL C_RITYPE: CHAR(3) NOT NULL
R_IN: DECIMAL(7,4) NOT NULL A_IAMT: DECIMAL(17,2) NOT NULL A_IPRE: DECIMAL(15,2) NOT NULL R_ICOM: DECIMAL(7,4) NOT NULL A_ICOM: DECIMAL(15,2) NOT NULL

DB1

OTC DB2

DB3

DB4



 



·  ·  ·  · 



·  · 



·  ·  · 



14

·  ·  · 
 · 
 ·  · 


3.4 --


[ ]







[ ] 

SACC2013


[ ]

·  ·  () ·  ·  · 
15

3.4 --



1.3  1.4  1.5 

1.1 

1.2  1.6 

2.3  2.4  2.5 

2.1 

2.2  2.6 

6.2  6.6  7.2  7.6 

3.3  3.4  3.5 

3.1 

3.2  3.6 

4.3  4.4  4.5 

4.1 

4.2  4.6 

8.2  9.2  10.1 
16

SACC2013

6.1  7.1  5.1 

6.3  6.4  6.5 
7.3  7.4  7.5 
5.5 

8.1  9.1  10.2 

8.3  9.3  10.3 

3.5 

SACC2013

  




A (: A B (: 1 C (: 


 A :   B :   C :


 A : char(1)  B : number(1)  C : varchar2(10)

· · ·Communication  · ·
17

3.5 

SACC2013

 



BIZ 




 

Alignment()



Alignment()

 Alignment

Reverse Engineering

 ()



 









DSR
) DSR : Data Standard Repository








 group domain)

 

 

 
 :   :  ,   :   :   :  

18

· 

· 



·  + 

1

· 

· 



3

·  ·  · 


10

6

·  
· 
·  ·  · 
·  ·  · 

7
·  ·  · 

5 4
9 19

SACC2013
·  ·  · 
·  ·  · 
2

8
·  ·  · Tracking
·  ·  · 

·  ·  · Product Factory
·  ·  · 
·  ·  · 

SACC2013
20

OLTPOLAP

SACC2013

21

3.9 - SACC2013 
22

3.9 - SACC2013
23

3.9 - SACC2013

24

3.9 - SACC2013 
25

3.10 -SACC2013


26

3.12 EDF Architecture

SACC2013

27

Contents
Data Driven World
Thank you!

SACC2013

