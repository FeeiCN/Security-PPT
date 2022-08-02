Security Response in the Age of Mass Customized Attacks
Peleus Uhley and Karthik Raman
© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

Overview
 Intro  Attack Evolution  Mass Customization  Mass Commercialization  Looking to the Future  Conclusion

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

2

About PSIRT
 Adobe PSIRT = Adobe Product Security Incident Response Team  PSIRT is part of ASSET, the Adobe Secure Software Engineering Team

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

3

Adobe PSIRT's Role
 Work with product teams to create fixes  Work with researchers to verify fixes  Publish bulletins  Drive Adobe's involvement in MAPP

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

4

Attack Evolution
© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

Mass Customization

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

6

Mass Customization

Customization and personalization of products and services for individual customers at a mass production price.
- Stan Davis

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

7

Mass Production

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

8

Customization

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

9

Mass Malware = Mass Produced
 Exploit kits
 BlackHole, Phoenix, Mpack, Crimepack, Eleonore  Multiple browser and vulnerable plugin versions supported
 New modules can be added
 0-day exploits repurposed and added periodically  Payloads are also modules
 Components can be hosted anywhere
 Serve exploits from anywhere  Serve malware from anywhere
 Low cost, ~$1000  Organized groups or gangs

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

10

Mass Malware Characteristics
 Potency  Resilience  Cost (proportional to versions supported)

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

11

Mass Malware Technical Characteristics
 Support multiple OS platforms
 Support multiple payloads
 Support multiple deployment scenarios
 Complex obfuscation
 CVE-2010-0188
 Redkit, Cool, Blackhole, Nuclear, Grandsoft, Sweet Orange, NucSoft, Hierarchy, Techno Xpack, Phoenix

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

12

Case Study in Mass Malware: CVE-2010-0188

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

13

CVE-2010-0188

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

14

CVE-2010-0188

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

15

CVE-2010-0188

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

16

CVE-2010-0188

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

17

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

18

CVE-2011-2462

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

20

CVE-2011-2462

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

21

CVE-2011-2462

Like most JavaScript observed in other malicious files, checks are done for the proper version number before the main routines are executed. What is interesting about this document is that it checks for versions that do not exist and makes a point to redirect the user to an infinite loop assuming they are running a version greater than 10.
-Brandon Dixon

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

22

