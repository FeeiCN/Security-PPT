SESSION ID: OST-R01
NPK: High-Powered, Open Source Hash Cracking Tool

Brad Woodward
Director; Labs Coalfire Systems

#RSAC

#RSAC
2

#RSAC
3

#RSAC
Hashing Basics

#RSAC
What is Hashing?
A hashing algorithm deterministically converts an arbitrary length input into a fixed length, unique* output.

Input Hello World! RSA 2019 RSA 2020 RSA 2021

SHA1 Hash
2ef7bde608ce5404e97d5f042f95f89f1c232871 cba24a235b934128482fca76086162c3d2405fe0 4158141aae1507811df4a25ba5223dff14fcb4e7 9041b7466c0bd9360818b5b117b0e1de7f324a9b

5

#RSAC
Hash Speed as a Work Factor

Hash Rates for Nvidia Tesla M60 GPU

Algorithm NTLM NetNTLMv2 WPA2 bcrypt PBKDF2-HMAC-Whirlpool + XTS 512

Hash Rate

18,300,000,000 H/s 770,000,000 H/s 189,200 H/s 7,010 H/s 31 H/s

6

#RSAC
Useful Behaviors
Determinism
­ The same input will always result in the same output
Deviance
­ Similar inputs yield entirely dissimilar outputs
Uniform Distribution
­ No statistically relevant bias exists for output across the keyspace
7

#RSAC
Where Hashing is Used
As a Zero-Knowledge Proof
­ Determinism allows one party can verify that another knows a secret, without knowing the secret themselves.
As an Index-less Distributed Storage Lookup Method
­ Cassandra ­ DynamoDB
For Data Integrity Verification As a Blockchain Lottery
8

#RSAC
Salting a Hash
A `salt' is a unique value appended to an input value before performing the hash function, with the objective of preventing identical inputs from having identical outputs. The salt does not
need to be a secret value.
Salting is Effective Against
­ Rainbow Table Attacks ­ Mass Cracking Campaigns with Large Hash Sets
9

#RSAC
Work Factors vs. Campaign Duration

Hash Algorithm NTLM NetNTLMv2 IKE-PSK SHA1 WPA2 bcrypt

Campaign Duration 58 Minutes 23 Hours 27 Minutes 55 Hours 44 Minutes 10 Years 321 Days 291 Years 246 Days

10

#RSAC
Hashcat for Cracking Campaigns

#RSAC
Hashcat
Password Candidates -> Hashing Algorithm -> Hardware Optimizations
12

#RSAC
Generating Candidates: Hashcat Masks
Masks replace Bruteforce
­ ?s = symbol ­ ?l = lowercase ­ ?u = uppercase ­ ?d = digit
?s?u?l?l?l?l?d?d?d?d will crack `$Tiger2020'
13

#RSAC
Generating Candidates: Dictionaries and Rules
`Dictionaries' are simple wordlists
­ Extremely fast, but very minimal success rate ­ If the password doesn't match an entry exactly, it won't be recovered
`Rules' modify candidates in deterministic ways:
­ Add a symbol to the front ­ Capitalize the first letter ­ Add four digits to the end
14

#RSAC
How to Build Campaigns Wrong
"I got a hash! I should throw every wordlist and every rule file at it at the same time!"
"I got a hash, let's run it through RockYou really quick"
"I have one set of dictionaries and rule files I always use"
15

#RSAC
Using NPK for Distributed, Cloudbased Campaign Management

#RSAC
Using NPK
Demo
17

#RSAC
Using NPK

p3.16xlarge

Professional / Commercial

8x Tesla V100 GPUs NTLM @ 633 GH/s $0 Up-Front ~$176/day

8x Nvidia GTX 1080Ti NTLM @ 416 GH/s $26,000 Up-Front ~$3/day

Price Crossover:

3,468 Hours = 144 Days

Performance Crossover: 5,357 Hours = 223 Days

18

#RSAC
Challenges/Risks of Cracking in AWS
Some EC2 knowledge required
­ Internet Access, VPCs, Keys, Security Groups
Instance set-up has costs, too
­ Installing drivers & Hashcat ­ Uploading Wordlists, Rules, and Hashes
Securing Hashes/Recovered Plaintexts
­ Risk Tolerance of Sensitive Data on Third-Party Platforms ­ Persistence of Data After Campaign
Runaway Instances ­ Single p3.16xlarge instance = $24.48/hr = $17,625/mo.
19

#RSAC
Using NPK
Campaign Limits Understanding Hash Benchmarks Coverage Estimates Viewing Campaign Progress & Status Showing Recovered Hashes
20

#RSAC
Apply what you've Learned
Do the math!
­ Algorithm ­ Candidate Pool ­ Hardware Capabilities
Consider effectiveness of NPK vs. flexibility of Hashcat alone Embrace NPK for safe, low risk cracking in the Cloud
21

#RSAC
Try it out!
Deploy NPK, then:
­ Run your first campaign
Active Directory password strength assessment? Wireless password resilience?
­ Compare strength of algorithms to inform password policies
How do 12-character Windows passwords compare to 8 characters on Linux?
22

