BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Towards Large-Scale Exploitation of Cisco IOS
Ang Cui Ang@cs.columbia.edu
Columbia University Intrusion Detection Systems Lab
Prof. Salvatore J. Stolfo | sal@cs.columbia.edu Jatin Kataria | jk3319@columbia.edu
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Prior Work
FX, 2003 Lynn, 2005 Uppal, 2007 Davis, 2007 Muniz, 2008
FX, 2009 Muniz and Ortega, 2011

Not comprehensive, but is a good start

BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Motivation
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Motivation
Cisco IOS is a high value target
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Motivation
Cisco IOS is a high value target Cisco IOS is lundefendedz
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Motivation
Cisco IOS is a high value target Cisco IOS is lundefendedz
Cisco IOS is lunmonitoredz
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Motivation
Cisco IOS is a high value target Cisco IOS is lundefendedz
Cisco IOS is lunmonitoredz Cisco IOS can be exploited, just like everything else
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Motivation
But there the problem of software diversity
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Motivation
But there the problem of software diversity Approximately 300,000 unique IOS images No reliable binary invariant
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Motivation
But there the problem of software diversity Approximately 300,000 unique IOS images No reliable binary invariant
The (last) major obstacle in large-scale IOS exploitation
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity Reliable Shellcode
· IOS Diversity means Binary Diversity
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity Reliable Shellcode
· IOS Diversity means Binary Diversity, not functional diversity
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Reliable Shellcode
· IOS Diversity means Binary Diversity, not functional diversity · In fact, IOS is rich in Functional invariants
· For example:
Functional monoculture in every box!
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Reliable Shellcode
· General strategy to overcome IOS diversity · Use functional invariants to resolve binary targets · For example: (see FX, 2009)

.text

.data
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Reliable Shellcode
· General strategy to overcome IOS diversity · Use functional invariants to resolve binary targets · For example: (see FX, 2009)

"%Bad Secrets"

.text

A: str
.data
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Reliable Shellcode
· General strategy to overcome IOS diversity · Use functional invariants to resolve binary targets · For example: (see FX, 2009)

"%Bad Secrets"

B: xref
.text

A: str
.data
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Reliable Shellcode
· General strategy to overcome IOS diversity · Use functional invariants to resolve binary targets · For example: (see FX, 2009)

f_chkpswd (win!) "%Bad
Secrets"

B: xref
.text

A: str
.data
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Disassembling Shellcode #1
· There is a catch (called the watchdog timer)
Compute too long, and you will get caught! Shellcode is heavily resource constrained,. Must resolve binary target using fast, (sub)linear algorithms.
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity Interrupt-Hijack Shellcode
· Let`s kill 3 birds with one stone
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity Interrupt-Hijack Shellcode
· Let`s kill 3 birds with one stone · Faster · enable-bypass shellcode: 2n algorithm · Interrupt-hijack shellcode: twice as fast
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Interrupt-Hijack Shellcode
· Let`s kill 3 birds with one stone · Faster · Stealthier · Enable-bypass, vty rebind, etc requires persistent TCP connection · Interrupt-Hijack uses the payload of process-switched packets as a covert command and control channel · C&C is bidirectional thanks to IOMEM scrubber
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Interrupt-Hijack Shellcode
· Let`s kill 3 birds with one stone · Faster · Stealthier · More Control · No need to be constrained by IOS shell · Rootkit runs @ supervisor mode. We can even write to eeprom (See last slide)
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity Interrupt-Hijack Shellcode
· 1st stage:

.text

...
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity Interrupt-Hijack Shellcode
· 1st stage: Unpack 2nd stage

2nd-stage code

.text

$GP ...
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity Interrupt-Hijack Shellcode
· 1st stage: Unpack 2nd stage, hijack all int-handlers

---...///$$$000,,,,,,111***3!2 --..//$$00,,,,11**45 !"#$%&'()*+,#)

