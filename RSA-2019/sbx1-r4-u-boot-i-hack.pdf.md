SESSION ID: SB1-R4
U-Boot, I-Hack
Carlota Bindner
Security Associate Rapid7 @carlotabindner

Andrew Bindner
Manager, Penetration Testing Rapid7 @schlpr0k

#RSAC

IoT Product Security

#RSAC
Risks IoT Product Security
How does your company approach product security? Is it effective? System and User Security Protections Intellectual Property
3

#RSAC
Intellectual Property
$250
4

Das U-Boot

#RSAC
Why Attack U-Boot?
Universal Boot Loader Multi-arch support
­ ARM, MIPS, x86, etc.
Supports Onboard Storage Supports Serial Ports Network Boot Capability
6

Market Share

56%

1% 2%
22%
7% 5% 5%

Bootbase BSP CFE Other Redboot RouterBOOT rtkload U-Boot

2%
Source: https://wikidevi.com/wiki/Property:Stock_bootloader/full

#RSAC

#RSAC
Importance of Boot Loader Security
Boot Loader Sits Outside of the Kernel Attack Surface:
­ Tamper with Firmware ­ Deny Firmware from Loading ­ Variable Manipulation ­ Start/Stop Services ­ Data Theft/Injection ­ Exploitation into other parts of the ecosystem
8

#RSAC
Demo #1 ­ Variable Manipulation
9

#RSAC
Demo #2 ­ TFTP Boot Manipulation
10

#RSAC
Impact of Accessing Firmware
Stored Credentials Remote Sessions Controlling Other Devices Source Code API & Web App Info Potential Information Leakage Intellectual Property Loss
11

Hardening U-Boot

#RSAC
Establish Security During Development
Physical Hardware Security Considerations Verified/Secure Boot Encryption Trusted Zones Review Security for Chip Data Sheets Disable Debug Interfaces BEFORE Production Other Ecosystem Protections

Follow-up Actions
Life Cycle & Regular Review Develop Internal Policies & Checklists Enable Verified/Secure Boot Implement Encryption Protect Firmware in Transit and at Rest Ecosystem Security Assessment

#RSAC
Management Development

14

