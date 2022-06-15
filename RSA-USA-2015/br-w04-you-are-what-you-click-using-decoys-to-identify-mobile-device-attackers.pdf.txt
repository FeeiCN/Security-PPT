SESSION ID: BR-W04
You are what you click: Using Decoys to Identify Mobile Device Attackers

Dr. Salvatore J. Stolfo
Professor Columbia University Intrusion Detection Lab New York, NY

Joel Peterson
Researcher, Columbia University & Software Systems Researcher Allure Security Technology New York, NY

#RSAC

#RSAC
The old ways don't work....
It's not what you know (twice), it's what you do....

#RSAC
Age of Collaboration

#RSAC
"Anywhereization"

#RSAC
Rise in BYOD
 2 billion smartphone users projected for 2015  61% of employees use smartphones for work

#RSAC
Enterprise is borderless...and vulnerable
 Devices carry sensitive corporate data:
 59% of employees using BYOD haven't told their employers
 Lost or stolen:
 113 smart phones lost every minute  1 laptop is stolen every 53 seconds
 Mobile security fails:
 34% of consumers fail to activate security mechanisms on their mobile devices

Security should be designed for the

#RSAC

people who use it

 Easy to understand controls

 Transparent to the user

 Seamless and continuous authentication

#RSAC
Are you you?
 With patented machine-learning technology, RUU learns how you use your device and creates a personalized behavioral profile that continuously and seamlessly authenticates.
 If unusual behavior is detected, it's prompted to ask, "Are you you?"

#RSAC
What are decoys?
Beacons
 Enticing, believable but bogus data, documents, files, and other types of fake bur realistic media
 Touch a decoy and send a beacon alert signal
Here's how it works

#RSAC
What's the difference?

Document is beaconized

Beaconized Document

Data Loss

#RSAC
Data Loss Alert

#RSAC
Touch a decoy file, a data loss alert is emailed
XXX.XXX.XXX.XXX

#RSAC
Enticing decoy files in the cloud, too!
One is real, the others aren't ­ Can YOU tell?

#RSAC
The Hypothesis
 We all search uniquely on our own machines....that is a user biometric captured by a behavior model computed by a machine learning algorithm.
 Decoys are a powerful tool to detect intruders who do not know the real content of a target victim's file system.
The two together detect masqueraders and provide accurate active and continuous authentication.

#RSAC
(Sidebar: Decoys can also be used to detect...)
 Hackers who hijack sessions from other legitimate users  Embedded APT actors whose malware behaves abnormally  But, let's return our attention to Active and Continuous Authentication
of users...
15

Phase 1

#RSAC

DARPA Active

Authentication - Desktop

#RSAC
DARPA Phase 1 Goals
BAA
Broad Agency Announcement
ÇCÇ

#RSAC
RUU Baseline Architecture
Authenticating User Learning User Search Behavior User Actions

Initial baseline scientific user study of

#RSAC

accuracy of modeling user behavior

 Model baseline Volunteer Human Subject behavior; detect deviations from normal use. Generative model: inference, prediction, clustering, sampling, etc.
 Behavior biometrics: set of measurements on interactions between the Volunteer Human Subject and the system.
 Biometrics measurements based on OS events caused by Volunteer Human Subject action:
 Process creation, deletion, manipulation.  File creation, deletion, renaming, etc.  Process window touches.  Registry key creation, manipulation, deletion.
 Four minute sliding window of measurement used.
 RUU1 dataset: 18 Volunteer Human Subjects at Columbia University, measured over the course of five weeks. Captured in 2011. RUU2 and RUU200 datasets delivered Sept 2013.

#RSAC
Fisher Linear Discriminant Analysis

#RSAC
Accuracy Improvements ... choose wisely
Accuracy over the initial RUU dataset. GMM model with Fisher features, improved accuracy and faster.

#RSAC
True Positive Rate increases with training
Accuracy improves over time. As more data is observed, the accuracy of the user's model improves. And...

#RSAC
False Positive Rate Decays, too...
Maintaining and improving model performance over time is an important goal. Continuous learning methods work well.

Phase 2 ­ Desktop

#RSAC

Sensor Improvements

Automatic Decoy Placement

Larger formal user study to

detect masqueraders
2244

#RSAC
RUU Host Sensors

Phase 1

Phase 2

 Volunteer Human Subject data acquisition uploaded to server for analytics and performance bundled with Decoy Document Distribution
 Identify most discriminating features  Measure decoy touch behavior

 Volunteer Human Subject data acquisition on local host for automatic analysis and active authentication with mitigation strategy, also bundled with Decoy Document Distribution
 Continuous learning  Automate Decoy Placement  Self-measurement of performance  Re-authentication strategies

