SESSION ID: IDY-F02
Secure Graphical Passwords

Peter Robinson
Senior Engineering Manager RSA, The Security Division of EMC

#RSAC

#RSAC
Is this Secure?
GoogleTM AndroidTM Pattern Unlock
2

#RSAC
What about this?
Microsoft® Windows 8 ® Picture Password
3

#RSAC
Introduction
This presentation:  Analyses the security strength of Android Pattern Unlock and
Windows 8 Picture Password.  Introduces a new graphical password scheme which offers:
 Better security strength, whilst still being memorable, and fast to enter.  Allows for automatic password simplification, which makes passwords
easier to remember.
4

#RSAC
Agenda
 Password Entropy and Security Strength  Android Pattern Unlock  Windows 8 Picture Password  Peter's Graphical Password Scheme  Other Considerations
5

Password Entropy and

#RSAC

Security Strength

#RSAC
Password Entropy and Security Strength
 Entropy:  The amount of uncertainty or unpredictable randomness. Example:  Sample the pixel colour value from a light sensor pointed at a busy street.  The light sensor could return 256 possible values.  Entropy = 8 bits = log2(256)  Assumes:
 Attackers can't see the street scene & don't know when the sample is taken.  The possible light values are evenly distributed.
7

#RSAC
Password Entropy and Security Strength
 Password Entropy:
 The amount of entropy which can be derived from a password. Example:
 Randomly selected 8 character password with 64 possible values per character.
 The Password Entropy is 48 bits = log2(64) x 8  Can anyone remember: cFz8^Mcq ?
8

#RSAC
Password Entropy and Security Strength
 NIST SP-800-631 has a methodology for estimating the entropy of user selected passwords.
 Wier et al.2 have introduced the concept of Guessing Entropy, which is based on how hard a password is to crack.
Note 1: http://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-63-2.pdf Note 2: http://dl.acm.org/citation.cfm?id=1866327 9

#RSAC
Password Entropy and Security Strength
 Security Strength:
 A measure of the difficulty of discovering a key or breaking an algorithm.
10

#RSAC
Password Entropy and Security Strength

Security Strength
(bits)
2010 80
2030 112
Secret 128 Top 192
Secret
256

Symmetric
3DES (2-key) 3DES (3-key) AES 128 AES 192 AES 256

RSA (bits)
1024
2048
3072 7060 15360
11

ECC (bits)
160
224
256 384 521

Message Digest
SHA-1
SHA-224
SHA-256 SHA-384 SHA-512

#RSAC
Password Entropy and Security Strength

Password
Password Entropy

Password Hardening Algorithm

12

Processed Password
Processed Password Security Strength

#RSAC
Password Entropy and Security Strength
 Password hardening algorithms:
 SHA 256 salted hash  PBKDF2
 Variable time factor  scrypt
 Variable time / memory factor
13

#RSAC
Password Entropy and Security Strength

Password

SHA 256 Salted Hash Password Hardening
Algorithm

Processed Password

    =  3

Note 3: With the limitation that Password Entropy < security strength of SHA256
14

#RSAC
Password Entropy and Security Strength

Password

scrypt Password Hardening
Algorithm

Processed Password

         
=   + log2      

15

#RSAC
Password Entropy and Security Strength

Password

Password Hardening Algorithm

Processed Password

   

=   + log2

     

16

#RSAC
Password Entropy and Security Strength
 Password Hardening Algorithm parameters:
 Scale so algorithm execution time is acceptable on target hardware. 100 ms on a Samsung Galaxy S5 or iPhone 6.
 Battery usage may be a factor in determining acceptable hardening.
 Effective number of SHA 256 operations:
 Number of times SHA 256 can execute in 100 ms on target hardware. This is approximately 1,000,000. 20  log2(1,000,000)
17

#RSAC
Password Entropy and Security Strength

Password

Password Hardening Algorithm
which executes in 100 ms

Processed Password

    =   + 20 
   =      - 20 
18

Password Entropy and Security Strength

#RSAC

Summary

 Entropy: The amount of uncertainty or unpredictable randomness.

 Password Entropy: The amount of entropy which can be derived from a password.

 Security Strength:
 A measure of the difficulty of discovering a key or breaking an algorithm.
 The security strength of a system whose strength is based on password entropy is typically limited by the entropy of the passwords.

