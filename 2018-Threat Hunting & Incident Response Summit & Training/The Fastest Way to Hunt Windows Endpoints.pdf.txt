This Is the Fastest Way to Hunt Windows Endpoints
Michael Gough MalwareArchaeology.com
MalwareArchaeology.com

Who am I
· Blue Team Defender Ninja, Malware Archaeologist, Logoholic · I love "properly" configured logs ­ they tell us Who, What, Where,
When and hopefully How
Creator of
"Windows Logging Cheat Sheet", "Windows File Auditing Cheat Sheet" "Windows Registry Auditing Cheat Sheet", "Windows Splunk Logging Cheat Sheet" "Windows PowerShell Logging Cheat Sheet", "Malware Management Framework"
NEW - "Windows HUMIO Logging Cheat Sheet"
· Co-Creator of "Log-MD" ­ Log Malicious Discovery Tool ­ With @Boettcherpwned ­ Brakeing Down Security PodCast
· Co-host of "Brakeing Down Incident Response" podcast · @HackerHurricane also my Blog
MalwareArchaeology.com

Hunting requires some `Back to Basics' to achieve "Totality"
MalwareArchaeology.com

Achieve Totality

Coverage - Asset Management · Can you see every host? · Do you have ghost assets? · Remote systems (Road Warriors) · Powered down VM's/Systems · IP Scan all devices and identify the OS
Completeness - Deployment · Are your agent(s) installed and running properly
Configuration ­ System Settings · Are the systems configured correctly · Enable all that you want and expect

Coverage
Completeness Configuration

MalwareArchaeology.com

We need a Hunting method
MalwareArchaeology.com

What to base a Hunt on?
· So what do we look for ? · What do we base our hunts on?
· Where do we start?
· What is the most extensive list of tactics on the adversaries?
MalwareArchaeology.com

IR Reports
· IR Firms publish their findings
­ Many published on MalwareArchaeology.com ­ I call this Malware Management
· MalwareManagementFramework.org
· Presentations by those of us that have fought and won/lost against advanced adversaries
· These are the best way to get the latest TTP's · Use these TTP's to hunt for · And create a framework to map everything you do with
the tool(s) you use
MalwareArchaeology.com

Mitre Att@ck
Adversarial Tactics, Techniques & Common Knowledge
· This is a good place to start and map all your detection, prevention, and hunt activities to
· Not enough details as to how
­ You will need to map them ­ Or find someone that has, maybe a product(s)
· But most can be mapped to logging for example · Add Log Management · Add some Sysmon or WLS to the logs for more details · Add LOG-MD-Pro, and other tool or script(s) · Add a solution to query the OS ( I love BigFix) · Add Network tools · Fill other gaps
MalwareArchaeology.com

Map them to ATT&CK
· Map the tools you have to the ATT&CK Matrix · This will give you a place to start and a way to
track and rate your activities
MalwareArchaeology.com

Introducing
· The Windows ATT&CK Logging Cheat Sheet · 11 Tactics and 187 Techniques mapped to
Windows Event IDs
MalwareArchaeology.com

Introducing
· The Windows LOG-MD ATT&CK Cheat Sheet
· 11 Tactics and 187 Techniques mapped to Windows Event IDs, LOG-MD, and Sysmon
MalwareArchaeology.com

80/20 rule
· Another VERY important point is we need to ignore or not worry about the 20% that you don't, or can't cover.
· Don't get hung up on the 20% or you will continue to flounder
· Worry about the 80% you CAN or COULD do · You have to learn to walk before you worry about
trying to be, or cover 100% (run) · Being good at 80% should be a goal · You will improve over time as you get better
MalwareArchaeology.com

What to Hunt for
MalwareArchaeology.com

So what to hunt for... quickly
· You basically have two options · Three, if you include network traffic, but that
is not as fast IMHO and you can add this method as you get better and faster and can integrate it into your hunting methodology
­ Part of that 20% I just mentioned
· That leaves two methods you can do quickly
MalwareArchaeology.com

Quick Methods of Hunting
These are two faster methods you can hunt on Windows 1. What is in the logs 2. What is not in the logs
· These items are faster and easier to hunt for and you probably have a tool(s) that can do a lot of it already (e.g. SCCM, BigFix, Humio, Splunk, LOG-MD, Cb, Endgame, scripts, etc.)
MalwareArchaeology.com

The Logs
MalwareArchaeology.com

What is in the Logs
· Event ID's
­ Map them to YOUR ATT&CK Matrix
· But you MUST enable the "Right Stuff" first
­ This is Configuration of the 3 C's ­ 1GB Security Log gets you roughly 1 week of data ­ Some logs will get you a longer period
· Windows Logging Cheat Sheet · Windows Advanced Logging Cheat Sheet · Windows PowerShell Logging Cheat Sheet · And other cheat sheets...
MalwareArchaeology.com

What is in the Logs
· You can hunt them locally if you follow the Cheat Sheet(s)
­ Enabling Process command Line is key ­ Write a script or use a tool like LOG-MD to collect
log data
· Log Management/SIEM is optimal and you will get longer than a week worth of data
MalwareArchaeology.com

What is in the Logs
· Push and run LOG-MD-Pro, PowerShell, or any script or tool can think of to query the logs
· Process Command Line (4688) is a key indicator, New Service (7045), etc.
· There are a lot of Event ID's you can hunt for to indicate things that have happened
· Data in IR Reports and the Cheat Sheets are a place to start for Event IDs and commands
MalwareArchaeology.com

What is in the Logs
· Obvious Log Events such as
­ Suspicious PowerShell events (200-500, 4100-4104)
· obfuscation, web calls, size of block, Base64, etc.
­ Logins (one account to multiple systems) (4624) ­ Process CMD Line ­ e.g. Rundll32 malware.dll (4688) ­ Quantity of Admin commands run in a short period ­ New Task (106) ­ New Service (7045) ­ What process called SeTcbPrivilege (Mimikatz) 4703
MalwareArchaeology.com

Not in the Logs
MalwareArchaeology.com

Non-Logs
· Map them to YOUR ATT&CK Matrix
· Run LOG-MD-Pro or other tool/script to collect things like
­ AutoRuns ­ WMI Persistence ­ Large Registry Keys (Data in a value that is large) ­ Null Byte in the registry (Interesting Artifacts) ­ Sticky Keys exploit (Interesting Artifacts) ­ Locked Files
· Other artifacts from IR reports/Preso's, etc.
MalwareArchaeology.com

Non-Logs
· Use a tool that can query the OS to look for
­ Registry Keys, Values, Data ­ Files and Directories ­ Yes, hashes if you must
· Dates can be stomped, but dates of keys and folders often are not
· And you can look for `created in the last X hours or days' if you compare to prior hunts
MalwareArchaeology.com

