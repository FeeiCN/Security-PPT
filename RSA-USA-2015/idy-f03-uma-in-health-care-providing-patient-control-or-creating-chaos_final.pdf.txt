SESSION ID: IDY-F03
UMA in Health Care: Providing Patient Control or Creating Chaos?

David Staggs JD, CISSP
Technologist / IP Attorney Staggs PLLC

#RSAC

#RSAC
UMA Value Proposition
 User Managed Access (UMA) brings granular control to the health care ecosystem
 scalable, secure, and provides uninterruptible consent  patient control encourages trust and participation  extends electronic workflow:
 reduces paper  simplifies audit and compliance  multi-use workflows possible
2

#RSAC
Making Possible Real
 unlock access to electronic health records (EHR) and personal health records (PHR)
 develop an ecosystem that opens entrepreneurial opportunities and accelerates progress
 establish publicly available APIs to the software ecosystem and share vast stores of data
 the solution must respect individuals' privacy and guard against data breaches
3

#RSAC
The Future is RESTful
 RESTful Health Exchange (RHEx)  links to specific EHR data ­ not just moving entire record  allows app providers to address small practices  adds capabilities that are missing in secure email  uses OAuth 2 and OpenID Connect (OIDC) profiles
4

#RSAC
The Future is SMART
 Substitutable Medical Applications Reusable Technologies  opens up the EMR system silo  open-source, developer-friendly API  gives application ecosystem access to data
 encourages innovation
 uses OAuth 2 and OpenID Connect (OIDC) profiles
5

#RSAC
The Future is on FHIR
 Fast Healthcare Interoperability Resources  data formats and elements with an API for exchanging EHR  uses an HTTP-based RESTful protocol  uses OAuth 2 for authentication to APIs  adopted by RHEx and SMART  supported by Health Level Seven (HL7)
6

#RSAC
OAuth 2 Authorization (Real Time) Code Grant

Resource Owner

B
UserAgent

Client ID and Redirection URI User Authentication Authorization Code

AC Client

Authorization Code & Redirection URI OAuth Access Token

AuthZ Server

7

#RSAC
OAuth 2 Framework
 replaces the anti-password pattern  resource owner OKs token for client's access  HTTP-based RESTful protocol  includes scopes / TTL that manage access rights  permits service chaining (token that can be passed)  Privacy by Design (PbD)
8

#RSAC
Security and Privacy
 Protected Health Information (PHI) and HIPAA  patients should have control over their PHI  need an extension to OAuth 2 / OIDC profiles
 use OAuth to protect APIs and OIDC to get credentials  enforce patient's consent directives, even when the patient is not
available (uninterrupted consent)
 User Managed Access (UMA) provides a solution
9

Introduction to UMA
manage

RPT

Resource Server
Protected Resource

protect
PAT ATT
access
10

Protection API

#RSAC

Resource Owner
control

AuthZ Server

AuthZ API

authorize

Client

Requesting Party

#RSAC
UMA OAuth Tokens
 Authorization API (AAT)
 authorization server, requesting party, and client
 Request API (RPT)
 requesting party, client, resource server, and authorization server (not resource owner)
 Protection API (PAT)
 resource server, authorization server, and resource owner
 resource owner (e.g. patient) sets access policy and scope
11

#RSAC
UMA Spiral Slide
12

#RSAC
UMA's Chaotic Potential
 if patients pick their resource servers (personal cloud) how do they keep track of where everything is?
 will health care providers allow you to use any authorization server to control access to records they create?
 will treatment by multiple providers cause conflicts on which authorizations server is used to control?
 provider/custodian A requires using only authorization server X  provider/custodian B requires using only authorization server Y
13

UMA Health Ecosystem Deep Dive

Patient
Resource Owner

Custodian

Authorization Server

ACS

Protection Client

Protection API

GUI

Authorization API

PAT Received
Reg. Resources and Scopes

(one time) Acquire Protection Access Token (PAT)

Set Resource Authorization Policy

Doctor

ACS

Authorization Client

Verify Token, Invoke Privacy Protective Service

Request for Data

Redirect to Authorization Server

(one time) Acquire Authorization API Token (AAT)
Request Requesting Party Token (RPT)
Receive RPT

Request for Data with Authorization Token Return Data

14

#RSAC

#RSAC
Scopes
 scopes provide finer grained control  scopes have the following:
 name of the resource that can be displayed to owner  human-readable string describing some extent of access
 for example, scope involving reading or viewing resources:
{ "name" : "View", "icon_uri" : "http://www.example.com/icons/reading-glasses" }
15

#RSAC
Scope Description Documents
 scope description documents have the following:
 name, type, scopes, icon_uri
{ "name" : "Photo Album", "icon_uri" : "http://www.example.com/icons/flower.png", "scopes" : [ "http://photoz.example.com/dev/scopes/view", "http://photoz.example.com/dev/scopes/all" ], "type" : "http://www.example.com/rsets/photoalbum" }
16

#RSAC
More Potential Chaos
 token introspection by resource server at authorization server
 need to understand semantics of the token
 OpenID OAuth profile
 ID Token ­ a signed and optionally encrypted JWT containing identity and attribute claims about the user
 UserInfo Endpoint ­ a protected resource where the relying party can request additional claims about the user
 OAuth scopes are used to request individual user attributes
17

#RSAC
Can We Just Get Along
 health records in a personal cloud spread across resource servers should have uniform scope syntax
 authorization servers' scope description documents
 simplify resource set registration mechanism  prevent scope names from revealing PHI  is a pointer to standard scope descriptions politically possible?
 consider HEART (Health Relationship Trust)
18

#RSAC
OpenID HEART
 health-related profiles layering: OAuth 2.0, OpenID Connect, FHIR, OAuth 2.0 scopes, and UMA
 HEART WG is defining use cases and requirements  expect an implementation guide soon  demonstration of current capabilities
 Eve Maler, ForgeRock, HEART WG Co-Chair
Demo
19

#RSAC
Apply Slide
 identify your use cases requiring uninterrupted consent  use HEART open source code for a test bed  mitigate token vulnerabilities
 audience parameter, state parameter, signed JWTs, redirection URIs
 identify what resources need protection and define terminology  identify your role in the ecosystem
 patient UX, authorization server, EHR custodian, OpenID claims provider, organization offering standard scope descriptions
20

