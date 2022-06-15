Preventing Authentication Bypass
A Tale of Two Researchers
Terry Zhang, Tophant Ron Chan, Independent Researcher Ravi Jaiswal, Microsoft

Cast of characters
Terry Zhang, co-founder of Tophant and specialist in breaking identity, working independently of...
Ron Chan, an independent security researcher, who concurrently with Terry was investigating...
Outlook Web App, a mail service created by...
Microsoft, a technology company, represented here by...
Ravi Jaiswal, a principal engineering manager for Outlook Web App
2

Chapter 1 the first discovery
Some time before Sunday, March 24, 2019

A new UI option? Let's check it out.
4

Look at that!

· Intercepting the request using Burp Suite, I discovered a new API endpoint I'd never seen before.
POST /owa/service.svc?action=GetAccessTokenforResource&UA=0&n=14&EP=1&app=Mail HTTP/1.1 Host: outlook.office.com User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:65.0) Gecko/20100101 Firefox/65.0 Accept: */* Accept-Language: en-US,en;q=0.5 Accept-Encoding: gzip, deflate content-type: application/json; charset=utf-8 action: GetAccessTokenforResource x-owa-correlationid: 55c43e39-af14-f3ce-88d5-adcea46af253 x-owa-urlpostdata: {"__type":"TokenRequest:#Exchange","Resource":"https://outlook.office.com"}
5

An unsigned token?

· The endpoint had an action called GetAccessTokenForResource, and returned an unsigned JSON Web Token (JWT)
{"TokenResultCode":0,"AccessToken":"eyJhbGciOiJub25lIiwidHlwIjoiSldUI n0.eyJvaWQiOiIwYmQwMWY0Yi1iNjBiLTRlODYtOWMzNi01YzE3MzExYTlh NzkiLCJwdWlkIjoiMTAwMzIwMDA0MTgzRjYzQSIsInNtdHAiOiJhdHRhY2tlc kB0b3BoYW50Lm9ubWljcm9zb2Z0LmNvbSIsInVwbiI6ImF0dGFja2VyQHR vcGhhbnQub25taWNyb3NvZnQuY29tIiwic2NwIjoiZnVsbF9hY2Nlc3NfYXN fZXhjaGFuZ2UgRFdF.........................5mMy0zYVFYNlJBIiwidGlkIjoiMDAtM DAwMDAwMDAwMDAwQDI5NzNjZDU3LTIzN2MtNGRiYy04NTI3LTM2NG ZkNmY4MTQzNiIsImF1ZCI6Imh0dHBzOi8vb3V0bG9vay5vZmZpY2UuY29tI n0.","AccessTokenExpiry":"2019-03-24T04:13:55.183Z","ExpiresIn":890}

6

Yes--it's unsigned.
"oid":"0bd01f4b-b60b-4e86-9c36-5c17311a9a79"
7

This didn't look like much.
But then I tried it out in the Outlook REST API.
8

Normally, you'd need a user's authorization to get a JWT.
9

And the JWT you get is signed and has a different data structure.

Unsigned token

Signed token
10

But let's give it a try.

"oid":"0bd01f4b-b60b-4e86-9c36-5c17311a9a79"

Sure enough, Outlook server-side consumes the unsigned token and returns the user's profile.
11

Let's look at key details of the token.

Item

Description

Value

oid smtp scp

userid within current O365 tenant 0bd01f4b-b60b-4e86-9c36-5c17311a9a79

user's o365 email address

attacker@tophant.onmicrosoft.com

I can specify any OID within the same tenant and retrieve that user's profile!

Full permission scope granted

full_access_as_exchange DWEngine-Internal.Read Locations-Internal.ReadWrite SubstrateSearch-Internal.ReadWrite TailoredExperiences-Internal.ReadWrite MailboxSettings.ReadWrite Todo-Internal.ReadWrite Notes.ReadWrite NotesInternal.ReadWrite Premium-Internal.ReadWrite Mail.ReadWrite Calendars.ReadWrite"

Actor token Another (signed) JWT token, contains the tenant ID

tid

current o365 tenant ID

eyJhbGciOiJSUzI1NiIsImtpZCI6IjA2MDBGOUY2NzQ2MjA3MzdFNzM0MDRFMjg3QzQ1QTgxO

ENCN0NFQjgiLCJ4NXQiOiJCZ0Q1OW5SaUJ6Zm5OQVRpaDhSYWdZeTN6cmciLCJ0eXAiOiJKV1

QifQ.

But I can only do this on the same

_XBXXnCi4hDXtRej_nnanntot8.lzTpFhMecwacOtGoNrDt_oJ8kme3nAYc3oFTnKtMaAinGOsstZhinegHBd9gVv0KDAfYamGZ_AN4 PGX7LhkhU9BV0XRh9jvS51UIkkASJOPZzchqYhVsSdgmOQWZHPhmtfDej6VnijDTaAiLn"ihtyIl_D6.SqOeRDQR8UhfLGc1WSf9iC8tlGqzdFiQT9rUi8j

2973cd57-237c-4dbc-8527-364fd6f81436

12

What about consumer Outlook?

· The consumer Outlook service is the same as enterprise, just running on different domains.
· Both services support GetAccessTokenforResource
· Interesting: all consumer mail services (Hotmail, Live, Outlook) have the same tenant ID.

POST /owa/service.svc?action=GetAccessTokenforResource&UA=0&n=11&EP=1&ap p=Mail HTTP/1.1 Host: outlook.live.com
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:65.0) Gecko/20100101 Firefox/65.0
Accept: */*
Accept-Language: en-US,enAccept-Encoding: gzip, deflate
;q=0.5
Referer: https://outlook.live.com/ x-req-source: Mail
content-type: application/json; charset=utf-8
action: GetAccessTokenforResource
x-owa-urlpostdata: %7B%22__type%22%3A%22TokenRequest%3A%23Exchange%22%2C%22Re source%22%3A%22https%3A%2F%2Foutlook.live.com%22%7D
Origin: https://outlook.live.com
Connection: close
Content-Length: 0

