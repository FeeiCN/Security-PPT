Attacks against GSMA's M2M Remote Provisioning
Maxime Meyer1 Elizabeth A. Quaglia2 Ben Smyth3
Vade Secure Inc, France Information Security Group - Royal Holloway, University of London, UK Interdisciplinary Centre for Security, Reliability and Trust, University of
Luxembourg, Luxembourg
6th December, 2017

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

1 Introduction 2 Technical details of remote provisioning 3 Memory exhaustion attack 4 GSMA reaction

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

Evolution of SIMs

MFF2 SIM

1991

1996

2003

2012

2010

Phones

M2M

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

Evolution of SIMs

MFF2 SIM

1991

1996

2003

2012

2010

Phones

M2M

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

Distribution and provisioning of SIMs

MNO : Mobile Network Operator

2

MFF2 SIM 1 Manufacturer

MNO

3

4

Device Manufacturer

Device

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

M2M SIMs suffer from shortcomings
Shortcomings: Physical installation of subscription data by operators. Single subscription data support by a SIM over its lifetime. SIMs change when buried deep inside devices.

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

Next generation SIMs
ETSI (TS 103 383) Smart Cards Embedded UICC Requirement Specification
GSMA (SGP 02) Remote Provisioning Architecture for Embedded UICC

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

Distribution and provisioning of eUICCs

EUM : eUICC Manufacturer

SM : Subscription Manager

1

2

EUM

SM

3

1

SM

5

6

MNO

4

Device Manufacturer

Device

(a) Distribution chain

Device (b) subscription model

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

Subscription Manager: new entity roles
Duties split between two sub-entities Data Preparation: Generates profiles for operators, and transfers them to eUICCs. Secure Routing: Remotely manages eUICCs, and secure communication with them. eUICCs are associated to a single SM-SR which holds data in the EIS file about them.

MNO1 MNO2 MNO3

SM-DP1 SM-DP2

SM-SR

eUICC ISD-R

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

eUICC architecture

ISD-R : SM-SR representative

SM-SR

ISD-P : Profile Container

ECASD : Key Vault

eUICC

ISD-R

ECASD

ISD-P
Provisioning Profile

ISD-P 1

ISD-P n

Operational

...

Operational

Profile 1

Profile n

Architecture relies on GlobalPlatform smart card standard.
Shipped with a Provisioning Profile to enable remote Provisioning.
Is provisioned with Operational Profiles each containing an operator's subscription data.

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

1 Introduction 2 Technical details of remote provisioning 3 Memory exhaustion attack 4 GSMA reaction

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

Profile download and installation flow

MNO

SM-DP

SM-SR

(1) DownloadProfile

(2) GetEIS (3a) CreateISDP

eUICC
(3b) create new ISD-P ISD-P

(4a) Secret key establishment
(4b) Send profile (5)
(5)

APDU messages

Return message

Secure channel between the SM-SR and the ISD-R

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

ISD-P creation flow

SM-DP

SM-SR

eUICC

(1) CreateISDP

ISD-R

(2) opening HTTPS session

Smart Card Framework

(3) ISD-P AID (5)

(4) ISD-P AID new ISD-PAID

(6) updateEIS (7) ISD-P AID

Function command

Function

APDU command Return message

Parameter

Secure channel between the SM-SR and the ISD-R

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

1 Introduction 2 Technical details of remote provisioning 3 Memory exhaustion attack 4 GSMA reaction

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

Error handling during ISD-P creation
GSMA error handling during ISD-P creation Error handling is limited to timeouts, i.e., response messages sent back when the response message from the eUICC is not received in time by the SM-SR.
GSMA error handling once ISD-P is created Specific error handling process.
The SM-DP initiates the process by requesting the SM-SR to delete the ISD-P and relevant data onto the eUICC using ISD-P AID. The SM-SR manages the eUICC to delete the ISD-P.

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

Timeout resulting from lost message

SM-DP

SM-SR

CreateISDP

ISD-R

opening HTTPS session

Smart Card Framework

eUICC

timeout (2)

ISD-P AID (1)

ISD-P AID new ISD-PAID

Return APDU Function and APDU Command Return timeout

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

Flaw based on deletion mechanism
Results of the timeout ISD-P creation status is unknown for the SM-SR. ISD-P is neither associated to an SM-DP nor to an MNO. Memory space has been reserved for the profile on the eUICC.
Deletion mechanism SM-SR cannot delete ISD-P. Only MNO or SM-DP can initiate deletion of ISD-P given that they know the AID of that ISD-P.
Network adversary (i.e., MITM) attack  Drop the return message.

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

Attack motivation and rewards
Attack characteristics Recovery is not possible. Attack trace is minimal. Causes financial loss to operators.
Potential attacker Lonely hacker trying to disrupt service. A adversarial SM-SR or a competitive operator. A business competitor

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

Fixing GSMA's specification
Possible fix ideas: Setup a retry mechanism before the timeout. This will result in a failure message as there is already an ISD-P with the same AID on the eUICC. Authorize deletion by SM-SR. This rely on a trust assumption (not the best idea) and deletion message could be dropped by adversary.
Recommended fix: Create an eUICC internal mechanism to manage ISD-P creation. The mechanism could be an extension of the GlobalPlatform smart card framework.

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

Other attacks against the specification
Attack relying on trust assumptions between network entities. Undersizing memory attack by SM-SR. During profile creation, the SM-SR can deceive the SM-DP into thinking that the eUICC has no remaining memory left for another profile. Inflated profile attack by network operators. Operators or SM-DPs can easily fill the memory of an eUICC with big enough profiles.
Attack relying on lock functionality. Locking profile attacks is made possible for an attacker if the eUICC is not locked to a profile. If the eUICC is locked to a profile, the operator owning the profile can abuse the lock functionality.

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

1 Introduction 2 Technical details of remote provisioning 3 Memory exhaustion attack 4 GSMA reaction

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

Notifying GSMA
We notified GSMA's CVD Programme We also notified GSMA's eSIM working group GSMA acknowledge all the attacks present in the paper GSMA ESIMWI4 is working on a countermeasure (latest SGP02 version 3.2 contains a fix to some of our attacks)
Response We would like to confirm that our remote SIM provisioning experts have acknowledged the existence of the four attacks and confirmed the vulnerabilities have the ability to impact the mobile industry and its customers.

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

Black Hat Sound Bytes
Takeaways An understanding of next generation SIMs and networking technology. An understanding of our attacks and of the importance of attacks against specifications at an early stage. An overview of GSMA vulnerabity disclosure process and an insight to next specifications.
What to do: Companies: Release public specifications as early as possible. Invest into standard verification for standards used in your products. Hackers: Do not only focus on products or websites, also hack specification as they affect all products based on them.

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

Closing remarks
Thanks for listening!
Maxime Meyer1 Elizabeth A. Quaglia2 Ben Smyth3 Vade Secure Inc, France
http://maximemeyer.com/ Information Security Group - Royal Holloway, University of London, UK
https://lizquaglia.wordpress.com/ Interdisciplinary Centre for Security, Reliability and Trust, University of
Luxembourg, Luxembourg https://bensmyth.com/

Maxime Meyer, Elizabeth A. Quaglia, Ben Smyth

Attacks against GSMA's M2M Remote Provisioning

