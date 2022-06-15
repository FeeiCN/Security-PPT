SESSION ID: PDAC-W04
How Poorly Managed Keys and Certificates Impact the Trust Model
#RSAC

Stephen Jordan
SVP/Technology Area Manager Wells Fargo & Co Enterprise Information Security Engineering & Services

#RSAC
Key and Certificate Trust Model
Used for secure communications, authentication, and authorization
But when poorly managed, they jeopardize the trust they are meant to establish
 SSL/TLS  SSH  Mobile devices  WiFi &VPN access  Etc.
2

#RSAC
Security Gaps
Most security controls blindly trust keys and certificates Cyber criminals misuse keys and certificates to bypass security controls Do you trust all keys and certificates?
3

#RSAC
Foundation of Layered Security
4

#RSAC
When the Foundation Isn't Protected
5

#RSAC
Cyber Criminal Activity
Cyber Criminals Misuse Unmanaged / Unprotected Keys and Certificates:
Abuse their trusted status Hide in encrypted traffic--e.g., transmit malware or steal data Eavesdrop using man-in-the-middle (MITM) attacks Code-sign malware Spoof websites in phishing attacks
6

#RSAC
Increasing Attacks
7

#RSAC
The Problem

Increased management complexity

Lack of knowledge/management of the trust model

Human error/lack of education

Ponemon Institute. 2015 Cost of Failed Trust Report: Trust Online is at the Breaking Point. 2015.

8

#RSAC
And It's Only Getting Worse...

4.9 Billion Connected "Things" in 2015-- up to 25 Billion by 2020

Gartner Press Release. Gartner Says 4.9 Billion Connected "Things" Will Be in Use in 2015. Nov. 11, 2014.

9

#RSAC
Real-world Case Study #1
Reconstructed by:
10

Real-world Case Study #1
Attack Stage 1: Stole Private Keys

#RSAC
MANY STILL VULNERABLE All those that did not replace all keys and certificates following Heartbleed

11

Real-world Case Study #1

#RSAC

Attack Stage 2: Gained Access

12

Real-world Case Study #1

#RSAC

Attack Stage 3: Expanded Foothold

13

Real-world Case Study #1

#RSAC

Attack Stage 4: Exfiltrated Data

14

#RSAC
Real-world Case Study #2
Russian hacking group stole an SSL private key to conduct an effective phishing campaign of a Fortune 100 bank. The attack went undetected for months and led to the loss of account information for tens of millions of customers.
Reconstructed by:
15

Real-world Case Study #2

#RSAC

Attack Stage 1: Getting a Private Key

PURCHASED ON THE UNDERGROUND Attackers purchased an SSL private key for a wildcard certificate for a Fortune 100 bank

ABUSING TRUST How did the private key wind up for sale on the underground marketplace? Most likely it was stolen by malware or it might have been sold by an employee.
16

Real-world Case Study #2
Attack Stage 2: Gain Access to DNS

SSH BRUTE FORCE: Conducted an SSH brute force attack to get a username & password.

PRIVATE KEY WITH ROOT ACCESS: Searched the home directory tree and revealed a tarfile with a system backup, containing an SSH private key for root access.

#RSAC
MATCHING DOMAIN NAME TO CERTIFICATE: Inserted a DNS entry into the system zone file and the IP Address of a hacked server into the production DNS system.

17

Real-world Case Study #2

#RSAC

Attack Stage 3: Build a Phishing Website

A BELIEVABLE PHISHING WEBSITE Attackers cloned a legitimate, reputable production website, but used the phishing URL.

ABUSING TRUST Using the stolen SSL certificate enabled the phishing site to display a valid certificate-- along with a valid domain name and SSL/TLS encryption, this made a convincing phishing site.
18

Real-world Case Study #2

#RSAC

Attack Stage 4: Lure Victims

ROUTING USERS TO PHISHING SITE Emails were sent to harvested email addresses for the bank's customers and employees.

ABUSING TRUST When a user and password combination were entered, the fake site then redirected the end user to the legitimate site through a MITM approach.
19

#RSAC
What's Needed
Protect Your Business
Establish visibility, awareness, and a centralized inventory of keys and certificates Get control with enforced policies & workflows for certificate management Automate certificate lifecycle actions Educate, educate, educate
20

#RSAC
Benefits of Better Management
Increase operational efficiencies
 Avoid outages--increase system uptime  Reduce certificate lifecycle timeline
Improve security
 Know what should and shouldn't be trusted  Strengthen investment in other security controls  Reduce attack vector with tighter control  Leverage trust model  don't blindly trust everything
21

#RSAC
Apply What You Have Learned Today

Next week:
Identify your current key and certificate management approaches Read the full Raxis attack reconstructions to better understand vulnerabilities

Within three months:
Conduct a full inventory of all keys and certificates, including a vulnerability assessment Develop a management strategy, including policies and workflow Evaluate tools to help automate key and certificate management & security

Within six months:
Implement management & security tools Begin phased approach to vulnerability remediation
22

Tips  Don't boil the ocean, it is a
journey, one step at a time  Educate, educate, educate  Rinse and repeat--this is not
a one time event

#RSAC
Questions
Case Study #1
Real-world Attack Case Study: Misuse of Keys and Certificates Bypass Critical Security Controls http://research.crn.com/content51270
Case Study #2
Real-world Attack Case Study: Private Keys and Digital Certificates Used for Phishing and Breach of a Global Bank http://whitepapers.fiercecio.com/content50888
23

