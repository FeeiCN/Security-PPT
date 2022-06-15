 PCI DSS 

 

01 2020-07-10



 ©  2020   

 
   
 





 518129



https://www.huawei.com

 support@huawei.com

 4008302118

 01 (2020-07-10)

 © 

i

 PCI DSS 

 

 
1 ..............................................................................................................................................1
1.1 ...................................................................................................................................................................................... 1 1.2 ................................................................................................................................................................ 1 1.3 ...................................................................................................................................................................................... 1 1.4 ...................................................................................................................................................................................... 1
2 PCI DSS ...................................................................................................................... 3
2.1 ...................................................................................................................................................................................... 3 2.2 ............................................................................................................................................................................. 4
3  PCI DSS .......................................................................................................... 5
3.1 .................................................................................................................................................................... 5 3.2 ............................................................................................................................................................. 10 3.3  PCI DSS ................................................................................................................................... 10
4  PCI DSS .................................................................................... 13
4.1 PCI DSS ................................................................................................................................................................... 13 4.2 ............................................................................................................................................................. 13 4.3 ...................................................................................................................................................................... 22
5 ........................................................................................................................................... 24 6 ....................................................................................................................................25 7 ....................................................................................................................................26

 01 (2020-07-10)

 © 

ii

 PCI DSS 

1 

1 

1.1 


1.2 
Payment Card Industry Data Security Standard,  PCI DSS PCI DSS PCI DSS 
 PCI DSS
 PCI DSS

1.3 
PCI DSS PCI DSS PCI DSS
 

1.4 
PCI2006JCB   Visa
Cardholder DataCHD
 PAN16  

 01 (2020-07-10)

 © 

1

 PCI DSS 

1 

   34

Sensitive Authentication DataSAD 
  PANCVVPVV
 34CVV2 VISACVC2CVN2CID CAV2JCB
 PIN/PIN
Cardholder Data EnvironmentCDE 

PCI 
 

 01 (2020-07-10)

 © 

2

 PCI DSS 

2 PCI DSS 

2 PCI DSS 
2.1 
PCI  (PCI DSS) (PA-DSS)  (PED)  PCI DSS  12 

PCI DSS 20183.2.1

 01 (2020-07-10)

 © 

3

 PCI DSS 

2 PCI DSS 

2.2 
PCI DSS PCI DSS  
PCI DSS 

 01 (2020-07-10)

 © 

4

 PCI DSS 

3  PCI DSS 

3  PCI DSS 

3.1 

3.2.1PCI DSS PCI DSS 
 CBC 3.2.1PCI DSS
47 
PCI DSS

    
  

/



Anti-DDoS IPDDoS





DDoS AAD

DDoS 

Web

HTTP(S) Web



  



 



 



 

 01 (2020-07-10)

 © 

5

 PCI DSS 

3  PCI DSS 

 









           


/





  



 

 







VMware 



 



 



  



 



  



TBPB 



 

  .



 



 





 

APP  
CPU  

 01 (2020-07-10)

 © 

6

 PCI DSS 

3  PCI DSS 

   
   


   
  

/





 



 



  



 



Kubernetes Docker



 

   



P2V/V2V  

 MySQL

 MySQL 

 PostgreSQL

 SQLOLTP

 SQL Server

 

 GeminiDB

 NoSQL

 DDS

  

 DRS

 

 DAS

 



 

 01 (2020-07-10)

 © 

7

 PCI DSS 

3  PCI DSS 

 

   
     
    
EI 

/





  

NAT

/VPN  

IP

IPIP 



VPC 



 



VPC VPC 

 







 



 









 Redis

RedisMemcached  

 Memcached

Memcached  

 DMS

 



 

API

 API




HTTP/HTTPS/TCP/UDP/WebSocket/RTMP/HLS 

ModelArts

AI

 01 (2020-07-10)

 © 

8

 PCI DSS 

3  PCI DSS 

 EI  EI  EI  EI 
EI  EI 
EI  EI  EI  EI 
EI  EI  EI 




/





