Secure Host Baseline
Windows 10 Migration

UNCLASSIFIED

UNCLASSIFIED

UNUITNEITDEDININSSEERRVVIICCE TTOOOOUURRNANTAIOTNION

21 April 2016
1

Presentation Disclaimer

UNCLASSIFIED

"The information provided in this briefing is for general information purposes only. It does not constitute a commitment on behalf of the United States Government to provide any of the capabilities, systems or equipment presented and in no way obligates the United States Government to enter into any future agreements with regard to the same. The information presented may not be disseminated without the express consent of the United States Government. This brief may also contain references to Unite States Government future plans and projected system capabilities. Mention of these plans or capabilities in no way guarantees that the U.S. Government will follow these plans or that any of the associated system capabilities will be available or releasable to foreign governments."

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

2

· Panel Member Introductions

Terri Parks, NSA Ed Zick, DoD CIO Ray Perry, AFECMO Rick Munck, AFECMO Chris McKinney, DISA RME Mike Hayes, DISA ID

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

UNCLASSIFIED 3

Overview

UNCLASSIFIED

· Task: DoD CIO priority to migrate IT systems running MS Windows operating systems to Win10 by 31 January 2017; tasked DISA to lead rollout

· Methodology: Services implement DoD Win10 Secure Host Baseline as a security hardened, STIG compliant "build from" capability
 Leveraging refined NSA and Air Force standard desktop process  New paradigm for continuous updates and patching; will be available on
Information Assurance Support Environment (IASE) portal  Will include commonly used and mandated applications (i.e., Google Chrome)
· Benefits: Win10 security enhancements, fewer configurations, improved interoperability, enterprise licensing, apps rationalization

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

4

Background

UNCLASSIFIED

· Apr 2009 efforts began with Standard Desktop Configuration (SDC)/DoD Server Core Configuration (DSCC) "images"
· Oct 2010 CENTCOM Unified Golden Master (UGM) for AOR urgent needs · Oct 2011 MilDep CIO buy-in for Unified Master Gold Disk (UMGD) concept · Dec 2012 Request from Dep DoD CIO for Cyber Security to Create PMO · Oct 2013 Rebranded to Secure Host Baseline (SHB) "build from" · May 2014 released first SHB for Win 7 on DISA IASE web site · Sept 2015 DoD CIO request for Win 10 SHB rapid rollout across DoD

Leveraged AF's standard desktop image experience to develop current methodology

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

5

Joint Secure Host Baseline Working Group*

UNCLASSIFIED

Lead by NSA and DISA

Partnership

· DoD CIO

· AF Enterprise Configuration Management Office (AFECMO)

Lead Integrators
· Government  NSA  DISA  DoD CIO  AFECMO  OSD  USMC

· Industry  Microsoft  Apple  Red Hat  Other vendors
*Formerly call the Joint Consensus Working Group

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

6

Development Team

UNCLASSIFIED

DoD joint initiative and validation

· Security Technical Implementation Guides (STIG) worked thru Security Settings Reviews (SSR)

· Hardened baselines
 Windows  Apple  Linux  Various applications

· Inheritance and reciprocity

· .mil

AFECMO

· Tasked by NSA/Joint SHB WG to develop Windows baselines

· On-going effort since 2009 with several "published" OS baselines

· Funded by NSA to develop for the DoD

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

7

Solution Overview

UNCLASSIFIED

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

8

End-to-End Process

Option 1: Deploy Using
Enterprise Infrastructure
(SCCM,etc)
Option 2: Deploy Using
Bootable Media
UNCLASSIFIED

Start Maintenance
Cycle

Login to DISA IASE Website

Download Framework, Deployment Share, and Maintenance
Packages

Plan Deployment Method

Install SHB Solution on a "Lab Machine" (non-production)

Add Customizations (Optional) such as Drivers, Custom Apps, Branding, etc.

Open Framework

UNITED IN SERVICE TO OUR NATION

UNCLASSIFIED 9

Windows 10 Secure Host Baseline Milestones

UNCLASSIFIED

Challenges
Third-party driver 1c0ompatibility issues VDI compatibility with 1C0redential Guard Hardware upgrades 1(l0egacy systems) 5-10
UNCLASSIFIED

