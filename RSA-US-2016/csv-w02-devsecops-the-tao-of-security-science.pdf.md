CSV-W02
DevSecOps - The  of Security Science
#RSAC

Scott C. Kennedy
Security Scientist/Manager SSFTI Cyber Security Team - Intuit

#RSAC
What is Tao? ?
Not a name for a `thing'
An underlying natural order of the universe Hard to grasp, easy to see.
 = Radical  (go forward/walk/walking) +  (head)
Loosely understood as a concept of...
A road, way, path, or route
The way one goes somewhere
Or a doctrine, principle
The way one does or believes something
All quotes used in this text box are from The Complete Tao Te Ching Translated by Gia-fu Feng and Jane English, Vintage Books, 1989

#RSAC
How does this relate to IT/Security?
"The world is ruled by letting things take their course, it cannot be ruled by interfering." - Tao Te Ching (chapter 48)

#RSAC
Which works better? DevSecOps?
"Nothing is more soft and yielding than water, yet for attacking the solid and the strong, nothing is better." - Tao Te Ching (chapter 78)

#RSAC
What is DevSecOps?
Agile discipline ­ Rugged Ops for Security Best of each security specialty in one framework Value provided to the business as security services Make it easy for business to take the right risks Reduce friction and disruptions with developers Continuous improvement mindset
"In dealing with others, be gentle and kind. In speech, be true. In ruling, be just. In daily life, be competent. In action, be aware of the time and the season. No fight: No blame. " - Tao Te Ching (chapter 8)

The Innovation Race

Hope nothing catches up with
us...

Sigh...by the time I get to the finish
line, I have to start all over again

Security: did you see something fly by?

"The softest thing in the universe, Overcomes the hardest thing in the universe." - Tao Te Ching (chapter 43)

Security: if only they'd engage us
sooner...

#RSAC

#RSAC
Step Zero: Establishing DevSecOps Principles
1. Customer focused mindset
2. Scale, scale, scale
3. Objective criteria and analysis
4. Proactive hunting & RedTeaming
5. Continuous detection & response
"If I have even just a little sense, I will walk on the main road and my only fear will be of straying from it. Keeping to the main road is easy, but people love to be sidetracked." - Tao Te Ching (chapter 53)

#RSAC
The Arts/Wushu of DevSecOps

DevSecOps

Security

Security Compliance

Engineering Operations Operations

Security Science

Experiment, Automate,
Test

Hunt, Detect,

Respond,

Contain

Manage, Train

Learn, Measure, Forecast

"Empty yourself of everything. Let the mind become still. The ten thousand things rise and fall while the Self watches their return. They grow and flourish and then return to the source." - Tao Te Ching (chapter 16)

#RSAC
Security Science?
· From F.U.D. to facts · Science is a fact-based examination
Theories established Testable against real data Revised and retested as the landscape changes...
Question -> Hypotheses -> Experiment -> Analyze -> Repeat
· Answers simple questions
"Knowing ignorance is strength; ignoring knowledge is sickness." - Tao Te Ching (chapter 71)

#RSAC
Examples of Security Science

What is your Password policy? Why?
With an attacker with a budget of $10,000, we ought to set our minimum length to 12 characters if we rotate our Linux passwords every 90 days.

How frequently do you need to patch/restack to avoid CVSS > 5.0?
With the Amazon RHEL image, historically it's been every 5.3 days. With our smaller base RHEL image, historically it's been 10.5 days.

Minimum Length of password vs. algorithm used to store it safely?

MD-5

= 19 characters against a $10,000 attacker budget

SHA-512 = 11 characters against a $10,000 attacker budget

Bcrypt

= 8 characters against a $10,000 attacker budget

"The truly great man dwells on what is real and not what is on the surface." - Tao Te Ching (chapter 38)

#RSAC
Explain that password thing some more?
With a budget of $10,000, what can an attacker do?
79.362 billion MD5 hash attempts per second 2.2362 billion SHA-512 hash attempts per second
With that performance, the attacker can brute force WE WANT YOU TO JOIN SCIENCE! EVERY SINGLE UPPER, lower, 0-9, & special character password Up to 8 characters in length within 3 hours Up to 10 characters in length within 3 years
Probability of cracking just ONE password that is not rotated?
"Seeing the small is insight; Yielding to force is strength. Using the outer light, return to insight, and in this way be saved from harm. " - Tao Te Ching (chapter 52)

#RSAC
How to start Security Science?

Look at your company.
What questions need answers?
Theorize a solution
How do you think to solve this?
Gather data to investigate.
What sources do you need? What are you missing? How to get it?

We keep getting Phished!

Can Training Help?

Server Logs

Phish Users

Analyze data to confirm/dispute
Was your assumption, correct?
"Perseverance is a sign of will power. He who stays where he is endures." - Tao Te Ching (chapter 33)

Did Phish training reduce phishing
success?

#RSAC
How we started to find our own problems.
Previously, established a Red Team to help elevate security issues
Rules of engagements were "Act like an attacker" but "Don't break the company"
Where to start?
Production hosts? Development systems? Custom 0-days?
Red Team phished our own security teams!!!
Had a very well crafted phish to mimic internal processes
"Ruling the country is like cooking a small fish. Approach the universe with Tao, and evil is not powerful, but its power will not be used to harm others. " - Tao Te Ching (chapter 60)

#RSAC
Phishing ourselves taught us...
Achieved 54% click through rate, with Security Professionals! Women are 25% more likely than men to click 1/3 tested will click on a link, access a site and enter details, even when they suspect it is suspicious Existing security awareness/phishing training campaigns did not prevent this Need to better socialize "Red Team" actions
"In caring for others and serving heaven, There is nothing like using restraint. Restraint begins with giving up one's own ideas." - Tao Te Ching (chapter 59)

#RSAC
Where else can we use more Science?
"Knowing others is wisdom; Knowing the self is enlightenment. Mastering others requires force; Mastering the self needs strength. He who knows he has enough is rich. " - Tao Te Ching (chapter 33)

#RSAC
How to fix the lack of security spend?
Scoring/Grades are powerful motivators
Consistent and defensible scoring is a must!
Allows the Dev leader to drill down to answer
Why am I failing? Where am I using that?
"A man is born gentle and weak; at his death he is hard and stiff. Green plants are tender and filled with sap; at their death they are withered and dry. Therefore, the stiff and unbending is a disciple of death; the gentle and yielding is a disciple of life." - Tao Te Ching (chapter 76)

#RSAC
Use Models to guide away from mistakes
How do the decisions I make affect my grading scores? How frequently do I have to restack? What is the impact of package choices?
Ruby or Python? MySQL or Postgres? Apache or Nginx?
"The farther you go, the less you know. Thus the sage knows without traveling; He sees without looking; He works without doing." - Tao Te Ching (chapter 47)

#RSAC
Security Science can provide ...
Insights to steer policy creation Understanding to drive adoption Development goals to "move the needle" Analysis of existing data to uncover new "truths"
"A good walker leaves no tracks; A good speaker makes no slips; A good reckoner needs no tally. A good door needs no lock, yet no one can open it." - Tao Te Ching (chapter 27)

The Innovation Race redux
Woah... what happened to my advantage?
Woohoo!!! Now we're innovating at
speed!!
"If I have even just a little sense, I will walk on the main road and my only fear will be of straying from it." - Tao Te Ching (chapter 53)

#RSAC

#RSAC
Apply What You Have Learned Today
Next week you should:
Join the DevSecOps Community via LinkedIn and Twitter. Start looking at how your company makes decisions in security.
In the first three months following this presentation you should:
Choose a security science experiment to run in your organization. Build a platform to collect the data to support/refute your experiment.
Within six months you should:
Have a foundational data platform that supports basic security science decisions Begin to provide results from your experiment
he pursuit of learning, every day something is acquired. In the pursuit of Tao, every omething is dropped. Less and less is done, until non-action is achieved. When ng is done, nothing is left undone." - Tao Te Ching (chapter 48)

#RSAC
Tie It Together: =path to understanding
Security needs to switch from "NO!" to "Know!"
Run your own experiments and test your hypotheses
Share with your colleagues and customers.
For more information on DevSecOps http://DevSecOps.org http://linkedin.com/grp/home?gid=6817408 http://github.com/devsecops http://twitter.com/devsecops
For more quotes from the Tao Te Ching http://terebess.hu/english/tao/gia.html
d binding requires no knots, yet no one can loosen it. Therefore the sage takes care men and abandons no one. He takes care of all things and abandons nothing." - e Ching (chapter 27)

