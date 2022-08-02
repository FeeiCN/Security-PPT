2022
Patch Management Buyers Guide
100 Essential Questions to Ask Before Purchasing Any IT or Patch Management System

Table of Contents
100 Essential Questions About Any Patch Management System | Is The Patch Management System Cloud Or Premise? | Agents/Communications | Remote Endpoint Management | Remote Site Management | Patch Management | Reboot Management | Reporting | Integration | Inventory | Vulnerability Scanning | Security | Licensing | Customer Support | Remote Troubleshooting Tools | Software Distribution Support | Management Automation | Visual Workflow Designer |

100 Essential Questions About Any Patch Management System
Selecting a new or replacement IT management or patch management system can be difficult, with many vendors offering what seems like similar features. This guide aims to provide a list of essential questions that should be asked of vendors to identify the benefits of each system.
Is the Patch Management System Cloud or Premise?
Premise systems are installed onsite inside the corporate firewall. This typically involves purchasing additional hardware, software, and SQL databases. Along with purchase costs, there will be ongoing maintenance of the equipment and software as well as staff time managing the additional hardware.
Premise patch management systems are often maintained by the customer's staff who will have to do system upgrades, agent updates, and other maintenance. The complexity of upgrades usually slows the addition of new features in the toolset.
Premise-based systems may have challenges managing devices outside of the corporate firewall (home-based staff, traveling employees, etc.). You may have to install additional hardware inside the DMZ, open firewall ports, or only be able to manage users connected via VPN which can cause extreme strain on the VPN when patching. Some organizations may have a policy that bans the use of cloud technology or be air-gapped from the internet, not allowing cloud solutions.
Typically, premise solutions are purchased with a significant upfront cost and then annual maintenance cost. This can be helpful when IT departments have CapEx budget vs. OpEx budget.
Cloud systems are hosted and maintained by the vendor in Azure or AWS. This usually allows systems to be up and running in less than an hour since no hardware or additional software is required. This simplifies ongoing maintenance, system upgrades, and allows the vendors to consistently add new features and capabilities into the tool.
These are well-suited to manage devices that are highly distributed, such as environments with large numbers of home users and hybrid premise/cloud environments. However, some systems may require firewall modifications. It is important to understand how the system optimizes traffic. For example, can content be shared between endpoints, eliminating the need for each endpoint to download its own content? They may be unable to manage devices that do not have internet access, although some tools have ways around this.
The systems are usually purchased using a SaaS model, with a monthly or annual usage fee. This can be helpful when IT departments have OpEx budget vs. CapEx budget.
© Syxsense | All Rights Reserved | Page 3 of 17

Questions Specific for Premise-Based Patch Management System
What hardware do I need to purchase? Do you need an appliance, VPN, or software gateway in your DMZ to manage users outside the firewall? Do I need to install hardware at any remote sites? What additional software do I need to purchase (such as Server Operating Systems and Databases)?
Questions Specific for Cloud-Based Patch Management System
What ports need to be opened on our firewall? Do I need to install hardware at any remote sites? How do you reduce internet traffic?
Agents / Communication
Agents are applications that are installed on each device/endpoint you want to manage. The agents create a connection between the endpoint and the management cloud/server. Understanding how the agent works is essential. Some agents poll the cloud/server at a set interval. For example, if the poll is every 60 minutes, you will be unable to perform instant management tasks since you would have to wait for a polling interval. Other agents work by having an always-open connection between the endpoint and the cloud/server. This allows tasks to be performed instantly.
© Syxsense | All Rights Reserved | Page 4 of 17

