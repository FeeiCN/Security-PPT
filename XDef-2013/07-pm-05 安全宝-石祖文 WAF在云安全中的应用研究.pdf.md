WAF
(Safe3) safe3q@gmail.com -


·  · WAF · WAF · Web · Q&A

1.

1.1
 "  "

1.2
· PV · TB ·  ·  · 0day ·  · DDOS70G

1.3 2012
· 

2.WAF

2.1
1.nginxRAMWeb Server
2.luajitCPUC++ 
3.hadoop

2.2WAF

2.3 nginx
1.reload2server 2.2server2G88
16G 3.url
 4.


2.4 
2.4.1 nginx 1nginx

2.4 
2nginxgzip

2.4 
2.4.2 Luajit 1LuajitC++

2.4 
2Luagzip

2.4 
2.4.3 nginx 1nginx
cache manager 
cache loader 
ngx_process_events_and_timers() ngx_event_expire_timers() ngx_event_timer_rbtree()   handlerhandler ngx_cache_manager_process_handler ngx_cache_loader_process_handler

2.4 
2Luapatch nginx ngx_http_file_cache_valid

2.4 
3Luapatch nginx ngx_http_file_cache_read

2.5 nginx

2server

nginx.conf



    

2Gn 200M1+0.1*n



10

1

2

reload 



 lua

2.5 nginx

3.WAF

3.1 WAF

http

  

http



WAF

 WAF

http
 asp phpjsp server

lua

lua sql

 0day

 web

APT 

  

3.2 HTTP
3.2.1  1nginxpost 2nginxhttp

3.2 HTTP
3.2.2 post 1ngx_http_read_client_request_body r->request_body
r->request_body>temp_file->file

3.2 HTTP
3.2.2 post 2nginxfilterhook
ngx_http_read_client_request_body ngx_http_do_read_client_request_body post body nginx

3.2 HTTP
3.2.3 post post
application/x-www-form-urlencoded multipart/form-data text/xml application/soap+xml application/json

3.2 HTTP
3.2.4 http

3.2 HTTP
3.2.5 , 
{"files":[{"filename":"C:\Users\ad\Desktop \t.htm","content":"<!DOCTYP....."}],"params": [{"name":"s","value":["t1","t2"]}]}

3.3 
3.3.1 WAF lua APT

3.3 
3.3.2 lualuajit C 

3.3 

3.3.3 WAF

    

WAF

WAF

    

(and/while/if)    

3.4 WAF
3.4.1 WAFWAF,  WAF sql

3.4 WAF
3.4.2  lexyaccflexbisonragelre2clemon  http://www.softpanorama.org/Algorithms/
compilers.shtml  http://en.wikipedia.org/wiki/
Comparison_of_parser_generators

3.4 WAF
3.4.3 sqlsqlitelemon sqlite http://www.sqlite.org/arch.html

3.4 WAF
3.4.3 

3.4 WAF
3.4.4  WAFhttp http://foo.cn/?x=xxx+xxx +65535x%201+and+union+select+a+from+b WAF(?i:(?:(union(.*?)select(.*?)from))) WAFxsql WAF sql sql

3.4 WAF
3.4.5 0day 10day  2 0day

3.4 WAF
3.4.6  http://en.wikipedia.org/wiki/ Artificial_neural_network

3.4 WAF
3.4.7   
 CPU

3.4 WAF
3.4.8 0day

3.4 WAF
3.4.9 0day dedecms exp
spideradmin GETquerystring   97%

3.4 WAF
3.4.10 web APT  1webgoogle
 2sqlwebshell 3 4 APT sql 23 http://foo.com/?id=1+and+1=1 http://foo.com/?id=1+and+1=2

3.4 WAF
37 http://foo.com/?id=1+and+1=2+union+select
+1,database(),3%23 38 http://foo.com/?id=1+and+1=2+union+select
+1,table_name,3+from+information_schema.tables +where+table_schema=0x636D73+limit+0,1
233738ip ip 

3.4 WAF
3.4.11 web 
WAF ip

3.4 WAFWAF

4.Web

4.1 Web
facebook

4.1 Web
http://www.informationisbeautiful.net/visualizations/worlds-biggest-data-breaches-hacks/

4.2 Web
WebStruts 2

4.2 Web
Apache Struts 2 

Q&A
1.     

Q&A
2. web 

Q&A
2. web web DDOSCDN 

Q&A
3.    

Q&A
Thank you!

