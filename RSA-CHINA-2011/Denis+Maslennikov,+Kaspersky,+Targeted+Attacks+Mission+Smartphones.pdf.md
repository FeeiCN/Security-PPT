Targeted Attacks: Mission `Smartphones'
SpeakerDenis Maslennikov
Job TitleSenior Malware Analyst
Company NameKaspersky Lab

Agenda
· Targeted attacks on smartphones
­ What are they?
· Target: smartphone. Why?
­ Consumerization and threats
· How targeted attack could proceed
­ Details on possible scenarios
· How to suppress targeted attacks?

PAGE 2 |

RSA 2011 Conference, China, Beijing | November 3, 2011

Targeted attacks on smartphones · Targeted attack on smartphone
An attack on a smartphone which aims to steal corporate data stored on a device

PAGE 3 |

RSA 2011 Conference, China, Beijing | November 3, 2011

Targeted attacks on smartphones
· Targeted attack on smartphone
An attack on a smartphone which aims to steal corporate data stored on a device
· Small F.A.Q.
­ Can targeted attacks be real?
· We'll discuss this later

PAGE 4 |

RSA 2011 Conference, China, Beijing | November 3, 2011

Targeted attacks on smartphones
· Targeted attack on smartphone
An attack on a smartphone which aims to steal corporate data stored on a device
· Small F.A.Q.
­ Can targeted attacks be real?
· We'll discuss this later
­ Have they taken place already?
· It is possible that they have taken place

PAGE 5 |

RSA 2011 Conference, China, Beijing | November 3, 2011

Target: smartphone
Why?

Target: smartphone. Why?

Mobile Devices Sales to End Users by Device Category Smartphones (Thousands of Units)

2009

2010

2011

2012

Asia/Pacific

37 579,0

50 793,3

69 238,2

94 896,4

Eastern Europe

6 969,0

9 104,5

13 244,7

20 365,3

Japan

17 426,7

18 369,0

19 976,4

25 636,9

Latin America Middle East and Africa

7 251,7 12 005,3

10 453,5 15 338,6

18 626,9 22 744,8

29 003,3 35 264,1

North America

45 601,8

66 695,3

89 861,2

104 698,4

Western Europe

45 540,7

79 373,1

139 580,6

174 321,3

Total

172 374,2

250 127,2

373 272,9

484 185,7

PAGE 7 |

RSA 2011 Conference, China, Beijing

Gartner, Forecast: Mobile Devices, Worldwide, 2003-2014, 1Q10 Update
| November 3, 2011

Target: smartphone. Why?
· Your device contains a lot of `interesting' things
­ outgoing SMS messages to your friends ­ work emails ­ business contacts ­ trip calendar ­ vacation photos
­ GPS coordinates
· So, your device is you!

PAGE 8 |

RSA 2011 Conference, China, Beijing | November 3, 2011

Target: smartphone. Why?

· Mobile malware:

­ Almost 100% growth of threats in 2011 over 2004-

2010

Number of modifications

800

700

600

500

400

300

200

100

0

PAGE 9 |

RSA 2011 Conference, China, Beijing | November 3, 2011

Source: Kaspersky Lab

Target: smartphone. Why?
Malware for smartphones, 2011
3,02% 0,50% 0,62% 0,06%

95,80%
PAGE 10 | RSA 2011 Conference, China, Beijing | November 3, 2011

Android Symbian Windows Mobile iOS Blackberry
Source: Kaspersky Lab

Target: smartphone. Why?

Android modifications vs. Mobile malware modifications
800

700

600

500

400

Mobile malware

Android malware
300

200

100

0 2010-8 2010-9 2010-10 2010-11 2010-12 2011-1 2011-2 2011-3 2011-4 2011-5 2011-6 2011-7 2011-8 2011-9
PAGE 11 | RSA 2011 Conference, China, Beijing | November 3, 2011

Source: Kaspersky Lab

How targeted attack could proceed
Details on possible scenario

Profiling the target: step 1 · Profiling the target
­ Trying to find the most vulnerable
PAGE 13 | RSA 2011 Conference, China, Beijing | November 3, 2011

Profiling the target: step 1 · Profiling the target
­ Trying to find the most vulnerable ­ Social networks, again
PAGE 14 | RSA 2011 Conference, China, Beijing | November 3, 2011

Profiling the target: step 2 · Retrieving a phone number
­ It's even easier than email!
PAGE 15 | RSA 2011 Conference, China, Beijing | November 3, 2011

Profiling the target: step 3 · Retrieving a device model
­ It's also rather easy!
PAGE 16 | RSA 2011 Conference, China, Beijing | November 3, 2011

Profiling the target: step 3 · Retrieving a device model
­ It's also rather easy!
PAGE 17 | RSA 2011 Conference, China, Beijing | November 3, 2011

Sniffing: illustration 
PAGE 18 | RSA 2011 Conference, China, Beijing | November 3, 2011

Sniffing · Using public Wi-Fi on corporate device?
­ Not a good idea at all!
PAGE 19 | RSA 2011 Conference, China, Beijing | November 3, 2011

Sniffing · Using public Wi-Fi on corporate device?
­ Not a good idea at all!
PAGE 20 | RSA 2011 Conference, China, Beijing | November 3, 2011

Physical access

Where is your device?
PAGE 22 | RSA 2011 Conference, China, Beijing | November 3, 2011

Scene from...
PAGE 23 | RSA 2011 Conference, China, Beijing | November 3, 2011

