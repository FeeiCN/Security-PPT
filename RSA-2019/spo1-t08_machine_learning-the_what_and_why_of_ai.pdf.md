SESSION ID: SPO1-T08
Machine Learning: The What and Why of AI

TK Keanini
Distinguished Engineer Cisco @tkeanini

#RSAC

#RSAC
Hello My Name is TK Keanini
(Pronounced Kay-Ah-Nee-Nee)

#RSAC
Security Analytics Versus Other Analytics

Outcomes Synthesis/Analytics
Telemetry

Security Analytics focus on augmenting or automating these functions
· Incident Responder · Security Analyst · Security Operations · Threat Hunter · Compliance and Policy · Business Continuity · Cybercrime fighting

#RSAC
Gartner Hype Cycle for Emerging Technologies | 2017
MACHINE LEARNING

Source: Gartner (July, 2017) Expectations

Time

Innovation Trigger Peak of Inflated Expectations

Trough of Disillusionment

Slope of Enlightenment

Plateau of Productivity

#RSAC
Vendors Got Us Here

"Advanced Threats are no match for A.I."

"Our machines detect threats others cannot"

"100% predictive"

#RSAC
How We Disservice Machine Learning

Silver Bullet Marketing

No Explanation or Discussion

Limited Guidance

Machine Learning:
What It Is

#RSAC
"Field of study that gives computers the ability to learn without being explicitly programmed."
Arthur Samuel's definition of machine learning in 1959

Clustering Bayesian

Instance Based Ensemble

#RSAC
Regularization Rule System

Ground Truth

Machine Learning Algorithms

Classifier

Regression

Decision Tree

Deep Learning

Neural Network

NERD ALERT

Dimensionality Reduction

Let's define the helpful data science terms

Machine Learning

#RSAC
The Big Picture
Artificial Intelligence Machine Learning Supervised Learning Unsupervised Learning Reinforcement Learning

Machine Learning

#RSAC
Common Techniques
Supervised Learning
You know the question you are trying to ask and have examples of it being asked and answered correctly
Unsupervised Learning
You don't have answers and may not fully know the questions
Reinforcement Learning
"The other" category Trial and error behavior effective in game scenarios

#RSAC

75%
Supervised Learning

15%

10%

Unsupervised Learning

Other
(Reinforcement Learning, etc.)

#RSAC
What Did We Do Before Machine Learning?
Use in Combination with Machine Learning

Simple Pattern Matching

Statistical Methods

Rules and First Order Logic (FoL)

Machine Learning:
Techniques

#RSAC
"Field of study that gives computers the ability to learn without being explicitly programmed."

#RSAC
Training Classifiers (Supervised Learning)
Training Data

Machine Learning Algorithm

New Data

Classifier

Prediction

#RSAC
Ground Truth Used in Supervised Learning
The 'Ground Truth' is the pairing of example questions and answers.
If you can phrase a problem as 'we know this is right, learn a way to answer more questions of this type'.
Success depends greatly on the dataset expressing the Question -> Answer mapping.

Machine Learning:
Pitfalls

#RSAC
What Is At Stake Matters
Because you watched Deadpool, you might like...

Deadpool

X-Men: First Class

The Flash

Captain America: The First Avenger

#RSAC
How Did You Come to That Conclusion?
"The Explainability Problem"

Normal Workflow
CFO daily calendar

Irregular Activity
ML detects "suspicious" activity and suggests remediation

Quarantined
However, ML cannot articulate *why* it wants to remediate

Loss of Time and Resources

Machine Learning:
For Security

#RSAC
Why Is Machine Learning So Useful in Security?

Static
With limited variability or is well-understood

Evolving Security
The security domain is always evolving, has a large amount of variability, and is not well-understood

#RSAC
Insider Threats and Behavioral Security Analytics

Attackers
They're not breaking in, they are logging in

Detecting
Through novelty and outliers

Events
Turn weak signals into a strong ones

#RSAC
Example: Cisco Encrypted Traffic Analytics
Industry's first network with the ability to find threats in encrypted traffic without decryption
Avoid, stop, or mitigate threats faster then ever before | Real-time flow analysis for better visibility

Encrypted Traffic

Non-encrypted Traffic

Privacy AND Security

#RSAC
Public Disclosure of Research in 2016
Cisco Research

Known Malware Traffic

Known Benign Traffic

Extract Observable Features in the Data

Employ Machine Learning techniques
to build detectors

Known Malware sessions detected in encrypted traffic with high accuracy

"Identifying Encrypted Malware Traffic with Contextual Flow Data"
AISec '16 | Blake Anderson, David McGrew (Cisco Fellow)

#RSAC
Example: Encrypted Traffic Analytics

Outcomes

Detection of Malware without Decryption

Cryptographic Compliance

Synthesis/Analytics

Analytics Pipeline of Diverse Methods

Observables

Telemetry

Flow Start

Initial Data Packet
Sequence of Packets Lengths and Times
Time

#RSAC
Initial Data Packet
HTTPS header contains several information-rich fields
Server name provides domain information
Crypto information educates us on client and server behavior and application identity
Certificate information is similar to whois information for a domain
And much more can be understood when we combine the information with global data

SPLT Shows TLS Metadata Differences

Model
Client

Sent Packets
Received Packets

Server

