SESSION ID: HT-R03
Anatomy of Phishing Campaigns: A Gmail Perspective

Nicolas Lidzborski
Gmail & G Suite Security Engineering Lead

Ali Zand
Google Anti-Abuse Research team

#RSAC

Phishing 101

Is phishing still a thing?

Hello! We reviewed your account and decided a compatible account for for the instagram rules and we wanted to give you a verified badge. () Eligible send us your real name Username, and password we can send you a verified badge. http://verifiedteam.0fees.us
Thank you, The Instagram team.

Phishing is actually prolific and effective!

Gmail sees over 100M phishing emails per day!

Successful Hijacking

7%
Credential Leaks

12%
Keyloggers

25%
Phishing

Source: Data breaches, phishing, or malware?: Understanding the risks of stolen credentials

Phishing is a global issue!

Attackers use IPs from variety of countries

Targets are everywhere

Source: Google

Components of a phishing campaign

Target website Target users Email templates

Email sending infrastructure Credential exfiltration website People managing operation

Open-source Phishing Campaign Engine

Phishing Success Overview

% of Success 100
80 60 40 20
0 Jan 2018

Feb 2018

Mar 2018

Apr 2018

May 2018

Jun 2018

Jul 2018

Email Sent
82%

Email Opened
8%

Links Clicked

Submitted Data

6%

5%

Source: gophish dashboard

Campaigns are small and short lived
250 phishing emails per campaign 12 minutes campaign half life (median)

The three guards

Delivery Vector

Target User

Target Service

Defeat the Delivery Vector
Email is accepted

Defeat the User
User interacts with phishing email
Your account is blocked.
CLICK HERE

Defeat the Target Service
Stolen authenticator logs in the phisher (ie. bank)

Defeat the Delivery Vector
Email is accepted

Anti-Phishing Infrastructure

Clustering

Reputation analysis Content understanding

Feature reputation

Feature Extraction

192.168.0.1

domain.org

192.168.0.x

xxxx.tld

http://www...

Name / domain spoofing
Feature Extraction "G00gle Tech Support" support.google.com.phish.org

G00gle
Match

Visual similarity
Match

Harnessing AI to keep the bad out

How to defeat ML?
Evasion
Make attack a moving target

Evasion: simple cloaking by IP subnet and domains

deny from paypal.com deny from 112.2o7.com deny from firefox.com deny from apple.com deny from zeustracker.abuse.ch deny from virustotal.com deny from adminus.net deny from aegislab.com deny from alienvault.com deny from antiy.net deny from avast.com deny from team-cymru.org deny from eset.com deny from fireeye.com deny from microsoft.com deny from kernelmode.info deny from malwaredomainlist.com deny from wilderssecurity.com deny from eset-la.com deny from blogs.eset-la.com

Evasion: block by user agent

if(in_array($_SERVER['REMOTE_ADDR'],$bannedIP)) { header('HTTP/1.0 404 Not Found'); exit();
}
if(strpos($_SERVER['HTTP_USER_AGENT'], 'google') or strpos($_SERVER['HTTP_USER_AGENT'], 'msnbot') or strpos($_SERVER['HTTP_USER_AGENT'], 'Yahoo! Slurp') or strpos($_SERVER['HTTP_USER_AGENT'], 'YahooSeeker') or strpos($_SERVER['HTTP_USER_AGENT'], 'Googlebot') or strpos($_SERVER['HTTP_USER_AGENT'], 'bingbot') or strpos($_SERVER['HTTP_USER_AGENT'], 'crawler') or strpos($_SERVER['HTTP_USER_AGENT'], 'PycURL') or strpos($_SERVER['HTTP_USER_AGENT'], 'facebookexternalhit') !== false) { header('HTTP/1.0 404 Not Found'); exit; }

How to defeat ML?

Evasion
Make attack a moving target

Deception
Make ML and user see different things

Deception: Human Perception vs Machine

How to defeat ML?

Evasion
Make attack a moving target

Deception
Make ML and user see different things

Confusion
Trick the user to provide ML with misleading data

Confusion: fake affinity via reply
To cancel the termination request reply to this mail.

Confusion: fake affinity via reply

How to defeat ML?

Evasion
Make attack a moving target

Deception
Make ML and user see different things

Confusion
Trick the user to provide ML with misleading data

Defeat the User
User interacts with phishing email

Your account is blocked.
Update your credit card information
CLICK HERE

Attention is a limited capacity resource

How to fool users?

Habits
Safe and Familiar

Pressure
Embarrassment and Fear

Vanishing Reward
Limited opportunity

