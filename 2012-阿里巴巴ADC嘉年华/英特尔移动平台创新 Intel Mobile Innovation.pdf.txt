Intel Mobile Innovation
Intel's Next Generation Atom Platforms Designed for Smartphone
Danny Zhang 2012 Intel Mobile and Communications Group

DO NOT DISTRIBUTE 1

Copyright © 2012 Intel Corporation. All rights reserved.

Legal Disclaimer
· INFORMATION IN THIS DOCUMENT IS PROVIDED IN CONNECTION WITH INTEL® PRODUCTS. EXCEPT AS PROVIDED IN INTEL'S TERMS AND CONDITIONS OF SALE FOR SUCH PRODUCTS, INTEL ASSUMES NO LIABILITY WHATSOEVER, AND INTEL DISCLAIMS ANY EXPRESS OR IMPLIED WARRANTY RELATING TO SALE AND/OR USE OF INTEL PRODUCTS, INCLUDING LIABILITY OR WARRANTIES RELATING TO FITNESS FOR A PARTICULAR PURPOSE, MERCHANTABILITY, OR INFRINGEMENT OF ANY PATENT, COPYRIGHT, OR OTHER INTELLECTUAL PROPERTY RIGHT. Intel products are not intended for use in medical, life-saving, life-sustaining, critical control or safety systems, or in nuclear facility applications.
· Intel products may contain design defects or errors known as errata which may cause the product to deviate from published specifications. Current characterized errata are available on request.
· Intel may make changes to dates, specifications, product descriptions, and plans referenced in this document at any time, without notice. · This document may contain information on products in the design phase of development. The information here is subject to change without
notice. Do not finalize a design with this information. · Designers must not rely on the absence or characteristics of any features or instructions marked "reserved" or "undefined." Intel reserves
these for future definition and shall have no responsibility whatsoever for conflicts or incompatibilities arising from future changes to them.
· Intel Corporation may have patents or pending patent applications, trademarks, copyrights, or other intellectual property rights that relate to the presented subject matter. The furnishing of documents and other materials and information does not provide any license, express or implied, by estoppel or otherwise, to any such patents, trademarks, copyrights, or other intellectual property rights.
· Wireless connectivity and some features may require you to purchase additional software, services or external hardware. · Performance tests and ratings are measured using specific computer systems and/or components and reflect the approximate performance of
Intel products as measured by those tests. Any difference in system hardware or software design or configuration may affect actual performance. Buyers should consult other sources of information to evaluate the performance of systems or components they are considering purchasing. For more information on performance tests and on the performance of Intel products, visit Intel Performance Benchmark Limitations · Intel, the Intel logo and Intel Atom are trademarks or registered trademarks of Intel Corporation or its subsidiaries in the United States and other countries. · *Other names and brands may be claimed as the property of others. · Copyright © 2012 Intel Corporation. All rights reserved.
DO NOT DISTRIBUTE 2

Agenda
Intel Mobile Innovation
Android* on IA
· Optimizing Dalvik, NDK, Renderscript, OpenCL execution · Development tools and emulation · HTML5 Endeavor
Call for Actions

DO NOT DISTRIBUTE 3

*Other names and brands may be claimed as the property of others.

Building Computing Experiences Across The Continuum

Desktops

Laptops

Netbooks

Tablets

Smartphones

DO NOT DISTRIBUTE 4

Embedded

Building A Comprehensive Mobility Portfolio

Imaging

Security

Graphics

Intel® AtomTM

Software & Services

WWAN

Connectivity
(Intel WiFi)

PMIC

DO NOT DISTRIBUTE 5

Third party trademarks and logos remain the property of others

MOMENTUM from CES...

DO NOT DISTRIBUTE 6

Third party trademarks and logos remain the property of others

Intel® AtomTM SOCs Platforms for Smartphones
Intel Process Technology Leadership 32 nm  14 nm in ~3 YEARS

PERFORMANCE
SMARTPHONE
Up to 2.0GHz CPU with Intel®HT Technology HSPA+ 21Mbps/5.7Mbps modem

