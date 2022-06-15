© 2018 SPLUNK INC.
A Container Adventure: Scaling and Monitoring Kubernetes Logging Infrastructure
Gimi Liang | Sr. Software Engineer Matthew Modestino | IT Practitioner David Baldwin | Product Manager
October 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Agenda

 The container landscape  Choose your Adventure
· Splunk Connect for Docker · Splunk Universal Forwarder · Splunk Connect for Kubernetes
· Amazon EKS · Openshift  Wrap-up  Q&A

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Container Landscape

© 2018 SPLUNK INC.

Select the tools to deploy and maintain your apps...
Select the tools to deploy and maintain your container cluster...

© 2018 SPLUNK INC.
Host on the public,private, or hybrid cloud...

© 2018 SPLUNK INC.
" Gartner predicts that, by 2020, more than 50% of global organizations will be running containerized applications in production, up
from less than 20% today".
Market Guide for Public Cloud Container Services August 2017 ID: G00317096

© 2018 SPLUNK INC.
Choose Your Adventure

Splunk Connect for Docker
 2015: · Introduced Docker Logging Driver
 2018: · Certified Docker Logging Plug-in · Replacement for Docker Logging Driver · Supported Open Source* · Optimize consumption into Splunk
through HEC

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Universal Forwarder
 Run directly on Kubernetes nodes or as a daemonset using docker image
 Easy way for Splunk teams to get started with container logs
 Can move a lot of data, reliably and securely using existing Splunk process
 Needs modifications to make integration easier with json driver and journald

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Splunk Connect for Kubernetes
 Secure, Simple, Scale, Configurable
 3 Components · Logging · Metadata/Objects · Metrics
 Leveraged CNCF sponsored projects
 Managed through Helm  Supported Open Source*  Optimize consumption into
Splunk through HEC

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Testing

Benchmarking Guidelines
Environment and Setup
 3 Node Kubernetes Cluster · Master - m4.large · Nodes - m4.16xlarge
 Splunk Deployment · Focus is on a single node indexer performance
 Tested with different message sizes · 256 Byte · 1 KiB
 30 containers generating 1000 messages/sec each · 30K messages/sec/node

© 2018 SPLUNK INC.

Benchmarking Results
256 byte Message Size
 Consistent ~7.5 Mbps and ~30K EPS through indexer
 Results repeatable with different buffer size
 Executed 4X with 60 sec pause in between

© 2018 SPLUNK INC.

Benchmarking Results
1KiB Message Size
 Consistent ~20 Mbps and ~20K EPS through indexer
 Results repeatable with different buffer size
 Executed 4X with 60 sec pause in between

© 2018 SPLUNK INC.

Testing in the Wild
Results in a less controlled environment
 AWS Openshift Quickstart Cluster (Oregon) · 3x Master - m4.xlarge · 3x Nodes - m4.xlarge
 SplunspklunDk-keubpelroneytems-loeggnintg-7jhrc · Standalone Splunk with 2 indexing pipes · 12 Cores 96GB ram, bare metal with 20% CPU utilization · Consumer ISP internet (60Mbps down/ 10Mbps up)
 Message sizes · 256 bytes, 1000 bytes, 256KB
 30 containers generating 1000 messages/sec each  ~9 Million messages generated in 5 mins

© 2018 SPLUNK INC.

Testing in the Wild
Results in a less controlled environment
 Indexing throughput · Maxed ~3MB/s - Not bad for public internet!
 Indexing Latency · Saw up to ~7 mins indexing delay, but no message loss

© 2018 SPLUNK INC.

Benchmarking Guidelines
Load Balancing
 HEC Architecture  Single Connection (HF)
· Each logging pod has 1 connection to
HEC
· HF or LB can be used to spread logs
across indexer tier
· HEC Deploy · http://dev.splunk.com/view/event-collector/SP-CAAAE73
· N· GINX http://dev.splunk.com/view/event-collector/SP-CAAAE9Q

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Key Takeaways

 Container orchestration is the foundation for current and future applications
 Splunk is the go to solution for container insights for every container deployment
 Extremely scalable and flexible

© 2018 SPLUNK INC.
Q&A
Gimi Liang | Engineering Matthew Modestino | Practitioner & Evangelist
David Baldwin | Product Management

Looking for More?
Check out these sessions here at .conf18!

© 2018 SPLUNK INC.

Join us in the Innovation Lab for more on Splunk and containers!

Resources
Resources Discussed During Session
 Splunk Connect for Kubernetes · Repo: https://github.com/splunk/splunk-connect-for-kubernetes · Gems: · https://rubygems.org/gems/fluent-plugin-kubernetes-objects · https://rubygems.org/gems/fluent-plugin-splunk-hec · Docker Hub: · https://hub.docker.com/r/splunk/fluentd-hec/ · https://hub.docker.com/r/splunk/kube-objects/
 Splunk Connect for Docker · Repo: https://github.com/splunk/docker-logging-plugin · Docker Store: https://store.docker.com/plugins/splunk-connect-for-docker
 Universal Forwarder: · https://store.docker.com/community/images/splunk/universalforwarder

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Resources
Resources Discussed During Session
 Splunk Connect for Kubernetes with Amazon EKS · Amazon EKS Blog: https://www.splunk.com/blog/2018/07/19/splunk-connect-for-kubernetes-
on-eks.html
· Demo: https://www.youtube.com/watch?v=_3QrIfBXpq0&list=PLhr1KZpdzukdc-
jfSvpQYOO9nsOiCbVtX&index=4

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

