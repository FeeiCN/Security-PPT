/AWS
  AWS


·  · / · AWS/ · AWS/ ·  · 


·  ·  ·  ·  ·  ·  ·  · 

·  ·  ·  ·  ·  ·  ·  · 

AWS/

/?

· ""

· ""

· (existing production · (parallel environment

environment)

running a different

version of the

application)

· ""
· (ability to switch traffic between the two environments)

? Boundary for where things changed and what needs to be deployed
: App component, app tier, microservice

: DNS, load balancer

v2.2.103

v2.3.020

AWS/
· AWS: ·  ·  ·  ·  · 

AWS/

: 

· :

·  () ·  · /  ·  ·  · 

 

· / 

CloudFormation

  
  : Elastic Beanstalk, OpsWorks, Auto Scaling

: DNS
· : ·  ·  ·  · DNS ·  · 

: DNS
· : ·  ·  ·  · DNS ·  · 

: DNS
· : ·  ·  ·  · DNS ·  · 

: DNS
· : ·  ·  ·  · DNS ·  · 

: DNS
· : ·  ·  ·  · DNS ·  · 

: DNS
· : ·  ·  ·  · DNS ·  · 

: DNS
· : ·  ·  ·  · DNS ·  · 



· Use CloudFormation templates to model your environment
· Version-control your templates
· Use Elastic Beanstalk or OpsWorks to model your applications inside the template
· Update CloudFormation stack from updated template containing green environment

· "Resources": {

·

"myApp": { "Type": "AWS::ElasticBeanstalk::Application"

},

·

"myConfigTemplate": {

·

"Type":

"AWS::ElasticBeanstalk::ConfigurationTemplate"

·

},

·

"myBlueAppVersion": {

·

"Type": "AWS::ElasticBeanstalk::ApplicationVersion"

·

},

·

"myBlueEnvironment": {

·

"Type":"AWS::ElasticBeanstalk::Environment"

·

},

·

"myBlueEndpoint": {"Type": "AWS::Route53::RecordSet" },

· "myGr.e.e.nAppVersion": {

"Type": "AWS::ElasticBeanstalk::ApplicationVersion"

},

"myGreenEnvironment": {

"Type": "AWS::ElasticBeanstalk::Environment"

},

"myGreenEndpoint": {"Type": "AWS::Route53::RecordSet" }

...

Amazon Route 53 DNS
· AWS Elastic Beanstalk environment endpoint swap · DNS record time-to-live (TTL) · Reaction time = (TTL × no. of DNS caches) + Route53 propagation time, up to 1min
· Beware of misbehaving DNS clients
· Auto Scaling and Amazon Elastic Load Balancing (ELB) need time to scale · Measurable metrics · ELB: Latency, SurgeQueueLength, SpillOverCount, BackendConnectionErrors
· Your application metrics
· Your deployment goals

:DNS

  
/  


  

  











DNS TTL  (reaction time,

flip/flop)



Auto Scaling

DNS...

:  Auto Scaling Groups
· : · Amazon Elastic Load Balancer
(ELB)  ·  Auto Scaling Group
(ASG) · &ASG ·  · ELBASG · ELBASG

:  Auto Scaling Groups
· : · Amazon Elastic Load Balancer
(ELB)  ·  Auto Scaling Group
(ASG) · &ASG ·  · ELBASG · ELBASG

:  Auto Scaling Groups
· : · Amazon Elastic Load Balancer
(ELB)  ·  Auto Scaling Group
(ASG) · &ASG ·  · ELBASG · ELBASG

:  Auto Scaling Groups
· : · Amazon Elastic Load Balancer
(ELB)  ·  Auto Scaling Group
(ASG) · &ASG ·  · ELBASG · ELBASG

:  Auto Scaling Groups
· : · Amazon Elastic Load Balancer
(ELB)  ·  Auto Scaling Group
(ASG) · &ASG ·  · ELBASG · ELBASG

:  Auto Scaling Groups
· : · Amazon Elastic Load Balancer
(ELB)  ·  Auto Scaling Group
(ASG) · &ASG ·  · ELBASG · ELBASG

:  Auto Scaling Groups
· : · Amazon Elastic Load Balancer
(ELB)  ·  Auto Scaling Group
(ASG) · &ASG ·  · ELBASG · ELBASG

:  Auto Scaling Groups
· : · Amazon Elastic Load Balancer
(ELB)  ·  Auto Scaling Group
(ASG) · &ASG ·  · ELBASG · ELBASG

ELB Auto Scaling groups

· Register with ELB:
­ One or more EC2 instances ­ One or more Auto Scaling groups
· Least outstanding requests algorithm favors green ASG instances for new connections
· Connection draining - gracefully stop receiving traffic
· Scale out green ASG before ELB registration
· Put blue instances in standby

· $ aws autoscaling attach-load-balancers \

·

--auto-scaling-group-name "green-asg" \

·

--load-balancer-names "my-app-elb"

· $ aws autoscaling set-desired-capacity \

·

--auto-scaling-group-name "green-asg" \

·

--desired-capacity X

· $ aws autoscaling detach-load-balancers \

·

--auto-scaling-group-name "blue-asg" \

·

--load-balancer-names "my-app-elb"

· $ aws autoscaling enter-standby \

·

--instance-ids i-xxxxxxxx \

·

--auto-scaling-group-name "blue-asg" \

·

--should-decrement-desired-capacity

:  Auto Scaling groups

   /   

      

 ELB ELB  Auto-scaling DNS Auto Scaling

 ...

:  Launch Configurations
· : · ELB ASG &
Launch Configuration  · ASGLaunch
Configuration · ASG
2 · ASG · 


:  Launch Configurations
· : · ELB ASG &
Launch Configuration  · ASGLaunch
Configuration · ASG
2 · ASG · 


:  Launch Configurations
· : · ELB ASG &
Launch Configuration  · ASGLaunch
Configuration · ASG
2 · ASG · 


:  Launch Configurations
· : · ELB ASG &
Launch Configuration  · ASGLaunch
Configuration · ASG
2 · ASG · 


:  Launch Configurations
· : · ELB ASG &
Launch Configuration  · ASGLaunch
Configuration · ASG
2 · ASG · 


:  Launch Configurations
· : · ELB ASG &
Launch Configuration  · ASGLaunch
Configuration · ASG
2 · ASG · 


 launch configurations
· Launch configurations: Blueprints for ASG instance provisioning, each ASG points to exactly one
· Scale-out & replacement: Events will use the attached (green) launch configuration to provision instances
· Scale-in: ASG scale-in events will terminate instances with oldest launch configuration first while trying to keep capacity in AZs balanced
· May need to address AZ imbalances separately · Temporarily remove instances from ASG
Place specific ASG instances (blue) into standby ­ stop receiving traffic

:  Launch Configurations

  
/   

  
   

  , initial traffic load  Auto-Scaling DNS Auto Scaling , 

/

 

DNS

 Auto Scaling groups

 launch configs



Canary analysis

Canary analysis

Mixed fleet

 /

Granular traffic switch

Instance- level granularity

Mixed fleet

Automation: Use CloudFormation with Elastic Beanstalk, OpsWork, third party

 Automation framework

Auto Scaling, ELB

Auto Scaling, ELB



DNS

ELB

ELB



Gradual scaling

Gradual scaling

Some over-provisioning



Simple, DNS weights

Auto Scaling control

Scale-in adjustments