AtomTM Z2580
Intel XMMTM 7160
Dual Core 1.8GHz CPU with Intel®HT (4 Threads) Dual Core Graphics @ 533MHz Advanced Multimode LTE/3G/2G Modem 4G LTE: 100Mbps/50Mbps modem HSPA+ 42Mbps/11.5Mbps modem

LOW-END SMARTPHONE

AtomTM Z2000 Intel XMMTM 6265

Performance tests and ratings are measured using specific computer systems and/or components and reflect the approximate performance of Intel products as measured by those tests. Any

diffDeOrenNcOeTinDsIySsTteRmIBhUaTrdEware or software design or configuration may affect actual performance. Buyers should consult other sources of information to evaluate the performance of systems or

7

components they are considering purchasing.

IA Smartphone Experience at a Glance

Engaging
Rich media and imaging experiences

Aware
Anticipating my needs
.

Seamless
Flawlessly transitioning between devices and contexts
DO NOT DISTRIBUTE 8

Protected
Protecting my digital life
.

AAnnddrrooidid**oonnIAIASSmmaarrttpphhoonnee
DO NOT DISTRIBUTE 9

IDF 2011: Intel, Google team to optimize Android for Smartphones
· Optimize Android for Intel · Native support for x86
architecture in Android Ice Cream Sandwich · Growing x86 Android application ecosystem
­ Optimizing top tier mobile apps ­ Porting NDK & Dalvik apps ­ Support for ,,legacy apps

DO NOT DISTRIBUTE 10

Third party trademarks and logos remain the property of others

Android* on IA Smartphone

High Touch Engineering & Account Mgmt

Application Developer Tools
oX HTML5 Portability oX Native compiler oX Native libraries oX Analysis Tools

Intel®System Software Tools for Android* OS

Empowering Developers with Tools and Programs to Deliver a Great Android Experience on IA based Phones

DO NOT DISTRIBUTE

*Other names and brands may be claimed as the property of others.

11

11

Key ICS Messages

Simple, beautiful, beyond smart
Rich Notifications, customizable live home screens, resizable widgets and deep interactivity
Roboto voice control
New font designed to suit high resolution screens; voice input engine with "open mic"
Evolved UI (blue background matches HC)
Common actions more visible, animated screen, new typeface
No buttons; Easy multi-tasking
System bar and virtual buttons across apps; Jump to recent apps from system bar

DO NOT DISTRIBUTE 12

Recent Apps

ICS Android 4.0 Key Features

Design principles:
· Enchant me: Live Wallpaper, take pics when locked · Simplify my life: Google+ now built in · Make me awesome: Android Beam, Voice typing
Jump to camera, notification from locked screen
Roboto ­ new typeface
Catch up
· "Beam": Share via touching devices · Screen capture · Multi-tasking (HC)
­ Flick to close ­ 16 tabbed browser, offline tabs (reading)
· Widgets (same as HC) · Notifications on lock screen; · Wi-Fi Direct, BT HDP1: Connect seamlessly
Gmail: 2 line previews; Offline search.
Calendar: Pinch to zoom for more detail.
1Health Device Profile
DO NOT DISTRIBUTE 13

"We want everything to be smooth as butter,"
--- Andy Rubin, Oct 19th 2011 <Link>
Voice to text
Touch to share data (Beam)
"I don't believe that your phone should be an assistant. Your phone is a tool for communicating. You shouldn't be communicating with the phone; you should be communicating with somebody on the other side of the phone."
--- Andy Rubin, Oct 19th 2011 <Link>

Key BSP Features at a Glance
Android CTS / CDD Compliant

Multimedia
 HW-accelerated graphics  VP8 video decode optimizations  HW-accelerated video decode
 H.264 1080p @ 30fps  MPEG-4 Level L3, L5  H.263 baseline L70  WMV9 Simple Profile Level
