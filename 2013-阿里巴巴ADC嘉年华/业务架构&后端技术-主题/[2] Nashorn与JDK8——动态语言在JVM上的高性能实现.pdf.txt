Nashorn on JDK 8
@RednaxelaFX


·  · OracleJava
 · http://rednaxelafx.iteye.com/ · @RednaxelaFX

Nashorn

Nashorn

Nashorn

Nashorn
http://www.battletanks.com/images/Nashorn-1.jpg

Nashorn
· OracleECMAScript 5.1 · Java · 100% Java · OpenJDK / JEP 174 · GPLv2 · JDKJDK8
· Rhino

Nashorn
· Rhino ·  · 

JavaJavaScript
· Java · GC · JIT ·  · 

JavaJavaScript
· JavaScriptJava · Java · number -> java.lang.Double (*) · string -> java.lang.String · boolean -> java.lang.Boolean · Date -> java.util.Date (*) · RegExp -> java.util.regex.Pattern (*) · null -> null · undefined -> ? (Undefined)

JavaJavaScript
http://img.xgo-img.com.cn/9_500x375/8144.jpg

JavaJavaScript
http://cdn2.carsdata.net/pics/Hyundai/hyundai-coupe-fx-05.jpg

JavaJavaScript
http://encarsglobe.com/photo/md/ferrari-430/04/

Nashorn
·  · JavaScriptJava ·  · lazy compilation

Nashorn

JavaScript
  
AST

 
lowering 
 (*)   

* 

Java

Nashorn
function Point(x, y) { this.x = x; this.y = y;
}
var p = new Point(2013, 42);

map

__proto__

context

...

flags

0

spill

null

arrayData

L0

x

L1

y

L2

L3

Key

Getter

"x"

x getter

"y"

y getter

map __proto__
...

Setter x setter y setter

EMPTY_ARRAY
2013 42

Nashorn
function Point(x, y) { this.x = x; this.y = y;
}
var p = new Point(1, 2); p.z = 3; p.a = 4; p.b = 5; p[0] = 6; p[1] = 7;

map

__proto__

context

...

flags

0

spill

arrayData

L0

x

L1

y

L2

z

L3

a

Key "x" "y" "z" "a" "b"
map __proto__
...
b
0 1

Getter x getter y getter z getter a getter b getter
6 7 1 2 3 4

Setter x setter y setter z setter a setter b setter
5

Nashorn
·  · jjs / jrunscript
· Java · APIJSR 223javax.script
· shebang script

Node.jar
· JavaJavaScript ·  · 
· Node.js · Nashorn · Grizzly · JavaAPI


· Nashorn, Jim Laskey, JVM Language Summit 2011
· CON5390 - Nashorn: Optimizing JavaScript and Dynamic Language Execution on the JVM, JavaOne 2012
· BOF6661 - Nashorn, Node, and Java Persistence, JavaOne 2012

JavaScript
· HLLVM · http://hllvm.group.iteye.com/group/topic/
37596



