SESSION ID: SBX1-W3
Yet Another IoT Hack
Joshua Meyer
Associate Security Analyst Independent Security Evaluators @ISEsecurity

#RSAC

#RSAC
Yet Another IoT Hack
Introduction Threat modeling Using prebuilt tools Types of attacks Exploiting Issues What to do next

#RSAC
IoT and (In)Security
Well documented history of IoT security failure More devices every year Vulnerabilities can be trivial to exploit

Meet Our Assistant
TerraMaster F2-420

#RSAC
Network-Attached Storage (NAS) Quad-core Intel Celeron J1900 4GB RAM 2 x 3.5" HDD bays 2 x 1Gbps Ethernet ports TOS 3.1.03

#RSAC
Threat Modeling
Internal threats
­ Attackers on the local network
External threats
­ Attackers not on the local network
Authentication
­ Can attackers exploit a device without credentials?

#RSAC
Prebuilt Tools and Exploits
Allow for easy deployment of exploits Caveats
­ Tend to rely on known exploits that may be patched ­ Not really finding new vulnerabilities
Can be very helpful in attacking IoT devices

#RSAC
Common Attacks--Cross-Site Scripting

What is it?
Cross-Site Scripting (XSS)
­ Vulnerability that allows attackers to run code in a victim's web browser
Attack Points
­ Input fields ­ URL and POST parameters ­ Impact:

Impact
Credential theft Phishing Sensitive data exposure

#RSAC
Common Attacks--SQL Injection

What is it?

Impact

SQL injection
­ Execution of arbitrary SQL queries in a database
Attack Points
­ Input a database might handle ­ Search features

Information disclosure Denial-of-service Modification of stored data

#RSAC
Common Attacks--Command Injection

What is it?
Command Injection
­ An attack that executes operating system commands
Attack Points
­ Input that might be handled by the operating system
o Filenames o Usernames and passwords

Impact
Denial-of-service Information disclosure Credential theft Game over?

Demo Time

#RSAC
What's Next?

Manufacturers and Developers
Short-term
­ Use audited components when available
­ Consider security throughout the development process
Long-term
­ Security training ­ Talk to a professional ­ Third-party security assessment

Users
Short-term
­ Secure your devices
o Disable extraneous services o Disable remote access o Update firmware
Long-term
­ Request better device security from manufacturers
­ Perform security audits regularly

