A New Approach to Modeling and Analyzing Security of Networked Systems

Gaofeng Da
Institute for Cyber Security UT San Antonio
dagfvc@gmail.com

Maochao Xu
Dept. of Mathematics Illinois State University
mxu2@ilstu.edu

Shouhuai Xu
Dept. of Computer Science UT San Antonio
shxu@cs.utsa.edu

ABSTRACT
Modeling and analyzing security of networked systems is an important problem in the emerging Science of Security and has been under active investigation. In this paper, we propose a new approach towards tackling the problem. Our approach is inspired by the shock model and random environment techniques in the Theory of Reliability, while accommodating security ingredients. To the best of our knowledge, our model is the first that can accommodate a certain degree of adaptiveness of attacks, which substantially weakens the often-made independence and exponential attack inter-arrival time assumptions. The approach leads to a stochastic process model with two security metrics, and we attain some analytic results in terms of the security metrics.
Categories and Subject Descriptors
D.4.6 [Security and Protection]
General Terms
Security, Theory
Keywords
Security modeling, security analysis, security metrics
1. INTRODUCTION
The long outstanding problem of modeling and analyzing security of networked cyber systems from a whole-system perspective is yet to be tackled satisfactorily. One issue that hinders substantial progress is the difficulty encountered in modeling the adaptiveness of attacks. Indeed, existing models often assumed that the relevant random variables are independent of each other (except [26]), and the attack inter-arrival time follows the exponential distribution. While these assumptions can lead to elegant results, it is important to pursue models that can accommodate weaker assumptions.
In this paper, we propose a new approach to modeling and analyzing security of networked systems. Our model is inspired by the shock model and random environment techniques in the Theory of
Permission to make digital or hard copies of all or part of this work for personal or classroom use is granted without fee provided that copies are not made or distributed for profit or commercial advantage and that copies bear this notice and the full citation on the first page. Copyrights for components of this work owned by others than ACM must be honored. Abstracting with credit is permitted. To copy otherwise, or republish, to post on servers or to redistribute to lists, requires prior specific permission and/or a fee. Request permissions from Permissions@acm.org. HotSoS '14, April 08 - 09 2014, Raleigh, NC, USA Copyright 2014 ACM 978-1-4503-2907-1/14/04 ...$15.00. http://dx.doi.org/10.1145/2600176.2600184

Reliability, while accommodating security ingredients. The shock model technique was originally used to describe the phenomenon that systems (or components) may or may not fail due to "shocks" -- depending on magnitudes of the shocks [9]. This inspires us to model attack and defense capabilities in the same spirit, namely explicitly considering attack power and defense capabilities. The random environment technique was originally used for describing the external environment that has an impact on the performance of systems, and for explaining the dependence between systems that operate in the same environment [23, 16]. The random environment technique is appealing because it can accommodate a certain degree of adaptiveness, which can be seen as the dynamic dependence between attacks (rather than the static dependence recently investigated in [26]).
1.1 Our Contributions
Our contributions are in two-fold. First, we propose a new approach to modeling and analyzing security of networked systems. The approach allows us to accommodate a certain degree of adaptiveness of attacks, namely the dynamic dependence between the relevant random variables. In contrast to a straightforward stochastic model that encounters the state-space-explosion problem, we obtain a n-dimensional stochastic model that leads to approximation results or bounds (which are numerically confirmed), where n is the size of the networked system (i.e., number of nodes).
Second, the approach leads to two security metrics, called timeto-compromise and steady-state compromise probability. The former captures the random time it takes for a secure (but vulnerable) node/computer to get compromised, without requiring the system to be in the steady state. The latter represents the probability that a node/computer is compromised in the steady state. Although it is hard to obtain closed-form expressions for these metrics, we manage to attain some analytic results centered on them. For example, we show that when the defense is highly effective, we can obtain some asymptotic result on computing the distribution of time-tocompromise with much less information (i.e., the mean of a certain distribution rather than the distribution); when the defense is poor, certain easier-to-obtain bounds are tight and can be used for decision-making purpose. This hints that security of both highly effectively and poorly defended networked systems would be easier to analyze than security of networked systems whose defense resides in the middle of the spectrum. To the best of our knowledge, this insight was not known until now.
1.2 The Science
This paper falls into the category of "mathematically modeling and analyzing security of networked systems," which is a core problem in the emerging Science of Security, because it aims to understand security from a holistic (or whole-system) perspective,

rather than from the point of view of individual computers or buildingblocks (e.g., protocols, mechanisms). This line of research is much needed, but little investigated perhaps because of the difficulties it imposes. As shown in the paper, such research can lead to security metrics, which can be used to quantify (and therefore compare) security of networked systems in a principled fashion. For example, in risk management, one would need to know the probability each computer is compromised at some point in time. Such probabilities may be based on the steady-state compromise probabilities of the nodes (i.e., "average case"-based decision-making) or based on the upper-bounds of the steady-state (or transient-state) compromise probabilities of the nodes (i.e., "worst-case"-based decisionmaking). Other applications of such probabilities include: The defender can deploy an appropriate threshold/proactive cryptosystem to tolerate compromised nodes. In Byzantine Agreement scheme, it is often assumed that no-more-than-one-third of the nodes are faulty/compromised; this assumption can be (in)validated by using the (upper bounds of) steady-state or transient-state compromise probabilities of the nodes.
The paper is organized as follows. Section 2 describes the new approach and the resulting model. Section 3 analyzes the model. Section 4 reviews related prior work. Section 5 discusses the limitations of the model. Section 6 concludes the paper. Proofs are deferred to the Appendix. The following table summarizes the main notations used in the paper:

P(·), E[·] G
deg(v) c
Jv
v,r Jv,i
v
Hv Tv,c qv,c(t) q~v,c(t) Tv,c,i
Rv
Rv,i
pv,c Fi(,1r), G(i,1r) Fi(,2), G(i,2)

the probability and expectation functions G = (V, E) is attack-defense structure graph, where V represents computers and E represents
the "direct attack" relation (in-)degree of node v  V in G = (V, E) c = (c1, c2), where c1, c2 > 0 are defense capabilities against push- and pull-based attacks
random variable (local environment) abstracting v's compromised neighbors probability mass function of Jv number of compromised neighbors of v  V after the (i - 1)th recovery, i = 1, 2, . . . random variable (global environment) abstracting pull-based attacks against node v distribution function of v time-to-compromise metric distribution of Tv,c, qv,c(t) = P(Tv,c  t) distribution of Tv,c as c1, c2   the random time it takes for v to change from secure to compromised state for the ith time the time it takes for v  V to change from the compromised state to the secure state the time it takes for v to change from compromised to secure for the ith time steady-state compromise probability metric distributions of Xi(1)(r) and Yi(1)(r) w.r.t. r distributions of Xi(2)() and Yi(2)() w.r.t. 

2. THE NEW APPROACH AND MODEL

2.1 The Attack-Defense Structure Abstraction
This abstraction has been used, implicitly or explicitly, to describe attacks and defenses in the past years (see, for example, [6, 5, 15, 25, 30, 27, 28]). Specifically, computers in a cyber system (e.g., an enterprise network and its associated information systems) can be abstracted as nodes (i.e., vertices) in terms of graph-theoretic

