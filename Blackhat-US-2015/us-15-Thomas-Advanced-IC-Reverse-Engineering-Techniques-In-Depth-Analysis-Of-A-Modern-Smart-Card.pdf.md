ADVANCED IC REVERSE ENGINEERING TECHNIQUES: IN DEPTH ANALYSIS OF A MODERN SMART CARD
Olivier THOMAS <olivier@texplained.com> Blackhat USA 2015

About Texplained

Texplained
[Technology Explained]
refers to the skill of making sense out of any IC in a black box
situation
Invasive attacks
Invasive attacks are left out of evaluation and certification mainly
because of the extensive resources needed
Whereas Invasive attacks are a major threat as:
· Piracy and counterfeiting have merged · Hackers groups are getting professional
Texplained focuses on performing invasive analysis using the technologies developed in house to perform complicated analysis in a short amount of time

Expertise in Texplained comes from 10 years of active R&D experience
for an independent security research laboratory focused on demanding pay-tv security

2

Overview
Approach

Results

Background

Conclusion
3

Overview
Background
4

Background
Secure Microcontrollers
· This talk will focus on secure microcontrollers. · A secure microcontroller is an Integrated Circuit (IC) with an
integrated CPU, program memory and storage for sensitive data. · Secure microcontrollers are available in different form-factors:
· Smartcards, biometric passports and ID cards · SMD packages for TPMs, uSD, UMMC · Members of a particular product family will share device characteristics.
5

Background
Evaluation
· When it comes to invasive attacks, one can argue that the attack is time and ressource consuming.
· BUT equipment can be rented and / or service labs can provide support
· There is no clearly defined process to study one IC in a reasonable time
· Invasive Attacks are under evaluated
6

Background
Pay Tv
· Pay Tv has been the first market to suffer from heavy piracy
Satellite

Broadcaster

Smartcard

Customer
7

Background
Pay Tv
The problem
A clone of a PayTV subscriber card will have the same level of access as the genuine subscriber card. Pirates can buy a single subscription with access to all the paid content and then produce copies of this card.

Pirate Card ca. 1995 8

Evolution

Pay Tv actors always pushed to get the best security possible at a time

~1995
No shield No scrambling Unencrypted

~2000
Passive shield Bus scrambling
Encrypted

~2005
Internal Oscillator Active shield
Bus scrambling Encrypted
Attack Sensors Hardware redundancy Custom hardware function
9

Threat globalisation
· Piracy is not the only threat anymore · Supply chain security is of concern for fabless manufacturers
(backdoors) · IP theft could be a critical issue · Counterfeiting has become a bigger market · Mass selling products are the new targets
· Consumables (Ink cartridges for printers, ...) · Accessories (game console controllers, ...) · Internet Of Things will create a global security need
10

Overview
Approach
11

Approach
· Research Project about new analysis methods - work in progress · Time and ressource limited project (one person - one month). · The Target : State Of The Art Secure Smart Card
· shield (mesh) · memory encryption · internal oscillator... · Analysis methods · professional deprocessing · high resolution imagery (Scanning Electron Microscope) · Labless analysis through custom tools
12

Process Choices

IC Material Secure IC

Mixed deprocessing SEM imagery Assisted

13

DeProcessing

Card Material

Mixed deprocessing

· Chip is Aluminium based · This means :
· Lines are made of Aluminium · Vias are made of Tungsten · Therefore, it is possible to : · remove lines · keep the vias
14

Imagery Secure IC
· Optical pictures are not usable · SEM brings high resolution

SEM imagery

Optical Picture

SEM Picture
15

Imagery Secure IC

SEM imagery

