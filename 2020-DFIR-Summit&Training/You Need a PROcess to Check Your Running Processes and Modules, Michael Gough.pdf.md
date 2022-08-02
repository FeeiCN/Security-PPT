You need a PROcess to check your running processes and modules. The bad guys, and red teams are
coming after them!
Michael Gough ­ Principal NCC Group Founder MalwareArchaeology.com & IMFSecurity.com
MalwareArchaeology.com

Who am I
· Blue Team Defender Ninja, Malware Archaeologist, Logoholic and Principal Incident Response Engineer for
· I love "properly" configured logs ­ they tell us Who, What, Where, When and hopefully How
Creator of
"Windows Logging Cheat Sheet" "Windows File Auditing Cheat Sheet" "Windows Registry Auditing Cheat Sheet" "Windows Splunk Logging Cheat Sheet" "Malware Management Framework"
· Co-Creator of "Log-MD" ­ Log Malicious Discovery Tool · And co-host of "THE Incident Response Podcast"
MalwareArchaeology.com

Why this talk?
MalwareArchaeology.com

Fileless in memory only malware
· To address this expanding threat that is becoming more and more common, too common
· Commodity malware, Red Team engagements, and of course APT attackers use it
· This method can avoid many security tools
MalwareArchaeology.com

Let's rethink or redefine
Fileless Malware
MalwareArchaeology.com

Rethinking Fileless Malware
· Fileless Malware that can only be found in the memory of a running system (Malware + Memory = Memware)
· No files can be found if you scan the disk while the system is running
­ Or are very short lived, just long enough to load (bypasses FIM)
· Typical infection vectors are:
­ Injection ­ Dll side-loading/Hijacking ­ Process Hollowing ­ Download source code and compile on the fly, .NET, JSC ­ User double-click, etc.
· "Fileless" malware, the file lives somewhere, so lets do a better job guiding people where to look for signs of it
MalwareArchaeology.com

Other Fileless Malware types
· Regware ­ Malware payload is stored in the registry with an autorun/ASEP that calls and loads it into memory (Malware + Payload in Registry = RegWare)
· WMIware - Malware payload is stored in the WMI database with an autorun/ASEP that calls and loads it into memory (Malware + Payload in WMI database = WMIWare)
· PowerShellware - Malware payload is in the form of PowerShell scripts, downloaded or stored somewhere on the fly with an autorun/ASEP that calls and loads it into memory (Malware + Payload in PowerShell = PowerShellWare)
· Compileware ­ Malware payload is not yet compiled, stored anywhere with an autorun/ASEP that calls and loads it into memory (Malware + Payload compiled on the fly = CompileWare)
· Downloadware ­ Autorun/ASEP calls out to the Internet to download malware payload or source code that is then compiled and loads it into memory (Malware + Payload downloaded each time = DownloadWare) maybe LOLBASWare ;-)
MalwareArchaeology.com

Autoruns/ASEP
· Keep in mind...
­ Not all malware will have an autorun/ASEP
· Latest TrickBot on Domain Controllers · Especially the Red Team, doesn't like to leave IOCs
­ Or, the autorun is created on shutdown, then deleted on startup once the malware loads
· Nothing found when doing live triage/analysis (Dridex)
­ So what is in memory may be all that we can see
MalwareArchaeology.com

Latest TrickBot
PaloAlto Unit 42 - https://unit42.paloaltonetworks.com/goodbye-mworm-hello-nworm-trickbot-updates-propagation-module/ MalwareArchaeology.com

So how do we find this stuff?
MalwareArchaeology.com

MITRE ATT&CK
· First - Everything you do should be mapped to MITRE ATT&CK - https://attack.mitre.org/
· Some of the techniques used
­ T1500 ­ Compile After Delivery ­ T1127 - Trusted Developer Utilities ­ T1055 ­ Process Injection ­ T1196 ­ Control Panel Items ­ etc
· Sub-techniques are coming !!! https://www.jaiminton.com/mitreatt&ck
MalwareArchaeology.com

We need a PROcess
· We need to create a PROcess to start looking for this condition
· Tools are just not preventing this technique · We need to build this PROcess into our
hourly/daily/weekly/monthly routines to detect and alert for this technique · We need to build this PROcess into our daily/weekly/monthly/yearly routines to Threat Hunt for this technique
MalwareArchaeology.com

Finding Memware
· Traditional forensics has us dumping a memory image and running tools like Volatility against it
· Logs can contain a lot of details that can alert you to this behavior, IF you collect THEN detect OR hunt
­ Process command line is KEY to catching these attacks
· Checking running processes and their modules on a live system is a GREAT option
­ Better yet look for signs of injection !!
· Look for the other artifacts, autorun/ASEP, registry keys storing scripts and/or payloads, WMI databases storing scripts and/or payloads, and odd PowerShell, large blocks, obfuscation, etc.
MalwareArchaeology.com

Examples
· Kovter injects into SvcHost 32bit · Qakbot · Dridex
MalwareArchaeology.com

Extracted Files LOG-MD & Volatility
· QakBot · Kovter · Dridex
· Evaluated with LOG-MD B9 module
MalwareArchaeology.com

Examples
· They can call out to the Internet to download the code to compile, or fetch the malware so it does not live on disk. Some examples:
­ CobaltStrike and Sythe custom malware packages ­ LoLBins/LoLBas ­ Rundll32, Regsvr32, Regasm, etc.
· https://github.com/LOLBAS-Project/LOLBAS
­ Compilers - Csc.exe, MSBuild.exe, JSC.exe, etc. ­ May write to disk on shutdown, delete on startup
MalwareArchaeology.com

