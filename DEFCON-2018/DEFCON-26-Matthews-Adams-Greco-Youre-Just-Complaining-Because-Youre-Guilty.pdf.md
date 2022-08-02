You're Just Complaining Because You're Guilty:
A DEF CON Guide to Adversarial Testing of Software Used in the Criminal Justice System
August 11, 2018 - DEF CON 26
Jeanna Matthews, PhD - Clarkson University/Data and Society Nathan Adams - Forensic Bioinformatic Services Jerome D. Greco, Esq. - Legal Aid Society of NYC

Motivation/overview of the problem

Black box decision making
 Software is increasingly used to make important decisions about people's lives
 Hiring, housing, how we make friends, find partners, navigate city streets, get our news, ...  The weightier the decision the more crucial it is that we understand and can question it  What input is used to make the decision? Is it correct? Do we have other information that
should be considered?  Are protected attributes like race and gender used? What about proxies for those
characteristics?
 Criminal justice system
 Software/algorithmic decision making used increasingly throughout the criminal justice system  Often black boxes for which trade secret protection is claimed to be more important than rights
of individual defendants or citizens to understand the decisions  Evidence of problems  How can we find bugs and fix problems if the answer is always "you can't question" and "you
are just complaining because you are guilty"?

Can you imagine...
 Being sent to prison rather than given probation because proprietary software says you are likely to commit another crime?
 But you can't ask how the software makes its decisions. (Eric Loomis)
 Having the primary evidence against you being the results of DNA software?
 But one program says you did it and another says you didn't. (Nick Hillary)
 Being accused of murder solely because of DNA transferred by paramedics?
 But they don't figure that out for months. (Lukis Anderson)

 Software and complex systems need an iterative process of debugging and improvement!
 Anyone who has used technology knows that there are glitches and bugs and unintended consequences!
 Anyone who builds technology knows how easy it is for there to be substantial bugs you did not find!
 Huge advantages to independent, thirdparty testing aimed at finding bugs!
 If only those with interests in the success of software see the details, we have a huge problem and a recipe for injustice!

An Overview of Problematic Technology Used in the Criminal Justice System

Credit: National Institute of Standards and Technology (NIST) - The Organization
of Scientific Area Committees (OSAC)

Law Enforcement Tech by Secrecy Level*

Secret
We don't want you to know it exists and/or that we have it.

Secret as Applied
We have it but we won't tell you when and/or how we used it.

Trust Us
We have it. We used it here. Stop asking questions.

· Cell-Site Simulators · Hemisphere Project · PRISM · Backscatter X-Ray Vans · Drone Surveillance

· Automated License Plate Readers
· Facial Recognition/Capture · Domain Awareness System · Police Internal Databases
· Real Time Crime Center · Gang databases · Social media analytics · Etc.
· Predictive Policing

· DNA Probabilistic Genotyping Software
· Bail/Parole/Sentencing Determination Algorithms
· ShotSpotter
· Cellebrite Advanced Services and Graykey
· P2P/Child Pornography Investigative Software
· Network Investigative Techniques (NITs)

· Alcohol breath testing *Not comprehensive of all available technology. Some technologies fit under different levels based on the jurisdiction and agency.

Predictive Policing, Flawed Data, and Flawed Results
 Bad data in = bad data out  Racial disparities  Sources of data  Presumption of guilt by association  Constitutional rights of individuals  Lack of Transparency and Public Debate
 Non-Disclosure Agreements (NDAs)  Proprietary trade secrets  Sensitive data

Cell-Site Simulators (aka Stingray Devices)
 Mimics a cell phone tower and emits a signal that compels cell phones in the area to connect to it rather than a legitimate tower
 Not all cell-site simulators are "Stingrays"  Non-Disclosure Agreements (NDAs)  NYPD used 1,000+ times from 2008 to
