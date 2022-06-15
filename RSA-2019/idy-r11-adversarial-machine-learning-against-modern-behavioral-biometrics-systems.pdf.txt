SESSION ID: IDY-R11
Adversarial Machine Learning
against Modern Behavioral Biometrics Systems

Heng Tang
@9he_ta0ng

Ajit Gaddam
@AjitGaddam

#RSAC

#RSAC

WHAT SLIDE IS THIS

"The Password has become kind of a nightmare!"
Prof. Fernando J. Corbato Creator of password back in 1961 at MIT for the Compatible Time-Sharing System

Image source: wired.com
2

Data breaches of passwords & by passwords

#RSAC

5M

Gmail logins were leaked on September 9th , 2014
Source: time.com. Sep 2014

167M Hacked LinkedIn accounts are on sale Source: csoonline.com, May 2016

2.3B

credentials stolen from 51 organizations in 2017
Shape Credential Spill Report, 2018

"80% of all data breaches resulted from weak or stolen passwords."
Verizon Data Breach report 2017
3

Multi-Factor Authentication

#RSAC

Know
Knowledge-based Authentication (e.g.
Passwords, PINs)

Have
Possession, Device-based Authentication (e.g. mobile, OTP)

Are
Biometric Authentication
(e.g. Face, Fingerprint, Iris)
4

Biometric Authentication
Biological & Behavioral Biometrics

Biometric Authentication

#RSAC

6

Spectrum of Biometric Authentication

#RSAC

7

Biological vs. Behavioral Biometrics

#RSAC

Biological
Static More "Human Perceivable" Persistent

Behavioral
Dynamic Less intuitive to understand raw data
Fluctuated

8

Behavioral Biometrics ­ Keystroke Dynamics

#RSAC

Key pairs generated from typing "secure"

re

90

se 110

ur 185

ec 217

cu 232

re 124

se

98

ur 200

ec 195

cu 122

3 !" = 2
4
#$

!"#$

;

!"#$

=1-

) *+,(./)) #$1 1

*+, ./) =

max(;<=))

1, +6 1 <

<@

min(;<=))

0, B@DEF+*D

re

90 d=2

se

110 d=1

ur

185 d=2

ec

217 d=0

cu

232 d=3

se

98

cu 122

re 124

ec 195

ur 200

3

G" =

2 4

G"#$

#$

G"#$ =

) ;) G"#$HIJK

9 *Figures are Illustrative purpose only, not actual data

Behavioral Biometrics ­ Mouse Dynamics

#RSAC

10 *Figures are Illustrative purpose only, not actual data

Behavioral Biometrics Features

Behavior Fluctuation

Behavior Feature 1

Behavior Feature 2

Behavior Feature 3

6

5

4

3

2

1

0

t1

t2

t3

t4

t5

t6

t7

t8

t7

11

#RSAC

t10

t11

*Figures are Illustrative purpose only, not actual data

Adversarial Machine Learning
Introduction and methodologies

How ML/DL Model Works

#RSAC

Preprocessing /Data
Cleaning

Feature Analysis

Raw Data
Images Measurements Time-series Data

Features
Feature Engineering Implicit Features Embedding
13

Model
Statistic Models Deep Neural Networks Non-linear Models
*Figures are Illustrative purpose only, not actual data

Adversarial Machine Learning

#RSAC

Attacker
Trying to explore the decision boundary of original ML/DL based models Generating synthetic samples that can fit into the decision boundary to be classified with expected labels

14

Adversarial Machine Learning ­ Definition

#RSAC

!  #$%&%'() *'+,-s
/  0$,1 2(31)s /4  0($&1-15 6()%7%8,9 2(31)s
: ! : 0$(%'15 :)(99%<%1$9 - 9. -. : ! = /
+ ! , +(!, /): D1$-,$3(-%8' <,'7-%8'9

Targeted Attack
arg min :(! + +(!, /4) ) = /4
K(!,/L)

Untargeted Attack
arg min : ! + + !  /
K(!)

Crafted Inputs

Crafted Inputs

15

Adversarial Machine Learning ­ Image Recognition

#RSAC

+

=

Image source: pixnio.com
16

Imperceptible Difference

#RSAC

arg min .() + 0(), +1) ) = +1
'(),+,)
Metrics to reflect the imperceptibility of the change to observer
­ 34 56789:;< ­ 3= 56789:;< ­ 3> 56789:;< ­ 3? 56789:;< ­ Max Norm

17

Adversarial Machine Learning ­ Image Recognition

#RSAC

!

"(!, %)

! + "(!, %)

+

=

Prediction "Gorilla" with High Confidence

) * +,-.(/01 2, !, %3 )
FGSM[Goodfellow et al., 2014]

) = 15 " !, %3

Weights
18

Prediction "Human" with High Confidence Image source: pixnio.com

Adversarial Machine Learning ­ Behavioral Biometrics

#RSAC

