#RSAC
SESSION ID: HUM-M03
Stop Chasing Insider Threats, Start Managing Insider Risk
Randy Trzeciak
Technical Director, Security Automation CERT Division, Software Engineering Institute, Carnegie Mellon University rft@sei.cmu.edu

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented.
Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
Copyright 2021 Carnegie Mellon University. This material is based upon work funded and supported by the Department of Defense under Contract No. FA8702-15-D-0002 with Carnegie Mellon University for the operation of the Software Engineering Institute, a federally funded research and development center. References herein to any specific commercial product, process, or service by trade name, trademark, manufacturer, or otherwise, does not necessarily constitute or imply its endorsement, recommendation, or favoring by Carnegie Mellon University or its Software Engineering Institute. NO WARRANTY. THIS CARNEGIE MELLON UNIVERSITY AND SOFTWARE ENGINEERING INSTITUTE MATERIAL IS FURNISHED ON AN "AS-IS" BASIS. CARNEGIE MELLON UNIVERSITY MAKES NO WARRANTIES OF ANY KIND, EITHER EXPRESSED OR IMPLIED, AS TO ANY MATTER INCLUDING, BUT NOT LIMITED TO, WARRANTY OF FITNESS FOR PURPOSE OR MERCHANTABILITY, EXCLUSIVITY, OR RESULTS OBTAINED FROM USE OF THE MATERIAL. CARNEGIE MELLON UNIVERSITY DOES NOT MAKE ANY WARRANTY OF ANY KIND WITH RESPECT TO FREEDOM FROM PATENT, TRADEMARK, OR COPYRIGHT INFRINGEMENT. [DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution. This material may be reproduced in its entirety, without modification, and freely distributed in written or electronic form without requesting formal permission. Permission is required for any other use. Requests for permission should be directed to the Software Engineering Institute at permission@sei.cmu.edu. Carnegie Mellon® and CERT® are registered in the U.S. Patent and Trademark Office by Carnegie Mellon University. DM21-1083
2

#RSAC
Presentation Objectives
Identify the state of insider risk/threat mitigation today Identify components of a holistic insider risk management program Identify how (and why) to ground the insider threat problem and solutions in the principles of enterprise and cyber risk management
3

#RSAC
State of Insider Threat Mitigation

59% of organizations prioritize external threats over internal ones

59% of incidents in the last 12 months caused by insiders

58% do not have a dedicated insider threat team

39% of organizations lack the necessary budget; 38% lack internal expertise; 29% don't see insiders as a "substantial threat"

70% of organizations don't have an insider risk management

strategy

Source: December 2021 Forrester, commissioned by Imperva; Insider Threats Drive Data Protection Improvement, Threat Detection, analytics,

And Staffing Lead Investment Priorities; https://www.imperva.com/resources/resource-library/white-papers/forrester-insider-threats-drive-

data-protection-improvements-full-report/

4

#RSAC
Have These Ever Happened To You?
Having trouble clearly stating the scope of your organization's insider threat program? Struggling with fully capturing the value and effectiveness of your organization's insider threat program? Lacking organization-wide consensus regarding your organization's security posture against insider threats? Having difficulty providing actionable intelligence to your insider threat program stakeholders?
5

#RSAC
These are all signs that your organization's insider threat program may need a big change.

#RSAC
Insider Risk Management Principles
7

#RSAC
Operational Resilience
Operational resilience: The emergent property of an organization that can continue to carry out its mission in the presence of operational stress and disruption that does not exceed its limit. [CERT-RMM]
Stress and disruption come from risk
Operational resilience emerges from effective risk management

Risk Terminology

Risk ­ the likelihood and impact
associated with a threat occurring

Threat ­ the potential for a threat actor to exploit a vulnerability, given some motive

Vulnerability ­ an exposure, flaw, or weakness that could
be exploited

Threat Actor ­ an agent with the
potential to exploit a vulnerability

Motive ­ a reason a threat actor would exploit a vulnerability

Definitions adapted from the CERT® Resilience Management Model

#RSAC

#RSAC
Managing Risks
Risk management ­ The continuous process of identifying, analyzing, and addressing risks to organizational assets that could adversely affect the operation and delivery of services. [CERT-RMM]
Risk management is an enterprise-wide activity that involves:
­ Identifying mission-critical assets ­ Identifying threats to assets ­ Assessing impact and likelihood of threats occurring ­ Creating and implementing plans for reducing risks to acceptable levels

#RSAC
The Goal for an Insider Threat Program...
Is to reduce insider risks to critical assets to acceptable levels
https://insights.sei.cmu.edu/insider-threat/2020/01/maturing-your-insider-threat-program-into-an-insider-risk-management-program.html

#RSAC
CERT InTP Key Components ­ It Starts With Risk Management

#RSAC
Why Insider Risk Management?
Ensures insider risks are managed consistently with other types of risk
Allows the insider threat program to leverage existing resources
­ Avoids duplication of effort ­ Ensures the insider threat program is working
with the best available information
Enables precise definition of InTP scope and quantifiable goals

#RSAC
What If No Risk Management Program Exists?
A risk management-based approach is still recommended as the basis for the InTP.
­ The core activities of risk management are vital to the success of an InTP.
Two options to consider:
­ The InTP can serve as the foundation for a broader enterprise risk management program.
­ An enterprise risk management program can be developed in parallel with the InTP.

Critical Asset Identification

#RSAC
Ask yourself:
­ What products or services do we provide?
­ What do we do in order to provide these services or products?
­ What assets do we use when performing these things?
­ What are the security requirements of these assets?
­ What is the value of these assets?

#RSAC
Insider Threats to Critical Assets

Individuals

Organization's Assets

who have or had authorized access to

use that access

Current or Former

People

Full-Time Employees

Part-Time Employees

Information

Temporary Employees Contractors
Trusted Business Partners

Technology Facilities

Intentionally or Unintentionally

Negatively Affect the Organization

to act in a way that could

Fraud Theft of Intellectual Property
Cyber Sabotage

Harm to Organization's Employees
Degradation to CIA of Information or Information Systems

Espionage Workplace Violence

Disruption of Organization's Ability to Meet its Mission

Social Engineering
Accidental Disclosure Accidental Loss or Disposal of Equipment
or Documents

Damage to Organization's Reputation Harm to Organization's Customers

#RSAC
Holistic Insider Risk Management

#RSAC
What Insider Threats Are Organizations Facing?
https://www.cylab.cmu.edu/_files/documents/irm-survey-results-20210331.7.pdf 18

#RSAC
True Story: IT System Sabotage
911 emergency services disrupted for 4 major cities
Disgruntled former employee arrested and convicted for this deliberate act of sabotage.
19

#RSAC
A Balancing Act
20

#RSAC
CERT Resilience Management Model (RMM)

https://resources.sei.cmu.edu/library/asset-view.cfm?assetid=508084

21

#RSAC
Where Organizations Traditionally Focus Insider Threat Mitigation Efforts

https://resources.sei.cmu.edu/library/asset-view.cfm?assetid=508084

22

#RSAC
True Story: Theft of Intellectual Property
Research scientist downloads 38,000 documents containing his company's trade secrets before going to work for a competitor...
Information was valued at $400 Million.
23

#RSAC
Where Insider Risk Management Programs Need to Expand

https://resources.sei.cmu.edu/library/asset-view.cfm?assetid=508084

24

#RSAC
A Holistic Insider Risk Management Program
25

#RSAC
True Story: Fraud
An undercover agent who claims to be on the "No Fly list" buys a fake drivers license from a ring of DMV employees...
The identity theft ring consisted of 7 employees who sold more than 200 fake licenses for more than $1 Million.
26

#RSAC
Goal for an Insider Risk Management Program
To reduce insider risks to critical assets to acceptable levels Struggling with formalizing and defining your program? Answer these questions:
­ What are "acceptable levels"?
How are you measuring risk?
­ What are your critical assets?
Who gets to decide, and do they change?
27

#RSAC
Determining Likelihood

Managing Risks ­ 4 Choices
Accept
Acknowledge that the risk exists, but apply no safeguard (Exposure value is within tolerance)

Mitigate
Change the asset's risk exposure (apply safeguard)

Risk

Transfer
Shift responsibility for the risk to a third party (ISP, MSSP, Insurance, etc.)
Avoid
Eliminate the asset's exposure to risk, or eliminate the asset altogether

#RSAC

#RSAC
Insider Risk Appetite

#RSAC
What Are "Acceptable Levels"? Establishing a Risk Appetite
Impact

https://resources.sei.cmu.edu/asset_files/TechnicalNote/2020_004_001_644641.pdf

31

#RSAC
What Are "Acceptable Levels"? Establishing a Risk Appetite
Likelihood

https://resources.sei.cmu.edu/asset_files/TechnicalNote/2020_004_001_644641.pdf

32

#RSAC
What Are "Acceptable Levels"? Establishing a Risk Appetite

Impact

Likelihood

https://resources.sei.cmu.edu/asset_files/TechnicalNote/2020_004_001_644641.pdf

33

#RSAC
Apply What You Have Learned Today
Next week you should:
­ Identify how risk appetites are described within your organization
In the first three months following this presentation you should:
­ Establish a method for measuring current security posture against insider risks to critical assets that aligns with risk appetite statements
Within six months you should:
­ Describe the performance of your insider management program in the context of your newly-established risk tolerances
34

#RSAC
For More Information
CERT Common Sense Guide to Managing Insider Risk Insider Risk Management Program Evaluation Assessment Instrument Insider Risk Management Program Building: Results from a Survey of Practitioners Advancing Risk Management Capability Using the OCTAVE FORTE Process cert.org/insider-threat
35

