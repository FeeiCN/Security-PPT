We know where you live: Systematically Fingerprinting Low- and Medium-
interaction Honeypots at Internet Scale
Alexander Vetterl
University of Cambridge
31st Annual FIRST Conference, Edinburgh -- June 20, 2019

Introduction

Honeypots: A resource whose value is being attacked or compromised

-- Honeypots have been focused for years on the monitoring of human activity
-- Adversaries attempt to distinguish honeypots by executing commands
-- Honeypots continuously fix commands to be "more like bash"

Cowrie ­ commands implemented

3

How we currently build (SSH) honeypots

1. Find a library that implements the desired protocol (e.g. TwistedConch for SSH)
2. Write the Python program to be "just like bash"
3. Fix identity strings, error messages etc. to be "just like OpenSSH"

RFCs

OpenSSH TwistedConch

sshd bash

Cowrie

Problem: There are lot of subtle differences between TwistedConch and OpenSSH!
4

Honeypots in this study
5

Methodology ­ Overview
We send probes to 40 different implementations -- 9 Honeypots -- OpenSSH, TwistedConch -- Busybox, Ubuntu/FreeBSD telnetd -- Apache, nginx
We find probes that result in distinctive responses We find `the' probe that results in the most distinctive response across all implementations and perform Internet wide scans
 Triggered 158 million responses
6

Methodology ­ Cosine similarity
-- We represent our responses as a vector of features appropriate to the network protocol
-- The higher the cosine similarity coefficient, the more similar the two items under comparison
x2
Item 2
Item 1
Cosine distance
x1
7

Probe generation ­ Telnet and HTTP

25 440 Telnet negotiation sequences (RFC854)
4 option codes (WILL, WON'T, DO, DON'T)
IAC WILL BINARY IAC WILL LOGOUT
IAC escape character 40 Telnet options

47 600 HTTP requests (RFC2616 and RFC2518)

43 different request methods

GET /. HTTP/0.0.\r\n\r\n

123 non-printable, nonalphanumeric characters

9 different HTTP versions (HTTP/0.0 to HTTP/2.2)

8

Probe generation ­ SSH

192 SSH version strings (RFC4253)
-- [SSH, ssh]-[0.0 ­ 3.2]-[OpenSSH, ""] SP [FreeBSD, ""][\r\n, ""]
58 752 KEX_INIT packets (RFC4250)
-- 16 key-exchange algorithms, 2 host key algorithms -- 15 encryption algorithms, 5 MAC algorithms, -- 3 compression algorithms
Three variants of (malformed) packets

Packet Padding Length Length

Payload

Random Padding

MAC

4 bytes 1 byte

variable

4-255 bytes

9

Results ­ Similarity across implementations
SSH
n=157 925 376
Telnet
n=356 160
HTTP
n=571 212 10

Results ­ Reasons for distinctive responses

-- (Random) padding of SSH packets

Packet Padding Length Length

Payload

Random Padding

MAC

4 bytes 1 byte

variable

4-255 bytes

-- Servers close the connection as a result of bad packets -- Not supported or ignored HTTP methods -- Not supported or ignored Telnet negotiation options -- Different error messages returned -- and more...

11

Results Telnet ­ Internet wide scans (1/3)
-- First study to give an estimate of Telnet implementations
-- Most implementations are similar to Busybox 1.6-2.4
-- Not many servers respond in the same way as honeypots
12

Results SSH/HTTP ­ Internet wide scans (2/3)

Most implementations are similar to OpenSSH 6.6 and OpenSSH 7.2

Most implementations are similar to nginx 1.12.1, Apache 2.2.34 and Apache 2.4.27
13

Results Honeypots ­ Internet wide scans (3/3)
14

Validation and Accuracy (1/2)

Random padding of packets does not allow for exact matches

Removing the random parts

Use second-best distinguishing probe

15

Validation and Accuracy (2/2)
Equal Error Rate (ERR) of 0.0183 -- We falsely accept and at the
same time fail to identify 51 honeypots -- 2,779 honeypots as `ground truth'
16

Results ­ Mass Deployment
-- 724 IPs run both an SSH and Web honeypot -- Many honeypots are hosted at well-known cloud providers
17

Results (SSH) ­ Configuration
-- Only 79% of SSH honeypots have an unique host key -- SSH Honeypot operators rarely update their honeypots
18

Impact and Countermeasures
We can detect your honeypots without even trying to send any credentials
-- It is hard to tell from the logging that you've been detected! -- It is easy to add scripts using these techniques into tools such as Metasploit!
Closely monitor and update your honeypots
-- Honeypot operators are as bad as anyone with patching
Patching against the specific distinguishers we report in the paper is not a solution as there are thousands more
-- We developed a modified version of the OpenSSH daemon (sshd) which can front-end a Cowrie instance so that the protocol layer distinguishers will no longer work
19

Ethical Considerations
-- We followed our institution's ethical research policy
-- with appropriate authorisation at every stage
-- We used the exclusion list maintained by DNS-OARC -- We notified all local CERTs of our scans -- We respected requests to be excluded from further scanning -- We notified the relevant honeypot and library developers of our findings
20

Conclusion
Presented a generic approach for fingerprinting honeypots ("class break")
-- With a TCP handshake and usually one further packet we identify if you are running Kippo, Cowrie, Glastopf or various other (we believe all) low- and medium-interaction honeypots
Performed Internet wide scans for 9 different honeypots
-- Found 7,605 honeypots residing on 6,125 IPv4 addresses -- Majority are hosted at well known cloud providers -- Only 39% of SSH honeypots were updated within the previous 7 months
We need a new architecture for low- and medium-interaction honeypots
-- The "bad guys" can easily reproduce and implement our techniques
21

Q & A
Alexander Vetterl alexander.vetterl@cl.cam.ac.uk https://github.com/amv42/sshd-honeypot
22

