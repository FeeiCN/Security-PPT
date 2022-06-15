See Ya Sharp: A Loader's Tale
BY MAX `LIBRA' KERSTEN

Table of contents
o Who am I? o What are loaders? o The egg and onion model o Loaders and their coverage in blogs o Attribution o Confusing family names o The loader's capabilities o Payload and configuration extraction o Bulk analysis results o Conclusion

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

2

Who am I?
o Max `Libra' Kersten (@Libranalysis) o Working for Trellix' Advanced Threat Research team o Spoke at several conferences
o Botconf, BlackHat, CONFidence, atHack, and others
o I write blogs about reverse engineering
o Including my own free Binary Analysis Course
o My tools are open-sourced on Github
o Such as m3 or AndroidProjectCreator

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

3

What are loaders?
o A loader is used to load a (remote) payload o Optionally contains defensive measures against sandboxes, virtual machines, and/or antivirus suites o The payload is generally encrypted and/or obfuscated
© MAX 'LIBRA' KERSTEN - BOTCONF 2022

Source: Stratosphere
4

The egg and onion model
o Represent internal network structures, and their security set-ups
o The egg has a hard outer shell, making it difficult to break
o The onion is layered, meaning a continuous effort is required

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

5

Loaders and their coverage in blogs
Research is meant to be reproducible

Reproduction is difficult when steps are unclear or missing

The absence in many reports is understandable

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

6

Attribution
o 360TotalSecurity links the loader to a threat actor dubbed Vendetta
o A variety of reports indicate the loader was used against numerous targets, aimed towards various sectors
o At least one leaked builder can be found in the wild

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

7

Confusing family names
o Alternatively known as ReZer0 and in rare cases as Lazarus (not to be confused with the APT) o G Data's Karsten Hahn's blog sheds more light on ambiguous naming schemes
© MAX 'LIBRA' KERSTEN - BOTCONF 2022

40% 18%

42% ReZer0 CyaX-Sharp Other
8

Confusing family names
o Given that ReZer0 is the more frequent name, why is CyaX-Sharp the most common name?

70 60 50 40 30 20 10
0 Jul/19

Aug/19 Sep/19

Oct/19 Nov/19 Dec/19

Jan/20

Feb/20 Mar/20 Apr/20 May/20 Jun/20

Jul/20

Aug/20

ReZer0 CyaX-Sharp

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

9

The loader's capabilities

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

10

The loader's capabilities

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

11

The loader's capabilities

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

12

The loader's capabilities

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

13

The loader's capabilities

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

14

The loader's capabilities

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

15

The loader's capabilities

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

16

The loader's capabilities

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

17

The loader's capabilities

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

18

The loader's capabilities
o Process hollowing in C# using System.Runtime.InteropServices o The RunPE class of NYAN-x-CAT is used within the CyaX-Sharp loader
o Code similarity

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

19

Changes over time
o The configuration array's size increased over time, as more features were added
o In newer versions, the sleep functionality is configurable, and a custom MessageBox prompt can be shown

80 70 60 50 40 30 20 10
0

config_29

config_37

config_38

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

20

Payload and configuration extraction

Automatic extraction of a sample set
Collected 513 unique loader samples

Obtain the payload and configuration array

The plan of approach
Decrypt and dump the payload

Parse the configuration

Avoid resetting the machine

What can be used to create such a tool?

DotNet Reflection or by finding raw offsets

An IDE of your choice, mine being Visual Studio

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

21

Payload and configuration extraction

The classic approach

Recreates the decryption routine

Deal with downsides

Requires continuous maintenance

Get lucky and find a flaw

Static variables prove their worth

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

22

Payload and configuration extraction
o A brief note about static variables per Microsoft's documentation
o "[...] the type information for a static class is loaded by the .NET runtime when the program that references the class is loaded. [...] it is guaranteed to be loaded and to have its fields initialized and its static constructor called before the class is referenced for the first time in your program."

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

23

Payload and configuration extraction

Obfuscation becomes irrelevant

Fields are assigned their value Static constructors function the

prior to being accessed

same way

A new plan of approach

Load* the binary using the

Find and handle the required

Reflection based Assembly class

fields

A complete write-up can be found here

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

24

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

25

Bulk analysis results
o Collected 513 unique loader samples based on the scheduled task template
o Note that some files need to be deobfuscated before the task template is readable
o Collected data based on relevant capabilities, and their usage

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

26

Bulk analysis results

11%

10%

72%

28%

2% 6%

Hollows Loader Hollows MSBuild Hollows vbc Hollows RegSvc Direct launch

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

27

Bulk analysis results
46% Scheduled tasks No persistence
54%

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

28

Bulk analysis results

25
Loaders using sleep
20

23% 77%

15 Sleep disabled loaders Sleep enabled loaders
10

5

Sleep time

0 0 1 2 3 4 5 6 7 9 10 12 14 15 18 20 21 25 30 35 40 45 60 66 600
Sleep time

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

29

Bulk analysis results
o 8% of the total loaders had both options enabled
o This does not (dis)prove the claim that anti-analysis capabilities are commonly used

11% 10%

79% Plain Anti-VM Anti-Sandbox

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

30

Bulk analysis results
Payload families
15%
31% 54%

4% 5%

4% 4% 3%

3% 8%

AgentTesla FormBook MassLogger LokiBot NanoCore WarzoneRAT RemcosRAT HawkEye Other

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

31

Bulk analysis results

The 513 unique loaders contain 447 unique payloads

66 duplicates, 48 of which are AgentTesla payloads

Barely utilised capabilities

7 MessageBox pop-ups, 4 with a message
4 remote payload downloads, 3 with a URL

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

32

Conclusion

01
CyaX-Sharp is a versatile loader with a simplistic design

02
Organisations should pursue the onion-based security model

03
Organisations and researchers will benefit from additional research into loaders

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

33

Questions
o You can always contact me on Twitter @Libranalysis
o Slides will be published there as well! o The ATR blog can be found here

© MAX 'LIBRA' KERSTEN - BOTCONF 2022

34

