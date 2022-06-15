 CSA CCM CSA CAIQ v3.1

 

01 2020-09-30



 ©  2020   

 
   
 





 518129



https://www.huawei.com

 support@huawei.com

 4008302118

 01 (2020-09-30)

 © 

i

 CSA CCM CSA CAIQ v3.1

 

 
1 ..............................................................................................................................................1
1.1 ...................................................................................................................................................................................... 1 1.2 ...................................................................................................................................................................................... 1 1.3 ...................................................................................................................................................................................... 1
2 CSA CCM ............................................................................................................................3
2.1 CSA CCM ................................................................................................................................................. 3 2.2 CSA CCM  CAIQSTAR ............................................................................................................................... 4 2.3 .................................................................................................................................................................... 4
3  CSA CAIQ .......................................................................................................... 7
3.1 AIS ........................................................................................................................................................ 7 3.2 AAC ........................................................................................................................................................ 10 3.3 BCR ....................................................................................................................................... 12 3.4 CCC .................................................................................................................................................... 17 3.5 DSI .................................................................................................................................... 19 3.6 DCS ................................................................................................................................................................. 23 3.7 EKM ............................................................................................................................................................ 25 3.8 GRM ........................................................................................................................................................... 28 3.9 HRS ................................................................................................................................................................. 33 3.10 IAM ...........................................................................................................................................................38 3.11 IVS ............................................................................................................................................... 47 3.12 IPY ........................................................................................................................................................ 55 3.13 MOS ...................................................................................................................................................................... 58 3.14 SEF .........................................................................................................................63 3.15 STA ..................................................................................................................................... 65 3.16 TVM ..................................................................................................................................................... 70
4 ........................................................................................................................................... 73
5 ....................................................................................................................................74

 01 (2020-09-30)

 © 

ii

 CSA CCM CSA CAIQ v3.1

1 

1 

1.1  1.2  1.3 

1.1 


1.2 
Cloud Security Alliance Cloud Control Matrix CSA CCM 
CSA CCM----CSA STAR CAIQ 
 CSA CCMCAIQ
 CAIQ

1.3 
  
 Cloud Security Alliance 
 BSI 
 CSA CCMCCM  

 01 (2020-09-30)

 © 

1

 CSA CCM CSA CAIQ v3.1

1 

 CSA CAIQCAIQ IaaSPaaSSaaS Yes/No (CSA CCM)
 CSA STARBSI STARSecurityTrustAssurance RiskCSA CCMISO 27001 
 ISO 27001  ISO 27002ISO 27001 
 ISO 27017 ISO 27001ISO 27002  
 ISO 27701 ISO 27001 ISO 27002  
 ISO 22301    
 SOCAICPA 
 PCI DSS VISAJCB PCI DSS PCI DSS
 PCI 3DS3DS3DS3DS 3DSPCI 3DS3D 3DS3D 3D 
 NISTNIST IPDRR IdentifyProtectDetect ResponseRecovery
 M&OUptime Institute Uptime Institute (M&O)M&O 

 01 (2020-09-30)

 © 

2

 CSA CCM CSA CAIQ v3.1

2 CSA CCM 

2 CSA CCM 

2.1 CSA CCM 2.2 CSA CCMCAIQSTAR 2.3 

2.1 CSA CCM 

CSA CCM---- 2009  
CCM 42 CCM16133 

 ID AIS AAC BCR CCC DSI DCS EKM GRM HRS IAM

 1.  2.  3.  4.  5.  6.  7.  8.  9.  10. 

 01 (2020-09-30)

 © 

3

 CSA CCM CSA CAIQ v3.1

 ID IVS IPY MOS SEF STA TVM

 11.  12.  13.  14.  15.  16. 

2 CSA CCM 

2.2 CSA CCM  CAIQSTAR 

CCMISO 27001CSA STAR CCMISO 27001 
CSA CCMCAIQ CCM 330CAIQ 
3CAIQ CAIQ2020 3.1

2.3 

CSA STAR ----CSA STAR 
2020STAR CSA STAR

 



ECSBMSCPH DeHASIMSGPU GACSFPGAFACS
OBSEVSCBR DESSDSS VBSCSBSSDRS SFSDESCSG

 01 (2020-09-30)

 © 

4

 CSA CCM CSA CAIQ v3.1

2 CSA CCM 

 

  

     

IoT 


VPCELBNATNAT IPEIPDCVPN CCVPCVPCEP
DDSDDM DASDRS MySQL(MySQL)PostgreSQLPostgreSQL SQL ServerSQL ServerGaussDBfor MySQL GaussDB for MySQLGeminiDBGeminiDB
CCECCI
LiveVODMPC SVideo
RedisDCSMemcached DCSMEMDMSDMS KafkaKafkaRabbitMQRabbitMQAPI APIGServiceStage
AOMAPM LTSIAMCES SMNCTS
DomainsCloudsite DNS
OMSCDM
CDN
CodeHubCodeCheck CloudBuildProjectManCloudIDE
HSSCGSWeb WAFVSSAnti-DDosAntiDDosDDoSAADDBSS DEWSASSLSCM SESCBH
BCSFCS VoiceCallPrivateNumber& MSG&SMSROMASD-WAN SD-WANCMNWelinkWelink MeetingDCC
IoTDAIoTDPSIM GSLIoTIoTAIoTIoTEdge IoVIoTCRPS

 01 (2020-09-30)

 © 

5

 CSA CCM CSA CAIQ v3.1

2 CSA CCM 

 EI


ImageSearchAIModelArts HiLensHiLensGESVIS CSSNLPF Language UnderstandingLanguage GenerationNLPCMT MapReduceMRSCS DLIDWSCloudTable DISDAYU DLVRESOCR Moderation-ModerationText -ModerationImage-VCM FRSImage Tagging ROCQABot TaskBotCBSSACBSC Real-time ASRASR TTSASRCVCR VCPVCTVEP TrafficGoCampusGo HeatingGoEIHealth EI_IndustrialNAIE

 01 (2020-09-30)

 © 

6

 CSA CCM CSA CAIQ v3.1

3  CSA CAIQ 

3  CSA CAIQ 

3.1 AIS  3.2 AAC  3.3 BCR  3.4 CCC  3.5 DSI  3.6 DCS  3.7 EKM  3.8 GRM  3.9 HRS  3.10 IAM 3.11 IVS  3.12 IPY  3.13 MOS  3.14 SEF  3.15 STA  3.16 TVM 

3.1 AIS 

 


   



 01 (2020-09-30)

 © 

7

 CSA CCM CSA CAIQ v3.1

AIS-0 Do you use industry X 1.1 standards (i.e.
OWASP Software Assurance Maturity Model, ISO 27034) to build in security for your Systems/ Software Development Lifecycle (SDLC)?

AIS-0 Do you use an

X

1.2 automated source

code analysis tool to

detect security

defects in code prior

to production?

AIS-0 Do you use manual

X

1.3 source-code analysis

to detect security

defects in code prior

to production?

AIS-0 Do you verify that all X 1.4 of your software
suppliers adhere to industry standards for Systems/Software Development Lifecycle (SDLC) security?

AIS-0 (SaaS only) Do you X 1.5 review your
applications for security vulnerabilities and address any issues prior to deployment to production?

3  CSA CAIQ 
DevOps SDL DevOps DevSecOps  
      
  
            
    

 01 (2020-09-30)

 © 

8

 CSA CCM CSA CAIQ v3.1

AIS-0 Are all identified

X

2.1 security, contractual,

and regulatory

requirements for

customer access

contractually

addressed and

remediated prior to

granting customers

access to data,

assets, and

information systems?

AIS- Are all requirements X 02.2 and trust levels for
customers' access defined and
documented?

AIS-0 Does your data

X

3.1 management policies

and procedures

require audits to

verify data input and

output integrity

routines?

AIS-0 Are data input and X 3.2 output integrity
routines (i.e. MD5/SHA checksums) implemented for application interfaces and databases to prevent manual or systematic processing errors or corruption of data?