Medium, Main Profile Level High  VC1 1080p @ 30 fps  HW-accelerated video encode  H.264, MPEG-4, H.263  HW-accelerated audio decode  HE-AACv1, HE-AACv2, MP3,
PCM/Wave  HW-accelerated Flash / AIR
Security / DRM / Power
 HW-assisted secure boot and full disk encryption)
 Netflix  Power Management and Energy
Management

2nd Screen
 HDMI 1.3a  Clone mode  2 channel LPCM audio @ 44.1kHz  Hot Plug support  Logo compliancy testing
 WiDi  Wireless 2nd screen display (clone mode)
Sensors
 Accelerometer  Gyroscope  Ambient Light  Barometric pressure  Magnetometer  Temperature

DO NOT DISTRIBUTE 14

Imaging
 Front and Rear-Facing cameras, LED Flash  Color correction, red eye removal  Video & image stabilization  Burst mode still capture  Take snapshots while recording video  Auto white balance / focus / exposure  Geo tagging support  Single-Motion Panorama Mode  Setting Custom Metering regions  Zero Shutter Lag Exposure
Connectivity
 Bluetooth 2.1 + EDR'  6 profiles
 WiFi  WiFi Direct  WEP; WPA/WPA2 PSK  802.1x Enterprise  EAP-TLS
 GPS (A-GPS & standalone)

Optimizing the Android* stack for Atom

Apps

User Experience

Middleware

Applications

Home

Contacts

Phone

Browser

...

Application Framework

Activity Manager

Windows Manager

Content Providers

View System

...

Package Manager

Telephony Manager

Resource Manager

Location Manager

Notification Manager

Surface Manager OpenGL | ES
SGL

Libraries
Media Framework FreeType
SSL

SQLite WebKit
libc

Android Runtime
Core Libraries Dalvik Virtual
Machine
...

Display Driver Keypad Driver

Linux Kernel

Camera Driver

Flash Memory Driver

WiFi Driver

Audio Drivers

Binder (IPC) Driver Power
Management

Intel continuously invests in new web app technologies such as HTML5 and JavaScript, to ensure they perform best on IA.
Intel's extensive experience optimizing Java VMs has been applied to Dalvik VM with impressive results.
Intel is the second largest contributor to the Linux code base in the world and employs many of its top software talent. This work manifests itself in the libraries and kernel.

Drivers optimized for power Atom optimized fast Improved garbage

and memory footprint.

interpreter

collection

SSE offloads for faster Jpeg

Operatin g System

Source: http://developer.android.com/guide/basics/what-is-android.html

DO NOT DISTRIBUTE 15

* Other names and brands may be claimed as the property of others.

Android * Programming Models

Language
Dalvik

Description

Intel

This is the Virtual Machine in Android that runs all apps. It uses a dialect of Java and apps are compiled to bytecode (.dex). Existing Dalvik only apps work as is on x86 architecture.

Intel trace JIT optimizations yield a ~5x performance improvement.

Portable Interpreter - Compiles on any system that supports GCC Fast Interpreter - Uses hand-coded assembly fragments

NDK
RenderScript OpenCL

Native Development Kit. This is a toolset that allows developers to embed native code within an Android application. It requires the code to be compiled for a particular processor architecture.

Intel and Google released the NDK for x86 in July of 2011 on android.com

Low-Level, cross-platform API targeting 3D and computer operations to execute native code agnostically
Standard API similar to OpenGL that allows using any supported CPU/GPU to do computational workloads.

Atom optimizations to LLVM code generator.
Intel doing POC implementation in Q1. Also working on Java "glue code generator" for tighter integration with Dalvik apps.

DO NOT DISTRIBUTE 16

* Other names and brands may be claimed as the property of others.

Android* Optimizations

Performance Tuning
·Dalvik VM runtime optimization
· x86 trace-based JIT and Native Code Generation
· Enriched memory management (e.g., garbage collection)
· JNI streamlining
· Tuning of native libraries
· Bionic optimizations · Javascript & HTML5 optimization

