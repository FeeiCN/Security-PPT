#RSAC

SESSION ID: ZT-M03
Inside the Making of a Zero Trust Architecture

Alper Kerman
Security Engineer, Project Manager NIST NCCoE

Scott Rose
Computer Scientist NIST/CTL

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented.
Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
Certain commercial entities, equipment, or materials may be identified in this document in order to describe an experimental procedure or concept adequately. Such identification is not intended to imply recommendation or endorsement by NIST, nor is it intended to imply that the entities, materials, or equipment are necessarily the best available for the purpose.
2

#RSAC
Agenda
NIST Zero Trust Efforts (Summary) Our View of Zero Trust
­ NIST Special Publication 800-207
NIST National Cybersecurity Center of Excellence (NCCoE) ZTA Demonstration Project Getting Started
3

#RSAC
NIST Zero Trust Efforts
Initial Research and Ensuing Objectives

#RSAC
NIST Zero Trust Efforts

2015

2017 2018

2018

2019

2020

2020

2021

TODAY 2022

START OF NIST EFFORTS

Work In Progress

5

#RSAC
Zero Trust and NIST SP 800-207
Defining Zero Trust and its Principles

Zero Trust 101

2005: Jericho Forum De-perimeterization

2010: Forrester coins "Zero Trust"

2014: Google releases "BeyondCorp" papers

2018: Gartner coins "Lean Trust"

#RSAC
2019: NIST releases draft SP 800-207

Zero trust is a set of principles used when designing, implementing and operating an infrastructure Want to reduce implicit trust between enterprise systems
7

#RSAC
NIST SP 800-207: Zero Trust Architecture
A descriptive document, not prescriptive Contains definitions, observed approaches and tenets of zero trust Zero trust functional components
­ Policy Engine "The Brains" ­ Policy Administrator "The Executor" ­ Policy Enforcement Point "The Guard" ­ Policy Information Point(s) "The Advisors"
8

NIST SP 800-207 Approaches
Main Technology Used in Enterprise Policies
· Enhanced Identity Governance (EIG)
· Using network ID as main enforcement point of access policies
· Micro-segmentation
· Using network segmentation (e.g. firewalls, smart switches, etc.)
· Software Defined Perimeter (SDP)
· Layer 7 solutions (e.g. overlay network, etc.)

#RSAC
9

#RSAC
"System of Systems" Reality
Multiple Policy Engines/PEPs each covering a portion of ZT
­ ICAM, endpoint protection, network monitoring, etc. ­ Enterprise policy is overarching management

Pros:
· Mix/Match components (best
of breed) · May be able to keep existing
tools · Less vendor lock-in

Cons:
· Interoperability challenges · Need centralized logs/SIEM · May be difficult to diagnose
issues

10

#RSAC
NCCoE Implementing a Zero Trust Architecture Project
Putting Principles into Practice

#RSAC
National Cybersecurity Center of Excellence (NCCoE)
· NCCoE is a component of NIST (Established in 2012)
· Under project specific CRADAs, we work with industry organizations, government agencies and academic institutions to design and build example solutions for most prevalent cybersecurity problems.
· We complement each example solution with NIST 1800 series document (Practice Guide)
12

#RSAC
Implementing a ZTA ­ NCCoE Project Initiation

Official Project Announcement
OCTOBER 2020 · Publish Federal Register
Notice (FRN) · Publish Project Description

Inquire About Project Participation
BY JANUARY 2020 · Review Letter of Interest (LOI) · (Fact: Received ~70 LOIs)

Project Team Building & Kickoff
FEBRUARY 2020 ­ JULY 2021 · Meet technology vendors and
assess proposed technology contributions · Select Vendors and sign CRADAs (based on first-come, first-serve) · Project Launch July 21st (initially with 20 vendors)
13

Project Goals and Focus

Cloud Services

#RSAC

Deployment Approaches
· Enhanced Identity Governance (EIG) · Micro-segmentation · Software Defined Perimeter (SDP)
Demonstration Scenarios
· Employee Access to Corporate Resources · Employee Access to Internet Resources · Contractor Access to Corporate and
Internet Resources · Inter-server Communication Within the
Enterprise · Cross Enterprise Collaboration with
Business Partners · Develop Trust Score/Confidence Level
with Corporate Resources

