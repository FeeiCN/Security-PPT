SESSION ID: MBS-T09
Mobile Vulnerabilities From Data Breach to Complete Shutdown

Adi Sharabani
CEO and Co-Founder Skycure @adisharabani

Yair Amit
CTO and Co-Founder Skycure @YairAmit

#RSAC

#RSAC
Mobile Security Landscape

#RSAC
Lost Stolen
Compromised

#RSAC
Malicious WiFi 3G/4G/LTE
Captive Portals

#RSAC
Known Malware
App Anomalies Repackaged Apps

#RSAC
Device Applications
Networks

#RSAC
Previous Disclosures by Skycure
 iOS Malicious Profiles  Invisible Malicious Profiles  WiFiGate  HTTP Request Hijacking  LinkedInOut

#RSAC
This Year's Focus

#RSAC
Vulnerabilities

#RSAC
SSL Stack
 Previous examples
 goto fail;  Heartbleed  SSL decryption issues

#RSAC
Example 1: GoToFail

static OSStatus

Gotofail ­ The Code SSLVerifySignedServerKeyExchange(SSLContext *ctx, bool isRsa, SSLBuffer signedParams, uint8_t *signature, UInt16 signatureLen) {

...

if ((err = SSLHashSHA1.update(&hashCtx, &clientRandom)) != 0)

goto fail; if ((err = SSLHashSHA1.update(&hashCtx, &serverRandom)) != 0)
goto fail;

Always goto "fail", even if

if ((err = SSLHashSHA1.update(&hashCtx, &signedParams)) != 0) goto fail;

err==0

goto fail;

if ((err = SSLHashSHA1.final(&hashCtx, &hashOut)) != 0)

goto fail; err = sslRawVerify(ctx,
ctx->peerPubKey,

Code is skipped (even though err == 0)

dataToSign,

/* plaintext */

dataToSignLen,

/* plaintext length */

signature,

signatureLen);

... fail:

Function returns 0 (i.e. verified),

SSLFreeBuffer(&signedHashes); SSLFreeBuffer(&hashCtx); return err;

even though sslRawVerify was not called

}

Source: Apple's published source code

#RSAC
Example 2: SSL Decryption
Cancel 8%
Continue 92%
92% of users click on "Continue" compromising their Exchange identity (username and password)

#RSAC
CVEs - The Numbers
iOS CVE Stats
Source: cvedetails.com

#RSAC
How to Identify These Bugs
Demo

#RSAC
Actual Vulnerability Numbers are Higher
 Awareness
 What seems to be about quality might be about security
 Motivation
 Black market
 Finding a bug in a haystack
 2014 reminded us that bugs can lie undetected for A LOT of years

#RSAC
SSL Bugs

#RSAC
Implications
 Data decryption  Data leakage  Remote control  Denial of service
What if the core functions were susceptible to such vulnerabilities?

#RSAC
SSL Certificate Parsing Bug
 Remote application crash (Movie)  Technical Details

#RSAC
What If You Never Connect to a WiFi?
 Are you safe?
 NO
 The bug can be combined with WiFiGate
 3G/LTE attacks can also be used

#RSAC
The iOS-Shield
 A nearby attacker (or dedicated hardware) can force the bug via a network interface.

Attacker's Wifigate device

MiTM

Victim's

Crash

device

rendere

d

useless

#RSAC
What's The Fix?

#RSAC
So Far...
 We have covered
 Inception  Detection  Research  Vendor patch
Does the vulnerability story end here?

#RSAC
What About?

#RSAC
Vulnerability Lifecycle

#RSAC
Vulnerability Lifecycle

Follow-up fixes

Bug

Exposure

Vulnerability

Fix

Exploit

#RSAC
Vulnerability Lifecycle ­ Mobile

Follow-up fixes

Bug
Many more users

Exposure Increases multi-fold

Vulnerability
2 major platforms

Fix
Decreased time

Exploit Better ROHI

#RSAC
You can rest now ... After 18 months of exposure

#RSAC
Summary
 Mobile security is here to stay
 Physical  Network  Malware  Vulnerabilities
 System and app level vulnerabilities are on the rise  OS vendors should employ a multi-platforms oriented vulnerability
patching process  The importance of enterprise mobile defense increases

#RSAC
Apply What You Have Learned
Researchers Perspective
 Any bug has the potential to transform into a security issue
 Be persistent!
 Utilize the public tools offered by the industry to boost your efforts
 Don't reinvent the wheel
 Follow responsible disclosure guidelines
 It is the key for a better functioning world

#RSAC
Apply What You Have Learned
Security/Remediation Perspective
 Personal level
 Maintain an up to date operating-system  Update the apps that you are using  Be alerted and aware of evolving threats
 Network layer  Third-party app stores  OS misconfigurations and vulnerabilities
 Organizational level
 (Same as above) ^ 2  Deploy a mobile threat defense solution for visibility and protection

#RSAC
Next Steps
contact@skycure.com https://www.skycure.com https://blog.skycure.com @YairAmit, @AdiSharabani, @SkycureSecurity /Skycure

