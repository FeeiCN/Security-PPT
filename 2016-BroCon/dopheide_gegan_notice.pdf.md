Notice Correlation and Covert-Timing Channels

Michael Dopheide & Ross Gegan ESnet Lawrence Berkeley National Laboratory

BroCon Austin, TX Sept, 13, 2016

Table of Contents
Introduction Something Important Part 1: Multi-Notice Correlation Part 2: Covert-Timing-Channels (CTC)

2

9/23/16

Dop Introduction
· Almost 10 Years at NCSA ­ Started in systems engineering and transitioned to operational security
· 3.5 years doing penetration testing for a major bank ­ Interesting for a little while...
· Joined ESnet in February 2015.

3

9/23/16

Illustration by Nick Buraglio

Pyramids*

*Triangles

4

9/23/16

Actual Pyramids

5

9/23/16

Pyramid Limitations

6

9/23/16

Pyramid Fail

7

9/23/16

Pyramids are hard to rebuild

8

9/23/16

Trapezoidal Prism*

*Mayan Pyramid

9

9/23/16

Trapezoidal Prism

10

9/23/16

Added Benefits

11

9/23/16

Part 1: Multi-Notice Correlation
Given
· Bro ships with a lot of common policies · Many more available from the community · Policies should (must) be tuned to the specifics of your network
Problem Statement
With a new job and no knowledge of what normal looks like, how can I have a quick impact on ability to detect and block bad actors? How can I speed up the tuning of built-in and custom policies?

12

9/23/16

Start with Password Guessing and Intel

SSH::Password_Guessing
I couldn't simply turn on blocking because I didn't know what our user community habits were.
Intel::Notice
Intel feeds come with varying levels of confidence ­ can't block an IP just because it's in Intel. · Using primarily both CriticalStack and REN-ISAC feeds · ~100,000 indicators
However, if we can keep track of source IPs that flag both, that's something we can block!

13

9/23/16

The Basic Flow
global watch_hosts: table[addr] of table[Notice::Type] of count &write_expire = 120 min &synchronized;

14

9/23/16

The Basic Flow
Define new notice types and define which types you want to block or alert on:
redef enum Notice::Type += { Multi::Multi_Notice, Multi::Multi_Notice_AutoBlock, Multi::Multi_Notice_AutoBlockAlarm, Multi::Single_Notice_Threshold, Multi::Single_Notice_Threshold_Block
};
global multi_notice_types: set[Notice::Type] = { SSH::Password_Guessing, Bash::HTTP_Header_Attack
} &redef;

15

9/23/16

The Basic Flow
hook Notice::policy(n: Notice::Info) {
if( n$note in multi_notice_types ){ if(n?$conn){ watch_host(n$conn$id$orig_h,n); }else{ watch_host(n$src,n); }
} }
event Intel::log_intel(rec: Intel::Info){ # any Intel hit, add to watch list. local wn = Notice::Info($note=Intel::Notice); watch_host(rec$id$orig_h,wn);
}

16

9/23/16

Notice Log Entry
1471667754.084883 - - - - - - - -- Multi::Multi_Notice_AutoBlock Host triggered multi-notice correlation Intel::Notice:24__SSH::Password_Guessing:1 11.22.33.44 - - -lbl-worker-1-4 Notice::ACTION_LOG,BHR::ACTION_BHR,Notice::ACTION_ALARM 3600.000000 F ------
Intel::Notice:24__SSH::Password_Guessing:1
· We saw this host via Intel 24 times and when the first password guessing notice hit we blocked it.
· The higher Intel count is just a result of the password guessing thresholds.

17

9/23/16

SSH::Password_Guessing
For sources not already blocked, in July 2016:
41 Unique IPs found SSH password guessing 12 of those in Intel
Immediate Lessons: · Allows us to block some bad actors while getting comfortable · Intel feeds only go so far (at least ours) · Perhaps we can adjust our thresholds
This led to...

18

9/23/16