Branch Site

INTERNET

Enterprise HQ - "XYZ" Enterprise HQ - "ABC"

Teleworker

Coffee Shop

Deployment (Brownfield) Use Case Scenario "Enterprise with Satellite Facilities"
14

NOTIONAL ZTA ARCHITECTURE

Endpoint Security
User
Device
Mobile Device
Device (with SDP Client)

Security Analytics

IDENTITY · User · Device

ICAM
ACCESS & CREDENTIALS · Management · Authentication
(SSO/MFA) · Authorization

FEDERATION

GOVERNANCE

PE/PA
POLICY Evaluate Access
PEP
GRANT ACCESS (Microsegmentation)

SDP (example: TLS Tunnel)

GRAND ACCESS (SDP)

Data Security

Protected Resources
CLOUD
APPS & WORKLOADS
ON-PREM
APPS & WORKLOADS (File Share, Database, Storage, Apps)

#RSAC
15

#RSAC
ZTA Capabilities Groupings
16

#RSAC

Notional Deployment Approach

I(N): Initial Connection S(N): Session Management R(N): Resource Management

I(2). Identity and credentials

Control Plane Data Plane

I(1). Initial access request (identity and credentials)

Subject

PDP (PE/PA)
I(4). Allow/ S(A). Access deny requests; info access needed to
periodically verify subject/resource/
endpoint

I(3). Information needed to approve/deny access request
S(B)/R(x). Information needed to continually evaluate access
S(C) maintain/revoke application session
R(x+1) revoke/limit resource access

PIP(s) (Data Stores, Feeds, etc.)

PEP

R(1). Authenticate resource and connect it to PEP
I(5) Application session user experience

Resource

S(D). Periodic reauthentication challenge/response and device hygiene verification

R(2). Periodic resource reauthenticate resource challenge/response and endpoint hygiene verification

17

#RSAC
Project Implementation Strategy & Focus Areas
Take on agile approach with each implementation
­ Implement iteratively and incrementally (crawl, walk and run)
Implement multiple builds for demonstration of each deployment approach
· Start with a minimum viable solution when implementing each deployment approach · Capture and document the experience and findings toward a more mature ZTA
Determine use cases for scenarios in:
­ Asset/resource discovery and registration
examples: enterprise owned, cloud based, etc.
­ Access to resources on-prem, in the cloud, on the internet using different types of IDs
examples: enterprise ID, federated ID, other ID, etc.
Determine ZTA capabilities needed for demonstration of each deployment approach
­ Identify capabilities needed for crawl (minimum viable solution), walk and run implementation phases
Start with Enhanced Identity Governance (EIG) approach
Why?
· Not as complex · Identity is essential
18

#RSAC
Project Status
Currently focused on implementing builds that demonstrate the EIG deployment approach
Close to finishing up Next implementations will focus on micro-segmentation and SDP deployment approaches
Also focused on publishing a preliminary draft of the Practice Guide (NIST SP 1800-35)
Preliminary Draft NIST SP 1800-35A (Published on June 3rd, 2022, Public Comment Period Open until July 5th, 2022) Preliminary Draft NIST SP 1800-35B (Anticipated Publishing Date: End of July) Preliminary Draft NIST SP 1800-35C (Anticipated Publishing Date: Mid August)
Project Website
https://www.nccoe.nist.gov/projects/implementing-zero-trust-architecture
Project COI
Request to Join Email: nccoe-zta-coi@list.nist.gov
NIST ZTA Forum
Request to Join Email: nist-nccoe-zta@list.nist.gov Forum Webpage: https://www.nccoe.nist.gov/nist-zero-trust-architecture-forum
19

#RSAC
Participating Project Collaborators
20

#RSAC
Getting Started
Right Now:
­ do a risk analysis on your organization's primary mission ­ Identify resources (including PE/PEPs)
For the Next Quarter:
­ Begin forming policies for workflows ­ Identify gaps (technology/policy/process)
For the Next 6-12 months:
­ Focus on "low hanging fruit" Addressing gaps in identity, compliance, and monitoring
21

