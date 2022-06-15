The tools dogma
SANS ICS APAC 2020
Dieter Sarrazyn https://secudea.be

Image: ©nokblacksheep - stock.adobe.com

"Dogma " ?
An authoritative principle, belief or statement of opinion, especially one
considered to be absolutely true

"we have a firewall ..." "we are safe from attacks from the Internet"
Do you have dual home systems bypassing the firewall(s) ??

"with .1x nobody can access our (sensitive) network" · Console ports left logged in · Inadequate physical access to network devices
802.1x is just network authentication

"with .1x nobody can access our (sensitive) network"
· What about MAC address bypasses
· "macchanger"

"with .1x nobody can access our (sensitive) network" · Enter Gremwell Marvin ...

"we have a siem that monitors everything ..."
· Logs ... lots of logs ... lots of lots of ... · Nobody monitoring the thing · Cloud siem ?

"with our solution, you will have the best visibility in your ICS network"
· Too much false positives · Too much false negatives · Missing (proven) malware detections · Not interpreting ICS/SCADA traffic properly ­ skipping learning
processes

"Nobody can open this door"
"forgotten" rack key's "unlocked" server rooms "mismounted" physical security

The tools dogma issue
· Tools are often sold as being the holy grail · Often give a false sense of security · Often have shortcomings · Not always fit for your own environment · "Patching solves everything"

The tools dogma issue
· Often specific to certain ICS/SCADA brands, often weak security
Engineering tools ... Security often an option or weak

The tools dogma issue
· Often specific to certain ICS/SCADA brands, often weak security

https://github.com/tijldeneut/ICSSecurityScripts

ResearchbyTijlDeneut ­Howest­IC4

The tools dogma demystified
· There is no such thing as a security tool swiss army knife
· Never put your trust in a single tool/solution
· Only relying on tools will fail... tools are part of the equation
· Logical · Physical · Human

How to deal with this dogma?
Question everything... Test everything... Question everything again ... Test everything again ...

How to deal with this dogma?

· All encompassing risk assessments

Business

Logical

Human

Logical & Physical

Physical & human

How to deal with this dogma?
· All encompassing risk assessments

How to deal with this dogma?
· All encompassing risk assessments

How to deal with this dogma
Security Requirements
· Set · Challenge Vendor(s) · Verify claims · Test claims

How to deal with this dogma
· Security Testing Strategy
· Regular testing on existing environment (while keeping safety in mind)
· Security FAT/SAT on ALL new/upgraded equipment · Have your "own" testing equipment or adversary emulation
Always include logical, human & physical Play the "what if..." game ...

How to deal with this dogma
· Security Testing Strategy Some will say "never in live environments"
Why not ... ? Just make sure you don't trip anything ...

During FAT/SAT testing Do "Full Monty" tests ... ... include active scanning

During revisions

All doors open ... Nobody to be seen ... (often) passwords all over the place ... Systems unlocked ...

How to deal with this dogma
· Mitigating measures
· Network segmentation & zoning
· Hardening & Patching · Physical security
· Including presence monitoring

How to deal with this dogma
· Mitigating measures
· (network) monitoring
· Know what is going on in your environment · Do not rely on only 1 tool/product though

How to deal with this dogma
· Work with your vendor Do NOT trust your supplier/integrator but verify

As vendor/integrator

 be ready to prove your solution security (without hiding things)

 IEC62443 helps

Security is no longer a feature ...

How to deal with this dogma?

· Residual risk determination

Business

Logical

Human

Logical & Physical

Physical & human

How to deal with this dogma?
· People / Staff · Whatever tools you use, people using/operating them are key · > 1.5 FTE to operate cybersecurity solutions · < 0.5 FTE = 0 FTE ...
Human

Start looking at the bigger picture ... But also ... Back to basics ...
@mubix, BruCon 2019

Dieter Sarrazyn @dietersar
https://www.linkedin.com/in/dietersarrazyn/ https://secudea.be

