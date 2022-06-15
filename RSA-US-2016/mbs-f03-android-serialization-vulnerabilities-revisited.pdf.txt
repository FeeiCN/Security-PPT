SESSION ID: MBS-F03
Android Serialization Vulnerabilities Revisited
#RSAC

Roee Hay
X-Force Application Security Team Lead IBM Security @roeehay
Joint work with Or Peles

#RSAC
We will see how this Android SDK class

public class OpenSSLX509Certificate extends X509Certificate {

private ...

final long mContext;

}

MISSING MODIFIER BEFORE OUR DISCLOSURE!
(NOW PATCHED)

2

#RSAC
Led to malware capable of this...

REPLACEMENT OF APPS

SELINUX
BYPASS

ACCESS TO APPS' DATA
3

KERNEL CODE EXEC
(on select devices)

#RSAC
Introduction
4

Serialization
SENDER
class foo {
int bar; = 1234 String baz; = "hi" long *qux; = 0x1f334233 }

MEDIA

5

#RSAC
RECIPIENT

Serialization

SENDER
class foo {
int bar; = 1234 String baz; = "hi" long *qux; = 0x1f334233 }

Serialize

MEDIA
001010...0110

6

#RSAC
RECIPIENT

#RSAC
Serialization

SENDER
class foo {
int bar; = 1234 String baz; = "hi" long *qux; = 0x1f334233 }

RECIPIENT
class foo {
int bar; = 1234 String baz; = "hi" long *qux; = 0x14d3e2c3 }

Serialize

MEDIA
001010...0110

Deserialize

7

#RSAC
Vulnerability Root Cause
DESERIALIZATION OF UNTRUSTED DATA
ObjectInputStream ois = new ObjectInputStream(insecureSource);
Foo t = (Foo)ois.readObject();
8

Vulnerability Root Cause
ATTACKER
class dangerous {
... }

#RSAC
VICTIM
class dangerous {
... }

Serialize

MEDIA
001010...0110
9

Deserialize

Example of a vulnerability
ATTACKER
class dangerous {
int *ptr; }

#RSAC
VICTIM
class dangerous {
int *ptr; }

Serialize

MEDIA
001010...0110
10

Deserialize

Example of a vulnerability
ATTACKER
class dangerous {
int *ptr; = 0x66666666 }

#RSAC
VICTIM
class dangerous {
int *ptr; = 0x66666666 }

Serialize

MEDIA
001010...0110
11

Deserialize

Vulnerability Root Cause

#RSAC
RECIPIENT CODE

ObjectInputStream ois = new ObjectInputStream(insecureSource);
dangerous t = (dangerous)ois.readObject();
callNative(t.ptr)

12

#RSAC
History of Serialization Vulnerabilities

2009 2011 2012 2013
2014 2015

- Shocking News in PHP Exploitation - Spring Framework Serialization-based remoting vulnerabilities - AtomicReferenceArray type confusion vulnerability - Apache Commons FileUpload Deserialization Vulnerability - Ruby on Rails YAML Deserialization Code Execution - Android <5.0 Privilege Escalation using ObjectInputStream - Android OpenSSLX509Certificate Deserialization Vulnerability - Apache Groovy Deserialization of Untrusted Data - Apache Commons Collections Unsafe Classes

13

#RSAC
History of Serialization Vulnerabilities

2009 2011 2012 2013
2014 2015

- Shocking News in PHP Exploitation - Spring Framework Serialization-based remoting vulnerabilities - AtomicReferenceArray type confusion vulnerability - Apache Commons FileUpload Deserialization Vulnerability - Ruby on Rails YAML Deserialization Code Execution - Android <5.0 Privilege Escalation using ObjectInputStream - Android OpenSSLX509Certificate Deserialization Vulnerability - Apache Groovy Deserialization of Untrusted Data - Apache Commons Collections Unsafe Classes

14

#RSAC
Android Inter-App Communication

