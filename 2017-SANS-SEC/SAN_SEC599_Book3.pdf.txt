SECS99 I DEFEATING ADVANCED ADVERSARIES
599.3
Preventing Exploitation
THE MOST TRUSTED SOURCE FOR INFORMATION SECURITY TRAINING. CERTIFICATION, AND RESEARCH I sans.org

Copyright© 2017, Erik Van Buggenhout & Stephen Sims. All rights reserved to Erik Van Buggenhout & Stephen Sims and/or SANS Institute.
PLEASE READ THE TERMS AND CONDITIONS OF THIS COURSEWARE LICENSE AGREEMENT ("CLA") CAREFULLY BEFORE USING ANY OF THE COURSEWARE ASSOCIATED WITH THE SANS COURSE. THIS IS A LEGAL AND ENFORCEABLE CONTRACT BETWEEN YOU (THE "USER") AND THE SANS INSTITUTE FOR THE COURSEWARE. YOU AGREE THAT THIS AGREEMENT IS ENFORCEABLE LIKE ANY WRITTEN NEGOTIATED AGREEMENT SIGNED BY YOU.
With the CLA, the SANS Institute hereby grants User a personal, non-exclusive license to use the Courseware subject to the terms of this agreement. Courseware includes all printed materials, including course books and lab workbooks, as well as any digital or other media, virtual machines, and/or data sets distributed by the SANS Institute to the User for use in the SANS class associated with the Courseware. User agrees that the CLA is the complete and exclusive statement of agreement between The SANS Institute and you and that this CLA supersedes any oral or written proposal, agreement or other communication relating to the subject matter of this CLA.
BY ACCEPTING THIS COURSEWARE, YOU AGREE TO BE BOUND BY THE TERMS OF THIS CLA. BY ACCEPTING THIS SOFTWARE, YOU AGREE THAT ANY BREACH OF THE TERMS OF THIS CLA MAY CAUSE IRREPARABLE HARM AND SIGNIFICANT INJURY TO THE SANS INSTITUTE, AND THAT THE SANS INSTITUTE MAY ENFORCE THESE PROVISIONS BY INJUNCTION (WITHOUT THE NECESSITY OF POSTING BOND), SPECIFIC PERFORMANCE, OR OTHER EQUITABLE RELIEF.
If you do not agree, you may return the Courseware to the SANS Institute for a full refund, if applicable.
User may not copy, reproduce, re-publish, distribute, display, modify or create derivative works based upon all or any portion of the Courseware, in any medium whether printed, electronic or otherwise, for any purpose, without the express prior written consent of the SANS Institute. Additionally, User may not sell, rent, lease, trade, or otherwise transfer the Courseware in any way, shape, or form without the express written consent of the SANS Institute.
If any provision of this CLA is declared unenforceable in any jurisdiction, then such provision shall be deemed to be severable from this CLA and shall not affect the remainder thereof. An amendment or addendum to this CLA may accompany this courseware.
SANS acknowledges that any and all software and/or tools, graphics, images, tables, charts or graphs presented in this courseware are the sole property of their respective trademark/registered/copyright owners, including:
AirDrop, AirPort, AirPort Time Capsule, Apple, Apple Remote Desktop, Apple TV, App Nap, Back to My Mac, Boot Camp, Cocoa, FaceTime, FileVault, Finder, FireWire, FireWire logo, iCal, iChat, ilife, iMac, iMessage, iPad, iPad Air, iPad Mini, iPhone, iPhoto, iPod, iPod classic, iPod shuffle, iPod nano, iPod touch , iTunes, iTunes logo, iWork, Keychain, Keynote, Mac, Mac Logo, MacBook, MacBook Air, MacBook Pro, Macintosh, Mac OS, Mac Pro, Numbers, OS X, Pages, Passbook, Retina, Safari, Siri, Spaces, Spotlight, There's an app for that, Time Capsule, Time Machine, Touch ID, Xcode, Xserve, App Store, and iCloud are registered trademarks of Apple Inc.
Governing Law: This Agreement shall be governed by the laws of the State of Maryland, USA.
SEC599_ 3_C01 _03

SEC599.3

Defeating Advanced Adversaries

Preventing Exploitation

© 2.017 ErikVan Buggenhout & Stephen Sims I All Rights Reserved I Version SEC599_COI_03

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

TABLE OF CONTENTS

Securing the Network Network Access Control & 802.1 X
Securing Software

Software Development lifecycle (SDL) & Threat Modeling

Vulnerability Assessments

EXERCISE:Authenticated Scans using Nessus

············ ···· ·······

Patch Management

. .. .. ......

Exploit Mitigation Techniques ·················.. .... ..

EXERCISE: Exploit Mitigation using Compile-Time Controls

·············· .., .. ..... ······· .. ..................

Introducing EMIT & Other Exploit Mitigation Software

EXERCISE: Exploit Mitigation using EMET

-06 06 21 21 47 65 68 96 118
119 146

This page intentionally left blank.

2

© 2017 Erik Van Buggenhout & Stephen Sims

TABLE OF CONTENTS
Securing Endpoints OS Hardening & Best Practices Endpoint Protection Solutions Application Whitelisting to Stop Payload Execution EXERCISE: ConfiguringApplocker
This page intentionally left blank.

-149 149 156 172 188

© 2017 Erik Van Buggenhout & Stephen Sims

3

Where Are We in the APT Attack Cycle?

In section 2 of this course, we discussed payload delivery, today we will assess how we as defenders can mitigate exploitation

.

.

Weaponlzatlon· · "'

.

-

Explo1tat1on

"'N,
·. ;f:COnflai~~n;~:~

. .:,,.....- , -

,,· ,!-
., .

·

.,-iii

,· · ····Delivery · · 11

.... t,

·-~

r. . ·

Where Are We in the APT Attack Cycle? Welcome to Day 3 ofSEC599! Yesterday, we saw how adversaries could deliver their weaponized payloads during the delivery phase of the APT Attack Cycle. We will now assess how exploitation of vulnerabilities by the payload can be prevented or detected.
Adversary perspective After the delivery, the malware will be executed on devices used by the victims. When a user receives a payload, and opens / runs it, it will run with the privileges of that user. Depending on the goals ofthe adversaries, running the executable with the user's privileges might be sufficient o r not (we assume that the target user is a least privilege user, e.g. not a Windows administrator). l fhigher privileges are needed, the adversaries will need to use exploits to gain privilege escalation. This can be as simple as a User Account Control bypass, or as sophisticated as a zero-day to achieve code execution in the Windows kernel.
Adversaries often use a combination oftechnical and people exploits. Consider the example of malicious macro in an office document: it will not run as long as the human doesn't open the document (and enables macros, if required). Next to generating the malicious payload, the adversary will still need to convince the target to open / run it.
Defender perspective As defenders, we have two opportunities during this step to combat adversaries: prevent exploitation and detect exploitation.
As part of vulnerability management, we should:
· 1larden our systems according to a baseline configuration (shut down unneeded services, change default credentials...). NIST is well-known for producing quality hardening g uidelines;
· Ensure patches for third-party software are timely installed; · Ensure the software we develop ourselves is developed according to secure development standards;

4

~ 2017 Erik Van Buggenhout & Stephen Sims

· Ensure our entire IT environment (including infrastructure and applications) is regularly assessed for vulnerabilities (and that identified flaws are fixed);
· Have a formal vulnerability management process in place, where vulnerabilities have to be formally accepted if they are not mitigated.
Application whitelisting can be of great help to prevent arbitrary code execution, but it requires a standardized software environment. If users are expected to install and run their own software according to their business needs, then application whitelisting will be extremely hard to successfully implement. Windows provides freeto-use application whitelisting technology via AppLocker and Software Restriction Policies.
Another interesting (though end-of-life) technology developed by Windows is EMET (Enhanced Mitigation Experience Tool), which attempts to protect endpoints from successful exploitation. Its features are implemented (in part) in recent Windows Operating Systems such as Windows 10 Enterprise.
Monitoring all code execution on a system is not only a great way to detect exploitation, but it also provides logs that can be used in forensic investigations ofsuccessful attacks. Microsoft.'s Sysmon is a free tool that collects information ofcode execution and writes it to a Windows event log. For example, Sysrnon can create Windows event log entries for executed programs, including a cryptographic hash ofthe executable image.

'

© 2017 Erik Van Buggenhout & Stephen Sims

5

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Averting Payload Delivery
· Day 3: Preventing Exploitation
· Day 4: Avoiding Installation, Foiling Command &Control, & Thwarting Lateral Movement
· Day 5: Ex:filtration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

SEC599.3
· Securing the Network Network Access Control & 802. IX Securing Software Software Development Lifecycle (SOL) & Threat Modeling Vulnerability Assessments Exercise: Authenticated Scans Using Nessus Patch Management Exploit Mitigation Techniques Exercise: Exploit Mitigation Using Compile-Time Controls Exploit Mitigation Techniques - Exploit Guard, EMET. & Others Exercise: Exploit Mitigation Using EMET & MalwareBytes Securing Endpoints OS Hardening & Best Practices Endpoint Protection Solutions Application Whitelisting to Stop Payload Execution Exercise: Configuring Applocker

This page intentionally left blank.

6

<e> 2017 Erik Van Buggenhout & Stephen Sims

Networl< Access Control & 802.1 X
IThe problem: Ethernet networks are open. If you can plug your laptop into an Ethernet socket, you will get networ k access.
IYour machine w ill be assigned an IP address via DHCP, or you will configure it with a stat ic IP address.
IFrom then on, your machine will be able to use the IP protocol on the network. N o identification, authentication or authorization is required.
SAN~
Network Access Control & 802.1 X Ethernet networks were designed to be open. If you have physical access to an Ethernet socket, you can get access to the network (we are considering networks without Network Access Control).
When you plug in the Ethernet cable of your laptop into an Ethernet socket, the Ethernet card on your laptop and the network device (typically a switch) will exchange signals over the Ethernet cable to establish an Ethernet connection.
Once you have an Ethernet connection, your laptop can initiate IP traffic. To send and receive IP packets, your laptop needs an IP address (1Pv4 or 1Pv6 or both). In the majority of networks, your laptop will receive an IP address from a DHCP server. The Dynamic I lost Configuration Protocol is a protocol used to automatically configure the host (your laptop) with properties it needs to operate in the network. An IP address is an essential property set through DIICP.
If DHCP is not available, you can configure your laptop with a static IP address (this might require some reconnaissance to figure out with IP range to use).
From then on, without identification, authentication or authorization, your laptop will be able to use the IP protocol on the network (and thus TCP, UDP...). Remark that this network access does not imply unauthorized access to all resources on the network: on many networks, Active Directory is implemented to secure resources. Bul you will be able for example to conduct port scans, attempt to sniff traffic.
So, physical access means network access. And this is a problem for enterprises: they have so many premises that it is very hard to physically secure all network access points.
Remark that with Wi-Fi we are dealing with a shared spectrum by design, so we' ll have to place more focus on logical controls (authentication, encryption ...)

© 2017 Erik Van Buggenhout & Stephen Sims

7

DHCP Negotiation
DHCP IP negotiation

No identification, authentication or authorization is required for DHCP
negotiation.
1) Discovery
2) Offer 3)Rcqucst
4) Acknowledge

DHCP Negotiation To obtain an IP address (and other properties, like gateway IP address, DNS server IP address...) when connecting to a network, a machine will initiate a DHCP communication.
First, it will send out a broadcast Discovery message (UDP packets).
DHCP servers on the network will listen to Discovery messages broadcasted on the network, and reply to the client with an Offer message. This offer message will contain the clients MAC address and a proposed IP address.
The client will select one DHCP server to continue the negotiation, and broadcast a Request message to that server accepting the proposed IP address.
Finally, the DHCP server will acknowledge the request.
With this information, the client can configure its network interface. This does not require identification, authentication or authorization.

8

© 2017 Erik Van Buggenhout & Stephen Sims

Network Access Control (NAC)
mPhysical security is not adequate to protect an enterprise network. mSecurity can be added at the "digital'' network layer to protect the network.

Network Access Control (NAC) is a solution to
implement security at the network layer

With NAC, only authorized devices are allowed to connect to the network and use it to communicate.
NAC is also used to enforce policies like up-to-date antivirus and patches.

Network Access Control (NAC) Since (large) enterprises cannot re ly on physical security to protect their network, other solutions had to be found.
One solution is to add security at the "digital" network layer: before a client is allowed full access to the network, it needs to identify and authenticate itself.
Only when authentication succeeds, the client will be allowed to access the network. Failing to authenticate, the client will not be able to send or receive network traffic.
Network Access Control (NAC) is a solution to achieve this level of security. With NAC, only authorized devices can use the corporate network. The administrator ofthe network needs to authorize devices, and he / she can deauthorize devices (for example in case of laptop theft). Without authorization, devices are not allowed to connect to the network.
Implementing NAC requires a substantial amount ofresources (client devices and network devices need to support NAC, NAC needs to be configured and maintained...) and because of this cost, other applications of NAC were developed.
For example, with NAC, it is also possible to allow or deny access to the network for a client based on the properties of the client. With NAC, it is possible to inspect the client, and only allow access if the client has a working antivirus with up-to-date signatures and ifthe latest patches were applied.
This requires a NAC agent running on the operating system to inspect the machine.
Often, clients who are not compliant with these policies are g iven access to a remediation network instead of being blocked from network access.
In this remediation network, resources are available to update the client to make it compliant with the policies.

© 2017 Erik Van Buggenhout & Stephen Sims

9

NAC VLAN Usage
Switch with NAC

Corporate network
Remediation network
No access to network

NAC VLAN Usage NAC is often implemented according to the d iagram shown above.
When a client connects to the Ethernet network, it communicates with a switch. Typical switches will immediately start to switch the network packets from and to the client to other network devices.
This is not the case when NAC is implemented. With NAC, special switches are used that support NAC. These switches will first identify and authenticate the client that connects to the switch (we will see later in details how this can be done). Ifthe client is not authorized to connect to the network, the switch will not forward any traffic from the client: the client is blocked from accessing the network. It can only negotiate network access with the switch, all other traffic is not allowed.
Ifthe client is authorized to access the network, the switch connects the client to a VLAN that gives it access to the corporate network.
As explained, there are enterprises that use NAC to enforce security policies like antivirus and patching. Jn these networks, a NAC agent running on the client wi ll inspect properties ofthe operating system, like the presence of an up-to-date antivirus engine and the level of Windows patching.
If a device is recognized as a corporate device, but the N AC agent reports that it does not comply with corporate policies, then the switch will not give it access to the corporate network. Instead, the switch will put the noncompliant device in the VLAN ofthe remediation network. The remediation network is a network with very limited access. It has no access to the corporate network, but it contains servers to which the client can connect to become compliant by updating its antivirus signatures and applying missing patches. Once a machine is up-to-date, it can start the NAC process again and be connected to the corporate network.

10

© 2017 Erik Van Buggenhout & Stephen Sims

Cisco's NAC Implementation

Network Admission Control is Cisco's implementation of Network Access Control.

I I I I I I I I I
CISCO

· It requires Cisco network devices (switches, wireless access points, routers...) that support NAC
· Cisco's NAC relies on an agent installed on the client: The Cisco Trust Agent
· A Cisco Secure Access Control Server (ACS) orchestrates NAC; It decides which devices are allowed to connect to which networks

Cisco's NAC Implementation The networking company Cisco provides Network Access Control in some of its products. Cisco calls this Network Admission Control.
Network Admission Control is implemented in various devices and software sold by Cisco. For Ethernet networks, Cisco switches with NAC support are required. For Wi-Fi, Cisco wireless access points with NAC support are required. They will enforce the NAC policies.
Cisco provides a client agent (the Cisco Trust Agent, software to be installed on the operating system of the machine) that will interact with Cisco's NAC aware devices and inspect the machine for various security properties (like antivirus, patches...).
This agent interacts with the devices that will provide access to the network: a switch or a wireless access point. The agent participates in the authentication and provides information on the security posture of the device. The switch or access point relay that information to a Cisco Secure Access Control Server. This ACS device decides which devices authenticated properly and are thus, eligible for network access, and which devices are not. Based on the security posture of the authenticated device, the ACS will decide if the client is given access to the corporate network, or to a remediation network. These decisions are passed on to the switch or access point, which enforce the decision.

© 2017 Erik Van Buggenhout & Stephen Sims

11

Microsoft's NAC Implementation

Network Access Protection is Microsoft's implementation of NAC:

I· Microsoft

· NAP uses an agent to inspect the Windows machine's security posture (antivirus up-to-date, patch level...)
· This agent is built into Windows
· Network access is enforced via network devices that can enforce NAC: switches or wireless access points with 802.IX support

NAP is deprecated since Windows I0/Windows Server 2016

SANS

Mic rosoft's NAC Implementation Microsoft's implementation ofNAC is called Network Access Protection (NAP).

NAP too relies on an agent to inspect a Windows machine; does it have an antivirus installed and are the

signatures up-to-date; are recent patches installed; is the local firewall enabled ...? The agent can answer all

these questions and report the information to a Windows Server with NAP support.

.....

This agent does not require separate installation, it is an integral component of Windows.

The network access itself is enforced by network devices (not sold by Microsoft). These switches and wireless access points must support IEEE's 802.IX NAC standard (discussed in the next slides). They relay the information from the agent to the Windows server, which makes the decisions.

NA P is no longer avai Iable in the latest versions of Windows. It was deprecated in Windows Server 2012 R2 and is not available in Windows IO and Windows Server 2016.

12

© 2017 Erik Van Buggenhout & Stephen Sims

OpenNAC

OpenNAC is an open source Network access

· o·opennaC

control that provides secure access for LAN/WAN. ,

· It allows applying flexible access policies based on rules
· It works with wide range of clients (Windows, Mac, Linux, others...) and network devices (Cisco, Alcatel Extreme Networks, and 3Com)
· For more information, please refer to http://opennac.org/
· Open-source, but is aimed at enterprise-size organization & professional support is available

OpenNAC OpenNAC is one of(very) few open source Network Access Control (NAC) solutions. lt supports both LAN & WAN. Some of its key featu res include:
· Supports a w ide variety of clients (Windows, Mac, Linux, others ...) and network devices (Cisco, Alcatel & 3Com);
· Arranges corporate network access based on a set of rules (access policy); · The availability ofNotifications or Quarantine to users regardless ofthe client device (via browser); · Value-added services such as monitoring, discovery, and configuration of network infrastructure; · Authentication backend based on LDAP or AD; · Detection of OS, antivirus, firewa ll and OS updates ofdevices connected to enforce access policies.
For add itional information, please refer to http://opennac.org.

© 2017 Erik Yan Buggenhout & Stephen Sims

13

IEEE 802.IX
To standardize Network Access Control protocols, the Institute of Electrical and Electronics Engineers (IEEE) published standard 802.IX: · This standard promotes interoperability between devices of
different vendors · It is a port-based Network Access Control standard · It provides authentication for clients of Ethernet switches and
Wi-Fi access points · It defines the encapsulation EAP Over LAN: EAPOL
SANS
I EEE 802.IX The problem with solutions from different vendors, is often interoperabi lity.
To promote interoperability ofdifferent NAC solutions, the Institute of Electrical and Electronics Engineers (IEEE) worked out standard 802.1 X. This is a standard from the 802.1 workgroup which defines network protocols.
802.1 X is a port-based Network Access Control standard: it uses network ports to al low or block access to the netwo r k.
This standard defines authentication protocols for both LAN and WLAN: clients can connect to switches or wireless access points and follow the same protocol.
IEEE 802.1 X uses the Extensible Authentication Protocol (EAP) to authenticate c lients. EAP is an
authentication framework defined in RFC 3748. EA P is not an authentication mechanism, but an authentication framework: it defines a standard in which different authentication mechanisms can be used. Examples ofauthentication mechanisms: passwords (EAP-PWD), pre-shared key (EAP-PSK), certificates (EA P-IKEv2). . .
802.1 X implements the EAP protocol over LAN (802): EA POL.

14

© 2017 Erik Van Buggenhout & Stephen Sims

802. 1X NAC Access

EAPOL (

RADIUS/DIAMETER

(

)

,,....

Supplicant

Authentic.ator

Authentication Server

SAN~
802. IX NAC Access Three parties are involved in 802.1 X NAC access:
· The supplicant (the client, like a laptop) · The authenticator (the network access point, like a switch) · The authentication server (the orchestrator, like a RADIUS server)
Authentication is done via a method supported by the Extensible Authentication Protocol. As stated before, this is not a specific mechanism but a framework that supports different authentication mechanisms. One authentication mechanism often used in corporate environments, are certificates. They require some infrastructure like a PKI, but ofTer several advantages: not only are they transparent to the end user, but they can be automatically deployed with Active Directory and revoked on a case-by-case basis.
The EAP protocol is encapsulated in EAPOL (EAP Over LAN) when it is used to communicate between the supplicant and the authenticator. The authenticator will relay the EAP packets to the authentication server. Depending on the implementation ofthe authentication server, RADIUS or DIAMETER will be used to encapsulate the EAP protocol.
The authentication server decides to allow or deny access to the supplicant, and the authenticator enforces this decision. In its initial state, the port ofthe authenticator ""ill only allow EAPOL traffic. When authorized, the authenticator will ulluw ulher network traffic between the s upplicant and the corpor::ite network.

© 2017 Erik Van Buggenhout & Stephen Sims

15

802.1 X Authentication Phases
The 4 phases of 802.1 X authentication
Negotiation
SANS
802.IX Authentication Phases In a typical authentication process with 802.1 X, 4 steps will be taken:
· Initialization: the port of the authenticator is in the unauthorized state, and only 802.1 X traffic is allowed. All other traffic dropped
· Initiation: the authenticator periodically transmits EAP-Rcquest Identity packets, until it receives EAPResponse Identify packets from the supplicant. The authenticator encapsulates this response into a RADI US Access-Request packet and sends it to the authentication server. Negotiation: The authentication server sends a RADIUS Access-Challenge reply to the authenticator, specifying the EAP method to be used for authentication by the supplicant
· Authentication: authentication is then performed according to the selected authentication method by exchanging EAP Request and Response packets between the supplicant and authentication server over the authenticator (direct communication between supplicant and authentication server is not allowed). With successful authentication, the authentication server terminates the authentication phase with an EAP-Success message. Otherwise it terminates with an EAP Failure message. In case ofan EAPSuccess message, the authenticator sets the port in authorized state and normal network traffic is allowed to flow.

16

© 2017 Erik Van Buggenhout & Stephen Sims

Unsupported Devices
An issue with NAC is that not all devices that require a network connection, support NAC or 802.1X... There are devices that cannot authenticate:
· Network connected printers · IP cameras · VOIP phones
These devices can be put in a separate VLAN that does not require 802.1X authentication, or "authenticate" based on MAC address. This separate VLAN must be properly segregated from the normal corporate LAN.
Unsupported Devices
NAC can help a lot with controlling access to our corporate networks, but it requires devices that understand NAC, and can authenticate for example with 802. IX.
These capabilities are often not found in low-cost devices, or in devices that have very specific functions: Printers and scanners that are connected to the network
· Surveillance cameras that use networking protocols to transmit images · Voice-over-IP telephones
Such devices can only be connected to ports that do not impose 802. 1X authentication. As this is a clear risk opening our network for abuse, mitigations must be applied. For example, the VLAN that is used by these ports can be a dedicated VLAN with restricted access to resources, only allowing the minimum necessary for these devices to operate properly.
Another option is to use a whitelist of MAC addresses, and only allow devices whose MAC address is on the whitelist. Remark that for an advanced adversary, this is not a difficult obstacle: MAC addresses can be easily spoofed.

© 2017 Erik Van Buggenhout & Stephen Sims

17

BringYour Own Device & NAC
The whole point of 802 .1x & NAC is to prevent untrusted devices from joining the (internal) network
Over the last couple of years however, we've seen a shift in thinking due to the rise & popularity of BYOD (Bring Your Own Device), where devices not owned or managed by the company are allowed to connect to the environment...
Many organizations have accepted the fact that untrusted devices will connect to the environment and are thus using Mobile Device Management (MDM) solutions to control how "untrusted" devices are allowed to access the environment!
SAN~
Bring Your Own Device & NAC The who le point of 802.1 x & NAC technologies was to prevent untrusted devices from joining the (internal) network. This was an effective strategy during the era where employees only relied on devices provided & managed by employers. In such a case, it was "easy" to enforce certain security controls & measures, as all devices were known up front and they could be fu lly managed by employers.
-. Over the last couple of years however, we've seen a shift in thinking due to the rise & popularity of BYOD (Bring Your Own Device), where devices not owned or managed by the company are allowed to connect to the environment. This is often considered for cost-saving reasons, or just to provide additional flexibility to employees. T his does however affect our security controls: we can no longer assume that all devices which will connect to our environment are owned & controlled by us.
Many organizations have accepted this fact and are relying on Mobile Device Management (MOM) solutions to control how "untrusted" devices are allowed to access the environment!

18

© 2017 Erik Van Buggenhout & Stephen Sims

Mobile Device Management Strategies

MDM software will typically enforce / check a number of security settings on the device before access is granted:

Device authentication (e.g. password strength) · Presence of a certificate · Device encryption · Jailbreak detection · Geo-location

Presence of black-listed applications · Lock screen time-out · Presence ofAV · Device patch level

Many vendors are offering MDM software:

· airwatch " Mobilelron

Microsoft lntune

by vmware

······
MaaS360. c- - , , by "1berilnlc.. an IBH

Mobile Device Management Strategies Mobile Device Management (MOM) software will typically enforce/ check a number of security settings on the device before access is granted:
· Device authentication (e.g. password strength, PIN code, lock-out...) Presence of a certificate
· Device encryption · Jailbreak detection
Geo-location · Presence of black-listed applications · Lock screen time-out · Presence of AV · Device patch level
These settings can be used in different ways:
· The MOM solution could enroll devices and then enforce the settings (will require acceptance of the owner ofthe device) prior to allowing access to the environment;
· The MOM solution could simply validate the current settings on the device (without enforcement) and decide whether or not to allow access to the environment;
Specifics depend on the actual MOM solution being used, it's worth noting that many vendors currently offer MOM solutions (Airwatch, Mobilelreon, lntune, MaaS360...)

© 2017 Erik Van Buggenhout & Stephen Sims

19

Network Access Control, 802.1 X & MDM Summary
IIEEE 802.1 X is a port-based network access control standard which can help us protect our network from unwanted devices, different ven~ors offer different solutions, use the one that is tailored to your environment.
INAC / MOM software can also be used to improve the security posture of corporate devices (enforce security policy settings).
INot all devices support NAC or MOM software, so exceptions will exist and need to be managed.
Network Access Control, 802.1 X & MOM Summary 802. lX is an IEEE standard for port-based NAC (PNAC). NAC can be a great help to secure corporate networks. But it comes with a non-negligible cost: NAC infrastructure requires network devices and clients that are compliant with NAC standards. Authentication failures and devices that arc not NAC-aware must be managed. Several vendors, like VMware, Cisco, Microsoft, IBM... offer NAC solutions. These have evolved over time and are more and more being advertised as MOM solutions.
-. An extra benefit ofNAC, is that it can be used to increase the security posture of devices that connect to the network. This is becoming more and more common practice with the rise of BYOD (Bring Your Own Device) and MOM software. Devices that do not meet certain security policy settings will be isolated until they comply with the enforced policy settings.
Unfortunately, not all devices support NAC (e.g. printers, Internet ofThings...) and extra measures must be taken to accommodate these devices in a secure way.

20

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Averting Payload Delivery · Day 3: Preventing
Exploitation · Day 4: Avoiding Installation,
Foiling Command & Control, & Thwarting Lateral Movement · Day 5: Exfiltration, Cyber Deception & Incident Response · Day 6: APT Defender Capstone
SANS

SEC599.3
Securing the Network
· Network Access Control & 802.1 X Securing Software Software Development Lifecycle (SOL) & Threat Modeling Vulnerability Assessments Exercise: Authenticated Scans Using Nessus Patch Management Exploit Mitigation Techniques Exercise: Exploit Mitigation Using Compile-Time Controls Exploit Mitigation Techniques - Exploit Guard, EMET, & Others Exercise: Exploit Mitigation Using EMET & MalwareBytes Securing Endpoints OS Hardening & Best Practices Endpoint Protection Solutions Application Whitelisting to Stop Payload Execution Exercise: Configuring Applocker

T his page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

21

Why Should I Care About the SOL?
Many organizations have (partially) implemented some sort of Secure-SD LC:
· Some have chosen Microsoft's SDL · Most implementations have gaps that can offer an opportunity for
attackers and penetration testers · Failure to map security into all phases of the SDLC leaves holes
Experience with the SDL can offer new opportunities:
· Many professionals do not have experience in this area · Companies are in dire need of help
SANS
....,
Why Should I Care about the SOL? The question occasionally comes up about why non-developers concern themselves with Microsoft's Security Development Lifecycle (SOL) or a Secure-SDLC. The better you understand how organizations write their code, the easier it is to identify potential areas ofweakness. If an organization does a good job performing peer review and static analysis, but lacks dynamic testing during the validation phase, it should be called out as a gap. This gap allows us to prioritize our time on the areas with the biggest potential for concern. Most organizations have implemented some sort ofsecurity into their development process; however, many are severely lacking. Failure to map security into each and every phase ofthe SDLC leaves holes, which can be exploited.
The SDL is still a relatively new concept for most companies and many are in need of help. Experience in this area can offer new job opportunities to a professional with the proper skills.

22

© 2017 Erik Van Buggenhout & Stephen Sims

Microsoft Security Development Lifecycle (SOL)
Initiative started sometime in 2002 - 2003:
· Based on a memo in January, 2002 from Bill Gates known as the Trustworthy Computing (TwC) memo
· Applications to be built with security from the ground up
First version of the MS SDL made public in 2008, Version 3 .2 :
http://"""vw.microsoft.com/en-us/download/details.aspx?id-24308
Version 5.2 available as of May, 2012:
http: //www.microsoft.com/en-us /download / d e t ails.aspx?id=2988 4
Vista was the first OS to go through the SDL, and the SDL has been mandatory since 2004.

Microsoft Security Development Lifecycle (SOL) The Microsoft Security Development Lifecyclc (SDL) was started sometime in 2002 - 2003 to ensure that applications and operating systems are built with security from the ground up. Microsoft's SDL information webpage can be found at http://www.microsoft.com/security/sdl/default.aspx. This was during a time when Microsoft was dealing with major security issues from various pieces ofmalware, such as the Melissa Virus, as well as high-profile legal battles around web browser monopoly with Internet Explorer packaging. On January 15, 2002, Bill Gates sent out a memo known as the Trustworthy Computing (TwC) memo. The memo described major changes that needed to occur to ensure Microsoft and its customers were protected and that they could rely on the operating systems. The memo from Bill Gates can be read at http://www.wired.com/techbiz/media/news/2002/0 l/49826.
The first known version ofthe SDL (Version 3.2) was released to the public in 2008 and can be downloaded at http://www.m icrosoft.com/en-us/download/detai1s.aspx?id=24308. Version 5.2 was the latest available version a1 the time of this writing and is available at http://www.microsoft.com/en-us/down1oad/details.aspx?id=29884. Some great introductory material and presentations on the SDL are available at http://wv,w.microsoft.com/enus/download/details.aspx?id= l6420. Microsoft Vista was the first full operating system to go through the SOL process. Microsoft also used the process to retroactively go through prior versions of code.
The contents of this module are heavily based on the Microsoft Security Development Lifecycle (SDL} and STRIDE threat modeling processes, as well as the author's experience with the implementation of SecureSoftware Development Life Cycle (S-SDLC} programs in various organizations. The material written for this module references and leverages the concepts and ideas behind these models. More information on these processes can be found at http://www.microsofl.com/security/sdl/default.aspx and http://m sd n. microsoft.com/en-us/1ibrary/ee823878%28v=cs.20%29.aspx.

© 2017 Erik Van Buggenhout & Stephen Sims

23

Microsoft SOL: Motivation
I The SDL is a set of requirements and phases to ensure security is built in to software from the start.
I Security requirements are grouped into the phases of standard SDLC models. I "The Microsoft SDL is based on three core concepts -- education, continuous process improvement. and
accountability."' - Microsoft
I Companies such as Adobe and Cisco have made it public that they adhere to Microsoft's SDL process. I Most organizations try to implement some sort of Secure-SDLC; it is critical moving forward.
1Microsoft.00Simphficd Implementation of the Microsoft SOL00 hcmJ/www microsoft.com/en-
u<{downJoadldera!ls aspx1,d=J2379 retrieved January Is.2013.
SANX
Microsoft SOL: Motivation The Microsoft SDL is a detailed security process that must be adhered to during software development. It provides a speci fie group of activities to be perfom1ed during each phase of a Software Development Life Cycle (SDLC) to ensure that security is built into software from the beginning. Microsoft has various core concepts, some specific to Microsoft's deployment, such as ensuring the use ofautomated tools for finding bugs and other issues, tools for compliance tracking, and tools to help program managers evangelize the use of the SOL throughout various divisions and teams within the organization. Steve Lipner, Director of Security Compliance at Microsoft, has done quite a few presentations explaining how the SDL is deployed in Microsoft. Some of it can be applied to many organizations, whereas other practices are specific to Microsoft. Each organization must cater the process to their development program. During Lipner's presentation at OWASP's AppSec conference in 20 I0, he claimed that updates to the SDL are made only once per year and are mainly focused on the creation of new tools used for automation and fuzzing.
Companies such as Adobe and Cisco Systems have publicly stated that they adopted some or all of the Microsoft SOL. Regardless of whose process your organization adopts, the use of an overall secure SDLC is essential in this day and age.

24

© 2017 Erik Van Buggenhout & Stephen Sims

Phases of the MS SOL

Requiremenu

Core Securtl}· Tralnm9

Establish St<Urlty RcquiremPnH

Establish l><>slgn Requlrem-M'lts

c,..te Quality
Git<S / Bug Bars

Anolyzo Atu<l< Surf111ce

Security & Privacy Risk Asso·umen t

Thr·iit Mod·llng

U>e Approvod Tools
OepreG'lte Uns.1fo functions
St,1tic A na l y s i s

fuu Testing
Atuck Surface Review

httl)://www.microsoft.com/security/sdl/discover/default.aspx
Each phase of the overall SDLC process has SDL security mappings. The mappings to each phase are shown in the graphic above, taken from Microsoft.

Phases of the MS SOL Each phase of the high-level SDLC processes listed on this slide has associated SOL security mappings. The
diagram in the slide, taken from Microsoft, shows the mappings that are covered in the following s lides.

© 2017 Erik Van Buggenhout & Stephen Sims

25

·Training Phase The SDL process states that developers, software testers, and technical program managers take at least one training per year. -..:

· ·

Keeps those involved up-to-date on secure coding practices, SDL best practices, tools, new threats and techniques, etc.
The various types of threats with each language used should be covered:
· CIC++ buffer overflows, integer errors, command injection, etc. · C++ use after free attacks: e.g.. dangling pointers · Web app attacks such as SQL Injection and XSS

