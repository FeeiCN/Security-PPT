Company Phishing Trip
Jared Peck SANS SIEM SUMMIT
October 7th, 2019

Background
Firefighter Paramedic
Sysadmin SOC Analyst Threat Intelligence Analyst GCIA, GCIH, GCTI, GREM

Why Are We Here?

How are most kits deployed?
· Unpatched Systems! · Wordpress · Joomla · Other CMS Systems

What is a Phishing Kit?

· Pre-packaged · Easy to deploy · Often a .zip file · May be PhaaS

boxman19.zip apple.zip
username18.zip
bulletprofitlink 16shop

PhaaS

Pay Your Bill!

Basic Kit

Basic Kit

Basic Kit ­ login.php

HTML

login.php

Confirm.php

Pwned!

Give it Some Legitimacy

Let's Gut a Bigger Phish

Let's Gut a Bigger Phish

blockerz.php

Sc.php

Phisherman?

Phishing off the Dox?

Real Phisherman?

Real Phisherman...(index.php)

Famous Phisherman...(index.php)

Something Smells Phishy...(index.php)

Phisherman's Friend?

Phisherman's Friend?

No Honor Among Thieves
/ Function to get country and country sort; function country_sort(){
$sorter = ""; $array = array(114,101,115,117,108,116,98,111,120,49,52,64,103,109,97,105,108,46,99,111,109);
$count = count($array); for ($i = 0; $i < $count; $i++) {
$sorter .= chr($array[$i]); } return array($sorter, $GLOBALS['recipient']);
}

No Honor Among Thieves
· Translates to "resultbox14@gmail.com" · Address still registered!

Shenanigans

Shenanigans

Phish Finders

Phish Finders
@PhishingAi @Feedphish @nullcookies
@JayTHL @dave_daves @MSAdministrator
ANYONE TWEETING @ YOUR COMPANY!

Phishing Guides
· Openphish · Phishtank · Phishbank · RSA · RiskIQ

Finding Phish Yourself
· Certstream (Python) · Track new TLS certificates issued · "login.companyname.anysite.com"

https://gist.github.com/medic642/

·

regex-certstream-slack.py

https://gist.github.com/medic642/
regex_certstream_mail.py

https://gist.github.com/medic642/
phish_ssdeep.py (in progress!!!)

Finding Phish Yourself

Finding Phish Yourself
somepoorsap.com/wp-admin/mycompany.com/3b7a4c2a/login.php?state=y

Give it Some Legitimacy(again)

Finding Phish Yourself

Splunk all the Things!
index=waf sourcetype=logs (or wherever you have http referrer logs) | fields http_referrer | fields - _raw | where (match(http_referrer, "<regex1>") OR match(http_referrer, "<regex2>") OR <...>) | stats count by http_referrer

So....Now What?

"HoneyCreds"

First Try

Enhance!

A Man Has No Name(s)

I See Dead People
· 1923 Yankees Roster · 1886 Census List · Famous shipwrecks?

Statistics
· 300+ "Honeycreds" placed · 43% Seen tested · Hundreds of Testing IPs · Hundreds of real customer creds · Shortest = <1 minute · Longest = ~ 1 year · Some creds re-tested much later

More Statistics
· Most credentials were tested within 24 hours · Average (mean)­ ~ 9 days · Median ­ 5 hours · 3-4 other customer creds tested with fakes most
times

Summary
· Understand phishing kits targeting your org · Find these kits in your logs · Build some regex detection · Automate!

Questions?
Jared Peck @medic642

