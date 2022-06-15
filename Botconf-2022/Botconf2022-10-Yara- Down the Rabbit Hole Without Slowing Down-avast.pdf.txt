Yara:
Down the Rabbit Hole Without Slowing Down
Dominika Regéciová | dominika.regeciova@avast.com | @regeciovad
Botconf 2022 TLP WHITE

A few notes about me
 Researcher at Avast  Ph.D. student at FIT BUT in Brno  Projects with ESA and Czech Police  My research:
 Formal models and languages in security  Pattern matching  Blockchain technology
2

What to expect from this talk
 What is Yara  Yara Performance  Changes in Yara
3

What is Yara?
4

Yara rules

import "math"

rule Botconf_malware

{

meta:

author = "John, Terry, and Caitlin"

description = "detection based on this great conference"

strings:

$str = "cmd.exe" ascii wide nocase

$re = /\w.*\d/

condition:

$str and $re and

math.entropy(0, filesize) > 7.0 and

uint16(0) == 0xFFFF

5

}

Yara rules
We want to scan the directory secret_dir recursively with our rule, which has 5.9 GB of data with 39,852 files:
./yara botconf_malware.yar -r secret_dir warning: rule "Botconf_malware": too many matches for $re, results for this rule may be incorrect warning: rule "Botconf_malware" in botconf_malware.yar(10): $re contains .*, .+ or .{x,} consider using .{,N}, .{1,N} or {x,N} with a reasonable value for N warning: rule "Botconf_malware" in botconf_malware.yar(10): string "$re" may slow down scanning
Also, that scanning took almost 45 minutes . What can we do with it?
6

Yara Performance
7

Atoms selection from strings

 In static parts, we firstly match the substrings known as atoms  The match is later confirmed from a list of potential matches in files  The selection of atoms influences the speed of matching  Atoms have 0 to 4 characters (0-length atom will match everything)

/abc.{1,20}def/ /(one|two)three/ { 00 00 00 00 [1-4] 01 02 03 04 } /a(c|d)/ /\w.*\d/ => "" (0-length atom)

Two atoms c and d. This is bad for speed

8

Strings

 Use only modificators you really need

$s1 = "cmd.exe"

ascii only

$s2 = "cmd.exe" ascii

ascii only, same as $s1

$s3 = "cmd.exe" wide

'UTF-16' only

$s4 = "cmd.exe" ascii wide both ascii and 'UTF-16'

 Case-insensitive modificators

$str = "cmd.exe" nocase will search all combinations such as Cmd., cMd.,...

$re = /[Cc]md\.exe/

give you better results

9

Strings

 Be specific as possible

$re = /\w.*\d/

This is not good for matching (x0, a_1, abc3, whatever123,...)

$re = /\w.{7, 8}\d/

 Text string prefix also improves speed

$re1 = /.{0,2}Tom/

$re1 will find Tom, xTom, xxTom in "xxTom"

$re2 = /Tom.{0,2}/ $re2 will find Tomxx in "Tomxx"

$re = /C:\\.{7, 8}\d/

10

Too Many Matches

 Till Yara 4.1.0 - too many matches generated an error and the results could be invalid

 From version 4.1.0 a warning is raised, the scanning is finished, but the results still can be

compromised (we still want to avoid it when possible)

 There is no one simple solution for this problem

 Possible causes and possible fixes:

 The quantifiers .* and .+, .*?

 The quantifiers without upper bound such as x{14,}

 Too large range (e. g. x{1,300000})

 Big jumps in the hexadecimal strings: {00 01 02 [1 - 100] 04}

 Wild-cards characters - can they be specified more precisely, or could be string split into

two, omitting the wild-cards character?

 Alternations: can it be split into two or more strings?

 Try to add specification for words matching (fullword, \b, ...)

11

Conditions

 Evaluation of static parts of rules are evaluated first  Condition such as filesize < 100 and $expensive_regex will not help  Short-circuit evaluation:
// EXPENSIVE and CHEAP math.entropy(0, filesize) > 7.0 and uint16(0) == 0xFFFF

// CHEAP and EXPENSIVE uint16(0) == 0xFFFF and math.entropy(0, filesize) > 7.0

 Integer loop optimization (both loops will stop iterating after the 1st time)

for all i in (0..100): (false)

for any i in (0..100): (true)

12

Yara rules

import "math"

rule Botconf_malware

{

meta:

author = "John, Terry, and Caitlin"

description = "detection based on this great conference"

strings:

$re1 = /[Cc]md\.exe/

$re2 = /C:\\\.{7,8}\d/

condition:

$re1 and $re2 and

uint16(0) == 0xFFFF and

math.entropy(0, filesize) > 7.0

13

}

Yara rules

import "math"

rule Botconf_malware

{

meta:

author = "John, Terry, and Caitlin"

The scanning takes only 3 seconds! 

description = "detection based on this great conference" strings:
$re1 = /[Cc]md\.exe/

$re2 = /C:\\\.{7,8}\d/

condition:

$re1 and $re2 and

uint16(0) == 0xFFFF and

math.entropy(0, filesize) > 7.0

14

}

Additional tips and new features
 --no-follow-links command-line option  --skip-larger option for skipping files larger than a certain size while scanning directories  New operator % for string sets. Example: 20% of them  New syntactic sugar allows writing 0 of ($a) as none of ($a*)
15

More resources
 VirusTotal GitHub page  Yara Documentation  YARA Performance Guidelines  yara_friends on Keybase
16

Our Changes in Yara
17

Motivation
This rule detects Bitcoin addresses in P2PKH and P2SH types
rule contains_btc_address {
strings: $btc_address = /[13][a-km-zA-HJ-NP-Z1-9]{25,34}/ fullword ascii wide
condition: $btc_address
}
btc_address.yar(4): warning: $btc_address in rule btc_address is slowing down scanning
18

Results
 Improved matching for strings:  The scanning with BTC addresses is ten times faster and without any warning  The scanning with the nocase option is about 27% faster
19

There is more...
20

There is more...
21

There is more...
22

There is more...
23

More resources
 Paper Pattern Matching in Yara: Improved Aho-Corasick Algorithm  Changes in Yara: PR (will be updated soon, I promise )
24

Conclusion
25

Conclusion
 Yara is an amazing tool not only for malware analysis  There is still space for improvements  Spoilers for the next changes:
 Behavioral analysis  Automated generation of Yara rules  Cuckoo module  For more, follow me on Twitter and LinkedIn: regeciovad
26

Thank you!
27

