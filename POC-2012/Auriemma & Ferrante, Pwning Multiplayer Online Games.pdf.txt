0wning Multiplayer Online Games
(POC 2012 - Seoul)
Luigi Auriemma & Donato Ferrante

Who are we?
Luigi Auriemma (luigi@revuln.com /@luigi_auriemma) Co-Founder and Security Researcher at ReVuln Ltd.

Donato Ferrante (donato@revuln.com /@dntbug) Co-Founder and Security Researcher at ReVuln Ltd.
Daily-job
· breaking software and hardware · hunting for 0days.. · managing revuln.com

ReVuln Ltd. - revuln.com

2

Agenda
 Introduction  Why attacking games?  Attack Scenarios  The Market  Warm-up
 How to find vulnerabilities in video games  Hands On Bug Hunting (demo)  Welcome to the Real World
 Call Of Duty: Black Ops  Something Unreal  Team chat? Teamspeak  Game protection? Punkbuster  Exploiting the Source (Engine) 0day time (demo)  Call Of Duty: Modern Warfare 3 (0day)  There is some Crysis (0day)  What about the future?  Conclusion

ReVuln Ltd. - revuln.com

3

Introduction
 Multiplayer games are an underestimated field
 Some numbers:  #Multiplayer games: 1 + .. + 99 + 1 + .. + 1  #Multiplayer game players: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811...
 Is this an interesting attack vector?

ReVuln Ltd. - revuln.com

4

Why attacking Games?

ReVuln Ltd. - revuln.com

5

Why attacking Games? (1/2)
Who wants to attack your GAME ?

Script Kiddies They like running tools made by others, without even knowing
how to use them..

Others..

Your room-mate he doesn't like you wasting
bandwidth

ReVuln Ltd. - revuln.com

6

Why attacking Games? (2/2)
Who wants to attack your Company server ?

Script Kiddies They are everywhere..

Others.. Their target can be one of your
players playing on your company server, do you know how many people play online games nowadays ??

ReVuln Ltd. - revuln.com

Your competitors the more you are bad, the more they are good
7

Scenarios

Never feel safe while playing online...

ReVuln Ltd. - revuln.com

8

Scenarios (1/2)

Client-side

(1-n)

Player

Victim

Server

Player

1. Get user IP..

Attacker

2. Profit..

ReVuln Ltd. - revuln.com

9

Player Player Attacker

Scenarios (2/2)

Server-side
(1-1-n) Users DB

Server

- User pwd - Privacy risks..

- Get a shell.. - or load a
custom payload

Store DB

- Transactions - so... $$$
ReVuln Ltd. - revuln.com

Other.. Next "level"...
10

The Market

I heard you need expl0its..

ReVuln Ltd. - revuln.com

11

The Market (1)
 Yes, there is a market for games vulnerabilities  They buy exploits for a fair amount of money  They ask for new 0day..

What about trying to spot some vulnerabilities for fun/Pr0fit ?

ReVuln Ltd. - revuln.com

12

Warm-up

Things to know to start hunting for vulnerabilities in video games

ReVuln Ltd. - revuln.com

13

Warm-up (1/7)
A GEnErIC wAlktHrouGH...
Game Sniffer Debugger Some brainwork..

ReVuln Ltd. - revuln.com

14

Warm-up (2/7)

Games are not an easy target, as it may seem..

Binary protections

more..

ReVuln Ltd. - revuln.com

15

Warm-up (3/7)

SomE poIntS oF IntErESt...
Communication:
 recv  send  recvfrom  sendto  Connect  WSARecv  WSASend  WSARecvFrom  WSASendTo  more..

Cryptography:  known numbers  signatures  more..

ReVuln Ltd. - revuln.com

16

Warm-up (4/7)

