 

Who am I
o   
o Oracle ACEACE o 
o ITPUB; o 12 o  Oracle - ACOUG,
o  
o  Oracle ACE Oracle ACESQL
OCMMySQLDB2
o 200
 

DevOps
   SQL 
    
 

SQLSQL
· SQL ­ 
­ SQL ­ Oracle SQL Language Reference ~ 2000  ­ SQL ­ SQLSQL

300%

SQL  

 

SQL 
 SQL

SQLAccess Path    

 ­ SQL
· 
­  ­ AWRSQL
 

­ SQL
· AWR
­ SQL
 

­ SQL
· 
­ 

 

Or  

SQL
· 

 

 

SQL
· 
 

· 

 - 
2.5

 

· SQL

 - 

 

 - 

update /*+parallel(b, 8)*/ acc_bill b set brand = (select brand from USER where serv_id = b.serv_id ) , plan_id = (select plan_id from USER where serv_id = b.serv_id ) where b.serv_id in( select /*+parallel(c, 8)*/ serv_id from USER c )

2.5



update acc_bill b

set (brand, plan_id) = ( select brand , plan_id

1.2

from USER where serv_id = b.serv_id )

where b.serv_id in (select serv_id from USER c )


 

update ( select a.brand brand_a

830  

, a.plan_id plan_id_a



, b.brand, b.plan_id

from acc_bill b , user a

where b.serv_id = a.serv_id )

set brand = brand_a , plan_id = plan_id_a;

 ­ Non Key-Preserved Table
Ora-01779Oracle 1N11 Oracle
 

 ­ Update

· 
SQL> create user enmotech identified by enmotech; SQL> grant create session to enmotech; SQL> connect enmotech/enmotech Connected. SQL> connect eygle/eygle SQL> create public synonym bill for eygle.bill; SQL> create public synonym users for eygle.users; SQL> grant select,update on bill to enmotech;
Grant succeeded. SQL> grant select on users to enmotech;
Grant succeeded.
 

SQL> connect enmotech/enmotech

SQL> update (

2

select a.brand brand_a , a.plan_id plan_id_a

3

, b.brand , b.plan_id

4

from bill b

5

, users a

6

where a.serv_id = b.serv_id

7

)

8

set brand = brand_a , plan_id = plan_id_a;

ERROR at line 5:

ORA-01031: insufficient privileges

SQL> update bill b

2

set (brand, plan_id) = (

3 select brand , plan_id

4 from users where serv_id = b.serv_id )

5 where b.serv_id in (select serv_id from users c )

6 /

13639 rows updated.

 ­ Update

· 

SQL> connect eygle/eygle Connected. SQL> revoke update on bill from enmotech; Revoke succeeded.

SQL> update (

2

3

4

5

6

7

8

9

)

10

set brand

ERROR at line 7:

SQL> connect enmotech/enmotech

SQL> update

select a.brand brand_a

2 (with tmp as (

, a.plan_id plan_id_a 3

, b.brand

4

, b.plan_id

5

from buislel rbs a,

6

, ubseilrl sba

7

where a.serv_id = b.serv_id

8

select a.brand brand_a , a.plan_id plan_id_a , b.brand , b.plan_id
from bill b , users a

= brand_a, p, plalnan__idid ==plpalna_n_idi_d_a;a;

, users a bill b

*

*

9

where a.serv_id = b.serv_id)

10

select * from tmp

11

)

12 set brand = brand_a,plan_id = plan_id_a;

ORA-01031: insufficient privileges

13639 rows updated.

 ­ Update

· 

SQSQL>L>cocnonnecnteecytgleen/emygoletech/enmotech

CSoQnnLe>ctuepd.date

SQ2L>(rweivtohktemuppdaaste(on bill from enmotech;

Rev3oke succeeded.

select a.brand brand_a

4
SQL> update (
2 5

, a.plan_id plan_SiQdL_>aconnect enmotech/enmotech

select a.brand b, rba.nbdr_aand

SQL> update 2 (with tmp as (

3 6

, a,.pbla.pn_laidnp_laind_id_a 3

select a.brand brand_a

4 5

7

6 8

from b,,ibbll..bpbrlaann_did from buislel rbs a,, users a

4 5 6

, a.plan_id plan_id_a , b.brand , b.plan_id

7 9

where a, u.bseielrlrsbva_id = b.serv_7 id)

from bill b

810

whseerelea.cster*v_firdo=mb.stemrvp_id

8

9
1011

)
set br)and = brand_a, p, plalnan__idid ==plpalna_n_idi_d_a;a;

9 10

, users a where a.serv_id = b.serv_id) select * from tmp

12 set brand = brand_,au,spelrasna_idbi=ll bplan_id_a; 11

)

*

*

12 set brand = brand_a,plan_id = plan_id_a;

ERROR at line 7:

O1R3A6-031903r1o: iwnsusffuicpiednat tperidvi.leges

13639 rows updated.

 ­ Update
· 
­ 11.2.0.311.2.0.412.1 ­ 20147CPUCPU
 ­ Oracle
 

· 32x 
 

 - 
4.5  

10000

9000

8000

7000

6000

5000

4000

3000

2000

1000

0

1

2

 ­ OracleSQL
· SQL3516 ­ 150X
select /*+rule*/ '' flag , e.OPCODE , e.GOODSNAME , e.GOODSTYPE , e.PRODAREA , <last_qty> , <now_qty>
from ( select distinct goodsid from BMS_SA_QTYSPLIT_LST where pf_splitflag(goodsid) = 1
)t , pub_goods e where t.goodsid = e.goodsid;

 ­ OracleSQL
· SQL3516 ­ 150X
­ Last_qty  Now_qty

