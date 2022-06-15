2019

4G/LTE
Seeker


CONTENTS

01
PART 01


02

03

PART 02

PART 03

 

04
PART 04


05
PART 05


PART 01 


·  ·  · 
· 70772177 · CallsignBD4ET

PART 02 



3GPP Releases
Era Services
Devices

1G
1980s Analog Voice

2G

3G

4G

5G

4-7

8-9, 10-14

15, 16

1990s
Digital Voice, Messages

2000s

2010s

2020s

WB Voice, Voice, Video, Everything Packet Data Internet,
Apps

Data Rate

0

Delay

100 kbps (GPRS)
500 ms

10 Mbps (HSPA)
100 ms

100+ Mbps (LTE/LTE-A)
10s ms

10 Gbps (NR)
5 ms


· 
·  ·  · 
· 
· 
· 
· Fuzz


·  
·  
·  

----
· FOSS+SDR
· FOSS
· 
·  ·  · 
· UE · 5G
· 2020

LTE

NAS

S1-MME S1AP

  

SCTP IP
L1/L2



NAS

RRC

PDCP

RLC

UE

MAC

eNB

PHY

Uu

Data GTP-U UDP
IP L1/L2
S1-U

MME
Sig GTP-C UDP
IP L1/L2

S6a
Diameter SCTP/TCP
IP L1/L2
S11
Data Sig

GTP-U/GTP-C

SGW

UDP IP
L1/L2
S5/S8

HSS RCPF

Diameter SCTP/TCP
IP L1/L2
PGW

Gx
Data IP
L1/L2
SGi

PDNIMS Internet

LTE
· UE:
· FOSS UE: PC Notebook + Ubuntu + srsUE/OAIUE + SDR ( USRP B210/X310 ) · COTS UE: Android phone, iOS iPhone, 4G modem
· eNodeB:
· FOSS eNodeB: PC Server + Ubuntu + OAI/srsLTE + SDR ( USRP B210/X310 ) · COTS eNodeBHuawei BBU3910 + pRRU3912 + RHUB3908 + ETP48100 · COTS HeNBZTEEricssonComba
· EPC:
· FOSS EPC: PC Server + Ubuntu + OpenAir-CN/srsEPC/NextEPC + Kamailio/OpenIMS/Clearwater
· SeGW:
· FOSS IPSec Server: PC Server + Ubuntu + Strongswan
· ACS:
· FOSS ACS: PC Server + Ubuntu + GenieACS

LTE/4G
· EPC: Gigabyte Brix i7-5500, 16G RAM · eNodeB/RRU:
· UP Board + USRP B210/B200mini · ThinkPad T440s + bladeRF/LimeSDR
· UE: Samsung, iPhone, OnePlus, ZTE, etc.

2G,3G,4G
13



GTP

GPRS Tunneling Protocol UDP 

GTP-C/GTP-U

GTP-C/GTP-U

UDP

UDP

IP

IP

L2

L2

L1

L1

S1-U/S3/S4/S11/S12





 Echo Request



Echo Response Create Bearer Request

Create Bearer Response

Modify Bearer Request

Modify Bearer Response

Delete Bearer Request

Delete Bearer Response  Identification Request

Identification Response


PGW->SGW, SGW->MME/S4-SGSN MME/S4-SGSN->SGW, SGW->PGW MME/S4-SGSN->SGW, SGW->PGW PGW->SGW, SGW->MME/S4-SGSN PGW->SGW, SGW->MME/S4-SGSN MME/S4-SGSN->SGW, SGW->PGW MME/SGSN->MME/SGSN MME/SGSN->MME/SGSN

S1-AP1

SCTPMMES1-MME   S1 Paging function S1 UE Context Management function Initial Context Setup Function UE Context Modification Function Mobility Functions for UEs in ECM-CONNECTED E-RAB Service Management function NAS Signalling Transport function NAS Node Selection Function S1-interface management functions MME Load balancing Function Location Reporting Function Warning Message Transmission function Overload Function RAN Information Management Function S1 CDMA2000 Tunnelling function Configuration Transfer Function LPPa Signalling Transport function

S1-AP SCTP
IP L2 L1

S1-AP SCTP
IP L2 L1

