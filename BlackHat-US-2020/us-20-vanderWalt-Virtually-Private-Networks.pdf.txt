Virtually Private Networks
Virtually good enough
Wicus Ross Charl van der Walt

charlvdwalt

wicusross

#BHUSA @BLACKHATEVENTS

1. Introduction

September 26,

2

2019

Free WiFi

domain.com, in the living room, with a candlestick
6

The curious case of the outbound 445

What should we expect from a VPN?
 Confidentiality Prevent sensitive or private information from being intercepted or deduced.  Integrity Ensure that data and messages are not modified or interfered with.  Access Control Ensure that only authenticated users are permitted to access the systems and resources they are specifically authorized for.

Fixed.io

2. Research Proposal

9

charlvdwalt

wicusross

VPN over Wi-Fi ­ Specific threat scenarios
Sniffing sensitive data DNS `Person in the Middle' (PiTM) or spoofing Harvesting credentials using spoofed website Capturing Windows hashes via Responder Using the Browser as a tunnelling proxy Using IPv6 to interact with host

Approach

 General testing to understand the relevant mechanics and validate PoC  Validate working assumptions  Define a reasonable `Target Security Model'  Create a standardized test plan and Wi-Fi environment with Captive Portal  Repeat standard tests of the equivalent capabilities for `default'
and `lockdown' configurations  Engage with vendors for validation and comment

Tested, in no order... Cisco

Pulse Secure

Checkpoint

Fortinet

Palo Alto Network

Cisco ASA with AnyConnect

Pulse Connect Secure
Pulse Secure 9.1R1 Build 1505 Server
Pulse Secure VPN version 9.1.1 (607) - Client

Check Point VPN
Check Point R80.30 - Server
Check Point VPN E81.40 Build 986101104 - Client

Fortigate with FortiClient
FortiOS 6.2.4 ­ Server
FortiClient 6.4.0.1464 ­ Client FortiClient EMS 6.2.7 ­ Advanced features

PAN-OS Global Protect PAN-OS 9.0 (9.0.9) - Server GlobalProtect 5.1.4 - Client
bit.ly/orangevpn

If a VPN is the logical extension of a private network to another location, and if we assume that the `other location' is a Wi-Fi network that is either compromised or malicious, how much protection do enterprise VPN products provide against common threats we could reasonably expect to encounter?
Fundamental research question

3. Technical concepts

September 26,

15

2019

charlvdwalt

wicusross

Captured - How Captive Portals work
 Connect to Wi-Fi
 Assign network settings via DHCP
 Test for Internet access
 Captive portal intercepts HTTP request and issues an HTTP response. Typically an HTTP 302 response that redirect to the captive portal's web interface
 OS determines if the user should be prompted to interact with the captive portal and spawns a browser (default or dedicated)
 Captive portal redirects the browser to the URL that the OS initially used for testing
 OS continues to check whether it can access the Internet. Waits for a successful HTTP 200 response.
 OS signals the user visually when Internet access is enabled

Captured ­ DNS & DHCP

 DHCP packets are probably among the first to be broadcast when a guest joins a network
 Guest solicits configuration by a DHCP Discovery packet  Guest already discloses its host name and possibly
vendor identifier in subsequent DHCP Request  DHCP seeds network configuration ­
IP details DNS Domain Name (option 15) Search Suffix (option 119) Routing Proxy Auto Discover MTU, etc  If the client stacks is IPv6 enabled (dual stack) then certain IPv6 network settings can be provided via DHCP also

VPNs and Split Tunneling

 VPN is configured, once connected, to route specific network requests through the VPN tunnel
 Other traffic follows according to the default network routing rules.
 Done so that only traffic destined for the corporate network is encrypted and subject to access control, while regular local network or internet-bound traffic flowing outside the VPN tunnel.
 To allow access to resources on the local network while retaining performance when accessing the public Internet.
 Lessens the amount of traffic traversing the corporate network

Full Split

Wi-Fi and IPv6
 IPv6 enjoys preference in some network stacks  IPv6 has to broadcast communicate to discover the lay of
the land ­ neighbour solicitation and router solicitation  There is no ARP in IPv6 replaced by ICMPv6  Guest OS also broadcast identification information about
itself when asking for DHCPv6 details  DHCPv6 also supports concepts for Domain Search List
and FQDN  IPv6 is often overlooked and results in dual stack
deployments by default  Firewall rules and VPN rules at IPv4 level does not apply to
IPv6

Captive Portal `mitigation' or `lock down' mode
" Lock down mode is designed to prohibit network communication outside of the VPN Tunnel when the ... client is attempting to create a VPN connection to the ... [server].

`Lock down' mode experiences per product

Vendor 1

· Has CPMB (embedded IE?) · Clear Captive Portal mitigation instructions

Vendor 2

· Has CPMB (proprietary?) · Captive Portal mitigation instructions

Vendor 3

· No CPMB · `Lock down' based on combination of others · Finely grained control features

Vendor 4

