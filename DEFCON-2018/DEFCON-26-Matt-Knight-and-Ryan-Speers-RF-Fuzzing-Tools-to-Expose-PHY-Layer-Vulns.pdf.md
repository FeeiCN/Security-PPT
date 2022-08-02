RF Fuzzing // River Loop Security
Designing RF Fuzzing Tools to Expose PHY Layer Vulnerabilities
Matt Knight, Ryan Speers DEF CON
River Loop Security

whois
Matt Knight
· Senior Security Engineer at Cruise Automation
· RF Principal at River Loop Security · BE in EE from Dartmouth College · Software, hardware, and RF engineer · RF, SDR, and embedded systems
2

RF Fuzzing // River Loop Security
Ryan Speers
· Co-founder at River Loop Security · Director of Research at Ionic Security · Computer Science from Dartmouth College · Cryptography, embedded systems, IEEE
. . , automated firmware analysis
River Loop Security

Background

RF Fuzzing // River Loop Security

"Making and Breaking a Wireless IDS", Troopers "Speaking the Local Dialect", ACM WiSec
· Ryan Speers, Sergey Bratus, Javier Vazquez, Ray Jenkins, bx, Travis Goodspeed, & David Dowd · Idiosyncrasies in PHY implementations
Mechanisms for automating: · RF fuzzing · Bug discovery · PHY FSM fingerprint generation

3

Agenda

RF Fuzzing // River Loop Security

Overview of traditional fuzzing techniques (software and networks)
> How these do and don't easily map to RF
RF fuzzing overview and state of the art Ideal fuzzer design TumbleRF introduction and overview TumbleRF usage example Introducing Orthrus

4

RF Fuzzing // River Loop Security
Traditional Fuzzing Techniques

What is fuzzing?

RF Fuzzing // River Loop Security

Measured application of pseudorandom input to a system
Why fuzz? · Automates discovery of crashes, corner cases, bugs, etc. · Unexpected input  unexpected state

6

What can one fuzz?

RF Fuzzing // River Loop Security

Fuzzers generally attach to system interfaces, namely I/O: · File format parsers · Network interfaces · Shared memory

7

Software Fuzzing State of the Art RF Fuzzing // River Loop Security
Abundant fully-featured software fuzzers · AFL / AFL-Unicorn · Peach · Scapy Software is easy to instrument and hook at every level What else can one fuzz?
8

RF Fuzzing // River Loop Security
Other Applications of Fuzzing

Fuzzing Hardware

RF Fuzzing // River Loop Security

Challenges: · H/W is often unique, less "standard interfaces" to measure on · May not be able to simulate well in a test harness
Some Existing Techniques: · AFL-Unicorn: simulate firmware in Unicorn to fuzz · Bus Pirate: permutes pinouts and data rates to discover digital buses · JTAGulator: permutes pinouts that could match unlocked JTAG ·...

10

Fuzzing RF

RF Fuzzing // River Loop Security

WiFuzz  MAC-focused

. protocol fuzzer

Marc Newlin's Mousejack research
 Injected fuzzed RF packets at nRF USB output

HID dongles while looking for

isotope:  IEEE

. . PHY fuzzer

11

Existing RF Fuzzing Limitations

RF Fuzzing // River Loop Security

RF fuzzing projects are siloed / protocol-specific  COTS radio chipsets  Generally limited to MAC layer and up
RF state is hard to instrument  What constitutes a crash / bug / etc?
Implicit trust in chipset ­ one can only see what one's radio tells you is happening

12

Trust and Physical Layer VulnerabilitieRFsFuzzing // River Loop Security
Not all PHY state machines are created equal! Radio chipsets implement RF state machines differently · Differences can be fingerprinted and exploited · Initial results on . . were profound · Specially-crafted PHYs can target certain chipsets while avoiding
others
13

RF Fuzzing // River Loop Security
RF PHYs: A Primer

How Radios Work

RF Fuzzing // River Loop Security

Transmitter: digital data (bits)  analog RF energy discrete  continuous
Receiver: analog RF energy  digital data (bits) continuous  discrete
Receiving comes down to sampling and synchronization!

