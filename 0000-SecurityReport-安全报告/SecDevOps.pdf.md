Pre-Commit
Security activities before code is checked in to version control
Threat Modeling/Attack Mapping:
Attacker personas Evil user stories Raindance Mozilla Rapid Risk Assessment OWASP ThreatDragon
Security and Privacy Stories:
OWASP ASVS SAFECode Security Stories
IDE Security Plugins:
DevSkim FindSecurityBugs Puma Scan SonarLint
Pre-Commit Security Hooks:
git-hound git-secrets Repo-supervisor ThoughtWorks Talisman
Secure Coding Standards:
CERT Secure Coding Standards OWASP Proactive Controls
Manual and Peer Reviews:
Gerrit GitHub pull request GitLab merge request Review Board

Commit (Continuous Integration)
Fast, automated security checks during the build and Continuous Integration steps

Static Code Analysis (SCA):
FindSecurityBugs Brakeman ESLint Phan
Security Unit Tests:
JUnit Mocha xUnit
Infrastructure as Code Analysis:
ansible-lint Foodcritic puppet-lint cfn_nag

Dependency Management:
OWASP Dependency Check Bundler-Audit Gemnasium PHP Security Checker Retire.JS Node Security Platform
Container Security:
Actuary Anchore Clair Dagda Docker Bench Falco
Container Hardening:
Bane CIS Benchmarks grsecurity

Acceptance (Continuous Delivery)
Automated security acceptance, functional testing, and deep out-of-band scanning during Continuous Delivery

Infrastructure as Code:
Ansible Chef Puppet SaltStack Terraform Vagrant
Immutable Infrastructure:
Docker rkt
Security Scanning:
Arachni nmap sqlmap sslyze ZAP ssh_scan

Cloud Configuration Management:
AWS CloudFormation Azure Resource Manager Google Cloud Deployment Manager
Security Acceptance Testing:
BDD-Security Gauntlt Mittn
Infrastructure Tests:
Serverspec Test Kitchen
Infrastructure Compliance Checks:
HubbleStack InSpec

Production (Continuous Deployment)
Security checks before, during, and after code is deployed to production

Security Smoke Tests:
ZAP Baseline Scan nmap ssllabs-scan
Configuration Safety Checks:
AWS Config AWS Trusted Advisor Microsoft Azure Advisor Security Monkey OSQuery
Secrets Management:
Ansible Vault Blackbox Chef Vault Docker Secrets Hashicorp Vault Pinterest Knox

Cloud Secrets Management:
AWS KMS Azure Key Vault Google Cloud KMS
Cloud Security Testing:
CloudSploit Nimbostratus
Server Hardening:
dev-sec.io SIMP
Host Intrusion Detection System (HIDS):
fail2ban OSSEC Samhain

Operations
Continuous security monitoring, testing, audit, and compliance checks

Fault Injection:
Chaos Kong Chaos Monkey
Cyber Simulations:
Game day exercises Tabletop scenarios
Penetration Testing:
Attack-driven defense Bug Bounties Red team exercises
Threat Intelligence:
Diamond Model Kill Chain STIX TAXII
Continuous Scanning:
OpenSCAP OpenVAS Prowler Scout2 vuls

Blameless Postmortems:
Etsy Morgue
Continuous Monitoring:
grafana graphite statsd seyren sof-elk ElastAlert 411
Cloud Monitoring:
CloudWatch CloudTrail Reddalert
Cloud Compliance:
Cloud Custodian Compliance Monkey Forseti Security

Building a DevSecOps Program (CALMS)
Culture
Break down barriers between Development, Security, and Operations through education and outreach
Automation
Embed self-service automated security scanning and testing in continuous delivery
Lean
Value stream analysis on security and compliance processes to optimize flow
Measurement
Use metrics to shape design and drive decisions
Sharing
Share threats, risks, and vulnerabilities by adding them to engineering backlogs
Start Your DevOps Metrics Program
Number of high-severity vulnerabilities and how long they are open Build and deployment cycle time Automated test frequency and coverage Scanning frequency and coverage Number of attacks (and attackers) hitting your application