Training Phase According to Microsoft, leveraging the previously documented references, the SOL states that all software developers, testers, and relevant technical program managers are to attend at least one security training per year, covering each phase ofthe overall SOL process and specific threat types and techniques used for modeling. This requirement helps ensure that each member is up-to-date on his organization's implementation ofthe SOL process, new tools, threats, and commonly used techniques. The training should include any relevant languages used by the developers and it addresses vulnerability classes associated with those languages. Developers in C and C++ get training on buffer overflows, function pointer overwrites, integer errors, fonnat string attacks, information leakage, use after free attacks, and many others. Web application developers receive training that is more focused on attacks, such as SQL injection, cross-site request forgery (CSRF), cross-site scri pting (XSS), and others. Threat modeling and risk assessment techniques are also included in the training programs.

26

© 2017 Erik Van Buggenhout & Stephen Sims

Requirements Phase

· · ·

Establish requirements, a vulnerability tracking system, and remediation.
Identify the impact of various vulnerability classes: · Set a tolerance bar and stick to it (bug bar)
Prioritize and resolve relevant risks
Perform risk assessments to determine impact: · Quantitative and qualitative ratings · Evaluate regulatory requirements

Requirements
Establish Security Requirements
Create Quality Gates / Bug Bars
Security & Privacy Risk Assessment

Requirements Phase During the requirements phase, there are three main areas to cover. The first area is to establish the security requirements and to build a security team and the processes assigned to the project. This includes assigning security staff, creating a tracking system for bugs, creating a remediation process, and establishing the criteria for any privacy requirements around the data elements involved. Introduction ofthese items early on will help ensure a smooth process flow.
The next area is to set a tolerance bar or threshold that must be adhered to in order for the software to go into production. This typically falls in line with an organizational risk assessment process. During most risk assessment processes, the primary goal is to document all risk items, map them to policy and regulatory violations, set the initial risk rating, map in any potential mitigations, and document the likelihood and the potential impact to the organization. The difference is that with the S OL, you are setting a threshold that cannot be exceeded. This means that if it is determined during the requirements phase that no medium or high risks are permitted to go into production, they must be fixed prior to release.
The third area is centered around the identification ofsoftware features and functionality and mapping those functions to areas ofconcern, such as with consumer privacy, data protection, and regulatory requirements. It basically serves as a risk assessment on specific areas ofthe application.

© 2017 Erik Van Buggenhout & Stephen Sims

27

Design Phase

· · ·

Set security design requirements: · How to secure application features, cryptographic
communications, specs, etc.
Identify and analyze the attack surface: · Location of potential threats and vulns based on the design? · More on this shortly...
Perform threat modeling: · Allows for additional risk analysis and mapping · What are the threats, likelihood, etc.?

Design
Establo;h Des,gn R.ciuirt'ments
Analyze Attack Surface
Thre.t Modeling

Design Phase During the design phase, three main areas are covered. First, design requirements must be established. Leveraging the requirements phase, software features and functionality must be written to adhere to all privacy and security requirements. Because we are looking specifically at privacy requirements, secure communication and storage are major considerations. Cryptographic design must be well thought out for secure implementation and the types of cryptographic attacks must be well understood. This is a good spot to add in some peer review.
Next, we want to thoroughly understand and analyze the attack surface. We must look at the design from a high level all the way down to a low-level and identify all of the potential areas where vulnerabilities may exist and map threats to those vulnerabilities. We perform this task during the design phase so that we can make changes prior to any development as a cost-saving measure, and hopefully a time-saving measure. We will get into more on attack surfaces shortly.
Finally, we flow from analyzing the attack surface into threat modeling. This gets specifically into mapping the actual attacks to the attack surface. lt is okay to get creative with the types of attacks during this phase as the team should be encouraged to think outside of the box. Threat modeling is also covered shortly.

28

© 2017 Erik Van Buggenhout & Stephen Sims

Implementation Phase

,,.

·

Identify tools for developers to use: · Dev-friendly security tools with automation · Compile-time security options

·

Remove unsafe/banned functions: · Remove functions known to introduce vulnerabilities · Low-cost method to decrease vulnerabilities

·

Use source code scanning tools (such as Fortify orVericode): · Identify low-hanging fruit before compiling · Manual code review of critical application components

lmplement.11,on
Deprecate Unsafe Funct ions Static Analysis

SAN~

Implementation Phase The implementation phase also has three main areas. The first area is centered around the use ofapproved tools. Security researchers and engineers along with developers should work together on solutions to help automate as much ofthe S DL as possible, without sacrificing security. Not every developer can be expected to be security experts and to get better support for the SDL, automation is highly desirable. Penetration testers, security engineers, incident handlers, and developers are all good resources to help identify the types of tools and exploit mitigation protections that should be used by the compiler. Depending on the target operating system where the software will be installed, compiler options such as support for address space layout randomization (ASLR), SafeSEH, stack and heap canaries, data execution prevention (DEP), and others should be designated as requirements. These types of security options and exploit mitigation controls are constantly changing and should be followed closely.
The next area is to identify any unsafe functions and add them to a list of banned functions that can be easily referenced and enforced. If possible, automating the discovery of banned functions during code review should be implemented. It is also common for operating system developers to remove unsafe functions that could cause issues if not identified during the development process. Microsoft removed support for certain functions that allow for the modification of DEP settings on Windows 7. It is important to track these types ofchanges.
Finally, a code review should be performed prior to compilation. Prior to the creation of automated source code scanning tools, manual review is required. This is a time-consuming process, and the chance ofthe reviewer missing vulnerabi lities is quite high. Not all languages are supported for review; however, 1he hulk of the primary languages are supported by various tools such as Fortify and Veracodc. In this author's experience, many ofthese tools are good at catching the low-hanging fruit, but they can have a bit more difficulty identifying more complex vulnerabilities. There are often a large number of false positives that must be removed prior to reaching any real areas ofconcern. When scanning large source code files, there can sometimes be thousands of possible vulnerabilities identified, with the majority not being a real concern. This can be frustrating for developers who are trying to ensure their code is secure and it is often better to have a separate code review team who can help remove some of the burden.

......

© 2017 Erik Van Buggenhout & Stephen Sims

29

Verification Phase

· · ·

Use dynamic analysis to find memory corruption issues: · Code coverage to get deep reach · Focuses heavily on heap management
Use fuz.z.ing to find bugs after compiling: · Input malformed data to "good" programs · Techniques include static, random, (intelligent) mutation
Rev;ew the attack surface ;dentified dudng the des;gn phase.

Verificat , o n
Oynam,c
Analysis
Anack SurfiCe Revi'°w

Verification Phase There are three main areas offocus during the verification phase. This phase occurs after the source code has been compiled into an object file. At this point, regardless of how well yo u think you know your code, it has changed. The type and version of the compiler, the compiler and linker options used, exploit mitigation controls used, and other options used can heavily influence how your code will look on the other side. It is with this understanding that we must find ways to test all areas of input to the application and get good code coverage. Dynamic analysis tools and fuzzing tools have a similar role and the terms are often used synonymously. Dynamic analysis focuses more specifically on identifying runtime errors, dynamic memory corruption, user privileges and rights, and some other specific areas. This often includes using dynamic tools to input data into the application and monitor behavior.
Fuzz testing or fuzzing is a useful software testing technique that involves sending malformed data to protocol implementations based on RFCs and documented standards. Programs are built to function, preferably based on standards that allow for interoperability with other vendors' products. As we know, programs can be built in many different languages using a combination of many different functions. If you have I00 developers write the same application, each one will likely be different at the source level. Fuzzing requires you to think of all ofthe ways that a developer could have written a piece ofsoftware and test for re lative vulnerabilities. It is not that simple of a process, though, as many vulnerabilities are complex and difficult to predict. Take the vulnerability class called "use-after-free." This typically involves dynamically allocated objects that are freed and later referenced by code. An active pointer that is pointing to a freed object is a potential rec ipe for disaster. These types of vulnerabilities can be difficult to spot, especially during incremental code changes. Fuzzing can greatly increase the chances of finding such bugs. There are various types of fuzzing techniques covered in other courses, including static, randomized, mutation, and intelligent mutation fuzzing with tools such as the sulley fuzzing framework by Pedram Amini and Aaron Portnoy.
At this point, we also want to review the attack surface that we analyzed during the design phase to ensure that nothing was missed. It is fairly common for changes to occur during the actual development of the software. This allows for an opportunity to ensure all threats and vulnerabilities arc captured.

30

© 2017 Erik Van Buggenhoul & Stephen Sims

Release Phase

· · ·

Have an incident response plan · No such thing as perfect security even with a.solid SOL · Provide and train contacts to handle incidents
Perform a final security review that serves as an overall validation of the SOL for a given effort.
Certify and document that the development has adhered to all requirements.

Release
Incident Response Plan
Final Security R~view Release
Archive

SANS

Release Phase There are also three main phases during the release phase. The first is to ensure there is an incident response plan relative to the developed software. No matter how hard we try, there will never be such a thing as perfect security. If a bug is discovered, especially a critical bug, who are the main points ofcontact to quickly initiate a response? The answer to this question is exactly what this step is about. As per Microsoft, this step is also used to set up points ofcontact for inherited code. If code used was developed outside the group and questions arise, contacts should be available to answer questions, especially in lieu of training and documentation.
The second and third security review steps are in place to designate a time to take a holistic view ofthe SDL process to date. It works directly with the release archive step. The goal is to ensure that all phases and steps have been covered and documented. This serves as a crucial role in audits and adherence to regulatory requirements. It is this phase in which a good checklist and tracking system come in handy. The attack surface should be validated one final time, as well as threat modeling, risk tolerance as documented during the requirements phase, risk assessment, and all other steps.

© 2017 Erik Van Buggenhout & Stephen Sims

31

Response Phase

· ·

Have an official stance and policy on vulnerability disclosure: · Allow researchers to disclose discovered vulnerabilities · Create a patch-management process
Train operational security group in new attack techniques: · Vulnerability disclosure websites · Exploit mitigation controls and methods used to bypass them

SAN~
Response Phase The final phase is centered around the implementation ofan incident response process. As stated before, there is no such thing as perfect security. No matter how mature and effective your SOL process, there will always be bugs discovered and other security issues to handle. Every organization should have a vulnerability disclosure process. There are various philosophies on how disclosure should be handled, such as full disclosure, responsible disclosure, and limited disclosure (which falls somewhere in between the other two). There should be a clear-cut process for researchers and others who find a potential bug or vulnerability in your products; even if that process says that anyone reporting bugs may face legal action. This is likely not the preferred approach, but it informs those wanting to disclose a concern about your organization's stance on disclosure. Once someone submits a finding, this is when your incident response plan goes into action. Who will respond to the individual or organization disclosing the finding? Who will take action and reach out to developers or others who should be involved? How will the submission be tracked and how long will it take to officially respond or patch the finding? How will the patch be distributed to customers if applicable? These are all processes that should be well documented and actionable.

32

© 2017 Erik Van Buggenhout & Stephen Sims

Selling the Process
The SDL is not easy to implement and does not happen overnight.
· C-level management support is critical to success · Must not inhibit the ability for developers to be creative and efficient · The SDL is not a "one size fits all" model:
· No universal technique or gold standard · 100 developers versus 10,000 developers · Requirements for a firewall are much different than requirements for a word processing
application
· Implemented properly, the savings with a successful SDL can be quantifiable and it is repeatable

Selling the Process A common question is, "How can I sell this whole SDL thing to management and get support?" This is likely as hard ofa task as the actual implementation of the process. In this day and age, we are all inundated with processes and the introduction ofmore processes can face resistance from many angles. Always remember that the ability to factor in monetary savings to the equation will almost always get some level of attention. A properly implemented SDL should do exactly that- save money. As with any other proposal, pitching the introduction of the SDL to your development process should be well thought-out and well-presented. interviewing various lines of business from their perspective is highly beneficial. If the security operations group is burdened with incidents stemming from poor code, you want to know that information. If management is dealing with new regulations and an audit, this can also be useful information. How can you make the company's job easier and cut costs? This should be a key element when going in to pitch the process for approval.
Executive-level support for the process is critical to its success. Lacking this support will most likely result in a poorly implemented SDL or even complete failure and resistance. This should be vocalized during the proposal. One key concern that this author has learned from developers is that the SDL must not inhibit the developers from being creative and innovative. It must also not burden them down with too much process. Development can be a stressful profession with stringent requirements and sensitivity to time. Education and the ability to automate as much of the process as possible will garner more support from developers and program managers.
It must also be remembered that the SDL is not a "one-size-fits-all" model. Each organization can adopt the overall framework but must customize it to their needs. It is also not a process that can be implemented overnight, or even in a month. lt takes experience and ongoing customization. A company that has I00 developers wi ll need a different SDL application than a company with 10,000+ developers. Also, it cannot be a blanket application to all instances. A division working on the design ofnew firewall technology may need a different SDL than that of a word processing application.

© 2017 Erik Van Buggenhout & Stephen Sims

33

