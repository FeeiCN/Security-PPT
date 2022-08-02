VSRC2017
Docker
tuhao
VSRC 2017-07-29

 

01 Docker 02 Docker 03 Docker 04 Docker 05 Docker
2

01 Docker
3

Docker
· Docker · DockerVM · Docker
4

Docker
5

DockerVM
6

Docker
7

02 Docker
8

Docker
· Docker · Docker
9

Docker
10

Docker
Docker remote api
 1.Docker remote api 2.rootdocker 3./  /root/ssh ~/.ssh/id_rsa.pub/root/.ssh/authorized_keys root /etc/shell /etc/crontabshell2 /var/spool/cron/shell/var/spool/cron/rootcentos /var/spool/cron/crontabs/root(ubuntu)
11

Docker
kubernets apinode
//  > kubectl -s http://1.2.3.4:8080/ get nodes //  > kubectl -s http://1.2.3.4:8080/ get pods -all-namespaces=true //  myapp  shell > kubectl -s http://1.2.3.4:8080/ -namespace=default exec -it myapp bash
  nodes  Docker Remote API   ->  ->  /etc/crontab  shell

{ "paths": [ "/api", "/api/v1", "/apis", "/apis/extensions", "/apis/extensions/v1beta1", "/healthz", "/healthz/ping", "/logs/", "/metrics", "/resetMetrics", "/swagger-ui/", "/swaggerapi/", "/ui/", "/version" ]
}
12

03 Docker
13

Docker
·  ·  ·  ·  ·  · 
14


·  · User NameSpaceroot  · Cgroups · SELiux/AppArmor/GRSEC · Capability · Seccomp · 
15


·  ·  ·  · Docker ·  · rootDocker 644 ·  
16


· iptables  · Dokceriptables · DockerIP/PortUnix Socket ·  ·  ·  ·  
17 17


·  ·  ·  ·  ·  ·  · 
18 18


·  ·  · privileged · ssh ·  ·  · on-failure · fork bomb
19 19


·  ·  ·   · Docker ·  · 
20 20

04 Docker
21

Docker
· Docker remote api ·  · Docker ·  · Docker client Docker Daemon ·  ·  ·  ·  ·  · suid/guid
22

Docker remote api
DockerAPI socket iplocalhostdocker daemon docker -d -H uninx:///var/run/docker.sock -H tcp://10.10.10.10:2375#docker other_args=" -H unix:///var/run/docker.sock -H tcp://10.10.10.10:2375" iptables *filter: HOST_ALLOW1 - [0:0] -A HOST_ALLOW1 -s 10.10.10.1/32 -j ACCEPT -A HOST_ALLOW1 -j DROP -A INPUT -p tcp -m tcp -d 10.10.10.10 --port 2375 -j HOST_ALLOW1
23


iptables DockerIP iptables -A FORWARD -s <source_ip_range> -j REJECT -reject-with icmp-admin-prohibited iptables -A FORWARD -i docker0 -o eth0 -j DROP iptables -A FORWARD -i docker0 -o eth0 -m state ­state ESTABLISHED -j ACCEPT
24

Docker
Docker 1.10docker rootuid-0   1. Docker-lxc-confdocker run docker run -lxc-conf ="lxc.id_map = u 0 100000 65536" lxc-conf ="lxc.id_map = g 0 100000 65536" 2.--privileged docker run -it debian8:standard /bin/bash
25


 
su con1 docker run -v dev:/home/mc_server/con1 -it debian8:standard /bin/bash su con2 docker run -v dev:/home/mc_server/con2 -it debian8:standard /bin/bash
26


 CVE 
27


Clair appcdocker Registryos api
Docker Bench for Security 30+Docker
Dagda//api 
Lynis dockerfiledocker
28

Docker client Docker Daemon
docker c/s docker ­tlsverify ­tlscacert=ca.pem ­tlscert=servercert.pem ­tlskey=server-key.pem -H=0.0.0.0:2376
29


 cpu 22048 docker run -tid ­name ec2 ­cpuset-cpus 3 ­cpu-shares 2048 -memory 2048m ­rm ­blkio-weight 100 --pids-limit 512
30


LinuxSELinuxAppArmor GRSECDocker SELinuxsetenforce 1 DockerSELinux-selinux-enabled---security-opt SELinuxAppArmorDocker1.3 
docker run --security-opt=secdriver:name:value -i -t centos bash
31

suidguid
SUIDGUID  docker run -it --rm --cap-drop SETUID --cap-drop SETGID nosuidSUID  SUIDGUID Linux find / -perm -4000 -exec ls -l {} \; 2>/dev/null find / -perm -2000 -exec ls -l {} \; 2>/dev/null SUIDGUID sudo chmod u-s filename sudo chmod -R g-s directory
32


Linux Dockerchowndac_overridefowner killsetgidsetuidsetpcapnet_bind_service net_rawsys_chrootmknodsetfcapaudit_write --cap-add=[]--capdrop=[] docker run --cap-drop setuid --cap-drop setgid -ti <container_name> /bin/sh Docker 1.2
33


  CI openvas/w3af/arachni/
34

05 Docker
35

Docker
· Docker · Docker
36

Docker
· Docker .  . Docker
37

Docker
· Docker .  . Dockerfile
38

 THANKS!

