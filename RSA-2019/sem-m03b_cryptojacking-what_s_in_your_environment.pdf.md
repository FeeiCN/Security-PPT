SESSION ID: SEM-M03B
Cryptojacking: What's in your Environment?

Austin McBride
Threat Analytics Researcher Cisco Umbrella @armcbride1

#RSAC

Agenda

1 Cryptocurrency

2 Cryptojacking

3 Crypto Phishing

4

Shifting to Altcoins and Exchanges

5

How to Protect Yourself

#RSAC
$ WHOIS Austin
Threat Analytics Researcher at Cisco Umbrella B.S. in Data Mining and Economics Crypto enthusiast Hobbies: work, algorithmic crypto trading, and work

Cryptocurrency

#RSAC
Cryptocurrency's Meteoric rise
· In less than one year crypto market cap $26B to $835B · Crypto market going mainstream, but still "Wild Wild West" · Under regulated, highly volatile, and full of malicious actors
Source: coinmarketcap.com

#RSAC
Why is Crypto Theft Attractive?
· Crypto asset theft and cryptojacking can be extremely lucrative and hard to spot · Crypto exchanges security measures are not as mature compared to traditional equity exchanges · Very anonymous and the asset value fluctuates giving them more purchasing power to buy malicious software, additional infrastructure · Where there is money, there are criminals ­ most of them are external

So how does cryptojacking fit in?

#RSAC
Cryptojacking
Cryptojacking is the secret use of your business' computing power to mine cryptocurrencies through individual machines in browser JavaScript exploits, cloud AWS instances, etc.

DNS Queries in Millions

Crypto Traffic
Last 10 Months

#RSAC
· Last 10 months: 200x increase in crypto related traffic
· The majority of traffic are cryptomining pools, but also some sites that drop mining software onto your machine
· Distribution of crypto traffic affects all industries, not just financial services

#RSAC
Crypto Traffic Industry Distribution

· Higher Education, Energy/Utilities, Manufacturing 3% Local Government, Healthcare and

Media industries have a surprising Managed Service

high volume of cryptomining traffic

Providers 3%

· Top industry fluctuates every 2-3 Local Government

months, but Higher Education is

4%

always in the top 2

Media 6%

Other 15%

Healthcare 7%

Financial Services 2%

Education: College 22%
Energy/Utilities 34%

Education: K-12 4%

#RSAC

Crypto Traffic Geo Distribution

CA 2%
EMEA ZA 6% 2%

70 Other Countries 28%
US 62%

ZA: South Africa, CA: Canada, EMEA: Europe, Middle East & Africa, US: United States

#RSAC
SMBs Are More Vulnerable to Cryptomining Malware

SMALL BUSINESS
31%

MEDIUM SIZE BUSINESS
50%
ENTERPRISE
18%

<1000

1000 - 9999

>10,000

Medium sized businesses accounts for slightly more than 50% of all crypto traffic.

· We see more instances of cryptomining in Small and Medium Business (SMBs) environments

Mining Difficulty

#RSAC
· Increases in mining difficulty has hurt mining profitability and halted many mining pools used by malicious actors
· Cryptojacking will decrease when the market is down and increase when the market it hot

Mining Costs

#RSAC
· With cloud based miners like Coinhive the cost to the malicious actor generally no more than 30% of whatever they were able to mine in your environment
· The real upfront cost for them is what ever they had to do leverage your machine (very inexpensive)

#RSAC
Cryptojacking

#RSAC
Javascript Injections
https://coinhive.com
· Malicious actors can inject a few lines of JS on a website and use visitors computing resources to mine cryptocurrency while they are visiting the site · It's often that site visitors do not notice their degraded system performance

#RSAC
Weaponized Cryptomining?
Why We Should Care

Web-Based Miners:

1

Generally only impact a machine while a user is on a webpage and does not persist after you close the

page. Little risk of damaging machine hardware.

Software-Based Miners:
2 Actual software installed on a machine that persists
while the machine is on and connected to the internet. Higher risk of damaging hardware. Potentially an IOC.

Crypto phishing

Delivery Vectors
Email

Search Engine Ads

