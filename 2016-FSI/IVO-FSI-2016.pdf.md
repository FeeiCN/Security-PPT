A good security architecture can kill online fraud

Objective
...to show you how to avoid single-point-of-failures (SPOFs) and prevent fraud
What is a single-point-of-failure? One place, which compromises the whole security if hacked.

What's behind most fraud online? ..... a fundamentally broken nature of identity online...

US government approach to this problem: sneaky surveillance

Chinese government approach to this problem: Real ID online

What's needs to be done to kill fraud?
1. Identity: Our learnings from fixing the online identity 2. Communication: Applying the principles to security of TLS

Why should you even listen to me?
ADUCID (The world's most advanced authentication system)
Our background:
· > 20 years of experience in IT security · We helped shape the standard for digital identities in the European Union
Our products:
· 10 years of unique research in authentication & secure communication · 7+ million USD in direct investments · 7+ international patents · several rounds of penetration tests without a single relevant weakness

Reliant on users Physical ID online

PASSWORDS HAVE SOOO MANY PROBLEMS...

Copying identities

Centralization

Lack of mutual trust

Credentials reuse

Static protection Reliant on HTTPS

Having weak passwords

& writing them down

Pass

1234

Pass

1234

Malware

Web keyloggers

Phishing calls & social engineering

Snoopers & thieves of SSL certificates

Exploit bad employees

Cloud servers

Steal all IDs from a single database

Government backdoors?

Credentials are reused

Man-in-the-middle & phishing

EACH OF THEM REPRESENTS A SINGLE-POINT-OF-FAILURES

Reliant on users Physical ID online

HOW TO SOLVE THESE PROBLEMS?

Copying identities

Centralization

Lack of mutual trust

Credentials reuse

Static protection Reliant on HTTPS

2 key design principles & 6 main tools:

1. Remove the people from security

2. Fix the architecture instead of "plugging holes"
· Separate cyber IDs · Asymmetric cryptography · Mutual trust · Distributed design · Dynamic protections · Dual authentication

REMOVE USER

How much of security do users handle?

1. Create strong passwords

2. Never reuse passwords 3. Change password frequently

Can any person do all that?

4. Make sure communication is secure

5. Recognize fake websites & phishing 6. Recognize fake calls or fraudsters

Who should be doing that?

7. Make sure all apps, systems and devices are up-to-date

8. Fight against viruses

9. NEVER EVER make a mistake

Physical world

REMOVE USER

Online world

I don't handle security
... I just have my device

My app handles security

The app handles reliably all the security actions for the users

REMOVE DEVELOPER & ADMIN
Developers and admins must never make a mistake in...
... and they have to face a huge number of attack vectors

Expertise

REMOVE DEVELOPER & ADMIN

Narrowly specialized experts stand the best chance against hackers

typical hacker

pwnage gap

pwnage gap

expert coder

ITsec admin

fullstack coder
range of skills

Physical world

REMOVE DEVELOPER & ADMIN

Online world

I don't handle security
... I just have my device

My app handles security

Security as a service

Security should be developed by experts & work as a service

SEPARATE CYBER IDs
Why is it a problem to use physical identity online?
 1.2
3 factors in physical world (I know, I have, I am) ... but only 1 online (I know)
 What do you do when somebody steals your fingerprint or face scan?

Top 100 Case Studies Of The Years

It's expensive to recover (e.g. issue a new payment card)

Physical IDs have a low entropy

Physical IDs limit privacy

Physical ID is bound to be reused

w w w .top100s ummit.c om

Physical world

PHYSICAL & CYBER IDs

Online world

I have my device Physical ID: Ivo Toman

My app handles security
Cyber ID: 6F_j7+hl$ps&6aF3^9f;k?fs dK97jkJ975u....R.;'u&5dh8 K3l;9asd-k)*2@'',96&(8o3

Your physical ID cannot be misused online. Your cyber ID cannot be misused in physical world.

Would you give the credit card and walk away?

 1.3

Would you give the driving license and drive away?

Top 100 Case Studies Of The Years
w w w .top100s ummit.c om

... but that's exactly what you do online today when you enter your password, face-scan or payment card info....

Top 100 Case Studies Of The Years

w w w .top100s ummit.c om

After

how

many

days

from

a

security

breach

do

Asian

companieSstuddiiesscTOoofpvT1he0e0rYCeaasr

e s

that they have been hacked?

A typical Western company discovers a breach after ~200 days A typical Asia company discovers a breach after ~500 days

w w w .top100s ummit.c om

Physical world

ASYMMETRIC IDs

Online world

I have my device Physical ID: Ivo Toman

My app handles security
Cyber ID: 6F_j7+hl$ps&6aF3^9f;k ?fsdK97jkJ975u....R.;'u &5dh8K3l;9asd-k&(8o3

Cyber IDs are asymmetric and never leave user's hands. No hack on server or communication can compromise user's cyber ID

Is this service who it claims to be?

Phishing Man-in-the-middle

FRAUD Is this user who she claims to be?

Theft of user's identity

Physical world

MUTUAL TRUST

Online world

I have my device

Asymmetric cyber ID My app handles security
Server must authenticate to the App

No user or App proves its identity until the server proves its identity the user/App. AND! This is HTTPS independent and largely quantum resistant.

Distributed architecture is like internet, with no single point of failure

Physical world

DISTRIBUTED MODEL

Online world

I have my device

Asymmetric cyber ID
My app handles security
Server must authenticate to the App

Different user has her device

No key is ever reused

No master key, no reuse of keys, no single point of failure, all automatic

Physical world

USER CENTRIC UX

Online world

I have my phone

My app handles security
Server must authenticate to the App

and my laptop
Absolute user simplicity. Ultimate network security. Foundation of accountability.

Are the Apps/devices a single-point-of-failure for individual users?
what should we do about it?

Local locks or data encryption?
still a single-point-of-failure bad for user experience bad for recovery process static protection reliant on the user

What about specialized HW chips, smartcards or USB keys?
Maginot line 

thehackernews.com/2016/07/hacking-android-encryption.html

Physical world

DYNAMIC PROTECTIONS

Online world

Sandboxing & protections by OS

Multi-level HW footprint

Window of opportunity limited by the user's next login
Sharing of security events between services

Dynamic protections make misuse very hard

We need a security solution, which:
· is dynamically enforced · dynamic in time · not limited by user's abilities · never stores secret on the device · cannot be stolen from the server
Sounds impossible?

Physical world

DUAL AUTHENTICATION

Online world

1. PIN 1234

3. Encrypt #2

1-way functions

4. Decrypt #2

2. App translates PIN into 3141592 ....9937510582

5. Self-encrypt 3141592 ....9937510582
into

6. Forget all the secrets except of ...

c3Pobb8.........r2d2 1-way
function

Factors are never stored and never sent.

Their "cyber ID" (#2) can change over time. Only the server can evaluate the correctness of a factor.

Weak passwords & writing them down Prone to online & call phishing
Credentials reuse
Every login creates a copy of ID
Malware
Anyone who knows any ID can enter
All IDs in a database
Easy to crack stolen passwords Snoopers & thieves of SSL certificates
Man-in-the-middle

THE MOMENT OF TRUTH

Remove user

Separate cyber IDs

Asymmetry

Mutual trust

Distributed Dynamic design protections

SCORE 3x

4x

2x 2x 2x

2x 2x 2x

3x

2x

Do you ever visit these pages?

What's the problem?

Any more problems? Awesome. Our victims are taught to get phished :)

These must be anomalies and the worst possible examples, right?

Configuration score (overall)
B

HSTS

HPKP

C+

C+

C

C

F

F

F

F

F

F

F

F

Case in point: Can you spot any way how you would break it?

Theft of the master key

Certificate authorities

Man-in-the-browser

Men-in-the-middle & phishing

Fooling the user

HTTPS/SSL
A copy of SSL private key
Theft of multiple SSL keys

Content delivery networks (CDNs)

The SPOF root-causes

Reliant on users Centralization

Static protections Lack of mutual trust

Web or corporate
servers
SSL private key
Theft of individual SSL key
Credentials reuse

Physical world

CASE IN POINT: HTTPS/SSL

Online world

I have my device

My app handles security

No user actions (or mistakes)
Mutual authentication builds end-to-end trust CDkeenisytrtratihbliezufattetidonar&chcirteedcteunretiaplsrerveeunstes mass scale
Completely avoids Certificate Authorities and never re-uses the same SSL key

Compromised connection

Regular HTTPS connection

Weak passwords & writing them down Prone to online & call phishing
Credentials reuse
Every login creates a copy of ID
Malware
Anyone who knows any ID can enter
All IDs in a database
Easy to crack stolen passwords Snoopers & thieves of SSL certificates
Man-in-the-middle

THE MOMENT OF TRUTH v2

Remove user

Separate cyber IDs

Asymmetry

Mutual trust

Distributed Dynamic design protections

Score 3x 4x 2x 2x 2x 2x 2x 2x 32x 2x

Electronic payments Electronic signatures

Centralization Reliant on users Credentials reuse Lack of mutual trust
Centralization Reliant on users Credentials reuse

Copying identities Physical ID online Static protection
Copying identities Static protection

`

Multi-party operations (e.g. online elections, real ID verification etc.)

Accumulation of weak-points of the individual transactions

Separate cyber IDs

Reliant on users

`

Blockchain distributed

Asymmetry

Credentials reuse

database & smart contracts

Distributed design

Lack of mutual trust

Conclusions:
· Systematically identify single-point-of-failure · Use following tools:
· Remove people from security (especially users and developers) · Separate cyber IDs · Asymmetry · Mutual trust · Distributed design · Dynamic protections · Dual authentication · These measures can be transferred to solutions of different problems