Secure DevOps Toolchain

First Steps in Automation
Build a security smoke test (e.g., ZAP Baseline Scan) Conduct negative unit testing to get off of the happy path Attack your system before somebody else does (e.g., Gauntlt) Add hardening steps into configuration recipes (e.g., dev-sec.io) Harden and test your CI/CD pipelines and do not rely on developer-friendly defaults

Learn to build, deliver, and deploy modern applications using secure DevOps and cloud principles, practices, and tools.
DEV540: Secure DevOps and Cloud Application Security
www.sans.org/DEV540

SANS APPSEC CURRICULUM

PLATFORM SECURITY

CORE

SPECIALIZATION

DEV531
Defending Mobile Applications Security Essentials
DEV541
Secure Coding in Java/JEE GSSP-JAVA
DEV544
Secure Coding in .NET GSSP-NET

STH.DEVELOPER
Application Security Awareness Modules
DEV522
Defending Web Applications Security Essentials GWEB
DEV534
Secure DevOps: A Practical Introduction

SEC542
Web App Penetration Testing and Ethical Hacking GWAPT
SEC642
Advanced Web App Penetration Testing, Ethical Hacking, and Exploitation Techniques
ASSESSMENT

DEV540
Secure DevOps and Cloud Application Security

AppSec CyberTalent Assessment
sans.org/appsec-assessment

Poster4_AppSec_2018.indd 2

Poster contributors: Ben Allen Jim Bird David Deatherage Mark Geeslin Eric Johnson Frank Kim Jason Lam Gregory Leonard Dr. Johannes Ullrich
12/19/17 2:31 PM

Securing Web Application Technologies (SWAT) C H E C K L I S T

The SWAT Checklist provides an easy-to-reference set of best practices that raise awareness and help development teams create more secure applications. It's a first step toward building a base of security knowledge around web application security. Use this checklist to identify the minimum standard that is required to neutralize vulnerabilities in your critical applications.

ERROR HANDLING AND LOGGING

BEST PRACTICE

DESCRIPTION

CWE ID

Display generic error messages

Error messages should not reveal details about the internal state of the application. For example, file system path and stack information should not be exposed to the user through error messages.

CWE-209

No unhandled exceptions
Suppress frameworkgenerated
errors

Given the languages and frameworks in use for web application development, never allow an unhandled exception to occur. Error handlers should be configured to handle unexpected errors and gracefully return controlled output to the user.

CWE-391

Your development framework or platform may generate default error messages. These should be suppressed or replaced with customized error messages, as framework-generated messages may reveal sensitive information to the user.

CWE-209

Log all

Log any authentication and session management activities along

authentication and with all input validation failures. Any security-related events should

validation activities be logged. These may be used to detect past or in-progress attacks.

CWE-778

Log all privilege Any activities or occasions where the user's privilege level changes

changes

should be logged.

CWE-778

Log administrative Any administrative activities on the application or any of its

activities

components should be logged.

CWE-778

Log access to sensitive data

Any access to sensitive data should be logged. This is particularly important for corporations that have to meet regulatory requirements like HIPAA, PCI, or SOX.

CWE-778

Do not log inappropriate
data

While logging errors and auditing access are important, sensitive

CWE-532

data should never be logged in an unencrypted form. For example,

under HIPAA and PCI, it would be a violation to log sensitive data into

the log itself unless the log is encrypted on the disk. Additionally, it

can create a serious exposure point should the web application itself

become compromised.

Store logs securely

Logs should be stored and maintained appropriately to avoid

CWE-533

information loss or tampering by intruders. Log retention should

also follow the retention policy set forth by the organization to meet

regulatory requirements and provide enough information for forensic

and incident response activities.

THE MOST TRUSTED SOURCE FOR INFORMATION SECURITY TRAINING, CERTIFICATION, AND RESEARCH

