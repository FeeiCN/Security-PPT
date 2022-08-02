SESSION ID: CXO-W10
Defining a Risk Appetite That Works
Jack Jones
Chairman - FAIR Institute
#RSAC

What we'll cover...
Appetite vs. tolerance -- what's the diff? Why bother? Comparing risk appetite definitions An example of a "working" risk appetite Getting aligned with your risk appetite Staying aligned with your risk appetite Applying this where you work Q&A

Presenter's Company

Logo ­ replace or delete

on master slide

2

#RSAC

#RSAC
Example #1: What's your risk appetite?

Presenter's Company Logo ­ replace or delete
on master slide

IT DEPENDS...
Risk appetite is always a function of balancing need/desire, cost, and risk -- which can vary over time
3

#RSAC
Appetite vs. Tolerance -- What's the diff?

Presenter's Company Logo ­ replace or delete
on master slide

A LINE IN THE SAND VS. BEHAVIOR MODIFICATION
You have to define the former before you can deal with the latter
4

#RSAC
Why bother?
Provide clarity in expectations Improve focus in risk management efforts Improve communication with stakeholders Reduce the likelihood of unacceptable loss
­ What's an "unacceptable loss"?

Presenter's Company

Logo ­ replace or delete

on master slide

5

Comparing risk appetite definitions

Is this a useful risk appetite statement?

"The organization has zero appetite for the loss of customer data"

Realistic & actionable? Provides clarity in expectations? Improves focus in risk management efforts? Improves communication with stakeholders? Reduces the potential for unacceptable loss?

Zero

Presenter's Company

Logo ­ replace or delete

on master slide

7

#RSAC

Is this a useful risk appetite statement?
"The organization has a low appetite for the loss of customer data"

Realistic & actionable? Provides clarity in expectations? Improves focus in risk management efforts? Improves communication with stakeholders? Reduces the potential for unacceptable loss?

Presenter's Company

Logo ­ replace or delete

on master slide

8

Low

#RSAC

#RSAC
Expressing it economically

"The organization does not want to exceed $10M in loss."

Aggregate? Single event?

$10M

Realistic & actionable?
Provides clarity in expectations?
? Improves focus in risk management efforts?
Improves communication with stakeholders?
Reduces the potential for unacceptable loss?

Presenter's Company

Logo ­ replace or delete

on master slide

9

Presenter's Company Logo ­ replace or delete
on master slide

...or...
10

#RSAC

An example of a "working" risk appetite

#RSAC
Step 1

Choose a risk (loss event scenario) to set an appetite for, for example:

­ Disclosure of customer PII records

Our example...

­ Business process outage

­ Regulatory non-compliance

­ Financial misstatement

­ etc...

Yes, this means you may define multiple risk appetites

Presenter's Company

Logo ­ replace or delete

on master slide

12

#RSAC
Step 2
Define a loss magnitude threshold for that risk, for example:
­ No disclosure of > 1M customer PII records
Why 1M records?
­ Reduces the number of systems/applications to a manageable number ­ Losing "millions of records" has a subjective sting to it ­ No, it isn't materially different than 999k records, but you have to draw the line
somewhere

Presenter's Company Logo ­ replace or delete
on master slide

NOTE: You can lower the threshold later -- after the organization has reliably established success at this level
13

#RSAC
Step 3
Define a probability threshold, for example:
­ Quantitative: < 5% (within the next 12 months) ­ Qualitative: Very Low (within the next 12 months)
How do you define "Very Low"?
This is the probability of an event that exceeds the loss magnitude threshold defined in step 2

Presenter's Company

Logo ­ replace or delete

on master slide

14

#RSAC
Example of "Very Low" probability criteria
(malicious breach context)

Defined by combining characteristics of the threat landscape with control conditions, for example:

For assets containing > 1M customer PII records:
­ Assets and privileged systems* that ARE directly Internet-facing

Requires policies & processes that limit the likelihood of introducing new exploitable conditions

No more than 1 exploitable condition** every three years (control deficiencies)

All exploitable conditions discovered and remedied within 48 hours
­ Assets and privileged systems that ARE NOT directly Internet-facing
No more than 2 exploitable conditions per year (control deficiencies)

Requires policies, processes, and technologies that enable rapid detection and remediation of problems

Exploitable conditions discovered and remedied within 7 days

Presenter's Company Logo ­ replace or delete
on master slide

* "Privileged systems" are systems used by personnel with privileged access to "crown jewels". ** "Exploitable conditions" are those weaknesses that permit an attacker to directly affect the assets at
risk (e.g., a SQL injection flaw, weak password, etc.)
15

#RSAC
...results in the following risk appetite definition

"Less than a 5% (or, "Very Low") probability in the next 12 months of a disclosure of > 1M customer PII records"

Realistic & actionable? Provides clarity in expectations? Improves focus in risk management efforts? Improves communication with stakeholders? Reduces the potential for unacceptable loss?

Presenter's Company

Logo ­ replace or delete

on master slide

16

#RSAC
Example outage-related appetite
Less than a 5% probability in the next 12 months of > 100k lost customer transactions in any 24 hour period

Presenter's Company

Logo ­ replace or delete

on master slide

17

Example regulatory commpliance-related

#RSAC

appetite

Less than 5% probability in the next 12 months of a cybersecurity related regulatory action against the
company (e.g., consent decree)

Presenter's Company

Logo ­ replace or delete

on master slide

18

#RSAC
Example financial reporting-related appetite
Less than 5% probability in the next 12 months of a financial misstatement > $10M that stems from an IT
or cyber-related problem.

Presenter's Company

Logo ­ replace or delete

on master slide

19