a.credate between to_date('2014/10/01 00:00:00',
'yyyy/mm/dd hh24:mi:ss') and to_date('2014/10/31 23:59:59',
'yyyy/mm/dd hh24:mi:ss')

a.credate between to_date('2014/11/01 00:00:00', 'yyyy/mm/dd hh24:mi:ss') and to_date('2014/11/18 23:59:59', 'yyyy/mm/dd hh24:mi:ss')

 

 ­ OracleSQL

· SQL3516 ­ 150X
­ Last_qty  Now_qty 
a.credate between to_date('2014/10/01 00:00:00', 'yyyy/mm/dd hh24:mi:ss') and to_date('2014/11/18 23:59:59', 'yyyy/mm/dd hh24:mi:ss')

select '' flag
, f.OPCODE , f.GOODSNAME , f.GOODSTYPE , f.PRODAREA
, sum(decode(to_char(e.credate, 'yyyy/mm'),

'2014/10', e.goodsqty, null)) last_qty

, sum(decode(to_char(e.credate, 'yyyy/mm'),

'2014/11', e.goodsqty, null)) now_qty
from gzmpcmis.pub_goods f

,< last_qty + now_qty> e , (
select distinct goodsid from gzmpcmis.BMS_SA_QTYSPLIT_LST where gzmpcmis.pf_splitflag(goodsid) = 1

) g

where f.goodsid

= g.goodsid

and g.goodsid

= e.goodsid(+)

group by f.goodsid, f.OPCODE, f.GOODSNAME,f.GOODSTYPE

, f.PRODAREA

order by f.opcode;

 

 ­ OracleSQL
· SQL3516 ­ 150X
 

 - SQL · SQL-
 

 - 98%  LR - SQL · AWRTop SQL
 

 ­ SQL

SELECT UNICARD_NO FROM TF_R_UNICARD WHERE PRESENT_TAG = '0' AND LIMIT_DATE + 0 > SYSDATE + 90 AND UNICARD_STATE||NULL = '0'

FOR UPDATE LOCAL ROWNUM COUNT STOPKEY

AND UNICARD_VALCODE||NULL = :B3

AND ROWNUM <= :B2

AND RESERVED1 = :B1

AND (RESERVED2 <> `99' OR RESERVED2 IS NULL) FOR UPDATE

 

PARTITION HASH ALL

 ­ 

SQL> SELECT UNICARD_NO
2 FSRQOLM> USCERL_ECCATRUD_N0I1C.ATRFD__RN_OUNICARD PARTITION(P1) no3456789roWAAAAAAwnHNNNNNNsoEDDDDDD23456789sRreLUURR(EolINNOERFWAAAAAAwSPeMIIWSERHNNNNNNsQRcICCNESOEDDDDDD23456789LEstTAAUREMR>SeLUURR(e_RRMVREUElINNOERdDDDEVFWAAAAAASS<CPNA__DEeMIIWSERHNNNNNNEQ=RRTTSV1DcICCNESOEDDDDDDL2345678L_ETA2_EtTAAUREMRE=1>TALCSLUURR(e_RRMVREC+<ATCUAEINNOERdDDDEVFWAAAAAST'S><GEOCPRNA__DEMIIWSE0RHNNNNNE0Q|D=RRUDTTSV1DICCNES='OEDDDDDL2345674L|E__ETA2_ENTAAURE>9MRE2=1>N|0TALCSILUURR_RRMVR'9EC2+<U|1ATCUAECSINNOEDDDEV0FWAAAAS'T'LN'><.GEOCPRNA__DEAYMIIWS'0RHNNNNE0LUT|D=ORRUDTTSV1DRSICCNE='OEDDDDLL4F|E__ETA2D=R_ENDTAAUR>9MREL2=1_N|0TAL_CSILUURA_RRMV'9EC2+<RU|1ATCN'=RUAECSINNOTDDDE0'T'_LN'><.GEOO0ECPRNA__DAYMIIWE'00ULUT|D'='SORRUDTTV1RSICCN='NL4F|E0+E__ETAD=R_ENDTAAU>9IL2=1_N|4R0TAL_CSIA_RRM'C929+RU|'1ATCN'=RVAECSTDDD0A''_LN'0<.GEOO0ERNA__AYRE'00ULUT|D'=D'SODTTSVRSD=NL4F|E0+2E__ETAD=RD>IL21_N|P4R0TAL_A'CI29+RU|A'1ATCN'=RVST0AS_LN'0R.GEOO0EEYRE'0ULUTT|D'D'SNSD=NLIF|E0+2E=UD>IL_N|PT4RLA'CI9RU|AI''=VSLT0AS_LN0OR0EY)RE'ULUNT'D'NSDNL(I;0+2=UDILPPT4LACI29AI''=LTAS)0OR0)RENT''ND(I;0+UPPT4L39AI'L)0OR)NT(I;PT4I)ON(P5)
no rows9selAeNcD8t(eRdAENSDERREVESDE2RV<E>D1'9=9''0O4R22R'ESERVED2 IS NULL) ; 9 AND (RESERVED2 <> '99' OR RESERVED2 IS NULL) ;
no rows selected

 

UNICARD_NO ---------------------------------------XXXXXXXXXXXXXX

SQL> ALTER SESSION FORCE PARALLEL DDL; Session altered.

 - 

SQL> CREATE INDEX IND_UNICARD_RES_VALCODE_DATE ON TF_R_UNICARD 2 (RESERVED1, UNICARD_VALCODE||NULL, UNICARD_STATE||NULL, LIMIT_DATE + 0) PARALLEL 8 ONLINE;
Index created.

SQL> ALTER INDEX IND_UNICARD_RES_VALCODE_DATE NOPARALLEL; Index altered.

 

DevOps
   SQL 
    
 

 





Oracle

z3 ­ SQL

zData ­ 

BayMax

 

