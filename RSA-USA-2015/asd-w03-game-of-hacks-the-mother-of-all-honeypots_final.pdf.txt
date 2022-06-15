SESSION ID: ASD-W03
Game of Hacks: The Mother of All Honeypots

Maty Siman

#RSAC

CTO, Founder at Checkmarx

#RSAC
Agenda
 What is Game Of Hacks?  And now really...  Discovery process  What vulnerabilities existed in the code  Which ones were detected  Conclusions
2

CISO Concerns
OWASP CISO Survey 2013 (https://www.owasp.org/images/2/28/Owasp-ciso-report-2013-1.0.pdf)

#RSAC

3

#RSAC
Game of Hacks
4

#RSAC
Game of Hacks
It all started when we noticed a group of geeks staring at a wall at Blackhat 2014

#RSAC
Game of Hacks
Something like that is what they were looking at
Find the vulnerability !

#RSAC
Game of Hacks
That got us thinking...

#RSAC
Game of Hacks
How can we leverage this behavior?

#RSAC
1+1=?
An online "spot the vulnerability" game, AKA ­ "Game Of Hacks"
9

#RSAC
Game of Hacks (GoH)
 Launched on August 2014  80,000 games were played since
10

#RSAC
What's behind GoH?
11

#RSAC
Honeypot
It was fairly safe to assume that people would try to hack the game.
https://news.ycombinator.com/item?id=8134699
12

#RSAC
Honeypot
 We might as well learn from it  Various vulnerabilities with different degrees of complexity were left
open on purpose  Each vulnerability was patched once discovered
13

Difficulty Level
Score
Question

Question #

60-Second Timer

Answers
14

#RSAC
Code Snippet

GoH Architecture

#RSAC
SERVER

CLIENT

GAME
OF
HACKS
15

#RSAC
16

#RSAC
Vulnerability Planting Process
 Use our Vulnerability planting process to detect weak points in your application.
Entities
CIA notation
(Confidentiality, Integrity and Availability)
Attack surface
Platform specific issues
17

#RSAC
Entities
 Quiz Questions  Answers  Score  Timer  User
18

#RSAC
Quiz Questions
 Client
 How to retrieve the questions from the server?  How to send the answers back to the server?  Who is responsible for randomizing the order of questions?
 Server
 How to validate the "real" client questions from a forged one?
19

#RSAC
Answers
 Client
 How to validate the answer?
 Server
 How to mark a question as "answered"?
20

#RSAC
Answered Question
 At first, users could initiate "app.sendAnswers" multiple times until they got a "correct answer" response.
 This allowed malicious users to systematically locate the correct answer ­ and to gain points over and over for the same question.
 Solution:
 "Question Already Answered" flag added
21

#RSAC
Score
 Client
 How to manage the score?  How it is calculated?  Can it be manipulated?
 Server
 How to validate the various components used to compute the score?  Where is the score is computed?  Where is the score stored?
22

#RSAC
Timer
 Client
 How to enforce the timer?  What if someone answers too quickly?
 Server
 Who should enforce and validate the timer?
23

#RSAC
Timer
The timer has two purposes:  Limit the time user is allowed to respond
 This raises a question about how to enforce time limits  Does this enforcement take place at the client side or server side?
 Score calculation
 The time it took the user to answer is part of the formula used to compute the score
 How do you transmit the time from client to server and how do you validate the values?
24

#RSAC
Timer
 On the first version of GoH, the timer was handled by the client.  If the timer went off, the user was forced to go to the next question.  The client sent the server the time it took to answer alongside the
selected answer So what...?
25

#RSAC
Timer
 As a result players were able to easily stop the timer by modifying the JS code
 We didn't expect the following:
26

#RSAC
Timer
 Score computation was (60 ­ TimeToAnswer) * DifficultyLevel  So they sent 0 to get max value  Or even negative values
27

#RSAC
Timer
 In order to fix the vulnerability, the time is now computed at the server
 Yes ­ traffic time influences that a bit
28

#RSAC
User
 Client
 How to validate user names?
 Server
 How to enforce valid user names?  What are valid user names?
29

#RSAC
Client side ­ Platform security considerations
 Client side was developed in Javascript
 XSS  Dom based
 Command Injection (Eval)
30

#RSAC
Server Side ­ Platform security considerations
 Node.js apps might be vulnerable to countless types of attacks
 Plain SQL Injection  JSON Based SQL Injection  Traceless Routing Hijacking  SSJS Injection  Weak Client Side Crypto  Etc.
31

#RSAC
Meta-Meta-Game
 Can you spot the vulnerabilities in the code?  Fix:
32

#RSAC
JSON-base SQL Injection
 Node.JS, being a JSON based language, can accept JSON values for the .find method:
 A user can bypass it by sending
· http://blog.websecurify.com/2014/08/hacking-nodejs-and-mongodb.html
33

#RSAC
JSON-base SQL Injection

 You can use the following:
db.users.find({username: username});

Then

bcrypt.compare(candidatePassword, password, cb);

34

#RSAC
JSON-base SQL Injection
db.users.find({username: username});
 This can lead to Regular Expression Denial of Service through the {"username": {"$regex": "........}}
 So always validate the input as a string, not JSON  This vulnerability was NOT detected by GoH users
35

#RSAC
36

#RSAC
Weak Crypto
 We used a weak crypto library.
 Google knows it's weak.
 Since it is used only at the client side, it is considered as less risky.
 Interesting... Node.js is server side JS based on Google Chrome (V8)
 The random generator is predictable ­ three consecutive values reveal past and future.
 Think of it as a quadric equation. With three data points you can draw the full graph.
 There wasn't any specific vulnerability. Just weaknesses. We were interested to see how they would be exploited. We are not aware if any were actually exploited.
37

#RSAC
It wasn't all a walk in the park
 There were some "attacks" we didn't expect and we had to handle in real time.
 Some were not technical but more "branding" oriented.
38

#RSAC
Bots
 After we fixed the issues we discussed earlier, people developed bots that just guessed answers
 At the end of the day, there are 4^5 = 1024 options, so there is a chance of 1023/1024 of getting at least one answer wrong. (or 1/1024 to get it all right)
 There is 50% chance to get an "all-good" game if you try 708 times  (1023/1024)^708 ~= %50
 The bots answered questions in a fraction of a second, so they always achieved the highest score possible
39

#RSAC
Bots
 Some taught their bots the correct answers
40

Bots

#RSAC
We added a single captcha if a question was answered in less than a second
41

#RSAC
Offensive Language
 People played a lot to eventually get to the leader board and share their life philosophy
 We had to manually approve every leaderboard entry
42

#RSAC
Conclusions
 Make you own custom made Honeypot to learn more about hacker techniques
 Plan well and design what exactly you are interested in watching  Prepare for the unexpected. Super-fast response.
43

#RSAC
Apply
 The methodology we used to analyze the application can be used by you to protect your assets
 In your next project ­ follow this process to find weak points in your application
 Build a top-down chart of the various components  Describe the entities managed by the components
 For each entity, describe the relevant risks. Break down by CIA (Confidentially, Integrity and Availability)
 Describe the inputs and outputs of each component  Describe unique risks each of the used technologies exposes
 Scan your code regularly!
44

#RSAC
Thank you
Maty Siman | Founder & CTO at Checkmarx Maty at Checkmarx dot com
45

