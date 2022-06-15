ECS 
 


·  · ECS · ECS · ecs cli · ELB

ECS
  ·   
  · CPU 
  ·  
  · VPC 
  · API · Auto Scaling & Multi-AZs


$ cat app.js
var express = require('express'); var morgan = require('morgan'); var app = express(); var PORT = process.env.PORT || 8080;
app.use(morgan('[:date[iso]] :method :url\t:status'));
// Redis Setup var redis = require('redis'),
client = redis.createClient(process.env.DB_PORT, process.env.DB_HOST, {});
client.on('connect', function() { console.log('Connected to Redis');
});
app.get("/", function (req, res) { getCount(function (err,reply) { var value = (reply == null ? 0 : parseInt(reply)); res.status(200).send({count: value}); });
}); app.put('/inc', function (req, res) {
client.incr('count'); res.status(204).end(); }); app.put('/dec', function (req, res) { client.decr('count'); ...

$ cat Dockerfile
FROM node:0.12.1-slim EXPOSE 8080 ENV DB_HOST=redis ENV DB_PORT=6379 ADD package.json package.json RUN npm install --save ADD app.js app.js CMD node app.js



$ docker build ­t "zhang1980s/ecs-demo:redis-app" .

$ docker run ­detach ­p 6379:6379 ­name=redis redis

$ docker run ­p 8080:8080 ­name=redis-app zhang1980s/ecs-demo:redisapp

$ curl -X PUT http://localhost/inc $ curl -X GET http://localhost | jq '.'
% Total % Received % Xferd Average Speed Time Time Current
Dload Upload Total Spent Left Speed 100 11 100 11 0 0 868 0 --:--:-- --:--:-- --:--:-- 916 {
"count": 1 }

Time

$ docker login

$ docker push zhang1980s/ecs-demo:redis-app

ECS

/  Task Definition

/  ECS Cluster

 Run Tasks

/  Services

ECS

App Redis Task Definition

Service
AWS cloud

ECS Cluster

ECS
· 
­ Amazon ECS-optimized Amazon Linux AMI ­ ecs-agenthttps://github.com/aws/amazon-ecs-
agent
· User data
­ echo ECS_CLUSTER=ecs-demo-1 >> /etc/ecs/ecs.config

Task Definition / Task

· Task Definition
­  ­ CPU/ ­  ­  ­  ­ 
 ­  ­ 
· Task
­ Task Definition 

Task Definition
· AWS CLI/Task Definition
$ aws ecs register-task-definition --cli-input-json file://path/to/file/task-definition.json

ECS Command Line Interface ­ ecs-cli

· ECS · //
/ 
· Linux/Mac ECS
· Compose 
·  https://github.com/aws/amazon -ecs-cli

$ ecs-cli configure ­region us-west-2 ­access-key <ACCESS_KEY_ID> -secret-key <SECRET_ACCESS_KEY> -cluster <CLUSTER_NAME> $ ecs-cli up ­keypair <mykey> --capability-iam ­size 2 ­instance-type t2.medium $ ecs-cli compose ­file docker-compose.yml up $ ecs-cli ps $ ecs-cli compose ­file docker-compose.yml scale 2 $ ecs-cli compose ­file docker-compose.yml down $ ecs-cli compose ­file docker-compose.yml service up $ ecs-cli compose ­file docker-compose.yml service rm $ ecs-cli compose down --force

Link

App Redis Task Definition

Service
AWS cloud

ECS Cluster

ELB

80
22
8080  6379

Auto Scaling group ECS Cluster

ELB

Internet

ECS

·  · ECS Cluster · Cloud Watch
· API · Cloud Trail
·  · ECS Cluster event

 Amazon EC2 Container Registry
· 
­  DockerRegistry
· 
­ HTTPS 
­ AWS IAM
· 
­ ECR 
· 
­ ECRECSDocker CLI 

Container@AWS
· http://aws.amazon.com/docu mentation/ecs/
· https://aws.amazon.com/ecs/
· https://aws.amazon.com/blog s/compute/
· http://aws.amazon.com/white papers/
· https://aws.amazon.com/dock er/

