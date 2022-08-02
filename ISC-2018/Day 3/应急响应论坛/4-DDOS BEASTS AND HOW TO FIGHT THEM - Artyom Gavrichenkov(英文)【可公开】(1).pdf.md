DDOS BEASTS AND HOW TO FIGHT THEM
Töma Gavrichenkov CTO, Qrator Labs

Contents

HISTORY RISK MANAGEMENT ATTACKS AND MITIGATION ARCHITECTURAL VIEW

TIMELINE OF ANCIENT HISTORY
· First attacks: 1999-2000 · 2005: STRIDE model by Microsoft
· Spoofing Identity · Tampering with Data · Repudiation · Information Disclosure · Denial of Service · Elevation of Privileges

[D?]DoS
The difference between "a distributed attack" and an, err, not distributed one is vague.
Traditional meaning: a distributed attack comes from multiple sources. · What is a source? Is it an IP address or a machine? · If it is a machine, does a virtual instance count?
Or a few instances under the same physical hypervisor? What if they often migrate between physical machines? If I'm a victim, how do I tell a single-sourced from a multiple-sourced? · If it is an IP, then how do we treat spoofed traffic?

[D?]DoS
Hence, a different sort of thinking applies: · DoS (as implied in STRIDE): a vulnerability in a software
(e.g. NULL pointer dereference, like Ping of Death) · DDoS: computational resource exhaustion

RISK MANAGEMENT
The basic idea behind STRIDE and other approaches is risk assessment, modelling and management.

PROBABILITY/IMPACT MATRIX

Rare Unlikely Moderate
Likely Very Likely

Trivial

Minor

Moderate Significant Severe

PROBABILITY/IMPACT MATRIX

Rare

Trivial

Unlikely

Moderate

Likely

Very Likely

Minor Moderate Significant Severe

DDoS attack, 2018
· Impact:
Severe
· Probability:
?

RISK MANAGEMENT

NETWORK RESOURCE EXHAUSTION
· A computer network, as of today*, consists of layers · A network resource is not available to its users
when at least one network layer fails to provide service · Hence, a DDoS attack can be attributed to a network layer which it affects

L2 Generic bandwidth
L3 exhaustion

L4 Exploitation of
L5 TCP/TLS edge cases
L6

L7 App-specific bottlenecks

