Three Generations of DoS Attacks
(with Audience Participation, as Victims)
Defcon, 2011

Bio

Summary
· The DoS Circus · Layer 4 DDoS: Thousands of attackers
bring down one site · Layer 7 DoS: One attacker brings
down one site · Link-Local DoS: IPv6 RA Attack: One
attacker brings down a whole network

The DoS Circus
Characters

Wikileaks
· Published <1000 US Gov't diplomatic cables from a leak of 250,000
· Distributed an encrypted "Insurance" file by BitTorrent
· Widely assumed to contain the complete, uncensored leaked data
· Encrypted with AES-256--no one is ever getting in there without the key
· Key to be released if Assange is jailed or killed, but he is in UK now resisting extradition to Sweden and the key has not been released

Anonymous

Operation Payback
· 4chan's Anonymous group · Attacked Scientology websites in 2008 · Attacked the RIAA and other copyright defenders · Using the Low Orbit Ion Cannon with HiveMind (DDoS)
· "Opt-in Botnet"

HB Gary Federal
· Aaron Barr
· Developed a questionable way to track people down online
· By correlating Twitter, Facebook, and other postings
· Announced in Financial Times that he had located the "leaders" of Anonymous and would reveal them in a few days

Social Engineering & SQLi
· http://tinyurl.com/4gesrcj

Leaked HB Gary Emails
· For Bank of America
­ Discredit Wikileaks ­ Intimidate Journalist Glenn Greenwald
· For the Chamber of Commerce ­ Discredit the watchdog group US Chamber
Watch
­ Using fake social media accounts · For the US Air Force · Spread propaganda with fake accounts
· http://tinyurl.com/4anofw8

Drupal Exploit

Th3j35t3r
· "Hacktivist for Good" · Claims to be ex-military · Originally performed DoS attacks on Jihadist
sites · Bringing them down for brief periods, such
as 30 minutes · Announces his attacks on Twitter, discusses
them on a blog and live on irc.2600.net

Jester's Tweets from Dec 2010

Th3j35t3r v. Wikileaks
· He brought down Wikileaks single-handed for more than a day ­ I was chatting with him in IRC while he did it, and he proved it was him by briefly pausing the attack

Wikileaks Outage
· One attacker, no botnet

Th3j35t3r
· After his Wikileaks attack · He battled Anonymous · He claims to have trojaned a tool the Anons downloaded · He claims to pwn Anon insiders now

Jester's Tweets

Westboro Baptist Outage
· 4 sites held down for 8 weeks · From a single 3G cell phone
­ http://tinyurl.com/4vggluu

LulzSec
· The skilled group of Anons who hacked H B Gary Federal
· Hacked
­ US Senate ­ Pron.com ­ Sony ­ FBI ­ PBS ­ Fox News

LulzSec Attacks on Government Sites
· FBI, CIA, US Senate · UK's National Health Service · SOCA, the UK's Serious Organised Crime
Agency taken down 6-20-2011

Two Factor Authentication
· First factor: what user knows · Second factor: what user has
­ Password token ­ USB key ­ Digital certificate ­ Smart card
· Without the second factor, user cannot log in
­ Defeats password guessing / cracking

RSA was Hacked, and their Customers Too
· http://samsclass.info/RSA-alternatives.html

Layer 4 DDoS
Many Attackers ­ One Target Bandwidth Consumption

Companies that Refused Service to Wikileaks
· Amazon · Paypal · Mastercard · Visa · Many others

Low Orbit Ion Cannon
· Primitive DDoS Attack, controlled via IRC · Sends thousands of packets per second from
the attacker directly to the target · Like throwing a brick through a window · Takes thousands of participants to bring down
a large site · They tried but failed to bring down Amazon

Low Orbit Ion Cannon

Operation Payback v. Mastercard
· Brought down Visa, Mastercard, and many other sites ­ Easily tracked, and easily blocked ­ High bandwidth, cannot be run through anonymizer ­ Dutch police have already arrested two participants

Mastercard Outage
3,000 to 30,000 attackers working together

Layer 7 DoS
One Attacker ­ One Target Exhausts Server Resources

Layer 7 DoS
· Subtle, concealable attack · Can be routed through proxies · Low bandwidth · Can be very difficult to distinguish from
normal traffic

