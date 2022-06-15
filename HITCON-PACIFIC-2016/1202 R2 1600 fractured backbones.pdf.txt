Dmitry Kurbatov Sergey Puzankov Vladimir Kropotov
Fractured Backbones ­ Incidents Detection and Forensics in Telco Networks
ptsecurity.com

About us
Joint research of Incident Response and Telco Security Teams

Introduction

Technologies behind telco networks
        
 

Types of Incidents
· Subscriber location tracking · Call interception (wiretapping) · SMS interception and spoofing · DoS, including balance DoS · Other Fraudulent activities

Phone number +7 777 5555555

GPS location

Incidents statistics. Major threats

Service Disruption Data Leakage Fraud

Percentage of vulnerable networks

Incidents statistics. Data leakage
Subscriber's Balance Disclosure Subscriber's Data Leakage
Terminating SMS Interception Subscriber Location Discovery
Voice Call Interception
Percentage of vulnerable networks

Incidents statistics. Fraud
Terminating Call Redirection Money Transfer via USSD Subscriber Profile Change Originating Call Redirection
Percentage of vulnerable networks

Incident victims
· Mobile operator subscribers · Mobile operator · Other Mobile operators and their subscribers · Third parties (often Banks and Their clients)

Prerequisites of attacks
· Internal intruder or Staff initiated attacks · Level0 (almost) Kiddies - attacks that not require deep
technical knowledge
·SMS fraud as preliminary stage of malware based attacks ·Fraud with social engineering (direct target is victim) ·Proxified fraud with social engineering
· Level1(Locally initiated) - attacks that require technical knowledge about Radio Access Network protocols
·IMSI Catcher ·Bluetooth ·Calls and SMS from the subscriber located nearby
·Level2 (Global impact) - attacks that require technical knowledge about telco infrastructure and protocols

Lightweight scenarios (Level0)

Kiddies fraud examples Typosquatting works well even here
You received 30000 RUB, please follow the link for confirmation

Purchase. Card *1234. Ammount
600 RUB. Drugstore
2000... Available balance 82634.32 RUB

Not legit

Legit

http://journal.tinkoff.ru/declined/

Central bank not only in emails...
Mature player and kiddies used the same brand name
http://www.rbc.ru/finances/17/03/20 16/56e97c089a794797e5b8e6b3

/Cental Bank of Russian Federation/ Your banking cards accounts was suspended! Info: +79649910054

Social engineering telco staff
· Temporary redirect calls and SMS to another number
· Own victim email, social networks accounts, messengers and in some cases Money (Banking OTP TBD)
· Fast WIN

Cases (Level1)

SMS interception

Voice call interception
· Originating call

· Terminating call

Voice call interception. MitM

Level2 Cases (global impact)

Telco infrastructure, technical view

Telco infrastructure, technical view

Telco infrastructure, technical view

Telco infrastructure, technical view

IMSI Disclosure

Money fraud cases
·Infect smartphone with malware. ·Use fake base station (IMSI catcher) and to make software clone of SIM card. ·Conduct an attack via SS7 network forging USSD request.

USSD manipulation Request the balance *100#. Balance is 128.55 Roubles

USSD manipulation *145*xxxxxx81142*10# - Transfer 10 Roubles to the number xxxxxx81142

USSD manipulation Cool security mechanism. Just send *145*851# to confirm the transaction

USSD manipulation New balance is 118.55 Roubles. (10 Roubles ~ 0.15 )

Calls or SMS on behalf particular person located anywhere
· SMS spoofing

More sophisticated attacks

Example

Voice call redirection with a fraudulent activity
Fraud case 1

Voice call redirection with a fraudulent activity

HLR

Billing

GMSC

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity

HLR
RegisterSS (IMSI, CFU, 5312345678) RegisterSS

Billing

GMSC

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity

HLR
RegisterSS (IMSI, CFU, 5312345678) RegisterSS

Billing

GMSC
IAM (A-Number, B-Number)

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity

HLR
RegisterSS (IMSI, CFU, 5312345678) RegisterSS

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity

HLR
RegisterSS (IMSI, CFU, 5312345678) RegisterSS

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity

HLR
RegisterSS (IMSI, CFU, 5312345678) RegisterSS

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

