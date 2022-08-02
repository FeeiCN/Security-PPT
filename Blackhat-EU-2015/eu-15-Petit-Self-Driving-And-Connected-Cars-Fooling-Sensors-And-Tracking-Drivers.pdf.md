SELF-DRIVING AND CONNECTED CARS: FOOLING SENSORS AND
TRACKING DRIVERS
Jonathan Petit

AUTOMATED/CONNECTED VEHICLE

GPS, 802.11p

LIDAR Camera

wheel encoder
On-Board Unit, emaps ultrasonic sensors

RADAR
2

 Describe categorical distinctions for a step-wise progression through the levels.  Are consistent with current industry practice.  Eliminate confusion and are useful across numerous disciplines (engineering, legal, media, and
LEVELS OF DRIVING AUTOMATION (SAE J3016) public discourse).
 Educate a wider community by clarifying for each level what role (if any) drivers have in performing the dynamic driving task while a driving automation system is engaged.
OVER FOR A TABLE SUMMARIZING LEVELS OF AUTOMATION FOR ON-ROAD VEHICLES ­ J3016

Learn more about SAE J3016 or purchase the standard document:
www.sae.org/autodrive

AUTOMATED DRIVING SYSTEM MONITORS DRIVING ENVIRONMENT

HUMAN DRIVER MONITORS DRIVING ENVIRONMENT

0 1 2345

No Automation

Driver

Partial

Conditional

High

Full

Assistance Automation Automation Automation Automation

3

REMOTE ATTACKS ON AUTOMATED VEHICLES SENSORS:
EXPERIMENTS ON CAMERA AND LIDAR
Jonathan Petit, Bas Stottelaar, Michael Feiri, Frank Kargl

ATTACKING AUTONOMOUS VEHICLE SENSORS

GPS, 802.11p

LIDAR Camera

wheel encoder
On-Board Unit, emaps ultrasonic sensors

RADAR
5

CAMERA
· MobilEye C2-270  (Thanks to V-TRON)
· Features: · Lane departure · Rear collision alert · Pedestrian alert
6

ATTACKING CAMERA
· Attacks: · Jamming · Blinding · Scenery attack
· Equipments: · Light sources (LED) · Laser · Screen
7

ATTACKING CAMERA SENSITIVITY
· Ledsee 650 nm diode point laser with focusable lens.
· Max. output: 5 mW. · Distance: 1m
Tonal distribution
8

ATTACKING CAMERA SENSITIVITY
· Ledsee 650 nm diode point laser with focusable lens.
· Max. output: 5 mW. · Distance: 1m
Tonal distribution
8

ATTACKING WEBCAM SENSITIVITY
· Laser 650nm, 1m
9

ATTACKING WEBCAM SENSITIVITY
· Laser 650nm, 1m
9

ATTACKING CAMERA SENSITIVITY

· LED 850nm · LED 860nm · LED 875nm · LED 880nm

· Laser 905nm · LED 940nm · Matrix LED 940nm

10

JAMMING CAMERA
· Laser 650nm
11

JAMMING CAMERA
· Laser 650nm
11

DAZZLER
12

DAZZLER
12

BLINDING CAMERA

· Use auto exposure · "Time to recover"

Correlation

1.5 1.0 0.5 0.0 -0.5
02468 Time (s)
13

BLINDING CAMERA
Video of different light sources and their impact on camera
14

BLINDING CAMERA
· White spot, light, 50cm
· Affect background
Tonal distribution
15

BLINDING CAMERA
· White spot, light, 50cm
· Affect background
Tonal distribution
15

BLINDING CAMERA
Video of MobilEye C2-270 blinded by laser 650 nm
16

SCENERY ATTACK
17

SCENERY ATTACK
· What is real? · How to react to
unclassifiable objects?
Face from cvdazzle.com "Face not found" on pictriev.com
18

SCENERY ATTACK
· What is real? · How to react to
unclassifiable objects?
Face from cvdazzle.com "Face not found" on pictriev.com
18

COUNTERMEASURES CAMERA
· Increase redundancy by adding cameras to overlap fully or partially.
· Limit the effects of high-intensity light sources on image sensors via certain optics and materials.
· Detect jamming attacks on cameras via spectral analysis.
19

