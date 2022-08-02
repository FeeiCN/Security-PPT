Spy-Sense: Spyware Tool for Executing Stealthy Exploits against Sensor Networks
Thanassis Giannetsos and Tassos Dimitriou
Athens Information Technology Algorithms & Security
CTiF University, Aalborg, Denmark (agia@ait.edu.gr)
Black Hat USA, 2011 Las Vegas
1

Please turn in your completed feedback form at the registration
desk.
2

Agenda
  Part 1: Wireless Sensor Networks
  Sensor platforms as embedded devices   Security Requirements & Challenges   Threat Models, Unexplored Vulnerabilities & Motivation
  Part 2: Overview of hardware platform used (Tmote Sky)
  Part 3: Spy-Sense Spyware Tool
  Injection of stealthy exploits in sensor networks   Hard to recognize & get rid of, runs discretely in the background
without interfering/disrupting normal operation   Activation/Execution of exploit sequences --- Hard to detect
3

Brief Overview: Wireless Sensors

Mote (Berkeley)

Cricket (MIT)

Tmote Sky

  Radio + MCU = NES   Ultra low power   Tmote Sky
  Only chosen for a concrete example

Using Smart Antennas (AIT)
4

Brief Overview: Wireless Sensors
  Sensor platforms are embedded devices with radio capabilities
  Resource limited microcontrollers
  8 or 16 bit   Von Neumann or Harvard   Internal Flash/RAM   No/partial MMU   Wireless transceiver (e.g., Chipcon CC2420)
  Still a computer
  Existing vulnerabilities come into practice   More destructive as they are usually overlooked in the design of
sensor network applications
5

Brief Overview: Sensor Networks
  Set of sensor nodes deployed in large areas of interest
  Self-Configuration, adaptability and node cooperation   Multi-hop & many-to-one communication, mesh networking
  Applications
  Smart Grid   Military   Wildlife   Monitoring
6

Brief Overview: Why Sensor Nets
  Unique characteristics
  Coverage: Distance/area covered, number of events, number of active queries
  Survivability: Robust against node/link failures, Redundancy   Ubiquity: Quick/flexible deployment, ubiquitous access, info
timeliness   Cooperative effort, Multi-hop communication, Extended lifetime
  Particularly suited for detecting, classifying, tracking
  Non-local spatio-temporal events/objects   Low-observable events
  Distributed information aggregation & validation
7

Participatory Sensing
  People carry sensing elements involving the collection, storage, processing & fusion of large volumes of data
  Sensors integrated into mobile phones, PDAs, etc   Everyday human activities
  More robust security profiles are needed
  Challenging Task
8

Participatory Sensing
  Work to enable diverse, distributed human-in-the-loop sensor networks at personal, social and urban scale
  Public and Professional users;   Leverage imagers and microphones, local processing and
network connectivity for easy, high quality data collection;   Leverage USB, Bluetooth connectivity to peer with external
sensors (physiolological, environmental, etc.)   New network architecture is needed
  People-centric sensing projects
  CitySense, NoiseTube, MetroSense, CityPulse, BikeNet, and more...
9

Part 1: - Security Requirements & Challenges - Threat Models, Unexplored Vulnerabilities &
Motivation
10

Security Profile
  Forward
  Confidentiality (prevent plagiarism)   Authenticity & Integrity (ensures reliability of a message)   Data Availability & Freshness (simple watchdog timer, sequence
numbers)
  Secondary goals
  Self-Organization (key management, trust relations)   Time Synchronization (energy conservation)   Secure Localization (pinpoint the location of a fault)   Secure Data Aggregation (aggregate/route primitive data)
11

Security Challenges
  Wireless medium: Eavesdropping, Interception, Alteration, Replay or Injection of malicious packets
  Limited Resources (memory & storage space, energy scarcity)
  Unattended Operation:
  Exposed to physical attacks. Easily compromised
  Random Topology:
  No prior knowledge of topology
  Hard to protect against insider attacks:
  Physical Attacks   Exploiting memory related vulnerabilities
12

Threat Models
13

Motivation
Better understanding of network and hardware vulnerabilities enables the design of more resilient security mechanisms
  Several defense mechanisms have been proposed against specific attacks
  Security holes always exist
  Intrusion Detection protocols implementation
  Withstand attacks that have not been anticipated before
  What loopholes can an adversary exploit for intruding the network
  Practice best ways to perform attacks   Study new threat models
14

