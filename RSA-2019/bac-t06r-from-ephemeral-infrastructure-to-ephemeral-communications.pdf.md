SESSION ID: BAC -T06R
From Ephemeral Infrastructure to Ephemeral Data

Joel Wallenstrom
CEO Wickr, Inc. @myWickr

Paul Kocher
Independent

#RSAC

Joel Wallenstrom
@stake (2000-2004)
­ Acquired by Symantec in 2004
Founded+ran iSEC Partners (20042017)
­ Mobile Security; Red Teaming; Crypto; Research
­ iSEC 100% (ISH) success getting to non-ephemeral data
­ Acquired by NCC Group in 2010
Investor+CEO Wickr (2014-Present)
­ Open Protocol ­ Transformation from consumer-
focused app to secure enterprise collaboration platform trusted by Fortune 500 companies

#RSAC
Paul Kocher
Founded+ran Cryptography Research (1995-2017)
­ Bootstrapped (no outside investors): Consulting  Licensing  Products  Solutions
­ Acquired by Rambus ($342.6M)
Co-Founded ValiCert (IPO 2001, Acquired 2003)
Technical projects include:
­ Protocols, incl. co-author of SSL v3 (" ") ­ Chip/HW designs (supply chain security, anti-counterfeiting,
keysearch...) ­ Timing attacks ­ Differential power analysis + countermeasures ­ Renewability & forensics (Blue-ray BD+...) ­ Factory key management systems (ASICs, devices...) ­ Spectre
Advisor & investor to many security start-ups
Member of National Academies' Forum on Cyber Resilience, ACR Fellow, Member of Nat'l Academy of Engineering
2

#RSAC
Historical goal: Maximize lifespan of data + infrastructure Ephemerality: Intentionally limit lifespans
3

Why minimize persistence?
Expensive

#RSAC
Dangerous

Persistent infrastructure

Hard to keep running (crashes, outages...) Poor utilization, scaling

Denial of service APTs

Persistent data

Hard to maintain data stores (corruption, synch...) Hard to administer (policies...)

Large masses of data Unbounded attack timeline

4

Rediscovering ephemeral compute
Compute used Lost when internal to be ephemeral hard disks arrived

#RSAC
Regaining ephemerality + applying at many layers

Helps reason about complex systems (facilitate static analysis, reduce development cost, resilience, reduce security risk)
5 Image of PC by Ruben de Rijcke, CC BY-SA 3.0, https://commons.wikimedia.org/wiki/File:Ibm_pc_5150.jpg Image of hard drive from user:Petwoe on German Wikipedia, Harddisk-head, CC BY-SA 3.0

Traditional Infrastructure
Maintain servers (upgrade...)

#RSAC
Ephemeral Infrastructure
Create Use
Destroy

Primary focus on maintenance Creation is rare
­ Add if capacity < max load
Destruction is rare
­ Hardware failure/obsolescence
6

Disposable: Creation & destruction are continuous
­ Create when load spikes ­ Destroy when load falls, errors
occur, new version...

#RSAC
Ephemerality in Infrastructure: Different way of thinking
New perspective on architecture
­ Example: Chaos Monkey
o Kills random instances to ensure server failures don't impact operation o Netflix's theory: Risks worth subsequent reliability benefits
7 Image of bandwith_wire https://searchnetworking.techtarget.com/definition/bandwidth Image of Netflix shows https://www.cordcuttersnews.com

#RSAC
Run Chaos Monkey on Production Systems?!?
Persistent The worst possible thing to do! mindset: Systems are mission-critical...
crash one and you'll be fired or arrested
Ephemeral Chaos is inevitable mindset: Servers are ephemeral = automate redundancy
testing. Better to find & fix problems ASAP
8

#RSAC
Ephemeral thinking: Chaos Monkey
Chaos Monkey motivation was resiliency ... but interesting unexpected security benefits

Lowers value of components to everyone (defenders + attackers)

If attacker... Crashes an instance Corrupts instance data Exfiltrates instance data