19

Password Entropy and Security Strength

#RSAC

Summary

 20 bits:
 Approximate scaling factor between password entropy and security strength, assuming a well written algorithm which takes 100 ms to execute.

 60 to 90 bits:
 Amount of password entropy needed for systems which base their security strength on passwords.

20

#RSAC
Android Pattern Unlock

#RSAC
Android Pattern Unlock
 At least four points must be chosen.  No point can be used twice.  Only straight lines are allowed.  Cannot jump over points not visited before.
22

#RSAC
Android Pattern Unlock: Video Demo
23

#RSAC
Android Pattern Unlock
 Theoretically:
 389,112 possible combinations.  Password entropy: 19 bits.
 After five failed attempts, the user is locked out for 30 seconds.
24

#RSAC
Android Pattern Unlock
 Do people really do this?
25

#RSAC
Android Pattern Unlock
 Do people really do this?  People avoid hard to enter patterns.  Most people use a 4 or 5 point pattern.
26

#RSAC
Android Pattern Unlock
 Uellenbeck et al.4 did a user study (584 participants creating 2900 patterns) which showed:
 Starting point bias5.  Bias towards lines along
outside.  300 patterns capture around
50% of the whole test population.  Password Entropy: 8 bits for 50%.
Note 4: http://emsec.rub.de/media/emma/veroeffentlichungen/2013/09/26/patternLogin-CCS13.pdf Note 5: Probably culturally specific. 27

#RSAC
Android Pattern Unlock
 Android pattern unlock passwords are SHA1 message digested and compared with a value in a system file:
android/data/system/gesture.key
 If your phone has been rooted6, the system file is accessible.
The pattern can then be quickly recovered by comparing the SHA1 hash of all possible patterns.
 Security Strength: between 8 bits and 19 bits.
Note 6: Rooted definition: http://en.wikipedia.org/wiki/Rooting_%28Android_OS%29
28

Android Pattern Unlock

#RSAC

Summary

 Usability:
 User selected.  Time to enter: 1 second (usually correct first attempt).  Easy to remember.
 Security:
 Security Strength: 8 bits, but possibly as much as 19 bits.  300 patterns cover 50% of all passwords.  User selected security level (user select number of points).

29

Windows 8

#RSAC

Picture Password

#RSAC
Windows 8 Picture Password
 User chooses photo.  Draw three gestures
in sequence.  Circle, line, or dot.  Direction of circle or
line is important.
31

#RSAC
Windows 8 Picture Password: Video Demo
32

#RSAC
Windows 8 Picture Password
 Example passwords invariably contain a limited number of Points Of Interest.
33

#RSAC
Windows 8 Picture Password
 From a security perspective, lines and circles are better than dots.
 However, dots are faster to enter and easier to reliably enter than circles and lines.
34

#RSAC
Windows 8 Picture Password
 Picture passwords can only be used for local login.
 After five failed attempts, you must enter your character based password.
35

#RSAC
Windows 8 Picture Password
 Microsoft7 have analysed possible combinations based on the number of Points of Interest in a photo.
 They have assumed all gesture types (dot, line, circle) are equally likely, which is not the case.
Note 7: http://blogs.msdn.com/b/b8/archive/2011/12/16/signing-in-with-a-picture-password.aspx
36

#RSAC
Windows 8 Picture Password

Points of Interest
5 10 15 20

Microsoft's Analysis
Number of Combinations, assuming lines, circles and dots
421,875
8,000,000
52,734,375
216,000,000

My Analysis

Bits of Entropy
19 23 26 28

Number of Combinations, assuming dots only
125
1,000
3,375
8,000

Bits of Entropy
7 10 12 13

37

#RSAC
Windows 8 Picture Password

 Zhao et al.8 devised automated analysis tools to find Points of Interest in picture passwords.

Methodology Automated PoI recognition, 1st guess Manual PoI recognition, 1st guess: Automated PoI recognition, 5 guesses Manual PoI recognition, 5 guesses

Correct Guesses 0.8% 0.9% 1.9% 2.6%

Note 8: http://sefcom.asu.edu/publications/security-picture-gesture-security2013.pdf
38

