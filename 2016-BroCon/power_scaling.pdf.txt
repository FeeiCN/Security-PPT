Click to edit Master title style
SCALING NETWORK MONITORING IN A LARGE ENTERPRISE
BroCon 2016 ­ Austin, TX

Click to edit MasteWr thitoleasmtylIe?
I work for Amazon's Worldwide Consumer Information Security group

WhaCtliacrketwo eedgiotinMgatsotetraltkitalebsotuytle?
How we scaled our network monitoring solution while the network is continuously growing

ClickWtohyediot Mweasetveerntidtloe tshtyisle?
Understanding what is occurring on our corporate network is important to us

Click to editInMtahsetebretgiitnlenisntygl...e
http://spaceflight.nasa.gov/gallery/images/station/crew-7/html/iss007e10807.html

ClicHkotwo deodiwt Me asptperrotaitclhe tshtyisle?
We originally decided on using vendor network sensors to get visibility in to what was occurring on our network

Click to edHitoMwawsteersttaitrlteesdtyolfef
· Decided a vendor appliance was an effective way of gathering the data we needed
· We can buy network sensors, right?
· So we bought network sensors and plugged them into our network

Click tVoeendditorMnaesttwerotriktlseesntsyoler
Life was much simpler back then...
· 1Gb/s capable firewalls · SPAN sessions from our routers to vendor
network sensors · Small number of firewalls to monitor · We got layer 3 and layer 4 header
information from this network sensor

CIlticlkootokeeddistoMmaesttheirngtitlilkeestyhlies

Authorized users Vendor appliance

Corporate network

SPAN session Router

Netflow export

Firewall

Netflow collector

The Internet

Click to eWdhitaMt iassateSrPtAitNlepsotyrtle?
http://www.cisco.com/c/en/us/support/docs/switches/catalyst-6500-series-switches/10570-41.html

CWlichketroeeddoitwMeagsotefrrotimtlehsetryele?
· Our network traffic volume kept growing
· Our sensor vendor stopped selling and supporting the platform we were using
· Increased internal maturity about using this data
· Vendor Management platform can't scale
· Driven by API usage by internal customers · Started getting close to the limit of network sensors
the management platform could handle

Click to edit MFuatsutreerptirtoleofsitnygle?
· We have a vendor's system we're starting to push the limits on
· What features do we need?
· Do we continue to buy or do we look at building instead?

Click to edit MastBeur itlidtlevssBtyuley

Build

Buy

Speed of execution 



Control





Vendor support





Logistics





Performance





ClickPutosheidnigt fMorasthteerntietxlet sletyvelel
· My co-workers evaluated various options
· nProbe · Snort · Suricata · Bro

Click to edBirtoMGaesnterattiitolensOtynle
· Ran on a single host · Connected to our router via a 10G fiber link · SPAN session from the router to our Bro host

BroClGiceknteoreatdiiotnMOansetelrotoitklselsikteyl...e

Authorized users Log store

Bro

Corporate network

SPAN session Router

Netflow export

Firewall

The Internet

Netflow collector

TheClcihckaltloenegdeits MofaGsteenretriatlteiosntyOlene
· The Bro host was a single point of failure
· Individual host installs have high operational costs
· High traffic volumes on our SPAN sessions caused our router to reboot
· Will this continue to scale with the growth of our network?

Click to edit MasterStcitoleresctayrlde

Single point of failure? Data collected via
Control
Scalability
Logistics / Install effort

Vendor solution

SPAN
  

Generation One

SPAN
  

Cost per Gb/s

$$$

$

Click to editAMndaswteeratriteledsotnyele!
Or so we thought....

Click to ediAt lMonagstcearmtietleSesthyl...e
· Seth spotted everything in the history field was in upper case
­ Turned out to be a trivial configuration change
· We started off with 32GB of RAM in our hosts and ended up upgrading to 128GB

SCcalilcinkgtotoeidniftinMitaystaenrdtibtleeyostnydle!
· Capture loss levels (as reported by Bro) started rising beyond acceptable levels once we were past 3Gb/s of traffic on our existing hardware platform
· We knew that traffic levels were going to continue to increase so our design needed to evolve as well

