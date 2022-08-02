Mobile App Moolah:
Profit taking with Mobile Malware
Jimmy Shah Mobile Security Researcher

Contents
· Who we are · Mobile malware · Modern for-profit malware · Examples
2 Mobile App Moolah: Profit taking with Mobile Malware

Who we are
· Mobile Antivirus Researchers · My team and I specialize in mobile malware and threat analysis on
existing(J2ME, SymbOS,WM, Apple iOS, Android) and upcoming mobile platforms. · We work with a number of large mobile network operators.
3 Mobile App Moolah: Profit taking with Mobile Malware

Mobile Malware
In the Wild
Historical For-profit malware Trends
4 Mobile App Moolah: Profit taking with Mobile Malware

In the Wild
1200+ variants
5 Mobile App Moolah: Profit taking with Mobile Malware

SymbOS J2ME Android Python WinCE MSIL VBS BlackBerry Exploit Linux OSX

Mobile Malware
In the Wild
Historical For-profit malware
Trends
6 Mobile App Moolah: Profit taking with Mobile Malware

J2ME/Redbrowser.A

· What it does
­ First reported J2ME trojan(2006) ­ Pretends to access WAP web pages via SMS messages ­ Written using the MIDletPascal programming tool
· Profit?
­ In reality, it attempts to send SMS messages to Premium Rate SMS numbers
­ Eventually spawned a large number of J2ME malware/variants

"Carefully read following description of RedBrowser program This program allows viewing WAP pages without GPRS connection. RedBrowser connects to SMS server of your operator (MTS, BEELINE, MEGAFON). Page is loaded by receiving coded SMS. First 5Mb (650 SMS) of traffic are provided free of charge in test mode. ATTENTION!!! Program RedBrowser works ONLY on above mentioned cellular operators."

RedBrowser installation prompt (Symbian OS, S60 UI)
7 Mobile App Moolah: Profit taking with Mobile Malware

description text (original text in Russian)

J2ME/Wesber.A
· What it does
­ No GUI, almost pure for-profit J2ME trojan ­ Program that disguises itself as an assistant program ­ It contains two jpg files within itself.
· Profit?
­ Sends SMS to premium rate number to purchase mobile phone games. ­ Presumably written to increase sales for the mobile site

Wesber installation prompt (Symbian OS, S60 UI)
8 Mobile App Moolah: Profit taking with Mobile Malware

Jpg files included but not displayed to user.

Mobile Malware
In the Wild Historical For-profit malware
Trends
9 Mobile App Moolah: Profit taking with Mobile Malware

Trends ­ Mobile Malware Lifecycle

R&D

Reuse

Profit Taking

10 Mobile App Moolah: Profit taking with Mobile Malware

Modern for-profit malware
For-profit malware by geographical region
How they Profit Detection/Analysis Evasion methods
11 Mobile App Moolah: Profit taking with Mobile Malware

For-profit malware by geographical region
12 Mobile App Moolah: Profit taking with Mobile Malware

For-profit malware by geographical region
100+ variants
Primarily J2ME w/ Android
SMS sending trojans
200+ variants
J2ME, Symbian, Android
SMS trojans, privacy stealing
13 Mobile App Moolah: Profit taking with Mobile Malware

Modern for-profit malware
For-profit malware by geographical region
How they Profit
Detection/Analysis Evasion methods
14 Mobile App Moolah: Profit taking with Mobile Malware

How they profit
· Production
­ Independent malware authors ­ Produce malware for sale
· Distribution
­ Forums, freeware sites, pirated software sites
15 Mobile App Moolah: Profit taking with Mobile Malware

How they profit
· Where's the money?
­ Premium Rate numbers · Ringtones, downloads, data services/newsfeeds
16 Mobile App Moolah: Profit taking with Mobile Malware

How they profit
· Where's the money?
­ Click Fraud, Black Hat SEO · Traffic generation, pay-per-click(PPC) ads
17 Mobile App Moolah: Profit taking with Mobile Malware

How they profit
· Where's the money?
­ Stealing, reselling PII
18 Mobile App Moolah: Profit taking with Mobile Malware

How they profit
· Where's the money?
­ SMS phishing, Injecting fake SMS · Download malware/adware, Drive traffic
19 Mobile App Moolah: Profit taking with Mobile Malware