2015 without once getting a warrant  U.S. v. Lambis, 197 F. Supp. 3d 606
(S.D.N.Y. 2016)  People v. Gordon, 58 Misc. 3d 544 (N.Y.
Sup. Ct. 2017)  Carpenter v. United States, 16-402, 2018
WL 3073916 (2018)

People v. Gordon and the Use of Cell-Site Simulators
The Concession

People v. Gordon and the Use of Cell-Site Simulators
The Decision
The NYPD's Post-Decision Denial*
*Probable-Cause Warrant Needed for Cell-Tracking, Brooklyn Judge Rules by Jason Grant (New York Law Journal) (November 15, 2017)

"He thought of the telescreen with its never-sleeping ear. They could spy upon you night and day, but if you kept your head you could still outwit them. With all their cleverness they had never mastered the secret of finding out what another
human being was thinking."
Quote from 1984 by George Orwell

Mobile Digital Forensics and the Encryption War
 Riley v. California, 134 S. Ct. 2473 (2014)  Cellebrite UFED Touch2
 Cellebrite is a digital forensics company specializing in mobile devices
 UFED = Universal Forensic Extraction Device
 Magnet Axiom  Paraben E3  Extraction of data (extraction of your life)  Available Outside of Law Enforcement

Cellebrite Advanced Services (CAS) and GrayKey
 2015 Attack in San Bernardino  Cellebrite Advanced Services (CAS)
 Secret process performed by Cellebrite at a Cellebrite lab
 Reportedly $1,500 per phone or a $250,000 a year subscription
 GrayKey by Grayshift
 Secret tool only sold to law enforcement  Reportedly two models available for
$15,000 or $30,000 per GrayKey device
 Defense has no access, can't verify, can't test, and is limited in challenging their use

Facial Recognition

Facial Recognition
 What company?  What algorithm?  What qualifies as a match?  Procedures, rules, guidelines, etc.  Source of images?  The Perpetual Line-Up: Unregulated
Police Face Recognition in America (2016) by Georgetown Law Center on Privacy & Technology (Clare Garvie, Alvaro Bedoya, & Jonathan Frankle)
 perpetuallineup.org

State v. Loomis and Sentencing Algorithms
 State v. Loomis, 881 N.W.2d 749 (Wis. 2016)  Correctional Offender Management Profiling for Alternative Sanctions
(COMPAS) by Northpointe, Inc.
 Risk Assessment Tool
 Are gender or race acceptable factors to consider?  How are the factors weighed?  How is that weighing determined?  Proprietary trade secrets

Case study: Forensic Statistical Tool (FST)
Office of the Chief Medical Examiner (OCME), NYC

Forensic Statistical Tool (FST)
Probabilistic genotyping software  Mixtures of DNA from 2-3 people  Allows for dropout (missing data) and drop-in (artifactual data)  Reports "likelihood ratio" statistic as a weight of evidence
Developed in-house  C#, MS SQL back-end  Browser interface for casework
Commercial sales to other labs never succeeded

FST
 2010 Dec - Approval

NY State Commission on Forensic Science approves FST for use in casework
FST is cleared to be used to evaluate 15 genetic locations (sing. locus; pl. loci) for mixtures of up to 3 people.

FST
 2010 Dec - Approval  2011 Apr - Online

OCME brings FST online for casework

FST
 2010 Dec - Approval  2011 Apr - Online  2011 Apr - Offline

"FST went online for casework in April 2011, following its approval for use by the Commission. Shortly thereafter, also in April 2011, some functions were updated by the programmers and a small, unrelated change was inadvertently made, causing OCME to take FST off-line."
-Florence Hutner, OCME General Counsel, October 18, 2017 letter to
Brian Gestring, Director, Office of Forensic Services, NYS Division of Criminal Justice Services, "Re: Allegations by Legal Aid Society/Federal Defenders of New York to the Honorable Catherine Leahy-Scott, NYS Inspector General (September 1, 2017)"

FST
 2010 Dec - Approval  2011 Apr - Online  2011 Apr - Offline  2011 Apr-Jun - Modifications