S1-MME

S1-AP2

Elementary Procedure:
Handover Preparation Handover Resource Allocation
Path Switch Request
Handover Cancellation
SAE Bearer Setup SAE Bearer Modify SAE Bearer Release
Initial Context Setup
Reset S1 Setup UE Context Release UE Context Modification
eNB Configuration Update

Initiating Message:

Successful Outcome: Response message:

Unsuccessful Outcome: Response message:

HANDOVER REQUIRED

HANDOVER COMMAND

HANDOVER REQUEST

HANDOVER REQUEST ACKNOWLEDGE

PATH SWITCH REQUEST

PATH SWITCH REQUEST ACKNOWLEDGE

HANDOVER CANCEL

HANDOVER CANCEL ACKNOWLEDGE

SAE BEARER SETUP REQUEST

SAE BEARER SETUP RESPONSE

SAE BEARER MODIFY REQUEST SAE BEARER MODIFY RESPONSE

SAE BEARER RELEASE COMMAND

SAE BEARER RELEASE COMPLETE

INITIAL CONTEXT SETUP REQUEST

INITIAL CONTEXT SETUP RESPONSE

RESET

RESET ACKNOWLEDGE

S1 SETUP REQUEST

S1 SETUP RESPONSE

UE CONTEXT RELEASE COMMAND UE CONTEXT RELEASE COMPLETE

UE CONTEXT MODIFICATION REQUEST

UE CONTEXT MODIFICATION RESPONSE

ENB CONFIGURATION UPDATE

ENB UPDATE CONFIGURATION

HANDOVER PREPARATION FAILURE HANDOVER FAILURE PATH SWITCH REQUEST FAILURE
INITIAL CONTEXT SETUP FAILURE S1 SETUP FAILURE UE CONTEXT MODIFICATION FAILURE ENB CONFIGURATION UPDATE

S1-AP3

Elementary Procedure
Handover Notification SAE Bearer Release Request Paging Initial UE Message Downlink NAS Transport Uplink NAS Transport NAS non delivery indication Error Indication UE Context Release Request DownlinkS1 CDMA2000 Tunneling Uplink S1 CDMA2000 Tunneling UE Capability Info Indication eNB Status Transfer MME Status Transfer Deactivate Trace Trace Start Trace Failure Indication Location Reporting Control Location Reporting Failure Indication Location Report

Message
HANDOVER NOTIFY SAE BEARER RELEASE REQUEST PAGING INITIAL UE MESSAGE DOWNLINK NAS TRANSPORT UPLINK NAS TRANSPORT NAS NON DELIVERY INDICATION ERROR INDICATION UE CONTEXT RELEASE REQUEST DOWNLINK S1 CDMA2000 TUNNELING UPLINK S1 CDMA2000 TUNNELING UE CAPABILITY INFO INDICATION eNB STATUS TRANSFER MME STATUS TRANSFER DEACTIVATE TRACE TRACE START TRACE FAILURE INDICATION LOCATION REPORTING CONTROL LOCATION REPORTING FAILURE INDICATION LOCATION REPORT

Diameter

DiameterSCTPAAA



DiameterPGWPCRFQos

DiameterMMEHSS





HSSMME

HSS

HSSMME

MMEHSSMM

APNP-GWMMEHSS



Diameter

Diameter

 Update-Location-Request

  ULR 316

SCTP

SCTP

Update-Location-Answer

ULA 316

IP

IP

Cancel-Location-Request

CLR 317

L2

L2

Cancel-Location-Answer

CLA 317

L1

L1

Authentication-Information-Request Authentication-Information-Answer

AIR 318 AIA 318

S6a/Gx

Insert-Subscriber-Data-Request Insert-Subscriber-Data-Answer

IDR 319 IDA 319




· 5G ·  · 

backhaul
·  ·  · 


·  ·  · 


·  ·  ·  ·  · Modem · OTA · WiFi/BT · SIM · IPv6 · WiFi

4G/LTE
· 
·  ·  · 
· 
· 
· LTE+aLTEr · SigOver
· 
· +Netfilter · Hacking Box of S1

LTEAir Interface
· LTE Relay ·  · User Plane · SigOver · EIA0 · + · FemtoCell · RRC