This is not to say that the framework is not applicable; it is simply saying that the application ofthe various steps during each phase may have to be customized to meet the needs ofthe organization and the security requirements.
Again, the biggest selling point is that a properly implemented SOL should result in quantifiable savings. It should make for an efficient development process, and there should be a noticeable change and decrease in code fixes. The term return on security investment (ROS[) is often a helpful approach. The general idea is that by spending time and money doing something to reduce or avoid a potential or existing risk will prevent a future loss that would likely be greater than the cost ofmitigating the risk.

34

© 2017 Erik Van Buggenhout & Stephen Sims

Agile Development with the SOL
Often, questions arise about the capability of the SOL to work with Agile development.
· Microsoft designed a specific approach available at http://www.microsoft.com/security/sdl/discover/sdlagile.aspx
· Support for frameworks such as Scrum · Specific approach for sprints, bucket practices, and one-time practices · Most critical steps are performed during every sprint · Other steps applied during project initiation or during bucket practices
at set intervals
SANS
Agile Development with the SDL Agile development is a development process that is highly utilized and often difficult to implement. Lt is often seen as an inhibitor to creativity by many developers who have not successfully implemented the process and changed from models such as the waterfall model. Microsoft set up a specific application of the SDL to agile development methods that can be viewed at http://www.microsoft.com/security/sdl/discover/sdlagile.aspx. It maps specific portions and steps of the standard SDL previously covered to different development phases using the agile approach. Every agile sprint receives the most critical steps ofthe SDL based on the biggest areas ofconcern. The most important tools are run, threat modeling is performed, and code review is performed, as well as various other security reviews. A sprint is typically several weeks long and a fast-paced subset of development for the overall product. Applying all phases of the SOL to every sprint is not actionable. The other areas ofthe SOL that are not applied during every sprint can be applied at project initiation, such as those relative to the requirements and design or during bucket practices that occur at set intervals.

© 2017 Erik Van Buggenhout & Stephen Sims

35

Threat Modeling
I Repeatable process to identify and remove threats. I Often occurs during the design phase of a Software Development Life Cycle (SDLC).
I Helps security engineers and developers to think more like attackers.
I Many organizations struggle with too much process and documentation, which is non-actionable. I Can be difficult to evangelize to an organization due to cost, time, and lack of experience.

Many companies fail to do this, or do it poorly!

... but it's much more expensive to fix code later!

SAN.~

Threat Modeling Threat modeling is an extremely valuable resource if implemented properly. Think about the cost associated with reviewing and fixing production code, or even code that has not been published yet, when a significant finding is found. Often times a vulnerability may be left in the code due to the results of a risk assessment showing that the cost would be greater to fix the bug compared to the impact to the organization ifit was discovered and exploited. Regardless ofthat assessment and justification, it would clearly be more desirable if that bug had never been introduced in the first place. This is where threat modeling can he lp.
Threat modeling is easy to talk about and hard to implement into an actionable process. It used to be that few developers and security professionals knew exactly what threat modeling was and how it was to be implemented. With the help of various organizations such as Microsoft, Cigital, and OWASP, threat modeling has been made more actionable and dynamic. Similar to that of Microsoft's SDL, it is not a process that can just be implemented with perfect results. It takes time and effort, with much training and practice. Threat modeling is commonly performed as part o f the design phase in the development process. Once the low-level diagrams are available- showing all of the data fl ows and processes it is much easier to look at the attack surface and point out potential vulnerabilities. The goal is to make an actionable, repeatable process in the desig n phase of the Software Deve lopment Life Cycle (SDLC) to prevent vulnerabilities from being introduced into the code or overall architecture.
Many organizations get too focused and overwhelmed with documentation and process. This becomes nonactionable and slows down the development process. It is better to simplify the threat modeling process and focus on the biggest areas of concern, rather than try to accomplish too much at once and lose support for the initiative. It must also not impede the developer's ability to be creative, especially in product-based companies. T his goes for the overall S DL process as well. Similarly to selling the SDL process, it can be difficult for some organizations to gain support for threat modeling. Demonstrating the process, evangelizing it, showing other companies who is using the process, and starting small can help. You must remember to map technical risks into business terms to ensure the request has teeth.

36

© 2017 Erik Van Buggenhout & Stephen Sims

,-...

Some Questions to Ask

Must determine:
,-.
· Who are the threat agents or actors? · What is the goal of the agents or actors? · What is the attack surface such as access to input/output? (e.g., APis, UI,
File I/O, inside users, etc.) · What are the techniques used to compromise a potential vulnerability? · Where are the trust boundaries? · Can risks be mitigated immediately or residually? · What is the quantitative and qualitative impact on the organization?

Some Questions to Ask Once you have the design to which you want to apply threat modeling and you ensure it is sufficiently low level, there are many questions to start asking. There are various publicly available threat models such as STRIDE from Microsoft, as well as additional risk assessment models such as Microsoft's DREAD, the Department of Homeland Security's (DI-IS) Common Vulnerability Scoring System (CVSS), Carnegie Mellon's OCTAVE, TRIKE by Brenda Larcom and Eleanor Saitta, and many others.
We want to know about the threat agents or actors. These could be inside users with privileged access, malicious users from home on their computers or over phones, malicious software, jailbroken smartphones, and countless other threats. We want to understand their potential goals, such as harvesting credit card numbers, denial of service, and intellectual property theft. What is their attack surface? Perhaps they are able to communicate with our frontend web servers with no authentication and then have additional opportunities with authentication. ls authentication assumed once initially authenticated? What e lse is exposed? DNS servers, mail servers, etc. Do we have store branches? ls social engineering a possibility? How about more complex attacks like communications occurring from inside a trust boundary? Get creative. What techniques are used to exploit the attack surface and potential vulnerabilities identified? According to OWASP, the attack surfaces include all data flows in and out ofan application, the code that protects these flows, the data elements involved, and the code that protects those elements. Check out the;: following cheat sheet for some tips from OWASP: https://www.owasp.org/index.php/Attack Surface Analysis Cheat Sheet.
Can these risks be mitigated through existing controls? ls it possible to fix them with code? Sometimes the vulnerabilities identified during threat modeling prove challenging to fix and the fixes do not always come from code changes. You must always assume that communications coming from outside of a trust boundary could be malicious. What happens ifsomeone breaks out of the security controls enforced by an embedded device? They can now potentially reverse engineer a mobile application, proxy the communication, and circumvent security restrictions. As we do with any type of risk assessment, we must determine the quantitative and qualitative impact on the organization. How bad could it be? How much would it cost? What is the likelihood?

© 2017 Erik Van Buggenhout & Stephen Sims

37

MicrosoftThreat ModelingTool (I)

.:w !!!'DC

..., 00

-~ r·------------------------- - -- ..
'
I

-

· ,1,-,. ~'I

' HI

-- - r- -r..-.

··o.--------

-

. - -.-...-... '
1 ------ - ---------- - -------- - - - ~

,.,.. .,,.,,,

SAN~
Microsoft Threat Modeling Tool (1) Microsoft released a free tool simply called the Threat Modeling Tool. You can down load the Microsoft Threat Modeling Tool version 20 14 at http://www.microsoft.com/en-us/down1oad/details.aspx?id=425 I8 General information about the tool can be found here: http://www.microsoft.com/security/sdl/adopt/threatmodeling.aspx. Microsoft also released a great card game called the "Elevation of Privilege Card Game" to practice threat modeling against your designs. It is available at http://www.microsoft.com/security/sdl/adopt/eop.aspx.
With the Threat Modeling Tool, you can draw your designs and have an automated tool get you started on asking the right questions. It used to require MS Yisio; however, with the new version released in March 2014, Yisio is no longer required. The initial screen, as shown on the slide, is the "Design View." This is where you actually draw out your designs to the whiteboard and make all of the relevant connections and data flows. One nice thing is that the "Messages" area on the bottom, which will let you know if you have likely missed a data flow. The example drawn on the slide is that ofa simple network communication. The red hyphenated lines indicate a trust boundary where increased attention should be placed. From within a trust boundary, data and flows may be implicitly trusted, as where communications coming into or leaving a trust boundary should be more aggressively scrutinized.
There arc other free tools available on threat modeling, such as Seasponge from the Mozilla Winter of Security 2014:
https://air.moziIla.org/mozi Ila-winter-of-security-seasponge-a-tooI-for-easy-threat-modeling/ https://github.corn/mozilla/seasponge

38

© 2017 Erik Van Buggenhout & Stephen Sims

Microsoft Threat Modeling Too l (2)

Ruonw,gA>
.._l.....

Am91<r.,p.tfiom

=~:=::i::::~:=..M..M.fr(~Ytnt -- - - - --~

~~.::n°::~~ ~ __·,I 1..::IY6:::..._._ _ _

__

O bject properties
When clicking on an object. the properties section is populated with a series of questions.
Depending on how you answer each one, the threats listed in the "Analysis View" may change. It is a useful feature that was lacking in the older version of the tool.

Microsoft Threat Modeling Tool (2)
On this slide is a screen capture of the "Properties" section of the Threat Modeling Tool. When you click on certain types of objects, this region will be populated with a series ofquestions. Depending on how you answer each one, the threats listed in the "Analysis View" may change. It is a useful feature that was lacking
in the older version of the tool.

© 2017 Erik Van Buggenhout & Stephen Sims

39

MicrosoftThreat ModelingTool (3)

P Search

0 I lmpers) Threat; ~tion Using

Catego,y: j Elevation Of Privilege _ _ J Mitigated

· High

0 I I Threat Potential Data Repudiaj Catego,y: ~

tion

f Not Started

· High

0 I I ---=====; Threat Potential Data Repudia Category: ~

tion

Mitigated

· High

0 Threat ~ tial Process Cntshl Catego,y: [ Denial Of Service

Mitigated

· Medium·

Description:

Justification for threat state change:

J Web Application crashes, halts, stops Of runs slowly; in all

Due diligence performed during application

cases violating an availability metric.

dev~opment to avoid applic.,tion crash. Validation

tes1ing through dynamic analysis and QA to be

performed. DoS testing to be pe,rfomled through

fuzzing and resource exhaustion tmng.

last updated by DERP\stephen.sims at 7/ZJ./2014 11:23:59 AM
0 Threat I Data Flow HTTPls Pote! Catego,y: ,..ID-e- nia-1O_ fS_e_rv_i_,-e- - - -..,.,H/A Not Applicable

I':"':\ ..., . 1.·,, .. .. . ----:-:---:1.
Threat Information Notes - no entries

l ,r,-, ·· ,...,,.. ··j

a .. . ,.. .

· High

Microsoft Threat Modeling Tool (3) This slide shows the "Analysis View" screen. Once you have drafted your design into the design window, click on "View, Analysis View" fi-om the ri bbon bar to see what threats have been identified by the Threat Modeling Tool. It is designed to get you thinking about potential threats and add some automation for developers who may not be security experts. That being said, the tool does a great job at asking the initial questions that should be asked or making simple comments such as, "Web Application crashes, halts, stops or runs slowly; in all cases violating an availability metric." This is an example ofa topic that may not be brought up without the help of the tool. Not all of them will apply to each flow and they can be removed ifappropriate.
As seen on the slide, there is a Threat and Category. Following that are drop-down boxes showing the status of the risk item and the qualitative rating. On the left ofeach threat is a drop-down arrow that expands the description of the threat. In the example shown, you can see that the "Justification for threat state change" area on the right is populated with user-supplied content.

40

© 2017 Erik Van Buggenhout & Stephen Sims

MicrosoftThreat ModelingTool (4)

Threat Modeling Report Threat Model Summary:

Created on 1/12/2017 2:25:57 PM Threat Model Name: WWW Threat Model Owner: Stephen Sims Reviewer: Bob Dole Contributors:

Not Started

22

Not Applicable

1

Needs Investigation 1

M1t1gat1on Implemented 6

Total

30

Total Migrated

0

Description: Communication from external customers for access to onhne banking accounts using standard browsers and smartphone devices.

Assumptions:

External Dependencies:

Microsoft Threat Modeling Tool (4)
When clicking on "Reports" from the ribbon bar, you can select the option to generate a full repo11 ofthe threat model. On the slide is a snippet of that report. Note: Pieces ofthe report were moved around to fit on the slide. As you can see, the infom1ation about the threat model author, description, assumptions, and dependencies are shown. A summary of the number ofthreats and the ones still needing to be triaged are also shown. Below this section in the HTML-generated document are all of the threats listed associated with each device, trust, store, or data flow shown.
A zi p file is available from Microsoft called "Threat Modeling Tool 2014 Principles.zip." [t contains a video, sample threat models, and documentation. lt is available for download at http://aka.ms/Bvl 2as.

© 2017 Erik Van Buggenhout & Stephen Sims

41

Identify Potential Threats
Simple Example

Browser using JS, AJAX.
HTML.
HTTPS. HTTP

equest

Trust boundary

Aulh Resp
Med;cal Records

Identify Potential Threats On this slide is a very simple network diagram as created with the older version of the Microsoft Threat Modeling Tool. This simplified example is a good place to start when practicing threat modeling. Take a few minutes to identify potential threats. Note the trust boundary marked by the curved, hyphenated line. T rust boundaries require special attention and often influence what components will be fuzzed. On the next s lide are some ofthe potential areas of concerns that should be addressed prior to implementing the design.

42

© 2017 Erik Van Buggenhout & Stephen Sims

IdentifyThreats - Some Possibilities

AulhResp~ Aul1;J
~L....,-

,,,....
SANS

'a~Q;
M cl Records

Identify Threats - Some Possibilities On this slide are some potential threats and vulnerability spots that must be addressed. Some examples of attack categories are Denial of Service (DoS), spoofing, tampering, information disclosure, elevation of privilege, repudiation, and many others. Not all apply to each threat or vulnerability, and we can rule them out as they are addressed. The outside user could be on a personal computer, a smartphone, a kiosk in a store branch, and other possibilities. This is where it is important to think like an attacker. What about the scenario in which your company creates a smartphone application that should be protected by the controls included with an iPhone. Let us say that the attacker jailbreaks the iPhone and is able to circumvent all controls, install his own sollware, reverse engineer, and learn more about your smartphone application, proxy connection requests, etc. Does this change the typical attack surface? It sure does!
Again, it is easy to start with high-level designs when it comes to threat modeling, but the real power comes in when you get into low-level application designs and data flows. It is at the design stage during the SDLC that you can help prevent bugs or design flaws from being introduced by threat modeling. The more this process can be automated, the more likely it is to be adopted. We cannot expect that all of our developers will become security experts overnight, and if this can be rolled into the development process as seamlessly as possible, our chances of success increase.
Are there any missing trust boundaries that stick out? You may have noticed one should be placed between the Web UI and the "Medical Records" data store, as well as possibly between the Web UI and the Authentication.

© 2017 Erik Van Buggenhout & Stephen Sims

43

STRIDE

· Threat Category: · Spoofing Identity · Tampering with Data · Repudiation · Information Disclosure · D enial of Service · Elevation of Privilege

C
SAN~

What about the impact, likelihood, etc.? ~

Example
Vulner bili Point Client-to-server web communication
Attack SQL Injection
Seen i Attacker could steal medical records from the database
~ Input Validation

ST R J D E The Microsoft Threat Modeling Tool is based on the STRIDE threat model. As previously mentioned, there are quite a few threat models made publicly available by various organizations. The Microsoft STRIDE threat model is available al http://msdn.microsofl.com/en-us/library/ee823878%28v=cs.20%29.aspx.
STRIDE is an acronym that stands for "§pooling Identity, I ampering with Data, .Repudiation, !nformation Disclosure, .Q.enial of Service, and !;_levation of Privilege." Each of these is a category ofthreats that should be well known to all of us by this point in our careers. Under each of these threat categories are various attacks, which the Threat Modeling Tool details. The model would have you identify a potential vulnerability point within a design, such as data coming from a user into a web application. Threats to that vulnerability and the attacks associated with them are then identified, such as cross-site scripting (XSS), parameter tampering, SQL injection, etc. Under each ofthe potential attack types, you would then document some scenarios that could occur. Finally, some mitigations for each vulnerability can be identified.
What about the impact ofan event, the likelihood, and other risk assessment modeling?

44

© 2017 Erik Van Buggenhout & Stephen Sims

DREAD
Dread stands for: ·Damage · Reproducibility · Exploitability · Affected Users · Discoverability
Each identified threat is given a value from 1 to 10 for each of the five areas. Divide each threat by 5 to prioritize.
DREAD DREAD is a multidimensional risk calculation model for prioritizing threats. Microsoft documentation on DREAD can be found at http://msdn.microsoft.com/en-us/librarv/ff648644.aspx.
The five areas applied to each threat include Q amage, .Reproducibility, ~xploitability, Affected Users, and Qiscoverability. Damage can be compared to the impact a successful attack would have on the organization. A compromised database containing a million patient records in the worst-case scenario would be a grave impact and as such, we assign it a 10. The reproducibility pertains to the likelihood that the attack is successful and reproducible. Once a SQL injection attack is identified, it is typically easy to reproduce with success. We gave this one a 9. The exploitability pertains to the difficulty in pulling off the attack successfully. Is it a wellknown attack with lots of tools and help, or is it obscure and difficult? We gave this one an 8. Affected users pertain again to the impact. In our scenario, a million patients are affected and as such we give this one a 10. Finally, we have discoverability that pertains to the likelihood that someone will find out about the
vulnerability. In our example, we've assigned this one a I0, as SQL injection vulnerabilities are often easy to
spot. Each organization would apply its own ratings to this threat. When we add up each of the five areas, we get 47. We divide this number by 5, representing the 5 areas in DREAD, and we come to our overall rating of 9.4, which can be considered high. We would likely want to address this threat with priority.

© 2017 Erik Van Buggenhout & Stephen Sims

45

SecuringYour Software -Additional Resources
Some additional resources that can prove to be useful for securing your software include:
· http://www.microsoft.com/en-us/download/details.aspx?id=29884 Microsoft SDL
· https://blogs.microsoft.com/microsoftsecure/2014/04/15/introducing-microsoft-threat-modeling-tool-2014/ Microsoft Threat Modeling Tool 2014
· http://www.microsoft.com/security/sdl/adopt/eop.aspx Elevation of Privilege Card Game
· http://msdn.microsoft.com/en-usnibraty/ee823878(v=cs.2o).aspx Microsoft STRIDE
· http: //www.first.org/cyss/cvss-dhs-12-02-04.pdf Department of Homeland Security's (DI IS) Common Vulnerability Scoring System (CVSS)
· http://www.cert.org/octave/ Carnegie Mellon's OCTAVE
· http://octotrike.org/ TRIKE by Brenda Larcom and Eleanor Saitta
s~s
Securing Your Software-Additional Resources Some additional resources that can prove to be useful for securing your own software include:
http://www.microsoft.com/en-us/download/details.aspx?id=29884 Microsoft SOL
https://blogs.microsoft.corn/microsoftsecure./2014/04/ l 5/ introducing-microsoft-threat-modeling-tool-2014/ Microsoft Threat Modeling Tool 2014
http://www.microsoft.com/security/sdl/adopt/eop.aspx Elevation of Privilege Card Game
http://msdn.microsoft.com/en-us/library/ec823878(v=cs.20).aspx Microsoft STRIDE
http://www.first.org/cvss/cvss-dhs-12-02-04.pdf Department of Homeland Security's (OHS) Common Vulnerability Scoring System (CVSS)
http://www.cert.org/octave/ Carnegie Mellon's OCTAVE
http://octotrike.org/ TRIKE by Brenda Larcom and Eleanor Saitta

46

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Averting Payload Delivery
· Day 3= Preventing Exploitation
· Day 4: Avoiding Installation, Foiling Command & Control, & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

SEC599.3

Securing the Network

Network Access Control & 802.1 X

Securing Software

Software Development Lifecycle (SDL) & Threat Modeling

·

Vulnerability Assessments Exercise: Authenticated Scans Using Nessus

Patch Management

Exploit Mitigation Techniques

Exercise: Exploit Mitigation Using Compile-Time Controls

Exploit Mitigation Techniques - Exploit Guard, EMET, & Others

Exercise: Exploit Mitigation Using EMET & MalwareBytes

Securing Endpoints

OS Hardening & Best Practices

Endpoint Protection Solutions Application Whitelisting to Stop Payload Execution

Exercise: Configuring Applocker

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

47

Vulnerability Assessments
IIt is vastly important to assess the state of your organization's security on a frequent basis. This can be performed by regular vulnerability assessments.These days, a myriad of options exists:
· Vulnerability scanning & penetration testing · Bug bounties · Source code reviews · In-depth fuzzing of third-party applications
·
A hybrid approach ofvarious methods will offer best results & ROI
SAN~
Vulnerability Assessments It is vastly important to assess the state ofyour organization's security on a frequent basis. This can be performed by regular vulnerabi lity assessments. Due to the state ofthe current cyber security landscape, vulnerability assessments have become the norm and the vast majority oforganizations are combining different techniques to understand their cyber risk exposure. Some ofthe more popular ones out there include:
· Vulnerability scanning & penetration testing · Bug bounties · Source code reviews · In-depth fuzzing of third-party applications (not common)
So, what approach is best? In reality, there is no silver bullet... A hybrid approach of various methods will offer best results & ROI. "Bug Bounties" are currently on the rise and an increasingly large number of organizations is rewarding security researchers with bounties for submitted bugs. Does that mean mandated penetration testing o r source reviews are on the downfall? No, they are still highly useful in a structured SDLC approach, where testing is performed continuously throughout the SDLC, after which bug bounty hunting can take place once the system is in production.
Again, there is no silver bullet; there's just a lot ofoptions to choose from©

48

© 2017 Erik Van Buggenhout & Stephen Sims

Automated Vulnerability Scanning
-- . -- .
-- ·-·

"

u

,..._

·~· -
-.... ·~-s.·c-- b~
-0-- .. ""'

_K_,
IMll ..,.-.111t....-
f4_-3r, ~·e:"'

. .

....u..............

In the screenshot on the left. we can see what a typical vulnerability scan looks like.
As you can see. Ne»us provides a highly intuitive interface in which we can spot vulnerabilities on the different systems in our environment. Nessus also allows creating" deltas" between different scans to assess our evolution.

Automated Vulnerability Scanning In the screenshot on the left, we can see what a typical vulnerability scan looks like. The vulnerability scanner we are using is Nessus, which is a commercial product. Nessus has come a long way. Initially merely a vulnerability scanner, these days it has grown into a full-blown vulnerability management toolkit. As you can see, Nessus provides a highly intuitive interface in which we can spot vulnerabilities on the different systems in our environment. Nessus also allows creating "deltas" between different scans to assess our evolution.
Next to Nessus, different other vulnerability scanners exist with similar functionality. Some ofthe most popular ones include Rapid? Nexpose / Insight & Qualys. OpenVAS is an open-source vulnerability scanner that is free ofcharge. While OpenVAS can be useful, it's important to note it has much fewer plugins as opposed to commercial alternatives and doesn't have the same performance.

© 2017 Erik Van Buggenhout & Stephen Sims

49

Automated Vulnerability Scanning - Credentials

-·-

1···--=---- -

..,_,.
--

--

Another interesting feature of Nessus is its capability of using (administrative) credentials to perform authenticated scanning.
Authenticated scanning provides an in-depth insight / configuration review of your environment, as the scanner will also be able to assess client-side software & configurations!

Automated Vulnerability Scanning- C rede ntials Another interesting feature supported by the majority ofvulnerability scanners is authenticated scanning. When doing internal vulnerability scanning, it is highly advisable to enable authenticated scanning instead of unauthenticated scanning:
Unauthenticated scanning will perform basic network discovery & enumeration ("port scanning");
after, it will run a number ofplugins to assess vulnerabilities exposed on available network ports; · Authenticated scanning will actively connect to the systems (using administrative credentials
preferably) and will review the internal configuration ofthe system. It will thus also be able to identify issues (missing patches or misconfigurations) related to client-side software, which is one of the most dominant attack vectors today.
The sl ide above illustrates Nessus' configuration, where a credential for a Linux system is being provided.

50

© 2017 Erik Van Buggenhout & Stephen Sims

Penetration Testing

<VENDOR>: Did you say penetration test? ©

r

Client-side test

Network services test

Wireless security test

Web application test

Physical security test

Social engineering test

Cryptanalysis attack Source code review

Stolen equipment test Architecture review

Product security test Configuration review

Penetration Testing Penetration testing is a highly mature service in today's cyber security landscape. Many vendors offer a wide variety of services. Even more, many organizations are in-sourcing penetration testing teams to perform continuous assessments. How should you approach it?
· What type of testing should you perform? · What should the scope be? · What should the periodicity of testing be? · Should I go for black-boxing vs white-boxing?
What is best for you? The answer is simple: It depends. We believe strongly in first implementing a number of (basic) security controls, after which they can be tested. For example, it's a waste of effort to launch phishing campaigns if you have never run any security awareness initiatives. We can predict the results up fi-ont: if employees have not been educated about security topics they are bound to fall into the trap that is going to be laid out for them. The same is true for secure development; running a source code review against a piece of code that was developed by developers that have never received training or have no "secure coding" standards is bound to result in a repo11 full of findings.
It should, however, be noted that a nice "red-looking" report from a penetration test can often make a point to decision makers and thus "open the gates" for additional cyber security investments.

© 2017 Erik Van Buggenhout & Stephen Sims

51

Bug Bounties
When researchers are unsure if their vulnerability disclosure to your organization will be taken positively, they may opt to keep it to themselves, or sell it to a third party:
· Some vulnerabilities can be worth a lot of money
· Remote browser or document-based exploits can go for >$10K USD · Remote Windows Kernel bugs can go for >$100K USD · Remote Apple IOS "jailbreak" exploits can go for >$1M USD
Offering a bounty can make researchers feel comfortable going to your organization:
· They don't have to worry about legal action as long as they stay within the rules of your bounty program
· Payment can scale depending on the seriousness ofthe vulnerability
SANS
Bug Bounties The more welcome vendors make those interested in disclosing a vulnerability feel, the more likely they won't sell it to a third-party, release it publicly, or keep it to themselves. If they have to be concerned about potential legal action many will simply avoid the risk. Some vulnerabilities can be worth a lot of money. This author has sold browser-based exploits affecting Internet Explorer for $ 1OK - $20K USD to ethical buyers. Ethical buyers are those who disclose the vulnerability to the affected vendor and do not release details publicly, such as iDefense from Verisign and Tipping Point's Zero Day Initiative (ZDI). Windows remote code execution Kernel bugs can go for over$ I00K USD. Zerodium paid $1 M USD to a group who disclosed an iOS remote jailbreak exploit. See here for details: https://www.zerodium.com/ios9.html Some of the buyers are not as transparent in terms of what they do with a disclosed vulnerability. Some have a customer list that may be seen as questionable by some.
Offering a bug bounty program can help to make researchers interested in disclosing a bug more comfortable and more likely to disclose it to the affected vendor. As long as they follow the rules in the bounty program they should have no reason to fear legal action. The payment should scale based on the severity ofthe vulnerability. If the bounty is too low, then it is more likely for the disclosure to get taken elsewhere.

52

© 2017 Erik Van Buggenhout & Stephen Sims

Bug Bounty -Additional References
Some additional resources concerning bug bounty programs include:
· United Airlines - Will pay up to 1 million award miles for disclosures
htU>s://www.united.com/web/en-US/content/Contact/bugbounty.aspx
· Google - Will pay various amounts depending on the severity of the bug
https://www.google.com/about/appsecurity/reward-program/
· Microsoft - Will pay up to $100K USD for exploitable bugs and exploit mitigation bypass techniques
https://technet.microsoft.com/en-us/library/dn425036.aspx
· CanSecWest Pwn20wn - Annual conference and challenge in Vancouver, CA offering high-priced bounties
https://www.cansecwest.com/
SAN~
Bug Bounty - Additional References
T here are a large number of vendors who offer different types of bug bounty programs. A few examples are listed on this slide, with some offering bounties such as airline award miles and others offering cash bounties in excess of$100K USD.
· United Airlines - Will pay up to 1 million award miles for disclosures https://www.united.com/web/en-US/content/Contact/bugbounty.aspx
· Google - Will pay various amounts depending on the severity ofthe bug https: / /www.google.com/about/appsecurity/ reward-program/
· Microsoft - Will pay up to$ lOOK USO for explo itable bugs and exploit mitigation bypass techniques https://technet.microsoft.com/en-us/ library/dn425036.aspx
· CanSecWest Pwn2Own - Annual conference and challenge in Vancouver, CA offering high-priced bounties https://www.cansecwest.com/

© 2017 Erik Van Buggenhout & Stephen Sims

53

Source Code Reviews
Manual Code Review
· This is the process of performing a manual peer review against source code, typically reserved for the most critical parts of an application such as the acceptance of user input.
· The most time-consuming option, but thorough with the right expertise.
Static Analysis and Automated Code Review
· This is an application or machine-driven process of source code inspection looking for code issues such as potential vulnerabilities and inefficiencies.
· Success is dependent on what the product understands about the language.
Dynamic Analysis
· This is applied against the compiled version of the program during runtime, commonly looking for memory corruption bugs and testing behavior.
SAN~
Source Code Reviews There are various types of code reviews that can be perfonned. Manual code review is often seen as the most thorough but is time-consuming and typically reserved for the most critical parts ofan application. This requires someone with the expertise to go line by line through code written by the development team. The quickest option is the use of static analysis tools. Tools such as the Fortify Static Code Analyzer from HP can take an entire project and quickly scan it for easy to spot vulnerabilities, banned functions, and programmatic inefficiencies. The good thing about static analysis tools is the speed at which they can review the code base. One issue is that they often produce a lot of false positives and miss complex bugs. The more they are taught about the supported languages being scanned, the better they can find problems. The tenn static analysis is also used when disassembling a compiled program for review with a tool such as the Interactive Disassembler (IDA). Dynamic analysis is typically perfonned during the validation phase ofthe SDLC once the code has been compiled. Various runtime tools are available such as Microsoft's AppVerifier for unmanaged code. (Unmanaged code refers to low-level languages such as C, C++, and assembly. Managed code refers to languages such as Java, C#, and Ruby.) These tools look for program issues typically related to problems such as heap corruption that are difficult to locate with static analysis. An example of a dynamic analysis tool for managed code is FxCop from Microsoft.
For more infonnation on AppVerifier and FxCop check out the following links:
https:// msdn.microsoft.com/en-us/1ibrary/ms220948(v=vs.90).aspx https://msdn .microsoft.com/en-us/1ibrary/bb429476(v=vs.80).aspx

54

© 2017 Erik Van Buggenhout & Stephen Sims

Most Common StaticAnalysis Tools
There are a ton of tools for static analysis, some supporting multiple languages and others specific to a language, such as Java.
Two of the most popular commercial solutions are:
r
· HP Fortify - Supports more languages than any other tool · Veracode - Popular and effective tool supporting many languages
Two of the most popular open-source or free tools are:
· CodeSearchDiggity - Searches open source projects for vulnerabilities · VisualCodeGrepper - Actively maintained code scanning tool
Both support multiple languages

Most Common Static A nalysis Tools Jfyou use Google to search for "static analysis tools" you will get countless results. There are many lists put together by practitioners stating what they claim to be the best free and commercial solutions avai lable. Some ofthese tools are specific to one or two languages, while others offer support for dozens of languages. There are both commercial tools and open-source or free tools. Two ofthe most popular commercial solutions in use today are:
HP's Fortify Static Code Analyzer - HP acquired Fortify Software in 20 IO which included the Static Code Analyzer. The tool supports more languages than any other solution available at the time ofthis writing. Languages include C, C++, Python, Ruby, Visual Basic, Java, PHP, and many others. More information at http://www8.hp.com/ us/en/software-solutions/static-code-ana1ysis-sast/
Veracode Static Analysis - The most common languages are supported, such as Java, C, C++, Objective-C, .NET, and others. More information at http://www.veracode.com/products/binary-static-analysis-sast
There are also a large number of open-source or free tools available for use. Two of the most popular:
CodeSearchDiggity - A tool included as part ofthe SearchDiggity project maintained by Bishop Fox that allows you to search through open source code for vulnerabilities and other related issues. More infonnation at https://www.bishopfox.com/resources/tools/google-hacking-diggity/attack-tools/
VisualCodeGrepper - An actively maintained open source code scanning tool supporting multiple languages including Visual Basic, PHP, C++, Java, and a couple others. More information at https://sourceforge.net/projects/visualcodegrepp/

© 2017 Erik Van Buggenhout & Stephen Sims

55

In-Depth Fuzzing of Third-Party Applications
Fuzz testing (fuzzing) is the process of attempting to induce program failure by injecting random or mutated data as input to applications, drivers, and anything else that accepts input. Applications are typically designed to be well-behaved and are based on RFC's or other documentation-based standards. Various techniques including:
· Static · Randomized · Mutation · Intelligent Mutation
Code coverage is often used for measurement.
SANS
In-Depth Fuzzing of Third- Party Applications Fuzz testing, also known as fuzzing, is the process of introducing random or malformed input to well-behaved network and file parsing app lications, drivers, and anything else that accepts input. Googling for the definition of fuzzing will yield many different results. You have to imagine that the majority ofapplications are written based on a standard, such as those defined in a Request For Comment (RFC) doc ument. Take the Session Initiation Protocol (SIP) defined under RFC 3261. SIP handles Voice Over Internet Protocol (VOIP) signaling, such as call setup and tear down. Many vendors, such as Cisco Systems and Avaya use such protocols. The protocol is standardized so that one vendor's product is compatible with another vendor's product. These RFC's tell you the rules, but do not tell you how to write the code. There are countless ways to write the code using many different languages. When writing a fuzzer you are attempting to test for various bug classes under many different conditions. You must think of, or have a tool do it for you, all ofthe ways a developer could have made a mistake and test to see if it exists. As you can imagine, this is a time-consuming process.
There are various fuzzing techniques that can be applied. Some of the most common testing techniques include static, randomized, mutation, and intelligent mutation.
Static - Manually develop test cases that check for a specific condition, such as the existence ofa buffer overflow vulnerability in a field of an 1Pv6 header. Even for this one check, in this one field, you would want to test for multiple sizes for the input as you do not know how large of a buffer was created by the developer or what function they chose to use to copy data into memory. This is a time-consuming technique that requires a lot offami liarity with the protocol or file format being tested.
Randomized - This is a technique that requires little knowledge about the protocol or tile format being tested. Fields are selected, and then random data is inserted into the field in an infinite loop until stopped.
Mutation - This is a technique that requires little knowledge about the protocol or file format being tested. Fields are selected, and then mutated data is inserted to test for conditions associated with various bug classes.

56

© 2017 Erik Van Buggenhout & Stephen Sims

lntelligent Mutation - This technique requires deep familiarity with the protocol or file fom1at being tested. Test cases are written to reach specific points in an application, and then selected fields are chosen for the introduction of mutated data. This is the most comprehensive technique ifproperly used. Tools can be used to measure the amount ofcode reached to ensure coverage is maximized.
r-

© 2017 Erik Van Buggenhout & Stephen Sims

57

Fuzzing Example: Trivial File Transfer Protocol (TFTP)

TFfP defined in RFC 1350:
· "TFfP is a simple protocol to transfer files, and therefore was named the Trivial File Transfer Protocol or TFfP. It has been implemented on top of the Internet User Datagram protocol (UDP or Datagram) so it may be used to move files between machines on different networks implementing UDP." (Sollins, K.)
This protocol will serve as our example when going through the various fuzzing types to help add context.
· We will use the following fields taken from the RFC which indicate the request type, filename, and mode:

2 byces I Opcode I filename

l byce 0

scrioo : byce

Mode

0

SANS

Fuzzing Example: Trivial File Transfer Protocol (TFTP) The TFTP protocol is defined in RFC 1350. As stated in the RFC, "TFTP is a simple protocol to transfer files, and therefore was named the Trivial File Transfer Protocol or TFTP. It has been implemented on top of the Internet User Datagram protocol (UDP or Datagram) so it may be used to move files between machines on different networks implementing UDP." (Soll ins, K.) This protocol was selected due to its simplicity. We will use it as an example for the various fuzzing techniques described shortly.
The image on the slide, taken from the RFC, shows the fields required when making a TFTP request. You would typically have a TFTP client that sends a request to a TFTP server. This request is most commonly a read or a write request. A read request means you would like to get something from the server and a write request means that you wou ld like to put something onto the server. The 2-byte field for "Opcode" expects a "\x00\x0 I" for a read request and a "\x00\x02" for a write request. After this 2-byte field is the "Filename" field which expects a string. In other words, it wants you to include the name of the file to read or write. A question that must be asked is, " Ilow does the server know when it's reached the end ofthe filename?" The next field is a I-byte null or 0. When the server reads in the name of the file, it knows it's reached the end when it hits the null byte. The next field is the "Mode" field which is also to be a string. Options include "netascii," "binary," and "mail." Being that this field is also a string, it terminates with a null byte.
Citations and References: Sollins, K. "The TFTP Protocol (Revision 2)." RFC 1350 The TFTP Protocol (Revision 2). https://tools.ietf.org/html/rfcl 350 (accessed February I, 20 17).

58

© 2017 Erik Van Buggenhout & Stephen Sims

Static Fuzzing
Static fuzzing requires that test cases be developed
· Each test case checks a specific part ofthe input or file format for a specific bug class
· e.g. One test case checks one field for a buffer overflow and another checks for command injection
This requires a lot of time researching the protocol or file format to come up with countless tests. Since the Filename and Mode fields expect a string, we can try to overflow them one at a time:
· Request 1: "\xoo\xo1<1,ooo A's>\xoonetascii\xoo" · Request 2: "\xoo\xo1filename\xoo<1,ooo A's>\xoo"
SANS
Static Fuzzing
Static fuzzing requires the tester to spend a lot of time understanding the protocol to be fuzzed. Any documentation available, such as an RFC, would be inspected closely in order to begin creating test cases. Each test case would test for one condition. You have to remember that many languages can be used to write something such as a TFTP client or server. Each language comes with its own set of potential problems when poorly coded. Since we just saw that the Filename and Mode fields require a string, and keeps reading until reaching a null byte, that could be one field we'd want to check for the presence of a buffer overflow. On the s lide, we have two examples:
Request l: "\x00\x0 I<l,000 A's>\x00netascii\x00"
Request 2: "\x00\x0lfilename\x00<l,000 A's>\x00"
Request 1 checks the Filename field to see if a string of 1,000 A's causes an overflow. Request 2 does the same, but for the Mode field. Just because a server doesn't crash with 1,000 A's doesn't mean yo u would move onto testing for another bug class. It might crash at 500 A 's, but not 1,000, or any number of bytes below, between, or above. It all depends on how the code was written and any number of idiosyncrasies. Each program is different and is why we would need to come up with a large number oftest cases that uses good samples to test for as many conditions as possible. T his can result in thousands oftest cases.

© 2017 Erik Van Buggenhout & Stephen Sims

59

Randomized Fuzzing

Randomized fuzzing is good from the perspective of not needing

advanced knowledge of the protocol or file format being fuzzed.

· The tester simply selects a desired field to fuzz and the fuzzing application randomizes the input infinitely at that location

· Proper monitoring of the fuzzing session becomes critical using this technique

· Ifyou crash the application but don't have monitoring you may never hit

that condition again

2 bytes

strinq l byte

strinq l byte

I Opcode Filenair;e

o I Mode

o I

Randomly insert data

Randomized Fuzzing Randomized fuzzing requires no upfront knowledge about the protocol or file fonnat being fuzzed. Typically, a sample file or network packet data is acquired. This may be a valid PNG or JPG file, a captured SSH stream, or any number of options. A field is then selected to be fuzzed. The fuzzer then replays the network stream or produces a large number of files if fuzzing a file fonnat, randomizing the data in the selected field. This would run infinitely until stopped. As you can see it is a simple concept that requires good monitoring to catch the crash. Take the example offuzzing an SSH server. The fuzzer will continuously connect to the server sending random data in the selected field. If this causes a crash and tJ1e server dies how do you know what random data was sent to cause the crash? Since it is random, ifyou start it over you may never hit that test case again. II is therefore critical lo record the data being sent to the server so that when it crashes, the most recent samples sent are available.

60

© 2017 Erik Van Buggenhout & Stephen Sims

Mutation Fuzzing

Mutation fuzzing also requires little knowledge of the protocol or file format being fuzzed.
· Instead of the data being random in the selected field, the data is mutated based on various bug classes
· It is finite in that there are only so many mutations to go through in each bug class being checked
· Once exhausted, the fuzzing session ends

2 byee:s

:sering l byee

.sering l byee

------------------------------------------------

I Opcode Filename

o I

Mode

o I

---------------------

Mutate data

SAN~

Mutation Fuzzing As with randomized fuzzing, mutation fuzzing requires little to no upfront knowledge about the protocol or file format being fuzzed. Where it differs is that instead of random data being inserted, mutations are generated based on various bug classes such as buffer overflows, command injection, and others. It is fin ite since there are only, so many mutations created per each bug class. This means that if you caused a crash, but missed the mutation that caused it, you could restart the fuzzer and likely hit the same condition.

© 2017 Erik Van Buggenhout & Stephen Sims

61

Intelligent Mutation Fuzzing
Intelligent mutation fuzzing can do all that of randomized and mutation fuzzing, but adds "intelligence".
· Often referred to as "protocol grammar," this fuzzing technique requires that the author scripts how the application communicates or handles files
· Take the PDF file format as an example, which is quite complex · This fuzzing technique would require that you define the PDF file format in
a script, and then choose which fields should receive mutation fuzzing
Regular mutation fuzzing typically starts with a sample data set and the field to fuzz, which will receive the mutations. With intelligent mutation fuzzing, we script the file format upfront, giving us much more power and control.
Intelligent Mutation Fuzzing Intelligent mutation fuzzing goes above and beyond the limitations of randomized and mutation fuzzers. It requires a lot of upfront time spent to understand the protocol or file format being fuzzed, similar to that of static fuzzing. With randomized and mutation based fuzzing a sample data set is typically used as a starting point. For example, if we wanted to fuzz the PDF file format we would start with a legitimate PDF document and select fields to mutate or randomize. With intelligent mutation fuzzing, we do not start with a sample data set. Instead, the file format or network protocol grammar is scripted into a source file. Some ofthe fields are left as static so they are not fuzzed, and others are selected for fuzzing. Ifan HTTP server must always receive a request type such as PUT, GET, POST, and HEAD, then we always want to lead with those values and don't want to fuzz them. Then, we can script out the rest of the interaction with the HTTP server, choosing desired fields for mutation. This allows us to get better code coverage.

62

© 2017 Erik Van Buggenhout & Stephen Sims

Introducing Peach

r

Peach Fuzzer Community Edition is an

(o~ open source project that focuses on the
individual hobbyist or researcher

PEACH
FUZZER

· Available at http://www.peachfuzzer.com/resources/peachcommunity/ Peach runs on Windows, Linux, and OS X
· Peach can fuzz files, network protocols & COM/DCOM · A commercial version is also available

SANS
Introducing Peach Peach Fuzzer Community Edition is an open source project that focuses on the individual hobbyist or researcher. As an open source project, changes largely consist of bug fixes with lengthy release cycles. Peach 3 is tested on Windows, Linux, and OS X. Peach 3 should also run on other platforms that Mono supports. Peach supports the following types offuzzing:
· Stream-based fuzzing (files & sockets) · Call-based fuzzing (COM/DCOM, RPC...)
We can use Peach to assess software we don't own / know to see ifwe can find vulnerabilities by fuzzing. For more information, tutorials & downloads, please visit http: / /www.peachfuzzer.com/ resources/peachcommunity/

© 2017 Erik Van Buggenhout & Stephen Sims

63

Code Coverage

Code coverage is a way to measure how much executable code within an application is reached and how many times.
It is the best way to ensure all areas of an application are tested. There are two main types of code coverage:

Source Code Assisted
Measurement

Best option
Source code available

The code is compiled with special options allowing for the tracking of each line reached and is mapped back to the line number in the source code.

Block Measurement
SANS

Alternative Source code NOT
available

The instruction pointer of the processor is stalked to record what virtual memory addresses are reached and a report is provided.

Code Coverage lmagine if you were a law enforcement officer tasked with searching a large building for a suspect. It would likely be expected that you search each and every room. Ifyou skip ¾ ofthe rooms as many are locked, then your coverage isn't very good. Now think ofa large application such as Microsoft Word. There are many features and a lot of executable code. How do you know what 1ines of code you have reached, and which ones were not reached? You need a code coverage tool. The low-hanging fruit that is easy to reach in an application has likely been repeatedly tested and less likely to have a bug. The code that is harder to reach is more likely to have a bug.
There are two main fonns ofcode coverage testing, source code assisted measurement and block measurement. Source code assisted measurement requires that you have the source code ofthe application being fuzzed, which is not always available. It also requires that you compile the source code with special debugging options to support the technique. There are various examples of source code assisted fuzzers and code coverage tools, such as the American Fuzzy Lop (AFL) by Michal Zalewski (lcamtut) at Google. Source code line numbers are mapped to the compiled virtual addresses and then recorded at runtime during a fuzzing session. Tools such as the AFL also generate test cases (mutations) and automate the process. Block measurement can be used when source code is not available. A block is a grouping ofcode within a function that typically ends with a conditional branch, return, or other instruction. Imagine the statement, " Ifthe value being checked is 0 go right and if not 0 go left." This branch would lead to another block of code within the function. In block measurement, each block's virtual memory address is recorded for later analysis.

64

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Averting Payload Delivery
· Day 3: Preventing Exploitation
· Day 4: Avoiding Installation, Foiling Command & Control, & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception &Incident Response
· Day 6: APT Defender Capstone

SEC599.3

Securing the Network

Network Access Control & 802.1 X

Securing Software

Software Development lifecycle (SOL) & Threat Modeling

Vulnerability Assessments

·

Exercise: Authenticated Scans Using Nessus Patch Management

Exploit Mitigation Techniques

Exercise: Exploit Mitigation Using Compile-Time Controls

Exploit Mitigation Techniques - Exploit Guard, EMET, & Others

Exercise: Exploit Mitigation Using EMET & MalwareBytes

Securing Endpoints

OS Hardening & Best Practices

Endpoint Protection Solutions

Application Whitelisting to Stop Payload Execution

Exercise: Configuring Applocker

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

65

Exercise - Authenticated Scans Using Nessus
I J IThe objective of the lab is to get acquainted with a vulnerability scanner like Nessus. Furthermore, we will perform an authenticated vulnerability scan of our internal network environment. We will then analyze the results and determine how these can be fixed.
High-level exercise steps: 1. Walk.through Nessus vulnerability scanner 2. Configure default scan policy to scan internal range 3. Add credentials to enable authenticated scanning 4. Analyze the results
Exercise - Authenticated Scans Using Nessus The objective of the lab is to get acquainted with a vulnerability scanner like Nessus. Furthermore, we will perforn1 an authenticated vulnerability scan of our internal network environment. We will then analyze the results and determine how these can be fixed. The high-level steps of the exercise are:
· Walkthrough Nessus vulnerability scanner · Configure default scan policy to scan internal range · Add credentials to enable authenticated scanning · Analyze the results For additional guidance & details on the lab, please refer to the LOOS workbook.

66

© 2017 Erik Van Buggenhout & Stephen Sims

Exercise - Authenticated Scans Using Nessus - Conclusion
During this exercise, we used Nessus to perform vulnerability scanning against our internal network hosts:
Nessus9"'
Nessus is one of the most commonly used vulnerability scanning engines out there. Although it can never replace the expertise of a security researcher attempting to fuzz your custom applications for flaws, it can provide us with a good insight in misconfigurations & missing patches in our environment
When provided with credentials, Nessus is capable of performing in-depth configuration reviews & missing patch reviews of a wide variety ofOperating Systems
SANS
Exercise - Authenticated Scans Using Nessus - Conclusion
During this exercise, we used Nessus to perform vulnerability scanning against our internal network hosts:
· Nessus is one ofthe most commonly used vulnerabi lity scanning engines out there. Although it can never replace the expertise ofa security researcher attempting to fuzz your custom applications for flaws, it can provide us with a good insight into misconfigurations & missing patches in our environ me nt.
· When provided with credentials, Nessus is capable ofperfonning in-depth configuration reviews & missing patch reviews ofa wide variety of Operating Systems.

© 2017 Erik Van Buggenhout & Stephen Sims

67

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Averting Payload Delivery · Day 3: Preventing
Exploitation
· Day 4: Avoiding Installation, Foiling Command & Control, & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

SEC599.3

Securing the Network

Network Access Control & 802.1 X

Securing Software

Software Development Lifecycle (SOL) & Threat Modeling

Vulnerability Assessments

Exercise: Authenticated Scans Using Nessus

·

Patch Management Exploit Mitigation Techniques

Exercise: Exploit Mitigation Using Compile-Time Controls

Exploit Mitigation Techniques - Exploit Guard, EMET. & Others

Exercise: Exploit Mitigation Using EMET & MalwareBytes

Securing Endpoints

OS Hardening & Best Practices

Endpoint Protection Solutions

Application Whitelisting to Stop Payload Execution

Exercise: Configuring Applocker

This page intentionally left blank.

68

© 2017 Erik Van Buggenhout & Stephen Sims

OS Market Share
IWindows 7 clearly dominanc
IXP still at 6.47% · Automated Teller Machines (ATMs) · Embedded systems
IWindows IO quickly gaining traction. IMac OS and Linux still a small number in
comparison.

Other:3.95%
w,ndows 7: 46.63 %
Windows 10: 29,26 % /
Taken on November 19th, 2017 from htt!)s://www.netmarketshare.com/operating-systemmarket-share.aspx?gprid-10&gpcustomd-o

OS Market Share The image on this slide gives you an idea as to the state of OS market share, clearly showing Microsoft Windows as the dominant OS. At the time this was pulled in November 2017, Windows 7 is by far the leader, with Windows IO in second place. There are limitations in Windows 7 from a security perspective that cannot
be fixed. An example is Control Flow Guard (CFO), a built-in security control we will discuss later this day. This was backported to Windows 8.1 , but not Windows 7. There are also many improvements in the Kernel on Windows IO that do not exist in Windows 7. It is critical to keep these older OSes up to date.

© 2017 Erik Van Buggenhout & Stephen S ims

69

Desktop Browser Market Share
IChrome clear~ the dom;nant browser. IIE has lost market share over the past
several years.
Edge has not gained much traction.
IIf;refox hold;ng steady ;n tMrd place.

M,c:roao!l lntemet Explorer 15 09 % . /
Taken on November 19th, 2017 from https: //www.netmarketshare.com/browser-marketshare.aspx?qprid=o&qpcustomd=o

Desktop Browser Market S hare On this slide is the desktop browser market share as of November 20 17. Note that these numbers change, so it is a good idea to use the provided link to see the updated percentages. For a very long time Internet Explorer was the dominant browser; however, Chrome has taken a large lead over the past couple ofyears. Microsoft Edge has struggled to gain traction. Browsers have been the source of many compromises over the years and as such, security has been greatly improved. Bug classes such as Use After Free (UAF) were one ofthe primary vectors in end-user compromises, but security improvements such as MemGC have greatly mitigated the technique.

70

© 2017 Erik Van Buggenhout & Stephen Sims

Application and OS Patching
Maintaining a handle on the patching ofa large number of systems and applications is complex.
The more users with administrative access to their workstations, the more likely there are going to be unique applications installed.
· Many of which are likely not approved · Some companies grant all users administrative access to their computers
Some vendors make patching easy, such as Microsoft, while others have no process at all.
Solutions like application whitelisting can be performed but is hard when scaling in medium to large organizations.
Application and OS Patching As we just saw it is no secret that the majority of companies use Microsoft Windows as their OS for employee workstations and laptops. Fortunately, Microsoft has a mature process for patch management with the well-known Patch Tuesday. Other OS vendors are not so clear as to when patches will be released, such as Apple. Some vendors, such as Oracle, have scheduled updates, but less frequently than Microsoft. Oracle releases updates each quarter. The mobile market makes things more complex, especially with some Android devices that are incapable ofeven being updated. Regardless, most organizations have a good handle on the patching ofoperating systems.
A different issue is the patch management of installed applications. Some very large organizations, who will not be named, give Administrative access to all employees. The reasoning for taking this approach is up to each company and their policies. A strong application whitelisting policy and enforcement can help mitigate the installation of unauthorized applications; however, whitelisting is difficult to manage. At organizations who do not grant all users administrative access, it is fairly typical for many users to be given approval to have this level ofaccess. Take a network engineer as an example who is able to justify the need for Administrative access to perform job-related tasks. The justification may be valid; however, it often results in the installation of3'd party applications that are not on the organization's approved list.

© 2017 Erik Van Buggenhout & Stephen Sims

71

Identifying Unauthorized Applications
Commercial products such as Ivanti (formerly Shavlik) can help to maintain 3rd party application patches.
· A large, but limited number of applications are supported Applications are tested prior to the release of patches
· What about apps not supported?
Simple scripting can be used to pull applications installed in locations such as "Program Files".
Unauthorized applications discovered can be handled · Does not consider standalone applications
Applications that are allowed must be managed centrally.
SANS
Ide ntifying Unauthorized Applications At one organization this author worked at, we wrote a script to pull the name and version ofall applications installed on every system where the user had Administrative access. The result was a staggering I, l 00+ applications. Some of these were the same application but different versions. When Googling for the words "<application name> vulnerability" there were countless hits. The point of this example is to demonstrate the complexity of trying to manage patches for that many applications not on the approved list. This also did not include standalone applications, but instead only applications installed in "Program Files" on Windows systems.
There are various commercial products available to aid in managing patches to 3rd party applications, such as Ivanti (formerly Shavlik). These solutions typically focus on the most common applications such as Flash, browsers, document readers, Oracle, etc.. .. Part of the service offered by these solutions includes the testing of the patches to ensure applications are not negatively affected. You would need a process for applications that are not supported.
More information:
http://w w w.iv a nti.com/en-US/sol utions/ n e e d s/ p a t c h - m g mt-for-systems-(o s - a ,1<l-lhird-party)

72

© 2017 Erik Van Buggenhout & Stephen Sims

Microsoft Patch Tuesday

,,....

IMicrosoft releases patches on the secondTuesday of each month,for now ...

-.

t

,,.....

IEffort to help simplify the patching process: random patch releases caused many users to miss patches.

J ·
I :
.:

i
l

,....

IPatch delay of max. 30 days has security concerns: emergency patches are released out-of-cycle.

J; 5

IMany exploits released in the days following a patch (="Exploit Wednesdays").

Exploit Wednesdays
Analysis of a Russian hacker forum's traffic hls shown evidence for exploit Wednesdays.While generic forum postS remain approximately constant throughout the week. there ,s a strong increase in tr.1ffic related to gcncnc andW,ndows CVEs

'"'

on Wednesdays.

Microsoft Patch Tuesday In October 2003, Microsoft started its " Patch Tuesday" process. This came after many complaints from users and administrators who stated that it was difficult to keep up with patching their systems when it was unknown as to when patches would be released. The patches were released by Microsoft as they were approved. Users and administrators had to be constantly ready to handle the release of new patches. It is now well known that the second Tuesday of each month, Microsoft will release patches, both security-related and functional ity or maintenance-related. The idea was that it would simplify the patching process for most organizations. Advanced alerts are sent out from Microsoft to inform and prepare users of the nature ofeach patch. Most organizations have adapted to the idea of"Patch Tuesday" and have a process in place to test patches, followed by deployment out to their systems. There are many services available to assist with patch deployment, from automatic updates on each Microsoft OS to Windows Server Update Service (WSUS) servers helping with large-scale patch management and deployment. Third-party applications are also available for patch management and deployment.

There are concerns about the waiting period in between patch releases from Microsoft. It is no secret that many exploit developers wait for patches to be released so that they can compare the patched version ofa function or library to that of the unpatched version. Tools such as IDA Pro and BinDiff can quickly locate changes to the code. An experienced reverse engineer can locate the vulnerability within the unpatched code and write programs to reach the location within the affected program. This results in the release of cutting-edge exploits, which often prove lucrative to an attacker because many organizations do not quickly patch their systems. Exploits are sometimes released the following day after a patch is deployed by Microsoft, which caused the term "Exploit Wednesdays" to get adopted in the IT landscape. There is also the issue around attackers intentionally waiting until the day after patch Tuesday to release new unknown known e xploits, knowing that it will likely not be patched for up to 30 more days. Microsoft does occasionally release out-of-band patches for critical updates; however, often systems are left unpatched for weeks. Workarounds are often provided, but this is only a temporary fix and is not always practical. Patch diffing is not only used by the bad guys. Those working for organizations often reverse engineer patches to determine the effect to the organization ofpatch application or to determine the impact of the vulnerability. Intrusion Detection System (IDS) signatures can also be developed from a thorough understanding ofa vulnerability, as well as developing modules for vulnerability scanning and penetration testing fi-ameworks. Exploit Wednesday source: Recorded Future https://www.recordedfuture.com/hacker-forum-traffic/

© 2017 Erik Van Buggenhout & Stephen Sims

73

Windows as a Service (WaaS)
Windows has always had various versions (Professional, Home, Enterprise, Ultimate), service packs, monthly updates, etc.
Microsoft desires to have all systems in the same known state.
· This allows them to perform QA testing on systems in the same state as the customers receiving updates
· Monthly cumulative updates supersede the prior month's update and include all features and fixes
· Feature updates are deployed multiple times per year · Quality updates, including security patches, are sent in monthly cumulative packages
Windows 10, Windows 10 Mobile, and Windows 10 IOT Mobile all fall under WaaS.
SA~
Windows as a Service (WaaS) Prior to the release of Windows IO Beta Microsoft started to release bits of infonnation about the idea of Windows as a Service (WaaS). Little infonnation was initially available, and many websites tried to define what it could mean. Even today, it is still complicated to digest with the introduction ofservicing branches and various deferral options. Microsoft desires for a ll systems to be in the same state. This makes their life easier as the systems out in production around the world look more like the ones in their testing labs. Knowing the state and build of all systems out there should result in fewer compatibility problems. Each month a cumulative update is made available that supersedes the prior month's update. These cumulative patches include all updates for OS version. There are two types of updates: Feature and quality. T hey wish to do away with things like "Service Pack 2" and " Revision 3" and standardize on not more than two supported builds. The quality updates include security patches. Picking and choosing which updates to apply results in systems that are in many different states. Cumulative roll-ups help to ensure a system has a ll necessary patches to remain secure and support newer features.
Although cum ulative updates are now pushed out for all systems, ever since October 2016, Windows IO, Windows IO Mobile, and Windows IO JOT Mobile are the only ones falling under the official WaaS practice.
References: Halfin, Dani. "Overview of Windows as a service." TN Overview of Windows as a service. https://technet.microsoft.com/en-us/itpro/windows/manage/waas-overview (accessed January 29th, 2017).
More Information: https://technet.microsoft.com/en-us/itpro/windows/manage/waas-update-windows- I0

74

© 2017 Erik Van Buggenhout & Stephen Sims

WaaS Servicing Branches

Three servicing branches are available to allow organizations to choose when devices are updated:

Current Branch (CB)

Feature updates are immediately available to systems set not to defer updates. Good for developers and other groups to test for compatibility issues.

Curren[ Br:inch For Business
(CBB)

Updates deferred for about four months while vetted by business partners and customers.After this period the CB build is assumed. Quality updates can only be deferred for 30 days usingWindows Update for Business, but up to 12 months with WSUS.

Long.Term
Serv,c.1ng Bt anch
(LTSB)

Updates deferred for an average of 2-3 years as devices are specialized, such as cash machines, medical, and automotive.

Waas Servicing Branches
Three servicing branches are available from Microsoft to help with patch distribution. It actually gets quite complex when evaluating the various update server options such as Windows Update for Business, Windows Server Update Services (WSUS), and the System Center Configuration Manager. The references provided below and associated links at those locations are very useful in trying to understand how your Windows 10 organization can architect the right solution. The three branches are:
Current Branch (CB) This branch makes features available as soon as they become available so that groups such as developers and QA can begin ensuring there are no compatibility problems, or those looking to take advantage of the new features can get started as soon as possible.
Current Branch for Business (CBB) - This branch is designed for wide-scale deployment to an enterprise. All ofthe features and such made available in the CB are moved to the CBB after a few month's vetting process involving customers and business partners. Quality updates can be deferred by different amounts depending on the Group Policy Option (GPO) settings pushed out and the patch distribution server option being used. This is likely going to continue to change and evolve as feedback is received by Microsoft.
Long-Term Servicing Branch (LTSB) - This branch is designed for specialized devices such as ATM/Cash Machines, medical devices, automotive devices and others. These are devices that have a specific focus or role and do not utilize the features made available by Microsoft.
References: Halfin, Dani. "Overview of Windows as a service." TN Overview of Windows as a service. https://technet.microsoft.com/en-us/itpro/windows/manage/waas-overview (accessed January 29th, 2017). Halfin, Dani. "Managing updates using Windows Update for Business." TN Managing updates using Windows Update for Business. https://technct.microsoft.com/en-us/itpro/windows/manage/waas-manageupdates-wufb (accessed January 29th, 2017).

© 2017 Erik Van Buggenhout & Stephen Sims

75

Patch Distribution

SANS

C: -

Windows Update f--< Automatic updates. available m the control panel

·µ0-
::s
· -. . 0
µs...
0·V-)

-
-1--

Vista. 7, 8, and Server

2008/2012

f--<

Automatic updates has expanded functionality

Windows Server Update I-------< Enterprise patch management solution with control over

Service (WSUS)

patch d1stnbution

..ru::.

Windows Update for ,__ Business (WUB) for
Windows 10

µ

aC.'.d

-

Third-party Patch Management Solutions

Patch Distribution This slide serves as a simple high-level overview of the Microsoft patch distribution process. Many organizations do not permit end users to connect to Microsoft to obtain patches. Instead, a centralized enterprise patch management process controls patch distribution. The reasoning behind such a solution ranges from system consistency to security, to application stability. The ability for each user to connect at any time to the Microsoft update site and install desired patches renders the system builds to be highly inconsistent. Some patches have even been known to introduce new vulnerabilities. Other patches have been known to cause applications to break or behave differently than when the patch was not installed. All these issues make it desirable to control the distribution and installation of patches on end user systems and servers.
Automatic Updates has been installed by default on Windows systems since Windows ME, XP, and Windows 2000 Server. Automatic updates can be used to check for updates, check for updates and download them, and check for updates, download, and install them. Enterprise patch management often takes advantage of Windows Server Update Service (WSUS) servers to communicate directly with Microsoft update servers. Updates can be scheduled and sent directly to the WSUS servers over HTTP o r HTTPS. Administrators then have the ability to first test the patches prior to deployment. Automatic updates on each end user system can be configured to communicate only with the enterprise WSUS servers. Administrators can select which patches they want pushed out and when. They also have the ability to sot whether a patch can be defen-ed by tht: user and how soon a reboot is required ifapplicable. Windows Update for Business (WUB) is available starting with Windows I0. Update deferral is more limited, and Microsoft sees it as more of a constant stream of updates that should be installed as soon as possible. Check out SANS SEC505 "Securing Windows and PowerShell Automation" for more infonnation on securely architecting Windows domains and building a patch management process.
Third-party patch management solutions such as Patchlink and Lumension are available, often offering additional services and support for different operating systems.

76

© 2017 Erik Van Buggenhout & Stephen Sims

Reverse Engineering Updates
It is important to know that good guys, bad guys, and those inbetween often reverse engineer security updates.
· Exploitation frameworks such as Metasploit, Core Impact, SAINT Exploit, and Immunity Canvas want to be able to offer their customers exploits that are not available by their competitors
· Attackers want to quickly discover the patched vulnerability and attempt to develop a working exploit before most organizations patch
· The above is often referred to as a "1-day exploit" since there is a race condition between the time a patch is released and the time systems are patched
Reversing patches is an acquired skill and is not limited to Microsoft updates.
Reverse En~ineering Updates If you think about a security update it should quickly become obvious that people might be interested in the contents ofthat update as it contains sensitive information to those with the right skillset. This is something that is performed by good guys, bad guys, and those in-between. Think about it from the perspective ofa vendor who maintains an exploitation framework as a product, such as Immunity Canvas, Core Lmpact, Metasploit, or SAINT Exploit. Most disclosures are done privately and not found in the wild. This means that the vendor has been given the technical details and not the public. The vendor then creates a patch and distributes it to their customers. If you have someone with the expertise to take the patch and reverse engineer it to find the fix, that information can be used to potentially write a working exploit. Now your product has exploits available to privately disclosed vulnerabilities that are not possessed by your competitors.
lf Microsoft releases patches on the second Tuesday ofthe month, and then someone reverse engineers the patches and quickly gets an exploit working, that exploit would be valuable to penetration testers, attackers, and security vendors. This is often referred to as a I-day exploit since those performing the reversing are attempting to quickly locate the fix and get a working exploit built before organizations patch. The more time that goes by the less valuable the exploit as more systems are patched.

© 2017 Erik Van Buggenhout & Stephen Sims

77

Obtaining Patches for Analysis
https://technet.microsoft.com/en-us/sccurity/bulletins.aspx
Microsoft Security Bulletin MS17-004 - Important

SA~S

Security Update for Local Security Authority Subsystem Service

(3216771)

Knowledge base number

Venion: 1.0
Executive Summary

Microsoft Knowledge B.lse ,s a repository of over 200.000 arocles m3de ,wail.1blc to chc pubt1c by M1Crosoft Coq,or.mon h cont.1l!lS mfonnauon on flQny probk-ms cocountert'd by users of Moosoft products. Eich ~tch 01- .art.ide bclin an ID number and an,cle~ are oken referred to by therr KnowlNfge
Base (KB) ID.

A denial of serv,ce wlne,ab,hty tXJSIS in tht °ft'ay the Loc1l ~cur,ty Autt10my Subsystem StMCt (lSASSl handles authtnti<at1on requests. An attacker 'ft'tlo successfully exploited the vulrmabdJty could cause a dtlllll of semct on the target systems lSASS serv,ce ..,tuch tnggers an automati< reboot of the systern

This security update Is rated Important for Microsoft w,ndows VIs1a Windows Server 2008 Windows 7 and Windows Server .I008 R2 (and Server Cort). For more 1nlormatJon see !ht Affecud Software and Vulneublllty s.verity Ratings section.

On this page
E:xecll!Ne Summary t.lfttttd So~1,are and

~
L=J

Vulnerability Sevfflt)' Rat:ngs

Vuln" bdrty 1nform..it1on

Obtaining Patches for Analysis Microsoft TechNet provides us with the ability to directly acquire patches. Available at https://technet.microsofl.com/en-us/security/bulletins.aspx, we can search for a specific update and download the appropriate patch for a given operating system. Patches are released in a couple different fonnats, depending on
the OS level. The cumulative updates that started in October 20 16 have made the process of identifying the individual patches more difficult. They used to be in a standalone format and easy to extract.
Microsoft Knowledge Base is a repository of over 200,000 articles made available to the public by Microsoft Corporation. It contains information o n many problems encountered by users of Microsoft products. Each patch or article bears an ID number and articles are often referred to by their Knowledge Base (KB) ID.

....

78

© 2017 Erik Van Buggenhout & Stephen Sims

Types of Patches
Patches for XP and Windows 2000, and 2003 server had .exe extensions and still do for extended embedded XP support.
· For example, WindowsXP-KB979559-x86-ENU.exe
Patches for Vista, 7, 8, 10, and Server 2008/2012/2016 have .msu extensions.
· For example, Windows6.o-KB979559-x86.msu
Extraction methods differ slightly, as to the contents of each package.

Types of Patches Most patches distributed by Microsoft have a .msu extension; however, legacy patches had a .exe extension. Patches for Windows XP, 2000 Server, and Server 2003 had the .exe extension, wh ile Windows Server 2008/2012/2016, Windows Vista, and Windows 7/8/10 have the .msu extension. For example, a patch for a Windows XP system would look like
WindowsXP-KB979559-x86-ENU.exe
The same patch on Server 2008 would look like:
Windows6.0-KB979559-x86.msu
You may be wondering why it's worth mentioning XP. Good question. Patches for XP embedded are still available until April 9th, 2019. There are people out there who acquire the embedded version patches, use a registry hack, so that they can stay on XP. See this website as an example: http://www.ghacks.net/2014/05/24/get-security-updates-windows-xp-april-2019/
From the perspective of reverse engineering patches XP is also still of interest. Many vulnerabilities affect many or all versions of Windows. You would have to imagine that the code on X.P is likely less complex than Windows IO and therefore, reversing the same vulnerability on XP could save time.
Contents within the patch tiles differ depending on the OS, as do the tools to extract them manually. The .exe patch files tend to be much simpler to get to the wanted files, whereas the .msu patch files may require additional examination, especially with cumulative updates.

© 2017 Erik Van Buggenhout & Stephen Sims

79

Extraction Tool for .exe Patches

The extract tool:
<pkg_name> /extract:<dest>

c:\derp\MS13-017>WindowsXP-KB2799494-x86-ENU.exe /extract:c:\derp\MS13-017 c:\derp\MS13-017>dir
Volume in drive Chas no label. Volume Serial Number is CEF2-482A

btra«ionCom~de

ClJR = General Distribution Release

01/31/2017 12:47 PM <DIR>

SP3GDR

01/31/2017 12:47 PM 07/05/2010 05:15 AM

<DIR>

SP3QFE

17,272 spmsg.dll

QFE = Quick Fix EnginC'ering

OK

07/05/2010 05:15 AM

231,288 spuninst.exe

01/31/2017 12:47 PM <DIR>

update

04/05/2013 10:55 AM

2,275,352 WindowsXP-KB2799494-x86-ENU.exe

3 File(s)

2,523,912 bytes

5 Dir(s) 161,896,198,144 bytes free

Extraction Tool for .exe Patches The extract tool can be used via the command line to extract patches with the .exe extension. Simply type in the name of the patch file containing the .exe extension, followed by /extract:<dest>. For example:
C:\derp/MS 13-017> WiodowsXP-KB2799494-x86-EN U.exe /extract:c:\derp\MS 13-017
Ifsuccessful, you get the pop-up box on the screen stating that extraction was successfully completed. Proceed to review the contents ofthe package.
You may have noticed that there are two folders: one with GDR in the title and the other with QFE. GOR stands for General Distribution Release and QFE stands for Quick Fix Engineering.

80

© 2017 Erik Van Buggenhout & Stephen Sims

Package Contents

The SP3*** files are the directories containing the patches.
The kernel was patched with this update "ntoskrnl.exe".

'111e QFE branch arc cumulative hotfixes issued by
Microsoft Product Support Services lo address specific
customer issues. These updatesdo not get the same quality oftesting as the GOR
branch.

c:\derp\MS13-017>cd SP3GDR

c:\derp\MS13-017\SP3GDR>dir

Volume in drive Chas no label. Volume Serial Number is CEF2-482A

The GDR branch ofupdates arc used when Microsoft issues one of the following type,;

Directory of c : \de rp\ MS13-017\SP3GDR

of updates: security updates, critical updates. updates, update rollups, drivers

and feature packs. This branch docs not

01/31/2017 12:47 PM <DIR>

include the updates from the QFE branch.

01/31/2017 12:47 PM <DIR>

01/06/2013 05:19 PM

2,148,864 ntkrnlmp.exe

01/07/2013 06:07 AM

2,069,760 ntkrnlpa.exe

01/06/2013 04:37 PM

2,027,520 ntkrpamp.exe

01/06/2013 05:16 PM

2,193,024 ntoskrnl.exe

4 File(s)

8,439,168 bytes

2 Dir(s) 161,896,284,160 bytes free

Package Contents The package contents of this update are shown in the screenshot. As you saw on the last slide, there are two directories listed for XP SP3 called SP3GDR and SP3QFE. The contents of the directory SP3GDR contains multiple files, such as " ntoskrnl.exe." This is actually the name ofthe Windows Kernel and therefore the Kernel was patched in this fix. Command switches were used to limit the output to fit the image onto the slide.
"The GDR branch of updates are used when Microsoft issues one ofthe following types of updates: security updates, critical updates, updates, update rollups, drivers, and feature packs. This branch does not include the updates fi-om the QFE branch.
The QFE branch is cumulative hotfixes issued by Microsoft Product Support Services to address specific customer issues. These updates do not get the same quality oftesting as the GDR branch."
Citation: Jphillips59. "QFE vs. GDR." QFE vs. GDR Microsoft (W indows) Support- Neowin Forums. https://www.neowin.net/forum/topic/332694-gfe-vs-gdr/ (accessed January 31st, 2017).

© 2017 Erik Van Buggenhout & Stephen Sims

81

Extraction Tool for .msu Patches

expand -F:* <.msu file> <dest>

Update file

c:\derp\MS16-106\Patched>expand -F:* Windows6.l-KB3185911-x86.msu Microsoft (R) File Expansion Utility Version 6.1.7600.16385 Copyright (c) Microsoft Corporation. All rights reserved.
Adding .\WSUSSCAN. cab to Extraction Queue Adding .\Windows6.1-KB3185911-x86 .cab to Extraction Queue Adding .\Windows6.l-KB3185911-x86-pkgProperties.txt to Extraction Queue Adding .\Windows6.1-KB3185911-x86.xml to Extraction Queue
Expanding Files
Expanding Files Complete 4 files total.

Extraction Tool for .msu Patches For Windows Vista, 7, 8, IO and Server 2008/2012/20 I6, the expanded tool can unpack packages with the .msu extension. As shown on the slide, the file Windows6. I-KB3 l 8591 I-x86.msu is expanded with the following command:
expand -F:* Windows6. 1-KB31859 I J-x86.msu .
Four files are unpacked and can be seen.

82

© 2017 Erik Van Buggenhout & Stephen Sims

Cabinet File Contents
We are interested in .cab files
c:\derp\MS16-106\Patched>expand -F:* Windows6.1-KB3185911-x86.cab. #Output truncated for space... c:\derp\MS16-106\Patched>dir /s /b /o:n /ad c:\derp\MS16-106\Patched\x86_microsoft-windows-user32_31bf3856ad364e35_6.1.7601. 23528_none_cfc274bde4c0ef6f c:\derp\MS16-106\Patched\x86_microsoft-windows-win32k_31bf3856ad364e35_6.1.7601. 23528_none_bb7d823711eb39fd
We can see that one directory contains a patch to user32.dll and the other win32k.sys
Cabinet File Contents As seen on the prior slide, several files were extracted from the .msu file. We must now use the same method to extract the .cab fi le. A lot of output is displayed on the screen when extracting the .cab file and as such, it was truncated from the output on the slide for spacing purposes. A customized "dir" command is then issued to limit output to directories only. You can see there are two folders, one containing a reference to the name "user32" and the other "win32k."

© 2017 Erik Van Buggenhout & Stephen Sims

83

The Patched File

Examining folder contents

c:\derp\MS16-106\Patched>cd x86_microsoft-windows-user32_31bf3856ad364e35_6.1.76 01 .23528_none_cfc274bde4c0ef6f

c : \derp\MS16-106\Patched\x86_microsoft-windows-user32_31bf3856ad364e35_6.1.7601. 23528_none_cfc274bde4c0ef6f>dir Volume in drive Chas no label . Volume serial Number is CEF2-482A

Directory of c:\derp\MS16-106\Patched\x86_microsoft-win 4e35_6.1.7601.23528_none_cfc274bde4c0ef6f

01/31/2017 01/31/2017 08/15/2016

12:57 PM <DIR>

12:57 PM <DIR>

06:48 PM

811,520 user32.dll

1 File(s)

811,520 bytes

2 Dir(s) 161,884,778,496 bytes free

Patched file
We navigated to the folder containing the "user32'" patch and listed the contents.As you can see. there is only one file in that folder. which is "user32.dll.0 This
would be the file that you would want to compare against a prior update to identify changes of interest.

SANS

The Patched File
We have now simply navigated to the folder containing the "user32" patch and listed the contents. As you can see, there is only one file in that folder, which is " user32.dll." This would be the file that you would want to compare against a prior update to identify changes of interest. More on this shortly.

84

© 2017 Erik Van Buggenhout & Stephen Sims

Extracting Cumulative Updates
As mentioned previously, patches are now cumulative and contain all updates for the OS version.
· This makes for very large update files that contain hundreds of files Mapping an extracted file to the right Knowledge Base (KB) number is difficult
Greg Lineras (@Laughing_Mantis) wrote some PowerShell scripts to help with this problem.
· The concept is quite simple: using the modified data on the updates to identify files that have changed within the last 30 days
· They are then placed into unique directories and cleanup is performed · You still need to determine which file correlates to which advisory, but the process is much
easier
SA~.S
Extracting Cumulative Updates As previously mentioned, the cumulative updates are very large and contain all patches for the OS version. When extracting them there are hundreds to thousands of files. This makes it very challenging to sort through them to find the desired file and map it correctly to the Knowledge Base (KB) number. Greg Lineras, known as @ Laughing_ Mantis on Twitter, created a couple of PowerShell scripts to help with this issue (you can find an example here: https://pastebin.com/0mYXJGCS). The idea is quite simple, extract everything, delete all the junk we do not care about, and sort the files over 30 days old into an "old" directory. This allows you to focus on the files that have a modified data within the past 30 days. You sti ll need to map the files to the correct KB number, but now you are only looking at ten or so folders as opposed to a very large amount.

© 201 7 Erik Van Buggenhout & Stephen Sims

85

Obtaining a Cumulative Update for Windows I0
The following screenshot shows the cumulative update file for January 2017:

W,ndow, 10.Wlndows10 LTS8 Se<,ny Upd,lt> 11'6/2011 tumul,·wllpd.,,to,-.V.-LOlo<,ol·bo t111y<ttmt ,:&32lOm w-.10, Wtndowsl0LTS8 Se<llffl)'Up<Wc, 1~17

nl· 4'10.0Mt nl· IOSS.l Mt

The cumulative updates result in some very large files.

Obtaining a Cumulative Update for Windows 10 This slide simply shows a screenshot ofthe January 201 7 cumulative update for Windows 10. As you can see the x86 file is 490MB and the x86 file is around IGB. Changes in the way Microsoft is managing incremental updates to reduce the file size may allow for this to be smaller for patching: http://www.theverge.com/2016/ 11/3/1351101 2/microsoft-windows- I0-unified-update-platforrn-fearures

86

© 2017 Erik Van Buggenhout & Stephen Sims

PatchExtract
Now that we have the updated downloaded, let's extract it with PatchExtract125 from Greg Lineras.
c:\Patches\MS17 -JAN\x86>Powershell -ExecutionPolicy Bypass -File c:\Patches\Patc hExtract125 .ps1 -Patch windows10.0-kb3210720-x86_04faf73b558f6796b73c2fff1442561 22f4e36a9.msu -Path c ·\Patches\MS17 JAN
The above command looks quite long. but much of that 1s due to the long .msu filename
This command took ~10 minutes to complete on the 500MB file. Some observations:
· It extracted every folder and file from the cumulative update and resulted in an enormous number offolders
· The modified dates on some patched files dated all the way back to 2015, indicating that this file contained all patches for this version of Windows
SANS
Patch Extract With the update downloaded, let's extract it with the PatchExtract tool from Greg Lineras.
C:\Patches\ MS I7-JAN\x86>Powershell -ExecutionPolicy Bypass -File c:\Patches\PatchExtractl25.ps I Patch windowsl0.0-kb3210720-x86_04fan3b558f6796b73c2fff144256122f4e36a9.msu -Path c:\ Patches\MS17-JAN
The command is rather long due to the .msu filename; however, we' re simply telling it what script to execute "PatchExtract125.psl," then the name ofthe .msu fi le with the "-Patch" switch, and then the path where to put the extracted files with "-Path."
Depending on the size ofthe .msu fi le (500MB in this case) it can take quite a while to extract all ofthe files. It took ~ IO minutes for this file. The result is excluded from the s lide as it is quite a lot of output, as well as over a thousand fi les and fo lders. When looking at a couple ofsample files the dates were all the way back into 2015, showing that the .msu fi le contains a ll patches for this version of Windows.
PatchExtract can be found at: http://pastebin.com/u/Laughing_ Mantis

© 2017 Erik Van Buggenhout & Stephen Sims

87

PatchCle an
I
We will now clean up the enormous output and list only the files changed within the past 30 days (i.e., those associated with this month's update).
c:\Patches\MS17-JAN\x86>Powershell -ExecutionPolicy Bypass -File c:\Patches\Patc hClean.psl -Path c:\Patches\MS17-JAN\x86\
#Lots of output that has been truncated for space_.

Low Priority Folders: 1020 Low Priority Files: 3810 High Priority Folders: 16

Thanks, PatchClean!
As you can see. PatchClean has identified 16 folders whose contents have changed within the last 30 days.This saves us a TON of time!

SANS

Patch Clean With a ll of the files and folders from the cumulative update extracted, we want to know which ones are associated with this month's update. The PatchClean script will go through and put every folder that contains a folder with a "Date Modified" time of>30 days into a folder called "Old." It will leave only folders with files in them that have a "Date Modified" time within the last 30 days. We run PatchExtract with:
c:\ Patches\MS I7-JAN\x86>Powershell -ExecutionPolicy Bypass -File c:\Patches\PatchClean.psJ -Path c:\Patches\MS17-JAN\x86\
The result, as shown on the slide, is 16 high priority folders. That is much less than the > l ,000 folders and >3,800 files extracted from the cumulative update.
PatchClean is also available at: http://pastebin.com/u/Laughing_ Mantis

88

© 2017 Erik Van Buggenhout & Stephen Sims

Patch Extraction Results

:

a

-
c

c°"""""°
es

"i7'-=P'Jt"AN"x86)cli

r

=- -

Volume in drive Chas no label.

Volume Serial Number is 6681-3E06

Directory of c:~atches'-MS17-JAN'-x86

1/10/2017 05:38 PM <DIR>

,-.
'"'
,.....

1/10/2017 1/10/2017

05:38 PM 04:47 PM

1l//1100//22001177 0055::0011 PPMM

<DIR> <DIR> (DIR> <DIR>

b'..ironment-dvd-efisy,_10.0.10240.17236 b .. re-bootmanager-pcat_10.0.10240.17236 b .. re-memorrdiagnostic_10.0.10240.17236

1/10/2017 1/10/2017 l/10.12017 1/10.12017 1/10/2017 l/10/2017 1/10.12017 1/10/2017 1/10/2017 1/10/2017 1/10/2017 1/10/2017 1/10/2017 1/10/2017 1/10/2017

05:01 PM <DIR>

04:49 PM <DIR>

04:48 PM <DIR>

05:01 PM <DIR>

0 04:48 PM <DIR>

05:01 PM 05:01 PM

<DIR> <DIR>

0054::3488 PPMM <DIR>

05:01 PM <DIR>

0044::~ PPMM

<DIR> <DIR>

05: 01 PM <DIR>

04:48 PM <DIR>

6 05:011FPiMle(s) 19 Dir<,>

<DIR> 45,5

3

4

b . . vironmen -o,-loader_10.0.10240.17236 gdi32_10.0.10240.17236 i .. ia-mergedcomponentsI10.0.10240.17236 ie-htmlrendertn _11.0. 0240.17236 ntprint.inf 10. . 10240.17236 ntgrtnt4.int_10.0.10240.17184 OL 283 Powershel 1 prnms003.inf_10.0.10240.17236 prnms004.inf_l0.0.10240 17236 s .. -spp-plugin-window,_i0.0.10240.17236 s .. y-spp-plu9in-common 10.0.10240.17236 scrlpting-Jsorlpt9 11.0. 10240.17236 win e-smi-schemaI10 .0.10240.17236 xus 22.inf 10.0. 0240.17146 283 bytes ,920,704 .bytes free

E

Patch Extraction Results This slide simply shows the results in the remaining folders. These should be easily mappable to security
advisories on the Microsoft website. Let's try to do one on the next slide.

© 2017 Erik Van Buggenhout & Stephen Sims

89

Mapping a Patched File to the Se curity Advisory

MS17-001 says: Microsoft Security Bulletin MS17-001 - Important

Security Update for Microsoft Edge (3214288)
Pub&- JanuMy 10 2017

c:\Patches\MS17-JAN\x86>cd ie-htmlrendering_ll.0.10240.17236

c:\Patches\MS17- JAN\x86\1e-htmlrendering_ ll.0.10240.17236>dir Volume in drive Chas no label. Volume Serial Number is 6681-3E06

Directory of c :\Patches\MS17-JAN\x86\ie-htmlrendering_ ll.0.10240.17236

01/10/2017 01/10/2017 12/21/2016

05:01 PM <DIR>

05:01 PM <DIR>

12:00 AM

18,796,032 edgehtml.dll

1 File(s)

18,796,032 bytes

2 Dir(s) 45,532,430,336 bytes free

SAN~

Mapping a folde r to an advisory
One of the folders. after we ran PatchClean. is "edgehtml.dll." It seems that we were able to correlate the patch to the Microsoft Edge advisory and would be able to continue analyzing.

Mapping a Patched File to the Security Advisory
When looking at MSI 7-00 I we see that the security bulletin ·applies to the Microsoft Edge browser. One ofthe folders, after we ran PatchClean, is "edgehtml.dll." It seems that we were easily able to correlate the patch to the advisory and would be able to continue analyzing.

90

© 2017 Erik Van Buggenhout & Stephen Sims

Patch Diffing
Security patches are often made to applications, DLLs, driver files, and shared objects. When a new version is released, it can be difficult to locate what changes were made:
· Some are new features or general application changes · Some are security fixes · Some changes are intentional to thwart reversing
Some vendors make it clear as to the reasoning for the update to the binary. Binary diffing tools can help you locate the changes.
SAN~
Patch Diffing As we are all aware, new versions ofapplications come out all the time, as do patches to existing DLLs, drivers, and shared objects. Some of these changes are simply new features rolled out or fixes to performance problems. Other changes are vulnerability patches that are certainly of interest. If someone can take the unpatched version ofa binary and diff it against the patched version, the code changes may become visible, shining a light on an otherwise unknown vulnerability. Those systems that are properly patched would be safe, leaving anyone who has not patched their system exposed to a potential I-day exploit. Some vendors make it clear as to the reasoning behind an update, whereas others attempt to hide their intentions. Either way, binary <lifting tools can often help us locate code changes that could potentially reveal the patched vulnerability. This is a lucrative practice because many organizations do not patch their systems quickly.

© 2017 Erik Van Buggenhout & Stephen Sims

91

Binary DiffingTools
The following is a list of well-known binary diffing tools:
· http://www.zynamics.com/bindiff.html
Zynamics/Google's BinDiff: Free as of March 18, 2016!
· http://corelabs.coresecurity.com/index.php?module=Wiki&action=view&t ype=tool&name=turbodiff
Core Security's turbodiff: Free
· http: //www.darungrim.org/
DarunGrim 4 by Jeongwook Oh: Free
· http://code.google.com/p/patchdiff2/
patchdiff2 by Nicolas Pouvesle: Free
· http://github.com/joxeankoret/diaphora
Diaphora by Joxean Koret
SAN~
Binary Diffing Tools There a few well-known binary diffing tools, most ofthem free; although many have specific dependencies on versions off DA.
· BinDiff: Created by Zynamics, acquired by Google in 2011 - http://www.zynamics.com/bindiff.html · Turbodiff: Created by Core Security -
http://corelabs.coresecurity.com/ index.php?module= Wiki&action=view&type=tool&name=turbodiff · DarunGrim 4: Written by Jeongwook Oh - http://www.darungrim.org/ · Patchdiff2: Written by Nicolas Pouvesle - http://code.google.com/p/patchdiff2/ · Diaphora: Written by Joxean Koret - http://github.com/ joxeankoret/diaphora

92

© 2017 Erik Van Buggenhout & Stephen Sims

Example of BinDiff Results

:.,ow 110<!0 G/14)11· lltlO<OOO S.a,d\ '.l'{ln6oW t:felp

O, Worl<Si,ac,e ; _Lo..W.l«>r,@20.. _l..~

.

- mrn~

· : .

+ro- i ~ ~ Q ~ · = t7J)t5l0$ _lo.Ml

~

~

~I

~~

0 "

·

Example of BinDiffResults What you see on this slide is the visual diff oftwo versions ofthe same file. On the right, would be the patched version and on the left, is the version from the last time it was patched. When comparing these two versions together the only changes sho uld be related to the most recent security fix. Some DLL's and other binaries might have over 20,000 functions. Using these diffing tools, we can greatly reduce the number of files we would have look at when trying to identify modified code in relation to a vulnerability.

© 2017 Erik Van Buggenhout & Stephen Sims

93

Example of a Patched Vulnerability

Unpatche d
The dwFlags argument to LoadlibraryExW() in the unpatched version is set to 0

000000011003a2A0
o....oo OtJli,(1()1.Qt'lJ.l
~(I Kl0IJU··~J3:iA"

?e..lldUMr...,.....Stzlft9110bil.Selput8YAnN>WtW<~.\1MOO&e@ftADWt

A 1'

ti, d

l.~111

t··.;,c;,

: -Le 11 !.:,. ·

00 QOOO l IOOl!!!lAII 000 ~00 !80033:W> l).()0f'lQOOJ81)Q"..Sr.6l
000 000 UOOJ!!-."fll

··r c·ll
lM t.

1.t )hX

00000001800382AO 00000001 00>E 1 0000000lu00J.JCRJ 00D0000180031!CfA

?BuildO. . rAgentSt.ri.n9NobileHelpuU'lAPBADW4UAOOMPMNOOE8enA011-'0S.UAGDff TYPJ:t
XO%
l~n
~OV

OOOOOOOIBOOlh:CO 000000018003SCC~ ODO 00001800 t. ··

C41: t~~t j z

--.

--,
Exam ple of a Patched Vulnerability When running a Visual Diff and analyzing the changes, the block shown on this slide shows the issue. The dwFlags argument to LoadLibraryExW() in the w1patched version is set to 0, while in the patched version it is set to 0x800. This is a common fix when dealing with DLL side-loading vulnerabilities. A dwFlags argument of0 results in the potential loading ofDLL's from outside ofsafe locations. A dwFlags option of 0x800 states that DLL's may only be loaded from the "%SystemRoot%\ Windows\System32" folder.

94

© 2017 Erik Van Buggenhout & Stephen Sims

Uninstalling a Patch

Sometimes, when testing patches, diffing, testing exploits, etc., you

need to uninstall an update.

· Simply go to Control Panel, "View Installed Updates," and double-click on

the one to uninstall:

0 X

I>

This is an example from a Windows IO base build with minimal updates, hence the
lo w number listed.

Unin$tall an upd·te

c--. ToUf'Wl'l~·II ,n.upd.Mt. Mkt:tc from the l,rt tnd thtndietUnarn:1,1Of

0.9"'itt ·

. e

~,ol\W""'°""1,(3J

[,JUpd.111tfo«t¥1'otOft.V.llftdoo#'l(.1(8JlM2'00J

t,1t<,tot,oft~

t,'*url(yUpd,te:f0tM<r°'°'tW~(.OJl1S,1JT) MC'.rMOftW.ndowl

.:UDOtttf«.,iictosd\~1,(Q.)116l71)

~r(l"I-Oft'l>lll'ldowl

Cwt,ctv ,.,un.d upd.llu
; / ) t,,,pd.,tn 1r ,.,:1

SANS

Uninstalling a Patch Sometimes, a patch was already applied to a system you want to test, or you may want to uninstall an update for any number of reasons. The process is simple because Windows archives the old versions of patched DLLs and other files. Simply go to your control panel and type "View Installed Updates" into the search field. A box with the installed updates will appear as shown on the slide. When you find the update you want to uninstall, double-click it, and you will be asked if you are sure you want to uninstall this update. This is an example from a base build with minimal updates, hence the low number listed.

© 2017 Erik Van Buggenhout & Stephen Sims

95

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Averting Payload Delivery · Day 3: Preventing
E;q>loitation · Day 4: Avoiding Installation,
Foiling Command & Control, & Thwarting Lateral Movement · Day 5: Exfiltration, Cyber Deception & Incident Response · Day 6: APT Defender Capstone
SA~S

SEC599.3

Securing the Network

Network Access Control & 802.1 X

Securing Software

Software Development Ufecycle (SOL) & Threat Modeling

Vulnerability Assessments

Exercise: Authenticated Scans Using Nessus

Patch Management

·

Exploit Mitigation Techniques Exercise: Exploit Mitigation Using Compile-Time Controls

Exploit Mitigation Techniques - Exploit Guard, EMIT, & Others

Exercise: Exploit Mitigation Using EMIT & MalwareBytes

Securing Endpoints

OS Hardening & Best Practices

Endpoint Protection Solutions

Application Whitelisting to Stop Payload Execution

Exercise: Configuring Applocker

This page intentionally left blank.

96

© 2017 Erik Van Buggenhout & Stephen Sims

Exploit Mitigation Controls

Being phased out.. .

Application Opt-In
Controls

OS
Controls

CompileTime - SafeSEH
Controls

SANS

Exploit Mitigation C ontrols First, let's briefly discuss the role of exploit mitigations. We are all aware of the concept of"Defense in Depth." The idea is that any one control may fail so we want as many as possible without impacting application or system perfonnance too significantly. lfwe only utilize a single control such as Data Execution Prevention (DEP) and an attacker figures out a way to disable it, then there is nothing left protecting the application or system from compromise. By layering on various controls, it can stop or at least greatly increase the difficulty to achieve exploitation. ,,..... The basic Venn diagram on the slide shows three categories ofexploit mitigation. On the top is "Application Opt-In Controls." This is the least effective category as typically a flag exists in the compiled program and at runtime, a control is enabled or disabled based on this flag. An attacker could theoretically utilize a hex editor to modify these !lags if they can detennine where it is stored, disabling the protection. Let's use the good example ofDEP. On Windows, DEP is controlled through the system control panel. An administrator can turn DEP on or off for all applications, or define exceptions. You wouldn't also want the application itself to decide ifit wants to opt-out and ignore the settings in the control panel. As an example to demonstrate the issue, up until Windows 7 there was an API that existed in ntdll.dll called the "LDRPCheckNXCompatibility routine." It checks the application to see ifit is to participate in DEP. It was removed as disabling DEP was simple and possible by replaying runtime code in ntdll.dll during an exploit. You can find out more about this technique here: http://uninfonned.org/index.cgi?v=2&a=4&t- 1xt
The other two categories, "OS Controls" and "Compile-Time Controls" provide the best options. OS controls include protections such as Address Space Layout Randomization (ASLR), DEP, Structured Exception Ilandling Overwrite Protection (SEHOP), and Control Flow Guard (CFG). The operating system must support these controls, and sometimes even the hardware. Each OS is different, but they are typically designed to be controls that cannot be turned off by an application. They are system enforced. Compile-time controls are exactly how they sound; they are controls that are added during compile time. These often insert code or metadata into the program. Examples include stack and heap canaries, MemGC, SafeSEt-1, and Dynamic Base. We will discuss a sample ofthe most prominent controls in this module. As we increase the number of controls and move into the merged areas of the circle our protection should mcrease.

© 2017 Erik Van Buggenhout & Stephen Sims

97

High-LevelTimeline - Notable Client Mitigations

None

DEi'

SafeSF.H

Safe Unlink

Cana ries GS

'E p . .

.

.. Null Ptr Deref

Gilkiklliih44

CFG

SANS
liigh- Level Timeline - Notable Client Mitigations This slide shows a high-level timeline ofexploit mitigations added or made available over the years. This is not conclusive by any means, and we will address many ofthem in this module.

98

© 2017 Erik Van Buggenhout & Stephen Sims

What AreThese Mitigations Targeting?
Common exploitation techniques include:
· Buffer Overflows · Heap Overflows · Integer Overflows · Null Pointer Dereferencing · ToC/ToU Race Conditions such as Double-Fetch · Use After Free
They are attempting to block a successful attack, or at least make the life of an attacker more difficult. To have some context, let's look at how something like a buffer overflow works and then discuss the mitigations.
SAN~
What Are These Mitigations Targeting? There are many different bug classes, each varying in difficulty in relation to discovery, exploitability, reliability, etc.... Some common bug classes related to low-level languages such as C and C++ include buffer overflows, heap overflows, integer overflows, null pointer dereferencing, race conditions, and use after free. The exploit mitigations that we are discussing focus their efforts on preventing the exploitability of these vulnerabiIities. The majority of operating systems and large applications are written in C and Ct t, as well as assembly, and Objective-C. The main benefits of using low-level languages are their ability to directly access memory, processor registers, and other low-level functionality. This access also allows for costly mistakes. Let's look take a look at a basic buffer overflow that will provide context when discussing the mitigations.

© 2017 Erik Van Buggenhout & Stephen Sims

99

I
Normal Stack Memory Allocation (I)
In Code
int overflow(char* inputl){ char buff{16}; strcpy(buff., inputl); return e;
}
void main(int argc., char * argv[J)
{
overflow(argv[l]);
}

In Memory
..c.
~
0
L.
(.'.)
Stack

Normal Stack Memory Allocation (1) On the left ofthis slide is the C source code:

int overjlow(char* input/){ buffer overflow
char bujj[l6}; strcpy(buff, input/); data to the buffer return O; }
void main(int argc, char* argv[J) {
overflow(argv[I]); function, passing stdin }

II This is a fimclion called overjlowO which contains a II Allocating a 16-byte buffer called buff
II The vulnerable strcpy0 function copying user-supplied II Returning a stah1s ofOifall isfind II This is the mainOfunction with which all C programs begin.
II The mainO function calls the vulnerable overjlowO

On the right is the stack ofthe process once the program is compiled and run. The stack is a region in memory that stores data associated with function calIs. Each function called gets its own allocation ofmemory on the stack called a stack frame. The stack grows from high memory towards low memory. If function A() calls function B(), then function B()'s stack frame will be built on top of function A()'s. As the code in a function finishes, control is passed back to the calling function via the return pointer. In the image on the right, you can see that main()'s stack frame is at the "bottom ofthe stack", on top of which stack frames for other functions (e.g. overflow) are built.

100

© 2017 Erik Van Buggenhout & Stephen Sims

Normal Staci< Memory Allocation (2)
In Code
int overflow(char* inputl){ char buff{16)j strcpy(buff, inputl)j----~ return e;
}
void main(int argc, char* argv[])
{
overflow(argv[l))j
}
./vuln_prog 'python -c 'print "A"* 12''
SAN~

In Memory
l
Stack Attacker·s input

Normal Stack Memory Allocation (2)
On this slide, you can see that the attacker is using Python to send 12 A's as input into the program. This input goes into the program via standard-in (stdin). "Argv" is the argument vector. At argv[0] is the name of the program and argv[ I] would be the first argument passed by the attacker, which is the 12 A's. If a second argument was passed it would be reachable at argv[2]. Again, it is simply the argument vector. In the main() function the overflow() function is called, and passed argv[ l] as an argument. The overflow function takes a pointer "char* input I" to the argument and names it input I. The 16-byte buffer is then al located, and then strcpy() is called, copying the 12 A's into the 16-byte buffer. The problem with strcpy() is that it does not provide any bounds checking. In other words, there is no size argument to limit the amount ofdata copied into the allocated buffer. So, if the attacker passed in I00 A's strcpy() would happily copy all of it into the buffer, overwriting important items such as the return pointer back to the main() function.

© 2017 Erik Van Buggenhout & Stephen Sims

101

Stack Overflow (I)

In Code

int overflow(char* inputl){

char buff[16};

strcpy(buff, inputl);----

return e;
}

Return pointer

void main(int argc, char* argv[J)

{
overflow(argv[l));

Attacker's input

}
./vuln_prog 'python -c 'print "A"* 32''

In Memory Stack

Stack Overflow (1)
On this slide, the attacker has sent in 32 A's instead ofonly 12. As you can see, strcpyO happily wrote past the 16-byte buffer allocation, overwriting the return pointer back to mainO amongst other things. When the process went to return control to main it returned to "AAAA." The letter "A" in hex-ASCII is "0x4 I." The "Ox" on the front ofthe number indicates that it is a hexadecimal value or Base- I6. So " AAAA" maps to "0x4 I4 I414 l " which is why we are seeing that show up in the segmentation fault at the bottom. The attacker now knows they can gain control of the program. At this point, they would use a debugger or disassembler to determine the exact number of bytes before reaching the return pointer.

102

© 2017 Erik Van Buggenhout & Stephen Sims

I
Stack Overflow (2)
1. Using a debugger, the attacker gets the static memory address of the buffer.
2. They place their shellcode into the buffer and overwrite the return pointer with the address of the buffer.
Scgmcnc.:won F~ult RP "" Add, ess oi Shellcode
3. When the process goes to return control to main(), control is instead passed to the attacker's shellcode.

In Memory Stack

Stack Ove rflow (2) Once the attacker determines the exact number of bytes to get to the return pointer, as well as the address of the buffer, they can insert their shellcode into the buffer first, and then overwrite the return pointer back to main() with the address oftheir shellcode. The exploit mitigations will focus on things like randomizing the addressing in memory, preventing execution in writable regions, place guards into memory, and many other
approaches.

© 2017 Erik Van Buggenhout & Stephen Sims

103

Let's Go Over Some Mitigations
Keep the buffer overflow example we just walked through in your head as we cover some mitigations
Think of how each ofthese controls would stop the attacker from successfully gaining control of the process:
· The attacker relied on being able to overrun the buffer and overwrite the return pointer => How could we protect that pointer?
· Also, the attacker normally places shellcode into memory somewhere which serves as the payload => How could we prevent the location or execution of that payload?
Let's Go Over Some Mitigations Now, let's keep the buffer overflow example we just discussed in our mind, as we cover some mitigating controls. Try to think how each of the introduced controls could possibly stop the attacker from successfully gaining control ofthe process (& thus being able to execute malicious code).
There are two interesting things to note:
I. The attacker relied on being able to overrun the buffer and overwrite the return pointer. How could we protect that pointer?
2. Furthermore, the attacker usually attempts to place shellcode into memory somewhere, which will serve as a payload that is to be executed. I-low could we prevent the location or execution ofthat payload?
The author recognizes this is not the easiest topic ofthe day, but ifwe want to protect against advanced adversaries, it's vital we understand how modern exploit mitigation strategies work. As always, should you have questions or would look some additional guidance on this subject, please don't hesitate to contact your instructor or TA. Let's have a look!

104

© 2017 Erik Van Buggenhout & Stephen Sims

Address Space Layout Randomization (ASLR)
ITake away predictability by randomizing regions of memory each time a process is started.
IOn some OSes, this includes libraries, while others do this separately as a compiler option.
IAttackers like to rely on the static locations of objects.
IIncreasing the entropy increases the difficulty of exploitation.
Address Space Layout Randomization (ASLR) Imagine ifeach time you went to retrieve the salt and pepper from your kitchen that it was in a difterent location. Even though the last ti me you used it, you put it in a specific location for retrieval later, the next time you went to use it the location changed again. This would likely cause frustration. The concept is not so different from ASLR. Attacker's like for things to be static in memory no matter on what system the vulnerable applicatio n is running. This a llows for them to use static addressing in their exploits. If an attacker gains control of a process and attempts to execute their payload, but the location has changed, it will likely crash and fail.
On some operating systems, the libraries are randomized as part ofthe overall system setting for ASLR. Many Linux variants include a file called " randomize_va_space" which stores a value of 0, I, or 2. If the value stored is a Othen ASLR is off, including libraries. If the value is a I or a 2 then ASLR is on. On the Windows OS ASLR cannot be turned offfor the system; however, there is a compile-time control known as "DynamicBase" which determines ifa Dynamic Link Library (DLL) is to be randomized once loaded into a process.
Take the earlier example ofthe salt and pepper. If your kitchen is rather small, and you know that the salt and pepper must be stored somewhere in the kitchen, then the chances of you guessing the right spot are pretty good in a short number of tries. At least when comparing it to an example where your kitchen is the size of a sports stadium. If this were true the chances of successfully guessing the right location of the salt and pepper is greatly lessened.

© 2017 Erik Van Buggenhout & Stephen Sims

105

Data Execution Prevention (DEP)
When an application is executed, a process is created. Within this process, there are many segments created, such as:
· Stack Segment - Procedure stack used during function calls · Heap Segment - Writable region in memory used for dynamic allocations · Code Segment - Executable region in memory used to hold program code · Data Segment - Readable region in memory used to hold initialized data
You wouldn't want an attacker modifying your code, so the code segment is executable, but not writable. You wouldn't want an attacker executing their payload (shellcode) in writable memory regions, so the data segment is non-executable.
SANS
Data Execution Prevention (DEP) DEP is a mature OS control that is quite simple to explain. Executable code resides in its own segment in a process called the code segment. You certainly wouldn't want anyone to be able to modify the code in your program. When thinking about the three basic permissions, read/write/execute, then it is easy to see why the code segment should be executable but not writable. When dealing with writable segments of memory within a process such as the stack and heap it is clear that they need to be writable. Now since those regions are writable we have concerns around an attacker inserting their own malicious code into these areas and somehow causing code execution to occur. We can mitigate this concern by marking this memory region as writable, but not executable.
DEP must be supported by the processor. ln RAM, when an allocation occurs, a unit of measurement known as a page is used. On most OSes, a page of memory is 4KB for alignment purposes. They are allocated by the processor. As pages of memory are allocated a special bit is set, known as the eXecute Disable (XO) or No eXecute (NX) bit, depending on the hardware architecture. Regardless, they are identical as to their role. The bit simply determines ifthe page is writable or executable, as the idea behind the control is that you cannot be both.

106

© 2017 Erik Van Buggenhout & Stephen Sims

SafeSEH (I)

To understand the Safe Structured Exception Handling (SafeSEH) control we must first cover exception handling.

Exception handling code is used to handle an expected or unexpected event and hopefully, prevent a process from crashing.

· e.g.

try: <Ask the user to enter a number...>
except ValueError: <User entered a non-integer, catch and give them
another tr ...>

This Python example is a handler included by the developer to catch and handle an expected exception. such as a user entering an ASCII character where the program is expecting an integer.The code would catch the exception and prevent the program from crashing.

SAN~

SafeSEH (I)
To explain the Windows Safe Structured Exception Handling (SafeSEH) compile-time exploit mitigation control we must first cover basic exception handling and Windows SEH in general. An exception is something that occurs within a process, such as an anomaly, or an intentional attempt to cause program fault, that potentially affects the stability of the process. If we have exception handling code within the program then the exception that has occurred can potentially be handled, preventing the process from crashing. Some exceptions can be anticipated, while others are unexpected. Look at the following Python-like example:
try: <Ask the user to enter a number...>
except ValueError: <User entered a non-integer, catch and give them another try...>
The "try" and "except" syntax is used to create a handler in Python. We are basically saying that we wish to try the following code, but ifan exception occurs we wish to have it handled. We are asking the user of the script to enter in an integer value. If the user enters anything other than an integer value, Python will throw a "ValueError" exception, which can be anticipated. When this type of exception is experienced our code would catch it and pass control back to the "try" block again. I landlers are supported by a lmost all programming languages.

© 2017 Erik Van Buggenhout & Stephen Sims

107

SafeSEH (2)

Exception Occurred Can you handle?..(}.
''''''

Windows Structured Exception Handling (SEH)

No
--------, Can you handle?

No
SEH Handler 2 ---------· Can you handle?

Yes ..(J.

No
SEH Handler 3 ---------· Can you handle?

iii/fl

Eii\11

SEH Handler 4 Call Final Handler
Terminate Process

SafeSEH (2)

.....

The windows SEH mechanism is used to handle various types offaults that cannot or are not handled by

developer code. An example of an exception that would cause control to shift the SEH mechanism is when the

processor attempts to read from or write to a memory address that is not mapped into the process. Processes

only take up the physical memory and virtual addressing that is required to run the program. If they run out of

memory, more can be requested. If something causes a process to attempt to read or write to an address that is

not mapped from virtual memory to physical RAM then an exception occurs. Control would move to the SEH

chain. It is called a chain because, as you can see on the slide, if one exception handler cannot handle the

exception, control is passed down the chain until it is handled or it reaches the end. If the end is reached and

none of the handlers were able to handle the exception, then the program is terminated. The handler code

resides in various DLL's such as ntdll.dll. The pointers to or addresses of the handlers are stored on the

procedure stack for the thread.

.....

108

4:> 2017 Erik Van Buggenhout & Stephen Sims

SafeSEH (3)

SafeSEH is an optional compile-time control that builds a table of all valid handlers in a DLL; the table stores the addresses of each

valid handler.

SafeSEH is aimed at stopping buffer overflows where an attacker attempts to overrun a buffer, overwriting the address of a handler to

hijack control.

0

V

Buffer

e

r

f

I
SEH
0

w

SafeSEH (3)
SafeSEH is a compile-time control that builds a table of all valid handlers inside of a D LL. Each handler has a starting memory address within a module. This is the address stored in the SafeSEH table. A common attack technique is for attackers to overwrite the location in memory where the address ofa handler is stored. In case you are curious, the SEH chain resides on the stack for each thread within a process. An attacker would overwrite the handler address in memory with the address oftheir choosing. There are common techniques used by attackers to gain control ofa process v ia SEH overwrites. lfan attacker overwrites one ofthese SEH addresses and the address w ritten by the attacker points into a SafeSEI-1-protected DLL, they would be caught and the process tenninated. It is not seen as a very effective control as all modules (DLL's) loaded into the process must participate in the control. A sing le module that does not participate in the control will render this
exploit mitigation worthless.

© 2017 Erik Van Buggenhout & Stephen Sims

109

SEHOP
IStructured Exception Handling Overwrite Protection (SEHOP).
IVerifies that the SEH chain for a given thread is intact before passing control to handler code.
IInserts a special symbolic record at the end of the SEH chain known as the "FinalExceptionHandler" inside of ntdll.dll.
IBefore passing control to a handler, the list is walked via nSEH pointers to ensure the symbolic record is reached.
SANS

Before calling the first handler. walk the list to ensure the final handler is reached.
' .. ~
he memory location oiQMiliii·iHtitHl\¥411

SEHOP The Structured Exception Handler Overwrite Protection (SEHOP) control was added into Server 2008 and Vista; however, it is disabled by default on almost all versions of Windows. This is due to the potential lack of application support for the protection, although it can be enabled, typically through the use of Microsoft's Enhanced Mitigation Experience Toolkit (EMET). Normally, ifyou follow the nSEH pointers down the stack, you will reach the end ofthe list. Ifa handler has been overwritten, it is likely that walking the pointers will no longer reach the end of the list

As described by Matt Miller (Skape) at Microsoft, the SEHOP control works by inserting a special symbolic record at the end of the SEH chain. Prior to handing control offto a called handler, the list is walked to ensure that the symbolic record is reachable.

References:

......

Miller, Matt (2009-02-2). Preventing the Exploitation of Structured Exception Handler (SEH) Overwrites with

SEHOP. Retrieved January 11, 2017, from technet.Microsoft.com Website

http://blogs.technet.com/b/ s rd/arc h i v e/2 0 0 9/0 2/ 0 2/ preventing-the-exploitation-of-seh-overwrites-with-

sehop.aspx

110

© 2017 Erik Van Buggenhout & Stephen Sims

Control Flow Guard (CFG)
CFG is a relatively new OS control, supported only on Windows 10 and backported into Windows 8.1 Update 3. For it to be effective, all loaded modules within a process must be compiled to use the control. It is aimed at mitigating an attack technique known as Return Oriented Programming (ROP). A bitmap is created at compile-time that represents the entry point into functions within a DLL.
· If an attacker attempts to redirect control during an indirect call to a location outside of a valid function's entry point an exception is thrown
SA~
Control Flow Guard (CFG) CFG is a newer control that requires support by the OS and also that each module (DLL) be compiled with the control as it requires code insertion. lt is supported on Windows IO and was backported into Windows 8.1 Update 3, and is also supported in Server 2016. Again, aside from the OS support requirement, CFO is only effective if all loaded modules (DLL's) are compiled to support the control. The control is aimed at mitigating a common attack technique known as Return Oriented Programming (ROP).
CFG works by creating a bitmap of all valid function entry points fi-om within a DLL at compile time. When an indirect call to a function occurs within a module protected by CFO, the bitmap is checked to ensure that the address is that of a valid function entry point. lf it is not an exception is thrown. To understand indirection, we can use a simple analogy. Ifyou decide to have pizza for dinner you could go to the store, buy the ingredients, and make it yourself, or, you could order from a pizza delivery restaurant. If you make the pizza yourself, you can feel safe that the pizza has not been contaminated in any way as you are the preparer. If you order the pizza from a restaurant and have it delivered there may be various points ofconcern. First, you did not witness the making of the pizza, and second, the pizza may have gone through an adventure during delivery to which you are not privy. We do not need to go into the details. This would-be indirection and is heavily based on trust. CFO attempts to help secure this trust.
For more on CFG visit: https://msdn.microsoft.com/en-us/library/windows/desktop/mt637065(v=vs.85).aspx

© 2017 Erik Van Buggenhout & Stephen Sims

111

More on ROP and CFG
ROP is a technique where attackers string together the addresses of useful code sequences called gadgets.
· Each gadget achieves part of an overall goal such as setting up the environment to call a function to change memory permissions
· ROP is one ofthe de facto techniques used on modern OSes to change permissions in memory
· A lot of effort has been made to mitigate the technique, such as CFG
CFG limits the addresses that can be used as a gadget due to the bitmap that holds all valid function entry points, thus impacting the usefulness of ROP.
SANS
More on ROP and CFG As stated previously, ROP is a technique often used by attackers to achieve a goal. Often, the goal of ROP is to change the permissions in memory where attacker code resides. We previously discussed DEP and how it marks writable regions ofmemory as non-executable. By using ROP, one could set up the arguments to a function call such as VirtualProtect() that allows you to change the permissions in memory. ROP works by identi lying useful short sequences ofcode within executable modules and stringing them together to accomplish their goal. These code sequences are referred to as gadgets. We string the gadgets together which formulates our ROP chain. As mentioned, once an attacker gains control of a process, they may wish to change memory pennissions so they can have their shellcode executed. To do this a system call must be made to a function like VirtualProtect() or VirtualAlloc(). Control ofthe process is passed to the gadgets, which returns to each successive gadget, each performing a piece ofthe overall goal to set up the arguments to the desired function call. CFG limits the number of useful gadgets by only allowing indirect calls to go to addresses indicated in the CFG bitmap.

112

© 2017 Erik Van Buggenhout & Stephen Sims

Staci< Canaries / Security Cookies

When a function is called, a return pointer is pushed onto the stack frame for that function.
· The return pointer is used to return control to the caller once the called function is finished
· Overwriting this pointer due to the use of an unsafe function such as strcpy() can result in control hijacking
A canary is a special value placed above the return pointer for protection.
· In order to overwrite the return pointer, the canary must also be overwritten
· If the value is unknown to the attacker then it won't match when it is checked prior to returning control to the caller

Buffer
Canary Frame Pointer Retum Pointer
Ox1FF3ec28 Arguments

Stack Canaries / Security Cookies Stack canaries, also called security cookies in the world of Microsoft, are a compile-time control that inserts code into functions deemed as needing protection. During a normal function call, an address known as the return pointer is pushed into memory onto something known as the procedure stack. Each function call gets its own stack frame on the procedure stack. A stack frame is nothing more than a small amount of memory to store items such as arguments, buffer space, and variables such as the return pointer. Once the function is finished its stack frame is tom down. The return pointer is used to return control to a specific point in the program just after the occurrence ofthe function call. Since it is stored in writable memory it is prone to being overwritten. Ifoverwritten, control ofthe process can be hijacked by an attacker. The canary serves as a guard that is pushed onto the stack frame above the return pointer. In order for an attacker to reach the return pointer during an overwrite attempt, they must also overwrite the canary. Most canaries are random and thus an attacker would not know what value to write to that position during an overflow. Prior to returning control to the calling function, the canary is checked to ensure it has not been damaged. If the canary check fails then an exception is thrown and the process terminated.

© 2017 Erik Van Buggenhout & Stephen Sims

113

Control Flow Integrity (CFI)
Intel released a paper in June 2016 describing new controls to be added:
· Shadow Stacks · Indirect Branch Tracking
The idea of shadow stacks has been around for well over a decade, such as "Stack Shield" released in 2000: http://www.angelfire.com/sk/stacksbield/
Shadow stacks allow only the CALL instruction to push a copy of the return pointer to protected memory. The return address from the primary stack is checked against the address stored on the shadow stack. Indirect branch tracking performs edge validation.
SANS
Control Flow Integrity (CFI) In June 2016 Intel released some press releases and a detailed PDF on Control Flow Enforcement (CET), their new upcoming control to prevent code reuse attacks and Return Oriented Programming (ROP) techniques. https://software.intel.com/sites/default/files/managed/4d/2a/control-flow-enforcement-technologv-preview.pdf
The primary controls introduced in this paper are Shadow Stacks and Indirect Branch Tracking. Each of these ideas has been proposed in various fonns for well over ten years. An example is "Stack Shield" released back in 2000. http://www.angelfire.com/sk/stackshield/ If properly integrated into the processor architecture, each control could have a moderate impact on code reuse techniques. The grsecurity team released a short posting as to their opinion on how Intel's implementation plan of these controls is lacking. https://forums.grsecuritv.net/viewtopic.php?f-7&t=4490#P9
Shadow stacks work by marking certain pages of memory as protected, allowing only the CALL instruction the ability to write a copy of the return addresses used in the call chain. The return pointer on the actual stack is tested against the copy stored on the shadow stack. If there is a mismatch an exception is thrown.
Indirect branch tracking takes advantage ofthe new instruction "ENDBR32" for 32-bit or "ENDBR64" for 64bit. This instruction is inserted after each valid call instruction. If this is not the next instruction an exception is thrown. The instruction has the same effect as a NOP and simply is used for validation.

114

© 2017 Erik Van Buggenhout & Stephen Sims

r

Exploit Mitigation Quick Reference

"'"""' Mlt···tlon Staclc.~naries Htiip Cooki~s S.feSEH SEHOP CFG ASU< MS hollled Ht41Pi MemGC
l){P vt1u.rd safe unlink
lJH Null Ptr Oefet
·
SAN~

DeMJIOllon

EffecC!vt """

Protecrs stadc.v1t1abl·s from bvffer 0¥4H'f1owtbypyshln,a Ufttqute v.tlu« onto 1he s.tac:kdur1n1 hmcuon -tAo that IIchedc\fd dunna epUM. orlor to r·turn,nacontrol to the all·r

H,ah · fo, 111 flmct'OftS which,....... ·w,o,y/ax,1,./e

Protecu chunk met.ait··nd as,pfJQUon d·W from overllow1 if a chunk involved 1ntM overflo\Y Low · Enttopv only 2"'1 and chut\k.s·enot often e:heoed IJ1f10G1ted ordelet.cl from a fr'ff UH andtht: t,aru1V/cool<J·ched(e,d

COmptle<comrol aimed it prevenuna SEHovflWJ1tes or, thestkk by bu1Jd1na a t·bl· ofvalid

Med · If all modulesft:b411S~

hand.letswithin Hd\ modute

A more efflfdtv.control than ~feSEH prtvtrtitln,SEM OVef'Wfllt:S on the s t abvW.tlkJ"I the nteh H~gh · SEHOCI not turned on bydetault pcinttfson lMst.Kitioensure a wmbollCftoCOfd Is ~Khed

An tffectlvecontrOI to help ml11i·t· ROP·baSed paytotds by bu·ldlnc. bllmapohll val<d funcuon Hlih · If·11 looded rnodults (OU'<) compliedwith CfG enuv pofnu within · module that H -vtifi.d dunrut. Indirect calls

An effective control Ifatl modul·.s..-e ~WO. rtodomlzlntthe loc,;Uon of rn~mory ~am·nts, m>klftf: 0ted1Ctlbill1V dlfflCUlt

High · If ·II loaded rnodu1es(Oll'>) ·te <el>Osed

A MKnKOft bro\'Y'St'r mittpuon aimed at m1tt110ncun: Ahecfree HplolU by 1solat1nc muc:al

b<ow>e<oblects A MiO'osoft btOW'SN m11-aittori aimed 1t mitJcattna use Afte-r Ffff: exploitsby defernna tt\e

free.Ina ofme--and chec1u11a ob~ectre1c,eno,s

An effective mlU&·t·on 1tmed.flP,evf:'nlil''I ~ H .ecut 1on In wl'iUb.l· m.moryteglom. bv

f\W-~ marktn· "'-·1 of

as exclusiveht ·itt.f txecvt1t»e orwritable

Mt'd · A,HocaUon to tsol· LedheiJ» $\ill possible High · VaOdauon of obJectrefertnen a,t· tlymma.1tts UAf Med · fu1ty bypessed 1f ·ttadce<cart Lt\JIIUt ROP

A Mkrosoti btowwr mtt·a·tlon aimed at Mi1f&ltlftl UM After FrH eiplOlts by insertina · c-.anary Med · tftt-e c:lu1 Involved In ·n t11.1Ck rs pt"otKted lntovJnu"I funak>l"I uble-s

AA etfea:iv· protectiOt\ agtins:t rteap rMtaCUt..1 ·tueb mtt1aat1ng, the IOUi4 of1h· unltnti.: and
froothnk mM:rOS A complete tepJacement MCI twdentnao f the frorit ·t':nd h~~ Of\ Window'-, offering 32-bit ch.uni(
-- . . ·ncOOln1.
A protection to mrt,g· t· null potnt·rct.reference auKkst,ycu..rdlnc lh~ first tewp.qu of

Hl&h · Compleuly Mi11pt:H c:t,unk FUNK/ILIN'( 0¥4!.rwritM

Hfih · Chun.le ef'IC'Od.O'IC servesu, 2"l2 Ql\My/coolde

t-4tCh , Mitlga-:.n thh bugcf1ss

..

.

Exploit Mitigation Quick Reference We have not covered all ofthe exploit mitigations shown on this s lide, but this can serve as a quick reference to see what each control does from a high level and get an idea as to their effectiveness. The effectiveness is subjective and based on the experience and experiences ofeach exploit writer. These are the ratings as given
by this author.

© 2017 Erik Van Buggenhout & Stephen Sims

115

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Averting Payload Delivery
· Day 3: Preventing Exploitation
· Day 4: Avoiding Installation, Foiling Command & Control, & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

SEC599.3

Securing the Network

Network Access Control & 802.1 X

Securing Software

Software Development Lifecycle (SOL) & Threat Modeling

Vulnerability Assessments

Exercise: Authenticated Scans Using Nessus

Patch Management

Exploit Mitigation Techniques

·

Exercise: Exploit Mitigation Using Compile-Time Controls Exploit Mitigation Techniques - Exploit Guard, EMIT, & Others

Exercise: Exploit Mitigation Using EMIT & MalwareBytes Securing Endpoints

OS Hardening & Best Practices

Endpoint Protection Solutions

Application Whitelisting to Stop Payload Execution

Exercise: Configuring Applocker

This page intentionally left blank.

116

© 2017 Erik Van Buggenhout & Stephen Sims

Exercise - Exploit Mitigation using Compile-Time Controls
IThe objective of the exercise is to analyze how exploits can be mitigated using compile-time controls. We will use Visual Studio to compile a vulnerable application with and without compile-time control such as stack canaries.
High-level exercise steps: 1. Compile a program without stack canaries 2. Exploit the program to obtain control and perform exploitation 3. Compile the same program with stack canaries 4. Attempt to exploit the program again, now observing the new behavior
Exercise - Exploit Mitigation using Compile-Time Controls The objective of the exercise is to analyze how exploits can be mitigated using compile-time controls. We will use Visual Studio to compile a vulnerable application with and without compile-time control such as stack canaries.
1. Compile a program without stack canaries 2. Exploit the program to obtain control and perform exploitation 3. Compile the same program with stack canaries 4. Attempt to exploit the program again, now observing the new behavior For additional guidance & details on the lab, please refer to the LOOS workbook.

© 2017 Erik Van Buggenhout & Stephen Sims

117

Exercise - Exploit Mitigation using Compile-Time Controls - Conclusion
During the exercise, we used compile-time controls to mitigate exploitation, even if a given application is vulnerable.
We will now introduce exploit mitigation software such as EMET, which focuses on stopping exploitation at runtime.
As with many security issues, this is a cat-and-mouse game, and adversaries are increasing their efforts to overcome these exploit mitigation techniques, so we should not only rely on them to prevent exploitation!
SANS
Exercise - Exploit Mitigation using Compile-Time Controls- Conclusion During the exercise, we used compile-time controls to mitigate exploitation when the vulnerable application is being compiled. This is of course only an option ifyou control the application source code yourself and can compile it. In the next course section, we will introduce exploit mitigation software such as EMET, which focuses on stopping exploitation at runtime.
For us defenders, it's a powerful plus to have an in-depth understanding of how current exploit mitigation techniques work, so we can make the right decisions on what type of protection measures we are to implement in what environment.
As with many security issues, this is a cat-and-mouse game, and adversaries are increasing their efforts to overcome these exploit mitigation techniques, so we should not only rely on them to prevent exploitation!

118

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2 : Averting Payload Delivery
· Day 3: Preventing Exploitation
· Day 4: Avoiding Installation, Foiling Command &Control, & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

SEC599.3

Securing the Network

Network Access Control & 802.1 X

Securing Software

Software Development Lifecycle (SDL) & Threat Modeling

Vulnerability Assessments

Exercise: Authenticated Scans Using Nessus

Patch Management

Exploit Mitigation Techniques

Exercise: Exploit Mitigation Using Compile-Time Controls

·

Exploit Mitigation Techniques - Exploit Guard, EMET, & Others Exercise: Exploit Mitigation Using EMET & MalwareBytes

Securing Endpoints

OS Hardening & Best Practices

Endpoint Protection Solutions Application Whitelisting to Stop Payload Execution

Exercise: Configuring Applocker

T his page intent ionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

119

Exploit Mitigation Techniques - Exploit Guard, EMET, & Others
EMET is a Microsoft utility aimed at providing a series of modern exploit mitigations to prevent the successful exploitation of vulnerabilities.
· Currently up to version 5.52 at the time of this writing, but often updated to resolve bugs and bypasses.
· The latest information is available at http://microsoft.com/emet · Microsoft announced the end oflife for EMET as ofJuly 31st, 2018. · Many in the security community are very disappointed at this decision · Microsoft is advising users of EMET to upgrade to Windows 10, as the 2017
"Fall Creators" update of Windows 10 will include most of the protections offered by EMET (branded "Exploit Guard")
Applications must be tested to ensure they are not negatively impacted or broken by EMET's controls.
Exploit Mitigation Techniques - Exploit G uard, EMET, & Others Microsoft's EMET utility was released back in 2009 around the same time as Windows 7. It offers numerous exploit mitigations aimed at providing defense-in-depth to applications and prevent the successful exploitation of vulnerabilities. At the time ofthis writing, EMET version 5.52 was the latest available from Microsoft. The latest information and re lease download is available at http://microsoft.com/emet. EMET releases typically add new protections, general feature improvements, or resolve disclosed bypass techniques. Sadly, Microsoft announced in 2016 that support and deve lopment of the product will end on July 31, 2018. Initially, Microsoft meant to discontinue support in January 2017, but due to feedback from customers, they agreed to push back the date. The exact reasoning for the discontinuation of EMET by Microsoft is unclear, though it likely has to do with a low adoption rate over the years and a focus on Windows IO security and beyond. Many companies are concerned about the negative impact EMET may have on their applications and system performance. EMET was also not initially intuitive to use and lacked good per-application granularity, as well as centralized management which also likely contributed to the low adoption rate.
Microsoft's recommendation as stated at http://microsoft.com/emet is to simply migrate to Windows IO for improved security. Microsoft is advising users of EM ET to upgrade to Windows I0, as the 2017 " Fall Creators" update of Windows IO will include most ofthe protections offered by EMET (branded "Exploit Guard").

120

© 2017 Erik Van Buggenhout & Stephen Sims

Application Testing

(ID El'ET ~ S2
El'ETcle!lltttd eaa.,, ,,.ngal>O<\ n! Ml do>e lt>t~ - : flttlox.exe

Microsoft tests EMET against their applications to ensure it they are not broken due to the various protections.
· They may also opt to disable certain protections at a per-application level if one is causing trouble
· It is not possible to test under all conditions

Organizations must test internal and third-party applications under EMET enforcement to ensure stability

The controls may also cause a performance hit.

· This is typical of any exploit mitigation

We will look at an example of an application negatively impacted by EMET shortly.

Application Testing Another point of frustration is around application testing. It requires someone to go through all applications being considered for EMET protection by your organization and check to see if any of the protections cause an issue. It is difficult to say at what point you have done enough testing to deem an application safe to use with EMET. Then, ifa new EMET version is released to resolve an EMET bypass technique testing would again be required to ensure the new version doesn't pose any new issues. It is simply not possible to test all scenarios under which an application may run. This is very much similar to how quality assurance (QA) testing occurs during software development. Microsoft EMET comes with a list of default applications that should be protected and generally do not have issues with the utility. These include Microsoft Word, Excel, PowerPoint, Internet Explorer, Edge, Adobe Flash, Java, and several others. Ifyou think about the main applications that fall victim to exploitation at an organization, that list alone should be quite effective.
There are also concerns of a system performance hit due to the additional controls. EMET certainly results in extra code execution to perform enforcement. This can slow down an application; however, on a modern workstation, it shouldn't be too big of an issue. Coming up in an exercise, we will take a look at an example of EMET unintentionally breaking an application. ln this event, you would simply disable that specific control and document any risk accordingly.

© 2017 Erik Van Buggenhout & Stephen Sims

121

How Does EMETWork?
The module erriet.dll is loaded into all processes designated for protection by EMET. Many of the controls simply "hook" application flow at specific points.
· An example ofhooking is when a table of pointers to various functions is overwritten with pointers to different code
· This is commonly used by malware, endpoint protection suites, and anti-exploitation products
· Typically, the originally intended function is reached after going through a series of checks
CALL VirtualAlloc()
SANS
How Does EMET Work? A big question is likely, " How does EMET work?" Some ofthe EMET controls are system- level controls such as DEP, where EMET can control the settings as opposed to going through the system control panel. The more specific per application controls that are native to EMET often work by hooking. This is very similar, if not identical to how many endpoint protection and antivirus products work, as well as malware. Imagine an application wanting to call a function that is deemed critical. Microsoft classifies various functions as critical, such as those with the ability to change permissions in memory, allocate new memory, and many others. When the application goes through the nonnal channel of calling a critical function the address ofthat function has been overwritten with an address inside ofemet.dll. This allows EMET to perform any checks, and ifall looks good control is passed to the desired critical function. We will look at specific examples ofcontrols coming up soon.

122

© 2017 Erik Van Buggenhout & Stephen Sims

EMET's Graphical Interface
IOn the right is a screenshot of the EMET GUI from EMET 5.52
IIn the bottom-right, you can see two processes protected by EMET: · Microsoft Excel · Firefox
IWindows Explorer is currently not protected.

e A
1,.1..,.-_.,
-- w.,,d
" "°"'".".."'

_ _ _l_.....,....,

- .:!I Ql,da-- I ~ t e ( l . r l ,· · ¥ '"""' SI, Of-'.c1t :Oll

"°"'9,,·-

s~-..s.er.;,

,I ......,:~lOO
~ T,.,~
...... ..; fllffy\'~

-~
.....
w.

X

--~ -~ .......

__ ..,...,.,.

IIOCl:lll0
~n
All4
e>tl

Jrece.~
l\W.·~t··
t.cb··~f)lplo,~ ttefox ·Fnfoi.

SAN~

EMET's G raphical Interface On this slide is a screenshot of EMET 5.52. Some ofthe buttons and settings are self-explanatory. You can see a mention ofcontrols such as DEP and SEH0P under "System Status." The drop-down box to the right of it would allow you to make any system-wide changes. ln the bottom-right, you can see that EMET is protecting Excel and Firefox, but not Windows Explorer. To make changes to any ofthese settings, you would click on the "Apps" icon on the top ribbon bar. The Certificate Trust (Pinning) control simply allows you to specify Certificate Authorities that are permitted to be used to help prevent man in the middle attacks related to HTTPS.

© 2017 Erik Van Buggenhout & Stephen Sims

123

EMET Application Configuration (I)

When clicking on the @icon you are presented with the following

screen:

Aws

0 '
..-. · -· ~_.-, ..".,'_ bocwt E>,,o,1

)(
AddAoolU- Add\o',~d
.tddi tt.l'l'lllh~

.,";,
9-l'IA PU·

- ~ ·»1

...
<I>

- ~Ol'\e:.,..,

S-0..Gt"'°

"'14·""'

:,,,fa/lA(W,

°''°"'  :),co"" 4,1·
 ---
llltlQl,>Gft~Ol'9'

.-....,.-_.,....,_."" ,~ --· - -...i.exr
OUTlOOLIXl WJl<WOIUl.Dl IXCfUlCf POWlltPlfT.W

fnj

~

... seo>

..,

. .,

 


.,,


.,, .,,

. ,, .,, .,,

...,., E.,. E"" ·

eo,,.


 .,,

. ,, .,



.,, ..,


. ,,

. ,, .,,

  

.,, .,, .,, .,,

.,,.OO<U)

.,, . ,,

.,
    

c-
., . ,,

., s,,,b . ,, .,,

 

.,, .,,

" .., .,,

. ,,

= X

.,,>.SR ~

.., .,,



~

0-

SA~S

EMET Application Config uration ( 1) On this s lide is a screenshot ofthe application configuration window. In the bottom-left, you can see the list of applications and to the right are the controls enforced at a per-application level. There are two default actions that can be taken, "Stop on exploit" and "Audit only." Clearly, " Audit only" will only report that a control detected a problem as opposed to throwing an exception and tenninating the application. This is useful during application testing to see ifEM ET is causing any issues.

124

© 2017 Erik Van Buggenhout & Stephen Sims

EMET Application Configuration (2)

When clicking on the "Show All Settings" icon you are presented with detailed information about each control.

L!

0 · =)(
Mld-l>On Md\",_d

~ =E1 ~ ~~r-,A

~ -~ A;j,>lo,/1

Md /ru-,e

Op<a,J

.,"°" Def"'1

- 0 )(

...,.,..,.,.
~e wonJPMf~e:xe OUllOOk.fXC wuowoawxi
oc«Ulll
POW(Rl'tff.DC{

°""

e Data Exe<:ution Prevention

f O Structured Exception Handler Overwrite Protection

,e ~ Null Page Protection

· G Heap Spray Protection

"'°' - · f_f"t<Mpi.I_,

0

fl"!:Ht:,apfc,,11:yProttttiOrl~a'Y)~i,,e~tHMCMofmirettayNt~COl't'fflOl"frU5«1

bya-ttotloca,t,-a>dt,

SANS

EMET Application Configuration (2)
As shown on the slide, when clicking on the "Show All Settings" icon detailed information about each control
is displayed, as well as the ability to turn them on or off.

© 2017 Erik Van Buggenhout & Stephen Sims

125

EMET Mitigations
As a defender, it is important to understand how each of these exploit mitigations work.
· This allows you to make decisions on which controls should be enabled · A better understanding as to how each control may negatively impact an
application
To better understand each control, you may need to perform some additional research related to exploit development.
· Many of these mitigations are very similar to how other anti-exploitation products work
· They will also show up more and more as defaults in Windows 10 and beyond
We will not cover controls already addressed (SEHOP, DEP, etc.).
EMET Mitigations As a defender, the phrase "Offense must inform the defense" often comes up, but what does that really mean? It is certainly subjective as to how it is to occur. From this author's perspective, to become proficient at a technical area you must put in the time and do the work. You cannot wait for penetration testers, exploit developers, and malware experts to continuously provide infom1ation, and even ifthey could, do you have the prerequisite knowledge to understand what is being said? Take application debugging and reverse e ngineering as an example. Tools such as the Interactive Disassembler (IDA) and WinDbg are commonly used. They are unintuitive tools each requiring countless hours and practice. An exploit mitigation may be related to a very niche way in how low-level instructions are executed by the processor. Failure to have this prerequisite knowledge can limit your understanding as to the effectiveness. This paragraph is by no means an effort to discourage you. If anything, it should serve as a motivator to say that everyone who is an expert in areas such as malware reversing and exploit development paid their dues. There are few comers available to cut.
Even though EMET may ultimately be retired by Microsoft, many organizations will continue to use the utility. Also, many ofthe commercial anti-exploitation products out there utilize the same controls. As more and more systems move to Windows IO it is highly likely that the controls once only available in EM ET are moved into the OS as a default. We will not cover controls that we already covered, such as DEP and SEHOP.

126

© 2017 Erik Van Buggenhout & Stephen Sims

Heap Spray Protection
G Heap Spray Protectio" E ~glatlo,.,.: m,rl Q ~I 0 1!,t,..l!I> SV·1Prottd>On ~ · Y l .,.._...., p,o,....,.. · ·'" o l - y ..,,··- -uotdby·u.d«,· toolocotc.-...-.
Heap spraying is a technique commonly used against browsers and other applications to aid in exploitation.
· With controls like ASLR, an attacker may not know if their shellcode is sitting at a specific address
· By making repeated large allocations in memory containing shellcode, eventually, the desired memory address should be reached
The protection works by pre-allocating areas of memory at addresses attackers rely on during a spray.
· The problem is that there may be addresses that aren't on the list
SANS
Heap Spray Protection Heap spraying is a technique first made public by the researcher Berend-Jan Wever who goes by the handle "Skylined" as part of his "Internet Exploiter" exploit associated with CYE-2004-1050. The original exploit can be found at hrtps://www.exploit-db.com/exploits/612/ . Very little information about how the technique worked was released originally; however, Skylined recently released an article on heap spraying at http://blog.skvlined.nl/2016111800 I .html.
There arc a couple of ways that heap spraying can aid during an exploit. One benefit is to help deal with ASLR and the difficulty in knowing ifyour she llcode will be at a predictable address. Imagine if you were in a small room. You can stand anywhere in the room, but you still only take up the same amount of space. Now, imagine ifsomeone filled¾ of the room with boxes, pushing you over to the remaining¼, limiting the space available for you to stand. Now, imagine that it is not you standing there, rather it is shellcode. If we fill up memory by repeatedly making large allocations that contain our shellcode, we will eventually fill up so much memory that we will have extended the region of memory down to a predictable address. Heap spraying also helps attackers during Use After Free (UAF) exploitation.
The protection works by pre-allocating the commonly used address that attackers rely on during a heap spray. On the slide, you can see an example ofsome ofthese addresses, such as 0x0b0b0b0b and 0x0e0c0c0c. The main issue with the protection is that there are many predictable addresses that can be used, so tracking all of them can be difficult to effectively manage.

© 2017 Erik Van Buggenhout & Stephen Sims

127

ExportAddressTable Filtering (EAF & EAF+)

8 Export Address Table Access Filtering

Eir.t-plotfor!no: JH>I - · v

"'b96""" llw,Elil>o<l .ldcl-... ,_-Al""'9 (EA/')

r<9Jo:..«<eSS to the E>Port """'"' Tobie (tAT)bo>«j on lhe a,lr,g «>do

G Export Address Table Access Filtering Plus

- On - On

0.,bl,ortAddr=Ull,lc.,.....R,.,,ngP\,.(E""'+)n1>91110nblocl:srtadott<trotsto.,.,.,.1~.._,,_ado".,-,....,_1rog,..,rnocUes~vvstdc,,i,r~
- ·<>llnO lhte""°'"'"""o!-·-"""....,.,all&~.

Shellcode often iterates through the Export Address Table (EAT) of kernel32.dll and ntdll.dll.
· This is to locate the address of required functions such as LoadLibrary*() · EAF blocks access to the EAT of these DLL's by recording the
"AddressOfFunctions" field and filtering access using hardware breakpoints · EAF+ improves EAF by specifying modules that are not permitted to access
the EAT, often related to memory corruption bugs such as Use After Free
SAN~

Export Address Table Filtering (EAF & EAF+) The majority ofshellcode for Windows relies on walking through the Export Address Table (EAT) of a DLL in order to resolve the location of its functions. A DLL is a library of functions available for use in applications. An application needs to know where inside the DLL a desired function is located. To make this easy DLL's include an EAT. There is a field called "AddressOfFunctions" which is simply a pointer to an array ofpointers, each pointing to the relative virtual address offset of the functions available for use by an application. EAF works by recording the "AddressOfFunctions" field and creating an exception handler. Hardware breakpoints are used when attempting to access the EAT of kemel32.dll and ntdll.dll. The exception handler created by EMET filters access via the hardware breakpoints, breaking access attempts by shellcode. Breakpoints are used by debuggers to pause execution when hitting a specific memory address or under a certain condition. Hardware breakpoints utilize debug registers built into the processor.
EAF+ improves the EAF protection by allowing you to specify modules commonly involved in memory corruption bugs such as Use After Free (UAF) and denying them from reading or writing to export and import address tables of modules such as ntdll.dll, kemel32.dll, and kemelbase.dll. Included by default, as shown above, is mshtml.dll, flash modules, and Visual Basic modules.

128

© 2017 Erik Van Buggenhout & Stephen Sims

Mandatory Address Space Layout Randomization 8 Mand~ory Address Space Layout Randomization

1. . -0n

During compile time, there is an option called /DYNAMICBASE. It sets an indicator in the header of the module to let the loader know whether the module should be rebased.
· Remember that the OS ASLR randomizes segments such as the stack and heap, but not DLL's
· Rebasing is the way for DLL's to participate in ASLR
Mandatory ASLR from EMET forces the rebasing of modules even when they were compiled not to be rebased.
. SANS

Mandatory Address Space Layout Randomization When compiling a DLL with Visual Studio there is an option called / DYNAMlCBASE. Remember, DLL's and modules are the same things, so the words are used interchangeably. Wl1en compiled with this option, the header ofthe DLL is set with an indicator that it is to be rebased when loaded into a process. ASLR, as controlled by the OS, randomizes segments such as the stack and the heap, but DLL's are randomized separately and at a per-DLL level. lt is often that an exploit mitigation control can be bypassed due to a single module not participating in a control. Mandatory ASLR from EMET mitigates this issue by forcing the rebasing of all loaded DLL's, regardless of the compiler option set. In theory, this should not cause an issue with an application; however, ifthere are static addresses used by the application then a crash could occur. The issue of non-rebased modules is typically with the use of3rd party applications that bring along custom
modules to which the application is dependent.

© 2017 Erik Van Buggenhout & Stephen Sims

129

Bottom-Up Address Space Layout Randomization
G Bottom-Up Address Space Layout Randomization
During memory allocations, such as that by the VirtuaWloc() function, bottom-up allocation means to start from the lowest address in the region to an available slot.
· This allows an attacker to have some predictability in knowing where something is located
Bottom-Up ASLR randomizes the starting point of the "bottom" from the allocator's perspective.
Rebased Bottom
Bottom-Up Address Space Layout Randomization When ASLR randomizes the location of memory segments such as the stack or the heap, a function such as VirtualAlloc() is used to allocate memory in these segments. The allocators typically sta1t from either the top or bottom ofthe memory segment to find an available slot of memory. Always starting from a location such as the bottom allows for an attacker to have predictability as to where in the segment their data is located. By randomizing all bottom-up allocations this predictability is removed, improving the overall ASLR on the system.

130

© 2017 Erik Van Buggenhout & Stephen Sims

Load Library Protection G Load Lib~ Protection.

- On

E ~ J)l>t{.,in,: 32-t.t \ 6i-bot\ )

Jl>eU>OC!U,,nPr<>lf<:llOIIC.oedb)""tiOOl>OnS - 1t,tloecl<,g ofmoclA<sooc.o:.d nl.M:s>olhsQ.~. \\MSi~-.,..t.<1),- ~ nReo.rn Clnonted l'rQ9""""'"9 (ll()P) a!Wd<s.

When attackers use the Return Oriented Programming (ROP) technique, they desire non-rebased modules.
· This prevents having to deal with ASLR · One technique an attacker might use is to attempt to have modules loaded
from UNC file paths (e.g. \\evilsite\bad.d11 as shown above)

By using the Load Library Protection, the ability to load modules from UNC file paths is prohibited.

Load Library Protection EMET has multiple controls focused specifically on mitigating Return Oriented Programming (ROP). Load Library Protection is one of these controls. The easiest way for an attacker to create a ROP chain to use in an attack is to have non-rebased modules inside the process from which they can use static addressing. An attacker can attempt to have the application load DLL's from across the network via a UNC file path. This can be leveraged to load modules which contain code desired by the attacker. The Load Library Protection from EMET blocks modules from being loaded via UNC file paths.

© 2017 Erik Van Buggenhout & Stephen Sims

131

Memory Protection

O Memory Protection
Effecbve platfunns: 32-bit V 64-bet V

· In

The Memory Protection (MemProt) mibgabon asalows marking ·exerute· memory areas on the stack, common ~ r, Reti.ni Onented Pr~airrnng (ROP) attacks.

During a buffer overflow, an attacker will often place their shellcode into or just past the overflowed buffer.

· The goal is to force program execution to occur in the stack region of memory where their shellcode resides

· With DEP typically enabled an attacker will often utilize ROP to call VirtualProtect() or VirtuaWloc() to change permissions on the stack

The Memory Protection mitigation prevents permissions from being changed on the stack by evaluating the address passed as an argument to ensure it's not a stack address.

SANS

Memory Protection
Since the dawn ofexploitation, it has been common for an attacker to overflow a buffer on the stack, put their shellcode into or past the overflowed buffer, and return control to this location to execute their payload. It is fairly standard for DEP to be enabled on modem OSes. Attackers typically use Return Oriented Programming (ROP) to call a function such as YirtualAlloc() or VirtualProtect() to change the permissions on the stack where their shellcode is located; otherwise, an exception would be thrown when trying to execute code in a write-only region. The Memory Protection control from EMET works by evaluating the address passed to YirtualProtect(), YirtualAlloc(), or other similar functions to ensure it is not a stack address. It knows what addresses are stack addresses by looking at a structure in memory known as the Thread Information Block (TIB). Each thread within a process gets a unique TJB. One ofthe items stored in the TJB is the stack limits.

132

© 2017 Erik Van Buggenhout & Stephen Sims

ROP Caller Check

9 :ROP Caller Checki

.· -- - · ·--

_J

U Effective platforms: 32-blt

The Caler Check (c-.-) mit,gabon stops the exea.ibon ofa,bcal functions 1f they are reached 111a a 'RET' instnxt>On, common~ n Retu-n Oriented Proo-'ammino (ROP) attacks.

The intended way for functions to be called is via the "Call"
instruction.
· This instruction first pushes the return pointer onto the stack so control can be passed back to the caller upon completion of the called function, and then redirects control to the called function
· When attackers use ROP, they utilize the "Ret'' instruction to jump to critical functions such as VirtuaWloc() and VirtualProtect()

The Caller Check control works by disallowing these critical functions to be reached via a "Ret'' instruction.

I SANS

ROP Caller Check
In many processor architectures, there is a "Call" instruction. This is the intended way for functions to be called. (e.g. call memcpy) It performs two operations. First, the address ofthe instruction aft.er the "Call" instruction is pushed onto the stack, serving as the return pointer. This return pointer is used when the called function is finished, allowing for control to be returned to the calling function. The second thing the "Call" instruction does is it redirects control to the actual called function. When attackers utilize ROP as part oftheir exploit they often rely on the "Ret'' instruction to return to the start ofcritical functions such as VirtualProtect() or VirtualAlloc(). The Caller Check from EMET works by disallowing critical functions from
being reached via a " Ret'' instruction.

© 2017 Erik Van Buggenhout & Stephen Sims

133

ROP Simulate Execution Flow

G ROP Simulate Execution Flow
Effective platforms: 32-bt _, 64
The Srldate Execubon f'io,r, (Sr'nfxecflow) rnt,oabon repro<l.ices the execubon flow after the reb..rn address, tr)'f'9 to de~ Rebsn Oriented Progatl'WIW'l9 (ROP) attadcs

· )n

