Security Research Report on Mercedes-Benz Cars

1. Abstract
Nowadays, more and more intelligent and connectivity functionalities have been introduced to modern cars, which also brings more attack surfaces to the cars. As a car security research team, we would like to learn more about the connected cars' design and development, since they have more intelligent and connectivity functionalities, we initiated the research on Mercedes-Benz in 2018.
In this paper, we discuss how to perform security research on the intelligent car. First of all, we talk about how to build a testbench with relevant intelligent components at a low cost. Second, we design an attack chain from the outside to the inside of the vehicle based on this testbench. Third, we perform the attack chain in a genuine car. This paper explains how we researched a Mercedes-Benz E-Class car and found the vulnerabilities. By exploiting these vulnerabilities, we can remotely unlock the door and start the engine; and they potentially impact all Mercedes-Benz connected cars in China (estimated over 2 million).

2. Abbreviations and acronyms

This Paper uses the following abbreviations and acronyms:

CAN

Controller Area Network

ECC

Error Correction Code

ECU

Electronic Control Unit

EIS

Electronic Ignition System

HERMES Hardware for Enhanced Remote-, Mobility- & Emergency Services

HU

Head-Unit

IAP

In-Application Programming

MCU

Micro Controller Unit

OOB

Out of Band

SLC

Single-Level Cell

TCU

Telematics Control Unit

- 1 -

3. Introduction Sky-Go is a professional security research team on connected cars, organized in 2014, and we have performed a lot of car security-related researches. We collaborate with car manufacturers to help them strengthen their car security. Many car manufacturers and suppliers are our customers, such as FAW, Changan, Tesla, Dongfeng Nissan, Geely, BOSCH, BYD. In 2018, we begin research on Mercedes-Benz, since it is one of the most famous car brands in the world and an industry benchmark in the automotive industry. We analyze the security of Mercedes-Benz cars. There are so many models from Mercedes-Benz, and we finally chose the research target on Mercedes-Benz E-Class, since the E-Class's in-vehicle infotainment system has the most connectivity functionalities of all. In this technical paper, we describe the research methodology. In order to protect the intellectual property of Daimler, we disclose limited security designs and limited code details.
Figure: Test Cars in the Research
- 2 -

4. Build the Testbench In this Chapter, we describe the procedure that how to build the testbench. 4.1. The architecture of Telematics The first step in testbench building procedure, we need to reveal the architecture of targeted system. Based on this architecture, we can figure out the key components.
Figure: Architecture of Connectivity Functionality The Key components for our testbench are as follows: � Head-Unit � HERMES � Screen � Center Control Media Button Mouse 4.2. Obtain Key ECUs The first step is to dismantle the control panel to tear down ECUs.
- 3 -

Figure: HERMES 1.5 in the E300L
Figure: NTG 5.5 Head-Unit After obtaining the target devices, it is necessary to collect relevant information such as network topology, pin definitions, chip model and enable signals in the car. Therefore, we need to disassemble the center panel in the car and find out the wiring connections between the ECUs. It is also necessary to know the CAN messages that could enable the ECUs, such as wake-up status messages and ignition status messages.
- 4 -

4.3. Head-Unit The 2018 Mercedes-Benz E300L uses a Head-Unit code-named NTG-55, which is designed by Mitsubishi Electronics. The FCC ID of this device is UJHNTG55HUE. The operating system running in the NTG-55 is Windows Automotive 7, which based on Windows embedded compact 7. The main control chip used by NTG55 is Renesas R-Car H2 SoC. It uses an octa-core ARM-v7 architecture and is specially designed for invehicle infotainment systems. There are also some security protection mechanisms in the Head-Unit, such as secure boot, storage media encryption (SD card & HDD), and anti-theft system. The most challenging part is that this master SH-2A does not disclose the Datasheet. We can only analyze it with limited knowledge.
Figure: Cover of Head-Unit
- 5 -