15

Digitally Modulated Waveforms

RF Fuzzing // River Loop Security

16

Digitally Modulated Waveforms

RF Fuzzing // River Loop Security

Start of Frame Delimiter (SFD) / Sync Word Preamble
17

Data

RF PHY State Machines

RF Fuzzing // River Loop Security

18

RF PHY State Machines

RF Fuzzing // River Loop Security

19

RF PHY State Machines

RF Fuzzing // River Loop Security
...

20

RF PHY State Machines

RF Fuzzing // River Loop Security

 Shift Register   RF Symbol Value 0 0 0 0 0 0 0 0

Preamble Correlation Value 0 1 0 1 0 1 0 1

XOR Result 0 1 0 1 0 1 0 1

Hamming Distance

4

Hamming Distance  # bits that are different between two values  If , values are equal

When Hamming Distance <= some threshold, a preamble has been detected
21

RF PHY State Machines

RF Fuzzing // River Loop Security

 Shift Register   RF Symbol Value 1 0 0 0 0 0 0 0

Preamble Correlation Value 0 1 0 1 0 1 0 1

XOR Result 1 1 0 1 0 1 0 1

Hamming Distance

5

Hamming Distance  # bits that are different between two values  If , values are equal

When Hamming Distance <= some threshold, a preamble has been detected
22

RF PHY State Machines

RF Fuzzing // River Loop Security

 Shift Register   RF Symbol Value 0 1 0 0 0 0 0 0

Preamble Correlation Value 0 1 0 1 0 1 0 1

XOR Result 0 0 0 1 0 1 0 1

Hamming Distance

3

Hamming Distance  # bits that are different between two values  If , values are equal

When Hamming Distance <= some threshold, a preamble has been detected
23

RF PHY State Machines

RF Fuzzing // River Loop Security

 Shift Register   RF Symbol Value 1 0 1 0 0 0 0 0

Preamble Correlation Value 0 1 0 1 0 1 0 1

XOR Result 1 1 1 1 0 1 0 1

Hamming Distance

6

Hamming Distance  # bits that are different between two values  If , values are equal

When Hamming Distance <= some threshold, a preamble has been detected
24

RF PHY State Machines

RF Fuzzing // River Loop Security

 Shift Register   RF Symbol Value 0 1 0 1 0 0 0 0

Preamble Correlation Value 0 1 0 1 0 1 0 1

XOR Result 0 0 0 0 0 1 0 1

Hamming Distance

2

Hamming Distance  # bits that are different between two values  If , values are equal

When Hamming Distance <= some threshold, a preamble has been detected
25

RF PHY State Machines

RF Fuzzing // River Loop Security

 Shift Register   RF Symbol Value 1 0 1 0 1 0 0 0

Preamble Correlation Value 0 1 0 1 0 1 0 1

XOR Result 1 1 1 1 1 1 0 1

Hamming Distance

7

Hamming Distance  # bits that are different between two values  If , values are equal

When Hamming Distance <= some threshold, a preamble has been detected
26

RF PHY State Machines

RF Fuzzing // River Loop Security

 Shift Register   RF Symbol Value 0 1 0 1 0 1 0 0

Preamble Correlation Value 0 1 0 1 0 1 0 1

XOR Result 0 0 0 0 0 0 0 1

Hamming Distance

1

Hamming Distance  # bits that are different between two values  If , values are equal

When Hamming Distance <= some threshold, a preamble has been detected
27

RF PHY State Machines

RF Fuzzing // River Loop Security

 Shift Register   RF Symbol Value 1 0 1 0 1 0 1 0

Preamble Correlation Value 0 1 0 1 0 1 0 1

XOR Result 1 1 1 1 1 1 1 1

Hamming Distance

8

Hamming Distance  # bits that are different between two values  If , values are equal

When Hamming Distance <= some threshold, a preamble has been detected
28

RF PHY State Machines

RF Fuzzing // River Loop Security

 Shift Register   RF Symbol Value 0 1 0 1 0 1 0 1

Preamble Correlation Value 0 1 0 1 0 1 0 1

