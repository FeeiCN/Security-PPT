Ransomware detection
with Bro
Mike Stokkel 13 Sept 2016

Introduction
· Who am I? ­ Mike Stokkel ­ Security Analyst @ Fox-IT ­ Internship at Fox-IT ­ Bachelor July 2016
Introduction

Agenda
· What am I going to talk about? ­ Fox-IT ­ Ransomware ­ Bro Policy ­ Results ­ Demo

Fox-IT

Company · Located: Delft, The Netherlands · IT security
­ Managed Security Services ­ Auditing ­ Cryptographic solutions
Fox-IT

Security Operation Center · Snort-based detection · Bro
Fox-IT

Ransomware

Explanation · Malware
­ Encryption ­ Payment ­ Decryption
· Rising concern
Ransomware

Encryption · Process
­ Master key (public and private key) ­ Generating a key for the victim ­ Encrypting the victim's key
Ransomware

Impact · Personal Computer
­ Local files
· Company
­ Network Share
· To pay or not to pay?
Ransomware

Spreading Methods · Exploit Kits
­ Browser vulnerabilities
· E-mail
­ Malicious document ­ Macros
Ransomware

Exploit Kit · Version check · IP check · Download ransomware payload · Run payload
Ransomware

Malicious document · Macro · VBS script · Download & execute payload
Ransomware

Remote desktop programs · TeamViewer hack · RDP brute force
Ransomware

Detection Methods · IDS
­ Snort rules
· Problem
Ransomware

Bro Policy

Approach · Ransomware behavior
­ SMB
· Possible solutions
­ File extension listing ­ Threshold SMB commands ­ Command-and-Control communication
Bro Policy

Entropy · Randomness of data · 0 ­ 8 bits per character
Bro policy

What about .... · Compressed files · Images · PDF
· Mime/Media type
Bro policy

Functions
· SMB parser ­ Events · File over new connection · Chunk event
· SumStat ­ Threshold
· Notice.log
Bro Policy

File over new connection · Check for SMB traffic · Check for certain filenames · Check for Mime type · Check for SMB action · Check if SMB action equals Write · Add File analyzer
Bro Policy

Chunk event · Check if the offset equals 0 · Calculate entropy of data collected from SMB
write command · Use SumStat to add +1 for the threshold · Write to log file · Write a Notice.log
Bro Policy

Results

Live Testing · Two new kinds of Ransomware
Bro Policy

Live Testing
· Two new kinds of Ransomware ­ Google Chrome & Mozilla Firefox · Encrypted cache
· Encryption tools ­ TrueCrypt ­ VeraCrypt
· Documents ­ Printing ­ Creating
Bro Policy

Demo

Samples
· Locky/Zepto · Cryptowall · CTBLocker · Jigsaw (and all families) · Mobef · Shade · Maktub · Cerber/Alpha · Teslacrypt · Rokku · Crysis · Cerber · Bandarchor
Demo

Thank you for having me!

