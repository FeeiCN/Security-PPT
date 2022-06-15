SESSION ID: PDAC-F02
PSD2 Preparedness? Research Reveals FinTech Risks

Feike Hacquebord
Senior Threat Researcher Trend Micro Research @FeikeHacquebord

#RSAC

#RSAC
Imagine you have installed a new FinTech App
Would you mind sharing banking statements of the last 18 months with a 3rd party other than your bank?
2

#RSAC
Imagine you are a bank
Would you be worried when a FinTech firm uses your customers' passwords to access their banking
statements online?
3

#RSAC
Imagine you are a FinTech startup
Are you prepared when you must use protocols like OAuth, mTLS, Token Binding, PKCE,...
to access banking data on behalf of your customers?
4

#RSAC
Open Banking ­ worldwide revolution in FinTech
5

#RSAC
Before Open Banking
6

#RSAC
After Open Banking
7

#RSAC
Open Banking Worldwide
Europe ­ PSD2 law since September 14 2019 (mostly postponed) US ­ no regulation but FS-ISAC published standards Australia ­ regulation in 2020 Asia ­ some regulation South America ­ some regulation
8

#RSAC
Open Banking ­ key drivers
Innovation Breaking monopoly banks Enhance service offering Additional revenue .... .... Enhanced Security ( not a key driver really )
9

#RSAC
Enhanced Security in Open Banking
PSD2 in EU - 2 factor authentication - dynamic linking (link between OTP and payee / amount)
OAuth (far from 100% in practice) Financial grade API (FAPI) in UK (new security flaws to be fixed)
10

#RSAC
New trust relationships
Banking customers <-> FinTech
- customers trusted banks for a long time - customers unfamiliar with FinTech companies and unfamiliar how their
data gets shared
Banks <-> FinTech
- Banks might perceive FinTech startups as a threat - FinTech startups might perceive banks as not cooperative
11

#RSAC
Risks of Open Banking
Actors interested in abuse of Open Banking
advertisers data brokers rogue FinTech companies advanced bank fraudsters nation state actors
12

#RSAC
Risks of Open Banking
APIs Obsolete data sharing protocols New security modules might introduce new attacks Wrong implementation of complicated security modules Rogue use of customer data (like banking statements) Fraud detection becomes harder
13

#RSAC
Risks of Open Banking
Simply put: Open Banking widens the attack surface
14

#RSAC
APIs in (Open) Banking
APIs are central to the success of Open Banking Banks were relatively late with creating APIs
15

#RSAC
Growth of banking APIs over time
16

#RSAC
APIs in (Open) Banking
APIs should not leak sensitive information...
17

#RSAC
Credentials in API URL of FinTech company
18

#RSAC
Sensitive info in API URL of an EU bank
19

#RSAC
Sensitive info in API URL of an Asian bank
20

#RSAC
Sensitive info in API URL of a European central bank
21

#RSAC
Sensitive info in URL paths of APIs
We looked into dozens APIs of financial companies Many of them contain sensitive info in the URL path
22

#RSAC
Sensitive info in URL paths: a problem
URLs stored in browsing history URLs stored in access log files URLs stored in proxy logs URLs shared between different devices
Might hinder enhanced security in Open Banking Bad practice anyway ­ "easy" to fix.
23

#RSAC
Obsolete sharing protocols still in use
screen scraping / direct access Open Financial Exchange (OFX)
24

#RSAC
Open Financial Exchange (OFX)
Protocol developed in 1997 by Microsoft, Intuit and CheckFree No real multi factor authentication OAuth in latest version, but not used Still used in US by many banks
25

#RSAC
Open Financial Exchange (OFX)
Which protocol version most popular in US?
26

#RSAC
Open Financial Exchange (OFX)
Which protocol version most popular in US?
<- 79% <- 21%
27

#RSAC
What is Screen scraping
Fintech company uses banking customers' password to log on and scrape financial data by parsing HTML code Also called "direct access" by FinTech companies FinTech companies often claim there is no known breach because of screen scraping Some FinTech companies are reluctant to use OAuth instead
28

#RSAC
Obvious risks of Screen scraping ("direct access")
Banking customers should never share passwords Goes against good practices to educate banking customers Risk of data breaches No easy way to revoke 3rd party access to banking details No way to give different levels of access permissions
29

#RSAC
US bank announces to ban screen scraping

#RSAC
Debate in Australia on Screen Scraping

#RSAC
Financial Grade API (FAPI) in UK
FAPI is meant to be secure in high risk environment Developed in UK by OpenID and banks since 2017 Serious flaws found early 2019 by German academic researchers Daniel Fett et al (2019). Not ready on September 14 2019 (PSD2 deadline)
32

#RSAC
Financial grade API (FAPI)
FAPI = OAuth2.0 + extra modules
33

#RSAC
Financial Grade API (FAPI)
FAPI = OAuth2.0
+ mutual TLS (mTLS) + OAuth token binding ( probably dropped) + JWS Client Assertion + Proof Key for Code Exchange (PKCE)
34

#RSAC
Example of mTLS
35

#RSAC
Attack scenario against mTLS
36

#RSAC
Actions to take ­ for banks
Review your (legacy) APIs Retire/update APIs with sensitive info in URL path Retire OFX servers Learn from FAPI experiences in UK Consider adopting zero trust model Educate your customers about new phishing attacks
37

#RSAC
Actions to take ­ for FinTech companies
Review your (legacy) APIs Retire/update APIs with sensitive info in the URL path Stop "screen scraping", adopt OAuth Learn from FAPI experience in UK Learn how to implement security protocols Think about Threat Actors who might attack you Educate your customers about security
38

#RSAC
Lessons learned ­ for banking customers
FinTech companies may offer useful new financial services However, review which data the FinTech company is collecting from you Read the fine print about sharing your data with 3rd parties Be prepared for new phishing techniques Know how to revoke access permissions of the FinTech service you have signed up with
39

#RSAC
More details in our paper
Ready or Not for PSD2: The Risks of Open Banking
available on trendmicro.com
40

#RSAC
More details on FAPI
"An Extensive Formal Security Analysis of theOpenID Financialgrade API" by Daniel Fett et al. available on arxiv.org
41

#RSAC
Thank You feike_hacquebord AT trendmicro.com @FeikeHacquebord on Twitter
42

#RSAC
Appendix
References

#RSAC
References
Daniel Fett et al (2019). 2019 IEEE Computer Society. "An extensive formal security analysis of the OpenID Financial-grade API." https://arxiv.org/abs/1901.11520
Laura Noonan (2020), Financial Times, "JPMorgan to ban fintech apps from using customer passwords". https://www.ft.com/
Julian Bajkowski (2020), itnews.com.au, "CBA's Comyn wants screen scrapers scrubbed from Consumer Data Right". https://www.itnews.com.au
Feike Hacquebord et al (2019). "Ready or Not for PSD2. The risks of Open Banking". https://www.trendmicro.com/
44

#RSAC

#RSAC

#RSAC

