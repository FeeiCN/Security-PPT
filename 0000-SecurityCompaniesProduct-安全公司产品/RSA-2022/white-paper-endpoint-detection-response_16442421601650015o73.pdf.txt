WHITE PAPER
SECURING MOBILE DEVICES
Endpoint Detection & Response VS Mobile Threat Defense
1

INTRODUCTION
The digitalization of services and expansion of remote working has heightened the number of off-premises users accessing cloud-based resources from their mobile device. In this configuration, every mobile device represents a point of entry for hackers, spies and cyberactivists. To secure information, it is critical to have an endpoint security strategy that reliably encompasses mobile devices and embraces all their aspects (iOS, Android Enterprise...). Today, the cybersecurity market sees a set of solutions extending their existing offering to mobile, to cover the whole cyberattack surface at once. But as mobile and PC systems handle data and protocols very differently, cyberthreats targeting both systems are distinct. Endpoint Detection & Response (EDR) is the evolution of legacy antivirus. It quarantines files, detects indicators of compromise, and provides in-depth analysis to enforce post-attack rollback. EDR's strength lies in its investigation capabilities and the cross-platform visibility it provides. But when it comes neutralizing mobile threats, advanced analysis is not enough. Inevitably, when EDR is used to protect all endpoints in an indistinct manner, it creates a security gap at the mobile level. Representing 77% of the digital traffic1, mobile devices are a critical part of endpoint security strategies. But the mobile threat landscape is wide, volatile and consequently hardly addressed by catch-all offers. To fill the gap, Gartner analysts recommend the specific expertise of Mobile Threat Defense (MTD). When an EDR is in place in an IT ecosystem, MTD successfully extends the security coverage to the mobile fleet, enabling a reliable Zero-Trust strategy.
1- ComScore, Global state of mobile
1

INDEX
The mobile attack surface...............................................................3 Major discrepancies between computer and mobile risks.............4
Corporate usages VS Personal usages Software VS mobile application Advanced persistent threat VS one-shot attacks
Why EDR falls short of protecting mobile devices..........................6
Long detection times, manual investigations Lack of sufficient automation, no containment of threats Limited integrations with UEM, friction with existing mobile ecosystem No particular understanding of mobile applications And what about Android Enterprise?
Security features brought by Mobile Threat Defense.....................8
Behavioral analysis, trained to detect and identify mobile threats Security automation, for a hand-free immediate threat remediation On-device agent, to neutralize threats in real-time Advanced integrations with UEMs, enhancing their functionalities
The Unified Endpoint Security framework....................................10
MTD to close the mobile security gap Pradeo Security Mobile Threat Defense
2

THE MOBILE ATTACK SURFACE
While adding a security layer to a PC is acknowledged as necessary by everyone, some people do not have the same feeling about mobile devices. But thinking smartphones and tablets are inherently secure is a misconception. Mobile devices underly a large attack surface that cybercriminals target and exploit through various vectors: Phishing, malware, intrusive app, weak OS configuration... Today we look at mobile devices as an extension of ourselves, they are exceedingly personal. And even when they are corporate, employees can use them for a personal capacity, to text their spouse, access personal emails, use tools, etc., which makes it a real challenge to secure them.
3

MAJOR DISCREPANCIES BETWEEN COMPUTER AND MOBILE RISKS
Mobile devices are operated, used and compromised in totally different manners than desktops and laptops. These discrepancies highlight the need for distinct expertise to protect each of them.
BYOD
Bring Your Own Device
COPE
Company Owned Personnaly Enabled
COBO
Company Owned Business Only
Corporate usages VS Personal usages
Nearly all organizations supply computers to employees. Work-supplied PC or desktops are usually managed by the IT department providing them, so they can control system / software updates, take over for support purposes, etc. These devices come with strict guidelines, sometimes allowing a personal use within limits, and must often be used through a company VPN when working remotely. As a result, employees rarely use these computers when they are off the clock and spare them from installing games or visiting questionable websites for example. For mobile devices, it is a totally different story. Firstly, a report from the European Statistical Office shows that in April 2020, only 28% of employees were provided with business mobile devices2. As a result, a very large amount of connections to company's network is performed from personal devices (BYOD) that are often non-managed. Furthermore, regardless of who owns the smartphone or whether it is managed or not, mobile usages are more laid-back and inattentive, resulting in a higher threat exposition.
2 ­ Ec.europa.eu "More and more employees use business mobile devices", April 17th, 2020
4

