#RSAC
SESSION ID: CSCS-R05
CloudTrail Logging Internals: Investigating AWS Security Incidents
Omer Gull
Senior Security Researcher Hunters @GullOmer


 


#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA® Conference, RSA Security LLC or any other co-sponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Security LLC or its affiliates. All rights reserved. RSA Conference logo, RSA and other trademarks are trademarks of RSA Security LLC or its affiliates.
2




#RSAC
Disclaimer #2
All work presented here was done by the amazing Eliav Livneh Couldn't be here due to very happy circumstances 

eliav@hunters.ai /EliavLivneh
     


3



#RSAC
Agenda
The AWS Control Plane Investigating an incident ­ What questions to ask ­ How to ask those questions ­ CloudTrail internals Examples of CloudTrail-complexity


 

 
 


4

#RSAC
The AWS Control Plane
Actions taken using AWS API Over 300 services, Over 10K actions Attacks in the cloud will often pivot between the Control and the Data planes Typically, defenders are more comfortable in the Data plane


 



5

#RSAC
Data Sources for Control Plane Investigation
Config - Audit and evaluate AWS resources CloudTrail - Detailed log of all API actions
6



#RSAC
GuardDuty Alert as an Example
7

#RSAC
GuardDuty Alert as an Example
8

#RSAC
Basic triage questions
9

#RSAC
Basic triage questions
1. Who did it?
10

#RSAC
Basic triage questions
1. Who did it? 2. What did they do?
11



#RSAC
Basic triage questions
1. Who did it? 2. What did they do? 3. From where?





12

#RSAC
Basic triage questions
1. Who did it? 2. What did they do? 3. From where?





13

#RSAC
Basic triage questions
1. Who did it? 2. What did they do? 3. From where?





14

#RSAC
Basic triage questions
1. Who did it? 2. What did they do? 3. From where?





15

#RSAC
Basic triage questions
1. Who did it? 2. What did they do? 3. From where?





16

Basic triage questions

#RSAC

1. Who did it?

We'll focus on these

2. What did they do?

3. From where?





17

#RSAC
Today's talk
Methodology for finding out who did it and what they did CloudTrail-only Maximum accuracy
18




#RSAC
Disclaimer
There are simpler ways that can give 80% results We're going for 99%
19



#RSAC
Before we continue...
Prerequisites: CloudTrail logging enabled Logs accessible and queryable (Athena/Snowflake/etc.) Best-practice CloudTrail configuration





20



#RSAC
CloudTrail Best Practices
Although CloudTrail provides 90 days of history - Create a Trail Apply trails to all regions in all your AWS accounts/organization Log both Read/Write API activity Log Data events for sensitive resources
21

 



#RSAC
Athena & CloudTrail
CloudTrail stores all logs in S3 buckets Logs are saved as gzipped JSON Athena allows you to interactively query S3 data without managing any clusters/warehouses Can be easily configured from CloudTrail's console


 



22

#RSAC
Answering "who did it?"
We know that following ARN was used: - arn:aws:sts::222222222222:assumed-role/admin/itadmin IAM ARN syntax - arn:aws:sts::aws-account-id:assumed-role/role/session-name But who assumed this role? - This is non-trivial to answer accurately


 







23

#RSAC
AWS Identity Chains
There are several API calls that pivot between identities. Some pivot between AWS accounts, and/or change the identity ARN. They all generate temporary credentials.




24



#RSAC
AWS Identity Chains

There are several API calls that pivot between identities.
Some pivot between AWS accounts, and/or change the identity ARN.
They all generate temporary credentials.

Examples
arn:aws:iam::111111111111:user/eliav Permanent API credentials

GetSessionToken arn:aws:iam::111111111111:user/eliav
Temporary API credentials

 
 
 
 
 


25



#RSAC
AWS Identity Chains
There are several API calls that pivot between identities. Some pivot between AWS accounts, and/or change the identity ARN. They all generate temporary credentials.

Examples
arn:aws:iam::111111111111:user/eliav Permanent API credentials

GetSessionToken arn:aws:iam::111111111111:user/eliav
Temporary API credentials

