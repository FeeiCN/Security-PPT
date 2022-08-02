SESSION ID: SPO2-T10
Threat Modeling the Minecraft Way
#RSAC

Jarred White
Security Architect, VMware AirWatch
John Britton
Director, Product Marketing ­ EUC Security, VMware

Agenda
Why Minecraft? Environment Requirements Threat Profiles Building Blocks Threat Modeling
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC

#RSAC
Why Minecraft?
Capacity for creativity and expansion of ideas through direct environmental manipulation Consequences for "bad security" through poor design/implementation Encourages approaching problems from many dimensions Creates an intuitive awareness of security Mining!
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
Environment Requirements

Security
· Feeding yourself · Protecting
yourself/assets · Storage and shelter · Light

Performance
· Get around safely and quickly
· Shelters, travel paths, mining must be practical

User Experience
·Convenient access to resources ·Access to different biomes ·Free to explore

4
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

Security
Sweet, sweet diamonds
5
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC

#RSAC
Security
Food, farms, and livestock
6
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC

Security
Shelter, infrastructure, and worksites

7
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
Performance
Efficient transportation
8
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

User Experience
Permanency
9
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC

#RSAC
User Experience
Exploration
10
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
About our environment
Threats to survival
Monsters Lava Falling to your death Starving Getting lost Other players Hubris
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

Threat Profiles
Creepers

#RSAC
Properties: - Denial of service - Remote access

12
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
Threat Profiles
Skeletons
Properties: - Remote code execution - Race condition - Remote access
13
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

Threat Profiles
Zombies
Properties: - Buffer overflow - Remote access - Virus - Brute force
14
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC

#RSAC
Threat Profiles
Spiders
Properties: - Remote access - Backdoor
15
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

Building blocks
Blocks
Free-form construction using blocks of varying strengths/properties No physics implications for most blocks (exceptions: sand, gravel) Blocks resist explosion (from Creepers, TNT) as well as harvesting (e.g., with a pick axe) Some blocks make better building materials than others Also wear tools at faster rates when harvesting
Fencing/gates
Wood, stone Stackable
Used for perimeter security, slowing down attackers
Skeletons can shoot over! Spiders can crawl over!
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC

#RSAC
Building blocks
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
Building Blocks

Dirt

Sand

Gravel

Wood Sandstone Cobblestone Stone

Stone Brick

Obsidian

Organized by relative resistance to explosion/mining Good structural materials: Cobblestone, Stone, Stone Brick Varying degree of difficulty to harvest
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
Threat Modeling
Architecture
Subhead if needed

#RSAC
20
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
21
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
22
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
23
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
24
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
25
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
26
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
You are here
27
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
1 every 5 blocks gridded out
28
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
29
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
Threat Modeling
Storage
Subhead if needed

#RSAC
Hiiiiiiiiiiii!
31
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
32
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
33
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

34
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
3rd level 2nd level Ground

#RSAC
35
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
36
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
Threat Modeling
Transport
Subhead if needed

#RSAC
38
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
39
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
40
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC

41
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

20 blocks

#RSAC
42
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC
43
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

Threat Modeling
Observations Lighting vulnerabilities are easy to overlook and very costly from a security standpoint
e.g., Creeper spawning in a dark corner Layered approach is useful for reducing threats but does not permanently eliminate
Perimeter landscaping and fencing/walling Easy to miss landscaping vulnerabilities Few "single solutions" to all attack types We covered 4/15 monsters and 1/2 "worlds" Efficiency + Security is expensive Railroad materials: Gold, iron, redstone, wood, stone Can exchange food for these properties in some circumstances Defenses centered around monsters only ­ not other players! Obfuscation comes into play

#RSAC

Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

Challenge
Go play Minecraft! Get a group together Cheap server requirements Set some goals
Functional rail system Parliament Automated foundry Giant mobile phone Who cares?! Now work toward the goals (you know, just play the game) You'll experience all the scenarios we discussed first-hand (and more) Limit yourself by not using cheats/admin hacks Consider adding a "DM" to make things interesting Change conditions on the fly Introduce attackers
Copyright © 2014 AirWatch, LLC. All rights reserved. Proprietary & Confidential.

#RSAC

