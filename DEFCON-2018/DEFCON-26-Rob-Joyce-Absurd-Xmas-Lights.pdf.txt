Building Absurd Christmas Light Shows
Computer Controlled Lights

<Video of light show>

Basic Elements of a Light Show

· LEDs

· Power Supplies

· Waterproof cases · Cabling · Pixel Controllers

+Zip Ties.... Lots and lots of zip ties

· Sequencing Software

· Show Controller + Software

· FM Transmitter

Traditional Mini-Lights

LEDs used here
· 3 LEDS on 1 chip

Creating Colors
Red, Green, Blue LEDS combine to make colors
Additive Color

Additive Colors

"Smart" RGB at the core of the display

What makes them smart?

Pixels: WS-2812b serial protocol
· Simple protocol · Indefinite length strings* · Reshapes pulses at each pixel

Many form factors for LEDs

Customize: cut and solder

Custom Elements

Mega Trees
· Matrix made of Pixel Strings · Pictures, Animations, Effects · Low resolution · Example: 50x32 pixels, 14 feet tall · Dominate the scenery

Mega Tree

Flood Lights
· Round out the display · 10-30 Watts · "Color Wash" Walls & Trees

Ethernet Control of Pixels
· Streaming-ACN (E.131) Protocol · ACN- Industry standard suite of protocols for
lighting and control via Ethernet · Subset for "lightweight" devices called sACN (E1.31) · UDP: Unicast to a single IP or Multicast · Groups up to 512 channels in "Universes"

Controller
· Ethernet to pixels · Power and Fusing · Remapping · Testing Pixels · Good controllers have
web based interfaces

Running the show
· Dedicated computer · Starts lights on schedule · Streams data to controllers · Two popular options:
· Windows PC · FPP Falcon Player- Raspberry PI

Sequencing
· Light show events aligned to music · Millisecond control of lights · Apply effects across one or more elements · Computing complex visual patterns · Simulates the show without hardware
· Free and commercial sequences can be adapted

Raspberry Pi Pixel Driver
· Software library- Generate pixel serial data · GPIO pin 18 ­ direct drive · 3.3V data output · WS-2811/2812 pixels expect 5v · Works, but suboptimal

Raspberry Pi Pixel Driver
Better than direct drive: · Buffered outputs · 12V and 5V pixel options · Two strings of 800+ pixels · Bonus: real time clock

Buying Pixels
· Direct from China · "Pre-sales" ­ group buys · eBay and Amazon · Specialty Sellers
Consider form factor and voltage (5V/12V)

Matrix Displays
P10 Panels (10MM Pixels) Beaglebone Adapter ­ up to 64 P10 panels Raspberry Pi Adapter ­ up to 12 P10 panels

Software: FPP Falcon Player

Video of Matrix display

Water is the Enemy
· Buy weather rated lights · Clear Silicone Caulk to seal strip ends · Weatherproof connectors · Electrical enclosures:
· CG-2000 cable boxes · Tackle boxes · Ammo Cans
· Cooling can become an issue

Two challenges
· Voltage drop ­
· Can't push enough current through small wire · White colors shade to Pink · Solution: Voltage injection. Power at both ends of
string
· Distance to first pixel
· Signal corruption · Solution: "Null pixel" ­ reshapes signal.

Broadcasting
· Controller outputs audio · FM radio station for viewers · Find an open channel to avoid interference · https://radio-locator.com/ · Antenna makes a significant difference · Challenge: clear signal within FCC rules

Skills
· Soldering · Debugging · Planning · Logical thinking · Creative and artistic design · Attention to detail

[Video Clip of Xmas lights: Star Wars

Christmas Light Resources:
https://goo.gl/tJjNs4

