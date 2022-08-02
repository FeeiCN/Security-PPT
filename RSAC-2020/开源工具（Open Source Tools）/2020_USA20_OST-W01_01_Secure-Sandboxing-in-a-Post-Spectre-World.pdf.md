SESSION ID:XXX-XXXX
Secure Sandboxing in a PostSpectre World

Tyler McMullen
CTO Fastly @tbmcmullen

Jonathan Foote
Principal Security Architect Fastly @footePGH

#RSAC

Presenter's Company Logo ­ replace or delete
on master slide

#RSAC https://meltdownattack.com/

#RSAC
Edge compute

Presenter's Company Logo ­ replace or delete
on master slide

#RSAC

Presenter's Company Logo ­ replace or delete
on master slide

#RSAC


Presenter's Company Logo ­ replace or delete
on master slide

#RSAC


Presenter's Company Logo ­ replace or delete
on master slide

#RSAC

FaaS


Presenter's Company Logo ­ replace or delete
on master slide

Ruby VM


#RSAC



Virtualization Container
LanguageVM 

Presenter's Company Logo ­ replace or delete
on master slide

#RSAC
~1ms ~100ms >1s



Virtualization Process
Sandbox
Sandbox
Sandbox
Sandbox

Sandbox
Sandbox

Sandbox
Sandbox

Presenter's Company Logo ­ replace or delete
on master slide

#RSAC


Granular Sandboxing

Presenter's Company Logo ­ replace or delete
on master slide

#RSAC

Presenter's Company Logo ­ replace or delete
on master slide

#RSAC

Guest Guest Guest Guest Guest Guest Guest Guest Guest Guest Guest Guest Guest Guest Guest

...

...

...

host embedding
process

host embedding
process

host embedding

...

process

linux kernel

bare metal

Guest Guest Guest Guest Guest Guest Guest Guest Guest Guest Guest Guest Guest Guest Guest

...

...

...

host embedding
process

host embedding
process

host embedding

...

process

linux kernel

bare metal

WebAssembly Sandbox, WASI
Capability-based API, Process Isolation
seccomp-bpf, Namespacing, Capabilities, Privilege Separation
Kernel Hardening, OS security
CPU/Component Firmware Hardening, Physical security

#RSAC
Transient execution security

#RSAC
Research and development evolution
Attacks and defenses

Presenter's Company Logo ­ replace or delete
on master slide

#RSAC https://meltdownattack.com/

#RSAC

2018
Presenter's Company Logo ­ replace or delete
on master slide

2019

2020
https://cpu.fail/ https://meltdownattack.com/ https://foreshadowattack.eu/

#RSAC
Expectations

Advances in offensive security research ­ Unexplored CPU components, new techniques Significant improvements in HW-supplied defenses ­ Intel, AMD Continued exposure of Fastly network ­ New hardware ­ New execution models Malicious exploitation
Presenter's Company Logo ­ replace or delete
on master slide

https://www.fastly.com/network-map

#RSAC
Transient execution attacks
Concepts

L2 L1 Core

Bus / Main Memory / Etc

LLC

L2

L2

L1

L1

Core

Core

L2 L1 Core

Slow Fast

#RSAC

arch
Presenter's Company Logo ­ replace or delete
on master slide

µarch

#RSAC
Transient execution attacks and defenses
Analysis by example

#RSAC

arch
Presenter's Company Logo ­ replace or delete
on master slide

µarch

arch

µarch

#RSAC

Presenter's Company Logo ­ replace or delete
on master slide

arch
 secret = "secret"; // or set affinity, etc.  oracle = malloc(4096 * 256);



for cache_line in oracle {

clflush(cache_line);

}

µarch
L1D
"secret"

ø0

4KB

ø1

4KB

Ø2

4KB

Ø255

4KB

4KB

CPU

arch
secret = "secret"; // or set affinity, etc. oracle = malloc(4096 * 256);
for cache_line in oracle { clflush(cache_line);
}
 gadget: // ... ret2spec_gadget(i) { // ... *(oracle + secret[j]); }

