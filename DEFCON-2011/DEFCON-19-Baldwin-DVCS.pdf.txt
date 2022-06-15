Pillaging DVCS Repos
...for fun and profit
DEFCON 19 // Adam Baldwin

$ whoami
@adam_baldwin Co-Founder of nGenuity
Pentester of webs evilpacket.net
Pillaging DVCS Repos // DEFCON 19 // @adam_baldwin

WTF is DVCS
Pillaging DVCS Repos // DEFCON 19 // @adam_baldwin

Objectives
Identify web accessible repos Pillage as much info as possible ??? Profit
Pillaging DVCS Repos // DEFCON 19 // @adam_baldwin

Alexa top million sites

GIT: 1498 repos HG: 312 repos BZR: 235 repos

GIT HG BZR

Pillaging DVCS Repos // DEFCON 19 // @adam_baldwin

Repo Identification
GIT: .git/HEAD HG: .hg/requires BZR: .bzr/README
http://example.com/.git/HEAD
Pillaging DVCS Repos // DEFCON 19 // @adam_baldwin

W3AF Plugin
Pillaging DVCS Repos // DEFCON 19 // @adam_baldwin

Cloning
0. Check for dir browsing 1. Get predictable files 2. List repo files 3. Download references to files 4. Restore the repo (if possible)
Pillaging DVCS Repos // DEFCON 19 // @adam_baldwin

Pillaging
Platform details (.php, .cgi, etc) Downloadable files (.old, .sql) Source Code Credentials / Certs / API Keys
Pillaging DVCS Repos // DEFCON 19 // @adam_baldwin

Pillaging Ideas

.sql / .sql.bz2 .pem

.sql.gz

.xls / .xlsx

.tar / .tar.gz .doc / .docx

config .ini .sh

.bak .cfg export

htpasswd

private .qbw / .mny backup

id_rsa

.pst / .ost confidential dump / .dmp

id_dsa

settings

.csv

.txt

Thanks to @flirzan & @quitlahok for some of these!

Pillaging DVCS Repos // DEFCON 19 // @adam_baldwin

Montage of fail
Pillaging DVCS Repos // DEFCON 19 // @adam_baldwin

<- Twitter API
<- Facebook API <- MySpace API <- Google API

<- Auth Required? Nope

Database Passwords

<- SSH Keys htpasswd ->

Customer Invoices

Demo
Pillaging DVCS Repos // DEFCON 19 // @adam_baldwin

The Tool
https://github.com/ngenuity/DVCS-Pillage
Pillaging DVCS Repos // DEFCON 19 // @adam_baldwin

Questions?
adam@ngenuity-is.com // @adam_baldwin

References
nGenuity: http://ngenuity-is.com http://ngenuity-is.com/blog/2011/mar/22/gotta-git-up-to-get-down/ http://ngenuity-is.com/blog/2011/apr/30/git-pillaging-revisited/
Evilpacket: http://evilpacket.net
W3AF: http://w3af.sourceforge.net/
DVCS Pillage Toolkit: http://github.com/ngenuity/dvcs-pillage
Pillaging DVCS Repos // DEFCON 19 // @adam_baldwin