Security Roadmap
POSTER

Securing Web Application Technologies (SWAT)
CHECKLIST
Version 1.5
AND
Secure DevOps Toolchain

Ingraining security into the mind of every developer.

AppSec_Poster_v1.5_1-18 Poster4_AppSec_2018.indd 1

software-security.sans.org

DATA PROTECTION

BEST PRACTICE

DESCRIPTION

CWE ID

Use HTTPS everywhere

Ideally, HTTPS should be used for your entire application. If you have to CWE-311

limit where it's used, then HTTPS must be applied to any authentication pages as well as to all pages after the user is authenticated. If sensitive information (e.g., personal information) can be submitted before

CWE-319 CWE-523

authentication, those features must also be sent over HTTPS. Always link

to the HTTPS version of URL if available. Relying on redirection from HTTP

to HTTPS increases the opportunity for an attacker to insert a man-in-

the-middle attack without raising the user's suspicion.

EXAMPLE: sslstrip

Disable HTTP access for
all protected resources

For all pages requiring protection by HTTPS, the same URL should not be CWE-319 accessible via the insecure HTTP channel.

Use the StrictTransport-
Security header

The Strict-Transport-Security header ensures that the browser does not talk to the server over HTTP. This helps reduce the risk of HTTP downgrade attacks as implemented by the sslsniff tool.

Store user

User passwords must be stored using secure hashing techniques with

passwords using strong algorithms like PBKDF2, bcrypt, or SHA-512. Simply hashing the

a strong, iterative, password a single time does not sufficiently protect the password. Use

salted hash

adaptive hashing (a work factor), combined with a randomly generated salt for each user to make the hash strong.

EXAMPLE: LinkedIn password leak

CWE-257

Securely exchange If encryption keys are exchanged or pre-set in your application, then any key encryption keys establishment or exchange must be performed over a secure channel.

Set up secure key When keys are stored in your system they must be properly secured and

management only accessible to the appropriate staff on a need-to-know basis.

processes

EXAMPLE: AWS Key Management Service (KMS), Azure Key Vault, AWS CloudHSM

CWE-320

Use strong TLS configurations

Weak ciphers must be disabled on all servers. For example, SSL v2, SSL v3, and TLS protocols prior to 1.2 have known weaknesses and are not considered secure. Additionally, disable the NULL, RC4, DES, and MD5 cipher suites. Ensure all key lengths are greater than 128 bits, use secure renegotiation, and disable compression.
EXAMPLE: Qualys SSL Labs

Use valid HTTPS HTTPS certificates should be signed by a reputable certificate authority.

certificates from The name on the certificate should match the FQDN of the website. The

a reputable

certificate itself should be valid and not expired.

certificate authority EXAMPLE: Let's Encrypt https://letsencrypt.org

Disable data caching using cache control headers and autocomplete

Browser data caching should be disabled using the cache control HTTP headers or meta tags within the HTML page. Additionally, sensitive input fields, such as the login form, should have the autocomplete attribute set to off in the HTML form to instruct the browser not to cache the credentials.

CWE-524

Encrypt sensitive Encrypt sensitive or critical data before storage. data at rest

Limit the use and storage of sensitive data

Conduct an evaluation to ensure that sensitive data elements are not being unnecessarily transported or stored. Where possible, use tokenization to reduce data exposure risks.

CWE-311 CWE-312

CONFIGURATION AND OPERATIONS

BEST PRACTICE

DESCRIPTION

Automate application deployment

Automating the deployment of your application, using Continuous Integration and Continuous Deployment, helps to ensure that changes are made in a consistent, repeatable manner in all environments.

CWE ID

Establish a rigorous change
management process

A rigorous change management process must be maintained during operations. For example, new releases should only be deployed after proper testing and associated documentation has been completed.
EXAMPLE: DevOps Audit Defense Toolkit https://itrevolution.com/devops-audit-defense-toolkit

CWE-439

Define security requirements

