GE OS T
Sebastian Garcia @eldracote

Money Doesn't Stink. Cybercriminal
Business Insight of A New Android Botnet

Anna Shirokova @anshirokova

Maria Jose Erquiaga @MaryJo_E

Do attackers care about attacking?

Let's look at the attackers

Finding Geost

The discovery. From HTbot to geost

Captured The Unencrypted Pattern in HtBot
Unencrypted traffic pattern Unicode encoding Russian language List of SMS from a victim

The Unencrypted Pattern in HtBot
The complete decoded text was in Russian, the translation from the message is: "Withdrawal of funds: Platbox (RUB 120.00); password: 321435. Do not disclose the password to ANYONE. Only fraudsters request passwords."

Access to the panel
GET /geost.php?bid=c5d72910bd8a97aeb2ce 7336fbd78a1f HTTP/1.1 Host: wgg4ggefwg.ru User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:48.0) Gecko/20100101 Firefox/48.0 Accept-Language: en-US,en;q=0.5 Referrer: http://wgg4ggefwg.ru/geost.php Cookie: SSE=p6ee96ki2knqrtsahdv84cuj04; __lnkrntdmcvrd=-1

Geost CC panel

infrastructure
C&C IPs: 17
Countries: US, MU and RU Each IP hosts 1-100 Geost domains
~ 150 Unique Domains
DGA style, not quite
~150 APKs
Identified as Android Hqwar or Banking Trojan

APKs

Fake applications

Detect emulators

Grant permissions

Obfuscated Code

Fishdom Update Player
Installing Avito Photo

Victims
Estimated ~1,000,000 victims in 17 CC ~72,000 per CC
Per victim, >700 SMS per year
"bank Online. LA SENA Sh translated (a) You 2500.00 RUB" "Log in bank Online for Android 07:33 04.03.18." "Ale Rova, pay your mobile one SMS and without commission! To replenish your balance at 100 p. your card, send an SMS to the number 900 with the text 100. Bank " " , we congratulate you on your birthday! Thank you for being with us. your Savings.
2018-02-05"

phones Sample from Victims

Discovery of a cyber group

Once Upon A Log . . .

CHAT LOG
6,200 Lines of text
11 months June 2017 to April 2018
10 people Conversations

Lost in translation

TRANSLITERATION

TRANSLATION

SLANG

CHAT LOG
BELKA
In Cyrillic `'" stands for squirrel
TELEGA
In Cyrillic `'" stands for cart
BLIN
In Cyrillic `" stands for pancake

SHAVE
In Cyrillic `'" stands for to pay less money for
tArBafOfiNc
In Cyrillic `'" stands for subscriber
PRILA
In Cyrillic `'" stands for app

Map of the group

Puppeteer

POWERFAER

Owner of the chat log
Knows people with money
Knows money launders and exchangers Creates websites

MIRREXX777

Used to subcontract others Tracking payments Prepares APKs Creates websites

Powerfaer & MIRREXX777
Powerfaer is in control of the business. Mirrexx777 also has access to Geost CC They both setup domains, and pay developers to create sites Mirrexx777 creates APKs, reencrypt APKs (kaspersky detected them) Powerfaer: "it seems that the money is coming from the phones credit. Not sure what is going on with the balances." Mirrexx777 shared his WebMoney wallet with Powerfaer They discuss the people paying as "they". And discuss possible countries of origin

Powerfaer & MIRREXX777
Time between updates of the APK: 2 days in average Domains get blocked by Yandex Browser and Chrome. They do official complains New domains for websites created every day (freedns.afraid.org) APKs are `recrypted' in FTT hidden service Powerfaer server was hacked

Most common chat time. powerfaer-mirexx777

maximchik700

Providing encrypted APKs
Hires freelancers for different job types
Searching for advertising in an Android apps

WEb TRaffic, ppi

mobi.manx

Sends traffic to web subscriptions Sends traffic to wap click
Works with Partnerka

Powerfaer & MOBI.manx
Powerfaer needs traffic from mobi.manx. The calls worked! Previous redirections didn't work. Mobi.manx has access to Geost panels too
From Powerfaer: "An offer. Their programmer needs a consultation, they want to add click into midlet. The programmer needs to be explained how to do auto-click, how to download these landing pages, or insert some script. So you can get a share from user clicks, plus from the calls and SMS"

zloetv

Owner of online movie sites

Has platform for traffic
Interested in Pay Per Call traffic
Part of a larger group
"Regarding the app it is going via [name redacted], those people are shady :-("

elkol95

Recruiting webmasters with their websites
Active on russian hacker forum Antichat.ru
Buys Android installs

Money exchangers

nokola2200

Doesn't work with banks or legal entities
Active on darkmoney.sg forum for money mules
Charge up to 3% fee for exchange

cyberhosting.ru

Charges 3-5% more for legal accountant papers Exchanges cash to BTC
Doesn't gives loans

DEvelopers

taganchik

PHP and Java developer CMS datalife engine Lacks of motivation

Powerfaer & taganchik. A motivational tale
P: "maybe you can still try to pull yourself together?" "No" P: "Shame, we had such great plans. Ok, i will inform that money for links would be hand over to another person." "No" P: "ok think it over one more time. Look at all pros and cons. The motivation we have is not working for other boss. At the end of the month i will pay you a good amount of money. Please understand it is important" "No, i don't want" P: "Hi, can you just tell me if we are going to continue or not. SO i dont have to bother you every day "No" P: "i got it, shame, the money would come in handy. Think it over till 20th,you will change your mind" "I cant do it" P: "Of course, you have to force yourself to do it! nothing will happen if you are not going to make an effort. I judge from my experience. i will pay you double"

Final thoughts

attackers perception about attacking

Illegal
Infections Malware development
Infection of phones Attacking others No tax paying?
not illegal
Developing Website creation Backend development

Probably not illegal
Infrastructure Fake organizations websites Mirror a 3rd party website Premium SMS Redirection of traffic

CONCLUSIONS
Cybercrime is like another business There is an infrastructure and different people with different roles involved Hacking is a routine daily job
No response from RuCERT nor Russian Police
5 banks affected. More than 1,000,000 victims

Thanks! Questions?

Sebastián García
@eldracote sebastian.garcia@agents.fel.cvut.cz
AIC, CTU University

Anna Shirokova
@anshirokova shirokova@avast.com
Avast Software

Maria Jose Erquiaga
@MaryJo_E maria.erquiaga@aic.fel.cvut.cz
AIC, CTU University

