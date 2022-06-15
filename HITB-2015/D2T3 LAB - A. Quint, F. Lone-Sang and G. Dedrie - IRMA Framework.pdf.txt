IRMA
Incident Response & Malware Analysis
Hack in the Box - Amsterdam - 2015
Guillaume Dedrie - Alexandre Quint - Fernand Lone Sang

Agenda
1. Problematic 2. Internals and results 3. A community project 4. Workshop 5. Conclusion

Agenda
1. Problematic 2. Internals and results 3. A community project 4. Workshop 5. Conclusion

Problematic

4

De: admin@chat-k.cat À: me Sujet: Try this one !!!
<3 cats

BestCatScreensaverEver.exe

Problematic

5

Is BestCatScreensaverEver.exe clean?

Solution #1 : scan it with your antivirus.

Problematic

6

Is BestCatScreensaverEver.exe clean?

Solution #1 : scan it with your antivirus. + easy

Problematic

7

Is BestCatScreensaverEver.exe clean?

Solution #1 : scan it with your antivirus.
+ easy + quick (well... often)

Problematic

8

Is BestCatScreensaverEver.exe clean?

Solution #1 : scan it with your antivirus.
+ easy + quick (well... often) - all the security based on one vendor

Problematic

9

Is BestCatScreensaverEver.exe clean?

Solution #1 : scan it with your antivirus.
+ easy + quick (well... often) - all the security based on one vendor

Good but not enough

Problematic

10

Is BestCatScreensaverEver.exe clean?

Solution #2 : send it to a website for scanning

Problematic

11

Is BestCatScreensaverEver.exe clean?

Solution #2 : send it to a website for scanning
+ many sites freely available: virustotal.com avcaesar.malware.lu metascan.com

Problematic

12

Is BestCatScreensaverEver.exe clean?

Solution #2 : send it to a website for scanning
+ many sites freely available: virustotal.com avcaesar.malware.lu metascan.com
+ many antivirus supported

Problematic

13

Is BestCatScreensaverEver.exe clean?

Solution #2 : send it to a website for scanning
+ many sites freely available: virustotal.com avcaesar.malware.lu metascan.com
+ many antivirus supported - one file at a time

Problematic

14

Is BestCatScreensaverEver.exe clean?

Solution #2 : send it to a website for scanning
+ many sites freely available: virustotal.com avcaesar.malware.lu metascan.com
+ many antivirus supported - one file at a time - files are sent on the Internet

Problematic

15

Is BestCatScreensaverEver.exe clean?

Solution #2 : send it to a website for scanning
+ many sites freely available: virustotal.com avcaesar.malware.lu metascan.com
+ many antivirus supported - one file at a time - files are sent on the Internet - scan settings are unknown

Problematic

16

Is BestCatScreensaverEver.exe clean?

Solution #2 : send it to a website for scanning
+ many sites freely available: virustotal.com avcaesar.malware.lu metascan.com
+ many antivirus supported - one file at a time - files are sent on the Internet - scan settings are unknown
Good but not enough

Problematic

17

Is BestCatScreensaverEver.exe clean?

Solution #3 : Open the file #YOLO

Problematic

18

Is BestCatScreensaverEver.exe clean?

Solution #3 : Open the file #YOLO

Problematic

19

Is BestCatScreensaverEver.exe clean?

Solution #3 : Open the file #YOLO

+ opportunity to test your backup/restore procedures

Problematic

20

Is BestCatScreensaverEver.exe clean?

Solution #3 : Open the file #YOLO

+ opportunity to test your backup/restore procedures

No comment

New threats  New tools

21

Companies and public CERT share the same analysis:
Use of a single antivirus is not enough, but antivirus cannot be avoided.
Antivirus are a source of information, among other ones, in the incident response process.

New threats  New tools

22

Companies and public CERT share the same analysis:
Use of a single antivirus is not enough, but antivirus cannot be avoided.
Antivirus are a source of information, among other ones, in the incident response process.
To handle all these sources and gather the most information, a modular, scalable tool which can rely on a community of users/contributors is needed.

Joint initiative

23

IRMA

24

Incident Response & Malware Analysis
· Private file analysis platform · Open source (Apache V2 license) · Customisable

Key features

25

· Private platform: no data ever leaves your network · Analyze files, and not only with antivirus
(24 analyzers available) · Several files simultaneously analyzed · Open source (code hosted on GitHub) · Customizable (API, plugins)

Analysis modules

26

AVIRA GDATA MCAFEE SYMANTEC

EMSISOFT KASPERSKY SOPHOS

ANTIVIRUS

PEiD YARA PE STATIC ANALYSIS

METADATA

AVAST

AVG

BITDEFENDER CLAMAV

COMODO

DrWEB

ESETNOD32 ESCAN

FPROT

FSECURE

MCAFEE

SOPHOS

VIRUSBLOKADA ZONER
ANTIVIRUS

