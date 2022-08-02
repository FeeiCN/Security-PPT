QUALYS SECURITY CONFERENCE 2019
Moving Security up the Stack: Web Application and API Security
Dave Ferguson Director of Product Management, Qualys, Inc.

Agenda
Recent trends in Application Security Web Application Scanning (WAS) Qualys Periscope Building Securing APIs

2

Qualys Security Conference

24 November 2019

Trends in Application Security

Web app breaches continue E-commerce sites targeted API attacks Trends in AppSec testing
Shifting left Coverage Automation

3

Qualys Security Conference

November 20-21, 2019

Source: 2019 Verizon DBIR

Web Application Scanning

WAS Overview
Detects application-layer vulnerabilities in web apps & APIs Browser engine Automated crawling Play back of Selenium scripts API to integrate with other systems Unique integration with Qualys WAF Mature product

5

Qualys Security Conference

November 20-21, 2019

2019 Highlights
Custom scan intensity WAS Jenkins plugin v2 Updated Qualys Browser Recorder TLS 1.3 Full HTTP requests Enhanced crawling Postman Collections WAS Burp extension v2

6

Qualys Security Conference

November 20-21, 2019

WAS Roadmap

2019 202 0

Q1 *
Beta of new dashboard
OpenAPI v3 support Bamboo plugin

December

Out-of-band vulnerability detections ("Periscope")

Configurable QID

severity

7

Qualys Security Conference

November 20-21, 2019

Q2 *
App discovery / catalog enhancements
Subresource integrity (SRI) Exclude certain HTTP verbs

* Tentative

Out-of-Band Vulnerabilities
Some issues can't be detected by traditional request-response e.g.
SSRF SMTP header injection Blind XXE injection

Detecting these vulnerabilities requires a different approach

8

Qualys Security Conference

November 20-21, 2019

Source: OWASP

Introducing Periscope
Detection mechanism for out-of-band web app vulnerabilities
Scanner sends a test; POST request body is:
p1=joe&p2=smith&p3=http%3A%2F%2Fe528efddaa51766cb86afb19f22de54b6da1093c.1454156_35626.2086421852.ssrf01. ssrf.qualysperiscope.com
The web app tries to resolve this FQDN:
e528efddaa51766cb86afb19f22de54b6da1093c.1454156_35626.2086421852.ssrf01.ssrf.qualysperiscope.com

9

Qualys Security Conference

November 20-21, 2019

Qualys Periscope

10

Qualys Security Conference

November 20-21, 2019

Building Secure APIs

OWASP API Security

Top 10 (RC)

1

2

3

4

5

6

7

8

9

10

Broken Object Level Authorization (BOLA) Broken Authentication Excessive Data Exposure Lack of Resources & Rate Limiting Broken Function Level Authorization Mass Assignment Security Misconfiguration Injection Improver Assets Management Insufficient Logging & Monitoring

12

Example API ­ Pet Store

Relevant portion of the Swagger File

{ "swagger": "2.0", "info": {
"version": "1.0", "title": "Petstore",
}, "host": "api.petstore.com", "basePath": "/v1",
"schemes": [ "http", "https"
], "paths": {
"/pet/{petId}": {
"get": { "summary": "Get info for a specific pet",
"operationId": "showPetById", "parameters": [
{
"name": "petId", "in": "path",
"required": true, "description": "The ID of the pet to retrieve", "type": "integer"
} ], "responses": {
"200": { "description": "Expected successful response",
"schema": { "$ref": "#/definitions/Pet"
}
...snip...

How Does this Help with Security?

We can leverage the Swagger spec to harden the API endpoints in a declarative way

"paths": { "/pet/{petId}": { "get": { "summary": "Get info for a specific pet", "operationId": "showPetById", "parameters": [ { "name": "petId", "in": "path", "required": true, "description": "The ID of the pet", "type": "integer" } ],

"paths": { "/pet/{petId}": { "get": { "summary": "Get info for a specific pet", "operationId": "showPetById", "parameters": [ { "name": "petId", "in": "path", "required": true, "description": "The ID of the pet", "type": "integer", "minimum": 1, "maximum": 999999 } ],

Capabilities Coming to Qualys API Security
Static Assessment of Swagger/OpenAPI file
Get recommended changes to harden your API
Conformance Scan to check the API's actual behavior
Test the API endpoints for behavior that violates the Swagger file
Vulnerability Scan to check the API for security flaws
Current feature in Qualys Web Application Scanning (WAS)

QUALYS SECURITY CONFERENCE 2019
Thank You
Dave Ferguson dferguson@qualys.com

