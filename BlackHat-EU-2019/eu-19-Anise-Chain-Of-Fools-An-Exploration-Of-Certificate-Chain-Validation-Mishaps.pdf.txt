Chain of Fools
An Exploration of Certificate Chain Validation Mishaps
Olabode Anise, James Barclay, Nick Mooney

Overview
 X.509 Certificates and Certification Path Validation
 Overview of X.509 certificates and certificate chain validation  When do developers have to worry about certificate chain validation?  pyOpenSSL and the X509Store  Doing the right thing with a non-obvious API  Bad advice on the internet  Misuse resistance
 SafetyNet Overview  Quantifying the Use of SafetyNet  Tooling
 Forging SafetyNet attestations

X.509 Certificate Chains
A refresher

Certificate: Data: Version: 3 (0x2) Serial Number: 04:00:00:00:00:01:15:4b:5a:c3:94 Signature Algorithm: sha1WithRSAEncryption Issuer: C=BE, O=GlobalSign nv-sa, OU=Root
CA, CN=GlobalSign Root CA Validity Not Before: Sep 1 12:00:00 1998 GMT Not After : Jan 28 12:00:00 2028 GMT Subject: C=BE, O=GlobalSign nv-sa, OU=Root
CA, CN=GlobalSign Root CA Subject Public Key Info: Public Key Algorithm: rsaEncryption Public-Key: (2048 bit) Modulus: ...

Components of an X.509 Certificate
 A public key
 Fundamentally, a certificate is an identity associated with a key pair, where other parties can make claims about that identity
 Metadata such as subject name, SANs (valid domain names in the TLS context), organization info
 Issuer info (when not self-signed)

The Chain of Trust
 Root CAs
 Shipped with the operating system, sometimes the browser  Explicitly trusted  Used to sign other certificates, usually intermediate CA certificates
 Intermediate CAs
 Not globally trusted, but part of a chain leading to a root CA
 Leaf certificates
 The end of the chain  Identifying a particular key pair
 Ex (SafetyNet): a key pair that is used to sign a SafetyNet attestation

Validating a Certificate Chain
 The root CA must be self-signed and explicitly trusted  The root CA must have signed the next intermediate in the chain, if one exists  That intermediate must have signed the next...  The last intermediate must have signed the client leaf
We also have to worry about:
 Making sure the leaf CA legitimately describes the service
 CN, SAN validation
 Making sure the intermediates are allowed to issue chains of n length  Expiration and validity

Validating a Certificate Chain
(a) for all x in {1, ..., n-1}, the subject of certificate x is the issuer of certificate x+1;
(b) certificate 1 is issued by the trust anchor;
(c) certificate n is the certificate to be validated (i.e., the target certificate); and
(d) for all x in {1, ..., n}, the certificate was valid at the time in question.

When should developers have to worry about validating certificate chains?

Probably never.

When might developers actually have to worry about validating certificate chains?
SafetyNet, Android Protected Confirmations, WebAuthn

SafetyNet Overview

What is SafetyNet?
A refresher

"SafetyNet provides a set of services and APIs that help protect your [Android] app against security threats, including device tampering, bad URLs, potentially harmful apps, and fake users."
- Protect against security threats with SafetyNet

SafetyNet APIs
1. SafetyNet Attestation API 2. SafetyNet Safe Browsing API 3. SafetyNet reCAPTCHA API 4. SafetyNet Verify Apps API

SafetyNet APIs
1. SafetyNet Attestation API 2. SafetyNet Safe Browsing API 3. SafetyNet reCAPTCHA API 4. SafetyNet Verify Apps API

SafetyNet Attestation API
"The SafetyNet Attestation API is an anti-abuse API that allows app developers to assess the Android device their app is running on. The API should be used as a part of your abuse detection system to help determine whether your servers are interacting with your genuine app running on a genuine Android device.
The SafetyNet Attestation API provides a cryptographically-signed attestation, assessing the device's integrity..."
SafetyNet Attestation API

