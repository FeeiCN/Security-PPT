CONTAINER ESCAPE IN 2021


l  @ l  l Linux /// l HITB, CanSecWest, Syscan360...


l  l  l 

1. 


l Docker2013OS l  l 

Docker
l namespaces:  l cgroups:  l UnionFS: 


l  vs  l  l 


l  l  l 

CAP
l CAP_SYS_MODULE l CAP_SYS_ADMIN l CAP_DAC_READ_SEARCH

mounts
l sysfs/procfs/tracingfs/debugfs

Usermode helper
l  Linux 

Usermode helper
C: helper C: helper H: helper H: helper/etc/shadow H: helper/etc/shadow C: /etc/shadow

Usermode helper
l /proc/sys/kernel/modprobe l /proc/sys/kernel/core_pattern l /sys/kernel/uevent_helper l /sys/fs/cgroup/*/release_agent l /proc/sys/fs/binfmt_misc, exploit

2. 

binfmt_misc

binfmt_misc
l proc l  l Linux

binfmt_misc

binfmt_misc: 
l : /proc/sys/fs/binfmt_misc/register l : /proc/sys/fs/binfmt_misc/<name> l : echo -1 > /proc/sys/fs/binfmt_misc/<name>

binfmt_misc: 
l formats l execve load_binary

binfmt_misc: handler
l misc_formatformats l handler , misc_format

binfmt_misc
l ELF/bash/... 

binfmt_misc: poc1
l ELF/bash/... 

binfmt_misc: poc1(
l #!/bin/sh

binfmt_misc: poc1
l #!/bin/sh

binfmt_misc: poc2

eBPF

eBPF
l 1992cBPF l  l eBPF l eBPFJavaScript l 

eBPF
l  l  l 
Cilium

bpftrace

Falco

eBPF

eBPF
l eBPF eBPF l eBPF map, / l eBPF verifier, eBPF l eBPF helper, eBPF

kprobeeBPF
l kprobe,  l kprobekretprobe l eBPFkprobe kprobeeBPF

eBPF
l eBPF/kprobecgroupsnamespaces l CAP_SYS_ADMIN/BPFeBPF l 

eBPF: 

eBPF: poc

eBPF: poc

VMM


l  l  l +


l OS l OS l QEMU

sysfs
l sysfsprocfs l /sys l sysfssysfs /

VMM
l sysfs l  l 

VMM: poc
l Gaoning Pan, Xingwei Linscavenger l QEMUPoC: https://github.com/hustdebug/scavenger

VMM: poc

3. 

binfmt_misc 
l , kata/gVisor l drop CAP_SYS_ADMINremount) l Usermode helper (CONFIG_STATIC_USERMODEHELPER_PATH) l LSM(Apparmor, SELinux)

eBPF 
l drop CAP_SYS_ADMINremount) l eBPF l eBPF()

VMM 
l , kata/gVisor l drop CAP_SYS_ADMINremount) l VMM


KCon 
MA N O E U VR E

