Broker
Matthias Vallentin
UC Berkeley International Computer Science Institute (ICSI)
BroCon '16

Communication in Bro

Exploiting Independent State For Network Intrusion Detection
Tap

Internet

Firewall

Tap

Internal Network

Robin Sommer TU Mu¨ nchen Frontend Nodes Manager sommer@in.tum.de

Vern Paxson ICSI/LBNL vern@icir.org

Proxy

... ...

Proxy
Broccoli, Abstract

Backend Nodes

Independent Bro Network intrusion detection systems (NIDSs) critically rely on processing a great deal of state. Often much of this state resides solely in the volatile processor memory accesState Cluster sible to a single user-level process on a single machine. In this work we highlight the power of independent state, i.e., internal fine-grained state that can be propagated from one instance of a NIDS to others running either concurrently or

+

+

in the context of a single process is a minor subset of the
Python Ruby & Perl NIDS process's full state: either higher-level results (often
just alerts) sent between processes to facilitate correlation or
Bindings Bindings aggregation, or log files written to disk for processing in the
future. The much richer (and bulkier) internal state of the
Broccoli Broccoli NIDS remains exactly that, internal. It cannot be accessed
by other processes unless a special means is provided for
doing so, and it is permanently lost upon termination of the
NIDS (which, due to a crash, may happen unexpectedly).

subsequently. Independent state provides us with a wealth
2005 2007 of possible applications that hold promise for enhancing the capabilities of NIDSs. We discuss an implementation of independent state for the Bro NIDS and examine how we can then leverage independent state for distributed processing, load parallelization, selective preservation of state across restarts and crashes, dynamic reconfiguration, high-level policy maintenance, and support for profiling and debugging. We have experimented with each of these applications in several large environments and are now working to integrate them into the sites' operational monitoring. A performance evaluation shows that our implementation is suitable for use even in large-scale environments.

In this work we argue for the great utility of incorpo-
2008 2011 rating independent state into intrusion detection systems.
The goal is to enable much of the semantically rich, detailed state that hitherto could exist only within a single executing process to become independent of that process. We consider two basic types of independent state. Spatially independent state can be propagated from one instance of a NIDS to other, concurrently executing, instances. Temporally independent state continues to exist after an instance (or all instances) of a NIDS has exited. For both types of independence, the state essentially exists "outside" of any particular process.

Broker 0.4

coming soon!
Broker 1.0

2015

2016/17

· Overview · API · Performance · Outlook

Outline

Overview

Broker = Bro'ish data model
+ publish/subscribe communication + distributed key-value stores

Publish/Subscribe Communication
C++
Model
C++
C++
Result

Internet

File Organization

Distributed Key-Value Stores
M

C

C

C

M

C

C

endpoint M master C clone

Broker's Data Model

Arithmetic
boolean count
integer real

Time
interval timestamp

Network
address port
subnet

Container
vector set
table

Other
none
string

API

Lessons Learned

· Functionality: It Just Works

Props to Jon Siwek!

· Usability: no native type support, lots of "data wrapping"

· Semantics: no support for nonblocking processing

Current API

using namespace broker;
init();
endpoint ep{"sender"}; ep.peer("127.0.0.1", 9999);
ep.outgoing_connection_status().need_pop();
auto msg = message{ "my_event", "Hello C++ Broker!", 42u
};
ep.send("bro/event", msg);
ep.outgoing_connection_status().need_pop();

Initialize the Broker library. (Only one broker instance per process allowed.)
Create a local endpoint.
Block until connection status changes.
When communicating with Bro, the first argument must be a string identifying the event name. The remaining values represent the event
arguments.
Publish the event under topic bro/event. Block until connection status changes.

New API

using namespace broker; context ctx;

A context encapsulates global state for a set of endpoints (e.g., worker threads, scheduler, etc.)

auto ep = ctx.spawn<blocking>(); ep.peer("127.0.0.1", 9999);

