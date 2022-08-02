ngx_lua 

ngx_lua 
 ()1 2012-06-30

1chaoslawful@gmail.com, @chaoslawful

.

.

.

.

.

.

ngx_lua 
Outline
1  2  3  4 

.

.

.

.

.

.

ngx_lua  

Apache+mod_php  PHP  curl  

.

.

.

.

.

.

ngx_lua  



 ()  Apache prefork/worker
/ //   ()  Apache+mod_php  RSS  5 MB 

 ()   +FastCGIHSHA/LF 


I/O  +   Nginx C 
 I/O  

.

.

.

.

.

.

ngx_lua  


-- ngx_lua 

.

.

.

.

.

.

ngx_lua  
Why Lua?
  VM  <100 KB 
 ~16 B  ~24 B LuaJIT 

.

.

.

.

.

.

ngx_lua  

Why Lua?
  Lua  PythonRubyPerl  PHP  CPU LuaJIT  C++/Java  
 ()2, 3

 fasta nbody spectral-norm binary-trees mandelbrot fannkuchredux

Lua 7.02 58.6 113.3 29.29 59.71 193.31

LuaJIT 0.8 1.34 2.59 2.95 1.8 5.4

Java 0.42 0.96 2.98 0.46 1.05 2.66

PHP 27.96 143.42 705.54 110.95 219.55 639.50

2i7 3.9 GHzLua 5.1.4LuaJIT 2.0b10OpenJDK6PHP 5.3.10

3 https://github.com/chaoslawful/shootout.

.

.

.

.

.

ngx_lua  
Why Lua?
/ VM  (coroutine) / VM   I/O  I/O   () 

.

.

.

.

.

.

ngx_lua  
ngx_lua 
 Nginx   ""  I/O  I/O  
""  I/O   I/O  ""  I/O  

.

.

.

.

.

.

ngx_lua  
ngx_lua 

 worker  Lua VM worker   VM
Nginx I/O  Lua VM 
 I/O   I/O 
 
 Proactor  

.

.

.

.

.

.

ngx_lua  

CPU Intel i7 3.9 GHz Mem 16 GB  4 

.

.

.

.

.

.

ngx_lua  

CPU  - ngx_lua

Nginx 

§

¤

worker_processes 4;

events { worker_connections 4096; }

location /cpu_intense {

default_type "text/plain";

content_by_file html/cpu_intense.lua;

¦}

¥

Lua 

§

¤

-- cpu_intense.lua

local random = math.random

local say = ngx.say

local n = tonumber(ngx.var.arg_n)

local dat = {}

math.randomseed(os.time())

for i=1, n do

dat[i] = random(0, 10000)

end

table.sort(dat)

local sum = 0

for i=1, n do

sum = sum + dat[i]

end

¦ say("sum: " .. sum .. ", cnt: " .. n .. ", avg: " .. sum/n)

¥

.

.

.

.

.

.

ngx_lua  

CPU  - Node.js

JS  §
var cluster = require('cluster'), http = require('http');
var numCPUs = 4;

if (cluster.isMaster) { for(var i = 0; i < numCPUs; i++) { cluster.fork(); }
} else { http.createServer(function (req, res) { var args = require('url').parse(req.url, true); var n = args.query.n; var dat = new Array(); for(i=0; i<n; i++) { dat[i] = Math.floor(Math.random()*10000); } dat.sort(); var sum = 0; for(i=0; i<n; i++) { sum += dat[i] } res.writeHead(200, {'-ContentType': 'text/plain'}); res.end('sum: ' + sum + ', cnt: ' + n + ', avg: ' + sum/n); }).listen(8080);
¦}

.

.

.

.

¤

¥

.

.

ngx_lua  

CPU  - HipHop

§HipHop 

¤

Server {

ThreadCount = 4

}

MySQL {

ConnectTimeout = 1000

SlowQueryThreshold = 60000

ReadTimeout = 60000

¦}

¥

PHP §



¤

<?php

$n = $_GET['n'];

$dat = array();

srand();

for($i = 0; $i < $n; $i++) {

$dat[] = rand(0, 10000);

}

sort($dat);

$sum = 0;

for($i = 0; $i < $n; $i++) {

$sum += $dat[$i];

}

echo "sum: ", $sum, ", cnt: ", $n, ", avg: ", $sum/$n;

¦ ?>

¥

.

.

.

.

.

.

ngx_lua  

CPU  - ngx_lua

 n  10000

 1 7 15 30 60
