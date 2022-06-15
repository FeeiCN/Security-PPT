A universal controller to take over a Z-Wave network

A universal controller to take over a Z-Wave network
Loïc Rouch loic.rouch@inria.fr Frédéric Beck, Jérôme François, Abdelkader Lahmadi
2

Z-What?
Sigma Designs Based on ITU-T G.9959 standard
Low energy ~50m range Meshed network, Auto discovery Uses ISM radio bands (Industrial, Scientific and Medical)
Since 2013 : Z-Wave+ Added a secure mode
3

unsecure vs secure mode

 Based on a unique identifier (HomeID)
 Security by obscurity
 No ciphering

 Ciphered communications, BUT
 Not supported by every devices
 Not enabled by default
 Requires a specific action to activate it
 Insufficient information for consumers

4

Z-Wave network
5

HomeID and nodeID

HomeID : 32 bits  4 billions of possibilities nodeID : 8 bits  256 possibilities

HomeID : 1EC3D367 nodeID : 1

HomeID : ­ nodeID : 0

7

Association/Pairing
8

Auto discovery, NIF
4 Basic Device Classes ~20 Generic Device Classes ~70 Specific Device Classes ~100 Command Classes
9

Association/Pairing

HomeID : 1EC3D367 nodeID : 1

HomeID : ­ nodeID : 0

HomeID : 1EC3D367 nodeID : 1

HomeID : 1EC3D367 nodeID : 2

Necessary step to communicate with a device/node
10

Existing work
 Complex attacks  Operation hazard
­ Unclear instructions for reproductibility ­ Uncontrolled environment (hard to debug) ­ Complex analysis, many things to consider ­ Proprietary and closed protocol (until recently)  Requires specific hardware expensive, difficult to use, to maintain
11

Goal : simplify, improve reliability
 Avoid specific hardware  Take full advantage of official hardware
certified by the Z-Wave Alliance  Focus on unsecured mode
12

Central point : the HomeID
Unique Set during controller manufacturing Randomly modified when controller is re-initialized Not editable by hand
13

Central point : the HomeID
Unique Set during controller manufacturing Randomly modified when controller is re-initialized Not editable by hand
14

First things first Get the HomeID
15

Get the HomeID
Software Defined Radio to the rescue!
16

Get the HomeID
https://github.com/baol/waving-z $ rtl_sdr -f 868420000 -s 2000000 -g 25 - | ./wave-in -u
17

Get the HomeID
https://github.com/baol/waving-z $ rtl_sdr -f 868420000 -s 2000000 -g 25 - | ./wave-in -u
18

Set the HomeID in your controller
19

Set the HomeID in your controller
Exploiting the backup/restore feature
20

Backup/Restore feature
Archive containing the entire configuration of the controller
$ tar -xvzf z-way-backup-2017-11-22-18-40.bzk zddx/e13c2c99-DevicesData.xml Rules.xml Defaults.xml maps/.keep maps/1.jps maps/
Including the HomeID
<data name="homeId" invalidateTime="1511371990" updateTime="1511371991" type="int" value="-516150119"/>
 modify and restore
21

Backup/Restore feature
 Modifies HomeID  Removes every registered nodes  Tedious and long process  Have to use Z-Way Server
22

Directly change the HomeID
Watching Z-Way Server
HomeID modification command
23

Directly change the HomeID
 Modifies the HomeID  Keep all registered nodes  Simple and fast process  Doesn't require any specific software  Universal controller (all nodes pre-registered)
24

Reminders
Controller transmission limited to registered nodes Association/Pairing mandatory to add a node Registered node  Controlled node Nodes polling at startup (Auto discovery)
25

Filling with nodes
 Use a device to fill in the controller (e.g : Z-Wave outlet)
 Include node (1 node in memory) Reset node
 Include node (2 nodes in memory) Reset node
 ... 232 times
26

Target network discovery
27

Attack steps
Listening

1EC3D367

1EC3D367 1EC3D367

Target

Attacker
28

Attack steps
Changing HomeID
1EC3D367
Target

1EC3D367
Attacker
29

Attack steps
Scan/Discovery and target network takeover

1EC3D367

1EC3D367

Target

Attacker
30

Conclusion
 Created a universal controller!  Innovative, simple attack  Low cost
 35 Z-Wave controller  30 DVB-T tuner
31

Takeaways
 In-depth understanding of Z-Wave protocol  How to build a universal Z-Wave controller
from a mainstream device  How to take over a Z-Wave network with
the universal controller (detailed steps)
32

