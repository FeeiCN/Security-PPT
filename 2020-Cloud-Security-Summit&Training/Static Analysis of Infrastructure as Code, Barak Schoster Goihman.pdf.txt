Static analysis of Infrastructure as Code
Barak Schoster
Co-Founder & CTO

Barak Schoster Goihman Co-Founder & CTO at

@BarakSchoster

github.com/schosterbarak

toniblyx/Prowler duo-labs/cloudmapper

bridgecrewio/checkov b r i d g e c r e w i o / Te r r a G o a t bridgecrewio/CfnGoat

GCP/terraform-pci-starter

Today 's talk track
1. Setup 2. The state of open source misconfig 3. Config Runtime Analysis 4. Config Static Analysis 5. How to choose?

@BarakSchoster

3

Configuration errors found in the wild

DEFAULT CONFIGURATIONS

DISABLED LOGGING

UNENCRYPTED DATABASES

INSECURE PROTOCOLS

VULNERABLE MIROSERVICES

@BarakSchoster

4

Where do bad configurations come from?
@BarakSchoster

@BarakSchoster

6

Open source misconfigured modules

@BarakSchoster

7

Downloads of misconfigured modules

@BarakSchoster

8

New modules contribution

@BarakSchoster

9

New modules contribution

COVID-19

@BarakSchoster

10

KEEP CALM AND BREAK THINGS
@BarakSchoster

WITH STABLE INFRASTCTURE
@BarakSchoster

Runtime detection of misconfig
·API Polling / Event Based (Cloudtrail, Cloudwatch) ·Identify drift from best practices ·Keeps you aware of your production environment state

@BarakSchoster

13

Prowler Architecture

Source Account

Read Only Role
Describe Resources

Assume Role

Security Account
Cloudwatch Trigger

AWS Analysis Using Prowler

Remediation Lambda

@BarakSchoster

14

I

How do we prevent them from coming back?
@BarakSchoster

·Enable security infrastucture review distribution ·Apache-2 License ·Written in Pythonese ·100+ built in checks for Cloudformation, Terraform and Kubernetes ·Checks can be skipped ·Support extention ·CI/CD Integrations

@BarakSchoster

17

Checkov Architecture
3 Deployment Trigger

Source Account

1 Change
Request

Terraform/

4

Cloudformation/ Kubernetes

apply

2 Infrastructure
security tests

@BarakSchoster

18

@BarakSchoster

19

MAKE THIS SHIT AUTOMATIC AGAIN
@BarakSchoster

TerraGoat & CfnGoat ­ 'Vulnerable-by-Design' Infrastructure Code
https://github.com/bridgecrewio/terragoat https://github.com/bridgecrewio/cfngoat

@BarakSchoster

21

Pre-commit hook demo ahead of you
@BarakSchoster

@BarakSchoster

23

@BarakSchoster

24

https://github.com/bridgecrewio/checkov

Key takeways

AWS Config Analysis
Centralized in security Part of production monitoring Scalable across multiple accounts Minutes to identify Address: Compliance, Security, SRE

Static config analysis
Distributed in the engineering team Part of CI/CD Scalable across multiple repositories Not aware of production state Seconds to identify Address: developers

@BarakSchoster

@BarakSchoster

So... what should I do?

Checkov Architecture + Prowler

3 Deployment Trigger

Source Account

1 Change
Request

4 Terraform/
Cloudformation
apply

2 Infrastructure
security tests

5 Production
Security
Tests

@BarakSchoster

29

Questions?
@BarakSchoster

Thank You!
github.com/schosterbarak @barak_58758 @BarakSchoster