#RSAC
Definition criteria summary - the appetite must...
Be realistic and actionable Be aligned to a specific type of loss event Clearly describe a severity threshold Clearly describe a probability threshold for a specific timeframe (e.g., next 12 months)

Presenter's Company

Logo ­ replace or delete

on master slide

20

#RSAC

So, you've defined your risk appetite(s) -- now what?

Presenter's Company

Logo ­ replace or delete

on master slide

21

#RSAC
Two things to focus on...
1. Getting aligned with the appetite 2. Staying aligned with the appetite

Presenter's Company

Logo ­ replace or delete

on master slide

22

Getting aligned with your risk appetite

#RSAC
Getting aligned boils down to...
1. Identify assets that constitute "crown jewels" within the context of the appetite
- A "crown jewel" is anything that, if adversely affected in the manner described by the appetite definition (e.g., disclosure, outage, etc.), exposes the organization to loss that exceeds the magnitude threshold
2. Evaluate current probability of exceeding the appetite's magnitude threshold (given the threat landscape and control conditions)
3. If/where probability exceeds appetite(s), identify and implement options for aligning with the appetite(s)

Presenter's Company

Logo ­ replace or delete

on master slide

24

#RSAC
Example -- identifying PII-related crown jewels
Crown jewels (contain or process more than 1M customer PII records)
­ 5 production databases ­ 2 test/dev databases ­ 14 production applications ­ 5 test/dev applications ­ 22 production servers ­ 9 test/dev servers ­ 3 servers containing old data dumps
Privileged systems
­ 24 personnel w/ privileged access to production crown jewels (dbas, sysadmins, etc.) ­ ~150 personnel w/ privileged access to test/dev crown jewels (dbas, sysadmins, developers, test
engineers, etc.)

Presenter's Company

Logo ­ replace or delete

on master slide

25

#RSAC
Identify easy opportunities for PII appetite alignment
Skinny-down the number of records in dev/test to eliminate those systems from the list of crown jewels and privileged systems Remove old data dumps

Presenter's Company

Logo ­ replace or delete

on master slide

26

#RSAC
Next alignment steps
1. Which PII crown jewels and privileged systems are Internet-facing?
- Identify and fix any exploitable conditions
2. Which PII crown jewels and privileged systems are not Internet-facing?
- Identify and fix any exploitable conditions

Presenter's Company

Logo ­ replace or delete

on master slide

27

The hard part -- staying aligned with your risk appetite

#RSAC
Two dimensions to staying within appetite...
Setting decision-making boundaries (policies, authorities, etc.)
­ Help people avoid doing "stupid stuff"
Establishing early-warning indicators (KRIs & KPIs)
­ Identify and correct appetite violations

Presenter's Company

Logo ­ replace or delete

on master slide

29

#RSAC
Setting decision-making boundaries
Example policies, standards, and processes
­ 100% of asset management information regarding crown jewels and privileged systems must be accurate at all times
­ No crown jewels permitted in dev/test environments ­ No third parties may have > 1M customer records ­ Any proposed additional crown jewel must:
Be reviewed by the CISO and approved by the CIO and the information owner before being implemented Comply with crown jewel control standards
­ Policy exception requests that affect crown jewels and relevant privileged systems require approval by the information owner and a direct report of the CEO (e.g., COO)
­ Personnel with privileged access to crown jewels must pass an examination that demonstrates an understanding of their risk management responsibilities

Presenter's Company

Logo ­ replace or delete

on master slide

30

#RSAC
Example Cyber KRIs - 4th Qtr
Presenter's Company Logo ­ replace or delete
on master slide

#RSAC
Example Cyber KPIs - 4th Qtr
Presenter's Company Logo ­ replace or delete
on master slide

#RSAC
Example Board Reporting - 4th Qtr
Four risk types, their appetite thresholds, and alignment condition over time.
Top Risks
Represents the probability of an event in the next 12 months that exceeds the magnitude threshold. Excludes assets that are not known about or are not centrally managed (shadow IT).
If preferred, you can use qualitative labels like "Very Low" (green), "Low" (yellow), etc. instead of %'s
Presenter's Company Logo ­ replace or delete
on master slide

#RSAC

Simply being explicit in your expectations and intentions can have a significant effect on focus and efficacy.

Presenter's Company

Logo ­ replace or delete

on master slide

34

Applying what you've learned

#RSAC
In the next week...
Begin to socialize this approach with colleagues
­ Identify their concerns and listen to their ideas
If "risk appetite" is too sensitive a term where you work, you can refer to this approach as "crown jewel focused risk management"
­ But make no mistake: what the organization defines as a "crown jewel" and the steps it takes to manage them (or not manage them) is a reflection of both its risk appetite and risk management maturity

Presenter's Company

Logo ­ replace or delete

on master slide

36

#RSAC
In the next 30 days...
Get stakeholder support for applying this approach (or your variation)
­ Propose a hypothetical appetite for one or more types of risk ­ Describe how the organization could leverage it to improve risk management
Providing clearer expectations Improving focus Improving communication Reducing the organization's exposure to extreme events

Presenter's Company

Logo ­ replace or delete

on master slide

37

#RSAC
In the next 90 days...
Once you have the go-ahead, begin defining and leveraging your first risk appetite
­ Find out what type of risk (e.g., outage, breach, etc.) management cares most about ­ Work with stakeholders to define an initial appetite for that risk type ­ Resist the urge to set too low an initial appetite ­ Focus first on getting the organization aligned with the initial appetite ­ Focus second on how to help the organization stay within the initial appetite ­ Build on your initial success to define and leverage appetites for other risk types ­ Consider lowering your risk appetite over time

Presenter's Company

Logo ­ replace or delete

on master slide

38

Q&A

