SafeMind
A Framework for Evaluating and Patching the Human Factor in Cybersecurity
Ron Bitton
Principal Research Manager Cyber Security Research Centre Ben Gurion University of the Negev

1. Social engineering attacks goes beyond phishing
2. Social engineering attacks are no longer limited to PCs.

Portable Media

Phishing

Drive-by download

Passwords Cracking

Social Engineering

Permission Abuse

Client-side Scripts

Certificates Abuse

Trojan Applications

Social engineering attacks have changed in recent years.

1. Social engineering attacks goes beyond phishing
2. Social engineering attacks are no longer limited to PCs.

Smartphones

Social Networks

Social engineering attacks have changed in recent years.

1. Social engineering attacks goes beyond phishing
2. Social engineering attacks are no longer limited to PCs.

The skills needed by a user to mitigate different types of attacks are not the same.

Social engineering attacks have changed in recent years.

1. Social engineering attacks goes beyond phishing
2. Social engineering attacks are no longer limited to PCs.

Despite those changes, most existing solutions do not distinguish between different types of attacks and platforms.

Social engineering attacks have changed in recent years.

Evaluation

Mitigation

Self-Reported Measures

Attack Simulations

Training Workshops

Reducing attack surface

Interviews, surveys Simulated phishing

and questionnaires

attacks.

Security awareness training workshops

Email protection, System hardening, Browser isolation

Existing solutions for evaluating and patching the human factor in cybersecurity

§ Based on self reported measures. § Require the subjects' active involvement and collaboration.
Interviews, surveys and questionnaires

§ Based on self reported measures. Tend to be subjective and biased.
§ Require the subjects' active involvement and collaboration. Consuming significant human resources and therefore are less scalable and cannot be performed continuously.
Interviews, surveys and questionnaires

§ Measure the momentary behavior of subjects during specific event. § Limited to phishing.
Attack simulations

§ Measure the momentary behavior of subjects during specific event. Sensitive to environmental and contextual factors and therefore can be very biased.
Cannot be used to evaluate the ISA of users continuously. § Limited to phishing.
Cannot be used to evaluate the ISA of users to different attack vector.
Attack simulations

§ Usually performed using videos, games and posters in a controlled training environment.
Security awareness training workshops

§ Usually performed using videos, games and posters in a controlled training environment. Does not necessary reflects the behavior of users in their natural environment.
Low user engagement to the process of learning
People tend to learn the most from critiques on their own behavior, rather than generic training programs.
Security awareness training workshops