µarch
L1D
"secret"
ø0 ø1 Ø2
Ø255
4KB

CPU
RSB
&tailA &tailB &tailC &tailN

#RSAC
Priming the system: defenses

Disallow clflush and proxies Disallow large array allocations Process isolation Secrets management Detect suspicious code patterns Detect suspicious L*D and allocation activity ...
Presenter's Company Logo ­ replace or delete
on master slide

https://www.fastly.com/network-map

arch
secret = "secret"; // or set affinity, etc. oracle = malloc(4096 * 256);
for cache_line in oracle { clflush(cache_line);
}
gadget: // ... ret2spec_gadget(i) { // ... *(oracle + secret[j]); }

µarch
L1D
"secret"
ø0 ø1 Ø2
Ø255
4KB

CPU
RSB
&tailA &tailB &tailC &tailN

arch
secret = "secret"; // or set affinity, etc. oracle = malloc(4096 * 256);

for cache_line in oracle { clflush(cache_line);
}



ret2spec_recurse();

gadget: // ... ret2spec_gadget(i) { // ...
*(oracle + secret[j]); }

µarch
L1D
"secret"

ø0



ø10

Ø2

Ø255
4KB

CPU
RSB
 &gadget  &gadget  &gadget  &gadget

#RSAC
Problematic transient execution: defenses
Apply microcode patches Limit reach of user-supplied code Flush shared resources by security domain Co-schedule by security domain Detect suspicious code patterns, runtime activity ...

Presenter's Company Logo ­ replace or delete
on master slide

https://www.fastly.com/network-map

CPU component BPU::BTB

Trans exec technique
Bounds check bypass / Spectre v1

Branch target injection / Spectre v 2

ECP prevention controls
32-bit addressing for guest programs Array index masking or lfence/serialization for hostcalls Process isolation by security domain
Retpoline for indirect calls within Wasm guests Retpoline for host or IBPB on hostcall invocation IBPB on hostcall return IBRS on guest context switch Enable STIBP globally Process isolation by security domain

...
Memory disambiguator
Line Fill Buffer (LFB), Load port, Store buffer

...

...

Speculative Store Bypass (SSB) / Spectre v 4

32-bit addressing for guest programs Array index masking or lfence/serialization for hostcalls SSBD

Microarchitectual data sampling (MDS) / Zombieload (variants 1-5) / RIDL

Co-schedule physical hardware by security domain Process isolation by security domain VERW (or equivalent) on host+guest context switches Disable TSX Enable KPTI Enable SMAP Disable SGX

LoPgreos­enreteprl'ascCeoomr dpealneyte...

...

...

on master slide

#RSAC

arch
secret = "secret"; // or set affinity, etc. oracle = malloc(4096 * 256);
for cache_line in oracle { clflush(cache_line);
} ret2spec_recurse();
gadget: // ... ret2spec_gadget(i) { // ... *(oracle + secret[j]); }

µarch
L1D
"secret"

ø0



ø1

Ø2

Ø255
4KB

CPU
RSB
 &gadget  &gadget  &gadget  &gadget

arch
secret = "secret"; // or set affinity, etc. oracle = malloc(4096 * 256);

for cache_line in oracle { clflush(cache_line);
}

ret2spec_recurse();



for block in oracle {

mfence; lfence; rdtsc;

// ...

update_scores();

}

gadget: // ... ret2spec_gadget(i) { // ...
*(oracle + secret[j]); }

µarch
L1D
"secret"

 105 ns

ø0

4KB

 1 ns

ø1

4KB

 141 ns

Ø2

4KB

 141 ns

Ø255

4KB

4KB

CPU
RSB
&gadget &gadget &gadget &gadget

#RSAC
Measuring side effects: defenses
Disallow asm Disallow fine-grained timers/primitives; add jitter Deterministic ordering of all events Array preloading, non-deterministic array access, buffer ASLR, etc. ...

