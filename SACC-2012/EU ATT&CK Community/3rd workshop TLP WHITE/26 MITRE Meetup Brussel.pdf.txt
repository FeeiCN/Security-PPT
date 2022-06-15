RE://TERNAL C2
MITRE ATT&CK BASED COMMAND AND CONTROL

15 May 2019

Joey Dreijer
 joey.dreijer@ing.com

09-05-2019

WHOAMI
Joey Dreijer Threat Hunter Security Defense Center - ING Bank

Focus 1. Python
 2. Python
 3. ...
 4. Python
 5. "Intensive API abuser" ~ Anonymous @ ING

RE://TERNAL
INTRODUCTION
Command and Control Framework
Scenario/Recipe based Command and Control

API and backend built in Python + Web UI built with VueJS

Agent built in GoLang
 - Cross compiles to Darwin, Linux, Windows, Android, ARM/Raspberry Pi etc

Traditional command/control with additional mapping to ATT&CK Framework
 - Based on Uber's METTA configuration


RE://TERNAL
WHY
Had to find a hobby project (Game of Thrones season ended);
 Not bound to ATT&CK:
 - Still able to use as a traditional CnC;
 More control over what, when and where scenarios or tasks are executed;
 Campaign building made easy via clicky/drag UI;
 Flexibility in native code and OS API's for tasks instead of commandline input;


DEMO

ROADMAP
C UR RE N T LY I N D E V E L OP ME NT
Finalize core project - Traffic encryption via key exchange, code cleanup, bug fixes, ansible playbooks

Automated pivot discovery - Using mDNS/Bonjour to automatically find and relay via other OSX agents

Conditional execution - Execute tasks on agent `X' when agent `Y' returns `Z'

Timeline for tasks execution
Task scoring status - Ability to rate successful execution of tasks vs. failed in mapping


CONFIG SAMPLE
WITHOUT USING SHELL
name: Download latest Game of Thrones Episode author: JD description: Download the latest GoT episode from series-online via builtin Agent HTTP downloader mitre_technique:
id: T1337 platform: Windows commands: - type: read_file input: https://super-illegal-series-online.tk/ Game_of_Thrones_EP8.05-1080P[EN].mp4 sleep: 1

CONFIG SAMPLE
WITHOUT USING SHELL
name: Steal password written on Windows Vista desktop post-it author: JD description: Silly user printed a password on his desktop postit. Create a screenshot and steal the credz mitre_technique:
id: T1113 platform: Windows commands: - type: make_screenshot sleep: 1

9

THANK YOU
Git: https://github.com/d3vzer0/
 Twitter: @joeydreijer

10

