12711

Node
Node.js By @ ADC
1


2
12711


· CNode
2
12711


· CNode ·  at SAP for Mobile Web
2
12711


· CNode ·  at SAP for Mobile Web ·  at 
2
12711



· CNode

IE6 

·  at SAP for Mobile Web

·  at 

2
12711


3
12711


· Node
3
12711


· Node · 
3
12711


· Node ·  · Node.js
·  ·  · Buffer
3
12711


· Node ·  · Node.js
·  ·  · Buffer
· Node.js
3
12711


4
12711


4
12711


4
12711


4
12711


4
12711



4
12711


icons powered by morcha design

4
12711

Node
5
12711

Node
6
12711

Node
6
12711

Node
6
12711

HTML5Node.js
7
12711

HTML5Node.js
· JavaScript/
7
12711

HTML5Node.js
· JavaScript/ · API
7
12711

HTML5Node.js
· JavaScript/ · API · Ajax/
7
12711

HTML5Node.js
· JavaScript/ · API · Ajax/ · HTML5Node
7
12711

 & 
8
12711

 & 
· HTTP
8
12711

 & 
· HTTP
· Status code
8
12711

 & 
· HTTP
· Status code · Cookie & Session
8
12711

 & 
· HTTP
· Status code · Cookie & Session · Request & Response
8
12711

 & 
· HTTP
· Status code · Cookie & Session · Request & Response · Web Framework
8
12711

 & 
· HTTP
· Status code · Cookie & Session · Request & Response · Web Framework
· JavaScript
8
12711

 & 
· HTTP
· Status code · Cookie & Session · Request & Response · Web Framework
· JavaScript · 
8
12711

Go, go, go!!!
9
12711

Go, go, go!!!
9
12711

Go, go, go!!!
9
12711

Go, go, go!!!
var http = require('http'); http.createServer(function (req, res) {
res.writeHead(200, {'Content-Type': 'text/plain'}); res.end('Hello World\n'); }).listen(1337, '127.0.0.1'); console.log('Server running at http://127.0.0.1:1337/');
9
12711

Go, go, go!!!
9
12711

Go, go, go!!!
% node example.js Server running at http://127.0.0.1:1337/
9
12711


10
12711


10
12711


10
12711

JavaScript
11
12711

JavaScript
11
12711

JavaScript
11
12711

JavaScript
11
12711

JavaScript
Connect
11
12711

JavaScript
Connect
11
12711

JavaScript
Connect
Redis & MRedis
11
12711

JavaScript
Connect
Redis & MRedis
11
12711

JavaScript
Connect
Redis & MRedis MongoSkin
11
12711

JavaScript
Connect
ITier Redis & MRedis
MongoSkin
11
12711

JavaScript
Connect
ITier Redis & MRedis
MongoSkin
11
12711

JavaScript
Connect

Redis & MRedis MongoSkin
11
12711

ITier Should

JavaScript
Connect

Redis & MRedis MongoSkin
11
12711

ITier Should

JavaScript
Connect

WebGhost Redis & MRedis
MongoSkin
11
12711

ITier Should

Web
12
12711

Web

12
12711

Web


12
12711

Web


10
12
12711

Web

10
12
12711


· 
13
12711


· 
$.get("template", function (template) { // something $.get("data", function (data) { // something $.get("l10n", function (l10n) { // something render(template, data); }); });
});
13
12711


· 
13
12711