How they profit
· Where's the money?
­ Stealing Accounts(Skype, QQ, SIM balances) · Using partner businesses to cash out
20 Mobile App Moolah: Profit taking with Mobile Malware

Modern for-profit malware
For-profit malware by geographical region How they Profit
Detection/Analysis Evasion methods
21 Mobile App Moolah: Profit taking with Mobile Malware

Detection/Analysis Evasion methods
· Infection of/Injection into clean apps ­ J2ME · Chat/IM apps · Games · Adult entertainment ­ Symbian · Chat/IM apps ­ Android · Games · Chat/IM apps
22 Mobile App Moolah: Profit taking with Mobile Malware

Encryption
· Simple
­ Obfuscations · Hiding SMS numbers/message text within plaintext HTML files
<link rel="stylesheet" type="text/css" href="/en/shar ed/core/2/css/css.ashx?sc=/en/us/site.config&amp;pt=cspMscomHomePage&amp;c=cspMscomSiteBrand;cspSearchComponent ;cspMscomFeaturePanel;cspMscomMasterNavigation;[<SMS#>:<MSG>]cspMscomNewsBand;cspVerticalRolloverTab;cspAdControl;cspMscomVe rticalTab;cspSilverGate" /><script type="text/javascript" src="http//i3.microsoft.com/library/svy/broker.js"> </script><meta name="SearchTitle" content="Microsoft.com" scheme="" /><meta name="Description" content="Get product information, support, and news from Microsoft." scheme="" /><meta name="Title" content="Microsoft.c
­ Substitution cipher · Config file containing encrypted SMS numbers/message text
<SMS#>::<MSG>::241.55. <SMS#>::<MSG>::173.88. <SMS#>::<MSG>::86.00.
23 Mobile App Moolah: Profit taking with Mobile Malware

Encryption
· Complex ­ Symmetric cipher
· DES
byte abyte1[] = k.b; DESKeySpec deskeyspec = new DESKeySpec(abyte1); javax.crypto.SecretKey secretkey = SecretKeyFactory.getInstance("DES").generateSecret(deskeyspec); Cipher cipher = Cipher.getInstance("DES"); b = cipher; cipher.init(2, secretkey);
· Used by Android/Geinimi to encrypt URL queries and C&C commands · Used by Android/DrddreamLite
­ to encrypt/decrypt config file » URLs, next connect time
­ to encrypt/decrypt C&C commands ­ to decrypt root exploits
24 Mobile App Moolah: Profit taking with Mobile Malware

Reduce security/bypass protection

· Disable Software installation controls
­ WinCE/InfoJack.A turns off the unsigned application prompt, allowing it to perform silent installations

Key HKEY_LOCAL_MACHINE\Security\Policies\Policies\0000101a

Value
0 = Enable Unsigned Application Prompt 1 = Disable Prompt

· Root vulnerabilities
­ Exploits are used legitimately by users to allow modifying or reflashing new OS versions
­ Android/DrdDream utilizes 2 root exploits to gain a foothold on android devices
­ Android/DrddreamLite uses very similar, 1 identical, root exploits
· Jailbreaking
­ Not In the Wild, used only in PoCs · e.g. Eric Monti's modified jailbreak at Toorcon 2010

25 Mobile App Moolah: Profit taking with Mobile Malware

Examples of for-profit malware
J2ME
Symbian Android Other
26 Mobile App Moolah: Profit taking with Mobile Malware

J2ME/SMSFree
· What it Does
­ Pretends to be a variety of legitimate apps · anonymous SMS sender · pornographic app · free SMS sender
­ Profit? · Instead of the user's message it sends to a Premium Rate number · Country specific SMS messages are sent ­ Russia (5 SMS) ­ Ukraine (4 SMS) ­ Kazakhstan (4 SMS)
27 Mobile App Moolah: Profit taking with Mobile Malware

J2ME/Vkonpass.A
· What it Does
­ Pretends to be a mobile client for the VKontakte social network ­ A phishing app, it emails the victim's account details to the attacker

To: From: Subject: Message:

ololoe2010yandex.ru bork_rulsmail.ru <username>:<password> <username>:<password>

· Profit?
­ Attackers collect VKontakte user accounts · Use trust relationships to spread malware/adware/spyware · Resell accounts · Blackmail users
28 Mobile App Moolah: Profit taking with Mobile Malware

