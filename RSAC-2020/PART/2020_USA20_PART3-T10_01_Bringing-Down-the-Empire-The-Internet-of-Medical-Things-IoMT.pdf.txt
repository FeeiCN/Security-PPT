SESSION ID: PART3-T10
Bringing Down the Empire--The Internet of Medical Things (IoMT)

Axelle Apvrille
Principal Security Researcher Fortinet / FortiGuard Labs @cryptax

Aamir Lakhani
Red Team Researcher Fortinet / FortiGuard Labs @aamirlakhani

#RSAC

Who are we
Aamir Lakhani
Senior Researcher Red Team Research Lead

#RSAC
Axelle Apvrille
Principal Researcher Lead researcher for IoT and Healthcare devices

Presenter's Company

Logo ­ replace or

delete on master slide

2

The largest healthcare breaches of 2019
AMCA DATA BREACH: 25 MILLION PATIENTS, INVESTIGATIONS ONGOING DOMINION NATIONAL: 2.96 MILLION PATIENTS UW MEDICINE: 973,024 PATIENTS WOLVERINE SOLUTIONS GROUP: ESTIMATED 600,000 PATIENTS OREGON DEPARTMENT OF HUMAN SERVICES: 645,000 PATIENTS COLUMBIA SURGICAL SPECIALIST OF SPOKANE: 400,000 PATIENTS

#RSAC

Presenter's Company Logo ­ replace or
delete on master slide

Source: Health IT Security
https://healthitsecurity.com/news/the-10-biggest-healthcare-databreaches-of-2019-so-far
3

#RSAC
Medical Devices have vulnerabilities
CVE 2019-10950 X-ray devices Anesthesia machines Emergency responder communication systems How many people care?

Presenter's Company

Logo ­ replace or

delete on master slide

4

Medical Databases for Sale
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC

#RSAC
Medical Fraud
Medical databases contain PII (personally identifiable information)
Opening credit cards, loans, car leases, cell phone accounts.
Insurance and billing fraud
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Diabetes

#RSAC
Diabetes
According to some studies some Asian populations are 63% more likely to get diabetes
Diabetes is a complicated set of medical conditions that causes abnormalities with blood sugars.
Diabetes is expense to treat. Insurance complexities for retired, non-insured, underinsured, and self-insured make it much more difficult.
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Let's talk about how medical insurance can help
Available plans to chose from: 1 Monthly Premium of plan: 810.00 Medicines covered: Less than 50% Medicine cost monthly: $700 (retailers such as Sam's club give
significant discounts under specific conditions)
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Cost for Medicine
Laws and protections are making it more affordable Cost for 10Ml Vial (all prices is USD)
­ US with insurance $20 ­ US without insurance $400 (without discounts) ­ AUS $20 ­ India $2 ­ Pakistan $3
Keep in mind prices and discounts make this difficult to track. These prices are based on me calling several providers in each country.
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Darknet Cost of Insulin
$2 USD Per 100Ml vial Price and boxes appear that many are shipped from south Asian countries Danger of fakes appears to be minimum.
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Medical Malware

Treatment for Diabetes

#RSAC
Treatment for Diabetes ­ sounds safe right? SMS Short Code Country of Origin and Destination unknown Premium charge Charge unknown

Presenter's Company Logo ­ replace or
delete on master slide

https://www.fortinet.com/blog/threat-research/android-malware-targetsdiabetic-patients.html

Toll-Fraud
Toll-fraud like it's 2012! Estimates of Toll Fraud have been in the billions ­ I personally find that
hard to believe but either way it's more than it should be.
Source: The Threat of Toll Fraud https://www.nojitter.com/security/threat-toll-fraud-persists
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC

#RSAC
How home glucose monitors work
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Smart sensors
Smart sensors let you monitor glucose levels
You don't need to keep pricking yourself
Take one normal reading
Attach smart sensor to your body
Sensor expires in 14 days. Users need to buy a new sensor every 14 days
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Analyzing the Sensor
Custom chips Low Powered consumption Is there an attack service?
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Analyzing Smart Sensor
Sensor uses NFC with the smartphone ISO 15693 Anyone can read: no authentication required
Used sponge to replace arm Sponge has hot water and sugar
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Memory Dump
After weeks of reverse engineering Axelle was able to dump the memory of the sensor
We discovered records are stored in 6bytes
Limited memory on the sensor
We were able to reverse many commands of the memory including wear time
37 HEX or 110111
(37) = (3 × 16¹) + (7 × 16) = (55)
55 minutes
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
The Mobile App ­ Firebase Analytics Logs and SDKs
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Hardware Vulnerabilities Discovered by Fortinet
Hardware: Anyone can read the sensor. (2) We found a vulnerability we disclosed. Event Tracking in the App
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Do Cybercriminals Care?

Presenter's Company

Logo ­ replace or

delete on master slide

22

Medical Malware is Everywhere

#RSAC

Malware
Ransomware Advice and Kits
Attacks against medical equipment.

Presenter's Company Logo ­ replace or
delete on master slide

Malware Smart Apps
How Long Do I have to Live?
All data leaked to remote server
Program prevents accessing diabetes application unless you download sponsored adware
Advice with ads and tracks everything: Installed Apps, IP, GPS
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC

#RSAC
Latest Downloads from the Darknet
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Insurance Fraud
Multiple health insurance cards and IDs being sold Average rate is $500 Walk into any doctor's office or pharmacy and show them a medical insurance card and ID We are not showing specific items for sale because they all appear to be stolen. Major US insurance companies were at risk
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Take the Day Off
Doctor's notes are cheap $1 - $10 Take the day off Some provide verification from call centers
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
The Darknet Market today
There used to be 2-5 large markets with thousands of items for sale Now: Multiple market (15 ­ 30) Hundreds of items for sale
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
What we have learned

#RSAC
What we learned
Cybercriminals don't care if you have had medical problems. They will use whatever advantage they can to make money You can buy cheap medicine from the Darknet There are risks involved
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Risks in buying from Darknet
Side effects Wrong medicine Wrong package
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Smartphone Apps
Smartphone applications are vulnerable to lots of attacks People will tolerate dangerous adware and spyware when they need the information urgently SMS and Toll-Fraud is still an attack service We are lucky ­ It could have been much worse.
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
A big thank you
Tons of people told us their stories about many aspects for this talk.
­ People buying from Darknet ­ People with health issues ­ People with insurance issues
Axelle, we missed you!
Lots of people helped us out with technical and non-technical pieces
Check out the Fortinet blog for updates and more research
Presenter's Company Logo ­ replace or
delete on master slide

