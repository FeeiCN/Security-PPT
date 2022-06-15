SESSION ID: ASD-W10
Practical Approaches to Cloud Native Security

Karthik Gaekwad
Principal Engineer Oracle Inc @iteration1

#RSAC

Slides are here:
http://bitly.com/cloudnative-rsa

#RSAC
Hello
· I'm Karthik Gaekwad · NOT a DBA

· https://cloudnative.oracle.com/ · Cloud Native Evangelist at Oracle Cloud · Past: Developer on the Oracle Managed Kubernetes Team

@iteration1

#RSAC
Hello
Been in Industry for 15 years. In general, I like building stuff with friends.
­ Maintainer for Gauntlt- Open source security scanner.
Love Teaching and building community.
­ Run Devopsdays Austin, Container Days, Cloud Austin. ­ Chair All Day Devops Cloud Native track. ­ LinkedIn Learning Author for Learning Kubernetes (and more).

#RSAC
I mustache you a question...

The Cloud Native Journey

Agility

Docker

Kubernetes

Core to Edge

Efficiency

Focus Applications Automation Community

Speed

Phase I Developer Focus
Container Adoption
Developer adoption Dev/Test apps Simple orchestration Individual developers

Phase II DevOps Focus

Phase III Business Focus (end-to-end)

Application Deployment
DevOps deployment Production apps Advanced orchestration Teams & lines of business
6

Intelligent Operations
End-to-end integration Digital business apps Serverless, DevSecOps, & ML Cloud native enterprises

#RSAC

#RSAC
CNCF Survey: August 2018
How Does Your Company Use Containers and Where?
Lots of adoption on dev/staging
Continued production increase

#RSAC
CNCF Survey: August 2018
How Does Your Company Use Containers and Where?
Adoption over public and on-prem

#RSAC
Kubernetes Dominates Container Management
Your company/organization manages containers with:
Winner! Kubernetes

Many Projects...

Good News, Bad News...

#RSAC
Good usage in dev/prod
But...

#RSAC
Top 5 challenges to cloud native adoption...

Monitoring

Security

Lack of Training

Cultural Challenges

Complexity

0

5

10

15

20

25

30

35

40

45

Percentages

#RSAC
Kubernetes & Cloud Native Challenges
Managing, maintaining, upgrading Kubernetes Control Plane
­ API Server, etcd, scheduler etc....
Managing, maintaining, upgrading Kubernetes Data Plane
­ In place upgrades, deploy parallel cluster etc....
Figuring out container networking & storage
­ Overlays, persistent storage etc... - it should just work
Managing Teams
­ How do I manage & control team access to my clusters?
Security, security, security
Source: Oracle Customer Survey 2018
12

How Are Teams Addressing Complexity, Training Issues?

#RSAC

Customer Managed

Fully-Managed

App Management

App Management

App Deployment

App Deployment

Scaling

YOU

Scaling

High Availability Platform Backup & Recovery
Upgrades & Patching Software Installation Server Provisioning Rack and Stack Power, HVAC

High Availability Platform Backup & Recovery
Upgrades & Patching Software Installation Server Provisioning Rack and Stack Power, HVAC

Benefits
ü Faster Time to Deploy ü Lower Risk ü Accelerate Innovation

#RSAC
Which brings us to security...

#RSAC
Where no news, is good news!

#RSAC
Unsecured K8s dashboards
Unsecured Kubernetes Dashboard with account creds. Used this to mine cryptocurrency. 2017: Aviva 2018: Tesla, Weight Watchers
https://redlock.io/blog/cryptojacking-tesla

Kubelet credentials hack

#RSAC
Shopify: Server Side request Forgery Get kubelet certs/private key Root access to any container in part of infrastructure.
https://hackerone.com/reports/341876

#RSAC
CVE's Happen...
Even more relevant with increased production usage of containers...

#RSAC
CVE's Happen...
Privilege Escalation Container Escaping

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC
WAT?

#RSAC
How did we get here?

#RSAC
"Kubernetes is too complicated"

#RSAC
"Kubernetes is too complicated"
"We hope it'll get easier"

#RSAC
WIhBwauattniwst ythooeurgreestttorbaesttteatertr?!

#RSAC
Let's look at:
Attack Surface
­ More importantly, how to limit damage
Security related features in K8s
­ The more you know, the better you build
Opensource Tooling to help
­ Because we all need help

#RSAC
Attack Surface

#RSAC
Attack Surface
Goal: Reduce the attack surface
Analysis for:
­Host(s) ­Container (Images and running) ­Kubernetes Cluster

#RSAC
Attack Surface: Host
These are the machines you're running Kubernetes on. Age old principles of Linux still apply:
­ Enable SELinux ­ AppArmor ­ Seccomp ­ Hardened Images
Goal: Minimize privilege to applications running on the host
Good news: Already a wealth of information on this subject!
­ http://lmgtfy.com/?q=how+to+reduce+attack+surface+linux

