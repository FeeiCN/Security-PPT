WHY CORRUPTED (?) SAMPLES IN RECENT APT? CASE OF JAPAN AND TAIWAN
By Suguru Ishimaru

Dec 2016

Introduction

Introduction
$ whoami
Suguru_ISHIMARU
$ whois suguru_ishimaru
Job_title: Researcher Department: Global Research Analysis Team Organization: Kaspersky Labs E-mail: suguru.ishimaru[at]kaspersky.com

My last blogpost was Conference Report: HITCON 2016 in Taipei

3 | https://securelist.com/blog/events/75730/conference-report-hitcon-2016-in-taipei/

Contents

Contents
$ history | tail -n5 139 problem 140 motivation 141 emdivi 143 elirks 144 conclusion
5|

Problem

Problem: A lot of targeted attacks
More than 40 APT
7|

Problem: The biggest issue is...

Question: What is the biggest problem in APT seen from antivirus side?

Hard work

No sample

No detect

We collect mass spread samples. However, we could not get APT samples easily. Especially, second stage sample is extremely rare.

8|

Problem: Corrupted samples
We found samples, sometimes they were corrupted. That means they are executable but crashing:
1. Memory dump 2. Unknown binary data 3. Broken data 4. Cured by Anti Virus 5. Quarantined file 6. Password encrypted archive without password
9|

Problem: Why corrupted samples?
Question: Why corrupted samples in recent APT?
I will tell you my answer in conclusion
10 |

Motivation

Motivation: What should we do?

Question: What should we do when we got corrupted malware in APT?

Just Ignore

Make AV signature

Deep Analysis

1. Checking really corrupted or not 2. Getting information of related others
12 |

Motivation: Two recent APT cases
Probably corrupted (?) samples have found in two recent APT.

Emdivi

Elirks

13 |

Emdivi

Emdivi: Overview
1. The Blue Termite APT campaign 2. Target region is Japan mainly 3. C2s on compromised legitimate sites 4. spear phishing email 5. drive-by dowonload 6. Watering hole attacks 7. CVE-2014-7247 8. CVE-2015-5119
15 |

Emdivi: History
JUL 2011 Target to web site in Taiwan

NOV 2013 Oldest sample of Emdivi NOV 2014 Operation CloudyOmega by Symantec

MAY 2015 JUL 2015 AUG 2015

Japan pension service Emdivi + PlugX Attacks of Flash Player 0day (CVE-2015-5119) by Trendmicro New activity of the Blue Termite APT by Kaspersky

MAY 2016 Security report about APT (Emdivi) by Macnica

16 |

Emdivi: Infection vector

spear phishing e-mail

self-extracting archives (SFX) file

drive by download
watering hole attacks
17 |

CVE-2015-5119

emdivi t17 emdivi t20

Emdivi: Target
Regions: · Japan · Taiwan
Industries: 1. Government 2. Universities 3. Financial services 4. Energy 5. Food 6. Heavy industry 7. Chemical 8. News media 9. Health care 10. Insurance 11. Security researcher 12. Internet service provider
18 |

To create infrastructure
Japan Hosting provider
Taiwan web site

Emdivi: Corrupted (?) samples
We collected more than 600 samples related to this attacks, around 25 percents were Emdivi samples. Among them, 6 percents did not work.
19 |

Emdivi: Important data was encrypted

Emdivi family stores encrypted important data: C2, API name, strings for anti-analysis, value of mutexes, as well as the md5 checksum of backdoor commands and the internal proxy information

generate_base_key salt1 = md5sum(version.c2id...) salt2 = hardcoded long data

axxetseakekye(y1(632bybteyt)e) Modified xxtea_decrypt

encrypted data

%program files%

20 |

Emdivi: Corrupted (?) ustomized samples

generate_base_key salt1 = md5sum(version.c2id...) salt2 = hardcoded long data salt3 = SID of specific victim

axxetseakekye(y1(632bybteyt)e) xxtea_decrypt + add and sub

encrypted data

u%npkrnoogwranmdafilteas%

Is it possible to analyze?
We could brute force a xxtea key
21 |

Emdivi: Corrupted (?) ustomized samples
We published the details as a blog in securelist.com
Is it possible to analyze? No
22 |