!"#$"

!"#

%!!!

%%

BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Interrupt-Hijack Shellcode
· 1st stage: Unpack 2nd stage, hijack all int-handlers, compute hash on addresses of "ERET" instructions (why?)

2nd-stage code

checksum: 0x3e27f3de
.text

$GP ...
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity Interrupt-Hijack Shellcode

· 2nd-stage: Exception Hijack and IOMEM snooping · the (mips) ERET, or

Exception-Return is an

ISR #1

ISR #2

ISR #3 ... ISR #N

architecture invariant

2nd-stage shellcode: init
IOMEM Packet Scrubber

Load Code Execute Code Exfiltrate Data

· ISR entry point is a binary invariant, typically found at 0x600080180, etc
· Can just hijack entry point, but there is an ulterior motive
· Use ERET locations in the image to fingerprint IOS version

2nd-stage shellcode: exit

eret

Interrupt-Hijack shellcode frees us from the tyrannies of the watchdog timer.
Perpetual, stealthy execution!

BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity

Int-Hijack Shellcode: Fingerprint Exfiltration

RX Queue
icmp request

Victim Router

TX Queue
icmp reply

Interrupt Hijack
Shellcode
1: Attacker sends ICMP request with magic pattern in
payload.

Attacker

· icmp is convenient, but
any lprocess-switchedz packet will suffice · c&c inside payload of lnormalz traffic · Complex third-stage payloads can be assembled in a lprotocol-spreadspectrumz manner · PING, DNS, PDUs, TCP, all the same as long as it is process-switched
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity

Int-Hijack Shellcode: Fingerprint Exfiltration

Victim Router

RX Queue

2: Packet data copied to IOMEM.

icmp request

Packet Data

TX Queue
icmp reply

Interrupt Hijack
Shellcode
1: Attacker sends ICMP request with magic pattern in
payload.

Attacker

· icmp is convenient, but
any lprocess-switchedz packet will suffice · c&c inside payload of lnormalz traffic · Complex third-stage payloads can be assembled in a lprotocol-spreadspectrumz manner · PING, DNS, PDUs, TCP, all the same as long as it is prcoess-switched
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity

Int-Hijack Shellcode: Fingerprint Exfiltration

Victim Router

RX Queue

2: Packet data copied to IOMEM.

icmp request

Packet Data

...magic-pattern...

Interrupt Hijack
Shellcode

{Exfiltrated Data}
3: Shellcode locates magicpattern, overwrites payload with exltrated data.

1: Attacker sends ICMP request with magic pattern in
payload.

Attacker

TX Queue
icmp reply

· icmp is convenient, but
any lprocess-switchedz packet will suffice · c&c inside payload of lnormalz traffic · Complex third-stage payloads can be assembled in a lprotocol-spreadspectrumz manner · PING, DNS, PDUs, TCP, all the same as long as it is prcoess-switched
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity

Int-Hijack Shellcode: Fingerprint Exfiltration

Victim Router

RX Queue

2: Packet data copied to IOMEM.

icmp request

Packet Data

...magic-pattern...

TX Queue
icmp reply

Interrupt Hijack
Shellcode

{Exfiltrated Data}
3: Shellcode locates magicpattern, overwrites payload with exltrated data.

4: ICMP request serviced by CPU. Packet Data linked to TX Queue.

1: Attacker sends ICMP request with magic pattern in
payload.

Attacker

· icmp is convenient, but
any lprocess-switchedz packet will suffice · c&c inside payload of lnormalz traffic · Complex third-stage payloads can be assembled in a lprotocol-spreadspectrumz manner · PING, DNS, PDUs, TCP, all the same as long as it is prcoess-switched
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity

Int-Hijack Shellcode: Fingerprint Exfiltration

Victim Router

RX Queue

2: Packet data copied to IOMEM.

icmp request

Packet Data

...magic-pattern...