Key Objectives:
· Improve Endpoint Security · Enhance Interoperability · Increase Efficiencies

31 Jan 2017
Migration Complete
Fall ­ Redstone Release (SHB 10.2)
22 Mar ­ USCC TASKORD Released

3 Mar ­ Win10 SHB Posted on IASE Portal 29 Feb ­ DEPSECDEF Action Memo Released

12 Jan ­ Briefed DSAWG

20 Nov ­ DoD CIO Memo Released

9 Nov ­ Briefed Ent Sec Solutions Group (ESSG) 4 Nov ­ Briefed Ent Arch Engineering Panel (EAEP)
1 Oct ­ Briefed JIE EXCOM
UNITED IN SERVICE TO OUR NATION

Legend Complete On Schedule At Risk
10

Backup Slides

UNCLASSIFIED

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

11

UNCLASSIFIED
PREPARE HBSS ECOSYSTEM PRIOR TO SHB DEPLOYMENT

· Prior to deploying Windows 10, site HBSS ecosystem must be prepared to support Windows 10. SHB requires specific modules and patches that have been updated to support the DoD Windows 10 SHB framework.

· Site Administrators will have to verify the applicable modules and patches are configured in the local ePO for deployment to new Windows 10 clients. Failure to use the correct versions of modules and patches will result in a catastrophic failure at the endpoint.

· The HBSS Windows 10 information is located on the DISA IASE web portal under the Windows 10 SHB section:
­ https://disa.deps.mil/ext/cop/iase/dod-images/Pages/Win10.aspx
­ https://disa.deps.mil/ext/cop/mae/CyberDefense/HBSS/SitePages/win10updates.aspx

· DISA and USAF team have coordinate a Software Forge site where administrators can collaborate on both the Windows 10 (USAF) and HBSS (DISA) aspects of the SHB deployment.

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

18 JAN 2016 1900

12

Win10 SHB Applications ­ "First Release"

Application
AppLocker Whitelist Starter Policy Group Policy
Image Branding McAfee VirusScan Enterprise
Microsoft NetBanner NIPRNet DoD Root Certificates Windows 10 Enterprise (CBB)

Install Default
Mandatory Mandatory Mandatory Mandatory Mandatory Mandatory Mandatory

All apps (both mandatory and optional) have STIGs or meet NSA security specs; common DoD-wide apps

Application
ActiveClient Adobe Acrobat Reader Adobe Flash Player Plugin-based
browser Adobe Shockwave Player Axway Desktop Validator
DoD Trusted Sites List Google Chrome
Local Security Policies Microsoft Office Professional (x86)
Oracle Java Runtime Engine Oracle Java Runtime engine (x64)
SIPRNet 90meter SIPRNet DoD Root Certificates

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

UNCLASSIFIED
Install Default
Optional Optional Optional
Optional Optional Optional Optional Optional Optional Optional Optional Optional Optional
13

Win10 Security Improvements

UNCLASSIFIED

Credential Guard Windows Defender AppLocker Malicious Software Removal Tool Enhanced Mitigation Experience Toolkit SmartScreen

Counters pass-the-hash technique used in nearly all major Windows intrusions Malware protection
Seamlessly integrated; protection at the kernel level
Provides a capability to specify which users or groups can run particular applications Anticipates most common actions and techniques adversaries might use in compromising a computer IDs malicious websites; scans for suspicious characteristics

Future potential to sunset existing duplicative security tools

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

14

Win10 Security Improvements

UNCLASSIFIED

Credential Guard Windows Defender AppLocker Malicious Software Removal Tool Enhanced Mitigation Experience Toolkit SmartScreen

Counters pass-the-hash technique used in nearly all major Windows intrusions Malware protection
Seamlessly integrated; protection at the kernel level
Provides a capability to specify which users or groups can run particular applications Anticipates most common actions and techniques adversaries might use in compromising a computer IDs malicious websites; scans for suspicious characteristics

Future potential to sunset existing duplicative security tools

UNCLASSIFIED

UNITED IN SERVICE TO OUR NATION

15

