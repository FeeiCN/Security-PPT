Linux
   shiys@solutionware.com.cn

BY DEFAULT, LINUX NETWORKING NOT TUNED FOR MAX PERFORMANCE,
MORE FOR RELIABILITY

Trade-off :Low Latency, throughput, determinism

Performance Goals
 Throughput
­ Optimize for best average ­ Default design criteria for most operating systems ­ "how much can you do at a time?"
 Low Latency
­ Optimize for best minimum ­ Minimize execution times for certain paths ­ "what's the fastest we can push a packet out?"
 Determinism
­ Optimize for best (lowest) maximum ­ Fewest/lowest outliers ­ "what's the maximum time it will take?"

State of the Art NIC characteristics
 56 Gigabits per second (Unix network stack was designed for 10Mbits)
 4-7 Gigabytes per second (Unix: 1 MB/s)  >8 million packets per second (Unix: ~1000 packets
per second).  Less than a microsecond per packet for processing.

Latency Factors

BIOS Settings for Low Latency

CSTATE default ­ C7 on this config

CSTATE disabled ­ Note speed

NPtcp latency vs cstates ­ c7 vs c0

Firmware tuning impact ­ a drastic picture

Different Technology To Max Performance
 IPOIB = Kernel Sockets layer using IP emulation on Infiniband.  SDP = Kernel Sockets layer using Infiniband native connection.  IB = Native Infiniband connection. User space  User Space  Rsockets = Socket Emulation layer in user space  Performance comparison shows that kernel processing is detrimental
to performance. Bypass is essential.

Different Technology To Max Performance

Why bypass the kernel?
 Kernel is too slow and inefficient at high packet rates. Problems already begin at 10G.
 Contemporary devices can map user space memory and perform transfer to user space.
 Kernel must copy data between kernel buffers and userspace.  Kernel is continually regressing in terms of the overhead of
basic system calls and operations. Only new hardware compensates.

Sending a message via the sockets API

Kernel Bypass

Kernel Bypass

VNIC per CPU core (RSS)
 RX queue per CPU core  TX queue per CPU core  Complete CPU core separation  Performance scales across CPUs

Virtual NICs for application acceleration

Virtual NICs for VM
 Same model used for SR-IOV  In this case VM has direct
access to VNIC(s) via SR-IOV VF

Acceleration Middleware
 Just a library and a kernel module ­ No application changes ­ No recompile ­ No kernel patches ­ No protocol changes
 Picks up existing Linux network configuration ­ IP addresses and route table ­ Bonding (aka teaming)/ VLANs ­ Multicast (IGMP) ­ Kernel settings, e.g. socket buffer sizes

Offload ­ Solarflare OpenOnload

Ethtool ­ View and change Ethernet card settings
 Works mostly at the HW level
­ ethtool -S ­ provides HW level stats
Counters since boot time, create scripts to calculate diffs ­ ethtool -c - Interrupt coalescing ­ ethtool -g - provides ring buffer information ­ ethtool -k - provides hw assist information ­ ethtool -i - provides the driver information

sysctl ­ popular settings
 These settings are often mentioned in tuning guides ­ net.ipv4.tcp_window_scaling · toggles window scaling ­ net.ipv4.tcp_timestamps · toggles TCP timestamp support ­ net.ipv4.tcp_sack · toggles SACK (Selective ACK) support

sysctl ­ "core" memory settings
 CORE memory settings
­ net.core.(r/w)mem_max · max size of (r/w)x socket buffer
­ net.core.(r/w)mem_default · default (r/w)x size of socket buffer
­ net.core.optmem_max · maximum amount of option memory buffers
­ net.core.netdev_max_backlog · how many unprocessed rx packets before kernel starts to drop
 These settings also impact UDP !

Effect of net.core.rmem_max on read throughput

Offload is
 Replacement of what could be done in software with dedicated hardware.
 Overlaps with Bypass because direct device interactions replaces software action in the kernel through the actions of a hardware device.
 Typical case of hardware offload: DMA engines, GPUs, Rendering screens, cryptography, TCP (TOE), FPGAs.

Network Card Hardware Tuning
 Jumbo Frames  Transmission queue  Multi streams  interrupt moderation  RX, TX checksum offload  TCP Segmentation Offload  TCP Large Receive Offload (LRO)

Numa In Network Transfer

Performance diagnostic tools

Performance diagnostic tools

Coming in 2013
 100 GB/sec networking
 >100 GB/sec SSD / Flash devices  More cores in Intel processors.  GPUs already support thousands of hardware threads.
Newer models will offer more.

Who Are We?
Linux

Join Us . . . . . .
hr@solutionware.com.cn

Q&A

