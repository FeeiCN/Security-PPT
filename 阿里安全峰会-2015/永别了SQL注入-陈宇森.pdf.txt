 SQL 
 

SQL 
· SQLSQL injection   SQL    SQL  

SQL 
·  ·  · 

SQL 
· wooyun  61201  SQL  19250 
· OWASP TOP 10 ·  SQL 

SQL 
·  ·  · WAF


· libdejector · BlackHat 2005, Hansen and Patterson ·  SQL subset  ·  SQL context  · 


· ModSecurity,  WAFWAF
·  
·  · 


· libinjection · BlackHat 2012 ·  SQL  ·  85000  ·  


·  SQLi  · SQL  SQL · 1992 SQL : 625  ·  MYSQL, Oracle SQL, MS SQL, PostgreSQL


· SQL  ·  SQL  SQL  ·  bugs ·  


· BlackHat 2005, Hanson  Pattersn   
·  /
·  


·  5000 
·  35860  HTTP  SQL  3019  32841    SQL 
· XSSLFIRFIRCE 

WAF
20152

A B C


3.41% 78.39% 57.14%


9.77% 2.42% 1.56%


·  1%


·  · 


·  · url encodebase64json
querystring php serializeunicode escape  html encode  ·   · 



·  

Depth 1 2 3 4 5
SUM

Count 163 2569 232 9 2 2975

Percentage 5.40% 85.09% 7.68% 0.30% 0.07% 98.54%



· 1100 

Depth 
1 2 3 4

Count 675w 274w 181w 21w 8.9w

Percentage 61.39% 24.92% 16.50% 1.92% 0.81%



· 

Encoder php serialize
json url encode
base64 querystring
utf7 html

Count 15496 107682 1350637 1997110 4388661 1410 30499

Percentage 0.14% 0.98% 12.28% 18.16% 39.90% 0.01% 0.28%

SQL   A

/index.php? controller=site&action=getProduct&spec JSON=%7B%20%22people%22:%221'%20and %201=2%20union%20select%20md5(1122), 2,3,4,5,6,7,8,9%20and%20'1'='1%22%7D

SQL   A
querystring decode 
%7B%20%22people%22:%221'%20and %201=2%20union%20select%20md5(1122), 2,3,4,5,6,7,8,9%20and%20'1'='1%22%7D

SQL   A
url decode 
{ "people":"1\' and 1=2 union select md5(1122), 2,3,4,5,6,7,8,9 and \'1\'=\'1"}

SQL   A
json decode 
1' and 1=2 union select md5(1122), 2,3,4,5,6,7,8,9 and '1'='1

SQL   B

/plus/download.php?arrs1%5B%5D=98&arrs1%5B %5D=39&arrs1%5B%5D=32&arrs1%5B%5D=111&arrs1%5B %5D=114&arrs1%5B%5D=32&arrs1%5B%5D=49&arrs1%5B %5D=61&arrs1%5B%5D=40&arrs1%5B%5D=83&arrs1%5B %5D=69&arrs1%5B%5D=76&arrs1%5B%5D=69&arrs1%5B %5D=67&arrs1%5B%5D=84&arrs1%5B%5D=32&arrs1%5B %5D=116&arrs1%5B%5D=111&arrs1%5B%5D=112&arrs1%5B %5D=32&arrs1%5B%5D=49&arrs1%5B%5D=32&arrs1%5B %5D=46&arrs1%5B%5D=115&arrs1%5B%5D=121&arrs1%5B %5D=115&arrs1%5B%5D=99&arrs1%5B%5D=111&arrs1%5B %5D=108&arrs1%5B%5D=117&arrs1%5B%5D=109&arrs1%5B %5D=110&arrs1%5B%5D=115

SQL   B
url decode 
/plus/download.php? arrs1[]=98&arrs1[]=39&arrs1[]=32&arrs1[]=1 11&arrs1[]=114&arrs1[]=32&arrs1[]=49&arrs1 []=61&arrs1[]=40&arrs1[]=83&arrs1[]=69&arr s1[]=76&arrs1[]=69&arrs1[]=67&arrs1[]=84&a rrs1[]=32&arrs1[]=116&arrs1[]=111&arrs1[]= 112&arrs1[]=32&arrs1[]=49&arrs1[]=32&arrs1 []=46&arrs1[]=115&arrs1[]=121&arrs1[]=115& arrs1[]=99&arrs1[]=111&arrs1[]=108&arrs1[] =117&arrs1[]=109&arrs1[]=110&arrs1[]=115

SQL   B
querystring decode 
b' or 1=(SELECT top 1 .syscolumns

SQL   C

/search.php? encode=YToxOntzOjQ6ImF0dHIiO2E6MTp7czo xMjU6IjEnKSBhbmQgMT0yIEdST1VQIEJZIGdvb 2RzX2lkIHVuaW9uIGFsbCBzZWxlY3QgY29uY2F 0KHVzZXJfbmFtZSwweDNhLHBhc3N3b3JkLCciX CcpIHVuaW9uIHNlbGVjdCAxIyInKSwxIGZyb20 gZWNzX2FkbWluX3VzZXIjIjtzOjE6IjEiO319

SQL   C
querystring decode 
YToxOntzOjQ6ImF0dHIiO2E6MTp7czoxMjU6Ij EnKSBhbmQgMT0yIEdST1VQIEJZIGdvb2RzX2lk IHVuaW9uIGFsbCBzZWxlY3QgY29uY2F0KHVzZX JfbmFtZSwweDNhLHBhc3N3b3JkLCciXCcpIHVu aW9uIHNlbGVjdCAxIyInKSwxIGZyb20gZWNzX2 FkbWluX3VzZXIjIjtzOjE6IjEiO319

SQL   C
base64 decode 
a:1:{s:4:"attr";a:1:{s:125:"1\') and 1=2 GROUP BY goods_id union all select concat(user_name,0x3a,password,\'"\\ \') union select 1#"\'),1 from ecs_admin_user#";s:1:"1";}}

SQL   C
php serialize decode 
1') and 1=2 GROUP BY goods_id union all select concat(user_name, 0x3a,password,'"\') union select 1#"'),1 from ecs_admin_user#


·  ·  ·  ·  · n-gram ·  feature


·  ·  · SVM


·  ·  
· 99.9% · 
·  =>  ·  => 


·  
·  feature  
·  


·  
· 


·  · 

SQLChop
· 

SQLChop
· libinjection  ·  · select 1 from user where id=2 or · E1FnWn=1o


·  SQL  · ` or `1'=`1  · sos=s s1s1 ·  SQL  ` " 


libinjection 
· libinjection  fold  
·  html  fold  SQLi  tokenize
·  5  token

libinjection 
·  


·  token  · -> · ?


·  · 


·  ·  ·  tokenize 



SQLChop A B C


0.87% 3.41% 78.39% 57.14%


0.73% 9.77% 2.42% 1.56%

SQLChop 
·  encoding  payload  
· cookie, body, urlpath  ·  0day  ·  O(n)


SQLChop 
· select the best students from this class as the student union representative
· 

SQLChop 
·  · http://sqlchop.chaitin.com