models. We consider two major classes of cyber attacks:
· Push-based attacks: They are launched by malwares from the compromised computers against the vulnerable ones, by attempting to actively infect them.
· Pull-based attacks: These attacks are launched through mechanisms such as the drive-by-download attack (i.e., a vulnerable computer gets compromised because the user accessed a malicious website) and the insider attack that an authorized user intentionally executes a malicious software program on a computer. A computer compromised by a pull-based attack can further launch push-based attacks.
These two classes of attacks have been investigated by [14, 30, 15, 27], but using different approaches (see Section 4). Push-based attacks formulate an attack-structure, which is a graph G = (V, E), where V is the set of nodes (i.e., computers) and E represents the direct attack relation that (u, v)  E means u  V can attack v  V directly (i.e., without using "stepping stones"). In other words, the direct attack relation imposes a graph structure G, which can have an arbitrary topology. For example, if a web server cannot launch push-based attacks but can be abused to host/launch pull-based attacks, the web server computer is not a node in V , but is part of the abstract "global environment" -- the source of pullbased attacks. However, if the web server can also launch pushbased attacks, then it is a node in V and at the same time a part of the abstract "global environment." At any point in time, a node v  V is either compromised, or secure (but vulnerable).
In parallel to the attack-structure, there exists a defense-structure that represents how the defense takes place. In this paper we consider the following popular classes of defense mechanisms (which enforce security policies):
· Preventing known attacks: The defender uses (e.g.) networkbased and/or host-based firewall and Intrusion Detection System (IDS) to filter known attacks. We use a pair of parameters, denoted by (c1, c2), to denote the capability for filtering push-based and pull-based attacks that target at v  V , respectively.
· Detecting and curing successful attacks: The defender uses (e.g.) anti-malware like mechanisms to detect malware infections and clean up the compromised computers. We use random variable Rv,i to represent the time to detect and cure a compromised node v  V for the ith time.
As a result, the aforementioned attack structure G = (V, E) naturally becomes the attack-defense structure, which is extended to accommodate the defense capabilities via parameters associated to the nodes and/or edges.
Remark. The above abstraction is sufficient for the purpose of the present paper (i.e., characterization study). It is an orthogonal research problem to obtain actual attack-defense structures and parameters for networked systems of interest.
2.2 The New Approach
We start with an illustration of attacks via Figure 1. Node v  V can be attacked by push-based attacks that are launched by v's five compromised (incoming) neighbors in the attack-defense structure G = (V, E). Note that our model and results are equally applicable to both directed and undirected attack-defense structures. Node v  V also can be attacked by pull-based attacks. The model has two aspects: specifying when v is attacked (i.e., arrival of attacks), and specifying when v is successfully attacked. This separation

VXFFHVVIXO DWWDFN

XQVXFFHVVIXO DWWDFN

UHFRYHU\

3XVKEDVHG DWWDFNV
3XOOEDVHG DWWDFNV

1HLJKERU  1HLJKERU  1HLJKERU  1HLJKERU  1HLJKERU  1RGH Y

FRPSURPLVHG Y·V VWDWH
VHFXUH

7LPH W

WLPH LQWHUYDO ZKHQ Y LV FRPSURPLVHG

WLPHWRFRPSURPLVH Y LV VHFXUH

Figure 1: Illustration of attacks against node
v and the evolution of v's state: v's local environment (random variable Jv) represents its compromised neighbors 1, . . . , 5 that can launch push-based attacks against v; the global environment (random variable v) can launch pullbased attacks against v (which are initiated by v). A push- or pull-based attack against v may or may not succeed. A successful attack changes v's state from secure to compromised, which can be changed back to secure because of defense. The time intervals during which node v is secure or compromised can formulate an alternating renewal process. Our research task is to characterize the evolution of each v's state via two security metrics: time-to-compromise Tv,c and steadystate compromise probability pv,c.

between arrival of attack and success of attack makes the resulting model more "native" than previous models for the same purpose [14, 30, 15, 27], meaning that the model is closer to real-life data that contains both unsuccessful and successful attacks. Specifying when a node is attacked (i.e., arrival of attack). We model push-based attacks against node v via point process:
(Xi(1)(Jv), Yi(1)(Jv)) , i = 0, 1, 2 . . . ,
where random variable Jv represents the push-based local attack environment -- the random number of v's compromised (incoming) neighbors with support {0, . . . , deg(v)} and deg(v) being the (in-)degree of v, random variable Xi(1)(Jv) represents the magnitude (i.e., sophistication or power) of the ith push-based attack against v with X0(1)(Jv) = 0, and random variable Yi(1)(Jv) represents the attack inter-arrival time between the (i - 1)th and the ith push-based attacks against v with Y0(1)(Jv) = 0.
Similarly, we model pull-based attacks via point process:
(Xi(2)(v), Yi(2)(v)) , i = 1, 2 . . . ,
where random variable v represents node v's global pull-based attack environment ( e.g., the extent of malicious websites presence in cyberspace), random variable Xi(2)(v) represents the magnitude (i.e., sophistication or power) of the ith pull-based attack against v with Xi(2)(v) = 0, and random variable Yi(2)(v) represents the attack inter-arrival time between the (i - 1)th and the ith pullbased attacks against v with Yi(2)(v) = 0. Specifying when a node is compromised. Having specified when an attack is launched against a secure node v, we now specify when v becomes compromised. Let c1 > 0 and c2 > 0 abstract the defense capabilities in filtering push-based and pull-based attacks, respectively. A secure node v becomes compromised when the magnitude of a push-based attack exceeds c1, or when the magnitude of a pull-based attack exceeds c2. The two defense capabilities accommodate defenses, including network-based and host-based. Specifying when a node recovers. Because of defense (e.g., malware or intrusion detection), a compromised node v becomes secure after a random time Rv,i for the ith time.
Remark. Random variables Xi(1)(Jv) for i = 1, 2, . . . accommodate the adaptiveness of push-based attack magnitudes against node v because they depend on the same random variable (i.e., lo-

cal environment) Jv. Random variables Yi(1)(Jv) for i = 1, 2, . . . accommodate the adaptiveness of push-based attack inter-arrival
times. For example, a greater Jv (in a stochastic sense) would imply a severer local environment, namely more intense attacks
(i.e., smaller attack inter-arrival times) and/or greater attack mag-
nitudes (i.e., more powerful attacks). Similarly, random variables Xi(2)(v) for i = 1, 2, . . . accommodate the adaptiveness of pullbased attacks (e.g., different exploits targeting at different vulnera-
bilities in the browser/computer) against v, because they depend on the same random variable (i.e., global environment) v. Random variables Yi(2)(v) for i = 0, 1, 2, . . . accommodate the adaptiveness of inter-arrival times between pull-based attacks against v. We
will describe how the assumptions that we will make (for the sake
of analytic tractability) and the results accommodate adaptiveness.

2.3 Security Metrics
Metric 1: Time-to-compromise Tv,c where c = (c1, c2). As illustrated in Figure 1, this metric, denoted by Tv,c, captures the time it takes for node v to change from the secure state to the compromised state. Since Tv,c is a random variable in general, we consider its distribution qv,c(t) = P(Tv,c  t). Specifically, for given local environment Jv = r and global environment v = , where 0  r  deg(v) and  > 0 (e.g., the portion of compromised websites), let Nr(1)(t) and N(2)(t) be the counting processes associated to sequences {Yi(1)(r), i  0} and {Yi(2)(), i  0}, respectively. We respectively define the historical maximum (up to
time t) of the push- and pull-based attack magnitudes as

Mr(1)(t)

=

Nr(1) i=0

(t)

Xi(1)

(r),

(1)

M(2)(t)

=

N(2) i=0

(t)

Xi(2)

(),

where "" means taking the maximum. The time-to-compromise for node v, due to push-based attacks launched from the given r compromised neighbors and due to pull-based attacks from the given global environment , can be respectively defined as

Tc(11)(r) = inf{t : Mr(1)(t) > c1}, (2)
Tc(22)() = inf{t : M(2)(t) > c2}. Therefore, the time-to-compromise for node v is

Tc(r, ) = Tc(11)(r)  Tc(22)(),

(3)

where "" means taking the minimum. The above reasoning is for given c = (c1, c2) and (Jv = r, v =
). For random environments (Jv, v), we obtain the time-tocompromise for node v as

Tv,c  Tc(Jv, v) = Tc(11)(Jv )  Tc(22)(v),

(4)

which is the mixture of Tc(r, ), with respect to Jv and v. Note that the above discussion does not rely on any assumption,
and applies even if the system is not in the steady state. The discussion holds under the assumptions discussed below.

Metric 2: Steady-state compromise probability pv,c. As illustrated in Figure 1, the state of v  V alternates with time. For given defense capabilities c = (c1, c2), the state of v  V at time t can be seen as Bernoulli random variable Xv,c(t), where Xv,c(t) = 1 means v is compromised and Xv,c(t) = 0 means v is secure. Let pv,c(t) = P(Xv,c(t) = 1) be the probability that v is compromised at time t. We aim to obtain the probability that v is compromised in the steady state: pv,c = limt pv,c(t).

