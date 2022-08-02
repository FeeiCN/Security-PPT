Extreme Learning Machines (ELM) 
Guang-Bin Huang 

Professor of School of Electrical and Electronic Engineering Nanyang Technological University, Singapore 

$IJOBc0QUJDT7BMMFZ*OUFSOBUJPOBM"**OEVTUSZ4VNNJU c



1980s-2010

1950s-1980s
  
  

   
  

2010 ­ / 
   
  

2
HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org



 

 

 

2010 ,   
3
HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org



 



  (CNN, BP) 1980s~1990s

2012ELM  

 (1970s)

2004ELMs  2004

1950s 1970s 1980s

2010 2015



4
HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

"15"

Rosenblatt's perceptron 
(1956-1969)

AI winter  
(1970-1986)

BP algorithms  
(1980-1996)

SVM 
(1996-2010)

Reviving of Deep Learning  
(2004 ­) ELM  (2004-)

It's time to move toward (Machine) Learning Science from Machine Learning Engineering

5
HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org


· 
­ Universal Approximation capability [Leshno 1993, Park and Sandberg 1991, Chen, et al : 1995]  
­ Classification capability [Huang, et al 2000] 
· 
­  
M. Leshno, et al., "Multilayer feedforward networks with a nonpolynomial activation function can approximate any function," Neural Networks, vol. 6, pp. 861-867, 1993. J. Park and I. W. Sandberg, "Universal approximation using radial-basis-function networks," Neural Computation, vol. 3, pp. 246-257, 1991. G.-B. Huang, et al, "Classification ability of single hidden layer feedforward neural networks," IEEE Trans. Neural Networks, vol. 11, no. 3, pp. 799­801, May 2000.
6
HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org



 Deep Learning

 Biological Learning



  ~

""""

""""""





 





sequential learning   stream data learning

 

  

""

"" 

"" "" 

7
HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

 """"
 

Extreme Learning Machines  ELM

·  

­ 

· sigmoid networks

· RBF networks

· polynomial networks · complex (domain) networks · Fourier series · wavelet networks, etc

­ 

· 





9

HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

ELM

ELM:

1

i

L



1

i

L

(ai ,bi )

     

,,
ELM , , ,, , ,

1

d

xj
:
,,

  ELM

:

Sigmoid:

,,

RBF:

,,

Fourier Series: , ,

· cos ·

10
HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

ELM

· ELM ­  
  [Huang, et al 2004, 2006, 2007]

­ 

­ " "

­ ELM10MITIBM Watson Georgia Tech201320152016


­ ELMRandom Kitchen Sink (SKS) Google [A Rahimi and B. Recht 2009]

­ 2016IBMELM

G.-B. Huang, et al., "Universal approximation using incremental constructive feedforward networks with random hidden nodes,"

IEEE Transactions on Neural Networks, vol. 17, no. 4, pp. 879-892, 2006.

O. Barak, et al, "The importance of mixed selectivity in complex cognitive tasks," Nature, vol.497, 2013

M. Rigotti, et al, Journal of Neuroscience, vol. 33, no. 9, 2013

R. I. Arriaga, et al. "Visual Categorization with Random Projection," Neural Computation, vol. 27, 2015

J. Xie and C. Padoa-Schioppa, "Neuronal remapping and circuit persistence in economic decisions," Nature Neuroscience, vol.

19, 2016

E. L Rich and J. D Wallis, "What stays the same in orbitofrontal cortex," Nature Neuroscience, vol. 19, no. 6, 2016

11

HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

ELM

/ 

 



( )

12
HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

3D

Training time shortened from 8 hours (conventional methods) to 15 seconds (ELM solution) for a dataset with 6 meshes with about 25~30K faces.

[Xie, et al 2014]

13

HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

ELM

d Input Nodes

L Hidden Nodes m Output Nodes

ELM Feature Mapping / ELM Feature Space

ELM Learning

d Input Nodes

ELM

ELM m Output Nodes

Different from Deep Learning, hidden neurons in multi-layer / hierarchical ELM

(considered as a single whole ELM) are not required to be iteratively tuned

14

HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

ELM(ELM-AE)
Features represented by the output weights of ELM-AE of MNIST OCR Datasets (with 60000 training samples and 10000 testing samples)
15
HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

ELM(ELM-AE)
ELM-AE based multi-Layer ELM (ML-ELM): Different from Deep Learning, no iteration is required in tuning the entire multi-layer feedforward networks
16
HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

MNIST OCR



ELM

H-ELM [Unpublished] H-ELM [J. Tang, et al, 2015]



Multi-Layer ELM (784-700-700-15000-10)
[Huang, et al 2013]
Deep Belief Networks (DBN) (748-500-500-2000-10)
Deep Boltzmann Machines (DBM) (784-5001000-10)
Stacked Auto Encoders (SAE)