Engage the business owner to define security requirements for the application. This includes items that range from the whitelist validation rules all the way to nonfunctional requirements like the performance of the login function. Defining these requirements up front ensures that security is baked into the system.

Conduct a design review

Integrating security into the design phase saves money and time. Conduct a risk review with security professionals and threat model the application to identify key risks. This helps you integrate appropriate countermeasures into the design and architecture of the application.

CWE-701 CWE-656

Perform code reviews

Security-focused code reviews can be one of the most effective ways to find security bugs. Regularly review your code looking for common issues like SQL Injection and Cross-Site Scripting. Leverage automated tools to maximize breadth of coverage and consistency.

CWE-702

Perform security testing

Conduct security testing both during and after development to ensure the application meets security standards. Testing should also be conducted after major releases to ensure vulnerabilities did not get introduced during the update process. Leverage automation by including security tests into the CI/CD pipeline.

Harden the infrastructure

All components of infrastructure that support the application should be configured according to security best practices and hardening guidelines. In a typical web application this can include routers, firewalls, network switches, operating systems, web servers, application servers, databases, and application frameworks.

CWE-15 CWE-656

Define an incident An incident handling plan should be drafted and tested on a regular handling plan basis. The contact list of people to involve in a security incident related to
the application should be well defined and kept up to date.

Educate the team on security

Training helps define a common language that the team can use to improve the security of the application. Education should not be confined solely to software developers, testers, and architects. Anyone associated with the development process, such as business analysts and project managers, should all have periodic software security awareness training.

AUTHENTICATION

BEST PRACTICE

DESCRIPTION

CWE ID

Don't hardcode credentials

Never allow credentials to be stored directly within the application code. CWE-798 While it can be convenient to test application code with hardcoded credentials during development, this significantly increases risk and should be avoided.
EXAMPLE: Hard-coded passwords in networking devices https://www.us-cert.gov/control_systems/pdf/ICSA-12-243-01.pdf

Develop a strong password reset
system

Password reset systems are often the weakest link in an application. These systems are often based on users answering personal questions to establish their identity and in turn reset the password. The system needs to be based on questions that are both hard to guess and brute force. Additionally, any password reset option must not reveal whether or not an account is valid, preventing username harvesting.

CWE-640

EXAMPLE: Sara Palin password hack http://en.wikipedia.org/wiki/Sarah_Palin_email_hack

Implement a strong
password policy

A password policy should be created and implemented so that passwords CWE-521 meet specific strength criteria.
EXAMPLE: https://pages.nist.gov/800-63-3/sp800-63-3.html

Implement account
lockout against brute-force attacks

Account lockout needs to be implemented to prevent brute-force

CWE-307

attacks against both the authentication and password reset functionality.

After several tries on a specific user account, the account should be locked

for a period of time or until it is manually unlocked. Additionally, it is best to

continue the same failure message indicating that the credentials are incorrect

or the account is locked to prevent an attacker from harvesting usernames.

Don't disclose too Messages for authentication errors must be clear and, at the same much information time, be written so that sensitive information about the system is not in error messages disclosed. For example, error messages that reveal that the user id is
valid but that the corresponsing password is incorrect confirm to an attacker that the account does exist on the system.

Store database credentials securely

Modern web applications usually consist of multiple layers. The business CWE-257 logic tier (processing of information) often connects to the data tier (database). Connecting to the database, of course, requires authentication. The authentication credentials in the business logic tier must be stored in a centralized location that is locked down. Scattering credentials throughout the source code is not acceptable. Some development frameworks provide a centralized secure location for storing credentials to the backend database. These encrypted stores should be leveraged when possible.

Applications and If an application becomes compromised it is important that the

CWE-250

middleware

application itself and any middleware services be configured to run with

should run with minimal privileges. For instance, while the application layer or business layer

minimal privileges need the ability to read and write data to the underlying database, administrative

credentials that grant access to other databases or tables should not be provided.

SESSION MANAGEMENT