Familiar user interface
Source: Twitter @tomscott

Technical support reaching out

Using embarrassment or fear

Thanks from X-rated
X-rated <team@xrated.com>
THANKS FOR SHARING
X-rated now has automated video sharing to your social media account
Thanks X-rated Decline Sharing
No need to share your videos to your friends and family ever again because this new revolutionary sharing feature does it for you! Automatically!

Credential leaks for sextortion

Hi, stranger!
I know the password123, this is your password, and I sent you this message from your account. If you have already changed your password, my malware will be intercepts it every time.
You may not know me, and you are most likely wondering why you are receiving this email, right? In fact, I posted a malicious program on adults (pornography) of some websites, and you know that you visited these websites to enjoy (you know what I mean).
While you were watching video clips, my trojan started working as a RDP (remote desktop) with a keylogger that gave me access to your screen as well as a webcam.
Immediately after this, my program gathered all your contacts from messenger, social networks, and also by e-mail.
What I've done? I made a double screen video. The first part shows the video you watched (you have good taste, yes ... but strange for me and other normal people), and the second part shows the recording of your webcam.

Service interruption...

Dear Customer,
Thank you for choosing XXXXXX.
We are currently upgrading our server to give you the best of our service. We require you to upgrade your account details to avoid service being interrupted. A separate confirmation e-mail will be sent with your contract terms and conditions once your upgrade has been successfully processed.
For more details please log in to your XXXXXX Control Panel:
http://cp.xxxxxxxxx.com.nevs.net.au
Sincerely,
Sebastian Gonzalez XXXXXXX Head of Customer Service

... with ironic anti-phishing training

Entice you with the promise of a prize...

...and ask nicely for your bank credentials

The life of a message

Attachment download

Sync

Message open

Link click

Delivery

Reply
Reclassification

External Website Send

Delivery

Delivery

Sync

Attachment download

Message open

Link click

Reply

Reclassification

External Website Send

Sync
Delivery

Sync

Attachment download

Message open

Link click

Reply

Reclassification

External Website Send

Message open

Delivery

Sync

Attachment download

Message open

Link click

Reply

Reclassification

External Website Send

Big and obvious warning banners

This message seems dangerous

Message open: warning banners

Re: Security Banner Design
Charlie Samuel <csamuel@frdesign.cx>

This message seems dangerous

The sender's account may have been compromised. Avoid clicking links, downloading attachments, or replying with personal information. If you Know the sender, consider alerting them (but avoid replying to this email).

Report

Looks Safe

Reclassification

Delivery

Sync

Attachment download

Message open

Link click

Reply

Reclassification

External Website Send

Phishing locality: co-worker warning via outbreak banners

Link click

Delivery

Sync

Attachment download

Message open

Link click

Reply

Reclassification

External Website Send

Suspicious Link Warning

Suspicious Link Warning

Real Time Check

Reply
Delivery

Sync

Attachment download

Message open

Link Click

Reply

Reclassification

External Website Send

Out of Domain Warning

Defense in depth

Reject
Delivery

Sanitize
Sync

Warning banners Restricted actions
Message open

Antivirus check Preview
Attachment download
Suspicious prompt
Link click
Safe browsing check

Reply
Out of domain warning

Reclassification
Deep Scanning

External Website Send

Look ahead for malicious remote content

Protect against domain and employee spoofing

Defeat the Target Service
Phisher using the stolen authenticator

User Normal workflow
Hacker Hijacker workflow

Sign In

Challenge

Sign In

Challenge

ALLOW

SUCCEED

Can't Continue DENY
???
VICTIM

Attackers are adapting

RSA
SecurID

225 646

Phisable 2FA

Mobile Platforms

Monitor for unusual activity Use second factor Use phishing resistant authentication

Faking user geolocation/ browser configuration
Phish for second factor
Use a different attack method

Raising the bar

FIDO U2F tokens

Make it mandatory and phishing resistant for employees

Apply what you learned today

Build defenses in depth

Use phishing resistant solutions

Apply domain specific defenses

Monitor unusual activity on accounts

Takeaways: next week

 Ensure your outgoing emails are all strongly authenticated (DKIM, DMARC).
 Use a password manager and 2FA.

Takeaways: over the next 3 months

 Start plan for phishing resistant 2FA solutions for all employees.
 Enable advanced security options for incoming emails.

Takeaways: over the next 6 months

 Investigate Brand Indicators for Message Identification (BIMI).
 Investigate FIDO2 for service auth.

Questions?
https://safety.google | https://cloud.google.com/security

Thanks.
https://safety.google | https://cloud.google.com/security

