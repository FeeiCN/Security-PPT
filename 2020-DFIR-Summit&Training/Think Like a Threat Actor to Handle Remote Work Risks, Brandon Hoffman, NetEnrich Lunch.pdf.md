Think Like a Threat Actor to Handle Remote Risks
Brandon Hoffman / 16 July 2020

©2020 Netenrich, Inc. All rights reserved.

#DFIRSummit @NetEnrich

Think Like a Threat Actor to Handle Remote Work Risks

· Adversary Opportunity · Remote Work and Attack Surface · Case Study: Customer 1
· Exposing the portal · Oops · Next steps
· Case Study: Customer 2
· Blogging · Service extension · Service abuse
· Wrap
©2020 Netenrich, Inc. All rights reserved.

#DFIRSummit @NetEnrich 2

Adversary Opportunity
· It is cybercrime not APT that is knocking on your door......again and again

*source: 2020 Verizon DBIR
· While they are skilled at hacking (mostly stealing credentials lately), errors remain a large part of the opportunity

©2020 Netenrich, Inc. All rights reserved.

#DFIRSummit @NetEnrich 3

Opportunity By Error
· Avoiding basic errors and misconfigurations are the foundations of cyber security, and they create a ton of opportunity for adversaries. ^With the tools we have that problem was solved years (decades) ago^. Right?

©2020 Netenrich, Inc. All rights reserved.

*source: 2020 Verizon DBIR

#DFIRSummit @NetEnrich

4

Remote Work Growth
· Not just a recent trend

· But yes...recent events sure did expedite things (this is only until April)

*source: flexjobs.com
©2020 Netenrich, Inc. All rights reserved.

*source: Gallup Panels
#DFIRSummit @NetEnrich 5

Remote Work = Increased Attack Surface
Increased access to secure resources
Services being deployed rapidly (minimal security)

©2020 Netenrich, Inc. All rights reserved.

Remote IT needs access to sensitive tools/systems
Opening/leveraging remote management tools generally reserved for corp network access
#DFIRSummit @NetEnrich 6

Use Case 1: Controlled Resource Moved
· Background
· A company that provides services to their customers was forced into a remote work situation.
· A core tool used to service customers was, according to security architecture, completely contained behind the firewall.
· Due to remote work, this tool had to be placed in the DMZ so that the remote workforce could continue to provide the customer services.
· From an adversary perspective, some new opportunities for basic attacks were presented

©2020 Netenrich, Inc. All rights reserved.

#DFIRSummit @NetEnrich 7

Use Case 1: Findings ­ Credentials Leaked (GitHub)
· API Credentials embedded in code found in GitHub repos lead to potential customer data exfil.

©2020 Netenrich, Inc. All rights reserved.

#DFIRSummit @NetEnrich 8

Use Case 1: Findings ­ SQLi in API
· A SQLi vulnerability in the API led to full database access

©2020 Netenrich, Inc. All rights reserved.

#DFIRSummit @NetEnrich 9

Use Case 1: Findings - RDP
· RDP services exposed to the internet provide easy brute force or credential re-use access to resources

©2020 Netenrich, Inc. All rights reserved.

#DFIRSummit @NetEnrich 10

Use Case 1: Lessons
· All of these were foundational security mistakes, these mistakes are generally the genesis of an incident. Knowing attack surface in advance can expedite the investigation, or ideally avoid one.
· These mistakes happen frequently but without automation it is not possible to stay above board.
· Finding the issues is part of the battle but having remediation output or guidance is key to resolution. Knowing the detailed steps to support DFIR without chasing it down massively advances the process.

©2020 Netenrich, Inc. All rights reserved.

#DFIRSummit @NetEnrich 11

Use Case 1: Resolution Guidance Examples

©2020 Netenrich, Inc. All rights reserved.

12
#DFIRSummit @NetEnrich

Use Case 2: Threat intelligence + Attack Surface
· Background
· A product company issued a security advisory regarding default administrative credentials to a public facing gateway
· This security advisory went out over the wire essentially becoming OSINT · Other administrative ports were opened recently due to IT staff working remotely
· Outside looking in it was exceedingly simple to identify ports generally reserved for management/admin activity were accessible
· OSINT and OSINT tools can and are used by the adversaries!

©2020 Netenrich, Inc. All rights reserved.

#DFIRSummit @NetEnrich 13

Use Case 2: Findings ­ Curated Threat Intel

©2020 Netenrich, Inc. All rights reserved.

#DFIRSummit @NetEnrich 14

Use Case 2: Findings ­ Sensitive Service Exposure

©2020 Netenrich, Inc. All rights reserved.

#DFIRSummit @NetEnrich 15

Use Case 2: Findings ­ Leveraged Creds
· Credentials leveraged to gain root access and see full command history with authentication details and ability to execute arbitrary code

©2020 Netenrich, Inc. All rights reserved.

#DFIRSummit @NetEnrich 16

Use Case 2: Resolution Guidance Example

©2020 Netenrich, Inc. All rights reserved.

#DFIRSummit @NetEnrich 17

Supporting DFIR

OSINT

Having access to ondemand curated news and trends helps prioritize and focus incident prioritization

Technical details such as triggers, rules, examples of
sandboxing eases the DF/IR process

Detailed TI

©2020 Netenrich, Inc. All rights reserved.

Attack Surface

External attack surface is the genesis of many if not all attacks. Continuous automated assessment makes incident resolution easier and ideally avoidable
#DFIRSummit @NetEnrich 18

Wrap Up and Takeaways

As the attack surface continues to grow, change, and evolve there are several key considerations:
1. Understanding the attack surface in real time and on a continuous basis is a foundational security requirement. Adversaries look outside in, we should as well.

2. The output from these tools paired with contextualized or personalized threat intelligence data can provide powerful focus and prioritizations in a perpetually overloaded work queue.

3. Having the people with chops to provide resolution is critical and if the people don't exist internally, getting resolution guidance from experts can make the exceedingly difficult into a do-able task.

©2020 Netenrich, Inc. All rights reserved.

#DFIRSummit @NetEnrich 19

QA & Thank You!

Questions?

©2020 Netenrich, Inc. All rights reserved.

Thank You!
Brandon Hoffman, CISO Netenrich www.netenrich.com
@BrandonSHoffman
Discord channels: #brandon-hoffman
#netenrich

#DFIRSummit @NetEnrich 20

