SESSION ID: HT-F01
AirGapping is Overrated: Pressing a Red Button via a Multi-Function Printer

Ben Nassi
Ph.D. Student Ben Gurion University of the Negev & CBG Labs @ben_nassi

#RSAC

#RSAC
Ben Nassi - About Me
· Ph.D. student 4th year. · Investigating security and privacy in the era of IoT devices. · Former Google employee. · A paper based on this talk was published on "IEEE Transactions
on Information Forensics and Security" on 2019 under the name "Xerox Day Vulnerability".

Paper

Research's webpage

2

#RSAC
Outline
1. Covert Channels 2. Air Gapping 3. Multi Function Printers 4. Pressing a red button via a MFP 5. Demonstration against real organization. 6. Countermeasures
3

#RSAC
Covert Channels
4

#RSAC
Covert Channels - Definition
"Creating a capability to transfer information between parties that are not supposed to be allowed to communicate by measures that were not designed for communication."
A Note on the Confinement Problem. Butler Lampson, 1973
5

#RSAC
Covert Channels - Types
Covert Channels

Bi-directional channel

Uni-directional channel

Exfiltration
6

Infiltration

Unidirectional Channels
Exfiltration Covert Channel

Organization
Data

Attacker

Malware

#RSAC

Infiltration Covert Channel

Organization
Data

Attacker

Malware

A malware (source) modulates the data and A malware (destination) demodulates the sends it to an outside attacker (destination). data that has been sent from an outside
attacker (source).

Widely investigated Examples: optical/electomagnetic covert channels Main use case: exfiltration of assets

Limited amount of studies Examples: thermal/acoustic covert channels Main use cases: red button triggering

7

#RSAC
Covert Channel and Side Channel Attacks

Covert Channels
Assumptions Pre installed malware in an organization

Goal

Exfiltration/Infiltration

any kind of message

Side Channel Attacks
1. Attacker within physical proximity 2. A process creates informative side-effect
Learning about something (asset/secret) from a process by analyzing its side-effects.

#RSAC
Air Gapping
9

#RSAC
Mitigating Covert Channels ­ Air Gapping
Most commonly used countermeasure method against covert channels is Air Gapping: physically isolating a set of computers/network from unsecured networks (e.g., Internet or LANs)
Air Gapping is mostly employed in:
­ Highly secret organizations (e.g., intelligence agencies). ­ Industrial control systems (e.g., gas fields). ­ Critical infrastructures (e.g., nuclear plant, medical devices). ­ Financial computer systems.
10

#RSAC
Air Gapped Networks
Air Gapping in the context of covert channels is used to prevent two actions: 1. Compromising a computer.
Attackers use alternative methods to compromise a computer:
­ Supply Chain Attacks. ­ Social Engineering.
11

#RSAC
Air Gapped Networks
Air Gapping in the context of covert channels is used to prevent two actions: 1. Compromising a computer.
Attackers use alternative methods to compromise a computer:
­ Supply Chain Attacks. ­ Social Engineering.
Conclusion: Motivated attackers find alternative ways to compromise an isolated network.
12

#RSAC
Air Gapped Networks
Air Gapping in the context of covert channels is used to prevent two actions: 1. Compromising a computer.
=> Not effective against motivated attackers. 2. Communicating with external attacker.
=> effective??
13

#RSAC
Pressing a Red Button via a Multi Function
Printer
14

#RSAC
Objective Establishing an infiltration covert channel with a malware installed on an air-gapped computer .
15

#RSAC
Pressing a Red Button via a MFP
Contributions 1. Exploiting a legitimate MFP to establish a covert channel, as
opposed to unauthorized hardware that is considered vulnerable (e.g., microphones). 2. The covert channel can be established far away from the target scanner (1 km away). 3. Much higher transmission rate compare to other infiltration covert channels. 4. The installed malware does not require any special permissions. 5. Can even be performed invisibly.
16

#RSAC
Multi Function Printers (MFP)
17

#RSAC
Multi Function Printers (MFP)
Used for scanning, printing, copying, and faxing. Commonly used in most organizations nowadays. Connected to the organizational network.
18

#RSAC
Multi Function Printers (MFP)
Scanning Process
1. A lamp passes over the scanner's pane (from the bottom) and illuminates the pane.
2. Using a series of lenses and mirrors, the light is bounced back to an optic sensor (e.g., CCD/CMOS sensors).
3. A lens splits the image into three colors and the associated electrical charge is measured. The brighter the light reflected, the greater the electrical charge.
4. An ADC device converts the electrical charge to a binary code that represents the document that is located on the pane.
5. The binary representation (a file in a configured format e.g., PDF, PNG, etc.) is transferred to a computer for storage using wired/wireless connection.

#RSAC
Multi Function Printers (MFP) What happen when the ambient light in the room of a MFP is changed while scanning with an open flatbed?
20

#RSAC
Threat Model
Assumptions: A malware was pre-installed on a computer that is connected to the isolated network. A MFP is connected to the isolated network. The malware can trigger a remote scanning of the connected MFP. The MFP flatbed was left partially/fully open.
21

Code
Attacker Code

#RSAC
Malware's Code

#RSAC
Influence of Projection Intensity
23

#RSAC
Influence of Transmission Rate & Resolution
24

#RSAC
Influence of Transmitted Wavelength

infrared (980nm) laser pointer

ultraviolet flashlight (365 nm)

25

#RSAC
Different Modulation Techniques
26

#RSAC
Scans
27

#RSAC
Demonstrations
28

#RSAC
Attacking a Real Organization
29

#RSAC
Attacking a Real Organization
30

#RSAC
Attacking a Real Organization
31

#RSAC
Attacking a Real Organization
32

#RSAC
Attacking a Real Organization
33

#RSAC
Attacking a Real Organization
34

#RSAC
Countermeasures
35

#RSAC
Takeaways
Disconnect the MFP from any critical network. Apply an organizational policy for closing the flatbed of any connected MFP. Deploy a dedicated countermeasure method for detecting malicious scans.
36

#RSAC
Countermeasure Method ­ Firewall for Scans
37

#RSAC
Questions?
38

