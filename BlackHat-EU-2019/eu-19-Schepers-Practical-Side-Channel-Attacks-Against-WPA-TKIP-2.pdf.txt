Practical Side-Channel Attacks against WPA-TKIP
Domien Schepers
In collaboration with Aanjhan Ranganathan and Mathy Vanhoef.
2019 Black Hat Europe

Brief Wi-Fi History

WPA Temporal Key Integrity Protocol (TKIP)

WPA3

Wired Equivalent Privacy (WEP)

WPA2 Counter Mode CBC-MAC Protocol (CCMP)

1999

2003

2004

2018

Allows backwards compatibility with WPA-TKIP as well.
2

Why are we interested in TKIP?
· Not marked as obsolete by the IEEE.
 · Commercial products sold today still support WPA-TKIP.
 · We still see a large support rate for WPA-TKIP in our Wi-Fi surveys.
3

Wi-Fi Survey
· Survey across several countries show a large support for WPA-TKIP.
 · On average 44.81% of networks support TKIP in its Group Cipher.
5

Wi-Fi Survey

Slide 5

· Survey across several countries shows a large support for WPA-TKIP.
 · On average 44.81% of networks supported TKIP in its Group Cipher.

· Hasselt (Belgium) averages around ~58%.
 · Leipzig (Germany) averages around ~28%.
6

Outline
· Background on WPA-TKIP and existing attacks.
 · Presentation of our side-channel attacks.

· Tested against Linux and OpenBSD, MediaTek and Broadcom devices.
 · Demonstration.
 · Conclusion.
7

Background.

TKIP Header
· Michael MIC provides better integrity protection than the ICV.
 · Covers plaintext data, destination and source address, and priority. 
 · Added to the last fragment.

· TKIP Sequence Counter (TSC) for replay protection.
9

TKIP Countermeasures
· Michael MIC is invertible (Wool, 2004).
 · Countermeasures state what to do if an invalid Michael MIC is received.

· Client transmits a "Michael MIC Failure Report".
 · Access Point blocks TKIP traffic if two are received in one minute.
 · After one minute, clients may reassociate and negotiate fresh keys.
10

Quality of Service
· Defined in the IEEE 802.11e amendment (2005).
 · Provides eight different channels for different QoS needs.

· Michael MIC covers this channel number (i.e. priority).
 · TKIP Sequence Counter (TSC) for each channel.
 · For example, used when making phone calls over Wi-Fi.
11

The ChopChop Attack
· The ChopChop attack originally targeted WEP (KoreK, 2004).
 · Repeatedly chop off the last byte, and make corrections for the ICV.

· Due to CRC linearity, ICV can be reconstructed if plaintext is known.
 · Beck and Tews presented a ChopChop attack against WPA-TKIP (2009).
12

13

Chopped Byte.
14

Chopped Byte. Guess for all 256 plaintext values of chopped-off byte.
15

Chopped Byte. Guess for all 256 plaintext values of chopped-off byte. Invalid message, if ICV Correction guessed incorrectly.
16

Chopped Byte. Guess for all 256 plaintext values of chopped-off byte. Valid message, if ICV Correction guessed correctly.
17

Chopped Byte.
Guess for all 256 plaintext values of chopped-off byte.
Valid message, if ICV Correction guessed correctly. We now successfully decrypted the chopped-off byte!
18

How to detect a valid ICV Correction?
That is, having correctly guessed the plaintext value.

How to detect a valid ICV Correction?
That is, having correctly guessed the plaintext value.
Side-Channels!

Side-Channels
· We want side-channels allowing us to detect if a TKIP frame is accepted.
 · Can we craft TKIP frames that influence the state of its receiver?
 · If so, can we find a way to detect the state change?

· We will analyze WPA-TKIP implementations to find such side-channels.
 · Allowing us to perform a ChopChop-like attack.
21

Methodology
· Inspect full Wi-Fi stack, looking for:
 · Implementation of countermeasures.
 · Side-channel vulnerabilities.
 · Logical bugs.
22

Results
· Our approach resulted in novel (cross-layer) side-channel vulnerabilities.
 · Making use of some of the following features:

· Power Management.
 · Fragmentation.
 · Hardware Decryption.