LIDAR
· IBEO LUX 3 · Detect object · Object tracking · 200 meters range
20

Ibeo LUX 3

Battery

Control Box
21

HOW DOES LIDAR WORK?
22

HOW DOES LIDAR WORK?
50Hz pulse
22

HOW DOES LIDAR WORK?

50Hz pulse 1.41 cm 0.73 cm

1.41 cm

0.96 cm

22

ATTACKING LIDAR
· Attacks: · Replay · Relay · Jamming · Spoofing · Tracking
· Equipments: · Laser · Receiver/Transmitter · Pulse generator
23

EQUIPMENT
Emitting laser: Osram SPL-PL90
($43.25)
Max. output: 25W for 100 ns Viewing angle: 9°
Receiving photodetector: Osram SFH-213
($0.65)
24

SPOOFING LIDAR (1/4)
Video demonstrating simple spoofing on LiDAR
25

SPOOFING LIDAR (2/4)

0 s

1.33 µs

Attack window (one scan step)

Silent window (gap)

X ms

Actual Reflection (First Echo)

Injected Reflection (Second Echo)

Undetected Injected Reflection

Time
26

SPOOFING LIDAR (3/4)

Original signal

Delay output

Delay

Counterfeit signal

Number of copies

Number of pulses

Time
27

SPOOFING LIDAR (3/4)

Original signal

Delay output

Delay

Counterfeit signal

Number of copies

Number of pulses

Time
27

SPOOFING LIDAR (4/4)
Video demonstrating advanced spoofing on LiDAR
28

Video demonstrating effect of attacker location
29

Video demonstrating "flashlight"
30

TRACKING LIDAR
Video demonstrating impact of spoofing on tracking box
31

COUNTERMEASURES LIDAR
· Use multiple lasers with non-overlapping wavelengths for redundancy: Ibeo: Possible, but currently not preferred by Ibeo
· Split image into separate channels to detect singlewavelength attacks
· Shorten the pulse period by limiting the maximum range:  Ibeo: Today Ibeo adapts the maximum range according to the environmental situation
32

Countermeasures LIDAR
· Introduce random probing - In preparation by Ibeo:
­ Prevents spoofing - spoofing only generates uncorrelated noise but no validated tracks
­ Enables the detection of spoofing attacks
· Probe multiple times to raise the confidence in a measurement:
­ Already implemented by object tracking with dedicated track validation on sensor object output for vehicle control systems
· Increase the number of objects than can be tracked (65 here):
­ Just a question of processing power, today Ibeos systems are able to manage up to 1,023 objects simultaneously
33

Confidential

Countermeasures LIDAR - System Setup Analyzed

Meas core (Standard probing)
Raw data preprocessing
Object tracking
Object Track Validation
34

Developer Interface
Vehicle Control

Confidential

Spoofing Detection

Countermeasures LIDAR - System Setup in Preparation
?
Meas core (Random probing)
Raw data preprocessing
Object tracking

Confidential

Object Track Validation
35

Vehicle Control

BLACK HAT SOUND BYTES.
1. Fooling LiDAR on raw data level in laboratory environment is possible but establishing stable objects on sensor output in real driving scenarios level for vehicle control could not be demonstrated
2. Fooling camera-based systems is easy and cheap.
3. Don't trust automated vehicle sensors unless you implement countermeasures to mitigate such threads.
36

CONNECTED VEHICLES: I CAN TRACK YOU!
Jonathan Petit, Djurre Broekhuis, Michael Feiri, Frank Kargl

AUTOMATED/CONNECTED VEHICLE

GPS, 802.11p

LIDAR Camera

wheel encoder
On-Board Unit, emaps ultrasonic sensors

RADAR
38

APPLICATION AREAS FOR V2X COMMUNICATION
Safety Efficiency Comfort
39

CONTENT OF BEACON
40

CONTENT OF BEACON
Beacons are broadcast within 1 km in clear!
40

CONTENT OF BEACON+

pathHistory

+

last location parked

+

seat belt use

+

Beacons are broadcast steering angle

within 1 km in clear!

+

fuel consumption

+

exterior

temperature

+

...

40

CONTENT OF BEACON+

