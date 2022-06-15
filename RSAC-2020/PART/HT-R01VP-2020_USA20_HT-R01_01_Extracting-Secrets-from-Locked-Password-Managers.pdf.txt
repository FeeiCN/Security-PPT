SESSION ID: HT-R01
Extracting Secrets from Locked Password Managers

Adrian Bednarek
Senior Security Analyst Independent Security Evaluators (ISE) @ISEsecurity

#RSAC

#RSAC
Agenda
What is a password manager? Common terminology Security guarantees Threats Look at 1Password, LastPass, Dashlane, KeePass
2

#RSAC
Background
Reverse Engineering
­ Software ­ Communications protocols ­ Obfuscated code
Challenging but higher likelihood of finding vulnerabilities
Online Game Exploitation
­ Exploiting virtual economies

#RSAC

#RSAC
Password Manager Research Timeline

#RSAC
What is a password manager?

#RSAC
Anatomy of a Password Manager
Credential management system
­ ~60m users
Typical workflow
­ Enter a master password ­ Unlock access to all credentials ­ Lock password manager

#RSAC
Workflow Overview
8

#RSAC
Terminology

#RSAC
Password Manager Terminology
Master password
­ A memorized secret that will grant access to all entries stored in a password manager
Unlocked
­ The password manager has been unlocked by entering the master password and entries are viewable
Locked
­ The password manager has been locked or `logged out' from

#RSAC
Password Manager States
Not Running
­ Password manager is not a running process. There should be no trace of the master password or entries on disk or in RAM
Running: Unlocked State
­ Password manager has been unlocked by entering the correct master password
Running: Locked State
­ The password manager is an active process ­ Entries are not viewable since it has been locked or `logged out' from

#RSAC
Password Manager Security Guarantees

#RSAC
"Not Running" State Security Guarantees
No secrets stored on disk that would reveal the master password or entries
Credential database should be non-trivially encrypted
­ An attacker should not be able to find a flaw/break the encryption
Credential database should not be brute forceable
­ Master password to decryption key workflow should be computationally intensive
­ Attacker should not be able to guess the master password at a rate of 1 million attempts per second for example

#RSAC
"Running:Unlocked" State Security Guarantees
It should not be possible to extract the master password from memory
Entries that have not been viewed should remain to be encrypted
­ E.g. If 1000 entries are present only the ones viewed or operated on should be present in memory
It may be possible to extract cryptographic keys derived from the master password

#RSAC
"Running:Locked" State Security Guarantees
All security guarantees of a "not running" should apply to a password manager that is in a locked state.
­ No master password extraction possible ­ No cryptographic key extraction possible ­ No entry extraction possible

#RSAC
Threat Scenarios
1: Running 2: Running: Locked* (pwm typically run in background) 3: Running: Unlocked

#RSAC
Attacks on "Not Running" Password Managers
PBKDF2/Argon2 Password expansion All secrets are encrypted at rest

#RSAC
Attacks on "Running:Locked" Password Managers
Master password extraction should not be possible Cryptographic key extraction should not be possible Entry extraction should not be possible

#RSAC
Locked

#RSAC
Unlocked

#RSAC
Running:Locked

#RSAC
Demo Attack ­ Running:Locked (1Password4)

Again without cuts:

#RSAC

#RSAC

#RSAC

#RSAC
Running:Locked
Dashlane
­ Master password is not recoverable ­ Entries are recoverable
KeePass 2
­ Master password is not recoverable ­ Interacted with entries are recoverable
LastPass
­ Master password persists in plaintext ­ Interacted with entries are recoverable
1Password 7
­ Master password persists in plaintext ­ Entries are recoverable

#RSAC

#RSAC

#RSAC
A Windows Bug Appears!
A side-quest led to an interesting 20+ (?) year old windows bug

#RSAC
Windows Bug Discovery
Original Test
­ Locked password manager ­ Master password typed in:
­ Where is the master password?
Doesn't exist in a readable state :

#RSAC

#RSAC

#RSAC

#RSAC
The Bug!

#RSAC

#RSAC
LastPass (Windows bug mitigation)
Locked:

#RSAC
LastPass (Windows bug mitigation)
Master Password?:

#RSAC
Mitigation is helpful (for us)

#RSAC
Attacks on "Running:Unlocked" Password Managers
Master password extraction should not be possible Cryptographic key extraction may be possible* Entry extraction should be possible for interacted entries

#RSAC
Attacks on "Running:Unlocked" Summary
1Password4
­ Master Password: Recoverable* (with difficulty) ­ Entries: Last interacted with entry
1Password7
­ Master Password: Recoverable ­ Entries: All are recoverable
Dashlane
­ Master Password: Not recoverable ­ Entries: All are recoverable
KeePass 2
­ Master Password: Not recoverable ­ Entries: Interacted with are recoverable

#RSAC
Attacks on "Running:Unlocked" Summary
LastPass
­ Master Password: Recoverable ­ Entries: Recoverable

#RSAC
Summary

#RSAC
In a nutshell...
Password managers are not perfect, but you should still use them! https://www.ise.io/casestudies/password-manager-hacking/

#RSAC
Apply What You Have Learned Today/Going Forward
Things to keep in mind:
­ Consider the risk you are undertaking by using or not using a password manager ­ Think of various threat scenarios and understand the consequences (e.g. lost
powered on laptop, laptop imaged in a running state at a border crossing for example)
In the short run:
­ Develop contingencies for threat scenarios ­ Plan for mitigations around password managers that are not inline with your appetite
for security
In the long run:
­ Be on the lookout for emerging zero knowledge solutions ­ Understand and anticipate emerging threats against password managers!
44

#RSAC
Thank You!
https://www.ise.io/ https://www.linkedin.com/in/adrianbksd/