23

Power Management
· IEEE 802.11e defines power save delivery and notification mechanisms.
 · E.g., Unscheduled Automatic Power Save Delivery (U-APSD).
 · E.g., Block Acknowledgements.

· Clients can indicate going to sleep, and wake up any time:
 · Requesting new data using a Power Save Poll (PS-Poll) frame.
24

Power Management
Setting power-management flag in its Frame Control (FC) field.
25

Power Management
Setting power-management flag in its Frame Control (FC) field.
26

Power Management
27

Power Management
· Side-channels may abuse these power management features:
 · Spoofing target client to enter Power Save mode, then request data.

· Affects Linux kernel version 3.11 and lower.
 · Devices supporting WPA-TKIP are arguably running on older versions.
 · We will soon see another side-channel for newer kernel versions.
28

Power Management Side-Channel
MITM is not required.
30

Power Management Side-Channel
Set Power Management bit: we want AP to enter PS-mode.
31

Power Management Side-Channel
Set Power Management bit: we want AP to enter PS-mode. Set Fragmentation Number: bypasses Michael MIC verification.
32

Power Management Side-Channel
Set Power Management bit: we want AP to enter PS-mode. Set Fragmentation Number: bypasses Michael MIC verification. Change QoS Traffic ID (TID): bypasses TSC verification.
33

Power Management Side-Channel
Set Power Management bit: we want AP to enter PS-mode. Set Fragmentation Number: bypasses Michael MIC verification. Change QoS Traffic ID (TID): bypasses TSC verification. If ICV constructed correctly, the AP will enter PS-mode.
34

Power Management Side-Channel
Power-Save Poll: request buffered data.
35

Power Management Side-Channel
Failure: AP did not enter PS-mode.
36

Power Management Side-Channel
Success: AP entered PS-mode.
37

Attacker modifications to replayed frame.

Success: client registered in PS-mode.

Power Management
· Bypasses all existing TKIP Countermeasures.
 · E.g. Michael MIC Failure Reports, increased rekeying interval.

· Recovers the Michael MIC key (message authentication) in 1 to 4 minutes.
 · Much faster than previous attacks, needing 7 to 8 minutes. 
 · Due to not relying on TKIP's Michael MIC Failure Reports.
42

Fragmentation
· Side-Channel abuses fragmentation features in MediaTek devices.
 · Fragmented WPA-TKIP frame with valid ICV clears fragmentation cache.

· If the ICV is wrong, the frame is silently dropped (cache unaffected).
 · If the ICV is correct, the cache is cleared (cache affected).
 · Proof-of-Concept with fragmented ARP-Request.
43

Fragmentation Side-Channel
Fragmented message, e.g. ARP-Request.
44

Fragmentation Side-Channel
Set Fragmentation Number: bypasses Michael MIC verification. Change QoS Traffic ID (TID): bypasses TSC verification.
45

Fragmentation Side-Channel
Set Fragmentation Number: bypasses Michael MIC verification. Change QoS Traffic ID (TID): bypasses TSC verification. If ICV constructed correctly, the AP will clear fragment cache.
46

Fragmentation Side-Channel
Dropped or reassembled, depending on fragment cache.
47

Fragmentation Side-Channel
Failure: AP did not clear cache.
48

Fragmentation Side-Channel
Success: AP cleared cache.
49

Hardware Decryption
· Investigate the hardware decryption features of Wi-Fi chips.
 · Some drivers drop incoming frames if hardware decryption failed.

· For example, due to an incorrect ICV.
 · Frames only forwarded if ICV is correct, potentially leaking information.
50

Return of Power Management
· Hardware decryption performed before OS handles power management.
 · Flags inspected only when hardware decryption succeeded.

· Works against Linux 3.12 and higher if hardware decryption is enabled.
 · Unlike previous side-channel, which worked on Linux 3.11 and lower.
51

Return of Power Management Side-Channel
Dropped if ICV is incorrect.
52

Return of Power Management Side-Channel
Same technique as earlier.
53

Return of Power Management Side-Channel
Failure: AP did not enter PS-mode.
54

Return of Power Management Side-Channel
Success: AP entered PS-mode.
55

