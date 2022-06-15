The "Hidden Empires" of Malware

Dave

Ryan

SANS Cyber Threat Intelligence Summit 28-29FEB18

The "Hidden Empires" of Malware

Dave

Ryan

SANS Cyber Threat Intelligence Summit 28-29FEB18

Disclaimer
During the course of this presentation, we may make forward looking statements regarding future events or the expected performance of the company. I often lie. Maybe this is a lie. Wik Alsø wik Alsø alsø wik Wi nøt trei a høliday in Sweden this yër? See the løveli lakes The wøndërful telephøne system And mäni interesting furry animals The characters and incidents portrayed and the names used in this Presentation are fictitious and any similarity to the names, characters, or history of any person is entirely accidental and unintentional. Signed RICHARD M. NIXON Including the majestik møøse A Møøse once bit my Marcus... No realli! He was Karving his initials on the møøse with the sharpened end of an interspace tøøthbrush given him by Svenge ­ his brother-in-law ­ a Canadian dentist and star of many Norwegian møvies: "The Høt Hands of an Canadian Dentist", "Fillings of Passion", "The Huge Mølars of Horst Nordfink"... In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. Splunk undertakës no øbligation either to develøp the features or functionality described or to include any such feature or functionality in a future release.

# whoami > Ryan Kovar
CISSP, MSc(Dist)

Staff Security Strategist Minster of the OODAloopers @meansec

 17 years of cyber security experience
 Current role on Security Practice team focuses on incident/breach response, threat intelligence, and research
 Also investigating why printers are so insubordinate _

# whoami > Dave Herrald
CISSP, GIAC G*, GSE #79

Security Architect @splunk
@daveherrald

- 20+ years IT and security - Information security
officer, security architect, pen tester, consultant, SE, system/network engineer - Former SANS Mentor
- Co-creator of Splunk Boss of the SOC

Agenda
 Answering some W's · Why are we doing this talk? · What are we talking about with "Hunting Empires"? · What are SSL certificates and why do I care? · What can I do with them?
 Talk about the "H" · How can I get this data myself? · How does Blockchain Automated Intelligence Machine Learning "fit" in?
 And now another W · Where can I get this awesome stuff!

If you don't know what SSL Pivoting and Hunting is...
... Sit Down

If your org can't capture SSL certificates at scale...
... Sit Down

If you've never applied machine learning to SSL certificates
... Sit Down

Look around... ... Sit Down

© 2017 SPLUNK INC.
What are SSL certificates and why do I care?

Mark Parsons "Lord of SSL Pivoting"
 @mpars0ns

 https://t.co/amyR9pU8o4
 https://medium.com/@mark.parson s/hunting-a-tls-certificate-seriespost-1-6ad7adfebe44
 https://mpars0ns.github.io/bsidesch arm-2016slides/
 https://mpars0ns.github.io/archc0n2016-tls-slides/#/
 https://www.slideshare.net/MSblueh at/bluehat-v17-using-tls-certificatesto-track-activity-groups

15

16

Sooo... SSL Certificates?
[SSL certificates are] Small [unencrypted] data files that digitally bind a cryptographic key to an organization's details." [1]
[1] https://www.godaddy.com/help/what-is-an-ssl-certificate-542

So that shows SSL certificates?

Censys.io

Circl.lu

Passivetotal.org

Splunk!

Internet-Wide Scan Data Repository
Public archive of research data Hosted by the Censys team at the University of
Michigan Perform scans, and host results from other teams The data on the site is restricted to non-
commercial use https://scans.io (https://scans.io/json)

Project Sonar by Rapid7

https://sonar.labs.rapid7.com/

 Many studies · SSL Certificates · HTTP Content · HTTPS Content · DNS · Various TCP/UDP services (SSH, SMB, Telnet,
etc.)
 Hosted at scans.io
 Please review Project Sonar TOS
 Thanks to Rapid7 Labs!

SSL Certificates Study (sonar.ssl)
 October 30, 2013 ­ Present  Raw size
· Entire data set: 315 GB compressed (as of 02JAN2017) · Weekly: ~1.5 - 2.0 GB compressed  Entire data set indexed in Splunk: ~1.2TB  Scan the entire Internet (TCP/443 only)  Comprised of: · Observed certificates * · Observed IP address / certificate * · Names (FQDNS) · Endpoints

sonar.ssl Certificate in Splunk
index=sonarsslcert earliest=0 hash_id=b4c68c2fe3e689bd51c3676c69c02454be1f545f

sonar.ssl First/Last seen
Search for a hash, or pivot here from search

DAVE. DONE UP TO HERE
But what do we do with it?

Unknown

You can do at Known least two things
with SSL Certificate information

THE SSL CERTIFICATES IN YOUR INCIDENTS ARE REAL.

