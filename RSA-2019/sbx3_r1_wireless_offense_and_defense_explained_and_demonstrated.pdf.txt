SESSION ID: SBX3-R1
Wireless Offense and Defense, Explained and Demonstrated!

Rick Mellendick
Chief Security Officer Process Improvement Achievers, LLC @rmellendick

Rick Farina
Senior Product Line Manager Aruba @Zero_ChaosX

#RSAC

#RSAC
who are we
Rick is the Chief Security Officer for PI Achievers, a process improvement and security firm in Baltimore, Maryland and the developer of the Cyber Resiliency Assessment Methodology (CRAM). Rick specializes in designing and assessing networks using offensive techniques to assist in securing our client's networks.
2

#RSAC
who are we
Rick is a well-known wireless expert who is a frequent speaker at a variety of security conferences including DEF CON. He also runs Wireless Capture the Flag at numerous conventions.
3

#RSAC
who is the wireless village
Twitter: @Wifi_village and @WCTF_US Blog: https://wirelessctf.blogspot.com/ Discord: https://discordapp.com/invite/JjPQhKy
4

#RSAC
*******************DISCLAIMER******************
5

#RSAC
use pentoo
6

Wireless and Offense Defense Steps to perform both

802.11 WiFi
What everyone else calls Wireless

Kismet

Airodump-ng

#RSAC
today we are going to look at 2 wifi tools for enumeration
10

Bluetooth

#RSAC
bluetooth connections
Why can't we just easily deauth, or work with Bluetooth like we do with WiFi?
13

#RSAC
internal vs UD100 vs ubertoothone
14

#RSAC
finding and tracking
Let's just write security on the slide but talk about other things
15

external enumeration of internal spaces

What if you could see inside buildings

Following a car based on a number?

How many devices does a single person use?

Enumerating the WiFi and probes

Tracking a stranger based on a MAC address?

Finding the target wherever they are

16

#RSAC

blue_hydra
https://github.com/ZeroChaos-/blue_hydra

#RSAC
initial bluetooth enumeration
18

#RSAC
blue_hydra fox mode
This will stop the info response which will make the tool much faster on the refresh...
sudo blue_hydra ­no-info
19

#RSAC
blue_hydra changing the bluetooth adapter
20

#RSAC
change the filters for blue_hydra nano /etc/blue_hydra/blue_hydra.yml
21

#RSAC
blue_hydra database backend
22

#RSAC
blue_hydra database backend
23

Demonstration!

blue_sonar https://github.com/ZeroChaos-/blue_sonar

#RSAC
using layer 2

Bluetooth is so prevalent, and
Bluetooth Classic is on all phones as we
will show!

This can be used for
tracking if the Layer 2 (MAC
address) is known!

26

Demonstration!

#RSAC
so i was driving down the road
Where does this tool makes sense?

Who could benefit
from this?
28

When could this be useful at work?

MouseJack

#RSAC
mousejack
MouseJack is a class of vulnerabilities that affects most wireless, nonBluetooth keyboards and mice. An attacker can launch the attack from up to 100 meters away.
*Thanks for the amazing research Bastille
30

#RSAC
mousejack implemented in pentoo
31

#RSAC
jackit running in pentoo
32

#RSAC
attacking and enumeration with jackit
33

Demonstration!

Software Defined Radio ( SDR)

#RSAC
10 MHz to 6 GHz spectrum
36

#RSAC
fosphor_knob in Pentoo
37

Demonstration!

#RSAC
external enumeration of internal spaces
39

Questions?

Rick Mellendick PIAchievers, LLC @rmellendick

Rick Farina Aruba @Zero_ChaosX

