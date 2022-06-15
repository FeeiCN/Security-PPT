Safeguarding UEFI Ecosystem: Firmware Supply Chain is Hard(coded)
Alex Tereshkin, Alex Matrosov, Adam `pi3' Zabrocki
#BHUSA @BlackHatEvents

Who are we?

Alex Tereshkin @AlexTereshkin
· BlackHat speaker and trainer · Reverse engineer · UEFI security researcher · More...

Alex Matrosov @matrosov
· Security REsearcher since 1997 · Conference speaker and trainer · Breaking all shades of firmware · codeXplorer and efiXplorer plugins · Author "Bootkits and Rootkits" book · More...

Adam `pi3' Zabrocki @Adam_pi3
· Phrack author · Bughunter (Hyper-V, Linux kernel,
OpenSSH, Apache, gcc SSP, more...) · Creator and a developer of Linux Kernel
Runtime Guard (LKRG) · More...

NVID·IAMPorreo... datuNcvitdiaSecurity Team

#BHUSA @BlackHatEvents

Outline
· Research Motivation · UEFI Ecosystem Firmware Supply Chain is Hard(coded) · Attacking (pre)EFI Ecosystem · Safeguarding UEFI Ecosystem · Summary
#BHUSA @BlackHatEvents

Motivation for This Research
#BHUSA @BlackHatEvents

The Evolution of Advanced Threats: REsearchers Arms Race
#BHUSA @BlackHatEvents
DHS-CISA-Strategy-to-Fix-Vulnerabilities-Below-the-OS-Among-Worst-Offenders

Good Old Days of Attacking BIOS
Does anything change?

BHUSA09-Wojtczuk-AtkIntelBios-SLIDES

#BHUSA @BlackHatEvents

WSMT (Windows SMM Security Mitigation Table) has a static nature by design. Having the mitigation enabled doesn't mean this mitigation is used or configured correctly.

#BHUSA @BlackHatEvents

UEFI Ecosystem Firmware Supply Chain
is Hard(coded)
#BHUSA @BlackHatEvents

UEFI Ecosystem Firmware Supply Chain is Hard(coded)

Roots of Trust and Attestation | Trammell Hudson

#BHUSA @BlackHatEvents

NVRAM Variables Access During Boot Flow
#BHUSA @BlackHatEvents

NVRAM PEI/DXE/SMM Threat Model
Attacker Model: The local attacker uses privileged host OS access to trigger the vulnerability gaining PEI/DXE stage code execution in System Management Mode (SMM).
Potential Impact: PEI/DXE code execution in SMM context allows potential installation of persistent implants in the NVRAM SPI flash region. Implant persistence across OS installations, can further bypass Secure Boot attacking guest VM's in bare metal cloud deployments.
#BHUSA @BlackHatEvents

NVRAM Persistence on SPI Flash
· NVRAM region is not protected by Intel Boot Guard and can be abused by attacker with physical access (supply chain vector).

· Arbitrary code execution via GetVariable() and memory leak over SetVariable() is common, attacker can modify persistent NVRAM storage and install fileless DXE/SMM/PEI implant (shellcode).

Most security solutions inspect only UEFI drivers!

#BHUSA @BlackHatEvents

UEFI RE Methodology: Hex-Rays+ efiXplorer

binarly-io/efiXplorer: IDA plugin for UEFI firmware analysis and reverse engineering automation

#BHUSA @BlackHatEvents

DSA-2021-103: The Story of Two Buffer Overflows
· MirrorRequest: NVRAM variable insecure memset leads to stack overflow.
· AepErrorLog: NVRAM variable mistake in parsing routine leads to heap overflow.

DSA-2021-103: Dell PowerEdge Server Security Update for BIOS Vulnerabilities

#BHUSA @BlackHatEvents

CVE-2021-21555 (DSA-2021-103): AepErrorLog NVRAM variable

mEraseRecordShare buffer is allocated on heap.
AepErrorLog NVRAM variable is controlled by attacker.
A mistake in variable parsing leads to heap overflow resulting in execution of an attacker controlled payload.

HEAP OVERFLOW if var length is > 964 bytes

DXE: CrystalRidge (C4EB3614-4986-42B9-8C0D-9FE118278908)

#BHUSA @BlackHatEvents

CVE-2021-21555: AepErrorLog NVRAM variable

mEraseRecordShare buffer

is allocated on heap.
The payload is not measured

AepErrorLog NVRAM and TPM PCR's are not extended. HEAP OVERFLOW if var length

variable is controlled by

is > 964 bytes

attacker. Remote health attestation will not detect the exploitation.

A mistake in variable parsing leads to heap overflow resulting in execution of an attacker controlled payload.

DXE: CrystalRidge (C4EB3614-4986-42B9-8C0D-9FE118278908)

#BHUSA @BlackHatEvents

