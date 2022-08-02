Sensor and Process Fingerprinting in Industrial Control Systems

Martín Ochoa Cyxtera Technologies

Mujeeb Chuadhry Singapore University of Technology and Design

Bio

Martín:
· Head of Research, Cyxtera TFP · Previously Assistant Professor in
Bogotá and SUTD, Singapore. · Ph.D. in CS, background in Math and
Systems Engineering. · Interested in software and systems
security applications to ICS, IoT.

Mujeeb:
· Ph.D. student at SUTD in Singapore. · Thesis on sensor fingerprinting in ICS. · Background in Electronic Engineering.

3 / 60

Sensor and Process Fingerprinting in ICS

ICS Security is important

4 / 60

https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Kernkraftwerk_Grafenrheinfeld_-_2013.jpg/1920px-Kernkraftwerk_Grafenrheinfeld_-_2013.jpg
Sensor and Process Fingerprinting in ICS

Water also...

5 / 60

https://www.pepperl-fuchs.com/global/images_inet_lowres_GLOBAL/EC_JB_20180118_01_Interface_Wasserzulauf-Klaeranlage_rdax_717x399_100.jpg
Sensor and Process Fingerprinting in ICS

Noise is bad...

6 / 60

https://giphy.com/gifs/static-minimal-white-noise-vxcuu6bLZDdm0
Sensor and Process Fingerprinting in ICS

Noise is good!

7 / 60

https://thewatchman.com.au/2018/05/20/deadpool-2-can-you-love-a-dumpster-fire/
Sensor and Process Fingerprinting in ICS

Wall
8 / 60

What kind of noise?

30 cm

Measured values

Timestamp

Values

0

30.541212341

1

30.481231303

2

30.521231290

3

30.342305190

4

30.560392148

5

30.531091240

6

30.494756191

https://thewatchman.com.au/2018/05/20/deadpool-2-can-you-love-a-dumpster-fire/
Sensor and Process Fingerprinting in ICS

Talk outline

1. An ICS testbed (SWaT)

2. Cyber/Physical attacks on SWaT

3. How to detect attacks?

4. How to detect attacks using sensor and process noise?

5. Discussion
9 / 60

Sensor and Process Fingerprinting in ICS

Secure Water Treatment Testbed (SWaT)

· Water treatment testbed for security research since 2015.
· 6 stages of processing (including UV, chemical treatment)

https://itrust.sutd.edu.sg/itrust-labs-home/itrust-labs_swat/

10 / 60

Sensor and Process Fingerprinting in ICS

SWaT overview video

11 / 60

[Video overview SWaT]
Sensor and Process Fingerprinting in ICS

Network overview

12 / 60

L1 L0
Sensor and Process Fingerprinting in ICS

13 / 60

Sensor and Process Fingerprinting in ICS

14 / 60

https://looneytunes.fandom.com/wiki/That%27s_all_Folks
Thanks! Questions?
Sensor and Process Fingerprinting in ICS

Why we need defense in depth in ICS

· Multiple advanced attack vectors that challenge traditional IT security views.
· Insider threats · Insecure Updates · Supply chain attacks
· Lack of authentication in L1 and L0! (field network/protocols)

http://invensyscustomersuccess.blogspot.com/2013/09/web-hmi-and-mobile-scada-rocks.html
ICS + Vanilla IT + Internet

15 / 60

Sensor and Process Fingerprinting in ICS

How to control a water tank?

Sensor
HH

Remote

PLC

I/O

Valve (inflow)
16 / 60

LL
Pump (outflow)
Sensor and Process Fingerprinting in ICS

How to control a water tank?

Sensor
HH

Remote

PLC

I/O

Valve (inflow)
17 / 60

LL
http://invensyscustomersuccess.blogspot.com/2013/09/web-hmi-and-mobile-scada-rocks.html
Pump (outflow)
Sensor and Process Fingerprinting in ICS

18 / 60

Attacks?
https://shadowlakemusic.com/shop/indoor-percussion/raising-the-bar/
Sensor and Process Fingerprinting in ICS

Sensor

Authentication?

