Why Air Gap Your App?
Modern Air Gap Use Cases in Enterprise Software

1.

Introduction

2.

Why Are Companies Doing On-

Prem Air Gap Installations Now?

9.

Kubos Leverages Replicated To

Provide Air Gap Installs to Their

Most Security-Conscious

Customers

5.

Air Gap On-Prem Use Cases for

the Security-Conscious Enterprise

Software ate the world. Then SaaS started eating software. Then, the cloud started enveloping SaaS. Now, even one flavor of cloud is no longer good enough for most highly distributed software applications. To be agile and responsive, you must orchestrate the delivery of applications across some kind of hybrid public or private cloud, which could be provisioned from service providers, called via APIs from a marketplace, or deployed into ephemeral cloud-native microservices. The push for off-premises migration of software has never been stronger -- by some architectural estimations, it's taken for granted that most applications should move to the cloud in the next couple of years if they are not there already. But why are some companies hitting that big red disconnect button today and doing on-prem air gap software installs? In this whitepaper, we'll cover what's driving modern on-prem air gap installations, air gap use cases for the security-conscious enterprise, and finally, take a close look at how air gap installs are expanding the total addressable market for SaaS companies.
1

Why Are Companies Doing On-Prem Air Gap Installations Now?
The Origins of Air Gapping
If you are new to the concept of air gapping, that's OK. Old hacks like myself with some history of supplying software for banks and government agencies have encountered the need for air gapping -- basically, installing onto a system that is not connected to the Internet at all -- nor any network that could offer any port for security breaches to occur. Basically, air gapping is the purest form of on-premises software delivery, in that absolutely everything needed for that software to run must be packaged for local installation and ready to run disconnected from any network. No calls out to external authentication providers. No remote license keys. No checking for version updates and patches. Sneakernet installation, we called it, meaning someone would need to walk in with a disk or drive and manually execute the install onto the target air gapped system. Once on-site, ideally, this would have been a double-click, plug-and-play event -- but often, the configuration, install, and patching process for one of these systems was a Sisyphean effort. Vendor product experts and customer sysadmins would work together to run batch scripts, tweak manifest settings and validate the system, sometimes through terminal consoles, once it went live. Mess one step up, or realize the need for a later product update, and both sides would be looking at another extended and costly consulting visit. It's not hard to tell why air gapping was reserved for only the most mission-critically remote use cases. Many software vendors simply chose to opt-out of this side of the market, waiving their right to work in such secure demesnes in favor of less troublesome Internetfriendly SaaS business models.
2

On-Prem Isn't Making a Comeback ­ It Never Went Away
If you were to believe pundits who made SaaS and cloud computing predictions ten years ago, we'd be operating everything-as-a-service by now. But for many kinds of secure work, SaaS isn't a viable option, and even connections to external services and APIs are undesirable. I was stunned to find out from a 2021 study on The State of On-Prem that customer demand for on-premises software is almost equally as high as for public and private cloud options -- and that more than one-third of customers surveyed wanted to procure air gap software. This flies in the face of expectations of the modern cloud-driven software market. Still, it hits home when you scratch the surface of providers that deliver effective enterprise solutions to regulated or sensitive IP scenarios.
Serious enterprise vendors will still have services teams or certified partners performing on-prem air gap delivery, as well as a support team that provides packaged installs and documentation for just such scenarios. If air gapping offers so much potential hassle, why would the practice become popular again lately?
3

What's Driving Modern On-Prem Air Gap Installation?
There are several good reasons why companies are reconsidering air gap installation.
Performance and latency concerns
If the company still has the inertia of systems that shouldn't be moved or tampered with in its data center, why not install new modules and software as close as possible to these critical systems? Better responsiveness is a welcome by-product of co-location, especially on the mainframe.
Compliance and data protection
Government regulations and industry policies for retaining sovereignty and local control over sensitive data continue to evolve, and with it, so do the penalties for non-compliance and SLA failures. Certifying an air gap installation is a great way to pass even the most demanding audit.
Increased cyberthreat
Millions of automated exploits and attacks are seeking out threat vectors for sabotage, theft, and data exfiltration at any given time. Ransomware is perhaps the worst of it, as the target of the attack is your data itself. Air gapping by nature offers almost zero threat surface (other than maybe an inside threat) and is also perfect for disaster recovery scenarios.
Containerization and Kubernetes
The widespread adoption of containers to replace VMs -- and Kubernetes (or K8s) as a common reference architecture for orchestrating their deployment -- isn't just the factory enabling ephemeral workload cloud-based applications. K8s also offers on-prem installs and updates a far more stable and repeatable complete environment definition. This is huge, so expect us to write more on this thread later.
Reduced cost/effort
Modern architectures with better modularization and portability, and new multi-prem installation solutions such as Replicated, bring down the TCO of rolling out and maintaining air gap software installations.
4

