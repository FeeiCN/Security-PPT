The Bro Debugger
Vlad Grigorescu NCSA

> whoami
Member of the Bro development team Security Engineer at the National Center for Supercomputing Applications (NCSA)
https://github.com/grigorescu @0f010d

"Debugging" - originally published 1/14/2006 "Piled Higher and Deeper" by Jorge Cham www.phdcomics.com

There's a better way...

bro --debug-policy

"GDB for Bro Scripts"
· Debugger for script-land · No visibility into the "core layer" (C/C++ code) · Breakpoints, flow control, examining values · Executing Bro statements · Can even be used on live traffic (not recommended)

Breakpoints
· Set breakpoints at script locations

Breakpoints

Breakpoints

Command break
break 3 break error1.bro:3
break bro_init break irc_*

Breakpoint at: Current location Line 3 of current file Line 3 of error1.bro bro_init function/event irc_* function/events

Breakpoints

Command info breakpoints
enable 1 disable 1 delete 1 continue (c)
C-c

Description Show list of breakpoints
Enable breakpoint #1 Disable breakpoint #1 Delete breakpoint #1
Resume execution Stop execution

Examining State

Examining State

Command

Description

list

Show up to 10 lines of code

list 3

Show ±5 lines around line 3

list error1.bro:3

...around error1.bro:3

list bro_init

...around the bro_init event

print $exp (p)

Evaluate and print $exp

Flow Control

Flow Control

Command cond 1 c$?id
next (n) step
finish

Description Add condition to breakpoint 1 Next line, don't enter funcs
Next line, do enter funcs Run until end of current func

Extra Credit
· Setting condition breakpoints can be very powerful · syslog(string) · system(command) · dump_current_packet(file_name)

breakpoint_to_pcap.sh
· Can filter a PCAP file · Filters all connections that hit a certain point
in the code · Can pinpoint traffic that causes protocol errors,
weirds, crashes, etc.

breakpoint_to_pcap.sh
http://go.ncsa.illinois.edu/breakpoint_to_pcap