BEST PRACTICE

DESCRIPTION

CWE ID

Ensure that

Session tokens must be generated by secure random functions and must

session identifiers be of sufficient length to withstand analysis and prediction.

are sufficiently

random

CWE-6

Regenerate session tokens

Session tokens should be regenerated when the user authenticates to CWE-384 the application and when the user privilege level changes. Additionally, should the encryption status change, the session token should always be regenerated.

Implement an idle When a user is not active, the application should automatically log the session timeout user out. Be aware that Ajax applications may make recurring calls to
the application, effectively resetting the timeout counter automatically.

CWE-613

Implement an Users should be logged out after an extensive amount of time

absolute session (e.g., 4-8 hours) has passed since they logged in. This helps

timeout

mitigate the risk of an attacker using a hijacked session.

CWE-613

Destroy sessions at any sign of tampering

Unless the application requires multiple simultaneous sessions for a single user, implement features to detect session cloning attempts. Should any sign of session cloning be detected, the session should be destroyed, forcing the real user to reauthenticate.

Invalidate the session after
logout

When the user logs out of the application, the session and corresponding data on the server must be destroyed. This ensures that the session cannot be accidentially revived.

Place a logout button on every
page

The logout button or logout link should be easily accessible to users on every page after they have authenticated.

CWE-613

Use secure cookie The session cookie should be set with both the HttpOnly and the

attributes

Secure flags. This ensures that the session id will not be accessible to

(i.e., HttpOnly and client-side scripts and will only be transmitted over HTTPS.

Secure flags)

CWE-79 CWE-614

Set the cookie The cookie domain and path scope should be set to the most restrictive

domain and path settings for your application. Any wildcard domain scoped cookie must

correctly

have a good justification for its existence.

Set the cookie The session cookie should have a reasonable expiration time. expiration time Non-expiring session cookies should be avoided.

Website
software-security.sans.org Free resources, white papers, webcasts, and more
Twitter
@sansappsec Latest news, promos, and other information

Blog
software-security.sans.org/blog
AppSec CyberTalent Assessment
sans.org/appsec-assessment

INPUT AND OUTPUT HANDLING

BEST PRACTICE

DESCRIPTION

CWE ID

Conduct

All output functions must contextually encode data before sending CWE-79

contextual output the data to the user. Depending on where the output will end up in

encoding

the HTML page, the output must be encoded differently. For example,

data placed in the URL context must be encoded differently than data

placed in a JavaScript context within the HTML page.

EXAMPLE: Resource: https://www.owasp.org/index.php/XSS_(Cross_Site_Scripting)_Prevention_Cheat_Sheet

Prefer whitelists over blacklists

For each user input field, there should be validation on the input content. Whitelisting input is the preferred approach. Only accept data that meet a certain criteria. For input that needs more flexibility, blacklisting can also be applied where known bad input patterns or characters are blocked.

CWE-159 CWE-144

Use parameterized
SQL queries

SQL queries should be crafted with user content passed into a bind CWE-89

variable. Queries written this way are safe against SQL injection

CWE-564

attacks. SQL queries should not be created dynamically using string

concatenation. Similarly, the SQL query string used in a bound or

parameterized query should never be dynamically built from user input.

EXAMPLE: Sony SQL injection hack http://www.infosecurity-magazine.com/view/27930/ lulzsec-sony-pictures-hackers-were-school-chums

SeUtstehteoeknecnosdtiong prevfoernyt ofourged
aprepqliuceasttiosn

IFnoroerdverytopapgreviennytoCurroassp-pSlitceatRieoqnu, seest tFhoergeenrcyoadtitnagckuss,iynoguHmTTuPst

CWE-31752

ehmeabdeedrsaorranmdeotma tvaaglsuwe itthhaint iHsTnMoLt.kTnhoiswnentsoutrheisrdthpaatrthieeseintcoodthineg

HofTMthLefpoarmge. TishaislwCaSyRsFdperfionteecdtiaonndtothkaetntmheusbtrobwe suenriqwuilel ntootehaachve to determine