How the SafetyNet Attestation API Works
1. Server requests attestation from mobile device 2. Mobile device does some health checks, produces a signed blob 3. Mobile device provides signed (JWS) blob along with intermediate certificates 4. Server checks payload and validates signature and certificate chain

JSON Web Signatures (JWS)
A refresher

JSON Web Signatures (JWS)
 Part of the JavaScript Object Signing and Encryption (JOSE) framework.
"JSON Web Signature (JWS) represents content secured with digital signatures or Message Authentication Codes (MACs) using JSON-based data structures." JSON Web Signature (JWS) ­ RFC 7515

JSON Web Signatures (JWS)
 A JWS is a named tuple consisting of three logical values  JOSE Header  JWS Payload  JWS Signature
 Two serialization formats are supported  JWS JSON Serialization  JWS Compact Serialization

JWS Compact Serialization
BASE64URL(UTF8(JWS Protected Header)) || '.' || BASE64URL(JWS Payload) || '.' || BASE64URL(JWS Signature)

eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9 . eyJwYXlsb2FkIjoiVGhpcyBpcyBteSBtZXNzYWdlLiJ9 . bqHXSzhjW6Gcp_CkONR7qLVvJy-D42mfo3NHsC7hiI0
{ "typ": "JWT", "alg": "HS256"
}

eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9 . eyJwYXlsb2FkIjoiVGhpcyBpcyBteSBtZXNzYWdlLiJ9 . bqHXSzhjW6Gcp_CkONR7qLVvJy-D42mfo3NHsC7hiI0
{ "payload": "This is my message."
}

eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9 . eyJwYXlsb2FkIjoiVGhpcyBpcyBteSBtZXNzYWdlLiJ9 . bqHXSzhjW6Gcp_CkONR7qLVvJy-D42mfo3NHsC7hiI0
signature

SafetyNet JWS Usage
How Android SafetyNet uses JSON Web Signatures.

A SafetyNet attestation includes the X.509 certificate chain in the JWS header.

SafetyNet JWS Payload
{ "nonce": "Yv4fvzUuGIZXJ4LBOjK1dJvT568=", "timestampMs": 1557869580251, "apkPackageName": "com.mooney.safetynetexploration", "apkDigestSha256": "OdOsbsUpV9ipmUoOaRCSsWXjKIQYeAqzMUC9q9dXdEk=", "ctsProfileMatch": true, "apkCertificateDigestSha256": ["18P5sFPk81RAKOfL++mIXI2 sAmZ+xRu/cgqLzvdmx0A="], "basicIntegrity": true
}

pyOpenSSL and the X509Store
An observation, and the genesis of our research.

pyOpenSSL
 Part of the Python Cryptographic Authority, along with other great projects like cryptography.
 Thin wrapper around a subset of the OpenSSL library.  Note: The Python Cryptographic Authority recommends not using pyOpenSSL
for anything other than making TLS connections.

pyOpenSSL and the X509Store Class
 X509Store
 "An X.509 store is used to describe a context in which to verify a certificate. A description of a context may include a set of certificates to trust, a set of certificate revocation lists, verification flags and more."
 X509StoreContext
 "An X.509 store context is used to carry out the actual verification process of a certificate in a described
context."

Verifying Certificate Chains With Python
 A cursory glance for how to verify certificate chains with Python will likely result in something like this:
root_cert = load_certificate(FILETYPE_PEM, root_cert_pem) intermediate_cert = load_certificate(FILETYPE_PEM, intermediate_cert_pem) leaf_cert = load_certificate(FILETYPE_PEM, leaf_cert_pem)
store = X509Store() store.add_cert(root_cert) store.add_cert(intermediate_cert) store_ctx = X509StoreContext(store, leaf_cert)
print(store_ctx.verify_certificate())