13

Demo time
14

The result

In comparing the unsigned JWT from two
personal accounts, I learn that the TID is
always the same.

Although I can't easily get the OID for another
personal account...

... I find I can substitute the email address to
impersonate any user in consumer cloud.

This looks like a good candidate for bounty!
secure@microsoft.com
15

Chapter 2 the second discovery
Some time before Thursday, April 4, 2019

I saw a retweet.
17

Let's try using Burp Suite on Outlook Web App.
I'd almost given up when I found the API, thanks to the JSON Web Token Attacker plugin
18

Just another JWT sending requests to an API endpoint.
19

Let's use that plugin to look more closely.
Nothing special in the header... The payload has R/W permissions-- nothing special...
Now we're getting somewhere.
20

What can we do with an unsigned JWT?

· Figure out what parameter the API uses to identify me
· Change that parameter to impersonate others
· Apply the JWT to as many endpoints as possible to see what we can do.

{"oid":"

","puid":"20031FFFBA1D0425","smtp":"

","upn":"

","ver":"Exchange.Callback.V2","appid":"00000002-0000-0ff1-ce00-

000000000000","deploymentid":"https://outlook.office365.com/","tid":"e3cf3c98-a978-465f-8254-

9d541eeea73c","acr":"1","appidacr":"0","scp":"OWA.AccessAsUser.All EWS.AccessAsUser.All

DWEngine-Internal.Read Locations-Internal.ReadWrite SubstrateSearch-Internal.ReadWrite

TailoredExperiences-Internal.ReadWrite MailboxSettings.ReadWrite Todo-Internal.ReadWrite

Notes.ReadWrite Notes-Internal.ReadWrite Premium-Internal.ReadWrite Mail.ReadWrite

Calendars.ReadWrite Signals.ReadWrite ConnectedAccount-Internal.ReadWrite

Connectors.ReadWrite.Shared User.Read Group.ReadWrite.All Calendars-Internal.ReadWrite

FocusedInbox-Internal.ReadWrite

User.ReadWrite","nbf":1563921787,"exp":1563922687,"iss":"https://outlook.office365.com/","aud":"

https://outlook.office.com"}

21

Next steps: RTFM to get the OID

Consulted the API documentation to learn how to find people relevant to me...

... then get their OID...

... and then get the messages in their mailbox.

22

The result

I can get an unsigned JWT.

I can get another person's OID

I can substitute that OID in the unsigned JWT and send it to
the mail service.

This allows me to retrieve their email.

This looks like a good candidate for bounty!
secure@microsoft.com
23

Chapter 3 the response
Beginning March 24, 2019

Sunday, March 24, 2019
· First report received, triaged, and cased for remediation
25

Thursday, April 4, 2019
· Second report received, triaged and cased.
· The Microsoft Security Response Center initiates a Software and Services Incident Response Plan (SSIRP) to coordinate response.
26

Saturday, April 6, 2019
The OWA team mitigates the vulnerability by shutting off the API path.
27

The mitigation
OWA Client
Search depended on the API, so the OWA team temporarily rerouted search to use a new path until the fix was ready.

Cookie auth
1. GetAccessToken 2. Return Token

OWA service endpoint
Token library

3. Call with Token

Outlook REST
endpoint

28

Wednesday, April 24, 2019
The OWA team finished rolling out a fix that prevented clients from being able to acquire the editable token.
29

The fix

OWA Client
As part of the fix the flow for Search was restored.

Cookie auth
1. GetAccessToken 3. Return Token

OWA service endpoint

2. Get Token

C

o n

Token

f i

Service

g

4. Call with Token

Outlook REST
endpoint

30

Wednesday, April 24, 2019
Thank you for your partnership!
32

The outcome

Researchers reported the
issue to Microsoft

Microsoft quickly
mitigated the issue to protect
customers

Comprehensive fix was rolled out shortly afterwards

The researchers received bounty
rewards

Customers were protected

33

Epilogue avoiding repeats and key learnings

Key learnings for
developers

· Continue promoting resource-scoped and one-time tokens
· Drive to end support for legacy token types
· Set security policies for token allocation

Key learnings for service providers

· Ready your incident response process · Review scenario security · Keep improving flow security · Partner with security community to find
flaws early

Key learnings for
researchers

· Change is an opportunity to find new attack surface
· Keep improving your toolbox
· Make sure to document and screenshot your work

Resources

Download Burp https://portswigger.net/
Suite

Read the

https://docs.microsoft.com/en-us/graph/outlook-mail-

Outlook Mail API concept-overview

Develop a security incident response plan
Follow Terry and Ron on Twitter

https://msrc-blog.microsoft.com/2019/06/25/inside-themsrc-customer-centric-incident-response/ (1st in a series)
@pnig0s and @ngalongc

38

Thank you!
Terry, Ron, and Ravi

