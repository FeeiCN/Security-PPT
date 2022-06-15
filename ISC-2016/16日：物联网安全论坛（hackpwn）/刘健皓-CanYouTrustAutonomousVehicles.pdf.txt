Can You Trust Autonomous Vehicles: Contactless Attacks against Sensors of Self-Driving Vehicles

Who Are We

Jianhao Liu
Director Qihoo 360 SKY-GO Vehicle Cyber Security Team

Wenyuan Xu
Professor Zhejiang University University of South Carolina

Chen Yan
Ph.D. Student USSLab
Zhejiang University
2

Roadmap
· Autonomous Vehicles · Hacking Sensors · Our Attacks
­ Ultrasonic sensors ­ MMW radars ­ Cameras
· Discussion
3

The Car Hacking History
- Car ===> CAN bus hacking - Connected car ===> Telematics hacking - Autonomous car ===> Automatic system hacking
4

What is Autonomous Vehicle?

Source: Michael Aeberhard, BMW Group Research and Technology

5

Sensors in automated driving system

Sensors V2X

Scenario Assessment

Driving Function

Human-Machine Interface

Source:Michael Aeberhard, BMW Group Research and Technology

6

Sensors for Self-Driving

Radar

LiDAR

Works in low light & poor weather, but lower resolution.

Emits light, so darkness not an issue. Some weather

Cameras

limitation.

Senses reflected light, limited

when dark.

Sees colour, so can be used to

read signs, signals, etc.

Ultrasonic Sensors
Limited to proximity, low speed manoeuvres.

Source: Texas Instruments
7

How to Hack Sensors?

Sensors
Ultrasonic Sensors
Jamming Spoofing
MMW Radars

Automated System

Cameras

Jamming Spoofing

Blinding

Control HMI Display
8

Tesla: A Tragic Loss
· First fatal crash while using Autopilot on May 7, 2016.
· Reliability of sensors.
Source: The New York Times
First Tesla Accident in China Caused by Autopilot
9

Existing Sensors on Tesla Model S
One MMW Radar
A Medium range Radar is mounted in the front grill.
One camera
A forward looking camera is mounted on the windshield under the rear view mirror.
12 ultrasonic sensors
Ultrasonic sensors are located near the front and rear bumpers.
10

HMI Display Mistake ­ Demo on Tesla
11

Control Mistake ­ Demo on Tesla
12

Attacking Ultrasonic Sensors
On Tesla, Audi, Volkswagen, and Ford
13

Ultrasonic Sensor
What is ultrasonic sensor? · Measures distance · Proximity sensor (< 2m)
· Applications
­ Parking assistance ­ Parking space detection ­ Self parking ­ Tesla's summon
14

Misuse 1: The car doesn't stop while it should.

Why doesn't the car stop?? Oh NOOO!!!

Hey! Mind the glass!!!

15

Misuse1: The car doesn't stop while it should.
16

Misuse 2: The car stops while it shouldn't.
Is it cursed?! Why the car can't park in??
17

How do ultrasonic sensors work?

· Emit ultrasound and receive echoes

· Piezoelectric Effect

· Measure the propagation time (Time of Flight)

· Calculate the distance

: propagation time of echoes : velocity of sound in air

Electrical signal

Ultrasonic Sensor

Distance

18

Attacking ultrasonic sensors
Attacks: · Jamming ­ generates ultrasonic noises ­ denial of service · Spoofing ­ crafts fake ultrasonic echo pulses ­ alters distance · Quieting ­ diminishes original ultrasonic echoes ­ hides obstacles
Equipment: · Ultrasonic transducers ($0.4) ­ emit ultrasound · Signal suppliers ­ generate excitation signals
­ Arduino ($24.95) ­ Signal generator (~$20)
19

Jamming Attack
· Basic Idea:
­ Injecting ultrasonic noises ­ At resonant frequency (40 ­ 50 kHz) ­ Causing Denial of Service
· Tested ultrasonic sensors:
­ In laboratories: 8 models of stand-alone ultrasonic sensors ­ Outdoors: Tesla, Audi, Volkswagen, Ford
20

Jamming Attack ­ in lab

Received electrical signals at the sensor

· 8 models of ultrasonic sensors

Excitation

­ HC-SR04 ­ SRF01

pulse No jamming

Echo pulses

Next cycle

­ SRF05

­ MaxSonar MB1200

­ JSN-SR04T ­ FreeCars V4 ­ Grove ultrasonic ranger

Weak Jamming

Noises

­ Audi Q3 sensors

· Sensor reading
­ Zero distance ­ Maximum distance

Strong Jamming

Noises

21

How should cars behave to jamming?
Zero distance? or
Maximum distance?
22

Jamming Attack ­ on vehicles

· 4 different vehicles
­ Audi Q3 ­ Volkswagen Tiguan ­ Ford Fiesta ­ Tesla Model S
· Self parking · Summon
· Results
­ Maximum distance

Experiment setup on Tesla Model S
23

Jamming Attack ­ Demo on Audi Jamming hides obstacles.
24

Jamming Attack ­ Demo on Tesla Summon
Jamming hides obstacles.
25

Jamming Attack ­ Demo on Tesla Summon
The interferer was hit & stopped working. Jamming distance can be increased.
26

Jamming Attack ­ Results

