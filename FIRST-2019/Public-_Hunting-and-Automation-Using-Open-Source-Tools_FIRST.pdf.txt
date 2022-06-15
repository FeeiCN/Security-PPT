John Holowczak

Brian Baskin

· ·
· ·
©

©

©

©

©

· ·
- ·
©

Reactive
· · ·
©

Proactive
· ·
·

©

©

· · ·
-
©

· Easy to get data from a number of endpoints at scale
· Quickly query data using a common language (SQL)
· Exhaustive list of metadata that is continually growing
©

· May be difficult to deploy across entire environment
· Common orchestration tools can help with this (Ansible, Puppet, Chef)!

· ·
-
·
- - -
©

©

· · ·
©

©

· · · ·
©

©

· · ·
©

·
©

©

· ·
· ·
©

· ·
·
·

©

©

·
- -
·
- -
©

· · · ·
©

· · ·
©

{ "options": { "host_identifier": "hostname", "schedule_splay_percent": 10 }, "schedule": { "arp_cache": { "query": "SELECT * FROM arp_cache;", "interval": 10 } }
}
©

·
©

©

Baseline Filter
Identify
©

Determine the "normal" dataset Eliminate baseline as noise

©

· · ·
©

©

©

SELECT name FROM processes WHERE start_time < 100;
7189 csrss.exe 7189 lsass.exe 7189 conhost.exe
... 2348 dllhost.exe
103 firstboot.cmd 45 FlashPlayerUpdateService.exe 8 psexesvc.exe 3 rund11.exe 1 conh0st.exe
©

·
- -
·
- -
©

·
- - - -
©

· 6 c:\tdm-gcc-64_4.9.2\work\a.exe 1 c:\accbk\agusta\y.bat 1 c:\users\jsmith\appdata\local\microsoft\windows\temporary internet
files\content.ie5\4unu162n\..exe 1 sysvol\users\z9service\downloads\q.exe 1 sysvol\program files (x86)\k2 for sharepoint 2013\z.bat
· 22 c:\windows\psexesvc.exe 1 c:\windows\system32\oem\firstboot.cmd 1 sysvol\windows\system32\dsget.exe 1 c:\windows\system32\hpbpro.exe 1 c:\windows\system32\scardsvr.exe
©

©

Happy Hunting!

40

© 2019 Carbon Black Incorporated. All rights reserved. Carbon Black and CB Predictive Security Cloud are registered trademarks or trademarks of Carbon Black, Inc. in the United States and/or other jurisdictions. All other trademarks and registered trademarks are the property of their respective owners.

John Holowczak

Brian Baskin

