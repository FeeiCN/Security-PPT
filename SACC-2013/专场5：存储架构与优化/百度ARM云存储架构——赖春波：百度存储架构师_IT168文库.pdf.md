ARM
 @laichunbo 2013/09/06

Agenda
·  ·  ·  · ARM · 

PCS

PCS
· 2T ·  · APISDK · 
­  ­  ­  ­ ......

PCS

10000 9000 8000 7000 6000 5000 4000 3000 2000 1000 0

700 300

2000 800

12/09 12/12

3800 2200
13/03

6000 3400
13/06

9000 6500
13/09

 10T



  

    





    



10 

    



 

    





    


X86 Dispatch Replica Storage X86 Distributed Replica Storage Arm Distributed Replica Storage Arm Distributed Raid-like Storage

ARM
· 2U 6xNode 10Gbps
­ 4xArm CPU 4x3T SATA 4G Mem

ARMEC
· Reed Solomon Code
­ NDataKParity ­ N+KK ­ Replica ­ 
· Cauchy Reed Solomon Code
­ Bit Matrix ­ Packets

ARMCauchyRS

ARM
k1 offset1 k2 offset2 k3 offset3 k1 v1 k2 v2 k3 v3

ARMBlockSystem

Write A

A0

A1

A2

A3

A0 C0 D3

C3 B1 D2

A2 B0 C2 D1

A3 B2 C1

A1 B3 D0

ARMBlockSystem
Read ( A, 0, 100 )

A0 C0 D3

C3 B1 D2

A2 B0 C2 D1

A3 B2 C1

A1 B3 D0

ARMBlockSystem
Read ( B, 1024, 100 )

A0 C0 D3

C3 B1 D2

A2 B0 C2 D1

A3 B2 C1

A1 B3 D0

ARMBlockSystem

Read ( D, 1024, 100 )

D0

D2

A0 C0 D3

C3 B1 D2

A2 BB00 C2 DD11

A3 B2 C1

A1 B3 D0

ARM

PIS
Write Patch
Log + Temporary Index 3 replicas

Persistent Indexes
LSM-Tree Storage Engine 3 replicas

RBS

Dump

Read

Persistent blocks

ARM
· Master
­ X86 ­  ­ 
· Slave
­ PIS & RBSARM ­  ­ 

ARM
· CPU
­ EC
· 
­ 3G ­ 3G
· 
­  ­ 

ARM
·  ·  · Intel Avaton CPU · TCO

Thanks!

