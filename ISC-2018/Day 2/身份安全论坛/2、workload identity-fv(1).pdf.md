Workload Identity
Evan Gilman
@evan2645

About Me
@evan2645

Academia (Network Engineering) Living in Silicon Valley
Author of "Zero Trust Networks" Working on Workload Identity

Agenda

Zero Trust Basics

Identity in the Datacenter

SPIFFE

SPIRE Overview

@evan2645

SPIRE Walkthrough

Zero Trust Basics

A

B

ATTACKER CONTROLLED
@evan2645

Zero Trust Basics

A

B

ATTACKER CONTROLLED
How to Build Reliable System?
@evan2645

Zero Trust Basics

A

B

ATTACKER CONTROLLED
Authentication! But... Need Identity
@evan2645

Process Process Process Process

Host

Provider

Security Group: sg-edcd9784

@evan2645

Vendor-Specific

Process Process Process Process

Host

IP(s): 192.168.0.1/24

Provider

Security Group: sg-edcd9784

@evan2645 IP-Based Policy Hard to Manage

Process Process Process Process

Host

IP(s): 192.168.0.1/24

Provider

Security Group: sg-edcd9784

@evan2645 IP-Based Policy Hard to Manage

Process Process Process Process

Host

IP(s): 192.168.0.1/24

Provider

Security Group: sg-edcd9784

@evan2645

Can We Trust IP???

Process Process Process Process

Host

IP(s): 192.168.0.1/24

Provider

Security Group: sg-edcd9784

@evan2645 What Are We Trying to Model?

Host Provider
@evan2645

Process Process Process Process
Process Process Process Process

Host Provider

Host Provider
@evan2645

Process Process Process Process
Process Process Process Process

Host Provider

@evan2645

Host

Provider

X

Process Process Process Process
Process Process Process Process

Host

Provider

Process Process Process Process

Host Provider
@evan2645

IP(s): 192.168.0.1/24 Security Group: sg-edcd9784

Process Process Process Process

Host Provider
@evan2645

???
IP(s): 192.168.0.1/24 Security Group: sg-edcd9784

Workload Identity
@evan2645

Identity Domains
Mesos

No Interoperability
Dell HP

Hyper-V

Kubernetes KVM

Identity Domain

@evan2645

Identity Domains
Mesos

No Interoperability
Dell HP

Hyper-V

Kubernetes KVM

Identity Domain

@evan2645

Identity Domains
Mesos

How to Bridge Domains?
Dell HP

Hyper-V

Kubernetes KVM

Identity Domain

@evan2645

Universal Workload Identity
@evan2645

SPIFFE
@evan2645

SPIFFE
Identity Issuance, Validation, Interoperability
Single Standardized Identity Domain Well-defined Authentication Semantics Identity Issuance as Infrastructure Service
@evan2645

SPIFFE
Identity Issuance, Validation, Interoperability
Single Standardized Identity Domain Well-defined Authentication Semantics Identity Issuance as Infrastructure Service
@evan2645

SPIFFE ID
spiffe://example.org/fo o
@evan2645

SPIFFE ID
spiffe://example.org/fo o
Trust Domain
@evan2645

SPIFFE ID
spiffe://example.org/fo o
Workload Identifier
@evan2645

SPIFFE Verifiable Identity Document
spiffe://example.org/fo o
@evan2645

SPIFFE Verifiable Identity Document
spiffe://example.org/fo o
@evan2645

SPIFFE Verifiable Identity Document
spiffe://example.org/fo o
@evan2645

SPIFFE Verifiable Identity Document
spiffe://example.org/fo o
@evan2645

SPIFFE Verifiable Identity Document
spiffe://example.org/fo o
@evan2645

SPIFFE Verifiable Identity Document
spiffe://example.org/fo o
@evan2645

SPIFFE Workload API
Workload Workload

Server
Workload

@evan2645

Workload Local API PrAoPvIides Identity

SPIFFE Workload API
Workload Workload

Server
Workload

Workload @evan2645Identity AvailabAlPeIon any Platform

SPIFFE Workload API
Workload Workload

Server
Workload

Workload @evan2645Identity AvailabAlPeIon any Platform

How Do I SPIFFE?
@evan2645

SPIRE
@evan2645

SPIRE
@evan2645

SPIRE
@evan2645

spire-server
Identity Mapping Node Attestation SVID Issuance
@evan2645

spire-agent
Workload Attestation Workload API

SPIRE Walkthrough

spire-server
CA

@evan2645

Plugin

SPIRE Walkthrough

spire-server

CA

Upstream CA

@evan2645

Plugin

Existing PKI (optional)

SPIRE Walkthrough

Registration API

spire-server

CA

Upstream CA

@evan2645

Plugin

Existing PKI (optional)

SPIRE Walkthrough

Example Identity Mapping

Parent ID: spiffe://example.org/k8s/cluster/foo

Selector: k8s:ns:operations

Selector: k8s:sa:mediawiki

Selector: docker:image-id:746b819f315e

SPIFFE ID: spiffe://example.org/ops/wiki

@evan2645

SPIRE Walkthrough

spire-server
Node Attestor

@evan2645

AWS

SPIRE Walkthrough
spire-agent
Node Attestor

spire-server
Node Attestor

@evan2645

AWS

SPIRE Walkthrough
spire-agent
Node Attestor

Agent Gathers "Proof" of Identity
spire-server
Node Attestor

@evan2645

AWS

SPIRE Walkthrough
spire-agent
Node Attestor

Agent Gathers "Proof" of Identity
spire-server
Node Attestor

@evan2645

AWS

SPIRE Walkthrough
spire-agent
Node Attestor

"Proof" of Identity Sent to SPIRE Server
spire-server
Node Attestor

@evan2645

AWS

SPIRE Walkthrough
spire-agent
Node Attestor

SPIRE Server Validates via API Call
spire-server
Node Attestor

@evan2645

AWS

SPIRE Walkthrough
spire-agent
Node Attestor

SPIFFE Identity is Successfully Issued
spire-server
Node Attestor

@evan2645

AWS

SPIRE Walkthrough
API Socket
spire-agent

Server

Linux Kernel @evan2645 Agent Exposes Workload API

SPIRE Walkthrough
API Socket
spire-agent

Server

Linux Kernel @evan2645Workload API is Unauthenticated

SPIRE Walkthrough
API Socket
spire-agent

Server
Workload

Linux Kernel @evan2645 Out-Of-Band Interrogation

SPIRE Walkthrough
API Socket
spire-agent

Server
Workload

Linux Kernel @evan2645Identify Process via Linux Syscall

SPIRE Walkthrough
API Socket
spire-agent

Server
Workload

Linux Kernel @evan2645 Interrogation Logic is Pluggable

SPIRE Walkthrough
API Socket
spire-agent

Server
Workload

Linux Kernel @evan2645 Interrogation Logic is Pluggable

SPIRE Walkthrough

kubelet spire-agent

API Socket

Server
Workload

Linux Kernel @evan2645 Interrogation Logic is Pluggable

SPIRE Walkthrough

kubelet spire-agent

API Socket

Server
Workload

Linux Kernel @evan2645 AWS + Kernel: Trusted 3rd Party

SPIRE Secure Introduction
@evan2645

SPIRE Secure Introduction
@evan2645

In Summary
@evan2645

Looking Forward
@evan2645

Join Our Community
VERY Active Community 150+ Participants, 40+ Companies Special Interest Group Meetings Active Standards + Software Development
@evan2645

Play Today
@evan2645

spiffe/spiffe spiffe/spire spiffe/spiffe-example slack.spiffe.io

Workload Identity
Evan Gilman
@evan2645