3. ANALYZING THE MODEL
Preliminaries. Our analysis is centered on the two security metrics, while using the following definition [3, 16].
DEFINITION 1. Let F¯ = 1 - F be the survival function of distribution F . F , or the corresponding random variable Z, is said to be:
(i) NBU (New Better Than Used): This property says F¯(z1 + z2)  F¯(z1)F¯(z2) for z1, z2  0, namely that the conditional survival probability satisfies P(Z > z1 + z2|Z > z1)  P(Z > z2).

(ii) NBUE (New Better Than Used in Expectation): This prop-

erty says

 z

F¯

(x)

dx



E[Z]F¯(z) for z



0, namely

that the conditional expectation satisfies E[Z - z|Z > z] 

E[Z].

We will consider attack inter-arrival time that exhibits such memory properties. This goes beyond the common practice of assuming that the attack inter-arrival time follows the exponential distribution, whose memoryless property warrants analytic tractability. We consider NBU or NBUE attack inter-arrival time, which contains the exponential, Weibull, Pareto and Gamma distributions as special cases. Note that NBU implies NBUE, but not vice versa. As we will elaborate later, the NBU/NBUE memory property accommodates a kind of adaptiveness or dependence that is different from what is accommodated by the random environment technique.

3.1 Analyzing Time-to-Compromise Metric Tv,c

3.1.1 Distribution function qv,c(t)
For the sake of tractability, we propose to retain the adaptiveness that can be accommodated by local environment Jv and global environment v, but assume independence between the relevant random variables conditioned on given specific environments Jv = r and v = . This is a popular method for coping with dependence in probability and statistics.
ASSUMPTION 1. (a) For any v  V and for given local environment Jv = r, where 0  r  deg(v): (i) {Xi(1)(r), i  1} is an independent sequence; (ii) {Yi(1)(r), i  1} is an independent sequence; (iii) {Xi(1)(r), i  1} and {Yi(1)(r), i  1} are independent of each other.