Some tools also offer an agentless option or hybrid agent/agentless option. Agentless will enable devices to be managed without any software installed on the endpoint. However, typically, this can only work for machines inside the corporate firewall.
The patching tool must be able to perform its tasks without creating an excessive amount of traffic either on LAN, WAN, or when communicating with devices that are not in the corporate domain.
Advanced tools may make use of `file sharing' technology, allowing a device to obtain files from a peer rather than having to download the file from outside of the domain.
When deploying a patch to several devices at the same time, an intelligent tool will have protocols and features built in that avoid the target devices downloading the same files multiple times.
You should always ask about how large the agent is (Diskspace, RAM, and CPU Usage). You also want to consider how the agent can be initially installed as well as how upgrades are managed.
Do you support Microsoft Windows? · What versions of Microsoft Windows do you support? · Does the tool recognized and support devices that are running Windows Extended Support
licenses (e.g. Windows 7)?
Do you support Apple Mac OS? · What versions of Mac OS do you support?
Do you support Linux? · What flavors and versions of Linux do you support?
What are the minimum hardware and software requirements (Disk, RAM, CPU, .NET versions)?
Do you require agents installed on each device? · How are agents installed? · How are agents updated?
Does your patch management solution have an agentless option?
Do you have automatic discovery of new endpoints?
How do the agents communicate with the server?
© Syxsense | All Rights Reserved | Page 5 of 17

Can you run instant tasks, or do I have to wait for agents to poll the servers? · How often do agents poll the server? Do you support proxy servers? Can you support devices that cannot connect directly to the internet? How does the system ensure that traffic across the internet and the network is minimized? · Do clients share content at a peer level to reduce traffic?
Remote Endpoint Management
How do you handle users at home or outside the corporate firewall? Do you have to purchase additional hardware to manage remote users? Do you have to open firewall ports to support remote users?
Remote Site Management
How does the patch management tool manage users at remote sites? Do you have to purchase/install additional servers or hardware at remote sites? · How is this additional hardware managed? · How is content synchronized? What ports need to be opened, if any? How is traffic managed for remote sites? Where are patches and service packs stored?
© Syxsense | All Rights Reserved | Page 6 of 17

Patch Management
Patches are application and operating system updates that address security vulnerabilities within the application or operating system. They are also released to fix bugs within the software. It is important to remediate the vulnerabilities to reduce the risk of an attacker gaining access to your data through a compromised device.
Does the patch management system support third-party patching? · What third-party content is provided? · Will the vendor add new third-party content on request? · Can you add your own custom patches?
How do you handle patch supersedence? · Are the older/prerequisite updates also supported? · Can the system automatically deploy prerequisites or newer content without having to pick and
choose?
Can you deploy Windows 10 Feature Updates? · Can the end-user choose to postpone the feature update deployment? · Can the system push interim feature update versions?
Does the tool have email approval capability before allowing devices or servers to be patched?
Can you chain tasks together to create multi-step jobs?
Where is patch content stored?
Do you have maintenance windows? · When maintenance windows close, do all tasks stop running automatically? · Do you support Wake-on-LAN (WOL)?
Can you create blackout windows to block tasks during critical times?
Can you uninstall patches?
Will the system attempt to deploy updates that aren't required?
Is it possible to disable a patch so that it can never be deployed by accident?
© Syxsense | All Rights Reserved | Page 7 of 17

Can the system deploy specific updates to specific devices/departments/sites?
When a software vendor publishes a patch, how quickly will the patch appear in the console?
Are vendor severity and the independent CVSS score provided for the patches in the console? · Are the patch severity levels updated when new definitions are released?
How do you handle devices that miss a patching cycle?
Is the solution device-agnostic? · Can you manage virtual machines, virtual hosts, cloud-based devices, laptops, desktops, and servers?
Can you perform pre- and post-deployment actions like PowerShell scripts, reboots, or permission gateways?
Reboot Management
Many Microsoft patches will refuse to install on a device that is pending a reboot to ensure that both the device and patch are not damaged after the reboot. Therefore, it is important that the tool determines whether a device is in a `pending reboot' state to take the appropriate action before deploying patches to the device.
Does the system detect devices that require a reboot? Can you automate reboots? Can you have custom messages and snooze options? Can you force a reboot after a certain amount of time?
Reporting
Reporting is often overlooked as a requirement of many patching solutions. Many businesses have a regulatory requirement to prove that they are patched (PCI, HIPAA, etc.). It is essential to consider not only how many reports a tool may have, but how useful the reports are. This also includes drill-down capabilities, automatic email scheduling, and data exporting capabilities.
How many reports does the patch management system have?
Can you schedule reports to be emailed?
© Syxsense | All Rights Reserved | Page 8 of 17

