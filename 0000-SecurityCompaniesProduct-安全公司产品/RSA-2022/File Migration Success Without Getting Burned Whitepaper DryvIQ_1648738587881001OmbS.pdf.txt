7 BEST PRACTICES
File Migration Success Without Getting Burned
1

Take our 7 steps to migration success
As organizations migrate content to cloud-sharing services, it is important to understand that there are many factors that can cause a lot of pain if not thoroughly considered. In our experience completing incredibly complex file migrations for some of the world's largest enterprises, our team has discovered seven best practices that organizations of any size should employ:
1. Set appropriate expectations 2. Assess the data prior to migration 3. Understand the business value of your content 4. Analyze your IT environment 5. Determine your migration approach 6. Build your migration project plan 7. Identify and prepare for common risk
We'll take a deep dive into the importance of setting appropriate expectations for your migration project; how to analyze, understand and prioritize your data; and how to identify and mitigate risks that might burn you along the way.
File Migration Success Without Getting Burned: 7 Best Practices
2

STEP 1 SET APPROPRIATE EXPECTATIONS
A safely executed migration begins with the establishment of goals and expected outcomes for the project. This first step will guide the entire project plan, enabling organizations to identify risky moves that could lead to a major fire drill.
As part of this process, there are several questions that organizations must ask themselves:
How will users be impacted? What is our change management plan and how can we mitigate disruption? Which aspects of our data must be preserved in the move? Ownership, permissions, folder hierarchy, etc. And, most importantly, how long will the migration take, and how much will it cost?
In addition to the top-level questions, there are further technical considerations particularly regarding throughput - that must be acknowledged at the outset of the project, as they can greatly impact the duration and cost of the migration.

The Corpus Profile
The corpus refers to the data set to be migrated. Keep in mind that more, smaller files will always take longer than fewer, larger files.
Rate Limiting
Occasionally, the source platform will implement rate-limiting when resources are limited and significant throttling must occur to keep the environment responsive for all tenants. This could impact the rate that files are accepted by the source platform, slowing down the project.
Database Performance
Migration is highly transactional, so you need a strong input/output subsystem in your database.
Network Performance
Legacy document retrieval, external binary storage, and uploading to Azure/Office365 are all affected by network performance. Cloud-tocloud migrations are usually faster than on-prem to cloud, for example.

File Migration Success Without Getting Burned: 7 Best Practices

3

STEP 2 ASSESS YOUR DATA
Data assessment can feel overwhelming, usually because organizations have so much of it. But this process can be separated into more manageable pieces. Start by gathering your metrics and then analyze your corpus profile.

GATHER
total storage size for all content a total number of files average versions count average file size record-only (list) data row count

DISCOVER
embedded links permissions sharing collaboration details records management policies content-disposition policies

ANALYZE
content by business unit existing file and folder taxonomy topology breakdown

File Migration Success Without Getting Burned: 7 Best Practices

4

STEP 3 UNDERSTAND BUSINESS VALUE
Once you understand what you have, you can start to categorize it based on its business value. Knowing the value of the content involved in the migration ultimately enables you to prioritize and figure out which files truly need to be moved, which can be archived, and which should be purged entirely, resulting in a more cost-effective and efficient migration process. Use this process to put out any sparks that may lead to an expensive or risky migration.

COLLABORATION DATA
SharePoint Team Site / Document Libraries business unit file shares legacy platform business unit storage group-level collaboration / declared records

USER DATA
MySites OneDrive for Business, "U" drives individual cloud storage accounts personal or temporary collaboration

File Migration Success Without Getting Burned: 7 Best Practices

TRANSACTION DATA
often integrated with a business process or automation often long-term archive / rarely accessed content
5

STEP 4 ANALYZE YOUR IT ENVIRONMENT
Knowing the limitations of your business's IT environment is essential when planning your migration. Migration expectations are highly dependent on the business's technical capabilities. For example, lower bandwidth allocation will result in a slower migration. Here are some things to check for within your particular IT environment:

