Android 
dac519c3b5927f2762a2fa6a94b630f44ad9d11f

# About Me
Image from: http://www.usmile.at/sites/default/files/publications/201306_obf_report_0.pdf

 Bob Pan
dex2jar

 
 

pxb1988@gmail.com

# VS


·  · 



·  ·  · // · 


, !

# 
· ProGuard · DexGuard
Ref: http://www.saikoa.com/comparison-proguard-and-dexguard

# 
·  ·  ·  · 
:  

:  

# :

·  oooooooooooooo...
·  Oo0o0OO00oooOOo0oo ijijijjiiiJiIIjii
· __$$_$$$$__$$_ · java
int int = 5;

· Unicode · ava \u0237 · CJK · 
·  2800-28FF

# : ?

· 'abc'

· Proguard !

-dontshrink -dontoptimize -dontusemixedcaseclassnames -keepattributes *Annotation*
#  -keep public class * extends Activity/Application/... ... #keep,  -dontwarn **
-printmapping mapping0.txt

-injars obad-dex2jar.jar -outjars aaa.jar -libraryjars android.jar

# :
 

# :abc ?
· , 
·  JEB
·  Proguard

# : Proguard

1. mapping

Proguard

-dontshrink -dontoptimize -injars aaa.jar -libraryjars android.jar
-keep class *
-printmapping mapping1.txt

Mapping

com.android.system.admin.x -> com.android.system.admin.x: java.lang.String a -> a java.lang.String d -> d int e -> e ...

# : Proguard

2. mapping, Proguard

Mapping

com.android.system.admin.x -> ...ObadSQLiteOpenHelper: android.database.sqlite.SQLiteDatabase f -> database byte[] g -> encoded_data_array java.lang.String a(int,int,int) -> decrypt

Proguard

-dontshrink -dontoptimize -injars aaa.jar -outjars bbb.jar -libraryjars android.jar
-applymapping mapping1.txt

# Proguard

# ()





a  Clz_a b  fld_b c  mtd_c d  Clz_d_List



Source Enum ACC_BRIDGE Getter/setter

SDK 
 toString
 + 


# 
·  · DexGuard
· String a(int, int, int)
· Other
· String a(String)
: 

Class.forName(a(130, 1, -10)) .getMethod(a(53, 19, -21), Class.forName(a(79, 1, -11))) .invoke(j, instance);
:  

# :
· Java bytecode LDC · LDC

System.out.println("hello world!");
getstatic System.out LDC "hello world!" invokevirtual println(String)

getstatic System.out sipush 130 sipush 1 sipush -10 invokestatic a(int,int,int) invokevirtual println(String)

# :

'==' 

void fa(){ fb("1.0");
} void fb(String version) {
if(version == "1.0"){ print("yes!");
} }

void fa(){ fb(new String(...));
} void fb(String version) {
if(version == new String(...)){ print("yes!");
} }

, yes
: 'equals' 

, 

# : ?

private static String decrypt(int n, int n2, int n3) { ...
}
String a = decrypt(-20, 842, -576);

·  · String ·  · 

: , , .

# 



:t.q(...)

# 
· API
String c = "abc".substring(2,3);

String c = (String)Class.forName("java.lang.String") .getMethod("substring", int.class, int.class) .invoke("abc", 2, 3)

: 

:  

# : 
Local Stack

String c = "abc".substring(2,3);

"abc" "abc", 2 "abc", 2, 3

Opcode ldc "abc" sipush 2 sipush 3 invokevirtual substring(II)

:

1.StackLocal 2.Class 3.Method 4.LocalStack 5.invoke

# : 

Local "abc", 2, 3 "abc", 2, 3

Stack
"abc", 2, 3
String.class

Opcode
astore 1, istore 2, istore 3
ldc "java.lang.String" invokestatic Class.forName
ldc "substring", ... # invokevirtual Class.getMethod

"abc", 2, 3 "abc", 2, 3

substring

aload 1, iload 2, iload 3,

substring, "abc", [2, 3] invokevirtual Method.invoke()



String a="abc"; int b=2; int c=3; String c = (String)Class.forName("java.lang.String")
.getMethod("substring", int.class, int.class) .invoke(a, b, c)

# :?
· 1. Class.forNameclass
String c = (String)Class.forName("java.lang.String") .getMethod("substring", int.class, int.class) .invoke("abc", 2, 3)
String c = (String)String.class .getMethod("substring", int.class, int.class) .invoke("abc", 2, 3)

# :?
· 2. getMethod

String c = (String)String.class .getMethod("substring", int.class, int.class) .invoke("abc", 2, 3)

String c = (String) [String.substring(II)] .invoke("abc", 2, 3)

Method

# :?
· 3. invoke
String c = (String) [String.substring(II)] .invoke("abc", 2, 3)
String c = (String) "abc".substring(2,3)

# 
:
:

# 
· android

· 

-assumenosideeffects class android.util.Log {
public static *** d(...); public static *** w(...); public static *** v(...); public static *** i(...); }

Ref: http://stackoverflow.com/questions/5553146/disable-logcat-output-completely-in-release-android-app/5553290#5553290

# : Proguard
: Log.d("tag", "version is " + version );
: new StringBuilder("version is: ").append(n);
:
"version is" + version  new StringBuilder("version is ").append(version).toString(). ProguardLog.d, StringBuilder
Ref: http://stackoverflow.com/questions/22713166/removing-log-calls-with-proguard-leaves-behind-stringbuilders

# Asset
· apkasset, 

: 
Ref: http://www.android-decompiler.com/blog/2013/04/07/dexguards-assets-encryption/

: AssetManager.open() 

# Asset: 
· open 



InputStream is = this.getAssets().open(); Cipher cipher = Cipher.getInstance("AES/CFB/NoPadding"); cipher.init(DECRYPT_MODE, /* key */); return new CipherInputStream(is, cipher).available();

# AndroidManifest
· namespacename
:
AndroidManifestResourceIdnamespace/name. AndroidResourceIdxml. namespace/name, .

# AndroidManifest
· ResourceIdnamesapce/name · Apktool · axml

# 
   
 Assert XML

  X +    

 X X 
  

 999999999 X 5
4 2 1

# 
· -keep
· SDK · JNI ·  · /

· 
· SourceFile · 
·  ·  · jaq.taobao.com

Q & A
pxb1988@gmail.com

