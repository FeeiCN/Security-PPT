SESSION ID: AIR-W03R
The Incident Response Playbook for Android and iOS

Andrew Hoog
CEO and Co-founder NowSecure @ahoog42 @NowSecureMobile

Andrew Hoog

Author of three books
Incident Response for Android and iOS
Free and open-source
Android Forensics: Investigation, Analysis and Mobile Security for Google Android iPhone and iOS Forensics: Investigation, Analysis and Mobile Security for Apple iPhone, iPad and iOS Devices
Expert witness Computer scientist Mobile security researcher
2

#RSAC
The State of Mobile Security

Mobile Devices Are Vulnerable

Lifetime Android CVEs by type (130 in 2015)

Lifetime iOS CVEs by type (375 in 2015)

http://www.cvedetails.com/product/19997/Google-Android.html?vendor_id=1224

http://www.cvedetails.com/product/15556/Apple-Iphone-Os.html?vendor_id=49

4

Mobile Apps Are Leaking Data
Example: Log-in credentials leaking each day
Source - Assessing impact of leaky apps: Usernames and passwords
5

Mobile Data Is Valuable
Governments, malicious actors will pay to compromise mobile Hacking Team weaponizes mobile security flaws for surveillance Zerodium sells zero-day exploits and offers $1 million rewards for remote, untethered iOS jailbreaks
6

Mobile OSs
https://www.zerodium.com/program.html

Mobile Incident Response Challenges
Mobile technology is different than traditional computers Devices are always on and always connected BYOD and dual use impacts incident response App sandboxing requires different approach to endpoint defense Mobile IR tools are completely different and limited in number
7

#RSAC
Preparing for a Mobile Incident: Organizational Readiness
Mobile Threat Assessment and Mobile Incident Response Tools

Mobile Threat Assessment
Step 1: Perform a mobile inventory Identify assets: devices, operating systems, installed apps
Mobile device management (MDM) software Exchange ActiveSync (EAS) Network traffic analysis at corporate ingress/egress
Historical device data is crucial to response
Few organizations have yet performed such an audit
9

Mobile Threat Assessment
Step 2: Correlate your inventory with mobile security intelligence Operating system vulnerabilities (OS CVEs) Leaky and insecure apps Known malware in the wild Other known risks (e.g., malicious Wi-Fi networks, SSL re-signing, etc.)
Organizations need to collaborate and share threat information so that enterprises can effectively detect and respond to threats.
10

Mobile Threat Assessment
Step 3: Work the problem Identify security risks Perform cost/benefit analysis Eliminate "low hanging fruit" and unacceptable risk Document remaining risks Prepare mobile IR playbooks
Most enterprises lack visibility into the amount of mobile risk they own
11

Identification and Response at Scale
Applying detection and response to 1000s of devices

Infected device

Example of an aggregated view of continual analysis data
12

Build Your Mobile IR Tool Box
When an incident occurs
Need tools built for mobile Need to be able to use the tools Need baseline/historical data
Santoku Linux - an open-source Linux distro for mobile forensics, security and malware analysis
13

1. Continual Analysis Tools (SCAN)
14

1. Continual Analysis Tools

Baseline device properties and behavior
Provide historical view of a device
Helpful for comparative analysis and anomaly detection

Free/Open Source Tools
Vulnerability Test Suite (VTS) for Android
iVerify-oss

15

2. Acquisition Tools
Device acquisition
Backup Logical Physical
Proxying network traffic
16

Free/Open Source Tools
iTunes (backup) libimobiledevice AF Logical OSE FROST LiME Burp Suite ZAP

3. Analysis Tools

Forensic analysis
Timeline analysis Searching File carving
Behavioral and comparative analysis
Malware analysis

Free/Open Source Tools
Android Brute Force Encryption
ExifTool
Scalpel
Sleuthkit
Wireshark

Network analysis

Nmap

17

#RSAC
Mobile Incident Types and Response Strategies