ATTACK EXAMPLES
L2-3
· Volumetric attacks: UDP flood, SYN flood, amplification, and so on (we don't need to care exactly)
· Infrastructure attacks

TYPICAL AMPLIFICATION ATTACK

· Most servers on the Internet send more data to a client than they receive
· UDP-based servers generally do not verify the source IP address
· This allows for amplification DDoS

Attacker

Victim

Src: victim (spoofed) Dst: amplifier
"ANY? com."
1 Gbps

Src: amplifier Dst: victim
"com. NS i.gtld-..."
29 Gbps

VULNERABLE PROTOCOLS

· A long list
· Mostly obsolete protocols
· Modern protocols such as gaming also contribute

· NTP · DNS · SNMP · SSDP · ICMP · NetBIOS

· RIPv1 · PORTMAP · CHARGEN · Quake · Steam · Memcached ·...

VULNERABLE SERVERS
· As it's mostly obsolete servers, they eventually get updated
· or replaced · or just trashed
· Thus, the amount of amplifiers shows steady downtrend
· However, once in a while, a new vulnerable protocol is discovered

PROOF OF SOURCE ADDRESS OWNERSHIP
E.g., QUIC (a modern, IETF-designed transport layer protocol): · Initial handshake packet is padded to 1280 bytes · Source address validation Other UDP-based protocols MUST implement similar measures

L2-3 MITIGATION
From a victim's perspective: · Anycast network with enough inspection power · Inventory management to drop unsolicited traffic vectors
(e.g. UDP towards an HTTP server) · Rate-limiting less important traffic · Challenges and handshakes (more on that later)
From an ISP's view: · Simple heuristics against typical attacks · RTBH (and let the customer take care of it themselves)

ATTACK EXAMPLES
L2-3
· Volumetric attacks: UDP flood, SYN flood, amplification, and so on (we don't need to care exactly)
· Infrastructure attacks

ATTACK EXAMPLES
L2-3
· Volumetric attacks: UDP flood, SYN flood, amplification, and so on (we don't need to care exactly)
· Infrastructure attacks
L4-6
· SYN flood, TCP connection flood, Sockstress, and so on
· TLS attacks

ATTACK EXAMPLES
L2-3
· Volumetric attacks: UDP flood, SYN flood, amplification, and so on (we don't need to care exactly)
· Infrastructure attacks
L4-6
· SYN flood, TCP connection flood, Sockstress, and so on
· TLS attacks

An attack can affect multiple layers at once

COMBINED ATTACKS
· Say, NTP amplification and SYN flood at the same time.
· The idea is to divert attention of people who are in charge of mitigation and to prevent them from focusing on the real threat

COMBINED ATTACKS IN IOT · The idea is to divert attention of people who are in charge of mitigation and to prevent them from focusing on the real threat
21:30:01.226868 IP 94.251.116.51 > 178.248.233.141: GREv0, length 544: IP 184.224.242.144.65323 > 167.42.221.164.80: UDP, length 512
21:30:01.226873 IP 46.227.212.111 > 178.248.233.141: GREv0, length 544: IP 90.185.119.106.50021 > 179.57.238.88.80: UDP, length 512

L4+ MITIGATION
· SYN flood: 3-way handshake-based SYN cookies & SYN proxy, allowing a victim to verify the source IP address
· Other packet-based flood: other handshakes and challenges to do the same
· The rest: session analysis, heuristics and blacklists
It is dangerous to use blacklists or whitelists without source IP address verification!
· Do not forget about inventory management!

L4+ MITIGATION
· It's wrong to believe L4 is only TCP
· New transport protocols are implemented
· By vendors · By applications · By IETF
· End-user servers? · End-user backoffice? · Transit and ISPs?

IPv6 ISSUES
128-bit IP addresses · Possible: to address each atom on the Earth surface · Impossible: to store a large number of entries in memory
· About 10 years ago, blacklisting whole IPv4 networks was already considered a bad practice
· With IPv6, this method has no other way than to return

ATTACK EXAMPLES
L2-3
· Volumetric attacks: UDP flood, SYN flood, amplification, and so on (we don't need to care exactly)
· Infrastructure attacks
L4-6
· SYN flood, TCP connection flood, Sockstress, and so on
· TLS attacks

ATTACK EXAMPLES
L2-3
· Volumetric attacks: UDP flood, SYN flood, amplification, and so on (we don't need to care exactly)
· Infrastructure attacks
L4-6
· SYN flood, TCP connection flood, Sockstress, and so on
· TLS attacks
L7
· Application-based flood

WORDPRESS PINGBACK
GET /whatever User-Agent: WordPress/3.9.2;
http://example.com/; verifying pingback from 192.0.2.150
· 150 000 ­ 170 000 vulnerable servers at once
· SSL/TLS-enabled

ANOTHER EXAMPLE OF A L7 ATTACK: FBS
· A bot can actually be more clever than a Wordpress machine · Advanced botnets are capable of using a headless browser
(IE/Edge or Chrome) => "full browser stack" (FBS) botnets · A FBS-enabled bot is able to go through even complex challenges, like Javascript code execution

ANOTHER EXAMPLE OF A L7 ATTACK: FBS
CAPTCHA is a weapon of last resort against FBS if there's no decent passive analysis running.
Advantages:
· Easy to implement · Generally, might work

ANOTHER EXAMPLE OF A L7 ATTACK: FBS
Drawbacks of CAPTCHA (1/3):
· Requires UX injection, may break UX · Breaks mobile applications · Sometimes harder for humans than for robots

ANOTHER EXAMPLE OF A L7 ATTACK: FBS
Drawbacks of CAPTCHA (2/3):
· Requires UX injection, may break UX · Breaks mobile applications · Sometimes harder for humans than for robots · Not all bots are malicious, and not all humans are innocent · CAPTCHA proxies and farms, like http://antigate.com/ · Malware is able to inject CAPTCHA into pages
user of the infected computer is looking at

ANOTHER EXAMPLE OF A L7 ATTACK: FBS
Drawbacks of CAPTCHA (3/3):
· Requires UX injection, may break UX · Breaks mobile applications · Sometimes harder for humans than for robots · Not all bots are malicious, and not all humans are innocent · CAPTCHA proxies and farms, like http://antigate.com/ · Malware is able to inject CAPTCHA into pages
user of the infected computer is looking at · OCR tools evolve fast · Voice recognition evolves even faster · "Security by obscurity": an open-sourced CAPTCHA is relatively easy to
break using open source machine learning tools. Example: https://medium.com/@ageitgey/how-to-break-a-captcha-system-in-15minutes-with-machine-learning-dbebb035a710

ANOTHER EXAMPLE OF A L7 ATTACK: FBS
"Proof of work", like mining cryptocurrency in Javascript on the client side?
· Infeasible. a) A typical botnet is hundreds of thousands machines; b) A typical Web site is fighting for milliseconds of page load time.

ANOTHER EXAMPLE OF A L7 ATTACK: FBS
· Under most conditions, unlike Wordpress pingback, such attacks won't cause a link degradation
· Hence generally out of scope of an ISP's responsibility

L7 MITIGATION: COMPLICATED
Active: · HTTP/JS challenges · CAPTCHA
Passive: · Application session analysis · Big Data · Correlation, machine learning
Monitoring, incident response

FALSE P/N
· Everything learning-based is not strict · A false positive: the algorithm shows a match
when there's no match · A false negative: the algorithm shows no match
when there's a match
· Basically, any algorithm may be tuned to either 0% FP or 0% FN · The truth is somewhere in between · The balance is defined by the purpose

ATTACK EXAMPLES
L2-3
· Volumetric attacks: UDP flood, SYN flood, amplification, and so on (we don't need to care exactly)
· Infrastructure attacks
L4-6
· SYN flood, TCP connection flood, Sockstress, and so on
· TLS attacks
L7
· Application-based flood

A classification which is: · Mutually exclusive * · Collectively exhaustive

THE INTERNET IS A COMPLEX THING
A decades old job interview quiz: "What happens when you type isc.360.cn in your browser?" · https://github.com/alex/what-happens-when:

WHAT HAPPENS WHEN?.. · DNS lookup · Opening of a socket · TLS handshake · HTTP protocol · HTTP Server Request Handle

WHAT HAPPENS WHEN?..
· DNS lookup · IPv4/IPv6 selection · Opening of a socket · Deep packet inspection · TLS handshake · CRL/OCSP · HTTP protocol · Load balancer · HTTP Server Request Handle · CDN

· An application server could not only be a direct target of a DDoS attack
· Each step could suffer from an attack, L2-L7-wise
· Inventory management · Infrastructure monitoring · Eliminating human factor
where it's possible to

ARCHITECTURAL VIEW
· Security is not a product, not an appliance or cloud, it's a process · Ability of a DDoS mitigation must be built into the design of any protocol · A concerned company must follow policies:
· Updates · Risk management · Incident handling
· Collaboration and timely reaction · Reach out to your CERT/CSIRT for advisory



