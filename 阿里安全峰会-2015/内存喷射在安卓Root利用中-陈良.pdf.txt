Root
@KeenTeam


· KeenTeam    
·   
­ Root      ­ Safari,  Chrome,  Internet  Explorer  
­   

·    · Root  
·    ­    ­ 




· 2001  
·    ­ Heap  Spraying  
· (Windows)   ­ Pool  Spray  
  


·    ­    ­ ASLR     
·   
·    ­    ­ 

Root
·    ­ /Linux   ­      
·    ­ syscall  table   ­ Patch  setresuid   ­ DKOM  (task_struct-->cred)   ­ ASLR     ­ PXN32  

Root
·    ­ +   ­ Root  
  
· Android   ­ Kernel  TEXT patch  setresuid   ­ Syscall  table   ­   
· Root   ­ Wen  Xu@KeenTeam  Blackhat  USA  2015  <AH!  UNIVERSAL  ANDROID  ROOTING  IS   BACK>  

mtk[

·   
­ nforest@KeenTeam 2015  

In  mtk[.c

­ mt658x  &  mt6592   

­ ROM  
· 0day  

­ /dev/graphics/[0  
· shell  
crw--rw--------  system      graphics    29,      0  2015--07--09  15:08  [0     



mtkb[
Cmdargioctl
displayid displayid displayid 80


· index  

mtkb[
0x34

· 0x200x24unsigned  int0  
­ DISP_GetPhysicalHeight()  DISP_GetPhysicalWidth() 0  
· Field  
­ 80  


· 80   ­    · Type  Confusion   ·  hhp://www.contexis.com/resources/blog/windows--miigaton--bypass/  
­       · thread_info-->addr_limit     ­ Linuxtask      ­ 324+thread_info-->addr_limit  0xbf000000    

addr_limit  Internals
0task 0xbf0000000
0panic
330userland kernel
thread_info-->preempt_count addr_limit80kernel

2
· thread_info0x2000  
­ (addr  &  0x1fff)  ==  0  
­ 0(addr  &  0x1fff)  ==  4  8   · 0x340x208  
­    ­  (addr  --  dispif_info)    0x20  mod  0x34   ­ 32addr  +  0x1,0000,0000  ==  addr    
· 0x1,0000,0000    --4  mod  0x34   · 0x1,0000,0000  =  0x34  *  4EC4EC5  ­  4     ·   
­ dispif_info[displayid].physicalHeight  AA+4dispif_info[displayed  +   0x4EC4EC5].physicalHeight    
­   


1. dispif_info   2. displayiddisplayid  
· displayid   · (&(dispif_info[displayid].physicalHeight))  &  0x1fff  ==  4  (thread_info-->preempt_count)   · (&(dispif_info[displayid].physicalHeight))0xc80000000xefff0000 (thread_info
)   3.    4.    5. 2displayid  
· thread_info-->addr_limit0   6. kernelland   7. 4--6   8. kernelRoot  
· task_struct-->cred  

dispif_info
·  dispif_info0xc0000000--0xc3000000   · Mapdispif_info  
· display_id0xA04EC4EC0xA04EC4EC*0x34  ==0x208FFFFFF0  ==  0x8FFFFFF0,0 map  

display_id
· 

A.

thread_info

C.  D. 

B.   E. Kernel


· 1/5  Root   · Panic   ·   
­   



·    ­ dispif_info[displayid].physicalWidth0xbf000000  
­ 100%Root  

· mtk[   ­   
­ 8  

80 

mtk_dispif_info: field ... physicalWidth physicalHeight isConnected lcmOriginalWidth lcmOriginalHeight ...


thread_info:
addr
 0
0xCFE34000
 0
0xCFE34004

0xCFE34008

0xCFE3400C

0xCFE34010

field flags preempt_count addr_limit task exec_domain

isConnect0xbf000000displayid0x4EC4EC5addr_limit0

1/5  Root

Panic
· 80  
· 0Panic   ­   
   · 0Panic  
­ 0  
­ 0panic    

Panic

· 0page80xXXXXX000--0xXXXXX008   ·   

­ metadata     ­    ­  0  
·   
­   

hy_buffer

metadata 

mtk_dispif_info: field ... physicalWidth physicalHeight isConnected lcmOriginalWidth lcmOriginalHeight ...


thread_info:
addr
 0
0xCFE33FF8
 0
0xCFE33FFC

0xCFE34000

0xCFE34004

0xCFE34008
0xCFE3400C
0xCFE34010

field N/A  () N/A() flags preempt_count addr_limit task exec_domain

lcmOriginalHeight0xbf000000displayid0x4EC4EC5  *  3addr_limit0


1. dispif_info   2. displayiddisplayid  
· displayid   · (&(dispif_info[displayid].physicalHeight))  &  0x1fff  ==  0x1ff8  (thread_info)   · (&(dispif_info[displayid].physicalHeight))0xc80000000xefff0000 (thread_info
)   3.    4.    5. 2displayid  
· dispif_info[displayid].physicalHeight   · 0xbf0000005dispif_info[displayid].lcmOriginalHeight0xbf000000,6   6. displayid0x4EC4EC5  *  3,   7. kernelland   8. 4--7   9. kernelRoot  
task_struct-->cred  

· 100%  Root    




· Root   ­   
­   
­ 64  
·    ­ 0

· nforest   · Jfang   · Peter  Hlavaty   · wushi





