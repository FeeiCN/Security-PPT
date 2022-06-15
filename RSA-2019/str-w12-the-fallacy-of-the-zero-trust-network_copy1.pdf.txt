SESSION ID: STR-W12
The fallacy of the "Zero Trust Network"

Paul Simmonds
CEO & CISO The Global Identity Foundation @simmonds_paul

#RSAC

#RSAC
Agenda
How we got here! A little background ­ and a history lesson What Zero Trust is not, and what it may be Reacting to a Zero Trust strategy What you should be doing when you go back to work
2

How we got here!

#RSAC
Our industry loves marketing Buzzwords
Early 90's ­ Viruses (are they real?) Mid-90's ­ Wardialing Late 90's ­ "Deep Packet Inspection" Firewalls Early 2000's ­ The year(s) of PKI Mid 2000's ­ Deperimeterization (thank you Jericho Forum) Late 2000's ­ "Next Generation" Firewalls Early 2010's ­ "Defence in depth" & APT's Mid 2010's ­ AI & Big Data And now ..... ­ Zero Trust
4

#RSAC
So many vendors, so many "Zero Trust" products!
Therefore; Select your products with care!
Is it just the marketing department jumping
on the buzzwordbandwaggon?
5

#RSAC
So many vendors, so many "Zero Trust" products!

· Akamai · AlgoSec · Amazon AWS · Aporeto · Centrify · Cloud Harmonics · Cloudflare · Cymbel · Cyxtera

· Double Octopus · Duo Security (Cisco) · ForgeRock · Google (BeyondCorp) · Guardicore · Jump Cloud · Luminate · Microsoft · Netronome

· Okta · PaloAlto Networks · Panda Security · Plixer · ScaleFT · SecureCircle · Tripwire · Zentera · Zscaler

... and many more

#RSAC
So on to the history . . .
7

A little background
.... and a history lesson

Yesterday's business

Internal Wireless Access

Photocopier / Printer

Corporate Managed Standard
Build

Wired Desktops
Corporate Laptops

Corporate E-mail

#RSAC

E-Mail Office Apps Storage/Backup Back Office
Remote Gateway(s) DMZ Web Filtering
Web Server(s) Partner Gateways Secure-ID VPN
ERP (SAP etc.) IAM (MS-AD)

The only part of
our business exposed

9

Today's business

Internal Wireless Access

Photocopier / Printer
Guest (Outsourced Wireless Management) Access

Minimal Purchases

Wired Desktops

· Windows PC · Windows Tablets · Mac Books · iPads · Chromebooks

Corporate Laptops

Corporate Smartphones

3rd Parties with Staff BYOD own laptops Smartphones
10

#RSAC
E-Mail Office Apps Storage/Backup Back Office Cloud IAM
Web Server(s) DevOps B2C Cloud Services
Web Server(s) DevOps B2C Cloud Services
ERP (SAP etc.) Legacy Systems Legacy IAM Gateway to JV's etc. Legacy VPN Gateway Firewalls & FW Management

Tomorrow's business

Zero Trust

Partner Direct Connection

Minimal Purchases

Wired Desktops

· Windows PC · Windows Tablets · Mac Books · iPads · Chromebooks

Corporate Laptops

Photocopier / Printer Wireless (Outsourced Management) Access

E-Mail Office Apps Storage/Backup Back Office Cloud IAM
Web Server(s) DevOps B2C Cloud Services API Services
Web Server(s) DevOps B2C Cloud Services API Services

Plant / Manufacturing 3rd Parties with
own laptops

Staff BYOD Smartphones

11

ERP (SAP etc.)

#RSAC

... and our border?
This is what we fool ourselves into thinking we deliver

#RSAC
But at best - this is what we actually deliver

#RSAC
Evolution of Information Security Technology

Source: Dan Hitchcock
https://movetheworld.files.wordpress.com/2008/01/evolutionofinformationsecuritytechnologies.pdf

And this is how the business see us . . .
"Digital Transformation
is about collaboration"
"But YOU stop us from working
effectively"
14

#RSAC
"How do I collaborate with what my partners are
using?"
"It works just fine from my
home PC"

#RSAC
Right problem, wrong solution
We need to run insecure protocols on the Intranet
We've made it secure, but ..... let's downgrade the security when "inside" the Intranet!
D'oh!

What Zero Trust is not
. . . and what it may be

#RSAC
What Zero Trust is not . . .
About "trusting no one" A "next-generation perimeter" And certainly not "VPN modernization" An off-the-shelf product An IT-only project A one-off project About eliminating your Intranet (but could be!)
17

#RSAC
What Zero Trust should be in your organization . . .
A business ENABLER! An (architectural) state of mind When there is no (security) difference between the Internet and Intranet A combination of processes and technologies Reduced complexity A unified experience - greater flexibility and productivity for staff and partners
18

Reacting to a Zero Trust strategy