Create a local endpoint with blocking API.

auto v = vector{ "my_event", "Hello C++ Broker!", 42u
};

Create a vector of data. New semantics: a message is a topic plus data,
not a sequence of data.

ep.publish("bro/event", v);

Publish the event under topic bro/event.

Blocking vs. Non-Blocking API

context ctx; auto ep = ctx.spawn<blocking>();
ep.subscribe("foo"); ep.subscribe("bar");
// Block and wait. auto msg = ep.receive(); cout << msg.topic()
<< " -> " << msg.data() << endl;
// Equivalent semantics; functional API. ep.receive(
[&](const topic& t, const data& d) { scout << t << " -> " << d << endl;
} )

context ctx; auto ep = ctx.spawn<nonblocking>();
// Called asynchronously by the runtime. ep.subscribe(
"foo", [=](const topic& t, const data& d) {
cout << t << " -> " << d << endl; } );
// As above, just for a different topic. ep.subscribe(
"bar", [=](const topic& t, const data& d) {
cout << t << " -> " << d << endl; } );

Data Store APIs

Available backends: 1. In-memory 2. SQLite

// Setup endpoint topology. 3. RocksDB
context ctx; auto ep0 = ctx.spawn<blocking>(); auto ep1 = ctx.spawn<blocking>();

M

auto ep2 = ctx.spawn<blocking>();

ep0.peer(ep1);

ep0.peer(ep2);

// Attach stores.

auto m = ep0.attach<master, memory>("lord");

auto c0 = ep1.attach<clone>("lord");

auto c1 = ep2.attach<clone>("lord");

// Write to the master directly.

m->put("foo", 42);

m->put("bar", "baz");

C

C

// After propagation, query the clones.

sleep(propagation_delay);

auto v0 = c0->get("key");

auto v1 = c1->get("key");

assert(v0 && v1 && *v0 == *v1);

Data Store APIs

// Blocking API. Returns expected<data>. auto v = c->get<blocking>("key");

// Non-blocking API.

M

// Runtime invokes callback.

c->get<nonblocking>("key").then(

[=](data& d) {

cout << "got it: " << d << endl;

},

[=](error& e) {

cerr << "uh, this went wrong: "

<< e

<< endl;

}

C

C

);

Performance

Simple Benchmark
· Throughput analysis · Two endpoints: sender & receiver · Message = conn.log entry
· System: MacBook Pro · 16 GB RAM · 4 x 2.8 GHz Core i7

Throughput
60K
40%
40K

Throughput (msg/sec)

20K

0

new

old

Version

Outlook

Roadmap to 1.0

1. Finish Python bindings 2. Implement Bro endpoint 3. Pattern matching in Bro 4. Flow control

fromfuinpcadtdironimlpooorktup*(key: string) : any;

from broker import *
when ( local x = lookup("key") )

ctx = {Context()

sourcelo=ccatlx.rsepsauwlnt(B=lo"c"k;ing)

sink =swctixt.cshp(awxn()Blocking)

source.pe{er(sink)

case addr:

sink.subscriifbe(("xfoion",10.0.0.0/8 )

reslualmtbd=a "tc,odn:tapirniendt"(;"%s: %s" % (t, d)))

case string:

source.publriesshu(l"tfo=o."bearzr"o,r: lookup() failed: " + x;

}

[1, 3.14, "qux", IPv4Address('1.2.3.4')])

}

Flow Control

Flow Control
Intermediate buffer
STILL OVERFLOWING

Flow Control

Reject at the boundary

CAF: Messaging Building Block
· CAF = C++ Actor Framework · Implementation of the Actor Model · Light-weight, type-safe, scalable · Network transparency

Bro Data Flows
Events Logs write(2)
Packets

Master Workers

Questions?
Docs: https://bro.github.io/broker Chat: https://gitter.im/bro/broker Code: https://github.com/bro/broker