arn:aws:iam::111111111111:user/eliav Permanent API credentials
 
 
 
 
 
 
 
 


AssumeRole (cross-account)


arn:aws:sts::222222222222:assumed-role/admin/itadmin Temporary API credentials
26



AWS Identity Chains - more complex

IAM user eliav ID #1 Account A

IAM user eliav ID #2 Account A

Assumed role jumprole/eliavl ID #3 Account A

Assumed role admin/itadmin ID #4 Account B

GetSessionToken

AssumeRole

AssumeRole

#RSAC

By following the chain backwards, we know "who did it"


 
 
 
 
 
 
 
 
 


27

#RSAC
Next question - "What did they do?"
We now have all ARNs related to the activity So, shall we just search for all events with the ARNs?





28

#RSAC
ARNs aren't unique; access keys are
Multiple people/services can use "arn:aws:sts::222222222222:assumed-role/admin/itadmin" simultaneously.
Searching for all events with this ARN can lead to results from different "sessions".
So, what are 100% unique*? API access keys!





29

#RSAC
Following the access keys
With API calls, easy - just follow the identity chain.
30

Following the access keys

With API calls, easy - just follow the identity chain.

IAM user eliav Permanent creds
Account A ID #1 AKIA....JF3

IAM user eliav Temporary creds
Account A ID #2 ASIA....5OA

Assumed role jumprole/eliavl Temporary creds
Account A ID #3 ASIA....K5J

Assumed role admin/itadmin Temporary creds
Account B ID #4 ASIA....8EI

GetSessionToken

AssumeRole

AssumeRole

#RSAC

    
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


31


#RSAC
Following the access keys

With API calls, easy - just follow the identity chain.

IAM user eliav Permanent creds
Account A ID #1 AKIA....JF3

IAM user eliav Temporary creds
Account A ID #2 ASIA....5OA

Assumed role jumprole/eliavl Temporary creds
Account A ID #3 ASIA....K5J

Assumed role admin/itadmin Temporary creds
Account B ID #4 ASIA....8EI

GetSessionToken

AssumeRole

AssumeRole

However, web sessions are a bit different

­ Web console require username and password

­ All AWS API calls require access key + secret key

    
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 



 


32

#RSAC
Web console internals
User logs in to web with username and password Behind the scenes, temporary API credentials are dynamically generated Web console makes API calls on your behalf and displays results Different access key generated per region
How to find these API access keys?
33

 
 


#RSAC
Web console internals
User logs in to web with username and password Behind the scenes, temporary API credentials are dynamically generated Web console makes API calls on your behalf and displays results Different access key generated per region
How to find these API access keys?
34

 
 


#RSAC
35

Web console internals
"eventName": "ConsoleLogin", "eventTime": "2021-08-27T19:42:56Z", "userIdentity": { "arn": "arn:aws:iam::111111111111:user/eliav", ... }


 
 
 
 


#RSAC
36

#RSAC
Web console internals

"eventName": "ConsoleLogin", "eventTime": "2021-08-27T19:42:56Z", "userIdentity": { "arn": "arn:aws:iam::111111111111:user/eliav", ... }

"eventName": "DescribeVolumeStatus",
"e"veevnetnNtaTmimee"": :""D2e0s2c1ri-b0e8A-2v7aTila1b9i:l4it3y:Z0o2nZe",s",
"e"vee"vnuetsnNetarTImidmeeen"":t:i"t"Dy2"e0:s2{c1ri-b0e8I-n2s7taTn1c9e:4s3",:02Z", "e"vuesne"trTaIicdmceeens"ts:iKt"ye2"y0:Id2{ 1":-0"A8-S2IA7TE1X9A:M43P:L0E20Z1"2, 34567", "use"raI"cdacerennst"si:Kty"e"ay:rInd{ :"a:w"As:SiaIAmE:X:1A1M1P1L1E10111213141516:u7s"e, r/eliav",
"a"cac"resnse"ss:Ks"eiaoyrnIndC:"ao:wn"Atse:SixaItAm"E::X{:1A1M1P1L1E10111213141516:u7s"e, r/eliav", "a"rsne"s:"s"aiaottrnrnCi:baouwnttese:six"at:m"{::{:111111111111:user/eliav", "ses"saiottn"rCicbrouenatteteisox"tn:"D{: a{te": "2019-01-21T19:42:56Z",
"att"r}icb,rueatetiso"n: D{ ate": "2019-01-21T19:42:56Z", "}c,}r,eationDate": "2019-01-21T19:42:56Z", },},}
},}
}


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


