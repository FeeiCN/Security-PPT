SESSION ID: GRC-T10R
The Newest Element of Risk Metrics: Social Media

Ian Amit
Vice President ZeroFOX inc. @iiamit

Basic Mo<va<on - ho?est/easiest vector!
"... in previous years, we saw phishing messages come and go and reported that the overall effecAveness of phishing campaigns was between 10 and 20%. This year, we noted that some of these stats went higher, with 23% of recipients now opening phishing messages and 11% clicking on a?achments. Some stats were lower, though, with a slight decline in users actually going to phishing sites and giving up passwords."
"For two years, more than two-thirds of incidents that comprise the Cyber-Espionage paNern have featured phishing."
2015 DBIR
2

Why do I want this?
Everyone is on social media. Whether you tell your employees that they can or can't. OrganizaAons find that they conduct business communicaAons over social media. The gap between online and physical is very narrow when factoring in social media. ANackers target organizaAons through the path of least resistance. Social media is the easiest as:
There are less (if any) controls over it. It provides a more personalized "experience" for the user (unlike email). It is more interacAve and aNackers can quickly adapt their approach.
It is easy to impersonate someone on social media and impact the organizaAon.
3

Who is poten<ally affected?

Are you engaged in a "controversial" pracAce?

Financial Services

DIB

Healthcare

Pharma

Agribusiness

LEA

Energy
4

Can I really predict risk based on SM ac<vity?
SenAment analysis and the German elecAons PredicAng ElecAons with TwiNer: What 140 Characters Reveal about PoliAcal SenAment "TwiNer can be seen as a valid real-Ame indicator of poliAcal senAment." hNp://www.aaai.org/ocs/index.php/ICWSM/ICWSM10/paper/ viewFile/1441/1852
5

6

#RSAC
Coming up with a solu<on
Framework for measuring the risk of a person/organizaAon's social media acAvity

What is it that we need to address?
A framework for you to look at how inflammatory or "risky" individuals in your organizaAon are. Individuals:
like execuAves, technical contractors & employees who, you know, might have admin access, and/or employees suscepAble to other risk categories like Fraud, ReputaAon, and Strategic risk.
8

What will I get out of this?
The ability to build a scorecard allowing you to rank employee risk. The ability to drill down into the SM behaviors that contribute to risk And subsequently lower a risk profile through applying controls to select elements idenAfied through the process. The ability to enhance OSINT funcAons with SM-focused funcAons
9

Basic concepts behind the model
We uAlized the GQM approach: Conceptual level (goal)
Goals defined for an object for a variety of reasons, with respect to various models, from various points of view.
OperaAonal level (ques<on)
QuesAons are used to define models of the object of study and then focuses on that object to characterize the assessment or achievement of a specific goal.
QuanAtaAve level (metric)
Metrics, based on the models, is associated with every quesAon in order to answer it in a measurable way.
10

GQM

Goals establish what we want to accomplish.

Goal 1

Goal 2

Questions help us

understand how to meet the goal. They

Q1

Q2

Q3

Q4

Q5

address context.

Metrics identify the measurements that are needed to answer the questions.

M1 M2 M3 M4 M5 M6 M7
11

Victor Basili

Our GQM data
Goal: Provide a social media risk scorecard for a person/ organizaAon. QuesAons: How would one's OA affect the likelihood of a threat? How would one's OA affects the impact of a threat, and the areas of impact? How does unsancAoned presence of someone affect said threats? Metrics: Provide a qualitaAve* approach to measuring the overall risk, as well as specific aspects of the social media presence.
*And when we say qualitative we lie a little bit...
12

More Goals
1. Provide a measurable way to quanAfy risk associated with online acAvity of the organizaAon and it's employees. 2. Provide another measure for quanAfying risk of working with 3rd parAes and contractors. 3. Create a score for execuAves to measure their social media exposure (from an exec protecAon perspecAve, insider trading, etc...) 4. Create a score for measuring and comparing intra and extra industry social media risk raAngs 5. Be able to quanAfy the effect of changing controls, processes and policies on the risk associated with social media.
13

Mindmap (see external references)
14

