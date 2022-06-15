SESSION ID: TECH-T09
Smart Megalopolises. How Safe and Reliable Is Your Data?
RSAC

Denis Legezo
Global Research and Analytics Team, Kaspersky Lab

#RSAC
Megalopolises are changing fast
2

#RSAC
The plan for today
 Smart cities: Sensors' role  Reconnaisance: Vendors, locations, etc.  Sensors' functionality: Interfaces and data  Firmware: The Holy Grail of embedded  Automation: Let's send some bytes  Smart cities: Outside sensors
3

#RSAC
Why cities need all this stuff?
 Smart cities: Sensors' role  Reconnaisance: Vendors, locations, etc.  Sensors' functionality: Interfaces and data  Firmware: The Holy Grail of embedded  Automation: Let's send some bytes  Smart cities: Outside sensors
4

Why cities have be smart?

#RSAC
 Investments  Staff  Infrastructure  Data centers  Operation center

5

#RSAC
Raw data for planning
6

#RSAC
...And for traffic management
 Possible to use for the traffic lights
 Counting vehicles number and change timings
 Counting pedestrians as well
7

#RSAC
Radars are the source of such data
8

#RSAC
The first phase
 Smart cities: Sensors' role  Reconnaisance: Vendors, locations, etc.  Sensors' functionality: Interfaces and data  Firmware: The Holy Grail of embedded  Automation: Let's send some bytes  Smart cities: Outside sensors
9

#RSAC
Appearance is a great help
10

..Any IDs you can get are also

#RSAC
 MACs  Names  Any IDs

11

#RSAC
What we are gathering?
 Smart cities: Sensors' role  Reconnaisance: Vendors, locations, etc.  Sensors' functionality: Interfaces and data  Firmware: The Holy Grail of embedded  Automation: Let's send some bytes  Smart cities: Outside sensors
12

#RSAC
Look, interfaces
13

#RSAC
And a lots of data on-board
14

What's inside the data?

#RSAC
 Vehicle type  Number of vehicles  Median speed  Station occupancy

15

#RSAC
The Holy Grail
 Smart cities: Sensors' role  Reconnaisance: Vendors, locations, etc.  Sensors' functionality: Interfaces and data  Firmware: The Holy Grail of embedded  Automation: Let's send some bytes  Smart cities: Outside sensors
16

#RSAC
Can we add some functions?
 Through interface  Debugger?  Commands?  What is format?
17

#RSAC
Format looks like iHex or SREC
18

#RSAC
But for which controller is it?
19

#RSAC
LinkedIn isn't only for HR
20

#RSAC
..but it happens anyway
 For me in a blackbox mode it looks like dead end  But does it means dead end at all?  Of course not!
21

#RSAC
Even with the stock firmware..
 Smart cities: Sensors' role  Reconnaisance: Vendors, locations, etc.  Sensors' functionality: Interfaces and data  Firmware: The Holy Grail of embedded  Automation: Let's send some bytes  Smart cities: Outside sensors
22

#RSAC
Reconnaissance first
 I started with script + C  Bluetooth tools  adb to get GPS from phone  C code for sending  What to send?
23

#RSAC
Commands are partly known
24

#RSAC
So we can automate
25

#RSAC
Sensor will answer
26

#RSAC
What about the small DDoS?
 Driving by, changing settings  Time: all traffic at night  Types: all traffic trucks
27

#RSAC
Python + PostgreSQL seems better
28

#RSAC
Resolve vendor and address offline
29

#RSAC
What to do further and else?
 Smart cities: Sensors' role  Reconnaisance: Vendors, locations, etc.  Sensors' functionality: Interfaces and data  Firmware: The Holy Grail of embedded  Automation: Let's send some bytes  Smart cities: Outside sensors
30

#RSAC
Side effects
 Gather Wi-Fi data and filter it with Postgres views  MACs can be anonymous  WEP is still alive
31

#RSAC
Where is always place for fuzzing
 Where are undocumented commands
32

#RSAC
So much other stuff
33

#RSAC
...even speeding penalties
 Smart cities security perimeter if huge
 So is the surface of attacks  Different authorities are in
charge of the infrastructure
34

#RSAC
...And tools
35

#RSAC
What to apply?
Change appearance and default names Don't rely only on standard authentication Cooperate with third-party researches Think a little bit like malefactor or hire someone who can I know embedded devices vendors with generous bug bounty program. Respect Cities also could participate
36

#RSAC
Summary
Smart city infrastructure is visible due to ID Kudos to vendor, firmware is strong Automation is possible with change of any settings Interesting side effects with wireless protocols Go further!
37

#RSAC
Denis Legezo
Denis.Legezo@kaspersky.com

