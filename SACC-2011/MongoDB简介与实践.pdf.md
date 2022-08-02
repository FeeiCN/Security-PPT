MongoDB
()
http://www.weibo.com/xiayuanfeng http://xiayuanfeng.iteye.com xiayuanfeng@gmail.com

SACC2011


·  · 
SACC2011


· NoSQL · NoSQL · MongoDB · Replication · Auto-Sharding · MongoDB

SACC2011

NoSQL
·  ·  ·  · 
SACC2011

NoSQL

· NoSQL · NoSQLSchema · JOIN() ·  ·  · (API)

SACC2011

NoSQL
· NoSQLSQL · NoSQL · 
SACC2011

NoSQL
NoSQL=Not Only SQL.  NoSQL 
SACC2011

NoSQL
·  · Key-value · /(Column Store/Column Families)
SACC2011

MongoDB
· (Document)

· C++

·  Windows Linux, Mac OS-X, FreeBSD, Solaris

· :
­ Ruby / Ruby-on-Rails ­ Java ­ C# ­ JavaScript ­ C / C++ ­ Erlang Python, Perl

SACC2011

MongoDB
·  ·  ·  · replicationsharding ·  10gen
SACC2011

MongoDB

·  ·  ·  · 

SACC2011

MongoDB
· (BSON) ·  ·  ·  · (in-place) · Replication · Auto-sharding · MapReduce
SACC2011

MongoDB
· Google it · Mail List · Google Groups · JIRA · http://stackoverflow.com/ ·  
xiayuanfeng@gmail.com

SACC2011

MongoDB
SACC2011

MongoDB

RDBMS Table, View Row(s) Index Join
Partition Partition Key

Mongo

Collection

JSON Document

Index

Embedded

Document

Shard

Shard Key

SACC2011

MongoDB Document
BSONLike JSON 
{ _id : ObjectId("4c4ba5c0672c685e5e8aabf3"), author : "nicholas", text : "MongoDB", tags : [ "", "MongoDB" ] }
}
SACC2011

MongoDB Collections
{"name":"nicholas",age:27} {"name":"lily",age:29} {"aaaa":"ddddddddddddddadfadf"} ???!!! what collection
Schema-Free ·  ·  · 
SACC2011

MongoDB Database
·admin  ·local 
SACC2011

MongoDB (1)
·JSON null(boolean)(numeric) (string)(array)(object)
·BSON=JSON+ ·(binary data) ·(array) {"comments":["",""]} ·(embedded document) {"stuff":{"name":nicholas,age:27}}
SACC2011

MongoDB (2)
· Object Id documentMongoDB
_idkey
· (String) stringUTF-8
· (date) MongoDB {"createDate":new Date()}
SACC2011

MongoDB 
1.  http://www.mongodb.org/downloads 2.  3. Linux /data/db or windows c:\data\db 4.  mongod.exe 
SACC2011

MongoDB 
· MongoDBA,B,C · A . 
 · B . 
  · C BUG
· 1.8.3
SACC2011

MongoDB Shell(1)

· Like mysql

· Javascript

· bin/mongo

· Javascript+v8OK

· use 

· show dbs;show collections · *.help()

SACC2011

MongoDB Shell(2)
SACC2011


· > var account={ · ... "email":"xiaxdx@163.com", · ... "age":27, · ... "blog_url":"http://blog.taobaokong.net", · ... "date":new Date() · ... }
· > db.account.insert(account);
SACC2011



· db.account.find({"email":"xiaxdx@163.com"})

·{

·

"_id" : ObjectId("4cc2f17506eff28f57851c26"),

·

"email" : "xiaxdx@163.com",

·

"age" : 30,

·

"blog_url" : "http://blog.taobaokong.net",

·

"date" : "Sat Oct 23 2010 22:24:21 GMT+0800

(CST)"

·}

SACC2011

-$
SACC2011

-$
SACC2011


