Orchestrating a fire sale
Bringing Dutch alarm systems to their knees
Wilco Baan Hofman

Wilco Baan Hofman
about me
 Reverse engineer  Working at Nikhef  Free / open source software developer  Co-founder and treasurer of Bitlair

Background
or how I got involved
 Why are alarms only visible at the receiving centre?
 We wanted notifications and logs of all events, not just alarms
 Let's reverse engineer the protocols!

Protocol landscape
or what's out there
 Legacy/Analog:
 ANSI SIA  ANSI X/SIA  Ademco ContactID
 IP:
 SIA-HS (Alphatronics proprietary)  Vebon SecIP (Proposed Dutch standard)  Chiron protocol (Chiron proprietary)  Ademco IP protocol (Pitt/Ademco/Honeywell proprietary)  ANSI/SIA IP DC-09 (USA standard)  VDS 2465-S2 (German standard)

The problem
or how hard is it to crack?
 Fatal assumptions are made  Fatal mistakes are made

Assumption 1
The internet can be secured by certifying ISPs

Assumption 2
Internet source addresses can be trusted

Assumption 3
In a session, every packet is from the same peer

Assumption 4
Nobody can decode obfuscated packets
"... IP protocol fitted with text in a data format with dynamic data encryption which makes it impossible to decipher the message." --- Alphatronics Product Catalog

Assumption 5
If my product is certified, it is secure
"Alphatronics emphasizes that the uncovered vulnerabilities do not influence the product certification."
--- Alphatronics security bulletin to customers

Assumption 6
If nobody knows the protocol format, nobody can decipher the messages

Assumption 7
If my peer speaks the same protocol, it must be valid peer

Assumption 8
Encryption is enough to make a connection secure

Assumption 9
Giving an alarm receiving centre the option to disable encryption will not lead to insecure deployments

Assumption 10
Alarm system electronics engineers can design secure internet protocols

Alarm dialer basics
or what's that word again?
 ATE: Alarm Transmit Equipment  ARC: Alarm Receiving Centre  PROM: Unique account code for a building  ATE sends alarms, ARC sends ACKs  SIA codes
 BA: Burglary Alarm, BR Burglary restore, etc

SIA-HS
or SIA "highly secure"
 Protocol by Alphatronics  Impossible to decipher according to the catalog  Let's see how secure it really is...?

The packet

XOR 0xB6?
#!/usr/bin/env python bytes = bytearray("000000340101c5fff7f5eefa96879881b6b6b6b6b6a4e3b79ab7b6b6b6b 6b6b6b6b6e4f3f1ffe5e2e4f7e2fff9f896e4f3e7e3f3e5e226fd".decode('hex_cod ec')) for i in range(len(bytes)):
bytes[i] ^= 0xB6 print bytes print bytes.encode('hex_codec')

Why? Yes!
sIACXL 1.7U,REGISTRATION REQUESTK b6b6b682b7b773494143584c20312e37000000 00001255012c01000000000000000052454749 5354524154494f4e2052455155455354904b

But wait..

XOR 0x85?
 Yes indeed: RCIPv2.4UREGISTRATION RENEWAL AT PORT 04008o 858585c7848405055243495076322e34000000 00001255001e03840300000000000052454749 5354524154494f4e2052454e4557414c204154 20504f5254203034303038af6f

Recap
 So we have:
 UnXORed packet length  Device name  Decimal PROM number encoded as if it were hex  Message  Checksum

The checksum
 Days of trying different algorithms...
 I tried every known CRC-10 to CRC-16 algorithm  Different preseed values
 But wait..
 longer packets give generally higher checksums
­ ... Must be multiplication or addition
 OMFG? Really!? 16-bit sum of all preceeding bytes
 D'OH!

My implementation
Bitlair's siahsd
 Full SIA-HS ARC implementation  Full Vebon SecIP ARC implementation  Pluggable handlers:
 Database event logging  JSONBOT IRC Event notification
 Chiron IrisTouch implementation in progress

IRC in action

Protocol design
or how to make it secure?
Remember, protocol security requires at least:
 Protection from packet injection  Strong cipher  Identity verification  Forward secrecy

Security
How bad can it be?
 No identity verification  No session protection  Predictable interaction between ARC and ATE
 UDP packet's source easy to spoof
 Predictable PROM codes
 Sequential, True for all protocols

Implications
or what can I do with this?
 Man-in-the-middle  Send false alarms
 ... while remaining anonymous
 Denial of Service on the alarm centre ops  Denial of Service on the police response  Fire Sale?!

SIA-HS Security
The verdict
Everyone can trigger alarms for ALL of the ARC's customers without revealing their own IP

Vebon SecIP
Attempts to do it better
 Handshake:
 RSA 1024 bit, public key sent to the ATE  ATE uses the public key to transfer the AES-128
session key  AES communication channel is up
 Secure, right?

Not really
 If done correctly, there'd be a secure channel  ... but to whom?

Vebon SecIP
The verdict
 No identity verification
 Man in the Middle attack  Send false alarms from anywhere
 Insecure cryptographic padding
 Chosen cipher-text attack
 No forward secrecy
 Have the private key, decrypt entire event history

Responses
Or what happened since the report
 First report for SIA-HS august 2012: no response  First report for SecIP in september 2012: no response  Small scale publication at hitr2ndb  Then in January 2013
 Asked NCSC for help  NCSC assigned a coordinator  Alphatronics asked me to remove publication  Vebon and ENAI responded well, hired Certified Secure and
Pine Security to fix SecIP  Chiron offered a properly configured ARC to aid testing

So what now?
Or how to fix?
 Upgrading all the firmwares
 Mitigating attacks by isolating customers on insecure protocols

Summary
 Code on github: http://github.com/bitlair/siahsd  Ask me for more specs on other protocols!  Give me more dialers with different protocols!

Thank you
 Please check out other projects I'm working on
 Spacefed  Federated authentication for hackerspaces
 Bitlair  Hackerspace Amersfoort  OHM2013  The next big Dutch hacker camp