Consequence Negligible Less or no impact after instance gone Reduced: instances only has the data it needs
(e.g. data for task/customer it's servicing)
9

#RSAC
Ephemerality in Infrastructure: Different way of thinking
Ephemeral infrastructure widely used
­ Mature, accepted ­ Elite but going mainstream
What about data?
Ephemeral data
­ Both ancient and cutting edge
10

#RSAC
Data Ephemerality is Not New

Data ephemerality is ancient

­ Data in transit ­ Data in storage

Speech, telephone, visible light... Archived boxes with "shred by" date

Tech limits: Inability to capture, store Security: privacy/breach risks, discovery costs

11

#RSAC
Ephemeral data vs. ephemeral infrastructure

Challenge for data ephemerality: Data is easily copied
­ Data requires more planning to avoid unmanaged replication

Huge advantage for data ephemerality: Cryptography
Symmetric cryptography

Simplifies destruction: Simplifies transport:

Delete key Encrypt (ephemerality properties of channel don't matter)

Public key cryptography

Simplifies cold storage:

Encrypt with a public key whose private key is offline

12

#RSAC
Encrypted cold storage: An intermediate stage for data

Infrastructure: Data:

Create Create

Active use Active use

Cold storage

Destroy Delete

Helps overcome "might want it later" objections
­ Decision #1: Move [X] data into cold storage ­ Decision #2: Delete [X] data ­ But riskier than deletion
o Partial fix: Define deletion plan when placing into cold storage (e.g. 3 years if not needed)
Examples:
­ User data not touched recently ­ Log files ­ Backups ­ Regulatory compliance records

13

Public domain image by Tomwsulcer https://commons.wikimedia.org/wiki/File:Clutter_in_basement.jpg

#RSAC
Cold Storage is Not New

Charles M. Relyea/Library of Congress

Lincoln Hot Letters
14

#RSAC
Regulatory, legal, business

Retention obligations
Must keep data until X Compatible with hoarding Deletion optional afterward (= security benefits)
This requires, in particular, ensuring that the period for which the personal data are stored is limited to a strict minimum.
-- EU GDPR, Recital 39

Deletion obligations
Must destroy data if X
Range of potential triggers
­ time (# years) ­ customer asks to be forgotten ­ data no longer useful ­ contract end (NDA expiry) ­ trigger (person dies...)
Where are all the copies?
­ Backups, logs, employee laptops, persistent servers, databases, crashed hard drives...

15

#RSAC
Trends & data ephemerality
Technology costs falling exponentially
­ Storage, collection costs often negligible (for text, audio, images ­ soon video)
Other costs not falling
­ Compliance, legal discovery
Security costs are growing exponentially (but messy)
­ Hard to budget: Rare extreme costs, brand risks, regulatory risks
­ Hard to allocate: Who control risk != who bears costs ­ Hard to quantify: What is a person's privacy worth?
16

#RSAC
Rational strategies change

(benefit) ­ (storage cost) ­ (security cost) = (net value)

Exponential decrease

Exponential increase

positive

0 negative

Data hoarding is rational Data hoarding is illogical

history

Apply : Real-world examples of ephemerality

#RSAC
Ephemeral Desktop
Old model: Developer PCs with local storage
o Security problem: PCs get lost/stolen, data in/out via USB ports... o Cost problem: Most storage & CPU cycles are wasted
Instead: Diskless thin client
o Security: Could literally boot from read-only media o Cost: Better utilization
Annoying issue: Speed of light
19

#RSAC
Ephemeral Browsing (aka Browser Isolation)

Old model: Block `bad' websites
o Hopeless: Lists miss bad sites, block sites employees need
o "Good" sites can still be risky: E.g., Dropbox download, email...
Ephemeral data + infrastructure:
o Run browser on a sacrificial instance o Browse o Kill the instance
Can create from open source or use commercial offerings

· Use an old insecure browser (Firefox v10.0.11) · Search for "double my bitcoin free money" · Click on dicey links

20

Ephemeral Messaging
Historical model: Unencrypted SMS
o Message sent as plaintext
Typical today:
o Link encryption between clients and servers o Server sees plaintext o Archived indefinitely
Ephemeral model:
o Keys only known to end-points, used once then deleted o Deletion models for messages vary
· Personal: typically automatic deletion with no compliance · Business: typically cc a compliance/logging endpoint
o Deletion mechanism in place before message sent
21

#RSAC
Countless trusted entities:
1) Sender, 2) Recipients, 3) Servers, 4) Cloud provider ... and ... 5) Every node in network
4 Trusted entities:
1) Sender, 2) Recipients, 3) Servers, 4) Cloud provider
2-3 Trusted entities:
1) Sender, 2) Recipients; 3) optional compliance/cold storage

#RSAC
Ephemeral Keys
Forward secrecy & future secrecy
o Short-lived keys  compromise today doesn't expose past
 Keys are ephemeral
o Can combine with future secrecy
 Key update/ratcheting  compromise doesn't expose sessions occurring after attacker is evicted
time Breach
Supported in TLS, some messaging protocols (Signal, WhatsApp, Wickr)
22

Apply: Making the case

APPLY ­ Infrastructure Ephemerality
Goals
o Aim to minimize non-ephemeral infrastructure o Won't get to 100% -> benefits don't require 100%
Focus
o Where can riskiest operations be compartmentalized? o Where do compute + storage + network scale differently
Analyze
o Change in security risk (per node, overall service), +/- cloud vs. tailored o Scalability needs o Reliability (per node, overall service) & implications of interdependencies in cloud services o Re-engineering effort o Operational costs at planned scale
Architect Implement Verify
­ Chaos monkey...
24

#RSAC

#RSAC
APPLY ­ Data Ephemerality
Simple Goal. Begin where data retention is illogical:
PII off desktops, sensitive conversations off email...
Classify Data. What data is stored, who is accessing
and how often
Prioritize Business Needs. Better classified data
helps define data management and analytics processes
Update Standards. Information Governance policies that maximize benefits and minimize risks of
data. Ephemerality encourages/forces more explicit, methodical & thorough data life cycle policies
Communicate. Share Information Governance policies in context of business benefits Implement. Enforce and rely on cold storage. (Storage/Persistence comes with added risk) Orchestrate and Automate. Use encryption to proactively enforce IG policies
25