For some samples reanalyzed postmodification, likelihood ratio "values were slightly modified as expected."
-Quality Control Test of Forensic Statistical Tool (FST) Version 2.0, June 30, 2011
"Because this modification did not affect the methodology of the program, it did not require submission to the Commission on Forensic Science or the DNA Subcommittee."
-Affidavit of Eugene Lien, OCME Assistant Director, July 17, 2017

FST
 2010 Dec - Approval  2011 Apr - Online  2011 Apr - Offline  2011 Apr-Jun - Modifications  2011 Jul - Online

Following performance checks, FST is reauthorized for casework.

FST
 2010 Dec - Approval  2011 Apr - Online  2011 Apr - Offline  2011 Apr-Jun - Modifications  2011 Jul - Online  2016 Oct - Independent report

Source code provided under protective order in United States v. Kevin Johnson

Reference Evidence

Genetic locations (loci) 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15

Statistical Weight

Lowest is reported

Weight: The Evidence is approximately 70.6 times more probable

Hp:

if the sample originated from Reference profile and two

unknown,

unrelated persons

Hd:

than if it originated from three unknown, unrelated persons.

2010 Validation

157

(non-contributor)





2016 Review

Same data

70.6

(15/15 locations)

=

=

2016 Review

70.6

Same data

(12/15 locations)

A false positive value became less incriminating?
Why we can't tell if this is a good thing -
LR > 1 supports inclusion as a contributor
LR < 1 supports exclusion as a contributor

Removing data at 3 loci that is...

Exclusionary 0.53

3.1 1.3 Inclusionary

FST
 2010 Dec - Approval  2011 Apr - Online  2011 Apr - Offline  2011 Apr-Jun - Modifications  2011 Jul - Online  2016 Oct - Independent report  2017 Jan - Acknowledgement

"FST disregards the information from any locus in a sample if the alleles present at that locus reflect 97% or more of the alleles in the overall population for that locus."
-Assistant US Attorneys, Jan. 2017

FST

 2010 Dec - Approval

ProPoublica and Yale Media Freedom

 2011 Apr - Online

and Information Access Clinic request

 2011 Apr - Offline

that the protective order be vacated.

 2011 Apr-Jun - Modifications

 2011 Jul - Online

OCME does not oppose.

 2016 Oct - Independent report

 2017 Jan - Acknowledgement

Order vacated, reports unsealed, and

 2017 Oct - Protective order vacated code posted by ProPublica:

https://github.com/propublica/nyc-dna-software

Quality Control Test of Forensic Statistical Tool (FST) Version 2.0 - June 2011
First made public in October 2017:
"Twelve samples that were previously evaluated with FST in August 2010 were reevaluated....
Two samples had one locus each that displayed such values [i.e. were removed]."
Only 12/439 mixtures studied in validation were re-evaluated. Only two of those exhibited data-dropping behavior (at one locus each).
In June 2018, records from 16 additional "Quality Control Test" were produced under NY's Freedom of Information Law (FOIL).

checkFrequencyForRemoval()
~70 lines, including comments and whitespace
https://github.com/propublica/nyc-dna-software/blob/master/FST.Common/Comparison.cs#L246

Unfortunately, this is not entirely surprising

Washington v. Emmanuel Fair
In a case involving evidence analyzed by the TrueAllele® system, Mr. Fair's team requested the TrueAllele® source code and development materials in 2016. Responses included...

Washington v. Emmanuel Fair
Declaration of Dr. Mark Perlin, TrueAllele® developer "There is no way to actually use source code in a validation study, which tests the reliability of an executable computer program."

Washington v. Emmanuel Fair
Declaration of Dr. Michael Gorin, Professor of Medicine, UCLA "Since it is essential that one conducts testing with a compiled and operational version of the software, there is no benefit (nor justification) in providing individuals with the source code unless they intend to modify it."

Washington v. Emmanuel Fair
Declaration of Thomas Hebert, DNA Technical Leader for Baltimore Police "In my opinion, I do not believe the source code is necessary for determining the reliability of TrueAllele because source code is not normally used in the validation of software programs for forensic use."

