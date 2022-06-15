SESSION ID: CSV-W03
Securing Cloud-Native Applications at Scale

Ashwin Ambekar
Principal Security Architect eBay Inc @ashwin_ambekar

#RSAC

#RSAC
What is a Cloud Native Application?
Applications that are designed to run natively on the Cloud. Such Applications are elastic, resilient, loosely coupled to
infrastructure, use distributed data and can be secure even in public Cloud
Cloud Native Application adds value to the business in a flexible, continuous, highly available and secure manner
2

#RSAC
Cloud-Native Transformation
Monoliths broken down into multiple functional and nonfunctional micro-services Common abstractions across services stack (e.g. discovery, rate limiting etc.) Ubiquitous deployments, independent of environment and location Short development cycles and frequent deployments Partitioned, duplicated and distributed data
3

#RSAC
Cloud-Native Transformation at Scale

eBay 2017 Cloud landscape: Before Cloud-Native transition
­ 200,000+ Computes/VMs ­ 0.5+ M deployments ­ 4000+ Applications

eBay 2018 Cloud landscape: During Cloud-Native transition
­ 350,000+ Computes/VMs ­ 1+ M deployments ­ 7,200+ Applications

4

#RSAC
Security Implications
Increased surface area
­ Computes, dependencies, locations
Dynamic eco-system
­ Ephemeral computes and frequent deployments
Distributed data and services New technology landscape and culture
5

#RSAC
Traditional Security Model
Remediation centric security
Perimeter based segmentation
Layered defense
6

Gaps and challenges
Challenge Observability, Compliance, Scanning, Patching, AV, FIM Segmentation, X.509 PAM, MAC, Access Control, Software Supply Chain Data Classification challenges DDoS, IDS/IPS, DLP Application Access Control

#RSAC
Caused by Increased Surface Area, Ephemeral computes
Increased Surface Area, New technology landscape Distributed Data Encrypted traffic Decomposition and loss of context

7

#RSAC
Security model is broken in Cloud-Native Era

#RSAC
Target State
Layered security controls: Defense in depth Application centric security
­ App-App integration is new dimension ­ IP Address is no longer application identity
Reduce remediation centric security
­ Does not scale
9

#RSAC
Pillars of Cloud-Native Security at scale

Declarative Security
· Cloud native systems are declarative and intent driven, security is no different

Self Healing
· Drift between declared and actual can be eliminated by self-healing systems
· Self healing systems embrace visibility as basic requirement

Cloud-Native Security

Secure by default
· Embrace immutable infrastructure · Implement Secure by default policy for code and
infrastructure to reduce security gaps

Dynamic
· Process, Controls and Policies must be adaptive and continuous in nature
· Dynamic Secrets

10

#RSAC
Securing DevOps
11

#RSAC
Reference Architecture: Kubernetes
Typical Cluster
Control Plane
12

Secure Infrastructure

Build

Ship

Harden Kubernetes Control Plane

Admission

Run

#RSAC

13

Secure Infrastructure

Build

Ship

Harden Kubernetes Platform

Admission

Run

#RSAC

14

Secure Infrastructure

Build

Ship

Admission

Run

#RSAC

15

Secure Infrastructure

Build

Ship

Admission

Run

#RSAC

Isolation
· POD Security Policies
· Sandboxing (Kata, gVisor)
· Node Restrictions

Segmentation
· Network Policies
· Zone based clusters, namespaces, Dataclassification

Access Control
· RBAC · Namespace scoped · Cluster scoped

Policies
· Admission Controllers
· Image and resource policies
· Stack specific policies and exceptions

16

Secure Infrastructure

Build

POD Security Policy

Ship

Admission

Run

#RSAC

POD Security Policy (PSP) can be authorized via RBAC. POD will not be created if PSP authorizations are missing for service account used for creating POD.

17

Secure Infrastructure

Build

Ship

Admission

Reducing attack surface with Network policy
­ Scenario: Restrict access to java web-app from nginx

Create namespace for Java web-app
kubectl create namespace listitem kubectl label namespace/listitem purpose=catalog
Create namespace for nginx
kubectl create namespace rproxy kubectl label namespace/rproxy purpose=frontend

kind: NetworkPolicy apiVersion: networking.k8s.io/v1 metadata: name: web-allow-fe spec: podSelector:
matchLabels: app: web-app ingress: - from: - namespaceSelector: matchLabels:
purpose: frontend
18

Run

#RSAC

Secure Infrastructure

Build

Ship

Admission

Run

#RSAC

Use WAF for securing applications
­ OWASP ­ Encrypt the traffic to/from POD ­ Enforce Authentication and Authorization

Istio (Service Mesh) is a good candidate

Detection and Control
­ Privilege escalation detection ­ Container monitoring (cAdvisor) ­ Network detection and controls (Edge security, IDS, Sflow, EBPF)
o Inspection and Visualization
­ Behavior based detection

19

#RSAC
Application threat model

You need threat-modelling for your applications
S.T.R.I.D.E is a very useful methodology in modeling threats for applications
­ Analyze and prioritize security initiatives

Threat Spoofing Tampering Repudiation Information Disclosure Denial Of Service Elevation Of Privileges

Description Pretending to be someone else Modifying data that should not be modifiable Claiming someone didn't do something Exposing information Preventing system from providing service Doing things that one is not supposed to do

Breaks Authentication Integrity Non-repudiation Confidentiality Availability Authorization

20

#RSAC
Final thoughts
Simplicity is key to success at scale Change is inevitable
­ Track technology landscape and associated vulnerabilities
Empower application developers with knowledge, tools and responsibility Prepare Incident response plan
­ Mitigation of control gaps is never sufficient, infrastructure will always have gaps and zero day vulnerabilities
21

Q & A

Thank you! aambekar at ebay dot com

