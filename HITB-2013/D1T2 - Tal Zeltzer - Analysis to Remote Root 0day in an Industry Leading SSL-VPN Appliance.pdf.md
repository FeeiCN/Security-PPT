Virtually Secure
a journey from analysis to remote root 0day on an industry leading SSL-VPN appliance

Who am I ?
Tal Zeltzer Independent security researcher from Israel
· Reverse engineering (mostly embedded systems) · C/C++ And Python development · Zerodays (Adobe Flash, PcAnywhere, EMC Networker,
Windows Briefcase,...) · No formal education

The research
· We were interested in exploiting an old vulnerability on an F5 product called FirePass.
· Overview (Taken from F5.com):
 The FirePass® SSL VPN appliance and Virtual Edition (VE) provide secure remote access to enterprise applications and data for users over any device or network. FirePass ensures easy access to applications by delivering outstanding performance, scalability, availability, policy management, and endpoint security. The result is unified security enforcement and access control that increases the agility and productivity of your workforce.

Virtual "Private" Networks

ISP

WEB  SERVERS  FARM

FIREWALL

FIREPASS  SSL  VPN

DATABASES

IPS LAN  SERVERS

Note
F5 stated that a new SSL-VPN appliance is available and the FirePass SSL-VPN appliance is supported for legacy purposes.

Note
Combined net worth of 3 companies running this
product is 177 billion dollars

Advantages of using a virtual appliance vs a normal appliance
· Runs on x86/x64. · Kernel debugging. · Software encryption.

Disadvantages of using a virtual appliance vs a normal appliance
· Incorrect analysis. · Different internal implementation. · Maintenance issues. · Can't develop memory corruption exploits.

Downloading the vulnerable version
· Download · Boot · Activate

0day research
· We can't work with the vulnerable version. · We can only try and find 0days now...

Attack surface (Black box)
· Open ports: http, https, ssh. · Mostly HTTP based. · This will be our main attack vector for now.

Getting a debug-shell
· Extract PHP files. · Examine configuration. · Other attack vectors?

The "debugStub" feature
· Remote kernel debugging. · Use GDB to kernel debug. · Unknown kernel version.

Mounting the drive in a different OS
· Boot partition. · Hard drive encryption. · Losetup, GPG, rootkey.gpg. · Unable to mount the encrypted drives.

The boot partition

Interacting with the boot process
· Replaced losetup with a busybox shell. · Booted and got a shell! · Broke the decryption process.

The limited shell

Decrypting the file-system
· During the normal boot process we noticed a command "/lib/losetup ­e ..."
· Decrypted the file-system.

Getting a debug shell
· Compiled a backdoor. · Added it to "init.rd". · Rebooted and got a debug shell on our local
appliance.

Attack Surface (White box)

· Distribution: · OpenSSL: · Apache: · ...

Slackware 7.1 (June 22, 2000) 0.9.7d (March 17, 2004) 1.3.33 (October 29, 2004)

Attack Surface (White box)
· Vulnerable applications. · Known vulnerabilities. · Unknown architecture. · Hard to write a reliable memory corruption
exploit without a test box.

Attack Surface (White box)
· Unknown apache modules. · SSH is modified. · Downloaded the PHP scripts.

PHP Scripts

Character distribution

PHP Scripts
· Character distribution is flat. · No compression headers. · Probably encrypted.

PHP Scripts
· Found several PHP code obfuscation and encryption solutions.
· Found one of them on the appliance ("IonCube").
· Found a talk by Stefan Esser that explained the situation.

Closed source PHP scripts
· This solution pre-compiles and encrypts the PHP code.
· A solution exist (Xdebug / VLD) · Since this is an old version of "IonCube" it
should work.

Xdebug / VLD
· Hard to compile. · Dropped this angle for now; If everything fails
we'll go back and try it.

MySQL Log

Setting up the environment
· Trying to install tools. · Installed GCC, SSH, and others. · Decided to have another look at the unknown
apache modules

Custom apache modules
· Found a custom apache module that maps to a virtual directory

Analyzing the virtual directory
· Immediately launched a browser and tried to access the directory.
· Got a "Invalid parameters" error. · Found the tunnel-handler. · Launched a disassembler

