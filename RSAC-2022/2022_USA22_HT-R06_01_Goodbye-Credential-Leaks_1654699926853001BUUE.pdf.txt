#RSAC
SESSION ID: HT-R06
Goodbye Credential Leaks: Securing Code Together
Mariam Sulakian, CIPP/US
Product Manager GitHub

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC

Agenda
background

Identifiable tokens

detection

remediation

prevention

take aways

3

#RSAC
Credential leaks are a human error
Background: How & why secrets leak

#RSAC
How do secrets get leaked?
Leaked secrets allow malicious actors to impersonate others & fraudulently use services
On accident Left in git commit history Intentionally
5

#RSAC

10,000

9,000

8,000

Contributors leak

7,000 6,000

over 100 GitHub

5,000

4,000

tokens a DAY!

3,000

2,000

1,000

0

+65% CAGR

6

84% committed file
Secrets can leak anywhere you're building software

#RSAC
15% commit metadata
1% other sources
Including Pull Request comments Issue descriptions
7

One secret is all it takes

#RSAC

EXPOSED CREDENTIAL

18K CUSTOMERS

SERVER ACCESS MALWARE

#RSAC
Detecting your leaks
Reactively finding & remediating exposed secrets

#RSAC
You leaked a secret...now what?
10

#RSAC

Detecting tokens with GitHub secret scanning

Service enabled by default on GitHub.com
Scans public contributions for secrets
Notifies provider for leaked secrets
Available through GitHub Advanced Security for private repositories

11

#RSAC
Secret scanning
12

#RSAC
A case study: leaking AWS credentials
13

#RSAC
A case study: leaking AWS credentials
14

#RSAC
A case study: leaking AWS credentials
15

#RSAC
A case study: leaking AWS credentials
16

#RSAC
A case study: leaking AWS credentials
17

#RSAC
Increasing signal, reducing noise
18

#RSAC
Keeping false positives low
No valid tokens shown.
19

#RSAC
Identifiable tokens = better tokens
20

#RSAC
Identifiable tokens: the false positive remedy

Before

je5WGi23lgk84GEPQglwafj3slgk2lgiwhio8rgk 842b9e8fb032869e88b653fc4df0786240ae6174209b8505c2f9e228a2144e8c

prefix

32-bit checksum

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

dop_v1_ae5067bb5c1d3bcb1f9e580f7a8dd56186f27791101ccc32bd942c8eb9247901

prefix

High entropy (randomness)

21

After

#RSAC
Remediating leaks
When a secret does leak...

How do I remediate a leaked secret?
Assess impact to revoke
Developer

#RSAC
AppSec Team
23

#RSAC
How do I remediate a leaked secret?
Assess impact to revoke Rotate the secret
24

#RSAC
How do I remediate a leaked secret?
Assess impact to revoke Rotate the secret Revoke the secret
25

#RSAC
How do I remediate a leaked secret?
Assess impact to revoke Rotate the secret Revoke the secret Rewrite your git history
26

#RSAC

Even if your leak was in a private repository...

Check API activity logs to ensure you've remediated in time
Monitor repository access permissions
Ensure proper secrets management
Connect with Ops and AppSec teams

27

#RSAC
Preventing leaks
Working proactively

#RSAC
Proactive prevention

After

prefix

32-bit checksum

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

High entropy

IDENTIFY token  protect on PUSH
29

#RSAC
30

Demo: Secret scanning as a push protection
31

#RSAC
32

#RSAC
Protect developers from accidentally exposing credentials
33

34

#RSAC
35

#RSAC

"Just enable this on everything"

Imagine a token with a 20% false positive rate  Devs constantly blocked  Frustration & loss of trust  More bypasses on protection  Protective step loses purpose
36

#RSAC
40%
patterns highly identifiable
of ~200 patterns scanned by GitHub
37

Recap: Path to prevention
Identifiable tokens

mint identifiable tokens

lower false positives

detect with precision

#RSAC
prevent to protect

38

#RSAC
Takeaways
Apply your learnings and boost security

#RSAC
As a developer
Share the security responsibility Act on alerts Practice good hygiene
2 fac authentication Use a vault for secrets Scope minimal permissions for secrets
40

#RSAC
As an organization administrator
Detect Audit Remediate Protect on push
41

#RSAC
As a service provider
Your secrets are already (probably) leaked on GitHub
42

#RSAC
As a service provider
Make your secrets identifiable
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 lin_api_FU7us8Zz81Xv5kfdkxp6Fkx0wAycTq1icRKHHHTK tfp_Fbzs4w9UnM1nmVGKoQaBpq8NHxEhGoYCY5WXhG5UZdck_eoMLSNTXzmFH
43

#RSAC
As a service provider
Make your secrets identifiable Become a secret scanning partner
44

#RSAC
As a service provider
Make your secrets identifiable Become a secret scanning partner Prevent your tokens from accidental leaks
45

#RSAC
We can solve this problem, together
46

#RSAC
Questions? secret-scanning@GitHub.com 47

