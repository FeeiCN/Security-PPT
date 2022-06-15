Long Live Linux Forensics!

The Linux Forensics Team

$ whoami

$ whoami

$ whoami

Ali Hadi
Professor @ Champlain College
{Computer and Digital Forensics, Cybersecurity}
@binaryz0ne

Brendan Brown
Alum @ Champlain College {CDF & Cybersecurity}
Reverse Engineer - InvictusIC

Victor Griswold
Senior @ Champlain College {Digital Forensics and Cybersecurity}

@br_endian

@vicgriswold

2

Scenario(s)
- Learning Linux Forensics Through Case Studies -

#1 Linux User Artifacts (GNOME/XFCE)

#2 Compromised Web Server...

#3 More Hidden Processes...

3

Case #1: Linux User Artifacts...
 Looking at some test cases for the following User Activity artifacts:  Thumbnails  Trash  Recently Used Documents
 Performed on Ubuntu 18.04.1 LTS (GNOME) and Kali 2020.1b (Xfce4)  Comparing results between the two test environments  Comparing Freedesktop (XDG) Standards to findings
4

Thumbnails What we Expect...
 Thumbnails will appear in ~/.cache/thumbnails/[normal | large | fail]  Thumbnails will be in PNG format  Thumbnails will contain at least the Thumb::URI and Thumb::MTime
PNG tEXt keys  Thumbnails file name will be the MD5 hash of the URI found in
Thumb::URI with .png appended
5

Xfce4 Thumbnails

Only 3 thumbnailed
exiftool -S -ThumbURI -ThumbMTime . | grep -C1 [dir_name]
Test dir = ~/home/Desktop/Cats/
6

11 Images

GNOME Thumbnails

Test dir = ~/home/Desktop/Cats/
7

Same 11 Images All 11 thumbnailed!

GNOME v. Xfce4 Thumbnail Tags
8

GNOME + Xfce4 Thumbnail Timestamps

sudo debugfs -R 'stat [<inode_num>]' /dev/...
9

Last Viewed First Viewed

Trash Folder What we Expect...
 Expect to find a folder called `Trash' in each user's ~/.local/share  Expect to find at least 2 directories in "Trash": files and info
 `files' directory will contain all the files and directories that have been moved to trash
 `info' directory will contain *.trashinfo files related to files in `files' directory
