Your Program Is Awesome, Now Prove It
Masha Sedova, Co-Founder

Workshop agenda

 Intro to the problem  Understanding our risks  Data gathering conversations  Understanding the data  Break out into groups  Program planning time  Come back for read-out

30min
40min 20min

The Story

Each group of 4-5 people are all security team members of the same fictional company Sandalwood Forum.

The Challenge
The company's new leadership has prioritized managing employee risk as a top initiative in the next year. They've asked the team for a presentation on a key initiative of their choosing.
In order to get program sign-off and budget, leadership has asked for a data-driven approach presentation answering:
 Why this initiative was chosen  How we will measure its impact

What critical business problem should our program solve?

Security Operations Center

State of Security at Lighthouse Company
Reasons for incidents over the last 3 years

50%
Phishing

43%
Password Security Compromises

38%
Malware Infections

25%
Other

21%
Mishandling Sensitive Data

10%
3%

Privilege Abuse

Physical

Source: VDBIR 2020

An Incident is more likely to occur if an employee makes more bad security decisions.
An Incident is less likely to occur if an employee makes a more good security decisions.
...But what is a security decision?

Mapping Incidents To Their Underlying Behaviors

Decisions That Lead to Phishing Incident
 Do I click on this link?  Do I type in my
credentials?  Should I report this to my
security team?

Decisions That Lead to Password Compromises
 Do I click on this link?  Do I type in my
credentials?  (Prior) Do I use a
password manager for this site?  (Prior) Do I turn on 2fa for this site?

Decisions That Lead to Malware Infection
 Do I click on this link?  Do I open this file?  Do I run this even if its
from an unknown source?  (Prior) Should I snooze
this security update request?

Data sets that can help us understand which decisions are happening in our company

Phishing Compromise

Password Compromises

Malware Infection

 Simulated Phishing data  Real-world Phishing data  Reporting data

 Simulated Phishing data  Real-world Phishing data  Password Manager
adoption  MFA Adoption stats

 Simulated Phishing data  Real-world Phishing data  Malware infection data  Patching Status

Security Engineering

Pull data from tools you already have
Real World Phishing

Phishing Simulations Reporting

Employee Security Decisions

HR/Directory Data

MFA Adoption

Device Security/Patching Status Malware Password Manager

Pull data from tools you already have
Real World Phishing

Phishing Simulations Reporting

Employee Security Decisions

HR/Directory Data

MFA Adoption

Device Security/Patching Status Malware Password Manager

HR Data

Person Id 33652 32291

Manager Id Last Name First Name

Email

Start Date

24113 90968

Keller Rojas

Laura Linda

LauraKeller@sa ndalwood.org

3/8/14

LindaRojas@sa ndalwood.org

7/30/17

Department Work Location Geo

Engineering

AMER

Marketing

APAC

Title

Is Manager?

Engineering Executive

YES

Marketing Manager

YES

Is Active?
YES
YES

Malware

Person Id 33652 90968 16268

Email
LauraKeller@sandalwood.org
DeborahBrown@sandalwood. org
MarciaBaker@sandalwood.or g

Date 11/14/19 10/28/19 5/27/19

Event_Type Downloaded
Installed Blocked

Device_ID Laura's Macbook Deborah's Macbook Marcia's Macbook

IP_Address 34.120.88.252 143.195.84.150 88.33.255.227

Password Manager

Person Id 24114

Email
JamesJohnson@sandalw ood.org

Has Installed? YES

Is Active? YES

Account created? 8/4/19

Date 8/7/19

MFA
Person Id 24114 18581

Email
JamesJohnson@sandalwood.o rg
MonicaContreras@sandalwood .org

Installed? YES YES

Type Token SMS

Date enabled 9/30/17 4/1/19

Phishing

Phishing campaign id person_nid

219553

90968

email

status

DeborahBrown@sandal wood.org

Email Sent

send_date 4/1/19

modified_date 4/1/19

219553

90968

DeborahBrown@sandal wood.org

Email Opened

4/1/19

4/11/19

219553

90968

DeborahBrown@sandal wood.org

Reported

4/1/19

4/12/19

181119

28245

JessicaStewart@sandal wood.org

Email Sent

6/30/19

6/30/19

181119
Reporting
181119 person_nid
90968

28245

JessicaStewart@sandal wood.org

Email Opened

28245

JessicaStewart@sandal wood.org

Clicked Link

sender_email

send_date

DeborahBrown@sandalwood.o rg

4/1/19

6/30/19

7/5/19

6/30/19

7/6/19 message_subject

This is a suspicious email...

details
Payload1231944820941576062 5514694173878264310
4
Payload1231944820941576062 5514694173878264310
4
Payload1231944820941576062 5514694173878264310
4
Payload2444503224361362201 1207075668871003687
4
Payload2444503224361362201 1207075668871003687
4
Payload2444503224361362201 1207075668871003687
4

Tools for analysis

The Setup
1. Break out into groups of 4-5 people 2. Introduce yourselves to each other! 3. As a group, pick one key risk to focus on: Phishing, Password compromises, or Malware Infection 4. Obtain the necessary data sets +HR file for your area of risk focus (link in slack) 5. Run analysis on your data sets to understand trends in employee behavior in your org 6. Use your trend analysis to recommend a program

The Deep Dive
Once you have the data set, use it to figure out how to focus your program. Here are some questions you may want to answer.
 What is my organization's worst behavior today? Which has been getting worse over time?  Which geography is my weakest? Which is my strongest?  Who are my top performers? Who have consistently been my top performers?  Who are my stragglers?  How many risky managers do we have?
Use this data to provide program recommendations. Here are just a few examples:  Which region to run more security awareness activities next october.  Who needs more targeted training and on what topic  Who would make good participants in the champion program  Which execs need greater support

Preparing the presentation
At the conclusion of your analysis, prepare a presentation to the C-suite of Sandalwood answering the following:
 What risk (phishing, malware, passwords) you are focusing on  What behaviors/security decisions you are tracking  What insights you found in the data  How you are going to shape your program using the answers from the data  Who you needed to partner with going forward to track your progress on this program  What are your next steps to prove ROI on their program and get more funding/support?

Stuck? Questions?
@mention me on slack with your question, or your zoom breakout room # and we will drop in.

Q&A
Feedback survey:
sansurl.com/secaware-eval-day1
Ask your questions in Slack:
#workshop-masha-sedova

