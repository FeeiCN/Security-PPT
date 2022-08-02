SESSION ID: IDY-R02
Securing Intel PC for FIDO support: Industry standard to remove passwords

Nitin Sarangdhar
Senior Principal Engineer Platform Security Division, Intel @SarangdharNitin

#RSAC

#RSAC
Session Topics
· Why password-based user authentication creates security challenges
· How FIDO* helps solve user authentication without passwords
· The security role of Intel hardware & firmware in a PC that supports FIDO
Hardware plays a strong role in security
2

Why password-based user

LOGIN

authentication creates

security challenges

Day in the life of a password user

Email Messages Facebook

Calendar Events

Web-purchases Digital Rights - Images

LOGIN

What's App

#RSAC

Bank Transactions VPN Login
Meetings

4

#RSAC
Why passwords create a security nightmare?
· Password re-use, no update, poor strength · Social engineering & key-logger hacks · Sophisticated password guessing tools · Unsecure transmission over networks · Direct server attacks on central user-store · Lack of ability to recognize fraudulent activity from stolen
credential
5

How FIDO helps solve user

LOGIN

authentication without

passwords

International Standards efforts to address

#RSAC

authentication.

NIST800-63-3 Digital Identity Guidelines
­ NIST 800-63-B Authentication and Lifecycle Management
PKI
­ Public key infrastructure ­ ASIA PKI Consortium: Korea, Taiwan, Thailand, Macao, India
ITU-T (SG17)
­ International Telecommunications Union, Security Study Group
ISO/IEC JTC1 (SC27)
­ International Standards Organization IT Security Techniques

7

FIDO Introduction
FIDO stands for Fast Identity Online FIDO protocol is adopted by W3C WebAuthn WG WIP Collaboration with
­ ITU-T (SG17) X.1277 & X.1278 ­ ISO/IEC JTC1 SC37/SC27
World's Largest Ecosystem for Standards-Based, Interoperable Authentication
(*) Source: FIDO Alliance
8

#RSAC

3B+ 300+

Available to over 3 BILLION
USER ACCOUNTS (*)
FIDO CERTIFIED SOLUTIONS (*)

#RSAC
FIDO as a Solution

FIDO Targeted Solutions
· Social engineering email messages · Bank transactions · Web-purchases · VPN login for enterprise

FIDO can be a component to combat "in the news" attacks
· Spreading fake news articles · Creating cyber-attacks on infrastructure · Voter fraud

Better user authentication will help address password related security challenges

9

#RSAC
FIDO Authenticator

Platform authenticators

Roaming authenticators

Multi factor authentication
(possession + knowledge/inherence)

PC with TPM & Smart phone with TPM Smart card with PIN biometric or pin capture & biometric or pin or fingerprint sensor
capture

Security key with PIN or fingerprint sensor

2nd factor
(Login & Password + possession factor)

PC with TPM only

Smart card

Security key

10

FIDO System Architecture

FIDO Client Device

RP App

FIDO*

Browser (FIDO Client)

Roaming

Platform

Authenticator Authenticator

FIDO Relying Party Server
FIDO Met1a1data
Server

#RSAC
FIDO*: UAF, U2F or FIDO2
ABCDEFABCDEFABCDEF
Security Level Metadata on device & model

#RSAC

FIDO* Authenticator Security Considerations

Block Diagram

Extensions

Software

Hardware/ Firmware

­ Distinguishing Knowledge Factors: pin,

OS based Authenticator

TEE based Authenticator

biometric (face, fingerprint) ­ Multiple Factors

(Security Level (Security Level

Software

1)

2/3)

FIDO Authenticator Metadata service

­ Security Level 1: OS

Hardware/ Firmware

TPM (Possession
Factor)

TEE Hardware, Trusted Device
Paths

­ Security Level 2: TEE + TPM + Trusted IO ­ Security Level 3: hardware attack protected TEE Revocation/Lifecycle Management

