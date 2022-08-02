Getting F***** on the River
Gus Fritschie and Steve Witmer
with help from
Mike Wright, and JD Durick
August 6, 2011

Preflop
Who We Are What is Online Poker Online Poker History Current Events
Flop
Past Vulnerabilities RNG SuperUser SSL Account Compromise Poker Bots

Presentation Overview
Turn
Online Poker Architecture Poker Client=Rootkit Web Application Vulnerabilities Authentication Vulnerabilities Attacking Supporting Infrastructure
River
Defenses ­ Application Defenses ­ User Next Steps in Research Conclusion Questions

SeNet

Preflop

© SeNet International Corp. 2011

3

August 2011

SeNet

Who We Are ­ SeNet International

SeNet International is a Small Business Founded in 1998 to Deliver Network and Information Security Consulting Services to Government and Commercial Clients
· High-End Consulting Services Focus:
 Government Certification and Accreditation Support  Network Integration  Security Compliance Verification and Validation  Security Program Development with Business Case Justifications  Complex Security Designs and Optimized Deployments
· Proven Solution Delivery Methodology:
 Contract Execution Framework for Consistency and Quality  Technical, Management, and Quality Assurance Components
· Exceptional Qualifications:
 Executive Team--Security Industry Reputation and Active Project Leadership  Expertise with Leading Security Product Vendors, Technologies, and Best Practices  Advanced Degrees, Proper Clearances, Standards Organization Memberships, and IT Certifications
· Corporate Resources:
 Located in Fairfax, Virginia  Fully Equipped Security Lab  Over 40 full time security professionals

© SeNet International Corp. 2011

4

August 2011

SeNet

Who We Are ­ Gus Fritschie

CTO of a security consulting firm based in the DC metro area. Enjoys penetrating government networks (with their permission), playing golf (business development) and teaching my daughter to gamble.

© SeNet International Corp. 2011

5

August 2011

SeNet

Who We Are ­ Steve Witmer

Sr. Security Analyst in the Northern Virginia area working for a small company supporting government contracts. Responsible for conducting application assessments, penetration testing, secure configuration reviews, NIST C&A/ST&E and other security mumbojumbo. He enjoys scuba diving and big speakers.
© SeNet International Corp. 2011

Prior to his current job, Steve

spent 5 years as a road warrior

working for clients all over the

world ranging from Fortune 500 to

churches and delivering any kind

of engagement a client would pay

for: aka, a security whore.

6

August 2011

SeNet

Who We Are ­ Mike Wright

Contractor for the United States Coast Guard (blame them for not seeing my pretty face tonight) and security consultant.
Hobbies include the broad spectrum of Information Technology, but more geared towards security and hacking around.
Currently trying to bleach my hat white but still seeing shades of gray...

© SeNet International Corp. 2011

7

August 2011

SeNet

Who We Are ­ JD Durick

Digital forensics

examiner in the

northern Virginia area

working for a large

defense contractor.

Responsible for

conducting network

forensics as well as

hard drive and malware

analysis on network-

based intrusions involving commercial and government computer systems.

Experience as a software engineer, network security consultant, INFOSEC engineer, and digital forensic examiner for the past 15

years.

© SeNet International Corp. 2011

8

August 2011

SeNet

What is Online Poker

© SeNet International Corp. 2011

9

August 2011

SeNet

Online Poker Timeline

·Early 90's ­ IRC Poker is the 1st Virtual Poker ·1998 ­ Planet Poker Launched, 1st Real Money Site ·1999 ­ Kahnawake Gaming Commission Regulations ·2000 ­ UB Launches ·2001 ­ Party Poker and Poker Stars ·2003 ­ Moneymaker and Poker Boom ·2004 ­ Full Tilt Poker ·2005 ­ Online Poker Becomes $2 Billion Industry ·2006 ­ UIGEA ·2007 ­ UB/AP Cheating Scandal ·2010 ­ Online Poker Industry Reaches $6 Billion ·2011 ­ 4/15 Black Friday