TX Queue
icmp reply

Interrupt Hijack
Shellcode

{Exfiltrated Data}
3: Shellcode locates magicpattern, overwrites payload with exltrated data.

4: ICMP request serviced by CPU. Packet Data linked to TX Queue.

1: Attacker sends ICMP request with magic pattern in
payload.

l0lz ;)

5: Exltrated data sent via ICMP
response back to attacker. Win!

· icmp is convenient, but
any lprocess-switchedz packet will suffice
· c&c inside payload of lnormalz traffic
· Complex third-stage payloads can be assembled in a lprotocol-spreadspectrumz manner
· PING, DNS, PDUs, TCP, all the same as long as it is prcoess-switched
runtime fingerprint gives us positive ID on the victim router's hardware platform and IOS version!
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity Reliable Shellcode
· General strategy to overcome IOS diversity · Use functional invariants to resolve binary targets · IOS Diversity is (very) finite · How do you defeat address space randomization?
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Reliable Shellcode
· General strategy to overcome IOS diversity · Use functional invariants to resolve binary targets · IOS Diversity is (very) finite · How do you defeat ASR if there are ONLY 300,000 possible permutations?
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Reliable Shellcode
· General strategy to overcome IOS diversity · Use functional invariants to resolve binary targets · IOS Diversity is (very) finite · How do you defeat ASR if there are ONLY 300,000 possible permutations? · Build a lookup table!
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity

Generalized reliable exploitation of IOS (in 4 simple steps)

Phase 1.a exercise exploit
Attacker

Victim IOS Device

1.a: exploit vulnerability, load and run 1st stage erethijack rootkit (~400 bytes,
pic, will run anywhere)

IOS Database

BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity

Generalized reliable exploitation of IOS (in 4 simple steps)

Phase 1.b

Attacker

exltrate ngerprint

Victim IOS Device

1.a: exploit vulnerability, load and run 1st stage erethijack rootkit (~400 bytes, pic, will run anywhere)
1.b: 1st stage code locates/ hijacks all eret instructions, exfiltrate hash (fingerprint) of eretaddrs back to attacker (via ICMP, etc)

IOS Database

BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity

Generalized reliable exploitation of IOS (in 4 simple steps)

Attacker
Phase 2.a ID Victim Router

Victim IOS Device

IOS Database

1.a: exploit vulnerability, load and run 1st stage erethijack rootkit (~400 bytes, pic, will run anywhere)
1.b: 1st stage code locates/ hijacks all eret instructions, exfiltrate hash (fingerprint) of eretaddrs back to attacker (via ICMP, etc)
2.a: Attacker consults offline IOS fingerprint database, makes positive ID (hardware platform, ios version)

BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity

Generalized reliable exploitation of IOS (in 4 simple steps)

Attacker IOS Database

Victim IOS Device
Phase 2.b (WIN!)

1.a: exploit vulnerability, load and run 1st stage erethijack rootkit (~400 bytes, pic, will run anywhere)
1.b: 2st stage code locates/ hijacks all eret instructions, exfiltrate hash (fingerprint) of eretaddrs back to attacker (via ICMP, etc)
2.a: Attacker consults offline IOS fingerprint database, makes positive ID (hardware platform, ios version)
2.b: Construct version dependent 3rd stage payload. Upload using 2nd stage c&c (again, using ICMP, etc)... WIN!
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
3rd Stage Payloads!
· More demos · Third-stage payloads to:
· Disable IOS integrity verification command lshow sumz · Disable password authentication · Remote Bricking of router motherboard
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity

Sacrifice

to the Demo

Remotely bricking router using 3rd-stage payload over
ICMP!

Gods

BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity What`s Next (Offensive)?
· More comprehensive fingerprint database
· ~3,000 images in the fingerprint DB. Roughly 1% coverage.
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
What`s Next (Offensive)?
· More comprehensive fingerprint database
· ~3,000 images in the fingerprint DB. Roughly 1% coverage. · EEPROM resident malware · Current Rootkit will not survive IOS update · Better to live in EEPROM
· Line cards · Network modules · Motherboard EEPROM
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
What`s Next (Offensive)?
· More comprehensive fingerprint database
· ~3,000 images in the fingerprint DB. Roughly 1% coverage.
· EEPROM resident malware · Current Rootkit will not survive IOS update · Better to live in EEPROM · Line cards · Network modules · Motherboard EEPROM
· Lawful Intercept Hijacking, routing shenanigans, be creative!
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
What`s Next (Defensive)?
· Software Symbiotes · Generic Host-based Defense for Embedded Devices. · lDefending Legacy Embedded Systems with Software Symbiotesz ·To Appear in RAID 2011. Look out!
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity What`s Next (Defensive)?
· Cisco IOS Rootkit Detectors · Runs on Real Cisco Iron · deployed in real networks · Will catch real IOS malware
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
What`s Next (Defensive)?
· Cisco IOS Rootkit Detectors · Runs on Real Cisco Iron · deployed in real networks · Will catch real IOS malware · A friendly shootout to test our defenses? -) · Please contact us!
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
Answers!
· Feel free to contact us · {ang|sal}@cs.columbia.edu
· Please checkout our publications and ongoing research · http://ids.cs.columbia.edu
· This work was partially supported by: · DARPA Contract, CRASH Program, SPARCHS, FA8750-10-2-0253 · Air Force Research labs under agreement number FA8750-09-1-0075
BlackHat Briefings USA 8.3.2011

BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity Backup slides
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity

Disassembling Shellcode #1

· Originally presented by Felix Linder

Somewhere in every IOS image...

Flag = passwordisright()
If (flag!=0){ rootme()
} Else {
printf(lbad secrets ­(l) }

!"#$%&'() *+,-)./0#102'*

,4.510!
!"#$"

34.'21
%!&'"'

BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity

Disassembling Shellcode #1

· Originally presented by Felix Linder

Somewhere in every IOS image...

Flag = 1
If (flag!=0){ rootme()
} Else {
printf(lbad secrets ­(l) }

!"#$%&'() *+,-)./0#102'*

,4.510!
!"#$"

34.'21
%!&'"'

BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity

0x00 - 0xff

Comparison of potential fingerprint features

Distribution of "Bad Secrets" string x-ref in IOS (32-bit memory space)

250

200

150

100

50

0 4000

3000

2000

1000

0x000 - 0xfff

00

1000

2000

3000

0x000 - 0xfff

4000

· Fairly random, can be used to fingerprint IOS
· a single feature fingerprint
· One firmware, one address
· Potential for collision higher than the next option

BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity

0x00 ï 0xff

Comparison of potential fingerprint features

Distribution of ERET instruction in IOS (32ïbit memory space)

· Concentrated in a predictable range in IOS memory

250

200

150

100

50

0 4000

3000

2000

1000

0x000 ï 0xfff

00

1000

2000

3000

0x000 ï 0xfff

4000

· yet diverse enough to uniquely identify unknown firmware version
· Also needed in 2nd stage rootkit, kill 2 birds with one stone
· In our opinion, a pretty good target, but there are many others.
· multi-vector feature. Each image contains approximately 6-30 eret instructions.

BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
The basic idea
· Reduce (binary) diverse target to a (functional) monoculture · Take advantage of offline processing
· Use a two-phase attack · Build a database of device fingerprints · Macro-ize 3rd stage payloads, generate device specific payloads on the fly
BlackHat Briefings USA 8.3.2011

Killing the Myth of Cisco IOS Diversity
For example
Dotplot of two minor revisions of 12.4 IOS images for the same hardware
IOS 12.4-23b vs 12.4-12 Cisco 7200 / NPE-200
BlackHat Briefings USA 8.3.2011