37

#RSAC
Web console internals

"eventName": "ConsoleLogin", "eventTime": "2021-08-27T19:42:56Z", "userIdentity": { "arn": "arn:aws:iam::111111111111:user/eliav", ... }

"eventName": "DescribeVolumeStatus",
"e"veevnetnNtaTmimee"": :""D2e0s2c1ri-b0e8A-2v7aTila1b9i:l4it3y:Z0o2nZe",s",
"e"vee"vnuetsnNetarTImidmeeen"":t:i"t"Dy2"e0:s2{c1ri-b0e8I-n2s7taTn1c9e:4s3",:02Z", "e"vuesne"trTaIicdmceeens"ts:iKt"ye2"y0:Id2{ 1":-0"A8-S2IA7TE1X9A:M43P:L0E20Z1"2, 34567", "use"raI"cdacerennst"si:Kty"e"ay:rInd{ :"a:w"As:SiaIAmE:X:1A1M1P1L1E10111213141516:u7s"e, r/eliav",
"a"cac"resnse"ss:Ks"eiaoyrnIndC:"ao:wn"Atse:SixaItAm"E::X{:1A1M1P1L1E10111213141516:u7s"e, r/eliav", "a"rsne"s:"s"aiaottrnrnCib:oauwntteses:xi"at:"m{: :{:111111111111:user/eliav", "ses"saiottn"rCicbrouenatteteisox"tn:"D{: a{te": "2019-01-21T19:42:56Z",
"att"r}icb,rueatetiso"n: D{ ate": "2019-01-21T19:42:56Z", "}c,}r,eationDate": "2019-01-21T19:42:56Z", },},}
},}
}


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


38

#RSAC
Web console internals

"eventName": "ConsoleLogin", "eventTime": "2021-08-27T19:42:56Z", "userIdentity": { "arn": "arn:aws:iam::111111111111:user/eliav", ... }

"eventName": "DescribeVolumeStatus",
"e"veevnetnNtaTmimee"": :""D2e0s2c1ri-b0e8A-2v7aTila1b9i:l4it3y:Z0o2nZe",s",
"e"vee"vnuetsnNetarTImidmeeen"":t:i"t"Dy2"e0:s2{c1ri-b0e8I-n2s7taTn1c9e:4s3",:02Z", "e"vuesne"trTaIicdmceeens"ts:iKt"ye2"y0:Id2{ 1":-0"A8-S2IA7TE1X9A:M43P:L0E20Z1"2, 34567", "use"raI"cdacerennst"si:Kty"e"ay:rInd{ :"a:w"As:SiaIAmE:X:1A1M1P1L1E10111213141516:u7s"e, r/eliav",
"a"cac"resnse"ss:Ks"eiaoyrnIndC:"ao:wn"Atse:SixaItAm"E::X{:1A1M1P1L1E10111213141516:u7s"e, r/eliav", "a"rsne"s:"s"aiaottrnrnCib:oauwntteses:xi"at:"m{: :{:111111111111:user/eliav", "ses"saiottn"rCicbrouenatteteisox"tn:"D{: a{te": "2019-01-21T19:42:56Z",
"att"r}icb,rueatetiso"n: D{ ate": "2019-01-21T19:42:56Z", "}c,}r,eationDate": "2019-01-21T19:42:56Z", },},}
},}
}


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


39

#RSAC
Web console internals

"eventName": "ConsoleLogin", "eventTime": "2021-08-27T19:42:56Z", "userIdentity": { "arn": "arn:aws:iam::111111111111:user/eliav", ... }

