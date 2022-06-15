SESSION ID: ASD-R02
Container Security at the Speed of CI/CD

Tim Chase
Director of Security HealthStream

#RSAC

#RSAC
Intro To Tim
Director of Security at HealthStream Been in security field for 15 years. Trainer on LinkedIn training Board advisor for C|ASE certification with EC-Council Focused on application security for many years Last few years spend a lot of time in cloud and containers
2

#RSAC
What's the problem?
Containers are one package with everything
­ App Security/server security must combine
Security thought must change
­ Be Faster ­ Must secure between containers

#RSAC
What's the Problem? ­ Container Example

Application Security Library Security
Docker Configuration

Overall, how do we protect
the Host?

EXAMPLE OF A CONTAINER
Packages apps into a single container for deployment
(image from docker.com)
4

#RSAC
What's the problem? ­ Library and AppSec
OWASP 2013 broke out libraries into its own item (A-9) Equifax and Struts Easy to miss with containers
­ Containers are code ­ Traditional scans don't always work

#RSAC
What's the problem? ­ Docker Configuration
Docker has security holes Can fall to misconfiguration like anything (A6) CIS benchmarks for Docker

#RSAC
What's the problem? ­ Host Security
Think of Docker like VMWare Be aware of Container Escape Docker uses ports like servers

#RSAC
What's the problem?
Containers are one package with everything
­ App Security/server security must combine
Security thought must change
­ Be Faster ­ Must secure between containers

#RSAC
What is DevOps
DevOps is the combination of cultural philosophies, practices, and tools that increases an organization's ability to deliver applications and services at high velocity ­ AWS Blog

#RSAC
What is DevOps
· Brings Dev, Testing, Ops together · Culture Change · Goal is to reduce cycle time

#RSAC
DevOps Changes Security
DevOps forces security to change · Faster · More Accurate · Flexible · Shift Responsibility

#RSAC
DevSecOps enters the picture
· Incorporate security principles into DevOps · Make developers responsible for security · Move security team to auditors/SMEs · Shift in culture
12

What is CI/CD?

#RSAC
Continuous Integration \ Continuous Deployment Build once a day or many times a day
Image from https://www.mabl.com/blog/what-is-cicd
13

#RSAC
What is CI/CD

Continuous Integration
­ Automated developer check-in ­ After check-in, code is deployed ­ Automated tests usually are next

Continuous Deployment
­ Automated release to production ­ Next step after CI passes checks ­ Usually goes together with CI

#RSAC
What's the Problem? ­ Container Example

Application Security Library Security
Docker Configuration

Overall, how do we protect
the Host?

EXAMPLE OF A CONTAINER
Packages apps into a single container for deployment
15

#RSAC
Container Security Parts

Vulnerabilities
· What libraries are out of date
· Are you using components with open CVEs

Policies
· Compliance to container best practices
· Example: Keys in container, SSH running in containers

Runtime Protection
· Prevent container escape
· Monitor for unusual activities on container

Examples
Twistlock

#RSAC

#RSAC

#RSAC
Jenkins Integration

#RSAC

#RSAC
Container Security Flow

#RSAC
Container - Compliance
· Ensuring that docker images are setup with best practices · Utilize standards like CIS benchmarks · Continually monitor for updates

#RSAC

#RSAC
Container - Runtime
· Monitor the runtime security of docker containers on a host · Look for specific items
· Container escape · Unusual open ports · Data being exfiltrated

#RSAC

Examples
Aqua

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC
Apply What You Have Learned Today
Next week you should:
­ Identify a team using a container within your organization
In the first three months following this presentation you should:
­ Identify a tool that you want to use to test container security ­ Work to define a process to integrate container security into the CI/CD
Within six months you should:
­ Rollout container security to the team in the CI/CD process ­ Continue the rollout to include other projects and
33