NSRL

DATABASE

VIRUSTOTAL EXTERNAL

Other usage examples

27

· Web API

Other usage examples

28

· Web API · Any client can access it · New usages!

Other usage examples

29

Cleaning kiosk for USB keys

Other usage examples
Cleaning kiosk for USB keys

30 Filter for mail attachments

A few figures

31

· Project started in November 2013. · 3 Quarkslab engineers. · 1 Orange intern for 6 months.
Total: 680 days at the end of 2014 (3 man-years).

Agenda
1. Problematic 2. Internals and results 3. A community project 4. Workshop 5. Conclusion

Global architecture

33

Adding analysers

34

· Each analysis module is a plugin. · Separated in two parts:
- Interface, specific to IRMA - The processing part, which analyses the file. It is independant from IRMA and can
be reused in another project. · Plugins are automatically discovered when a probe is started.

Customizing the results

35

· Each analysis result can be independently filtered. · Plugins are dynamically discovered when the frontend is started. · Results are kept in raw form in the database.

Customizing the results

36

· Each analysis result can be independently filtered. · Plugins are dynamically discovered when the frontend is started. · Results are kept in raw form in the database.

Demo

37

Agenda
1. Problematic 2. Internals and results 3. A community project 4. Workshop 5. Conclusion

Building a community

39

Creating an open source project is good If the project has users, it is better.
If it has contributors, it is even better.

Building a community

40

Creating an open source project is good If the project has users, it is better.
If it has contributors, it is even better.
Need for a simple, deterministic installation system

Installation v1.0

41

ETA: Unknown

Installation v1.1.0

42

ETA: 5 minutes

Installation v1.1.0

43

Installing Vagrant :
https://www.vagrantup.com/downloads.html
Installing Ansible :
$ sudo pip install ansible
Installing IRMA:
$ git clone https://github.com/quarkslab/irma-ansible $ cd irma-ansible $ ansible-galaxy install -r ansible-requirements.yml $ vagrant up

The birth of a community

44

2 contributors, 3 new probes:
· YARA · GDATA for Windows · AVIRA for Windows
HITB challenge:
· Outlook submitter (scan all attachments) · ICAP probe

Agenda
1. Problematic 2. Internals and results 3. A community project 4. Workshop 5. Conclusion

Workshop agenda

46

· PROBE - Create your own probe · PROBE - Integrate it in IRMA · FRONTEND - Add a formatter to customize its output · FRONTEND - API 101

Workshop agenda

47

· PROBE - Create your own probe · PROBE - Integrate it in IRMA · FRONTEND - Add a formatter to customize its output · FRONTEND - API 101

Probe skeleton

48

Probe skeleton

49

python module

Probe skeleton

50

IRMA plugin code

Probe skeleton

51

dependencies

Probe Creation ­ Balbuzard probe

52

Balbuzard - malware analysis tools to extract patterns of interest and crack obfuscation such as XOR
Author: Philippe Lagadec Homepage: http://www.decalage.info/python/balbuzard

Balbuzard 101

53

>> from balbuzard.balbuzard import patterns, Balbuzard >> Bal = Balbuzard(patterns=patterns) >> data = open("./attachment1.exe").read() >> list(Bal.scan(data)) [(<balbuzard.balbuzard.Pattern at 0x7fd37cda23d0>, [(0, 'MZ'), (15320, 'MZ')]), (<balbuzard.balbuzard.Pattern at 0x7fd37cda2410>, [(232, 'PE'), (9541, 'PE'), (50172, 'PE'), (78332, 'PE')]), [...], (<balbuzard.balbuzard.Pattern at 0x7fd37cda2710>, [(27129, 'Pop')])]

Balbuzard probe ­ connect to VM

54

VM ADDRESS ?
Credentials: vagrant/vagrant
SSH TIME
$ ssh vagrant@vm_address -i vagrant_insecure_private_key vagrant@brain:~$

Balbuzard probe ­ level 0

55

Create directory
· Copy Skeleton directory
$ sudo su deploy $ cd /opt/irma/irma-probe/current/modules/metadata $ git clone https://github.com/quarkslab/irma-probe-tutorial balbuzard_analyzer $ cd balbuzard_analyzer $ git checkout origin/balbuzard-level0

Balbuzard probe ­ level 1

56

Update metadata
· Rename all Skeleton in Balbuzard · Update Metadata

Balbuzard probe ­ level 1

57

Update metadata
· Rename all Skeleton in Balbuzard · Update Metadata

$ git diff origin/balbuzard-level1 $ git checkout ­f origin/balbuzard-level1

Balbuzard probe ­ level 2

58

Handle dependencies
· declare module dependencies

