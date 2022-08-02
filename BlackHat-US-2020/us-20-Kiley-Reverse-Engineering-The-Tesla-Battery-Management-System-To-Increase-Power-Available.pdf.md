Reverse Engineering the Tesla Battery Management System to
Increase Power Available
By Patrick Kiley
#BHUSA @BLACKHATEVENTS

Patrick Kiley ­ Principal Security Consultant - Rapid7
· Member of the Penetration Testing team at Rapid7 · Performed research in Avionics security · Internet connected transportation platforms · Experience in hardware hacking, IoT, Autonomous
Vehicles, and CAN bus
#BHUSA @BLACKHATEVENTS

Topics
· Architecture of the Model S and Battery Management System(BMS) · Performance and Ludicrous timeline · Hardware changes · Data stored in toolbox · Firmware changes · Shunt modification · Upgrade process · Failure and what I learned · Next steps

#BHUSA @BLACKHATEVENTS

Model S Architecture
· Central Information Display (CID): Nvidia Tegra based
· Gateway: a security component, stores vehicle configuration, sits between the various CAN buses and the CID
· Powertrain (PT) CAN bus, contains the BMS, Drive units, charging, thermal control and other powertrain related controllers
· PT CAN runs at 500 kBit/sec and is a standard vehicle CAN bus (differential signaling, 11 bit arb ids, etc)
· PT CAN supports UDS standard

#BHUSA @BLACKHATEVENTS

BMS Overview
· TI TMS320C2809 ­ Main microprocessor · Altera CPLD ­ Hardware backup for TMS320 · Current Shunt with STM8 , measures current coming from the battery · Precharge Resistor, prevents inrush current damage · BMB boards on each battery pack, these include bleed resistors to balance
packs
All the firmware changes are on the TMS320 Some settings are changed on the shunt, in addition it has a small physical modification
Full reversing of all the components is an ongoing project, so if you want to help, I am lacking in some of the skill areas

#BHUSA @BLACKHATEVENTS

#BHUSA @BLACKHATEVENTS

Ludicrous History
· P85D announced on Oct 10, 2014 · Ludicrous announced on July 17, 2015 · 10K for new buyers, 5K for existing P85D owners · Upgrade involved new contactors and pyro fuse. · Many performance battery packs would come standard with new components · They were "ludicrous capable" · All 100kWh performance battery packs are "ludicrous capable" · Ludicrous capable means add "performanceaddon 1" to internal.dat on the gateway
#BHUSA @BLACKHATEVENTS

I upgraded a donor vehicle
#BHUSA @BLACKHATEVENTS

Pack Dropped

#BHUSA @BLACKHATEVENTS

Fuse and Contactor Bay
#BHUSA @BLACKHATEVENTS

Shunt and Contactor Close up

#BHUSA @BLACKHATEVENTS

What about firmware?
· For this we need to dig into some python
· Tesla makes a diagnostic tool called toolbox, runs on windows, uses encrypted and compiled python modules
· The important files are contained as individual plugins with the .scramble extension
· All of the information needed to decrypt the scramble files are on a machine that is running toolbox
· Some of these scramble files include firmware as well as many other useful items
· Once decrypted, we can use Uncompyle6 to give us source code
· Tesla left all the source code comments in place. Thank you!

#BHUSA @BLACKHATEVENTS

Toolbox Uncompyled
#BHUSA @BLACKHATEVENTS

Helpful Comments
#BHUSA @BLACKHATEVENTS

Data Structures ­ Extract and Binwalk
#BHUSA @BLACKHATEVENTS

Bootloader
We already know from the donor vehicle's config that it had a pack id of "57"
These are the files we need from the extracted firmware
Pack id 57 becomes pack id 70 after the changes

#BHUSA @BLACKHATEVENTS

Firmware Upgrade
· All the instructions and files needed for the upgrade process were stored in Toolbox files
· DBC files to help understand signals on the PT CAN bus · ODX files that defined how to calibrate the shunt, grant security
access and upgrade the firmware · Files that stored calibration data and firmware · Text comments and text data structures that offered clues on
the process