DSA-2021-103 (CVE-2021-21556) / INTEL-SA-00463 (CVE-2020-24486) MirrorRequest NVRAM variable
If MirrorRequest var length > 5, a subsequent memset will overwrite PEI stack with zeroes in PEI phase. An attacker controls the length of overwritten buffer and can modify parts of saved return addresses to change execution flow which may lead to arbitrary code execution in PEI phase.
Stack buffer: will overwrite saved EIP if length is > 0xD1 bytes

PEI: UncoreInitPeim (D71C8BA4-4AF2-4D0D-B1BA-F2409F0C20D3)

#BHUSA @BlackHatEvents

CVE-2021-21556/CVE-2021-24486 (INTEL-SA-00463)
MirrorRequest NVRAM variable
If MirrorRequest var length > 5, a subsequent memset will
overwrite PEI stack with zeTrhoeesp. ainylPoEaI dphiassne.ot measured An attacker controls thealnedngTthPMof oPvCeRrw'sriattreennbouftfeerxatnednded.
can modify parts of saved return addresses to change
eexxeeccuuttiiooRnneifnlmoPwoEtIwephhhicaehseam.ltahy aletatdestotaatriboitnrawryilclondoet detect the exploitation.
Stack buffer: will overwrite saved EIP if length is > 0xD1 bytes

PEI: UncoreInitPeim (D71C8BA4-4AF2-4D0D-B1BA-F2409F0C20D3)

#BHUSA @BlackHatEvents

Attacking (pre)EFI Ecosystem
#BHUSA @BlackHatEvents

Pre-EFI Initialization and NVRAM variables

· PEI code also reads configuration data from NVRAM variables · By design, NVRAM is considered read only in PEI stage · EFI variables are as good attack surface for PEI as they are for DXE · The API for reading EFI vars is a bit different for PEI though

#define EFI_PEI_READ_ONLY_VARIABLE2_PPI_GUID \ { 0x2ab86ef5, 0xecb5, 0x4134, { 0xb5, 0x56, 0x38, 0x54, 0xca, 0x1f,
0xe1, 0xb4 } }

typedef

EFI_STATUS

(EFIAPI *EFI_PEI_GET_VARIABLE2)(

IN CONST EFI_PEI_READ_ONLY_VARIABLE2_PPI *This,

IN CONST CHAR16

*VariableName,

IN CONST EFI_GUID

*VariableGuid,

OUT

UINT32

*Attributes,

IN OUT UINTN

*DataSize,

OUT

VOID

*Data OPTIONAL

);

Scan for this GUID to quickly locate PEI code that reads NVRAM variables (and potentially has vulns that have to be fixed)
#BHUSA @BlackHatEvents

Pre-EFI Initialization and NVRAM variables
This is an example of EFI var reading from UncoreInitPeim.efi running on Grantley, and there are problems.
#BHUSA @BlackHatEvents

How to know when your Uncore is up to no good
· No status check after GetVariable() · DataSize may become larger than 2048 bytes if GetVariable() call fails with
EFI_BUFFER_TOO_SMALL (that is, if "syscg" NVRAM variable is longer than 2048 bytes) · No check for a return value of AllocatePool() · memcpy() will not overflow syscg, but may copy some stack memory to it
This is not particularly useful but looks like this code may be full of surprises. Let's see what it does next.
#BHUSA @BlackHatEvents

Hey Uncore, GetVariable() API is dangerous when called in a loop
It may change DataSize and you overflow your buffer on the next iteration with an attacker-controlled data if you don't check the returned state:
This code reads a chain of EFI variables. Each var contains a name of the next one in the beginning of the data.
#BHUSA @BlackHatEvents

Hey Uncore, GetVariable() API is dangerous when called in a loop
It may change DataSize and you overflow your buffer on the next iteration with an attacker-controlled data if you don't check the returned state:
DataSize is not reinitialized before GetVariable(). Therefore, DataSize value is controlled by an attacker.
#BHUSA @BlackHatEvents

Hey Uncore, GetVariable() API is dangerous when called in a loop
It may change DataSize and you overflow your buffer on the next iteration with an attacker-controlled data if you don't check the returned state:
ChunkName is a stack buffer. When GetVariable encounters a large var (length > DataSize), DataSize is overwritten with the actual length. On the next iteration a stack overflow occurs when GetVariable() assumes ChunkName length is at least DataSize bytes.
This stack buffer is overflowed. We don't have stack cookies or ASLR in PEI code. #BHUSA @BlackHatEvents

We don't even need to exploit this stack overflow to make our unsigned code execute during PEI.
This feature was designed to run arbitrary unsigned code blobs stored in EFI variables!
#BHUSA @BlackHatEvents

We don't even need to exploit this stack overflow to make our unsigned code execute during PEI.
This feature was designed to run arbitrary unsigned code blobs stored in EFI variables!
Yes, this is a reference code.
#BHUSA @BlackHatEvents

