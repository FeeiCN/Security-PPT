Breach Prevention Made Easy
10 TIPS TO STOP RANSOMWARE & BOOST SECURITY WITH MICROSOFT DEFENDER AV

10 Tips to Stop Ransomware & Boost Security with Microsoft Defender AV

INTRODUCTION
Microsoft Defender Antivirus (MDAV), known as Windows Defender Antivirus before the Windows May 2020 update, is an anti-malware component of Microsoft Windows. MDAV continually scans for malware, viruses, and advanced security threats. In addition to this real-time protection, updates are downloaded automatically to help keep your device safe and protect it from threats. More businesses use MDAV over any other to prevent, detect, investigate, and respond to advanced threats. Recent market share calculations show that Microsoft alone holds over 30% of the market in endpoint protection and is expected to continue to grow exponentially.
When approaching a rollout of MDAV or conducting a security assessment of the existing environment for your organization, it can be difficult to know where to start. This ebook aims to give you confidence in learning how to start on the right foot on your journey to optimize the protection for your endpoint environment with MDAV. Getting devices into the service is just the beginning. Endpoint security settings need to be configured and essential settings and features need to be managed. An even greater opportunity is leveraging Morphisec's breach prevention and MDAV management solution to take endpoint protection to the next level, thus stopping ransomware, evasive attacks, and unknown threats in addition to the known attacks that MDAV prevents.
Morphisec Guard compliments MDAV by focusing on the evasive and zero-day attacks that frequently bypass detection-based defense mechanisms. Morphisec also offers a single console that allows you to manage two solutions from one interface, including installation, configuration, added protection, and coordinated response capabilities. Morphisec tightly integrates with Microsoft Defender AV as well as Microsoft Defender for Endpoint. (e.g., see Microsoft customer stories for Radwell and Towne Properties)

By bringing both Microsoft and Morphisec together, you have the best of both worlds -- an industry-leading antivirus paired with Morphisec's best-of-breed breach protection that secures 8 million endpoints worldwide from ransomware, zero-day attacks and other evasive threats.
TOP TIPS
The quick tips in this eBook will help you harden, protect and monitor your environment quickly and effectively.
1. Turn Windows Defender ON and Configure It 2. Turn on Ransomware Protection 3. Utilize Manual Scanning 4. Detect & Remove Hidden Malware with Offline Scan 5. Turn Tamper Protection ON 6. Configure Cloud Protection Levels 7. Access Control 8. System Hardening 9. Visibility and Control 10. Curate Notifications

© 2021 Morphisec Inc. www.morphisec.com | 2

10 Tips to Stop Ransomware & Boost Security with Microsoft Defender AV

TIP #1
TURN MICROSOFT DEFENDER ON AND CONFIGURE IT
The real-time scanning module of Defender AV is active by default on every Windows installation. However, it is very important to verify this and ensure that all of the protection modules are enabled. A common mistake many users make is that if a third-party antivirus is present, MDAV will be disabled until the other antivirus is disabled. It is best practice to uninstall any third-party program from the device completely. This includes any trials and add-on or additional AV products (e.g., MalwareBytes, Avast, Webroot, any free AV, or non-MDAV products).
Once this is complete and verified, MDAV will be enabled automatically. In addition, many features are disabled by default, and action is required in order to turn those modules on. Check if all protection modules are active.

To do this, open the Start menu at the bottom left of the screen. Next open the app called Settings, and then follow this path: Update and security  Windows security  Protection against viruses and threats. Once under the protection heading, click Manage settings, below the section Virus and threat protection settings.

TIP #2
TURN ON RANSOMWARE PROTECTION
MDAV includes anti-ransomware features as part of its security tools. This Ransomware Protection feature is disabled by default. Before enabling this setting, ensure you conduct baseline testing in a safe environment to ensure this feature does not unintentionally impact any business operations. This is a general best practice for introducing any net new changes into a production environment.
To enable this feature, visit the Virus & threat protection screen, scroll down to Ransomware protection, and click Manage ransomware protection.
Click the switch under Controlled folder access to turn the option on. This will protect your Pictures, Documents, Videos, Music, and Desktop folders, but you can supplement these by clicking Protected folders, then Add a protected folder.

© 2021 Morphisec Inc. www.morphisec.com | 3

10 Tips to Stop Ransomware & Boost Security with Microsoft Defender AV