4.4. HERMES HERMES is a Telematics Control Unit and it is equipped in all Mercedes-Benz connected cars. The full name of it is Hardware for Enhanced Remote-, Mobility- & Emergency Services. It handles emergency calls, information calls, with support for remote diagnosis, local diagnosis, which can communicate with each ECU. Besides, it is responsible for the Internet access function of the Head-Unit and supports 2.4GHz and 5GHz WLAN networking. The CAN transceiver is connected to the CAN bus 500k, and the LIN line is connected to the Airbag.
Figure: HERMES system block diagram The core of HERMES is the communication module, which supports 3G & 4G network. The module can set up a wireless network for the Head-Unit, and the network could be Wi-Fi or Bluetooth. This solution is called OpenCPU in China. The performance of the communication module is higher than MCU, so it is responsible for calculating data and running the operating system. The primary operating system of the communication module is Linux, and the throughput performance of the module can meet the working requirements. Some 4G routers also use this solution. The communication module communicates with the MCU through the UART and is responsible for control instructions and software upgrades. SH2A MCU is responsible for managing peripheral chips, including LIN transceiver, CAN transceiver, and power management.
- 6 -

E-SIM

WLAN & BT SDIO Module

Cellular Module

UART

MCU

LIN-Transc
CANTransc
Power

Debug Port
Figure: HERMES hardware block diagram Basebands of communication modules vary in different regions.

Figure: Network modes in different regions In this research, we analyze 4 versions of HERMES.

Version

Communication Modules Models of the Car

HERMES v1.1

ME809Tu UTMS

All Mercedes-Benz connected cars

HERMES v1.2

ME909Tu LTE

All Mercedes-Benz connected cars

HERMES v1.5

ME919bs

All Mercedes-Benz connected cars

HERMES v2.1

ME919bs

All Mercedes-Benz connected cars

Table: Information for HERMES

- 7 -

Figure: Comparation of HERMES The HERMES v1 PCB has a USB interface. The vias of the HERMES v1.2 PCB are covered with solder masks, and the USB interface is removed. The HERMES v1.5 uses the ME919Bs communication module with a GPS module. The HERMES v2.1 is different. The debug port is moved from the bottom to the left. There are two FAKRA LTE antennas to ensure signal stability, and a GNSS interface to receive GPS information. The USB interface is used to provide network functions for the Head-Unit.
- 8 -

4.5. Pinout Definition It's necessary to list the information of all ICs on the PCB. This work is very similar to copying a PCB. The purpose is to understand the working principle of the device at the hardware level.
Figure: Chip information of HERMES board It is not easy to find the debug port of the chip in the mass-produced version of the PCB. If no silkscreen is found, you can only test the connection between the test pads you think by multimeter according to the tracks or chip pin assignment. LTE modules with HERMES version higher than 1.5 have more pins, making testing more laborious.
Figure: Definition of Communication module pinout - 9 -

Figure: The LGA paddings of LTE module Finally, we found a useful test pad.
Figure: Definition of Debug interface To analyze whether the module exists a chip debug port, we scan the SoC with X-Ray to figure out the pins, which avoided damage caused by disassembling the equipment. For example, we can find out the debug port on the processor, then check if there is a corresponding pad in the LGA pads.
- 10 -

Figure: X Ray Image Finally, we're able to sort out the pin definition of the System Connector.
Figure: Connector Pin assignment of HERMES There is an easier way to find the definition of the connectors. A User Manual of HERMES is leaked in online publicly available databases, which has the connector pin definition. The HU needs to connect to the TCU to access Internet. HU has three ways to connect with TCU: USB UTC, Bluetooth DUN and Wi-Fi. The configuration file in the system determines the actual connection method. Before establishing connection between HU and TCU, they need to negotiate protocols through CAN-A. After the connection is established, they manage the network through WCC protocol. HU connects to two CAN-buses: the first is CAN-D, which is a comfortable can bus, the other way is CANHMI. The Communication module has 2-ways of PDP PDP1: Applications on the HU need to get real-time car status, real-time road condition. Communicate with the server. Communicate data to USB ECM. PDP2: Set up a local area network with Head-Unit as a gateway. There are two networking modes which described as follows:
- 11 -