Start with some known naughty SSL SHA1 fingerprints

Gozi Trojan
8fc4a51bb808d0050a85f55de93b3aa9db4fef90

"As we know, there are known knowns; there are things we know we know. We also know there are known unknowns; that is to say we know there are some things we do not know. But there are also unknown unknowns ­ the ones we don't know we don't know. And when someone tries to hunt in CyberSpace the known unknowns are the hardest to find "
- Donald "Cybersfeld"

Hunting PowerShell Empire

openssl req -new -x509 -keyout ../data/empire-priv.key -out ../data/empire-chain.pem -days 365 -nodes -subj "/C=US" >/dev/null 2>&1

C=US is weird...

ManyMany Million IPs
90 suspect
3 PSE
:-)

I was told there was AI ML?

The Pinto Test

We use Splunk But you don't have to!

SSL Blacklist
https://sslbl.abuse.ch/

Can we build a model to predict inclusion on
the SSL blacklist?

More importantly, can such a model alert us to
badness that we otherwise would not
detect?

We have labeled data...

"Bad" (blacklisted) certs

search index=sonarsslcert sourcetype=sonarsslcert | lookup sslblacklist.csv sha1 | search reason=* | collect index=blcertdetails
(About 1500)

"Good" (non-blacklisted) certs (note sampling ratio)

search index=sonarsslcert sourcetype=sonarsslcert | lookup sslblacklist.csvsha1 | search NOT reason=* | collect index=nonblcertdetails
(About 1700)

Feature Selection and Prep

For analysts

Some quantitative features for supervised machine learning Models

Features
Number of certificate extensions Number of Issuer elements
Number of Subject elements Length of Extensions Length of Issuer Length of Subject
Shannon Entropy of Subject Common Name
Surprisingly simple list of quantitative features

Features
index=*blcertdetails | spath | eval sha1=coalesce(sha1, hash) | lookup sslblacklist.csv sha1 | eval blacklist=case(isnull(reason), "False", true(), "True") | spath input=_raw output=extlist path="extensions" | eval extlist=replace(extlist,"[\{\}]", "") | eval extlen=len(extlist) | makemv delim="\", \"" extlist | eval extcount=mvcount(extlist) | spath input=_raw output=isslist path="issuer" | eval isslist=replace(isslist,"[\{\}]", "") | eval isslen=len(isslist) | makemv delim="\", \"" isslist | eval isscount=mvcount(isslist) | spath input=_raw output=sublist path="subject" | eval sublist=replace(sublist,"[\{\}]", "") | eval sublen=len(sublist) | makemv delim="\", \"" sublist | eval subcount=mvcount(sublist) | `ut_shannon(subject.CN)` | fillnull value=0 ut_shannon | eval subcnshannon=ut_shannon | table sha1 blacklist reason extcount extlen isscount isslen subcount sublen subcnshannona
Splunk search. Long but simple.

Select a model

Categorical Prediction Algorithm Accuracy FP Rate

Logistic Regression

0.75 24.90%

Support Vector Machine (SVM)

0.91 4.90%

Random Forest Classifier

0.91 8.10%

Gaussian Naive Bayes

(GaussianNB)

0.71 18.40%

Decision Tree Classifier

0.91 9.80%

Select a model

Categorical Prediction Algorithm Accuracy FP Rate

Logistic Regression

0.75 24.90%

Support Vector Machine (SVM)

0.91 4.90%

Random Forest Classifier

0.91 8.10%

Gaussian Naive Bayes

(GaussianNB)

0.71 18.40%

Decision Tree Classifier

0.91 9.80%

Build the Model

Apply the Model

Apply to Sonar SSL Certificates

Suspicious maybe...

Yes some are definitely bad...

And I care why?

Machine learning can

help add context to

events

+

+

=

Machine learning can help reduce your dataset...

...So you can find your bears

Machine learning doesn't solve cyber...
But it can help ;-)

Oh... Just one more
thing...

Certificate Research Platform Resources
https://www.slideshare.net/RyanKovar/hiddenempires-of-malware
· How to build an SSL hunting platform with Splunk https://github.com/daveherrald/scansio-sonarsplunk
· Download any scans.io study, load sonar.ssl &
sonar.https into Splunk for analysis
https://github.com/mpars0ns/scansio-sonar-es · Download sonar.ssl load into Elasticsearch

Can we wrap this up?

Conclusion
SSL certificates can be a great way to track adversary behavior
Consider tracking from known and unknown
Machine Learning can help add context and reduce datasets

Special Thanks
Mark Parsons IKBD Rapid 7 Censys team at University of Michigan John Lankau and Lauren Deason @ PunchCyber

Contact info

Dave Herrald @daveherrald

Ryan Kovar @meansec

