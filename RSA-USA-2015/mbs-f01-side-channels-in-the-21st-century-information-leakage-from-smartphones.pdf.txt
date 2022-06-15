SESSION ID: MBS-F01
Side-Channels in the 21st Century: Information Leakage From Smartphones

Gabi Nakibly, Ph.D.
National Research & Simulation Center Rafael ­ Advanced Defense Systems Inc. gabin@rafael.co.il

Yan Michalevsky
Stanford University ymcrcat@gmail.com

#RSAC

#RSAC
Side-Channel Attacks on Mobile Devices
2

#RSAC
Session's Main Points
 Smartphones are susceptible to information leakage in weird and unexpected ways.
 Rogue applications might do harm even if they have few permissions.
 The bottom line: treat every app you install as having `root' on the phone.
 After this presentation you will think twice before installing a "harmless" game from an unofficial market having "zero" permissions.
3

Sensor ID: Mobile Device

Identification via Sensor

#RSAC

Fingerprinting

H. Bojinov, Y. Michalevsky, G. Nakibly and D. Boneh

#RSAC
Physical Identification of a smartphone
 The research question: Can an app (or a website) identify the phone on which it runs?
 Answer: Yes!
 Android: Device ID ,Serial number ,MAC Address, ANDROID ID.  iOS :UDID ,identifierForVendor ,advertisingIdentifier ,MAC Address.
 But, all of them either require the user's permission or can be changed by the user or do not survive factory reset.

#RSAC
The Basic Idea
 Each sensor has a tiny inaccuracy that is very specific to it.  Such inaccuracies can be used to fingerprint the phone.  In our research we have focused on the following sensors:
 Accelerometer  Microphone/speakers
6

#RSAC
Accelerometer
 Measures the acceleration of the phone in all three directions.
7

#RSAC
Accelerometer Skew

am=at*S+O

measured acceleration

actual acceleration

sensitivity (ideally = 1)

offset (ideally = 0)

8

#RSAC
But how can we measure S and O?
 We need some reference acceleration...
9

#RSAC
10

#RSAC
Measuring S and O
 As a first step we tried to identify S and O for the Z axis
11

#RSAC
Measuring S and O
 Measure the acceleration face up and then face down and then do some calculations
12

#RSAC
Initial Experiment for 17 iPhones
13

#RSAC
Results for 10,000(!) phones
 An estimated 7.5 bits of identification.
 If we can measure S and O for all three axes we can get 3*7.5 = 22.5 bits of identification.
14

#RSAC
Measuring S and O for all axes
 A phone does not usually stand up...  Alternatively, we can measure the phone is 6 resting positions.
15

#RSAC
Measuring S and O for all axes
 And then do some math....
16

#RSAC
Accelerometer is not alone...
 Other sensors can also be fingerprinted  For example, the microphone
17

#RSAC
Microphone
 Each microphone has a characteristic frequency response curve
18

#RSAC
How can we fingerprint a microphone?
 We need some audio reference....  We can use ....the phone's speaker
19

#RSAC
Experiment for 16 Motorola Droids
20

Gyrophone: Recognizing

Speech from Gyroscope

#RSAC

Signals

Y. Michalevsky, G. Nakibly and D. Boneh

Scenario
People are talking in the vicinity of a mobile device

#RSAC

22

#RSAC
Microphone vs. Gyroscope Access

Requires permission

Does NOT require permission

23

#RSAC
MEMS Gyroscopes
 Major Vendors:
 STM Microelectronics (Samsung Galaxy)  InvenSense (Google Nexus)
24

#RSAC
Gyroscopes are susceptible to sound

70 Hz tone PSD

50 Hz tone PSD

25

#RSAC
Gyroscopes are (lousy, but still) microphones

 Hardware sampling frequency:
 InvenSense: up to 8000 Hz  STM Microelectronics: 800 Hz
 Software sampling frequency:
 Android: 200 Hz  iOS: 100 Hz

 Very low Signal-to-Noise ratio (SNR)
 Acoustic sensitivity threshold: ~70 dB Comparable to a loud conversation
 Sensitive to sound angle of arrival
 Directional microphone (due to 3 axes)

26

#RSAC
Browsers allow gyroscope access too
WGebcAkKopitpbblaiacssaeetdidobnbrsroowwsseerrss
27

Problem: How do we look into higher

#RSAC

frequencies?

Speech Range

Adult Male

85 ­ 180 Hz

Adult Female

165 ­ 255 HZ

28

We can sense higher frequencies signals #RSAC
Due to aliasing
Recording tones between 120 to 160 Hz on a Nexus 7 device
29

#RSAC
Experimental setup
 Room. Simple Speakers. Smartphone.  Subset of TIDIGITS corpus  10 speakers × 11 samples × 2
pronunciations = 220 total samples
30

#RSAC
Speech analysis using a single Gyroscope
 Gender identification  Speaker identification  Isolated word recognition
 Speaker independent  Speaker dependent
31

#RSAC
We can successfully identify gender

Nexus 4

84%

Galaxy S3

82%

Random guess probability is 50%

32

#RSAC
A good chance to identify the speaker

Nexus 4

Mixed Female/Male 50%

Female speakers

45%

Male speakers

65%

Random guess probability is 20% for one gender, and 10% for a mixed set

33

Isolated word recognition

#RSAC

(speaker independent)

Nexus 4

Mixed Female/Male 17%

Female speakers

26%

Male speakers

23%

Random guess probability is 9%

34

Isolated word recognition

#RSAC

(speaker dependent)

Nexus 4 Male speaker 65%

Random guess probability is 9%

35

#RSAC
Can we use multiple devices to improve the method?
Answer: Yes. Raising speaker dependent recognition rate to 77%.
36

#RSAC
Defenses

#RSAC
Software Defenses
 Low-pass filter the raw samples  0-20 Hz range might be enough for browser based applications
(learning from Web-Kit's example)  Access to high sampling rate should require a special permission
38

#RSAC
Hardware Defenses
 Hardware filtering of sensor signals (not subject to configuration)  Acoustic masking
39

#RSAC
More details can be found here
crypto.stanford.edu/gyrophone
40

#RSAC
Apply
 Next week you should:
 Relax. We know it was shocking.
 In the three months following this presentation you should:
 Notice which sensors applications on your phone have permissions to  For each application ask yourself the following question:
 If this app were to have `root' privileges do I trust it enough to run on my phone?
 If the answer is no, you should probably uninstall it.  At least for devices that handles sensitive information
41

#RSAC
To conclude
 We believe this is only the beginning  Many more unexpected information leakages will be found in
coming years.  Treat every app you install as having `root' on the phone!  Now we know you will think twice before installing that "harmless"
game ....
42

#RSAC
Questions?
 Yan Michalevsky ­ yanm2@cs.stanford.edu  Gabi Nakibly ­ gabin@rafael.co.il
43

