API-Induced SSRF
How Apple Pay Scattered Vulnerabilities Across the Web

Intro
About me  Math degree  Web developer, ~5 years  Bounties  At PKC ~1 year, web dev and code
audits for clients - pkc.io

Intro
Overview  Definitions  Demo some mistakes
 Apple Pay  Twilio  Others  How not to be like Apple

Typical Class Breaks
See Schneier's blog post

Weak Code (e.g. Heartbleed)

Diagram of Inductive Weaknesses

Vulnerable

Vulnerable

...

Deployment Deployment

???

Weak Code Weak Code

...

Diagram of

Inductive

Weaknesses

Vulnerable

Vulnerable

...

Deployment Deployment

Inductive Weakness

Weak Code Weak Code

...

Diagram of

Inductive

Weaknesses

Vulnerable

Vulnerable

...

Deployment Deployment

Inductive weakness:
A design flaw that encourages multiple parties to write vulnerable code with a similar exploit pattern across differing software stacks.

Image

Definitions

SSRF Refresher

Payload with http://169.254.169.254/foo

Definitions: SSRF

169.254.169.254

Payload with http://169.254.169.254/foo

Definitions: SSRF

GET /foo

169.254.169.254

sensitive data

Definitions: SSRF

Payload with http://169.254.169.254/foo

sensitive data

GET /foo

169.254.169.254

Definitions: SSRF
If you can relay requests through a GCP or AWS box...

Definitions: SSRF
Easy things to do with SSRF  AWS, GCP have a gooey center
 People have already criticized AWS/GCP for this
 file:/// urls  Reflected XSS
 Technically not SSRF

Definitions: SSRF
SSRF: Hard mode  Cross-protocol stuff
 SMTP through gopher:// URLs  HTTP->memcached->RCE
 See A New Era of SSRF  ???

Apple Pay Web
Inductive SSRF

Apple Pay: 3 forms

Apple Pay

In-store

In-app

Web

In-store

criticising this

Apple Pay

In-app

Web

these are unaffected

