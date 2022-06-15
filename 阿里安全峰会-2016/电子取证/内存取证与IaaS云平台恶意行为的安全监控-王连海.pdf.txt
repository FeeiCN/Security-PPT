IaaS 
  


   


  ,    


     






APT
 

 

 

 
 


 




APT



 
  
 


 



APIHook

 //  


 


 

 



APIHook

APIHook 

APIHook 





hook



hook

APIHook

 hook

 hook


APIHook
  pe 
1hook


APIHook
2hook


APIHook
3hook


APIHook
4hook
APIHook 123


// 












DLL  

DLL 

  

 APT 

ShellCode 

DLL  

Http/Https  


DLL
APT DLL DLL 


DLL
APT DLL DLLDLL APT


DLL
DLLsystem32DLL "/users/*/appdata/ local""system volume information/_resto re"


Http/Https
APTHtt psHttp "HTT P/1.1 200""HTTP/1.0 200"   



APTT cpEndpointPool 





ShellCode
 APTShellCode  ShellCode
   GetPC Code(call, jump, fnstenv)  Get Kernel32 Address Code  


ShellCode



 

 

 APT
 




, 



VM EscapeVM HoppingCross-VM AttacksCVE2015-3456CVE-2015-6815 
  CVE-2015-5239 


   Rootkit    
2003GarfinkelRosenblum virtual machine introspection 


 I/O 



 
VMIVirtuoso6 
 
XenAccessVMMVMM  
 



     








 · KVM



root   PCI-E root 





 
 APT
APT 

  







 dll//PE 
WindowsLinux 


 






3.1 VENOM VENOMCVE-2015-3456CrowdStrikeJason Geffner QEMU 
VENOM eip( eip)


3.2 VENOM Ubuntu 12.4 x86;linux:3.2.0-24generic-pae;quemu:2.2.0 Ubuntu 12.4 x86;linux:3.2.57


3.3 VENOM (1) pocDATA_FIFO
int main(){ int I; iopl(3); outb(0x8e,0x3f5); for(i=0;i<10000000;i++) outb(0x42,0x3f5); return 0; }


VENOM (2) 


VENOM (3)  poc
 


VENOM (4) poc 


VENOM 


VENOM (5) ret2lib,system/bin/sh. 1) ASLR() randomize_va_space0


VENOM 2) gdbqemu-system-i386 system"/bin/sh" 


VENOM 3) poc   2 


3.4 VENOM (1) poc 



VENOM (2)  



3.5 VENOM

(1) ps ­alx

qemu-system-i386/bin/sh



tgid

id






VENOM (2) qemu-system-i386/bin/sh 


 VENOM-- struct task_struct{ ... pid_t pid; pid_t tgid; ...
struct task_struct __rcu *real_parent;// id
struct task_struct __rcu *parent; struct list_head children; ...
char comm[TASK_COMM_LEN];//
... }


 VENOM--pidtgid
Linuxgetpid task_structtgidthread group
identifier,pid(process identifier) id.


 (3) VENOM--  1.lime  2. 



 pid tgid 

 pid



VENOM



4 VMCS
 ,VT-xVMX root operationVMX nonroot operation, ,VMCS
,VMCSCPU(VCPU) VMCS
 VMCS

   vmcs
 

 swapper_pg_dir c1925000 1925000eptpointer 1f8e25000
   vmcs
 swapper_pg_dir 0


  VENOM
 1. VMCS 
 2. tgidpid tgid
 3.
 



 
VENOM  



