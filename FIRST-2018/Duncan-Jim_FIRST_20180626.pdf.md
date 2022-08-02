"Moving to the Le-":
Ge0ng Ahead of Vulnerabili:es by Focusing on Weaknesses
Jim Duncan, Juniper Networks SDL Program

Agenda

· Problem Statement · Vulnerabili0es vs. Weaknesses · The Common Weakness Enumera0on (CWE)
· Example CWE Entry: CWE-119 · Weaknesses as Bug-Tracking Data
· Tips'n'Tricks for assigning CWE labels · Futures, Prognos0ca0ons, Recommenda0ons
· Ques0ons?

Duncan, "Moving to the Left": Getting Ahead of Vulnerabilities by Focusing on Weaknesses

2

Juniper's Secure Development Lifecycle

Security in Design M
n

Release Security Review
Tra A

· Mission: Improve the resilience of Juniper products through the applica8on of dis8nct prac%ces within
Juniper's exis8ng engineering processes
· Intended to be lightweight and minimally disrup8ve
· "Self-inser8ng" with low impact
· Broad mission across all Juniper development
· Program formally started in 2013
· The SDL is not simply desirable
· Required by a growing number of our customers · An obliga8on on behalf of the Internet community
· SDL Func8onal Goal: Vulnerability Containment
· Keep product security vulnerabili8es inside Juniper · Vulnerabili8es are much more expensive aRer they escape

Thoredaetling 3

PTeensetitnragtion 4

JUNIPER

2

SECURE DEVELOPMENT

5

LIFECYCLE

wairneinnges1asnd

ReIns6pciodnesnet Pla

Duncan, "Moving to the Left": Getting Ahead of Vulnerabilities by Focusing on Weaknesses

3

Problem Statement

Vulnerability Chasing is "Whack-a-Mole"

· This is a common thread; that probably means something important.
· (By the way, those are gophers, not moles. But I digress...)

Duncan, "Moving to the Le>": GeAng Ahead of VulnerabiliEes by Focusing on Weaknesses

5

Hazardous to IR Teams and Our Community

"SURVEY SAYS..."

VULNERABILITY HANDLING IS:

STRESSFUL
EXPENSIVE EXHAUSTING FRUSTRATING

· No surprise that endless
reac:ve work wears us down
· Causes long-term damage
· Staff health, rela4onships · Team dynamics · Team-to-team rela4onships · Personal burn-out
· Career burn-out · Industry burn-out?
· Which did you choose?

Duncan, "Moving to the LeD": GeGng Ahead of Vulnerabili:es by Focusing on Weaknesses

6

Weakness Mi*ga*on is Proac*ve
"Work smarter, not harder." · Weaknesses are the constituent elements of vulnerabilities.
· Weakness resolution eliminates multiple vulnerabilities. · Resolution of weaknesses contributes to persistent resilience.
· Unfortunately, it brings its own challenges to the effort:
· No immediately obvious result; difficult to measure effectiveness. · Pays no direct dividend; difficult to justify resources. · Immature area of study; nascent topic, much remains to be figured out.
· More to follow on all these points...

Duncan, "Moving to the Le:": Ge=ng Ahead of Vulnerabili*es by Focusing on Weaknesses

7

Vulnerabili*es vs.
Weaknesses

Essential Terminology & Key Concepts
· A vulnerability depends upon one or more weaknesses.
· In other words, weaknesses are the constituent elements of vulnerabilities.
· The existence of a weakness does not constitute a vulnerability.
· A weakness may be provably identified in some code, but it may not be vulnerable for various reasons. (e.g., unreachable instruction)
· A vulnerability is actionable; it violates a security policy. · But a weakness only has the potential to violate a security policy. · There are more, but these are essential · Any questions before we continue?

Duncan, "Moving to the LeG": GeJng Ahead of VulnerabiliLes by Focusing on Weaknesses

9

Implications and Misunderstandings

· Weaknesses are an abstrac,on; they are not well understood.
· Mul,ple weaknesses may be iden,fied in one snippet of code.
· Various disparate weakness labels may all be correct; never exclusive.
· Many individual weaknesses can be argued to be the best possible label.
· Weakness is similar, but not iden,cal, to the concept of root cause.
· This conflict causes enormous confusion (and occasional conflict)
· Root cause is generally unitary, atomic, exclusive. · Weaknesses are mul,plex.
· Code runs fine with weaknesses, but fails with a vulnerability.
· Not confined to code; weaknesses happen in design and elsewhere.

Duncan, "Moving to the Le9": Ge<ng Ahead of VulnerabiliAes by Focusing on Weaknesses

10

The Common Weakness
Enumeration (CWE)

· Virtual smörgåsbord of weakness labels, both discrete and abstract.
· Discrete labels, e.g.: CWE-193: Off-by-one Error or CWE-369: Divide by Zero · Both are members of CWE-682: Incorrect Calculation · CWE-682 is a member of CWE-189: Numeric Errors · CWE-189 is a member of CWE-699: Development Concepts
· These parent-child relationships are not exclusive
· It's more like "It takes a village...": aunts, uncles, grandparents, neighbors!
· Which one do you use? It depends on the goal you have in mind.

