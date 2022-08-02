Docker 
· 


·  Docker ·  ·  · Docker 

Docker  
· Docker  · 

Docker 
· + =  ·  · 





·  Java, Golang, Ruby · Upstart, authorized_keys,
dependency · ErrorReporterMessage · 


·  ·  ·  · 

DevOps 
·  · 



· 

OS
Container
Service Discovery
Config Container Management

Windows/Ubuntu/CentOS/Redhat/Ubuntu Rocket/RunC/Docker Consul/Etcd JSON/INI/YAML
K8s/Mesos/Swarm/Compose/None


·  ·  · 

Dockerize

·  · 
Dockerfile · 

· 
·  Dockerfile
·  Docker 

 Dockerfile
# Base FROM java:jdk-7
COPY ./.src/target/app-1.0.jar /app/
# ENTRYPOINT WORKDIR /app CMD [ "java", "-Dfile.encoding=UTF-8", "-jar", "./app-1.0.jar" ]


· () docker run / start / stop / restart
· () docker remote API · () 


· conf  docker remote API ·  docker 
 ·  cli / web





DockerUI 


·  dockerize  
·  
·  






· LB  Nginx / HAProxy / confd / Etcd
·  Prometheus / cAdvisor / Http Metrics
· Docker Registry V1 · Docker Host · Docker Mount 

Prometheus


· Job-Tool  Job DashBoard  (cAdivsor)(ELK)
·  
·  
· docker image  ·  container 

Docker 
· Docker Image:  · Docker Daemon: , 
 · Docker Net:  · Docker Logs: syslog  jsonlog 


Docker 
· Docker 1.9.1   Docker Daemon crash
· Docker Daemon   Docker Daemon


·  ·  ·  Attach


·  docker run ubuntu yes "something long"
· docker run -i ubuntu dd if=/dev/zero of=/proc/self/fd/1 bs=1M count=1000
· Issue: https://github.com/docker/docker/issues/14460
· Fix By: https://github.com/docker/docker/pull/17877


·  

Q&A

