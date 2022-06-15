Exciting, To-Be-Announced Platform Session
We can't tell you about it now, but trust us - it's awesome.
Philipp Drieger | Staff Machine Learning Architect
October 2018

© 2018 SPLUNK INC.

PHILIPP DRIEGER
Staff Machine Learning Architect philipp@splunk.com

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.
AI | ML | Deep Learning

Let's start with AI

Artificial Intelligence

 Artificial Intelligence (AI) The self driving car

Machine Learning

 Machine Learning (ML) Predicting car demand based on past history
 Example given by BMW

Deep Learning

 Deep Learning (DL) Not in our product today.... but we still do NO image processing

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Popular ML/DL Frameworks in the Python Landscape

https://www.kdnuggets.com/2017/03/getting-started-deep-learning.html

MACHINE LEARNING TOOLKIT
https://www.kdnuggets.com/2018/02/top-20-python-aimachine-learning-open-source-projects.html

© 2018 SPLUNK INC.
MLTK Container for TensorFlowTM

MLTK Container for TensorFlowTM ­ Why?
Because our customers ask. We listen. Simple as that!

© 2018 SPLUNK INC.

Popular deep learning frameworks help to extend MLTK for specific use cases.

Freedom for Data Scientists and
Developers to bring in custom code and models

Flexibility to run compute intense model trainings
on GPU accelerated hardware

© 2018 SPLUNK INC.
Architecture Overview

© 2018 SPLUNK INC.
Splunk > MLTK > Dockerized Deep Learning
| fit y from x* into "model"

Industrial Assets

Consumer and Mobile Devices

Real Time

MACHINE LEARNING TOOLKIT

| apply "model"

persisted model

Search

Alert

...

OT Visualize

Process and interaction flow

© 2018 SPLUNK INC.

... | fit

... | apply

| summary

grey area symbolizes data volume and typical runtimes

localhost:5000/fit > check y, x and parameters (received via POST) > create keras/tf model > fit model > evaluate model > persist model
localhost:5000/apply > check x and parameters (received via POST) > check for cached model or load from saved model > run model on input data
localhost:5000/summary > return last fitting history and model information

© 2018 SPLUNK INC.
Splunk App for the MLTK Containers

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Tests and Benchmarks

Fit on 100k DGA training dataset

© 2018 SPLUNK INC.

Apply on test dataset
1.7M events (ca. 11K EPS throughput)

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
CPU vs GPU Benchmark

Benchmarking Model Training

© 2018 SPLUNK INC.

 AWS Instance: p3.2xlarge (64GB, 8vCPU, NVIDIA V100 GPU 16GB)

 DGA Dataset: 100K events with 100 dimensions + 1 target dimension

 Neural Network: 10 layer deep neural network with 886K trainable parameters,



100 layer deep with 9M trainable parameters

© 2018 SPLUNK INC.
CPU vs GPU > 15x speedup on search runtime
100K dataset | 100 dimensions | 10 layer NN

CPU: 986 seconds (00:16:26)

GPU: 66 seconds (00:00:66)

© 2018 SPLUNK INC.
CPU vs GPU > 25x speedup on model fitting
100K dataset | 100 dimensions | 10 layer NN

© 2018 SPLUNK INC.
Wrap up

Recommendation Matrix
consider your ML dataset's dimensional and computational complexity

© 2018 SPLUNK INC.

extensibility

dimensional complexity

Machine Learning Toolkit In general: for most common ML tasks: use MLTK + MLSPL API
computational complexity

Case #1: need for specific algo / framework
extensibility
Case #2: need for distributed / gpu compute

Key Take Aways
What are the benefits of MLTK Container for TensorFlowTM

© 2018 SPLUNK INC.

Easy install and prebuilt examples in the
MLTK Container for TensorFlowTM App

Customize containerized code for specific use
cases using any ML/DL frameworks of choice

Flexibility to run compute intense model trainings
on GPU accelerated hardware

© 2018 SPLUNK INC.
"Available as Splunk Professional Services
(Whiteglove Program) that you can engage as of today ­ let us know!"
MLTK Container for TensorFlowTM

© 2018 SPLUNK INC.
Thanks | Q&A
philipp@splunk.com

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Thanks to ...
... so many amazing colleagues supporting this idea and helping in getting it real
 Customers and Partners  ML PMs: Manish, Andrew, Harsh, ...  ML Eng: Xander, Lin, Chang, ...  Other: James, Duncan, ...

