A Process is No One: Hunting for Token Manipulation
Jared Atkinson & Robby Winchester

@jaredcatkinson
· Adversary Detection Technical Lead @ SpecterOps · Developer:
· PowerForensics · Uproot · ACE · PSReflect-Functions
· Microsoft MVP - Cloud and Data Center Management (PowerShell) · Former:
· U.S. Air Force Hunt Team · Veris Group's Adaptive Threat Division

@robwinchester3
· Adversary Detection Lead @ SpecterOps · Contributor:
· Co-author of ACE · HELK
· Former:
· U.S. Air Force Red Team · Veris Group's Adaptive Threat Division

Overview
· What is "Hunt"? · Attacker TTP · Creating a Useful Hypothesis · Case Study
· Detecting Access Token Manipulation

What is "Hunt"?
· Actively searching for malicious activity in the environment that has evaded current in place defenses
· Rooted in the assume breach mentality

Generic Hunt Process

"Generic" Hunt Process Problems
· Gather data
· What data should we collect? · Why are we collecting that data? · SIEMs, like Splunk, are expensive... · Open source alternatives, like ELK, are technically free but cost time
· Hunt for bad
· What are you looking for in the gathered data? · What is "good" activity that can safely be filtered? · How much time do you have to search through the data? · Must balance "Hunting" time with "Investigation" time

Hypothesis Driven Hunting

Hypothesis Driven Hunting Benefits
· Focuses data collection effort · Provides a specific goal for the team · Combats data collection for data collection sake · Helps eliminate "analysis paralysis" · Track hypotheses over time
· What Tactics are you not covering · Identify knowledge gaps that training can help fill · Inform purchasing decisions moving forward

Great, so how do I make a hypothesis?
· This is the focus of the presentation! · We will walk you through how to make a hypothesis that will
actually result in something tangible · Will do a practical demonstration on using this process to create
and execute a hypothesis for Access Token Manipulation

First, what are we looking for?
· Assume Breach
· Tons of organizations have been breached · It's a matter of WHEN not IF a breach will occur
· Focus on post-exploitation activity
· Most in place defenses tools focus on preventing/detecting the initial attack
· Firewalls · Anti-Virus · Intrusion Detection/Prevention Systems
· If you can stop the attack before the objective is achieved, the attack is still stopped

MITRE Cyber Attack Lifecycle
https://attack.mitre.org/wiki/Main_Page

MITRE ATT&CK Framework
· A body of knowledge for cataloging an adversary activity during the attack cycle
· Similar to how OWASP defines application security vunerabilities · Used as a reference for both offense and defense
· Red Canary's Atomic Red Team Project (https://github.com/redcanaryco/atomic-redteam)
· Includes Windows, Unix, and MacOS TTPs
· Categories loosely correspond with the attack cycle
· Persistence · Lateral Movement · etc.

MITRE ATT&CK Framework

TTPs: What are they?
· We will explain the meaning of TTPs with an example of a Car · Tactics - The employment and ordered arrangement of forces in
relation to each other
· Preventative Maintenance
· Techniques - Non-prescriptive ways or methods used to perform missions, functions, or tasks
· Changing Oil
· Procedures - Standard, detailed steps that prescribe HOW to perform specified tasks
· Detailed manufacturer's instructions for oil change

Tactics & Techniques
· Tactics
· Sorted by column headers
· Techniques
· Represented by individual entries in ATT&CK matrix · 217 techniques currently documented · Windows, Linux, MacOS
https://attack.mitre.org/wiki/Main_Page

Procedures
· In the detailed information of each technique specific examples or threats are included as available
· Not all procedures are included, but the data set is large and growing

Why is this useful?
· Focus on detecting the behavior, not hashes and specific tool signatures
· Reference throughout the hypothesis process · Tracking hunt history (technique coverage) · Plan/chart future hunt activity · Identify areas (Tactics) lacking coverage

Enter the Hunt Hypothesis

Our Hypothesis Process
· 5 step process to create meaningful hunt hypotheses 1) Identify the Tactic and Technique 2) Identify the Procedure(s) 3) Identify the Collection Requirements 4) Identify the Scope 5) Document Excluded Factors
· Intended to be used to create hunt hypotheses to be completed in one week

Phase 1: Identify the Tactic & Technique
· High level what are you looking for? · Used to track interest (tactics) over time in environment · Attacks rarely use only one Tactic or Technique
· Specifically focus your efforts

Phase 2: Identify the Procedures
· Specific examples and implementations of the selected technique · Frequently found in APT reports, threat intelligence, etc. · Understand and examine the different procedures · What can and cannot be easily changed across all of the
procedures? · Perform research to understand the basic concepts of each
procedure

Phase 3: Identify Collection
Requirements
· Bulk of the research time · Replicate malicious activity in the lab · Identify common behaviors · Identify high false positives
· If possible, test in a small portion of the network
· Should result in a POC collection capability which gathers desired data

Phase 4: Identify the Scope
· Two factors for scope:
· Time
· Length of execution window · We recommend starting with week long execution windows
· Number of data sources to collect
· Can be host or network information · How much data can be collected in the timeframe? · How much data can be analyzed in the timeframe?
· Primarily based on collection requirements · Scope may be limited due to limited collection capability