­ Security flaws discovered post field deployment by performing software/firmware updates

Hardware plays a strong role in security

12

#RSAC
FIDO* Benefits
Better security for online services
­ Service provider can perform proper risk assessment of FIDO user authentication security
Reduced cost for the enterprise
­ Enterprise can deploy devices with properly maintained certified FIDO authenticator machines.
Simpler and safer for consumers
­ Consumers do not have to worry about complex passwords as long as they use a properly maintained certified FIDO device.
13

The role of Intel hardware & firmware in FIDO* security

#RSAC
FIDO* Authenticator Trusted Computing Block Analysis

Browser /UI

Potential Threats
­ Disabling security features: Secure

Software
Crypto Services

Authenticator

Possession Factor Services

Knowledge / Inheritance Factor Services

User Mode Drivers

Kernel Mode Drivers

Boot, TPM ­ Unsigned software or firmware launch
­ Unsigned / Delayed firmware or software update containing vulnerability fixes
­ Interface Intrusion across various

OS Kernel

interfaces such as addition of filter drivers

BIOS, Microcontroller Firmware

Crypto

TPM

­ Untrusted IO (Camera, Finger Print) drivers
­ Replay of previously captured data

15

#RSAC

Security Level 1 Authenticator

Software Firmware Hardware

Block Diagram

Relying Party Server
FIDO2

Industry Standard Browser(s) OS-based FIDO Authenticator

Authenticated Code Module
Integrated TPM TXT

Reference BIOS
CPU/Caches

Intel based PC

OS-based authenticator
Trusted Computing Block (TCB) relies upon OS security features
Intel hardware & firmware security features: ­ Root of Trust for measurement: Trusted
Execution Technology (TXT), Authenticated Code Module (Boot Guard) ­ Private key storage, Measured OS Boot, Integrated TPM (PTT) ­ Secure OS Boot: Intel reference BIOS
Productized use cases ­ Apple MacBook*, Chromebook*, Windows* PCs

Mass deployment adoption model

16

Security Level 2, 3 Authenticator

Software

Firmware / TEE App

Hardware

#RSAC

Block Diagram

Relying Party Server

FIDO

FIDO Authenticator

FIDO Authenticator
Enclave

FIDO Authenticator
Applet

Main OS

Intel® SGX Enclave

Secure VM

CPU

Intel SGX

VT/VTd

Intel based PC

FIDO Authenticator
Applet
Security Engine FW
Security Engine

TEE-based Authenticator
Security Level 1 OS-based FIDO* authenticators can be compromised by sophisticated attackers on various interfaces between different OS modules due to large attack surface
­ E.g. Key-logger, TPM Key disable
Security Level 2, 3 can be achieved by enabling Trusted Execution Environment (TEE) based Authenticators with smaller TCB + achieving additional requirements (e.g. software).
Intel provides three hardware options for potential TEE
­ Security Engine ­ Intel* Software Guard Extensions (Intel® SGX)
­ VT/VTd

17

Security Engine Micro-architecture

Security Engine
Interrupt Controller High Precision and Watchdog Timer

Code Cache Data Cache Cryptography Engine DMA engine Host Endpoint Controller
18

Internal Bus

#RSAC
Internal SRAM ROM
I/O Memory Controller

Security Engine Architecture

Software

Firmware Apps

Hardware

#RSAC

Block Diagram

Relying Party Server
FIDO U2F

Main OS-based FIDO User Interface App

FIDO U2F Integrated TPM
Authenticator Security Engine Kernel

Security Engine

Protected Audio Video Path Based Display Controller

Intel based PC

Security Engine based Authenticator
Key Benefits
­ Embedded Secure Element inside Intel SOC
Productized use cases
­ Integrated TPM: Possession Factor for Host OS and VT/VTd based solution
­ FIDO U2F : Intel IOC
o Displays OK button in a random location using Protected Audio Video Path, mitigates remote SW attacks
19