Remote 101010001111000111 I/O
L0

10101000111100011
L1

19 / 60

Sensor and Process Fingerprinting in ICS

Sensor

Authentication?

101111111111000111
Remote 101010001111000111 I/O
L0

101111111111000111 10101000111100011
L1

20 / 60

Sensor and Process Fingerprinting in ICS

Attacker model

Sensor
Physical: · Can replace sensors
(hardware) · Can manipulate
analog/smart signal
[Bolshev et al. BH Asia 16]
21 / 60

101111111111000111
Remote 101010001111000111 I/O
L0
Sensor and Process Fingerprinting in ICS

101111111111000111
10101000111100011
L1
Cyber: · Any kind of Man-in-the-
middle at L0 and L1 networks. http://invensyscustomersuccess.blogspot.com/2013/09/web-hmi-and-mobile-scada-rocks.html
· Otherwise spoof sensor values (i.e. SCADA)
[Urbina et al. CCS 16] [Krotofil et al. HITB 15]

Valve (inflow)
22 / 60

("Shameless") attack

Sensor
HH

HH Attack

LL
Real state
Sensor and Process Fingerprinting in ICS

Pump (outflow)

PLC

Data spoofing attacks

23 / 60

Sensor and Process Fingerprinting in ICS

Video of data spoofing attack
[Video attacks against SWaT]

24 / 60

Sensor and Process Fingerprinting in ICS

25 / 60

Defenses?
https://shadowlakemusic.com/shop/indoor-percussion/raising-the-bar/
Sensor and Process Fingerprinting in ICS

How to raise the bar against attacks?

· Use cryptographic primitives to authenticate data?
· Cumbersome in legacy systems. · Computational resources are limited. · Not supported by industrial protocols.
· Doesn't entirely solve the problem. · Analog data could already be malicious. · Cryptographic keys can be stolen.

https://shadowlakemusic.com/shop/indoor-percussion/raising-the-bar/

26 / 60

Sensor and Process Fingerprinting in ICS

Sensor
27 / 60

Authentication?

Remote 101010001111000111 I/O
L0

10101000111100011
L1

· Sensor data could already be malicious before authenticating. http://invensyscustomersuccess.blogspot.com/2013/09/web-hmi-and-mobile-scada-rocks.html
· Keys can be stolen.
Sensor and Process Fingerprinting in ICS

Model-based countermeasures
· Idea: a mathematical model of the process gives a "prediction" of future plant states. · If observation does not match the prediction, raise an alarm.

28 / 60

https://i.makeagif.com/media/11-19-2015/P8A1JT.gif
Sensor and Process Fingerprinting in ICS

Valve (inflow)
29 / 60

"Shameless" attack detection

Sensor
HH
PLC
HH

Attack

LL
Real state
Sensor and Process Fingerprinting in ICS

Pump (outflow)

Prediction based on last observed value

Stealthy attacks

30 / 60

https://www.cinemaspartan.com/somewhere-oliver-stone-is-frowning-tropic-thunder/
Sensor and Process Fingerprinting in ICS

Stealthy attacks
· Small deviations have a cumulative effect.
· Can bypass model-based countermeasures.

31 / 60

Sensor and Process Fingerprinting in ICS

Physical invariants
· Idea: detect violations of laws of physics, i.e. pressure as a function of a water tank level. [Adepu et al. IFIP SEC 16]
· Shortcomings: hard to produce exhaustive invariant list for a system.

32 / 60

Sensor and Process Fingerprinting in ICS

33 / 60

Noise!
https://shadowlakemusic.com/shop/indoor-percussion/raising-the-bar/
Sensor and Process Fingerprinting in ICS

Come on, feel the noise
· Can we use sensor noise to fingerprint sensor values and address shortcomings of previous defenses? · Can we distinguish sensors of same type and brand?

34 / 60

Sensor and Process Fingerprinting in ICS

Our sensors

35 / 60

$1500 - $3000
Sensor and Process Fingerprinting in ICS

Noise in different sensors

