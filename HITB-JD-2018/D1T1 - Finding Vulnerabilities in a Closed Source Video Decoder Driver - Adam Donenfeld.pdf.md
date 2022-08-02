Adam Donenfeld
Zimperium

To read the phrack paper during the presentation:

2
Sandbox concepts Apple user to kernel sandboxing New iOS vulnerability Tracing the iOS kernel Debugging Apple processes Zero-clicks, mediaserverd (and PAC ) Summary

ADAM DONENFELD (@doadam) · Years of experience in research (both PC and mobile) · Vulnerability assessment · Vulnerability exploitation · Senior security researcher at Zimperium · Presented in world famous security conferences

· Isolating low-level and high-level processes ­ Narrowed attack surface ­ Preventing leak of sensitive information
· Examples ­ An app is not supposed to have access to biometric information ­ Coreauthd is not supposed to have access to your calendar

More concrete examples
· CVE-2015-7006 ­ Airdrop attack ­ arbitrary file write via sharingd · Sharingd is now sandboxed
· CVE-billions-of-them ­ AFC symlinks restrictions
· ZiVA ­ Fully working exploit, still needed sandbox escape

6
· Sometimes a feature is required ­ But in a limited manner
· Isolate user and kernel module with a process in between

User mode (EL0)
App

7
Kernel mode (EL1)
AVEVideoEncoder

User mode (EL0)
App

mediaserverd

· Input validation · Damage control · Confined API

8
Kernel mode (EL1)
AVEVideoEncoder

9

Plane check sign mismatch vulnerability

check_plane_overlap

LDURSW

