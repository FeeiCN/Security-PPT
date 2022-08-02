SESSION ID: IDY-F03
Are Spoof-Proof Biometrics Really Possible?

Dr. Stephanie Schuckers Director, Center for Identification Technology Research (CITeR)
Paynter-Krigman Professor in Engineering Science, Clarkson University

#RSAC

Authentication Technology Landscape
Biometric Presentation Attacks (Methods, Framework) Next Gen Technology (The role of liveness in detection)
Benchmarking (Competitions, Datasets)
Standards & Requirements (ISO, platforms)
Certification (FIDO, Common Criteria)

#RSAC
Before We Begin: Vocabulary
Presentation Attacks
­ Presentation of an artefact or human characteristic to the biometric capture subsystem in a fashion that could interfere with the intended policy of the biometric system*
­ Spoofs, artefacts, altered biometrics, non-conformance, obfuscation
Presentation Attack Detection
­ Examples: liveness detection, altered fingerprint detection, anti-spoofing
*ISO/IEC CD 30107-1, Information Technology -- Biometrics -- Presentation Attack Detection

#RSAC

THE WORLD HAS A PASSWORD PROBLEM

81%
Data breaches in
2016 that involved weak, default, or stolen passwords1

65%
Increase in phishing attacks over the
number of attacks recorded in 20152

1,579
Breaches in 2017, a 45% increase over 20163

CLUMSY | HARD TO REMEMBER | NEED TO BE CHANGED ALL THE TIME
1Verizon 2017 Data Breach Report |2Anti-Phishing Working Group | 3Identity Theft Resource Center 2017
4

#RSAC
What Can You Do with a Stolen Password?

1. Find any computing device 2. Type in password

Username Password

Easily Scalable

Traditional Username & Password
5

#RSAC
The rise of biometrics
Biometrics can improve security and provide a positive user experience, but be conscious of potential weaknesses
6

#RSAC
What Can You Do with a Stolen Fingerprint?

1. Convert fingerprint to digital image 2. Clean and invert image to create mask 3. Etch or print 3D mold 4. Add material to create cast, i.e. spoof 5. (If locally stored biometric), steal users specific computing device associated with the stolen fingerprint
Not Easily Scalable
7

Please provide your fingerprint.
Fingerprint Reader

#RSAC
Conventional Wisdom on the Weaknesses of Biometrics
Biometrics cannot be changed Biometrics are not secret

#RSAC
Mitigation of Weaknesses of Biometrics

Ensure that biometric information cannot be inserted beyond the sensor
Ensure that biometric was measured from the live, authorized individual at that time/place

Locally Stored Biometric Templates,
Security
Presentation Attack
Detection

#RSAC
Spoofing: Don't Believe the Hype

#RSAC
Spoofing: But there are practical concerns

January 2, 2009

March 12, 2013

March 15, 2018

#RSAC
Lab-controlled Spoofing
12

#RSAC
Lab-controlled Spoofing

Latex

Wood Glue
13

Authentication Technology Landscape
Biometric Presentation Attacks (Methods, Framework) Next Gen Technology (The role of liveness in detection)
Benchmarking (Competitions, Datasets)
Standards & Requirements (ISO, platforms)
Certification (FIDO, Common Criteria)

#RSAC
Production of Biometric Presentation Attack (Spoof)
Production of spoof requires two things
­ (1) Source of biometric characteristic you are replicating ­ (2) Process for creating the spoof

#RSAC
Source of Biometric

Cooperative ­Captured directly from individual with assistance (e.g. finger mold, face mask)
Latent--Captured indirectly through latent sample (e.g. latent fingerprint, hair, skin)
Recording--Captured directly from individual onto media (e.g. photograph, video recording)
Template Regeneration
Synthetic­Not mapped to real person (e.g. synthetic fingerprint, iris, wolf sample)
Impersonation--Conversion of natural characteristic to another individual's with artificial assistance (e.g. computer assisted voice)

Feng and Jain, Advances in Biometrics article, 2009.

ISO/IEC CD 30107, Information Technology -- Biometrics -- Presentation Attack Detection, Part 3, Table A.1

16

#RSAC
PRODUCTION OF SPOOF
Molds, casts, masks, direct renderings and digital media

Seelen, "Countermeasures Against Iris Spoofing with Contact Lenses," Iridian Technologies Inc.