Duncan, "Moving to the LeJ": GeLng Ahead of VulnerabiliOes by Focusing on Weaknesses

12

Weakness Classification and Heirarchy
· Weakness Base is the fundamental en.ty in the compendium.
· CWE-552: Files or Directories Accessible to External Par?es
· Weakness Variant is more specific.
· CWE-553: Command Shell in Externally Accessible Directory
· Weakness Class is a higher-level abstrac.on.
· CWE-668: Exposure of Resource to Wrong Sphere
· Category is a broad set of weaknesses with a common characteris.c.
· CWE-361: 7PK ­ Time and State · "7PK" is The Seven Pernicious Kingdoms, a founda.onal reference for CWE.

Duncan, "Moving to the LeS": GeUng Ahead of Vulnerabili?es by Focusing on Weaknesses

13

Additional Weakness Groupings & Terms
· Compound Elements: Closely associated independent weaknesses
· Based on interaction or co-occurrence, e.g., Composite or Chain weaknesses
· Composite: Simultaneous weaknesses that create a vulnerability.
· CWE-352: Cross-Site Request Forgery (CSRF)
· Loose Composite: Appears to be individual, but isn't. (Ignore for now.) · Chain: Serialized weaknesses that create a vulnerability. · Named Chain: A chain so frequent that it deserves its own moniker.
· CWE-692: Incomplete Blacklist to Cross-Site Scripting

Duncan, "Moving to the LeP": GeQng Ahead of VulnerabiliUes by Focusing on Weaknesses

14

And More Weakness Groupings & Terms

· View: A useful way of considering CWE content, e.g., a Slice or Graph
· Implicit Slice: membership based on common shared characteris=c:
· CWE-919: Weaknesses in Mobile Applica>ons
· CWE-701: Weaknesses Introduced During Design
· Explicit Slice: membership based on some external criterion:
· CWE-604: Deprecated Entries · CWE-630: DEPRECATED: Weaknesses Examined by SAMATE
· Graph: membership based on heirarchical rela=onships:
· CWE-1026: Weaknesses in OWASP Top Ten (2017) · CWE-868: Weaknesses Addressed by the CERT C++ Secure Coding Standard

Duncan, "Moving to the LeW": GeXng Ahead of Vulnerabili>es by Focusing on Weaknesses

15

Confusing Adjectives: Primary v. Resultant
· Primary Weakness: Ini%al cri%cal error (possibly a root cause) that exposes subsequent weaknesses a:er it.
· Resultant Weakness: Exposed following an earlier weakness. · Example:
· CWE-190: Integer Overflow may cause a size error alloca%ng a buffer. · CWE-120: Buffer Overflow occurs because of the preceding size error.
· This rela%onship is described as
· "CWE-190 is primary to CWE-120," or · "CWE-120 is resultant from CWE-190".

Duncan, "Moving to the Left": Getting Ahead of Vulnerabilities by Focusing on Weaknesses

16

What's The Purpose of All This?
· For immediate resolu.on/mi.ga.on, focus on Base Weaknesses. · Nitpick with Variants if necessary, maybe Chains and Composites. · For long-term improvement/refinement, look at Class and Category. · Constrain with Views, especially Slices. Important! (more on this later)
· What does all this look like in prac.ce?

Duncan, "Moving to the Le=": Ge@ng Ahead of VulnerabiliDes by Focusing on Weaknesses

17

Example CWE Entry: CWE-119

Duncan, "Moving to the Left": Getting Ahead of Vulnerabilities by Focusing on Weaknesses

CWE-119, 1/8
19

Duncan, "Moving to the Left": Getting Ahead of Vulnerabilities by Focusing on Weaknesses

CWE-119, 2/8
20

Duncan, "Moving to the Le2": Ge5ng Ahead of Vulnerabili=es by Focusing on Weaknesses

CWE-119, 3/8
21

Duncan, "Moving to the Le2": Ge5ng Ahead of Vulnerabili=es by Focusing on Weaknesses

CWE-119, 4/8
22

Duncan, "Moving to the Le2": Ge5ng Ahead of Vulnerabili=es by Focusing on Weaknesses

CWE-119, 5/8
23

Duncan, "Moving to the Left": Getting Ahead of Vulnerabilities by Focusing on Weaknesses

CWE-119, 6/8
24

Duncan, "Moving to the Le2": Ge5ng Ahead of Vulnerabili=es by Focusing on Weaknesses

CWE-119, 7/8
25

Duncan, "Moving to the Le2": Ge5ng Ahead of Vulnerabili=es by Focusing on Weaknesses

CWE-119, 8/8
26

Weaknesses as Bug-Tracking Data

Case Study: CWE Implemented in GNATS

· Ini$al implementa$on: One drop-down field next to SIRT data.
· Advantage: match-as-you-type provides rapid lookup and comple$on. · Disadvantages: only one possible label, feeble support for novices.
· BeGer implementa$on supports a list of CWE labels with priority.
· Constrained to one value, lots of $me spent on finding best possible CWE. · Mul$ple values provides cache and depth, beGer holis$c understanding.
· Also would include a grouping func$on for trending support and refinement.
· Immediate benefit: CWE link helps developer understand flaw.
· Varies among entries, but many have deep, broad explana$ons, sugges$ons.
· Includes recommenda$ons for recognizing good and bad examples.