· 5 layers have been imaged (4 interconnect layers + active layer
· 1500 pictures per layer

Metal 4

Poly

Metal 1

Metal 2

Metal 3
16

Analysis Secure IC

Assisted

· SEM pictures are distorted · Issue for correlating and stitching large scans · Issue for aligning layers · Tracing signal inside the core is mandatory for secure ICs · Thousands of gates to reverse and link together

17

Analysis

CHIP PICTURES

FEATURE EXTRACTION

ANALYSIS

· Extract lines, vias and standard cells
· Correlate images and features together
· Stitch images and features together
· align layers together

DISPLAY

18

Feature Extraction

Feature extraction

Source Picture

Extracted Lines and Vias
19

Feature Extraction

Metal 1

Feature extraction

Poly

Extracted Standard Cells
20

Overview

Results

21

Results
· 2 blocs of RAM · ROM · Flash · Analog blocs · Core

Backside Picture

22

Results
· Core will be analyzed · Lines and Vias are extracted

Extracted Interconnect

23

Results
· Standard Cell Library is reconstructed

NAND Gate

Extracted Standard Cells

24

Reading The Flash
· Flash is easy to spot : · Charge pump used to erase it relies on big capacitors · Charge pump can be disabled to prevent a flash erase in case of security interrupt.
Flash Memory
25

Reading The Flash
· Flash output buffers are directly visible from the backside
· Output lines get separated in 2 groups that travel along the flash to the core.

Flash Output Buffer

Flash Memory
26

Reading The Flash
· Only one of the flash output could be traced to the core.
· Position of the other output is approximative.
Flash output going inside the core
27

Reading The Flash
· Tracing the known flash output leads to 2 multiplexers.
Flash output x

MUX

MUX

Flash output going inside the core
28

Reading The Flash
· Tracing the selection signal of the multiplexer shows that the bus must be multiplexed.
Selection

Flash output x MUX

MUX

MUX

MUX

Traced signals and their connected standard cells
29

Reading The Flash

· Tracing back from the multiplexers confirms the position of the other flash outputs.
· It also shows that bytes can be handled in different orders (endianness...)

Flash output b10

Flash output b00

Flash output b11

Flash output b01

MUX

MUX

MUX

MUX

Selection

6 flash outputs
30

Reading The Flash

· Next step is finding the Instruction Register

· 2 data paths.

Flash Outputs

MUX

?? FF

ARES net tracing visualization.
MUX

MUX

FF

31

Reading The Flash

· First group of Flip-Flops found. · It could be the Instruction Register · Following bloc would be the
Instruction Decoder then.
· Group bits inside the presumed Instruction Decoder
· Compare with the instruction set · Match between the 2 : IR found

Flash Outputs MUX

?? FF

MUX

MUX

FF

Instruction Registers

32
Flash bus schematic

Attack Strategy For Reading The Flash
· Instruction register is made of Flip-Flops that have 2 interesting signals: · clk / read signal that can be used to synchronize data as some clk cycles may be suppressed by embedded counter-measures · Enable signal that disconnect the input from the Flip-Flop.
· Redundancy can be obtained by probing 2 data lines at a time (one needle will stay on its line for all the acquisition).
· 4 needles Linear Code Extraction
33

Comparison with old ICs

· Linear Code Extraction is still a valid attack scenario.
· Old chips had no protection against it.
· The target hides its bus logic inside a dense core
· This obfuscation does not help when the attacker can fully reverse the core.

External Flash Buffers
34

Attack Strategy For Reading The Flash

· Performing the attack can be tricky depending on :
· shield technology
· Position of the interesting nets inside the chip (frontside or backside edit)
· Planarization
· Having all features extracted, a gds2 file has been created. It can be loaded in the FIB for assisted navigation.

GDS2 active layer example

Core GDS2 for FIB NAVIGATION
35

Reading The ROM
· Getting the « raw » bits is feasible. · Is the ROM encrypted?

Dopant etch

Bits before wet chemical dopant etch

Bits revealed by etching
36

Reading The ROM
· ROM data bus goes to an encryption bloc
· Having Muxes and Flip-Flops on the same path may indicate that decryption operation can take several clk cycles.
· This path has not been completely reversed
· ROM can be read after studying the encryption without any Focused Ion Beam edit.

ROM Outputs

MUX

FF

ROM Data Path

37

2 Blocs of RAM
· Both RAM are encrypted · RAM and ROM are on the same clk
domain · Shared RAM with the crypto
accelerator?

RAM 1

RAM 2

FF

FF

MUX

RAMs Data Path
38

Overview

Conclusion
39

Timing : generation benchmark

· The first Linear Code Extractions did not require expensive equipments such as FIB and SEM.
· The main memory was not scrambled neither encrypted.
· Buffers were easily accessible.
· Extracting such a chip would require very little effort nowadays.

Unprotected Bus
40

Timing : generation benchmark
· To avoid easy access to the logic, multiplexers and buffers have been hidden inside the core.
Scrambling
· 8 bits processor · 32 bits FLASH output going to
the core
Manual Tracing
41

Timing : generation benchmark

Step by step
· Lines have to be traced inside the core
· The core contains a multiplexer for the 32-bit lines
· Identify the 8 output bits of the multiplexers

32 ROM Outputs
32:8 MUX 8 Instruction Registers

Manual Tracing inside the core 42

Timing : generation benchmark
Step by step
· 3 paths can be followed · 2 of them can not be exploited
43

Timing : generation benchmark
Step by step
· Multiplexers were hidden · Data was not encrypted · Finding the correct spot took
some time : ~ 2 months.
44

Timing : generation benchmark

Flash Outputs

· New methodology is already successful
· Time of this particular study is short
· Deprocessing and imagery can be performed in less than 2 weeks.
· Interconnects are extracted and the result checked in another 2 weeks.
· The tools used for that study were in a mode used when picture quality is low or when feature extraction has not been verified.
· Standard Cell Library has been extracted while tracing signals, leading to 22.000 extracted instances inside the core.
· Tracing RAM, ROM and Flash to the Instruction Register and verifying its location with an overview of the Instruction decoder took 1,5 week.

MUX

?? FF

MUX

MUX

FF

Instruction Registers

45
Flash bus schematic

Conclusion
· The target IC has the characteristics of a secure chip. · Shield · Internal Oscillator · Memory encryption · Obfuscation of the different parts inside a single core ·...
· Linear Code Extraction would be the best method to read the main memory
· ROM could be read by a deep Hardware Reverse Engineering
46

Conclusion
· Time necessary to perform the study was 2 weeks of feature extraction related work and an extra week and a half to find where and how to perform a Linear Code Extraction.
· This methods speeds up the regular process by a significant factor. · It also opens doors for semi-invasive attacks where the position of
important standard cells could be used to narrow down one study. · Hardware custom implementation are questionable.
47

CONTACT
Olivier Thomas Clarisse Ginet

Chief Executive Officer +33 6 64 80 06 87
olivier@texplained.com

Head of Business Development +33 6 35 54 12 04 clarisse@texplained.com

www.texplained.com

