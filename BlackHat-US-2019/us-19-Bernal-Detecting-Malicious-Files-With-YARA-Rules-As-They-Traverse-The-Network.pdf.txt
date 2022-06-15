Detecting malicious files with YARA rules as they traverse the network
David Bernal @d4v3c0d3r

#whoami
· Lead Security Researcher of SCILabs
· 10 years of experience in DFIR · 9 GIAC Certifications, SANS Mentor
for Latin America · I like playing the piano and
exercising in my free time
David Bernal @d4v3c0d3r

David Bernal @d4v3c0d3r

I want to help blue teamers detect malicious files on the network using YARA rules, Zeek framework and a custom script I developed, all are open source projects.
David Bernal @d4v3c0d3r

· Open source tool created by Victor Alvarez (@plusvic) from Virus Total
· Identification and classification of malware samples
· Create descriptions for malware families
David Bernal @d4v3c0d3r

rule SampleRule {
meta: my_identifier_1 = "Some string data"
strings: $my_text_string = "text here" $my_hex_string = { E2 34 A1 C8 FB }
condition: $my_text_string or $my_hex_string
}

Metadata section (optional): rule description, sharing restrictions, author
Strings section (optional, but almost always used): text, hex
or regular expressions
Condition section (required): Determines the condition for
detecting a file

Source: https://yara.readthedocs.io/en/v3.4.0/writingrules.html
David Bernal @d4v3c0d3r

rule Office_doc_AutoOpen { meta: author = "David Bernal - Scilabs" description = "Detects Microsoft Office documents with
strings related to macro code and AutoExecution. " license = "https://creativecommons.org/licenses/by-nc/4.0/" strings: $auto1 = "AutoOpen" $auto2 = "AutoClose" $macro = "ThisDocument" $macro2 = "Project" condition: uint32(0) == 0xe011cfd0 and uint32(4) == 0xe11ab1a1 and all of ($macro*) and 1 of ($auto*) }
David Bernal @d4v3c0d3r

Author, description and license
AutoOpen or AutoClose-> automatic execution
ThisDocument and Project -> macro
Uint32 -> define file magic number for office files and how
strings are used

Zeek Network Security Monitor · Formerly bro · Event driven sensor · Creates logs of the network traffic · Can natively extract files from the
network
David Bernal @d4v3c0d3r

· YARA has traditionally been used on the endpoint to detect malicious files. We can complement this detection on the network, for an increased coverage
· While some commercial products exist to support network based YARA detection, it can be implemented with open source tools!!: Zeek and YARA
David Bernal @d4v3c0d3r

Typical Enterprise Network Diagram

Event driven IDS (logs)
File extraction from clear text protocols

Span Port
Zeek sensor

Alert!

Automated YARA scanning and email based alerting with log enrichment
David Bernal @d4v3c0d3r

Email alert: Isolated file sample Zeek log enrichment
Alerted YARA

Enabling file extraction capabilities in Zeek
Zeek will trigger the event (f:fa_file) when it observes a new file in a supported clear text protocol
1. Add extraction script in main.bro 2. Enable the provided script: @load frameworks/files/extract-all-files 3. Deploy Zeek configuration: Broctl deploy
David Bernal @d4v3c0d3r

Tuning file extraction in Zeek
· Increased sensor performance · Files are retained for longer · Potential evasion opportunity if an
unexpected mime-type is used
David Bernal @d4v3c0d3r

Tuning file extraction in Zeek
Target specific mime-types commonly used for malware delivery
· Compressed files · Microsoft Word (old and new format) · PDF files · RTF files · TXT files (detecting powershell, vbs) Sample Zeek configuration file for targeted extraction based on mimetypes is available on the white paper
David Bernal @d4v3c0d3r

Automated YARA Scanning

Span Port

Enabled YARA rule files

Zeek logs (context)
Delete files

David Bernal @d4v3c0d3r

Extracted files

Custom Python script executed by a cron job

Alert!

Alerted files

What YARA rules should you enable?
Develop and use your own YARA rules for the campaigns you detect.
Use third party YARA rules from trusted sources, the community has great resources!
· CSIRT-CERT teams · Florian Roth's rules https://github.com/Neo23x0/signature-base · YARA Rules project https://github.com/Yara-Rules/rules · Public threat research papers by various Security Vendors and
Security Researchers · Closed threat research groups (YARA Exchange community)
David Bernal @d4v3c0d3r

Detection Demo: malicious word files with macros

2014 Credit: David Bernal Scilabs
2015 Credit: Brad,
SANS ISC David Bernal @d4v3c0d3r

2017 Credit: Didier
Stevens

5 years later... still used!!
July 2019 Credit: Brad @malware_traffic

Full references on the white paper

Detection Demo: malicious word file with macros
David Bernal @d4v3c0d3r

David Bernal @d4v3c0d3r

More Yara detections: higher confidence

2 of my rules 1 additional from a

alerted

trusted third party

David Bernal @d4v3c0d3r

David Bernal @d4v3c0d3r

Properly isolated file sample attached if file size permits
David Bernal @d4v3c0d3r

Challenges / Next Steps

· Fine tuning
· Automatic event creation on MISP
· Integration with Elasticsearch and Syslog
· Exclusions
· Encrypted protocols

· Migration to Python 3 · Sandbox integration · Integration with SOAR

David Bernal @d4v3c0d3r

Custom script
· This script can be freely downloaded from SCILabs github https://github.com/SCILabsMX/yaraZeekAlert
· The white paper is available on Black Hat media server
David Bernal @d4v3c0d3r

Key Takeaways
· YARA detection can not only be implemented on the endpoint, but on the network too
· Network based YARA detection can be implemented with Zeek
· Network based YARA detection does not stress the endpoints and is generally faster, (several GB against several hundreds GB)
David Bernal @d4v3c0d3r

Thanks for your contributions!!!

Zeek Project (@zeekurity) https://docs.zeek.org

YARA https://yara.readthedocs.io/

Security researchers than share with the community · Víctor M Álvarez · Mila Parkour & YARA Exchange, DeepEndResearch Community · Florian Roth · Didier Stevens · Brad from malware-traffic-analysis.net, SANS ISC · CERT Teams, Security Vendors that release public YARA rules
David Bernal @d4v3c0d3r

David Bernal
@d4v3c0d3r
davidbernalmichelena@gmail.com
David Bernal @d4v3c0d3r

