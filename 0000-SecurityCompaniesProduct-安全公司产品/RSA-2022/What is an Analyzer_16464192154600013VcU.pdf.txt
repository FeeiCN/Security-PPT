What is an "Analyzer "?

What is an "Analyzer "?
A Primer on ThreatEye's* Approach to Machine Learning
At CounterFlow AI, the term "analyzer" describes the programs or scripts that fuel its intelligent sensor. Up until now, the vernacular of machine learning has centered around "models". An analyzer, however, is a broader term that encompasses the entire scriptable framework that provides the logic and organization for models and analyses. Analyzers combine counts, rules, statistics, advanced analytics and machine learning models to solve specific network security and network performance use cases. Because each network is unique, an analyzer can be used either in standard form or customized for specific situations. ThreatEye also provides data caching and a statistical infrastructure to support the development of new analyzers. In practical terms, analyzers provide an end-user with a programmable interface for running multiple analytics and models in parallel, either on the full stream of network data or on a filtered stream of specific flow types. In addition to running n number of scripts, ThreatEye can ingest both Threat Intelligence data and policy rules as additional input sources for machine learning. As network dynamics continue to evolve, the flexible nature of ThreatEye's scripting architecture allows customers to implement new analyzers as new interests and use cases arise.
*ThreatEye® refers to CounterFlow AI's Network Visibility Platform

Crypto Analyzers statistically investigate and classify encrypted network traffic.
EXAMPLES  Web Application Identification  TLS Encryption Protocol Tracking  OS and Host Fingerprinting
Flow Analyzers utilize flow information and computed fields to identify anomalous traffic.
EXAMPLES  Novelty Detection  MAC address  Flow metrics: Protocol, IP  Domain (TLD, Second Level Domain)  Layer 7 Mismatch  PCR DNS
Graph Analytics Analyzers apply graph theory methods to the incoming stream of connections.
EXAMPLES  Graph Clustering  Communities of Interest ID
Policy Analyzers enforce specific rules and network policies on incoming network traffic.
EXAMPLES  Allowed Servers (DNS, DHCP, NTP, et al)  Time Fence  Geo Fence  TLS Enforcement

Statistical Flow Analyzers apply statistical models to available flow information and computed fields to identify anomalous traffic.
EXAMPLES  Time Anomaly  Country Anomaly  DGA Detection
Advanced Anomaly Detection  Streaming Point Process models  Naive Bayesian Joint Modeling (Multi-variable histogram estimation)
Timeseries Analyzers look at patterns of traffic over time to identify unexpected bursts and changes in mean and variance.
EXAMPLES  Burst/Outlier Detection  Z-score  Median Absolute Deviation  Changepoint detection  Mean  Variance

Anatomy of an Analyzer
ThreatEye API provides models and utility functions for applying machine learning
Each analyzer must define two required functions: REQUIRED FUNCTION 1
Setup to initialize the model
REQUIRED FUNCTION 2
Loop to apply the model to each incoming message

Analyzers use a powerful, complete scripting anguage based on the Lua syntax
Analyzers can integrate with other analyzers, or downstream processes such as packet capture

Each output is archived for future retrospective analysis

© Copyright 2022 - LiveAction. All Rights Reserved. 960 San Antonio Rd, Suite 200, Palo Alto, CA 94303 +1 (888) 881-1116

About LiveAction
LiveAction provides end-to-end visibility of network and application performance from a single pane of glass. This gives enterprises confidence that the network is meeting business objectives offers IT administrators full visibility for better decision making and reduces the overall cost of operations. By unifying and simplifying the collection, correlation and presentation of application and network data, LiveAction empowers network professionals to proactively and quickly identify, troubleshoot and resolve issues across increasingly large and complex networks. To learn more and see how LiveAction delivers unmatched network visibility, visit www.liveaction.com.