pathHistory

+

last location parked

+

seat belt use

+

Beacons are broadcast steering angle

within 1 km in clear!

+

fuel consumption

+

"Automakers collect and wirelessly transtmemeitxptederrraiiotvurirneg history data to data centers" (Markey Repo+rt)

...

40

PRIVACY VIOLATIONS

Sensor Data

Processing

In-vehicle

Data at rest

Infrastructure
Data in transit
Meta Data

PProPirncoPirgnecoirPgnsecoignrssecogssecssesssing SDSeDSneaDSsnetaaDosnetaarosntaSarostDearonarstaor
DDareDtaraseDtaratseataratsetatDatstaarttaetatstat InInvInevIInhevnihev-cvihelceeihlceihlceilcele ...

J. Petit et al.,"Revisiting Attacker Models for Smart Vehicles",WiVec'14.

41

PRIVACY VIOLATIONS

collect information about me, my car,
and my surroundings
Infrastructure

Sensor Data

Processing

Data in transit

In-vehicle

Data at rest

Meta Data

PProPirncoPirgnecoirPgnsecoignrssecogssecssesssing SDSeDSneaDSsnetaaDosnetaarosntaSarostDearonarstaor
DDareDtaraseDtaratseataratsetatDatstaarttaetatstat InInvInevIInhevnihev-cvihelceeihlceihlceilcele ...

J. Petit et al.,"Revisiting Attacker Models for Smart Vehicles",WiVec'14.

41

PRIVACY VIOLATIONS

collect information about me, my car,
and my surroundings
Infrastructure

Sensor Data

Processing

Data in transit

Data at

In-vehicle

rest

Meta

malware

Data

PProPirncoPirgnecoirPgnsecoignrssecogssecssesssing SDSeDSneaDSsnetaaDosnetaarosntaSarostDearonarstaor
DDareDtaraseDtaratseataratsetatDatstaarttaetatstat InInvInevIInhevnihev-cvihelceeihlceihlceilcele ...

J. Petit et al.,"Revisiting Attacker Models for Smart Vehicles",WiVec'14.

41

PRIVACY VIOLATIONS

collect information about me, my car,
and my surroundings
Infrastructure

Sensor Data

Processing

Data in transit

Data at

In-vehicle

rest

Meta

malware

Data

PProPirncoPirgnecoirPgnsecoignrssecogssecssesssing SDSeDSneaDSsnetaaDosnetaarosntaSarostDearonarstaor
DDareDtaraseDtaratseataratsetatDatstaarttaetatstat InInvInevIInhevnihev-cvihelceeihlceihlceilcele ...

store S/PII

J. Petit et al.,"Revisiting Attacker Models for Smart Vehicles",WiVec'14.

41

PRIVACY VIOLATIONS

collect information about me, my car,
and my surroundings

location tracking, break forward secrecy

Sensor Data

Processing

In-vehicle
malware

Data at rest

Infrastructure
Data in transit
Meta Data

PProPirncoPirgnecoirPgnsecoignrssecogssecssesssing SDSeDSneaDSsnetaaDosnetaarosntaSarostDearonarstaor
DDareDtaraseDtaratseataratsetatDatstaarttaetatstat InInvInevIInhevnihev-cvihelceeihlceihlceilcele ...

store S/PII

J. Petit et al.,"Revisiting Attacker Models for Smart Vehicles",WiVec'14.

41

PRIVACY VIOLATIONS

collect information about me, my car,
and my surroundings

location tracking, break forward secrecy

Sensor Data

Processing

In-vehicle
malware

Data at rest

Infrastructure
Data in transit
Meta Data

PProPirncoPirgnecoirPgnsecoignrssecogssecssesssing SDSeDSneaDSsnetaaDosnetaarosntaSarostDearonarstaor
DDareDtaraseDtaratseataratsetatDatstaarttaetatstat InInvInevIInhevnihev-cvihelceeihlceihlceilcele ...

store S/PII privacy inferences

J. Petit et al.,"Revisiting Attacker Models for Smart Vehicles",WiVec'14.

41

TWENTE
WITBREUKSWEG

12 Waaier (WA) 13 Hal B (HB) 14 Teehuis (TH)

28 Zuidhorst (ZH)