1: HU set an AP hotspot, the Communication module connects to the Wi-Fi AP as a STA, all the traffic to the Internet pass thought the LTE module. 2: Bluetooth: Only the old HERMES uses the Bluetooth datalink to access the Internet.
Figure: ECU Functions Connection diagram 4.6. Bypass Anti-Thefts Mercedes-Benz has applied anti-theft technology since the 1990s. Thus, their development has been very experienced after many iterations and the system became very robust. Our version of NTG55 triggered antitheft. Multiple anti-theft modes are implemented in the system. Among these, the highest-level mode cannot be cracked by external means unless unlocked by a dealer shop. There are 3 levels to activate Anti-Theft in the Head-Unit as follows. Level-A: The heartbeat messages error. You need to switch the ignition on, restart the system.
Figure: restart warning Level-B: The VIN isn't matched. You need to ask your dealer to cancel the anti-theft.
- 12 -

Figure: anti-copy protection warning Level-C: Unexpected messages. You need to call the Mercedes-Benz Service Center.
Figure: anti-theft warning It's evident that if you replay the CAN-bus messages in a new car, the anti-theft could be activated. However, we learned that if we block some corresponding data at CAN-bus for capturing the anti-theft LevelA deactivate message, the anti-theft Level-C will be enabled. After some analysis work done in CAN-bus, we found some CAN-bus messages which can keep Head-Unit running. Two different heartbeat messages are needed to bypass the HU anti-theft system and make it run on the bench. Use the collected information above to build a bench environment. The research preparation is completed, and the next step is to discover and analyze the loopholes. For the Head-Unit that has triggered anti-theft, the anti-theft related data is stored in the SD card. However, the SD card is locked. The area where the anti-theft data stored is a file system developed by Daimler and runs in WinCE. Therefore, we need to disassemble the Head-Unit, reverse the file system driver, unlock the SD card and modify the anti-theft configuration, and then restart to disarm the anti-theft. The cost of this operation is much higher than going to a 4S shop to disarm theft.
- 13 -

Figure: Testbench 5. Analysis Procedure After analyzing the attack surfaces of the connected car, TCU is in the most crucial component in the whole system, since it is the communication module between the external network and the in-vehicle network. 5.1. Collecting the Network Information Here're 4 APN configurations information which correspond to different environments.
Figure: APN configuration There is the boot log to show the procedure when HERMES connects to car backend.
Figure: Connections of TCU We use the Qualcomm misconfiguration to open the debug function by connecting to the USB port.
- 14 -

Once we connected the HERMES to the PC, the device message showed the serials numbers and USB devices info.
Figure: USB devices on Linux It reveals to be 6-devices in the Microsoft Windows system for debugging.
Figure: USB devices on Windows We can use the AT command to operate the Communication module to get APN configurations. Also, we can flash new firmware into the module.
Figure: APN configuration We cannot impact the backend merely with the vulnerabilities above. We need to analyze the vulnerabilities in communication.
- 15 -

5.2. Dumping the Firmware In previous Connected Car researches, dumping firmware would normally be our first step. In this research, we did the same. At first, we try to tear down the NAND Flash from Cellular Module to dump data from NVM. The HERMES < 1.5 use the Qualcomm. The SoC is MDM9615. There's no internal RAM, so the RAM is in the same package as ROM. The memory flash is the Micron SLC NAND, and the package is the BGA 137 MCP.
Figure: LTE module PCB We use the BGA Rework Station to disassemble the NAND Flash.
Figure: BGA rework station - 16 -

Unfortunately, we had no available NAND Flash Adapter at that time. As an option, we jumped wires from the NAND Flash footprint to the TSOP-48 Adapter according to BGA-137 pin assignments.
Figure: NAND Flash pinout The NAND flash consists of blocks, and the blocks consist of pages. In general, it can skip the OOB. But as to the 4G modules, the spare area including relevant data: Bad block information, ECC bytes, Erase Block mapping info. So, we must dump the NAND Flash with the OOB area.
Figure: NAND array organization We have another way to dump the raw NAND flash. Although the entrances that transport the data are different, the principles are the same: operate the CPU to read pages data from peripheral memory devices to the RAM, then dump the RAM data to the host (PC or the emulators) Connect wires to the debug ports, set breakpoints at the appropriate time. The external signals were set to prevent watchdog timing out. Otherwise, the watchdog restarts the SoC when you are reading the RAM data.
- 17 -

