SESSION ID: CSCS-W09
Service Mess to Service Mesh
Rob Richardson
Developer Advocate Jetpack Twitter: @rob_rich | @cyralinc https://robrich.org/ | https://www.jetpack.io/

#RSAC

@rob_rich @cyralinc

#RSAC
2

@rob_rich @cyralinc

#RSAC
3

@rob_rich @cyralinc

#RSAC
4

#RSAC
Let's talk about Service Mesh!

What Is A Service Mesh From Monolithic to Microservices The Challenge with API Gateways Deep Dive into Service Mesh Demo
­ Istio ­ Linkerd
Service Mesh Best Practices

@rob_rich @cyralinc

5

#RSAC
A Service Mesh manages network traffic between services
in a graceful and scalable way.

@rob_rich @cyralinc

6

#RSAC

Service Mesh is the answer to:
"How do I observe, control, or secure communication between microservices?"

@rob_rich @cyralinc

7

#RSAC
Service Mesh

OBSERVE monitor network
@rob_rich @cyralinc

CONTROL access policies

SECURE mutual TLS
8

#RSAC
From Monlithic to Microservices

@rob_rich @cyralinc

9

#RSAC
From North-South to East-West
North - South
­ Network to Container ­ Container to External Services
East - West
­ Between Containers

@rob_rich @cyralinc

10

#RSAC
The Challenge with API Gateways

@rob_rich @cyralinc

11

#RSAC
Service Mesh: How Does it Work?

@rob_rich @cyralinc

12

#RSAC
Service Mesh

OBSERVE monitor network
@rob_rich @cyralinc

CONTROL access policies

SECURE mutual TLS
13

#RSAC
More Than Just a Proxy

Network Topology
@rob_rich @cyralinc

Service Health

Logging
14

#RSAC
More Than Just a Proxy

Circuit Breaker
@rob_rich @cyralinc

A / B Testing

Beta Channel
15

Dashboards
@rob_rich @cyralinc

#RSAC
16

#RSAC
Prevent Unexpected Traffic Patterns

@rob_rich @cyralinc

17

#RSAC
Service Meshes
Istio Linkerd Consul Open Service Mesh

@rob_rich @cyralinc

18

#RSAC
Linkerd
Methodology
Linkerd focuses on simple setup and critical features Add 3rd party components to get additional features

@rob_rich @cyralinc

19

#RSAC
Istio

Methodology
A kitchen sink of features to enable / disable
Istio combines third-party components:
· Envoy Proxy
· Prometheus events sink
· Grafana dashboard
· Jaeger tracing dashboard

@rob_rich @cyralinc

20

#RSAC

Demo
Service Mesh · Linkerd · Istio

@rob_rich @cyralinc

21

#RSAC
In a Nutshell

Monitoring, Logging,
Service Health
@rob_rich @cyralinc

Intelligent Routing

Network Topology Diagram
22

#RSAC
Service Mesh Implementation Cost

+

@rob_rich @cyralinc

23

#RSAC
Benefits of Service Mesh

OBSERVE Transparency of communication
@rob_rich @cyralinc

CONTROL Enhanced resilience to
network disruption

SECURE Secure communication without code changes
24

#RSAC
Use a Service Mesh if:
Running highly sensitive workloads (PKI, PCI) Running untrusted workloads Running multi-tenant workloads Need security in depth Need A/B routing or a beta channel

@rob_rich @cyralinc

25

#RSAC
#RSAC
Questions?
@rob_rich | @cyralinc https://robrich.org/ | https://www.cyral.com/

@rob_rich @cyralinc

26

#RSAC
"Apply" Slide

Try it out:
­ Time-box your experiments ­ Try out many service meshes ­ Identify the one that best matches your needs
Does it make sense?
­ Do you need to observe, control, or secure your network? ­ Can you handle the additional compute costs? ­ Are you running multi-tenant, highly secure, or untrusted workloads? ­ If not, you don't need a service mesh.

@rob_rich @cyralinc

27