SSH::Foreign_Threshold_Block
Modified SSH::Password_Guessing to be more aggressive for non-U.S. sources.
July 2016: 139 Non-U.S. IPs found and auto-blocked
60 in Intel
The reason we see many more IPs than the original 41 is because of lower thresholds.

19

9/23/16

DNS examples
· DNS::Request_Threshold · ESnet's DNS resolvers were getting hammered · Set thresholds to throw a notice · We can never really auto-block on just this notice as there are lots of reasons to legitimately make DNS requests at the thresholds we have set.
· DNS::Possible_Weird_CVE_2015_7547_Attack · Rough policy to detect DNS DoS that results in a lot of false positives.

20

9/23/16

DNS examples
When combined with Intel, DNS::Request_Threshold blocked 13 unique hosts in June 2016.
More interesting however, was the following:
1465974656.496484 Multi::Multi_Notice_AutoBlock DNS::Possible_Weird_CVE_2015_7547_Attack:1__DNS::Reque
st_Threshold:1
No Intel involved... this is a great example of two non-perfect policies combining to confidently block some potentially bad activity. The offending host in this case was in the Netherlands.

21

9/23/16

Notice Correlation without Intel: DDoS

ESnet was the target of some minor SYN flooding DDoS attacks. The result was two policies with different thresholds, the second allowing for more SYNs, but over a longer span of time.

19 : DDoS::SYN_DDoS_Attempt only 4 : DDoS::SYN2_DDoS_Attempt only 4 : Tripped both

The four that tripped both thresholds were sending SYNs so fast that they hit the higher threshold in the smaller time window.

To answer the question, "Are there hosts hitting both policies?" · Could have done this correlation by hand · Instead, added both notice types to multi_notice_types
· In fact, we did this before the question was asked.

22

9/23/16

Single Notice Threshold
1465303777.308319 - - - - - - - -Multi::Single_Notice_Threshold_Block Crossed block
threshold of 10 for HTTP::HTTP_SensitiveURI 80.98.206.222- - - lbl-worker-1-6 Notice::ACTION_LOG,Notice::ACTION_ALARM,BHR::ACTION_BH
R 3600.000000 F - - - - - - -
This gives us a way to track repeat offenders before blocking.

23

9/23/16

Not as well tested feature...
· Support for correlation with Notice Types that won't block automatically · Unless the number of unique notice types is over the threshold, then block.
global multi_non_block_thres: count = 3 &redef; global multi_notice_non_block_types: set[Notice::Type] = {
SSH::Success } &redef;
For example: Will NOT Block: Intel::Notice and SSH::Success
But with threshold 3: Will Block: Intel::Notice, SSH::Success, and DNS::Request_Threshold

24

9/23/16

For a whitelisted scanner...
1469048610.980754 CQ4hxs4dNbZQnufXWe 11.22.33.44 56666 55.66.77.88 80 - - - tcp Multi::Multi_Notice_AutoBlockAlarm Host triggered multi-notice correlation DDoS::HTTP_DDoS_HEAD_Attempt:1__DDoS::HTTP_DDoS_Attempt:1__HTTP::HTT
PSensitivePOST:822__Bash::HTTP_Header_Attack:3770 11.22.33.44 55.66.77.88 80 - lbl-worker-1-12 Notice::ACTION_ALARM,Notice::ACTION_LOG,BHR::ACTION_BHR 3600.000000 F - - - - - - -
DDoS::HTTP_DDoS_HEAD_Attempt:1 DDoS::HTTP_DDoS_Attempt:1 HTTP::HTTPSensitivePOST:822 Bash::HTTP_Header_Attack:3770

25

9/23/16

Part 1 : Notice Correlation Wrap-up
· Easy win for your new job · Great for testing out new, not-so-perfect policies
Code: https://github.com/dopheide/bro_notice_correlation Blog Post: http://blog.samoehlert.com/correlating-bro-notices

26

9/23/16

Part 2: Convert Timing Channels
1) Introduction 2) Covert Timing Channels (CTCs) 3) Detection techniques 4) Bro Policies 5) Detection Implementation 6) Conclusions and Future Work

27

9/23/16

