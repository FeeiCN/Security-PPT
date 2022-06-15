The Dark Side of EDR
7 Considerations CISOs With Small Security Teams Must Address When Evaluating
an EDR

Why EDR?
Companies today know that compromise is inevitable. An endpoint protection platform (EPP), such as an AV or NGAV, is the first step for stopping threats at the door. But given the sophistication of threats today, EPPs do not and cannot prevent all threats from infecting the endpoint.
This is where Endpoint Detection and Response (EDR) fits in. The goal of EDR, as its name implies, is to reduce the threat's dwell time ­ detect the threat once it's inside the corporate network and remediate it as fast as possible. Combining EPP and EDR provides several benefits:
Prevention
An efficient prevention tool against zero day malware, exploits, scripts and Macros.
Detection
Commodity hacking tools such as Mimikatz, Powersploit and others generate memory patterns that are easily detectable
Investigation
The endpoint agent continuously monitors and records logon activities, internal and external communications and process executions, providing rich investigation context.
Operation
Easily replace AV as all AV functionalities are a small subset from the EPP/ EDR offering.

According to Gartner, an EDR is defined as having four main capabilities:
 Detect endpoint threats  Contain the threat at the endpoint  Having some investigative
capabilities  The ability to remediate on
the endpoint
"By the end of 2023, more than 50% of enterprises will have replaced older antivirus products with combined EPP and EDR solutions that supplement prevention with detection and response capabilities."
Gartner Market Guide for Endpoint Detection and Response Solutions (Dec. 2019, updated Jan. 2020).

While EDR has a lot of promise, it also bears several shortcomings. As a CISO you need to be aware of the gaps prior to implementing an EDR solution so you can best prepare how to close the gaps. It's important to understand that each company is unique and the EDR that suits one company's environment might not necessarily be the best one for another company's environment.
This is even truer for companies that have small security teams due to the greater variety of security tools already installed and limited resources to address issues with operating the EDR solution.

The 31 Flavors
of EDR
An EDR solution is generally one of the most important platforms in your security team's toolbox. However, it is not an install and forget technology. Rather, it requires an understanding of its output, the assignment of operational and response responsibilities as well as maintenance overhead, including the orchestration with other security and IT tools. Operating the EDR requires significant internal and crossteam communication. Therefore, it is imperative to understand and define the EDR process prior to implementation.

Before you proceed to evaluate the various EDR solutions, you need to map out your company's objective parameters. These are your givens, and in the consideration stages of the EDR purchase you must factor these in:
1 Company risk appetite. Take into account the sensitivity of data, reputation, business disruption, etc.
2 Security team size and capacity. Not just now, but in the next 6 months
3 Security team skills and availability. After all, threat actors don't sleep
4 Urgency. Do you have the privilege to evaluate a few solutions or do you need the platform ASAP?
5 Budget. How much can you allocate to the EDR platform and on what expense.
Don't be immediately carried away with a vendor's offering. Think carefully the ramifications for going with a particular brand. The good news is that there are many EDR vendors in the market so you can certainly find that one that suits you.

Consideration #1
What does "detect"
really mean?
To be clear, detection means alerts. EDRs are notorious for false positives so at the start, expect to sift through numerous alerts. Many companies overcome this by enhancing EDR with more data feeds and adding technologies to see beyond the endpoint agent. This can lead to a reduction in false positives since correlating alerts will help determine the validity of the alert.
Second, you will get multiple alerts for the same incident. Consider the case of lateral movement across the network. Each device in the network will send out at least one alert, depending on the behavior of the malware. Furthermore, in some cases a low severity alert might actually be indicative of an upcoming high severity alert which you shouldn't miss.

Undoubtedly, you will need a skilled analyst to chain the alerts together
to see the full picture.
With a less skilled staff, you can also offload the analysis to a managed service provider or augment with Managed Detection and Response (MDR) services provided by the EDR vendor.

Consideration #2
How efficient is the detection?
EDR/EPP cannot reliably distinguish between legitimate use of admin tools (e.g. PSexec.exe, Powershell, WMI, etc.) and their malicious abuse by attackers. Additionally, EDR/EPP are blind to any malicious activity that doesn't entail a distinct process behavior change including a multitude of commonly used attack vectors (ARP Spoofing, DNS Responder, tunneling attack, etc.).

Many EDR vendors differ in their detection methods. Ask the vendor what built-in methods are used to help with detection. For instance, honeypots, forensic data, and threat intelligence feeds.
Also consider investing in additional technology to fill in the gaps. For example, network analysis tools that determine whether traffic is indicative of malicious activity, and user behavior analytics to detect any abnormal user behavior.
Plug in your givens such as company risk appetite to see how many gaps need to be filled, as well as budget to decide whether you can afford stacking solutions.

Consideration #3
What does "respond" really mean?
The variety in response offerings is astonishing. Some EDR vendors simply provide a recommendation to, say, manually isolate an endpoint and define that as remediation. Conversely, other vendors will provide the automated removal of the same threat across the environment. Response speed is the name of the game in order to maintain business continuity. Leverage automation to reduce manual effort and increase speed.

There are generally 5 levels of automation provided by EDR vendors
Recall your "givens" and see what kind of response best suits your needs:
Basic automated remediation on a single endpoint
Basic automated remediation on multiple endpoints
Extended automated remediation across environment
Automated investigation with extended remediation across environment
Cynet's detailed guide, "The Essential Guide to Response Automation", delves into these levels and can help you choose which level of automation is right for your environment.
GET IT

