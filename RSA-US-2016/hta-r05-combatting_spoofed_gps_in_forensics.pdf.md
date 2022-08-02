SESSION ID: HTA-R05
Combatting Spoofed GPS in Forensics
#RSAC

Bobby Kuzma, CISSP, CCFP
Systems Engineer Core Security Technologies @BobbyAtCore

#RSAC
GPS becomes critical...
2

#RSAC
GPS becomes critical...
3

#RSAC
GPS becomes critical...
4

#RSAC
GPS becomes critical...
5

#RSAC
GPS becomes critical...
6

#RSAC
GPS becomes critical...
7

#RSAC
GPS spoofing evolves from this...
8

#RSAC
GPS spoofing old style
Complex Difficult to acquire Expensive
9

#RSAC
Into this...
10

#RSAC
GPS spoofing new style
Not Quite as Complex Easy to acquire Inexpensive
11

#RSAC
What we'll be talking about
How GPS (and BeiDou, Galileo, GLONASS, and IRNSS) works Avenues for spoofing attacks How GPS can be spoofed Methodologies for detecting spoofed tracks
12

#RSAC
Let's start with why!
This has potential real world impact New technologies are fun I get bored very easily
13

#RSAC
But first, a demo...
What: I'll be broadcasting a spoofed GPS signal to the equipment onstage. Why: So we have something to analyze later Also: This takes a few minutes, and is boring to watch. WARNING: If you don't want to participate, disable GPS on your phones NOW.
14

#RSAC
How GNSS systems work
15

#RSAC
How GNSS systems work
16

#RSAC
How GNSS systems work
17

#RSAC
GNSS gives us
Spatial positioning in three dimensions Temporal positioning in a single dimension.
18

#RSAC
Attacks abound
GPS is vulnerable to attacks impacting both positioning and timing.
19

#RSAC
Attacks on location
Navigation systems Location systems (like monitoring systems for probation) False location histories Security interlocks (drones, etc)
20

#RSAC
Attacks on time
Industrial controls Time lock safes Authoritative Time Attacks
21

#RSAC
What do you need to spoof GPS
Ephemeris Data for the time you're spoofing A track to lay down Lots of math Relativity matters!
22

#RSAC
Take GPS track data
23

#RSAC
Now, about that demo
I'll capture the track that we've been laying down
24

#RSAC
My thought process
The real world is full of random... stuff We could resort to complex math... but I'm bad at math So we look at simple techniques... And some of them work!
25

#RSAC
Noise and spatial "jitter"
Straight lines... aren't Calculate the average distance from the line.
26

#RSAC
Noise and spatial "jitter"
Errors caused by multipath, ephemeris data errors, weather, interference, solar conditions add up. Testing shows lower amounts of "jitter" when spoofed GPS tracks are reviewed This is due to the reduction of outside factors impacting the signal.
27

#RSAC
Velocity profiling
Tracks give you a relatively low resolution sampling of position. Unusually regular velocities are an indicator of spoofing
28

#RSAC
Velocity
Radically different velocity profiles yield similar track results
29

#RSAC
Secondary data
Some devices support wifi Check for artifacts of seen wifi networks Compare to Wifi Geolocation Databases like Mozilla Location Service and WiGLE
30

#RSAC
The State of Things
Only "civilian" GPS systems are susceptible (right now) No commercial solutions using spoofing detection! Lots of academic work on detecting spoofing in real-time...
"GPS Spoofing Detection via Dual-Receiver Correlation of Military Signals", Psiaki Et Al (2011)
This is new ground... plenty of opportunities for research
31

#RSAC
Next steps and further research
Profile position jitter on more devices Integrate with GIS and traffic datasources to identify discrepancies Look into Jitter-detection from Optics Test additional spoofing methods
32

#RSAC
ANALYSIS SCRIPT DEMO
33

#RSAC
"Apply"
Review your protocols for processing GPS track evidence Build a workflow for automatically calculating key parameters Seek corroborative evidence, always!
34

#RSAC
Any Questions?
bkuzmacissp@gmail.com @BobbyAtCore
35