#RSAC
Android Inter-App Communication 101
Intent { play:// ...}
Intent { sms:// ...}

#RSAC
An Intent can also contain

Bundle
Strings

Primitives

Arrays

#RSAC
An Intent can also contain

Bundle
Strings

Primitives

Arrays

Serializable Objects

#RSAC
Motivation
19

#RSAC
Previous work
CVE-2014-7911 (Jann Horn):
Non-Serializable Classes can be Deserialized on target.

#RSAC
Exploiting CVE-2014-7911
Step 1. Find an interesting target.
MALWARE
TARGET
21

#RSAC
The Target
SYSTEM_SERVER
22

#RSAC
Exploiting CVE-2014-7911
Step 2. Send target a `serialized' object in a Bundle

MALWARE

Serialized Object of
non-Serializable class
SYSTEM_SERVER

23

#RSAC
The Serialized Object
final class BinderProxy implements IBinder {
private long mOrgue;  POINTER
...
private native final destroy();
@Override protected void finalize() throws Throwable {
try { destroy(); } finally { super.finalize(); }
}
24

#RSAC
Android Apps are not just Java...
App
Java
Native (C/C++)
25

#RSAC
Android Apps are not just Java...
App
Java
JNI
Native (C/C++)
26

#RSAC
Pointers may pass back and forth

App

pointers JNI

Java Native (C/C++)

27

#RSAC
Pointers may pass back and forth

App

JNI pointers

Java Native (C/C++)

28

#RSAC
The Serialized Object
final class BinderProxy implements IBinder {
private long mOrgue;  POINTER
...
private native final destroy();
@Override protected void finalize() throws Throwable {
try { destroy(); } finally { super.finalize(); }
}
29

#RSAC
Exploiting CVE-2014-7911
Step 3. Make it deserialize on the target
MALWARE
SYSTEM_SERVER Deserialized object
30

#RSAC
Make it deserialize automatically

All Bundle members are deserialized with a single `touch' without type checking before deserialization

e.g.

public String getString(String key) }
unparcel();  DESERIALIZES ALL final Object o = mMap.get(key); try { return (String) o; } catch (ClassCastException e)
{typeWarning...} }

31

#RSAC
Exploiting CVE-2014-7911
Step 4. Make one of its methods execute on target.
MALWARE
SYSTEM_SERVER Executed Method
of object
32

#RSAC
The Serialized Object

