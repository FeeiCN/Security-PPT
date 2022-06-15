SESSION ID: OST-T11
Open Source Tooling for Threat Analysis and Attack Surface Management
Rey Bango & Gabe Stocco
Microsoft Corporation
#RSAC

#RSAC

Mark Russinovich Chief Technology Officer Microsoft Azure

Keynote: Collaborating to Improve Open Source Security: How the Ecosystem Is Stepping Up Session ID: KEY-F02S
Moscone South
February 28, 2020 9:50am ­ 10:40am

2

#RSAC
State of the Octoverse Report 2018
Source: https://datastudio.google.com/u/0/reporting/0ByGAKP3QmCjLU1JzUGtJdTlNOG8/page/Q3DM
5

#RSAC
State of the Octoverse Report 2018
6

#RSAC
8

#RSAC
GitHub Data To-Date
Source: https://datastudio.google.com/u/0/reporting/0ByGAKP3QmCjLU1JzUGtJdTlNOG8/page/Q3DM
9

#RSAC
OSS Projects @ Microsoft

Visual Studio Code TypeScript Microsoft Edge

PowerShell The Windows Terminal Webhint

10

#RSAC
Attack Surface Analyzer msticpy - Jupyter and Python Security Tools
11

#RSAC
Attack Surface Analyzer

#RSAC
Attack Surface Analyzer 2
· Microsoft Attack Surface Analyzer (ASA) detects system configuration changes resulting from software installations*
· ASA 2 is a rewrite of the original tool available since 2012 that has helped IT professionals secure their systems for years
· Now includes support for Windows 10, Linux and macOS · Released in April 2019 as Open Source on GitHub
13

#RSAC
System Attack Surface Risks
· File System ­ malicious or inadvertent changes can corrupt system files that make up key functions of your system or grant access to private data
· User Accounts ­ persistent rogue elevated accounts can grant access to hijack your system
· System Services ­ background processes may be introduced that perform rogue operations like capturing sensitive data and even shut down existing key security modules
· Network Ports ­ can expose your system to unknown remote entities · Digital Certificates ­ determine what remote domains and package signatures are
trusted · Registry ­controls system startup actions, device drivers, services, and more
14

Attack Surface Analyzer Coverage
Each one requires special tools and knowledge to identify changes made
System Attack Surface

COM Events Groups Firewall Services Accounts Ports

Files

Certs Registry

#RSAC

Microsoft Attack Surface Analyzer Reports Help
15

#RSAC
Using Attack Surface Analyzer
1. Create a base or initial scan on a clean system.
2. Install and run your product or application.
3. Take another scan.
4. Use the results analysis to identify system changes
16

#RSAC
ASA Demo

#RSAC
Built for Everyone
· Microsoft uses the Attack Surface Analyzer as part of our security development lifecycle practices (SDL)
· The classic version of the tool is still available with limited Windows support
· Attack Surface Analyzer 2.1 runs on Windows 10, Linux, and macOS
· Command line and browser based GUI interfaces.
18

#RSAC
Typical Users
DevOps Engineers that want to reduce the system attack surface introduced by their own software IT Security Auditors that want to evaluate risks from third-party software
19

#RSAC
Attack Surface Analyzer 2.1

· Collects Many Different Verticals

 Firewall settings

 Files

 System Services

 Registry

 System Logs

 Network Ports

 COM Objects (Windows)  Users and Groups

· New user defined analysis rules system
 Define analysis rules on any collected field using choice of operator

· Default ruleset
 e.g. flags executables without ASLR enabled  Community contributions for default rules are encouraged.

· Docker-based detonation chamber available

20

#RSAC
Other tools from Microsoft Security
· Application Inspector reports on what types of functionality source code implements allowing you to identify any unexpected functionality. · Github.com/Microsoft/ApplicationInspector
· DevSkim is a security linter available as an extension for both Visual Studio and Visual Studio Code. · Github.com/Microsoft/DevSkim
21

#RSAC
msticpy
AKA MSTIC Jupyter and Python Security Tools

#RSAC
What is msticpy?
· Python tools for security investigations and hunting · Built for interactive Jupyter notebook environment · Addresses the following needs:
· Data Acquisition · Data Enrichment · Data Analysis · Visualization
· Open source and agnostic to the data source
23

#RSAC
Why use Jupyter for Security Investigations?
· Access to sophisticated data processing, machine learning and visualization
· Extends & complements SIEM dashboards and data · Pull external data into your investigation · Offers fine-grain capabilities · Scripting and programming environment for repeatability · Auto-saves your investigation into shareable HTML document
24

#RSAC
4 Core Aspects of msticpy
· Data Acquisition
· Single-line parameterized functions vs. complex queries · Results are returned as pandas DataFrames
· Data Enrichment
· Dig granularly into data (e.g.: IP geolocation) · Connect to threat intel providers like VirusTotal, OTX, X-Force
· Visualization
· Methods for plotting, building timelines, GeoIP mapping & more
25

#RSAC
4 Core Aspects of msticpy
· Data Analysis
· Reshape data to gain new insights
· IOC extractor ­ extract IP addresses, URLs, hashes, etc. from data · Decode/unpack obfuscated data from base64, zip, tar, etc.
· Search for specific patterns · Cluster events to find unusual activity · Automate these to streamline workflow ­ pandas DataFrames make it
easy to chain acquisition->enrichment->analysis->visualization components
26

#RSAC
msticpy Demo

#RSAC
Call to Action
Use Microsoft Attack Surface Analyzer 2.0 as part of your secure development lifecycle
­ Get it at: https://github.com/Microsoft/AttackSurfaceAnalyzer
Start analyzing your threat data with msticpy & Jupyter Notebooks
­ msticpy Project: https://github.com/Microsoft/msticpy
Contribute back:
­ Help shape the projects by giving back fixes and cool new features
28