© SeNet International Corp. 2011

10

August 2011

SeNet
© SeNet International Corp. 2011

Online Poker Current Events

· DOJ has seized the following poker sites on charges of illegal gambling and money laundering:
Poker Stars, Full Tilt, UB/Absolute, and Doyles Room

· Poker Stars has paid players, not other site has.

· Development of new features and functionality seems to be in a holding pattern.

11

August 2011

SeNet

Online Poker Revenue

© SeNet International Corp. 2011

12

August 2011

SeNet

Online Poker Revenue (Cont.)

In other words there is a lot of money in online poker

© SeNet International Corp. 2011

13

August 2011

SeNet

Regulation\Compliance

· For an industry that makes a decent amount of revenue there is little to no regulation\compliance
· Isle of Man Gambling Supervision Commission and Kahnawake Gaming Commission
· Party Poker and other sites do not allow players from the USA and in certain countries (i.e. UK) it is regulated and taxed.
"Licensed and regulated by the Government of Gibraltar, our games are powered by the bwin.party systems which are independently tested to ensure that our games operate correctly, are fair, their outcomes are not predictable and that the system is reliable, resilient and otherwise up to the highest standards of software integrity, including access control, change control recording, fingerprinting of the executables and regular monitoring of all critical components of our systems."

© SeNet International Corp. 2011

14

August 2011

SeNet

Regulation\Compliance (Cont.)

There is a need for compliance related activities if online poker is to become regulated and safe to play in the USA.

A standard needs to be developed and companies that provide these services need to be audited. Not just from the financial perspective, but the technical perspective.

Why will this happen?

© SeNet International Corp. 2011

15

August 2011

SeNet

Regulation\Compliance (Cont.)

Because there is a lot of money in online poker

© SeNet International Corp. 2011

16

August 2011

SeNet

Flop

© SeNet International Corp. 2011

17

August 2011

SeNet

Past Vulnerabilities

· Random Number Generator Vulnerability · UB/Absolute Super User Issue · SSL Exploit · Misc. Account Compromise · Poker Bots

© SeNet International Corp. 2011

18

August 2011

Random Number Generator

SeNet

Vulnerability

· Documented in 1999 and originally published in Developer.com
· PlanetPoker had published their shuffling algorithm to demonstrate the game's integrity
· ASF Software developed the shuffling algorithm

© SeNet International Corp. 2011

19

August 2011

Random Number Generator

SeNet

Vulnerability (Cont.)

· In a real deck of cards, there are 52! (approximately 2^226) possible unique shuffles.
· In their algorithm only 4 billion possible shuffles can result from this algorithm
· Seed for the random number generator using the Pascal function Randomize()
· Number reduces to 86,400,000 · They were able to reduce the number of possible combinations
down to a number on the order of 200,000 possibilities · Based on the five known cards their program searched through the
few hundred thousand possible shuffles to determine the correct one

© SeNet International Corp. 2011

20

August 2011

Random Number Generator

SeNet

Vulnerability (Cont.)

· These days companies have their RNG audited by reputable 3rd parties · From Poker Stars site: "Cigital, the largest consulting firm specializing in
software security and quality, has confirmed the reliability and security of the random number generator (RNG) that PokerStars uses to shuffle cards on its online poker site, showing the solution meets or exceeds best practices in
generating unpredictable and statistically random values for dealing cards." · Do you believe this?

© SeNet International Corp. 2011

21

August 2011

SeNet

UB/Absolute Super User Issue

