#RSAC

SESSION ID: ANF-F02
The Physics of Security

Andrew Rutkiewicz
Principal IT Security Analyst EMC
@packethawk

#RSAC

#RSAC
Challenges For (Analytics Driven) Security

 Visibility
 Normalization of Data
 Both Packet and Log  Transaction Reconstruction

Visibility

 Traditional Anomaly Analytics Fail
 Misconfigurations  Broken Business Process  Can't Operationalize

Capability

Operability

 No Standardized Measures or Models

2

Big Data Pitfalls

#RSAC
AI

DS

 Analytics
 Apophenia

Analytics

 Data Science
 Perception Bias

Process

 Machine Learning
 Over Fitting

Hardware

Data

 Traditional analytic methods for network security carry high transaction costs and low yields

 Outcome: Negative ROI ­ This is changing

3

#RSAC
Physics and Its Applications
 Physics
 Knowledge of Nature
 Applied Physics
 Useful Application of the Knowledge
 Example: Light\Optics
 Euclid, Alhazen, Newton, Hooke, Kao  300AD First Studies of Light  1973 First Fiber Optic Network
4

#RSAC
Entropy
 Thermal Dynamics  Boltzmann and Gibbs
 Extraction of Metals From Oxides  Melting/Boiling Point Manipulation
 Information Theory  Claude Shannon
 Communication  Compression  Cryptanalysis "surely must be one of the most important master's theses ever written... The paper was a landmark in that it helped to change digital circuit design from an art to a science." - The Computer from Pascal to von Neumann By HH Goldstine
5

#RSAC
Entropy Hypothesis: RAT Detection
 Detecting Binary C2 communications
 NON-HTTP Based
 Specifically APT RATs
 9002, Pivy, PlugX, Gh0st  All use compression and or encryption
 Descriptive Based Detection
 Non Signature Based  Non IoC based
6

#RSAC
The Entropy Experiment
 Calculation of entropy for network traffic
 Most common C2 channels (20 different TCP/UDP Ports)
 Basic Byte Frequency Measures
 Most Common Byte (MCB)  MCB Frequency (MFB)  Unique Bytes (UB)
 Analysis Applications
 Variance from known protocols  Obfuscation, Compression, and Encryption Detection  Encoding, Key Space Usage
7

#RSAC
Results (Still a WIP)
 Encoded and Compressed Data Have Predictable Patterns
 39U 19!  \x4B63\x6060  Gh0st  LZ Artifacts other than 789C
 Scalability Concerns
 Entropy calculation at line speeds is difficult
 DNS Anomalies
 AV Exfil
 Pretty Pictures
8

#RSAC
UDP 53
9

#RSAC
TCP 53
10

#RSAC
TCP 80
11

#RSAC
TCP 443
12

#RSAC
SSL Entropy vs Biological Growth
Unique Bytes Used vs Entropy Rat Weight vs Age
(From Geoffrey West, Ted Talk, July 2011)
13

#RSAC
SSL Entropy vs Commercial Growth
Unique Bytes Used vs Entropy Walmart Sales vs Age
(From Geoffrey West, Ted Talk, July 2011)
14

#RSAC
Universal Driving Forces
 Growth
 Sigmoidal Curve or S Curve  Lag, Log, Decel, Plateau
 Economies of Scale
 Parabolic Curve  Advantage, Neutral, Disadvantage
 These forces are as important in the understanding of the data as they are in the system they are built upon.
15

#RSAC
Cost Benefit Analysis

Wisdom Knowledge Information
Data

$$$$$ $$$ $$ $

Big Data HLL LLL
Hardware

 Data is cheap  Data enrichment at collection time is almost as cheap as raw data  Post processing and enrichment costs grows as you go up levels of
abstraction  "Wisdom is not tactical"

16

#RSAC
Going Beyond Entropy
 Purpose Built Hardware
 ASICs  DSPs
 Wave Equation
 Application of frequency, amplitude and wavelength  Additional quantitative measures
 Timing Based Analysis
 Kaminsky BlackOps
 ROWHAMMER
 Proof physics rule HW and all it is built upon (IMO)
17

#RSAC
Summary
 Security analytics are still in the lag stage  Statistics are better than intuition
 Physics are better than statistics
 Entropy is one of many measures available
 But an important one
 Growth and Scale
 Leverage economies of scale  S curve as a forecasting tool
 Game Theory Considerations  As a community we must move from an art form to a science!
18

#RSAC
Apply What You Have Learned Today
 Next week you should:
 Identify where your organization is on the growth chart
 In the first three months following this presentation you should:
 Inventory visibility and current data sets  Assess operational feasibility of analytics program
 Within six months you should:
 Evaluate options between DIY or turnkey  Establish a plan for partnering with BI teams to conduct a POC for a
practical and achievable use case.
19

#RSAC
Thank you!
Questions?
20

