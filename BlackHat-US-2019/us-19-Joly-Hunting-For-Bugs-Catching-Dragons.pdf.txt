Hunting for bugs, catching dragons
Nicolas Joly - @n_joly MSRC Vuln rabilities and Mitigati ns Team
This presentation is for informational purposes only. MICROSOFT MAKES NO WARRANTIES, EXPRESS OR IMPLIED, IN THIS SUMMARY.

Attacking Outlook with s

 Demo noclick CVE-2017-8506

Outlook exploits?
· Uncommon, not seen in the wild for a while
· I Love You / Love Letter, early 2000
· Badwinmail reported by Haifei Li in late 2015:
· Showed how to load Flash in Outlook · Leveraged a known Flash vulnerability to prove RCE
· Ryan Hanson's amazing research submitted in late 2016:
· Issues with the RTF format · COMs and Monikers · Some cool Outlook features
· Abusing Word features
· Embedding an EPS font (CVE-2015-2545)?

news.softpedia.com

Quick summary of the attack surface

Email parsing MIME parsing HTML / RTF Pictures (GDI or Office stacks) Fonts OLE Objects Calendars, iCals, vCards, contacts Attachments TNEF, MAPI properties ...

Email protocols SMTP POP3/IMAP Exchange Active Sync Exchange Web Services Autodiscover ...

Spoofing Certs issues Name spoofing S/MIME DRMs ...

Misc Macros SensePost's Ruler (rules, scripts, homepage) ...

What this talk covers

Email parsing MIME parsing HTML / RTF Pictures (GDI or Office stacks) Fonts
OLE Objects
Calendars, iCals, vCards, contacts
Attachments TNEF, MAPI properties
...

Email protocols SMTP POP3/IMAP Exchange Active Sync Exchange Web Services Autodiscover ...
Misc Macros SensePost's Ruler (rules, scripts, homepage) ...

Spoofing Certs issues Name spoofing S/MIME DRMs ...

Why this talk?
· Exploits for Outlook exist but we only occasionally receive reports of dragons outstanding issues
· Why aren't researchers reporting to us?
· Lack of public research, blog posts describing issues? · Lack of interest in the area? · Symbols unavailable for Office?
· How can we help our finders? · Let's talk about our own research! · Note:
· The vulnerabilities discussed in the following slides have all been resolved

Where to start? RichText emails?
https://support.microsoft.com/sq-al/help/290809

What's a TNEF email?
What's this?

TNEF specifications
· [MS-OXTNEF] · Sequence of objects, containers and properties
· Easy to parse · Developed an 010 template · Might release in the future

TNEF or RTF - Rich Text Format?
· One special property PR_RTF_COMPRESSED = 0x10090102 · Various encodings
· LZFu? Compressed RTF, default · MELA? Plain RTF, easy to change
· Bit flipping this field will generally result in a broken email · Use instead the Outlook Interop Library and send TNEF emails
programmatically

Examples of issues affecting Outlook
· CVE-2017-0106? Introduced by the \template keyword: · Remotely (and locally) loads files (http, smb) · Also loads embedded objects, like Flash · Dramatically extends the attack surface by allowing all the Word supported formats (docx, doc...)
· CVE-2018-0794 · Cyclic reference in the template names leading to Use After Free · a.rtf => b.rtf => \not found\a.rtf
· Resolution? · \template no longer supported in Outlook

Examples of issues affecting Outlook
· CVE-2017-0106? Introduced by the \template keyword: · Remotely (and locally) loads files (http, smb) · Also loads embedded objects, like Flash · Dramatically extends the attack surface by allowing all the Word supported formats (docx, doc...)
· CVE-2018-0794 · Cyclic reference in the template names leading to Use After Free · a.rtf => b.rtf => \not found\a.rtf
· Resolution? · \template no longer supported in Outlook

Outlook Interop, how to build an email
· Provides an API to build your own emails · Example, create a MailItem, change the MessageClass to IPM.Contact and send it · See the contact form appear in the preview pane
· Each class has its own properties/features

