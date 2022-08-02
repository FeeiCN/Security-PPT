SESSION ID: MBS-F02
The Android Developers' Guide to 3rd-Party SDK Assessment and Security

Yang Yang()
Mobile Security Researcher and Developer, Trend Micro

#RSAC

#RSAC
Advantages of 3rd-Party SDKs
 Speed up app development  Are easy to use  May be of good quality (at least for some)  Generate profit!
2

#RSAC
Android Threat Growth
As of March 2015, Trend Micro has collected more than 5.4M malicious and high-risk applications
3

67% of detected apps

misuse or abuse 3rd-party

#RSAC

SDKs or use SDKs that are

inherently risky

4

#RSAC
Malware/PUA Distribution by Country
Majority of the apps that misuse or abuse 3rd-party SDKs are from China
5

#RSAC
Malware/PUA Distribution by Category
Of the detected apps, games have the highest percentage, as they usually contain both advertising SDKs as well as payment SDKs.
6

Most security issues have

something to do with

#RSAC

advertising and payment

SDKs. Why?

7

#RSAC
Popular App Business Models/SDKs
 Advertisement
 Ad networks provide SDKs that allow developers to display advertisements
 Ad networks pay developers, usually based on the click rate
 Payment
 Users purchase additional features or services within the app  Allows users a more "direct" way to pay app developers
8

#RSAC
Security Issues with Ad SDKs
 Privacy leaks  Insecure app installation  Dynamic code loading  Mobile traffic cost
9

#RSAC
Privacy Leak
10

#RSAC
Insecure App Installation
 A special ad: Integral Wall  Using app need virtual money  The way to earn the virtual money
 Step 1: Click the ad to download the apps
 Step 2: Install them  Step 3: Launch the downloaded apps
for a few minutes
11

#RSAC
Dynamic Code Loading
12

#RSAC
Mobile traffic cost
 Download file before push ad  File is too large
13

#RSAC
Security Issues in payment SDKs
 Send SMS (Short Message Service) message without users' explicit consent
 E.g., user (or a child) hits the pay button by accident  Confirmation as a step is necessary
 Block incoming SMS message
 Some payment SDKs can block the confirmation or notice SMS message  User may not know that s/he is already paying for a service or item
14

#RSAC
Block incoming SMS
15

General Security Issues in

#RSAC

3rd-Party SDKs

16

#RSAC
General Security Issues
 Vulnerabilities related  Insecure network transmission  Insecure online setting  Insecure data storage  Insecure data sharing
17

#RSAC
SDK impacted by OS vulnerability
Android API WebView vulnerability (CVE-2012-6636)
18

#RSAC
Insecure network transmission
19

#RSAC
Insecure online setting
Apache Cordova vulnerability (CVE-2015-1835)
20

#RSAC
Insecure data storage
 Insecure database  Insecure sdcard storage
21

#RSAC
Insecure data sharing
 Android Content Provider  Share your data with enough limitation
22

#RSAC
Best Practices
23

#RSAC
For SDK Developers and Providers
 Provide clear end-user license agreements (EULAs)  Make the SDK document as clear as possible
eg: https://developers.google.com/admob/android/quick-start
 Limit collection user information  Add more limitations for exported interface  Pay attention to vulnerabilities; provide updated SDKs as
necessary  Online control SDK logic is not recommended
24

#RSAC
For Mobile App Developers
 Read the SDK documents carefully  Choose 3rd-party SDKs carefully  Avoid using the aggressive interface (APIs)  When using ad SDKs, make sure that the apps do not push ads
too frequently or impact other apps  Update to the latest SDK versions  Advise users if your app has aggressive behavior
25

Developers should pay attention to software #RSAC security!
 Encrypt sensitive data  Use packers to protect your applications  Use "high-risk" app permissions with caution  Push app or data updates app via the app store
26

#RSAC
Summary
 Ease of use and Profit  3 in 5 Android theats are caused by 3rd-party SDKs  Mobile security involves all aspects in the ecosystem, including
SDK providers and app developers
27

#RSAC
Questions?
28

Thank You!

#RSAC

yang_yang@trendmicro.com.cn

