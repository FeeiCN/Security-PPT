SESSION ID: OST-T12
Democratizing Security Knowledge and Automating Decisions

Sacha Faust
Manager ­ Proactive Security Lyft @sachafaust

Alex Chantavy
Software Engineer­ Proactive Security Lyft @alexchantavy

#RSAC

#RSAC

#RSAC
http://www.information-age.com/calming-big-data-shouting-match-123467657/

#RSAC

#RSAC

#RSAC
Team Mission Empower Lyft and the community to make informed and automated security decisions

#RSAC

#RSAC
Cartography
https://github.com/lyft/cartography

#RSAC
9

#RSAC
10

#RSAC
11

#RSAC
12

#RSAC

#RSAC
Photo by Ian Espinosa on Unsplash

#RSAC
15

#RSAC
16

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC
Risk analysis ­ Okta to AWS transitivity
24

Risk analysis ­ exploring cross account connectivity

#RSAC

25

0.0.0.0/0

MATCH (:IpRange{id: `0.0.0.0/0'})-[:MEMBER_OF_IP_RULE] ->(:IpPermissionInbound) -[:MEMBER_OF_EC2_SECURITY_GROUP]->(:EC2SecurityGroup) <-[:MEMBER_OF_EC2_SECURITY_GROUP*..2]-(instance:EC2Instance)
SET instance.exposed_internet = True

#RSAC

{exposed_internet: True}

MATCH (elb:LoadBalancer{scheme: `internet-facing'})-[:EXPOSE]->(e:EC2Instance) SET elb.exposed_internet = True, e.exposed_internet = True
{ exposed_internet: True }

Risk analysis ­ cross-account connectivity with inet-

#RSAC

exposed instances

27

#RSAC
Photo by Adeolu Eletu on Unsplash

#RSAC

#RSAC
Drift detection
Monitor infrastructure assets over time Alert when actual infra  expected infra
30

#RSAC
Thank you, contributors and users! 
Featured work from the community:
­ GCP storage buckets ­ AWS Elastic Load Balancer v2 ­ ... 10+ more
Getting started as a contributor
­ Check out our developer guide in docs/ at https://github.com/lyft/cartography
31

#RSAC

#RSAC

#RSAC

#RSAC

Sacha Faust @sachafaust

#RSAC
Alex Chantavy @alexchantavy
Photo by Ian Schneider on Unsplash