Uncore features unsigned module loading
This walks the EFI var chain starting from variable "toolh" and builds a contiguous 32bit PE image. The payload may be 100kb in size or even more, available NVRAM space is the limit.
This executes the PE entry point.
#BHUSA @BlackHatEvents

Uncore features unsigned module loading
This walks the EFI var chain starting from variable "toolh" and builds a contiguous 32bit PE image. The payload may be 100kb in size or even more, available NVRAM space is the limit.
This executes the PE entry point.
#BHUSA @BlackHatEvents

Uncore features unsigned module loading
This walks the EFI var chain starting from variable "toolh" and builds a contiguous 32bit PE image. The payload may be 100kb in size or even more, available NVRAM space is the limit.
This executes the PE entry point.
#BHUSA @BlackHatEvents

Uncore features unsigned module loading
This walks the EFI var chain starting
fcroonmtigvuaoriuasb3le2T"bhtioteoPlElhoi"maadanTgedPedb.MuuilPndsCsaiRgsneadrecnoodteeisxtneontdmede.asured,
The payload may be 100kb in size
or even mRoerme,oatveaihlaeballethNVaRttAeMstation will not detect the exploitation.
space is the limit. This executes the PE entry point.
#BHUSA @BlackHatEvents

What is the purpose of this feature?
This was intended to be used for debugging or testing purposes.
Intel guidance is this feature is not supposed to be enabled if a physical presence has not been established.
BIOS vendors are supposed to implement their own code for establishing physical presence. For example, a physical jumper setting may be used.
If this feature is not used by OEM vendors then this feature should not be compiled in.
#BHUSA @BlackHatEvents

What is the purpose of this feature?
This was intended to be used for debugging or testing purposes. Intel guidance is this feature is not supposed to be enabled if a physical presence has not been established. BIOS vendors are supposed to implement their own code for establishing physical presence. For example, a physical jumper setting may be used.
This is what a poor implementation looks like:
#BHUSA @BlackHatEvents

Not all BIOS vendors are oblivious to the guidelines
Dell has permanently disabled a setup knob setting for this feature, making the module loading code unreachable. Good job!
#BHUSA @BlackHatEvents

How did it happen?
1. Intel implemented a dummy function for a physical presence which always returns TRUE. Should have put "return FALSE".
2. IBVs have been told by Intel to implement the code which checks for physical jumpers etc. 3. Instead, IBVs just reused Intel's reference code implementation without making any changes
to the relevant code. Now Grantley+ server platforms have this presence check effectively disabled because of this.
"Reference implementations" often become the defacto implementation -- due care with proper (safe) defaults should be the norm.

Actual bug is here

#BHUSA @BlackHatEvents

CVE-2021-0114: Intel's response
· BSSA Target-Based Loader is a Design for Manufacturing (DFx) feature intended to be used on manufacturing lines.
· Intel's Implementation and Security Guidelines state this feature is not intended to be included in production use, but if it is included then it must be further secured. A suggested method is to confirm physical presence and would vary by different motherboards and systems each requiring their own implementation.
· Transparency is part of our security first pledge. Intel has published an Intel® BSSA DFT Advisory (INTEL-SA-00525) and has developed updated reference UEFI Firmware for potentially affected platforms which includes a physical presence check that always returns False thus necessitating IBV's to complete the implementation for a specific motherboard or system if they included this DFx feature in production.
#BHUSA @BlackHatEvents

Looking up the details
Let's look up the GUID for "toolh" and "syscg" EFI variables used by this feature.
#BHUSA @BlackHatEvents

Looking up the details
https://edk2.groups.io/g/devel/message/46002

+## Include/SsaCommonConfig.h +gSsaPostcodeHookGuid = {0xADF0A27B, 0x61A6, 0x4F18, {0x9E, 0xAC, 0x46, 0x87, 0xE7, 0x9E, 0x6F, 0xBB}} +gSsaBiosVariablesGuid = {0x43eeffe8, 0xa978, 0x41dc, {0x9d, 0xb6, 0x54, 0xc4, 0x27, 0xf2, 0x7e, 0x2a}} +gSsaBiosResultsGuid = {0x8f4e928, 0xf5f, 0x46d4, {0x84, 0x10, 0x47, 0x9f, 0xda, 0x27, 0x9d, 0xb6}} ... +## +## SystemAgent +## +gSsaBiosCallBacksPpiGuid = {0x99b56126, 0xe16c, 0x4d9b, {0xbb, 0x71, 0xaa, 0x35, 0x46, 0x1a, 0x70, 0x2f}} +gSsaBiosServicesPpiGuid = {0x55750d10, 0x6d3d, 0x4bf5, {0x89, 0xd8, 0xe3, 0x5e, 0xf0, 0xb0, 0x90, 0xf4}}

So, the feature is called "SSA".
And the payload is probably called "SystemAgent"

#BHUSA @BlackHatEvents

Looking up the details

BSSA was available since at least 2016

Intel® Server System M50CYP1UR TPS