3  CSA CAIQ 
    SLA 
    SLA 
SOC         
SOC    Hash       

 01 (2020-09-30)

 © 

9

 CSA CCM CSA CAIQ v3.1
AIS-0 Is your Data Security X 4.1 Architecture designed
using an industry standard (e.g., CDSA, MULITSAFE, CSA Trusted Cloud Architectural Standard, FedRAMP, CAESARS)?

3  CSA CAIQ 
       
 

3.2 AAC 

  





  

AAC Do you develop and X -01. maintain an agreed 1 upon audit plan (e.g.,
scope, objective, frequency, resources,etc.) for reviewing the efficiency and effectiveness of implemented security controls?

     

AAC Does your audit

X

-01. program take into

2 account effectiveness

of implementation of

security operations?

  ISO 27001CSA STAR PCI DSSSOC 

AAC Do you allow tenants X -02. to view your 1 SOC2/ISO 27001 or
similar third-party audit or certification reports?

 ISO27001SOC   

AAC Do you conduct

X

-02. network penetration

2 tests of your cloud

service infrastructure

at least annually?

    

 01 (2020-09-30)

 © 

10

 CSA CCM CSA CAIQ v3.1

AAC Do you conduct

X

-02. application

3 penetration tests of

your cloud

infrastructure

regularly as

prescribed by

industry best

practices and

guidance?

AAC Do you conduct

X

-02. internal audits at

4 least annually?

AAC Do you conduct

X

-02. independent audits

5 at least annually?

AAC Are the results of the

X

-02. penetration tests

6 available to tenants

at their request?

AAC Are the results of

X

-02. internal and external

7 audits available to

tenants at their

request?

3  CSA CAIQ 
PCI DSS    
      ISO27001   
       AICPA SOC 
    
 AICPA SOC SOC  

 01 (2020-09-30)

 © 

11

 CSA CCM CSA CAIQ v3.1

AAC Do you have a

X

-03. program in place that

1 includes the ability to

monitor changes to

the regulatory

requirements in

relevant jurisdictions,

adjust your security

program for changes

to legal

requirements, and

ensure compliance

with relevant

regulatory

requirements?

3  CSA CAIQ 
     

3.3 BCR 

  





  

BCR Does your

X

-01. organization have a

1 plan or framework

for business

continuity

management or

disaster recovery

management?

ISO22301     

BCR Do you have more

X

-01. than one provider for

2 each service you

depend on?

   

BCR Do you provide a

X

-01. disaster recovery

3 capability?

 SDRS      

 01 (2020-09-30)

 © 

12

 CSA CCM CSA CAIQ v3.1

BCR Do you monitor

X

-01. service continuity

4 with upstream

providers in the event

of provider failure?

BCR Do you provide

X

-01. access to operational

5 redundancy reports,

including the services

you rely on?

BCR Do you provide a

X

-01. tenant-triggered

6 failover option?

BCR Do you share your

X

-01. business continuity

7 and redundancy

plans with your

tenants?

BCR Are business

X

-02. continuity plans

1 subject to testing at

planned intervals or

upon significant

organizational or

environmental

changes to ensure

continuing

effectiveness?

BCR Does your

X

-03. organization adhere

1 to any international

or industry standards

when it comes to

securing, monitoring,

maintaining and

testing of datacenter

utilities services and

environmental

conditions?

3  CSA CAIQ 
    
 ISO 22301 ISO 27001   
SDRS   
 ISO27001   
      
ISO27001 A11.2    

 01 (2020-09-30)

 © 

13

 CSA CCM CSA CAIQ v3.1

BCR Has your

X

-03. organization

2 implemented

environmental

controls, fail-over

mechanisms or other

redundancies to

secure utility services

and mitigate

environmental

conditions?

BCR Are information

X

-04. system documents

1 (e.g., administrator

and user guides,

architecture

diagrams, etc.) made

available to

authorized personnel

to ensure

configuration,

installation and

operation of the

information system?

BCR Is physical damage X -05. anticipated and are 1 countermeasures
included in the design of physical protections?

BCR Are any of your data

X

-06. centers located in

1 places that have a

high probability/

occurrence of high-

impact

environmental risks

(floods, tornadoes,

earthquakes,

hurricanes, etc.)?

BCR Do you have

X

-07. documented policies,

1 procedures and

supporting business

processes for

equipment and

datacenter

maintenance?

3  CSA CAIQ 
      
ISO27001 ISO27017 ISO27701  
    
     
   

 01 (2020-09-30)

 © 

14

 CSA CCM CSA CAIQ v3.1

BCR Do you have an

X

-07. equipment and

2 datacenter

maintenance routine

or plan?

BCR Are security

X

-08. mechanisms and

1 redundancies

implemented to

protect equipment

from utility service

outages (e.g., power

failures, network

disruptions, etc.)?

BCR Do you use industry X -09. standards and 1 frameworks to
determine the impact of any disruption to your organization (i.e. criticality of services and recovery priorities, disruption tolerance, RPO and RTO etc) ?

BCR Does your

X

-09. organization conduct

2 impact analysis

pertaining to possible

disruptions to the

cloud service?

BCR Are policies and

X

-10. procedures

1 established and

made available for

all personnel to

adequately support

services operations'

roles?

BCR Do you have

X

-11. technical capabilities

1 to enforce tenant

data retention

policies?

3  CSA CAIQ 
   
ISO27001A.17.2    ISO 27001
ISO22301 RPORTO    
RPORTO    
ISO27001     
       

 01 (2020-09-30)

 © 

15

 CSA CCM CSA CAIQ v3.1

BCR Do you have

X

-11. documented policies

2 and procedures

demonstrating

adherence to data

retention periods as

per legal, statutory or

regulatory

compliance

requirements?

BCR Have you

X

-11. implemented backup

3 or recovery

mechanisms to

ensure compliance

with regulatory,

statutory, contractual

or business

requirements?

BCR If using virtual

X

-11. infrastructure, does

4 your cloud solution

include independent

hardware restore and

recovery capabilities?

BCR If using virtual

X

-11. infrastructure, do you

5 provide tenants with

a capability to

restore a virtual

machine to a

previous

configuration?

BCR Does your cloud

X

-11. solution include

6 software/provider

independent restore

and recovery

capabilities?

BCR Do you test your

X

-11. backup or

7 redundancy

mechanisms at least

annually?

3  CSA CAIQ 
    
IAM/OBS  OBS IAM/OBS OBS CBR  
CES   HTTP/S EVS   
IMS    
  
    

 01 (2020-09-30)

 © 

16

 CSA CCM CSA CAIQ v3.1

3  CSA CAIQ 

3.4 CCC 

  





  

CCC Are policies and

X

-01. procedures

1 established for

management

authorization for

development or

acquisition of new

applications, systems,

databases,

infrastructure,

services, operations

and facilities?

DevOpsDevSecOps   


CCC Are policies and

X

-02. procedures for

1 change

management,

release, and testing

adequately

communicated to

external business

partners?

     

CCC Are policies and

X

-02. procedures

2 adequately enforced

to ensure external

business partners

comply with change

management

requirements?

     ISO 27001PCI DSSSOC  

CCC Do you have a

X

-03. defined quality

1 change control and

testing process in

place based on

system availability,

confidentiality, and

integrity?

      
 

 01 (2020-09-30)

 © 

17

 CSA CCM CSA CAIQ v3.1

CCC Is documentation

X

-03. describing known

2 issues with certain

products/services

available?

CCC Are there policies and X -03. procedures in place 3 to triage and remedy
reported bugs and security vulnerabilities for product and service offerings?

CCC Do you have controls X -03. in place to ensure 4 that standards of
quality are being met for all software development?

CCC Do you have controls X -03. in place to detect 5 source code security
defects for any outsourced software development activities?
CCC Are mechanisms in X -03. place to ensure that 6 all debugging and
test code elements are removed from released software versions?

