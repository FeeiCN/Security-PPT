
The Construction of Cloud Security System Facing Application

VMware CTO Senior Architect of Solutions in VMware China Excellence Centre Global Ambassador of CTO


Agenda


Trend and Requirements


Solutions


Strategy and Approach

 THE FORCES OF CYBERSECURITY

Technology Evolution


New Requirements

Security Events


Legal Compliance

 BEGIN WITH THE END IN MIND


Stay Focused


Be Adaptive

 GOAL AND APPROACH
""""
From Cloud Security to Secured Cloud

IT SPREAD OF ENTERPRISE IT

 IoT/Edge Computing

SaaS

PaaS

IaaS

 Hybrid & Multi-Cloud

 Data Center
 Security and Governance

IT SPREAD OF ENTERPRISE IT

/IOT 





/NFV





/NFV 



 /IOT



/NFV
 /IOT

 APPLICATION DEFINED

 (Distributed)
Remote Collaboration

 (Coexist)  (Heterogeneous) (Agile)

Trad. | Cloud Native

Hybrid | Multi-Cloud

DevOps

 CLOUD NATIVE SECURITY

 Data

 App

 User

 Endpoint

 Datacenter

 Cloud

 Network

 Security at Everywhere

(Rebuild)
 Software Defined  For Hybrid Cloud  Distributed Protection

(Enhance)
 Granular Control  Adaptive
 Continuous Compliance

(Automation)
 Collaboration  Integration  As a Service

- ZERO TRUST MODEL

Process Process Process


Common Services


Users

OS

 Hybrid

WEB
WEB Layer

Public


App Layer

Edge


DB Layer

- DECLARATIVE SECURITY

admin@k8s-master:~$ kubectl label pods nginx-foo-3492604561-nltrf secgroup=web -n foo Pod "nginx-nsx-3492604561-nltrf" labeled

admin@k8s-master:~$ kubectl label pods nginx-bar-2789337611-z09x2 secgroup=db -n bar pod "nginx-k8s-2789337611-z09x2" labeled

admin@k8s-master:~$ kubectl get pods --all-namespaces -Lsecgroup

NAMESPACE NAME

READY STATUS RESTARTS AGE

k8s

nginx-foo-2789337611-z09x2

1/1 Running 0

58m web

nsx

nginx-bar-3492604561-nltrf

1/1 Running 0

1h db

SECGROUP

Security Groups/ 
Security GroupPods
admin@k8s-master:~$ cat nsx-pod-policy.yaml apiVersion: extensions/v1beta1 kind: NetworkPolicy metadata:
name: nsx-demo-policy spec:
podSelector: matchLabels: app: db
ingress: - from:
- podSelector: matchLabels: app: nginx
ports: - port: 80 protocol: TCP

NSX / K8s topology
Namespace: foo
10.24.0.0/24
DB

NAT boundary

Namespace: bar
NAT boundary

10.24.1.0/24

114.4.10.0/26

Web

- MOBILITY SECURITY


Consumer Simple


Enterprise Secure

 OUR VISION

Deliver the Essential, Ubiquitous Digital Foundation
 Any Device

 Any App  Any Cloud

Cloud Native

Containerized

SaaS

Edge Computing

Traditional

Hybrid Clouds

Public Clouds

Telecom Cloud

 CYBERSECURITY ECOSYSTEM
















 
 

  





 
 

THANKS

