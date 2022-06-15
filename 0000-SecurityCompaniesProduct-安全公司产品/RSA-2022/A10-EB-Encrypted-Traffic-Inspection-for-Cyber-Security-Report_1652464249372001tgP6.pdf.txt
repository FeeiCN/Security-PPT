Encrypted Tra c Inspection for Cyber Security

Modern malware and ransomware attacks have become a big issue for enterprises. Many organizations rely on encryption for protection against these attacks. However, encryption is meant to o er privacy, and only acts as a false sense of security. If these enterprises aren't decrypting their tra c, malware attacks can hide behind encryption and make their way into otherwise secure networks, undetected.

Pulse and A10 Networks surveyed 200 technology leaders to find out how their companies are thinking about decryption solutions.

Data collected from June 18 - July 3, 2021

Respondents: 200 technology leaders

Web traffic inspection is an important line of defense against likely cyberattacks, but encryption may be leaving networks vulnerable
With cyberattacks becoming easier and cheaper to launch, it's no surprise that 80.5% of technology leaders consider cyberattacks at their organization likely.

HOW LIKELY IS IT THAT YOUR ORGANIZATION HAS BEEN THE VICTIM OF A CYBERATTACK OR MALICIOUS
INSIDER ACTIVITY IN THE PAST 12 MONTHS?

6.5%
Very likely

24.5%
Moderately likely

49.5%
Somewhat likely

16%
No, it is unlikely
3.5%
No, and I know with complete
certainty

93.5% of technology leaders say their company inspects more than 10% of their web tra c for attacks, intrusions and malware.
WHAT PERCENTAGE OF YOUR COMPANY'S TOTAL WEB TRAFFIC IS INSPECTED FOR ATTACKS, INTRUSIONS AND MALWARE?

16%
51% to 75%
33%
76% to 100%

22.5%
26% to 50%
22%
10% to 25%
6%
Less than 10%
0.5%
None

More than half of respondents (51.5%) cite that over 50% of their company's web tra c is encrypted.
USING YOUR BEST ESTIMATION, WHAT PERCENTAGE OF YOUR COMPANY'S WEB TRAFFIC IS ENCRYPTED TODAY?

30%
76% to 100%

21.5%
51% to 75%

32.5% 10.5%

2.5%

26% to 50% 10% to 25% Less than 10%

0.5%

2.5%

None I am not sure

Widespread adoption of encryption standards like TLS 1.2 has been driven by companies like Google ranking websites that are encrypted higher than the ones that aren't. We see this percentage going higher in the future as standards like TLS 1.3, QUIC and HTTP/3 are widely adopted.

Almost all of the technology leaders (97.5%) in this survey were concerned about encrypted communications leaving their network vulnerable to threats that could bypass existing security solutions by hiding in TLS/SSL tra c. With more than 50% of the tra c being encrypted, as shown above, this concern is very rational.
HOW CONCERNED ARE YOU THAT ENCRYPTED COMMUNICATIONS WILL LEAVE YOUR NETWORK VULNERABLE TO HIDDEN THREATS THAT ARE ABLE TO
BYPASS EXISTING SECURITY SOLUTIONS BY HIDING IN TLS/SSL TRAFFIC?

7.5%
Very concerned
58%
Moderately concerned

2.5%
Not at all concerned
32%
Somewhat concerned

Decryption is essential to inspect TLS/SSL traffic but lack of resources and privacy concerns hold some back

The majority of respondents (73%) think that the inspection of TLS/SSL tra c is moderately or very important to their company's overall security infrastructure.

HOW IMPORTANT IS THE INSPECTION OF TLS/SSL TRAFFIC TO YOUR COMPANY'S OVERALL SECURITY INFRASTRUCTURE?

17.5%
Very important
55.5%
Moderately Important
25.5%
Somewhat important
1.5%
Not important

With the recent spike in encrypted malware and ransomware attacks and increasing awareness of the role encryption plays in cyberattacks, perceived importance of inspecting TLS/SSL tra c is expected to rise.

But, one in five respondents (20%) do not decrypt web tra c to detect attacks, intrusions and malware. This can lead to the creation of an encrypted blind spot where malware can make it through the network defenses undetected.

DOES YOUR COMPANY DECRYPT WEB TRAFFIC TO DETECT ATTACKS,
INTRUSIONS AND MALWARE?
59%
Yes

20%
No
21%
I'm not sure

Where web tra c is not decrypted for inspection, the most common reason is privacy concerns about inspection (30%).
IF YOUR COMPANY DOES NOT INSPECT DECRYPTED WEB TRAFFIC, WHY NOT?

20%
Insu cient resources
30%
Privacy concerns about inspection

20%
Lack of enabling security tools
20%
Not considered a priority
10%
Performance degradation