Thalheim, et al, C'T article, 2002.

Schuckers, et al, 2002.

Lefohn, et al, IEEE Computer Graphics & Applications article, 2003.

#RSAC
18

Spoof Creation with Transparency
Uncooperative Lifted latent print, stolen fingerprint image Fingerprint mask generation Print on transparent film Expose negative photosensitive silicon wafer Develop to form cast Pour silicone or other liquid material to form mold

#RSAC
Spoof Creation with 3D Printer
From fingerprint image, create 3D representation of fingerprint Since most 3D printers use rigid materials, print mold Create spoofs using mold with traditional materials (e.g. gelatin)

Authentication Technology Landscape
Biometric Presentation Attacks (Methods, Framework) Next Gen Technology (The role of liveness in detection)
Benchmarking (Competitions, Datasets)
Standards & Requirements (ISO, platforms)
Certification (FIDO, Common Criteria)

#RSAC
"It is `liveness', not secrecy, that counts." Denning, Information Security Magazine, 2001

Fingerprint PAD

Thousands of academic papers in this area!
Hardware-based ­ Temperature, pulse, blood pressure, odor,
electrocardiogram, multispectral imaging, spectroscopy, ultrasound, electrical characteristics
Software-based ­ Skin deformation, elasticity, pores,
perspiration pattern, power spectrum, noise residues in valleys

Qualcomm

#RSAC

Fingerprint Cards

Morpho

Lumidigm

Dermalog

Iris PAD
Hardware-based: ­ Specular reflections, eye movements (e.g.,
saccades), spontaneous and stimulated pupil size changes, 3D properties (flat iris vs convex textured contact lens), thermal-based features, multi-spectral (melanin absorption as a function of the wavelength vs light absorption by artifacts)
Software-based: ­ Texture patterns, pixelization, spatial frequency
analysis, iris image quality features, deeplearning-based solutions

#RSAC
Iritech Mobile Solution IrisGuard AD100

#RSAC
iPhone X - Face
"To counter both digital and physical spoofs, the TrueDepth camera randomizes the sequence of 2D images and depth map captures, and projects a device-specific random pattern." *
"An additional neural network that's trained to spot and resist spoofing defends against attempts to unlock your phone with photos or masks." *
*FaceID Security Guide, 2017, https://www.apple.com/business/site/docs/FaceID_Security_Guide.pdf

Authentication Technology Landscape
Biometric Presentation Attacks (Methods, Framework) Next Gen Technology (The role of liveness in detection)
Benchmarking (Competitions, Datasets)
Standards & Requirements (ISO, platforms)
Certification (FIDO, Common Criteria)

#RSAC
Competitions for Benchmarking

Liveness Detection Competitions

­ Sense of the State of the Art in the Field

­ Publically available databases to support R&D (even after competitions)

­ Co-host: Fingerprint--Clarkson U & U of Cagliari;

­

Iris--Clarkson U, Notre Dame University & Warsaw U of Technology, WVU, IIIT-Delhi

· LivDet 2009
­ Fingerprint Algorithms

· LivDet 2011
­ Fingerprint Algorithms ­ Fingerprint Systems
http://livdet.org

· LivDet 2013, 2015, 2017
­ Fingerprint Algorithms ­ Fingerprint Systems ­ Iris Algorithms

#RSAC
LivDet over the years (Fingerprint)

Average of APCER and BPCER for top two p*erformers across all databases tested in LivDet competitions hosted 2009, 2011, 2013, 2015, 2017.

Ghiani, L., Yambay, D.A., Mura, V., Marcialis, G.L., Roli, F. and Schuckers, S.A., 2017. Review of the Fingerprint Liveness Detection (LivDet) competition series: 2009 to 2015. Image and Vision Computing, 58, pp.110-128.

*Crossmatch removed

#RSAC
Results on LivDet data (after test set release) *Sampling of papers
2.33%
ACE: Average Classification Error Rate

Authentication Technology Landscape
Biometric Presentation Attacks (Methods, Framework) Next Gen Technology (The role of liveness in detection)
Benchmarking (Competitions, Datasets)
Standards & Requirements (ISO, platforms)
Certification (FIDO, Common Criteria)

