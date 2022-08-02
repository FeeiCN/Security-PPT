The Savage Curtain: Mobile SSL Failures

Who are these guys?
Tony Trummer - Staff Security Engineer aka "SecBro" Tushar Dalvi - Sr. Security Engineer & Pool Hustler

A Private Little War
Our employer generally does not have prior knowledge of, condone, support or otherwise
endorse our research

The Menagerie
{ Apps are mash-ups of native and web code { Java, Objective C, Swift, etc. { Developers control SSL/TLS security
settings and warnings

Basics
TLS provides several security features
{ Encryption { Authenticity { Integrity
In apps, unlike browsers, whether you see a certificate warning is up to the app developer.

Tomorrow Is Yesterday
Before dismissing the idea of large-scale or supply-chain attacks...
{ Recent reports of pre-installed trojans on
low-end Android devices
{ In 2013, Nokia was found to be performing
MitM on customer traffic, reportedly for performance reasons
{ In 2013, reports surfaced claiming that the
NSA and GCHQ ("Flying Pig") were actually performing real-world MitM attacks
{ 2015, Lenovo laptops vulnerable due to
SuperFish CA certificate pre-installed

Wolf in the Fold
{ TLS is really the ONLY protection against
Man-in-the middle (MitM) attacks
{ MitM is significantly easier to perform
against mobile devices

The Immunity Syndrome
Infosec folks often roll their eyes when they read statements on sites or in apps that tout
TLS use and how big their keys are

Journey to Babel
One night, after a few drinks, we decided to test some apps, starting with proxying their
web requests

Into Darkness

First aspect of certificate validation
The app or OS must verify the certificate is cryptographically signed by the private key
of a trusted Certificate Authority

Proper certificate validation
Certificate is signed by the private key of a trusted CA?
Is this an intermediate certificate?
Trusted Root CA

Forget Something?

Tony

Tushar

A Piece of the Action

A Taste of Armageddon

The Trouble with Tribbles

The Trouble with Tribbles

Testing for
CA validation
{ Configure device to use proxy
{ Configure BurpSuite's proxy listener to
"Generate a CA-signed per-host certificate"
{ DO NOT install the proxy's CA
certificate on the test device
{ Verify you see a certificate warning in
the native mobile browser
{ Step through each section of the app
{ If you see HTTPS traffic, in Burpsuite,
the app failed

Second aspect
of validation
Does the Subject Common or Alternative name match the hostname
of the site you're visiting?

Proper certificate validation
Does the Common or Subject Alternative Name Match the hostname?
Traces back to Trusted Root CA

By any other name

By any other name

The Apple

And the Children Shall Lead

Amok Time

By any other name

By any other name

Testing for proper hostname validation
{ Install Portswigger CA cert on device { Configure your device to use a proxy { Configure proxy listener to "Generate a CA-
signed certificate with a specific hostname"
{ Set the hostname to foobar.com { Verify you see a certificate warning in
the native mobile browser
{ Step through each section of
the mobile app
{ If you see HTTPS traffic, the app failed

Proper certificate validation
Does the Common or Subject Alternative Name Match the DNS hostname?
Not expired? Not revoked?
Traces back to Trusted Root CA

Damn it, Jim!

The Naked Time
{ Credit card numbers,
passwords, and/or session cookies

Dagger of the mind
{ Unencrypted credit
card information
{ Tier 1 PCI merchant { 10 million+ installations

Court Martial
FTC vs. Fandango & Credit Karma
{ One of the major flaws cited in the
suit was failure to validate SSL certificates on mobile applications
{ Agreed to "establish
comprehensive security programs"
{ Agreed to "undergo independent
security assessments every other year for 20 years"
{ Scolded publicly for not keeping "their
privacy promises to consumers"

SSL session caching
{ During the initial handshake
the certificate is validated
{ Subsequent client requests
re-use the previous handshake and do not revalidate the certificate
{ TOFU (Trust On First Use)

The Enemy Within
{ Rooted devices, or { Physical access { More likely on mobile

Patterns of Force
If I have physical access, couldn't I just...
{ Install malicious app { Access your data

Turnabout Intruder
{ SSL session caching only
checks the certificate once
{ Install a CA, for the first
connection, then delete it
{ Viewing cache file via adb or
another app requires root access

The City on the Edge of Forever
{ Server decides how long to
accept the cached session (RFC-5077, section 5.6)
{ In other words, the bad guy
gets to decide how long to accept the cached session...
{ We refer to this feature as
"EverPWN"

Shields Up!
{ Review your code { Implement policy { Test pre-release { Train developers

Shields Up!
In Android, investigate these: { TrustManager { SSLSocket { SSLSocketFactory getInsecure { HostNameVerifier
In iOS, investigate these areas: { Don't use AFNetworking < v. 2.5.3 { _AFNETWORKING_ALLOW
_INVALID_SSL_CERTIFICATES_ { SetAllowsAnyHTTPSCertificate { kCFStreamSSLAllowsAnyRoot

Shields Up!
{ Certificate Pinning
{ Dev and prod signing certificates are required to be different in both iOS and Android
{ Build validation mode based on which certificate is used to sign the app

Live Long and Prosper
Contact and testing instructions: http://www.secbro.com

Tony Trummer: http://www.linkedin.com/in/tonytrummer @SecBro1

Tushar Dalvi: http://www.linkedin.com/in/tdalvi @TusharDalvi

R.I.P Reggie Destin