RUU Sensor Identity Engine ­ 10 Dimensions works well

#RSAC

Learns User Search Behavior and OS-level Behavior Modeling

Multidimensional behavior measurements

Process activity

Gaussian Mixture Model. Trained automatically

Ten dimensions in real model
26

#RSAC
RUU Decoy Distribution
 How to deploy decoys in scale throughout an organization?
 Manual placement
 Tedious  Requires survey of
Volunteer Human Subject habits
 Alternative approach
 Distribute via an automated application
 Decoy Document Distributor (DDT)

#RSAC
Decoy Document Distributor (DDT)
 Fetches decoys from server

#RSAC
DDT Analyzes User's file system
 Automatic deployment of decoys to strategic file locations

#RSAC
RUU Average Decoy Touch Rate of real user
 Most decoy touches are caused by initial deployment.
 Curiosity decays rapidly!

Masquerader Detection Accuracy with user

#RSAC

models and decoys: Average ROC

Optimal

RUU models vs. masquerader data. Influential factors: masqueraders used "smash and grab." (They didn't play games.)

Accuracy of detecting masqueraders over time #RSAC is consistently high
Human subject activities are scaled as a percentage of capture progress (0%100%). Average performance across all users.

Accuracy translated to detection latency ­

#RSAC

users emit observables at different rates

Experiment
 Overall Average Attacker Detection Across All Users
 160 Users  1 week average capture period

Time until detection (TTD) given evaluation frequency for a 40-hour work week.

Frequency

Total Samples

FP Req.

Acc.

Evals

TTD

1m

2400

0.042%

49.55%

5

5m

2m

1200

0.083%

50.29%

5

10m

3m

800

0.125%

51.46%

5

15m

4m

600

0.167%

53.11%

4

16m

5m

480

0.208%

54.00%

4

20m

 Evaluation interval: 3 minutes
 Active authentication corresponds to Bernoulli trial: Probability that masquerader evades detection in 5 consecutive evaluations is less than 5%.
 Detection within 15 minutes with 95% confidence

Experiment Results
 95% detection accuracy at 1% false positive rate  Constraint: 1 FP per 40 hour work week
 Fifteen minutes until detection with 95% confidence

#RSAC
Discussion ­ user model alone works, too

Masquerader ID and number of decoy touches by masquerader

 Masqueraders had higher than normal volumes of activity; exhibited "smash and grab" behavior

 10 decoys were distributed randomly on the test environment

 Nearly every masquerader touched several decoys, didn't matter where they were placed

  Some touched no decoys, but were still detected



Masquerader detection even without decoy touches!

#RSAC
What about mitigation?
What do you do when you detect a masquerader?
 De-authenticate and challenge the user to re-authenticate
 This also provides an opportunity to update and improve the user model, ground truth is revealed
 Several possible re-authentication strategies, here's one...

RUU Secondary Authentication:

#RSAC

When Desktop Locks

Secondary Authentication
 Time-based One-time Password Algorithm for secondary authentication (RFC 6238)

When installing RUU the user is prompted to enable secondary
authentication

Google Authentication running on an iPhone as the authentication
agent

When RUU locks and the user re-authenticates the secondary
authentication is requested

36

Monitoring and displaying RUU Sensor Performance: #RSAC System Monitoring in scale for BYOB Management
Monitoring Allure System Performance
Using internal pipeline, we can create monitors for different components and visualize them instantly
37

mRUU ­ Mobile Phones

#RSAC

Decoy Apps

Decoy Clouds

3388

#RSAC
mRUU Study
IRB-Approved User Studies
 January 2014: Pilot study
 Preliminary Activity Collector  Users gathered from Accenture and Columbia University  Used to inform modeling approach
 July-August 2014: Full scale user study with 53 Accenture users
 Fully developed activity collector
 More efficient  Collection of auxiliary activity data
 Used for final Identity Engine design and accuracy analysis
39

#RSAC
mRUU Study Results
Participant Upload Distributions
40

#RSAC
mRUU Update
Sensor Updates
 Implemented Identity Engine using adapted modeling technique which incorporates:
 Activity hotspots  Temporal information  Location information
41

#RSAC
mRUU Location Based Modeling of User App Behavior
Location Based Sub-Modeling
42

#RSAC
Accurate Modeling of user app behavior
Modeling where you use Apps is very accurate

mRUU Study Results- classification accuracy

#RSAC

with no FP

Application Usage Model Accuracy

 Behavior eval every 2 min  4 hours total = 120 Evals/day  Goal: 1 FP/day = 0.00833

False-Positives per day
1 2 3 4

Percent of Foreign behavior identified
62% 70% 78% 80%

44

#RSAC
mRUU Study Results
Contact List Accuracy When contacts list accessed Ineffective ­ too few samples
45

#RSAC
mRUU User Study
Conclusions
 Users' mobile application usage habits can successfully be used to derive behavioral biometric identifiers
 The discriminative power of application usage patterns can be augmented using temporal and geographic information
 Additional usage data (eg contacts, etc.) provides poor discriminative measurements
46

#RSAC
Introducing Decoy Apps and Decoy Clouds
 The mobile RUU app automatically creates decoy apps from unused apps or downloads strategic decoy apps
 Masqueraders are herded to pre-positioned decoy file system and decoy cloud services when they fail to re-authenticate

#RSAC
Under the Hood
 Bad Behavior or Touching of decoy apps de-authenticates the user
 Locks the device  Captures a picture of the current user and records background
ambient sound  Sends an alert out of band to the user  Re-authenticates by a second factor
 Failure: Load Decoy Clouds and Decoy file system  Capture data on attacker

#RSAC
Decoy Apps are intuitive
 Authentic looking apps that hold fake but enticing information to the adversary
 An attacker does not know what is a Decoy App and what is a Real App
 They are simple to use  They are simple to understand  They do not increase resource use

#RSAC
Bloatware is turned into a Security Feature
Numerous Unused Apps available as decoys

Onboard unused apps become decoys or

#RSAC

strategic decoy apps are installed

#RSAC
Who do you really bank with?
One is real, the others aren't ­ Can YOU tell?

#RSAC
Which is your real email client?
One is real, the others aren't ­ Can YOU tell?

#RSAC
Who is Your Cloud Provider?
One is real, the others aren't ­ Can YOU tell?

#RSAC
Which is your real corporate VPN?
One is real, the others aren't ­ Can YOU tell?

#RSAC
Which is your real Facebook?
One is real, the others aren't ­ Can YOU tell? Note: 2-D Passcode!

#RSAC
Recall, enticing decoy files in the cloud, too!
One is real, the others aren't ­ Can YOU tell?

#RSAC
How do we do it?
Create Decoys

#RSAC
Any app is easily converted into a decoy
1. Unpack and disassemble .apk file. 2. Copy decoy functionality classes
into assembly code folder 3. Insert code into original classes to
run decoy functionality 4. Insert permissions for decoy
functionality into manifest file 5. Reassemble and repack .apk file.

#RSAC
Touch a decoy app, the phone locks and alerts
Lock & Alert Lock & Alert

#RSAC
...includes location, picture & recording

#RSAC
Sample Decoy App email alert

Have we offered sufficient gifts to the demo gods?
#RSAC
Demonstration

Alternative Unlock strategy, challenge the user, #RSAC the phone knows your most recent behavior
With whom did you last chat?
John Public Jane Doe Bill Jones None of the Above

#RSAC
Answer wrong, try once more
What city did you last visit?
Philadelphia New York Menlo Park None of the Above

#RSAC
Answer wrong again...
Configurable mitigation strategies
Brick the phone Upload tracking data Unlock and Load a decoy file system Alert Security Personnel

#RSAC
DARPA Sponsorship
 DARPA ADAMS ­ Anomaly Detection at Multiple Scales
 Insider threat
 DARPA Active Authentication
 Masquerader/Impersonator threat
 $10 Million of research support, transitioned from Columbia University IDS Lab to Allure Security Technology

#RSAC
The Research Team

Sal Stolfo

Malek Ben Salem

Jon Voris

Yingbo Song

Joel Peterson

Shlomo Hershkop

#RSAC
Apply What You Have Learned Today
 Next week you should:  Review corporate security policy for BYOD  Identify the number of employee phones stolen or compromised  Measure how many employees have no security controls on their devices
 In the first three months following this presentation you should:  Measure employee mobile access to critical corporate infrastructure  Evaluate corporate access and authentication controls  Explore a deployment strategy for advanced mobile authentication
 Within six months you should:  Identify and deploy solutions to protect employee mobile devices

#RSAC
Thank you...
 Resources and contact
 www.cs.columbia.edu/ids  www.alluresecurity.com
http://www.channelpronetwork.com/article/Mobile-Device-Security-Startling-Statistics-on-Data-Loss-and-Data-Brea http://transition.fcc.gov/bureaus/oet/tac/tacdocs/meeting12414/TAC-MDTP-Report-v1.0-FINAL-TAC-version.pdf http://mashable.com/2012/11/08/smartphone-theft-city/

