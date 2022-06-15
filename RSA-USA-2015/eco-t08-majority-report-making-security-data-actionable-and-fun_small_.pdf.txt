SESSION ID: ECO-T08
Majority Report: Making Security Data Actionable (and Fun!)

Andrew Hay
Research Director OpenDNS, Inc. @andrewsmhay

Thibault Reuille
Sr. Security Researcher OpenDNS, Inc. @thibaultreuille

#RSAC

#RSAC
Why Visualize Data?

#RSAC
The Age of Information
3

#RSAC
Why Visualize the Data?
Aren't pie charts enough?
What does advanced visualization give us?
Can't I just use R, Python, and/or Excel?

#RSAC
Because, Minority Report

#RSAC

Is Data the New Oil?

% 

  

 Collection  Storage
 Persistence

 Analytics  Statistics
 Machine Learning

#RSAC

# !
 Indicators  Insights  Stories

"There are 3 kinds of lies: Lies, damned lies, and statistics."
- Benjamin Disraeli, 19th Century British Prime Minster

#RSAC

Image source: http://en.wikipedia.org/wiki/Benjamin_Disraeli#/media/File:Benjamin_Disraeli_by_Cornelius_Jabez_Hughes,_1878.jpg
8

#RSAC




 



 Crystal Clear Design  Relevant & Useful  Scientific Method

9

Quick Overview of Learning

#RSAC

Styles

#RSAC
Learning Styles
 Neil Fleming's VAK/VARK model
 The 4 types
1. Visual learners 2. Auditory learners 3. Reading-writing preference learners 4. Kinesthetic learners or tactile learners

#RSAC
Learning Styles
 Key concept of visual learning
 Graphic organizers
 Visual representations of
 knowledge,  concepts,  thoughts, or  ideas
Photo Credit: modellearning

#RSAC
Learning Styles
 Clarify meaning through relationships
 Best example might be utilizing a mind map
Photo Credit: modellearning

#RSAC
Learning Styles
 Representing information spatially and with images [some*] students are able to
 focus on meaning  reorganize and group similar
ideas easily  make better use of their visual
memory
Source: http://en.wikipedia.org/wiki/Visual_learning

#RSAC
Visualization Fundamentals

#RSAC
Knowledge
 Semantic Networks  Node = Concept, Edge = Relationship  Model of the Information  Ontology
 Model of the Model

#RSAC
Graph Theory 101
Let G be a graph G = (V, E)
Where V = {0, 1, 2, 3}
And E = {(0, 1), (0, 2), (1, 2), (2, 3)}

#RSAC
Graphs Are Everywhere!
 Social Networks  Maps & Shortest Path  UML Software Design  Neural Networks

Introducing OpenGraphiti
#RSAC

#RSAC
Introducing OpenGraphiti
 3D data visualization engine  Free & Open Source
 Visualize and manipulate any loosely related data
 Easy-to-use shell for data scientists

#RSAC
Workflow

#

$ 

#'

# 

SemanticNet Library
6)/#//$&    !   7,12  7,01355+-.42 7,01355+-.42 7,01355+-.42  ,01**35 &5+-.42 ,01**35 &5+-%.42 ,01**35 &5+-.  ,$01-  ,.2

#RSAC

OpenGraphiti
&# 

23

#RSAC


#RSAC
Particle Physics
24

#RSAC 25

#RSAC
Why?
· Actors populate the knowledge graph
· Creation is understood, output is complex
· Layout closer to the "natural shape" of data structure
· Take advantage of the GPU to untangle information
· Humans are good at processing shapes and colors

Datasets!
#RSAC

#RSAC
Merger & Acquisition Dataset
 Looked at all merger and acquisition activity in the security space since 2002 (to the summer of 2014)
 Connected:
 Acquirers (who did the acquisition)  Targets (who was acquired)  Acquisition value (if disclosed)
 Data sourced from 451 Research's M&A Knowledgebase
 https://451research.com/merger-aquisitions-knowledgebase-overview

#RSAC 29

#RSAC
Visualizing a Partner Network
 Graph of vendors and their partners
 Looking at a security partner ecosystem
 Who should your company partner with?

#RSAC 31

#RSAC
Visualizing a SHODAN Query
 https://www.shodan.io/  Lets you find specific computers (routers, servers, etc.) using a
