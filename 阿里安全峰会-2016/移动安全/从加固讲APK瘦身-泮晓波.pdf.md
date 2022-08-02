APK
 // pxb1988@gmail.com

WHY

·  ·  ·  ·  ·  · KPI

·  · 

· 
­ 
· 
­  ­ HTML5


· HTML

APK

· ZIP deflate
­ jar cfM ­ zip -9 ­ 7z -tzip -mx9 ­ zipalign -z

372k 378k 369k 368k

· 7z · tar.XZ

292k 291k

Loader

classes.dex

resources.arsc

lib/armeabi

res/layout/

...

apk.7z

classes.dex resource.arsc lib/armeabi/lib7z.so
loader.apk

· 
­ --
· 
­ --
· 
­ dex

multi-dex
Ref:http://stackoverflow.com/questions/8210173/what-is-the-difference-between-class-and-dex-files

dex- 65535
public class App { public static void main(String args[]) { System.out.println("Hello World!"); }
}
public class App { static Method println = ... ; public static void main(String args[]) { println.invoke(System.out, "Hello World!"); }
}

access$0

class Outer { private int value; class Inner { void action() { value = 0xb0b; } } ...
}

class Outer { private int value; static void access$0(Outer o, int v) { o.value = v; }
} class Outer$Inner {
Outer this$0; void action() {
Outer.access$0(this$0, 0xb0b); } }

access$1

class Outer { private int value; class Inner { void action() { value = 0xb0b; } } ...
}

· 
­ private ­ 
· 
­ private -> public ­ 

access$2

· getter/setter · library
­ json/xml  ­ http ­ android-support

· Proguard
­ static ­ 
· Debug Info

·  · APP_ABI
­ armeabi ­ armeabi-v7a ­ Arm64-v8a ­ x86 ­ X86_64 ­ mips/mpis64

JNI
· APP_STL
­ system ­ stlport_static ­ c++_static ­ gnu_static ­ xxx_shared
· 
­ gcc/clang

· -fvisibility=hidden · -fno-exceptions · -fno-rtti · APP_OPTIM
­ release

JNI2



libA.so libB.so libC.so
library.7z

· System.load

DEX

("hello")

Resources

· xload ("hello")

xyz.apk

resource
· jpg/png -> webp · configuration
· resource.arsc
­ res/layout/abc.xml -> a.xml

conclusion

·  ·  · abi · webp · 
­  ­ 

· 
· 
· 
­ 

 
 pxb1988@gmail.com