Custom-protoColS...
 90% of "big" multiplayer games goes over UDP  not a simple UDP, but a reimplementation of TCP over UDP  plus some anti-lag mechanisms (players don't like lag..)  plus additional stuff..
We must be able to understand which part is useful, and which part is not

DATA

TCP_STUFF ANTI_LAG

???

Being able to analyze packets on the fly helps...

ReVuln Ltd. - revuln.com

17

Warm-up (5/7)
Sniffers..
Logging network traffic, without Wireshark, but with a proxy DLL:  lighter  and scriptable (via LUA, Python or Ruby..)

ReVuln Ltd. - revuln.com

18

Warm-up (6/7)
DebuGGING the rECv'D buffer..
It's common for commercial games to use encryption/compression algorithms,
we usually need to reverse them to reach the core..

ReVuln Ltd. - revuln.com

19

Warm-up (7/7)
.. And The opcodes processinG

The Most Interesting Part..

ReVuln Ltd. - revuln.com

20

Hands On Bug Hunting (D)

DEMO

ReVuln Ltd. - revuln.com

21

Welcome to the Real World

ReVuln Ltd. - revuln.com

22

Welcome to the Real World
(1/15)
 Call Of Duty: Black Ops (remote memory disclosure)
 Unreal (remote code execution)
 Teamspeak (admin commands without admin permissions)
 Punkbuster (exploiting a protection to get an attack vector)
 Source Engine (fragments memory corruption, file upload and format string)

ReVuln Ltd. - revuln.com

23

Welcome to the Real World
(2/15)
Call Of Duty: Black Ops (remote memory disclosure) 1/3
Call of Duty Black Ops is a game from the CoD series.

BUG: When the server receives an rcon packet (opcode 0x00) it replies with a packet having a fixed size of 1168 bytes, and it doesn't matter if its content is smaller.
The result is that various parts of the server's memory are disclosed remotely to anyone sending various invalid rcon packets. So an attacker can retrieve:
 rcon passwords (via cvars)  logs (rcon info)  client IPs ...

ReVuln Ltd. - revuln.com

24

Welcome to the Real World
(3/15)
Call Of Duty: Black Ops (remote memory disclosure) 2/3

Player 1
Player n

loGS/Ip/pASSworDS...

Server
ReVuln Ltd. - revuln.com

Attacker
while(1) {
send_rcon(); p = recv_mem(); print_mem(p); }
25

Welcome to the Real World
(4/15)
Call Of Duty: Black Ops (remote memory disclosure) 3/3

ReVuln Ltd. - revuln.com

26

Welcome to the Real World
(5/15)
Something Unreal (RCE) 1/2
These vulnerabilities target a game engine (http://unreal.epicgames.com)

Vulnerable games:
 DeusEx  Devastation  Mobile Forces  Nerf Arena Blast  Postal 2  Rune  Tactical Ops  TNN Pro Hunter  Unreal 1  Unreal II XMP  Unreal Tournament  Unreal Tournament 2003  Unreal Tournament 2004  and other...

BUG: Almost all the games based on the Unreal engine support the "secure" query. This type of query is part of the so called Gamespy query protocol.
The query is a simple UDP packet like \secure\ABCDEF
If an attacker uses a long value in his secure query, the server engine will overwrite some memory locations.
Both remote code execution and spoofing are possible.

ReVuln Ltd. - revuln.com

27

Welcome to the Real World
(6/15)
Something Unreal (RCE) 2/2
The proof-of-concept: 1 UDP packet to the query port of the game server:
\secure\aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa...aaaa
A nice old school overflow...

ReVuln Ltd. - revuln.com

28

Welcome to the Real World
(7/15)
Team chat? Teamspeak! (admin privs) 1/2
TeamSpeak 3 is a version of one of the most popular VOIP software intended mainly for gamers.
BUG: execution of various admin commands. The commands available are exactly those described in the TeamSpeak 3 ServerQuery Manual.

ReVuln Ltd. - revuln.com

29

Welcome to the Real World
(8/15)
Team chat? Teamspeak! (admin privs) 2/2

Legit
Hello! User
1

TS Server

Ciao!

Legit User

n

<disconnect clients>

WTF!? Legit rst

TS

User

Server

1

rst

?!WTF

Legit User

n

BEForE...

...AFtEr

ReVuln Ltd. - revuln.com

30

Welcome to the Real World
(9/15)
Game protection? Punkbuster! (as attack vector) 1/2
PunkBuster is a loved/hated anti-cheat system developed by Even Balance (www.evenbalance.com) and officially used in many diffused games like America's Army, Battlefield 1942/Vietnam/II, Call of Duty, Doom 3 and almost all the games based on the Quake 3 engine.

 Format string versus games using PunkBuster:  Soldier of Fortune 2  Quake 4  Doom 3  PREY  others

ReVuln Ltd. - revuln.com

31

Welcome to the Real World
(10/15)
Game protection? Punkbuster! (as attack vector) 2/2

Attacker

Attacker

Punkbuster Engine Vulnerable Code

ReVuln Ltd. - revuln.com

32

Welcome to the Real World
(11/15)
Exploiting the Source [Engine] (intro) 1/4
The Source engine is a rewrite of the original Half-Life engine developed by Valve (www.valvesoftware.com). It's the engine used for games like Half-Life 2, Counter Strike Source, Team Fortress 2, Left 4 Dead and various others which are also the most played internet multiplayer games with over 10000 online servers.
 Fragments memory corruption  File uploading

ReVuln Ltd. - revuln.com

33

Welcome to the Real World
(12/15)
Exploiting the Source [Engine] (fragment mem. corr.) 2/4
Source engine implements a complex method for handling fragmented packets.
A small heap buffer is assigned to contain the entire packet, and the client can decide arbitrarily the offset for placing the new fragment in a certain range bigger than the available memory.
The memory assigned to handle the packet can be in the range [0, 0x3ffff00] and the maximum amount of data that can be contained in a packet (fragment) is: 0x700.

fragment_data size = 0x700
0

0x3ffff00

ReVuln Ltd. - revuln.com

34

Welcome to the Real World
(13/15)

Exploiting the Source [Engine] (fragment mem. corr.) 3/4

\x41\x41\x41...

Server Memory..

0x1337

A way to expl0iT:

Server

 Locate a function pointer

 Override the pointer address

Fragment_REQ = [

 Pr0fit..

"\x41\x41\x41...\x41", ; DATA

0x1337 ; memory offset

Client

]

1

ReVuln Ltd. - revuln.com

35

Welcome to the Real World
(14/15)
Exploiting the Source [Engine] (file uploading) 4/4
By default the Source engine allows downloading and uploading files.
While the download operation is denied if there is a slash or a ".." or an unsupported extension in the requested file, for the upload operation there are just no checks.
Interesting related bug: If the name of the file to upload contains a slash or backslash at its end, like "c:\file.txt/" or "c:\file.txt\", a folder with such name will be created, and in case the file with the provided name exists it will be deleted.
What happens if you remove some windows file ?

ReVuln Ltd. - revuln.com

36

Welcome to the Real World
(15/15)
Some game-specific vulnerabilities..
 Map loading attack:  Interesting because they have a lot of complex functions..
Fake-players attack:  Consists of sending several "zombies" in a game, avoiding legit players to join the match, because the server will be full..

 DOS FORWARD via Server:  Usually anonymous (1 UDP packet) and the server will forward the "attacker" request to any connected clients..

ReVuln Ltd. - revuln.com

37

0day time

ReVuln Ltd. - revuln.com

38

0day time (1/2) (D)

DEMO

ReVuln Ltd. - revuln.com

39

0day time (2/2) (D)
DEMO

ReVuln Ltd. - revuln.com

40

Post-0day thoughts

ReVuln Ltd. - revuln.com

41

What about the future?
Simple: MMOG / MMORPG / and all the variations of MMO...

Server-side risks:
 You don't have (99%) a local server for testing, legal problems if you crash an online server
Client-side risks:
 If they spot (via anti-cheating) your testing, your account will be banned..

ReVuln Ltd. - revuln.com

42

Conclusion

 Games are no longer for kids..  Multiplayer games are getting more complex
 remember: more complex = more security concerns  Games are an exceptional stealth attack vector due to their low visibility
 Playing Online != Safe
Multiplayer games are the next step for offensive security.

ReVuln Ltd. - revuln.com

43

More?
If you like this topic, and you want more
information or consulting:

info@revuln.com

ReVuln Ltd. - revuln.com

44

Thanks!
Questions ?

Web: revuln.com / Info: info@revuln.com / Twitter: @revuln

ReVuln Ltd. - revuln.com

45