"""" 



Apache SparkApache Flink Serverless



 



  



 Stream SQL

MapReduce

  



 



 



 



  



 



 



  

&

API 

   

 





 01 (2020-07-10)

 © 

9

 PCI DSS 

3  PCI DSS 

3.2 
 

 IAM
 

3.3  PCI DSS 
PCI DSS 

12 
PCI DSS1CDE DNSWeb VPN SVNIPSecVPN Web
 

34 
 

 01 (2020-07-10)

 © 

10

 PCI DSS 

3  PCI DSS 

AES PAN  
  TLSIPSec AES DEKKEKAES PCI

56 
IPSWebHIDS IPS Web SQLCSSCSRF Windows  HIDS  TCP/IP 
 
 

789 
  
  
     

1011 

 01 (2020-07-10)

 © 

11

 PCI DSS 

3  PCI DSS 

CLS CIP  
  


12
 ISO 27001ISO 27017ISO 20000ISO 22301CSA STAR CC+EAL3+ MTCS Level3  
   
  

 01 (2020-07-10)

 © 

12

 PCI DSS 

4  PCI DSS 

4  PCI DSS 
4.1 PCI DSS 
PCI DSS PCI DSS PCI DSS PCIQSA 
4.2 
 PCI 

Service Level AgreementSLA 

 01 (2020-07-10)

 © 

13

 PCI DSS 

4  PCI DSS 

IaaSPaaS  IaaSPaaS
SaaS 
PCI DSS12 PCI DSS

 1 
PCI DSS  
 

1  IaaS
PaaS SaaS


  
 


1VPCNAT
IaaSPaaSVPC VPC VPCWebVPC  1.3 VPC 
NATVPCNAT VPCNATIP 1.3.7IP

 01 (2020-07-10)

 © 

14

 PCI DSS 

4  PCI DSS 

 2 
 
IaaSIaaSPaaS  

2  IaaS PaaS SaaS

  


2IAM
IAM  IAM 2.1 IAMHTTPS2.3 

 01 (2020-07-10)

 © 

15

 PCI DSS 

4  PCI DSS 

 3 
 
IaaSPaaS 

3  IaaS PaaS SaaS

  PAN


3DEW
MySQLPostgreSQLSQL ServerNoSQLISO 27001CSA 14VPC  3.1 SHA256 3.4 
DEWHSM  HSM 3.5
 4 
 
IaaSPaaS  

4  IaaS


   

 01 (2020-07-10)

 © 

16

 PCI DSS  4 PaaS
SaaS

4  PCI DSS 
   

4ELBDEWDC 
ELBHTTPS TLSTLS1.2 TLS1.34.1 
4.1DEW HSM
DCVPC VPC 4.2 
 5 
 
 

5  IaaS
PaaS SaaS


  
 


 6 
 

 01 (2020-07-10)

 © 

17

 PCI DSS 

4  PCI DSS 

 PaaSSaaS 

6  IaaS PaaS SaaS

  


6VSSDBSSWeb WAF
VSSWeb   CVECVE 6.1VSS SQLXSSCSRFURL6.5.16.5.9 XSS
DBSSSQL 6.5.16.1SQL

PCI DSS Web  WebWAF WAFSQL

 01 (2020-07-10)

 © 

18

 PCI DSS 

4  PCI DSS 

CC 6.6Web

 7 
  
 

7  IaaS PaaS SaaS

  


7IAM
IAM IAM  7.1

 8 
 (ID) 
 
IaaS 

8  IaaS PaaS SaaS


 ID
ID 

7IAM

 01 (2020-07-10)

 © 

19

 PCI DSS 

4  PCI DSS 

IAM  3~108.1.6 IAM1~240 8.1.490 IAM15 8.1.815IAM 90 8.2.38.2.5
IAMMFA8.2 8.38.6

 9 
  
   3.2" "

 10 
  
SaaS 

10  IaaS PaaS SaaS

 


10LTSDBSS
LTS CES IP10.1 10.2
LTSDBSS 10.6.2

 01 (2020-07-10)

 © 

20

 PCI DSS 

4  PCI DSS 

LTSOBS10.7 

 11 

SaaS 

 11  IaaS PaaS
SaaS


  


11VSSHSS
11.2PCI DSS VSS VSS 
HSS  HSS  11.4 

 01 (2020-07-10)

 © 

21

 PCI DSS 

4  PCI DSS 

 12 
  
  

12  IaaS PaaS SaaS


 

 ISO 27001ISO 27018 

4.3 

PCI DSS 

 VPC NAT MySQL, PostgreSQL, SQL Server, GeminiDB ELB DEW DC VSS DBSS WebWAF IAM
LTS

 1.21.3 1.3.7 1.3.63.13.4
4.1 3.43.54.1 1.3.54.14.2 6.16.5.1-6.5.911.2 6.16.5.110.6.2 2.2.16.6 2.2.43.43.53.66.1.17.17.2 8.18.28.38.6 10.110.210.310.510.6.210.7

 01 (2020-07-10)

 © 

22

 PCI DSS 
 CES HSS

4  PCI DSS 
 10.110.2 11.411.5

 01 (2020-07-10)

 © 

23

 PCI DSS 

5 

5 
""       

 01 (2020-07-10)

 © 

24

 PCI DSS 

6 

6 

  



1 PCI  PCI  



3.2.1

2 PCI  PCI20184 

 01 (2020-07-10)

 © 

25

 PCI DSS 

7 

 2020-07-10

7 

 1.0

 

 01 (2020-07-10)

 © 

26

