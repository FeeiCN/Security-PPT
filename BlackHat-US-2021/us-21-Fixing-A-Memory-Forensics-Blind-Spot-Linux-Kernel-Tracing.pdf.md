Fixing a Memory Forensics Blind Spot: Linux Kernel Tracing
Andrew Case / Golden G. Richard III
#BHUSA @BlackHatEvents

https://www.brendangregg.com/ebpf.html

#BHUSA @BlackHatEvents

· Example output and tools: https://github.com/iovisor/bpftrace/tree/master/tools

#BHUSA @BlackHatEvents

http://www.brendangregg.com/ebpf.html

#BHUSA @BlackHatEvents

eBPF is Widely Used in Production
· Netflix
o https://netflixtechblog.com/how-netflix-uses-ebpf-flow-logs-at-scale-for-network-insight-e3ea997dca96
· Google
o https://cloud.google.com/blog/products/containers-kubernetes/bringing-ebpf-and-cilium-to-google-kubernetes-engine
· Facebook
o https://www.infoq.com/presentations/facebook-google-bpf-linux-kernel/
· Capital One, Adobe, Cloudflare, Digital Ocean
o https://ebpf.io/summit-2020/
#BHUSA @BlackHatEvents

Prevalence in Distributions
· Volexity maintains a database of kernels released by common distributions
· Debian, Ubuntu, CentOS, Red Hat, SuSe, AWS, ...
· There is also an API for querying metadata of these kernels, including configuration options
· At the time of testing, the database held 14,762 kernels
#BHUSA @BlackHatEvents

Prevalence in Distributions Results
· The bpftrace documentation lists which kernel options are required for all tracing features and that the version must be >= 4.9
· Of the 14,762 kernels, 5,386 were >= 4.9
· Initially run showed 82.9% of kernels had all features
· Analysis of missing ones showed new features were added in 4.11 · We then updated the script to skip these features on 4.9 and 4.10
· Final run showed 5,191 of the 5,368 (96.3%) of the kernels had all features
· The few still missing are an Ubuntu variant (kvm) that would not be seen in normal production environments
#BHUSA @BlackHatEvents

ftrace
· Initially, a function tracing interface for kernel modules
· Now also supports tracing events
· There is also a userland interface

https://jvns.ca/blog/2017/03/19/getting-started-with-ftrace/

https://github.com/ilammy/ftrace-hook

#BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

tracepoints
· Allow for hooking functions that define tracepoints
· 1,000+ functions define these on production kernels
· Used POC to hook mm_probe_page_free and mm_probe_page_alloc
https://hugoguiroux.blogspot.com/2016/01/hooking-into-kernel-real-time-code.html

#BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

kprobe ­ kernel interface
· Allows for hooking kernel functions by name or address
· pre_handler runs before first instruction
· post_handler runs after first instruction
· fault_handler runs if an initial fault
https://github.com/spotify/linux/blob/master/samples/kprobes/kprobe_example.c

#BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

kprobe ­ userland interface

#BHUSA @BlackHatEvents

Trace Event Handlers
https://www.kernel.org/doc/html/v4.18/trace/events.html

#BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

kretprobe
· Allows hooking a function's entry and exit
· Legit use is tracking life of a function call
· Re-uses kprobe infrastructure for entry hooking
· Can be used to modify a function's return value
https://github.com/spotify/linux/blob/master/samples/kprobes/kretprobe_example.c

#BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

eBPF
· Allows userland to run programs in kernel space
· Programs are verified before being allowed to execute
· eBPF heavily relies on previously described facilities
https://www.infoq.com/articles/gentle-linux-ebpf-introduction/

#BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

Wrapup
Upcoming talks on Offensive Uses of eBPF With Friends Like eBPF, Who Needs Enemies? ­ Black Hat Warping Reality - creating and countering the next generation of Linux rootkits using eBPF - DefCon
A huge thank you to Gus Moreira for his feedback and plugin development!
#BHUSA @BlackHatEvents

Questions/Comments?

- andrew@dfir.org - @attrc - https://www.volexity.com
- golden@cct.lsu.edu - @nolaforensix - https://www.cct.lsu.edu/~golden/

#BHUSA @BlackHatEvents

