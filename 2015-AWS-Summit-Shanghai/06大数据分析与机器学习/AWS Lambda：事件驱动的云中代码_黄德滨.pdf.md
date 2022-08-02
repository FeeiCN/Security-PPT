AWS Lambda: 
, 


· S3 · DynamoDB

...
·  ·  ·  ·  · 
 · 24x7x365 ·  ·  · ......



AWS

RESTORE

PUT

Amazon S3

DELETE

COPY

UPDATE

AWS Lambda ­ 







AWS Lambda ­ 



"" 

AWS Lambda ­ 






&


· / · 
· 
· BYOC · 
*Bring Your Own Code 

AWS Lambda

   Amazon 

IoT









IoT

 

AWS Lambda


: ""

Amazon Cognito



AWS Lambda

AWS IoT  AWS Lambda


 

SDK
 


GATEWAY
MQTT HTTP


things

AWS IoT API




AWS 

Lambda


SHADOW
 thing




"""" 

  HTTP


 



Web 



· 
­ Node.js ­ Java ­ Python
· ScalaClojure"jvm" · 
­ Node.jsJavaPython ­ csh
· Cron
­ cron ­ 5



HTTP

SDK
· 
­ JavaScript ­ Java ­ Object-C / Swift ­ .NET ­ PHP ­ Go ­ Python ­ Ruby
·  · 
­ Android ­ iOS
· 
­ JVM ­ Node.js



 

Internet

API Gateway

 Managed
Amazon CloudFront

API Gateway

API Gateway 
Amazon CloudWatch

AWS
AWS Lambda 

AWS

AWS Lambda 
Amazon EC2 

 


· AWS Lambda + Amazon API Gateway ----
· ----AWSIAM
· SwaggerSDK---- 

AWS

Amazon API Gateway
API 

AWS Lambda 

Amazon S3 

Amazon DynamoDB 




· 
­ AWS ­ AWS LambdaSelf-hosts ­ 5
· 
­ Lambda ­  ­ CognitoAPI Gateway




· Alexa Skills Kit---- 
· AWS Lambda IoT

Slack
Alexa, tell Slack to send, "I'm giving the
demo now."
Kevin says, "Break a leg!"

 Slack API
Slack
 
( Amazon SQS)

GitHub

GitHub

 

GitHub

Amazon SNS

AWS Lambda ­ 



 ·  · License ·  · Web ·  · ""

 ·  ·  ·  · "" ·  · 


· AWS Lambda23""
· CPU
­ 128 MB, CPU ­ 1.5 GB, CPU 
·  ·  · 1005

Amazon

Amazon S3





1

3

2

Amazon S3

AWS Lambda

Amazon S3
1. Node.js 2. Amazon S3
1. S3GET 2.  3. PUTS3
3. S3


Amazon AWS

IoT 

Amazon S3 

Amazon SWF 

Amazon SNS 

Amazon Cognito 

API Gateway 

Amazon Dynamo DB


Amazon Kinesis 

... 
AWS CloudFormation



· S3 Lambda!
·  
· 





 
 
 Amazon  Kinesis
(PUT)

AWS Lambda 

Amazon S3

 


Amazon DynamoDB

Amazon Redshift


· 
­ AWS Lambda
· AWS SDK · RESTfulLambda · 
­ Amazon S3SNSLambda
·  · 
­ LambdaAmazon KinesisAmazon DynamoDB
· 





· 100 ·  · 
 · 





10040GB





Jenkins

Grunt

AWS CloudFormation Amazon S3



: 
· AWS Lambda
·  ·  · 
exports.handler = function(event,context) {context.succeed("hi");}
exports.handler = function(event,context) {context.succeed("bye");}



· 
· "" ·  · 

exports.handler =

function(event,context)

1

{context.succeed("hi");}

Versions

exports.handler =

function(event,context)

2

{context.succeed("bye");}

Lambda
· 
FunctionName () FunctionName:$LATEST
· 
FunctionName:1 FunctionName:2
· 
FunctionName:production FunctionName:v1_2_3_4


· 
· ARN · 

exports.handler = function(event,context) {context.succeed("hi");}
exports.handler = function(event,context) {context.succeed("bye");}

prod
Aliases dev

APILambda
Amazon API Gateway: API

AWS Lambda: 

· /prod/my_url_endpoint 
· MyFunction:prod_rel

· MyFunction:prod_rel 
· Function:3  · {your code}

 

AWS Lambda 
100

Lambda   HTTP


CRUD

AWS Lambda
aws.amazon.com/blogs/compute aws.amazon.com/lambda AWS Lambda