"eventName": "DescribeVolumeStatus",
"e"veevnetnNtaTmimee"": :""D2e0s2c1ri-b0e8A-2v7aTila1b9i:l4it3y:Z0o2nZe",s",
"e"vee"vnuetsnNetarTImidmeeen"":t:i"t"Dy2"e0:s2{c1ri-b0e8I-n2s7taTn1c9e:4s3",:02Z", "e"vuesne"trTaIicdmceeens"ts:iKt"ye2"y0:Id2{ 1":-0"A8-S2IA7TE1X9A:M43P:L0E20Z1"2, 34567", "use"raI"cdacerennst"si:Kty"e"ay:rInd{ :"a:w"As:SiaIAmE:X:1A1M1P1L1E10111213141516:u7s"e, r/eliav",
"a"cac"resnse"ss:Ks"eiaoyrnIndC:"ao:wn"Atse:SixaItAm"E::X{:1A1M11P1L1E10112131415:6u7s"e,r/eliav", "a"rsne"s:"s"aiaottrnrnCib:oauwntteses:xi"at:"m{: :{:111111111111:user/eliav", "ses"saiottn"rCicbrouenatteteisox"tn:"D{: a{te": "2019-01-21T19:42:56Z",
"att"r}icb,rueatetiso"n: D{ ate": "2019-01-21T19:42:56Z", "}c,}r,eationDate": "2019-01-21T19:42:56Z", },},}
},}
}


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


40

#RSAC
Web console internals

or SwitchRole/RenewRole "eventName": "ConsoleLogin", "eventTime": "2021-08-27T19:42:56Z", "userIdentity": { "arn": "arn:aws:iam::111111111111:user/eliav", ... }

"eventName": "DescribeVolumeStatus",
"e"veevnetnNtaTmimee"": :""D2e0s2c1ri-b0e8A-2v7aTila1b9i:l4it3y:Z0o2nZe",s",
"e"vee"vnuetsnNetarTImidmeeen"":t:i"t"Dy2"e0:s2{c1ri-b0e8I-n2s7taTn1c9e:4s3",:02Z", "e"vuesne"trTaIicdmceeens"ts:iKt"ye2"y0:Id2{ 1":-0"A8-S2IA7TE1X9A:M43P:L0E20Z1"2, 34567", "use"raI"cdacerennst"si:Kty"e"ay:rInd{ :"a:w"As:SiaIAmE:X:1A1M1P1L1E10111213141516:u7s"e, r/eliav",
"a"cac"resnse"ss:Ks"eiaoyrnIndC:"ao:wn"Atse:SixaItAm"E::X{:1A1M11P1L1E10112131415:6u7s"e,r/eliav", "a"rsne"s:"s"aiaottrnrnCib:oauwntteses:xi"at:"m{: :{:111111111111:user/eliav", "ses"saiottn"rCicbrouenatteteisox"tn:"D{: a{te": "2019-01-21T19:42:56Z",
"att"r}icb,rueatetiso"n: D{ ate": "2019-01-21T19:42:56Z", "}c,}r,eationDate": "2019-01-21T19:42:56Z", },},}
},}
}


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


41

#RSAC
Web console internals - recap
User logs in to web with username and password Behind the scenes, temporary API credentials are dynamically generated Web console makes API calls on your behalf and displays results Different access key generated per region
We now know how to find all relevant access keys for the session
42

 
 


#RSAC
Now what?
Now we need to see which actions those access keys did during the session We can simply search for all CloudTrail events with these access keys! Well... technically true, but it's hard to consume: ­ Every single API call is logged separately
Simple web sessions often generate thousands of events ­ Logging is not entirely comprehensive
Varying levels of logging across services
43

 

 
 
 


#RSAC
Some tips in constructing meaningful sessions
We are going to create easily consumable AWS sessions To successfully do so it is important to understand some CloudTrail internals
44



#RSAC
Some CloudTrail corners... #1

resources field

"on what was the action done"

Critical for context

­ e.g. Prod DC vs. dev test machine

