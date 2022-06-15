SESSION ID: SPO2-T07
99 Security Tools and You Still Got Breached?

Matt Chiodi
Chief Security Officer, Public Cloud Palo Alto Networks @mattchiodi

Sandy Wenzel
Consulting Engineer, SecOps Palo Alto Networks @malwaremama

#RSAC

#RSAC
Outcome
Explain why "Best of Breed" ain't workn'
­ Promise not to kill you with stats
Apply the 80/20 rule to Cybersecurity
­ Impress your boss and colleagues ­ Actually reduce risk
Demonstrate actionable steps to rationalize your security portfolio
2

#RSAC

#RSAC
Lockheed Martin Cyber Kill Chain

Weaponization

Exploitation

Command &

Reconnaissance

Delivery

Installation Control Exfiltration

#RSAC
Point Products Are Killing Us

1980's

1990's

First AV

First Firewall

First IDS

Defense in Depth

2000's

2010's

First CASB

First NGFW

First Container Security

5

2020's
First ??
Intrusion Kill Chain 15 ­ 20 Tools (S) 50-60 Tools (M) >130 Tools (L)

#RSAC
Layered Defense: Why It Worked
6

#RSAC
Pepperidge Farm Remembers...
7

The Hidden Costs of Point Products BUY SOMEONE TO TIE IT ALL TOGETHER BUY A POINT PRODUCT INTEL PERSON

BUY IT

BUY SOMEONE TO MANAGE

#RSAC
ACTUAL COST

#RSAC
Survey Time!
60
40
80
100+

When people say:
"I liked your art/book/play. It was different."

#RSAC
They really mean:
"It was weird and I didn't like it."

#RSAC
What we say: 46% consider effectiveness of a cybersecurity product the most important criteria

#RSAC
What we actually do: Only 8% buy security products with integration and shared intelligence with other controls as their #1 priority

#RSAC
"Simple can be harder than complex: You have to work hard to get your thinking clean to make it simple. But it's worth it in the end because once you get there, you can move mountains." - Steve Jobs

#RSAC
"EVERYTHING SHOULD BE MADE AS SIMPLE AS POSSIBLE, BUT NOT SIMPLER." --EINSTEIN

#RSAC
What we say: 54% only purchase best-of-breed if they are designed for broader integration

#RSAC
What we actually do: 46% buy best-of-breed products regardless of the product's ability to integrate with other security technologies

IAM

Endpoint Security

Application Security

Cloud Security

Data Security

16

#RSAC
Breach Stats: BoB Ain't Workn'
17

"We're facing 21st century issues, discussing them in 20th century terms, and proposing 19th century solutions."
- Tom Wheeler, former Chairman of the FCC

#RSAC
Who Was Vilfredo Pareto?
Italian engineer, sociologist, economist, political scientist, and philosopher. Found 85% of wealth in Milan was owned by 15% of citizens. Observed 80% of Italy's land was owned by 20% of the people.
1848 - 1923
19

#RSAC
What Does the Pareto Principle Actually Say?
Investopedia: "[the Pareto Principle] specifies an unequal relationship between inputs and outputs. The principle states that 20% of the invested input is responsible for 80% of the results obtained. Put another way, 80% of
consequences stem from 20 percent of the causes."

The vital few

Effort 20%

The trivial many

80%

Results 80% 20%

20

#RSAC
80/20 Cybersecurity
Australian Cyber Security Centre (ACSC) claims that when implemented effectively, the Essential Eight mitigates 85% of targeted cyber-attacks. Center for Internet Security (CIS) claims CIS-20 defeat 80% of common attacks.
21

#RSAC
80/20 Driveway Shoveling
Could have taken 30+ minutes Spent 10 Driveway 100% accessible

#RSAC
Applying the 80/20 Rule: NIST vs. ACSC

NIST 800-53r4
965 controls 20% of 965 = 193 80% of 965 = 772

8 controls

23

#RSAC
Applying the 80/20 Rule: NIST vs. CIS-20

NIST 800-53r4
965 controls 20% of 965 = 193 80% of 965 = 772

CIS-20
149 sub-controls

24

"Security is a process, not a product."
­ Bruce Schneier (April, 2000)

#RSAC
Step 1: Inventory Existing Security Tools
Create a spreadsheet that lists out all tools Why was it originally purchased? (find the RFP) Quantify investments with major vendors Document features actively used vs. available How does it share threat intelligence?
26

#RSAC
What Your Tools Inventory Might Look Like...

#RSAC
Step 2: Create a Tools Coverage Map
Determine your critical coverage categories (CIS-20, Essential 8, etc.) Analyze how well each tool covers the category Be amazed with how much overlap you have
28

#RSAC
Tools Coverage Map Might Look Like This...

#RSAC
Step 3: Compile and Categorize Your List of Incidents
Work with your SOC/IR team Create or utilize existing set of actions (or use DBIR's) Track the following for each action:
­ Number of occurrences ­ Percentage of total ­ Cumulative percentage
30

Your Actions Might Look Like...2018 DBIR Top 20

# Action 1 Use of stolen credentials (hacking) 2 RAM scraper (malware) 3 Phishing (social) 4 Privilege abuse (misuse) 5 Misdelivery (error) 6 Use of backdoor or C2 (hacking) 7 Theft (physical) 8 C2 (malware) 9 Backdoor (malware)
10 Pretexting (social) 11 Skimmer (physical) 12 Brute force (hacking) 13 Spyware/keylogger (malware) 14 Misconfiguration (error) 15 Publishing error (error) 16 Data mishandling (misuse) 17 Capture app data (malware) 18 Export data (malware) 19 SQLi (hacking) 20 Password dumper (malware)
Total

Number

Percentage of Actions 399 312 236 201 187 148 123 117 115 114 109
92 74 66 59 55 54 51 45 45 2602

Cumulative Percentage 15.30% 12.00%
9.10% 7.70% 7.20% 5.70% 4.70% 4.50% 4.40% 4.40% 4.20% 3.50% 2.80% 2.50% 2.30% 2.10% 2.10% 2.00% 1.70% 1.70%

15.30% 27.30% 36.40% 44.10% 51.30% 57.00% 61.70% 66.20% 70.60% 75.00% 79.20% 82.70% 85.60% 88.10% 90.40% 92.50% 94.60% 96.50% 98.30% 100.00%

31

#RSAC

#RSAC
Pareto Analysis of the 2018 DBIR Top 20

18.00%

11 out of 20 actions (55%) cause nearly 80% of the issues12.0.00%

16.00%

14.00%

The vital few

12.00%

100.00% 80.00%

10.00% 8.00%

60.00%

6.00%

40.00%

4.00% 2.00%

20.00%

0.00%

0.00%

Percentage of Actions

Cumulative Percentage

32

#RSAC
Step 4: Map Security Portfolio to Your Vital Few Does it
spark joy?
33

#RSAC
Your Vital Few Mapping Might Look Like...

Make Your Move

#RSAC
Leveraging the Power of the Platform
First ~30 Days
­ Read The 80/20 Principle by Richard Koch, take a ton of notes ­ Meet with all cyber team leads and begin inventory of tools in use (buy list too)
Within ~60 days
­ Expand tools inventory with risk statements and incident #'s ­ Get really clear on how your tools are integrated--or not
Within ~90 days
­ Map to your vital few and present to your major vendors ­ Create plan moving to ~80% single vendor ­ Develop game plan qualifying your ~20% best-of-breed
36

