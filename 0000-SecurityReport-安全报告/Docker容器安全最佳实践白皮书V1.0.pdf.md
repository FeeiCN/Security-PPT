Docker  
V1.O
2018  5 
--------------------------------------------------------------------------------------------  Dosec  CIS  docker  docker  : DoSec 

Docker V1.0


1. .........................................................................................................................6
1.1 .......................................................................................................... 6 1.2  ................................................................................................................................ 7 1.3  docker  .................................................................................................................. 8 1.4  docker  ......................................................................... 9 1.5  docker .....................................................................................................................10 1.6  docker -/var/lib/docker.................................................................................11 1.7  docker -/etc/docker .......................................................................................12 1.8  docker -docker.service ..................................................................................13 1.9  docker -docker.socket...................................................................................14 1.10  docker -/etc/default/docker .....................................................................15 1.11  docker -/etc/docker/daemon.json..........................................................16 1.12  docker -/usr/bin/docker-containerd......................................................17 1.13  docker -/usr/bin/docker-runc..................................................................18
2.docker ...................................................................................................... 19
2.1 .......................................................................................19 2.2  info .......................................................................................................................20 2.3  docker  IPtables .............................................................................................................21 2.4  .............................................................................................................22 2.5  aufs  ............................................................................................................23 2.6 docker  TLS  ..........................................................................................24 2.7  ulimit.............................................................................................................................25 2.8  ...........................................................................................................................26 2.9  cgroup ..............................................................................................................................28 2.10  ...........................................................................................................29 2.11  docker  ................................................................................................30 2.12  ...........................................................................................................31 2.13 v1 .............................................................................................32 2.14 ..................................................................................................................................33 2.15  userland  ........................................................................................................................34

©dosec 

2

Docker V1.0
2.16  seccomp  ................................................................35 2.17  ......................................................................................................36 2.18 ................................................................................................................37
3.docker ............................................................................................. 38
3.1  docker.service  root:root ......................................................................38 3.2  docker.service  644 .............................................................39 3.3  docker.socket  root:root ...........................................................................40 3.4  docker.socket  644 ..............................................................41 3.5 /etc/docker  root:root.................................................................................42 3.6 /etc/docker  755  ...................................................................43 3.7  rootroot...................................................................................44 3.8  444 .........................................................................45 3.9  TLS CA  rootroot............................................................................46 3.10  TLS CA  444  ...............................................................47 3.11  docker  rootroot ............................................................48 3.12  docker  444 .......................................................49 3.13  docker  rootroot ...................................................50 3.14  docker  400 .....................................................................51 3.15  docker.sock  rootdocker ....................................................................52 3.16  docker.sock  660  ...............................................................53 3.17  daemon.json  rootroot .......................................................................54 3.18  daemon.json  644 .............................................................55 3.19 /etc/default/docker  rootroot ...........................................................56 3.20 /etc/default/docker  644  .................................................57
4  ......................................................................................................... 58
4.1 ................................................................................................................................58 4.2  .............................................................................................................59 4.3 ................................................................................................59 4.4  .........................................................................61 4.5  docker .....................................................................................................................62 4.6  HEALTHCHECK  ..................................................................................63 4.7  dockerfile  ........................................................................................64

©dosec 

3

Docker V1.0
4.8  setuid  setgid ...............................................................................................65 4.9  dockerfile  copy  add......................................................................................66 4.10  dockerfile ....................................................................................................67 4.11  ...........................................................................................................68
5  .................................................................................................................. 69
5.1  AppArmor  .............................................................................................................69 5.2  SElinux  ....................................................................................................................71 5.3 linux ........................................................................................................73 5.4 ................................................................................................................................75 5.5  .....................................................................................76 5.6 SSH .......................................................................................................................77 5.7 .........................................................................................................78 5.8  ...........................................................................................................................79 5.9 .........................................................................................................80 5.10  ...........................................................................................................81 5.11  CPU  ................................................................................................82 5.12 ..................................................................................................84 5.13  ......................................................................86 5.14  on-failure  5...........................................................................................87 5.15  .............................................................................................88 5.16  IPC .......................................................................................................89 5.17  ......................................................................................................90 5.18  ulimit .....................................................................................92 5.19  ...........................................................................................................93 5.20  UTS  ............................................................................................94 5.21  seccomp ............................................................................................95 5.22docker exec  ........................................................................................95 5.23docker exec  user  .........................................................................97 5.24  cgroug ..................................................................................................................98 5.25  ...........................................................................................................99 5.26  ................................................................................................................. 100 5.27  docker  ...................................................................... 101

©dosec 

4

Docker V1.0
5.28  PID cgroup................................................................................................................. 102 5.29  docker  docker0................................................................................. 103 5.30  ................................................................................................... 104 5.31  docker .................................................................................... 105
6 docker ............................................................................................................. 106
6.1  ................................................................................................................................. 106 6.2  ................................................................................................................................. 108
7 docker ............................................................................................................. 109
7.1 ............................................................................................................................. 109 7.2  ........................................................................................ 110 7.3 ............................................................................................. 111 7.4  ................................................................................................. 112 7.5  Swarm  ............................................................................................... 113 7.6 swarm manager  .............................................................................. 114 7.7 swarm manager .......................................................................... 115 7.8  ........................................................................................................................ 116 7.9CA ..................................................................................................... 117

©dosec 

5

Docker V1.0
1.

1.1 



  
  

 Docker /var/lib/docker   /var/lib/docker /  /var  Docker /var/lib/docker  Docker   Docker  Docker   grep /var/lib/docker /etc/fstab /var/lib/docker   docker /var/lib/docker  LVM None /var/lib/docker /  /var  http://www.projectatomic.io/docs/docker-storage-recommendation

©dosec 

6

Docker V1.0

1.2 



  
 


 Linux           
 
  None  1.https://docs.docker.com/engine/security/security/ 2. https://learn.cisecurity.org/benchmarks 3.https://docs.docker.com/engine/security/security/#other-kernel-securityfeatures 4. https://grsecurity.net/ 5. https://en.wikibooks.org/wiki/Grsecurity 6. https://pax.grsecurity.net/ 7. http://en.wikipedia.org/wiki/PaX

©dosec 

7

Docker V1.0

1.3  docker 



  
  

Docker   Docker Docker      Docker  Docker       Docker  Docker version   Docker   Docker  Docker    Docker  Docker  1. https://docs.docker.com/engine/installation/ 2. https://github.com/moby/moby/releases/latest 3. https://github.com/docker/docker-ce/releases/latest

©dosec 

8

Docker V1.0

1.4  docker 



  
 


Docker 'root' "docker" "root" Docker  Docker    /     "docker"  /   docker  docker   getent group docker  docker  'docker'     1.https://docs.docker.com/engine/security/security/#docker-daemonattack-surface 2.https://www.andreas-jung.com/contents/on-docker-security-dockergroup-considered-harmful 3.http://www.projectatomic.io/blog/2015/08/why-we-dont-let-non-rootusers-run-docker-in-centos-fedora-or-rhel/

©dosec 

9

Docker V1.0

1.5  docker 

   

  

 Docker   Linux  Docker   Docker 'root'    Docker   auditctl -l | grep / usr/bin/docker  Docker   Docker  /etc/audit/audit.rules  auditctl -w / usr / bin / docker -k docker   server auditd restart     Docker  1.https://access.redhat.com/documentation/enUS/Red_Hat_Enterprise_Lin ux/6/html/Security_Guide/chap-system_auditing.html

©dosec 

10

Docker V1.0