Phase 5: Document Excluded Factors
· What things were you unable to include in the hypothesis at each level?
· What TTPs were not able to be researched during this hunt? · Technical collection limitations? · Political limitations? · Scope limitations?
· Will feed future hunt hypotheses · Informs future technology purchases · Quantifies the effects of scope limitation

What do we have at the end?
· Specific behavior being "hunted" for in the environment · Understanding of the attack technique · Knowledge of data required to detect the activity

Benefit of this process
· Focuses hunt efforts to have a tangible result · Incremental improvement of security posture over time · Can transition reported attack techniques to real security quickly

Case Study
Detecting Access Token Manipulation

CISO went to Hacker Summercamp
· Our situation:
· Small security budget · No EDR capability (agent-based monitoring) · Poor lateral network visibility · Lots of local administrators
· Our task:
· Can we detect it? · Can we stop it? · Have we been affected by it?
· Our reality:
· Don't want to focus on the Empire specifically, but maybe its capabilities

Phase 1: Tactic and Technique(s)

· Empire is commonly used for:
· Privilege Escalation
· Access Token Manipulation · Bypass User Account Control
· Defense Evasion
· DLL Injection
· Credential Access
· Credential Dumping
· Lateral Movement
· Pass the Hash · Pass the Ticket · Windows Management Instrumentation
· Tactic - Privilege Escalation 1
· Technique - Access Token Manipulation 2

1https://attack.mitre.org/wiki/Privilege_Escalation 2https://attack.mitre.org/wiki/Technique/T1134

Access Token Manipulation
· Windows uses access tokens to determine the security context of a running process or thread
· Attackers can manipulate their applied access token to access securable objects or perform privileged operations that they previously were not able to do.
· Procedures
· Token Impersonation (Theft) · Create a Process with a Token · Create Token  Impersonate Token
https://attack.mitre.org/wiki/Technique/T1134

Windows Authentication Overview
· Windows creates a logon session upon successful authentication
· User credentials (if any) are stored in lsass.exe
· Credentials may be used later for Single Sign On
· Credentials are tied to the logon session · Typical credentials: NTLM hash, Kerberos tickets, plaintext passwords
· Tokens define the security context of a process/thread
· When a process/thread wants to act in a user context it uses a token
· Interact with a securable object or perform an action that requires privilege
· Tokens are tied to logon sessions and determine how the cred is used
Thread/Process  Token  Logon Session  Credential

Logon Session Types
· The logon session type is the only thing that matters for credential/token theft
· NOT the token type. Credentials are tied to a logon session, NOT a token!
· Types
· Network logon (type 3): the client proves they have credentials, but does not send them to the server (credentials are NOT in memory)
· Non-Network logon (Interactive/NetworkCleartext/etc.): the client sends credentials to the service (credentials are in lsass.exe)
· Implication:
· If Logon Session Type is 3 (Network logon) then there is no credential/token to steal

What is an Access Token?
· Kernel object that describes the security context of a process/thread
· Contains the following information:
· User Account Security Identifier (SID) · Group SIDs · Logon SID (Logon Session Identifier) · List of Privileges held by user or groups · Token Integrity Level · Impersonation Level · Optional list of restricting SIDs
https://msdn.microsoft.com/en-us/library/windows/desktop/aa374909(v=vs.85).aspx

Token Types & Impersonation Levels
· 1) Primary - a process token
· OS uses token's credentials to authenticate remotely.
· 2) Impersonation - a thread token
· Threads use Impersonation tokens to impersonate other security contexts · OS might use token's credentials to authenticate remotely
· Token Impersonation Levels
· Anonymous - Remote server cannot identify/impersonate client · Identification - Remote server can identify user, but not impersonate · Impersonation - The remote server can identify and impersonate the client
across one computer boundary · Delegation - The server can impersonate the client on across multiple
boundaries, and can make calls on behalf of the client.

Who has seen or done this??
Image Credit: https://dfirblog.wordpress.com/2015/10/24/protecting-windowsnetworks-uac/

Access Token Manipulation Overview
· Every process has a primary token that describes the security context of the user account associated with the process
· By default, threads use the process' primary token · Threads can impersonate a client account
· The thread will have both a primary and impersonation token in this case
· Token Impersonation · Create a Process with a Token · Make and Impersonate Token

Phase 2: Identify the Procedures
· Technique - Access Token Manipulation · Token Impersonation · Create a Process with a Token · Make and Impersonate Token

Token Impersonation (Theft)
· Situation:
· Your target user has a non-network Logon Session on the system.
· Assuming admin rights, you can directly impersonate the token. · DuplicateToken(Ex)
· Creates a new access token that duplicates an existing token.1 · Can use returned token w/ ImpersonateLoggedOnUser or SetThreadToken
· ImpersonateLoggedOnUser
· Lets the calling thread impersonate a logged on user's security context.2 · Works with primary and impersonation tokens.2
· SetThreadToken
· Assigns an impersonation token to a thread.3
1https://msdn.microsoft.com/en-us/library/windows/desktop/aa446617(v=vs.85).aspx 2https://msdn.microsoft.com/en-us/library/windows/desktop/aa378612(v=vs.85).aspx 3https://msdn.microsoft.com/en-us/library/windows/desktop/aa379590(v=vs.85).aspx

