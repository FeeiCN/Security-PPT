Nginx + Lua 

NGINX 

IP UserAgent
URI Frequency Limit
   / 

 

NGINX 
SIGNAL
Master

Worker Worker Worker Worker

Read / Write
Share MEM

NGINX 

Main Events HTTP Server
Location Location
Server

IF IS EVIL

 IF 

set $flag 0;

if ($remote_addr ~ "^(12.34|56.78)") { set $flag "${flag}1";
}

if ($http_user_agent ~* "spider") { set $flag "${flag}1";
}

if ($flag = "011") { return 403;
}

IF IS EVIL

 IF 

location /test { set $true 1;
if ($true) { add_header X-First 1;
}
if ($true) { add_header X-Second 2;
}
return 204; }

Nginx
       
Web

Lua
       


Nginx+Lua 
  Nginx  Lua    Lua  Nginx   

NGX_LUA_MODULE  init_by_lua
init_worker_by_lua
set_by_lua rewrite_by_lua access_by_lua
content_by_lua body_filter_by_lua
log_by_lua

Nginx Init Phase
Nginx Rewrite / Access
Phase
Nginx Content Phase
Nginx Log Phase

Hello world
worker_processes 1; events {
worker_connections 1024; } http {
server { listen 8080; location / { default_type text/html; content_by_lua ' ngx.say("<p>hello, world</p>") '; }
} }

WAF demo
location / { access_by_lua ' local ua = ngx.var.http_user_agent local ip = ngx.var.remote_addr
if ngx.re.find( ua, "spider", "i") and ngx.re.find( ip, "12.34|56.78", "i") then
ngx.exit(403) end '; }

Nginx ngx_lua_module OpenResty 

OpenResty

Nginx
HTTP  

Ngx_Lua_Module
Lua VM Nginx API

 Nginx 
EchoNginxModule HeaderMoreNginxModule AuthRequetNginxModule ...
 Lua 
LuaRestyDNSLibrary LuaRestyLockLibrary LuaRestyMemcachedLibrary ...

 Cookies 

Client

without cookies
Set Cookies
with cookies

Nginx

UpStream UpStream UpStream

Token Seed
IP UserAgent
X-Forward-By Secret

Verify Token

Set Cookies ( Token )

Lua

 JavaScript 

Javascript Runtime
Gen Token Set Cookies
Client

without cookies
Javascript
with cookies

Nginx

UpStream UpStream UpStream

Verify Token

Return Javascript

Lua


VeryNginx

 OpenResty



 WAF 

7FSZ/HJOY Filter Proxy Rewrite Proxy ...

VeryNginx Frame

Web Control Status statistics Panel

Matcher Action FrameWork

OpenResty Nginx

Q & A

Thanks