Outlook Interop, how to build an email
· Provides an API to build your own emails · Example, create a MailItem, change the MessageClass to IPM.Contact and send it · See the contact form appear in the preview pane
· Each class has its own properties/features

Other class names and bugs related
· Some examples listed here https://docs.microsoft.com/enus/office/vba/outlook/concepts/forms/item-types-and-message-classes
· Create a mail item and change its class to IPM.Remote
· Used to trigger a null pointer in the preview pane · Reported by Etienne Stalmans and fixed as vNext
· IPM.Document.*, aka "freedocs"
· CVE-2017-0204, Office documents open without Protected Mode, Ryan Hanson · CVE-2017-8571, Office documents open without user interaction

Other class names and bugs related

Other class names and bugs related

TNEF / .MSG format
· Use Interop to create Outlook .msg files

TNEF / .MSG format
· Use Interop to create Outlook .msg files

MAPI properties, TNEF and .MSG?
· TNEF is "a hierarchy of rich message properties", a succession of particular attributes, called MAPI properties, forming a stream.
· Example below with a Task message:
· A MAPI property is defined by a PID, a Type and a value

MAPI properties, TNEF and .MSG?
· A .MSG is an OLE Storage document, with streams matching MAPI properties, and sub-storages matching MAPI objects
· Properties are defined in the __properties_version1.0 stream:
Small properties (integers, bools...) are defined in that stream
Arrays, strings or other objects are defined in their own streams. For example the message class property is defined in __substg1.0_001A001F:

OLE objects in an email, really?
· From Haifei's research, we know that we can embed objects · How are these processed exactly? Can we load scripts? · The OLE storages are easy to manipulate
· What else is hiding in there?
· Test case, insert an object in an email, put some breakpoints on the usual COM interoperability functions in ole32.dll
· ReadClassStg, OpenStorageEx, etc. · Pictures and links are processed differently · With an object link (CLSID_StdOleLink) we can hit OleLoad()

OLE objects in an email, really?
· From Haifei's research, we know that we can embed objects · How are these processed exactly? Can we load scripts? · The OLE storages are easy to manipulate
· What else is hiding in there?
· Test case, insert an object in an email, put some breakpoints on the usual COM interoperability functions in ole32.dll
· ReadClassStg, OpenStorageEx, etc. · Pictures and links are processed differently · With an object link (CLSID_StdOleLink) we can hit OleLoad()

Invoking COM Monikers from a .MSG
· Create an RTF email and insert a link (you may want to use an older version of Outlook)
· Save it to a .MSG storage · Locate the OLE storage specifically created · Create a new \x01Ole stream underneath · Hit OleLoad() · Instantiate monikers · Profit!

Unmarshalling COM Monikers

Example: FileMoniker, CVE-2018-0950

More with the FileMoniker
· Ever looked at CFileMoniker::RestoreShellLink in Ole32?
· FileMonikers support .LNK shortcuts:
· CVE-2018-0825, integer overflow in StructuredQuery · Load dlls with CVE-2017-8464?

Another example: OBJREF
· The objref moniker allows unmarshalling arbitrary objects on the IUnknown interface:

OBJREF ­ Building the exploit chain

· Still far from calc:

OBJREF

IPersistStreamInit::Load

CoUnmarshalInterface

Flash?

MSVIDCTL ­ BDATuner.Component
Types
IPersistStreamInit::Load

XML Feed Moniker
Initialize with HTML data

Load a VB Script

VB 0day
Calc with a...

Multiple bugs fixed in this attack
· Restrict the objects loaded by msvidctl.dll
· CVE-2016-0142, CVE-2016-7248, CVE-2018-0881
· Prevent the objref and XML Feed Moniker objects from loading in Office via the COM Activation filter
· Do not load OLE objects in the pane
· CVE-2018-0950
· Fix another VBScript bug
· And block VBScript as well in the Activation Filter (recent Office branches only)
· Restrict objects loaded by DiagnosticsHub.StandardCollector service
· CVE-2018-0824 · How is this related at all?

