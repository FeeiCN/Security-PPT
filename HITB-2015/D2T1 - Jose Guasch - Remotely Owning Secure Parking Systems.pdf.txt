wned
Remotely Owning `Secure' Parking Systems
José A. Guasch

me
José A. Guasch (Madrid - Spain) Tiger Team Technical Coordinator from Grupo SIA Security By Default Editor Rooted CON staff

DISCLAIMER

DISCLAIMER

DISCLAIMER

Advanced technical skills

Basics, patience, go deeper

DISCLAIMER

Advanced technical skills

Basics, patience, go deeper

SCADA, High tech engineering, sensors, PLC, zigbee,...

Web vulnerabilities

DISCLAIMER

Advanced technical skills

Basics, patience, go deeper

SCADA, High tech engineering, sensors, PLC, zigbee,...

Web vulnerabilities

hacking tools

browser + os tools

DISCLAIMER

Advanced technical skills

Basics, patience, go deeper

SCADA, High tech engineering, sensors, PLC, zigbee,...

Web vulnerabilities

hacking tools

browser + os tools

isolated bugs

common vulnerabilities for every product lines of the vendor

"When connecting [XXXXX] server to the Internet, it can be accessed from any computer in the world, with the same interface and functionality."
­ The vendor <3

why parkings?

why parkings?
Complex architecture

why parkings?
Complex architecture Money everywhere

why parkings?
Complex architecture Money everywhere

why parkings?
Complex architecture Money everywhere
Web based

why parkings?
Complex architecture Money everywhere
Web based Connected to the Internet

why parkings?
Complex architecture Money everywhere
Web based Connected to the Internet Remote management allowed, recommended, by default (support)

and.....

and.....

how?

INFORMATION GATHERING

REPORTING

ENUMERATION

EXPLOITATION

ANALYSIS

PMS models evolution

2008

Company 1 has a park solution Model A

Company 1 + Company 2

Model B.1 Model B.2

main arch

ENTRANCE

MANAGEMENT MAINTENANCE
PAYMENT

EXIT

controlling lane
Main functions: ticket dispensing, ticket verifying and card reading It's a Personal Computer! (Pentium) Connected to the network. Intercom: TCP/IP based module with speaker and microphone (Optional) Barrier has modes: Auto, Manual, Test...

pay stations
Main functions: collect da money! Computer: Industrial PC Display: 15" TFT (resolution 1024x768, 400cd/ m²), Integrated Touch Screen Panel Intercom: TCP/IP based module with speaker and microphone (Optional)
Connected to the network Pay with Cards, Coins and Bank notes

cashiers
Main functions: one computer to rule them all Another PC, and also connected to the Internet

main app

Main functions: one webapp to rule them all Operating System: Debian Linux based Web Server : Apache Server Database System: PostgreSQL Virtual PBX : Asterisk Server (for intercom solutions) Network: Standard TCP/IP Ticket history, including license plate (option) details Video surveillance with IP camera's (option). White list solution allowing entrance and exit with registered license plates

TESTING
MODEL A

THIS IS MY LOGIN

THIS IS MY SERVER INFORMATION

THIS IS MY BROWSABLE FOLDERS
main app path
meh...

HERE ARE MY
Predictable folders found on web server, and browsable

HERE ARE MY BACKUPS
Predictable folders found on web server, and browsable
DBYYYY-MM-DD.tgz = PostgreSQL database dump

daily database dump
1. download the DB*.tgz file 2. Searching users and passwords inside the dump...
pg_restore X.tgz | grep -i -A20 "Copy appusers" | awk -F'\t' '{print $1":"$11}'
3. Full list of users and their plaintext passwords

i'm the admin, trust me...

black magic! witchcraft!

i can help you with the surveillance

MODEL A - Summary
info php - environment information directory listing enable at the web server (/backup...) Access to backups information
sensitive info clients tickets and season cards users/pwds no user/password policy (minchars, user=pass,...)

MODEL A - Summary
info php - environment information directory listing enable at the web server (/backup...) Access to backups information
sensitive info clients tickets and season cards users/pwds no user/password policy (minchars, user=pass,...)

TESTING
MODEL B

THIS IS MY LOGIN

backup folder?

backup folder?
oh :(

direct access to backup files?

direct access to backup files?
oh :(

environment information?
yay! always....

and the login?

and the login?
admin:admin ?

and the login?
admin:admin ?

and the login?
admin:admin ? ` or `1'=`1 ?

and the login?
admin:admin ? ` or `1'=`1 ?

and the login?
admin:admin ? ` or `1'=`1 ? test:test ?

and the login?
admin:admin ? ` or `1'=`1 ? test:test ?

we are in! more or less...

we are in! more or less...

we are in! more or less...

let's read...
Manuals for every parking device (cashiers, web application, pay stations...) We get:
Network services used by the parking management system FTP and Samba default u/p for backup