49

30 Central Refuse Storage (AF) 51

31 Wind Park (WP)

56

AN
M
OUDE
64

CALSLAAN
CALSLAAN

S M
MATENWEG S

CAMPUSLAAN

65
HORSTLINDEWEG
M 64

63

62

S H

H 60

MATENWEG H

61

49

'T RITKE

59

LANGENKAMPWEG

58

CAMPUSLAAN

57

56

S

47 P

51 48

S PP
CAMPUSLAAN

44 PH
4

DRIENERLOLAAN

46

P 45

P 43
42

OUDE
39

H
DRIENERLOWEG

7

5

P

P1 41
DE ZUL

2
P
DRIENERBEEKLAAN

3 P
1

8

H

6

HORSTLINDELAAN

40
BOERDERIJWEG

P2

DE HORST

14 10
11 13
12
9

HALLENWEGP

89

17

15 18

H

STATION ENERLO

HENGELO

P 66

H
H HENGELOSE STRAAT
P 68

P 72

AUKE VLEERSTR

42

TWENTE
WITBREUKSWEG

12 Waaier (WA) 13 Hal B (HB) 14 Teehuis (TH)

28 Zuidhorst (ZH)

49

30 Central Refuse Storage (AF) 51

I c3a1 nWintdrPaarkc(WkP)you! 56

AN
M
OUDE
64

H S
M

59

LANGENKAMPWEG

I'm here! MATENWEG S

60

58

CAMPUSLAAN

57

I'mS h5e6 re!

CAMPUSLAAN

MATENWEG H

61

49

51 48 S

47 P

65
HORSTLINDEWEG
M 64

PP

44

PH

63

62

CAMPUSLAAN
4

CALSLAAN
CALSLAAN

S H

'T RITKE

3 2

P

P

DRIENERBEEKLAAN

DRIENERLOLAAN

46

P 45

I'm here! P 43 42

OUDE
39

H
DRIENERLOWEG

P1 41
DE ZUL

7

5

P

8

H

6

1

HORSTLINDELAAN

40
BOERDERIJWEG

P2

DE HORST

14 10
11 13
12
9

HALLENWEGP

89

17

15 18

H

STATION ENERLO

HENGELO

P 66

H
H HENGELOSE STRAAT
P 68

P 72

AUKE VLEERSTR

42

TWENTE
WITBREUKSWEG

12 Waaier (WA) 13 Hal B (HB) 14 Teehuis (TH)

28 Zuidhorst (ZH)

49

30 Central Refuse Storage (AF) 51

I c3a1 nWintdrPaarkc(WkP)you! 56

AN
M
OUDE
64

H S
M

59

LANGENKAMPWEG

MATENWEG S

I'm here! I'm here! CAMPUSLAAN

Attacker Model 65
HORSTLINDEWEG
- Mid-sized M 64

- Passive I'm here! 63

62

60

58

CAMPUSLAAN

57

56

S MATENWEG H

51 48

47 P

61

49

S

PP

44

PH

CAMPUSLAAN

4

46

P 45

P 43
42

OUDE
39

H
DRIENERLOWEG

P1 41
DE ZUL

CALSLAAN
CALSLAAN

DRIENERLOLAAN

S H

'T RITKE

- External

7

5

P

- Trip-level tra3 cking period 8 H

P

Road/2ZoneP-level trackin6 g

DRIENERBEEKLAAN

1

HORSTLINDELAAN

40
BOERDERIJWEG

P2

DE HORST

14 10
11 13
12
9

HALLENWEGP

89

17

15 18

H

STATION ENERLO

HENGELO

P 66

H
H HENGELOSE STRAAT
P 68

P 72

AUKE VLEERSTR

42

TWENTE
WITBREUKSWEG

12 Waaier (WA) 13 Hal B (HB) 14 Teehuis (TH)

28 Zuidhorst (ZH)

49

30 Central Refuse Storage (AF) 51

I c3a1 nWintdrPaarkc(WkP)you! 56

AN
M
OUDE
64

H S
M

59

LANGENKAMPWEG

MATENWEG S

I'm here! I'm here! CAMPUSLAAN

Attacker Model 65
HORSTLINDEWEG
- Mid-sized M 64

