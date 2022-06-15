SESSION ID: KEY-T06S
Top 10 ways to make hackers excited: All about the shortcuts not worth taking
Paula Januszkiewicz
CQURE: CEO, Penetration Tester / Security Expert CQURE Academy: Trainer MVP: Enterprise Security, MCT Microsoft Regional Director Contact: paula@cqure.us | http://cqure.us

@paulacqure @CQUREAcademy
#RSAC

#RSAC

#RSAC
Technical systems are: Reviewed Scanned
Penetration Tested So?

#RSAC

#RSAC
1st Way: Disabling firewall / misconfigured network access
Key learning points:
 Windows Firewall is often misconfigured  Firewall is a great segmentation tool  You can allow only certain processes to communicate
with the Internet or locally  No need to know processes to block them, you can
operate on the services list
In Windows Firewall there are couple of things missing: x Filtering by the group of computers x Detailed logging for network traffic x Expandability ­ there are not many options x No correlation in between process and network traffic
­ whose role is this?

#RSAC
Demo: File download + DNS Exfiltration

#RSAC
2nd Way: Overly simple passwords and security questions
Key learning points:
 Almost always there are passwords reused  Almost always (ekhm... always) there is some variant of
company name and some number (year, month etc.)  It makes sense to check for obvious passwords and
continuously deliver security awareness campaigns
Typical password locations
NTDS.dit, SAM Configuration files Registry Memory dumps, Hiberfil.sys Databases (DPAPI ?)

#RSAC
Demo: Simple checks needed

#RSAC
3rd Way: No network segmentation
Key learning points:
  
 
x
x x
No-brainer or unseen network security threat?

#RSAC
Demo: ARP Spoofing on Windows

4th Way: Lack of SMB Signing (or alternative)
Key learning points:
 Set SPNs for services to avoid NTLM: SetSPN ­L <your service account for AGPM/SQL/Exch/Custom> SetSPN ­A Servicename/FQDN of hostname/FQDN of domain domain\serviceaccount  Reconsider using Kerberos authentication all over https://technet.microsoft.com/en-us/library/jj865668.aspx  Require SPN target name validation Microsoft network server: Server SPN target name validation level  Reconsider turning on SMB Signing  Reconsider port filtering  Reconsider code execution prevention but do not forget
that this attack leverages administrative accounts

#RSAC

#RSAC
Demo: SMB Relay

5th Way: Allowing unusual code execution
Key learning points:
Common file formats containing malware are:  .exe (Executables, GUI, CUI, and all variants like SCR, CPL etc)  .dll (Dynamic Link Libraries)  .vbs (Script files like JS, JSE, VBS, VBE, PS1, PS2, CHM, BAT, COM, CMD etc)  .docm, .xlsm etc. (Office Macro files)  .other (LNK, PDF, PIF, etc.)
If SafeDllSearchMode is enabled, the search order is as follows: 1. The directory from which the application loaded 2. The system directory 3. The 16-bit system directory 4. The Windows directory 5. The current directory 6. The directories that are listed in the PATH environment variable

#RSAC

#RSAC
Demo: Sneaky code runs

6th Way: No whitelisting on board
Key learning points:
 Code execution prevention implementation is a must  PowerShell is an ultimate hacking tool, possible solutions:
block it for users, use Just Enough Administration etc.  Verify where users have write access to: accesschk.exe ­w
.\users c:\windows  AppLocker can run in the audit mode
x AppLocker is great but not with the default configuration
Machine learning for threat protection:  Modern solutions are capable of machine learning but it
takes time  Modern solutions are quire easy to implement bur require a
lot of understanding of what do they actually do ­ your call

#RSAC

#RSAC
Demo: Shares under pressure

#RSAC
7th Way: Old protocols or their default settings

#RSAC
Demo: Injection for TDS

#RSAC
8th Way: Trusting solutions without knowing how to break them
Key learning points:
 The best operators won't use a component until they know how it breaks.
 Almost each solution has some `backdoor weakness'  Some antivirus solutions can be stopped by SDDL
modification for their services  Configuration can be monitored by Desired State
Configuration (DSC)  DSC if not configured properly will not be able to spot
internal service configuration changes
Example: how to I get to the password management portal?

#RSAC
Demo: Sysmon Under Pressure

#RSAC
9th Way: Misusing service accounts + privileged accounts
Key learning points:
 gMSA can also be used for the attack  Service accounts' passwords are in the registry, available
online and offline  A privileged user is someone who has administrative
access to critical systems  Privileged users have sometimes more access than we
think (see: SeBackupRead privilege or SeDebugPrivilege)  Privileged users have possibility to read SYSTEM and
SECURITY hives from the registry Warning! Enabling Credential Guard blocks:
x Kerberos DES encryption support x Kerberos unconstrained delegation x Extracting the Kerberos TGT x NTLMv1

#RSAC
Demo: Service Accounts + Passwords

10th Way: Falling for hipster tools
Key learning points:
 Worldwide spending on information security is expected to reach $90 billion in 2017, an increase of 7.6 percent over 2016, and to top $113 billion by 2020, according to advisory firm Gartner
 With increasing budget the risk of possessing hipster tools increases too ­ do we know where these tools come from and what are their security practices?
 Lots of solutions where not created according to the good security practices (backup software running as Domain Admin etc.)
 Each app running in the user's context has access to secrets of other apps ­ Data Protection API
 Case of CCleaner

#RSAC

#RSAC
Demo: KeePass Under Pressure

#RSAC
Summary: 10 ways to make hackers happy
Short term
Isolate infrastructure components so that in case of attack they prevent spreading Engage with the network security guys Review servers' and workstations' configuration periodically
Medium term
Put on the Hacker's Shoes External + Internal + Web Penetration tests Configuration reviews
Long term
Prevention and Vulnerability Management Start implementing the monitoring and execution prevention

Session Summary and Tools: https://cqu.re/keynotersa

Thank you!
Paula Januszkiewicz paula@cqure.us http://cqure.us
@paulacqure @CQUREAcademy