XOR Result 0 0 0 0 0 0 0 0

Hamming Distance

0

Hamming Distance  # bits that are different between two values  If , values are equal

When Hamming Distance <= some threshold, a preamble has been detected
29

RF PHY State Machines

RF Fuzzing // River Loop Security

 Shift Register   RF Symbol Value 0 0 0 0 0 0 0 0

Preamble Correlation Value 1 1 1 1 0 0 0 0

XOR Result 1 1 1 1 0 0 0 0

Hamming Distance

4

Repeat the process, correlating for the SFD value instead, to find the start of the PHY
data unit
30

Sync Words and Magic Numbers

RF Fuzzing // River Loop Security

Turns out not all sync words are created equally

· 0x00000000 == 802.15.4 Preamble

· 0xA7

== 802.15.4 Sync Word

The isotope research showed some chipsets correlated on "different" preambles / sync words than others
31

Sync Words and Magic Numbers

RF Fuzzing // River Loop Security

Turns out not all sync words are created equally

· 0x00000000 == 802.15.4 Preamble

· 0xA7

== 802.15.4 Sync Word

strategically malformed

The isotope research showed some chipsets correlated on "different" preambles / sync words than others

32

Sync Words and Magic Numbers

RF Fuzzing // River Loop Security

Turns out not all sync words are created equally

· 0xXXXX0000 == 802.15.4 Preamble

· 0xA7

== 802.15.4 Sync Word

strategically malformed

The isotope research showed some chipsets correlated on "different" preambles / sync words than others
Short preamble?
33

Sync Words and Magic Numbers

RF Fuzzing // River Loop Security

Turns out not all sync words are created equally

· 0xXXXX0000 == 802.15.4 Preamble

· 0xAF

== 802.15.4 Sync Word

strategically malformed

The isotope research showed some chipsets correlated on "different" preambles / sync words than others
Short preamble? Flipped bits in SFD?
34

RF Fuzzing // River Loop Security
Fuzzing Makes Discovery Systematic

RF Fuzzing // River Loop Security
Ideal RF Fuzzer Design

Ideal Features

RF Fuzzing // River Loop Security

Extensible: easy to hook up new radios
Flexible: modular to enable plugging and playing different engines / interfaces / test cases
Reusable: re-use designs from one protocol on another
Comprehensive: exposes PHY in addition to MAC

37

TumbleRF

RF Fuzzing // River Loop Security

TumbleRF

RF Fuzzing // River Loop Security

Software framework enabling fuzzing arbitrary RF protocols
Abstracts key components for easy extension:  Radio API  Test case generation API

39

TumbleRF Architecture

RF Fuzzing // River Loop Security

40

Interfaces

RF Fuzzing // River Loop Security

RF injection/sniffing functions abstracted to generic template To add a new radio, inherit base Interface class and redefine its functions to map to the radio driver:
[set/get]_channel() [set/get]_sfd() [set/get]_preamble() tx() rx_start() rx_stop() rx_poll()

41

Generators

RF Fuzzing // River Loop Security

Rulesets for generating fuzzed input (pythonically) Extend to interface with software fuzzers of your choice
Implement functions:
yield_control_case() yield_test_case()
Three generators currently: · Preamble length (isotope) · Non-standard symbols in preamble (isotope) · Random payloads in message
42

Harnesses

RF Fuzzing // River Loop Security

Monitor the device under test to evaluate test case results Manage device state in between tests
Three handlers currently: · Received Frame Check: listen for given frames via an RF interface · SSH Process Check: check whether processes on target crashed
(beta) · Serial Check: watch for specific output via Arduino (beta)

43

Test Cases

RF Fuzzing // River Loop Security

Coordinate the generator, interface, and harness. Typically very lightweight.

Extend BaseCase to implement run_test() or build upon others, e.g.:

Extend AlternatorCase to implement: does_control_case_pass() throw_test_case()
Alternates test cases with known-good control case to check for crashes / ensure interface is still up
44

TumbleRF Architecture: Demo SetupRF Fuzzing // River Loop Security
45

