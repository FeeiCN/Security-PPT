No Win32_Process Needed
Expanding The WMI Lateral Movement Arsenal
Total Endpoint Protection: #1 in EDR & Next-Gen AV

About Me
o Security researcher ­ Cybereason o @PhilipTsukerman o Probably really stressed out right now
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Outline
o Lateral movement and WMI o New and improved methods o A word about detection
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Lateral Movement
 Lateral
Movement
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Lateral Movement

Phishing/ Exploit/etc

Initial Foothold

Credentials

Target Machine

Total Endpoint Protection: #1 in EDR & Next-Gen AV

Lateral Movement
oAbuses features, not bugs oFeatures mostly work as
intended
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Common LM Methods
o Remote service creation / PSExec
o Remote task scheduling o WMI Win32_Process.Create
Total Endpoint Protection: #1 in EDR & Next-Gen AV

A Bit About WMI
o A Windows feature providing object-oriented representation of applications, devices etc.
o Available remotely (through DCOM and WinRM)
Total Endpoint Protection: #1 in EDR & Next-Gen AV

A Bit About WMI
Mainly variations of "SELECT * FROM Win32_Process"
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Some Example Classes
Total Endpoint Protection: #1 in EDR & Next-Gen AV

WMI, WHAT IS IT MADE OF?
Total Endpoint Protection: #1 in EDR & Next-Gen AV

WMI, What is it made of?
o Winmgmt service o Providers o Repository
Total Endpoint Protection: #1 in EDR & Next-Gen AV

The WINMGMT Service
o A mediator between the WMI model and client applications
Total Endpoint Protection: #1 in EDR & Next-Gen AV

WMI Providers
o Contain the implementations of WMI classes, instances and methods
o Most commonly implemented as COM DLLs
Total Endpoint Protection: #1 in EDR & Next-Gen AV

The WMI repository
o The central storage area for the WMI model
o Contains definitions and instances
Total Endpoint Protection: #1 in EDR & Next-Gen AV

The Win32_Process Class
o Represents a single process on a machine.
o Class has a handy "Create" method
Total Endpoint Protection: #1 in EDR & Next-Gen AV

The Win32_Process Class
Total Endpoint Protection: #1 in EDR & Next-Gen AV

IS THIS ALL?

Total Endpoint Protection: #1 in EDR & Next-Gen AV

WMI Class Derivation
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Class Derivation ­ In Practice
o Create a subclass of Win32_Process, Win32_NotEvilAtAll, which can be done remotely via WMI
o New class has all the methods of the parent o Call "Create" o Win?
Total Endpoint Protection: #1 in EDR & Next-Gen AV

DEMO!

Total Endpoint Protection: #1 in EDR & Next-Gen AV

Total Endpoint Protection: #1 in EDR & Next-Gen AV