#BHUSA @BlackHatEvents

Payload Example: Escalate from PEI to SMM

PEI phase

32-bit 64-bit

DXE phase

Wait for end-of-PEI signal
Search for EFI_BOOT_SERVICES
in DxeCore image
Allocate and map memory for DXE payload

DXE Runtime

SmmCore loaded?

Unhook LocateProtocol

Search for EFI_SMM_SYSTEM_TABLE

SMM
Unhook SmmLocateProtocol

Install
LoadedImageProtocol
callback

Allocate and map SMRAM memory for SMM payload

Hook SmmLocateProtocol

Install SW SMI handler

Hook DxeCore's LocateProtocol

LocateProtocol hook executes

SW SMI handler executes payload at runtime
#BHUSA @BlackHatEvents

DEMO TIME
#BHUSA @BlackHatEvents

Safeguarding UEFI Ecosystem
#BHUSA @BlackHatEvents

Let's briefly talk about EFI Development Kit (EDK II)...
#BHUSA @BlackHatEvents

Let's briefly talk about EFI Development Kit (EDK II)... ... I mean CVE-2021-28216 ;-)
#BHUSA @BlackHatEvents

EFI Development Kit (EDK II)...

· An open-source implementation of the · EDK II supports tons of platforms including:

Unified Extensible Firmware Interface

· Intel

(UEFI) support by the community (TianoCore)

· AMD · ARM · Ampere

· EDK II is advertised as a modern, featurerich, cross-platform firmware development

· HiSilicon
· BeagleBoard · Marvell

environment for the UEFI and UEFI

· Raspbery Pi

Platform Initialization (PI) specifications

· RISC-V · Socionext

· NXP

· More...

#BHUSA @BlackHatEvents

EFI Development Kit (EDK II)...

· An open-source implementation of the · EDK II supports tons of platforms including:

Unified Extensible Firmware Interface

· Intel

(UEFI) support by the community (TianoCore)

· AMD · ARM · Ampere

· EDK II is advertised as a modern, featurerich, cross-platform firmware development

· HiSilicon
· BeagleBoard · Marvell

One bug... ... to rule them

environment for the UEFI and UEFI

· Raspbery Pi

all !

Platform Initialization (PI) specifications

· RISC-V

· Socionext

· NXP

· More...

#BHUSA @BlackHatEvents

EFI Development Kit (EDK II)...

· An open-source

· EDK II supports tons of

implementation of the Unified

platforms, including:

Extensible Firmware Interface · Intel

(UEFI) support by the community (TianoCore)

· AMD · ARM · Ampere

· EDK II is adFveortriseexdaams aple, CVE··-2HB0eiSa2igli1cleoB-no2a8rd216

modern, feature-rich, cross-

· Marvell

One bug... ... to rule them

platform firmware development · Raspbery Pi

all !

environment for the UEFI and

· RISC-V

UEFI Platform Initialization (PI) specifications

· Socionext · NXP · More...

#BHUSA @BlackHatEvents

CVE-2021-28216

//

// Update S3 boot records into the basic boot performance table.

while (GuidHob != NULL) {

//

FirmwarePerformanceData = GET_GUID_HOB_DATA (GuidHob);

VarSize = sizeof (PerformanceVariable);

PeiPerformanceLogHeader = (FPDT_PEI_EXT_PERF_HEADER *)

Status = VariableServices->GetVariable (

FirmwarePerformanceData;

VariableServices,

CopyMem (FirmwarePerformanceTablePtr,

EFI_FIRMWARE_PERFORMANCE_VARIABLE_NAME, FirmwarePerformanceData + sizeof (FPDT_PEI_EXT_PERF_HEADER),

&gEfiFirmwarePerformanceGuid,

NULL,

(UINTN)(PeiPerformanceLogHeader->SizeOfAllEntries));

&VarSize,

GuidHob = GetNextGuidHob

&PerformanceVariable

(&gEdkiiFpdtExtendedFirmwarePerformanceGuid, GET_NEXT_HOB

);

(GuidHob));

if (EFI_ERROR (Status)) {

FirmwarePerformanceTablePtr +=

return Status;

(UINTN)(PeiPerformanceLogHeader->SizeOfAllEntries);

}

} //

BootPerformanceTable = (UINT8*) (UINTN)

// Update Table length.

PerformanceVariable.BootPerformanceTablePointer; //

//

// Dump PEI boot records

((BOOT_PERFORMANCE_TABLE *) BootPerformanceTable)-

//

>Header.Length = (UINT32)((UINTN)FirmwarePerformanceTablePtr -

FirmwarePerformanceTablePtr = (BootPerformanceTable + sizeof (UINTN)BootPerformanceTable);

(BOOT_PERFORMANCE_TABLE));

GuidHob = GetFirstGuidHob

(&gEdkiiFpdtExtendedFirmwarePerformanceGuid);

#BHUSA @BlackHatEvents

