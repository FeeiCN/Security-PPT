SESSION ID: MBS-T09
Mobile Vulnerabilities From Data Breach to Complete Shutdown

Adi Sharabani
CEO and Co-founder Skycure @adisharabani

Yair Amit
CTO and Co-founder Skycure @YairAmit

#RSAC

Agenda

 The Mobile Security Landscape  SSL Stack Vulnerabilities

Sibling Threats

 No-iOS-Zone Vulnerability

 The Vulnerability Lifecycle

 Summary & Apply

Exposure

#RSAC
Bug Vulnerability

Fix

Exploit

#RSAC
Mobile Security Landscape

#RSAC
Lost Stolen
Compromised

#RSAC
WiFi &
cellular
24/7 exposure
Off-the-shelf hacking tools

#RSAC
External Android stores
Repackaged Apps
iOS impact

#RSAC
OS & app-level
Patching challenges
Never-ending story

#RSAC
This Presentation's Focus

#RSAC
Network Incident Statistics

Affected Devices Over Time
50%

40%

38% 35%

30% 30% 30%
25% 23%

20%

% affected devices

10%

0% 0% 0%
0

1 Month

2 Months 2015 2014

Based on Skycure Threat Intelligence

3 Months

43% 41% 4 Months

#RSAC
Known iOS Vulnerabilities (by Year)
180 160 140 120 100
80 60 40 20
0 2007 2008 2009 2010 2011 2012 2013 2014 2015 Number of CVEs Trajectory
Source: Skycure analysis based of CVEdetails.com

#RSAC
Actual Numbers are Higher
 Awareness
 What seems to be about quality might be about security
 Motivation
 Black market
 Finding a bug in a haystack
 2014 reminded us that bugs can lie undetected for A LOT of years

#RSAC
Safari Crash
So... What did we do next?
Click to see demo

#RSAC
Nothing.

#RSAC
But We Did Research Another Bug...

 Quick findings:
 iOS devices  A specific network  Almost any app crashes

 Further analysis:
 SSL certificate parser bug

Click to see demo

#RSAC
SSL Stack Issues
goto fail; Heartbleed SSL decryption ...

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
SSLFreeBuffer(&signedHashes); SSLFreeBuffer(&hashCtx); return err;

Function returns 0 (i.e. verified), even though sslRawVerify was
not called

}

Source: Apple's published source code

#RSAC
Example 2: SSL Decryption
Cancel 8%
Continue 92%
92% of users click on "Continue" compromising their Exchange identity (username and password)
Source: Skycure Threat Intelligence

#RSAC
SSL Bugs - Implications
 Data decryption  Data leakage  Remote control
In our case, none of the above was feasible

#RSAC
Going back to our crash...

#RSAC
Is This Really Interesting?
 Current attack flow:
 Attacker creates a malicious "Free Public Wifi" network  Victim connects to the network  All apps constantly crash
 Problems with the attack:
 Victim needs to connect to the malicious network  Victim likely to understand the issue relates to the network  Victim can simple switch to another network to resolve the impact

Is Manual Connection Required?
 WiFi auto connect:
 Karma attacks  WiFiGate
 Cellular attacks:
 Fake towers

Bug

#RSAC

Vulnerability

Exploit

#RSAC
So, Is This Interesting Now?
 Current attack flow:
 Attacker forces nearby victims to connect to the malicious network  No victims' action required
 Users cannot use any SSL-enabled iOS apps
 Problems with the attack:
 Victims can still determine the attack is associated with the network  Victims can move to "airplane mode" or switch to another network

#RSAC
But What About the OS?
 Unsurprisingly, iOS system processes also use SSL   Impact: iOS crash

#RSAC

Click to see demo

iOS crashes Device restarts iOS Bug exploited again iPhone crashes again
and again and again and again

#RSAC
So, Now it is Interesting...

 Current attack flow:
 Attacker forces nearby victims to connect to the malicious network  No victims' action required
 iOS devices in range could get into a DoS restart loop

 Result:
 No-iOS Zone

No-iOS Zone Vulnerability

#RSAC
"No-iOS Zone" Attack
 iOS users in range are unable to use their mobile devices
 No WiFi, no offline work, no phone calls, no airplane mode...
 Potential areas that may be attractive for attackers:
 Political events  Economical & business events  Wall Street  Governmental and military facilities

Disclosure & Fix Process

Bug

#RSAC

 Issue reported to Apple on Oct. 2nd, 2014
Fix
 We have been working with Apple to fix the issue
 8.3 release seem to resolve some of the issues
 The threat has not yet been confirmed as resolved
 We will update more on our blog:
 https://blog.skycure.com

Vulnerability Exploit

HTTP Request Hijacking
- (void)fetchArticles {
NSURL *serverUrl = [NSURL URLWithString:@"http://jour@na"lh.sttkpy:c//ujoruer.cnoaml.s"k];ycure.com"

#RSAC
Disclosed by Skycure at RSA Europe 2013

NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:serverUrl];
HTTP Request [request setValue:@"application/json" Hijacking
forHTTPHeaderField:@"Content-Type"];

self.connection =
[[NSURLConnection alloc] initWithRequest:request delegate:self]; } NSURL *serverUrl =
[NSURL URLWithString:@"http://attacke@r."shittetp/s:/k/aycttuarcekJeoru.srintea/ls"]k;ycureJournal"

NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:serverUrl];

#RSAC

#Skycure

#RSAC
Further Research

No-iOS Zone

+

HRH

= No-iOS

#RSAC
Vulnerability Lifecycle

#RSAC
Vulnerability Lifecycle

Sibling Threats

Bug

Exposure

Vulnerability

Fix

Exploit

#RSAC
Summary

Sibling Threats

Bug

Exposure

Vulnerability

Fix

Exploit

Mobile Security Landscape

The Vulnerability
Lifecycle

No-iOS Zone Vulnerability

Apply What You Have Learned
Researchers' Perspective

Look around you

Sibling Threats

Bug

#RSAC
Be mindful

Exposure

Vulnerability

Responsible disclosure

Fix

Exploit

Be persistent

#RSAC
Apply What You Have Learned
Security/Remediation Perspective
 Personal level
 Updates (both OS & apps)  Awareness (mobile threats are constantly evolving)
 Organizational level
 (Same as above)2  Deploy a mobile threat defense solution for visibility and protection
 Vendors
 OS vendors should employ a multi-platforms oriented vulnerability patching process

#RSAC
Next Steps
contact@skycure.com https://www.skycure.com https://blog.skycure.com @YairAmit, @AdiSharabani, @SkycureSecurity /Skycure

