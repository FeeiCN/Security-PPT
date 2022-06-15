SESSION ID: CSV-W02
Whose Cloud Is It Anyway? Exploring Data Security, Ownership and Control

David Etue
VP, Business Development, Identity and Data Protection Gemalto @djetue

#RSAC

Cloud and Virtualization Are Changing the

#RSAC

Way IT is Managed and Consumed

Agile. Now. On demand. Simple. Secure?

#RSAC
Cloud Benefits Are Being Realized...

 80% of mature cloud adopters are seeing:1  Faster access to infrastructure  Greater Scalability  Faster Time to Market for Applications
 50% of cloud users report benefits including:1  Better application performance  Expanded geographic reach  Increased IT staff efficiency

1- RightScale State of the Cloud Report 2014

#RSAC
...But Cloud Benefits Are Driven by Sharing

And Security and Compliance Are Not the

#RSAC

Biggest Fans of Sharing...

#RSAC
Leading Inhibitors to Cloud Adoption
451 Research - Cloud Computing Wave 7

Security and Compliance Concerns

#RSAC

With Shared Clouds

Data Governance Lack of Visibility

· Can you track all of my data instances? Backups? Snapshots? · Am I aware of government requests/discovery? · Do you new when data is copied?

Data Compliance Lack of Data Control
Data Protection Risk of Breach and Data Loss

· Who is accessing my data? · Can I illustrate compliance with internal and external mandates? · Is there an audit trail of access to my data?
· Are all my data instances secure? · Can I assure only authorized access to my data? · Can I "pull the plug" on data that's at risk of exposure or who's
lifecycle has expired?

How Do You Maintain Ownership and Control Of Your Information In A Multi-Tenant Environment?

New Risks Driving

#RSAC

Cloud Security Challenges

 Increased Attack Surface  Privileged Users  Ability to Apply Security Controls  Control (or there lack of)

New Risk:

#RSAC

Increased Attack Surface

New Risk:

#RSAC

New Definition of Privilege

New Risk: Ability to Apply Security Controls #RSAC

App Sec

Security Controls Mapping and Sized by Budget Security Management & GRC
Identity/Entity Security
Data Security

CSA Cloud Model

Host

Network Infrastructure Security
Source: Control Quotient: Adaptive Strategies For Gracefully Losing Control (RSA US 2013) by Josh Corman and David Etue.

New Risk: Ability to Apply Security

#RSAC

Controls

Most organizations are

trying to deploy

"traditional" security

controls in cloud and

virtual

environments...but

were the controls even

effective then?

New Risk:

#RSAC

Control (or there lack of)

Salesforce - SaaS

The lower down the stack the cloud provider stops, the more security you are tactically responsible for implementing & managing yourself.

Google AppEngine - PaaS Amazon EC2 - IaaS

Source: Control Quotient: Adaptive Strategies For Gracefully Losing Control (RSA US 2013) by Josh Corman and David Etue. "Stack" by Chris Hoff -> CSA

#RSAC
And Not Just The Traditional "Bad Guys"

Government Discovery

Cloud Administrators

Adversaries

Sensitive Data in the Cloud

Auditors / Regulators

So, Whose Cloud Is It Anyway?

Model

Private Cloud

IaaS
in Hybrid / Community / Public Cloud

Whose Privilege Users?
Whose Infrastructure?
Whose VM / Instance?
Whose Application? Government Discovery Contact?

Customer Customer Customer Customer Customer

Provider Provider Customer Customer Provider

#RSAC
PaaS/SaaS
Provider Provider Provider Provider Provider

Geographical Considerations?
Cloud Provider Headquaters

#RSAC
Cloud Region Location

- US Court Decision with Serious Implications: IN THE MATTER OF A WARRANT TO SEARCH A CERTAIN EMAIL ACCOUNT CONTROLLED AND MAINTAINED BY MICROSOFT CORPORATION, 13 Mag. 2814
- A Sober Look at National Security Access to Data in the Cloud - A Hogan Lovells White Paper (covers US, EU, and EU member country legislation and case law)

The Cloud "Supply Chain"

Two developers and a cloud account = SaaS company. Two developers, a cloud
account and an Arduino board = IoT company. #security #cloud

#RSAC

 Many cloud providers, especially SaaS and PaaS built on top of other cloud providers
 AWS Case Studies: Backupify, Freshdesk, Loggly, Sumo Logic

Clouds on Clouds....

Customer

 MAY be discoverable in terms of service...
 Heroku: "Heroku's physical infrastructure is hosted and managed within Amazon's secure data centers and utilize the Amazon Web Service (AWS) technology."

PaaS / SaaS Provider

 May be more than one provider and more than one tier!

What is the trail created of your data--who and where?

17

Making it Your Cloud:

#RSAC

Key Enablers to Cloud Security

Encryption (and Key Management) Identity and Access Management with Strong Authentication Segmentation Privilege User Management Detection and Response Capabilities System Hardening Asset, Configuration, and Change Management

Encryption: Un-Sharing in a Shared

#RSAC

Environment

Clouds Love Crypto!!!*

#RSAC
*with good key management...

Cloud Encryption Models

#RSAC

Type of Encryption
Service Provider Encryption with Provider Managed Keys

Definition

Also Called:

Encryption performed by the cloud · Server Side Encryption service provider using encryption · SSE keys owned and managed by the cloud service provider

Service Provider Encryption with Customer Managed Keys

Encryption performed by the cloud · "Customer provided keys" service provider using encryption · SSE-CPK keys owned and managed by the customer

Customer Managed Encryption with Customer Managed Keys

Encryption performed by the customer using encryption keys owned and managed by the customer

· "Client side encryption" (for object storage and clientserver environments)

Remember: Encryption

SaaS applications should be adding value to your data ­ what impact

#RSAC

Data Can't Be Processed... does encryption have? #security

#RSAC

 Have to design encryption to enable data to be processed and accessed to support necessary business process

 An example: Cloud Encryption Gateways encrypt data before putting it in to SaaS applications
 Provided by a Number of Vendors (CipherCloud, Perspecsys, Skyhigh, Vaultive, etc.)
 Trade-off of security (encryption quality) and functionality...
 Architectural implications

 Easy to minimize impact for IaaS and Storage, harder for PaaS and SaaS

How Do You Apply Security Controls?

Security Controls Mapping and Sized by Budget
Security Management & GRC Identity/Entity Security

CSA Cloud Model

Data Security App Sec

Host

Network Infrastructure Security
Source: Control Quotient: Adaptive Strategies For Gracefully Losing Control (RSA US 2013) by Josh Corman and David Etue.

#RSAC

Need to Focus "Up The Stack"

#RSAC

App Sec

Security Management & GRC Identity/Entity Security
Data Security

CSA Cloud Model

Host

Virtualization, Software Defined Networks, and Public/Hybrid/Community Cloud Forces
a Change in How Security Controls Are Evaluated and Deployed

#RSAC
Data Centric Security = Agility!

App Sec

Security Management & GRC Identity/Entity Security
Data Security

CSA Cloud Model

Host

#RSAC
Apply
 Be Part of the Solution--Don't Be "Doctor No"  Evaluate Security Solutions That are Cloud and/or SaaS delivered
 Drive cost of security down  Gets direct experience using cloud  Illustrate to organization you can help use cloud securely  Determine Your Teammates  Procurement, Legal, Finance, etc.  Understand Influence vs. Control  Prepare  Get your policies ready for cloud (hopefully they are already)  Start adapting your toolkits "up the stack" toward data and identity
26