Source & Destination Platforms
Disk input/output limitations, API limitations or rate-limiting practices, network/internet bandwidth, or server/service resources available (affecting end users)
Migration Resources
Network/internet bandwidth, scalable machine resources, SQL Disk input/output, processing server CPU & RAM
Elasticity
Overall ability to scale up/down resources based on the migration project phase

File Migration Success Without Getting Burned: 7 Best Practices

6

STEP 5 CHOOSE MIGRATION APPROACH
There are two common ways to approach a migration:
 Grouped Waves or Phases: an approach that divides up one large migration into smaller, manageable migrations. This approach may make sense depending on whether a school is unable to dedicate a large chunk of time to the migration.
 Big Bang: a migration approach that organizations use to do a migration all at once. This may include shutting down operations for a period of time, but sometimes the investment in time to do the migration more quickly makes sense.
Remember that the features and functionality of your selected migration tool can make a world of difference here. An integral component for a disruption-free migration is "continuous copy" one-way synchronization of the source and destination platforms, to copy the delta in near-real-time. This significantly impacts the migration approach as well as cut-over time and any required change management communication.
Let's break down the pros and cons of each of the above migration approaches:

GROUPED WAVES

Pros
Easier change management for
smaller groups
Works well when departments
operate in isolated collaboration
Reduced impact on IT resources during cut-over

Cons
Can have a significant impact on collaboration
across departments
More phases require more spin up/down of operations, resulting in
higher costs
Slower cutover process can lead to increased cost while operating on
two platforms

BIG BANG

Pros

Cons

Smoother cut-over when collaboration is high
Requires just a single spin-up/spin-down operation, yielding a lower migration cost
Faster cut-over process can lead to reduced costs

Change management happens at once
Can result in a significant impact
on IT resources during cut-over
Requires significant hardware resources
to process rapid cut-over

File Migration Success Without Getting Burned: 7 Best Practices

7

STEP 6 BUILD THE MIGRATION PLAN
The migration plan defines all of the processes, timing, resources, and technical configuration necessary to execute the migration. At a minimum, it should include:

The migration approach and wave/phase order if
necessary

Testing and turning processes

Execution management processes

Exception remediation plan

Change management plan

Project timeline & milestones for all of the above

File Migration Success Without Getting Burned: 7 Best Practices

8

STEP 7 IDENTIFY THE RISKS

Even the best-laid plans often go awry. It's important to understand that all large-scale cloud migration projects come with risks.
But there are a few things that you can keep an eye out for to ensure that you've got the ability to put out any fires that may arise.
Here are some of the most common hang-ups we see once a migration gets underway:

Collaboration interruption (particularly when using a phased/wave approach)

Conflicts with externally shared content

Failure to minimize cut-over duration

Automated processing dependencies

Communication and acceptance criteria

Defining success with "Am I done yet?" when content
is constantly changing

File Migration Success Without Getting Burned: 7 Best Practices
9

How Indiana University Migrated to Microsoft for Flexibility and Cost Savings

Read Full Story

The Challenge
Indiana University has 140,000 users and 3PB of data in its multifaceted environment. Their cloud storage provider, Box, announced a significant cost increase so the decision was made to move to Microsoft 365 to save money. The IT team then
needed to figure out how to make this large, complex migration happen--and do it quickly to
avoid renewal costs.

The Solution
The University IT team looked at migration tools and selected Dryv for its scale and flexibility in handling complex migrations. Some of the key
functionality that impressed them was: Out-of-the-box connectors for major cloud and ECM platforms Ability to translate Box user permissions Ability to migrate Box Notes

The Results

Migration completed on time and on budget

Minimal to no user impact thanks to a temporary sync

Clear ROI - migration cost was less than subscription and
savings would be seen into future

"My advice to other institutions planning a migration is it shouldn't be done lightly, and it won't be smooth or painless. It's like moving houses-- you're going to discover some junk and bad practices. So start thinking about it as if you were to physically move. And hire a good mover."
Dan Calarco, Chair of Indiana University Migration Taskforce