SendRoutingInfo (CFU, 5312345678)

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity

HLR
RegisterSS (IMSI, CFU, 5312345678) RegisterSS

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

SendRoutingInfo (CFU, 5312345678) InitialDP (B-Number, 5312345678) ApplyCharging, Continue

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity

HLR
RegisterSS (IMSI, CFU, 5312345678) RegisterSS

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

SendRoutingInfo (CFU, 5312345678)

InitialDP (B-Number, 5312345678) ApplyCharging, Continue

Cuba
IAM (A-Number, 5312345678)

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Who pays?
HLR
RegisterSS (IMSI, CFU, 5312345678) RegisterSS
26121456789 Zimbabwe

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

SendRoutingInfo (CFU, 5312345678)

InitialDP (B-Number, 5312345678) ApplyCharging, Continue

Cuba
IAM (A-Number, 5312345678)

Number 88612345670 IMSI 466901234567891

Who pays?
HLR
RegisterSS (IMSI, CFU, 5312345678) RegisterSS
26121456789 Zimbabwe

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

SendRoutingInfo (CFU, 5312345678)

InitialDP (B-Number, 5312345678) ApplyCharging, Continue

Cuba
IAM (A-Number, 5312345678)

Number 88612345670 IMSI 466901234567891

Who pays?
HLR
RegisterSS (IMSI, CFU, 5312345678) RegisterSS
26121456789 Zimbabwe

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

SendRoutingInfo (CFU, 5312345678)

InitialDP (B-Number, 5312345678) ApplyCharging, Continue

Cuba
IAM (A-Number, 5312345678)

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity
Fraud case 2

Voice call redirection with a fraudulent activity

HLR

Billing

GMSC

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity

HLR
UpdateLocation (IMSI, Fake MSC/VLR) InsertSubscriberData (Profile)

Billing

GMSC

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity

HLR
UpdateLocation (IMSI, Fake MSC/VLR) InsertSubscriberData (Profile)

Billing

GMSC
IAM (A-Number, B-Number)

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity

HLR
UpdateLocation (IMSI, Fake MSC/VLR) InsertSubscriberData (Profile)

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity

HLR
UpdateLocation (IMSI, Fake MSC/VLR) InsertSubscriberData (Profile)

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity

HLR
UpdateLocation (IMSI, Fake MSC/VLR) InsertSubscriberData (Profile)
ProvideSubscriberInfo (IMSI)

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity

HLR
UpdateLocation (IMSI, Fake MSC/VLR) InsertSubscriberData (Profile)
ProvideSubscriberInfo (IMSI) ProvideSubscriberInfo (Location = Home)

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity

HLR
UpdateLocation (IMSI, Fake MSC/VLR) InsertSubscriberData (Profile)
ProvideSubscriberInfo (IMSI) ProvideSubscriberInfo (Location = Home)

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

SendRoutingInfo (Location = Home)

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity

HLR
UpdateLocation (IMSI, Fake MSC/VLR) InsertSubscriberData (Profile)
ProvideSubscriberInfo (IMSI) ProvideSubscriberInfo (Location = Home)

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

SendRoutingInfo (Location = Home) InitialDP (A-Num, B-Num, Location) ApplyCharging, Continue

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity

HLR
UpdateLocation (IMSI, Fake MSC/VLR) InsertSubscriberData (Profile)
ProvideSubscriberInfo (IMSI) ProvideSubscriberInfo (Location = Home)

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

SendRoutingInfo (Location = Home) InitialDP (A-Num, B-Num, Location) ApplyCharging, Continue
SendRoutingInfo (MSISDN)

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity

HLR
UpdateLocation (IMSI, Fake MSC/VLR) InsertSubscriberData (Profile)
ProvideSubscriberInfo (IMSI) ProvideSubscriberInfo (Location = Home)

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

SendRoutingInfo (Location = Home) InitialDP (A-Num, B-Num, Location) ApplyCharging, Continue
SendRoutingInfo (MSISDN)

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity

HLR
UpdateLocation (IMSI, Fake MSC/VLR) InsertSubscriberData (Profile) ProvideSubscriberInfo (IMSI) ProvideSubscriberInfo (Location = Home)
ProvideRoaminNumber (IMSI)

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