Air Gap Is Here To Stay
Given the well-known failures of many previous modernization efforts to maintain application and data integrity in the wild over the years, I wouldn't blame a company with critical software for staying the course with yesterday's on-prem install processes.
Still -- this ain't your grandma's on-prem software anymore. We are now seeing evidence that air gapping is not just a matter of isolating data and controlling software to meet regulatory requirements.
Air gapping is a unique form of on-prem software that can be pretty advantageous in realworld business scenarios, as we'll cover in our next section.
Air Gap On-Prem Use Cases for the Security-Conscious Enterprise
When I think of the most mission-critical on-premises secure installation scenario of all time, my mind immediately wanders to silos. Missile silos, to be exact.
If there ever was a reason to be absolutely 100-percent-sure a system was inaccessible to the outside world, and thus positively unhackable, it would be to prevent an unauthorized launch. Any software update that happens in that control room had better be handinstalled from a disk and checked by a high-security clearance individual.
Granted, most of us don't have to sweat the global consequences of a Wargames-style nuclear brinkmanship event if our business software isn't securely air gapped.
Still, it wouldn't hurt to take a page from the missile-command playbook in thinking about your organization's mission-critical environments to understand when on-prem air gap installations provide the best balance of risk avoidance and value for critical systems.
What are some of the most compelling use cases for on-prem air gap software installations?
On-prem prospects for software vendors
I hear rosy cloud-based growth projections from independent software vendors (ISVs) on a daily basis. Every one of them touts the impressive sales growth stats of their latest SaaS or cloud offerings in relation to their existing on-prem business.
5

You can't blame vendors for wanting to position themselves as `modern' for IT analysts and investors, touting that they are selling service-based software -- but for security, compliance, and control reasons, real-world businesses demand modern software delivered on-premises. Among many other surprising facts revealed in this 2021 State of On-Prem study was the fact that almost all ISVs -- 92% even -- are reporting increased sales of on-prem software to customers -- and at least half of them reported `strong growth' in sales!
For an ISV, securely compiling, packaging, and distributing runtime software on-premises -- and into an air gapped environment -- is rapidly becoming a requirement for many critical customer use cases. The side benefit? Effective air gapping also solves the complex problems of ensuring the software configuration was consistently performed, that IP is protected as needed, and usage is properly privileged at the point of distribution. Have you ever used software with a `remote update' feature that routinely checks for updates and licensing status -- only to cut off the session if for some reason the registration server is unavailable, or the network connection is down? That vendor is telling its customers that they don't trust their own installation packages, and topping it off prevents them from doing their work. Talk about the fastest route to customer abandonment! Fortunately, many leading commercial and open source vendors offer modern on-prem air gap installations that fit some unique customer form factors.
6