TIP #3
UTILIZE MANUAL SCANNING
A malware scan is only as effective as its last definition update, which means if it is not updated regularly, the scan may be unaware of and unable to detect newer forms of malware. Microsoft Defender Antivirus updates are released alongside Microsoft Windows updates, which is why automatic updates should be turned on at all times. Once properly configured, MDAV continually scans your device automatically; you can perform an additional scan whenever you want, though. Ondemand scanning is an important feature to leverage to conduct security investigations into suspicious activity and specific areas that are more exposed to attacks.
Quick Scan: This allows you to immediately check your device for any recent threats. This option is useful when you don't want to spend the time running a full scan on all your files and folders. This is ideal if you are concerned about a suspicious file or virus to your device.
Full Scan: Scans every file or program that's currently running on your device to detect malicious activity.
Custom Scan: Scans only files and folders that you select. Key to conducting targeted investigations in less time.

TIP #4
DETECT & REMOVE HIDDEN MALWARE WITH OFFLINE SCAN
Offline Scan works by rebooting into a safe environment to perform a scan outside of Windows, where hidden malware is unable to run. Note: The scan takes up to 15 minutes. Don't panic if your screen goes black for a few seconds, as this is normal. If any malware is found, you'll be prompted to remove it, but otherwise, your PC will boot back into Windows once the scan is complete.
© 2021 Morphisec Inc. www.morphisec.com | 4

10 Tips to Stop Ransomware & Boost Security with Microsoft Defender AV

TIP #5
TURN TAMPER PROTECTION ON
Tamper protection is designed to prevent unwanted changes to security settings on devices. Customers can mitigate malware and threats that attempt to disable security protection features with this protection in place.
With tamper protection, malicious apps are supposed to be prevented from taking actions such as:
Disabling virus and threat protection Disabling real-time protection Turning off behavior monitoring Disabling antivirus Disabling cloud-delivered protection Removing security intelligence updates
Attempts to bypass antivirus protection and deploy ransomware are particularly successful in cases where:
Attackers already have domain admin privileges Tamper protection is off Cloud-delivered protection is off Antivirus software is not properly managed or is not in a healthy state

MDAV generates alerts for many activities associated with these attacks. However, in many of these cases, affected network segments and their associated alerts are not actively being monitored or responded to. Attackers also employ a few other techniques to bypass protections and run ransomware code. In some cases, artifacts indicate that they introduce a legitimate binary and use Alternate Data Streams to masquerade the execution of the ransomware binary as a legitimate binary.
Example Blocked Events: Tamper Protection Blocked a change to Microsoft Defender Antivirus.
Value: HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection\DisableIOAVProtection = (Current) Value: HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection\DisableScriptScanning = (Current) Value: HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection\DisableRealtimeMonitoring = (Current)

© 2021 Morphisec Inc. www.morphisec.com | 5

10 Tips to Stop Ransomware & Boost Security with Microsoft Defender AV

TIP #6
CONFIGURE CLOUD PROTECTION LEVELS
Turn on Cloud Protection and set levels to desired settings. The recommended high enforcement security setting is zero tolerance. As a general best practice when configuring any security device it is advisable to start with the highest enforcement and move down to a lower setting if desired. In addition, specific endpoints can be separated into workgroups with specific security settings depending on their risk profile.
High: Applies a strong level of detection High Plus: Uses the High level and applies extra protection measures Zero tolerance: Blocks all unknown executables *High is default
In addition, set up specific group settings:
Default blocking level provides strong detection without increasing the risk of detecting legitimate files Moderate blocking level provides moderate only for high confidence detections High blocking level applies a strong level of detection while optimizing client performance (but can also give you a greater chance of false positives) High + blocking level applies extra protection measures (might affect client performance and increase your chance of false positives) Zero tolerance blocking level blocks all unknown executables

TIP #7
ACCESS CONTROL
All of these security controls and best practices have no value if an administrative account is compromised and MDAV is turned off. Implementing strict access control governance can mitigate this threat and make it significantly more difficult for attackers to compromise or bypass MDAV.
Browser-based attacks, remote work application exploits, and phishing attempts can be resolved through several vehicles, such as with multi-factor authentication and moving target defense solutions that secure your remote employee's browser against advanced evasive malware.
Morphisec Guard adds a dedicated memory defense layer to every browser instance as a guard against these attack vectors. As a result, these attacks are unable to gain a foothold within an employee's machine.

© 2021 Morphisec Inc. www.morphisec.com | 6

10 Tips to Stop Ransomware & Boost Security with Microsoft Defender AV