Your Goal(s)
· Elimination !!! · Eliminate that you do NOT have some known bad
things, these will get you started, expand from there
­ Malicious AutoRuns ­ Malicious PowerShell ­ WMI Persistence ­ Large Registry Keys
· These four items account for 90+% of all malware we have seen in the past 6+ years
MalwareArchaeology.com

Tools
MalwareArchaeology.com

My Top 10 Hunting Tools
1. Log Management (Splunk, Humio, ELK, Graylog) 2. Query the OS type tool (BigFix ROCKS!) 3. LOG-MD-Pro (details) 4. n/a 5. n/a 6. n/a 7. n/a 8. n/a 9. n/a 10. n/a
MalwareArchaeology.com

Tools to Query the OS
· BigFix · Tanium · SCCM · OS Query · InvestiGator · Grr · PowerShell · Kansa · Old Fashioned scripts · EDR-IR tools (Cb, CrowdStrike, Endgame, Red Cloak, etc.) · LOG-MD-Pro (My personal favorite)
MalwareArchaeology.com

How do I hunt for PS?
· Without Log Management? · Or with it, we consume LOG-MD-Pro logs into
Log Management too
MalwareArchaeology.com

Resources
· Mitre - ATT&CK Framework
­ attack.mitre.org/wiki/Main_Page
· Endgame ­ The Endgame Guide to Threat Hunting
­ https://pages.endgame.com/rs/627-YBU612/images/The%20Endgame%20Guide%20to%20Threat%20Hunting%20%20ebook.pdf
· Sqrrl - Hunt Evil Your Practical Guide to Threat Hunting
­ https://sqrrl.com/media/Your-Practical-Guide-to-Threat-Hunting.pdf
· SANS Poster ­ Find Evil
­ Digitalforensics.sans.org/media/poster_2014_find_evil.pdf
MalwareArchaeology.com

Resources
· Cyb3rWard0g/ThreatHunter-Playbook
­ https://github.com/Cyb3rWard0g/ThreatHunterPlaybook
· beahunt3r/Windows-Hunting
­ https://github.com/beahunt3r/Windows-Hunting
· ThreatHunting.net · ThreatHunting.org · Findingbad.blogspot.com
LOG-MD.COM

Questions?
You can find us at:
· Log-MD.com
· @HackerHurricane · HackerHurricane.com (blog) · MalwareArchaeology.com ­ Cheat Sheets · Listen to the "Brakeing Down Incident Response"
Podcast
­ BDIRPodcast.com
LOG-MD.COM