Only being populated by ~10%-15% of the services :(

Non-populating services: IAM, EC2, Lambda, RDS, Secrets Manager, etc...

We use this field when populated


 
 
 

 


45

#RSAC
Some CloudTrail corners... #2

readOnly field Indicates if API call changed resources or not Helps zooming in on the sensitive/interesting actions Isn't always populated :( ­ Historically, only ~20% populated ­ Q4/20, 20% -> 100% population! Isn't necessarily a good indicator - these are read-only: ­ STS AssumeRole, GetSessionToken ­ S3 GetObject ­ So, we maintain a list of "sensitive read-only" events


 
 
 
 
 
 
 
 


46

#RSAC
Some CloudTrail corners... #3
When resources unpopulated, we can use requestParameters ­ Each API targeting a resource has some request parameter Unfortunately, the parameter names aren't standardized ­ For example, AttachRolePolicy receives policyArn but UpdatePolicy
receives policyId Also, when API call fails with IAM AccessDenied, requestParameters is empty :( ­ However, errorMessage is not :)



 



 


47

#RSAC
Some CloudTrail corners... #4
A common parameter in RequestParameters filterSet:items ­ Available in "resource-searching" API calls ­ Very helpful in understanding the intention of the session
48

 

 

#RSAC
So, best effort
To summarize all events in a consumable way, we group by API call, and:
Count number of total calls Count successful / failed calls Extract a sample resources JSON (if populated) Extract target resource from IAM access denied error messages Extract a sample requestParameters JSON (for non-read-only events) Extract a sample requestParameters filter (for read-only events)
49

 

 
 
 


#RSAC
From this
50

#RSAC
To this
51

#RSAC
To this
52

#RSAC
CloudTrail quirks

#RSAC
Fun quirk #1 - CloudTrail source IP spoofing
Once obtaining compromised AWS API credentials By utilizing VPC endpoints Attackers can spoof the source IP that appears in the victim's CloudTrail logs.
54




#RSAC
Technique Overview
55

#RSAC
Technique Overview
56

#RSAC
Technique Overview
57

#RSAC
Technique Overview
58

#RSAC
Technique Overview
59

#RSAC
Technique Overview
60

#RSAC
Technique Overview
61

#RSAC
Technique Overview
62

#RSAC
Fun quirk #2 - API access key recycling
API access keys are supposed to be unique...
63


#RSAC
Fun quirk #2 - API access key recycling
API access keys are supposed to be unique... Or so I thought
64



#RSAC
Fun quirk #2 - API access key recycling

{ "awsRegion": "us-east-1", "eventID": "889087b1-852f-4871-b1bd-cc7bde9d 0c", "eventName": "AssumeRole", "eventSource": "sts.amazonaws.com", "eventTime": "2021-08-21T19:36:15Z", "responseElements": { "assumedRoleUser": {
"arn": "arn:aws:sts::**************************************_6fd7f06b", "assumedRoleId": "AROA*****************************_6fd7f06b" }, "creden als": { "accessKeyId": "ASIA***********TEASS", "expira on": "Aug 21, 2021 8:36:15 PM", "sessionToken": "*************************9UOs5x3qs==" } } }

"awsRegion": "us-east-1", "eventID": "368084bd-cdab-4be9-95b2-d304c57dea25", "eventName": "AssumeRole", "eventSource": "sts.amazonaws.com", "eventTime": "2021-08-21T20:01:51Z", "responseElements": { "assumedRoleUser": {
"arn": "arn:aws:sts::*************************************_e6880947", "assumedRoleId": "AROA*****************************_e6880947" }, "creden als": { "accessKeyId": "ASIA***********TEASS", "expira on": "Aug 21, 2021 9:01:51 PM", "sessionToken": "*************************msA4Zq1iM=" } } }


 
 
 
 
 
 
 
 
 t t t t i i i i 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 f 
 f 
 
 
 
 
 


65

#RSAC
Fun quirk #2 - API access key recycling

{ "awsRegion": "us-east-1", "eventID": "889087b1-852f-4871-b1bd-cc7bde9d 0c", "eventName": "AssumeRole", "eventSource": "sts.amazonaws.com", "eventTime": "2021-08-21T19:36:15Z", "responseElements": { "assumedRoleUser": {
"arn": "arn:aws:sts::**************************************_6fd7f06b", "assumedRoleId": "AROA*****************************_6fd7f06b" }, "creden als": { "accessKeyId": "ASIA***********TEASS", "expira on": "Aug 21, 2021 8:36:15 PM", "sessionToken": "*************************9UOs5x3qs==" } } }

