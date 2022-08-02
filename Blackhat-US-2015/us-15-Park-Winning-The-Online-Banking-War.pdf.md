TrendMicro

 Worked for one of big 4 banks in Australia for 6 years as malware security consultant.
 Developed banking malware detection system  Served at Sophos, Symantec, FireEye and
Kaspersky
 Currently with TrendMicro

 Identify the crux of the online banking war  Set the strategic defense framework  PoC design & implementation: MIPS

Spam Server

C&C Site

Infection URL

Campaign

Drop Site

Dropper

Malware

 Got a token for your corporate account? Do you still feel safe?

 Now you are locked out while they buy enough time to transfer money

 There is no such a thing as `Please Wait' in the online banking page.

 What's happening while you are waiting...

 Even when there is no visual sign of infection, it can happen silently.
 C&C communication during Tx pages

 What is the malware receiving? à Inject and Mule

Mule's Account Information

Transfer Amount

$("#submit").on("click", function(){ var id = $("#signin-id").val(); var pw = $("#signin-password").val(); console.log(">> DOM Inject: "+id+":"+pw);
});

Web Browser
MIPS
Inject

POST /mips MIPS_INTEL

Online Banking
Blacklist

Malware Intelligence

 Malware inject removes itself, but it still remains in the memory
 Exploit memory leak patterns
 Dangling references  Circular references  Closures

DOM

body button script script

onclick

var me = document.currentScript; me.parentNode.removeChild(me);

DOM

body

RefToDom

RefToSCript

script

var refToDom = document.body; document.body["refToScript"] = refToDom;

DOM

body button
script

onclick

function AttachEvent(element) { element.attachEvent("onclick", MyClickHandler); function MyClickHandler() { /* This closure references element*/}
}

 Identify entry points (unload, click, timer)  Enumerate event handlers
element.onclick = handler
Scan: element.onclick
element.addEventListener
Scan: getEventListeners(element, "click")
$(element).on("click", handler)
Scan: $._data(element, "events" )
$(element).observe("click", handler)
Scan: element.getStorage(). get('prototype_event_registry').get('click')

For $(`#submit'),`click`, Event handler's namespace property is missing

Normal

DOM Stealth

button01 button01 button01

button01 button01 button01
` '

DOM User-defined Functions Function Function Function

White list Function Function
?

 Enumerate user-defined functions  Object.keys(window).filter( !/\[native code\]/)
 Compare functions discovered in DOM against whitelist  Implementation challenges
 Check on server side or client side?  Reducing data size

Web Browser

POST/mips A,B,C POST/mips A,B,C
...

MIPS POST/mips A,B,C,D

Inject

POST/mips A,B,C

Online Banking

Web Browser
Inject MIPS

POST/mips K,Y,Q POST/mips T,X,A
...

Online Banking

POST/mips Z,B,K,T

 Original MIPS intel gets transformed differently each time using the random variable

Inject MIPS
DomScan

Web Browser

Hash

Salt Ajax

 Hook Salt() and modify hashes OR  Block MIPS & call MIPS functions as necessary

 Insert or replace with bypass code within MIPS code
 Tamper with intermediate MIPS data
var scripts = DomScan(mips_code); scripts = Modify(scripts); var hashes = Hash(scripts); var salted_hashes = Salt(hashes); var check = CheckIntegrity(); check = Modify(check) Ajax(mips, salted_hashes, check);

 Reverse engineer MIPS  Deactivate MIPS and Reconstruct MIPS code
var scripts = DomScan(mips_code); var hashes = Hash(scripts); var salted_hashes = Salt(hashes); var check = CheckIntegrity(); Ajax(mips, salted_hashes, check);
Var hashes = clean_hash_set; var salted_hashes = Salt(hashes); Ajax(mips, salted_hashes, clean_integrity_check);

· What you are up against
· Dynamic analysis
· Use static analysis tools (Google closure compiler, spider monkey, custom tools, etc)
· Understand program structure by setting breakpoints and evaluating expressions
· Bypass dead code · Monitor network traffic · Targeted reverse engineering by searching
keywords (i.e. `script', `/mips')
· Activity monitoring
 Blind obfuscation is not resistant to targeted code inspection/modification