#RSAC
ISO Standards for PAD
ISO/IEC CD 30107, Information Technology -- Biometrics -- Presentation Attack Detection
­ Part 1 2016 ­ Part 2 2016 ­ Part 3 2017
PAD sub-system metrics:
­ Attack Presentation Classification Error Rate (APCER) ­ Spoof ­ Bonafide Presentation Classification Error Rate (BPCER) - Live
Performance metrics ­ False non-match rate, false match rate ­ AND imposter attack presentation match rate Tradeoff between the three
30

#RSAC
Industry Requirements
Microsoft Windows Hello biometric requirements
­ FAR < 0.002%. ­ Effective, real world FRR with antispoofing or liveness detection <10%.
Google
­ "MUST have a false acceptance rate not higher than 0.002%. ­ [SR] Are STRONGLY RECOMMENDED to have a spoof and imposter acceptance rate
not higher than 7%. ­ [C-1-5] MUST rate limit attempts for at least 30 seconds after five false trials for
fingerprint verification."
Windows Hello biometrics requirements, 05/01/2017, Accessed 9/26/2018. https://docs.microsoft.com/en-us/windows-hardware/design/device-experiences/windows-hello-biometric-requirements
Compatibility Definition, Android 9, August 8, 2018, Google, Accessed 9/26/2018. https://source.android.com/compatibility/android-cdd.pdf

Authentication Technology Landscape
Biometric Presentation Attacks (Methods, Framework) Next Gen Technology (The role of liveness in detection)
Benchmarking (Competitions, Datasets)
Standards & Requirements (ISO, platforms)
Certification (FIDO, Common Criteria)

#RSAC
Spoofing and Relative "Difficulty"

How difficult is create a spoof?

How much time/money? How much expertise/skill?

Easy to Create

Difficult to Create

Photo from internet

Cooperative Mold/Cast

Template to Spoof

#RSAC

Spoofing and Relative "Observability"

How difficult is it to capture the biometric from an individual without their knowledge?

From a distance? Over the internet?

Requirements for liveness detection higher if biometric is more "observable"

Easy to Observe

Difficult to Observe

Face

Voice

Finger

Vein ?

34

Certification
BSI Certification based on Common Criteria ­ Morpho 2013 ­ Dermalog 2018

#RSAC
e.g., "Morpho, Common Criteria Certification for Fake Finger Detection", July 2013

Fingerprint Spoof Detection Protection Profile based on Organizational Security Policies (FSDPP_OSP), Version 1.7, 27 November 2009, BSI-CC-PP-0062-2010
BSI issues Common Criteria certificate for DERMALOG fingerprint scanner, Aug 23, 2018 https://www.bsi.bund.de/DE/Presse/Kurzmeldungen/Meldungen/CC-Zertifikat-Dermalog-220818.html

#RSAC

New!

FIDO Alliance Biometric Certification Program
(Mobile)

A

l

l R i

HOW DOES FIDO WORK?

g

h

t

s

R

e

s

e

r

v

e

d

|

F I

User verification

Authenticator

D

O

A

l

l

i

Require user gesture

Private key (handle)

a

before private key can

per account

n c

be used

e

|

C

o

p

y

r

37

i

Challenge
FIDO Authentication

(Signed) Response

Public key

#RSAC

#RSAC
FIDO IS "HIGH-ASSURANCE STRONG AUTHENTICATION"

High-assurance strong authentication =
ü Use of two + factors ü At least one leverages public key cryptography ü Not susceptible to phishing, man-in-the-middle
and/or other attacks targeting credentials

38 All Rights Reserved | FIDO Alliance | Copyright 2018

Javelin Strategy & Research, 2017 State of Authentication Report

FIDO Certification Purpose
The FIDO Biometric Certification Program is intended to certify biometric components and/or subsystems and is independent from Authenticator Certification Program.
39
All Rights Reserved | FIDO Alliance | Copyright 2018

#RSAC

#RSAC
FIDO Biometric Component Certified
Feb. 23, 2019
40

#RSAC
BIOMETRIC PERFORMANCE REQUIREMENTS
· Evaluation framework and certification program ­ Independent Laboratory Verification of Vendor Claims
· References ISO Standards · 19795 Biometric performance testing and reporting · 30107 Presentation attack detection
· Testing plan focuses on: · Consistent set of tests for different implementations under test submitted by vendors · Supporting different modalities of biometrics · False accept rate (FAR) · False reject rate (FRR) · Imposter attack presentation match rate (IAPMR) (artefact success rate)
· Testing program will be implemented by approved third party testing laboratories (accredited by FIDO Alliance)
41
All Rights Reserved | FIDO Alliance | Copyright 2018

