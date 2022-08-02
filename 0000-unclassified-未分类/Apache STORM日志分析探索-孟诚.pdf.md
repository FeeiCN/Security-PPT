"QBDIF4UPSN °
Presented  by:   

Presentation
· STORM   · STORM   · STORM   · STORM   · STORM  

 

°
p   ·   
p   ·    ·   

STORM
· (  distributed  real-me   computa-on  system)  
ü(scalable)   ü(fault--tolerant)   ü(guarantees  your  
data  will  be  processed)     

STORM

Nginx






·            e.g  script.*/script      · 
  


  
  
  
  
  
  
  
  
  

STORM
·  

STORM

STORM

JAVA









8

Sure,  but  we  enjoy  it!

20 

2



10,000,000,000  


18,000,000  
   2015.05.21  10am

1,000,000  


PV

   
   
 

  

  



UV   

HTTP_Code   

   

   










   


   
   

Mysql

   




Cassandra   



 

Config_Table
            





VPM_Table
       
  

IP_Count_Table
IP   IP  ABC    
        





 

Method+request+UA  

N

 +IP+Request_Data

Key
www  

 detail



.vip.com

 W_1

 T

Y

www  

.*

W_2

F

.vip.com  

N





cart.   vip.com
cart   .vip.com

cartadd viewcart

C_1

T

C_2

F

Y
   

wap_login,   1505221735,   101.102.135.1  

mapi  

login_id=.*&p Wap   T

.vip.com asswd

_login

sapi  

.*

.vip.com

S_1

T





wap_login,1505221735,101.102.135.1   wap_login,1505221735,101.102.135.1   wap_login,1505221735,101.102.135.1  





Key
wap_login,   1505221735,   101.102.135.1  

value 1



Key
wap_login,   1505221735,   101.102.135.1  

value 1 2

Key
wap_login,   1505221735,   101.102.135.1  

value 3









5  5

10

_1

_2

5

5

   1+(60--20)  /10  =  5   1+(60--20)/5  =  9  

5  5


· SQL  
Select.*from|from\\W+informagon_schema|/\\char\\(\\d*\\)|chr\\(\\d*\\)......  
  
sqlmap|Acunegx......  
·   
script>.*</script......  
·   
\\.\\./|\\.\\.  %2f|etc/passwd|......  
· WEBSHELL  
phpshell\\.php|webshell\\.php......  
Stucts  
s|%20)+\\{.*\\|getRungme|redirectAcgon......  


·    ·     
String[]  pre_sqlinj=  {"select","informagon_schema","char","chr"};   sqlinj  =  Pauern.compile("Select.*from|from\\W+informagon_schema|/\ \char\\(\\d*\\)|chr\\(\\d*\\)",Pauern.CASE_INSENSITIVE);        



·    
·    
·    

   


   


Mysql
·   
·   
PARTITION  BY  RANGE  (weekday)   (PARTITION  Sun  VALUES  LESS  THAN  (1)  ENGINE  =  InnoDB,     PARTITION  Mon  VALUES  LESS  THAN  (2)  ENGINE  =  InnoDB,     PARTITION  Tue  VALUES  LESS  THAN  (3)  ENGINE  =  InnoDB,     PARTITION  Wed  VALUES  LESS  THAN  (4)  ENGINE  =  InnoDB,     PARTITION  Thu  VALUES  LESS  THAN  (5)  ENGINE  =  InnoDB,     PARTITION  Fri  VALUES  LESS  THAN  (6)  ENGINE  =  InnoDB,     PARTITION  Sat  VALUES  LESS  THAN  (7)  ENGINE  =  InnoDB,     PARTITION  error_day  VALUES  LESS  THAN  MAXVALUE  ENGINE  =  InnoDB)    

MySQL

· (Batch  Insergon)  
        INSERT  INTO  yourtable  VALUES  (1,2);           INSERT  INTO  yourtable  VALUES  (5,5);     m      IyNsqSl_EtRabTle  IN_nTaOme  yourtmaybsqlel_  VcoAmLmUaEnSd  (1,2),  (5,5),  ...;  

batch_no

Wap_login

Insert  into  Wap_login  values(`1','2'),(`3','4');

2

www_table

Insert  into  www_table  

3

values(`4','2'),(`3','4'),  (`3','8');

...

...

...

...

...

...

...

...

...



MySQL



Sql="insert into table (`a`,`b`) values (`1','2');" Statement statement =conn.createStatement(); statement.executeUpdate(sql); statement.close(); statement = null;

ArrayList<String> mysql_table_name =new ArrayList <String>(); ArrayList<String> mysql_command =new ArrayList <String>(); ArrayList<Integer> batch_no =new ArrayList <Integer>(); ... mysql_table_name.clear(); mysql_command.clear(); batch_no.clear();

Takeaways
·    
·    · MySQL   ·    ·    · JAVA  GC  

   

 
     

  

  
Python     
  

     
     