rtheqeueenscto. dThinisg pornevitesnotswna.foSregtetdinCgSaRcFornesqiusteesnttfreonmcobdeininggliskuebUmTiFt-te8dfor your

bapepcaliucsaetiothnereadttuacekserthdeoeosvenroatllkrnisokwotfhiessvuaeluselikoef tChreostso-kSeinte. Scripting.

Validate uploaded When accepting file uploads from the user make sure to validate the CWE-434

files

size of the file, the file type, and the file contents, and ensure that it CWE-616

is not possible to override the destination path for the file.

CWE-22

Use the nosniff header for
uploaded content

When hosting user uploaded content that can be viewed by other CWE-430 users, use the X-Content-Type-Options: nosniff header so that browsers do not try to guess the data type. Sometimes the browser can be tricked into displaying the data type incorrectly (e.g., showing a GIF file as HTML). Always let the server or application determine the data type.

Prevent tabnabbing

When including a link to a page on a different site that opens in a new tab (such as by using target="_blank"), include rel="noopener noreferrer" to prevent the linked page from changing the opener's tab (such as to a look-a-like phishing site).

Validate the source of input

The source of the input must be validated. For example, if input is

CWE-20

expected from a POST request, do not accept the input variable from CWE-346 a GET request.

X-Frame-Options or CSP headers

Use the X-Frame-Options header or Content-Security-Policy (CSP) header frame-ancestors directive to prevent content from being loaded by a foreign site in a frame. This mitigates Clickjacking attacks. For older browsers that do not support this header add framebusting Javascript code to mitigate Clickjacking (although this method is not foolproof and can be circumvented).

CAPEC-103 CWE-693

Use secure HTTP The Content Security Policy (CSP), X-XSS-Protection, and Public-Keyresponse headers Pins headers help defend against Cross-Site Scripting (XSS) and
Man-in-the-Middle (MITM) attacks.
EXAMPLE: OWASP Secure Headers Project https://www.owasp.org/index.php/OWASP_Secure_Headers_Project

CWE-79 CWE-692

ACCESS CONTROL

BEST PRACTICE

DESCRIPTION

CWE ID

Apply access control checks
consistently

Always apply the principle of complete mediation, forcing all requests CWE-284 through a common security "gate keeper." This ensures that access control checks are triggered whether or not the user is authenticated.

Apply the principle of least privilege

Use a Mandatory Access Control system. All access decisions will be based on the principle of least privilege. If not explicitly allowed then access should be denied. Additionally, after an account is created, rights must be specifically added to that account to grant access to resources.

CWE-272 CWE-250

Don't use direct object references for access control
checks

Do not allow direct references to files or parameters that can be manipulated to grant excessive access. Access control decisions must be based on the authenticated user identity and trusted server-side information.

CWE-284

Don't use unvalidated forwards or
redirects

An unvalidated forward can allow an attacker to access private content without authentication. Unvalidated redirects allow an attacker to lure victims into visiting malicious sites. Prevent this from occurring by conducting the appropriate access control checks before sending the user to the given location.

CWE-601

SANS APPSEC CURRICULUM

PLATFORM SECURITY
DEV531
Defending Mobile Applications Security Essentials
DEV541
Secure Coding in Java/JEE GSSP-JAVA
DEV544
Secure Coding in .NET GSSP-NET

CORE
STH.DEVELOPER
Application Security Awareness Modules
DEV522
Defending Web Applications Security Essentials GWEB
DEV534
Secure DevOps: A Practical Introduction
DEV540
Secure DevOps and Cloud Application Security

SPECIALIZATION
SEC542
Web App Penetration Testing and Ethical Hacking GWAPT
SEC642
Advanced Web App Penetration Testing, Ethical Hacking, and Exploitation Techniques
ASSESSMENT
AppSec CyberTalent Assessment
sans.org/appsec-assessment

12/19/17 2:31 PM

