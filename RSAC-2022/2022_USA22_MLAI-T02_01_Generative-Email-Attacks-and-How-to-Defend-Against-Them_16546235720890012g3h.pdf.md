#RSAC

SESSION ID: MLAI-T02
Generative Email Attacks and How to Defend Against Them

Ben Murdoch ML Engineer at Armorblox

Prashanth Arun Head of Data Science at Armorblox

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
The Growing Threat of BEC
Language, Personas, Webpages as Threat Vectors

#RSAC
Why is email security important?
4

#RSAC
Top Attacks by Victim Loss
source: ic3.gov annual report 2021
5

#RSAC
Language in Business Email Compromise
Credential Phishing
6

#RSAC
Language in Business Email Compromise
Brand Impersonation
7

#RSAC
Language in Business Email Compromise
VIP Impersonation
8

#RSAC
Language in Business Email Compromise
Financial Fraud
9

#RSAC
Language in Business Email Compromise
Fake Receipts
10

#RSAC
Generating Text
Recent Progress in text generation

#RSAC
Old School Text Generation

Template

Output

12

#RSAC
Text Generation is getting better and better

#RSAC
General Purpose Text Generation using GPT-3
What is Neural Text Generation?
14

#RSAC
GPT-3 Training Data (The Pile)
Composition of the Pile by Category - Academic, Internet, Prose, Dialogue & Misc >800GB

PubMed Central

ArXiv

Pile-CC

Bibliotik

Free Law

USPTO

PG-19

BC2

PMA PHIL NIH

OpenWeb Text2

Stack Exchange
Wikipedia

Github DM Math

Subtitles IRC EP HN YT

Gao et. al 2020

#RSAC
Closed vs Open Source Generators
Closed: - Megatron (Nvidia) - GPT-3 (OpenAI) - Turing NLG (Microsoft) - PaLM (Google) Open Source: - OPT (Meta) - T0 (Big Science) - T5 (Google)
16

How to Control a Billion Parameter Model

One-shot
In addition to the task description, the model sees a single example of the task. No gradient updates are performed.

Traditional fine-tuning (not used for GPT-3)
Fine-tuning The model is trained via repeated gradient updates using a large corpus of example tasks.

#RSAC

Few-shot
In addition to the task description, the model sees a few examples of the task. No gradient updates are performed.

#RSAC
Prompt for Sentiment Classification
Sentiment: Negative

#RSAC
Prompt for Sentiment Classification
Sentiment: Negative
Sentiment: Positive

#RSAC
Prompt for Sentiment Classification
Sentiment: Negative
Sentiment: Positive
Sentiment: Negative

#RSAC
Prompt for Sentiment Classification
Sentiment: Negative Sentiment: Positive
Sentiment: Negative
Sentiment:

Prompt for Sentiment Classification
Sentiment: Negative Sentiment: Positive Sentiment: Negative Sentiment:

#RSAC
Output: Positive

#RSAC
Generating Fake Emails
Prompt:
Send Norton Invoice as Email:
23

Prompting with GPT-3
Input Emails
Fake Paypal Invoice for Norton Subscription

#RSAC
Generated Email

Generated Text
Fake PayPal Invoice for Norton Subscription
Output:

#RSAC
25

#RSAC
Generating Social Engineering Attacks
Personalized for maximum efficiency

Scraping LinkedIn Profiles
Name Education Work History Behavioural factors Personality Analysis

