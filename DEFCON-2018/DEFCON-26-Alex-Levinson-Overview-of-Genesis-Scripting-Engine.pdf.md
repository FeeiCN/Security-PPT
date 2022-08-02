I'LL SEE YOUR MISSLE AND RAISE YOU A MIRV:
DEFCON 26

AGENDA
01 02 03 04

PRESENTERS

STAGERS, CCDC, & HISTORY

Exploit Payload
Dropper

Trampoline Malware(s)

Meterpreter

Empire

Pupy

3rd party crimeware.

As a form of "packing"

Context aware implant solutions

Professional offensive engagements (CCDC)

Moved our tool chain to a golang, known as Gooby. This included a golang dropper experiment to abstract dropping from the other cluster bomb tools, known as Genesis.
Genesis Scripting Engine development started in late 2017 to prepare for the 2018 CCDC season. We ended up using the BETA
version at WRCCDC and NCCDC in 2018.
Now we're ready to release a re-written, shiny new V1.0 version to you today!

PRESENTING THE GENESIS SCRIPTING ENGINE

GSCRIPT

ENGINE COMPILER OBFUSCATOR

STANDARD LIBRARY COMMAND LINE TOOL (CLI) DEBUGGER

BASIC EXAMPLE: EMBED A PAYLOAD AND
WRITE TO A FILE

1) Write a gscript

10:00 ­ 11:00 AM
WELCOME MESSAGE
Investment generally results in acquiring an asset, also called an investment. If the asset is available at a price worth investing, normally expected either to generate income, or to appreciate in value
11:00 ­ 12:00 PM
ABOUT US
Investment generally results in acquiring an asset, also called an investment. If the asset is available at a price worth investing, normally expected either to generate income, or to appreciate in value
12:00 ­ 01:00 PM
MEET THE TEAM
Investment generally results in acquiring an asset, also called an investment. If the asset is available at a price worth investing, normally expected either to generate income, or to appreciate in value
01:00 ­ 02:00 PM
OUR PORTFOLIO
Investment generally results in acquiring an asset, also called an investment. If the asset is available at a price worth investing, normally expected either to generate income, or to appreciate in value

1) Write a gscript

10:00 ­ 11:00 AM
WELCOME MESSAGE
Investment generally results in acquiring an asset, also called an investment. If the asset is available at a price worth investing, normally expected either to generate income, or to appreciate in value
11:00 ­ 12:00 PM
ABOUT US
Investment generally results in acquiring an asset, also called an investment. If the asset is available at a price worth investing, normally expected either to generate income, or to appreciate in value
12:00 ­ 01:00 PM
MEET THE TEAM
Investment generally results in acquiring an asset, also called an investment. If the asset is available at a price worth investing, normally expected either to generate income, or to appreciate in value
01:00 ­ 02:00 PM
OUR PORTFOLIO
Investment generally results in acquiring an asset, also called an investment. If the asset is available at a price worth investing, normally expected either to generate income, or to appreciate in value

1) Write a gscript 2) Write another

10:00 ­ 11:00 AM
WELCOME MESSAGE
Investment generally results in acquiring an asset, also called an investment. If the asset is available at a price worth investing, normally expected either to generate income, or to appreciate in value
11:00 ­ 12:00 PM
ABOUT US
Investment generally results in acquiring an asset, also called an investment. If the asset is available at a price worth investing, normally expected either to generate income, or to appreciate in value
12:00 ­ 01:00 PM
MEET THE TEAM
Investment generally results in acquiring an asset, also called an investment. If the asset is available at a price worth investing, normally expected either to generate income, or to appreciate in value
01:00 ­ 02:00 PM
OUR PORTFOLIO
Investment generally results in acquiring an asset, also called an investment. If the asset is available at a price worth investing, normally expected either to generate income, or to appreciate in value

1) Write a gscript 2) Write another 3) Compile using CLI

gscript compile --output-file /tmp/opt/ex1/dropper.bin *.gs

1) Write a gscript 2) Write another 3) Compile using CLI 4) That's it!!! Run it!!!

1) Write a gscript 2) Write another 3) Compile using CLI 4) That's it!!! Run it!!!

WAIT, WUT? PLEASE EXPLAIN.

01 02
main()
03 04

GSCRIPT

main()

Initialize JS Virtual Machine
The first thing the engine does is create the V8 virtual machine and prepare it for injection.
Inject Bundle (Script/Assets/Libs)
Native function interfaces are injected into mock JS objects. Asset table mapped, and script loaded.
Call Entry Point In VM
Finally, the script's "entry point" is called. In GSCRIPT, this is the Deploy() function defined in your script.

GSCRIPT COMPILER INTERNALS

"This seems safe."
//go_import
The GSCRIPT compiler is smart enough to resolve your imports and ensure you're calling functions for that package correctly.
You can now use most exported, non-receiver functions. We've implemented a return array for any multiple assignment Go functions so you never miss data or errors.
The GSCRIPT compiler takes care of the rest. #WINNING

DEBUGGING

gscript shell

gscript shell --macro/-m

gscript shell --macro/-m

gscript shell --macro/-m
TypeOf(obj)

gscript shell --macro/-m
TypeOf(obj) SymbolTable()

CURRENT LIMITATIONS

No FreeBSD Support
Currently, GSCRIPT can only target a subset of Golang target OSes and architectures.

Large Binaries
Because of embedding all it's dependencies and payloads, the binaries tend to be on the larger side.
(At least 2MB)

Limited Regex Support
Golang's RE2 has some corner case incompatibilities with Javascript regular expressions, preventing lots of
JS code from being runnable out of the box.

Go Types Lack Flexibility
There are several declaration types in Golang which are not linkable yet. This includes const and var, as
well as any exported type that isn't returnable by a function.

ES5 Support Only
The Javascript VM only supports ES5 at this time.

No Concurrency Primitives in JS
There is no async() primitives in Javascript currently. If you want to run async code, build a Go package that
manages the concurrency.

GSCRIPT STANDARD LIBRARY

Name
crypto encoding
exec file net
os rand requests time

Current Uses
Various hashing algorithms & RSA key generation Encoding & decoding base64 Blocking and non-blocking command execution File operations - write, read, append, copy, replace Functions to help determine if the machine is listening on tcp/udp ports Genesis process control (terminate self, etc.) Basic rand generators - int, strings, bools, etc. Basic HTTP client for GET & POST of multiple content types Retrieving system time in unix epoch

REAL WORLD APPLICATIONS

Lower Overhead

Consistency

Cross-platform

Infinite Expansion

Self Documenting

Low Barrier to Entry

Features

1 2 3 4

GSCRIPT

TBD

TBD

TBD

TBD

DEMO TIME

#1: DAN'S EXAMPLE ORDINANCE

#1: PRESENTER'S PAYLOAD D'JOUR

#3: THE PEOPLE'S BINARY

GET CONNECTED

TWITTER: @alexlevinson GITHUB: github.com/gen0cide EMAIL: alexl@uber.com
TWITTER: @1njection GITHUB: github.com/ahhh BLOG: lockboxx.blogspot.com
TWITTER: @vyrus GITHUB: github.com/vyrus001 EMAIL: vyrus@dc949.org

https://github.com/gen0cide/gscript

