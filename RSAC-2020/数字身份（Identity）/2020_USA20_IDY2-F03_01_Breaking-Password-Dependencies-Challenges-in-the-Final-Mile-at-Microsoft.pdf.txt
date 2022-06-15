SESSION ID: IDY2-F03
Breaking Password Dependencies: Challenges in the Final Mile at Microsoft
Alex Weinert (@alex_t_weinert), Director of Identity Security, Microsoft Lee Walker, Principal Program Manager, Microsoft IT Identity and Access
#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC
>1.2M
compromised accounts in January 2020

#RSAC
>99.9%
compromised accounts did not have MFA

~40% (480k accounts in January) compromised by Password Spray*
*Cloud detected only

#RSAC

Josi@contoso.com

Spring2020!

Chance@wingtiptoys.com

Spring2020!

Rami@fabrikam.com

Spring2020!

TomH@cohowinery.com

Spring2020!

AnitaM@cohovineyard.com

Spring2020!

EitokuK@cpandl.com

Spring2020!

Ramanujan@Adatum.com

Spring2020!

Maria@Treyresearch.net

Spring2020!

LC@adverture-works.com

Spring2020!

EW@alpineskihouse.com

Spring2020!

info@blueyonderairlines.com Spring2020!

AiliS@fourthcoffee.com

Spring2020!

MM39@litwareinc.com

Spring2020!

Margie@margiestravel.com Spring2020!

Ling-Pi997@proseware.com Spring2020!

PabloP@fineartschool.net Spring2020!

GiseleD@tailspintoys.com Spring2020!

Luly@worldwideimporters.com Spring2020!

#RSAC
>99%
of Password Spray attacks use legacy auth

#RSAC
~40% (480k accounts in January) compromised by replay

#RSAC
>97%
of Replay attacks use legacy auth

#RSAC
Account Compromise Rate by Protocol Usage

#RSAC
Why hackers swipe right on Legacy Auth
14

#RSAC

#RSAC

#RSAC
67%
Reduction in compromises in tenants who disable legacy auth

#RSAC
Blocking legacy authentication
Inside Microsoft IT

#RSAC
MFA @ Microsoft · A brief history

MFA Credentials
2000 ­ Smartcard for everyone
2014 ­ Phone Auth available 2015 ­ Hello for Business on Win10

MFA Enforcement
2001 ­ Smartcard required for VPN 2015 ­ MFA required Office 365

2020 ­ FIDO2 on Win10 available

2019 ­ MFA required everywhere

19

#RSAC
Let's just turn it off!
20

#RSAC
Executing the plan · Move fast and be brave
Rollout by division Users on old apps need to upgrade

#RSAC
It Will Be Easy! · September 2018

"In theory there is no difference between theory and practice. In practice there is."
-- Yogi Berra

#RSAC
Blocking legacy authentication: In Practice
The inside story of Microsoft IT's actual experience

#RSAC
TeleSales Meltdown · October 2018
TeleSales

The Business Always Wins...

Security

Business

This Photo by Unknown Author is licensed under CC BY-NC

#RSAC

#RSAC
TeleSales Meltdown · Severity 1
"We need to rollback the policy till we figure out next steps!"
-- Impacted sales user

#RSAC
Not so easy · What else broke?
Bulk email (SMTP) Old admin tools Tools used to make Windows and Office! CRM ­ TeleSales direct impact to revenue!

#RSAC
Pro Tips: What we've learned inside Microsoft IT
You're welcome!

#RSAC
Back to the drawing board · Use Data To Plan
Keep 90 days of sign-in history
Identify apps using legacy auth ­ talk to the owners
Simulate policies to predict breaking scenarios

#RSAC
Turn on the lights · 90 days of sign-in history

#RSAC
Simulate Policy · Predict Breaks Before Blocking

#RSAC
Identify Legacy Auth Usage · Fix the apps!

#RSAC
What do you do with Logs? · Data Spelunking
Foreach ($LegacyAuthAuditLog in $Logs) {
# Find the app $App = Find-AppUsingLegacyAuth -Log $LegacyAuthAuditLog
# Find the app owner $AppOwner = Find-AppOwner -Application $App
# Watch them use their app ­ where does it prompt for username/password? $result = Reproduce-LegacyAuthUsageInApp ­Application $App
# Spelunk the audit logs ­ confirm legacy auth was used $result = Confirm-LegacyAuthInAuditLogs ­Application $App
# Dig into their app ­ change the code $result = Update-AppToModernAuth ­Application $App }

#RSAC
Blocking legacy auth · Evolution of the timeline
Up to 20 exception requests per week

Exception requests · Be Prepared!

Use user agent string to help identify client apps

#RSAC
Did it work? Yes!
37

#RSAC
1.5M
blocked legacy auth attempts per day

#RSAC
Call to Action · Apply what you've learned
Next Monday:
­ Review your logs to find legacy traffic ­ Start collecting sign-in log history
Next Month:
­ Have a plan (it will evolve) ­ Define an exception process before implementation ­ Test with a small pilot
Moving Forward:
­ Start a slow rollout to low impact accounts ­ Continue rollout in gradually increasing waves ­ Conclude implementation by working through more difficult cases
39

#RSAC
Deciding not if, but when, to start
· Err on the side of execution
· Get executive sponsorship · Have a well-defined exception process
· Threat level is rising
· Password-only auth is going away
· Clock is ticking · Exchange is removing support for Basic auth (Oct 2020) · Organizations are moving to password-less

You don't have to run faster than the bear. Just use MFA!
https://aka.ms/securitysteps

#RSAC
Questions?
Alex Weinert (@alex_t_weinert), Director of Identity Security, Microsoft Lee Walker, Principal Program Manager, Microsoft IT Identity and Access