Figure: JTAG Connector In this research, we use the OpenOCD with FT2232 to operate the debug interface.
Figure: JTAG debugging for Hi6932 - 18 -

We can read or write the NAND Flash by IAP: run a DLOAD program in the RAM, the DLOAD program will read the NAND pages to the RAM, then we can read the RAM via the debug port or dump the RAM to a USB disk. The raw NAND Flash file is not similar to the Flash with the routers which can be extracted by Binwalk. After referring to the chip's datasheet, we figured out the spare area distribution, and thus, we can read the regular partitions by skipping the OOB area.
Figure: spare area mapping for common NAND flash For the HERMES < 1.5, we decoded the partition tables of Qualcomm, and extract these partitions.
- 19 -

Figure: system partitions of old HERMES It's easy to extract some partitions, but some partitions are hard. The spare area defined in the chip datasheet is just as recommended; it's not an enforced standard. The spare area is related to the NAND controller. The SLC has sub-pages. Each page has ECC, so we can analyze the regulation of the differences of the pages to figure out the OOB area distribution.
Figure: OOB area distribution The user data, applications and system partitions use the YaFFS filesystem. YaFFS is designed for NAND and NOR Flash, and It has a wear-leveling feature. The NAND controller messes up the block order for longer life expectancy.
- 20 -

Figure: Yaffs blocks mapping Skipping the ECC of OOB data, with only 16-bytes OOB data left for Yaffs, it allows us to recover the sequential NAND filesystem and extract files from it.
Figure: codes for extracting Yaffs Write a script to extract files from system partitions. It turns out to be a Linux system.
- 21 -

Figure: Applications of HERMES For Hermes 1.5~2.1, the Cellular module is ME919, and the SoC is Hi6932, the USB cable had been removed from PCB.
Figure: HERMES 1.5 The NAND Flash in a newer version of HERMES is using the BGA63 package.
- 22 -

Figure: NAND flash adapter Fortunately, we get rid of the soldering work because we have the Flash Adapter. Then we decode the partition table for the ME919 as follows:
Figure: System partitions of new HERMES But things didn't go smoother in research work. We found in some Brands of the chip have the bit-flipping. This problem affected the data we extracted.
- 23 -

Figure: bit-flipping error The bit-flipping is a NAND Flash features. If the key jump instructions are affected by bit-flipping, our research may have headed in a wrong direction. On the other side, there're many peripheral buses, thus we cannot set up a simulation environment by QEMU. If we have to debug the TCU client programs dynamically, we need to tamper the filesystem to get an interactive shell with ROOT privileges. Because of the bit-flipping, if we writeback the wrong data we have read to the NAND flash, it will occur an unexpected error that the ECC algorithm will make the correct data to the wrong data. Combining our previous research experience, we recovered the ECC algorithm for this NAND controller.
Figure: Code for generating ECC So, we can generate and decode the ECC data and remove the OOB area from a raw NAND file.
Figure: Polynomial code - 24 -

We generate a raw NAND file with ECC from the NAND file without the OOB area. The comparing results between the old file are the same with the new NAND file we generated.
Figure: Correct ECC Then we tamper the filesystem by adding an interactive shell with ROOT privileges. We found an engineer mode program for debugging the TCU system, with access to the CAN bus via operating the MCU. Thus, we can perform some operations for example, lock or unlock the doors.
Figure: Engineering menu application 5.3. Client Certificates TCU file systems stores the pkcs12 client certificates, passwords and CA certificates for the car backend server.
Figure: certificates and key pair The files with suffix ".passwd" are the password files, encrypting with AES_256_CBC and the key hardcoded.
- 25 -

Figure: Decryption code

Figure: Hardcode AES key
The key of the certificate is encrypted to a file, we can get the certificate key by compiling the decrypting tool with OpenSSL, obtaining the password of the certificate key. After decryption, the passwords of client certificate including ECE, AMS, and CHN region can be obtained
Chinese region certificate is using a week password.
5.4. Protocol Analysis The HERMES-Backend protocol design doesn't seem vulnerable. Not only the ISP and SSL provide protection, but also the Mercedes's own secure communications make the MITM impossible.

