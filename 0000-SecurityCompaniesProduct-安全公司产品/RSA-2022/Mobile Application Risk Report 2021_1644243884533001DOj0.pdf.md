BitSight Insights
Mobile Application Risk Report

Contents

3 BitSight Performance Analysis

3

Key Research Findings

4 The Increasing Risk to Mobile Applications

5 BitSight's Evaluation of Mobile Application Security Performance

5

BitSight Methodology: Severity Levels and Mobile Application Grades

6

Vulnerability Severity Prevalence in Mobile Apps

6

Overall Mobile Application Security Performance By Sector Over 12 Months

8

Material and Severe Vulnerability Prevalence By Sector

8

Material and Severe Vulnerability Percentage by App Genre

9

Material and Severe Vulnerability Percentage by App Popularity

9

Material and Severe Vulnerability Remediation By Sector

10 Improving Mobile Application Security

11 Conclusion

12 Appendix and Heatmaps

BITSIGHT INSIGHTS | MOBILE APPLICATION RISK REPORT

BitSight Performance Analysis Identifies Significant Gaps in Mobile Application Security Initiatives Across Sectors
As security and risk professionals take steps to improve their organization's cybersecurity posture, email, network, and web security often take center stage. This makes perfect sense, as these have been preferred attack vectors for decades. However, as internet use continues to move toward a mobile-centric experience, it has become critical to consider mobile applications when crafting your organization's security strategy.
In this report, you'll find eye-opening statistics on the state of mobile application security today, examples of how and why mobile breaches occur, and actionable advice for mitigating risks associated with your own mobile applications, as well as apps from third-party partners and suppliers.
You'll also get BitSight's latest research on mobile application security--including performance stats by application genre, sector, and popularity. Finally, you'll learn how to reduce risk and demonstrate security performance to customers, prospects, and other critical stakeholders.
Key Research Findings

3 out of 4 mobile applications evaluated contained at least one

01

Moderate vulnerability. The prevalence of at least one Material (<1%)

or Severe (2.5%) vulnerability occurs at significantly lesser rates.

02

Material and Severe vulnerabilities, including Arbitrary Code Execution, were observed in highly popular mobile apps.

03

Very few Material and Severe vulnerabilities were remediated once they were in production. Remediation rates were very low given the criticality of these vulnerabilities.

04

Android shopping apps, which transmit personal identifying information (PII) and other sensitive financial details, performed poorly in TLS Certificate Validation for Sensitive Data.

05

GPS Data Leakage, a significant security and privacy issue, was a problem across a variety of sectors and mobile app genres--including Aerospace and Defense.

3

www.bitsight.com

BITSIGHT INSIGHTS | MOBILE APPLICATION RISK REPORT
The Increasing Risk to Mobile Applications
Since mobile applications store massive amounts of users' personal information, breaches and data leakage can expose organizations to significant risk, as evidenced by news coverage throughout 2021.
In March, a breach in its mobile app forced a Formula 1 racing team to call off an augmented reality campaign after its app was hacked. In June, a healthcare provider was breached via unauthorized access to a third-party mobile app called Smart Clinic.
In August, British Airways disclosed that approximately 380,000 card payments were compromised after a security breach occurred on the company's website and mobile app. The breach compromised the personal and financial details of customers--including name, address, and bank card details like CVC code.
In September, security researchers found that 14 top Android apps, downloaded by more than 140 million people in total, are leaking user data due to Firebase misconfigurations. Exposed data potentially includes users' names, emails, usernames, and other PII. Firebase is a mobile application development platform with an active monthly base of more than 2.5 million apps.
"Mobile applications already drive much of today's digital activity and that will only increase in the future. 5G, increased work-from-home, and the ever-increasing availability of mobile devices have all but assured that cyber criminals will look for avenues into mobile applications to conduct attacks," said Stephen Boyer, Founder and CTO of BitSight. "For these reasons, it is critical for organizations to understand risks associated with mobile applications created in-house and those published by third parties."

"It is critical for organizations to understand risks associated with mobile applications created in-house
and those published by third parties."
- STEPHEN BOYER Founder and CTO of BitSight

4

www.bitsight.com

BITSIGHT INSIGHTS | MOBILE APPLICATION RISK REPORT

