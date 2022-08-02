SESSION ID: HT-R11
Hunt Advanced Attackers on a Budget Less than the GDP of a Small Country

John Strand
Owner Black Hills Information Security @strandjs

#RSAC

#RSAC
Hunt Advanced Attackers on a Budget Less than the GDP of a Small Country

#RSAC
Problem: Detecting Command and Control is getting hard
 There are a number of backdoors that use a wide variety of different ways to communicate with the bad guys' Command and Control (C2) servers
 HTTP Beaconing  Social Media  DNS  QUICK  SCTP
 PenTesting firms use these tricks all of the time  As do the bad guys  How can we detect these backdoors if the data is encrypted,
obfuscated or hidden?  We can use AI
 Please.. Don't stop watching just yet...

#RSAC
Let's think about consistencies.
Interval

Dispersion

Data Size

#RSAC
Let's think about consistencies.

Dispersion

Interval
..::..::..:: 1
Data Size

#RSAC
Let's think about consistencies.

Interval

Dispersion

..::..::..:: 1 ..::..::..::

Data Size

#RSAC
Let's think about consistencies.

Interval

Dispersion

..::..::..:: ...:::...:::...::: 1 ..::..::..::

Data Size

#RSAC
Let's talk about setup
 First, you will need to have a system to capture the traffic  Second, RITA is free and awesome
Pre NAT: Zeek/ NetFlow, RITA

#RSAC
Why Zeek?
 Speed  Large user base  Lots of support  Consistency
 Timestamps are key  Many devices handle timestamps in different/odd ways  Generates required log files
 We are moving away from signature-based detection  Too many ways to obfuscate
 Encryption, Encoding, use of third-party services like Google DNS

#RSAC
RITA is free... It is also the source of most of the data we will cover:
https://www.activecountermeasures.com/rita/

#RSAC
VSAgent

#RSAC
DNSCat

#RSAC
Housekeeping: Ads
 Ads... Oh my... Ads  You need to block them  They bring malware  They pollute the data

#RSAC
Round Robin Malware Beaconing
 We have been seeing malware that connects to multiple different IP addresses
 QUIC  SCTP
 One giveaway is the datasize  The IPs may shift, but the
dispersion and the data size are still consistent  Look for an internal system making connections to multiple external systems with the same attributes

#RSAC
What happens when your entire network is connecting to DoD?
 We had a customer who had a large (think thousands) of systems connecting to a DoD IP address on the Internet
 Very strong and consistent beacon
 Datasize  Dispersion  Interval
 Time to panic?  Is the NSA hacking them?  Was it a Vault or ShadowBroker exploit?  Made no sense at all.....

#RSAC
Quote from a developer...
"Wait... That IP address is odd.. It is the current version of product X."

Lesson
 Sometimes "beaconing" data is not evil
 Sometimes it is just a mistake  Trust me, there are lots of
mistakes on networks....
 Syslog from products  "Customer experience data"  Direct Software updates trying to
get to the Internet
 There is a lot of filtering and research when you first do this
 But, it gets easier  Think Vulnerability Assessments

#RSAC
Did someone say a "Touch of Evil?"

#RSAC
On the topic of blacklisting...
 There are multiple different sources of blacklisted IP/DNS information
 Most of them feed of each other  Having a hit on a blacklist does not
mean the connection is immediately evil
 Virtual hosting  Old entries
 So, simply because a connection is made to an IP address does not mean the system is compromised

#RSAC
What to look for: Numerous hits

#RSAC
What to look for: Amount of data transferred

#RSAC
A note on porn

#RSAC
When good sites go bad...

#RSAC
Seems legit..

#RSAC
Spyware is.... Weird
 Not quite ad... Not quite malware...  Usually used for tracking a user  All advertisers do this

#RSAC
Compromised Servers

#RSAC
Crypto mining is the new hotness

#RSAC
Online Resource: IP/URL Void

#RSAC
BGP/ASN Ranking

#RSAC
Shodan... Not just for pentesters...

#RSAC
PunkSPIDER is back!

#RSAC
Conclusions
 Detecting Command and Control traffic is getting harder and harder
 We released RITA to help detect some of the backdoors we use everyday
 It is free. GO GET IT!  There are also a lot of free
resources available to research network oddities  Does require a bit of digging  Odd != Evil  Housekeeping is often required!  Thanks!

