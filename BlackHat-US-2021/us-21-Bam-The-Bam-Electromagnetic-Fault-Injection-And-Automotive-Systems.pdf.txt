Bam the BAM - Electromagnetic Fault Injection & Automotive Systems

Colin O'Flynn Head Custodian, NewAE Technology Inc.

#BHUSA @BlackHatEvents

About Me

Not near much "tech-wise", but also looks like this!
#BHUSA @BlackHatEvents

About Me

Tooling around hardware security (ChipWhisperer, ChipSHOUTER, etc)
https://www.newae.com/chipwhisperer

Educational Resources

https://nostarch.com/hardwarehacking (Cover may look different)
#BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

E99 ECU

E41 ECU

E99: NXP MPC5777C Based

E41: NXP MPC5676R Based

Other "new-gen" ECUs also based on this part (E88 at least)

#BHUSA @BlackHatEvents

Bonus ­ "Live" Teardowns I made of E41 Work
Part 1: https://www.youtube.com/watch?v=Icw7GGriHzY Part 3: https://www.youtube.com/watch?v=_SCJzzQckCA Part 2: https://www.youtube.com/watch?v=orksRsHU0Bc Part 4: https://www.youtube.com/watch?v=pkhV9K9raHE
#BHUSA @BlackHatEvents

Introduction to PowerPC 5000 Series
· Jointly developed by Motorola Freescale NXP and ST Microelectronics. · Multiple versions of the devices:
· Later parts have more security options. · Part numbering series varies between NXP & ST variants.
#BHUSA @BlackHatEvents

MPC55xx v. MPC56xx v. MPC57xx
NXP MPC55xx / MPC56xx normally have: Boot Assist Module (BAM) code in ROM (?) brings part up & passes control to user code. Special boot mode pins allow booting into UART or CAN bootloader. Simple configuration based on bit/byte settings of certain flash memory addresses.
NXP MPC57xx normally have: Boot Assist Module (BAM) or Boot Assist Flash (in flash) brings part up. Flash-first boot options to ignore external pins. Device lifecycle state to lock various settings. Complex configuration based on configuration fields. Various security options (AES accelerators with SHE support, up to separate HSM core).
#BHUSA @BlackHatEvents

Configured from external pins
Boot Assist Module (BAM)

#BHUSA @BlackHatEvents

Boot Assist Module (BAM)
Serial Protocol

#BHUSA @BlackHatEvents

BAM Boot Modes
#BHUSA @BlackHatEvents

Power Analysis Setup

NAE-CW308T-MPC5676R

(+CW-Lite + UFO Board)

#BHUSA @BlackHatEvents

Power Analysis?

https://github.com/newaetech/chipwhisperer-target-cw308t/tree/master/CW308T_MPC5Y

#BHUSA @BlackHatEvents

Power Analysis of Password Check
#BHUSA @BlackHatEvents

Electromagnetic Fault Injection

Most devices will be "vulnerable" to this attack.
Countermeasures in software possible... I would expect similar results on any similar chip.

Blackhat USA 2019 ­ when I risked a bitcoin live!
#BHUSA @BlackHatEvents

EMFI Example

#BHUSA @BlackHatEvents

EMFI on Various Targets ­ CW308T-MPC5676R
#BHUSA @BlackHatEvents

EMFI on Various Targets ­ 5676DK
#BHUSA @BlackHatEvents

EMFI on Various Targets ­ E41 (ECU)
#BHUSA @BlackHatEvents

EMFI on Various Targets ­ 5566DK
MPC5566 Device (Similar but Different)
#BHUSA @BlackHatEvents

Detectable Results

Err-Reset Normal
Err-Protocol Err-RunFail Err-RunFail
Success

Fault Does Not Reset Target
  
  

Password Accepted
N/A
 
  

Code Downloads OK
N/A N/A
   

Code Runs
N/A N/A N/A
  

Flash Access Enabled
N/A N/A N/A
N/A
 

NOTE: The BAM UART protocol echos all characters & stops when it no longer expects data. We use this feature to attempting sending an additional extra character that should not be echo'd once data download is completed. This lets us detect data download failures where the length has been corrupted.

#BHUSA @BlackHatEvents

Introduction to PowerPC 5000 Series

CW308 = NAE-CW308T-MPC5676R 5676DK = MPC5676R Dev Kit E41 = GM E41 ECU on bench 5566DK = MPC5566 Dev Kit

1122.. = Sending incorrect private password FEE.. = Sending public password
4mmCW = using 4mm, Clockwise Winding Coil Others = using 4mm, Counter-Clockwise Winding Coil
#BHUSA @BlackHatEvents

Ardunio Powered Attack ("Workbench")
SOIC-8 Clip on LIN transceiver to access UART pins. EMFI Tool.
ECU Power.
Reset net connection. Status/Password Display.
Arduino pre-programmed with attack + BAM download.
#BHUSA @BlackHatEvents

Ardunio Powered Attack + Scanning ("Workbench")
#BHUSA @BlackHatEvents

Resources for your PowerPC Exploration
More details of this exact work (+ video links earlier):
https://colinoflynn.com/2020/11/bam-bam-on-reliability-of-emfi-for-in-situ-automotive-ecu-attacks/ https://eprint.iacr.org/2020/937.pdf
General related material:
https://www.github.com/newaetech/chipwhisperer https://nostarch.com/hardwarehacking https://media.newae.com/appnotes/NAE0011_Whitepaper_EMFI_For_Automotive_Safety_Security_Testing.pdf
#BHUSA @BlackHatEvents

Questions & More!

Twitter @colinoflynn Email coflynn@newae.com

Blog Site oflynn.com Company newae.com (see whitepaper AN0011 related to EMFI)

Documentation chipshouter.com chipwhisperer.com

#BHUSA @BlackHatEvents