· Full story is almost like a soap opera.
· Cheating is thought to have occurred between 2004-2008 when members of online poker forum began investigating.
· Still actively being investigated by people such as Haley (http://haleyspokerblog.blogspot.com/).

© SeNet International Corp. 2011

22

August 2011

SeNet

UB/Absolute Super User Issue (Cont.)

· Story is owner suspected cheating and asked software developer to put in a tool to "help catch the cheaters"
· Hired an independent contractor to put in a tool which became known as "god mode"
· God Mode worked like this: the tool couldn't be used on the same computer that someone was using. Someone else would need to log into UB and turn the tool on. That person could then see all hole cards on the site­ and then feed the information.
· 23 accounts. 117 usernames. $22 million dollars

© SeNet International Corp. 2011

23

August 2011

SeNet

UB/Absolute Super User Issue (Cont.)

© SeNet International Corp. 2011

24

August 2011

SeNet

UB/Absolute Super User Issue (Cont.)

· Lessons learned: · Configuration Management · Separation of Duties · Code Reviews · SDLC · Auditing

© SeNet International Corp. 2011

25

August 2011

SeNet
Discovered by Poker Table Ratings in May 2010.
Why use SSL when you can just XOR it.......
Fixed 11 days later (hard to implement SSL)
UB/Absolute and Cake network were vulnerable

© SeNet International Corp. 2011

26

SSL Exploit
August 2011

SeNet

Misc. Account Compromise

© SeNet International Corp. 2011

27

August 2011

SeNet

Poker Bots

· Poker bots are not new, but until recently they were not very good. · Artificial intelligence has come a long way in the last few years. · Chess bot vs. poker bot · http://www.codingthewheel.com/archives/how-i-built-a-working-
poker-bot · http://bonusbots.com/

© SeNet International Corp. 2011

28

August 2011

SeNet
© SeNet International Corp. 2011

Poker Bots (Cont.)

· Windowing & GDI · Windows Hooks · Kernel objects · DLL Injection (in general:
the injecting of code into other processes) · API Instrumentation (via Detours or similar libraries) · Inter-process Communication (IPC) · Multithreading & synchronization · Simulating user input · Regular expressions (probably through Boost) · Spy++

29

August 2011

SeNet

Poker Bots (Cont.)

· Poker Sites have been cracking down on bots
· How do they catch them: · Betting patterns · Tendency · Program Flaws (always click same pixel) · Scanning
· When a player is identified as a bot, Full Tilt or PokerStars removes them from our games as soon as possible." Their winnings are confiscated, he said, and the company will "provide compensation to players when appropriate."

© SeNet International Corp. 2011

30

August 2011

SeNet

Poker Bots (Cont.)

· Full Tilt ­ Banned after finding evidence of a poker bot on your hard drive:

On Sat, Oct 16, 2010 at 2:03 PM, Full Tilt Poker - Security <security@fulltiltpoker.com> wrote: Hello <#FAIL>,
As outlined in the email you received, you have been found guilty of a violation of our rules regarding the use of prohibited software. Specifically you have been found to have used the Shanky Technologies Bot. The email you were sent has been included below for reference. This decision was the result of an extensive and exhaustive review of your account activity on Full Tilt Poker.
Do not attempt to play on Full Tilt Poker in the future on a new or existing account. If you are found playing on the site again, your account will be suspended and all remaining funds will be forfeited.
We will not enter into any further discussion regarding this matter.
Regards Security & Game Integrity Full Tilt Poker

© SeNet International Corp. 2011

31

August 2011

SeNet

Turn

© SeNet International Corp. 2011

32

August 2011

SeNet

Online Poker Network Architecture

© SeNet International Corp. 2011

33

August 2011

Online Poker Network Architecture

SeNet

(Cont.)

© SeNet International Corp. 2011

34

August 2011

Online Poker Network Architecture

SeNet

(Cont.)

© SeNet International Corp. 2011

35

August 2011

Online Poker Network Architecture

SeNet

(Cont.)

© SeNet International Corp. 2011

36

August 2011

SeNet

Poker Client=Root Kit
While the poker client is not exactly a root kit it does exhibit some of the same characteristics. The online companies argue this is for player protection against cheating. However, in doing this there is some invasion of privacy. I don't know about you but I don't like people to know what web sites are in my cache.

© SeNet International Corp. 2011

37

August 2011

SeNet

Poker Client Behind the Scenes

Lets take a look at what one of the poker clients is doing under the covers. Below we list some of the interesting items that the Cake poker client performs.
· Function Calls
EnemyWindowNames() EnemyProcessNames() EnemyProcessHashs() EnemyDLLNames() EnemyURLs ()
· Examines the system from programs or services it deems unauthorized
· OLLYDBG · POKEREDGE · POKERRNG · WINHOLDEM · OPENHOLDEM · WINSCRAPE · OPENSCRAPE · pokertracker · pokertrackerhud · HoldemInspector · HoldemInspector2 · HoldemManager · HMHud

© SeNet International Corp. 2011

38

August 2011

Poker Client Behind the Scenes

SeNet

(Cont.)

Well-known modifications and behavior observed by online poker clients:

1. Modification to the Windows host-based firewall policies which allows for automatically authorizing various poker clients

HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy \StandardProfile\AuthorizedApplications\List "C:\Program Files\Cake Poker 2.0\PokerClient.exe"

2. Scanning the windows process table
- Cake poker reads through each of your process after approximately 10-20 minutes of idle time (Reading the .exe files in 4k increments) ­ based on Cake poker client 2.0.1.3386

3. Ability to read the body and title bar text from every window you have open. - Extracts the window handles (HWND), caption, class, style and location of the windows.

4. Ability to detect mouse movements in order to determine human vs. automated movements.
- Mouse_event API / bots work the same way by writing custom mouse or keyboard drivers

© SeNet International Corp. 2011

39

August 2011

Poker Client Behind the Scenes

SeNet

(Cont.)

Additionally functionality found in poker clients:

1. Poker applications scan for instances of winholdem/Bonus bots (Shanky technologies) running on your workstation or VM instance.
2. Poker clients monitor table conversation for lack of table talk and longevity of sessions.
3. Numerous tools to detect monitoring of your filesystem and registry can be used. 4. Poker applications are known for monitoring Internet Caches for URL history
information.
5. Cookie creation from just about every client.

© SeNet International Corp. 2011

40

August 2011

Poker Client Behind the Scenes

SeNet

(Cont.)

- Cake Poker client is comprised of three main processes (CakePoker.exe, PokerClient.exe, and CakeNotifier.exe).

- The client scans itself during random intervals most likely protecting itself against modification or patching of the executables.

- Found the client (CakeNotifier.exe) also scanning directories containing packet capture files and reflector ( a .NET decompiler)???

- Cake poker's executables are all obfuscated
- PokerClient.exe is obfuscated ­ 12mb in size (huge ­ most likely encrypted). - Bodog verion 3.12.10.5 is only 4mb in size

© SeNet International Corp. 2011

41

August 2011

Poker Client Behind the Scenes

SeNet

(Cont.)

- Bodog verion 3.12.10.5 file monitoring and registry activity

- Prefetch files are created in C:\Windows\Prefetch

- Digital certificate directory is created C:\Users\jd\AppData\LocalLow\Microsoft\Cryptnet\UrlCache (used for storing certificates)

- BPGame.exe modifies itself with new attributes

- Reads through your URL cache

- Loads images from Bodog poker installation directory

© SeNet International Corp. 2011

42

August 2011

Poker Client Behind the Scenes

SeNet

(Cont.)

Queries your registry
- Looks in your HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2
- Queries your hardware settings on your workstation - Read User Shell folder ­ the user shell folder subkey stores the paths to Windows
Explorer folders for the current user of the computer. - TCP send request from localhost to 66.212.245.235 on port 80 - (After SSL handshake) - TCP send request from localhost to 66.212.249.155 on port
7997 - Session manager (HKLM\Sysstem\CurrentControlSet\Session manager
· Gets the environment variables of the machine · Username · Root directory of windows · Tmp dir · Path · Operating system

© SeNet International Corp. 2011

43

August 2011

SeNet

Web Application Vulnerabilities

© SeNet International Corp. 2011

44

August 2011

SeNet

Web App Vulnerabilities (Cont.)

© SeNet International Corp. 2011

45

August 2011

SeNet

Web App Vulnerabilities (Cont.)

© SeNet International Corp. 2011

46

August 2011

SeNet

Web App Vulnerabilities (Cont.)

© SeNet International Corp. 2011

47

August 2011

SeNet

Web App Vulnerabilities (Cont.)

If you thought it took some advanced techniques... Fail.

· Cross-site scripting heaven (persistent and reflective); apparently the designers felt <script> might be needed in numeric only fields.

· Unvalidated redirects; where would you like poker sites to take you?

· Pretty much zero input validation.

· Expired SSL certificates, not necessarily a vulnerability, but seriously?

© SeNet International Corp. 2011

48

August 2011

SeNet

Authentication Vulnerabilities

While sophsticated attacks are fun, sometimes you just need to go back to the basics. While some of the sites offer multifactor authentication these are not standard and cost extra. The sites differ widely in their password complexity requirements.

Poker Site Carbon Bodog Cake
Full Tilt UB/Absolute

Password Requirements
Between 6-20 characters
At least 5 characters
Between 8-14 and must contain the following: Lower case, upper case, number, special character At least 5 characters
At least 6 characters

© SeNet International Corp. 2011

49

August 2011

SeNet

Authentication Vulnerabilities (Cont.)

With passwords this strong it must be impossible to brute-force......
Especially with no account lockout
And login IDs fairly well known, thank you PTR Can anybody say Hydra? Brutus?.........

© SeNet International Corp. 2011

50

August 2011

SeNet

Authentication Vulnerabilities (Cont.)

Some poker sites use non-random numbers as UID's.
for uid in `seq 3830000 3840000`;do echo $uid > users.txt;done
(1 Second later...)
Half the battle? Done

© SeNet International Corp. 2011

51

August 2011

SeNet

Attacking Supporting Infrastructure

Several businesses have developed supporting the poker sites, these include:

· Training sites (Cardrunners, Deuces Cracked) · Tracking sites (PTR, Sharkscope) · Media/Forums (Two+Two)

If these sites are used by online poker players could they be leveraged in order to gain information or launch target phishing accounts with the goal to install malicious software in order to see their cards?

© SeNet International Corp. 2011

52

August 2011

Attacking Supporting Infrastructure

SeNet

(Cont.)

© SeNet International Corp. 2011

53

August 2011

Attacking Supporting Infrastructure

SeNet

(Cont.)

© SeNet International Corp. 2011

54

August 2011

Attacking Supporting Infrastructure

SeNet

(Cont.)

© SeNet International Corp. 2011

55

August 2011

SeNet

River

© SeNet International Corp. 2011

56

August 2011

SeNet

Online Poker Defenses - Application

· Need to move away from password based authentication and toward multifactor, because that can't be hacked right (RSA)?
· Maybe implement simple things, say like account lockout
· Perform robust security testing and configuration management
· Only allow connections from specific geographic locations
· Adhere to certain standards (i.e. ISO, PCI, FISMA)

© SeNet International Corp. 2011

57

August 2011

SeNet

Online Poker Defenses ­ User

· Have dedicated VM for poker and only use it for that purpose
· Use antivirus/spyware (D'oh)
· Don't play on insecure wirelesses networks
· Use strong, complex passwords. Better use multifactor authentication where available
· Don't use same password across multiple sites
· Monitor your traffic

© SeNet International Corp. 2011

58

August 2011

SeNet

Next Steps in Research

· Continue digging deeper into the poker client · Custom client to bypass restrictions · Automated tool to brute-force poker passwords · More mapping out poker networks · In-depth look at web application vulnerabilities

© SeNet International Corp. 2011

59

August 2011

SeNet

Conclusion

· While we did not uncover a smoking gun, based on preliminary research there seems to be several areas that do require strengthening and further exploration is sure to identify more serious issues

· Regulation and compliance is needed to attempt to make companies develop and secure their gaming networks

· Do I feel safe playing?

© SeNet International Corp. 2011

60

August 2011

SeNet

Questions

Questions?

© SeNet International Corp. 2011

61

August 2011