Ross Introduction
· UC Davis graduate student. · Interning at ESnet.
­ Project: Detecting covert timing channels using Bro.

28

9/23/16

What are Covert Timing Channels?

29

9/23/16

Covert Timing Channels
Ø Network Covert Timing Channels encode data in the inter-packet delays (IPDs)
Ø Allows hidden communication using authorized channels
Ø Can be used for malicious purposes

30

9/23/16

Covert Timing Channels
All traffic is going to have some randomness in the delays between each packet
In this example, Bob is sending standard business traffic to Alice. Nothing out of the ordinary.

31

9/23/16

Covert Timing Channels
However, if Bob (or an attacker with appropriate access) is able to manipulate the IPDs beyond normal randomness....

The IPDs can be used to send data along with the normal traffic. Now an outside accomplice, anywhere on the network path, can received the covert data. The corporate IDS likely won't notice any difference.

32

9/23/16

Types of Covert Timing Channels [5]
Active Channels Ø IPCTC Ø Model-Based CTC (MBCTC) Ø Time-Replay CTC (TRCTC) Passive Channels Ø Jitterbug

33

9/23/16

Image: S. Gianvecchio and H. Wang. [5]

Covert Timing Channel Mitigation

34

9/23/16

Disrupting Covert Timing Channels [7][8]
Ø Goal: Eliminate the covert channel or reduce channel bandwidth.
Ø Add noise to a process's timing information. (Ex: fuzzy time technique)
Ø Can hurt legitimate traffic performance, especially for applications such as VoIP.

35

9/23/16

Image: Network Pump [8]

Detecting Covert Timing Channels
Ø Use Bro to identify potential CTC flows, then report and selectively disrupt. Ø Focus as much as possible on Bro to maintain portability of code with low barrier to entry for other organizations
Ø Monitor the incoming traffic's interpacket delays (IPDs).
Ø Compare the IPD distribution with expected values for legitimate traffic.

36

9/23/16

Types of Detection Tests
· Shape Tests ­ Measures the first-order statistics · Ex: Shannon Entropy
· Regularity Tests ­ Measures second-order and higher statistics · Ex: Corrected-Conditional Entropy

37

9/23/16

Common Detection Tests [1][5]

· Shannon Entropy (EN) · Corrected-Conditional Entropy (CCE) · Kullback-Liebler Divergence (KLD) · Kolmogorov-Smirnov Test (KST)

EN CCE KLD KST

IPCTC
Good Good Good Good

TRCTC Jitterbug

Poor Good Poor Poor

Good Poor Poor Poor

MBC TC Fair Good Poor Poor

38

9/23/16

Source: model-based detection [5]

Detection Test Implementation

39

9/23/16

Training Data
· Record legitimate IPDs using Bro · Ex: 200,000 HTTP IPDs, 75,000 SSH
IPDs · Used to create a 5-bin histogram
representing the expected traffic distribution. · IPDs are sorted, then divided into 5 equally sized group. · Cutoff values determining bin ranges. · Use different bins for each application for best results.

40

9/23/16

Source: model-based detection

Bro Policy Script
1. Check if a flow's size is large enough to test. 2. If so, add it to a table of flows. 3. For each new packet in those flows, get the IPD and assign a bin value between 1 and 5. 4. Once a flow has 2000 IPDs, perform the detection tests using the bin distribution. 5. Record the results in a log file.

41

9/23/16

Creating Sample CTCs
· IPCTC, TRCTC, and Jitterbug channels were created using Expect scripts to automate SSH keystrokes.
· For MBCTC, actual traffic traces injected with CTCs were used.
· Additional CTCs planned ­ iTRCTC, Liquid, Mimic.

42

9/23/16

IPCTC Script
· IPCTC = Basic ON/OFF channel · Script connects to receiver using
SSH, and sends a sequence of bits. · To send 1-bit, keystroke is generated
during a 100ms interval. · To send 0-bit, no keystroke is
generated during the interval.

43

9/23/16