SendRoutingInfo (Location = Home) InitialDP (A-Num, B-Num, Location) ApplyCharging, Continue
SendRoutingInfo (MSISDN)

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity

HLR
UpdateLocation (IMSI, Fake MSC/VLR) InsertSubscriberData (Profile) ProvideSubscriberInfo (IMSI) ProvideSubscriberInfo (Location = Home)
ProvideRoaminNumber (IMSI) ProvideRoamingNumber (MSRN = 5312345678)

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

SendRoutingInfo (Location = Home) InitialDP (A-Num, B-Num, Location) ApplyCharging, Continue
SendRoutingInfo (MSISDN)

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity

HLR
UpdateLocation (IMSI, Fake MSC/VLR) InsertSubscriberData (Profile) ProvideSubscriberInfo (IMSI) ProvideSubscriberInfo (Location = Home)
ProvideRoaminNumber (IMSI) ProvideRoamingNumber (MSRN = 5312345678)

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

SendRoutingInfo (Location = Home) InitialDP (A-Num, B-Num, Location) ApplyCharging, Continue
SendRoutingInfo (MSISDN)

SendRoutingInfo (MSRN = 5312345678)

26121456789 Zimbabwe

Number 88612345670 IMSI 466901234567891

Voice call redirection with a fraudulent activity

HLR
UpdateLocation (IMSI, Fake MSC/VLR) InsertSubscriberData (Profile) ProvideSubscriberInfo (IMSI) ProvideSubscriberInfo (Location = Home)
ProvideRoaminNumber (IMSI) ProvideRoamingNumber (MSRN = 5312345678)
26121456789 Zimbabwe

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

SendRoutingInfo (Location = Home) InitialDP (A-Num, B-Num, Location) ApplyCharging, Continue
SendRoutingInfo (MSISDN)

SendRoutingInfo (MSRN = 5312345678)

Cuba

IAM (A-Number, 5312345678)

Number 88612345670 IMSI 466901234567891

Who pays?
HLR
UpdateLocation (IMSI, Fake MSC/VLR) InsertSubscriberData (Profile) ProvideSubscriberInfo (IMSI) ProvideSubscriberInfo (Location = Home)
ProvideRoaminNumber (IMSI) ProvideRoamingNumber (MSRN = 5312345678)
26121456789 Zimbabwe

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

SendRoutingInfo (Location = Home) InitialDP (A-Num, B-Num, Location) ApplyCharging, Continue
SendRoutingInfo (MSISDN)

SendRoutingInfo (MSRN = 5312345678)

Cuba

IAM (A-Number, 5312345678)

Number 88612345670 IMSI 466901234567891

Who pays?
HLR
UpdateLocation (IMSI, Fake MSC/VLR) InsertSubscriberData (Profile) ProvideSubscriberInfo (IMSI) ProvideSubscriberInfo (Location = Home)
ProvideRoaminNumber (IMSI) ProvideRoamingNumber (MSRN = 5312345678)
26121456789 Zimbabwe

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

SendRoutingInfo (Location = Home) InitialDP (A-Num, B-Num, Location) ApplyCharging, Continue
SendRoutingInfo (MSISDN)

SendRoutingInfo (MSRN = 5312345678)

Cuba

IAM (A-Number, 5312345678)

Number 88612345670 IMSI 466901234567891

Who pays?
HLR
UpdateLocation (IMSI, Fake MSC/VLR) InsertSubscriberData (Profile) ProvideSubscriberInfo (IMSI) ProvideSubscriberInfo (Location = Home)
ProvideRoaminNumber (IMSI) ProvideRoamingNumber (MSRN = 5312345678)
26121456789 Zimbabwe

Billing

GMSC

SendRoutingInfo (MSISDN)

IAM (A-Number, B-Number)

SendRoutingInfo (Location = Home) InitialDP (A-Num, B-Num, Location) ApplyCharging, Continue
SendRoutingInfo (MSISDN)

SendRoutingInfo (MSRN = 5312345678)

Cuba

IAM (A-Number, 5312345678)

Number 88612345670 IMSI 466901234567891

Thank you!
ptsecurity.com