#RSAC
Intel Software Guard Extensions (Intel SGX) Micro-Architecture

Cores
Cache SSN: 111-00-1010

Memory Bus

System Memory
Jco3lk93 7weu0cw
ejpoi

CPU Package

Snoop Snoop

CPU Hardware assisted Trusted Execution Environment
Intel SGX supports 17 new instructions on CPU
Applications (Enclaves) can set aside private regions of code and data.
Better protection against direct attacks on executing code or data stored in memory.

20

#RSAC
Intel® Software Guard Extension FIDO Architecture

Block Diagram

Relying Party Server
FIDO UAF

Main OS-based FIDO App

FIDO Authenticator Enclave (IOC) Fingerprint Match Enclave Intel Architecture Enclaves

Intel SGX Hardware

Finger Print Controller

Intel based PC

Software

Trustlet

Hardware

Intel SGX based Authenticator

Key Benefits
­ Small TCB that includes architectural enclaves and Intel HW/FW
­ Completely isolated from main OS, VMM and BIOS
Productized use cases
­ FIDO UAF : Intel IOC ­ Performs fingerprint match inside IOC
Authenticator enclave.

21

#RSAC
Virtualization Technology Architecture Overview

VM0

Ring-3 Ring-0

Host OS

Secure VM
VM1
Trusted Apps
Ring-3 Ring-0
Secure VM

VM0 VMCS

VM1 VMCS

EPT0

EPT1

Hypervisor

VT-x2, VT-d
Memory

VT HW provides memory space Read/Write/Execute access control as defined by Extended Memory Page Tables
VTd HW support consists of ensuring DMA memory space access control as defined by the VTd Page Tables
Enabled with Hypervisor and Trusted Applications running in a more secure VM

#RSAC
Virtualization Technology FIDO Architecture

Block Diagram

Relying Party Server
FIDO2

Industry Standard Browser(s)

Secure VM-based Secure VM-based

FIDO Authenticator

IO Driver(s)

Secure VM Kernel

VT/VTd Hardware

USB / MIPI Controller
Intel based PC

VT/VTd Based Authenticator
Key Benefits
­ Synergistic with OS & Browser initiatives (e.g. Windows VSM)
­ Enables more secure IO paths: Better protected from Host OS based replay attacks
WIP use cases
­ Virtualization based protection WIP with customers / partners
23

#RSAC
To Summarize
Today we covered essentials of FIDO Security
­ Single factor: TPM only ­ Multiple factors: TPM + pin or TPM + biometrics ­ Level 1 (OS based), Level 2 and above (TEE based) ­ Revocation/Life-cycle management
Intel hardware and firmware role in FIDO security.
­ CPU, TXT, TPM, VT/VTd, Intel SGX, Security Engine ­ Microcode, ACM, Security Engine Firmware, BIOS
Hardware has a strong role in FIDO security
24

#RSAC
Call to Action
Stop by at Intel and FIDO booths to look for product demos Short Term
­ Encourage use of certified FIDO products on your client and server solutions ­ Ensure FIDO solutions are deployed with proper security configurations ­ As a relying party learn to discriminate between security levels
Long Term
­ Deploy platforms with higher security levels of FIDO security ­ Help solve major security challenges facing the industry together
25

#RSAC
Q & A Contact: nitin.v.sarangdhar@intel.com
26

#RSAC
Legal Notices & Disclosures
Intel provides these materials as-is, with no express or implied warranties.
No component or product can be absolutely secure.
Intel technologies' features and benefits depend on system configuration and may require enabled hardware, software or service activation. Performance varies depending on system configuration. Check with your system manufacturer or retailer or learn more at http://intel.com. Intel and the Intel logo are trademarks of Intel Corporation in the United States and other countries. *Other names and brands may be claimed as the property of others.
Copyright © Intel Corporation 2019