#RSAC
Windows 8 Picture Password
 The longest dimension of the image is divided into 100 segments. The shorter dimension is then divided on that scale to create the grid upon which you draw gestures9.
 Within the grid, points nearby are deemed to be a match.
Note 9: Image from: http://blogs.msdn.com/b/b8/archive/2011/12/16/signing-in-with-a-picture-password.aspx
39

#RSAC
Windows 8 Picture Password
 Windows stores the Picture Password information encrypted.  It decrypts and compares the stored password with the entered
password.  For users with admin privileges, there are tools to recover the
Picture Password information!10
Note 10: Image from: http://www.top-password.com/knowledge/recover-windows-8-pin-code-picture-password.html
40

Windows 8 Picture Password

#RSAC

Summary

 Usability:  User selected.  Time to enter: 3 seconds for each attempt (I find it difficult to reliably enter).  Generally, easy to remember.
 Security:  Password Entropy: More than 12 bits and less than 26 bits.  Probability of guessing a password is 2.6%.  Password was encrypted, not processed by a one way function.  User selected security level (user selected types and position of gestures).

41

Peter's Graphical Password

#RSAC

Schemes

#RSAC
Competing Qualities

Quality Security
Ease of memory Speed of Entry

User Selected Much Lower Difficult to Measure Generally Easier Generally Faster

Computer Generated Much Higher Deterministic Generally Harder Generally Slower

 I chose Computer Generated.

43

#RSAC
Competing Styles

Style Grid Based Free Form

Processing Hash / Process to a fixed value Encrypt plain text, or try to use Fuzzy Hashing

 I chose Grid Based.
44

Variable Security
Password Type / Usage

Serious

Access at work

Important Internet Banking Work phone

Casual

Social networking Personal phone

Kids

Education software

Android Pattern Unlock

Windows 8 Picture Password

Typical Existing Passwords
correct horse battery staple11
bill00pay
truelove
home21 4 points 3 dots

Note 11: See: http://xkcd.com/936/
45

NIST Entropy
94
34
27
19 -

#RSAC
Guessing Entropy
44
30
20
12 8 to 19 12 to 26

#RSAC
Variable Security
 I chose to design the scheme to allow different configurations for different usages, matching the security, ease of use trade-offs.
46

Peter's Graphical Password Scheme

#RSAC

Password Entry

 To enter password:
 Select the line colour.  Slide finger along the screen to enter a line.  Enter the lines in order.  Click on Submit to authenticate.

47

Peter's Graphical Password Scheme

#RSAC

Password Entry

 Lines are snapped to the grid, either on the side or corners of boxes.
 Use the Android device's Back button to remove the previously entered line if a mistake is made.
 Check Auto Hide to hide lines moments after you enter them if you are concerned about shoulder surfers.

48

Peter's Graphical Password Scheme

#RSAC

Video Demo: Authentication

49

Peter's Graphical Password Scheme

#RSAC

Password Creation

 When a password is created:
 The password is played to the user; the App draws the lines one at a time.
 The user can ask for the password to be replayed by clicking on Replay Password.
 The user can learn the password by clicking on Learn.

50

Peter's Graphical Password Scheme

#RSAC

Learn Mode

 In Learn mode:
 The user draws lines and gets feedback on whether they are correct.
 They can ask for the next line to be drawn by clicking on Show Next.

51

Peter's Graphical Password Scheme

#RSAC

Video Demo: Learning

52

Peter's Graphical Password Scheme

#RSAC

Default Configuration

 Default Configuration:
 9 cells.  4 lines.  8 line directions.  8 line colours.
 Learning time: 60 seconds.  Entry time: 5 seconds.  Password Entropy: 36 bits

53

Peter's Graphical Password Scheme

#RSAC

Simple Configuration

 Simple Configuration:
 9 cells.  2 lines.  4 line directions (either diagonal or along grid).  8 line colours.
 Child learning time: 60 seconds.  Child entry time: 5 seconds.  Password Entropy: 17 bits

54

Peter's Graphical Password Scheme

#RSAC

Strong Configuration

 Strong Configuration:
 16 cells.  6 lines.  8 line directions.  8 line colours.
 Learning time: 5 minutes.  Entry time: 10 seconds.  Password Entropy: 60 bits

55