Developing the scoreboard
Started with the basics, comparaAve measurements... QualitaAve approach dictates trying to leave quanAtaAve elements out (which we kind'a try to). So the compromise was to provide a fairly detailed breakdown of elements, and instead of measuring them on a scale, only indicate presence (1 or 0). AggregaAon didn't work (per-se), Averaging would not take into account the full magnitude of the largest elements, MAX() would not factor in contribuAon from smaller ones. We have to provide more accurate weights...
15

Scoring Approach
Ended up with providing a weighAng system for the major elements and their importance to the organizaAon (context?!). Given X points to distribute between Y elements. Weight = Y'/X where Y' is the number of points given to each element. Sum(Y'...Y'')=1 Apply weighAng to the scorecard to get weighted risk score. (where weights are appropriate for the organizaAon's operaAonal context).
16

Weigh<ng

17

Sample

Scorecard roadmap
Current:
Breakdown of Likelihood, Manifesta<on, Impact, and an esAmated factor of the number of online threats (by compounding monitored instances of threat actors with the medium used).
Future:
Add breakdown to personal vs corporate risk, and further semanAcs such as exposure to malicious content, negaAve senAment, informaAon leaks, etc...
18

What kind of data is needed?
OrganizaAon size, and the size of the management. How many in the organizaAon are monitored (and in management) Locality informaAon (HQ, offices, size per locaAon) ChaNer - menAoning, conversing with, and talking about monitored assets. Also - assets posAng/conversing/menAoning others. ImpersonaAons - who is being impersonated? What's the intent (nefarious vs. parody) SenAment analysis - in chaNer, broken down to management vs company vs individuals (per locaAon), and by distance from asset (1st, 2nd, 3rd degree)
19

How can YOU do it?
STEP 1: Determine how your organizaAon will support profiling.
None at all None but publicly available informaAon VoliAonal Enforced
20

How can YOU do it?
STEP 2: Determine who you might want to protect
privileged IT users execuAves/board members markeAng/PR people sales
21

How can YOU do it?
STEP 3: Determine where you will profile them
Social Media sites Web sites Blog comments
22

How can YOU do it?
STEP 4: Collect <ALL> the data.
Extract / Tranform / Load
Scrape / Transform / Load
Analysis post scrape Analysis in real-ish Ame (storm uw) (twiNer api -> spout -> bolt for processing)
23

How can YOU do it?
STEP 5: Store the data.
Whatever you want.
24

How can YOU do it?
STEP 6A: Analysis
Amish hand craued
Score comments regarding the factors that contribute to the likelihood/ manifestaAon/impact elements of the model Use freebie tools or do it yourself tools like... hNps://tone-analyzer-demo.mybluemix.net/ hNps://watson-pi-demo.mybluemix.net/ Score in our handy-dandy excel tool (or some variaAon thereof)
25

How can YOU do it? (automated analysis)
26

How can YOU do it?
STEP 6B: DIY BIG DATA MAGICS
SenAment analysis (list from hNp://breakthroughanalysis.com/2012/01/08/what-are-the-most-powerfulopen-source-senAment-analysis-tools/) Python NLTK (Natural Language Toolkit), hNp://www.nltk.org/, but see also hNp://text-processing.com/ demo/senAment/ ­ R, TM (text mining) module, hNp://cran.r-project.org/web/packages/tm/index.html, including tm.plugin.senAment. ­ RapidMiner, hNp://rapid-i.com/content/view/184/196/. ­ GATE, te General Architecture for Text Engineering, hNp://gate.ac.uk/senAment/. Apache UIMA is the Unstructured InformaAon Management Architecture, hNp://uima.apache.org/ -- also senAment classifiers for the WEKA data-mining workbench, hNp://www.cs.waikato.ac.nz/ml/weka/. See hNp://www.unal.edu.co/diracad/einternacional/Weka.pdf for one example. Stanford NLP tools, hNp://www-nlp.stanford.edu/souware/ LingPipe, (pseudo-open source). See hNp://alias-i.com/lingpipe/demos/tutorial/senAment/read-me.html.
27

How can YOU do it?
STEP 7: SCORECARD!
Output via model Remember, it's the factors of stress not necessarily a "risk score" that maNers. UlAmate goal is protect, be that via technology or behavioral controls. Also applicable - legal, financial hedging, insurance, etc...
28

Where can you get it?
The Society of InformaAon Risk Analysts hNp://www.societyinforisk.org As well as on the SMRM site: hNp://risk-metrics.com/
29

Take-away
1. Check what is your current social media security policy (if you have one).
2. Do you have a current risk model that incorporates social media as part of it (aNack surface / informaAon leak / intelligence)
3. Measure your current social media risk posture for key individuals in your organizaAon.
And then in 2-3 months - measure again to see whether any changes you have implemented in light of the iniAal measurement had the right impact.
30

#RSAC
Thank you!
Ques<ons?
Ian Amit: @iiamit | ian@zerofox.com | hNp://www.iamit.org

Resources
SenAment analysis and german elecAons: hNp://www.aaai.org/ocs/index.php/ICWSM/ICWSM10/paper/viewFile/1441/1852 Analyze tone of text: hNps://tone-analyzer-demo.mybluemix.net/ Analyze personality based on text: hNps://watson-pi-demo.mybluemix.net/ SenAment analysis (list from hNp://breakthroughanalysis.com/2012/01/08/what-are-the-most-powerful-open-sourcesenAment-analysis-tools/) Python NLTK (Natural Language Toolkit), hNp://www.nltk.org/, but see also hNp://text-processing.com/demo/senAment/
R, TM (text mining) module, hNp://cran.r-project.org/web/packages/tm/index.html, including tm.plugin.senAment. RapidMiner, hNp://rapid-i.com/content/view/184/196/. GATE, te General Architecture for Text Engineering, hNp://gate.ac.uk/senAment/.
Apache UIMA is the Unstructured InformaAon Management Architecture, hNp://uima.apache.org/ -- also senAment classifiers for the WEKA data-mining workbench, hNp://www.cs.waikato.ac.nz/ml/weka/. See hNp://www.unal.edu.co/ diracad/einternacional/Weka.pdf for one example. Stanford NLP tools, hNp://www-nlp.stanford.edu/souware/ LingPipe, (pseudo-open source). See hNp://alias-i.com/lingpipe/demos/tutorial/senAment/read-me.html.
32