Balbuzard probe - dependencies - level 2 59
>> from balbuzard.balbuzard import patterns, Balbuzard
_plugin_dependencies_ = [ ModuleDependency( 'balbuzard', help='See requirements.txt for needed dependencies' ),

Balbuzard probe - dependencies - level2 60
>> from balbuzard.balbuzard import patterns, Balbuzard
_plugin_dependencies_ = [ ModuleDependency( 'balbuzard', help='See requirements.txt for needed dependencies' ),
balbuzard>=0.19

Balbuzard probe - dependencies - level2 61
>> from balbuzard.balbuzard import patterns, Balbuzard
_plugin_dependencies_ = [ ModuleDependency( 'balbuzard', help='See requirements.txt for needed dependencies' ),
balbuzard>=0.19
$ git diff origin/balbuzard-level2 $ git checkout ­f origin/balbuzard-level2

Balbuzard probe ­ level 3

62

Output results
· use analysis module to output interesting results

Balbuzard probe - processing - level3

63

>> Bal = Balbuzard(patterns=patterns) >> data = open("./attachment1.exe").read() >> list(Bal.scan(data))
def __init__(self): module = sys.modules['balbuzard.balbuzard'] patterns = module.patterns self.Analyzer = module.Balbuzard(patterns=patterns)
def run(self, paths): [...] try: started = timestamp(datetime.utcnow()) with open(paths, "rb") as f: data = f.read() res = list(self.Analyzer.scan(data)) response.results = res

Balbuzard probe - processing - level3

64

>> Bal = Balbuzard(patterns=patterns) >> data = open("./attachment1.exe").read() >> list(Bal.scan(data))
def __init__(self): module = sys.modules['balbuzard.balbuzard'] patterns = module.patterns self.Analyzer = module.Balbuzard(patterns=patterns)
def run(self, paths): [...] try:
$ git diff orisgtiarnte/db=altibmuezstaarmdp-(dlaetevteimle3.utcnow()) $ git checkoutw­idthfatoaop=ernfi.(rgpeaiatdnh(/s),b"arbl"b) uaszfa: rd-level3
res = list(self.Analyzer.scan(data)) response.results = res

Test it

65

vagrant@brain:~$ sudo su irma
irma@brain:~$ cd /opt/irma/irma-probe/current
irma@brain:~$ venv/bin/python ­m tools.run_module
irma@brain:~$ venv/bin/python ­m tools.run_module Balbuzard /bin/ls [...] {'duration': 0.03014206886291504,
'error': None, 'name': 'Balbuzard', [...] 'type': 'metadata', 'version': None}

Workshop agenda

66

· PROBE - Create your own probe · PROBE - Integrate it in IRMA · FRONTEND - Add a formatter to customize its output · FRONTEND - API 101

Use it

67

vagrant@brain:~$ sudo supervisorctl restart probe_app probe_app: stopped probe_app: started
vagrant@brain:~$ sudo supervisorctl tail probe_app [...] WARNING:probe.tasks: *** [metadata] Plugin Balbuzard successfully loaded

Job done!

68

Workshop agenda

69

· PROBE - Create your own probe · PROBE - Integrate it in IRMA · FRONTEND - Add a formatter to customize its output · FRONTEND - API 101

Formatter files

70

Balbuzard probe ­ level 0

71

Empty formatter
· Create empty formatter directory · Apply only current formatter to balbuzard probe
$ sudo su deploy $ cd /opt/irma/irma-frontend/current/frontend/helpers/formatters $ git clone https://github.com/quarkslab/irma-formatter-tutorial balbuzard $ cd balbuzard $ git checkout origin/balbuzard-level0

Test it

72

vagrant@brain:~$ sudo supervisorctl restart frontend_api frontend_api: stopped frontend_api: started

Balbuzard probe ­ level 1

73

First shot
· return something
$ git diff origin/balbuzard-level1 $ git checkout ­f origin/balbuzard-level1

Balbuzard probe ­ level 2

74

Exception handling
· catch exceptions in format
$ git diff origin/balbuzard-level2 $ git checkout ­f origin/balbuzard-level2

Balbuzard probe ­ level 3

75

Pretty output
· iterate through results items to pretty print it
$ git diff origin/balbuzard-level3 $ git checkout ­f origin/balbuzard-level3

Use it

76

vagrant@brain:~$ sudo supervisorctl restart frontend_api frontend_api: stopped frontend_api: started

Goal

77

· PROBE - Create your own probe · PROBE - Integrate it in IRMA · FRONTEND - Add a formatter to customize its output · FRONTEND - API 101

Swagger documentation

78

visit http://<vm_address>/swagger

Swagger documentation

79

Agenda
1. Problematic 2. Internals and results 3. A community project 4. Workshop 5. Conclusion

Modular solution to face malware infections81
· File analysis framework. · Private, customisable. · Central brick for incident response. · Various usages.

Contact
http://irma.quarkslab.com - contact@quarkslab.com
https://github.com/quarkslab/irma
@qb_irma #qb_irma@freenode

www.quarkslab.com
contact@quarkslab.com | @quarkslab

