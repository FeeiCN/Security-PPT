Dig Deeper: Acquisition and Analysis of AWS Cloud Data
//Trey Amick & Curtis Mutter

Trey Amick
Manager, Forensic Consultants Magnet Forensics, Inc. trey.amick@magnetforensics.com

@amick_trey

Supervisor Sammy

· Photographer: Sr. Staff Writer Fstoppers.com

· Curtis Mutter
· Senior Product Manager Magnet AXIOM Cloud and Mobile curtis.mutter@magnetforensics.com
· Joined Magnet in 2018 · 10+ years of Product Management
experience across a variety of industries including Enterprise content management, and professional A/V

Agenda
Using Cloud Data in modern investigations
AWS: S3 / EC2
Introduction to Magnet AXIOM Cyber
Automation & Orchestration in the Cloud

Cyber Crime Trends
· Cyber attacks are the fastest growing crime. They're increasing in frequency, size, complexity, and cost to the victim organization.

1 in 5 organizations lose more $1 million a year to
fraud

70%
People who are bullied end up leaving their
employer. Costs include retraining, and potential Wrongful Termination
lawsuits

= +80% $3.92M

IP can be +80% of a company's total value and it's at risk from outsiders
and insiders alike

Average cost of a data breach in 2019
An average of +25k records are compromised
at a cost of $150 each

Cloud Market Share
· Amazon Web Services and Microsoft Azure make up more than 50% of the Cloud IaaS / PaaS market
· Revenue set to far exceed $100 billion in 2020
· The 2019 market was more than double the size of 2017

Amazon Web Services (AWS)

AWS Infrastructure Amazon has a vast and always growing infrastructure that is available around the world.
AWS Regions - a physical location around the world where data centers are clustered. AWS Availability Zones ­ a group of logical data centers. Each AWS Region consists of multiple, isolated, and physically separate AZ's within a geographic area. Edge Locations - where end users access services located at AWS, the cloud computing division of US-headquartered Amazon. They are located in most of the major cities around the world and are specifically used by CloudFront (CDN) to distribute content to end users to reduce latency.

AWS Security Amazon offers a large variety of security focused services that allow all practitioners to
ensure that whatever they create in AWS will be secure.
AWS provides services that help protect the data, accounts, and workloads created by its users, from unauthorized access. AWS data protection services provide encryption and key management and threat detection that continuously monitors and protects accounts and workloads.

AWS Shared Responsibility Model
Customer responsibility "Security in the Cloud"
AWS responsibility "Security of the Cloud"

AWS S3 Bucket Overview
· Amazon Simple Storage Service (Amazon S3) is an object storage service that offers industryleading scalability, data availability, security, and performance.
· Amazon S3 offers a range of storage classes designed for different use cases. These include:
· S3 Standard for general-purpose storage of frequently accessed data
· S3 Intelligent-Tiering for data with unknown or changing access patterns
· S3 Standard-Infrequent Access and S3 One Zone-Infrequent Access for long-lived, but less frequently accessed data
· Amazon S3 Glacier and Amazon S3 Glacier Deep Archive for long-term archive and digital preservation.
· Every S3 Storage Class supports a specific data access level at corresponding costs.
· https://aws.amazon.com/s3/storage-classes/?nc=sn&loc=3

AWS EC2 Instance Overview
· Amazon Elastic Compute Cloud (Amazon EC2) is a web service that provides secure, resizable compute capacity in the cloud.
· General purpose instances provide a balance of compute, memory and networking resources, and can be used for a variety of diverse workloads. These instances are ideal for applications that use these resources in equal proportions such as web servers and code repositories.
· Compute Optimized instances are ideal for compute bound applications that benefit from high performance processors.
· Memory optimized instances are designed to deliver fast performance for workloads that process large data sets in memory.
· Storage optimized instances are designed for workloads that require high, sequential read and write access to very large data sets on local storage.

Simplify your remote forensic investigations by focusing on the
evidence that matters.
AXIOM Cyber is a digital forensics solution that allows organizations to perform remote acquisitions while collecting and analyzing evidence from cloud services, computers, and mobile devices.

Advanced Cloud Collection
· Leverage admin credentials to acquire from Office 365, G Suite, and Box.com
· Collect data from corporate cloud services like AWS S3 and EC2,
· Investigate top corporate communication tools like MS Teams, and Slack
· Acquire from social media and other cloud services with user credentials

Covert Remote Collection
· Remotely collect individual files, targeted locations, or the full disk, and memory from Windows devices
· Remotely collect files from Macs including those with T2 security chips and SIP enabled
· Automatically reconnect to target endpoint if it goes offline and resume collections from where it left off
· Configurable, on-demand remote agent

MAGNET AXIOM CYBER

AXIOM Cyber supports multiple evidence sources including the analysis of computer and mobile devices, remote collection of systems, and Cloud based sources.

MAGNET AXIOM CYBER

Cloud evidence can be acquired directly from service providers or loaded as evidence packages downloaded externally using services such as Google Takeout or Facebook's Download My Data Feature

MAGNET AXIOM CYBER

AXIOM Cyber supports many different platforms for live acquisition including: · Amazon Web Services · Microsoft Azure · O365 · MS Teams · Box.com · Dropbox · Google Gsuite · ...and more

MAGNET AXIOM CYBER S3 ACQUISITION