tunbel' ofsm.Jated nstrucl>OnS: l5
Typically, when returning from a function, it will be some time before reaching another "Ret'' instruction.

Simulate Execution Flow works by simulating the instructions after the return pointer address to look for the presence of a Ret.
· It simulates 15 instructions by default, but this can be changed · Many applications have had problems with this protection
SANS

ROP Simulate Execution Flow The Simulate Execution Flow "SimExecFlow" control is like the opposite ofthc Caller Check. The Call Check makes sure that we are reaching critical functions via a valid "Call" instruction. SimExecFlow works by simulating a predetermined number of instructions (IS is the default) that exist starting with the address to which the return pointer is pointing. It is looking for the existence of instructions commonly used with ROP, most often a "Ret" instruction. When returning from a function cal l such as VirtualProtectO it is typical ly a while before you would hit another "Ret'' instruction; however, this is not always the case and has been known to cause issues with applications.

......

134

© 2017 Erik Van Buggenhout & Stephen Sims

Stack Pivot

O Stack Pivot

I

-

·

Effective platforms: 32-b!t U 64-btt \..

·~

The Stade Pivot (StadcPlvot) mibQation chedcs 1f the stack poriter tS chanQed to porit to attad<er-controled memory areas, common tednque n Reh.r"n Onented ProgranYIWlQ (ROP) attacks.