Scene from `The Dark Knight'
PAGE 24 | RSA 2011 Conference, China, Beijing | November 3, 2011

Real life example · More serious issues
PAGE 25 | RSA 2011 Conference, China, Beijing | November 3, 2011

Screen lock: PIN · Direct physical access
­ Passcode?
PAGE 26 | RSA 2011 Conference, China, Beijing | November 3, 2011

Screen lock: PIN · Direct physical access
­ Passcode?
­ 1234/birth year/0000/9876/etc?
PAGE 27 | RSA 2011 Conference, China, Beijing | November 3, 2011

Screen lock: swipe lock · Direct physical access
­ Swipe lock?
PAGE 28 | RSA 2011 Conference, China, Beijing | November 3, 2011

Screen lock: swipe lock · Direct physical access
­ Swipe lock?
PAGE 29 | RSA 2011 Conference, China, Beijing | November 3, 2011

Screen lock: swipe lock
· Direct physical access
­ Swipe lock?

· Complete retrieval: 68%

PAGE 30 |

Smudge Attacks on Smartphone Touch Screens; Aviv, Gibson, Mossop, Smith, University of Pennsylvania
RSA 2011 Conference, China, Beijing | November 3, 2011

Physical access: possible result · Present with pre-installed malware
­ Classic Trojan attack
PAGE 31 | RSA 2011 Conference, China, Beijing | November 3, 2011

Remote attack

Unique malware · What functionality is necessary?
­ Mask itself ­ Read data stored on smartphones ­ Retrieve GPS coordinates
· Where have you been and where are you now
­ Able to communicate with the drop-zone
· Upload stolen information
PAGE 33 | RSA 2011 Conference, China, Beijing | November 3, 2011

Functionality
In discovered malware
· Has it been done?
Read data GPS
Disguise Communication

Monitor.AndroidOS.Flesp
Monitor.AndroidOS.Tapsnake
Trojan-Spy.AndroidOS.Geinimi Backdoor.AndroidOS.Rooter
(DroidDream)

PAGE 34 | RSA 2011 Conference, China, Beijing | November 3, 2011

Delivering the malware · Usage of social engineering tricks to get the
victim to click on a link:
­ In the SMS spam message ­ In the Skype spam message ­ In the social network spam message
PAGE 35 | RSA 2011 Conference, China, Beijing | November 3, 2011

(Un)Trusted sources · `But I use only official application stores!' · Malware in the Android Market
­ March 1, 2011
· Malicious apps have been available for several days
PAGE 36 | RSA 2011 Conference, China, Beijing | November 3, 2011

(Un)Trusted sources · `But I use only official application stores!' · Malware in the Android Market
­ March 1, 2011
· Malicious apps have been available for several days
­ May 11, 2011
· Malicious apps have been available for several...
...months?
PAGE 37 | RSA 2011 Conference, China, Beijing | November 3, 2011

(Un)Trusted sources · Android Market mirroring web sites
· Screenshot captured
May 12
· Malware uploaded
February 27
· 2,5 months before it was noticed!
PAGE 38 | RSA 2011 Conference, China, Beijing | November 3, 2011

Successful targeted attack
Results

General scheme
PAGE 40 | RSA 2011 Conference, China, Beijing | November 3, 2011

General scheme
PAGE 41 | RSA 2011 Conference, China, Beijing | November 3, 2011

General scheme
PAGE 42 | RSA 2011 Conference, China, Beijing | November 3, 2011

General scheme
PAGE 43 | RSA 2011 Conference, China, Beijing | November 3, 2011

Results · Mission accomplished
­ Necessary information was stolen or accessed
· What's next?
PAGE 44 | RSA 2011 Conference, China, Beijing | November 3, 2011

Results
· Mission accomplished
­ Necessary information was stolen or accessed
· What's next?
­ Information can be sold
· To competitors · To third party
­ Blackmailing ­ Disclosure to public ­ Erasure or modification
PAGE 45 | RSA 2011 Conference, China, Beijing | November 3, 2011

How to suppress targeted attacks

Suppressing targeted attacks · Don't use public or untrusted Wi-Fi networks
­ WPA2 encryption ­ 3G/4G is more secure
PAGE 47 | RSA 2011 Conference, China, Beijing | November 3, 2011

Suppressing targeted attacks
· Don't use public or untrusted Wi-Fi networks
­ WPA2 encryption ­ 3G/4G is more secure
· Physical security
­ Always keep an eye on your device
· Always!
­ Usage of strong screen lock password or tricky swipe lock is good idea
­ Remote wipe software must be mandatory for corporate devices
PAGE 48 | RSA 2011 Conference, China, Beijing | November 3, 2011

Suppressing targeted attacks
· Making life harder for remote attacker
­ Update OS and third party software regularly
­ Read all permissions carefully
· SMS sending for `media player' is not necessary
­ Ignore all SMS (and email) spam messages
· especially with URLs
­ Use encryption
· encode all critical data
­ Avoid jailbreaking or `rooting'
PAGE 49 | RSA 2011 Conference, China, Beijing | November 3, 2011

Last but not least
Don't think that your smartphone is safer
than your PC
PAGE 50 | RSA 2011 Conference, China, Beijing | November 3, 2011

Thank you! Targeted Attacks: Mission `Smartphones'
SpeakerDenis Maslennikov Job TitleSenior Malware Analyst Company NameKaspersky Lab