Mission control: installing in a new frontier
If you thought my missile command story was a hypothetical story, how about mission control for satellites?
Kubos is a fascinating vendor tightly focused on delivering a more responsive cloud-native ground control system (called Major Tom, if you get the Bowie reference) to allow operators to interface with satellites, control them, and gain insights into real-time telemetry data from space.
Some of their customer's ground control environments -- as you might expect with such expensive hardware on the line -- are entirely locked down. There are no open sockets for an install. While communication and control work happens via APIs and SaaS-style approaches, their control gateway software and updates must sometimes be remotely installed into an air gap environment.
Kubernetes, by nature, provides an excellent start to unlocking this exact problem as it can act as a reference architecture of containerized microservices. It's cloud-native, yes, but it doesn't need to run in a cloud. Bespoke customer installs can be tightly specified as code, configuring complete multi-tier operating environments that can be bundled and consistently delivered to customers as ready-to-deploy K8s packages.
More endpoints, more use cases
Wherever there is a need for secure data and secure operations, there's probably an identifiable need for some aspect of that environment to be air gapped.
· Government development teams, especially those working on military or intelligence technology, often prefer to have their team's work environments and software packaged for delivery into an on-prem air gap system cordoned off from the internet. This ensures only approved components can be used by high clearance developers and contractors, preventing software supply chain attacks.
· Pharma research teams conducting clinical trials can do their surveys and calculations on air gapped software, complying with HIPAA and PII statutes while preventing the leak of both patient data and proprietary research information.
· Financial software such as fraud detection algorithms and predictive stock trading tools are ideal for software air gapping to prevent any outside parties from attempting to gain an edge or `game' these high-value decision support tools.
7

What's To Come?
Just press play to start the install. It's time to shoot down the pundits who tell you everything will move from on-prem to cloud or SaaS models.
I predict a migration to securely contained modern on-premises computing environments for our most mission-critical applications, with Kubernetes as the enabler for this encapsulation.
The market for modern on-prem is bearing this reality out today, with a renewed focus on air gapped software installations where security and total compositional assurance are of the highest priority.

© 2021, Intellyx, LLC. Intellyx retains editorial control over this content. At the time of publishing,

Replicated is an Intellyx client. Kubos Case Study

8

Kubos Leverages Replicated To Provide Air Gap Installs to Their Most Security-Conscious Customers
Company Details
Industry Satellite Management
Kubos is bringing the software revolution to space. By providing a robust set of satellite management and data collection services, Kubos has set its sights on the great unknown by decoupling physical infrastructure from satellite operation. This architecture empowers their customers to focus more on managing spacecraft while benefiting from a reduced operational overhead. Their flagship product, Major Tom, is built on a robust ecosystem of tools and services that bring critical information and functionality to spacecraft operations. Major Tom connects to virtual satellites, flatsats, engineering models, and orbiting spacecraft all from a single dashboard, providing a universal platform for every aspect of satellite operations. Major Tom also seamlessly integrates with 3rd party ground services such as ground networks, mission analysis, and mission planning suites, analytics platforms, and other critical pieces of ground-based infrastructure.
The Problem
Kubos' mission is to bring modern software development and practices to the space industry by providing a robust set of API gateways and seamless integrations. Major Tom helps companies visualize, understand, and control data across their entire space and ground infrastructure through a cloud-native architecture and robust integrations with external applications and services. These standard cloud connections work fine for most of their customers. Still, when Kubos began to generate interest from military and government contracts around the globe, they soon realized that the requirements and policies in place to operate Major Tom under strict security protocols requiring on-premise/physical access wouldn't allow for data transmission through the cloud. As if communicating with satellites wasn't hard enough, Kubos now faced packaging their software for deployment into an air gapped environment -- a task that they had not previously undertaken.
9

As Tyler Browder, CEO and Co-Founder of Kubos, recalls, "We knew that shipping into air gap environments was going to be particularly hard, especially to military bases that we couldn't get to easily, even if we needed to." When posed with spending the internal resources necessary to build out air gap functionality, Kubos set out to look for a solution that would allow them to accommodate even the strictest of ground control environments.
"Without Replicated, we would have had to walk away from these contracts. We found a good way to open up our total addressable market with Replicated."
Tyler Browder Chief Executive Officer and Co-Founder
The Solution
Kubos' research led them to Replicated, a Kubernetes application delivery and management platform. Replicated provides commercial and open source tools to streamline the distribution and management of 3rd-party applications to complex enterprise environments -- even air gapped ones. "Replicated solved our problem immediately," said Paul Jungwirth, a software developer helping lead DevOps at Kubos. "Not only can we now provide an air gap solution for our customers, but Replicated keeps our on-prem offering easy and consistent with the rest of our product." Kubos is now free to ship their Major Tom software to customers in an air gapped environment with little additional overhead. Adding to that, Replicated allows Kubos to troubleshoot customer problems from across the world by providing a robust set of Day 2 support tools. As Paul puts it, "Replicated has really helped when it comes to any air gap customer problems. I can stand up a test instance, reproduce our customers' problems, and come up with solutions before getting on a call from across the globe."
10

"Replicated solved our problem immediately. Not only can we now provide an air gap solution for our customers, but Replicated keeps our on-prem offering easy and consistent with the rest of our product."
Paul Jungwirth DevOps Lead
The Future
When asked about how Kubos would have proceeded had they not found an air gap solution, Tyler puts it simply. "Without Replicated, we would have had to walk away from these contracts. We found a good way to open up our total addressable market with Replicated, and it allows us to target some unique opportunities in the future as less-spacefaring nations or areas with little internet connectivity begin to embrace spacecraft management." As Kubos grows, they can now ship Major Tom to any customer environment, even those with the strictest security needs. With their air gap deployment issues solved, Kubos can now get back to what's important ­ providing ground control teams with cutting-edge satellite communication technology. Paul concludes, "Nowadays, I wouldn't recommend that anyone set up their own cluster for air gap installs. Just use Replicated." To learn more about how Replicated can empower your enterprise software, please schedule a demo today.
11

www.replicated.com