#RSAC
PAD Requirements
"PAD Light"... Provide guidelines for testing low level spoof attacks (those which require minimal expertise) Testing performed on biometric sub-system provided by vendor Measures Imposter Attack Presentation Match Rate (IAPMR)
 IAPMR: Proportion of presentation attacks in which the target reference is matched. From ISO 30107 Part 3
 Each spoof type measured separately
Attacks triaged into levels
 Low level attacks require less time/knowledge/equipment  Testing will only include "known" attacks  "Unknown" attacks reserved for future certification
Evaluation Process
 Each subject enrolled as non-artifact  Testing with at least 10 PAI species* per enrolled subject  "Unknown" attacks reserved for future certification
.
*Presentation Attack Instrument (PAI) -Biometric characteristic or object used in a presentation attack PAI Species - Class of presentation attack instruments created using a common production method and based on different biometric characteristics (ISO/IEC 30107-3)
42 All Rights Reserved | FIDO Alliance | Copyright 2018

3

/
8 Spoof Type Triaged by Attack Potential

/

1 9

Level A

Time: <1 day

Expertise: layman

Equipment: standard

Fingerprint
paper printout, direct use of latent print on the scanner

Source of biometric characteristic: easy to obtain

lift of fingerprint off the phone

Level B Time: <7 days Expertise: proficient Equipment: standard, specialized

fingerprints made from artificial materials such as gelatin, silicon.

Source of biometric characteristic: moderate
Level C Time: >7days Expertise: expert(s) Equipment: specialized. bespoke

Lift of latent print from elsewhere, stolen fingerprint
image
Cooperative molds - out of scope
3D printed spoofs

Face paper printout of face image, mobile phone display of face photo photo from social media
paper masks, video display of face (with movement and blinking)
video of subject, high quality photo
silicon masks, theatrical masks,

Iris/Eye
paper printout of iris image, mobile phone display of iris photo
photo from social media
video display of an iris (with movement /blinking); paper
printout w/ contact lens/doll eye
video of subject, high quality photo
contacts lens or prosthetic with a specific pattern

#RSAC
Voice replay of audio
recording
recording of voice
replay of audio recording of specific
passphrase, voice mimicry
recording of voice of specific phrase
voice synthesizer

Source of biometric characteristic: difficult

3D fingerprint information from 3D face information from

subject

subject

high quality photo in Near IR

multiple recordings of voice to train synthesizer

43
All Rights Reserved | FIDO Alliance | Copyright 2018

What's Next?

#RSAC
Challenges
Adoption of Biometric Certification ­ Certification program is relatively new (Fall 2018) ­ Need to drive adoption ­ Ask if biometric products are certified Address Zero-Day Attacks ("Unknown" attacks) ­ Part of LivDet evaluations ­ Focus of USA IARPA Odin effort ­ Expected to become part of future FIDO
biometric certification
USA, IARPA Odin Program, https://www.iarpa.gov/index.php/researchprograms/odin

Authentication Technology Landscape
Biometric Presentation Attacks (Methods, Framework) Next Gen Technology (The role of liveness in detection)
Benchmarking (Competitions, Datasets)
Standards & Requirements (ISO, platforms)
Certification (FIDO, Common Criteria)

#RSAC
Apply what you have learned today
Next week you should:
­ Identify applications of biometric recognition in your organization ­ Determine if biometric templates are locally stored ­ Explore authentication based on locally stored biometrics (e.g. FIDO)
In the first three months following this presentation you should:
­ Understand security risks associated with presentation attacks for your organization
­ Define appropriate biometric requirements for organization or product
Within six months you should:
­ Adopt authentication based on locally stored biometrics which your organization's requirements
­ Require vendors to have completed biometric certification
47

#RSAC
1993
Peter Steiner, The New Yorker, July 5, 1993
48

#RSAC
2015
Kaamran Hafeez, The New Yorker, February 23, 2015
49

20??
Can we have it all?
Identity technologies without revealing private data

#RSAC
50

Questions?
Thank you!
51