HTTP GET

SlowLoris
· Send incomplete GET requests
· Freezes Apache with one packet per second

R-U-Dead-Yet
· Incomplete HTTP POSTs · Stops IIS, but requires thousands of
packets per second

Keep-Alive DoS
· HTTP Keep-Alive allows 100 requests in a single connection
· HEAD method saves resources on the attacker
· Target a page that is expensive for the server to create, like a search
­ http://www.esrun.co.uk/blog/keep-alive-dos-script/
· A php script
­ pkp keep-dead.php

keep-dead

XerXes
· Th3j35t3r's DoS Tool · Routed through proxies like Tor to hide the attacker's origin · No one knows exactly what it does · Layer 7 DoS?

XerXes

Link-Local DoS
IPv6 Router Advertisements

IPv4: DHCP
PULL process  Client requests an IP  Router provides one

Host

I need an IP Use this IP

Router

IPv6: Router Advertisements

PUSH process  Router announces its presence  Every client on the LAN creates an address and joins
the network

Host

JOIN MY NETWORK

Yes, SIR

Router

Router Advertisement Packet

RA Flood

Windows Vulnerability
· It takes a LOT of CPU for Windows to process those Router Advertisements
· 5 packets per second drives the CPU to 100% · And they are sent to every machine in the LAN
(ff02::1 is Link-Local All Nodes Multicast) · One attacker kills all the Windows machines on
a LAN · FreeBSD is also vulnerable!
­ But not OpenBSD, of course

Responsible Disclosure
· Microsoft was alerted by Marc Heuse on July 10, 2010 · Microsoft does not plan to patch this · Juniper and Cisco devices are also vulnerable · Cisco has released a patch, Juniper has not

Defenses from RA Floods
· Disable IPv6 · Turn off Router Discovery · Block rogue RAs with a firewall · Get a switch with RA Guard

RA Guard Evasion
· Add "Fragmentation Headers" to the RA Packets
­ http://samsclass.info/ipv6/proj/RA-evasion.html

Fragmentation Headers

Defending Websites

Attack > Defense
· Right now, your website is only up because ­ Not even one person hates you, or ­ All the people that hate you are ignorant about network security

Defense
· Mod Security--free open-source defense tool · Latest version has some protections against Layer 7 DoS
· Akamai has good defense solutions · Caching · DNS Redirection · Javascript second-request trick

Load Balancer

· Proxy servers · Conceals your server's IP address · Blocks attacks using information from other
attacks · Free version · Effective against th3j35t3r in real combat

Counterattacks
· Reflecting attacks back to the command & control server
· Effective against dumb attackers like Anonymous' LOIC ­ Will lose effect if they ever learn about Layer 7 DoS, which is happening now

References

References
Anonymous Takes Down U.S. Chamber Of Commerce And Supporter Websites http://goo.gl/Mue9k
Slowloris HTTP DoS http://ha.ckers.org/slowloris/
OWASP HTTP DoS Tool http://code.google.com/p/owasp-dos-http-post/
Mitigating Slow HTTP DoS Attacks http://blog.spiderlabs.com/2010/11/advanced-topic-of-theweek-mitigating-slow-http-dos-attacks.html
`Tis the Season of DDoS ­ WikiLeaks Edition (Outage charts) http://goo.gl/V5jZc

References
ModSecurity http://goo.gl/56hbl
Akamai DDoS Report http://baythreat.org/MichaelSmith_DDoS.pdf
How Secure Is Julian Assange's "Thermonuclear" Insurance File? http://goo.gl/sY6Nn
Overview of Anonymous and their attack on MasterCard: http://goo.gl/lVsCD
Operation Payback Toolkit: LOIC and HiveMind http://pastehtml.com/view/1c8i33u.html

References
r-u-dead-yet http://code.google.com/p/r-u-dead-yet/
Keep-Alive DoS Script http://www.esrun.co.uk/blog/keep-alive-dos-script/
Router Advertisement DoS in Windows http://samsclass.info/ipv6/proj/flood-router6a.htm
RA Guard Evasion http://samsclass.info/ipv6/proj/RA-evasion.html
XerXes Attack Video
http://goo.gl/j8NQE