This pattern treats any intermediate certs as a trusted roots.

Assumptions About Certificate Chain Validation

signs

signs

Root

Intermediate(s)

Leaf

But What If?

signs

signs

Root

Intermediate(s)

Leaf

If controlled by adversary

How Developers Think It's Working

signs

signs

Root

Intermediate(s)

X509Store

Leaf

Success!

How Developers Think It's Working

signs

Root

Rogue self-signed CA

X509Store

Rogue leaf

Failure!

How It Will Actually Work

signs

signs

Root

Intermediate(s)

X509Store

Leaf

Success!

How It Will Actually Work
Controllable by adversary
signs

Root

Rogue root CA

X509Store

Rogue leaf

Success!

There is still no good way to do this.

We also made this same mistake. Fortunately, we caught it in development. Not everyone is so lucky.

pyOpenSSL PR #473
 We remembered a colleague of ours, Adam Goodman, talking about this apparent limitation in the pyOpenSSL API, so we checked with him.
 Adam opened a PR on the pyOpenSSL GitHub repository to add untrusted certificate chain support to X509StoreContext.
 This was in June of 2016.  This is not for lack of caring by the project maintainers, it's just a sensitive change in a
cryptographic library, and not many people are qualified to review it.  This is a good reason.
 We ended up just using his fork in our code.

The right way to do things
...with a non-obvious API.

Doing the Right Thing With a Non-obvious API
 Adam also pointed out to us that he's seen an example of how to use pyOpenSSL to correctly validate a certificate chain.
 This was in a test in the letsencrypt/boulder project.  The way they accomplished this is not obvious, and would require an understanding of the
limitations of this API.  Also, this is the only place we've seen the API being used correctly, (so far).

Doing the Right Thing With a Non-obvious API
store = OpenSSL.crypto.X509Store() store.add_cert(parsed_root)
# Check the chain certificate before adding it to the store. store_ctx = OpenSSL.crypto.X509StoreContext(store, parsed_chain) store_ctx.verify_certificate() store.add_cert(parsed_chain)
# Now check the end-entity certificate. store_ctx = OpenSSL.crypto.X509StoreContext(store, parsed_cert) store_ctx.verify_certificate()

Avoid making developers do this themselves.

What do we need to take into consideration?
 Correct path building  Name validation (CN matching, etc.)
 Null byte vulnerability
 Basic Constraints
 IsCA, path length
 Usage Flags  Revocation  Permitted hash, signature algorithms

Some purpose-built software
 Web browsers are great at this!  For Python: certvalidator  For more specific tasks (JWS validation), use libraries like Google's jws
 Built with specific features disabled, such as explicitly-provided x5c chains

More bad advice on the internet

Part of the Intel "Security Libraries for Data Center"

Misuse Resistance
Primitives and APIs

 Misuse resistant primitives  Misuse resistant APIs  Well-supported libraries and
good documentation

Primitives
 Deterministic signature schemes
 EdDSA vs ECDSA (avoiding the PS3 problem)
 AES-GCM-SIV
 "Occasional nonce duplication tolerant" per Adam Langley

APIs / Libraries
 libsodium
 Important to note that the primitives can still fail spectacularly with nonce reuse
 Tony Arcieri's Miscreant
 Implementation of primitives where the primitives themselves are designed with misuse resistance in mind
 Tink  Noise framework  General high level OS libraries
 If your goal is "make a TLS connection," it is likely that most questions related to certificate chains will be automatically answered for you

Quantifying the Use of SafetyNet
Analyzing Thousands of Apps

Amassing a list of Android Apps
 There are a lot of freemium sites that perform app store analytics, but unfortunately those sources don't allow for easy reproducibility or scale
 We opted to use AndroidRank, which provides similar data for free  Their website provided us the most popular apps for 32 general application
categories and 17 gaming categories  Our entire list was composed of 24,296 applications