Mercedes-Me

Back-end

HERMES

Unlock door

Wake-Up

Result

Request new shared-key Update the shared-key ATP Command with special HMAC
Response

Figure: Communications of Telematics
1. The user controls the vehicle through "Mercedes ME" APP. The car control request is sent from the mobile phone to the server.

- 26 -

2. The backend server checks the validity of the request. If the car control request is valid, it is sent to the TCU of the corresponding vehicle by SMS. SMS is using a protocol called ATP. The ATP protocol uses a shared key to encrypt data fields and uses a hash algorithm for authentication. The encryption method is AES. Each time the TCU boots, it requests a new shared key from the key server using the HTTPS protocol. The protocol validates if there's a need for a new key and then proceeds with a process to get the new key, and both TCU and backend databases store the shared-key. The control message is bound to be unforgeable through the shared-key and digest fields.
Figure: Message struct 3. After the TCU receiving the SMS, it uses the shared key to decrypt the SMS data field and verify its validity. TCU sends actual control instructions via CAN-D. 4. A few moments later, the TCU receives a response message from the EIS or other ECU, which contains the execution result of the control instruction. As soon as TCU receives these results, TCU uses HTTPS to feedback the execution result to the ATP server. The security mechanism of this protocol has been upgraded several times and is much more secure than most of car manufacturers. 5.5. Access the Backend Car Backend is the core of Connected Cars. As long as Car Backends' services can be accessed externally, it means that car backend is at risk of being attacked. The vehicles connecting to this Car Backend are in danger, too. So, our next step is to try to access Car Backend. For accessing the APN networks of backend, one possibility would be using the e-sim of car-parts since the sim account wouldn't log out automatically. After tearing down this eSIM, we put it into the 4G router.
- 27 -

Figure: eSIM Applying the APN information obtained before, dial-up to access the Internet.
Figure: APNs The security strategy of ISP detects the relationship between ICCID and IMEI; if changed, the SIM account would be frozen. In order to access the 4G network, we modified the IMEI of the 4G router and configured the APN information to the 4G router.
- 28 -

Figure: E-SIM Jump wiring The interface IP address belongs to the APN the intranet. It can be hard to trace the attack source.
Figure: Access the ISP intranet We can obtain an IPv4 address of the ISP intranet (Not the belong to the Car Backend network). A device of CHN region has three certificates of three different regions, which has been deployed to most of the backends, considered as an authentication mechanism for all of the backend servers.
Figure: 3 different certificates Once the certificate is obtained, certain access to backend servers was possible by utilizing the certificate.
- 29 -

Figure: the basic information of cert - 30 -

5.6. Social Plugins SSRF
We can scan the QR-code on the social plugins of the Head-Unit, which is actually a web application. We can bind the social accounts to the car. A SSRF vulnerability occurred in the backend service, as the image provider failed to filter the parameters we input.

Figure: Social plugin page
The plugin developers have less consideration of the requested URL. For example, if we submit a local URL to the image provider, it'll return the contents we requested.

HU Browser

URL

Web Proxy

Fetch Access

Figure: SSRF data stream

Social Media
Local Files in
TSP

Figure: System file leaks - 31 -

6. Vulnerabilities List No. Description

Components

Reference

CVE-2019-19556

1

HERMES

CVE-2019-19560

CVE-2019-19562

2

HERMES

Reserved

CVE-2019-19557

3

HERMES

CVE-2019-19561

CVE-2019-19563

4

HERMES

Reserved

5

HERMES

Reserved

6

HERMES

Reserved

7

Operations

N/A but fixed

8

Operations

Reserved due to security concerns.

9

Head-Unit

N/A but fixed Reserved

10

Backend

N/A but fixed

11

Backend

CVE-2019-19558

12

Backend

N/A but fixed

13

Backend

N/A but fixed

14

Backend

N/A but fixed

15

Backend

N/A but fixed

16

Backend