CVE-2021-28216

//

// Update S3 boot records into the basic boot performance table.

while (GuidHob != NULL) {

//

FirmwarePerformanceData = GET_GUID_HOB_DATA (GuidHob);

VarSize = sizeof (PerformanceVariable);

PeiPerformanceLogHeader = (FPDT_PEI_EXT_PERF_HEADER *)

Status = VariableServices->GetVariable (

FirmwarePerformanceData;

VariableServices,

CopyMem (FirmwarePerformanceTablePtr,

EFI_FIRMWARE_PERFORMANCE_VARIABLE_NAME, FirmwarePerformanceData + sizeof (FPDT_PEI_EXT_PERF_HEADER),

&gEfiFirmwarePerformanceGuid,

NULL,

(UINTN)(PeiPerformanceLogHeader->SizeOfAllEntries));

&VarSize,

GuidHob = GetNextGuidHob

&PerformanceVariable

(&gEdkiiFpdtExtendedFirmwarePerformanceGuid, GET_NEXT_HOB

);

(GuidHob));

if (EFI_ERROR (Status)) {

FirmwarePerformanceTablePtr +=

return Status;

(UINTN)(PeiPerformanceLogHeader->SizeOfAllEntries);

}

} //

BootPerformanceTable = (UINT8*) (UINTN)

// Update Table length.

PerformanceVariable.BootPerformanceTablePointer; //

//

// Dump PEI boot records

((BOOT_PERFORMANCE_TABLE *) BootPerformanceTable)-

//

>Header.Length = (UINT32)((UINTN)FirmwarePerformanceTablePtr -

FirmwarePerformanceTablePtr = (BootPerformanceTable + sizeof (UINTN)BootPerformanceTable);

(BOOT_PERFORMANCE_TABLE));

GuidHob = GetFirstGuidHob

(&gEdkiiFpdtExtendedFirmwarePerformanceGuid);

#BHUSA @BlackHatEvents

CVE-2021-28216

//

// Update S3 boot records into the basic boot performance table.

while (GuidHob != NULL) {

//

FirmwarePerformanceData = GET_GUID_HOB_DATA (GuidHob);

VarSize = sizeof (PerformanceVariable);

PeiPerformanceLogHeader = (FPDT_PEI_EXT_PERF_HEADER *)

Status = VariableServices->GetVariable (

FirmwarePerformanceData;

VariableServices,

CopyMem (FirmwarePerformanceTablePtr,

EFI_FIRMWARE_PERFORMANCE_VARIABLE_NAME, FirmwarePerformanceData + sizeof (FPDT_PEI_EXT_PERF_HEADER),

&gEfiFirmwarePerformanceGuid,

NULL,

(UINTN)(PeiPerformanceLogHeader->SizeOfAllEntries));

&VarSize,

GuidHob = GetNextGuidHob

&PerformanceVariable

(&gEdkiiFpdtExtendedFirmwarePerformanceGuid, GET_NEXT_HOB

);

(GuidHob));

if (EFI_ERROR (Status)) {

FirmwarePerformanceTablePtr +=

return Status;

(UINTN)(PeiPerformanceLogHeader->SizeOfAllEntries);

}

} //

BootPerformanceTable = (UINT8*) (UINTN)

// Update Table length.

PerformanceVariable.BootPerformanceTablePointer; //

//

// Dump PEI boot records

((BOOT_PERFORMANCE_TABLE *) BootPerformanceTable)-

//

>Header.Length = (UINT32)((UINTN)FirmwarePerformanceTablePtr -

FirmwarePerformanceTablePtr = (BootPerformanceTable + sizeof (UINTN)BootPerformanceTable);

(BOOT_PERFORMANCE_TABLE));

GuidHob = GetFirstGuidHob

(&gEdkiiFpdtExtendedFirmwarePerformanceGuid);

#BHUSA @BlackHatEvents

CVE-2021-28216

//

// Update S3 boot records into the basic boot performance table.

while (GuidHob != NULL) {

//

FirmwarePerformanceData = GET_GUID_HOB_DATA (GuidHob);

VarSize = sizeof (PerformanceVariable);

PeiPerformanceLogHeader = (FPDT_PEI_EXT_PERF_HEADER *)

Status = VariableServices->GetVariable (

FirmwarePerformanceData;

VariableServices,

CopyMem (FirmwarePerformanceTablePtr,

EFI_FIRMWARE_PERFORMANCE_VARIABLE_NAME, FirmwarePerformanceData + sizeof (FPDT_PEI_EXT_PERF_HEADER),

&gEfiFirmwarePerformanceGuid,

NULL,

(UINTN)(PeiPerformanceLogHeader->SizeOfAllEntries));

&VarSize,

GuidHob = GetNextGuidHob

&PerformanceVariable

(&gEdkiiFpdtExtendedFirmwarePerformanceGuid, GET_NEXT_HOB

);

(GuidHob));

if (EFI_ERROR (Status)) {

FirmwarePerformanceTablePtr +=

return Status;

(UINTN)(PeiPerformanceLogHeader->SizeOfAllEntries);

}

} //