BitSight's Evaluation of Mobile Application Security Performance
There are approximately 5 million mobile apps currently in circulation: approximately 3 million for Android and 2 million for iOS. Of the millions of mobile apps available, a significantly smaller subset dominates the market. Of these, only a small proportion constitutes the mainstream mobile apps.
BitSight wanted to understand the prevalence of vulnerabilities in popular mobile applications across a variety of sectors and industries. We analyzed 93,647 mobile apps from 40,664 organizations and tasked ourselves with answering two critical questions:
1. How common are significant vulnerabilities in mobile applications? 2. Are some sectors better or worse than others in addressing mobile application security
issues?
In our analysis, we analyzed 185 static and dynamic mobile application tests that investigated all vulnerability types--from Minor to Severe--across 22 major industry sectors.
BitSight Methodology: Severity Levels and Mobile Application Grades
Before we dive into the results of our research, it is important to understand how BitSight uses the Common Vulnerability Scoring System (CVSS). CVSS is a widely-used evaluation of the magnitude of vulnerabilities on a ten-point scale. However, BitSight uses different nomenclature than CVSS to retain consistency with existing notions of severity within BitSight's platform.

CVSS RANGE
0.0 0.1 - 3.9 4.0 - 6.9 7.0 - 8.9 9.0 - 10.0

BITSIGHT SEVERITY
Minor Minor Moderate Material Severe

CVSS RANGE
Informational Low Medium High Critical

BitSight leverages mobile application vulnerabilities to create an overall Mobile Application Security grade of an organization's published applications. The BitSight Mobile Application Security grade is a value between 0 to 10, derived from the CVSS scores of vulnerabilities detected, such that: (1) the app grade is greater than or equal to the largest CVSS score of the detected vulnerabilities, and (2) each detected vulnerability with a positive CVSS score worsens (i.e. increases) the app grade. The lower the grade, the more secure the application. A detailed methodology of BitSight's approach is available within the BitSight Knowledge Base.

5

www.bitsight.com

BITSIGHT INSIGHTS | MOBILE APPLICATION RISK REPORT
Vulnerability Severity Prevalence in Mobile Apps
BitSight examined vulnerability severity prevalence across mobile applications in all sectors. For each specific vulnerability, we considered the results of either a static or a dynamic analysis test and defined test failure rate as the probability that an app will fail at least one test at a given vulnerability level. We also aggregated data across multiple security flaws into their respective CVSS severities for brevity.
BitSight's analysis showed that Minor and Moderate test failures were far more common than Material and Severe test failures.
The probability of observing a Severe vulnerability in a mobile app was less than one percent. Observing a Material vulnerability was only slightly more probable (2.5%). Moderate vulnerabilities were far more common with a probability of 74.7% and Minor vulnerabilities were 59.2% probable.
As the following sections describe, Material and Severe vulnerabilities were observed in some highly popular mobile apps. Worse, very few Material and Severe vulnerabilities were remediated once they were in production.
Finally, it is important to note that even Minor and Moderate vulnerabilities can expose organizations to serious risks. For example, short encryption keys are classified as Moderate, but they can leave apps vulnerable to brute force attacks. In our study, this type of vulnerability was fairly common. We found insufficient signing key length present in roughly a quarter of the Android apps analyzed.
Overall Mobile Application Security Performance By Sector Over 12 Months
Leveraging mobile application security testing data, we ranked sectors in terms of their average mobile application security performance over a twelve month period.
Finance, Insurance, and Retail came in on top of this list while Nonprofit/NGO, Business Services, and Media/Entertainment performed poorly by comparison.
However, the average BitSight application scores were quite close across sectors--ranging from 5.36 and 6.04. The reality is that a typical mobile app release is shipped to the end-user with a strong likelihood of containing a Minor or Moderate vulnerability, regardless of sector.

6

www.bitsight.com

BITSIGHT INSIGHTS | MOBILE APPLICATION RISK REPORT

Rank

Sector

1

Finance

2

Insurance

3

Retail

4 Transportation

5

Food Production

6

Government/Politics

7

Engineering

8 Manufacturing

8 Consumer Goods

8 Energy/Resources

8 Utilities

12 Legal

13 Tourism/Hospitality

13 Telecommunications

15 Aerospace/Defense

16 Technology

17 Real Estate

18 Education

19 Healthcare/Wellness

20 Nonprofit/NGO

21 Business Services

22 Media/Entertainment

Average BitSight AppSec Grade

Unique App Count

Percentage of Apps with 1+ Test Failure(s)

Minor

Moderate

Material + Severe

5.36 5.51 5.54 5.56 5.58 5.61 5.63 5.67 5.67 5.67 5.67 5.69 5.73 5.73 5.74 5.77 5.81 5.82 5.83 5.94 6.03 6.04

9898

53

1791

57

2175

52

2315

55

781

54

2869

55

980

61

2804

54

1447

53

1004

61

587

59

146

64

2508

56

3272

56

224

55

41029

63

641

53

3510

58

5647

70

1178

68

6191

61

8242

64

57

2

65

2

67

3

69

3

71

2

81

2

81

2

77

3

75

4

76

3

75

1

81

4

78

3

72

3

73

4

78

2

74

4

82

4

81

1

83

2

80

4

83

6

7

www.bitsight.com

BITSIGHT INSIGHTS | MOBILE APPLICATION RISK REPORT