During memory corruption exploits such as Use After Free (UAF), it is common to steal the stack pointer away from the stack and point it to attacker-controlled memory such as the heap.

· This is due to three special instructions unique to the stack pointer:
RET - Redirect execution to the address pointed to by the stack pointer · PUSH - Push the desired value onto the stack at the address held in the stack pointer · POP - Pop the value pointed to by the stack pointer into the designated register

Stack Pivot protection works by ensuring that the stack pointer points to the stack by checking the TIB for stack limits.

SANS

Stack Pivot During memory corruption exploits such as Use After Free (UAF), a common technique is to steal the stack pointer away from pointing to the stack region. This is typically accomplished by using an instruction like "XCHG EAX, ESP". This would cause the EAX register to now point to the stack and the ESP register to point to a region such as the heap. This would be useful if the attacker controls memory on the heap and wishes to leverage unique and powerful instructions like "POP," "PUSH," and "RET" in relation to ROP. Registers are hardcoded variables integrated into the processor cores. They are used for arithmetic operations, storing addresses to memory locations, and many other purposes. Examples ofregisters include EAX, RIP, CR3, EFLAGS, ESP, R 1I, etc. The stack pointer is a register (ESP on 32-bit and RSP on 64-bit) that is designed to point to the top ofthe stack while under the context of a given thread. Those three special instructions are very useful to attackers.
RET - Redirect execution to the address pointed to by the stack pointer PUSH - Push the desired value onto the stack at the address held in the stack pointer POP - Pop the value pointed to by the stack pointer into the designated register
The EMET Stack Pivot protection works by checking the stack addressing limits from within the TIB to ensure that the stack pointer is pointing to a stack location.

