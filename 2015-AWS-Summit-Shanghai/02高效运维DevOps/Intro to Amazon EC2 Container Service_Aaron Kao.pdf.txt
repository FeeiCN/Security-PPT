Intro to Amazon EC2 Container Service
Aaron Kao Sr. Product Marketing Manager

Agenda
Why Containers?
· Container Use Patterns · Production Challenges
Cluster Management
Amazon EC2 Container Service
Demo

What Containers?

What are Containers?

App1 Bins/Libs

App2 Bins/Libs

Guest OS

Server

OS virtualization Process isolation Images Automation

Container advantages

App1 Bins/Libs

App2 Bins/Libs

Guest OS

Server

Portable Flexible Fast Efficient

Services evolve to microservices

MVC Application

Order UI

User UI

Shipping UI

Order Service

User Service
Data Access

Shipping Service

Host 1
Service A Service B
Host 3
Service A Service C

Host 2
Service B Service D
Host 4
Service B Service C

Containers are natural for services
Simple to model Any app, any language Image is the version Test & deploy same artifact Stateless servers decrease change risk

Scheduling

Scheduling one resource is straightforward

App1 Bins/Libs

App2 Bins/Libs

Guest OS

Server

Scheduling a cluster is hard

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Guest OS Server

Scheduling 101
Know your constraints Find resources that meet the constraints Request a resource Confirm the resource

Cluster Management

Cluster Management
Internet ELB

User / Scheduler
ELB

Container Instance

Docker
Task
Container

Task
Container

AZ 1

Container Instance

Docker
Task
Container

Task
Container

AZ 2

Container Instance

Docker
Task
Container

Task
Container

ECS Agent

ECS Agent

ECS Agent

Amazon ECS

Agent Communication Service

API

Cluster Management Engine

Key/Value Store

Cluster Management with Amazon ECS
Management of followers via ECS Agent Dispatching of sub-tasks to proper location Cluster state inspection
http://amzn.to/1jlHvnU

Cluster Management under the Hood
Paxos-based transactional journal based data store
Writes are committed as transaction in the journal with orderbased ID. The current value is the sum of all transactions made as recorded by the journal.
Reads are simply a snapshot in time of the journal. For a write to succeed, the write proposed must be the latest transaction since the last read.
http://bit.ly/1M9gGiv

Amazon EC2 Container Service

Easily Manage Clusters for Any Scale
Nothing to run Complete state Control and monitoring Scale

Scalable

Flexible Container Placement
Applications Batch jobs Multiple schedulers

Designed for use with other AWS services
Elastic Load Balancing Amazon Elastic Block Store Amazon Virtual Private Cloud AWS Identity and Access Management AWS CloudTrail

Extensible

Comprehensive APIs Open source agent Custom schedulers

Key Components: Container Instances
Amazon EC2 instances Docker daemon Amazon ECS agent

Key Components: Clusters
Regional Resource pool Grouping of Container Instances Start empty, dynamically scalable

Key Components: Task Definitions
Volume Definitions Container Definitions

Key Components: Task Definitions

Shared Data Volume

PHP App

Time of day App

Key Components: Task Definitions

{ "environment": [], "name": "simple-demo", "image": "my-demo", "cpu": 10, "memory": 500, "portMappings": [ { "containerPort": 80, "hostPort": 80 } ], "mountPoints": [ { "sourceVolume": "my-vol", "containerPath": "/var/www/my-vol" } ], "entryPoint": [ "/usr/sbin/apache2", "-D", "FOREGROUND" ], "essential": true
},

{ "name": "busybox", "image": "busybox", "cpu": 10, "memory": 500, "volumesFrom": [ { "sourceContainer": "simple-demo" } ], "entryPoint": [ "sh", "-c" ], "command": [ "/bin/sh -c \"while true; do /bin/date >
/var/www/my-vol/date; sleep 1; done\"" ], "essential": false
}

Key Components: Task Definitions

{ "environment": [], "name": "simple-demo", "image": "my-demo", "cpu": 10, "memory": 500, "portMappings": [ { "containerPort": 80, "hostPort": 80 } ], "mountPoints": [ { "sourceVolume": "my-vol", "containerPath": "/var/www/my-vol" } ], "entryPoint": [ "/usr/sbin/apache2", "-D", "FOREGROUND" ], "essential": true
},

[ {
"ima1g0e":C"PmyUsql"U, nits (1024 is full CPU),
"name": "db",
"cpu5"0: 010,Megabytes of Memory
"memory": 500,
"essEenxtpiaol"s:etrpueo,rt 80 in container
"entryPoint": [
"/toentpryoporitn8t.0sh"on host
], "environment": [
{
C"nraemea"t:e"MaYSnQLd_RmOOTo_PuAnSStWOvRDo"l,umes
"value": "pass" } ], "portMappings": [] } ]
Essential to our Task

Key Components: Task Definitions

[

{

"image": "tutum/wordpresFs-srtoacmkablDe",ocker Hub
"name": "wordpress",

"cpu": 10,

"memory": 500,
"essential": true, Mount volume from

"links": [ "db"

other container

],

"entryPoint": [

"/bin/sh",

"-c"

],

"environment": [

...

],

Command to exec

"portMappings": [

{

"containerPort": 80,

"hostPort": 80

}

]

},

]

{ "name": "busybox", "image": "busybox", "cpu": 10, "memory": 500, "volumesFrom": [ { "sourceContainer": "simple-demo" } ], "entryPoint": [ "sh", "-c" ], "command": [ "/bin/sh -c \"while true; do /bin/date >
/var/www/my-vol/date; sleep 1; done\"" ], "essential": false
}

Key Components: Tasks
Unit of work Grouping of related Containers Run on Container Instances

Key Components: Tasks

Shared Data Volume

PHP App

Time of day App

schedule

Shared Data Volume

PHP App

Time of day App

Container Instance

Running Services

Run a task
Good for short-lived containers, e.g. batch jobs

Create a Service
Good for long-running applications and services

Create Service
Load Balance traffic across containers Automatically recover unhealthy containers Discover services

Elastic Load Balancing

Shared Data Volume

PHP App

Time of day App

Shared Data Volume

PHP App

Time of day App

Shared Data Volume

PHP App

Time of day App

Update Service (cont.)
Scale up Scale down

Shared Data Volume

PHP App

Time of day App

Elastic Load Balancing

Shared Data Volume

PHP App

Time of day App

Shared Data Volume

PHP App

Time of day App

Shared Data Volume

PHP App

Time of day App

Update Service (cont.)

Deploy new version Drain connections

Elastic Load Balancing

Shared Data Volume

PHP App

Time of day App

Shared Data Volume

PHP App

Time of day App

Shared Data Volume

PHP App

Time of day App

Update Service (cont.)

Deploy new version Drain connections

Elastic Load Balancing

Shared Data Volume

PHP App

Time of day App

Shared Data Volume

PHP App

Time of day App

Shared Data Volume

PHP App

Time of day App

Update Service (cont.)

Deploy new version Drain connections

Elastic Load Balancing

Shared Data Volume

PHP App

Time of day App

Shared Data Volume

PHP App

Time of day App

Shared Data Volume

PHP App

Time of day App

Demo

