HELP YOUR NON-SECURITY STAKEHOLDERS UNDERSTAND ATT&CK
ELLY SEARLE, LEAD CONTENT STRATEGIST

2018 CROWDSTRIKE, INC. ALL RIGHTS RESERVED.

Why we now use ATT&CK to describe
1
detections 2 How we evolved the ATT&CK mental model 3 What it looks like 4 Does it work?
2018 CROWDSTRIKE, INC. ALL RIGHTS RESERVED.

WHY WE NOW USE ATT&CK TO DESCRIBE DETECTIONS
· We got a lot of customer calls asking to explain what detections meant · Customers found our detection classifications too vague and confusing · If Falcon admins didn't grasp what detections meant, they definitely
couldn't explain to anyone else in their org what adversaries were doing
2018 CROWDSTRIKE, INC. ALL RIGHTS RESERVED.

WHAT OUR CUSTOMERS USED TO GET

Application Compromised Attacker Methodology Credential Theft Data Loss Data Deletion Drive-by Download Establish Persistence

Exploit Pivot Blocked Exploit Known Malware Malicious Document NGAV Privilege Escalation Process Terminated

Ransomware Server Compromise Social Engineering Suspicious Activity User Compromise Web Exploit Evade Detection
2018 CROWDSTRIKE, INC. ALL RIGHTS RESERVED.

WHAT OUR CUSTOMERS USED TO GET
...so we switched to ATT&CK

ATT&CK WAS BETTER, BUT STILL NEEDED SOME EXPLANATION

· Without context, it's not clear exactly what each tactic means
· Want anyone to understand what's happening, regardless of security experience
· People don't need it "dumbed down" ­ they need context
2018 CROWDSTRIKE, INC. ALL RIGHTS RESERVED.

HOW WE EVOLVED THE ATT&CK MENTAL MODEL
· Played with ways to explain concepts to someone capable of learning, but not familiar yet ­ master/apprentice
· Focused on clear, conversational words
2018 CROWDSTRIKE, INC. ALL RIGHTS RESERVED.

An adversary is trying to __________

ATT&CK tactic Initial Access
Execution Persistence Privilege Escalation Defense Evasion Credential Access Discovery Lateral Movement Collection Exfiltration Command and Control

Explain it to a non-security person Get into your environment Run malicious code Maintain their foothold
Gain higher level permissions Avoid detection
Steal logins and passwords Figure out your environment Move through your environment
Gather data Steal data Control systems

An adversary is trying to __________

ATT&CK tactic
Initial Access Execution Persistence Privilege Escalation Defense Evasion Credential Access Discovery Lateral Movement Collection Exfiltration Command and Control

Explain it to a non-security person
Get into your environment Run malicious code Maintain foothold Gain higher level permissions Avoid detection Steal logins and passwords Figure out your environment Move through your environment Gather data Steal data Contact controlled systems

Objective
Gain access Follow through (steal/break) Keep access Gain (more) access Keep access Gain access Explore Explore Follow through Follow through Contact controlled systems
2018 CROWDSTRIKE, INC. ALL RIGHTS RESERVED.

An adversary is trying to __________

ATT&CK tactic
Initial Access Credential Access Privilege Escalation Persistence Defense Evasion Discovery Lateral Movement Execution Collection Exfiltration Command and Control

Explain it to a non-security person
Get into your environment Steal logins and passwords Gain higher level permissions Maintain foothold Avoid detection Figure out your environment Move through your environment Run malicious code Gather data Steal data Contact controlled systems

Objective
Gain access Gain access Gain (more) access Keep access Keep access Explore Explore Follow through Follow through Follow through Contact controlled systems
2018 CROWDSTRIKE, INC. ALL RIGHTS RESERVED.

THE ADVERSARY IS TRYING TO OBJECTIVE BY TACTIC USING TECHNIQUE.

The adversary is trying to gain access by stealing logins and passwords using credential dumping.
The adversary is trying to keep access by avoiding detection using process hollowing.
2018 CROWDSTRIKE, INC. ALL RIGHTS RESERVED.

HOW WE VALIDATED THE EVOLVED MODEL

· Reviewed with internal experts, making sure it didn't get in their way
· Considered new labels for tactics, but loses value of standardizing
· Used UX design and research methods to integrate objectives and get feedback from customers
2018 CROWDSTRIKE, INC. ALL RIGHTS RESERVED.

FULL CONTEXT IN UI
2018 CROWDSTRIKE, INC. ALL RIGHTS RESERVED.

CONVERSATIONAL LANGUAGE IN DOCS
SCREENSHOT OF GUIDE EXPLAINING SENTENCE
2018 CROWDSTRIKE, INC. ALL RIGHTS RESERVED.

IT WORKED
Customers appreciate they can quickly explain detections to their team and management, regardless of security expertise
2018 CROWDSTRIKE, INC. ALL RIGHTS RESERVED.

WHAT WE HEARD FROM CUSTOMERS

· "If you can't explain something, you don't know what it is. I feel with these new details, I can tell them XYZ happened, please check on this exact thing."
· "We find it useful for younger analysts as well"
· "They aren't a very technical crowd ... so it's like learning that there's this whole new language that's way easier to understand and act on."
2018 CROWDSTRIKE, INC. ALL RIGHTS RESERVED.

TRY THIS AT HOME

Worksheet and cheat sheet are in the deck

Thank you!

2018 CROWDSTRIKE, INC. ALL RIGHTS RESERVED.

An adversary is trying to __________

ATT&CK tactic
Initial Access Execution Persistence
Privilege Escalation Defense Evasion Credential Access Discovery Lateral Movement Collection Exfiltration
Command and Control

Explain it to a non-security person
2018 CROWDSTRIKE, INC. ALL RIGHTS RESERVED.

An adversary is trying to __________

ATT&CK tactic
Initial Access Execution Persistence Privilege Escalation Defense Evasion Credential Access Discovery Lateral Movement Collection Exfiltration Command and Control

Explain it to a non-security person
Get into your environment Run malicious code Maintain foothold Gain higher level permissions Avoid detection Steal logins and passwords Figure out your environment Move through your environment Gather data Steal data Contact controlled systems

Objective
Gain access Follow through (steal/break) Keep access Gain (more) access Keep access Gain access Explore Explore Follow through Follow through Contact controlled systems
2018 CROWDSTRIKE, INC. ALL RIGHTS RESERVED.