3  CSA CAIQ 
   
    
     
    Alpha  BetaAPIfuzzing Gamma 
         
   

 01 (2020-09-30)

 © 

18

 CSA CCM CSA CAIQ v3.1

CCC Do you have controls X -04. in place to restrict 1 and monitor the
installation of unauthorized software onto your systems?

CCC Do you provide

X

-05. tenants with

1 documentation that

describes your

production change

management

procedures and their

roles/rights/

responsibilities within

it?

CCC Do you have policies X -05. and procedures 2 established for
managing risks with respect to change management in production environments?

CCC Do you have

X

-05. technical measures in

3 place to ensure that

changes in

production

environments are

registered, authorized

and in adherence

with existing SLAs?

3  CSA CAIQ 
   
    
       
        

3.5 DSI 

  





  

 01 (2020-09-30)

 © 

19

 CSA CCM CSA CAIQ v3.1

3  CSA CAIQ 

DSI- Do you provide a

X

01.1 capability to identify

data and virtual

machines via policy

tags/metadata (e.g.,

tags can be used to

limit guest operating

systems from

booting/

instantiating/

transporting data in

the wrong country)?

 ECS     

DSI- Do you provide a

X



01.2 capability to identify



data and hardware



via policy tags/

metadata/hardware

tags (e.g., TXT/TPM,

VN-Tag, etc.)?

DSI- Do you inventory, 02.1 document, and
maintain data flows for data that is resident (permanent or temporary) within the services' applications and infrastructure network and systems?

X    

DSI- Can you ensure that X 02.2 data does not
migrate beyond a defined geographical residency?

 
  

 01 (2020-09-30)

 © 

20

 CSA CCM CSA CAIQ v3.1

DSI- Do you provide

X

03.1 standardized (e.g.

ISO/IEC) non-

proprietary

encryption

algorithms (3DES,

AES, etc.) to tenants

in order for them to

protect their data if it

is required to move

through public

networks (e.g., the

Internet)?

DSI- Do you utilize open X 03.2 encryption
methodologies any time your infrastructure components need to communicate with each other via public networks (e.g., Internet-based replication of data from one environment to another)?
DSI- Are policies and 04.1 procedures
established for data labeling and handling in order to ensure the security of data and objects that contain data?
DSI- Do you follow a 04.2 structured data-
labeling standard (e.g., ISO 15489, Oasis XML Catalog Specification, CSA data type guidance)?