Emdivi: DEMO Emdivi t20 AES + SID
23 |

Elirks

Elirks: Overview
1. As known as PLURK 2. The Elirks APT campaign 3. Unique schema to connect real C2 4. Target Regions are Taiwan, Japan 5. Trojan dropper is fake folder icon 6. Decoys were sometimes airline e-ticket
This group uses several types of malware Elirks, Ymailer, Ymailer-mini and Micrass. This presentation is forcusing Elirks
25 |

Elirks: History
MAR 2010 Oldest Elirks sample

JUL 2012

Chasing Advanced Persistent Threats (APT) by SecureWorks

JUL 2013

Hunting the Shadows by Fyodor Yarochkin, Pei Kan PK Tsung, Ming-Chang Jeremy Chiu, Ming-Wei Benson Wu

AUG 2015
MAR 2016 JUN 2016 SEP 2016
OCT 2016 NOV 2016

Let's Play Hide and Seek In the Cloudby Ashley, Belinda
Japan Tourist Bureau (JTB) Elirks + PlugX Tracking Elirks Variants in Japan: Similarities to Previous Attacks by paloalto MILE TEA: Cyber Espionage Campaign Targets Asia Pacific Businesses and Government Agencies by paloalto
BLACKGEAR Espionage Campaign Evolves by trendmicro
Japan Business Federation Elirks + PlugX

26 |

Elirks: Infection vector

spear phishing e-mail

Trojan dropper spoofing folder icon

create dir, decoy and delete it self

fake folder icon: 78 %
Elirks malware
27 |

Elirks: Target
Regions:
· Taiwan · Japan

Industries: 1. Government 2. Universities 3. Heavy industry 4. News media 5. Trading 6. Airline 7. Travel agency
28 |

Japan

Taiwan

Decoys of airline e-ticket

Elirks: Unique schema to connect real C2
The Elirks malware has unique schema to connect real C2. It connects blogpost of legitimate site getting encrypted real C2 information.

A post in legitimate blog

Malware config
29 |

Decrypt function

Real C2

Elirks: Corrupted (?) samples
We collected more than 200 samples. Among them, less than 3 percent were probably corrupted. Then we confirmed why these samples does not work.
30 |

Elirks: Elirks has three encrypted data

generate_base_key data_of_key_salt

aes key (16 byte)

anti emu key (1 byte / 2 byte) aes_expkey_array[4]

aes_decrypt

0x417530 encrypted data (10768 byte)

0x401000 malware func1 (10768 byte)

0x419F40 encrypted data (10736 byte)

0x405CF0 malware func2 (10736 byte)

0x41FF88 encrypted data (1504 byte)
31 |

0x41FF88 malware config (1504 byte)

Elirks: Decrypted Elirks
0x401000 unknown data (10768 byte) 0x405cf0 unknown data (10736 byte)
0x41FF88 encrypted data (1504 byte)
32 |

0x401000 malware func1 (10768 byte) 0x405CF0 malware func2 (10736 byte) 0x41FF88 malware config (1504 byte)

Elirks: Corrupted (?) samples
A corrupted (?) sample does not decrypt malware config. That means does not work and can not analyze.

0x41CE28 encrypted data (1504 byte)
33 |

0x41CE28 malware config (1504 byte)

Elirks: DEMO Elirks probably corrupted (?) sample
34 |

Elirks: Corrupted (?) ustomized samples
It was customized sample for specific victims Compare specific dir and current dir to extract 4 bytes xor key as part of generate AES key
aes key (16 byte)

0x41CE28 encrypted data (1504 byte)
35 |

0x41CE28 malware config (1504 byte)

Conclusion

Conclusion: Answer of my title's question
Question: Why corrupted (?) samples in recent APT?
It's not corrupted. The attacker developed
customized malware
When you find corrupted sample, It might to be chance of analysis very interesting APT malware
37 |

Conclusion: Whitelist approach in APT
Common malware should work in any environment.
APT malware have to work in specific environment.
This approach and introduced new techniques are very simple ,However it works effectively.
38 |

Thank You
suguru.ishimaru[at]kaspersky.com
39 |