TRCTC Script
· TRCTC mimics legitimate traffic by replaying from two recorded IPD sets.
· Recorded SSH IPDs on development system using a Bro script.
· To send a 0-bit, replay from the set of IPDs below a given time threshold.
· To send a 1-bit, replay from the set of IPDs above a given time threshold.

44

9/23/16

Jitterbug Script
· Jitterbug adds small delays to each keystroke to embed CTCs.
· To send a 1-bit, IPD modulo W != 0. · To send a 0-bit, IPD modulo W = 0. · Expect script uses W = 20ms, sends
keystrokes with IPDs either multiples of 10 or 20.

45

9/23/16

MBCTC Samples
· Traffic recorded on OC-192 link in San Jose. [12]
· 10% of large flows were replaced with MBCTCs flows.
· Channel embedded using exponential or pareto distributions.
· Replay the capture using tcpreplay. [11]

46

9/23/16

Detection Results

· CTCs were created using SSH and Average EN

HTTP.

Scores

CCE KST KLD

· Average entropy scores for CTC

Legit 0.42 0.37 0.33 0.49

flows are lower than legitimate flows. IPCTC 0.071 0.062 0.77

1.45

· Larger distances from expected

TRCTC 0.40 0.13 0.41 0.69

distributions => Larger KST and KLD

scores.

Jitterbug 0.18 0.17 0.66 1.20

47

9/23/16

Table: SSH channel scores, bold indicates successful detection

Performance
· CCE test is most reliable, but also most expensive.
· Worker packet loss more than doubles using CCE test.
· No significant increase in packet loss without CCE test.

48

9/23/16

Conclusion
· CTC detection can be efficiently implemented in Bro.
· Detection tests performed mostly as expected.
· Different thresholds are required for different applications for best results.
· CCE Test is most effective, but increases packet loss.

49

9/23/16

Future Work
· More detection tests. · More types of CTCs. · Reduce packet loss rate. · Improve scaling by copying or
`shunting' long flows to a designated Bro box to collect needed IPDs · Combine with GPU to perform expensive tests (CCE).
· We need your help! ­ ESnet doesn't have much to covertly transmit.

50

9/23/16

References
1. R. Archibald and D. Ghosal. A comparative analysis of detection metrics for covert timing channels. Computers & Security, 2014. 2. S. Cabuk. Network covert channels: Design, analysis, detection, and elimination. Ph.D. dissertation, Purdue University, West Lafayette, IN., USA, 2006. 3. S. Cabuk, C. Brodley, and C. Shields. Ip covert timing channels: Design and detection. Proceedings of the 2004 ACM Conference on Computer and Communications Security, 2004. 4. M. Caetano, P. Vieira, J. Bordim, and P. Barreto. International journal of computer science and network security. International Journal of Computer Science and Network Security, vol. 10, pp. 1320, August, 2010 5. S. Gianvecchio and H. Wang. An entropy-based approach to detecting covert channels. In IEEE Transactions on Dependable and Secure Computing, Vol. 8, No. 6, 2011. 6. M. Guinther. Multi-core network acceleration: Breakthrough networking performance with optimized software for multi-core processors. Wind River Systems, Inc., 2010. 12 Anonymous.

51

9/23/16

References
7. W.-M. Hu. Reducing timing channels with fuzzy time. Journal of Computer Security 1.3, 1992: 233-254, 1992. 8. M. H. Kang, I. Moskowitz, and S. Chincheck. The pump: A decade of covert fun. Computer Security Applications Conference, 21st Annual, IEEE, 2005. 9. K. Kothari. Mimic: An active covert channel that evades regularity-based detection. Comput. Netw., vol. 57, no. 3, 2013. 10. K. S. Lee, H. Wang, and H. Weatherspoon. Phy covert channel: Can you see the idles. USENIX symposium on Networked Systems Design and Implementation (NSDI), April, 2014. 11. tcpreplay developers. tcpreplay website. http: // tcpreplay. synfin. net/ trac/ wiki/ tcpreplay. , 2014. 12. CAIDA. CAIDA Data. http: // www. caida. org/ data/ overview/ , 2014

52

9/23/16