Looks Good!
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Almost
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Some Takeaways
Deriving classes without methods works better: no provider method calls
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Some Takeaways
o `SELECT * FROM __InstanceCreationEvent WITHIN 5 Where TargetInstance ISA "SOMECLASS"'
o This also looks at subclasses
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Some Takeaways
o Cloning a class as a stealthier alternative for derivation doesn't work
Total Endpoint Protection: #1 in EDR & Next-Gen AV

WMIIFIYING OLD TECHNIQUES
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Why Even Do this?
o Uses WMI protocols instead of native ones
o Network forensics will look for these in other places
Total Endpoint Protection: #1 in EDR & Next-Gen AV

WMIifying Service Creation
o Win32_Service represents a single service on a machine
o Provides the full capability of sc.exe
Total Endpoint Protection: #1 in EDR & Next-Gen AV

WMIifying Service Creation
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Service Creation - Alternative Classes
o Win32_Service o Win32_SystemDriver o Win32_TerminalService o Win32_BaseService
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Standard Service Creation
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Same Thing, But WMI
Total Endpoint Protection: #1 in EDR & Next-Gen AV

WMIifying Old-Style Scheduled Tasks
o Win32_ScheduledJob represents tasks created by at.exe
o Does not provide the full API of old-style scheduled tasks
Total Endpoint Protection: #1 in EDR & Next-Gen AV

WMIifying Old-Style Scheduled Tasks
Total Endpoint Protection: #1 in EDR & Next-Gen AV

WMIifying Old-Style Scheduled Tasks
o Inability to run tasks directly can be easily overcome
o This method won't work on newer operating systems
Total Endpoint Protection: #1 in EDR & Next-Gen AV

WMIifying New-Style Scheduled Tasks
o The PS_ScheduledTask provides the full API for schtasks.exe tasks
o Only available for Win8+
Total Endpoint Protection: #1 in EDR & Next-Gen AV

WMIifying New-Style Scheduled Tasks
Total Endpoint Protection: #1 in EDR & Next-Gen AV

DEMO!

Total Endpoint Protection: #1 in EDR & Next-Gen AV

Total Endpoint Protection: #1 in EDR & Next-Gen AV

WIN32_PRODUCT

Total Endpoint Protection: #1 in EDR & Next-Gen AV

The Win32_Product Class
o The Win32_Product class manages applications installed on the machine (via msiexec etc.)
o "Install" method allows to install arbitrary MSI files!
Total Endpoint Protection: #1 in EDR & Next-Gen AV

The Win32_Product Class
Total Endpoint Protection: #1 in EDR & Next-Gen AV

The Win32_Product Class
o Metasploit is able to package arbitrary payloads into MSI files
Total Endpoint Protection: #1 in EDR & Next-Gen AV

The Cool Kids Already Use MSI
Total Endpoint Protection: #1 in EDR & Next-Gen AV

DEMO!

Total Endpoint Protection: #1 in EDR & Next-Gen AV

Total Endpoint Protection: #1 in EDR & Next-Gen AV

Less Successful Adventures With Win32_Product
o No way to replicate "msiexec /y"
o Hijacking uninstallers does not work
Total Endpoint Protection: #1 in EDR & Next-Gen AV

EVIL WMI PROVIDERS
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Evil WMI Providers
o WMI providers are where class instances and methods are implemented
o Having your own provider means running code on the machine
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Evil WMI Providers
o Alexander Leary of NETSPI has shown a method to register a provider purely using WMI functions during the last DerbyCon
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Evil WMI Providers ­ Drawbacks
o Need to drop a file on the machine
o Actually writing a WMI dll sucks
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Evil WMI Providers
o We want to have our provider just be an arbitrary command line
Total Endpoint Protection: #1 in EDR & Next-Gen AV

What Needs To Be Done
o Create a COM object o Register a new provider o Somehow load the provider
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Creating a COM Object
o Create an OOP COM object inserting a new entry in the registry
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Registering Providers
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Registering Providers
o Creating an instance of __Win32Provider is enough
o CLSID and HostingModel fields allow to choose any type of COM object to be registered
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Loading The Malicious Provider
o Normally, a provider is loaded on demand
o Our arbitrary executable does not implement classes, and cannot be loaded this way
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Loading The Malicious Provider
o The MSFT_Providers class has a method called "Load", which loads any WMI provider regardless of demand
Total Endpoint Protection: #1 in EDR & Next-Gen AV

The Msft_Providers Class
Total Endpoint Protection: #1 in EDR & Next-Gen AV

The Msft_Providers Class
o The "Load" method checks if the __Win32Provider is registered correctly, and calls
"CServerObject_RawFactory::CreateInstance"
Total Endpoint Protection: #1 in EDR & Next-Gen AV

CServerObject_RawFactory::Create Instance
Total Endpoint Protection: #1 in EDR & Next-Gen AV

CServerObject_RawFactory::Create Instance
o Checks the LocalServer32 key under the relevant CLSID
o Runs the command line o Tries to query the relevant interfaces o Fails o Everything is fine because we don't
really care about the COM stuff at all
Total Endpoint Protection: #1 in EDR & Next-Gen AV

A Bit About Stealth
o The "SelfHost" hosting model runs as SYSTEM, but leaves a nasty entry in the event log
o NetworkServiceHostOrSelfHost defaults to SelfHost without a log write
Total Endpoint Protection: #1 in EDR & Next-Gen AV

A Bit About Stealth
Total Endpoint Protection: #1 in EDR & Next-Gen AV

DEMO!

Total Endpoint Protection: #1 in EDR & Next-Gen AV

Total Endpoint Protection: #1 in EDR & Next-Gen AV

BONUS: MESSING WITH BOOT CONFIGURATION
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Messing With Boot Configuration
Total Endpoint Protection: #1 in EDR & Next-Gen AV

Messing With Boot Configuration
o The BCDObject class allows to manipulate entries in the BCD store, such as winload.exe
o This allows an attacker to remotely manipulate the Windows loading process
Total Endpoint Protection: #1 in EDR & Next-Gen AV

How To Mess With Boot Config Via WMI
o Open the system BCD using an instance of the BCDStore class
o Open the BCDObject related to winload.exe o Switch winload.exe with calc.exe, as you
haven't really written a compatible bootkit o Wait for the machine to restart o Ponder your life choices as the victim
machine is stuck in a very understandable boot loop
Total Endpoint Protection: #1 in EDR & Next-Gen AV

DEMO!

Total Endpoint Protection: #1 in EDR & Next-Gen AV

Total Endpoint Protection: #1 in EDR & Next-Gen AV

DETECTION

Total Endpoint Protection: #1 in EDR & Next-Gen AV

A Bit About Detection
o The WMI-Activity ETW provider is a great source of information
Total Endpoint Protection: #1 in EDR & Next-Gen AV

A Bit About Detection
o Another great method is WMI introspection, using WMI queries to audit WMI
'SELECT * FROM __InstanceCreationEvent WITHIN 5 Where TargetInstance ISA "__Win32Provider"'
Total Endpoint Protection: #1 in EDR & Next-Gen AV

A Bit About Detection
o Some software (and hardware) vendors add classes and providers to WMI, expanding the attack surface
o Knowing what WMI providers and classes exist on your machines will only do you good
Total Endpoint Protection: #1 in EDR & Next-Gen AV

THANK YOU!

Total Endpoint Protection: #1 in EDR & Next-Gen AV

