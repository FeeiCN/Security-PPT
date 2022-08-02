SESSION ID: OST-W11
Preventative Container Security

Ross Turk
Anchore @anchore @rossturk

#RSAC

#RSAC
A Quick Overview of Containers

How to Deploy an Internet Service (2002)

linux
kernel libraries services
shell tooling

postgresql
(and dependencies)
httpd
(and dependencies)
memcached
(and dependencies)
code, configuration & data

#RSAC

How to Deploy an Internet Service (2002)

Install the things you need using the linux distribution's built-in package manager
Hardwire things together
Avoid upgrades
Avoid changing anything

linux
kernel libraries services
shell tooling

postgresql
(and dependencies)
httpd
(and dependencies)
memcached
(and dependencies)
code, configuration & data

#RSAC

How to Deploy an Internet Service (2013)

linux

postgresql and deps

code

linux xen linux

httpd and deps

code

linux

httpd and deps

code

linux

httpd and deps

code

linux xen

linux

httpd and deps

code

linux

httpd and deps

code

#RSAC

#RSAC
How to Deploy an Internet Service (2013)

Deploy isolated services inside Linux virtual machines
Quickly scale up and down Simplify dependencies Hardwire things together still

linux

postgresql and deps

code

linux xen linux

httpd and deps

code

linux

httpd and deps

code

linux

httpd and deps

code

linux xen

linux

httpd and deps

code

linux

httpd and deps

code

How to Deploy an Internet Service (2020)

packages, artifacts and configuration

code

linux

packages, artifacts and configuration

code

packages, artifacts and configuration

code

linux

linux

#RSAC

#RSAC
How to Deploy an Internet Service (2020)

Deploy isolated services inside Linux containers
Smaller, more predictable artifacts
Automatic configuration
Continuous deployment

packages, artifacts and configuration

code

linux

packages, artifacts and configuration

code

packages, artifacts and configuration

code

linux

linux

A typical container workflow
CI/CD

#RSAC
Kubernetes

Application code
Language frameworks & artifacts (pip, npm) List of OS packages & dependencies

PUSH

DEPLOY

Everything needed to run a service is packaged into a container image.

Why are containers useful?

#RSAC
Consistency leads to automation
Automation creates speed

Lower overhead increases density

Three distinct security questions

Did I write and commit code safely?
Static code analysis Snyk Dependency check Coverity

Was the final artifact (that will actually execute)
created safely?
Container scanning Anchore Engine Trivy Clair

Did something bad happen anyway?
Runtime monitoring Falco Twistlock

#RSAC

#RSAC
Reuse Changes Software Security

#RSAC
How film directors think code is written

#RSAC
Code grows slowly over time, expanding
and absorbing

#RSAC
The open source movement resulted in a massive software commons

#RSAC
Today's applications have highly distributed
authorship

#RSAC
Modern life depends on trusting someone else's work

#RSAC
If you choose to worry about everything, how can you get
anything done?

#RSAC
Apathy can be extremely dangerous

What version of openssl does that use?

Does that deal with secrets properly?

Who manufactures my discount probiotic?

Did that pilot sound groggy to you?

#RSAC
Containers facilitate automated consumption, testing, and deployment of software

#RSAC
But vulnerabilities hide amongst a larger collection of
discrete components

#RSAC
Infiltrating a large project like Apache httpd

1. Gain the confidence of project members through contribution
2. Acquire the ability to commit code
3. Embed a trojan where nobody is likely to find it
4. Wait for release and adoption

Time investment
Years
Chance of detection
High

#RSAC
Infiltrating a small project like event-stream

1. Find a broadly-used project with a single overwhelmed maintainer
2. Offer to assume maintenance
3. Embed a nasty trojan
4. Wait for CI/CD systems to pull and deploy it

Time investment
Months
Chance of detection
Low

#RSAC
Container Security Best Practices

#RSAC
Basic hygiene: scan for known vulnerabilities
$ ainnlcinheo-rsec-acnli simcaang-epcroanbtbeintmt mq:olantgeostos

#RSAC
Why are containers useful?
Integrate scanning into your
development process

#RSAC
Document the contents of every image

Software Bill of Materials (SBOM)

Code

Configuration files Secrets Licenses

Operating system packages

Code artifacts and libraries

Configuration files Licenses

Data & other files Secrets & Credentials

Network environment Execution environment
Execution command

Create a SBOM
$ anchore-cli image add mongo
$ anchore-cli image get mongo | grep Status

#RSAC

Create a SBOM
$ anchore-cli image content mongo os
$ anchore-cli image content postgres python

#RSAC

#RSAC
Evaluate against policies
$ anchore-cli evaluate check postgres

#RSAC
Policies cover more than just known vulnerabilities

Software Bill of Materials (SBOM)

Code

Configuration files Secrets Licenses

Operating system packages

Code artifacts and libraries

Configuration files Licenses

Data & other files Secrets & Credentials

Network environment Execution environment
Execution command

#RSAC
Automate using CI/CD
scan

CI/CD system

Image Registry

Deployment

#RSAC
Automate image registries
scan

CI/CD system

Image Registry

Deployment

Integrate with Kubernetes

#RSAC
scan

CI/CD system

Image Registry

Deployment

#RSAC
Refine policies over time to establish a baseline of security

#RSAC
How to apply what you have learned
Next week you should:
­ Run a scan on a container image that you regularly use
In the first three months following this presentation you should:
­ Create a software bill of materials (SBOM) for containers you run in production ­ Define the right policies for your organization
Within six months you should:
­ Integrate image scanning and analysis into your CI/CD process ­ Perform regular compliance audits
36