© 201 7 Erik Van Buggenhout & Stephen Sims

135

Attack Surface Reduction (ASR)
·· ~
O ~ ttack Surface Reduction Effective platforms: 32-blt V 64M U
The Attack Suface Reductioc, (ASR) mibQabon prevents defined modues from beno loaded in the adaess
space ofthe protected process.

Mod.des:

11')PI".cl;J)2iexp.cl;vgx.dl;msxml4·.cl;wshom.ooc;scrrun.cl;vbsa"C)t.cll

tnt«net Zone Exceptions: Loe.al ntranet; Trusted S1tes

Certain functionality, such as that with VB Scripting is often seen as dangerous as it can aid an attacker during an exploit.

Attack Surface Reduction (ASR) allows modules to be specified that are never permitted to be loaded into a process.
SANS

Attack Surface Reduction (ASR)
There are quite a few modules that have been involved in many exploits over the years due to the functionality they provide. A couple examples include vgx.dll (Vector Markup Language support), vbscript.dll (Visual Basic Scripting support), and jp2iexp.dll (Java plug-in). Attack Surface Reduction {ASR) allows you to specify any DLL you wish to never be loaded into a process.

136

© 2017 Erik Van Buggenhout & Stephen Sims

Efforts to Defeat EMET
AB with any security control, there has been a lot of research on ways to bypass, disable, or otherwise defeat EMET. Overall, EMET has had a low adoption rate; however, many of the users of EMET are in "interesting" environments. Some public exploits have been seen checking to see if EMET is running on the system, and if it is it silently fails to avoid detection.

SANS

Example An example of this is from a FireEye report in 2014 from "Operation Snowman" where the browser
exploit first checks for EMET. (https://www.fireeye.com/blog/threat-research/2014/02/operation-snowman-deputydog-actor-
compromises-us-veterans-of-foreign-wars-website.html}

Efforts to Defeat EMET Every time a new security feature or device is introduced into the wild, researchers, attackers, and others look for ways to defeat its controls. This is actually a good thing from a security perspective as too much trust has been given to vendors ofsecurity products, such as antivirus software. EMET has had a relatively low adoption rate over the years due to numerous reasons. This is likely part of the reasoning for Microsoft's discontinuation of EMET in 2018. Many of the users and organizations using EMET are from interesting lines of work, including government, defense, critical infrastructure and others. This would also add to the draw of finding ways around the tool.
FireEye released a paperback in 2014 showing a browser exploit that first checked the victim to see ifthey had EMET running. lfso, it silently fails to avoid detection. This was clearly an effort to keep the exploit unknown for as long as possible. You can check out the details here: https://www.ftreeve.com/blog/threatresearch/20 14/02/operation-snowman-deputydog-actor-compromises-us-veterans-of-foreign-wars-
website. htmI

© 2017 Erik Van Buggenhout & Stephen Sims

137

Interesting FireEye EMET Bypass Disclosure
FireEye discovered a function within emet.dll that completely removes all EMET hooks:
· Simply call DLLMain() in emet.dll with the right arguments: DLLMain(EMET.dll base address, o, o)
· The base address can be found with GetModuleHandleW() which is not considered a critical function
· The first o argument is the flag to unload EMET.dll, 1 is to load · The article is a must read: https://www.fi.reeye.com/blog/threat-
research/2016/02/using emet to disabl.html
s~s
Interesting FireEye EMET Bypass Disclosure FireEye also released an interesting article on a bypass they discovered. To summarize, once you gain control ofthe process you need to deal with EMET prior to attempting the disabling of DEP and execution ofyour shellcode. Much ofthe research has been quite complex in relation to methods to bypass EMET; however, this technique simply requires that you locate the base address ofemet.dll and replay the DLLMain() function with an argument ofO to unload all hooks. Pretty amazing.
References: Alsaheel, Abdulellah. Pande, Raghav. "Using EMET to Disable EMET." FireEye Using EMETto Disable EMET.https://www.fireeye.com/blog/threat-research/2016/02/using emet to disabl.html (accessed February I, 2017).

138

© 2017 Erik Van Buggenhout & Stephen Sims

EMET Bypass -Additional Resources
Some additional resources that can prove to be useful for bypassing EMET include:
· https://duo.com/assets/pdf/wow-64-and-so-can-you.pdf by Darren Kemp & Mikhail Davidov
· http://labs.bromium.com/2014/02/24/bypassing-emet-4-1/ by Jared DeMott
· http://casual-scrutiny.blogspot.com/2016/02/cve-2015-2545-itw-emet-evasion.html by r41p41
· https: //www.offensive-security.com/vulndev/disarming-and-bypassing-emet-5-1/ by Offensive Security
· http://oxdabbadoo.com/wp-content/uploads/2013/11/emet 4 1 uncovered.pdf byDabbadoo
SANS
EMET Bypass - Additional Resources Some additional resources that can prove to be useful for bypassing EMET include:
https: / /duo.com/ assets/ p d f/ wow-64-and-so-can-you.pdf by Darren Kemp & Mikhail Davidov
http://labs.bromium.com/2014/02/24/bypassing-emet-4- I/ by Jared DeMott
http://casual-scrutiny.blogspot.com/2016/02/cve-2015-2545-itw-emet-evasion.html by r41 p41
https://www.offensive-security.com/vuIndev/disarming-and-bypassing-emet-5- I/ by Offensive Security
http://OxdabbadOO.com/wp-content/uploads/20 I3/11 /emet 4 uncovered.pdf by Dabbadoo

© 2017 Erik Van Buggenhout & Stephen Sims

139

Malwarebytes
Malwarebytes is a commercial anti-malware product for Windows, Mac OS, and Android devices.
· A free version is offered with limited functionality, as well as a trial version
Protections are offered against malware, exploitation techniques, and ransomware.
For the purpose of this module, we are looking at the anti-exploit portion of the product.
· Similar to Microsoft's EMET and an alternative as EMET is EOL in 2018. · Focuses on the most commonly exploited applications such as IE, Chrome,
Office, Flash, etc.
SANS
Malwarebytes Malwarebytes Anti-Exploit (MBAE) is a commercial alternative to Microsoft's Enhanced Mitigation Experience Toolkit (EMET), which as stated previously, is set to be end of life in mid-2018. Even if all systems were running Windows 10, there are still many EM ET-provided exploit mitigations not supported natively. This j ustifies the case to consider alternative products. Malwarebytes has been around for over ten years initially offering only anti-malware type features, such as the removal ofSpyware and Adware, as well as identifying common infections through scanning. As the product evolved real-time scanning was incorporated, as well as anti-exploitation functionality like EMET and Ransomware protection. A free version is available once the 14-day trial expires offering anti-malware and anti-spyware protection, as well as rootkit detection, as stated on their website at https://www.malwarebytes.com/mwb-download/ .
For the purposes ofthis module, our attention is focused on the anti-exploitation functionality. To try and simplify configuration and focus on the most common targets involved in exploitation, MBAE focuses on browsers, Flash, MS Office Suite, PDF readers, and media players.
References: Malwarebytes. " Malwarebytes Endpoint Security." MBAEBGuide.pdf https://www.malwarebytes.com/pdf/guides/MBAEBGuide.pdf(January 26th, 2017).
Malwarebytes copyrighted image taken from https://plus.google.com/+Malwarebytes

140

© 2017 Erik Van Buggenhout & Stephen Sims

M alwarebytes Anti- Exploit (MBAE)

MBAE GUI

@ Malword>ytcs Anti-Explo<t P,.,_m (Tnal)

Under the advanced settings menu for MBAE, you can see

Br~

Oworne POf Browu,s Reeders

-MS01tlce ~

<llh«

the different categories of

,,...

protections: · Application Hardening · Advanced Memory

llEP fnforce,nenl
~ en1orcemen
Dyneoric~Enforcemen& Boll~ "51.R Enlorcemet1

~

.ti

"-



"

fl



El



El !:I

,,...

Ols-!r1emetl!xpior'tt' V B ~

.J..1

DelectiOno/Anti.£,cpoi~~·

-'I

,--.

Malwarebytes Anti-'Exploit (MBAE) When looking at the trial version of MBAE, you can go to the "Advanced settings" menu from the control panel to bring up the image on the slide. The tabs at the top include "Application Hardening," "Advanced Memory Protection," Application Behavior Protection," and "Java Protection." Many of the controls should look fami liar as they are similar to EMET, including "DEP Enforcement," "Anti-HeapSpraying Enforcement," "BottomUp ASLR Enforcement" and many others, some not offered by EMET. The techniques behind the controls are very similar, ifnot identical to EMET. MBAE and EMET should not be running on the same system as both will inject a DLL into the applications chosen for protection when started and attempt to apply the same types of hooks. This will likely end badly.
MBAE has additional controls over EMET focusing on Macro abuse of WMl and Visual Basic for Applications (VBA), as well as Java protections focused on common payloads such as Meterpreter.
Check out the following reference for more information: https://www.malwarebytes.com/pdf/guides/ MBAEBGuide.pdf

© 2017 Erik Van Buggenhout & Stephen Sims

141

Looking at MBAE with Immunity Debugger
The image below is a screenshot of Immunity Debugger attached to Internet Explorer:

SANS

Process inje ctio n
The arrow on the right is pointing to the mbae.dll module that was injected into the process.This is the exact behavior of EMET with the emet.dll module. If both emet.dll and mbae.dll were in the process at the same time they would likely be fighting for the same control. When trying to run IE with both running. IE failed to start

Looking at MBAE with Immunity Debugger On this slide is a screenshot from an Immunity Debugger session attached to Internet Explorer. MBAE is installed on the system and you can see that the module mbae.dll is injected into the process as indicated by the arrow. This behavior is identical to EMET. If both emet.dll and mbae.dll were loaded into this process at the same time the would likely be fighting for the same control. As a test to see what would happen this author ran EMET, protecting Internet Explorer, and also MBAE. The process failed to start after several attempts with no alerts from EMET or MBAE and no logs shown in Windows Event Viewer.

142

© 2017 Erik Van Buggenhout & Stephen Sims

MBAE Blocking an Exploit
Stack pivot
The following screenshot is taken from a Windows system after attempting to run a browser exploit using the stack pivoting technique.