"awsRegion": "us-east-1", "eventID": "368084bd-cdab-4be9-95b2-d304c57dea25", "eventName": "AssumeRole", "eventSource": "sts.amazonaws.com", "eventTime": "2021-08-21T20:01:51Z", "responseElements": { "assumedRoleUser": {
"arn": "arn:aws:sts::*************************************_e6880947", "assumedRoleId": "AROA*****************************_e6880947" }, "creden als": { "accessKeyId": "ASIA***********TEASS", "expira on": "Aug 21, 2021 9:01:51 PM", "sessionToken": "*************************msA4Zq1iM=" } } }


 
 
 
 
 
 
 
 
 t t t t i i i i 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 f 
 f 
 
 
 
 
 


66

#RSAC
Fun quirk #2 - API access key recycling

{ "awsRegion": "us-east-1", "eventID": "889087b1-852f-4871-b1bd-cc7bde9d 0c", "eventName": "AssumeRole", "eventSource": "sts.amazonaws.com", "eventTime": "2021-08-21T19:36:15Z", "responseElements": { "assumedRoleUser": {
"arn": "arn:aws:sts::**************************************_6fd7f06b", "assumedRoleId": "AROA*****************************_6fd7f06b" }, "creden als": { "accessKeyId": "ASIA***********TEASS", "expira on": "Aug 21, 2021 8:36:15 PM", "sessionToken": "*************************9UOs5x3qs==" } } }

"awsRegion": "us-east-1", "eventID": "368084bd-cdab-4be9-95b2-d304c57dea25", "eventName": "AssumeRole", "eventSource": "sts.amazonaws.com", "eventTime": "2021-08-21T20:01:51Z", "responseElements": { "assumedRoleUser": {
"arn": "arn:aws:sts::*************************************_e6880947", "assumedRoleId": "AROA*****************************_e6880947" }, "creden als": { "accessKeyId": "ASIA***********TEASS", "expira on": "Aug 21, 2021 9:01:51 PM", "sessionToken": "*************************msA4Zq1iM=" } } }


 
 
 
 
 
 
 
 
 t t t t i i i i 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 f 
 f 
 
 
 
 
 


67

#RSAC
Fun quirk #2 - API access key recycling

{ "awsRegion": "us-east-1", "eventID": "889087b1-852f-4871-b1bd-cc7bde9d 0c", "eventName": "AssumeRole", "eventSource": "sts.amazonaws.com", "eventTime": "2021-08-21T19:36:15Z", "responseElements": { "assumedRoleUser": {
"arn": "arn:aws:sts::**************************************_6fd7f06b", "assumedRoleId": "AROA*****************************_6fd7f06b" }, "creden als": { "accessKeyId": "ASIA***********TEASS", "expira on": "Aug 21, 2021 8:36:15 PM", "sessionToken": "*************************9UOs5x3qs==" } } }

"awsRegion": "us-east-1", "eventID": "368084bd-cdab-4be9-95b2-d304c57dea25", "eventName": "AssumeRole", "eventSource": "sts.amazonaws.com", "eventTime": "2021-08-21T20:01:51Z", "responseElements": { "assumedRoleUser": {
"arn": "arn:aws:sts::*************************************_e6880947", "assumedRoleId": "AROA*****************************_e6880947" }, "creden als": { "accessKeyId": "ASIA***********TEASS", "expira on": "Aug 21, 2021 9:01:51 PM", "sessionToken": "*************************msA4Zq1iM=" } } }


 
 
 
 
 
 
 
 
 t t t t i i i i 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 f 
 f 
 
 
 
 
 


68

#RSAC
Fun quirk #2 - API access key recycling