Power Reduction
· Power Management for Android
· OpenGL ES 1.1/2.0 Driver
· HW Overlay
· HW Accelerated Media decode/encode
· Library to integrate w/ Android & reference implementation (MIX)
· Standard SoC drivers, middleware and applications optimized for power

DO NOT DISTRIBUTE 17

* Other names and brands may be claimed as the property of others.

Operating System are embracing HTML 5
Platforms are designed to share information with other platforms e.g. Android, OSX Tablet OSs, Desktop integration of other platforms
HTML 5 is making it easier to share applications and it data across different platforms via the internet.
DO NOT DISTRIBUTE 18

HTML 5 is targeting "platforms" not just browsers anymore
Google ­ Android / Chrome Experiments Microsoft ­ Internet Explorer / Windows 8 Metro / Microsoft Store Mozilla ­ Firefox Apple ­ Safari / iTunes Smart TVs Smart phones and tablets

HTML 5 is making it easier enable the compute continuum

DO NOT DISTRIBUTE 19

* Other names and brands may be claimed as the property of others.

Variance across Implementation
· Policies on code path followed vary per browser, content, OS, platform, device · Need to ensure graphics & device support, optimal policy per content type
DO NOT DISTRIBUTE 20

Browser architectures are more complex than ever (Chrome architecture)
Component implementing HTML 5 is integrating more hardware specific software
DO NOT DISTRIBUTE 21

HTML 5 API are designed for performance
http://ie.microsoft.com/testdrive/Performance/setImmediateSorting/Default.html
Intel continues to work with the standards group to improve HTML 5 on our platforms
DO NOT DISTRIBUTE 22

HTML 5 designing API's for Multi-Applications
Capabilities that was once only available in lower level (C/C++) APIs are now available in HTML.
http://ie.microsoft.com/testdrive/Performance/PageVisibility/Default.html
"80 percent of application on Apples iTunes and Google Marketplace could be written in HTML 5" - Google
DO NOT DISTRIBUTE 23

Intel®Graphics Performance Analyzers
· Useful tool for debugging/analyzing graphics performance in applications
· Now support browser-based applications, as well as Android platforms
DO NOT DISTRIBUTE 24

Intel®System Software Tools for Android* OS
Optimized Performance and Power Efficiency

System & Silicon ODMs
Ecosystem enabling tools
Android Atom-based Smartphone and Tablets

Feature

Benefit

Intel®C++ Compiler

Enhanced Performance

Performance

Intel®VTune Amplifier ME
Performance Profiler & Processor state tools

Most widely used tool in the industry now supports Android

Graphics Performance Analyzer Better Gaming. Longer video playback.

Debugging

JTAG Debugger

Atom-based debugger solution

Value Vectors

Support

System Reference Builds, Recipes, Documentation

Technical expertise for best performance results

DO NOT DISTRIBUTE 25

x86 Emulation
Current Situation
· Android emulation is slow · Android SDK only contains ARM images
­ X86 emulation supported ­ Instructions for building x86 Gingerbread
system images for the emulator http://www.intel.com/software/android
Intel Value Add
· Working to get x86 binary images on Intel website first and then as an SDK addon.
· HAX driver (Mac and Windows) coming in Q1 that will use VT to accelerate x86 emulation by an order of magnitude. VT is already supported in Linux.
Faster emulator and prebuilt x86 images will excite developers
DO NOT DISTRIBUTE 26

Call to Action
Intel is committed to delivering a competitive Android* solutions on Intel® AtomTM processor based platforms as part of our "port of choice" strategy
Intel® AtomTM processor based devices running Android will be in the market in 2012
· Lenovo launched K800, Orange, Lava launched IA Phone · Significant efforts are being put in to ensure Atom/Android solutions are
highly optimized
Android Open Source Project (AOSP) now includes x86 support and Join IA development
· Android NDK as of version r6b (Aug 2011 release) supports x86 · Android SDK as of version r12 (July 2011 release), supports x86 Emulation
DO NOT DISTRIBUTE 27

Thank You

