Threat Hunting Using Live Forensics
SANS Threat Hunting and IR Summit, 2018

Why Live Forensics?
· Need to acquire/preserve volatile artifacts
· Running processes · Network connections · Open files · Hooks
· System cannot be shut down

Threat Hunting vs. IR
· IR starts with a pivot point
· AV alert · Network connection · Data breach · Abnormal behavior
· Threat hunting seeks abnormal to pivot from

Signs of Evil
· Some things are bad no matter who you are
· Misnamed processes · Running from abnormal directories · Connections to known-bad hosts · Abnormal process owners
· SANS Find Evil Poster: https://digitalforensics.sans.org/media/poster_2014_find_evil.pdf

Signs of Evil
· Some things are more subtle
· Unauthorized processes/services/tasks · Odd ports in use · Code injection/hooks · User actions
· Establish baselines ­ know what is normal!

Challenges for Live Forensics
· Live forensics tools must be run in a way that is...
Documented Repeatable Secure
· Normally achieved via batch files on Windows hosts

So What's Wrong with Batch Files?
· No native logging or audit trail · Some tools are OS or CPU architecture specific · Batch files can be easily modified without warning · Tools can be deleted or replaced

No-Script Automation Tool
· No scripting (obviously) required · Easy to configure for different Windows versions and
CPU architectures · Detailed logging and hashing of all output · Tools and commands can be verified before
execution

Configuring NAT

Configuring NAT ­ Tools
Tools Directory

File System Network OS Process Users
*.ini file

Configuring NAT ­ OS and CPU

File System 6-10.0 x64 x86
Network x86 x64
OS

Windows 7 x64

File System 6-10.0 x64 x86
Network x86 x64
OS

Configuring NAT ­ Command Line Arguments
Network\ping.exe + Network\ping.exe.cmd
· Only command line args
· Ex: -t -f 127.0.0.1, not ping.exe -t -f 127.0.0.1
· One execution per line · End with blank line

Configuring NAT ­ Command Line Arguments

Variable %NOOUT%
%OUTDIR%
%SYSROOT%

Use
By default, output from each tool will be written to a text file in the output directory specified at runtime. To prevent this for a specific tool, use the variable %NOOUT% as the sole argument in the .cmd file, or at the end of each line of command line arguments if other arguments are specified. This can be used when the output directory is specified as part of the command line arguments for the tool.
To specify the output directory as part of the command line arguments, use the variable %OUTDIR% in place of the output directory. This variable will be dynamically replaced with the correct output directory each time the tool is executed. For example, "-o %OUTDIR%\output.txt" for mytool.exe will result in the command "mytool.exe -o <selected output directory>\output.txt being executed at runtime.
To specify the Windows system root, which may vary between hosts, use the %SYSROOT% variable.

Configuring NAT ­ Integrity File
NAT.exe -c
· Hash of tools/commands, contents of commands · Password protected, AES-256 · Bypass with -x switch

Configuring NAT ­ Integrity File

Running NAT

Running NAT ­ Options

Argument -h -x -c
-I <file>

Use Display help menu and exit Bypass integrity check Create integrity check file Use the specified .ini file (default is default.ini)

Demo

Final Notes
· Free ­ Use at your own risk! · Download:
www.dflabs.com/NAT · Questions, comments, suggestions, memes, etc:
john.moran@dflabs.com

Questions?

Thanks!
www.dflabs.com/NAT

John Moran
Senior Product Manager, DFLabs john.moran@dflabs.com

