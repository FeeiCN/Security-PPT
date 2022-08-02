SESSION ID: HTA-R03
Malicious, Misbehaving or Misunderstood Making Bad USBs Good Again

Eric D Knapp
Fellow & CPO, Connected Cyber Honeywell Connected Enterprise @EricDKnapp

Peter Viscarola
Consulting Partner OSR Open Systems Resources, Inc. @osrdrivers

#RSAC

#RSAC
what just happened ...?
"The Vape-inator"

#RSAC
what just happened ...?

Device function to Bus

Power to e-cig

"The Vape-inator"

#RSAC
Why did that just happen ...? (take-aways from this session)
A broader understanding of the USB protocol as a threat vector
­ Think beyond malware and data theft
(Some) knowledge of and respect for the USB protocol
­ 564 page standard
A desire to re-evaluate USB security within your own organization
­ The most ubiquitous data flow in your infrastructure more prevalent than Ethernet
Universal Serial Bus (USB) is a powerful protocol that has revolutionized computing. Reap it's benefits while minimizing risk. Viva la revolucion!
4

USB Threat Types
(more than malware)

USB hardware

Programable Microcontrollers

Maliciously Reprogrammed
peripherals

Not Reprogrammed
peripherals

I/O manipulation (HID)

Transfer malware

Data Theft

Damage

Derived from "USB Based Attacks" by Nir Nissim, Ran Yahalom, and Yuval Elovici; Malware lab, Cyber Security Research Center, Ben-Gurion University of the Negev

#RSAC
Electrical

Programable Microcontrollers

Maliciously Reprogrammed
peripherals

Not Reprogrammed
peripherals

#RSAC
Electrical

30

USB Harpoon

31

VAPE-inator

32

... What's next?

Source: "USB Based Attacks" by Nir Nissim, Ran Yahalom, and Yuval Elovici; Malware lab, Cyber Security Research Center, Ben-Gurion University of the Negev
7

#RSAC
What USB Threats Really Look Like

Universal Serial Bus
(the "S" doesn't stand for "Simple")

#RSAC
Identifying USB Devices

During connection, each USB device identifies itself by sending a

series of descriptors to the host

The Sources/Syncs

Device

for device data

Descriptor

ConfWiguhraatttioypne of device is this and wChoonmfigaudreatitio?n

Descriptor

Descriptor

What major "operating modes" are available for the device?

Interface

Interface

Interface

Interface

Descriptor

Descriptor Descriptor

Descriptor

What collections of features are available from the device?

Endpoint Descriptor
Endpoint Descriptor
Endpoint Descriptor

10

#RSAC
This Was Designed to be "Simple"
No specific device type info here
Vendor ID = 0x045E = Microsoft
What could possibly go wrong?
Remember... This scheme dates to USB V1.0 Which was released in January 1996
Product Name is "Microsoft 5-Button Mouse ..."
11

Even Drilling Down Into Lower Levels

#RSAC

... Question Remain

Class is "Human Interface Device" Further described by HID Descriptor

Wonder what this is?

#RSAC
There are plenty of devices like this one
Should we trust this device?
No specific device type info here Vendor ID = Generic silicon mfg
No more specific info available
13

#RSAC
So... What Does This Tell Us?
The USB spec for device identification was initially created in a "simpler time" The device is entirely responsible for presenting its descriptor information to the OS at runtime, with no other validation/checks Many devices are insufficiently transparent in their descriptions The hierarchy of descriptors has grown and gotten more complex... The OS has a big job, full of heuristics developed over time, to determine what a device is (and what it will do once connected)
14

Hacking USB
(and why it works)

#RSAC
how to manipulate the standard
Lie about what you are
16

#RSAC
how to manipulate the standard
Have multiple personalities
17

#RSAC
how to manipulate the standard
Be something tempting and unknown
18

#RSAC
how to manipulate the standard
Be electric
19

#RSAC
how to bypass the standard
Be a vampire troll
20

just the tip of the iceberg ...
Device Function Routing & Data
Flow
Bus RX/TX

#RSAC
Device Function Routing & Data
Flow Bus RX/TX

Source: USB.org, Universal Serial Bus 3.2 Specification

just the tip of the iceberg ...
Device Function Routing & Data
Flow
Bus RX/TX

#RSAC
Device Function Routing & Data
Flow Bus RX/TX

Source: USB.org, Universal Serial Bus 3.2 Specification

just the tip of the iceberg ...
Device Function Routing & Data
Flow
Bus RX/TX

#RSAC
Device Function Routing & Data
Flow Bus RX/TX

Source: USB.org, Universal Serial Bus 3.2 Specification

Don't Worry USB Happy
(there's some good news, too)

#RSAC
There's Some Good News about Bad USB
A way to TRUST your USB devices New Authorization Specifications
26

#RSAC
TRUST (Trusted User Substantiation Technology)
27

#RSAC
TRUST Original Design Precepts
Primary Design Principles:
­ Block device at the lowest level ­ Get information from the device, and make policy decision based solely
on that info ­ Everything needs to be Consciously Authorized
28

#RSAC
Blocking USB Devices at the Lowest Level
GoodUSB Authorization GoodUSB Filter USB Hub
USB Controller
29

#RSAC
What We Learned (Part 1)
Relying solely on the USB Device information is not good enough What's definitive is not what the USB Device says it is...
it's how the OS treats the device
­ OS decision process is complex, taking into account many factors ­ The driver the OS chooses may be "OS Standard" or "Vendor Specific"...
makes all the difference
30

OSR 15 November 2017

#RSAC

What We Learned (Part 2)

Presenting the user info solely from the USB Device isn't very helpful

31

what we learned (3)
Ask Windows how it will treat the device once it's connected
­ Get information from the device ­ Use OS-provided SetupDiXxxx API to determine the INF/Driver that
Windows would use
For well-know classes where information from Windows isn't sufficient (e.g. HID and Mass Storage), mimic higher-level Windows processing to determine data on device use
When Conscious Authorization is needed, present clear info from the Device the OS, and our device device use data

#RSAC
"Hey Windows... What'll you do with this device??"

32

#RSAC
USB-C authorization
33

#RSAC
Apply What You Have Learned Today
Next week you should:
­ Assess existing USB defensive measures, considering all 3 attack types
In the first three months following this presentation you should:
­ Complete an inventory of USB devices currently in use: what role do these devices play in the daily operations of your business?
­ Assess your supply chain: what USB devices are you using? Are they trusted?
Within six months you should:
­ Adjust USB and removable media policies to account for your findings. ­ Consider technical controls to enforce these policies
34

#RSAC
Special thanks to:
Honeywell Connected Cyber research teams The Honeywell legal and media teams
(for keeping an open mind about security presentations like this)
The valuable research of:
Karsten Nohl and Jakob Lell (BadUSB) @SamyKamkar (PosionTap) @hak5darren and all at Hak5 (Rubber Duckies, Bash Bunnies & more) Everyone who helped put the Vape-inator together
Our partners at Open Systems Resources

Thank You (SB)
@EricDKnapp @osrdrivers

