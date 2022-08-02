P2C


1. K12 2.  3. P2C 4.  5. SaaS 6.  7. 



   Lync InfoQ  

    

K12
 
 


 11 
 





LAMP

SOA

 

         Shard

  
 SLA 
 

 



P2C








  

  4   2





 


 


   

 + 
  +  + 


 

+

 



 





+ App

/ PC / +



 

PC

App 



 Lambda

 
APP 
 


Data Collect Layer Flume +Kafka

SpeedReal Time Layer Storm+ Redis
Batch Layer MapReduce/H
ive +HDFS

Lambda

Service



 



+

  


+ + Recall



Recall

  


GBDT  


 













·  ·  ·  ·  · 



·  ·  · 

·  ·  · 

·  ·  ·  ·  · 



LR->

   

/

[200-300) [100-200)
[0-100)

[300-400) [400-500]

 

SaaS



CRM
 AIDMA

IP/


  



...





400 







IDC A

 

A

IDC B

B

 

  




 



 

C

  





 IDC C



    + HTTP DNS

   H264+OPUSRTMPHLS

Media Stack

Audio Stream

AEC

NS

 AAGC/DA



GC



CNG

Encode

Audio Engine

Video Stream
Video Processing
Software Encode
Hardware Encode Video Engine

RTP/SRTP

Device Manager
QC

Audio Stream
Healer
Jitter Buffer
Decode Audio Engine

Video Stream
Video Processing
Software  Decode 
 Hardware Decode
Video Engine

RTP/SRTP

Transport

Transport


1.   2. FECJitter BufferAudio Healer
 3. Real Time ThreadGPU


·  · 
 

 

 

·  ·  · 


  


1. USBType C + USB 2.  3. 
 4.  5. 40410





+



+(vs PPT + )


1. ROI 2. KISS(Keep It Simple Stupid)Over Design 3.  4.  5. 8/22