Note: Files only moved to trash through GUI interaction (not through `rm' commands)
10

GNOME and Xfce4 Trash Folders
11

GNOME and Xfce4 Trash Folders (cont.)
Trash directory is created when first file is trashed
"expunged" directory is created and timestamps update on trash empty
12

Trash Folders Timestamps
Before Trashed files try to maintain the original files atime and mtime. Files ctime will indicate when it was deleted and should match the corresponding .trashinfo files crtime.
13

Trashed .trashinfo

Recently Used What we Expect...

 An XML file with similar format to this
 Found in ~/.recently-used
This is not exactly what we find...

Example from freedesktop standards:
<?xml version="1.0"?> <RecentFiles>
<RecentItem>
<URI>file:///home/jwillcox/testfile.txt</URI> <Mime-Type>text/plain</Mime-Type> <Timestamp>1028181153</Timestamp> <Private/> <Groups> <Group>Recent File Test</Group> </Groups>
</RecentItem> </RecentFiles>

14

What we find recently used GNOME
File found in: ~/.local/share/recently-used.xbel
15

What we find recently used Xfce4
File found in: ~/.local/share/recently-used.xbel
16

Recently Used Breakdown
17

#2: Compromised Web Server...
 You might be wondering that you've already seen this case before?  Web Server Environment (Apache)  Unusual network activity was noticed
 Previous cases our team showed how to track down a threat actor using different system artifacts, especially logs!
 Today we are dealing with a different scenario!
18

Case Constraints!!!
 No Web Server Logs...  Dealing with Hidden Processes...  You can't acquire system memory...  You can't do memory forensics...
 This is where this talk comes in...
19

Apache Backdoor Module!!!
 But does that mean there is no one using Apache2?
[1] RGDoor found by Unit42 at Palo Alto Networks [2] Apache Backdoor found by Welivesecurity at ESET [3] Backdoors in XAMP by Juan Fernandez at Tarlogic [4] Apache PoC Module by Vlad Rico @RicoVlad
20

How it Works!!!
 Sending reverse shell using the malicious Apache2 module  Threat actor now has root access...
21

Normal Network Connections??!!
 Start by checking the network services...  Everything looks normal here; right?
22

Normal Network Connections??!!
 Think again; check the "avahi-daemon"
 Why is avahi*:  Not bound to UDP port 5353?  Communicating with TCP port 443?!
23

Wait / What... BASH not Avahi*??!!
 Listing Open TCP connections using lsof...

Findings: 32914

PID = 2106 | user = root | FD = 0,1,2,12 | Device = Protocol = TCP | Dest. IP Address = 192.168.210.132
24

Checking Open Files!!!
 UNIX Domain Socket used for process communication...  STREAM 32194 and 32273
25

 PPID? !!

Process Context??!!

 Process = Systemd  User = root

 Let's check the FDs, sockets, and pipes used...

 We can see the socket (s) file in /tmp
26

FDs, Sockets, and Pipes!!!
 Process file descriptors and how they are mapped to the sockets and pipes
 We can map them with what we've previously seen...
27

Apache Instances!!!
 We have two Apache2 instances; why?!
 We can also see the running Bash
28

CGroups & Loaded Modules!!!
 CGROUPS for the Apache2 unit...
 Checking the loaded apache modules... we can see the authz_net string!
 Turned out to be a module!
29

Apache2 Instance!!!
 PPID = 2034  This is the apache2 instance
with the number of threads...  Suspicious module also
loaded here
30

Unix Socket Streams!!!
 PPID = 2103  The weird module
/tmp/mod_authz_net we've seen before!  This is the malicious Apache2 instance which is channeled with the reverse shell using bash...
31

Static Checks!!!
 If we check the strings and/or the imported symbols, we can see some interesting features related to network, system, and process activity
 We can also see features related to the backdoor itself...
Note: output is filtered
32

Network Functions
Backdoor functions System Functions Process Functions

Shout(s)-Out!!!...
 Thanks to all those out there that keep reminding the community of not to KILL a process, but dump it from memory first, especially if it does not exist on disk anymore!
 Craig H. Rowland, @CraigHRowland
 https://twitter.com/CraigHRowland/status/1177373397463863296
33

Anonymous Processes
- They exist... - Process spawned from chunk of memory - Never on filesystem -> no FS artifacts - Creating & writing directly to FD
34

What we're examining
NC reverse shell - Leveraging memfd_create() - Non-native ELF pushed in
remotely and written to mem

Process Behavior
Fork -> Execute -> Die - Why do we care? - Parent data in /procfs - Children? Commands?
36

Monitoring
Execsnoop - leverages ftrace to record exec() calls Pkg: perf-tools-unstable
Forkstat - records the following events: Pkg: forkstat
IR Toolkit != forensically sound *Tsurugi - DFIR Linux
37

Shell creation: - Sshd called - Motd - Patch state - Update check - Mounting FS

Monitoring - execsnoop
execsnoop-perf -a 16 -r > proclog.txt

Process executions:

38

How is forkstat different?

Monitoring - forkstat
forkstat -e all -x -S > forklog.txt

- Datapoints: 1 vs. 12
- No exec()? - Process Ancestry - Procmon
39

Monitoring - Forkstat -
- UID info - ssh without pseudo
terminal - Verbose binary
(command) calls - Witness the fork > execute > exit cycle
40

Parent ->
Child

Session ID

Consistent session ID

41

Environ + Others
Most Relevant Procfs artifacts: /proc/$$/environ /proc/$$/cmdline /proc/$$/task/$$/children /proc/$$/status /proc/$$/io
- Process data transfer - Arguments passed to process - Parent-child relationship & proc
name
42

Environ + Others

Most Relevant Procfs artifacts: /proc/$$/environ /proc/$$/cmdline /proc/$$/task/$$/children /proc/$$/status /proc/$$/io

(/bin/dash) - SSH host / client address + ports - Language - Session ID - User - UID - PWD - Homedir - Shell - Underscore variable *
(binary / script last executed as arguments)
43

Summation
- How to find data from process with no FS attribution - How processes behave in memory - Why they can be hard to track normally - Tools to help you follow the chain of execution - Artifacts in procfs found to be most relevant
44

thanks!
Any questions?
You can find us @binaryz0ne | @br_endian | @vicgriswold
45

Credits & References...
Special thanks to all the people who made and released these awesome resources for free:  Presentation template by SlidesCarnival and Photographs by Unsplash  Credits to Vlad Rico @RicoVlad for the Malicious Apache2 Module
 Module here: https://github.com/VladRico/apache2_BackdoorMod  Craig Rowland @CraigHRowland, for his awesome Linux Forensics work.  Stuart @MagisterQuis, for his write ups on anonymous processes  Lynx for their process forking image.  Sorry if we missed someone!
46