Targeted Attack
arg max ,(( + .((, *) ) = *
&((,*)
Crafted Inputs

19

Impact on Behavioral Biometrics Systems

#RSAC

Adaptive Systems vs. Static Systems
Model Poisoning
­ Usability ­ Discredit the underlying system

Attacks may not always target tweaking ML/DL models
­ Tweak vs. Circumvent ­ Carefully crafted attack vs. random guess

20

Defense
Threat Modeling and Countermeasures

Different Levels of Knowledge

#RSAC

White-box ­ Has full knowledge and potentially full access to any component (e.g. Inside attack with domain knowledge) Black-box ­ Has limited knowledge and access on targeted system/model Grey-box ­ Something in between, more realistic assumption

22

Threat Model
INTERNET Untrusted Boundary
Clients (End-User)
Endpoint Agents Daemon Process
Malicious Apps/Users

DMZ Untrusted Boundary
Web Service

INTRANET Trusted Boundary

Proxy/Bastion Host

Corporate Users

23

#RSAC
I/O Module Behavior Biometric Modules Behavior Biometric Systems

Threat Model

Attack 1: Session Hijacking

­ MTM attack INTERNET

­ Sniffing

Untrusted Boundary

Attack 2: ReveCrlisenets (End-User) Engineering
­ Crafted payload

Attack 4: Compromised Machine
­ Exploit

DMZ Untrusted Boundary
Web Service

Attack 5: Insider Attack
­ Abusing access
INTRANET Trusted Boundary
Corporate Users

Endpoint Agents Daemon Process

Proxy/Bastion Host

Malicious Apps/Users
Attack 3: Malicious External Attackers
­ Randomly crafted payload ­ Impersonation ­ Compromised account ­ DDos & Botnet

Attack 6: Subvert Access Control Rules
­ Unauthorized access
24

#RSAC
Attack 7: Data Leakage
­ Unencrypted communication ­ Secret data
I/O Module
Behavior Biometric Modules
Behavior Biometric Systems
Attack 8: Manipulated Data
­ Data poisoning ­ Data corruption

Attack Category Groupings
Client side
Hijacked sessions Reverse engineering endpoint agents Malicious crafted payload

#RSAC
Server side
· Compromised machines · Manipulated data &
tweaked models
· Insider attack

25

Client Side Attacks

Attack 1: Session Hijacking

­ MTM attack INTERNET

­ Sniffing

Untrusted Boundary

DMZ Untrusted Boundary
Web Service

Attack 2: ReveCrlisenets (End-User) Engineering
­ Crafted payload

Endpoint Agents Daemon Process

Proxy/Bastion Host

INTRANET Trusted Boundary
Corporate Users

Malicious Apps/Users
Attack 3: Malicious External Attackers
­ Randomly crafted payload ­ Impersonation ­ Compromised account ­ DDos & Botnet
26

#RSAC
I/O Module Behavior Biometric Modules Behavior Biometric Systems

Client Side Attack Protection

#RSAC

Targeting to manipulate input and perform black-box attacks
End point protection
­ Binary Hardening ­ Code Obfuscation ­ Transport Level Encryption + Message Level Encryption + Integrity
checking
Never Trust External Input

27

Server Side Attacks

INTERNET Untrusted Boundary
Clients (End-User)

Attack 4: Compromised Machine
­ Exploit

DMZ Untrusted Boundary
Web Service

Attack 5: Insider Attack
­ Abusing access
INTRANET Trusted Boundary

Corporate Users

Endpoint Agents Daemon Process

Proxy/Bastion Host

Malicious Apps/Users

Attack 6: Subvert Access Control Rules
­ Unauthorized access
28

#RSAC
Attack 7: Data Leakage
­ Unencrypted communication ­ Secret data
I/O Module
Behavior Biometric Modules
Behavior Biometric Systems
Attack 8: Manipulated Data
­ Data poisoning ­ Data corruption

Server Side Attack Protection

#RSAC

Targeting to manipulate internal data + white-box attacks
Protection against abused/unauthorized access
­ Encrypting data at rest ­ Access control/monitoring on key infrastructure (e.g. DB/model store) ­ Message Authentication + Firewall

29

Model Level Attack Protection Detection Models
­ Filtering/Preprocessing the samples by another model
­ Trained with attack data and real data to detect attacks
30

#RSAC

Is it an attack?

D (x)

D(G(x))

Discriminator

Real Data x

Synthetic Data (attack and fake)
G(x)
Clustering Technique
Synthetic Data

Generator

Attack Data

Model Level Attack Protection

#RSAC

Model Hardening
Model immutable to crafted input/manipulated data
­ Trained with attack data ­ Additional labels to attack data
Combination of different models ­ Ensemble Models
­ Better results (smaller false acceptance/rejection) ­ Better security controls (more entropy)

31

Ensemble models
Actual

Keystroke Dynamics

#RSAC Mouse Dynamics

32

Overall Architecture for Behavioral Biometrics Systems #RSAC

Behavior Models

Input
Detection Model

Time-Series Model

Result
33

#RSAC
Takeaway
Adversarial Machine Learning based attacks against behavioral biometric systems can cause significant impact
to this authentication mechanism. Traditional security controls combined with Machine Learning specific countermeasures mitigate the impact.

#RSAC
Q & A

References

#RSAC

Gaddam, Ajit. "Usage of Behavioral Biometric Technologies to Defend Against Bots and Account Takeover Attacks." (2019).

Ghaorondefseslilnogwa, dIavnerJs.,aJroianlaetxhaomnpSlhelse.n" sa,raXnivdpCrherpirsitniatnarSXzievg:1e4d1y2. ".6E5x7p2la(in20in1g4a).nd

Gprreopsrsien,tKaartXhivri:n1,7e0t2a.0l.6"2O8n0(t2h0e1(7s)t.atistical) detection of adversarial examples." arXiv

GTruannestatci,tiDoannsioelne,InafnodrmCalatuiodniaaPnidcaSrydsit.e"mKeSyesctruoriktey

a(TnIaSlSyEsCis)

of free text." ACM 8.3 (2005): 312-347.

Lu, Jiajun, et al. in autonomous

"No need vehicles."

atorXwivoprrryeparbinotuat raXdivve:1r7sa0r7ia.0l3e5x0a1m(p2l0e1s7in).

object

detection

LDaereXefi,evHn:1sy7ee0ut5on.g0ai3dll3v, e8Sr7us(na2gr0yia1el7op)b.erHtaunrb, aatnidonJsunwgiwthogoaLne."e.a"rGXievnperreaptrivinetadversarial trainer:

36

