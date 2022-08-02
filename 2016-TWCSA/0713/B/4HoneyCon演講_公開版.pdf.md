 2016.7.13

  
(~2016)

  

/  
Emailrogerliu@cht.com.tw








 
 

 

 



 



E: <T, Subject, Object, Action>

a

b

c

d

S

O

time

S

O

S

O

a b c d

 

 



 Policy
 Sampling


Reference

Time-related


Augmented Intelligence
Enhancement of human intelligence 

1. 

Account Registry
Process Connection

Files
...

...

...

2. 

:Probabilistic Models

25% 192.168.1.2

75% 192.168.1.1

3. 

4. Feedback

-10-



Temporal approach 1. <y, w, v>  z 2. <y>  z

A, B, C: Process x, y, z, w, u, v, z: Files
Causal approach 1. <y, w>z

15~30
JOB: timestamp, user, process, run_user, file_name, file_path, timestamp_schedule FILE: timestamp, user, process, name, path, c_time, m_time, a_time, hash, size

1. Filter
98.4%

Data source: Gold mining in a River of Internet Content Traffic

2. Merge by Time Slot
10~15 

HTTP: timestamp, sip, sport, url, dport, useragent, size TCP: timestamp, user, process, sip, sport, dip, dport, status

Import DLLs Open Files

FILE: timestamp, user, process, file_name, file_path, c_time, m_time, a_time, hash, size

Unknown URL Unknown IP Unknown Process Unknown Executable Unknown Port Unknown DLL Unknown Event ...

Cache DB
 

82.76.29.200 IP 82.76.29.218

Reverse Domain

Register

Certificate

DNS

Domain

...

Email Close IP

ASN IP Geo

Reverse IP

IP

...

Encrypt

C&C

Run key

File name

Encode

Drop folders

Mutex

Malware

...

Data source: http://esl.cmswiki.wikispaces.net/Activities+and+Strategies+--+Cause+and+Effect

·  ·  ·  ·  ·  ·  ·  ·  · ....

Run key C&C

File name
Drop folders/files

Timestamp

Malware

Mutex

Login type Login source

Process Execute
Drop folders/files

Timestamp

Account

Read folder/files



<T, Cause, Effect, Artifact>
FILE: <timestamp, (user, process), (file_name, file_path, c_time, m_time, a_time, hash, size..), MFT> PROCESS: <timestamp, (user, process), (process, file_name, file_path...), PSLIST> ....
HTTP: <timestamp, (user, process), (sip, sport, url, dport, useragent, size...), PROXY> TCP: <timestamp, (user, process), (sip, sport, dip, dport, status..), NETSTAT> ....
malware: <timestamp, (user, process), (file_name, file_path, c_time, m_time, a_time, hash, size..), SANDBOX> ...


  ...

W2

W3

PROXY

PROXY

JOB

P1

F1

PROXY

W1

MFT

PSLIST F3

F2
P2 LISTDLLS

TCP IP1

PROXY W4 WHOIS

JOB: <timestamp, (SYSTEM,AT.exe), SYSTEM, se.exe, c:\\, HH:MM:SS> FILE: <timestamp, (SYSTEM, NULL), (nvdszhk.dll, c:\system\32, c_time, m_time, a_time, hash, size..), MFT> FILE: <timestamp, (SYSTEM, se.exe), (nvdszhk.dll, c:\system\32, c_time, m_time, a_time, hash, size..), MFT>

Associated Rules Link analysis Fuzzy

W3 PROXY
JOB F1

W2 PROXY

PROXY

W1

P1

MFT

PSLIST F3

F2
P2 LISTDLLS

TCP IP1

PROXY W4 WHOIS

Supervised learning  Add/ Adjust the rules



Rule

Abnormal

Domain expert


Modeling

Augmented Intelligence

Data scientist/Domain expert

