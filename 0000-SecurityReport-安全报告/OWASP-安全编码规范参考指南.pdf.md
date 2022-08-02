2012  8 

OWASP  


2010OWASP©  Creative Commons Attribution ShareAlike3.0 license  http://creativecommons.org/licenses/by-sa/3.0/



   

 Version 1.0

1

2012  8 

 ................................................................................................................................3  ...........................................................................................4
 ................................................................................................................5  ................................................................................................................5  ............................................................................................6  ................................................................................................................7  ................................................................................................................7  ................................................................................................................8  ....................................................................................................8  ................................................................................................................9  ..............................................................................................................10  ..............................................................................................................10  ..........................................................................................................10  ..............................................................................................................11  ..............................................................................................................11  ......................................................................................................12  A:.........................................................................................................................13  ..................................................................................................13  B: ............................................................................................................14

 Version 1.0

2



2012  8 

 

 

 2009  SANS  1  Web   60
    

 B  

 

 
 
  o OWASP CLASP 
  o OWASP 
  o OWASP Enterprise Security API (ESAPI) 
  o OWASP Application Security Verification Standard (ASVS) 
 RFP o OWASP Legal 

 Version 1.0

3



2012  8 

 
    Web  
     
  " "  
Web    Web OWASP WebScarabBurp WiresharkFlashJava Applet 

         
 
           

 Version 1.0

4



2012  8 


   

   UTF-8       UTF-8  UTF-8   URLHTTP 
cookie  JavaScriptFlash  post back    ASCII   

       ""  
 API < > " ' % ( ) & + \ \' \"   
o  (%00) o  (%0d, %0a, \r, \n) o "--"../ ..\ UTF-8 
 %c0%ae%c0%ae/ ( )

       HTML      SQLXML  LDAP   

 Version 1.0

5

2012  8 


 ""      

        salted 
/  MD5       "/" """"     
  HTTP Post   

 / 
  8  16  
  Web "password" 
  5  
   ""

             

 ""

 Version 1.0

6

2012  8 

    ID 
   ID       


        cookie       

   
      ID    URL HTTP cookie 
 GET   

  
  HTTP  HTTPS  HTTPS HTTP  HTTPS 
  
  
  TLS  cookie ""   cookie  HttpOnly 
cookie 



 

 

 

 Version 1.0

7

2012  8 
   "includes" AJAX 
FLASH        URL                
    /
  "referer"
  
   30   
    ""

           GUID    FIPS 140-2  http://csrc.nist.gov/groups/STM/cmvp/validation.html  



 

 Version 1.0

8

2012  8 
                                          TLS     


   

  ""
   
MS viewstateAdobe flash        HTTP GET     "Cache-Control: no-store" HTTP 
"Pragma: no-cache" HTTP/1.0   


 Version 1.0

9

2012  8 
  
   TLS   HTTP   TLS    TLS    TLS    TLS   TLS      HTTP referer 


        Web          robots.txt 
 robots.txt """"   HTTP GET  POST

  HTTP  WebDAV  HTTP  
  Web  HTTP1.0  1.1  HTTP 
  HTTP  OSWeb       

 

      

 Version 1.0

10

2012  8 
     
      
  
      

            Web     Web      UNIX         URL        


      strncpy()
 NULL 

 Version 1.0

11

2012  8 
         printfstrcatstrcpy  
     API   shell               "not-a-number"          

 Version 1.0

12

 A:
 1.  Sans and TippingPoint "The Top Cyber Security Risks" http://www.sans.org/top-cyber-security-risks/
 Web Application Security Consortium http://www.webappsec.org/
 Common Weakness Enumeration (CWE) http://cwe.mitre.org/
 Department of Homeland Security Build Security In Portal https://buildsecurityin.us-cert.gov/daisy/bsi/home.html
 CERT Secure Coding http://www.cert.org/secure-coding/
 MSDN Security Developer Center http://msdn.microsoft.com/en-us/security/default.aspx
 SQL Injection Cheat Sheet http://ferruh.mavituna.com/sql-injection-cheatsheet-oku/
 Cross Site Scripting (XSS) Cheat Sheet http://ha.ckers.org/xss.html


Secunia Citrix Vulnerability List:  http://secunia.com/advisories/search/?search=citrix
Security Focus Vulnerability Search:  http://www.securityfocus.com/vulnerabilities
Open Source Vulnerability Database (OSVDB):  http://osvdb.org/search/web_vuln_search
Common Vulnerability Enumeration:  http://www.cve.mitre.org/
 Version 1.0

2012  8 
13

 B: 

2012  8 

 

  

 

 



 

 

   JavaScript  CSS  URL  HTML  HTML  SQL XML  LDAP

  URL    

 

 







 



 
·  ·  · 

 Version 1.0

14

2012  8 

· ·  · 

HTML   HTML  ASCII  HTML  "&lt""<"HTML "" 



  

 

 
1.  2.  3. 4.  5.  IP  6.  7. 

 

  

   

 

 SQL   SQL 

  

 

 

 

  Web  HTTP 

 Version 1.0

15

2012  8 
  
 Web   
  
  


 Version 1.0

16