Web Browser

MIPS

Inject

key Ekey(Msg)

Online Banking

 Malware has all info to simulate outcome
 key, encryption algorithm

 Blind application of traditional metamorphic/polymorphic techniques without understanding the attack vector will fail
 Dead code insertion  Polymorphic variable/function names  Control flow manipulation  Function restructuring  Opaque predicate  etc

 Call stack context
var Check = function(na, nb) { var SecureCheck = function(na, nb) { var callee = na ^ crc32(arguments.callee); var caller = nb ^ crc32(arguments.callee.caller); return callee ^ caller ^ DomCheck(); }; return SecureCheck(na, nb);
};
var na = 32053221, nb = 4321053; result = Check(na, nb);

MIPS

Library
(jQuery)

DOM

Web App

 Problem with integrity check
 Malware Regexes, modifies and reconstruct MIPS
 Malware simulates MIPS with bypass code
 Strategy
 Polymorphism  Maintain a set of algorithmically
heterogeneous MIPS code  Fragmented random MIPS scripts with different
names

MIPS BBLs : :

BBL Connection Connection Method Metamorphism

 Chain of Randomisations starting with basic blocks (BBLs) of MIPS code

OpaquePredicate ...
GetCallContext() UpdateVerifyTable()
...

Verify Table

Yes

No

 Retrieve call context in deeply buried OP  Insert part of main logic within OP

var original_func = document.getElementsByTagName; document.getElementsByTagName = function () {
r = original_func.apply(document, arguments); for(var i=0; i<r.length; i++) {
var inject_signature = `string_in_my_inject'; if(r[i].text.search(inject_signature) != -1) {
r[i].remove(); console.log('Injejct Rootkitted!'); break; } } return r; };

 Hook critical MIPS functions
 DomScan(), Hash(), Salt()
 Hook DOM/jQuery
 document.getElementsByTagName(selector)
 Modify the returned HTMLCollection
 jQuery.find(selector, doc, ret)
 Modify the returned array
 Hook system information
 Object.keys()  Function.prototype.toString()

· Collect signatures of chain of functions used by MIPS in multiple different ways.
 Online banking server detects any change

MIPS

DOM

DomScan

Hash

 Deliberately trigger exception à Call stack
var hooked = Function.prototype.toString; Function.prototype.toString = function() {
hooked.apply(this, arguments); } // DOM Rootkit
var TriggerException = function(){ try { Function.prototype.toString.call('hooktest') } catch(err) { console.log(err.stack); }
} TriggerException();

 Is the red line present in a clean session?
TypeError: Function.prototype.toString is not generic
at String.toString (native) at String.Function.toString(/login?next=%2F:173:7) at TriggerException (/login?next=%2F:177:29) at https://mybank.org/login?next=%2F:183:1

Web Browser
Inject MIPS

Online Banking
...

 MISSING-MIPS Event should be implemented on the online banking server side if MIPS is not the integral part of online banking logic
 Method
 Ensure MIPS intel is not cached by the proxy inbetween
 Correlate web access log with MIPS log

 Detect evolving injects
 Effective on minor inject upgrade
 Methods
 Locality sensitive hashing (i.e. TLSH)

 Over-simplified Secure Remote Password

Web Browser

Online Banking

secret A
K

I, A salt, B

secret B
K

Ma

Ma

Mb

Ma == Mb?

 No secrets on the wire any more!

 MITM attack
 No shared secrets get transmitted on the wire (password, OTP code)
 Passive sniffing
 Force attackers to place injects (so we can detect it!)
 MIPS hardening
 DOM function integrity data  MIPS integrity data  MIPS rootkit detection data  MIPS intelligence format

 Diversity of implementation is the key for survival
 Be creative and out-smart the cybercriminals!  Perform application security check  Never explicitly block on the spot on
detection!

MIPS

 Majority of the attacks presented came from the observation in real online banking war
 DOM stealth, rootkit and MIPS infiltration are a natural evolution of the attack
 Online banking must respond with superior defense including at least code randomisation, MIPS integrity verification and rootkit detection

TrendMicro

