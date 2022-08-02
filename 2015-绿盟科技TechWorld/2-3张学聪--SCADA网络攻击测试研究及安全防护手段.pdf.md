 SCADA

 

1. 
SCADA



1.1 
 
Internet   

1.1 
 
 
 PC  PLCHMI  
 
       

1.2 SCADA
 SCADA
  
 
 

2. SCADA
SCADA

SCADA

2.1 SCADA
 RTU--

 IED--
 
 PLC--  HMI--

SCADA SCADA   
PLC    / 
HMI PLC    ,

2.2 SCADA
 OPC-OLE  ICCP-  Modbus-  DNP3-3

OPC
1OPCwindows 2OPC/ 3OPCPLCOPC 4OPCHMI 5OPCOPC

Internet/Ethernet OPC Windows NT

Ethernet OPC Windows NT





HMI/SCADA Data Acquisition







DeviceNet FOUNDATON PROFIBUS

N

N

 I/O

N






N

N

N

PLC



HMI

Excel

OPC Client

OPC Client

OPC Server HMI
Fieldbus System

Measurement -Pressure -Temp -Flow -Level

Valves

PID Control

Positioners

OPC Server SCADA

N

N

N

N

N

N

N

N

N

FieldPoint System

Internet OPC Client
OPC Server SCADA
PLC System

OPC

Display Application
OPC

Trend Application
OPC

Report Application
OPC

OPC
Software Driver

OPC
Software Driver

OPC
Software Driver

OPC
Software Driver

ICCP
 ICCP  WAN  


Modbus
 Modbus   Modbus /  


Modbus

01



02



03



04



05



06



07



15



16



17

ID

DNP3
   /

 SCADARTUIED
DNP3

3. SCADAFUZZING
FUZZINGSCADA

Fuzzing
 Fuzzing


3.1 AutodafeSCADAfuzzing

 Modbus06Write  1.wireshark06Modbus Write  2.wiresharkPDML
Autodafe
 3.PDML2ADPDMLAutodafe  4.cat Modbus_query_write.ad  5.ADCmodbus_query_write.ad

3.1 AutodafeSCADAfuzzing
 AUTODAFE :fuzz .adc  fuzz 

3.1 AutodafeSCADAfuzzing
 4000ERROR:BAD_ENDERSegmentation fault

3.2TFTP Daemon Fuzzer SCADA fuzzing
 TFTP Daemon FuzzerCBC
CBCIED
 TFTPNet::TFTP  TFTPfuzzwireshark
ping


 TFTPfuzzingCBCITU

4. 
Stuxnet

Stuxnet
 PLC  0day
     WindowsPLC rootkit
 



 SIMATIC WinCCSCADA



Windows

 Stuxnet

· Windows 2000Windows Server 2000

· Windows XPWindows Server 2003

· Windows Vista

· Windows 7Windows Server 2008

Windows NT





· SIMATIC WinCC 7.0



· SIMATIC WinCC 6.2

5. SCADA










   

 



 

XX 
 





 

4G

 

 

  

SSL VPN

  




 



 

  

   

  



 

XX    





 SSL VPN
  



DMZ 




 

4G

 

 

  



SCADA
   ACL  MAC  VLAN  SCADA  USB  SCADAIDS/IPS    
   

SCADA
 SSHDNPsecTLSDTLS
SSLPKIIPsec
 

 SIEM

 IPSIDS