Motivation
  "Practice best ways to perform attacks"
  Check out BlackHat '10 Spain, "Weaponizing Wireless Networks: An Attack Tool for Launching Attacks against Sensor Networks"
  SenSys Tool ( http://www.ait.gr/ait_web_site/Phd/agia/SenSys/sensys.html)
  "Study new threat models"
  See sensors as embedded devices   Software-based attacks --- Malicious Code
Injection (2010, created the first sensor worm)   Move one step further and inject spyware
exploits
15

Part 2: Overview of Tmote Sky platform
16

Sensor Platform used
  TI MSP 430 (16 bit RISC)
  8 MHz, 10 KB RAM, 48 KB code, 1 MB flash   Von Neumann architecture
 Chipcon CC2420 radio, on-board antenna, IEEE 802.15.4
  50 m. range indoor, 250 m. range outdoor, bandwidth 250 kbits/s
17

Brief Review

  Von Neumann   Unified memory
  Executable RAM

  Harvard
  Divided Memory
  Code   Data
 Unexecutable RAM

18

TI MSP430 Microcontroller
  TI MSP 430 (16 bit RISC)
  Common address space shared with SFRs, peripherals, RAM & Flash Code memory
  RAM is comprised of consecutive memory blocks
  Lower RAM is mirrored in the upper part   No support of dynamic memory allocation --- Heap
is empty and unused
  Linker behavior
  Flash is at the top of memory   Code grows from starting address upwards
  Chosen for a concrete example
  Similarities in AVR, PIC, MIPS, etc
19

Toy Application
  Delta application
 Multihop data collection application. Devices sample their internal temperature sensor and report readings using MultihopLQI routing protocol
  Each node generates a one-way key chain
  Ordered list of cryptographic keys generated by successively applying a one-way hash function F to a pre-assigned key seed
  Will be used for exposing keys later on
20

Part 3: Spy-Sense Spyware
21

Spy-Sense Overview
  Spyware tool that allows the injection of stealthy exploits   Based on memory related vulnerabilities & Code injection techniques   Undetectable and once activated runs discretely in the background   Exploits are sequences of machine code instructions
Data Manipulation
Cracking
Network Damage
22

Malicious Code Injection
  Take advantage of memory related vulnerabilities
  Buffer and stack overflow, format string specifier etc   Send crafted packets and execute malicious code on the target
system
  In embedded systems like sensor nodes
  Malware is rare   No one looks for it   Simple malware is undetected   No operating system
  No system calls, function tables, etc   Single statically-linked program images
23

History
  Travis Goodspeed was the first to author a WSN exploit   Targeting devices following the Von Neumann architecture   Showed how to perform a buffer overflow attack in order to execute instructions within a received packet
  Francillon and Castelluccia demonstrated code injection on devices with Harvard architecture   Use of gadgets; Pre-existing instruction sequences
  Back in 2010, we authored the first instance of a self-replicating worm
  Move one step further   Use of software vulnerabilities for injecting and storing, anywhere in the mote's memory, stealthy exploits
24

How to inject spyware exploits
  How the attack code is sent and stored on sensor nodes   Attack code can be sent as data payload of a sufficient message stream   Overflow the memory buffer used for storing received packets   Alter program execution flow
  Where the attack code is stored   Memory is precious ­ A few kilobytes are free   However, no support of dynamic memory allocation   Heap remains empty, unused and unchecked   The perfect umbrella
25

Required Steps
  Understand memory map of sensor device   Storage address of malware (heap address)   Find memory address of reception interrupt handler & other existing routines
  Radio drivers are inlined ­ Use of JTAG interface   Isolate functions, then iterate   Checksum bytes
  Transmission of a series of mal-packets containing the exploit code to be copied into heap   Perform a multistage buffer-overflow attack   IMPORTANT...Restoration of control flow is vital
  Send a specially crafted packet for setting the PC to the starting memory address of the spyware exploit (activation)
26

Spy-Sense Specifics
  Manipulate Target Pointer and modify the data it points to
  Perform the multistage buffer-overflow   Packet payload must contain MOV & BR
instructions   Send the last packet for activating the
malware
27

Spy-Sense Characteristics
  Generic Installation
  Coexists with prior firmware
  Efficient
  Fits in available memory   Reuses victim code when
necessary (e.g., transmit back information)   Memory/Stealthiness trade off   Use of multi-hop communication nature for reaching the most distant network nodes
  Widely applicable
  Support exploit injection against a variety of sensor hardware and network protocols
28

Spy-Sense Configuration
  Defined in the Spy-Sense.properties file residing in the tool's root folder
  Must be correctly updated
  Port & Baudrate
  Host port where the attached hardware is going to be connected   Baudrate of the hardware   Can also use a simple radio transceiver
  Exploit Folder
  Folder path containing all the exploit profiles to be loaded
  Exploit Stack & PC Fix
  Memory addresses for restoring the normal execution of the victim
  Attack address
  Memory address of the buffer used for storing incoming packet payloads
29

Spy-Sense Exploit Loader
  Responsible for initializing the tool
  Importing all predefined exploit profiles residing in Spy-Sense root folder   Such profiles contain machine code instructions & assembly representation   Possible on the fly reconfiguration with newly defined exploits
30

Spy-Sense Exploit Profiles Analysis
  Fundamental to successful exploit injection & activation is the definition of the memory symbol table
  The first four must be extracted before system boot up   The rest are given on the fly during injection & activation process
31

Data Theft Exploit
  Reports back important or confidential information
  Cryptographic keys, transactional data or even private sensitive information (smart environments, assistive healthcare, etc)
  Track and record all network activities
  Occupies 114 bytes
  30 packets will be needed by Spy-Sense SetUp engine
  Two basic functions
  Retrieval of the selected data memory region   Construction & transmission (back to Spy-Sense) of the appropriate
reply message without disrupting the victim's normal operation
32

Data Theft Exploit Code
IS for initializing the payload of the reply message

Clears argument memory addresses & restores normal state and program flow of the victim node

IS for copying the retrieved values to the memory addresses pointing to the message payload
IS for transmitting the reply packet. IS 22-25 sets up the victim's local radio

33

Data Alteration Exploit
  Alters the values of existing data structures & variables
  Creates backdoor entries to adversaries for performing more direct attacks like Sinkhole, Wormhole, Data Replay, Zombie attack, etc
  If used in combination with SenSys; it significantly increases its threat level
  Occupies 56 bytes
  14 packets will be needed by Spy-Sense SetUp engine
  Alteration of either incoming or outgoing information
  Manipulate single byte or entire data stream
34

Data Alteration Exploit Code
IS for copying the updated value to the targeted data structure
Clears argument memory addresses & restores normal state and program flow of the victim node
35

Cracking Exploits
  Shellcodes that result in intensive resource usage and disruption of network's normal operation
  Energy Exhaustion: Initiates unnecessary communications until the victim drains all its energy out
  Occupies 102 bytes ­ 26 packets will be needed for injection   Resource Usage: Consumes CPU cycles by putting the victim in a sustain
loop for a user-determined period of time   Occupies 22 bytes ­ 6 packets will be needed for injection
36

Energy Exhaustion Exploit Code

IS responsible for creating dummy packet payloads by copying random sequences of data bytes residing in the victim's memory

IS for invoking the transmission function of the victim's local radio. All necessary arguments are loaded & a task is posted for the microcontroller

The last instruction forces the node to shut IS forcing the scheduler to run the

down (__stop_ProgExec__ routine usually posted task by invoking the runTask

resides at b368h)

routine that broadcasts the message

37

Resource usage Exploit Code
Average time spent (in sec):: SL = 0.0062*IL
  It consists of two loop-throughs for consuming CPU cycles
  Outer loop is always set to highest possible 2-byte integer value ffffh   Inner loop is configurable and defines the actual time spent in this
intensive usage state
38

Radio Comm Break Down Exploit
  Forces transmissions to fail
  Shuts down radio transceiver   Make the victim believe that the transmission failed regardless of
what is the actual event
  Occupies 8 bytes
  2 packets will be needed by Spy-Sense SetUp engine
  Change the value of the Radio $bShutDownRequest variable to 1 (active) or 0 (inactive)
  Relevant to Data Alteration Exploit
39

User Defined Exploits
  Previous exploit shellcodes are provided by Spy-Sense
  Reside in the root folder & are loaded by Spy-Sense Exploit Loader component
  Definition of new exploit profiles is possible
  Creation of the corresponding file with all the machine code instructions
  Storage in the root folder
40

Spy-Sense SetUp Engine
  It communicates with the exploit payload constructor for creating and transmitting the necessary message stream
  Important to set up correctly the storage memory address
41

Spy-Sense Activation Engine
  Series of specially crafted packets for redirecting the control flow to the exploit shellcode ­ Important to set up exploit function arguments
  Activation may result to one-time or recursive exploit execution
42

Spy-Sense Activation Engine
  Firing exploit tasks helps spying on the network activities   Spy-Sense takes care of all subsequent transmissions & receptions   All replies are stored in an underlying database for offline analysis   Message structure, Payload content and Time of reception
43

Spy-Sense Visualization
  Maintenance and update of a history profile for each exploit   Imported exploits, their injection & running status, IDs of host sensors, number of pending activation tasks and overall incoming exploit traffic (through continuous graphs)
44

Spy-Sense Visualization
45

Fair Questions
  Has the tool been tested against real deployed networks?
  What sensor platform hardware?
  We are planning to investigate how such exploits can be explored against Harvard-based devices ­ More challenging
  Do software vulnerabilities exist in other network layers (regardless the application layer)?
  Yes! Radio Communication Break Down exploit   We are studying in depth other layers such as the MAC
46

Once Again
  By compromising overall sensor network security:
  Reveal wireless networking vulnerabilities   Come up with novel attacks
  Goals of Spy-Sense spyware
  Introduce spyware exploits against sensor networks and study their effects
  Highlight and motivate the need to come up with more efficient security protocols
47

Source Code Availability
  We are planning to upload the code in order for users to play with it, publish their newly defined exploits or report any bugs
 http://www.ait.gr/ait_web_site/Phd/agia/SpySense/spysense.html
48

Please Remember to Complete Your Feedback Form
49

