Sheila A. Berta (@UnaPibaGeek) Dreamlab Technologies

Sheila A. Berta - @UnaPibaGeek Head of Research at Dreamlab Technologies
A little bit more:
- Developer in ASM (Microcontrollers & Microprocessors x86/x64), C/C++, Go & Python.
- Speaker at Black Hat (x3), DEF CON (x2), Ekoparty (x4), HITB, SCSD, IEEE... & more. - Docker Captain! (DCA Certified)

Prerequisites: https://docs.docker.com/engine/security/rootless/#distribution-specific-hint
Step 1: $ curl -fsSL https://get.docker.com/rootless | sh
Step 2: export XDG_RUNTIME_DIR=/tmp/docker-1000 export PATH=/home/<user>/bin:$PATH export DOCKER_HOST=unix:///tmp/docker-1000/docker.sock
Step 3: $ /home/<user>/bin/dockerd-rootless.sh --experimental --storage-driver vfs &

 UNIX  TCP  FD
UNIX socket /var/run/docker.sock

TCP socket

TCP socket ­ Built-in HTTPS encrypted socket
 Create a CA and server keys using OpenSSL  Run the Docker daemon with the TLS certificates.
$ dockerd --tlsverify --tlscacert=ca.pem --tlscert=server-cert.pem --tlskey=serverkey.pem -H=0.0.0.0:2376

 Create the client TLS certificates and sign them with the CA.  Connect to the remote API endpoint providing the certificates.
$ docker --tlsverify --tlscacert=ca.pem --tlscert=client-cert.pem --tlskey=clientkey.pem -H=<host>:2376 version
$ export DOCKER_HOST=tcp://<host>:2376 DOCKER_TLS_VERIFY=1

 UTS namespace: isolates system identifiers.  PID namespace: isolates the PID space.  IPC namespace: isolates IPC resources.  NET namespace: isolates network interfaces.  USER namespace: isolates user and group ID spaces (disabled by default).  Mount namespace: isolates the set of filesystem mount points.

Docker Host

Docker Container

Default Capabilities: https://github.com/moby/moby/blob/master/oci/caps/defaults.go

Fine-grained access control system
$ docker container run --cap-drop=all --cap-add=cap_net_bind_service -p 80:80 httpd

Seccomp Profiles
$ docker container run --security-opt seccomp=/path/to/seccomp/profile.json myapp https://github.com/blacktop/seccomp-gen

AppArmor / SELinux Profiles
https://github.com/genuinetools/bane $ sudo apparmor_parser -r -W /path/to/your/apparmor-nginx-profile $ docker run -d --security-opt "apparmor=apparmor-profile-name" -p 80:80 nginx

/etc/docker/daemon.json
{ "userns-remap": "default"
}

 CPU  Disk I/O  Memory  Hardware Resources

$ docker container run --rm --memory 50M -it alpine /bin/sh

--memory-swap --cpus

--cpu-quota --cpu-period

https://docs.docker.com/engine/reference/commandline/run/

DISTROLESS BASE IMAGES AND MULTI-STAGE BUILDS

FROM python:3-slim AS build-env ADD . /app WORKDIR /app

Build Stage

FROM gcr.io/distroless/python3 COPY --from=build-env /app /app WORKDIR /app CMD ["hello.py"]

Final Image

DOCKER CONTENT TRUST ­ SIGNED IMAGES
Image Publisher side:
Step 1: $ DOCKER_CONTENT_TRUST=1 Step 2: $ docker trust key generate <your_name> Step 3: $ docker trust signer add --key <your-key.pub> <your-name> <yourrepo>

DOCKER CONTENT TRUST ­ SIGNED IMAGES
Image Consumer side: $ DOCKER_CONTENT_TRUST=1

$ docker network create -d overlay back-end $ docker network create -d overlay front-end
$ docker service create -d --network back-end --name redis redis $ docker service create -d --network front-end --name nginx nginx

$ docker network create -d overlay --opt encrypted encryptednet $ docker network inspect encrypted-net Encrypted network:
Non-encrypted network:

/var/lib/docker/swarm/raft/ /var/lib/docker/swarm/certificates/swarm-node.key
$ docker swarm update --autolock=true

Kubernetes cluster's CAs:  Etcd CA  Kubernetes CA
Server Certificates:  Etcd  Kube-API server  Kubelet

Client Certificates:
 Kube-scheduler  Kube-controller  Kube-proxy  Kube-API server (etcd client)  Kube-API server (kubelet client)  Kubelet (API server client)

Kube-API Certificates:
 Etcd client  Kubelet client  Kube-api server

Kubernetes authentication mechanisms:
 Basic (user/password or token).  TLS Certificates.  LDAP, Kerberos, etc.

$HOME/.kube/config

$ openssl genrsa -out admin.key 2048
$ openssl req -new -key admin.key -subj "CN=admin/O=system:masters" \ -out admin.csr $ openssl x509 -req -in admin.csr -CA ca.crt \ -CAkey ca.key -out admin.crt

Kubernetes authorization mechanisms:
 Node  ABAC  RBAC  WebHook
RBAC objects:
 Role  Role Binding  Cluster Role  Cluster Role Binding

Role & Role Binding example role-definition.yaml

role-binding-definition.yaml

Security Context example
Pod level Container level

Network Policies examples default-deny-all.yaml

namespace-isolation.yaml

Defending Docker, Swarm and Kubernetes white papers: https://dreamlab.net/blackhat-whitepapers
· docs.docker.com · kubernetes.io/docs

Sheila A. Berta (@UnaPibaGeek) Dreamlab Technologies
sheila.berta@dreamlab.net www.dreamlab.net