Malwarebytes Anti-Exploit has blocked an exploit attempt

- t . o 1 < 11
1 A'_T_,_,
_ _,
~....,

P!--oss.o.,m,- :tnllantteq:.b'l!I' ~edd-MI)
-St.od<_lr9_ _
NIA
,.,,.

!~ '::"I A""N"T"°I-"E['X"PLOIT

MBAE Blocking an Exploit This slide simply shows the alert box that appeared after running a browser exploit on a system protected by
MBAE that uses the stack pivoting technique covered earlier.

© 2017 Erik Van Buggenhout & Stephen Sims

143

Bromium vSentry

A commercial security-oriented micro-virtualization solution providing isolation of user-initiated tasks.
Virtual machines are hardware isolated and utilize Intel's Virtualization Technology (VT).

Only the resources required for a task to run are placed into the virtual machine.

Any attempt to access a resource outside of the VM is caught and passed to the Microvisor for inspection.

Check out Bromium at: https://www.bromium.com

I) Bromium·

SAN~

Bromium vSentry A couple ofcommercial security solutions offer micro-virtualization in where portions of the operating system or processes are contained within their own virtual machine, preventing wide-scale system access. Bromiurn is a vendor offering a product called vSentry which isolates user initiated tasks using Intel 's Virtualization Technology (VT ). Each task is provided with only the resources necessary to properly run. When a task attempts to interact with another task or anywhere outside of its own VM, hardware interrupts occur and the request is passed to the Microvisor for inspection and application of a set of mandatory access controls.
References:
Bromium. "vSentry." vSentry I Bromium. https://www.bromium.com/ node/ 147.html (accessed January 26th,
20 l7).
Bromium copyrighted image taken from: https://www.bromiurn.com/

144

© 2017 Erik Van Buggenhout & Stephen Sims

Polyverse

Polyverse is a lesser known vendor offering unique security solutions.

Binary scrambling is used to make unique versions ofan application.
· In theory, if a vulnerability exists, each time the binary is scrambled it would prevent exploitation as the conditions have changed

A feature described as "self-healing" is provided, reverting the protected application back to a good state every few seconds.

Additional features allow certain types of data stores to be split into

thousands of encrypted containers.

.,

:-OLYVERSE

SAN~

Polyverse Another contender in the space of vendors such as Bromium is Polyversc. There is not too much publicly available information about the internal technology oftheir product; however, unique features include the concept of binary scrambling and "self-healing." You may be fami liar with the idea ofpolymorphic malware. This is malware that attempts to evade detection by constantly changing so that signatures go unmatched. Binary scrambling takes advantage in a similar fashion in that the binary is changed from its original state. Ifyou are familiar with assembly code you know that there are many ways for instructions to achieve the desired result.

Let's say we want the x64 RAX processor register to hold a value of0x40. In assembly, we have several ways to accomplish this goal. The following is a simple example:

e.g. I xor rax, rax mov al, 0x40

# Zero out the RAX register # Move 0x40 into the lower byte ofthe RAX register (al stand for accumulator low)

e.g. 2 mov rax, 0xffffffc0 neg rax 0x40

# Move 0xffffffc0 into the RAX register # Compute the two's complement ofthe value stored in the RAX register, resulting in

Another feature offered by Polyversc is what they describe as "s1.:lf-healing." This is simply the application reverting back to a known good state every few minutes. Additional advanced features offer the splitting ofa data store such as a database into thousands ofencrypted containers. This is al I definitely a technology to keep an eye on.

References: Polyverse. "Disrupting hackonomics." Polyverse Technology. https://polyverse.io/technology/ (January 26th, 2017).

Polyverse copyrighted image taken from https://polyverse.io/

© 2017 Erik Van Buggenhout & Stephen Sims

145

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Averting Payload Delivery · Day 3= Preventing
Exploitation · Day 4: Avoiding Installation,
Foiling Command & Control, & Thwarting Lateral Movement · Day 5: Ex:filtration, Cyber Deception & Incident Response · Day 6: APT Defender Capstone
SAN~

SEC599.3
Securing the Network Network Access Control & 802.1 X
Securing Software Software Development Lifecycle (SOL) & Threat Modeling Vulnerability Assessments Exercise: Authenticated Scans Using Nessus Patch Management Exploit Mitigation Techniques Exercise: Exploit Mitigation Using Compile-Time Controls Exploit Mitigation Techniques - Exploit Guard, EMET, & Others
· Exercise: Exploit Mitigation Using EMET & MalwareBytes Securing Endpoints OS Hardening & Best Practices Endpoint Protection Solutions Application Whitelisting to Stop Payload Execution Exercise: Configuring Applocker

This page intentionally left blank.

146

© 2017 Erik Van Buggenhout & Stephen Sims

Exercise - Exploit Mitigation using EMET & MalwareBytes

,-

IThe objective of the exercise is to analyze how exploits can be mitigated in using EMIT. We will insta.11 a vulnerable application (lceCast) that can be exploited by publicly available tools.

High-level exercise steps: 1. Install a vulnerable application (IceCast) 2. Exploit the vulnerable application using Metasploit 3. Install & configure EMET 4. Re-attempt exploitation

Exercise - Exploit Mitigation using EMET & MalwareBytes The objective of the exercise is to analyze how exploits can be mitigated in using EMET & MalwareBytes. We will also assess the risks of using EMET, as we will see how it can break an unsupported application.
The high-level steps ofthe exercise include:
· As a first step, we will install a vulnerable software called "lcecast" to demonstrate an exploitable piece of software; We will exploit the vulnerable software using Metasploit;
· We will then install & configure EMET to protect our system; · We will re-attempt exploitation, thereby illustrating how the attack is now blocked;

© 2017 Erik Van Buggenhout & Stephen Sims

147

Exercise - Hands-on Exploit Mitigation - Conclusion
During the exercise, we used different ways of mitigating exploitation, even if a given application is vulnerable. Depending on your environment, any ofthese techniques could be beneficial, while a lot of them could already be implemented in your base OS.
As with many security issues, this is a cat-and-mouse game, and adversaries are increasing their efforts to overcome these exploit mitigation techniques, so we should not only rely on them to prevent exploitation!

~ e,a~.s.
E1-'ET dtt«~ Cale, "":)Qato'> and wt do<.., it,~ -aban: fottlox.ex~
SAN~

MatwarP·vres

Exercise - Hands-on Exploit Mitigation - Conclusion During the exercise, we used different ways of mitigating exploitation, even ifa given application is vulnerable . Depending on your environment, any of these techniques could be beneficial, while a lot of them could already be implemented in your base OS.
It's important to note, that, as with many security issues, this is a cat-and-mouse game, and adversaries are increasing their efforts to overcome these exploit mitigation techniques, so we should not only rely on them to prevent exploitation!
For us defenders, it' s a powerful plus to have an in-depth understanding of how current exploit mitigation techniques work, so we can make the right decisions on what type of protection measures we are to implement in what environment.

148

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Averting Payload Delivery
· Day 3: Preventing Exploitation
· Day 4: Avoiding Installation, Foiling Command &Control, & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception &Incident Response
· Day 6: APT Defender Capstone

SEC599.3
Securing the Network
Network Access Control & 802.1 X
Securing Software Software Development Lifecycle (SOL) & Threat Modeling
Vulnerability Assessments Exercise: Authenticated Scans Using Nessus Patch Management Exploit Mitigation Techniques Exercise: Exploit Mitigation Using Compile-Time Controls Exploit Mitigation Techniques - Exploit Guard, EMET, & Ochers
· Exercise: Exploit Mitigation Using EMET & MalwareBytes Securing Endpoints OS Hardening & Best Practices Endpoint Protection Solutions Application Whitelisting co Stop Payload Execution Exercise: Configuring Applocker

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

149

OS Hardening & Best Practices
IOS hardening consists of configuring the operating system and installed programs to reduce the attack surface.
IWe reduce the attack surface by disabling options and removing features (change default passwords, uninstall / disable unused software...)
IOS hardening does not include the installation of security software, like a host-based firewall.
SANS
OS Hardening & Best Practices When we talk about OS hardening, we mean configuration ofthe operating system and installed applications. The practice ofOS hardening does not involve the installation of additional security software, like a hostbased firewall.
The operating systems we use in our enterprises (like Windows, Linux ...) are general purpose operating systems. Such operating systems have many features to satisfy the needs ofa wide variety of users. This implies that in our enterprise, many features are activated but not used.
The problem with active features is that they can be attacked. These features create a larger attack surface of our systems, and disabling or removing features reduces the attack surface.
Very old versions of Windows server operating systems used to install all features by default. For example, installing a Windows server with the default options would automatically install a web server and FTP server (11S). Even ifthis web server and ftp server were never used, they were active and responded to queries over the network, making the server more vuJnerable lo attacks. Nowadays, installation of Windows has changed: most features have to be activated explicitly.
OS and application hardening not only covers options and features to reduce the attack surface but a lso covers configuration ofservices to remove unauthenticated access and default credentials.

150

© 2017 Erik Van Buggenhout & Stephen Sims

OS Hardening Considerations
Ell OS hardening is performed on different types of devices: workstations and servers, but also smartphones and tablets, network devices.VOiP devices...
EEII Different operating systems need to be considered for hardening: Windows, Linux, OSX, iOS,Android...
l!JI Various checklists and tools are available detailing what configuration changes to make to harden an operating system or application.
OS Hardening Considerations OS and application hardening is not limited to computers. It should be clear that we have to harden desktops, laptops, and servers. But these are not the only devices in our enterprise network that constitute our exposed attack surface. We also have network devices, like switches, routers, wireless access points. Enterprise network devices have various options that can be configured and must be considered for hardening. Other network connected devices are VOiP phones and network printers/scanners. These are commodity appliances that are often forgotten when it comes to security. VOiP phones and networked printers are often configured open so that they can serve as many clients as possible. But this enlarges the attack surface and should be reduced by hardening. As an example ofa large attack surface, we want to mention that network printers often have an ftp server to facilitate printing ofuploaded documents, and that such ftp servers have been used as pivot points in attacks. Smart devices like smartphones and tablets should also be included in an OS hardening program. OS hardening is not limited to Windows. Other operating systems also have feanires and options that dictate the attack surface, and that can be reduced by d isabling features and options. Linux and OSX should be hardened for workstations, but operating systems for smart devices like iOS and Android should not be left out of the picture.

© 2017 Erik Van Buggenhout & Stephen Sims

151

NIST Checklist
The National Institute of Standards and Technology (NIST) publishes checklists that can be used to harden operating systems and applications:
· These security checklists are published in the National Checklist Program Repository
· The checklists are available in various formats, varying from text for humans to a formalized format for programs
· Security Content Automation Protocol (SCAP) is a formalized format

NIST Checklist One of the most known providers ofsecurity checklists to harden operating systems and applications is the US National Institute ofStandards and Technology: NIST.
This organization has a long tradition of publishing recommendations to configure operating system and applications, to make them harder to attack. This started with detailed instructions written in a guide that system administrators would read and apply to their system. To get an idea ofthe level of detail, such guides would mention registry keys and values to be configured in Windows.
The security checklists are stored in the repository of the National Checklist Program, which can be accessed by going to https://checklists.nist.gov.
Providing guides written for humans was a good starting point, but due to the amount oftechnical detail in these guides, applying the recommendations to an operating system involved a lot of work that was errorprone. Scaling was another problem: applying the recommendations ofa NJST checklist to a corporate network involved thousands of machines .
That is why NIST evolved its checklist repository to include formats that support automation: checklists can be downloaded in a machine-readable form, that can be applied by configuration appJjcations to harden operating systems and applications.
The Security Content Automation Protocol (SCAP) is a format designed to automate vulnerability assessment and management. The NIST security checklists are available in SCAP format so that they can be used for automatic processing.
Checklists can be used to check the configuration ofa system, and to change the configuration according to the recommendations of the checkIist.

152

© 2017 Erik Van Buggenhout & Stephen Sims

NIST's Re po sitory

Nvo

Computer Security Resource Center
National Vufncrob1hty O:itaba~

NlSI"'
1' 1! <I I l"~I lu'e ,·
~,,.--.::..,,1, .,.1 r~·,,, ..,._,

fl C-,..,~ .. II · r<lt .,., .. ....:,_\, ,l!lat,·,M_. . . .. J, P·,,1.,,_·'I. ·

~,,, · 1 ~'-"'!\'~'

0 ·"' · ti·····~"· Q."'.,...1-c" ·

National Checklist Program Repository
Visiting https:1/checkhsts.nist.gov brings us to a website where we can ·· download security checklists for different operating systems and
applications m different formats

---lion OI
l'SCAP).SCAP.,.,_ ..~~
·,fqnnCQR~o, N ~ OI'

- ....

......... a Z J 4 !, I 1 · 11 , q,

NIST's Repository The security checklist repository ofN 1ST can be accessed by visiting https://checklists.nist.gov.
As can be seen above, this will direct us to a website that enables us to specify the checklists we look for.
We select Target Product "Windows IO" as an example. By clicking on the search button, we get 4 results.
The first result is "Windows 10 STTG" produced by the Defense Information Systems Agency.
STIG stands for Security Technical Implementation Guide. It covers Windows IO systems member of a domain and, therefore, covers Windows IO Enterprise.
It supports the SCAP format, and also OVAL. This is an XML format meant for machine consumption, but it can also be rendered in human-readable form, although with a bit of practice, information can be obtained from its raw form. For example, this:
<criteria operator-"AND"> <criterion test_ ref="oval:mil.disa.fso.windows:tst:388900" comment="Verifies Telnet Client feature is
not installed" /> </criteria>
With this XML chunk, we know that one ofthe checks is for the presence ofTelnet. Telnet is a cleartext,
unauthenticated remote access service, and should never be used.

© 2017 Erik Van Buggenhout & Stephen Sims

153

Lynis

A popular tool is Lynis (by CISOFY):
· Hardening for Linux systems & other Unix derivatives like OSX, FreeBSD ...