Examples of for-profit malware
J2ME
Symbian
Android Other
29 Mobile App Moolah: Profit taking with Mobile Malware

SymbOS/Kiazha.A
· What it Does
­ Distributed as part of a larger collection of malware, SymbOS/MultiDropper.CR
­ Deletes incoming and outgoing SMS messages
· Profit?
­ Displays a warning message and attempts to extort money from the user ­ Money is to be transferred as the QQ coin virtual currency
Warning: Your mobile phone has been infected, please prepare a mobile phone recharge card of 50 Yuan RMB, and contact QQ<account removed>, or your phone will be paralyzed!!
30 Mobile App Moolah: Profit taking with Mobile Malware

Python/Reclof.A
· What it Does
­ Python script designed to run under the S60 Python interpreter ­ Pretends to be a Python client for ICQ
· Profit?
­ Sends SMS to premium rate number
appswitch.switch_to_fg(u'Phone')# try:messaging.sms_send('<XXXX>',u'FILES <XXX>')# , except:pass# ,
­ Deletes messages received from the same premium rate number
new=sms.sms_messages()# if len(new)!=0:# keypress.simulate_key(63555,63555)#  Right button keypress.simulate_key(63555,63555)#  Right Button for id in new:#
if sms.address(id)==u'<XXXX>':# sms.delete(id)#
31 Mobile App Moolah: Profit taking with Mobile Malware

SymbOS/SuperFairy.A-B

·

What it does

­ Adds bookmarks for a smartphone related forum

­ Launches a browser to view the forum

· Profit?

­ Generate traffic to the smartphone forum

· Auto-runs an app that creates the bookmarks

Bookmark title <removed>  - 
  

Translation <removed> Network - the first leg of mobile phone software Smart phone community
Free downloading mobile phone themes
Free downloading mobile phone games

URL http://<removed>.com/?id=<removed>
http://<removed>.com/?id=<removed> http://<removed>com/?id=<removed> http://<removed>/?id=<removed>

· A second app attempts to download files from the mobile phone forum

http://<removed>.com:8118/client/symbian/S60v2active.txt http://<removed>.com:8118/client/symbian/BackgroundUpdata.ini http://<removed>.com:8118/client/symbian/S60v2StartUpdata.ini

32 Mobile App Moolah: Profit taking with Mobile Malware

SymbOS/InSpirit.A

·

What it does

­ Pretends to be "91 calls show"

· With the "System acceleration patch"

­ Injects a phishing message into the Inbox

­ Text message is spoofed from a Chinese Bank

· Profit?

­ Text message directs victim to a mobile banking phishing site

· "Dear customer, <Bank> reminds you: your account password is entered wrongly for 5 times today. To avoid your fund loss, please login http://<removed>.com for account protection immediately."

33 Mobile App Moolah: Profit taking with Mobile Malware

Examples of for-profit malware
J2ME Symbian
Android
Other
34 Mobile App Moolah: Profit taking with Mobile Malware

Android/Geinimi.A
· What it does ­ Malicious code inserted into legitimate apps/games
· Most likely inserted manually rather than by a file infector
­ Additional permissions requested
· Reading/writing SMS, read/write contacts, access GPS, make phone calls, install shortcuts, etc.
35 Mobile App Moolah: Profit taking with Mobile Malware

Android/Geinimi.A, cont.
· What it does
­ Encryption
· backdoor commands, C&C URL queries
byte abyte1[] = k.b; DESKeySpec deskeyspec = new DESKeySpec(abyte1); javax.crypto.SecretKey secretkey = SecretKeyFactory.getInstance("DES").generateSecret(deskeyspec); Cipher cipher = Cipher.getInstance("DES"); b = cipher; cipher.init(2, secretkey);
­ Listens on 5432 for handshake, "hi,are you online?" · Responds with "yes,I'm online!" · Falls back to ports 4501 or 6543
­ Attempts to connect to local backdoor · Port 8791
36 Mobile App Moolah: Profit taking with Mobile Malware

Android/Geinimi.A, cont.
· Profit?
­ Backdoor commands · Forwarding SMS to C&C server · Installing additional software ­ malware/spyware · Forwarding contacts ­ New targets · Traffic generation ­ Loading URLs
37 Mobile App Moolah: Profit taking with Mobile Malware

