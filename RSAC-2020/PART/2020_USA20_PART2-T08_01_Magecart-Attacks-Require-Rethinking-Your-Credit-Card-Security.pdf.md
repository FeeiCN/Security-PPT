SESSION ID: PART2-T08
Magecart Attacks Require Rethinking Your Credit Card Security

Raja Patel
Vice President of Products, Web Security Akamai Technologies

#RSAC

Magecart
· Hacker groups stealing sensitive data via thirdparty scripts
· Sites that use credit card processing are at constant risk ­ One infection can infect 1000s of sites in a single update ­ 20% are reinfected within a month of last attacks1
1 Source: SANGUINE SECURITY, 2018 https://sansec.io/labs/2018/11/12/merchants-struggle-with-magecart-reinfections/
2

#RSAC

October 11, 2019
https://www.forbes.com/sites/leemathews/2019/10/11/over-18000-websitesinfested-with-magecart-card-skimming-malware/#c78d66f7b1d9

#RSAC
Credit Card Stealing Malware Strikes Websites of Two International Hotel Chains
Baseball Hall of Fame Website Hacked With Credit Card Stealing Malware
This is How 380,000 British Airways Passengers Got Hacked
FBI Warns of Hidden Online Shopping Threats, Including ESkimming, `Magecart Attacks'
https://www.newsweek.com/fbi-warns-hidden-online-shopping-threats-including-e-skimmingmagecart-attacks-1467311
3

#RSAC
Agenda
· Why is Magecart a Big Deal? · What is a Magecart Attack? · Intrusion vs Detection · A Comprehensive Security Strategy · The Call to Action
4

Third-Party Script Use is Accelerating
Driven by Digital Transformation

· Enhances the Web Experience

· Easy to Add/Modify

· Promotes consistent experience

· Integrated with

62

Third-Party Service

48 Third

· Maintained by Third-

First

Party

Party

Party

#RSAC

140% Increase in third-party
script requests 2011-2018

706% Increase in third-party
script size 2011-2018

Script Requests and Sizes, 2018
Source: JavaScript growth and third parties, SpeedCurve, 2018

Average Resources Per Page, 2017
Source: Security and Frontend Performance, Challenge of Today: Rise of Third Parties, Akamai Technologies and O'Reilly Media, 2017
5

Analyzing Third-Party Application Activity

#RSAC
Complete www.akamai.com

Source: https://requestmap.herokuapp.com/render/200107_S4_75af286693538a095b33ac5e4740b0b8/
6

68% Third-Party Scripts

#RSAC
Third-Party Scripts Can Introduce Vulnerabilities

Complex supply chains that can be compromised by attackers

Magecart

4,800

Alpaca

Websites compromised monthly

Malicious code added to 3rd Party updates

Delivered via supply chain

PII Skimmed

Malicious code executes

Sent back to hackers

· Outside of control and visibility
· Scripts added by other teams · Come from trusted sources · Re-infection is common

78%
2018 Attacks
Source: Symantec 2019 Internet Security Threat ReportEvery month an average of 4,800 websites are compromised

7

#RSAC
Script Compromises and Examples

Data skimming

Major North American Retailer (4Q19)
Credit card info stolen from payment page

Accidental exfil

Major Online Search Service (4Q19)
Unsecure access to 250M customer records

Risky services
(CVEs) Known vulnerabilities

International Retailer (4Q19)
Unsecure access to 1.3TB of customer data
Travel Services (4Q19)
Exposed over 380,000 customer's personal and payment info
8

#RSAC
Third-Party Script Protection Approaches

Content Security Policy Whitelisting
Synthetic Site Scanning
Access Control/ Sandboxing
In-App Detection

· Supports rigorous CSP · Prevention-focused · Requires continuous manual analysis and testing
· Simple websites · Useful for policy updates · Requires continuous manual analysis and testing
· Simple websites, low PII · Combines with CSP · Requires continuous manual analysis and testing
· Monitors app script behaviors · Detection-focused · Quick mitigation, low business impact
9

#RSAC
Attributes of an Effective Magecart Protection Service
· In-App detection of suspicious behavior · Easy-to-setup and administer · Automated, Always on · Filters out noise & targets problems · Threat intelligence to stop known threats · Feedback loop to access control policies
10

Third-Party Script Website Example
Films For All*­ Subscription Signup
Featured

FilmFilsmFsoFr oArllAll

Enter your Email Address to get thousands of classic movies for the whole family you can watch anytime, anywhere

Email Address

Sign Up

#RSAC

* Films For All is a fictitious site. Any similarity to a real service is purely coincidental
11

Help | Advertise | Press | RSS | Site Map

Films For All ­ Subscription Signup

Common site construction relies upon a constellation of service providers for analytics and site functionality.
· Might be dozens of hostnames
· An average of scripts 110 scripts
· Could be multiple tag managers
· A/B testing tool

Featured

FilmFilsmFsoFr oArllAll

Enter your Email Address to get thousands of classic movies for the whole family you can watch anytime, anywhere

Email Address

Sign Up

#RSAC

This is an attack surface hackers could use to monitor or interact with Films For All users, or exfiltrate data they enter into the site.
12

Help | Advertise | Press | RSS | Site Map

#RSAC
Films For All ­ Account Creation

FilmFilsmFsoFr oArllAll

Pick a plan

Create account

Enter Address

Monthly
Flexible pay-as-you-go Cancel Anytime
1st Month Free!
$7.99/mo

Annual
Annual Discount Renewed Annually
1st Month Free!
$79.99/yr

Form of Payment
2-Year Deal
Biggest discount Best Deal
1st Month Free!
$129.99/2 yrs

Select
13

Select

Select

#RSAC
Analyzing the Current Script Composition

Sign-In and Sign-Up scripts 3rd-Party attack Comparison to

surfaces

known threats

14

#RSAC
What to Remember
· Third-Party Scripts are essential to the modern websites · Skimming threats are increasingly frequent & impactful · Monitoring Trusted third-parties is the new requirement · In-app script behavior detection is critical · In-app script protection works with access control solutions
15

#RSAC
Next Steps
· Analyze your third-party script situation · Think about which script security approach is right for you · Test your ideas
16

#RSAC

#RSAC

#RSAC

