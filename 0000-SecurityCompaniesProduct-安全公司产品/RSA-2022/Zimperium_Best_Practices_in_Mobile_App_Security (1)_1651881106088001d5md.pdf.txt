Best Practices in Mobile App Security
Mobile applications drive business, growth, and productivity for countless businesses. They process vast amounts of data, including confidential customer information, all while accessing key systems at your organization. While the benefits are clear, mobile apps can also introduce extensive risks, including security breaches, privacy issues, and regulatory compliance violations. If not addressed, these issues can lead to customer churn and serious reputational damage.
In order to better understand the current mobile app security landscape, Pulse and Zimperium examined how organizations approach the challenge of securing mobile applications. We asked 270 global security and IT decision-makers from organizations that maintain a B2C app how they are solving for their biggest threats.
Here are the results from the survey:

Data collection: January 5 - January 20, 2022

Respondents: 270 global decision-makers

When asked what their top challenge is with deploying mobile app security, 45% of decision-makers cited the user experience su ering.
Only 1 in 5 (22%) say a slowed development process is their biggest challenge with deploying protection solutions.

What has been the biggest challenge with deploying mobile application security and protection solutions to date at your organization?

22%
It slows down our development process

45%
The user experience su ers

17%
It significantly increases app size
15%
It's complex/ di cult to use
1%
Other

Mobile app decision-makers are most concerned with ensuring data is securely stored and avoiding malware risks.
Respondents ranked ensuring secure data storage and transmission as their mobile application security task of most significant concern, followed by ensuring that proprietary source code can't be stolen and ensuring third-party SDKs do not introduce risk.

When it comes to mobile application security in your organization, which three of the following
tasks are you most concerned with today?

Ensuring data is

securely stored and

transmitted Ensuring proprietary

source code cannot

1

be stolen
2

Ensuring third-party SDKs do not introduce risk

3

4 Ensuring that our app can't be abused or tampered on
end-user devices
5 Achieving security visibility once the app is released 6 Meeting compliance and regulatory requirements 7 Preventing brand risk caused by app security or
data issues

While most decision-makers (66%) believe malware poses one of the greatest risks to their organization, there is a fairly even distribution when it comes to the next most common risks: apps being reverse engineered (49%), communicating with rogue wifi networks (49%), and helping their customers avoid phishing campaigns (51%).
Which of the following do you believe poses the greatest risk to your mobile application(s) today?

Malware installed on the same device
Phishing campaigns
Our app being reverse engineered
Our app communicating on rogue WiFi networks
Our app running on jailbroken/rooted devices
Other 0%

66% 51% 49% 49% 45%

Code obfuscation and cryptography are common mobile application protections in place, but security challenges still remain.
The most common protections in place for mobile applications include code obfuscation (57%), cryptographic key protection (57%), and anti-debugging (56%).

57% 57% 56% 53%

Which of the following protections do you have in place for your organization's
mobile application(s) today?
*Respondents allowed to select more than one answer

33%

Code Cryptographic Antiobfuscation key protection debugging

0%

Anti-

Runtime

Other

tampering application self

protection (RASP)

The majority of decision-makers (81%) are using cryptography for transmitting data to and from their applications. 61% use cryptography for storing data in their applications.

Where do you currently use cryptography in your application(s)?

81%
For transmitting data to and from the app

61%
For storing data in the app

56%

36%

For accessing APIs For fetching keys from a key vault

0% Other
*Respondents allowed to select more than one answer

To ensure the safety of their cryptographic keys, most (60%) of the respondents store keys using a hardware-based security model, while 55% simply don't allow downloads from specific devices and OS versions. Only 37% of respondents use software based white-box cryptography.

Which of the following measures do you currently take to ensure your cryptographic keys
are safe on all of your organization's devices?

60%
We store keys using a hardwarebased security module

55%
We don't allow download on specific device models
and OS versions

37%
We use software based white-box cryptography

0% Other, 0% None of the above
*Respondents allowed to select more than one answer

Visibility into key areas of mobile application protections are all over the map, but reverse engineering and application repackaging attempts seem to represent the lowest areas for security visibility.
The two areas of mobile application security where respondents have the lowest visibility are reverse engineering attempts (34%) and app repackaging attempts (30%). General security vulnerabilities had the highest percentage of decision-makers citing high visibility (43%).