From the preview pane to system
· This issue does not only apply to Office, COM marshalling is extensively used by the system
· The attack surface is quite large:
· VARIANTs · SAFEARRAYs
· We just need to find a system COM with a method that accepts such argument

SafeArrays are generic
· They can contain bytes, integers, strings, all sorts of objects: · Including VT_UNKNOWN objects · Look at the logic in LPSAFEARRAY_Unmarshal
· We can quickly reach another CoUnmarshalInterface · And replay the attack

Ex: Diagnostics Hub Standard Collector Service
· Just calling GetGraphDataUpdates is enough to trigger the chain

Demo? Quickly?

Attacking Exchange with s

Attacking Exchange with emails
· Where to start?
· ShadowBrokers' EnglishmansDentist targeting Exchange 2003 · Voicemail Transcription RCE via .NET deserialization (CVE-2018-8302, not an
email scenario)
· Various attack scenarios:
· Are we already authenticated? · Are we playing with memory corruptions? Replaying tokens? Web issues?
· Is everything handled by managed code?
· Looking at Exchange Onprem gives a good idea of what's running · exRPC32.dll, what's that?
· Some tools:
· MFCMapi

MFCMapi, your best friend

exRPC and MAPI properties
· Loaded by MSExchangeDelivery.exe · Several functions parse properties found in TNEF emails:
· A property has a pid and a type:
· PT_STRING8 · PT_INT · PT_BINARY...
· Is there any bug left?

EcParseEntryId
· Called for pid ptagConflictEntryId, only accepts a byte array
· No checks on the property type · Supported variants are stored on 0x18
bytes on 64-bit
· Scalars at offset +8 · Pointers at +0x10
· Probably a DoS at worst

EcMakeFidlFromFEL
· Called for pid PostReplyFolderEntries, only accepts a byte array
· A loop where data is read and partially written in the original buffer
· No bound check
· We can alter one bit OOB in the last entry
· And [rdi+18h], ax with ax = 7FFFh · So what do you think I did?
· Nothing, was too hard 

Outcome of that research
· Are these issues exploitable? Very unlikely, but proves the concept · Other issues found, essentially type confusions
· These are likely exploitable after authentication, DoS otherwise
· Found also some issues affecting the .NET binaries
· Null pointers leading to temporary DoS
· Uninitialized memory while parsing rules
· PR_EXTENDED_RULE_ACTIONS · Likely exploitable but would need an infoleak first
· Other interesting components to look at, think OWA too
What else can YOU find?

References
· https://www.fireeye.com/blog/threat-research/2015/09/attack_exploitingmi.html · https://news.softpedia.com/news/badwinmail-microsoft-outlook-bug-can-give-attackers-control-over-pcs-
497795.shtml · https://insights.sei.cmu.edu/cert/2018/04/automatically-stealing-password-hashes-with-microsoft-outlook-and-
ole.html · https://cansecwest.com/slides/2016/CSW2016_Li-Xu_BadWinmail_and_EmailSecurityOutlook_final.pdf · https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-oaut/3fe7db9f-5803-4dc4-9d14-
5425d3f5461f · https://docs.microsoft.com/en-us/openspecs/exchange_server_protocols/ms-oxtnef/1f0544d7-30b7-4194-b58f-
adc82f3763bb · https://github.com/stephenegriffin/mfcmapi · https://blogs.technet.microsoft.com/srd/2017/07/20/englishmansdentist-exploit-analysis/ · https://www.thezdi.com/blog/2018/8/14/voicemail-vandalism-getting-remote-code-execution-on-microsoft-
exchange-server · https://docs.microsoft.com/en-us/dotnet/api/microsoft.office.interop.outlook?view=outlook-pia · CVE-2017-8506, demo on slide3

Thanks all!
@n_joly