Presenter's Company Logo ­ replace or delete
on master slide

https://www.fastly.com/network-map

arch
secret = "secret"; // or set affinity, etc. oracle = malloc(4096 * 256);
for cache_line in oracle { clflush(cache_line);
}
ret2spec_recurse();
for block in oracle { mfence; lfence; rdtsc; // ... update_scores();
}
gadget: // ... ret2spec_gadget(i) { // ...
*(oracle + secret[j]); }

µarch
L1D
"secret"

 105 ns

ø0

4KB

 1 ns

ø1

4KB

 141 ns

Ø2

4KB

 141 ns

Ø255

4KB

4KB

CPU
RSB
&gadget &gadget &gadget &gadget

arch
secret = "secret"; // or set affinity, etc. oracle = malloc(4096 * 256);
 for k in (len(secret) * LRG_NUMBER) {
for cache_line in oracle { clflush(cache_line);
}
ret2spec_recurse();
for block in oracle { mfence; lfence; rdtsc; // ... update_scores();
} }
gadget: // ... ret2spec_gadget(i) { // ...
*(oracle + secret[j]); }

µarch
L1D
"secret"

CPU

ø0

4KB

ø1

4KB

Ø2

4KB

Ø255

4KB

4KB

RSB
&gadget &gadget &gadget
&gadget

#RSAC
Orchestrating the attack: defenses
Disallow longer, continuous runtimes Isolate workloads by security domain ­ "Quarantine" low-trust workloads Detect suspicious code patterns, runtime activity ...

Presenter's Company Logo ­ replace or delete
on master slide

https://www.fastly.com/network-map

#RSAC
Transient execution attacks and defenses
Approach for Fastly Compute@Edge

flush+reload evict+time
prime+probe flush+flush
prime+abort ...
Presenter's Company Logo ­ replace or delete
on master slide

#RSAC
Prime the system Invoke problematic transient execution Read side-channel Orchestrate the attack
https://cpu.fail/ https://meltdownattack.com/ https://foreshadowattack.eu/

Prime the system
Invoke problematic transient execution
Read side-channel
Orchestrate the attack
Presenter's Company Logo ­ replace or delete
on master slide

#RSAC
Disallow direct, granular flushing of cache lines Process isolation by security domain ...

Apply microcode patches Limit reach of user-supplied code
...

Apply coarse-grained, jittered timers Non-deterministic array access ...

Time-limit, safely schedule workloads

Detect and respond to suspicious workloads

https://cpu.fail/

...

https://meltdownattack.com/

https://foreshadowattack.eu/

Prime the system

?

Invoke problematic transient execution

?

?

Read side-channel

?

Orchestrate the attack

?

Prime the system

?

Invoke problematic transient execution

?

!

Read side-channel

?

Orchestrate the attack

?

#RSAC
Expectations (review)
Advances in offensive security research Continued exposure of Fastly network Significant improvements in HW-supplied defenses Malicious exploitation

Presenter's Company Logo ­ replace or delete
on master slide

https://www.fastly.com/network-map

#RSAC
Coverage of approach

Malicious exploitation

­  Known attacks are evaluated and prevented

Significant improvements in HW-supplied defenses

­  Fit into defined categories of defense

Continued exposure of Fastly network

­  Framework can be applied across CPU architectures and execution models

Advances in offensive security research

­  Mitigate risk of practical attacks while defenses are rolled out

Presenter's Company Logo ­ replace or delete
on master slide

https://www.fastly.com/network-map

#RSAC
Conclusion

#RSAC
Defense is best approached holistically

Presenter's Company Logo ­ replace or delete
on master slide

https://www.fastly.com/network-map

#RSAC
Validate with adversarial analysis

Presenter's Company Logo ­ replace or delete
on master slide

https://www.fastly.com/network-map

#RSAC
Transient execution attacks are here to stay

Presenter's Company Logo ­ replace or delete
on master slide

https://www.fastly.com/network-map

#RSAC
Thanks

