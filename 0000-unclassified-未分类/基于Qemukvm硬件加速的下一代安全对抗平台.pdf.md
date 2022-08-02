Qemu/kvm 
 


 ·  ·  ·  ·  · 



     Ark    KVM-Based security platform  




·  · 
· ark ·  · ark
·  ·  
·  · 


·  unicorn  ·  shellcode ·  D3D
·  ·  D3D · 


·  ·  · 


·  QEMU 
·  
·  virtual JTAG 
· Virtual JTAG   windows 


 QEMU/KVM  
·  ·  ·  ·  · 
·  ·  ·  api





 GUEST HOST VMCS Virtual Machine Control Structure  GVAguest virtual address GPAguest physical address HVAhost virtual address HPAhost physical address

       


·  · CPU 
host  guest  

QEMU/KVM




·  ·    
·  · 











QEMU

QEMU/KVM

ARK

 QEMU   mmap  
.

ARK
HVP  GPA

  EPT  GPA  HPA  HPA 
 HVA

 KVM remap QEMU 


·  GPA  GVA ·  CR3


1.  cr3  · Vmread  · Hook VmExit Handler · Kvm  cr3 
2.  cr3  GVA  GPA GVA  3.  32 PAE 64 4k 2M 1G  

KERNEL
 ntoskrnl   idt  handler handler ntoskrnl 

 pe 

ntoskrnl base address = handler address offset


·  linux  · Elf  · Pe 
· Elf dwarf  · 
· windows pdb  ·  · LLVM pdbutil  · WINE

ARK
·  ntoskrnl  ·  PspCidTablePsActiveProcessHead ·  PsLoadedModuleList  · 
· 

ARK
· ark ·  ·  ·  · 
· 




·  
· 
·  virtual JTAG   windows 
· virtual JTAG windows 

VIRTUAN JTAG
·  virtual JTAG  
·   


·  0xcc kvm_update_guest_debug 
·  intel Exception Bitmap

· Virtual JTAG 





VIRTUAL JTAG

1. Vcpu int 3

exception bitmap 1

vmexit  host 

2.  kvm  vmexit handler

3. Handler  vmexit 

 qemu

4. Qemu gdb server

5. Gdb server  gdb client 

6. Gdb server  vmexit

handler

7. Vmexit handler  vmresume 

 vmentry 


·  virtual JTAG  ·  ark · arkint3. ·  Exception Bitmap  int 3  qemu  gdb
server · gdb server
· 


·  
·  
· copy_on_write 
· Cpu 

int3
·  int3 
·  ept  hook  host  hook ept  


·  eptMTF   ·  trace · 



KVM-Based security platform


· python

· Demo




·  windows 


·  python  windows 


·  linux 


·  python  linux 


·  Working Set 


·  Working Set 

· 



· 




·  ark  ark ·  hook host ·  arm  arm  · 


· https://wiki.qemu.org/Category:Developer_documentation · https://software.intel.com/content/www/us/en/develop/articles/intel-sdm.html · https://www.triplefault.io/2017/07/breaking-backwards-compatibility-5-
year.html

Q&A
jianghaotian.sunday@gmail.com Thanks for watching

