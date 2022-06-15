SESSION ID: RMG1-R09
Assessor versus Assessed Debates on PCI DSS topics

Todd Aument
Head of Data Security Governance Square

Jacob Ansari
Senior Manager Schellman & Company, LLC

#RSAC

#RSAC
Who are these guys?
· Shared history of performing assessments since the beginning days of PCI DSS
· Now on opposite sides of the table
­ Todd runs GRC for fast-moving fintech firm ­ Jacob still conducts and manages assessments
· Want to share our collective insights and hard-won experience with you
2

#RSAC
Rough Agenda
· Scope and applicability: the oldest argument · Identity and access management · Dealing with vulnerabilities
3

#RSAC
Few caveats
· We know we won't coincidentally land on your exact scenario, configuration, or scope configuration
· We're party to some of the goods on upcoming draft of PCI DSS 4.0 standard and also the relevant NDA
· We speak for ourselves and not our employers, past or present, nor PCI SSC, card brands, the White House, etc.
4

#RSAC
Here's what we can do
· Give you some sharpened questions to ask your teams and your assessors
· Point out some pitfalls we've encountered along the way of our journeys
· Help you break the ice on contentious topics
5

#RSAC
Scope and applicability

#RSAC
Want to discuss politics, religion, or scoping?
7

#RSAC
Maybe you've seen this diagram
"The PCI DSS Example Network Diagram has been extracted from the PCI SSC Information Supplement · Guidance for PCI DSS Scoping and Network Segmentation · May 2017 and appear courtesy of PCI Security Standards Council, LLC. © 2006-2020 PCI Security Standards Council, LLC. All Rights Reserved."
8

#RSAC
Scope isn't a naughty word
· Consider the applicability of requirements to an in-scope system · In scope means you consider it and assess it, not that you apply
all requirements to it
­ Maybe some lesser set of requirements apply
9

#RSAC
Identity and Access Management

#RSAC
Identity and access management

#RSAC
Are you somewhere feeling lonely?
NIST 800-63B: "Do not require that memorized secrets be changed arbitrarily (e.g., periodically) unless there is a user request or evidence of authenticator compromise." PCI DSS v3.2.1: "Change user passwords/passphrases at least once every 90 days." DISCUSS.
12

#RSAC
Service accounts and friends
· Current version of DSS doesn't give you much to work with · Categorize your accounts:
­ Service ­ Default ­ Emergency access · Control access to credentials: ­ Password vault ­ Alert on use ­ Change password values after use
13

#RSAC

#RSAC
Vulnerability Management

#RSAC
16

#RSAC
How I learned to stop worrying and love scanning
· You may always have vulnerabilities show up in your scan results · How long does a vulnerability stick around in your organization? · More priority for applying fixes to software components
17

#RSAC
Variations on the theme
· Lots of pentest-like options available · Consider the sort of testing that gives you results with the clearest
picture of what an attacker could do (even if they're the most damning) · What meets Requirement 11.3? What achieves other things?
18

#RSAC
Sounds like marriage counseling
· Plan your strategic conversations now
­ Figure out your ongoing communication
· Changes to environment and scope implications
­ Start discussing with the other party now
· Sustainability and Maturity
­ How do you demonstrate your mature understanding of risk?
19