Duncan, "Moving to the Left": Getting Ahead of Vulnerabilities by Focusing on Weaknesses

28

Weakness Data as SDL Deliverable
· Roll-up of weakness groups produces trends in pentest findings
· Exposes areas of good performance and others needing remedia:on · Feeds back into Training prac:ce, Security in Design prac:ce · Iden:fies areas for focus by development teams and leadership
· Annual internal "Top Ten Weaknesses" Report
· Long-term trending of bug reports across all products · Data is compared and contrasted with industry results (OWASP, SANS/CWE)
· Future goal: automa:c repor:ng of CWEs from sta:c code analysis
· Caveat: to be tagged; sta:c analyzers produce "s:lted" results

Duncan, "Moving to the Left": Getting Ahead of Vulnerabilities by Focusing on Weaknesses

29

Tips'n'Tricks for Assigning CWE Labels

Researcher? Or Developer? Start Here!
· If you are the executive of some organization, you care about impact.
· E.g., denial of service, data exfiltration, log errors causing compliance failures · "Research Concepts" provides a useful constraint for filtering selections
· If you are a software/hardware vendor, you care about cause.
· E.g., buffer overflow, trust boundary failure, poor entropy, authorization flaw · "Development Concepts" should be your default constraint (but not solid)
· If I had this to do over again, I would have started with this emphasis.

Duncan, "Moving to the Le=": Ge@ng Ahead of VulnerabiliFes by Focusing on Weaknesses

31

Use the Search and Filter Func1ons Well
· Prefix search terms with "inurl:defini5ons" to constrain to CWEs only.
· E.g., "Search: inurl:definitions entropy" · Otherwise, you'll hit matches from all over the CWE web site.
· Select the appropriate "Presenta5on Filter" near the top, leG side.
· I almost always use "Complete", but that may be overwhelming. · Other choices are "Basic", "High Level", "Mapping-Friendly".
· Or simply jump directly to the CWE of interest.
· The jump field is located in the top-right corner of every page. · Enter only the numeric part of the CWE iden5fier.

Duncan, "Moving to the Left": Getting Ahead of Vulnerabilities by Focusing on Weaknesses

32

Can't Decide on the Best CWE?

· Try widening your search, then narrowing again.
· Move up to one of the parents, then peruse the children. · No result? Move back and try a different parent. "Lather, rinse, repeat."
· Apply reverse engineering to CWE itself.
· Browse the CVE and CAPEC links; both have links back into CWE. · Warning: NVD/CVE links to CWE are alarmingly general, sometimes wrong! · Note that just like CVSS, different vendors correctly have different CWEs.
· Don't forget the References; sometimes a deeper study is needed. · Third-party tools, e.g., CWEvis, may be helpful.
· I have no current experience with CWEvis due to browser issues

Duncan, "Moving to the Le:": Ge=ng Ahead of VulnerabiliDes by Focusing on Weaknesses

33

Futures, Prognos-ca-ons, Recommenda-ons

Why Fix Weaknesses? The Code Works Fine!
· Consider this conversation:
· Development Manager: "How did you spend your day?" · Developer: "I found and resolved two weaknesses in our main code." · Manager: "Did you finish your feature requests?" · Developer: "No, but I fixed these two weaknesses." · Manager: "Was the code running fine before?" · Developer: "Yes, of course, but it was weak. I fixed these weaknesses!" · Manager: "!!!!!"....
· Major awareness is needed all across the industry.

Duncan, "Moving to the Le>": GeAng Ahead of VulnerabiliGes by Focusing on Weaknesses

35

Customers/Auditors Shifting Focus to CWE
· Customers (and specifically their auditors) are moving beyond requirements that specific CVEs be fixed; they are now tracking CWEs.
· Considerable confusion; recall that this is all new to most parCcipants. · Note that "CVE/CWE" may be an example of "CWE-193: Off-by-one Error". ;-)
· This brings up a whole new set of complicaCons.
· How do we audit this? How do we measure compliance? · What about mulCple weaknesses? Do we look at chains and composites, too? · When does this become legally important, as in "acceptable to the trade"?

Duncan, "Moving to the LeG": GeIng Ahead of VulnerabiliLes by Focusing on Weaknesses

36

What's Next?
· We should expect/request better metrics, more exploration of trends.
· PhD dissertation ideas? FIRST Metrics SIG? Other SIGs? Maybe a CWE SIG? · Better input/management of label determination, parentage, peers. · Awareness needed for weakness science and improvement of terminology.
· CWE needs broader community support and more infrastructure.
· How do I suggest a new CWE label with sensitivity implications? · Broad areas are missing, e.g., IP violations; What else should be addressed?
· More ideas? Email me! jduncan@juniper.net

Duncan, "Moving to the Le8": Ge;ng Ahead of VulnerabiliCes by Focusing on Weaknesses

37

Questions? Thank You!

