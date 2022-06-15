Network Automation is not your Safe Haven: Protocol Analysis and Vulnerabilities of Autonomic Network

#sh run
o o o
2

Agenda
o o o o
3

Autonomic Systems
o o
4

Autonomic Network
o o o o

Autonomic Network logo as shown by Cisco in their presentations here and here
5

Live Demo
6

Demo Results
o o
o
7

Cisco Deployment
o
o o o
8

Channel Discovery
o o
9

Adjacency Discovery
o o
o o
o
10

Registrar Adjacency Discovery

Enrollee
Generate 3072-bit RSA key
11

Secure Channel
o
o o
o
o o o
12

Registrar Configuration
autonomic registrar domain-id ERNW.de whitelist flash:whitelist.txt CA local no shut autonomic
13

Enrollee Needed Configuration
o
o
o
o autonomic
14

Autonomic Effect
o o o o o o o
15

Are you in Control?
16

Autonomic Network: Under The Hood
17

Channel Discovery
18

Channel Discovery
19

Channel Discovery
20

Channel Discovery
21

Channel Discovery
22

Channel Discovery
23

Channel Discovery
24

Channel Discovery
25

Adjacency Discovery
26

Adjacency Discovery
27

Adjacency Discovery
28

Adjacency Discovery
29

Adjacency Discovery
30

Adjacency Discovery
31

Adjacency Discovery
32

Adjacency Discovery
33

Adjacency Discovery
34

Adjacency Discovery
35

Adjacency Discovery
36

Adjacency Discovery
37

Adjacency Discovery
38

Adjacency Discovery
39

Secure Channel
40

Secure Channel
o o

o



41

42

Is it Secure?
43

Support

Live Chat

44

Live Chat
Support Me: Hi, I connected 2 nodes from 2 different domains and they built the secure channel!
45

Live Chat
Support Me: Hi, I connected 2 nodes from 2 different domains and they built the secure channel! Support: Thanks for reporting, we created BugID CSCvd15717. We will check with the BU for that
46

Live Chat
Support Me: Hi, I connected 2 nodes from 2 different domains and they built the secure channel! Support: Hi, the BU responded that as both have a certificate signed by same CA, then they can connect.
47

Live Chat
Support
Me: Hi, I connected 2 nodes from 2 different domains and they built the secure channel! Support: Hi, the BU responded that as both have a certificate signed by same CA, then they can connect. Me: Wait, what about different domains? Well, this shouldn't be
48

Live Chat
Support
Me: Hi, I connected 2 nodes from 2 different domains and they built the secure channel! Support: Hi, the BU responded that as both have a certificate signed by same CA, then they can connect. Me: Wait, what about different domains? Well, this shouldn't be Support: We will add a feature to check domains in the future!
49

Bug: CSCvd15717
o o o o
50

Live Chat
Support Me: Hi, I can't revoke the certificate of one of the accepted nodes.
51

Live Chat
Support Me: Hi, I can't revoke the certificate of one of the accepted nodes. Support: We will check that. Please note that the revoking of certificates is not supported on local CA.
52

Live Chat
Support Me: Hi, I can't revoke the certificate of one of the accepted nodes. Support: We created CVE-2017-6664 for that.
53

CVE-2017-6664
o o
54

Live Chat
Support Me: Hi, the attacker can reset remotely the secure channel every time they are created, not only this the information is also in plain text!
55

Live Chat
Support Me: Hi, the attacker can reset remotely the secure channel every time they are created, not only this the information is also in plain text! Support: We created CVE-2017-6665 for that.
56

CVE-2017-6665
o
o o
57

Live Chat
Support Me: Hi, if the attacker reset the channel multiple times, eventually the node crashes!
58

Live Chat
Support Me: Hi, if the attacker reset the channel multiple times, eventually the node crashes down! Support: We created CVE-2017-6663 for that.
59

CVE-2017-6663
o o
60

Live Chat
Support Me: Hi, the attacker can crash the registrar by sending invalid enrollee IDs Support: We created CVE-2017-3849 for that.
61

CVE-2017-3849
o o
62

DeathKiss!
63

CVE-2017-3850
o
o
o
o o
64

Conclusion
o
o o
o o o
o o
65

Finally...
o o o
o o o
66

