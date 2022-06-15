SESSION ID:CSV-F01
Advanced Persistence Threats: The Future of Kubernetes Attacks

Ian Coldwater

Brad Geesaman

Lead Infrastructure Security Engineer

Co-Founder

Salesforce/Heroku

Darkbit.io

@IanColdwater

@BradGeesaman

#RSA

C

#RSAC

?

#RSAC
A highly reliable distributed system for running other people's code as root next to your mission critical data and secrets

#RSAC
A highly reliable distributed system for orchestrating and managing container workloads on a fleet of auto-scaling compute resources via a single API

#RSAC
Early K8s Arch Diagram

#RSAC
Kubernetes Architecture

#RSAC

#RSAC
More complexity, more problems

#RSAC
GROWTH

#RSAC
Level Up

#RSAC
Kubernetes comes at you fast!

#RSAC
The cloud has a silver lining

#RSAC
Looking Forward
Looking Forward


#RSAC
What might an attacker want to do?
https://goose.game

#RSAC
DEMO:
Tapping into the API Server data flow
15

Validating Webhooks

1
User

4

Auth

Validating Webhook

2

3

Custom App

#RSAC

16

Validating Webhooks

#RSAC

1
User

6

Auth

Validating Webhook

Validating Webhook

2

3

Custom App In-cluster

5 4

Malicious App
Attacker Controlled Outside the Cluster

Attacker

17

#RSAC

#RSAC
DEMO:
Oversized Requests

Oversized Logs
Request to create a Pod apiVersion: v1 kind: Pod metadata: name: mypod spec: containers:
- name: nginx image: nginx:latest
Attacker

Audit Log of request to create a Pod
UID: 44714e4d-570c-4ec3-8ab8-63ea038b25b8 Timestamp: 2020-01-01T01:02:03+00:00 User: "A" Action: Create Request:
apiVersion: v1 kind: Pod metadata: name: mypod spec: containers:
- name: nginx image: nginx:latest

#RSAC

20

Oversized Logs

Request to create a Pod
apiVersion: v1 kind: Pod metadata: name: mypod annotations: (insert 256KB+ of filler here) spec: containers:
- name: nginx image: nginx:latest

Max Size: 1.5 MiB

#RSAC
Audit Log of request to create a Pod UID: 44714e4d-570c-4ec3-8ab8-63ea038b25b8 Timestamp: 2020-01-01T01:02:03+00:00 User: "A" Action: Create Request:
apiVersion: v1 kind: Pod metadata: name: mypod annotations: ERROR Parsing spec: containers:
- name: nginx image: nginx:latest
Max Parseable Field Size: 256KB !!

Attacker
21

Oversized Logs - Correct size

#RSAC

Who created the pod

The full request body for the creation of pod: mypod

22

Oversized Logs - Oversized Request

#RSAC

User who created mypod2 The full request body for
mypod2 is missing!
23

#RSAC
DEMO
Launch an in-cluster "shadow" API server that silently bypasses main API servers (no security policy, no logs)

Shadow API Server

Attacker

Custom API
Server as pod

25

#RSAC

#RSAC
DEMO: C2BERNETES
Use Kubernetes as a C2 infrastructure across multiple clusters

What is K3s?
 A lightweight Kubernetes distribution designed for resourceconstrained environments
 Runs as a single <40MB binary
 Has a simplified communication channel: only requires a single TLS connection outbound from nodes to the control plane
 This is very likely to be available and blend in with other valid traffic :)

#RSAC

K3s Control Plane

Attacker

K3s Node K3s Node

K3s

27

Kubernetes and K3s

#RSAC

Kubernetes

K3s Control Plane

Attacker

K3s Node K3s Node

K3s
28

C2: "Your cluster is also our cluster"

#RSAC

K3s Node
K3s Control Plane

K3s Node

K3s Node

Attacker

29

#RSAC

#RSAC

C2: "Cluster of Clusters"

Attacker

K3s Control Plane
K3s Node

K3s Node

K3s Node

K3s Node

32

#RSAC
K3s Node
K3s Node

#RSAC
New Kubernetes Features

#RSAC
New Kubernetes features
· Ephemeral containers - early alpha as of 1.16
-- feature - gates=EphemeralContainers=true
· Process namespace sharing - stable as of 1.17
spec: shareProcessNamespace: true
34

#RSAC
New Kubernetes features
· Dynamic Audit Sink configuration
-- feature - gates=DynamicAuditing=true
· Dynamic Kubelet configuration
-- feature - gates=DynamicKubeletConfig=true
35

#RSAC
DEMO: Bringing kubelet-exploit back
Greetz to https://github.com/kayrus/kubelet-exploit

#RSAC
What's Old Is New Again

#RSAC
Apply What You Have Learned Today
· Next week you should:
­ Alert on critical cluster audit logs for changes to webhooks, dynamic configuration items, and RBAC permissions.
­ Review feature gate flag settings and RBAC policies for correct permissions.
· In the next three to six months you should:
­ Try out new features of new Kubernetes releases in a development environment to develop a plan for upgrades and future features.
­ Implement your plan for future features as the newer versions become available to you and your environment.
38

#RSAC
You can do it!

#RSAC
Resources and Further Reading
· Attacking and Defending Kubernetes Clusters: A Guided Tour · The Path Less Traveled: Abusing Kubernetes Defaults · A Hacker's Guide to Kubernetes and the Cloud · What to Do When Your Cluster is a Cluster · CIS Kubernetes Benchmarks · k8s.io/security