Material and Severe Vulnerability Prevalence By Sector
BitSight examined how specific sectors performed on Material and Severe vulnerabilities to identify areas of high and low performance. Overall, sectors performed well on the majority of tests. However, we identified some concerning trends.
For example, we observed Leakage of Location (GPS + ZIP Code) via HTTP for both iOS and Android apps and Leakage of PII (e-mail address, first/last names) via HTTP in iOS apps in the Aerospace/Defense sector. Data leakage of this type could have serious ramifications-- especially in Aerospace/Defense where compromise may have national security implications.
Additional findings included: · Improper TLS Certificate Validation for Sensitive Data in the Retail, Technology,
Tourism/Hospitality, and Transportation sectors. · Leakage of Apple AdID via HTTP in iOS apps in the Media/Entertainment and Business
Services sectors.
Apple AdID, or Advertising Identifier, is an alphanumeric string used specifically for advertising that uniquely identifies a specific device to the app's vendor. AdID leaks have potential privacy, compliance, and security implications.
For more detail, see Heatmaps 1 and 2 in the appendix.

Material and Severe Vulnerability Percentage by App Genre
Next, we investigated Material and Severe vulnerability prevalence by Android and iOS app store genre. In this round, we limited our testing to popular app genres--which we defined as genres that include over 1,000 apps.

Overall, we found that issues with TLS Certificate Validation for Sensitive Data are prevalent across many genres of Android apps. Shopping apps, which transmit PII and other sensitive financial details, performed worst in this area.

Improper TLS Certificate Validation for Sensitive Data is a concern across almost all genres of iOS apps. News apps are the most problematic genre for iOS.

Additional findings included: · Android apps for News are the most likely to be vulnerable to Arbitrary Code Execution. · GPS tracking data (latitude + longitude) leaked via HTTP can be a serious problem for
some social apps on Android. · Leakage of Apple AdID via HTTP in iOS news apps is much more prevalent than for other
genres. · Leakage of PII (first name) and Apple IDFV via HTTP was also observed.

Apple IDFV, or Identifier For Vendor, is an alphanumeric string that uniquely identifies a specific device to the app's vendor. IDFV leaks have potential privacy, compliance, and security implications.

For more detail, see Heatmaps 3 and 4 in the appendix. 8

www.bitsight.com

BITSIGHT INSIGHTS | MOBILE APPLICATION RISK REPORT

Material and Severe Vulnerability Percentage by App Popularity
We also wanted to better understand how common serious vulnerabilities are among the most popular mobile applications. We investigated Material and Severe vulnerability prevalence by user engagement (download counts, app ratings).
Some highly popular mobile apps were observed to have Material and Severe vulnerabilities. For example, nearly all the Android apps we found to be susceptible to Arbitrary Code Execution are very popular (more than 1,000,000 downloads). Improper TLS Certification is prevalent in iOS apps with user download counts ranging from 1,000 to 10,000.
Additional findings included: · Improper TLS Certificate Validation for Sensitive data occurs in some popular Android apps. · Leakage of GPS Coordinates via HTTP can be an issue for some popular Android apps. · Leakage of Apple AdID via HTTP was observed for some iOS apps with a wide range of
user-engagement levels (100 to 100,000 downloads)
For more detail, see Heatmaps 5 and 6 in the appendix.
Material and Severe Vulnerability Remediation By Sector
We examined Material and Severe remediation rates by sector. A mobile app was deemed to have undergone remediation if: · The latest available version was tested to be insusceptible to a given vulnerability, and · The vulnerability was observed in an earlier version(s) tested in the last year.
Overall, very few Material and Severe vulnerabilities were remediated once they were in production. The remediation rates that BitSight observed were very low given the criticality of these vulnerabilities.
On a positive note, we found that iOS apps in the Media/Entertainment sector have high remediation rates for Apple IDFV Leakage via HTTP. In fact, test results in this category were better than any other sector/vulnerability. The Insurance and Transportation sectors also performed well in this area.
Additional findings included: · Android Real Estate apps had the highest remediation rates for GPS data leakage via
HTTP. · Some iOS Tourism/Hospitality apps performed well in the PII (last name) Leakage via
HTTP remediation while others did not. · TLS Certificate Validation Issues for Sensitive Data on iOS in Energy/Resources,
Telecommunications, and Transportation apps were observed to have been remediated in some cases.
For more detail, see Heatmaps 7 and 8 in the appendix.

9

www.bitsight.com

