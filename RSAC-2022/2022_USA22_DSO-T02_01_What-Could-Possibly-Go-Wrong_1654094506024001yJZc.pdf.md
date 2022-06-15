#RSAC
SESSION ID: DSO-T02
What Could Possibly Go Wrong? Plain Language Threat Modeling in DevSecOps
Alyssa Miller
BISO (Business Information Security Officer) S&P Global Ratings @AlyssaM_InfoSec

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
No opinions, views, or other content presented in this session represent those of S&P Global or its subsidiaries. All content presented is the sole work of the presenter.
2

#RSAC
3

#RSAC
4

#RSAC
Meanwhile, in 2008...
5

#RSAC
Dynatrace 2021 DevOps Report https://www.dynatrace.com/monitoring/solutions/devops-report
6

#RSAC
What is Threat Modeling?
Why do we Threat Model?

#RSAC
What is Threat Modeling?
Answering Two Questions: What is most Important? What could possibly go wrong?
8

#RSAC
Why do we Threat Model?
So we can take action to avoid those outcomes
9

#RSAC
"Threat modeling is analyzing representations of a system to highlight concerns about security and privacy characteristics."
https://www.threatmodelingmanifesto.org/
10

#RSAC
"The output of the threat model...informs decisions that you might make in subsequent design, development, testing, and post-deployment phases."
https://www.threatmodelingmanifesto.org/
11

#RSAC
Each organization should have a tailored methodology that aligns to their unique business objectives and structure.
https://www.threatmodelingmanifesto.org/
12

#RSAC
Five Values of Threat Modeling
"something that has relative worth, merit, or importance...while there is value in the items on the right, we value the items on the left more."

#RSAC
A culture of finding and fixing design issues...
...over checkbox compliance
14

#RSAC
People and collaboration...
...over processes, methodologies, and tools
15

#RSAC
A journey of understanding...
...over a security or privacy snapshot
16

#RSAC
Doing threat modeling...
...over talking about it
17

#RSAC
Continuous refinement...
...over a single delivery
18

#RSAC
Four Principles of Threat Modeling
"A principle describes the fundamental truths of threat modeling."

#RSAC

Early and frequent analysis

Of value to stakeholders

Iterations, manageable portions

Dialog is key, documents record
20

#RSAC
Building a Methodology in DevSecOps
"The Manifesto contains ideas, but is not a how-to, and is methodology-agnostic.

#RSAC

The DevOps Pipeline

Plan

Code

Build

Test

Release Deploy Operate Monitor

Accelerate Right
PUSH LEFT!!!!!!!!!!
22

#RSAC
Build a security empowered culture
23

#RSAC
24

#RSAC
As a _C_a_r__d_r_i_v_e_r_______________________ I want to _E_n_t_e_r__a__d_e_s_t_i_n_a_t_i_o_n__n_a_m_e____ So that _I__c_a_n__n_a_v_i_g_a_t_e__w_/_o__a_n__a_d_d_r_e_s_s_ ** I want you to: Protect _M_y__s_e_a_r_c_h__h_i_s_t_o_r_y_____________ From _B_e_i_n_g__a_c_c_e_s_s_e_d__b_y__a_t_t_a_c_k_e_r_s______
25

#RSAC
Asset & Threat Information

Plan
Security Requirements

Build
Security Controls

Test
Test Cases

Reference Architectures

Assets & Controls (YAML)

Deploy
Monitoring
Critical Functions
26

#RSAC
asset: name: search_terms description: Destination names entered by users threats: - theft-via-rest-svc: - countermeasures: [client-cert,session-token] - theft-via-db: - countermeasures: [field-encrypt]
27

#RSAC
steps: -task: myRepo.tstExtensionId.contribId.FuzzSessTkn@0
inputs: tokenName: `jzsession' format: `base64'
target:<hostname> - task: parseTestResults@1
inputs: testResultsFiles: "**/tstFuzzResults-*.xml"
condition: succeededOrFailed()
28

#RSAC
Takeaways
Threat modeling is just asking what can possibly go wrong Use the five values and four principles found in the Threat Modeling Manifesto to guide your methodology Take threat modeling out of the hands of security teams, make it a cultural collaboration activity Threat modeling can feed all phases of the DevOps pipeline and actually accelerate it Meet them where they live, bring threat modeling into existing tooling
29

#RSAC
Applying this to your organization
This Month:
­ Identify value proposition for your organization ­ Connect with product & engineering leaders to link value prop to
objectives
This Quarter:
­ Define an initial methodology following the values and principles ­ Define a plain-language threat taxonomy ­ Create new user story templates
This Year:
­ Launch a beta iteration using small scope as a POC
30

#RSAC
"Genius is making complex ideas simple, not making simple ideas complex."
­ Albert Einstein
31