Mobile Incidents You May Encounter
Eight Common Mobile Incident Types

Identification
Device Indicators of Compromise (IOCs)
Increased battery drain Unusual network traffic Certificate errors Unusual log messages Crash reports
App Reputation Monitoring
Unauthorized use of brand Apps connecting to your transactional servers
User Reported
20

Containment
Once you have identified and logged an incident Gain access to device, if possible Capture device, OS and app baseline Determine if network analysis is appropriate Isolate the device (airplane mode, Faraday bag, etc.) Perform full forensic acquisition
21

Note on Handling Incidents Off-Network
Capturing device baseline is possible Can leverage VPN for network analysis Individuals care deeply about the security of their device and will work with the IR team to resolve an incident

Caveat: if device inspection feels intrusive, people will either not report or not cooperate
22

Eradication
Once incident is identified
Analyze attack artifacts Determine if threat can be removed Identify all impacted (if malware on app store) Remove threat or wipe corporate data
23

Recovery
Mobile recovery typically involves
Re-provision mobile devices Ensure attacker didn't move laterally within your organization Monitor accounts and systems connected to mobile device and impacted user(s)     Note: Effectiveness of social engineering attacks is greatly increased
24

Lessons Learned
Team debrief:
What went wrong, what worked, what can be improved Recommended policies and procedures changes, user education, etc.
Determine IOCs
Attribution Share threat intel data
Inoculate against future attacks
Static signatures generally ineffective Focus on anomaly detection Shared insights and cross-referenceable data
25

#RSAC
Mobile Incident Response Playbooks

Lost Phone
1. Attempt to locate and remotely lock device 2. Inspect continual analysis data for anomalies 3. Wipe corporate data if step 2 fails 4. Determine potential impact of incident with
baseline data:
Identity and role of user Data on their device Apps they used
27

Device Acting Suspiciously
1. Capture device, OS and app baseline 2. Perform network analysis if appropriate 3. Isolate the device (airplane mode,
Faraday bag, etc.) 4. Perform full forensic acquisition (if you
have physical access) 5. Analyze device and app artifacts 6. If incident confirmed, determine
eradication and recovery steps
28

Malware on App Store
1. Secure a copy of the malware 2. Analyze the app
Compare to intelligence about known malware Perform static and dynamic analysis
3. Identify impacted users
Server logs with user agent App/Play store security processes
4. Determine remediation steps - attempt to block at server level
5. Develop recovery and eradication steps
29

#RSAC
Incident Response Case Study
My Own Personal Device Was Acting Suspiciously

It All Began On Saturday Feb. 13
Certificate error Examined the details Determined there was an issue
Documented the issue Contacted corporate security team
Attempted to re-create on iPad, other iOS devices, laptop, desktop
31

iPhone Screen-shots

Info Gathering and Identification

Symptoms
Gmail app wouldn't sync Wi-Fi certificate errors
Analyzed certificate
Hosted in shared environment Istanbul Both used self-signed HTTPS certificate Issued by: ssl@servers.carsimedya.com

iPhone screen-shots

32

Continuing Investigation
Suspicious DNS entries
Queried IP address - resolved to a server in Germany Same DNS as carsimedya.com Social media and SEO related Investigated router configuration
Theories
Targeted attack Mass router compromise (using known or zero-day vulnerability)
33

#RSAC
Conclusion
Summary and Applying What You've Learned

Summary
Mobile IR is different than traditional IR
Limited administrative access You need different tools
The keys to mobile incident response success are:
Historical device data Timely collection of device data post-incident
Trial by fire is not the answer in mobile IR
Rehearse your plan Rehearse it again
35

Your Next Steps
Next week: identify who at your organization is responsible for mobile incident response and whether you have the capability internally Within three months: conduct a proactive mobile risk assessment, build your mobile IR toolkit, familiarize yourself with the tools Within six months you should: establish your response playbooks and rehearse them
36

#RSAC
Thank you
@ahoog42 ahoog@nowsecure.com