Peter's Graphical Password Scheme

#RSAC

Comparison

Password Example Category Usage

Serious

Access at work

Important Internet Banking

Casual

Social networking

Kids

Education

software

Typical Existing Password Guessing Entropy 44 30 20 12

Peter's Graphical Password Scheme Entropy 60
36
36
17

56

Peter's Graphical Password Scheme

#RSAC

Auto Simplification

 Auto simplification:
 A method of generating new passwords which are simpler, whilst minimally reducing password entropy.
 Good for users who forget their password and need a password reset.
 Parallel to PIN number auto simplification:
 Initial PIN: 4673  After first PIN reset: 4554  After second PIN reset: 1234  After third PIN reset: 1111

57

Peter's Graphical Password Scheme

#RSAC

Auto Simplification Methodology

 Randomly select first line.
 Base subsequent lines on the first line. Randomly select between:
 Same colour or sub-set of colours and / or  Same direction or sub-set of direction and / or  Same cell or sub-set of cells.

58

Peter's Graphical Password Scheme

#RSAC

Auto Simplification Methodology

 As the first line is randomly selected:
 First line has full entropy.
 As there are many options for how subsequent lines can be simplified:
 Entropy of subsequent lines is greater than if a deterministic simplification approach was used.
 A graduated amount of simplification can be applied.

59

Peter's Graphical Password Scheme

#RSAC

Auto Simplification Methodology

Simplification Scheme None: 9 cells, 4 lines, 8 colours, 8 line directions 9 cells, 4 lines, 8 colours, 2 line directions 9 cells, 4 lines, 2 colours, 8 line directions 9 cells, 4 lines, 8 colours, same line direction 9 cells, 4 lines, 8 directions, same colour direction 9 cells, 4 lines, same colour and same direction

Password Entropy 36 32 32 29 29 20

 What is the minimum entropy you are comfortable with?

60

Peter's Graphical Password Scheme

#RSAC

Summary

 Usability:
 Computer generated.  Time to enter: 5 to 10 seconds, depending on configuration.  As hard to remember as equivalent character based password.
 Security:
 Entropy: 17 to 60 bits, depending on configuration.  User / application selected security level.  Auto simplification.

61

#RSAC
Other Considerations

#RSAC
Other Considerations
 Smudge Attack10:  Wikipedia, "..a method to discerning the password pattern of a touchscreen device..."  A big factor in degree of smudge is how hard the user touches the screen.
 My graphical password scheme provides some protection against this type of attack:  Line colours.  Line ordering.  The intricate nature of the password promotes lighter touch.
Note 10: http://static.usenix.org/events/woot10/tech/full_papers/Aviv.pdf Note 11: Photo from: https://guardianproject.info/2012/01/04/strong-mobile-passwords-with-yubikey-usb-token/
63

#RSAC
Other Considerations
 Offline attack and online attack.  Colour blind12 support.  Gamification: Gamify graphical password learning.  Biometrics: They can never be revoked.  Complex passwords, TodayIsAGreatDayToHaveAL1zPassword:
 Allow more than three attempts before lockout.  Allow password hiding to be optional.
Note 12: http://www.colourblindawareness.org/colour-blindness/types-of-colour-blindness/
64

#RSAC
Wrapping Up

#RSAC
Security Strength Gap
 112+ bits security strength: What we need.  20 bits hardening: 100 ms of password hardening.  60 bits entropy: What my algorithm can supply.  32 bits: The difference between what we need and what we can
achieve.
66

#RSAC
How to Apply this Information?
 In the systems you have today:
 What are the password requirements?  How are passwords processed?  What security strength does your system need?
 When you assess a graphical password scheme, compared to existing passwords for the same usage:
 Is it more secure?  Is it easier to remember?  Is it faster to enter?
67

#RSAC
Summary
 Google's Android Pattern Unlock and Microsoft's Windows 8 Picture Password, given typical usage, are very weak.
 My graphical password scheme offers varying levels of security depending on configuration and usage. For each usage, when compared with traditional passwords, it offers:
 Password entropy: Better.  Ease of memorization and speed of entry: Similar.
 My password scheme can't deliver as much entropy as we need.
68

#RSAC
Any Questions?
 Peter Robinson: peter.robinson@rsa.com
69