db.account.update({"email":"xiaxdx@163.com"}, {
`$set':{`age':31} } )
SACC2011


db.account.remove({"email":"xiaxdx@163.com"});
SACC2011

ObjectId

4c4ba5c0672c685e5e8aabf3 ??!!! What hell!! 4c4ba5c0 timestamp 672c68 machine id 5e5e process id 8aabf3 counter  

SACC2011

BSON
SACC2011

(1)
· MySQL

· db.things.ensureIndex({j:1});

· db.things.ensureIndex({"address.city": 1})

· Embedded document db.factories.insert( { name: "xyz", metro: { city:
"New York", state: "NY" } } );db.factories.ensureIndex( { metro : 1 } );

·  !

SACC2011

(2)
·  db.things.ensureIndex({j:1, name:-1});
· Covered Index db.foo.ensureIndex({"x" : 1, "y" : 1, "z" : 1}) > db.foo.find({"x" : criteria, "y" : criteria},
... {"x" : 1, "y" : 1, "z" : 1, "_id" : 0})
  
SACC2011

MapReduce-
· { username: "jones", likes: 20, text: "Hello world!" }
· function() ·{ · emit( this.username, {count: 1, likes: this.likes} ); ·}
· function(key, values) ·{ · var result = {count: 0, likes: 0};
values.forEach(function(value) { result.count += value.count; result.likes += value.likes; }); return result; }
SACC2011

MapReduce-
· Map: key ->value  value 
· Reduce:function reduce(key_obj, [value_obj, value_obj, ...])[value1,value2,value3] map
· function finalize(key, value) -> final_value ­ 
· MapvalueReducevalue
SACC2011

MapReduce-
SACC2011

MapReduce-Map
SACC2011

MapReduce-Reduce
SACC2011

MapReduce-Finalize
SACC2011

MapReduce-Result
SACC2011

GridFS(1)
SACC2011

GridFS(2)
SACC2011

GridFS(3)
· GridFS · GridFS
 ·  · MD5
SACC2011

Replication
·  ­  ­ 
· 
·  ­  ­ 
SACC2011

MongoDB Replication
· Master-Slave () ­Master mongod -- master ­Slave mongod -- source <master url>:<master port> ­ -- slavedelay <seconds> 
· Replica Sets WOW ­  ­ 
M/S
SACC2011

Oplog
·  ·  · Oplog timestamp  · Oplog
SACC2011

Replica Sets
· Master->Primary · Slave->Secondary · /-/ · 
SACC2011

Replica Sets
· mongod --replSet foo --port 27017 --dbpath /data/db1 mongod --replSet foo --port 27018 --dbpath /data/db2 mongod --replSet foo --port 27019 --dbpath /data/db3
· mongo localhost:27017 · > rs.initiate() · > rs.add("localhost:27018") · > rs.add("localhost:27019")
SACC2011

Replica Sets
· rs.status() · rs.stepDown() · db.isMaster()
SACC2011

Replica Sets
SACC2011


·  10W-100W 100 
· CPU I/O
SACC2011

Linux 
1. swap 2.  3. LRU
SACC2011

I/O
· -

· 

SACC2011


·  
· I/O 
SACC2011

Replication??

·

Replication

SACC2011

Sharding

· MongoDBcollection



· 

­ Mongod

MongoDB

mongos

· 

­Replica set

· 

­ 

MongoDB



SACC2011

Sharding
SACC2011

Sharding
SACC2011

Shard Key
· shard keychunk · shard key chunk
 · shard key
­ +
SACC2011

Sharding-Config
· Config Server ­$ ssh ny-01 ny-01$ mongod $ ssh sf-01 sf-01$ mongod $ ssh moon-01 moon-01$ mongod
SACC2011

Sharding- mongos
· mongos ­$ ssh ny-02 ­ny-02$ mongos --configdb ny-01,sf-01,moon-01
SACC2011

Sharding- shards
· Shards ­$ mongo ny-02:27017/admin MongoDB shell version: 1.7.5 connecting to: admin >
> db.runCommand({"addShard" : "sf-02:27017"}) { "shardAdded" : "shard0000", "ok" : 1 }
SACC2011

Sharding- 
blogcollection blog databaseshard
> db.adminCommand({"enableSharding" : "blog"}) { "ok" : 1 }
shard key {"date" : 1, "author" : 1}. > db.adminCommand({"shardCollection" : "blog.posts",
key : {"date" : 1, "author" : 1}} { "collectionSharded" : "blog.posts", "ok" : 1 }
SACC2011

Sharding- 
 db.getMongo().setSlaveOk() Counting  shard key  shard-key
SACC2011

Sharding+Replica Set
SACC2011

MongoDB

DB Profiler (MySQL Slow logs) >use blog >db.setProfilingLevel(1,500) > db.system.profile.find({millis:{$gt:10}}).sort({millis:-1})

 >db.posts.ensureIndex({author:1},{background:true})



 

SACC2011

MongoDB



>collection.insert({"_id" : 123, /* other fields */, "garbage" : someLongString})
>collection.update({"_id" : 123}, {"$unset" : {"garbage" : 1}})

    Schema  

SACC2011

MongoDB
replica set 

  SSD

document

AND- 

SACC2011

MongoDB
SACC2011

db.addUser (username, password) db.removeUser(username)
MongoDB
db.addUser (username, password) db.removeUser(username)

db.currentOp() db.killOp()

db.foo.stats() db.foo.dataSize() db.foo.storageSize() db.foo.totalIndexSize() db.foo.totalSize()

SACC2011


SACC2011


SACC2011

SACC2011


http://www.mongodb.org/display/DOCS/Pro duction+Deployments
SACC2011


·  ·  ·  · 

SACC2011

SACC2011


SACC2011


SACC2011