BootPerformanceTable = (UINT8*) (UINTN)

// Update Table length.

PerformanceVariable.BootPerformanceTablePointer; //

//

// Dump PEI boot records

((BOOT_PERFORMANCE_TABLE *) BootPerformanceTable)-

//

>Header.Length = (UINT32)((UINTN)FirmwarePerformanceTablePtr -

FirmwarePerformanceTablePtr = (BootPerformanceTable + sizeof (UINTN)BootPerformanceTable);

(BOOT_PERFORMANCE_TABLE));

GuidHob = GetFirstGuidHob

(&gEdkiiFpdtExtendedFirmwarePerformanceGuid);

#BHUSA @BlackHatEvents

CVE-2021-28216

//

// Update S3 boot records into the basic boot performance table.

while (GuidHob != NULL) {

//

FirmwarePerformanceData = GET_GUID_HOB_DATA (GuidHob);

VarSize = sizeof (PerformanceVariable);

PeiPerformanceLogHeader = (FPDT_PEI_EXT_PERF_HEADER *)

Status = VariableServices->GetVariable (

FirmwarePerformanceData;

VariableServices,

CopyMem (FirmwarePerformanceTablePtr,

EFI_FIRMWARE_PERFORMANCE_VARIABLE_NAME, FirmwarePerformanceData + sizeof (FPDT_PEI_EXT_PERF_HEADER),

&gEfiFirmwarePerformanceGuid,

NULL,

(UINTN)(PeiPerformanceLogHeader->SizeOfAllEntries));

&VarSize,

GuidHob = GetNextGuidHob

&PerformanceVariable

(&gEdkiiFpdtExtendedFirmwarePerformanceGuid, GET_NEXT_HOB

);

(GuidHob));

if (EFI_ERROR (Status)) {

FirmwarePerformanceTablePtr +=

return Status;

(UINTN)(PeiPerformanceLogHeader->SizeOfAllEntries);

}

} //

BootPerformanceTable = (UINT8*) (UINTN)

// Update Table length.

PerformanceVariable.BootPerformanceTablePointer; //

//

// Dump PEI boot records

((BOOT_PERFORMANCE_TABLE *) BootPerformanceTable)-

//

>Header.Length = (UINT32)((UINTN)FirmwarePerformanceTablePtr -

FirmwarePerformanceTablePtr = (BootPerformanceTable + sizeof (UINTN)BootPerformanceTable);

(BOOT_PERFORMANCE_TABLE));

GuidHob = GetFirstGuidHob

(&gEdkiiFpdtExtendedFirmwarePerformanceGuid);

#BHUSA @BlackHatEvents

CVE-2021-28216

Arbitrary

//

overwrite

// Update S3 boot records into the basic boot performance table.

while (GuidHob != NULL) {

//

FirmwarePerformanceData = GET_GUID_HOB_DATA (GuidHob);

VarSize = sizeof (PerformanceVariable);

PeiPerformanceLogHeader = (FPDT_PEI_EXT_PERF_HEADER *)

Status = VariableServices->GetVariable (

FirmwarePerformanceData;

VariableServices,

CopyMem (FirmwarePerformanceTablePtr,

EFI_FIRMWARE_PERFORMANCE_VARIABLE_NAME, FirmwarePerformanceData + sizeof (FPDT_PEI_EXT_PERF_HEADER),

&gEfiFirmwarePerformanceGuid,

NULL,

(UINTN)(PeiPerformanceLogHeader->SizeOfAllEntries));

&VarSize,

GuidHob = GetNextGuidHob

&PerformanceVariable

(&gEdkiiFpdtExtendedFirmwarePerformanceGuid, GET_NEXT_HOB

);

(GuidHob));

if (EFI_ERROR (Status)) {

FirmwarePerformanceTablePtr +=

return Status;

(UINTN)(PeiPerformanceLogHeader->SizeOfAllEntries);

}

} //

BootPerformanceTable = (UINT8*) (UINTN)

// Update Table length.

PerformanceVariable.BootPerformanceTablePointer; //

//

// Dump PEI boot records

((BOOT_PERFORMANCE_TABLE *) BootPerformanceTable)-

//

>Header.Length = (UINT32)((UINTN)FirmwarePerformanceTablePtr -

FirmwarePerformanceTablePtr = (BootPerformanceTable + sizeof (UINTN)BootPerformanceTable);

(BOOT_PERFORMANCE_TABLE));

GuidHob = GetFirstGuidHob

(&gEdkiiFpdtExtendedFirmwarePerformanceGuid);

#BHUSA @BlackHatEvents

CVE-2021-28216

Arbitrary

//

overwrite

// Update S3 boot records into the basic boot performance table.