TIP #8
SYSTEM HARDENING
Zero Trust is a critical method of protecting networks and user access. Although an effective strategy at the network and identity layers, it still doesn't harden systems enough. That's why Morphisec Guard is specifically designed to protect critical endpoint applications from threat actors and evasive techniques that hide from detection-based solutions - i.e., the unknown attacks, ransomware, evasive malware, zero-days and other advanced threats. This is done without the need for prior knowledge.

Morphisec Guard proactively blocks evasive threats; there is no detection system involved
Zero Trust at application runtime means ransomware, zeroattacks and other evasive threats are halted before they gain persistence
Morphisec Guard's Zero Trust at application runtime capability saves resource-strapped IT teams time and money

See Ransomware and other attacks stopped by Morphisec and Defender

Immediate visibility of endpoint protection status
© 2021 Morphisec Inc. www.morphisec.com | 7

10 Tips to Stop Ransomware & Boost Security with Microsoft Defender AV

TIP #9
VISIBILITY AND CONTROL
Microsoft Defender AV is widely used, but lacks some of the capabilities needed to make it a true enterprise-grade solution. These lacking features include centralized management, control and policy implementation, and lockdown of machine security settings.
Morphisec Guard tightly integrates with Windows to bring enterprise-wide visibility and control to its native security features. This includes the ability to harden infrastructure by locking down security settings, providing additional bypass and tampering protection, or accidental changes creating security risk. This helps businesses reduce complexity and cost in their environment without sacrifice or disruptive change.

Morphisec Guard Protects the Entire Organization
Against the Full Attack Chain...
A single management console for enhancing overall security Immediately gain full visibility and control of your MDAV and enforce security and IT policies across your entire company Harden your current MDAV installation -- quick and simple onboarding, no rebooting or training required Automatically block attacks from executing -- providing essential protection when security and malware library updates are not yet available or applied Add centralized control over native Windows 10 security features, such as disk encryption, device control, and personal firewall Implement and lock down settings to prevent tampering, reverse engineering attempts, and accidental configuration drift Reduce complexity and cost with free access to security that just works

© 2021 Morphisec Inc. www.morphisec.com | 8

10 Tips to Stop Ransomware & Boost Security with Microsoft Defender AV
TIP #10
CURATE NOTIFICATIONS
MDAV will send notifications about the health and safety of your device. You can turn these notifications on or off on the notifications page. In Virus & threat protection, go to Virus & threat protection settings. From there, select Manage settings, scroll down to Notifications, and select Change notification settings. You will always receive Virus & threat protection notifications when there's a problem that requires immediate action. The Virus & threat protection settings let you specify whether you want informational messages, such as that a threat was successfully blocked or that a malware scan was completed.
CONCLUSION
Better Together Morphisec + Microsoft Defender
Microsoft has invested more than $1 billion a year into its cybersecurity software since 2016. This has included innovation in MDAV, turning it into the equal of any third-party endpoint protection platform. What it lacks in management capability, it more than makes up for in protection. Implementing these 10 tips above will ensure you get the most from MDAV's protection and, with the help of Morphisec Guard, deploy a full enterprise-grade solution that secures critical infrastructure from known and unknown attacks.
© 2021 Morphisec Inc. www.morphisec.com | 9

10 Tips to Stop Ransomware & Boost Security with Microsoft Defender AV
ABOUT MORPHISEC
Morphisec is breach prevention made easy. We are the world leader in providing advanced security solutions for enterprises around the globe. We simplify security and automatically block modern attacks from the endpoint to the cloud. Unlike traditional security solutions focusing on known attacks and relying on human intervention, our solutions deliver operationally simple, proactive prevention of the most advanced and unknown threats. We protect businesses around the globe, helping them optimize their security resources to stop the most dangerous and sophisticated cyber attacks. Morphisec protects over 8 million endpoints worldwide from ransomware, zero-day attacks and other evasive threats, for Motorola, Maersk, Citizens Medical Center, Yaskawa, and many more.

GET ADVANCED SECURITY THROUGH BREACH PREVENTION MADE EASY, ON US
At Morphisec, we believe that every organization should have access to the technology necessary to prevent damaging breaches -- no matter the size of their team or the size of their wallet.
We are so confident that you will find Morphisec as easy as we say it is that we're offering a free 30-day trial of Morphisec Guard.

Sign Up for a Free Trial
Visit www.morphisec.com to learn more or email demo@morphisec.com for a closer look.
© 2021 Morphisec Inc. www.morphisec.com | 10