Consideration #4
What is the
management
overhead?
As mentioned, EDR is a process so management overhead exists across all stages - from deployment and responding to threats to ongoing maintenance.
For example, in the deployment overhead calculate the expected human resources and time to deploy. Factor in the number of endpoints in your environment, whether the vendor supports all OSes, clashes with current (and even future) tools. As with all considerations, see also whether you have the staff to support a complex stacking deployment.

As a rule of thumb, do this calculation also for a PoC to see if it's even worthwhile to evaluate a vendor if the deployment seems too complex to handle - even in this early limited stage. As a general rule, a PoC should be easy and quick.
When responding to threats, consider ease of use of the system since this will become one of the main tools your analyst uses. Does the important data surface immediately? Can you reduce context analysis and panel switching?
In terms of maintenance, you should try to automate as many workflows as you can. Consider how much workflow automation is already provided and how you will augment those. Can you do that through internal configuration or do you need to create external scripts?
Once again, to understand whether these questions need to become requirements, plug in your unique company parameters that you had set earlier. For instance, many companies with small security teams recognize the dire need to remove as much repetitive or grinding overhead from their analysts as possible.
Lastly, we recommend avoiding 3-year agreements simply because of management "investment." This is a notorious bad habit in the security industry. However, you might eventually come to realize that you should cut your losses mid-way into the contract since the money and time spent over 3 years might be higher, and you'll be replacing the technology after the 3 year termination regardless.

Consideration #5
What reporting is provided
All EDR vendors provide reporting. Some have bells and whistles for every imaginable iteration. You may determine that all you need is something basic. Don't be carried away with a flashy vendor offering, but think about what you really need and map those needs with the vendor's offerings.

As a start, consider your stakeholders. Are these security analysts, compliance team members, C-level and board members, cyber insurers? Maybe it's even the public.
Then consider the report attributes that you will require. This will, of course, be a derivative of the report stakeholders. For each stakeholder, map out what type of data is required, how detailed you need the report to be and even the frequency of the report.
Last, but not least, you might want to have the capability to generate ad-hoc reports such as a threat analysis in case a threat is found. If you're short-staffed, you would want to have your EDR provider provide this type of report on demand. And if you're budget is stretched, you would want your EDR vendor to provide these types of analyses free of charge. Some EDR providers even provide you with ongoing threat landscape reports to help you keep up with current threats and educate other stakeholders.

Consideration #6
What complementing technologies are still required?
Going back to detection, you need to determine what complementing detection solutions are required per your risk level. In terms of response, ask yourself whether you need more automated remediation than what is offered to ensure that the offering won't shatter your givens.

Beyond prevention and detection there are other technologies you might want to consider adding to the EDR. You'll need to decide:

1
How do you best reduce the management overhead

2
What security platforms you'd like the EDR to integrate with

3
What non-security platforms, such as ticketing and messaging platforms, you'd like the EDR to integrate with

Don't only evaluate the EDR vendors' products, but also their services.
Go back to your company givens and consider how much you can take on in-house. If you decide to outsource, determine what model best suits your team. Do you want the EDR to be fully managed or co-managed? In the co-managed model for example, you may want your team to have access to a high-level view whenever they want so you don't have to continuously go to the provider for that data while the MDR service does the nitty-gritty overhaul ­ detection, response and maintenance.

Consideration #7
What is the cost?

1
Consider how you can lower direct costs.
Normalize the offers so you can properly compare. The easiest comparison measure is the cost per endpoint.

2
See how you can stretch your dollar.
Look at the list from the previous consideration. See if your EDR provider has any of those complementing technologies or services built-in. Before moving ahead with the offering, understand what "built-in" really means. Ensure you're not reducing costs in the short-term, such as receiving an additional technology, at the expense of increasing costs in the long run, by having to maintain that additional technology.
Think also how you can "move budget" around for the EDR provider offering. For instance, some EDR providers also offer application whitelisting for which you might already have a separate technology that you can discontinue.

3
Consider all the intangible costs.
These costs include items such as human resources required, avoidance of team burnout, maintenance and overhead. Some of these costs will be direct and some are indirect intangible costs.

Conclusion
The era of a standalone EDR solution for small security teams is coming to a close. The number and types of alerts that the platform produces which in turn requires an augmentation of further technologies and skills to analyze, operate, enhance and act upon ensues that EDRs simply aren't built for resourceconstrained teams. EDRs addresses detection and response needs, but it's not without some serious consideration in "the dark side of EDR".

Cynet. Eliminating the Dark Side of EDR with the world's first Autonomous XDR platform
Cynet saves companies from EDR's "dark side" with the world's first Autonomous XDR platform. The platform provides small security teams with the technology, service and automation needs to accurately and effectively detect and respond to threats as quickly as possible. Cynet XDR natively unifies the prevention and detection capabilities of EDR, NGAV, NDR, UBA Rules and Deception technologies with an incident engine that fully automates investigation and remediation actions, backed by a 24/7 world-class MDR service. End to end, fully automated breach protection is now within reach of any organizations, regardless of security team size and skill level.
LEARN MORE

THPAIRRDTY SAAPAPSL/ICCALTOIOUDN USER
NETWORK ENDPOINT