Example Generated Data: Preamble Length RF Fuzzing // River Loop Security

Standard . . PHY Header == x

+ xA + xLL

46

Example Generated Data: Preamble Length RF Fuzzing // River Loop Security
Modify GNU Radio gr-ieee802-15-4 to omit PHY header 47 Generate arbitrary PHY headers via TumbleRF test case generator

Demo

RF Fuzzing // River Loop Security

Results Dump

RF Fuzzing // River Loop Security

TI CC

Atmel AT RF

Test: preamble_length_apimote.json (using Dot15d4PreambleLengthGenerator)

Test: preamble_length_rzusbstick.json (using Dot15d4PreambleLengthGenerator)

Case 0: 0 valid, 50 invalid

example case: a70a230800ffff000007fba6

Case 0: 0 valid, 50 invalid

example case: a70a230800ffff000007fb

Case 1: 0 valid, 50 invalid

example case: 70aa308220f0ff0f0070d0eafa

Case 1: 0 valid, 50 invalid

example case: 70aa308230f0ff0f007060

Case 2: 45 valid, 5 invalid

example case: 00a70a230804ffff00000757b6

Case 2: 0 valid, 50 invalid

example case: 00a70a230805ffff000007

Case 3: 0 valid, 50 invalid

example case: 0070aa308260f0ff0f007010e0fb

Case 3: 0 valid, 50 invalid

example case: 0070aa308270f0ff0f0070

Case 4: 50 valid, 0 invalid

example case: 0000a70a230808ffff000007a387

Case 4: 0 valid, 50 invalid

example case: 0000a70a230809ffff0000

Case 5: 0 valid, 50 invalid

example case: 000070aa3082a0f0ff0f007050fff8

Case 5: 0 valid, 50 invalid

example case: 000070aa3082b0f0ff0f00

Case 6: 50 valid, 0 invalid

example case: 000000a70a23080cffff0000070f97

Case 6: 37 valid, 13 invalid example case: 000000a70a23080effff00

Case 7: 0 valid, 50 invalid

example case: 00000070aa3082e0f0ff0f007090f5f9

Case 7: 0 valid, 50 invalid

example case: 00000070aa308200f1ff0f

Case 8: 48 valid, 2 invalid

example case: 00000000a70a230810ffff0000074be4

Case 8: 41 valid, 9 invalid

example case: 00000000a70a230813ffff

Case 9: 0 valid, 50 invalid

example case: 0000000070aa308220f1ff0f0070d0c1fe Case 9: 0 valid, 50 invalid

example case: 0000000070aa308250f1ff

TI CC

Test: preamble_length_cc2531.json (using Dot15d4PreambleLengthGenerator)

Case 0: 0 valid, 50 invalid

example case: a70a230800ffff000007fba6

Case 1: 0 valid, 50 invalid

example case: 70aa308220f0ff0f0070d0eafa

Case 2: 13 valid, 37 invalid example case: 00a70a230804ffff00000757b6

Case 3: 0 valid, 50 invalid

example case: 0070aa308260f0ff0f007010e0fb

Case 4: 48 valid, 2 invalid

example case: 0000a70a230808ffff000007a387

Case 5: 0 valid, 50 invalid

example case: 000070aa3082a0f0ff0f007050fff8

Case 6: 50 valid, 0 invalid

example case: 000000a70a23080cffff0000070f97

Case 7: 0 valid, 50 invalid

example case: 00000070aa3082e0f0ff0f007090f5f9

Case 8: 49 valid, 1 invalid

example case: 00000000a70a230810ffff0000074be4

Case 9: 0 valid, 50 invalid
49

example case: 0000000070aa308220f1ff0f0070d0c1fe

3 transceivers 2 manufacturers 1 protocol
3 behaviors!

Why Care?

RF Fuzzing // River Loop Security

Those results can allow for WIDS evasion and selective targeting.

Developing RF Interfaces

RF Fuzzing // River Loop Security

RF Interfaces

RF Fuzzing // River Loop Security