With respect to your organization's mobile application security, what is your current level of visibility into the following areas?

No visibility Low visibility

Medium visibility High visibility

Unsure

Reverse engineering attempts

7%

27%

48%

App repackaging attempts
7% 23%

50%

Risk posture of end user's device and network

4% 17%

51%

Run-time attacks and app security issues
3% 19%

52%

Excessive permissions
1% 17%

53%

Risks due to third party components

1% 14%

48%

The software bill of materials
1% 13%

59%

Regulatory violations
2% 11%

48%

Security vulnerabilities
1% 10%

46%

16% 2%

17% 2%

26%

2%

24%

1%

27%

2%

36%

1%

24%

3%

37%

2%

43%

1%

Scalable resources such as formal training and approved libraries of third party code are the most popular methods organizations choose to help mitigate security vulnerabilities. Scanning code comes next, while pentesting is least common.
To help mitigate security risks, most organizations turn to formal security training (67%) and approved code libraries (62%), but only 22% are using third-party services to conduct pentests of each release.
How are you helping your organization's developers minimize vulnerabilities when they write code?

We have formal training on secure coding best
practices We maintain an approved library of thirdparty code to reuse We scan our code on each commit and pull
request We perform Internal pentesting at the end of
each release We scan our binaries and each commit and
pull request We perform external pentesting at the end of
each release

Other

Less than
1%

22%

67% 62% 53% 47% 46%
*Respondents allowed to select more than one answer

Over 90% of decision-makers claimed they're pentesting mobile applications at least once a year, with 72% claiming it's happening at least twice a year, and 23% quarterly. However, that's where the consensus ends; there seems to be a di erence of opinion as to who performs the pentesting and the available tools.
Nearly half (49%) of decision-makers say they perform pentests twice per year.

On average, how often do you perform pentests on your mobile application(s)?

49%
Twice a year

24%
Once a year
2%
Never

23%
Once a quarter
1%
Other

Most teams responsible for determining when mobile applications are secure enough for release are described as security (42%) or app security (24%) teams, but quality assurance (QA) (12%) and IT (11%) teams also assume some responsibility as well.
42%

24%

Which team at your organization is most accountable for authorizing that a mobile application is "secure enough" for release?

12% 11%

6% 3% 2% 0%

Security App security Quality

IT Development Compliance Product

Other

(pentesting

assurance

team, etc.)

63% of decision-makers use Application Security Testing tools to validate that their security measures are working.

How do you validate that security measures put in place are working against attacks in the real world?
63%
We have Application Security Testing (AST) tools

21%
We rely on penetration testing
11%
We have runtime threat visibility
5%
We just trust it to work 0% Other

Only 14% of respondents have the ability to update their mobile application protection in real time. Most would embrace a more consolidated o ering across the mobile app lifecycle.
Only 14% of decision-makers are able to update their mobile application protection in real-time, while nearly half (49%) can only update during the next planned release.

How do you keep your mobile application security up-to-date when new threats are discovered?

49%
We only update it with the next planned release

36%

14%

We have to release We have the

a new version ability to update the

protection in real-

time

0% Other

More than half (61%) of decision-makers agree that they would evaluate and embrace a new solution that secures the entire app life cycle, end-to-end.

Do you believe the available individual point solutions you use for mobile application security will continue to be su cient, or are you looking for a more consolidated approach across the entire application lifecycle in the future?

61%
We would evaluate and embrace a platform that
secured the entire app lifecycle

39%
Existing point solutions will continue to be su cient for our needs

As the only mobile security platform purpose-built for enterprise environments, Zimperium provides security solutions for mobile devices and applications, ensuring safe and secure access to critical data. Our patented, on-device, machine learning-based security provides visibility and protection against known threats and zero-day attacks, and our mobile application protection suite combines comprehensive in-app protection with centralized threat visibility.
Learn more at zimperium.com

North America 74%

Respondent Breakdown
Region

APAC 9%

C-Suite 22%

Title
Director 37%
VP 26%
Manager 15%

EMEA 17%

Company Size

10,001+

employees

34%

1,001-5,000 employees 29%

37%

5,001-10,000 employees

