FUZZING

wnswfocwu.sn.csofmocus.com



© 2011 

1 
2  3  4 Fuzzing 5  6  7 

Fuzzing

 (ICS:Industrial Control System)  





  



2011451  



· 2010 Stuxnet45000 
· 2011 Duqu 
· 2012 Flame USB
· 2014 1018Dragonfly
· ......

Industrial Security Incident DatabaseISID

Vulnerability Disclosures Growth by Year

10000 9000 8000 7000 6000 5000 4000 3000 2000 1000 0

1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008

2009

2010



IT


    




IT

ICSPLCRTUDCS  SCADA 

VxWorksuCLinux debian 

(Windows Unix Linux)

(OPC

TCP/IP(HTTP

ModbusDNP3) FTPSMTP)

TCP/IP

 





   

  

 

 IT 

       

1 
2 
3  4 Fuzzing 5  6  7 

Fuzzing

 Modbus ModbusTcp ModbusRTU
S7
PROFIBUS PROFINET
IEC101 IEC104 CANBUS
EtherNet/IP EtherCAT ZigBee


 ModbusTcp ModbusRTUTcpRTU Modbus
     IEC104IEC101   
IEEE802.15.4




  RockWell HoneyWell   DNP3   Niagara 

PLC
Quntom C-300/400 allen-bradley HC950 Inline ProcConOS
Mitsubishi CP/CJ/CS/CQ/CV Fox 


502 102 44818 502 1962 20547 20000 5006/5007 9600 1911 2404


Modbus S7 Ethernet/IP Modbus   DNP3    IEC-104

35000 30000 25000 20000 15000 10000
5000 0


 

1  2 
3 
4 Fuzzing 5  6  7 

Fuzzing

&&
· 
Source Code Review---- ITS4SplintJlint    
· 
----   
 


· 
  ----Fuzzing
  
  



    




ICMP TCPUDP    

1  2  3 
4 Fuzzing
5  6  7 

Fuzzing

· (Fuzzing) 

  

  

 


 

· 

 

  

  

 Fuzzing 






 Fuzz  Fuzzing    

· ----

 
 
  


Modbus\Tcp IEC104 DNP3 TELNET FTP SMTP......
TCP UDP ICMP IP ARP Modbus IEC101 PROFIBUS CANBUS





    


Fuzz
"\t", "\t..............\t", "!" ,"@" ,"#" "$" ,"%" ,"^", "&", "*" "(" ")"......
"%n" "%s""|touch /tmp/SULLEY", "1;SELECT%20*""\xde\xad\xbe\xef"
0,maxvalue,maxvalue/2,maxval ue/4,maxvalue/8 Random length & random data
Certain several datas u want
Static data


 ·   ·   ·   ·   · 



·   

 

·   

 

 

·   

 

·   

DUTDevice Under Test 

 



 
    : 








 
 

1  2  3  4 Fuzzing
5 
6  7 

Fuzzing

Modbus Tcp
Modbus TCP    TCP502   Fuzz  Fuzzing
Ping


· ModbusTcp  Fuzzing++



Fuzzing 



 

2Bytes


2Bytes


2Bytes


1Bytes


1Bytes


N Bytes


0



payload

 
PLC  LED
 
 Fuzz    





 
960|3c0H,

50x0 0x0 0x0 0x0 0x0 0x6 0x0 0x5 0x3 0xc0 0x0 0x0

Fuzzing 

Mbap

FunCode

Data

TransactionID ProtocolFlag PduLength SlaveID Code

data

0

0

6

0

5

0x3 0xc0 0x0 0x0

1  2  3  4 Fuzzing 5 
6 
7 

Fuzzing

ICSScan







 





 ·  ·  · 







 

 

 · IT ·  · IT · 

 PORT502 

ICSScan Fuzzing



 

ICSScan

 

 

 



 





   

1  2  3  4 Fuzzing 5  6 
7 

Fuzzing



Modbus TCP  GB/T 19582.3-2008 Modbus  ModbusTCP/IP IEC-104  DL/T 634.5014 -2009 5-104:IEC 60870-5-101 

 