Building a Corpus of Applications
 Downloading ~24k apps from the Google Play Store directly wasn't feasible
 We opted to use two Play Store mirroring sites: apkmonk and APKMirror
 Using these sources, we were able to download APKs for 98% of the apps we found on AndroidRank

Analyzing Apps - Overview
 Android Package (APK) is the package format for Android apps
 APKs  Zip files  These files contain the resources, assets
and compiled versions of the source code and libraries
Diagram of APK file structure

Analyzing Apks - Properties files
 Properties file contain configuration information for apps
 In the case of the SafetyNet API, it details the version that the app is using

Analyzing Apks - Manifest file
 Required in every Android app  Provides a lot of the crucial information
concerning apps:
 Activities, content providers, permissions the app requests, hardware/software the app requires, etc.
 It also may include SafetyNet API keys
 com.google.android.safetynet.ATTEST_API_KEY  com.google.android.safetynet.API_KEY

Analyzing APKs - classes.dex
 classes.dex is a Dalvik Executable file that contains the compiled application code
 This includes both original source code and other libraries
 By analyzing the string IDs, method IDs, and class definitions, we can find use of the SafetyNet APIs

Results from Initial Approach

Application Category Finance Comics Dating Shopping Gaming

Percent using a SafetyNet API 18.52 12.63 11.00 9.85 5.23

Limitations with Initial Approach
 Any type of regex is going to be brittle and will potentially bring about a lot of false negatives
 Searching for strings just doesn't work when code is obfuscated, as some source code is
 All results are biased towards files that store API authentication and configuration information in manifest files or property files

From String to Static Analysis
 Because of the limitations of string analysis, we decided to use a third-party library analysis tool: LibScout
 LibScout works by extracting profiles from an original library and applying a matching algorithm to check how much the two match
 The resulting output is a similarity score that is between 0 and 1

Results from LibScout
 Using LibScout, we found that 7.1% of apps were using at least one of the SafetyNet APIs
 Applications in the Gaming category used SafetyNet the most at 11.3%  The majority (87%) of Android Apps that we analyzed were using an older
version of the SafetyNet API

General Limitations
 The corpus of Android apps that we collected is different from the study run in 2017
 Our list of apps is not a random sample of Android applications, so it's difficult to generalize our results

Some tooling

 SafetyNet Android example  Flask SafetyNet server  MITM tools

Forging SafetyNet Attestations

Forging SafetyNet Attestations
 We can do this by
 Modifying in-flight JWS to inject our own rogue CA certificate and leaf into the JOSE Header  x5c parameter
 Transform JWS payload to set basicIntegrity and ctsProfileMatch to true  Or false, if we want to make SafetyNet checks fail when they shouldn't!
 Re-sign the payload with our rogue certificate private key, then swap out the JWS signature

Android SafetyNet Example

Flask SafetyNet Server

MITM Tools
 rogue_ca.py
 Helper utilities for generating self-signed certificates and signing payloads, generating cert chains
 jwsmodify.py
 Modify in-flight JWS requests  Apply a transformation function to JWS payload contents  Automatically re-sign and modify X.509 chain
 jwsmodify_mitmproxy_addon.py
 mitmproxy Addon for jwsmodify

Demo

Conclusion

Conclusion
 Ideally, developers shouldn't have to worry about cryptographic implementation details like validating certificate chains. Frameworks and vendor tooling should abstract as much of this away as possible.
 If you do, choose misuse-resistant primitives and/or APIs.
 It's relatively easy to take advantage of incorrect certificate chain validation logic.
 Forging SafetyNet Attestations is just one example. Other examples include Android Protected Confirmation and WebAuthn attestation.
 Android SafetyNet usage is steadily increasing, with Gaming and Finance being the biggest adopters.
 Certificate chain validation is hard to get right!
 Try not to assign blame if someone gets this wrong. Let's work together to make things better!

Thank you!
@JustSayO @futureimperfect @wellhydrated