S3 buckets are presented similar to other file storage applications.

MAGNET AXIOM CYBER S3 ACQUISITION

AXIOM will provide the examiner to choose the bucket they wish to acquire.
The examiner can explore the contents of the buckets and only acquire the files of interest as well.

MAGNET AXIOM CYBER EC2 ACQUISITION

AWS users who have been granted appropriate permissions within their environment, can acquire both virtual machine snapshots from EC2, as well as the contents of S3 buckets.
For information on configuring AWS to support acquisition, see the following articles from the Magnet Forensics Knowledge Center
Find AWS authentication details to acquire AWS S3 buckets or EC2 instances
Prerequisites for acquiring an EC2 instance
To learn more about AWS Access and Identity Management see https://aws.amazon.com/iam/

MAGNET AXIOM CYBER EC2 ACQUISITION

To acquire EC2 instances, users can search for the end point system they wish to acquire.
If available, the user can select the image for download.

MAGNET AXIOM CYBER EC2 ACQUISITION

AWS requires that the image be copied to a S3 bucket prior to acquisition.
Users can choose to acquire the image as a VHD or VMDK image.
Users can optionally remove the image upon completion of the acquisition to reduce storage costs.

MAGNET AXIOM CYBER EC2 AND S3 CONSIDERATIONS
· S3 Acquisition supports the following bucket types for acquisition. · S3 Standard for general-purpose storage of frequently accessed data · S3 Intelligent-Tiering for data with unknown or changing access patterns · S3 Standard-Infrequent Access and S3 One Zone-Infrequent Access for longlived, but less frequently accessed data · S3 Glacier and S3 Glacier Deep Archive are not currently supported
· EC2 acquisition requires at least one accessible S3 bucket, which will be used to store the image snapshot prior to downloading.
· AXIOM Process supports acquiring EC2 instances for Amazon Linux and Ubuntu Server SSD volume types
· For additional limitations on supported acquisition types see https://docs.aws.amazon.com/vm-import/latest/userguide/vmexport.html
· There are roles in IAM that allow other AWS resources to be utilized in conjunction with other AWS resources. This can include collection of data from S3 or EC2 via S3. One such role is the ExportEC2ToS3Role. Associated with this role is a policy called AmazonS3FullAccess. This policy allows access to S3. For more info on IAM see: https://aws.amazon.com/iam/

MAGNET AXIOM CYBER AZURE ACQUISITION

Magnet AXIOM Cyber has recently added the ability to acquire virtual machine images from Microsoft Azure.

MAGNET AXIOM CYBER AZURE ACQUISITION

For information on configuring access to Azure, see the following Knowledge Base Article:
Find Azure authentication details

MAGNET AXIOM CYBER AZURE ACQUISITION

Once authenticated, the user can choose from the available instances for acquisition.
Note that only one image can be acquired at a time, however multiple evidence items can be added to the same case file by adding additional evidence.

MAGNET AXIOM CYBER AZURE ACQUISITION - CONSIDERATIONS
· Available VMs can be selected for download. · Only one image can be acquired at a time. · Users can choose to discard the image
snapshot once it has been downloaded · The image will be downloaded as a Virtual
Hard Drive (VHD) · Artifacts will be carved after acquisition · Only VMs using Azure Managed Disks can be
acquired (for more information see link)

MAGNET AXIOM CYBER ­ ANALYSIS
Acquired evidence will be loaded into the case file and can be combined with evidence from any other service.

MAGNET AXIOM CYBER ­ ANALYSIS
Magnet AXIOM Cyber is an artifact based forensic platform providing examiners with instant access to critical evidence including documents, media, and operating system artifacts.

MAGNET AXIOM CYBER ­ ANALYSIS
Magnet AXIOM Cyber also includes a full file system analysis tool for browsing or searching the file system of acquired virtual machines.
Evidence can easily be tagged and exported as a part of a report in multiple formats.

Loading Log Files into AXIOM Cyber
· Magnet Free Tools · Magnet Custom Artifact Generator (MCAG)
· Load CSV / delimited files or SQLite DB of logs into MCAG
· Customize Fields · Open AXIOM Cyber
Process!

Automation & Orchestration with AWS

Improve service to your agency by scaling up existing resources and processes with the power of orchestration and automation.
Magnet AUTOMATE is an orchestration and automation platform that uses your lab's existing hardware and software tools to create standardized workflows, to image and process data without examiner intervention.

Simplified Workflows
Consistent and easy-to-use

· Visual workflows designed using an easy drag-and-drop interface.
· Consistent workflows ensure the right workflow is used for each investigation.

Parallel Processing
Get more with existing hardware
Orchestration Workflow Design Task Allocation
AUTOMATE Dashboard

· Leverage the full power of your IT investments by processing cases using two or more workstations.
· Utilize assets on-prem, virtual, cloud or hybrid environments.

Watch Folders
AUTOMATE 2.2
Accelerate mobile investigations with AUTOMATE · Integrate any acquisition tool within workflows,
including mobile, even if they don't have a command line interface · Cases seamlessly flow from post-image acquisition through to processing with no downtime, improving the efficiency of computer and mobile workflows.

Thank you!
Questions?
trey.amick@magnetforensics.com curtis.mutter@MagnetForensics.com http://www.magnetforensics.com

