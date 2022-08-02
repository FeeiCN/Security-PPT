SESSION ID: PDAC-F03
Tales from the PSIRT: 10 Years of Bugs, Vulnerabilities, and CVEs

Jon Green
VP & Chief Security Technologist Aruba, a Hewlett Packard Enterprise company @jgreen1024

#RSAC

#RSAC
Agenda
Our clueless beginnings What's a PSIRT, exactly? Mismatched expectations Historical and not-so-historical examples Current challenges and future plans Q&A

#RSAC
Clueless Beginnings

#RSAC
"Just trying to help..."

#RSAC
Forgotten developer test, or backdoor?

#RSAC
What is a PSIRT?
Product Security Incident Response Team There's an ISO standard for that... Three primary tasks
­ Accepting incoming vulnerability reports ­ Communicating with vulnerability reporters ­ Publishing vulnerability advisories
Other possible tasks:
­ Replicating vulnerabilities ­ Managing bug bounty programs ­ Ensuring vulnerabilities don't languish

#RSAC
The other half of vulnerability management
What happens after the PSIRT takes a report?
Developers typically respond with:
(choose 3)
­ Silence... ­ "What does this mean?" ­ "I don't think this is possible in the real world" ­ "OK we'll take this in the next release (4
months away)" ­ "This bug is in CentOS. We'll have to wait for
Red Hat to fix it." ­ "Oh crap we have to fix this right away!"

#RSAC
A slightly different approach...
Combines PSIRT with security research team Overcomes challenge of PSIRT incident responders without deep technical knowledge Overall mission: Drive security learnings back into product organization. Prevent vulnerabilities.

#RSAC
Mismatched Expectations
1. Selective disclosure 2. "Are any of your products vulnerable to CVE-2018-12345?" 3. "Here's my vuln scan results... what does this mean?" 4. Outdated/vulnerable open-source software 5. The wannabe sysadmin 6. Banks and telcos...

Other Historical Examples

#RSAC
Aruba Controller Authentication Bypass (CVE-2014-7299)

#RSAC
Database Credential Compromise (CVE-2016-4401)
Error messages sometimes reveal WAY too much.

#RSAC
A Small Vulnerability Report from Google...

KRACK (CVE-2017-13077 through 13088)

#RSAC

Nightmare scenario for a Wi-Fi company: a flaw in the WPA2 standard KRACK was not that, but... Hundreds of vendors, millions of devices affected Coordinated disclosure required ICASI acted as coordinating body, with US-CERT ICASI prepared with NDAs for non-members Our main exposure: wpa_supplicant (open source)

#RSAC
Dealing with open source in supply chain
Open-source software is widely used in enterprise products
Vendors don't always understand which pieces they incorporate
(did they type `make' or `apt-get'?)
Ask for a manifest
Image credit: Terry Bernstein/Sonatype
https://blog.sonatype.com/2011/10/evaluate-open-source-components-before-use-open-source-development-tip-5/

#RSAC
Current Challenges, Future Directions for Aruba
Scaling Automating open-source vulnerability disclosure APIs Taking bug bounty program public Cloud, cloud, and more cloud
­ Disclosure ­ Bug bounty
Knowing when/how to call for help

#RSAC
Summary
Every IT product will have vulnerabilities Vendors are at different maturity levels. Help them understand your needs and expectations. If you have the skills and time ­ join a bug bounty program Resist the urge to email the PSIRT every time a new public vulnerability emerges.

#RSAC
Apply this information
Survey your critical systems. Does every vendor have a PSIRT? Are you subscribed to one of their disclosure channels? Does the vendor have a reasonable and responsible disclosure policy? Does it align with your requirements? Review past advisories. Learn about how the product works, its components, and how vulnerabilities apply.

Thank you. AMA.
Jon Green jon.green <at> hpe.com