Android/SteamyScr.A
· What it does
­ Malicious code inserted into legitimate app ­ Requests many additional permissions ­ Sends IMEI, IMSI, and ICCID to C&C server ­ Adds bookmarks for a smartphone related forum
· Profit?
­ Generate traffic to the smartphone forum ­ Send SMS messages
· Useful for signing up for Premium Rate Services ­ Installing additional software
· malware/spyware ­ Forwarding contacts
· New targets ­ Traffic generation
· Loading URLs
38 Mobile App Moolah: Profit taking with Mobile Malware

Android/Jmsonez.A
· What it does
­ Malicious code inserted into legitimate app ­ Requests many additional permissions
· Profit?
­ Send SMS messages · Useful for signing up for Premium Rate Services
­ Deletes messages from signed up services · No way to know you're subscribed
39 Mobile App Moolah: Profit taking with Mobile Malware

Android/Tcent.A
· What it does
­ Appears to be a system application ­ Sends IMEI and phone number to C&C server ­ Attempts to kill certain security applications
· Profit?
­ Signs up for Premium Rate Services ­ Deletes messages from signed up services
· No way to know you're subscribed
40 Mobile App Moolah: Profit taking with Mobile Malware

Android/Crusewin.A
· What it does
­ Pretends to be an MMS app ­ Sends IMEI and phone number to C&C server ­ Attempts to delete software
· Profit?
­ Send SMS messages · Useful for signing up for Premium Rate Services
41 Mobile App Moolah: Profit taking with Mobile Malware

Android/DroidKungfu
· What it does
­ Malicious code inserted into legitimate app ­ Installs backdoor to listen for commands ­ Sends IMEI, OS type, Device type, etc. to C&C server ­ Uses two root exploits to install a non-GUI version of the malware
· Profit?
­ Installing additional software · malware/spyware
­ Traffic generation · Loading URLs
42 Mobile App Moolah: Profit taking with Mobile Malware

Android/PJApp
· What it does
­ Malicious code inserted into legitimate IM app ­ Installs backdoor to listen for commands ­ Sends IMEI, IMSI, SIM serial number, etc. to C&C server
· Profit?
­ Send SMS messages · Useful for signing up for Premium Rate Services
­ Traffic generation · Adding Bookmarks
43 Mobile App Moolah: Profit taking with Mobile Malware

Android/Toplank.A
· What it does
­ Trojan pretending to be angry birds update · Similar to Oberheide's Twilight preview app
­ Alter/delete browser history ­ Downloads additional APK and loads the code
· Profit?
­ Add/delete bookmarks ­ Add/delete shortcuts ­ Display messages
· phishing
44 Mobile App Moolah: Profit taking with Mobile Malware

Android/BaseBridge.A
· What it does
­ Trojan pretending to be a legitimate app ­ Kills security software
· Profit?
­ Send SMS messages · Useful for signing up for Premium Rate Services
45 Mobile App Moolah: Profit taking with Mobile Malware

Android/J.SMSHider.A
· What it does
­ Malicious code inserted into legitimate app ­ Installs backdoor to listen for commands ­ Sends IMEI, IMSI, GPS coords. to C&C server
· Profit?
­ Signs up for Premium Rate Services ­ Deletes messages from signed up services
· No way to know you're subscribed ­ Installing additional software
· malware/spyware
46 Mobile App Moolah: Profit taking with Mobile Malware

Android/GoldDream
· What it does
­ Malicious code inserted into legitimate game ­ Installs backdoor to listen for commands
· Profit?
­ Forwards SMS messages · Useful for intercepting mTANs
­ Send SMS messages · Useful for signing up for Premium Rate Services
­ Installing additional software · malware/spyware
47 Mobile App Moolah: Profit taking with Mobile Malware

Android/HippoSMS
· What it does
­ Malicious code inserted into legitimate app
· Profit?
­ Signs up for Premium Rate Services ­ Deletes messages from signed up services
· No way to know you're subscribed
48 Mobile App Moolah: Profit taking with Mobile Malware

Examples of for-profit malware
J2ME Symbian Android
Other
49 Mobile App Moolah: Profit taking with Mobile Malware