- Passive I'm here! 63

62

60

58

CAMPUSLAAN

57

56

S MATENWEG H

51 48

47 P

61

49

S

PP

44

PH

CAMPUSLAAN

4

46

P 45

P 43
42

OUDE
39

H
DRIENERLOWEG

P1 41
DE ZUL

CALSLAAN
CALSLAAN

DRIENERLOLAAN

S H

'T RITKE

- External

7

5

P

- Trip-level tra3 cking period 8 H

P

Road/2ZoneP-level trackin6 g

DRIENERBEEKLAAN

1

HORSTLINDELAAN

40
BOERDERIJWEG

P2

DE HORST

14 10
11 13
12
9

HALLENWEGP

89

17

15 18

H

STATION ENERLO

HENGELO

H

Let's

track

the

security H HENGELOSE STRAAT

guard

vehicle!

P 66

P 68

P 72

AUKE VLEERSTR

42

Where should an attacker deploy sniffing stations?
Intersections
43

Busiest intersections Highest degree
Articulation points
44

ZONE-LEVEL TRACKING
45

EXPERIMENTAL SETUP (1/4)
46

EXPERIMENTAL SETUP (1/4)
- Nexcom VTC6201 - Intel Atom D510 processor - Unex CM10-HI Mini-PCI 802.11 a/b/g module with custom drivers for 802.11p - 2 x MobileMark ECOM9-5500 (high gain 9dBi) 5.0-6.0 GHz antennas - one SMA connector for GPS - Ubuntu 12.04
46

EXPERIMENTAL SETUP (2/4)
47

EXPERIMENTAL SETUP (3/4)
48

EXPERIMENTAL SETUP (4/4)

Intersection A Ground floor 75 m from intersection 2 x Smarteq V09/54 antennas (9 dBi gain)

Intersection B 1st floor
110 m from intersection 2 x Smarteq V09/54 antennas (9 dBi gain)
49

Simple stats on data
The equipment was deployed for
16 days
during which the vehicle transmitted
2,734,691 messages
and we eavesdropped on
68,542 messages
50

51

Corresponds to 3.17% of all messages sent
Zone-level tracking: 72.82%
52

TRACKING ACCURACY (MLZ)
53

TRACKING ACCURACY (MLZ)
53

TRACKING ACCURACY (MLR)

Samples covered (%)

100

90

80

70

60

50

40

Maximum coverage

30

Mean coverage

20

10

0 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 Number of observed intersections

54

TRACKING ACCURACY (MLR)

Samples covered (%)

100

90

80

70

60

50

40

Maximum coverage

30

Mean coverage

20

10

0 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 Number of observed intersections

54

Can we tracking?
55

CANDIDATE SOLUTIONS
· Cloaking/Fuzzing location · Anonymous credentials · Encryption · Opt-out · Pseudonyms
56

IEEE and ETSI mention the need to "use a pseudonym that cannot be linked to [...] the user's true identity" and suggest to change it frequently "[...] to avoid simple correlation between the pseudonym and the vehicle"
57

TWENTE
WITBREUKSWEG

12 Waaier (WA) 13 Hal B (HB) 14 Teehuis (TH)

28 Zuidhorst (ZH)

49

30 Central Refuse Storage (AF) 51

31 Wind Park (WP)

56

AN
M
OUDE
64

CALSLAAN
CALSLAAN

S M
MATENWEG S

CAMPUSLAAN

65
HORSTLINDEWEG
M 64

63

62

S H

H 60

MATENWEG H

61

49

'T RITKE

59

LANGENKAMPWEG

58

CAMPUSLAAN

57

56

S

47 P

51 48

S PP
CAMPUSLAAN

44 PH
4

DRIENERLOLAAN

46

P 45

P 43
42

OUDE
39

H
DRIENERLOWEG

7

5

P

P1 41
DE ZUL

2
P
DRIENERBEEKLAAN

3 P
1

8

H

6

HORSTLINDELAAN

40
BOERDERIJWEG

P2

DE HORST

14 10
11 13
12
9

HALLENWEGP

89

17

15 18

H

STATION ENERLO

HENGELO

P 66

H
H HENGELOSE STRAAT
P 68