Washington v. Emmanuel Fair
Declaration of Dr. Kevin Miller, former Lab Director of Kern Regional Crime Lab (CA) "In fact, DNA analysts are required by national mandate to have taken only one statistics class and they have no computer science educational requirements. Therefore, this level of mathematics and engineering is above most individuals who work in the field."

Washington v. Emmanuel Fair
Declaration of Dr. Kevin Miller, former Lab Director of Kern Regional Crime Lab (CA) "Moreover, it strikes me has highly irregular that any one particular step in any one particular workflow would suddenly become singled out as an issue for source code revelation. If one is to discuss error in DNA testing, then would one not want to capture an error rate for the entire workflow?"

"If one is to discuss error in DNA testing, then would one not want to capture an error rate for the entire workflow?"
Why would one not?

Magic Grant
 Brown Institute Magic Grant
 Journalism - tell new stories in new ways with technology (General Audience)  Technology Audience  Legal Audience
 Independent, third-party testing  FST testing and FST source code review  Comparison to other probabilistic genotyping systems

What makes independent testing hard?
 Access to executables of the software
 Cost  Sometimes not even sold to individuals or groups outside law enforcement  Difficulty in getting old copies of software  Let alone source code, bug databases, testing plans, design documentation...
 Terms of service that limit publishing of results  Trade secret protection claimed over rights of defendants
 To shield from legitimate questions of quality and fairness more than to protect from competitors?
 Thwarting essential iterative improvement! and accountability to stakeholders beyond buyers
 Need for natural repositories to share results/connect audiences
 How would a defense team connect with experts? someone who found a relevant bug?

We want you to help!

Procurement Phase Wishlist
 When public money used for criminal justice software, require! or at least give credit for:
 Source code  Software artifacts: bug reports, internal testing plans and results, software requirements
and specifications, risk assessments, design documents, etc.  Lack of software standards in traditionally non-computing fields (e.g. DNA)
 No clauses preventing third party review or publishing of defects found  Access to executables for third party testing  Scriptable interfaces to facilitate automated testing
 Bug bounties
 Fund non-profit third party entities to do independent testing!

Be a third-party reviewer
 Criminal justice software that is open source now  DNA: FST and LabRetriever (US); LRmix, LikeLTD and EuroForMix (Europe)  Predictive policing: CivicScape
 Take a look!
 Find bugs or bad code? Please let us know!
 Construct software yourself for alternatives and comparisons
 Many programs have algorithms published - replicate.

Bigger picture
 Black box decision making all around us
 Hiring, housing, how we make friends, find partners, navigate city streets, get our news, ...  The weightier the decision the more crucial it is that we understand and can question it
 US-ACM/EU-ACM Principles for Algorithmic Transparency and Accountability
 Awareness  Access and redress  Accountability  Explanation  Data provenance  Audit-ability  Validation and testing
 Provide the evidence needed to improve systems for all stakeholders so we don't run our society on buggy or even malicious algorithms hidden from view

Our work wouldn't be possible without:

 Legal Aid Society  DNA Unit, especially:  Jessica Goldthwaite  Clint Hughes  Richard Torres  Digital Forensics Unit, especially:  Lisa Brown  Aaron Flores  Shannon Lacey  Brandon Reim  Cynthia Conti-Cook
 Eli Shapiro  Rebecca Wexler, Visiting Fellow at Yale Law
School
 Federal Defenders of New York: Chris Flood,
Sylvie Levine

 Clarkson University  Marzieh Babaeianjelodar  Stephen Lorenz  Abigail Matthews  Anthony Mangiacapra  Graham Northup  Mariama Njie (Iona College, McNair Scholar at Clarkson summer 2018)  COSI/ITL labs
 Data and Society  Dan Krane, Wright State University  The Brown Institute at Columbia University
 Funding provided by a 2018-19 Magic Grant!