Since encryption and decryption are CPU-intensive processes, organizations that decrypt their web tra c often face performance degradation issues. 80% of technology leaders note that decrypting TLS/SSL tra c during the inspection process causes performance degradation of varying degrees.
WHEN YOUR COMPANY CURRENTLY DECRYPTS TLS/SSL TRAFFIC DURING THE INSPECTION PROCESS, HOW MUCH
PERFORMANCE DEGRADATION DOES IT RESULT IN?
48%
Some degradation

28.5%
Moderate degradation
3.5%
Significant degradation

8%
No performance degradation
7%
I am not sure
5%
Not currently decrypting SSL tra c today

An ideal decryption and inspection solution proves ROI, is secure, highly scalable, and meets compliance requirements
The top methods for decrypting and inspecting encrypted tra c are commercial platforms that utilize deep packet inspection (56%), security solutions, like NGFWs, with decryption added as a secondary feature (56%), and commercial platforms that utilize metadata (55.5%).
HOW DOES YOUR COMPANY INSPECT DECRYPTED TRAFFIC?

56%
Commercial platform that utilizes deep packet inspection

55.5%
Commercial platform that utilizes metadata

56%
Security solutions with decryption added as a secondary feature

28%
Homegrown tra c monitoring systems

16.5%
Manual inspection process

9.5% We don't inspect decrypted tra c

Security solutions with decryption as a secondary feature are not designed for handling these compute-intensive processes. This can subject devices to high levels of performance degradation, which creates performance bottlenecks in the network. Additionally, organizations that rely on more than one security solution, e.g. NGFWs, IPS, DLP, AV solutions etc., must conduct the decryption and re-encryption processes in a distributed way, on each solution separately, in order to gain full tra c inspection and visibility. As a result, they will add lag to the network tra c and deteriorate user experience.
A dedicated, centralized TLS/SSL inspection solution, on the other hand, is primarily designed for decryption of encrypted tra c at high scale. These dedicated inspection solutions can feed the decrypted tra c to multiple security solutions within the security infrastructure and limit degradation.
56.5% of tech leaders utilize dedicated TLS/SSL inspection solutions for the decryption of their network's encrypted tra c.
DOES YOUR COMPANY OWN A DEDICATED TLS/SSL INSPECTION SOLUTION WHERE THE PRIMARY
FEATURE IS DECRYPTION OF ENCRYPTED TRAFFIC?

56.5%
Yes

30.5%
No

?13%
Unsure

Beyond the ability to decrypt tra c, tech leaders cited the ability to securely manage SSL certificates and keys (63.5%), to satisfy compliance requirements (62%), and to scale to meet current and future SSL performance demands (61%) as the top selection criteria for potential TLS/SSL inspection solutions.
IF YOU WERE TO INVEST IN A TLS/SSL INSPECTION SOLUTION, WHAT WOULD BE YOUR SELECTION CRITERIA OTHER THAN DECRYPTION OF TRAFFIC?

Securely manage SSL certificates and keys
Satisfy compliance requirements
Scale to meet current and future SSL performance demands
Ease of use
Centralized management and visibility
Interoperate with a diverse set of security products from multiple vendors
Intelligently route tra c to security devices based on user,
application, or website type
Categorize tra c with automated URL service so sensitive data remains encrypted
Granularly parse and control tra c based on custom-defined
policies
Other 1%

63.5% 62% 61% 57.5% 51.5% 39% 33% 32.5% 21%

However, many organizations still have concerns or limitations when it comes to dedicated decryption solutions. Of those who do not have a dedicated solution, the top reasons are a high up-front cost (49%), unconvincing ROI (36%), and lack of in-house expertise or sta (34%).
WHY DO YOU NOT OWN A DEDICATED TLS/SSL INSPECTION SOLUTION?
49%

36%

34%

33%

28%

11.5% 11.5% 10%

Up-front cost too
high

Not convinced of the ROI

Lack of Not wanting Privacy Lack of Not a priority Lack of

in-house to add concerns performance

features

expertise complexity to about

or sta the network inspection

5%
Other

Although the initial investment in a dedicated decryption solution may seem steep, the cost of encrypted malware and ransomware attacks or data breaches can be exponentially higher.
In addition to the direct financial damages, encrypted cyberattacks can cause lost productivity due to deteriorated performance and user experience, brand damage, compliance breaches and the associated penalties, as well as potential lawsuits by disgruntled customers.
Modern cyberattacks are becoming increasingly sophisticated, easier, and cheaper to launch with each passing day. It is essential that technology leaders have the most e ective defensive solutions and strategies in place to stay ahead of these attackers and to protect against the ever evolving cyber threat landscape.

Respondent Breakdown

North America 85%

REGION

APAC 1%

C-Suite 31.5%

TITLE
Director 39%

VP 17.5%

Manager 12%

EMEA 14% COMPANY SIZE

10,001+ employees

39.5%

1,001 - 5,000 employees
31%

29.5%

5,001 - 10,000 employees

Insights powered by

