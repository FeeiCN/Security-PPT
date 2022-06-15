SESSION ID: STR-T08
Software Supply Chains: Another Bug Bites the Dust.

Todd Inskeep
Global Security Assessments VP Samsung Business Services @Todd_Inskeep
1

#RSAC

Series of Recent, Large, Long-term Security #RSAC Issues
 Heartbleed ­ April 2014 (1998)  LZO ­ June 2014 (1994)  Shellshock- September 2014 (1989)  POODLE ­ October 2014 (1996) [December 2014 variant for TLS]  Winshock - November 2014 (1996)  Kerberos Checksum Vulnerability ­ November 2014 (~2000)  Equation Group ­ February 2015 (~2001)  FREAK ­ March 2015 (~1998)
2

#RSAC
Bigger than the biggest thing ever and then some. Much bigger than that in fact, really amazingly immense, a totally stunning size, real "wow, that's big," time. ...Gigantic multiplied by colossal multiplied by staggeringly huge is the sort of concept we're trying to get across here.
- Hitchhiker's Guide to the Galaxy
3

#RSAC
Look at ONE company - Yours

https://www.blackducksoftware.com/

 Establish Ownership for Software Security  Identify Critical Software ­ Build a BOM
 Evaluate FOSS & Licenses/Management
 Scan Systems and Codebase  Compare Codebases to NVD
 Establish SDLC for Software Security  Consider the Building Security In Maturity Model (BSIMM)
 Review Code Repositories & Governance  Conduct Supplier Software Assessment  Implement Checks on Firmware  Monitor the changing Environment

4

#RSAC
Establish Ownership for Software Security

 Responsible  Accountable  Resourced
 Empowered with Authority

"If everyone is in charge, no one's in charge."
Aligning the Stars: How to Succeed when Professionals Drive Results By Jay William Lorsch, Thomas J. Tierney

Everyone is responsible and no one is to blame. - Will Schultz, American Economist

5

#RSAC
Identify Critical Software ­ Document the BOM
 Source(s) of Code
 FOSS Code  Licensed Code  Developed Code  Firmware
 Code in Tools  Code in Frameworks and APIs  Evaluate FOSS Licenses & Management
 Software Package Data Exchange ®
6

#RSAC
Building the Software BOM

Identification

Classification

Corporate Applications
CustomerFacing
Applications
Business/ Sector/ Region Applications
Key Supplier Applications

Application Risk
Classification Tools

Recursive Application / Code Decomposition

Software Breakdown Structure

Management

Automated Application Management & Repository Tools

Corporate Developed
Code Contract Code
Vendor Code
FOSS Code COTS Code "Products"

Entire Application Repository

Typical Application Information

Procurement

End-of-Life

Owner

Classification

Risk/Threat

Configuration

Dependencies Integrations

7

#RSAC
Scan Systems and Codebases
 Audit Tools  Static Analysis Tools  Dynamic Analysis Tools  Red Team / Active Penetration Testing  Compare Codebases to NVD
 National Vulnerability Database https://nvd.nist.gov/
 Authoritative Source for most vulnerabilities and threat tracking
 Standardizes naming conventions & references for searchability
 Assesses threat level of vulnerabilities  Limited information on status of
vulnerability repair
8

#RSAC
Coverity Scan ­ Static Analysis of FOSS
9

#RSAC
Establish an SDL for Software Security
 Provides process to follow and measure  Supports resource and training requests  Increases consistency across an organization  Creates measures for reporting  Initiates collection of best practices for your organization

 Microsoft Secure Development Lifecycle

 Building Security In Maturity Model (BSIMM)

10

Set Target Capability Maturity to balance risk #RSAC and reward

 Common Criteria (& Orange Book/ Rainbow Series)
 Software Capability Maturity Model
 NIST Security Framework
 Apply as guides to your organizational needs

Maturity Scale

Medium

High

