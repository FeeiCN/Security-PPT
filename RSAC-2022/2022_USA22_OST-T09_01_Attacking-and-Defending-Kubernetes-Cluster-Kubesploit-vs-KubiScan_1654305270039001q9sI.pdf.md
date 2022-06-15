#RSAC
SESSION ID: OST-T09
Attacking and Defending Kubernetes Cluster: Kubesploit vs KubiScan
Eviatar Gerzi
Sr. Security Researcher CyberArk @g3rzi

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
What We Will Talk About? Quick overview on Kubernetes Attacking surface Demonstrate attack with Kubesploit Defending k8s cluster Demonstrate defend with KubiScan 10 Tips to protect your cluster
3

#RSAC
What Does Kubernetes Do?
https://hackernoon.com/practical-introduction-to-docker-compose-d34e79c4c2b6
4

#RSAC
Who Uses Kubernetes?

https://stackshare.io/kubernetes

5

#RSAC
Attacking Kubernetes Cluster

#RSAC
Vital Target Components

Pod
Container
Node kubelet
Master (API)
etcd Cluster

If attacker controls a container, they may be able to escape and attack the node If attacker controls nodes, they also control the pods running on them and can potentially attack masters or abuse compute If attacker controls the kubelet, they control the pods
If attacker controls the master, they control your cluster
If attacker controls the etcd, they can access, modify, or destroy the cluster A cluster is set of nodes on which containers are scheduled
7

Attack Vectors
Kernel Exploit

Container Runtime Exploit

#RSAC
Kubernetes misconfiguration

Application

Network
8

#RSAC
Threat Matrix for Kubernetes

https://www.microsoft.com/security/blog/2021/03/23/secure-containerized-environments-with-updated-threat-matrix-for-

9

kubernetes/

#RSAC
Vulnerabilities from HackerOne

https://hackerone.com/hacktivity?querystring=kubernetes

10

#RSAC
Kubesploit

#RSAC
Kubesploit ­ what is it?
A cross-platform post-exploitation HTTP/2 Command & Control server and agent dedicated for containerized environments written in Golang and built on top of Merlin project by Russel Van Tuyl (@Ne0nd0g).
12

Kubesploit
Container breakout
­ Mounting ­ Docker.sock ­ CVE-2019-5736 (runC) ­ Pod escape through /var/log ­ cGroup ­ Kernel Module
Kubelet attack
­ Scan for containers with RCE ­ Execute arbitrary commands with multiple options ­ Scan for Pods and containers ­ Scan for tokens form all available containers

#RSAC
Scan for Kubernetes cluster known CVEs Kubernetes service scan Port scanning Module scanner Deepce

https://github.com/cyberark/kubesploit
13

#RSAC
Demo #1 - Kubesploit

#RSAC
15

#RSAC
Katacoda playground
https://www.katacoda.com/cyberarkcommons/scenarios/kubesploit
16

#RSAC
Mitigation
· YARA rules · Agent recording · Module mitigation table
17

#RSAC
Defending Kubernetes Cluster

#RSAC
Best practices to harden your cluster

https://static.sched.com/hosted_files/kccna18/1c/KubeCon%20NA%20-%20This%20year%2C%20it%27s%20about%20security%20-

%2020181211.pdf

19

#RSAC
KubiScan

#RSAC
KubiScan

Risky (Cluster)Roles

Risky (Cluster)RoleBindings

Risky Subject (Users, Groups and ServiceAccounts)

Risky Pods\Containers

All mounted volumes to Pods

All mounted environment variables to Pods

Privileged Pods

Other cool stuff 

https://github.com/cyberark/KubiScan

21

#RSAC
Demo #2 - KubiScan

#RSAC
23

#RSAC
10 Tips to Protect Your Kubernetes Cluster

#RSAC
1. Access to Kubelet
/var/lib/kubelet/config.yaml
Not set to "AlwaysAllow"
25

#RSAC
2. Access to ETCD
/etc/kubernetes/manifests/etcd.yaml
26

#RSAC
3. Restrict ServiceAccountToken
27

#RSAC
4. Restrict privileged containers
28

5. Use PodSecurityPolicy

#RSAC
Will be deprecated from Kubernetes 1.25. It will be replaced by Pod Security Standards (PSS). Pod Security Admission, is the mechanism that implements the PSS.
29

#RSAC
6. Use Network Policy
30

#RSAC
7. API Server AuthN & AuthZ
/etc/kubernetes/manifests/kube-apiserver.yaml Not set
31

#RSAC
8. Use RBAC
/etc/kubernetes/manifests/kube-apiserver.yaml
32

#RSAC
9. Namespace separation
33

10. Use Kubiscan

#RSAC
Containers with privileged token Privileged containers Mounts via Environment Variables Mounts via Volumes
34

#RSAC
Recommended Tools and Links
KubiScan Kubesploit Kube-bench (CIS Benchmarks) Kubestriker Kube-hunter kubescape https://github.com/magnologan/awesome-k8s-security
35

#RSAC
Summary
We reviewed common attack vectors on Kubernetes We demonstrate attacks with Kubesploit and show how it can be defended with KubiScan Follow the best practices to protect your cluster
36

#RSAC
Apply What You Have Learned Today

Next week

· Use KubiScan to protect your cluster · Follow the protections tips and implement
them

3 months
+6 months

· Search for cluster misconfiguration or insecure pods
· Use Kubesploit to test your protections
· Have a secured cluster with: - Namespace separation - No privileged containers
· Create an awareness in your organization

37

#RSAC
THANK YOU!
@g3rzi
https://github.com/cyberark/kubesploit
https://github.com/cyberark/KubiScan
38