final class BinderProxy implements IBinder {

private long mOrgue;
...
private native final destroy();

@Override

protected void finalize() throws Throwable

{

try { destroy(); }

 EXECUTED

finally { super.finalize(); }

AUTOMATICALLY

}

BY THE GC

33

#RSAC
A Word about Garbage Collection
App's Memory

Object A
(root)

Object C

Object B
34

#RSAC
A Word about Garbage Collection
App's Memory

Object A
(root)

Object C

Object B
35

#RSAC
A Word about Garbage Collection
App's Memory Object A
(root)
Object B
36

#RSAC
The Serialized Object

final class BinderProxy implements IBinder {

private long mOrgue;
...
private native final destroy();

@Override

protected void finalize() throws Throwable

{

try { destroy(); }

 EXECUTED

finally { super.finalize(); }

AUTOMATICALLY

}

BY THE GC

37

#RSAC
The Serialized Object

final class BinderProxy implements IBinder {

private long mOrgue;
...
private native final destroy();  NATIVE METHOD

@Override

THAT USES THE PTR

protected void finalize() throws Throwable

{

try { destroy(); }

finally { super.finalize(); }

}

38

#RSAC
Google's Patch for CVE-2014-7911
Do not Deserialize Non-Serializable
Classes
39

#RSAC
Our 1st contribution: The Android Vulnerability
CVE-2015-3825/37
40

#RSAC
Our Research Question

Class Foo implements Serializable {

private long mObject; ...

CONTROLLABLE POINTER

private native final destroy();

POINTER USED IN

NATIVE CODE.

@Override

protected void finalize() throws Throwable

{

try { destroy(); }

EXECUTED

finally { super.finalize();

AUTOMATICALLY BY

}

THE GC

}

41

#RSAC
Experiment 1
42

#RSAC
Experiment 1
boot.art
43

#RSAC
Experiment 1
boot.art
~13K Loadable Java Classes
44

#RSAC
Experiment 1

boot.art

App: Loaded classes using
Reflection

~13K Loadable Java Classes
45

#RSAC
Experiment 1

boot.art

App: Loaded classes using
Reflection

~13K Loadable Java Classes
46

Dumped classes: 1. Serializable 2. Finalize method 3. Controllable fields

#RSAC
The Result
OpenSSLX509Certificate
47

#RSAC
The Result
public class OpenSSLX509Certificate
extends X509Certificate { private final long mContext; @Override protected void finalize() throws Throwable { ... NativeCrypto.X509_free(mContext); ... }
}
48

#RSAC
The Result

public class OpenSSLX509Certificate

extends X509Certificate {

(1) SERIALIZABLE

private final long mContext;

@Override protected void finalize() throws Throwable { ...

NativeCrypto.X509_free(mContext); ...

} }

49

#RSAC
The Result

public class OpenSSLX509Certificate

extends X509Certificate {

(1) SERIALIZABLE

private final long mContext;

(2) CONTROLLABLE

@Override protected void finalize() throws Throwable { ...

POINTER

NativeCrypto.X509_free(mContext); ...

} }

50

#RSAC
The Result

public class OpenSSLX509Certificate

extends X509Certificate {

(1) SERIALIZABLE

private final long mContext;

(2) CONTROLLABLE

@Override protected void finalize() throws Throwable { ...

POINTER

NativeCrypto.X509_free(mContext); ... } }

(3) EXECUTED AUTOMATICALLY BY THE GC

51

#RSAC
Arbitrary Decrement

NativeCrypto.X509_free(mContext)

X509_free(x509); // x509 = mContext

ASN1_item_free(x509, ...)

asn1_item_combine_free(&val, ...)

// val = *pval = mContext

if (asn1_do_lock(pval, -1,...) > 0) return;

// Decreases a reference counter (mContext+) // MUST be POSITIVE INTEGER (MSB=)

52

#RSAC
Arbitrary Decrement
ref = mContext+0x10 if (*ref > 0)
*ref-else
free(...)
53

#RSAC
Proof-of-Concept Exploit
Arbitrary Code Execution in system_server
54

Exploit Outline
MALWARE
55

#RSAC
Malicious Serialized Object(s) w/ payload
buffer
SYSTEM_SERVER

#RSAC
Exploit Outline
MALWARE
SYSTEM_SERVER shellcode
56

#RSAC
First Step of the Exploit
Own the Program Counter (PC)
57

#RSAC
Own the Program Counter
1. Override some offset / function ptr 2. Get it called.
58

#RSAC
Creating an Arbitrary Code Exec Exploit
ARSENAL
1. Arbitrary Decrement 2. Controlled Buffer
59

#RSAC
Constrained Arbitrary Memory Overwrite

Bundle
OpenSSLX509Certificate
mContext=011111100

 011111110 -= 1

60

#RSAC
Constrained Arbitrary Memory Overwrite

Bundle
OpenSSLX509Certificate
mContext=011111100
OpenSSLX509Certificate
mContext=011111100

 011111110 -= 2

61

#RSAC
Constrained Arbitrary Memory Overwrite

Bundle
OpenSSLX509Certificate
mContext=011111100
OpenSSLX509Certificate
mContext=011111100

OpenSSLX509Certificate
mContext=011111100
62

 011111110 -= 

#RSAC
Constrained Arbitrary Memory Overwrite

Bundle
OpenSSLX509Certificate
mContext=011111100
OpenSSLX509Certificate
mContext=011111100

OpenSSLX509Certificate
mContext=011111100
63

 011111110 -= 
and If we knew the original value:
Arbitrary Overwrite

#RSAC
Creating an Arbitrary Code Exec Exploit
ARSENAL
1. Arbitrary Decrement 2. Controlled Buffer 3. Arbitrary Overwrite
(if we knew the original value)
64

#RSAC
Creating an Arbitrary Code Exec Exploit

ARSENAL
1. Arbitrary Decrement 2. Controlled Buffer 3. Arbitrary Overwrite
(if we knew the original value)

DEFENSES
1. ASLR 2. RELRO 3. NX pages 4. SELinux

65

#RSAC
Finding the original value: observation

system_server

root@generic:/# cat /proc/<system_server>/maps

70e40000-72cee000 r--p ... 72cee000-74400000 r-xp ... 74400000-74401000 rw-p ... ... aa09f000-aa0c3000 r-xp ... aa0c3000-aa0c4000 r--p ... aa0c4000-aa0c5000 rw-p ... ... b6645000-b66d5000 r-xp ... b66d6000-b66e1000 r--p ... b66e1000-b66e2000 rw-p ...

boot.oat boot.oat boot.oat
libjavacrypto.so libjavacrypto.so libjavacrypto.so
libcrypto.so libcrypto.so libcrypto.so

malware

root@generic:/# cat /proc/<malware>/maps

70e40000-72cee000 r--p ... 72cee000-74400000 r-xp ... 74400000-74401000 rw-p ... ... aa09f000-aa0c3000 r-xp ... aa0c3000-aa0c4000 r--p ... aa0c4000-aa0c5000 rw-p ... ... b6645000-b66d5000 r-xp ... b66d6000-b66e1000 r--p ... b66e1000-b66e2000 rw-p ...

boot.oat boot.oat boot.oat
libjavacrypto.so libjavacrypto.so libjavacrypto.so
libcrypto.so libcrypto.so libcrypto.so

#RSAC
Zygote app creation model

Zygote

fork() system_server

fork()
App_1

fork()
malware

fork without execve fork()

= no ASLR!

App_N

#RSAC
Determining the value

Zygote
<libXYZ> value

fork()

system_server
<libXYZ> value

fork()

malware <libXYZ> value

#RSAC
Creating an Arbitrary Code Exec Exploit

ARSENAL
1. Arbitrary Decrement 2. Controlled Buffer 3. Arbitrary Overwrite
(if we knew the original value)

DEFENSES
1. ASLR 2. RELRO 3. NX pages 4. SELinux

69

#RSAC
Using the Arbitrary Overwrite
Goal.
Overwite some pointer
Problem.
.got is read only (RELRO)
70

#RSAC
A Good Memory Overwrite Target
A function pointer under .data
id_callback in libcrypto
Called during deserialization of:
OpenSSLECPrivateKey
71

Triggering id_callback remotely

Bundle

Malware

OpenSSLECPrivateKey
BAD DATA that leads to the right path

#RSAC
system_server

72

#RSAC
First Step Accomplished
We now own the Program Counter
73

#RSAC
Creating an Arbitrary Code Exec Exploit

ARSENAL
1. Arbitrary Decrement 2. Controlled Buffer 3. Arbitrary Overwrite
(if we knew the original value)

DEFENSES
1. ASLR 2. RELRO 3. NX pages 4. SELinux

74

#RSAC
Next Steps of the PoC Exploit (simplified)
system_server
pc  r-x code sp  rw- stack
rw- ROP chain rw- shellcode
75

#RSAC
Problem 1: SP does not point at ROP chain
system_server
pc  r-x code sp  rw- stack
rw- ROP chain rw- shellcode
76

#RSAC
Solution: Stack Pivoting

Our buffer happens to be pointed by fp. The Gadget: mov sp, fp; ..., pop {...}
Gadget:
Stack Pivot

system_server
pc  r-x code/pivot sp  rw- stack fp  rw- ROP chain
rw- shellcode

77

#RSAC
Solution: Stack Pivoting

Our buffer happens to be pointed by fp. The Gadget: mov sp, fp; ..., pop {...}
Gadget:
Stack Pivot

system_server
pc  r-x code/pivot rw- stack
sp  rw- ROP chain rw- shellcode

78

Allocating RWX Memory
Gadget:
Stack Pivot
Gadget:
mmap/RWX
79

#RSAC
system_server
pc  r-x code/mmap sp  rw- stack fp  rw- ROP chain
rw- shellcode

#RSAC
Problem 2: SELinux should prohibit mmap/RWX

Gadget:
Stack Pivot
Gadget:
mmap/RWX

system_server
pc  r-x code/mmap sp  rw- stack fp  rw- ROP chain
rw- shellcode

80

#RSAC
Solution: Weak SELinux Policy for system_server

Gadget:
Stack Pivot
Gadget:
mmap/RWX

system_server
pc  r-x code/mmap sp  rw- stack fp  rw- ROP chain
rw- shellcode

81

#RSAC
Solution: Weak SELinux Policy for system_server

system_server

Gadget:

pc  r-x code/mmap

alStlacok Pwivotsystem_server self:prsopcesrws- setaxcek cmem

fp  rw- ROP chain

Gadget:

rw- shellcode

mmap/RWX

82

Allocating RWX Memory
Gadget:
Stack Pivot
Gadget:
mmap/RWX
83

#RSAC
system_server
pc  r-x code/mmap rw- stack
sp  rw- ROP chain rw- shellcode rwx -

Copying our Shellcode

Gadget:
Stack Pivot

Gadget: memcpy

Gadget:
mmap/RWX

84

#RSAC
system_server
pc  r-x code/memcpy rw- stack
sp  rw- ROP chain rw- shellcode rwx -

Copying our Shellcode

Gadget:
Stack Pivot

Gadget: memcpy

Gadget:
mmap/RWX

85

#RSAC
system_server
pc  r-x code/memcpy rw- stack
sp  rw- ROP chain rw- shellcode rwx shellcode

Executing our Shellcode

Gadget:
Stack Pivot

Gadget: memcpy

Gadget:
mmap/RWX

shellcode

86

#RSAC
system_server
r-x code rw- stack sp  rw- ROP chain rw- shellcode pc  rwx shellcode

#RSAC
Creating an Arbitrary Code Exec Exploit

ARSENAL
1. Arbitrary Decrement 2. Controlled Buffer 3. Arbitrary Overwrite
(if we knew the original value)

DEFENSES
1. ASLR 2. RELRO 3. NX pages 4. SELinux

87

#RSAC
Shellcode
Runs as system, still subject to the SELinux, but can:

REPLACEMENT OF APPS

SELINUX
BYPASS

ACCESS TO APPS' DATA
88

KERNEL CODE EXEC
(on select devices)

#RSAC
Demo
89

#RSAC
Google's Patch for CVE-2015-3825
public class OpenSSLX509Certificate extends X509Certificate {
private transient final long mContext; ... }
MISSING MODIFIER BEFORE OUR DISCLOSURE!
(NOW PATCHED)
90

#RSAC
Hardened SELinux policy in the AOSP master branch

AOSP Commit #1:

AOSP Commit #2:

91

#RSAC
Are you patched?
Good news! Majority of the devices are updated
But some aren't...
92

#RSAC
Our 2nd Contribution: Vulnerabilities in SDKs
CVE-2015-2000/1/2/3/4/20
93

#RSAC
Finding Similar Vulnerabilities in SDKs
Goal. Find vulnerable Serializable classes in 3rd-party SDKs
Why. Fixing the Android Platform Vulnerability is not enough. Apps can be exploited as well!

#RSAC
Experiment 2

Analyzed over 32K of popular Android apps
Main Results

CVE-2015-2000 CVE-2015-2001 CVE-2015-2002 CVE-2015-2003 CVE-2015-2004 CVE-2015-2020

Jumio SDK

Code Exec.

MetaIO SDK

Code Exec.

Esri ArcGis SDK Code Exec.

PJSIP PJSUA2 SDK Code Exec.

GraceNote SDK Code Exec.

MyScript SDK Code Exec.

95

#RSAC
Root Cause (for most of the SDKs)

SWIG, a C/C++ to Java interoperability tool, can generate vulnerable classes.

POSSIBLY

public class Foo implements Bar { SERIALIZABLE

private long swigCPtr;

CONTROLLABLE

protected boolean swigCMemOwn; POINTER

...

protected void finalize() {

delete();

}

public synchronized void delete() {

...

exampleJNI.delete_Foo(swigCPtr);

...

}

...

POINTER USED IN

}

NATIVE CODE

96

#RSAC
Patching is problematic for SDKs

SDK 1 SDK 2 SDK N

DEVELOPERS

END USERS

#RSAC
Apps are in a bad place
Vulnerable apps are still out there.
SDKs need to be updated by app developers. Dozens of apps still use them! (as of Feb `16)
New vulnerable apps can emerge
Developers can introduce their own vulnerable classes.

#RSAC
Apps are in a bad place
Exploitation
Still no type-checking by Android before deserialization. ASLR can still be defeated when malware attacks Zygote forked processes. As opposed to system_server, The SELinux policy hasn't been hardened for the apps domain.

#RSAC
Wrap-up
100

#RSAC
Summary
Found a high severity vulnerability in Android (Exp. 1). Wrote a reliable PoC exploit against it. Found similar vulnerabilities in 6 third-party SDKs (Exp. 2). Patches are available for all of the vulnerabilities and also for SWIG.
Consumers: Update your Android. Developers:
Update your SDKs. Do not create vuln. Serializable classes. Use transient when needed!

Thank you!
?

#RSAC
ARE YOU STILL VULNERABLE?

102

#RSAC
References
Paper. https://www.usenix.org/conference/woot15/workshop-program/presentation/peles Video. https://www.youtube.com/watch?v=VekzwVdwqIY Nexus Security Bulletin. https://source.android.com/security/bulletin/2015-08-01.html AOSP Patch.
https://android.googlesource.com/platform/external/conscrypt/+/edf7055461e2d7fa18de5196dca80 896a56e3540
OpenSSLX509CertificateChecker.
https://play.google.com/store/apps/details?id=roeeh.conscryptchecker

