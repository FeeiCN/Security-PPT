APP

· dex2jar! · ! · ! · ! · !


· ! · T! · A! · B! · !


· ! · STEE -- ! · !

App/IoT/

/!

!

!



!

JAVA

C++

!

!



Dex File

Dalvik VM

APP

XXX File

XXX VM

APP

System.out.println("hello world")

.method public static main(LString;)V

.registers 3

Frame / !

sget-object v0,

LSystem;->out:LPrintStream;

const-string v1, "Hello world"

invoke-virtual {v0, v1},

LPrintStream;->println(LString;)V

return-void

.end method!

art/runtime/interpreter/switch_impl.cpp!

t = env->FindClass("System") f = env->GetFieldId(t, "out") v0 = env->GetStaticObjectField(t, f)

TODO

· !
· !
· !
·  + loadLibrary!

· ! · RegisterNatives()!
· ! · !





!

! !
! !

!

! SecurityStack.cn!

!