( +J Uaer:1. Gr oupa 6.nd .lut.hent 1c.at1or1.
- seuc~ acbouuatr·tor M:"count:w . · · - CMc~11\l1 Ull># ···
· Cbeck 1n9 ebkgrp t.001 ... · Con.s1at'!ney checX /e-tc/oto\ap t1 le... - Tesc group t1lea {OtS)C)r;:) , . · - Ch~C'~ln.g loq.1n ~helJ:s · . · - C~Ckl nQ nOh UJUque 9TOUp lt)'S , ·· - C'heeit1nq non u.n1que group ne.ea · .. - CheeJt1r4 LDJ.P out.Mnt1ceiit100 support - (b~e): /~tc/&udoen, Ille
[ Pees, [Dn'!R) to cont. 1nue, or (CTRLJ +c to stop )

· Free, open source

· Created by Michael Boelen

· Audit tool, scans computers for security settings

[ o~ l
I OK l ( roUND l I OK l I O>: l
r vm,:'. J
( OK l ( OK l ( NOT ENU~ED J
( NOT r OUN0 l

Lynis Besides N IST's security checklists, other methods are available to harden operating systems.
A popular tool for hardening Linux systems is Lynis. It is an open source tool (GPLv3 license) developed by Michael Boelen.
Lynis is an auditing tool, that will scan Linux computers for various security settings. These include the following (non-exhaustive list):
· Kernel settings · Authentication settings · installed daemons
installed applications · Logging
It will also check the system for security issues and misconfigurations that can lead to compromise.
Lynis is also available for Unix-like operating systems like OSX, FreeBSD...
C ISOFY also sells an enterprise version of Lynis with more scanning features and capabilities (like support for more than IO clients).

154

© 2017 Erik Van Buggenhout & Stephen Sims

Microsoft Recommended Security Baseline

Microsoft also publishes Recommended Security Baselines:

I Mlc;rosott Te<l>Net V
Solution Accelerators

· These can be checked and applied with the Security Compliance Manager
· It is a free tool available for download from Microsoft

Security Compliance Manager (SCM)
N~.t'Vflf-ott4 0 oft.hr ~ ( o m p l l l f t ( : 4 ~ CSOC)taol ft,-1N,1..u.t:,,l,t Jot ~·lft.a,d6it~ 10 .._.., futlifri ft-OMV. Of'~J. v.tf'itOII. S(M4.0 Dltn, ~ tor......., 20.l-'td $,cnotf ?016 ti.1(:l-n«11. AMI N'f bet.1Clrol ~ " 'f'Ckl 10q~c.~·Mllll~ ·COff\CM~ 1114 'fOllf' ~ I · tfo<Jd~Inf Ctouo ~ - Jll..mnoh Syuem Cf.~C..,W,....-»Kl'l loNfn SCW. 4,0 ~ f teadT~to-ct.~ ~ l:lilMd _,. lh(ro,olt $t(v--t,, ~ fK-O!Wnlndil~ .at.Id ~SUV kM llfktl(.tt.. .&~'fWIO Hl.fr!N.Mp~1.UOtl cttift.M\d.W,1.u C ~ I I U ~ M e l ' t i fot ~ OIClefflltlf 1¥11~ ai"II.M.mnofl ~

· The tool is template-based

· The policies are based on Microsoft Security Guides

Microsoft Recommended Security Baseline Another source for guidelines to harden Microsoft Windows is Microsoft itself.
Microsoft publishes recommended security baselines and security guides.
These baselines can be automatically checked and applied with tools offered by Microsoft. One of these tools is the Security Compliance Manager.
The SCM is a free tool from Microsoft. It is not part ofa default Windows install but needs to be downloaded and installed.
SCM 4.0 supports the latest Windows versions (Server 2016 and Windows I0).
The tool not only allows managing Microsoft produced security baselines, but these can be modified to better suit your enterprise's environment. New templates can be created too, for custom configurations.
SCM can be used to deploy configurations to stand-alone machine too: machines that are not members ofa domain.
Baselines can be exported to Microsoft supported formats like GPO policies, but also open fonnats like SCAP used by NIST, so that Microsoft Security Baseline:; cc1n also be converted SCAP and audited with SCAP tools.

© 2017 Erik Van Buggenhout & Stephen Sims

155

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Averting Payload Delivery · Day 3: Preventing
Exploitation
· Day 4: Avoiding Installation, Foiling Command & Control, & Thwarting Lateral Movement
· Day 5: Ex.filtration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

Securing the Network

Network Access Control & 802.1 X

Securing Software

Software Development Ufecycle (SOL) & Threat Modeling

Vulnerability Assessments

Exercise: Authenticated Scans Using Nessus

Patch Management

Exploit Mitigation Techniques

Exercise: Exploit Mitigation Using Compile-Time Controls

Exploit Mitigation Techniques - Exploit Guard, EMET, & Others

Exercise: Exploit Mitigation Using EMET & MalwareBytes Securing Endpoints

OS Hardening & Best Practices

·

Endpoint Protection Solutions Application Whitelisting to Stop Payload Execution

Exercise: Configuring Applocker

This page intentionally left blank.

156

© 2017 Erik Van Buggenhout & Stephen Sims

Endpoint Protection Solutions (I)
Endpoints are computer devices connected to the corporate network, like:
· Desktop computers · Servers · Laptops · Smartphones ·
There are a lot of endpoint protection solutions on the market, many with widely different, but often also with overlapping, features.
Endpoint Protection Solutions (1) An endpoint is a computer device that is a " network endpo int" on the corporate network: computer devices like desktop computers, laptops, smartphones, tablets... As these devices are interesting to attackers to try to enter the corporate network, endpoint protection solutions have been developed. An endpoint protection solution is software running on the device to detect and prevent intrusions. Many vendors offer endpoint protection solutions, and the features they provide can vary widely.
We will use the term " features" because they can be stand-a lone products or combined into one product.

© 2017 Erik Van Buggenhout & Stephen Sims

157

Endpoint Protection Solutions (2)
I l l Antivirus software is one of the most traditionally used endpoint protection solutions, which are widely used in corporate environments. Traditionally signature-based, detection techniques are moving more and more towards behavioral techniques.
· 1 Host-based firewalls will operate at the network level and attempt to deny outbound / incoming traffic to and from the host machine based on a specific set of rules. Host-based firewalls are typically built into the OS (PF. IpTables.Windows Firewall. ..)
B l Host intrusion detection systems (HIDS) are aimed at detecting typical malware behavior on systems. Examples include the changing of critical system files, addition of services, addition of user accounts,... A typical HIDS is OSSEC.
I l l Endpoint Detection & Response software (EDR) is the "new kid" on the block. The focus is shifted to also include incident response (e.g. acquiring memory or a disk image). Examples include Carbon Black, SentinelOne, FireEye HX, GRR...
SANS
Endpoint Protection Solutions (2) Different types ofendpoint protection solutions exist, which often use an agent that is deployed on the endpoints. We use the following categories:
· Antivirus software is one of the most traditionally used endpoint protection solutions, which are widely used in corporate environments. Traditionally signature-based, detection techniques are moving more and more towards heuristic techniques.
· Host-based firewalls will operate at the network level and attempt to deny outbound / incoming traffic to and from the host machine based on a specific set of rules. Host-based firewalls are typically built into the OS (PF, lpTables, Windows Firewall. ..)
· Host intrusion detection systems (HIDS) are aimed at detecting typical malware behavior on systems. Examples include the changing of critical system files, addition of services, addition of user accounts... A typical HIDS (so focused on detection) is OSSEC, although using OSSEC's "active response" feature, it can also be used to actively react to detected issues.
· Endpoint Detection & Response software (EDR) is the "new kid" on the block. It's an "evolution" of HIPS also allowing active "response" to security issues (e.g. acquisition of a disk drive). Examples include Carbon Black, SentinelOne, FireEye HX, ORR...
It's important to note that this "abundance" of agents is leading to something the author likes to call "agent fatigue": organizations (& employees!) are reluctant to install 4 different agents for "security purposes". It's thus important to look for an "all-in-one" solution that can handle the different functions described above in one agent.

158

© 2017 Erik Van Buggenhout & Stephen Sims

Antivirus (or anti-malware) is software installed on endpoints, designed to:
· Detect malicious files · Prevent malicious code from executing · Remove or clean malicious files
· Removed or cleaned files can be put in quarantine: a safe place to store malware, from where it can be retrieved for further analysis or in case of a false positive
It does this by inspecting (in real-time or scheduled):
· Files, disks ... · Network traffic · Input to script engines
SANS

Antivirus Antivirus, sometimes referred to as anti-malware, is software that is running on endpoints. Its goal is to detect malware and to prevent malicious code to execute.
Malware can be executable files (PE files), scripts, documents with scripts or documents with exploits and shellcode. Antivirus is mainly designed to detect malware in files.
When antivirus detects malware in a file, it will block access to the file so that it cannot be opened for execution: the malicious code is prevented from executing . Besides blocking access to the file, antivirus w ill often remove or clean the file. Cleaning the files involves removal of malicious code: For example, with a virus that infects existing executables by appending the viral code to the end of the file, antivirus will clean the executable by removing the appended viral code and restoring the fi le to its original version.
As false positives can occur (antivirus wrongly identifies a benign file as malware), removed files and cleaned files are often quarantined: they are put in a safe place (a folder with encoded files) so that they can be restored later, should the detection tum out to be a false positive. Quarantined files are also useful for malware analysis.
Antivirus can do detection in real-time (on access scanning) or scheduled (on-demand scanning). On-access scanning means that files are scanned every time they are read or written. It is a good policy to have both on access scanning enabled and on-demand scanning scheduled (for example once a week outside working hours): this way, malware that was missed by on access scanning (for example because there were no signatures avai lable to detect it) can get caught by on-demand scanning (with updated signatures).
Antivirus will scan files and disks, but a lot ofantivirus products can also scan network traffic. There are even products that can scan the decoded content ofTLS traffic by terminating this traffic with their own certificates.
On Windows, antivirus can also insert component to scan the input to script engines like VBScript and JScript.

© 2017 Erik Van Buggenhout & Stephen Sims

159

The first antivirus solutions were purely based on signatures; they searched for specific byte-sequences in files to identify malware.
Today, antivirus solutions use many methods to detect malware:
· Heuristics · Observing behavior of running programs ("HIPS-like" behavior) · Emulating potentially malicious files · Crowd-sourced signatures
Antivirus also detects "potentially unwanted programs", like adware and hacker tools.
SANS

Antivirus Detection Methods The very first antivirus programs were purely based on signatures: the searched through the content of files for specific byte sequences and identified files with these sequences as viruses. For example, a file is detected as the Stoned Virus by ClamAV antivirus if it contains the following bytes: 07 00 BA 80 00 CD 13 EB 49 90 B9 03 00 BA 00 0 I
Such signatures (and more complex types of signatures, with wildcards and regular expressions) need to be developed by the antivirus company and distributed to their clients. Signature database updates occur severa l times per day, due to the massive amount ofmalware in the wild. Signature-based detection offers good perfonnance (it does not consume many computer resources), but it is reactive: only existing malware (or simple variants) can be detected with sig natures.
That is why many alternative detection methods are implemented in modem antivirus programs: · Heuristics: heuristics are simple rules-of-thumb. For example, an executables (PE file) is considered malware if it imports the Windows API calls to open processes, write to their memory and start executing code. · Behavior observation: block a running program when it tries to execute a prohibited action. This is what we typically call "I IIPS-like" behavior, as the AV engine will now act as a sort of Host-Based Intrusion Prevention e ngine. · Emulation: before an executable is executed by the Windows operating system, the antivirus will emulate the execution ofthe file with its internal emulation engine, and observe its behavior. Based on this (emulated) behavior, the file is classified as malware or benign. As emulation takes many resources and time, a complete execution is not emulated, only the beginning · Antivirus prog rams also exist in cloud-based versions: they have their signature database "in the cloud", and new signatures are automatically generated from client detections and shared via the cloud to all clients
Remark that antivirus not only classifies files as malicious or benign, but many also have a category called "potentially unwanted programs". These programs are not really malicious, but neither completely benign. "Hacker" tools fall into this category, like Metasploit and Nmap. Antivirus can help us detect advanced adversaries when they deploy such tools during lateral movement.

160

© 2017 Erik Van Buggenhout & Stephen Sims

The number of antivirus solutions on the market is almost countless. Detection rates are only one element to consider when selecting an AV, manageability is also important for enterprises. There are only a few solutions that are appropriate for (very) large corporations:
· These solutions offer centralized management and alerting that is scalable · Cloud based management can be a solution
Providing clear alerts to the end-user is important!
SANS
Antivirus Selection The number ofantivirus programs is staggering. VirusTotal "only" hosts 60+ different antivirus programs. This makes it hard to select the right antivirus solution for your enterprise.
There are specialized organizations and publications that will evaluate antivirus solutions on their detection rates. Simply put: how many files to they detect while scanning a set of malicious files? Many home users and companies make their choice based on these studies: they go for the antivirus with the best detection rates. But for enterprises, that produces often a sub-optimal solution. First of all, higher detection rates imply higher false positive rates. A false positive can be disruptive to the production environment ofan enterprise (for example when a critical component of Windows is flagged as malicious, as has happened in the past with certain antivirus programs). Secondly, other criteria are important for an enterprise: Like, manageability and ease of integration.
For very large enterprises, there are actually not many appropriate antivirus solutions. When it comes to protecting hundreds ofthousands of endpoints, many antivirus solutions cannot scale: centralized management fails, alerting is not reliable ...
From a user awareness point of view, it is important to select an antivirus solution that provides clear alerts to the end-user (if possible tailored alerts). Centralized alerting is important for the SOC but end users must also be made aware of a malware detection on their endpoint so that they can change their behavior and take appropriate action.

© 2017 Erik Van Buggenhout & Stephen S ims

161

Antivirus requires configuration. It can be configured to:
· Configure real-time protection mode; · Schedule scans; · What type of files to scan; · Configure exceptions of what not to scan;
·
Antivirus typically cannot be further adapted to include custommade signatures, which could be useful during incident response. There is however an exception to the rule: ClamAV supports YARA rules!
SANS
Antivirus Configuration Antivirus is an endpoint protection solution that can be deployed with default configurations, but often, for optimal performance and protection, the configuration needs to be tuned.
Depending on the performance impact on the endpoint, the antivirus might be configured to scan a set of files and not all files. For example, on a database server, we could exclude the database files from antivirus scanning.
On-access scan is highly recommended, but on-demand scan (scheduled scanning) should also be configured. Scheduled scanning means that at regular intervals, the complete disk ofa machine will be scanned. This scheduled scan is best preceded by a signature database update so that the latest signatures are used. A scheduled scan can detect malware that was missed by on access scans.
Antivirus can also be configured for the actions it has to take when malware is detected: · Produced a centralized alert for the Security Operation Center · Warn the end-user · Delete the file · Clean the file · Quarantine the fi le
During incidents, it would be very useful for incident responders to be able to run schedu led scans with custom-made signatures. Unfortunately, this type ofconfiguration is often not possible with antivirus products. They signature database have a proprietary and protected format and are not open. Sometimes, (paid) assistance from the antivirus vendor is available to create and deploy custom signatures.

162

© 2017 Erik Van Buggenhout & Stephen Sims

,----
For endpoints, we talk about host-based firewalls:
· It is software running on the endpoint · It is not networking hardware
A host-based firewall inspects all network traffic directed towards the endpoint and originating from the endpoint. Based on the results of this inspection, the firewall will take action: basically, it allows or drops packets. Inspection of network traffic is often governed by rules.
SANS
Firewalls When we talk about fi rewalls on endpoints, we mean host-based firewalls. Not hardware in or before the endpoint, but software deployed on the endpoint operating system.
Like a hardware firewall, a host-based firewall inspects network traffic and can block network traffic (drop packets). It looks at all ingress and egress traffic ofthe endpoint, and contrary to a hardware firewa ll, it can also link network activity to specific programs running on the operating system.
For example, a host-based firewall will not only be able to inspect SMTP traffic (TCP connections to port 25) but also link it to the Outlook process.
Network traffic will be allowed or blocked when coming into the endpoint or when leaving the endpoint, based on the result ofthe network traffic inspection. Inspecting network traffic is often done with rules. Firewalls come with a set of predefined rules and can be extended with new rules. For example, a firewall can come with rules that block all SMTP traffic, except when it originates from the Outlook program. This rule is an example of a rule that is often used to combat SPAM-sending malware.
A host-based firewall can also block all incoming traffic when the endpoint is connected to an untrusted network, like public Wi-Fi. Technically speaking, all incoming SYN packets will be dropped, preventing access to open ports on the operating system.

© 2017 Erik Van Buggenhout & Stephen Sims

163

Windows includes a built-in firewall. Introduced with Windows Vista, the Windows Filtering Platform is used to provide firewall functionality. The Windows firewall uses the Windows Filtering Platform. Many vendors offer a firewall for Windows:
· When such a firewall is installed, the built-in Windows firewall is disabled · Some of these solutions do not install their own firewall engine but use the
Windows Filtering Platform
The Windows firewall comes with many predefined rules; the creation of custom rules is supported.
Windows Firewall The Windows operating system comes with a built-in host-based firewall. Microsoft started to include a firewall with Windows XP SP2, because ofthe frequent, worldwide incidents with worms (malware that replicates automatically between hosts over a network, like the Internet). This was meant as mitigation, but was not an ideal technical solution, because it was not designed from the start.
With Windows Vista, Microsoft engineers redesigned the network stack and included features for firewalls in their design. The Windows firewall introduced with Windows Vista is a new product, and it uses the new Windows Filtering Platform. This allows for a host-based firewall that is properly integrated into the Windows operating system.
There are other solutions on the market than the built-in Windows firewall. Several vendors developed their own host-based firewall products: when this solution is installed on an endpoint, the built-in Windows firewall is disabled, and its functions are taken over and extended by the installed firewall solution.
Not all third-party solutions have developed their own firewall engine. Some of these solutions don ' t install their own firewall engine but use the Windows Filtering Platform. They replace the existing Windows firewall user interface with their own interface and supplement the platform with extended features.
The built-in Windows firewall is rule-based, and comes with many predefined rules. The creation of custom rules is also supported, as we will see in the next slides.

164

© 2017 Erik Van Buggenhout & Stephen Sims

Windows Firewall Rules

·a-..-_----- I tlw_,,_,..,_.....,,.._,,
+'""·"""'"~""l!"ll""

IQ°"""""1d." ~ s.,.,,y......

~

- -....'6,. . . . _ _ _ _,,.._ _

o-.a... Profile rJ Wnte,,n"'"II·'"
(S) Hio.nf~Ndoot'IQlffWll.Cl\aMt. .bb;t..ed
~ ~~hl4'>n;C#llld,e~.......

Pnv... ProfM

(J. 'Wftdow,~.(11'\

$ lrciou,i,d~.... doNl!N&dl e W·broc:Md

w--·. """*"°' 0 ~~

tMkh·....," ~

Pubtt<: Ptofilei d Ac:iive
~

~ 'roMid~MdonotfllCt! · f\J." t;oo.,..S

- - - ~ - - - - - - 0 ~~1Ntoona11Ntd\eWnalowtd

I SANS

Firewall pr ofiles
The Windows firewall can be configured by creating rules.
It has different profiles, depending on the network connection. For example, there is a Domain profile that is active when the machine is connected to the corporate network, and a Public Profile when the machine is connected to non-corporate networks like public Wi-Fi.
Rules can be applied differently depending on the profile

Windows Firewall Rules Using the configuration tool "Windows Firewall with Advanced Security", it is possible to view and manage the existing rules and to create new rules.
This tool groups rules in inbound rules and outbound rules. Rules (pre-defined and custom) can be enabled or disabled on a rule-per-rule basis.
The Windows firewall uses different profiles, depending on the type of network connection: · Domain profile: This profile is active when the Windows machine is connected to the corporate network with domain controllers · Private profile: This profile is active when the Windows machine is connected to a non-corporate, private network: For example, the user's home network · Public profile: This profile is active when the Windows machine is connected to a non-corporate, public network: For example, public Wi-Fi
Rules can also be activated per profile. The domain network is considered as trusted, and fewer rules are activated for this profile than for less trusted networks like private networks and hostile networks like public Wi-Fi.
By default, profiles have: · Default deny for all inbound connections: inbound connections that do not match a rule are blocked · Default allow for all outbound connections: outbound connections that do not match a rule are allowed

© 2017 Erik Van Buggenhout & Stephen Sims

165

Windows Firewall Rule Creation

Rule creation

Creating a Windows Firewall rule to block a program from starting outgoing network connections can be done in 5 steps.

o.-.....

o _,,__,
1lan::i.,&,t ~ N n ~,...FMic:"'··.,._..,,..
_.......

·

....... _.. __...__ o-...,.;.,.py1oo1_._«·-""'Vlffl1

, O M--

.,._""'

~

-

__ii:! ,,

·

~-..~ - ~ -.......,.....locecr,-..c,,-·~

&'! ,._ oliA-.111'1W1·~· ~-·P&,..,,..__~

·

SANS

Windows Firewall Rule Creation In this example, we create an outbound firewall rule to prevent Word from accessing the network. This rule will prevent malicious Word documents from downloading their payload from the lntemet, as tbis requires the Word process to initiate TCP connections. It will not prevent Word from accessing network shares, as the necessary network connections to access network shares are performed by the Windows operating system and not the Word process.
First, we need to decide which type of rule to create: we create a rule for a particular program.
In the second d ialog, we select the Word program: winword.exe
In the third dialog, we can select the action: allow the connection or block the connection. Ln this example, we want to block the connection.
For the fourth step, we select the profiles for which this rule will be activated: we want to block Word from connecting to the network in all cases, so we select all profiles.
Finally, we name the rule and can add a comment.

166

© 2017 Erik Van Buggenhout & Stephen Sims

Windows Firewall Rule Properties
Rule pro pe rt ies
Rules have more properties than the ones we saw in the previous rule creation example. This properties allow us to finetune the rule.

-· -~ ~ - - , . . .,,....._,,_. ___...... c w , ~ ~ . . ,. . . . . . . . . . ~

, t .tM.I.I...,..~ ...

-

Windows Firewall Rule Properties
Rules have more properties than the ones we saw in the previous rule creation example. lfwe open the rule, we will see more tabs with properties than the dialogs we filled out with the wizard.
We can further specify conditions for a rule, allowing us to further refine the rule.
The example above shows the Remote Computers tab: with this tab, we can add exceptions to our rule: we can specify computers to which Word would be allowed to connect, despite our blocking rule. This comes in handy ifwe have valid business reasons to allow Word to connect to internal machines; for example, a database server from which information has to be retrieved to create monthly reports with Word macros.

© 2017 Erik Van Buggenhout & Stephen Sims

167

A Host Intrusion Detection System is not the same as a (Network) Intrusion Detection System.
A HIDS observes programs and their behavior on a system and attempts to detect (& sometimes partially prevent) suspicious activity.
Typical behavior a HIDS looks for includes:
· Creation of new processes by programs; · Addition of user accounts; · Code injection in existing processes; · Creation of autorun registry keys
·

Host Intrusion Detection System (HIDS) A host intrusion detection system is not network-based, it is, in fact, a very different thing. Unlike a classic (network) IDS, it typically runs as an agent deployed on the endpoints and inspects processes (running programs), file system activity, memory...
A HIDS inspects processes and their behavior when interacting with system resources and other processes, and it can detect / trigger on certain actions by these processes if they exhibit malicious intent. Some typical actions a HIDS will typically look out for include:
· A process starting a new program · A process accessing the memory ofanother process · Installation ofdrivers · Termination of processes · Injection of code · Creation ofautorun registry keys (to achieve persistence)
This rule cannot be applied indiscriminately because many legitimate programs perform these actions as well (e.g. EMET & AV engines typically rely on DLL injection as well). To handle these exceptions, HIDS vendors have different solutions. There are HIDS with extensively pre-defined rules, that form a sort of whitelist ofprocesses that are al lowed these types of behaviors.
There are also self-learning HIDS systems: when first installed on a system, they are placed in learning mode and just observe the behavior ofthe processes on the system. Everything that happens in learning mode is considered as normal, and will not be alerted upon when learning mode is switched of subsequently.

168

© 2017 Erik Van Buggenhout & Stephen Sims

~ OSSEC

¥ \n/AZUH

B l OSSEC is an open-source HID$ solution that supports a wide variety of OS families including Linux, Solaris, BSD,Windows, Mac and VMware ESX
IHIDS logs should be centrally collected and monitored. Wazuh is a free fork of OSSEC that includes some additional features and built-in ELK integration

SA~

HlDS Examples HIDS software can be very useful to supplement antivirus solutions: they can catch malware or unwanted software that antivirus engines would not block (or even detect) due to a lack of signatures. Advanced adversaries will often target their malware and customize it for your corporate environment so that signaturebased systems would not block it. HIDS solutions have a better chance of detecting "unknown" malware, as they focus strongly on analyzing the behavior ofthe system and detect malicious behavior.
An interesting example of a HIDS (so focused on detection) solution is OSSEC, which is an open-source software that supports a wide variety of OS families including Linux, Solaris, BSD, Windows, Mac and VMware ESX.
As with any security tool, it's a good strategy to centrally collect and monitor HIDS logs. Wazuh is a free fork of OSSEC that includes some additional features and built-in ELK integration. Due to their "behavioral" nature, it's beneficial to have experienced personnel review the HIDS logs for anomalies and possible incidents.

© 2017 Erik Van Buggenhout & Stephen Sims

169

Endpoint Detection & Response (EDR) Tools

Endpoint Detection and Response (EDR) is an upcoming technology. The term defines a category of tools and solutions that focus on detecting, analyzing and responding to suspicious activities and issues on hosts and endpoints.

EDR tools shift their focus to also include RESPONDING to potentially detected issues. This could for example include:

· Acquisition of a suspicious file · Acquisition of a memory dump · Overall, streamline IR process

· Acquisition of a disk image · Execution of an arbitrary command
·

Q SentinelOnc
SAN~

CARBON
BLACK
ARM YOUH NOPOfNTS

~
~~FireEye·

Endpoint Detection & Response (EDR) Tools E ndpoint Detection and Response (EDR) is an upcoming technology. The term defines a category oftools and solutions that focus on detecting, analyzing and responding to suspicious activities and issues on hosts and endpoints. EDR tools operate by monitoring endpoint and network events and centrally storing these logs & information to perform further analysis, reporting & response. As with most other endpoint solutions, a software agent installed on host systems is required to perform monitoring, response, and reporting.
The key difference between the previously mentioned endpoint solutions and EDR tools is that EDR tools shift their focus to also include RESPONDING to potentially detected issues. This could for example include
· Acquisition ofa single file (e.g. a malware sample for further analys is) · Acquisition ofa memory dump / hard disk image for further forensic analysis · Running arbitrary commands on the affected system;
Some examples of EDR tools include CarbonBlack, Sentine!One, ORR, FireEye HX ... Furthermore, many AV vendors are adding EDR-like functionality as an optional component to their AV engines.

170

© 2017 Erik Van Buggenhout & Stephen Sims

Endpoint Solutions - Thread Carefully
So, what type of endpoint solution should you opt for?
· Traditionally, AV's and firewalls have been the key components of endpointprotection
· HIDS systems can help detect malware based on its behavior · EDR tools are quickly gaining traction and can help you easily respond to
suspicious behavior
Thread carefully, as many employees & organizations suffer from "agent fatigue" and don't like installing additional agents on endpoints. There is a market trend to combine the different solutions in a single agent!
Endpoint Solutions - Th read Carefully So, what type ofendpoint solution should you opt for?
· Traditionally, Antivirus solutions and firewalls have been at the core of endpoint-protection solutions; · HIDS systems can be a useful supplement to detect malware / suspicious software based on its
behav io r ; · E DR tools are quickly gaining traction and can help you easily respond to suspicious behavior;
The selection of the type of solution wiII very much depend on the maturity of your organization:
· If you have no SOC (or any other team) that will analyze the logs, a HIDS system won't truly realize its potential in your environment;
· Likewise, if you are not ready to start doing incident response, you won't be able to fully leverage an EDR tool.
Tread carefully, as many employees & organization suffer from "agent fatigue" and don't like installing additional agents on endpoints. There is a market trend to combine the different solutions in a single agent!

© 2017 Erik Van Buggenhout & Stephen Sims

171

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Averting Payload Delivery
· Day 3: Preventing Exploitation
· Day 4: Avoiding Installation, Foiling Command & Control, & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

SEC599.3

Securing the Network

Network Access Control & 802.1 X

Securing Software

Software Development Lifecycle (SOL) & Threat Modeling

Vulnerability Assessments

Exercise: Authenticated Scans Using Nessus

Patch Management

Exploit Mitigation Techniques

Exercise: Exploit Mitigation Using Compile-Time Controls

Exploit Mitigation Techniques - Exploit Guard, EMET, & Others

Exercise: Exploit Mitigation Using EMET & MalwareBytes

Securing Endpoints

OS Hardening & Best Practices

Endpoint Protection Solutions

·

Application Whitelisting to Stop Payload Execution Exercise: Configuring Applocker

This page intentionally left blank.

172

© 2017 Erik Van Buggenhout & Stephen Sims

Application Whitelisting to Stop Payload Execution
General-purpose operating systems like Windows are designed to be flexible and execute a wide variety of applications. This provides malware authors with a large attack surface, as they can attempt to craft a variety of applications, binaries... and have them executed by unsuspecting end-users.
The traditional approach used by many of the previously discussed end-point solutions was to blacklist known malicious files
Application whitelisting relies on a different approach: explicitly only allowing certain executables, applications, binaries. .. to be opened!
SANS
Application Whitelisting to Stop Payload Execution General-purpose operating systems like Windows are designed to be flexible and execute a wide variety of applications. The flexibility of general-purpose computers and general purpose operating systems is an advantage for companies: the same type of computers and OS can be used to support many activities. This provides malware authors with a large attack surface, as they can attempt to craft a variety of applications, binaries... and have them executed by unsuspecting end-users.
Mobile devices are generally more restrictive: An example of an operating system that is considered not to be general purpose is Apple's iOS operating system, designed to run on iPhones and iPads. iOS does not support the execution ofall types of programs: besides programs developed by Apple, only applications (apps) are allowed to run on iOS. Apps are restricted in their interaction with OS resources.
The traditional approach used by many ofthe previously discussed end-point solutions was to blacklist known malicious files. As we've seen, however, this has proven to be ineffective due to the rapid speed at which new malware samples are appearing. Application whitelisting relies on a different approach: Explicitly only allowing certain executables, applications, binaries... to be opened!

© 2017 Erik Van Buggenhout & Stephen Sims

173

Application Whitelisting Mechanism
D I Originally, application whitelisting technology decided if a program is allowed to run or not based on an explicit, exhaustive, list of allowed or blocked programs. This is however difficult to manage / maintain.
M l Modern application whitelisting works with rules, that can identify programs based on criteria like file system location, publisher...

Action $ Allow $ Allow $ Allow

UwEve,yone Everyone
BUilTIN\Ad...

Name (Default Rule) All files located ,n the Prog~m Files folder (Default Rule) All files located in the Windows folder (Default Rule) All files

Condition Path Path Path

Excq)ttons

I =able Rules ...
Create New Ru... Automrtiully ... CreateOdault ...

Application Wbitelisting Mechanism Originally, application whitelisting technology decided if a program is allowed to run or not based on an explicit, exhaustive, list ofallowed or blocked programs. This is however difficult to manage / maintain.
Modem application whitelisting technology takes another approach: rules are used to decide ifa program is allowed to run or not. A rule uses criteria to identify to which programs it is applied. Criteria can be :
· File name or file path · Digital signature certificates · Hashes
Rules can be used to whitelist programs or blacklist programs. In a whitelisting approach, the convention is to block all programs except the ones explicitly allowed by rules. A blacklisting approach is the opposite: All programs are allowed except programs explicitly identified by rules.
In general, a whitelisting approach is preferred over a blacklisting approach, as blacklisting is more brittle: A single program that is not blacklisted can be used to compromise the system.

174

© 2017 Erik Van Buggenhout & Stephen Sims

Windows Application Whitelisting (I)

Modern variants of the Windows OS come with two application whitelisting technologies:
· Software Restriction Policies (as of Windows XP) · AppLocker (as of Windows 7 available in enterprise versions)

Commercial solutions for Windows are available too, some examples include:

AppSense Application Manager

~McAfee·
McAfee Application Control

Windows Application Whitelisting (1) To implement application whitelisting on Windows, we have essentially 2 choices: We can use built-in application whitelisting technology, or we can use third-party technology.
Windows has two application whitelisting technologies: Software Restriction Policies and AppLocker. AppLocker was introduced after Software Restriction Policies. Software Restriction Policies are an older application whitelisting technology that is still available on Windows. If you have the choice, we recommend using the modem AppLocker approach.
AppLocker is completely implemented in the Windows kernel, while Software Restriction Policies has components in the kernel and components in userland. Userland components are more prone to tampering.
Many software security companies offer application whitelisting technology too. As an example, we mention 2 third-party application whitelisting technologies: AppSense Application Manager and McAfee Application Control.
AppSense creates software to manage Citrix servers. AppSense Application Manager allows controlling which applications are executed and which are blocked on Citrix servers.
McAfee Application Control is an addition to McAfee's endpoint security solution: it's application whitelisting technology.
In general, third-party solutions offer more features and management options than Microsoft's solutions.

© 2017 Erik Van Buggenhout & Stephen S ims

175

Windows Application Whitelisting (2)
ISoftware Restriction Policies were introduced with Windows XP, and are still available on the latest Windows versions.
IApplocker was int~oduced _with Wi~dows 7, and is only available on "enterprise" versions ofWmdows.
ISoftware Restriction Policies and Applocker are controlled through local or active directory group policies.
Windows Application Whitelisting (2) Microsoft application whitelisting technologies come shipped with Windows, but depending on the Windows version, they can be unavailable. Software Restriction Policies were introduced with Windows XP. Although it is the older technology, replaced by AppLocker, it is still available on the most recent Windows versions like Windows 10. AppLocker was introduced with Windows 7. It can only be used on "enterprise" versions of Windows, and not on consumer versions of Windows. For example, on Windows I0, AppLocker is available with Windows I0 Enterprise, but not with Windows IO Pro. We refer to Microsoft for a list ofsupported versions. Software Restriction Policies and AppLocker are configured via group policies. This can be local group policies or active directory group policies. lt can be confusing that the group policies for SRP and AppLocker can be configured on aU versions of Windows, but do not apply on all versions of Windows. If AppLocker is not available, an event will be written to the AppLocker event logs mentioning that this Windows "SKU" (Stock-Keeping Unit) is not supported.

176

© 2017 Erik Van Buggenhout & Stephen Sims

Applocke r

...~~~VI ~ u w .

-- -.2---- ----- ------- .....

.........._

t.Ch ·' ,i? ti

?

--_,---,_ Applocker depends on theApplication Identify

......,.,,.. "'9""""
Piebi·M' ·II,,
............... (1., ... - -
,,._....,.,_

service.This se1·vice. disabled by default. must run

~-- - -- for Applocker to identify applications.

--~

'Q4"c"..",'."-'----· c_.o.,,.,,.,-,_....... -- - - - - --

~...........________ ...
0--,.. .- .... . . , _ ~ -
--------...

AppLocker As AppLocker is the more recent implementation of application whitelisting technology, we will start our examples with AppLocker.
But before we can start creating rules, AppLocker needs some configuration.
First of al l, AppLocker relies on a Windows service that is not running by default. The Application Identity service is a service that will support AppLocker identifying applications and decide what to block and allow.
If the Application Identity service is not running, AppLocker cannot identify applications and control execution.
We can start the service, and set its startup type to Automatic instead of Manual. In an enterprise, this is best done through active directory group policies. Remark that starting with Windows l 0, the Application Identity service is a "protected service" and its settings (like Startup Type) cannot be controlled via the service manager. It has to be done with group policies.

© 2017 Erik Van Buggenhout & Stephen Sims

177

Applocke r Settings

.. --- ~-- - ~··..·._.._.-.,,,..-..u----------------, · , ~ ~ - - . _ , 'U ·· ,, ~·· · ' ·· ·_-..-,_ - - _......,,__._....____ ·-- - - --·--~_-_-~ -__ ----- ............ __ -.....w-...,.,,..... ._......._,.,_,.,...,.."'4.._....,...,.......,.....,.........._... .....,.........

... ~
r.,-
·-

--

-·-- -

·-

~·<._...

X
Applocker categories
Applocker has 4 categories of rules:
· Executable rules · Windows Installer rules
Script rules Packaged app rules
These categories need to be enabled explicitly.

SA~
AppLocker Settings In these examples, we will use the local group policy editor. We decided this because the exercises will cover the active directory group policy editor.
In the local group policy editor, AppLocker policy settings can be found under Application Control Policies.
By default, no rules will be enforced by AppLocker. The AppLocker Properties group AppLocker rules by collections:
· Executable rules · Windows Installer rules · Script rules · Packaged app rules
The last category of rules (packaged apps) control apps, which were introduced with Windows 8.
Rules in a category are only appl ied if the category is enforced. By default, no categories are enforced. In our example, we will enforce Executable rules. Remark that this can cause problems on Windows 8 and later: apps will not be allowed to run (on Windows I0, calculator is an app).
Besides enforcing rules, it is also possible to audit rules. This is useful to test a configuration: rules are applied but they are not enforced, thus applications are allowed to run. But an entry in the event log will mark what rules applied. This allows us to test our rules without running the risk of locking us out of our machine: if we make rules that are too restrictive, we can no longer run applications required to manage our machine, and we lose control over it.

178

© 2017 Erik Van Buggenhout & Stephen Sims

___ ., Applocker Rules

· X

,.. Acllat ¥itw .._

··

D lll

,·.·..-...-,~- - - ~,...-......."""""""'s:.w ~l.,t,t~~ ~ Aibk~Polloe-1
., ~Corit,OI~
v-,.....-.... - l. l.( .._~ ..~ -....,
,.-~-.........

,. il·~~Cll'llOcM~

---..,,..

> ~"-'dil:~CN\f91'don

Nome

i!J

E""')'O"·

(Default Rule) All filf< local«! In the Progrom F1IM folder

r!J

E~

(Oefauh Rule)All fil.. Jocated ,n the Windows loldet

-(J

BUILTIN\Adm.. (Def1ul1 Rule) All f~es

AppLocker Ru les A last action to take before we can start creating our own rules is the creation ofdefault rules. These have to be created by category of rules. It is not mandatory but recommended.
There are 3 default rules created for executable rules. These default rules can be created from the right-click menu, and they will also be suggested when we create our first rule (on the condition that the default rules do not exist).
The purpose of the default rules is to allow proper execution of existing Windows applications. There are 2 rules that apply to the group Everyone: they allow the execution ofall executables in the Windows folders and in the Program Files folders. A third default rule applies to administrators only: administrators are allowed to execute all executables.
Remark that these default rules are only effective ifproper control is applied to the Windows and Program Files folders. These folders must not be writable to users; otherwise, users can just copy executables into these folders and have them executed, thereby effectively bypassing AppLocker.
These rules also work under the assumption that normal users are not administrators. Ifyour users need to be administrators on their machine, you will need to tune the default rules, as they will be allowed to run all executables.

© 2017 Erik Van Buggenhout & Stephen Sims

179

'
Applocker Rule Creation - 5 steps (I)

Befor· You 8-gin

· X

Tti,s""ll.Mdlwlp$)'CKIC""~· "Apploct.rru't.AMf't1bawdon(d.lan~W(h~fht rilep,thottlwwftw..-.~conbtnotdlfttht:file' ldigit~~Ult.
ltdvre: <onftnulng. conflffll tNt dwt o ~ ««,Jaic c ~
· lnlQIItnt ~ )'O\I¥1'tt'IC' to Oe&U Ol.eruin for ot1Um computar · IKtup )'OWGfflln9 r\lk.1 · ~MNllhc Apt,locktrdoc:~~

Sekc\ t h e ~ \0 Uk'.md int Yk1 Of gtouplh.11 ffidMelhould Applylo. AA

ai6owKnon ,-mcstfft(1td'f~ lOn.11\wtMlt.· cf-trl)'K1ion11Ht'\'~,fftcled

(IM$frofn"'"""'9-

-o @

°-""

·

so11-,,.,. · 0 Publi,htt Seloctthis "9tion ff lh< ·ppl,c,loonyo,, -ntto Cft>lt tht M t for ISsogntd bytht poblo<h«,

@P·lh
Crut·. ruk ror. sp,clfoc ltlt or loldtt path.Hyo,, stl«1 I lokltt, ··flits"' th,
foldorwdl bt ·ff«tod byth<,ult.
0 Fikhw,
Sdit<t th,t optfOf'I rt you wud to a t.ate, a rule for ,n -.,pft<-.on tNI ii not ~ntd.

AppLocker Rule Creation - 5 steps (1) After fulfilling AppLocker's preconditions, we can start creating rules.
In the right-click menu in the Executable rules when can select "Create New Rule..." .
This wi ll display dialog number 1), presenting information. This dialog can be configured to be skipped.
In dialog number 2, we can decide ifthis is a rule to Allow or Deny applications (whitelisting or blacklisting). By default, the rule applies to group Everyone, but this can be changed.
In dialog number 3, we can select the criteria: the rule can identify executables by Publisher, Path or File hash. Publisher works with digital certificates and requires executables to be digitally signed. Path allows us to specify a filename or a folder (this includes subfolders), with or without wildcards. And File Hash allows us to select a file to calculate the cryptographic hash. All executables with the same cryptographic hash will be selected by this rule.
In our example, we select Path.

180

© 2017 Erik Van Buggenhout & Stephen Sims

Applocker Rule Creation - 5 Steps (2)

· Sd~ the file or folder path that this rule should aff«t. Ifyou sp..c1fy a foldu path, all files
underneath that path will be affected by the rule.
Path: %0SDRIVE%\SEC599\'

Browse Files...

Browse Folders...

..,<ct To tddon-~

ti'le type°' '"<q,t.,,, ·nd thffl <lld<Add, & c - . ,.

opt,orut ond .nowyou to c,,clvde fii..!hot w~d M<m,Jly b< onctud<d 1n ,,.. N(e. lo

continu.econf.gunng thd rule'Mlhov.t ,dding in O(tptiot\ cl1dt Ned.

·

Add.·
SA~

AppLocker Rule Creation - 5 Steps (2) This brings us to dialog 4, where we can specify a filename or folder. We select folder C:\SEC599. Remark that the rule editor translated this to %0SDRJVE%\SEC599\*. On our machine, variable %0SDRJVE% is equal to C:. AppLocker will use variables to make rules more general and applicable to a wider variety of Windows machines. For example, this rule will also work properly on a machine that has Windows installed on drive D:
Finally, in dialog 5, we can add an exception to the rule.

© 2017 Erik Van Buggenhout & Stephen Sims

181

Applocker Sample Blocking Rule

,......,.,,.....,

·- ..,,,....

.....~

t,....... ~

......_........,._,,.,,,.,.~,,,...... ..,.,.... c......._.....
=.:-..:::"'-- :~c:-, ,....,... ~ ·
·--_-_-- .,z:s_,.........
.--r, .-..._-.._.._.._.._....

. ...........................,.~~clk.-w-l-

-0·

The rule we created blocks all applications launched from folder C:ISECS99

SAN~
AppLocker Sample Blocking Rule Once the rule is created and applied, no user will be allowed to run executables fi-om the C:\SEC599 folders.
When you are testing your own rules, be aware that rules have to be deployed first before they become effective. T his can take some time, especial ly ifyou are deploying them using Group Policy Objects in Windows domain environments.
As an example, we try to execute executable bintext.exe in folder C:\SEC599. This is not allowed, and we are presented with a dialog box informing us that our system administrator prevented us from executing the executable. T he dialog box presented in the slide above is for Windows I0. T hese dialog boxes vary per version of Windows.

182

© 2017 Erik Van Buggenhout & Stephen Sims

Applocker Event Logs

0 X

~-_..._ . ... ....
i:i_--_ I-])-- - ,...,c;-._._~,
- - VWl~\f~
-- <li-- ---- .. -... . .,.......................
--·- --- -... ~~-~
~l~

,o+J .T-d,+I~-
@-
a:,-
(i)-.-
o.-
i])(JI-

~·tl512 1'ND5t.l0t11~ ~7tnt.\l
',?rl'141UP.
2'li0Wl0t71t.U. .U ~71U,(ll
~71)t~ ~71lttOI ~11).1,tM MSl2017Ttlto,I 1'1(1~(11'.U7 l!:tt04
~7\):l,QI

+i:Ji
......... .........

.,.,...,...
MIR
..",,"...'.,."...' .._..,

".-,".", .N.<.
,.

!lJrei ·_-,-.._._

""'

~·1-11:-

·- . --· . nvct.-sCU f l . . . . . - - - f;IMSl-t~ r.i ......... _,__
---- . u-- ' ,...__

.-------------~· fJ .....

I [j . _ _ ~·\StCm..t,!NlDC'ri'.Xl··~ttorfl~

~~"'"'°- ·

~-,_,.,_

.. ~

Event logs
Applocker has dedicated Windows event logs.They register events when applications are allowed to run or blocked from running.
Even if you don't deploy restrictive Applocker rules. it could still be interesting to have Applocker Jogs that indicate what software ran at what time.

SANS

AppLocker Event Logs A very interesting feature of AppLocker is the dedicated Windows event logs.
In the event log viewer, under Applications and Service Logs / Microsoft/ Windows / AppLocker we can find 4 event logs (3 on Windows 7): these are the event logs for the 4 categories ofrules.
In the EXE and DLL log presented in the slide above, we selected the event that corresponds with the attempted execution ofbintext.exe. As we can see from the details of the event, execution was blocked.
A similar event is created when an application is allowed to run.
These logs are very useful for logging and monitoring. By centralizing these logs and monitoring all blocked execution attempts, we can be informed of intrusion attempts.
The event log also contains events when policies are applied. When we create new rules to test, we watch the event log to detect deployment ofour policies. When the policies have been deployed, we can start testing.
Remark that if a particular version ofWindows (like Windows lOPro) does not support AppLocker, then an event will be created to inform us of this fact.

© 2017 Erik Van Buggenhout & Stephen Sims

183

Software Restriction Policies

....... S-.,oyOowy

0 X

,.. - - -

1 ...... So<uotr_

.·......_..,S..4.<-"."-9'6---,-"""!,....__--------t ··.·. - -.it-f.l D

~~

,..~.~,..._

...,......._.._.,._ .....,.,___~- --_-,· ~,.,..,...d,~~i ~

S o f t _ , . . ~ ~. .no1,dtf1Md"'

_....__ _ ~IM~Polt..."iaos

~'l'WK.bct,~.c,fflGro.,p

· -'«OuinlPoitciitt ll.OGI'°"°"'

-(onual- __..,__ ... ..,,_, ~ ·~A:Mr

Ntcvli0ft'Wt~flrl:6o-.

_....,__,C, _,,,_. ,I IP--00... 1/11-

V - ---

--App,<>. . . eo.ool" " " -

iiO.,s.C.w,T,y,,p,.,.....,
olrdd1t1Ct\4'~ ,!tn!orc.....C
._o..gn.... ,....,,..
_Mt«I~

') ... IIPStcumy ~0n~eon.ut«

,

~""--d·t~~~

Software Restriction Policies need to be created first. before a rule can be created.

0 X

Software Restriction Policies Although Software Restriction Policies are the older application whitelisting technology offered by Microsoft, and AppLocker should be the preferred technology to use, S RP has still some advantages.
Software Restriction Policies can be applied on versions of Windows that do not support AppLocker. So, in some cases, SRP can be your only option without having to resort to third- party solutions.
Software Restriction Policies also give us the option ofspecifying which type oftiles are to be considered executables. We will illustrate this in the next example.
Before we can start creating rules, we have to create the containers for the policies first, as shown in the slide above.

184

© 2017 Erik Van Buggenhout & Stephen Sims

SRP Blocking Rule

---... ~ ~ ..,_
... Ill . 0 k - - - , .- - - - - - - . " ~ · ~

- D"

.....,,.,_...

&W4tn'IOU,.,.~ ,_,

=--= - - - . 1 . . . - - - - - - - ·.,~,_,.,_,._.'_,-._...........,.,..............,

·.·;r-""='
., l

"=;';;-...:_;;;;..._

___

... ~.....,,..,.....,_

---- ... -~~.~.,-.-~I.eCol,(-.'.".,'.~._

_.

We create a rule to block execution from the desktop, and add extension .docm in the list of blocked file types.

- ·-e~...c..~-..-...-.
---e--.....--
---..-..--..-.........~
~-.. ___ ,..._ ________ ~,,,_

SRP Blocking Rule As an example, we will show how we can block all Word Documents with macros using Software Restriction Policies.
First, we create a rule to Disallow all execution from our Windows Desktop: C:\ Users\root\Desktop. Remark that this rule is not as flexible as AppLocker rules: it does not use variables, and thus only applies to one user.
This rule will prevent us from starting applications on our desktop. Remark that with Software Restriction Policies, the policies are applied at logon time. So, to apply this rule, we need to log out and log on again.
Next, in Designated File Types, we can specify the file types that are controlled by Software Restriction Policies. This is done by file extension (not by file content), and we add extension .docm to the list.
When we try to open document Doc I.docm, we get a Software Restriction Policy dialog preventing us from opening the document.

© 2017 Erik Van Buggenhout & Stephen Sims

185

Application Whitelisting - BypassTechniques
AB with any security control, a number of techniques exist that attempt to bypass implemented whitelisting controls. Some of the most popular ones include:
· PowerShell PE Injection (Prior to Windows 10) · Using lnstallutil.exe · Regsvr32.exe using scrobj.dll
A good overview of application whitelisting bypass techniques is being maintained by Oddvar Moe (https://github.com/apiocradle/UltimateAppLockerByPassList). We should keep an eye out on current techniques and adapt our defenses accordingly!
Still, it's all about defense-in-depth! Application Whitelisting is a highly useful control, but it's not a silver bullet!
SAN~
Application Whitelisting - Bypass Techniques As with any security control, a number of techniques exist that attempt to bypass implemented whitelisting controls. At the time of writing, some ofthe most popular (& successful) techniques include:
· PowerShell PE Injection (Prior to Windows I0) · Using Installutil.exe · Regsvr32.exe using scrobj.dll
A good overview of application whitelisting bypass techniques is being maintained by Oddvar Moe (https://github.com/api0cradle/UltimateAppLockerByPassList). We should keep an eye out for current techniques and adapt our defenses accordingly! Does that mean application whitelisting is broken? Ofcourse not! It's all about defense-in-depth! Application Whitelisting is a highly useful control to have in your toolbox, but it's not a silver bullet!

186

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Averting Payload Delivery
· Day 3: Preventing Exploitation
· Day 4: Avoiding Installation, Foiling Command & Control, & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

SEC599.3

Securing the Network

Network Access Control & 802.1 X

Securing Software

Software Development Lifecycle (SDL) & Threat Modeling

Vulnerability Assessments

Exercise: Authenticated Scans Using Nessus

Patch Management

Exploit Mitigation Techniques

Exercise: Exploit Mitigation Using Compile-Time Controls

Exploit Mitigation Techniques - Exploit Guard, EMET, & Others

Exercise: Exploit Mitigation Using EMET & MalwareBytes

Securing Endpoints

OS Hardening & Best Practices

Endpoint Protection Solutions

Application Whitelisting to Stop Payload Execution

·

Exercise: Configuring Applocker

T his page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

187

Exercise - Configuring AppLocker
IDuring this exercise, we will deploy a configuration for Applocker that can be used to stop a malicious payload from executing. We will configure the Applocker policy on the AD-level (domain) and push it to our clients using group policies.
High-level exercise steps: 1. Define the AppLocker application whitelisting configuration on domain-level 2. Push the configuration towards clients using group policies 3. Attempt to execute our malicious payloads to now see effective blocking of
payloads 4. Test application whitelisting bypass technique
SANS
Exercise - Configuring AppLocker The objective of the exercise is to analyze how AppLocker can be used to better protect our Windows environment I endpoints. During this exercise, we will deploy a configuration for AppLocker that can be used to stop a malicious payload from executing. We will configure the AppLocker policy on the AD-level (domain) and push it to our clients using group policies. The exercise consists of the following high-level steps:
J. Define the AppLocker application whitelisting configuration on domain-level 2. Push the configuration towards clients using group policies 3. Attempt to execute our malicious payloads to now see effective blocking of payloads 4. Illustrating an application whitelisting bypass technique
For additional guidance & details on the lab, please refer to the LOOS workbook.

188

© 2017 Erik Van Buggenhout & Stephen Sims

I
Exercise - Configuring Applocker - Conclusion
Application whitelisting tools such as AppLocker can be an excellent means of preventing malicious code execution if they are properly configured and setup

Although some organizations argue "it's difficult to implement", the author has seen many enterprise-grade organizations successfully implement application whitelisting thereby tremendously increasing their security posture!

This does not mean that application whitelisti.ng is your silver bullet:
Techniques bypassing whitelisti.ng exist, but it's a strong control that will make life ofthe adversaries harder!

This app has been blocked by your system administrator.

Exercise - Configuring AppLocker - Conclusion In conclusion ofthis lab, we'd like to note that application whitelisting tools such as AppLocker can be an excellent means of preventing malicious code execution lF they are properly configured and setup. This is an important prerequisite: the technology needs to be properly implemented.
Although some organizations argue application whitelisting is "difficult to implement", the author has seen many enterprise-grade organizations successfully implement application whitelisting thereby tremendously increasing their security posture. Often, application whitelisting is affected by general IT & application "hygiene". lf you cannot whitelist what applications your end-users are using, it might indicate you have an IT management issue which is broader than just "application whitelisting".
The effectiveness of application whitelisting does not mean it's a silver bullet against exploitation: Techniques bypassing whitelisting exist, but it's another strong control that will make life of the adversaries harder! And that's what it's all about, right?©

© 2017 Erik Van Buggenhout & Stephen Sims

189

Conclusions for 599.3
That concludes 599.3! Today, we've touched upon the following topics:
Securing your network environment using NAC & device management technologies · Securing your own software by implementing security throughout the Software Development
Lifecycle (SDL) · Securing third-party softwareby patch management
Identifying flaws in software using fuzzing techniques Exploit mitigation techniques in modern Operating Systems · Hardening your Operating System to disrupt exploitation · Preventing malicious code execution using application whitelisting
In the next section of the course (SEC599-4), we will investigate how to stop the next phases of the attack, once exploitation succeeds (lateral movement, privilege escalation...)
SANS
Conclusions for 599.3 So far 599.3! Today, we looked into how initial exploitation by adversaries can be prevented and detected. Amongst others, we touched upon the following topics:
· Securing your network environment using NAC & device management technologies · Securing your own software by implementing security throughout the Software Development
Lifecycle (SOL) · Securing third-party software by patch management · Identifying flaws in software using fuzzing techniques · Exploit mitigation techniques in modern Operating Systems · Hardening your Operating System to disrupt exploitation · Preventing malicious code execution using application whitelisting
In the next section ofthe course (SEC599.4), we will investigate how to stop the next phases of the attack, once exploitation succeeds (lateral movement, privilege escalation...)

190

© 2017 Erik Van Buggenhout & Stephen Sims

r

Course Resources and Contact Information

AUTHOR CONTACT

0

ErikVan Buggenhout evanbuggenhout@nviso.be

Stephen Sims

ssims@sans.org

CYBER DEFENSE CONTACT

0

Stephen Sims ssims@sans.org

SANS INSTITUTE 8120Woodmont Ave.. Suite 310 Bethesda, MD 20814 301.654.SANS (7267)
SANS EMAIL GENERAL INQUIRIES: info@sans.org REGISTRATION: registration@sans.org TUITION: tuition@sans.org PRESS/PR: press@sans.org

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

191

