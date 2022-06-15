macOS security features and
bypasses by example
Jonathan Bar Or ("JBO")

# whoami
- Jonathan Bar Or ("JBO") - @yo_yo_yo_jbo - Experienced security researcher focusing on offensive security - Microsoft Defender for Endpoint research architect for cross-platform - Focusing on Linux, Android, macOS and iOS - Some Windows stuff here and there ;) - I try to come up with funny vulnerability names

macOS security
- Many security layers! - POSIX-traditional (e.g. POSIX permissions ugo/rwx) - BSD-based (e.g. Mach ports) - Apple-proprietary (e.g. TCC, SIP, Apple sandbox, ...)
- We will be focusing on the Apple-proprietary ones (in this talk)

Apple proprietary
- Apple-entitled binaries are: - Interesting - Undocumented - Have tons of assumptions
- It took years to secure Linux SUID binaries (and still we got some in 2021 & 2022). - How much scrutiny did the Apple entitled binaries receive?

SIP bypass - Shrootless

SIP \ rootless
- System Integrity Protection (SIP), aka "rootless", introduced as early as Yosemite. - Leverages the Apple sandbox to protect the entire platform, even from root. - Can only be legitimately disabled in recovery mode.

Internally
- Configured with two NVRAM variables: - csr-active-config: bitmask of enabled protections - csr-data: stored netboot configuration
- Can't legitimately modify those without booting into recovery mode. - csrutil controls SIP (in non-recovery mode can do only limited things).

csr-active-config
- Is a bitmask that controls SIP protections. - Compromising any of these is considered a SIP bypass.

Filesystem restrictions
- Can't modify "restricted" files. - A file is restricted if it:
- Has the "com.apple.rootless" extended attribute. - Under a directory mentioned in /System/Library/Sandbox/rootless.conf - And is not whitelisted (maintained in two other files) - Obviously, you can't manually make a file SIP protected (think undeletable malware). - Can view with ls ­lO option.

Filesystem restrictions

Filesystem restrictions
- Very strong security feature that can also stop malware. - It's always interesting to examine the sandbox log:

Rootless entitlements
- How does Apple handle upgrade situations (and others)? - Apple has a set of entitlements for completely bypass SIP checks! - All begin with "com.apple.rootless" prefix.
- Two important ones (for filesystem checks): - com.apple.rootless.install: bypasses all filesystem SIP checks. - com.apple.rootless.install.inheritable: grants the previous entitlement ("com.apple.rootless.install") to its child processes.

Rootless entitlements

SIP bypass 101
- Mostly focus on com.apple.rootless entitled processes. - Some of these are very trivial:

Hunting for SIP bypasses
- Examined SIP entitled binaries on my box and looked for operations that could be exploited by an attacker.
- J's entitlement DB is a good way of finding entitled binaries: http://newosxbook.com/ent.jl
- Use Microsoft's own EDR to look for interesting child processes.

system_installd?
- Read about system_installd - com.apple.rootless.install.inheritable ­ very powerful! - Daemon that gets invoked when installing an Apple-signed pkg.
- Played with system_installd - Will do various tasks like updating cache, moving files to temporary paths and so on. - If package has a post-install script ­ will invoke it. - Which explains why zsh is a child process.

What can zsh do?
- Zsh has .zshrc files but only runs them on interactive mode. - But also has .zshenv and /etc/zshenv. - Reading the zsh source code is always fun.

Trivial exploit
- Download signed PKG file that legitimately invokes zsh. - Plant an easy /etc/zshenv:
if [ $PPID -eq `pgrep system_installd` ]; then do_whatever_sip_free
fi - Trigger installer.

Bonus ­ zsh for EoP
- When running "sudo -s", zsh will run ~/.zshenv on startup. - Root user's ~ is still /Users/$USER! ¯\_()_/¯ - Admin to root EoP! if [ `id -u` -eq 0 ]; then do_evil fi
- This time not easy to trigger a root zsh. - But cool to lurk and wait to be "rooted". - Still unfixed but I let Apple and the zsh community know.

Shoutouts
- Following Shrootless it has been discovered that there are similar issues in exploiting system_installd (perception-point.io).
- CVE-2022-22583 - Invoking system_installd but mounting /tmp to attacker-controlled directory. - Requires to win a race.

TCC bypass - Powerdir

What is TCC?
- Transparency, Consent and Control (TCC) is a macOS technology first introduced in Mojave (10.14).
- "The UAC equivalent for macOS" ­ "%s wants to control %s"

The TCC database(s)
- TCC is saved in a SQLite DB (TCC.db) - System: /Library/Application Support/com.apple.TCC/TCC.db - User: ~/Library/Application Support/com.apple.TCC/TCC.db
- Therefore, two tccd instances ­ one for user and one for system - tccd enforces policy (with the help of securityd)
- Protections: - System TCC DB is SIP protected and TCC (+sbx) protected - User TCC DB is TCC (+sbx) protected - Can't even read the database without "full disk access" - Which is managed by the global (SIP protected) tccd