1.6  docker -/var/lib/docker

 
 

  

 /var/lib/docker.  Linux  Docker   Docker 'root'   /var/lib/docker    docker  /var/lib/docker  auditctl -l | grep /var/lib/docker /var/lib/docker  /var/lib/docker   /etc/audit/audit.rules  -w/var/lib/docker -k docker   service auditd restart     Docker  1.https://access.redhat.com/documentation/enUS/Red_Hat_Enterprise_Lin ux/6/html/Security_Guide/chap-system_auditing.html

©dosec 

11

Docker V1.0

1.7  docker -/etc/docker

 
 

  

 /etc/docker  Linux  Docker   Docker 'root'   /etc/docker   Docker  Docker  TLS  / etc / docker  auditctl -l | grep /etc/docker / etc / docker  /etc/docker   /etc/audit/audit.rules  -w / etc / docker -k docker   servise auditd restart     Docker  1.https://access.redhat.com/documentation/enUS/Red_Hat_Enterprise_Lin ux/6/html/Security_Guide/chap-system_auditing.html

©dosec 

12

Docker V1.0

1.8  docker -docker.service

 
  
  

 docker.service  Linux  Docker  Docker "root"   docker.service    docker.service    Docker   1systemctl show -p FragmentPath docker.service  2   auditctl -l | grep docker.service  docker.service   /etc/audit/audit.rules  -w /usr/lib/systemd/system/docker.service -k docker   servise auditd restart     Docker   docker.service  1.https://access.redhat.com/documentation/enUS/Red_Hat_Enterprise_Lin ux/6/html/Security_Guide/chap-system_auditing.html

©dosec 

13

Docker V1.0

1.9  docker -docker.socket

 
  
  

 docker.socket  Linux  Docker  Docker "root"   docker.socket    docker.socket    Docker   1systemctl show -p FragmentPath docker.socket  2   auditctl -l | grep docker.socket  docker.socket  . /etc/audit/audit.rules : -w /usr/lib/systemd/system/docker.socket -k docker  service auditd restart     Docker   docker.socket  1.https://access.redhat.com/documentation/enUS/Red_Hat_Enterprise_Lin ux/6/html/Security_Guide/chap-system_auditing.html

©dosec 

14

Docker V1.0

1.10  docker -/etc/default/docker

 
 

  

 /etc/default/docker,  Linux  Docker  Docker "root"   / etc / default / docker    Docker  / etc / default / docker  auditctl -l | grep / etc / default / docker / etc / default / docker  . /etc/audit/audit.rules : -w /etc/default/docker -k docker  service auditd restart     Docker  / etc / default / docker   1.https://access.redhat.com/documentation/enUS/Red_Hat_Enterprise_Lin ux/6/html/Security_Guide/chap-system_auditing.html

©dosec 

15

Docker V1.0

1.11  docker -/etc/docker/daemon.json

  /etc/docker/daemon.json, 

 Linux  Docker 

  Docker "root" 



 /etc/docker/daemon.json  

Docker 

/etc/docker/daemon.json 

auditctl -l | grep /etc/docker/daemon.json

 /etc/docker/daemon.json 

 /etc/docker/daemon.json  

 /etc/audit/audit.rules 

-w /etc/docker/daemon.json -k docker

  service auditd restart



   



Docker .  /etc/docker/daemon.json  



1.https://access.redhat.com/documentation/en-

US/Red_Hat_Enterprise_Linux/6/html/Security_Guide/chapsystem_auditing.html

2.https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-

configuration-file

©dosec 

16

Docker V1.0

1.12  docker -/usr/bin/docker-containerd

    
 


 /usr/bin/docker-containerd,   Linux  Docker  Docker "root"  /usr/bin/docker-containerd  . Docker  containerd  runC  / usr / bin / docker-containerd   auditctl -l | grep / usr / bin / docker-containerd / usr / bin / docker-containerd   /usr/bin/docker-containerd    /etc/audit/audit.rules : -w /usr/bin/docker-containerd -k docker   service auditd restart     Docker .  /usr/bin/dockercontainerd    1.https://access.redhat.com/documentation/enUS/Red_Hat_Enterprise_Linux/6/html/Security_Guide/chapsystem_auditing.html https:/github.com/docker/docker/pull/20662 https:/containerd.tools/

©dosec 

17

Docker V1.0

1.13  docker -/usr/bin/docker-runc

    
 


 /usr/bin/docker-runc, .  Linux  Docker  Docker "root"  /usr/bin/docker-runc   Docker  containerd  runC  /usr/bin/docker-runc 
 auditctl -l | grep /usr/bin/docker-runc /usr/bin/docker-runc  /usr/bin/docker-runc  /etc/audit/audit.rules  -w /usr/bin/docker-runc -k docker   service auditd restart     Docker  / usr / bin / dockerrunc   1.https://access.redhat.com/documentation/enUS/Red_Hat_Enterprise_Linux/6/html/Security_Guide/chapsystem_auditing.html 2.https://github.com/docker/docker/pull/20662 3.https://containerd.tools/ 4.https://github.com/opencontainers/runc

©dosec 

18

Docker V1.0
2.docker 

2.1 

 

   





  



 



 docker

 network ls --quiet | xargs docker network inspect -- format'{{.Name}}

{{.Options}}'

  com.docker.network.bridge.enable_iccfalse

 docker --icc = false 

dockerd --icc = false

  Docker 

 --icc 





  

 

1.https://docs.docker.com/engine/userguide/networking/
 2.https://docs.docker.com/engine/userguide/networking/default_network/contai

ner-communication/#communication-between-containers

©dosec 

19

Docker V1.0

2.2  info



  
  

 Docker "info"  Docker  "info"  'debug' Docker  ps -ef | grep dockerd --log-level  info  Docker  dockerd --log-level ="info" None. Docker "info" 1.https://docs.docker.com/edge/engine/reference/commandline/dockerd/

©dosec 

20

Docker V1.0

2.3  docker  IPtables



Iptables  Linux  IP   Docker  iptables

Docker  iptables 

   Docker  iptables



 

 iptables 

 ps -ef | grep dockerd

 '--iptables''false'
'--iptables = false' Docker 
  Docker 
dockerd --iptables = false Docker  iptables   Docker 
  iptables  docker  
iptables-persistent  iptables 
 'iptables''true'
1.https://docs.docker.com/engine/userguide/networking/default_network/contai
 ner-communication/
2.https://fralef.me/docker-and-iptables.html

©dosec 

21

Docker V1.0

2.4 



  
  

Docker   TLS /etc/docker/certs.d/<registryname>/ CA  Docker    TLS     "docker pull""docker push""docker search"   ps -ef | grep dockerd "--insecure-registry"   Docker  dockerd - insecure-registry 10.1.0.0/16 None. Docker  1.https://docs.docker.com/registry/insecure/

©dosec 

22

Docker V1.0

2.5  aufs 

 'aufs' Docker 