CVE-2011-2110
 Dynamically passing obfuscated data main.swf ?info=02E6B1525353CAA8AD555555AD31B3D73034B657AA31B4 B5AFB5B2B537AF55543549AEB550AC55303736B337AF51D3527B7AF4C66 B7E
 Targeting specific versions if ((((((Capabilities.version.toLowerCase() == "win 10,3,181,14")) || ((Capabilities.version.toLowerCase() == "win 10,3,181,22")))) || ((Capabilities.version.toLowerCase() == "win 10,3,181,23")))){

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

23

Mass Customization
© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

What Drives Mass Customization

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

25

Response and Feedback

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

26

Mass Customized Attacks

Mass Malware Features

0-Day Exploits

Mass Customized
Attacks

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

27

Case Study 1: CVE-2013-0633
 Mass malware characteristic: Version checking

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

28

Modular Design - CVE-2013-0633

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

29

Case Study 2: CVE-2013-0634 (aka Lady Boyle)
 Attack used complex memory layout to achieve information leak  Tied back to "july.swf " (CVE-2012-5054)  First exploit to target Safari and Firefox on a Mac  Windows version delivered via Office documents  Windows version had payloads for 32-bit and 64-bit version  The malicious 32-bit payload was digitally signed

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

30

Multiple Win Platforms - CVE-2013-0634

switch (_local19) { case "windows 7": break; case "windows server 2008
r2": break;
case "windows server 2008":
break; case "windows server 2003 r2":
break; case "windows server 2003":
break; case "windows xp":
break; case "windows vista":
break; default:
return (this.empty()); };

switch (_local27)  case "win 11,5,502,146": ... case "win 11,5,502,135": ... case "win 11,5,502,110": ... case "win 11,4,402,287": ... case "win 11,4,402,278": ... case "win 11,4,402,265": ...

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

31

Case Study 3: CVE-2013-0640
 Reader 0-day is not one bug!  One buffer overflow  One information leak  One sandbox escape  JavaScript was heavily obfuscated

 Used Reader extended features

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

32

Supported Versions - CVE-2013-0640
 11.0.1.36  11.0.0.379  10.1.5.33  10.1.4.38 (plus sub-version for three languages)  10.1.3.23  10.1.2.45  10.1.0.534  9.5.3.305  9.5.2.0 (plus sub-version for three languages)  9.5.0.270

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

33

Case Study 4: CVE-2013-0648
 Flash sandbox escape
 Appeared to still be under development:
 Targeted a single older version of Flash Player  Only targeted Firefox
 ActionScript had shell code for MSIE, Firefox, Opera and Chrome
 Required two SWFs and a web page

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

34

Digital Evidence of Commercialization

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

35

Definition of APT
 There are multiple definitions of APT:
 The group behind my embarrassing XSS attacks  The reason you should buy my new magical security widget  Groups that conduct international cyber attacks for economic or military gain
 One government TLA representative described APT as, "Any attack that involves a project manager."

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

36

Evidence of Project Managers?
 Reversing the spec from the code leads to the following assumptions:
 "Support all versions of Reader"  "Support all versions of Windows"  "Support all current versions of Flash"  "Support all browsers"
 Reader 0-day was approx. 8,750 SLOC of JavaScript alone
 As complexity increases, will this cartoon soon apply to exploits?

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

37

Looking Towards the Future
© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

More Focused Attacks
 Increased attack resources and automation will lead to a lower cost of entry and more focused attacks
 Ability to target platforms with smaller distribution numbers such as Macs
 Loose coupling means faster turnaround for copy cat attacks (MiniDuke, itaDuke, etc.)

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

39

Multi-Vendor/Multi-Product Customizations
 Pwn2Own 2013
 Chrome + Windows kernel exploit  Flash Player + IE10 exploit
 CVE-2013-0648 involved two Adobe products
 Peter Vreugdenhil discussed a multi-vendor PDF exploit at CanSecWest 2013

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

40

Response Must Grow
 As attacks become more complex, response becomes more complex
 Flash sandbox escape -2 bugs  PinkiePie's Pwnium attack - 6 bugs  Reader sandbox escape - 3 bugs  Sergey Glazunov's Pwnium attack - 14 bugs
 Analysis must include shell code payloads
 Defense in depth approach
 Multi-vendor/multi-product coordination

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

41

Possible Benefits for Defenders
 A quick patch on to a critical link in the chained exploit may buy time to address the other bugs
 For AV/IDS/IPS vendors:
 Disadvantage: Need signatures for each component  Advantage: Possibly target the frameworks which have less flexibility in changing
 Greater exploit complexity means that attackers have a greater chance for bugs in their own code (we hope  )

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

42

Future Defensive Research: Normalization

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

43

Conclusion

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

44

Conclusion
Mass Malware Features

0-Day Exploits

Mass Customized
Attacks

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

45

Response to Mass Customization
 Flexible manufacturing systems/product modularization
 Response becomes proportional to exploit complexity  Shell code payloads must be analyzed for additional bugs  Must be prepared for multi-product/multi-vendor situations

 Cycle time reduction, shortening product lifecycle
 Quick response & distribution due to ease of incorporating into mass malware  Increased rate of updates

 Increased customization
 Defense in depth for meta bugs  Robust patch testing

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

46

Questions?
 ASSET Blog
 https://blogs.adobe.com/asset/
 Adobe PSIRT
 psirt@adobe.com
 Email
 puhley@adobe.com  kraman@adobe.com
 Twitter
 https://twitter.com/PeleusUhley

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

47

Credits
 Ford Model T: http://commons.wikimedia.org/wiki/File:Restored_Ford_Model_T.jpg  Principles of Mass Production, Competitive Landscape in 1990s, Comparisons:
http://books.google.com/books?isbn=0875849466  Mass Customization: The New Frontier in Business Competition:
http://books.google.com/books?id=2_3PMy4LQHkC  Bugatti Replica:
http://commons.wikimedia.org/wiki/File:Long_Beach_custom_car_show_1991_-_Flickr__exfordy_%285%29.jpg  ZDNet Zero Day blog: http://www.zdnet.com/suspected-hackers-behind-carberp-botneteurograbber-arrested-7000013580/  Lady Boyle: Image: http://www.behindthevoiceactors.com/_img/chars/char_82998.jpg  Development process: http://wisevishvesh.files.wordpress.com/2010/10/sdlc.jpg?w=869  Chaouki Bekrar: https://twitter.com/thezdi/status/310181147445444609/photo/1

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

48

© 2013 Adobe Systems Incorporated. All Rights Reserved. Adobe Confidential.

