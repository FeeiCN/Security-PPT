Breaking Out HSTS (and HPKP) on Firefox, IE/Edge and (Possibly) Chrome.
@unapibageek - @ssantosv

Sheila Ayelen Berta
Security Researcher ElevenPaths
(Telefonica Digital cyber security unit)
22 years old -

Sergio De Los Santos
Head of Innovation and Lab ElevenPaths
(Telefonica Digital cyber security unit) N/A :p -
@unapibageek - @ssantosv

C

HTTP://www.example.com/login Username: John / Password: 1234
@unapibageek - @ssantosv

C

HTTPS://www.example.com/login Username: John / Password: 1234
@unapibageek - @ssantosv

(

@unapibageek - @ssantosv

SSLSTRIP

COMMON ATTACKS

ROGUE CERTIFICATES

HSTS

SOLUTIONS?

HTTP Strict Transport Security

HPKP
HTTP Public Key Pinning

@unapibageek - @ssantosv

HSTS ­ First time requests
@unapibageek - @ssantosv

HSTS ­ HTTP requests after HSTS header is setted
THERE IS NOT A FIRST HTTP (UNSECURE) REQUEST. SSLSTRIP HAS NOTHING TO INTERCEPT, IT WON'T WORK.
@unapibageek - @ssantosv

HPKP ­ Certificate Pinning
pin-sha256="WoiWRyIOVNa9ihaBciRSC7XHjliYS9VwUGOIud4PB18="; pin-sha256="RRM1dGqnDFsCJXBTHky16vi1obOlCgFFn/yOhI/y+ho=";
@unapibageek - @ssantosv

HPKP ­ Certificate Pinning
@unapibageek - @ssantosv

Attacking HSTS (and HPKP) browsers implementation
@unapibageek - @ssantosv

@unapibageek - @ssantosv

The curious thing...

1024 ENTRIES
AS MAXIMUM
@unapibageek - @ssantosv

@unapibageek - @ssantosv

DEMO
@unapibageek - @ssantosv

@unapibageek - @ssantosv

@unapibageek - @ssantosv

Attack improvement... defeating FF's score system

JUNK HSTS ENTRIES INJECTION
DELOREAN +1 DAY

SCORE = 0

JUNK HSTS ENTRIES INJECTION
DELOREAN +1 DAY

SCORE = 1

JUNK HSTS ENTRIES INJECTION
...

SCORE = 2

DEMO

C

@unapibageek - @ssantosv

FF's highlights ­ Cons :
· Attack might be a little complex to achieve: MITM + DELOREAN + HSTS Injection.
· We need time enough inside the target's network.
(It may be some hours).
Internal Pentests, Hotels... are the best scenarios ;)
DEMO
@unapibageek - @ssantosv

HSTS SLOTS

FF's highlights - Pros:
· Attack effectiveness. REAL ENTRY ­ SCORE = 0 JUNK ENTRY ­ SCORE = 2 JUNK ENTRY ­ SCORE = 2 JUNK ENTRY ­ SCORE = 2 DEMO

NEW ENTRY ­ SCORE = 0
@unapibageek - @ssantosv

@unapibageek - @ssantosv

@unapibageek - @ssantosv

@unapibageek - @ssantosv

The curious thing...

NO STORAGE LIMITS
@unapibageek - @ssantosv

@unapibageek - @ssantosv

DEMO

@unapibageek - @ssantosv

Chrome highlights:
· Attack is very easy to achieve and you can try it in different ways.
(WiFi Portal / MITM attack / etc).
· Chrome stops working properly in a few minutes. · User is forced to clear browsing data in Chrome and therefore the TransportSecurity file starts over again = HSTS/HPKP broken ;)
@unapibageek - @ssantosv

@unapibageek - @ssantosv

@unapibageek - @ssantosv

The curious thing...
@unapibageek - @ssantosv

WININET.DLL HttpIsHostHstsEnabled

CheckHsts() CheckHstsInternal()
GetHstsEnabled()

AddHstsEntry() UpdateHstsEntry()

IsHostHstsA()

SetHstsEntry()

GetHstsEntry()

@unapibageek - @ssantosv

Landing issues...

CheckHsts() GetHstsEnabled() CheckHstsInternal() IsHostHstsA()

SetHstsEntry()
?
AddHstsEntry()
? SaveEntryToStore()

IsHostHstsInternal() ConvertURLtoHTTPS()

@unapibageek - @ssantosv

CACHE

I remember if you visited the website over https or http... but not because of HSTS itself...
DEMO
@unapibageek - @ssantosv

IE/Edge highlights:
· Most of the websites will not be remembered as webs protected with HSTS, due to problems in the storage process.
· Browser cache is the one that remembers if you have entered the website over http or https... but not HSTS itself.
· Restarting the browser, the machine or (most effectively) clearing the cache, leaves the user without a real HSTS protection.
@unapibageek - @ssantosv

Conclusions...
We can tell there is not a strong bet yet for improving this implementations in browsers so... No one is safe.... even with HSTS.
@unapibageek - @ssantosv

THANK YOU!

Sheila Ayelen Berta
Security Researcher ­ ElevenPaths (Telefonica Digital cyber security unit)
@UnaPibaGeek sheila.berta@11paths.com

Sergio De Los Santos
Head of Research ­ ElevenPaths (Telefonica Digital cyber security unit)
@ssantosv sergio.delossantos@11paths.com

@unapibageek - @ssantosv