InCtrloicdkutcoinegdBitrMo Gasetneerrtaitlieonst1y.l5e
· We migrated to optical taps over SPAN sessions
­ SPAN sessions were good for speed of deployment but not for long term use
· Introduced a method to allow us load balance traffic among physical hosts
­ Similar outcome to the work done by LBNL ­ Eliminated the SPOF with our Bro host
­ https://commons.lbl.gov/download/attachments/120063098/100GIntrusionDetection.pdf

Click to BedroithMoarisztoenrttailtlsecastliynleg
· While we do run Bro in a cluster, it is limited to a single physical host
· We don't want to share state across hosts
· The Bro manager process being a single point of failure isn't all that appealing to us
· Keep the hosts simple and consistent

Click tAoneddhiteMreaistheor wtitiltelsotoykles

Bro host #1 Bro host #2 Bro host #3

Load balancer

Corporate network

Router

Optical tap

Netflow export

Firewall

Netflow collector

The Internet

Click to edit MasterStcitoleresctayrlde

Vendor solution

Single point of 
failure?

Data collected SPAN via

Control



Scalability



Logistics/



Install effort

Cost per Gb/s $$$

Generation One

SPAN

Generation 1.5

Optical taps













$

$

Click to OedpitticMalatsatpesr toivtleersvtieylwe

Router

TX RX

Optical tap

TX 10Gb/s

TX 10Gb/s

RX TX
Firewall

Load balancer

Click to eSdtiiltl Msoamsteewr toitrlketsotydloe
· This was a great step forward, but it was only an incremental improvement
· We can now scale out but it is still time consuming to get individual hosts deployed
· Migrating to an integrated solution would help solve these challenges

Click to edBitrMo Gasetneerrtaitlieonst2y.l0e
· Combined our hosts, load balancers and optical taps into a "cookie cutter" rack design
· We now just order a small, medium or large rack depending expected traffic volumes

Bro GCelnicekratotioendi2t .M0 apshtyesrictaitllelasytoyulet

Network rack

Bro rack

Load balancer

Load balancer

Router

Optical tap

Firewall

Bro host #1 Bro host #2 Bro host #n

ScalingCBlircokGtoeneedriat tMioanst2e.0r tfiotloetpstryinlet
Bro rack #1 Load balancer
Network rack

Load balancer

Router

Optical tap

Firewall

Bro host #1 Bro host #2 Bro host #n Bro rack #2
Load balancer

Bro host #1 Bro host #2 Bro host #n

Click to edit MasterStcitoleresctayrlde

Single point of failure?
Data collected via

Vendor solution

SPAN

Control



 Scalability

 Logistics/
Install effort

Generation One


Generation 1.5


Generation 2


SPAN
  

Optical taps
 


Optical taps
 


$$$ Cost per Gb/s

$

$

$

WhaCt ldicok wtoeeddoitwMitahstaellrtthitisledsattyale?
We stream the logs to our central log store

Click to ediCteMntarsatlelrotgitslteosrtaygle

LearnCflriockmtosoemdiet oMfaosuter rmtistlteaksetysl...e
Our original ETL jobs were based on the Bro 2.3 field order (output in TSV)
­ Bro 2.4 changed the ordering of some of the fields
­ Use JSON if you're loading this data elsewhere
· One line configuration change!

Click to edit MasWteratpitpleinsgtyulpe
http://www.nasa.gov/image-feature/sunset-from-the-international-space-station

Click to edit MaLsetsesrotnitslelesatrynlet
· Scale horizontally and not vertically · Stateless sensors · Decouple dependencies · Plan up-front · Lab testing is never overrated · Get experts on-site to validate · Document wins · Know your customers

Click to edit MasteTrhtaitnleksstoyl...e
Industry peers
­ Thanks to LBNL, Mozilla and the others who responded to our queries and everyone who has publicly spoke or documented their install

Click to edit MasteTrhtaitnlek sytoyule!