X11, [X10,#-0xC] ; X11 = plane_base

LDR

W12, [X10]

; W12 = plane_size

ADD

X11, X12, X11

; Rd = Op1 + Op2

CMP

X8, X11

; X8 = last plane base

B.CC

plane_base_overlaps ; Branch

ADD

W9, W9, #1

; Rd = Op1 + Op2

ADD

X10, X10, #0x50

; next plane

CMP

W9, W25; CMP current_plane_id, last_plane_id

B.CC

check_plane_overlap ; Branch

11
What uses IOSurface?
· IOSurface objects created with IOSurfaceRootUserClient · Looking up IOSurface IDs is done with IOSurfaceRoot
· IOSurfaceRoot registers itself as "IOCoreSurfaceRoot"
· Lookup IOCoreSurfaceRoot strings

12

13
What uses IOSurface->getPlaneBase\Size() ?
· String lookup, "plane" in those drivers
· "outWidth > pIOSurfaceDst->getPlaneWidth(0) || out Height > pIOSurfaceDst->getPlaneHeight(0) || outWi dth == 0 || outHeight == 0" failed in "/BuildRoot/Libr ary/Caches/com.apple.xbs/Sources/AppleD5500/Apple D5500-134.1/AppleD5500.cpp"

14
IOSurface usage

LDR

X8, [X8,#0x110]

; Load from Memory

MOV

W1, #1

; Rd = Op2

MOV

X0, X19

; Rd = Op2

BLR

X8

; IOSurface->getPlaneSize(1)

MOV

X23, X0

; X23 = second_plane_size

SXTW

X2, W20

; Signed Extend Word

MOV

W1, #0x80

; Rd = Op2

MOV

X0, X25

; Rd = Op2

memset(something, 0x80, first_plane_size)

BL

memset

; Branch with Link

SXTW

X2, W23

; Signed Extend Word

MOV

W1, #0x80

; Rd = Op2

MOV

X0, X27

; Rd = Op2

memset(something, 0x80, second_plane_size)

BL

memset

; Branch with Link

15
New primitive!
· Override something with 0x80s, arbitrary length

16
Who are you?
· Video-decoding driver
· Closed from sandbox
· Communication is done via mediaserverd

User mode (EL0)
Decode video App

mediaserverd

· Input validation · Damage control · Confined API

17
Kernel mode (EL1)
AppleD5500

Plane check sign mismatch vulnerability

check_plane_overlap

LDURSW

X11, [X10,#-0xC] ; X11 = plane_base

LDR

W12, [X10]

; W12 = plane_size

ADD

X11, X12, X11

; Rd = Op1 + Op2

CMP

X8, X11

; X8 = last plane base

B.CC

plane_base_overlaps ; Branch

ADD

W9, W9, #1

; Rd = Op1 + Op2

ADD

X10, X10, #0x50

; next plane

CMP

W9, W25; CMP current_plane_id, last_plane_id

B.CC

check_plane_overlap ; Branch

check_plane_overlap

LDUR

X11, [X10,#-0xC] ; X11 = plane_base

LDR

W12, [X10]

; W12 = plane_size

ADD

X11, X12, X11

; Rd = Op1 + Op2

CMP

X8, X11

; X8 = last plane base

B.CC

plane_base_overlaps ; Branch

ADD

W9, W9, #1

; Rd = Op1 + Op2

ADD

X10, X10, #0x50

; next plane

CMP

W9, W25; CMP current_plane_id, last_plane_id

B.CC

check_plane_overlap ; Branch

19
IOSurface usage

LDR

X8, [X8,#0x110]

; Load from Memory

MOV

W1, #1

; Rd = Op2

MOV

X0, X19

; Rd = Op2

BLR

X8

; IOSurface->getPlaneSize(1)

MOV

X23, X0

; X23 = second_plane_size

SXTW

X2, W20

; Signed Extend Word

MOV

W1, #0x80

; Rd = Op2

MOV

X0, X25

; Rd = Op2

memset(something, 0x80, first_plane_size)

BL

memset

; Branch with Link

SXTW

X2, W23

; Signed Extend Word

MOV

W1, #0x80

; Rd = Op2

MOV

X0, X27

; Rd = Op2

memset(something, 0x80, second_plane_size)

BL

memset

; Branch with Link

20
How is the IOSurface ID supplied?
· Look up xrefs to this function... ­ Leads to a virtual function
· ~20 functions from entry point to the externalMethod
· How to make sure the function is reached?

21
"Hook" kernel functions
· Modified Yalu* project · "RemapPage" where we want to hook
­ Disables KPP for this certain page · Overwrite 4 instructions:
­ LDR X16, #0x8 ­ BLR X16 ­ 8 bytes address of shellcode
· *Special thanks to @qwertyoruiop and @marcograss for their work on that project

0x100 0x104 0x108 0x10C 0x110 0x114 0x118 0x11C 0x120

Kernel code

Yalu++

22
STP X0, X1 [SP] STP X2, X3 [SP, #0x10] .... LDR X0, debug_str LDR X16, kprintf MOV X0, X0 MOV X0, X0 MOV X0, X0 MOV X0, X0 RET

0x100 0x104 0x108 0x10C 0x110 0x114 0x118 0x11C 0x120

Kernel code

Yalu++
LDR X16, #0x8 BLR X16 .quad shellcode_address

23
STP X0, X1 [SP] STP X2, X3 [SP, #0x10] .... LDR X0, debug_str LDR X16, kprintf MOV X0, X0 MOV X0, X0 MOV X0, X0 MOV X0, X0 RET

0x100 0x104 0x108 0x10C 0x110 0x114 0x118 0x11C 0x120

Kernel code

Yalu++
LDR X16, #0x8 BLR X16 .quad shellcode_address

24
STP X0, X1 [SP] STP X2, X3 [SP, #0x10] .... LDR X0, debug_str LDR X16, kprintf Overwritten instruction 1 Overwritten instruction 2 Overwritten instruction 3 Overwritten instruction 4 RET

LDR CBNZ LDR LDRB AND CBNZ LDR CBZ LDR ADD LDR LSR LSR MADD MOV BL

W8, W8,

[X19,#0x4E0] ; Load loc_FFFFFFF006C4E7DC ;

from Memory Compare and

Bran2c5h

on

Non-Zero

X8, [X19,#0x448] ; Load from Memory

W8, [X8,#6]

; Load from Memory

W8, W8, #0x30

; Rd = Op1 & Op2

W8, loc_FFFFFFF006C4E7DC ; Compare and Branch on Non-Zero

X8, [X9,#0x10]

; Load from Memory

X8, loc_FFFFFFF006C4E7DC ; Compare and Branch on Zero

X10, [X9,#0x40]

; Load from Memory

X0, X8, W10,UXTW ; Rd = Op1 + Op2

W8, [X9,#0x54]

; Load from Memory

W8, W8, #1

; Logical Shift Right

X9, X10, #0x20

; Logical Shift Right

W2, W8, W9, WZR

; Multiply-Add

W1, #0x80

; Rd = Op2

memset

; Branch with Link

IOKit reversing
· Realizing where are the vtables and functions · Entry points (IOUserClient->externalMethod) · Should be automated, but can be done manually

IOKit reversing
· 0x80 had something to do with IOSurface... · Let's examine IOSurfaces in the driver!
· A quick strings search reveals:
­ "AppleVXD393::allocateKernelMemory kAllocMapTypeIOSurface - loo kupSurface failed. %d \n"

28
surf_props->plane_offset[0] = v24->vtable->IOSurface_FFFFFFF00668FDD8L)(v24,0LL); surf_props->plane_offset[1] = v24->vtable->IOSurface_FFFFFFF00668FDD8L)(v24,1LL); surf_props->plane_bytes_per_row[0] = v24->vtable->IOSurface_FFFFFFF00668FF40L)(v24,0LL); surf_props->plane_height[0] = v24->vtable->IOSurface_FFFFFFF00668FE8CL)(v24,0LL); surf_props->plane_height[1] = v24->vtable->IOSurface_FFFFFFF00668FE8CL)(v24,1LL); surf_props->plane_width[0] = v24->vtable->IOSurface_FFFFFFF00668FE50L)(v24,0LL); surf_props->plane_width[1] = v24->vtable->IOSurface_FFFFFFF00668FE50L)(v24,1LL); surf_props->plane_offset_again?[0] = v24->vtable->IOSurface_FFFFFFF00668FDD8L)(v24,0LL); surf_props->plane_offset_again?[1] = v24->vtable->IOSurface_FFFFFFF00668FDD8L)(v24,1LL); v31 = surface_descriptor->vtable->__ZN18IOMemoryDescriptor3mapEj((IOMemoryDescriptor *)v17, 0); if ( v31 ) {
surf_props->surface_buffer_mapping = v31->vtable->__ZN11IOMemoryMap17getVirtualAddressEv)();

IOKit reversing
· IOSurface loading code
· Same offsets as used in the memset call
· Kernel tracing technique reveals this is indeed an IOSurface object!

30
Who supplies this IOSurface object?
· Mediaserverd calls AppleD5500 ­ VideoToolBox, to be accurate
· Let's reverse VideoToolBox! ­ Contained in dyld_shared_cache
· No IDA 7 back then

31
· No apparent usage of AppleD5500 · Maybe another framework?

32
· String lookup · H264H8
· AppleD5500's IOKit external methods are interesting ­ _AppleD5500DecodeFrameInternal · IOConnectCallStructMethod
· _AppleD5500WrapperH264DecoderDecodeFrame ­ No xrefs...

33
· No xrefs · (Most) code isn't written not to be used · Vtable?

34
· It's a vtable! · Where is the object created?

35

EXPORT _H264H8Register _H264H8Register

var_10= -0x10 var_s0= 0

STP STP ADD BL CMP B.NE ADRP ADD MOV MOVK MOV BL MOV MOVK MOV BL MOV MOVK MOV BL

X20, X19, [SP,#-0x10+var_10]!

X29, X30, [SP,#0x10+var_s0]

X29, SP, #0x10

_AppleD5500CheckPlatform

W0, #1

no_registration

X19, #_AppleD5500WrapperH264DecoderCreateInstance@PAGE

X19, X19, #_AppleD5500WrapperH264DecoderCreateInstance@PAGEOFF

W0, #0x61760000

W0, #0x6331

; avc1

X1, X19

j__VTRegisterVideoDecoder_2

W0, #0x64720000

W0, #0x6D69

; drmi

X1, X19

j__VTRegisterVideoDecoder_2

W0, #0x65610000

W0, #0x7663

; eavc

X1, X19

j__VTRegisterVideoDecoder_2

· H264H8Register initializes the connection with the driver

_VTLoadVideoDecoder

var_10= -0x10 var_s0= 0

STP

X20, X19, [SP,#-0x10+var_10]!

STP

X29, X30, [SP,#0x10+var_s0]

ADD

X29, SP, #0x10

MOV

X19, X1

MOV

W1, #4

; mode

BL

j__dlopen_35

CBZ

X0, loc_1841D2FD8

MOV

X1, X19

; symbol

BL

_dlsym_0

CBZ

X0, loc_1841D2FD8

LDP

X29, X30, [SP,#0x10+var_s0]

LDP

X20, X19, [SP+0x10+var_10],#0x20

BR

X0

; ---------------------------------------------------------------------------

loc_1841D2FD8
LDP LDP RET

; CODE XREF: _VTLoadVideoDecoder+18?j ; _VTLoadVideoDecoder+24?j X29, X30, [SP,#0x10+var_s0] X20, X19, [SP+0x10+var_10],#0x20

_AppleD5500WrapperH264DecoderCreateInstance

H264Register

kH264VideoDecoderVTable kAppleD5500_H264VideoDecoder_VideoDecoderClass
AppleD5500WrapperH264DecoderDecodeFrame AppleDD5500WrapperH264DecoderStartSession

Dlopen & dlsym _VTDecompressionSessionCreate

XPC request to mediaserverd

· Documented API · VTDecompressionSessionDecodeFrame
· Perhaps that's what initializes the IOSurface object in the kernel?

41
· Calls to AppleD5500WrapperH264DecoderDecodeFrame ­ Within the H264H8 framework
· And then...

tile_decode_dictionary = tile_decode_dictionary_1

j__CMGetAttachment_3(v7, CFSTR("tileDecode"), = tile_decode_dictionary;

402LL);

if ( tile_decode_dictionary )

{

canvas_surface_ID1 = 0LL;

v39 = CFDictionaryGetValue_24(tile_decode_dictionary, CFSTR("canvasSurfaceID"));

v40 = CFNumberGetValue_22(v39, 10LL, &canvas_surface_ID1);

...

if ( !v40 )

{

...

...

v55 = CFDictionaryGetValue_24(tile_decode_dictionary_1, CFSTR("offsetX"));

CFNumberGetValue_22(v55, 3LL, &v92);

v56 = CFDictionaryGetValue_24(tile_decode_dictionary_1, CFSTR("offsetY"));

CFNumberGetValue_22(v56, 3LL, &v91);

v57 = CFDictionaryGetValue_24(tile_decode_dictionary_1, CFSTR("lastTile"));

...

43
· Optionally receives an IOSurface ID! (not documented) · Receives also X and Y offsets... · Is this the surface in the kernel? · iOS kernel tracing to the rescue!

44
Quick recap
· Objective ­ get to memset
· iOS kernel tracing

if ( context->tile_decode )

45

{

dest_surf->tile_decode = 1;

tile_offset_x = context->tile_offset_x;

dest_surf->tile_offset_x = tile_offset_x;

tile_offset_y = context->tile_offset_y;

dest_surf->tile_offset_y = tile_offset_y;

v73 = tile_offset_x + tile_offset_y * dest_surf->surf_props.plane_bytes_per_row[0];

v74 = tile_offset_x

+ ((dest_surf->surf_props.plane_bytes_per_row[1] * tile_offset_y + 1) >> 1)

+ dest_surf->surf_props.plane_offset_again?[1];

dest_surf->surf_props.plane_offset[0] = v73 + dest_surf->surf_props.plane_offset_again?[0];

dest_surf->surf_props.plane_offset[1] = v74;

}

...

if ( !context->field_4E0 && !(context->some_unknown_data->unk & 0x30) )

{

surface_buffer_mapping = v85->surf_props.surface_buffer_mapping;

if ( surface_buffer_mapping )

memset_stub(

(char *)surface_buffer_mapping + (unsigned int)*(_QWORD *)&v85->surf_props.plane_offset[1],

0x80LL,

((dest_surf->surf_props.plane_height[0] >> 1) *

(*(_QWORD *)&dest_surf->surf_props.plane_offset[1] >> 0x20)));

}

· Closed source driver · No xrefs · How to find out what that field is?

LDR CBNZ LDR LDRB AND CBNZ LDR CBZ LDR ADD LDR LSR LSR MADD MOV BL

W8, W8,

[X19,#0x4E0] ; Load loc_FFFFFFF006C4E7DC ;

from Memory Compare and

Bran4c7h

on

Non-Zero

X8, [X19,#0x448] ; Load from Memory

W8, [X8,#6]

; Load from Memory

W8, W8, #0x30

; Rd = Op1 & Op2

W8, loc_FFFFFFF006C4E7DC ; Compare and Branch on Non-Zero

X8, [X9,#0x10]

; Load from Memory

X8, loc_FFFFFFF006C4E7DC ; Compare and Branch on Zero

X10, [X9,#0x40]

; Load from Memory

X0, X8, W10,UXTW ; Rd = Op1 + Op2

W8, [X9,#0x54]

; Load from Memory

W8, W8, #1

; Logical Shift Right

X9, X10, #0x20

; Logical Shift Right

W2, W8, W9, WZR

; Multiply-Add

W1, #0x80

; Rd = Op2

_memset.stub

; Branch with Link

· Closed source driver · No xrefs · How to find out what that field is?
· Dump the entire driver's text section and grep

49

FFFFFFF006C49594 var_40= -0x40 FFFFFFF006C49594 var_30= -0x30 FFFFFFF006C49594 var_20= -0x20 FFFFFFF006C49594 var_10= -0x10 FFFFFFF006C49594 var_s0= 0 FFFFFFF006C49594 FFFFFFF006C49594 STP FFFFFFF006C49598 STP FFFFFFF006C4959C STP FFFFFFF006C495A0 STP FFFFFFF006C495A4 STP FFFFFFF006C495A8 ADD FFFFFFF006C495AC MOV FFFFFFF006C495B0 MOV FFFFFFF006C495B4 MOV FFFFFFF006C495B8 MOV FFFFFFF006C495BC MOV FFFFFFF006C495C0 LDR FFFFFFF006C495C4 LDR FFFFFFF006C495C8 LDR FFFFFFF006C495CC STR

X26, X25, [SP,#-0x10+var_40]! ; Store Pair

X24, X23, [SP,#0x40+var_30] ; Store Pair

X22, X21, [SP,#0x40+var_20] ; Store Pair

X20, X19, [SP,#0x40+var_10] ; Store Pair

X29, X30, [SP,#0x40+var_s0] ; Store Pair

X29, SP, #0x40

; Rd = Op1 + Op2

X20, X4

; Rd = Op2

X21, X2

; Rd = Op2

X22, X1

; Rd = Op2

X19, X0

; Rd = Op2

X8, #0

; Rd = Op2

X24, [X19,#0x1C8]

; Load from Memory

X9, [X19,#0x28]

; Load from Memory

X10, [X19,#0x30F8]

; Load from Memory

X9, [X10,#0x448]

; Store to Memory

LDR LDRH LDR LDRH MOV AND BFI STRH

X11, [X19,#0x1B0] W11, [X11,#0x24] X12, [X19,#0x28] W13, [X12,#6] W14, #0xFFCF W13, W13, W14 W13, W11, #4, #2 W13, [X12,#6]

; Load from Memory ; Load from Memory ; Load from Memory ; Load from Memory ; Rd = Op2 ; Rd = Op1 & Op2 ; Bit Field Insert ; Store to Memory

W13 = (W11 & 3) * 0x10

LDR LDRH LDR LDRH MOV AND BFI STRH

X11, [X19,#0x1B0] W11, [X11,#0x24] X12, [X19,#0x28] W13, [X12,#6] W14, #0xFFCF W13, W13, W14 W13, W11, #4, #2 W13, [X12,#6]

; Load from Memory ; Load from Memory ; Load from Memory ; Load from Memory ; Rd = Op2 ; Rd = Op1 & Op2 ; Bit Field Insert ; Store to Memory

CH264Decoder::DecodeStream error h264fw_SetPpsAndSps

ADAM DONENFELD (@doadam) · Years of experience in research (both PC and mobile) · Vulnerability assessment · Vulnerability exploitation · Senior security researcher at Zimperium · Presented in world famous security conferences

ADAM DONENFELD (@doadam) · Years of experience in research (both PC and mobile) · Vulnerability assessment · Vulnerability exploitation · Senior security researcher at Zimperium · Presented in world famous security conferences · Never really liked H264

· Further looking up the source of the check... · Arriving at a function with the following string: · AVC_Decoder::ParseHeader unsupported naluLengthSize
· Googling "AVC nalu" · First result is "Introduction to H.264: (1) NAL Unit"
· H.264 standard http://www.itu.int/rec/T-REC-H.264/e

56
H.264 in 60 seconds
· A packed video consists of "NAL units"

57

58
H.264 in 60 seconds
· A packed video consists of "NAL units"
· Each NAL unit has a type
· The NAL unit is built according to its type
· How to find its type?

LDP CBNZ CMP B.EQ

W9, W8, [X19,#0x18] W9, parse_nal_by_type

; ;

Load Pair Compare and

Branch

on

Non-Z5er9o

W8, #5

; Set cond. codes on Op1 - Op2

idr_type_and_no_idc_ref ; Branch

parse_nal_by_type

SUB

W9, W8, #1

; switch 12 cases

CMP

W9, #0xB

; Set cond. codes on Op1 - Op2

B.HI

def_FFFFFFF006C3A2DC ; jumptable FFFFFFF006C3A2DC default case

ADRP

X10, #jpt_FFFFFFF006C3A2DC@PAGE ; Address of Page

ADD

X10, X10, #jpt_FFFFFFF006C3A2DC@PAGEOFF ; Rd = Op1 + Op2

LDRSW

X9, [X10,X9,LSL#2]

; Load from Memory

ADD

X9, X9, X10

; Rd = Op1 + Op2

BR

X9

; switch jump

idr_type_and_no_idc_ref

ADRP

X0, #aZeroNal_ref_id@PAGE ; "zero nal_ref_idc with IDR!"

ADD

X0, X0, #aZeroNal_ref_id@PAGEOFF ; "zero nal_ref_idc with IDR!"

BL

kprintf

; Branch with Link

MOV

W0, #0x131

; Rd = Op2

B

cleanup

; Branch

60

61
H.264 in 60 seconds
· A packed video consists of "NAL units"
· Each NAL unit has a type
· The NAL unit is built according to its type
· Each type is parsed separatedly

62
H.264 in 60 seconds
· NAL types · SPS (sequence parameter set)
­ General properties for coded video sequence · PPS (picture parameter set)
­ General properties for coded picture sequence · IDR (Instantaneous Decoding Refresh)
­ First NAL in a coded video sequence · For each SPS, the first NAL is an IDR NAL

SPS

PPS

63
B frame P frame IDR
B frame
P frame
B frame

LDR LDRH LDR LDRH MOV AND BFI STRH

X11, [X19,#0x1B0] W11, [X11,#0x24] X12, [X19,#0x28] W13, [X12,#6] W14, #0xFFCF W13, W13, W14 W13, W11, #4, #2 W13, [X12,#6]

; Load from Memory ; Load from Memory ; Load from Memory ; Load from Memory ; Rd = Op2 ; Rd = Op1 & Op2 ; Bit Field Insert ; Store to Memory

CH264Decoder::DecodeStream error h264fw_SetPpsAndSps

65
· Can it be PPS\SPS? · Decode a video, iOS kernel tracing, and check · Take a random H.264 AVC video and analyze it
­ Plenty of tools in GitHub · Check 0x1B0 to see if it looks like the SPS we sent · Match!

66
· This is sufficient to understand the mysterious check! · SPS->chroma_format_idc == 0 -> kernel overflow!
· Just create a video with chroma_format_idc == 0 and try to decode it

67
· CMVideoFormatDescriptionCreateFromH264ParameterSets ­ This initializes the session with the requested PPS and SPS
· VTDecompressionSessionCreate ­ Initializes our session with mediaserverd · Requires the output from above
· VTDecompressionSessionDecodeFrame · And...

68
· Nothing happens! · Reversing mediaserverd...
· Mediaserverd checks that chroma_format_idc > 0 ­ And denies chroma_format_idc == 0

69
· Reading the H.264 format reveals:

70

SPS0 SPS1 SPS2 SPSn PPS0 PPS1 PPS2 PPSn

SPS0 SPS1 SPS2 SPSn PPS0 PPS1 PPS2 PPSn CMVideoFormatDescriptionCreateFromH264ParameterSets

SPS0 SPS1 SPS2 SPSn
PPS0 PPS1 PPS2 PPSn
Decoding Process
Slice

Sequence parameter set
· Can there be multiple sequence parameter set NALs?
· CMVideoFormatDescriptionCreateFromH264ParameterSets is only called once for mediaserverd
· Nevertheless...

77
· Create a normal session with mediaserverd
· Create a hardcoded SPS with chroma_format_idc · Create a hardcoded PPS to point to our new SPS NAL · Send a slice with our new PPS

SPS 0

PPS 0

SPS 1

PPS 1

78 B frame P frame IDR
B frame P frame B frame
IDR

79
· Finally crashed! · Let's report to Apple

80
· Same code doesn't crash it anymore... · No apparent change in AppleD5500...
· H264H8.videodecoder is changed · "canvasSurfaceID" no longer appears in the strings · Apple separated between decoding and tile decoding

81
· Assuming kernel RW
· Debugserver 0.0.0.0:1234 ­a mediaserverd
· Doesn't work

82

· Give debugged process run-unsigned-code
· Launch debugserver and give it permissions
· Attach debugger

84
· Apple understood canvasSurfaceID was a hack · New bunch of VTTileDecompression* API! · Debugserver + changing values

85

CVE-2018-4109

30th October, 2017
Vulnerability disclosure to Apple

2nd December, 2017
Apple confirmed the vulnerability

23st January, 2018
Apple deployed the patch to their iDevices

Mediaserverd is an interesting attack vector
· A lot of code can be triggered in mediaserverd remotely · For example, video parsing
­ With dozens of different formats and types · Can be triggered via interesting common apps
­ iMessage, WeChat, WhatsApp, Telegram, Signal, etc... · Multiple vulnerabilities that ultimately lead to RCE
­ Sometimes within mediaserverd · Mediaserverd's sandbox is awesome ;)

Attacker

88

AppleAVE

mediaserverd AppleD5500

Generic driver with 0 security in mind

89
Mediaserverd is was an interesting attack vector

· With the introduction of PAC, zero clicks are dead ­ Along with ROPs and most of the JOPs

LDR LDR MOV BLR

X8, [X21, #0] X8, [X8, #0x28] X0, X21 X8

LDR LDRAA MOVK MOV BLRAA

X8, [X21, #0] X9, [X8, #8]! X8, 0x3a87, LSL 48 X0, X21 X8

· Manuals are useful
­ Even if you hate them
· Infrastructure work saves a lot of time · Hit them where it hurts the most
­ Nobody looks at AppleD5500 ­ Find the most minimal access to such drivers and you're back at 2007
· iOS still has a way to go

91