while (GuidHob != NULL) {

//

FirmwarePerformanceData = GET_GUID_HOB_DATA (GuidHob);

VarSize = sizeof (PerformanceVariable);

PeiPerformanceLogHeader = (FPDT_PEI_EXT_PERF_HEADER *)

Status = VariableServices->GetVariable (

FirmwarePerformanceData;

VariableServices,

CopyMem (FirmwarePerformanceTablePtr,

EFI_FIRMWARE_PERFORMANCE_VARIABLE_NAME, FirmwarePerformanceData + sizeof (FPDT_PEI_EXT_PERF_HEADER),

&gEfiFirmwarePerformanceGuid,

NULL,

(UINTN)(PeiPerformanceLogHeader->SizeOfAllEntries));

&VarSize,

GuidHob = GetNextGuidHob

&PerformanceVariable

(&gEdkiiFpdtExtendedFirmwarePerformanceGuid, GET_NEXT_HOB

);

(GuidHob));

if (EFI_ERROR (Status)) {

FirmwarePerformanceTablePtr +=

return Status;

(UINTN)(PeiPerformanceLogHeader->SizeOfAllEntries);

}

} //

BootPerformanceTable = (UINT8*) (UINTN)

// Update Table length.

PerformanceVariable.BootPerformanceTablePointer; //

//

// Dump PEI boot records

((BOOT_PERFORMANCE_TABLE *) BootPerformanceTable)-

//

>Header.Length = (UINT32)((UINTN)FirmwarePerformanceTablePtr -

FirmwarePerformanceTablePtr = (BootPerformanceTable + sizeof (UINTN)BootPerformanceTable);

(BOOT_PERFORMANCE_TABLE));

GuidHob = GetFirstGuidHob

(&gEdkiiFpdtExtendedFirmwarePerformanceGuid);

#BHUSA @BlackHatEvents

CVE-2021-28216

Arbitrary

//

overwrite

// Update S3 boot records into the basic boot performance table.

while (GuidHob != NULL) {

//

FirmwarePerformanceData = GET_GUID_HOB_DATA (GuidHob);

VarSize = sizeof (PerformanceVariable);

PeiPerformanceLogHeader = (FPDT_PEI_EXT_PERF_HEADER *)

Status = VariableServices->GetVariable (

FirmwarePerformanceData;

VariableServices,

CopyMem (FirmwarePerformanceTablePtr,

EFI_FIRMWARE_PERFORMANCE_VARIABLE_NAME, FirmwarePerformanceData + sizeof (FPDT_PEI_EXT_PERF_HEADER),

&gEfiFirmwarePerformanceGuid,

NULL,

(UINTN)(PeiPerformanceLogHeader->SizeOfAllEntries));

&VarSize,

GuidHob = GetNextGuidHob

&PerformanceVariable

(&gEdkiiFpdtExtendedFirmwarePerformanceGuid, GET_NEXT_HOB

);

(GuidHob));

if (EFI_ERROR (Status)) {

FirmwarePerformanceTablePtr +=

return Status;

(UINTN)(PeiPerformanceLogHeader->SizeOfAllEntries);

}

} //

BootPerformanceTable = (UINT8*) (UINTN)

// Update Table length.

PerformanceVariable.BootPerformanceTablePointer; //

//

// Dump PEI boot records

((BOOT_PERFORMANCE_TABLE *) BootPerformanceTable)-

//

>Header.Length = (UINT32)((UINTN)FirmwarePerformanceTablePtr -

FirmwarePerformanceTablePtr = (BootPerformanceTable + sizeof (UINTN)BootPerformanceTable);

(BOOT_PERFORMANCE_TABLE));

GuidHob = GetFirstGuidHob

(&gEdkiiFpdtExtendedFirmwarePerformanceGuid);

Semi-controllable

write-what-where

#BHUSA @BlackHatEvents

CVE-2021-28216

Arbitrary

//

overwrite

// Update S3 boot records into the basic boot performance table.

