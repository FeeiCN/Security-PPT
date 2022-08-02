CODING  DOCKER
·  Docker Container  ·  Registry  ·  Upstream ,  Issue / Patch · 

DOCKER: THE GOOD PARTS

DOCKER: SELF SUFFICENT PACKAGING

DOCKER: EASY APP DISTRIBUTION

DOCKER: UNIVERSAL API

DOCKER: COMMON INFRA

PACKAGING

DISTRIBUTION

DOCKER

RUNTIME

ORCHASTRATION

DOCKER: THE BAD PARTS

 DOCKER IMAGE


DOCKERFILE 
· FROM 
· 
· Debian, Ubuntu,  Centos/Fedora 
· HubAbandon-ware ·  copy & paste 

DOCKERFILE 
· RUN 
· apt-get update ­y && apt-get upgrade ­y · layer, G · 

DOCKERFILE 
· CMD / ENTRYPOINT 
· layer, . · ? · .

CODING  1 BUILD & PACKAGE


BUILD
· 
· 
· 
· Vendoring, 
· 
· 

PACKAGE
·  Docker Image
· 
·  Dockerfile 
· FROM base20151030:jre8.20u · ADD app.jar /app · CMD [ "java" , "-jar", "app.jar" ]
· 

 DOCKER REGISTRY


REGISTRY 
· Over-engineering FTP · API,  library  · 

 DOCKER RUNTIME


DOCKER DAEMON 
· docker container  stdout/stderr   docker daemon OOM
· docker daemon  container   inode 
· docker init, daemonreap fork   docker daemon 

CODING  2 


CODING 
· , 
· trust-cooperative IAAS
· Host 
· SDN, proxy/
· host
· data container,  ·  mount Host locale, timezone, passwd .

 DOCKER 
Swarm, K8s, Mesos


· Swarm, kubernetes, Mesos
· 
· 
·  · IAAS 
·  docker .
· 

CODING  3 



·  ·  · Jobs/Tasks  · 


· ./coding-job up coding-mart
· 
· ./coding-job down coding-mart
· 
· ./coding-job status coding-mart
· 


·  update  image  


· ./coding-job diff
· 
· ./coding-job rolling-update
· Job/Tasks 
· ./coding-job web
· ,  status, log,  shell 

CODING 



· 
· 
· 
· 
· 
· Pet Vs Cattle · 





DEVOPS 






BUILD PACKAGE
RUN

  

Q & A
  