N/A but fixed

17

Backend & ISP

N/A but fixed

18

Backend

N/A but fixed

19

Backend

N/A but fixed

Table: Vulnerabilities found in this Research

- 32 -

7. Disclosure Timeline Sky-Go Team follows the "Responsible Disclosure" and work together with Mercedes-Benz Security Team on vulnerability fixing. In the joint work for fixing the vulnerabilities Sky-Go Team shared valuable information on the findings. All vulnerabilities that allowed access were promptly fixed. Aug 21, 2019: The findings reported to Daimler AG (360) Aug 23, 2019: The services shutdown: preventing further effect on MB cars (Mercedes-Benz) Aug 26, 2019: Initial fix (Mercedes-Benz) Sep 12, 2019: All access vulnerabilities fixed (Mercedes-Benz) Oct 23, 2019: Joint workshop (360 & Mercedes-Benz) Feb 28, 2020: RSA Conference Publication (360 & Mercedes-Benz) July 20, 2020: Research Report Publication (360)
- 33 -

8. Conclusion In this report, we describe how to do a security research on connected cars. Based on Mercedes-Benz case, we show that how we build a testbench and what analysis works we have done. Then we disclosed the vulnerabilities with limited detail due to security concerns. In the joint work for fixing the vulnerabilities Sky-Go Team shared valuable information on the findings. All vulnerabilities that allowed access were promptly fixed. During the research and joint workshop, we see so many security designs in Mercedes-Benz Connected Cars and these designs are protecting the cars from various attacks. The capability of a car company to work jointly with researchers contributes to the overall security of our cars.
8.1. Data Protection
The Head-Unit adopts WinCE Automotive 7 as its operating system, and less security research has been carried out comparing to the widely used operating systems such as Linux, QNX, and Android, that many privilege escalation vulnerabilities have been found. Daimler has designed a mutual authentication proxy for pipes, by AES256 and HMACSHA256, and they also have many security countermeasures are implemented in the architecture, appearing in the OS, communication, data protection and secure boot. The security considerations of Daimler make the cars hard to be attacked; however, the shortcomings exist. By fully utilizing them, it allowed us to dump the firmware from NAND flash, decrypted the certificates, do some reverse engineering work of the communication protocols.
8.2. Lifecycle Management
Basically, car manufacturer should have their own lifecycle management system which can monitor the state of cars and components. Once cars or components are decommissioned, lifecycle management should restrict their functionalities. However, it is very hard to monitor the state of cars and components for the car manufacturer, since decommissioning can occur without their knowledge and in such a way that decommissioning procedures cannot be enforced.
8.3. Anti-Theft Protection
Anti-theft Protection does make research more difficult. It's possible to stop your research when you are building the testbench. Such as the FBS4 implemented on the key programming, it makes the key numerical and robust enough in encryption. Even if the arbitrary CAN message sending privilege is acquired, the start-up of the car is also prohibited.
8.4. Communication Security
The structure is quite a scalability and well-formed, with HTTPS to authenticate mutually, an elaborated defense design for Tier 4, independent keys for each car which can be replaced at any time, replay attack prevented, isolation of core service and telematics, the remote startup is prohibited in default.
8.5. Intranet Security
Meanwhile, shortcomings also showed in the car backend. Their security depends on is the client certification and had some weaknesses in internal mechanisms. Besides, third-party suppliers have caused some other
- 34 -

security problems. Make every backend component secure all the time is hard. No company can make this perfect. At the early attack stage, it comes some abnormal logs. If automakers monitoring these checkpoint and warning in real-time, they are in an advantageous position.
- 35 -

Annex A (Informative) Letter from Daimler Group
- 36 -

Annex B (Informative) Sky-Go Team
Figure: Mercedes-Benz Research Project Members Sky-Go Team is a professional connected car security research team from 360 Group. Since we established in 2014, we have done many research cases, such as Tesla Telematics System, Tesla Autopilot System, BYD Telematics System. Sky-Go Team provides security evaluation service, consulting service and product for the car industry, and we also attend standardization work, such as ISO, ITU-T, China National Standards (GB) and industry standards.
- 37 -