#RSAC
Communication Channel

#RSAC

https://mmonero.com

#RSAC

#RSAC

Google AdWords

#RSAC
· A malicious actor would need to infiltrate www.blockchain.info
· Create a subdirectory (e.g. /wallet/im_gonna_phish_you)
· Then setup a redirect to their fake site (www.blockchain.com/ Blockchain/Wallet) to phish your credentials and gain access to your wallet's funds

Targeting Exchanges and AltCoins

#RSAC
Crypto Phishing and Scams
Crypto exchange phishing sites are on the rise and they are using advertisements on search engines to lure people into giving up their credentials
We're giving away ETH! Just send me 0.2 ETH and I'll send you back 2 ETH. Send me your crypto to the address below...

#RSAC

Crypto Phishing targeting exchanges
www.bivnance.com = www.binance.com Right?

http://www.bivnance.com

https://www.binance.com

2FA Bypass

Victim enters credentials on phishing site

Malicious actor intercepts credentials and forwards to legitimate domain

Victim enters 2FA code staying on phishing page

Malicious actor obtains 2FA code

#RSAC
2FA prompt

#RSAC
What do we know about www.bivnance.com?

#RSAC
What else is black13@unseen.is
after?
Maybe all of your ERC20 tokens...

#RSAC
Altcoins vector
· Another tactic used by malicious actors involves pump and dumps · Malicious actors setup phishing sites to get user's exchange credentials (several hundred accounts) · Create API keys for those accounts and enable API trading · Setup a bot to liquidate user's altcoin positions into BTC and purchase all open orders for VIA coin to pump its price · Then the malicious actor can sell their own VIA coins at the top of the pump and walk away with a 10,000% gain on their own VIA coin holdings

#RSAC
Altcoins vector
· In the case of the VIA coin pump the malicious actor plan backfired and they walked away with nothing

How to Protect Yourself

#RSAC
Cryptojacking
DNS level domain blocking can be effective for known pool miners For cloud computing instances, look for increases in CPU utilization ­ could be as small as a 10%-15% increase

#RSAC
Malicious domains associated with phishing and browser redirect
CryptoJacked domains serving Coinhive miner script Another source for the mining script

HTML
Counts Vector
Creating Corpus

HTML
TFIDF Vector
HTML
Query (Input Document)

HTML
LSI Vector

Create LSI Corpus

#RSAC
LSI Corpus Vector Space

HTML
LSI Vector

Compare Query Against Corpus

Phishing Victims

Multiple cybercriminal operations

BTC as Ransomware
payment BTC

Phishing Operator

USD to buy BTC

Purchase RaaS

#RSAC

RaaS Operator

Ransomware Ransomware victims

https://blockchain.info

#RSAC

Conclusion

#RSAC

1
With recent Law Enforcement measures, such as take down of BTC-E exchange, criminals shifting their focus from well known and widely spread crypto currencies to new and upcoming currencies. They have also started to heavily target exchanges and startups working with crypto, which are easier targets and usually have limited or almost no security.

2
Protect your environment and look for not only Web based miners but also cryptomining software like Honeyminer that make DNS queries. DNS level identification is a great way to determine if your environment has a cryptomining problem or not ­ then you can remediate. This type of activity will considerably increase in the next few years. Make sure you are keeping an eye on your environment.

#RSAC
Apply What You Have Learned Today
Next week you should:
­ Look through your DNS query logs for substantive (500+ queries a day) cryptomining pool traffic from one or several machines
­ For cloud computing instances, look for increases in CPU utilization ­ could be as small as a 10%15% increase
In the first three months following this presentation you should:
­ Add popular cryptomining sites to your domain block lists for all of your endpoints ­ If you find considerable and consistent cryptomining DNS traffic - you might have mining software
installed which means someone internally or externally installed it (potential IOC)
Within six months you should:
­ Stay vigilant and keep adding new mining pool sites to your blocklist (they popup every couple of weeks)
­ Consider using a vendor (Cisco Umbrella) who has security policies designed to block cryptomining traffic
40

#RSAC
Questions?
@armcbride1 aumcbrid@cisco.com www.umbrella.cisco.com