#RSAC
Zero Trust: Network
There is no "DMZ" or "VPN" anymore: no security perimeter The "Intranet" may be retained for QoS (but not security) It's application and user-centric, not infrastructure-centric: dynamic, evolving All network sessions must have authentication and authorization Enforce the network to only allow encrypted protocols There is more than one way to implement it:
­ Network Micro-segmentation (lots of tiny firewalls) ­ Software-Defined Perimeter (lots of tiny VPN tunnels) ­ Identity-Aware Proxy (next-gen Web Access Management) And you'll probably end up using all of these
20

#RSAC
Zero Trust: Legacy
Identifying legacy will be key to any Zero Trust transformation
Once identified then have a strategy for dealing with it:
­ Plan to replace it ­ Upgrade it ­ Put it on a totally isolated network ­ Isolate it (possibly using Network Micro-segmentation) ­ Use an identity aware firewall ­ Encapsulate insecure protocols ­ Use a data-diode Or some mix of all the above!

#RSAC
Zero Trust: Access Management
Least Privilege
­ every access limited to a specific user, device, and app or resource only
Centralized
­ policies are standardized across common IT systems ­ policies are defined by the business (with the support of IT)
Dynamic
­ access decisions are made in real-time ­ common requirements, individual attributes and context influence each decision
Adaptive
­ open to support new authentication methods ­ constantly evolving, reacting to environment changes (machine learning, AI, etc.)

#RSAC
Zero Trust: Data
Asset Discovery
­ You cannot protect what you don't even know exists
Data Discovery & Classification
­ Not all data is created equal, and every organization has its own data taxonomy
Data Flows
­ Identifying sensitive data flows & protocols between apps, users, external parties, frenemies, partners & the devices is the foundation for securing them
Data Protection
­ All sensitive data must be encrypted at rest and in transfer [and preferably in processing ­ but that's a whole separate talk . . . .]
23

#RSAC
Zero Trust: Identity - CONTEXT is key

#RSAC
What strategies should I employ?
Always start with a long-term, business-driven strategy "Rip and replace": sounds good, doesn't work Think beyond security, focus on business enablers ­ Reduction of infrastructure complexity ­ Hybrid-cloud ready ­ Enterprise mobility ­ Compliance Identify your key assets and biggest risks (don't leave this to IT) Do not expect to achieve the goal in one step (or ever) Reuse and incorporate existing security, monitoring, orchestration tools
25

Zero Trust: Data
Adopt the principle of Least Privilege
­ Data access should be limited to a specific user, device, and app or resource only
­ Think who/what needs access - then work out how to limit the access
Contextual Access Control
­ Data access policies must be defined by the business (with the support of IT)
­ Access decisions should be made in real-time
It must operate outside of your "locus of control"
­ Because businesses need to interact with the outside world!

#RSAC
FAIL

#RSAC
Get back to fundamentals
Use only inherently secure protocols - JF#4 Design for the Internet - JF#5 Base your access control on multiple trust attributes (not just "user") ­ JF#6 Ensure data is secure by default ­ JF#11 Stretch goal; Be able to use trust attributes from outside of your "locus-of-control" ­ JF#8
27

What you should be doing when you go back to work

#RSAC
Summary
"Zero Trust" is an (architectural) state of mind "Zero Trust" is not a product solution you can buy!
There are quick wins, as well as long term strategy! You need to align security architecture with business strategy!
Design for "Internet" and implement on the Intranet & Internet!
29

#RSAC
Easy wins . . .
Simple strategy
­ Move to HTML5 delivered applications ­ Mandate those apps must deliver over HTTPS
Only fight battles big enough to matter
­ Find and eliminate insecure protocols ­ Improve processes around user identity
Only fight battles small enough to win
­ Only argue for change at a major upgrade or replacement ­ If PC/Windows/AD add device certificates (and leverage them . . .)

#RSAC
Apply What You Have Learned Today
Next week you should:
­ Plan how you can identity all your devices and their locations ­ Develop an Internet mentality for your Intranet
In three months following this presentation you should:
­ Have talked to the business to understand their strategy and needs ­ Understand and have plans / solutions for your legacy ­ Have a roadmap to eliminate insecure protocol ­ Worked with IT to understand the refresh strategy ­ Worked with purchasing to get a "heads-up" new systems
31

#RSAC
Apply What You Have Learned Today
Within six months you should:
­ Have aligned medium term business strategy with a security strategy ­ Worked with business to provide ROI costing to drive security
enablement ­ Develop a series of "cookie-cutter" approaches that people support
Longer term
­ Work with business to ensure all new (and upgraded) systems use a "Zero Trust" or "De-perimeterized" approach to security
­ Develop metrics to demonstrate increased security and ROI
32

#RSAC
Free Resources & Further Reading

Jericho Forum Commandments

Google BeyondCorp

Global Identity ­ "Challenges Pitfalls & Solution"

CSA Guidelines

All freely available: Use Google; or linked at: www.globalidentityfoundation.org

#RSAC
Questions

omments

Questions & Comments

Questions & Comments

Questions & Commen

ions & Comments

