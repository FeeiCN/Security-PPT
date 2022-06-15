SACC2013
Dell Fluid File System Solutions
Ray Hu Storage Portfolio Business Manager Enterprise Solution Group, Asia Pacific &Japan Region

Agenda

SACC2013

· What's driving the growth of unstructured data? · Traditional file solutions on the market today · Dell Fluid File System ­ what's different? · Examples of FluidFS use cases · Dell FluidFS product portfolio

1

Continued growth of unstructured data is oneSoAfCtCh2e0m13ost critical drivers of storage
Worldwide File ­ Based Versus Block ­ Based Storage Capacity Shipments, 2008 - 2015
IDC Worldwide File ­ Based Storage 2011 ­ 2015 Forecast: Foundation Solutions for Content Delivery, Archiving, and Big Data Dec 2011 ­ Document 231910
2

Is the relentless growth causing you pain?

of

unstructured

file

datSaACC2013

Data silos prevent access to business information

Complexity of data migration, backup, and data recovery

Deploying more storage increases CAPEX and OPEX

Scalability limitations of traditional file systems

3 @Dell_Storage

Storage Marketing

HHoowwddo yoouummaannagaegefilefildeadtaattoadtaoyd? ay?
E...acahndapitpsroliamcihtahtaiosnitss advantages... SACC2013

File servers
· S·imPopoler asncdalability a·ffSoilrodsabolfedata
· S·inSgplreawprlotocol · A· dCdopsetlrypsrwojeliccet nsing
· Disruptive upgrades · Complex
management

Traditional NAS
·· SRimigpidlebtooumndaanraiegse ·· ESnctaelrep-ruispe-ocnlalyss ·· MFuolrtkipliflet ucpognrnaedcetsivity · pCrootsotlcyoslsw licensing

Clustered file systems
·· HCigohmlyplsecxaitlayble ·· GPrreoaptrfieotraHryPC, oil & · gMasis,ssinimgufleaattiounre, sEDA,
etc.

4

One approach: Unify file and block in a single pool
SACC2013

Block

File

File

Block

File

File

Block

Block

Although this approach overcomes some shortcomings, limitations persist
55

...Daenldl'sddeessigignninagrctheitmectinutroe:thsetaFrtluinidgFwSipthlathfoermbesSt ACC2013 features of file servers, traditional NAS, and clustered files...

Traditional NAS Simple Standards Based Enterprise-Class Monolithic

FluidFS Appliance

FluidFS Appliance

ProprietDaisrkyarrays
Disk arrays Disk arrays Disk arrays
Dell FluidFS

6

@Dell_Storage

Clustered File Systems Scalable Complex Proprietary HPC Focused
Storage Marketing

Scale-out architecture for unified file and SACC2013 block storage

CIFS and NFS Clients

Up to 2PB of storage in a single namespace

Share 1 Share 2

Share 3

Share 4

NAS VNoAlSume Vol 1

NAS Pool

NAS VolumNeAS
Vol 2

· Scale-out architecture supports a single namespace across up to four dual-controller appliances

· Capacity expands up to 2PB manageable space so data does not need to be shared or siloed into individual file sets

· Designed with no limit to storage space or file system

FluidFS Dual-Controller · Load-balancing continually optimizes

Appliances

performance across client ports and

controllers

Application Servers

Dell SAN "backend" arrays

File Volume
File Volume

File Volume
Block LUN

Block LUN
Block LUN

Single pool of storage, capacity-on-demand

File Volume

· Non-disruptive capacity and performance scale-out without forklift upgrades
· Linear file OPS and throughput scalability
· No architectural limitations of traditional NAS or file servers
· Single scalable namespace up to 2PB for easy administration
· Shared infrastructure for block and file enables highest efficiencies and cost savings

· Optimized data placement on high performance SSDs and HDDs

7 @Dell_Storage

· Policy-driven post-process dedupe and compreSstsoiorange Marketing

Fluid File System Appliances: Built for High AvailabSiliAtyCC2013
· Purpose-built Dell appliance for Compellent and EqualLogic platforms ­ Two redundant, active-active, hot-swappable controllers per 2U appliance for high availability ­ Midplane between controller pairs with 40Gb bandwidth for cache mirroring
· Integrated backup battery protects cache contents · Redundant, hot-swappable fans and power supplies · Internal hard drive for local boot with flash for configuration backup · Dedicated, redundant interconnect network
Redundant hardware and active-active architecture deliver high availability
without introducing idle resources
8

Efficiencies of unified storage

SACC2013

· Single storage platform

­ Avoids overhead and complexity of separate block and file solutions
­ Lowers TCO

Disks not purchased
Unused allocation
Data Data

· SAN efficiencies extended to NAS
­ Compellent Automated Tiered Storage cuts overall storage costs by up to 80%
­ Single virtualized pool of capacity eliminates the need to carve separate spindles for file
­ Thin Provisioning enables over-allocation of NAS capacity, but only consumes space when data is written
­ Peer scale

· Unified management
­ A single management interface for file and block storage

· All-inclusive software licensing
­ Ensures best TCO for the unified platform

9

Built-in resiliency and data protection

SACC2013

· HA architecture
­ Active/active controller pairs ­ Automatic controller failover and failback ­ No single point of failure ­ All critical components are redundant

· Snapshots and replication

­ Redirect-on-write snapshots

­ Thin volume cloning

