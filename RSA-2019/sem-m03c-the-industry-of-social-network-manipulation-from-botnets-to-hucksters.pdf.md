SESSION ID: SEM-M03C
The Industry of Social Network Manipulation: from Botnets to Hucksters

Masarah Paquet-Clouston
Cybersecurity Researcher GoSecure CounterTack @masarahclouston

Olivier Bilodeau
Cybersecurity Research Lead GoSecure CounterTack @obilodeau

#RSAC

Research Context

#RSAC
From 2016 to 2018...
4

#RSAC
Research Context
5

#RSAC
The Followers' Factory (New York Times Inv.)
6

#RSAC
We thought... Targeting Devumi!
There is so much more behind this industry
7

The Beginning: Uncovering a Provider of Social Media Fraud
A short recap

#RSAC
The Main Providers
Linux/Moose An IoT botnet that conducts social media fraud
9

#RSAC
Recap of Linux/Moose
Affects routers / Internet of Things (IoT)
­ Embedded Linux systems with busybox userland
Worm-like behavior
­ Telnet credential brute force
Payload: Proxy service
­ SOCKSv4/v5, HTTP, HTTPS
Used to proxy traffic to social media sites (mainly Instagram)
10

#RSAC
Catching Linux/Moose
Using Honeypots Software-based Low interaction Side-loaded an ARM virtual machine
­ Which we infected
12

#RSAC
Linux/Moose Honeypots
13

#RSAC
HTTPS Man-in-the-Middle (MITM) Attack
15

#RSAC
Accessed the raw traffic
17

#RSAC
At the time...
18

Whitelisted IP Addresses
The Untold Feature of Linux/Moose

#RSAC
Untold Feature of Linux/Moose
Seven whitelisted IPs
Seven Windows Servers with RDP open Reseller model?
21

#RSAC
Testing the Reseller Model Hypothesis
Investigate similarities in traffic sent by each whitelisted IP based on these variables:
Honeypots used Websites targeted TLS fingerprints User agents API calls Timestamps Accounts created on social networks Accounts followed on social networks
22

#RSAC
Honeypots Used
23

#RSAC
Websites Targeted
24

#RSAC
Other Options
TLS fingerprinting
­ Lee Brotherston's TLS Fingerprinting project ­ Salesforces' JA3 project
User agents API calls
25

#RSAC
Accounts Created and Accounts Followed
Different whitelisted IPs followed the same accounts 
AND
List of fake accounts per whitelisted IP 
28

#RSAC
Purpose of the Whitelisted IPs
Fake account management!
Most likely: windows servers with proxy-aware Instagram fat-client are used to manage fake accounts and the flows of interactions with social networks
29

Moving on to Bulk Reseller Panels

#RSAC
Bulk Reseller Panels
Found in the decrypted traffic: reseller panels
31

#RSAC
Bulk Reseller Panels
32

#RSAC
Reseller Panels (N=343)
Fingerprint of the web application Domain registration information IP address HTML content
33

#RSAC

#RSAC
2/3 of the Dataset
Coded in PHP Used similar combinations of client-side JavaScript libraries Hosted on the same IP address belonging to OVH
35

#RSAC
OVH IP
36

Introducing Software Panel Sellers

#RSAC
The Software Panel Seller
38

#RSAC
Service

All in one solution :

Features:

Ready to go software

API to receive orders

Provides web hosting

API to send orders

You only need a domain name Track your workers

Monthly price based on the number of orders made, ranging from $50 up to $200 per month.
40

#RSAC
Finding the Main Provider
41

#RSAC
Finding the Main Provider
42

#RSAC
Summary
Social Media Fraud Supply Chain
43

#RSAC
Revenue Division in the Chain

Medium Price for 1,000 followers on Instagram

Customer-Facing Websites
$ 13

Reseller Panels $ 1

Customer-facing sellers: 92% of profit margin (if no other costs incurred) Reseller panel owners: $1 per 1,000 followers Main SMF provider: Revenue < $1 per 1,000 followers

44

#RSAC
Key Takeaways
This study goes from malware analysis to market ecosystem understandings We find that botnets are at the end of the supply chain: many actors are involved in reselling social media fraud We conclude that potential targets to disrupt social media fraud are software panel sellers
45

#RSAC
Apply
Next week, you should:
· Contact NY's Attorney General office and tell them to get in touch with us ;-)
· Be more skeptical of online popularity
Within the next year, you should: Educate your family about such threats and ensure other individuals do not only use "followers" as indicators of credibility
46

SESSION ID: SEM-M03C
Thank you! Questions?
Masarah Paquet-Clouston
Cybersecurity Researcher GoSecure CounterTack @masarahclouston

Olivier Bilodeau
Cybersecurity Research Lead GoSecure CounterTack @obilodeau

#RSAC

