ELB


 Elastic Load Balancing











SSL/TLS 
· POODLE · LogJam · Heartbleed · RC4

SSL/TLS 
· (perfect forward secrecy) · AES > 3DES > RC4 · GCM > CBC + HMAC

SSL/TLS 
· 
·  · ...
· 
· ELBSecurityPolicy-2015-05

ELB
2015-05-13T23:39:43.945958Z my-loadbalancer 192.168.131.39:2817 10.0.0.1:80 0.000086 0.001048 0.001337 200 200 0 57 "GET https://www.example.com:443/ HTTP/1.1" "curl/7.38.0" DHE-RSA-AES128-SHA TLSv1.2
S3

ELB
2015-05-13T23:39:43.945958Z my-loadbalancer 192.168.131.39:2817 10.0.0.1:80 0.000086 0.001048 0.001337 200 200 0 57 "GET https://www.example.com:443/ HTTP/1.1" "curl/7.38.0" DHE-RSA-AES128-SHA TLSv1.2

ELB
2015-05-13T23:39:43.945958Z my-loadbalancer 192.168.131.39:2817 10.0.0.1:80 0.000086 0.001048 0.001337 200 200 0 57 "GET https://www.example.com:443/ HTTP/1.1" "curl/7.38.0" DHE-RSA-AES128-SHA TLSv1.2

ELB

 

ELB

 

ELB

 

ELB

 

ELB 

 

ELB 

 




Latency = Load / Throughput
 =  / 



Memory

Latency











GET /monthly_report/ HTTP/1.1

GET / HTTP/1.1















 











  


ELB 

CloudWatchAuto Scaling
Auto ScalingELB ELB Auto Scaling 

CloudWatch
13CloudWatch ELB CloudWatch 1

 HealthyHostCount
ELB   

 Latency
   ELB

SurgeQueue  spillovers
 1,024ELB, ELB 503 ELB 

 Access logs

· timestamp · elb name · client:port · backend:port · request_processing_time · backend_processing_time · response_processing_time · elb_status_code

· backend_state_code · received_bytes · sent_bytes · "request" · "User-Agent" · Ciphersuite · SSL/TLS protocol version

2015-05-13T23:39:43.945958Z my-loadbalancer 192.168.131.39:2817 10.0.0.1:80 0.000086 0.001048 0.001337 200 200 0 57 "GET https://www.example.com:443/ HTTP/1.1" "curl/7.38.0" DHE-RSAAES128-SHA TLSv1.2



Route 53Region



 

53



 



ELB

EC2 instance
EC2 instance
EC2 instance


TCPHTTP  HTTP2XX 

 (Idle Timeout) ELB

 Idle timeouts
 ELBELB 6013600 ELB<=

 Idle timeouts
3s

15s

15s

9s 3s

EC2

ELB

instances

3s

Amazon S3 Amazon RDS Amazon SWF


Amazon Route 53

VPC ELB ELB

EC2 instance
EC2 instance

us-west-1b us-west-1a

Route 53
ELB Route 53  150 

ELB2 

 






DNS 
DNS TTL DNSELB  DNS
DNS

DNS
DNSIP
Route 53CNAMEALIAS
· // Create a wildcard CNAME or ALIAS in Route 53. · *.example.com ALIAS ... elb-12345.us-east-1.elb.amazon.com · *.example.com CNAME elb-12345.us-east-1.elb.amazon.com · // prepend random content for each lookup made by the application. · PROMPT> dig +short 25a8ade5-6557-4a54-a60e-8f51f3b195d1.example.com · 192.0.2.1 · 192.0.2.2


Amazon Route 53

VPC ELB ELB

EC2 instance
EC2 instance

us-west-1b us-west-1a


Amazon Route 53

VPC ELB ELB

EC2 instance

us-west-1b us-west-1a









 Cross-zone load balancing
DNS    

ELB  DevOps
AWS CloudFormation, AWS Opsworks, AWS Elastic Beanstalk, Amazon EC2 Container Service, Amazon API Gateway, Asgard
/
ELB

