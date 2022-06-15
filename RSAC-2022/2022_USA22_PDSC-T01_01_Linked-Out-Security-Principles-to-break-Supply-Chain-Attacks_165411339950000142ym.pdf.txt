#RSAC
SESSION ID: PDSC-T01
Linked-Out: Security Principles to Break Software Supply Chain Attacks
Siddhesh Yawalkar
Engineering Manager, Security Intuit



#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA® Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. All rights reserved. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2




#RSAC
Agenda
Introduction to Supply Chain Attacks Supply Chain Attack Anatomy Website SCA : Magecart Datacenter SCA : Microsoft Exchange Server Public Cloud : Azure Pipeline Defense principles Best practices against Supply Chain Attacks


 
 
 
 
 


3

#RSAC
What are Supply Chain Attacks ?
A cyber breach where attackers target less-secure but trusted 3rd party software
More impactful as a single compromise of a 3rd party company can lead to 1000s of enterprise victims
Attackers exploit enterprises' trusted use of software without validation of its integrity.



 


4

#RSAC
Supply Chain Attack Anatomy
5

#RSAC
Website SCA : Magecart

Website SCA : Magecart
Webpage
All it takes is ONE compromised JS



#RSAC

1st party location - 1

3rd party location - 1

3rd party location - 2

3rd party location - 3

4th party location- 1

4th party location - 2

4th party location - 3

4th party

Nth...

Nth...

Nth...

Nth...
7

#RSAC
Typical Magecart Attack Sequence
Magecart  JavaScript Skimming Attack

Analyze Website




Infect 3rd party

Load my script

Avoid detection

Exfiltrate user data
Or any other Attack ...
8

Website Security Practices

Content Security Policy

SubResource Integrity

Inflow

Outflow

<script integrity-hash=abcd-xyz src="3rd-party/foo-1.js">

#RSAC
iFrame Sandboxing
3rd party JS

Locks down web resources origins and
data outflow

Verifies content hash of a resource during runtime

Browser fully isolates untrusted content

9




#RSAC
Datacenter SCA : Microsoft Exchange Server

#RSAC
11

#RSAC
Defense mechanisms
12

#RSAC
Public Cloud : Azure Pipeline

#RSAC
Azure DevOps Server: A Brief Overview
14

#RSAC
What Makes the Attack Possible?
The agent does not verify if the reply is coming from the legitimate server or otherwise.
The AES key that is used for encrypting a job specification can be successfully replaced by a custom AES key.
TLS is not configured by default. The user needs to manually configure it.





15

#RSAC
How to protect your organization from Supply Chain Attacks ?

#RSAC
Defense against Supply Chain Attacks

Defense in Layers

Layer 4 : Periodic App Monitoring

L4

Layer 3 : Active Protection

L3

L2
Layer 2 : Minimize Exposure
L1
Layer 1 : Resource Inventory

Web Asset
17

#RSAC
Best Practices against Software Supply Chain Attacks
Avoid an implicit chain of trust between software and enterprises Minimize exposure to 3rd Party software Prioritize sensitive infrastructure Extend the Zero Trust principle


 

 


18

#RSAC
Apply What You Have Learned Today
Next week you should :
­ Identify which Web Assets are the most vulnerable in your organization ­ Identify which Web Assets have an implicit chain of trust with 3rd parties
Next three months you should :
­ Inventory of all 3rd party software ­ Apply defenses to break chain of trust in case of a breach ­ Minimize 3rd Party exposure


 



19

 



#RSAC
Apply What You Have Learned Today
Next six months you should
­ Apply Zero Trust across your organization ­ Monitor and verify 3rd Party Security Posture on a continuous basis ­ Help protect other team's web assets as well!





20



#RSAC
Thank You for Your Attention! Q&A Session
Siddhesh Yawalkar
Engineering Manager, Security Intuit

 



21

