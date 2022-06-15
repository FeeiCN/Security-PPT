IEEE Taggant System
Mark Kennedy, Igor Muttik

Who we are

¾ Representing IEEE Industry Connections Security Group (ICSG)

¾ Mark Kennedy ­ Chair of ICSG Malware Working Group, Symantec

¾ Igor Muttik ­ Vice-Chair of ICSG Malware Working Group, McAfee/Intel

¾ IEEE ICSG membership includes:

­ Ahn Labs

­ AVG

­ CSISS

­ Damballa

­ Eset

­ F-Secure

­ K7 Computing

­ Kaspersky Labs

­ Marvell

­ Microsoft

­ Nova Shield

­ Palo Alto Networks

­ Panda Software

­ Sophos ­ Trend Micro

AV vendors

­ Bitsum (PECompact) ­ EISST ­ Enigma ­ Obsidium ­ Oreans (Themida) ­ Sofpro (PCGuard) ­ VMPSoft (VMProtect)
Packer vendors

2

IEEE Software Taggant System

Agenda
¾ The problem ¾ The solution ­ Taggant System ¾ The players ¾ Benefits
­ For the Users (2 types) ­ For the Vendors (2 types)
¾ Taggants vs authenticode ¾ How the system works ¾ The lifecycle ¾ Current project status
3

IEEE Software Taggant System

The Packer Problem
¾ Packer Software takes an executable and "packs" it
¾ This packing changes the executable by: ­ Compressing (packed file is smaller than the original) ­ Anti-Debugging (packed file is obfuscated to make reverseengineering difficult or impossible) ­ Using p-code virtualization (code executes under an interpreter) ­ Combination of above methods
¾ Each of these changes have certain options
¾ By varying these options, one can make a near limitless number of variants from a single executable
¾ This becomes extremely cheap Server Side Polymorphism

4

IEEE Software Taggant System

Definitions
¾ Packed File (Obfuscated Software or Malware) ­ A result of applying Packer Software to a program file. This output file may or may not have a taggant associated with it.
¾ Packed File User ­ The end user, an individual who runs it. ¾ Packer User ­ An individual or organization that purchases or obtains Packer
Software from a Software Packer Vendor. ¾ Packer Software ­ The tool used by Packer Users to create Packed Files. ¾ Software Packer Vendor ­ Develops, sells and markets the Packer Software
to Packer Users. ¾ Security Vendors ­ Provide software to inspect files (Packed Files and other
files which may or may not include a taggant).

5

IEEE Software Taggant System

A taggant is a chemical or physical marker added to materials to allow various forms of testing. Taggants allow testing marked items for qualities such as lot number and concentration (to test for dilution, for example). In particular, taggants are known to be widely used in
plastic, sheet and flexible explosives.
http://en.wikipedia.org/wiki/Taggant

6  

IEEE  So&ware  Taggant  System  

The IEEE Solution ­ Software Taggant

¾ The IEEE Software Taggant System will allow the "tagging" of the output of Packer Software with a cryptographically secure signature that enables positive origin identification and integrity of a Packed File using standard PKI techniques.
­ It is a portable C library
­ For packer vendors to write a taggant
­ For AV companies to read and verify it

¾ This will effectively "de-anonymize" code created by packers.

Vendors

¾ Packing of files creates problems for all the players:

­ For security companies (AV)

Packer Vendors

Security Vendors

­ For Software Packer Vendors (producers of packers)

­ For the users of packers (who pack software for the end users)

­ For the end users

Users

¾ Our solution: Software Taggant System

Packer Users

End Users

7

IEEE Software Taggant System

Benefits for Everyone!
¾ Security Vendors ­ More proactive protection ­ Less false positives and slowdowns ­ Less resources wasted
¾ Software Packer Vendors ­ Less false positives ­ Enforcing of licensing, less piracy, higher returns ­ One point of contact with security industry ­ SPV are now part of the solution ­ Competitive benefits ­ It is free
¾ Packer Users and End-Users ­ Less false positives and slowdowns ­ It is transparent and free (unlike digital signatures)
¾ We are hoping to solve the problem of packed malware in ~2-3 years

8

IEEE Software Taggant System

Taggant vs authenticode

taggant

¾ Taggant contains a "performant" hash (SHA256 by default) ­ Covers only vital executable areas
¾ Taggant allows a fall-back on to a "default" hash ­ It covers the whole file (almost whole) ­ Will be used if the performant hash is broken
¾ Creating and using files with taggants is free ­ Included by the packing software automatically ­ The PKI infrastructure will be sponsored by AV companies
¾ Taggants are compatible with authenticode ­ Digital signature can be applied after a packer included a taggant

9

How the System Works

¾ Simple 3-level PKI system

¾ IEEE at the root of trust

¾ Authorizes packer vendors

¾ They manage certificates for Packer Users ­ Issue, revoke, etc.
¾ Each installation embeds its license into the taggant

Packer  A   Installa.ons  

¾ AV products can then block packed malware by recognizing bad sources

IEEE Taggant Root CA
IEEE Shared
CA
Packer  B   Installa.ons  

Managed   by  IEEE  
Packer  C   Installa.ons  

10

IEEE Software Taggant System

The lifecycle
Step 1 ­ packer vendor
New packer vendor contacts IEEE IEEE verifies the vendor IEEE creates a vendor login Vendor asks for a URL for a user URL is embedded into the license for each user's packer setup Packer user gets the packer setup
Step 2 ­ packer software setup
The setup logs into a unique URL IEEE creates a key pair Setup gets a certificate back

Step 3 ­ packer obfuscates a file
Packer is executed to pack a file Taggant is created with 3 hashes Timestamp is included Setup/user certificate is included Taggant is part of the packed file Packed file is distributed
Step 4 ­ packed file executes
End user runs a packed file AV checks the source (the setup certificate & maybe a timestamp) AV blocks if bad

11

IEEE Software Taggant System

Status of the project
¾ Documentation is ready
¾ IEEE issued RFP with the deadline on 07 September 2011 ­ Write library code in C
¾ Implementation to be ready in November 2011

12

IEEE Software Taggant System

Questions

http://standards.ieee.org/develop/indconn/icsg

13

IEEE Software Taggant System