Stacked Denoising Auto Encoders (SDAE)


~99.6% 99.14 99.03 .
98.87
99.05
98.6 98.72


 (CPU)
281.37s (CPU)
444.7s (CPU)
20580s (5.7, GPU) 68246s (19, GPU) > 17, GPU
> 17, GPU

[Huang, et al 2013]

L. L. C. Kasun, et al, "Representational Learning with Extreme Learning Machine for Big Data," IEEE Intelligent Systems, vol. 28, no. 6, pp. 31-34, 2013. J. Tang, et al, "Extreme Learning Machine for Multilayer Perceptron," (in press) IEEE Transactions on Neural Networks and Learning Systems, 2015.
17
HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org



Methods
Accuracies

ELM Based
99.4%

Tensor canonical correlation
85%

Tangent bundles on special manifolds
93.4%
[J. Tang, et al 2015]

Conventional: Heterogeneous combinations

Feature extraction (PCA,
etc)

Classifier (SVM, etc)

Conventional: Homogeneous combinations

Feature Learning by ELM AutoEncoder

ELM as Classifier

18
HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

ELM vs 


ELM-AE


86.45%

3D ShapeNets (Convolutional Deep Belief Network) 86.5%

[K. Xu, et al, 2015]


602 2

Princeton/MIT/CUHK's 3D ShapeNets for 2.5D Object Recognition and Next-Best-View Prediction
[Wu, et al 2014]
19
HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

ELM

d Input Nodes

L Hidden Nodes m Output Nodes

ELM

ELM

 ()

 



20
HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

ELM

Local Receptive Field

Pooling Size

 ak

i

Input Layer

Feature Map k

Pooling Map k

  PoolingELM ELM 

(Super)  i
21
HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

ELM vs 





ELM

97.3%

Tiled Convolutional Neural Nets 96.1%

Convolutional Neural Nets

94.4%

3D DBNs

93.5%

DBMs

92.8%

SVMs

88.4%

NORB Dataset


DBN

ELM

13 

6

G.-B. Huang, et al, "Local Receptive Fields Based Extreme Learning Machine," IEEE Computational Intelligence Magazine,

vol. 10, no. 2, pp. 18-29, 2015.

22

HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

ELM vs 





 ELM

0.02%



Convolutional Neural Nets (CNN)

28.51%

CNN+video (test 7.75% images of COIL)

CNN++video (COIL-like images)

20.23%

COIL Dataset: 1800 training samples, 5400 testing samples, 100 categories

Z. Bai, et al, "Generic Object Recognition with Local Receptive Fields Based Extreme Learning Machine," 2015 INNS

Conference on Big Data, San Francisco, August 8-10, 2015; Procedia Computer Science, vol. 53, pp. 391-399, 2015

23

HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

ELM vs 

  

MVD-ELM CDBN

81.39% 77.32%

306.4(CPU) > 2 (GPU)

ModelNet40: 10695 training data, 8567 testing data, 40 categories

Z. Xie, et al, "Projective Feature Learning for 3D Shapes with Multi-View Depth Images," The 23rd Pacific Conference on

Computer Graphics and Applications, Tsinghua University, China, October 7-9, 2015.

24

HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org



 (for GTSRB dataset: 39209 training data,
12630 testing data, 43 classes)
HOG+ELM
CNN + ELM Based MCDNN


99.56%
99.48% 99.46%


209 seconds (regular PC) 5 hours (regular PC) 37 hours (GPU Implementation)

Z. Huang, Y. Yu, J. Gu, and H. Liu, "An Efficient Method for Traffic Sign Recognition Based on Extreme Learning Machine,"

IEEE Transactions on Cybernetics, 2016

25

HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

Hierarchical ELM
(a) ELM

d Input Nodes

ELM

Different from Deep Learning, All the hidden neurons in ELM as a whole are not required to be iteratively tuned

(b) ELM

1

i

L



1

i

L

     

ELM m Output Nodes

1

d

xj 26
HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

ELM: 
Compression () Feature Learning ()
Sparse Coding (
)
Clustering ()
Regression () Classification ()
27
HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

ELM vs 

ELM

    sequential learning stream data learning     


  ~ """"""    
  ""  ""

28
HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

ELM vs  vs 
· · [Neumann 1951, 1956]
­   ? [Rosenblatt 1958]
· 60... · ELM[Huang, et al 2006, 2007, 2008]
­      · [Huang 2014]
29
HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

ELM
30
HUANG Guangbin: weibo.com/elm201x; egbhuang@ntu.edu.sg; www.extreme-learning-machines.org

