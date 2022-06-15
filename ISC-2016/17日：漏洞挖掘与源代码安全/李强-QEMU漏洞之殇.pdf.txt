QEMU



360 


 360    QEMU
-- 3014CVE



QEMU

QEMU

QEMU

QEMU

QEMU

QEMU
QEMU

QEMU

Guest Applications Guest Operating System

Guest Applications Guest Operating System

Virtual Hardware

Hypervisor

Virtual Hardware

Host Operating System

Physical Hardware

QEMU
QEMU
   QEMU  VGA

QEMU
 KVM  ->QEMU

QEMU
 QEMUBAR->MMIO  QEMU->PIO  IO portMMIO  IO portMMIO

QEMU

QEMU

3% 3% 5% 5%
5% 9%
31%



39%

31%

39%

9% 5%

5%

5%

UAF(3%)

(3%)

QEMU
vmxnet3
 QEMU
 23
 vmxnet36( 5UAF 

CVE-2016-2841
QEMU
vmxnet3
 drivershared memory vmxnet3
 vmxnet3shared memory 

CVE-2016-2841 CVE-2016-2841
QEMU

  QEMUbug
   
  

CVE-2016-2841 CVE-2016-2841
QEMU
UAF
  vmxnet3 
  free bar 0 
 QEMU 

CVE-2016-2841 CVE-2016-2841
QEMU

  
  max_frags g_malloc(0)p->raw NULL
 QEMU

CVE-2016-2841
QEMU

 QEMU  SCSIUSB  
  fragment_len=0 more_frags 
 QEMU CPU 100%

CVE-2016-2841
QEMU

 QEMU QEMU 
 txcq_descr  
 QEMU  ASLR

CVE-2016-2841
QEMU

   
 l3_hdr>iov_len IP  iov_bo_buf 
  QEMU

CVE-2016-2841
CVE-2016-2841
QEMU





CVE-2016-2841 CVE-2016-2841
QEMU
 QEMU  
 
 

CVE-2016-2841 CVE-2016-2841

 CVE-2016-4439  
 Q&A