CSC.exe example
· <random.cs> · <random.cmdline> · Csc.exe /noconfig /fullpaths @
https://blog.didierstevens.com/2019/10/15/powershell-add-type-csc-exe/
MalwareArchaeology.com

Control Panel Applets
· .CPL files are all those Control Panel applets
­ Rundll32 C:\<whateverdir>\Fakejava.cpl
· Launches a bad Dll into memory - LOLBIN · .cpl files load all the time, so it's noisy · 3rd party applets are not well signed · Many EDRs do not alert on this method · The Red Team LOVES this method - CobaltStrike
MalwareArchaeology.com

Monitoring for and
Threat Hunting
MalwareArchaeology.com

Monitor for & Threat Hunting
· We need to develop a PROcess to monitor/detect for and/or Threat Hunt for signs of these techniques
· Step 1
­ Enable the data ­ Configure logs per the Windows Logging Cheat
Sheet(s) ­ Enable to collect `Process Command Line'
· Step 2
­ Create detections for many of these techniques ­ Process command line is KEY.. It's in the parameters
MalwareArchaeology.com

Monitor for & Threat Hunting
Step 3 · Come up with a PROcess to scan Running
Processes and their loaded Modules
­ Detect these memory only infections ­ This should be both for regular detection and for
Threat Hunting ­ Watch for indications of injection
MalwareArchaeology.com

Monitor for & Threat Hunting
Strings · Maybe a PROcess to scan strings for API calls such as;
­ OpenProcess ­ VirtualAlloc ­ VirtualAllocEx ­ WriteProcessMemory ­ LoadLibrary ­ LoadLibraryA ­ CreateRemoteThread ­ ResumeThread ­ ReflectiveLoader() ­ OpenProcess ­ GetProcAddress ­ CreateProcess ­ ZwUnMapViewOfSection ­ NtUnmapViewOfSection ­ GetThreadContext ­ SetThreadContext ­ ResumeThread
MalwareArchaeology.com

LOLBINS/LOLBAS that can download

· powershell.exe · bitsadmin.exe · certutil.exe · psexec.exe · wmic.exe · mshta.exe · mofcomp.exe · cmstp.exe · windbg.exe · cdb.exe · msbuild.exe · csc.exe · regsvr32.exe · Excel too !!!

Short list per Cisco Talos · mshta.exe · certutil.exe · bitsadmin.exe · regsvr32.exe · powershell.exe
Process Command Line is KEY Map to MITRE ATT&CK
https://blog.talosintelligence.com/2019/11/hunting-for-lolbins.html
MalwareArchaeology.com

Best options for PROcess tools
· Log Management is your BEST friend here
­ If you have, and can afford to put agents on all your endpoints and collect the needed data
· If not, then you will need a PROcess to manually check running process, their modules and signs of injection
· LOG-MD-Premium, Systeinternals, Sysmon ID 8 & 10, using WinRM and ARTHIR, Memory dump with Volatility are possible options
MalwareArchaeology.com

CONCLUSION
MalwareArchaeology.com

Conclusion
· Create a PROcess to look at running processes and their modules
· Look for signs of injection · Log the process command line execution · Monitor for the executions discussed in this
presentation
MalwareArchaeology.com

Some tools to consider
Please let me know of any others
· LOG-MD-Premium
­ Running Process and Modules, Injection, and B9 static file analysis
· Volatility
­ https://www.volatilityfoundation.org/ ­ HollowFind Plugin (Win 10 compatible?)
· https://github.com/monnappa22/HollowFind
· PESieve (Opensource)
­ https://github.com/hasherezade/pe-sieve
· Get-InjectedThread.ps1
­ https://gist.github.com/jaredcatkinson/23905d34537ce4b5b1818c3e6405c1d2
· PSReflect
­ https://github.com/mattifestation/PSReflect
MalwareArchaeology.com

Some tools to consider
Please let me know of any others
· GRR
­ https://github.com/google/grr
· Rekall
­ http://www.rekall-forensic.com/home
· InVtero
­ https://github.com/ShaneK2/inVtero.net ­ https://github.com/seancomeau/inVtero.net
· MemHunter (Old, requires .NET 3.5)
­ https://github.com/marcosd4h/memhunter
MalwareArchaeology.com

Resources
· Red Canary Presentation
­ ATT&CK Deep Dive: Process Injection
· Article on MITRE ATT&CK Sub-Techniques (coming soon)
­ https://medium.com/mitre-attack/attack-sub-techniquespreview-b79ff0ba669a
· DeepInstinct - Process Injection and Manipulation
­ https://www.deepinstinct.com/2019/09/15/malware-evasiontechniques-part-1-process-injection-and-manipulation/
· EndGame ­ Hunting in Memory
­ https://www.slideshare.net/JoeDesimone4/taking-hunting-tothe-next-level-hunting-in-memory
MalwareArchaeology.com

Resources

· Websites
­ Log-MD.com ­ ARTHIR.com

The tool Free on GitHub

· The "Windows Logging Cheat Sheet(s)"
­ MalwareArchaeology.com

· This presentation and others on SlideShare
­ Search for MalwareArchaeology or LOG-MD

LOG-MD.COM

Questions?
You can find us at:
· Log-MD.com · @HackerHurricane · MalwareArchaeology.com
LOG-MD.COM