Soundcomber
· What it does
­ Set of PoC Android apps · Soundcomber ­ Records phone calls ­ Identifies relevant portions of IVR ­ Processes audio for credit card numbers
· Deliverer ­ Receives extracted information from Soundcomber ­ Transmits credit card number to attacker

50 Mobile App Moolah: Profit taking with Mobile Malware

Schlegel, R, Zhang, K, Zhou, X, Intwala, M, Kapadia, A, & Wang, X. (Producer). (2011). Soundcomber demo. [Web]. Retrieved from http://youtu.be/Z8ASb-tQVpU

Soundcomber
· Profit?
­ Eavesdrops on voice calls · Intercept credit card/account numbers

­ Collects DTMF(touch tones) · Intercept credit card/account numbers

51 Mobile App Moolah: Profit taking with Mobile Malware

Schlegel, R, Zhang, K, Zhou, X, Intwala, M, Kapadia, A, & Wang, X. (Producer). (2011). Soundcomber demo. [Web]. Retrieved from http://youtu.be/Z8ASb-tQVpU

References
52 Mobile App Moolah: Profit taking with Mobile Malware

References
· J2ME/RedBrowser.A ­ http://vil.nai.com/vil/content/v_138726.htm
· J2ME/Wesber.A ­ http://vil.nai.com/vil/content/v_140595.htm
· J2ME/SMSFree.A ­ http://vil.nai.com/vil/content/v_145420.htm
· J2ME/Vkonpass.A ­ http://vil.nai.com/vil/content/v_268520.htm
· SymbOS/Kiazha.A ­ http://vil.nai.com/vil/content/v_144207.htm
· Android/Geinimi.A ­ http://vil.nai.com/vil/content/v_342726.htm
· Android/Jmsonez.A ­ http://vil.nai.com/vil/content/v_501748.htm
· Android/Tcent.A ­ http://vil.nai.com/vil/content/v_501599.htm
· Android/Crusewin.A ­ http://vil.nai.com/vil/content/v_501639.htm
53 Mobile App Moolah: Profit taking with Mobile Malware

References
· Android/DroidKungFu.A ­ http://www.mcafee.com/threat-intelligence/malware/default.aspx?id=522281
· Android/PJApp.A ­ http://www.mcafee.com/threat-intelligence/malware/default.aspx?id=526804
· Android/Toplank.A ­ http://www.mcafee.com/threat-intelligence/malware/default.aspx?id=535360
· Android/BaseBridge.A ­ http://www.mcafee.com/threat-intelligence/malware/default.aspx?id=535367
· Android/J.SMSHider.A ­ http://www.mcafee.com/threat-intelligence/malware/default.aspx?id=527859
· Android/GoldDream.A ­ http://www.mcafee.com/threat-intelligence/malware/default.aspx?id=539671
· Android/HippoSMS.A ­ http://www.mcafee.com/threat-intelligence/malware/default.aspx?id=544065
54 Mobile App Moolah: Profit taking with Mobile Malware

References
· Roman Schlegel, Kehuan Zhang, Xiaoyong Zhou, Mehool Intwala, Apu Kapadia, and XiaoFeng Wang, "Soundcomber: A Stealthy and Context-Aware Sound Trojan for Smartphones," In Proceedings of the 18th Annual Network & Distributed System Security Symposium (NDSS '11). Retrieved from http://www.cs.indiana.edu/~kapadia/papers/soundcomber-ndss11.pdf
· Roman Schlegel, Kehuan Zhang, Xiaoyong Zhou, Mehool Intwala, Apu Kapadia, and XiaoFeng Wan. (Producer). (2011). Soundcomber demo. [Web]. Retrieved from http://youtu.be/Z8ASb-tQVpU
55 Mobile App Moolah: Profit taking with Mobile Malware

Acknowledgments
56 Mobile App Moolah: Profit taking with Mobile Malware

Acknowledgements
· Fyodor Bom of 0 Security Team · Billy Lee & Tom(  ) of Antiy Labs · Roman Schlegel, Kehuan Zhang, Xiaoyong Zhou, Mehool Intwala, Apu
Kapadia, and XiaoFeng Wang · Dr. Xuxian Jiang and his research team at North Carolina State University for
their initial discovery of samples of the following malware: Android/DroidKungFu, Android/Toplank.A, Android/GoldDream.A, and Android/HippoSMS.A.
57 Mobile App Moolah: Profit taking with Mobile Malware