Hardware Decryption
· Investigation reveals several new (similar) side-channels and attacks.
 · Linux Power Management, Retransmission Detection.
 · OpenBSD Block Acknowledgement, Fragment and Replay Attack.

· See our white paper for more details.
56

Let's Summarize: - We can decrypt frames. - Numerous Side-Channels.

Cool! Now, what is the impact?

Recall TKIP Header
Slide 9
· We now have a means for decrypting one byte at a time.
 · Decrypting the last 12-bytes of a frame reveals the Michael MIC and ICV.

· Recovers Michael MIC key since the algorithm is invertible (Wool, 2004).
59

We want more keystream!
· Allows us to inject messages.
 · Michael MIC recovered after first message.

· Then, an adversary needs to decrypt the last 4-bytes (ICV) only.
 · Quickly learn keystream by making educated guesses for data contents.

· E.g., most bytes of an ARP-Reply are known thus brute-forced quickly.
60

Impact
· We have now obtained keystream and the Michael MIC key.
 · Allows us to decrypt, and inject, network traffic:

· The Michael MIC key can be used for decryption using a Michael Reset
Attack (Vanhoef et al, 2013).

· Forged messages are injected into QoS channels with a lower TSC
(Tews et al, 2009; Vanhoef et al, 2013).
61

How is this an improvement?

Improvements
· We bypass all existing TKIP Countermeasures. 
 · Consequently we do not rely on any of them either.

· E.g., related work relies on Michael MIC Failure Reports.
 · As a result, our decryption techniques are significantly faster.

· Recovery of Michael message authentication key in 1 to 4 minutes.
63

Countermeasures to our Attacks
· Our side-channel attacks bypass all existing countermeasures.
 · E.g., short rekeying interval, delayed or disabled failure reports.

· We can further reduce rekeying interval, or try to fix an outdated protocol:
 · E.g., software changes to process reassembled frames only.

·
64

Countermeasures to our Attacks
· Our side-channel attacks bypass all existing countermeasures.
 · E.g., short rekeying interval, delayed or disabled failure reports.

· We can further reduce rekeying interval, or try to fix an outdated protocol:
 · E.g., software changes to process reassembled frames only.

· Or... let us simply disable WPA-TKIP and move on to better protocols.
65

What about WPA2-CCMP?

CTR mode with CBC-MAC Protocol
· WPA2 with CCMP uses an AES block cipher in counter mode.
 · CCMP MIC (CBC-MAC) is calculated over every frame.

· Unlike TKIP MIC, where Michael MIC is transmitted in the last fragment.
 · CCMP MIC is not known to be invertible.

· Unlike TKIP's Michael MIC (Wool, 2004).
 · CCMP has no ICV.
67

CTR mode with CBC-MAC Protocol
· Immediately verifies for data integrity and data origin authentication.
 · Unlike TKIP, which for example carries Michael MIC in last fragment.

· Our side-channels work against WPA-TKIP because:
 · Operations are performed on decrypted but unauthenticated data.
 · Decrypted frames are processed before being reassembled.
68

Demonstration.
https://github.com/domienschepers/asiaccs-practical-side-channel

Slide 37 70

Failure: client not registered in PS-mode.

Success: client registered in PS-mode.

Failure: client not registered in PS-mode.

We decrypted the previous byte, so we can chop off another one.

Conclusion
· Large support for WPA-TKIP.
 · We found several novel side-channels in WPA-TKIP implementations.

· Implementing WPA-TKIP without side-channel vulnerabilities is hard.
 · We should do more cross-layer analysis to find vulnerabilities. 
 · Hopefully we accelerate the process of deprecating support for WPA-TKIP.
 ·
76

Conclusion
· Large support for WPA-TKIP.
 · We found several novel side-channels in WPA-TKIP implementations.

· Implementing WPA-TKIP without side-channel vulnerabilities is hard.
 · We should do more cross-layer analysis to find vulnerabilities. 
 · Hopefully we accelerate the process of deprecating support for WPA-TKIP.
 · RECOMMENDATION: Abandon WPA-TKIP, and move towards WPA3.
77

THANK YOU
Happy to answer your questions.

Practical Side-Channel Attacks against WPA-TKIP
2019 Black Hat Europe

@domienschepers