· No CPMB · IPv6 only disabled when IPSec is used

Vendor 5

· Still in progress. · Visit the site - bit.ly/orangevpn

4. Research & Findings

22

charlvdwalt

wicusross

`Lock down' mode features per product
CPMB Vulnerable outbound traffic blocked* Outbound allow list configurable DNS Cache Flush
IPv6 Disable Captive Portal mitigation window times out User can't accept bad certificate User cannot disable agent
* e.g. SMB, LDAP, NETBIOS
bit.ly/orangevpn

Do VPNs do what we expect them to do?

 Confidentiality
1. How much unsolicited network traffic is broadcast by the guest while associated with the local network of the AP?
2. What role does dynamic network configuration fields such as connection specific DNS suffixes play in leaking network traffic?
3. How much network traffic is leaked to the local network of the AP while connected to the VPN?

 Integrity
1. Are the client applications on roaming device vulnerable to person-in-the-middle attacks via the LAN?
2. How resilient are roaming devices against credential theft?

 Access Control
1. Can attackers use guests on the malicious free Wi-Fi to tunnel over the VPN into the corporate network?

We expect exposure to be the same as on the corporate LAN

Test configuration

Test Approach

Captured

Standard Mode

`Lock down' mode

· No Internet access · Most like off the shelf VPN config · Split tunnelling inactive since
there's no Internet

· No Internet access · Best possible working VPN config · Full tunnelling inactive since there's
no Internet

Online

· Internet access ­ VPN established · Most like off the shelf VPN config · Split tunnelling enabled unless
specifically discouraged

· Internet access ­ VPN established · Best possible working VPN config · Full tunnelling

TL;DR
Standard Mode Captured
Online

`Lock down' mode

 Our initial concerns about the failure of VPNs to protect machines in captive portals all hold true.
 Even once fully established, a carelessly configured VPN barely does better at mitigating the identified threats.
 `Lock down' features that are intended to `mitigate' the captive portal problems do indeed address some issues, but are not universally effective in mitigating the full set of threats we considered.
 The findings are not consistent across all vendors, so vendor selection does matter.

Demo ­ Responder attack from Captive Portal in lock down mode

bit.ly/orangevpn

charlvdwalt

wicusross

Demo ­ Responder attack fully connected in lock down mode

bit.ly/orangevpn

charlvdwalt

wicusross

Observations
 The number of configuration options when setting up a VPN and supporting infrastructure is overwhelming.
 Product packaging, licensing and offerings vary dramatically.
 Training, experience and support matters
 Configuration nuances and overloaded functionality can create all sorts of technical side effects
 Captive portal detection with `Captive Portal Mini Browser` is not always consistent
 Some vendors have no specific `lock down' mode, but rather a disparate set of features that need to be combined
 Mobile devices generally present viewer risks than desktops, provided that the VPN is established via mobile data before connecting to Wi-Fi
 Other OS present fewer risks than Windows because they strictly control the process and are simply less talkative.

5. Conclusions

September 26,

39

2019

Overview of findings
 We believe that the scenario where users are connecting via compromised home Wi-Fi or malicious public Wi-Fi is real and deserves a place on the enterprise Threat Model.
 Captive Portal is a common scenario, but not is not an essential attribute for the threats to be real. Compromised AP or home router is just as significant.
 We believe there is a reasonable expectation that the `tunnel' a VPN creates should protect users against the threats we tested.
 Out-of-the box and common configurations generally do not address the threats identified when the AP is considered malicious.
 All the vendors assessed offer features to address malicious Wi-Fi and Captive Portal scenario.
 However the effectiveness of these offerings various substantially and erratically across the vendors.

Out of the box and common configurations generally do not address the threats identified

Standard Mode Captured

`Lock down' mode

Online

Recommendations
Fully understand and utilise
 Technical
Ensure you control and centralise all DNS settings. all `lock down' features.
Fully qualify internal host names.
Avoid split tunnelling if possible.
Be careful of session time-outs.
Use a firewall or EDP to block outgoing connections.
 Tactical
Carefully consider your use cases and threat model. Understand what security threats the security technology is supposed to address.
Engage with your vendors.
Examine your vendor choices carefully. Not all products address these risks equally.
Consider some fresh paradigms, e.g. mobile data, or simple SSL with certificate pinning.
`Zero Trust'

We add EDPR or other
supplementary protection

Free-WiFi becomes a business
enabler

Legal and liability
concerns emerge

A battle of two business

Those features face unfair odds

models

Captive portals offer legal risk
mitigation

VPNs respond with new features

Options for monetisation
emerge

Thanks to the vendors of all kinds

Vendor 360 Belkin D-link Foscam Huawei LG NETGEAR Polycom Synology TP-link Ubiquiti Networks Vivotek Western Digital Xerox Zyxel

Firmware examined 4 2
13 1
64 25
1 11 1 12 680 1 3 4 3

Over 51,677 firmwares for 8.516 products across 191 vendors

dankie

charlvdwalt

wicusross bit.ly/orangevpn