MAJOR DISCREPANCIES BETWEEN COMPUTER AND MOBILE RISKS
Software VS mobile application
A mobile device has an average 120 applications installed3, compared to 72 softwares4 on a computer. Mobile users download significantly more applications than they download computer programs, as mobile apps are accessible, mostly free, fast to install and provide specific small services facilitating daily tasks.
This user behavior, as harmless as it seems, greatly increases the risks of data exfiltration and theft on mobile. Indeed, mobile apps are quickly cloned or developed and can be published on Google Play and Apple Store by anyone, hence reaching a large audience. They can feature a malware, hence being inherently malicious or they can be entirely sane and either leak the data they manipulate or be vulnerable to attacks. In all cases, they have the power to strongly hurt data privacy.
Mobile devices are more frequently targeted by hit and run attacks, less complex and large-scale than APT, but much faster.
Advanced persistent threat VS one-shot attacks
An advanced persistent threat (APT) is a term used to describe an attack campaign in which an intruder, or a team of intruders, establishes an illicit, long-term presence on a system in order to mine highly sensitive data. Large companies and governments are usually targeted by those assaults, they are usually carefully chosen and researched. APT attacks are manually executed and use several backdoors to infiltrate a network in its entirety.
APT uses mobile devices as entry points, among others. But still, it mostly operates on computers, databases and networks. As a result, it requires strong analytical capabilities enriched with security events from the full IT environment to be detected. Mobile devices on the other hand are more frequently targeted by hit and run attacks, less complex and large-scale than APT, but much faster.
As the behavior of users on mobile is highly versatile, the security status of such a device switches constantly: connection to unsafe network, new app installed, phishing attempt through SMS... In this case, analytics comes as a plus, but cannot at all prevent data breaches.
3 ­ Pradeo's unpublished research 4 - Flexera Software's `Country Reports' ­ UK
5

WHY EDR FALLS SHORT OF PROTECTING MOBILE DEVICES
Long detection times, manual investigations
The effectiveness of a mobile security solution depends on the time it takes to provide an accurate verdict on a threat and to create and implement protections across the organization. With EDR, the mean time to identify a breach is 197 days5, and the mean time to contain a breach is 69 days5. Such a long detection process is caused by the volume of alerts that requires human investigation, while security teams are already overburdened. On mobile, security events are multiplied by users' actions, which makes them much more numerous than on a computer, resulting in an impossible number of alerts to manually check and remediate.
With EDR, the mean time to identify a breach is 197 days5, and the mean time to contain a breach is 69 days5.
Lack of sufficient automation, no containment of threats
EDR offers various security capabilities. First, it enables pre-attack known-threat detection by crossing its findings with virus databases. Then, EDR searches across endpoints for indicators of compromise (IOCs) and realizes in-depth analytics which result in security alerts. With the provided details, security teams investigate further and come up with post-attack rollbacks. The purpose of EDR is threat hunting. It provides real-time threat visibility, but limited options to contain or eradicate unknown threats or intrusive apps for example, before they do harm. As mobile devices are targeted by one-shot attacks, EDR's capabilities do not address them efficiently.
EDR vs MTD security coverage during the different phases of a mobile attack
5 - IBM Security-Ponemon Institute 2018: Cost of a Data Breach Study
6

WHY EDR FALLS SHORT OF PROTECTING MOBILE DEVICES
Limited integrations with UEM, friction with existing mobile ecosystem
As freshly covering mobile devices, most of EDRs do not have any integration with Unified Endpoint Management (UEM) solutions, formerly known as Mobile Device Management (MDM). This lack of collaboration with enterprise mobility leaders significantly complexifies the unification of management and protection. Concretely, without UEM integrations, EDR's agent deployment on a mobile fleet requires many actions from end-users (as opposed to zero-touch deployment), and the solution misses the opportunity to enforce security measures based on devices' compliance status (such as conditional access to corporate resources), offered by UEM platforms.
No particular understanding of mobile applications
Users spend an average of 3 hours on their apps every day6, they are the source of 76% of mobile attacks7. An application can be compared to an iceberg, as most of its actions are silently performed in the background. Some of these behaviors are justified and required to execute an intended service, and some of them are superfluous. The line between both is thin, making it tricky to unravel whether an application is safe to use or not. Without any app analysis capability, experience nor knowledge to rely on, EDR only detects a few old malwares, while letting all new malwares, leaky and vulnerable applications slip through.
And what about Android Enterprise?
Android Enterprise is a turning point for IT teams managing mobile devices. Along the expansion of Android 10 and the progressive arrival of Android 11, a growing number of smartphones now have containers. Android Enterprise is commonly deployed under BYOD or COPE mode, to create separated personal and work profiles. Inside each, mobile applications run independently. Usages are restricted in the work profile while the personal one runs unmanaged. Outside of both, resources such as SMS, network preferences and OS configurations are shared.
The work container has no control nor visibility over the security context of the shared and personal resources. From a security point of view, containers are simply not getting in the way of many proven attack techniques, they are insufficient to prevent corporate data breach.
EDR providers do not address this security issue, as their mobile agent cannot provide a security status of the personal profile without breaking users' confidentiality. 5. "2018 Cost of a Data Breach Study," Ponemon Institute, 2018
6. "Global mobile security market leadership report", IDC, 2019 7. "Mobile security report", Pradeo, 2020
7

SECURITY FEATURES BROUGHT BY MOBILE THREAT DEFENSE
As for any cyber-threat defense strategy, the effectiveness of the response is inherently related to the detection capabilities. Thwarting mobile threats requires a dedicated expertise and a tailored solution.
Behavioral analysis, trained to detect and identify mobile threats
To target mobile devices, hackers are relentlessly creative. While computer threats are mostly known and identifiable through their viral signature, mobile threats on the other hand are constantly renewed. For example, the banking malware formerly called Cerberus and now identified as Alien keeps changing shape to hide in mobile applications. However, the fact that it overlays other apps and sends keystrokes to a distant server remains. To reliably detect Alien and other malicious or intrusive programs, security solutions must combine two capabilities: analyzing behaviors and crossing them with some context, hence minimizing false-positive alerts. The same applies for leaky behaviors peppered within applications which often infringed company's security posture.
Security automation, for a hand-free threat remediation
Security teams do not all operate in the same way. While some large teams dedicate plenty of time to investigating the threat landscape, others do it to a lesser extent. But one thing they have in common is the will to efficiently prevent data breach. As mobile threats act fast, a manual remediation cannot contain them. Mobile security services must be automatable to detect and remediate threats in real-time, before they compromise devices. The mobile ecosystem is composed of multiple configurations (Android Entreprise, VIP/sensitive users, BYOD...) for which security is handled differently. Thus, automatable threat remediation features must offer a variety of options such as blocking apps, disconnecting connections, alerting users, conditioning access to corporate data, etc. to answer all possible scenario.
8

SECURITY FEATURES REQUIRED TO PROTECT MOBILE DEVICES
On-device agent, to neutralize threats in real-time
Some mobile threats take advantage of a short window of opportunity to harvest sensitive data. It is the case for network attacks, such as Man-In-The-Middle or OS attacks that act on momentary system vulnerabilities. A security solution with no mobile agent will provide limited coverage. Indeed, the above-mentioned threats can only be detected with an on-device security agent that continuously scans the environment for malicious behaviors. Besides, this presence on the mobile device is essential to immediately block any attack, hence efficiently preventing data breach. Concerning Android Enterprise, a mobile security agent must have visibility through containers to protect work profiles from threats coming from the personal environments, without breaking users' privacy.
Advanced integrations with UEMs, enhancing their functionalities
Mobile devices are usually managed with Unified Endpoint Management (UEM) platforms. A first dimension of integration offered by Mobile Threat Defense (MTD) solutions consists in smoothening devices' security management, by dynamically retrieving mobile fleets' structure in the UEM (groups...) and applying the adequate security policy. Besides, UEMs offer some basic security features that can be leveraged once fed with security conclusions (as opposed to security events coming from EDRs). Microsoft Intune for example enables to condition access to Office apps according to the security status of devices provided by MTD solutions. To enhance organizations' existing mobile ecosystem, mobile security solutions must offer complementary services that smoothly integrate with UEMs.
9

THE UNIFIED ENDPOINT SECURITY FRAMEWORK
Mobile Threat Defense to close the mobile security gap "To face emerging endpoint security challenges, security and risk management leaders must combine functionality from Endpoint Protection Platforms, Endpoint Detection & Response and Mobile Threat Defense in a unified endpoint security approach."
Dionisio Zumerle, VP analyst at Gartner As Gartner analysts highlighted in the "Innovation Insight for Unified Endpoint Security" report published end of 2020, EPP and EDR solutions fall short when it comes to addressing the mobile attack surface. Their recommendation for a zero-trust security strategy is to combine EPP/EDR analytical capabilities that wellprotect the computers of an IT environment, with Mobile Threat Defense to address the mobile part of the equation.
10

THE UNIFIED ENDPOINT SECURITY FRAMEWORK
Pradeo Security Mobile Threat Defense
Pradeo relies on 10+ years of experience in mobile security to provide Pradeo Security, a leading solution dedicated to securing mobile devices and applications. Pradeo Security Mobile Threat Defense protects devices used for work-related activities, corporateowned or personal (BYOD), to prevent mobile data breach.
Lightweight mobile security application
Pradeo Security mobile agent is available for Android, Android Enterprise, iOS and Chromebooks. It performs transparent security checks to detect app, network and device-borne threats, and remediates them in real-time, before they do harm.
Fully automated security
To alleviate security teams' workloads, Pradeo Security is entirely automatable. Once setup with a chosen security policy (predefined and customizable), administrators can pick which security measures to apply to detected threats. The on-device agent enables to block apps, disconnect the network, alert users, or condition access to corporate data, among others, automatically and immediately.
Proven integrations with UEMs
Pradeo has integrations with VMware Workspace ONE, Microsoft Intune, MobileIron, IBM Maas360, and SOTI. Those integrations simplify the deployment and management of Mobile Threat Defense on an existing managed mobile fleet. Once setup, Pradeo Security keeps track of devices' security level and automatically delivers a compliance status per device to the UEM. Administrators can entirely monitor their fleet's compliance in the UEM's interface, and condition access to corporate resources accordingly.
In-depth mobile app security expertise
Pradeo's core expertise is mobile application security testing. Along the years, the Pradeo Security engine has audited millions of mobile applications, implemented thousands of security rules and detected billions of unwanted and leaky behaviors in them. This expertise has perfected Pradeo's mobile application threat detection to an unparalleled level on the market, providing for example a detailed view on personal data processing, malware, fraudulent activities, etc...
11