§ Prevents specific exploitation techniques but leaves the vulnerability unpatched.
§ Mostly limited to specific environments (e.g., a user's working environment)
Email protection, System hardening and Browser isolation

§ Prevents specific exploitation techniques but leaves the vulnerability unpatched. The attacker can exploit the vulnerability using other exploitation techniques, which are not covered by the countermeasure.
§ Mostly limited to specific environments (e.g., a user's working environment) Cannot be used to protect the user in other environments (e.g., when working from home).
Email protection, System hardening and Browser isolation

An automated and framework for continuously and objectively evaluating the resilience of users to specific types of social engineering attacks.
SafeMind

SafeMind

The critical success factors in the development of SafeMind

What are the criteria for a security aware user?

1

ANALYZE What are the importance of different criteria in

mitigating different types of attacks?

2

MONITOR

Given a user, how we evaluate those criteria continuously, and objectively?

3 TRAIN

Given a vulnerable user, how we make a behavioral change that will last long

01
Exploring social engineering attack case studies

02
Identifying the technologies that are compromised by the attacker

03
Enumerating the countermeasures that can be used to protect these technologies

04
Identifying the human factor vulnerabilities that are exploited by the attacker

05
Formulating the criteria required from a user to mitigate the attack.

Defining the criteria for a security aware user

The criteria for a security aware user

Application

Browsing

Virtual Communication

ü Download apps solely from trusted sources.
ü Does not install apps that require dangerous permissions.
ü Does not install apps with a low rating.
ü Rarely installs apps that require root privileges.
ü Regularly update
apps. ü Rarely clicks on
advertisements. ü Properly manages
running/installed apps. ü Does not install unsinged applications

ü Does not enter malicious domains
and operates in accordance with security alerts. ü Prefer to use HTTPS sites.
ü Prefers to download files via HTTPS.
ü Does not send sensitive information via HTTP.
ü Does not insert private information into popups or advertisement cites.
ü Deletes unknown
certificates. ü Does not use
untrusted certificates.

ü Does not open emails/messages received from unknown senders
ü Does not open emails classified as spam.
ü Does not execute attachments received from unknown senders.
ü Does not click on URL's received from unknown senders.

Virtual Accounts

Safeguards

ü Updates passwords regularly.
ü Use unguessable and diverse passwords.
ü Does not store passwords unsafely.
ü Uses two-factor authentication mechanisms.
ü Uses password management services.

ü Uses embedded security systems.
ü Uses antivirus application.
ü Updates security systems.
ü Operates in accordance with security alerts (i.e., does not ignore security alerts).
ü Uses PINcode/pattern/
fingerprint.

Physical Channels
ü Does not connect to unencrypted Wi-Fi networks
ü Does not download files on unencrypted Wi-Fi networks.
ü Uses VPN services. ü Does not transmit
private data via unencrypted channels. ü Enables Bluetooth, Wi-Fi, NFC, and GPS only while they are in use. ü Connects trusted Bluetooth and NFC devices. ü Does not connect unknown media to your device.

Deriving the importance of different criteria in mitigating different types of attacks

The different awareness models

Application Installation

Phyisical Channels

1

0.8

Network

0.6

0.4

0.2

0

Security Systems

Application Handling Browser

Application Installation

Phyisical Channels

1

0.8

Network

0.6

0.4

0.2

0

Security Systems

Application Handling Browser

Data Privacy Operating System

Account Virtual Communication

Man-in-the-middle Attacks

Phishing Attacks

Data Privacy Operating System
Application-based attack

Account
Virtual Communication
Password-based attacks

Browser Technologies
· B4 ­ Does not send sensitive info via HTTP
· B7 ­ Does not insert private info on unvalidated websites
· B6 ­ Deletes unknown certificates from the device
· B8 ­ Does not approve unknown certificates
· B9 ­ Does not ignore security alerts

B11 B10 B9

B1
1 0.8 0.6 0.4 0.2
0

B2 B3 B4

B8 B7

B5 B6

Man-in-the-middle Attacks

Phishing Attacks

The critical success factors in the development of SafeMind

What are the criteria for a security aware user?

1

ANALYZE What are the importance of different criteria in

mitigating different types of attacks?

2

MONITOR

Given a user, how we evaluate those criteria continuously, and objectively?

3 TRAIN

Given a vulnerable user, how we make a behavioral change that will last long

Given a user how can we evaluate those criteria?

Endpoint Solutions

Network-based Solution

Attack Simulations

Information extracted using the endpoint solution

Connectivity Management

Physical Channels

Certificate Management

Installed Applications

Password Management

SMS

Security Settings

Mail Activity
Social Network Activity

Information extracted using the network solution

Application Level Protocols
· Detecting OS update version · Certificate handling

Deep Packet Inspection
· Detecting personal information transmitted in plaintext
· Detecting unencrypted file downloads

Domain Categorization
· Detecting installed applications · Detecting malicious websites · Detecting pop-ups and ad clicks · Detecting uses of security countermeasures · Detecting downloads from untrusted stores

Smartphones

Attack simulations
PC

Social Networks

Short Demo ­ Application Phishing Simulation

Operator's Dashboard

Emploee's Smartphone

§ A long-term experiment involving 162 subjects, for a duration of seven weeks.
§ During the experiment we: Ø Monitored the network traffic of the subjects. Ø Measured their behavior while operating their smartphone and PC. Ø Asked them to answer the security questionnaire. Ø Exposed the subjects to four social engineering attacks.
Evaluation Method

Results

§ The self-reported behavior of subjects might differ significantly from their actual behavior.
§ Security awareness scores derived from data collected by endpoint and network-based solutions are highly correlated with the users' success in mitigating social engineering attacks.
Conclusions

Thank you!

Ron Bitton
Principal Research Manager Cyber Security Research Centre at Ben Gurion University of the Negev

This talk was partially based on the following two academic papers:
[1] Ron Bitton, Andrey Finkelshtein, Lior Sidi, Rami Puzis, Lior Rokach, Asaf Shabtai: Taxonomy of mobile users' security awareness. Computers & Security 73: 266-293 (2018).
[2] Ron Bitton, Kobi Boymgold, Rami Puzis, Asaf Shabtai: Evaluating the Information Security Awareness of Smartphone Users. 2020 CHI Conference on Human Factors in Computing Systems.

Kobi Boymgold
Security Researcher Cyber Security Research Centre at Ben Gurion University of the Negev

Andrey Finkelsthein
Data Scientist & Security Researcher at IBM

Lior Sidi
Data Scientist & Machine Learning Entrepreneur Cyber Security Research Centre at Ben Gurion University of the Negev

Asaf Shabtai
Associate Professor Cyber Security Research Centre at Ben Gurion University of the Negev

Rami Puzis
Assistant Professor Cyber Security Research Centre at Ben Gurion University of the Negev

Lior Rokach
Full Professor Cyber Security Research Centre at Ben Gurion University of the Negev

