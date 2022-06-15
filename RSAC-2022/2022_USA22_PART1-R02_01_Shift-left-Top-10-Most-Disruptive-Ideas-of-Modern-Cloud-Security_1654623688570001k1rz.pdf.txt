#RSAC
SESSION ID: PART1-R02
Shift-left: Top 10 Most Disruptive Ideas of Modern Cloud Security
Nicolas Popp
Chief Product Officer Tenable https://www.linkedin.com/in/nicopopp/

#RSAC
DISCLAIMER
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
#1: FROM LIFT & SHIFT TO SHIFT & LEFT

1.New Architectures
2.New Deployment Model

3. High Rate of Change

Conclusion: New Approach to Security Required

Shift-Left: Rethink runtime-centric approach to cloud security (too slow, too late, lacks app context, cannot remediate)

#RSAC
#2: REVENGE OF THE NERDS (DEV RULES SECURITY)

PEACE

LOVE

CODE

Take a DEV-Centric Approach: Don't take developers to security, take security to developers. Security must integrate into developer platforms: code repos, pipelines, ... (GitHub, GitLabs. Jenkins, Jira...)
4

#3: HELLO, IAC SECURITY. GOOD-BYE CSPM
IaC is foundational to
Cloud Native App
Development

#RSAC
IaC becomes Foundational
to Cloud Native App
Security

Embrace IaC Security: As your developers embrace IaC, IaC security will become a cornerstone of your cloud security (VM, CSPM, CIEM all shift-left based on IaC scanning)
5

#RSAC
#3+: PATCHING IS DEAD

De v Side : Unencrypted S3 Bucket

Se c Side : Auto-Generated Remediation as Code

Patching as Code: Do not patch the cloud. Embrace the immutable runtime principles and remediation as code based on IaC and pull-requests.

6

#RSAC
#4: APPSEC IS COOL AGAIN
The Return of AppSec: you can no longer ignore the AppSec discipline of SAST and SCA. They will become the left most part of your cloud security strategy
7

#5: THE API-BASED SECURITY REVOLUTION

#RSAC

IS BEING TELEVISED

From Agent-Based to API-Based VM
Favor Agent-Less Approach: Cloud security vendors must leverage cloud APIs to enable agentless and continuous cloud security. The transformation of VM into API-based cloud native VM is a great example.
8

#RSAC
#6: RIGHT IS NOT WRONG (BUT IT HAS AN AGENT)
Endpoint Protection Still Matters · Suspicious OS calls monitoring · Abnormal process activity · Process & file integrity · Malicious egress traffic
Runtime Security Still Matters! Don't let the cool and leftist kids (AppSec vendors) fool you. The right side security is still required, but EPP vendors must embrace cloud architecture (e.g. eBPF).
9

#RSAC
#7: IDENTITY IS THE NEW FIREWALL (MICROSEGMENTATION)

Segmented Three Tier App

API Mesh or Security Mess?

Segmented Mesh Convergence?!

Micro-Segmentation / ZTNA Dirty Secret! Beware, IAM policies are even more complex than firewall rules! Look for automation
10

#RSAC
#8: CYBER-HEAVEN HAS GATES

SECURITY ISSUE FUNNEL

BUILD
· AppSec · IaC-based CSPM · Gold Image VM · Build "fail"

DEPLOY
· Same as "BUILD" · Pipeline enforcement

RUN
· Runtime CSPM · Runtime VM · CWPP

Minimum security issues found

Deploy Continuous Security Gates: Cloud security should account for changes across the cloud app life-cycle to detect and eliminate less and less security flaws from build-time (gate 1), to deployment (pipeline gate 2) to runtime detection-response (SecOps gate)
11

#RSAC
#8+: THREE GATES BUT ONE POLICY AS CODE!
1. Consistent security policy across all gates 2. Policy as code (Dev-Friendly) 3. Open Standard over proprietary format (OPA)
One "Policy as code" to rule them all: Unify the gates of cyber-heaven with a single policy as code. Consider open standards over vendor-centric policy languages
12

#RSAC
#9: CNAPP: THE CLOUD EMPIRE OR THE BALKANS?
1. Left: App Sec 2. Center: Cloud Native VM 3. Right: Threat Detection
Know Yourself: large Enterprise will continue to be hybrid, thus best-of breed ("three towers, three vendors" across on-prem and cloud) while smaller `all-cloud' enterprises will benefit from single vendor platform
13

#RSAC
#10: FUTURE: LEFT BRAIN & AUTONOMOUS SECURITY

Left-Guided CWPP

Autonomous Security

Left-Side Guided Runtime security: Left side establishes context (asset relationships) and risk (prioritized findings and APA) to help prioritizing SecOps security events
14

#RSAC
NEXT STEP: SHIFT-LEFT AS EASY AS 1-2-3
1.THIS WEEK
Become a "shift-left" thinker!
2.NEXT MONTH
Identify one cloud-native application security project you can shift-left
3.THIS SUMMER
Make it real!

#RSAC
Thank You & Shameless Plug!
linkedin.com/in/nicopopp
16