(b) For any v  V and for given global environment v = : (i) {Xi(2)(), i  1} is an independent sequence; (ii) {Yi(2)(), i  1} is an independent sequence; (iii) {Xi(2)(), i  1} and {Yi(2)(), i  1} are independent of each other.
(c) For any v  V , for given local environment Jv = r, and for given global environment v = : {(Xi(1)(r), Yi(1(r), i  1} and {(Xi(2)(), Yi(2)()), i  1} (i.e., push-based attacks and pull-based attacks) are independent of each other. For technical simplicity, we further assume that Jv and v are independent of each other. These collectively imply the following property: {(Xi(1)(Jv), Yi(1)(Jv)), i  1} and {(Xi(2)(v), Yi(2)(v)), i  1} are independent of each other.
How does Assumption 1 accommodate adaptiveness of attacks? First, the above (a).(i) does not imply that the magnitudes of pushbased attacks {Xi(1)(Jv), i  1}, under random environment Jv (rather than a given Jv = r compromised neighbors), are independent. In contrast, {Xi(1)(Jv), i  1} are dependent because of the following [21]: Suppose Xi(1)(r) is increasing or decreasing (i.e., it is the monotonicity that matters) in r for any i  1 in the likelihood ratio order [20], which is not ruled out by the above (a).(i). Then, fr+1(x)/fr(x) is increasing or decreasing, where fr+1(x) and fr(x) are density functions of Xi(1)(r + 1) and Xi(1)(r), respectively. For any s  s , we have
P Xi(+1)1(Jv)  x|Xi(1)(Jv) = s
 P Xi(+1)1(Jv)  x|Xi(1)(Jv) = s .
This means that a larger magnitude s (i.e., a failed sophisticated attack) is more likely followed by another (more) sophisticated attack, namely that the attacker can adaptively increases its attack power (until an attack succeeds). The fundamental reason for that {Xi(1)(r), i  1} for a given r is independent but {Xi(1)(Jv), i  1} is dependent is exactly that Xi(1)(r) is increasing or decreasing in r for any i  1.
Second, the independence between the attack inter-arrival times in (a).(ii) is for given local environment Jv = r; whereas attack inter-arrival times between push-based attacks Yi(1)(Jv) for i  1, under random environment Jv, can be dependent. Suppose Yi(1)(r) is decreasing (or increasing) in r for any i  1 in the likelihood ratio order. It is also known [21] that for s  s
P Yi(+11) (Jv)  y|Yi(1)(Jv ) = s
 P Yi(+11) (Jv)  y|Yi(1)(Jv ) = s ,
This means that a smaller inter-arrival time s (i.e., a failed intense attack) is more likely followed by another (more) intense attack, namely that the attacker can adaptively reduce its attack time (until an attack succeeds).
Third, the above (a).(iii) does not imply {Xi(1)(Jv), i  1} and {Yi(1)(Jv), i  1} are independent. Rather, they are dependent because both magnitudes and attack inter-arrival times are dependent on the local environment Jv.
The preceding discussion focuses on Assumption 1.(a) and is equally applicable to Assumption 1.(b).
When would (not) Assumption 1 hold? Assumption 1 can be violated by full-fledged adaptive and coordinated attacks. This

means that our model accommodates a certain degree of adaptiveness. Nevertheless, Assumption 1(c) would often hold because pull-based attacks are essentially governed by user behaviors (e.g., how often a user accesses malicious websites), while pull-based attacks are not. Moreover, the software vulnerabilities that are exploited by pull-based attacks are often different from the software vulnerabilities that are exploited by push-based attacks.

Characterizing distribution function qv,c(t) under Assumption 1. Denote by Fi(,1r)(·) and Fi(,2)(·) respectively the distribution functions of Xi(1)(r) and Xi(2)(), by G(i,1r)(·) and G(i,2)(·) respectively the distribution functions of Yi(1)(r) and Yi(2)(), where 0  r  deg(v) and  > 0. For fixed defense capabilities c1, c2 > 0, from
Eqs. (1) and (2) as well as Assumption 1(a) we have:

P Tc(11)(r) > t

=

P

Nr(1) i=0

(t)

Xi(1)

(r)

<

c1

=



P

Nr(1) i=0

(t)

Xi(1)

(r)

<

c1 |Nr(1) (t)

=

m

·

m=0

P Nr(1)(t) = m

m

=

Fi(,1r)(c1)P Nr(1)(t) = m .

(5)

m=0 i=1

Similarly, from Assumption 1(b) we can obtain

m

P Tc(22)() > t =

Fi(,2)(c2)P N(2)(t) = m , (6)

m=0 i=1

where we define

0 i=1

ai

=

1 for

any ai.

From Eq.

(3)

and As-

sumption 1(c), we have

P(Tc(r, ) > t) = P Tc(21)(r) > t, Tc(22)() > t

m

=

Fi(,1r)(c2)P Nr(1)(t) = m ·

m=0 i=1

m
Fi(,2)(c2)P N(2)(t) = m .
m=0 i=1

Let v,r be the probability mass function of Jv and Hv(·) be the distribution function of v. Since Tv,c is the mixture of Tc(r, ) with respect to Jv and v, we have

qv,c(t)

= P(Tv,c  t)

= 1 - E [E [I(Tv,c > t)|Jv, v]]

= 1 - E E I Tc(11)(Jv) > t, Tc(22)(v) > t |Jv, v

m

= 1-E

Fi(,1J)v (c1)P NJ(1v)(t) = m ·

m=0 i=1

m

E

Fi(,2)v (c2)P N(2v)(t) = m

m=0 i=1

d(v)

m

= 1 - v,r

Fi(,1r)(c1)P Nr(1)(t) = m ·

r=0

m=0 i=1

 m
Fi(,2)(c2)P N(2)(t) = m dHv(). (7)
0 m=0 i=1

3.1.2 An upper bound for qv,c(t): qv,c(t)+
Since we cannot attain simple closed-form expression of qv,c(t) as shown in Eq. (7), we aim to bound it by making the following Assumption 2.
ASSUMPTION 2. (a) The same as Assumption 1(a).
(b) The same as Assumption 1(b).
(c) For any v  V and given environments Jv = r and v = , Xi(1)(r), Yi(1)(r) , i  1 are independently and iden-
tically distributed samples of (X(1)(r), Y (1)(r)) , and Xi(2)(), Yi(2)() , i  1 are independently and iden-
tically distributed samples of (X(2)(), Y (2)()) .
Now we present an upper bound for qv,c(t), denoted by qv+,c(t). Denote by Fr(1)(t), G(r1)(t), F(2)(t) and G(2)(t) the distributions of X(1)(r), Y (1)(r), X(2)() and Y (2)(), respectively. Under Assumption 2, from Eq. (7), we have
qv,c(t) = 1-E (FJ(v1)(c1))NJ(1v)(t) E (F(2v)(c2))N(2v)(t) . (8)

PROPOSITION 1. (upper bound of qv,c(t)) Suppose Assumption 2 holds, and Y (1)(r) and Y (2)() have the NBU property for any given local environment Jv = r and global environment v = . We have

qv+,c(t)

deg(v)

= 1-

v,r [G¯(r1)(t)]F¯r(1)(c1)

[G¯(2)(t)]F¯(2)(c2) dHv().

r=0

0

How does Proposition 1 (i.e., Assumption 2 and NBU attack inter-arrival times) accommodate adaptiveness of attacks? On one hand, Assumption 2 is slightly stronger than Assumption 1, meaning that the adaptiveness accommodated by Assumption 2 may be slightly weaker than the adaptiveness accommodated by Assumption 1. On the other hand, under Assumption 2, {Yi(1)(r), i  1} are independently and identically distributed according to distribution Y (1)(r), whose NBU property brings a certain other kind of adaptiveness that is not accommodated by Assumption 1. Specifically, the NBU property says

P Y (1)(r) > z1 + z2|Y (1)(r) > z1  P Y (1)(r) > z2 .

By treating the attack events as a stationary point process with attack inter-arrival times that exhibit the NBU property, we see that for any z1, z2  0,
P Yi(+11) (r) > z1 + z2|Yi(+11) (r) > z1  P Yi(1)(r) > z2 .

That is, the extra-waiting time for the (i + 1)th attack under the
condition that the attack has not arrived after some time is smaller
than the waiting time for the ith attack in the stochastic sense. It
is worthwhile to highlight that the adaptiveness accommodated by Assumption 1 is caused by that Yi(1)(r) is decreasing or increasing in r in the likelihood ratio order; whereas, the adaptiveness
accommodated by NBU is caused by the "memory" property of the distribution of Y (1)(r) for fixed r.

3.1.3 Expectation function E[Tv,c] and its lower bound
We present two lower bounds based on different assumptions.

One lower bound E[Tv,c]- under Assumption 2 and NBUE attack inter-arrival times. From (7), it can be shown that

E[Tv,c] =


(1 - qv,c(t))dt
0

m

m

=E

Fi(,1J)v (c1)

Fj(,2)v (c2)

=0 m=0 i=1

j=1


p NJ(1v)(t) =
0

P N(2v)(t) = m dt .

Since we cannot derive simple closed-form expression for E[Tv,c], we derive a lower bound of E[Tv,c], denoted by E[Tv,c]-, by considering the two classes of attacks separately.
From Eqs. (5) and (6) we have

m



E[Tc(11)(r)] =

Fi(,1r) (c1 )

P(Nr(1)(t) = m) dt

m=0 i=1

0

m

=

Fi(,1r) (c1 )E[Ym(1+) 1 (r)],

(9)

m=0 i=1

and

m

E[Tc(22)()] =

Fi(,2) (c2 )E[Ym(2+) 1 ()].

m=0 i=1

(10)

Under Assumption 2, the two expectations in Eqs. (9) and (10) can be expressed as

E[Tc(11) (r)]

=

E[Y (1)(r)] F¯r(1) (c1 )

,

E[Tc(22) ()]

=

E[Y (2)()] F¯(2) (c2 )

.

(11)

PROPOSITION 2. (lower bound E[Tv,c]-) Suppose Assumption 2 holds, and Y (1)(r) and Y (2)() have the NBUE property for any given local environment Jv = r and global environment v = .
We have

E[Tv,c ]-

deg(v) 

=

v,r

r=0 0

F¯r(1) (c1 ) E[Y (1)(r)]

+

F¯(2)(c2) E[Y (2)()]

-1
dHv().

How does Proposition 2 (i.e., Assumption 2 and NBUE attack inter-arrival times) accommodate adaptiveness of attacks? As mentioned above, the adaptiveness accommodated by Assumption 2 may be slightly weaker than the adaptiveness accommodated by Assumption 1. On the other hand, under Assumption 2, the NBUE property brings a certain other degree of adaptiveness. Specifically, the NBUE property says
E Y (1)(r) - z|Y (1)(r) > z  E Y (1)(r) .

Similarly, by treating the attack events as a stationary point process with all attack inter-arrival times having a common marginal distribution, the NBUE property implies that for any z  0,
E[Yi(+11) (r) - z|Yi(+11) (r) > z]  E[Yi(1)(r)] for i  1.
That is, the expected waiting time for the ith attack is greater than the expected extra-waiting time under the condition that the (i + 1)th attack has not arrived within time z. It is also worth mentioning that the adaptiveness accommodated by Assumption 1 is caused by that Yi(1)(r) is decreasing or increasing in r in the likelihood ratio order; whereas, the adaptiveness accommodated by NBUE is caused by the "memory" property of the distribution of Y (1)(r).

Another lower bound E[Tv,c]- under Assumption 3 and NBUE attack inter-arrival times. The lower bound given in Proposition 2 is useful because it only requires information about the expectations of the attack inter-arrival time (rather than the entire distribution). In what follows, we establish another lower bound under a different assumption.

ASSUMPTION 3. This assumption is the same as Assumption 1, except that Assumption 1(a).(i) and 1(b).(i) are respectively replaced by the following:
(a).(i) For any given local environment Jv = r, {Xi(1)(r), i  1} is an independent and increasing sequence (in i) in the usual stochastic order sense.

(b).(i) For any global environment v = , and {Xi(2)(), i  1} is an independent and increasing sequence (in i) in the usual
stochastic order sense.

PROPOSITION 3. Suppose Assumption 3 holds. Suppose Yi(1)(r) and Yi(2)() have the NBUE property for any given local environment Jv = r and global environment v = . Suppose E[Yi(1)(r)] and E[Yi(2)()] are decreasing in i for i  1. We have

E[Tv,c ]-

deg(v)



=

v,r

(E-1[Tc(11)(r)] + E-1[Tc(22)()])-1 dHv(),

r=0

0

where E[Tc(11)(r)] and E[Tc(22)()] are respectively given in Eqs. (9) and (10).

How does Proposition 3 accommodate adaptiveness of attacks? First, Assumption 3 is slightly stronger than Assumption 1, meaning that the adaptiveness accommodated by Assumption 3 may be slightly weaker than the adaptiveness that is accommodated by Assumption 1. Second, the enhanced Assumption 3(a).(i) and 3(b).(i) accommodate a certain other kind of adaptiveness, namely

P Xi(+1)1(r) > s P Xi(+1)1() > s

 P Xi(1)(r) > s , and  P Xi(1)() > s ,

which accommodate increasing magnitudes (or capabilities) of attacks. Third, the assumption that E[Yi(1)(r)] and E[Yi(2)()] are decreasing in i for i  1 further accommodates the following adaptiveness in attacks inter-arrive times:
E Yi(+11) (r)  E Yi(1)(r) and E Yi(+11) ()  E Yi(1)() ,

namely that attacks can get more intense.

3.1.4 Example: Numerical solution to qv,c(t) and tightness
of upper bound qv+,c(t) and lower bound E[Tv,c]- On the tightness of upper bound qv+,c(t). Consider a random node v  V . Suppose X(1)(r), the random magnitude of any push-based attack launched from the local environment Jv = r compromised neighbors, is Weibull random variable with shape parameter , scale parameter 1/r, and distribution function

Fr(1)(t) = 1 - e-(r-1t) ,  > 0, t > 0.

Suppose Y (1)(r), the inter-arrival time between any two consecutive push-based attacks, is Gamma random variable with shape parameter   1, scale parameter r, and distribution function

G(r1)(t) =

t 0

r x-1e-rx ()

dx,

  1, t > 0.

qv,c(t )
0.0 0.2 0.4 0.6 0.8
qv,c(t )
0.0 0.2 0.4 0.6 0.8
qv,c(t ) & qv+,c(t )
0.0 0.2 0.4 0.6 0.8 1.0

p=0.7 p=0.55 p=0.45 p=0.3

0

5

10 15 20

t

(a) deg(v) = 8, c = 3

deg(v)=10 deg(v)=8 deg(v)=6 deg(v)=5
0 2 4 6 8 10 12
t
(b) c = 3, p = 0.5

c=2 c=3.5 c=5 c=6
0 2 4 6 8 10 12
t
(c) deg(v) = 8, p = 0.5

Figure 2: qv,c(t) and qv+,c(t) with parameters  = 2,  = 2,  = 1,  = 2.5, a = 1, b = 2 and c = c1 = c2. In
Figure 2(c), dashed curves
correspond to the analytic upper bounds qv+,c(t) and solid curves correspond to qv,c(t) obtained numeri-
cally.

Note that if  = 1, the attack inter-arrival time becomes the exponential distribution, which is often assumed in many previous
security models and justifies why our model is general. Suppose Jv follows the Binomial distribution with parameter p. The probability that v has r compromised neighbors is:

v,r =

deg(v) pr(1 - p)(deg(v)-r), r = 0, . . . , deg(v). r

Given v = , suppose the magnitude X(2)() of any pull-based attack is Weibull random variable with shape parameter , scale parameter 1/, and distribution function

F(2)(t) = 1 - e-(-1t) ,  > 0, t > 0.
Suppose the inter-arrival time Y (2)() between any two consecutive pull-based attacks is Gamma random variable with shape parameter   1, scale parameter , and distribution function

G(2)(t) =

t 0

 x-1 e-x ()

dx,

  1, t > 0.

Suppose environment v is uniformly distributed in [a, b] (i.e., pull-based attacks are from a uniform environment), namely

Hv ()

=

 b

- -

a a

,

a    b, 0  a < b.

Note that for all r and , Y (1)(r) and Y (2)() have the NBU property because their shape parameters   1 and   1.
Figure 2 demonstrates how the parameters affect the qv,c(t) as specified in Eq. (8), where c = c1 = c2. Figure 2(a) shows how the local environment affects qv,c(t), where a greater p means a severer environment (i.e., more compromised neighbors) and leads to a greater qv,c(t) or a smaller time-to-compromise. Figure 2(b) shows that the greater the node degree, the greater qv,c(t) or the
smaller the time-to-compromise. Figure 2(c) plots the upper bound qv+,c(t) (dashed curves) derived from Proposition 1 and the probability qv,c(t) obtained numerically according to Eq. (8). We observe that qv+,c(t) is tight for small c = c1 = c2, meaning that qv+,c(t) is particularly useful in the scenario of less effectively defended networked systems (e.g., c = c1 = c2  2); precisely mapping c1 and c2 to actual attacks can be based on cyber attack-
defense experiments, which are orthogonal to the focus of the present
paper. We also observe that a greater c leads to a smaller qv,c(t) and a greater time-to-compromise Tv,c (because a better defended
networked system is relatively harder to penetrate into).

On the tightness of lower bound E[Tv,c]-. Figure 3 demonstrates the tightness of lower bound of E[Tv,c]- as derived from Proposi-

tion 2. Figure 3(a) shows that E[Tv,c]- is tight for p = .2 or relatively secure environment. Figure 3(b) shows that E[Tv,c]- is tight for p = .8 or relatively more malicious environment. As such, E[Tv,c]- could be used in place of E[Tv,c] for decisionmaking, which is useful because E[Tv,c]- is easier to obtain (i.e., requires little information). It is also observed that both E[Tv,c] and E[Tv,c]- increase in c = c1 = c2, since better defense (i.e., larger c) leads to greater time-to-compromise time. This further suggests that although it is hard to precisely compute security metrics for
the case of less effectively defended networked systems (i.e., small c1 and c2), the defender could use the easier-to-obtain bounds for decision-making purpose.

E[Tv,c] E[Tv,c]-

E[Tv,c] E[Tv,c]-

E[Tv,c] & E[Tv,c]-
10 20 30 40 50 60
E[Tv,c] & E[Tv,c]-
0.4 0.5 0.6 0.7 0.8

2.0 2.5 3.0 3.5 4.0 4.5 5.0
c
(a) p = 0.2

2.0 2.5 3.0 3.5 4.0 4.5 5.0
c
(b) p = 0.8

Figure 3: Tightness of E[Tv,c]-: c = c1 = c2,  = 2,  = 2,  = 1,  = 2.5, a = 1, b = 2, deg(v) = 8 and p = .2, .8. Since the easier-to-obtain lower bound is tight, the defender can use it in decision making.

As shown in Figures 2 and 3, both qv+,c(t) and E[Tv,c]- are tight when c = c1 = c2 is small (e.g., c = 2). This is no coincident, and
can be explained by the following fact:

E[Tv,c] =





(1 - qv,c(t)) dt 

1 - qv+,c(t) dt

0

0

 E[Tv,c]-,

where the last inequality can be obtained from the proof of Proposition 2 (in the Appendix).

3.2 Asymptotic Results on qv,c(t) with Highly Effective Defense
Since the distribution function qv,c(t) of random variable Tv,c is hard to characterize in general, we want to know if there are any special cases where we can characterize qv,c(t). In this Section, we present such a result for the special case of highly effective defense,

which is abstracted as c1, c2  .
3.2.1 Asymptotic results on qv,c(t) when c1, c2  
Suppose the means of attack inter-arrival times Y (1)(r) and Y (2)(), respectively denoted by r and , are finite.

PROPOSITION 4. (asymptotic expression of qv,c(t) when c1, c2  ) Suppose Assumption 2 holds. Suppose r and  are finite. As c1, c2  , we have

deg(v)

qv,c(t)  q~v,c(t) :=

v,r(1 - e-F¯r(1)(c1)t/r ) +

r=0

 1 - e-F¯(2)(c2)t/
0

dHv().

The asymptotic result q~v,c given in Proposition 4 is useful because it allows to compute qv,c(t) while demanding much less information (i.e., the means of attack inter-arrival times r and ) than to compute qv,c(t) according to Eq. (8), which demands information about the distributions of the inter-arrival times between
push-based attacks as well as the inter-arrivals times between pull-
based attacks. The following numerical example confirms that the asymptotic q~v,c converges to qv,c as c1, c2  .

3.2.2 Example
We continue the above example by using the same distributions of X(1)(r) and X(2)(). However, instead of assuming that the attack inter-arrival times Y (1)(r) and Y (2)() follow the Gamma distribution, we assume that we only know their means r = r-1(1+ )/() and  = -1(1 + )/(). Figure 4 plots the asymptotic q~v,c and qv,c for different c = c1 = c2. We observe that as c increases, q~v,c converges to qv,c. Actually, q~v,c is already fairly close to qv,c for c = 8 or even c = 5. This indicates that we can use the asymptotic q~v,c, instead of qv,c(t), for decision-making purpose when c1 and c2 are large. This is valuable because the former requires much less information to compute than the latter.

c=10 c=12 c=15

0.20

qv,c(t ) & q~v,c(t )

qv,c(t ) & q~v,c(t )
0.0 0.2 0.4 0.6 0.8 1.0

0.10

c=2 c=5 c=8

0

5

10

15

t

0.00

0

5

10

15

t

Figure 4: q~v,c(t) (dashed curves) vs qv,c(t) (solid curves): c = c1 = c2,  = 2,  = 2.5, a = 1, b = 2, deg(v) = 8, and p = .5. We observe that the asymptotic q~v,c(t) can be used to replace qv,c(t) for c  12 or even c  8; this is valuable because the
former demands much less information.

3.3 Analyzing Steady-State Compromise Probability pv,c
Now we analyze pv,c, the probability that v  V is compromised in the steady state. Specifically, let Tv,c,i be the length of time interval it takes for v to become the compromised state from the secure state for the ith time (i.e., the length of time interval it takes for the ith compromise), Rv,i be the length of time interval it takes

for v to become the secure state from the compromised state for the ith time (i.e., the length of time interval it takes for the ith recovery), Jv,i be the random number of compromised neighbors of node v after the (i - 1)th recovery, where i = 1, 2, . . .. Under the condition that each compromise-and-recovery cycle has the same distribution after each recovery (i.e., reset to the secure state), Jv,i for i = 1, 2, . . . are independently and identically distributed. Therefore, the stochastic process can be seen as an alternating renewal process with a sequence of vectors (Tv,c,i, Rv,i) for i  1, which have the same distributions as (Tv,c, Rv).

3.3.1 Analyzing pv,c with respect to arbitrary attack-defense
graph structure G
How to compute pv,c numerically? Recall the attack-defense structure G = (V, E) with |V | = n and adjacency matrix A = (auv)n×n, where auv = 1 if and only if (u, v)  E, and auv = 0 otherwise. Recall also that each v  V has an associated alternative renewal process with i.i.d. time intervals (Tv,c,i, Rv,i), where Tv,c,i and Rv,i respectively follow distributions Tv,c and Rv. The probability that v is compromised in the steady state is [19]:

pv,c

=

E[Rv ] E[Rv ] + E[Tv,c]

,

where

E[Tv,c] =


E

(FJ(v1)(c1))NJ(1v) (t)

E

(F(2v)(c2))N(2v) (t)

dt.

0

In the steady state, the number of compromised neighbors of v is

n
Jv = auvXu,
u=1

where pu,c = P(Xu = 1). Thus, we need to solve the following system of equations to get pv,c:

pv,c


E
0

(F (c )) (1)

n u=1

auv Xu

1

N

(1) n

u=1

auv

Xu

(t)

·

E (F(2v)(c2))N(2v)(t) dt - (1 - pv,c)E[Rv ] = 0, v  V.

This system of equations cannot be handled analytically because

we are unable to determinate the joint distributions of (X1, . . . , Xn).

Therefore, we resort to the mean-field approximation by replac-

ing random variables Jv and v with their respective expectations

E[Jv] and E[v]. Since E[Jv] =

n u=1

auv pu,c ,

we

have

E[Tv,c] =


E
0

(F (c )) (1)

n u=1

auv

pu,c

1

N

(1) n

u=1

auv

pu,c

(t)

·

E (F¯(v2)(c2))N(¯2v)(t) dt,

(12)

where ¯v = E[v]. We then obtain the following system of equations with respect to pu,c for all v  V :

pv,c


E
0

(F (c )) (1)

n u=1

auv

pu,c

1

N

(1) n

u=1

auv pu,c

(t)

·

E (F¯(v2)(c2))N(¯2v)(t) dt - (1 - pv,c)E[Rv ] = 0.

(13)

By solving the above system of equations for all v  V , we obtain the vector of steady-state compromise probability (pv,c)vV , which can be used for decision-making purpose. How to bound pv,c under a certain assumption? Since it is difficult to get closed-form solution of pv,c, we propose to bound pv,c by using the following assumption.

ASSUMPTION 4. Suppose the following monotonicity holds:
(a) X(1)(r) is increasing in r, where 0  r  deg(v), in the usual stochastic sense, meaning that a greater number of compromised neighbors implies greater magnitude of pushbased attacks. X(2)() is increasing in , where  > 0, in the stochastic order sense, meaning that severer environment implies greater magnitude of pull-based attacks.
(b) Y (1)(r) is decreasing in r, where 0  r  deg(v), in the usual stochastic order sense, meaning that a greater number of compromised neighbors implies more frequent pushbased attacks, and Y (2)() is decreasing in , where  > 0, in the stochastic sense, meaning that severer environment implies more frequent pull-based attacks.

PROPOSITION 5. (bounds of pv,c) Suppose Assumptions 2 and 4 hold. We have for all v  V


E
0

1

+

E[Y (2)(¯v)] F¯¯(v2)(c2)E[Rv ]

-1
 pv,c 

1 + (E[Rv ])-1 ·

(Fd(e1g)(v)(c1))Nd(1e)g(v)(t) E (F¯(v2)(c2))N(¯2v) (t)

-1
dt .

Moreover, if Y (1)(deg(v)) and Y (2)(¯v) are NBUE for all v  V ,

the following holds for all v  V :

 pv,c  1 +

F¯d(e1g)(v)(c1)E[Rv ] E[Y (1)(deg(v))]

+

F¯¯(2)(c2)E[Rv ] E[Y (2)(¯)]

-1-1 .

The bounds given by Proposition 5 are useful because they do not require to solve the system of equations given by Eq. (13). How does Proposition 5 (Assumptions 2 and 4) accommodate adaptiveness of attacks? Note that Assumption 2 is for fixed Jv = r and v = , while Assumption 4 is for varying r in the usual stochastic order sense. We here use the usual stochastic order rather than the likelihood ratio order because the latter is a overkill for proving Proposition 5. The adaptiveness accommodated by Proposition 5 is the adaptiveness that is collectively accommodated by Assumptions 2 and 4, namely the adaptiveness obtained by replacing the likelihood ratio order, which was used as an example when we discuss the adaptiveness accommodated by Assumption 1, with the usual stochastic order. More specifically, since Xi(1)(r) is increasing in r for any i  1 in the usual stochastic order, for any s, s  0 we have [21]
P(Xi(+1)1(Jv) > s |Xi(1)(Jv) > s)  P(Xi(+1)1(Jv ) > s ),
meaning that a large magnitude s (e.g., a failed sophisticated attack) is more likely followed by another (more) sophisticated attack (when s > s). On the other hand, since Yi(1)(r) is increasing in r, for any s, s  0 we have [21]
P(Yi(+11) (Jv)  s |Yi(1)(Jv)  s)  P(Yi(+11) (Jv)  s ),
meaning that a short attack inter-arrival time (e.g., before launching a failed attack) is more likely followed by another short (or even shorter when s < s) attack inter-arrival time (i.e., the attack can get more intense).
Remark. It is worth mentioning that the adaptiveness of attack magnitudes and attack inter-arrival times that is accommodated by Assumption 4 appears within each compromise-and-recovery cycle of the renewal process, rather than inter-cycle adaptiveness (which is not accommodated by the model of the present paper -- its treatment is left for future research.)

3.3.2 Example: pv,c with respect to regular attack-defense
graph structure G

As in the examples described above, we set c = c1 = c2 and

assume that the magnitudes of push- and pull-based attacks are

Weibull random variables with parameters (, 1/r) and (, 1/),

and the attack inter-arrival times of push- and pull-based attacks

are Gamma random variables respectively with parameters (, r)

and (, ), where ,  > 1, r is the number of v's compromised

neighbors, and  is the pull-based attack environment.

For regular attack-defense graph structures with deg(v) = k where 1  k  n - 1, we assume that for all v  V , ¯v = ¯, E[Rv] = E[R]. Then, pv,c is the same for all v  V. Let

pk,c be the steady-state compromise probability of any v. We have

n u=1

auv pu,c

=

kpk,c.

Hence,

Eq.

(13)

becomes

pk,c


E
0

(Fk(p1)k,c (c1))Nk(1p)k,c (t)

·

E (F¯(2)(c2))N(¯2)(t) dt - (1 - pk,c)E[R] = 0,

Thus, the lower bound established in Proposition 5 can be expressed as

p-k,c =

1

+

 e-(¯-1c) ¯E[R]

-1
.

By noting that Y (1)(r) and Y (2)() are NBUE, the upper bound is

p+k,c =

1+

e-(k-1c) kE[R] + e-(¯-1c) ¯E[R]





-1

-1
.

In Table 1, we compute the steady-state compromise probability pk,c and its bounds p-k,c, p+k,c with different parameters as discussed above. We observe that for fixed k, the upper bound p+k,c is tighter when c1 and c2 are small (i.e., the networked system is less effectively defended) and the lower bound p-k,c is tighter when c1 and c2 are large (i.e., the networked system is more effectively
defended). We also observe that for fixed c1 and c2, the upper
bound is tighter when k is large.

4. RELATED WORK
We classify related prior studies based on their relevance to the goals and means of the present paper. On one hand, a promising approach to modeling and analyzing security of networked systems is centered on modeling the cyber epidemic phenomenon (see, for example, [11, 6, 5, 25, 31, 26, 28]). These studies focused on modeling push-based attacks. In order to accommodate drive-bydownload attacks, the concept of pull-based attacks was studied in [14, 30, 27]. Our goal is to model security of networked systems while offering a unique feature that distinguishes our model from the ones presented in the literature. Specifically, our model can describe the dynamic dependence between the relevant random variables, due to the random environment technique we use. The issue of accommodating dependence was first addressed in [26] via the Copulas method, which however can accommodate static dependence only. It is also worth mentioning that our model can describe attack sophistication and defense capability. This explicitly distinction has been used in [18, 7] for describing attacks against a single assest (e.g., node or computer), and in [29] for describing active attack-defense interactions in networked systems.
Our approach to modeling and analyzing security was inspired by the random environment and shock model techniques in the Theory of Reliability. The random environment technique has been

c

k=5 pk,c p-k,c p+k,c

k=8 pk,c p-k,c p+k,c

k = 10 pk,c p-k,c p+k,c

k = 12 pk,c p-k,c p+k,c

2.0 .90 .87 .92 .92 .87 .94 .93 .87 .95 .94 .87 .95

2.5 .89 .85 .91 .92 .85 .93 .93 .85 .94 .94 .85 .95

3.0 .88 .83 .90 .91 .83 .93 .93 .83 .94 .94 .83 .95

3.5 .86 .82 .89 .90 .81 .92 .92 .82 .94 .93 .82 .94

4.0 .84 .80 .87 .90 .80 .92 .92 .80 .93 .93 .80 .94

5.0 .79 .75 .84 .88 .75 .90 .91 .75 .92 .92 .75 .94

6.0 .72 .70 .79 .84 .70 .88 .89 .70 .91 .91 .70 .93

7.0 .65 .65 .73 .79 .65 .86 .87 .65 .90 .90 .65 .92

8.0 .59 .59 .65 .67 .59 .83 .83 .59 .88 .89 .59 .91

9.0 .53 .53 .57 .54 .53 .79 .75 .52 .86 .87 .53 .90

c

k = 15 pk,c p-k,c p+k,c

k = 20 pk,c p-k,c p+k,c

k = 25 pk,c p-k,c p+k,c

k = 30 pk,c p-k,c p+k,c

2.0 .95 .87 .96 .96 .87 .97 .97 .87 .97 .97 .87 .98

2.5 .95 .85 .96 .96 .85 .97 .97 .85 .97 .97 .85 .98

3.0 .95 .83 .96 .96 .83 .96 .97 .83 .97 .97 .83 .97

3.5 .95 .82 .95 .96 .81 .96 .97 .82 .97 .97 .82 .97

4.0 .94 .80 .95 .96 .80 .96 .97 .80 .97 .97 .80 .97

5.0 .94 .75 .95 .96 .75 .96 .97 .75 .97 .97 .75 .97

6.0 .94 .70 .94 .95 .70 .96 .96 .70 .97 .97 .70 .97

7.0 .93 .65 .94 .95 .65 .96 .96 .65 .97 .97 .65 .97

8.0 .92 .59 .93 .95 .59 .95 .96 .59 .96 .97 .59 .97

9.0 .92 .53 .93 .95 .53 .95 .96 .52 .96 .97 .53 .97

Table 1: Steady-state compromise probability pk,c vs. its bounds p-k,c, p+k,c with parameters c = c1 = c2,  = 2,  = 3.5,  = 1,  = 1.5, ¯ = 4, E[Rv] = 4: We observe that for fixed k, the upper bound is tighter when c = c1 = c2 is small and the lower bound is tighter when c is large, and for fixed c, the upper bound is tighter when k is
large. These indicate the parame-
ter regimes where the lower or up-
per bound can be used for decision-
making purpose.

used to describe the external environment that has an impact on the performance of systems and for explaining the dependence between systems that operate in the same environment (see, for example, [23, 16]). (Note that the notion of random environment used in the present paper is different from the same term that is however used in a different context [32].) The shock model technique [2, 9, 8, 22, 24, 13, 12] was originally used to describe the phenomenon that systems (or components) may or may not fail under "shocks" of different magnitude. Our model goes beyond the two techniques as used in the Theory of Reliability because of the following. First, we use local random environment to model push-based attacks and global random environment to model pull-based attacks. Second, we allow push-based and pull-based attacks to be against different thresholds, which extend the standard shock model (with only one threshold) and lead to useful analytic results.
Finally, it is worthwhile to mention that our goal and approach are different from the goal and approach of attack graph, which was initiated by [17, 10, 1] and followed by many others. Attack graph studies assume that the system vulnerabilities are known. In contrast, we do not assume that the vulnerabilities are known (e.g., all known vulnerabilities may have been patched).
5. LIMITATIONS OF THE MODEL
First, we represent random environments Jv and v as random variables. A more general and powerful representation is that they are driven by stochastic processes. Similarly, we represent the recovery time Rv,i as random variable, and it would be better to represent as driven by some stochastic process.
Second, a node can only be compromised by one attack at a time. In practice, a computer can be compromised by multiple attacks during a period of time. While our model can be seen as an approximation to the reality -- by considering the aggregate effect of attacks such that a computer is secure only when it is not compromised by any attack, it is interesting to explicitly consider the case that a computer can be compromised by multiple attacks. For this purpose, we may take advantage of the recent model [31], which uses a different approach to accommodate that a node can be compromised by multiple attacks.

Third, we represent the defense thresholds, c1 against push-based attacks and c2 against pull-based attacks, as some deterministic values. A more general and powerful representation is that they are represented by random variables or even driven by some stochastic processes. Moreover, the success of attacks can be probabilistic, as in [29], rather than deterministic.
6. CONCLUSION
We have presented a stochastic model for analyzing security of networked systems. The model uses random environment to accommodate a certain degree of adaptiveness of attacks, while using magnitude and threshold to respectively abstract the attack and defense capabilities. The model leads to two natural security metrics, which guide our analysis of the model. We discussed the limitations of the model, which need to be addressed by future research.
Acknowledgement. We thank the reviewers for their comments that helped us improve the paper. This work was supported in part by ARO Grant # W911NF-12-1-0286.
7. REFERENCES
[1] P. Ammann, D. Wijesekera, and S. Kaushik. Scalable, graph-based network vulnerability analysis. In Proc. ACM CCS'02, pages 217­224, 2002.
[2] K. Anderson. Limit theorems for general shock models with infinite mean intershock times. Journal of Applied Probability, 24:449­456, 1987.
[3] R. Barlow and F. Proschan. Statistical Theory of Reliability and Life Testing. Silver Spring, MD: To Begin With, 1975.
[4] H. Block and T. Savits. Shock models with nbue survival. Journal of Applied Probability, 15:621­628, 1987.
[5] D. Chakrabarti, Y. Wang, C. Wang, J. Leskovec, and C. Faloutsos. Epidemic thresholds in real networks. ACM TISSEC, 10(4), 2008.
[6] A. Ganesh, L. Massoulie, and D. Towsley. The effect of network topology on the spread of epidemics. In IEEE INFOCOM'05.

[7] The Open Group. Risk analysis. https: //www2.opengroup.org/ogsys/catalog/C13G, Oct. 2013.
[8] A. Gut. Extreme shock models. Bernoulli, 7:541­555, 2001. [9] A. Gut and J. Hu¨sler. Extreme shock models. Advances in
Applied Probability, 2:293­305, 1999. [10] S. Jha and J. Wing. Survivability analysis of networked
systems. In Proceedings of the 23rd International Conference on Software Engineering (ICSE'01). 307­317. [11] J. Kephart and S. White. Measuring and modeling computer virus prevalence. In IEEE Symposium on Security and Privacy'93 [12] G. Li and J. Luo. Shock model in markovian environment. Naval Research Logistics, 52:253­260, 2005. [13] H. Li. Stochastic models for dependent life lengths induced by common pure jump shock environments. Journal of Applied Probability, 37:453­469. [14] X. Li, P. Parker, and S. Xu. Towards quantifying the (in)security of networked systems. IEEE 2007 International Conference on Advanced Information Networking and Applications (IEEE AINA'07). [15] X. Li, P. Parker, and S. Xu. A stochastic model for quantitative security analyses of networked systems. IEEE Transactions on Dependable and Secure Computing (IEEE TDSC), 8:28­43, 2008. [16] A. Marshall and I. Olkin. Life Distributions. Springer, 2007. [17] C. Phillips and L. Swiler. A graph-based system for network-vulnerability analysis. In Proceedings of 1998 Workshop on New Security Paradigms (NSPW'98). [18] W. Pieters, S. van der Ven, and C. Probst. A move in the security measurement stalemate: Elo-style ratings to quantify vulnerability. In Proceedings of 2012 Workshop on New Security Paradigms (NSPW'12). [19] S. Ross. Stochastic Processes. Wiley and Sons, 1996. [20] M. Shaked and J. Shanthikumar. Stochastic Orders. Springer, NY, 2007. [21] M. Shaked and F. Spizzichino. Positive dependence properties of conditionally independent random lifetimes. Mathematics of Operations Research, 23(4):944­959, 1998. [22] J. Shanthikumar and U. Sumita. General shock models associated with correlated renewal sequences. Journal of Applied Probability, 20:600­614. [23] N.D. Singpurwalla. Survival in dynamic environments. Statist. Sci., 10:86­103, 1995. [24] U. Sumita and J. Shanthikumar. A class of correlated cumulative shock models. Advances in Applied Probability, 17:347­366, 1985. [25] P. Van Mieghem, J. Omic, and R. Kooij. Virus spread in networks. IEEE/ACM Transactions on Networking, 17(1):1­14, February 2009. [26] M. Xu, G. Da, and S. Xu. Cyber epidemic models with dependences. Internet Mathematics, 2014 (to appear). [27] M. Xu and S. Xu. An extended stochastic model for quantitative security analysis of networked systems. Internet Mathematics, 8:288­320, 2012. [28] S. Xu. Cybersecurity dynamics. In HotSoS'14 (poster). [29] S. Xu, W. Lu, and H. Li. A stochastic model of active cyber defense dynamics. Internet Mathematics, 2014 (to appear). [30] S. Xu, W. Lu, and L. Xu. Push- and pull-based epidemic spreading in networks: Thresholds and deeper insights. ACM Transactions on Autonomous and Adaptive Systems (ACM

TAAS), 7:32, 2012.
[31] S. Xu, W. Lu, and Z. Zhan. A stochastic model of multivirus dynamics. IEEE Transactions on Dependable and Secure Computing (IEEE TDSC), 9(1):30­45, 2012.
[32] Ofer Zeitouni. Random walks in random environment. http://www.wisdom.weizmann.ac.il/ ~zeitouni/ps/notes3typ.ps, 2010.

APPENDIX

Proof of Proposition 1: Since N~r(1)(t) is a non-homogeneous Poisson process with rate Qr(t) = - log G¯(r1)(t), we have

P(N~r(1)(t)  m) =



[Qr (t)]j j!

e-Qr

(t)

,

m



0.

j=m

Since Y (1)(r) has NBU distribution, from Theorem 3.2 of [3] (p.162) it follows that

P(Nr(1)(t)  m)  P(Nr(1)(t)  m)

for all m  0, which immediately implies that

E (Fr(1)(c1))Nr(1)(t)  E (Fr(1)(c1))N~r(1)(t)

because sx is decreasing in x > 0 for 0 < s < 1. Then, E (Fr(1)(c1))N~r(1) (t) = e-F¯r(1)(c1)Qr (t) = G¯(r1)(t) F¯r(1)(c1)

is the probability generating function of N~r(1)(t) at Fr(1)(c1). Thus, we have
E (FJ(v1)(c1))NJ(1v)(t)  E (G¯(J1v)(t))F¯J(1v)(c1) .
For the pull-based attacks, we can similarly have E (F(2v)(c2))N(2v)(t)  E (G¯(2v) (t))F¯(2v)(c2) .
By combing the last two inequalities with Eq. (8), the proposition follows.

Proof of Proposition 2: It is easy to check that both Fr(1)(c1) m

and

F(2) (c2 )

m
in Eqs. (8) are discrete NBUE. By Theorem 2.3

in [4] and the NBUE property of Yr(1) and Y(2), we conclude that both Tc(11)(r) and Tc(22)() are NBUE. By using Eq. (4), it can be shown

E[Tc(r, )] = E Tc(11)(r)  Tc(22)()



=

P Tc(11)(r)  Tc(22)() > t dt

0



=

P Tc(11)(r) > t P Tc(22)() > t dt

0

 (E-1[Tc(11)(r)] + E-1[Tc(22)()])-1

=

F¯r(1) (c1 ) E[Y (1)(r)]

+

F¯(2) (c2 ) E[Y (2)()]

-1
.

Further, we observe that

E[Tv,c]

= E [E [Tv,c|Jv, v]]

 E (E-1[Tc(11)(Jv )] + E-1[Tc(22)(v )])-1|Jv , v

=

deg(v)



v,r

r=0

0

F¯r(1)(c1) E[Y (1)(r)]

+

F¯(2) (c2 ) E[Y (2)()]

-1
dHv ().

The desired result follows immediately.

Proof of Proposition 3: One just note that the Assumption 3 im-

plies that

m i=1

Fi(,1r) (c1 )

and

m i=1

Fi(,2) (c2 )

in

Eqs.

(5) and (6)

are discrete NBUE, with the assumption that the NBUE property

of Yi(1)(r) and Yi(2)() as well as E[Yi(1)(r)] and E[Yi(2)()] are decreasing in i  1, the rest of the proof can be completed very

similarly to that of Proposition 2.

Proof of Proposition 4: According to Theorem 1.A4 in [22], it holds that

F¯r(1)(c1)Tc(11)(r)   r

as c1  ,

where  is a standard exponential random variable, and "" means convergence in distribution. This means that

lim
c1 

P(Tc(11)(r)  rt/F¯r(1)(c1)) 1 - e-t

=

1.

The uniformity of convergence in distribution implies

lim
c1 

1

P(Tc(11)(r)  t) - e-F¯r(1)(c1)t/r

= 1,

and then

deg(v)

v,rP(Tc(11)(r)  t)

lim

r=0

= 1,

c1 

deg(v)
v,r (1

-

e ) -F¯r(1)(c1)t/r

r=0

i.e.,

deg(v)

P(Tc(11)(Jv)  t) 

v,r(1 - e-F¯r(1)(c1)t/r ).

r=0

(14)

Similarly, for Tc(22)(v), it can be proven to have P(Tc(22)(v)  t)   1 - e-F¯(2)(c2)t/ dHv(). (15)
0
Note that from Eq. (4), it follows that for all c1, c2 and t > 0

qv,c(t) = P(Tc(11)(Jv)  t) + P(Tc(22)(v)  t) - P(Tc(11)(Jv)  t)P(Tc(22)(v)  t).

Thus, combining (15) and (14) leads to the following asymptotically equivalent form of qv,c(t).

Proof of Proposition 5: Under Assumption 2, for any 0  pu,c  1, E[Tv,c] as defined in Eq. (12) satisfies

E[Tv,c] 


E
0

(F¯(v2)(c2))N(¯2) (t)

dt

=

E[Y (2)(¯v)] F¯¯(v2) (c2 )

,

where equality follows Eq. (11). By Assumption 4 and noting that

E[Jv]  deg(v) for all v, we have E (FE(1[J)v](c1))NE(1[J) v](t)  E (Fd(e1g)(v)(c1))Nd(1e)g(v)(t) .

Applying the two equalities in Eq. (13), we obtain the desired bounds.
If Y (1)(deg(v)) and Y (2)(¯) are NBUE for all v  V , from Proposition 2 we have


E
0

(Fd(e1g) (v) (c1 ))Nd(1e)g(v) (t)

E

(F¯(v2) (c2 ))N(¯2v) (t)

dt



F¯d(e1g)(v)(c1) E[Y (1)(deg(v))]

+

F¯¯(v2) (c2 ) E[Y (2)(¯v)]

-1
.

This completes the proof.

