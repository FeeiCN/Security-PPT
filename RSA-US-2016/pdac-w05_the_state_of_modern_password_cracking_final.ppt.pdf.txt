SESSION ID: PDAC-W05
The State of Modern Password Cracking
#RSAC

Christopher Camejo
Director of Threat and Vulnerability Analysis NTT Com Security
@0x434a

#RSAC
Presentation Overview

Password Hashing 101

Getting Hashes

Basic Cracking

GPU Cracking

Statistical Analysis

Advanced Hashing and Cracking

Making Trouble

Recommendations

2

#RSAC
Password Hashing 101

#RSAC
Password Hashing 101
administrator ******** Log In

trustNo1 trustNo2

5979150da68d8b9d074751590c7896ed 0ab15acb4711103a7ffa24e485f4f03c
4

#RSAC
Adding Some Salt

No Salt

trustNo1 Hash trustNo1 Hash

5979150da68d8b9d074751590c7896ed 5979150da68d8b9d074751590c7896ed

Salt
q89f236h trustNo1 Hash 18af5d264d8dabd39498990fadf9ec34 q89f236h ohfq3w84 trustNo1 Hash a40e7ee72045e2b8d6b25673fda3b724 ohfq3w84
5

#RSAC
Getting Hashes

#RSAC
Stealing Hashes
Compromise a Host
· Local Caches · Network Sniffing
Application Vulnerabilities
· SQL Injection · File Inclusion
Leaked Code
· Hardcoded Client Passwords · Backdoor Hashes
7

