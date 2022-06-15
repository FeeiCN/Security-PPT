How I SESSIONID: ASD-W12 Learned Docker Security the Hard Way (So You Don't Have To)

Paul Asadoorian
Founder & CTO at Security Weekly

ME
#RSAC

#RSAC
We connect the security community with the security industry through our
network of shows and security market validation 2programs.

#RSAC
"We live in an age of automation -- automatic washer dryers, automatic dishwashers and lately, even automatic vacuum cleaners. We see laundry folding as the next area of housework that you should be liberated from by automation."
Me: "We don't have an artificially intelligent robot that puts away all of our laundry."
Son: "We should get one."
3

This Is A Journey
1. Unleash your inner curmudgeon - To Hell With Docker 2. Okay, DevOps is on to something, but I'm still skeptical 3. Why is there no good documentation? 4. Are people really using this in production? 5. Docker files are pretty neat 6. Holy crap Docker compose is awesome 7. I will never deploy containers unless I control everything 8. Okay, let's use EC2 9. Ya know what, screw it, let's go completely serverless 10. We need as few containers as possible 11. We don't have enough containers 12. I will never use Kubernetes 13. Crap, why didn't I use Kubernetes sooner? 14. We are releasing 10 new versions a day, and each one is getting tested and deployed automatically
4

#RSAC

#RSAC
What To Expect From This Talk
· Learn the appropriate uses for Docker implementations and understand the pros and cons of Docker technology.
· See examples of a traditionally deployed application along its journey to full containerization. This will allow you to learn and apply these concepts to your own software projects.
· Review forensic data from a Docker security breach. You will be able to identify the characteristics of these attacks and spot them more easily in your environment(s).
· Run through a Docker security checklist, allowing you to make better security recommendations to your development teams.
5

Why Docker?

Why Docker?

#RSAC

· There is a free version, low barrier to entry

(cost-wise)

· There is a big learning curve, I like to learn

new things (you should too!)

· VMs are too large, require too much

maintenance and are more of a

commitment than a container

We want to be cool and fidget spinners

are so 2016...

7

#RSAC
Why Docker? (2) 1. You can combine development, sysadmin and security
all in one process 2. Reproducibility and ease of deployment means we can
have more environments for specific purposes (like security testing)
8

Why Docker? (2)

#RSAC
"Containers are immutable."

 An attacker may get shell, but end up stuck inside a container with little functionality
 If you get hacked, you can deploy a new set of containers, and, well, not be hacked for a bit
 OS, application and library updates occur in the natural, more frequently occurring, release cycle
 More easily strip out components you don't need
9

#RSAC
My Initial Reason Python environments....
pip virtualenv
And the resulting mess
https://imgs.xkcd.com/comics/python_environment.png
10

Why Not Docker?

#RSAC
Why Not Docker?
Docker is still pretty new, which means: · Documentation is pretty rough, not
many examples (Sometimes the documentation is someone's blog entry from 2 years ago) · Most are just "testing it out" and not running in production · There is a big learning curve
12

#RSAC
Why Not Docker? (2)
· Security is still largely untested (thankfully I've done some of that already)
· Multi-Platform applications - Containers share the host OS, so may not be portable
· Tool Fatigue - Jenkins, Git, Swarm, Compose, Kubrenetes, Open Shift, CoreOS, Puppet, Chef, Ansible,
13

Example: Our Internal Podcasting App

#RSAC
Despite All That I "Dockerized" My Project
· Enter PPWorks - Podcast Post-Production Workflow System · Yes, I named it.And yes, the developers hate the name. · I still make jokes about the name. The developers do not
think its funny. · There is no logo, and our beta designs are, well, you might
not think its funny...
15

#RSAC
A Little About My Project
· We produce 16 segments every week here at Security Weekly
· Each segment gets pushed to podcast catchers, social media and blogs
· Each segment has at least 3 different formats (Audio, HD video, SD video)
· Manually uploading and describing all content would require 1 FTE, whose sole (or soul) job would be only this.
16

#RSAC
· It used to take the same amount of time to publish as it did to record (e.g. a 2 hour show would take 2 hours to publish)
· We needed a script/application that could automate and cut that time down
· Today we publish in a fraction of the time, about 15 minutes per show to actually publish
· The point: Our project started out as a script that could automate publishing
17

#RSAC
The Beginning
We chose Python Flask to create a web interface, upload HD video, convert it, add your metadata and publish to all destinations It ran on hardware + Linux + Python+UWSGI
18

#RSAC
Enter Docker
I chose Docker to "containerize" the environment I learned its really hard to take an application that already exists and implement it in Docker Defining the environment took time, and really was not complete until several months later Goals: Have a repeatable environment that could be replicated to create a Dev and Prod environment
19

The Docker Journey - From Hate to Love

#RSAC

20

#RSAC
At This Stage Consider A Mindset Change
1. Containers are immutable - They get destroyed and re-created often
2. Keep your data outside the container 3. Keep all components in separate containers
(Reduces the attack surface!) 4. Don't image containers, have a repeatable
process to build and deploy https://developers.redhat.com/blog/2016/0221/24/10-things-to-avoid-in-docker-containers/

#RSAC
PPWorks - Initial Architecture
22

#RSAC
Two Things Pushed Us To The Cloud
1) Ubuntu upgrades and releases were not stable
2) The development server hard drive crashed
Initially we rejected cloud architecture because we are moving multiple large files (3GB) daily. Once to upload to PPWorks and once more to upload to services like YouTube.
23

#RSAC
Ubuntu Upgrades
System76 came with Ubuntu by default
We ran this in production, until upgrades started really breaking things
No more Ubuntu on servers (in fact, System76 now has their own Linux Distro called PopOS!)
24

#RSAC
The One Spinning Drive In The Building
Well, it failed. Which also means so did the development server.
Losses: Time to rebuilding the server, OS and all software (we had backups). Money to purchase new hard drive. Development time that could have been spend on new features.
25

PPWorks - Current

#RSAC

Architecture

26

#RSAC
Then I Read The Phoenix Project...
I love Bill Eric grew on me I still hate Sarah
27

#RSAC
Big Takeaways
Unifying development, IT operations and security has the potential to solve problems A continuous and rapid feedback loop is critical to success Understanding your constraints, while not always straightforward, is important Have everything you require before you start a process or push a job through the system
28

#RSAC
PPWorks Next Major Release - Coming Soon!

Hosts Guests Announcements News Articles Topics Locations Dates/Times/Durations
Pre-Production

HD Video Destinations (Social
Media, Libsyn, Wordpress) Scheduling
Publication
Original Design
29

Statistics Notifications Monitoring
Post-Publication

#RSAC
PPWorks - Future Architecture
30

The Development Process

NGINX

UWSGI

Container Container

Developer Workstation

Push/Pull

Git

P

Source Code

u

Docker File(s)

s

Docker Compose Files Configuration Files

h

Docker Registry

Pull (qa tag) Pull (dev tag)

QA 3A1mazon EC2

Prod

#RSAC
Amazon RDS

Production

People Testing
Automated Functional
Testing

UAT QA

Testing

Dev/QA Bug
Testing

#RSAC

PPWorks Environments and Workflow

Automated Security Testing

Dev1

Dev2
32

Docker Security Lessoned Learned

"Network" Security
dev_ppworks: build: ./ppworks_docker image: "registry:5000/dev_ppworks:${TAG}" hostname: dev_ppworks ports: - "8001:8001" - "9996:9996" links: - "dev_ppworks_mysql:mysql" volumes: - /storage/docker/dev/uploads:/uploads - /storage/docker/dev/conf:/ppconf - /Users/paulda/docker/ppworks/code:/ppworks networks: default: dev_ppworks_nw: ipv4_address: 10.11.1.20
34

#RSAC

Data "Storage"
dev_ppworks: build: ./ppworks_docker image: "registry:5000/dev_ppworks:${TAG}" hostname: dev_ppworks ports: - "8001:8001" - "9996:9996" links: - "dev_ppworks_mysql:mysql" volumes: - /storage/docker/dev/uploads:/uploads - /storage/docker/dev/conf:/ppconf - /Users/paulda/docker/ppworks/code:/ppworks networks: default: dev_ppworks_nw: ipv4_address: 10.11.1.20
35

#RSAC

#RSAC
Managing Secrets
Secrets can be: SQL passwords, API keys, app credentials for automated testing More automation = more stored secrets More secrets = increased likelihood they are leaked on Github
36

#RSAC
The Security Incident...
April 1, 2018 - Extreme amounts of traffic leaving our AWS instance
Rogue Docker container was uploaded to one of our Docker servers
In our rush to the cloud, security controls were not in place that should have been!
37

#RSAC
I Didn't Know What I Was Doing
syslog:Apr 2 13:31:32 ip-172***** dockerd[14406]: time="2018-0402T13:31:32.186864242Z" level=error msg="Error setting up exec command in container gogo: No such container: gogo" syslog:Apr 2 14:14:13 localhost dockerd[539]: time="2018-0402T14:14:13.538558381Z" level=warning msg="[!] DON'T BIND ON ANY IP ADDRESS WITHOUT setting --tlsverify IF YOU DON'T KNOW WHAT YOU'RE DOING [!]"
38

#RSAC
Uploaded Via The Docker API
{"Repositories":{"19144885/gogo":{"19144885/gogo:l atest":"sha256:e9789c17899ef6734f508d513c3f96f3f 63eaf41772d05e8b0029fa9141b7a76","19144885/go go@sha256:c40df2d8de9ac5919b4169cd87c7b4325c 097c108fb743957a069248a8445df1":"sha256:e9789c 17899ef6734f508d513c3f96f3f63eaf41772d05e8b002 9fa9141b7a76"}
https://blog.aquasec.com/cryptocurrency-minersabusing-containers-anatomy-of-an-attempted-attack
39

#RSAC
The Security Incident... (2)
Thankfully, it was not a sophisticated attack
The files inside the container were named "java" and "pythno" The "java" binary was only 1.1 MB I caught the "pythno" switching of letters (duh) Then I uploaded it to Virus Total...
40

#RSAC
Sophisticated malware it was not...
41

#RSAC
What is the intention of the malware and the user?
42

#RSAC
Jenkins Uses The Docker API
https://docs.docker.com/engine/reference/commandline/dockerd/#examples
https://docs.docker.com/engine/security/https/#create-a-ca-server-and-client-keys-with-openssl
43

Docker Security Recommendations

Scan Your Containers
Several commercial and open-source tools available
Consistently scan, send the results to the developers
You decide what holds up a build or release
Docker provides scanning in the public (or private) registry services

#RSAC
Tip: Don't forget to flag add-ons, plugins or libraries that have been deprecated or abandoned. These have been the source of recent attacks.
Ref: https://www.bleepingcomputer.c om/news/security/somebodytried-to-hide-a-backdoor-in-apopular-javascript-npmpackage/

Goal: Discover outdated OS updates, applications, code libraries install via the OS, general exposures and mis-configuration
45

#RSAC
Scan Your Containers (2)
The following resource will get you started:

1. https://www.slideshare.net/jlkinsel/a -fun-comparison-of-dockervulnerability-scanners
2. https://sysdig.com/blog/20-dockersecurity-tools/
3. https://thenewstack.io/draftvulnerability-scanners/
46

Special thanks to Layered Insight (Sponsor), along with John Kinsella and Matt Alderman

#RSAC
Example: Dockscan
dockscan -r html -o myreport -v \ tcp://yourhost.com:2375 https://github.com/kost/dockscanhttps://github.com /kost/dockscan (Ruby, standalone scanner)
47

#RSAC
Kernel Module Protection

Container

Container

Container

Docker

Kernel Plugin

Kernel Operating System

Does not require access to the container service or a hook into the containers.
48

Privileged Containers
Container

Container

#RSAC

Privileged Container
Docker
Kernel Operating System

Privileged containers run as root, but still have some limitation as they are not inside the kernel.
49

#RSAC
Non-Privileged Containers (No Root)

Hook
Container

Hook
Container

Hook
Container

Docker
Kernel Operating System

Does not require root and offers good protection and monitoring.
50

#RSAC
Docker Defensive Recommendations Recap
1. Harden your Docker installations, disable API access 2. Strip out *anything* not required in your Docker containers 3. Scan your Docker containers for vulnerabilities and exposed data 4. Implement a security technology to monitor and respond to
container threats 5. Keep all of your secrets in a separate trusted system 6. Consider a serverless architecture for container deployment 7. Work closely with Development and IT Operations to ensure a
secure platform for your applications
51

#RSAC
The End
https://blog.jayway.com/2015/03/21/a-notvery-short-introduction-to-docker/
https://www.humblebundle.com/books/devop s-books?partner=indiekings&charity=2030222
Paul Asadoorian, Founder & CTO at Security Weekly
paul@securityweekly.com / @securityweekly
52