while (GuidHob != NULL) {

//

FirmwarePerformanceData = GET_GUID_HOB_DATA (GuidHob);

VarSize = sizeof (PerformanceVariable);

PeiPerformanceLogHeader = (FPDT_PEI_EXT_PERF_HEADER *)

Status = VariableServices->GetVariable (

FirmwarePerformanceData;

The payload is not measured VariableServices,

CopyMem (FirmwarePerformanceTablePtr,

EFI_FIRMWARE_PERFORMANCE_VARIABLE_NAME, FirmwarePerformanceData + sizeof (FPDT_PEI_EXT_PERF_HEADER),

&gEfiFirmwarePerformanceGuid,

NULL, &VarSize,

and TPM PCR's are not extended. (UINTN)(PeiPerformanceLogHeader->SizeOfAllEntries)); GuidHob = GetNextGuidHob

&PerformanceVariable

(&gEdkiiFpdtExtendedFirmwarePerformanceGuid, GET_NEXT_HOB

);

(GuidHob));

if (EFI_ERROR (Status)) {

FirmwarePerformanceTablePtr +=

}

return

Status;

Remote

health

attestation

will not detect the exploitation. (UINTN)(PeiPerformanceLogHeader->SizeOfAllEntries); } //

BootPerformanceTable = (UINT8*) (UINTN)

// Update Table length.

PerformanceVariable.BootPerformanceTablePointer; //

//

// Dump PEI boot records

((BOOT_PERFORMANCE_TABLE *) BootPerformanceTable)-

//

>Header.Length = (UINT32)((UINTN)FirmwarePerformanceTablePtr -

FirmwarePerformanceTablePtr = (BootPerformanceTable + sizeof (UINTN)BootPerformanceTable);

(BOOT_PERFORMANCE_TABLE));

GuidHob = GetFirstGuidHob

(&gEdkiiFpdtExtendedFirmwarePerformanceGuid);

Semi-controllable

write-what-where

#BHUSA @BlackHatEvents

Let's briefly talk about exploitability... ... Let's talk about mitigations and
hardening... ... below the OS
#BHUSA @BlackHatEvents

"The popularity of UEFI and its lack of memory protection enforcements attract exploitation."

DHS-CISA-Strategy-to-Fix-Vulnerabilities-Below-the-OS-Among-Worst-Offenders

#BHUSA @BlackHatEvents

EFI Development Kit (EDK II) documentation...
· BLUE means a production feature which might be enabled in the final production.
· YELLOW means a debug feature which need be disabled in the final production.
· "V" means 2 features can be enabled together. · "N" means 2 feature must not be enabled together. · (*) means this feature is for System Management
Mode (SMM) only. · No (*) means this feature can be enabled for DXE or
SMM.
https://edk2-docs.gitbook.io/a-tour-beyond-bios-mitigate-buffer-overflow-in-ue/summary #BHUSA @BlackHatEvents

EFI Development Kit (EDK II) documentation...

· BLUE means a production feature which might be

"May"  not mandatory enabled in the final production. · YELLOW means a debug feature which need be

Moreover...

disabled in the final production. · "V" means 2 features can be enabled together. · "N" means 2 feature must not be enabled together.

· (*) means this feature is for System Management

Mode (SMM) only.

· No (*) means this feature can be enabled for DXE or

SMM.

https://edk2-docs.gitbook.io/a-tour-beyond-bios-mitigate-buffer-overflow-in-ue/summary #BHUSA @BlackHatEvents

EFI Development Kit (EDK II) documentation...

· Stack canaries

· Limitations

· DEP

· ASLR · NULL Pointers

#BHUSA @BlackHatEvents

EFI Development Kit (EDK II) documentation...

· Stack canaries

· Limitations

· DEP

· ASLR · NULL Pointers

#BHUSA @BlackHatEvents

EFI Development Kit (EDK II) documentation...

· Stack canaries

· Limitations

· DEP

· ASLR · NULL Pointers

#BHUSA @BlackHatEvents

EFI Development Kit (EDK II) documentation...

· Stack canaries

· Limitations

· DEP

· ASLR · NULL Pointers

#BHUSA @BlackHatEvents

EFI Development Kit (EDK II) documentation...

· Stack canaries

· Limitations

· DEP

· ASLR · NULL Pointers

#BHUSA @BlackHatEvents

EFI Development Kit (EDK II) documentation...

· Stack canaries

· Limitations

· DEP

· ASLR · NULL Pointers

#BHUSA @BlackHatEvents

EFI Development Kit (EDK II) documentation...

· Stack canaries

· Limitations

· DEP

In practice, mitigations & hardening

· ASLR

are rarely (if ever) enabled...

· NULL Pointers

#BHUSA @BlackHatEvents

What about EDR / XDR / ATP ?
· Dramatically limited comparing to OS solutions... ... however, it's (very) slowly changing
#BHUSA @BlackHatEvents

What about EDR / XDR / ATP ?
· Dramatically limited comparing to OS solutions... ... however, it's (very) slowly changing
Are we completely lost?
#BHUSA @BlackHatEvents

Using Type Safe languages to Develop Critical Code

OSFC2020_Rust_EFI_Yao_Zimmer_NDK4Dme.pdf
rust-osdev/uefi-rs: Rust wrapper for UEFI edk2-staging/RustPkg at edkii-rust · tianocore/edk2-staging

#BHUSA @BlackHatEvents

We would like to warmly thank:
· NVIDIA Product Security, GPU System Software and PSIRT teams
· for supporting this research, assistance in coordinating disclosure and more...
· Intel PSIRT
· for hard work on the fixes and active participation and support in this coordinated disclosure
· RedHat and LKRG project
· for helping to discover at scale potentially vulnerable vendors and notify them
· Dell
· for the great collaboration during disclosure process and very professional feedback
#BHUSA @BlackHatEvents

Questions?

#BHUSA @BlackHatEvents