#RSAC
Attack Surface: Container Images
GOAL: Know your base image when building containers

#RSAC
Attack Surface: Container Images
GOAL: Know your base image when building containers
**BTW, this is just a ruby helloworld app

#RSAC
Attack Surface: Container Images
GOAL: Know your base image when building containers
**BTW, this is just a ruby helloworld app

#RSAC
Attack Surface: Container Images
GOAL: Know your base image when building containers
Full disclosure: I'm karthequian; I created this as a ruby 101 container for learning purposes only

#RSAC
Attack Surface: Container Images
GOAL: Know your base image when building containers When in doubt, stick to an official images!
Or start from a sane base image (example: alpine linux)

#RSAC
Attack Surface: Container Images
GOAL: Smaller the image, the better
Less things for an attacker to exploit. Quicker to push, quicker to pull.

#RSAC
Attack Surface: Container Images
GOAL: Don't rely on :latest tag
:latest image yesterday might not be :latest image tomorrow Instead, you'd want to know what specific version you're operating with.
Side benefit: If there is a new vulnerability announced for OS version x.y.z, you know immediately whether you're running that version!

#RSAC
Attack Surface: Container Images
GOAL: Check for vulnerabilities periodically
Plenty of ways to do this in registries. We'll cover more in the tooling section

#RSAC
Attack Surface: Running Containers
GOAL: Don't run as root
Containers running as root might be completely unnecessary for the actual application. If compromised, attacker can do a lot more things.. Pod security policies can help (we'll see how later).

#RSAC
Attack Surface: Running Containers
GOAL: Limit host mounts
Be wary of images that require broad access to paths on the host Limit your host mount to a smaller subset of directories Reduces blast radius on compromise

#RSAC
Attack Surface: Kubernetes Cluster

#RSAC
Kubernetes Cluster- TLS
TLS ALL THE THINGS

#RSAC
Kubernetes Cluster- TLS
TLS Checklist: 1. Nodes and
Master 2. User and Master 3. Everything etcd 4. Kubelet to API
Server

#RSAC
Kubernetes Cluster- TLS

#RSAC
Kubernetes Cluster- TLS
TLS Checklist: 1. User and Master 2. Nodes and
Master 3. Everything etcd 4. Kubelet to API
Server

#RSAC
CVE's GOAL: Have an upgrade strategy
Because...CVE's are fixed in new minor versions. Don't treat K8s as "install once, run all the time". Make your K8s install repeatable for different versions.
..Or use a Managed Provider.
­ Either automatically patch for you, or tell you what to do.
48

#RSAC
We're a little better off now.
But what else to do?

#RSAC
K8s Features
How can the platform help me make secure choices?

#RSAC
K8s Features
Kubernetes Secrets Authentication Authorization Audit Logging Network Policies Pod security policies

#RSAC
Kubernetes Secrets
GOAL: Use Kubernetes secrets to store sensitive data instead of config maps.
Also look at: secrets encryption provider.
­ Controls how etcd encrypts API data ­ --experimental-encryption-provider-config
https://kubernetes.io/docs/tasks/administer-cluster/encryptdata/

#RSAC
Authentication and Authorization
Do you know how you are authenticating with Kubernetes?
Many ways to Authenticate
­ Client Certs ­ Static token file ­ Service Account tokens ­ OpenID ­ Webhook Mode ­ And more (https://kubernetes.io/docs/reference/access-authn-authz/authentication/)

#RSAC
Goal: Pick a strategy that fits your use case
Whatever you do, DO NOT YOLO!

#RSAC
If you DO NOT YOLO...
You can pick an authz strategy..

#RSAC
Authentication and Authorization
https://kubernetes.io/docs/reference/acc ess-authn-authz/authorization/

#RSAC
Authentication and Authorization
Pro tip: Nobody uses ABAC anymore. Don't be that guy....
RBAC is the defacto standard
­ Based on roles and role bindings ­ Good set of defaults: https://github.com/uruddarraju/kubernetes-rbac-policies
Can use multiple authorizers together, but can get confusing.
­ 1st authorizer to authorize passes authz

#RSAC
Kubernetes Cluster- Audit Logs
Wat? "Kubernetes auditing provides a security-relevant chronological set of records documenting the sequence of activities that have affected system by individual users, administrators or other components of the system." Answers: What/when/who/where information on security events.
Your job: Periodically watch Kubernetes Audit logs
https://kubernetes.io/docs/tasks/debug-application-cluster/audit/

#RSAC

#RSAC
Kubernetes Cluster- Network Policies
Consider adding a network policy to the cluster...
Default Policy: All pods can talk to all other pods. Consider limiting this with a Network Policy
https://kubernetes.io/docs/concepts/services-networking/network-policies/

#RSAC
Kubernetes Cluster- Pod Security Policies
Consider adding Pod Security policies
PodSecurityPolicy: A Defined set of conditions a pod must run with. Think of this as authorization for pods.

#RSAC
Kubernetes Cluster: Pod Security Policies
Capability for an admin to
control specific actions
https://kubernetes.io/docs/concepts/policy/pod-security-policy/#what-is-a-pod-security-policy

#RSAC
Open Policy Agent
Policy based control for your whole environment. Full featured Policy Engine to offload policy decisions from each application/service.
­ Deploy OPA alongside your service ­ Add policy data to OPA's store ­ Query OPA on decisions.
Great idea, still early, watch this space... Standardize policies for all clusters https://www.openpolicyagent.org/
63

#RSAC
OToopliengnsource Tooling

#RSAC
Keep tabs on the CNCF Security landscape
https://landscape.cncf.io/landscape=security-complia

#RSAC
CNCF Projects

"The Update Framework" Is a framework or a methodology. Used for secure software updates. Based on ideas surrounding trust and integrity.

Is a project. Based on TUF. A solution to secure software updates and distribution. Used in Docker Trusted Registry.

#RSAC
Clair
Open source project for the static analysis of vulnerabilities in containers. Find vulnerable images in your repo. Built into quay.io, but you can add to your own repo.
https://github.com/coreos/clair

#RSAC

Harbor

#RSAC
Newer! CNCF Project Registry product Supports vulnerability scanning, image signing and identity control Scope is larger than clair

#RSAC
Harbor

#RSAC
Kube-bench
Checks whether a Kubernetes cluster is deployed according to security best practices. Run this after creating your K8s cluster. https://github.com/aquasecurity/kube-bench Defined by the CIS Benchmarks Docs: https://www.cisecurity.org/cis-benchmarks/ Run it against your Kubernetes Master, or Kubernetes node.

#RSAC
Kube-bench example

#RSAC
Kube-hunter
Penetration Testing tool for Kubernetes clusters. Looks for weaknesses in your cluster. 2 ways to run:
­ External to cluster (what an attacker sees) ­ Internal to cluster (install as a pod)
Active and Passive mode.
­ Active mode changes stuff (probably don't use in Prod)
Read more: https://kube-hunter.aquasec.com/
ONLY RUN ON YOUR OWN CLUSTER.
73

#RSAC
Kube-hunter
74

#RSAC
Kubesec
Helps you quantify risk for Kubernetes resources. Run against your K8s applications (deployments/pods/daemonsets etc) https://kubesec.io/ from controlplane
Can be used standalone, or as a kubectl plugin (https://github.com/stefanprodan/kubectl-kubesec)

#RSAC
Kubesec example

#RSAC
Kubeaudit
Opensourced from Shopify. Auditing your applications in your K8s cluster. https://github.com/Shopify/kubeaudit Little more targeted than Kubesec.

#RSAC

#RSAC
Kubeaudit example

#RSAC
Sonobuoy by Heptio
Sonobuoy is a diagnostic tool. Tells you whether your cluster is built correctly per best practices. vendor-agnostic conformance tests to let you test the cluster. End to End tests test that APIs required for your deployment are supported by the cluster. Can take a long time to finish (1-3 hours). https://scanner.heptio.com/
80

#RSAC
Test Output summary
Stored in a file called e2e.log
81

Put it all together...
82

#RSAC
Apply It!
Day 1: Know what version of Docker and Kubernetes you use. Understand if your control and data plane nodes are hardened. Understand how your Docker containers are built. Find out how you authenticate and authorize for your clusters.
83

#RSAC
Apply It!
Week 1: Build an Automation Pipeline:
­To build Docker images on code pushes ­Versioning strategy for code ­To build your Kubernetes clusters
84

#RSAC
Apply It!
1st Month Sanitize your code:
­ Know your base images ­ Implement versioning for your containers ­ Invest in a registry (or tooling) that does vulnerability scanning
Kubernetes:
­ Have an upgrade strategy in place ­ Analyze secrets/sensitive cluster data ­ Turn on audit logging
85

#RSAC
Apply It!
3 Months: Continuously Monitor
­ Tooling like sonobuoy/Kubesec/Kube-audit/kube-hunter//
Plan how to address vulnerabilities/CVE's K8s:
­ Strategy for Pod Security Policies ­ Strategy for Network Policies ­ Run scans (like kube-bench) on cluster creation
86

#RSAC
Apply It!
6 Months: Re-ask day 1 questions. Review strategies- is it working? What needs tweaking? Review tooling- are there new tools that help? Are existing tools working? Review CVE's
87

#RSAC
Couple more resources to look at:
11 ways not to get hacked: https://kubernetes.io/blog/2018/07/18/11-ways-not-to-gethacked
K8s security (from Image Hygiene to Network Policy): https://speakerdeck.com/mhausenblas/kubernetes-securityfrom-image-hygiene-to-network-policies

#RSAC
KEEP CALM AND
KUBE ON @iteration1

