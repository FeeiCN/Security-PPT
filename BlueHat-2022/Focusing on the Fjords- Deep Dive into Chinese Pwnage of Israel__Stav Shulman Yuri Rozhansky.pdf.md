Focusing on
the Fjords
Stav Shulman and Yuri Rozhansky

Agenda
UNC215 makes Aliyah Patchwork Following the m&m model Compile, panic, evolve repeat Conclusions

Chinese Cyber Space
Global targeting Dozens of threat actors Engaged in espionage, cyber crime and information operations Derived by territorial integrity and expanding global influence

Chinese
Interests in
Israel

Who is UNC215?
Operating since 2014 Low confidence relation to APT27 Global targeting Middle Eastern focus Interests in Government, Health, Technology,
Communication, Finance, Defence

UNC215 Toolkit
One-Day vulnerabilities CHINACHOPPER webshells Distinct loading chain Customized shellcode packer FOCUSFJORD and HYPERBRO backdoors

Raining with a 100% chance of OneDays
We all idolize and focus on ZeroDays We neglect "old" vulnerabilities
"one might think that more recent vulnerabilities would be more common However, as we saw last year, it is actually the older vulnerabilities that are leading the way."
· Verizon 2021-data-breach-investigations-report
"State sponsored actors continue to exploit a collection of older vulnerabilities -- in some cases, more than 5 years old"
· CISA, 2019

Raining with a 100% chance of OneDays
Ponemon-state-of-vulnerability-response 2019

Raining with a 100% chance of OneDays
Ponemon-state-of-vulnerability-response 2019

Raining with a 100% chance of OneDays

POC For Procrastination
CVE-2019-0604 Disclosed in the beginning of 2019 Vulnerability for Microsoft share point servers Allows execution of malicious serialized XML's UNC215 usage
· Starts March 2019, peaks 2020

POC For Procrastination
GET /_layouts/Picker.aspx MultiSelect=False&CustomProperty=User%3B%3B15%3B% 3B%3BFalse&DialogTitle=Select%20People&DialogImage= %2F%5Flayouts%2Fimages%2Fppeople%2Egif&PickerDialo gType=Microsoft%2ESharePoint%2EWebControls%2EPeopl ePickerDialog%2C%20Microsoft%2ESharePoint%2C%20Ver sion%3D14%2E0%2E0%2E0%2C%20Culture%3Dneutral%2C %20PublicKeyToken%3D71e9bce111e9429c&ForceClaims= False&DisableClaims=False&EnabledClaimProviders=&Entit ySeparator=%3B%EF%BC%9B%EF%B9%94%EF%B8%94%E2 %8D%AE%E2%81%8F%E1%8D%A4%D8%9B&DefaultSearc h= 80 MCAP\M34815

Nibbling Inside the Crust
Networks have a fragile outer shell Internal assets are often left behind Monitoring usually applied to main exists and entries only Misconception that nothing can barge in

FOCUSFJORD 101
First stage downloader
Delivered via UNC215's unique loading chain
Never physically written to the disk Safe and stable solution to maintain access to infected EP

FOCUSFJORD 101
Loading chain binaries might
quarantine
Connection between infected
EP and C&C might be blocked

Minimized Outbound Footprint
Custom binary protocol Internal C&C hierarchy 1-2 exit nodes per victim

Minimized Outbound Footprint

Compile, Panic, Evolve, Repeat

Modus Operandi
UNC215 appreciates comfort and have trustworthy malwares
Very capable of operating under pressure and offer quick fixes In special occasions would demonstrate exceptional development skills

The Comfort of The Chain

LeLgeitgBitinBairnyaVrZy

LeLgoitaBdinearryDVLZL

LegitPBainckaerydVZ Shellcode

LFeOgiCt BUinSaFJryOVRZD

LeHgiYt PBiEnRaBryRVOZ

"Signature" Configuration Mechanism
Cleartext configuration block Stored under dedicated registry entry upon first execution For FOCUSFJORD would also encrypt before storing

Quarantine 101
IR investigations Multiple organizations in Israel
· Government related
Super high value targets Operations interrupted
· Quarantine of various binaries

Alert #1
Compiling dedicated utilities during real time FJORDOHELPER
· Access and update FOCUSFJORD registry configuration · Remove FOCOSFJORD persistence and binaries
PROXYFJORD
· Stand alone communication module · Allows decreased number of backdoor instances in the field

Alert #2
Introduction of upgraded HYPERBRO to the field
Quick and dirty fixes
· Replacing vulnerable legit binary · Loader DLL name changed accordingly · Added capabilities to the backdoor

 MISTAKE. .

.

Don't Panic, Take a Deep Breathe
Need to disable Windows Defender and EDRs Looking for solutions to access protected processes Go where all developers in need go to
· Stack Overflow, GitHub

The "aha" Moment

Always Appreciate a Good Vintage

And...It Works!
The Windows Update service entered the stopped state. Event ID 7036
The EDR service terminated unexpectedly. It has done this 1 time(s). The following corrective action will be taken in 5000 milliseconds: Restart the service. Event ID 7031
The Windows Defender service is marked as an interactive service. However, the system is configured to not allow interactive services. This service may not function properly.

Evolution of Bad
High value target Accumulated knowledge of "Stryker" Higher detection rates for FOCUSFJORD and HYPERBRO Development of new module that remains persist in kernel space

Setting Up Evil

Classic UNC215 loading chain routine
Requires prior setup
· Execution begins by a previously installed service
· Payloads should already exist on host's registry
New payload extracted from the shellcode
· Begins the new chain · Decrypts and execute the first registry
entry

Setting Up Evil

Based on "Stryker" with notable changes Responsible for creating and updating log file Extracts shellcode from registry Loads vulnerable driver "cpuz141.sys" Loads abused driver "procexp152.sys",
overwrites dispatch handler
Trigger shellcode ­ loads fileless malicious
driver
Unload drivers

Playground for Filter Managers

User Space

tcpip.sys

Kernel Space

So Safe Much Hidden
Full backdoor injected to lsass.exe Supported communication path
masquerades as legit web server
Magic cookie value Using WFP to inject traffic directly
to TCPSTACK

Same same, but DIFFERENT
Registry stored artifacts Same loading chain ­ host
name-based guardrail
Stealthier backdoor, same
capabilities
Same driver ­ now with more
memory!

Conclusions
China spies on Israel
Global fails for defenders
UNC215 ­ engineers, not researchers
Dedicated resources assigned for Middle Eastern targeting