UE
· UE sends RRC connection request (with TMSI) · C-RNTI used to filter out this specific request · Find uplink transmission with the corresponding C-RNTI · Match the C-RNTI and the TMSI

DNS

1.

LTE



2.



3.

ZUCAES-CTRXOR

4.

LTEDNSDNSDNS



5.

DNSIPDNS



1.

TACPCI

2.

UESubframe

3.

Signal Overwrite

4.



5.



SigOver

LTE
· 
· Sniffing//SIM
· 
· Femto Cell/Small Cell/ · LTE Relay+/EIA0
· 
· SigOver

RAN
· eNodeB
·  · LMT · 
· HeNB
·  · root · Firmware
· 
· IPSec · 




· 
· Small Cell = Pico Cell + Femto Cell

Macro Cell


· BBU · WiFi2 Pro · GPD Win

PART 03 

Femto Cell

Small Cell
· 5G · 4G150 · 5GWiFi · 

--
· SMS over NAS

--
· SMS over IMS

--VoLTE
· SIP AMR

--
· GTP-U

--
· IMSI · VoLTE
· MSISDN · IMEI · Cell-ID · IP
·  · IMSI Catcher

LTEPicoCellENC-nRBS01

ENC-nRBS01

LTEPicoCellENB-35

ENB-35

LTEPicoCellBS8102

BS8102

LTEPicoCellBTS3203

LTEPicoCellfbs3211/3221

FemtoCell1

· 
· GSMHNB-10
· TD-SCDMAHNB-33HN1200
· TD-LTEBS8102 T2300ENB-35BTS3203fBS3211 ENC-nRBS01BSNAP-300\LNC-2000E SeNB2001

FemtoCell2

· 
· WCDMAUAP2105/UAP2816/UAP2835/ePico3801/ePico3802 · FDD LTEBS8102 L1800/L2100

FemtoCell3
· 
· CDMAePico3680 · FDD LTEBS8102 L1800

Root FemtoCell
· 3G/4G FemtoCell
· SeGW/SIMFemtoCellFirmware
· root · IPSec ·  ·  · 

Root FemtoCell(1)
·  · CP2102 ·  · SEGGER J-Link · 

Root FemtoCell(2)
· BUS Pirate · JTAGulator · NAND/NOR Flash  +TSOP48/56

Root FemtoCell

·

TR-069GenieACSXACS

·

Firmware/Firmware

·

/

·

IDA ProGhidra

·

QEmu

·

OpenOCD

·

Binwalk

·

firmware-mod-kit

·




· 
·  · CPU · IPSec
· 
· IPSecIPSec ·  ·  · DNSIP


·  · 12V · 
· WiFi
· RJ-45WiFi2 Pro
· 
· 

PART 04 

Backhaul
· xPONGPON, EPON
· ONU
· PTNIP RAN ·  · 
· Internet
· 


· GTP-U · SCTP
· S1-APeNodeBMME
· HTTP · IPSeceNodeBSeGW

LTE

Communicating Nodes

Source

Destination

Protocol

eNodeB

S-GW

GTP-U/UDP

S-GW

eNodeB GTP-U/UDP

eNodeB

eNodeB GTP-U/UDP

eNodeB

MME

S1AP/SCTP

MME

eNodeB S1AP/SCTP

eNodeB

eNodeB X2AP/SCTP

Protocol Ports

Source 2152 2152 2152 36412 36412 36412

Destination 2152 2152 2152 36412 36412 36412


· IPSec
· 3GPP TS 33.401: In case the S1 management plane interfaces are trusted (e.g. physically protected), the use of protection based on IPsec/IKEv2 or equivalent mechanisms is not needed
· ONU · IPSec


·  · GTP-UVoLTE · S1APSMS over NAS · 


· GTP-U · TEID · MEC


· S1-AP · SCTP · SCTP

Hacking Box of S1
·  · USIM · 4G · 12V · S1

Hacking Box of S1
· 
·  · eNodeB · eNodeB · IPSec
· 
·  · eNodeBMMEIPHBOSIP · S1-APeNodeB · SCTPeNodeB1eNodeB · IPSec

Demo

PART 05 


·  · 


Seeker