Packet lengths, arrival times and durations tend to be inherently different for malware than benign traffic.

Google Search Page Download
Initiate Command & Control
Exfiltration & Keylogging

#RSAC

#RSAC
Multi-layer Analytical Pipeline
Cascade of specialized layers of Machine Learning algorithms

Billions of connections

Anomaly Detection and Trust Modeling

Event Classification and Entity Modeling

Relationship Modeling

· Statistical Methods · Information-Theoretical Methods · 70+ Unsupervised Anomaly Detectors · Dynamic Adaptive Ensemble Creation

· Multiple-Instance Learning · Neural Networks · Rule Mining · Random Forests · Boosting · ML: Supervised Learning

· Probabilistic Threat Propagation · Graph-Statistical Methods · Random Graphs · Graph Methods · Supervised Classifier Training

#RSAC
Security That Shows Its Work

New Oct. 3 Oct. 4 C&C url Oct. 15 Anomalous http Oct. 16 Heavy uploader Dropbox.com Oct. 25 Oct. 28 Malicious http Recurring

5

35

73

3

Spam tracking #CSPM02

8

Information Stealer #CDCH01

87

8

Malware: sality Dec. 9 | 28 days

#RSAC
Measure the Right Things
Efficacy of the Assertions True/False Positive True/False Negative Overfitting/Underfitting Root Mean Squared Error

How Helpful Was This Alert?
In the end, it is not the math that matters, it is you the customer that matters!

#RSAC

2018
Jan Feb Mar
Q1 (Jan-Mar)
Apr May Jun
Q2 (Apr-Jun)

Stealthwatch Cloud Alerts Marked Helpful by Customers (%)
95.91% 94.52% 94.75%
94.45%
97.23% 94.97% 91.70
94.63%

#RSAC
Late-binding Modeling to Detect Security Events

Dynamic Entity Modeling
Collect Input IP Meta Data System Logs Security Events Passive DNS External Intel Vulnerability Scans Config Changes

Perform Analysis
Role

Dynamic Entity
Modeling

Group Consistency
Rules

Forecast

Draw Conclusions
What is the role of the device?
What ports/protocols does the device continually access?
What connections does it continually make?
Does it communicate internally only? What countries does it talk to?
How much data does the device normally send/receive?

#RSAC
Serverless Security
How Can You Secure a Server When There is No Server?
Serverless Computing is a cloud computing execution model in which the cloud provider dynamically manages the allocation of machine resources (ie the servers)

#RSAC
Serverless Anomaly Detection
Amazon Lambda function that normally connects to two internal resources connecting to an unexpected third

#RSAC
Serverless Detection of an Unusual API Call

#RSAC
Serverless Behavioral Analytics

Conclusion

#RSAC
What to Ask Your Vendor
How are you applying Machine Learning in your product and why? How do you measure its effectiveness?
Regarding supervised learning, what are you using for 'ground truth'? What non-machine learning are you using and why?
What papers or open-source have you published regarding your analytics? For the ML based assertions, what entailments are provided?

#RSAC
A Good Machine Learning Approach
Be Pragmatic Entailments Analytical pipeline, over single technique Measure helpfulness, not mathematical accuracy Be Transparent with your science, publish papers and open source

NERD ALERT
Thank you!

#RSAC
References

#RSAC
Learn More....
Cisco Stealthwatch Enterprise Cisco Stealthwatch Cloud Encrypted Traffic Analytics

#RSAC
Basic References
· Blog: Detecting Encrypted Malware Traffic (Without Decryption) · Blog: Learning Detectors of Malicious Network Traffic · Blog: Transparency in Advanced Threat Research · Blog: Turn Your Proxy into Security Device · Blog: Securing Encrypted Traffic on a Global Scale · Blog: Closing One Learning Loop: Using Decision Forests to Detect Advanced Threats

#RSAC
Make Your Head Hurt Reading Material
· Identifying Encrypted Malware Traffic with Contextual Flow Data, Blake Anderson and David McGrew, AISEC `16 · Grill, M., Pevny, T., & Rehak, M. (2017). Reducing false positives of network anomaly detection by local adaptive
multivariate smoothing. Journal of Computer and System Sciences, 83(1), 43-57. · Komarek, T., & Somol, P. (2017). End-node Fingerprinting for Malware Detection on HTTPS Data. In Proceedings of
the 12th International Conference on Availability, Reliability and Security (p. 77). ACM. · Jusko, J., Rehak, M., Stiborek, J., Kohout, J., & Pevny, T. (2016). Using Behavioral Similarity for Botnet Command-
and-Control Discovery. IEEE Intelligent Systems, 31(5), 16-22. · Bartos, K., & Rehak, M. (2015). IFS: Intelligent flow sampling for network security­an adaptive approach.
International Journal of Network Management, 25(5), 263-282. · Letal, V., Pevny, T., Smidl, V. & Somol, P. (2015). Finding New Malicious Domains Using Variational Bayes on Large-
Scale Computer Network Data. In NIPS 2015 Workshop: Advances in Approximate Bayesian Inference (pp. 1-10). · Rehak, M., Pechoucek, M., Grill, M., Stiborek, J., Bartos, K., & Celeda, P. (2009). Adaptive multiagent system for
network traffic monitoring. IEEE Intelligent Systems, 24(3).