File Migration Success Without Getting Burned: 7 Best Practices

10

READY TO GET STARTED?
Migrations are most effective when customized to an organization's particular needs, expectations, and limitations. By planning ahead and implementing these seven best practices, you can avoid getting burned along your way to a new platform.

Dryv is an enterprise content integration and orchestration platform that empowers organizations with enhanced business and IT agility--rapidly migrating files across your network of storage repositories at incredible speed and scale.
The platform enables organizations to intelligently analyze, move, copy, or synchronize content across all existing systems--no matter where it resides.

See Dryv in Action

File Migration Success Without Getting Burned: 7 Best Practices

11

How Dyno Nobel Migrated to Microsoft with Zero User-Impact

Read Full Story

The Challenge

The Solution

Dyno Nobel is a global leader in commercial explosives technology. The nature of their work means they have very distant, remote sites. IT wanted to move their environment to the Microsoft cloud to solve latency issues at remote sites. They needed to move 10 TB of data from more than 45 global sites and 3,000 network home drives continually and
carefully to not disrupt users in the process.

Dyno Nobel wanted a migration and synchronization tool that could keep users online and data secure during migration. Dryv was selected for:
Its ability to throttle upload speeds and schedule synchronization jobs to run after hours To allow users to access content during the move The ability to know where files were during the process

The Results

Migration was completely transparent to end-users

Successfully managed low bandwidth issues in remote locations

Employee productivity improved with better access in
remote locations

"Dryv was the solution that made the migration to Microsoft 365 happen. And it was almost entirely transparent to our end users. They were able to keep working throughout the entire process. We kept their data safe and secure."
Chris Pack, Enterprise Infrastructure Lead, Dyno Nobel

File Migration Success Without Getting Burned: 7 Best Practices

12

How AstraZeneca Moved 100 File Shares to Microsoft

Read Full Story

The Challenge
AstraZeneca is a global biopharmaceutical company operating in more than 100 countries. IT wanted to improve access for its researchers to their data and
that meant migrating over 100 on-premise document systems used by more than 70,000 employees to Microsoft 365. And they needed to do it without interrupting business operations.

The Solution
The AstraZeneca IT team wanted one migration tool to handle the entire project and DryvIQ fit the bill. The team was impressed by Dryv's ability to: Move their highly-valued metadata Provide an audit trail and key reports for regulatory compliance Be very user-friendly and simple to use

The Results

Migration was fully automated and done rapidly

No disruption to business operations

The consolidated infrastructure has improved access and researcher productivity

"Our challenge today has been to get content from on-premises to the cloud. But that's just part of our journey. We're always looking to simplify and improve our ways of working. And we see Dryv as a critical tool to enable that vision."
Ben Leadbeater, IT Project Manager, AstraZeneca

File Migration Success Without Getting Burned: 7 Best Practices

13

How JDA Software Migrated to Microsoft in 60 days

Read Full Story

The Challenge
JDA Software provides supply chain planning and execution software to 4,000 customers worldwide. Their product was in the cloud, but on-premise file storage for internal users was doubling SAN storage every three years. They also had some segmented
users in the cloud. They decided to consolidate everything to Microsoft 365 and had 60 days to do
it to manage costs.

The Solution
The IT team started with a popular migration tool, but had several failures with throughput and knew
they would not make their deadline. They turned to DryvIQ for:
Quick installation and easy to use Rapid file transfer--6x faster than other tools Incredible accuracy with versions, properties, and permissions

The Results

Made up time from failed attempts and finished migration a
week early

No dropped connections and never exceeded bandwidth
limitations

Improved employee collaboration and shortened time-to-market for
product development

"Dryv was bulletproof. We were able to catch up to our deadline, and actually finish our migration a week ahead of schedule. I don't know what DryvIQ does behind the scenes, but it certainly works."
Mark Fling, VP of Infrastructure and Operations, JDA Software

File Migration Success Without Getting Burned: 7 Best Practices

14

