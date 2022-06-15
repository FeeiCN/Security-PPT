Andrea Marcelli (@_S0nn1_)

PhD Student
Security Researcher
Twitter Email Web

The signature generation problem The algorithm Introducing YaYaGen Demo

A unique pattern
Syntactic signatures
* this is where the most of the existing tools and researches focus on
Semantic signatures Android malware

Reduce

Automate

100% recall

Save

"YARA is to files what Snort is to network traffic"
de-facto standard syntactic signatures
Semantic signatures

rule YaYaSyringe {
meta: author = "DEF CON 26"
strings: $a = "text here" $b = { E2 34 A1 C8 23 FB }
condition: $a and $b and androguard.filter("action.BATTERYCHECK") and androguard.number_of_services == 3 ...
}

APK

Unsupervised

Automatic

static dynamic Each block is an attribute extracted through the analysis quality of the analysis

url: "malware.xxx"
permission: "ACCESS_FINE_LOCATION"

Sample 1

Sample 2

Signature

=

Sample 1

Sample 2

Sample 3

Sample 4

Sample 5

Sample 6

Sample 7

Sample 8

Sample 9

Sample 10

Sample 11 Sample 12

+

+

+

+

dynamic greedy algorithm

clause

literal

DNF

clause

weighed

is the lowest

weighting system
higher the weight, the less FP lower the weight, the more FP

TMIN TMAX

Raw
TMAX

Optimized

over-specific Basic optimizer Evo optimizer

From
application analysis reports
to
YARA rules

2 algorithms

2 optimizers

YARA rule parser

FP exclusion

Koodous

heuristics

Rule Name

Original

YaYaGen 1,004 315 257 652 172 430

Improvement +86.3% +43.2% +89.0% +16.6% +8.2% +131.2%

perform better

100 apps is less 5 minutes