what we have until now?
environment information (phpinfo Information disclosure) users/passwords for Samba and FTP (default, but accounts not always exist) extra services available by the product (not always exposed to internet) access with `test' account (VERY restricted)

what we have until now?
environment information (phpinfo Information disclosure) users/passwords for Samba and FTP (default, but accounts not always exist) extra services available by the product (not always exposed to internet) access with `test' account (VERY restricted)
going back to the restricted access with test account...

wait...how the webapp manage downloads?

wait...how the webapp manage downloads?
https://<host>/<main path>/<main file>.php? mod=base&page=download&dir=manuals&file=<filename.pdf>

wait...how the webapp manage downloads?
https://<host>/<main path>/<main file>.php? mod=base&page=download&dir=manuals&file=<filename.pdf>
../../../../../../etc/passwd

wait...how the webapp manage downloads?
https://<host>/<main path>/<main file>.php? mod=base&page=download&dir=manuals&file=<filename.pdf>
../../../../../../etc/passwd

path traversal in `download' module
· System files · /etc/passwd - users and their shell · /etc/hostname - hostname · /etc/hosts - systems on the network · /var/log/syslog - important paths and users
· Services files · /etc/sshd.conf - SSH server configuration · xferlog (proftpd) - important paths and files · asterisk.conf - Intercom configuration · ...
· application files and scripts · <webapp>.php - some paths and vulnerabilities · rpc.php - bypassing web-gui · modules - some paths and vulnerabilities · ...
· application specific log files · <webapp>.log - important paths and files · ...

path traversal in `download' module
· System files · /etc/passwd - users and their shell · /etc/hostname - hostname · /etc/hosts - systems on the network · /var/log/syslog - important paths and users
· Services files · /etc/sshd.conf - SSH server configuration · xferlog (proftpd) - important paths and files · asterisk.conf - Intercom configuration · ...
· application files and scripts · <webapp>.php - some paths and vulnerabilities · rpc.php - bypassing web-gui · modules - some paths and vulnerabilities · ...
· application specific log files · <webapp>.log - important paths and files · ...

typical exposed system services (FTP)
asterisk:x:1001:1001:,,,:/home/asterisk:/bin/ftp flashimage:x:1003:1004:,,,:/nonexistent:/bin/ftp pms-acs:x:1002:1002:,,,:/home/pms-acs:/bin/ftp *********:x:1005:1002:,,,:/nonexistent:/bin/ftp

typical exposed system services (FTP)
asterisk:x:1001:1001:,,,:/home/asterisk:/bin/ftp flashimage:x:1003:1004:,,,:/nonexistent:/bin/ftp pms-acs:x:1002:1002:,,,:/home/pms-acs:/bin/ftp *********:x:1005:1002:,,,:/nonexistent:/bin/ftp
Users with user=password (remembering the manual?)

typical exposed system services (FTP)

asterisk:x:1001:1001:,,,:/home/asterisk:/bin/ftp flashimage:x:1003:1004:,,,:/nonexistent:/bin/ftp pms-acs:x:1002:1002:,,,:/home/pms-acs:/bin/ftp *********:x:1005:1002:,,,:/nonexistent:/bin/ftp
Users with user=password (remembering the manual?)

· FTP Login successful with pms-acs account · Two folders at home folder: backup + pms-acs · Inside backup folder: <hostname>.tgz + <hostname>_bin.tgz

owner of files

hostname

