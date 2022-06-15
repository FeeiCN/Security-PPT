SESSION ID: MLAI-T07
Rise of the machines AI & ML based attacks demonstrated
Etienne Greeff and Wicus Ross
SecureData
@etienne_greeff @wicusross

#RSAC

#RSAC
The journey

Why this talk?

Machine learning on the offense

Topic modelling

Peering into the dark

Peering into

When librarians become evil

When you want a lot of
e-mail

What next ?

2

#RSAC
Why this talk ?
AI & Machine Learning (ML) is more suited to Offensive than Defensive applications.
3

#RSAC
Supervised learning
I have lots of data with labels and goal is to teach the machine learning model to predict the outcome of future data. New data I haven't seen before needs to behave/look the same as the data I used to train.
4

Unsupervised learning
I have lots of data but no labels ... For example: trying to find structure in text contained within files or emails i.e., topic modelling.
5

#RSAC
More suited to offensive than defensive applications you say?
6

Changes adversarially

Does not change adversarially

#RSAC

Attacker Defender

The worst place to apply machine learning as it violates basic principle of ML

`The World'
The training data will resemble their real-world deployment target i.e., "Data you are going to work on needs to look the same as the data you trained your ML algorithm on."

With thanks to Thomas Dullien
7

#RSAC
So where are these offensive applications?
8

#RSAC
A very short list of potential offensive uses
DeepPhish - Using deep learning to bypass AI-based phishing detection Fooling deep learning-based image recognition Web application attacks using reinforcement learning Bug hunting in libraries using deep learning Mostly in the realm of theory and proof of concept... Current state of art seems to attempt to automate current attacks
9

#RSAC
We love features don't we?
10

#RSAC
... DDE Responder Malicious Rules and Forms OLE Macro
11

DDE : It's a feature not a bug

13

#RSAC
Microsoft introduces Machine Learning as a feature ... Hmm what could possibly go wrong?
14

#RSAC
Introducing topic modelling
15

#RSAC
Models of text data
Given text data we want to:
­ Organize ­ Visualize ­ Summarize ­ Search ­ Predict ­ Understand
Topic models allow us to:
­ Discover themes in text ­ Annotate documents ­ Organize, summarize, etc.
16

#RSAC
Topic modelling
A probabilistic model
· Learns distributions on words called "topics" shared by documents
· Learns a distribution on topics for each document
· Assigns every word in a document to a topic
With thanks to Prof John Paisley Columbia University
17

#RSAC
Topic modelling
Topic modelling outputs two main things:
· A set of distributions on words (topics). Shown above are ten topics from NYT data. We list the ten words with the highest probability.
· A distribution on topics for each document (not shown). This indicates its thematic breakdown and provides a compact representation.
18

#RSAC
When librarians become evil
What if I could use topic modelling offensively?
· Effectively map a network telling me where I should focus my malicious efforts
· Industrialise typo squatting
19

EXAMPLE 1: Peering into the dark, creating an accurate data
map of a network
20

#RSAC
Topic modelling for fun and profit on desktops
My work machine Desktop 2 minutes, 800 files Scarily accurate Unparalleled insight Identify valuable information
21

#RSAC
Using Cobalt Strike to get to the juicy stuff in an automated scalable way
22

#RSAC
23

EXAMPLE 2: When you WANT a lot of e-mail
aka Typo Squatting
24

#RSAC
Typosquatting
1 Select an Industry
Dubbed 'Friday Afternoon Fraud', the conveyancing scam has been known to take several forms, but generally occurs when the hackers intercept emails between home buyers or sellers, and their solicitors.
They generate lookalike emails which allow them to pose as the solicitor involved. During the final stages of a property purchase or sale, they inform potential victims by email that certain bank account details have changed.
25

#RSAC
Typosquatting
2 Enumerate the players
26

#RSAC
Typosquatting
3 Generate typos
· Skip letter · Double letters · Reverse letters · Missed key · Inserted key · Phonemes and graphemes
27

#RSAC
Typosquatting
4 Register the domains & setup mail server & wait just wait
28

#RSAC
Typosquatting
5 Great success!
29

#RSAC
But how do I scale this?
Requires manual investigation of potentially 100s of mailboxes and 1000s of e-mails Use topic modelling to identify key mailboxes and key topics Examine all new email for topics of interest What if I could look for mailboxes that discuss
­ Financial information ? ­ Patent information ? ­ Confidential information ?
30

#RSAC
31

PEERING INTO THE FUTURE
32

#RSAC
Key takeaways
Understand the new threat models that AI & ML may introduce Important to look at endpoint telemetry; i.e., try and spot feature based attacks Need to understand where data lives and how an attacker might see it Topic modelling and related techniques are powerful attack vectors creating new classes of attacks We believe that offensive applications of machine learning are very plausible and possible Have a response plan ready. No really !
33

#RSAC
Future work
Automate typo squatting attacks with topic modelling using orchestration to automatically harvest interesting documents ­ small eek !
Use topic modelling in defensive applications to map your network to have a real time view of where documents of interest reside
Use topic modelling to make forum/github (no darkwebs here ) information mining more productive i.e., what topics are discussed when my company is mentioned
Start using built in libraries in Windows 10 for attacks without having to deploy a malicious payload
34

THANK YOU Questions?
@etienne_greeff
35

@wicusross