· On ultrasonic sensors
­ Zero or maximum distance
· On vehicles with parking assistance
­ Maximum distance
· On self-parking and summon
­ Car does not stop under strong jamming!

Audi Normal

Audi Jammed

Tesla Normal

Tesla Jammed
27

Spoofing Attack
Basic Idea · Injecting ultrasonic pulses · At certain time
Non-trivial · Only the first justifiable
echo will be processed · Effective time slot

Effective time slot 28

Spoofing Attack ­ Demo on Tesla Spoofing alters distance.
29

Spoofing Attack ­ Demo on Audi Spoofing alters distance.
30

Spoofing Attack ­ Results
· Manipulate sensor readings
­ On stand-alone ultrasonic sensors ­ On cars
Parking Aid

Tesla Normal

Tesla Spoofed

Audi Spoofed
31

Acoustic Quieting
· Acoustic Cancellation
­ Cancel original sound with ones of reversed phase
­ Minor phase and amplitude adjustment
· Cloaking
­ Sound absorbing materials (e.g., damping foams ($3/m2)) ­ Same effect as jamming!
32

Cloaking Car ­ Demo Cloaking hides car.
33

Cloaking Human ­ Demo Cloaking hides human.
34

Attacking Millimeter Wave Radars
On Tesla Model S
35

Millimeter Wave Radar
What is MMW Radar? · Measures distance, angle, speed, shape · Short to long range sensing (30-250m)
· Applications
­ Adaptive Cruise Control (ACC) ­ Collision Avoidance ­ Blind Spot Detection
36

Misuse 1: The car doesn't stop while it should.
Why doesn't the car stop?? Oh NOOO!!!
37

Misuse 2: The car stops while it shouldn't.

NO! Don't stop!!!

I'll catch you!

38

How do MMW Radars work?

· Transmit and receive millimeter electromagnetic waves

· Measure the propagation time

· Modulation
­ Amplitude ­ Frequency (FMCW) ­ Phase

· Doppler Effect

· Frequency Bands:
­ 24 GHz ­ 76-77 GHz

Block diagram of a bistatic Radar with frequency modulation
(Source: H. Winner, Handbook of Driver Assistance Systems)

39

MMW Radar ­ To be discovered

#1. Understand Radar signal ­ Signal Analysis

­ Frequency range ­ Modulation process ­ Ramp height (bandwidth) ­ Ramps (number, duration) ­ Cycle time

#2. Jamming Attack

­ Feasible? ­ What jamming signal?

#3. Spoofing Attack

­ Feasible?

The MMW Radar on Tesla Model S

40

Attacking MMW Radar ­ Setup
· Signal Analysis · Jamming Attack · Spoofing Attack
· Equipment:
­ Tesla Model S Radar (A) ­ Signal analyzer (C) ­ Harmonic mixer (E) ­ Oscilloscope (B) ­ Signal generator (D) ­ Frequency multiplier (E)
41

MMW Radar Signal Analysis

Harmonic Mixer

Signal Analyzer

Oscilloscope

Frequency domain Time domain

analysis

analysis

· Center frequency: 76.65 GHz · Bandwidth: 450 MHz · Modulation: FMCW · Radar chirp details ...

Real-time spectrum on signal analyzer
42

What indicates Autopilot?

· What does blue mean? · Why stationary?

Traffic Aware Cruise Control is on. Autosteer is on.

43

Jamming Attack ­ Demo Jamming hides obstacles.
44

Attacking MMW Radars ­ Results
· Jamming: hides detected objects
­ Either fixed or sweeping frequency signal worked
· Spoofing: alters object distance
Result of jamming attack
45

Attacking Cameras
Mobileye & Point Grey Tesla Model S
46

Automotive Cameras
What is automotive camera? · Computer vision · Forward & backward
· Applications
­ Lane departure warning ­ Lane keeping ­ Traffic sign recognition ­ Parking assistance
47

Blinding Cameras ­ Results with Laser beam
Total blinding Total blinding

Fixed laser beam

Wobbling laser beam

Damaged

Permanently damaged
48

Blinding Cameras ­ Demo with Laser beam
Laser blinds camera.
49

Response from Tesla
"... We appreciate the hard work you have put into researching potential attacks on sensors used in the Autopilot system. We are currently evaluating your report and investigating the concerns your team has raised so that we can understand if any real world risks have been uncovered ..."
50

Countermeasures
· Sensor fail safe
­ Zero or maximum ­ Anomaly detection
· Sensor redundancy
­ MIMO system ­ Different types of sensors
· Sensor data fusion

Thank Goodness!
51

Conclusions and Takeaway messages
· Attacking existing sensors is feasible · The sky is not falling · Sensors should be designed with security in mind
­ Think about intentional attacks
· For customers
­ Don't trust semi-autonomous cars yet
Will we have fully secure autonomous cars?
52

Acknowledgements
· Tongji University
­ Dr. Xin Bi
· Keysight Open Laboratory & Solution Center, Beijing · Xpwn Team · USSLab, Zhejiang University
­ Weibin Jia, Zhou Zhuang, Guoming Zhang
· ADLAB, Qihoo 360
­ Bin Guo
53

54

Questions and Answers

Check out our whitepaper!

Jianhao Liu Chen Yan
Wenyuan Xu

liujianhao@360.cn yanchen@zju.edu.cn wyxu@cse.sc.edu