`aufs'  Linux 

 

 Linux  'aufs' 'aufs  Docker , overlay2 
devicemapper  Linux 

'aufs'

'aufs'

docker info | grep -e "^Storage Driver:\s*aufs\s*$"

 

'aufs'

  Docker 

dockerd --storage-driver aufs



aufs'  



Docker "overlay2""devicemapper"   



1.https://docs.docker.com/engine/userguide/storagedriver/selectadriver/#suppor

ted-backing-filesystems

2.http://muehe.org/posts/switching-docker-from-aufs-to-devicemapper/

3.http://jpetazzo.github.io/assets/2015-03-05-deep-dive-into-docker-storage-

drivers.html#1

4.https://docs.docker.com/engine/userguide/storagedriver/

©dosec 

23

Docker V1.0

2.6 docker  TLS 



  
  

 Docker  IP  Unix   Unix   TLS  IP   Docker  Docker  Unix  "root"  docker  TCP  Unix   Docker    Docker  IP / Unix   Docker  Docker Swarm API  TLS  ps -ef | grep dockerd  · '--tlsverify' · '--tlscacert' · '--tlscert' · '--tlskey'  Docker   Docker  Docker   TLS  1.https://docs.docker.com/engine/security/https/

©dosec 

24

Docker V1.0

2.7  ulimit


 


 ulimit  ulimit  shell    fork     Docker  ulimit  ulimit   ulimit  ulimit   ulimit ps -ef | grep dockerd

 '--default-ulimit'

 docker ulimits '--default-ulimit'



 dockerd --default-ulimit nproc = 10242408 --default-ulimit nofile =

100200



 ulimits  

  ulimit

1.https://docs.docker.com/edge/engine/reference/commandline/dockerd/#defa

ult-ulimits

©dosec 

25

Docker V1.0

2.8 

 
 
  


 Docker    root   Docker  Linux  Docker    ID  ID  root  root  UID  ps -p $(docker inspect --format='{{ .State.Pid }}' <CONTAINER ID>) -o pid,user  ps -p $(docker inspect --format='{{ .State.Pid }}' a4723347b65b) -o pid,user  PID   root   docker info  docker info --format='{{.SecurityOptions}}'  Docke  
 Red Hat  UID  GID     1 / etc / subuid / etc / subgid  touch / etc / subuid / etc / subgid  2 --userns-remap  docker  dockerd dockerd --userns-remap = default  Docker  Docker   1.http://man7.org/linux/man-pages/man7/user_namespaces.7.html 2.https://docs.docker.com/engine/reference/commandline/dockerd/#daem

©dosec 

26

Docker V1.0
on-user-namespace-options 3.http://events.linuxfoundation.org/sites/events/files/slides/User%20Name spaces%20-%20ContainerCon%202015%20-%2016-9-final_0.pdf

©dosec 

27

Docker V1.0

2.9  cgroup



--cgroup-parent  cgroup parent ,

 cgroup 



cgroup docker cgroup     cgroup



 

ps -ef | grep dockerd '--cgroup-parent' cgroup



  cgroup -cgroup-parent  docker  

dockerd --cgroup-parent = / foobar



None



docker / docker for fs cgroup driver  system.slice for systemd cgroup 



1.https://docs.docker.com/engine/reference/commandline/dockerd/#defaultcgroup-parent

©dosec 

28

Docker V1.0

2.10 



 10G  

 

 



 ps -ef | grep dockerd

 --storage-opt dm.basesize 

 --storage-opt dm.basesize



None



 10G



1.https://docs.docker.com/engine/reference/commandline/dockerd/#storagedriver-options

©dosec 

29

Docker V1.0

2.11  docker 



  
  

 Docker  Docker   Docker  Docker   Docker  Docker   Docker  API    Docker  Docker  Docker Docker   Docker  KubernetesCloud FoundryOpenshift Docker  ps -ef | grep dockerd  docker --authorization-plugin    1 /  2   3  docker dockerd --authorizationplugin = <PLUGIN_ID>   1.https://docs.docker.com/engine/reference/commandline/dockerd/#accessauthorization 2.https://docs.docker.com/engine/extend/plugins_authorization/ 3.https://github.com/twistlock/authz

©dosec 

30

Docker V1.0

2.12 

   

  

Docker      Docker   docker info  docker info --format '{{ .LoggingDriver }}'  --log-driver  ps -ef | grep dockerd  1   2  docker  dockerd --log-driver = syslog --log-opt syslog-address = tcp //192.xxx.xxx.xxx None.  json  1.https://docs.docker.com/engine/admin/logging/overview/

©dosec 

31

Docker V1.0

2.13 v1



 Docker  v2 v1 

Docker  v2  v1  

   Docker V1 



 ps -ef | grep dockerd



--disable-legacy-registry  docker  



 docker  dockerd --disable-legacy-registry





 

1.https://docs.docker.com/edge/engine/reference/commandline/dockerd/#lega

cy-registries

2.https://docs.docker.com/registry/spec/api/



3.https://the.binbashtheory.com/creating-private-docker-registry-2-0-withtoken-authentication-service/

4.https://blog.docker.com/2015/07/new-tool-v1-registry-docker-trusted-

registry-v2-open-source/

5.http://www.slideshare.net/Docker/docker-registry-v2

©dosec 

32

Docker V1.0

2.14 



  
  

-live-restore   Docker daemon     Docker '--liverestore' docker    docker   docker info  Live Restore Enabled  true docker info --format '{{ .LiveRestoreEnabled }}' --live-restore ps -ef | grep dockerd  docker '--live-restore' dockerd --live-restore None --live-restore  1. https://docs.docker.com/engine/admin/live-restore/

©dosec 

33

Docker V1.0

2.15  userland 



docker  userland-proxy   DNAT 

Docker ,DNAT  userland-

 proxy DNAT 



 Linux iptables 

 DNAT  userland-proxy 

 ps -ef | grep dockerd

 --userland-proxy  false

  Docker dockerd --userland-proxy = false



 Linux  DNAT userland-prox    userland-prox 

 userland-prox 

1.http://windsock.io/the-docker-proxy/

2.https://github.com/docker/docker/issues/14856
 3 https://github.com/docker/docker/issues/22741

4.https://docs.docker.com/engine/userguide/networking/default_network/bindi

ng/

©dosec 

34

Docker V1.0

2.16  seccomp 



  
  

 seccomp   Docker  seccomp       seccomp  Docker  seccomp    Docker   "SecurityOptions" seccomp    Docker  seccomp   docker info ­format='{{.SecurityOptions}}'  seccomp  Docker  seccomp     seccomp --seccomp-profile   dockerd --seccompprofile </ path / to / seccomp / profile>  seccomp  Docker     Docker  seccomp  1. https://docs.docker.com/engine/security/seccomp/ 2. https://github.com/docker/docker/pull/26276

©dosec 

35

Docker V1.0

2.17 



-Experimental

docker  docker , 

 docker  

 API 





 Server  Experimental  false docker version ­format='{{.Server.Experimental}}'

  false

 --experimental  docker 



None

 docker 

1.https://docs.docker.com/edge/engine/reference/commandline/dockerd/#opti

ons

©dosec 

36

Docker V1.0

2.18 



  
  

 suid  sgid   no_new_priv  forkclone  execve no_new_priv  suid  sgid     ps -ef | grep dockerd --no-new-privileges  false  Docker dockerd --no-new-privileges no_new_priv  SELinux  LSM   1. https://github.com/moby/moby/pull/29984 2. https://github.com/moby/moby/pull/20727

©dosec 

37

Docker V1.0
3.docker 

3.1  docker.service  root:root

 

 
  

'docker.service'"root" docker.service' Docker  "root"  1 systemctl show -p FragmentPath docker.service  2   root   stat -c %U:%G /lib/systemd/system/docker.service | grep -v root:root   1systemctl show -p FragmentPath docker.service  2   "root" chown root:root /usr/lib/systemd/system/docker.service None.     "root" 1. https://docs.docker.com/engine/admin/systemd/

©dosec 

38

Docker V1.0

3.2  docker.service  644 

 

 
  

'docker.service''644' docker.service' Docker  "root"  1 systemctl show -p FragmentPath docker.service  2   644    stat -c %a /etc/systemd/system/docker.service  644  1systemctl show -p FragmentPath docker.service  2  '644' chmod 644 /usr/lib/systemd/system/docker.service None.    '644' 1. https://docs.docker.com/articles/systemd/

©dosec 

39

Docker V1.0

3.3  docker.socket  root:root

 


'docker.socket'"root" docker.socket  Docker  API   "root"

 1systemctl show -p FragmentPath docker.socket



 2  "root"

stat -c %U:%G /lib/systemd/system/docker.service | grep -v root:root

 

 1systemctl show -p FragmentPath docker.socket

 2 

 

"root"

chown rootroot /usr/lib/systemd/system/docker.socket



None.



   "root"

1.https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-

socket-option

2.https://github.com/docker/docker-

ce/blob/master/components/packaging/deb/systemd/docker.socket

©dosec 

40

Docker V1.0

3.4  docker.socket  644 

 
  
 


'docker.socket''644' docker.socket' Docker  API  'root'  1systemctl show -p FragmentPath docker.socket  2  "644"  stat ­c%a /usr/lib/systemd/system/docker.socket  644  1systemctl show -p FragmentPath docker.socket  2  '644' chmod 644 /usr/lib/systemd/system/docker.socket None.    '644' 1.https://docs.docker.com/engine/reference/commandline/dockerd/#binddocker-to-another-hostport-or-a-unix-socket 2.https://github.com/YungSang/fedora-atomicpacker/blob/master/oem/docker.socket 3.http://daviddaeschler.com/2014/12/14/centos-7rhel-7-and-dockercontainers-on-boot/

©dosec 

41

Docker V1.0

3.5 /etc/docker  root:root

 
  
  

/ etc / docker "root" '/ etc / docker'  "root" "root" stat -c %U:%G /etc/docker | grep -v root:root  chown rootroot / etc / docker "root" None. "root" 1. https://docs.docker.com/engine/security/https/

©dosec 

42

Docker V1.0

3.6 /etc/docker  755 

 
  
  

/ etc / docker '755' / etc / docker'  'root' "755" stat -c%a /etc/docker | grep -v root:root  755 chmod 755 / etc / docker '755' None. '755' 1. https://docs.docker.com/engine/security/https/

©dosec 

43

Docker V1.0

3.7  rootroot

 
  
  

/etc/docker/certs.d/ <registry-name> "root" /etc/docker/certs.d/ <registry-name> Docker  "root" "root" Groupowned  stat -c %U:%G /etc/docker/certs.d/* | grep -v root:root  chown rootroot /etc/docker/certs.d/<registry-name>/* "root" None.  "root" 1. https://docs.docker.com/registry/insecure/

©dosec 

44

Docker V1.0

3.8  444 



  
  

/etc/docker/certs.d/ <registryname>"444" /etc/docker/certs.d/ <registry-name> Docker  "444" "444" stat ­c%a /etc/docker/certs.d/<registry-name>/*  444 "chmod 444 /etc/docker/certs.d/<registry-name>/* '444' None. "444"   umask  1. https://docs.docker.com/registry/insecure/

©dosec 

45

Docker V1.0

3.9  TLS CA  rootroot



  
  

 TLS CA --tlscacert' "root" TLS CA   CA   "root" CA   TLS CA "root" stat ­c %U:%G < TLS CA > | grep -v root:root  chown rootroot < TLS CA >  TLS CA "root" None. TLS CA "root" 1. https://docs.docker.com/registry/insecure/ 2. https://docs.docker.com/engine/security/https/

©dosec 

46

Docker V1.0

3.10  TLS CA  444 

    
  

 TLS CA --tlscacert' "444" TLS CA  "444" CA   TLS CA "444" stat ­c%a < TLS CA >  444 chmod 444 < TLS CA >  TLS CA '444' None. TLS CA "444"   umask  1. https://docs.docker.com/registry/insecure/ 2. https://docs.docker.com/engine/security/https/

©dosec 

47

Docker V1.0

3.11  docker  rootroot

 
  
  

 Docker --tlscert' "root" Docker   Docker  "root"  Docker "root"  stat ­c %U:%G < Docker > | grep -v root:root  "chown root:root < Docker >  Docker "root" None. Docker  "root" 1.https:/docs.docker.com/registry/insecure/ 2. https://docs.docker.com/engine/security/https/

©dosec 

48

Docker V1.0

3.12  docker  444 

 
  
  

 Docker --tlscert' "444" Docker   "444"  Docker "444"  stat ­c %a <Docker >  444 chmod 444 < Docker >  Docker '444' None. Docker "444"   umask  1. https://docs.docker.com/registry/insecure/ 2. https://docs.docker.com/engine/security/https/

©dosec 

49

Docker V1.0

3.13  docker  rootroot



  
  

 Docker --tlskey' "root" Docker    Docker  "root"  Docker   Docker "root" stat ­c %U:%G < Docker > | grep -v root:root  chown root:root < Docker >  Docker  "root" None. Docker  "root" 1. https://docs.docker.com/registry/insecure/ 2. https://docs.docker.com/engine/security/https/

©dosec 

50

Docker V1.0

3.14  docker  400



  
  

 Docker --tlskey' "400" Docker    Docker  "400"  Docker   Docker "400"  stat ­c%a <Docker >  400 chmod 400 < Docker >  Docker "400" None. Docker "400"  umask  1. https://docs.docker.com/registry/insecure/ 2. https://docs.docker.com/engine/security/https/

©dosec 

51

Docker V1.0

3.15  docker.sock  rootdocker



 Docker sock "root""docker"

Docker  root   Unix 

root  

 Docker  

 

 

Docker  docker    Docker Unix  docker

 

 Docker 

 Docker Unix  docker 



 Docker "root""docker"

 

stat ­c %U:%G /var/run/docker.sock | grep -v root:docker

 



chown rootdocker /var/run/docker.sock "root""docker" Docker 





None.



Docker "root docker"

1.https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-

socket-option

2.https://docs.docker.com/engine/reference/commandline/dockerd/#bind-

docker-to-another-hostport-or-a-unix-socket

©dosec 

52

Docker V1.0

3.16  docker.sock  660 



 Docker "660"

 

'root''docker' Docker Unix  Docket "660"



 Docker "660" stat ­c%a /var/run/docker.sock

  660



chmod 660 /var/run/docker.sock  Docker '660'



None.

 Docker '660'

1.https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-

socket-option

2.https://docs.docker.com/engine/reference/commandline/dockerd/#bind-

docker-to-another-hostport-or-a-unix-socket

©dosec 

53

Docker V1.0

3.17  daemon.json  rootroot



'daemon.json'"root"

 

daemon.json' docker   "root"



"root" stat ­c %U:%G /etc/docker/daemon.json | grep -v root:root

 



chown rootroot /etc/docker/daemon.json "root"



None.

  

1.https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-

configuration-file

©dosec 

54

Docker V1.0

3.18  daemon.json  644 



'daemon.json''644'

 

daemon.json' docker   'root'



"644" stat ­c%a /etc/docker/daemon.json

  644



chmod 644 /etc/docker/daemon.json '644'



None.

  

1.https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-

configuration-file

©dosec 

55

Docker V1.0

3.19 /etc/default/docker  rootroot



  
  

"/ etc / default / docker" "root" /etc/default/docker  docker   "root" "root" stat -c%U:%G /etc/default/ docker | grep -v root:root  chown root:root /etc/default/docker "root" None.   1. https://docs.docker.com/engine/admin/configuring/

©dosec 

56

Docker V1.0

3.20 /etc/default/docker  644 

 
  
  

/etc/default/docker''644' /etc/default/docker  docker   'root' "644" stat ­c%a /etc/default/docker  644 chmod 644 / etc / default / docker '644' None.   1. https://docs.docker.com/engine/admin/configuring/

©dosec 

57

Docker V1.0
4 

4.1 

   

  

 Dockerfile  root   root      docker ps --quiet | xargs docker inspect --format '{{ .Id }}: User={{.Config.User}}'  ID  root   Dockerfile USER < ID>  ID    USER  useradd    Dockerfile  RUN useradd -d /home/username -m -s / bin / bash username USER username    None.  root  root   1. https://github.com/docker/docker/issues/2918 2. https://github.com/docker/docker/pull/4572 3. https://github.com/docker/docker/issues/7906

©dosec 

58

Docker V1.0

4.2 

 

 
 


   Docker  Docker     Docker    1  -  Docker  Docker  docker images  Docker     TAG   2 -  Docker  Docker  docker history <imageName>   Docker   Docker   Docker  None.  1. https://titanous.com/posts/docker-insecurity 2. https://registry.hub.docker.com/ 3.http://blog.docker.com/2014/10/docker-1-3-signed-images-processinjection-security-options-mac-shared-directories/ 4. https://github.com/docker/docker/issues/8093 5. https://docs.docker.com/engine/reference/commandline/pull/ 6. https://github.com/docker/docker/pull/11109 7. https://blog.docker.com/2015/11/docker-trusted-registry-1-4/

4.3 



 

©dosec 

59

Docker V1.0



 
  

   1docker ps -quiet  2docker exec $ INSTANCE_ID rpm ­qa  docker exec $ INSTANCE_ID dpkg ­l     Redhat / Centos / Debian   BusyBox  Alpine > 150Mb  20 Mb   None.  1. https://docs.docker.com/userguide/dockerimages/ 2.http://www.livewyer.com/blog/2015/02/24/slimming-down-your-dockercontainers-alpine-linux 3. https://github.com/progrium/busybox

©dosec 

60

Docker V1.0

4.4 

 
  
  

         1docker ps -quiet  2   docker exec $ INSTANCE_ID rpm ­qa   DoSec 
  1  Dockerfiles FROM  /  2 docker build --no-cache  3   Dockerfile  ONBUILD   None.  1. https://docs.docker.com/userguide/dockerimages/ 2. https://docs.docker.com/docker-cloud/builds/image-scan/ 3. https://blog.docker.com/2016/05/docker-security-scanning/ 4. https://docs.docker.com/engine/reference/builder/#/onbuild

©dosec 

61

Docker V1.0

4.5  docker 





 Docker 

  



 echo $DOCKER_CONTENT_TRUST

  1

 bash shell 

 export DOCKER_CONTENT_TRUST = 1



 DOCKER_CONTENT_TRUST 



 -  --disablecontent-trust 







1. https://docs.docker.com/engine/security/trust/content_trust/



2. https://docs.docker.com/engine/reference/commandline/cli/#notary 3.https://docs.docker.com/engine/reference/commandline/cli/#environment-

variables

©dosec 

62

Docker V1.0

4.6  HEALTHCHECK 



  
  

 Docker  HEALTHCHECK     HEALTHCHECK   docker  docker    docker  HEALTHCHECK  docker inspect --format ='{{.Config.Healthcheck}}'< ID>   Docker  HEALTHCHECK  None. HEALTHCHECK  1. https://docs.docker.com/engine/reference/builder/#healthcheck

©dosec 

63

Docker V1.0

4.7  dockerfile 

 
  
  

 apt-get update  Dockerfile    Dockerfile      1 docker images  2  docker history <Image_ID>  Dockerfile    docker --no-cache   None. docker  1.https://docs.docker.com/engine/userguide/eng-image/dockerfile_bestpractices/#run 2. https://github.com/docker/docker/issues/3313

©dosec 

64

Docker V1.0

4.8  setuid  setgid 



 setuid  setgid 



setuid  setgid   

 setuid  setgid 

 docker run <Image_ID> find / -perm +6000-type f -exec ls -ld {} \; 2> /

dev / null

 

 setuid  setgid  

 Dockerfile  Dockerfile 

RUN find / -perm +6000-type f -exec chmod a-s {} \;|| true



 setuid  setgid  



Not Applicable

1. http://www.oreilly.com/webops-perf/free/files/docker-security.pdf

2.http://container-



solutions.com/content/uploads/2015/06/15.06.15_DockerCheatSheet_A2.p df

3. http://man7.org/linux/man-pages/man2/setuid.2.html

4. http://man7.org/linux/man-pages/man2/setgid.2.html

©dosec 

65

Docker V1.0

4.9  dockerfile  copy  add

 

 
  

 Dockerfile  COPY  ADD  COPY  ADD   URL  ADD   URL   1docker images  2 ADD  docker history <Image_ID>  Dockerfile ADD   ADD   Dockerfiles  COPY   ADD  URL  Not Applicable 1.https://docs.docker.com/engine/userguide/eng-image/dockerfile_bestpractices/#/add-or-copy

©dosec 

66

Docker V1.0

4.10  dockerfile

 

 
  

 Dockerfiles   Docker    Dockerfiles  Dockerfiles    1 docker images  2   docker history<Image_ID>  Dockerfile   Dockerfiles    Dockerfiles  1. https://github.com/docker/docker/issues/13490 2. http://12factor.net/config 3. https://avicoder.me/2016/07/22/Twitter-Vine-Source-code-dump/

©dosec 

67

Docker V1.0

4.11 









 1 docker images



 2  docker history<Image_ID>

 Dockerfile





 GPG  



None

 

1. http://www.oreilly.com/webops-perf/free/files/docker-security.pdf

2.https://github.com/docker-

library/httpd/blob/12bf8c8883340c98b3988a7bade8ef2d0d6dcf8a/2.4/Dock



erfile 3.https://github.com/docker-

library/php/blob/d8a4ccf4d620ec866d5b42335b699742df08c5f0/7.0/alpine/

Dockerfile

4. https://access.redhat.com/security/team/key

©dosec 

68

Docker V1.0

5 

5.1  AppArmor 

   

  

AppArmor  Linux    Linux  Debian  Ubuntu AppArmor  AppArmor  Linux   AppArmor  Docker  AppArmor  docker ps --quiet --all | xargs docker inspect --format '{{ .Id }}: AppArmorProfile={{ .AppArmorProfile }}'  AppArmor   AppArmor  Linux  1. AppArmor  2. Docker  AppArmor  3. 4. AppArmor  Docker  docker run --interactive --tty --security-opt ="apparmorPROFILENAME" centos / bin / bash  Docker  apparmor  AppArmor    docker-default AppArmor  /etc/apparmor.d/docker  1. https://docs.docker.com/engine/security/apparmor/ 2.https://docs.docker.com/engine/reference/run/#security-configuration 3.https://docs.docker.com/engine/security/security/#other-kernel-securityfeatures

©dosec 

69

Docker V1.0

©dosec 

70

Docker V1.0

5.2  SElinux 

   

 


SELinux  Linux    Linux  Red Hat  Fedora SELinux MAC DAC  Linux  SELinux  docker ps --quiet --all | xargs docker inspect --format '{{ .Id }}: SecurityOpt={{ .HostConfig.SecurityOpt }}'   SELinux  Linux    1. SELinux  2. SELinux  3. Docker  SELinux  4. SELinux  Docker docker daemon --selinux-enabled 5. Docker  docker run--interactive --tty --security-opt label = levelTopSecret centos / bin / bash selinux     SELinux  1.https://docs.docker.com/engine/security/security/#other-kernel-securityfeatures 2. https://docs.docker.com/engine/reference/run/#security-configuration 3. http://docs.fedoraproject.org/en-US/Fedora/13/html/SecurityEnhanced_Linux/ 4.https://access.redhat.com/documentation/enus/red_hat_enterprise_linux_atomic_host/7/html/container_security_guid e/docker_selinux_security_policy

©dosec 

71

Docker V1.0

©dosec 

72

Docker V1.0

5.3 linux 

   

 

Docker  Linux    root   Linux  root  Docker   Docker    NET_ADMIN SYS_ADMIN SYS_MODULE docker ps --quiet --all | xargs docker inspect --format '{{ .Id }}: CapAdd={{ .HostConfig.CapAdd }} CapDrop={{ .HostConfig.CapDrop }}'  Linux    $> docker run --cap-add = {"Capability 1""Capability 2"} docker run --interactive --tty --cap-add = {"NET_ADMIN" "SYS_ADMIN"} centoslatest / bin / bash  $> docker run --cap-drop = {" 1"" 2"} docker run --interactive --tty --cap-drop = {"SETUID" "SETGID"} centoslatest / bin / bash   $> docker run --cap-drop = all --cap-add = {"Capability 1" "Capability 2"} docker run --interactive --tty --cap-drop = all --cap-add = {"NET_ADMIN""SYS_ADMIN"} centoslatest / bin / bash  Linux  AUDIT_WRITE CHOWN DAC_OVERRIDE FOWNER FSETID KILL MKNOD NET_BIND_SERVICE NET_RAW SETFCAP SETGID SETPCAP SETUID SYS_CHROOT

©dosec 

73

Docker V1.0



1.https://docs.docker.com/engine/security/security/#linux-kernelcapabilities 2. http://man7.org/linux/man-pages/man7/capabilities.7.html 3. http://www.oreilly.com/webops-perf/free/files/docker-security.pdf

©dosec 

74

Docker V1.0

5.4 



  
  

--privileged  Linux cap-add -cap-drop   --privileged , cgroup   ,  , Docker  Docker  docker ps --quiet --all | xargs docker inspect --format '{{ .Id }}: Privileged={{ .HostConfig.Privileged }}'  Privileged = false --privileged  docker run --interactive --tty --privileged centos / bin / bash  Linux  False. 1. https://docs.docker.com/engine/reference/run/#runtime-privilege-andlinux-capabilities

©dosec 

75

Docker V1.0

5.5 


   
  

  / / boot / dev / etc / lib / proc / sys / usr    Docker  docker ps --quiet --all | xargs docker inspect --format '{{ .Id }}: Volumes={{ .Mounts }}'    None. Docker    1. https://docs.docker.com/engine/tutorials/dockervolumes/

©dosec 

76

Docker V1.0

5.6 SSH 



  
  

SSH   SSH   SSH    SSH   SSH  shell    1 docker ps --quiet  2 docker exec $ INSTANCE_ID ps -el  SSH   SSH  nsenter  docker exec  docker attach docker exec -interactive --tty $ INSTANCE_ID sh OR docker attach $INSTANCE_ID None. SSH   1. http://blog.docker.com/2014/06/why-you-dont-need-to-run-sshd-indocker/

©dosec 

77

Docker V1.0

5.7 



  
  

 1024  TCP / IP     Docker  49153-65535   Docker    NET_BIND_SERVICE Linux    docker   docker ps --quiet | xargs docker inspect --format'{{.Id}}Ports = {{.NetworkSettings.Ports}}'  1024     Docker  None.   HTTP  HTTPS  80 / tcp  443 / tcp 1. https://docs.docker.com/engine/userguide/networking/

©dosec 

78

Docker V1.0

5.8 

 
 

  

 Dockerfile     Docker   Docker    docker ps -quiet | xargs docker inspect --format'{{.Id}}Ports = {{.NetworkSettings.Ports}}'   Dockerfile  -PUPPERCASE--publish-all  Dockerfile  -p-publish  docker run --interactive --tty --publish 5000 - publish 5001 publish 5002 centos / bin / bash None. '-P''--publish-all' EXPOSE  Dockerfile  1. https://docs.docker.com/engine/userguide/networking/

©dosec 

79

Docker V1.0

5.9 



  
  

"--net = host"  Docker  docker     root    Docker  D-bus    Docker    host  docker ps --quiet --all | xargs docker inspect --format '{{ .Id }}: NetworkMode={{ .HostConfig.NetworkMode }}'  NetworkMode = host-net = host  '--net = host' None.  Docker  1. https://docs.docker.com/engine/userguide/networking/ 2. https://docs.docker.com/engine/reference/run/#network-settings

©dosec 

80

Docker V1.0

5.10 

   

  

Docker   Docker       docker ps --quiet --all | xargs docker inspect --format '{{ .Id }}: Memory={{ .HostConfig.Memory }}'  0   --memory   docker run --interactive --tty --memory 256m centos / bin / bash  256 MB   docker inspect --format ='{{Config.Memory}}'7c5a2d4c7fe0  256 MB  2.68435456e + 08  256m    Docker    1.https://goldmann.pl/blog/2014/09/11/resource-management-in-docker/ 2.https://docs.docker.com/engine/reference/commandline/run/#options 3. https://docs.docker.com/engine/admin/runmetrics/

©dosec 

81

Docker V1.0

5.11  CPU 

   


Docker   Docker  CPU   CPU  CPU    CPU  CPU  CPU   CPU    docker ps --quiet --all | xargs docker inspect --format '{{ .Id }}: CpuShares={{ .HostConfig.CpuShares }}'  0  1024 CPU    1024  CPU   CPU --cpu-shares    docker run --interactive --tty --cpu-shares 512 centos / bin / bash  50 CPU   CPU  80 CPU  40  1024  CPU   0  1./sys/fs/cgroup/cpu/system.slice/ 2. docker ps  ID 3. 1  docker- <Instance ID> .scope docker4acae729e8659c6be696ee35b2237cc1fe4edd2672e9186434c5116e1a6f bed6.scope 4. cpu.shares  cat cpu.shares CPU  docker run -c --cpu-shares  CPU  1024

©dosec 

82

Docker V1.0

  

 CPU  512  CPU  1024  100  CPU  50  512; 25 256  CPU    CPU CPU  CPU   Docker   CPU  1. https://goldmann.pl/blog/2014/09/11/resource-management-in-docker/ 2. https://docs.docker.com/engine/reference/commandline/run/#options 3. https://docs.docker.com/engine/admin/runmetrics/

©dosec 

83

Docker V1.0

5.12 

   



 Docker " "     docker ps --quiet --all | xargs docker inspect --format '{{ .Id }}: ReadonlyRootfs={{ .HostConfig.ReadonlyRootfs }}'  true  false   docker run <Run arguments> - read-only <Container Image Name or ID> <Command>  1.--tmpfs  docker run --interactive --tty --read-only --tmpfs"/ run"--tmpfs"/ tmp"centos / bin / bash 2. Docker rw  Docker  docker run --interactive --tty --read-only -v / opt / app / data/ run / app / datarw centos / bin / bash 3. Docker  Docker  docker volume create -d convoy --opt o = size = 20GB my-namedvolume docker run --interactive --tty --read-only -v my-namedvolume/ run / app / data centos / bin /bash 4.  API --read-only   

©dosec 

84

Docker V1.0

 

 ·--tmpfs / tmp · Docker    1. http://docs.docker.com/reference/commandline/cli/#run 2. https://docs.docker.com/engine/tutorials/dockervolumes/ 3.http://www.projectatomic.io/blog/2015/12/making-docker-images-writeonly-in-production/ 4.https://docs.docker.com/engine/reference/commandline/run/#mounttmpfs-tmpfs 5.https://docs.docker.com/engine/tutorials/dockervolumes/#creating-andmounting-a-data-volume-container

©dosec 

85

Docker V1.0

5.13 

  

  


Docker   IP           docker ps -quiet | xargs docker inspect --format'{{.Id}}Ports = {{.NetworkSettings.Ports}}'  IP  - 0.0.0.0   49153  Ports = map [443 / tcp<nil> 80 / tcp[map [HostPort49153 HostIp0.0.0.0]]]   Ports = map [443 / tcp<nil> 80 / tcp[map [HostIp10.2.3.4 HostPort49153]]]  docker run--detach --publish 10.2.3.4:49153:80 nginx  80  49153   10.2.3.4  None. Docker  0.0.0.0  1. https://docs.docker.com/engine/userguide/networking/

©dosec 

86

Docker V1.0

5.14  on-failure  5





  


 docker run --restart    5            5  docker ps --quiet --all | xargs docker inspect --format '{{ .Id }}: RestartPolicyName={{ .HostConfig.RestartPolicy.Name }} MaximumRetryCount={{ .HostConfig.RestartPolicy.MaximumRetryCount }}'  RestartPolicyName = always   RestartPolicyName = no  RestartPolicyName =   RestartPolicyName = on-failure MaximumRetryCount  5   docker run --detach --restart = on-failure5 nginx  5   1.https://docs.docker.com/engine/reference/commandline/run/#restartpolicies-restart

©dosec 

87

Docker V1.0

5.15 



  
  

 IDPID ID  PID   PID  PID  PID   PID  ID PID          docker ps --quiet --all | xargs docker inspect --format '{{ .Id }}: PidMode={{ .HostConfig.PidMode }}'  host PID   '--pid = host'  docker run --interactive --tty --pid = host centos / bin / bash     strace  gdb    "-p" docker run --pid = host rhel7 strace -p 1234  PID   1. https://docs.docker.com/engine/reference/run/#pid-settings-pid 2. http://man7.org/linux/man-pages/man7/pid_namespaces.7.html

©dosec 

88

Docker V1.0

5.16  IPC 


   

 

IPCPOSIX / SysV IPC   IPC   IPC  IPC   IPC   IPC   IPC   IPC   IPC   docker ps --quiet --all | xargs docker inspect --format '{{ .Id }}: IpcMode={{ .HostConfig.IpcMode }}'  host IPC    IPC  '--ipc = host'  docker run --interactive --tty --ipc = host centos / bin / bash     IPC    IPC  IPC   IPC   docker run --interactive --tty --ipc = containere3a7a1a97c58 centos / bin / bash  IPC  IPC   1. https://docs.docker.com/engine/reference/run/#ipc-settings-ipc 2. http://man7.org/linux/man-pages/man7/namespaces.7.html

©dosec 

89

Docker V1.0

5.17 

   
  

   --device      mknod      r - read w - write m - mknod allowed docker ps --quiet --all | xargs docker inspect --format '{{ .Id }}: Devices={{ .HostConfig.Devices }}'  ·CgroupPermissions - rwm ·PathInContainer -  ·PathOnHost -    [ ]     docker run --interactive --tty --device = / dev / tty0/ dev / tty0rwm --device = / dev / temp_sda/ dev / temp_sdarwm centos bash  docker run --interactive --tty --device = / dev / tty0/ dev / tty0rw -device = / dev / temp_sda/ dev / temp_sdar centos bash     mknod  

©dosec 

90

Docker V1.0
 1.https://docs.docker.com/engine/reference/commandline/run/#options

©dosec 

91

Docker V1.0

5.18  ulimit 



  
  

 ulimit  Docker   ulimit  ulimit  shell    fork     Docker  ulimit  ulimit     ulimit  docker ps --quiet --all | xargs docker inspect --format '{{ .Id }}: Ulimits={{ .HostConfig.Ulimits }}'  Ulimits = <no value>  ulimit   ulimit   ulimit  docker run --ulimit nofile = 10241024 --interactive --tty centos / bin / bash  ulimits    Docker  ulimit  1. https://docs.docker.com/engine/reference/commandline/run/#setulimits-in-container-ulimit 2. http://www.oreilly.com/webops-perf/free/files/docker-security.pdf

©dosec 

92

Docker V1.0

5.19 

 
 
  


 sharedslave  private        docker ps --quiet --all | xargs docker inspect --format '{{ .Id }}: Propagation={{range $mnt := .Mounts}} {{json $mnt.Propagation}} {{end}}'     docker run <Run arguments> -volume = / hostPath/ containerPathshared <Container Image Name or ID> <Command> None.  1. https://github.com/docker/docker/pull/17034 2.https://docs.docker.com/engine/reference/run/#volume-sharedfilesystems 3.https://www.kernel.org/doc/Documentation/filesystems/sharedsubtree.tx t

©dosec 

93

Docker V1.0

5.20  UTS 


  
  


UTS  NIS         UTS    docker ps --quiet --all | xargs docker inspect --format '{{ .Id }}: UTSMode={{ .HostConfig.UTSMode }}'  host UTS    UTS   '--uts = host' docker run --rm --interactive --tty --uts = host rhel7.2 None.  UTS  UTS   1. https://docs.docker.com/engine/reference/run/#uts-settings-uts 2. http://man7.org/linux/man-pages/man7/namespaces.7.html

©dosec 

94

Docker V1.0

5.21  seccomp 



Seccomp   Docker seccomp 

 

   



docker ps --quiet --all | xargs docker inspect --format '{{ .Id }}: SecurityOpt={{ .HostConfig.SecurityOpt }}'



<no value> seccomp   [seccompunconfined]

seccomp 



docker  seccomp   seccomp 

 Docker 1.10  seccomp 



--cap-add  seccomp   docker run --security-opt =

seccompunconfined  seccomp 



--security-opt  

1. http://blog.scalock.com/new-docker-security-features-and-what-they-mean-

seccomp-profiles



2. https://docs.docker.com/engine/reference/run/#security-configuration 3.https://github.com/docker/docker/blob/master/profiles/seccomp/default.json

4. https://docs.docker.com/engine/security/seccomp/

5. https://www.kernel.org/doc/Documentation/prctl/seccomp_filter.txt

6. https://github.com/docker/docker/issues/22870

5.22docker exec 



--privileged  docker exec

©dosec 

95

Docker V1.0



 
  

 docker exec --privileged  Linux     1  --privileged  docker exec  ausearch -k docker | grep exec | grep  --privileged   docker exec --privileged   docker exec --privileged  1. https://docs.docker.com/engine/reference/commandline/exec/

©dosec 

96

Docker V1.0

5.23docker exec  user 



  
  

--user  docker exec  docker exec --user    tomcat  root  --user = root  root    1  --user  docker exec  ausearch -k docker | grep exec | grep user --user   docker exec --user  None. docker exec --user  1. https://docs.docker.com/engine/reference/commandline/exec/

©dosec 

97

Docker V1.0

5.24  cgroug 



 cgroup  cgroup   cgroup 

 cgroup   cgroups 

 docker cgroup 

  cgroup  cgroup

 cgroup





docker ps --quiet --all | xargs docker inspect --format '{{ .Id }}: CgroupParent={{ .HostConfig.CgroupParent }}'

 cgroup 

 docker cgroup   cgroup 



  --cgroup-parent  docker 



None.

  docker cgroup 

1.https://docs.docker.com/engine/reference/run/#specify-custom-cgroups



2.https://access.redhat.com/documentation/enUS/Red_Hat_Enterprise_Linux/6/html/Resource_Management_Guide/ch01.h

tml

©dosec 

98

Docker V1.0

5.25 

 
  
 


 suid  sgid   no_new_priv   forkclone  execute no_new_priv  suid  sgid    docker ps --quiet --all | xargs docker inspect --format '{{ .Id }}: SecurityOpt={{ .HostConfig.SecurityOpt }}'  docker run --rm -it --security-opt = nonew-privileges ubuntu bash no_new_priv  SELinux  LSM    1. https://github.com/projectatomic/atomic-site/issues/269 2. https://github.com/docker/docker/pull/20727 3. https://www.kernel.org/doc/Documentation/prctl/no_new_privs.txt 4. https://lwn.net/Articles/475678/ 5. https://lwn.net/Articles/475362/

©dosec 

99

Docker V1.0

5.26 



  
  

 HEALTHCHECK -health-cmd    HEALTHCHECK --health-cmd   docker ps --quiet | xargs docker inspect --format'{{.Id}}Health = {{.State.Health.Status}}' --health-cmd  --health-cmd  docker run -d --health-cmd ='stat / etc / passwd || exit1'nginx None.  1. https://docs.docker.com/engine/reference/run/#healthcheck

©dosec 

100

Docker V1.0

5.27  docker 

 

 
  

  docker  docker pulldocker run   ""  1   2 docker pull    3 
     None docker  1. https://github.com/docker/docker/pull/16609

©dosec 

101

Docker V1.0

5.28  PID cgroup

 
  
  

--pids-limit   fork   fork   PIDs cgroup --pidslimit  fork    PidsLimit  0 -1 PidsLimit  0 -1   docker ps --quiet | xargs docker inspect --format'{{.Id}}PidsLimit = {{.HostConfig.PidsLimit}}' PidsLimit  0 -1 --pids-limit docker run -it -pids-limit 100 <Image_ID>  100. 100 docker   PID    pids-limit  0, fork   ,pids cgroup  4.3+ 1. https://github.com/docker/docker/pull/18697 2.https://docs.docker.com/engine/reference/commandline/run/#options

©dosec 

102

Docker V1.0

5.29  docker  docker0




 
  

 Docker  bridge docker0  docker   Docker  docker0    ARP  MAC    docker0  Docker network ls --quiet | xargs xargs docker network inspect format'{{.Name}}{{.Options}}'  bridge docker0  Docker     docker  docker0  1. https://github.com/nyantec/narwhal 2. https://arxiv.org/pdf/1501.02967 3. https://docs.docker.com/engine/userguide/networking/

©dosec 

103

Docker V1.0

5.30 

 
  
 


      UsernsMode    docker ps --quiet | xargs docker inspect --format'{{.Id}}UsernsMode = {{.HostConfig.UsernsMode}}' UsernsMode    docker run --rm -it --userns = host ubuntu bash None   1. https://docs.docker.com/engine/security/userns-remap/ 2.https://docs.docker.com/engine/reference/commandline/run/#options 3. https://github.com/docker/docker/pull/12648 4.https://events.linuxfoundation.org/sites/events/files/slides/User%20Nam espaces%20-%20ContainerCon%202015%20-%2016-9-final_0.pdf

©dosec 

104

Docker V1.0

5.31  docker 

 
  
 


docker socketdocker.sock  Docker  docker  docker ps --quiet --all | xargs docker inspect --format '{{ .Id }}: Volumes={{ .Mounts }}' | grep docker.sock  docker.sock   docker.sock  None docker.sock  1.https://raesene.github.io/blog/2016/03/06/The-Dangers-OfDocker.sock/ 2.https://forums.docker.com/t/docker-in-docker-vs-mounting-var-rundocker-sock/9450/2 3. https://github.com/docker/docker/issues/21109

©dosec 

105

Docker V1.0
6 docker 

6.1 

 
 

 

  ""       1  ID docker images --quiet | xargs docker inspect --format'{{.Id}}Image = {{.Config.Image}}'  2docker images  3 1  2  ID           1  ID docker images --quiet | xargs docker inspect --format'{{.Id}}Image = {{.Config.Image}}'  2docker images  3 1  2  ID    4   docker rmi $ IMAGE_ID None.  

©dosec 

106

Docker V1.0



1.http://craiccomputing.blogspot.in/2014/09/clean-up-unused-dockercontainers-and.html 2.https://forums.docker.com/t/command-to-remove-all-unusedimages/20/8 3. https://github.com/docker/docker/issues/9054 4. https://docs.docker.com/engine/reference/commandline/rmi/ 5. https://docs.docker.com/engine/reference/commandline/pull/ 6. https://github.com/docker/docker/pull/11109

©dosec 

107

Docker V1.0

6.2 

 

 
  

   Docker    1 - docker info --format'{{.Containers}}'  2 -   docker info - format'{{.ContainersStopped}}'docker info format'{{.ContainersRunning}}'   25   docker container prune   Docker  1.https://zeltser.com/security-risks-and-benefits-of-docker-application/ 2.http://searchsdn.techtarget.com/feature/Docker-networking-How-Linuxcontainers-will-change-your-network

©dosec 

108

Docker V1.0
7 docker 

7.1 



  
  

 Docker  Docker   Unix   Docker  Docker      docker info   Swarmactive  Docker   docker   swarm  Swarm   None. Docker  1.https://docs.docker.com/engine/reference/commandline/swarm_init/

©dosec 

109

Docker V1.0

7.2 

 
  
  

        docker info  docke info - format'{{.Swarm.Managers}}'  Docker node ls | grep'leader'    docker node demote <ID>   1. https://docs.docker.com/engine/swarm/manage-nodes/ 2.https://docs.docker.com/engine/swarm/admin_guide/#/add-managernodes-for-fault-tolerance

©dosec 

110

Docker V1.0

7.3 



  
  

docker swarm   --listen-addr  0.0.0.0:2377    docker    IP --listen-addr   2377 / TCP docker swarm    ubuntu  netstat -lt | grep -i 2377  --listen-addr  None docker swarm  1.https://docs.docker.com/engine/reference/commandline/swarm_init/#-listen-addr 2.https://docs.docker.com/engine/swarm/admin_guide/#recover-fromdisaster

©dosec 

111

Docker V1.0

7.4 

 
  
 


    docker network ls --filter driver = overlay --quiet | xargs docker network inspect - format'{{.Name}} {{.Options}}' --opt --opt  None  Docker   1.https://docs.docker.com/engine/userguide/networking/overlay-securitymodel/ 2. https://github.com/docker/docker/issues/24253

©dosec 

112

Docker V1.0

7.5  Swarm 

 

 
  

 Docker  Docker  Swarm   Docker   Windows   swarm manager  docker  Docker secret ls   docker    1. https://docs.docker.com/engine/reference/commandline/secret/

©dosec 

113

Docker V1.0

7.6 swarm manager 



  
  

 Docker   Docker  TLS   Raft    TLS  Raft   --autolock  swarm   --autolockenabled Docker  Docker    swarm --autolock   -autolock docker swarm unlock-key   swarm docker swarm init --autolock  swarm manager --autolock  Docker swarm update --autolock    swarm manager  1. https://docs.docker.com/engine/swarm/swarm_manager_locking/

©dosec 

114

Docker V1.0

7.7 swarm manager 

   

  

 swarm manager  Swarm    swarm manager       Docker swarm unlock-key --rotate   None  1.https://docs.docker.com/engine/reference/commandline/swarm_unlockkey/

©dosec 

115

Docker V1.0

7.8 



 swarm 

Docker Swarm  TLS  

   90 





 Expiry Duration  Docker info | grep"Expiry Duration"

 



 docker swarm update--cert-expiry 48h



None



 90 



1.https://docs.docker.com/engine/reference/commandline/swarm_update/#e xamples

©dosec 

116

Docker V1.0

7.9CA 



  
  

 CA  Docker Swarm  TLS     CA     CA     CA  ls -l /var/lib/docker/swarm/certificates/swarm-root-ca.crt   Docker swarm ca - rotate None  CA  1.https://docs.docker.com/engine/swarm/how-swarm-modeworks/pki/#rotating-the-ca-certificate

©dosec 

117