#BHUSA @BLACKHATEVENTS

CAN and UDS
Sitting on top of the CAN network stack is a protocol called UDS, or "Unified Diagnostic Services", this protocol can be used to help technicians: · Diagnose problems · Read values from sensors · Update firmware
CAN networks use a descriptor file called a DBC file
UDS networks can use a scripting file called ODX or GMD
Used commercial tool Vehicle Spy to assist in the research
ARBS 7E2 and 202 from BMS identify max current as a static value. 232 (BMS), 266 (DI) and 2E5 (DIS), identify max power in watts, which varies based on SOC, temp, and power recently used

#BHUSA @BLACKHATEVENTS

DBC Turns this

#BHUSA @BLACKHATEVENTS

Into This

#BHUSA @BLACKHATEVENTS

ODX routines for shunt calibration
#BHUSA @BLACKHATEVENTS

Shunt Modification
· Shunt also needed a hardware modification · Single wire connecting the shunt to the CPLD · If this wire remained connected after the firmware update then the BMS would
generate an alert and refuse to close the contactors · Discovered ran through the upgrade process on a bench version of the
components · Made a breakout board to monitor the signals from the shunt · This also meant that the hardware and firmware both had to be updated before
the car was driven

#BHUSA @BLACKHATEVENTS

Upgrade Process
· Had access to garage and lift in Southern California · Drove there to do upgrade, arrive with low SOC · Drop pack, do hardware stuff · Reinstall pack, carefully (image is from borescope) · Flash BMS with special firmware for shunt modification · Flash BMS to new packID · Update internal.dat to add ludicrous and change packID · Redeploy firmware due to changed battery packID · Drive away and enjoy the ridiculous amount of torque?

#BHUSA @BLACKHATEVENTS

Final Steps
· Using known techniques that I have used before, I tried to redeploy the firmware, also tried to upgrade since I had access to several versions
· The car failed using every method I tried · Had to Tow the car from Rancho Cucamonga to Las
Vegas so I could continue to work on it · Cost me $360 or 3.6 hundred dollars, not great, not
terrible right?

#BHUSA @BLACKHATEVENTS

Learned something cool
· Gateway uses a file called firmware.rc · Gateway uses this as a validation check for the components · Calculated during upgrade/redeploy · When the BMS changed, so did its CRC · Changed the CRC based on CAN and value from
"signed_metadata_map.tsv" · Final CRC line is a JAMCRC based on overall file · Car woke up, errors cleared and car could be driven · Eventually figured out the reason for the earlier failure

#BHUSA @BLACKHATEVENTS

Power Before and After Upgrade
Before Upgrade 1300 Amps
After Upgrade 1500 Amps
Actual Available Why Lower?

#BHUSA @BLACKHATEVENTS

Further Research
· TMS320F2809 is supported in IDA Pro · ARBS 7E2 and 202 define max current · Seems possible to increase speed beyond ludicrous, it has been done by others (1000 HP RWD P85) · Just need to find the variables and "bump them up a bit", also might need to modify DU firmware · Would be extremely dangerous to do so · Could end up blowing up the Drive unit or battery pack, or worse, cause a fire and injury · Still it would be interesting to reverse engineer, hit me up if you would like to assist, I have a dug a lot deeper
than the information I am presenting here · Would like to understand shunt parameters CAU1, CGI1
#BHUSA @BLACKHATEVENTS

Referenced Material, Acknowledgements
Spaceballs movie, inspiration for Tesla Ludicrous https://www.imdb.com/title/tt0094012/ P85D announcement https://www.tesla.com/blog/dual-motor-model-s-and-autopilot Ludicrous announcement and P85D upgrade offer https://www.tesla.com/blog/three-dog-day What is a current shunt? https://youtu.be/j4u8fl31sgQ (electroboom) TMS320 datasheet https://www.ti.com/product/TMS320F2809 Intrepid Control Systems, makers of Vehicle Spy software https://intrepidcs.com/ Bitbuster, for allowing use of lift and garage The people who helped with the Toolbox reversing, you know who you are Tesla security team for letting me do this talk
#BHUSA @BLACKHATEVENTS