3  CSA CAIQ 
RESTHighway   REST
RESTful HTTP RESTfulAPI   Highway    TLS1.2 X.509    X.509  
APITLS API APITLS1.2 PFS(Perfect Forward Secrecy
X    TMS ECSVPCEVS  
X    

 01 (2020-09-30)

 © 

21

 CSA CCM CSA CAIQ v3.1

DSI- Are mechanisms for 04.3 label inheritance
implemented for objects that act as aggregate containers for data?

DSI- Do you have

X

05.1 procedures in place

to ensure production

data shall not be

replicated or used in

non-production

environments?

DSI- Are the

X

06.1 responsibilities

regarding data

stewardship defined,

assigned,

documented, and

communicated?

DSI- Do you support the X 07.1 secure deletion (e.g.,
degaussing/ cryptographic wiping) of archived and backed-up data?

DSI- Can you provide a

X

07.2 published procedure

for exiting the service

arrangement,

including assurance

to sanitize all

computing resources

of tenant data once a

customer has exited

your environment or

has vacated a

resource?

3  CSA CAIQ 
X  
   
    
  
    

     
   / /
      

 01 (2020-09-30)

 © 

22

 CSA CCM CSA CAIQ v3.1

3  CSA CAIQ 

3.6 DCS 

  





  

DCS Do you classify your X -01. assets in terms of 1 business criticality,
service-level expectations, and operational continuity requirements?

ISO27001   ISO27001 

DCS Do you maintain a X -01. complete inventory 2 of all of your critical
assets located at all sites/ or geographical locations and their assigned ownership?

ISO27001   ISO27001 

DCS Are physical security X -02. perimeters (e.g., 1 fences, walls,
barriers, guards, gates, electronic surveillance, physical authentication mechanisms, reception desks, and security patrols) implemented for all areas housing sensitive data and information systems?

  GB50174 ATIA942 T3  7*24        7*24    

DCS Do you have a

X

-03. capability to use

1 system geographic

location as an

authentication

factor?

IP IAMIP 

 01 (2020-09-30)

 © 

23

 CSA CCM CSA CAIQ v3.1

DCS Is automated



-03. equipment

2 identification used as

a method to validate

connection

authentication

integrity based on

known equipment

location?

DCS Is authorization

X

-04. obtained prior to

1 relocation or transfer

of hardware,

software, or data to

an offsite premises?

DCS Can you provide

X

-05. tenants with your

1 asset management

policies and

procedures?

DCS Can you provide

X

-06. evidence that

1 policies, standards,

and procedures have

been established for

maintaining a safe

and secure working

environment in

offices, rooms,

facilities, and secure

areas?

DCS Can you provide

X

-06. evidence that your

2 personnel and

involved third parties

have been trained

regarding your

documented policies,

standards, and

procedures?

3  CSA CAIQ 
ISO27001  ISO27001  IAM MFA 
    
   
ISO27001   ISO27001 
ISO27001  ISO27001 

 01 (2020-09-30)

 © 

24

 CSA CCM CSA CAIQ v3.1
DCS Are physical access X -07. control mechanisms 1 (e.g. CCTV cameras,
ID cards, checkpoints) in place to secure, constrain and monitor egress and ingress points?

DCS Are ingress and

X

-08. egress points, such as

1 service areas and

other points where

unauthorized

personnel may enter

the premises,

monitored, controlled

and isolated from

data storage and

process?

DCS Do you restrict

X

-09. physical access to

1 information assets

and functions by

users and support

personnel?

3  CSA CAIQ 
  7*24       7*24     
  7*24       7*24     
           

3.7 EKM 

  





 01 (2020-09-30)

 © 

25

 CSA CCM CSA CAIQ v3.1

3  CSA CAIQ 

  

EK Do you have key

X

M-0 management policies

1.1 binding keys to

identifiable owners?

 ID
IAM KMS

EK Do you have a

X

M-0 capability to allow

2.1 creation of unique

encryption keys per

tenant?

DEW    

EK Do you have a

X

M-0 capability to manage

2.2 encryption keys on

behalf of tenants?

DEW 

EK Do you maintain key X M-0 management 2.3 procedures?

 DEW DEW 

EK Do you have

X

M-0 documented

2.4 ownership for each

stage of the lifecycle

of encryption keys?

DEW  DEW  

EK Do you utilize any

X

M-0 third party/open

2.5 source/proprietary

frameworks to

manage encryption

keys?

   HSM  FIPS140-2 HSM

EK Do you encrypt

X

M-0 tenant data at rest

3.1 (on disk/storage)

within your

environment?

 DEW EVS OBSVBS 

 01 (2020-09-30)

 © 

26

 CSA CCM CSA CAIQ v3.1

EK Do you leverage

X

M-0 encryption to protect

3.2 data and virtual

machine images

during transport

across and between

networks and

hypervisor instances?

EK Do you have

X

M-0 documentation

3.3 establishing and

defining your

encryption

management

policies, procedures,

and guidelines?

EK Do you have

X

M-0 platform and data

4.1 appropriate

encryption that uses

open/validated

formats and standard

algorithms?

EK Are your encryption X M-0 keys maintained by 4.2 the cloud consumer
or a trusted key management provider?

3  CSA CAIQ 
   
1. VPN VPC   IKE IPSecVPN  
2. TLS RESTHighway 
 TLS1.2 X.509 
   
AES  TLS 
   HSM 
   HSM 

 01 (2020-09-30)

 © 

27

 CSA CCM CSA CAIQ v3.1

EK Do you store

X

M-0 encryption keys in

4.3 the cloud?

EK Do you have separate M-0 key management 4.4 and key usage
duties?

3  CSA CAIQ 
KMS  DEK KMS HSMHSM HSM HSM CMK 
X   

3.8 GRM 

  





  

GR Do you have

X

M-0 documented

1.1 information security

baselines for every

component of your

infrastructure (e.g.,

hypervisors,

operating systems,

routers, DNS servers,

etc.)?

CIS DevSecOps CIS      

GR Do you have the

X

M-0 capability to

1.2 continuously monitor

and report the

compliance of your

infrastructure against

your information

security baselines?

  

 01 (2020-09-30)

 © 

28

 CSA CCM CSA CAIQ v3.1

GR Does your

X

M-0 organization's risk

2.1 assessments take

into account

awareness of data

residency, legal and

statutory

requirements for

retention periods and

data protection and

classification?

GR Do you conduct risk X M-0 assessments 2.2 associated with data
governance requirements at least once a year?

GR Are your technical, X M-0 business, and 3.1 executive managers
responsible for maintaining awareness of and compliance with security policies, procedures, and standards for both themselves and their employees as they pertain to the manager and employees' area of responsibility?

GR Do you provide

X

M-0 tenants with

4.1 documentation

describing your

Information Security

Management

Program (ISMP)?

GR Do you review your X M-0 Information Security 4.2 Management
Program (ISMP) at least once a year?

3  CSA CAIQ 
ISO27001      ISO27001 
ISO27001      ISO27001 
          
   ISO27001 ISO27001 
ISO27001  ISMP ISO27001 

 01 (2020-09-30)

 © 

29

 CSA CCM CSA CAIQ v3.1

GR Do executive and line X M-0 management take 5.1 formal action to
support information security through clearly-documented direction and commitment, and ensure the action has been assigned?

GR Are your information X M-0 security policies and 6.1 procedures made
available to all impacted personnel and business partners, authorized by accountable business role/ function and supported by the information security management program as per industry best practices (e.g. ISO 27001, SOC 2)?

GR Are information

X

M-0 security policies

6.2 authorized by the

organization's

business leadership

(or other

accountable business

role or function) and

supported by a

strategic business

plan and an

information security

management

program inclusive of

defined information

security roles and

responsibilities for

business leadership?

3  CSA CAIQ 
ISO27001    ISO27001 
ISO27001SOC2    ISO 27001 SOC 
ISO27001     ISO27001 

 01 (2020-09-30)

 © 

30

 CSA CCM CSA CAIQ v3.1

GR Do you have

X

M-0 agreements to ensure

6.3 your providers

adhere to your

information security

and privacy policies?

GR Can you provide

X

M-0 evidence of due

6.4 diligence mapping of

your controls,

architecture, and

processes to

regulations and/or

standards?

GR Do you disclose

X

M-0 which controls,

6.5 standards,

certifications, and/or

regulations you

comply with?

GR Is a formal

X

M-0 disciplinary or

7.1 sanction policy

established for

employees who have

violated security

policies and

procedures?

GR Are employees made X M-0 aware of what 7.2 actions could be
taken in the event of a violation via their policies and procedures?
GR Do risk assessment X M-0 results include 8.1 updates to security
policies, procedures, standards, and controls to ensure they remain relevant and effective?

3  CSA CAIQ 
   
     
  
          
   
  

 01 (2020-09-30)

 © 

31

 CSA CCM CSA CAIQ v3.1

GR Do you notify your X M-0 tenants when you 9.1 make material
changes to your information security and/or privacy policies?

GR Do you perform, at X M-0 minimum, annual 9.2 reviews to your
privacy and security policies?

GR Are formal risk

X

M-1 assessments aligned

0.1 with the enterprise-

wide framework and

performed at least

annually, or at

planned intervals,

determining the

likelihood and impact

of all identified risks,

using qualitative and

quantitative

methods?

GR Is the likelihood and X M-1 impact associated 0.2 with inherent and
residual risk determined independently, considering all risk categories?

GR Do you have a

X

M-1 documented,

1.1 organization-wide

program in place to

manage risk?

GR Do you make

X

M-1 available

1.2 documentation of

your organization-

wide risk

management

program?

3  CSA CAIQ 
  
  
    ISO27001
ISO27001    
ISO27001     PCI DSSISO27001   

 01 (2020-09-30)

 © 

32

 CSA CCM CSA CAIQ v3.1

3  CSA CAIQ 

3.9 HRS 

  





  

HRS Upon termination of X -01. contract or business 1 relationship, are
employees and business partners adequately informed of their obligations for returning organizationallyowned assets?

   /  

HRS Do you have asset

X

-01. return procedures

2 outlining how assets

should be returned

within an established

period?

/  

HRS Pursuant to local

X

-02. laws, regulations,

1 ethics, and

contractual

constraints, are all

employment

candidates,

contractors, and

involved third parties

subject to

background

verification?

   

HRS Do your employment X -03. agreements 1 incorporate
provisions and/or terms in adherence to established information governance and security policies?

  

 01 (2020-09-30)

 © 

33

 CSA CCM CSA CAIQ v3.1

HRS Do you require that X -03. employment 2 agreements are
signed by newly hired or on-boarded workforce personnel prior to granting workforce personnel user access to corporate facilities, resources, and assets?

HRS Are documented

X

-04. policies, procedures,

1 and guidelines in

place to govern

change in

employment and/or

termination?

HRS Do the above

X

-04. procedures and

2 guidelines account

for timely revocation

of access and return

of assets?

HRS Are policies and

X

-05. procedures

1 established and

measures

implemented to

strictly limit access to

your sensitive data

and tenant data from

portable and mobile

devices (e.g., laptops,

cell phones, and

personal digital

assistants (PDAs)),

which are generally

higher-risk than non-

portable devices (e.g.,

desktop computers at

the provider

organization's

facilities)?

3  CSA CAIQ 
    
   
 IT 
    

 01 (2020-09-30)

 © 

34

 CSA CCM CSA CAIQ v3.1

HRS Are requirements for X -06. non-disclosure or 1 confidentiality
agreements reflecting the organization's needs for the protection of data and operational details identified, documented, and reviewed at planned intervals?

HRS Do you provide

X

-07. tenants with a role

1 definition document

clarifying your

administrative

responsibilities versus

those of the tenant?

HRS Do you have policies X -08. and procedures in 1 place to define
allowances and conditions for permitting usage of organizationallyowned or managed user end-point devices and IT infrastructure network and systems components?

HRS Do you define

X

-08. allowance and

2 conditions for BYOD

devices and its

applications to access

corporate resources?

3  CSA CAIQ    
    
  
   

 01 (2020-09-30)

 © 

35

 CSA CCM CSA CAIQ v3.1

HRS Do you provide a

X

-09. formal, role-based,

1 security awareness

training program for

cloud-related access

and data

management issues

(e.g., multi-tenancy,

nationality, cloud

delivery model,

segregation of duties

implications, and

conflicts of interest)

for all persons with

access to tenant

data?

HRS Do you specifically X -09. train your employees 2 regarding their
specific role and the information security controls they must fulfill?

HRS Do you document

X

-09. employee

3 acknowledgment of

training they have

completed?

HRS Is successful and

X

-09. timed completion of

4 the training

program(s)

considered a

prerequisite for

acquiring and

maintaining access to

sensitive systems?

HRS Are personnel trained X -09. and provided with 5 awareness programs
at least once a year?

3  CSA CAIQ 
     
          
   
      

 01 (2020-09-30)

 © 

36

 CSA CCM CSA CAIQ v3.1

HRS Are administrators

X

-09. and data stewards

6 properly educated on

their legal

responsibilities with

regard to security

and data integrity?

HRS Are personnel

X

-10. informed of their

1 responsibilities for

maintaining

awareness and

compliance with

published security

policies, procedures,

standards, and

applicable regulatory

requirements?

HRS Are personnel

X

-10. informed of their

2 responsibilities for

maintaining a safe

and secure working

environment?

HRS Are personnel

X

-10. informed of their

3 responsibilities for

ensuring that

equipment is secured

and not left

unattended?

HRS Are all computers

X

-11. and laptops

1 configured such that

there is lockout

screen after a pre-

defined amount of

time?

HRS Are there policies and X -11. procedures to ensure 2 that unattended
workspaces do not have openly visible (e.g., on a desktop) sensitive documents?

3  CSA CAIQ 
     
      
SOCPCI DSSISO27001    
SOCPCI DSSISO27001    
SOCPCI DSSISO27001     
SOCPCI DSSISO27001      

 01 (2020-09-30)

 © 

37

 CSA CCM CSA CAIQ v3.1

3  CSA CAIQ 

3.10 IAM 

  





  

IAM Do you restrict, log, X -01. and monitor access 1 to your information
security management systems (e.g., hypervisors, firewalls, vulnerability scanners, network sniffers, APIs, etc.)?

   
IAM CLS 

IAM Do you monitor and X -01. log privileged access 2 (e.g., administrator
level) to information security management systems?

   

IAM Do you have controls X -02. in place ensuring 1 timely removal of
systems access that is no longer required for business purposes?

ISO27001       

IAM Do you have policies, X -02. procedures and 2 technical measures in
place to ensure appropriate data/ assets access management in adherence to legal, statutory or regulatory compliance requirements?

ISO27001       

 01 (2020-09-30)

 © 

38

 CSA CCM CSA CAIQ v3.1

IAM Do you have

X

-02. procedures and

3 technical measures in

place for user

account entitlement

de-/provisioning

based on the rule of

least privilege?

IAM Do you have

X

-02. procedures and

4 technical measures in

place for data access

segmentation in

multi-tenant system

architectures?

IAM Do you enforce data X -02. access permissions 5 based on the rules of
Authentication, Authorization and Accountability (AAA)?

IAM Do your policies and X -02. procedures 6 incorporate security
controls for establishing higher levels of assurance for critical business case considerations, supported by multifactor authentication?

IAM Do you provide

X

-02. metrics to track the

7 speed with which you

are able to remove

systems access that is

no longer required

for business

purposes?

3  CSA CAIQ 
ISO27001      
            
    IAMAAA  
    
   

 01 (2020-09-30)

 © 

39

 CSA CCM CSA CAIQ v3.1

IAM Is user access to

X

-03. diagnostic and

1 configuration ports

restricted to

authorized

individuals and

applications?

IAM Do you manage and X -04. store the identity of 1 all personnel who
have access to the IT infrastructure, including their level of access?

IAM Do you manage and X -04. store the user 2 identity of all
personnel who have network access, including their level of access?

IAM Do you provide

X

-05. tenants with

1 documentation on

how you maintain

segregation of duties

within your cloud

service offering?

IAM Are controls in place X -06. to prevent 1 unauthorized access
to your application, program, or object source code, and assure it is restricted to authorized personnel only?

IAM Are controls in place X -06. to prevent 2 unauthorized access
to tenant application, program, or object source code, and assure it is restricted to authorized personnel only?

3  CSA CAIQ 
     
IAM   
IAM   
IAM  IAM  
     
ISO27001       

 01 (2020-09-30)

 © 

40

 CSA CCM CSA CAIQ v3.1

IAM Does your

X

-07. organization conduct

1 third-party

unauthorized access

risk assessments?

IAM Are preventive,

X

-07. detective corrective

2 compensating

controls in place to

mitigate impacts of

unauthorized or

inappropriate access?

IAM Do you document

X

-08. how you grant,

1 approve and enforce

access restrictions to

tenant/customer

credentials following

the rules of least

privilege?

IAM Based on the rules of X -08. least privilege, do 2 you have policies and
procedures established for permissible storage and access of identities used for authentication?

IAM Do you limit

X

-08. identities' replication

3 only to users

explicitly defined as

business necessary?

3  CSA CAIQ 
ISO27001    
   
     
 IAM     
 IAM    

 01 (2020-09-30)

 © 

41

 CSA CCM CSA CAIQ v3.1

IAM Does your

X

-09. management

1 provision the

authorization and

restrictions for user

access (e.g.,

employees,

contractors,

customers (tenants),

business partners,

and/or suppliers)

prior to their access

to data and any

owned or managed

(physical and virtual)

applications,

infrastructure

systems, and network

components?

IAM Do you provide upon X -09. the request of users 2 with legitimate
interest access (e.g., employees, contractors, customers (tenants), business partners and/or suppliers) to data and any owned or managed (physical and virtual) applications, infrastructure systems and network components?

IAM Do you require a

X

-10. periodical

1 authorization and

validation (e.g. at

least annually) of the

entitlements for all

system users and

administrators

(exclusive of users

maintained by your

tenants), based on

the rule of least

privilege, by business

leadership or other

accountable business

role or function?

3  CSA CAIQ     
     
ISO27001     ISO27001 

 01 (2020-09-30)

 © 

42

 CSA CCM CSA CAIQ v3.1

IAM Do you collect

X

-10. evidence to

2 demonstrate that the

policy (see question

IAM-10.1) has been

enforced?

IAM Will you share user X -10. entitlement and 3 remediation reports
with your tenants, if inappropriate access may have been allowed to tenant data?

IAM Is timely

X

-10. deprovisioning,

4 revocation, or

modification of user

access to the

organizations

systems, information

assets, and data

implemented upon

any change in status

of employees,

contractors,

customers, business

partners, or involved

third parties?

IAM Is any change in user X -11. access status 1 intended to include
termination of employment, contract or agreement, change of employment or transfer within the organization?

3  CSA CAIQ 
ISO27001     ISO27001 
ISO27001     ISO27001 
     SOCISO27001 PCIDSS
    

 01 (2020-09-30)

 © 

43

 CSA CCM CSA CAIQ v3.1
IAM Is any change in user X -11. access status 2 intended to include
termination of employment, contract or agreement, change of employment or transfer within the organization?
IAM Do you support use X -12. of, or integration 1 with, existing
customer-based Single Sign On (SSO) solutions to your service?

IAM Do you use open

X

-12. standards to delegate

2 authentication

capabilities to your

tenants?

3  CSA CAIQ 
    
   
WebSSO    API/  OpenStackClientShibboleth ECPClient API
SAML2.0       
WebSSO    API/  OpenStackClient ShibbolethECPClient API 

 01 (2020-09-30)

 © 

44

 CSA CCM CSA CAIQ v3.1

IAM Do you support

X

-12. identity federation

3 standards (e.g.,

SAML, SPML, WS-

Federation, etc.) as a

means of

authenticating/

authorizing users?

IAM Do you have a Policy -12. Enforcement Point 4 capability (e.g.,
XACML) to enforce regional legal and policy constraints on user access?

IAM Do you have an

X

-12. identity management

5 system (enabling

classification of data

for a tenant) in place

to enable both role-

based and context-

based entitlement to

data?

IAM Do you provide

X

-12. tenants with strong

6 (multifactor)

authentication

options (e.g., digital

certs, tokens,

biometrics, etc.) for

user access?

3  CSA CAIQ 
SAML2.0       
WebSSO    API/  OpenStackClient ShibbolethECPClient API 
X   IAM
IAM    
IAM        MFA

 01 (2020-09-30)

 © 

45

 CSA CCM CSA CAIQ v3.1
IAM Do you allow tenants X -12. to use third-party 7 identity assurance
services?

IAM Do you support

X

-12. password (e.g.,

8 minimum length,

age, history,

complexity) and

account lockout (e.g.,

lockout threshold,

lockout duration)

policy enforcement?

IAM Do you allow

X

-12. tenants/customers to

9 define password and

account lockout

policies for their

accounts?

IAM Do you support the X -12. ability to force 10 password changes
upon first logon?

3  CSA CAIQ 
SAML2.0   
 
  WebSSO  
 API/  OpenStackClient ShibbolethECPClient API 
IAM IAM    
IAM      IAMIAM  API 
 IAM     IAM 

 01 (2020-09-30)

 © 

46

 CSA CCM CSA CAIQ v3.1

IAM Do you have

X

-12. mechanisms in place

11 for unlocking

accounts that have

been locked out (e.g.,

self-service via email,

defined challenge

questions, manual

unlock)?

IAM Are access to utility X -13. programs used to 1 manage virtualized
partitions (e.g. shutdown, clone, etc) appropriately restricted and monitored?

3  CSA CAIQ 
IAM      IAMIAM  API 
   

3.11 IVS 

 
IVS- Are file integrity 01.1 (host) and network
intrusion detection (IDS) tools implemented to help facilitate timely detection, investigation by root cause analysis, and response to incidents?
IVS- Is physical and 01.2 logical user access to
audit logs restricted to authorized personnel?





  

X

IPSWeb

HIDS



IPS

Web





SQLCSSCSRF



Windows

HIDS









X













 01 (2020-09-30)

 © 

47

 CSA CCM CSA CAIQ v3.1

IVS- Can you provide

X

01.3 evidence that due

diligence mapping of

regulations and

standards to your

controls/architecture/

processes has been

performed?

IVS- Are audit logs

X

01.4 centrally stored and

retained?

IVS- Are audit logs

X

01.5 reviewed on a

regular basis for

security events (e.g.,

with automated

tools)?

IVS- Do you log and alert X 02.1 any changes made to
virtual machine images regardless of their running state (e.g., dormant, off or running)?

IVS- Does the virtual

X

02.2 machine

management

infrastructure include

a tamper audit or

software integrity

function to detect

changes to the build/

configuration of the

virtual machine?

IVS- Are changes made to X 02.3 virtual machines, or
moving of an image and subsequent validation of the image's integrity, made immediately available to customers through electronic methods (e.g., portals or alerts)?

3  CSA CAIQ 
     
      
  
    
HSS      

 01 (2020-09-30)

 © 

48

 CSA CCM CSA CAIQ v3.1

IVS- Do you use a

X

03.1 synchronized time-

service protocol (e.g.,

NTP) to ensure all

systems have a

common time

reference?

IVS- Do you provide

X

04.1 documentation

regarding what levels

of system (e.g.,

network, storage,

memory, I/O, etc.)

oversubscription you

maintain and under

what circumstances/

scenarios?

IVS- Do you restrict use of X 04.2 the memory
oversubscription capabilities present in the hypervisor?

IVS- Does your system's X 04.3 capacity
requirements take into account current, projected, and anticipated capacity needs for all systems used to provide services to the tenants?

IVS- Is system

X

04.4 performance

monitored and tuned

in order to

continuously meet

regulatory,

contractual, and

business

requirements for all

the systems used to

provide services to

the tenants?

3  CSA CAIQ  NTP4.2.8 
SLA  
       
   

 01 (2020-09-30)

 © 

49

 CSA CCM CSA CAIQ v3.1

IVS- Do security

X

05.1 vulnerability

assessment tools or

services

accommodate the

virtualization

technologies being

used (e.g.,

virtualization

aware)?

IVS- For your IaaS

X

06.1 offering, do you

provide customers

with guidance on

how to create a

layered security

architecture

equivalence using

your virtualized

solution?

IVS- Do you regularly

X

06.2 update network

architecture diagrams

that include data

flows between

security domains/

zones?

IVS- Do you regularly

X

06.3 review for

appropriateness the

allowed access/

connectivity (e.g.,

firewall rules)

between security

domains/zones

within the network?

IVS- Are all firewall access X 06.4 control lists
documented with business justification?

3  CSA CAIQ 
     
    
   PCI DSS 
   PCI DSS 
  

 01 (2020-09-30)

 © 

50

 CSA CCM CSA CAIQ v3.1

IVS- Are operating

X

07.1 systems hardened to

provide only the

necessary ports,

protocols, and

services to meet

business needs using

technical controls

(e.g., antivirus, file

integrity monitoring,

and logging) as part

of their baseline

build standard or

template?

IVS- For your SaaS or

X

08.1 PaaS offering, do you

provide tenants with

separate

environments for

production and test

processes?

IVS- For your IaaS

X

08.2 offering, do you

provide tenants with

guidance on how to

create suitable

production and test

environments?

IVS- Do you logically and X 08.3 physically segregate
production and nonproduction environments?

3  CSA CAIQ 
    DDoS
 Anti-DDoS   IPS   //  IPS      Web WebWeb WebDDoSSQL  
SaaSPaaS VPC 
    
    

 01 (2020-09-30)

 © 

51

 CSA CCM CSA CAIQ v3.1

IVS- Are system and

X

09.1 network

environments

protected by a

firewall or virtual

firewall to ensure

business and

customer security

requirements?

IVS- Are system and

X

09.2 network

environments

protected by a

firewall or virtual

firewall to ensure

compliance with

legal, regulatory and

contractual

requirements?

IVS- Have you

X

09.3 implemented the

necessary measures

for the appropriate

isolation and

segmentation of

tenants' access to

infrastructure system

and network

components, in

adherence to

established policies,

legal, statutory, and

regulatory

compliance

obligations?

IVS- Do you have the

X

09.4 ability to logically

segment or encrypt

customer data such

that data may be

produced for a single

tenant only, without

inadvertently

accessing another

tenant's data?

3  CSA CAIQ 
DoS/DDoS       
DoS/DDoS       
     BMC    
        VPC   ACL  

 01 (2020-09-30)

 © 

52

 CSA CCM CSA CAIQ v3.1

IVS- Are system and

X

09.5 network

environments

protected by a

firewall or virtual

firewall to ensure

protection and

isolation of sensitive

data?

IVS- Are secured and

X

10.1 encrypted

communication

channels used when

migrating physical

servers, applications,

or data to virtual

servers?

IVS- Do you use a

X

10.2 network segregated

from production-

level networks when

migrating physical

servers, applications,

or data to virtual

servers?

3  CSA CAIQ 
 VPCVPC  
 VPN VPC   VPCACL  
CDMVPC  SSLRDS SFTPSSLCDM  VPNSSL 
 CDM AES-256
  

 01 (2020-09-30)

 © 

53

 CSA CCM CSA CAIQ v3.1

IVS- Do you restrict

X

11.1 personnel access to

all hypervisor

management

functions or

administrative

consoles for systems

hosting virtualized

systems based on the

principle of least

privilege and

supported through

technical controls

(e.g., two-factor

authentication, audit

trails, IP address

filtering, firewalls

and TLS-

encapsulated

communications to

the administrative

consoles)?

IVS- Are policies and 12.1 procedures
established and mechanisms configured and implemented to protect the wireless network environment perimeter and to restrict unauthorized wireless traffic?

IVS- Are policies and 12.2 procedures
established and mechanisms implemented to ensure wireless security settings are enabled with strong encryption for authentication and transmission, replacing vendor default settings (e.g., encryption keys, passwords, SNMP community strings)?

3  CSA CAIQ         
X  
X  

 01 (2020-09-30)

 © 

54

 CSA CCM CSA CAIQ v3.1

IVS- Are policies and 12.3 procedures
established and mechanisms implemented to protect wireless network environments and detect the presence of unauthorized (rogue) network devices for a timely disconnect from the network?

IVS- Do your network

X

13.1 architecture diagrams

clearly identify high-

risk environments

and data flows that

may have legal

compliance impacts?

IVS- Do you implement X 13.2 technical measures
and apply defensein-depth techniques (e.g., deep packet analysis, traffic throttling and blackholing) for detection and timely response to network-based attacks associated with anomalous ingress or egress traffic patterns (e.g., MAC spoofing and ARP poisoning attacks) and/or distributed denial-ofservice (DDoS) attacks?

3  CSA CAIQ  X 

  
DoS/DDoS       

3.12 IPY 

  





 01 (2020-09-30)

 © 

55

 CSA CCM CSA CAIQ v3.1

3  CSA CAIQ 

  

IPY- Do you publish a list X 01.1 of all APIs available
in the service and indicate which are standard and which are customized?

API API 

IPY- Is unstructured

X

02.1 customer data

available on request

in an industry-

standard format

(e.g., .doc, .xls,

or .pdf)?

  

IPY- Do you provide 03.1 policies and
procedures (i.e. service level agreements) governing the use of APIs for interoperability between your service and third-party applications?

X  

IPY- If using virtual

X

03.2 infrastructure, do you

allow virtual machine

images to be

downloaded and

ported to a new

cloud provider?

   

IPY- Do you provide 03.3 policies and
procedures (i.e. service level agreements) governing the migration of application data to and from your service?

X



 01 (2020-09-30)

 © 

56

 CSA CCM CSA CAIQ v3.1

IPY- Is data import, data X 04.1 export, and service
management be conducted over secure (e.g., nonclear text and authenticated), industry accepted standardized network protocols?

IPY- Do you provide

X

04.2 consumers (tenants)

with documentation

detailing the relevant

interoperability and

portability network

protocol standards

that are involved?

IPY- Do you use an

X

05.1 industry-recognized

virtualization

platform and

standard

virtualization formats

(e.g., OVF) to help

ensure

interoperability?

IPY- If using virtual

X

05.2 infrastructure, are

machine images

made available to

the customer in a

way that would allow

the customer to

replicate those

images in their own

off-site storage

location?

IPY- Do you have

X

05.3 documented custom

changes made to any

hypervisor in use,

and all solution-

specific virtualization

hooks available for

customer review?

3  CSA CAIQ  TLS1.2  AES-256
 API  
 KVMXenDocker 
 , region 
   

 01 (2020-09-30)

 © 

57

 CSA CCM CSA CAIQ v3.1

3  CSA CAIQ 

3.13 MOS 

  





  

MO Do you provide antiS-0 malware training 1.1 specific to mobile
devices as part of your information security awareness training?

X     IOS  

MO Do you document S-0 and make available 2.1 lists of approved
application stores for mobile devices accessing or storing company data and/or company systems?

X MOS-02.1

MO Do you have a policy S-0 enforcement 3.1 capability (e.g.,
XACML) to ensure that only approved applications and those from approved application stores can be loaded onto a mobile device?

X MOS-02.1

MO Does your BYOD S-0 policy and training 4.1 clearly state which
applications and applications stores are approved for use on BYOD devices?

X MOS-02.1

 01 (2020-09-30)

 © 

58

 CSA CCM CSA CAIQ v3.1
MO Do you have a S-0 documented mobile 5.1 device policy in your
employee training that clearly defines mobile devices and the accepted usage and requirements for mobile devices?
MO Do you have a S-0 documented list of 6.1 pre-approved cloud
based services that are allowed to be used for use and storage of company business data via a mobile device?
MO Do you have a S-0 documented 7.1 application validation
process for testing device, operating system, and application compatibility issues?
MO Do you have a BYOD S-0 policy that defines 8.1 the device(s) and
eligibility requirements allowed for BYOD usage?
MO Do you maintain an S-0 inventory of all 9.1 mobile devices
storing and accessing company data which includes device status (e.g., operating system and patch levels, lost or decommissioned, device assignee)?

3  CSA CAIQ  X MOS-02.1
X MOS-02.1
X MOS-02.1 X MOS-02.1 X MOS-02.1

 01 (2020-09-30)

 © 

59

 CSA CCM CSA CAIQ v3.1
MO Do you have a S-1 centralized mobile 0.1 device management
solution deployed to all mobile devices that are permitted to store, transmit, or process company data?
MO Does your mobile S-1 device policy require 1.1 the use of encryption
for either the entire device or for data identified as sensitive enforceable through technology controls for all mobile devices?
MO Does your mobile S-1 device policy prohibit 2.1 the circumvention of
built-in security controls on mobile devices (e.g., jailbreaking or rooting)?
MO Do you have S-1 detective and 2.2 preventative controls
on the device or via a centralized device management system which prohibit the circumvention of built-in security controls?
MO Does your BYOD S-1 policy clearly define 3.1 the expectation of
privacy, requirements for litigation, ediscovery, and legal holds?

3  CSA CAIQ  X MOS-02.1 X MOS-02.1
X MOS-02.1 X MOS-02.1
X MOS-02.1

 01 (2020-09-30)

 © 

60

 CSA CCM CSA CAIQ v3.1
MO Does the BYOD S-1 policy clearly state 3.2 the expectations over
the loss of noncompany data in case a wipe of the device is required?
MO Do you require and S-1 enforce via technical 4.1 controls an
automatic lockout screen for BYOD and company owned devices?
MO Do you manage all S-1 changes to mobile 5.1 device operating
systems, patch levels, and applications via your company's change management processes?
MO Do you have S-1 password policies for 6.1 enterprise issued
mobile devices and/or BYOD mobile devices?
MO Are your password S-1 policies enforced 6.2 through technical
controls (i.e. MDM)?
MO Do your password S-1 policies prohibit the 6.3 changing of
authentication requirements (i.e. password/PIN length) via a mobile device?
MO Do you have a policy S-1 that requires BYOD 7.1 users to perform
backups of specified corporate data?

3  CSA CAIQ  X MOS-02.1 X MOS-02.1 X MOS-02.1
X MOS-02.1 X MOS-02.1 X MOS-02.1 X MOS-02.1

 01 (2020-09-30)

 © 

61

 CSA CCM CSA CAIQ v3.1
MO Do you have a policy S-1 that requires BYOD 7.2 users to prohibit the
usage of unapproved application stores?
MO Do you have a policy S-1 that requires BYOD 7.3 users to use anti-
malware software (where supported)?
MO Does your IT provide S-1 remote wipe or 8.1 corporate data wipe
for all companyaccepted BYOD devices?
MO Does your IT provide S-1 remote wipe or 8.2 corporate data wipe
for all companyassigned mobile devices?
MO Do your mobile S-1 devices have the 9.1 latest available
security-related patches installed upon general release by the device manufacturer or carrier?
MO Do your mobile S-1 devices allow for 9.2 remote validation to
download the latest security patches by company IT personnel?
MO Does your BYOD S-2 policy clarify the 0.1 systems and servers
allowed for use or access on the BYODenabled device?

3  CSA CAIQ  X MOS-02.1 X MOS-02.1 X MOS-02.1 X MOS-02.1 X MOS-02.1
X MOS-02.1 X MOS-02.1

 01 (2020-09-30)

 © 

62

 CSA CCM CSA CAIQ v3.1
MO Does your BYOD S-2 policy specify the 0.2 user roles that are
allowed access via a BYOD-enabled device?

3  CSA CAIQ  X MOS-02.1

3.14 SEF 

  





  

SEF- Do you maintain

X

01.1 liaisons and points of

contact with local

authorities in

accordance with

contracts and

appropriate

regulations?

ISO27001     ISO27001

SEF- Do you have a

X

02.1 documented security

incident response

plan?

 ISO27001  ISO27001

SEF- Do you integrate

X

02.2 customized tenant

requirements into

your security incident

response plans?

   
 

SEF- Do you publish a

X

02.3 roles and

responsibilities

document specifying

what you vs. your

tenants are

responsible for

during security

incidents?

     7*24       

 01 (2020-09-30)

 © 

63

 CSA CCM CSA CAIQ v3.1

SEF- Have you tested your X 02.4 security incident
response plans in the last year?

SEF- Are workforce

X

03.1 personnel and

external business

relationships

adequately informed

of their responsibility,

and, if required,

consent and/or

contractually

required to report all

information security

events in a timely

manner?

SEF- Do you have

X

03.2 predefined

communication

channels for

workforce personnel

and external business

partners to report

incidents in a timely

manner adhering to

applicable legal,

statutory, or

regulatory

compliance

obligations?

SEF- Does your incident X 04.1 response plan comply
with industry standards for legally admissible chain-ofcustody management processes and controls?

SEF- Does your incident X 04.2 response capability
include the use of legally admissible forensic data collection and analysis techniques?

3  CSA CAIQ 
  
          
   
ISO27001ISO27017    
ISO27001ISO27017    

 01 (2020-09-30)

 © 

64

 CSA CCM CSA CAIQ v3.1

SEF- Are you capable of X 04.3 supporting litigation
holds (freeze of data from a specific point in time) for a specific tenant without freezing other tenant data?

SEF- Do you enforce and X 04.4 attest to tenant data
separation when producing data in response to legal subpoenas?

SEF- Do you monitor and X 05.1 quantify the types,
volumes, and impacts on all information security incidents?

SEF- Will you share

X

05.2 statistical

information for

security incident data

with your tenants

upon request?

3  CSA CAIQ 
ISO27001ISO27017    
ISO27001ISO27017    
   
      

3.15 STA 

  





  

STA Do you inspect and X -01. account for data 1 quality errors and
associated risks, and work with your cloud supply-chain partners to correct them?

     
   

 01 (2020-09-30)

 © 

65

 CSA CCM CSA CAIQ v3.1

STA Do you design and X -01. implement controls 2 to mitigate and
contain data security risks through proper separation of duties, role-based access, and least-privileged access for all personnel within your supply chain?

STA Do you make security X -02. incident information 1 available to all
affected customers and providers periodically through electronic methods (e.g., portals)?

STA Do you collect

X

-03. capacity and use

1 data for all relevant

components of your

cloud service

offering?

STA Do you provide

X

-03. tenants with capacity

2 planning and use

reports?

STA Do you perform

X

-04. annual internal

1 assessments of

conformance and

effectiveness of your

policies, procedures,

and supporting

measures and

metrics?

3  CSA CAIQ 
  
    
  
      OpenAPISDK Agent       SOCISOPCIDSS   /

 01 (2020-09-30)

 © 

66

 CSA CCM CSA CAIQ v3.1

STA Do you select and

X

-05. monitor outsourced

1 providers in

compliance with laws

in the country where

the data is processed,

stored, and

transmitted?

STA Do you select and

X

-05. monitor outsourced

2 providers to ensure

that they are in

compliance with

applicable

legislation?

STA Does legal counsel X -05. review all third-party 3 agreements?

STA Do third-party

X

-05. agreements include

4 provision for the

security and

protection of

information and

assets?

STA Do you have the

X

-05. capability to recover

5 data for a specific

customer in the case

of a failure or data

loss?

STA Do you have the

X

-05. capability to restrict

6 the storage of

customer data to

specific countries or

geographic locations?

STA Can you provide the X
-05. physical location/
7 geography of storage of a tenant's data upon request?

STA Can you provide the X -05. physical location/ 8 geography of storage
of a tenant's data in advance?

3  CSA CAIQ 
    
    
  
    
     
    
  
  

 01 (2020-09-30)

 © 

67

 CSA CCM CSA CAIQ v3.1

3  CSA CAIQ 

STA Do you allow tenants X -05. to define acceptable 9 geographical
locations for data routing or resource instantiation?

STA Are systems in place X -05. to monitor for 10 privacy breaches and
notify tenants expeditiously if a privacy event may have impacted their data?

STA Do you allow tenants

X

-05. to opt out of having

11 their data/metadata

accessed via

inspection

technologies?

STA Do you provide the

X

-05. client with a list and

12 copies of all

subprocessing

agreements and keep

this updated?

STA Do you review the

X

-06. risk management

1 and governance

processes of partners

to account for risks

inherited from other

members of that

partner's supply

chain?

STA Are policies and

X

-07. procedures

1 established, and

supporting business

processes and

technical measures

implemented, for

maintaining

complete, accurate,

and relevant

agreements (e.g.,

SLAs) between

providers and

customers (tenants)?

 
      
 
 
   
    

 01 (2020-09-30)

 © 

68

 CSA CCM CSA CAIQ v3.1

STA Do you have the

X

-07. ability to measure

2 and address non-

conformance of

provisions and/or

terms across the

entire supply chain

(upstream/

downstream)?

STA Can you manage

X

-07. service-level conflicts

3 or inconsistencies

resulting from

disparate supplier

relationships?

STA Do you provide

X

-07. tenants with ongoing

4 visibility and

reporting of your

operational Service

Level Agreement

(SLA) performance?

STA Do you make

X

-07. standards-based

5 information security

metrics (CSA, CAMM,

etc.) available to

your tenants?

STA Do you provide

X

-07. customers with

6 ongoing visibility and

reporting of your SLA

performance?

STA Do your data -07. management policies 7 and procedures
address tenant and service level conflicts of interests?

STA Do you review all

X

-07. service level

8 agreements at least

annually?

3  CSA CAIQ 
      
  
SLA  
 AOMAPM  OpenAPI SDKAgent   APMAOM APM AOM IT     X 
SLA SLA 

 01 (2020-09-30)

 © 

69

 CSA CCM CSA CAIQ v3.1

STA Do you assure

X

-08. reasonable

1 information security

across your

information supply

chain by performing

an annual review?

STA Does your annual

X

-08. review include all

2 partners/third-party

providers upon which

your information

supply chain

depends?

STA Do you mandate

X

-09. annual information

1 security reviews and

audits of your third

party providers to

ensure that all

agreed upon security

requirements are

met?

STA Do you have external X -09. third party services 2 conduct vulnerability
scans and periodic penetration tests on your applications and networks?

3  CSA CAIQ 
 ISO 27001    
 ISO 27001    
 ISO 27001    
    

3.16 TVM 

  





  

 01 (2020-09-30)

 © 

70

 CSA CCM CSA CAIQ v3.1

TV Do you have anti-

X

M-0 malware programs

1.1 that support or

connect to your

cloud service

offerings installed on

all of your IT

infrastructure

network and systems

components?

TV Do you ensure that X M-0 security threat 1.2 detection systems
using signatures, lists, or behavioral patterns are updated across all infrastructure components as prescribed by industry best practices?

TV Do you conduct

X

M-0 network-layer

2.1 vulnerability scans

regularly as

prescribed by

industry best

practices?

TV Do you conduct

X

M-0 application-layer

2.2 vulnerability scans

regularly as

prescribed by

industry best

practices?

TV Do you conduct local X M-0 operating system2.3 layer vulnerability
scans regularly as prescribed by industry best practices?

TV Will you make the

X

M-0 results of

2.4 vulnerability scans

available to tenants

at their request?

3  CSA CAIQ 
  IT IDS/IPS 
    
PCI DSS     
PCI DSS     
PCI DSS     
 

 01 (2020-09-30)

 © 

71

 CSA CCM CSA CAIQ v3.1

TV Do you have a

X

M-0 capability to patch

2.5 vulnerabilities across

all of your computing

devices, applications,

and systems?

TV Do you inform M-0 customers (tenant) 2.6 of policies and
procedures and identified weaknesses if customer (tenant) data is used as part the service and/or customer (tenant) has some shared responsibility over implementation of control?

TV Is mobile code M-0 authorized before its 3.1 installation and use,
and the code configuration checked, to ensure that the authorized mobile code operates according to a clearly defined security policy?

TV Is all unauthorized X M-0 mobile code 3.2 prevented from
executing?

3  CSA CAIQ 
    
X     
X    
   

 01 (2020-09-30)

 © 

72

 CSA CCM CSA CAIQ v3.1

4 

4 
""  
  
  

 01 (2020-09-30)

 © 

73

 CSA CCM CSA CAIQ v3.1

5 

 2020-09-30

5 

 1.0

 

 01 (2020-09-30)

 © 

74