Sample Capabilities
· Architecture driven S/W design · Comprehensive testing and review prior to operations · Fully isolated and segmented network(s) · Cleared Personnel
· Common Criteria ­ Higher Levels of Assurance throughout process · Strong BSIMM-like processes · SDL gate(s) prior to release
· Automation in component tracking and management · Supplier data sharing and collaboration · SDL Process in place · S/W sources minimally documented
· Limited testing and SDL process controls · Software development process limited maturity · Minimal awareness of software sources
· No formal software cyber security controls · Software written ad hoc to meet functional requirements

Low

11

Review Code Repositories & Governance

#RSAC

Processes

 Who has access to your code? Directly and Indirectly?
 What protects your code? In Storage, Distribution, Use & Operation?
 Where is your Code stored? Used?
 When do you take control? When do you relinquish control?
 Why are you protecting it? What are the threats?
 How do you maintain integrity, authentication, and authorization?

Core Principles
1. Confidentiality 2. Integrity 3. Accountability 4. Assurance

12

#RSAC
Conduct Supplier Software Assessment

 Assess each supplier from several aspects
 Meet with suppliers (where possible)
 Consider "Shared Assessments" Process
 Remember traditional supplier measures don't apply to Open Source Developers who are:  Globally Distributed  Often known by "Handles"  Have unique, individual processes  May be security aware  or functionality focused

Example Aspects of Supplier Assessment

Ownership

Reputational

Maturity of Bus. Process

Location

Financial Stability

Business Partnerships

Security

13

Supply Chain Software Assessment

#RSAC

Potential Risks and Recommendations for Cyber-related Software

Risk Rating
High
Critical
High High Med Med

Risk Description
Lack of integrated cyber security testing across S/W components prevents understanding of vulnerabilities and attack surfaces
Inconsistent dynamic testing (e.g. for backdoors that bypass cyber security controls) to prevent developer attacks and poor coding
Need for more consistent and comprehensive source code reviews to more effectively identify development-process vulnerabilities
Testing of Open Source software often does not include cyberrelated components
Ad hoc software modifications introduced late in the production process increasing potential he exposure to malware
Minimal perspective on adversary supply chain operations limiting ability to anticipate FOSS cyber-related attacks

Recommendation
Require testing of integrated code prior to promoting code
Establish "Red Team" testing group focused on software security testing
Formalize static & dynamic code reviews with results reviewed prior to code approval
Review open source code with caution and test explicitly for cyber-related issues Document and enforce software Cyber Security policies and standards Enable appropriate Threat intelligence distribution to developers and testers

14

Common recommendations for managing your #RSAC software supply chain

Process
· Establish a risk based prioritization methodology
· Develop unique identifier to track critical s/w components
· Enhance contractual and tracking processes to provide control over origins of s/w including licenses and obligations
· Integrate application testing processes
· Develop robust remediation process

Skills & Training · Identify needed skills and
training · Develop an authoritative
testing group · Establish software security
champions across areas · Use communication
campaigns to build culture of cyber security · Use contract projects to learn from outside experts with deep knowledge
15

Technology
· Leverage software repositories to standardize code management ­ consolidate, integrate, and automate
· Use data analytics tools to provide component code visibility
· Use automated tools to integrate cyber testing for software
· Enhance identity and access controls for developers and suppliers

Implement Checks on Firmware

#RSAC

(if your organization builds hardware)

 Operating Checks and Verification

 Trusted Boot Sequences

 Secure Elements in Hardware
16

#RSAC
Monitor the changing Environment

 Threat Intelligence  ISAC Participation  Vendor Relationships  Vulnerability Management  Risk Management  Incident Response

Threat Intelligence

Public Records

Social Media

Integration

Open Source

Analysis & Prioritization
Actionable Intelligence / Proactive and Reactive Response

17

#RSAC
Design Resilient Systems
 Plan for systems to resist attack  Reduce attack surfaces  Eliminate excess  Limit access directions  Log and check logs
18

Design and architect systems to manage risk #RSAC