Create a Process with a Token
· Situation:
· You want a quick way to create a process with a security context for a different user account.
· DuplicateToken(Ex)
· Creates a new access token that duplicates an existing token.1 · Can use returned token w/ ImpersonateLoggedOnUser or SetThreadToken
· CreateProcessWithTokenW
· Creates a new process and its primary thread.1 · Process runs in the security context of the user account represented by the
specified token.1
1https://msdn.microsoft.com/en-us/library/windows/desktop/ms682434(v=vs.85).aspx

Make and Impersonate Token1
· Situation:
· You have a username and password, but the user is not logged on
· LogonUser
· Set the dwLogonType to LOGON32_LOGON_NEW_CREDENTIALS (type 9) · Creates a NewCredential Logon Session for specified user and password
· Local authentication will use the parent process' user · Network authentication will use the specified user account
· Returns a copy of the new Logon Session's access token
· SetThreadToken
· Assigns an impersonation token to a thread.
1https://blog.cobaltstrike.com/2015/12/16/windows-access-tokens-and-alternate-credentials/

Phase 2: Identify the Procedures
· Technique - Access Token Manipulation · Token Impersonation · Create a Process with a Token · Make and Impersonate Token
· Procedure
· Token Impersonation · Create and Impersonate Token

Phase 3: Collection Requirements
· Interact with known Access Token Manipulation tools to identify collection requirements
· Incognito (Meterpreter) · Invoke-TokenManipulation (PowerSploit/PowerShell Empire) · Cobalt Strike
· Collect relevant data points
· Access Tokens for each process and thread

Collecting - Access Tokens
· Enumerate processes/threads (Get-Process) · OpenProcess1 - Returns a handle to a process object · OpenProcessToken2 - Opens an access token associated with a
process · OpenThread3 - Returns a handle to a Thread object · OpenThreadToken4 - Opens an access token associated with a
thread · GetTokenInformation5 - Retrieves a specified type of information
about an access token
1https://msdn.microsoft.com/en-us/library/windows/desktop/ms684320(v=vs.85).aspx 2https://msdn.microsoft.com/en-us/library/windows/desktop/aa379295(v=vs.85).aspx 3https://msdn.microsoft.com/en-us/library/windows/desktop/ms684335(v=vs.85).aspx 4https://msdn.microsoft.com/en-us/library/windows/desktop/aa379296(v=vs.85).aspx 5https://msdn.microsoft.com/en-us/library/windows/desktop/aa446671(v=vs.85).aspx

Get-AccessToken1
https://gist.github.com/jaredcatkinson/17698b39efd72f976a6a846ec3a8eacd

Collecting - Ticket Granting Tickets
· Enumerate LSA Logon Sessions
· LsaEnumerateLogonSessions1 - Returns a handle to an array of session data structures.
· LsaGetLogonSessionData2 - Queries each session handle for its associated information (logon type, user, etc.).
· Request each Logon Session's Ticket Granting Ticket
· LsaRegisterLogonProcess3 - Establishes a connection to the Local Security Authority Server.
· LsaCallAuthenticationPackage4 - Calls a specified function implemented by an authentication package (Kerberos).
· LsaDeregisterLogonProcess5 - Closes the connection to the Local Security Authority Server.
1https://msdn.microsoft.com/en-us/library/windows/desktop/aa378275(v=vs.85).aspx 2https://msdn.microsoft.com/en-us/library/windows/desktop/aa378290(v=vs.85).aspx 3https://msdn.microsoft.com/en-us/library/windows/desktop/aa378318(v=vs.85).aspx 4https://msdn.microsoft.com/en-us/library/windows/desktop/aa378261(v=vs.85).aspx 5https://msdn.microsoft.com/en-us/library/windows/desktop/aa378269(v=vs.85).aspx

Get-KerberosTicketGrantingTicket1
https://gist.github.com/jaredcatkinson/c95fd1e4e76a4b9b966861f64782f5a9#file-get-kerberosticketgrantingticket-ps1

Phase 4: Identify the Scope
· Our timeframe:
· One week
· Our environment:
· 3 Domains · 1 Linux Server (non-domain joined) · 9 Windows Workstations · 2 Windows Servers · No sensitive production systems
· Our scope:
· 3 domains · Windows Servers and Workstations (11)

Phase 5: Document Excluded Factors
· Privilege Escalation
· Bypass User Account Control · New Service
· Credential Access
· Credential Dumping · Account Manipulation · Security Support Providers
· Lateral Movement
· Pass the Hash · Pass the Ticket
· Scope
· Lacked credentials for the Linux Server

Hunt Execution Demo!!

Adversary Runs Get-System

Query Impersonation Tokens

Stolen Token in Detail

Establish PSRemoting Session to Targets

Query Kerberos TGTs in Each Session

Viewing Malicious Session in Detail

