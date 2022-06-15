SESSION ID: ASD-F02
DevSecOps for the Rest of Us!

Sara Perrott
Sr. Information Security Technology Engineer BECU Twitter: @PerrottSara

#RSAC

More Time in the Day
Don't you wish you had more time? Time for project work? Time for training? Time for lunch? Time for vacation?
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
This Photo by Unknown Author is licensed under CC BY-NC-ND

Cloning Technology
Wouldn't it be great if there were more of you?
Too much manual work Poor work/life balance Stress Burnout

Presenter's Company Logo ­ replace or
delete on master slide

This Photo by Unknown Author is licensed under CC BY-SA

#RSAC

Automation
Imagine if you will...
A ticket is created in your ticketing system for a new server That ticket kicks off a workflow, and the server is automatically built with the specifications from the ticket Instead of the server build taking a few hours, it is done within 15-30 minutes
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
This Photo by Unknown Author is licensed under CC BYSA

#RSAC
What is DevOps and DevSecOps?

DevOps
­ Continuous Integration ­ Continuous Delivery
DevSecOps
­ Moving Security to the Left
What does this have to do with me?
Presenter's Company Logo ­ replace or
delete on master slide

This Photo by Unknown Author is licensed under CC BY

#RSAC
DevOps/DevSecOps is not just for Developers!

This Photo by Unknown Author is licensed under CC BY-SA

Presenter's Company

Logo ­ replace or delete on master slide

6

#RSAC
Tools in Your Arsenal-PowerShell
Universal language Expandable with modules Product Specific modules: PowerShell Gallery Tell it how it should be built

Presenter's Company

Logo ­ replace or delete on master slide

7

#RSAC
Tools in Your Arsenal-PowerShell Issues

Remote PowerShell
Firewall ports:
­ WinRM
o TCP 5985 (HTTP) o TCP 5986 (HTTPS)
Execution Policy
­ RemoteSigned

Presenter's Company Logo ­ replace or
delete on master slide

This Photo by Unknown Author is licensed under CC BY-SA
8

#RSAC
Tools in Your Arsenal-PowerShell DSC
Saved as ps1 Tell it what it is
­ not how it is

Presenter's Company

Logo ­ replace or delete on master slide

9

#RSAC
Tools in Your Arsenal-PowerShell DSC Issues

Behavior: Push or Pull Know the correct names
­ Roles ­ Features ­ Services
Presenter's Company Logo ­ replace or
delete on master slide

This Photo by Unknown Author is licensed under CC BY-NC-ND
10

When to use...
PowerShell
Instructions (How)
This Photo by Unknown Author is licensed under CC BY-NC-ND
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
PowerShell DSC
Vision (What)
This Photo by Unknown Author is licensed under CC BY-SA

#RSAC
Infrastructure as Code
IaC is a methodology-not a product! Treat systems like software
­ PowerShell ­ PowerShell DSC ­ Templates ­ Automation/Orchestration Tools
This Photo by Unknown Author is licensed under CC BY-SA-NC
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Tools in Your Arsenal-REST API
What makes up a REST API? From F5's NetOps Training:

Presenter's Company

Logo ­ replace or delete on master slide

13

#RSAC
Tools in Your Arsenal-REST API Troubleshooting
Authentication
­ API keys
o For authentication, not authorization
Access
­ Firewall Ports: usually TCP 80 & 443

Presenter's Company

Logo ­ replace or delete on master slide

14

#RSAC
Automating Firewalls and Other Appliances

Rest API
Vendor specific Powerful Easy to integrate into programs

PowerShell
PowerShell uses known syntax
Modules are available from:
­ Vendor
o Vendor site o Github
­ PowerShell Gallery

Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Tools in Your Arsenal-CloudFormation

Traits
Simple, declarative Editable with your fav text editor Available from your fav vendors!

AWS WAF Example

Presenter's Company

Logo ­ replace or delete on master slide

16

#RSAC
Tools in Your Arsenal-ARM Templates

Traits
Simple, declarative Editable with your fav text editor Available from your fav vendors!

ARM WAF Example

Presenter's Company

Logo ­ replace or delete on master slide

17

#RSAC
Tools in Your Arsenal-Azure Automation

Traits
Editable with Azure's graphical editor
Sample runbooks available from the Azure Marketplace

Runbook Example

Presenter's Company

Logo ­ replace or delete on master slide

18

#RSAC
JSON Troubleshooting
Trailing comma ­ your arch nemesis

Presenter's Company

Logo ­ replace or delete on master slide

19

Automation Tools
Chef
Tons of free training Azure/AWS native support DevOps Focus

#RSAC
Puppet
Paid and Free Training Azure/AWS native support Operations/System Admin Focus

Presenter's Company Logo ­ replace or
delete on master slide

Recap-Tying Things Together

Automate routine tasks You don't have to be a developer to benefit... You can go on vacation!

Presenter's Company Logo ­ replace or
delete on master slide

This Photo by Unknown Author is licensed under CC BY-NC-ND
21

#RSAC

#RSAC
"Apply" Slide

Next week you should:
­ Define at least one use case where you can start using DevSecOps to improve your life

In the first three months following this presentation you should:
­ Get more comfortable with PowerShell and PowerShell DSC if you are not already
­ Play with JSON and get familiar with the syntax

Within six months you should:
­ Be working on your first use case...

Presenter's Company

Logo ­ replace or delete on master slide

22

#RSAC
Learning Resources-Videos
Pluralsight
­ Paths: Windows PowerShell: Essentials ­ Windows PowerShell Desired State Configuration Fundamentals ­ Automating AWS with CloudFormation ­ Getting Started with Azure Automation ­ Getting Productive with Chef Cookbooks ­ Paths: Configuration Management using Puppet
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Learning Resources-Books
Learn Windows PowerShell in a Month of Lunches, 3rd Edition
­ By Don Jones and Jeffery Hicks
Pro PowerShell Desired State Configuration
­ By Ravikanth Chagani
Implementing DevOps with Microsoft Azure
­ By Mitesh Soni
Effective DevOps with AWS
­ By Nathaniel Felsen
Windows Server 2019 & PowerShell All-in-One Desk Reference For Dummies (Release date: April 30, 2019)
­ By Sara Perrott
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Learning Resources-Other
Other Training
­ F5 NetOps Training https://f5.com/education/super-netops-training ­ Chef Training https://learn.chef.io/#/ ­ Puppet Training https://learn.puppet.com/category/self-paced-training
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Learning Resources-Tools

AWS CloudFormation

Azure ARM

AWS Sample Templates
­ https://aws.amazon.com/cloudformati on/aws-cloudformation-templates/
Check Point Firewalls
­ https://supportcenter.checkpoint.com/ supportcenter/portal?eventSubmit_do Goviewsolutiondetails=&solutionid=sk1 11013
Palo Alto Firewalls
­ https://github.com/PaloAltoNetworks/ aws

Azure Sample Templates
­ https://azure.microsoft.com/enus/resources/templates/
Palo Alto Firewalls
­ https://github.com/PaloAltoNetworks /azure
Cisco Firewalls
­ https://github.com/ciscosecurity/public-cloud

Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Q&A
Sara Perrott saraperrott@icloud.com Twitter: @PerrottSara https://www.saraperrott.com https://github.com/sara-perrott/RSAC2019
Presenter's Company Logo ­ replace or
delete on master slide