The intended flow
 Safari generates a validationURL (https://apple-pay-gateway-*.apple.com)

Apple Pay

The intended flow
 Safari generates a validationURL (https://apple-pay-gateway-*.apple.com)
 Your JS sends validationURL to your backend

Apple Pay

The intended flow
 Safari generates a validationURL (https://apple-pay-gateway-*.apple.com)
 Your JS sends validationURL to your backend
 Your backend grabs a session from validationURL and forwards it to the client

Apple Pay

session
validationURL
https://apple-pay-gateway.apple.com /paymentservices/paymentSession

Apple Pay
merchant
session

apple-pay-gateway.apple.com

sensitive data

Apple Pay

validationURL
https://169.254.169.254/foo

sensitive data

GET /foo

169.254.169.254

Demos

Apple Pay
appr-wrapper  Under GoogleChromeLabs on github  Written, deployed by an @google.com
account  A sort of polyfill between Apple Pay and
the PaymentRequest API  A test deployment, so low severity target

webkit.org
 Maintained by Apple  Another demo, but on a
higher-severity target

Apple Pay

Just added
this

Apple's response

Apple Pay

Diagram of Apple Pay, like the SSRF one

Apple Pay
Disclosure timeline  Feb 11, Initial email to Apple  March 26, Apple updated docs  May 14, Apple concluded investigation. I
replied with follow-up questions.  ... Then Apple ghosted for 2 months :(

One mitigation...

Apple Pay

Diagram of Apple Pay, like the SSRF one

General mitigations

Apple Pay

Apple Pay
 Check vaDliaigdraamtiofoAnpUpRleLPaayg, alikine sthteApple's list  Stripe and BraintSrSeReF honaendle this flow, so
you're safe if you use them

General mitigations

Apple Pay

SSRF in general  Whitelist egress traffic  Protect yDoiuagrrammeotfaAdpaplteaPlaiyk, elikNe tehteflix:
Detecting CredenStSiRaFl oCnoempromise in AWS  Be mindful of local, unauthenticated stuff
on servers

Ineffective mitigations

Apple Pay

Do not:  Use a regex to validate the domain
 Sometimes people try a regex like https?:D/ia/gr.a*m.oafpApppllee .Pacyo, lmik/e.t*he
 But that matcheSSsR:F one http://localhost/?.apple.com/...
 Rely on HTTPS to prevent cross-protocol
attacks  See slide 16 of A New Era of SSRF

Webhooks

Previous webhook exploits

Webhooks

Payload would go here  http://169.254.169.254  gopher://localhost:11211/...

Most attack this
Webhook sender

Listener

Listener

...

Diagram of

Inductive

Weaknesses

I'm after these

How Twilio Authenticates Webhooks

Webhooks

 HMAC and hope the listener checks it  Lots of webhooks do this, Twilio's not
unique

The problem
 Who failed to check the HMAC?  23 out of 31 open-source projects

Webhooks

The problem
 Who failed to check the HMAC?  23 out of 31 open-source projects  Most of Twilio's example code

Webhooks

The problem

Webhooks

 Who failed to check the HMAC?  23 out of 31 open-source projects  Most of Twilio's example code
 Contributing factors  Bad documentation  The easiest receiver implementation is a vulnerability

Demo: Webhooks

Twilio Example Code
 Examples themselves not deployed publicly
 But, did find vulns where it was copied/pasted

Apple Pay

Webhooks
Disclosure timeline  Feb 17, Initial email to Twilio  March 6, Twilio updated some of the docs
 Rejected all architectural changes due to "unforeseen issues"

What about nexmo?

Webhooks

Source

What about nexmo?

Webhooks

Source

Gitlab webhooks: the happy path
{ "object_kind": "push", "commits": [{ "message": "Initial commit of foo project", "url": "https://...", ... }], "repository": { "url": "git@your.git.url/something.git", ... }, ...
}

Webhooks

Webhooks
What did I do?  Found a server that was receiving gitlab
webhooks  On the open internet  Was the trigger of build pipelines for multiple
tenants...

Gitlab webhooks: what I did

Webhooks

{

"object_kind": "push",

"commits": [{

"message": "Initial commit of foo project",

"url": "https://...",

...

}],

Put the tenant's gitlab url here

"repository": {

"url": "git@your.git.url/something.git", ...

}, ...

}

Gitlab webhooks: what I did

Webhooks

{

"object_kind": "push",

"commits": [{

"message": "Click here to do something! :D",

"url": "javascript:alert('XSS on: ' + window.origin);",

...

}],

"repository": {

"url": "git@your.git.url/something.git", ...

}, ...

}

Webhooks
What are some better ways to send webhooks?  For crypto nerds: authenticated cipher
 E.g. AES-GCM  Still symmetrical like an HMAC  Forces webhook consumers to decrypt, so
they'll accidentally verify the GCM tag you send them

Webhooks
What are some better ways to send webhooks?  More practical: only send high-entropy,
cryptographically random event IDs  Webhook consumer has to fetch
/items/?id=<id> with their API token  Plaid does roughly this

Webhooks
What are some better ways to send webhooks?  For existing webhooks: test & warn
 During registration, do 2 test requests:  1 valid MAC  1 invalid MAC
 Warn if they get the same response code

What else?

Salesforce Objects vs Dynamodb
Both:  NoSQL-like object storage  REST APIs with custom SQL-like
queries

Salesforce SOQL /?q=SELECT+id+from+Foo+WHERE+name+LIKE+'...'
Inject here

Salesforce SOQL
Source

Dynamodb: Better

POST / HTTP/1.1 {

Enforced Parametrization

"TableName": "ProductCatalog",

"KeyConditionExpression": "Price <= :p",

"ExpressionAttributeValues": {

":p": {"N": "500"},

},

}

Closing Thoughts

Apple Pay
From Apple after two months of silence "Developers are responsible for implementing whatever security and networking best practices make the most sense for their environment."

Closing Thoughts
"If you've built a chaos factory, you can't dodge responsibility for the chaos."
Tim Cook, Apple CEO
Source

Closing Thoughts
Financial  Low-hanging bounty fruit  Embarrassment  High-interest tech debt

Closing Thoughts
Designing defensive APIs  Audit your example code  Be careful about passing around URLs  If "Do this or you're vulnerable!" is in your
documentation, try to make the warning unnecessary

Takeaways

Closing Thoughts

 You can find a lot of vulnerabilities by looking at an API, finding a flaw, and seeing who integrates with it.
 We need to place more scrutiny on security weaknesses that induce others to write vulnerable code.
 While there has been a lot of recent work on SSRF, the software development world has a long way to go in defensively coding around URLs.

Closing Thoughts
Acknowledgments  Jonathan Ming at PKC - asked the initial
questions about Apple Pay  Arte Ebrahimi at PKC - pointed me to the Nexmo
stuff  Ken Kantzer at PKC - helped with the
presentation  Andrew Crocker at EFF - legal assistance

www.pkc.io

Thank you!