variety of filters  Some have described it as a public port scan directory or a search
engine of banners

#RSAC

#RSAC
Nuclear Exploit Kit Dataset

 List of domains hosting the Nuclear EK (pink)

 Retrieve their IPs (yellow)

 Create a Domain-IP graph

Nuclear EK

 Quickly see the clusters

Hosting IPs

Hosting IPs

Nuclear EK

Nuclear EK

Hosting IPs

#RSAC
Email Graph
 Graph of email communications
 Indicative of distinct  Silos/divisions
 Different locations?  Many-to-one comms
 Email forwarding to team?
 Orphan nodes  Spam?
35

#RSAC
Email Graph
36

#RSAC
VCDB Dataset
 http://www.vcdb.org  From the Verizon Risk Team  Vocabulary for Event Recording and Incident Sharing (VERIS)  VERIS Community Database (VCDB)

#RSAC 3 8

#RSAC
Dyre Botnet
 Typically distributed by the Cutwail botnet
 Via spam emails  With links to Dropbox or Cubby files
 Harvests credentials through traffic interception
 Primarily targets online banking websites for ACH/wire fraud
 When graphed, a we noticed the emergence of a unique shape

#RSAC
The Dyre `Pentagram Network'
40

#RSAC
The Dyre `Pentagram Network'
 Initial query to domain (red)
 Co-occurrences with domains in a `pentagram network' (white)
 Finally directed out of `pentagram network' (blue)
41

#RSAC
Linear Queries & Time Compression

TIME-1

TIME-2
42

TIME-3

#RSAC
Exploring DGAs
 Domain Generation Algorithm (DGA)  Used to generate domains programmatically  Typically rely on a seed of some sort
 Date, time, keyword, etc.  Allows for the registration of domains that no human would ever type
 Not just used for malware
 Also used for marketing campaigns

#RSAC
DGA-based Malware C2 Domains
 Ramnit
 lyxbotuappfreadkfk.com
 Tinba
 eersrjfoffvo.com, rlhupxlxoghh.com, vhtsiililikr.com
 Emotet
 ywnjdkgrvivotium.eu
 Expiro
 bpu1ilh.mazxceo.info
44

#RSAC
Regular Chain
45

#RSAC
Irregular Chain

#RSAC
Regular Circuit

#RSAC
Irregular Circuit

#RSAC
Thick Irregular Circuit

#RSAC
Labyrinth

Different Topologies?

IP
 Consider co-occurrence time window

 Some clients are noisier than others

 Diversity in domain lookups of clients

IP

 Nature of the DGA algorithm

 Frequency,

 Redundancy

IP

 Etc.

IP

#RSAC
D D D

What Else Can I Use

#RSAC

OpenGraphiti For?

52

#RSAC
Use OpenGraphiti
 Provided data generation scripts  File system
 semanticnet/examples/fs_graph.py
 SHODAN query
 semanticnet/examples/shodan_graph.py
 BRO IDS logs
 semanticnet/examples/bro_graph.py

#RSAC
Use OpenGraphiti
 Network packet captures  IDS alerts
 e.g. Snort, Bro, Suricata, etc.
 Environmental data
 e.g. wind, water, earthquake, temperature, tide, soil statistics
 Odd data
 e.g. Migratory patterns of the African and European coconut-laden swallow population

#RSAC
What's Next?
55

#RSAC
Smart Query Language

#RSAC
World View

#RSAC

Point Clouds

Time Series

#RSAC

Heightmaps

Volumes

#RSAC
Virtual Reality Experience
60

#RSAC
OpenGraphiti 1.0++
61

#RSAC
Apply Slide
 Data must be beautiful, interesting, and accurate to be useful
 Graphs are everywhere
 Organize your data in graphs to quickly spot relationships and anomalies
 OpenGraphiti is
 A free, Open Source, and awesome data visualization tool  Used to visualize any relational data as an interactive 2D
or 3D model  http://www.opengraphiti.com/
62

SESSION ID: ECO-T08
Questions?
www.opengraphiti.com
Andrew Hay
Research Director OpenDNS, Inc. @andrewsmhay

Thibault Reuille
Sr. Security Researcher OpenDNS, Inc. @thibaultreuille

#RSAC