BITSIGHT INSIGHTS | MOBILE APPLICATION RISK REPORT
Improving Mobile Application Security
When evaluating mobile applications security, organizations must consider their own apps as well as those published by third parties. It is essential that organizations enforce security standards as an essential part of their mobile app development and release cycles.
Mobile app security evaluations should not be treated as the last step of the development and/or release process, but as recurring functionality milestones. All apps--not just a select few--should be included in the security evaluation process. Additionally, mobile applications should be evaluated on an ongoing basis.
"We believe that developers of mobile apps in lower performing sectors are likely laserfocused on the features and functionalities of their products. Additionally, security evaluations may often occur after apps have been developed by teams whose core expertise is not in security," said Abdullah Al Rashid, Senior Data Scientist at BitSight. "It is a worthwhile investment for organizations to continuously vet apps for security issues to reduce risk."

"It is a worthwhile investment for organizations to continuously vet apps for security issues to reduce risk."
- ABDULLAH AL RASHID Senior Data Scientist at BitSight

Vetting mobile application security can be challenging, but thankfully there are tools that can help. BitSight's Mobile Application Security (Mobile AppSec) rating distills results from static and dynamic analysis of apps into intuitive letter grades, enabling organizations to easily monitor mobile application security performance and focus continuous improvement efforts. BitSight offers solutions for both internal security performance and third-party risk management.
BitSight Mobile AppSec is aligned with recognized industry standards. Magnitudes of vulnerability are reported on the 10-point scale instituted by the Common Vulnerability Scoring System (CVSS). Coverage for the OWASP Mobile Top 10 framework is provided by the security assessments of apps.

10

www.bitsight.com

BITSIGHT INSIGHTS | MOBILE APPLICATION RISK REPORT
Conclusion
Historically, many organizations saw mobile security investment as a necessary, albeit costly, preventative measure. Today, it is increasingly seen as a cost-saving investment or even a revenue driver within the development life-cycle of mobile apps. This has been highlighted in mainstream media, including in Forbes, as well as other industry-specific publications.
Security and privacy are now significant contributors to the brand image of virtually all mobile apps. The recent shake-up in the popular and substantial market for instantmessaging apps illustrates this perfectly--an emerging instant-messaging app focused on security and privacy doubled its user base from 20 million to 40 million in the remarkably brief period between December 2020 and January 2021.
"The integration of security evaluations as a continuous part of the development and release cycle for all mobile apps is an investment app publishers should make in their brand," said Al Rashid.
"Developers can no longer afford to put off security until the last minute or even after the app has been released. Prioritizing mobile application security has become essential to compete in today's market."

11

www.bitsight.com

BITSIGHT INSIGHTS | MOBILE APPLICATION RISK REPORT
Appendix and Heatmaps
HEATMAP 1 Material and Severe Vulnerability Percentage By Sector (Android)

12

www.bitsight.com

BITSIGHT INSIGHTS | MOBILE APPLICATION RISK REPORT
HEATMAP 2 Material and Severe Vulnerability Percentage By Sector (iOS)

13

www.bitsight.com

BITSIGHT INSIGHTS | MOBILE APPLICATION RISK REPORT
HEATMAP 3 Material and Severe Vulnerability Percentage by App Genre (Android)

14

www.bitsight.com

BITSIGHT INSIGHTS | MOBILE APPLICATION RISK REPORT
HEATMAP 4 Material and Severe Vulnerability Percentage by App Genre (iOS)

HEATMAP 5 Material and Severe Vulnerability Percentage by App Popularity (Android)

15

www.bitsight.com

BITSIGHT INSIGHTS | MOBILE APPLICATION RISK REPORT
HEATMAP 6 Material and Severe Vulnerability Percentage by App Popularity (iOS)

16

www.bitsight.com

BITSIGHT INSIGHTS | MOBILE APPLICATION RISK REPORT
HEATMAP 7 Material and Severe Vulnerability Remediation By Sector (Android)

17

www.bitsight.com

BITSIGHT INSIGHTS | MOBILE APPLICATION RISK REPORT
HEATMAP 8 Material and Severe Vulnerability Remediation By Sector (iOS)

18

www.bitsight.com

BitSight Insights
BitSight Insights provides objective, trusted data and analytics on global, national, and sectoral cybersecurity performance to improve public awareness of cyber risk and enhance public access to the highest quality security performance data.
Abdullah Al Rashid, Andrew Burton, Maham Haroon, Tom Montroy, Jake Olcott, and Pedro Umbelino (a-z) contributed to this report.

111 Huntington Avenue Suite 2010 Boston MA 02199 +1.617.245.0469

About BitSight
BitSight is transforming the way that the global marketplace addresses cyber risk with cybersecurity ratings and analytics. The BitSight Security Ratings Platform applies sophisticated algorithms, producing daily security ratings that range from 250 to 900, to help organizations manage their own security performance; mitigate third party risk; underwrite cyber insurance policies; conduct financial diligence; and improve national security. With 2,300 global customers and the largest ecosystem of users and information, BitSight is the Standard in Security Ratings. Learn more at bitsight.com.
© 2022 BitSight Technologies. All Rights Reserved.