Not all radios can generate arbitrary preambles, SFDs, modulations, packet formats, etc.
PHY manipulation requires:  Software Defined Radio  Transceiver chipset with lots of configurations

52

Software Defined Radio

RF Fuzzing // River Loop Security

Prior example used Software Defined Radio:  GNU Radio and a USRP  gr-ieee802-15-4 is flexible because it's well designed
SDR has some drawbacks:  GNU Radio is complicated and hard to develop for  SDRs are expensive  High latency for host-based DSP  Power hungry: hard to embed

53

Configurable Transceivers
Discrete radio chipsets are purpose built:  Generally speak protocol really well  Band-limited  Low power  Some kind of API
Examples include:

RF Fuzzing // River Loop Security

54

Flexible Transceivers

RF Fuzzing // River Loop Security

Certain discrete transceivers can be flexible, like SDR!
Some radios expose PHY configuration registers:  Preamble length  SFD magic number  Header symbol error tolerance  etc.

55

ApiMote ( / )

RF Fuzzing // River Loop Security

ApiMote, designed by Javier & Ryan, exposed PHY registers in TI CC :
 Preamble length  SFD value  Digital FSM state status pins for low latency injection

Pre-assembled/flashed are available via team@riverloopsecurity.com
56

ApiMote ( / )

RF Fuzzing // River Loop Security

However, the ApiMote needs an update:

 CC

is EOL

 Expensive BOM

 USB issues

CC and others don't have the same degree of PHY configuration, so started looking at other chipsets

57

Enter ADF
Most interesting option: Analog Devices ADF
. GHz . . radio with lots of features:  Several modulations  Lots of configurability  SPORT mode

RF Fuzzing // River Loop Security

58

SPORT Mode?

RF Fuzzing // River Loop Security

Streams demodulated symbols over serial, up to Msps  Bypasses decoding and PHY header / packet framing  We can implement these parts in software
Full control of PHY for most . GHz protocols!

ApiMote . >> . .

59

RF Fuzzing // River Loop Security
Introducing Orthrus

Orthrus ( / )

RF Fuzzing // River Loop Security

Spiritual successor to the ApiMote
Named for -headed dog from Greek mythology  Why? Because Orthrus has two heads!

61

Orthrus ( / )

RF Fuzzing // River Loop Security

NXP LPC

ARM MCU

 Host communication via USB

 Controlling radios

 RF state machine implementation and control

x ADF radios
 ADF has a slow re-tune time
 allows for pre-emptive re-tune!
 can listen while the other sits ready to transmit
 High-speed responsive jamming

62

Initial Prototype
ADF dev board wired to Teensy:

RF Fuzzing // River Loop Security

Custom PCB is in progress
63

Orthrus RF Design Flow

RF Fuzzing // River Loop Security

Implement event loop in firmware Blue-Green frontends for fast retuning / channel hopping
TODO: State machine abstraction language?  e.g. XASM / ASML / SCXML  Implement PHYs via config definitions rather than code

64

Packet-in-Packet Detection

RF Fuzzing // River Loop Security

. . Frame Structure:

PHY Header

PHY Data Unit

Preamble

SFD

Length

Data

CRC

Packet-in-Packet frame structure:

PHY Header

Preamble

SFD

Length

PHY Data Unit

Preamble

SFD

Length

Data

CRC

Traditional radio chipset would see the outer packet only Software-defined decoder in Orthrus can be written to see both

65

Interested? Get Involved!

RF Fuzzing // River Loop Security

Contribute something to TumbleRF: · Generator for some cool new fuzzing idea you have · Harness to check the state of a device you care about testing · Interface to transmit with your favorite radio
Contribute to Orthrus: · Firmware development · State machine abstraction definitions

66

https://github.com/riverloopseRFcFu/zztingu/m/ Rivebr LloeoprSfecurity
Thank You!
DEF CON 26 Crew River Loop Security Cruise Automation
Ionic Security River Loop Security

https://github.com/riverloopseRFcFu/zztingu/m/ Rivebr LloeoprSfecurity
Questions?
@embeddedsec @rmspeers
[matt|ryan]@riverloopsecurity.com River Loop Security