var proxy = new EventProxy();
·p$r.goexty(."atlel(m"tpelmatpel"a,tfeu"n, c"tdiaotna"(,t"elm10pnla",tere) n{der); // something proxy.trigger("template", template); }); $.get("data", function (data) {
// something proxy.trigger("data", data); }); $.get("l10n", function (l10n) { // something proxy.trigger("l10n", l10n); });
13
12711


· 
14
12711


var proxy = new EventProxy(); var status = "ready"; var _getFile = function (callback) {
·  proxy.once("template", callback);
if (status === "ready") { fs.readFile("views/index.html", function (err, file) { status = "pending"; proxy.fire("template", err, file); });
} };
var _template; var getTemplate = function (callback) {
if (_template) { callback(null, _template);
} else { _getFile(function (err, file) { if (!err && !_template) { _template = file.toString(); } callback(null, _template); });
} };
14
12711


· 
14
12711


· 
var view = fs.readFileSync("../views/index.html", "utf8");
14
12711


· 
var view = fs.readFileSync("../views/index.html", "utf8");
 + 
14
12711


15
12711


var map = {}; var get = function (key) {
return map[key]; }; var set = function (key, value) {
map[key] = value; }; //  if (!get(key)) {
//  set(key, value); }
15
12711


15
12711


var LimitableMap = require('limitablemap'); var map = new LimitableMap(1000); map.set("key1", "key1"); map.get("key1");
15
12711

Session
16
12711

Session
· V8
16
12711

Session
· V8 · Session(Redis)
16
12711

Session
· V8 · Session(Redis) · session
16
12711

Session
· V8 · Session(Redis) · session · Redis
16
12711

Buffer
17
12711

Buffer
var data = ""; res.on('data', function (chunk) {
// chunkBuffer data += chunk;// toString }) .on("end", function () { //data });
17
12711

Buffer
17
12711

// 

var chunks = [];

var size = 0;
Buffer res.on('data', function (chunk) { chunks.push(chunk);

size += chunk.length;

});

res.on('end', function () {

var data = null;

switch(chunks.length) {

case 0: data = new Buffer(0);

break;

case 1: data = chunks[0];

break;

default:

data = new Buffer(size);

for (var i = 0, pos = 0, l = chunks.length; i < l; i++) {

var chunk = chunks[i];

chunk.copy(data, pos);

pos += chunk.length;

}

break;

}

});

17

12711

Buffer
17
12711

Buffer
//  var bufferHelper = new BufferHelper(); req.on("data", function (chunk) {
bufferHelper.concat(chunk); }) .on('end', function () {
var html = bufferHelper.toBuffer().toString(); });
17
12711

String
18
12711

String
· 7k
18
12711

String
· 7k · String  Buffer
18
12711

String
· 7k · String  Buffer · Buffer4
18
12711

CPU
19
12711

CPU
· CPU
19
12711

CPU
· CPU · 
19
12711

CPU
· CPU ·  · Web Worker: child_process
19
12711

CPU
· CPU ·  · Web Worker: child_process · 
19
12711

CPU var cluster = require('node-cluster');
·vmaarsmtear.srteegris=tenre(8w08c0lu,s'ateprp.M.jCsa')s;PteUr(); ·master.dispatch();

· Web Worker: child_process · 
19
12711

CPU var cluster = require('node-cluster');
·vmaarsmtear.srteegris=tenre(8w08c0lu,s'ateprp.M.jCsa')s;PteUr(); ·master.dispatch();

·var http = require('http');
var cluster =require('nWodee-cbluWsteor')r; ker: child_process
·var worker = new cluster.Worker();
var server = http.createServer(function (req, res) { // server
});

worker.ready(function (socket) {

server.emit('connection', socket);

});

19

12711

CPU var cluster = require('node-cluster');

·vmaarsmtear.srteegris=tenre(8w08c0lu,s'ateprp.M.jCsa')s;PteUr();

·master.dispatch(); 

 

·var
var

http = require('http');
cluster =require('nWodee-cbluWsteor')r; ker:

child_process

·var worker = new cluster.Worker();
var server = http.createServer(function (req, res) { // server
});

worker.ready(function (socket) {

server.emit('connection', socket);

});

19

12711


20
12711


· EventProxyJScex 
20
12711


· EventProxyJScex 
· Redis
20
12711


· EventProxyJScex 
· Redis · CPU
20
12711


· EventProxyJScex 
· Redis · CPU · CPU
20
12711


· EventProxyJScex 
· Redis · CPU · CPU · Node-Cluster
20
12711


21
12711


· 
21
12711


·  · 
21
12711



·  · 

// try catch //  async(function (err, data) {
if (err) { logger.error(err); return; // TODO
} // TODO });

21
12711


·  · 
21
12711


·  ·  · 
21
12711



·  ·  · 


CPU 
Load IO 

21
12711


·  ·  · 
21
12711


·  ·  ·  · 
21
12711


·  ·  ·  ·  · 
21
12711



·  ·  ·  ·  · 


Redis MRedis MongoDB MongoSkin 

21
12711


·  ·  ·  ·  · 
21
12711


22
12711


· 
22
12711


· 
· 
22
12711


· 
· 
22
12711


· 
· 
Should.js
22
12711



· 
· 
· 

Should.js

22
12711



· 
· 
· 

Should.js WebGhost

22
12711



· 
·  ·  · 

Should.js WebGhost

22
12711



· 
·  ·  · 

Should.js WebGhost

22
12711



· 
·  ·  · 
· 

Should.js WebGhost

22
12711

CommonJS & Node & NPM
23
12711

CommonJS & Node & NPM
CommonJS
23
12711

CommonJS & Node & NPM
CommonJS
23
12711

CommonJS & Node & NPM
CommonJS
23
12711

CommonJS & Node & NPM
CommonJS
23
12711

CommonJS & Node & NPM
CommonJS

12711

Node
23

CommonJS & Node & NPM
CommonJS

12711

Node
23

CommonJS & Node & NPM

CommonJS

NPM

12711

Node
23

CommonJS & Node & NPM

CommonJS

NPM

12711

Node
23


24
12711


· 
24
12711


·  · 
24
12711


·  ·  · 
24
12711


25
12711


NPM
25
12711


NPM
25
12711





NPM

25
12711



NPM



NPM

25
12711



NPM



NPM

25
12711



NPM



NPM

12711


25



NPM



NPM

12711


25



NPM



NPM


12711


25



NPM



NPM


12711


25



NPM



NPM


12711


25



NPM



NPM


12711


25





NPM



NPM


12711


25




26
12711


· 
26
12711


·  · 
26
12711


·  ·  · 
26
12711


·  ·  ·  · github
26
12711


·  ·  ·  · github · NPM
26
12711


·  ·  ·  · github · NPM · Node
26
12711

Q&A

27
12711

