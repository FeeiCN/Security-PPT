SESSION ID: SBX1-R2
Hello? It's Me, Your Not So Smart Device. We Need to Talk.

Alex "Jay" Balan
Chief Security Researcher Bitdefender @jaymzu

#RSAC

#RSAC
IoT is not optional
2

#RSAC
IoT is not optional

#RSAC
IoT = hardware + OS + app (+cloud)

wu-ftpd

IIS5.0

RDP

Joomla

app
4

#RSAC
IoT hacking. What to look for
Software
­ Telnet (it's still a thing in 2019. I know...) ­ Mobile app ­ device communication
o Command injection o Directory traversal / Local file inclusion o Buffer overflows (99% of all IoTs have binaries compiled without PIE -> no
ASLR -> RCE)
­ Backdoors, credential reuse, private key reuse ­ Cloud chatter.
o How does the mobile app talk to the cloud? o How does the cloud talk to the device?
5

#RSAC
IoT hacking. What to look for
Hardware
­ JTAG (ulator) ­ Serial interfaces
o Boot hijack
6

#RSAC
Boot hijack (cont)
7

#RSAC
More than 12 botnet families. More than 200 botnets
· Mirai, Gafgyt, Hajime, Sina, Objprn, Shishiga, Mr. Black, 84c46036, Reaper, HNS, VPNFilter, BrickerBot
· 89 botnets based on the MIRAI code alone
8

#RSAC
Inside the Hide `N Seek botnet
First spotted in Feb 2018. Gathered around 45000 victims and died one month later "rebooted" in April 2018 and remained alive (still kicking today) P2P Keeps adding both exploits and capabilities in the dropped agents Latest addition ­ ADB in October 2018 Absolutely zero activity other than spreading. Most probable scenario is that it's used purely for testing
9

#RSAC
So many vulnerabilities! So little time!
Tenvis TH611 Geenker IP Camera Keekoon IP Camera Reolink C1 Pro
10

#RSAC
Tenvis TH661
Buffer overflow in the authentication mechanism
­ When using Basic Auth, the credentials are sent in the HTTP header Authorization, encoded in base64
­ The camera does not perform any checks on the header length ­ The function handling the authentication allocates 128 bytes on the
stack, then calls the decoding function specifying that buffer as the destination for the decoded credentials ­ If we submit a set of credentials larger than 128 bytes we will overwrite the stack, gaining control of the execution flow
11

#RSAC
Tenvis TH661
Exploitation
The encoded string contains a buffer which will overflow the stack and then redirect the execution flow to execute the system command, specifying the telnetd ­l /bin/sh string as the parameter.
12

#RSAC
13

#RSAC
Geenker IP Camera
Telnet
­ root:123 ­ Password can't be changed
System backdoors
­ Service on port 1300, used to update the camera. Can be used to to send arbitrary system commands
­ ut_rcmd_server on port 8699 can also be used to send arbitrary commands. Must start with "!" and end with a null byte
14

#RSAC
Geenker IP Camera
Auth bypass
­ Webserver running on port 80 and 443 ­ Login service available but no session is required. Restricted pages can
be accessed if known beforehand ­ Examples: camera settings, users, passwords, wifi credentials, e-mail
credentials
Get users and passwords
15

#RSAC
Geenker IP Camera
Stack overflow in HTTP server
­ Settings interaction through calls to a specific path `/PSIA/<type>/<subtype>/<request>
­ Directories are sequentially copied into the stack ­ Their size is not checked when copied and the return address can be
overwritten after 90 chars ­ Exploit with a gadget that executes system with an argument on the
stack. '#' is needed to include special chars in the request and `*' is used to ensure that the string on the stack is part of our request (`network*#[command]')
16

#RSAC
Geenker IP Camera
Stack overflow in flv server
­ Runs on port 1234 ­ Stack buffers can be overwritten 3 times. Once in the first sscanf and
twice in the second one
­ To achieve RCE we use the two overwrites in the second sscanf. One will write the command on the stack and the second one will overwrite the return address to point to a system gadget
17

#RSAC
18

#RSAC
Keekoon KK05
LAN backdoor
­ Simple executable listening on UDP:10290 (hardcoded)
­ For each packet received, it checks if the first 4 bytes are 0 and then executes as root the command starting with the 5th byte.
­ No auth required
19

#RSAC
Keekoon KK05
Auth bypass
­ "require auth" on the server side enforced by a silly logic: it scans the URI path for several strings (their position doesn't matter). If present, the server will skip authentication
­ We'll use this logic error to extract sensitive info like Cloud ID and password which will facilitate remote access to the camera
20

#RSAC
Keekoon auth bypass

#RSAC
Keekoon KK05
Multiple authenticated stack overflows
­ Webserver has a form for pairing multiple cameras ­ The length of the passed IP address is not checked ­ Using two ROP gadgets we're able to call "system" with an arbitrary parameters => RCE as root
http request example ­ starts telnetd on port 2323
combining with the previous vuln to obtain pre-auth RCE
Two more overflows in formSetEmail and setStaConnect but ain't nobody got time for that ;)
22

#RSAC
Keekoon KK05
Command injection
­ System time can be synchronized with the computer through the web interface. The parameter containing the current time is vulnerable to command injection
­ They check for command injection by looking for ";"!
o So we use any other escape char from bash
23

#RSAC
Keekoon KK05
Hidden form with command execution
­ The web server has a hidden form through which an authenticated user can execute system commands as root
­ The page then redirects to a non-existing page, meaning that maybe they forgot to remove the entire functionality
­ It can be combined with the auth bypass vulnerability for pre-auth RCE
24

#RSAC
25

#RSAC
Reolink C1 Pro
Pre-auth information leak
­ A symlink in the web directory provides information without authentication
Getting e-mail credentials (if e-mail alerts are set)
26

#RSAC
Reolink C1 Pro
Getting Wi-Fi credentials

#RSAC
Reolink C1 Pro
Authenticated command injection
­ The SetDdns function contains a code injection vulnerability that's persistent and will be executed after every restart. Valid token or credentials are needed
28

#RSAC
Reolink C1 Pro
Unauthenticated RCE
­ The ImportCfg function contains three parameters vulnerable to buffer overflows. Part of the request is parsed before credentials are checked eliminating the need for authentication. The vulnerable parameters are boundary,name and filename..
­ HTTP request headers are placed on the heap and we will use the Content-Type header to store our payload
­ To bring the heap to a known reliable state we will first reboot the camera using the same vulnerability.
­ After the camera reboots, the memory allocated for the first request will always be at the same location meaning that we can use the payload stored in the Content-Type header
29

#RSAC
Reolink C1 Pro
Reboot request.. OxF6D4 is the reboot gadget address
Command execution request
Address of Content-Type on the heap Address of the gadget that executes system
30

#RSAC
31

#RSAC
To sum up
We've been researching IoT for the better part of the last 4 years Team exclusively allocated for this In virtually 99.99% of the cases, if the vendor didn't have a bug bounty program, the devices had critical vulns in their latest firmware versions Our attempts to reach out to the vendors were ignored in the vast majority of the cases More than half had RCE over the internet It truly is a gift that keeps on giving

#RSAC
What to do?
Include IoTs in your security posture. This includes your IP phones, PBX, smart power outlets, etc Note that a huge amount of identified issues can't be tracked by CVE look-ups Security audits (internal or outsourced) on all your smart devices. This includes SCADA and Industrial IoT Purchase any device that supports connectivity only from trusted providers with reasonable SLAs. Push for better standards and accountability from vendors
33

#RSAC
That's all, folks!
abalan@bitdefender.com | @jaymzu