Can you create your own reports? Does the system have customizable dashboards? Are there any compliance reports? Do you have a visual map of the network/sites and device status? Which file formats are supported for exported reports? Do reports support drill-down for additional levels of detail?
Integration
A patching tool that integrates with a service desk tool will allow your IT support team to work in a more efficient manner. They will not need to move between different consoles while trying to determine the cause of an issue on a device. Can you integrate into service desk solutions?

Inventory
A patching tool that collects hardware and software inventory data and then organizes the devices based on that data should allow you to create patch strategies for different devices.
For example, you may wish to deploy patches to servers in the evening when they are not being placed under any load, but you may wish to deploy patches to workstations during `office hours' as they are more likely to be online.

Is there a detailed inventory of devices?
Does it collect detailed hardware information? · Warranty information from manufacturers?
Does the system collect installed software?
Is there a change history for the endpoints? · Can you create a comparison between two points in time?
Can you see when a device is online or offline in real time?

© Syxsense | All Rights Reserved | Page 9 of 17

Vulnerability Scanning
Unpatched devices are only one risk your endpoints might face on the network. Advanced next-generation IT management and patching tools can scan endpoints for other types of security vulnerabilities, such as open ports and unsecure passwords. When an unsecured or compromised endpoint is detected, the system should be able to be quarantined. This will stop communication laterally on the network to other devices and the internet. However, the device should still be able to be managed by the IT and patch management tool to allow investigation and remediation.
Can the system scan for endpoint vulnerabilities other than patches? Can devices be quarantined to protect the network? Can a dangerous process be automatically terminated if seen within the environment? Can you restrict the running of specific software?

Security
Both premise and cloud solutions have security considerations. Not only should you be concerned about the security of the tool, but also the safety of your data. You should consider where your data is being stored. Is it being commingled with other customers? Has the vendor ever had a security breach or CERT advisory issued against them?

Do you support multi-factor authentication? · What multi-factor methods can be used?
Do you support Single Sign-On (SSO)? · What Single Sign-On methods do you support?
Where is your data stored?
Is the database commingled with other customers?
Is the data encrypted in the database?
Is all communication encrypted?

© Syxsense | All Rights Reserved | Page 10 of 17

Can console access be IP/country-restricted?
Is there an audit trail of activities?
Can a system administrator be limited to only specific security permissions? · Do you support admin roles?
Can administrators be limited to managing only certain users or devices? · Do you support security scopes?
Has the vendor had any security breaches?
Has the system had any CERT or CVE/CVSS-level alert issues in the previous 5 years?

Licensing
Typically, two different types of licensing are common with patch vendors. Premise tools often use a perpetual licensing model with significant upfront costs and annual maintenance agreement. In contrast, SaaS/cloud vendors typically use a subscription that is either paid monthly or annually.

There are additional licensing considerations. For example, premise products often require hardware that may require additional licenses, such as operating systems, databases, and antivirus software. Depending on the vendor, you may need additional hardware and licenses for remote sites and remote users.

Another important consideration is any additional software licenses the tool might require. For example, Microsoft System Center requires client access licenses (CAL) on servers, which may not be included in your enterprise agreement. In the case of Microsoft System Center, this additional licensing requirement takes a tool that is often considered free to costing more than purchasing a brand-new cloud tool.

Is there a cost per device?

Is there a cost per admin user?

Is there a difference between client and server licensing costs?

Are you licensing SaaS or are you purchasing the software?

© Syxsense | All Rights Reserved | Page 11 of 17

Are there annual software maintenance costs? What optional features do you have that we have not purchased? Is a CAL (Client Access License) required for Windows R2 servers? Do old devices that are not active on the network consume a license? · Can stale device records be automatically archived?
Customer Support
You should not overlook the importance of excellent customer support. Some vendors may restrict your support options to chat or email only support with limited hours, and even overseas or outsourced functions. Do you have access to phone customer support? · Is this included for free? Do you have live chat customer support? What other types of support do you need? What times are the customer support open? Does the vendor charge for training and customer onboarding?
ADDITIONAL CONSIDERATIONS
Remote Troubleshooting Tools
A patching tool that also provides troubleshooting tools will aid your IT support team while they resolve issues on an end user's device. The tool may include features such as starting or stopping services on the device, a file browsing tool, and a remote control tool. You may wish to grant access to a selected group of console users while denying access to other console users.
© Syxsense | All Rights Reserved | Page 12 of 17

Can you remote control a device? Is remote control limited to only certain device types or browsers? Do you need permission required for all controls? Does the system support multiple monitors? Is the remote control solution third-party or part of the tool? Do you see the actual end-user screen or are you seeing an RDP-type connection? How are UAC prompts handled? Can you remote control devices outside the network or do they need VPN? Can you remote control a device inside the network while you are outside? Do you need a remote file browser? Can you view the remote event viewer logs? Can you view a remote devices processes and services? Can you run PowerShell scripts on remote devices? Can you monitor endpoints and servers and create alerts?
Software Distribution Support
Along with patching operating systems and third-party applications, most IT and patch management systems can deploy applications to endpoints. This is typically done by creating "MSI" software packages that contain not only the application, but instructions on how to install the application. You must understand how the packages will be downloaded to each target endpoint as deploying Microsoft Office could create many gigabytes of traffic per device. You also need to know how any software prerequisites are handled. For example, can you target endpoints based on the version of .NET? Can prerequisites be installed first and, when complete, install the main application?
© Syxsense | All Rights Reserved | Page 13 of 17

Can you push out software packages? Can you deploy Office 365? Can you stop a deployment mid-task? Can you deploy customized scripts, including PowerShell and Batch, for complex OS administration? Can you zip/compress your software for speed and bandwidth efficiency? How does software deployment deal with multi-file deployments? It is possible to have a pre- and post-software deployment message displayed to the logged-on user (with user-selectable options)? Can you pre-stage an installation and then execute at a specific date/time?
Management Automation
Management Automation is the process of automating everything from mundane everyday tasks to complex workflows.
A simple example might be -- the day after Patch Tuesday, deploy critical patches to all endpoints, or when patching production servers, server owners must approve the patch cycle and reboot before patches being deployed. More complex examples might be that before patching a virtual host server, guest virtual machines must be shut down and then restarted after the host has been rebooted. When a laptop returns to the corporate network, the device must be scanned and patched before accessing network resources.
These types of tasks can be prone to human error and are typically not a good use of skilled IT Staff time. Advanced patch management tools should have an integrated automation and rules engine allowing this type of automation.
© Syxsense | All Rights Reserved | Page 14 of 17

What triggers automations? · Maintenance Windows · Network Changes · Security Group Changes · Time and Date
Can you require one or more approvals as part of an automation? · Does it have diskspace?
Can automations be Logic-based? · Is the device a server? · Is the device a Mac?
Does the solution provide or publish pre-built automations?
Visual Workflow Designer
Visual Management allows IT administrators to build and manage complex workflows within a simple drag-and-drop interface. This should also eliminate much of the need for scripting knowledge.
Is scripting knowledge required?
Can you see where endpoints are in the automation flow in real time?

EXPERIENCE THE POWER OF SYXSENSE
Syxsense brings together endpoint management and security for greater efficiency and collaboration between IT management and security teams. Our powerful threat protection
gets you in front of any malicious cyberattack with the power of predictive technology. START YOUR FREE TRIAL
© Syxsense Inc. | All Rights Reserved | Page 2 of 5

ABOUT SYXSENSE
Syxsense is the leading provider of innovative, intuitive technology that sees and knows everything about every endpoint, in every location, everywhere inside and outside the network, as well as in the cloud. It combines the power of artificial intelligence with industry expertise to manage and secure endpoints by stopping threats before they occur and neutralizing threats when they happen.
The Syxsense Endpoint Security Cloud always-on technology performs in real-time so businesses can operate free of disruption from security breaches that cripple productivity and expose them to financial risk and reputational harm.
For more information about Syxsense, visit syxsense.com.

www.syxsense.com

info@syxsense.com

(949) 270-1903