Application Instrumentation and Monitoring

Desktop
Private Network

Web Browser
Internet

Presentation Services

Smart Mobile

Application ­ UI

Application ­ UI

Service Connectivity

Business Services

Application ­ Business Logic

Application ­ Business Logic

Data Services

Backend Connectivity

Data Access Adaptors

Service Access Adaptors

Data Sources

Services

Identity Management and Malicious Activity Detection

Key Elements
· Presentation services · Service Connectivity · Business Services · Data Services · Backend Connectivity · Instrumentation and
monitoring · Identity Management · Malicious Activity
Detection

19

Worked Example ­ Online Banking Systems #RSAC

Initial Authentication
Authentication Risk Engine

Limited Transaction
Set
· Balances · Transfer · Print · Review ·...

Transaction Monitoring
Fraud Detection Engine

Complete Transaction
(Back-end)
Fraud Processing

User Reports

Feedback & Integration Across Processes

· Real Time Protection · User Experience
Impact · Provides Input for
SIEM · Enables multi-factor
authentication

· Limits Attack Surface
· Defines Interfaces and activities
· Supports SIEM

· Real Time Protection · Limited User Impact · Provides Input for
SIEM · Obscured from
attackers

· Post Transaction ­ non-Real Time
· No User Impact · Input to and output
from SIEM · Invisible to Attackers

20

#RSAC
When you return ­ apply core principles

 Establish Ownership for Software Security  Identify Critical Software ­ Build a BOM
 Evaluate FOSS & Licenses/Management
 Scan Systems and Codebase  Compare Codebases to NVD
 Establish SDLC for Software Security  Consider the Building Security In Maturity Model (BSIMM)
 Review Code Repositories & Governance  Conduct Supplier Software Assessment  Implement Checks on Firmware  Monitor the changing Environment

 Assess What you Have
 Ownership of Software Security?  Policies for Secure Software
Development?  Tools for tracking and managing
software?  Processes for implementing Tools &
Policy?
 Document gaps and needs
 Build awareness and consensus for action
 Find resources
 Start simply

21

42

#RSAC

- Douglas Adams, The Hitchhiker's Guide to the Galaxy 22

Backup

#RSAC

/ Afterthoughts

23

#RSAC
Why is Scanning the Internet so hard?

 The Internet is Colossally Huge  IPV4 ­ 4.3 Billion or 4.3X10^9 addresses  IPV6 ­ 3.4 X10^38 addresses
http://news.netcraft.com/archives/2015/02/24/february-2015-web-server-survey.html
24

 Netcraft - February 2015 Survey
 883,419,935 sites / 5,135,229 web-facing computers
 Microsoft IIS 28.7%  Apache 38.8%
 Versions?
 Underlying OS?
 Routers/Switches? SCADA/PCS/ICS IoT ­ Tesla's, Nest's, etc
 How old are these things?

Scan the Internet

 Several groups are scanning aspects of the Internet
 University of Michigan, Netcraft, Electronic Frontier Foundation and Insecure.org, and individuals
 Variety of Tools Available
 Scan.IO (https://scans.io/)
 Shodan(http://www.shodanhq.com/)
 NMAP(http://nmap.org/)
 Masscan(https://github.com/robertdavidg raham/masscan)  ScanHub(https://scanhub.shodan.io/)
 Zmap(https://zmap.io/)

 Powerful hardware and network connection
 Excellent Exclusion List
 Pre-arrange with ISP
 Hard and Getting Harder to really understand the Internet

25

#RSAC

#RSAC
Scanning the Internet
 The Internet-Wide Scan Data Repository  public archive of research data  active scans of the public Internet.  hosted by the ZMap Team at the University of Michigan.  Hosts scan data from others  A JSON interface to the repository is also available.
26

#RSAC
Netcraft
 Offers a variety of pay services related to Internet presence
 Hidden Gem with regular public updates
 Provides reality check against Forrester, Gartner, and IDC predictions
27