Ultrasonic Level Sensor (SWaT) Electromagnetic Flow Sensor (SWaT) Pressure Sensor (SWaT)
Pressure Sensor (WADI)
Electromagnetic Flow Sensor (WADI)
Radar Level Sensor (WADI)
36 / 60

Sensor and Process Fingerprinting in ICS

Sensors vs Noise

· Water level not changing. · Stable behavior in two runs. · Cannot really distinguish Sensor 1 from Sensor 2 visually but...

37 / 60

Sensor and Process Fingerprinting in ICS

A bit of magic...

38 / 60

https://static.tvtropes.org/pmwiki/pub/images/technowizard.jpg
[Ahmed et al. ArxiV 17]
Sensor and Process Fingerprinting in ICS

Sensors vs features

39 / 60

Sensor and Process Fingerprinting in ICS

Sensors vs features

· Supervised Machine Learning can help distinguishing between the noise of different sensors!

40 / 60

[Ahmed et al. Arxiv 17, AsiaCCS 18]
Sensor and Process Fingerprinting in ICS

Towards authentication
Can we distinguish data belonging to Sensor 1 from other sensors?

Sensor 1
Sensor 2
41 / 60

Sensor and Process Fingerprinting in ICS

Towards authentication
· Want to build a binary classifier (authentic/not authentic) to act as an authenticity verifier.
· Fingerprint check!

Sensor 1 Auth. Checker

Authentic

42 / 60

Trained with lots of data belonging to Sensor 1 and all other sensors in the plant!
Sensor and Process Fingerprinting in ICS

Towards authentication
· Chunks of observations from other sensors, even for similar values, brand, type etc. should not pass!

Sensor 1 Auth. Checker

Not authentic!

43 / 60

Sensor and Process Fingerprinting in ICS

Careless (noise) attack
· An attacker using a constant value (no-noise) is easy to detect.

Sensor 1 Auth. Checker

https://www.dailyedge.ie/fake-designer-goods-865028-Apr2013/

44 / 60

Sensor and Process Fingerprinting in ICS

Not authentic!

Does it work?

Training set Sensor 1 Sensor 1 Sensor 1
Sensor 1 Sensor 1 Sensor 1 Testing set

Sensor A Sensor B Sensor C
Sensor D Sensor E Sensor F

Train Test

Sensor 1 Auth. Checker

Check: Count how many samples in the Testing set are correctly classified after training with the Training set.

45 / 60

Sensor and Process Fingerprinting in ICS

Does it work?

Training set Sensor 1 Sensor 1 Sensor 1 Sensor 1 Sensor 1 Sensor 1
Testing set
46 / 60

Sensor A Sensor B Sensor C
Sensor D Sensor E Sensor F

· Chunk size of about 2 minutes works best (120 samples).
· Tested on up to 60 sensors of the same class (cheap sensors).
· 99% accuracy in authentication test.
[Ahmed et al. Arxiv 17, AsiaCCS 18]
· Fingerprints are still valid after 4 years at least. · Tested in room temperature (20 to 35 oC)
Note that this works when physical quantity is constant!
Sensor and Process Fingerprinting in ICS

Attacks detected?

· "Shameless" attacks:

· Abrupt jumps can be detected by Model-Based countermeasures.
· "Flat" noise injections can be detected by noise patterns (even stealthy).

· Malicious sensors (hardware) can be detected. · Like [Bolshev et al. BH Asia 16]

· What about stealthy attacks that also try to inject coherent noise against a dynamic system?

47 / 60

Sensor and Process Fingerprinting in ICS

Process and Sensor noise
· In practice we have a combination of sensor plus process noise, I.e. water moving generates a certain characteristic "noise".
· I.e. even if sensor is perfect (no noise) measurement is "noisy".

48 / 60

Sensor and Process Fingerprinting in ICS

Process and Sensor noise

Residual = Observation - Prediction

49 / 60

Sensor and Process Fingerprinting in ICS

Detecting flat noise

50 / 60

Sensor and Process Fingerprinting in ICS

Noise vs. Stealthy attacks

51 / 60

[Ahmed et al. ACSAC 18]
Sensor and Process Fingerprinting in ICS

Video of attack detection

52 / 60