#RSAC
{"openness": {"score": 5.73, "level": "Somewhat Open"}, "extraversion": {"score": 8.37, "level": "Very Extroverted"}, "emotional_stability": {"score": 5.26, "level": "Sensitive"}, "attitude_and_outlook": {"score": 5.7, "level": "realist"} "action_orientedness": {"score": 6.1, "level": "high"}

Input : LinkedIn profile

Personalization Services

Output :

Metadata

27

Personalized Spear Phishing Attacks
TunaPhish (Turing AI Phishing)
GovTech Singapore studied the impact of personalization on email phishing by designing an AIaaS phishing pipeline named TunaPhish

#RSAC
Turing in a box (Lin et al. 2021)
28

#RSAC
Personalized GPT3 Examples
Prompt:
Satya Nadella's Bio:
29

#RSAC
Personalized GPT3 Examples
Prompt:
Charlie's Bio:
30

Personalized Generation
Input Bio and Example Email

Output Emails:

#RSAC

Dave write an email to Charlie

#RSAC
Actual GPT-3 Output
Dave writes an email to Charlie
Output:
32

#RSAC
Actual GPT-3 Output
Dave writes an email to Charlie
Output:
33

#RSAC
Failure Case of Generation
Dave writes an email to Charlie asking for help getting a job at Armorblox
Output:
34

#RSAC
Input Public Bio

#RSAC
Personalized Social Engineering
Dave writes an email to Ben
Output:
36

#RSAC
Personalized Social Engineering
Dave writes an email to Ben asking for help with his startup
Output:
37

#RSAC
Personalized Social Engineering
Dave writes an email to Ben asking for help with his startup and for his phone number
Output:
38

#RSAC
Generating Fake Personas

#RSAC
Bio Generation with Prompting (Input)
Real Security Keynote Speakers
40

Bio Generation GPT-3 Output
Ben Murdoch Staff ML Engineer | Artificial Intelligence | NLP

#RSAC

#RSAC
GPT-3 Bio Generation
42

#RSAC
GPT-3 Bio Generation
43

#RSAC
Prompt for Question Generation

#RSAC
Prompt for Question Generation

#RSAC
Prompt for Question Generation

#RSAC
Prompt for Question Generation

#RSAC
Generated Opinions
Prompt:
Ben's Bio:
48

#RSAC
Generated Opinions
Generated Q&A
Output:
49

#RSAC
Limitations - Context Window
The latest version of OpenAI's GPT-3 (text - davinci - 002) has a context widow 4k tokens
50

#RSAC
Augmenting Generation with Document Retrieval
Lewis et al. arXiv:2005.11401
51

#RSAC
Generating Blogs

#RSAC
Generating Blogs as a Service
53

#RSAC
Generated Blogs
Screenshot of normal article forge customer
54

#RSAC
Detecting Generated Text

#RSAC
Can't we just detect generated text?
- Grover - GLTR
56

#RSAC
Sampling: Choosing the next best token
My favorite animal is a dog
Top-k = 10
57

#RSAC
Perplexity: Evaluating Generator output
58

#RSAC
GLTR - Human Written Text
Edward Vasko, CISSP, is the Director of Boise State University's Institute of Pervasive Cybersecurity. He is a successive entrepreneur with over 30 years of experience in the cybersecurity industry. Prior to joining Boise State University, Vasko established and was a Senior Vice President at Avertium, a leading national managed security and consulting provider. Before establishing Avertium, he was the CoFounder and CEO of Terra Verde, based in Phoenix, Arizona. Appointed by Arizona's governor, Vasko held a Commissioner role in Arizona's Commission for Post-Secondary Education from 2015 to 2019. He was also appointed as the Co-Chair of Arizona's Cyber Team (ACT) Workforce Development Committee and was the Industry Co-Chair for the 2019 NICE Conference.

#RSAC
GLTR - Human Written Text
Kelly Shortridge is a Senior Principal at Fastly in Product Technology. Kelly is co-author of Security Chaos Engineering (O'Reilly Media) and is best known for their work applying behavioral economics, resilience, and DevOps principles to information security. Shortridge has been a successful enterprise product leader as well as a startup founder (with an exit to CrowdStrike) and investment banker. Shortridge frequently advises Fortune 500s, investors, startups, and federal agencies and has spoken at major technology conferences internationally, including Black Hat USA, O'Reilly Velocity Conference, and RSA Conference.

#RSAC
GLTR - GPT-3 Generated Text
Ben Murdoch is a Staff Machine Learning Engineer at Amazon, focused on Artificial Intelligence and Natural Language Processing. He is a regular speaker at conferences and meetups, and has been recognized as a top AI influencer by IBM. Murdoch has a Ph.D. in Cognitive Science from the University of Edinburgh, and has held research positions at the University of Pennsylvania and the University of California, San Diego. Murdoch has also authored multiple books on AI, including "Deep Learning for Natural Language Processing" (Apress, 2016) and "Natural Language Processing with PyTorch" (Apress, 2019).

#RSAC
GLTR - Curie Generated Text
Ben Murdoch is a data engineer and machine learning enthusiast with over 10 years of experience in the technology industry. He has worked on a wide range of big data and artificial intelligence projects, ranging from developing defensive natural language processing capabilities to building scalable Armorblox infrastructure. Ben is also a self-taught guitar player and vocalist, and is the founder of the Boise-based band, The Wounded Birds.

#RSAC
GLTR - Babbage
Ben Murdoch is a senior ML engineer at Amorblox, where he is responsible for developing and deployed our AI-based security solutions. He has experience with a variety of AI-based security solutions, including natural language processing (NLP), defensive AI, and data mining. He has also developed and deployed Armorblox's first ever AI-driven threat detection platform.

#RSAC
Distribution Over Token Rankings
Turing in a box (Lin et al. 2021)
64

#RSAC
Generative Data Augmentation
Fight fire with fire

#RSAC
What is Augmentation?
- Classifiers need a lot of data in order to perform well - Use augmentation to increase the number of datapoints - This works very well when you have a rare class
66

#RSAC
Augmentation with GPT-3
I love peanut butter and jelly sandwiches
67

#RSAC
Augmentation with Insertion
Mask out any part of the sentence and insert n tokens n = 1 I love peanut butter and jelly sandwiches.
68

#RSAC
Augmentation with Insertion
Mask out any part of the sentence and insert n tokens n = 2 I love peanut butter and jelly on my sandwiches.
69

#RSAC
Augmentation with Insertion
Mask out any part of the sentence and insert n tokens
n = 4 I love peanut butter and jelly, which is what makes good sandwiches.
70

#RSAC
Augmentation with Insertion
Mask out any part of the sentence and insert n tokens
n = 8 I love peanut butter and jelly, Yum! You can't beat peanut butter and jelly sandwiches.
71

#RSAC
Augmentation with Insertion
Mask out any part of the sentence and insert n tokens
n = 16 I love peanut butter and bread. Thanks!! This looks delicious. I love all types of peanut butter, but especially peanut butter/jam sandwiches.
72

#RSAC
Augmentation with Insertion
Mask out any part of the sentence and insert n tokens
n = 32 I love peanut butter and banana sandwiches and the Peanut Butter Chocolate Chip Cookie Bites are now very easy to prepare. The best part is that the PB&J Cookie Bites are the perfect size for kid lunch boxes and everyone will enjoy them. Kids love these sandwiches.
73

#RSAC
GPT-3 for dataset augmentation
74

#RSAC
Generating Websites
Infinite Phish in the sea

#RSAC
HTML/CSS/JS Generation
Generate a page similar to .... e.g. apple.com
76

#RSAC
Code Generation From Prompt
Source: OpenAI Cortex
77

#RSAC
Dall-E - Generating Images for Websites
Prompt: "A store front that has the word `GPT' written on it"
78

#RSAC
Dall-E
Prompt: "A grocery bag that has the word `GPT' written on it"
79

#RSAC
Conclusion

#RSAC
Putting it all together
Attackers can: · Generate new & engaging threat language content · Personalize attacks to targets based on their public internet profiles · Keep email threads going with generated replies, at scale · Generate realistic fake personas to engage targets · Generate collateral such as blogs & posts on social media to legitimize fake
personas · Generate phishing pages & whole website lures
81

#RSAC
Predict
· Spam & Bulk Email threats will grow smarter and more varied
· Threats targeted at Enterprise users, related to business workflows will likely get more sophisticated
· "Whaling" - i.e., attacks against high value targets will still be run by humans, but AI will be used to generate collateral content (such as webpages, blogs & social media profiles)
· Rise of social credit systems for email senders
82

#RSAC
Apply
· Generate your own alter ego with openAI's GPT-3
­ It's free to sign up for a personal GPT-3 account so give it a try! ­ Try prompting the model to either generate or classify something
· See what Humantics AI says about your personality
­ It's also free to sign up for a trial ­ If someone was attacking you based on your public profile what would
they push for?
83

#RSAC
Protect
· Stand on the shoulders of giants. Consider deploying next gen email security solutions
· Move business workflows involving payment out of email and into more closed loop systems with tight authentication
· Limit enterprise email use to business use. Train employees to be skeptical of new contacts & spot suspicious outreach
84

SESSION ID: MLAI-T02
Thanks!

Ben Murdoch ML Engineer at Armorblox

Prashanth Arun
Head of Data Science at Armorblox

#RSAC