­ Multiple online recovery points

­ End user self-service recovery

­ Snapshots are replicated and available on the remote site

· NDMP

· ICAP antivirus

­ Backup based on continuous snapshots ­ Supported by most enterprise backup sw vendors

­ FluidFS can verify the files read from CIFS clients are virus-free

­ Backup streams load-balanced among nodes

10

How can you use FluidFS in your environment?

Let's look at some examples

SACC2013

Applications which take advantage of advanced file system and unified storage · General file share consolidation · Vertical industry-specific file workloads · File-intensive apps · Apps where efficiencies are maximized
when block and file storage are used

File server consolidation

Virtual Desktop

Click on the use case to find out more

Dell FluidFS

Audio
Video Streaming

Verticals: Electronic
Design Automation

Verticals:
Media and
Entertainment

Verticals:
Medical Data Archival

SharePoint Storage
Optimization
11

FluidFS Use Cases:
File Server Consolidation

for

File

Shares

and

Home

DirecStoAriCesC2013

· Easy scale-out of capacity and performance reduces costs and drives efficiencies

File servers

· Benefits of automated tiering extended to NAS from backend SAN storage

File data (CIFS and NFS)

NAS appliances

· Ability to add additional storage on-demand with no downtime
· Centralized management and streamlined backup
12

File Storage
Block Storage
Dell Unified Storage (Compellent/EqualLogic)
· Challenge: 1) Environments with a sprawl of CIFS and NFS file servers and legacy NAS devices; 2) Silos of storage limit access to business information; 3) Complex data migration, backup and management; 4) Limited scalability.
· Solution: File servers and traditional NAS devices are consolidated on a single Dell FluidFS storage platform.

FluidFS Use Cases:
Media and Entertainment

Film production companies

Magazines

SACC2013
TV networks

· A single, scalable file system enables easy, concurrent access to any type of digital asset

Movies Music Photography Movie scripts Posters Movie rendering

Movie streaming

· Accelerated media production processes

File Storage

· Up to 2PB of data in a single volume

Block Storage
Dell Unified Storage (Compellent/EqualLogic)

· Challenge: Digital assets stored on multiple storage systems are

· Cost reductions from increased storage utilization

hard to access and share. The rapidly growing libraries of media files need to serve different distribution channels, media formats and consumption models.

· Solution: Local media storage systems are consolidated onto a

Dell FluidFS storage, giving concurrent access to a single,

scalable file system, accelerating media production processes.

13

FluidFS Use Cases:
Audio/Video Streaming

SACC2013

· Non-disruptive file growth with a scale-out solution
· Single large repository to manage all media assets
· Multiprotocol NFS and CIFS access to files
· A single namespace exposes the same source data to both NAS client protocols.

Internal CIFS clients access files for editing

CIFS Shares

NFS Shares

NAS Pool for File Share

Web servers stream video or audio files
External website delivery via NFS servers

File Storage
Block Storage
Dell Unified Storage (Compellent/EqualLogic)
· Challenge: Large volumes of audio and video files, now on numerous file servers, need to be accessed by internal CIFS clients and shared to external NFS servers for streaming. Access to files is difficult, backup is complex, licensing costs are rising.
· Solution: File servers are consolidated onto a multiprotocol Dell FluidFS storage, allowing for easy access by clients.

14

FluidFS Use Cases:
Medical Data Archival

SACC2013

· Scale-out performance for medical record storage and retrieval
· Fast retrieval of records by physicians
· Single namespace up to 2PB simplifies management
· HA architecture guarantees business continuity
· Multi-protocol access for NFS and CIFS clients

Clients with PACS Software

MRI, X-Ray systems

Records being retrieved by physicians

Medical records are written to the FluidFS appliance over 10GbE
NAS Pool for File Shares

File Storage

Block Storage
Dell Unified Storage (Compellent/EqualLogic)

Long term archiving to the cloud

· Challenge: Primary PACS cache and long-term image archiving for a hospital radiology department overflow with digital patient records. Writing new records takes time, resulting in slow retrieval by doctors and system downtimes.
· Solution: Servers running PACS software write millions of patient records at high speeds into the Dell FluidFS storage. Records are now easily and reliably accessible to doctors from their workstations.

15

FluidFS Use Cases:
Virtual Desktop

SACC2013

· Multiprotocol CIFS and NFS support enables file access from within individual desktop VMs
· Centralized granular data protection
· Single shared pool of storage resources to manage
· Better VM performance Improves end-user productivity
16

vSphere Host

Thin Clients

Block for VM Storage (iSCSI or FC)
Gold Master Images and Clones
Block Storage

File for User Data (CIFS or NFS)
NAS Pool for File Share
CIFS User Data (Virtual Volumes)
File Storage

Dell Unified Storage (Compellent/EqualLogic)

· Challenge: When user data is stored alongside OS and apps, the desktop VM size grows over time leading to additional capacity requirements, slow data access, high latency, inefficient backup and a degraded user experience.
· Solution: User data is separated from desktop VMs by placing VMs on block storage for high performance and user data on file storage for optimal availability and more granular backups. .

In summary
· New technology Implemented across all primary storage platforms
· Shared capabilities across the portfolio
· Innovations enable a new customer experience with
· Scale out designs without rigid architecture limitations
· Maximized operational efficiencies
· Built-in resilience
· 100% Dell IP
17

SACC2013

