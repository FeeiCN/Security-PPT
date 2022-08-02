®
Modern Identity Strategies to Securely Manage Your Cloud Infrastructure
SANS Cloud Security Summit
Michael Soule @MySnozzberries

Who Are You? Who, who, who, who?

1930s

X.500
Foundation of Active Directory Helps define what is a "digital identity" In some form of use in every business

1990s

ALWAYS LEADING
Modern Auth
Abstraction of auth for use on the web Simplifies inter-organization trusts Separation of identity and resources

Social Security Numbers
Standard for nearly 100 years $2.3B Identity Theft Services Industry Very Common Issue

1980s

Kerberos
Solves auth to resources Requires a common Key Dist. Center Business to business trust is tricky

2000s

3

AWS IAM Overview

Service Provider (SP) Accepts SAML assertions
signed by the Identity Provider (IdP)

AWS Accounts are Segmentation Boundaries

Policies have a many to many relationship with
Roles & Users

This includes Users, Roles, & Policies

Services can assume Roles in Accounts as well

ALWAYS LEADING
AWS Account
Segmented service tenants
IAM Role
Associates a Policy with an acting Principal
Identity & Access Management (IAM) Policy
Defines specific Actions to specific Resources with specific Conditions
Lambda
Compute platform that executes code on triggers
5

What is the pain
Role Assumption
Alice's credentials in an Identity Account provide access in all accounts

ALWAYS LEADING
Use SAML
Authentication happens at the IdP and the user is
assigned a Role

Consistent management across accounts
of Policies and Roles
8

How to Centrally Manage Roles & Policies

ALWAYS LEADING

Simple Storage Service (S3)
Binary Large OBject (BLOB) storage bucket

CloudWatch Event
Time based event trigger, similar to Cron
10

Why Lambda

ALWAYS LEADING

Encourages good scripting practices

Experience with current trends

1 Million
Free requests per month per account

Purpose built "utility server"

Direct integration with other services

11

Demo

ALWAYS LEADING

Demo

12

Additional Resources
Code: https://bit.ly/2T9DTJK
https://github.com/Snozzberries/AWS-Role-Manager

ALWAYS LEADING
Organization Formation https://bit.ly/2zEmv9f
https://github.com/OlafConijn/AwsOrganizationFormation

Organization CloudFormation StackSets https://go.aws/2zFDjgf
https://aws.amazon.com/blogs/aws/new-use-aws-cloudformation-stacksets-for-multiple-accounts-in-an-aws-organization/

Blog: https://bit.ly/36cUp1a
https://adamtheautomator.com/aws-lambda-powershell

Azure AD Integration with AWS for SAML https://bit.ly/2AA9zSd
https://docs.microsoft.com/en-us/azure/active-directory/saas-apps/aws-multi-accounts-tutorial

Reach out to me: Mike Soule - misoule@sentinel.com - @MySnozzberries

14

Where Do I Start?
Define a federation strategy
· Deploy an Identity Provider (IdP)
Production Service(s) Testing Service(s)
Developer(s)

ALWAYS LEADING

Audit

Identity

Define a multi-account strategy
· Segment more than networks · Manage through deployments · Define Infrastructure as Code

Use specific permissions
· Use single purpose policies · Add to preventative maintenance

x100s

x1

x10s

x100s

15

Code Demo ­ S3 Config

ALWAYS LEADING
16

Code Demo ­ IAM Config

ALWAYS LEADING
17

Code Demo ­ Lambda Config

ALWAYS LEADING
18

Code Demo ­ Show me the money!

ALWAYS LEADING
19

Code Demo ­ It worked!

ALWAYS LEADING
20