P 72

AUKE VLEERSTR

58

TWENTE

12 Waaier (WA)

28 Zuidhorst (ZH)

49

WITBREUKSWEG

13 Hal B (HB) 14 Teehuis (TH)

30 Central Refuse Storage (AF) 51

??? 31 Wind Park (WP)

56

H S
M

59

LANGENKAMPWEG

AN
M
OUDE
64

I'm here! MATENWEG S

60

58

CAMPUSLAAN

57

I'Sm 5h6 ere!

CAMPUSLAAN

MATENWEG H

61

49

51 48 S

47 P

65
HORSTLINDEWEG
M 64

PP

44

PH

63

62

CAMPUSLAAN
4

CALSLAAN
CALSLAAN

S H

'T RITKE

3 2

P

P

DRIENERBEEKLAAN

DRIENERLOLAAN

46

P 45

I'm here! P 43 42

OUDE
39

H
DRIENERLOWEG

P1 41
DE ZUL

7

5

P

8

H

6

1

HORSTLINDELAAN

40
BOERDERIJWEG

P2

DE HORST

14 10
11 13
12
9

HALLENWEGP

89

17

15 18

H

STATION ENERLO

HENGELO

P 66

H
H HENGELOSE STRAAT
P 68

P 72

AUKE VLEERSTR

58

PSEUDONYM LIFECYCLE ·

Pseudonymity in Vehicular Networks: A Survey

13

pseudonym issuance

top-level
CA

4. retain VIDpseudonym mapping

CA

PP

1. enroll vehicle

3. authenticate with VID 2. issue VID cert.

5. issue pseudonym certificates

pseudonym resolution
9. request pseudonym resolution
10. return identity information

law enforcement / resolution auth.
8. obtain pseudonym cert. to resolve

pseudonym revocation
11. revoke VID

Pi HSM

6. sign messages w/ pseudonym cert. attach pseudonym cert to message

Pk HSM

7. change active pseudonym / request new pseudonyms
pseudonym change

HSM Pj pseudonym use

J. Petit et al.,"Pseudonym Schemes in Vehicular Networks: A Survey", IEEE Communications Surveys & Tutorials, 2015. 59
Fig. 3. Pseudonym lifecycle for asymmetric pseudonym schemes.

Maximum Tracking Time Privacy Loss Function
60

MAXIMUM TRACKING TIME

Maximum tracking time (s)

2500 2000 1500 1000
500

start of trip 360s 300s 240s 180s 120s 60s every message

0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 Number of observed intersections
61

But we need to be careful

1s 5000s

5000s

The MTT might not give a true indication of privacy

62

PRIVACY LOSS FUNCTION
Pseudonym changes
Unobserved intersections
Time since observation
Total
63

EVOLUTION OF PRIVACY LEVEL
25
Time (minutes)
64

2 sniffing stations Pseudonym change every 5 min
65

8 sniffing stations Pseudonym change every 5 min
66

8 sniffing stations Pseudonym change every 5 min
Road-level tracking: 90%
66

PSEUDONYM CHANGE STRATEGIES
67

PSEUDONYM CHANGE STRATEGIES
67

COST MODEL

#observed intersection
1
2
8
Full campus

Cost () 500 1000 4000 10500

6000/km2
68

COST MODEL

#observed intersection
1
2
8
Full campus

Cost () 500 1000 4000 10500

6000/km2
Expect price drop! (Raspberry Pi or SDR: http://wime-project.net/)
68

For example
To get a maximum tracking time of 1000 seconds

Per trip

12x 6000

19x 9500

300 seconds

An attacker need 58% more resources
69

For example
To get the same privacy level from our flux function

No pseudonyms
8x 4000

12x 6000

300 seconds

An attacker need 50% more resources

70

CONCLUSION OF THE EXPERIMENT
· Everyone can deploy a surveillance system · Privacy cost model · Need additional studies on pseudonym change strategy
71

LARGE-SCALE SCENARIO
72

PRIVACY-PRESERVING ROAD NETWORK?
73

BLACK HAT SOUND BYTES.
1. Everyone can deploy a surveillance system to track connected vehicles. It is cheap and easy.
2. Countermeasures exist to mitigate the risk.
74