Sensor and Process Fingerprinting in ICS

Does it work?

53 / 60

Training set Sensor 1 Sensor 1 Sensor 1
Sensor 1 Sensor 1 Sensor 1 Testing set

Sensor A Sensor B Sensor C
Sensor D Sensor E Sensor F

Train Test

Sensor 1 Auth. Checker

Check: Same as before, note that we are now training and testing against the residual!

Sensor and Process Fingerprinting in ICS

Does it work?

Training set Sensor 1 Sensor 1 Sensor 1 Sensor 1 Sensor 1 Sensor 1
Testing set
54 / 60

Sensor A Sensor B Sensor C
Sensor D Sensor E Sensor F

· Chunk size of about 2 minutes (120 samples) works best (again).
· Tested on up to 18 sensors and respective process on SWaT.
· 96% accuracy in authentication test.
[Ahmed et al. ACSAC 18]
· Considered several "stealthy" strategies. · But CPS are different! [Krotofil et al. HITB 15]
Sensor and Process Fingerprinting in ICS

Architecture

55 / 60

L1
Sensor and Process Fingerprinting in ICS

L0

Sensor Auth. Checker

Summary
· We have shown empirical evidence of existence of sensor fingerprint in real-world ICS. · Over 10 sensor types, up to 60 sensors for each type.
· We have shown how this fingerprint, together with a process fingerprint, can help in authenticating sensor readings.
· High detection/authentication accuracy (96%-99%).

56 / 60

Sensor and Process Fingerprinting in ICS

Next steps?
· On the other hand, this is just the beginning! · What if threat actor has an entire research institute at their disposal?

57 / 60

Sensor and Process Fingerprinting in ICS

Next steps?

· A lack of model makes things challenging, under advanced attacks.

· Case of super powerful attacker (Ironman + PhD)

· We have ideas on how to deal with this using a challengeresponse protocol
[Ahmed et al, ArxiV 17]

58 / 60

Sensor and Process Fingerprinting in ICS

[Krotofil et al. HITB 15]

Sound Bytes

· In most real-world ICS sensor data is not authenticated at L0 and/or L1 levels.

· Sensor noise can be useful to authenticate sensors without using cryptography.

· Process + Sensor noise results in a more robust fingerprint.

Thanks!

martin.ochoa@cyxtera.com

chuadhry@mymail.sutd.edu.sg

59 / 60

Sensor and Process Fingerprinting in ICS

· [Adepu et al. IFIP SEC 16] S. Adepu, A. Mathur Using Process Invariants to Detect Cyber Attacks on a

Water Treatment System. IFIP SEC 2016.

· [Ahmed et al. AsiaCCS 18] C. Ahmed, M. Ochoa, J. Zhou, A. Mathur, R. Qadeer, C. Murguia,

J.Ruths NoisePrint: Attack Detection Using Sensor and Process Noise Fingerprint in Cyber

Physical Systems. AsiaCCS 2018

· [Ahmed et al. Arxiv 17] C. Ahmed, A. Mathur, M. Ochoa NoiSense: Detecting Data Integrity

Attacks on Sensor Measurements using Hardware based Fingerprints. ArxiV 2017

· [Ahmed et al. ACSAC 18] C. Ahmed, J. Zhou, A. Mathur Noise Matters: Using Sensor and

Process Noise Fingerprint to Detect Stealthy Cyber Attacks and Authenticate sensors in CPS.

ACSAC 2018

· [Bolshev et al. BH Asia 16] A. Bolshev and M. Krotofil Never trust your inputs: causing

'catastrophic physical consequences' from the sensor (or how to fool ADC). Black Hat Asia

2016.

· [Krotofil et al. HITB 15] M. Krotofil and J. Larsen What You Always Wanted and Now Can:

Hacking Chemical Processes. Hack In The Box 2015.

· [Urbina et al. CCS 16] D. Urbina, J. Giraldo, A. Cardenas, N. Tippenhauer et al. Limiting the

Impact of Stealthy Attacks on Industrial Control Systems. CCS 2016.

60 / 60

Sensor and Process Fingerprinting in ICS