#RSAC
Indecent Exposure
Search GitHub for `abc.com' password
Warehouse.define do warehouse :User do login "admin@abc.com" name "" access "super" email "admin@abc.com" password "$2a$08$Y.JcIVvVQMk4UiToFFlLSObWeHYIT2zHdJrhYsgjdZdW7ZzByioh6" reset_token nil end end
8

#RSAC
Basic Password Cracking

#RSAC
Entropy (lack thereof)

Standard keyboard:

· 95 characters

"Reasonable" password length:

· 10 characters

Possible combinations:

· 60,510,648,114,517,000,000

Time to crack @ 200 million KPS:

· 9,587 years

10

#RSAC
Powers of 2

Time to crack @ 200 million keys per second

Length
6 character 7 characters 8 characters 9 characters 10 characters

Lowercase Letters
1.7 seconds
41.8 seconds
18.1 minutes
7.9 hours
1.3 weeks

Lowercase Alphanumeric
11.2 seconds
6.8 misneuctreest

Mixed Case Alphanumeric 4.9 minutes
5 hours

4.1 hours 0.9 weeks

1.9 weeks
Se2c.2reyte1a2rs3!

31.1 weeks

1.4 centuries

All characters
1.1 hours 4.1 days 1.1 years 1.1 centuries
9.6 millennia

11

#RSAC
Entropy (lack thereof)

OED Entries:

· 291,500 entries · @200 million/sec = 0.0015 seconds

Our "English" file
Our "Crack" file

· 394,748 entries · @200 million/sec = 0.0020 seconds
· 148,903,320 entries · @200 million/sec = 0.75 seconds

CEWL

· Spiders web sites and adds unique terms it finds to the dictionary file

12

#RSAC
GPU Cracking

#RSAC
The Speed Problem

aaaaaaaa aaaaaaab aaaaaaac
...

baaaaaaa baaaaaab baaaaaac
...

caaaaaaa caaaaaab caaaaaac
...

daaaaaaa daaaaaab daaaaaac
...

eaaaaaaa eaaaaaab eaaaaaac
...

faaaaaaa faaaaaab faaaaaac
...

3dbe00a1607e695736ad14a5a4e01ebc02813bdc2963351e2e74cf7e2ae86b7fe84326d0c29e5c120a2c1f1e9c0890f41ae1b65a6f1da00ec397db78d7161e897693cae13bdc65e2b3e450f25b34c80802ef41531ab50e5c1a91b452e801db
14

#RSAC
The Bottleneck Solution
abacadaeaafaabaacaadaeaaafaabaacaadaeaaafaabaacaadaeaaafaabaacaadaeaaafaabaacaadaeaaafaabaacaadaeaaafaabaacaadaeaaafaabaacaadaeaaafaabaacaadaeaaafaabaacaadaeaaafaabaacaadaeaaafaabaacaadaeaaafaabaacaadaeaaafaabaacaadaeaaafaabaacaadaeaaafaabaacaadaeaaafaabaacaadaeaaafaabaacaadaeaaafaabaacaadaeaaafaaaaaaaaaaaaaaaaaaa abacadaeafaaabaacaadaeaaafaabbaabcabadabeababafaabbaabcabadabeababafaabbaabcabadabeababafaabbaabcabadabeababafaabbaabcabadabeababafaabbaabcabadabeababafaabbaabcabadabeababafaabbaabcabadabeababafaabbaabcabadabeababafaabbaabcabadabeababafaabbaabcabadabeababafaabbaabcabadabeababafaabbaabcabadabeababafaabbaabcabadabeababafaabbaabcabadabeababafaabbaabcabadabeababafaabbaabcabadabeababafaabbaabcabadabeababafaabaababaabababaabaabbaabbb abacadaeafaaabaacaadaeaaafaacbaaccaadaceacacafaacbaaccaadaceacacafaacbaaccaadaceacacafaacbaaccaadaceacacafaacbaaccaadaceacacafaacbaaccaadaceacacafaacbaaccaadaceacacafaacbaaccaadaceacacafaacbaaccaadaceacacafaacbaaccaadaceacacafaacbaaccaadaceacacafaacbaaccaadaceacacafaacbaaccaadaceacacafaacbaaccaadaceacacafaacbaaccaadaceacacafaacbaaccaadaceacacafaacbaaccaadaceacacafaacbaaccaadaceacacafaacaacacaacacacaacaaccaaccc
........................................................................................................................................................................................................................................................................................................................................................................
30d01efb3ba90e7d2b071e0efb38ab6906e7dc6d2b071ea0e6fbf3248ab691bd065e7dc56d2b07615ea20e6fb4f328ab67921bd04c65e71dc56d2b60e715a20e6cfb4f3285ab61079281bd04c65e71dc5632d8bf60e715ba20e6cf4bf32a9485b6107a9281bd04c56de71c85632dbf60e7315b1a20e96cfa4b0df32a9485b6107a9281bd04c516adfe751c8632dbef607315eb1a20e96bcfa40df32a94c85b61307a9d28f1eb04c516aedf7512c8e632dbeaf607315eb1a209e6bcfa40df32a945c8b61307a9d28f1eb045c16aedf7512c8e632d7beaf60315eb41a209e6bcfa40df32a945c8b61307a9d28f1eb046c51aedf75132c8e632d7beaf605231e0b41a209e6bcfa40df32ae945c8b612307a9d8cf1eb4065c1aedf75132c8e632d75beaf602315e0b41a2309e6bcfa470df32ae9845c1b623017a9d8cfeb4065c1aedf75132c8e6b32d75eaf602315e0bf41a23079e6bcfa40d9f32aeb845c19623017ad8cfeb4065c31aedf73512c8e6b032d75eaf602315e0bf41a23079e861bacf40d9f321aeb845c9612307ad8cf1eb4065c3a1e9df73512c8e6b032d75eaf602315e0bf41a230b79e861acf4b0d9f321ae845c9b612307ad8cf1eb4065c3a1e9df73512c8e6b032d75eaf602315e0bf41a230b79e861acf4b0d9f321ae845c9b612307ad8cf1eb4065c3a1e9df73512c8e6b032d75eaf602315e0bf41a230b79e861acf4b0d9f321ae845c9b612307ad8cf1eb4065c3a1e9df73512c8e6b032d75eaf602315e0bf41a230b79e861acf4b0d9f21ae3845c9b612307ad8cf1eb4065c3a1e9df73512c8e6b032d75eaf623105ebf41a230b79e861ac40bd9f21ae3845c9612307d8cf1eb4065c3a1e9df3512c78e6b032d75eaf623105ebf41a230b79e861ac40bd9f21ae3845c912307d8cf1eb4065c3a1e9df3512c78e6b03275eafd623105ebf41a230b79e81ac640bd91ae385c9124307d8cfe4065c3a1e9df351278ce6b03275eafd623105ebf41a320b79e81ac640bd91ae385c912430d8cfe40653a1ec9df351278ce6b03275eafd23105bf41ea320b7981a640bdc91ae385c92143dc0fe4653a1ec9df351278ce6b03725ead3105f41eba3207981ba60dc941eb85c92143dc0fe4653a1ec9f3512d7c68eb03725ead1053f41eba3207981ba6c9401eb85c92143dc0fe4653a1ec93125d7c68eb03725ade05f41b3207981a6bc9401e85c9214c04e653a1ec9315d7c68eb03725de50f41b32781a6bc9401e8c924c04e63aec9315d7c68b03725e50f13b781a6b9401e824c4e3aec9315d7c68b0725e5f03b781ab94018e2e43aec9315dc68b0ef0b781ab94018e3aec9315dc00b81ab1eaec9dbb
15

Hashcat

#RSAC
Rules Masks

CPU and GPU cracking Free/Open Source

Modify dictionary
words

Selective brute force

16

#RSAC
More Power

Model
Cores
MD5 Crack 10 characters

· Intel Xeon E5-2620 v3; $400 ea. · 6@2.4GHz x 2 CPUs = 12 cores · 205 million/sec
· 9,353 years

Model Cores MD5 Crack 10 characters
17

· Nvidia GeForce GTX Titan X; $1,000 ea. · 3,072@1GHz x 8 GPUs= 24,576 cores · 132 billion/sec
· 15 years

#RSAC
Statistical Analysis

PCI Compliance
Req · 7 characters 8.2.3: · Alphanumeric Req · Change <90 8.2.4: days

Time to 7 characters alphanumeric
MD5 5 mins
SHA512 6 mins
19

#RSAC
Time to 10 characters alphanumeric
MD5 3 days
SHA512 9 days

#RSAC
Analyzing leaked passwords

Breached in 2009: 14.3 million plaintext passwords leaked

Password Length

Password Complexity

2%

17% 13%

14%

17%

15% 20%

<6 chars 6 chars 7 chars 8 chars 9 chars 10 chars >10 chars

17% 16%
25% 42%

Numeric
Lowercase
Lowercase and numeric Other

20

#RSAC
Smarter Analysis

19% 16%

"LD" Pattern:

· All lowercase or all numbers · Lowercase with last 1-4 characters numeric

37%

1-10 characters

1-10 characters using

alphanumeric

pattern

28%

· Recovered: 71%

· Recovered: 61%

All Numbers All Letters Letters then Numbers Other

· MD5: 3 days · SHA512: 9 days

· MD5: 6h23m · SHA512: 17h41m

21

#RSAC
Breaking NTLM for fun and profit
Old Windows domain authentication system Uses very weak hashes Hashes are everywhere Keys to the Kingdom Other security fails besides cracking
22

#RSAC
Crack and Analyze

8,930/15,902 "stolen" NTLM hashes (< 9 chars)

Password Length

0% 5% 10%

<6 chars

44%

6 chars

7 chars

41%

8 chars

>8 chars

Password Complexity

20%

Mixed case and numeric

47%

Lowercase

and numeric

33%

Other

23

#RSAC
Recurring Themes

Variations on Company name
Variations on "P@5$w0rd"
Likely IT defaults that never got changed
A pattern emerges...

Uppercase in the first position
If at all

Special character before the number(s)
If at all

Numbers at the end
1-4 of them

The rest is lowercase
Hello!123

24

#RSAC
Live Fire - Patterns

15,902 NTLM hashes "stolen" in penetration tests

Fast

Thorough

Method All to 7 chars ULSD 8 chars ULSD 9 chars LD 10 chars
Total

Recovered 15% 12% 5% 2%
35%

Time 10 mins 1 min 12 mins 44 mins
~1 hour

Method All to 8 chars ULSD 9 chars ULSD 10 chars LD to 11 chars
Total

Recovered 56% 5% 4% 1%
67%

Time 17 hours 12 mins 6 hours 19 hours
~41 hours

25

#RSAC
Live Fire ­ Adding Dictionaries

15,902 NTLM hashes "stolen" in penetration tests

Method 149 million dictionary words with Best64 rule 149 million dictionary words with d3ad0ne rule

Recovered 24.6% 44.1%

Time 53s 5m

Fast (<1 hour) No dictionary With dictionary

Recovered 35.0% 47.7%

Thorough (<2 days) No dictionary With dictionary

Recovered 67% 73.9%

26

#RSAC
Advanced Hashing and Cracking

#RSAC
Rainbow Tables (Horribly Oversimplified)

Start aaaaaa bbbbbb cccccc dddddd eeeeee ffffff ...

End abcabc kitten secret sesame random archer ...

5979150da68d8b9d074751590c7896ed secret

secret

trustNo1

28

#RSAC
Better Hashing

Key Derivation Functions (KDFs)

Password Salt

x 10,000

Work Factor Salt Hash

Hash-based Message Authentication Codes (HMACs)

Password Salt

Salt Hash

Private Key
29

#RSAC
Making Trouble

#RSAC
Making Trouble
Access or escalate privileges on a target network Impersonate a user for fraud Publicly post them to embarrass a target Add them to cracking dictionary
31

#RSAC
Recommendations

#RSAC
Keep Hashes Safe
Strong SDLC for custom apps Lock down Windows security configuration Use admin credentials only when necessary Penetration test to find weaknesses
33

#RSAC
Strong Password Policy

Enforce password requirements

Change <90 days

12+ characters

All character
types
Support

Prohibit re-use

Pattern checks?

Crack your own passwords

Awareness of phishing and re-use

34

#RSAC
Use Appropriate Crypto

DON'T WRITE YOUR OWN!!! EVER!!!

Cryptographically sound random number generator

Long and cryptographically strong salt unique to each credential

Use a KDF or HMAC instead of a plain hash

KDFs:

PBKDF2, scrypt, bcrypt

Update Work Factors as appropriate

35

HMACS:

Use a strong key

Protect the key

#RSAC
When it really needs to be secure

Something You Know
PIN Password
36

Something You Have
Token Card Certificate File

#RSAC
Don't Muck It Up
Broken authentication and session management Password reset procedures Leaking plaintext passwords Users with the same password on every site Users who fall for phishing Malware and keyloggers
37

#RSAC
Wrapping Up

Apply this knowledge
Next week you should: · Change YOUR password to something long, complex, and unique to each service · Do some Google searches for your own company's code and passwords (e.g. GitHub)
In the first three months following this presentation you should: · Implement a better password policy and enforce it · Look for incorrect salt usage, use of plain hashes, and weak crypto, and unnecessary
backwards-compatibility settings
Within six months you should: · Disable as much backwards compatibility and outdated crypto as possible · Use salted KDF or HMACs for all password authentication · Implement 2-factor or other password alternatives where appropriate
39

#RSAC

#RSAC
Contact Details
chris.camejo@nttcomsecurity.com - @0x434a
40