inside the .tgz files (I)
Partial path to the database dump (current) stored at the system swe/<name of product>/* swe/<name of product>/database/<hostname>.dump database dump (plain text of PostgreSQL)

inside the .tgz files (II)
swe/<name of product>/* swe/<name of product>/etc/properties-<hostname>.tgz `etc' + `home' + `tftpboot' folders backup

inside the .tgz files (II)
swe/<name of product>/* swe/<name of product>/etc/properties-<hostname>.tgz `etc' + `home' + `tftpboot' folders backup

inside the .tgz files (II)
swe/<name of product>/* swe/<name of product>/etc/properties-<hostname>.tgz `etc' + `home' + `tftpboot' folders backup

/etc/shadow file
root:$1$1OchR2Tm$jfXqB1uZDSXjDCdY2cK9.1:14173:0:99999:7::: ???????:$1$5rwtf/qk$9eVMajU7xyj7PGPHqpPrV/:14173:0:99999:7::: pms-acs:$1$l4z6oJdq$W0bSieClsQjmqXiycdc4C.:14189:0:99999:7::: flashimage:$1$hez46n1/$kWlNG9f4ygvBw8xHbK.0g1:14390:0:99999:7:::
cracking...

/etc/shadow file
root:$1$1OchR2Tm$jfXqB1uZDSXjDCdY2cK9.1:14173:0:99999:7::: ???????:$1$5rwtf/qk$9eVMajU7xyj7PGPHqpPrV/:14173:0:99999:7::: pms-acs:$1$l4z6oJdq$W0bSieClsQjmqXiycdc4C.:14189:0:99999:7::: flashimage:$1$hez46n1/$kWlNG9f4ygvBw8xHbK.0g1:14390:0:99999:7:::
cracking... and after 9 seconds...

/etc/shadow file
root:$1$1OchR2Tm$jfXqB1uZDSXjDCdY2cK9.1:14173:0:99999:7::: ???????:$1$5rwtf/qk$9eVMajU7xyj7PGPHqpPrV/:14173:0:99999:7::: pms-acs:$1$l4z6oJdq$W0bSieClsQjmqXiycdc4C.:14189:0:99999:7::: flashimage:$1$hez46n1/$kWlNG9f4ygvBw8xHbK.0g1:14390:0:99999:7:::
cracking... and after 9 seconds...
root:parking:14173:0:99999:7::: ???????:parking:14173:0:99999:7::: flashimage:flashimage:14390:0:99999:7:::

typical exposed system services (SSH)
· Trying SSH Login with root account · PermitRootLogin No - root account not allowed to connect directly through SSH
· SSH Login with ??????? account · su :) -> root

important full paths of files (backups)
/swe/<name of product>/database/<HOSTNAME>.dump - plain text database dump /swe/public/ftp/backup/<HOSTNAME>.tgz - whole backup of server (no binaries) /swe/public/ftp/backup/<HOSTNAME>_bin.tgz - whole backup of server (with binaries) /swe/<name of product>/etc/properties-<HOSTNAME>.tgz - backup of whole `etc' folder

important full paths of files (backups)
/swe/<name of product>/database/<HOSTNAME>.dump - plain text database dump /swe/public/ftp/backup/<HOSTNAME>.tgz - whole backup of server (no binaries) /swe/public/ftp/backup/<HOSTNAME>_bin.tgz - whole backup of server (with binaries) /swe/<name of product>/etc/properties-<HOSTNAME>.tgz - backup of whole `etc' folder
remember phpinfo? remember the path traversal vulnerability?
now we have the full path of this yummy files!

one more thing...

oh my dump!
tickets

oh my dump!
tickets

oh my dump!
tickets
taking a look to the <hostname>.dump file...

full card

full card

MODEL B - Summary
info.php bad user/password policy in application (minchars, user=pass,...) default/test users like test:test download manuals
user=passwd (backup users) exposed services: ftp, ssh (no PermitRootLogin :/ ) path traversal
internal folders app logic system logs (syslog, ftp, application...) system info (passwd, issue, ftp, hostname, network...) bad user/password policy in system! full access as root in every system sensitive information on database dumps

MODEL B - Summary
info.php bad user/password policy in application (minchars, user=pass,...) default/test users like test:test download manuals
user=passwd (backup users) exposed services: ftp, ssh (no PermitRootLogin :/ ) path traversal
internal folders app logic system logs (syslog, ftp, application...) system info (passwd, issue, ftp, hostname, network...) bad user/password policy in system! full access as root in every system sensitive information on database dumps

What we can do with this?

troll mode

troll mode
open/close barrier gates (Ignore Presence?)

troll mode
open/close barrier gates (Ignore Presence?) close the parking even empty

troll mode
open/close barrier gates (Ignore Presence?) close the parking even empty my license plate -> always allowed

troll mode
open/close barrier gates (Ignore Presence?) close the parking even empty my license plate -> always allowed change voice messages at entrance and exit, as well as the devices string

troll mode
open/close barrier gates (Ignore Presence?) close the parking even empty my license plate -> always allowed change voice messages at entrance and exit, as well as the devices string Print custom tickets, with ascii images like...

troll mode
open/close barrier gates (Ignore Presence?) close the parking even empty my license plate -> always allowed change voice messages at entrance and exit, as well as the devices string Print custom tickets, with ascii images like... Display movies at Pay Stations LCD

crook mode

crook mode
plant malware on cashier and pay stations devices (POS)

crook mode
plant malware on cashier and pay stations devices (POS) steal credit card information from dumps

crook mode
plant malware on cashier and pay stations devices (POS) steal credit card information from dumps fake messages on devices regarding payments

crook mode
plant malware on cashier and pay stations devices (POS) steal credit card information from dumps fake messages on devices regarding payments manually open pay stations and coin boxes

crook mode
plant malware on cashier and pay stations devices (POS) steal credit card information from dumps fake messages on devices regarding payments manually open pay stations and coin boxes season cards reselling

spy mode
access cameras clients presence and habits warning when license plate/ customers detected

conclusions
Be careful what you expose on the Internet Harden! Avoid defaults! Restrict!

THANKS!
securitybydefault.com

