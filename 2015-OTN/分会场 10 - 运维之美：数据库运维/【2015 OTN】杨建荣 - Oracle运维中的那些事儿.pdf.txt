Oracle 

-- 
ØOracle A  CE--A   ØYEP ØOracle 1  0g O  CP,OCM   ØMySQL  OCP Øshell  ,  Java ØDBA+ Ø Ø2015 Ø
620







 



 




· DBA ·  ·  

DBA


­ BOSS, ­  ­  ­ 
· UAT ·  · 11grac active/passive · 11gadg BCV · 12cPDB ­ 
·  · sql ·  · skip  scan


­ select  `Oracle i  s  alive' f  rom  dual;    ­ grid  control   ,em12c    VS        zabbix+orabbix ­ 
· 11gv$flash_recovery_area_usage · 11gmount · Asm
­ 

 ,   8. 8
 ,   2. 9  ,   2. 9

%

,   80

,   58.3

pci,   8.3 raid,   4.1

,   20.8

cpu,   8.3

    cpu  raid pci



4500 4000 3500 3000 2500 2000 1500 1000 500
0

4123 

30 

90 

464 




­  ­  ­ 
· 10012
­ DIY
· DB  time
­ 


­ 
·  ·  ifconfig ­a6        vs ifconfig ­a  6 · system
­ 
·  exp · silentresponsefile,res ponseFile
­ 
· sql monitor14sql
­ 
· drop   datafilebug
­ 
· 5T1M


­ sqlprofile ­      ­ 4pl/sql1sql ­ sqlldr ­ 
­  ­ 


· $  sqlplus /  as  sysdba ORA--09817: W  rite t  o a  udit f  ile  failed. Linux--x86_64 E  rror: 2  8: N  o s  pace l  eft o  n d  evice
· audit,sysdbaaudit




· 
­ 314 ­ 70

,
­ awr,ash,addm ­ 
·  ­ 
· sql · 



· SEGMENT_NAME                        PARTITION_NAME                   SEGEMENT_BYTES

· CHARGE   CHARGE   CHARGE   CHARGE   CHARGE  

P120_C100  

1  

P120_C10  

438  

P120_C20  

1  

P120_C30  

1  

P120_C40  

1  

· 

· partition   by r  ange(period_key,customer_key)  

partition  P41_C100 values  less  than  (41,100)

partition  p120_c10  values  less  than  (120,10)

· PARTITION_NAME   HIGH_VALUE            TS_NAME     · P41_C90                 41,  90                    DATAH01      · P41_C100               41,  100                  DATAH01     · P120_C10               120,  10                  DATAH01     · P120_C20               120,  20                  DATAH01     · P120_C30               120,  30                  DATAH01  



· SQL> s  elect *  from t  est p  artition(p120_c10);

· PERIOD_KEY   CUSTOMER_KEY  

· -------------------- ------------------------ ------------------------

· 57

99  

· 57

150  

· 120

5  

· 119

50  

· 120

5  


­ DBA ·  ·  ·  ·  · DBA
­  ·  · 

jianrong--notes

 


ORA



Oracle

z3 ­ SQL

zData ­ 

BayMax

 