{ "awsRegion": "us-east-1", "eventID": "889087b1-852f-4871-b1bd-cc7bde9d 0c", "eventName": "AssumeRole", "eventSource": "sts.amazonaws.com", "eventTime": "2021-08-21T19:36:15Z", "responseElements": { "assumedRoleUser": {
"arn": "arn:aws:sts::**************************************_6fd7f06b", "assumedRoleId": "AROA*****************************_6fd7f06b" }, "creden als": { "accessKeyId": "ASIA***********TEASS", "expira on": "Aug 21, 2021 8:36:15 PM", "sessionToken": "*************************9UOs5x3qs==" } } }

"awsRegion": "us-east-1", "eventID": "368084bd-cdab-4be9-95b2-d304c57dea25", "eventName": "AssumeRole", "eventSource": "sts.amazonaws.com", "eventTime": "2021-08-21T20:01:51Z", "responseElements": { "assumedRoleUser": {
"arn": "arn:aws:sts::*************************************_e6880947", "assumedRoleId": "AROA*****************************_e6880947" }, "creden als": { "accessKeyId": "ASIA***********TEASS", "expira on": "Aug 21, 2021 9:01:51 PM", "sessionToken": "*************************msA4Zq1iM=" } } }


 
 
 
 
 
 
 
 
 t t t t i i i i 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 f 
 f 
 
 
 
 
 


69

#RSAC
Fun quirk #2 - API access key recycling

{ "awsRegion": "us-east-1", "eventID": "889087b1-852f-4871-b1bd-cc7bde9d 0c", "eventName": "AssumeRole", "eventSource": "sts.amazonaws.com", "eventTime": "2021-08-21T19:36:15Z", "responseElements": { "assumedRoleUser": {
"arn": "arn:aws:sts::**************************************_6fd7f06b", "assumedRoleId": "AROA*****************************_6fd7f06b" }, "creden als": { "accessKeyId": "ASIA***********TEASS", "expira on": "Aug 21, 2021 8:36:15 PM", "sessionToken": "*************************9UOs5x3qs==" } } }

"awsRegion": "us-east-1", "eventID": "368084bd-cdab-4be9-95b2-d304c57dea25", "eventName": "AssumeRole", "eventSource": "sts.amazonaws.com", "eventTime": "2021-08-21T20:01:51Z", "responseElements": { "assumedRoleUser": {
"arn": "arn:aws:sts::*************************************_e6880947", "assumedRoleId": "AROA*****************************_e6880947" }, "creden als": { "accessKeyId": "ASIA***********TEASS", "expira on": "Aug 21, 2021 9:01:51 PM", "sessionToken": "*************************msA4Zq1iM=" } } }


 
 
 
 
 
 
 
 
 t t t t i i i i 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 f 
 f 
 
 
 
 
 


70

#RSAC
Fun quirk #2 - API access key recycling
API access keys are supposed to be unique... Or so I thought Turns out they are recycled across identities
71

  


#RSAC
Fun quirk #2 - API access key recycling
API access keys are supposed to be unique... Or so I thought Turns out they are recycled across identities
72

  


#RSAC
Fun quirk #2 - API access key recycling
API access keys are supposed to be unique... Or so I thought Turns out they are recycled across identities
73

  


#RSAC
Fun quirk #2 - API access key recycling
74

#RSAC
Fun quirk #2 - API access key recycling
75

#RSAC
Fun quirk #2 - API access key recycling
API access keys are supposed to be unique... Or so I thought Turns out they are recycled across identities Not a security risk ­ Happens only rarely ­ Only recycled in-account ­ No "cross-permissions" possible


 
 
 
 
 


76

#RSAC
What AWS can improve
More comprehensive logging Better documentation
77



#RSAC
AWS Detective
Amazon's own investigation service utilizing ­ VPC flow logs ­ CloudTrail ­ GuardDuty Helps contextualize alerts and spot anomalies Limited chain following capabilities



 






78

#RSAC
Apply What You Have Learned Today
Store CloudTrail in queryable manner Understand the concept of AWS Sessions Able to follow the activity of a single user across cloudtrail logs Use the knowledge provided to create consumable AWS Session summary query Avoid common pitfalls and quirks when investigating AWS incidents


 



79