Naïve TCC "bypass"
- If terminal has full disk access, then one can modify the user TCC.db without root! - Checking if Terminal has full disk access can be deduced by parsing logs, attempting to list certain directories or by the presence of certain apps that require Terminal to have FDA. - We should watch out for file writes (and file reads) of TCC.db. - Was originally abused by Dropbox.

kTCCService%s

- TCC has fine-grained access (not an exhaustive list):

Access name kTCCServiceLiverpool kTCCServiceUbiquity kTCCServiceSystemPolicyDesktopFolder kTCCServiceCalendar kTCCServiceReminders kTCCServiceMicrophone kTCCServiceCamera kTCCServiceSystemPolicyAllFiles kTCCServiceScreenCapture

Description Location services iCloud access Desktop folder access Calendar access Reminders access Microphone access Camera access Full disk access Screen capture capabilities

Saved in User TCC.db User TCC.db User TCC.db User TCC.db User TCC.db User TCC.db User TCC.db System TCC.db System TCC.db

csreq
- For some TCC services, a "csreq" blob is verified. - Encodes the code signing requirements of the app.
- Create your own:

com.apple.private.tcc.private
- Private Apple binaries may have entitlements that allow them to bypass TCC checks. - That's how tccd gets full disk access. - The obvious attack surface for TCC bypasses.
- Obvious technique: - Find a binary with com.apple.private.tcc.allow - Tamper with it in some way to affect its code flow (including extensions) - Get its fine-grained TCC access

Apple takes TCC very seriously

TCC bypass by mounting backups
- CVE-2020-9771 - Time machine backups could be mounted with apfs_mount with the noowner
flag. - Since backup contains TCC.db ­ the file could be read without restrictions by
anyone. - Single commandline exploit: mount_apfs -o noowners -s
http://com.apple.TimeMachine.2019-11-17-141812.local /System/Volumes/Data /tmp/snap

TCC bypass by tccd poisoning
- CVE-2020-9934 - Can copy tccd and run it manually from an arbitrary pa th.
- Upon execution, tccd will consult the user's TCC.db by expanding $HOME/Library/Application Support/com.apple.TCC/TCC.db
- Poisoning the $HOME environment variable allows an attacker to fully control the TCC.db file!
- Interestingly, the user's tccd runs via launchd with the user's domain, so poisoning $HOME env-var in launchd is possible. - launchctl setenv HOME /tmp/whatevs

TCC bypass by XCSSET malware
- CVE-2021-30713 - Malware had a list of well-known apps with certain permissions (e.g. Zoom with
microphone access) - Creates a bundle inside the "donor" app.
- e.g. /Applications/zoom.us.app/Contents/MacOS/avatarde.app - Apparently, TCC policy would interpret the new app as running from the
donor app bundle, effectively inheriting its TCC policy!

My own TCC bypass
- Apple's fix to CVE-2020-9934 was to change tccd from using $HOME into:
- getpwuid simply gets the "login directory" of the user, which can be changed with the following command (requires root):

My own TCC bypass
- Apparently, you can't simply use dscl create, as NFSHomeDirectory is hardened: - You need kTCCServiceSystemPolicySysAdminFiles - Saved in user's local TCC.db - Hidden from UI but still a popup in some scenarios

My own TCC bypass
- After some research, discovered two commands: dsimport and dsexport. - You can simply export directory entry for the user, edit them and import.
- Couldn't find a way to dsimport to local running user without root 

And then they fixed it!
- Happy accident - Apple fixed it by mistake! - Changed the entitlement of dsimport in a Monteray release
- But they still claim the issue was not fixed. - How can I bypass their "happy accident"? - Remember what I said about entitled Apple binaries?

configd to the rescue!
- /usr/libexec/configd is responsible for configuration changes. - Very attractive target:
- "com.apple.private.tcc.allow" - No hardened runtime - Extensible ("configuration agents"  bundle  dylib load) - configd ­t <bundle_path> will load that bundle

Shoutouts!
- A very similar approach was discovered by Wojciech Regula (@_r3ggi) ­ injecting into the app that controls the Directory Services.
- Wojciech Regula (@_r3ggi) and Csaba Fitzl (@theevilbit) presented other interesting ways of TCC bypasses (some win by KO, some by points).

Bonus ­ SQL injection?

More research
- We are challenging each Apple security mechanism at a time. - Sandbox escape:
- We already have a generic sandbox escape we can't disclose. - But it's going to be called Open Sesame. ;) - Gatekeeper bypasses: - Two awesome ones in recent memory, can we also find one? - Kernel bugs: - IOMFB seems to be a goldmine. - App specific ones: - I heard iMessage is Turing complete ;)

Summary
- MacOS is a unique OS with proprietary security mechanisms. - The security community should scrutinize those proprietary security
mechanisms, especially ones that are overpowered. - Stay tuned: @yo_yo_yo_jbo - Thank you!