125 250 500 1000

 QPS(1/s) 193 768 762 740 748 756 754 751 773

99%  (ms) 5 9 19 40 80
165 331 665 1292

.

.

.

.

.

.

ngx_lua  

CPU  - Node.js

 n  10000

 1 7 15 30 60
125 250 500 1000

 QPS(1/s) 107 463 454 453 449 446 442 442 437

99%  (ms) 9 15 33 66
133 280 565 1128 2283

.

.

.

.

.

.

ngx_lua  

CPU  - HipHop

 n  10000

 1 7 15 30 60
125 250 500 1000

 QPS(1/s) 80 400 394 396 390 400 400 392 386

99%  (ms) 12 17 38 75
153 311 619 1275 2588

.

.

.

.

.

.

ngx_lua  
CPU 

.

.

.

.

.

.

ngx_lua  

I/O  - ngx_lua

Nginx §



¤

worker_processes 4;

events { worker_connections 4096; }

location /io_intense {

default_type "text/plain";

content_by_file html/io_intense.lua;

¦}

¥

Lua §



¤

local mysql = require 'resty.mysql'

local db = mysql:new()

db:set_timeout(2000)

local ok, err, errno, sqlstate = db:connect{

host = "...", port = 3306,

database = "test",

user = "...", password = "...",

}

if not ok then

ngx.exit(500)

end

local res, err, errno, sqlstate = db:query("select sleep(1)")

if not res then

ngx.exit(500)

end

¦ say("ok")

¥

.

.

.

.

.

.

ngx_lua  

I/O  - Node.js

JS 

§

¤

var cluster = require('cluster'), http = require('http'), mysql = require('mysql');
var numCPUs = 4;

if (cluster.isMaster) { for(var i = 0; i < numCPUs; i++) { cluster.fork(); }
} else { http.createServer(function (req, res) { var client = mysql.createClient({ host: '127.0.0.1', user: 'wxz', password: '', });

client.query('select sleep(1)', function(err, rows, fields) {

if(err) throw err;

res.writeHead(200, {'-ContentType': 'text/plain'});

res.end('ok');

client.end();

});

}).listen(8080);

¦}

¥

.

.

.

.

.

.

ngx_lua  

I/O  - HipHop

HipHop 

§

¤

Server {

ThreadCount = 4

}

MySQL {

ConnectTimeout = 1000

SlowQueryThreshold = 60000

ReadTimeout = 60000

¦}

¥

PHP 

§

¤

<?php

$host = "...";

$user = "...";

$pass = "...";

$db = mysql_connect($host, $user, $pass)

or die ('Could not connect: ' . mysql_error());

$res = mysql_query("select sleep(1)")

or die("Query failed: " . mysql_error());

mysql_free_result($res);

mysql_close($db);

¦ ?>

¥

.

.

.

.

.

.

ngx_lua  
I/O  - ngx_lua

 1 7 15 30 60
125 250 500 1000

 QPS(1/s) 1 7
15 27 56 111 214 390 605

99%  (ms) 1023 1060 1005 1091 1071 1125 1167 1280 1651

.

.

.

.

.

.

ngx_lua  
I/O  - Node.js

 1 7 15 30 60
125 250 500 1000

 QPS(1/s) 1 6
14 25 48 107 218 366 492

99%  (ms) 1222 1133 1060 1194 1256 1162 1142 1364 2030

.

.

.

.

.

.

ngx_lua  
I/O  - HipHop

 1 7 15 30 60
125 250 500 1000

 QPS(1/s) 0.95 3.98 3.57 3.65 3.83 3.98 3.65 3.41 3.74

99%  (ms) 1061 1760 4203 8208
15672 31433 68496 146515 267069

.

.

.

.

.

.

ngx_lua  
I/O 

.

.

.

.

.

.

ngx_lua  
ngx_lua 
  I/O  CPU  Nginx  Nginx 
 Lua  PHPRuby  

.

.

.

.

.

.

ngx_lua  
ngx_lua 
1  I/O  CPU   HTTP REST 
2  Nginx  Web 

.

.

.

.

.

.

ngx_lua  

http://wiki.nginx.org/HttpLuaModuleZh http://wiki.nginx.org/HttpLuaModule https://github.com/chaoslawful/lua-nginx-module https://github.com/agentzh/lua-resty-redis https://github.com/agentzh/lua-resty-mysql https://github.com/agentzh/lua-resty-memcached

.

.

.

.

.

.

ngx_lua  
That's all
Thanks! Q&A

.

.

.

.

.

.