The error string

Playing with the parameters
· We already have mysql log enabled. · While playing with the parameters we found
an SQL injection vulnerability.

SQL Log
When we provide hello' as the `sess' parameter we get:

Writing into outfile
· When writing into outfile a common query looks like this:
Select logon, usergroup from tblLogSessions where lower(sid) = lower(`hello') union select `data', `x' into outfile `/tmp/test'-- `)
hello' union select `data', `x' into outfile `/tmp/test'--

Trying to SQL inject
· When sending the query string "aaa%20" We get "aaa%20" at the actual query
· Turns out that url-encoded strings are not decoded :/

Trying to SQL inject
· When sending the query string "aaa%20aaa" We get "aaa 0x1.d42..." at the actual query.
· We got a format string vulnerability at the same argument! (Disassembly confirmed)

The format string
· Just to be sure, let's send the query string "%08x--%08x--%08x..."
· That's nice but we already have a logical vulnerability; I want a universal exploit!

Trying to SQL inject
· Turns out that the apache module doesn't escape the url-encoded query string.
· Can't write characters such as space · How can we write a valid query?

Trying to SQL inject
· Block comments? · A query like "Or/**/1=1/**/)" worked! · What about the rest of the query? · -- doesn't seem to work without a trailing
space
hello'/**/union/**/select/**/`data',/**/`x'/**/into/**/outfile/ **/`/tmp/test'--

Trying to SQL inject
· Documentation confirmed "--" has to have a trailing space
· Format string you say? Spaces you say? What about %20d ?
· Got our valid terminator!
hello'/**/union/**/select/**/`data',/**/`x'/**/into/**/outfile/ **/`/tmp/test'--%20d

Writing into outfile
· Composed our union select into outfile; Failed. · But everything looks fine.

Wtf?
· Tried running the query myself; Failed. · Tried a trivial union select; Failed.

Mysql 3.23
· No union selects. · No nested queries. · Can't do a join because we're at the while
condition. · Can write into outfile, but since there's no union we
do not control the data that gets written.
hello`/**/or/**/(`1'=`1')/**/into/**/outfile/**/'/tmp/test'/ **/--%20d

The table we write into outfile
· tblLogSessions; Contains session info. · Updated when we login successfully. · Can't poison it because we can't login.

Really getting mad
· Read documentation. · Read some source code. · Asked anyone I know. · And then!

Got it

Writing into outfile!
· Can write arbitrary data into the file. · What about `<?php $mycode ?>'.
hello`/**/or/**/(`1'=`1')/**/into/**/outfile/**/'/tmp/test'/**/ fields/**/seperated/**/by/**/0x603c3f706870...3f3e /**/--%20d

Pwned!

Minor down-side
· This attack will only work if a user or an administrator has ever logged in to the server
· I'm guessing it's not much to ask in a production environment (Initial server configuration applies as a login)

Got root ?
· Rootkit the appliance. · Sniff traffic. (tcpdump is available) · Man-in-the-middle VPN clients · Extract certificates · Create our own user and join the network

Attacking VPN Clients
· Replace existing PHP scripts (can't edit them..) · If ActiveX installation fails we get a "please
download and install this client" message. · New client anyone?

F5 ­ Vulnerability response win
· From all my vulnerability disclosures F5 impressed me the most.
· Their response was quick and professional. · The patch came soon after. · F5 wants to work with all researchers.
Contact them at security-reporting@F5.com.

Summery
· We wanted to own the appliance. · Got no useful results from blackbox. · Decrypted the file-system and installed a
backdoor to turn the assessment into whitebox. · Found out the environment is *old*
· Found out the PHP scripts are encrypted but can be decrypted.
· Found the right combination of vulnerabilities and owned the appliance

Live Demo

Thanks to the EFF
· Many many thanks to the EFF and marcia hofmann for their legal consulting and help.

Greets and Thanks
· Mati aharoni (Aka muts) ­ Configuring linux
and highlighting some critical points
· Oran avraham ­ Ninja, helping me out with
linux stuff and solving huge problems in seconds · Igor Rayak, Shai Priel, UY, Yuval Ofir, m0she, Gil Dabah, Assaf Nativ

Questions?

